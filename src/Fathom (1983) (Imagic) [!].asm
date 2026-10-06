
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
        MVII    #$5387, R0                      ; 5019   02B8 0087 0053
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02F8, R6                      ; 5021   02BE 02F8
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
        MVII    #$5714, R0                      ; 5039   02B8 0014 0057
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
        MVII    #$55FE, R4                      ; 5056   02BC 00FE 0055
        MVII    #$0335, R5                      ; 5059   02BD 0335
L_505B:
        MVI@    R4,     R0                      ; 505B   02A0
        XORR    R2,     R0                      ; 505C   01D0
        MVO@    R0,     R5                      ; 505D   0268
        DECR    R1                              ; 505E   0011
        BNEQ    L_505B                          ; 505F   022C 0005

        MVII    #$017C, R4                      ; 5061   02BC 017C
        MVII    #$0006, R2                      ; 5063   02BA 0006
L_5065:
        MVO@    R0,     R4                      ; 5065   0260
        DECR    R2                              ; 5066   0012
        BNEQ    L_5065                          ; 5067   022C 0003

        EIS                                     ; 5069   0002
L_506A:
        MVI     G_0119, R0                      ; 506A   0280 0119
        TSTR    R0                              ; 506C   0080
        BNEQ    L_506A                          ; 506D   022C 0004

        JSR     R5,     L_5627                  ; 506F   0004 0154 0227
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
        MVII    #$5606, R4                      ; 5091   02BC 0006 0056
        MVII    #$0169, R3                      ; 5094   02BB 0169
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
        CMPI    #$0174, R3                      ; 50B5   037B 0174
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
        MVII    #$0006, R0                      ; 5163   02B8 0006
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
        MVO     R0,     G_0184                  ; 51B7   0240 0184
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

        MVI     G_0184, R1                      ; 51D4   0281 0184
        MVO     R1,     .STIC.BORD              ; 51D6   0241 002C
        MVO     R0,     G_0102                  ; 51D8   0240 0102
L_51DA:
        MVO     R0,     .STIC.VIDEN             ; 51DA   0240 0020
        INCR    R0                              ; 51DC   0008
        MVO     R0,     G_0103                  ; 51DD   0240 0103

        JSR     R5,     L_5353                  ; 51DF   0004 0150 0353

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

        MVII    #$0174, R1                      ; 520F   02B9 0174
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
        MVII    #$55FE, R5                      ; 522C   02BD 00FE 0055
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
        CMPI    #$0006, R1                      ; 527A   0379 0006
        BGT     L_52B0                          ; 527C   020E 0032

        MVI@    R4,     R3                      ; 527E   02A3
        ANDI    #$000F, R3                      ; 527F   03BB 000F
        PSHR    R4                              ; 5281   0274
        SDBD                                    ; 5282   0001
        MVI@    R5,     R4                      ; 5283   02AC
        PSHR    R5                              ; 5284   0275
        MVII    #$017C, R1                      ; 5285   02B9 017C
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
        JSR     R5,     L_53F6                  ; 52B0   0004 0150 03F6

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
        CMPI    #$543A, R0                      ; 52E2   0378 003A 0054
        BNEQ    L_52EA                          ; 52E5   020C 0003

        JSR     R5,     L_5482                  ; 52E7   0004 0154 0082
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

        JSR     R5,     L_5371                  ; 532C   0004 0150 0371

        B       L_534D                          ; 532F   0200 001C

L_5331:
        PSHR    R2                              ; 5331   0272
        ANDR    R0,     R1                      ; 5332   0181
        PSHR    R0                              ; 5333   0270
        SWAP    R1,     1                       ; 5334   0041
        PSHR    R4                              ; 5335   0274
        XOR@    R4,     R1                      ; 5336   03E1
        MVI@    R4,     R0                      ; 5337   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5338   0004 0114 0268

        SLL     R0,     2                       ; 533B   004C
        ADDR    R0,     R1                      ; 533C   00C1
        PULR    R2                              ; 533D   02B2
        MVO@    R1,     R2                      ; 533E   0251
        SWAP    R1,     1                       ; 533F   0041
        PULR    R0                              ; 5340   02B0
        ANDR    R0,     R1                      ; 5341   0181
        MOVR    R0,     R2                      ; 5342   0082
        COMR    R2                              ; 5343   001A
        PULR    R5                              ; 5344   02B5
        AND@    R3,     R2                      ; 5345   039A
        BMI     L_534A                          ; 5346   020B 0002

        SUBR    R5,     R1                      ; 5348   0129
        ANDR    R0,     R1                      ; 5349   0181
L_534A:
        XORR    R2,     R1                      ; 534A   01D1
        MVO@    R1,     R3                      ; 534B   0259
        MOVR    R5,     R2                      ; 534C   00AA
L_534D:
        INCR    R3                              ; 534D   000B
        PULR    R5                              ; 534E   02B5
        DECR    R5                              ; 534F   0015
        BNEQ    L_5323                          ; 5350   022C 002E
        PULR    R7                              ; 5352   02B7

L_5353:
        MVII    #$0001, R1                      ; 5353   02B9 0001
        INCR    R7                              ; 5355   000F

        CLRR    R1                              ; 5356   01C9
L_5357:
        PSHR    R5                              ; 5357   0275
        MVII    #$0325, R4                      ; 5358   02BC 0325
        CLRR    R5                              ; 535A   01ED
        ADDI    #$0002, R1                      ; 535B   02F9 0002
L_535D:
        MVI@    R4,     R0                      ; 535D   02A0
        MVO@    R0,     R5                      ; 535E   0268
        MVI@    R4,     R0                      ; 535F   02A0
        MVO@    R0,     R5                      ; 5360   0268
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
        DECR    R1                              ; 536D   0011
        BNEQ    L_535D                          ; 536E   022C 0012
        PULR    R7                              ; 5370   02B7

L_5371:
        PSHR    R5                              ; 5371   0275
        PSHR    R0                              ; 5372   0270
        MOVR    R0,     R5                      ; 5373   0085
        DECR    R3                              ; 5374   0013
        MVI@    R3,     R1                      ; 5375   0299
        ANDR    R0,     R1                      ; 5376   0181
        INCR    R3                              ; 5377   000B
        INCR    R4                              ; 5378   000C
        MVI@    R4,     R0                      ; 5379   02A0
        PSHR    R5                              ; 537A   0275

        JSR     R5,     X_EXT_SIGN_LO           ; 537B   0004 0114 0268

        PULR    R5                              ; 537E   02B5
        ADDR    R0,     R1                      ; 537F   00C1
        ANDR    R5,     R1                      ; 5380   01A9
        COMR    R5                              ; 5381   001D
        AND@    R3,     R5                      ; 5382   039D
        XORR    R5,     R1                      ; 5383   01E9
        MVO@    R1,     R3                      ; 5384   0259
        PULR    R0                              ; 5385   02B0
        PULR    R7                              ; 5386   02B7

        PSHR    R5                              ; 5387   0275
        DIS                                     ; 5388   0003

        JSR     R5,     L_53A1                  ; 5389   0004 0150 03A1

        MVII    #$0020, R0                      ; 538C   02B8 0020
        CLRR    R4                              ; 538E   01E4
        MVO     R4,     G_0119                  ; 538F   0244 0119

        JSR     R5,     X_FILL_ZERO             ; 5391   0004 0114 0338
        JSR     R5,     L_53C1                  ; 5394   0004 0150 03C1

        MVII    #$00C0, R0                      ; 5397   02B8 00C0
        MVO     R0,     .ISRVEC.0               ; 5399   0240 0100
        MVII    #$0051, R0                      ; 539B   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 539D   0240 0101
        EIS                                     ; 539F   0002
        PULR    R7                              ; 53A0   02B7

L_53A1:
        PSHR    R5                              ; 53A1   0275
        CLRR    R0                              ; 53A2   01C0
        MVO     R0,     .STIC.HDLY              ; 53A3   0240 0030
        MVO     R0,     .STIC.VDLY              ; 53A5   0240 0031
        SDBD                                    ; 53A7   0001
        MVII    #$55F7, R4                      ; 53A8   02BC 00F7 0055
        MVI@    R4,     R0                      ; 53AB   02A0
        MVO     R0,     G_0105                  ; 53AC   0240 0105
        MVII    #$0021, R1                      ; 53AE   02B9 0021
        TSTR    R0                              ; 53B0   0080
        BEQ     L_53B5                          ; 53B1   0204 0002

        MVO@    R0,     R1                      ; 53B3   0248
        INCR    R7                              ; 53B4   000F

L_53B5:
        MVI@    R1,     R0                      ; 53B5   0288
L_53B6:
        MVII    #$0028, R1                      ; 53B6   02B9 0028
        MVII    #$0005, R0                      ; 53B8   02B8 0005

        JSR     R5,     .EXEC.730               ; 53BA   0004 0114 0330

        MVI@    R4,     R0                      ; 53BD   02A0
        MVO     R0,     .STIC.EDGE              ; 53BE   0240 0032
        PULR    R7                              ; 53C0   02B7

L_53C1:
        PSHR    R5                              ; 53C1   0275
        MVII    #$0006, R0                      ; 53C2   02B8 0006
        MVII    #$02F1, R1                      ; 53C4   02B9 02F1
        SDBD                                    ; 53C6   0001
        MVII    #$6FE6, R4                      ; 53C7   02BC 00E6 006F
        TSTR    R0                              ; 53CA   0080
        BEQ     L_53DB                          ; 53CB   0204 000E

        JSR     R5,     .EXEC.730               ; 53CD   0004 0114 0330

        MVII    #$0006, R0                      ; 53D0   02B8 0006
        MVII    #$015D, R5                      ; 53D2   02BD 015D
L_53D4:
        MVI@    R4,     R1                      ; 53D4   02A1
        MVO@    R1,     R5                      ; 53D5   0269
        MVI@    R4,     R1                      ; 53D6   02A1
        MVO@    R1,     R5                      ; 53D7   0269
        DECR    R0                              ; 53D8   0010
        BNEQ    L_53D4                          ; 53D9   022C 0006

L_53DB:
        SDBD                                    ; 53DB   0001
        MVII    #$6EEA, R4                      ; 53DC   02BC 00EA 006E
        INCR    R7                              ; 53DF   000F

        PSHR    R5                              ; 53E0   0275
L_53E1:
        MVI@    R4,     R5                      ; 53E1   02A5
        SDBD                                    ; 53E2   0001
        ADDI    #$3800, R5                      ; 53E3   02FD 0000 0038
        MVI@    R4,     R0                      ; 53E6   02A0
L_53E7:
        MVI@    R4,     R1                      ; 53E7   02A1
        MOVR    R1,     R2                      ; 53E8   008A
        SWAP    R2,     1                       ; 53E9   0042
        ANDI    #$0003, R2                      ; 53EA   03BA 0003
        ANDI    #$00FF, R1                      ; 53EC   03B9 00FF
L_53EE:
        MVO@    R1,     R5                      ; 53EE   0269
        DECR    R2                              ; 53EF   0012
        BPL     L_53EE                          ; 53F0   0223 0003

        DECR    R0                              ; 53F2   0010
        BNEQ    L_53E7                          ; 53F3   022C 000D
        PULR    R7                              ; 53F5   02B7

L_53F6:
        PSHR    R5                              ; 53F6   0275
        MVII    #$0106, R4                      ; 53F7   02BC 0106
        MVI     G_0104, R2                      ; 53F9   0282 0104
        ANDI    #$0001, R2                      ; 53FB   03BA 0001
        BEQ     L_5401                          ; 53FD   0204 0002

        ADDI    #$0004, R4                      ; 53FF   02FC 0004
L_5401:
        MVI@    R4,     R1                      ; 5401   02A1
        SWAP    R1,     1                       ; 5402   0041
        XOR@    R4,     R1                      ; 5403   03E1
        MVI@    R4,     R0                      ; 5404   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5405   0004 0114 0268

        SLL     R0,     2                       ; 5408   004C
        ADDR    R0,     R1                      ; 5409   00C1
        MOVR    R1,     R0                      ; 540A   0088
        SLL     R2,     1                       ; 540B   004A
        SAR     R0,     2                       ; 540C   006C
        SAR     R0,     2                       ; 540D   006C
        SAR     R0,     2                       ; 540E   006C
        SAR     R0,     2                       ; 540F   006C
        BMI     L_5417                          ; 5410   020B 0005

        CMPI    #$0007, R0                      ; 5412   0378 0007
        BLE     L_5430                          ; 5414   0206 001A
        INCR    R7                              ; 5416   000F

L_5417:
        INCR    R2                              ; 5417   000A
L_5418:
        MVO     R2,     G_010F                  ; 5418   0242 010F
        MVI     .ISRVEC.0,R2                    ; 541A   0282 0100
        MVO     R2,     G_0182                  ; 541C   0242 0182
        MVI     .ISRVEC.1,R2                    ; 541E   0282 0101
        MVO     R2,     G_0183                  ; 5420   0242 0183
        SDBD                                    ; 5422   0001
        MVII    #$003A, R2                      ; 5423   02BA 003A 0000
        MVO     R2,     .ISRVEC.0               ; 5426   0242 0100
        SDBD                                    ; 5428   0001
        MVII    #$0054, R2                      ; 5429   02BA 0054 0000
        MVO     R2,     .ISRVEC.1               ; 542C   0242 0101
        ANDI    #$0007, R0                      ; 542E   03B8 0007
L_5430:
        SUBI    #$0003, R4                      ; 5430   033C 0003
        MOVR    R0,     R2                      ; 5432   0082
        SUB@    R4,     R2                      ; 5433   0322
        DECR    R4                              ; 5434   0014
        MVO@    R0,     R4                      ; 5435   0260
        MVO@    R1,     R4                      ; 5436   0261
        INCR    R4                              ; 5437   000C
        MVO@    R2,     R4                      ; 5438   0262
        PULR    R7                              ; 5439   02B7

        PSHR    R5                              ; 543A   0275
        MVO     R0,     .STIC.VIDEN             ; 543B   0240 0020
        MVI     G_0103, R0                      ; 543D   0280 0103
        TSTR    R0                              ; 543F   0080
        BEQ     L_5443                          ; 5440   0204 0001
        PULR    R7                              ; 5442   02B7

L_5443:
        INCR    R0                              ; 5443   0008
        MVO     R0,     G_0103                  ; 5444   0240 0103
        MVI     G_0106, R0                      ; 5446   0280 0106
        MVO     R0,     .STIC.HDLY              ; 5448   0240 0030
        MVI     G_010A, R0                      ; 544A   0280 010A
        MVO     R0,     .STIC.VDLY              ; 544C   0240 0031
        MVII    #$0008, R5                      ; 544E   02BD 0008
        MVII    #$032D, R4                      ; 5450   02BC 032D
        MVI     G_010F, R2                      ; 5452   0282 010F
        RRC     R2,     2                       ; 5454   0076
        BOV     L_5459                          ; 5455   0202 0002

        SUBR    R5,     R4                      ; 5457   012C
        CLRR    R5                              ; 5458   01ED
L_5459:
        MVI@    R4,     R0                      ; 5459   02A0
        MVO@    R0,     R5                      ; 545A   0268
        MVI@    R4,     R0                      ; 545B   02A0
        MVO@    R0,     R5                      ; 545C   0268
        MVI@    R4,     R0                      ; 545D   02A0
        MVO@    R0,     R5                      ; 545E   0268
        MVI@    R4,     R0                      ; 545F   02A0
        MVO@    R0,     R5                      ; 5460   0268
L_5461:
        MVI@    R4,     R0                      ; 5461   02A0
        MVO@    R0,     R5                      ; 5462   0268
        MVI@    R4,     R0                      ; 5463   02A0
        MVO@    R0,     R5                      ; 5464   0268
        MVI@    R4,     R0                      ; 5465   02A0
        MVO@    R0,     R5                      ; 5466   0268
        MVI@    R4,     R0                      ; 5467   02A0
        MVO@    R0,     R5                      ; 5468   0268
        MVI     G_010F, R2                      ; 5469   0282 010F

        JSR     R5,     L_54A9                  ; 546B   0004 0154 00A9
        JSR     R5,     L_5996                  ; 546E   0004 0158 0196
        JSR     R5,     X_PLAY_NOTE             ; 5471   0004 0118 02BD

        DIS                                     ; 5474   0003
        MVI     G_0182, R0                      ; 5475   0280 0182
        MVO     R0,     .ISRVEC.0               ; 5477   0240 0100
        MVI     G_0183, R0                      ; 5479   0280 0183
        MVO     R0,     .ISRVEC.1               ; 547B   0240 0101
        EIS                                     ; 547D   0002
        CLRR    R0                              ; 547E   01C0
        MVO     R0,     G_0103                  ; 547F   0240 0103
        PULR    R7                              ; 5481   02B7

L_5482:
        PSHR    R5                              ; 5482   0275
        MVII    #$0008, R5                      ; 5483   02BD 0008
        MVII    #$0325, R3                      ; 5485   02BB 0325
        MVII    #$0008, R0                      ; 5487   02B8 0008
        MVI     G_010F, R1                      ; 5489   0281 010F
        RRC     R1,     1                       ; 548B   0071
        BNC     L_548F                          ; 548C   0209 0001

        NEGR    R0                              ; 548E   0020
L_548F:
        MVII    #$00FF, R2                      ; 548F   02BA 00FF
        RRC     R1,     1                       ; 5491   0071
        BNC     L_5497                          ; 5492   0209 0003

        ADDR    R5,     R3                      ; 5494   00EB
        MVII    #$007F, R2                      ; 5495   02BA 007F
L_5497:
        MVI@    R3,     R4                      ; 5497   029C
        TSTR    R4                              ; 5498   00A4
        BPL     L_54A4                          ; 5499   0203 0009

        COMR    R2                              ; 549B   001A
        ANDR    R2,     R4                      ; 549C   0194
        COMR    R2                              ; 549D   001A
        MVI@    R3,     R1                      ; 549E   0299
        ANDR    R2,     R1                      ; 549F   0191
        ADDR    R0,     R1                      ; 54A0   00C1
        ANDR    R2,     R1                      ; 54A1   0191
        XORR    R4,     R1                      ; 54A2   01E1
        MVO@    R1,     R3                      ; 54A3   0259
L_54A4:
        INCR    R3                              ; 54A4   000B
        DECR    R5                              ; 54A5   0015
        BNEQ    L_5497                          ; 54A6   022C 0010
        PULR    R7                              ; 54A8   02B7

L_54A9:
        PSHR    R5                              ; 54A9   0275
        PSHR    R2                              ; 54AA   0272
        RRC     R2,     1                       ; 54AB   0072
        BC      L_54BB                          ; 54AC   0201 000D

        RRC     R2,     1                       ; 54AE   0072
        BC      L_54B6                          ; 54AF   0201 0005

        JSR     R5,     L_54C8                  ; 54B1   0004 0154 00C8

        B       L_54C6                          ; 54B4   0200 0010

L_54B6:
        JSR     R5,     L_54DF                  ; 54B6   0004 0154 00DF

        B       L_54C6                          ; 54B9   0200 000B

L_54BB:
        RRC     R2,     1                       ; 54BB   0072
        BC      L_54C3                          ; 54BC   0201 0005

        JSR     R5,     L_5516                  ; 54BE   0004 0154 0116

        B       L_54C6                          ; 54C1   0200 0003

L_54C3:
        JSR     R5,     L_5529                  ; 54C3   0004 0154 0129

L_54C6:
        PULR    R2                              ; 54C6   02B2
        PULR    R7                              ; 54C7   02B7

L_54C8:
        PSHR    R5                              ; 54C8   0275
        MVII    #$0213, R3                      ; 54C9   02BB 0213
        MVII    #$0212, R2                      ; 54CB   02BA 0212
L_54CD:
        MVII    #$0013, R1                      ; 54CD   02B9 0013
L_54CF:
        MVI@    R2,     R0                      ; 54CF   0290
        MVO@    R0,     R3                      ; 54D0   0258
        DECR    R3                              ; 54D1   0013
        DECR    R2                              ; 54D2   0012
        DECR    R1                              ; 54D3   0011
        BNEQ    L_54CF                          ; 54D4   022C 0006

        ADDI    #$0027, R3                      ; 54D6   02FB 0027
        ADDI    #$0027, R2                      ; 54D8   02FA 0027
        CMPI    #$02F0, R2                      ; 54DA   037A 02F0
        BLT     L_54CD                          ; 54DC   0225 0010
        PULR    R7                              ; 54DE   02B7

L_54DF:
        PSHR    R5                              ; 54DF   0275
        MVII    #$02C8, R4                      ; 54E0   02BC 02C8
        MVII    #$02DC, R5                      ; 54E2   02BD 02DC
        MVII    #$0028, R1                      ; 54E4   02B9 0028
        MVII    #$000B, R2                      ; 54E6   02BA 000B
L_54E8:
        MVI@    R4,     R0                      ; 54E8   02A0
        MVO@    R0,     R5                      ; 54E9   0268
        MVI@    R4,     R0                      ; 54EA   02A0
        MVO@    R0,     R5                      ; 54EB   0268
        MVI@    R4,     R0                      ; 54EC   02A0
        MVO@    R0,     R5                      ; 54ED   0268
        MVI@    R4,     R0                      ; 54EE   02A0
        MVO@    R0,     R5                      ; 54EF   0268
        MVI@    R4,     R0                      ; 54F0   02A0
        MVO@    R0,     R5                      ; 54F1   0268
        MVI@    R4,     R0                      ; 54F2   02A0
        MVO@    R0,     R5                      ; 54F3   0268
        MVI@    R4,     R0                      ; 54F4   02A0
        MVO@    R0,     R5                      ; 54F5   0268
        MVI@    R4,     R0                      ; 54F6   02A0
        MVO@    R0,     R5                      ; 54F7   0268
        MVI@    R4,     R0                      ; 54F8   02A0
        MVO@    R0,     R5                      ; 54F9   0268
        MVI@    R4,     R0                      ; 54FA   02A0
        MVO@    R0,     R5                      ; 54FB   0268
        MVI@    R4,     R0                      ; 54FC   02A0
        MVO@    R0,     R5                      ; 54FD   0268
        MVI@    R4,     R0                      ; 54FE   02A0
        MVO@    R0,     R5                      ; 54FF   0268
        MVI@    R4,     R0                      ; 5500   02A0
        MVO@    R0,     R5                      ; 5501   0268
        MVI@    R4,     R0                      ; 5502   02A0
        MVO@    R0,     R5                      ; 5503   0268
        MVI@    R4,     R0                      ; 5504   02A0
        MVO@    R0,     R5                      ; 5505   0268
        MVI@    R4,     R0                      ; 5506   02A0
        MVO@    R0,     R5                      ; 5507   0268
        MVI@    R4,     R0                      ; 5508   02A0
        MVO@    R0,     R5                      ; 5509   0268
        MVI@    R4,     R0                      ; 550A   02A0
        MVO@    R0,     R5                      ; 550B   0268
        MVI@    R4,     R0                      ; 550C   02A0
        MVO@    R0,     R5                      ; 550D   0268
        MVI@    R4,     R0                      ; 550E   02A0
        MVO@    R0,     R5                      ; 550F   0268
        SUBR    R1,     R4                      ; 5510   010C
        SUBR    R1,     R5                      ; 5511   010D
        DECR    R2                              ; 5512   0012
        BNEQ    L_54E8                          ; 5513   022C 002C
        PULR    R7                              ; 5515   02B7

L_5516:
        PSHR    R5                              ; 5516   0275
        MVII    #$0200, R5                      ; 5517   02BD 0200
        MVII    #$0201, R4                      ; 5519   02BC 0201
L_551B:
        MVII    #$0013, R1                      ; 551B   02B9 0013
L_551D:
        MVI@    R4,     R0                      ; 551D   02A0
        MVO@    R0,     R5                      ; 551E   0268
        DECR    R1                              ; 551F   0011
        BNEQ    L_551D                          ; 5520   022C 0004

        INCR    R4                              ; 5522   000C
        INCR    R5                              ; 5523   000D
        CMPI    #$02DD, R4                      ; 5524   037C 02DD
        BLE     L_551B                          ; 5526   0226 000C
        PULR    R7                              ; 5528   02B7

L_5529:
        PSHR    R5                              ; 5529   0275
        MVII    #$0200, R5                      ; 552A   02BD 0200
        MVII    #$0214, R4                      ; 552C   02BC 0214
        MVII    #$00DC, R1                      ; 552E   02B9 00DC
L_5530:
        MVI@    R4,     R0                      ; 5530   02A0
        MVO@    R0,     R5                      ; 5531   0268
        DECR    R1                              ; 5532   0011
        BNEQ    L_5530                          ; 5533   022C 0004
        PULR    R7                              ; 5535   02B7

        SLL     R1,     1                       ; 5536   0049
        ADDI    #$0126, R1                      ; 5537   02F9 0126
        MVI@    R1,     R0                      ; 5539   0288
        ADDI    #$0010, R1                      ; 553A   02F9 0010
        MVI@    R1,     R2                      ; 553C   028A
        MOVR    R5,     R7                      ; 553D   00AF

L_553E:
        MVII    #$000A, R1                      ; 553E   02B9 000A
        CLRR    R2                              ; 5540   01D2
        INCR    R7                              ; 5541   000F

L_5542:
        CLRR    R1                              ; 5542   01C9
L_5543:
        INCR    R7                              ; 5543   000F

L_5544:
        DECR    R1                              ; 5544   0011
L_5545:
        ADDI    #$0169, R2                      ; 5545   02FA 0169
L_5547:
        MVI@    R2,     R0                      ; 5547   0290
        ANDI    #$007F, R0                      ; 5548   03B8 007F
        XORI    #$0080, R0                      ; 554A   03F8 0080
        MVO@    R0,     R2                      ; 554C   0250
        INCR    R2                              ; 554D   000A
        DECR    R1                              ; 554E   0011
        BPL     L_5547                          ; 554F   0223 0009
        MOVR    R5,     R7                      ; 5551   00AF

        MVII    #$000A, R1                      ; 5552   02B9 000A
        CLRR    R2                              ; 5554   01D2
        INCR    R7                              ; 5555   000F

L_5556:
        CLRR    R1                              ; 5556   01C9
L_5557:
        INCR    R7                              ; 5557   000F

L_5558:
        DECR    R1                              ; 5558   0011
L_5559:
        ADDI    #$0169, R2                      ; 5559   02FA 0169
L_555B:
        MVI@    R2,     R0                      ; 555B   0290
        ANDI    #$007F, R0                      ; 555C   03B8 007F
        MVO@    R0,     R2                      ; 555E   0250
        INCR    R2                              ; 555F   000A
        DECR    R1                              ; 5560   0011
        BPL     L_555B                          ; 5561   0223 0007
        MOVR    R5,     R7                      ; 5563   00AF

L_5564:
        MVII    #$0008, R2                      ; 5564   02BA 0008
        CLRR    R3                              ; 5566   01DB
L_5567:
        DECR    R2                              ; 5567   0012
        INCR    R7                              ; 5568   000F

L_5569:
        CLRR    R2                              ; 5569   01D2
L_556A:
        PSHR    R5                              ; 556A   0275
        PSHR    R3                              ; 556B   0273
        MOVR    R3,     R4                      ; 556C   009C
        MOVR    R3,     R5                      ; 556D   009D
        ADDI    #$0325, R4                      ; 556E   02FC 0325
        ADDI    #$033D, R5                      ; 5570   02FD 033D
L_5572:
        CLRR    R0                              ; 5572   01C0
        MVO@    R0,     R4                      ; 5573   0260
        MVO@    R0,     R5                      ; 5574   0268
        PSHR    R5                              ; 5575   0275
        ADDI    #$000F, R5                      ; 5576   02FD 000F
        MVO@    R0,     R5                      ; 5578   0268
        SUBI    #$034E, R5                      ; 5579   033D 034E
        MOVR    R5,     R3                      ; 557B   00AB

        JSR     R5,     L_559C                  ; 557C   0004 0154 019C

        PULR    R5                              ; 557F   02B5
        DECR    R2                              ; 5580   0012
        BPL     L_5572                          ; 5581   0223 0010

        PULR    R3                              ; 5583   02B3
        PULR    R7                              ; 5584   02B7

        PSHR    R5                              ; 5585   0275
        MOVR    R3,     R2                      ; 5586   009A
        ADDI    #$0325, R2                      ; 5587   02FA 0325
        MVI@    R2,     R0                      ; 5589   0290
        PSHR    R1                              ; 558A   0271
        PSHR    R0                              ; 558B   0270

        JSR     R5,     L_5569                  ; 558C   0004 0154 0169

        PULR    R0                              ; 558F   02B0
        PULR    R1                              ; 5590   02B1
        MOVR    R3,     R2                      ; 5591   009A
        ADDI    #$0174, R2                      ; 5592   02FA 0174
        ADDI    #$0325, R3                      ; 5594   02FB 0325
        MVO@    R3,     R2                      ; 5596   0253
        MVO@    R0,     R3                      ; 5597   0258
        ADDI    #$0018, R3                      ; 5598   02FB 0018
        MVO@    R1,     R3                      ; 559A   0259
        PULR    R7                              ; 559B   02B7

L_559C:
        PSHR    R5                              ; 559C   0275
        MOVR    R3,     R0                      ; 559D   0098

        JSR     R5,     X_POW2                  ; 559E   0004 0114 0345

        COMR    R0                              ; 55A1   0018
        DIS                                     ; 55A2   0003
        AND     G_0117, R0                      ; 55A3   0380 0117
        MVO     R0,     G_0117                  ; 55A5   0240 0117
        EIS                                     ; 55A7   0002
        PULR    R7                              ; 55A8   02B7

L_55A9:
        DECR    R2                              ; 55A9   0012
        INCR    R7                              ; 55AA   000F

L_55AB:
        CLRR    R2                              ; 55AB   01D2
L_55AC:
        PSHR    R5                              ; 55AC   0275
L_55AD:
        MVII    #$0002, R1                      ; 55AD   02B9 0002

        JSR     R5,     L_55D9                  ; 55AF   0004 0154 01D9

        SDBD                                    ; 55B2   0001
        MVI@    R4,     R0                      ; 55B3   02A0
        MVI@    R3,     R1                      ; 55B4   0299
        SDBD                                    ; 55B5   0001
        ANDI    #$0FF8, R1                      ; 55B6   03B9 00F8 000F
        XORR    R0,     R1                      ; 55B9   01C1
        MVO@    R1,     R3                      ; 55BA   0259
        ADDI    #$0008, R3                      ; 55BB   02FB 0008
        MVII    #$0003, R1                      ; 55BD   02B9 0003

        JSR     R5,     L_55D9                  ; 55BF   0004 0154 01D9

        SUBI    #$0355, R3                      ; 55C2   033B 0355
        MVII    #$0174, R1                      ; 55C4   02B9 0174
        ADDR    R3,     R1                      ; 55C6   00D9
        MVO@    R1,     R1                      ; 55C7   0249
        PSHR    R3                              ; 55C8   0273
        SLL     R3,     1                       ; 55C9   004B
        ADDI    #$0126, R3                      ; 55CA   02FB 0126
        MVI@    R4,     R0                      ; 55CC   02A0
        MVO@    R0,     R3                      ; 55CD   0258
        ADDI    #$0010, R3                      ; 55CE   02FB 0010
        MVI@    R4,     R0                      ; 55D0   02A0
        MVO@    R0,     R3                      ; 55D1   0258
        PULR    R3                              ; 55D2   02B3
        ADDI    #$0326, R3                      ; 55D3   02FB 0326
        DECR    R2                              ; 55D5   0012
        BPL     L_55AD                          ; 55D6   0223 002A
        PULR    R7                              ; 55D8   02B7

L_55D9:
        SDBD                                    ; 55D9   0001
        MVI@    R4,     R0                      ; 55DA   02A0
        MVO@    R0,     R3                      ; 55DB   0258
        ADDI    #$0008, R3                      ; 55DC   02FB 0008
        DECR    R1                              ; 55DE   0011
        BNEQ    L_55D9                          ; 55DF   022C 0007
        MOVR    R5,     R7                      ; 55E1   00AF

