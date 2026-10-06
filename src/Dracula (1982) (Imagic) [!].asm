
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
        MVII    #$02FA, R6                      ; 5021   02BE 02FA
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
        MVII    #$5572, R0                      ; 5039   02B8 0072 0055
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
        MVII    #$5552, R4                      ; 5056   02BC 0052 0055
        MVII    #$0335, R5                      ; 5059   02BD 0335
L_505B:
        MVI@    R4,     R0                      ; 505B   02A0
        XORR    R2,     R0                      ; 505C   01D0
        MVO@    R0,     R5                      ; 505D   0268
        DECR    R1                              ; 505E   0011
        BNEQ    L_505B                          ; 505F   022C 0005

        MVII    #$0177, R4                      ; 5061   02BC 0177
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

        JSR     R5,     L_628E                  ; 506F   0004 0160 028E
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
        MVII    #$555A, R4                      ; 5091   02BC 005A 0055
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
        CMPI    #$016F, R3                      ; 50B5   037B 016F
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
        MVO     R0,     G_017E                  ; 51B7   0240 017E
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

        MVI     G_017E, R1                      ; 51D4   0281 017E
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

        MVII    #$016F, R1                      ; 520F   02B9 016F
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
        MVII    #$5552, R5                      ; 522C   02BD 0052 0055
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
        MVII    #$0177, R1                      ; 5285   02B9 0177
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
        MVII    #$554B, R4                      ; 53AC   02BC 004B 0055
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
        MVII    #$557C, R4                      ; 53CB   02BC 007C 0055
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
        MVII    #$5BB9, R4                      ; 53E0   02BC 00B9 005B

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
        MVO     R2,     G_017C                  ; 5429   0242 017C
        MVI     .ISRVEC.1,R2                    ; 542B   0282 0101
        MVO     R2,     G_017D                  ; 542D   0242 017D
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
        JSR     R5,     L_6C21                  ; 547B   0004 016C 0021
        JSR     R5,     X_PLAY_NOTE             ; 547E   0004 0118 02BD

        DIS                                     ; 5481   0003
        MVI     G_017C, R0                      ; 5482   0280 017C
        MVO     R0,     .ISRVEC.0               ; 5484   0240 0100
        MVI     G_017D, R0                      ; 5486   0280 017D
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

        DECLE   $0001,  $0003,  $0003,  $0003   ; 554B   0001 0003 0003 0003
        DECLE   $0003,  $0000,  $0001,  $01F0   ; 554F   0003 0000 0001 01F0
        DECLE   $01E0,  $01D0,  $01C0,  $01B0   ; 5553   01E0 01D0 01C0 01B0
        DECLE   $01A0,  $0190,  $0180,  $0028   ; 5557   01A0 0190 0180 0028
        DECLE   $0060,  $005E,  $0001,  $00B5   ; 555B   0060 005E 0001 00B5
        DECLE   $005E,  $0002,  $000D,  $005F   ; 555F   005E 0002 000D 005F
        DECLE   $0005,  $009B,  $005F,  $0003   ; 5563   0005 009B 005F 0003
        DECLE   $00E1,  $005F,  $0001,  $0045   ; 5567   00E1 005F 0001 0045
        DECLE   $0060,  $0001                   ; 556B   0060 0001

        MOVR    R7,     R2                      ; 556D   00BA
        SLR     R0,     1                       ; 556E   0060
        SETC                                    ; 556F   0007
        ADDR    R7,     R1                      ; 5570   00F9
        SLR     R0,     1                       ; 5571   0060
        ADDR    R2,     R3                      ; 5572   00D3
        SLR     R2,     1                       ; 5573   0062
        ADCR    R7                              ; 5574   002F

        SLR     R0,     2                       ; 5575   0064
L_5576:
        SLR     R0,     2                       ; 5576   0064
        SLR     R3,     1                       ; 5577   0063
        MOVR    R2,     R7                      ; 5578   0097

        DECLE   $0063,  $001E,  $0064,  $0000   ; 5579   0063 001E 0064 0000
        DECLE   $0030,  $0050,  $0020,  $0000   ; 557D   0030 0050 0020 0000

        MOVR    R1,     R3                      ; 5581   008B
        RLC     R1,     2                       ; 5582   0055
        MOVR    R1,     R6                      ; 5583   008E
        RLC     R1,     2                       ; 5584   0055
        MOVR    R2,     R1                      ; 5585   0091
        RLC     R1,     2                       ; 5586   0055
        MOVR    R2,     R4                      ; 5587   0094
        RLC     R1,     2                       ; 5588   0055
        MOVR    R2,     R7                      ; 5589   0097

        DECLE   $0055,  $00E8,  $0058,  $0003   ; 558A   0055 00E8 0058 0003
        DECLE   $0009,  $005B,  $0004,  $0079   ; 558E   0009 005B 0004 0079
        DECLE   $005A,  $0003,  $0084,  $005A   ; 5592   005A 0003 0084 005A
        DECLE   $0003,  $0058,  $0058,  $0008   ; 5596   0003 0058 0058 0008
        DECLE   $006A,  $0009,  $0098,  $0000   ; 559A   006A 0009 0098 0000
        DECLE   $0000,  $0000,  $0090,  $0056   ; 559E   0000 0000 0090 0056
        DECLE   $0000,  $0000,  $0000,  $0049   ; 55A2   0000 0000 0000 0049
        DECLE   $0080,  $0040,  $0007,  $0000   ; 55A6   0080 0040 0007 0000
        DECLE   $0096,  $0056,  $0000,  $0000   ; 55AA   0096 0056 0000 0000
        DECLE   $0000,  $0088,  $00A8,  $0081   ; 55AE   0000 0088 00A8 0081
        DECLE   $0002,  $0000,  $0026,  $0056   ; 55B2   0002 0000 0026 0056
        DECLE   $0014,  $0000,  $0000,  $00C9   ; 55B6   0014 0000 0000 00C9
        DECLE   $0080,  $00C1,  $0006,  $0000   ; 55BA   0080 00C1 0006 0000
        DECLE   $002C,  $0056,  $0000,  $0000   ; 55BE   002C 0056 0000 0000
        DECLE   $00B4,  $0089,  $00B9,  $0081   ; 55C2   00B4 0089 00B9 0081
        DECLE   $0001,  $0000,  $0042,  $0056   ; 55C6   0001 0000 0042 0056
        DECLE   $03E4,  $0000,  $0000,  $00C9   ; 55CA   03E4 0000 0000 00C9
        DECLE   $0080,  $00C1,  $0006,  $0000   ; 55CE   0080 00C1 0006 0000
        DECLE   $004A,  $0056,  $0000,  $0000   ; 55D2   004A 0056 0000 0000
        DECLE   $0000,  $00C8,  $0080,  $00C0   ; 55D6   0000 00C8 0080 00C0
        DECLE   $0006,  $0000,  $0050,  $0056   ; 55DA   0006 0000 0050 0056
        DECLE   $0000,  $0008,  $0068,  $0088   ; 55DE   0000 0008 0068 0088
        DECLE   $0098,  $0080,  $0007,  $0020   ; 55E2   0098 0080 0007 0020
        DECLE   $009C,  $0056,  $0000,  $00FC   ; 55E6   009C 0056 0000 00FC
        DECLE   $0068,  $0088,  $0098,  $0080   ; 55EA   0068 0088 0098 0080
        DECLE   $0006,  $0020,  $00A2,  $0056   ; 55EE   0006 0020 00A2 0056
        DECLE   $0000,  $00FC,  $0050,  $008D   ; 55F2   0000 00FC 0050 008D
        DECLE   $0086,  $0080,  $0007,  $0010   ; 55F6   0086 0080 0007 0010
        DECLE   $0064,  $0056,  $0000,  $0000   ; 55FA   0064 0056 0000 0000
        DECLE   $00C8,  $0089,  $00B7,  $0080   ; 55FE   00C8 0089 00B7 0080
        DECLE   $0007,  $0000,  $007C,  $0056   ; 5602   0007 0000 007C 0056
        DECLE   $00EC,  $0000,  $0000,  $00C9   ; 5606   00EC 0000 0000 00C9
        DECLE   $0080,  $00C0,  $0007,  $0000   ; 560A   0080 00C0 0007 0000
        DECLE   $0088,  $0056,  $0008,  $0000   ; 560E   0088 0056 0008 0000

        MOVR    R2,     R0                      ; 5612   0090
        SLLC    R0,     2                       ; 5613   005C
        GSWD    R3                              ; 5614   0033
        RLC     R3,     2                       ; 5615   0057

        JSR     R4,     .EXEC.077               ; 5616   0004 0010 0077
        DECLE   $0062,  $00B2,  $005D,  $0083   ; 5619   0062 00B2 005D 0083
        DECLE   $0057,  $0004,  $0000,  $00A5   ; 561D   0057 0004 0000 00A5
        DECLE   $005D,  $00A8,  $0056,  $0004   ; 5621   005D 00A8 0056 0004
        DECLE   $0000,  $00ED,  $0064,  $00FD   ; 5625   0000 00ED 0064 00FD
        DECLE   $0059,  $0004,  $0000,  $00B2   ; 5629   0059 0004 0000 00B2
        DECLE   $005D,  $00BF                   ; 562D   005D 00BF

        SLLC    R1,     1                       ; 562F   0059

        JSR     R4,     X_ISR                   ; 5630   0004 0010 0004
        DECLE   $0062,  $00ED,  $0064,  $0000   ; 5633   0062 00ED 0064 0000
        DECLE   $0059,  $0004,  $0000           ; 5637   0059 0004 0000

        MOVR    R6,     R2                      ; 563A   00B2
        SLLC    R1,     2                       ; 563B   005D
        SWAP    R0,     1                       ; 563C   0040
        SLLC    R1,     1                       ; 563D   0059

        JSR     R4,     X_ISR                   ; 563E   0004 0010 0004
        DECLE   $0062,  $00B2,  $005D,  $0080   ; 5641   0062 00B2 005D 0080
        DECLE   $0059,  $0004                   ; 5645   0059 0004

        B       L_56BC                          ; 5647   0200 0073

        DECLE   $0062,  $00B2,  $005D,  $00C9   ; 5649   0062 00B2 005D 00C9
        DECLE   $005A,  $0004,  $0000,  $00B3   ; 564D   005A 0004 0000 00B3
        DECLE   $005D,  $0031,  $005B,  $0001   ; 5651   005D 0031 005B 0001
        DECLE   $0002,  $0071,  $0061,  $00F5   ; 5655   0002 0071 0061 00F5
        DECLE   $005D,  $0039,  $005B,  $0001   ; 5659   005D 0039 005B 0001
        DECLE   $0000,  $0029,  $005E,  $00E0   ; 565D   0000 0029 005E 00E0
        DECLE   $0058,  $0001,  $0000,  $00C6   ; 5661   0058 0001 0000 00C6
        DECLE   $005D,  $0049,  $005B,  $0004   ; 5665   005D 0049 005B 0004
        DECLE   $0202,  $00A7,  $0061,  $00F1   ; 5669   0202 00A7 0061 00F1
        DECLE   $0061,  $00ED,  $0064,  $00D0   ; 566D   0061 00ED 0064 00D0
        DECLE   $0057,  $0004,  $0000           ; 5671   0057 0004 0000

        MOVR    R6,     R2                      ; 5674   00B2
        SLLC    R1,     2                       ; 5675   005D
        MOVR    R4,     R0                      ; 5676   00A0
        SLLC    R0,     1                       ; 5677   0058

        JSR     R4,     X_ISR                   ; 5678   0004 0010 0004
        DECLE   $0062,  $00B2,  $005D,  $003A   ; 567B   0062 00B2 005D 003A
        DECLE   $005A,  $0003,  $0211,  $0027   ; 567F   005A 0003 0211 0027
        DECLE   $0062,  $0073,  $0062,  $0063   ; 5683   0062 0073 0062 0063
        DECLE   $0062,  $00B2,  $005D,  $009A   ; 5687   0062 00B2 005D 009A
        DECLE   $005A,  $0003,  $0010,  $0073   ; 568B   005A 0003 0010 0073
        DECLE   $0062,  $0030,  $005E,  $000F   ; 568F   0062 0030 005E 000F
        DECLE   $0058,  $0005,  $0000,  $0043   ; 5693   0058 0005 0000 0043
        DECLE   $005E,  $00E3,  $0056,  $0005   ; 5697   005E 00E3 0056 0005
        DECLE   $0000,  $005C,  $006B,  $006A   ; 569B   0000 005C 006B 006A
        DECLE   $005A,  $0001,  $0000,  $005C   ; 569F   005A 0001 0000 005C
        DECLE   $006B,  $0089,  $005B,  $0003   ; 56A3   006B 0089 005B 0003
        DECLE   $0000,  $0000,  $0004,  $0006   ; 56A7   0000 0000 0004 0006
        DECLE   $0007,  $007D,  $00FF,  $00F7   ; 56AB   0007 007D 00FF 00F7
        DECLE   $00E3,  $0082,  $0000,  $0000   ; 56AF   00E3 0082 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 56B7   0000 0000 0000 0004

        CLRC                                    ; 56BB   0006
L_56BC:
        SETC                                    ; 56BC   0007
        RSWD    R5                              ; 56BD   003D
        SARC    R3,     2                       ; 56BE   007F
        ADDR    R4,     R7                      ; 56BF   00E7

        DECLE   $00C3,  $00C2,  $0040,  $0000   ; 56C0   00C3 00C2 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C4   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0006,  $0007   ; 56C8   0000 0004 0006 0007
        DECLE   $0005,  $001F,  $003F,  $0077   ; 56CC   0005 001F 003F 0077
        DECLE   $0062,  $0060,  $0070,  $0038   ; 56D0   0062 0060 0070 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004           ; 56D8   0000 0000 0004

        CLRC                                    ; 56DB   0006
        SETC                                    ; 56DC   0007
        RSWD    R5                              ; 56DD   003D
        SARC    R3,     2                       ; 56DE   007F
        ADDR    R4,     R7                      ; 56DF   00E7

        DECLE   $00C3,  $00C2,  $0040,  $0000   ; 56E0   00C3 00C2 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E4   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $004C,  $004C   ; 56E8   0000 0040 004C 004C
        DECLE   $006C,  $0028,  $003B,  $003E   ; 56EC   006C 0028 003B 003E
        DECLE   $003E,  $003C,  $0038,  $0000   ; 56F0   003E 003C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $004C   ; 56F8   0000 0000 0040 004C
        DECLE   $004C,  $006C,  $0028,  $003B   ; 56FC   004C 006C 0028 003B
        DECLE   $003E,  $003C,  $0038,  $0000   ; 5700   003E 003C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5704   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5708   0000 0000 0000 0080
        DECLE   $0098,  $0098,  $00D8,  $0050   ; 570C   0098 0098 00D8 0050
        DECLE   $0077,  $007E,  $0078,  $0000   ; 5710   0077 007E 0078 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5714   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5718   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0098   ; 571C   0000 0000 0080 0098
        DECLE   $00DA,  $005A,  $0076,  $0000   ; 5720   00DA 005A 0076 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5724   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5728   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 572C   0000 0000 0000 0000
        DECLE   $0000,  $0060,  $0064,  $0098   ; 5730   0000 0060 0064 0098
        DECLE   $00C0,  $0040,  $0060,  $0038   ; 5734   00C0 0040 0060 0038
        DECLE   $0038,  $0078,  $007C,  $0078   ; 5738   0038 0078 007C 0078
        DECLE   $0060,  $00D8,  $00DC,  $0094   ; 573C   0060 00D8 00DC 0094
        DECLE   $0094,  $0036,  $0020,  $004C   ; 5740   0094 0036 0020 004C
        DECLE   $0060,  $0020,  $0030,  $0038   ; 5744   0060 0020 0030 0038
        DECLE   $0078,  $0078,  $007C,  $0078   ; 5748   0078 0078 007C 0078
        DECLE   $00C0,  $00D8,  $0088,  $0088   ; 574C   00C0 00D8 0088 0088
        DECLE   $0018,  $0018,  $000C,  $004C   ; 5750   0018 0018 000C 004C
        DECLE   $0060,  $0020,  $0030,  $0038   ; 5754   0060 0020 0030 0038
        DECLE   $007C,  $0078,  $007E,  $0078   ; 5758   007C 0078 007E 0078
        DECLE   $00C0,  $00D8,  $0098,  $0098   ; 575C   00C0 00D8 0098 0098
        DECLE   $0038,  $0030,  $0038,  $004C   ; 5760   0038 0030 0038 004C
        DECLE   $0060,  $0020,  $0030,  $0038   ; 5764   0060 0020 0030 0038
        DECLE   $007C,  $0078,  $007E,  $0078   ; 5768   007C 0078 007E 0078
        DECLE   $00C4,  $00DE,  $008A,  $009A   ; 576C   00C4 00DE 008A 009A
        DECLE   $0033,  $0020,  $0030,  $0044   ; 5770   0033 0020 0030 0044
        DECLE   $0068,  $0028,  $0020,  $0034   ; 5774   0068 0028 0020 0034
        DECLE   $007E,  $0078,  $007F,  $0078   ; 5778   007E 0078 007F 0078
        DECLE   $00C0,  $00D8,  $0098,  $009C   ; 577C   00C0 00D8 0098 009C
        DECLE   $0034,  $0026,  $0020,  $0008   ; 5780   0034 0026 0020 0008
        DECLE   $001C,  $001C,  $0010,  $0010   ; 5784   001C 001C 0010 0010
        DECLE   $0014,  $0010,  $0012,  $0010   ; 5788   0014 0010 0012 0010
        DECLE   $0018,  $0010,  $0010,  $0010   ; 578C   0018 0010 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0004   ; 5790   0010 0000 0000 0004
        DECLE   $000E,  $000E,  $0008,  $0010   ; 5794   000E 000E 0008 0010
        DECLE   $0014,  $0010,  $0012,  $0010   ; 5798   0014 0010 0012 0010
        DECLE   $0018,  $0010,  $0008,  $0008   ; 579C   0018 0010 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0004   ; 57A0   0008 0000 0000 0004
        DECLE   $000E,  $000E,  $0008,  $0008   ; 57A4   000E 000E 0008 0008
        DECLE   $0002,  $0008,  $0001,  $0008   ; 57A8   0002 0008 0001 0008
        DECLE   $0018,  $0008,  $0008,  $0008   ; 57AC   0018 0008 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0004   ; 57B0   0008 0000 0000 0004
        DECLE   $000E,  $000E,  $0008,  $0008   ; 57B4   000E 000E 0008 0008
        DECLE   $0002,  $0008,  $0001,  $0008   ; 57B8   0002 0008 0001 0008
        DECLE   $001C,  $0008,  $0000,  $0000   ; 57BC   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 57C0   0000 0000 0000 0003
        DECLE   $0006,  $0004,  $0007,  $0008   ; 57C4   0006 0004 0007 0008
        DECLE   $000A,  $0008,  $0009,  $0008   ; 57C8   000A 0008 0009 0008
        DECLE   $0018,  $0008,  $0008,  $0008   ; 57CC   0018 0008 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D0   0000 0000 0000 0000
        DECLE   $0078,  $0070,  $007C,  $0030   ; 57D4   0078 0070 007C 0030
        DECLE   $0020,  $0070,  $0078,  $0028   ; 57D8   0020 0070 0078 0028
        DECLE   $006C,  $00C4,  $0084,  $0000   ; 57DC   006C 00C4 0084 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E0   0000 0000 0000 0000
        DECLE   $0070,  $0078,  $0070,  $003C   ; 57E4   0070 0078 0070 003C
        DECLE   $0020,  $0060,  $0070,  $0038   ; 57E8   0020 0060 0070 0038
        DECLE   $0068,  $0048,  $0008,  $0000   ; 57EC   0068 0048 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F0   0000 0000 0000 0000
        DECLE   $0070,  $0078,  $003C,  $0030   ; 57F4   0070 0078 003C 0030
        DECLE   $0060,  $0060,  $0030,  $0030   ; 57F8   0060 0060 0030 0030
        DECLE   $0030,  $0070,  $0020,  $0000   ; 57FC   0030 0070 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5800   0000 0000 0000 0000
        DECLE   $0070,  $0078,  $0070,  $003C   ; 5804   0070 0078 0070 003C
        DECLE   $0070,  $0070,  $0038,  $0038   ; 5808   0070 0070 0038 0038
        DECLE   $0060,  $0040,  $0040,  $0000   ; 580C   0060 0040 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5810   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0040   ; 5814   0000 0040 0040 0040
        DECLE   $0060,  $0028,  $003A,  $003E   ; 5818   0060 0028 003A 003E
        DECLE   $003E,  $003C,  $0038,  $0000   ; 581C   003E 003C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5820   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 5824   0000 0000 0040 0040
        DECLE   $0040,  $0060,  $0028,  $003A   ; 5828   0040 0060 0028 003A
        DECLE   $003E,  $003C,  $0038,  $0000   ; 582C   003E 003C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5830   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5834   0000 0000 0000 0080
        DECLE   $0080,  $0080,  $00C0,  $0050   ; 5838   0080 0080 00C0 0050
        DECLE   $0076,  $007E,  $0078,  $0000   ; 583C   0076 007E 0078 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5840   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5844   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; 5848   0000 0000 0080 0080
        DECLE   $00C0,  $0042,  $0076,  $0000   ; 584C   00C0 0042 0076 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5850   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5854   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5858   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5860   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5864   0000 0000 0000 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5868   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $003C   ; 586C   0000 0000 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5870   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $003C   ; 5874   0000 003C 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5878   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $007E,  $003C   ; 587C   0018 003C 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5880   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $007E,  $003C   ; 5884   0018 003C 007E 003C
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5888   0000 0000 0018 0018
        DECLE   $0018,  $003C,  $007E,  $003C   ; 588C   0018 003C 007E 003C
        DECLE   $0000,  $0018,  $0018,  $0018   ; 5890   0000 0018 0018 0018
        DECLE   $0018,  $003C,  $007E,  $003C   ; 5894   0018 003C 007E 003C
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5898   0018 0018 0018 0018
        DECLE   $0018,  $003C,  $007E,  $003C   ; 589C   0018 003C 007E 003C
        DECLE   $0030,  $0038,  $0030,  $0020   ; 58A0   0030 0038 0030 0020
        DECLE   $0006,  $0000,  $0006,  $0000   ; 58A4   0006 0000 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C6   ; 58AC   0000 0000 0000 00C6
        DECLE   $0030,  $0038,  $0030,  $0020   ; 58B0   0030 0038 0030 0020
        DECLE   $0000,  $0006,  $0000,  $0006   ; 58B4   0000 0006 0000 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B8   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $000C   ; 58BC   0000 0080 0080 000C
        DECLE   $0030,  $0038,  $0030,  $0020   ; 58C0   0030 0038 0030 0020
        DECLE   $0000,  $0006,  $0003,  $0000   ; 58C4   0000 0006 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C8   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0030   ; 58CC   0000 0080 0080 0030
        DECLE   $0030,  $0038,  $0030,  $0020   ; 58D0   0030 0038 0030 0020
        DECLE   $0000,  $0006,  $0000,  $0003   ; 58D4   0000 0006 0000 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D8   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0060   ; 58DC   0010 0000 0000 0060
        DECLE   $00EE,  $0028,  $0028,  $004C   ; 58E0   00EE 0028 0028 004C
        DECLE   $0042,  $0082,  $0082,  $008C   ; 58E4   0042 0082 0082 008C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EC   0000 0000 0000 0000
        DECLE   $0008,  $0008,  $0018,  $0010   ; 58F0   0008 0008 0018 0010
        DECLE   $0078,  $0048,  $004C,  $0054   ; 58F4   0078 0048 004C 0054
        DECLE   $0008,  $0008,  $0018,  $0010   ; 58F8   0008 0008 0018 0010
        DECLE   $0078,  $0046,  $00AB,  $0088   ; 58FC   0078 0046 00AB 0088
        DECLE   $0000,  $0018,  $003C,  $0000   ; 5900   0000 0018 003C 0000
        DECLE   $0020,  $0070,  $00F0,  $00B0   ; 5904   0020 0070 00F0 00B0
        DECLE   $0038,  $0030,  $0030,  $0010   ; 5908   0038 0030 0030 0010
        DECLE   $0030,  $0010,  $0010,  $0000   ; 590C   0030 0010 0010 0000
        DECLE   $0018,  $003C,  $0000,  $0020   ; 5910   0018 003C 0000 0020
        DECLE   $0070,  $00F0,  $00B0,  $0030   ; 5914   0070 00F0 00B0 0030
        DECLE   $0030,  $0030,  $0018,  $0018   ; 5918   0030 0030 0018 0018
        DECLE   $0030,  $0020,  $0020,  $0000   ; 591C   0030 0020 0020 0000
        DECLE   $000C,  $001E,  $0000,  $0030   ; 5920   000C 001E 0000 0030
        DECLE   $0078,  $0078,  $0038,  $0038   ; 5924   0078 0078 0038 0038
        DECLE   $0038,  $0038,  $0018,  $0018   ; 5928   0038 0038 0018 0018
        DECLE   $0038,  $0020,  $0020,  $0000   ; 592C   0038 0020 0020 0000
        DECLE   $000C,  $001E,  $0000,  $0010   ; 5930   000C 001E 0000 0010
        DECLE   $0038,  $0038,  $0078,  $0078   ; 5934   0038 0038 0078 0078
        DECLE   $0038,  $0038,  $0038,  $0018   ; 5938   0038 0038 0038 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 593C   0018 0018 0018 0000
        DECLE   $0000,  $0018,  $003C,  $0018   ; 5940   0000 0018 003C 0018
        DECLE   $0038,  $0070,  $00F0,  $00B0   ; 5944   0038 0070 00F0 00B0
        DECLE   $00BC,  $0030,  $0030,  $0010   ; 5948   00BC 0030 0030 0010
        DECLE   $0070,  $0050,  $0010,  $0018   ; 594C   0070 0050 0010 0018
        DECLE   $0018,  $003C,  $0018,  $0038   ; 5950   0018 003C 0018 0038
        DECLE   $0070,  $00F0,  $00B0,  $00B8   ; 5954   0070 00F0 00B0 00B8
        DECLE   $0030,  $0030,  $0018,  $0018   ; 5958   0030 0030 0018 0018
        DECLE   $0030,  $0020,  $0020,  $0030   ; 595C   0030 0020 0020 0030
        DECLE   $000C,  $001E,  $000C,  $003C   ; 5960   000C 001E 000C 003C
        DECLE   $0078,  $0078,  $007C,  $0038   ; 5964   0078 0078 007C 0038
        DECLE   $0038,  $0038,  $0018,  $0018   ; 5968   0038 0038 0018 0018
        DECLE   $0038,  $002C,  $0020,  $0030   ; 596C   0038 002C 0020 0030
        DECLE   $000C,  $001E,  $000C,  $001C   ; 5970   000C 001E 000C 001C
        DECLE   $0038,  $0038,  $0078,  $007C   ; 5974   0038 0038 0078 007C
        DECLE   $0078,  $0038,  $0038,  $0018   ; 5978   0078 0038 0038 0018
        DECLE   $0018,  $0018,  $0038,  $002C   ; 597C   0018 0018 0038 002C
        DECLE   $0000,  $0018,  $0018,  $0038   ; 5980   0000 0018 0018 0038
        DECLE   $0000,  $000C,  $003E,  $007F   ; 5984   0000 000C 003E 007F
        DECLE   $001D,  $0019,  $0000,  $0018   ; 5988   001D 0019 0000 0018
        DECLE   $0018,  $0018,  $0010,  $0000   ; 598C   0018 0018 0010 0000
        DECLE   $0018,  $0018,  $0038,  $0000   ; 5990   0018 0018 0038 0000
        DECLE   $0008,  $001E,  $001F,  $003D   ; 5994   0008 001E 001F 003D
        DECLE   $007D,  $0000,  $0038,  $0038   ; 5998   007D 0000 0038 0038
        DECLE   $0018,  $0018,  $0000,  $0000   ; 599C   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0038,  $0000   ; 59A0   0018 0018 0038 0000
        DECLE   $0008,  $001E,  $001F,  $003D   ; 59A4   0008 001E 001F 003D
        DECLE   $007C,  $0000,  $0038,  $0028   ; 59A8   007C 0000 0038 0028
        DECLE   $0028,  $0028,  $0000,  $0000   ; 59AC   0028 0028 0000 0000
        DECLE   $0018,  $0018,  $0038,  $0000   ; 59B0   0018 0018 0038 0000
        DECLE   $0008,  $001E,  $001F,  $001D   ; 59B4   0008 001E 001F 001D
        DECLE   $003D,  $0060,  $0018,  $0038   ; 59B8   003D 0060 0018 0038
        DECLE   $0028,  $0028,  $0020,  $0000   ; 59BC   0028 0028 0020 0000
        DECLE   $000C,  $000C,  $0000,  $0000   ; 59C0   000C 000C 0000 0000
        DECLE   $0040,  $0040,  $0042,  $0000   ; 59C4   0040 0040 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 59C8   0000 0000 0000 0080
        DECLE   $0080,  $0000,  $000C,  $0000   ; 59CC   0080 0000 000C 0000
        DECLE   $000C,  $000C,  $0000,  $0000   ; 59D0   000C 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 59D8   0000 0000 0040 0040
        DECLE   $0000,  $0000,  $0018,  $0000   ; 59DC   0000 0000 0018 0000
        DECLE   $0000,  $000C,  $000C,  $0000   ; 59E0   0000 000C 000C 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; 59E4   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 59E8   0000 0000 0000 0006
        DECLE   $0000,  $0000,  $0060,  $0000   ; 59EC   0000 0000 0060 0000
        DECLE   $000C,  $000C,  $0000,  $0000   ; 59F0   000C 000C 0000 0000
        DECLE   $0001,  $0000,  $0080,  $0000   ; 59F4   0001 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 59F8   0000 0000 0000 0080
        DECLE   $0083,  $0000,  $0000,  $0000   ; 59FC   0083 0000 0000 0000
        DECLE   $0018,  $0038,  $0078,  $0078   ; 5A00   0018 0038 0078 0078
        DECLE   $007C,  $0038,  $0038,  $0038   ; 5A04   007C 0038 0038 0038
        DECLE   $0038,  $0068,  $0008,  $0008   ; 5A08   0038 0068 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0C   0000 0000 0000 0000
        DECLE   $0018,  $0038,  $0038,  $0038   ; 5A10   0018 0038 0038 0038
        DECLE   $0030,  $0038,  $0038,  $0038   ; 5A14   0030 0038 0038 0038
        DECLE   $0030,  $0010,  $0010,  $0010   ; 5A18   0030 0010 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A1C   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0038,  $0078   ; 5A20   0000 0018 0038 0078
        DECLE   $007C,  $0038,  $003C,  $003C   ; 5A24   007C 0038 003C 003C
        DECLE   $0034,  $0020,  $0060,  $0040   ; 5A28   0034 0020 0060 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2C   0000 0000 0000 0000
        DECLE   $0078,  $00FC,  $00BC,  $00BE   ; 5A30   0078 00FC 00BC 00BE
        DECLE   $0038,  $0038,  $003C,  $0036   ; 5A34   0038 0038 003C 0036
        DECLE   $0062,  $0042,  $0000,  $0000   ; 5A38   0062 0042 0000 0000
        DECLE   $0000,  $0010,  $0018,  $003F   ; 5A3C   0000 0010 0018 003F
        DECLE   $00F7,  $00FE,  $00F8,  $00F8   ; 5A40   00F7 00FE 00F8 00F8
        DECLE   $00FE,  $0070,  $0070,  $00E0   ; 5A44   00FE 0070 0070 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5A48   00C0 0000 0000 0000
        DECLE   $0000,  $0010,  $0018,  $007F   ; 5A4C   0000 0010 0018 007F
        DECLE   $00F7,  $00FE,  $00F8,  $00FE   ; 5A50   00F7 00FE 00F8 00FE
        DECLE   $00F0,  $00E0,  $00F8,  $0068   ; 5A54   00F0 00E0 00F8 0068
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5A58   0020 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5A5C   0000 0000

        INCR    R0                              ; 5A5E   0008
        COMR    R0                              ; 5A5F   0018
        ADDR    R3,     R7                      ; 5A60   00DF

        DECLE   $00F7,  $00FE,  $00F8,  $00FE   ; 5A61   00F7 00FE 00F8 00FE
        DECLE   $00E0,  $00D0,  $00B0,  $0098   ; 5A65   00E0 00D0 00B0 0098
        DECLE   $00C0,  $0030,  $0060,  $0060   ; 5A69   00C0 0030 0060 0060
        DECLE   $00E0,  $00E0,  $00E0,  $00A0   ; 5A6D   00E0 00E0 00E0 00A0
        DECLE   $00B0,  $00F8,  $00F0,  $00F0   ; 5A71   00B0 00F8 00F0 00F0
        DECLE   $0058,  $0061,  $003F,  $001E   ; 5A75   0058 0061 003F 001E
        DECLE   $0000,  $0000,  $0004,  $0000   ; 5A79   0000 0000 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0000   ; 5A81   0000 0000 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8D   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5A91   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A95   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5A99   0008 0000 0000 0000
        DECLE   $0080,  $00C0,  $00C0,  $0060   ; 5A9D   0080 00C0 00C0 0060
        DECLE   $0073,  $003F,  $003F,  $001F   ; 5AA1   0073 003F 003F 001F
        DECLE   $001F,  $003B,  $0036,  $0036   ; 5AA5   001F 003B 0036 0036
        DECLE   $001B,  $0000,  $0000,  $0000   ; 5AA9   001B 0000 0000 0000
        DECLE   $0000,  $0080,  $00C0,  $00E1   ; 5AAD   0000 0080 00C0 00E1
        DECLE   $0067,  $003F,  $003F,  $003F   ; 5AB1   0067 003F 003F 003F
        DECLE   $0037,  $006C,  $00DC,  $00B0   ; 5AB5   0037 006C 00DC 00B0
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5AB9   0060 0000 0000 0000
        DECLE   $0000,  $0020,  $0060,  $0060   ; 5ABD   0000 0020 0060 0060
        DECLE   $0073,  $003F,  $003F,  $003F   ; 5AC1   0073 003F 003F 003F
        DECLE   $001F,  $0037,  $006C,  $0036   ; 5AC5   001F 0037 006C 0036
        DECLE   $0000,  $0000,  $0080,  $0080   ; 5AC9   0000 0000 0080 0080
        DECLE   $0098,  $0080,  $0080,  $0080   ; 5ACD   0098 0080 0080 0080
        DECLE   $0080,  $0000,  $001B,  $0000   ; 5AD1   0080 0000 001B 0000
        DECLE   $0000,  $0000,  $0008,  $0030   ; 5AD5   0000 0000 0008 0030
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5AD9   0000 0000 0000 0018
        DECLE   $0000,  $0000,  $0080,  $0080   ; 5ADD   0000 0000 0080 0080
        DECLE   $0080,  $009B,  $0000,  $0000   ; 5AE1   0080 009B 0000 0000
        DECLE   $0004,  $0004,  $0008,  $0018   ; 5AE5   0004 0004 0008 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5AE9   0000 0000 0000 0018
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5AED   0000 0000 0000 0080
        DECLE   $0083,  $0098,  $0080,  $0080   ; 5AF1   0083 0098 0080 0080
        DECLE   $0080,  $0084,  $0064,  $0004   ; 5AF5   0080 0084 0064 0004
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5AF9   0000 0000 0000 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AFD   0000 0000 0000 0000
        DECLE   $0080,  $009B,  $0080,  $0080   ; 5B01   0080 009B 0080 0080
        DECLE   $0080,  $0006,  $0002,  $0060   ; 5B05   0080 0006 0002 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B09   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0000,  $0000   ; 5B0D   0000 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B11   0000 0000 0000 0000
        DECLE   $0000,  $0012,  $0000,  $0000   ; 5B15   0000 0012 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B19   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0000,  $0000   ; 5B1D   0000 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B21   0000 0000 0000 0000
        DECLE   $0000,  $0048,  $0000,  $0000   ; 5B25   0000 0048 0000 0000
        DECLE   $0046,  $00A8,  $00E6,  $00A2   ; 5B29   0046 00A8 00E6 00A2
        DECLE   $00AC,  $0000,  $0000,  $0000   ; 5B2D   00AC 0000 0000 0000
        DECLE   $00FF,  $007F,  $001F,  $0000   ; 5B31   00FF 007F 001F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B3D   0000 0000 0000 0000

        RRC     R2,     1                       ; 5B41   0072
        SWAP    R1,     2                       ; 5B42   0045
        SWAP    R1,     2                       ; 5B43   0045
        SLR     R1,     2                       ; 5B44   0065
        DECR    R5                              ; 5B45   0015
        DECR    R5                              ; 5B46   0015
        DECR    R5                              ; 5B47   0015
        SLR     R2,     1                       ; 5B48   0062
        INCR    R7                              ; 5B49   000F

        COMR    R4                              ; 5B4A   001C
