
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
        MVII    #$60ED, R0                      ; 5039   02B8 00ED 0060
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
        MVII    #$5FD0, R4                      ; 5056   02BC 00D0 005F
        MVII    #$0335, R5                      ; 5059   02BD 0335
L_505B:
        MVI@    R4,     R0                      ; 505B   02A0
        XORR    R2,     R0                      ; 505C   01D0
        MVO@    R0,     R5                      ; 505D   0268
        DECR    R1                              ; 505E   0011
        BNEQ    L_505B                          ; 505F   022C 0005

        MVII    #$0179, R4                      ; 5061   02BC 0179
        MVII    #$0007, R2                      ; 5063   02BA 0007
L_5065:
        MVO@    R0,     R4                      ; 5065   0260
        DECR    R2                              ; 5066   0012
        BNEQ    L_5065                          ; 5067   022C 0003

        EIS                                     ; 5069   0002
L_506A:
        MVI     G_0119, R0                      ; 506A   0280 0119
        TSTR    R0                              ; 506C   0080
        BNEQ    L_506A                          ; 506D   022C 0004

        JSR     R5,     L_5602                  ; 506F   0004 0154 0202
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
        MVII    #$5FED, R4                      ; 5091   02BC 00ED 005F
        MVII    #$016B, R3                      ; 5094   02BB 016B
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
        CMPI    #$0171, R3                      ; 50B5   037B 0171
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
        MVII    #$0007, R0                      ; 5163   02B8 0007
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
        MVO     R0,     G_0182                  ; 51B7   0240 0182
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

        MVI     G_0182, R1                      ; 51D4   0281 0182
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

        MVII    #$0171, R1                      ; 520F   02B9 0171
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
        MVII    #$5FD0, R5                      ; 522C   02BD 00D0 005F
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
        CMPI    #$0007, R1                      ; 527A   0379 0007
        BGT     L_52B0                          ; 527C   020E 0032

        MVI@    R4,     R3                      ; 527E   02A3
        ANDI    #$000F, R3                      ; 527F   03BB 000F
        PSHR    R4                              ; 5281   0274
        SDBD                                    ; 5282   0001
        MVI@    R5,     R4                      ; 5283   02AC
        PSHR    R5                              ; 5284   0275
        MVII    #$0179, R1                      ; 5285   02B9 0179
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

        JSR     R5,     L_5491                  ; 52E7   0004 0154 0091
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

        JSR     R5,     L_5545                  ; 533D   0004 0154 0145

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
        MVII    #$63C6, R4                      ; 53AC   02BC 00C6 0063
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
        MVII    #$0007, R0                      ; 53C6   02B8 0007
        MVII    #$02F1, R1                      ; 53C8   02B9 02F1
        SDBD                                    ; 53CA   0001
        MVII    #$5FD8, R4                      ; 53CB   02BC 00D8 005F
        TSTR    R0                              ; 53CE   0080
        BEQ     L_53DF                          ; 53CF   0204 000E

        JSR     R5,     .EXEC.730               ; 53D1   0004 0114 0330

        MVII    #$0007, R0                      ; 53D4   02B8 0007
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
        MVII    #$5FFF, R4                      ; 53E0   02BC 00FF 005F

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

        JSR     R5,     L_5545                  ; 5412   0004 0154 0145

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
        MVO     R2,     G_0180                  ; 5429   0242 0180
        MVI     .ISRVEC.1,R2                    ; 542B   0282 0101
        MVO     R2,     G_0181                  ; 542D   0242 0181
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
        MVO     R0,     .STIC.MODE              ; 5453   0240 0021
        MVI     G_0106, R0                      ; 5455   0280 0106
        MVO     R0,     .STIC.HDLY              ; 5457   0240 0030
        MVI     G_010A, R0                      ; 5459   0280 010A
        MVO     R0,     .STIC.VDLY              ; 545B   0240 0031
        MVII    #$0008, R5                      ; 545D   02BD 0008
        MVII    #$032D, R4                      ; 545F   02BC 032D
        MVI     G_010F, R2                      ; 5461   0282 010F
        RRC     R2,     2                       ; 5463   0076
        BOV     L_5468                          ; 5464   0202 0002

        SUBR    R5,     R4                      ; 5466   012C
        CLRR    R5                              ; 5467   01ED
L_5468:
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
        MVI@    R4,     R0                      ; 5476   02A0
        MVO@    R0,     R5                      ; 5477   0268
        MVI     G_010F, R2                      ; 5478   0282 010F

        JSR     R5,     L_54B8                  ; 547A   0004 0154 00B8
        JSR     R5,     L_6722                  ; 547D   0004 0164 0322
        JSR     R5,     X_PLAY_NOTE             ; 5480   0004 0118 02BD

        DIS                                     ; 5483   0003
        MVI     G_0180, R0                      ; 5484   0280 0180
        MVO     R0,     .ISRVEC.0               ; 5486   0240 0100
        MVI     G_0181, R0                      ; 5488   0280 0181
        MVO     R0,     .ISRVEC.1               ; 548A   0240 0101
        EIS                                     ; 548C   0002
        CLRR    R0                              ; 548D   01C0
        MVO     R0,     G_0103                  ; 548E   0240 0103
        PULR    R7                              ; 5490   02B7

L_5491:
        PSHR    R5                              ; 5491   0275
        MVII    #$0008, R5                      ; 5492   02BD 0008
        MVII    #$0325, R3                      ; 5494   02BB 0325
        MVII    #$0008, R0                      ; 5496   02B8 0008
        MVI     G_010F, R1                      ; 5498   0281 010F
        RRC     R1,     1                       ; 549A   0071
        BNC     L_549E                          ; 549B   0209 0001

        NEGR    R0                              ; 549D   0020
L_549E:
        MVII    #$00FF, R2                      ; 549E   02BA 00FF
        RRC     R1,     1                       ; 54A0   0071
        BNC     L_54A6                          ; 54A1   0209 0003

        ADDR    R5,     R3                      ; 54A3   00EB
        MVII    #$007F, R2                      ; 54A4   02BA 007F
L_54A6:
        MVI@    R3,     R4                      ; 54A6   029C
        TSTR    R4                              ; 54A7   00A4
        BPL     L_54B3                          ; 54A8   0203 0009

        COMR    R2                              ; 54AA   001A
        ANDR    R2,     R4                      ; 54AB   0194
        COMR    R2                              ; 54AC   001A
        MVI@    R3,     R1                      ; 54AD   0299
        ANDR    R2,     R1                      ; 54AE   0191
        ADDR    R0,     R1                      ; 54AF   00C1
        ANDR    R2,     R1                      ; 54B0   0191
        XORR    R4,     R1                      ; 54B1   01E1
        MVO@    R1,     R3                      ; 54B2   0259
L_54B3:
        INCR    R3                              ; 54B3   000B
        DECR    R5                              ; 54B4   0015
        BNEQ    L_54A6                          ; 54B5   022C 0010
        PULR    R7                              ; 54B7   02B7

L_54B8:
        PSHR    R5                              ; 54B8   0275
        PSHR    R2                              ; 54B9   0272
        RRC     R2,     1                       ; 54BA   0072
        BC      L_54CA                          ; 54BB   0201 000D

        RRC     R2,     1                       ; 54BD   0072
        BC      L_54C5                          ; 54BE   0201 0005

        JSR     R5,     L_54D7                  ; 54C0   0004 0154 00D7

        B       L_54D5                          ; 54C3   0200 0010

L_54C5:
        JSR     R5,     L_54EE                  ; 54C5   0004 0154 00EE

        B       L_54D5                          ; 54C8   0200 000B

L_54CA:
        RRC     R2,     1                       ; 54CA   0072
        BC      L_54D2                          ; 54CB   0201 0005

        JSR     R5,     L_5525                  ; 54CD   0004 0154 0125

        B       L_54D5                          ; 54D0   0200 0003

L_54D2:
        JSR     R5,     L_5538                  ; 54D2   0004 0154 0138

L_54D5:
        PULR    R2                              ; 54D5   02B2
        PULR    R7                              ; 54D6   02B7

L_54D7:
        PSHR    R5                              ; 54D7   0275
        MVII    #$0213, R3                      ; 54D8   02BB 0213
        MVII    #$0212, R2                      ; 54DA   02BA 0212
L_54DC:
        MVII    #$0013, R1                      ; 54DC   02B9 0013
L_54DE:
        MVI@    R2,     R0                      ; 54DE   0290
        MVO@    R0,     R3                      ; 54DF   0258
        DECR    R3                              ; 54E0   0013
        DECR    R2                              ; 54E1   0012
        DECR    R1                              ; 54E2   0011
        BNEQ    L_54DE                          ; 54E3   022C 0006

        ADDI    #$0027, R3                      ; 54E5   02FB 0027
        ADDI    #$0027, R2                      ; 54E7   02FA 0027
        CMPI    #$02F0, R2                      ; 54E9   037A 02F0
        BLT     L_54DC                          ; 54EB   0225 0010
        PULR    R7                              ; 54ED   02B7

L_54EE:
        PSHR    R5                              ; 54EE   0275
        MVII    #$02C8, R4                      ; 54EF   02BC 02C8
        MVII    #$02DC, R5                      ; 54F1   02BD 02DC
        MVII    #$0028, R1                      ; 54F3   02B9 0028
        MVII    #$000B, R2                      ; 54F5   02BA 000B
L_54F7:
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
L_5510:
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
        MVI@    R4,     R0                      ; 551D   02A0
        MVO@    R0,     R5                      ; 551E   0268
        SUBR    R1,     R4                      ; 551F   010C
        SUBR    R1,     R5                      ; 5520   010D
        DECR    R2                              ; 5521   0012
        BNEQ    L_54F7                          ; 5522   022C 002C
        PULR    R7                              ; 5524   02B7

L_5525:
        PSHR    R5                              ; 5525   0275
        MVII    #$0200, R5                      ; 5526   02BD 0200
        MVII    #$0201, R4                      ; 5528   02BC 0201
L_552A:
        MVII    #$0013, R1                      ; 552A   02B9 0013
L_552C:
        MVI@    R4,     R0                      ; 552C   02A0
        MVO@    R0,     R5                      ; 552D   0268
        DECR    R1                              ; 552E   0011
        BNEQ    L_552C                          ; 552F   022C 0004

        INCR    R4                              ; 5531   000C
        INCR    R5                              ; 5532   000D
        CMPI    #$02DD, R4                      ; 5533   037C 02DD
        BLE     L_552A                          ; 5535   0226 000C
        PULR    R7                              ; 5537   02B7

L_5538:
        PSHR    R5                              ; 5538   0275
        MVII    #$0200, R5                      ; 5539   02BD 0200
        MVII    #$0214, R4                      ; 553B   02BC 0214
        MVII    #$00DC, R1                      ; 553D   02B9 00DC
L_553F:
        MVI@    R4,     R0                      ; 553F   02A0
        MVO@    R0,     R5                      ; 5540   0268
        DECR    R1                              ; 5541   0011
        BNEQ    L_553F                          ; 5542   022C 0004
        PULR    R7                              ; 5544   02B7

L_5545:
        TSTR    R2                              ; 5545   0092
        BEQ     L_554C                          ; 5546   0204 0004

L_5548:
        SLL     R0,     1                       ; 5548   0048
        DECR    R2                              ; 5549   0012
        BNEQ    L_5548                          ; 554A   022C 0003
L_554C:
        MOVR    R5,     R7                      ; 554C   00AF

L_554D:
        PSHR    R5                              ; 554D   0275

        JSR     R5,     X_PLAY_SFX2             ; 554E   0004 0118 03BE
        DECLE   $0090                           ; 5551  SFX prio
        DECLE   $03ED                           ; 5552  SFX data
        DECLE   $03F0,  $03FF                   ; 5553  SFX data
        DECLE   $0369                           ; 5555  SFX data
        DECLE   $0017,  $0002                   ; 5556  SFX data
        DECLE   $0085                           ; 5558  SFX data
        DECLE   $0017,  $0002                   ; 5559  SFX data
        DECLE   $0077,  $005F,  $0055           ; 555B  SFX data
        DECLE   $03CF                           ; 555E  SFX end

UC_555F:
        SDBD                                    ; 555F  SLIB UCALL target
        MVII    #$5552, R4                      ; 5560   02BC 0052 0055
        PULR    R7                              ; 5563   02B7

L_5564:
        CLRR    R0                              ; 5564   01C0
L_5565:
        PSHR    R5                              ; 5565   0275

        JSR     R5,     X_PLAY_SFX2             ; 5566   0004 0118 03BE
        DECLE   $0090                           ; 5569  SFX prio

        XOR@    R5,     R5                      ; 556A   03ED
        CMP@    R4,     R5                      ; 556B   0365
        ADDI    #$016B, R1                      ; 556C   02F9 016B
        RRC     R3,     2                       ; 556E   0077
        RRC     R1,     2                       ; 556F   0075
        RLC     R1,     2                       ; 5570   0055
        NEGR    R3                              ; 5571   0023
        XOR@    R5,     R4                      ; 5572   03EC
        NEGR    R3                              ; 5573   0023
        XORI    #$0280, R0                      ; 5574   03F8 0280
        CMPR    R2,     R5                      ; 5576   0155
        CMPI    #$0004, R0                      ; 5577   0378 0004
        BLE     L_5580                          ; 5579   0206 0005

        SUBI    #$0004, R0                      ; 557B   0338 0004
        MVO     R0,     G_0155                  ; 557D   0240 0155
        PULR    R7                              ; 557F   02B7

L_5580:
        SDBD                                    ; 5580   0001
        MVII    #$5573, R4                      ; 5581   02BC 0073 0055
        PULR    R7                              ; 5584   02B7

L_5585:
        PSHR    R5                              ; 5585   0275

        JSR     R5,     X_PLAY_SFX2             ; 5586   0004 0118 03BE
        DECLE   $0090                           ; 5589  SFX prio
        DECLE   $02F9,  $0137,  $004D,  $000C   ; 558A   02F9 0137 004D 000C
        DECLE   $0200,  $038B                   ; 558E   0200 038B

        BMI     L_5565                          ; 5590   022B 002C

        SUB     G_008F, R0                      ; 5592   0300 008F
        GSWD    R2                              ; 5594   0032
        ADDR    R1,     R7                      ; 5595   00CF
        B       L_55E3                          ; 5596   0200 004B

L_5598:
        PSHR    R5                              ; 5598   0275

        JSR     R5,     X_PLAY_SFX2             ; 5599   0004 0118 03BE
        DECLE   $00F0                           ; 559C  SFX prio

        ADD@    R1,     R7                      ; 559D   02CF

L_559E:
        PSHR    R5                              ; 559E   0275

        JSR     R5,     X_PLAY_SFX2             ; 559F   0004 0118 03BE
        DECLE   $0090                           ; 55A2  SFX prio
        DECLE   $0059,  $006D,  $0195,  $00B7   ; 55A3   0059 006D 0195 00B7
        DECLE   $000C,  $0100,  $000B,  $0288   ; 55A7   000C 0100 000B 0288
        DECLE   $0010,  $02B8,  $03FF,  $00AB   ; 55AB   0010 02B8 03FF 00AB
        DECLE   $00A5,  $00AB,  $0348,  $0010   ; 55AF   00A5 00AB 0348 0010
        DECLE   $0378,  $03FF,  $00EB,  $00A5   ; 55B3   0378 03FF 00EB 00A5
        DECLE   $00AB,  $03C8,  $0010,  $03F8   ; 55B7   00AB 03C8 0010 03F8
        DECLE   $03FF,  $012B,  $00A5,  $03D5   ; 55BB   03FF 012B 00A5 03D5
        DECLE   $00EB,  $000D,  $03C8,  $0010   ; 55BF   00EB 000D 03C8 0010
        DECLE   $0238,  $03F0,  $00EB,  $0215   ; 55C3   0238 03F0 00EB 0215
        DECLE   $00A5,  $016B,  $03C8,  $0010   ; 55C7   00A5 016B 03C8 0010
        DECLE   $0238,  $03FF                   ; 55CB   0238 03FF

        MOVR    R5,     R3                      ; 55CD   00AB
        MOVR    R4,     R5                      ; 55CE   00A5
        MOVR    R5,     R3                      ; 55CF   00AB
        CMP@    R1,     R0                      ; 55D0   0348
        DECR    R0                              ; 55D1   0010
        CMPI    #$03D0, R0                      ; 55D2   0378 03D0
        MOVR    R5,     R3                      ; 55D4   00AB
        MOVR    R4,     R5                      ; 55D5   00A5
        SUBR    R5,     R3                      ; 55D6   012B
        MVI@    R1,     R0                      ; 55D7   0288
        DECR    R0                              ; 55D8   0010
        MVII    #$03D0, R0                      ; 55D9   02B8 03D0
        MOVR    R5,     R3                      ; 55DB   00AB
        MOVR    R4,     R5                      ; 55DC   00A5
        MOVR    R2,     R5                      ; 55DD   0095
        BMI     L_5510                          ; 55DE   022B 00CF
        B       L_55E3                          ; 55E0   0200 0001

L_55E2:
        PSHR    R5                              ; 55E2   0275

L_55E3:
        JSR     R5,     X_PLAY_SFX2             ; 55E3   0004 0118 03BE
        DECLE   $0090                           ; 55E6  SFX prio
        DECLE   $0179,  $0237,  $0245,  $038B   ; 55E7   0179 0237 0245 038B
        DECLE   $010C,  $0000,  $010D,  $03CF   ; 55EB   010C 0000 010D 03CF
L_55EF:
        PSHR    R5                              ; 55EF   0275

        JSR     R5,     X_PLAY_MUS1             ; 55F0   0004 0118 0327
        DECLE   $0001                           ; 55F3  Note (short)
        DECLE   $00B9                           ; 55F4  Note (short)
        DECLE   $0079                           ; 55F5  Note (short)
        DECLE   $00B9                           ; 55F6  Note (short)
        DECLE   $03F4,  $00E1                   ; 55F7  Note (long)
        DECLE   $03F4,  $00B9                   ; 55F9  Note (long)
        DECLE   $00E9                           ; 55FB  Note (short)
        DECLE   $00B9                           ; 55FC  Note (short)
        DECLE   $00E1                           ; 55FD  Note (short)
        DECLE   $03F6,  $0128                   ; 55FE  Note (long)
        DECLE   $0000                           ; 5600  End of music

        PULR    R7                              ; 5601   02B7

L_5602:
        PSHR    R5                              ; 5602   0275

        JSR     R5,     L_5B34                  ; 5603   0004 0158 0334

        MVII    #$0003, R1                      ; 5606   02B9 0003
        MVII    #$0002, R2                      ; 5608   02BA 0002

        JSR     R5,     L_5B47                  ; 560A   0004 0158 0347
        JSR     R5,     L_6CE4                  ; 560D   0004 016C 00E4
        DECLE   $0004,  $0160,  $01D9           ; 5610   0004 0160 01D9

        JSR     R5,     L_5641                  ; 5613   0004 0154 0241

        SDBD                                    ; 5616   0001
        MVII    #$3201, R3                      ; 5617   02BB 0001 0032
        MVII    #$0206, R4                      ; 561A   02BC 0206

        JSR     R5,     X_PRINT_R5              ; 561C   0004 0118 007B
        STRING  "ICE TREK"                      ; 561F  
        DECLE   $0000                           ; 5627   0000

        MVII    #$02E1, R4                      ; 5628   02BC 02E1
        SDBD                                    ; 562A   0001
        MVII    #$2F3D, R3                      ; 562B   02BB 003D 002F
        MVO@    R3,     R4                      ; 562E   0263
        SDBD                                    ; 562F   0001
        ANDI    #$2605, R3                      ; 5630   03BB 0005 0026

        JSR     R5,     X_PRINT_R5              ; 5633   0004 0118 007B
        STRING  "83 IMAGIC"                     ; 5636  
        DECLE   $0000                           ; 563F   0000

        PULR    R7                              ; 5640   02B7

L_5641:
        PSHR    R5                              ; 5641   0275
        MVII    #$0003, R2                      ; 5642   02BA 0003
        MVO     R2,     G_0195                  ; 5644   0242 0195

        JSR     R5,     L_6DAF                  ; 5646   0004 016C 01AF

        MVI     G_032D, R0                      ; 5649   0280 032D
        SUBI    #$0007, R0                      ; 564B   0338 0007
        MVO     R0,     G_032D                  ; 564D   0240 032D
L_564F:
        PULR    R7                              ; 564F   02B7

        PSHR    R5                              ; 5650   0275
        MVI     G_0183, R3                      ; 5651   0283 0183
        TSTR    R3                              ; 5653   009B
        BNEQ    L_564F                          ; 5654   022C 0006

        CMPI    #$0007, R0                      ; 5656   0378 0007
        BGE     L_564F                          ; 5658   022D 000A

        PSHR    R0                              ; 565A   0270
        MVII    #$003E, R0                      ; 565B   02B8 003E
        MVII    #$0183, R4                      ; 565D   02BC 0183

        JSR     R5,     X_FILL_ZERO             ; 565F   0004 0114 0338
        JSR     R5,     L_56A9                  ; 5662   0004 0154 02A9

        PULR    R0                              ; 5665   02B0
        MVII    #$000A, R3                      ; 5666   02BB 000A
        MVO     R3,     G_01B1                  ; 5668   0243 01B1
        MVII    #$0014, R1                      ; 566A   02B9 0014
        MVII    #$0024, R2                      ; 566C   02BA 0024
        MVII    #$00D2, R5                      ; 566E   02BD 00D2
        MVII    #$0003, R3                      ; 5670   02BB 0003
        MVO     R3,     G_0192                  ; 5672   0243 0192
        MVO     R3,     G_01AE                  ; 5674   0243 01AE
        MVII    #$0007, R3                      ; 5676   02BB 0007
        MVII    #$004B, R4                      ; 5678   02BC 004B
L_567A:
        DECR    R0                              ; 567A   0010
        BLE     L_5688                          ; 567B   0206 000B

        ADDI    #$0008, R1                      ; 567D   02F9 0008
        SUBI    #$0002, R2                      ; 567F   033A 0002
        SUBI    #$0002, R5                      ; 5681   033D 0002
        DECR    R3                              ; 5683   0013
        ADDI    #$000A, R4                      ; 5684   02FC 000A
        B       L_567A                          ; 5686   0220 000D

L_5688:
        MVO     R1,     G_01B2                  ; 5688   0241 01B2
        MVO     R2,     G_01B0                  ; 568A   0242 01B0
        MVO     R2,     G_0187                  ; 568C   0242 0187
        MVO     R5,     G_01BE                  ; 568E   0245 01BE
        MVO     R3,     G_01AD                  ; 5690   0243 01AD

        JSR     R5,     L_569E                  ; 5692   0004 0154 029E

        SAR     R3,     1                       ; 5695   006B
        INCR    R3                              ; 5696   000B
        MVO     R3,     G_0186                  ; 5697   0243 0186
        MVO     R4,     G_01BD                  ; 5699   0244 01BD
        J       L_6BAC                          ; 569B   0004 0368 03AC

L_569E:
        MVI     G_01AD, R0                      ; 569E   0280 01AD
        SWAP    R0,     1                       ; 56A0   0040
        SLL     R0,     1                       ; 56A1   0048
        SDBD                                    ; 56A2   0001
        ADDI    #$1C20, R0                      ; 56A3   02F8 0020 001C
        MVO     R0,     G_02F9                  ; 56A6   0240 02F9
        MOVR    R5,     R7                      ; 56A8   00AF

L_56A9:
        MVII    #$0001, R0                      ; 56A9   02B8 0001
        MVO     R0,     G_018A                  ; 56AB   0240 018A
        INCR    R0                              ; 56AD   0008
        MVO     R0,     G_0188                  ; 56AE   0240 0188
        INCR    R0                              ; 56B0   0008
        MVO     R0,     G_018F                  ; 56B1   0240 018F
        INCR    R0                              ; 56B3   0008
        MVO     R0,     G_018D                  ; 56B4   0240 018D
        INCR    R0                              ; 56B6   0008
        MVO     R0,     G_018B                  ; 56B7   0240 018B
        MOVR    R5,     R7                      ; 56B9   00AF

        PSHR    R5                              ; 56BA   0275
        MVO     R0,     .STIC.VIDEN             ; 56BB   0240 0020

        JSR     R5,     L_5C87                  ; 56BD   0004 015C 0087

        MVI     G_01AC, R4                      ; 56C0   0284 01AC
        INCR    R4                              ; 56C2   000C
        ANDI    #$0007, R4                      ; 56C3   03BC 0007
        MVO     R4,     G_01AC                  ; 56C5   0244 01AC
        SDBD                                    ; 56C7   0001
        ADDI    #$56EE, R4                      ; 56C8   02FC 00EE 0056
        MVI@    R4,     R0                      ; 56CB   02A0
        MVO     R0,     .STIC.BORD              ; 56CC   0240 002C
        MVI     G_01AA, R1                      ; 56CE   0281 01AA
        TSTR    R1                              ; 56D0   0089
        BEQ     L_56E8                          ; 56D1   0204 0015

        SDBD                                    ; 56D3   0001
        ADDI    #$0007, R4                      ; 56D4   02FC 0007 0000
        MVI@    R4,     R3                      ; 56D7   02A3
        SWAP    R3,     1                       ; 56D8   0043
        MVII    #$0200, R2                      ; 56D9   02BA 0200
        MVII    #$0064, R0                      ; 56DB   02B8 0064
L_56DD:
        MVI@    R2,     R1                      ; 56DD   0291
        SDBD                                    ; 56DE   0001
        ANDI    #$C9FF, R1                      ; 56DF   03B9 00FF 00C9
        XORR    R3,     R1                      ; 56E2   01D9
        MVO@    R1,     R2                      ; 56E3   0251
        INCR    R2                              ; 56E4   000A
        DECR    R0                              ; 56E5   0010
        BGT     L_56DD                          ; 56E6   022E 000A

L_56E8:
        MVI     G_01A9, R1                      ; 56E8   0281 01A9
        TSTR    R1                              ; 56EA   0089
        BNEQ    L_56FE                          ; 56EB   020C 0011
        PULR    R7                              ; 56ED   02B7

        INCR    R2                              ; 56EE   000A
        EIS                                     ; 56EF   0002
        INCR    R4                              ; 56F0   000C
        INCR    R7                              ; 56F1   000F

        INCR    R4                              ; 56F2   000C
L_56F3:
        EIS                                     ; 56F3   0002
        DECLE   $000A,  $0006,  $0014,  $0004   ; 56F4   000A 0006 0014 0004
        DECLE   $0030,  $0036                   ; 56F8   0030 0036

        GSWD    R0                              ; 56FA   0030

        JSR     R4,     .EXEC.424               ; 56FB   0004 0014 0024

L_56FE:
        MVII    #$01B3, R3                      ; 56FE   02BB 01B3
        MVII    #$0179, R4                      ; 5700   02BC 0179
L_5702:
        MVI@    R3,     R1                      ; 5702   0299
        SDBD                                    ; 5703   0001
        CMPI    #$006E, R1                      ; 5704   0379 006E 0000
        BLE     L_5713                          ; 5707   0206 000A

        DECR    R1                              ; 5709   0011
        MVO@    R1,     R3                      ; 570A   0259
        MVO@    R1,     R4                      ; 570B   0261
        ADDI    #$0003, R3                      ; 570C   02FB 0003
        CMPI    #$01B9, R3                      ; 570E   037B 01B9
        BLE     L_5702                          ; 5710   0226 000F
        PULR    R7                              ; 5712   02B7

L_5713:
        MVI     G_01BC, R1                      ; 5713   0281 01BC
        PSHR    R1                              ; 5715   0271
        CMPI    #$0054, R1                      ; 5716   0379 0054
        BGT     L_5721                          ; 5718   020E 0007

        JSR     R5,     L_5750                  ; 571A   0004 0154 0350

        MVO     R5,     G_01AA                  ; 571D   0245 01AA
        B       L_5728                          ; 571F   0200 0007

L_5721:
        CMPI    #$0090, R1                      ; 5721   0379 0090
        BGE     L_5736                          ; 5723   020D 0011

        JSR     R5,     L_5741                  ; 5725   0004 0154 0341

L_5728:
        PULR    R1                              ; 5728   02B1
        ADDI    #$0014, R1                      ; 5729   02F9 0014
        MVO     R1,     G_01BC                  ; 572B   0241 01BC

        JSR     R5,     L_6CE4                  ; 572D   0004 016C 00E4
        JSR     R5,     L_5B2E                  ; 5730   0004 0158 032E
        DECLE   $0002                           ; 5733   0002

        B       L_5768                          ; 5734   0200 0032

L_5736:
        PULR    R1                              ; 5736   02B1
        CLRR    R1                              ; 5737   01C9
        MVO     R1,     G_01A9                  ; 5738   0241 01A9

        JSR     R5,     L_5B2E                  ; 573A   0004 0158 032E
        DECLE   $001E                           ; 573D   001E

        J       L_6BAC                          ; 573E   0004 0368 03AC

L_5741:
        PSHR    R5                              ; 5741   0275
        SDBD                                    ; 5742   0001
        MVII    #$2600, R3                      ; 5743   02BB 0000 0026
        MVII    #$000C, R0                      ; 5746   02B8 000C
        MVI     G_01BC, R4                      ; 5748   0284 01BC
        ADDI    #$0200, R4                      ; 574A   02FC 0200

        JSR     R5,     .EXEC.853               ; 574C   0004 0118 0053

        PULR    R7                              ; 574F   02B7

L_5750:
        PSHR    R5                              ; 5750   0275
        MVI     G_01BC, R4                      ; 5751   0284 01BC
        ADDI    #$0200, R4                      ; 5753   02FC 0200
        SDBD                                    ; 5755   0001
        MVII    #$618F, R3                      ; 5756   02BB 008F 0061
        SDBD                                    ; 5759   0001
        MVII    #$6192, R2                      ; 575A   02BA 0092 0061
L_575D:
        PSHR    R3                              ; 575D   0273

        JSR     R5,     L_61E3                  ; 575E   0004 0160 01E3

        PULR    R3                              ; 5761   02B3
        CMPI    #$0260, R4                      ; 5762   037C 0260
        BLT     L_575D                          ; 5764   0225 0008
        PULR    R7                              ; 5766   02B7

L_5767:
        PSHR    R5                              ; 5767   0275
L_5768:
        SDBD                                    ; 5768   0001
        MVII    #$1A07, R1                      ; 5769   02B9 0007 001A
        SDBD                                    ; 576C   0001
        MVII    #$1A0F, R2                      ; 576D   02BA 000F 001A
        SDBD                                    ; 5770   0001
        MVII    #$1A17, R3                      ; 5771   02BB 0017 001A
        MVI     G_01BC, R4                      ; 5774   0284 01BC
        CMPI    #$0090, R4                      ; 5776   037C 0090
        BLT     L_5781                          ; 5778   0205 0007

        SDBD                                    ; 577A   0001
        MVII    #$FFF9, R0                      ; 577B   02B8 00F9 00FF
        ANDR    R0,     R1                      ; 577E   0181
        ANDR    R0,     R2                      ; 577F   0182
        ANDR    R0,     R3                      ; 5780   0183
L_5781:
        ADDI    #$0200, R4                      ; 5781   02FC 0200
        MVO@    R1,     R4                      ; 5783   0261
        MVO@    R2,     R4                      ; 5784   0262
        MVO@    R2,     R4                      ; 5785   0262
        MVO@    R3,     R4                      ; 5786   0263
        NOP                                     ; 5787   0034
        MVO@    R1,     R4                      ; 5788   0261
        MVO@    R2,     R4                      ; 5789   0262
        MVO@    R3,     R4                      ; 578A   0263
        MVO@    R2,     R4                      ; 578B   0262
        NOP                                     ; 578C   0034
        MVO@    R1,     R4                      ; 578D   0261
        MVO@    R3,     R4                      ; 578E   0263
        MVO@    R2,     R4                      ; 578F   0262
        MVO@    R3,     R4                      ; 5790   0263
        PULR    R7                              ; 5791   02B7

        PSHR    R5                              ; 5792   0275
        MVII    #$032F, R1                      ; 5793   02B9 032F
        MVI@    R1,     R4                      ; 5795   028C
        ANDI    #$0007, R4                      ; 5796   03BC 0007
        CMPI    #$0006, R4                      ; 5798   037C 0006
        BLT     L_57A9                          ; 579A   0205 000D

L_579C:
        MVII    #$0002, R2                      ; 579C   02BA 0002
        CLRR    R3                              ; 579E   01DB
        CLRR    R4                              ; 579F   01E4

        JSR     R5,     L_5998                  ; 57A0   0004 0158 0198
        JSR     R5,     L_5969                  ; 57A3   0004 0158 0169
        JSR     R5,     L_5AFA                  ; 57A6   0004 0158 02FA

L_57A9:
        PULR    R7                              ; 57A9   02B7

        PSHR    R5                              ; 57AA   0275
        MVI     G_033F, R1                      ; 57AB   0281 033F
        TSTR    R1                              ; 57AD   0089
        BEQ     L_57D8                          ; 57AE   0204 0028

        MVI     G_01AD, R1                      ; 57B0   0281 01AD
        CMPI    #$0007, R1                      ; 57B2   0379 0007
        BEQ     L_57C3                          ; 57B4   0204 000D

        MVI     G_0327, R2                      ; 57B6   0282 0327
        MVI     G_032C, R1                      ; 57B8   0281 032C
        ANDI    #$00FF, R2                      ; 57BA   03BA 00FF
        ANDI    #$00FF, R1                      ; 57BC   03B9 00FF
        SUBR    R1,     R2                      ; 57BE   010A
        CMPI    #$0008, R2                      ; 57BF   037A 0008
        BGT     L_57D5                          ; 57C1   020E 0012