L_55E2:
        CLRR    R1                              ; 55E2   01C9
        CLRR    R2                              ; 55E3   01D2
        MVO@    R1,     R3                      ; 55E4   0259
        ADDI    #$0010, R3                      ; 55E5   02FB 0010
        MVO@    R2,     R3                      ; 55E7   025A
        MOVR    R5,     R7                      ; 55E8   00AF

L_55E9:
        PSHR    R5                              ; 55E9   0275
        MOVR    R1,     R2                      ; 55EA   008A
        MOVR    R0,     R1                      ; 55EB   0081
        MOVR    R2,     R0                      ; 55EC   0090
        SLR     R0,     1                       ; 55ED   0060

        JSR     R5,     .EXEC.629               ; 55EE   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 55F1   0004 0114 0357

        MOVR    R1,     R2                      ; 55F4   008A
        MOVR    R0,     R1                      ; 55F5   0081
        PULR    R7                              ; 55F6   02B7

        DECLE   $0001,  $0000,  $0000,  $0000   ; 55F7   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0180   ; 55FB   0000 0000 0003 0180
        DECLE   $0190,  $01A0,  $01B0,  $01C0   ; 55FF   0190 01A0 01B0 01C0
        DECLE   $01D0,  $01E0,  $01F0,  $0008   ; 5603   01D0 01E0 01F0 0008
        DECLE   $0084,  $0056,  $0004,  $004F   ; 5607   0084 0056 0004 004F
        DECLE   $005F,  $0001,  $0051,  $0060   ; 560B   005F 0001 0051 0060
        DECLE   $0004,  $0088,  $0060,  $0002   ; 560F   0004 0088 0060 0002
        DECLE   $0043,  $0066,  $0005,  $0099   ; 5613   0043 0066 0005 0099
        DECLE   $0058,  $0002,  $0069,  $0059   ; 5617   0058 0002 0069 0059
        DECLE   $000B,  $0093,  $0056,  $0028   ; 561B   000B 0093 0056 0028
        DECLE   $003E,  $0062,  $0005,  $0089   ; 561F   003E 0062 0005 0089
        DECLE   $0063,  $0001                   ; 5623   0063 0001

        MOVR    R5,     R7                      ; 5625   00AF

        SLR     R3,     1                       ; 5626   0063
L_5627:
        PSHR    R5                              ; 5627   0275
        MVII    #$0064, R0                      ; 5628   02B8 0064
        MVO     R0,     G_0186                  ; 562A   0240 0186
        MVII    #$018B, R5                      ; 562C   02BD 018B
        MVII    #$0001, R0                      ; 562E   02B8 0001
        MVO@    R0,     R5                      ; 5630   0268
        MVO@    R0,     R5                      ; 5631   0268

        JSR     R5,     L_6272                  ; 5632   0004 0160 0272

        MVII    #$0001, R3                      ; 5635   02BB 0001
        MVII    #$0257, R4                      ; 5637   02BC 0257

        JSR     R5,     X_PRINT_R5              ; 5639   0004 0118 007B
        STRING  "FATHOM"                        ; 563C  
        DECLE   $0000                           ; 5642   0000

        MVII    #$02BA, R4                      ; 5643   02BC 02BA

        JSR     R5,     X_PRINT_R5              ; 5645   0004 0118 007B
        STRING  "1983 IMAGIC"                   ; 5648  
        DECLE   $0000                           ; 5653   0000

        SDBD                                    ; 5654   0001
        MVII    #$6FDA, R5                      ; 5655   02BD 00DA 006F
        SDBD                                    ; 5658   0001
        MVI@    R5,     R0                      ; 5659   02A8
        MVO     R0,     .BTAB.B8                ; 565A   0240 02B8

        JSR     R5,     L_567A                  ; 565C   0004 0154 027A

        MVII    #$0046, R0                      ; 565F   02B8 0046
        MVO     R0,     G_018D                  ; 5661   0240 018D
        MVII    #$0002, R0                      ; 5663   02B8 0002
        MVO     R0,     G_0194                  ; 5665   0240 0194
        DIS                                     ; 5667   0003

        JSR     R5,     L_5EFC                  ; 5668   0004 015C 02FC

        EIS                                     ; 566B   0002
        MVII    #$0004, R1                      ; 566C   02B9 0004
        MVII    #$0003, R2                      ; 566E   02BA 0003

        JSR     R5,     L_5544                  ; 5670   0004 0154 0144
        JSR     R5,     L_63B8                  ; 5673   0004 0160 03B8
        JSR     R5,     L_6C09                  ; 5676   0004 016C 0009

        PULR    R7                              ; 5679   02B7

L_567A:
        PSHR    R5                              ; 567A   0275
        SDBD                                    ; 567B   0001
        MVII    #$7400, R0                      ; 567C   02B8 0000 0074
L_567F:
        DECR    R0                              ; 567F   0010
        NOP                                     ; 5680   0034
        BNEQ    L_567F                          ; 5681   022C 0003
        PULR    R7                              ; 5683   02B7

        PSHR    R5                              ; 5684   0275
        MVI     G_0136, R0                      ; 5685   0280 0136

        JSR     R5,     X_EXT_SIGN_LO           ; 5687   0004 0114 0268

        ADDI    #$0005, R0                      ; 568A   02F8 0005
        CMPI    #$0030, R0                      ; 568C   0378 0030
        BGE     L_5692                          ; 568E   020D 0002

        MVO     R0,     G_0136                  ; 5690   0240 0136
L_5692:
        PULR    R7                              ; 5692   02B7

L_5693:
        PSHR    R5                              ; 5693   0275
        MVII    #$0186, R5                      ; 5694   02BD 0186
        SDBD                                    ; 5696   0001
        MVI@    R5,     R0                      ; 5697   02A8
        CMPI    #$0000, R0                      ; 5698   0378 0000
        BGT     L_56D6                          ; 569A   020E 003A

        JSR     R5,     L_553E                  ; 569C   0004 0154 013E
        JSR     R5,     L_5564                  ; 569F   0004 0154 0164
        JSR     R5,     .EXEC.A83               ; 56A2   0004 0118 0283

        CLRR    R0                              ; 56A5   01C0
        MVO     R0,     G_010C                  ; 56A6   0240 010C
        MVO     R0,     G_0108                  ; 56A8   0240 0108
        MVO     R0,     G_0186                  ; 56AA   0240 0186
        MVO     R0,     G_0187                  ; 56AC   0240 0187
        MVII    #$0004, R0                      ; 56AE   02B8 0004
        MVO     R0,     G_0194                  ; 56B0   0240 0194
        MVII    #$003C, R0                      ; 56B2   02B8 003C
        MVO     R0,     G_01C3                  ; 56B4   0240 01C3

        JSR     R5,     L_5D9B                  ; 56B6   0004 015C 019B

        MVII    #$0202, R3                      ; 56B9   02BB 0202
        MVII    #$02B4, R4                      ; 56BB   02BC 02B4

        JSR     R5,     X_PRINT_R5              ; 56BD   0004 0118 007B
        STRING  "     GAME OVER      "          ; 56C0  
        DECLE   $0000                           ; 56D4   0000

        PULR    R7                              ; 56D5   02B7

L_56D6:
        CMPI    #$000A, R0                      ; 56D6   0378 000A
        BGT     L_56DE                          ; 56D8   020E 0004

        MVII    #$0000, R0                      ; 56DA   02B8 0000
        B       L_56F6                          ; 56DC   0200 0018

L_56DE:
        CMPI    #$0014, R0                      ; 56DE   0378 0014
        BGT     L_56E8                          ; 56E0   020E 0006

        SDBD                                    ; 56E2   0001
        MVII    #$1003, R0                      ; 56E3   02B8 0003 0010
        B       L_56F6                          ; 56E6   0200 000E

L_56E8:
        MVI     G_0194, R1                      ; 56E8   0281 0194
        CMPI    #$0001, R1                      ; 56EA   0379 0001
        BNEQ    L_56F2                          ; 56EC   020C 0004

        MVII    #$0003, R0                      ; 56EE   02B8 0003
        B       L_56F6                          ; 56F0   0200 0004

L_56F2:
        SDBD                                    ; 56F2   0001
        MVII    #$1000, R0                      ; 56F3   02B8 0000 0010
L_56F6:
        CLRR    R3                              ; 56F6   01DB
        MVI     G_0194, R1                      ; 56F7   0281 0194
        CMPI    #$0001, R1                      ; 56F9   0379 0001
        BNEQ    L_56FF                          ; 56FB   020C 0002

        MVII    #$0002, R3                      ; 56FD   02BB 0002
L_56FF:
        ADDI    #$0335, R3                      ; 56FF   02FB 0335
        MVI@    R3,     R1                      ; 5701   0299
        SDBD                                    ; 5702   0001
        MVII    #$1007, R2                      ; 5703   02BA 0007 0010
        COMR    R2                              ; 5706   001A
        ANDR    R2,     R1                      ; 5707   0191
        ADDR    R0,     R1                      ; 5708   00C1
        MVO@    R1,     R3                      ; 5709   0259
        PULR    R7                              ; 570A   02B7

L_570B:
        MVI     G_01C3, R0                      ; 570B   0280 01C3
        TSTR    R0                              ; 570D   0080
        BNEQ    L_5713                          ; 570E   020C 0003
        J       X_RESET                         ; 5710   0004 0310 0000
L_5713:
        MOVR    R5,     R7                      ; 5713   00AF

        DECLE   $001E,  $0057,  $0053,  $0057   ; 5714   001E 0057 0053 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5718   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 571C   0000 0000

        PSHR    R5                              ; 571E   0275
        MVI     G_0194, R1                      ; 571F   0281 0194
        TSTR    R0                              ; 5721   0080
        BMI     L_5737                          ; 5722   020B 0013

        CMPI    #$0001, R1                      ; 5724   0379 0001
        BNEQ    L_572B                          ; 5726   020C 0003

        JSR     R5,     L_5823                  ; 5728   0004 0158 0023

L_572B:
        CMPI    #$0002, R1                      ; 572B   0379 0002
        BEQ     L_5733                          ; 572D   0204 0004

        CMPI    #$0003, R1                      ; 572F   0379 0003
        BNEQ    L_574B                          ; 5731   020C 0018

L_5733:
        JSR     R5,     L_578D                  ; 5733   0004 0154 038D

        PULR    R7                              ; 5736   02B7

L_5737:
        CMPI    #$0001, R1                      ; 5737   0379 0001
        BNEQ    L_574B                          ; 5739   020C 0010

        MVII    #$012A, R3                      ; 573B   02BB 012A

        JSR     R5,     L_55E2                  ; 573D   0004 0154 01E2

        CLRR    R0                              ; 5740   01C0
        MVO     R0,     G_0196                  ; 5741   0240 0196
        MVO     R0,     G_010C                  ; 5743   0240 010C
        MVII    #$0004, R2                      ; 5745   02BA 0004

        JSR     R5,     L_5542                  ; 5747   0004 0154 0142

        PULR    R7                              ; 574A   02B7

L_574B:
        CMPI    #$0004, R1                      ; 574B   0379 0004
        BNEQ    L_5752                          ; 574D   020C 0003

        JSR     R5,     L_570B                  ; 574F   0004 0154 030B

L_5752:
        PULR    R7                              ; 5752   02B7

        PSHR    R5                              ; 5753   0275
        MVI     G_0194, R1                      ; 5754   0281 0194
        CMPI    #$0004, R1                      ; 5756   0379 0004
        BNEQ    L_575D                          ; 5758   020C 0003

        JSR     R5,     L_570B                  ; 575A   0004 0154 030B

L_575D:
        TSTR    R0                              ; 575D   0080
        BNEQ    L_5772                          ; 575E   020C 0012

        MVII    #$0100, R5                      ; 5760   02BD 0100
        SDBD                                    ; 5762   0001
        MVI@    R5,     R0                      ; 5763   02A8
        SDBD                                    ; 5764   0001
        CMPI    #$5E85, R0                      ; 5765   0378 0085 005E
        BNEQ    L_576E                          ; 5768   020C 0004

        JSR     R5,     L_5EA7                  ; 576A   0004 015C 02A7

        PULR    R7                              ; 576D   02B7

L_576E:
        JSR     R5,     L_5D9B                  ; 576E   0004 015C 019B

        PULR    R7                              ; 5771   02B7

L_5772:
        CMPI    #$0004, R0                      ; 5772   0378 0004
        BNEQ    L_578C                          ; 5774   020C 0016

        MVI     G_018D, R0                      ; 5776   0280 018D
        SWAP    R0,     1                       ; 5778   0040
        ADD     G_018A, R0                      ; 5779   02C0 018A
        SDBD                                    ; 577B   0001
        CMPI    #$0A07, R0                      ; 577C   0378 0007 000A
        BNEQ    L_578C                          ; 577F   020C 000B

        MVII    #$0002, R3                      ; 5781   02BB 0002
        MVII    #$02A9, R4                      ; 5783   02BC 02A9

        JSR     R5,     X_PRINT_R5              ; 5785   0004 0118 007B
        STRING  "DJD"                           ; 5788   0044 004A 0044
        DECLE   $0000                           ; 578B   0000
L_578C:
        PULR    R7                              ; 578C   02B7

L_578D:
        PSHR    R5                              ; 578D   0275
        MVI     G_0195, R1                      ; 578E   0281 0195
        TSTR    R1                              ; 5790   0089
        BNEQ    L_57D6                          ; 5791   020C 0043

        MVI     G_0345, R1                      ; 5793   0281 0345
        SDBD                                    ; 5795   0001
        ANDI    #$FFF0, R1                      ; 5796   03B9 00F0 00FF
        INCR    R1                              ; 5799   0009
        MVO     R1,     G_0345                  ; 579A   0241 0345
        MVII    #$000A, R1                      ; 579C   02B9 000A
        MVO     R1,     G_034D                  ; 579E   0241 034D
        MVII    #$0001, R1                      ; 57A0   02B9 0001
        MVO     R1,     G_0195                  ; 57A2   0241 0195

        JSR     R5,     L_57D7                  ; 57A4   0004 0154 03D7

        SDBD                                    ; 57A7   0001
        MVII    #$5803, R4                      ; 57A8   02BC 0003 0058
        SLL     R0,     1                       ; 57AB   0048
        ADDR    R0,     R4                      ; 57AC   00C4

        JSR     R5,     L_57E3                  ; 57AD   0004 0154 03E3

        MVII    #$0136, R3                      ; 57B0   02BB 0136

        JSR     R5,     L_57E3                  ; 57B2   0004 0154 03E3
        JSR     R5,     L_57D7                  ; 57B5   0004 0154 03D7

        MVI@    R3,     R0                      ; 57B8   0298
        MVI     G_032D, R2                      ; 57B9   0282 032D

        JSR     R5,     X_EXT_SIGN_LO           ; 57BB   0004 0114 0268

        CMPI    #$0003, R1                      ; 57BE   0379 0003
        BNEQ    L_57C3                          ; 57C0   020C 0001

        NEGR    R0                              ; 57C2   0020
L_57C3:
        TSTR    R0                              ; 57C3   0080
        BMI     L_57CC                          ; 57C4   020B 0006

        SDBD                                    ; 57C6   0001
        ANDI    #$FBFF, R2                      ; 57C7   03BA 00FF 00FB
        B       L_57D4                          ; 57CA   0200 0008

L_57CC:
        SDBD                                    ; 57CC   0001
        MVII    #$0400, R1                      ; 57CD   02B9 0000 0004
        COMR    R1                              ; 57D0   0019
        ANDR    R1,     R2                      ; 57D1   018A
        COMR    R1                              ; 57D2   0019
        XORR    R1,     R2                      ; 57D3   01CA
L_57D4:
        MVO     R2,     G_032D                  ; 57D4   0242 032D
L_57D6:
        PULR    R7                              ; 57D6   02B7

L_57D7:
        MVI     G_0194, R1                      ; 57D7   0281 0194
        CMPI    #$0003, R1                      ; 57D9   0379 0003
        BEQ     L_57E0                          ; 57DB   0204 0003

        MVII    #$0108, R3                      ; 57DD   02BB 0108
        MOVR    R5,     R7                      ; 57DF   00AF

L_57E0:
        MVII    #$0126, R3                      ; 57E0   02BB 0126
        MOVR    R5,     R7                      ; 57E2   00AF

L_57E3:
        PSHR    R5                              ; 57E3   0275
        MVI@    R3,     R0                      ; 57E4   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 57E5   0004 0114 0268

        MOVR    R0,     R1                      ; 57E8   0081
        MVI@    R4,     R0                      ; 57E9   02A0
        SLL     R0,     1                       ; 57EA   0048

        JSR     R5,     X_EXT_SIGN_LO           ; 57EB   0004 0114 0268

        CMPI    #$0126, R3                      ; 57EE   037B 0126
        BNEQ    L_57F3                          ; 57F0   020C 0001

        NEGR    R0                              ; 57F2   0020
L_57F3:
        ADDR    R0,     R1                      ; 57F3   00C1
        CMPI    #$0070, R1                      ; 57F4   0379 0070
        BGE     L_5802                          ; 57F6   020D 000A

        SDBD                                    ; 57F8   0001
        CMPI    #$FF90, R1                      ; 57F9   0379 0090 00FF
        BLE     L_5802                          ; 57FC   0206 0004

        TSTR    R1                              ; 57FE   0089
        BPL     L_5801                          ; 57FF   0203 0000

L_5801:
        MVO@    R1,     R3                      ; 5801   0259
L_5802:
        PULR    R7                              ; 5802   02B7

        DECLE   $00F6,  $0000,  $00F7,  $00FC   ; 5803   00F6 0000 00F7 00FC
        DECLE   $00F9,  $00F9,  $00FC,  $00F7   ; 5807   00F9 00F9 00FC 00F7
        DECLE   $0000,  $00F6,  $0004,  $00F7   ; 580B   0000 00F6 0004 00F7
        DECLE   $0004,  $00F9,  $0009,  $00FC   ; 580F   0004 00F9 0009 00FC
        DECLE   $000A,  $0000,  $0009,  $0004   ; 5813   000A 0000 0009 0004
        DECLE   $0007,  $0007,  $0004,  $0009   ; 5817   0007 0007 0004 0009
        DECLE   $0000,  $000A,  $00FC,  $0009   ; 581B   0000 000A 00FC 0009
        DECLE   $00F9,  $0007,  $00F7,  $0004   ; 581F   00F9 0007 00F7 0004
L_5823:
        SDBD                                    ; 5823   0001
        MVII    #$6633, R5                      ; 5824   02BD 0033 0066
        ADDR    R0,     R5                      ; 5827   00C5
        MVI@    R5,     R1                      ; 5828   02A9
        PSHR    R0                              ; 5829   0270
        MOVR    R1,     R0                      ; 582A   0088
        ANDI    #$000F, R0                      ; 582B   03B8 000F
        MVO     R0,     G_019B                  ; 582D   0240 019B
        MVO     R0,     G_0347                  ; 582F   0240 0347
        MVI     G_032F, R2                      ; 5831   0282 032F
        SDBD                                    ; 5833   0001
        ANDI    #$F3FF, R2                      ; 5834   03BA 00FF 00F3
        ANDI    #$00C0, R1                      ; 5837   03B9 00C0
        SLL     R1,     2                       ; 5839   004D
        SLL     R1,     2                       ; 583A   004D
        ADDR    R1,     R2                      ; 583B   00CA
        MVO     R2,     G_032F                  ; 583C   0242 032F
        MVII    #$0004, R2                      ; 583E   02BA 0004

        JSR     R5,     L_5556                  ; 5840   0004 0154 0156

        PULR    R0                              ; 5843   02B0
        MVII    #$0046, R1                      ; 5844   02B9 0046

        JSR     R5,     L_55E9                  ; 5846   0004 0154 01E9

        MOVR    R2,     R0                      ; 5849   0090

        JSR     R5,     X_EXT_SIGN_LO           ; 584A   0004 0114 0268

        NEGR    R0                              ; 584D   0020
        MVI     G_0196, R3                      ; 584E   0283 0196
        MVI     G_018E, R2                      ; 5850   0282 018E
        TSTR    R2                              ; 5852   0092
        BNEQ    L_5858                          ; 5853   020C 0003

        TSTR    R0                              ; 5855   0080
        BPL     L_5862                          ; 5856   0203 000A

L_5858:
        TSTR    R3                              ; 5858   009B
        BEQ     L_5860                          ; 5859   0204 0005

        JSR     R5,     X_EXT_SIGN_LO           ; 585B   0004 0114 0268

        SAR     R0,     2                       ; 585E   006C
        SAR     R0,     1                       ; 585F   0068
L_5860:
        MVO     R0,     G_010C                  ; 5860   0240 010C
L_5862:
        MOVR    R1,     R0                      ; 5862   0088
        TSTR    R3                              ; 5863   009B
        BEQ     L_586B                          ; 5864   0204 0005

        JSR     R5,     X_EXT_SIGN_LO           ; 5866   0004 0114 0268

        SAR     R0,     2                       ; 5869   006C
        SAR     R0,     1                       ; 586A   0068
L_586B:
        MVO     R0,     G_012A                  ; 586B   0240 012A
        PULR    R7                              ; 586D   02B7

        PSHR    R5                              ; 586E   0275
        MVII    #$019C, R5                      ; 586F   02BD 019C
        SLL     R3,     1                       ; 5871   004B
        ADDR    R3,     R5                      ; 5872   00DD
        SDBD                                    ; 5873   0001
        MVI@    R5,     R1                      ; 5874   02A9
        MVI@    R1,     R0                      ; 5875   0288
        SUBI    #$0002, R5                      ; 5876   033D 0002
        INCR    R1                              ; 5878   0009
        MVO@    R1,     R5                      ; 5879   0269
        SWAP    R1,     1                       ; 587A   0041
        MVO@    R1,     R5                      ; 587B   0269
        PSHR    R0                              ; 587C   0270
        ANDI    #$000F, R0                      ; 587D   03B8 000F
        SLL     R0,     2                       ; 587F   004C
        SLL     R0,     2                       ; 5880   004C

        JSR     R5,     X_EXT_SIGN_LO           ; 5881   0004 0114 0268

        SAR     R0,     2                       ; 5884   006C
        SAR     R0,     2                       ; 5885   006C
        MOVR    R0,     R1                      ; 5886   0081
        MVII    #$0136, R2                      ; 5887   02BA 0136
        ADDR    R3,     R2                      ; 5889   00DA
        MVI@    R2,     R0                      ; 588A   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 588B   0004 0114 0268

        ADDR    R1,     R0                      ; 588E   00C8
        MVO@    R0,     R2                      ; 588F   0250
        SLR     R3,     1                       ; 5890   0063
        PULR    R0                              ; 5891   02B0
        SLR     R0,     2                       ; 5892   0064
        SLR     R0,     2                       ; 5893   0064
        MVII    #$034D, R5                      ; 5894   02BD 034D
        ADDR    R3,     R5                      ; 5896   00DD
        MVO@    R0,     R5                      ; 5897   0268
        PULR    R7                              ; 5898   02B7

        PSHR    R5                              ; 5899   0275

        JSR     R5,     L_5E70                  ; 589A   0004 015C 0270

        MVII    #$0001, R2                      ; 589D   02BA 0001
        RRC     R0,     1                       ; 589F   0070
L_58A0:
        RRC     R0,     1                       ; 58A0   0070
        BC      L_5906                          ; 58A1   0201 0063

        CMPI    #$0001, R2                      ; 58A3   037A 0001
        BNEQ    L_58B6                          ; 58A5   020C 000F

        MVI     G_01C9, R3                      ; 58A7   0283 01C9
        CMPI    #$0014, R3                      ; 58A9   037B 0014
        BEQ     L_58BA                          ; 58AB   0204 000D

        INCR    R3                              ; 58AD   000B
        MVO     R3,     G_01C9                  ; 58AE   0243 01C9
        SDBD                                    ; 58B0   0001
        MVII    #$5955, R5                      ; 58B1   02BD 0055 0059
        B       L_58BE                          ; 58B4   0200 0008

L_58B6:
        CMPI    #$0005, R2                      ; 58B6   037A 0005
        BEQ     L_590C                          ; 58B8   0204 0052

L_58BA:
        SDBD                                    ; 58BA   0001
        MVII    #$5959, R5                      ; 58BB   02BD 0059 0059
L_58BE:
        MVII    #$0325, R3                      ; 58BE   02BB 0325
        ADDR    R2,     R3                      ; 58C0   00D3
        MVI     G_018A, R0                      ; 58C1   0280 018A
        CMPI    #$0005, R0                      ; 58C3   0378 0005
        BLT     L_58C9                          ; 58C5   0205 0002

        MVII    #$0004, R0                      ; 58C7   02B8 0004
L_58C9:
        PSHR    R5                              ; 58C9   0275

        JSR     R5,     X_RAND2                 ; 58CA   0004 0114 029E

        PULR    R5                              ; 58CD   02B5
        SLL     R0,     2                       ; 58CE   004C
        ADDR    R0,     R5                      ; 58CF   00C5
        MVII    #$019C, R4                      ; 58D0   02BC 019C
        SLL     R2,     1                       ; 58D2   004A
        ADDR    R2,     R4                      ; 58D3   00D4
        SDBD                                    ; 58D4   0001
        MVI@    R5,     R0                      ; 58D5   02A8
        MVO@    R0,     R4                      ; 58D6   0260
        SWAP    R0,     1                       ; 58D7   0040
        MVO@    R0,     R4                      ; 58D8   0260
        SDBD                                    ; 58D9   0001
        MVI@    R5,     R4                      ; 58DA   02AC
        PSHR    R2                              ; 58DB   0272

        JSR     R5,     L_55AB                  ; 58DC   0004 0154 01AB

        PULR    R2                              ; 58DF   02B2
        MVII    #$0001, R0                      ; 58E0   02B8 0001

        JSR     R5,     X_RAND1                 ; 58E2   0004 0114 027D

        TSTR    R0                              ; 58E5   0080
        BEQ     L_5905                          ; 58E6   0204 001D

        MVII    #$0126, R3                      ; 58E8   02BB 0126
        ADDR    R2,     R3                      ; 58EA   00D3
        MVI@    R3,     R0                      ; 58EB   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 58EC   0004 0114 0268

        NEGR    R0                              ; 58EF   0020
        MVO@    R0,     R3                      ; 58F0   0258
        SLR     R2,     1                       ; 58F1   0062
        MVII    #$0325, R3                      ; 58F2   02BB 0325
        ADDR    R2,     R3                      ; 58F4   00D3
        MVI@    R3,     R0                      ; 58F5   0298
        SDBD                                    ; 58F6   0001
        ANDI    #$FF00, R0                      ; 58F7   03B8 0000 00FF
        ADDI    #$0007, R0                      ; 58FA   02F8 0007
        MVO@    R0,     R3                      ; 58FC   0258
        ADDI    #$0008, R3                      ; 58FD   02FB 0008
        MVI@    R3,     R0                      ; 58FF   0298
        SDBD                                    ; 5900   0001
        XORI    #$0400, R0                      ; 5901   03F8 0000 0004
        MVO@    R0,     R3                      ; 5904   0258
L_5905:
        PULR    R7                              ; 5905   02B7

L_5906:
        INCR    R2                              ; 5906   000A
        CMPI    #$0006, R2                      ; 5907   037A 0006
        BLT     L_58A0                          ; 5909   0225 006A
        PULR    R7                              ; 590B   02B7

L_590C:
        SDBD                                    ; 590C   0001
        MVII    #$594D, R1                      ; 590D   02B9 004D 0059
        MVI     G_018A, R0                      ; 5910   0280 018A
        INCR    R0                              ; 5912   0008

        JSR     R5,     X_RAND2                 ; 5913   0004 0114 029E

        ADDR    R0,     R1                      ; 5916   00C1
        MVI@    R1,     R0                      ; 5917   0288
        MVII    #$0003, R2                      ; 5918   02BA 0003
        MVII    #$032A, R3                      ; 591A   02BB 032A
        ADDR    R0,     R7                      ; 591C   00C7

        SDBD                                    ; 591D   0001
        MVII    #$6CA8, R0                      ; 591E   02B8 00A8 006C
        SDBD                                    ; 5921   0001
        MVII    #$699A, R4                      ; 5922   02BC 009A 0069
        B       L_5944                          ; 5925   0200 001D

        SDBD                                    ; 5927   0001
        MVII    #$6CB7, R0                      ; 5928   02B8 00B7 006C
        SDBD                                    ; 592B   0001
        MVII    #$6A6C, R4                      ; 592C   02BC 006C 006A
        B       L_5944                          ; 592F   0200 0013

        SDBD                                    ; 5931   0001
        MVII    #$6CB9, R0                      ; 5932   02B8 00B9 006C
        SDBD                                    ; 5935   0001
        MVII    #$6910, R4                      ; 5936   02BC 0010 0069
        B       L_5943                          ; 5939   0200 0008

        SDBD                                    ; 593B   0001
        MVII    #$6CA8, R0                      ; 593C   02B8 00A8 006C
        SDBD                                    ; 593F   0001
        MVII    #$6884, R4                      ; 5940   02BC 0084 0068
L_5943:
        DECR    R2                              ; 5943   0012
L_5944:
        MVII    #$01A6, R5                      ; 5944   02BD 01A6
        MVO@    R0,     R5                      ; 5946   0268
        SWAP    R0,     1                       ; 5947   0040
        MVO@    R0,     R5                      ; 5948   0268

        JSR     R5,     L_55A9                  ; 5949   0004 0154 01A9

        PULR    R7                              ; 594C   02B7

        DECLE   $0014,  $0014,  $0014,  $001E   ; 594D   0014 0014 0014 001E
        DECLE   $001E,  $000A,  $000A,  $0000   ; 5951   001E 000A 000A 0000

        TSTR    R6                              ; 5955   00B6
        SAR     R0,     2                       ; 5956   006C
        SWAP    R2,     2                       ; 5957   0046
        SLR     R3,     2                       ; 5958   0067
        ADDR    R0,     R3                      ; 5959   00C3
        SAR     R0,     2                       ; 595A   006C
        MOVR    R4,     R2                      ; 595B   00A2
        SLR     R3,     2                       ; 595C   0067
        ADDR    R0,     R0                      ; 595D   00C0
        SAR     R0,     2                       ; 595E   006C
        MOVR    R1,     R4                      ; 595F   008C
        SLR     R3,     2                       ; 5960   0067
        MOVR    R7,     R4                      ; 5961   00BC
        SAR     R0,     2                       ; 5962   006C
        ADDR    R5,     R0                      ; 5963   00E8
        SLR     R3,     2                       ; 5964   0067
        MOVR    R5,     R0                      ; 5965   00A8
        SAR     R0,     2                       ; 5966   006C
        ADCR    R6                              ; 5967   002E
        SAR     R0,     1                       ; 5968   0068
        PSHR    R5                              ; 5969   0275
        CLRR    R3                              ; 596A   01DB
L_596B:
        MVII    #$032D, R1                      ; 596B   02B9 032D
        ADDR    R3,     R1                      ; 596D   00D9
        MVI@    R1,     R0                      ; 596E   0288
        ANDI    #$007F, R0                      ; 596F   03B8 007F
        CMPI    #$0070, R0                      ; 5971   0378 0070
        BGT     L_5983                          ; 5973   020E 000E

        MVII    #$0325, R1                      ; 5975   02B9 0325
        ADDR    R3,     R1                      ; 5977   00D9
        MVI@    R1,     R0                      ; 5978   0288
        ANDI    #$00FF, R0                      ; 5979   03B8 00FF
        CMPI    #$00C0, R0                      ; 597B   0378 00C0
        BLT     L_5990                          ; 597D   0205 0011

        CMPI    #$00F6, R0                      ; 597F   0378 00F6
        BGT     L_5990                          ; 5981   020E 000D

L_5983:
        MVII    #$0001, R2                      ; 5983   02BA 0001
        CMPI    #$0005, R3                      ; 5985   037B 0005
        BLT     L_598B                          ; 5987   0205 0002

        MVII    #$0003, R2                      ; 5989   02BA 0003