L_5B4B:
        RSWD    R0                              ; 5B4B   0038
        RRC     R0,     1                       ; 5B4C   0070
        RSWD    R0                              ; 5B4D   0038
        COMR    R4                              ; 5B4E   001C
        ADDR    R1,     R0                      ; 5B4F   00C8
        SLLC    R1,     2                       ; 5B50   005D
        SARC    R3,     2                       ; 5B51   007F
        COMR    R0                              ; 5B52   0018
        RSWD    R4                              ; 5B53   003C
        SARC    R0,     1                       ; 5B54   0078
        GSWD    R0                              ; 5B55   0030
        COMR    R0                              ; 5B56   0018
        INCR    R4                              ; 5B57   000C
        INCR    R7                              ; 5B58   000F

        DECLE   $0000                           ; 5B59   0000
L_5B5A:
        INCR    R7                              ; 5B5A   000F

        COMR    R6                              ; 5B5B   001E
L_5B5C:
        RSWD    R4                              ; 5B5C   003C
        DECLE   $001C,  $00CE,  $005D,  $007F   ; 5B5D   001C 00CE 005D 007F
        DECLE   $000D,  $001C,  $003E,  $007C   ; 5B61   000D 001C 003E 007C
        DECLE   $003E,  $000F,  $0000,  $0000   ; 5B65   003E 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B69   0000 0000 0000 0000
        DECLE   $003F,  $001C,  $00CD,  $007F   ; 5B6D   003F 001C 00CD 007F
        DECLE   $001D,  $0018,  $003C,  $007F   ; 5B71   001D 0018 003C 007F
        DECLE   $006A,  $0000,  $0000,  $0000   ; 5B75   006A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5B7D   0000 0000 0000 00FF
        DECLE   $007F,  $003F,  $0025,  $0024   ; 5B81   007F 003F 0025 0024
        DECLE   $00EE,  $00AA,  $0000,  $0000   ; 5B85   00EE 00AA 0000 0000
        DECLE   $0022,  $00A4,  $0094,  $005C   ; 5B89   0022 00A4 0094 005C
        DECLE   $003D,  $007E,  $0054,  $00FE   ; 5B8D   003D 007E 0054 00FE
        DECLE   $007E,  $0046,  $006E,  $007D   ; 5B91   007E 0046 006E 007D
        DECLE   $00BD,  $00A4,  $0022,  $0042   ; 5B95   00BD 00A4 0022 0042
        DECLE   $0022,  $0026,  $0094,  $005C   ; 5B99   0022 0026 0094 005C
        DECLE   $003D,  $007F,  $0054,  $007E   ; 5B9D   003D 007F 0054 007E
        DECLE   $00FE,  $0046,  $006E,  $007D   ; 5BA1   00FE 0046 006E 007D
        DECLE   $00BD,  $00A4,  $0024,  $0002   ; 5BA5   00BD 00A4 0024 0002
        DECLE   $0022,  $0012,  $0094,  $005C   ; 5BA9   0022 0012 0094 005C
        DECLE   $003D,  $007F,  $0054,  $00FE   ; 5BAD   003D 007F 0054 00FE
        DECLE   $007E,  $0046,  $006E,  $007D   ; 5BB1   007E 0046 006E 007D
        DECLE   $00BC,  $0084,  $0024,  $0022   ; 5BB5   00BC 0084 0024 0022
        DECLE   $0028,  $00D5,  $0001,  $0002   ; 5BB9   0028 00D5 0001 0002
        DECLE   $0004,  $0008,  $00FF,  $0110   ; 5BBD   0004 0008 00FF 0110
        DECLE   $00FF,  $0300,  $00FF,  $0100   ; 5BC1   00FF 0300 00FF 0100
        DECLE   $00FF,  $00FF,  $00FE,  $00F0   ; 5BC5   00FF 00FF 00FE 00F0
        DECLE   $00E0,  $00C0,  $0200,  $003F   ; 5BC9   00E0 00C0 0200 003F
        DECLE   $007F,  $01FF,  $003F,  $0004   ; 5BCD   007F 01FF 003F 0004
        DECLE   $0100,  $0355,  $0055,  $0000   ; 5BD1   0100 0355 0055 0000
        DECLE   $01AA,  $00FF,  $0155,  $0000   ; 5BD5   01AA 00FF 0155 0000

        CMP@    R2,     R5                      ; 5BD9   0355
        CMPR    R0,     R2                      ; 5BDA   0142
        MVO     R0,     .STIC.X.0               ; 5BDB   0240 0000
        CLRR    R0                              ; 5BDD   01C0
        CMPR    R0,     R3                      ; 5BDE   0143
        BPL     L_5BE1                          ; 5BDF   0203 0000

L_5BE1:
        SUBR    R0,     R2                      ; 5BE1   0102
        DECLE   $00FC,  $0061,  $004F,  $0000   ; 5BE2   00FC 0061 004F 0000
        DECLE   $0240,  $0042,  $003F,  $0087   ; 5BE6   0240 0042 003F 0087
        DECLE   $00F3,  $0000,  $0203,  $0043   ; 5BEA   00F3 0000 0203 0043
        DECLE   $01FF                           ; 5BEE   01FF

        ADDR    R7,     R3                      ; 5BEF   00FB
        ADDR    R6,     R1                      ; 5BF0   00F1
        XORR    R7,     R3                      ; 5BF1   01FB
        ADDI    #$00E7, R7                      ; 5BF2   02FF 00E7

        DECLE   $03C3,  $02FF,  $01DF           ; 5BF4   03C3 02FF 01DF

        SETC                                    ; 5BF7   0007
        ADD@    R3,     R7                      ; 5BF8   02DF

        DECLE   $00FF,  $0010,  $004A,  $002C   ; 5BF9   00FF 0010 004A 002C
        DECLE   $0028,  $0018,  $0008,  $000C   ; 5BFD   0028 0018 0008 000C
        DECLE   $007F,  $0300,  $0008,  $0092   ; 5C01   007F 0300 0008 0092
        DECLE   $0054,  $003E,  $033F,  $033F   ; 5C05   0054 003E 033F 033F
        DECLE   $033F,  $003F,  $0000,  $003F   ; 5C09   033F 003F 0000 003F
        DECLE   $0000,  $03FF,  $00FF,  $0000   ; 5C0D   0000 03FF 00FF 0000
        DECLE   $00FF,  $0000,  $03FC,  $00FC   ; 5C11   00FF 0000 03FC 00FC
        DECLE   $0000,  $00FC,  $0000,  $03FC   ; 5C15   0000 00FC 0000 03FC
        DECLE   $03FC,  $01FF,  $00E7,  $0081   ; 5C19   03FC 01FF 00E7 0081
        DECLE   $0018,  $015A,  $0000,  $03FF   ; 5C1D   0018 015A 0000 03FF
        DECLE   $007F,  $003F,  $009F,  $001F   ; 5C21   007F 003F 009F 001F
        DECLE   $00FF,  $02AB,  $00AA,  $00AB   ; 5C25   00FF 02AB 00AA 00AB
        DECLE   $00AB,  $00AB,  $00FF,  $0083   ; 5C29   00AB 00AB 00FF 0083
        DECLE   $00BB,  $01AB,  $00BA,  $0083   ; 5C2D   00BB 01AB 00BA 0083
        DECLE   $00FF,  $00F8,  $00FA,  $02FF   ; 5C31   00FF 00F8 00FA 02FF
        DECLE   $0000,  $00FF,  $0000,  $001F   ; 5C35   0000 00FF 0000 001F
        DECLE   $005F,  $02FF,  $0000,  $00FF   ; 5C39   005F 02FF 0000 00FF
        DECLE   $0100,  $00A5,  $02FF,  $0000   ; 5C3D   0100 00A5 02FF 0000
        DECLE   $00FF,  $0000,  $03FF,  $00FE   ; 5C41   00FF 0000 03FF 00FE
        DECLE   $00FC,  $00F9,  $00F8,  $0300   ; 5C45   00FC 00F9 00F8 0300
        DECLE   $0010,  $0030,  $0070,  $00F0   ; 5C49   0010 0030 0070 00F0
        DECLE   $03F0,  $00F0,  $00E0,  $00C0   ; 5C4D   03F0 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $0001,  $0003   ; 5C51   0080 0000 0001 0003
        DECLE   $0007,  $000F,  $001F,  $003F   ; 5C55   0007 000F 001F 003F
        DECLE   $007F,  $01FF,  $00F1,  $01E4   ; 5C59   007F 01FF 00F1 01E4
        DECLE   $00F1,  $00FB,  $00F1,  $03FB   ; 5C5D   00F1 00FB 00F1 03FB
        DECLE   $03FB,  $03FB,  $01FB,  $00F1   ; 5C61   03FB 03FB 01FB 00F1
        DECLE   $00E0,  $00FC,  $03FE,  $01FE   ; 5C65   00E0 00FC 03FE 01FE
        DECLE   $00FC,  $0000,  $0022,  $0000   ; 5C69   00FC 0000 0022 0000
        DECLE   $002A,  $0011,  $0000,  $0055   ; 5C6D   002A 0011 0000 0055
        DECLE   $0100,  $0022,  $0000,  $0054   ; 5C71   0100 0022 0000 0054
        DECLE   $0088,  $0000,  $00AA,  $0000   ; 5C75   0088 0000 00AA 0000
        DECLE   $003F,  $037F,  $017F,  $003F   ; 5C79   003F 037F 017F 003F
        DECLE   $03FF,  $03FF,  $0300,  $0300   ; 5C7D   03FF 03FF 0300 0300
        DECLE   $0001,  $0002,  $0004           ; 5C81   0001 0002 0004

        INCR    R0                              ; 5C84   0008
        DECR    R0                              ; 5C85   0010
        NEGR    R0                              ; 5C86   0020
        SWAP    R0,     1                       ; 5C87   0040
        TSTR    R0                              ; 5C88   0080
        RSWD    R4                              ; 5C89   003C
        SWAP    R2,     1                       ; 5C8A   0042
        MOVR    R3,     R1                      ; 5C8B   0099
        ANDR    R4,     R1                      ; 5C8C   01A1
        MOVR    R3,     R1                      ; 5C8D   0099
        SWAP    R2,     1                       ; 5C8E   0042
        RSWD    R4                              ; 5C8F   003C
L_5C90:
        PSHR    R5                              ; 5C90   0275

L_5C91:
        JSR     R5,     L_6A4A                  ; 5C91   0004 0168 024A

        MVO     R0,     G_034D                  ; 5C94   0240 034D
        MVO     R0,     G_0182                  ; 5C96   0240 0182
        DIS                                     ; 5C98   0003
        MVI     G_0117, R0                      ; 5C99   0280 0117
        ANDI    #$00FE, R0                      ; 5C9B   03B8 00FE
        MVO     R0,     G_0117                  ; 5C9D   0240 0117
        EIS                                     ; 5C9F   0002
        MVI     G_018B, R0                      ; 5CA0   0280 018B
        DECR    R0                              ; 5CA2   0010
        BEQ     L_5D1B                          ; 5CA3   0204 0076

        DECR    R0                              ; 5CA5   0010
        BEQ     L_5CF9                          ; 5CA6   0204 0051

        MVI     G_032D, R0                      ; 5CA8   0280 032D
        ANDI    #$007F, R0                      ; 5CAA   03B8 007F
        CMPI    #$002D, R0                      ; 5CAC   0378 002D
        BGT     L_5DF4                          ; 5CAE   020E 0144

        JSR     R5,     L_6AC0                  ; 5CB0   0004 0168 02C0

        TSTR    R0                              ; 5CB3   0080
        BEQ     L_5D2B                          ; 5CB4   0204 0075

        MVI     G_01A4, R1                      ; 5CB6   0281 01A4
        TSTR    R1                              ; 5CB8   0089
        BEQ     L_5CC7                          ; 5CB9   0204 000C

        MVI     G_01AB, R0                      ; 5CBB   0280 01AB
        CMPI    #$0005, R0                      ; 5CBD   0378 0005
        BEQ     L_5DF4                          ; 5CBF   0204 0133

        MVI     G_019F, R0                      ; 5CC1   0280 019F
        CMPI    #$0005, R0                      ; 5CC3   0378 0005
        BNEQ    L_5DF4                          ; 5CC5   020C 012D

L_5CC7:
        JSR     R5,     L_6B6C                  ; 5CC7   0004 0168 036C
        JSR     R5,     L_6AB1                  ; 5CCA   0004 0168 02B1

        CLRR    R1                              ; 5CCD   01C9
        MVO     R1,     G_013E                  ; 5CCE   0241 013E
        MVO     R1,     G_0144                  ; 5CD0   0241 0144
        MVO     R1,     G_013A                  ; 5CD2   0241 013A

        JSR     R5,     L_6A6F                  ; 5CD4   0004 0168 026F

        MVO     R1,     G_0194                  ; 5CD7   0241 0194
        MVO     R1,     G_0190                  ; 5CD9   0241 0190
L_5CDB:
        MVII    #$0002, R1                      ; 5CDB   02B9 0002
        MVO     R1,     G_018B                  ; 5CDD   0241 018B
        MVII    #$0008, R1                      ; 5CDF   02B9 0008
        MVO     R1,     G_0192                  ; 5CE1   0241 0192
        MVO     R1,     G_01A0                  ; 5CE3   0241 01A0
        MVO     R1,     G_0195                  ; 5CE5   0241 0195
        MVII    #$0018, R3                      ; 5CE7   02BB 0018
        MVII    #$0325, R4                      ; 5CE9   02BC 0325

        JSR     R5,     L_6BEB                  ; 5CEB   0004 0168 03EB

        MVII    #$0048, R0                      ; 5CEE   02B8 0048
        MVO     R0,     G_034D                  ; 5CF0   0240 034D

        JSR     R5,     L_6587                  ; 5CF2   0004 0164 0187
        JSR     R5,     L_6EC3                  ; 5CF5   0004 016C 02C3

        PULR    R7                              ; 5CF8   02B7

L_5CF9:
        MVII    #$0002, R2                      ; 5CF9   02BA 0002
        MVII    #$0325, R3                      ; 5CFB   02BB 0325
        CLRR    R4                              ; 5CFD   01E4

        JSR     R5,     L_6B8B                  ; 5CFE   0004 0168 038B
        JSR     R5,     L_6A6F                  ; 5D01   0004 0168 026F

        MVI     G_0325, R0                      ; 5D04   0280 0325
        SDBD                                    ; 5D06   0001
        ANDI    #$FF00, R0                      ; 5D07   03B8 0000 00FF
        ADDR    R2,     R0                      ; 5D0A   00D0
        MVO     R0,     G_0325                  ; 5D0B   0240 0325
        MVII    #$0040, R0                      ; 5D0D   02B8 0040
        MVO     R0,     G_0345                  ; 5D0F   0240 0345
        MVO     R0,     G_0346                  ; 5D11   0240 0346
        MVII    #$0060, R0                      ; 5D13   02B8 0060
        MVO     R0,     G_034E                  ; 5D15   0240 034E
        CLRR    R1                              ; 5D17   01C9
        MVO     R1,     G_034D                  ; 5D18   0241 034D
        PULR    R7                              ; 5D1A   02B7

L_5D1B:
        CLRR    R0                              ; 5D1B   01C0
        MVO     R0,     G_01A0                  ; 5D1C   0240 01A0
        MVO     R0,     G_0192                  ; 5D1E   0240 0192
        MVO     R0,     G_018B                  ; 5D20   0240 018B

        JSR     R5,     L_6B77                  ; 5D22   0004 0168 0377
        JSR     R5,     L_66FD                  ; 5D25   0004 0164 02FD

        J       L_65A2                          ; 5D28   0004 0364 01A2

L_5D2B:
        EIS                                     ; 5D2B   0002
        MVI     G_0181, R1                      ; 5D2C   0281 0181
        ADD     G_0340, R1                      ; 5D2E   02C1 0340
        BNEQ    L_5DF4                          ; 5D30   020C 00C2

        ADD     G_01A4, R1                      ; 5D32   02C1 01A4
        BEQ     L_5DF4                          ; 5D34   0204 00BE

        CLRR    R1                              ; 5D36   01C9
        MVO     R1,     G_019D                  ; 5D37   0241 019D
        MVO     R1,     G_0345                  ; 5D39   0241 0345
        MVO     R1,     G_0346                  ; 5D3B   0241 0346
        MVII    #$00D8, R3                      ; 5D3D   02BB 00D8
        MVI     G_0325, R0                      ; 5D3F   0280 0325
        ANDI    #$00FF, R0                      ; 5D41   03B8 00FF
        SLR     R0,     2                       ; 5D43   0064
        SLR     R0,     1                       ; 5D44   0060
        MOVR    R0,     R4                      ; 5D45   0084
        ADDI    #$024F, R4                      ; 5D46   02FC 024F
        CLRR    R2                              ; 5D48   01D2
        MVO     R2,     G_019E                  ; 5D49   0242 019E
        MVII    #$01F8, R5                      ; 5D4B   02BD 01F8
        MVI@    R4,     R1                      ; 5D4D   02A1
        ANDR    R5,     R1                      ; 5D4E   01A9
        CMPR    R1,     R3                      ; 5D4F   014B
        BEQ     L_5D58                          ; 5D50   0204 0006

        MVI@    R4,     R1                      ; 5D52   02A1
        INCR    R0                              ; 5D53   0008
        ANDR    R5,     R1                      ; 5D54   01A9
        CMPR    R1,     R3                      ; 5D55   014B
        BNEQ    L_5D6E                          ; 5D56   020C 0016

L_5D58:
        DECR    R4                              ; 5D58   0014
        MOVR    R4,     R2                      ; 5D59   00A2
        SUBI    #$003C, R4                      ; 5D5A   033C 003C
        MVI@    R4,     R3                      ; 5D5C   02A3
        ANDR    R5,     R3                      ; 5D5D   01AB
        CLRR    R5                              ; 5D5E   01ED
        DECR    R4                              ; 5D5F   0014
        MVI     G_019D, R1                      ; 5D60   0281 019D
        TSTR    R1                              ; 5D62   0089
        BNEQ    L_5D2B                          ; 5D63   022C 0039

        MVO@    R5,     R4                      ; 5D65   0265
        INCR    R5                              ; 5D66   000D
        MVO     R5,     G_019E                  ; 5D67   0245 019E
        CMPI    #$0008, R3                      ; 5D69   037B 0008
        BEQ     L_5D6E                          ; 5D6B   0204 0001

        CLRR    R2                              ; 5D6D   01D2
L_5D6E:
        SLL     R0,     2                       ; 5D6E   004C
        SLL     R0,     1                       ; 5D6F   0048
        MOVR    R0,     R4                      ; 5D70   0084
        MVI     G_017F, R1                      ; 5D71   0281 017F
        SUB     G_0180, R1                      ; 5D73   0301 0180
        BPL     L_5D78                          ; 5D75   0203 0001

        NEGR    R1                              ; 5D77   0021
L_5D78:
        TSTR    R2                              ; 5D78   0092
        BEQ     L_5D9D                          ; 5D79   0204 0022

        CMPI    #$000C, R1                      ; 5D7B   0379 000C
        BLT     L_5D9D                          ; 5D7D   0205 001E

        DIS                                     ; 5D7F   0003
        MVI     G_019D, R0                      ; 5D80   0280 019D
        TSTR    R0                              ; 5D82   0080
        BNEQ    L_5D2B                          ; 5D83   022C 0059

        MVO@    R0,     R2                      ; 5D85   0250
        ADDI    #$0014, R2                      ; 5D86   02FA 0014
        MVO@    R0,     R2                      ; 5D88   0250
        EIS                                     ; 5D89   0002
        PSHR    R4                              ; 5D8A   0274
        MVII    #$0014, R0                      ; 5D8B   02B8 0014
        MVO     R0,     G_0185                  ; 5D8D   0240 0185
        MVO     R0,     G_0192                  ; 5D8F   0240 0192

        JSR     R5,     L_5EE7                  ; 5D91   0004 015C 02E7

        MVI     G_0327, R0                      ; 5D94   0280 0327
        PULR    R1                              ; 5D96   02B1
        ADDR    R1,     R0                      ; 5D97   00C8
        MVO     R0,     G_0327                  ; 5D98   0240 0327

        JSR     R5,     L_66A5                  ; 5D9A   0004 0164 02A5

L_5D9D:
        MVI     G_019E, R0                      ; 5D9D   0280 019E
        TSTR    R0                              ; 5D9F   0080
        BEQ     L_5DF4                          ; 5DA0   0204 0052
        J       L_6FC6                          ; 5DA2   0004 036C 03C6

        PSHR    R5                              ; 5DA5   0275
        MVI     G_01A0, R0                      ; 5DA6   0280 01A0
        TSTR    R0                              ; 5DA8   0080
        BNEQ    L_5C91                          ; 5DA9   022C 0119

        ADD     G_018E, R0                      ; 5DAB   02C0 018E
        BNEQ    L_5DF4                          ; 5DAD   020C 0045
        J       L_6A4B                          ; 5DAF   0004 0368 024B
        MOVR    R5,     R7                      ; 5DB2   00AF

        PSHR    R5                              ; 5DB3   0275
        MVII    #$032B, R3                      ; 5DB4   02BB 032B
        MVII    #$003C, R4                      ; 5DB6   02BC 003C

        JSR     R5,     L_6B8D                  ; 5DB8   0004 0168 038D

        MVI     G_0332, R2                      ; 5DBB   0282 0332
        XORI    #$0100, R2                      ; 5DBD   03FA 0100
        MVO     R2,     G_0333                  ; 5DBF   0242 0333
        CLRR    R2                              ; 5DC1   01D2

        JSR     R5,     L_6B7B                  ; 5DC2   0004 0168 037B

        PULR    R7                              ; 5DC5   02B7

        PSHR    R5                              ; 5DC6   0275
        MVI     G_032C, R0                      ; 5DC7   0280 032C
        MVI     G_0325, R3                      ; 5DC9   0283 0325

        JSR     R5,     L_6B36                  ; 5DCB   0004 0168 0336

        CMPI    #$00A8, R0                      ; 5DCE   0378 00A8
        BLT     L_5DF4                          ; 5DD0   0205 0022

        CMPI    #$00A8, R3                      ; 5DD2   037B 00A8
        BGE     L_5DE4                          ; 5DD4   020D 000E

        MVII    #$0007, R3                      ; 5DD6   02BB 0007

        JSR     R5,     L_6B5C                  ; 5DD8   0004 0168 035C

        MVII    #$0004, R2                      ; 5DDB   02BA 0004

        JSR     R5,     L_6B7B                  ; 5DDD   0004 0168 037B

        CLRR    R2                              ; 5DE0   01D2
        MVO     R2,     G_018E                  ; 5DE1   0242 018E
        PULR    R7                              ; 5DE3   02B7

L_5DE4:
        JSR     R5,     L_67CA                  ; 5DE4   0004 0164 03CA

        MVI     G_0188, R0                      ; 5DE7   0280 0188
        TSTR    R0                              ; 5DE9   0080
        BNEQ    L_5DF4                          ; 5DEA   020C 0008

        MVII    #$0006, R0                      ; 5DEC   02B8 0006
        MVO     R0,     G_019F                  ; 5DEE   0240 019F
        MVII    #$000F, R0                      ; 5DF0   02B8 000F
        MVO     R0,     G_0197                  ; 5DF2   0240 0197
L_5DF4:
        PULR    R7                              ; 5DF4   02B7

        PSHR    R5                              ; 5DF5   0275

        JSR     R5,     L_6B5C                  ; 5DF6   0004 0168 035C

        MVI     G_017F, R3                      ; 5DF9   0283 017F
        MVO     R3,     G_0180                  ; 5DFB   0243 0180
        MVI     G_01A0, R0                      ; 5DFD   0280 01A0
        TSTR    R0                              ; 5DFF   0080
        BNEQ    L_5E05                          ; 5E00   020C 0003

        JSR     R5,     L_66FD                  ; 5E02   0004 0164 02FD