L_57C3:
        MVI     G_032F, R0                      ; 57C3   0280 032F
        MVI     G_0334, R1                      ; 57C5   0281 0334
        ANDI    #$007F, R0                      ; 57C7   03B8 007F
        ANDI    #$007F, R1                      ; 57C9   03B9 007F
        SUBR    R1,     R0                      ; 57CB   0108
        SDBD                                    ; 57CC   0001
        CMPI    #$FFFA, R0                      ; 57CD   0378 00FA 00FF
        BLE     L_57D9                          ; 57D0   0206 0007

        CLRR    R0                              ; 57D2   01C0
        B       L_5ACF                          ; 57D3   0200 02FA

L_57D5:
        CLRR    R0                              ; 57D5   01C0
        MVO     R0,     G_013A                  ; 57D6   0240 013A
L_57D8:
        PULR    R7                              ; 57D8   02B7

L_57D9:
        JSR     R5,     L_5AFA                  ; 57D9   0004 0158 02FA

        INCR    R7                              ; 57DC   000F

L_57DD:
        PSHR    R5                              ; 57DD   0275
L_57DE:
        MVI     G_01A8, R0                      ; 57DE   0280 01A8
        CMPI    #$0080, R0                      ; 57E0   0378 0080
        BLT     L_57EB                          ; 57E2   0205 0007

        CLRR    R0                              ; 57E4   01C0
        MVO     R0,     G_01A8                  ; 57E5   0240 01A8

        JSR     R5,     L_6C2C                  ; 57E7   0004 016C 002C

        PULR    R7                              ; 57EA   02B7

L_57EB:
        INCR    R0                              ; 57EB   0008
        MVO     R0,     G_01A8                  ; 57EC   0240 01A8
        SDBD                                    ; 57EE   0001
        MVII    #$581C, R3                      ; 57EF   02BB 001C 0058
        ADDR    R0,     R3                      ; 57F2   00C3
        MVI@    R3,     R0                      ; 57F3   0298
        ANDI    #$00C0, R0                      ; 57F4   03B8 00C0
        SLR     R0,     2                       ; 57F6   0064
        SLR     R0,     1                       ; 57F7   0060
        NEGR    R0                              ; 57F8   0020
        MVO     R0,     G_0144                  ; 57F9   0240 0144
        MVI@    R3,     R0                      ; 57FB   0298
        SDBD                                    ; 57FC   0001
        ANDI    #$FF3F, R0                      ; 57FD   03B8 003F 00FF
        ADDI    #$0029, R0                      ; 5800   02F8 0029
        DIS                                     ; 5802   0003
        MVI     G_0333, R2                      ; 5803   0282 0333
        SDBD                                    ; 5805   0001
        ANDI    #$FC80, R2                      ; 5806   03BA 0080 00FC
        XORR    R0,     R2                      ; 5809   01C2
        EIS                                     ; 580A   0002
        MVI     G_0334, R1                      ; 580B   0281 0334
        SDBD                                    ; 580D   0001
        ANDI    #$FCFF, R1                      ; 580E   03B9 00FF 00FC
        ANDI    #$0300, R0                      ; 5811   03B8 0300
        XORR    R0,     R1                      ; 5813   01C1
        MVO     R1,     G_0334                  ; 5814   0241 0334
        DIS                                     ; 5816   0003
        SUB     G_010A, R2                      ; 5817   0302 010A
        MVO     R2,     G_0333                  ; 5819   0242 0333
        EIS                                     ; 581B   0002
        PULR    R7                              ; 581C   02B7

        SUBR    R6,     R0                      ; 581D   0130
        CMPR    R6,     R0                      ; 581E   0170
        ANDR    R6,     R0                      ; 581F   01B0
        MVO@    R0,     R4                      ; 5820   0260
        MVI@    R4,     R0                      ; 5821   02A0
        ADD@    R4,     R0                      ; 5822   02E0
        SUB     G_0340, R0                      ; 5823   0300 0340
        AND     G_03C0, R0                      ; 5825   0380 03C0
        PSHR    R5                              ; 5827   0275
        CLRR    R2                              ; 5828   01D2
        MVII    #$0001, R4                      ; 5829   02BC 0001
        MVII    #$02E9, R3                      ; 582B   02BB 02E9
        MVI     G_01A8, R1                      ; 582D   0281 01A8
L_582F:
        MVI@    R3,     R0                      ; 582F   0298
        TSTR    R0                              ; 5830   0080
        BMI     L_5862                          ; 5831   020B 002F

        DECR    R3                              ; 5833   0013
L_5834:
        MVI@    R3,     R0                      ; 5834   0298
        TSTR    R0                              ; 5835   0080
        BPL     L_5842                          ; 5836   0203 000A

        SLL     R0,     1                       ; 5838   0048
        BPL     L_5841                          ; 5839   0203 0006

        SDBD                                    ; 583B   0001
        MVII    #$0200, R0                      ; 583C   02B8 0000 0002
        MVO@    R0,     R3                      ; 583F   0258
        INCR    R7                              ; 5840   000F

L_5841:
        INCR    R2                              ; 5841   000A
L_5842:
        SUBI    #$0013, R3                      ; 5842   033B 0013
        DECR    R1                              ; 5844   0011
        BPL     L_582F                          ; 5845   0223 0017

        DECR    R4                              ; 5847   0014
        BMI     L_5855                          ; 5848   020B 000B

        INCR    R1                              ; 584A   0009
        MVI     G_010A, R0                      ; 584B   0280 010A
        CMPI    #$0007, R0                      ; 584D   0378 0007
        BEQ     L_582F                          ; 584F   0224 0021

        CMPI    #$0003, R0                      ; 5851   0378 0003
        BGT     L_5834                          ; 5853   022E 0020

L_5855:
        TSTR    R2                              ; 5855   0092
        BEQ     L_5873                          ; 5856   0204 001B

        MVII    #$0008, R0                      ; 5858   02B8 0008
        MVO     R0,     G_0126                  ; 585A   0240 0126
        MVO     R0,     G_0132                  ; 585C   0240 0132

        JSR     R5,     L_559E                  ; 585E   0004 0154 019E

        PULR    R7                              ; 5861   02B7

L_5862:
        PSHR    R1                              ; 5862   0271

        JSR     R5,     L_5874                  ; 5863   0004 0158 0074
        JSR     R5,     L_559E                  ; 5866   0004 0154 019E

        MVI     G_01A8, R0                      ; 5869   0280 01A8
        SUB@    R6,     R0                      ; 586B   0330
        DECR    R0                              ; 586C   0010
        DECR    R0                              ; 586D   0010
        MVO     R0,     G_01A8                  ; 586E   0240 01A8

        JSR     R5,     L_57DD                  ; 5870   0004 0154 03DD

L_5873:
        PULR    R7                              ; 5873   02B7

L_5874:
        INCR    R1                              ; 5874   0009
        CMPI    #$02DC, R3                      ; 5875   037B 02DC
        BGT     L_5886                          ; 5877   020E 000D

        ADDI    #$0014, R3                      ; 5879   02FB 0014
        SDBD                                    ; 587B   0001
        MVII    #$1A21, R0                      ; 587C   02B8 0021 001A
        MVO@    R0,     R3                      ; 587F   0258
        INCR    R3                              ; 5880   000B
        SDBD                                    ; 5881   0001
        MVII    #$1A19, R0                      ; 5882   02B8 0019 001A
        MVO@    R0,     R3                      ; 5885   0258
L_5886:
        SUBI    #$0015, R3                      ; 5886   033B 0015
        SDBD                                    ; 5888   0001
        MVII    #$9B2F, R0                      ; 5889   02B8 002F 009B
        MVO@    R0,     R3                      ; 588C   0258
        INCR    R3                              ; 588D   000B
        SDBD                                    ; 588E   0001
        MVII    #$8B37, R0                      ; 588F   02B8 0037 008B
        MVO@    R0,     R3                      ; 5892   0258
        DECR    R1                              ; 5893   0011
        BGT     L_5886                          ; 5894   022E 000F
        MOVR    R5,     R7                      ; 5896   00AF

L_5897:
        PSHR    R5                              ; 5897   0275
        PSHR    R0                              ; 5898   0270
        PSHR    R2                              ; 5899   0272
        MVI     G_0325, R0                      ; 589A   0280 0325
        MVI@    R2,     R2                      ; 589C   0292
        ANDI    #$00FF, R2                      ; 589D   03BA 00FF
        ANDI    #$00FF, R0                      ; 589F   03B8 00FF
        SUBR    R0,     R2                      ; 58A1   0102
        CMPR    R3,     R2                      ; 58A2   015A
        PULR    R2                              ; 58A3   02B2
        PULR    R0                              ; 58A4   02B0
        BEQ     L_58AA                          ; 58A5   0204 0003

        MVII    #$00FF, R3                      ; 58A7   02BB 00FF
        INCR    R7                              ; 58A9   000F

L_58AA:
        CLRR    R3                              ; 58AA   01DB
L_58AB:
        PULR    R7                              ; 58AB   02B7

L_58AC:
        PSHR    R5                              ; 58AC   0275
L_58AD:
        MVII    #$0003, R3                      ; 58AD   02BB 0003
        MVII    #$0002, R2                      ; 58AF   02BA 0002
        PSHR    R2                              ; 58B1   0272
        SDBD                                    ; 58B2   0001
        MVII    #$6601, R4                      ; 58B3   02BC 0001 0066

        JSR     R5,     L_5D41                  ; 58B6   0004 015C 0141

        MVII    #$003C, R3                      ; 58B9   02BB 003C
        MVO     R3,     G_0350                  ; 58BB   0243 0350
        PULR    R3                              ; 58BD   02B3

        JSR     R5,     L_5B63                  ; 58BE   0004 0158 0363
        JSR     R5,     L_5585                  ; 58C1   0004 0154 0185

        CLRR    R0                              ; 58C4   01C0
        MVO     R0,     G_0197                  ; 58C5   0240 0197
        MVO     R0,     G_019C                  ; 58C7   0240 019C
        MVO     R0,     G_019B                  ; 58C9   0240 019B
        MVO     R0,     G_0195                  ; 58CB   0240 0195
        MVO     R0,     G_0196                  ; 58CD   0240 0196
        MVO     R0,     G_0199                  ; 58CF   0240 0199
        PULR    R7                              ; 58D1   02B7

L_58D2:
        ADD     G_033F, R1                      ; 58D2   02C1 033F
        ADD     G_019A, R1                      ; 58D4   02C1 019A
        ADD     G_0199, R1                      ; 58D6   02C1 0199
        BNEQ    L_58DB                          ; 58D8   020C 0001
        MOVR    R5,     R7                      ; 58DA   00AF
L_58DB:
        PULR    R7                              ; 58DB   02B7

        PSHR    R5                              ; 58DC   0275
        MVII    #$0002, R2                      ; 58DD   02BA 0002
        CLRR    R3                              ; 58DF   01DB
        MVO     R3,     G_01BF                  ; 58E0   0243 01BF
        CLRR    R4                              ; 58E2   01E4

        JSR     R5,     L_5998                  ; 58E3   0004 0158 0198

        MVI@    R2,     R0                      ; 58E6   0290
        TSTR    R0                              ; 58E7   0080
        BMI     L_58EF                          ; 58E8   020B 0005

        DECR    R2                              ; 58EA   0012
        MVI@    R2,     R0                      ; 58EB   0290
        TSTR    R0                              ; 58EC   0080
        BPL     L_58AD                          ; 58ED   0223 0041

L_58EF:
        DECR    R2                              ; 58EF   0012
        MVI@    R2,     R0                      ; 58F0   0290
        INCR    R2                              ; 58F1   000A
        TSTR    R0                              ; 58F2   0080
        BMI     L_5909                          ; 58F3   020B 0014

        INCR    R2                              ; 58F5   000A
        MVI@    R2,     R0                      ; 58F6   0290
        TSTR    R0                              ; 58F7   0080
        BMI     L_5909                          ; 58F8   020B 000F

        DECR    R2                              ; 58FA   0012
        SDBD                                    ; 58FB   0001
        MVII    #$EF21, R0                      ; 58FC   02B8 0021 00EF
        MVO@    R0,     R2                      ; 58FF   0250
        ADDI    #$0014, R2                      ; 5900   02FA 0014
        SDBD                                    ; 5902   0001
        MVII    #$0200, R0                      ; 5903   02B8 0000 0002
        MVO@    R0,     R2                      ; 5906   0250
        B       L_58AD                          ; 5907   0220 005B

L_5909:
        CLRR    R0                              ; 5909   01C0
        MVO     R0,     G_0197                  ; 590A   0240 0197
        MVO     R0,     G_019B                  ; 590C   0240 019B
        MVO     R0,     G_0126                  ; 590E   0240 0126
        MVO     R0,     G_0136                  ; 5910   0240 0136
        MVO     R0,     G_0327                  ; 5912   0240 0327
        MVO     R0,     G_032F                  ; 5914   0240 032F
        MVO     R5,     G_0199                  ; 5916   0245 0199
        SDBD                                    ; 5918   0001
        MVII    #$0200, R0                      ; 5919   02B8 0000 0002
        MVO@    R0,     R2                      ; 591C   0250
        DECR    R2                              ; 591D   0012
        MVO@    R0,     R2                      ; 591E   0250
        ADDI    #$0014, R2                      ; 591F   02FA 0014
        MVO@    R0,     R2                      ; 5921   0250
        INCR    R2                              ; 5922   000A
        MVO@    R0,     R2                      ; 5923   0250
        SUBI    #$0015, R2                      ; 5924   033A 0015
        MOVR    R2,     R1                      ; 5926   0091
        SUBI    #$0200, R1                      ; 5927   0339 0200
        MVII    #$0014, R2                      ; 5929   02BA 0014

        JSR     R5,     X_DIV                   ; 592B   0004 011C 01FB

        INCR    R0                              ; 592E   0008
        SLL     R0,     2                       ; 592F   004C
        SLL     R0,     1                       ; 5930   0048
        INCR    R1                              ; 5931   0009
        SLL     R1,     2                       ; 5932   004D
        SLL     R1,     1                       ; 5933   0049
        PSHR    R0                              ; 5934   0270
        PSHR    R1                              ; 5935   0271
        MVII    #$0002, R2                      ; 5936   02BA 0002
        MVII    #$0327, R3                      ; 5938   02BB 0327
        SDBD                                    ; 593A   0001
        MVII    #$65DD, R4                      ; 593B   02BC 00DD 0065

        JSR     R5,     L_5BA9                  ; 593E   0004 0158 03A9

        PULR    R1                              ; 5941   02B1
        PULR    R0                              ; 5942   02B0
        MVII    #$00FF, R3                      ; 5943   02BB 00FF
        ANDR    R3,     R0                      ; 5945   0198
        ANDR    R3,     R1                      ; 5946   0199
        SWAP    R3,     1                       ; 5947   0043
        MVI     G_0327, R2                      ; 5948   0282 0327
        ANDR    R3,     R2                      ; 594A   019A
        ADDR    R1,     R2                      ; 594B   00CA
        DIS                                     ; 594C   0003
        ADD     G_01BF, R2                      ; 594D   02C2 01BF
        MVO     R2,     G_0327                  ; 594F   0242 0327
        EIS                                     ; 5951   0002
        MVI     G_032F, R2                      ; 5952   0282 032F
        SAR     R3,     1                       ; 5954   006B
        ANDR    R3,     R2                      ; 5955   019A
        ADDR    R0,     R2                      ; 5956   00C2
        MVO     R2,     G_032F                  ; 5957   0242 032F
        PULR    R7                              ; 5959   02B7

L_595A:
        MVI@    R3,     R0                      ; 595A   0298
        SDBD                                    ; 595B   0001
        ANDI    #$BFFF, R0                      ; 595C   03B8 00FF 00BF
        MVO@    R0,     R3                      ; 595F   0258
        ADDI    #$0008, R3                      ; 5960   02FB 0008
        MVI@    R3,     R0                      ; 5962   0298
        SDBD                                    ; 5963   0001
        ANDI    #$BF7F, R0                      ; 5964   03B8 007F 00BF
        MVO@    R0,     R3                      ; 5967   0258
        MOVR    R5,     R7                      ; 5968   00AF

L_5969:
        CMPI    #$02F0, R2                      ; 5969   037A 02F0
        BGE     L_5997                          ; 596B   020D 002A

        SDBD                                    ; 596D   0001
        MVII    #$8A97, R0                      ; 596E   02B8 0097 008A
        MVO@    R0,     R2                      ; 5971   0250
        SDBD                                    ; 5972   0001
        MVII    #$8AB7, R0                      ; 5973   02B8 00B7 008A
        INCR    R2                              ; 5976   000A
        MVO@    R0,     R2                      ; 5977   0250
        ADDI    #$0014, R2                      ; 5978   02FA 0014
        CMPI    #$02F0, R2                      ; 597A   037A 02F0
        BGE     L_5997                          ; 597C   020D 0019

        MVI@    R2,     R0                      ; 597E   0290
        SDBD                                    ; 597F   0001
        CMPI    #$0200, R0                      ; 5980   0378 0000 0002
        BNEQ    L_598A                          ; 5983   020C 0005

        SDBD                                    ; 5985   0001
        MVII    #$1A19, R0                      ; 5986   02B8 0019 001A
        MVO@    R0,     R2                      ; 5989   0250
L_598A:
        DECR    R2                              ; 598A   0012
        MVI@    R2,     R0                      ; 598B   0290
        SDBD                                    ; 598C   0001
        CMPI    #$0200, R0                      ; 598D   0378 0000 0002
        BNEQ    L_5997                          ; 5990   020C 0005

        SDBD                                    ; 5992   0001
        MVII    #$1A21, R0                      ; 5993   02B8 0021 001A
        MVO@    R0,     R2                      ; 5996   0250
L_5997:
        MOVR    R5,     R7                      ; 5997   00AF

L_5998:
        PSHR    R5                              ; 5998   0275
        MVII    #$032D, R1                      ; 5999   02B9 032D
        ADDR    R2,     R1                      ; 599B   00D1
        PSHR    R1                              ; 599C   0271
        CLRR    R0                              ; 599D   01C0

        JSR     R5,     L_5B7D                  ; 599E   0004 0158 037D

        CLRR    R1                              ; 59A1   01C9
        TSTR    R3                              ; 59A2   009B
        PULR    R3                              ; 59A3   02B3
        BNEQ    L_59B1                          ; 59A4   020C 000B

        MVI@    R3,     R0                      ; 59A6   0298
        ANDI    #$0007, R0                      ; 59A7   03B8 0007
        BEQ     L_59B1                          ; 59A9   0204 0006

        CMPI    #$0005, R0                      ; 59AB   0378 0005
        BGE     L_59B1                          ; 59AD   020D 0002

        MVII    #$0014, R1                      ; 59AF   02B9 0014
L_59B1:
        TSTR    R4                              ; 59B1   00A4
        BNEQ    L_59BE                          ; 59B2   020C 000A

        SUBI    #$0008, R3                      ; 59B4   033B 0008
        MVI@    R3,     R0                      ; 59B6   0298
        ANDI    #$0007, R0                      ; 59B7   03B8 0007
        CMPI    #$0005, R0                      ; 59B9   0378 0005
        BGE     L_59BE                          ; 59BB   020D 0001

        INCR    R1                              ; 59BD   0009
L_59BE:
        SUBR    R1,     R2                      ; 59BE   010A
        PULR    R7                              ; 59BF   02B7

L_59C0:
        PSHR    R5                              ; 59C0   0275
        MVII    #$0329, R3                      ; 59C1   02BB 0329
        SDBD                                    ; 59C3   0001
        MVII    #$6601, R4                      ; 59C4   02BC 0001 0066

        JSR     R5,     L_5BAB                  ; 59C7   0004 0158 03AB

        SDBD                                    ; 59CA   0001
        MVII    #$089A, R0                      ; 59CB   02B8 009A 0008
        DIS                                     ; 59CE   0003
        SUB     G_0106, R0                      ; 59CF   0300 0106
        MVO     R0,     G_0329                  ; 59D1   0240 0329
        EIS                                     ; 59D3   0002
        MVII    #$015E, R0                      ; 59D4   02B8 015E
        DIS                                     ; 59D6   0003
        SUB     G_010A, R0                      ; 59D7   0300 010A
        MVO     R0,     G_0331                  ; 59D9   0240 0331
        EIS                                     ; 59DB   0002
        PULR    R5                              ; 59DC   02B5
L_59DD:
        MVI     G_0186, R0                      ; 59DD   0280 0186
        SLL     R0,     2                       ; 59DF   004C
        SLL     R0,     1                       ; 59E0   0048
        SDBD                                    ; 59E1   0001
        ADDI    #$1082, R0                      ; 59E2   02F8 0082 0010
        MVO     R0,     G_0339                  ; 59E5   0240 0339
        MOVR    R5,     R7                      ; 59E7   00AF

        PSHR    R5                              ; 59E8   0275
L_59E9:
        TSTR    R0                              ; 59E9   0080
        BMI     L_5A09                          ; 59EA   020B 001D

        MVII    #$0014, R1                      ; 59EC   02B9 0014

        JSR     R5,     L_5CF8                  ; 59EE   0004 015C 00F8

        MVII    #$0128, R3                      ; 59F1   02BB 0128

        JSR     R5,     L_5C0D                  ; 59F3   0004 015C 000D

        TSTR    R1                              ; 59F6   0089
        BMI     L_59FE                          ; 59F7   020B 0005

        JSR     R5,     L_5D28                  ; 59F9   0004 015C 0128

        B       L_5A01                          ; 59FC   0200 0003

L_59FE:
        JSR     R5,     L_5D23                  ; 59FE   0004 015C 0123

L_5A01:
        MVI     G_0346, R0                      ; 5A01   0280 0346
        ANDI    #$000F, R0                      ; 5A03   03B8 000F
        ADDI    #$0010, R0                      ; 5A05   02F8 0010
        B       L_5A21                          ; 5A07   0200 0018

L_5A09:
        MVII    #$0128, R3                      ; 5A09   02BB 0128
        MVI     G_0326, R1                      ; 5A0B   0281 0326
        ANDI    #$00FF, R1                      ; 5A0D   03B9 00FF
        ADD     G_0106, R1                      ; 5A0F   02C1 0106
        CMPI    #$0010, R1                      ; 5A11   0379 0010
        BLE     L_5A1A                          ; 5A13   0206 0005

        CLRR    R0                              ; 5A15   01C0
        MVII    #$00FB, R1                      ; 5A16   02B9 00FB
        B       L_5A1D                          ; 5A18   0200 0003

L_5A1A:
        MVII    #$0020, R0                      ; 5A1A   02B8 0020
        CLRR    R1                              ; 5A1C   01C9
L_5A1D:
        CLRR    R2                              ; 5A1D   01D2

        JSR     R5,     L_5C0D                  ; 5A1E   0004 015C 000D

L_5A21:
        MVO     R0,     G_0346                  ; 5A21   0240 0346
        PULR    R7                              ; 5A23   02B7

        PSHR    R5                              ; 5A24   0275
L_5A25:
        MVI     G_0199, R1                      ; 5A25   0281 0199
        TSTR    R1                              ; 5A27   0089
        BNEQ    L_5ACF                          ; 5A28   020C 00A5

        TSTR    R0                              ; 5A2A   0080
        BMI     L_5A41                          ; 5A2B   020B 0014

        MVI     G_0195, R1                      ; 5A2D   0281 0195
        TSTR    R1                              ; 5A2F   0089
        BEQ     L_5A3C                          ; 5A30   0204 000A

        MVII    #$0327, R2                      ; 5A32   02BA 0327
        MVII    #$0003, R3                      ; 5A34   02BB 0003
        SDBD                                    ; 5A36   0001
        MVII    #$65B1, R4                      ; 5A37   02BC 00B1 0065
        B       L_5A6B                          ; 5A3A   0200 002F

L_5A3C:
        MVI     G_0196, R1                      ; 5A3C   0281 0196
        TSTR    R1                              ; 5A3E   0089
        BNEQ    L_5A98                          ; 5A3F   020C 0057

L_5A41:
        TSTR    R0                              ; 5A41   0080
        BMI     L_5A53                          ; 5A42   020B 000F

        MVII    #$001C, R1                      ; 5A44   02B9 001C

        JSR     R5,     L_5C29                  ; 5A46   0004 015C 0029

        SLR     R1,     1                       ; 5A49   0061
        MVII    #$0126, R3                      ; 5A4A   02BB 0126

        JSR     R5,     L_5C0D                  ; 5A4C   0004 015C 000D

        MVII    #$00FF, R0                      ; 5A4F   02B8 00FF
        B       L_5A59                          ; 5A51   0200 0006

L_5A53:
        MVII    #$0126, R3                      ; 5A53   02BB 0126

        JSR     R5,     L_5C0B                  ; 5A55   0004 015C 000B

        CLRR    R0                              ; 5A58   01C0
L_5A59:
        MVO     R0,     G_019A                  ; 5A59   0240 019A
        PULR    R7                              ; 5A5B   02B7

L_5A5C:
        MVI     G_0183, R1                      ; 5A5C   0281 0183
        CMPI    #$0002, R1                      ; 5A5E   0379 0002
        BLT     L_59E9                          ; 5A60   0225 0078
        BGT     L_5AEF                          ; 5A62   020E 008B

        MVI     G_033D, R3                      ; 5A64   0283 033D
        TSTR    R3                              ; 5A66   009B
        BNEQ    L_5A25                          ; 5A67   022C 0043
        PULR    R7                              ; 5A69   02B7

        PSHR    R5                              ; 5A6A   0275

L_5A6B:
        JSR     R5,     L_5897                  ; 5A6B   0004 0158 0097

        TSTR    R3                              ; 5A6E   009B
        BNEQ    L_5A96                          ; 5A6F   020C 0025

        CLRR    R1                              ; 5A71   01C9
        MVO     R1,     G_0195                  ; 5A72   0241 0195
        MVII    #$0032, R1                      ; 5A74   02B9 0032
        MVO     R1,     G_019C                  ; 5A76   0241 019C
        PSHR    R2                              ; 5A78   0272
        ADDI    #$0028, R2                      ; 5A79   02FA 0028
        MVO@    R1,     R2                      ; 5A7B   0251
        SDBD                                    ; 5A7C   0001
        ADDI    #$FFF0, R2                      ; 5A7D   02FA 00F0 00FF
        MVO@    R4,     R2                      ; 5A80   0254
        MVII    #$0064, R1                      ; 5A81   02B9 0064

        JSR     R5,     L_5C29                  ; 5A83   0004 015C 0029

        PULR    R3                              ; 5A86   02B3

        JSR     R5,     L_595A                  ; 5A87   0004 0158 015A

        SUBI    #$032D, R3                      ; 5A8A   033B 032D
        SLL     R3,     1                       ; 5A8C   004B
        ADDI    #$0126, R3                      ; 5A8D   02FB 0126
        SAR     R2,     1                       ; 5A8F   006A

        JSR     R5,     L_5C0D                  ; 5A90   0004 015C 000D
        JSR     R5,     L_5564                  ; 5A93   0004 0154 0164

L_5A96:
        PULR    R7                              ; 5A96   02B7

        PSHR    R5                              ; 5A97   0275
L_5A98:
        MVII    #$0005, R3                      ; 5A98   02BB 0005
        MVII    #$0327, R2                      ; 5A9A   02BA 0327

        JSR     R5,     L_5897                  ; 5A9C   0004 0158 0097

        TSTR    R3                              ; 5A9F   009B
        BNEQ    L_5ACC                          ; 5AA0   020C 002A

        MOVR    R2,     R3                      ; 5AA2   0093
        PSHR    R0                              ; 5AA3   0270

        JSR     R5,     L_595A                  ; 5AA4   0004 0158 015A

        PULR    R0                              ; 5AA7   02B0
        MVII    #$001E, R1                      ; 5AA8   02B9 001E
        MVO     R1,     G_034F                  ; 5AAA   0241 034F
        MVO     R1,     G_019B                  ; 5AAC   0241 019B
        PSHR    R0                              ; 5AAE   0270

        JSR     R5,     L_5C29                  ; 5AAF   0004 015C 0029

        SUBI    #$000A, R2                      ; 5AB2   033A 000A
        SLL     R1,     1                       ; 5AB4   0049
        MVII    #$012A, R3                      ; 5AB5   02BB 012A

        JSR     R5,     L_5C0D                  ; 5AB7   0004 015C 000D

        MVO     R3,     G_0197                  ; 5ABA   0243 0197
        MVO     R3,     G_0198                  ; 5ABC   0243 0198
        PULR    R0                              ; 5ABE   02B0
        MVII    #$032F, R3                      ; 5ABF   02BB 032F

        JSR     R5,     L_5C37                  ; 5AC1   0004 015C 0037
        JSR     R5,     L_5C4E                  ; 5AC4   0004 015C 004E

        MVO     R1,     G_0347                  ; 5AC7   0241 0347
        CLRR    R1                              ; 5AC9   01C9
        MVO     R1,     G_0196                  ; 5ACA   0241 0196
L_5ACC:
        PULR    R7                              ; 5ACC   02B7

        CLRR    R0                              ; 5ACD   01C0
        PSHR    R5                              ; 5ACE   0275
L_5ACF:
        TSTR    R0                              ; 5ACF   0080
        BMI     L_5AEA                          ; 5AD0   020B 0018

        SDBD                                    ; 5AD2   0001
        ANDI    #$FFF8, R0                      ; 5AD3   03B8 00F8 00FF
        BEQ     L_579C                          ; 5AD6   0224 033B

        MVI     G_032F, R0                      ; 5AD8   0280 032F
        SDBD                                    ; 5ADA   0001
        ANDI    #$7FFF, R0                      ; 5ADB   03B8 00FF 007F
        MVO     R0,     G_032F                  ; 5ADE   0240 032F
        MVII    #$000A, R0                      ; 5AE0   02B8 000A
        MVO     R0,     G_013A                  ; 5AE2   0240 013A
        MVII    #$0126, R3                      ; 5AE4   02BB 0126

        JSR     R5,     L_5C0B                  ; 5AE6   0004 015C 000B

        PULR    R7                              ; 5AE9   02B7

L_5AEA:
        CLRR    R0                              ; 5AEA   01C0
        MVO     R0,     G_013A                  ; 5AEB   0240 013A
        PULR    R7                              ; 5AED   02B7

        PSHR    R5                              ; 5AEE   0275
L_5AEF:
        TSTR    R0                              ; 5AEF   0080
        BMI     L_5AF9                          ; 5AF0   020B 0007

        MVII    #$0032, R1                      ; 5AF2   02B9 0032

        JSR     R5,     L_5CF8                  ; 5AF4   0004 015C 00F8

        MVO     R1,     G_0126                  ; 5AF7   0241 0126
L_5AF9:
        PULR    R7                              ; 5AF9   02B7

L_5AFA:
        PSHR    R5                              ; 5AFA   0275
        CLRR    R0                              ; 5AFB   01C0
        MVO     R0,     G_0199                  ; 5AFC   0240 0199
        MVO     R0,     G_019B                  ; 5AFE   0240 019B
        MVII    #$0001, R2                      ; 5B00   02BA 0001
        MVII    #$0002, R3                      ; 5B02   02BB 0002
        B       L_5B66                          ; 5B04   0200 0060

        PSHR    R5                              ; 5B06   0275
        MVI     G_019D, R0                      ; 5B07   0280 019D
        TSTR    R0                              ; 5B09   0080
        BEQ     L_5B13                          ; 5B0A   0204 0007

        DECR    R0                              ; 5B0C   0010
        MVO     R0,     G_019D                  ; 5B0D   0240 019D
        BNEQ    L_5B13                          ; 5B0F   020C 0002
        MVI     G_02F8, R7                      ; 5B11   0287 02F8

L_5B13:
        CLRR    R3                              ; 5B13   01DB
        MVII    #$019E, R4                      ; 5B14   02BC 019E
L_5B16:
        MVI@    R4,     R0                      ; 5B16   02A0
        TSTR    R0                              ; 5B17   0080
        BEQ     L_5B28                          ; 5B18   0204 000E

        DECR    R4                              ; 5B1A   0014
        DECR    R0                              ; 5B1B   0010
        MVO@    R0,     R4                      ; 5B1C   0260
        BGT     L_5B28                          ; 5B1D   020E 0009

        PSHR    R3                              ; 5B1F   0273
        PSHR    R4                              ; 5B20   0274
        DECR    R0                              ; 5B21   0010
        DECR    R0                              ; 5B22   0010

        JSR     R5,     L_5DCB                  ; 5B23   0004 015C 01CB

        PULR    R4                              ; 5B26   02B4
        PULR    R3                              ; 5B27   02B3
L_5B28:
        INCR    R3                              ; 5B28   000B
        CMPI    #$0004, R3                      ; 5B29   037B 0004
        BLT     L_5B16                          ; 5B2B   0225 0016
        PULR    R7                              ; 5B2D   02B7

L_5B2E:
        MVI@    R5,     R0                      ; 5B2E   02A8
        MVO     R0,     G_019D                  ; 5B2F   0240 019D
        MVO     R5,     G_02F8                  ; 5B31   0245 02F8
        PULR    R7                              ; 5B33   02B7