L_598B:
        PSHR    R3                              ; 598B   0273

        JSR     R5,     L_5567                  ; 598C   0004 0154 0167

        PULR    R3                              ; 598F   02B3
L_5990:
        INCR    R3                              ; 5990   000B
        CMPI    #$0006, R3                      ; 5991   037B 0006
        BLT     L_596B                          ; 5993   0225 0029
        PULR    R7                              ; 5995   02B7

L_5996:
        PSHR    R5                              ; 5996   0275
        CMPI    #$0001, R2                      ; 5997   037A 0001
        BGT     L_5A0A                          ; 5999   020E 006F

        MVI     G_018D, R1                      ; 599B   0281 018D
        MVII    #$0200, R3                      ; 599D   02BB 0200
        TSTR    R2                              ; 599F   0092
        BEQ     L_59B0                          ; 59A0   0204 000E

        MOVR    R3,     R2                      ; 59A2   009A
        MVII    #$0013, R0                      ; 59A3   02B8 0013
        ADDR    R0,     R2                      ; 59A5   00C2
        INCR    R1                              ; 59A6   0009
        ANDI    #$007F, R1                      ; 59A7   03B9 007F
        MVO     R1,     G_018D                  ; 59A9   0241 018D
        ADDR    R1,     R0                      ; 59AB   00C8
        ANDI    #$007F, R0                      ; 59AC   03B8 007F
        B       L_59B7                          ; 59AE   0200 0007

L_59B0:
        MOVR    R3,     R2                      ; 59B0   009A
        DECR    R1                              ; 59B1   0011
        ANDI    #$007F, R1                      ; 59B2   03B9 007F
        MVO     R1,     G_018D                  ; 59B4   0241 018D
        MOVR    R1,     R0                      ; 59B6   0088
L_59B7:
        MVII    #$018F, R5                      ; 59B7   02BD 018F
        MVO@    R2,     R5                      ; 59B9   026A
        SWAP    R2,     1                       ; 59BA   0042
        MVO@    R2,     R5                      ; 59BB   026A
        SWAP    R2,     1                       ; 59BC   0042
        PSHR    R0                              ; 59BD   0270
        PSHR    R2                              ; 59BE   0272

        JSR     R5,     L_5BB1                  ; 59BF   0004 0158 03B1

        PULR    R2                              ; 59C2   02B2
        PULR    R0                              ; 59C3   02B0
        CMPI    #$0024, R0                      ; 59C4   0378 0024
        BLE     L_5A06                          ; 59C6   0206 003E

        CMPI    #$0052, R0                      ; 59C8   0378 0052
        BNEQ    L_59E7                          ; 59CA   020C 001B

        CMPI    #$0200, R2                      ; 59CC   037A 0200
        BNEQ    L_59D3                          ; 59CE   020C 0003

        CLRR    R1                              ; 59D0   01C9
        B       L_59D5                          ; 59D1   0200 0002

L_59D3:
        MVII    #$00A0, R1                      ; 59D3   02B9 00A0
L_59D5:
        PSHR    R1                              ; 59D5   0271
        PSHR    R2                              ; 59D6   0272

        JSR     R5,     L_6427                  ; 59D7   0004 0164 0027

        PULR    R2                              ; 59DA   02B2
        PULR    R1                              ; 59DB   02B1
        MVI     G_0327, R0                      ; 59DC   0280 0327
        SDBD                                    ; 59DE   0001
        ANDI    #$FF00, R0                      ; 59DF   03B8 0000 00FF
        ADDR    R1,     R0                      ; 59E2   00C8
        MVO     R0,     G_0327                  ; 59E3   0240 0327
        B       L_59FF                          ; 59E5   0200 0018

L_59E7:
        CMPI    #$003D, R0                      ; 59E7   0378 003D
        BNEQ    L_59EF                          ; 59E9   020C 0004

        CMPI    #$0200, R2                      ; 59EB   037A 0200
        BEQ     L_59F7                          ; 59ED   0204 0008

L_59EF:
        CMPI    #$0067, R0                      ; 59EF   0378 0067
        BNEQ    L_59FF                          ; 59F1   020C 000C

        CMPI    #$0213, R2                      ; 59F3   037A 0213
        BNEQ    L_59FF                          ; 59F5   020C 0008

L_59F7:
        PSHR    R2                              ; 59F7   0272
        MVII    #$0002, R2                      ; 59F8   02BA 0002
        MOVR    R2,     R3                      ; 59FA   0093

        JSR     R5,     L_5567                  ; 59FB   0004 0154 0167

        PULR    R2                              ; 59FE   02B2

L_59FF:
        JSR     R5,     L_5C19                  ; 59FF   0004 015C 0019
        JSR     R5,     L_5C87                  ; 5A02   0004 015C 0087

        PULR    R7                              ; 5A05   02B7

L_5A06:
        JSR     R5,     L_5C4B                  ; 5A06   0004 015C 004B

        PULR    R7                              ; 5A09   02B7

L_5A0A:
        CMPI    #$0002, R2                      ; 5A0A   037A 0002
        BGT     L_5A18                          ; 5A0C   020E 000A

        MVI     G_018E, R0                      ; 5A0E   0280 018E
        DECR    R0                              ; 5A10   0010
        MVO     R0,     G_018E                  ; 5A11   0240 018E
        CLRR    R0                              ; 5A13   01C0
        MVII    #$0200, R1                      ; 5A14   02B9 0200
        B       L_5A21                          ; 5A16   0200 0009

L_5A18:
        MVI     G_018E, R0                      ; 5A18   0280 018E
        INCR    R0                              ; 5A1A   0008
        MVO     R0,     G_018E                  ; 5A1B   0240 018E
        MVII    #$000B, R0                      ; 5A1D   02B8 000B
        MVII    #$02DC, R1                      ; 5A1F   02B9 02DC
L_5A21:
        MVO     R1,     G_0191                  ; 5A21   0241 0191
        SWAP    R1,     1                       ; 5A23   0041
        MVO     R1,     G_0192                  ; 5A24   0241 0192
        SWAP    R1,     1                       ; 5A26   0041
        MVI     G_018E, R2                      ; 5A27   0282 018E
        ADDR    R2,     R0                      ; 5A29   00D0
        MVO     R0,     G_0193                  ; 5A2A   0240 0193
        CMPI    #$0006, R0                      ; 5A2C   0378 0006
        BGT     L_5A3B                          ; 5A2E   020E 000B

        SDBD                                    ; 5A30   0001
        MVII    #$6FC6, R5                      ; 5A31   02BD 00C6 006F
        SDBD                                    ; 5A34   0001
        MVI@    R5,     R3                      ; 5A35   02AB

        JSR     R5,     L_5CF5                  ; 5A36   0004 015C 00F5

        B       L_5A6C                          ; 5A39   0200 0031

L_5A3B:
        CMPI    #$0007, R0                      ; 5A3B   0378 0007
        BGT     L_5A44                          ; 5A3D   020E 0005

        JSR     R5,     L_5D00                  ; 5A3F   0004 015C 0100

        B       L_5A6C                          ; 5A42   0200 0028

L_5A44:
        CMPI    #$001F, R0                      ; 5A44   0378 001F
        BGT     L_5A53                          ; 5A46   020E 000B

L_5A48:
        SDBD                                    ; 5A48   0001
        MVII    #$6FC8, R5                      ; 5A49   02BD 00C8 006F
        SDBD                                    ; 5A4C   0001
        MVI@    R5,     R3                      ; 5A4D   02AB

        JSR     R5,     L_5CF5                  ; 5A4E   0004 015C 00F5

        B       L_5A6C                          ; 5A51   0200 0019

L_5A53:
        CMPI    #$004F, R0                      ; 5A53   0378 004F
        BGT     L_5A5C                          ; 5A55   020E 0005

        JSR     R5,     L_5D2A                  ; 5A57   0004 015C 012A

        B       L_5A6C                          ; 5A5A   0200 0010

L_5A5C:
        CMPI    #$0056, R0                      ; 5A5C   0378 0056
        BLE     L_5A48                          ; 5A5E   0226 0017

        CMPI    #$0059, R0                      ; 5A60   0378 0059
        BGT     L_5A69                          ; 5A62   020E 0005

        JSR     R5,     L_5D5D                  ; 5A64   0004 015C 015D

        B       L_5A6C                          ; 5A67   0200 0003

L_5A69:
        JSR     R5,     L_5D79                  ; 5A69   0004 015C 0179

L_5A6C:
        MVI     G_0193, R0                      ; 5A6C   0280 0193

        JSR     R5,     L_5A72                  ; 5A6E   0004 0158 0272

        PULR    R7                              ; 5A71   02B7

L_5A72:
        PSHR    R5                              ; 5A72   0275
        MVII    #$0005, R2                      ; 5A73   02BA 0005
        MVI     G_018E, R3                      ; 5A75   0283 018E
        CMPI    #$000E, R3                      ; 5A77   037B 000E
        BEQ     L_5A7F                          ; 5A79   0204 0004

        CMPI    #$000D, R3                      ; 5A7B   037B 000D
        BNEQ    L_5A83                          ; 5A7D   020C 0004

L_5A7F:
        JSR     R5,     L_5556                  ; 5A7F   0004 0154 0156

        PULR    R7                              ; 5A82   02B7

L_5A83:
        CMPI    #$000B, R3                      ; 5A83   037B 000B
        BEQ     L_5A8B                          ; 5A85   0204 0004

        CMPI    #$000C, R3                      ; 5A87   037B 000C
        BNEQ    L_5A91                          ; 5A89   020C 0006

L_5A8B:
        MVII    #$0005, R2                      ; 5A8B   02BA 0005

        JSR     R5,     L_5542                  ; 5A8D   0004 0154 0142

        PULR    R7                              ; 5A90   02B7

L_5A91:
        CMPI    #$0026, R0                      ; 5A91   0378 0026
        BNEQ    L_5A9B                          ; 5A93   020C 0006

        MVII    #$0088, R0                      ; 5A95   02B8 0088
        MVI     G_01AF, R1                      ; 5A97   0281 01AF
        B       L_5AB7                          ; 5A99   0200 001C

L_5A9B:
        CMPI    #$0032, R0                      ; 5A9B   0378 0032
        BNEQ    L_5AA5                          ; 5A9D   020C 0006

        MVII    #$0028, R0                      ; 5A9F   02B8 0028
        MVI     G_01B0, R1                      ; 5AA1   0281 01B0
        B       L_5AB7                          ; 5AA3   0200 0012

L_5AA5:
        CMPI    #$003E, R0                      ; 5AA5   0378 003E
        BNEQ    L_5AAF                          ; 5AA7   020C 0006

        MVII    #$0020, R0                      ; 5AA9   02B8 0020
        MVI     G_01B1, R1                      ; 5AAB   0281 01B1
        B       L_5AB7                          ; 5AAD   0200 0008

L_5AAF:
        CMPI    #$004A, R0                      ; 5AAF   0378 004A
        BNEQ    L_5AEE                          ; 5AB1   020C 003B

        MVII    #$0080, R0                      ; 5AB3   02B8 0080
        MVI     G_01B2, R1                      ; 5AB5   0281 01B2
L_5AB7:
        TSTR    R1                              ; 5AB7   0089
        BEQ     L_5AED                          ; 5AB8   0204 0033

        MVO     R1,     G_01AE                  ; 5ABA   0241 01AE
        PSHR    R0                              ; 5ABC   0270
        MVII    #$0325, R3                      ; 5ABD   02BB 0325
        SDBD                                    ; 5ABF   0001
        MVII    #$6700, R4                      ; 5AC0   02BC 0000 0067

        JSR     R5,     L_55AB                  ; 5AC3   0004 0154 01AB

        CLRR    R0                              ; 5AC6   01C0
        MVO     R0,     G_034D                  ; 5AC7   0240 034D
        MVII    #$0126, R3                      ; 5AC9   02BB 0126

        JSR     R5,     L_55E2                  ; 5ACB   0004 0154 01E2

        PULR    R0                              ; 5ACE   02B0
        MVI     G_0325, R2                      ; 5ACF   0282 0325
        SDBD                                    ; 5AD1   0001
        ANDI    #$FF00, R2                      ; 5AD2   03BA 0000 00FF
        ADDR    R0,     R2                      ; 5AD5   00C2
        MVO     R2,     G_0325                  ; 5AD6   0242 0325
        MVI     G_032D, R2                      ; 5AD8   0282 032D
        SDBD                                    ; 5ADA   0001
        ANDI    #$FF80, R2                      ; 5ADB   03BA 0080 00FF
        MVI     G_018E, R0                      ; 5ADE   0280 018E
        MVI     G_0193, R1                      ; 5AE0   0281 0193
        CMPR    R0,     R1                      ; 5AE2   0141
        BNEQ    L_5AE9                          ; 5AE3   020C 0004

        ADDI    #$0008, R2                      ; 5AE5   02FA 0008
        B       L_5AEB                          ; 5AE7   0200 0002

L_5AE9:
        ADDI    #$0060, R2                      ; 5AE9   02FA 0060
L_5AEB:
        MVO     R2,     G_032D                  ; 5AEB   0242 032D
L_5AED:
        PULR    R7                              ; 5AED   02B7

L_5AEE:
        CMPI    #$0058, R0                      ; 5AEE   0378 0058
        BNEQ    L_5AFA                          ; 5AF0   020C 0008

        MVI     G_01AC, R0                      ; 5AF2   0280 01AC
        TSTR    R0                              ; 5AF4   0080
        BNEQ    L_5AFA                          ; 5AF5   020C 0003

        JSR     R5,     L_66AF                  ; 5AF7   0004 0164 02AF

L_5AFA:
        PULR    R7                              ; 5AFA   02B7

        PSHR    R5                              ; 5AFB   0275
        MVI     G_018D, R0                      ; 5AFC   0280 018D
        CMPI    #$0016, R0                      ; 5AFE   0378 0016
        BLT     L_5B9F                          ; 5B00   0205 009D

        MVI     G_0197, R0                      ; 5B02   0280 0197
        TSTR    R0                              ; 5B04   0080
        BNEQ    L_5B9F                          ; 5B05   020C 0098

        MVI     G_0194, R0                      ; 5B07   0280 0194
        CMPI    #$0001, R0                      ; 5B09   0378 0001
        BNEQ    L_5B51                          ; 5B0B   020C 0044

        MVI     G_01AD, R3                      ; 5B0D   0283 01AD
        MOVR    R3,     R1                      ; 5B0F   0099
        ANDI    #$0020, R3                      ; 5B10   03BB 0020
        TSTR    R3                              ; 5B12   009B
        BEQ     L_5B9F                          ; 5B13   0204 008A

        XORR    R3,     R1                      ; 5B15   01D9
        MVO     R1,     G_01AD                  ; 5B16   0241 01AD
        INCR    R0                              ; 5B18   0008
        MVO     R0,     G_0194                  ; 5B19   0240 0194
        MVO     R0,     G_0197                  ; 5B1B   0240 0197
        MVII    #$0001, R3                      ; 5B1D   02BB 0001

        JSR     R5,     L_5569                  ; 5B1F   0004 0154 0169

        MVII    #$0002, R1                      ; 5B22   02B9 0002
        CLRR    R2                              ; 5B24   01D2

        JSR     R5,     L_5558                  ; 5B25   0004 0154 0158

        MVII    #$000A, R2                      ; 5B28   02BA 000A

        JSR     R5,     L_5556                  ; 5B2A   0004 0154 0156

        MVII    #$0002, R2                      ; 5B2D   02BA 0002

        JSR     R5,     L_5542                  ; 5B2F   0004 0154 0142

        MVII    #$0004, R2                      ; 5B32   02BA 0004

        JSR     R5,     L_5542                  ; 5B34   0004 0154 0142

        MVII    #$0006, R2                      ; 5B37   02BA 0006

        JSR     R5,     L_5542                  ; 5B39   0004 0154 0142

        CLRR    R0                              ; 5B3C   01C0
        MVO     R0,     G_010A                  ; 5B3D   0240 010A
        MVO     R0,     G_010C                  ; 5B3F   0240 010C
        MVO     R0,     G_0126                  ; 5B41   0240 0126

        JSR     R5,     L_5BA0                  ; 5B43   0004 0158 03A0
        JSR     R5,     L_6427                  ; 5B46   0004 0164 0027
        JSR     R5,     L_6C14                  ; 5B49   0004 016C 0014

        MVII    #$0048, R0                      ; 5B4C   02B8 0048
        MVO     R0,     G_018D                  ; 5B4E   0240 018D
        PULR    R7                              ; 5B50   02B7

L_5B51:
        CMPI    #$0002, R0                      ; 5B51   0378 0002
        BNEQ    L_5B9F                          ; 5B53   020C 004A

        MVI     G_01AD, R3                      ; 5B55   0283 01AD
        MOVR    R3,     R1                      ; 5B57   0099
        ANDI    #$0010, R3                      ; 5B58   03BB 0010
        TSTR    R3                              ; 5B5A   009B
        BEQ     L_5B9F                          ; 5B5B   0204 0042

        XORR    R3,     R1                      ; 5B5D   01D9
        MVO     R1,     G_01AD                  ; 5B5E   0241 01AD
        DECR    R0                              ; 5B60   0010
        MVO     R0,     G_0194                  ; 5B61   0240 0194
        MVO     R0,     G_0197                  ; 5B63   0240 0197
        MVII    #$0002, R2                      ; 5B65   02BA 0002
        MOVR    R2,     R3                      ; 5B67   0093

        JSR     R5,     L_5567                  ; 5B68   0004 0154 0167

        MVII    #$0002, R1                      ; 5B6B   02B9 0002
        CLRR    R2                              ; 5B6D   01D2
        MVO     R2,     G_034D                  ; 5B6E   0242 034D

        JSR     R5,     L_5544                  ; 5B70   0004 0154 0144

        MVII    #$000A, R2                      ; 5B73   02BA 000A

        JSR     R5,     L_5542                  ; 5B75   0004 0154 0142
        JSR     R5,     L_63C6                  ; 5B78   0004 0160 03C6

        MVI     G_032D, R0                      ; 5B7B   0280 032D
        SDBD                                    ; 5B7D   0001
        ANDI    #$FF80, R0                      ; 5B7E   03B8 0080 00FF
        ADDI    #$0040, R0                      ; 5B81   02F8 0040
        MVO     R0,     G_032D                  ; 5B83   0240 032D
        CLRR    R0                              ; 5B85   01C0
        MVO     R0,     G_010A                  ; 5B86   0240 010A
        MVO     R0,     G_0108                  ; 5B88   0240 0108
        MVO     R0,     G_0136                  ; 5B8A   0240 0136

        JSR     R5,     L_5BA0                  ; 5B8C   0004 0158 03A0
        JSR     R5,     L_6590                  ; 5B8F   0004 0164 0190

        MVII    #$0002, R2                      ; 5B92   02BA 0002

        JSR     R5,     L_5556                  ; 5B94   0004 0154 0156
        JSR     R5,     L_6BDF                  ; 5B97   0004 0168 03DF

        MVII    #$0006, R2                      ; 5B9A   02BA 0006

        JSR     R5,     L_5556                  ; 5B9C   0004 0154 0156

L_5B9F:
        PULR    R7                              ; 5B9F   02B7

L_5BA0:
        SDBD                                    ; 5BA0   0001
        MVII    #$8000, R2                      ; 5BA1   02BA 0000 0080
        MVII    #$0325, R3                      ; 5BA4   02BB 0325
        ADDR    R0,     R3                      ; 5BA6   00C3
        MVI@    R3,     R1                      ; 5BA7   0299
        XORR    R2,     R1                      ; 5BA8   01D1
        MVO@    R1,     R3                      ; 5BA9   0259
        MVII    #$032D, R3                      ; 5BAA   02BB 032D
        ADDR    R0,     R3                      ; 5BAC   00C3
        MVI@    R3,     R1                      ; 5BAD   0299
        XORR    R2,     R1                      ; 5BAE   01D1
        MVO@    R1,     R3                      ; 5BAF   0259
        MOVR    R5,     R7                      ; 5BB0   00AF

L_5BB1:
        PSHR    R5                              ; 5BB1   0275
        CMPI    #$007E, R1                      ; 5BB2   0379 007E
        BNEQ    L_5BCD                          ; 5BB4   020C 0017

        MVI     G_01AC, R1                      ; 5BB6   0281 01AC
        TSTR    R1                              ; 5BB8   0089
        BNEQ    L_5BCA                          ; 5BB9   020C 000F

        JSR     R5,     L_6B70                  ; 5BBB   0004 0168 0370

        MVII    #$0326, R1                      ; 5BBE   02B9 0326
        MVI@    R1,     R0                      ; 5BC0   0288
        ADDI    #$00A8, R0                      ; 5BC1   02F8 00A8
        MVO@    R0,     R1                      ; 5BC3   0248
        INCR    R1                              ; 5BC4   0009
        MVI@    R1,     R0                      ; 5BC5   0288
        ADDI    #$00A8, R0                      ; 5BC6   02F8 00A8
        MVO@    R0,     R1                      ; 5BC8   0248
        PULR    R7                              ; 5BC9   02B7

L_5BCA:
        MVO     R1,     G_01C8                  ; 5BCA   0241 01C8
        PULR    R7                              ; 5BCC   02B7

L_5BCD:
        CMPI    #$007D, R1                      ; 5BCD   0379 007D
        BNEQ    L_5BD6                          ; 5BCF   020C 0005

        CLRR    R1                              ; 5BD1   01C9
        MVO     R1,     G_01C8                  ; 5BD2   0241 01C8
        B       L_5BDA                          ; 5BD4   0200 0004

L_5BD6:
        CMPI    #$0014, R1                      ; 5BD6   0379 0014
        BNEQ    L_5BE2                          ; 5BD8   020C 0008

L_5BDA:
        MVII    #$0002, R2                      ; 5BDA   02BA 0002
        MVII    #$0001, R3                      ; 5BDC   02BB 0001

        JSR     R5,     L_5567                  ; 5BDE   0004 0154 0167

        PULR    R7                              ; 5BE1   02B7

L_5BE2:
        CMPI    #$0013, R1                      ; 5BE2   0379 0013
        BNEQ    L_5C18                          ; 5BE4   020C 0032

        MVI     G_01C8, R1                      ; 5BE6   0281 01C8
        TSTR    R1                              ; 5BE8   0089
        BEQ     L_5C15                          ; 5BE9   0204 002A

        CLRR    R1                              ; 5BEB   01C9
        MVO     R1,     G_01C8                  ; 5BEC   0241 01C8
        MVI     G_018A, R1                      ; 5BEE   0281 018A
        CMPI    #$0007, R1                      ; 5BF0   0379 0007
        BNEQ    L_5C12                          ; 5BF2   020C 001E

        MOVR    R1,     R2                      ; 5BF4   008A

        JSR     R5,     L_5542                  ; 5BF5   0004 0154 0142

        CLRR    R0                              ; 5BF8   01C0
        MVO     R0,     G_0186                  ; 5BF9   0240 0186
        MVO     R0,     G_0187                  ; 5BFB   0240 0187

        JSR     R5,     L_5693                  ; 5BFD   0004 0154 0293

        MVII    #$0207, R3                      ; 5C00   02BB 0207
        MVII    #$02CD, R4                      ; 5C02   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 5C04   0004 0118 007B
        STRING  "WELL DONE"                     ; 5C07  
        DECLE   $0000                           ; 5C10   0000

        PULR    R7                              ; 5C11   02B7

L_5C12:
        JSR     R5,     L_624A                  ; 5C12   0004 0160 024A
L_5C15:
        JSR     R5,     L_6B70                  ; 5C15   0004 0168 0370

L_5C18:
        PULR    R7                              ; 5C18   02B7

L_5C19:
        PSHR    R5                              ; 5C19   0275
        MVII    #$0007, R3                      ; 5C1A   02BB 0007
        SDBD                                    ; 5C1C   0001
        MVII    #$6FC6, R5                      ; 5C1D   02BD 00C6 006F
        SDBD                                    ; 5C20   0001
        MVI@    R5,     R0                      ; 5C21   02A8
L_5C22:
        MVO@    R0,     R2                      ; 5C22   0250
        ADDI    #$0014, R2                      ; 5C23   02FA 0014
        DECR    R3                              ; 5C25   0013
        BNEQ    L_5C22                          ; 5C26   022C 0005

        MVII    #$0002, R0                      ; 5C28   02B8 0002

        JSR     R5,     X_RAND1                 ; 5C2A   0004 0114 027D

        TSTR    R0                              ; 5C2D   0080
        BEQ     L_5C32                          ; 5C2E   0204 0002

        DECR    R0                              ; 5C30   0010
        SLL     R0,     1                       ; 5C31   0048
L_5C32:
        SDBD                                    ; 5C32   0001
        MVII    #$6FCA, R5                      ; 5C33   02BD 00CA 006F
        ADDR    R0,     R5                      ; 5C36   00C5
        SDBD                                    ; 5C37   0001
        MVI@    R5,     R0                      ; 5C38   02A8
        MVO@    R0,     R2                      ; 5C39   0250
        ADDI    #$0014, R2                      ; 5C3A   02FA 0014
        MVII    #$0004, R3                      ; 5C3C   02BB 0004
L_5C3E:
        SDBD                                    ; 5C3E   0001
        MVII    #$6FC8, R5                      ; 5C3F   02BD 00C8 006F
        SDBD                                    ; 5C42   0001
        MVI@    R5,     R0                      ; 5C43   02A8
L_5C44:
        MVO@    R0,     R2                      ; 5C44   0250
        ADDI    #$0014, R2                      ; 5C45   02FA 0014
        DECR    R3                              ; 5C47   0013
        BNEQ    L_5C44                          ; 5C48   022C 0005
        PULR    R7                              ; 5C4A   02B7

L_5C4B:
        PSHR    R5                              ; 5C4B   0275
        MVI     G_0190, R2                      ; 5C4C   0282 0190
        SWAP    R2,     1                       ; 5C4E   0042
        ADD     G_018F, R2                      ; 5C4F   02C2 018F
        MVII    #$0003, R3                      ; 5C51   02BB 0003
        SDBD                                    ; 5C53   0001
        MVII    #$6FC6, R5                      ; 5C54   02BD 00C6 006F
        SDBD                                    ; 5C57   0001
        MVI@    R5,     R0                      ; 5C58   02A8
L_5C59:
        MVO@    R0,     R2                      ; 5C59   0250
        ADDI    #$0014, R2                      ; 5C5A   02FA 0014
        DECR    R3                              ; 5C5C   0013
        BNEQ    L_5C59                          ; 5C5D   022C 0005

        MVI     G_018D, R3                      ; 5C5F   0283 018D
        MOVR    R2,     R1                      ; 5C61   0091
        SUBI    #$003C, R1                      ; 5C62   0339 003C
        CMPI    #$0200, R1                      ; 5C64   0379 0200
        BEQ     L_5C6C                          ; 5C66   0204 0004

        ADDI    #$0013, R3                      ; 5C68   02FB 0013
        ANDI    #$007F, R3                      ; 5C6A   03BB 007F
L_5C6C:
        SDBD                                    ; 5C6C   0001
        MVII    #$6D26, R4                      ; 5C6D   02BC 0026 006D
        SLL     R3,     2                       ; 5C70   004F
        SLL     R3,     1                       ; 5C71   004B
        ADDR    R3,     R4                      ; 5C72   00DC
        MVII    #$0008, R3                      ; 5C73   02BB 0008
L_5C75:
        MVI@    R4,     R0                      ; 5C75   02A0
        PSHR    R3                              ; 5C76   0273
        PSHR    R2                              ; 5C77   0272

        JSR     R5,     L_5CC5                  ; 5C78   0004 015C 00C5

        PULR    R2                              ; 5C7B   02B2
        PULR    R3                              ; 5C7C   02B3
        MVO@    R0,     R2                      ; 5C7D   0250
        ADDI    #$0014, R2                      ; 5C7E   02FA 0014
        DECR    R3                              ; 5C80   0013
        BNEQ    L_5C75                          ; 5C81   022C 000D

        MVII    #$0001, R3                      ; 5C83   02BB 0001
        B       L_5C3E                          ; 5C85   0220 0048

L_5C87:
        PSHR    R5                              ; 5C87   0275
        MVI     G_018D, R3                      ; 5C88   0283 018D
        MVII    #$018F, R5                      ; 5C8A   02BD 018F
        SDBD                                    ; 5C8C   0001
        MVI@    R5,     R2                      ; 5C8D   02AA
        CMPI    #$0200, R2                      ; 5C8E   037A 0200
        BEQ     L_5C94                          ; 5C90   0204 0002

        ADDI    #$0013, R3                      ; 5C92   02FB 0013
L_5C94:
        SDBD                                    ; 5C94   0001
        MVII    #$6CCB, R0                      ; 5C95   02B8 00CB 006C
        ADDR    R0,     R3                      ; 5C98   00C3
        SUBI    #$0025, R3                      ; 5C99   033B 0025
        MVI@    R3,     R1                      ; 5C9B   0299

        JSR     R5,     L_5CA6                  ; 5C9C   0004 015C 00A6

        SLR     R1,     2                       ; 5C9F   0065
        SLR     R1,     2                       ; 5CA0   0065
        SLR     R1,     1                       ; 5CA1   0061

        JSR     R5,     L_5CA6                  ; 5CA2   0004 015C 00A6

        PULR    R7                              ; 5CA5   02B7

L_5CA6:
        PSHR    R5                              ; 5CA6   0275
        MOVR    R1,     R3                      ; 5CA7   008B
        SLR     R3,     2                       ; 5CA8   0067
        ANDI    #$0007, R3                      ; 5CA9   03BB 0007
        TSTR    R3                              ; 5CAB   009B
        BNEQ    L_5CAF                          ; 5CAC   020C 0001
        PULR    R7                              ; 5CAE   02B7

L_5CAF:
        MVII    #$018F, R5                      ; 5CAF   02BD 018F
        SDBD                                    ; 5CB1   0001
        MVI@    R5,     R2                      ; 5CB2   02AA
L_5CB3:
        ADDI    #$0014, R2                      ; 5CB3   02FA 0014
        DECR    R3                              ; 5CB5   0013
        BNEQ    L_5CB3                          ; 5CB6   022C 0004

        MOVR    R1,     R3                      ; 5CB8   008B
        ANDI    #$0003, R3                      ; 5CB9   03BB 0003
        SLL     R3,     1                       ; 5CBB   004B
        SDBD                                    ; 5CBC   0001
        MVII    #$6FBE, R5                      ; 5CBD   02BD 00BE 006F
        ADDR    R3,     R5                      ; 5CC0   00DD
        SDBD                                    ; 5CC1   0001
        MVI@    R5,     R0                      ; 5CC2   02A8
        MVO@    R0,     R2                      ; 5CC3   0250
        PULR    R7                              ; 5CC4   02B7

L_5CC5:
        MOVR    R0,     R1                      ; 5CC5   0081
        SLL     R1,     2                       ; 5CC6   004D
        SWAP    R1,     1                       ; 5CC7   0041
        ANDI    #$000F, R1                      ; 5CC8   03B9 000F
        MVII    #$000A, R2                      ; 5CCA   02BA 000A
        ADDR    R2,     R1                      ; 5CCC   00D1
        SLL     R1,     2                       ; 5CCD   004D
        SLL     R1,     1                       ; 5CCE   0049
        SDBD                                    ; 5CCF   0001
        ADDI    #$0800, R1                      ; 5CD0   02F9 0000 0008
        MOVR    R0,     R2                      ; 5CD3   0082
        ANDI    #$0038, R2                      ; 5CD4   03BA 0038
        SWAP    R2,     1                       ; 5CD6   0042
        SLR     R2,     2                       ; 5CD7   0066
        MOVR    R2,     R3                      ; 5CD8   0093
        SDBD                                    ; 5CD9   0001
        ANDI    #$0800, R3                      ; 5CDA   03BB 0000 0008
        TSTR    R3                              ; 5CDD   009B
        BEQ     L_5CF0                          ; 5CDE   0204 0010

        SLL     R3,     2                       ; 5CE0   004F
        SDBD                                    ; 5CE1   0001
        ANDI    #$F7FF, R2                      ; 5CE2   03BA 00FF 00F7
        ADDR    R3,     R2                      ; 5CE5   00DA
        SDBD                                    ; 5CE6   0001
        CMPI    #$2200, R2                      ; 5CE7   037A 0000 0022
        BNEQ    L_5CF0                          ; 5CEA   020C 0004

        SDBD                                    ; 5CEC   0001
        ADDI    #$1000, R2                      ; 5CED   02FA 0000 0010