L_5E05:
        MVII    #$0003, R1                      ; 5E05   02B9 0003
        CLRR    R2                              ; 5E07   01D2

        JSR     R5,     L_6B7D                  ; 5E08   0004 0168 037D

        MVI     G_01A4, R0                      ; 5E0B   0280 01A4
        ADD     G_01A0, R0                      ; 5E0D   02C0 01A0
        BNEQ    L_5DF4                          ; 5E0F   022C 001C

        MVII    #$0001, R2                      ; 5E11   02BA 0001

        JSR     R5,     L_6B70                  ; 5E13   0004 0168 0370

        MVII    #$0003, R2                      ; 5E16   02BA 0003

        JSR     R5,     L_6B7B                  ; 5E18   0004 0168 037B

        MVII    #$0002, R2                      ; 5E1B   02BA 0002
        MVO     R2,     G_0190                  ; 5E1D   0242 0190
        MVII    #$0327, R3                      ; 5E1F   02BB 0327
        MVII    #$0064, R4                      ; 5E21   02BC 0064

        JSR     R5,     L_6B8B                  ; 5E23   0004 0168 038B

        J       L_66A6                          ; 5E26   0004 0364 02A6

        PSHR    R5                              ; 5E29   0275

        JSR     R5,     L_6B5C                  ; 5E2A   0004 0168 035C

        J       L_66FE                          ; 5E2D   0004 0364 02FE

        PSHR    R5                              ; 5E30   0275
        MVII    #$0092, R0                      ; 5E31   02B8 0092
        MVO     R0,     G_034D                  ; 5E33   0240 034D
        MVII    #$0001, R0                      ; 5E35   02B8 0001
        MVO     R0,     G_018B                  ; 5E37   0240 018B
        MVII    #$0008, R0                      ; 5E39   02B8 0008
        MVO     R0,     G_0136                  ; 5E3B   0240 0136
        NEGR    R0                              ; 5E3D   0020
        MVO     R0,     G_0126                  ; 5E3E   0240 0126
        J       L_6588                          ; 5E40   0004 0364 0188

        PSHR    R5                              ; 5E43   0275

        JSR     R5,     L_6B57                  ; 5E44   0004 0168 0357
        JSR     R5,     L_6948                  ; 5E47   0004 0168 0148

        MVI     G_01A2, R1                      ; 5E4A   0281 01A2
        MVII    #$01A5, R2                      ; 5E4C   02BA 01A5
        ADDR    R1,     R2                      ; 5E4E   00CA
        MVI@    R2,     R0                      ; 5E4F   0290
        INCR    R0                              ; 5E50   0008
        MVO@    R0,     R2                      ; 5E51   0250
        MVII    #$01A7, R3                      ; 5E52   02BB 01A7
        XORI    #$0001, R1                      ; 5E54   03F9 0001
        ADDR    R1,     R3                      ; 5E56   00CB
        MVI@    R3,     R0                      ; 5E57   0298
        TSTR    R0                              ; 5E58   0080
        BNEQ    L_5E5D                          ; 5E59   020C 0002

        MVO     R1,     G_01A2                  ; 5E5B   0241 01A2
L_5E5D:
        J       L_6638                          ; 5E5D   0004 0364 0238

        PSHR    R5                              ; 5E60   0275
        MVI     G_0193, R0                      ; 5E61   0280 0193
        ADD     G_0185, R0                      ; 5E63   02C0 0185
        ADD     G_0181, R0                      ; 5E65   02C0 0181
        ADD     G_018C, R0                      ; 5E67   02C0 018C
        ADD     G_01A0, R0                      ; 5E69   02C0 01A0
        BNEQ    L_6044                          ; 5E6B   020C 01D7

        ADD     G_0341, R0                      ; 5E6D   02C0 0341
        BEQ     L_6044                          ; 5E6F   0204 01D3

        MVII    #$0004, R2                      ; 5E71   02BA 0004

        JSR     R5,     L_6B27                  ; 5E73   0004 0168 0327

        CMPI    #$003C, R2                      ; 5E76   037A 003C
        BGT     L_6044                          ; 5E78   020E 01CA

        MVII    #$0032, R1                      ; 5E7A   02B9 0032
        MVI     G_0333, R3                      ; 5E7C   0283 0333
        ANDI    #$007F, R3                      ; 5E7E   03BB 007F
        MVII    #$032B, R4                      ; 5E80   02BC 032B
        MVI     G_032B, R0                      ; 5E82   0280 032B
        MVI     G_0333, R2                      ; 5E84   0282 0333
        CLRR    R5                              ; 5E86   01ED
        DIS                                     ; 5E87   0003
        MVO     R5,     G_0142                  ; 5E88   0245 0142
        SDBD                                    ; 5E8A   0001
        ANDI    #$BEFF, R0                      ; 5E8B   03B8 00FF 00BE
        ADDI    #$0100, R0                      ; 5E8E   02F8 0100
        MVO     R0,     G_032B                  ; 5E90   0240 032B
        SDBD                                    ; 5E92   0001
        ANDI    #$BFFF, R2                      ; 5E93   03BA 00FF 00BF
        MVO     R2,     G_0333                  ; 5E96   0242 0333
        EIS                                     ; 5E98   0002
        MVI     G_0325, R2                      ; 5E99   0282 0325
        ANDI    #$00FF, R2                      ; 5E9B   03BA 00FF

        JSR     R5,     L_6BEB                  ; 5E9D   0004 0168 03EB

        MVII    #$003C, R0                      ; 5EA0   02B8 003C
        MVO     R0,     G_0353                  ; 5EA2   0240 0353
        MVI     G_0132, R1                      ; 5EA4   0281 0132
        ANDI    #$0080, R1                      ; 5EA6   03B9 0080
        DECR    R1                              ; 5EA8   0011
        MVI     G_0333, R3                      ; 5EA9   0283 0333

        JSR     R5,     L_6574                  ; 5EAB   0004 0164 0174

        MVO     R3,     G_0333                  ; 5EAE   0243 0333
        CLRR    R2                              ; 5EB0   01D2

        JSR     R5,     L_6B70                  ; 5EB1   0004 0168 0370

        PULR    R7                              ; 5EB4   02B7

        PSHR    R5                              ; 5EB5   0275
        MVI     G_018C, R0                      ; 5EB6   0280 018C
        ADD     G_01A0, R0                      ; 5EB8   02C0 01A0
        ADD     G_01A1, R0                      ; 5EBA   02C0 01A1
        BNEQ    L_6044                          ; 5EBC   020C 0186

        ADD     G_0340, R0                      ; 5EBE   02C0 0340
        BEQ     L_5ED3                          ; 5EC0   0204 0011

        MVII    #$0002, R2                      ; 5EC2   02BA 0002

        JSR     R5,     L_6B27                  ; 5EC4   0004 0168 0327

        CMPI    #$001E, R2                      ; 5EC7   037A 001E
        BGT     L_6044                          ; 5EC9   020E 0179

        MVII    #$0002, R2                      ; 5ECB   02BA 0002

        JSR     R5,     L_66D0                  ; 5ECD   0004 0164 02D0

        J       L_66A6                          ; 5ED0   0004 0364 02A6

L_5ED3:
        MVI     G_01A4, R0                      ; 5ED3   0280 01A4
        CMPI    #$0001, R0                      ; 5ED5   0378 0001
        BLE     L_6044                          ; 5ED7   0206 016B

        MVII    #$0007, R0                      ; 5ED9   02B8 0007

        JSR     R5,     X_RAND1                 ; 5EDB   0004 0114 027D

        TSTR    R0                              ; 5EDE   0080
        BNEQ    L_6044                          ; 5EDF   020C 0163

        JSR     R5,     L_5EE7                  ; 5EE1   0004 015C 02E7

        J       L_66A6                          ; 5EE4   0004 0364 02A6

L_5EE7:
        PSHR    R5                              ; 5EE7   0275
        MVII    #$0002, R2                      ; 5EE8   02BA 0002
        MVII    #$0327, R3                      ; 5EEA   02BB 0327
        MVII    #$0014, R4                      ; 5EEC   02BC 0014

        JSR     R5,     L_6B8B                  ; 5EEE   0004 0168 038B

        MVII    #$0001, R0                      ; 5EF1   02B8 0001

        JSR     R5,     X_RAND1                 ; 5EF3   0004 0114 027D

        TSTR    R0                              ; 5EF6   0080
        BEQ     L_5F0C                          ; 5EF7   0204 0013

        SDBD                                    ; 5EF9   0001
        MVII    #$5634, R0                      ; 5EFA   02B8 0034 0056
        MVO     R0,     G_033F                  ; 5EFD   0240 033F
        SDBD                                    ; 5EFF   0001
        MVII    #$563A, R0                      ; 5F00   02B8 003A 0056
        MVO     R0,     G_0340                  ; 5F03   0240 0340
        MVII    #$0005, R0                      ; 5F05   02B8 0005
        MVII    #$0006, R1                      ; 5F07   02B9 0006

        JSR     R5,     L_6B0F                  ; 5F09   0004 0168 030F

L_5F0C:
        PULR    R7                              ; 5F0C   02B7

        PSHR    R5                              ; 5F0D   0275
        MVI     G_01A0, R0                      ; 5F0E   0280 01A0
        TSTR    R0                              ; 5F10   0080
        BNEQ    L_6044                          ; 5F11   020C 0131

        MVI     G_0342, R0                      ; 5F13   0280 0342
        ADD     G_0193, R0                      ; 5F15   02C0 0193
        BNEQ    L_5F25                          ; 5F17   020C 000C

        MVII    #$0003, R2                      ; 5F19   02BA 0003
        MVII    #$0329, R3                      ; 5F1B   02BB 0329
        MVII    #$0028, R4                      ; 5F1D   02BC 0028

        JSR     R5,     L_6B8B                  ; 5F1F   0004 0168 038B
        JSR     R5,     L_6F32                  ; 5F22   0004 016C 0332

L_5F25:
        MVI     G_018C, R0                      ; 5F25   0280 018C
        ADD     G_0191, R0                      ; 5F27   02C0 0191
        BNEQ    L_5F77                          ; 5F29   020C 004C

        MVII    #$0004, R2                      ; 5F2B   02BA 0004

        JSR     R5,     L_6B27                  ; 5F2D   0004 0168 0327

        CMPI    #$000F, R2                      ; 5F30   037A 000F
        BGT     L_5F43                          ; 5F32   020E 000F

        MVI     G_032D, R1                      ; 5F34   0281 032D
        MVI     G_0331, R4                      ; 5F36   0284 0331

        JSR     R5,     L_6B36                  ; 5F38   0004 0168 0336

        SUBR    R1,     R4                      ; 5F3B   010C
        BPL     L_5F3F                          ; 5F3C   0203 0001

        NEGR    R4                              ; 5F3E   0024
L_5F3F:
        CMPI    #$0002, R4                      ; 5F3F   037C 0002
        BLE     L_5F8B                          ; 5F41   0206 0048

L_5F43:
        MVII    #$000F, R1                      ; 5F43   02B9 000F
        MVI     G_0325, R2                      ; 5F45   0282 0325
        ANDI    #$00FF, R2                      ; 5F47   03BA 00FF
        ADDI    #$0008, R2                      ; 5F49   02FA 0008
        TSTR    R0                              ; 5F4B   0080
        BMI     L_5F50                          ; 5F4C   020B 0002

        SUBI    #$0010, R2                      ; 5F4E   033A 0010
L_5F50:
        MVI     G_032D, R3                      ; 5F50   0283 032D
        ANDI    #$007F, R3                      ; 5F52   03BB 007F
        MVII    #$0329, R4                      ; 5F54   02BC 0329

        JSR     R5,     L_6BEB                  ; 5F56   0004 0168 03EB

L_5F59:
        MVI     G_012E, R0                      ; 5F59   0280 012E

        JSR     R5,     X_EXT_SIGN_LO           ; 5F5B   0004 0114 0268

        MOVR    R0,     R1                      ; 5F5E   0081
L_5F5F:
        NEGR    R1                              ; 5F5F   0021
        MVII    #$0331, R5                      ; 5F60   02BD 0331
        MVI@    R5,     R2                      ; 5F62   02AA
        MVI@    R5,     R3                      ; 5F63   02AB
        MVI@    R5,     R4                      ; 5F64   02AC

        JSR     R5,     L_6574                  ; 5F65   0004 0164 0174

        MVO     R2,     G_0331                  ; 5F68   0242 0331
        MVO     R3,     G_0332                  ; 5F6A   0243 0332
        MVI     G_032B, R0                      ; 5F6C   0280 032B
        SDBD                                    ; 5F6E   0001
        ANDI    #$4000, R0                      ; 5F6F   03B8 0000 0040
        BEQ     L_6044                          ; 5F72   0204 00D0

        MVO     R4,     G_0333                  ; 5F74   0244 0333
        PULR    R7                              ; 5F76   02B7

L_5F77:
        MVI     G_0329, R3                      ; 5F77   0283 0329
        ANDI    #$00FF, R3                      ; 5F79   03BB 00FF
        CMPI    #$00C8, R3                      ; 5F7B   037B 00C8
        BGT     L_5F8B                          ; 5F7D   020E 000C

        MVII    #$0004, R2                      ; 5F7F   02BA 0004

        JSR     R5,     L_66D0                  ; 5F81   0004 0164 02D0

        MVII    #$0004, R2                      ; 5F84   02BA 0004

        JSR     R5,     L_678C                  ; 5F86   0004 0164 038C

        B       L_5F59                          ; 5F89   0220 0031

L_5F8B:
        CLRR    R3                              ; 5F8B   01DB
        MVO     R3,     G_012E                  ; 5F8C   0243 012E
        MVO     R3,     G_013E                  ; 5F8E   0243 013E
        MVI     G_0325, R0                      ; 5F90   0280 0325
        MVI     G_0329, R3                      ; 5F92   0283 0329

        JSR     R5,     L_6B36                  ; 5F94   0004 0168 0336

        SUBR    R3,     R0                      ; 5F97   0118
        MOVR    R0,     R1                      ; 5F98   0081
        B       L_5F5F                          ; 5F99   0220 003B

        PSHR    R5                              ; 5F9B   0275
        MVI     G_01A0, R2                      ; 5F9C   0282 01A0
        TSTR    R2                              ; 5F9E   0092
        BNEQ    L_6044                          ; 5F9F   020C 00A3

        ADD     G_0190, R2                      ; 5FA1   02C2 0190
        BEQ     L_6044                          ; 5FA3   0204 009F

        MVI     G_0327, R2                      ; 5FA5   0282 0327
        ANDI    #$0100, R2                      ; 5FA7   03BA 0100
        BEQ     L_5FCF                          ; 5FA9   0204 0024

        MVII    #$0019, R1                      ; 5FAB   02B9 0019
        MVI     G_0325, R2                      ; 5FAD   0282 0325
        ANDI    #$00FF, R2                      ; 5FAF   03BA 00FF
        MVI     G_032D, R3                      ; 5FB1   0283 032D
        ANDI    #$007F, R3                      ; 5FB3   03BB 007F
        ADDI    #$0008, R3                      ; 5FB5   02FB 0008
        MVII    #$0327, R4                      ; 5FB7   02BC 0327

        JSR     R5,     L_6BEB                  ; 5FB9   0004 0168 03EB
        JSR     R5,     L_66A5                  ; 5FBC   0004 0164 02A5

        MVII    #$0008, R1                      ; 5FBF   02B9 0008
        MVI     G_032F, R0                      ; 5FC1   0280 032F
        SDBD                                    ; 5FC3   0001
        ANDI    #$0400, R0                      ; 5FC4   03B8 0000 0004
        BNEQ    L_5FCA                          ; 5FC7   020C 0001

        NEGR    R1                              ; 5FC9   0021
L_5FCA:
        MVO     R1,     G_012C                  ; 5FCA   0241 012C
        J       L_6FD4                          ; 5FCC   0004 036C 03D4

L_5FCF:
        MVI     G_0327, R0                      ; 5FCF   0280 0327
        ANDI    #$00FF, R0                      ; 5FD1   03B8 00FF
        CMPI    #$00C8, R0                      ; 5FD3   0378 00C8
        BLT     L_6044                          ; 5FD5   0205 006D

        MVII    #$0002, R2                      ; 5FD7   02BA 0002
        MOVR    R2,     R3                      ; 5FD9   0093

        JSR     R5,     L_6B5A                  ; 5FDA   0004 0168 035A

        CLRR    R2                              ; 5FDD   01D2
        MVO     R2,     G_0190                  ; 5FDE   0242 0190
        PULR    R7                              ; 5FE0   02B7

        PSHR    R5                              ; 5FE1   0275
        MVI     G_0194, R0                      ; 5FE2   0280 0194
        TSTR    R0                              ; 5FE4   0080
        BEQ     L_6044                          ; 5FE5   0204 005D

        MVII    #$0032, R1                      ; 5FE7   02B9 0032
        MVII    #$000A, R3                      ; 5FE9   02BB 000A
        MVII    #$01A5, R2                      ; 5FEB   02BA 01A5
        ADD     G_01A2, R2                      ; 5FED   02C2 01A2
        SUB@    R2,     R3                      ; 5FEF   0313
        CMPI    #$0001, R3                      ; 5FF0   037B 0001
        BGE     L_5FF6                          ; 5FF2   020D 0002

        MVII    #$0001, R3                      ; 5FF4   02BB 0001
L_5FF6:
        MVO     R3,     G_016B                  ; 5FF6   0243 016B
        MVI     G_0181, R2                      ; 5FF8   0282 0181
        MVI     G_0344, R3                      ; 5FFA   0283 0344
        TSTR    R3                              ; 5FFC   009B
        BEQ     L_601B                          ; 5FFD   0204 001C

        MVI     G_032C, R3                      ; 5FFF   0283 032C
        ANDI    #$00FF, R3                      ; 6001   03BB 00FF
        CMPI    #$00D2, R3                      ; 6003   037B 00D2
        BGT     L_603F                          ; 6005   020E 0038

        TSTR    R2                              ; 6007   0092
        BNEQ    L_602F                          ; 6008   020C 0025

        MVI     G_0134, R0                      ; 600A   0280 0134

        JSR     R5,     X_EXT_SIGN_LO           ; 600C   0004 0114 0268

        TSTR    R0                              ; 600F   0080
        BPL     L_6013                          ; 6010   0203 0001

        NEGR    R1                              ; 6012   0021
L_6013:
        MVO     R1,     G_0134                  ; 6013   0241 0134
        CLRR    R1                              ; 6015   01C9
        MVO     R1,     G_0144                  ; 6016   0241 0144
        J       L_6696                          ; 6018   0004 0364 0296

L_601B:
        TSTR    R2                              ; 601B   0092
        BEQ     L_6044                          ; 601C   0204 0026

        MVII    #$0002, R0                      ; 601E   02B8 0002

        JSR     R5,     X_RAND1                 ; 6020   0004 0114 027D

        TSTR    R0                              ; 6023   0080
        BNEQ    L_6044                          ; 6024   020C 001E

        MVII    #$032C, R3                      ; 6026   02BB 032C
        MVII    #$005A, R4                      ; 6028   02BC 005A

        JSR     R5,     L_6B8D                  ; 602A   0004 0168 038D

        MVII    #$0032, R1                      ; 602D   02B9 0032
L_602F:
        MVI     G_0325, R2                      ; 602F   0282 0325
        ANDI    #$00FF, R2                      ; 6031   03BA 00FF
        MVI     G_032D, R3                      ; 6033   0283 032D
        ANDI    #$007F, R3                      ; 6035   03BB 007F
        MVII    #$032C, R4                      ; 6037   02BC 032C

        JSR     R5,     L_6BEB                  ; 6039   0004 0168 03EB

        J       L_6696                          ; 603C   0004 0364 0296

L_603F:
        MVII    #$0007, R3                      ; 603F   02BB 0007

        JSR     R5,     L_6B5C                  ; 6041   0004 0168 035C

L_6044:
        PULR    R7                              ; 6044   02B7

        PSHR    R5                              ; 6045   0275

        JSR     R5,     L_6A08                  ; 6046   0004 0168 0208

        MVII    #$0002, R2                      ; 6049   02BA 0002

        JSR     R5,     L_678C                  ; 604B   0004 0164 038C

        MVII    #$0004, R2                      ; 604E   02BA 0004

        JSR     R5,     L_678C                  ; 6050   0004 0164 038C
        JSR     R5,     L_6AE0                  ; 6053   0004 0168 02E0

        MVII    #$0003, R1                      ; 6056   02B9 0003

        JSR     R5,     L_6778                  ; 6058   0004 0164 0378

        MVII    #$0005, R1                      ; 605B   02B9 0005

        JSR     R5,     L_6778                  ; 605D   0004 0164 0378

        MVI     G_018E, R0                      ; 6060   0280 018E
        TSTR    R0                              ; 6062   0080
        BNEQ    L_6071                          ; 6063   020C 000C

        MVI     G_0182, R1                      ; 6065   0281 0182
        DECR    R1                              ; 6067   0011
        BMI     L_6071                          ; 6068   020B 0007

        MVO     R1,     G_0182                  ; 606A   0241 0182
        BNEQ    L_6071                          ; 606C   020C 0003

        INCR    R0                              ; 606E   0008
        MVO     R0,     G_034D                  ; 606F   0240 034D
L_6071:
        MVII    #$0183, R1                      ; 6071   02B9 0183

        JSR     R5,     L_6B20                  ; 6073   0004 0168 0320
        JSR     R5,     L_6B20                  ; 6076   0004 0168 0320

        TSTR    R0                              ; 6079   0080
        BNEQ    L_6080                          ; 607A   020C 0004

        MVO     R0,     G_0345                  ; 607C   0240 0345
        MVO     R0,     G_0346                  ; 607E   0240 0346

L_6080:
        JSR     R5,     L_6B20                  ; 6080   0004 0168 0320

        TSTR    R0                              ; 6083   0080
        BNEQ    L_608D                          ; 6084   020C 0007

        MVO     R0,     G_0192                  ; 6086   0240 0192
        MVII    #$0123, R2                      ; 6088   02BA 0123
        ADD     G_01A2, R2                      ; 608A   02C2 01A2
        MVO@    R0,     R2                      ; 608C   0250

L_608D:
        JSR     R5,     L_6B20                  ; 608D   0004 0168 0320

        TSTR    R0                              ; 6090   0080
        BNEQ    L_60A0                          ; 6091   020C 000D

        JSR     R5,     L_682E                  ; 6093   0004 0168 002E

        MVI     G_02F2, R2                      ; 6096   0282 02F2
        CMPI    #$0004, R2                      ; 6098   037A 0004
        BNEQ    L_60A0                          ; 609A   020C 0004

        MVII    #$0030, R2                      ; 609C   02BA 0030
        MVO     R2,     G_02F2                  ; 609E   0242 02F2

L_60A0:
        JSR     R5,     L_6B20                  ; 60A0   0004 0168 0320

        TSTR    R0                              ; 60A3   0080
        BNEQ    L_60AF                          ; 60A4   020C 0009

        CLRR    R2                              ; 60A6   01D2

        JSR     R5,     L_6B7B                  ; 60A7   0004 0168 037B

        MVII    #$0002, R2                      ; 60AA   02BA 0002

        JSR     R5,     L_6B7B                  ; 60AC   0004 0168 037B

L_60AF:
        MVII    #$0188, R1                      ; 60AF   02B9 0188

        JSR     R5,     L_6B20                  ; 60B1   0004 0168 0320

        TSTR    R0                              ; 60B4   0080
        BNEQ    L_6044                          ; 60B5   022C 0072
        J       L_6638                          ; 60B7   0004 0364 0238

        PSHR    R5                              ; 60BA   0275
        MVI     G_0189, R2                      ; 60BB   0282 0189
        TSTR    R2                              ; 60BD   0092
        BEQ     L_60C3                          ; 60BE   0204 0003

        DECR    R2                              ; 60C0   0012
        MVO     R2,     G_0189                  ; 60C1   0242 0189
L_60C3:
        MVI     G_018F, R0                      ; 60C3   0280 018F
        ADDR    R2,     R0                      ; 60C5   00D0
        BNEQ    L_60D2                          ; 60C6   020C 000A

        MVII    #$0006, R0                      ; 60C8   02B8 0006

        JSR     R5,     X_RAND1                 ; 60CA   0004 0114 027D

        ADDI    #$006E, R0                      ; 60CD   02F8 006E
        MOVR    R0,     R2                      ; 60CF   0082
        MVO     R2,     G_0189                  ; 60D0   0242 0189
L_60D2:
        CMPI    #$0008, R2                      ; 60D2   037A 0008
        BEQ     L_60F6                          ; 60D4   0204 0020

        CMPI    #$0017, R2                      ; 60D6   037A 0017
        BNEQ    L_60DE                          ; 60D8   020C 0004

        MVII    #$0004, R0                      ; 60DA   02B8 0004
        MVO     R0,     G_018A                  ; 60DC   0240 018A
L_60DE:
        MVI     G_018A, R0                      ; 60DE   0280 018A
        TSTR    R0                              ; 60E0   0080
        BEQ     L_6044                          ; 60E1   0224 009E

L_60E3:
        MVII    #$0100, R4                      ; 60E3   02BC 0100
        SDBD                                    ; 60E5   0001
        MVI@    R4,     R0                      ; 60E6   02A0
        SDBD                                    ; 60E7   0001
        CMPI    #$5447, R0                      ; 60E8   0378 0047 0054
        BEQ     L_60E3                          ; 60EB   0224 0009

        SDBD                                    ; 60ED   0001
        MVII    #$68D5, R0                      ; 60EE   02B8 00D5 0068

        JSR     R5,     L_6B50                  ; 60F1   0004 0168 0350

        EIS                                     ; 60F4   0002
        PULR    R7                              ; 60F5   02B7
L_60F6:
        J       L_6F50                          ; 60F6   0004 036C 0350

        PSHR    R5                              ; 60F9   0275
        MVI     G_035E, R3                      ; 60FA   0283 035E
        DECR    R3                              ; 60FC   0013
        MVO     R3,     G_035E                  ; 60FD   0243 035E
        MVI     G_0344, R3                      ; 60FF   0283 0344
        SDBD                                    ; 6101   0001
        CMPI    #$569C, R3                      ; 6102   037B 009C 0056
        BEQ     L_610D                          ; 6105   0204 0006

        SDBD                                    ; 6107   0001
        CMPI    #$56A2, R3                      ; 6108   037B 00A2 0056
        BNEQ    L_6112                          ; 610B   020C 0005

L_610D:
        MVI     G_0134, R3                      ; 610D   0283 0134
        INCR    R3                              ; 610F   000B
        MVO     R3,     G_0134                  ; 6110   0243 0134
L_6112:
        MVI     G_0196, R3                      ; 6112   0283 0196
        TSTR    R3                              ; 6114   009B
        BNEQ    L_6133                          ; 6115   020C 001C

        ADD     G_01A0, R3                      ; 6117   02C3 01A0
        BNEQ    L_6044                          ; 6119   022C 00D6

        MVII    #$01A7, R3                      ; 611B   02BB 01A7
        ADD     G_01A2, R3                      ; 611D   02C3 01A2
        MVI@    R3,     R3                      ; 611F   029B
        TSTR    R3                              ; 6120   009B
        BNEQ    L_6133                          ; 6121   020C 0010

        ADD     G_0181, R3                      ; 6123   02C3 0181
        BNEQ    L_612C                          ; 6125   020C 0005

        MVI     G_0197, R1                      ; 6127   0281 0197
        RRC     R1,     1                       ; 6129   0071
        BNC     L_6133                          ; 612A   0209 0007

L_612C:
        JSR     R5,     L_69D9                  ; 612C   0004 0168 01D9

        DECR    R2                              ; 612F   0012
        MVO@    R2,     R1                      ; 6130   024A
        BMI     L_5DE4                          ; 6131   022B 034E

L_6133:
        MVI     G_0197, R0                      ; 6133   0280 0197
        INCR    R0                              ; 6135   0008
        MVI     G_019F, R1                      ; 6136   0281 019F
        CMPI    #$0006, R1                      ; 6138   0379 0006
        BEQ     L_6167                          ; 613A   0204 002B

        CMPI    #$003C, R0                      ; 613C   0378 003C
        BLT     L_6164                          ; 613E   0205 0024

        CLRR    R0                              ; 6140   01C0
        INCR    R1                              ; 6141   0009
        CMPI    #$0006, R1                      ; 6142   0379 0006
        BNEQ    L_6151                          ; 6144   020C 000B

        MVO     R1,     G_019F                  ; 6146   0241 019F

        JSR     R5,     L_67CA                  ; 6148   0004 0164 03CA

        MVI     G_0188, R0                      ; 614B   0280 0188
        TSTR    R0                              ; 614D   0080
        BEQ     L_616C                          ; 614E   0204 001C
        PULR    R7                              ; 6150   02B7

L_6151:
        CMPI    #$0005, R1                      ; 6151   0379 0005
        BNEQ    L_615C                          ; 6153   020C 0007

        PSHR    R1                              ; 6155   0271
        MVII    #$0030, R1                      ; 6156   02B9 0030

        JSR     R5,     L_683A                  ; 6158   0004 0168 003A

        PULR    R1                              ; 615B   02B1
L_615C:
        CMPI    #$000D, R1                      ; 615C   0379 000D
        BLT     L_6162                          ; 615E   0205 0002

        MVII    #$0001, R1                      ; 6160   02B9 0001
L_6162:
        MVO     R1,     G_019F                  ; 6162   0241 019F
L_6164:
        MVO     R0,     G_0197                  ; 6164   0240 0197
        PULR    R7                              ; 6166   02B7

L_6167:
        CMPI    #$001E, R0                      ; 6167   0378 001E
        BLT     L_616C                          ; 6169   0205 0001

        CLRR    R0                              ; 616B   01C0