L_5B34:
        MVII    #$0005, R1                      ; 5B34   02B9 0005
        CLRR    R2                              ; 5B36   01D2
        INCR    R7                              ; 5B37   000F

L_5B38:
        CLRR    R1                              ; 5B38   01C9
L_5B39:
        INCR    R7                              ; 5B39   000F

L_5B3A:
        DECR    R1                              ; 5B3A   0011
L_5B3B:
        ADDI    #$016B, R2                      ; 5B3B   02FA 016B
        MVII    #$0080, R3                      ; 5B3D   02BB 0080
        B       L_5B4B                          ; 5B3F   0200 000A

L_5B41:
        MVII    #$0005, R1                      ; 5B41   02B9 0005
        CLRR    R2                              ; 5B43   01D2
        INCR    R7                              ; 5B44   000F

L_5B45:
        CLRR    R1                              ; 5B45   01C9
L_5B46:
        INCR    R7                              ; 5B46   000F

L_5B47:
        DECR    R1                              ; 5B47   0011
L_5B48:
        ADDI    #$016B, R2                      ; 5B48   02FA 016B
        CLRR    R3                              ; 5B4A   01DB
L_5B4B:
        MVI@    R2,     R0                      ; 5B4B   0290
        ANDI    #$007F, R0                      ; 5B4C   03B8 007F
        XORR    R3,     R0                      ; 5B4E   01D8
        MVO@    R0,     R2                      ; 5B4F   0250
        INCR    R2                              ; 5B50   000A
        DECR    R1                              ; 5B51   0011
        BPL     L_5B4B                          ; 5B52   0223 0008
        MOVR    R5,     R7                      ; 5B54   00AF

        MVII    #$0001, R3                      ; 5B55   02BB 0001
        MVII    #$0002, R2                      ; 5B57   02BA 0002
        B       L_5B61                          ; 5B59   0200 0006

        MOVR    R2,     R3                      ; 5B5B   0093
        B       L_5B63                          ; 5B5C   0200 0005

L_5B5E:
        CLRR    R3                              ; 5B5E   01DB
        MVII    #$0008, R2                      ; 5B5F   02BA 0008
L_5B61:
        DECR    R2                              ; 5B61   0012
        INCR    R7                              ; 5B62   000F

L_5B63:
        CLRR    R2                              ; 5B63   01D2
L_5B64:
        NOP                                     ; 5B64   0034
        PSHR    R5                              ; 5B65   0275
L_5B66:
        MOVR    R2,     R0                      ; 5B66   0090
        MOVR    R3,     R4                      ; 5B67   009C
        MOVR    R3,     R5                      ; 5B68   009D
        MOVR    R3,     R2                      ; 5B69   009A
        ADDI    #$034D, R2                      ; 5B6A   02FA 034D
        ADDI    #$0355, R3                      ; 5B6C   02FB 0355
        ADDI    #$0325, R4                      ; 5B6E   02FC 0325
        ADDI    #$033D, R5                      ; 5B70   02FD 033D
        CLRR    R1                              ; 5B72   01C9
L_5B73:
        MVO@    R1,     R4                      ; 5B73   0261
        MVO@    R1,     R5                      ; 5B74   0269
        MVO@    R1,     R3                      ; 5B75   0259
        MVO@    R1,     R2                      ; 5B76   0251
        INCR    R3                              ; 5B77   000B
        INCR    R2                              ; 5B78   000A
        DECR    R0                              ; 5B79   0010
        BPL     L_5B73                          ; 5B7A   0223 0008
        PULR    R7                              ; 5B7C   02B7

L_5B7D:
        PSHR    R5                              ; 5B7D   0275
        PSHR    R1                              ; 5B7E   0271
        PSHR    R0                              ; 5B7F   0270
        MVI@    R1,     R1                      ; 5B80   0289
        MVII    #$0007, R0                      ; 5B81   02B8 0007
        ANDR    R1,     R0                      ; 5B83   0188
        BNEQ    L_5B88                          ; 5B84   020C 0002

        SUBI    #$0008, R1                      ; 5B86   0339 0008
L_5B88:
        ANDI    #$007F, R1                      ; 5B88   03B9 007F
        XORR    R0,     R1                      ; 5B8A   01C1
        MOVR    R1,     R2                      ; 5B8B   008A
        SLR     R1,     1                       ; 5B8C   0061
        SLL     R2,     1                       ; 5B8D   004A
        PULR    R0                              ; 5B8E   02B0
        TSTR    R0                              ; 5B8F   0080
        BEQ     L_5B94                          ; 5B90   0204 0002

        ADDI    #$0014, R1                      ; 5B92   02F9 0014
L_5B94:
        ADDR    R1,     R2                      ; 5B94   00CA
        PULR    R1                              ; 5B95   02B1
        SUBI    #$0008, R1                      ; 5B96   0339 0008
        MVI@    R1,     R0                      ; 5B98   0288
        ANDI    #$00FF, R0                      ; 5B99   03B8 00FF
        SLR     R0,     2                       ; 5B9B   0064
        SLR     R0,     1                       ; 5B9C   0060
        ADDR    R0,     R2                      ; 5B9D   00C2
        ADDI    #$0200, R2                      ; 5B9E   02FA 0200
        PULR    R7                              ; 5BA0   02B7

L_5BA1:
        MVII    #$0002, R2                      ; 5BA1   02BA 0002
        MVII    #$0326, R3                      ; 5BA3   02BB 0326
        SDBD                                    ; 5BA5   0001
        MVII    #$64E9, R4                      ; 5BA6   02BC 00E9 0064
L_5BA9:
        DECR    R2                              ; 5BA9   0012
        INCR    R7                              ; 5BAA   000F

L_5BAB:
        CLRR    R2                              ; 5BAB   01D2
L_5BAC:
        PSHR    R5                              ; 5BAC   0275
L_5BAD:
        MVII    #$0002, R1                      ; 5BAD   02B9 0002

        JSR     R5,     L_5BD9                  ; 5BAF   0004 0158 03D9

        SDBD                                    ; 5BB2   0001
        MVI@    R4,     R0                      ; 5BB3   02A0
        MVI@    R3,     R1                      ; 5BB4   0299
        SDBD                                    ; 5BB5   0001
        ANDI    #$0FF8, R1                      ; 5BB6   03B9 00F8 000F
        XORR    R0,     R1                      ; 5BB9   01C1
        MVO@    R1,     R3                      ; 5BBA   0259
        ADDI    #$0008, R3                      ; 5BBB   02FB 0008
        MVII    #$0002, R1                      ; 5BBD   02B9 0002

        JSR     R5,     L_5BD9                  ; 5BBF   0004 0158 03D9

        SUBI    #$034D, R3                      ; 5BC2   033B 034D
        MVII    #$0171, R1                      ; 5BC4   02B9 0171
        ADDR    R3,     R1                      ; 5BC6   00D9
        MVO@    R1,     R1                      ; 5BC7   0249
        PSHR    R3                              ; 5BC8   0273
        SLL     R3,     1                       ; 5BC9   004B
        ADDI    #$0126, R3                      ; 5BCA   02FB 0126
        MVI@    R4,     R0                      ; 5BCC   02A0
        MVO@    R0,     R3                      ; 5BCD   0258
        ADDI    #$0010, R3                      ; 5BCE   02FB 0010
        MVI@    R4,     R0                      ; 5BD0   02A0
        MVO@    R0,     R3                      ; 5BD1   0258
        PULR    R3                              ; 5BD2   02B3
        ADDI    #$0326, R3                      ; 5BD3   02FB 0326
        DECR    R2                              ; 5BD5   0012
        BPL     L_5BAD                          ; 5BD6   0223 002A
        PULR    R7                              ; 5BD8   02B7

L_5BD9:
        SDBD                                    ; 5BD9   0001
        MVI@    R4,     R0                      ; 5BDA   02A0
        MVO@    R0,     R3                      ; 5BDB   0258
        ADDI    #$0008, R3                      ; 5BDC   02FB 0008
        DECR    R1                              ; 5BDE   0011
        BNEQ    L_5BD9                          ; 5BDF   022C 0007
        MOVR    R5,     R7                      ; 5BE1   00AF

L_5BE2:
        PSHR    R5                              ; 5BE2   0275
        PSHR    R4                              ; 5BE3   0274
        PSHR    R1                              ; 5BE4   0271

        JSR     R5,     L_5C12                  ; 5BE5   0004 015C 0012

        MOVR    R3,     R0                      ; 5BE8   0098
        MOVR    R2,     R3                      ; 5BE9   0093
        PULR    R1                              ; 5BEA   02B1
        PSHR    R1                              ; 5BEB   0271

        JSR     R5,     L_5C01                  ; 5BEC   0004 015C 0001

        PULR    R1                              ; 5BEF   02B1
        PSHR    R0                              ; 5BF0   0270
        MOVR    R4,     R0                      ; 5BF1   00A0

        JSR     R5,     L_5C01                  ; 5BF2   0004 015C 0001

        PULR    R1                              ; 5BF5   02B1
        PULR    R2                              ; 5BF6   02B2
        SUBI    #$0325, R2                      ; 5BF7   033A 0325
        SLL     R2,     1                       ; 5BF9   004A
        ADDI    #$0126, R2                      ; 5BFA   02FA 0126
        MVO@    R1,     R2                      ; 5BFC   0251
        ADDI    #$0010, R2                      ; 5BFD   02FA 0010
        MVO@    R0,     R2                      ; 5BFF   0250
        PULR    R7                              ; 5C00   02B7

L_5C01:
        PSHR    R5                              ; 5C01   0275

        JSR     R5,     X_MPY                   ; 5C02   0004 011C 01DC

        MOVR    R2,     R1                      ; 5C05   0091
        MOVR    R3,     R2                      ; 5C06   009A

        JSR     R5,     X_DIVR                  ; 5C07   0004 011C 01F8

        PULR    R7                              ; 5C0A   02B7

L_5C0B:
        CLRR    R1                              ; 5C0B   01C9
        CLRR    R2                              ; 5C0C   01D2
L_5C0D:
        MVO@    R1,     R3                      ; 5C0D   0259
        ADDI    #$0010, R3                      ; 5C0E   02FB 0010
        MVO@    R2,     R3                      ; 5C10   025A
        MOVR    R5,     R7                      ; 5C11   00AF

L_5C12:
        MVI@    R4,     R0                      ; 5C12   02A0
        ANDI    #$00FF, R0                      ; 5C13   03B8 00FF
        ADDI    #$0007, R4                      ; 5C15   02FC 0007
        MVI@    R4,     R1                      ; 5C17   02A1
        ANDI    #$007F, R1                      ; 5C18   03B9 007F
        PSHR    R5                              ; 5C1A   0275

        JSR     R5,     .EXEC.78C               ; 5C1B   0004 0114 038C

        MOVR    R0,     R3                      ; 5C1E   0083
        MOVR    R1,     R4                      ; 5C1F   008C
        MOVR    R2,     R1                      ; 5C20   0091
        SDBD                                    ; 5C21   0001
        ANDI    #$7FFF, R1                      ; 5C22   03B9 00FF 007F

        JSR     R5,     X_SQRT                  ; 5C25   0004 011C 0223

        PULR    R7                              ; 5C28   02B7

L_5C29:
        PSHR    R5                              ; 5C29   0275
        MOVR    R1,     R2                      ; 5C2A   008A
        MOVR    R0,     R1                      ; 5C2B   0081
        MOVR    R2,     R0                      ; 5C2C   0090
        SLR     R0,     1                       ; 5C2D   0060

        JSR     R5,     .EXEC.629               ; 5C2E   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5C31   0004 0114 0357

        MOVR    R1,     R2                      ; 5C34   008A
        MOVR    R0,     R1                      ; 5C35   0081
        PULR    R7                              ; 5C36   02B7

L_5C37:
        PSHR    R5                              ; 5C37   0275
        SDBD                                    ; 5C38   0001
        MVII    #$5C4A, R4                      ; 5C39   02BC 004A 005C
        MOVR    R0,     R1                      ; 5C3C   0081
        SLR     R1,     2                       ; 5C3D   0065
        ADDR    R1,     R4                      ; 5C3E   00CC
        MVI@    R4,     R1                      ; 5C3F   02A1
        SWAP    R1,     1                       ; 5C40   0041
        SDBD                                    ; 5C41   0001
        MVII    #$F3FF, R5                      ; 5C42   02BD 00FF 00F3
        MVI@    R3,     R4                      ; 5C45   029C
        ANDR    R5,     R4                      ; 5C46   01AC
        XORR    R1,     R4                      ; 5C47   01CC
        MVO@    R4,     R3                      ; 5C48   025C
        PULR    R7                              ; 5C49   02B7

        DECLE   $0004,  $0000                   ; 5C4A   0004 0000

        INCR    R0                              ; 5C4C   0008
        INCR    R4                              ; 5C4D   000C
L_5C4E:
        MVII    #$0008, R2                      ; 5C4E   02BA 0008
        MOVR    R0,     R1                      ; 5C50   0081
        CMPI    #$0004, R1                      ; 5C51   0379 0004
        BLE     L_5C60                          ; 5C53   0206 000B

        CMPI    #$0008, R1                      ; 5C55   0379 0008
        BLE     L_5C5E                          ; 5C57   0206 0005

        CMPI    #$000C, R1                      ; 5C59   0379 000C
        BLT     L_5C60                          ; 5C5B   0205 0003

        SUBR    R2,     R1                      ; 5C5D   0111
L_5C5E:
        SUBR    R1,     R2                      ; 5C5E   010A
        MOVR    R2,     R1                      ; 5C5F   0091
L_5C60:
        ANDI    #$0007, R1                      ; 5C60   03B9 0007
        MOVR    R5,     R7                      ; 5C62   00AF

L_5C63:
        SDBD                                    ; 5C63   0001
        MVII    #$5C7E, R1                      ; 5C64   02B9 007E 005C
        B       L_5C8B                          ; 5C67   0200 0022

L_5C69:
        SDBD                                    ; 5C69   0001
        MVII    #$5C78, R1                      ; 5C6A   02B9 0078 005C
        B       L_5C8B                          ; 5C6D   0200 001C

L_5C6F:
        SDBD                                    ; 5C6F   0001
        MVII    #$5C75, R1                      ; 5C70   02B9 0075 005C
        B       L_5C8B                          ; 5C73   0200 0016

        DECLE   $01D2,  $0200                   ; 5C75   01D2 0200

        SETC                                    ; 5C77   0007
        MVII    #$000D, R0                      ; 5C78   02B8 000D
        MVII    #$0003, R2                      ; 5C7A   02BA 0003
        B       L_5C81                          ; 5C7C   0200 0003

        MVII    #$0001, R2                      ; 5C7E   02BA 0001
        CLRR    R0                              ; 5C80   01C0
L_5C81:
        MVO     R2,     .STIC.VIDEN             ; 5C81   0242 0020
        MVO     R0,     .STIC.BORD              ; 5C83   0240 002C
        MVO     R2,     .STIC.EDGE              ; 5C85   0242 0032
L_5C87:
        SDBD                                    ; 5C87   0001
        MVII    #$51C0, R1                      ; 5C88   02B9 00C0 0051
L_5C8B:
        MVII    #$0100, R4                      ; 5C8B   02BC 0100
        DIS                                     ; 5C8D   0003
        MVO@    R1,     R4                      ; 5C8E   0261
        SWAP    R1,     1                       ; 5C8F   0041
        MVO@    R1,     R4                      ; 5C90   0261
        EIS                                     ; 5C91   0002
        MOVR    R5,     R7                      ; 5C92   00AF

        SDBD                                    ; 5C93   0001
        MVII    #$56BA, R1                      ; 5C94   02B9 00BA 0056
        B       L_5C8B                          ; 5C97   0220 000D

L_5C99:
        PSHR    R5                              ; 5C99   0275
        MVII    #$0184, R5                      ; 5C9A   02BD 0184
        SDBD                                    ; 5C9C   0001
        MVI@    R5,     R0                      ; 5C9D   02A8
        ADDR    R1,     R0                      ; 5C9E   00C8
        DECR    R5                              ; 5C9F   0015
        DECR    R5                              ; 5CA0   0015
        MVO@    R0,     R5                      ; 5CA1   0268
        SWAP    R0,     1                       ; 5CA2   0040
        MVO@    R0,     R5                      ; 5CA3   0268
        PULR    R7                              ; 5CA4   02B7

L_5CA5:
        PSHR    R5                              ; 5CA5   0275
        MVI     G_01A7, R0                      ; 5CA6   0280 01A7
        TSTR    R0                              ; 5CA8   0080
        BNEQ    L_5CB2                          ; 5CA9   020C 0007

        MVII    #$0019, R1                      ; 5CAB   02B9 0019

        JSR     R5,     L_5C99                  ; 5CAD   0004 015C 0099

        INCR    R7                              ; 5CB0   000F

L_5CB1:
        PSHR    R5                              ; 5CB1   0275
L_5CB2:
        DIS                                     ; 5CB2   0003
        MVII    #$0100, R4                      ; 5CB3   02BC 0100
        SDBD                                    ; 5CB5   0001
        MVI@    R4,     R0                      ; 5CB6   02A0
        SDBD                                    ; 5CB7   0001
        CMPI    #$51C0, R0                      ; 5CB8   0378 00C0 0051
        EIS                                     ; 5CBB   0002
        BNEQ    L_5CB2                          ; 5CBC   022C 000B

        MVII    #$0184, R5                      ; 5CBE   02BD 0184
        SDBD                                    ; 5CC0   0001
        MVI@    R5,     R0                      ; 5CC1   02A8
        MVII    #$0004, R1                      ; 5CC2   02B9 0004
        SDBD                                    ; 5CC4   0001
        MVII    #$3202, R3                      ; 5CC5   02BB 0002 0032
        MVII    #$0205, R4                      ; 5CC8   02BC 0205

        JSR     R5,     X_PRNUM_RGT             ; 5CCA   0004 0118 00C5

        CLRR    R0                              ; 5CCD   01C0
        MVII    #$0001, R1                      ; 5CCE   02B9 0001
        MVII    #$0209, R4                      ; 5CD0   02BC 0209

        JSR     R5,     X_PRNUM_RGT             ; 5CD2   0004 0118 00C5

        XORI    #$0007, R3                      ; 5CD5   03FB 0007
        MVI     G_0186, R0                      ; 5CD7   0280 0186
        MVII    #$020C, R4                      ; 5CD9   02BC 020C

        JSR     R5,     X_PRNUM_RGT             ; 5CDB   0004 0118 00C5

        PULR    R7                              ; 5CDE   02B7

L_5CDF:
        PSHR    R5                              ; 5CDF   0275
        MVO     R7,     G_01AB                  ; 5CE0   0247 01AB
        MVI     G_0186, R1                      ; 5CE2   0281 0186
        DECR    R1                              ; 5CE4   0011
        BPL     L_5CF5                          ; 5CE5   0203 000E

        PSHR    R1                              ; 5CE7   0271

        JSR     R5,     L_6DC4                  ; 5CE8   0004 016C 01C4

        PULR    R1                              ; 5CEB   02B1
        PULR    R7                              ; 5CEC   02B7

L_5CED:
        PSHR    R5                              ; 5CED   0275
        MVI     G_0186, R1                      ; 5CEE   0281 0186
        INCR    R1                              ; 5CF0   0009
        CMPI    #$0006, R1                      ; 5CF1   0379 0006
        BGT     L_5CF7                          ; 5CF3   020E 0002

L_5CF5:
        MVO     R1,     G_0186                  ; 5CF5   0241 0186
L_5CF7:
        PULR    R7                              ; 5CF7   02B7

L_5CF8:
        PSHR    R5                              ; 5CF8   0275

        JSR     R5,     L_5C29                  ; 5CF9   0004 015C 0029

        MVI     G_0326, R0                      ; 5CFC   0280 0326
        ANDI    #$00FF, R0                      ; 5CFE   03B8 00FF
        ADD     G_0106, R0                      ; 5D00   02C0 0106
        TSTR    R1                              ; 5D02   0089
        BMI     L_5D0B                          ; 5D03   020B 0006

        CMPI    #$0098, R0                      ; 5D05   0378 0098
        BLE     L_5D0F                          ; 5D07   0206 0006
        B       L_5D20                          ; 5D09   0200 0015

L_5D0B:
        CMPI    #$0010, R0                      ; 5D0B   0378 0010
        BLT     L_5D20                          ; 5D0D   0205 0011

L_5D0F:
        MVI     G_032E, R0                      ; 5D0F   0280 032E
        ANDI    #$007F, R0                      ; 5D11   03B8 007F
        TSTR    R2                              ; 5D13   0092
        BMI     L_5D1C                          ; 5D14   020B 0006

        CMPI    #$005A, R0                      ; 5D16   0378 005A
        BLE     L_5D22                          ; 5D18   0206 0008
        B       L_5D20                          ; 5D1A   0200 0004

L_5D1C:
        CMPI    #$001E, R0                      ; 5D1C   0378 001E
        BGT     L_5D22                          ; 5D1E   020E 0002

L_5D20:
        CLRR    R1                              ; 5D20   01C9
        CLRR    R2                              ; 5D21   01D2
L_5D22:
        PULR    R7                              ; 5D22   02B7

L_5D23:
        SDBD                                    ; 5D23   0001
        MVII    #$0400, R0                      ; 5D24   02B8 0000 0004
        INCR    R7                              ; 5D27   000F

L_5D28:
        CLRR    R0                              ; 5D28   01C0
L_5D29:
        PSHR    R5                              ; 5D29   0275
        MVII    #$032E, R2                      ; 5D2A   02BA 032E
L_5D2C:
        MVI@    R2,     R1                      ; 5D2C   0291
        SDBD                                    ; 5D2D   0001
        ANDI    #$FBFF, R1                      ; 5D2E   03B9 00FF 00FB
        XORR    R0,     R1                      ; 5D31   01C1
        MVO@    R1,     R2                      ; 5D32   0251
        INCR    R2                              ; 5D33   000A
        CMPI    #$032F, R2                      ; 5D34   037A 032F
        BLE     L_5D2C                          ; 5D36   0226 000B

        TSTR    R0                              ; 5D38   0080
        BEQ     L_5D3D                          ; 5D39   0204 0002

        CLRR    R0                              ; 5D3B   01C0
        INCR    R7                              ; 5D3C   000F

L_5D3D:
        INCR    R0                              ; 5D3D   0008
L_5D3E:
        MVO     R0,     G_012A                  ; 5D3E   0240 012A
        PULR    R7                              ; 5D40   02B7

L_5D41:
        PSHR    R5                              ; 5D41   0275
        ADDI    #$032D, R2                      ; 5D42   02FA 032D
        MVI@    R2,     R0                      ; 5D44   0290
        ANDI    #$007F, R0                      ; 5D45   03B8 007F
        PSHR    R0                              ; 5D47   0270
        SUBI    #$0008, R2                      ; 5D48   033A 0008
        MVI@    R2,     R0                      ; 5D4A   0290
        ANDI    #$00FF, R0                      ; 5D4B   03B8 00FF
        PSHR    R0                              ; 5D4D   0270
        ADDI    #$0325, R3                      ; 5D4E   02FB 0325
        PSHR    R3                              ; 5D50   0273

        JSR     R5,     L_5BAB                  ; 5D51   0004 0158 03AB

        PULR    R3                              ; 5D54   02B3
        MVI@    R3,     R0                      ; 5D55   0298
        SDBD                                    ; 5D56   0001
        ANDI    #$BF00, R0                      ; 5D57   03B8 0000 00BF
        ADD@    R6,     R0                      ; 5D5A   02F0
        MVO@    R0,     R3                      ; 5D5B   0258
        ADDI    #$0008, R3                      ; 5D5C   02FB 0008
        MVI@    R3,     R0                      ; 5D5E   0298
        SDBD                                    ; 5D5F   0001
        ANDI    #$BF80, R0                      ; 5D60   03B8 0080 00BF
        ADD@    R6,     R0                      ; 5D63   02F0
        MVO@    R0,     R3                      ; 5D64   0258
        PULR    R7                              ; 5D65   02B7

L_5D66:
        TSTR    R0                              ; 5D66   0080
        BMI     L_5D7E                          ; 5D67   020B 0015

        MVI     G_019C, R1                      ; 5D69   0281 019C

        JSR     R5,     L_58D2                  ; 5D6B   0004 0158 00D2

        MVII    #$0327, R3                      ; 5D6E   02BB 0327
        SDBD                                    ; 5D70   0001
        MVII    #$6587, R4                      ; 5D71   02BC 0087 0065

        JSR     R5,     L_5BAB                  ; 5D74   0004 0158 03AB

        MVII    #$0003, R1                      ; 5D77   02B9 0003
        MVO     R1,     G_012A                  ; 5D79   0241 012A
        MVO     R1,     G_0195                  ; 5D7B   0241 0195
        PULR    R7                              ; 5D7D   02B7

L_5D7E:
        MVI     G_019C, R1                      ; 5D7E   0281 019C
        TSTR    R1                              ; 5D80   0089
        BNEQ    L_5D8E                          ; 5D81   020C 000B

        ADD     G_0195, R1                      ; 5D83   02C1 0195
        BEQ     L_5D8E                          ; 5D85   0204 0007

        CLRR    R0                              ; 5D87   01C0
        MVO     R0,     G_0327                  ; 5D88   0240 0327
        MVO     R0,     G_033F                  ; 5D8A   0240 033F
        MVO     R0,     G_0195                  ; 5D8C   0240 0195
L_5D8E:
        PULR    R7                              ; 5D8E   02B7

L_5D8F:
        TSTR    R0                              ; 5D8F   0080
        BMI     L_5DA5                          ; 5D90   020B 0013

        MVI     G_019B, R1                      ; 5D92   0281 019B

        JSR     R5,     L_58D2                  ; 5D94   0004 0158 00D2

        MVII    #$0327, R3                      ; 5D97   02BB 0327
        SDBD                                    ; 5D99   0001
        MVII    #$65F5, R4                      ; 5D9A   02BC 00F5 0065

        JSR     R5,     L_5BAB                  ; 5D9D   0004 0158 03AB

        MVII    #$000F, R1                      ; 5DA0   02B9 000F
        MVO     R1,     G_0196                  ; 5DA2   0241 0196
        PULR    R7                              ; 5DA4   02B7

L_5DA5:
        CLRR    R0                              ; 5DA5   01C0
        MVI     G_019B, R1                      ; 5DA6   0281 019B
        TSTR    R1                              ; 5DA8   0089
        BNEQ    L_5DBB                          ; 5DA9   020C 0010

        MVI     G_0196, R1                      ; 5DAB   0281 0196
        TSTR    R1                              ; 5DAD   0089
        BEQ     L_5DBD                          ; 5DAE   0204 000D

        MVI     G_0199, R1                      ; 5DB0   0281 0199
        TSTR    R1                              ; 5DB2   0089
        BNEQ    L_5DBD                          ; 5DB3   020C 0008

        MVO     R0,     G_0327                  ; 5DB5   0240 0327
        MVO     R0,     G_033F                  ; 5DB7   0240 033F
        MVO     R0,     G_0196                  ; 5DB9   0240 0196
L_5DBB:
        MVO     R0,     G_0198                  ; 5DBB   0240 0198
L_5DBD:
        PULR    R7                              ; 5DBD   02B7

        CLRR    R3                              ; 5DBE   01DB
        B       L_5DCB                          ; 5DBF   0200 000A

        MVII    #$0001, R3                      ; 5DC1   02BB 0001
        B       L_5DCB                          ; 5DC3   0200 0006

        MVII    #$0002, R3                      ; 5DC5   02BB 0002
        B       L_5DCB                          ; 5DC7   0200 0002

        MVII    #$0003, R3                      ; 5DC9   02BB 0003
L_5DCB:
        PSHR    R5                              ; 5DCB   0275
        MOVR    R3,     R4                      ; 5DCC   009C
        ADDI    #$019E, R4                      ; 5DCD   02FC 019E
        TSTR    R0                              ; 5DCF   0080
        BMI     L_5DD6                          ; 5DD0   020B 0004

        CLRR    R1                              ; 5DD2   01C9
        MVO@    R1,     R4                      ; 5DD3   0261
        B       L_5DE0                          ; 5DD4   0200 000A

L_5DD6:
        SDBD                                    ; 5DD6   0001
        CMPI    #$FFFE, R0                      ; 5DD7   0378 00FE 00FF
        BLE     L_5DE0                          ; 5DDA   0206 0004

        MVII    #$0003, R1                      ; 5DDC   02B9 0003
        MVO@    R1,     R4                      ; 5DDE   0261
        PULR    R7                              ; 5DDF   02B7

L_5DE0:
        MVI     G_0183, R2                      ; 5DE0   0282 0183
        TSTR    R2                              ; 5DE2   0092
        BEQ     L_5DF5                          ; 5DE3   0204 0010

        CMPI    #$0003, R3                      ; 5DE5   037B 0003
        BGE     L_5A5C                          ; 5DE7   022D 038C

        CMPI    #$0002, R2                      ; 5DE9   037A 0002
        BGT     L_5DF6                          ; 5DEB   020E 0009
        BLT     L_5E32                          ; 5DED   0205 0043

        CMPI    #$0001, R3                      ; 5DEF   037B 0001
        BGE     L_5D8F                          ; 5DF1   022D 0063
        B       L_5D66                          ; 5DF3   0220 008E
L_5DF5:
        PULR    R7                              ; 5DF5   02B7

L_5DF6:
        TSTR    R0                              ; 5DF6   0080
        BLE     L_5E31                          ; 5DF7   0206 0038

        MVII    #$0340, R3                      ; 5DF9   02BB 0340
        MVI@    R3,     R1                      ; 5DFB   0299
        TSTR    R1                              ; 5DFC   0089
        BNEQ    L_5E10                          ; 5DFD   020C 0011

        PSHR    R3                              ; 5DFF   0273
        MVII    #$0003, R3                      ; 5E00   02BB 0003
        MVII    #$0001, R2                      ; 5E02   02BA 0001
        SDBD                                    ; 5E04   0001
        MVII    #$6593, R4                      ; 5E05   02BC 0093 0065

        JSR     R5,     L_5D41                  ; 5E08   0004 015C 0141

        PULR    R3                              ; 5E0B   02B3
        MVII    #$013C, R2                      ; 5E0C   02BA 013C
        B       L_5E1A                          ; 5E0E   0200 000A

L_5E10:
        DECR    R3                              ; 5E10   0013
        MVII    #$013A, R2                      ; 5E11   02BA 013A
        MVI@    R3,     R1                      ; 5E13   0299
        SDBD                                    ; 5E14   0001
        CMPI    #$65AB, R1                      ; 5E15   0379 00AB 0065
        BNEQ    L_5E31                          ; 5E18   020C 0017

L_5E1A:
        SDBD                                    ; 5E1A   0001
        MVII    #$65BB, R4                      ; 5E1B   02BC 00BB 0065
        MVO@    R4,     R3                      ; 5E1E   025C
        ADDI    #$0010, R3                      ; 5E1F   02FB 0010
        MVII    #$0038, R1                      ; 5E21   02B9 0038
        MVO@    R1,     R3                      ; 5E23   0259
        SUBI    #$0028, R3                      ; 5E24   033B 0028

        JSR     R5,     L_595A                  ; 5E26   0004 0158 015A

        SDBD                                    ; 5E29   0001
        MVII    #$FFC4, R1                      ; 5E2A   02B9 00C4 00FF
        MVO@    R1,     R2                      ; 5E2D   0251

        JSR     R5,     L_5564                  ; 5E2E   0004 0154 0164

L_5E31:
        PULR    R7                              ; 5E31   02B7

L_5E32:
        TSTR    R0                              ; 5E32   0080
        BMI     L_5E3C                          ; 5E33   020B 0007

        CLRR    R1                              ; 5E35   01C9
        MVO     R1,     G_019E                  ; 5E36   0241 019E
        MVII    #$0001, R0                      ; 5E38   02B8 0001
        B       L_5E48                          ; 5E3A   0200 000C

L_5E3C:
        SDBD                                    ; 5E3C   0001
        CMPI    #$FFFE, R0                      ; 5E3D   0378 00FE 00FF
        BLE     L_5E47                          ; 5E40   0206 0005

        MVII    #$0002, R0                      ; 5E42   02B8 0002
        MVO     R0,     G_019E                  ; 5E44   0240 019E
        PULR    R7                              ; 5E46   02B7

L_5E47:
        CLRR    R0                              ; 5E47   01C0
L_5E48:
        MVO     R0,     G_0347                  ; 5E48   0240 0347
        PULR    R7                              ; 5E4A   02B7

        PSHR    R5                              ; 5E4B   0275
        MVI     G_0183, R1                      ; 5E4C   0281 0183
        TSTR    R1                              ; 5E4E   0089
        BEQ     L_5F70                          ; 5E4F   0204 011F

        CMPI    #$0002, R1                      ; 5E51   0379 0002
        BGT     L_5FB5                          ; 5E53   020E 0160
        BNEQ    L_5E64                          ; 5E55   020C 000D

        PSHR    R1                              ; 5E57   0271

        JSR     R5,     L_5E9F                  ; 5E58   0004 015C 029F
        JSR     R5,     L_5F8E                  ; 5E5B   0004 015C 038E
        JSR     R5,     L_5E7D                  ; 5E5E   0004 015C 027D

        PULR    R1                              ; 5E61   02B1
        B       L_5F70                          ; 5E62   0200 010C