L_5CF0:
        ANDI    #$0007, R0                      ; 5CF0   03B8 0007
        ADDR    R1,     R0                      ; 5CF2   00C8
        ADDR    R2,     R0                      ; 5CF3   00D0
        MOVR    R5,     R7                      ; 5CF4   00AF

L_5CF5:
        PSHR    R5                              ; 5CF5   0275
        MVII    #$0191, R5                      ; 5CF6   02BD 0191
        SDBD                                    ; 5CF8   0001
        MVI@    R5,     R4                      ; 5CF9   02AC
        MVII    #$0014, R0                      ; 5CFA   02B8 0014

        JSR     R5,     .EXEC.853               ; 5CFC   0004 0118 0053

        PULR    R7                              ; 5CFF   02B7

L_5D00:
        PSHR    R5                              ; 5D00   0275

        JSR     R5,     L_63C6                  ; 5D01   0004 0160 03C6

        CLRR    R0                              ; 5D04   01C0

        JSR     R5,     L_5BA0                  ; 5D05   0004 0158 03A0

        MVI     G_032D, R0                      ; 5D08   0280 032D
        SDBD                                    ; 5D0A   0001
        ANDI    #$FF80, R0                      ; 5D0B   03B8 0080 00FF
        ADDI    #$0008, R0                      ; 5D0E   02F8 0008
        MVO     R0,     G_032D                  ; 5D10   0240 032D
        MVII    #$0191, R5                      ; 5D12   02BD 0191
        SDBD                                    ; 5D14   0001
        MVI@    R5,     R4                      ; 5D15   02AC
        MVII    #$0014, R3                      ; 5D16   02BB 0014
L_5D18:
        MVII    #$0001, R0                      ; 5D18   02B8 0001

        JSR     R5,     X_RAND1                 ; 5D1A   0004 0114 027D

        SLL     R0,     1                       ; 5D1D   0048
        SDBD                                    ; 5D1E   0001
        MVII    #$6FCA, R5                      ; 5D1F   02BD 00CA 006F
        ADDR    R0,     R5                      ; 5D22   00C5
        SDBD                                    ; 5D23   0001
        MVI@    R5,     R0                      ; 5D24   02A8
        MVO@    R0,     R4                      ; 5D25   0260
        DECR    R3                              ; 5D26   0013
        BNEQ    L_5D18                          ; 5D27   022C 0010
        PULR    R7                              ; 5D29   02B7

L_5D2A:
        PSHR    R5                              ; 5D2A   0275
        MOVR    R1,     R4                      ; 5D2B   008C
        SDBD                                    ; 5D2C   0001
        MVII    #$6E4E, R5                      ; 5D2D   02BD 004E 006E
        SUBI    #$0020, R0                      ; 5D30   0338 0020
        SLL     R0,     1                       ; 5D32   0048
        ADDR    R0,     R5                      ; 5D33   00C5
        MVI@    R5,     R1                      ; 5D34   02A9
        PSHR    R5                              ; 5D35   0275

        JSR     R5,     L_5D3F                  ; 5D36   0004 015C 013F

        PULR    R5                              ; 5D39   02B5
        MVI@    R5,     R1                      ; 5D3A   02A9

        JSR     R5,     L_5D3F                  ; 5D3B   0004 015C 013F

        PULR    R7                              ; 5D3E   02B7

L_5D3F:
        PSHR    R5                              ; 5D3F   0275
        MVII    #$000A, R3                      ; 5D40   02BB 000A
L_5D42:
        RRC     R1,     1                       ; 5D42   0071
        BC      L_5D4B                          ; 5D43   0201 0006

        SDBD                                    ; 5D45   0001
        MVII    #$6FC8, R5                      ; 5D46   02BD 00C8 006F
        B       L_5D56                          ; 5D49   0200 000B

L_5D4B:
        MVII    #$0001, R0                      ; 5D4B   02B8 0001

        JSR     R5,     X_RAND1                 ; 5D4D   0004 0114 027D

        SLL     R0,     1                       ; 5D50   0048
        SDBD                                    ; 5D51   0001
        MVII    #$6FD0, R5                      ; 5D52   02BD 00D0 006F
        ADDR    R0,     R5                      ; 5D55   00C5
L_5D56:
        SDBD                                    ; 5D56   0001
        MVI@    R5,     R0                      ; 5D57   02A8
        MVO@    R0,     R4                      ; 5D58   0260
        DECR    R3                              ; 5D59   0013
        BNEQ    L_5D42                          ; 5D5A   022C 0019
        PULR    R7                              ; 5D5C   02B7

L_5D5D:
        PSHR    R5                              ; 5D5D   0275
        SDBD                                    ; 5D5E   0001
        MVII    #$6FC8, R5                      ; 5D5F   02BD 00C8 006F
        SDBD                                    ; 5D62   0001
        MVI@    R5,     R3                      ; 5D63   02AB

        JSR     R5,     L_5CF5                  ; 5D64   0004 015C 00F5

        SDBD                                    ; 5D67   0001
        MVII    #$6FD4, R5                      ; 5D68   02BD 00D4 006F
        SDBD                                    ; 5D6B   0001
        MVI@    R5,     R3                      ; 5D6C   02AB
        MVII    #$0191, R5                      ; 5D6D   02BD 0191
        SDBD                                    ; 5D6F   0001
        MVI@    R5,     R4                      ; 5D70   02AC
        ADDI    #$0006, R4                      ; 5D71   02FC 0006
        MVII    #$0008, R0                      ; 5D73   02B8 0008

        JSR     R5,     .EXEC.853               ; 5D75   0004 0118 0053

        PULR    R7                              ; 5D78   02B7

L_5D79:
        PSHR    R5                              ; 5D79   0275
        MVII    #$0014, R3                      ; 5D7A   02BB 0014
        MVII    #$0191, R5                      ; 5D7C   02BD 0191
        SDBD                                    ; 5D7E   0001
        MVI@    R5,     R4                      ; 5D7F   02AC
L_5D80:
        MVII    #$0001, R0                      ; 5D80   02B8 0001

        JSR     R5,     X_RAND1                 ; 5D82   0004 0114 027D

        SLL     R0,     1                       ; 5D85   0048
        SDBD                                    ; 5D86   0001
        MVII    #$6FD6, R5                      ; 5D87   02BD 00D6 006F
        ADDR    R0,     R5                      ; 5D8A   00C5
        SDBD                                    ; 5D8B   0001
        MVI@    R5,     R0                      ; 5D8C   02A8
        MVO@    R0,     R4                      ; 5D8D   0260
        DECR    R3                              ; 5D8E   0013
        BNEQ    L_5D80                          ; 5D8F   022C 0010
        PULR    R7                              ; 5D91   02B7

L_5D92:
        PSHR    R5                              ; 5D92   0275
        MVII    #$00F0, R0                      ; 5D93   02B8 00F0
        MVII    #$0200, R4                      ; 5D95   02BC 0200

        JSR     R5,     .EXEC.853               ; 5D97   0004 0118 0053

        PULR    R7                              ; 5D9A   02B7

L_5D9B:
        PSHR    R5                              ; 5D9B   0275
        MVI     G_0194, R3                      ; 5D9C   0283 0194
        CMPI    #$0001, R3                      ; 5D9E   037B 0001
        BNEQ    L_5DA6                          ; 5DA0   020C 0004

        CLRR    R3                              ; 5DA2   01DB

        JSR     R5,     L_5569                  ; 5DA3   0004 0154 0169

L_5DA6:
        CLRR    R3                              ; 5DA6   01DB

        JSR     R5,     L_5E59                  ; 5DA7   0004 015C 0259

        MVII    #$0100, R5                      ; 5DAA   02BD 0100
        MVII    #$0199, R4                      ; 5DAC   02BC 0199
        SDBD                                    ; 5DAE   0001
        MVI@    R5,     R0                      ; 5DAF   02A8
        MVO@    R0,     R4                      ; 5DB0   0260
        SWAP    R0,     1                       ; 5DB1   0040
        MVO@    R0,     R4                      ; 5DB2   0260
        SUBI    #$0002, R5                      ; 5DB3   033D 0002
        SDBD                                    ; 5DB5   0001
        MVII    #$5E85, R0                      ; 5DB6   02B8 0085 005E
        MVO@    R0,     R5                      ; 5DB9   0268
        SWAP    R0,     1                       ; 5DBA   0040
        MVO@    R0,     R5                      ; 5DBB   0268
        SDBD                                    ; 5DBC   0001
        MVII    #$6FC8, R5                      ; 5DBD   02BD 00C8 006F
        SDBD                                    ; 5DC0   0001
        MVI@    R5,     R3                      ; 5DC1   02AB

        JSR     R5,     L_5D92                  ; 5DC2   0004 015C 0192

        MVII    #$0206, R3                      ; 5DC5   02BB 0206
        MVII    #$023F, R4                      ; 5DC7   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 5DC9   0004 0118 007B
        STRING  "ENERGY.."                      ; 5DCC  
        DECLE   $0000                           ; 5DD4   0000

        MVII    #$0267, R4                      ; 5DD5   02BC 0267

        JSR     R5,     X_PRINT_R5              ; 5DD7   0004 0118 007B
        STRING  "SCORE..."                      ; 5DDA  
        DECLE   $0000                           ; 5DE2   0000

        MVII    #$028F, R4                      ; 5DE3   02BC 028F

        JSR     R5,     X_PRINT_R5              ; 5DE5   0004 0118 007B
        STRING  "SEAS...."                      ; 5DE8  
        DECLE   $0000                           ; 5DF0   0000

        MVII    #$0186, R5                      ; 5DF1   02BD 0186
        SDBD                                    ; 5DF3   0001
        MVI@    R5,     R0                      ; 5DF4   02A8
        MVII    #$0004, R1                      ; 5DF5   02B9 0004
        MVII    #$0249, R4                      ; 5DF7   02BC 0249

        JSR     R5,     X_PRNUM_RGT             ; 5DF9   0004 0118 00C5

        MVII    #$0188, R5                      ; 5DFC   02BD 0188
        SDBD                                    ; 5DFE   0001
        MVI@    R5,     R0                      ; 5DFF   02A8
        MVII    #$0004, R1                      ; 5E00   02B9 0004
        MVII    #$0206, R3                      ; 5E02   02BB 0206
        MVII    #$0271, R4                      ; 5E04   02BC 0271

        JSR     R5,     X_PRNUM_RGT             ; 5E06   0004 0118 00C5

        MVI     G_018A, R0                      ; 5E09   0280 018A
        MVII    #$0001, R1                      ; 5E0B   02B9 0001
        MVII    #$0206, R3                      ; 5E0D   02BB 0206
        MVII    #$029C, R4                      ; 5E0F   02BC 029C

        JSR     R5,     X_PRNUM_RGT             ; 5E11   0004 0118 00C5

        MVI     G_01AD, R0                      ; 5E14   0280 01AD
        RRC     R0,     1                       ; 5E16   0070
        BNC     L_5E21                          ; 5E17   0209 0008

        SDBD                                    ; 5E19   0001
        MVII    #$6FE0, R5                      ; 5E1A   02BD 00E0 006F
        SDBD                                    ; 5E1D   0001
        MVI@    R5,     R1                      ; 5E1E   02A9
        MVO     R1,     .BTAB.C3                ; 5E1F   0241 02C3
L_5E21:
        RRC     R0,     1                       ; 5E21   0070
        BNC     L_5E2C                          ; 5E22   0209 0008

        SDBD                                    ; 5E24   0001
        MVII    #$6FDE, R5                      ; 5E25   02BD 00DE 006F
        SDBD                                    ; 5E28   0001
        MVI@    R5,     R1                      ; 5E29   02A9
        MVO     R1,     .BTAB.C2                ; 5E2A   0241 02C2
L_5E2C:
        RRC     R0,     1                       ; 5E2C   0070
        BNC     L_5E37                          ; 5E2D   0209 0008

        SDBD                                    ; 5E2F   0001
        MVII    #$6FDE, R5                      ; 5E30   02BD 00DE 006F
        SDBD                                    ; 5E33   0001
        MVI@    R5,     R1                      ; 5E34   02A9
        MVO     R1,     .BTAB.C1                ; 5E35   0241 02C1
L_5E37:
        RRC     R0,     1                       ; 5E37   0070
        BNC     L_5E42                          ; 5E38   0209 0008

        SDBD                                    ; 5E3A   0001
        MVII    #$6FDC, R5                      ; 5E3B   02BD 00DC 006F
        SDBD                                    ; 5E3E   0001
        MVI@    R5,     R1                      ; 5E3F   02A9
        MVO     R1,     .BTAB.C0                ; 5E40   0241 02C0
L_5E42:
        RRC     R0,     1                       ; 5E42   0070
        BNC     L_5E4D                          ; 5E43   0209 0008

        SDBD                                    ; 5E45   0001
        MVII    #$6FE4, R5                      ; 5E46   02BD 00E4 006F
        SDBD                                    ; 5E49   0001
        MVI@    R5,     R1                      ; 5E4A   02A9
        MVO     R1,     .BTAB.BC                ; 5E4B   0241 02BC
L_5E4D:
        RRC     R0,     1                       ; 5E4D   0070
        BNC     L_5E58                          ; 5E4E   0209 0008

        SDBD                                    ; 5E50   0001
        MVII    #$6FE2, R5                      ; 5E51   02BD 00E2 006F
        SDBD                                    ; 5E54   0001
        MVI@    R5,     R1                      ; 5E55   02A9
        MVO     R1,     .BTAB.B8                ; 5E56   0241 02B8
L_5E58:
        PULR    R7                              ; 5E58   02B7

L_5E59:
        PSHR    R5                              ; 5E59   0275
        MVII    #$033D, R4                      ; 5E5A   02BC 033D
        MVII    #$0325, R2                      ; 5E5C   02BA 0325
        MVII    #$0008, R5                      ; 5E5E   02BD 0008
L_5E60:
        MVI@    R4,     R1                      ; 5E60   02A1
        TSTR    R1                              ; 5E61   0089
        BEQ     L_5E6B                          ; 5E62   0204 0007

        MVI@    R2,     R1                      ; 5E64   0291
        SDBD                                    ; 5E65   0001
        ANDI    #$F4FF, R1                      ; 5E66   03B9 00FF 00F4
        XORR    R3,     R1                      ; 5E69   01D9
        MVO@    R1,     R2                      ; 5E6A   0251
L_5E6B:
        INCR    R2                              ; 5E6B   000A
        DECR    R5                              ; 5E6C   0015
        BNEQ    L_5E60                          ; 5E6D   022C 000E
        PULR    R7                              ; 5E6F   02B7

L_5E70:
        PSHR    R5                              ; 5E70   0275
        CLRR    R0                              ; 5E71   01C0
        MVII    #$0008, R3                      ; 5E72   02BB 0008
        MVII    #$0344, R2                      ; 5E74   02BA 0344
L_5E76:
        MVI@    R2,     R1                      ; 5E76   0291
        TSTR    R1                              ; 5E77   0089
        BEQ     L_5E7C                          ; 5E78   0204 0002

        SETC                                    ; 5E7A   0007
        INCR    R7                              ; 5E7B   000F

L_5E7C:
        CLRC                                    ; 5E7C   0006
L_5E7D:
        RLC     R0,     1                       ; 5E7D   0050
        DECR    R2                              ; 5E7E   0012
        DECR    R3                              ; 5E7F   0013
        BNEQ    L_5E76                          ; 5E80   022C 000B

        MVO     R0,     G_0198                  ; 5E82   0240 0198
        PULR    R7                              ; 5E84   02B7

        PSHR    R5                              ; 5E85   0275
        MVO     R0,     .STIC.VIDEN             ; 5E86   0240 0020
        MVII    #$0325, R4                      ; 5E88   02BC 0325
        CLRR    R5                              ; 5E8A   01ED
        MVI@    R4,     R0                      ; 5E8B   02A0
        MVO@    R0,     R5                      ; 5E8C   0268
        MVI@    R4,     R0                      ; 5E8D   02A0
        MVO@    R0,     R5                      ; 5E8E   0268
        MVI@    R4,     R0                      ; 5E8F   02A0
        MVO@    R0,     R5                      ; 5E90   0268
        MVI@    R4,     R0                      ; 5E91   02A0
        MVO@    R0,     R5                      ; 5E92   0268
        MVI@    R4,     R0                      ; 5E93   02A0
        MVO@    R0,     R5                      ; 5E94   0268
        MVI@    R4,     R0                      ; 5E95   02A0
        MVO@    R0,     R5                      ; 5E96   0268
        MVI@    R4,     R0                      ; 5E97   02A0
        MVO@    R0,     R5                      ; 5E98   0268
        MVI@    R4,     R0                      ; 5E99   02A0
        MVO@    R0,     R5                      ; 5E9A   0268

        JSR     R5,     X_PLAY_NOTE             ; 5E9B   0004 0118 02BD

        MVI     G_01C3, R0                      ; 5E9E   0280 01C3
        TSTR    R0                              ; 5EA0   0080
        BEQ     L_5EA6                          ; 5EA1   0204 0003

        DECR    R0                              ; 5EA3   0010
        MVO     R0,     G_01C3                  ; 5EA4   0240 01C3
L_5EA6:
        PULR    R7                              ; 5EA6   02B7

L_5EA7:
        PSHR    R5                              ; 5EA7   0275
        MVI     G_0194, R0                      ; 5EA8   0280 0194
        CMPI    #$0001, R0                      ; 5EAA   0378 0001
        BNEQ    L_5EC9                          ; 5EAC   020C 001B

        JSR     R5,     L_5F0B                  ; 5EAE   0004 015C 030B

        MVI     G_018E, R0                      ; 5EB1   0280 018E
        CMPI    #$004A, R0                      ; 5EB3   0378 004A
        BLE     L_5EDB                          ; 5EB5   0206 0024

        MVI     G_032D, R0                      ; 5EB7   0280 032D
        MOVR    R0,     R1                      ; 5EB9   0081
        ANDI    #$007F, R1                      ; 5EBA   03B9 007F
        SUBI    #$0058, R1                      ; 5EBC   0339 0058
        ANDI    #$007F, R1                      ; 5EBE   03B9 007F
        SDBD                                    ; 5EC0   0001
        ANDI    #$FF80, R0                      ; 5EC1   03B8 0080 00FF
        ADDR    R1,     R0                      ; 5EC4   00C8
        MVO     R0,     G_032D                  ; 5EC5   0240 032D
        B       L_5EDB                          ; 5EC7   0200 0012

L_5EC9:
        CMPI    #$0002, R0                      ; 5EC9   0378 0002
        BNEQ    L_5ED2                          ; 5ECB   020C 0005

        JSR     R5,     L_5EFC                  ; 5ECD   0004 015C 02FC

        B       L_5EDB                          ; 5ED0   0200 0009

L_5ED2:
        SDBD                                    ; 5ED2   0001
        MVII    #$6FC6, R5                      ; 5ED3   02BD 00C6 006F
        SDBD                                    ; 5ED6   0001
        MVI@    R5,     R3                      ; 5ED7   02AB

        JSR     R5,     L_5D92                  ; 5ED8   0004 015C 0192

L_5EDB:
        SDBD                                    ; 5EDB   0001
        MVII    #$0B00, R3                      ; 5EDC   02BB 0000 000B

        JSR     R5,     L_5E59                  ; 5EDF   0004 015C 0259

        MVI     G_033F, R0                      ; 5EE2   0280 033F
        SDBD                                    ; 5EE4   0001
        CMPI    #$6B99, R0                      ; 5EE5   0378 0099 006B
        BNEQ    L_5EF2                          ; 5EE8   020C 0008

        MVI     G_0327, R0                      ; 5EEA   0280 0327
        SDBD                                    ; 5EEC   0001
        ANDI    #$F5FF, R0                      ; 5EED   03B8 00FF 00F5
        MVO     R0,     G_0327                  ; 5EF0   0240 0327
L_5EF2:
        MVII    #$0199, R5                      ; 5EF2   02BD 0199
        MVII    #$0100, R4                      ; 5EF4   02BC 0100
        SDBD                                    ; 5EF6   0001
        MVI@    R5,     R0                      ; 5EF7   02A8
        MVO@    R0,     R4                      ; 5EF8   0260
        SWAP    R0,     1                       ; 5EF9   0040
        MVO@    R0,     R4                      ; 5EFA   0260
        PULR    R7                              ; 5EFB   02B7

L_5EFC:
        PSHR    R5                              ; 5EFC   0275
        MVII    #$0002, R1                      ; 5EFD   02B9 0002
        MVI     G_018D, R0                      ; 5EFF   0280 018D
        MVII    #$0014, R3                      ; 5F01   02BB 0014
        ADDR    R3,     R0                      ; 5F03   00D8
        ANDI    #$007F, R0                      ; 5F04   03B8 007F
        MVO     R0,     G_018D                  ; 5F06   0240 018D
        CLRR    R2                              ; 5F08   01D2
        B       L_5F1A                          ; 5F09   0200 000F

L_5F0B:
        PSHR    R5                              ; 5F0B   0275
        MVII    #$0001, R1                      ; 5F0C   02B9 0001
        MVI     G_018E, R0                      ; 5F0E   0280 018E
        MVII    #$000C, R3                      ; 5F10   02BB 000C
        ADDR    R3,     R0                      ; 5F12   00D8
        MVO     R0,     G_018E                  ; 5F13   0240 018E

        JSR     R5,     L_5F34                  ; 5F15   0004 015C 0334

        MVII    #$0002, R2                      ; 5F18   02BA 0002
L_5F1A:
        MVO     R1,     G_0194                  ; 5F1A   0241 0194
L_5F1C:
        MVO     R2,     G_010F                  ; 5F1C   0242 010F
        PSHR    R3                              ; 5F1E   0273
        PSHR    R2                              ; 5F1F   0272

        JSR     R5,     L_54A9                  ; 5F20   0004 0154 00A9
        JSR     R5,     L_5482                  ; 5F23   0004 0154 0082

        PULR    R2                              ; 5F26   02B2
        PSHR    R2                              ; 5F27   0272

        JSR     R5,     L_5996                  ; 5F28   0004 0158 0196

        PULR    R2                              ; 5F2B   02B2
        PULR    R3                              ; 5F2C   02B3
        DECR    R3                              ; 5F2D   0013
        BNEQ    L_5F1C                          ; 5F2E   022C 0013

        JSR     R5,     L_5F34                  ; 5F30   0004 015C 0334

        PULR    R7                              ; 5F33   02B7

L_5F34:
        PSHR    R5                              ; 5F34   0275
        MVII    #$0330, R5                      ; 5F35   02BD 0330
        MVII    #$0003, R2                      ; 5F37   02BA 0003

        JSR     R4,     L_5F44                  ; 5F39   0004 005C 0344

        MVII    #$032E, R5                      ; 5F3C   02BD 032E
        MVII    #$0001, R2                      ; 5F3E   02BA 0001

        JSR     R4,     L_5F44                  ; 5F40   0004 005C 0344

        PULR    R7                              ; 5F43   02B7

L_5F44:
        MVI@    R5,     R0                      ; 5F44   02A8
        SDBD                                    ; 5F45   0001
        XORI    #$8000, R0                      ; 5F46   03F8 0000 0080
        DECR    R5                              ; 5F49   0015
        MVO@    R0,     R5                      ; 5F4A   0268
        DECR    R2                              ; 5F4B   0012
        BNEQ    L_5F44                          ; 5F4C   022C 0009
        MOVR    R4,     R7                      ; 5F4E   00A7

        PSHR    R5                              ; 5F4F   0275
        MVI     G_032D, R1                      ; 5F50   0281 032D
        ANDI    #$007F, R1                      ; 5F52   03B9 007F
        CMPI    #$0040, R1                      ; 5F54   0379 0040
        BLT     L_5F7B                          ; 5F56   0205 0023

        MVI     G_032D, R1                      ; 5F58   0281 032D
        SDBD                                    ; 5F5A   0001
        ANDI    #$FF80, R1                      ; 5F5B   03B9 0080 00FF
        ADDI    #$0040, R1                      ; 5F5E   02F9 0040
L_5F60:
        MVI     G_0136, R0                      ; 5F60   0280 0136

        JSR     R5,     X_EXT_SIGN_LO           ; 5F62   0004 0114 0268

        TSTR    R0                              ; 5F65   0080
        BMI     L_5F7B                          ; 5F66   020B 0013

        CLRR    R0                              ; 5F68   01C0
        MVII    #$0135, R5                      ; 5F69   02BD 0135
        MVO@    R0,     R5                      ; 5F6B   0268
        MVO@    R0,     R5                      ; 5F6C   0268
        MVO     R0,     G_0108                  ; 5F6D   0240 0108
        MVO     R1,     G_032D                  ; 5F6F   0241 032D
        MVI     G_0345, R0                      ; 5F71   0280 0345
        SDBD                                    ; 5F73   0001
        ANDI    #$FFF0, R0                      ; 5F74   03B8 00F0 00FF
        ADDI    #$0002, R0                      ; 5F77   02F8 0002
        MVO     R0,     G_0345                  ; 5F79   0240 0345
L_5F7B:
        PULR    R7                              ; 5F7B   02B7

        PSHR    R5                              ; 5F7C   0275
        MVI     G_018D, R0                      ; 5F7D   0280 018D
        CMPI    #$001C, R0                      ; 5F7F   0378 001C
        BLE     L_5F88                          ; 5F81   0206 0005

        CMPI    #$0077, R0                      ; 5F83   0378 0077
        BGE     L_5F88                          ; 5F85   020D 0001
        PULR    R7                              ; 5F87   02B7

L_5F88:
        MVI     G_032D, R1                      ; 5F88   0281 032D
        B       L_5F60                          ; 5F8A   0220 002B

        PSHR    R5                              ; 5F8C   0275

        JSR     R5,     L_6098                  ; 5F8D   0004 0160 0098

        MVI     G_01C5, R0                      ; 5F90   0280 01C5
        TSTR    R0                              ; 5F92   0080
        BNEQ    L_6012                          ; 5F93   020C 007D

        MVII    #$0003, R0                      ; 5F95   02B8 0003
        MVO     R0,     G_01C5                  ; 5F97   0240 01C5
        MVI     G_01C4, R0                      ; 5F99   0280 01C4
        TSTR    R0                              ; 5F9B   0080
        BNEQ    L_5FCA                          ; 5F9C   020C 002C

        MVI     G_018D, R0                      ; 5F9E   0280 018D
        CMPI    #$0075, R0                      ; 5FA0   0378 0075
        BGT     L_6008                          ; 5FA2   020E 0064

        CMPI    #$0052, R0                      ; 5FA4   0378 0052
        BGT     L_5FB0                          ; 5FA6   020E 0008

        CMPI    #$003B, R0                      ; 5FA8   0378 003B
        BGT     L_6008                          ; 5FAA   020E 005C

        CMPI    #$001E, R0                      ; 5FAC   0378 001E
        BLT     L_6008                          ; 5FAE   0205 0058

L_5FB0:
        MVII    #$0003, R0                      ; 5FB0   02B8 0003
        MVO     R0,     G_0194                  ; 5FB2   0240 0194
        MVI     G_0108, R0                      ; 5FB4   0280 0108

        JSR     R5,     X_EXT_SIGN_LO           ; 5FB6   0004 0114 0268

        NEGR    R0                              ; 5FB9   0020
        MVO     R0,     G_0126                  ; 5FBA   0240 0126
        CLRR    R2                              ; 5FBC   01D2
        MVO     R2,     G_0108                  ; 5FBD   0242 0108
        INCR    R2                              ; 5FBF   000A

        JSR     R5,     L_5542                  ; 5FC0   0004 0154 0142

        MVII    #$0009, R2                      ; 5FC3   02BA 0009

        JSR     R5,     L_5556                  ; 5FC5   0004 0154 0156

        B       L_5FF5                          ; 5FC8   0200 002B

L_5FCA:
        MVI     G_032D, R3                      ; 5FCA   0283 032D
        ANDI    #$007F, R3                      ; 5FCC   03BB 007F
        CMPI    #$0010, R3                      ; 5FCE   037B 0010
        BGT     L_5FDA                          ; 5FD0   020E 0008

        MVI     G_01C4, R0                      ; 5FD2   0280 01C4
        CMPI    #$0007, R0                      ; 5FD4   0378 0007
        BNEQ    L_5FF5                          ; 5FD6   020C 001D
        B       L_6008                          ; 5FD8   0200 002E

L_5FDA:
        CMPI    #$005F, R3                      ; 5FDA   037B 005F
        BGT     L_5FDF                          ; 5FDC   020E 0001
        PULR    R7                              ; 5FDE   02B7

L_5FDF:
        MVI     G_032D, R0                      ; 5FDF   0280 032D
        SDBD                                    ; 5FE1   0001
        ANDI    #$FF80, R0                      ; 5FE2   03B8 0080 00FF
        ADDI    #$0011, R0                      ; 5FE5   02F8 0011
        MVO     R0,     G_032D                  ; 5FE7   0240 032D
        MVI     G_01C4, R0                      ; 5FE9   0280 01C4
        DECR    R0                              ; 5FEB   0010
        MVO     R0,     G_01C4                  ; 5FEC   0240 01C4
        TSTR    R0                              ; 5FEE   0080
        BNEQ    L_6004                          ; 5FEF   020C 0013

        JSR     R5,     L_6325                  ; 5FF1   0004 0160 0325

        PULR    R7                              ; 5FF4   02B7

L_5FF5:
        MVI     G_032D, R0                      ; 5FF5   0280 032D
        SDBD                                    ; 5FF7   0001
        ANDI    #$FF80, R0                      ; 5FF8   03B8 0080 00FF
        ADDI    #$005F, R0                      ; 5FFB   02F8 005F
        MVO     R0,     G_032D                  ; 5FFD   0240 032D
        MVI     G_01C4, R0                      ; 5FFF   0280 01C4
        INCR    R0                              ; 6001   0008
        MVO     R0,     G_01C4                  ; 6002   0240 01C4

L_6004:
        JSR     R5,     L_62BF                  ; 6004   0004 0160 02BF

        PULR    R7                              ; 6007   02B7

L_6008:
        MVI     G_0136, R0                      ; 6008   0280 0136

        JSR     R5,     X_EXT_SIGN_LO           ; 600A   0004 0114 0268

        NEGR    R0                              ; 600D   0020
        BMI     L_6012                          ; 600E   020B 0002

        MVO     R0,     G_0136                  ; 6010   0240 0136
L_6012:
        PULR    R7                              ; 6012   02B7

        PSHR    R5                              ; 6013   0275
        MVI     G_018E, R0                      ; 6014   0280 018E
        CMPI    #$0017, R0                      ; 6016   0378 0017
        BGT     L_601B                          ; 6018   020E 0001
L_601A:
        PULR    R7                              ; 601A   02B7

L_601B:
        CMPI    #$0049, R0                      ; 601B   0378 0049
        BGT     L_6042                          ; 601D   020E 0023

        MVI     G_0196, R0                      ; 601F   0280 0196
        TSTR    R0                              ; 6021   0080
        BNEQ    L_6041                          ; 6022   020C 001D

        INCR    R0                              ; 6024   0008

        JSR     R5,     L_6224                  ; 6025   0004 0160 0224
        JSR     R5,     L_6C31                  ; 6028   0004 016C 0031

        MVII    #$0001, R0                      ; 602B   02B8 0001
        MVO     R0,     G_0196                  ; 602D   0240 0196
        MVI     G_010C, R0                      ; 602F   0280 010C

        JSR     R5,     X_EXT_SIGN_LO           ; 6031   0004 0114 0268

        SAR     R0,     2                       ; 6034   006C
        SAR     R0,     1                       ; 6035   0068
        MVO     R0,     G_010C                  ; 6036   0240 010C
        MVI     G_012A, R0                      ; 6038   0280 012A

        JSR     R5,     X_EXT_SIGN_LO           ; 603A   0004 0114 0268

        SAR     R0,     2                       ; 603D   006C
        SAR     R0,     1                       ; 603E   0068
        MVO     R0,     G_012A                  ; 603F   0240 012A