L_616C:
        MVO     R0,     G_0197                  ; 616C   0240 0197
        J       L_6887                          ; 616E   0004 0368 0087

        PSHR    R5                              ; 6171   0275
        MVI     G_0181, R3                      ; 6172   0283 0181
        ADD     G_01A0, R3                      ; 6174   02C3 01A0
        BNEQ    L_6203                          ; 6176   020C 008B

        MVI     G_0333, R1                      ; 6178   0281 0333
        MVI     G_032D, R4                      ; 617A   0284 032D

        JSR     R5,     L_6B36                  ; 617C   0004 0168 0336

        SUBR    R4,     R1                      ; 617F   0121
        BMI     L_6203                          ; 6180   020B 0081

        CMPI    #$000D, R1                      ; 6182   0379 000D
        BGT     L_6203                          ; 6184   020E 007D

        MVO     R3,     G_0132                  ; 6186   0243 0132
        MVO     R3,     G_0142                  ; 6188   0243 0142

        JSR     R5,     L_6A4A                  ; 618A   0004 0168 024A

        MVII    #$003C, R1                      ; 618D   02B9 003C
        MVO     R1,     G_0353                  ; 618F   0241 0353
        MVII    #$0028, R0                      ; 6191   02B8 0028
        MVO     R0,     G_0185                  ; 6193   0240 0185
        MVO     R0,     G_0192                  ; 6195   0240 0192
        MVI     G_032B, R0                      ; 6197   0280 032B
        MVI     G_0325, R1                      ; 6199   0281 0325
        ANDI    #$00FF, R1                      ; 619B   03B9 00FF
        SDBD                                    ; 619D   0001
        ANDI    #$FE00, R0                      ; 619E   03B8 0000 00FE
        ADDR    R1,     R0                      ; 61A1   00C8
        MVO     R0,     G_032B                  ; 61A2   0240 032B
        J       L_6F7B                          ; 61A4   0004 036C 037B

        PSHR    R5                              ; 61A7   0275
        MVI     G_0181, R1                      ; 61A8   0281 0181
        TSTR    R1                              ; 61AA   0089
        BEQ     L_6203                          ; 61AB   0204 0056

        MVI     G_018E, R1                      ; 61AD   0281 018E
        ADD     G_01A0, R1                      ; 61AF   02C1 01A0
        BNEQ    L_6203                          ; 61B1   020C 0050

        MVI     G_032C, R3                      ; 61B3   0283 032C
        ANDI    #$00FF, R3                      ; 61B5   03BB 00FF
        CMPI    #$000F, R3                      ; 61B7   037B 000F
        BLT     L_6203                          ; 61B9   0205 0048

        MVO     R1,     G_034D                  ; 61BB   0241 034D
        MVI     G_0325, R0                      ; 61BD   0280 0325
        SDBD                                    ; 61BF   0001
        ANDI    #$FF00, R0                      ; 61C0   03B8 0000 00FF
        ADDR    R3,     R0                      ; 61C3   00D8
        MVO     R0,     G_0325                  ; 61C4   0240 0325
        MVI     G_032D, R1                      ; 61C6   0281 032D
        ANDI    #$007F, R1                      ; 61C8   03B9 007F
        MVI     G_0334, R3                      ; 61CA   0283 0334
        SDBD                                    ; 61CC   0001
        ANDI    #$FF80, R3                      ; 61CD   03BB 0080 00FF
        ADDR    R1,     R3                      ; 61D0   00CB
        SUBI    #$0004, R3                      ; 61D1   033B 0004
        MVO     R3,     G_0334                  ; 61D3   0243 0334
        MVII    #$0032, R1                      ; 61D5   02B9 0032
        SDBD                                    ; 61D7   0001
        ANDI    #$0400, R3                      ; 61D8   03BB 0000 0004
        BNEQ    L_61DE                          ; 61DB   020C 0001

        NEGR    R1                              ; 61DD   0021
L_61DE:
        MVO     R1,     G_0134                  ; 61DE   0241 0134

        JSR     R5,     L_6A4A                  ; 61E0   0004 0168 024A

        MVO     R1,     G_0126                  ; 61E3   0241 0126
        MVO     R0,     G_0144                  ; 61E5   0240 0144
        MVII    #$0004, R2                      ; 61E7   02BA 0004
        MVO     R2,     G_018E                  ; 61E9   0242 018E

        JSR     R5,     L_6B70                  ; 61EB   0004 0168 0370

        J       L_6F8A                          ; 61EE   0004 036C 038A

        PSHR    R5                              ; 61F1   0275
        MVI     G_0334, R0                      ; 61F2   0280 0334
        ANDI    #$007F, R0                      ; 61F4   03B8 007F
        CMPI    #$0014, R0                      ; 61F6   0378 0014
        BLE     L_6203                          ; 61F8   0206 0009

        MVI     G_0354, R0                      ; 61FA   0280 0354
        TSTR    R0                              ; 61FC   0080
        BNEQ    L_6203                          ; 61FD   020C 0004

        MVII    #$0014, R1                      ; 61FF   02B9 0014
        MVO     R1,     G_0354                  ; 6201   0241 0354
L_6203:
        PULR    R7                              ; 6203   02B7

        PSHR    R5                              ; 6204   0275
        MVI     G_018C, R0                      ; 6205   0280 018C
        TSTR    R0                              ; 6207   0080
        BEQ     L_6203                          ; 6208   0224 0006

        MVI     G_0331, R4                      ; 620A   0284 0331
        MVI     G_032F, R1                      ; 620C   0281 032F

        JSR     R5,     L_6B36                  ; 620E   0004 0168 0336

        ADDI    #$0002, R4                      ; 6211   02FC 0002
        SUBR    R1,     R4                      ; 6213   010C
        BPL     L_6217                          ; 6214   0203 0001

        NEGR    R4                              ; 6216   0024
L_6217:
        CMPI    #$0003, R4                      ; 6217   037C 0003
        BGT     L_6203                          ; 6219   022E 0017

        MVII    #$0002, R2                      ; 621B   02BA 0002

        JSR     R5,     L_6B70                  ; 621D   0004 0168 0370

        MVII    #$004B, R0                      ; 6220   02B8 004B
        MVO     R0,     G_034F                  ; 6222   0240 034F
        J       L_650A                          ; 6224   0004 0364 010A

        PSHR    R5                              ; 6227   0275
        MVI     G_0190, R1                      ; 6228   0281 0190
        TSTR    R1                              ; 622A   0089
        BEQ     L_6203                          ; 622B   0224 0029

        MVI     G_0195, R1                      ; 622D   0281 0195
        ADD     G_0181, R1                      ; 622F   02C1 0181
        BNEQ    L_6203                          ; 6231   022C 002F

        MVI     G_032D, R1                      ; 6233   0281 032D
        MVI     G_032F, R4                      ; 6235   0284 032F

        JSR     R5,     L_6B36                  ; 6237   0004 0168 0336

        SUBR    R1,     R4                      ; 623A   010C
        CMPI    #$0007, R4                      ; 623B   037C 0007
        BLT     L_6203                          ; 623D   0225 003B

        CMPI    #$000A, R4                      ; 623F   037C 000A
        BGT     L_6203                          ; 6241   022E 003F

        MVII    #$0003, R2                      ; 6243   02BA 0003

        JSR     R5,     L_6B70                  ; 6245   0004 0168 0370

        MVII    #$0019, R1                      ; 6248   02B9 0019
        MVO     R1,     G_0195                  ; 624A   0241 0195
        MVI     G_032F, R2                      ; 624C   0282 032F
        SDBD                                    ; 624E   0001
        ANDI    #$0400, R2                      ; 624F   03BA 0000 0004
        BEQ     L_6255                          ; 6252   0204 0001

        NEGR    R1                              ; 6254   0021
L_6255:
        MVO     R1,     G_012A                  ; 6255   0241 012A
        CLRR    R1                              ; 6257   01C9
        MVO     R1,     G_013A                  ; 6258   0241 013A
        MVI     G_0108, R0                      ; 625A   0280 0108

        JSR     R5,     X_EXT_SIGN_LO           ; 625C   0004 0114 0268

        SAR     R0,     1                       ; 625F   0068
        MVO     R0,     G_0108                  ; 6260   0240 0108
        PULR    R7                              ; 6262   02B7

        PSHR    R5                              ; 6263   0275
        CLRR    R0                              ; 6264   01C0
        MVO     R0,     G_0191                  ; 6265   0240 0191
        MVI     G_0195, R0                      ; 6267   0280 0195
        TSTR    R0                              ; 6269   0080
        BEQ     L_6203                          ; 626A   0224 0068

        MVII    #$0002, R2                      ; 626C   02BA 0002
        MOVR    R2,     R3                      ; 626E   0093

        JSR     R5,     L_6B5A                  ; 626F   0004 0168 035A

        PULR    R7                              ; 6272   02B7

        CLRR    R0                              ; 6273   01C0
        MVO     R0,     G_0191                  ; 6274   0240 0191
        MOVR    R5,     R7                      ; 6276   00AF

        PSHR    R5                              ; 6277   0275
        MVI     G_0345, R0                      ; 6278   0280 0345
        ANDI    #$000F, R0                      ; 627A   03B8 000F
        CMPI    #$0004, R0                      ; 627C   0378 0004
        BNEQ    L_628D                          ; 627E   020C 000D

        CLRR    R2                              ; 6280   01D2

        JSR     R5,     L_6B70                  ; 6281   0004 0168 0370

        MVII    #$0002, R2                      ; 6284   02BA 0002

        JSR     R5,     L_6B70                  ; 6286   0004 0168 0370

        MVII    #$0028, R2                      ; 6289   02BA 0028
        MVO     R2,     G_0187                  ; 628B   0242 0187
L_628D:
        PULR    R7                              ; 628D   02B7

L_628E:
        PSHR    R5                              ; 628E   0275

        JSR     R5,     L_6868                  ; 628F   0004 0168 0068

        MVII    #$02CE, R4                      ; 6292   02BC 02CE
        SDBD                                    ; 6294   0001
        MVII    #$1002, R3                      ; 6295   02BB 0002 0010

        JSR     R5,     X_PRINT_R5              ; 6298   0004 0118 007B
        STRING  " DRACULA"                      ; 629B  
        DECLE   $0000                           ; 62A3   0000

        SDBD                                    ; 62A4   0001
        MVII    #$1972, R2                      ; 62A5   02BA 0072 0019
        MVII    #$02E0, R4                      ; 62A8   02BC 02E0
        MVO@    R2,     R4                      ; 62AA   0262

        JSR     R5,     X_PRINT_R5              ; 62AB   0004 0118 007B
        STRING  " 1982 IMAGIC"                  ; 62AE  
        DECLE   $0000                           ; 62BA   0000

        JSR     R5,     L_68B2                  ; 62BB   0004 0168 00B2

        MVII    #$0003, R2                      ; 62BE   02BA 0003
        MVO     R2,     G_0116                  ; 62C0   0242 0116
        MVO     R2,     G_010E                  ; 62C2   0242 010E
        MVII    #$001C, R0                      ; 62C4   02B8 001C
        MVO     R0,     G_0197                  ; 62C6   0240 0197
        MVO     R0,     G_02F6                  ; 62C8   0240 02F6
        MVII    #$0006, R2                      ; 62CA   02BA 0006
        MVO     R2,     G_019F                  ; 62CC   0242 019F
        MVO     R2,     G_0192                  ; 62CE   0242 0192
        J       L_6EE5                          ; 62D0   0004 036C 02E5

        PSHR    R5                              ; 62D3   0275
        MVI     G_0196, R3                      ; 62D4   0283 0196
        ADD     G_0188, R3                      ; 62D6   02C3 0188
        BNEQ    L_641D                          ; 62D8   020C 0143

        CMP     G_01A2, R1                      ; 62DA   0341 01A2
        BNEQ    L_632B                          ; 62DC   020C 004D

        MVI     G_0192, R3                      ; 62DE   0283 0192
        ADD     G_018E, R3                      ; 62E0   02C3 018E
        BNEQ    L_641D                          ; 62E2   020C 0139

        MVO     R3,     G_0182                  ; 62E4   0243 0182
        TSTR    R0                              ; 62E6   0080
        BMI     L_6326                          ; 62E7   020B 003D

        MVII    #$0050, R1                      ; 62E9   02B9 0050
        MVI     G_0181, R2                      ; 62EB   0282 0181
        TSTR    R2                              ; 62ED   0092
        BNEQ    L_62F8                          ; 62EE   020C 0008

        MVII    #$003C, R1                      ; 62F0   02B9 003C
        MVI     G_0195, R2                      ; 62F2   0282 0195
        TSTR    R2                              ; 62F4   0092
        BEQ     L_62F8                          ; 62F5   0204 0001

        SAR     R1,     1                       ; 62F7   0069
L_62F8:
        NEGR    R1                              ; 62F8   0021

        JSR     R5,     L_6C15                  ; 62F9   0004 016C 0015

        MVO     R0,     G_0108                  ; 62FC   0240 0108
        MVI     G_032D, R0                      ; 62FE   0280 032D
        ANDI    #$007F, R0                      ; 6300   03B8 007F
        TSTR    R1                              ; 6302   0089
        BMI     L_6309                          ; 6303   020B 0004

        CMPI    #$002C, R0                      ; 6305   0378 002C
        BLE     L_6320                          ; 6307   0206 0017

L_6309:
        MVII    #$0068, R2                      ; 6309   02BA 0068
        MVII    #$002B, R3                      ; 630B   02BB 002B
        SAR     R1,     1                       ; 630D   0069
        BPL     L_6319                          ; 630E   0203 0009

        NEGR    R1                              ; 6310   0021
        CMPI    #$0057, R0                      ; 6311   0378 0057
        BGE     L_6320                          ; 6313   020D 000B

        MVII    #$0044, R2                      ; 6315   02BA 0044
        MVII    #$0057, R3                      ; 6317   02BB 0057
L_6319:
        SUB     G_0106, R2                      ; 6319   0302 0106
        MVII    #$0325, R4                      ; 631B   02BC 0325

        JSR     R5,     L_6BEB                  ; 631D   0004 0168 03EB

L_6320:
        MVI     G_0181, R2                      ; 6320   0282 0181
        TSTR    R2                              ; 6322   0092
        BEQ     L_661B                          ; 6323   0204 02F6
        PULR    R7                              ; 6325   02B7

L_6326:
        MVII    #$0003, R0                      ; 6326   02B8 0003
        MVO     R0,     G_0182                  ; 6328   0240 0182
        PULR    R7                              ; 632A   02B7

L_632B:
        MVI     G_018C, R2                      ; 632B   0282 018C
        ADD     G_01A1, R2                      ; 632D   02C2 01A1
        BEQ     L_641D                          ; 632F   0204 00EC

        MVI     G_0190, R2                      ; 6331   0282 0190
        ADD     G_0350, R2                      ; 6333   02C2 0350
        BNEQ    L_641D                          ; 6335   020C 00E6

        TSTR    R0                              ; 6337   0080
        BMI     L_635E                          ; 6338   020B 0024

        MVII    #$0020, R1                      ; 633A   02B9 0020

        JSR     R5,     L_6C15                  ; 633C   0004 016C 0015

        PSHR    R0                              ; 633F   0270
        MVI     G_0327, R2                      ; 6340   0282 0327
        ANDI    #$00FF, R2                      ; 6342   03BA 00FF
        SUBI    #$0008, R2                      ; 6344   033A 0008
        MVI     G_032F, R3                      ; 6346   0283 032F
        ANDI    #$007F, R3                      ; 6348   03BB 007F
        ADDI    #$0008, R3                      ; 634A   02FB 0008
        MVII    #$0327, R4                      ; 634C   02BC 0327

        JSR     R5,     L_6BEB                  ; 634E   0004 0168 03EB

        PULR    R0                              ; 6351   02B0
        ADD     G_012A, R0                      ; 6352   02C0 012A
        MVO     R0,     G_012A                  ; 6354   0240 012A
        MVII    #$0002, R2                      ; 6356   02BA 0002

        JSR     R5,     L_678C                  ; 6358   0004 0164 038C

        J       L_66A6                          ; 635B   0004 0364 02A6

L_635E:
        CLRR    R0                              ; 635E   01C0
        MVO     R0,     G_012A                  ; 635F   0240 012A
        MVO     R0,     G_013A                  ; 6361   0240 013A
        PULR    R7                              ; 6363   02B7

        PSHR    R5                              ; 6364   0275
        CMP     G_01A2, R1                      ; 6365   0341 01A2
        BNEQ    L_641D                          ; 6367   020C 00B4

        MVI     G_0192, R3                      ; 6369   0283 0192
        ADD     G_0183, R3                      ; 636B   02C3 0183
        ADD     G_0184, R3                      ; 636D   02C3 0184
        ADD     G_0196, R3                      ; 636F   02C3 0196
        ADD     G_0188, R3                      ; 6371   02C3 0188
        BNEQ    L_641D                          ; 6373   020C 00A8

        CMPR    R3,     R0                      ; 6375   0158
        BLE     L_641D                          ; 6376   0206 00A5

        MVII    #$0008, R2                      ; 6378   02BA 0008
        MVO     R2,     G_0183                  ; 637A   0242 0183
        ADD     G_0181, R3                      ; 637C   02C3 0181
        BNEQ    L_6386                          ; 637E   020C 0006

        JSR     R5,     L_6587                  ; 6380   0004 0164 0187

        J       L_6F98                          ; 6383   0004 036C 0398

L_6386:
        MVI     G_018E, R0                      ; 6386   0280 018E
        TSTR    R0                              ; 6388   0080
        BEQ     L_6390                          ; 6389   0204 0005

        JSR     R5,     L_6A4A                  ; 638B   0004 0168 024A

        MVO     R0,     G_018E                  ; 638E   0240 018E

L_6390:
        JSR     R5,     L_65A1                  ; 6390   0004 0164 01A1
        JSR     R5,     L_5C90                  ; 6393   0004 015C 0090

        PULR    R7                              ; 6396   02B7

L_6397:
        PSHR    R5                              ; 6397   0275
        CMP     G_01A2, R1                      ; 6398   0341 01A2
        BNEQ    L_641D                          ; 639A   020C 0081

        MVI     G_018C, R3                      ; 639C   0283 018C
        ADD     G_018E, R3                      ; 639E   02C3 018E
        ADD     G_0192, R3                      ; 63A0   02C3 0192
        ADD     G_0181, R3                      ; 63A2   02C3 0181
        ADD     G_0196, R3                      ; 63A4   02C3 0196
        ADD     G_0188, R3                      ; 63A6   02C3 0188
        BNEQ    L_641D                          ; 63A8   020C 0073

        CMPR    R3,     R0                      ; 63AA   0158
        BLE     L_641D                          ; 63AB   0206 0070

        ADD     G_01A4, R3                      ; 63AD   02C3 01A4
        BEQ     L_641D                          ; 63AF   0204 006C

        MVI     G_01A1, R0                      ; 63B1   0280 01A1
        TSTR    R0                              ; 63B3   0080
        BEQ     L_63BF                          ; 63B4   0204 0009

        MVI     G_01A2, R2                      ; 63B6   0282 01A2
        XORI    #$0001, R2                      ; 63B8   03FA 0001
        MVII    #$0005, R0                      ; 63BA   02B8 0005

        JSR     R5,     L_69C4                  ; 63BC   0004 0168 01C4

L_63BF:
        MVII    #$0005, R0                      ; 63BF   02B8 0005
        MVO     R0,     G_0184                  ; 63C1   0240 0184
        MVII    #$0004, R3                      ; 63C3   02BB 0004
        MVO     R3,     G_0345                  ; 63C5   0243 0345
        MVO     R3,     G_0346                  ; 63C7   0243 0346
        MVI     G_0327, R0                      ; 63C9   0280 0327
        MVI     G_0325, R3                      ; 63CB   0283 0325
        MVI     G_032F, R1                      ; 63CD   0281 032F
        MVI     G_032D, R4                      ; 63CF   0284 032D

        JSR     R5,     L_6B36                  ; 63D1   0004 0168 0336

        SUBR    R1,     R4                      ; 63D4   010C
        SUBR    R3,     R0                      ; 63D5   0118
        MOVR    R0,     R1                      ; 63D6   0081
        BPL     L_63DA                          ; 63D7   0203 0001

        NEGR    R0                              ; 63D9   0020
L_63DA:
        CMPI    #$0009, R0                      ; 63DA   0378 0009
        BGT     L_641D                          ; 63DC   020E 003F

        SDBD                                    ; 63DE   0001
        CMPI    #$FFFC, R4                      ; 63DF   037C 00FC 00FF
        BLT     L_641D                          ; 63E2   0205 0039

        CMPI    #$0006, R4                      ; 63E4   037C 0006
        BGT     L_641D                          ; 63E6   020E 0035

        MVI     G_032D, R3                      ; 63E8   0283 032D
        SDBD                                    ; 63EA   0001
        ANDI    #$0400, R3                      ; 63EB   03BB 0000 0004
        NEGR    R3                              ; 63EE   0023
        XORR    R3,     R1                      ; 63EF   01D9
        BMI     L_641D                          ; 63F0   020B 002B

        JSR     R5,     L_6A53                  ; 63F2   0004 0168 0253

        MVI     G_018D, R1                      ; 63F5   0281 018D
        TSTR    R1                              ; 63F7   0089
        BEQ     L_64EE                          ; 63F8   0204 00F4

        MVO     R1,     G_018C                  ; 63FA   0241 018C
        MVII    #$0258, R1                      ; 63FC   02B9 0258
        MVO     R1,     G_034F                  ; 63FE   0241 034F
        CLRR    R2                              ; 6400   01D2
        MVO     R2,     G_012A                  ; 6401   0242 012A
        MVO     R2,     G_013A                  ; 6403   0242 013A

        JSR     R5,     L_6B70                  ; 6405   0004 0168 0370

        SDBD                                    ; 6408   0001
        MVII    #$566E, R1                      ; 6409   02B9 006E 0056
        MVO     R1,     G_033F                  ; 640C   0241 033F
        ADDI    #$0006, R1                      ; 640E   02F9 0006
        MVO     R1,     G_0340                  ; 6410   0241 0340
        MVII    #$0006, R0                      ; 6412   02B8 0006
        MVII    #$0002, R1                      ; 6414   02B9 0002

        JSR     R5,     L_6B0F                  ; 6416   0004 0168 030F

        MVO     R0,     G_0171                  ; 6419   0240 0171
        MVO     R0,     G_0172                  ; 641B   0240 0172
L_641D:
        PULR    R7                              ; 641D   02B7

        PSHR    R5                              ; 641E   0275
        MVI     G_0193, R2                      ; 641F   0282 0193
        ADD     G_01A1, R2                      ; 6421   02C2 01A1
        BNEQ    L_6428                          ; 6423   020C 0003

        INCR    R2                              ; 6425   000A
        MVO     R2,     G_018D                  ; 6426   0242 018D

L_6428:
        JSR     R5,     L_6397                  ; 6428   0004 0160 0397

        CLRR    R2                              ; 642B   01D2
        MVO     R2,     G_018D                  ; 642C   0242 018D
        PULR    R7                              ; 642E   02B7

        PSHR    R5                              ; 642F   0275
        MVI     G_0196, R3                      ; 6430   0283 0196
        TSTR    R3                              ; 6432   009B
        BNEQ    L_646D                          ; 6433   020C 0038

        MVI     G_0192, R2                      ; 6435   0282 0192
        ADD     G_034E, R2                      ; 6437   02C2 034E
        ADD     G_0188, R2                      ; 6439   02C2 0188
        BNEQ    L_641D                          ; 643B   022C 001F

        JSR     R5,     L_6AD3                  ; 643D   0004 0168 02D3

        J       L_66FE                          ; 6440   0004 0364 02FE

        DECLE   $0020,  $0045,  $0041,  $0053   ; 6443   0020 0045 0041 0053
        DECLE   $0059,  $0020,  $0000,  $004D   ; 6447   0059 0020 0000 004D
        DECLE   $0045,  $0044,  $0049,  $0055   ; 644B   0045 0044 0049 0055
        DECLE   $004D,  $0000,  $0020,  $0048   ; 644F   004D 0000 0020 0048
        DECLE   $0041,  $0052,  $0044,  $0020   ; 6453   0041 0052 0044 0020
        DECLE   $0000,  $0031,  $0020,  $0050   ; 6457   0000 0031 0020 0050
        DECLE   $004C,  $0041,  $0059,  $0045   ; 645B   004C 0041 0059 0045
        DECLE   $0052,  $0020,  $0000,  $0032   ; 645F   0052 0020 0000 0032
        DECLE   $0020,  $0050,  $004C,  $0041   ; 6463   0020 0050 004C 0041
        DECLE   $0059,  $0045,  $0052,  $0053   ; 6467   0059 0045 0052 0053
        DECLE   $0000                           ; 646B   0000

        PSHR    R5                              ; 646C   0275
L_646D:
        MVI     G_0198, R2                      ; 646D   0282 0198
        TSTR    R2                              ; 646F   0092
        BNEQ    L_647F                          ; 6470   020C 000D

        PSHR    R0                              ; 6472   0270

        JSR     R5,     L_6A84                  ; 6473   0004 0168 0284

        MVII    #$0001, R2                      ; 6476   02BA 0001
        MVO     R2,     G_0198                  ; 6478   0242 0198
        MVO     R2,     G_0196                  ; 647A   0242 0196
        MVO     R2,     G_0147                  ; 647C   0242 0147
        PULR    R0                              ; 647E   02B0
L_647F:
        CMPI    #$0008, R0                      ; 647F   0378 0008
        BEQ     L_64DB                          ; 6481   0204 0058

        CLRR    R5                              ; 6483   01ED
        SDBD                                    ; 6484   0001
        MVII    #$1004, R3                      ; 6485   02BB 0004 0010
        MVII    #$02E9, R4                      ; 6488   02BC 02E9
        MOVR    R7,     R1                      ; 648A   00B9
        SUBI    #$0048, R1                      ; 648B   0339 0048
        CMPI    #$0004, R0                      ; 648D   0378 0004
        BEQ     L_64CC                          ; 648F   0204 003B

        MVII    #$0003, R5                      ; 6491   02BD 0003
        SUBR    R5,     R3                      ; 6493   012B
        ADDI    #$0007, R1                      ; 6494   02F9 0007
        CMPI    #$0005, R0                      ; 6496   0378 0005
        BEQ     L_64CC                          ; 6498   0204 0032

        DECR    R3                              ; 649A   0013
        MVII    #$0005, R5                      ; 649B   02BD 0005
        ADDI    #$0007, R1                      ; 649D   02F9 0007
        CMPI    #$0006, R0                      ; 649F   0378 0006
        BEQ     L_64CC                          ; 64A1   0204 0029

        ADDI    #$0004, R3                      ; 64A3   02FB 0004
        CLRR    R5                              ; 64A5   01ED
        MVII    #$0001, R2                      ; 64A6   02BA 0001
        MVII    #$02DE, R4                      ; 64A8   02BC 02DE
        ADDI    #$0007, R1                      ; 64AA   02F9 0007
        CMPI    #$0001, R0                      ; 64AC   0378 0001
        BEQ     L_64BF                          ; 64AE   0204 000F

        ADDI    #$000A, R1                      ; 64B0   02F9 000A
        SUBI    #$0002, R3                      ; 64B2   033B 0002
        CLRR    R2                              ; 64B4   01D2
        CMPI    #$0002, R0                      ; 64B5   0378 0002
        BEQ     L_64BF                          ; 64B7   0204 0006

        DECR    R3                              ; 64B9   0013
        CMPI    #$0003, R0                      ; 64BA   0378 0003
        BNEQ    L_641D                          ; 64BC   022C 00A0

        INCR    R5                              ; 64BE   000D
L_64BF:
        MVO     R5,     G_01A1                  ; 64BF   0245 01A1
        MVO     R2,     G_01A8                  ; 64C1   0242 01A8
        MVII    #$0001, R5                      ; 64C3   02BD 0001
        MVO     R5,     G_0199                  ; 64C5   0245 0199
        XORR    R5,     R2                      ; 64C7   01EA
        MVO     R2,     G_01A3                  ; 64C8   0242 01A3
        B       L_64D5                          ; 64CA   0200 0009

L_64CC:
        MVO     R5,     G_01A5                  ; 64CC   0245 01A5
        MVO     R5,     G_01A6                  ; 64CE   0245 01A6
        MVO     R5,     G_01AB                  ; 64D0   0245 01AB
        INCR    R5                              ; 64D2   000D
        MVO     R5,     G_019A                  ; 64D3   0245 019A
L_64D5:
        MVO     R0,     G_01AC                  ; 64D5   0240 01AC

        JSR     R5,     X_PRINT_R1              ; 64D7   0004 0118 0067

        PULR    R7                              ; 64DA   02B7

L_64DB:
        MVI     G_0199, R0                      ; 64DB   0280 0199
        TSTR    R0                              ; 64DD   0080
        BEQ     L_641D                          ; 64DE   0224 00C2

        MVI     G_019A, R0                      ; 64E0   0280 019A
        TSTR    R0                              ; 64E2   0080
        BEQ     L_641D                          ; 64E3   0224 00C7

        CLRR    R2                              ; 64E5   01D2
        MVO     R2,     G_0196                  ; 64E6   0242 0196
        MVO     R2,     G_0198                  ; 64E8   0242 0198
        J       L_6638                          ; 64EA   0004 0364 0238

        PSHR    R5                              ; 64ED   0275
L_64EE:
        MVII    #$0032, R0                      ; 64EE   02B8 0032

        JSR     R5,     L_69C2                  ; 64F0   0004 0168 01C2

        CLRR    R2                              ; 64F3   01D2
        MVO     R2,     G_018C                  ; 64F4   0242 018C
        INCR    R2                              ; 64F6   000A

        JSR     R5,     L_6B70                  ; 64F7   0004 0168 0370

        MVII    #$0003, R3                      ; 64FA   02BB 0003

        JSR     R5,     L_651A                  ; 64FC   0004 0164 011A

        MVI     G_01A4, R0                      ; 64FF   0280 01A4
        DECR    R0                              ; 6501   0010
        MVO     R0,     G_01A4                  ; 6502   0240 01A4
        BNEQ    L_6509                          ; 6504   020C 0003

        INCR    R0                              ; 6506   0008
        MVO     R0,     G_0194                  ; 6507   0240 0194
L_6509:
        PULR    R7                              ; 6509   02B7

L_650A:
        MVII    #$004B, R0                      ; 650A   02B8 004B

        JSR     R5,     L_69C2                  ; 650C   0004 0168 01C2

        MVII    #$0005, R3                      ; 650F   02BB 0005

        JSR     R5,     L_651A                  ; 6511   0004 0164 011A

        MVII    #$0006, R3                      ; 6514   02BB 0006

        JSR     R5,     L_6B5C                  ; 6516   0004 0168 035C

        PULR    R7                              ; 6519   02B7

L_651A:
        PSHR    R5                              ; 651A   0275
        MVII    #$0325, R1                      ; 651B   02B9 0325
        ADDR    R3,     R1                      ; 651D   00D9
        MVI@    R1,     R0                      ; 651E   0288
        SDBD                                    ; 651F   0001
        ANDI    #$BFFF, R0                      ; 6520   03B8 00FF 00BF
        MVO@    R0,     R1                      ; 6523   0248
        ADDI    #$0008, R1                      ; 6524   02F9 0008
        MVI@    R1,     R0                      ; 6526   0288
        SDBD                                    ; 6527   0001
        ANDI    #$BAFF, R0                      ; 6528   03B8 00FF 00BA
        MVO@    R0,     R1                      ; 652B   0248
        ADDI    #$0020, R1                      ; 652C   02F9 0020
        MVII    #$005A, R0                      ; 652E   02B8 005A
        MVO@    R0,     R1                      ; 6530   0248
        SDBD                                    ; 6531   0001
        MVII    #$5658, R0                      ; 6532   02B8 0058 0056
        CMPI    #$0005, R3                      ; 6535   037B 0005
        BNEQ    L_653B                          ; 6537   020C 0002

        ADDI    #$0006, R0                      ; 6539   02F8 0006