L_5E64:
        MVI     G_032E, R1                      ; 5E64   0281 032E
        MOVR    R1,     R0                      ; 5E66   0088
        SDBD                                    ; 5E67   0001
        ANDI    #$FF80, R1                      ; 5E68   03B9 0080 00FF
        ANDI    #$007F, R0                      ; 5E6B   03B8 007F
        MOVR    R0,     R2                      ; 5E6D   0082

        JSR     R5,     X_CLAMP                 ; 5E6E   0004 0114 0270

        COMR    R6                              ; 5E71   001E
        SLLC    R2,     1                       ; 5E72   005A
        XORR    R0,     R2                      ; 5E73   01C2
        BEQ     L_5E7C                          ; 5E74   0204 0006

        CLRR    R2                              ; 5E76   01D2
        MVO     R2,     G_0138                  ; 5E77   0242 0138
        ADDR    R0,     R1                      ; 5E79   00C1
        MVO     R1,     G_032E                  ; 5E7A   0241 032E
L_5E7C:
        PULR    R7                              ; 5E7C   02B7

L_5E7D:
        PSHR    R5                              ; 5E7D   0275
        MVI     G_0197, R0                      ; 5E7E   0280 0197
        TSTR    R0                              ; 5E80   0080
        BEQ     L_5E9E                          ; 5E81   0204 001B

        MVII    #$0003, R1                      ; 5E83   02B9 0003
        MVII    #$0004, R2                      ; 5E85   02BA 0004
        MVI     G_0198, R0                      ; 5E87   0280 0198
        TSTR    R0                              ; 5E89   0080
        BNEQ    L_5E92                          ; 5E8A   020C 0006

        MVII    #$0005, R1                      ; 5E8C   02B9 0005
        MVI     G_034F, R2                      ; 5E8E   0282 034F
        SLR     R2,     1                       ; 5E90   0062
        NEGR    R2                              ; 5E91   0022
L_5E92:
        ADD     G_034F, R2                      ; 5E92   02C2 034F
        BGT     L_5E98                          ; 5E94   020E 0002

        MVII    #$0001, R2                      ; 5E96   02BA 0001
L_5E98:
        MVO     R2,     G_034F                  ; 5E98   0242 034F
        ADD     G_013A, R1                      ; 5E9A   02C1 013A
        MVO     R1,     G_013A                  ; 5E9C   0241 013A
L_5E9E:
        PULR    R7                              ; 5E9E   02B7

L_5E9F:
        PSHR    R5                              ; 5E9F   0275
        MVI     G_033D, R0                      ; 5EA0   0280 033D
        TSTR    R0                              ; 5EA2   0080
        BEQ     L_5F4F                          ; 5EA3   0204 00AA

        MVII    #$00FF, R3                      ; 5EA5   02BB 00FF
        MVI     G_0126, R0                      ; 5EA7   0280 0126
        TSTR    R0                              ; 5EA9   0080
        BEQ     L_5EC7                          ; 5EAA   0204 001B

        MVI     G_0325, R0                      ; 5EAC   0280 0325
        ANDR    R3,     R0                      ; 5EAE   0198
        MVI     G_032C, R1                      ; 5EAF   0281 032C
        ANDR    R3,     R1                      ; 5EB1   0199
        SUBR    R0,     R1                      ; 5EB2   0101
        BLE     L_5EBB                          ; 5EB3   0206 0006

        SUBI    #$0008, R0                      ; 5EB5   0338 0008
        MVO     R0,     G_0325                  ; 5EB7   0240 0325
        B       L_5EEC                          ; 5EB9   0200 0031

L_5EBB:
        SDBD                                    ; 5EBB   0001
        CMPI    #$FFF9, R1                      ; 5EBC   0379 00F9 00FF
        BGE     L_5EC7                          ; 5EBF   020D 0006

        ADDI    #$0008, R0                      ; 5EC1   02F8 0008
        MVO     R0,     G_0325                  ; 5EC3   0240 0325
        B       L_5EEC                          ; 5EC5   0200 0025

L_5EC7:
        SLR     R3,     1                       ; 5EC7   0063
        MVI     G_032D, R0                      ; 5EC8   0280 032D
        MVI     G_0334, R1                      ; 5ECA   0281 0334
        ANDR    R3,     R0                      ; 5ECC   0198
        ANDR    R3,     R1                      ; 5ECD   0199
        SUBR    R0,     R1                      ; 5ECE   0101
        CMPI    #$0007, R1                      ; 5ECF   0379 0007
        BLE     L_5EDB                          ; 5ED1   0206 0008

        CMPI    #$0014, R1                      ; 5ED3   0379 0014
        BLT     L_5EEC                          ; 5ED5   0205 0015

        MVO     R1,     G_01A4                  ; 5ED7   0241 01A4
        B       L_5EEC                          ; 5ED9   0200 0011

L_5EDB:
        SUB     G_010A, R0                      ; 5EDB   0300 010A
        SUBI    #$005F, R0                      ; 5EDD   0338 005F
        BLE     L_5F4F                          ; 5EDF   0206 006E

        NEGR    R0                              ; 5EE1   0020
        DECR    R0                              ; 5EE2   0010
        ADD     G_032D, R0                      ; 5EE3   02C0 032D
        MVO     R0,     G_032D                  ; 5EE5   0240 032D
        CLRR    R0                              ; 5EE7   01C0
        MVO     R0,     G_0136                  ; 5EE8   0240 0136
        B       L_5F4F                          ; 5EEA   0200 0063

L_5EEC:
        MVI     G_0325, R0                      ; 5EEC   0280 0325
        MVO     R0,     G_0327                  ; 5EEE   0240 0327
        MVI     G_032D, R0                      ; 5EF0   0280 032D
        MVO     R0,     G_032F                  ; 5EF2   0240 032F

        JSR     R5,     L_58AC                  ; 5EF4   0004 0158 00AC

L_5EF7:
        MVII    #$0002, R2                      ; 5EF7   02BA 0002
        CLRR    R3                              ; 5EF9   01DB
        MVO     R3,     G_0183                  ; 5EFA   0243 0183

        JSR     R5,     L_5B61                  ; 5EFC   0004 0158 0361
        JSR     R5,     L_5B2E                  ; 5EFF   0004 0158 032E
        DECLE   $001E                           ; 5F02   001E

        MVII    #$0002, R2                      ; 5F03   02BA 0002
        MVO     R2,     G_0183                  ; 5F05   0242 0183

        JSR     R5,     L_6DAF                  ; 5F07   0004 016C 01AF

        MVI     G_0325, R0                      ; 5F0A   0280 0325
        MVI     G_032C, R1                      ; 5F0C   0281 032C
        ANDI    #$00FF, R1                      ; 5F0E   03B9 00FF
        SUBI    #$0067, R1                      ; 5F10   0339 0067
        ADDR    R1,     R0                      ; 5F12   00C8
        MVO     R0,     G_0325                  ; 5F13   0240 0325
        MVI     G_01A4, R0                      ; 5F15   0280 01A4
        TSTR    R0                              ; 5F17   0080
        BEQ     L_5F38                          ; 5F18   0204 001E

        JSR     R5,     L_5CDF                  ; 5F1A   0004 015C 00DF
        JSR     R5,     L_59DD                  ; 5F1D   0004 0158 01DD

        MVI     G_02F9, R0                      ; 5F20   0280 02F9
        MVO     R0,     G_034E                  ; 5F22   0240 034E
        CLRR    R0                              ; 5F24   01C0
        MVO     R0,     G_01A5                  ; 5F25   0240 01A5
        TSTR    R1                              ; 5F27   0089
        BPL     L_5F4A                          ; 5F28   0203 0020

        MVI     G_01A8, R0                      ; 5F2A   0280 01A8
        MOVR    R0,     R1                      ; 5F2C   0081
        SLL     R0,     1                       ; 5F2D   0048
        SLL     R1,     2                       ; 5F2E   004D
        SLL     R1,     1                       ; 5F2F   0049
        ADDR    R0,     R1                      ; 5F30   00C1

        JSR     R5,     L_5C99                  ; 5F31   0004 015C 0099
        JSR     R5,     L_5CB1                  ; 5F34   0004 015C 00B1

        PULR    R7                              ; 5F37   02B7

L_5F38:
        MVI     G_01BD, R1                      ; 5F38   0281 01BD
        SLL     R1,     2                       ; 5F3A   004D
        MVO     R1,     G_034D                  ; 5F3B   0241 034D
L_5F3D:
        INCR    R0                              ; 5F3D   0008
        MVI     G_0335, R1                      ; 5F3E   0281 0335
        SDBD                                    ; 5F40   0001
        ANDI    #$EFF8, R1                      ; 5F41   03B9 00F8 00EF
        SDBD                                    ; 5F44   0001
        XORI    #$1005, R1                      ; 5F45   03F9 0005 0010
        MVO     R1,     G_0335                  ; 5F48   0241 0335
L_5F4A:
        MVO     R0,     G_01A4                  ; 5F4A   0240 01A4
        CLRR    R0                              ; 5F4C   01C0
        MVO     R0,     G_019A                  ; 5F4D   0240 019A
L_5F4F:
        PULR    R7                              ; 5F4F   02B7

        PSHR    R5                              ; 5F50   0275
        MVI     G_01A5, R0                      ; 5F51   0280 01A5
        TSTR    R0                              ; 5F53   0080
        BNEQ    L_5EF7                          ; 5F54   022C 005E

        MVI     G_02F9, R0                      ; 5F56   0280 02F9
        SAR     R0,     1                       ; 5F58   0068
        MVO     R0,     G_034E                  ; 5F59   0240 034E
        MVO     R5,     G_01A5                  ; 5F5B   0245 01A5
        B       L_5F3D                          ; 5F5D   0220 0021

        PSHR    R5                              ; 5F5F   0275
        MVI     G_0335, R1                      ; 5F60   0281 0335
        SDBD                                    ; 5F62   0001
        ANDI    #$EFF8, R1                      ; 5F63   03B9 00F8 00EF
        SDBD                                    ; 5F66   0001
        XORI    #$1007, R1                      ; 5F67   03F9 0007 0010
        MVO     R1,     G_0335                  ; 5F6A   0241 0335
        CLRR    R0                              ; 5F6C   01C0
        MVO     R0,     G_01A4                  ; 5F6D   0240 01A4
        PULR    R7                              ; 5F6F   02B7

L_5F70:
        MVI     G_0195, R0                      ; 5F70   0280 0195
        TSTR    R0                              ; 5F72   0080
        BNEQ    L_5F79                          ; 5F73   020C 0004

        ADD     G_019C, R0                      ; 5F75   02C0 019C
        BEQ     L_5F8D                          ; 5F77   0204 0014

L_5F79:
        CMPI    #$0002, R1                      ; 5F79   0379 0002
        BEQ     L_5F85                          ; 5F7B   0204 0008

        MVI     G_0338, R0                      ; 5F7D   0280 0338
        SDBD                                    ; 5F7F   0001
        XORI    #$1004, R0                      ; 5F80   03F8 0004 0010
        MVO     R0,     G_0338                  ; 5F83   0240 0338
L_5F85:
        MVI     G_0337, R0                      ; 5F85   0280 0337
        SDBD                                    ; 5F87   0001
        XORI    #$1004, R0                      ; 5F88   03F8 0004 0010
        MVO     R0,     G_0337                  ; 5F8B   0240 0337
L_5F8D:
        PULR    R7                              ; 5F8D   02B7

L_5F8E:
        PSHR    R5                              ; 5F8E   0275
        MVII    #$0067, R0                      ; 5F8F   02B8 0067
        DIS                                     ; 5F91   0003
        SUB     G_0106, R0                      ; 5F92   0300 0106
        MVI     G_032B, R1                      ; 5F94   0281 032B
        EIS                                     ; 5F96   0002
        ANDI    #$00FF, R1                      ; 5F97   03B9 00FF
        CMPR    R1,     R0                      ; 5F99   0148
        BLT     L_5FA8                          ; 5F9A   0205 000C
        BGT     L_5FA2                          ; 5F9C   020E 0004

        CLRR    R0                              ; 5F9E   01C0
        CLRR    R1                              ; 5F9F   01C9
        B       L_5FAE                          ; 5FA0   0200 000C

L_5FA2:
        MVII    #$0001, R1                      ; 5FA2   02B9 0001
        MVII    #$0005, R0                      ; 5FA4   02B8 0005
        B       L_5FAE                          ; 5FA6   0200 0006

L_5FA8:
        MVII    #$0001, R1                      ; 5FA8   02B9 0001
        SDBD                                    ; 5FAA   0001
        MVII    #$FFFB, R0                      ; 5FAB   02B8 00FB 00FF
L_5FAE:
        MVO     R0,     G_0132                  ; 5FAE   0240 0132
        MVO     R0,     G_0126                  ; 5FB0   0240 0126
        MVO     R1,     G_0354                  ; 5FB2   0241 0354
        PULR    R7                              ; 5FB4   02B7

L_5FB5:
        MVI     G_0325, R0                      ; 5FB5   0280 0325
        MOVR    R0,     R2                      ; 5FB7   0082
        SDBD                                    ; 5FB8   0001
        ANDI    #$FF00, R2                      ; 5FB9   03BA 0000 00FF
        PSHR    R2                              ; 5FBC   0272
        ANDI    #$00FF, R0                      ; 5FBD   03B8 00FF
        PSHR    R0                              ; 5FBF   0270

        JSR     R5,     X_CLAMP                 ; 5FC0   0004 0114 0270

        DECR    R0                              ; 5FC3   0010
        MOVR    R3,     R0                      ; 5FC4   0098
        CMP@    R6,     R0                      ; 5FC5   0370
        BEQ     L_5FCB                          ; 5FC6   0204 0003

        CLRR    R2                              ; 5FC8   01D2
        MVO     R2,     G_0126                  ; 5FC9   0242 0126
L_5FCB:
        ADD@    R6,     R0                      ; 5FCB   02F0
        MVO     R0,     G_0325                  ; 5FCC   0240 0325
        B       L_5F70                          ; 5FCE   0220 005F

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5FD0   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5FD4   01B0 01A0 0190 0180
        DECLE   $0040,  $0020,  $0020,  $0030   ; 5FD8   0040 0020 0020 0030
        DECLE   $0030,  $0030,  $0000,  $00B3   ; 5FDC   0030 0030 0000 00B3
        DECLE   $0001,  $00B6,  $0001,  $00B9   ; 5FE0   0001 00B6 0001 00B9
        DECLE   $0001,  $0098,  $0064,  $009B   ; 5FE4   0001 0098 0064 009B
        DECLE   $0064,  $009E,  $0064,  $00A1   ; 5FE8   0064 009E 0064 00A1
        DECLE   $0064,  $003C,  $00AD,  $0064   ; 5FEC   0064 003C 00AD 0064
        DECLE   $000A,  $00FC,  $0067,  $0003   ; 5FF0   000A 00FC 0067 0003
        DECLE   $0093,  $005C,  $0001           ; 5FF4   0093 005C 0001

        CLRC                                    ; 5FF7   0006
        SLLC    R3,     1                       ; 5FF8   005B
        EIS                                     ; 5FF9   0002
        SLL     R3,     1                       ; 5FFA   004B
        SLLC    R2,     2                       ; 5FFB   005E
        EIS                                     ; 5FFC   0002
        SLR     R0,     2                       ; 5FFD   0064
        SAR     R2,     2                       ; 5FFE   006E
        RSWD    R0                              ; 5FFF   0038
        ADDR    R5,     R4                      ; 6000   00EC
        CMPR    R0,     R0                      ; 6001   0140
        MOVR    R0,     R1                      ; 6002   0081
        MOVR    R0,     R3                      ; 6003   0083
        MOVR    R0,     R7                      ; 6004   0087
        MOVR    R3,     R7                      ; 6005   009F

        DECLE   $00F0,  $0043,  $0000,  $0080   ; 6006   00F0 0043 0000 0080
        DECLE   $00C0,  $0180,  $0100,  $0080   ; 600A   00C0 0180 0100 0080
        DECLE   $0047,  $0026,  $001E,  $000E   ; 600E   0047 0026 001E 000E
        DECLE   $0104,  $004C,  $003F,  $00C0   ; 6012   0104 004C 003F 00C0
        DECLE   $00E0,  $0060,  $0020,  $0010   ; 6016   00E0 0060 0020 0010
        DECLE   $0011,  $00A6,  $00F8,  $0000   ; 601A   0011 00A6 00F8 0000
        DECLE   $0001,  $0003,  $0101,  $0100   ; 601E   0001 0003 0101 0100
        DECLE   $0001                           ; 6022   0001

        SUBR    R0,     R2                      ; 6023   0102
        MOVR    R0,     R1                      ; 6024   0081
        ADDR    R0,     R1                      ; 6025   00C1
        ADDR    R4,     R1                      ; 6026   00E1
        ADDR    R7,     R1                      ; 6027   00F9
        INCR    R7                              ; 6028   000F

        ADDR    R0,     R2                      ; 6029   00C2
L_602A:
        DIS                                     ; 602A   0003
        DECLE   $0007,  $0006,  $0004,  $0008   ; 602B   0007 0006 0004 0008
        DECLE   $0088,  $0065,  $001F,  $00E2   ; 602F   0088 0065 001F 00E2
        DECLE   $0064,  $0078,  $0070,  $0120   ; 6033   0064 0078 0070 0120
        DECLE   $0032,  $00FC,  $0000,  $0001   ; 6037   0032 00FC 0000 0001
        DECLE   $0082,  $0004,  $00A3,  $00F7   ; 603B   0082 0004 00A3 00F7
        DECLE   $01FF,  $0300,  $0003,  $002F   ; 603F   01FF 0300 0003 002F
        DECLE   $003F,  $00FF,  $0300,  $0080   ; 6043   003F 00FF 0300 0080
        DECLE   $00E8,  $00FC,  $00FF,  $0000   ; 6047   00E8 00FC 00FF 0000

        INCR    R0                              ; 604B   0008
        COMR    R5                              ; 604C   001D
        SUBR    R3,     R7                      ; 604D   011F

        DECLE   $005F,  $007F,  $00FF,  $0000   ; 604E   005F 007F 00FF 0000
        DECLE   $000B,  $005F,  $00FF,  $03FF   ; 6052   000B 005F 00FF 03FF
        DECLE   $0000,  $0080,  $00DA,  $00FF   ; 6056   0000 0080 00DA 00FF
        DECLE   $03FF,  $0020,  $0030,  $00BA   ; 605A   03FF 0020 0030 00BA
        DECLE   $00FE,  $03FF,  $0020,  $00E0   ; 605E   00FE 03FF 0020 00E0
        DECLE   $00F0,  $00FC,  $00FE,  $00FC   ; 6062   00F0 00FC 00FE 00FC
        DECLE   $01FF,  $007E,  $0066,  $0042   ; 6066   01FF 007E 0066 0042
        DECLE   $0066,  $017E,  $003C,  $0018   ; 606A   0066 017E 003C 0018
        DECLE   $0300,  $00A8,  $02F8,  $0300   ; 606E   0300 00A8 02F8 0300
        DECLE   $000A,  $020F,  $00EE,  $0201   ; 6072   000A 020F 00EE 0201
        DECLE   $00EE,  $0210,  $0000,  $0005   ; 6076   00EE 0210 0000 0005
        DECLE   $0000,  $002D,  $0000,  $002D   ; 607A   0000 002D 0000 002D
        DECLE   $0000,  $002D,  $0000,  $00A0   ; 607E   0000 002D 0000 00A0
        DECLE   $0000,  $00B4,  $0000,  $00B4   ; 6082   0000 00B4 0000 00B4
        DECLE   $0000,  $00B4,  $0000,  $00B4   ; 6086   0000 00B4 0000 00B4
        DECLE   $0000,  $00B4,  $0000,  $00B4   ; 608A   0000 00B4 0000 00B4
        DECLE   $0000,  $00B4,  $0000,  $002D   ; 608E   0000 00B4 0000 002D
        DECLE   $0000,  $002D,  $0000,  $002D   ; 6092   0000 002D 0000 002D
        DECLE   $0000,  $002D,  $001E,  $0210   ; 6096   0000 002D 001E 0210
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 609A   0018 003C 007E 00FF
        DECLE   $0200,  $000D,  $0052,  $00DE   ; 609E   0200 000D 0052 00DE
        DECLE   $01FF,  $0100,  $0048,  $0128   ; 60A2   01FF 0100 0048 0128
        DECLE   $0078,  $00F0,  $00F8,  $0100   ; 60A6   0078 00F0 00F8 0100
        DECLE   $0218,  $0200,  $0000,  $03FF   ; 60AA   0218 0200 0000 03FF
        DECLE   $03FF,  $01FF,  $00FB,  $00BE   ; 60AE   03FF 01FF 00FB 00BE
        DECLE   $003F,  $00E5,  $00BC,  $003F   ; 60B2   003F 00E5 00BC 003F
        DECLE   $007F,  $00FF,  $007F,  $00FF   ; 60B6   007F 00FF 007F 00FF
        DECLE   $017F,  $00FF,  $00FE,  $00FF   ; 60BA   017F 00FF 00FE 00FF
        DECLE   $00FE,  $00FF,  $01FE,  $00FF   ; 60BE   00FE 00FF 01FE 00FF

        ADDR    R7,     R6                      ; 60C2   00FE
        RSWD    R4                              ; 60C3   003C
        SWAP    R2,     1                       ; 60C4   0042
        MOVR    R3,     R1                      ; 60C5   0099
        ANDR    R4,     R1                      ; 60C6   01A1
        MOVR    R3,     R1                      ; 60C7   0099
        SWAP    R2,     1                       ; 60C8   0042
        RSWD    R4                              ; 60C9   003C
        SUB     G_00AA, R0                      ; 60CA   0300 00AA
        ADDI    #$0041, R7                      ; 60CC   02FF 0041

        RLC     R1,     2                       ; 60CE   0055
        SLLC    R1,     2                       ; 60CF   005D
        SAR     R3,     1                       ; 60D0   006B
        MOVR    R7,     R6                      ; 60D1   00BE
        ADDI    #$0000, R7                      ; 60D2   02FF 0000

L_60D4:
        RLC     R1,     2                       ; 60D4   0055
        SLLC    R1,     2                       ; 60D5   005D
        SAR     R3,     1                       ; 60D6   006B
        MOVR    R7,     R6                      ; 60D7   00BE
        ADDI    #$0100, R7                      ; 60D8   02FF 0100

        SLLC    R1,     2                       ; 60DA   005D
        SAR     R3,     1                       ; 60DB   006B
        MOVR    R7,     R6                      ; 60DC   00BE
        ADDI    #$0300, R7                      ; 60DD   02FF 0300

        DECLE   $0025,  $00B7,  $01FF,  $0200   ; 60DF   0025 00B7 01FF 0200
        DECLE   $0002                           ; 60E3   0002

        MOVR    R5,     R7                      ; 60E4   00AF
        ADDI    #$0300, R7                      ; 60E5   02FF 0300

        MOVR    R4,     R3                      ; 60E7   00A3
        ADDI    #$0300, R7                      ; 60E8   02FF 0300

        DECLE   $0001,  $0097,  $01FF           ; 60EA   0001 0097 01FF

        ADDR    R1,     R1                      ; 60ED   00C9
        SLLC    R1,     2                       ; 60EE   005D
        RLC     R0,     1                       ; 60EF   0050
        RLC     R2,     2                       ; 60F0   0056
        MOVR    R7,     R6                      ; 60F1   00BE
        SLLC    R1,     2                       ; 60F2   005D
        ADDR    R0,     R1                      ; 60F3   00C1
        SLLC    R1,     2                       ; 60F4   005D
        ADDR    R0,     R5                      ; 60F5   00C5
        SLLC    R1,     2                       ; 60F6   005D
        SETC                                    ; 60F7   0007
        GSWD    R2                              ; 60F8   0032
        ADDR    R7,     R0                      ; 60F9   00F8
        RSWD    R2                              ; 60FA   003A
        ADDR    R1,     R7                      ; 60FB   00CF

        DECLE   $00BA,  $001F                   ; 60FC   00BA 001F

        ADDR    R7,     R2                      ; 60FE   00FA
        SETC                                    ; 60FF   0007
        EIS                                     ; 6100   0002
        ADDR    R0,     R7                      ; 6101   00C7

        MOVR    R7,     R2                      ; 6102   00BA
        ADDR    R1,     R7                      ; 6103   00CF

        DECLE   $008C,  $0027                   ; 6104   008C 0027

        ADDR    R1,     R4                      ; 6106   00CC
        ADDR    R0,     R7                      ; 6107   00C7

        MOVR    R1,     R4                      ; 6108   008C
        MOVR    R0,     R7                      ; 6109   0087

        RSWD    R2                              ; 610A   003A
        MOVR    R1,     R7                      ; 610B   008F

        RSWD    R2                              ; 610C   003A
        MOVR    R2,     R0                      ; 610D   0090
        RSWD    R2                              ; 610E   003A
L_610F:
        MOVR    R3,     R0                      ; 610F   0098
        RSWD    R2                              ; 6110   003A
        ADDR    R2,     R7                      ; 6111   00D7

        COMR    R2                              ; 6112   001A
        MOVR    R5,     R7                      ; 6113   00AF

        DECLE   $003A,  $0000                   ; 6114   003A 0000

        NEGR    R6                              ; 6116   0026
        MOVR    R5,     R7                      ; 6117   00AF

        INCR    R0                              ; 6118   0008
        MOVR    R1,     R7                      ; 6119   008F

        INCR    R0                              ; 611A   0008
        TSTR    R0                              ; 611B   0080
        ADCR    R6                              ; 611C   002E
        MOVR    R1,     R0                      ; 611D   0088
        ADCR    R6                              ; 611E   002E
        MOVR    R6,     R0                      ; 611F   00B0
        ADCR    R6                              ; 6120   002E
        ADDR    R3,     R6                      ; 6121   00DE
        COMR    R6                              ; 6122   001E
        ADDR    R4,     R6                      ; 6123   00E6
        COMR    R6                              ; 6124   001E
        MOVR    R0,     R7                      ; 6125   0087

        INCR    R0                              ; 6126   0008
        MOVR    R3,     R7                      ; 6127   009F

        INCR    R0                              ; 6128   0008
        ADDR    R6,     R6                      ; 6129   00F6
        COMR    R6                              ; 612A   001E
        ADDR    R5,     R6                      ; 612B   00EE
        COMR    R6                              ; 612C   001E
        MOVR    R1,     R5                      ; 612D   008D
        ADCR    R6                              ; 612E   002E
        MOVR    R4,     R7                      ; 612F   00A7

        DECLE   $0008,  $00AD,  $002E,  $0085   ; 6130   0008 00AD 002E 0085
        DECLE   $002E,  $003D,  $0022,  $009D   ; 6134   002E 003D 0022 009D
        DECLE   $002E,  $00C8,  $003A,  $0040   ; 6138   002E 00C8 003A 0040
        DECLE   $003B,  $00C0,  $003A,  $0013   ; 613C   003B 00C0 003A 0013
        DECLE   $000D,  $00B8,  $001A,  $0047   ; 6140   000D 00B8 001A 0047
        DECLE   $009B,  $0047,  $008D,  $0091   ; 6144   009B 0047 008D 0091
        DECLE   $002E,  $0089,  $002E,  $0081   ; 6148   002E 0089 002E 0081
        DECLE   $002E,  $0099,  $002E,  $0000   ; 614C   002E 0099 002E 0000
        DECLE   $0002,  $0019,  $001B,  $00B1   ; 6150   0002 0019 001B 00B1
        DECLE   $002E,  $00B7                   ; 6154   002E 00B7

        INCR    R2                              ; 6156   000A
        MOVR    R0,     R7                      ; 6157   0087

        INCR    R2                              ; 6158   000A
        MOVR    R1,     R7                      ; 6159   008F

        INCR    R2                              ; 615A   000A
        MOVR    R3,     R7                      ; 615B   009F

        DECLE   $000A,  $001F,  $001F,  $00A7   ; 615C   000A 001F 001F 00A7
        DECLE   $000A,  $002F,  $00CC,  $0037   ; 6160   000A 002F 00CC 0037
        DECLE   $00FA,  $0000,  $0000           ; 6164   00FA 0000 0000

        INCR    R7                              ; 6167   000F

        INCR    R5                              ; 6168   000D
L_6169:
        DECR    R1                              ; 6169   0011
        DECLE   $0002,  $0011,  $000E,  $0211   ; 616A   0002 0011 000E 0211
        DECLE   $0221,  $0241,  $0222,  $0241   ; 616E   0221 0241 0222 0241
        DECLE   $0221,  $0231,  $0009,  $0021   ; 6172   0221 0231 0009 0021
        DECLE   $0031,  $0051,  $0001,  $0061   ; 6176   0031 0051 0001 0061
        DECLE   $0071,  $0081,  $0061,  $0351   ; 617A   0071 0081 0061 0351
        DECLE   $0081,  $0001,  $0021,  $0361   ; 617E   0081 0001 0021 0361
        DECLE   $0051,  $0003,  $0091,  $00E1   ; 6182   0051 0003 0091 00E1
        DECLE   $00A1,  $0091,  $0251,  $00D3   ; 6186   00A1 0091 0251 00D3
        DECLE   $0261,  $0272,  $0261,  $00D3   ; 618A   0261 0272 0261 00D3
        DECLE   $0251,  $0091,  $00E1,  $00A1   ; 618E   0251 0091 00E1 00A1
        DECLE   $0091,  $0141,  $0121,  $0141   ; 6192   0091 0141 0121 0141
        DECLE   $0131,  $00DC,  $0121,  $0131   ; 6196   0131 00DC 0121 0131
        DECLE   $00F2,  $0372,  $0171,  $0181   ; 619A   00F2 0372 0171 0181
        DECLE   $00D4,  $0251,  $0151,  $0161   ; 619E   00D4 0251 0151 0161
        DECLE   $0251,  $00D4,  $0101,  $0111   ; 61A2   0251 00D4 0101 0111
        DECLE   $0141,  $0121,  $0182,  $00F1   ; 61A6   0141 0121 0182 00F1
        DECLE   $0281,  $00D5,  $0191,  $01A1   ; 61AA   0281 00D5 0191 01A1
        DECLE   $00D5,  $0291,  $00F1,  $01C1   ; 61AE   00D5 0291 00F1 01C1
        DECLE   $0181,  $00F1,  $02A1,  $02B1   ; 61B2   0181 00F1 02A1 02B1
        DECLE   $02C1,  $02D5,  $02C2,  $02D5   ; 61B6   02C1 02D5 02C2 02D5
        DECLE   $02C1,  $02E1,  $00F3,  $02F1   ; 61BA   02C1 02E1 00F3 02F1
        DECLE   $0301,  $0311,  $0301,  $0321   ; 61BE   0301 0311 0301 0321
        DECLE   $02F1,  $0311,  $0321,  $0332   ; 61C2   02F1 0311 0321 0332
        DECLE   $0321,  $0341,  $02F1,  $0312   ; 61C6   0321 0341 02F1 0312
        DECLE   $0301,  $0341,  $00F2,  $01E1   ; 61CA   0301 0341 00F2 01E1
        DECLE   $01B1,  $00FF,  $00F3,  $01F2   ; 61CE   01B1 00FF 00F3 01F2
        DECLE   $01D1,  $01B1,  $00FC,  $01E1   ; 61D2   01D1 01B1 00FC 01E1
        DECLE   $0201,  $01B1,  $00F1,  $0001   ; 61D6   0201 01B1 00F1 0001
L_61DA:
        MVII    #$00D8, R2                      ; 61DA   02BA 00D8
        SLR     R1,     1                       ; 61DC   0061
        MVII    #$0200, R4                      ; 61DD   02BC 0200
L_61DF:
        SDBD                                    ; 61DF   0001
        MVII    #$6167, R3                      ; 61E0   02BB 0067 0061
L_61E3:
        PSHR    R5                              ; 61E3   0275