L_6041:
        PULR    R7                              ; 6041   02B7

L_6042:
        CMPI    #$004E, R0                      ; 6042   0378 004E
        BLE     L_601A                          ; 6044   0226 002B

        CMPI    #$0050, R0                      ; 6046   0378 0050
        BGT     L_604D                          ; 6048   020E 0003

        JSR     R5,     L_606C                  ; 604A   0004 0160 006C
L_604D:
        JSR     R5,     L_605E                  ; 604D   0004 0160 005E

        PULR    R7                              ; 6050   02B7

        PSHR    R5                              ; 6051   0275
        MVI     G_018E, R0                      ; 6052   0280 018E
        TSTR    R0                              ; 6054   0080
        BNEQ    L_605D                          ; 6055   020C 0006

        MVI     G_010C, R0                      ; 6057   0280 010C
        NEGR    R0                              ; 6059   0020
        SAR     R0,     2                       ; 605A   006C
        MVO     R0,     G_010C                  ; 605B   0240 010C
L_605D:
        PULR    R7                              ; 605D   02B7

L_605E:
        PSHR    R5                              ; 605E   0275
        MVI     G_010C, R0                      ; 605F   0280 010C

        JSR     R5,     X_EXT_SIGN_LO           ; 6061   0004 0114 0268

        TSTR    R0                              ; 6064   0080
        BPL     L_606B                          ; 6065   0203 0004

        NEGR    R0                              ; 6067   0020
        SAR     R0,     2                       ; 6068   006C
        MVO     R0,     G_010C                  ; 6069   0240 010C
L_606B:
        PULR    R7                              ; 606B   02B7

L_606C:
        PSHR    R5                              ; 606C   0275
        MVI     G_01AD, R0                      ; 606D   0280 01AD
        ANDI    #$000F, R0                      ; 606F   03B8 000F
        CMPI    #$000F, R0                      ; 6071   0378 000F
        BNEQ    L_6087                          ; 6073   020C 0012

        JSR     R5,     L_6BCB                  ; 6075   0004 0168 03CB

        MVI     G_02F6, R0                      ; 6078   0280 02F6
        SDBD                                    ; 607A   0001
        ANDI    #$FE0F, R0                      ; 607B   03B8 000F 00FE
        ADDI    #$0040, R0                      ; 607E   02F8 0040
        MVO     R0,     G_02F6                  ; 6080   0240 02F6
        MVII    #$0003, R2                      ; 6082   02BA 0003

        JSR     R5,     L_5556                  ; 6084   0004 0154 0156

L_6087:
        PULR    R7                              ; 6087   02B7

        PSHR    R5                              ; 6088   0275
        MVI     G_02F6, R0                      ; 6089   0280 02F6
        MVII    #$0003, R2                      ; 608B   02BA 0003
        ANDI    #$000F, R0                      ; 608D   03B8 000F
        CMPR    R2,     R0                      ; 608F   0150
        BNEQ    L_6097                          ; 6090   020C 0005

        MVO     R0,     G_02F6                  ; 6092   0240 02F6

        JSR     R5,     L_5542                  ; 6094   0004 0154 0142

L_6097:
        PULR    R7                              ; 6097   02B7

L_6098:
        PSHR    R5                              ; 6098   0275
        MVI     G_0194, R0                      ; 6099   0280 0194
        CMPI    #$0003, R0                      ; 609B   0378 0003
        BNEQ    L_60A5                          ; 609D   020C 0006

        MVII    #$0126, R3                      ; 609F   02BB 0126
        MVI     G_0325, R1                      ; 60A1   0281 0325
        B       L_60A9                          ; 60A3   0200 0004

L_60A5:
        MVII    #$012A, R3                      ; 60A5   02BB 012A
        MVI     G_0327, R1                      ; 60A7   0281 0327
L_60A9:
        ANDI    #$00FF, R1                      ; 60A9   03B9 00FF
        MVI@    R3,     R0                      ; 60AB   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 60AC   0004 0114 0268

        CMPI    #$0097, R1                      ; 60AF   0379 0097
        BGT     L_60BC                          ; 60B1   020E 0009

        CMPI    #$0018, R1                      ; 60B3   0379 0018
        BGT     L_60C2                          ; 60B5   020E 000B

        TSTR    R0                              ; 60B7   0080
        BPL     L_60C2                          ; 60B8   0203 0008
        B       L_60BF                          ; 60BA   0200 0003

L_60BC:
        TSTR    R0                              ; 60BC   0080
        BMI     L_60C2                          ; 60BD   020B 0003

L_60BF:
        NEGR    R0                              ; 60BF   0020
        SAR     R0,     1                       ; 60C0   0068
        MVO@    R0,     R3                      ; 60C1   0258
L_60C2:
        PULR    R7                              ; 60C2   02B7

        PSHR    R5                              ; 60C3   0275
        MVI     G_02F6, R0                      ; 60C4   0280 02F6
        CMPI    #$0003, R0                      ; 60C6   0378 0003
        BNEQ    L_60F0                          ; 60C8   020C 0026

        MVI     G_0197, R0                      ; 60CA   0280 0197
        TSTR    R0                              ; 60CC   0080
        BNEQ    L_60F0                          ; 60CD   020C 0021

        ADDI    #$001E, R0                      ; 60CF   02F8 001E
        MVO     R0,     G_0197                  ; 60D1   0240 0197
        MVO     R0,     G_034F                  ; 60D3   0240 034F
        MVII    #$0001, R0                      ; 60D5   02B8 0001
        MVO     R0,     G_01AC                  ; 60D7   0240 01AC

        JSR     R5,     L_6229                  ; 60D9   0004 0160 0229

        MVII    #$0186, R5                      ; 60DC   02BD 0186
        SDBD                                    ; 60DE   0001
        MVI@    R5,     R0                      ; 60DF   02A8
        SDBD                                    ; 60E0   0001
        MVI@    R5,     R1                      ; 60E1   02A9
        ADDR    R1,     R0                      ; 60E2   00C8
        SUBI    #$0002, R5                      ; 60E3   033D 0002
        MVO@    R0,     R5                      ; 60E5   0268
        SWAP    R0,     1                       ; 60E6   0040
        MVO@    R0,     R5                      ; 60E7   0268
        MVII    #$0046, R0                      ; 60E8   02B8 0046
        MVO     R0,     G_0126                  ; 60EA   0240 0126
        MVII    #$00FC, R0                      ; 60EC   02B8 00FC
        MVO     R0,     G_0136                  ; 60EE   0240 0136
L_60F0:
        PULR    R7                              ; 60F0   02B7

        PSHR    R5                              ; 60F1   0275
        MVI     G_0197, R0                      ; 60F2   0280 0197
        TSTR    R0                              ; 60F4   0080
        BNEQ    L_610D                          ; 60F5   020C 0016

        JSR     R5,     L_6C31                  ; 60F7   0004 016C 0031

        MVII    #$001E, R0                      ; 60FA   02B8 001E
        MVO     R0,     G_0197                  ; 60FC   0240 0197
        MVO     R0,     G_034F                  ; 60FE   0240 034F
        MVII    #$0001, R0                      ; 6100   02B8 0001
        CMPI    #$0005, R2                      ; 6102   037A 0005
        BLT     L_610A                          ; 6104   0205 0004

        JSR     R5,     L_6220                  ; 6106   0004 0160 0220

        PULR    R7                              ; 6109   02B7

L_610A:
        JSR     R5,     L_6222                  ; 610A   0004 0160 0222

L_610D:
        PULR    R7                              ; 610D   02B7

        PSHR    R5                              ; 610E   0275
        MVI     G_0197, R0                      ; 610F   0280 0197
        TSTR    R0                              ; 6111   0080
        BNEQ    L_6153                          ; 6112   020C 003F

        TSTR    R2                              ; 6114   0092
        BNEQ    L_613F                          ; 6115   020C 0028

        MVI     G_01AE, R0                      ; 6117   0280 01AE
        MVI     G_01AD, R1                      ; 6119   0281 01AD
        COMR    R0                              ; 611B   0018
        ANDR    R0,     R1                      ; 611C   0181
        COMR    R0                              ; 611D   0018
        XORR    R0,     R1                      ; 611E   01C1
        MVO     R1,     G_01AD                  ; 611F   0241 01AD
        MVI     G_018E, R0                      ; 6121   0280 018E
        CMPI    #$003E, R0                      ; 6123   0378 003E
        BLT     L_612B                          ; 6125   0205 0004

        MVII    #$01B2, R5                      ; 6127   02BD 01B2
        B       L_613D                          ; 6129   0200 0012

L_612B:
        CMPI    #$0032, R0                      ; 612B   0378 0032
        BLT     L_6133                          ; 612D   0205 0004

        MVII    #$01B1, R5                      ; 612F   02BD 01B1
        B       L_613D                          ; 6131   0200 000A

L_6133:
        CMPI    #$0026, R0                      ; 6133   0378 0026
        BLT     L_613B                          ; 6135   0205 0004

        MVII    #$01B0, R5                      ; 6137   02BD 01B0
        B       L_613D                          ; 6139   0200 0002

L_613B:
        MVII    #$01AF, R5                      ; 613B   02BD 01AF
L_613D:
        CLRR    R0                              ; 613D   01C0
        MVO@    R0,     R5                      ; 613E   0268

L_613F:
        JSR     R5,     L_6C3B                  ; 613F   0004 016C 003B

        MVII    #$001E, R0                      ; 6142   02B8 001E
        MVO     R0,     G_0197                  ; 6144   0240 0197
        MVO     R0,     G_034F                  ; 6146   0240 034F
        MVII    #$0001, R0                      ; 6148   02B8 0001
        PSHR    R2                              ; 614A   0272

        JSR     R5,     L_6229                  ; 614B   0004 0160 0229

        PULR    R2                              ; 614E   02B2
        MOVR    R2,     R3                      ; 614F   0093

        JSR     R5,     L_5569                  ; 6150   0004 0154 0169

L_6153:
        PULR    R7                              ; 6153   02B7

        PSHR    R5                              ; 6154   0275
        MVI     G_0197, R0                      ; 6155   0280 0197
        TSTR    R0                              ; 6157   0080
        BNEQ    L_616E                          ; 6158   020C 0014

        JSR     R5,     L_6C3B                  ; 615A   0004 016C 003B

        MVII    #$001E, R0                      ; 615D   02B8 001E
        MVO     R0,     G_0197                  ; 615F   0240 0197
        MVO     R0,     G_034F                  ; 6161   0240 034F
        MVII    #$0001, R0                      ; 6163   02B8 0001
        PSHR    R2                              ; 6165   0272

        JSR     R5,     L_622B                  ; 6166   0004 0160 022B

        PULR    R2                              ; 6169   02B2
        MOVR    R2,     R3                      ; 616A   0093

        JSR     R5,     L_5569                  ; 616B   0004 0154 0169

L_616E:
        PULR    R7                              ; 616E   02B7

        PSHR    R5                              ; 616F   0275
        MVI     G_01C7, R0                      ; 6170   0280 01C7
        TSTR    R0                              ; 6172   0080
        BEQ     L_6176                          ; 6173   0204 0001
        PULR    R7                              ; 6175   02B7

L_6176:
        MVII    #$032D, R1                      ; 6176   02B9 032D
        ADDR    R2,     R1                      ; 6178   00D1
        MVI@    R1,     R0                      ; 6179   0288
        MOVR    R2,     R3                      ; 617A   0093
        PSHR    R0                              ; 617B   0270
        PSHR    R1                              ; 617C   0271
        PSHR    R2                              ; 617D   0272

        JSR     R5,     L_5569                  ; 617E   0004 0154 0169

        MVII    #$0001, R0                      ; 6181   02B8 0001

        JSR     R5,     L_622B                  ; 6183   0004 0160 022B

        MVI     G_01C6, R0                      ; 6186   0280 01C6
        INCR    R0                              ; 6188   0008
        CMPI    #$0003, R0                      ; 6189   0378 0003
        BLT     L_61AE                          ; 618B   0205 0021

        MVI     G_01C4, R3                      ; 618D   0283 01C4
        MVI     G_018D, R2                      ; 618F   0282 018D
        CMPI    #$0046, R2                      ; 6191   037A 0046
        BLT     L_6197                          ; 6193   0205 0002

        ADDI    #$0008, R3                      ; 6195   02FB 0008
L_6197:
        ADDI    #$01B3, R3                      ; 6197   02FB 01B3
        MVI@    R3,     R1                      ; 6199   0299
        TSTR    R1                              ; 619A   0089
        BEQ     L_61B0                          ; 619B   0204 0013

        MVO     R1,     G_01AE                  ; 619D   0241 01AE
        PULR    R3                              ; 619F   02B3
        PULR    R0                              ; 61A0   02B0
        PULR    R0                              ; 61A1   02B0
        ADDI    #$0325, R3                      ; 61A2   02FB 0325
        MVO     R3,     G_01C7                  ; 61A4   0243 01C7
        SDBD                                    ; 61A6   0001
        MVII    #$6B3A, R4                      ; 61A7   02BC 003A 006B

        JSR     R5,     L_55AB                  ; 61AA   0004 0154 01AB

        PULR    R7                              ; 61AD   02B7

L_61AE:
        MVO     R0,     G_01C6                  ; 61AE   0240 01C6
L_61B0:
        PULR    R3                              ; 61B0   02B3
        PSHR    R3                              ; 61B1   0273
        ADDI    #$0325, R3                      ; 61B2   02FB 0325
        MVO     R3,     G_01C7                  ; 61B4   0243 01C7
        SDBD                                    ; 61B6   0001
        MVII    #$6653, R4                      ; 61B7   02BC 0053 0066

        JSR     R5,     L_55AB                  ; 61BA   0004 0154 01AB

        PULR    R3                              ; 61BD   02B3
        PULR    R1                              ; 61BE   02B1
        PULR    R0                              ; 61BF   02B0
        MVO@    R0,     R1                      ; 61C0   0248
        ANDI    #$007F, R0                      ; 61C1   03B8 007F
        MVII    #$0126, R1                      ; 61C3   02B9 0126
        SLL     R3,     1                       ; 61C5   004B
        ADDR    R3,     R1                      ; 61C6   00D9
        MVI@    R1,     R2                      ; 61C7   028A
        ADDR    R0,     R2                      ; 61C8   00C2
        MVO@    R2,     R1                      ; 61C9   024A
        PULR    R7                              ; 61CA   02B7

        PSHR    R5                              ; 61CB   0275
        MVI     G_01C7, R0                      ; 61CC   0280 01C7
        TSTR    R0                              ; 61CE   0080
        BEQ     L_61D2                          ; 61CF   0204 0001
        PULR    R7                              ; 61D1   02B7

L_61D2:
        MOVR    R2,     R3                      ; 61D2   0093

        JSR     R5,     L_5569                  ; 61D3   0004 0154 0169

        MVI     G_01AE, R0                      ; 61D6   0280 01AE
        MVI     G_01AD, R1                      ; 61D8   0281 01AD
        COMR    R0                              ; 61DA   0018
        ANDR    R0,     R1                      ; 61DB   0181
        COMR    R0                              ; 61DC   0018
        XORR    R0,     R1                      ; 61DD   01C1
        MVO     R1,     G_01AD                  ; 61DE   0241 01AD
        CLRR    R1                              ; 61E0   01C9
        MVI     G_01C4, R3                      ; 61E1   0283 01C4
        MVI     G_018D, R2                      ; 61E3   0282 018D
        CMPI    #$0046, R2                      ; 61E5   037A 0046
        BLT     L_61EB                          ; 61E7   0205 0002

        ADDI    #$0008, R3                      ; 61E9   02FB 0008
L_61EB:
        ADDI    #$01B3, R3                      ; 61EB   02FB 01B3
        MVO@    R1,     R3                      ; 61ED   0259
        MVII    #$0001, R0                      ; 61EE   02B8 0001

        JSR     R5,     L_6229                  ; 61F0   0004 0160 0229
        JSR     R5,     L_6C3B                  ; 61F3   0004 016C 003B

        MVII    #$000A, R3                      ; 61F6   02BB 000A
        MVO     R3,     G_01C7                  ; 61F8   0243 01C7
        MVO     R3,     G_034E                  ; 61FA   0243 034E
        PULR    R7                              ; 61FC   02B7

        CLRR    R0                              ; 61FD   01C0
        MVO     R0,     G_01C7                  ; 61FE   0240 01C7
        MOVR    R5,     R7                      ; 6200   00AF

        PSHR    R5                              ; 6201   0275
        MVI     G_01C7, R0                      ; 6202   0280 01C7
        TSTR    R0                              ; 6204   0080
        BNEQ    L_621F                          ; 6205   020C 0018

        MVO     R0,     G_0195                  ; 6207   0240 0195
        MVII    #$0004, R0                      ; 6209   02B8 0004

        JSR     R5,     X_RAND1                 ; 620B   0004 0114 027D
        JSR     R5,     L_578D                  ; 620E   0004 0154 038D
        JSR     R5,     L_6C31                  ; 6211   0004 016C 0031

        MVII    #$0001, R0                      ; 6214   02B8 0001

        JSR     R5,     L_6220                  ; 6216   0004 0160 0220

        MVII    #$000A, R0                      ; 6219   02B8 000A
        MVO     R0,     G_01C7                  ; 621B   0240 01C7
        MVO     R0,     G_034E                  ; 621D   0240 034E
L_621F:
        PULR    R7                              ; 621F   02B7

L_6220:
        ADDI    #$0005, R0                      ; 6220   02F8 0005
L_6222:
        ADDI    #$0004, R0                      ; 6222   02F8 0004
L_6224:
        MVI     G_018C, R1                      ; 6224   0281 018C
        NEGR    R1                              ; 6226   0021
        B       L_622F                          ; 6227   0200 0006

L_6229:
        ADDI    #$0005, R0                      ; 6229   02F8 0005
L_622B:
        ADDI    #$0004, R0                      ; 622B   02F8 0004
        MVI     G_018B, R1                      ; 622D   0281 018B
L_622F:
        PSHR    R5                              ; 622F   0275

        JSR     R5,     X_MPY                   ; 6230   0004 011C 01DC

        MVII    #$0186, R5                      ; 6233   02BD 0186
        SDBD                                    ; 6235   0001
        MVI@    R5,     R0                      ; 6236   02A8
        ADDR    R2,     R0                      ; 6237   00D0
        SUBI    #$0002, R5                      ; 6238   033D 0002
        MVO@    R0,     R5                      ; 623A   0268
        SWAP    R0,     1                       ; 623B   0040
        MVO@    R0,     R5                      ; 623C   0268
        PULR    R7                              ; 623D   02B7

        PSHR    R5                              ; 623E   0275
        MVII    #$0186, R5                      ; 623F   02BD 0186
        SDBD                                    ; 6241   0001
        MVI@    R5,     R0                      ; 6242   02A8
        DECR    R0                              ; 6243   0010
        SUBI    #$0002, R5                      ; 6244   033D 0002
        MVO@    R0,     R5                      ; 6246   0268
        SWAP    R0,     1                       ; 6247   0040
        MVO@    R0,     R5                      ; 6248   0268
        PULR    R7                              ; 6249   02B7

L_624A:
        PSHR    R5                              ; 624A   0275
        MVI     G_018A, R0                      ; 624B   0280 018A
        INCR    R0                              ; 624D   0008
        CMPI    #$0008, R0                      ; 624E   0378 0008
        BGE     L_629D                          ; 6250   020D 004B

        MVO     R0,     G_018A                  ; 6252   0240 018A
        SDBD                                    ; 6254   0001
        MVII    #$62AF, R5                      ; 6255   02BD 00AF 0062
        SLL     R0,     1                       ; 6258   0048
        ADDR    R0,     R5                      ; 6259   00C5
        SDBD                                    ; 625A   0001
        MVI@    R5,     R0                      ; 625B   02A8
        MVII    #$018B, R5                      ; 625C   02BD 018B
        MVO@    R0,     R5                      ; 625E   0268
        SWAP    R0,     1                       ; 625F   0040
        MVO@    R0,     R5                      ; 6260   0268
        CLRR    R0                              ; 6261   01C0
        MVO     R0,     G_02F6                  ; 6262   0240 02F6
        MVO     R0,     G_01AC                  ; 6264   0240 01AC
        MVO     R0,     G_01AD                  ; 6266   0240 01AD
        MVO     R0,     G_01C9                  ; 6268   0240 01C9
        MVII    #$0064, R0                      ; 626A   02B8 0064
        MVII    #$0186, R5                      ; 626C   02BD 0186
        MVO@    R0,     R5                      ; 626E   0268
        SWAP    R0,     1                       ; 626F   0040
        MVO@    R0,     R5                      ; 6270   0268
        INCR    R7                              ; 6271   000F

L_6272:
        PSHR    R5                              ; 6272   0275
L_6273:
        MVII    #$01B3, R4                      ; 6273   02BC 01B3
        MVII    #$0010, R0                      ; 6275   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 6277   0004 0114 0338

        SDBD                                    ; 627A   0001
        MVII    #$6C48, R4                      ; 627B   02BC 0048 006C
        MVI     G_018A, R0                      ; 627E   0280 018A
        SLL     R0,     2                       ; 6280   004C
        ADDR    R0,     R4                      ; 6281   00C4
        MOVR    R0,     R2                      ; 6282   0082
        MVII    #$01AF, R5                      ; 6283   02BD 01AF
        MVI@    R4,     R0                      ; 6285   02A0
        MVO@    R0,     R5                      ; 6286   0268
        MVI@    R4,     R0                      ; 6287   02A0
        MVO@    R0,     R5                      ; 6288   0268
        MVI@    R4,     R0                      ; 6289   02A0
        MVO@    R0,     R5                      ; 628A   0268
        MVI@    R4,     R0                      ; 628B   02A0
        MVO@    R0,     R5                      ; 628C   0268
        SDBD                                    ; 628D   0001
        MVII    #$6C68, R4                      ; 628E   02BC 0068 006C
        SLL     R2,     1                       ; 6291   004A
        ADDR    R2,     R4                      ; 6292   00D4
        MVII    #$01B3, R3                      ; 6293   02BB 01B3

        JSR     R5,     L_629E                  ; 6295   0004 0160 029E

        MVII    #$01BB, R3                      ; 6298   02BB 01BB

        JSR     R5,     L_629E                  ; 629A   0004 0160 029E

L_629D:
        PULR    R7                              ; 629D   02B7

L_629E:
        PSHR    R5                              ; 629E   0275
        MVII    #$0004, R2                      ; 629F   02BA 0004
L_62A1:
        PSHR    R3                              ; 62A1   0273
        MVI@    R4,     R0                      ; 62A2   02A0
        MOVR    R0,     R1                      ; 62A3   0081
        SLL     R1,     1                       ; 62A4   0049
        SWAP    R1,     1                       ; 62A5   0041
        ANDI    #$0007, R1                      ; 62A6   03B9 0007
        ADDR    R1,     R3                      ; 62A8   00CB
        MVO@    R0,     R3                      ; 62A9   0258
        PULR    R3                              ; 62AA   02B3
        DECR    R2                              ; 62AB   0012
        BNEQ    L_62A1                          ; 62AC   022C 000C
        PULR    R7                              ; 62AE   02B7

        DECLE   $0001,  $0001,  $0001,  $0001   ; 62AF   0001 0001 0001 0001
        DECLE   $0001,  $0002,  $0001,  $0002   ; 62B3   0001 0002 0001 0002
        DECLE   $0002,  $0003,  $0002,  $0003   ; 62B7   0002 0003 0002 0003
        DECLE   $0003,  $0003,  $0003,  $0004   ; 62BB   0003 0003 0003 0004
L_62BF:
        PSHR    R5                              ; 62BF   0275
        DIS                                     ; 62C0   0003

        JSR     R5,     .EXEC.A83               ; 62C1   0004 0118 0283

        MVII    #$0007, R2                      ; 62C4   02BA 0007
        MVII    #$0001, R3                      ; 62C6   02BB 0001

        JSR     R5,     L_5567                  ; 62C8   0004 0154 0167

        SDBD                                    ; 62CB   0001
        MVII    #$6FC6, R5                      ; 62CC   02BD 00C6 006F
        SDBD                                    ; 62CF   0001
        MVI@    R5,     R3                      ; 62D0   02AB

        JSR     R5,     L_5D92                  ; 62D1   0004 015C 0192

        CLRR    R3                              ; 62D4   01DB
        MVO     R3,     G_01C6                  ; 62D5   0243 01C6
L_62D7:
        PSHR    R3                              ; 62D7   0273
        SLL     R3,     1                       ; 62D8   004B
        SDBD                                    ; 62D9   0001
        MVII    #$6317, R5                      ; 62DA   02BD 0017 0063
        ADDR    R3,     R5                      ; 62DD   00DD
        SLR     R3,     1                       ; 62DE   0063
        SDBD                                    ; 62DF   0001
        MVI@    R5,     R4                      ; 62E0   02AC
        ADDI    #$0326, R3                      ; 62E1   02FB 0326

        JSR     R5,     L_55AB                  ; 62E3   0004 0154 01AB

        PULR    R3                              ; 62E6   02B3
        MOVR    R3,     R0                      ; 62E7   0098
        MVII    #$000A, R1                      ; 62E8   02B9 000A

        JSR     R5,     X_MPY                   ; 62EA   0004 011C 01DC

        ADDI    #$001A, R2                      ; 62ED   02FA 001A
        MVII    #$032E, R1                      ; 62EF   02B9 032E
        ADDR    R3,     R1                      ; 62F1   00D9
        MVI@    R1,     R0                      ; 62F2   0288
        SDBD                                    ; 62F3   0001
        ANDI    #$FF80, R0                      ; 62F4   03B8 0080 00FF
        ADDR    R2,     R0                      ; 62F7   00D0
        MVO@    R0,     R1                      ; 62F8   0248
        MOVR    R3,     R1                      ; 62F9   0099
        ADDI    #$0326, R1                      ; 62FA   02F9 0326
        MVI@    R1,     R4                      ; 62FC   028C
        MVII    #$0007, R0                      ; 62FD   02B8 0007

        JSR     R5,     X_RAND1                 ; 62FF   0004 0114 027D

        SDBD                                    ; 6302   0001
        ANDI    #$FF00, R4                      ; 6303   03BC 0000 00FF
        ADDR    R0,     R4                      ; 6306   00C4
        MVO@    R4,     R1                      ; 6307   024C
        SLL     R3,     1                       ; 6308   004B
        MVII    #$0128, R1                      ; 6309   02B9 0128
        ADDR    R3,     R1                      ; 630B   00D9
        MVI@    R1,     R0                      ; 630C   0288
        ADDR    R2,     R0                      ; 630D   00D0
        MVO@    R0,     R1                      ; 630E   0248
        SLR     R3,     1                       ; 630F   0063
        INCR    R3                              ; 6310   000B
        CMPI    #$0007, R3                      ; 6311   037B 0007
        BLT     L_62D7                          ; 6313   0225 003D

        EIS                                     ; 6315   0002
        PULR    R7                              ; 6316   02B7

        RLC     R3,     1                       ; 6317   0053
        SLR     R2,     2                       ; 6318   0066
        MOVR    R3,     R1                      ; 6319   0099
        SLR     R2,     2                       ; 631A   0066
        RLC     R3,     1                       ; 631B   0053
        SLR     R2,     2                       ; 631C   0066
        RLC     R3,     1                       ; 631D   0053
        SLR     R2,     2                       ; 631E   0066
        MOVR    R3,     R1                      ; 631F   0099
        SLR     R2,     2                       ; 6320   0066
        MOVR    R3,     R1                      ; 6321   0099
        SLR     R2,     2                       ; 6322   0066
        RLC     R3,     1                       ; 6323   0053
        SLR     R2,     2                       ; 6324   0066
L_6325:
        PSHR    R5                              ; 6325   0275
        MVII    #$0002, R0                      ; 6326   02B8 0002
        MVO     R0,     G_0194                  ; 6328   0240 0194
        MVI     G_032D, R0                      ; 632A   0280 032D
        SDBD                                    ; 632C   0001
        ANDI    #$FF80, R0                      ; 632D   03B8 0080 00FF
        ADDI    #$0008, R0                      ; 6330   02F8 0008
        MVO     R0,     G_032D                  ; 6332   0240 032D
        MVI     G_0126, R0                      ; 6334   0280 0126

        JSR     R5,     X_EXT_SIGN_LO           ; 6336   0004 0114 0268

        NEGR    R0                              ; 6339   0020
        MVO     R0,     G_0108                  ; 633A   0240 0108
        CLRR    R0                              ; 633C   01C0
        MVO     R0,     G_0126                  ; 633D   0240 0126
        MVI     G_0325, R0                      ; 633F   0280 0325
        SDBD                                    ; 6341   0001
        ANDI    #$FF00, R0                      ; 6342   03B8 0000 00FF
        ADDI    #$0058, R0                      ; 6345   02F8 0058
        MVO     R0,     G_0325                  ; 6347   0240 0325
        MVII    #$0009, R2                      ; 6349   02BA 0009

        JSR     R5,     L_5542                  ; 634B   0004 0154 0142

        MVII    #$0007, R2                      ; 634E   02BA 0007
        MVII    #$0001, R3                      ; 6350   02BB 0001

        JSR     R5,     L_5567                  ; 6352   0004 0154 0167

        MVII    #$0001, R2                      ; 6355   02BA 0001

        JSR     R5,     L_5556                  ; 6357   0004 0154 0156

        MVII    #$000F, R0                      ; 635A   02B8 000F
        MVO     R0,     G_01C5                  ; 635C   0240 01C5
        DIS                                     ; 635E   0003
        MVII    #$0002, R1                      ; 635F   02B9 0002
        MVO     R1,     G_0194                  ; 6361   0241 0194
        MVI     G_018D, R0                      ; 6363   0280 018D
        MVII    #$0014, R3                      ; 6365   02BB 0014
        ADDR    R3,     R0                      ; 6367   00D8
        ANDI    #$007F, R0                      ; 6368   03B8 007F
        MVO     R0,     G_018D                  ; 636A   0240 018D
        CLRR    R2                              ; 636C   01D2
L_636D:
        MVO     R2,     G_010F                  ; 636D   0242 010F
        PSHR    R3                              ; 636F   0273
        PSHR    R2                              ; 6370   0272

        JSR     R5,     L_54A9                  ; 6371   0004 0154 00A9

        DIS                                     ; 6374   0003

        JSR     R5,     L_5482                  ; 6375   0004 0154 0082

        DIS                                     ; 6378   0003
        PULR    R2                              ; 6379   02B2
        PSHR    R2                              ; 637A   0272

        JSR     R5,     L_5996                  ; 637B   0004 0158 0196

        DIS                                     ; 637E   0003
        PULR    R2                              ; 637F   02B2
        PULR    R3                              ; 6380   02B3
        DECR    R3                              ; 6381   0013
        BNEQ    L_636D                          ; 6382   022C 0016

        EIS                                     ; 6384   0002

        JSR     R5,     L_6C09                  ; 6385   0004 016C 0009

        PULR    R7                              ; 6388   02B7

        PSHR    R5                              ; 6389   0275
        MVII    #$0326, R5                      ; 638A   02BD 0326
        MVII    #$0001, R3                      ; 638C   02BB 0001