L_653B:
        MVII    #$033D, R1                      ; 653B   02B9 033D
        ADDR    R3,     R1                      ; 653D   00D9
        MVO@    R0,     R1                      ; 653E   0248
        MVII    #$016F, R1                      ; 653F   02B9 016F
        ADDR    R3,     R1                      ; 6541   00D9
        MVII    #$0042, R0                      ; 6542   02B8 0042
        MVO@    R0,     R1                      ; 6544   0248
        MVII    #$0345, R1                      ; 6545   02B9 0345
        ADDR    R3,     R1                      ; 6547   00D9
        MVII    #$0010, R0                      ; 6548   02B8 0010
        MVO@    R0,     R1                      ; 654A   0248
        DECR    R3                              ; 654B   0013

        JSR     R5,     L_6B5C                  ; 654C   0004 0168 035C

        J       L_6F6D                          ; 654F   0004 036C 036D

L_6552:
        PSHR    R5                              ; 6552   0275
        SDBD                                    ; 6553   0001
        MVII    #$656F, R0                      ; 6554   02B8 006F 0065

        JSR     R5,     L_6B50                  ; 6557   0004 0168 0350

        CLRR    R0                              ; 655A   01C0
L_655B:
        MVII    #$0200, R4                      ; 655B   02BC 0200
        ADDR    R0,     R4                      ; 655D   00C4
        MVII    #$000C, R1                      ; 655E   02B9 000C

L_6560:
        JSR     R5,     L_6C47                  ; 6560   0004 016C 0047

        MVO@    R3,     R4                      ; 6563   0263
        ADDI    #$0013, R4                      ; 6564   02FC 0013
        DECR    R1                              ; 6566   0011
        BNEQ    L_6560                          ; 6567   022C 0008

        INCR    R0                              ; 6569   0008
        CMPI    #$0014, R0                      ; 656A   0378 0014
        BLT     L_655B                          ; 656C   0225 0012
        PULR    R7                              ; 656E   02B7

        PSHR    R5                              ; 656F   0275

        JSR     R5,     L_6B4C                  ; 6570   0004 0168 034C

        PULR    R7                              ; 6573   02B7

L_6574:
        PSHR    R5                              ; 6574   0275
        TSTR    R1                              ; 6575   0089
        BEQ     L_6586                          ; 6576   0204 000E

        SDBD                                    ; 6578   0001
        MVII    #$FBFF, R5                      ; 6579   02BD 00FF 00FB
        ANDR    R5,     R2                      ; 657C   01AA
        ANDR    R5,     R3                      ; 657D   01AB
        ANDR    R5,     R4                      ; 657E   01AC
        TSTR    R1                              ; 657F   0089
        BPL     L_6586                          ; 6580   0203 0004

        COMR    R5                              ; 6582   001D
        XORR    R5,     R4                      ; 6583   01EC
        XORR    R5,     R3                      ; 6584   01EB
        XORR    R5,     R2                      ; 6585   01EA
L_6586:
        PULR    R7                              ; 6586   02B7

L_6587:
        PSHR    R5                              ; 6587   0275
L_6588:
        MVII    #$0080, R1                      ; 6588   02B9 0080
        SDBD                                    ; 658A   0001
        MVII    #$4480, R2                      ; 658B   02BA 0080 0044
        SDBD                                    ; 658E   0001
        MVII    #$5620, R0                      ; 658F   02B8 0020 0056
        MVO     R0,     G_0181                  ; 6592   0240 0181
        MOVR    R0,     R4                      ; 6594   0084

        JSR     R5,     L_65E0                  ; 6595   0004 0164 01E0

        MVI     G_0335, R0                      ; 6598   0280 0335
        SDBD                                    ; 659A   0001
        ANDI    #$FFF8, R0                      ; 659B   03B8 00F8 00FF
        MVO     R0,     G_0335                  ; 659E   0240 0335
        PULR    R7                              ; 65A0   02B7

L_65A1:
        PSHR    R5                              ; 65A1   0275
L_65A2:
        MVII    #$001F, R0                      ; 65A2   02B8 001F
        MVO     R0,     .PSG0.chan_enable       ; 65A4   0240 01F8
        CLRR    R0                              ; 65A6   01C0
        MVO     R0,     G_0181                  ; 65A7   0240 0181
        MVO     R0,     G_018E                  ; 65A9   0240 018E
        MVII    #$0180, R1                      ; 65AB   02B9 0180
        SDBD                                    ; 65AD   0001
        MVII    #$4180, R2                      ; 65AE   02BA 0080 0041
        SDBD                                    ; 65B1   0001
        MVII    #$5612, R0                      ; 65B2   02B8 0012 0056
        MOVR    R0,     R4                      ; 65B5   0084
        ADDI    #$0008, R4                      ; 65B6   02FC 0008

        JSR     R5,     L_65E0                  ; 65B8   0004 0164 01E0

        MVII    #$0004, R2                      ; 65BB   02BA 0004

        JSR     R5,     L_6B7B                  ; 65BD   0004 0168 037B

        MVI     G_0325, R0                      ; 65C0   0280 0325
        MOVR    R0,     R1                      ; 65C2   0081
        ANDI    #$00FF, R0                      ; 65C3   03B8 00FF
        SDBD                                    ; 65C5   0001
        ANDI    #$FF00, R1                      ; 65C6   03B9 0000 00FF
        ADDI    #$0010, R1                      ; 65C9   02F9 0010
        SUB     G_0106, R1                      ; 65CB   0301 0106
        CMPI    #$0010, R0                      ; 65CD   0378 0010
        BLT     L_65DB                          ; 65CF   0205 000A

        CMPI    #$00C8, R0                      ; 65D1   0378 00C8
        BGT     L_65DB                          ; 65D3   020E 0006

        ADDI    #$0090, R1                      ; 65D5   02F9 0090
        CMPI    #$00A0, R0                      ; 65D7   0378 00A0
        BLT     L_65DD                          ; 65D9   0205 0002

L_65DB:
        MVO     R1,     G_0325                  ; 65DB   0241 0325
L_65DD:
        J       L_69DA                          ; 65DD   0004 0368 01DA

L_65E0:
        PSHR    R5                              ; 65E0   0275
        MVO     R0,     G_033D                  ; 65E1   0240 033D
        MVO     R4,     G_033E                  ; 65E3   0244 033E
        MVI     G_032D, R3                      ; 65E5   0283 032D
        ANDI    #$007F, R3                      ; 65E7   03BB 007F
        ADDR    R1,     R3                      ; 65E9   00CB
        MVO     R3,     G_032D                  ; 65EA   0243 032D
        MVI     G_032E, R3                      ; 65EC   0283 032E
        ANDI    #$007F, R3                      ; 65EE   03BB 007F
        ADDR    R2,     R3                      ; 65F0   00D3
        MVO     R3,     G_032E                  ; 65F1   0243 032E
        MVI     G_0336, R3                      ; 65F3   0283 0336
        SDBD                                    ; 65F5   0001
        ANDI    #$FFF8, R3                      ; 65F6   03BB 00F8 00FF
        MVII    #$0008, R1                      ; 65F9   02B9 0008
        MVII    #$0010, R0                      ; 65FB   02B8 0010
        MVI     G_0181, R2                      ; 65FD   0282 0181
        TSTR    R2                              ; 65FF   0092
        BNEQ    L_660B                          ; 6600   020C 0009

        XORI    #$0007, R3                      ; 6602   03FB 0007
        PSHR    R3                              ; 6604   0273
        CLRR    R0                              ; 6605   01C0

        JSR     R5,     L_661A                  ; 6606   0004 0164 021A

        PULR    R3                              ; 6609   02B3
        CLRR    R1                              ; 660A   01C9
L_660B:
        MVO     R1,     G_0128                  ; 660B   0241 0128
        MVO     R3,     G_0336                  ; 660D   0243 0336
        MVO     R0,     G_0345                  ; 660F   0240 0345
        MVII    #$00FF, R3                      ; 6611   02BB 00FF
        MVO     R0,     G_0346                  ; 6613   0240 0346
        MVO     R3,     G_016F                  ; 6615   0243 016F
        MVO     R3,     G_0170                  ; 6617   0243 0170
        PULR    R7                              ; 6619   02B7

L_661A:
        PSHR    R5                              ; 661A   0275
L_661B:
        PSHR    R0                              ; 661B   0270
        MVI     G_0108, R0                      ; 661C   0280 0108

        JSR     R5,     X_EXT_SIGN_LO           ; 661E   0004 0114 0268

        BNEQ    L_6628                          ; 6621   020C 0005

        MVI     G_0136, R0                      ; 6623   0280 0136

        JSR     R5,     X_EXT_SIGN_LO           ; 6625   0004 0114 0268

L_6628:
        NEGR    R0                              ; 6628   0020
        MOVR    R0,     R1                      ; 6629   0081
        MVI     G_032E, R2                      ; 662A   0282 032E
        MVI     G_032D, R3                      ; 662C   0283 032D

        JSR     R5,     L_6574                  ; 662E   0004 0164 0174

        MVO     R2,     G_032E                  ; 6631   0242 032E
        MVO     R3,     G_032D                  ; 6633   0243 032D
        PULR    R0                              ; 6635   02B0
        PULR    R7                              ; 6636   02B7

        PSHR    R5                              ; 6637   0275

L_6638:
        JSR     R5,     L_6868                  ; 6638   0004 0168 0068

        MVII    #$0002, R2                      ; 663B   02BA 0002
        MVII    #$0325, R3                      ; 663D   02BB 0325
        CLRR    R4                              ; 663F   01E4

        JSR     R5,     L_6B8B                  ; 6640   0004 0168 038B

        SDBD                                    ; 6643   0001
        MVII    #$8044, R0                      ; 6644   02B8 0044 0080
        MVO     R0,     G_0345                  ; 6647   0240 0345
        MVO     R0,     G_0346                  ; 6649   0240 0346
        MVII    #$0060, R0                      ; 664B   02B8 0060
        MVO     R0,     G_034D                  ; 664D   0240 034D

        JSR     R5,     L_674D                  ; 664F   0004 0164 034D
        JSR     R5,     L_6B3F                  ; 6652   0004 0168 033F
        JSR     R5,     L_6ED4                  ; 6655   0004 016C 02D4

        MVII    #$0007, R2                      ; 6658   02BA 0007

        JSR     R5,     L_6B7B                  ; 665A   0004 0168 037B

        SDBD                                    ; 665D   0001
        MVII    #$1005, R3                      ; 665E   02BB 0005 0010
        MVII    #$02DD, R4                      ; 6661   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 6663   0004 0118 007B
        STRING  "PLAYER "                       ; 6666  
        DECLE   $0000                           ; 666D   0000

        MVI     G_01A2, R0                      ; 666E   0280 01A2
        INCR    R0                              ; 6670   0008
        MVII    #$0001, R1                      ; 6671   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6673   0004 0118 00C5

        INCR    R4                              ; 6676   000C

        JSR     R5,     X_PRINT_R5              ; 6677   0004 0118 007B
        STRING  "  NIGHT "                      ; 667A  
        DECLE   $0000                           ; 6682   0000

        MVII    #$01A5, R1                      ; 6683   02B9 01A5
        ADD     G_01A2, R1                      ; 6685   02C1 01A2
        MVI@    R1,     R0                      ; 6687   0288
        SUB     G_01AB, R0                      ; 6688   0300 01AB
        INCR    R0                              ; 668A   0008
        MVII    #$0003, R1                      ; 668B   02B9 0003
        SDBD                                    ; 668D   0001
        XORI    #$8000, R3                      ; 668E   03FB 0000 0080

        JSR     R5,     X_PRNUM_RGT             ; 6691   0004 0118 00C5

        PULR    R7                              ; 6694   02B7

        PSHR    R5                              ; 6695   0275
L_6696:
        MVI     G_0134, R0                      ; 6696   0280 0134

        JSR     R5,     X_EXT_SIGN_LO           ; 6698   0004 0114 0268

        MOVR    R0,     R1                      ; 669B   0081
        NEGR    R1                              ; 669C   0021
        MVI     G_0334, R2                      ; 669D   0282 0334

        JSR     R5,     L_6574                  ; 669F   0004 0164 0174

        MVO     R2,     G_0334                  ; 66A2   0242 0334
        PULR    R7                              ; 66A4   02B7

L_66A5:
        PSHR    R5                              ; 66A5   0275
L_66A6:
        MVI     G_0340, R2                      ; 66A6   0282 0340
        SDBD                                    ; 66A8   0001
        CMPI    #$5658, R2                      ; 66A9   037A 0058 0056
        BEQ     L_66BF                          ; 66AC   0204 0011

        MVI     G_012A, R0                      ; 66AE   0280 012A

        JSR     R5,     X_EXT_SIGN_LO           ; 66B0   0004 0114 0268

        MOVR    R0,     R1                      ; 66B3   0081
        MVI     G_032F, R2                      ; 66B4   0282 032F
        MVI     G_0330, R3                      ; 66B6   0283 0330

        JSR     R5,     L_6574                  ; 66B8   0004 0164 0174

        MVO     R2,     G_032F                  ; 66BB   0242 032F
        MVO     R3,     G_0330                  ; 66BD   0243 0330
L_66BF:
        PULR    R7                              ; 66BF   02B7

        DECLE   $000E,  $000E,  $0013,  $00FB   ; 66C0   000E 000E 0013 00FB
        DECLE   $00F2,  $000E,  $00ED,  $00FB   ; 66C4   00F2 000E 00ED 00FB
        DECLE   $0013,  $0005,  $000E,  $00F2   ; 66C8   0013 0005 000E 00F2
        DECLE   $00ED,  $0005                   ; 66CC   00ED 0005

        ADDR    R6,     R2                      ; 66CE   00F2
        ADDR    R6,     R2                      ; 66CF   00F2
L_66D0:
        PSHR    R5                              ; 66D0   0275
        MVII    #$0325, R1                      ; 66D1   02B9 0325
        MVI@    R1,     R0                      ; 66D3   0288
        ADDR    R2,     R1                      ; 66D4   00D1
        MVI@    R1,     R3                      ; 66D5   028B
        ADDI    #$0008, R1                      ; 66D6   02F9 0008
        MVI@    R1,     R4                      ; 66D8   028C
        MVI     G_032D, R1                      ; 66D9   0281 032D

        JSR     R5,     L_6B36                  ; 66DB   0004 0168 0336

        CLRR    R5                              ; 66DE   01ED
        CMPI    #$0040, R4                      ; 66DF   037C 0040
        BLT     L_66E5                          ; 66E1   0205 0002

        ADDI    #$0008, R5                      ; 66E3   02FD 0008
L_66E5:
        CMPR    R3,     R0                      ; 66E5   0158
        BLT     L_66EA                          ; 66E6   0205 0002

        ADDI    #$0004, R5                      ; 66E8   02FD 0004
L_66EA:
        CMPI    #$0040, R1                      ; 66EA   0379 0040
        BLT     L_66F0                          ; 66EC   0205 0002

        ADDI    #$0002, R5                      ; 66EE   02FD 0002
L_66F0:
        ADDR    R7,     R5                      ; 66F0   00FD
        SUBI    #$0031, R5                      ; 66F1   033D 0031
        MVI@    R5,     R0                      ; 66F3   02A8
        MVI@    R5,     R1                      ; 66F4   02A9
        SLL     R2,     1                       ; 66F5   004A
        ADDI    #$0126, R2                      ; 66F6   02FA 0126
        MVO@    R0,     R2                      ; 66F8   0250
        ADDI    #$0010, R2                      ; 66F9   02FA 0010
        MVO@    R1,     R2                      ; 66FB   0251
        PULR    R7                              ; 66FC   02B7

L_66FD:
        PSHR    R5                              ; 66FD   0275

L_66FE:
        JSR     R5,     L_682E                  ; 66FE   0004 0168 002E

        MVI     G_0108, R2                      ; 6701   0282 0108
        PSHR    R2                              ; 6703   0272
        CLRR    R2                              ; 6704   01D2
        MVO     R2,     G_0108                  ; 6705   0242 0108
L_6707:
        MVII    #$0100, R4                      ; 6707   02BC 0100
        SDBD                                    ; 6709   0001
        MVI@    R4,     R0                      ; 670A   02A0
        SDBD                                    ; 670B   0001
        CMPI    #$5447, R0                      ; 670C   0378 0047 0054
        BEQ     L_6707                          ; 670F   0224 0009

        MVI     G_01A2, R2                      ; 6711   0282 01A2
        ADDR    R2,     R2                      ; 6713   00D2
        MVII    #$02DD, R4                      ; 6714   02BC 02DD

        JSR     R5,     L_699B                  ; 6716   0004 0168 019B

        MVI     G_01A4, R0                      ; 6719   0280 01A4
        MVII    #$0002, R1                      ; 671B   02B9 0002
        SDBD                                    ; 671D   0001
        MVII    #$1005, R3                      ; 671E   02BB 0005 0010
        MVII    #$02E6, R4                      ; 6721   02BC 02E6

        JSR     R5,     X_PRNUM_RGT             ; 6723   0004 0118 00C5

        MVI     G_019F, R0                      ; 6726   0280 019F
        SUBI    #$0004, R3                      ; 6728   033B 0004
        MVII    #$02E9, R4                      ; 672A   02BC 02E9

        JSR     R5,     X_PRNUM_RGT             ; 672C   0004 0118 00C5

        SDBD                                    ; 672F   0001
        MVII    #$10D1, R0                      ; 6730   02B8 00D1 0010
        MVII    #$02EB, R4                      ; 6733   02BC 02EB
        MVO@    R0,     R4                      ; 6735   0260
        MVI     G_0197, R0                      ; 6736   0280 0197

        JSR     R5,     X_PRNUM_ZRO             ; 6738   0004 0118 00AD
        JSR     R5,     L_69D9                  ; 673B   0004 0168 01D9

        MVII    #$02EE, R4                      ; 673E   02BC 02EE
        SDBD                                    ; 6740   0001
        MVII    #$1822, R3                      ; 6741   02BB 0022 0018
        MVO@    R3,     R4                      ; 6744   0263
        PULR    R2                              ; 6745   02B2
        MVO     R2,     G_0108                  ; 6746   0242 0108
        MVII    #$001E, R0                      ; 6748   02B8 001E
        MVO     R0,     G_0186                  ; 674A   0240 0186
        PULR    R7                              ; 674C   02B7

L_674D:
        PSHR    R5                              ; 674D   0275
        MVII    #$01A5, R5                      ; 674E   02BD 01A5
        ADD     G_01A2, R5                      ; 6750   02C5 01A2
        MVI@    R5,     R2                      ; 6752   02AA
        MOVR    R2,     R1                      ; 6753   0091
        ADDI    #$0003, R1                      ; 6754   02F9 0003
        CMPI    #$0032, R1                      ; 6756   0379 0032
        BLT     L_675C                          ; 6758   0205 0002

        MVII    #$0032, R1                      ; 675A   02B9 0032
L_675C:
        MVO     R1,     G_01A4                  ; 675C   0241 01A4
        MVII    #$0001, R0                      ; 675E   02B8 0001
        MOVR    R2,     R1                      ; 6760   0091
        CMPI    #$0003, R1                      ; 6761   0379 0003
        BEQ     L_676A                          ; 6763   0204 0005

        CMPI    #$0001, R1                      ; 6765   0379 0001
        BLE     L_676A                          ; 6767   0206 0001

        CLRR    R0                              ; 6769   01C0
L_676A:
        MVO     R0,     G_0193                  ; 676A   0240 0193
        CLRR    R0                              ; 676C   01C0
        CMPI    #$0005, R2                      ; 676D   037A 0005
        BGE     L_6774                          ; 676F   020D 0003

        RRC     R2,     1                       ; 6771   0072
        BNC     L_6775                          ; 6772   0209 0001

L_6774:
        INCR    R0                              ; 6774   0008
L_6775:
        MVO     R0,     G_0194                  ; 6775   0240 0194
        PULR    R7                              ; 6777   02B7

L_6778:
        PSHR    R5                              ; 6778   0275
        ADDI    #$034D, R1                      ; 6779   02F9 034D
        MVI@    R1,     R2                      ; 677B   028A
        TSTR    R2                              ; 677C   0092
        BEQ     L_678B                          ; 677D   0204 000C

        SUBI    #$0018, R1                      ; 677F   0339 0018
        MVI@    R1,     R2                      ; 6781   028A
        MOVR    R2,     R3                      ; 6782   0093
        INCR    R2                              ; 6783   000A
        MVII    #$0007, R4                      ; 6784   02BC 0007
        ANDR    R4,     R2                      ; 6786   01A2
        COMR    R4                              ; 6787   001C
        ANDR    R4,     R3                      ; 6788   01A3
        ADDR    R2,     R3                      ; 6789   00D3
        MVO@    R3,     R1                      ; 678A   024B
L_678B:
        PULR    R7                              ; 678B   02B7

L_678C:
        PSHR    R5                              ; 678C   0275
        CLRR    R4                              ; 678D   01E4
        MVI     G_01A4, R1                      ; 678E   0281 01A4
        ADDR    R2,     R1                      ; 6790   00D1
        CMPI    #$0002, R1                      ; 6791   0379 0002
        BNEQ    L_6797                          ; 6793   020C 0002

        MVII    #$0008, R4                      ; 6795   02BC 0008
L_6797:
        MVII    #$032D, R1                      ; 6797   02B9 032D
        ADDR    R2,     R1                      ; 6799   00D1
        MVI@    R1,     R0                      ; 679A   0288
        ANDI    #$007F, R0                      ; 679B   03B8 007F
        MVII    #$002C, R3                      ; 679D   02BB 002C
        ADDR    R4,     R3                      ; 679F   00E3
        ADDI    #$002B, R4                      ; 67A0   02FC 002B
        CMPR    R4,     R0                      ; 67A2   0160
        BLE     L_67AC                          ; 67A3   0206 0007

        ADDI    #$002D, R4                      ; 67A5   02FC 002D
        CMPR    R4,     R0                      ; 67A7   0160
        BLT     L_67C9                          ; 67A8   0205 001F

        MOVR    R4,     R3                      ; 67AA   00A3
        DECR    R3                              ; 67AB   0013
L_67AC:
        MVI@    R1,     R0                      ; 67AC   0288
        SDBD                                    ; 67AD   0001
        ANDI    #$FF80, R0                      ; 67AE   03B8 0080 00FF
        ADDR    R3,     R0                      ; 67B1   00D8
        MVO@    R0,     R1                      ; 67B2   0248
        MVII    #$0126, R1                      ; 67B3   02B9 0126
        SLL     R2,     1                       ; 67B5   004A
        ADDR    R2,     R1                      ; 67B6   00D1
        MVI     G_01A1, R4                      ; 67B7   0284 01A1
        TSTR    R4                              ; 67B9   00A4
        BNEQ    L_67C5                          ; 67BA   020C 0009

        MVII    #$0010, R3                      ; 67BC   02BB 0010
        MVI@    R1,     R0                      ; 67BE   0288
        ANDI    #$0080, R0                      ; 67BF   03B8 0080
        BEQ     L_67C4                          ; 67C1   0204 0001

        NEGR    R3                              ; 67C3   0023
L_67C4:
        MVO@    R3,     R1                      ; 67C4   024B
L_67C5:
        ADDI    #$0010, R1                      ; 67C5   02F9 0010
        CLRR    R3                              ; 67C7   01DB
        MVO@    R3,     R1                      ; 67C8   024B
L_67C9:
        PULR    R7                              ; 67C9   02B7

L_67CA:
        PSHR    R5                              ; 67CA   0275

        JSR     R5,     L_6A4A                  ; 67CB   0004 0168 024A
        JSR     R5,     L_6B57                  ; 67CE   0004 0168 0357
        JSR     R5,     L_6AB1                  ; 67D1   0004 0168 02B1
        JSR     R5,     L_682E                  ; 67D4   0004 0168 002E

        SDBD                                    ; 67D7   0001
        MVII    #$1005, R3                      ; 67D8   02BB 0005 0010
        MVO     R3,     G_019C                  ; 67DB   0243 019C
        MVII    #$02C8, R4                      ; 67DD   02BC 02C8

        JSR     R5,     X_PRINT_R5              ; 67DF   0004 0118 007B
        STRING  "      GAME OVER     "          ; 67E2  
        DECLE   $0000                           ; 67F6   0000

        MVI     G_01A2, R2                      ; 67F7   0282 01A2
        MVO     R2,     G_019B                  ; 67F9   0242 019B
        MVII    #$01A7, R1                      ; 67FB   02B9 01A7
        ADDR    R2,     R1                      ; 67FD   00D1
        MVO@    R1,     R1                      ; 67FE   0249

        JSR     R5,     L_6994                  ; 67FF   0004 0168 0194

        MVI     G_01A2, R2                      ; 6802   0282 01A2
        XORI    #$0001, R2                      ; 6804   03FA 0001
        MVO     R2,     G_01A2                  ; 6806   0242 01A2
        MVI     G_01A3, R1                      ; 6808   0281 01A3
        TSTR    R1                              ; 680A   0089
        BEQ     L_6817                          ; 680B   0204 000A

        MVII    #$01A7, R1                      ; 680D   02B9 01A7
        ADDR    R2,     R1                      ; 680F   00D1
        MVI@    R1,     R1                      ; 6810   0289
        TSTR    R1                              ; 6811   0089
        BEQ     L_681C                          ; 6812   0204 0008

        JSR     R5,     L_6994                  ; 6814   0004 0168 0194
L_6817:
        JSR     R5,     L_68B2                  ; 6817   0004 0168 00B2

        B       L_682B                          ; 681A   0200 000F

L_681C:
        MVII    #$00AA, R0                      ; 681C   02B8 00AA
        MVO     R0,     G_0188                  ; 681E   0240 0188

        JSR     R5,     L_6B6C                  ; 6820   0004 0168 036C
        JSR     R5,     L_6AB1                  ; 6823   0004 0168 02B1

        MVII    #$0005, R2                      ; 6826   02BA 0005

        JSR     R5,     L_6B7B                  ; 6828   0004 0168 037B

L_682B:
        J       L_6EE5                          ; 682B   0004 036C 02E5

L_682E:
        MVII    #$02DC, R4                      ; 682E   02BC 02DC
        PSHR    R5                              ; 6830   0275
L_6831:
        MVII    #$0014, R0                      ; 6831   02B8 0014
        MVII    #$0010, R3                      ; 6833   02BB 0010
        SWAP    R3,     1                       ; 6835   0043

        JSR     R5,     .EXEC.853               ; 6836   0004 0118 0053

        PULR    R7                              ; 6839   02B7

L_683A:
        PSHR    R5                              ; 683A   0275
        SWAP    R1,     1                       ; 683B   0041
        MVII    #$0200, R4                      ; 683C   02BC 0200
L_683E:
        MVI@    R4,     R2                      ; 683E   02A2
        MOVR    R2,     R3                      ; 683F   0093
        SDBD                                    ; 6840   0001
        ANDI    #$8000, R2                      ; 6841   03BA 0000 0080
        BEQ     L_684D                          ; 6844   0204 0007

        SDBD                                    ; 6846   0001
        ANDI    #$89FF, R3                      ; 6847   03BB 00FF 0089
        ADDR    R1,     R3                      ; 684A   00CB
        DECR    R4                              ; 684B   0014
        MVO@    R3,     R4                      ; 684C   0263
L_684D:
        CMPI    #$0229, R4                      ; 684D   037C 0229
        BNEQ    L_683E                          ; 684F   022C 0012

        MVI     G_017F, R3                      ; 6851   0283 017F
        TSTR    R3                              ; 6853   009B
        BNEQ    L_6867                          ; 6854   020C 0011

        CMPI    #$000F, R0                      ; 6856   0378 000F
        BNEQ    L_685D                          ; 6858   020C 0003
        J       L_6B40                          ; 685A   0004 0368 0340

L_685D:
        TSTR    R0                              ; 685D   0080
        BNEQ    L_6867                          ; 685E   020C 0007

        MVII    #$032C, R3                      ; 6860   02BB 032C
        MVII    #$0050, R4                      ; 6862   02BC 0050

        JSR     R5,     L_6B8D                  ; 6864   0004 0168 038D

L_6867:
        PULR    R7                              ; 6867   02B7

L_6868:
        PSHR    R5                              ; 6868   0275

        JSR     R5,     L_6B57                  ; 6869   0004 0168 0357
        JSR     R5,     L_6B6C                  ; 686C   0004 0168 036C
        JSR     R5,     L_6AB1                  ; 686F   0004 0168 02B1

        MVII    #$017F, R4                      ; 6872   02BC 017F
        MVII    #$001F, R0                      ; 6874   02B8 001F

        JSR     R5,     X_FILL_ZERO             ; 6876   0004 0114 0338

        MVII    #$000C, R0                      ; 6879   02B8 000C
        MVO     R0,     G_019F                  ; 687B   0240 019F
        MVO     R0,     G_0192                  ; 687D   0240 0192
        MVO     R0,     G_01A0                  ; 687F   0240 01A0

        JSRD    R5,     L_6552                  ; 6881   0004 0166 0152

        EIS                                     ; 6884   0002
        PULR    R7                              ; 6885   02B7

        PSHR    R5                              ; 6886   0275
L_6887:
        MVII    #$0012, R1                      ; 6887   02B9 0012
        MVII    #$0002, R2                      ; 6889   02BA 0002
        CLRR    R3                              ; 688B   01DB
        TSTR    R0                              ; 688C   0080
        BEQ     L_68A4                          ; 688D   0204 0015

        MVII    #$0030, R1                      ; 688F   02B9 0030
        MVII    #$0020, R2                      ; 6891   02BA 0020
        MVII    #$0080, R3                      ; 6893   02BB 0080
        CMPI    #$0019, R0                      ; 6895   0378 0019
        BEQ     L_68A4                          ; 6897   0204 000B

        CLRR    R1                              ; 6899   01C9
        CMPI    #$000F, R0                      ; 689A   0378 000F
        BEQ     L_68A4                          ; 689C   0204 0006

        MVII    #$0014, R1                      ; 689E   02B9 0014
        CMPI    #$0008, R0                      ; 68A0   0378 0008
        BNEQ    L_68B1                          ; 68A2   020C 000D