L_61E4:
        MVI@    R3,     R0                      ; 61E4   0298
        MOVR    R0,     R1                      ; 61E5   0081
        ANDI    #$000F, R0                      ; 61E6   03B8 000F
        SLR     R1,     2                       ; 61E8   0065
        SLR     R1,     2                       ; 61E9   0065
        SLL     R1,     1                       ; 61EA   0049
        SDBD                                    ; 61EB   0001
        ADDI    #$60F7, R1                      ; 61EC   02F9 00F7 0060
        MOVR    R1,     R5                      ; 61EF   008D
        SDBD                                    ; 61F0   0001
        MVI@    R5,     R1                      ; 61F1   02A9

        JSR     R5,     X_FILL_MEM              ; 61F2   0004 0114 0341

        INCR    R3                              ; 61F5   000B
        CMPR    R2,     R3                      ; 61F6   0153
        BLE     L_61E4                          ; 61F7   0226 0014
        PULR    R7                              ; 61F9   02B7

        DECLE   $0020,  $0030,  $003C,  $003A   ; 61FA   0020 0030 003C 003A
        DECLE   $002C,  $0018,  $0020,  $0038   ; 61FE   002C 0018 0020 0038
        DECLE   $0010,  $0010,  $0010,  $0010   ; 6202   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $001A,  $007C   ; 6206   0010 0010 001A 007C
        DECLE   $0020,  $0030,  $003C,  $0038   ; 620A   0020 0030 003C 0038
        DECLE   $002C,  $0018,  $0020,  $0018   ; 620E   002C 0018 0020 0018
        DECLE   $0010,  $0010,  $0018,  $0028   ; 6212   0010 0010 0018 0028
        DECLE   $0028,  $0028,  $003D,  $00FE   ; 6216   0028 0028 003D 00FE
        DECLE   $0020,  $0034,  $0038,  $0038   ; 621A   0020 0034 0038 0038
        DECLE   $003C,  $0018,  $0020,  $0018   ; 621E   003C 0018 0020 0018
        DECLE   $0030,  $0030,  $0038,  $0048   ; 6222   0030 0030 0038 0048
        DECLE   $0048,  $0049,  $003E,  $00F8   ; 6226   0048 0049 003E 00F8
        DECLE   $0030,  $0030,  $003C,  $003A   ; 622A   0030 0030 003C 003A
        DECLE   $002C,  $0010,  $0020,  $0018   ; 622E   002C 0010 0020 0018
        DECLE   $0010,  $0010,  $0018,  $0028   ; 6232   0010 0010 0018 0028
        DECLE   $0028,  $0028,  $003D,  $00FE   ; 6236   0028 0028 003D 00FE
        DECLE   $0010,  $0038,  $0062,  $00CB   ; 623A   0010 0038 0062 00CB
        DECLE   $0081,  $0011,  $0025,  $0025   ; 623E   0081 0011 0025 0025
        DECLE   $0026,  $0094,  $00C0,  $0049   ; 6242   0026 0094 00C0 0049
        DECLE   $0021,  $0003,  $0036,  $001C   ; 6246   0021 0003 0036 001C
        DECLE   $000C,  $0006,  $0042,  $0033   ; 624A   000C 0006 0042 0033
        DECLE   $0061,  $0059,  $0015,  $00A0   ; 624E   0061 0059 0015 00A0
        DECLE   $0084,  $0094,  $00C8,  $00C2   ; 6252   0084 0094 00C8 00C2
        DECLE   $0062,  $0026,  $000C,  $0000   ; 6256   0062 0026 000C 0000
        DECLE   $0000,  $001C,  $0004,  $0022   ; 625A   0000 001C 0004 0022
        DECLE   $0069,  $004D,  $0095,  $00A5   ; 625E   0069 004D 0095 00A5
        DECLE   $0095,  $0015,  $0009,  $0011   ; 6262   0095 0015 0009 0011
        DECLE   $000B,  $0042,  $0020,  $0018   ; 6266   000B 0042 0020 0018
        DECLE   $0000,  $0000,  $0010,  $003C   ; 626A   0000 0000 0010 003C
        DECLE   $0042,  $0000,  $0036,  $0042   ; 626E   0042 0000 0036 0042
        DECLE   $0052,  $0056,  $000A,  $0024   ; 6272   0052 0056 000A 0024
        DECLE   $0020,  $0018,  $0000,  $0000   ; 6276   0020 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 627A   0000 0000 0000 0000
        DECLE   $000E,  $0002,  $0023,  $0059   ; 627E   000E 0002 0023 0059
        DECLE   $00D0,  $0082,  $00CC,  $0038   ; 6282   00D0 0082 00CC 0038
        DECLE   $0060,  $0000,  $0000,  $0000   ; 6286   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 628A   0000 0000 0000 0002
        DECLE   $0002,  $0003,  $0004,  $0008   ; 628E   0002 0003 0004 0008
        DECLE   $0010,  $0020,  $0040,  $00C0   ; 6292   0010 0020 0040 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6296   0000 0000 0000 0000
        DECLE   $0028,  $0070,  $00FE,  $001F   ; 629A   0028 0070 00FE 001F

        INCR    R7                              ; 629E   000F

        DECR    R6                              ; 629F   0016
L_62A0:
        NEGR    R4                              ; 62A0   0024
        DECLE   $0008,  $0028,  $0070,  $00FE   ; 62A1   0008 0028 0070 00FE
        DECLE   $001F                           ; 62A5   001F

        INCR    R7                              ; 62A6   000F

        INCR    R6                              ; 62A7   000E
L_62A8:
        DECR    R4                              ; 62A8   0014
        DECLE   $0014,  $0050,  $0030,  $007E   ; 62A9   0014 0050 0030 007E
        DECLE   $00FF,  $001F,  $000E,  $000A   ; 62AD   00FF 001F 000E 000A
        DECLE   $0009,  $0050,  $0030,  $007C   ; 62B1   0009 0050 0030 007C
        DECLE   $00FF,  $001F,  $000E,  $000A   ; 62B5   00FF 001F 000E 000A
        DECLE   $0005,  $0014,  $00F8,  $007E   ; 62B9   0005 0014 00F8 007E
        DECLE   $001F                           ; 62BD   001F

        INCR    R7                              ; 62BE   000F

        INCR    R6                              ; 62BF   000E
L_62C0:
        DECR    R4                              ; 62C0   0014
        DECLE   $000A,  $0014,  $00F8,  $007E   ; 62C1   000A 0014 00F8 007E
        DECLE   $001F                           ; 62C5   001F

        INCR    R7                              ; 62C6   000F

        DECR    R4                              ; 62C7   0014
L_62C8:
        INCR    R2                              ; 62C8   000A
        DECLE   $0000,  $0010,  $0018,  $0030   ; 62C9   0000 0010 0018 0030
        DECLE   $0018,  $0034,  $0058,  $0034   ; 62CD   0018 0034 0058 0034
        DECLE   $0050,  $0050,  $0070,  $0060   ; 62D1   0050 0050 0070 0060
        DECLE   $0030,  $0030,  $0030,  $0000   ; 62D5   0030 0030 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0048   ; 62D9   0000 0000 0000 0048
        DECLE   $0038,  $0008,  $0040,  $0080   ; 62DD   0038 0008 0040 0080
        DECLE   $0055,  $0057,  $0077,  $0067   ; 62E1   0055 0057 0077 0067
        DECLE   $0035,  $0032,  $0032,  $0002   ; 62E5   0035 0032 0032 0002
        DECLE   $0002,  $0002,  $0002,  $0042   ; 62E9   0002 0002 0002 0042
        DECLE   $0030,  $0000,  $0000,  $0000   ; 62ED   0030 0000 0000 0000
        DECLE   $0070,  $00F8,  $00F8,  $0034   ; 62F1   0070 00F8 00F8 0034
        DECLE   $0012,  $0008,  $0000,  $0000   ; 62F5   0012 0008 0000 0000
        DECLE   $0038,  $00F8,  $00F8,  $0014   ; 62F9   0038 00F8 00F8 0014
        DECLE   $001C,  $0000,  $0000,  $0000   ; 62FD   001C 0000 0000 0000
        DECLE   $0010,  $00F8,  $00F8,  $0034   ; 6301   0010 00F8 00F8 0034
        DECLE   $002C,  $0040,  $0000,  $0000   ; 6305   002C 0040 0000 0000
        DECLE   $0010,  $00F8,  $00FC,  $0038   ; 6309   0010 00F8 00FC 0038
        DECLE   $0068,  $0010,  $0000,  $0000   ; 630D   0068 0010 0000 0000
        DECLE   $0030,  $00FC,  $00F8,  $0038   ; 6311   0030 00FC 00F8 0038
        DECLE   $0014,  $0024,  $0000,  $0000   ; 6315   0014 0024 0000 0000
        DECLE   $0070,  $00F8,  $00F8,  $003C   ; 6319   0070 00F8 00F8 003C
        DECLE   $0014,  $0012,  $0011,  $0015   ; 631D   0014 0012 0011 0015
        DECLE   $001F,  $000E,  $0016,  $0020   ; 6321   001F 000E 0016 0020
        DECLE   $00D3,  $0020,  $00C0,  $000E   ; 6325   00D3 0020 00C0 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6329   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0054,  $0028   ; 632D   0000 0000 0054 0028
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6331   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0050,  $00D0   ; 6335   0000 0000 0050 00D0
        DECLE   $0028,  $0000,  $0000,  $0000   ; 6339   0028 0000 0000 0000
        DECLE   $0000,  $0000,  $002A,  $0014   ; 633D   0000 0000 002A 0014
        DECLE   $000A,  $0020,  $0030,  $0024   ; 6341   000A 0020 0030 0024
        DECLE   $0074,  $00EE,  $0034,  $006E   ; 6345   0074 00EE 0034 006E
        DECLE   $00FF,  $002C,  $00F6,  $007F   ; 6349   00FF 002C 00F6 007F
        DECLE   $00AD,  $007E,  $00FD,  $00BE   ; 634D   00AD 007E 00FD 00BE
        DECLE   $0075,  $0000,  $0001,  $0053   ; 6351   0075 0000 0001 0053
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6355   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0001,  $000B   ; 6359   00FF 0000 0001 000B
        DECLE   $005F,  $00FF,  $00FF,  $00FF   ; 635D   005F 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0005,  $002F   ; 6361   00FF 0000 0005 002F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6365   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0001                   ; 6369   00FF 0001

        DIS                                     ; 636B   0003
L_636C:
        DECR    R7                              ; 636C   0017

        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 636D   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FD   ; 6371   00FF 00FF 00FF 00FD
        DECLE   $00F8,  $00D0,  $0080,  $0000   ; 6375   00F8 00D0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6379   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $00C8,  $00FD   ; 637D   0000 0080 00C8 00FD
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6381   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0080,  $00E0,  $00F9   ; 6385   0000 0080 00E0 00F9
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6389   00FF 00FF 00FF 00FF
        DECLE   $0080,  $00C0,  $00E8,  $00FD   ; 638D   0080 00C0 00E8 00FD
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6391   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0080,  $00D0,  $00FE   ; 6395   0000 0080 00D0 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6399   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $006E   ; 639D   00FF 00FF 00FF 006E
        DECLE   $000A,  $0000,  $0000,  $0000   ; 63A1   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63A5   0000 0000 0000 0000
        DECLE   $0008,  $0014,  $0008,  $005D   ; 63A9   0008 0014 0008 005D
        DECLE   $002A,  $001C,  $001C,  $002A   ; 63AD   002A 001C 001C 002A
        DECLE   $005D,  $0008,  $0014,  $0008   ; 63B1   005D 0008 0014 0008
        DECLE   $0000,  $0000,  $0004,  $000C   ; 63B5   0000 0000 0004 000C
        DECLE   $001C,  $001E,  $005E,  $007E   ; 63B9   001C 001E 005E 007E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 63BD   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $001F   ; 63C1   00FF 00FF 007F 001F
        DECLE   $001B,  $0001,  $0000,  $0000   ; 63C5   001B 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63C9   0000 0000 0000 0000
        DECLE   $0010,  $0020,  $0020,  $001E   ; 63CD   0010 0020 0020 001E
        DECLE   $0020,  $0040,  $0040,  $0020   ; 63D1   0020 0040 0040 0020
        DECLE   $0000,  $0000,  $0020,  $002C   ; 63D5   0000 0000 0020 002C
        DECLE   $0030,  $004C,  $0042,  $0040   ; 63D9   0030 004C 0042 0040
        DECLE   $0000                           ; 63DD   0000

        NEGR    R0                              ; 63DE   0020
L_63DF:
        ADCR    R4                              ; 63DF   002C
        DECLE   $0010,  $0030,  $0048,  $0044   ; 63E0   0010 0030 0048 0044
        DECLE   $0000,  $0000                   ; 63E4   0000 0000

        INCR    R0                              ; 63E6   0008
L_63E7:
        INCR    R4                              ; 63E7   000C
        INCR    R2                              ; 63E8   000A
        DECR    R4                              ; 63E9   0014
L_63EA:
        NEGR    R4                              ; 63EA   0024
        DECLE   $0002,  $0002,  $0002,  $0034   ; 63EB   0002 0002 0002 0034
        DECLE   $004C,  $000A,  $0008,  $0008   ; 63EF   004C 000A 0008 0008
        DECLE   $0008,  $0008,  $0018,  $0018   ; 63F3   0008 0008 0018 0018
        DECLE   $0034,  $005C,  $0028,  $003C   ; 63F7   0034 005C 0028 003C
        DECLE   $0028,  $0018,  $0010,  $0010   ; 63FB   0028 0018 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 63FF   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0018,  $003C   ; 6403   0010 0010 0018 003C
        DECLE   $0038,  $0030,  $005C,  $006C   ; 6407   0038 0030 005C 006C
        DECLE   $003C,  $0034,  $0018,  $0010   ; 640B   003C 0034 0018 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 640F   0010 0010 0010 0010
        DECLE   $0000,  $0018,  $0010,  $0038   ; 6413   0000 0018 0010 0038
        DECLE   $0070,  $003C,  $0028,  $007C   ; 6417   0070 003C 0028 007C
        DECLE   $0070,  $0038,  $0018,  $0010   ; 641B   0070 0038 0018 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 641F   0010 0010 0010 0010
        DECLE   $003A,  $001C,  $0078,  $0054   ; 6423   003A 001C 0078 0054
        DECLE   $002C,  $0014,  $0000,  $0010   ; 6427   002C 0014 0000 0010
        DECLE   $0020,  $002C,  $0018,  $003C   ; 642B   0020 002C 0018 003C
        DECLE   $007C,  $0028,  $0018,  $0050   ; 642F   007C 0028 0018 0050
        DECLE   $003C,  $0034,  $007E,  $0038   ; 6433   003C 0034 007E 0038
        DECLE   $0014,  $0020,  $0000,  $007F   ; 6437   0014 0020 0000 007F
        DECLE   $007E,  $007F,  $00FF,  $007E   ; 643B   007E 007F 00FF 007E
        DECLE   $00FE,  $007E,  $007F,  $007F   ; 643F   00FE 007E 007F 007F
        DECLE   $007E,  $007E,  $00FF,  $00FF   ; 6443   007E 007E 00FF 00FF
        DECLE   $00FD,  $007F,  $00FE,  $0001   ; 6447   00FD 007F 00FE 0001
        DECLE   $0001,  $0001,  $0055,  $005D   ; 644B   0001 0001 0055 005D
        DECLE   $005C,  $001C,  $001C,  $0000   ; 644F   005C 001C 001C 0000
        DECLE   $003E,  $003E,  $0036,  $0022   ; 6453   003E 003E 0036 0022
        DECLE   $0022,  $0022,  $0022,  $002A   ; 6457   0022 0022 0022 002A
        DECLE   $003E,  $003E,  $001C,  $001C   ; 645B   003E 003E 001C 001C
        DECLE   $003E,  $002A,  $0022,  $0022   ; 645F   003E 002A 0022 0022
        DECLE   $0022,  $0000,  $001C,  $0000   ; 6463   0022 0000 001C 0000
        DECLE   $0000,  $0000,  $0024,  $0018   ; 6467   0000 0000 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646B   0000 0000 0000 0000
        DECLE   $0008,  $0052,  $0024,  $0018   ; 646F   0008 0052 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6473   0000 0000 0000 0000
        DECLE   $0008,  $0042,  $0025,  $00B8   ; 6477   0008 0042 0025 00B8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 647B   0000 0000 0000 0000
        DECLE   $0004,  $0022,  $006C,  $009A   ; 647F   0004 0022 006C 009A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6483   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0022,  $005E   ; 6487   0000 0000 0022 005E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 648B   0000 0000 0000 0000

        ADCR    R2                              ; 648F   002A
        SLR     R3,     1                       ; 6490   0063
        DIS                                     ; 6491   0003
        MOVR    R3,     R2                      ; 6492   009A
        SLR     R2,     1                       ; 6493   0062
        CLRC                                    ; 6494   0006
        ADDR    R5,     R7                      ; 6495   00EF

        DECLE   $0062,  $0006,  $0052,  $0063   ; 6496   0062 0006 0052 0063
        DECLE   $0004,  $007D,  $0063,  $0004   ; 649A   0004 007D 0063 0004
        DECLE   $0060,  $0039,  $0004,  $0040   ; 649E   0060 0039 0004 0040
        DECLE   $0039,  $0004,  $0076,  $0063   ; 64A2   0039 0004 0076 0063
        DECLE   $0001,  $00A1,  $0063,  $0001   ; 64A6   0001 00A1 0063 0001
        DECLE   $00C5,  $0063,  $0001           ; 64AA   00C5 0063 0001

        PSHR    R5                              ; 64AD   0275

        JSR     R5,     L_5CB1                  ; 64AE   0004 015C 00B1

        MVI     G_01B1, R1                      ; 64B1   0281 01B1
        DECR    R1                              ; 64B3   0011
        BLE     L_64BC                          ; 64B4   0206 0006

        MVI     G_0187, R0                      ; 64B6   0280 0187
        DECR    R0                              ; 64B8   0010
        DECR    R0                              ; 64B9   0010
        B       L_64DE                          ; 64BA   0200 0022

L_64BC:
        JSR     R5,     L_69CD                  ; 64BC   0004 0168 01CD

        MVII    #$0002, R1                      ; 64BF   02B9 0002
        CLRR    R2                              ; 64C1   01D2

        JSR     R5,     L_5B3A                  ; 64C2   0004 0158 033A

        MVI     G_01B0, R0                      ; 64C5   0280 01B0
        DECR    R0                              ; 64C7   0010
        CMPI    #$001A, R0                      ; 64C8   0378 001A
        BGE     L_64CE                          ; 64CA   020D 0002

        MVII    #$001A, R0                      ; 64CC   02B8 001A
L_64CE:
        MVO     R0,     G_01B0                  ; 64CE   0240 01B0
        MVII    #$000A, R1                      ; 64D0   02B9 000A
        MVI     G_01BE, R2                      ; 64D2   0282 01BE
        DECR    R2                              ; 64D4   0012
        DECR    R2                              ; 64D5   0012
        CMPI    #$00C0, R2                      ; 64D6   037A 00C0
        BGE     L_64DC                          ; 64D8   020D 0002

        MVII    #$00C0, R2                      ; 64DA   02BA 00C0
L_64DC:
        MVO     R2,     G_01BE                  ; 64DC   0242 01BE
L_64DE:
        CMPI    #$0006, R0                      ; 64DE   0378 0006
        BGE     L_64E4                          ; 64E0   020D 0002

        MVII    #$0006, R0                      ; 64E2   02B8 0006
L_64E4:
        MVO     R0,     G_0187                  ; 64E4   0240 0187
        MVO     R1,     G_01B1                  ; 64E6   0241 01B1
        PULR    R7                              ; 64E8   02B7

        DECLE   $0008,  $0009,  $00C0,  $0000   ; 64E9   0008 0009 00C0 0000
        DECLE   $0001,  $0000,  $0001,  $0065   ; 64ED   0001 0000 0001 0065
        DECLE   $0020,  $0000,  $0000,  $0000   ; 64F1   0020 0000 0000 0000
        DECLE   $0000,  $0048,  $0080,  $0040   ; 64F5   0000 0048 0080 0040
        DECLE   $0006,  $0000,  $0013,  $0065   ; 64F9   0006 0000 0013 0065
        DECLE   $0000,  $0000,  $0001,  $00FD   ; 64FD   0000 0000 0001 00FD
        DECLE   $00E3,  $0067,  $00FA,  $0061   ; 6501   00E3 0067 00FA 0061
        DECLE   $0004                           ; 6505   0004

        XOR@    R6,     R0                      ; 6506   03F0
        ADDR    R1,     R7                      ; 6507   00CF

        SAR     R1,     2                       ; 6508   006D
        ADDR    R1,     R7                      ; 6509   00CF

        SAR     R1,     2                       ; 650A   006D
        ADDR    R1,     R7                      ; 650B   00CF

        SAR     R1,     2                       ; 650C   006D
        ADDR    R1,     R7                      ; 650D   00CF

        SAR     R1,     2                       ; 650E   006D
        ADDR    R6,     R5                      ; 650F   00F5
        SAR     R0,     1                       ; 6510   0068
        ADDR    R2,     R5                      ; 6511   00D5
        SAR     R0,     1                       ; 6512   0068
        ADDR    R4,     R3                      ; 6513   00E3
        SLR     R3,     2                       ; 6514   0067
        ADDR    R2,     R1                      ; 6515   00D1
        SLR     R2,     1                       ; 6516   0062
        EIS                                     ; 6517   0002
        B       L_656F                          ; 6518   0200 0055

        DECLE   $005B,  $0036,  $006A,  $003A   ; 651A   005B 0036 006A 003A
        DECLE   $0062,  $0006,  $0202,  $009D   ; 651E   0062 0006 0202 009D
        DECLE   $006B,  $0040,  $006B,  $0000   ; 6522   006B 0040 006B 0000
        DECLE   $0088,  $008D,  $0001,  $0006   ; 6526   0088 008D 0001 0006
        DECLE   $0000,  $0031,  $0065,  $0000   ; 652A   0000 0031 0065 0000
        DECLE   $0000,  $0000,  $0000,  $00E3   ; 652E   0000 0000 0000 00E3
        DECLE   $0067,  $001F,  $0063,  $0001   ; 6532   0067 001F 0063 0001
        DECLE   $0000,  $00A8,  $0009,  $0014   ; 6536   0000 00A8 0009 0014
        DECLE   $0000,  $0005,  $0020,  $0043   ; 653A   0000 0005 0020 0043
        DECLE   $0065,  $0000,  $0000,  $00FE   ; 653E   0065 0000 0000 00FE
        DECLE   $0000,  $00E3,  $0067,  $00C9   ; 6542   0000 00E3 0067 00C9
        DECLE   $0062,  $0000,  $0000,  $0045   ; 6546   0062 0000 0000 0045
        DECLE   $006A,  $0042,  $0063,  $0000   ; 654A   006A 0042 0063 0000
        DECLE   $0000,  $00E3,  $0067,  $00C9   ; 654E   0000 00E3 0067 00C9
        DECLE   $0062,  $0000,  $0100,  $00AC   ; 6552   0062 0000 0100 00AC
        DECLE   $0067,  $00E3,  $0067,  $0042   ; 6556   0067 00E3 0067 0042
        DECLE   $0063,  $0000                   ; 655A   0063 0000

        SUBR    R0,     R0                      ; 655C   0100
        MOVR    R5,     R7                      ; 655D   00AF

        DECLE   $0067,  $00E3,  $0067,  $0042   ; 655E   0067 00E3 0067 0042
        DECLE   $0063,  $0000,  $0100,  $00AC   ; 6562   0063 0000 0100 00AC
        DECLE   $0067,  $00E3,  $0067,  $0042   ; 6566   0067 00E3 0067 0042
        DECLE   $0063,  $0000                   ; 656A   0063 0000

        B       L_6641                          ; 656C   0200 00D3

        SLR     R3,     2                       ; 656E   0067
L_656F:
        SAR     R3,     1                       ; 656F   006B
        DECLE   $0009,  $00DC,  $0000,  $0007   ; 6570   0009 00DC 0000 0007
        DECLE   $0010,  $000D,  $0066,  $0000   ; 6574   0010 000D 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6578   0000 0000 0000 0000
        DECLE   $0048,  $0080,  $0040,  $0006   ; 657C   0048 0080 0040 0006
        DECLE   $0000,  $0015,  $0066,  $0000   ; 6580   0000 0015 0066 0000
        DECLE   $0000,  $0000,  $00FE,  $0000   ; 6584   0000 0000 00FE 0000
        DECLE   $0049,  $0080,  $0044,  $0006   ; 6588   0049 0080 0044 0006
        DECLE   $0000,  $00AB,  $0065,  $0010   ; 658C   0000 00AB 0065 0010
        DECLE   $0000,  $0000,  $00FA,  $0000   ; 6590   0000 0000 00FA 0000
        DECLE   $0009,  $0000,  $0000,  $0006   ; 6594   0009 0000 0000 0006
        DECLE   $0000,  $00BB,  $0065,  $0020   ; 6598   0000 00BB 0065 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 659C   0000 0000 0000 0000
        DECLE   $0009,  $00A0,  $0000,  $0000   ; 65A0   0009 00A0 0000 0000
        DECLE   $0000,  $00C3,  $0065,  $0000   ; 65A4   0000 00C3 0065 0000
        DECLE   $0000,  $0000,  $0000,  $00E3   ; 65A8   0000 0000 0000 00E3
        DECLE   $0067,  $00F3,  $0063,  $0003   ; 65AC   0067 00F3 0063 0003
        DECLE   $0000                           ; 65B0   0000

        MOVR    R5,     R4                      ; 65B1   00AC
        SLLC    R0,     1                       ; 65B2   0058
        NEGR    R2                              ; 65B3   0022
        SLR     R0,     2                       ; 65B4   0064
        DIS                                     ; 65B5   0003
        SUB     .STIC.X.1,R0                    ; 65B6   0300 0001
        SAR     R2,     2                       ; 65B8   006E
        MOVR    R5,     R4                      ; 65B9   00AC
        SLLC    R0,     1                       ; 65BA   0058
        MOVR    R2,     R0                      ; 65BB   0090
        SAR     R2,     2                       ; 65BC   006E
        NEGR    R2                              ; 65BD   0022
        SLR     R0,     2                       ; 65BE   0064
        DIS                                     ; 65BF   0003
        SUBR    R0,     R0                      ; 65C0   0100
        MOVR    R6,     R1                      ; 65C1   00B1
        SAR     R2,     2                       ; 65C2   006E
        ADDR    R4,     R3                      ; 65C3   00E3
        SLR     R3,     2                       ; 65C4   0067
        MOVR    R4,     R7                      ; 65C5   00A7

        DECLE   $0063,  $0001,  $020D,  $00C8   ; 65C6   0063 0001 020D 00C8
        DECLE   $006F,  $00F0,  $006F,  $00E4   ; 65CA   006F 00F0 006F 00E4
        DECLE   $006F,  $0066,  $006F,  $0067   ; 65CE   006F 0066 006F 0067
        DECLE   $000D,  $00E0,  $0001,  $0007   ; 65D2   000D 00E0 0001 0007
        DECLE   $0000,  $001B,  $0066,  $0000   ; 65D6   0000 001B 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DA   0000 0000 0000 0000
        DECLE   $008D,  $0000,  $0081,  $0007   ; 65DE   008D 0000 0081 0007
        DECLE   $0000,  $0023,  $0066,  $0000   ; 65E2   0000 0023 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E6   0000 0000 0000 0000
        DECLE   $00CD,  $0000,  $0048,  $0001   ; 65EA   00CD 0000 0048 0001
        DECLE   $0030,  $0031,  $0066,  $0000   ; 65EE   0030 0031 0066 0000
        DECLE   $0000,  $0000,  $0007,  $0000   ; 65F2   0000 0000 0007 0000
        DECLE   $0049,  $0000,  $0044,  $0006   ; 65F6   0049 0000 0044 0006
        DECLE   $0000,  $0039,  $0066,  $0002   ; 65FA   0000 0039 0066 0002
        DECLE   $0000,  $0005,  $00FE,  $0000   ; 65FE   0000 0005 00FE 0000
        DECLE   $0088,  $0000,  $0000,  $0007   ; 6602   0088 0000 0000 0007
        DECLE   $0000,  $0041,  $0066,  $0020   ; 6606   0000 0041 0066 0020
        DECLE   $0000,  $0000,  $0000,  $005F   ; 660A   0000 0000 0000 005F
        DECLE   $005F,  $004A,  $0064,  $0001   ; 660E   005F 004A 0064 0001
        DECLE   $0200,  $0053,  $006D,  $0050   ; 6612   0200 0053 006D 0050
        DECLE   $005F,  $0059,  $0064,  $0001   ; 6616   005F 0059 0064 0001
        DECLE   $0000,  $008E,  $005F,  $003A   ; 661A   0000 008E 005F 003A
        DECLE   $0064,  $0001,  $0100,  $0027   ; 661E   0064 0001 0100 0027
        DECLE   $0058,  $00E3,  $0067,  $00B6   ; 6622   0058 00E3 0067 00B6
        DECLE   $0063,  $0001,  $03C0,  $00AA   ; 6626   0063 0001 03C0 00AA
        DECLE   $0057,  $00AA,  $0057,  $0092   ; 662A   0057 00AA 0057 0092
        DECLE   $0057,  $00CD,  $005A,  $00E3   ; 662E   0057 00CD 005A 00E3
        DECLE   $0067,  $00B6,  $0063,  $0001   ; 6632   0067 00B6 0063 0001
        DECLE   $0080,  $005B,  $005B,  $00DC   ; 6636   0080 005B 005B 00DC
        DECLE   $0058,  $00CD,  $0063,  $0005   ; 663A   0058 00CD 0063 0005

        B       L_66EC                          ; 663E   0200 00AC

        SLLC    R0,     1                       ; 6640   0058
L_6641:
        SLR     R3,     1                       ; 6641   0063
        DECLE   $005B,  $0067,  $0064,  $0005   ; 6642   005B 0067 0064 0005
        DECLE   $0000                           ; 6646   0000
L_6647:
        JSR     R5,     L_6714                  ; 6647   0004 0164 0314

        MVII    #$02B4, R1                      ; 664A   02B9 02B4
        MVII    #$0190, R3                      ; 664C   02BB 0190
L_664E:
        MVI@    R3,     R2                      ; 664E   029A
        TSTR    R2                              ; 664F   0092
        BEQ     L_670B                          ; 6650   0204 00B9

        CMPI    #$007F, R2                      ; 6652   037A 007F
        BGT     L_66AA                          ; 6654   020E 0054

        DECR    R2                              ; 6656   0012
        BNEQ    L_670B                          ; 6657   020C 00B2

        ADDI    #$0014, R1                      ; 6659   02F9 0014
        MVI@    R1,     R0                      ; 665B   0288
        SDBD                                    ; 665C   0001
        CMPI    #$0200, R0                      ; 665D   0378 0000 0002
        BEQ     L_666E                          ; 6660   0204 000C

        MVII    #$0004, R0                      ; 6662   02B8 0004

        JSR     R5,     X_RAND2                 ; 6664   0004 0114 029E

L_6667:
        ADDI    #$0003, R0                      ; 6667   02F8 0003
        MOVR    R0,     R2                      ; 6669   0082
        SUBI    #$0014, R1                      ; 666A   0339 0014
        B       L_670B                          ; 666C   0200 009D

L_666E:
        PSHR    R3                              ; 666E   0273
        SUBI    #$0188, R3                      ; 666F   033B 0188
        NEGR    R3                              ; 6671   0023
        ADDI    #$000B, R3                      ; 6672   02FB 000B
        CMP     G_01A8, R3                      ; 6674   0343 01A8
        PULR    R3                              ; 6676   02B3
        BGT     L_6685                          ; 6677   020E 000C

        MVI     G_01AD, R0                      ; 6679   0280 01AD
        CMPI    #$0007, R0                      ; 667B   0378 0007
        BEQ     L_6667                          ; 667D   0224 0017

        JSR     R5,     X_RAND2                 ; 667F   0004 0114 029E

        TSTR    R0                              ; 6682   0080
        BNEQ    L_6667                          ; 6683   022C 001D

L_6685:
        SDBD                                    ; 6685   0001
        MVII    #$1A19, R0                      ; 6686   02B8 0019 001A
        MVO@    R0,     R1                      ; 6689   0248
        SUBI    #$0014, R1                      ; 668A   0339 0014
        MVII    #$0001, R0                      ; 668C   02B8 0001

        JSR     R5,     X_RAND1                 ; 668E   0004 0114 027D

        TSTR    R0                              ; 6691   0080
        BNEQ    L_669D                          ; 6692   020C 0009

        SDBD                                    ; 6694   0001
        MVII    #$8A8F, R0                      ; 6695   02B8 008F 008A
        MVO@    R0,     R1                      ; 6698   0248
        MVII    #$0080, R2                      ; 6699   02BA 0080
        B       L_66A4                          ; 669B   0200 0007

L_669D:
        SDBD                                    ; 669D   0001
        MVII    #$8AB7, R0                      ; 669E   02B8 00B7 008A
        MVO@    R0,     R1                      ; 66A1   0248
        MVII    #$0082, R2                      ; 66A2   02BA 0082
L_66A4:
        INCR    R3                              ; 66A4   000B
        CLRR    R0                              ; 66A5   01C0
        MVO@    R0,     R3                      ; 66A6   0258
        DECR    R3                              ; 66A7   0013
        B       L_670B                          ; 66A8   0200 0061

L_66AA:
        SARC    R2,     1                       ; 66AA   007A
        BC      L_66D2                          ; 66AB   0201 0025

        MVII    #$0007, R0                      ; 66AD   02B8 0007

        JSR     R5,     X_RAND2                 ; 66AF   0004 0114 029E

        SAR     R0,     2                       ; 66B2   006C
        BNEQ    L_66D2                          ; 66B3   020C 001D

        MVII    #$0005, R0                      ; 66B5   02B8 0005
        SARC    R2,     1                       ; 66B7   007A
        BNC     L_66BB                          ; 66B8   0209 0001

        DECR    R0                              ; 66BA   0010

L_66BB:
        JSR     R5,     X_RAND2                 ; 66BB   0004 0114 029E

        SLL     R0,     2                       ; 66BE   004C
        SLL     R0,     1                       ; 66BF   0048
        SDBD                                    ; 66C0   0001
        ADDI    #$8A97, R0                      ; 66C1   02F8 0097 008A
        MVO@    R0,     R1                      ; 66C4   0248
        ADDI    #$0014, R1                      ; 66C5   02F9 0014
        SDBD                                    ; 66C7   0001
        MVII    #$1A29, R0                      ; 66C8   02B8 0029 001A
        MVO@    R0,     R1                      ; 66CB   0248
        SUBI    #$0014, R1                      ; 66CC   0339 0014
        MVII    #$0081, R2                      ; 66CE   02BA 0081
        B       L_670B                          ; 66D0   0200 0039