L_638E:
        MVI@    R5,     R0                      ; 638E   02A8
        MOVR    R0,     R1                      ; 638F   0081
        ANDI    #$00FF, R1                      ; 6390   03B9 00FF
        CMPI    #$00B0, R1                      ; 6392   0379 00B0
        BLT     L_63A9                          ; 6394   0205 0013

        SDBD                                    ; 6396   0001
        ANDI    #$FF00, R0                      ; 6397   03B8 0000 00FF
        SLL     R3,     1                       ; 639A   004B
        MVII    #$0126, R1                      ; 639B   02B9 0126
        ADDR    R3,     R1                      ; 639D   00D9
        SLR     R3,     1                       ; 639E   0063
        MVI@    R1,     R1                      ; 639F   0289
        ANDI    #$0080, R1                      ; 63A0   03B9 0080
        TSTR    R1                              ; 63A2   0089
        BEQ     L_63A7                          ; 63A3   0204 0002

        ADDI    #$00A8, R0                      ; 63A5   02F8 00A8
L_63A7:
        DECR    R5                              ; 63A7   0015
        MVO@    R0,     R5                      ; 63A8   0268
L_63A9:
        INCR    R3                              ; 63A9   000B
        CMPI    #$0008, R3                      ; 63AA   037B 0008
        BLT     L_638E                          ; 63AC   0225 001F
        PULR    R7                              ; 63AE   02B7

        MVI     G_01C5, R0                      ; 63AF   0280 01C5
        TSTR    R0                              ; 63B1   0080
        BEQ     L_63B7                          ; 63B2   0204 0003

        DECR    R0                              ; 63B4   0010
        MVO     R0,     G_01C5                  ; 63B5   0240 01C5
L_63B7:
        MOVR    R5,     R7                      ; 63B7   00AF

L_63B8:
        PSHR    R5                              ; 63B8   0275
        MVII    #$0325, R3                      ; 63B9   02BB 0325
        SDBD                                    ; 63BB   0001
        MVII    #$63D1, R4                      ; 63BC   02BC 00D1 0063

        JSR     R5,     L_55AB                  ; 63BF   0004 0154 01AB

        CLRR    R0                              ; 63C2   01C0
        MVO     R0,     G_0195                  ; 63C3   0240 0195
        PULR    R7                              ; 63C5   02B7

L_63C6:
        PSHR    R5                              ; 63C6   0275

        JSR     R5,     L_63B8                  ; 63C7   0004 0160 03B8

        MVI     G_0345, R0                      ; 63CA   0280 0345
        ADDI    #$0002, R0                      ; 63CC   02F8 0002
        MVO     R0,     G_0345                  ; 63CE   0240 0345
        PULR    R7                              ; 63D0   02B7

        DECLE   $0058,  $0009,  $00A4,  $0000   ; 63D1   0058 0009 00A4 0000
        DECLE   $0000                           ; 63D5   0000

        DECR    R0                              ; 63D6   0010
        ADDR    R3,     R7                      ; 63D7   00DF

        DECLE   $0063,  $0000,  $0000,  $0000   ; 63D8   0063 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001B   ; 63DC   0000 0000 0000 001B
        DECLE   $0064,  $00EB,  $0063,  $0003   ; 63E0   0064 00EB 0063 0003
        DECLE   $0304,  $00FB,  $005A,  $007C   ; 63E4   0304 00FB 005A 007C
        DECLE   $005F,  $008C,  $005F,  $0000   ; 63E8   005F 008C 005F 0000
        DECLE   $0000,  $0000,  $0007,  $000E   ; 63EC   0000 0000 0007 000E
        DECLE   $001C,  $0018,  $0038,  $0038   ; 63F0   001C 0018 0038 0038
        DECLE   $00FE,  $0078,  $0070,  $0060   ; 63F4   00FE 0078 0070 0060
        DECLE   $0020,  $0030,  $0018,  $0000   ; 63F8   0020 0030 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $00FE   ; 6400   0000 0000 0038 00FE
        DECLE   $007C,  $0038,  $0018,  $0018   ; 6404   007C 0038 0018 0018
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6408   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 640C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6410   0000 0000 0000 0000
        DECLE   $0060,  $00E0,  $0020,  $007C   ; 6414   0060 00E0 0020 007C
        DECLE   $00FF                           ; 6418   00FF

        ADDR    R7,     R6                      ; 6419   00FE
        SARC    R0,     2                       ; 641A   007C
        CLRR    R0                              ; 641B   01C0
        MVO     R0,     G_0195                  ; 641C   0240 0195
        MVI     G_0345, R0                      ; 641E   0280 0345
        SDBD                                    ; 6420   0001
        ANDI    #$FFF0, R0                      ; 6421   03B8 00F0 00FF
        MVO     R0,     G_0345                  ; 6424   0240 0345
        MOVR    R5,     R7                      ; 6426   00AF

L_6427:
        PSHR    R5                              ; 6427   0275
        MVII    #$0002, R2                      ; 6428   02BA 0002
        MVII    #$0327, R3                      ; 642A   02BB 0327
        SDBD                                    ; 642C   0001
        MVII    #$6434, R4                      ; 642D   02BC 0034 0064

        JSR     R5,     L_55A9                  ; 6430   0004 0154 01A9

        PULR    R7                              ; 6433   02B7

        DECLE   $0050,  $0089,  $00C0,  $0080   ; 6434   0050 0089 00C0 0080
        DECLE   $0003,  $0020,  $0050,  $0064   ; 6438   0003 0020 0050 0064
        DECLE   $0020,  $0000,  $0010,  $0000   ; 643C   0020 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $00C8   ; 6440   0000 0000 0000 00C8
        DECLE   $0080,  $00C0,  $0003,  $0020   ; 6444   0080 00C0 0003 0020
        DECLE   $0056,  $0064,  $0020,  $0000   ; 6448   0056 0064 0020 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 644C   0000 0000 0008 0000
        DECLE   $005C,  $0064,  $0060,  $0064   ; 6450   005C 0064 0060 0064
        DECLE   $000A,  $0000,  $005F,  $0064   ; 6454   000A 0000 005F 0064
        DECLE   $00F0,  $0064,  $000A,  $0000   ; 6458   00F0 0064 000A 0000

        CLRR    R0                              ; 645C   01C0
        MVO     R0,     G_0197                  ; 645D   0240 0197
        MOVR    R5,     R7                      ; 645F   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6460   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6464   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6468   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6470   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6474   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6478   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E6   ; 647C   0000 0000 0000 00E6
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6480   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6484   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6488   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0055   ; 648C   0000 0001 0000 0055
        DECLE   $0000,  $0003,  $0003,  $0001   ; 6490   0000 0003 0003 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6494   0001 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 6498   0000 0001 0000 0000
        DECLE   $0002,  $0001,  $0000,  $00A5   ; 649C   0002 0001 0000 00A5
        DECLE   $0007,  $003F,  $007F,  $00FF   ; 64A0   0007 003F 007F 00FF
        DECLE   $00DF,  $00F8,  $0060,  $0060   ; 64A4   00DF 00F8 0060 0060
        DECLE   $0000,  $0000,  $0002,  $0000   ; 64A8   0000 0000 0002 0000
        DECLE   $0000,  $0080,  $0020,  $007C   ; 64AC   0000 0080 0020 007C
        DECLE   $0003,  $000E,  $001F,  $003F   ; 64B0   0003 000E 001F 003F
        DECLE   $007F,  $00FE,  $00FF,  $00D8   ; 64B4   007F 00FE 00FF 00D8
        DECLE   $00F0,  $0060,  $0060,  $0000   ; 64B8   00F0 0060 0060 0000
        DECLE   $0000,  $0008,  $0000,  $0055   ; 64BC   0000 0008 0000 0055
        DECLE   $0000,  $0004,  $000D,  $000F   ; 64C0   0000 0004 000D 000F
        DECLE   $001F,  $003F,  $007E,  $007F   ; 64C4   001F 003F 007E 007F
        DECLE   $00FC,  $00F8,  $00D0,  $00F0   ; 64C8   00FC 00F8 00D0 00F0
        DECLE   $0060,  $0062,  $0000,  $0084   ; 64CC   0060 0062 0000 0084
        DECLE   $0000,  $0000,  $0000           ; 64D0   0000 0000 0000

        EIS                                     ; 64D3   0002
        EIS                                     ; 64D4   0002
        CLRC                                    ; 64D5   0006
        SETC                                    ; 64D6   0007
        INCR    R7                              ; 64D7   000F

        COMR    R6                              ; 64D8   001E
L_64D9:
        RSWD    R4                              ; 64D9   003C
        RSWD    R4                              ; 64DA   003C
        SARC    R1,     2                       ; 64DB   007D
        SARC    R0,     2                       ; 64DC   007C
        SARC    R2,     2                       ; 64DD   007E
        SARC    R0,     2                       ; 64DE   007C
        MOVR    R5,     R7                      ; 64DF   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E0   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0040,  $0000   ; 64E4   0008 0000 0040 0000
        DECLE   $0044,  $0000,  $0085,  $0010   ; 64E8   0044 0000 0085 0010
        DECLE   $00C6,  $007C,  $0038,  $0069   ; 64EC   00C6 007C 0038 0069
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6500   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6504   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6508   0000 0000 0000 0000
        DECLE   $0018,  $001E,  $000B,  $00C3   ; 650C   0018 001E 000B 00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6510   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0038   ; 6514   0000 0030 0030 0038
        DECLE   $003C,  $0034,  $003C,  $00BD   ; 6518   003C 0034 003C 00BD
        DECLE   $003C,  $007E,  $003F,  $0042   ; 651C   003C 007E 003F 0042
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; 6520   0000 0000 00C0 00E0
        DECLE   $00B0,  $00F9,  $00FC,  $00FF   ; 6524   00B0 00F9 00FC 00FF
        DECLE   $00FE,  $00BC,  $001C,  $001C   ; 6528   00FE 00BC 001C 001C
        DECLE   $003E,  $0037,  $0020,  $005B   ; 652C   003E 0037 0020 005B
        DECLE   $00C0,  $0080,  $00C0,  $00E0   ; 6530   00C0 0080 00C0 00E0
        DECLE   $00F0,  $00FC,  $003A,  $0030   ; 6534   00F0 00FC 003A 0030
        DECLE   $0020,  $0000,  $0008,  $0000   ; 6538   0020 0000 0008 0000
        DECLE   $0022,  $0014,  $0000,  $00C9   ; 653C   0022 0014 0000 00C9
        DECLE   $0000,  $0000,  $00C4,  $00FC   ; 6540   0000 0000 00C4 00FC
        DECLE   $00F8,  $001C,  $0006,  $0000   ; 6544   00F8 001C 0006 0000
        DECLE   $0010,  $0000,  $0081,  $0024   ; 6548   0010 0000 0081 0024
        DECLE   $0000,  $0000,  $0000,  $00F5   ; 654C   0000 0000 0000 00F5
        DECLE   $0030,  $0060,  $00E0,  $00F0   ; 6550   0030 0060 00E0 00F0
        DECLE   $0098,  $0000,  $0000,  $0000   ; 6554   0098 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6558   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0078   ; 655C   0000 0000 0080 0078
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6560   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 6564   0000 0000 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6568   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0080,  $0015   ; 656C   0080 0000 0080 0015
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6570   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6574   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0000   ; 6578   0000 0010 0000 0000
        DECLE   $0010,  $0084,  $0000,  $0052   ; 657C   0010 0084 0000 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6580   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6584   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6588   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 658C   0000 0000 0000 0000
L_6590:
        PSHR    R5                              ; 6590   0275
        MVII    #$0327, R3                      ; 6591   02BB 0327
        SDBD                                    ; 6593   0001
        MVII    #$659B, R4                      ; 6594   02BC 009B 0065

        JSR     R5,     L_55AB                  ; 6597   0004 0154 01AB

        PULR    R7                              ; 659A   02B7

        DECLE   $0058,  $0009,  $00C8,  $0008   ; 659B   0058 0009 00C8 0008
        DECLE   $0003,  $0020,  $00A9,  $0065   ; 659F   0003 0020 00A9 0065
        DECLE   $0000,  $0000,  $0010,  $0000   ; 65A3   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $005C,  $0064   ; 65A7   0000 0000 005C 0064
        DECLE   $00B3,  $0065,  $0008,  $0300   ; 65AB   00B3 0065 0008 0300
        DECLE   $0013,  $0060,  $0098,  $0060   ; 65AF   0013 0060 0098 0060
        DECLE   $000C,  $001C,  $003C,  $002E   ; 65B3   000C 001C 003C 002E
        DECLE   $003F,  $007D,  $007C,  $007C   ; 65B7   003F 007D 007C 007C
        DECLE   $005C,  $001C,  $000C,  $000C   ; 65BB   005C 001C 000C 000C
        DECLE   $0004,  $0006,  $000E,  $000A   ; 65BF   0004 0006 000E 000A
        DECLE   $000C,  $001C,  $003C,  $002E   ; 65C3   000C 001C 003C 002E
        DECLE   $003F,  $007D,  $007C,  $007C   ; 65C7   003F 007D 007C 007C
        DECLE   $0058,  $0018,  $0018,  $0018   ; 65CB   0058 0018 0018 0018
        DECLE   $0010,  $0010,  $0038,  $0028   ; 65CF   0010 0010 0038 0028
        DECLE   $000C,  $001C,  $003C,  $002C   ; 65D3   000C 001C 003C 002C
        DECLE   $003E,  $007E,  $007C,  $007C   ; 65D7   003E 007E 007C 007C
        DECLE   $005C,  $001C,  $0038,  $0038   ; 65DB   005C 001C 0038 0038
        DECLE   $0030,  $0070,  $0060,  $0060   ; 65DF   0030 0070 0060 0060
        DECLE   $000C,  $001C,  $003C,  $002C   ; 65E3   000C 001C 003C 002C
        DECLE   $003E,  $007C,  $007C,  $007C   ; 65E7   003E 007C 007C 007C
        DECLE   $005C,  $001C,  $001C,  $0018   ; 65EB   005C 001C 001C 0018
        DECLE   $0018,  $0030,  $0070,  $0050   ; 65EF   0018 0030 0070 0050
        DECLE   $0000,  $00C0,  $00E0,  $0070   ; 65F3   0000 00C0 00E0 0070
        DECLE   $005C,  $007E,  $007C,  $007C   ; 65F7   005C 007E 007C 007C
        DECLE   $007C,  $005C,  $000C,  $0007   ; 65FB   007C 005C 000C 0007
        DECLE   $0002,  $0000,  $0000,  $0000   ; 65FF   0002 0000 0000 0000
        DECLE   $0000,  $00C0,  $00E0,  $0070   ; 6603   0000 00C0 00E0 0070
        DECLE   $0058,  $007E,  $007C,  $0078   ; 6607   0058 007E 007C 0078
        DECLE   $0078,  $0078,  $0038,  $0030   ; 660B   0078 0078 0038 0030
        DECLE   $0030,  $0078,  $006C,  $0000   ; 660F   0030 0078 006C 0000
        DECLE   $0000,  $00C0,  $00E0,  $0070   ; 6613   0000 00C0 00E0 0070
        DECLE   $0058,  $007C,  $007E,  $007C   ; 6617   0058 007C 007E 007C
        DECLE   $007C,  $005C,  $0018,  $0018   ; 661B   007C 005C 0018 0018
        DECLE   $0018,  $001C,  $0036,  $0000   ; 661F   0018 001C 0036 0000
        DECLE   $0000,  $00C0,  $00E0,  $0078   ; 6623   0000 00C0 00E0 0078
        DECLE   $005F,  $007E,  $007C,  $007C   ; 6627   005F 007E 007C 007C
        DECLE   $005C,  $005C,  $000E,  $0006   ; 662B   005C 005C 000E 0006
        DECLE   $0006,  $0007,  $0004,  $0000   ; 662F   0006 0007 0004 0000
        DECLE   $0044,  $0044,  $0044,  $0000   ; 6633   0044 0044 0044 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 6637   0000 0000 0004 0004

        MOVR    R0,     R4                      ; 663B   0084
        MOVR    R0,     R4                      ; 663C   0084
        MOVR    R0,     R4                      ; 663D   0084
        ADDR    R0,     R0                      ; 663E   00C0
        ADDR    R0,     R0                      ; 663F   00C0
        ADDR    R0,     R0                      ; 6640   00C0
        ADDR    R0,     R4                      ; 6641   00C4
        ADDR    R0,     R4                      ; 6642   00C4
        MVI     G_0347, R2                      ; 6643   0282 0347
        MVI     G_019B, R0                      ; 6645   0280 019B
        MOVR    R0,     R1                      ; 6647   0081
        ADDI    #$0003, R1                      ; 6648   02F9 0003
        CMPR    R2,     R1                      ; 664A   0151
        BEQ     L_664F                          ; 664B   0204 0002

        INCR    R2                              ; 664D   000A
        INCR    R7                              ; 664E   000F

L_664F:
        MOVR    R0,     R2                      ; 664F   0082
L_6650:
        MVO     R2,     G_0347                  ; 6650   0242 0347
        MOVR    R5,     R7                      ; 6652   00AF

        DECLE   $0000,  $0009,  $0080,  $0000   ; 6653   0000 0009 0080 0000
        DECLE   $0000,  $0000,  $0061,  $0066   ; 6657   0000 0000 0061 0066
        DECLE   $0020,  $0000,  $000A,  $0000   ; 665B   0020 0000 000A 0000
        DECLE   $0080,  $0000,  $00FD,  $0061   ; 665F   0080 0000 00FD 0061
        DECLE   $0069,  $0066,  $0003,  $0001   ; 6663   0069 0066 0003 0001
        DECLE   $0001,  $0062,  $0007,  $000E   ; 6667   0001 0062 0007 000E
        DECLE   $001C,  $0018,  $0018,  $00D9   ; 666B   001C 0018 0018 00D9
        DECLE   $007F,  $00FB,  $0030,  $0020   ; 666F   007F 00FB 0030 0020
        DECLE   $0020,  $0030,  $0018,  $0000   ; 6673   0020 0030 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6677   0000 0000 0000 0000
        DECLE   $0000                           ; 667B   0000

        INCR    R7                              ; 667C   000F

        COMR    R6                              ; 667D   001E
L_667E:
        ADDR    R3,     R0                      ; 667E   00D8
        DECLE   $007F,  $00F9,  $0018,  $001C   ; 667F   007F 00F9 0018 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6683   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6687   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668B   0000 0000 0000 0000
        DECLE   $00DC,  $00FF,  $003D,  $0000   ; 668F   00DC 00FF 003D 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6693   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $000D   ; 6697   0000 0000 0007 000D
        DECLE   $0080,  $0000,  $0007,  $0000   ; 669B   0080 0000 0007 0000
        DECLE   $00A7,  $0066,  $0020,  $0000   ; 669F   00A7 0066 0020 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 66A3   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0040,  $0039   ; 66A7   0000 0000 0040 0039
        DECLE   $0002,  $0001                   ; 66AB   0002 0001

        SAR     R3,     2                       ; 66AD   006F
        SLR     R1,     1                       ; 66AE   0061
L_66AF:
        PSHR    R5                              ; 66AF   0275
        MVII    #$0325, R3                      ; 66B0   02BB 0325
        SDBD                                    ; 66B2   0001
        MVII    #$66BA, R4                      ; 66B3   02BC 00BA 0066

        JSR     R5,     L_55AB                  ; 66B6   0004 0154 01AB

        PULR    R7                              ; 66B9   02B7

        DECLE   $0058,  $0009,  $00E0,  $0080   ; 66BA   0058 0009 00E0 0080
        DECLE   $0006,  $0030,  $00C8,  $0066   ; 66BE   0006 0030 00C8 0066
        DECLE   $0030,  $0000,  $0000,  $0000   ; 66C2   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $006E,  $0058   ; 66C6   0000 0000 006E 0058
        DECLE   $00D0,  $0066,  $0003,  $0004   ; 66CA   00D0 0066 0003 0004
        DECLE   $00C3,  $0060,  $000C,  $001C   ; 66CE   00C3 0060 000C 001C
        DECLE   $003C,  $0008,  $001C,  $003E   ; 66D2   003C 0008 001C 003E
        DECLE   $0034,  $0077,  $00F0,  $00F0   ; 66D6   0034 0077 00F0 00F0
        DECLE   $0070,  $0038,  $001C,  $000C   ; 66DA   0070 0038 001C 000C
        DECLE   $0007,  $0006,  $0006,  $001E   ; 66DE   0007 0006 0006 001E
        DECLE   $000E,  $0004,  $000E,  $001E   ; 66E2   000E 0004 000E 001E
        DECLE   $003A,  $00E3,  $00F0,  $00F0   ; 66E6   003A 00E3 00F0 00F0
        DECLE   $0070,  $0038,  $0018,  $001C   ; 66EA   0070 0038 0018 001C
        DECLE   $0034,  $0000                   ; 66EE   0034 0000

        SETC                                    ; 66F0   0007
        INCR    R7                              ; 66F1   000F

        SETC                                    ; 66F2   0007
L_66F3:
        EIS                                     ; 66F3   0002
        DECLE   $000E,  $001E,  $003C,  $0074   ; 66F4   000E 001E 003C 0074
        DECLE   $00F6,  $00F0,  $0070,  $0038   ; 66F8   00F6 00F0 0070 0038
        DECLE   $0018,  $0018,  $0070,  $0000   ; 66FC   0018 0018 0070 0000

        MOVR    R5,     R0                      ; 6700   00A8
        INCR    R1                              ; 6701   0009
        ADDR    R2,     R2                      ; 6702   00D2
        TSTR    R0                              ; 6703   0080

        JSR     R4,     .EXEC.00E               ; 6704   0004 0010 000E
        DECLE   $0067,  $0050,  $0000,  $003C   ; 6707   0067 0050 0000 003C
        DECLE   $0000,  $00EC,  $0000,  $006E   ; 670B   0000 00EC 0000 006E
        DECLE   $0058,  $0016,  $0067,  $0003   ; 670F   0058 0016 0067 0003
        DECLE   $0004,  $000E,  $0061,  $0008   ; 6713   0004 000E 0061 0008
        DECLE   $003C,  $00EE,  $003C,  $0039   ; 6717   003C 00EE 003C 0039
        DECLE   $0073,  $007F,  $003A,  $001B   ; 671B   0073 007F 003A 001B
        DECLE   $000C,  $0006,  $0012,  $0012   ; 671F   000C 0006 0012 0012
        DECLE   $001E,  $000C,  $0000,  $0008   ; 6723   001E 000C 0000 0008
        DECLE   $003C,  $00EE,  $003C,  $0038   ; 6727   003C 00EE 003C 0038
        DECLE   $0071,  $007F,  $003E,  $001A   ; 672B   0071 007F 003E 001A
        DECLE   $000C,  $0006,  $0022,  $0032   ; 672F   000C 0006 0022 0032
        DECLE   $0016,  $001C,  $0000,  $0008   ; 6733   0016 001C 0000 0008
        DECLE   $003C,  $00EE,  $003C,  $0038   ; 6737   003C 00EE 003C 0038
        DECLE   $0071,  $007F,  $003E,  $001A   ; 673B   0071 007F 003E 001A
        DECLE   $000C,  $0006,  $0022,  $0032   ; 673F   000C 0006 0022 0032
        DECLE   $0016,  $001C,  $0000,  $00A8   ; 6743   0016 001C 0000 00A8
        DECLE   $0009,  $00AE,  $0080,  $0007   ; 6747   0009 00AE 0080 0007
        DECLE   $0010,  $0054,  $0067,  $0020   ; 674B   0010 0054 0067 0020
        DECLE   $0000,  $003C,  $0000,  $00E8   ; 674F   0000 003C 0000 00E8
        DECLE   $0000                           ; 6753   0000

        SAR     R2,     2                       ; 6754   006E
        SLLC    R0,     1                       ; 6755   0058
        SLLC    R0,     2                       ; 6756   005C
        SLR     R3,     2                       ; 6757   0067
        DIS                                     ; 6758   0003

        JSR     R4,     L_5461                  ; 6759   0004 0054 0061
        DECLE   $0050,  $00F0,  $0055,  $000F   ; 675C   0050 00F0 0055 000F
        DECLE   $0005,  $0000,  $0008,  $0038   ; 6760   0005 0000 0008 0038
        DECLE   $0008,  $000A,  $001E,  $000A   ; 6764   0008 000A 001E 000A
        DECLE   $0000,  $0050,  $00F0,  $0050   ; 6768   0000 0050 00F0 0050
        DECLE   $0028,  $0078,  $002A,  $000E   ; 676C   0028 0078 002A 000E
        DECLE   $0002,  $0000                   ; 6770   0002 0000

        DECR    R4                              ; 6772   0014
        RSWD    R4                              ; 6773   003C
        DECR    R4                              ; 6774   0014

        JSR     R4,     .EXEC.C04               ; 6775   0004 001C 0004
        DECLE   $0000,  $0028,  $0078,  $0028   ; 6778   0000 0028 0078 0028
        DECLE   $0020,  $00E0,  $002A,  $001E   ; 677C   0020 00E0 002A 001E
        DECLE   $000A,  $0000,  $0028,  $0078   ; 6780   000A 0000 0028 0078
        DECLE   $0028,  $0005,  $000F,  $0005   ; 6784   0028 0005 000F 0005
        DECLE   $0000,  $0010,  $0070,  $0010   ; 6788   0000 0010 0070 0010
        DECLE   $00A8,  $0009,  $00A8,  $0080   ; 678C   00A8 0009 00A8 0080
        DECLE   $0000,  $0000,  $009A,  $0067   ; 6790   0000 0000 009A 0067
        DECLE   $0020,  $0000,  $001E,  $0000   ; 6794   0020 0000 001E 0000
        DECLE   $00C0,  $0000,  $006E,  $0058   ; 6798   00C0 0000 006E 0058
        DECLE   $0060,  $0039,  $0002,  $0004   ; 679C   0060 0039 0002 0004
        DECLE   $00F1,  $0060,  $00A8,  $0009   ; 67A0   00F1 0060 00A8 0009
        DECLE   $00C0,  $0080,  $0003,  $0010   ; 67A4   00C0 0080 0003 0010
        DECLE   $00B0,  $0067,  $0030,  $0000   ; 67A8   00B0 0067 0030 0000
        DECLE   $003C,  $0000,  $00CE,  $0010   ; 67AC   003C 0000 00CE 0010
        DECLE   $006E,  $0058,  $00B8,  $0067   ; 67B0   006E 0058 00B8 0067
        DECLE   $0003,  $0004,  $00F1,  $0060   ; 67B4   0003 0004 00F1 0060
        DECLE   $0018,  $003C,  $005A,  $007E   ; 67B8   0018 003C 005A 007E
        DECLE   $003C,  $0018,  $0018,  $007E   ; 67BC   003C 0018 0018 007E
        DECLE   $004A,  $00CA,  $009B,  $0091   ; 67C0   004A 00CA 009B 0091
        DECLE   $00D1,  $0059,  $0048,  $0000   ; 67C4   00D1 0059 0048 0000
        DECLE   $003C,  $007E,  $00FF,  $00DB   ; 67C8   003C 007E 00FF 00DB
        DECLE   $007E,  $0018,  $003E,  $006E   ; 67CC   007E 0018 003E 006E
        DECLE   $005A,  $0053,  $0059,  $00CB   ; 67D0   005A 0053 0059 00CB
        DECLE   $008A,  $00DA,  $0000,  $0000   ; 67D4   008A 00DA 0000 0000
        DECLE   $003C,  $007E,  $007E,  $00DB   ; 67D8   003C 007E 007E 00DB
        DECLE   $00FF                           ; 67DC   00FF

        NEGR    R4                              ; 67DD   0024
        RSWD    R4                              ; 67DE   003C
        SARC    R2,     2                       ; 67DF   007E
        RLC     R3,     1                       ; 67E0   0053
        ADDR    R3,     R5                      ; 67E1   00DD
        MOVR    R0,     R7                      ; 67E2   0087

        DECLE   $00F6,  $001C,  $0000,  $0000   ; 67E3   00F6 001C 0000 0000
        DECLE   $0000,  $00A8,  $0009,  $009E   ; 67E7   0000 00A8 0009 009E
        DECLE   $0080,  $0002,  $0000,  $00F6   ; 67EB   0080 0002 0000 00F6
        DECLE   $0067,  $0020,  $0000,  $000A   ; 67EF   0067 0020 0000 000A
        DECLE   $0000,  $00D0,  $0007,  $006E   ; 67F3   0000 00D0 0007 006E
        DECLE   $0058,  $00FE,  $0067,  $0003   ; 67F7   0058 00FE 0067 0003
        DECLE   $0004,  $00F1,  $0060,  $0000   ; 67FB   0004 00F1 0060 0000
        DECLE   $000C,  $0018,  $0030,  $0060   ; 67FF   000C 0018 0030 0060
        DECLE   $0060,  $0030,  $0018,  $000C   ; 6803   0060 0030 0018 000C
        DECLE   $000C,  $001C,  $0078,  $00F8   ; 6807   000C 001C 0078 00F8
        DECLE   $00B0,  $00E0,  $0000,  $0003   ; 680B   00B0 00E0 0000 0003
        DECLE   $0006,  $000C,  $0018,  $0010   ; 680F   0006 000C 0018 0010
        DECLE   $0030,  $0030,  $0018,  $0018   ; 6813   0030 0030 0018 0018
        DECLE   $000C,  $000C,  $001C,  $0078   ; 6817   000C 000C 001C 0078
        DECLE   $00F8,  $00B0,  $00E0,  $0004   ; 681B   00F8 00B0 00E0 0004
        DECLE   $0004,  $0004,  $000C,  $000C   ; 681F   0004 0004 000C 000C
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6823   0018 0018 0018 0018
        DECLE   $0018,  $0038,  $0038,  $0078   ; 6827   0018 0038 0038 0078
        DECLE   $0058,  $0078,  $0030,  $00A8   ; 682B   0058 0078 0030 00A8
        DECLE   $0009,  $00BC,  $0080,  $0000   ; 682F   0009 00BC 0080 0000
        DECLE   $0010,  $003C,  $0068,  $0050   ; 6833   0010 003C 0068 0050
        DECLE   $0000,  $002C,  $0001,  $00CA   ; 6837   0000 002C 0001 00CA
        DECLE   $0006,  $006E,  $0058,  $0044   ; 683B   0006 006E 0058 0044
        DECLE   $0068,  $0004,  $0004,  $00F1   ; 683F   0068 0004 0004 00F1
        DECLE   $0060,  $0001,  $0002,  $007C   ; 6843   0060 0001 0002 007C
        DECLE   $00DE,  $007E,  $005E,  $000C   ; 6847   00DE 007E 005E 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $007C   ; 6853   0000 0001 0002 007C
        DECLE   $00DE,  $007C,  $0000,  $0000   ; 6857   00DE 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685F   0000 0000 0000 0000
        DECLE   $0000,  $0005,  $002E,  $007E   ; 6863   0000 0005 002E 007E
        DECLE   $007E,  $003C,  $0000,  $0000   ; 6867   007E 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $007C   ; 6873   0000 0001 0002 007C
        DECLE   $00DE,  $007C,  $0000,  $0000   ; 6877   00DE 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687F   0000 0000 0000 0000
        DECLE   $0000                           ; 6883   0000

        MOVR    R5,     R0                      ; 6884   00A8
        INCR    R1                              ; 6885   0009
        ADDR    R3,     R0                      ; 6886   00D8
        TSTR    R0                              ; 6887   0080

        JSR     R4,     .EXEC.0A0               ; 6888   0004 0010 00A0
        DECLE   $0068,  $0040,  $0000,  $000A   ; 688B   0068 0040 0000 000A
        DECLE   $0000,  $00EC,  $00FD,  $0000   ; 688F   0000 00EC 00FD 0000

        SLL     R1,     1                       ; 6893   0049
        TSTR    R0                              ; 6894   0080
        ADDR    R0,     R0                      ; 6895   00C0

        JSR     R4,     .EXEC.0A8               ; 6896   0004 0010 00A8
        DECLE   $0068,  $0040,  $0000,  $0000   ; 6899   0068 0040 0000 0000
        DECLE   $0000,  $0008,  $0000,  $006E   ; 689D   0000 0008 0000 006E
        DECLE   $0058,  $00B0,  $0068,  $0003   ; 68A1   0058 00B0 0068 0003
        DECLE   $0004,  $00F1,  $0060,  $006E   ; 68A5   0004 00F1 0060 006E
        DECLE   $0058,  $00E0,  $0068,  $0003   ; 68A9   0058 00E0 0068 0003
        DECLE   $0004,  $00F1,  $0060,  $0003   ; 68AD   0004 00F1 0060 0003
        DECLE   $0007,  $000F,  $001B,  $001F   ; 68B1   0007 000F 001B 001F
        DECLE   $000A,  $0009,  $0012,  $0021   ; 68B5   000A 0009 0012 0021
        DECLE   $0042,  $0022,  $0011,  $0022   ; 68B9   0042 0022 0011 0022
        DECLE   $0024,  $0040,  $0080,  $0003   ; 68BD   0024 0040 0080 0003
        DECLE   $0007,  $000F,  $001F,  $001F   ; 68C1   0007 000F 001F 001F
        DECLE   $000A,  $0034,  $0022,  $0044   ; 68C5   000A 0034 0022 0044
        DECLE   $0089,  $0044,  $0022,  $0046   ; 68C9   0089 0044 0022 0046
        DECLE   $0080,  $0060,  $0000,  $0001   ; 68CD   0080 0060 0000 0001

        DIS                                     ; 68D1   0003
        SETC                                    ; 68D2   0007
        INCR    R5                              ; 68D3   000D
        INCR    R7                              ; 68D4   000F

        DECR    R1                              ; 68D5   0011