L_68A4:
        MVO     R2,     G_02F3                  ; 68A4   0242 02F3
        MVO     R3,     G_02F4                  ; 68A6   0243 02F4
        MVII    #$00FF, R3                      ; 68A8   02BB 00FF
        MVO     R3,     G_0179                  ; 68AA   0243 0179
        MVO     R3,     G_017A                  ; 68AC   0243 017A

        JSR     R5,     L_683A                  ; 68AE   0004 0168 003A

L_68B1:
        PULR    R7                              ; 68B1   02B7

L_68B2:
        PSHR    R5                              ; 68B2   0275

        JSR     R5,     L_6B57                  ; 68B3   0004 0168 0357
        JSR     R5,     L_6B6C                  ; 68B6   0004 0168 036C

        MVII    #$0007, R2                      ; 68B9   02BA 0007

        JSR     R5,     L_6B7B                  ; 68BB   0004 0168 037B
        JSR     R5,     L_6AB1                  ; 68BE   0004 0168 02B1

        MVII    #$0005, R2                      ; 68C1   02BA 0005
        MVO     R2,     G_0196                  ; 68C3   0242 0196
        MVO     R2,     G_018F                  ; 68C5   0242 018F
        MVII    #$0327, R3                      ; 68C7   02BB 0327
        MVII    #$0014, R4                      ; 68C9   02BC 0014

        JSR     R5,     L_6B8B                  ; 68CB   0004 0168 038B

        MVI     G_032F, R0                      ; 68CE   0280 032F
        ADDI    #$0018, R0                      ; 68D0   02F8 0018
        MVO     R0,     G_032F                  ; 68D2   0240 032F
        PULR    R7                              ; 68D4   02B7

        PSHR    R5                              ; 68D5   0275
        MVO     R0,     .STIC.VIDEN             ; 68D6   0240 0020

        JSRD    R5,     L_68E0                  ; 68D8   0004 016A 00E0
        JSR     R5,     L_6B4C                  ; 68DB   0004 0168 034C

        EIS                                     ; 68DE   0002
        PULR    R7                              ; 68DF   02B7

L_68E0:
        PSHR    R5                              ; 68E0   0275
        MVI     G_018A, R3                      ; 68E1   0283 018A
        TSTR    R3                              ; 68E3   009B
        BEQ     L_6947                          ; 68E4   0204 0061

        DECR    R3                              ; 68E6   0013
        MVO     R3,     G_018A                  ; 68E7   0243 018A
        SDBD                                    ; 68E9   0001
        MVII    #$58E8, R4                      ; 68EA   02BC 00E8 0058
        MVII    #$0005, R1                      ; 68ED   02B9 0005
        RRC     R3,     1                       ; 68EF   0073
        BNC     L_68FA                          ; 68F0   0209 0008

        DECR    R1                              ; 68F2   0011
        ADDI    #$0008, R4                      ; 68F3   02FC 0008
        RRC     R3,     1                       ; 68F5   0073
        BC      L_68FA                          ; 68F6   0201 0002

        ADDI    #$0008, R4                      ; 68F8   02FC 0008
L_68FA:
        PSHR    R1                              ; 68FA   0271
        MVII    #$0038, R1                      ; 68FB   02B9 0038
        SWAP    R1,     1                       ; 68FD   0041
        MVII    #$0008, R0                      ; 68FE   02B8 0008

        JSR     R5,     .EXEC.730               ; 6900   0004 0114 0330

        PULR    R1                              ; 6903   02B1
        MVII    #$0007, R0                      ; 6904   02B8 0007
        MVII    #$0001, R3                      ; 6906   02BB 0001
        MVII    #$0228, R4                      ; 6908   02BC 0228
L_690A:
        MVI@    R4,     R2                      ; 690A   02A2
        MOVR    R2,     R5                      ; 690B   0095
        ANDR    R0,     R5                      ; 690C   0185
        CMPR    R1,     R5                      ; 690D   014D
        BNEQ    L_6913                          ; 690E   020C 0003

        XORR    R3,     R2                      ; 6910   01DA
        DECR    R4                              ; 6911   0014
        MVO@    R2,     R4                      ; 6912   0262
L_6913:
        CMPI    #$0278, R4                      ; 6913   037C 0278
        BLT     L_690A                          ; 6915   0225 000C

        MVII    #$0010, R0                      ; 6917   02B8 0010
        SWAP    R0,     1                       ; 6919   0040
        SDBD                                    ; 691A   0001
        MVII    #$C9FF, R3                      ; 691B   02BB 00FF 00C9
        CMPI    #$0005, R1                      ; 691E   0379 0005
        BEQ     L_6925                          ; 6920   0204 0003

        MVII    #$0026, R0                      ; 6922   02B8 0026
        SWAP    R0,     1                       ; 6924   0040
L_6925:
        MVI@    R4,     R2                      ; 6925   02A2
        DECR    R4                              ; 6926   0014
        ANDR    R3,     R2                      ; 6927   019A
        XORR    R0,     R2                      ; 6928   01C2
        MVO@    R2,     R4                      ; 6929   0262
        MVI@    R4,     R2                      ; 692A   02A2
        DECR    R4                              ; 692B   0014
        ANDR    R3,     R2                      ; 692C   019A
        XORR    R0,     R2                      ; 692D   01C2
        MVO@    R2,     R4                      ; 692E   0262
        MVI@    R4,     R2                      ; 692F   02A2
        DECR    R4                              ; 6930   0014
        ANDR    R3,     R2                      ; 6931   019A
        XORR    R0,     R2                      ; 6932   01C2
        MVO@    R2,     R4                      ; 6933   0262
        MVI@    R4,     R2                      ; 6934   02A2
        DECR    R4                              ; 6935   0014
        ANDR    R3,     R2                      ; 6936   019A
        XORR    R0,     R2                      ; 6937   01C2
        MVO@    R2,     R4                      ; 6938   0262
        MVI@    R4,     R2                      ; 6939   02A2
        DECR    R4                              ; 693A   0014
        ANDR    R3,     R2                      ; 693B   019A
        XORR    R0,     R2                      ; 693C   01C2
        MVO@    R2,     R4                      ; 693D   0262
        MVI@    R4,     R2                      ; 693E   02A2
        DECR    R4                              ; 693F   0014
        ANDR    R3,     R2                      ; 6940   019A
        XORR    R0,     R2                      ; 6941   01C2
        MVO@    R2,     R4                      ; 6942   0262
        CMPI    #$02F0, R4                      ; 6943   037C 02F0
        BLT     L_6925                          ; 6945   0225 0021
L_6947:
        PULR    R7                              ; 6947   02B7

L_6948:
        PSHR    R5                              ; 6948   0275
        MVI     G_01A4, R0                      ; 6949   0280 01A4
        TSTR    R0                              ; 694B   0080
        BNEQ    L_6993                          ; 694C   020C 0045

        JSR     R5,     L_682E                  ; 694E   0004 0168 002E

        SDBD                                    ; 6951   0001
        MVII    #$1001, R3                      ; 6952   02BB 0001 0010
        MVII    #$02DF, R4                      ; 6955   02BC 02DF

        JSR     R5,     X_PRINT_R5              ; 6957   0004 0118 007B
        STRING  "BONUS "                        ; 695A  
        DECLE   $0000                           ; 6960   0000

        MVI     G_019F, R5                      ; 6961   0285 019F
        CMPI    #$000C, R5                      ; 6963   037D 000C
        BNEQ    L_6968                          ; 6965   020C 0001

        CLRR    R5                              ; 6967   01ED
L_6968:
        MVII    #$01A5, R2                      ; 6968   02BA 01A5
        ADD     G_01A2, R2                      ; 696A   02C2 01A2
        SUB@    R2,     R5                      ; 696C   0315
        DECR    R5                              ; 696D   0015
L_696E:
        MVII    #$0032, R0                      ; 696E   02B8 0032
        PSHR    R5                              ; 6970   0275

        JSR     R5,     L_69C2                  ; 6971   0004 0168 01C2

        MVII    #$02E5, R4                      ; 6974   02BC 02E5
        MVI     G_01A2, R2                      ; 6976   0282 01A2
        ADDR    R2,     R2                      ; 6978   00D2

        JSR     R5,     L_699B                  ; 6979   0004 0168 019B
        JSR     R5,     L_6FA3                  ; 697C   0004 016C 03A3

        SDBD                                    ; 697F   0001
        MVII    #$0CFF, R1                      ; 6980   02B9 00FF 000C
L_6983:
        DECR    R1                              ; 6983   0011
        BNEQ    L_6983                          ; 6984   022C 0002

        PULR    R5                              ; 6986   02B5
        INCR    R5                              ; 6987   000D
        CMPI    #$0006, R5                      ; 6988   037D 0006
        BLT     L_696E                          ; 698A   0225 001D

        SDBD                                    ; 698C   0001
        MVII    #$0FFF, R1                      ; 698D   02B9 00FF 000F
L_6990:
        DECR    R1                              ; 6990   0011
        BNEQ    L_6990                          ; 6991   022C 0002
L_6993:
        PULR    R7                              ; 6993   02B7

L_6994:
        MVII    #$02DE, R4                      ; 6994   02BC 02DE
        ADDR    R2,     R2                      ; 6996   00D2
        BEQ     L_699B                          ; 6997   0204 0002

        ADDI    #$0009, R4                      ; 6999   02FC 0009
L_699B:
        PSHR    R5                              ; 699B   0275
        SDBD                                    ; 699C   0001
        MVII    #$1000, R3                      ; 699D   02BB 0000 0010
        MVI     G_01AB, R1                      ; 69A0   0281 01AB
        SLR     R1,     1                       ; 69A2   0061
        ADDR    R1,     R3                      ; 69A3   00CB
        ADDI    #$02F7, R2                      ; 69A4   02FA 02F7
        MVII    #$0004, R1                      ; 69A6   02B9 0004
        MVI@    R2,     R0                      ; 69A8   0290
        TSTR    R0                              ; 69A9   0080
        BEQ     L_69B7                          ; 69AA   0204 000B

        JSR     R5,     X_PRNUM_RGT             ; 69AC   0004 0118 00C5

        ADDI    #$0004, R4                      ; 69AF   02FC 0004
        DECR    R2                              ; 69B1   0012
        MVI@    R2,     R0                      ; 69B2   0290

        JSR     R5,     X_PRNUM_ZRO             ; 69B3   0004 0118 00AD

        PULR    R7                              ; 69B6   02B7

L_69B7:
        RLC     R3,     1                       ; 69B7   0053
        SETC                                    ; 69B8   0007
        RRC     R3,     1                       ; 69B9   0073
        DECR    R2                              ; 69BA   0012
        MVI@    R2,     R0                      ; 69BB   0290
        ADDI    #$0004, R4                      ; 69BC   02FC 0004

        JSR     R5,     X_PRNUM_RGT             ; 69BE   0004 0118 00C5

        PULR    R7                              ; 69C1   02B7

L_69C2:
        MVI     G_01A2, R2                      ; 69C2   0282 01A2
L_69C4:
        PSHR    R5                              ; 69C4   0275
        MVII    #$02F6, R1                      ; 69C5   02B9 02F6
        ADDR    R2,     R2                      ; 69C7   00D2
        ADDR    R2,     R1                      ; 69C8   00D1
        MVI@    R1,     R2                      ; 69C9   028A
        ADDR    R0,     R2                      ; 69CA   00C2
        SDBD                                    ; 69CB   0001
        MVII    #$2710, R3                      ; 69CC   02BB 0010 0027
        CMPR    R3,     R2                      ; 69CF   015A
        BLT     L_69D7                          ; 69D0   0205 0005

        SUBR    R3,     R2                      ; 69D2   011A
        MVO@    R2,     R1                      ; 69D3   024A
        INCR    R1                              ; 69D4   0009
        MVI@    R1,     R2                      ; 69D5   028A
        INCR    R2                              ; 69D6   000A
L_69D7:
        MVO@    R2,     R1                      ; 69D7   024A
        PULR    R7                              ; 69D8   02B7

L_69D9:
        PSHR    R5                              ; 69D9   0275
L_69DA:
        MVII    #$01A9, R1                      ; 69DA   02B9 01A9
        ADD     G_01A2, R1                      ; 69DC   02C1 01A2
        MVI@    R1,     R2                      ; 69DE   028A
        MOVR    R2,     R3                      ; 69DF   0093
        CLRR    R4                              ; 69E0   01E4
        SLR     R3,     2                       ; 69E1   0067
        SLR     R3,     2                       ; 69E2   0067
        SLR     R3,     1                       ; 69E3   0063
L_69E4:
        INCR    R4                              ; 69E4   000C
        DECR    R3                              ; 69E5   0013
        BPL     L_69E4                          ; 69E6   0223 0003

        MVO     R4,     G_02F5                  ; 69E8   0244 02F5
        MVII    #$00FF, R4                      ; 69EA   02BC 00FF
        MVO     R4,     G_017B                  ; 69EC   0244 017B
        CMPI    #$0014, R2                      ; 69EE   037A 0014
        BGT     L_6A07                          ; 69F0   020E 0015
        BLT     L_69F7                          ; 69F2   0205 0003

        JSR     R5,     L_6F5F                  ; 69F4   0004 016C 035F

L_69F7:
        MVI     G_0181, R0                      ; 69F7   0280 0181
        TSTR    R0                              ; 69F9   0080
        BNEQ    L_6A07                          ; 69FA   020C 000B

        MVI     G_0335, R0                      ; 69FC   0280 0335
        SDBD                                    ; 69FE   0001
        MVII    #$FFF8, R1                      ; 69FF   02B9 00F8 00FF
        ANDR    R1,     R0                      ; 6A02   0188
        COMR    R1                              ; 6A03   0019
        ADDR    R1,     R0                      ; 6A04   00C8
        MVO     R0,     G_0335                  ; 6A05   0240 0335
L_6A07:
        PULR    R7                              ; 6A07   02B7

L_6A08:
        PSHR    R5                              ; 6A08   0275
        MVI     G_0192, R0                      ; 6A09   0280 0192
        TSTR    R0                              ; 6A0B   0080
        BNEQ    L_6A11                          ; 6A0C   020C 0003

        JSR     R5,     L_6A1B                  ; 6A0E   0004 0168 021B

L_6A11:
        MVII    #$0002, R0                      ; 6A11   02B8 0002

        JSR     R5,     L_6A1B                  ; 6A13   0004 0168 021B

        MVII    #$0004, R0                      ; 6A16   02B8 0004
        J       L_6A1C                          ; 6A18   0004 0368 021C

L_6A1B:
        PSHR    R5                              ; 6A1B   0275
L_6A1C:
        CLRR    R2                              ; 6A1C   01D2
        MVII    #$0126, R4                      ; 6A1D   02BC 0126
        ADDR    R0,     R4                      ; 6A1F   00C4
        ADDR    R0,     R4                      ; 6A20   00C4
        MVI@    R4,     R1                      ; 6A21   02A1
        ADDI    #$000F, R4                      ; 6A22   02FC 000F
        ADD@    R4,     R1                      ; 6A24   02E1
        TSTR    R0                              ; 6A25   0080
        BNEQ    L_6A33                          ; 6A26   020C 000B

        ADD     G_0108, R1                      ; 6A28   02C1 0108
        ADD     G_0181, R1                      ; 6A2A   02C1 0181
        MVI     G_0345, R3                      ; 6A2C   0283 0345
        CMPI    #$0004, R3                      ; 6A2E   037B 0004
        BNEQ    L_6A33                          ; 6A30   020C 0001

        CLRR    R1                              ; 6A32   01C9
L_6A33:
        TSTR    R1                              ; 6A33   0089
        BEQ     L_6A38                          ; 6A34   0204 0002

        MVII    #$0010, R2                      ; 6A36   02BA 0010
L_6A38:
        SDBD                                    ; 6A38   0001
        MVII    #$FE0F, R1                      ; 6A39   02B9 000F 00FE
        MVII    #$0345, R4                      ; 6A3C   02BC 0345
        ADDR    R0,     R4                      ; 6A3E   00C4
        MVI@    R4,     R3                      ; 6A3F   02A3
        ANDR    R1,     R3                      ; 6A40   018B
        ADDR    R2,     R3                      ; 6A41   00D3
        DECR    R4                              ; 6A42   0014
        MVO@    R3,     R4                      ; 6A43   0263
        MVI@    R4,     R3                      ; 6A44   02A3
        ANDR    R1,     R3                      ; 6A45   018B
        ADDR    R2,     R3                      ; 6A46   00D3
        DECR    R4                              ; 6A47   0014
        MVO@    R3,     R4                      ; 6A48   0263
        PULR    R7                              ; 6A49   02B7

L_6A4A:
        PSHR    R5                              ; 6A4A   0275
L_6A4B:
        CLRR    R0                              ; 6A4B   01C0
        MVO     R0,     G_0108                  ; 6A4C   0240 0108
        MVO     R0,     G_0126                  ; 6A4E   0240 0126
        MVO     R0,     G_0136                  ; 6A50   0240 0136
        PULR    R7                              ; 6A52   02B7

L_6A53:
        PSHR    R5                              ; 6A53   0275
        MVII    #$01A9, R3                      ; 6A54   02BB 01A9
        ADD     G_01A2, R3                      ; 6A56   02C3 01A2
        MVI@    R3,     R2                      ; 6A58   029A
        ADDI    #$0014, R2                      ; 6A59   02FA 0014
        CMPI    #$00FA, R2                      ; 6A5B   037A 00FA
        BLE     L_6A61                          ; 6A5D   0206 0002

        MVII    #$00FA, R2                      ; 6A5F   02BA 00FA
L_6A61:
        MVO@    R2,     R3                      ; 6A61   025A
        CMPI    #$0014, R2                      ; 6A62   037A 0014
        BLT     L_6A6E                          ; 6A64   0205 0008

        MVI     G_0335, R0                      ; 6A66   0280 0335
        SDBD                                    ; 6A68   0001
        ANDI    #$FFF8, R0                      ; 6A69   03B8 00F8 00FF
        MVO     R0,     G_0335                  ; 6A6C   0240 0335
L_6A6E:
        PULR    R7                              ; 6A6E   02B7

L_6A6F:
        MVII    #$0140, R0                      ; 6A6F   02B8 0140
        PSHR    R5                              ; 6A71   0275
        CLRR    R2                              ; 6A72   01D2
        MVII    #$023C, R4                      ; 6A73   02BC 023C
L_6A75:
        CMPI    #$0250, R4                      ; 6A75   037C 0250
        BGE     L_6A82                          ; 6A77   020D 0009

        ADDI    #$0008, R2                      ; 6A79   02FA 0008
        MVI@    R4,     R3                      ; 6A7B   02A3
        ANDI    #$01F8, R3                      ; 6A7C   03BB 01F8
        CMPR    R0,     R3                      ; 6A7E   0143
        BNEQ    L_6A75                          ; 6A7F   022C 000B
        PULR    R7                              ; 6A81   02B7

L_6A82:
        CLRR    R0                              ; 6A82   01C0
        PULR    R7                              ; 6A83   02B7

L_6A84:
        PSHR    R5                              ; 6A84   0275

        JSR     R5,     L_6B6C                  ; 6A85   0004 0168 036C
        JSR     R5,     L_6AB1                  ; 6A88   0004 0168 02B1
        JSR     R5,     L_6B57                  ; 6A8B   0004 0168 0357

        CLRR    R2                              ; 6A8E   01D2
        MVO     R2,     G_0106                  ; 6A8F   0242 0106
        MVII    #$02F6, R4                      ; 6A91   02BC 02F6
        MVO@    R2,     R4                      ; 6A93   0262
        MVO@    R2,     R4                      ; 6A94   0262
        MVII    #$002E, R0                      ; 6A95   02B8 002E
        MVO@    R2,     R4                      ; 6A97   0262
        MVO@    R2,     R4                      ; 6A98   0262
        MVII    #$017F, R4                      ; 6A99   02BC 017F

        JSR     R5,     X_FILL_ZERO             ; 6A9B   0004 0114 0338

        MVII    #$00FA, R0                      ; 6A9E   02B8 00FA
        MVO     R0,     G_01A9                  ; 6AA0   0240 01A9
        MVO     R0,     G_01AA                  ; 6AA2   0240 01AA
        MVO     R0,     G_018F                  ; 6AA4   0240 018F

        JSR     R5,     L_682E                  ; 6AA6   0004 0168 002E
        JSR     R5,     .EXEC.A83               ; 6AA9   0004 0118 0283

        MVII    #$02C8, R4                      ; 6AAC   02BC 02C8
        J       L_6831                          ; 6AAE   0004 0368 0031

L_6AB1:
        PSHR    R5                              ; 6AB1   0275
        MVII    #$0006, R2                      ; 6AB2   02BA 0006
        MVO     R2,     G_018F                  ; 6AB4   0242 018F

        JSR     R5,     L_6B7B                  ; 6AB6   0004 0168 037B

        MVI     G_018A, R0                      ; 6AB9   0280 018A
        ADDI    #$0002, R0                      ; 6ABB   02F8 0002
        MVO     R0,     G_0189                  ; 6ABD   0240 0189
        PULR    R7                              ; 6ABF   02B7

L_6AC0:
        PSHR    R5                              ; 6AC0   0275

        JSR     R5,     L_6A6F                  ; 6AC1   0004 0168 026F

        TSTR    R0                              ; 6AC4   0080
        BEQ     L_6AD2                          ; 6AC5   0204 000B

        MVI     G_0325, R1                      ; 6AC7   0281 0325
        ANDI    #$00FF, R1                      ; 6AC9   03B9 00FF
        CLRR    R0                              ; 6ACB   01C0
        SUBR    R1,     R2                      ; 6ACC   010A
        CMPI    #$001B, R2                      ; 6ACD   037A 001B
        BC      L_6AD2                          ; 6ACF   0201 0001

        INCR    R0                              ; 6AD1   0008
L_6AD2:
        PULR    R7                              ; 6AD2   02B7

L_6AD3:
        ADD     G_01AC, R0                      ; 6AD3   02C0 01AC
        ADD     G_0194, R0                      ; 6AD5   02C0 0194
        SUB     G_01A4, R0                      ; 6AD7   0300 01A4
        BNEQ    L_6ADF                          ; 6AD9   020C 0004

        MVII    #$0004, R0                      ; 6ADB   02B8 0004
        MVO     R0,     G_02F2                  ; 6ADD   0240 02F2
L_6ADF:
        MOVR    R5,     R7                      ; 6ADF   00AF

L_6AE0:
        PSHR    R5                              ; 6AE0   0275
        MVI     G_01A0, R2                      ; 6AE1   0282 01A0
        TSTR    R2                              ; 6AE3   0092
        BNEQ    L_6B0E                          ; 6AE4   020C 0028

        MVI     G_032D, R2                      ; 6AE6   0282 032D
        MOVR    R2,     R0                      ; 6AE8   0090
        SDBD                                    ; 6AE9   0001
        ANDI    #$FF80, R0                      ; 6AEA   03B8 0080 00FF
        MVI     G_0136, R3                      ; 6AED   0283 0136
        TSTR    R3                              ; 6AEF   009B
        BEQ     L_6B0E                          ; 6AF0   0204 001C

        ANDI    #$0080, R3                      ; 6AF2   03BB 0080
        ANDI    #$007F, R2                      ; 6AF4   03BA 007F
        MVII    #$002B, R4                      ; 6AF6   02BC 002B
        CMPR    R4,     R2                      ; 6AF8   0162
        BLE     L_6B04                          ; 6AF9   0206 0009

        MVII    #$0058, R4                      ; 6AFB   02BC 0058
        CMPR    R4,     R2                      ; 6AFD   0162
        BLT     L_6B0E                          ; 6AFE   0205 000E

        TSTR    R3                              ; 6B00   009B
        BEQ     L_6B07                          ; 6B01   0204 0004
        PULR    R7                              ; 6B03   02B7

L_6B04:
        TSTR    R3                              ; 6B04   009B
        BEQ     L_6B0E                          ; 6B05   0204 0007

L_6B07:
        ADDR    R4,     R0                      ; 6B07   00E0
        MVO     R0,     G_032D                  ; 6B08   0240 032D
        MVII    #$0001, R1                      ; 6B0A   02B9 0001
        MVO     R1,     G_034D                  ; 6B0C   0241 034D
L_6B0E:
        PULR    R7                              ; 6B0E   02B7

L_6B0F:
        MVI     G_0337, R2                      ; 6B0F   0282 0337
        MVI     G_0338, R3                      ; 6B11   0283 0338
        SDBD                                    ; 6B13   0001
        MVII    #$EFF8, R4                      ; 6B14   02BC 00F8 00EF
        ANDR    R4,     R2                      ; 6B17   01A2
        ANDR    R4,     R3                      ; 6B18   01A3
        ADDR    R0,     R2                      ; 6B19   00C2
        ADDR    R1,     R3                      ; 6B1A   00CB
        MVO     R2,     G_0337                  ; 6B1B   0242 0337
        MVO     R3,     G_0338                  ; 6B1D   0243 0338
        MOVR    R5,     R7                      ; 6B1F   00AF

L_6B20:
        MVI@    R1,     R0                      ; 6B20   0288
        DECR    R0                              ; 6B21   0010
        BMI     L_6B25                          ; 6B22   020B 0001

        MVO@    R0,     R1                      ; 6B24   0248
L_6B25:
        INCR    R1                              ; 6B25   0009
        MOVR    R5,     R7                      ; 6B26   00AF

L_6B27:
        PSHR    R5                              ; 6B27   0275
        MVII    #$0325, R1                      ; 6B28   02B9 0325
        MVI@    R1,     R0                      ; 6B2A   0288
        ADDR    R2,     R1                      ; 6B2B   00D1
        MVI@    R1,     R3                      ; 6B2C   028B

        JSR     R5,     L_6B36                  ; 6B2D   0004 0168 0336

        MOVR    R0,     R2                      ; 6B30   0082
        SUBR    R3,     R2                      ; 6B31   011A
        BPL     L_6B35                          ; 6B32   0203 0001

        NEGR    R2                              ; 6B34   0022
L_6B35:
        PULR    R7                              ; 6B35   02B7

L_6B36:
        ANDI    #$00FF, R0                      ; 6B36   03B8 00FF
        ANDI    #$00FF, R3                      ; 6B38   03BB 00FF
        ANDI    #$007F, R1                      ; 6B3A   03B9 007F
        ANDI    #$007F, R4                      ; 6B3C   03BC 007F
        MOVR    R5,     R7                      ; 6B3E   00AF

L_6B3F:
        PSHR    R5                              ; 6B3F   0275
L_6B40:
        MVII    #$032C, R3                      ; 6B40   02BB 032C
        MVII    #$0046, R4                      ; 6B42   02BC 0046

        JSR     R5,     L_6B8D                  ; 6B44   0004 0168 038D

        MVII    #$0100, R0                      ; 6B47   02B8 0100
        MVO     R0,     G_0354                  ; 6B49   0240 0354
        PULR    R7                              ; 6B4B   02B7

L_6B4C:
        SDBD                                    ; 6B4C   0001
        MVII    #$51C0, R0                      ; 6B4D   02B8 00C0 0051
L_6B50:
        DIS                                     ; 6B50   0003
        MVO     R0,     .ISRVEC.0               ; 6B51   0240 0100
        SWAP    R0,     1                       ; 6B53   0040
        MVO     R0,     .ISRVEC.1               ; 6B54   0240 0101
        MOVR    R5,     R7                      ; 6B56   00AF

L_6B57:
        MVII    #$0008, R2                      ; 6B57   02BA 0008
        CLRR    R3                              ; 6B59   01DB
L_6B5A:
        DECR    R2                              ; 6B5A   0012
        INCR    R7                              ; 6B5B   000F

L_6B5C:
        CLRR    R2                              ; 6B5C   01D2
L_6B5D:
        NOP                                     ; 6B5D   0034
        PSHR    R5                              ; 6B5E   0275
        MOVR    R3,     R4                      ; 6B5F   009C
        MOVR    R3,     R5                      ; 6B60   009D
        ADDI    #$0325, R4                      ; 6B61   02FC 0325
        ADDI    #$033D, R5                      ; 6B63   02FD 033D
        CLRR    R1                              ; 6B65   01C9
L_6B66:
        MVO@    R1,     R4                      ; 6B66   0261
        MVO@    R1,     R5                      ; 6B67   0269
        DECR    R2                              ; 6B68   0012
        BPL     L_6B66                          ; 6B69   0223 0004
        PULR    R7                              ; 6B6B   02B7

L_6B6C:
        MVII    #$0007, R1                      ; 6B6C   02B9 0007
        CLRR    R2                              ; 6B6E   01D2
        INCR    R7                              ; 6B6F   000F

L_6B70:
        CLRR    R1                              ; 6B70   01C9
L_6B71:
        INCR    R7                              ; 6B71   000F

        DECR    R1                              ; 6B72   0011
L_6B73:
        MVII    #$0080, R3                      ; 6B73   02BB 0080
        B       L_6B7F                          ; 6B75   0200 0008

L_6B77:
        MVII    #$0007, R1                      ; 6B77   02B9 0007
        CLRR    R2                              ; 6B79   01D2
        INCR    R7                              ; 6B7A   000F

L_6B7B:
        CLRR    R1                              ; 6B7B   01C9
L_6B7C:
        INCR    R7                              ; 6B7C   000F

L_6B7D:
        DECR    R1                              ; 6B7D   0011
L_6B7E:
        CLRR    R3                              ; 6B7E   01DB
L_6B7F:
        ADDI    #$0167, R2                      ; 6B7F   02FA 0167
L_6B81:
        MVI@    R2,     R0                      ; 6B81   0290
        ANDI    #$007F, R0                      ; 6B82   03B8 007F
        XORR    R3,     R0                      ; 6B84   01D8
        MVO@    R0,     R2                      ; 6B85   0250
        INCR    R2                              ; 6B86   000A
        DECR    R1                              ; 6B87   0011
        BPL     L_6B81                          ; 6B88   0223 0008
        MOVR    R5,     R7                      ; 6B8A   00AF

L_6B8B:
        DECR    R2                              ; 6B8B   0012
        INCR    R7                              ; 6B8C   000F

L_6B8D:
        CLRR    R2                              ; 6B8D   01D2
L_6B8E:
        SDBD                                    ; 6B8E   0001
        ADDI    #$559A, R4                      ; 6B8F   02FC 009A 0055
        PSHR    R5                              ; 6B92   0275
L_6B93:
        SDBD                                    ; 6B93   0001
        MVI@    R4,     R0                      ; 6B94   02A0
        MVO@    R0,     R3                      ; 6B95   0258
        ADDI    #$0008, R3                      ; 6B96   02FB 0008