L_66D2:
        ADDI    #$0014, R1                      ; 66D2   02F9 0014
        SDBD                                    ; 66D4   0001
        MVII    #$1A21, R0                      ; 66D5   02B8 0021 001A
        MVO@    R0,     R1                      ; 66D8   0248
        SUBI    #$0014, R1                      ; 66D9   0339 0014
        MVII    #$0001, R0                      ; 66DB   02B8 0001

        JSR     R5,     X_RAND1                 ; 66DD   0004 0114 027D

        TSTR    R0                              ; 66E0   0080
        BEQ     L_66F2                          ; 66E1   0204 000F

        INCR    R1                              ; 66E3   0009
        MVI@    R1,     R0                      ; 66E4   0288
        DECR    R1                              ; 66E5   0011
        SDBD                                    ; 66E6   0001
        CMPI    #$8A97, R0                      ; 66E7   0378 0097 008A
        BEQ     L_66F2                          ; 66EA   0204 0006

L_66EC:
        SDBD                                    ; 66EC   0001
        MVII    #$8A97, R0                      ; 66ED   02B8 0097 008A
        B       L_66F6                          ; 66F0   0200 0004

L_66F2:
        SDBD                                    ; 66F2   0001
        MVII    #$8A87, R0                      ; 66F3   02B8 0087 008A
L_66F6:
        MVO@    R0,     R1                      ; 66F6   0248
        MVI     G_01AD, R0                      ; 66F7   0280 01AD
        ADDI    #$0005, R0                      ; 66F9   02F8 0005
        PSHR    R0                              ; 66FB   0270

        JSR     R5,     X_RAND2                 ; 66FC   0004 0114 029E

        ADDI    #$0005, R0                      ; 66FF   02F8 0005
        MOVR    R0,     R2                      ; 6701   0082
        PULR    R0                              ; 6702   02B0

        JSR     R5,     X_RAND2                 ; 6703   0004 0114 029E

        ADDI    #$0005, R0                      ; 6706   02F8 0005
        INCR    R3                              ; 6708   000B
        MVO@    R0,     R3                      ; 6709   0258
        DECR    R3                              ; 670A   0013
L_670B:
        MVO@    R2,     R3                      ; 670B   025A
        DECR    R3                              ; 670C   0013
        SUBI    #$0014, R1                      ; 670D   0339 0014
        CMPI    #$0214, R1                      ; 670F   0379 0214
        BGE     L_664E                          ; 6711   022D 00C4
        PULR    R7                              ; 6713   02B7

L_6714:
        SDBD                                    ; 6714   0001
        MVII    #$0200, R0                      ; 6715   02B8 0000 0002
        MVII    #$0200, R1                      ; 6718   02B9 0200
L_671A:
        MVO@    R0,     R1                      ; 671A   0248
        ADDI    #$0014, R1                      ; 671B   02F9 0014
        CMPI    #$02DC, R1                      ; 671D   0379 02DC
        BLE     L_671A                          ; 671F   0226 0006
        MOVR    R5,     R7                      ; 6721   00AF

L_6722:
        PSHR    R5                              ; 6722   0275
        MVII    #$0008, R3                      ; 6723   02BB 0008
        MVO     R3,     G_01BF                  ; 6725   0243 01BF
        MVI     .BTAB.DD,R3                     ; 6727   0283 02DD
        CMPI    #$0200, R3                      ; 6729   037B 0200
        BEQ     L_6647                          ; 672B   0224 00E5

        MVI     G_033E, R4                      ; 672D   0284 033E
        TSTR    R4                              ; 672F   00A4
        BEQ     L_6735                          ; 6730   0204 0003

        JSR     R5,     L_6796                  ; 6732   0004 0164 0396

L_6735:
        MVII    #$01FF, R1                      ; 6735   02B9 01FF
        SDBD                                    ; 6737   0001
        MVII    #$3200, R0                      ; 6738   02B8 0000 0032
        MVII    #$0002, R2                      ; 673B   02BA 0002
L_673D:
        ADDI    #$0014, R1                      ; 673D   02F9 0014
        MVO@    R0,     R1                      ; 673F   0248
        DECR    R2                              ; 6740   0012
        BNEQ    L_673D                          ; 6741   022C 0005

        CMPI    #$02C8, R1                      ; 6743   0379 02C8
        BGT     L_674F                          ; 6745   020E 0008

        SDBD                                    ; 6747   0001
        MVII    #$2600, R0                      ; 6748   02B8 0000 0026
        MVII    #$000A, R2                      ; 674B   02BA 000A
        B       L_673D                          ; 674D   0220 0011

L_674F:
        MVI     G_0193, R3                      ; 674F   0283 0193
        ANDI    #$00FF, R3                      ; 6751   03BB 00FF
L_6753:
        SUBI    #$0014, R1                      ; 6753   0339 0014
        CMPI    #$023C, R1                      ; 6755   0379 023C
        BLE     L_6793                          ; 6757   0206 003A

        SARC    R3,     1                       ; 6759   007B
        BNC     L_6763                          ; 675A   0209 0007

L_675C:
        SDBD                                    ; 675C   0001
        MVII    #$2E13, R0                      ; 675D   02B8 0013 002E
        MVO@    R0,     R1                      ; 6760   0248
        B       L_678F                          ; 6761   0200 002C

L_6763:
        MVI     G_01A2, R4                      ; 6763   0284 01A2
        TSTR    R4                              ; 6765   00A4
        BNEQ    L_678F                          ; 6766   020C 0027

        MVI     G_0187, R0                      ; 6768   0280 0187
        ANDI    #$003F, R0                      ; 676A   03B8 003F

        JSR     R5,     X_RAND2                 ; 676C   0004 0114 029E

        TSTR    R0                              ; 676F   0080
        BNEQ    L_678F                          ; 6770   020C 001D

        ADDI    #$0080, R3                      ; 6772   02FB 0080
        SDBD                                    ; 6774   0001
        MVII    #$2E0B, R0                      ; 6775   02B8 000B 002E
        MVO@    R0,     R1                      ; 6778   0248
        CMPI    #$0250, R1                      ; 6779   0379 0250
        BLE     L_6793                          ; 677B   0206 0016

        SUBI    #$0014, R1                      ; 677D   0339 0014
        SARC    R3,     1                       ; 677F   007B
        BC      L_675C                          ; 6780   0221 0025

        MVII    #$0004, R0                      ; 6782   02B8 0004

        JSR     R5,     X_RAND2                 ; 6784   0004 0114 029E

        TSTR    R0                              ; 6787   0080
        BNEQ    L_678F                          ; 6788   020C 0005

        SDBD                                    ; 678A   0001
        MVII    #$2E03, R0                      ; 678B   02B8 0003 002E
        MVO@    R0,     R1                      ; 678E   0248
L_678F:
        ANDI    #$007F, R3                      ; 678F   03BB 007F
        B       L_6753                          ; 6791   0220 003F

L_6793:
        MVO     R3,     G_0193                  ; 6793   0243 0193
        PULR    R7                              ; 6795   02B7

L_6796:
        PSHR    R5                              ; 6796   0275
        MVII    #$023C, R2                      ; 6797   02BA 023C
        CLRR    R1                              ; 6799   01C9
L_679A:
        MVI@    R2,     R0                      ; 679A   0290
        SDBD                                    ; 679B   0001
        CMPI    #$2E0B, R0                      ; 679C   0378 000B 002E
        BNEQ    L_67A2                          ; 679F   020C 0001

        INCR    R1                              ; 67A1   0009
L_67A2:
        ADDI    #$0014, R2                      ; 67A2   02FA 0014
        CMPI    #$02DC, R2                      ; 67A4   037A 02DC
        BLT     L_679A                          ; 67A6   0225 000D

        JSR     R5,     L_5C99                  ; 67A8   0004 015C 0099

        PULR    R7                              ; 67AB   02B7

        MVII    #$0001, R0                      ; 67AC   02B8 0001
        INCR    R7                              ; 67AE   000F

        CLRR    R0                              ; 67AF   01C0
L_67B0:
        PSHR    R5                              ; 67B0   0275
        ADDI    #$032D, R2                      ; 67B1   02FA 032D
        MOVR    R2,     R1                      ; 67B3   0091

        JSR     R5,     L_5B7D                  ; 67B4   0004 0158 037D

        ADDI    #$0010, R1                      ; 67B7   02F9 0010
        MVI@    R1,     R0                      ; 67B9   0288
        SDBD                                    ; 67BA   0001
        ANDI    #$1FFF, R0                      ; 67BB   03B8 00FF 001F
        MVI@    R2,     R3                      ; 67BE   0293
        SDBD                                    ; 67BF   0001
        CMPI    #$2600, R3                      ; 67C0   037B 0000 0026
        BNEQ    L_67CD                          ; 67C3   020C 0008

        DECR    R2                              ; 67C5   0012
        MVI@    R2,     R3                      ; 67C6   0293
        SDBD                                    ; 67C7   0001
        CMPI    #$2600, R3                      ; 67C8   037B 0000 0026
        BEQ     L_67D1                          ; 67CB   0204 0004

L_67CD:
        SDBD                                    ; 67CD   0001
        XORI    #$2000, R0                      ; 67CE   03F8 0000 0020
L_67D1:
        MVO@    R0,     R1                      ; 67D1   0248
        PULR    R7                              ; 67D2   02B7

        MVI     G_0325, R1                      ; 67D3   0281 0325
        ADDI    #$0008, R1                      ; 67D5   02F9 0008
        ANDI    #$00FF, R1                      ; 67D7   03B9 00FF
        CMPI    #$0009, R1                      ; 67D9   0379 0009
        BGT     L_67E3                          ; 67DB   020E 0006

        SDBD                                    ; 67DD   0001
        MVII    #$0FDC, R1                      ; 67DE   02B9 00DC 000F
        MVO     R1,     G_0325                  ; 67E1   0241 0325
L_67E3:
        MOVR    R5,     R7                      ; 67E3   00AF

L_67E4:
        MVI@    R1,     R0                      ; 67E4   0288
        SDBD                                    ; 67E5   0001
        ANDI    #$FF00, R0                      ; 67E6   03B8 0000 00FF
        ADDI    #$00A7, R0                      ; 67E9   02F8 00A7
        MVO@    R0,     R1                      ; 67EB   0248
        ADDI    #$0008, R1                      ; 67EC   02F9 0008
        PSHR    R1                              ; 67EE   0271
        MVI@    R1,     R1                      ; 67EF   0289
        SDBD                                    ; 67F0   0001
        ANDI    #$FF80, R1                      ; 67F1   03B9 0080 00FF
        MVI     G_032E, R0                      ; 67F4   0280 032E
        ANDI    #$0007, R0                      ; 67F6   03B8 0007
        ADDR    R1,     R0                      ; 67F8   00C8
        PULR    R1                              ; 67F9   02B1
        MVO@    R0,     R1                      ; 67FA   0248
        MOVR    R5,     R7                      ; 67FB   00AF

        PSHR    R5                              ; 67FC   0275
        MVI     G_0325, R1                      ; 67FD   0281 0325
        ANDI    #$00FF, R1                      ; 67FF   03B9 00FF
        CMPI    #$00C8, R1                      ; 6801   0379 00C8
        BLT     L_6812                          ; 6803   0205 000D

        CMPI    #$00F0, R1                      ; 6805   0379 00F0
        BGT     L_6812                          ; 6807   020E 0009

        MVII    #$0325, R1                      ; 6809   02B9 0325

        JSR     R5,     L_67E4                  ; 680B   0004 0164 03E4

        MVII    #$0048, R0                      ; 680E   02B8 0048
        ADD@    R1,     R0                      ; 6810   02C8
        MVO@    R0,     R1                      ; 6811   0248
L_6812:
        MVII    #$0328, R1                      ; 6812   02B9 0328
L_6814:
        MVI@    R1,     R0                      ; 6814   0288
        ANDI    #$00FF, R0                      ; 6815   03B8 00FF
        CMPI    #$00C8, R0                      ; 6817   0378 00C8
        BLT     L_6839                          ; 6819   0205 001E

        JSR     R5,     L_67E4                  ; 681B   0004 0164 03E4

        MVII    #$0334, R0                      ; 681E   02B8 0334
        SUBR    R1,     R0                      ; 6820   0108
        SLL     R0,     2                       ; 6821   004C
        ADDR    R0,     R7                      ; 6822   00C7

        MVII    #$0041, R0                      ; 6823   02B8 0041
        B       L_6835                          ; 6825   0200 000E

        MVII    #$0031, R0                      ; 6827   02B8 0031
        B       L_6835                          ; 6829   0200 000A

        MVII    #$0029, R0                      ; 682B   02B8 0029
        B       L_6835                          ; 682D   0200 0006

        MVII    #$0019, R0                      ; 682F   02B8 0019
        B       L_6835                          ; 6831   0200 0002

        MVII    #$0014, R0                      ; 6833   02B8 0014
L_6835:
        ADD@    R1,     R0                      ; 6835   02C8
        MVO@    R0,     R1                      ; 6836   0248
        SUBI    #$0008, R1                      ; 6837   0339 0008
L_6839:
        INCR    R1                              ; 6839   0009
        CMPI    #$032C, R1                      ; 683A   0379 032C
        BLE     L_6814                          ; 683C   0226 0029
        PULR    R7                              ; 683E   02B7

L_683F:
        PSHR    R5                              ; 683F   0275

        JSR     R5,     L_68AA                  ; 6840   0004 0168 00AA

        MVII    #$032A, R3                      ; 6843   02BB 032A
        PSHR    R4                              ; 6845   0274

        JSR     R5,     L_5BAB                  ; 6846   0004 0158 03AB

        SDBD                                    ; 6849   0001
        MVII    #$6557, R2                      ; 684A   02BA 0057 0065
        MVO     R2,     G_0342                  ; 684D   0242 0342
        MVII    #$00FB, R2                      ; 684F   02BA 00FB
        MVO     R2,     G_0130                  ; 6851   0242 0130
        MVII    #$0129, R2                      ; 6853   02BA 0129
        MVO     R2,     G_0332                  ; 6855   0242 0332
        MVII    #$032B, R3                      ; 6857   02BB 032B
        PULR    R4                              ; 6859   02B4
        PSHR    R4                              ; 685A   0274

        JSR     R5,     L_5BAB                  ; 685B   0004 0158 03AB

        SDBD                                    ; 685E   0001
        MVII    #$654F, R2                      ; 685F   02BA 004F 0065
        MVO     R2,     G_0343                  ; 6862   0242 0343
        MVII    #$00F9, R2                      ; 6864   02BA 00F9
        MVO     R2,     G_0132                  ; 6866   0242 0132
        SDBD                                    ; 6868   0001
        MVII    #$0631, R2                      ; 6869   02BA 0031 0006
        MVO     R2,     G_0333                  ; 686C   0242 0333
        MVII    #$032C, R3                      ; 686E   02BB 032C
        PULR    R4                              ; 6870   02B4
        PSHR    R4                              ; 6871   0274

        JSR     R5,     L_5BAB                  ; 6872   0004 0158 03AB

        SDBD                                    ; 6875   0001
        MVII    #$655F, R2                      ; 6876   02BA 005F 0065
        MVO     R2,     G_0344                  ; 6879   0242 0344
        MVII    #$00F6, R2                      ; 687B   02BA 00F6
        MVO     R2,     G_0134                  ; 687D   0242 0134
        MVII    #$01C1, R2                      ; 687F   02BA 01C1
        MVO     R2,     G_0334                  ; 6881   0242 0334
        MVII    #$0325, R3                      ; 6883   02BB 0325
        PULR    R4                              ; 6885   02B4

        JSR     R5,     L_5BAB                  ; 6886   0004 0158 03AB

        SDBD                                    ; 6889   0001
        MVII    #$6567, R2                      ; 688A   02BA 0067 0065
        MVO     R2,     G_033D                  ; 688D   0242 033D
        MVII    #$00F0, R2                      ; 688F   02BA 00F0
        MVO     R2,     G_0126                  ; 6891   0242 0126
        SDBD                                    ; 6893   0001
        MVII    #$06C8, R2                      ; 6894   02BA 00C8 0006
        MVO     R2,     G_032D                  ; 6897   0242 032D
        MVI     G_0325, R2                      ; 6899   0282 0325
        SDBD                                    ; 689B   0001
        ADDI    #$0423, R2                      ; 689C   02FA 0023 0004
        MVO     R2,     G_0325                  ; 689F   0242 0325
        MVI     G_0335, R2                      ; 68A1   0282 0335
        SDBD                                    ; 68A3   0001
        ANDI    #$DFFF, R2                      ; 68A4   03BA 00FF 00DF
        MVO     R2,     G_0335                  ; 68A7   0242 0335
        PULR    R7                              ; 68A9   02B7

L_68AA:
        PSHR    R5                              ; 68AA   0275
L_68AB:
        MVII    #$0328, R3                      ; 68AB   02BB 0328
        SDBD                                    ; 68AD   0001
        MVII    #$6537, R4                      ; 68AE   02BC 0037 0065
        PSHR    R4                              ; 68B1   0274

        JSR     R5,     L_5BAB                  ; 68B2   0004 0158 03AB
        JSR     R5,     L_6CD8                  ; 68B5   0004 016C 00D8

        MVII    #$0329, R3                      ; 68B8   02BB 0329
        PULR    R4                              ; 68BA   02B4
        PSHR    R4                              ; 68BB   0274

        JSR     R5,     L_5BAB                  ; 68BC   0004 0158 03AB

        PULR    R4                              ; 68BF   02B4
        SDBD                                    ; 68C0   0001
        MVII    #$6549, R2                      ; 68C1   02BA 0049 0065
        MVO     R2,     G_0341                  ; 68C4   0242 0341
        MVII    #$00FD, R2                      ; 68C6   02BA 00FD
        MVO     R2,     G_012E                  ; 68C8   0242 012E
        MVI     G_0329, R2                      ; 68CA   0282 0329
        ADDI    #$000E, R2                      ; 68CC   02FA 000E
        MVO     R2,     G_0329                  ; 68CE   0242 0329
        MVII    #$009A, R2                      ; 68D0   02BA 009A
        MVO     R2,     G_0331                  ; 68D2   0242 0331
        PULR    R7                              ; 68D4   02B7

        PSHR    R5                              ; 68D5   0275
        MVI     G_0326, R1                      ; 68D6   0281 0326
        ANDI    #$00FF, R1                      ; 68D8   03B9 00FF
        CMPI    #$0050, R1                      ; 68DA   0379 0050
        BGT     L_68EF                          ; 68DC   020E 0011

        SDBD                                    ; 68DE   0001
        MVII    #$0B10, R1                      ; 68DF   02B9 0010 000B
        DIS                                     ; 68E2   0003
        SUB     G_0106, R1                      ; 68E3   0301 0106
        MVO     R1,     G_0326                  ; 68E5   0241 0326
        EIS                                     ; 68E7   0002
        MVII    #$0020, R0                      ; 68E8   02B8 0020
        MVO     R0,     G_0346                  ; 68EA   0240 0346

        JSR     R5,     L_5D28                  ; 68EC   0004 015C 0128

L_68EF:
        MVII    #$0128, R3                      ; 68EF   02BB 0128

        JSR     R5,     L_5C0B                  ; 68F1   0004 015C 000B

        PULR    R7                              ; 68F4   02B7

        PSHR    R5                              ; 68F5   0275
        MVII    #$0001, R2                      ; 68F6   02BA 0001
        CLRR    R3                              ; 68F8   01DB
        MOVR    R2,     R4                      ; 68F9   0094

        JSR     R5,     L_5998                  ; 68FA   0004 0158 0198

        CLRR    R3                              ; 68FD   01DB
        TSTR    R1                              ; 68FE   0089
        BEQ     L_6905                          ; 68FF   0204 0004

        SDBD                                    ; 6901   0001
        MVII    #$2000, R3                      ; 6902   02BB 0000 0020
L_6905:
        MVI@    R2,     R0                      ; 6905   0290
        SDBD                                    ; 6906   0001
        CMPI    #$2E03, R0                      ; 6907   0378 0003 002E
        BNEQ    L_6912                          ; 690A   020C 0006

        SDBD                                    ; 690C   0001
        MVII    #$2000, R3                      ; 690D   02BB 0000 0020
        B       L_6924                          ; 6910   0200 0012

L_6912:
        SDBD                                    ; 6912   0001
        CMPI    #$2E0B, R0                      ; 6913   0378 000B 002E
        BEQ     L_691E                          ; 6916   0204 0006

        SDBD                                    ; 6918   0001
        CMPI    #$2E13, R0                      ; 6919   0378 0013 002E
        BNEQ    L_6924                          ; 691C   020C 0006

L_691E:
        JSR     R5,     L_692E                  ; 691E   0004 0168 012E

        TSTR    R1                              ; 6921   0089
        BEQ     L_697F                          ; 6922   0204 005B

L_6924:
        MVI     G_0336, R1                      ; 6924   0281 0336
        SDBD                                    ; 6926   0001
        ANDI    #$DFFF, R1                      ; 6927   03B9 00FF 00DF
        XORR    R3,     R1                      ; 692A   01D9
        MVO     R1,     G_0336                  ; 692B   0241 0336
        PULR    R7                              ; 692D   02B7

L_692E:
        PSHR    R5                              ; 692E   0275
        MVI     G_0347, R1                      ; 692F   0281 0347
        TSTR    R1                              ; 6931   0089
        BNEQ    L_6936                          ; 6932   020C 0002

L_6934:
        CLRR    R1                              ; 6934   01C9
        PULR    R7                              ; 6935   02B7

L_6936:
        MVI     G_032E, R1                      ; 6936   0281 032E
        SDBD                                    ; 6938   0001
        ANDI    #$0400, R1                      ; 6939   03B9 0000 0004
        BNEQ    L_6934                          ; 693C   022C 0009

        JSR     R5,     L_6944                  ; 693E   0004 0168 0144

        MVII    #$00FF, R1                      ; 6941   02B9 00FF
        PULR    R7                              ; 6943   02B7

L_6944:
        PSHR    R5                              ; 6944   0275
        MVO     R5,     G_01A7                  ; 6945   0245 01A7
        MVI@    R2,     R1                      ; 6947   0291
        SDBD                                    ; 6948   0001
        CMPI    #$2E0B, R1                      ; 6949   0379 000B 002E
        BNEQ    L_696B                          ; 694C   020C 001D

L_694E:
        SDBD                                    ; 694E   0001
        MVII    #$2F00, R1                      ; 694F   02B9 0000 002F
        MVO@    R1,     R2                      ; 6952   0251
        INCR    R2                              ; 6953   000A
        ADDI    #$0008, R1                      ; 6954   02F9 0008
        MVO@    R1,     R2                      ; 6956   0251
        SUBI    #$0015, R2                      ; 6957   033A 0015
        MVI@    R2,     R1                      ; 6959   0291
        SDBD                                    ; 695A   0001
        CMPI    #$2E03, R1                      ; 695B   0379 0003 002E
        BNEQ    L_6965                          ; 695E   020C 0005

        SDBD                                    ; 6960   0001
        MVII    #$2600, R1                      ; 6961   02B9 0000 0026
        MVO@    R1,     R2                      ; 6964   0251
L_6965:
        MVI     G_0194, R1                      ; 6965   0281 0194
        TSTR    R1                              ; 6967   0089
        BEQ     L_69E8                          ; 6968   0204 007E
        PULR    R7                              ; 696A   02B7

L_696B:
        SDBD                                    ; 696B   0001
        CMPI    #$2F00, R1                      ; 696C   0379 0000 002F
        BGT     L_697D                          ; 696F   020E 000C

        DECR    R2                              ; 6971   0012
        MOVR    R2,     R1                      ; 6972   0091
        PSHR    R2                              ; 6973   0272
        MVII    #$0014, R2                      ; 6974   02BA 0014

        JSR     R5,     X_DIV                   ; 6976   0004 011C 01FB

        PULR    R2                              ; 6979   02B2
        TSTR    R1                              ; 697A   0089
        BNEQ    L_694E                          ; 697B   022C 002E
L_697D:
        PULR    R7                              ; 697D   02B7

        PSHR    R5                              ; 697E   0275
L_697F:
        CLRR    R0                              ; 697F   01C0
        MVO     R0,     G_0183                  ; 6980   0240 0183
        MVO     R0,     G_0128                  ; 6982   0240 0128
        MVO     R0,     G_0138                  ; 6984   0240 0138
        MVII    #$0326, R1                      ; 6986   02B9 0326
        MVI@    R1,     R0                      ; 6988   0288
        SDBD                                    ; 6989   0001
        MVII    #$8100, R2                      ; 698A   02BA 0000 0081
        XORR    R2,     R0                      ; 698D   01D0
        MVO@    R0,     R1                      ; 698E   0248
        INCR    R1                              ; 698F   0009
        MVI@    R1,     R0                      ; 6990   0288
        XORR    R2,     R0                      ; 6991   01D0
        MVO@    R0,     R1                      ; 6992   0248
        ADDI    #$000F, R1                      ; 6993   02F9 000F
        MVI@    R1,     R0                      ; 6995   0288
        SDBD                                    ; 6996   0001
        ANDI    #$FFF8, R0                      ; 6997   03B8 00F8 00FF
        XORI    #$0002, R0                      ; 699A   03F8 0002
        MVO@    R0,     R1                      ; 699C   0248
        INCR    R1                              ; 699D   0009
        MVI@    R1,     R0                      ; 699E   0288
        SDBD                                    ; 699F   0001
        ANDI    #$FFF8, R0                      ; 69A0   03B8 00F8 00FF
        MVO@    R0,     R1                      ; 69A3   0248
        MVI     G_0194, R1                      ; 69A4   0281 0194
        TSTR    R1                              ; 69A6   0089
        BEQ     L_69B2                          ; 69A7   0204 0009

        CLRR    R1                              ; 69A9   01C9
        MVO     R1,     G_019D                  ; 69AA   0241 019D

        JSR     R5,     L_6B7C                  ; 69AC   0004 0168 037C
        JSR     R5,     L_68AA                  ; 69AF   0004 0168 00AA
L_69B2:
        JSR     R5,     L_5CDF                  ; 69B2   0004 015C 00DF

        TSTR    R1                              ; 69B5   0089
        BMI     L_69CC                          ; 69B6   020B 0014

        MVI     G_01A6, R1                      ; 69B8   0281 01A6
        TSTR    R1                              ; 69BA   0089
        BNEQ    L_69CC                          ; 69BB   020C 000F

        MVO     R7,     G_01A2                  ; 69BD   0247 01A2

        JSR     R5,     L_5B2E                  ; 69BF   0004 0158 032E
        DECLE   $0040                           ; 69C2   0040

        CLRR    R0                              ; 69C3   01C0
        MVO     R0,     G_01A2                  ; 69C4   0240 01A2
        INCR    R0                              ; 69C6   0008
        MVO     R0,     G_0183                  ; 69C7   0240 0183

        JSR     R5,     L_5BA1                  ; 69C9   0004 0158 03A1

L_69CC:
        PULR    R7                              ; 69CC   02B7

L_69CD:
        PSHR    R5                              ; 69CD   0275
L_69CE:
        MVO     R7,     G_01A2                  ; 69CE   0247 01A2
        MVO     R7,     G_01A6                  ; 69D0   0247 01A6
        MVI     G_0194, R0                      ; 69D2   0280 0194
        TSTR    R0                              ; 69D4   0080
        BNEQ    L_6A35                          ; 69D5   020C 005E

        JSR     R5,     L_5B2E                  ; 69D7   0004 0158 032E
        DECLE   $0040                           ; 69DA   0040

        JSR     R5,     L_5598                  ; 69DB   0004 0154 0198
        JSR     R5,     L_5CA5                  ; 69DE   0004 015C 00A5

        CLRR    R0                              ; 69E1   01C0
        MVO     R0,     G_0108                  ; 69E2   0240 0108
        MVO     R0,     G_0106                  ; 69E4   0240 0106
        INCR    R7                              ; 69E6   000F

        PSHR    R5                              ; 69E7   0275
L_69E8:
        MVII    #$00FF, R1                      ; 69E8   02B9 00FF
        MVO     R1,     G_0194                  ; 69EA   0241 0194

        JSR     R5,     L_5B2E                  ; 69EC   0004 0158 032E
        DECLE   $0014                           ; 69EF   0014

        JSR     R5,     L_68AA                  ; 69F0   0004 0168 00AA

        SDBD                                    ; 69F3   0001
        MVII    #$0F90, R2                      ; 69F4   02BA 0090 000F
        CLRR    R3                              ; 69F7   01DB
        MVI     G_0326, R1                      ; 69F8   0281 0326
        ANDI    #$00FF, R1                      ; 69FA   03B9 00FF
        CMPI    #$0058, R1                      ; 69FC   0379 0058
        BLT     L_6A06                          ; 69FE   0205 0006

        SUBI    #$0040, R2                      ; 6A00   033A 0040
        SDBD                                    ; 6A02   0001
        ADDI    #$0400, R3                      ; 6A03   02FB 0000 0004
L_6A06:
        CLRR    R0                              ; 6A06   01C0
        MVO     R0,     G_012C                  ; 6A07   0240 012C
        MVO     R0,     G_012E                  ; 6A09   0240 012E
        MVII    #$0328, R4                      ; 6A0B   02BC 0328
        MVO@    R2,     R4                      ; 6A0D   0262
        SDBD                                    ; 6A0E   0001
        XORI    #$0400, R2                      ; 6A0F   03FA 0000 0004
        MVO@    R2,     R4                      ; 6A12   0262
        ADDI    #$0190, R3                      ; 6A13   02FB 0190
        ADDI    #$0006, R4                      ; 6A15   02FC 0006
        MVO@    R3,     R4                      ; 6A17   0263
        XORI    #$0108, R3                      ; 6A18   03FB 0108
        MVO@    R3,     R4                      ; 6A1A   0263
        ADDI    #$001E, R4                      ; 6A1B   02FC 001E
        MVII    #$0023, R3                      ; 6A1D   02BB 0023
        MVO@    R3,     R4                      ; 6A1F   0263
        MVO@    R3,     R4                      ; 6A20   0263
        SDBD                                    ; 6A21   0001
        MVII    #$651B, R2                      ; 6A22   02BA 001B 0065
        MVO     R2,     G_0340                  ; 6A25   0242 0340
        MVII    #$0030, R2                      ; 6A27   02BA 0030
        MVO     R2,     G_0348                  ; 6A29   0242 0348
        MVI     G_0338, R2                      ; 6A2B   0282 0338
        SDBD                                    ; 6A2D   0001
        ANDI    #$DFF8, R2                      ; 6A2E   03BA 00F8 00DF
        XORI    #$0007, R2                      ; 6A31   03FA 0007
        MVO     R2,     G_0338                  ; 6A33   0242 0338
L_6A35:
        PULR    R7                              ; 6A35   02B7

        MVI     G_0348, R2                      ; 6A36   0282 0348
        SDBD                                    ; 6A38   0001
        ANDI    #$FFF8, R2                      ; 6A39   03BA 00F8 00FF
        BEQ     L_6A44                          ; 6A3C   0204 0006

        MVO     R2,     G_0348                  ; 6A3E   0242 0348
        MVII    #$0023, R2                      ; 6A40   02BA 0023
        MVO     R2,     G_0350                  ; 6A42   0242 0350
L_6A44:
        MOVR    R5,     R7                      ; 6A44   00AF

        PSHR    R5                              ; 6A45   0275
        MVII    #$0210, R2                      ; 6A46   02BA 0210
        MVO     R2,     G_0331                  ; 6A48   0242 0331

        JSR     R5,     L_5B2E                  ; 6A4A   0004 0158 032E
        DECLE   $000A                           ; 6A4D   000A

        MVI     G_0329, R2                      ; 6A4E   0282 0329
        SDBD                                    ; 6A50   0001
        XORI    #$0400, R2                      ; 6A51   03FA 0000 0004
        MVO     R2,     G_0329                  ; 6A54   0242 0329

        JSR     R5,     L_5B2E                  ; 6A56   0004 0158 032E
        DECLE   $000A                           ; 6A59   000A

        MVI     G_0339, R2                      ; 6A5A   0282 0339
        SDBD                                    ; 6A5C   0001
        ANDI    #$FFF8, R2                      ; 6A5D   03BA 00F8 00FF
        XORI    #$0002, R2                      ; 6A60   03FA 0002
        MVO     R2,     G_0339                  ; 6A62   0242 0339
        CLRR    R2                              ; 6A64   01D2
        MVO     R2,     G_0350                  ; 6A65   0242 0350
        INCR    R7                              ; 6A67   000F

        PSHR    R5                              ; 6A68   0275
L_6A69:
        MVI     G_0328, R1                      ; 6A69   0281 0328
        SDBD                                    ; 6A6B   0001
        ANDI    #$7BFF, R1                      ; 6A6C   03B9 00FF 007B
        MVI     G_0330, R2                      ; 6A6F   0282 0330
        SDBD                                    ; 6A71   0001
        MVII    #$0400, R3                      ; 6A72   02BB 0000 0004
        ANDR    R2,     R3                      ; 6A75   0193
        BEQ     L_6A7A                          ; 6A76   0204 0002

        ADDI    #$0008, R1                      ; 6A78   02F9 0008