L_68D6:
        NEGR    R1                              ; 68D6   0021
        DECLE   $0041,  $0022,  $0044,  $0027   ; 68D7   0041 0022 0044 0027
        DECLE   $0040,  $0020,  $0010,  $0010   ; 68DB   0040 0020 0010 0010
        DECLE   $0008,  $00C0,  $00E0,  $00F0   ; 68DF   0008 00C0 00E0 00F0
        DECLE   $0078,  $00F8,  $0050,  $0048   ; 68E3   0078 00F8 0050 0048
        DECLE   $0024,  $0048,  $0050,  $0048   ; 68E7   0024 0048 0050 0048
        DECLE   $0028,  $0044,  $0008,  $0004   ; 68EB   0028 0044 0008 0004
        DECLE   $0002,  $00C0,  $00E0,  $00F0   ; 68EF   0002 00C0 00E0 00F0
        DECLE   $00F8,  $00F8,  $0050,  $008C   ; 68F3   00F8 00F8 0050 008C
        DECLE   $0042,  $0084,  $0008,  $0084   ; 68F7   0042 0084 0008 0084
        DECLE   $0042,  $0024,  $0002,  $0004   ; 68FB   0042 0024 0002 0004
        DECLE   $0000,  $00E0,  $00F0,  $00F8   ; 68FF   0000 00E0 00F0 00F8
        DECLE   $00BC,  $00FC,  $0048,  $0026   ; 6903   00BC 00FC 0048 0026
        DECLE   $0011,  $0022,  $0014,  $0022   ; 6907   0011 0022 0014 0022
        DECLE   $0099,  $0002,  $0004,  $0008   ; 690B   0099 0002 0004 0008
        DECLE   $0000,  $0007,  $0009,  $00B8   ; 690F   0000 0007 0009 00B8
        DECLE   $0080,  $0002,  $0010,  $002C   ; 6913   0080 0002 0010 002C
        DECLE   $0069,  $0050,  $0000,  $001E   ; 6917   0069 0050 0000 001E
        DECLE   $0000,  $0030,  $0003,  $0000   ; 691B   0000 0030 0003 0000
        DECLE   $0048,  $0080,  $00C0,  $0002   ; 691F   0048 0080 00C0 0002
        DECLE   $0010,  $0034,  $0069,  $0050   ; 6923   0010 0034 0069 0050
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 6927   0000 0000 0000 00F8
        DECLE   $0000,  $006E,  $0058,  $006A   ; 692B   0000 006E 0058 006A
        DECLE   $0069,  $0003,  $0004,  $00F1   ; 692F   0069 0003 0004 00F1
        DECLE   $0060,  $006E,  $0058,  $003A   ; 6933   0060 006E 0058 003A
        DECLE   $0069,  $0003,  $0000,  $0001   ; 6937   0069 0003 0000 0001
        DECLE   $0000,  $0001                   ; 693B   0000 0001

        DIS                                     ; 693D   0003
        MOVR    R0,     R7                      ; 693E   0087
        ADDR    R5,     R7                      ; 693F   00EF

        DECLE   $007F,  $003F                   ; 6940   007F 003F

        SARC    R3,     2                       ; 6942   007F
        ADDR    R4,     R7                      ; 6943   00E7

        DECLE   $008C,  $0001,  $0000,  $0000   ; 6944   008C 0001 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0001   ; 6948   0000 0000 0003 0001
        DECLE   $0001,  $0003,  $0007,  $004F   ; 694C   0001 0003 0007 004F
        DECLE   $007F,  $003F,  $007F,  $004F   ; 6950   007F 003F 007F 004F
        DECLE   $001B,  $0000,  $0000,  $0000   ; 6954   001B 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0001   ; 6958   0000 0000 0003 0001
        DECLE   $0001,  $0003,  $0027,  $002F   ; 695C   0001 0003 0027 002F
        DECLE   $003F,  $003F,  $003F,  $0027   ; 6960   003F 003F 003F 0027
        DECLE   $0020,  $0001,  $0000,  $0000   ; 6964   0020 0001 0000 0000
        DECLE   $0000,  $0000                   ; 6968   0000 0000

        TSTR    R0                              ; 696A   0080
        ADDR    R0,     R0                      ; 696B   00C0
        ADDR    R6,     R0                      ; 696C   00F0
        ADDR    R7,     R0                      ; 696D   00F8
        ADDR    R7,     R4                      ; 696E   00FC
        ADDR    R5,     R6                      ; 696F   00EE
        ADDR    R5,     R7                      ; 6970   00EF

        DECLE   $00F8,  $00FE,  $00F8,  $00E0   ; 6971   00F8 00FE 00F8 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6975   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00F0   ; 6979   0000 0000 0080 00F0
        DECLE   $00F8,  $00FC,  $00EE,  $00FF   ; 697D   00F8 00FC 00EE 00FF
        DECLE   $00FA,  $00FC,  $00F8,  $00C0   ; 6981   00FA 00FC 00F8 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6985   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6989   0000 0000

        TSTR    R0                              ; 698B   0080
        ADDR    R6,     R0                      ; 698C   00F0
        ADDR    R7,     R0                      ; 698D   00F8
        ADDR    R7,     R4                      ; 698E   00FC
        ADDR    R5,     R6                      ; 698F   00EE
        ADDR    R5,     R7                      ; 6990   00EF

        DECLE   $00F8,  $00FE,  $00F8,  $00E0   ; 6991   00F8 00FE 00F8 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6995   00C0 0000 0000 0000
        DECLE   $0000,  $00A8,  $0009,  $00C8   ; 6999   0000 00A8 0009 00C8
        DECLE   $0080,  $0002,  $0000,  $00C4   ; 699D   0080 0002 0000 00C4
        DECLE   $0069,  $0030,  $0000,  $002C   ; 69A1   0069 0030 0000 002C
        DECLE   $0001,  $00C0,  $0000,  $0000   ; 69A5   0001 00C0 0000 0000
        DECLE   $0049,  $0080,  $00C0,  $0002   ; 69A9   0049 0080 00C0 0002
        DECLE   $0000,  $00CC,  $0069,  $0030   ; 69AD   0000 00CC 0069 0030
        DECLE   $0000,  $0000,  $0000,  $0008   ; 69B1   0000 0000 0000 0008
        DECLE   $0000,  $0000,  $0049,  $0080   ; 69B5   0000 0000 0049 0080
        DECLE   $00C0,  $0002,  $0000,  $00D4   ; 69B9   00C0 0002 0000 00D4
        DECLE   $0069,  $0030,  $0000,  $0000   ; 69BD   0069 0030 0000 0000
        DECLE   $0000,  $0008,  $0000,  $006E   ; 69C1   0000 0008 0000 006E
        DECLE   $0058,  $00DC,  $0069,  $0003   ; 69C5   0058 00DC 0069 0003
        DECLE   $0004,  $00F1,  $0060,  $006E   ; 69C9   0004 00F1 0060 006E
        DECLE   $0058,  $000C,  $006A,  $0003   ; 69CD   0058 000C 006A 0003
        DECLE   $0004,  $00F1,  $0060,  $006E   ; 69D1   0004 00F1 0060 006E
        DECLE   $0058,  $003C,  $006A,  $0003   ; 69D5   0058 003C 006A 0003
        DECLE   $0004,  $00F1,  $0060,  $0000   ; 69D9   0004 00F1 0060 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 69DD   0000 0000 0000 000C
        DECLE   $003F,  $007E,  $00FD,  $007E   ; 69E1   003F 007E 00FD 007E
        DECLE   $003F,  $000C,  $0000,  $0000   ; 69E5   003F 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 69ED   0000 0000 0000 0008
        DECLE   $001C,  $003F,  $007D,  $003F   ; 69F1   001C 003F 007D 003F
        DECLE   $001C,  $0008,  $0000,  $0000   ; 69F5   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 69FD   0000 0000 0000 001C
        DECLE   $003E,  $007F,  $00FD,  $00FF   ; 6A01   003E 007F 00FD 00FF
        DECLE   $007F,  $003E,  $001C,  $0000   ; 6A05   007F 003E 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A09   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0007,  $001C   ; 6A0D   0000 0001 0007 001C
        DECLE   $00FF,  $00F8,  $007F,  $00F8   ; 6A11   00FF 00F8 007F 00F8
        DECLE   $00FF,  $0019,  $000E,  $0003   ; 6A15   00FF 0019 000E 0003
        DECLE   $0000,  $0000,  $0000,  $001F   ; 6A19   0000 0000 0000 001F
        DECLE   $0030,  $0047,  $004C,  $0059   ; 6A1D   0030 0047 004C 0059
        DECLE   $007F,  $00F8,  $007E,  $00FB   ; 6A21   007F 00F8 007E 00FB
        DECLE   $0079,  $003C,  $0077,  $0041   ; 6A25   0079 003C 0077 0041
        DECLE   $0041,  $006E,  $003B,  $0000   ; 6A29   0041 006E 003B 0000
        DECLE   $0000,  $0003,  $001E,  $0039   ; 6A2D   0000 0003 001E 0039
        DECLE   $0067,  $00FC,  $007F,  $00F0   ; 6A31   0067 00FC 007F 00F0
        DECLE   $00FF,  $0030,  $001F,  $0001   ; 6A35   00FF 0030 001F 0001
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6A39   0000 0000 0000 0018
        DECLE   $0030,  $00E0,  $003C,  $0000   ; 6A3D   0030 00E0 003C 0000
        DECLE   $00FE,  $0003,  $00F0,  $003C   ; 6A41   00FE 0003 00F0 003C
        DECLE   $0007,  $00F0,  $0018,  $008E   ; 6A45   0007 00F0 0018 008E
        DECLE   $0080,  $00F0,  $0018,  $0000   ; 6A49   0080 00F0 0018 0000
        DECLE   $00E0,  $008C,  $0038,  $00E0   ; 6A4D   00E0 008C 0038 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A51   0000 0000 0000 0000
        DECLE   $0080,  $0060,  $0038,  $000C   ; 6A55   0080 0060 0038 000C
        DECLE   $00E0,  $0034,  $009C,  $0000   ; 6A59   00E0 0034 009C 0000
        DECLE   $0000,  $00F8,  $000C,  $00E0   ; 6A5D   0000 00F8 000C 00E0
        DECLE   $003E,  $0000,  $00FF,  $0000   ; 6A61   003E 0000 00FF 0000
        DECLE   $00BE,  $00E0,  $001C,  $00F0   ; 6A65   00BE 00E0 001C 00F0
        DECLE   $0000,  $0000,  $0000,  $0007   ; 6A69   0000 0000 0000 0007
        DECLE   $0009,  $00C0,  $0080,  $0000   ; 6A6D   0009 00C0 0080 0000
        DECLE   $0010,  $0096,  $006A,  $0070   ; 6A71   0010 0096 006A 0070
        DECLE   $0000,  $003C,  $0000,  $0040   ; 6A75   0000 003C 0000 0040
        DECLE   $0000,  $0000,  $0048,  $0080   ; 6A79   0000 0000 0048 0080
        DECLE   $00C0,  $0000,  $0010,  $009E   ; 6A7D   00C0 0000 0010 009E
        DECLE   $006A,  $0070,  $0000,  $0000   ; 6A81   006A 0070 0000 0000
        DECLE   $0000,  $00F8,  $0000,  $0000   ; 6A85   0000 00F8 0000 0000
        DECLE   $0048,  $0080,  $00C0,  $0000   ; 6A89   0048 0080 00C0 0000
        DECLE   $0010,  $00A4,  $006A,  $0070   ; 6A8D   0010 00A4 006A 0070
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 6A91   0000 0000 0000 00F8
        DECLE   $0000,  $006E,  $0058,  $000A   ; 6A95   0000 006E 0058 000A
        DECLE   $006B,  $0003,  $0004,  $00F1   ; 6A99   006B 0003 0004 00F1
        DECLE   $0060,  $006E,  $0058,  $00DA   ; 6A9D   0060 006E 0058 00DA
        DECLE   $006A,  $0003,  $0000,  $006E   ; 6AA1   006A 0003 0000 006E
        DECLE   $0058,  $00AA,  $006A,  $0003   ; 6AA5   0058 00AA 006A 0003
        DECLE   $0000,  $0000,  $0084,  $00CC   ; 6AA9   0000 0000 0084 00CC
        DECLE   $00F8,  $0070,  $0020,  $0030   ; 6AAD   00F8 0070 0020 0030
        DECLE   $0038,  $001F                   ; 6AB1   0038 001F

        INCR    R7                              ; 6AB3   000F

        DIS                                     ; 6AB4   0003
L_6AB5:
        SETC                                    ; 6AB5   0007
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6AB6   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABA   0000 0000 0000 0000
        DECLE   $0000,  $00CC,  $00F8,  $0038   ; 6ABE   0000 00CC 00F8 0038
        DECLE   $001F                           ; 6AC2   001F

        INCR    R7                              ; 6AC3   000F

        SETC                                    ; 6AC4   0007
L_6AC5:
        INCR    R6                              ; 6AC5   000E
        DECLE   $0018,  $0000,  $0000,  $0000   ; 6AC6   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 6ACE   0000 0000 0018 003C
        DECLE   $00FF,  $000F,  $000F,  $003E   ; 6AD2   00FF 000F 000F 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD6   0000 0000 0000 0000
        DECLE   $0038,  $001E,  $000F,  $000F   ; 6ADA   0038 001E 000F 000F
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 6ADE   001F 003F 007F 00FF
        DECLE   $00FF,  $00FF                   ; 6AE2   00FF 00FF

        ADDR    R0,     R7                      ; 6AE4   00C7
        INCR    R7                              ; 6AE5   000F

        RSWD    R6                              ; 6AE6   003E
L_6AE7:
        COMR    R4                              ; 6AE7   001C
        DECLE   $0000,  $0000,  $0038,  $001E   ; 6AE8   0000 0000 0038 001E
        DECLE   $000F,  $000F,  $001F,  $003F   ; 6AEC   000F 000F 001F 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6AF0   007F 00FF 00FF 00FF

        MOVR    R0,     R7                      ; 6AF4   0087
        INCR    R7                              ; 6AF5   000F

        RSWD    R6                              ; 6AF6   003E
L_6AF7:
        COMR    R4                              ; 6AF7   001C
        DECLE   $0000,  $0000,  $0038,  $001E   ; 6AF8   0000 0000 0038 001E
        DECLE   $000F,  $000F,  $001F,  $003F   ; 6AFC   000F 000F 001F 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6B00   007F 00FF 00FF 00FF
        DECLE   $008F,  $007E,  $003C,  $0000   ; 6B04   008F 007E 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B08   0000 0000 0000 0000

        CLRC                                    ; 6B0C   0006
        MOVR    R0,     R5                      ; 6B0D   0085
        ADDR    R1,     R7                      ; 6B0E   00CF

        DECLE   $00FE,  $00FF,  $00FF           ; 6B0F   00FE 00FF 00FF

        ADDR    R7,     R6                      ; 6B12   00FE
        ADDR    R5,     R7                      ; 6B13   00EF
        MOVR    R1,     R7                      ; 6B14   008F

        DECLE   $0009,  $0006,  $0000,  $0000   ; 6B15   0009 0006 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B19   0000 0000 0000 0000

        MOVR    R0,     R6                      ; 6B1D   0086
        ADDR    R1,     R5                      ; 6B1E   00CD
        ADDR    R5,     R7                      ; 6B1F   00EF

        DECLE   $00FE,  $00FF,  $00FF           ; 6B20   00FE 00FF 00FF

        ADDR    R7,     R6                      ; 6B23   00FE
        MOVR    R1,     R7                      ; 6B24   008F
        INCR    R7                              ; 6B25   000F

        INCR    R1                              ; 6B26   0009
L_6B27:
        CLRC                                    ; 6B27   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B28   0000 0000 0000 0000
        DECLE   $0000,  $008C,  $00DA,  $00FE   ; 6B2C   0000 008C 00DA 00FE
        DECLE   $00FC,  $00FE,  $00FE,  $00FC   ; 6B30   00FC 00FE 00FE 00FC
        DECLE   $001E,  $001E,  $0012,  $000C   ; 6B34   001E 001E 0012 000C
        DECLE   $0000,  $0000,  $0032,  $0009   ; 6B38   0000 0000 0032 0009
        DECLE   $00AD,  $0000,  $0006,  $0000   ; 6B3C   00AD 0000 0006 0000
        DECLE   $0048,  $006B,  $0040,  $0000   ; 6B40   0048 006B 0040 0000
        DECLE   $000A,  $0000,  $0000,  $0000   ; 6B44   000A 0000 0000 0000
        DECLE   $00FD,  $0061,  $0050,  $006B   ; 6B48   00FD 0061 0050 006B
        DECLE   $0002,  $0001,  $00CB,  $0061   ; 6B4C   0002 0001 00CB 0061
        DECLE   $0000,  $0008,  $0008,  $001C   ; 6B50   0000 0008 0008 001C
        DECLE   $007F,  $003E,  $001C,  $001C   ; 6B54   007F 003E 001C 001C
        DECLE   $0036,  $0022,  $0000,  $0000   ; 6B58   0036 0022 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5C   0000 0000 0000 0000
        DECLE   $002A,  $002A,  $0049,  $001C   ; 6B60   002A 002A 0049 001C
        DECLE   $007F,  $003E,  $001C,  $005D   ; 6B64   007F 003E 001C 005D
        DECLE   $0036,  $0022,  $0008,  $0014   ; 6B68   0036 0022 0008 0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6C   0000 0000 0000 0000
L_6B70:
        PSHR    R5                              ; 6B70   0275
        MVII    #$0002, R2                      ; 6B71   02BA 0002
        MVII    #$0326, R3                      ; 6B73   02BB 0326
        SDBD                                    ; 6B75   0001
        MVII    #$6B7D, R4                      ; 6B76   02BC 007D 006B

        JSR     R5,     L_55A9                  ; 6B79   0004 0154 01A9

        PULR    R7                              ; 6B7C   02B7

        DECLE   $0000,  $008D,  $0090,  $0001   ; 6B7D   0000 008D 0090 0001
        DECLE   $0002,  $0010,  $0099,  $006B   ; 6B81   0002 0010 0099 006B
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6B85   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0085   ; 6B89   0000 0000 0000 0085
        DECLE   $00A0,  $0003,  $0002,  $0010   ; 6B8D   00A0 0003 0002 0010
        DECLE   $0099,  $006B,  $0020,  $0000   ; 6B91   0099 006B 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00A1,  $006B   ; 6B99   0000 0000 00A1 006B
        DECLE   $0002,  $0001,  $00C1,  $006B   ; 6B9D   0002 0001 00C1 006B
        DECLE   $0000,  $0000,  $0081,  $0081   ; 6BA1   0000 0000 0081 0081
        DECLE   $0090,  $0090,  $0000,  $0000   ; 6BA5   0090 0090 0000 0000
        DECLE   $0001,  $0001,  $0030,  $0030   ; 6BA9   0001 0001 0030 0030
        DECLE   $0000,  $0000,  $0024,  $0024   ; 6BAD   0000 0000 0024 0024
        DECLE   $0092,  $0092,  $0010,  $0010   ; 6BB1   0092 0092 0010 0010
        DECLE   $0001,  $0001,  $0030,  $0030   ; 6BB5   0001 0001 0030 0030
        DECLE   $0040,  $0040,  $0004,  $0004   ; 6BB9   0040 0040 0004 0004
        DECLE   $0024,  $0024,  $0000,  $0000   ; 6BBD   0024 0024 0000 0000

        PSHR    R5                              ; 6BC1   0275
        CLRR    R0                              ; 6BC2   01C0
        MVO     R0,     G_0186                  ; 6BC3   0240 0186
        MVO     R0,     G_0187                  ; 6BC5   0240 0187

        JSR     R5,     L_6C31                  ; 6BC7   0004 016C 0031

        PULR    R7                              ; 6BCA   02B7

L_6BCB:
        PSHR    R5                              ; 6BCB   0275

        JSR     R5,     X_PLAY_SFX1             ; 6BCC   0004 0118 03BB
        DECLE   $0048,  $0040                   ; 6BCF  SFX data
        DECLE   $0137                           ; 6BD1  SFX data
        DECLE   $000B                           ; 6BD2  SFX data
        DECLE   $014C,  $0000                   ; 6BD3  SFX data
        DECLE   $03D9                           ; 6BD5  SFX data
        DECLE   $0048,  $0044                   ; 6BD6  SFX data
        DECLE   $006B                           ; 6BD8  SFX data
        DECLE   $0048,  $003A                   ; 6BD9  SFX data
        DECLE   $006B                           ; 6BDB  SFX data
        DECLE   $0063,  $03E0                   ; 6BDC  SFX data
        DECLE   $02CF                           ; 6BDE  SFX end

L_6BDF:
        PSHR    R5                              ; 6BDF   0275

        JSR     R5,     X_PLAY_SFX1             ; 6BE0   0004 0118 03BB
        DECLE   $03E9                           ; 6BE3  SFX data
        DECLE   $0340,  $03E8                   ; 6BE4  SFX data
        DECLE   $012B                           ; 6BE6  SFX data
        DECLE   $0340,  $0320                   ; 6BE7  SFX data
        DECLE   $012B                           ; 6BE9  SFX data
        DECLE   $0340,  $0280                   ; 6BEA  SFX data
        DECLE   $012B                           ; 6BEC  SFX data
        DECLE   $0340,  $0384                   ; 6BED  SFX data
        DECLE   $012B                           ; 6BEF  SFX data
        DECLE   $0340,  $02D0                   ; 6BF0  SFX data
        DECLE   $012B                           ; 6BF2  SFX data
        DECLE   $0300,  $0240                   ; 6BF3  SFX data
        DECLE   $012B                           ; 6BF5  SFX data
        DECLE   $02C0,  $032A                   ; 6BF6  SFX data
        DECLE   $012B                           ; 6BF8  SFX data
        DECLE   $0280,  $0288                   ; 6BF9  SFX data
        DECLE   $012B                           ; 6BFB  SFX data
        DECLE   $0240,  $0206                   ; 6BFC  SFX data
        DECLE   $012B                           ; 6BFE  SFX data
        DECLE   $0200,  $02D9                   ; 6BFF  SFX data
        DECLE   $012B                           ; 6C01  SFX data
        DECLE   $0180,  $0247                   ; 6C02  SFX data
        DECLE   $012B                           ; 6C04  SFX data
        DECLE   $0100,  $01D2                   ; 6C05  SFX data
        DECLE   $012B                           ; 6C07  SFX data
        DECLE   $02CF                           ; 6C08  SFX end

L_6C09:
        PSHR    R5                              ; 6C09   0275

        JSR     R5,     X_PLAY_SFX1             ; 6C0A   0004 0118 03BB
        DECLE   $01F9                           ; 6C0D  SFX data
        DECLE   $0237                           ; 6C0E  SFX data
        DECLE   $038B                           ; 6C0F  SFX data
        DECLE   $00CC,  $0000                   ; 6C10  SFX data
        DECLE   $010D                           ; 6C12  SFX data
        DECLE   $03CF                           ; 6C13  SFX end

L_6C14:
        PSHR    R5                              ; 6C14   0275

        JSR     R5,     X_PLAY_SFX1             ; 6C15   0004 0118 03BB
        DECLE   $0340,  $0020                   ; 6C18  SFX data
        DECLE   $03E9                           ; 6C1A  SFX data
        DECLE   $006B                           ; 6C1B  SFX data
        DECLE   $0085                           ; 6C1C  SFX data
        DECLE   $006B                           ; 6C1D  SFX data
        DECLE   $0345                           ; 6C1E  SFX data
        DECLE   $006B                           ; 6C1F  SFX data
        DECLE   $0085                           ; 6C20  SFX data
        DECLE   $006B                           ; 6C21  SFX data
        DECLE   $0345                           ; 6C22  SFX data
        DECLE   $006B                           ; 6C23  SFX data
        DECLE   $0085                           ; 6C24  SFX data
        DECLE   $006B                           ; 6C25  SFX data
        DECLE   $0345                           ; 6C26  SFX data
        DECLE   $006B                           ; 6C27  SFX data
        DECLE   $0077,  $002C,  $006C           ; 6C28  SFX data
        DECLE   $03CF                           ; 6C2B  SFX end

UC_6C2C:
        SDBD                                    ; 6C2C  SLIB UCALL target
        MVII    #$6C0D, R4                      ; 6C2D   02BC 000D 006C
        PULR    R7                              ; 6C30   02B7

L_6C31:
        PSHR    R5                              ; 6C31   0275

        JSR     R5,     X_PLAY_SFX1             ; 6C32   0004 0118 03BB
        DECLE   $03F0,  $03FF                   ; 6C35  SFX data
        DECLE   $0369                           ; 6C37  SFX data
        DECLE   $004D                           ; 6C38  SFX data
        DECLE   $006B                           ; 6C39  SFX data
        DECLE   $02CF                           ; 6C3A  SFX end