L_6B98:
        SDBD                                    ; 6B98   0001
        DECLE   $02A0,  $0258,  $02FB,  $0008   ; 6B99   02A0 0258 02FB 0008
        DECLE   $0001                           ; 6B9D   0001
L_6B9E:
        MVI@    R4,     R0                      ; 6B9E   02A0
        MVI@    R3,     R1                      ; 6B9F   0299
        SDBD                                    ; 6BA0   0001
        ANDI    #$0FF8, R1                      ; 6BA1   03B9 00F8 000F
L_6BA4:
        XORR    R0,     R1                      ; 6BA4   01C1
        MVO@    R1,     R3                      ; 6BA5   0259
        ADDI    #$0008, R3                      ; 6BA6   02FB 0008
        SDBD                                    ; 6BA8   0001
        MVI@    R4,     R0                      ; 6BA9   02A0
        MVO@    R0,     R3                      ; 6BAA   0258
        ADDI    #$0008, R3                      ; 6BAB   02FB 0008
        MVII    #$0010, R0                      ; 6BAD   02B8 0010
        MVO@    R0,     R3                      ; 6BAF   0258
        ADDI    #$0008, R3                      ; 6BB0   02FB 0008
        CLRR    R0                              ; 6BB2   01C0
        MVO@    R0,     R3                      ; 6BB3   0258
        ADDI    #$0008, R3                      ; 6BB4   02FB 0008
        SUBI    #$0355, R3                      ; 6BB6   033B 0355
        MVII    #$016F, R1                      ; 6BB8   02B9 016F
        ADDR    R3,     R1                      ; 6BBA   00D9
        MVO@    R1,     R1                      ; 6BBB   0249
        PSHR    R3                              ; 6BBC   0273
        SLL     R3,     1                       ; 6BBD   004B
        ADDI    #$0126, R3                      ; 6BBE   02FB 0126
        MVI@    R4,     R0                      ; 6BC0   02A0
        MVO@    R0,     R3                      ; 6BC1   0258
        ADDI    #$0010, R3                      ; 6BC2   02FB 0010
        MVI@    R4,     R0                      ; 6BC4   02A0
        MVO@    R0,     R3                      ; 6BC5   0258
        PULR    R3                              ; 6BC6   02B3
        ADDI    #$0326, R3                      ; 6BC7   02FB 0326
        DECR    R2                              ; 6BC9   0012
        BPL     L_6B93                          ; 6BCA   0223 0038
        PULR    R7                              ; 6BCC   02B7

L_6BCD:
        MVI@    R4,     R0                      ; 6BCD   02A0
        ANDI    #$00FF, R0                      ; 6BCE   03B8 00FF
        ADDI    #$0007, R4                      ; 6BD0   02FC 0007
        MVI@    R4,     R1                      ; 6BD2   02A1
        ANDI    #$007F, R1                      ; 6BD3   03B9 007F
        PSHR    R5                              ; 6BD5   0275

        JSR     R5,     .EXEC.78C               ; 6BD6   0004 0114 038C

        MOVR    R0,     R3                      ; 6BD9   0083
        MOVR    R1,     R4                      ; 6BDA   008C
        MOVR    R2,     R1                      ; 6BDB   0091
        SDBD                                    ; 6BDC   0001
        MVII    #$7FFF, R5                      ; 6BDD   02BD 00FF 007F
        ANDR    R5,     R1                      ; 6BE0   01A9
        SUBI    #$005F, R5                      ; 6BE1   033D 005F
        CMPR    R5,     R1                      ; 6BE3   0169
        BLE     L_6BE7                          ; 6BE4   0206 0001

        MOVR    R5,     R1                      ; 6BE6   00A9

L_6BE7:
        JSR     R5,     X_SQRT                  ; 6BE7   0004 011C 0223

        PULR    R7                              ; 6BEA   02B7

L_6BEB:
        PSHR    R5                              ; 6BEB   0275
        PSHR    R4                              ; 6BEC   0274
        PSHR    R1                              ; 6BED   0271

        JSR     R5,     L_6BCD                  ; 6BEE   0004 0168 03CD

        MOVR    R3,     R0                      ; 6BF1   0098
        MOVR    R2,     R3                      ; 6BF2   0093
        PULR    R1                              ; 6BF3   02B1
        PSHR    R1                              ; 6BF4   0271

        JSR     R5,     X_MPY                   ; 6BF5   0004 011C 01DC

        MOVR    R2,     R1                      ; 6BF8   0091
        MOVR    R3,     R2                      ; 6BF9   009A

        JSR     R5,     X_DIVR                  ; 6BFA   0004 011C 01F8

        PULR    R1                              ; 6BFD   02B1
        PSHR    R0                              ; 6BFE   0270
        MOVR    R4,     R0                      ; 6BFF   00A0
        MOVR    R1,     R4                      ; 6C00   008C

        JSR     R5,     X_MPY                   ; 6C01   0004 011C 01DC

        MOVR    R2,     R1                      ; 6C04   0091
        MOVR    R3,     R2                      ; 6C05   009A

        JSR     R5,     X_DIVR                  ; 6C06   0004 011C 01F8

        PULR    R1                              ; 6C09   02B1
        PULR    R2                              ; 6C0A   02B2
        SUBI    #$0325, R2                      ; 6C0B   033A 0325
        SLL     R2,     1                       ; 6C0D   004A
        ADDI    #$0126, R2                      ; 6C0E   02FA 0126
        MVO@    R1,     R2                      ; 6C10   0251
        ADDI    #$0010, R2                      ; 6C11   02FA 0010
        MVO@    R0,     R2                      ; 6C13   0250
        PULR    R7                              ; 6C14   02B7

L_6C15:
        PSHR    R5                              ; 6C15   0275
        MOVR    R1,     R2                      ; 6C16   008A
        MOVR    R0,     R1                      ; 6C17   0081
        MOVR    R2,     R0                      ; 6C18   0090
        SLR     R0,     1                       ; 6C19   0060

        JSR     R5,     .EXEC.629               ; 6C1A   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 6C1D   0004 0114 0357

        PULR    R7                              ; 6C20   02B7

L_6C21:
        PSHR    R5                              ; 6C21   0275
        MVI     G_017F, R0                      ; 6C22   0280 017F
        TSTR    R2                              ; 6C24   0092
        BNEQ    L_6C29                          ; 6C25   020C 0002

        DECR    R0                              ; 6C27   0010
        INCR    R7                              ; 6C28   000F

L_6C29:
        INCR    R0                              ; 6C29   0008
L_6C2A:
        ANDI    #$00FF, R0                      ; 6C2A   03B8 00FF
        MVO     R0,     G_017F                  ; 6C2C   0240 017F
        MVII    #$0200, R4                      ; 6C2E   02BC 0200
        TSTR    R2                              ; 6C30   0092
        BEQ     L_6C37                          ; 6C31   0204 0004

        ADDI    #$0013, R0                      ; 6C33   02F8 0013
        ADDI    #$0013, R4                      ; 6C35   02FC 0013
L_6C37:
        ANDI    #$00FF, R0                      ; 6C37   03B8 00FF
        MVII    #$000C, R1                      ; 6C39   02B9 000C
        MVO     R1,     G_019D                  ; 6C3B   0241 019D

L_6C3D:
        JSR     R5,     L_6C47                  ; 6C3D   0004 016C 0047

        MVO@    R3,     R4                      ; 6C40   0263
        ADDI    #$0013, R4                      ; 6C41   02FC 0013
        DECR    R1                              ; 6C43   0011
        BNEQ    L_6C3D                          ; 6C44   022C 0008
        PULR    R7                              ; 6C46   02B7

L_6C47:
        PSHR    R5                              ; 6C47   0275
        PSHR    R0                              ; 6C48   0270
        PSHR    R0                              ; 6C49   0270
        ANDI    #$00F0, R0                      ; 6C4A   03B8 00F0
        SLR     R0,     2                       ; 6C4C   0064
        SLR     R0,     2                       ; 6C4D   0064
        SDBD                                    ; 6C4E   0001
        MVII    #$6CD5, R5                      ; 6C4F   02BD 00D5 006C
        ADDR    R0,     R5                      ; 6C52   00C5
        MVI@    R5,     R3                      ; 6C53   02AB
        SDBD                                    ; 6C54   0001
        ADDI    #$6CE5, R3                      ; 6C55   02FB 00E5 006C
        PULR    R0                              ; 6C58   02B0
        ANDI    #$000F, R0                      ; 6C59   03B8 000F
        ADDR    R0,     R3                      ; 6C5B   00C3
        MVI@    R3,     R2                      ; 6C5C   029A
        CMPI    #$0007, R1                      ; 6C5D   0379 0007
        BGE     L_6C9C                          ; 6C5F   020D 003B

        ANDI    #$03C0, R2                      ; 6C61   03BA 03C0
        SLL     R2,     2                       ; 6C63   004E
        SWAP    R2,     1                       ; 6C64   0042
        SDBD                                    ; 6C65   0001
        ADDI    #$6E87, R2                      ; 6C66   02FA 0087 006E
        MVI@    R2,     R2                      ; 6C69   0292
        CMPI    #$0001, R1                      ; 6C6A   0379 0001
        BEQ     L_6C7A                          ; 6C6C   0204 000C

        CMPI    #$0003, R1                      ; 6C6E   0379 0003
        BGT     L_6C7D                          ; 6C70   020E 000B
        BEQ     L_6C76                          ; 6C72   0204 0002

        SLL     R2,     1                       ; 6C74   004A
        INCR    R7                              ; 6C75   000F

L_6C76:
        SLR     R2,     2                       ; 6C76   0066
L_6C77:
        ANDI    #$000E, R2                      ; 6C77   03BA 000E
        INCR    R7                              ; 6C79   000F

L_6C7A:
        CLRR    R2                              ; 6C7A   01D2
L_6C7B:
        B       L_6C8A                          ; 6C7B   0200 000D

L_6C7D:
        CMPI    #$0005, R1                      ; 6C7D   0379 0005
        BLT     L_6C85                          ; 6C7F   0205 0004
        BEQ     L_6C84                          ; 6C81   0204 0001

        SLR     R2,     1                       ; 6C83   0062
L_6C84:
        SLR     R2,     1                       ; 6C84   0062
L_6C85:
        SLR     R2,     1                       ; 6C85   0062
        SLR     R2,     2                       ; 6C86   0066
        SLR     R2,     2                       ; 6C87   0066
        ANDI    #$0002, R2                      ; 6C88   03BA 0002
L_6C8A:
        SDBD                                    ; 6C8A   0001
        ADDI    #$6EB7, R2                      ; 6C8B   02FA 00B7 006E
        MOVR    R2,     R5                      ; 6C8E   0095
        SDBD                                    ; 6C8F   0001
        MVI@    R5,     R3                      ; 6C90   02AB
        MVI     G_018A, R2                      ; 6C91   0282 018A
        SARC    R2,     1                       ; 6C93   007A
        BNC     L_6C9A                          ; 6C94   0209 0004

        SDBD                                    ; 6C96   0001
        XORI    #$3600, R3                      ; 6C97   03FB 0000 0036
L_6C9A:
        B       L_6CD3                          ; 6C9A   0200 0037

L_6C9C:
        ANDI    #$003F, R2                      ; 6C9C   03BA 003F
        SLL     R2,     1                       ; 6C9E   004A
        MOVR    R2,     R3                      ; 6C9F   0093
        SLL     R2,     1                       ; 6CA0   004A
        ADDR    R2,     R3                      ; 6CA1   00D3
        SDBD                                    ; 6CA2   0001
        ADDI    #$6D55, R3                      ; 6CA3   02FB 0055 006D
        MVII    #$000C, R2                      ; 6CA6   02BA 000C
        SUBR    R1,     R2                      ; 6CA8   010A
        ADDR    R2,     R3                      ; 6CA9   00D3
        MVI@    R3,     R2                      ; 6CAA   029A
        MOVR    R2,     R3                      ; 6CAB   0093
        ANDI    #$003F, R2                      ; 6CAC   03BA 003F
        ANDI    #$03C0, R3                      ; 6CAE   03BB 03C0
        SLL     R2,     1                       ; 6CB0   004A
        SLL     R2,     2                       ; 6CB1   004E
        SDBD                                    ; 6CB2   0001
        ADDI    #$0800, R2                      ; 6CB3   02FA 0000 0008
        SLR     R3,     2                       ; 6CB6   0067
        SLR     R3,     2                       ; 6CB7   0067
        SLR     R3,     1                       ; 6CB8   0063
        SDBD                                    ; 6CB9   0001
        ADDI    #$6E97, R3                      ; 6CBA   02FB 0097 006E
        MOVR    R3,     R5                      ; 6CBD   009D
        SDBD                                    ; 6CBE   0001
        MVI@    R5,     R3                      ; 6CBF   02AB
        MVI     G_019F, R0                      ; 6CC0   0280 019F
        CMPI    #$0005, R0                      ; 6CC2   0378 0005
        BLT     L_6CD2                          ; 6CC4   0205 000C

        CMPI    #$000C, R0                      ; 6CC6   0378 000C
        BGE     L_6CD2                          ; 6CC8   020D 0008

        MOVR    R3,     R0                      ; 6CCA   0098
        RLC     R0,     1                       ; 6CCB   0050
        BNC     L_6CD2                          ; 6CCC   0209 0004

        SDBD                                    ; 6CCE   0001
        XORI    #$3000, R3                      ; 6CCF   03FB 0000 0030
L_6CD2:
        ADDR    R2,     R3                      ; 6CD2   00D3
L_6CD3:
        PULR    R0                              ; 6CD3   02B0
        PULR    R7                              ; 6CD4   02B7

        DECLE   $0000                           ; 6CD5   0000

        DECR    R0                              ; 6CD6   0010
        NEGR    R0                              ; 6CD7   0020
        GSWD    R0                              ; 6CD8   0030
        SWAP    R0,     1                       ; 6CD9   0040
        RLC     R0,     1                       ; 6CDA   0050
        SLR     R0,     1                       ; 6CDB   0060
        GSWD    R0                              ; 6CDC   0030
        NEGR    R0                              ; 6CDD   0020
        SWAP    R0,     1                       ; 6CDE   0040
        RLC     R0,     1                       ; 6CDF   0050
        GSWD    R0                              ; 6CE0   0030
        NEGR    R0                              ; 6CE1   0020
        SLR     R0,     1                       ; 6CE2   0060
        SWAP    R0,     1                       ; 6CE3   0040
        RLC     R0,     1                       ; 6CE4   0050
        ADCR    R1                              ; 6CE5   0029
        SLL     R3,     1                       ; 6CE6   004B
        MOVR    R1,     R2                      ; 6CE7   008A
        ADDR    R0,     R5                      ; 6CE8   00C5
        SUBR    R0,     R6                      ; 6CE9   0106
        SUBR    R1,     R1                      ; 6CEA   0109
        MVO@    R2,     R1                      ; 6CEB   024A
        AND@    R1,     R4                      ; 6CEC   038C
        INCR    R7                              ; 6CED   000F

        SLL     R1,     1                       ; 6CEE   0049
L_6CEF:
        MOVR    R0,     R3                      ; 6CEF   0083
        ADDR    R0,     R4                      ; 6CF0   00C4
        SUBR    R3,     R5                      ; 6CF1   011D
        SUBR    R3,     R6                      ; 6CF2   011E
        SUBR    R3,     R7                      ; 6CF3   011F

        SUBR    R0,     R2                      ; 6CF4   0102
        INCR    R5                              ; 6CF5   000D
        SLL     R0,     2                       ; 6CF6   004C
        MOVR    R1,     R6                      ; 6CF7   008E
        ADDR    R0,     R5                      ; 6CF8   00C5
        SUBR    R0,     R6                      ; 6CF9   0106
        SUBR    R1,     R7                      ; 6CFA   010F

        SUBR    R1,     R6                      ; 6CFB   010E
        SUBR    R1,     R7                      ; 6CFC   010F

        INCR    R5                              ; 6CFD   000D
        SLL     R1,     1                       ; 6CFE   0049
        MOVR    R1,     R7                      ; 6CFF   008F

        ADDR    R1,     R0                      ; 6D00   00C8
        SUBR    R0,     R7                      ; 6D01   0107

        SUBR    R1,     R5                      ; 6D02   010D
        SUBR    R1,     R1                      ; 6D03   0109
        SUBR    R1,     R2                      ; 6D04   010A
        DECR    R4                              ; 6D05   0014
        RLC     R2,     2                       ; 6D06   0056
        MOVR    R3,     R4                      ; 6D07   009C
        ADDR    R3,     R0                      ; 6D08   00D8
        SUBR    R2,     R5                      ; 6D09   0115
        SUBR    R2,     R4                      ; 6D0A   0114
        SUBR    R2,     R6                      ; 6D0B   0116
        SUBR    R2,     R7                      ; 6D0C   0117

        COMR    R0                              ; 6D0D   0018
        ANDR    R3,     R1                      ; 6D0E   0199
        SUB@    R3,     R2                      ; 6D0F   031A
        ADDR    R3,     R3                      ; 6D10   00DB
        SUBR    R2,     R0                      ; 6D11   0110
        SUBR    R5,     R2                      ; 6D12   012A
        SUBR    R5,     R5                      ; 6D13   012D
        SUBR    R5,     R3                      ; 6D14   012B
        NEGR    R0                              ; 6D15   0020
        SLR     R2,     1                       ; 6D16   0062
        MOVR    R5,     R0                      ; 6D17   00A8
        ADDR    R4,     R4                      ; 6D18   00E4
        MVO@    R5,     R4                      ; 6D19   0265
        AND@    R4,     R6                      ; 6D1A   03A6
        SUBR    R4,     R7                      ; 6D1B   0127

        SUBR    R5,     R2                      ; 6D1C   012A
        NEGR    R0                              ; 6D1D   0020
        SLR     R2,     1                       ; 6D1E   0062
        MOVR    R4,     R3                      ; 6D1F   00A3
        ADDR    R4,     R4                      ; 6D20   00E4
        SUBR    R4,     R5                      ; 6D21   0125
        SUBR    R4,     R6                      ; 6D22   0126
        SUBR    R4,     R7                      ; 6D23   0127

        SUBR    R5,     R1                      ; 6D24   0129
        DECR    R4                              ; 6D25   0014
        RLC     R2,     2                       ; 6D26   0056
        MOVR    R3,     R4                      ; 6D27   009C
        ADDR    R3,     R0                      ; 6D28   00D8
        SUBR    R3,     R1                      ; 6D29   0119
        SUBR    R4,     R1                      ; 6D2A   0121
        SUBR    R4,     R2                      ; 6D2B   0122
        SUBR    R5,     R0                      ; 6D2C   0128
        NEGR    R4                              ; 6D2D   0024
        SLR     R1,     1                       ; 6D2E   0061
        MOVR    R2,     R4                      ; 6D2F   0094
        ADDR    R2,     R6                      ; 6D30   00D6
        SUBR    R2,     R7                      ; 6D31   0117

        SUBR    R3,     R0                      ; 6D32   0118
        SUBR    R3,     R1                      ; 6D33   0119
        SUBR    R3,     R2                      ; 6D34   011A
        COMR    R3                              ; 6D35   001B
        SAR     R2,     2                       ; 6D36   006E
        MOVR    R4,     R0                      ; 6D37   00A0
        ADDR    R4,     R2                      ; 6D38   00E2
        SUBR    R5,     R0                      ; 6D39   0128
        SUBR    R4,     R4                      ; 6D3A   0124
        SUBR    R4,     R1                      ; 6D3B   0121
        SUBR    R4,     R0                      ; 6D3C   0120
        NEGR    R1                              ; 6D3D   0021
        SLR     R2,     1                       ; 6D3E   0062
        MOVR    R5,     R0                      ; 6D3F   00A8
        ADDR    R4,     R4                      ; 6D40   00E4
        MVO@    R5,     R4                      ; 6D41   0265
        AND@    R4,     R6                      ; 6D42   03A6
        SUBR    R4,     R7                      ; 6D43   0127

        SUBR    R2,     R2                      ; 6D44   0112
        GSWD    R0                              ; 6D45   0030
        SAR     R0,     2                       ; 6D46   006C
        XORR    R5,     R2                      ; 6D47   01EA
        CMP@    R5,     R3                      ; 6D48   036B
        SUBR    R6,     R1                      ; 6D49   0131
        SUBR    R5,     R6                      ; 6D4A   012E
        SUBR    R5,     R2                      ; 6D4B   012A
        SUBR    R5,     R7                      ; 6D4C   012F

        DECLE   $002A,  $0051,  $00A9,  $00E0   ; 6D4D   002A 0051 00A9 00E0
        DECLE   $0122,  $0123,  $0124,  $0121   ; 6D51   0122 0123 0124 0121
        DECLE   $026C,  $0212,  $01EB,  $01EB   ; 6D55   026C 0212 01EB 01EB
        DECLE   $00CA,  $00C9,  $026C,  $0213   ; 6D59   00CA 00C9 026C 0213
        DECLE   $01EB,  $01EB,  $00CA,  $00C9   ; 6D5D   01EB 01EB 00CA 00C9
        DECLE   $03C0,  $022C,  $01EB,  $00AB   ; 6D61   03C0 022C 01EB 00AB
        DECLE   $00CA,  $00C9,  $0383,  $0212   ; 6D65   00CA 00C9 0383 0212
        DECLE   $0090,  $0091,  $00EB,  $00EB   ; 6D69   0090 0091 00EB 00EB
        DECLE   $026C,  $022C,  $008F,  $01E7   ; 6D6D   026C 022C 008F 01E7
        DECLE   $00EB,  $00EB,  $026C,  $0213   ; 6D71   00EB 00EB 026C 0213
        DECLE   $00AB,  $0090,  $00CD,  $00CB   ; 6D75   00AB 0090 00CD 00CB
        DECLE   $026C,  $0212                   ; 6D79   026C 0212

        MOVR    R1,     R7                      ; 6D7B   008F

        MOVR    R2,     R1                      ; 6D7C   0091
        ADDR    R1,     R6                      ; 6D7D   00CE
        ADDR    R1,     R4                      ; 6D7E   00CC
        XOR     .BTAB.12,R2                     ; 6D7F   03C2 0212
        MOVR    R5,     R3                      ; 6D81   00AB
        MOVR    R2,     R0                      ; 6D82   0090
        ADDR    R1,     R6                      ; 6D83   00CE
        ADDR    R1,     R4                      ; 6D84   00CC
        MVO     R3,     .BTAB.12                ; 6D85   0243 0212
        MOVR    R1,     R7                      ; 6D87   008F

        DECLE   $00AB,  $00CD,  $00CB,  $026C   ; 6D88   00AB 00CD 00CB 026C
        DECLE   $0212,  $008F,  $0090,  $00CA   ; 6D8C   0212 008F 0090 00CA
        DECLE   $00C9,  $026C,  $0213           ; 6D90   00C9 026C 0213

        MOVR    R5,     R3                      ; 6D93   00AB
        MOVR    R5,     R3                      ; 6D94   00AB
        ADDR    R1,     R2                      ; 6D95   00CA
        ADDR    R1,     R1                      ; 6D96   00C9
        AND     .BTAB.12,R3                     ; 6D97   0383 0212
        MOVR    R5,     R3                      ; 6D99   00AB
        MOVR    R5,     R3                      ; 6D9A   00AB
        ADDR    R1,     R2                      ; 6D9B   00CA
        ADDR    R1,     R1                      ; 6D9C   00C9
        XOR     .BTAB.2C,R2                     ; 6D9D   03C2 022C
        MOVR    R1,     R7                      ; 6D9F   008F

        DECLE   $0091,  $00CA,  $00C9,  $03EC   ; 6DA0   0091 00CA 00C9 03EC
        DECLE   $022C,  $00AB,  $0091,  $00CA   ; 6DA4   022C 00AB 0091 00CA
        DECLE   $00C9,  $03AC,  $0213,  $008F   ; 6DA8   00C9 03AC 0213 008F
        DECLE   $00AB,  $00CA,  $00C9,  $03EC   ; 6DAC   00AB 00CA 00C9 03EC
        DECLE   $0213,  $0090,  $0091,  $00CA   ; 6DB0   0213 0090 0091 00CA
        DECLE   $00C9,  $026C,  $0212,  $00E4   ; 6DB4   00C9 026C 0212 00E4
        DECLE   $0125,  $0125,  $0126,  $0242   ; 6DB8   0125 0125 0126 0242
        DECLE   $022C,  $00E4,  $0125,  $0125   ; 6DBC   022C 00E4 0125 0125
        DECLE   $0126,  $03C0,  $022C,  $00E4   ; 6DC0   0126 03C0 022C 00E4
        DECLE   $0125,  $0125,  $0126,  $026C   ; 6DC4   0125 0125 0126 026C
        DECLE   $0213                           ; 6DC8   0213

        ADDR    R4,     R4                      ; 6DC9   00E4
        SUBR    R4,     R5                      ; 6DCA   0125
        SUBR    R4,     R5                      ; 6DCB   0125
        SUBR    R4,     R6                      ; 6DCC   0126
        RLC     R0,     2                       ; 6DCD   0054
        RLC     R0,     2                       ; 6DCE   0054
        RLC     R1,     2                       ; 6DCF   0055
        RLC     R0,     2                       ; 6DD0   0054
        RLC     R0,     2                       ; 6DD1   0054
        RLC     R0,     2                       ; 6DD2   0054
        ADCR    R4                              ; 6DD3   002C
        ADCR    R4                              ; 6DD4   002C
        RLC     R2,     2                       ; 6DD5   0056
        ADCR    R4                              ; 6DD6   002C
        ADCR    R4                              ; 6DD7   002C
        ADCR    R4                              ; 6DD8   002C
        SLLC    R0,     1                       ; 6DD9   0058
        SLLC    R0,     1                       ; 6DDA   0058
        SLLC    R1,     2                       ; 6DDB   005D
        SLR     R0,     1                       ; 6DDC   0060
        SLLC    R0,     1                       ; 6DDD   0058
        SLLC    R0,     1                       ; 6DDE   0058
        CMPR    R5,     R4                      ; 6DDF   016C
        SUBR    R0,     R1                      ; 6DE0   0101
        SLLC    R3,     2                       ; 6DE1   005F
        SLLC    R1,     1                       ; 6DE2   0059
        SLLC    R3,     1                       ; 6DE3   005B
        SLLC    R0,     2                       ; 6DE4   005C
        RLC     R0,     2                       ; 6DE5   0054
        RLC     R0,     2                       ; 6DE6   0054
        SLLC    R2,     2                       ; 6DE7   005E
        SLLC    R2,     1                       ; 6DE8   005A
        RLC     R0,     2                       ; 6DE9   0054
        RLC     R0,     2                       ; 6DEA   0054
        SLLC    R0,     1                       ; 6DEB   0058
        SLLC    R0,     1                       ; 6DEC   0058
        RLC     R3,     2                       ; 6DED   0057
        SLLC    R0,     1                       ; 6DEE   0058
        SLLC    R0,     1                       ; 6DEF   0058
        SLLC    R0,     1                       ; 6DF0   0058
        ADCR    R4                              ; 6DF1   002C
        ADCR    R4                              ; 6DF2   002C
        ADCR    R5                              ; 6DF3   002D
        ADCR    R4                              ; 6DF4   002C
        ADCR    R4                              ; 6DF5   002C
        XORR    R4,     R3                      ; 6DF6   01E3
        NEGR    R2                              ; 6DF7   0022
        ADCR    R5                              ; 6DF8   002D
        NEGR    R1                              ; 6DF9   0021
        NEGR    R2                              ; 6DFA   0022
        XORR    R4,     R3                      ; 6DFB   01E3
        XORR    R5,     R3                      ; 6DFC   01EB
        CMPR    R5,     R4                      ; 6DFD   016C
        CMPR    R5,     R4                      ; 6DFE   016C
        SLLC    R3,     2                       ; 6DFF   005F
        SLLC    R1,     1                       ; 6E00   0059
        SLLC    R3,     1                       ; 6E01   005B
        SLLC    R0,     2                       ; 6E02   005C
        BNEQ    L_6B98                          ; 6E03   022C 026C

        XORR    R5,     R3                      ; 6E05   01EB
        XORR    R5,     R0                      ; 6E06   01E8
        SUBR    R5,     R3                      ; 6E07   012B
        SUBR    R5,     R3                      ; 6E08   012B
        BNEQ    L_6B9E                          ; 6E09   022C 026C

        XORR    R5,     R3                      ; 6E0B   01EB
        XORR    R5,     R1                      ; 6E0C   01E9
        ADDR    R1,     R2                      ; 6E0D   00CA
        ADDR    R1,     R1                      ; 6E0E   00C9
        BNEQ    L_6BA4                          ; 6E0F   022C 026C
        MOVR    R1,     R7                      ; 6E11   008F

        XORR    R5,     R2                      ; 6E12   01EA
        ADDR    R1,     R2                      ; 6E13   00CA
        ADDR    R1,     R1                      ; 6E14   00C9
        MVI@    R2,     R4                      ; 6E15   0294
        MVI@    R2,     R4                      ; 6E16   0294
        MVI@    R2,     R5                      ; 6E17   0295
        MVI@    R2,     R4                      ; 6E18   0294
        MVI@    R2,     R4                      ; 6E19   0294
        MVI@    R2,     R4                      ; 6E1A   0294
        ADD@    R5,     R4                      ; 6E1B   02EC
        ADD@    R5,     R4                      ; 6E1C   02EC
        MVI@    R2,     R6                      ; 6E1D   0296
        ADD@    R5,     R4                      ; 6E1E   02EC
        ADD@    R5,     R4                      ; 6E1F   02EC
        ADD@    R5,     R4                      ; 6E20   02EC
        MVI@    R3,     R0                      ; 6E21   0298
        MVI@    R3,     R0                      ; 6E22   0298
        MVI@    R3,     R5                      ; 6E23   029D
        MVI@    R4,     R0                      ; 6E24   02A0
        MVI@    R3,     R0                      ; 6E25   0298
        MVI@    R3,     R0                      ; 6E26   0298
        CMPR    R5,     R4                      ; 6E27   016C
        SUBR    R0,     R1                      ; 6E28   0101
        MVI@    R3,     R7                      ; 6E29   029F

        MVI@    R3,     R1                      ; 6E2A   0299
        MVI@    R3,     R3                      ; 6E2B   029B
        MVI@    R3,     R4                      ; 6E2C   029C
        MVI@    R2,     R4                      ; 6E2D   0294
        MVI@    R2,     R4                      ; 6E2E   0294
        MVI@    R3,     R6                      ; 6E2F   029E
        MVI@    R3,     R2                      ; 6E30   029A
        MVI@    R2,     R4                      ; 6E31   0294
        MVI@    R2,     R4                      ; 6E32   0294
        MVI@    R3,     R0                      ; 6E33   0298
        MVI@    R3,     R0                      ; 6E34   0298
        MVI@    R2,     R7                      ; 6E35   0297

        MVI@    R3,     R0                      ; 6E36   0298
        MVI@    R3,     R0                      ; 6E37   0298
        MVI@    R3,     R0                      ; 6E38   0298
        ADD@    R5,     R4                      ; 6E39   02EC
        ADD@    R5,     R4                      ; 6E3A   02EC
        ADD@    R5,     R5                      ; 6E3B   02ED
        ADD@    R5,     R4                      ; 6E3C   02EC
        ADD@    R5,     R4                      ; 6E3D   02EC
        ANDR    R4,     R3                      ; 6E3E   01A3
        ADD@    R4,     R2                      ; 6E3F   02E2
        ADD@    R5,     R5                      ; 6E40   02ED
        ADD@    R4,     R1                      ; 6E41   02E1
        ADD@    R4,     R2                      ; 6E42   02E2
        ANDR    R4,     R3                      ; 6E43   01A3
        ANDR    R5,     R3                      ; 6E44   01AB
        CMPR    R5,     R4                      ; 6E45   016C
        CMPR    R5,     R4                      ; 6E46   016C
        MVI@    R3,     R7                      ; 6E47   029F

        DECLE   $0299,  $029B,  $029C,  $026C   ; 6E48   0299 029B 029C 026C
        DECLE   $0212,  $012B,  $012B,  $012B   ; 6E4C   0212 012B 012B 012B
        DECLE   $012B,  $026C,  $0213,  $012B   ; 6E50   012B 026C 0213 012B
        DECLE   $012B,  $012B,  $012B,  $026C   ; 6E54   012B 012B 012B 026C
        DECLE   $026C,  $012B,  $012B,  $012B   ; 6E58   026C 012B 012B 012B
        DECLE   $012B,  $026C,  $0213,  $008F   ; 6E5C   012B 026C 0213 008F
        DECLE   $012B,  $012B,  $012B,  $03C0   ; 6E60   012B 012B 012B 03C0
        DECLE   $022C,  $012B,  $012B,  $012B   ; 6E64   022C 012B 012B 012B
        DECLE   $012B,  $03C0,  $0212,  $012B   ; 6E68   012B 03C0 0212 012B
        DECLE   $012B,  $012B,  $012B,  $0242   ; 6E6C   012B 012B 012B 0242
        DECLE   $0212,  $012B,  $012B,  $012B   ; 6E70   0212 012B 012B 012B
        DECLE   $012B,  $0382,  $0213,  $012B   ; 6E74   012B 0382 0213 012B
        DECLE   $012B,  $012B,  $012B,  $0383   ; 6E78   012B 012B 012B 0383
        DECLE   $022C,  $012B,  $012B,  $012B   ; 6E7C   022C 012B 012B 012B
        DECLE   $012B,  $03C3,  $0213,  $012B   ; 6E80   012B 03C3 0213 012B
        DECLE   $012B,  $012B,  $012B,  $0010   ; 6E84   012B 012B 012B 0010
        DECLE   $0058,  $0098,  $0118,  $0018   ; 6E88   0058 0098 0118 0018
        DECLE   $0015,  $005D,  $009D,  $011D   ; 6E8C   0015 005D 009D 011D
        DECLE   $001D,  $0014,  $005C,  $009C   ; 6E90   001D 0014 005C 009C
        DECLE   $011C,  $001C,  $0018,  $0000   ; 6E94   011C 001C 0018 0000
        DECLE   $0006,  $0003,  $0024,  $0004   ; 6E98   0006 0003 0024 0004
        DECLE   $0026,  $0004,  $0024,  $0004   ; 6E9C   0026 0004 0024 0004
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6EA0   0000 0000 0000 0004
        DECLE   $0002,  $0004,  $0006,  $0004   ; 6EA4   0002 0004 0006 0004
        DECLE   $0080,  $0006,  $0080,  $0001   ; 6EA8   0080 0006 0080 0001
        DECLE   $0032,  $0000,  $0002,  $0000   ; 6EAC   0032 0000 0002 0000
        DECLE   $0000,  $0004,  $0002,  $0002   ; 6EB0   0000 0004 0002 0002
        DECLE   $0080,  $0007,  $0080,  $0000   ; 6EB4   0080 0007 0080 0000

        DECR    R0                              ; 6EB8   0010
        SARC    R0,     1                       ; 6EB9   0078
        DECR    R0                              ; 6EBA   0010
        ADCR    R0                              ; 6EBB   0028
        COMR    R0                              ; 6EBC   0018
        GSWD    R0                              ; 6EBD   0030
        COMR    R0                              ; 6EBE   0018
        RSWD    R1                              ; 6EBF   0039
        COMR    R0                              ; 6EC0   0018
        SWAP    R1,     1                       ; 6EC1   0041
        COMR    R0                              ; 6EC2   0018