L_6A7A:
        SDBD                                    ; 6A7A   0001
        ANDI    #$FCFF, R2                      ; 6A7B   03BA 00FF 00FC
        MVO     R2,     G_0330                  ; 6A7E   0242 0330
        MVO     R1,     G_0328                  ; 6A80   0241 0328
        CLRR    R2                              ; 6A82   01D2
        MVO     R2,     G_0348                  ; 6A83   0242 0348

        JSR     R5,     L_5B2E                  ; 6A85   0004 0158 032E
        DECLE   $0002                           ; 6A88   0002

        MVII    #$0033, R2                      ; 6A89   02BA 0033
        MVO     R2,     G_0348                  ; 6A8B   0242 0348

        JSR     R5,     L_5B2E                  ; 6A8D   0004 0158 032E
        DECLE   $0004                           ; 6A90   0004

        MVII    #$0005, R2                      ; 6A91   02BA 0005
        MVO     R2,     G_0348                  ; 6A93   0242 0348
        MVI     G_0338, R2                      ; 6A95   0282 0338
        SDBD                                    ; 6A97   0001
        ANDI    #$FFF8, R2                      ; 6A98   03BA 00F8 00FF
        SDBD                                    ; 6A9B   0001
        XORI    #$1003, R2                      ; 6A9C   03FA 0003 0010
        MVO     R2,     G_0338                  ; 6A9F   0242 0338
L_6AA1:
        MVII    #$0100, R5                      ; 6AA1   02BD 0100
        SDBD                                    ; 6AA3   0001
        MVI@    R5,     R1                      ; 6AA4   02A9
        SDBD                                    ; 6AA5   0001
        CMPI    #$51C0, R1                      ; 6AA6   0379 00C0 0051
        BNEQ    L_6AA1                          ; 6AA9   022C 0009

        SDBD                                    ; 6AAB   0001
        MVII    #$6AB3, R1                      ; 6AAC   02B9 00B3 006A

        JSR     R5,     L_5C8B                  ; 6AAF   0004 015C 008B

        PULR    R7                              ; 6AB2   02B7

        PSHR    R5                              ; 6AB3   0275
        MVO     R0,     .STIC.VIDEN             ; 6AB4   0240 0020

        JSR     R5,     L_5C87                  ; 6AB6   0004 015C 0087

        MVI     G_0194, R0                      ; 6AB9   0280 0194
        TSTR    R0                              ; 6ABB   0080
        BEQ     L_68AB                          ; 6ABC   0224 0212

        SDBD                                    ; 6ABE   0001
        MVII    #$3A5A, R1                      ; 6ABF   02B9 005A 003A
        MVII    #$021D, R4                      ; 6AC2   02BC 021D
        MVI     G_0330, R0                      ; 6AC4   0280 0330
        SDBD                                    ; 6AC6   0001
        ANDI    #$0400, R0                      ; 6AC7   03B8 0000 0004
        BNEQ    L_6AD0                          ; 6ACA   020C 0004

        SUBI    #$0020, R1                      ; 6ACC   0339 0020
        ADDI    #$0008, R4                      ; 6ACE   02FC 0008
L_6AD0:
        MVO@    R1,     R4                      ; 6AD0   0261
        ADDI    #$0008, R1                      ; 6AD1   02F9 0008
        MVO@    R1,     R4                      ; 6AD3   0261
        CMPI    #$0228, R4                      ; 6AD4   037C 0228
        BGT     L_6AE6                          ; 6AD6   020E 000E

        ADDI    #$0012, R4                      ; 6AD8   02FC 0012
        ADDI    #$0008, R1                      ; 6ADA   02F9 0008
        SDBD                                    ; 6ADC   0001
        XORI    #$3200, R1                      ; 6ADD   03F9 0000 0032
        SDBD                                    ; 6AE0   0001
        XORI    #$2600, R1                      ; 6AE1   03F9 0000 0026
        B       L_6AD0                          ; 6AE4   0220 0015

L_6AE6:
        MVII    #$0329, R3                      ; 6AE6   02BB 0329
        SDBD                                    ; 6AE8   0001
        MVII    #$6525, R4                      ; 6AE9   02BC 0025 0065
        PSHR    R3                              ; 6AEC   0273
        PSHR    R0                              ; 6AED   0270

        JSR     R5,     L_5BAB                  ; 6AEE   0004 0158 03AB

        PULR    R0                              ; 6AF1   02B0
        MVI     G_0328, R2                      ; 6AF2   0282 0328
        SDBD                                    ; 6AF4   0001
        XORI    #$8000, R2                      ; 6AF5   03FA 0000 0080
        SUB     G_0106, R2                      ; 6AF8   0302 0106
        MVO     R2,     G_0328                  ; 6AFA   0242 0328
        SDBD                                    ; 6AFC   0001
        XORI    #$0400, R0                      ; 6AFD   03F8 0000 0004
        BEQ     L_6B06                          ; 6B00   0204 0004

        MVII    #$0095, R2                      ; 6B02   02BA 0095
        B       L_6B08                          ; 6B04   0200 0002

L_6B06:
        MVII    #$0053, R2                      ; 6B06   02BA 0053
L_6B08:
        PULR    R3                              ; 6B08   02B3
        MVI@    R3,     R1                      ; 6B09   0299
        ADDR    R2,     R1                      ; 6B0A   00D1
        MVO@    R1,     R3                      ; 6B0B   0259
        ADDI    #$0008, R3                      ; 6B0C   02FB 0008
        MVI@    R3,     R1                      ; 6B0E   0299
        ADDR    R0,     R1                      ; 6B0F   00C1
        MVO@    R1,     R3                      ; 6B10   0259
        MVI     G_0108, R0                      ; 6B11   0280 0108
        TSTR    R0                              ; 6B13   0080
        BNEQ    L_6B18                          ; 6B14   020C 0002
        B       L_6D1C                          ; 6B16   0200 0204
L_6B18:
        INCR    R7                              ; 6B18   000F

L_6B19:
        PSHR    R5                              ; 6B19   0275
L_6B1A:
        MVII    #$0328, R3                      ; 6B1A   02BB 0328
        MVI@    R3,     R1                      ; 6B1C   0299
        SDBD                                    ; 6B1D   0001
        ANDI    #$7FFF, R1                      ; 6B1E   03B9 00FF 007F
        MVO@    R1,     R3                      ; 6B21   0259
        MOVR    R3,     R4                      ; 6B22   009C
        MVII    #$007F, R1                      ; 6B23   02B9 007F
        MVI     G_0326, R2                      ; 6B25   0282 0326
        ANDI    #$00FF, R2                      ; 6B27   03BA 00FF
        MVI     G_032E, R3                      ; 6B29   0283 032E
        ANDI    #$007F, R3                      ; 6B2B   03BB 007F

        JSR     R5,     L_5BE2                  ; 6B2D   0004 0158 03E2

        MVI     G_0330, R2                      ; 6B30   0282 0330
        SDBD                                    ; 6B32   0001
        ANDI    #$FBFF, R2                      ; 6B33   03BA 00FF 00FB
        TSTR    R1                              ; 6B36   0089
        BMI     L_6B3D                          ; 6B37   020B 0004

        SDBD                                    ; 6B39   0001
        XORI    #$0400, R2                      ; 6B3A   03FA 0000 0004
L_6B3D:
        MVO     R2,     G_0330                  ; 6B3D   0242 0330
        PULR    R7                              ; 6B3F   02B7

        PSHR    R5                              ; 6B40   0275
        MVI     G_0348, R0                      ; 6B41   0280 0348
        CMPI    #$0005, R0                      ; 6B43   0378 0005
        BNEQ    L_6B7B                          ; 6B45   020C 0034

        MVI     G_0341, R0                      ; 6B47   0280 0341
        TSTR    R0                              ; 6B49   0080
        BEQ     L_6B6D                          ; 6B4A   0204 0021

        MVII    #$0328, R3                      ; 6B4C   02BB 0328
        MVI@    R3,     R2                      ; 6B4E   029A
        SDBD                                    ; 6B4F   0001
        ANDI    #$FF00, R2                      ; 6B50   03BA 0000 00FF
        INCR    R3                              ; 6B53   000B
        MVI@    R3,     R1                      ; 6B54   0299
        DECR    R3                              ; 6B55   0013
        ANDI    #$00FF, R1                      ; 6B56   03B9 00FF
        ADDR    R1,     R2                      ; 6B58   00CA
        MVO@    R2,     R3                      ; 6B59   025A
        ADDI    #$0008, R3                      ; 6B5A   02FB 0008
        MVI@    R3,     R2                      ; 6B5C   029A
        SDBD                                    ; 6B5D   0001
        ANDI    #$FF80, R2                      ; 6B5E   03BA 0080 00FF
        ADDI    #$0010, R2                      ; 6B61   02FA 0010
        MVO@    R2,     R3                      ; 6B63   025A

        JSR     R5,     L_6B19                  ; 6B64   0004 0168 0319
        JSR     R5,     L_5B2E                  ; 6B67   0004 0158 032E
        DECLE   $0005                           ; 6B6A   0005

        B       L_6B7D                          ; 6B6B   0200 0010

L_6B6D:
        CLRR    R3                              ; 6B6D   01DB
        MVO     R3,     G_0328                  ; 6B6E   0243 0328
        MVI     G_01AD, R0                      ; 6B70   0280 01AD
        CMPI    #$0007, R0                      ; 6B72   0378 0007
        BEQ     L_6B79                          ; 6B74   0204 0003

        JSR     R5,     L_6D9D                  ; 6B76   0004 016C 019D

L_6B79:
        B       L_68AB                          ; 6B79   0220 02CF
L_6B7B:
        PULR    R7                              ; 6B7B   02B7

L_6B7C:
        PSHR    R5                              ; 6B7C   0275
L_6B7D:
        MVII    #$0014, R0                      ; 6B7D   02B8 0014
        SDBD                                    ; 6B7F   0001
        MVII    #$3200, R1                      ; 6B80   02B9 0000 0032
        MVII    #$0214, R4                      ; 6B83   02BC 0214

        JSR     R5,     X_FILL_MEM              ; 6B85   0004 0114 0341

        MVII    #$0014, R0                      ; 6B88   02B8 0014
        SDBD                                    ; 6B8A   0001
        MVII    #$2600, R1                      ; 6B8B   02B9 0000 0026

        JSR     R5,     X_FILL_MEM              ; 6B8E   0004 0114 0341

        CLRR    R3                              ; 6B91   01DB
        MVO     R3,     G_0329                  ; 6B92   0243 0329
        MVO     R3,     G_0341                  ; 6B94   0243 0341
        MVO     R3,     G_0194                  ; 6B96   0243 0194
        ADD     G_01A6, R3                      ; 6B98   02C3 01A6
        BNEQ    L_69CE                          ; 6B9A   022C 01CD
        PULR    R7                              ; 6B9C   02B7

        PSHR    R5                              ; 6B9D   0275
        MVII    #$012C, R3                      ; 6B9E   02BB 012C

        JSR     R5,     L_5C0B                  ; 6BA0   0004 015C 000B
        JSR     R5,     L_6B7C                  ; 6BA3   0004 0168 037C
        JSR     R5,     L_68AA                  ; 6BA6   0004 0168 00AA

        B       L_697F                          ; 6BA9   0220 022B

        PSHR    R5                              ; 6BAB   0275
L_6BAC:
        MVI     G_01AB, R0                      ; 6BAC   0280 01AB
        TSTR    R0                              ; 6BAE   0080
        BNEQ    L_6BB4                          ; 6BAF   020C 0003

        JSR     R5,     L_5CED                  ; 6BB1   0004 015C 00ED

L_6BB4:
        MVII    #$0001, R0                      ; 6BB4   02B8 0001
        MVO     R0,     G_0183                  ; 6BB6   0240 0183

        JSR     R5,     L_5B41                  ; 6BB8   0004 0158 0341

        MVII    #$0005, R2                      ; 6BBB   02BA 0005

        JSR     R5,     L_5B38                  ; 6BBD   0004 0158 0338

        MVII    #$0002, R2                      ; 6BC0   02BA 0002

        JSR     R5,     L_5B38                  ; 6BC2   0004 0158 0338
        JSR     R5,     L_5C63                  ; 6BC5   0004 015C 0063
        JSR     R5,     L_6BE2                  ; 6BC8   0004 0168 03E2
        JSR     R5,     L_6C04                  ; 6BCB   0004 016C 0004
        JSR     R5,     L_6D12                  ; 6BCE   0004 016C 0112

        CLRR    R0                              ; 6BD1   01C0
        MVO     R0,     G_01AB                  ; 6BD2   0240 01AB
        MVO     R0,     G_01AA                  ; 6BD4   0240 01AA
        MVO     R0,     G_010A                  ; 6BD6   0240 010A

        JSR     R5,     L_5BA1                  ; 6BD8   0004 0158 03A1
        JSR     R5,     L_6C1A                  ; 6BDB   0004 016C 001A
        JSR     R5,     L_683F                  ; 6BDE   0004 0168 003F

        PULR    R7                              ; 6BE1   02B7

L_6BE2:
        PSHR    R5                              ; 6BE2   0275
        SDBD                                    ; 6BE3   0001
        MVII    #$5FD8, R4                      ; 6BE4   02BC 00D8 005F
        MVII    #$02F1, R1                      ; 6BE7   02B9 02F1
        MVII    #$0007, R0                      ; 6BE9   02B8 0007

        JSR     R5,     .EXEC.730               ; 6BEB   0004 0114 0330

        MVII    #$015D, R1                      ; 6BEE   02B9 015D
        MVII    #$000E, R0                      ; 6BF0   02B8 000E

        JSR     R5,     .EXEC.730               ; 6BF2   0004 0114 0330

        MVII    #$01B3, R5                      ; 6BF5   02BD 01B3
        SDBD                                    ; 6BF7   0001
        MVII    #$648F, R4                      ; 6BF8   02BC 008F 0064
        MVII    #$0008, R2                      ; 6BFB   02BA 0008
L_6BFD:
        MVI@    R4,     R1                      ; 6BFD   02A1
        MVO@    R1,     R5                      ; 6BFE   0269
        DECR    R2                              ; 6BFF   0012
        BPL     L_6BFD                          ; 6C00   0223 0004
        B       L_6D09                          ; 6C02   0200 0105

L_6C04:
        PSHR    R5                              ; 6C04   0275
        SDBD                                    ; 6C05   0001
        MVII    #$3200, R1                      ; 6C06   02B9 0000 0032
        MVII    #$0028, R0                      ; 6C09   02B8 0028
        MVII    #$0200, R4                      ; 6C0B   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 6C0D   0004 0114 0341

        SDBD                                    ; 6C10   0001
        MVII    #$2600, R1                      ; 6C11   02B9 0000 0026
        MVII    #$00C8, R0                      ; 6C14   02B8 00C8

        JSR     R5,     X_FILL_MEM              ; 6C16   0004 0114 0341

        PULR    R7                              ; 6C19   02B7

L_6C1A:
        PSHR    R5                              ; 6C1A   0275
        MVII    #$0025, R1                      ; 6C1B   02B9 0025
        MVII    #$035E, R2                      ; 6C1D   02BA 035E
        MVO@    R1,     R2                      ; 6C1F   0251
        MVI     G_01BE, R0                      ; 6C20   0280 01BE
        MVO     R0,     G_0108                  ; 6C22   0240 0108
        MVII    #$0003, R0                      ; 6C24   02B8 0003
        MVO     R0,     G_010E                  ; 6C26   0240 010E

        JSR     R5,     L_554D                  ; 6C28   0004 0154 014D

        PULR    R7                              ; 6C2B   02B7

L_6C2C:
        PSHR    R5                              ; 6C2C   0275
        MVII    #$032B, R3                      ; 6C2D   02BB 032B
        SDBD                                    ; 6C2F   0001
        MVII    #$65D1, R4                      ; 6C30   02BC 00D1 0065

        JSR     R5,     L_5BAB                  ; 6C33   0004 0158 03AB

        MVII    #$032C, R3                      ; 6C36   02BB 032C
        SDBD                                    ; 6C38   0001
        MVII    #$65D1, R4                      ; 6C39   02BC 00D1 0065

        JSR     R5,     L_5BAB                  ; 6C3C   0004 0158 03AB

        SDBD                                    ; 6C3F   0001
        MVII    #$BFFF, R2                      ; 6C40   02BA 00FF 00BF
        MVI     G_032C, R0                      ; 6C43   0280 032C
        MVI     G_0334, R1                      ; 6C45   0281 0334
        ANDR    R2,     R0                      ; 6C47   0190
        ANDR    R2,     R1                      ; 6C48   0191
        COMR    R2                              ; 6C49   001A
        XORR    R2,     R0                      ; 6C4A   01D0
        XORR    R2,     R1                      ; 6C4B   01D1
        MVO     R0,     G_032C                  ; 6C4C   0240 032C
        SUB     G_010A, R1                      ; 6C4E   0301 010A
        MVO     R1,     G_0334                  ; 6C50   0241 0334
        PULR    R7                              ; 6C52   02B7

        PSHR    R5                              ; 6C53   0275
L_6C54:
        MVII    #$0002, R0                      ; 6C54   02B8 0002
        MVO     R0,     G_0183                  ; 6C56   0240 0183

        JSR     R5,     L_5B5E                  ; 6C58   0004 0158 035E
        JSR     R5,     L_5B34                  ; 6C5B   0004 0158 0334

        MVII    #$0003, R1                      ; 6C5E   02B9 0003
        MVII    #$0003, R2                      ; 6C60   02BA 0003

        JSR     R5,     L_5B47                  ; 6C62   0004 0158 0347
        JSR     R5,     L_5C69                  ; 6C65   0004 015C 0069

        MVII    #$0200, R4                      ; 6C68   02BC 0200
        MVII    #$00F0, R0                      ; 6C6A   02B8 00F0
        MVII    #$0200, R1                      ; 6C6C   02B9 0200

        JSR     R5,     X_FILL_MEM              ; 6C6E   0004 0114 0341

        MVII    #$0002, R2                      ; 6C71   02BA 0002

        JSR     R5,     L_6DAF                  ; 6C73   0004 016C 01AF
        JSR     R5,     L_6C2C                  ; 6C76   0004 016C 002C
        JSR     R5,     L_59C0                  ; 6C79   0004 0158 01C0

        MVII    #$0008, R0                      ; 6C7C   02B8 0008
        MVO     R0,     G_0108                  ; 6C7E   0240 0108
        MVI     G_02F9, R0                      ; 6C80   0280 02F9
        MVO     R0,     G_034E                  ; 6C82   0240 034E
        CLRR    R0                              ; 6C84   01C0
        MVO     R0,     G_01A5                  ; 6C85   0240 01A5

        JSR     R5,     L_6D12                  ; 6C87   0004 016C 0112
        JSR     R5,     L_55E2                  ; 6C8A   0004 0154 01E2

        PULR    R7                              ; 6C8D   02B7

L_6C8E:
        PSHR    R5                              ; 6C8E   0275

L_6C8F:
        JSR     R5,     L_5C87                  ; 6C8F   0004 015C 0087
        JSR     R5,     L_5B5E                  ; 6C92   0004 0158 035E
        JSR     R5,     L_5B34                  ; 6C95   0004 0158 0334

        MVII    #$0002, R1                      ; 6C98   02B9 0002
        MVII    #$0003, R2                      ; 6C9A   02BA 0003

        JSR     R5,     L_5B47                  ; 6C9C   0004 0158 0347

        MVII    #$0008, R0                      ; 6C9F   02B8 0008
        MVII    #$0106, R4                      ; 6CA1   02BC 0106

        JSR     R5,     X_FILL_ZERO             ; 6CA3   0004 0114 0338
        DECLE   $0004,  $0160,  $01D9           ; 6CA6   0004 0160 01D9

        JSR     R5,     L_5CB1                  ; 6CA9   0004 015C 00B1
        JSR     R5,     L_5641                  ; 6CAC   0004 0154 0241
        JSR     R5,     L_5C6F                  ; 6CAF   0004 015C 006F
        JSR     R5,     L_6CE4                  ; 6CB2   0004 016C 00E4

        PULR    R7                              ; 6CB5   02B7

        PSHR    R5                              ; 6CB6   0275

L_6CB7:
        JSR     R5,     L_6C8E                  ; 6CB7   0004 016C 008E

        MVII    #$0003, R2                      ; 6CBA   02BA 0003
        MVO     R2,     G_0183                  ; 6CBC   0242 0183
        MVII    #$0054, R0                      ; 6CBE   02B8 0054
        MVO     R0,     G_01BC                  ; 6CC0   0240 01BC

        JSR     R5,     L_5B2E                  ; 6CC2   0004 0158 032E
        DECLE   $0014                           ; 6CC5   0014

        INCR    R7                              ; 6CC6   000F

L_6CC7:
        PSHR    R5                              ; 6CC7   0275

L_6CC8:
        JSR     R5,     L_6CD8                  ; 6CC8   0004 016C 00D8

        MVII    #$0004, R2                      ; 6CCB   02BA 0004
L_6CCD:
        PSHR    R2                              ; 6CCD   0272

        JSR     R5,     L_6F66                  ; 6CCE   0004 016C 0366

        PULR    R2                              ; 6CD1   02B2
        INCR    R2                              ; 6CD2   000A
        CMPI    #$0008, R2                      ; 6CD3   037A 0008
        BLT     L_6CCD                          ; 6CD5   0225 0009
        PULR    R7                              ; 6CD7   02B7

L_6CD8:
        SDBD                                    ; 6CD8   0001
        MVII    #$5FD4, R2                      ; 6CD9   02BA 00D4 005F
        MVI@    R2,     R0                      ; 6CDC   0290
        SDBD                                    ; 6CDD   0001
        XORI    #$0800, R0                      ; 6CDE   03F8 0000 0008
        MVO     R0,     G_0339                  ; 6CE1   0240 0339
        MOVR    R5,     R7                      ; 6CE3   00AF

L_6CE4:
        PSHR    R5                              ; 6CE4   0275
        SDBD                                    ; 6CE5   0001
        MVII    #$64A4, R4                      ; 6CE6   02BC 00A4 0064
        MVII    #$01B3, R5                      ; 6CE9   02BD 01B3
        MVII    #$0008, R2                      ; 6CEB   02BA 0008
L_6CED:
        MVI@    R4,     R1                      ; 6CED   02A1
        MVO@    R1,     R5                      ; 6CEE   0269
        DECR    R2                              ; 6CEF   0012
        BPL     L_6CED                          ; 6CF0   0223 0004

        MVII    #$0003, R2                      ; 6CF2   02BA 0003
        MVII    #$0163, R4                      ; 6CF4   02BC 0163
L_6CF6:
        SDBD                                    ; 6CF6   0001
        MVII    #$64A1, R1                      ; 6CF7   02B9 00A1 0064
        MVO@    R1,     R4                      ; 6CFA   0261
        SWAP    R1,     1                       ; 6CFB   0041
        MVO@    R1,     R4                      ; 6CFC   0261
        DECR    R2                              ; 6CFD   0012
        BPL     L_6CF6                          ; 6CFE   0223 0009

        MVII    #$02F1, R4                      ; 6D00   02BC 02F1
        MVII    #$0007, R0                      ; 6D02   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 6D04   0004 0114 0338

        PULR    R5                              ; 6D07   02B5
        PSHR    R5                              ; 6D08   0275
L_6D09:
        MVII    #$0179, R4                      ; 6D09   02BC 0179
        MVII    #$0007, R0                      ; 6D0B   02B8 0007
L_6D0D:
        MVO@    R4,     R4                      ; 6D0D   0264
        DECR    R0                              ; 6D0E   0010
        BGT     L_6D0D                          ; 6D0F   022E 0003
        PULR    R7                              ; 6D11   02B7

L_6D12:
        PSHR    R5                              ; 6D12   0275
        MVII    #$0017, R0                      ; 6D13   02B8 0017
        MVII    #$0193, R4                      ; 6D15   02BC 0193

        JSR     R5,     X_FILL_ZERO             ; 6D17   0004 0114 0338

        PULR    R7                              ; 6D1A   02B7

        PSHR    R5                              ; 6D1B   0275
L_6D1C:
        MVII    #$0014, R0                      ; 6D1C   02B8 0014
        SDBD                                    ; 6D1E   0001
        MVII    #$3200, R3                      ; 6D1F   02BB 0000 0032
        MVII    #$0200, R4                      ; 6D22   02BC 0200

        JSR     R5,     .EXEC.853               ; 6D24   0004 0118 0053

        ADDI    #$0007, R4                      ; 6D27   02FC 0007

        JSR     R5,     X_PRINT_R5              ; 6D29   0004 0118 007B
        STRING  "WELL DONE"                     ; 6D2C  
        DECLE   $0000                           ; 6D35   0000

        JSR     R5,     L_5B2E                  ; 6D36   0004 0158 032E
        DECLE   $001E                           ; 6D39   001E

        SDBD                                    ; 6D3A   0001
        MVII    #$3200, R3                      ; 6D3B   02BB 0000 0032
        MVII    #$0207, R4                      ; 6D3E   02BC 0207

        JSR     R5,     X_PRINT_R5              ; 6D40   0004 0118 007B
        STRING  "  MORTAL!"                     ; 6D43  
        DECLE   $0000                           ; 6D4C   0000

        JSR     R5,     L_5B2E                  ; 6D4D   0004 0158 032E
        DECLE   $0028                           ; 6D50   0028

        B       L_6C54                          ; 6D51   0220 00FE

        PSHR    R5                              ; 6D53   0275
        MVI     G_0183, R0                      ; 6D54   0280 0183
        CMPI    #$0002, R0                      ; 6D56   0378 0002
        BNEQ    L_6D65                          ; 6D58   020C 000B

        MVI     G_032D, R0                      ; 6D5A   0280 032D
        ANDI    #$007F, R0                      ; 6D5C   03B8 007F
        CMPI    #$001E, R0                      ; 6D5E   0378 001E
        BLT     L_6D66                          ; 6D60   0205 0004

        JSR     R5,     L_5E9F                  ; 6D62   0004 015C 029F

L_6D65:
        PULR    R7                              ; 6D65   02B7

L_6D66:
        JSR     R5,     L_5B5E                  ; 6D66   0004 0158 035E

        MVII    #$0064, R1                      ; 6D69   02B9 0064

        JSR     R5,     L_5C99                  ; 6D6B   0004 015C 0099

        MVII    #$0188, R3                      ; 6D6E   02BB 0188
        ANDI    #$0007, R5                      ; 6D70   03BD 0007
        INCR    R7                              ; 6D72   000F

L_6D73:
        MVI@    R3,     R5                      ; 6D73   029D
L_6D74:
        ANDI    #$007F, R5                      ; 6D74   03BD 007F
        MVO@    R5,     R3                      ; 6D76   025D
        INCR    R3                              ; 6D77   000B
        CMPI    #$0190, R3                      ; 6D78   037B 0190
        BLE     L_6D73                          ; 6D7A   0226 0008

        MVI     G_02F9, R0                      ; 6D7C   0280 02F9
        SUBI    #$0384, R0                      ; 6D7E   0338 0384
        SDBD                                    ; 6D80   0001
        CMPI    #$0E10, R0                      ; 6D81   0378 0010 000E
        BLT     L_6D88                          ; 6D84   0205 0002

        MVO     R0,     G_02F9                  ; 6D86   0240 02F9
L_6D88:
        MVI     G_01BD, R0                      ; 6D88   0280 01BD
        ADDI    #$0014, R0                      ; 6D8A   02F8 0014
        CMPI    #$00FF, R0                      ; 6D8C   0378 00FF
        BGT     L_6D92                          ; 6D8E   020E 0002

        MVO     R0,     G_01BD                  ; 6D90   0240 01BD

L_6D92:
        JSR     R5,     L_6D9D                  ; 6D92   0004 016C 019D
        JSR     R5,     L_569E                  ; 6D95   0004 0154 029E
        JSR     R5,     L_5598                  ; 6D98   0004 0154 0198

        B       L_6CB7                          ; 6D9B   0220 00E5

L_6D9D:
        MVI     G_01AD, R0                      ; 6D9D   0280 01AD
        DECR    R0                              ; 6D9F   0010
        BLE     L_6DA5                          ; 6DA0   0206 0003

        MVO     R0,     G_01AD                  ; 6DA2   0240 01AD
        MOVR    R5,     R7                      ; 6DA4   00AF

L_6DA5:
        MVI     G_0192, R0                      ; 6DA5   0280 0192
        INCR    R0                              ; 6DA7   0008
        CMPI    #$0007, R0                      ; 6DA8   0378 0007
        BGT     L_6DAE                          ; 6DAA   020E 0002

        MVO     R0,     G_0192                  ; 6DAC   0240 0192
L_6DAE:
        MOVR    R5,     R7                      ; 6DAE   00AF

L_6DAF:
        PSHR    R5                              ; 6DAF   0275
        MVII    #$0325, R3                      ; 6DB0   02BB 0325
        SDBD                                    ; 6DB2   0001
        MVII    #$656F, R4                      ; 6DB3   02BC 006F 0065

        JSR     R5,     L_5BA9                  ; 6DB6   0004 0158 03A9

        MVI     G_0183, R0                      ; 6DB9   0280 0183
        CMPI    #$0002, R0                      ; 6DBB   0378 0002
        BNEQ    L_6DC3                          ; 6DBD   020C 0004

        MVI     G_02F9, R0                      ; 6DBF   0280 02F9
        MVO     R0,     G_034E                  ; 6DC1   0240 034E
L_6DC3:
        PULR    R7                              ; 6DC3   02B7

L_6DC4:
        PSHR    R5                              ; 6DC4   0275
        CLRR    R0                              ; 6DC5   01C0
        MVO     R0,     G_0183                  ; 6DC6   0240 0183
        MVO     R0,     G_019D                  ; 6DC8   0240 019D

        JSR     R5,     L_5598                  ; 6DCA   0004 0154 0198

        B       L_6C8F                          ; 6DCD   0220 013F

        ADDI    #$032D, R1                      ; 6DCF   02F9 032D
        ADDI    #$032D, R2                      ; 6DD1   02FA 032D
        MVI@    R1,     R0                      ; 6DD3   0288
        ANDI    #$007F, R0                      ; 6DD4   03B8 007F
        MVI@    R2,     R3                      ; 6DD6   0293
        ANDI    #$007F, R3                      ; 6DD7   03BB 007F
        CMPI    #$0333, R1                      ; 6DD9   0379 0333
        BLT     L_6DDF                          ; 6DDB   0205 0002

        ADDI    #$0008, R0                      ; 6DDD   02F8 0008
L_6DDF:
        SUBR    R0,     R3                      ; 6DDF   0103
        CMPI    #$0003, R3                      ; 6DE0   037B 0003
        BGT     L_6E00                          ; 6DE2   020E 001C

        SDBD                                    ; 6DE4   0001
        CMPI    #$FFFD, R3                      ; 6DE5   037B 00FD 00FF
        BLT     L_6E00                          ; 6DE8   0205 0016

        SUBI    #$0008, R1                      ; 6DEA   0339 0008
        SUBI    #$0008, R2                      ; 6DEC   033A 0008
        DIS                                     ; 6DEE   0003
        MVI@    R1,     R0                      ; 6DEF   0288
        MVI@    R2,     R3                      ; 6DF0   0293
        EIS                                     ; 6DF1   0002
        ANDI    #$00FF, R0                      ; 6DF2   03B8 00FF
        ANDI    #$00FF, R3                      ; 6DF4   03BB 00FF
        CMPR    R0,     R3                      ; 6DF6   0143
        MVII    #$0003, R0                      ; 6DF7   02B8 0003
        BGT     L_6DFC                          ; 6DF9   020E 0001

        NEGR    R0                              ; 6DFB   0020
L_6DFC:
        DIS                                     ; 6DFC   0003
        ADD@    R2,     R0                      ; 6DFD   02D0
        MVO@    R0,     R2                      ; 6DFE   0250
        EIS                                     ; 6DFF   0002
L_6E00:
        MOVR    R5,     R7                      ; 6E00   00AF

        PSHR    R5                              ; 6E01   0275
        CLRR    R0                              ; 6E02   01C0
        MVII    #$032F, R1                      ; 6E03   02B9 032F
        MVI@    R1,     R3                      ; 6E05   028B

        JSR     R5,     L_5B7D                  ; 6E06   0004 0158 037D

        CLRR    R1                              ; 6E09   01C9
        MVII    #$0004, R4                      ; 6E0A   02BC 0004
        ANDI    #$0007, R3                      ; 6E0C   03BB 0007
        BEQ     L_6E12                          ; 6E0E   0204 0002

        SUBI    #$0014, R2                      ; 6E10   033A 0014
L_6E12:
        MVI@    R2,     R0                      ; 6E12   0290
        ANDI    #$0007, R0                      ; 6E13   03B8 0007
        BNEQ    L_6E1E                          ; 6E15   020C 0007

        TSTR    R1                              ; 6E17   0089
        BNEQ    L_6E63                          ; 6E18   020C 0049

        INCR    R1                              ; 6E1A   0009
        DECR    R2                              ; 6E1B   0012
        B       L_6E12                          ; 6E1C   0220 000B