L_6C3B:
        PSHR    R5                              ; 6C3B   0275

        JSR     R5,     X_PLAY_SFX1             ; 6C3C   0004 0118 03BB
        DECLE   $0040,  $0040                   ; 6C3F  SFX data
        DECLE   $03E9                           ; 6C41  SFX data
        DECLE   $000C,  $0200                   ; 6C42  SFX data
        DECLE   $000B                           ; 6C44  SFX data
        DECLE   $008F,  $0028                   ; 6C45  SFX data
        DECLE   $02CF                           ; 6C47  SFX end

        DECLE   $00C2,  $00E0,  $00E0,  $00C8   ; 6C48   00C2 00E0 00E0 00C8
        DECLE   $00C0,  $00C8,  $00E0,  $00C4   ; 6C4C   00C0 00C8 00E0 00C4
        DECLE   $00C1,  $00C8,  $00C0,  $00E0   ; 6C50   00C1 00C8 00C0 00E0
        DECLE   $0000,  $00C0,  $00E0,  $0000   ; 6C54   0000 00C0 00E0 0000
        DECLE   $0000,  $00E0,  $00C0,  $00C6   ; 6C58   0000 00E0 00C0 00C6
        DECLE   $00E0,  $0000,  $00C2,  $00C1   ; 6C5C   00E0 0000 00C2 00C1
        DECLE   $00C1,  $0000,  $0000,  $00E0   ; 6C60   00C1 0000 0000 00E0
        DECLE   $0000,  $0000                   ; 6C64   0000 0000

        ADDR    R4,     R0                      ; 6C66   00E0
        ADDR    R1,     R7                      ; 6C67   00CF

        DECLE   $00D4,  $0000,  $0000,  $0000   ; 6C68   00D4 0000 0000 0000
        DECLE   $00C1,  $0150,  $0000,  $0000   ; 6C6C   00C1 0150 0000 0000
        DECLE   $0141,  $0000,  $0000,  $0000   ; 6C70   0141 0000 0000 0000
        DECLE   $01D0,  $00C2,  $0000,  $0000   ; 6C74   01D0 00C2 0000 0000
        DECLE   $0242,  $01C4,  $0000,  $0000   ; 6C78   0242 01C4 0000 0000
        DECLE   $00D0,  $0000,  $0000,  $0000   ; 6C7C   00D0 0000 0000 0000
        DECLE   $0142,  $01C8,  $0244,  $0000   ; 6C80   0142 01C8 0244 0000
        DECLE   $01C1,  $02D0,  $0000,  $0000   ; 6C84   01C1 02D0 0000 0000
        DECLE   $02C1,  $0000,  $0000,  $0000   ; 6C88   02C1 0000 0000 0000
        DECLE   $0248,  $00D0,  $0000,  $0000   ; 6C8C   0248 00D0 0000 0000
        DECLE   $01C8,  $03D0,  $0000,  $0000   ; 6C90   01C8 03D0 0000 0000
        DECLE   $02C4,  $0000,  $0000,  $0000   ; 6C94   02C4 0000 0000 0000
        DECLE   $03D0,  $0000,  $0000,  $0000   ; 6C98   03D0 0000 0000 0000
        DECLE   $03CE,  $0000,  $0000,  $0000   ; 6C9C   03CE 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA0   0000 0000 0000 0000
        DECLE   $0250,  $0000,  $0000,  $0000   ; 6CA4   0250 0000 0000 0000
        DECLE   $0147,  $00AC,  $00AD,  $0148   ; 6CA8   0147 00AC 00AD 0148
        DECLE   $00A4,  $00A3,  $01E7           ; 6CAC   00A4 00A3 01E7

        MOVR    R5,     R4                      ; 6CAF   00AC
        TSTR    R5                              ; 6CB0   00AD
        ANDR    R3,     R0                      ; 6CB1   0198
        TSTR    R4                              ; 6CB2   00A4
        MOVR    R4,     R3                      ; 6CB3   00A3
        CMPR    R0,     R7                      ; 6CB4   0147
        MOVR    R5,     R4                      ; 6CB5   00AC
        XOR     G_03C4, R0                      ; 6CB6   03C0 03C4
        XOR     G_03CC, R4                      ; 6CB8   03C4 03CC
        XOR@    R1,     R4                      ; 6CBA   03CC
        XOR@    R1,     R4                      ; 6CBB   03CC
        MOVR    R4,     R7                      ; 6CBC   00A7
        MOVR    R4,     R7                      ; 6CBD   00A7
        MOVR    R4,     R7                      ; 6CBE   00A7

        MOVR    R4,     R0                      ; 6CBF   00A0
        MOVR    R4,     R7                      ; 6CC0   00A7

        DECLE   $0057,  $0057,  $01E8,  $01E8   ; 6CC1   0057 0057 01E8 01E8
        DECLE   $01E8,  $01E8,  $01E8,  $01E8   ; 6CC5   01E8 01E8 01E8 01E8
        DECLE   $01E8,  $01E8,  $0000,  $0000   ; 6CC9   01E8 01E8 0000 0000
        DECLE   $0000,  $0010,  $0011,  $0012   ; 6CCD   0000 0010 0011 0012
        DECLE   $0000,  $0000,  $000C,  $000D   ; 6CD1   0000 0000 000C 000D
        DECLE   $000C,  $000E,  $0000,  $0010   ; 6CD5   000C 000E 0000 0010
        DECLE   $0013,  $0000,  $0000,  $0014   ; 6CD9   0013 0000 0000 0014
        DECLE   $0115,  $0009,  $000B,  $000A   ; 6CDD   0115 0009 000B 000A
        DECLE   $0000,  $0000,  $0008,  $000B   ; 6CE1   0000 0000 0008 000B
        DECLE   $0008,  $0009,  $000A,  $0000   ; 6CE5   0008 0009 000A 0000
        DECLE   $028C,  $02CD,  $0000,  $0000   ; 6CE9   028C 02CD 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFD   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $000F,  $020C   ; 6D01   0000 000C 000F 020C
        DECLE   $022E,  $0000,  $0008,  $0009   ; 6D05   022E 0000 0008 0009
        DECLE   $000B,  $0000,  $0000,  $0000   ; 6D09   000B 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0009   ; 6D0D   0000 0000 0008 0009
        DECLE   $020B,  $022B,  $000A,  $0000   ; 6D11   020B 022B 000A 0000
        DECLE   $0000,  $0000,  $0018,  $001A   ; 6D15   0000 0000 0018 001A
        DECLE   $0004,  $0005,  $0205,  $0011   ; 6D19   0004 0005 0205 0011
        DECLE   $0000,  $0010,  $024C,  $000E   ; 6D1D   0000 0010 024C 000E
        DECLE   $0000,  $0008,  $000A,  $0000   ; 6D21   0000 0008 000A 0000
        DECLE   $000A,  $03E8,  $03E8,  $03E8   ; 6D25   000A 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $03C8,  $0008   ; 6D29   03E8 03E8 03C8 0008
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D2D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $03C8,  $01C8   ; 6D31   03E8 03E8 03C8 01C8
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6D35   010B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $0048,  $0048   ; 6D39   03E8 03E8 0048 0048
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D3D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $0208,  $0048   ; 6D41   03E8 03E8 0208 0048
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D45   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $03C8,  $0008   ; 6D49   03E8 03E8 03C8 0008
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D4D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $0208,  $0302   ; 6D51   03E8 03E8 0208 0302
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6D55   010B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $0148,  $0248   ; 6D59   03E8 03E8 0148 0248
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6D5D   010B 03E8 03E8 03E8
        DECLE   $03E8,  $0028,  $0148,  $0008   ; 6D61   03E8 0028 0148 0008
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D65   014B 03E8 03E8 03E8
        DECLE   $03E8,  $0268,  $0088,  $0043   ; 6D69   03E8 0268 0088 0043
        DECLE   $03C8,  $03E8,  $03E8,  $03E8   ; 6D6D   03C8 03E8 03E8 03E8
        DECLE   $03E8,  $0068,  $0208,  $0203   ; 6D71   03E8 0068 0208 0203
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D75   014B 03E8 03E8 03E8
        DECLE   $03E8,  $0228,  $0008,  $0005   ; 6D79   03E8 0228 0008 0005
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D7D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $0068,  $0382,  $0005   ; 6D81   03E8 0068 0382 0005
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6D85   014B 03E8 03E8 03E8
        DECLE   $03E8,  $0028,  $03C0,  $01C5   ; 6D89   03E8 0028 03C0 01C5
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6D8D   010B 03E8 03E8 03E8
        DECLE   $0068,  $0342,  $03C0,  $01C5   ; 6D91   0068 0342 03C0 01C5
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6D95   010B 03E8 03E8 03E8
        DECLE   $0028,  $0382,  $0342,  $0045   ; 6D99   0028 0382 0342 0045
        DECLE   $010B,  $03E8,  $03E8,  $00A8   ; 6D9D   010B 03E8 03E8 00A8
        DECLE   $0382,  $03C0,  $0302,  $01C5   ; 6DA1   0382 03C0 0302 01C5
        DECLE   $018B,  $03E8,  $0068,  $00E8   ; 6DA5   018B 03E8 0068 00E8
        DECLE   $03C0,  $0302,  $03C0,  $03C0   ; 6DA9   03C0 0302 03C0 03C0
        DECLE   $018B,  $00A8,  $00E8,  $0302   ; 6DAD   018B 00A8 00E8 0302
        DECLE   $0342,  $03C0,  $03C0,  $0342   ; 6DB1   0342 03C0 03C0 0342
        DECLE   $018B,  $0282,  $02C2,  $0342   ; 6DB5   018B 0282 02C2 0342
        DECLE   $03C0,  $02C2,  $0302,  $0045   ; 6DB9   03C0 02C2 0302 0045
        DECLE   $018B,  $0282,  $03C0,  $0382   ; 6DBD   018B 0282 03C0 0382
        DECLE   $02C2,  $0342,  $02C2,  $0005   ; 6DC1   02C2 0342 02C2 0005
        DECLE   $018B,  $0268,  $02C2,  $03C0   ; 6DC5   018B 0268 02C2 03C0
        DECLE   $02C2,  $0382,  $03C0,  $01C5   ; 6DC9   02C2 0382 03C0 01C5
        DECLE   $018B,  $03E8,  $01E8,  $02C2   ; 6DCD   018B 03E8 01E8 02C2
        DECLE   $0382,  $03C0,  $02C2,  $0085   ; 6DD1   0382 03C0 02C2 0085
        DECLE   $018B,  $03E8,  $03E8,  $01E8   ; 6DD5   018B 03E8 03E8 01E8
        DECLE   $03C0,  $03C0,  $0382,  $0005   ; 6DD9   03C0 03C0 0382 0005
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6DDD   010B 03E8 03E8 03E8
        DECLE   $0268,  $0302,  $03C0,  $0245   ; 6DE1   0268 0302 03C0 0245
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6DE5   014B 03E8 03E8 03E8
        DECLE   $03E8,  $0268,  $0342,  $01C5   ; 6DE9   03E8 0268 0342 01C5
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6DED   014B 03E8 03E8 03E8
        DECLE   $03E8,  $01E8,  $0302,  $0205   ; 6DF1   03E8 01E8 0302 0205
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6DF5   010B 03E8 03E8 03E8
        DECLE   $03E8,  $00A8,  $0248,  $01C5   ; 6DF9   03E8 00A8 0248 01C5
        DECLE   $018B,  $03E8,  $03E8,  $03E8   ; 6DFD   018B 03E8 03E8 03E8
        DECLE   $03E8,  $0228,  $0008,  $0382   ; 6E01   03E8 0228 0008 0382
        DECLE   $018B,  $03E8,  $03E8,  $03E8   ; 6E05   018B 03E8 03E8 03E8
        DECLE   $03E8,  $0068,  $03C0,  $0085   ; 6E09   03E8 0068 03C0 0085
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6E0D   010B 03E8 03E8 03E8
        DECLE   $03E8,  $0028,  $0342,  $0205   ; 6E11   03E8 0028 0342 0205
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6E15   010B 03E8 03E8 03E8
        DECLE   $03E8,  $0282,  $02C2,  $0302   ; 6E19   03E8 0282 02C2 0302
        DECLE   $010B,  $03E8,  $03E8,  $03E8   ; 6E1D   010B 03E8 03E8 03E8
        DECLE   $03E8,  $02C2,  $0382,  $0205   ; 6E21   03E8 02C2 0382 0205
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6E25   014B 03E8 03E8 03E8
        DECLE   $03E8,  $01E8,  $03C0,  $02C2   ; 6E29   03E8 01E8 03C0 02C2
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6E2D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $01C8,  $0382   ; 6E31   03E8 03E8 01C8 0382
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6E35   014B 03E8 03E8 03E8
        DECLE   $03E8,  $03E8,  $03C8,  $01C8   ; 6E39   03E8 03E8 03C8 01C8
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6E3D   014B 03E8 03E8 03E8
        DECLE   $03E8,  $00A8,  $0048,  $01C8   ; 6E41   03E8 00A8 0048 01C8
        DECLE   $014B,  $03E8,  $03E8,  $03E8   ; 6E45   014B 03E8 03E8 03E8
        DECLE   $03E8,  $01E8,  $0208,  $0148   ; 6E49   03E8 01E8 0208 0148
        DECLE   $03C8,  $0022,  $0288,  $0042   ; 6E4D   03C8 0022 0288 0042
        DECLE   $0148,  $0042,  $0128,  $0042   ; 6E51   0148 0042 0128 0042
        DECLE   $0214,  $0042,  $020C,  $0024   ; 6E55   0214 0042 020C 0024
        DECLE   $0104,  $0014,  $0102,  $0228   ; 6E59   0104 0014 0102 0228
        DECLE   $00A2,  $0024,  $0041,  $0012   ; 6E5D   00A2 0024 0041 0012
        DECLE   $0082,  $0012,  $0092,  $0011   ; 6E61   0082 0012 0092 0011
        DECLE   $008A,  $0011,  $0284,  $0021   ; 6E65   008A 0011 0284 0021
        DECLE   $0104,  $0042,  $0108,  $0042   ; 6E69   0104 0042 0108 0042
        DECLE   $0108,  $0002,  $0210,  $0004   ; 6E6D   0108 0002 0210 0004
        DECLE   $0214,  $0004,  $0208,  $0002   ; 6E71   0214 0004 0208 0002
        DECLE   $0108,  $0202,  $0100,  $0102   ; 6E75   0108 0202 0100 0102
        DECLE   $0080,  $0102,  $0040,  $0101   ; 6E79   0080 0102 0040 0101
        DECLE   $0060,  $0082,  $0090,  $0084   ; 6E7D   0060 0082 0090 0084
        DECLE   $0088,  $0048,  $0108,  $0070   ; 6E81   0088 0048 0108 0070
        DECLE   $0100,  $0050,  $0300,  $004C   ; 6E85   0100 0050 0300 004C
        DECLE   $0100,  $0042,  $0108,  $0082   ; 6E89   0100 0042 0108 0082
        DECLE   $0090,  $0082,  $00A0,  $0082   ; 6E8D   0090 0082 00A0 0082
        DECLE   $0041,  $0104,  $0081,  $0204   ; 6E91   0041 0104 0081 0204
        DECLE   $0080,  $0208,  $0140,  $0008   ; 6E95   0080 0208 0140 0008
        DECLE   $0121,  $0008,  $0111,  $0008   ; 6E99   0121 0008 0111 0008
        DECLE   $0108,  $0004,  $0208,  $0084   ; 6E9D   0108 0004 0208 0084
        DECLE   $0104,  $0084,  $0084,  $0102   ; 6EA1   0104 0084 0084 0102
        DECLE   $0084,  $0102,  $0102,  $0201   ; 6EA5   0084 0102 0102 0201
        DECLE   $0102,  $0001,  $0201,  $0001   ; 6EA9   0102 0001 0201 0001
        DECLE   $0202,  $0010,  $0039,  $0002   ; 6EAD   0202 0010 0039 0002
        DECLE   $00BA,  $006E,  $0003,  $00D2   ; 6EB1   00BA 006E 0003 00D2
        DECLE   $006E,  $0003,  $0020,  $0039   ; 6EB5   006E 0003 0020 0039
        DECLE   $0004,  $0084,  $0052,  $001A   ; 6EB9   0004 0084 0052 001A
        DECLE   $0001,  $00A2,  $0052,  $000C   ; 6EBD   0001 00A2 0052 000C
        DECLE   $00A4,  $0042,  $0084,  $0052   ; 6EC1   00A4 0042 0084 0052
        DECLE   $0029,  $0006,  $0014,  $00AA   ; 6EC5   0029 0006 0014 00AA
        DECLE   $0045,  $0004,  $0045,  $0081   ; 6EC9   0045 0004 0045 0081
        DECLE   $006A,  $0014,  $0034,  $004B   ; 6ECD   006A 0014 0034 004B
        DECLE   $0044,  $0008,  $0004,  $0008   ; 6ED1   0044 0008 0004 0008
        DECLE   $0045,  $00AA,  $0018,  $0024   ; 6ED5   0045 00AA 0018 0024
        DECLE   $0042,  $0004,  $0008,  $0004   ; 6ED9   0042 0004 0008 0004
        DECLE   $00C6,  $0029,  $0018,  $0064   ; 6EDD   00C6 0029 0018 0064
        DECLE   $0008,  $0000,  $0010,  $000C   ; 6EE1   0008 0000 0010 000C
        DECLE   $00A2,  $0055,  $0008,  $0014   ; 6EE5   00A2 0055 0008 0014
        DECLE   $0024,  $0030,  $00D2,  $0300   ; 6EE9   0024 0030 00D2 0300
        DECLE   $0007,  $003B,  $00FF,  $0300   ; 6EED   0007 003B 00FF 0300
        DECLE   $00C0,  $00F0,  $00F8,  $00F7   ; 6EF1   00C0 00F0 00F8 00F7
        DECLE   $00FE,  $0300,  $00E0,  $00FC   ; 6EF5   00FE 0300 00E0 00FC
        DECLE   $0100,  $0300,  $0008,  $001E   ; 6EF9   0100 0300 0008 001E
        DECLE   $00FF,  $0200,  $0001,  $0003   ; 6EFD   00FF 0200 0001 0003
        DECLE   $000F,  $001F,  $01FF,  $0300   ; 6F01   000F 001F 01FF 0300
        DECLE   $0100,  $0003,  $0007,  $0300   ; 6F05   0100 0003 0007 0300
        DECLE   $0001,  $0003,  $0007,  $003F   ; 6F09   0001 0003 0007 003F
        DECLE   $001F,  $007F,  $03FF,  $01FF   ; 6F0D   001F 007F 03FF 01FF
        DECLE   $01FF,  $0300,  $0100,  $00FF   ; 6F11   01FF 0300 0100 00FF
        DECLE   $0300,  $0200,  $02FF,  $0300   ; 6F15   0300 0200 02FF 0300
        DECLE   $0300,  $0080,  $00C0,  $00F8   ; 6F19   0300 0080 00C0 00F8
        DECLE   $00FC,  $00FF,  $0300,  $0100   ; 6F1D   00FC 00FF 0300 0100
        DECLE   $00C0,  $00E0,  $00C0,  $00E0   ; 6F21   00C0 00E0 00C0 00E0
        DECLE   $01F8,  $00FC,  $00FE,  $01FF   ; 6F25   01F8 00FC 00FE 01FF
        DECLE   $00FF                           ; 6F29   00FF

        SARC    R0,     2                       ; 6F2A   007C
        RRC     R0,     1                       ; 6F2B   0070
        GSWD    R0                              ; 6F2C   0030
        GSWD    R2                              ; 6F2D   0032
        DECR    R1                              ; 6F2E   0011
        INCR    R0                              ; 6F2F   0008
        INCR    R4                              ; 6F30   000C
        INCR    R0                              ; 6F31   0008
        SUBR    R0,     R4                      ; 6F32   0104
        EIS                                     ; 6F33   0002
        BC      L_6F36                          ; 6F34   0201 0000

L_6F36:
        DECR    R0                              ; 6F36   0010
        SUB@    R4,     R0                      ; 6F37   0320
        SWAP    R0,     1                       ; 6F38   0040
        ANDR    R0,     R0                      ; 6F39   0180
        B       L_6F54                          ; 6F3A   0200 0018

        DECLE   $0025,  $00C0,  $0100,  $0300   ; 6F3C   0025 00C0 0100 0300
        DECLE   $00E0,  $0010,  $0005,  $0000   ; 6F40   00E0 0010 0005 0000

        SUB     G_0300, R0                      ; 6F44   0300 0300
        MOVR    R0,     R5                      ; 6F46   0085
        ADDR    R5,     R7                      ; 6F47   00EF

        ADDR    R5,     R5                      ; 6F48   00ED
        ADDR    R3,     R7                      ; 6F49   00DF

        DECLE   $00BB,  $00BD,  $01FF,  $0041   ; 6F4A   00BB 00BD 01FF 0041
        DECLE   $00D3,  $00F7,  $00FF           ; 6F4E   00D3 00F7 00FF

        ADDR    R5,     R7                      ; 6F51   00EF
        ADDR    R3,     R7                      ; 6F52   00DF

        ADDR    R7,     R3                      ; 6F53   00FB
L_6F54:
        ADDR    R7,     R5                      ; 6F54   00FD
        DECLE   $003C,  $0042,  $009D,  $00A1   ; 6F55   003C 0042 009D 00A1
        DECLE   $00A1,  $009D,  $0042,  $003C   ; 6F59   00A1 009D 0042 003C
        DECLE   $0100,  $007F,  $00A2,  $007F   ; 6F5D   0100 007F 00A2 007F
        DECLE   $0200,  $0100,  $00FF,  $0022   ; 6F61   0200 0100 00FF 0022
        DECLE   $00FF,  $0300,  $007F,  $0080   ; 6F65   00FF 0300 007F 0080
        DECLE   $00FF,  $0080,  $007F,  $0100   ; 6F69   00FF 0080 007F 0100
        DECLE   $0030,  $0018,  $001C,  $003E   ; 6F6D   0030 0018 001C 003E
        DECLE   $00FF,  $003C,  $0018,  $0030   ; 6F71   00FF 003C 0018 0030
        DECLE   $0028,  $0010,  $0018,  $001D   ; 6F75   0028 0010 0018 001D
        DECLE   $005E,  $0076,  $001C,  $0018   ; 6F79   005E 0076 001C 0018
        DECLE   $0300,  $0200,  $00FF,  $0300   ; 6F7D   0300 0200 00FF 0300
        DECLE   $0300,  $00FF,  $0281,  $00FF   ; 6F81   0300 00FF 0281 00FF
        DECLE   $0281,  $006B,  $0080,  $0181   ; 6F85   0281 006B 0080 0181
        DECLE   $0076,  $0001,  $0081,  $0080   ; 6F89   0076 0001 0081 0080
        DECLE   $0042,  $0000,  $0080,  $0001   ; 6F8D   0042 0000 0080 0001
        DECLE   $0024,  $0001,  $0080,  $0000   ; 6F91   0024 0001 0080 0000
        DECLE   $0300,  $0300,  $0300,  $0000   ; 6F95   0300 0300 0300 0000
        DECLE   $001C,  $007E,  $00FE,  $00FF   ; 6F99   001C 007E 00FE 00FF
        DECLE   $007F,  $002E,  $0300,  $0300   ; 6F9D   007F 002E 0300 0300
        DECLE   $0100,  $001C,  $007E,  $00FE   ; 6FA1   0100 001C 007E 00FE
        DECLE   $00FF,  $007F,  $002E,  $0300   ; 6FA5   00FF 007F 002E 0300
        DECLE   $0000,  $000C,  $0078,  $00DD   ; 6FA9   0000 000C 0078 00DD
        DECLE   $007F,  $00FD,  $0070,  $0018   ; 6FAD   007F 00FD 0070 0018
        DECLE   $0300,  $0300,  $0000,  $0008   ; 6FB1   0300 0300 0000 0008
        DECLE   $0078,  $00DD,  $00FF,  $00FD   ; 6FB5   0078 00DD 00FF 00FD
        DECLE   $0070,  $0010,  $0300,  $0300   ; 6FB9   0070 0010 0300 0300
        DECLE   $0000,  $0037,  $003A,  $003F   ; 6FBD   0000 0037 003A 003F
        DECLE   $003A,  $0047,  $003A,  $004F   ; 6FC1   003A 0047 003A 004F
        DECLE   $003A,  $0000,  $0032,  $0000   ; 6FC5   003A 0000 0032 0000
        DECLE   $0002,  $0001,  $003A,  $0009   ; 6FC9   0002 0001 003A 0009
        DECLE   $003A,  $0011,  $003A,  $001C   ; 6FCD   003A 0011 003A 001C
        DECLE   $000A,  $0024,  $000A,  $0028   ; 6FD1   000A 0024 000A 0028
        DECLE   $000A,  $00D5,  $000A,  $00DD   ; 6FD5   000A 00D5 000A 00DD
        DECLE   $000A,  $00E1,  $0008,  $00EA   ; 6FD9   000A 00E1 0008 00EA
        DECLE   $000A,  $00F2,  $000A,  $00FA   ; 6FDD   000A 00F2 000A 00FA
        DECLE   $000A,  $0003,  $000B,  $000B   ; 6FE1   000A 0003 000B 000B
        DECLE   $000B,  $00C0,  $0090,  $0060   ; 6FE5   000B 00C0 0090 0060
        DECLE   $0050,  $0050,  $0000,  $00AE   ; 6FE9   0050 0050 0000 00AE
        DECLE   $006E,  $00AE,  $006E,  $00AE   ; 6FED   006E 00AE 006E 00AE
        DECLE   $006E,  $00B1,  $006E,  $00B4   ; 6FF1   006E 00B1 006E 00B4
        DECLE   $006E,  $00B7                   ; 6FF5   006E 00B7

        SAR     R2,     2                       ; 6FF7   006E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFC   0000 0000 0000 0000
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
;;  $5323       $5350  
;;  $5331       $532A  
;;  $534A       $5346  
;;  $534D       $532F  
;;  $5353       $51DF  
;;  $5357       $5355  
;;  $535D       $536E  
;;  $5371       $532C  
;;  $53A1       $5389  
;;  $53B5       $53B1  
;;  $53B6       $53B4  
;;  $53C1       $5394  
;;  $53D4       $53D9  
;;  $53DB       $53CB  
;;  $53E1       $53DF  
;;  $53E7       $53F3  
;;  $53EE       $53F0  
;;  $53F6       $52B0  
;;  $5401       $53FD  
;;  $5417       $5410  
;;  $5418       $5416  
;;  $5430       $5414  
;;  $5443       $5440  
;;  $5459       $5455  
;;  $5461       $6759  
;;  $5482       $52E7   $5F23   $6375  
;;  $548F       $548C  
;;  $5497       $5492   $54A6  
;;  $54A4       $5499  
;;  $54A9       $546B   $5F20   $6371  
;;  $54B6       $54AF  
;;  $54BB       $54AC  
;;  $54C3       $54BC  
;;  $54C6       $54B4   $54B9   $54C1  
;;  $54C8       $54B1  
;;  $54CD       $54DC  
;;  $54CF       $54D4  
;;  $54DF       $54B6  
;;  $54E8       $5513  
;;  $5516       $54BE  
;;  $551B       $5526  
;;  $551D       $5520  
;;  $5529       $54C3  
;;  $5530       $5533  
;;  $553E       $569C  
;;  $5542       $5747   $5A8D   $5B2F   $5B34   $5B39   $5B75   $5BF5   $5FC0  
;;  $5542       $6094   $634B  
;;  $5543       $5541  
;;  $5544       $5670   $5B70  
;;  $5545       $5543  
;;  $5547       $554F  
;;  $5556       $5840   $5A7F   $5B2A   $5B94   $5B9C   $5FC5   $6084   $6357  
;;  $5557       $5555  
;;  $5558       $5B25  
;;  $5559       $5557  
;;  $555B       $5561  
;;  $5564       $569F  
;;  $5567       $598C   $59FB   $5B68   $5BDE   $62C8   $6352  
;;  $5569       $558C   $5B1F   $5DA3   $6150   $616B   $617E   $61D3  
;;  $556A       $5568  
;;  $5572       $5581  
;;  $559C       $557C  
;;  $55A9       $5949   $6430   $6B79  
;;  $55AB       $58DC   $5AC3   $61AA   $61BA   $62E3   $63BF   $6597   $66B6  
;;  $55AC       $55AA  
;;  $55AD       $55D6  
;;  $55D9       $55AF   $55BF   $55DF  
;;  $55E2       $573D   $5ACB  
;;  $55E9       $5846  
;;  $5627       $506F  
;;  $567A       $565C  
;;  $567F       $5681  
;;  $5692       $568E  
;;  $5693       $5BFD  
;;  $56D6       $569A  
;;  $56DE       $56D8  
;;  $56E8       $56E0  
;;  $56F2       $56EC  
;;  $56F6       $56DC   $56E6   $56F0  
;;  $56FF       $56FB  
;;  $570B       $574F   $575A  
;;  $5713       $570E  
;;  $572B       $5726  
;;  $5733       $572D  
;;  $5737       $5722  
;;  $574B       $5731   $5739  
;;  $5752       $574D  
;;  $575D       $5758  
;;  $576E       $5768  
;;  $5772       $575E  
;;  $578C       $5774   $577F  
;;  $578D       $5733   $620E  
;;  $57C3       $57C0  
;;  $57CC       $57C4  
;;  $57D4       $57CA  
;;  $57D6       $5791  
;;  $57D7       $57A4   $57B5  
;;  $57E0       $57DB  
;;  $57E3       $57AD   $57B2  
;;  $57F3       $57F0  
;;  $5801       $57FF  
;;  $5802       $57F6   $57FC  
;;  $5823       $5728  
;;  $5858       $5853  
;;  $5860       $5859  
;;  $5862       $5856  
;;  $586B       $5864  
;;  $58A0       $5909  
;;  $58B6       $58A5  
;;  $58BA       $58AB  
;;  $58BE       $58B4  
;;  $58C9       $58C5  
;;  $5905       $58E6  
;;  $5906       $58A1  
;;  $590C       $58B8  
;;  $5943       $5939  
;;  $5944       $5925   $592F  
;;  $596B       $5993  
;;  $5983       $5973  
;;  $598B       $5987  
;;  $5990       $597D   $5981  
;;  $5996       $546E   $5F28   $637B  
;;  $59B0       $59A0  
;;  $59B7       $59AE  
;;  $59D3       $59CE  
;;  $59D5       $59D1  
;;  $59E7       $59CA  
;;  $59EF       $59E9  
;;  $59F7       $59ED  
;;  $59FF       $59E5   $59F1   $59F5  
;;  $5A06       $59C6  
;;  $5A0A       $5999  
;;  $5A18       $5A0C  
;;  $5A21       $5A16  
;;  $5A3B       $5A2E  
;;  $5A44       $5A3D  
;;  $5A48       $5A5E  
;;  $5A53       $5A46  
;;  $5A5C       $5A55  
;;  $5A69       $5A62  
;;  $5A6C       $5A39   $5A42   $5A51   $5A5A   $5A67  
;;  $5A72       $5A6E  
;;  $5A7F       $5A79  
;;  $5A83       $5A7D  
;;  $5A8B       $5A85  
;;  $5A91       $5A89  
;;  $5A9B       $5A93  
;;  $5AA5       $5A9D  
;;  $5AAF       $5AA7  
;;  $5AB7       $5A99   $5AA3   $5AAD  
;;  $5AE9       $5AE3  
;;  $5AEB       $5AE7  
;;  $5AED       $5AB8  
;;  $5AEE       $5AB1  
;;  $5AFA       $5AF0   $5AF5  
;;  $5B51       $5B0B  
;;  $5B9F       $5B00   $5B05   $5B13   $5B53   $5B5B  
;;  $5BA0       $5B43   $5B8C   $5D05  
;;  $5BB1       $59BF  
;;  $5BCA       $5BB9  
;;  $5BCD       $5BB4  
;;  $5BD6       $5BCF  
;;  $5BDA       $5BD4  
;;  $5BE2       $5BD8  
;;  $5C12       $5BF2  
;;  $5C15       $5BE9  
;;  $5C18       $5BE4  
;;  $5C19       $59FF  
;;  $5C22       $5C26  
;;  $5C32       $5C2E  
;;  $5C3E       $5C85  
;;  $5C44       $5C48  
;;  $5C4B       $5A06  
;;  $5C59       $5C5D  
;;  $5C6C       $5C66  
;;  $5C75       $5C81  
;;  $5C87       $5A02  
;;  $5C94       $5C90  
;;  $5CA6       $5C9C   $5CA2  
;;  $5CAF       $5CAC  
;;  $5CB3       $5CB6  
;;  $5CC5       $5C78  
;;  $5CF0       $5CDE   $5CEA  
;;  $5CF5       $5A36   $5A4E   $5D64  
;;  $5D00       $5A3F  
;;  $5D18       $5D27  
;;  $5D2A       $5A57  
;;  $5D3F       $5D36   $5D3B  
;;  $5D42       $5D5A  
;;  $5D4B       $5D43  
;;  $5D56       $5D49  
;;  $5D5D       $5A64  
;;  $5D79       $5A69  
;;  $5D80       $5D8F  
;;  $5D92       $5DC2   $5ED8   $62D1  
;;  $5D9B       $56B6   $576E  
;;  $5DA6       $5DA0  
;;  $5E21       $5E17  
;;  $5E2C       $5E22  
;;  $5E37       $5E2D  
;;  $5E42       $5E38  
;;  $5E4D       $5E43  
;;  $5E58       $5E4E  
;;  $5E59       $5DA7   $5EDF  
;;  $5E60       $5E6D  
;;  $5E6B       $5E62  
;;  $5E70       $589A  
;;  $5E76       $5E80  
;;  $5E7C       $5E78  
;;  $5E7D       $5E7B  
;;  $5EA6       $5EA1  
;;  $5EA7       $576A  
;;  $5EC9       $5EAC  
;;  $5ED2       $5ECB  
;;  $5EDB       $5EB5   $5EC7   $5ED0  
;;  $5EF2       $5EE8  
;;  $5EFC       $5668   $5ECD  
;;  $5F0B       $5EAE  
;;  $5F1A       $5F09  
;;  $5F1C       $5F2E  
;;  $5F34       $5F15   $5F30  
;;  $5F44       $5F39   $5F40   $5F4C  
;;  $5F60       $5F8A  
;;  $5F7B       $5F56   $5F66  
;;  $5F88       $5F81   $5F85  
;;  $5FB0       $5FA6  
;;  $5FCA       $5F9C  
;;  $5FDA       $5FD0  
;;  $5FDF       $5FDC  
;;  $5FF5       $5FC8   $5FD6  
;;  $6004       $5FEF  
;;  $6008       $5FA2   $5FAA   $5FAE   $5FD8  
;;  $6012       $5F93   $600E  
;;  $601A       $6044  
;;  $601B       $6018  
;;  $6041       $6022  
;;  $6042       $601D  
;;  $604D       $6048  
;;  $605D       $6055  
;;  $605E       $604D  
;;  $606B       $6065  
;;  $606C       $604A  
;;  $6087       $6073  
;;  $6097       $6090  
;;  $6098       $5F8D  
;;  $60A5       $609D  
;;  $60A9       $60A3  
;;  $60BC       $60B1  
;;  $60BF       $60BA  
;;  $60C2       $60B5   $60B8   $60BD  
;;  $60F0       $60C8   $60CD  
;;  $610A       $6104  
;;  $610D       $60F5  
;;  $612B       $6125  
;;  $6133       $612D  
;;  $613B       $6135  
;;  $613D       $6129   $6131   $6139  
;;  $613F       $6115  
;;  $6153       $6112  
;;  $616E       $6158  
;;  $6176       $6173  
;;  $6197       $6193  
;;  $61AE       $618B  
;;  $61B0       $619B  
;;  $61D2       $61CF  
;;  $61EB       $61E7  
;;  $621F       $6205  
;;  $6220       $6106   $6216  
;;  $6222       $610A  
;;  $6224       $6025  
;;  $6229       $60D9   $614B   $61F0  
;;  $622B       $6166   $6183  
;;  $622F       $6227  
;;  $624A       $5C12  
;;  $6272       $5632  
;;  $6273       $6271  
;;  $629D       $6250  
;;  $629E       $6295   $629A  
;;  $62A1       $62AC  
;;  $62BF       $6004  
;;  $62D7       $6313  
;;  $6325       $5FF1  
;;  $636D       $6382  
;;  $638E       $63AC  
;;  $63A7       $63A3  
;;  $63A9       $6394  
;;  $63B7       $63B2  
;;  $63B8       $5673   $63C7  
;;  $63C6       $5B78   $5D01  
;;  $6427       $59D7   $5B46  
;;  $64D9       $64D7  
;;  $6590       $5B8F  
;;  $664F       $664B  
;;  $6650       $664E  
;;  $667E       $667C  
;;  $66AF       $5AF7  
;;  $66F3       $66F1  
;;  $68D6       $68D4  
;;  $6AB5       $6AB3  
;;  $6AC5       $6AC3  
;;  $6AE7       $6AE5  
;;  $6AF7       $6AF5  
;;  $6B27       $6B25  
;;  $6B70       $5BBB   $5C15  
;;  $6BCB       $6075  
;;  $6BDF       $5B97  
;;  $6C09       $5676   $6385  
;;  $6C14       $5B49  
;;  $6C2C       <entry>
;;  $6C31       $6028   $60F7   $6211   $6BC7  
;;  $6C3B       $613F   $615A   $61F3  
;;  $6F36       $6F34  
;;  $6F54       $6F3A  
;; ======================================================================== ;;