L_6EC3:
        PSHR    R5                              ; 6EC3   0275

        JSR     R5,     X_PLAY_MUS1             ; 6EC4   0004 0118 0327
        DECLE   $0224                           ; 6EC7  Note (short)
        DECLE   $0214                           ; 6EC8  Note (short)
        DECLE   $022E                           ; 6EC9  Note (short)
        DECLE   $0002                           ; 6ECA  Note (short)
        DECLE   $0204                           ; 6ECB  Note (short)
        DECLE   $01E4                           ; 6ECC  Note (short)
        DECLE   $01D4                           ; 6ECD  Note (short)
        DECLE   $01B4                           ; 6ECE  Note (short)
        DECLE   $01A2                           ; 6ECF  Note (short)
        DECLE   $01B7                           ; 6ED0  Note (short)
        DECLE   $0006                           ; 6ED1  Note (short)
        DECLE   $0000                           ; 6ED2  End of music

        PULR    R7                              ; 6ED3   02B7

L_6ED4:
        PSHR    R5                              ; 6ED4   0275

        JSR     R5,     X_PLAY_MUS1             ; 6ED5   0004 0118 0327
        DECLE   $00A4                           ; 6ED8  Note (short)
        DECLE   $0094                           ; 6ED9  Note (short)
        DECLE   $00A6                           ; 6EDA  Note (short)
        DECLE   $0002                           ; 6EDB  Note (short)
        DECLE   $0084                           ; 6EDC  Note (short)
        DECLE   $0064                           ; 6EDD  Note (short)
        DECLE   $0054                           ; 6EDE  Note (short)
        DECLE   $0034                           ; 6EDF  Note (short)
        DECLE   $0022                           ; 6EE0  Note (short)
        DECLE   $0037                           ; 6EE1  Note (short)
        DECLE   $0006                           ; 6EE2  Note (short)
        DECLE   $0000                           ; 6EE3  End of music

        PULR    R7                              ; 6EE4   02B7

L_6EE5:
        JSR     R5,     X_PLAY_SFX2             ; 6EE5   0004 0118 03BE
        DECLE   $007A                           ; 6EE8  SFX prio
        DECLE   $0389                           ; 6EE9  SFX data
        DECLE   $0340,  $02CF                   ; 6EEA  SFX data
        DECLE   $0348,  $023A                   ; 6EEC  SFX data
        DECLE   $0344,  $01AB                   ; 6EEE  SFX data
        DECLE   $0375                           ; 6EF0  SFX data
        DECLE   $008F,  $0028                   ; 6EF1  SFX data
        DECLE   $0000,  $0280                   ; 6EF3  SFX data
        DECLE   $0008,  $021A                   ; 6EF5  SFX data
        DECLE   $008F,  $0028                   ; 6EF7  SFX data
        DECLE   $0000,  $02CF                   ; 6EF9  SFX data
        DECLE   $0008,  $023A                   ; 6EFB  SFX data
        DECLE   $0004,  $01AB                   ; 6EFD  SFX data
        DECLE   $008F,  $0028                   ; 6EFF  SFX data
        DECLE   $0000,  $0280                   ; 6F01  SFX data
        DECLE   $0004,  $01C5                   ; 6F03  SFX data
        DECLE   $008F,  $0028                   ; 6F05  SFX data
        DECLE   $0000,  $02CF                   ; 6F07  SFX data
        DECLE   $0004,  $01AB                   ; 6F09  SFX data
        DECLE   $02AB                           ; 6F0B  SFX data
        DECLE   $0077,  $001A,  $006F           ; 6F0C  SFX data
        DECLE   $0001,  $0013                   ; 6F0F  SFX data
        DECLE   $008F,  $00DC                   ; 6F11  SFX data
        DECLE   $008F,  $0046                   ; 6F13  SFX data
        DECLE   $00CF                           ; 6F15  SFX end


        MVII    #$0001, R0                      ; 6F16   02B8 0001
        MVO     R0,     G_0188                  ; 6F18   0240 0188
UC_6F1A:
        MVI     G_019C, R1                      ; 6F1A  SLIB UCALL target
        TSTR    R1                              ; 6F1C   0089
        BEQ     L_6F2F                          ; 6F1D   0204 0010

        MVII    #$02F7, R1                      ; 6F1F   02B9 02F7
        ADD     G_019B, R1                      ; 6F21   02C1 019B
        ADD     G_019B, R1                      ; 6F23   02C1 019B
        MVI@    R1,     R0                      ; 6F25   0288
        TSTR    R0                              ; 6F26   0080
        BNEQ    L_6F2F                          ; 6F27   020C 0006

        DECR    R1                              ; 6F29   0011
        MVI@    R1,     R0                      ; 6F2A   0288
        CMPI    #$03E8, R0                      ; 6F2B   0378 03E8
        BLT     L_6F31                          ; 6F2D   0205 0002

L_6F2F:
        ADDI    #$0004, R4                      ; 6F2F   02FC 0004
L_6F31:
        PULR    R7                              ; 6F31   02B7

L_6F32:
        JSR     R5,     X_PLAY_SFX2             ; 6F32   0004 0118 03BE
        DECLE   $0060                           ; 6F35  SFX prio

        XOR@    R1,     R1                      ; 6F36   03C9
        MVI@    R1,     R0                      ; 6F37   0288
        RLC     R0,     1                       ; 6F38   0050
        MOVR    R1,     R7                      ; 6F39   008F

        DECR    R2                              ; 6F3A   0012
        MVI@    R1,     R0                      ; 6F3B   0288
        SLLC    R1,     1                       ; 6F3C   0059
        ANDR    R5,     R3                      ; 6F3D   01AB
        MVI@    R1,     R0                      ; 6F3E   0288
        SLR     R0,     2                       ; 6F3F   0064
        MOVR    R1,     R7                      ; 6F40   008F

        DECLE   $001E,  $0288,  $0043,  $022B   ; 6F41   001E 0288 0043 022B
        DECLE   $0288,  $004B,  $022B,  $0288   ; 6F45   0288 004B 022B 0288
        DECLE   $0054,  $022B,  $0288,  $005F   ; 6F49   0054 022B 0288 005F
        DECLE   $022B,  $03E9,  $03CF           ; 6F4D   022B 03E9 03CF
L_6F50:
        JSR     R5,     X_PLAY_SFX2             ; 6F50   0004 0118 03BE
        DECLE   $0050                           ; 6F53  SFX prio
        DECLE   $01F9,  $0237                   ; 6F54   01F9 0237

        INCR    R3                              ; 6F56   000B
        XOR@    R5,     R5                      ; 6F57   03ED
        XORR    R3,     R4                      ; 6F58   01DC
        SUBR    R0,     R0                      ; 6F59   0100
        MOVR    R1,     R7                      ; 6F5A   008F

        DECLE   $0078,  $01C9,  $03CF           ; 6F5B   0078 01C9 03CF

        PULR    R7                              ; 6F5E   02B7

L_6F5F:
        JSR     R5,     X_PLAY_SFX2             ; 6F5F   0004 0118 03BE
        DECLE   $0074                           ; 6F62  SFX prio

        XORR    R3,     R1                      ; 6F63   01D9
        MVO@    R5,     R3                      ; 6F64   025D
        ADD@    R1,     R0                      ; 6F65   02C8
        MOVR    R5,     R1                      ; 6F66   00A9
        SUBR    R5,     R3                      ; 6F67   012B
        MOVR    R1,     R0                      ; 6F68   0088
        MOVR    R5,     R1                      ; 6F69   00A9
        MOVR    R0,     R3                      ; 6F6A   0083
        XOR@    R4,     R6                      ; 6F6B   03E6
        ADD@    R1,     R7                      ; 6F6C   02CF

L_6F6D:
        JSR     R5,     X_PLAY_SFX2             ; 6F6D   0004 0118 03BE
        DECLE   $0070                           ; 6F70  SFX prio
        DECLE   $01C9,  $027D,  $0300,  $011D   ; 6F71   01C9 027D 0300 011D
        DECLE   $0001,  $0340,  $00A3,  $03EB   ; 6F75   0001 0340 00A3 03EB
        DECLE   $01D9,  $03CF                   ; 6F79   01D9 03CF
L_6F7B:
        JSR     R5,     X_PLAY_SFX2             ; 6F7B   0004 0118 03BE
        DECLE   $0060                           ; 6F7E  SFX prio

        XORR    R3,     R1                      ; 6F7F   01D9
        SLL     R0,     1                       ; 6F80   0048
        ADDI    #$001C, R1                      ; 6F81   02F9 001C
        SUB     G_0137, R0                      ; 6F83   0300 0137
        INCR    R3                              ; 6F85   000B
        ADDR    R6,     R1                      ; 6F86   00F1
        XOR@    R5,     R6                      ; 6F87   03EE
        MVI@    R5,     R3                      ; 6F88   02AB
        ADD@    R1,     R7                      ; 6F89   02CF

L_6F8A:
        JSR     R5,     X_PLAY_SFX2             ; 6F8A   0004 0118 03BE
        DECLE   $0070                           ; 6F8D  SFX prio
        DECLE   $01D9,  $0308,  $002A,  $0001   ; 6F8E   01D9 0308 002A 0001

        INCR    R6                              ; 6F92   000E
        XORR    R5,     R3                      ; 6F93   01EB
        SDBD                                    ; 6F94   0001
        XOR@    R5,     R2                      ; 6F95   03EA
        CMPR    R5,     R3                      ; 6F96   016B
        ADD@    R1,     R7                      ; 6F97   02CF

L_6F98:
        JSR     R5,     X_PLAY_SFX2             ; 6F98   0004 0118 03BE
        DECLE   $0020                           ; 6F9B  SFX prio

        XOR@    R3,     R1                      ; 6F9C   03D9
        SUB@    R1,     R0                      ; 6F9D   0308
        RLC     R0,     1                       ; 6F9E   0050
        SDBD                                    ; 6F9F   0001
        XOR@    R5,     R2                      ; 6FA0   03EA
        CMPR    R5,     R3                      ; 6FA1   016B
        ADD@    R1,     R7                      ; 6FA2   02CF

L_6FA3:
        PSHR    R5                              ; 6FA3   0275

        JSR     R5,     .EXEC.A83               ; 6FA4   0004 0118 0283

        SUBI    #$000E, R4                      ; 6FA7   033C 000E
        SLR     R0,     2                       ; 6FA9   0064
        SDBD                                    ; 6FAA   0001
        MVII    #$05FF, R1                      ; 6FAB   02B9 00FF 0005
        SUBR    R0,     R1                      ; 6FAE   0101
        MVII    #$0004, R0                      ; 6FAF   02B8 0004
        MVO@    R1,     R4                      ; 6FB1   0261
        MVO@    R1,     R4                      ; 6FB2   0261
        MVO@    R1,     R4                      ; 6FB3   0261
        MVO@    R0,     R4                      ; 6FB4   0260
        SWAP    R1,     1                       ; 6FB5   0041
        MVO@    R1,     R4                      ; 6FB6   0261
        MVO@    R1,     R4                      ; 6FB7   0261
        MVO@    R1,     R4                      ; 6FB8   0261
        MVO@    R0,     R4                      ; 6FB9   0260
        MVII    #$0038, R0                      ; 6FBA   02B8 0038
        MVO@    R0,     R4                      ; 6FBC   0260
        INCR    R4                              ; 6FBD   000C
        CLRR    R0                              ; 6FBE   01C0
        MVO@    R0,     R4                      ; 6FBF   0260
        MVII    #$0030, R0                      ; 6FC0   02B8 0030
        MVO@    R0,     R4                      ; 6FC2   0260
        MVO@    R0,     R4                      ; 6FC3   0260
        MVO@    R0,     R4                      ; 6FC4   0260
        PULR    R7                              ; 6FC5   02B7

L_6FC6:
        JSR     R5,     X_PLAY_SFX2             ; 6FC6   0004 0118 03BE
        DECLE   $007B                           ; 6FC9  SFX prio
        DECLE   $01B9,  $0074,  $03FF           ; 6FCA   01B9 0074 03FF

        XOR@    R5,     R5                      ; 6FCD   03ED
        BMI     L_6FEC                          ; 6FCE   020B 001C

        SWAP    R0,     1                       ; 6FD0   0040
        MOVR    R1,     R7                      ; 6FD1   008F

        NEGR    R3                              ; 6FD2   0023
        ADD@    R1,     R7                      ; 6FD3   02CF

L_6FD4:
        MVII    #$0005, R0                      ; 6FD4   02B8 0005

        JSR     R5,     X_PLAY_SFX2             ; 6FD6   0004 0118 03BE
        DECLE   $0010                           ; 6FD9  SFX prio
        DECLE   $0309,  $03ED,  $038B,  $000C   ; 6FDA   0309 03ED 038B 000C
        DECLE   $0200                           ; 6FDE   0200

        SWAP    R0,     1                       ; 6FDF   0040
        CLRR    R0                              ; 6FE0   01C0
        SLL     R0,     1                       ; 6FE1   0048
        ANDR    R5,     R0                      ; 6FE2   01A8
        SWAP    R0,     2                       ; 6FE3   0044
        XORR    R2,     R0                      ; 6FE4   01D0
        SUBR    R3,     R3                      ; 6FE5   011B
        NEGR    R3                              ; 6FE6   0023
        XOR@    R3,     R4                      ; 6FE7   03DC
        ADD@    R1,     R7                      ; 6FE8   02CF

        SUB     .STIC.X.0,R3                    ; 6FE9   0303 0000
        SUBR    R0,     R1                      ; 6FEB   0101
L_6FEC:
        SUBR    R0,     R1                      ; 6FEC   0101
        DECLE   $0202                           ; 6FED   0202

        BOV     L_6FF0                          ; 6FEE   0202 0000
L_6FF0:
        BOV     L_6FF2                          ; 6FF0   0202 0000

L_6FF2:
        SUBR    R0,     R1                      ; 6FF2   0101
        DECLE   $0303,  $0000,  $0101,  $0303   ; 6FF3   0303 0000 0101 0303
        DECLE   $0000,  $0202,  $0000,  $0202   ; 6FF7   0000 0202 0000 0202

        SUBR    R0,     R1                      ; 6FFB   0101
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
;;  $5576       $5574  
;;  $56BC       $5647  
;;  $5B4B       $5B49  
;;  $5B5A       $5B58  
;;  $5B5C       $5B5A  
;;  $5BE1       $5BDF  
;;  $5C90       $6393  
;;  $5C91       $5DA9  
;;  $5CC7       $5CB9  
;;  $5CDB       $5BF2  
;;  $5CF9       $5CA6  
;;  $5D1B       $5CA3  
;;  $5D2B       $5CB4   $5D63   $5D83  
;;  $5D58       $5D50  
;;  $5D6E       $5D56   $5D6B  
;;  $5D78       $5D75  
;;  $5D9D       $5D79   $5D7D  
;;  $5DE4       $5DD4   $6131  
;;  $5DF4       $5CAE   $5CBF   $5CC5   $5D30   $5D34   $5DA0   $5DAD   $5DD0  
;;  $5DF4       $5DEA   $5E0F  
;;  $5E05       $5E00  
;;  $5E5D       $5E59  
;;  $5ED3       $5EC0  
;;  $5EE7       $5D91   $5EE1  
;;  $5F0C       $5EF7  
;;  $5F25       $5F17  
;;  $5F3F       $5F3C  
;;  $5F43       $5F32  
;;  $5F50       $5F4C  
;;  $5F59       $5F89  
;;  $5F5F       $5F99  
;;  $5F77       $5F29  
;;  $5F8B       $5F41   $5F7D  
;;  $5FCA       $5FC7  
;;  $5FCF       $5FA9  
;;  $5FF6       $5FF2  
;;  $6013       $6010  
;;  $601B       $5FFD  
;;  $602F       $6008  
;;  $603F       $6005  
;;  $6044       $5E6B   $5E6F   $5E78   $5EBC   $5EC9   $5ED7   $5EDF   $5F11  
;;  $6044       $5F72   $5F9F   $5FA3   $5FD5   $5FE5   $601C   $6024   $60B5  
;;  $6044       $60E1   $6119  
;;  $6071       $6063   $6068   $606C  
;;  $6080       $607A  
;;  $608D       $6084  
;;  $60A0       $6091   $609A  
;;  $60AF       $60A4  
;;  $60C3       $60BE  
;;  $60D2       $60C6  
;;  $60DE       $60D8  
;;  $60E3       $60EB  
;;  $60F6       $60D4  
;;  $610D       $6105  
;;  $6112       $610B  
;;  $612C       $6125  
;;  $6133       $6115   $6121   $612A  
;;  $6151       $6144  
;;  $615C       $6153  
;;  $6162       $615E  
;;  $6164       $613E  
;;  $6167       $613A  
;;  $616C       $614E   $6169  
;;  $61DE       $61DB  
;;  $6203       $6176   $6180   $6184   $61AB   $61B1   $61B9   $61F8   $61FD  
;;  $6203       $6208   $6219   $622B   $6231   $623D   $6241   $626A  
;;  $6217       $6214  
;;  $6255       $6252  
;;  $628D       $627E  
;;  $628E       $506F  
;;  $62F8       $62EE   $62F5  
;;  $6309       $6303  
;;  $6319       $630E  
;;  $6320       $6307   $6313  
;;  $6326       $62E7  
;;  $632B       $62DC  
;;  $635E       $6338  
;;  $6386       $637E  
;;  $6390       $6389  
;;  $6397       $6428  
;;  $63BF       $63B4  
;;  $63DA       $63D7  
;;  $641D       $62D8   $62E2   $632F   $6335   $6367   $6373   $6376   $639A  
;;  $641D       $63A8   $63AB   $63AF   $63DC   $63E2   $63E6   $63F0   $643B  
;;  $641D       $64BC   $64DE   $64E3  
;;  $6428       $6423  
;;  $646D       $6433  
;;  $647F       $6470  
;;  $64BF       $64AE   $64B7  
;;  $64CC       $648F   $6498   $64A1  
;;  $64D5       $64CA  
;;  $64DB       $6481  
;;  $64EE       $63F8  
;;  $6509       $6504  
;;  $650A       $6224  
;;  $651A       $64FC   $6511  
;;  $653B       $6537  
;;  $6552       $6881  
;;  $655B       $656C  
;;  $6560       $6567  
;;  $6574       $5EAB   $5F65   $662E   $669F   $66B8  
;;  $6586       $6576   $6580  
;;  $6587       $5CF2   $6380  
;;  $6588       $5E40  
;;  $65A1       $6390  
;;  $65A2       $5D28  
;;  $65DB       $65CF   $65D3  
;;  $65DD       $65D9  
;;  $65E0       $6595   $65B8  
;;  $660B       $6600  
;;  $661A       $6606  
;;  $661B       $6323  
;;  $6628       $6621  
;;  $6638       $5E5D   $60B7   $64EA  
;;  $6696       $6018   $603C  
;;  $66A5       $5D9A   $5FBC  
;;  $66A6       $5E26   $5ED0   $5EE4   $635B  
;;  $66BF       $66AC  
;;  $66D0       $5ECD   $5F81  
;;  $66E5       $66E1  
;;  $66EA       $66E6  
;;  $66F0       $66EC  
;;  $66FD       $5D25   $5E02  
;;  $66FE       $5E2D   $6440  
;;  $6707       $670F  
;;  $674D       $664F  
;;  $675C       $6758  
;;  $676A       $6763   $6767  
;;  $6774       $676F  
;;  $6775       $6772  
;;  $6778       $6058   $605D  
;;  $678B       $677D  
;;  $678C       $5F86   $604B   $6050   $6358  
;;  $6797       $6793  
;;  $67AC       $67A3  
;;  $67C4       $67C1  
;;  $67C5       $67BA  
;;  $67C9       $67A8  
;;  $67CA       $5DE4   $6148  
;;  $6817       $680B  
;;  $681C       $6812  
;;  $682B       $681A  
;;  $682E       $6093   $66FE   $67D4   $694E   $6AA6  
;;  $6831       $6AAE  
;;  $683A       $6158   $68AE  
;;  $683E       $684F  
;;  $684D       $6844  
;;  $685D       $6858  
;;  $6867       $6854   $685E  
;;  $6868       $628F   $6638  
;;  $6887       $616E  
;;  $68A4       $688D   $6897   $689C  
;;  $68B1       $68A2  
;;  $68B2       $62BB   $6817  
;;  $68E0       $68D8  
;;  $68FA       $68F0   $68F6  
;;  $690A       $6915  
;;  $6913       $690E  
;;  $6925       $6920   $6945  
;;  $6947       $68E4  
;;  $6948       $5E47  
;;  $6968       $6965  
;;  $696E       $698A  
;;  $6983       $6984  
;;  $6990       $6991  
;;  $6993       $694C  
;;  $6994       $67FF   $6814  
;;  $699B       $6716   $6979   $6997  
;;  $69B7       $69AA  
;;  $69C2       $64F0   $650C   $6971  
;;  $69C4       $63BC  
;;  $69D7       $69D0  
;;  $69D9       $612C   $673B  
;;  $69DA       $65DD  
;;  $69E4       $69E6  
;;  $69F7       $69F2  
;;  $6A07       $69F0   $69FA  
;;  $6A08       $6046  
;;  $6A11       $6A0C  
;;  $6A1B       $6A0E   $6A13  
;;  $6A1C       $6A18  
;;  $6A33       $6A26   $6A30  
;;  $6A38       $6A34  
;;  $6A4A       $5C91   $618A   $61E0   $638B   $67CB  
;;  $6A4B       $5DAF  
;;  $6A53       $63F2  
;;  $6A61       $6A5D  
;;  $6A6E       $6A64  
;;  $6A6F       $5CD4   $5D01   $6AC1  
;;  $6A75       $6A7F  
;;  $6A82       $6A77  
;;  $6A84       $6473  
;;  $6AB1       $5CCA   $67D1   $6823   $686F   $68BE   $6A88  
;;  $6AC0       $5CB0  
;;  $6AD2       $6AC5   $6ACF  
;;  $6AD3       $643D  
;;  $6ADF       $6AD9  
;;  $6AE0       $6053  
;;  $6B04       $6AF9  
;;  $6B07       $6B01  
;;  $6B0E       $6AE4   $6AF0   $6AFE   $6B05  
;;  $6B0F       $5F09   $6416  
;;  $6B20       $6073   $6076   $6080   $608D   $60A0   $60B1  
;;  $6B25       $6B22  
;;  $6B27       $5E73   $5EC4   $5F2D  
;;  $6B35       $6B32  
;;  $6B36       $5DCB   $5F38   $5F94   $617C   $620E   $6237   $63D1   $66DB  
;;  $6B36       $6B2D  
;;  $6B3F       $6652  
;;  $6B40       $685A  
;;  $6B4C       $6570   $68DB  
;;  $6B50       $60F1   $6557  
;;  $6B57       $5E44   $67CE   $6869   $68B3   $6A8B  
;;  $6B5A       $5FDA   $626F  
;;  $6B5C       $5DD8   $5DF6   $5E2A   $6041   $6516   $654C  
;;  $6B5D       $6B5B  
;;  $6B66       $6B69  
;;  $6B6C       $5CC7   $6820   $686C   $68B6   $6A85  
;;  $6B70       $5E13   $5EB1   $61EB   $621D   $6245   $6281   $6286   $6405  
;;  $6B70       $64F7  
;;  $6B71       $6B6F  
;;  $6B73       $6B71  
;;  $6B77       $5D22  
;;  $6B7B       $5DC2   $5DDD   $5E18   $60A7   $60AC   $65BD   $665A   $6828  
;;  $6B7B       $68BB   $6AB6  
;;  $6B7C       $6B7A  
;;  $6B7D       $5E08  
;;  $6B7E       $6B7C  
;;  $6B7F       $6B75  
;;  $6B81       $6B88  
;;  $6B8B       $5CFE   $5E23   $5EEE   $5F1F   $6640   $68CB  
;;  $6B8D       $5DB8   $602A   $6864   $6B44  
;;  $6B8E       $6B8C  
;;  $6B93       $6BCA  
;;  $6B98       $6E03  
;;  $6B9E       $6E09  
;;  $6BA4       $6E0F  
;;  $6BCD       $6BEE  
;;  $6BE7       $6BE4  
;;  $6BEB       $5CEB   $5E9D   $5F56   $5FB9   $6039   $631D   $634E  
;;  $6C15       $62F9   $633C  
;;  $6C21       $547B  
;;  $6C29       $6C25  
;;  $6C2A       $6C28  
;;  $6C37       $6C31  
;;  $6C3D       $6C44  
;;  $6C47       $6560   $6C3D  
;;  $6C76       $6C72  
;;  $6C77       $6C75  
;;  $6C7A       $6C6C  
;;  $6C7B       $6C79  
;;  $6C7D       $6C70  
;;  $6C84       $6C81  
;;  $6C85       $6C7F  
;;  $6C8A       $6C7B  
;;  $6C9A       $6C94  
;;  $6C9C       $6C5F  
;;  $6CD2       $6CC4   $6CC8   $6CCC  
;;  $6CD3       $6C9A  
;;  $6CEF       $6CED  
;;  $6EC3       $5CF5  
;;  $6ED4       $6655  
;;  $6EE5       $62D0   $682B  
;;  $6F1A       <entry>
;;  $6F2F       $6F1D   $6F27  
;;  $6F31       $6F2D  
;;  $6F32       $5F22  
;;  $6F50       $60F6  
;;  $6F5F       $69F4  
;;  $6F6D       $654F  
;;  $6F7B       $61A4  
;;  $6F8A       $61EE  
;;  $6F98       $6383  
;;  $6FA3       $697C  
;;  $6FC6       $5DA2  
;;  $6FD4       $5FCC  
;;  $6FEC       $6FCE  
;;  $6FF0       $6FEE  
;;  $6FF2       $6FF0  
;; ======================================================================== ;;