L_6E1E:
        CMPI    #$0007, R0                      ; 6E1E   0378 0007
        BNEQ    L_6E63                          ; 6E20   020C 0041

        PSHR    R2                              ; 6E22   0272
        PSHR    R4                              ; 6E23   0274

        JSR     R5,     L_58AC                  ; 6E24   0004 0158 00AC

        MVI     G_0328, R2                      ; 6E27   0282 0328
        SDBD                                    ; 6E29   0001
        XORI    #$0400, R2                      ; 6E2A   03FA 0000 0004
        MVO     R2,     G_0328                  ; 6E2D   0242 0328
        MVI     G_0330, R2                      ; 6E2F   0282 0330
        SDBD                                    ; 6E31   0001
        ANDI    #$FFF8, R2                      ; 6E32   03BA 00F8 00FF
        ADD@    R6,     R2                      ; 6E35   02F2
        XORI    #$0100, R2                      ; 6E36   03FA 0100
        MVO     R2,     G_0330                  ; 6E38   0242 0330
        PULR    R2                              ; 6E3A   02B2
        CMPI    #$02DC, R2                      ; 6E3B   037A 02DC
        BGT     L_6E63                          ; 6E3D   020E 0024

        SDBD                                    ; 6E3F   0001
        MVII    #$0200, R0                      ; 6E40   02B8 0000 0002
        MVO@    R0,     R2                      ; 6E43   0250
        DECR    R2                              ; 6E44   0012
        MVI@    R2,     R1                      ; 6E45   0291
        ANDI    #$0007, R1                      ; 6E46   03B9 0007
        CMPI    #$0007, R1                      ; 6E48   0379 0007
        BNEQ    L_6E4D                          ; 6E4A   020C 0001

        MVO@    R0,     R2                      ; 6E4C   0250
L_6E4D:
        ADDI    #$0014, R2                      ; 6E4D   02FA 0014
        MVO@    R0,     R2                      ; 6E4F   0250
        INCR    R2                              ; 6E50   000A
        MVO@    R0,     R2                      ; 6E51   0250
        MVI     G_035B, R0                      ; 6E52   0280 035B
        ANDI    #$0100, R0                      ; 6E54   03B8 0100
        BNEQ    L_6E5E                          ; 6E56   020C 0006

        MVI     G_035C, R0                      ; 6E58   0280 035C
        ANDI    #$0100, R0                      ; 6E5A   03B8 0100
        BEQ     L_6E63                          ; 6E5C   0204 0005

L_6E5E:
        CLRR    R0                              ; 6E5E   01C0
        MVO     R0,     G_035B                  ; 6E5F   0240 035B
        MVO     R0,     G_035C                  ; 6E61   0240 035C
L_6E63:
        PULR    R7                              ; 6E63   02B7

        MVI     G_010C, R0                      ; 6E64   0280 010C
        MVI     G_010A, R1                      ; 6E66   0281 010A
        TSTR    R0                              ; 6E68   0080
        BEQ     L_6E81                          ; 6E69   0204 0016

        ANDI    #$0080, R0                      ; 6E6B   03B8 0080
        BNEQ    L_6E7C                          ; 6E6D   020C 000D

        CMP     G_0192, R1                      ; 6E6F   0341 0192
        BLT     L_6E8F                          ; 6E71   0205 001C

L_6E73:
        MVII    #$0005, R0                      ; 6E73   02B8 0005
L_6E75:
        MVO     R0,     G_01AF                  ; 6E75   0240 01AF
        CLRR    R0                              ; 6E77   01C0
L_6E78:
        MVO     R0,     G_010C                  ; 6E78   0240 010C
        B       L_6E8F                          ; 6E7A   0200 0013

L_6E7C:
        TSTR    R1                              ; 6E7C   0089
        BGT     L_6E8F                          ; 6E7D   020E 0010
        B       L_6E73                          ; 6E7F   0220 000D

L_6E81:
        MVI     G_01AF, R0                      ; 6E81   0280 01AF
        DECR    R0                              ; 6E83   0010
        BPL     L_6E75                          ; 6E84   0223 0010

        MVI     G_01AE, R0                      ; 6E86   0280 01AE
        CMPI    #$0003, R1                      ; 6E88   0379 0003
        BLT     L_6E78                          ; 6E8A   0225 0013

        NEGR    R0                              ; 6E8C   0020
        B       L_6E78                          ; 6E8D   0220 0016
L_6E8F:
        MOVR    R5,     R7                      ; 6E8F   00AF

L_6E90:
        PSHR    R5                              ; 6E90   0275
L_6E91:
        CMPI    #$0003, R3                      ; 6E91   037B 0003
        BNEQ    L_6E9C                          ; 6E93   020C 0007

        JSR     R5,     L_5B63                  ; 6E95   0004 0158 0363

        MVI     G_033F, R1                      ; 6E98   0281 033F
        B       L_6EA7                          ; 6E9A   0200 000B

L_6E9C:
        SDBD                                    ; 6E9C   0001
        MVII    #$6587, R4                      ; 6E9D   02BC 0087 0065
        ADDI    #$0325, R3                      ; 6EA0   02FB 0325

        JSR     R5,     L_5BAB                  ; 6EA2   0004 0158 03AB

        MVI     G_0340, R1                      ; 6EA5   0281 0340
L_6EA7:
        SDBD                                    ; 6EA7   0001
        CMPI    #$65BB, R1                      ; 6EA8   0379 00BB 0065
        BEQ     L_6EB0                          ; 6EAB   0204 0003

        JSR     R5,     L_5598                  ; 6EAD   0004 0154 0198

L_6EB0:
        PULR    R7                              ; 6EB0   02B7

        PSHR    R5                              ; 6EB1   0275
        PSHR    R2                              ; 6EB2   0272
        MOVR    R2,     R3                      ; 6EB3   0093
        CLRR    R4                              ; 6EB4   01E4

        JSR     R5,     L_5998                  ; 6EB5   0004 0158 0198

        PULR    R3                              ; 6EB8   02B3
        SUBI    #$0014, R2                      ; 6EB9   033A 0014
        MVI@    R2,     R0                      ; 6EBB   0290
        TSTR    R0                              ; 6EBC   0080
        BPL     L_6EF5                          ; 6EBD   0203 0036

        SDBD                                    ; 6EBF   0001
        ANDI    #$4000, R0                      ; 6EC0   03B8 0000 0040
        BEQ     L_6ED7                          ; 6EC3   0204 0012

        DECR    R2                              ; 6EC5   0012
        MVI@    R2,     R0                      ; 6EC6   0290
        SDBD                                    ; 6EC7   0001
        ANDI    #$0800, R0                      ; 6EC8   03B8 0000 0008
        BNEQ    L_6EF5                          ; 6ECB   020C 0028

        ADDI    #$0002, R2                      ; 6ECD   02FA 0002
        MVI@    R2,     R0                      ; 6ECF   0290
        SDBD                                    ; 6ED0   0001
        ANDI    #$0800, R0                      ; 6ED1   03B8 0000 0008
        BNEQ    L_6EF5                          ; 6ED4   020C 001F

        DECR    R2                              ; 6ED6   0012
L_6ED7:
        MVI@    R2,     R0                      ; 6ED7   0290
        SDBD                                    ; 6ED8   0001
        ANDI    #$7607, R0                      ; 6ED9   03B8 0007 0076
        MVO@    R0,     R2                      ; 6EDC   0250

        JSR     R5,     L_6E90                  ; 6EDD   0004 016C 0290

        MVII    #$0004, R1                      ; 6EE0   02B9 0004

        JSR     R5,     L_5C99                  ; 6EE2   0004 015C 0099
        JSR     R5,     L_5CB1                  ; 6EE5   0004 015C 00B1

        MVI     G_01A3, R0                      ; 6EE8   0280 01A3
        INCR    R0                              ; 6EEA   0008
        CMPI    #$0010, R0                      ; 6EEB   0378 0010
        BLT     L_6EF3                          ; 6EED   0205 0004

        JSR     R5,     L_6EF6                  ; 6EEF   0004 016C 02F6

        CLRR    R0                              ; 6EF2   01C0
L_6EF3:
        MVO     R0,     G_01A3                  ; 6EF3   0240 01A3
L_6EF5:
        PULR    R7                              ; 6EF5   02B7

L_6EF6:
        PSHR    R5                              ; 6EF6   0275
        CLRR    R0                              ; 6EF7   01C0
        MVO     R0,     G_0183                  ; 6EF8   0240 0183
        MVO     R0,     G_0126                  ; 6EFA   0240 0126
        MVI     G_01C0, R0                      ; 6EFC   0280 01C0
        INCR    R0                              ; 6EFE   0008
        MVO     R0,     G_01C0                  ; 6EFF   0240 01C0
        CMPI    #$000A, R0                      ; 6F01   0378 000A
        BLT     L_6F0D                          ; 6F03   0205 0008

        MVII    #$0295, R4                      ; 6F05   02BC 0295
        MVII    #$0386, R0                      ; 6F07   02B8 0386
        MVO@    R0,     R4                      ; 6F09   0260
        ADDI    #$0018, R0                      ; 6F0A   02F8 0018
        MVO@    R0,     R4                      ; 6F0C   0260
L_6F0D:
        MVII    #$0002, R3                      ; 6F0D   02BB 0002
        MVII    #$0006, R2                      ; 6F0F   02BA 0006

        JSR     R5,     L_5B61                  ; 6F11   0004 0158 0361
        JSR     R5,     L_5598                  ; 6F14   0004 0154 0198
        JSR     R5,     L_6F2F                  ; 6F17   0004 016C 032F

        MVII    #$0002, R2                      ; 6F1A   02BA 0002

        JSR     R5,     L_5B45                  ; 6F1C   0004 0158 0345

        MVI     G_01B2, R1                      ; 6F1F   0281 01B2

        JSR     R5,     L_5C99                  ; 6F21   0004 015C 0099

        ADDI    #$0006, R1                      ; 6F24   02F9 0006
        CMPI    #$007F, R1                      ; 6F26   0379 007F
        BGT     L_6F2C                          ; 6F28   020E 0002

        MVO     R1,     G_01B2                  ; 6F2A   0241 01B2
L_6F2C:
        J       L_5CB2                          ; 6F2C   0004 035C 00B2

L_6F2F:
        PSHR    R5                              ; 6F2F   0275

        JSR     R5,     L_5B2E                  ; 6F30   0004 0158 032E
        DECLE   $000F                           ; 6F33   000F

        MVII    #$0214, R4                      ; 6F34   02BC 0214
        SDBD                                    ; 6F36   0001
        MVII    #$6173, R2                      ; 6F37   02BA 0073 0061

        JSR     R5,     L_61DF                  ; 6F3A   0004 0160 01DF
        JSR     R5,     L_5B2E                  ; 6F3D   0004 0158 032E
        DECLE   $000F                           ; 6F40   000F

        MVII    #$0228, R4                      ; 6F41   02BC 0228
        SDBD                                    ; 6F43   0001
        MVII    #$616B, R2                      ; 6F44   02BA 006B 0061

        JSR     R5,     L_61DF                  ; 6F47   0004 0160 01DF

        SDBD                                    ; 6F4A   0001
        MVII    #$3207, R0                      ; 6F4B   02B8 0007 0032
        MVO@    R0,     R4                      ; 6F4E   0260
        MVO@    R0,     R4                      ; 6F4F   0260

        JSR     R5,     L_5767                  ; 6F50   0004 0154 0367
        JSR     R5,     L_5B2E                  ; 6F53   0004 0158 032E
        DECLE   $000F                           ; 6F56   000F

        MVII    #$023C, R4                      ; 6F57   02BC 023C
        SDBD                                    ; 6F59   0001
        MVII    #$6167, R2                      ; 6F5A   02BA 0067 0061

        JSR     R5,     L_61DF                  ; 6F5D   0004 0160 01DF

        MVO     R2,     G_01A9                  ; 6F60   0242 01A9

        JSR     R5,     L_55EF                  ; 6F62   0004 0154 01EF

        PULR    R7                              ; 6F65   02B7

L_6F66:
        PSHR    R5                              ; 6F66   0275
L_6F67:
        MOVR    R2,     R1                      ; 6F67   0091
        PSHR    R1                              ; 6F68   0271
        SDBD                                    ; 6F69   0001
        ADDI    #$6F92, R2                      ; 6F6A   02FA 0092 006F
        SUBI    #$0004, R1                      ; 6F6D   0339 0004

        JSR     R5,     L_6F9B                  ; 6F6F   0004 016C 039B

        MVI@    R2,     R2                      ; 6F72   0292
        PULR    R3                              ; 6F73   02B3
        PSHR    R2                              ; 6F74   0272
        ADDI    #$0325, R3                      ; 6F75   02FB 0325
        PSHR    R3                              ; 6F77   0273
        SDBD                                    ; 6F78   0001
        MVII    #$659F, R4                      ; 6F79   02BC 009F 0065

        JSR     R5,     L_5BAB                  ; 6F7C   0004 0158 03AB

        PULR    R3                              ; 6F7F   02B3
        MVI@    R3,     R1                      ; 6F80   0299
        SDBD                                    ; 6F81   0001
        ANDI    #$FF00, R1                      ; 6F82   03B9 0000 00FF
        ADD@    R6,     R1                      ; 6F85   02F1
        MVO@    R1,     R3                      ; 6F86   0259
        MOVR    R3,     R4                      ; 6F87   009C
        MVI     G_01B2, R1                      ; 6F88   0281 01B2
        MVI     G_0325, R2                      ; 6F8A   0282 0325
        ANDI    #$00FF, R2                      ; 6F8C   03BA 00FF
        MVI     G_032D, R3                      ; 6F8E   0283 032D
        ANDI    #$007F, R3                      ; 6F90   03BB 007F

        JSR     R5,     L_5BE2                  ; 6F92   0004 0158 03E2

        PULR    R7                              ; 6F95   02B7

        ADCR    R0                              ; 6F96   0028
        SLL     R0,     1                       ; 6F97   0048
        SLR     R0,     1                       ; 6F98   0060
        TSTR    R0                              ; 6F99   0080
        RLC     R0,     2                       ; 6F9A   0054
L_6F9B:
        PSHR    R5                              ; 6F9B   0275
        MOVR    R1,     R5                      ; 6F9C   008D
        B       L_6FA7                          ; 6F9D   0200 0008

L_6F9F:
        CMPR    R1,     R5                      ; 6F9F   014D
        BNEQ    L_6FA7                          ; 6FA0   020C 0005

        SDBD                                    ; 6FA2   0001
        MVII    #$6F9A, R2                      ; 6FA3   02BA 009A 006F
        PULR    R7                              ; 6FA6   02B7

L_6FA7:
        MVI@    R2,     R3                      ; 6FA7   0293
        SLR     R3,     2                       ; 6FA8   0067
        SLR     R3,     1                       ; 6FA9   0063
        DECR    R3                              ; 6FAA   0013
        ADDI    #$023C, R3                      ; 6FAB   02FB 023C
        MVI@    R3,     R0                      ; 6FAD   0298
        TSTR    R0                              ; 6FAE   0080
        BPL     L_6FB9                          ; 6FAF   0203 0008

        PSHR    R1                              ; 6FB1   0271
        ADDI    #$02F4, R1                      ; 6FB2   02F9 02F4
        MVII    #$0021, R0                      ; 6FB4   02B8 0021
        MVO@    R0,     R1                      ; 6FB6   0248
        PULR    R1                              ; 6FB7   02B1
        PULR    R7                              ; 6FB8   02B7

L_6FB9:
        INCR    R2                              ; 6FB9   000A
        INCR    R1                              ; 6FBA   0009
        SDBD                                    ; 6FBB   0001
        CMPI    #$6F99, R2                      ; 6FBC   037A 0099 006F
        BLE     L_6F9F                          ; 6FBF   0226 0021

        SUBI    #$0004, R2                      ; 6FC1   033A 0004
        SUBI    #$0004, R1                      ; 6FC3   0339 0004
        B       L_6F9F                          ; 6FC5   0220 0027
        PULR    R7                              ; 6FC7   02B7

        PSHR    R5                              ; 6FC8   0275
        ADD     G_033D, R1                      ; 6FC9   02C1 033D
        BEQ     L_6FE0                          ; 6FCB   0204 0013

        JSR     R5,     L_5B5E                  ; 6FCD   0004 0158 035E
        JSR     R5,     L_5CDF                  ; 6FD0   0004 015C 00DF

        TSTR    R1                              ; 6FD3   0089
        BMI     L_6FE0                          ; 6FD4   020B 000A

        JSR     R5,     L_5B2E                  ; 6FD6   0004 0158 032E
        DECLE   $000F                           ; 6FD9   000F

        JSR     R5,     L_5641                  ; 6FDA   0004 0154 0241
        JSR     R5,     L_6CC7                  ; 6FDD   0004 016C 00C7
L_6FE0:
        JSR     R5,     L_5CB1                  ; 6FE0   0004 015C 00B1

        PULR    R7                              ; 6FE3   02B7

L_6FE4:
        PSHR    R5                              ; 6FE4   0275
        PSHR    R2                              ; 6FE5   0272
        MOVR    R1,     R3                      ; 6FE6   008B

        JSR     R5,     L_5B63                  ; 6FE7   0004 0158 0363
        JSR     R5,     L_5598                  ; 6FEA   0004 0154 0198

        PULR    R2                              ; 6FED   02B2
        B       L_6F67                          ; 6FEE   0220 0088

        PSHR    R5                              ; 6FF0   0275

        JSR     R5,     L_6FE4                  ; 6FF1   0004 016C 03E4
        JSR     R5,     L_5B2E                  ; 6FF4   0004 0158 032E
        DECLE   $000A                           ; 6FF7   000A

        MVII    #$0002, R3                      ; 6FF8   02BB 0002
        B       L_6E91                          ; 6FFA   0220 016A

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
;;  $5468       $5464  
;;  $5491       $52E7  
;;  $549E       $549B  
;;  $54A6       $54A1   $54B5  
;;  $54B3       $54A8  
;;  $54B8       $547A  
;;  $54C5       $54BE  
;;  $54CA       $54BB  
;;  $54D2       $54CB  
;;  $54D5       $54C3   $54C8   $54D0  
;;  $54D7       $54C0  
;;  $54DC       $54EB  
;;  $54DE       $54E3  
;;  $54EE       $54C5  
;;  $54F7       $5522  
;;  $5510       $55DE  
;;  $5525       $54CD  
;;  $552A       $5535  
;;  $552C       $552F  
;;  $5538       $54D2  
;;  $553F       $5542  
;;  $5545       $533D   $5412  
;;  $5548       $554A  
;;  $554C       $5546  
;;  $554D       $6C28  
;;  $555F       <entry>
;;  $5564       $5A93   $5E2E  
;;  $5565       $5590  
;;  $5580       $5579  
;;  $5585       $58C1  
;;  $5598       $69DB   $6D98   $6DCA   $6EAD   $6F14   $6FEA  
;;  $559E       $585E   $5866  
;;  $55E2       $6C8A  
;;  $55E3       $5596   $55E0  
;;  $55EF       $6F62  
;;  $5602       $506F  
;;  $5641       $5613   $6CAC   $6FDA  
;;  $564F       $5654   $5658  
;;  $567A       $5686  
;;  $5688       $567B  
;;  $569E       $5692   $6D95  
;;  $56A9       $5662  
;;  $56DD       $56E6  
;;  $56E8       $56D1  
;;  $56F3       $56F1  
;;  $56FE       $56EB  
;;  $5702       $5710  
;;  $5713       $5707  
;;  $5721       $5718  
;;  $5728       $571F  
;;  $5736       $5723  
;;  $5741       $5725  
;;  $5750       $571A  
;;  $575D       $5764  
;;  $5767       $6F50  
;;  $5768       $5734  
;;  $5781       $5778  
;;  $579C       $5AD6  
;;  $57A9       $579A  
;;  $57C3       $57B4  
;;  $57D5       $57C1  
;;  $57D8       $57AE  
;;  $57D9       $57D0  
;;  $57DD       $5870  
;;  $57DE       $57DC  
;;  $57EB       $57E2  
;;  $582F       $5845   $584F  
;;  $5834       $5853  
;;  $5841       $5839  
;;  $5842       $5836   $5840  
;;  $5855       $5848  
;;  $5862       $5831  
;;  $5873       $5856  
;;  $5874       $5863  
;;  $5886       $5877   $5894  
;;  $5897       $5A6B   $5A9C  
;;  $58AA       $58A5  
;;  $58AB       $58A9  
;;  $58AC       $5EF4   $6E24  
;;  $58AD       $58ED   $5907  
;;  $58D2       $5D6B   $5D94  
;;  $58DB       $58D8  
;;  $58EF       $58E8  
;;  $5909       $58F3   $58F8  
;;  $595A       $5A87   $5AA4   $5E26  
;;  $5969       $57A3  
;;  $598A       $5983  
;;  $5997       $596B   $597C   $5990  
;;  $5998       $57A0   $58E3   $68FA   $6EB5  
;;  $59B1       $59A4   $59A9   $59AD  
;;  $59BE       $59B2   $59BB  
;;  $59C0       $6C79  
;;  $59DD       $5F1D  
;;  $59E9       $5A60  
;;  $59FE       $59F7  
;;  $5A01       $59FC  
;;  $5A09       $59EA  
;;  $5A1A       $5A13  
;;  $5A1D       $5A18  
;;  $5A21       $5A07  
;;  $5A25       $5A67  
;;  $5A3C       $5A30  
;;  $5A41       $5A2B  
;;  $5A53       $5A42  
;;  $5A59       $5A51  
;;  $5A5C       $5DE7  
;;  $5A6B       $5A3A  
;;  $5A96       $5A6F  
;;  $5A98       $5A3F  
;;  $5ACC       $5AA0  
;;  $5ACF       $57D3   $5A28  
;;  $5AEA       $5AD0  
;;  $5AEF       $5A62  
;;  $5AF9       $5AF0  
;;  $5AFA       $57A6   $57D9  
;;  $5B13       $5B0A   $5B0F  
;;  $5B16       $5B2B  
;;  $5B28       $5B18   $5B1D  
;;  $5B2E       $5730   $573A   $5EFF   $69BF   $69D7   $69EC   $6A4A   $6A56  
;;  $5B2E       $6A85   $6A8D   $6B67   $6CC2   $6D36   $6D4D   $6F30   $6F3D  
;;  $5B2E       $6F53   $6FD6   $6FF4  
;;  $5B34       $5603   $6C5B   $6C95  
;;  $5B38       $6BBD   $6BC2  
;;  $5B39       $5B37  
;;  $5B3A       $64C2  
;;  $5B3B       $5B39  
;;  $5B41       $6BB8  
;;  $5B45       $6F1C  
;;  $5B46       $5B44  
;;  $5B47       $560A   $6C62   $6C9C  
;;  $5B48       $5B46  
;;  $5B4B       $5B3F   $5B52  
;;  $5B5E       $6C58   $6C92   $6D66   $6FCD  
;;  $5B61       $5B59   $5EFC   $6F11  
;;  $5B63       $58BE   $5B5C   $6E95   $6FE7  
;;  $5B64       $5B62  
;;  $5B66       $5B04  
;;  $5B73       $5B7A  
;;  $5B7D       $599E   $67B4   $6E06  
;;  $5B88       $5B84  
;;  $5B94       $5B90  
;;  $5BA1       $69C9   $6BD8  
;;  $5BA9       $593E   $6DB6  
;;  $5BAB       $59C7   $5D51   $5D74   $5D9D   $6846   $685B   $6872   $6886  
;;  $5BAB       $68B2   $68BC   $6AEE   $6C33   $6C3C   $6EA2   $6F7C  
;;  $5BAC       $5BAA  
;;  $5BAD       $5BD6  
;;  $5BD9       $5BAF   $5BBF   $5BDF  
;;  $5BE2       $6B2D   $6F92  
;;  $5C01       $5BEC   $5BF2  
;;  $5C0B       $5A55   $5AE6   $68F1   $6BA0  
;;  $5C0D       $59F3   $5A1E   $5A4C   $5A90   $5AB7  
;;  $5C12       $5BE5  
;;  $5C29       $5A46   $5A83   $5AAF   $5CF9  
;;  $5C37       $5AC1  
;;  $5C4E       $5AC4  
;;  $5C5E       $5C57  
;;  $5C60       $5C53   $5C5B  
;;  $5C63       $6BC5  
;;  $5C69       $6C65  
;;  $5C6F       $6CAF  
;;  $5C81       $5C7C  
;;  $5C87       $56BD   $6AB6   $6C8F  
;;  $5C8B       $5C67   $5C6D   $5C73   $5C97   $6AAF  
;;  $5C99       $5CAD   $5F31   $67A8   $6D6B   $6EE2   $6F21  
;;  $5CA5       $69DE  
;;  $5CB1       $5F34   $64AE   $6CA9   $6EE5   $6FE0  
;;  $5CB2       $5CA9   $5CB0   $5CBC   $6F2C  
;;  $5CDF       $5F1A   $69B2   $6FD0  
;;  $5CED       $6BB1  
;;  $5CF5       $5CE5  
;;  $5CF7       $5CF3  
;;  $5CF8       $59EE   $5AF4  
;;  $5D0B       $5D03  
;;  $5D0F       $5D07  
;;  $5D1C       $5D14  
;;  $5D20       $5D09   $5D0D   $5D1A  
;;  $5D22       $5D18   $5D1E  
;;  $5D23       $59FE  
;;  $5D28       $59F9   $68EC  
;;  $5D29       $5D27  
;;  $5D2C       $5D36  
;;  $5D3D       $5D39  
;;  $5D3E       $5D3C  
;;  $5D41       $58B6   $5E08  
;;  $5D66       $5DF3  
;;  $5D7E       $5D67  
;;  $5D8E       $5D81   $5D85  
;;  $5D8F       $5DF1  
;;  $5DA5       $5D90  
;;  $5DBB       $5DA9  
;;  $5DBD       $5DAE   $5DB3  
;;  $5DCB       $5B23   $5DBF   $5DC3   $5DC7  
;;  $5DD6       $5DD0  
;;  $5DE0       $5DD4   $5DDA  
;;  $5DF5       $5DE3  
;;  $5DF6       $5DEB  
;;  $5E10       $5DFD  
;;  $5E1A       $5E0E  
;;  $5E31       $5DF7   $5E18  
;;  $5E32       $5DED  
;;  $5E3C       $5E33  
;;  $5E47       $5E40  
;;  $5E48       $5E3A  
;;  $5E64       $5E55  
;;  $5E7C       $5E74  
;;  $5E7D       $5E5E  
;;  $5E92       $5E8A  
;;  $5E98       $5E94  
;;  $5E9E       $5E81  
;;  $5E9F       $5E58   $6D62  
;;  $5EBB       $5EB3  
;;  $5EC7       $5EAA   $5EBF  
;;  $5EDB       $5ED1  
;;  $5EEC       $5EB9   $5EC5   $5ED5   $5ED9  
;;  $5EF7       $5F54  
;;  $5F38       $5F18  
;;  $5F3D       $5F5D  
;;  $5F4A       $5F28  
;;  $5F4F       $5EA3   $5EDF   $5EEA  
;;  $5F70       $5E4F   $5E62   $5FCE  
;;  $5F79       $5F73  
;;  $5F85       $5F7B  
;;  $5F8D       $5F77  
;;  $5F8E       $5E5B  
;;  $5FA2       $5F9C  
;;  $5FA8       $5F9A  
;;  $5FAE       $5FA0   $5FA6  
;;  $5FB5       $5E53  
;;  $5FCB       $5FC6  
;;  $602A       $6028  
;;  $60D4       $60D2  
;;  $610F       $60CC  
;;  $6169       $6167  
;;  $61DA       $60D8  
;;  $61DF       $6F3A   $6F47   $6F5D  
;;  $61E3       $575E  
;;  $61E4       $61F7  
;;  $62A0       $629E  
;;  $62A8       $62A6  
;;  $62C0       $62BE  
;;  $62C8       $62C6  
;;  $636C       $636C  
;;  $63DF       $60DD  
;;  $63E7       $60E5  
;;  $63EA       $60E8  
;;  $64BC       $64B4  
;;  $64CE       $64CA  
;;  $64DC       $64D8  
;;  $64DE       $64BA  
;;  $64E4       $64E0  
;;  $656F       $6518  
;;  $6641       $656C  
;;  $6647       $672B  
;;  $664E       $6711  
;;  $6667       $667D   $6683  
;;  $666E       $6660  
;;  $6685       $6677  
;;  $669D       $6692  
;;  $66A4       $669B  
;;  $66AA       $6654  
;;  $66BB       $66B8  
;;  $66D2       $66AB   $66B3  
;;  $66EC       $663E  
;;  $66F2       $66E1   $66EA  
;;  $66F6       $66F0  
;;  $670B       $6650   $6657   $666C   $66A8   $66D0  
;;  $6714       $6647  
;;  $671A       $671F  
;;  $6722       $547D  
;;  $6735       $6730  
;;  $673D       $6741   $674D  
;;  $674F       $6745  
;;  $6753       $6791  
;;  $675C       $6780  
;;  $6763       $675A  
;;  $678F       $6761   $6766   $6770   $6788  
;;  $6793       $6757   $677B  
;;  $6796       $6732  
;;  $679A       $67A6  
;;  $67A2       $679F  
;;  $67B0       $67AE  
;;  $67CD       $67C3  
;;  $67D1       $67CB  
;;  $67E3       $67DB  
;;  $67E4       $680B   $681B  
;;  $6812       $6803   $6807  
;;  $6814       $683C  
;;  $6835       $6825   $6829   $682D   $6831  
;;  $6839       $6819  
;;  $683F       $6BDE  
;;  $68AA       $6840   $69AF   $69F0   $6BA6  
;;  $68AB       $6ABC   $6B79  
;;  $68EF       $68DC  
;;  $6905       $68FF  
;;  $6912       $690A  
;;  $691E       $6916  
;;  $6924       $6910   $691C  
;;  $692E       $691E  
;;  $6934       $693C  
;;  $6936       $6932  
;;  $6944       $693E  
;;  $694E       $697B  
;;  $6965       $695E  
;;  $696B       $694C  
;;  $697D       $696F  
;;  $697F       $6922   $6BA9  
;;  $69B2       $69A7  
;;  $69CC       $69B6   $69BB  
;;  $69CD       $64BC  
;;  $69CE       $6B9A  
;;  $69E8       $6968   $69E6  
;;  $6A06       $69FE  
;;  $6A35       $69D5  
;;  $6A44       $6A3C  
;;  $6A69       $6A67  
;;  $6A7A       $6A76  
;;  $6AA1       $6AA9  
;;  $6AD0       $6ACA   $6AE4  
;;  $6AE6       $6AD6  
;;  $6B06       $6B00  
;;  $6B08       $6B04  
;;  $6B18       $6B14  
;;  $6B19       $6B64  
;;  $6B1A       $6B18  
;;  $6B3D       $6B37  
;;  $6B6D       $6B4A  
;;  $6B79       $6B74  
;;  $6B7B       $6B45  
;;  $6B7C       $69AC   $6BA3  
;;  $6B7D       $6B6B  
;;  $6BAC       $569B   $573E  
;;  $6BB4       $6BAF  
;;  $6BE2       $6BC8  
;;  $6BFD       $6C00  
;;  $6C04       $6BCB  
;;  $6C1A       $6BDB  
;;  $6C2C       $57E7   $6C76  
;;  $6C54       $6D51  
;;  $6C8E       $6CB7  
;;  $6C8F       $6DCD  
;;  $6CB7       $6D9B  
;;  $6CC7       $6FDD  
;;  $6CC8       $6CC6  
;;  $6CCD       $6CD5  
;;  $6CD8       $68B5   $6CC8  
;;  $6CE4       $560D   $572D   $6CB2  
;;  $6CED       $6CF0  
;;  $6CF6       $6CFE  
;;  $6D09       $6C02  
;;  $6D0D       $6D0F  
;;  $6D12       $6BCE   $6C87  
;;  $6D1C       $6B16  
;;  $6D65       $6D58  
;;  $6D66       $6D60  
;;  $6D73       $6D7A  
;;  $6D74       $6D72  
;;  $6D88       $6D84  
;;  $6D92       $6D8E  
;;  $6D9D       $6B76   $6D92  
;;  $6DA5       $6DA0  
;;  $6DAE       $6DAA  
;;  $6DAF       $5646   $5F07   $6C73  
;;  $6DC3       $6DBD  
;;  $6DC4       $5CE8  
;;  $6DDF       $6DDB  
;;  $6DFC       $6DF9  
;;  $6E00       $6DE2   $6DE8  
;;  $6E12       $6E0E   $6E1C  
;;  $6E1E       $6E15  
;;  $6E4D       $6E4A  
;;  $6E5E       $6E56  
;;  $6E63       $6E18   $6E20   $6E3D   $6E5C  
;;  $6E73       $6E7F  
;;  $6E75       $6E84  
;;  $6E78       $6E8A   $6E8D  
;;  $6E7C       $6E6D  
;;  $6E81       $6E69  
;;  $6E8F       $6E71   $6E7A   $6E7D  
;;  $6E90       $6EDD  
;;  $6E91       $6FFA  
;;  $6E9C       $6E93  
;;  $6EA7       $6E9A  
;;  $6EB0       $6EAB  
;;  $6ED7       $6EC3  
;;  $6EF3       $6EED  
;;  $6EF5       $6EBD   $6ECB   $6ED4  
;;  $6EF6       $6EEF  
;;  $6F0D       $6F03  
;;  $6F2C       $6F28  
;;  $6F2F       $6F17  
;;  $6F66       $6CCE  
;;  $6F67       $6FEE  
;;  $6F9B       $6F6F  
;;  $6F9F       $6FBF   $6FC5  
;;  $6FA7       $6F9D   $6FA0  
;;  $6FB9       $6FAF  
;;  $6FE0       $6FCB   $6FD4  
;;  $6FE4       $6FF1  
;; ======================================================================== ;;
