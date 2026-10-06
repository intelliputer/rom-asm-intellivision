
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
        MVII    #$5394, R0                      ; 5019   02B8 0094 0053
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02F7, R6                      ; 5021   02BE 02F7
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
        MVII    #$5739, R0                      ; 5039   02B8 0039 0057
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
        MVII    #$6B05, R4                      ; 5056   02BC 0005 006B
        MVII    #$0335, R5                      ; 5059   02BD 0335
L_505B:
        MVI@    R4,     R0                      ; 505B   02A0
        XORR    R2,     R0                      ; 505C   01D0
        MVO@    R0,     R5                      ; 505D   0268
        DECR    R1                              ; 505E   0011
        BNEQ    L_505B                          ; 505F   022C 0005

        MVII    #$0171, R4                      ; 5061   02BC 0171
        MVII    #$0002, R2                      ; 5063   02BA 0002
L_5065:
        MVO@    R0,     R4                      ; 5065   0260
        DECR    R2                              ; 5066   0012
        BNEQ    L_5065                          ; 5067   022C 0003

        EIS                                     ; 5069   0002
L_506A:
        MVI     G_0119, R0                      ; 506A   0280 0119
        TSTR    R0                              ; 506C   0080
        BNEQ    L_506A                          ; 506D   022C 0004

        JSR     R5,     L_5666                  ; 506F   0004 0154 0266
L_5072:
        JSR     R5,     L_508C                  ; 5072   0004 0150 008C
        JSR     R5,     L_5146                  ; 5075   0004 0150 0146
        JSR     R5,     .EXEC.4F1               ; 5078   0004 0114 00F1
        JSR     R5,     L_50C0                  ; 507B   0004 0150 00C0
        JSR     R5,     L_50E5                  ; 507E   0004 0150 00E5
        JSR     R5,     L_5146                  ; 5081   0004 0150 0146
        JSR     R5,     .EXEC.4F1               ; 5084   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 5087   0004 0118 02AD

        B       L_5072                          ; 508A   0220 0019

L_508C:
        PSHR    R5                              ; 508C   0275
        MVI     G_0118, R0                      ; 508D   0280 0118
        TSTR    R0                              ; 508F   0080
        BNEQ    L_50BF                          ; 5090   020C 002D

        MVII    #$0003, R0                      ; 5092   02B8 0003
        MVO     R0,     G_0118                  ; 5094   0240 0118
        SDBD                                    ; 5096   0001
        MVII    #$5721, R4                      ; 5097   02BC 0021 0057
        MVII    #$0161, R3                      ; 509A   02BB 0161
L_509C:
        MVI@    R3,     R0                      ; 509C   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 509D   0004 0114 0268

        TSTR    R0                              ; 50A0   0080
        BMI     L_50B6                          ; 50A1   020B 0013
        BEQ     L_50A8                          ; 50A3   0204 0003

        DECR    R0                              ; 50A5   0010
        BNEQ    L_50B6                          ; 50A6   020C 000E

L_50A8:
        MVI@    R4,     R0                      ; 50A8   02A0
        MVO@    R0,     R3                      ; 50A9   0258
        PSHR    R4                              ; 50AA   0274
        PSHR    R3                              ; 50AB   0273
        SDBD                                    ; 50AC   0001
        MVII    #$50B2, R5                      ; 50AD   02BD 00B2 0050
        SDBD                                    ; 50B0   0001
        MVI@    R4,     R7                      ; 50B1   02A7

        PULR    R3                              ; 50B2   02B3
        PULR    R4                              ; 50B3   02B4
        B       L_50B8                          ; 50B4   0200 0002

L_50B6:
        MVO@    R0,     R3                      ; 50B6   0258
        INCR    R4                              ; 50B7   000C
L_50B8:
        INCR    R3                              ; 50B8   000B
        ADDI    #$0002, R4                      ; 50B9   02FC 0002
        CMPI    #$0169, R3                      ; 50BB   037B 0169
        BLT     L_509C                          ; 50BD   0225 0022
L_50BF:
        PULR    R7                              ; 50BF   02B7

L_50C0:
        PSHR    R5                              ; 50C0   0275
        CLRR    R1                              ; 50C1   01C9
        DIS                                     ; 50C2   0003
        MVI     G_0117, R2                      ; 50C3   0282 0117
        MVO     R1,     G_0117                  ; 50C5   0241 0117
        EIS                                     ; 50C7   0002
        MVII    #$033D, R3                      ; 50C8   02BB 033D
L_50CA:
        RRC     R2,     1                       ; 50CA   0072
        BNC     L_50DF                          ; 50CB   0209 0012

        MVI@    R3,     R4                      ; 50CD   029C
        TSTR    R4                              ; 50CE   00A4
        BEQ     L_50DF                          ; 50CF   0204 000E

        ADDI    #$0000, R4                      ; 50D1   02FC 0000
        SDBD                                    ; 50D3   0001
        MVII    #$50DD, R5                      ; 50D4   02BD 00DD 0050
        PSHR    R2                              ; 50D7   0272
        PSHR    R3                              ; 50D8   0273
        SUBI    #$033D, R3                      ; 50D9   033B 033D
        SDBD                                    ; 50DB   0001
        MVI@    R4,     R7                      ; 50DC   02A7

        PULR    R3                              ; 50DD   02B3
        PULR    R2                              ; 50DE   02B2
L_50DF:
        INCR    R3                              ; 50DF   000B
        CMPI    #$0344, R3                      ; 50E0   037B 0344
        BLE     L_50CA                          ; 50E2   0226 0019
        PULR    R7                              ; 50E4   02B7

L_50E5:
        PSHR    R5                              ; 50E5   0275
        MVII    #$0355, R3                      ; 50E6   02BB 0355
        MVII    #$0325, R2                      ; 50E8   02BA 0325
L_50EA:
        CLRR    R5                              ; 50EA   01ED
        MVI@    R2,     R0                      ; 50EB   0290
        ANDI    #$0100, R0                      ; 50EC   03B8 0100
        BNEQ    L_50F1                          ; 50EE   020C 0001

        INCR    R5                              ; 50F0   000D
L_50F1:
        ADDI    #$0018, R2                      ; 50F1   02FA 0018
        MVI@    R2,     R4                      ; 50F3   0294
        TSTR    R4                              ; 50F4   00A4
        BNEQ    L_50F8                          ; 50F5   020C 0001

        INCR    R5                              ; 50F7   000D
L_50F8:
        CLRR    R1                              ; 50F8   01C9
        MVII    #$03FF, R0                      ; 50F9   02B8 03FF
        DIS                                     ; 50FB   0003
        AND@    R3,     R0                      ; 50FC   0398
        MVO@    R1,     R3                      ; 50FD   0259
        EIS                                     ; 50FE   0002
        TSTR    R5                              ; 50FF   00AD
        BNEQ    L_513E                          ; 5100   020C 003C

        ADDI    #$0005, R4                      ; 5102   02FC 0005
        MVI@    R4,     R1                      ; 5104   02A1
        ANDR    R1,     R0                      ; 5105   0188
        BEQ     L_513E                          ; 5106   0204 0036

        MVII    #$000A, R5                      ; 5108   02BD 000A
L_510A:
        SARC    R0,     1                       ; 510A   0078
        BNC     L_5136                          ; 510B   0209 0029

        SLR     R1,     1                       ; 510D   0061
        PSHR    R5                              ; 510E   0275
        PSHR    R4                              ; 510F   0274
        PSHR    R3                              ; 5110   0273
        NOP                                     ; 5111   0034
        PSHR    R2                              ; 5112   0272
        PSHR    R1                              ; 5113   0271
        PSHR    R0                              ; 5114   0270
        SUBI    #$033D, R2                      ; 5115   033A 033D
        NEGR    R5                              ; 5117   0025
        MOVR    R5,     R1                      ; 5118   00A9
        ADDI    #$000A, R1                      ; 5119   02F9 000A
        CMPI    #$0007, R1                      ; 511B   0379 0007
        BGT     L_5128                          ; 511D   020E 0009

        ADDI    #$0325, R1                      ; 511F   02F9 0325
        MVI@    R1,     R0                      ; 5121   0288
        ANDI    #$0100, R0                      ; 5122   03B8 0100
        BEQ     L_512E                          ; 5124   0204 0008

        SUBI    #$0325, R1                      ; 5126   0339 0325
L_5128:
        SDBD                                    ; 5128   0001
        MVII    #$512E, R5                      ; 5129   02BD 002E 0051
        SDBD                                    ; 512C   0001
        MVI@    R4,     R7                      ; 512D   02A7

L_512E:
        PULR    R0                              ; 512E   02B0
        PULR    R1                              ; 512F   02B1
        PULR    R2                              ; 5130   02B2
        PULR    R3                              ; 5131   02B3
        PULR    R4                              ; 5132   02B4
        PULR    R5                              ; 5133   02B5
        B       L_5139                          ; 5134   0200 0003

L_5136:
        SARC    R1,     1                       ; 5136   0079
        BNC     L_513B                          ; 5137   0209 0002

L_5139:
        ADDI    #$0002, R4                      ; 5139   02FC 0002
L_513B:
        DECR    R5                              ; 513B   0015
        BNEQ    L_510A                          ; 513C   022C 0033

L_513E:
        SUBI    #$0017, R2                      ; 513E   033A 0017
        INCR    R3                              ; 5140   000B
        CMPI    #$035D, R3                      ; 5141   037B 035D
        BLT     L_50EA                          ; 5143   0225 005A
        PULR    R7                              ; 5145   02B7

L_5146:
        PSHR    R5                              ; 5146   0275
        MVI     G_011A, R0                      ; 5147   0280 011A
        RRC     R0,     1                       ; 5149   0070
        BC      L_515C                          ; 514A   0201 0010

        SETC                                    ; 514C   0007
        RLC     R0,     1                       ; 514D   0050
        MVO     R0,     G_011A                  ; 514E   0240 011A
        MVII    #$0345, R2                      ; 5150   02BA 0345
        MVII    #$033D, R4                      ; 5152   02BC 033D
        MVII    #$0004, R1                      ; 5154   02B9 0004
        MVII    #$0008, R0                      ; 5156   02B8 0008

        JSR     R5,     L_5172                  ; 5158   0004 0150 0172

        PULR    R7                              ; 515B   02B7

L_515C:
        RRC     R0,     1                       ; 515C   0070
        BC      L_5171                          ; 515D   0201 0012

        MVII    #$0003, R0                      ; 515F   02B8 0003
        MVO     R0,     G_011A                  ; 5161   0240 011A
        MVII    #$02F1, R2                      ; 5163   02BA 02F1
        MVII    #$015D, R4                      ; 5165   02BC 015D
        MVII    #$0002, R1                      ; 5167   02B9 0002
        MVII    #$0002, R0                      ; 5169   02B8 0002
        TSTR    R0                              ; 516B   0080
        BEQ     L_5171                          ; 516C   0204 0003

        JSR     R5,     L_5172                  ; 516E   0004 0150 0172

L_5171:
        PULR    R7                              ; 5171   02B7

L_5172:
        PSHR    R5                              ; 5172   0275
L_5173:
        MVI@    R2,     R3                      ; 5173   0293
        DECLE   $0272,  $037A,  $02F8,  $0206   ; 5174   0272 037A 02F8 0206
        DECLE   $0001,  $000F,  $0001           ; 5178   0001 000F 0001

        MVI@    R4,     R2                      ; 517B   02A2
        TSTR    R2                              ; 517C   0092
        BEQ     L_5188                          ; 517D   0204 0009

        ADDR    R1,     R2                      ; 517F   00CA
        MVI@    R2,     R2                      ; 5180   0292
        PSHR    R0                              ; 5181   0270
        PSHR    R1                              ; 5182   0271

        JSR     R5,     L_518F                  ; 5183   0004 0150 018F

        PULR    R1                              ; 5186   02B1
        PULR    R0                              ; 5187   02B0
L_5188:
        PULR    R2                              ; 5188   02B2
        MVO@    R3,     R2                      ; 5189   0253
        INCR    R2                              ; 518A   000A
        DECR    R0                              ; 518B   0010
        BNEQ    L_5173                          ; 518C   022C 001A
        PULR    R7                              ; 518E   02B7

L_518F:
        PSHR    R5                              ; 518F   0275
        DECR    R2                              ; 5190   0012
        MOVR    R3,     R1                      ; 5191   0099
        ANDI    #$000F, R1                      ; 5192   03B9 000F
        MOVR    R3,     R0                      ; 5194   0098
        SWAP    R0,     1                       ; 5195   0040
        ANDI    #$003E, R0                      ; 5196   03B8 003E
        SLR     R0,     1                       ; 5198   0060
        TSTR    R0                              ; 5199   0080
        BEQ     L_51AD                          ; 519A   0204 0011

        DECR    R0                              ; 519C   0010
        BNEQ    L_51B2                          ; 519D   020C 0013

        TSTR    R3                              ; 519F   009B
        BPL     L_51A4                          ; 51A0   0203 0002

        DECR    R1                              ; 51A2   0011
        INCR    R7                              ; 51A3   000F

L_51A4:
        INCR    R1                              ; 51A4   0009
L_51A5:
        TSTR    R1                              ; 51A5   0089
        BMI     L_51AC                          ; 51A6   020B 0004

        CMPR    R2,     R1                      ; 51A8   0151
        BLE     L_51AD                          ; 51A9   0206 0002

        CLRR    R2                              ; 51AB   01D2
L_51AC:
        MOVR    R2,     R1                      ; 51AC   0091
L_51AD:
        MOVR    R3,     R0                      ; 51AD   0098
        ANDI    #$01F0, R0                      ; 51AE   03B8 01F0
        SLR     R0,     2                       ; 51B0   0064
        SLR     R0,     2                       ; 51B1   0064
L_51B2:
        SDBD                                    ; 51B2   0001
        ANDI    #$81F0, R3                      ; 51B3   03BB 00F0 0081
        SWAP    R0,     1                       ; 51B6   0040
        SLL     R0,     1                       ; 51B7   0048
        XORR    R0,     R3                      ; 51B8   01C3
        XORR    R1,     R3                      ; 51B9   01CB
        PULR    R7                              ; 51BA   02B7

L_51BB:
        MVI     .STIC.BORD,R0                   ; 51BB   0280 002C
        MVO     R0,     G_0175                  ; 51BD   0240 0175
        MVO     R1,     .STIC.BORD              ; 51BF   0241 002C
        MVII    #$0081, R1                      ; 51C1   02B9 0081
        MVO     R1,     G_0102                  ; 51C3   0241 0102
        PULR    R7                              ; 51C5   02B7

        PSHR    R5                              ; 51C6   0275
        MVI     G_0103, R0                      ; 51C7   0280 0103
        TSTR    R0                              ; 51C9   0080
        BEQ     L_51CF                          ; 51CA   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 51CC   0240 0020
L_51CE:
        PULR    R7                              ; 51CE   02B7

L_51CF:
        MVI     G_0102, R1                      ; 51CF   0281 0102
        SUBI    #$0080, R1                      ; 51D1   0339 0080
        BMI     L_51E0                          ; 51D3   020B 000B
        BEQ     L_51BB                          ; 51D5   0224 001B

        DECR    R1                              ; 51D7   0011
        BEQ     L_51CE                          ; 51D8   0224 000B

        MVI     G_0175, R1                      ; 51DA   0281 0175
        MVO     R1,     .STIC.BORD              ; 51DC   0241 002C
        MVO     R0,     G_0102                  ; 51DE   0240 0102
L_51E0:
        MVO     R0,     .STIC.VIDEN             ; 51E0   0240 0020
        INCR    R0                              ; 51E2   0008
        MVO     R0,     G_0103                  ; 51E3   0240 0103

        JSR     R5,     L_5360                  ; 51E5   0004 0150 0360

        MVII    #$0355, R3                      ; 51E8   02BB 0355
        MVII    #$0018, R2                      ; 51EA   02BA 0018
        CLRR    R5                              ; 51EC   01ED
        MVII    #$0008, R4                      ; 51ED   02BC 0008
L_51EF:
        MVI@    R2,     R0                      ; 51EF   0290
        MVO@    R5,     R2                      ; 51F0   0255
        MVI@    R3,     R1                      ; 51F1   0299
        COMR    R0                              ; 51F2   0018
        ANDR    R0,     R1                      ; 51F3   0181
        COMR    R0                              ; 51F4   0018
        XORR    R0,     R1                      ; 51F5   01C1
        MVO@    R1,     R3                      ; 51F6   0259
        INCR    R2                              ; 51F7   000A
        INCR    R3                              ; 51F8   000B
        DECR    R4                              ; 51F9   0014
        BNEQ    L_51EF                          ; 51FA   022C 000C

        MVI     G_0106, R0                      ; 51FC   0280 0106
        MVO     R0,     .STIC.HDLY              ; 51FE   0240 0030
        MVI     G_010A, R0                      ; 5200   0280 010A
        MVO     R0,     .STIC.VDLY              ; 5202   0240 0031
        MVI     G_0104, R2                      ; 5204   0282 0104
        SLL     R2,     1                       ; 5206   004A
        MVII    #$0345, R4                      ; 5207   02BC 0345
        MVII    #$033D, R5                      ; 5209   02BD 033D
        ADDR    R2,     R4                      ; 520B   00D4
        ADDR    R2,     R5                      ; 520C   00D5
L_520D:
        MVI@    R4,     R3                      ; 520D   02A3
        ANDI    #$000F, R3                      ; 520E   03BB 000F
        PSHR    R4                              ; 5210   0274
        MVI@    R5,     R4                      ; 5211   02AC
        TSTR    R4                              ; 5212   00A4
        BEQ     L_526D                          ; 5213   0204 0058

        MVII    #$0169, R1                      ; 5215   02B9 0169
        ADDR    R2,     R1                      ; 5217   00D1
        CMP@    R1,     R3                      ; 5218   034B
        BEQ     L_526D                          ; 5219   0204 0052

        MVO@    R3,     R1                      ; 521B   024B
        PSHR    R5                              ; 521C   0275
        MVII    #$0325, R1                      ; 521D   02B9 0325
        ADDR    R2,     R1                      ; 521F   00D1
        MVI@    R1,     R0                      ; 5220   0288
        PSHR    R1                              ; 5221   0271
        MOVR    R0,     R1                      ; 5222   0081
        SDBD                                    ; 5223   0001
        ANDI    #$FDFF, R0                      ; 5224   03B8 00FF 00FD
        SDBD                                    ; 5227   0001
        ANDI    #$0800, R1                      ; 5228   03B9 0000 0008
        SLR     R1,     2                       ; 522B   0065
        XORR    R1,     R0                      ; 522C   01C8
        PULR    R1                              ; 522D   02B1
        MVO@    R0,     R1                      ; 522E   0248
        ADDI    #$0002, R4                      ; 522F   02FC 0002
        SDBD                                    ; 5231   0001
        MVII    #$6B05, R5                      ; 5232   02BD 0005 006B
        ADDR    R2,     R5                      ; 5235   00D5
        MVI@    R5,     R5                      ; 5236   02AD
        SDBD                                    ; 5237   0001
        ADDI    #$3800, R5                      ; 5238   02FD 0000 0038
        MVII    #$032D, R1                      ; 523B   02B9 032D
        ADDR    R2,     R1                      ; 523D   00D1
        MVI@    R1,     R0                      ; 523E   0288
        SLL     R3,     2                       ; 523F   004F
        SLL     R3,     1                       ; 5240   004B
        SDBD                                    ; 5241   0001
        MVI@    R4,     R1                      ; 5242   02A1
        MOVR    R1,     R4                      ; 5243   008C
        ANDI    #$0080, R0                      ; 5244   03B8 0080
        BEQ     L_525B                          ; 5246   0204 0013

        SLL     R3,     1                       ; 5248   004B
        ADDR    R3,     R4                      ; 5249   00DC
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
        MVI@    R4,     R0                      ; 5254   02A0
        MVO@    R0,     R5                      ; 5255   0268
        MVI@    R4,     R0                      ; 5256   02A0
        MVO@    R0,     R5                      ; 5257   0268
        MVI@    R4,     R0                      ; 5258   02A0
        MVO@    R0,     R5                      ; 5259   0268
        INCR    R7                              ; 525A   000F

L_525B:
        ADDR    R3,     R4                      ; 525B   00DC
L_525C:
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
        MVI@    R4,     R0                      ; 5266   02A0
        MVO@    R0,     R5                      ; 5267   0268
        MVI@    R4,     R0                      ; 5268   02A0
        MVO@    R0,     R5                      ; 5269   0268
        MVI@    R4,     R0                      ; 526A   02A0
        MVO@    R0,     R5                      ; 526B   0268
        PULR    R5                              ; 526C   02B5
L_526D:
        PULR    R4                              ; 526D   02B4
        INCR    R2                              ; 526E   000A
        MOVR    R2,     R0                      ; 526F   0090
        SARC    R0,     1                       ; 5270   0078
        BC      L_520D                          ; 5271   0221 0065

        MVI     G_0104, R2                      ; 5273   0282 0104
        SLL     R2,     1                       ; 5275   004A
        MVII    #$02F1, R4                      ; 5276   02BC 02F1
        MVII    #$015D, R5                      ; 5278   02BD 015D
        ADDR    R2,     R4                      ; 527A   00D4
        SLL     R2,     1                       ; 527B   004A
        ADDR    R2,     R5                      ; 527C   00D5
        SLR     R2,     1                       ; 527D   0062
L_527E:
        MOVR    R2,     R1                      ; 527E   0091
        INCR    R1                              ; 527F   0009
        CMPI    #$0002, R1                      ; 5280   0379 0002
        BGT     L_52B6                          ; 5282   020E 0032

        MVI@    R4,     R3                      ; 5284   02A3
        ANDI    #$000F, R3                      ; 5285   03BB 000F
        PSHR    R4                              ; 5287   0274
        SDBD                                    ; 5288   0001
        MVI@    R5,     R4                      ; 5289   02AC
        PSHR    R5                              ; 528A   0275
        MVII    #$0171, R1                      ; 528B   02B9 0171
        ADDR    R2,     R1                      ; 528D   00D1
        CMP@    R1,     R3                      ; 528E   034B
        BEQ     L_52AF                          ; 528F   0204 001E

        MVO@    R3,     R1                      ; 5291   024B
        SLL     R3,     2                       ; 5292   004F
        SLL     R3,     1                       ; 5293   004B
        SDBD                                    ; 5294   0001
        ADD@    R4,     R3                      ; 5295   02E3
        MOVR    R3,     R4                      ; 5296   009C
        MOVR    R2,     R1                      ; 5297   0091
        SLL     R1,     2                       ; 5298   004D
        SLL     R1,     1                       ; 5299   0049
        SDBD                                    ; 529A   0001
        ADDI    #$3800, R1                      ; 529B   02F9 0000 0038
        MOVR    R1,     R5                      ; 529E   008D
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
        MVI@    R4,     R0                      ; 52A9   02A0
        MVO@    R0,     R5                      ; 52AA   0268
        MVI@    R4,     R0                      ; 52AB   02A0
        MVO@    R0,     R5                      ; 52AC   0268
        MVI@    R4,     R0                      ; 52AD   02A0
        MVO@    R0,     R5                      ; 52AE   0268
L_52AF:
        PULR    R5                              ; 52AF   02B5
        PULR    R4                              ; 52B0   02B4
        INCR    R2                              ; 52B1   000A
        MOVR    R2,     R0                      ; 52B2   0090
        SARC    R0,     1                       ; 52B3   0078
        BC      L_527E                          ; 52B4   0221 0037

L_52B6:
        JSR     R5,     L_5406                  ; 52B6   0004 0154 0006

        CLRR    R2                              ; 52B9   01D2
        MVI     G_0104, R1                      ; 52BA   0281 0104
        RRC     R1,     1                       ; 52BC   0071
        BC      L_52C5                          ; 52BD   0201 0006

        MVI     G_0109, R0                      ; 52BF   0280 0109

        JSR     R5,     X_EXT_SIGN_LO           ; 52C1   0004 0114 0268

        MOVR    R0,     R2                      ; 52C4   0082
L_52C5:
        MVII    #$00FF, R0                      ; 52C5   02B8 00FF
        MVII    #$0325, R3                      ; 52C7   02BB 0325
        MVII    #$0125, R4                      ; 52C9   02BC 0125

        JSR     R5,     L_5329                  ; 52CB   0004 0150 0329

        CLRR    R2                              ; 52CE   01D2
        MVI     G_0104, R1                      ; 52CF   0281 0104
        RRC     R1,     1                       ; 52D1   0071
        BNC     L_52DA                          ; 52D2   0209 0006

        MVI     G_010D, R0                      ; 52D4   0280 010D

        JSR     R5,     X_EXT_SIGN_LO           ; 52D6   0004 0114 0268

        MOVR    R0,     R2                      ; 52D9   0082
L_52DA:
        MVII    #$007F, R0                      ; 52DA   02B8 007F
        MVII    #$032D, R3                      ; 52DC   02BB 032D
        MVII    #$0135, R4                      ; 52DE   02BC 0135

        JSR     R5,     L_5329                  ; 52E0   0004 0150 0329

        MVII    #$0100, R4                      ; 52E3   02BC 0100
        SDBD                                    ; 52E5   0001
        MVI@    R4,     R0                      ; 52E6   02A0
        SDBD                                    ; 52E7   0001
        CMPI    #$5450, R0                      ; 52E8   0378 0050 0054
        BNEQ    L_52F0                          ; 52EB   020C 0003

        JSR     R5,     L_5498                  ; 52ED   0004 0154 0098
L_52F0:
        JSR     R5,     X_PLAY_NOTE             ; 52F0   0004 0118 02BD
        JSR     R5,     L_5CC6                  ; 52F3   0004 015C 00C6

        CLRR    R1                              ; 52F6   01C9
        MVII    #$034D, R3                      ; 52F7   02BB 034D
L_52F9:
        CLRC                                    ; 52F9   0006
        MVI@    R3,     R0                      ; 52FA   0298
        TSTR    R0                              ; 52FB   0080
        BEQ     L_5302                          ; 52FC   0204 0004

        DECR    R0                              ; 52FE   0010
        BNEQ    L_5302                          ; 52FF   020C 0001

        SETC                                    ; 5301   0007
L_5302:
        RRC     R1,     1                       ; 5302   0071
        MVO@    R0,     R3                      ; 5303   0258
        INCR    R3                              ; 5304   000B
        CMPI    #$0354, R3                      ; 5305   037B 0354
        BLE     L_52F9                          ; 5307   0226 000F

        SWAP    R1,     1                       ; 5309   0041
        MVI     G_0117, R0                      ; 530A   0280 0117
        COMR    R0                              ; 530C   0018
        ANDR    R0,     R1                      ; 530D   0181
        COMR    R0                              ; 530E   0018
        XORR    R0,     R1                      ; 530F   01C1
        MVO     R1,     G_0117                  ; 5310   0241 0117
        MVI     G_0118, R0                      ; 5312   0280 0118
        TSTR    R0                              ; 5314   0080
        BEQ     L_531E                          ; 5315   0204 0007

        AND     G_011A, R0                      ; 5317   0380 011A
        MVO     R0,     G_011A                  ; 5319   0240 011A
        DECR    R0                              ; 531B   0010
        MVO     R0,     G_0118                  ; 531C   0240 0118
L_531E:
        MVI     G_0104, R0                      ; 531E   0280 0104
        INCR    R0                              ; 5320   0008
        ANDI    #$0003, R0                      ; 5321   03B8 0003
        MVO     R0,     G_0104                  ; 5323   0240 0104
        CLRR    R0                              ; 5325   01C0
        MVO     R0,     G_0103                  ; 5326   0240 0103
        PULR    R7                              ; 5328   02B7

L_5329:
        PSHR    R5                              ; 5329   0275
        MVII    #$0008, R5                      ; 532A   02BD 0008
L_532C:
        PSHR    R5                              ; 532C   0275
        MVI@    R3,     R1                      ; 532D   0299
        SDBD                                    ; 532E   0001
        MVII    #$4000, R5                      ; 532F   02BD 0000 0040
        ANDR    R1,     R5                      ; 5332   018D
        BEQ     L_533A                          ; 5333   0204 0005

        JSR     R5,     L_537E                  ; 5335   0004 0150 037E

        B       L_535A                          ; 5338   0200 0020

L_533A:
        PSHR    R2                              ; 533A   0272
        ANDR    R0,     R1                      ; 533B   0181
        PSHR    R0                              ; 533C   0270
        SWAP    R1,     1                       ; 533D   0041
        PSHR    R4                              ; 533E   0274
        XOR@    R4,     R1                      ; 533F   03E1
        MVI@    R4,     R0                      ; 5340   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5341   0004 0114 0268

        MVI     G_0116, R2                      ; 5344   0282 0116

        JSR     R5,     L_5508                  ; 5346   0004 0154 0108

        ADDR    R0,     R1                      ; 5349   00C1
        PULR    R2                              ; 534A   02B2
        MVO@    R1,     R2                      ; 534B   0251
        SWAP    R1,     1                       ; 534C   0041
        PULR    R0                              ; 534D   02B0
        ANDR    R0,     R1                      ; 534E   0181
        MOVR    R0,     R2                      ; 534F   0082
        COMR    R2                              ; 5350   001A
        PULR    R5                              ; 5351   02B5
        AND@    R3,     R2                      ; 5352   039A
        BMI     L_5357                          ; 5353   020B 0002

        SUBR    R5,     R1                      ; 5355   0129
        ANDR    R0,     R1                      ; 5356   0181
L_5357:
        XORR    R2,     R1                      ; 5357   01D1
        MVO@    R1,     R3                      ; 5358   0259
        MOVR    R5,     R2                      ; 5359   00AA
L_535A:
        INCR    R3                              ; 535A   000B
        PULR    R5                              ; 535B   02B5
        DECR    R5                              ; 535C   0015
        BNEQ    L_532C                          ; 535D   022C 0032
        PULR    R7                              ; 535F   02B7

L_5360:
        MVII    #$0001, R1                      ; 5360   02B9 0001
        INCR    R7                              ; 5362   000F

        CLRR    R1                              ; 5363   01C9
L_5364:
        PSHR    R5                              ; 5364   0275
        MVII    #$0325, R4                      ; 5365   02BC 0325
        CLRR    R5                              ; 5367   01ED
        ADDI    #$0002, R1                      ; 5368   02F9 0002
L_536A:
        MVI@    R4,     R0                      ; 536A   02A0
        MVO@    R0,     R5                      ; 536B   0268
        MVI@    R4,     R0                      ; 536C   02A0
        MVO@    R0,     R5                      ; 536D   0268
        MVI@    R4,     R0                      ; 536E   02A0
        MVO@    R0,     R5                      ; 536F   0268
        MVI@    R4,     R0                      ; 5370   02A0
        MVO@    R0,     R5                      ; 5371   0268
        MVI@    R4,     R0                      ; 5372   02A0
        MVO@    R0,     R5                      ; 5373   0268
        MVI@    R4,     R0                      ; 5374   02A0
        MVO@    R0,     R5                      ; 5375   0268
        MVI@    R4,     R0                      ; 5376   02A0
        MVO@    R0,     R5                      ; 5377   0268
        MVI@    R4,     R0                      ; 5378   02A0
        MVO@    R0,     R5                      ; 5379   0268
        DECR    R1                              ; 537A   0011
        BNEQ    L_536A                          ; 537B   022C 0012
        PULR    R7                              ; 537D   02B7

L_537E:
        PSHR    R5                              ; 537E   0275
        PSHR    R0                              ; 537F   0270
        MOVR    R0,     R5                      ; 5380   0085
        DECR    R3                              ; 5381   0013
        MVI@    R3,     R1                      ; 5382   0299
        ANDR    R0,     R1                      ; 5383   0181
        INCR    R3                              ; 5384   000B
        INCR    R4                              ; 5385   000C
        MVI@    R4,     R0                      ; 5386   02A0
        PSHR    R5                              ; 5387   0275

        JSR     R5,     X_EXT_SIGN_LO           ; 5388   0004 0114 0268

        PULR    R5                              ; 538B   02B5
        ADDR    R0,     R1                      ; 538C   00C1
        ANDR    R5,     R1                      ; 538D   01A9
        COMR    R5                              ; 538E   001D
        AND@    R3,     R5                      ; 538F   039D
        XORR    R5,     R1                      ; 5390   01E9
        MVO@    R1,     R3                      ; 5391   0259
        PULR    R0                              ; 5392   02B0
        PULR    R7                              ; 5393   02B7

        PSHR    R5                              ; 5394   0275
        DIS                                     ; 5395   0003

        JSR     R5,     L_53AE                  ; 5396   0004 0150 03AE

        MVII    #$0020, R0                      ; 5399   02B8 0020
        CLRR    R4                              ; 539B   01E4
        MVO     R4,     G_0119                  ; 539C   0244 0119

        JSR     R5,     X_FILL_ZERO             ; 539E   0004 0114 0338
        JSR     R5,     L_53CE                  ; 53A1   0004 0150 03CE

        MVII    #$00C6, R0                      ; 53A4   02B8 00C6
        MVO     R0,     .ISRVEC.0               ; 53A6   0240 0100
        MVII    #$0051, R0                      ; 53A8   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 53AA   0240 0101
        EIS                                     ; 53AC   0002
        PULR    R7                              ; 53AD   02B7

L_53AE:
        PSHR    R5                              ; 53AE   0275
        CLRR    R0                              ; 53AF   01C0
        MVO     R0,     .STIC.HDLY              ; 53B0   0240 0030
        MVO     R0,     .STIC.VDLY              ; 53B2   0240 0031
        SDBD                                    ; 53B4   0001
        MVII    #$6A5D, R4                      ; 53B5   02BC 005D 006A
        MVI@    R4,     R0                      ; 53B8   02A0
        MVO     R0,     G_0105                  ; 53B9   0240 0105
        MVII    #$0021, R1                      ; 53BB   02B9 0021
        TSTR    R0                              ; 53BD   0080
        BEQ     L_53C2                          ; 53BE   0204 0002

        MVO@    R0,     R1                      ; 53C0   0248
        INCR    R7                              ; 53C1   000F

L_53C2:
        MVI@    R1,     R0                      ; 53C2   0288
L_53C3:
        MVII    #$0028, R1                      ; 53C3   02B9 0028
        MVII    #$0005, R0                      ; 53C5   02B8 0005

        JSR     R5,     .EXEC.730               ; 53C7   0004 0114 0330

        MVI@    R4,     R0                      ; 53CA   02A0
        MVO     R0,     .STIC.EDGE              ; 53CB   0240 0032
        PULR    R7                              ; 53CD   02B7

L_53CE:
        PSHR    R5                              ; 53CE   0275
        MVII    #$0002, R0                      ; 53CF   02B8 0002
        MVII    #$02F1, R1                      ; 53D1   02B9 02F1
        SDBD                                    ; 53D3   0001
        MVII    #$571B, R4                      ; 53D4   02BC 001B 0057
        TSTR    R0                              ; 53D7   0080
        BEQ     L_53E8                          ; 53D8   0204 000E

        JSR     R5,     .EXEC.730               ; 53DA   0004 0114 0330

        MVII    #$0002, R0                      ; 53DD   02B8 0002
        MVII    #$015D, R5                      ; 53DF   02BD 015D
L_53E1:
        MVI@    R4,     R1                      ; 53E1   02A1
        MVO@    R1,     R5                      ; 53E2   0269
        MVI@    R4,     R1                      ; 53E3   02A1
        MVO@    R1,     R5                      ; 53E4   0269
        DECR    R0                              ; 53E5   0010
        BNEQ    L_53E1                          ; 53E6   022C 0006

L_53E8:
        SDBD                                    ; 53E8   0001
        MVII    #$68DF, R4                      ; 53E9   02BC 00DF 0068

        JSR     R5,     L_53F0                  ; 53EC   0004 0150 03F0

        PULR    R7                              ; 53EF   02B7

L_53F0:
        PSHR    R5                              ; 53F0   0275
        MVI@    R4,     R5                      ; 53F1   02A5
        SDBD                                    ; 53F2   0001
        ADDI    #$3800, R5                      ; 53F3   02FD 0000 0038
        MVI@    R4,     R0                      ; 53F6   02A0
L_53F7:
        MVI@    R4,     R1                      ; 53F7   02A1
        MOVR    R1,     R2                      ; 53F8   008A
        SWAP    R2,     1                       ; 53F9   0042
        ANDI    #$0003, R2                      ; 53FA   03BA 0003
        ANDI    #$00FF, R1                      ; 53FC   03B9 00FF
L_53FE:
        MVO@    R1,     R5                      ; 53FE   0269
        DECR    R2                              ; 53FF   0012
        BPL     L_53FE                          ; 5400   0223 0003

        DECR    R0                              ; 5402   0010
        BNEQ    L_53F7                          ; 5403   022C 000D
        PULR    R7                              ; 5405   02B7

L_5406:
        PSHR    R5                              ; 5406   0275
        MVII    #$0106, R4                      ; 5407   02BC 0106
        MVI     G_0104, R2                      ; 5409   0282 0104
        ANDI    #$0001, R2                      ; 540B   03BA 0001
        BEQ     L_5411                          ; 540D   0204 0002

        ADDI    #$0004, R4                      ; 540F   02FC 0004
L_5411:
        MVI@    R4,     R1                      ; 5411   02A1
        SWAP    R1,     1                       ; 5412   0041
        XOR@    R4,     R1                      ; 5413   03E1
        MVI@    R4,     R0                      ; 5414   02A0
        PSHR    R2                              ; 5415   0272

        JSR     R5,     X_EXT_SIGN_LO           ; 5416   0004 0114 0268

        MVI     G_010E, R2                      ; 5419   0282 010E

        JSR     R5,     L_5508                  ; 541B   0004 0154 0108

        PULR    R2                              ; 541E   02B2
        ADDR    R0,     R1                      ; 541F   00C1
        MOVR    R1,     R0                      ; 5420   0088
        SLL     R2,     1                       ; 5421   004A
        SAR     R0,     2                       ; 5422   006C
        SAR     R0,     2                       ; 5423   006C
        SAR     R0,     2                       ; 5424   006C
        SAR     R0,     2                       ; 5425   006C
        BMI     L_542D                          ; 5426   020B 0005

        CMPI    #$0007, R0                      ; 5428   0378 0007
        BLE     L_5446                          ; 542A   0206 001A
        INCR    R7                              ; 542C   000F

L_542D:
        INCR    R2                              ; 542D   000A
L_542E:
        MVO     R2,     G_010F                  ; 542E   0242 010F
        MVI     .ISRVEC.0,R2                    ; 5430   0282 0100
        MVO     R2,     G_0173                  ; 5432   0242 0173
        MVI     .ISRVEC.1,R2                    ; 5434   0282 0101
        MVO     R2,     G_0174                  ; 5436   0242 0174
        SDBD                                    ; 5438   0001
        MVII    #$0050, R2                      ; 5439   02BA 0050 0000
        MVO     R2,     .ISRVEC.0               ; 543C   0242 0100
        SDBD                                    ; 543E   0001
        MVII    #$0054, R2                      ; 543F   02BA 0054 0000
        MVO     R2,     .ISRVEC.1               ; 5442   0242 0101
        ANDI    #$0007, R0                      ; 5444   03B8 0007
L_5446:
        SUBI    #$0003, R4                      ; 5446   033C 0003
        MOVR    R0,     R2                      ; 5448   0082
        SUB@    R4,     R2                      ; 5449   0322
        DECR    R4                              ; 544A   0014
        MVO@    R0,     R4                      ; 544B   0260
        MVO@    R1,     R4                      ; 544C   0261
        INCR    R4                              ; 544D   000C
        MVO@    R2,     R4                      ; 544E   0262
        PULR    R7                              ; 544F   02B7

        PSHR    R5                              ; 5450   0275
        MVO     R0,     .STIC.VIDEN             ; 5451   0240 0020
        MVI     G_0103, R0                      ; 5453   0280 0103
        TSTR    R0                              ; 5455   0080
        BEQ     L_5459                          ; 5456   0204 0001
        PULR    R7                              ; 5458   02B7

L_5459:
        INCR    R0                              ; 5459   0008
        MVO     R0,     G_0103                  ; 545A   0240 0103
        MVI     G_0106, R0                      ; 545C   0280 0106
        MVO     R0,     .STIC.HDLY              ; 545E   0240 0030
        MVI     G_010A, R0                      ; 5460   0280 010A
        MVO     R0,     .STIC.VDLY              ; 5462   0240 0031
        MVII    #$0008, R5                      ; 5464   02BD 0008
        MVII    #$032D, R4                      ; 5466   02BC 032D
        MVI     G_010F, R2                      ; 5468   0282 010F
        RRC     R2,     2                       ; 546A   0076
        BOV     L_546F                          ; 546B   0202 0002

        SUBR    R5,     R4                      ; 546D   012C
        CLRR    R5                              ; 546E   01ED
L_546F:
        MVI@    R4,     R0                      ; 546F   02A0
        MVO@    R0,     R5                      ; 5470   0268
        MVI@    R4,     R0                      ; 5471   02A0
        MVO@    R0,     R5                      ; 5472   0268
        MVI@    R4,     R0                      ; 5473   02A0
        MVO@    R0,     R5                      ; 5474   0268
        MVI@    R4,     R0                      ; 5475   02A0
        MVO@    R0,     R5                      ; 5476   0268
        MVI@    R4,     R0                      ; 5477   02A0
        MVO@    R0,     R5                      ; 5478   0268
        MVI@    R4,     R0                      ; 5479   02A0
        MVO@    R0,     R5                      ; 547A   0268
        MVI@    R4,     R0                      ; 547B   02A0
        MVO@    R0,     R5                      ; 547C   0268
        MVI@    R4,     R0                      ; 547D   02A0
        MVO@    R0,     R5                      ; 547E   0268
        MVI     G_010F, R2                      ; 547F   0282 010F

        JSR     R5,     L_54BF                  ; 5481   0004 0154 00BF
        JSR     R5,     L_649A                  ; 5484   0004 0164 009A
        JSR     R5,     X_PLAY_NOTE             ; 5487   0004 0118 02BD

        DIS                                     ; 548A   0003
        MVI     G_0173, R0                      ; 548B   0280 0173
        MVO     R0,     .ISRVEC.0               ; 548D   0240 0100
        MVI     G_0174, R0                      ; 548F   0280 0174
        MVO     R0,     .ISRVEC.1               ; 5491   0240 0101
        EIS                                     ; 5493   0002
        CLRR    R0                              ; 5494   01C0
        MVO     R0,     G_0103                  ; 5495   0240 0103
        PULR    R7                              ; 5497   02B7

L_5498:
        PSHR    R5                              ; 5498   0275
        MVII    #$0008, R5                      ; 5499   02BD 0008
        MVII    #$0325, R3                      ; 549B   02BB 0325
        MVII    #$0008, R0                      ; 549D   02B8 0008
        MVI     G_010F, R1                      ; 549F   0281 010F
        RRC     R1,     1                       ; 54A1   0071
        BNC     L_54A5                          ; 54A2   0209 0001

        NEGR    R0                              ; 54A4   0020
L_54A5:
        MVII    #$00FF, R2                      ; 54A5   02BA 00FF
        RRC     R1,     1                       ; 54A7   0071
        BNC     L_54AD                          ; 54A8   0209 0003

        ADDR    R5,     R3                      ; 54AA   00EB
        MVII    #$007F, R2                      ; 54AB   02BA 007F
L_54AD:
        MVI@    R3,     R4                      ; 54AD   029C
        TSTR    R4                              ; 54AE   00A4
        BPL     L_54BA                          ; 54AF   0203 0009

        COMR    R2                              ; 54B1   001A
        ANDR    R2,     R4                      ; 54B2   0194
        COMR    R2                              ; 54B3   001A
        MVI@    R3,     R1                      ; 54B4   0299
        ANDR    R2,     R1                      ; 54B5   0191
        ADDR    R0,     R1                      ; 54B6   00C1
        ANDR    R2,     R1                      ; 54B7   0191
        XORR    R4,     R1                      ; 54B8   01E1
        MVO@    R1,     R3                      ; 54B9   0259
L_54BA:
        INCR    R3                              ; 54BA   000B
        DECR    R5                              ; 54BB   0015
        BNEQ    L_54AD                          ; 54BC   022C 0010
        PULR    R7                              ; 54BE   02B7

L_54BF:
        PSHR    R5                              ; 54BF   0275
        PSHR    R2                              ; 54C0   0272
        RRC     R2,     1                       ; 54C1   0072
        BC      L_54FB                          ; 54C2   0201 0037

        MVII    #$02C8, R4                      ; 54C4   02BC 02C8
        MVII    #$02DC, R5                      ; 54C6   02BD 02DC
        MVII    #$0028, R1                      ; 54C8   02B9 0028
        MVII    #$000B, R2                      ; 54CA   02BA 000B
L_54CC:
        MVI@    R4,     R0                      ; 54CC   02A0
        MVO@    R0,     R5                      ; 54CD   0268
        MVI@    R4,     R0                      ; 54CE   02A0
        MVO@    R0,     R5                      ; 54CF   0268
        MVI@    R4,     R0                      ; 54D0   02A0
        MVO@    R0,     R5                      ; 54D1   0268
        MVI@    R4,     R0                      ; 54D2   02A0
        MVO@    R0,     R5                      ; 54D3   0268
        MVI@    R4,     R0                      ; 54D4   02A0
        MVO@    R0,     R5                      ; 54D5   0268
        MVI@    R4,     R0                      ; 54D6   02A0
        MVO@    R0,     R5                      ; 54D7   0268
        MVI@    R4,     R0                      ; 54D8   02A0
        MVO@    R0,     R5                      ; 54D9   0268
        MVI@    R4,     R0                      ; 54DA   02A0
        MVO@    R0,     R5                      ; 54DB   0268
        MVI@    R4,     R0                      ; 54DC   02A0
        MVO@    R0,     R5                      ; 54DD   0268
        MVI@    R4,     R0                      ; 54DE   02A0
        MVO@    R0,     R5                      ; 54DF   0268
        MVI@    R4,     R0                      ; 54E0   02A0
        MVO@    R0,     R5                      ; 54E1   0268
        MVI@    R4,     R0                      ; 54E2   02A0
        MVO@    R0,     R5                      ; 54E3   0268
        MVI@    R4,     R0                      ; 54E4   02A0
        MVO@    R0,     R5                      ; 54E5   0268
        MVI@    R4,     R0                      ; 54E6   02A0
        MVO@    R0,     R5                      ; 54E7   0268
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
        SUBR    R1,     R4                      ; 54F4   010C
        SUBR    R1,     R5                      ; 54F5   010D
        DECR    R2                              ; 54F6   0012
        BNEQ    L_54CC                          ; 54F7   022C 002C
        B       L_5506                          ; 54F9   0200 000B

L_54FB:
        MVII    #$0200, R5                      ; 54FB   02BD 0200
        MVII    #$0214, R4                      ; 54FD   02BC 0214
        MVII    #$00DC, R1                      ; 54FF   02B9 00DC
L_5501:
        MVI@    R4,     R0                      ; 5501   02A0
        MVO@    R0,     R5                      ; 5502   0268
        DECR    R1                              ; 5503   0011
        BNEQ    L_5501                          ; 5504   022C 0004

L_5506:
        PULR    R2                              ; 5506   02B2
        PULR    R7                              ; 5507   02B7

L_5508:
        TSTR    R2                              ; 5508   0092
        BEQ     L_550F                          ; 5509   0204 0004

L_550B:
        SLL     R0,     1                       ; 550B   0048
        DECR    R2                              ; 550C   0012
        BNEQ    L_550B                          ; 550D   022C 0003
L_550F:
        MOVR    R5,     R7                      ; 550F   00AF

L_5510:
        MVII    #$0080, R3                      ; 5510   02BB 0080
        INCR    R7                              ; 5512   000F

L_5513:
        CLRR    R3                              ; 5513   01DB
L_5514:
        MVI@    R5,     R1                      ; 5514   02A9
        MVII    #$0160, R2                      ; 5515   02BA 0160
L_5517:
        INCR    R2                              ; 5517   000A
        RRC     R1,     1                       ; 5518   0071
        BC      L_5520                          ; 5519   0201 0005

        CMPI    #$0168, R2                      ; 551B   037A 0168
        BLT     L_5517                          ; 551D   0225 0007
        MOVR    R5,     R7                      ; 551F   00AF

L_5520:
        MVI@    R2,     R0                      ; 5520   0290
        ANDI    #$007F, R0                      ; 5521   03B8 007F
        XORR    R3,     R0                      ; 5523   01D8
        MVO@    R0,     R2                      ; 5524   0250
        B       L_5517                          ; 5525   0220 000F

L_5527:
        MVII    #$0008, R2                      ; 5527   02BA 0008
        CLRR    R3                              ; 5529   01DB
L_552A:
        DECR    R2                              ; 552A   0012
        INCR    R7                              ; 552B   000F

L_552C:
        CLRR    R2                              ; 552C   01D2
L_552D:
        NOP                                     ; 552D   0034
        PSHR    R5                              ; 552E   0275
        MOVR    R3,     R4                      ; 552F   009C
        MOVR    R3,     R5                      ; 5530   009D
        MOVR    R3,     R1                      ; 5531   0099
        ADDI    #$0325, R4                      ; 5532   02FC 0325
        ADDI    #$033D, R5                      ; 5534   02FD 033D
        ADDI    #$0355, R1                      ; 5536   02F9 0355
L_5538:
        CLRR    R0                              ; 5538   01C0
        MVO@    R0,     R4                      ; 5539   0260
        MVO@    R0,     R5                      ; 553A   0268
        MVO@    R0,     R1                      ; 553B   0248
        INCR    R1                              ; 553C   0009
        PSHR    R5                              ; 553D   0275
        ADDI    #$000F, R5                      ; 553E   02FD 000F
        MVO@    R0,     R5                      ; 5540   0268
        SUBI    #$034E, R5                      ; 5541   033D 034E
        MOVR    R5,     R0                      ; 5543   00A8

        JSR     R5,     X_POW2                  ; 5544   0004 0114 0345

        COMR    R0                              ; 5547   0018
        DIS                                     ; 5548   0003
        AND     G_0117, R0                      ; 5549   0380 0117
        MVO     R0,     G_0117                  ; 554B   0240 0117
        EIS                                     ; 554D   0002
        PULR    R5                              ; 554E   02B5
        DECR    R2                              ; 554F   0012
        BPL     L_5538                          ; 5550   0223 0019
        PULR    R7                              ; 5552   02B7

L_5553:
        PSHR    R5                              ; 5553   0275
        MOVR    R3,     R2                      ; 5554   009A
        ADDI    #$0325, R2                      ; 5555   02FA 0325
        MVI@    R2,     R0                      ; 5557   0290
        PSHR    R1                              ; 5558   0271
        PSHR    R0                              ; 5559   0270

        JSR     R5,     L_552C                  ; 555A   0004 0154 012C

        PULR    R0                              ; 555D   02B0
        PULR    R1                              ; 555E   02B1
        MOVR    R3,     R2                      ; 555F   009A
        ADDI    #$0169, R2                      ; 5560   02FA 0169
        ADDI    #$0325, R3                      ; 5562   02FB 0325
        MVO@    R3,     R2                      ; 5564   0253
        MVO@    R0,     R3                      ; 5565   0258
        ADDI    #$0018, R3                      ; 5566   02FB 0018
        MVO@    R1,     R3                      ; 5568   0259
        PULR    R7                              ; 5569   02B7

L_556A:
        DECR    R2                              ; 556A   0012
        INCR    R7                              ; 556B   000F

L_556C:
        CLRR    R2                              ; 556C   01D2
L_556D:
        PSHR    R5                              ; 556D   0275
L_556E:
        MVII    #$0002, R1                      ; 556E   02B9 0002

        JSR     R5,     L_559A                  ; 5570   0004 0154 019A

        SDBD                                    ; 5573   0001
        MVI@    R4,     R0                      ; 5574   02A0
        MVI@    R3,     R1                      ; 5575   0299
        SDBD                                    ; 5576   0001
        ANDI    #$0FF8, R1                      ; 5577   03B9 00F8 000F
        XORR    R0,     R1                      ; 557A   01C1
        MVO@    R1,     R3                      ; 557B   0259
        ADDI    #$0008, R3                      ; 557C   02FB 0008
        MVII    #$0003, R1                      ; 557E   02B9 0003

        JSR     R5,     L_559A                  ; 5580   0004 0154 019A

        SUBI    #$0355, R3                      ; 5583   033B 0355
        MVII    #$0169, R1                      ; 5585   02B9 0169
        ADDR    R3,     R1                      ; 5587   00D9
        MVO@    R1,     R1                      ; 5588   0249
        PSHR    R3                              ; 5589   0273
        SLL     R3,     1                       ; 558A   004B
        ADDI    #$0126, R3                      ; 558B   02FB 0126
        MVI@    R4,     R0                      ; 558D   02A0
        MVO@    R0,     R3                      ; 558E   0258
        ADDI    #$0010, R3                      ; 558F   02FB 0010
        MVI@    R4,     R0                      ; 5591   02A0
        MVO@    R0,     R3                      ; 5592   0258
        PULR    R3                              ; 5593   02B3
        ADDI    #$0326, R3                      ; 5594   02FB 0326
        DECR    R2                              ; 5596   0012
        BPL     L_556E                          ; 5597   0223 002A
        PULR    R7                              ; 5599   02B7

L_559A:
        SDBD                                    ; 559A   0001
        MVI@    R4,     R0                      ; 559B   02A0
        MVO@    R0,     R3                      ; 559C   0258
        ADDI    #$0008, R3                      ; 559D   02FB 0008
        DECR    R1                              ; 559F   0011
        BNEQ    L_559A                          ; 55A0   022C 0007
        MOVR    R5,     R7                      ; 55A2   00AF

L_55A3:
        MVI@    R4,     R0                      ; 55A3   02A0
        ANDI    #$00FF, R0                      ; 55A4   03B8 00FF
        ADDI    #$0007, R4                      ; 55A6   02FC 0007
        MVI@    R4,     R1                      ; 55A8   02A1
        ANDI    #$007F, R1                      ; 55A9   03B9 007F
        PSHR    R5                              ; 55AB   0275

        JSR     R5,     .EXEC.78C               ; 55AC   0004 0114 038C

        MOVR    R0,     R3                      ; 55AF   0083
        MOVR    R1,     R4                      ; 55B0   008C
        MOVR    R2,     R1                      ; 55B1   0091
        SDBD                                    ; 55B2   0001
        MVII    #$7FA5, R0                      ; 55B3   02B8 00A5 007F
        CMPR    R0,     R1                      ; 55B6   0141
        BNC     L_55BA                          ; 55B7   0209 0001

        MOVR    R0,     R1                      ; 55B9   0081
L_55BA:
        J       .EXEC.E24                       ; 55BA   0004 031C 0224

L_55BD:
        PSHR    R5                              ; 55BD   0275
        PSHR    R4                              ; 55BE   0274
        PSHR    R1                              ; 55BF   0271

        JSR     R5,     L_55A3                  ; 55C0   0004 0154 01A3

        MOVR    R3,     R0                      ; 55C3   0098
        MOVR    R2,     R3                      ; 55C4   0093
        PULR    R1                              ; 55C5   02B1
        PSHR    R1                              ; 55C6   0271

        JSR     R5,     X_MPY                   ; 55C7   0004 011C 01DC

        MOVR    R2,     R1                      ; 55CA   0091
        MOVR    R3,     R2                      ; 55CB   009A

        JSR     R5,     X_DIVR                  ; 55CC   0004 011C 01F8

        PULR    R1                              ; 55CF   02B1
        PSHR    R0                              ; 55D0   0270
        MOVR    R4,     R0                      ; 55D1   00A0
        MOVR    R1,     R4                      ; 55D2   008C

        JSR     R5,     X_MPY                   ; 55D3   0004 011C 01DC

        MOVR    R2,     R1                      ; 55D6   0091
        MOVR    R3,     R2                      ; 55D7   009A

        JSR     R5,     X_DIVR                  ; 55D8   0004 011C 01F8

        PULR    R1                              ; 55DB   02B1
        PULR    R2                              ; 55DC   02B2
        SUBI    #$0325, R2                      ; 55DD   033A 0325
        PSHR    R2                              ; 55DF   0272
        SLL     R2,     1                       ; 55E0   004A
        ADDI    #$0126, R2                      ; 55E1   02FA 0126
        MVO@    R1,     R2                      ; 55E3   0251
        ADDI    #$0010, R2                      ; 55E4   02FA 0010
        MVO@    R0,     R2                      ; 55E6   0250
        PULR    R2                              ; 55E7   02B2
        PULR    R7                              ; 55E8   02B7

L_55E9:
        CLRR    R1                              ; 55E9   01C9
        CLRR    R2                              ; 55EA   01D2
L_55EB:
        MVO@    R1,     R3                      ; 55EB   0259
        ADDI    #$0010, R3                      ; 55EC   02FB 0010
        MVO@    R2,     R3                      ; 55EE   025A
        MOVR    R5,     R7                      ; 55EF   00AF

L_55F0:
        PSHR    R5                              ; 55F0   0275
        MOVR    R1,     R2                      ; 55F1   008A
        MOVR    R0,     R1                      ; 55F2   0081
        MOVR    R2,     R0                      ; 55F3   0090
        SLR     R0,     1                       ; 55F4   0060

        JSR     R5,     .EXEC.629               ; 55F5   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 55F8   0004 0114 0357

        MOVR    R1,     R2                      ; 55FB   008A
        MOVR    R0,     R1                      ; 55FC   0081
        PULR    R7                              ; 55FD   02B7

L_55FE:
        PSHR    R5                              ; 55FE   0275
        ADDI    #$0325, R3                      ; 55FF   02FB 0325
        MVI@    R3,     R0                      ; 5601   0298
        ANDI    #$00FF, R0                      ; 5602   03B8 00FF

        JSR     R5,     X_CLAMP                 ; 5604   0004 0114 0270

        INCR    R0                              ; 5607   0008
        MOVR    R4,     R0                      ; 5608   00A0
        SUBI    #$0004, R0                      ; 5609   0338 0004
        SLR     R0,     2                       ; 560B   0064
        SLR     R0,     1                       ; 560C   0060
        ADDI    #$0008, R3                      ; 560D   02FB 0008
        MOVR    R0,     R4                      ; 560F   0084
        MVI@    R3,     R1                      ; 5610   0299
        ANDI    #$007F, R1                      ; 5611   03B9 007F

        JSR     R5,     X_CLAMP                 ; 5613   0004 0114 0270

        INCR    R0                              ; 5616   0008
        SLR     R0,     1                       ; 5617   0060
        SUBI    #$0004, R1                      ; 5618   0339 0004
        SLR     R1,     2                       ; 561A   0065
        SLR     R1,     1                       ; 561B   0061
        SLL     R1,     2                       ; 561C   004D
        ADDR    R1,     R4                      ; 561D   00CC
        SLL     R1,     2                       ; 561E   004D
        ADDR    R1,     R4                      ; 561F   00CC
        ADDI    #$0200, R4                      ; 5620   02FC 0200
        SUBI    #$032D, R3                      ; 5622   033B 032D
        PULR    R7                              ; 5624   02B7

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5625   00FF 00FF 00FF 00FF

        EIS                                     ; 5629   0002
        INCR    R1                              ; 562A   0009
        EIS                                     ; 562B   0002
        DIS                                     ; 562C   0003
        SWAP    R0,     2                       ; 562D   0044
        RSWD    R2                              ; 562E   003A
        INCR    R1                              ; 562F   0009
        DECR    R5                              ; 5630   0015
        NEGR    R1                              ; 5631   0021
        INCR    R7                              ; 5632   000F

        SETC                                    ; 5633   0007
L_5634:
        COMR    R1                              ; 5634   0019
        DECLE   $000E,  $001F                   ; 5635   000E 001F

        ADCR    R3                              ; 5637   002B
        DECR    R4                              ; 5638   0014
L_5639:
        PSHR    R5                              ; 5639   0275

        JSR     R5,     L_5527                  ; 563A   0004 0154 0127
        JSR     R5,     L_5510                  ; 563D   0004 0154 0110
        DECLE   $00FF                           ; 5640   00FF

        MVII    #$0106, R4                      ; 5641   02BC 0106
        MVII    #$0008, R0                      ; 5643   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5645   0004 0114 0338

        MVII    #$0176, R4                      ; 5648   02BC 0176
        MOVR    R4,     R1                      ; 564A   00A1
        MVII    #$0079, R0                      ; 564B   02B8 0079

        JSR     R5,     X_FILL_ZERO             ; 564D   0004 0114 0338

        SDBD                                    ; 5650   0001
        MVII    #$5625, R4                      ; 5651   02BC 0025 0056
        MVII    #$0010, R0                      ; 5654   02B8 0010

        JSR     R5,     .EXEC.730               ; 5656   0004 0114 0330

        CLRR    R0                              ; 5659   01C0
        MVO     R0,     G_02F5                  ; 565A   0240 02F5
        MVO     R0,     G_01D4                  ; 565C   0240 01D4
        MVII    #$0003, R0                      ; 565E   02B8 0003
        MVO     R0,     G_0116                  ; 5660   0240 0116
        INCR    R0                              ; 5662   0008
        MVO     R0,     G_010E                  ; 5663   0240 010E
        PULR    R7                              ; 5665   02B7

L_5666:
        PSHR    R5                              ; 5666   0275

        JSR     R5,     L_5639                  ; 5667   0004 0154 0239

        SDBD                                    ; 566A   0001
        MVII    #$00DF, R3                      ; 566B   02BB 00DF 0000

        JSR     R5,     L_64BB                  ; 566E   0004 0164 00BB
        JSR     R5,     L_5513                  ; 5671   0004 0154 0113
        DECLE   $0080                           ; 5674   0080

        MVII    #$0207, R3                      ; 5675   02BB 0207
        MVII    #$0243, R4                      ; 5677   02BC 0243

        JSR     R5,     X_PRINT_R5              ; 5679   0004 0118 007B
        STRING  "WHITE"                         ; 567C  
        DECLE   $0000                           ; 5681   0000

        MVII    #$026B, R4                      ; 5682   02BC 026B

        JSR     R5,     X_PRINT_R5              ; 5684   0004 0118 007B
        STRING  "WATER!"                        ; 5687  
        DECLE   $0000                           ; 568D   0000

        MVII    #$02A9, R4                      ; 568E   02BC 02A9

        JSR     R5,     X_PRINT_R5              ; 5690   0004 0118 007B
        STRING  "1982"                          ; 5693   0031 0039 0038 0032
        DECLE   $0000                           ; 5697   0000

        MVII    #$02CF, R4                      ; 5698   02BC 02CF

        JSR     R5,     X_PRINT_R5              ; 569A   0004 0118 007B
        STRING  "IMAGIC"                        ; 569D  
        DECLE   $0000                           ; 56A3   0000

        SDBD                                    ; 56A4   0001
        XORI    #$08E0, R3                      ; 56A5   03FB 00E0 0008
        MVO     R3,     .BTAB.A5                ; 56A8   0243 02A5
        J       L_6895                          ; 56AA   0004 0368 0095

        PSHR    R5                              ; 56AD   0275

L_56AE:
        JSR     R5,     L_67FE                  ; 56AE   0004 0164 03FE
        JSR     R5,     L_5639                  ; 56B1   0004 0154 0239
        JSR     R5,     L_5510                  ; 56B4   0004 0154 0110
        DECLE   $00FF                           ; 56B7   00FF

        SDBD                                    ; 56B8   0001
        MVII    #$00D3, R0                      ; 56B9   02B8 00D3 0000
        MVO     R0,     G_02F3                  ; 56BC   0240 02F3
        SLR     R0,     2                       ; 56BE   0064
        SLR     R0,     1                       ; 56BF   0060
        MVO     R0,     G_01E0                  ; 56C0   0240 01E0
        MVII    #$0325, R3                      ; 56C2   02BB 0325
        SDBD                                    ; 56C4   0001
        MVII    #$6C82, R4                      ; 56C5   02BC 0082 006C

        JSR     R5,     L_556C                  ; 56C8   0004 0154 016C

        MVII    #$0068, R1                      ; 56CB   02B9 0068

        JSR     R5,     L_5B3C                  ; 56CD   0004 0158 033C

        CLRR    R3                              ; 56D0   01DB

        JSR     R5,     L_5927                  ; 56D1   0004 0158 0127
        JSR     R5,     L_5B49                  ; 56D4   0004 0158 0349
        JSR     R5,     L_5513                  ; 56D7   0004 0154 0113
        DECLE   $00AD                           ; 56DA   00AD

        PULR    R7                              ; 56DB   02B7

L_56DC:
        PSHR    R5                              ; 56DC   0275
        MVII    #$0003, R1                      ; 56DD   02B9 0003
        MVII    #$019B, R3                      ; 56DF   02BB 019B
L_56E1:
        MVI@    R3,     R0                      ; 56E1   0298
        INCR    R0                              ; 56E2   0008
        MVO@    R0,     R3                      ; 56E3   0258
        CMPI    #$0004, R0                      ; 56E4   0378 0004
        BLT     L_56EF                          ; 56E6   0205 0007

        MVII    #$0001, R0                      ; 56E8   02B8 0001
        MVO@    R0,     R3                      ; 56EA   0258
        INCR    R3                              ; 56EB   000B
        DECR    R1                              ; 56EC   0011
        BNEQ    L_56E1                          ; 56ED   022C 000D

L_56EF:
        MVII    #$019D, R3                      ; 56EF   02BB 019D
        MVII    #$0002, R2                      ; 56F1   02BA 0002
L_56F3:
        MVI@    R3,     R0                      ; 56F3   0298
        DECR    R3                              ; 56F4   0013
        CMP@    R3,     R0                      ; 56F5   0358
        BLE     L_56F9                          ; 56F6   0206 0001

        MVO@    R0,     R3                      ; 56F8   0258
L_56F9:
        DECR    R2                              ; 56F9   0012
        BNEQ    L_56F3                          ; 56FA   022C 0008

        TSTR    R1                              ; 56FC   0089
        BNEQ    L_571A                          ; 56FD   020C 001B

        MVI     G_01E3, R0                      ; 56FF   0280 01E3
        INCR    R0                              ; 5701   0008
        CMPI    #$0004, R0                      ; 5702   0378 0004
        BGT     L_571A                          ; 5704   020E 0014

        MVO     R0,     G_01E3                  ; 5706   0240 01E3
        MVII    #$0180, R4                      ; 5708   02BC 0180
        MOVR    R4,     R5                      ; 570A   00A5
        MVII    #$0003, R1                      ; 570B   02B9 0003
        CLRR    R2                              ; 570D   01D2
L_570E:
        ADDI    #$0002, R2                      ; 570E   02FA 0002
        MVI@    R4,     R0                      ; 5710   02A0
        ADDR    R2,     R0                      ; 5711   00D0
        MVO@    R0,     R5                      ; 5712   0268
        DECR    R1                              ; 5713   0011
        BNEQ    L_570E                          ; 5714   022C 0007

        MVI@    R4,     R0                      ; 5716   02A0
        ADDI    #$0002, R0                      ; 5717   02F8 0002
        MVO@    R0,     R5                      ; 5719   0268
L_571A:
        PULR    R7                              ; 571A   02B7

        DECLE   $0040,  $0030,  $0079,  $0069   ; 571B   0040 0030 0079 0069
        DECLE   $007C,  $0069,  $0005,  $00EF   ; 571F   007C 0069 0005 00EF
        DECLE   $005C,  $0001,  $0072,  $005E   ; 5723   005C 0001 0072 005E
        DECLE   $0001                           ; 5727   0001

        ADDR    R0,     R3                      ; 5728   00C3
        SLLC    R1,     2                       ; 5729   005D
        INCR    R7                              ; 572A   000F

        RLC     R1,     1                       ; 572B   0051
L_572C:
        SLLC    R1,     2                       ; 572C   005D
        INCR    R7                              ; 572D   000F

        RLC     R1,     1                       ; 572E   0051
L_572F:
        SLR     R3,     1                       ; 572F   0063
        DECLE   $0001                           ; 5730   0001

        ADDR    R6,     R6                      ; 5731   00F6
        RLC     R3,     2                       ; 5732   0057
        EIS                                     ; 5733   0002
        SLLC    R0,     2                       ; 5734   005C
        SAR     R0,     1                       ; 5735   0068
        DIS                                     ; 5736   0003
        MOVR    R0,     R5                      ; 5737   0085
        SLLC    R1,     1                       ; 5738   0059
        ADDR    R5,     R7                      ; 5739   00EF

        RLC     R3,     2                       ; 573A   0057
        SWAP    R3,     1                       ; 573B   0043
        RLC     R3,     2                       ; 573C   0057
        RLC     R3,     2                       ; 573D   0057
        SLLC    R0,     1                       ; 573E   0058
        MOVR    R6,     R3                      ; 573F   00B3
        RLC     R3,     2                       ; 5740   0057
        MOVR    R5,     R7                      ; 5741   00AF

        RLC     R3,     2                       ; 5742   0057
        PSHR    R5                              ; 5743   0275
        CMPI    #$000A, R0                      ; 5744   0378 000A
        BNEQ    L_5750                          ; 5746   020C 0008

        MVI     G_01D9, R1                      ; 5748   0281 01D9
        TSTR    R1                              ; 574A   0089
        BNEQ    L_57F5                          ; 574B   020C 00A8
        J       L_56AE                          ; 574D   0004 0354 02AE

L_5750:
        MVI     G_01D6, R1                      ; 5750   0281 01D6
        AND     G_0176, R1                      ; 5752   0381 0176
        BEQ     L_57F5                          ; 5754   0204 009F

        CMPI    #$000B, R0                      ; 5756   0378 000B
        BEQ     L_5768                          ; 5758   0204 000E

        MOVR    R0,     R1                      ; 575A   0081
        SDBD                                    ; 575B   0001
        ADDI    #$57A5, R1                      ; 575C   02F9 00A5 0057
        MVI@    R1,     R1                      ; 575F   0289
        TSTR    R1                              ; 5760   0089
        BEQ     L_57F5                          ; 5761   0204 0092

        MVO     R0,     G_0196                  ; 5763   0240 0196
        J       L_5BD1                          ; 5765   0004 0358 03D1

L_5768:
        MVI     G_0196, R1                      ; 5768   0281 0196
        SDBD                                    ; 576A   0001
        ADDI    #$57A5, R1                      ; 576B   02F9 00A5 0057
        MVI@    R1,     R1                      ; 576E   0289
        TSTR    R1                              ; 576F   0089
        BEQ     L_57F5                          ; 5770   0204 0083

        MVO     R1,     G_0195                  ; 5772   0241 0195
        SLL     R1,     1                       ; 5774   0049
        SWAP    R1,     1                       ; 5775   0041
        RRC     R1,     1                       ; 5776   0071
        BC      L_577B                          ; 5777   0201 0002

        MVO     R0,     G_01A0                  ; 5779   0240 01A0
L_577B:
        RRC     R1,     1                       ; 577B   0071
        BNC     L_578B                          ; 577C   0209 000D

        PSHR    R1                              ; 577E   0271
        SDBD                                    ; 577F   0001
        MVII    #$5635, R4                      ; 5780   02BC 0035 0056
        MVII    #$0180, R1                      ; 5783   02B9 0180
        MVII    #$0004, R0                      ; 5785   02B8 0004

        JSR     R5,     .EXEC.730               ; 5787   0004 0114 0330

        PULR    R1                              ; 578A   02B1
L_578B:
        RRC     R1,     1                       ; 578B   0071
        BNC     L_5795                          ; 578C   0209 0007

        MVII    #$019B, R4                      ; 578E   02BC 019B
        MVII    #$0003, R2                      ; 5790   02BA 0003
        MVO@    R2,     R4                      ; 5792   0262
        SLR     R2,     1                       ; 5793   0062
        MVO@    R2,     R4                      ; 5794   0262
L_5795:
        CLRR    R0                              ; 5795   01C0
        MVO     R0,     G_0176                  ; 5796   0240 0176

        JSR     R5,     L_5BD0                  ; 5798   0004 0158 03D0
        JSR     R5,     L_5C1E                  ; 579B   0004 015C 001E
        JSR     R5,     L_5513                  ; 579E   0004 0154 0113
        DECLE   $0040                           ; 57A1   0040

        J       L_6876                          ; 57A2   0004 0368 0076

        DECLE   $0000,  $0220,  $0321,  $001D   ; 57A5   0000 0220 0321 001D
        DECLE   $0320,  $0000,  $031D,  $0221   ; 57A9   0320 0000 031D 0221
        DECLE   $0000                           ; 57AD   0000

        MOVR    R1,     R7                      ; 57AE   008F

        MVII    #$000C, R1                      ; 57AF   02B9 000C
        B       L_57B5                          ; 57B1   0200 0002

        MVII    #$0004, R1                      ; 57B3   02B9 0004
L_57B5:
        PSHR    R5                              ; 57B5   0275
        MVO     R1,     G_01E6                  ; 57B6   0241 01E6
        DECR    R0                              ; 57B8   0010
        BNEQ    L_57F5                          ; 57B9   020C 003A

        MVI     G_0178, R0                      ; 57BB   0280 0178
        AND     G_017C, R0                      ; 57BD   0380 017C
        BEQ     L_57F5                          ; 57BF   0204 0034

        MVI     G_01C6, R0                      ; 57C1   0280 01C6
        ADD     G_033D, R0                      ; 57C3   02C0 033D
        ADD     G_033E, R0                      ; 57C5   02C0 033E
        BNEQ    L_57F5                          ; 57C7   020C 002C

        MVI     G_017B, R0                      ; 57C9   0280 017B
        CMPI    #$0008, R0                      ; 57CB   0378 0008
        BNEQ    L_57F5                          ; 57CD   020C 0026

        INCR    R0                              ; 57CF   0008
        MVO     R0,     G_017B                  ; 57D0   0240 017B
        CLRR    R0                              ; 57D2   01C0
        MVO     R0,     G_0179                  ; 57D3   0240 0179
        MVO     R0,     G_01D9                  ; 57D5   0240 01D9
        DECR    R0                              ; 57D7   0010

        JSR     R5,     L_6726                  ; 57D8   0004 0164 0326
        JSR     R5,     L_670F                  ; 57DB   0004 0164 030F
        JSR     R5,     L_58C8                  ; 57DE   0004 0158 00C8
        JSR     R5,     L_5510                  ; 57E1   0004 0154 0110
        DECLE   $0002                           ; 57E4   0002

        J       L_6885                          ; 57E5   0004 0368 0085

L_57E8:
        PSHR    R5                              ; 57E8   0275
L_57E9:
        MVI     G_0177, R0                      ; 57E9   0280 0177

        JSR     R5,     X_EXT_SIGN_LO           ; 57EB   0004 0114 0268

        INCR    R7                              ; 57EE   000F

        PSHR    R5                              ; 57EF   0275
L_57F0:
        MVO     R0,     G_0177                  ; 57F0   0240 0177
        TSTR    R0                              ; 57F2   0080
        BPL     L_57FE                          ; 57F3   0203 0009
L_57F5:
        PULR    R7                              ; 57F5   02B7

        PSHR    R5                              ; 57F6   0275
        MVI     G_0177, R0                      ; 57F7   0280 0177

        JSR     R5,     X_EXT_SIGN_LO           ; 57F9   0004 0114 0268

        BPL     L_57F5                          ; 57FC   0223 0008

L_57FE:
        MVI     G_01CA, R3                      ; 57FE   0283 01CA
        ADD     G_0176, R3                      ; 5800   02C3 0176
        BNEQ    L_57F5                          ; 5802   022C 000E

        MVI     G_017B, R3                      ; 5804   0283 017B
        CMPI    #$0008, R3                      ; 5806   037B 0008
        BEQ     L_582D                          ; 5808   0204 0023
        BGT     L_57F5                          ; 580A   022E 0016

        MVI     G_01D9, R4                      ; 580C   0284 01D9
        TSTR    R4                              ; 580E   00A4
        BNEQ    L_57F5                          ; 580F   022C 001B

        SLL     R3,     1                       ; 5811   004B
        ADDI    #$0126, R3                      ; 5812   02FB 0126
        TSTR    R0                              ; 5814   0080
        BMI     L_5825                          ; 5815   020B 000E

        PSHR    R3                              ; 5817   0273
        MVII    #$0019, R1                      ; 5818   02B9 0019

        JSR     R5,     L_55F0                  ; 581A   0004 0154 01F0

        PULR    R3                              ; 581D   02B3

        JSR     R5,     L_55EB                  ; 581E   0004 0154 01EB

        CLRR    R2                              ; 5821   01D2
        J       L_5859                          ; 5822   0004 0358 0059

L_5825:
        JSR     R5,     L_55E9                  ; 5825   0004 0154 01E9

        CLRR    R2                              ; 5828   01D2

        JSR     R5,     L_5851                  ; 5829   0004 0158 0051

        PULR    R7                              ; 582C   02B7

L_582D:
        MVI     G_01D6, R3                      ; 582D   0283 01D6
        TSTR    R3                              ; 582F   009B
        BNEQ    L_57F5                          ; 5830   022C 003C

        TSTR    R0                              ; 5832   0080
        BMI     L_583A                          ; 5833   020B 0005

        MVI     G_017C, R3                      ; 5835   0283 017C
        TSTR    R3                              ; 5837   009B
        BEQ     L_57F5                          ; 5838   0224 0044

L_583A:
        JSR     R5,     L_6726                  ; 583A   0004 0164 0326
        JSR     R5,     L_670F                  ; 583D   0004 0164 030F

        MVI     G_0350, R0                      ; 5840   0280 0350
        TSTR    R0                              ; 5842   0080
        BNEQ    L_5848                          ; 5843   020C 0003
        J       L_66E9                          ; 5845   0004 0364 02E9

L_5848:
        CMP     G_0197, R0                      ; 5848   0340 0197
        BLE     L_57F5                          ; 584A   0226 0056

        MVI     G_0197, R0                      ; 584C   0280 0197
        MVO     R0,     G_0350                  ; 584E   0240 0350
        PULR    R7                              ; 5850   02B7

L_5851:
        MVII    #$0004, R1                      ; 5851   02B9 0004
        MOVR    R2,     R3                      ; 5853   0093
        ADDI    #$0345, R3                      ; 5854   02FB 0345
        MVO@    R1,     R3                      ; 5856   0259
L_5857:
        MOVR    R5,     R7                      ; 5857   00AF

L_5858:
        PSHR    R5                              ; 5858   0275
L_5859:
        MOVR    R2,     R3                      ; 5859   0093
        ADDI    #$0345, R3                      ; 585A   02FB 0345
        MVI@    R3,     R1                      ; 585C   0299
        ANDI    #$000F, R1                      ; 585D   03B9 000F
        CMPI    #$0004, R1                      ; 585F   0379 0004
        BLT     L_5866                          ; 5861   0205 0003

        MVII    #$0010, R1                      ; 5863   02B9 0010
        MVO@    R1,     R3                      ; 5865   0259
L_5866:
        MOVR    R2,     R3                      ; 5866   0093
        SLL     R2,     1                       ; 5867   004A
        ADDI    #$0126, R2                      ; 5868   02FA 0126
        MVI@    R2,     R0                      ; 586A   0290
        CMPI    #$0080, R0                      ; 586B   0378 0080
        MVII    #$0006, R0                      ; 586D   02B8 0006
        MVII    #$0001, R2                      ; 586F   02BA 0001
        BGE     L_5874                          ; 5871   020D 0001

        MOVR    R2,     R0                      ; 5873   0090
L_5874:
        ADDI    #$032D, R3                      ; 5874   02FB 032D
        J       L_68AE                          ; 5876   0004 0368 00AE

L_5879:
        PSHR    R5                              ; 5879   0275
        SDBD                                    ; 587A   0001
        MVII    #$0800, R3                      ; 587B   02BB 0000 0008
        MVII    #$0327, R2                      ; 587E   02BA 0327
        CMPI    #$0003, R0                      ; 5880   0378 0003
        BGT     L_58B2                          ; 5882   020E 002E

        TSTR    R0                              ; 5884   0080
        BMI     L_58B2                          ; 5885   020B 002B

        MVO     R0,     G_017C                  ; 5887   0240 017C
        BNEQ    L_589B                          ; 5889   020C 0010

        COMR    R3                              ; 588B   001B
        DIS                                     ; 588C   0003
        MVI@    R2,     R0                      ; 588D   0290
        ANDR    R3,     R0                      ; 588E   0198
        MVO@    R0,     R2                      ; 588F   0250
        EIS                                     ; 5890   0002
        CLRR    R0                              ; 5891   01C0
        DECR    R0                              ; 5892   0010

        JSR     R5,     L_6726                  ; 5893   0004 0164 0326
        JSR     R5,     L_670F                  ; 5896   0004 0164 030F

        B       L_58AE                          ; 5899   0200 0013

L_589B:
        DECR    R0                              ; 589B   0010
        SLL     R0,     1                       ; 589C   0048
        SDBD                                    ; 589D   0001
        ADDI    #$58B3, R0                      ; 589E   02F8 00B3 0058
        MOVR    R0,     R4                      ; 58A1   0084
        SDBD                                    ; 58A2   0001
        MVI@    R4,     R0                      ; 58A3   02A0
        MVO     R0,     G_033F                  ; 58A4   0240 033F
        MVI@    R2,     R0                      ; 58A6   0290
        ANDR    R3,     R0                      ; 58A7   0198
        XORR    R0,     R3                      ; 58A8   01C3
        DIS                                     ; 58A9   0003
        MVI@    R2,     R0                      ; 58AA   0290
        XORR    R3,     R0                      ; 58AB   01D8
        MVO@    R0,     R2                      ; 58AC   0250
        EIS                                     ; 58AD   0002
L_58AE:
        MVII    #$00FF, R0                      ; 58AE   02B8 00FF
        MVO     R0,     G_016B                  ; 58B0   0240 016B
L_58B2:
        PULR    R7                              ; 58B2   02B7

        SWAP    R3,     1                       ; 58B3   0043
        SAR     R0,     2                       ; 58B4   006C
        SLL     R0,     1                       ; 58B5   0048
        SAR     R0,     2                       ; 58B6   006C
        SLL     R1,     2                       ; 58B7   004D
        SAR     R0,     2                       ; 58B8   006C
L_58B9:
        PSHR    R5                              ; 58B9   0275
        ADDI    #$033D, R4                      ; 58BA   02FC 033D
L_58BC:
        MVI@    R4,     R5                      ; 58BC   02A5
        TSTR    R5                              ; 58BD   00AD
        BEQ     L_58C5                          ; 58BE   0204 0005

        CMPI    #$0344, R4                      ; 58C0   037C 0344
        BLE     L_58BC                          ; 58C2   0226 0007

        INCR    R4                              ; 58C4   000C
L_58C5:
        SUBI    #$033E, R4                      ; 58C5   033C 033E
        PULR    R7                              ; 58C7   02B7

L_58C8:
        PSHR    R5                              ; 58C8   0275
        CLRR    R0                              ; 58C9   01C0
        MVO     R0,     G_01E2                  ; 58CA   0240 01E2
        MVI     G_017C, R0                      ; 58CC   0280 017C
        TSTR    R0                              ; 58CE   0080
        BEQ     L_58B2                          ; 58CF   0224 001E

        CLRR    R4                              ; 58D1   01E4

        JSR     R5,     L_58B9                  ; 58D2   0004 0158 00B9

        CMPI    #$0001, R4                      ; 58D5   037C 0001
        BGT     L_58B2                          ; 58D7   022E 0026

        MVO     R4,     G_01ED                  ; 58D9   0244 01ED
        DECR    R0                              ; 58DB   0010

        JSR     R5,     L_5879                  ; 58DC   0004 0158 0079

        MVI     G_01ED, R3                      ; 58DF   0283 01ED
        ADDI    #$0325, R3                      ; 58E1   02FB 0325
        SDBD                                    ; 58E3   0001
        MVII    #$6C82, R4                      ; 58E4   02BC 0082 006C

        JSR     R5,     L_556C                  ; 58E7   0004 0154 016C

        MVI     G_0327, R0                      ; 58EA   0280 0327
        ANDI    #$00FF, R0                      ; 58EC   03B8 00FF
        MVI     G_01ED, R2                      ; 58EE   0282 01ED
        ADDI    #$0325, R2                      ; 58F0   02FA 0325
        DIS                                     ; 58F2   0003
        XOR@    R2,     R0                      ; 58F3   03D0
        MVO@    R0,     R2                      ; 58F4   0250
        EIS                                     ; 58F5   0002
        ADDI    #$0008, R2                      ; 58F6   02FA 0008
        DIS                                     ; 58F8   0003
        MVI@    R2,     R0                      ; 58F9   0290
        SUB     G_010A, R0                      ; 58FA   0300 010A
        MVO@    R0,     R2                      ; 58FC   0250
        EIS                                     ; 58FD   0002
        ADDI    #$0020, R2                      ; 58FE   02FA 0020
        MVI     G_017B, R0                      ; 5900   0280 017B
        CMPI    #$0009, R0                      ; 5902   0378 0009
        BEQ     L_591C                          ; 5904   0204 0016

        MVII    #$0016, R0                      ; 5906   02B8 0016
        MVO@    R0,     R2                      ; 5908   0250
        MVII    #$0007, R0                      ; 5909   02B8 0007

        JSR     R5,     X_RAND2                 ; 590B   0004 0114 029E

L_590E:
        MVII    #$001E, R1                      ; 590E   02B9 001E

        JSR     R5,     L_55F0                  ; 5910   0004 0154 01F0

        MVI     G_01ED, R3                      ; 5913   0283 01ED
        SLL     R3,     1                       ; 5915   004B
        ADDI    #$0126, R3                      ; 5916   02FB 0126

        JSR     R5,     L_55EB                  ; 5918   0004 0154 01EB

        PULR    R7                              ; 591B   02B7

L_591C:
        MVII    #$000A, R0                      ; 591C   02B8 000A
        MVO@    R0,     R2                      ; 591E   0250
        MVI     G_017D, R0                      ; 591F   0280 017D
        ADD     G_01E6, R0                      ; 5921   02C0 01E6
        ANDI    #$000F, R0                      ; 5923   03B8 000F
        B       L_590E                          ; 5925   0220 0018

L_5927:
        PSHR    R5                              ; 5927   0275
        MVI     G_017B, R0                      ; 5928   0280 017B
        CMPI    #$0009, R0                      ; 592A   0378 0009
        BNEQ    L_5947                          ; 592C   020C 0019

        MOVR    R3,     R2                      ; 592E   009A

        JSR     R5,     L_6004                  ; 592F   0004 0160 0004
        DECLE   $01DB,  $0001                   ; 5932   01DB 0001

        MVII    #$005E, R1                      ; 5934   02B9 005E
        SAR     R0,     2                       ; 5936   006C

        JSR     R5,     L_5553                  ; 5937   0004 0154 0153
        JSR     R5,     L_61C8                  ; 593A   0004 0160 01C8

        MVII    #$0004, R0                      ; 593D   02B8 0004
        MVO     R0,     G_0345                  ; 593F   0240 0345
        CLRR    R0                              ; 5941   01C0
        MVO     R0,     G_017B                  ; 5942   0240 017B
        J       L_57E9                          ; 5944   0004 0354 03E9

L_5947:
        PSHR    R3                              ; 5947   0273
        SDBD                                    ; 5948   0001
        MVII    #$6C96, R1                      ; 5949   02B9 0096 006C

        JSR     R5,     L_5553                  ; 594C   0004 0154 0153

        PULR    R3                              ; 594F   02B3
        ADDI    #$0345, R3                      ; 5950   02FB 0345
        MVII    #$0030, R0                      ; 5952   02B8 0030
        MVO@    R0,     R3                      ; 5954   0258
        J       L_6805                          ; 5955   0004 0368 0005

        MVI     G_01D9, R0                      ; 5958   0280 01D9
        TSTR    R0                              ; 595A   0080
        BNEQ    L_5857                          ; 595B   022C 0105

        MVII    #$0008, R0                      ; 595D   02B8 0008
        MVO     R0,     G_017B                  ; 595F   0240 017B
        PULR    R0                              ; 5961   02B0
        CLRR    R0                              ; 5962   01C0
        PSHR    R0                              ; 5963   0270
        PSHR    R5                              ; 5964   0275
        MOVR    R2,     R4                      ; 5965   0094

        JSR     R5,     L_5513                  ; 5966   0004 0154 0113
        DECLE   $0002                           ; 5969   0002

        MOVR    R4,     R3                      ; 596A   00A3

        JSR     R5,     L_552C                  ; 596B   0004 0154 012C

        MVI     G_017C, R0                      ; 596E   0280 017C
        INCR    R0                              ; 5970   0008

        JSR     R5,     L_5879                  ; 5971   0004 0158 0079
        JSR     R5,     L_6884                  ; 5974   0004 0168 0084

        MVI     G_01E2, R0                      ; 5977   0280 01E2
        TSTR    R0                              ; 5979   0080
        BEQ     L_58B2                          ; 597A   0224 00C9

        MVI     G_0195, R0                      ; 597C   0280 0195
        ANDI    #$0010, R0                      ; 597E   03B8 0010
        BEQ     L_58B2                          ; 5980   0224 00CF
        J       L_5D2D                          ; 5982   0004 035C 012D

        MVI     G_01D6, R0                      ; 5985   0280 01D6
        ADD     G_019A, R0                      ; 5987   02C0 019A
        BNEQ    L_5857                          ; 5989   022C 0133

        SDBD                                    ; 598B   0001
        MVII    #$5992, R1                      ; 598C   02B9 0092 0059
        J       L_5B85                          ; 598F   0004 0358 0385

        PSHR    R5                              ; 5992   0275
        MVI     G_02F6, R0                      ; 5993   0280 02F6
        SDBD                                    ; 5995   0001
        CMPI    #$51C6, R0                      ; 5996   0378 00C6 0051
        BEQ     L_59A0                          ; 5999   0204 0005

        CLRR    R1                              ; 599B   01C9
        MVO     R1,     G_019A                  ; 599C   0241 019A
        PULR    R5                              ; 599E   02B5
        MOVR    R0,     R7                      ; 599F   0087

L_59A0:
        MVO     R0,     .STIC.VIDEN             ; 59A0   0240 0020
        SDBD                                    ; 59A2   0001
        MVII    #$3810, R4                      ; 59A3   02BC 0010 0038
        MVII    #$0038, R1                      ; 59A6   02B9 0038
        MVII    #$00FF, R0                      ; 59A8   02B8 00FF
L_59AA:
        MVO@    R0,     R4                      ; 59AA   0260
        DECR    R1                              ; 59AB   0011
        BNEQ    L_59AA                          ; 59AC   022C 0003

        MVI     G_0199, R5                      ; 59AE   0285 0199
        INCR    R5                              ; 59B0   000D
        ANDI    #$0007, R5                      ; 59B1   03BD 0007
        MVO     R5,     G_0199                  ; 59B3   0245 0199
        SDBD                                    ; 59B5   0001
        ADDI    #$5A3E, R5                      ; 59B6   02FD 003E 005A
        MVI@    R5,     R4                      ; 59B9   02AC
        MVI@    R5,     R5                      ; 59BA   02AD
        SDBD                                    ; 59BB   0001
        MVII    #$59E2, R0                      ; 59BC   02B8 00E2 0059
        ADDR    R0,     R4                      ; 59BF   00C4
        ADDR    R0,     R5                      ; 59C0   00C5
        SDBD                                    ; 59C1   0001
        MVII    #$3810, R2                      ; 59C2   02BA 0010 0038
        SUBI    #$0002, R2                      ; 59C5   033A 0002
        SUB     G_0199, R2                      ; 59C7   0302 0199
        MOVR    R2,     R3                      ; 59C9   0093
L_59CA:
        MVI@    R4,     R0                      ; 59CA   02A0
        MOVR    R0,     R1                      ; 59CB   0081
        SWAP    R0,     1                       ; 59CC   0040
        ANDI    #$0003, R0                      ; 59CD   03B8 0003
        CMPI    #$0003, R0                      ; 59CF   0378 0003
        BEQ     L_59D9                          ; 59D1   0204 0006

        ADDI    #$0008, R2                      ; 59D3   02FA 0008
        MOVR    R2,     R3                      ; 59D5   0093
        ADDR    R0,     R3                      ; 59D6   00C3
        B       L_59DA                          ; 59D7   0200 0001

L_59D9:
        INCR    R3                              ; 59D9   000B
L_59DA:
        MVO@    R1,     R3                      ; 59DA   0259
        CMPR    R5,     R4                      ; 59DB   016C
        BNEQ    L_59CA                          ; 59DC   022C 0013

        JSR     R5,     L_5BC3                  ; 59DE   0004 0158 03C3

        PULR    R7                              ; 59E1   02B7

        DECLE   $01C3,  $03FD,  $02BD,  $00FF   ; 59E2   01C3 03FD 02BD 00FF
        DECLE   $01C7,  $037D,  $01C3,  $01E3   ; 59E6   01C7 037D 01C3 01E3
        DECLE   $037D,  $01EF,  $01F1,  $03EF   ; 59EA   037D 01EF 01F1 03EF
        DECLE   $027F,  $02FE,  $011F,  $03EF   ; 59EE   027F 02FE 011F 03EF
        DECLE   $01C3,  $03BD,  $00EF,  $03F3   ; 59F2   01C3 03BD 00EF 03F3
        DECLE   $03BD,  $01F7,  $01F8,  $03F7   ; 59F6   03BD 01F7 01F8 03F7
        DECLE   $027F,  $01FE,  $03FD,  $011F   ; 59FA   027F 01FE 03FD 011F
        DECLE   $03EF                           ; 59FE   03EF

        ADDR    R4,     R1                      ; 59FF   00E1
        XOR@    R3,     R6                      ; 5A00   03DE
        ADDR    R5,     R7                      ; 5A01   00EF

        DECLE   $03FF,  $0379,  $01EF,  $01F8   ; 5A02   03FF 0379 01EF 01F8
        DECLE   $03F7,  $017F,  $03BF,  $01FC   ; 5A06   03F7 017F 03BF 01FC
        DECLE   $03F7,  $013F,  $03DF,  $00E3   ; 5A0A   03F7 013F 03DF 00E3
        DECLE   $03BD,  $027C,  $01E7,  $01FC   ; 5A0E   03BD 027C 01E7 01FC
        DECLE   $03FB,  $013F,  $03EF,  $01F8   ; 5A12   03FB 013F 03EF 01F8
        DECLE   $03F7,  $02BF,  $01C1,  $03BE   ; 5A16   03F7 02BF 01C1 03BE
        DECLE   $027E,  $01C7                   ; 5A1A   027E 01C7

        XORI    #$02FE, R3                      ; 5A1C   03FB 02FE
        SUBR    R3,     R7                      ; 5A1E   011F

        DECLE   $03EF,  $01F8,  $03F7,  $017F   ; 5A1F   03EF 01F8 03F7 017F
        DECLE   $03BF,  $01E3,  $03DE,  $02FE   ; 5A23   03BF 01E3 03DE 02FE
        DECLE   $01E7,  $03BB,  $02FE,  $0187   ; 5A27   01E7 03BB 02FE 0187
        DECLE   $03FD,  $01E1,  $03DF,  $00FF   ; 5A2B   03FD 01E1 03DF 00FF
        DECLE   $01C3,  $03BD,  $00FF,  $01E3   ; 5A2F   01C3 03BD 00FF 01E3
        DECLE   $03DD,  $01FF,  $0183,  $03FD   ; 5A33   03DD 01FF 0183 03FD
        DECLE   $0183,  $037D,  $00FF,  $01C7   ; 5A37   0183 037D 00FF 01C7
        DECLE   $03BB,  $00FF,  $01C7,  $0000   ; 5A3B   03BB 00FF 01C7 0000

        INCR    R2                              ; 5A3F   000A
        DECR    R6                              ; 5A40   0016
        NEGR    R3                              ; 5A41   0023
        ADCR    R7                              ; 5A42   002F

        RSWD    R3                              ; 5A43   003B
L_5A44:
        SWAP    R3,     2                       ; 5A44   0047
        RLC     R2,     1                       ; 5A45   0052
        SLLC    R0,     2                       ; 5A46   005C
        PSHR    R5                              ; 5A47   0275
        MVI     G_01E7, R0                      ; 5A48   0280 01E7
        TSTR    R0                              ; 5A4A   0080
        BEQ     L_5A63                          ; 5A4B   0204 0016

        MVII    #$0191, R4                      ; 5A4D   02BC 0191
        MVII    #$018D, R1                      ; 5A4F   02B9 018D
        MVII    #$0004, R0                      ; 5A51   02B8 0004

        JSR     R5,     .EXEC.730               ; 5A53   0004 0114 0330
        JSR     R5,     L_5BD0                  ; 5A56   0004 0158 03D0
        JSR     R5,     L_5C1E                  ; 5A59   0004 015C 001E
        JSR     R5,     L_6875                  ; 5A5C   0004 0168 0075

        CLRR    R0                              ; 5A5F   01C0
        J       L_63F9                          ; 5A60   0004 0360 03F9

L_5A63:
        JSR     R5,     L_5AE9                  ; 5A63   0004 0158 02E9
        JSR     R5,     L_5513                  ; 5A66   0004 0154 0113
        DECLE   $0002                           ; 5A69   0002
L_5A6A:
        PULR    R7                              ; 5A6A   02B7

        PSHR    R5                              ; 5A6B   0275
        MVI     G_01D9, R0                      ; 5A6C   0280 01D9
        ADD     G_034D, R0                      ; 5A6E   02C0 034D
        BNEQ    L_5A6A                          ; 5A70   022C 0007

        MVI     G_032D, R0                      ; 5A72   0280 032D
        MVI     G_0325, R1                      ; 5A74   0281 0325
        SUBI    #$0008, R1                      ; 5A76   0339 0008
        SUBI    #$0010, R0                      ; 5A78   0338 0010
        ANDI    #$00FF, R1                      ; 5A7A   03B9 00FF
        ANDI    #$007F, R0                      ; 5A7C   03B8 007F
        CMPI    #$0050, R0                      ; 5A7E   0378 0050
        BLT     L_5A85                          ; 5A80   0205 0003
L_5A82:
        J       L_63E2                          ; 5A82   0004 0360 03E2

L_5A85:
        CMPI    #$00CD, R1                      ; 5A85   0379 00CD
        BGE     L_5A95                          ; 5A87   020D 000C

        CMPI    #$0098, R1                      ; 5A89   0379 0098
        BLT     L_5A6A                          ; 5A8B   0225 0022

        JSR     R5,     L_6004                  ; 5A8D   0004 0160 0004
        JSR     R5,     L_5AE9                  ; 5A90   0004 0158 02E9

        B       L_5AE2                          ; 5A93   0200 004D

L_5A95:
        MVI     G_01D6, R0                      ; 5A95   0280 01D6
        TSTR    R0                              ; 5A97   0080
        BNEQ    L_5A82                          ; 5A98   022C 0017

        JSR     R5,     L_6004                  ; 5A9A   0004 0160 0004

        MVI     G_0327, R0                      ; 5A9D   0280 0327
        ANDI    #$00FF, R0                      ; 5A9F   03B8 00FF
        MVO     R0,     G_017F                  ; 5AA1   0240 017F
        MVI     G_032F, R0                      ; 5AA3   0280 032F
        ANDI    #$007F, R0                      ; 5AA5   03B8 007F
        MVO     R0,     G_017E                  ; 5AA7   0240 017E
        MVI     G_010A, R0                      ; 5AA9   0280 010A
        MVO     R0,     G_01D7                  ; 5AAB   0240 01D7
        MVI     G_018D, R0                      ; 5AAD   0280 018D
        CMPI    #$0003, R0                      ; 5AAF   0378 0003
        BLT     L_5AB9                          ; 5AB1   0205 0006

        CLRR    R0                              ; 5AB3   01C0
        MVO     R0,     G_018D                  ; 5AB4   0240 018D
        DECR    R0                              ; 5AB6   0010
        MVO     R0,     G_01E1                  ; 5AB7   0240 01E1
L_5AB9:
        MVII    #$018D, R4                      ; 5AB9   02BC 018D
        MVII    #$0191, R1                      ; 5ABB   02B9 0191
        MVII    #$0004, R0                      ; 5ABD   02B8 0004

        JSR     R5,     .EXEC.730               ; 5ABF   0004 0114 0330
        JSR     R5,     L_5B49                  ; 5AC2   0004 0158 0349

        MVII    #$009C, R1                      ; 5AC5   02B9 009C

        JSR     R5,     L_5B3C                  ; 5AC7   0004 0158 033C

        MVI     G_02F3, R0                      ; 5ACA   0280 02F3
        SLR     R0,     2                       ; 5ACC   0064
        SLR     R0,     1                       ; 5ACD   0060
        MOVR    R0,     R1                      ; 5ACE   0081
        INCR    R0                              ; 5ACF   0008
        CMP     G_01E0, R0                      ; 5AD0   0340 01E0
        BGE     L_5A6A                          ; 5AD2   022D 0069

        MVO     R1,     G_01E0                  ; 5AD4   0241 01E0
        MVI     G_0195, R1                      ; 5AD6   0281 0195
        ANDI    #$0004, R1                      ; 5AD8   03B9 0004
        BEQ     L_57F5                          ; 5ADA   0224 02E6

        JSR     R5,     L_6400                  ; 5ADC   0004 0164 0000
        JSR     R5,     L_56DC                  ; 5ADF   0004 0154 02DC

L_5AE2:
        MVII    #$000A, R0                      ; 5AE2   02B8 000A
        MVO     R0,     G_034D                  ; 5AE4   0240 034D
        J       L_57E9                          ; 5AE6   0004 0354 03E9

L_5AE9:
        PSHR    R5                              ; 5AE9   0275
        MVI     G_01D4, R1                      ; 5AEA   0281 01D4
        ADD     G_0342, R1                      ; 5AEC   02C1 0342
        MVO     R1,     G_01D4                  ; 5AEE   0241 01D4
        CLRR    R0                              ; 5AF0   01C0
        MVO     R0,     G_01E5                  ; 5AF1   0240 01E5
        MVO     R0,     G_01D6                  ; 5AF3   0240 01D6
        MVO     R0,     G_01E1                  ; 5AF5   0240 01E1

        JSR     R5,     L_5510                  ; 5AF7   0004 0154 0110
        DECLE   $0010                           ; 5AFA   0010

        MVII    #$0007, R2                      ; 5AFB   02BA 0007
        MVII    #$0001, R3                      ; 5AFD   02BB 0001

        JSR     R5,     L_552A                  ; 5AFF   0004 0154 012A

        MVI     G_02F3, R3                      ; 5B02   0283 02F3

        JSR     R5,     L_64BB                  ; 5B04   0004 0164 00BB

        MVI     G_01D7, R0                      ; 5B07   0280 01D7
        MVO     R0,     G_010A                  ; 5B09   0240 010A
        MVII    #$0003, R2                      ; 5B0B   02BA 0003
        MVII    #$0327, R3                      ; 5B0D   02BB 0327
        SDBD                                    ; 5B0F   0001
        MVII    #$6C19, R4                      ; 5B10   02BC 0019 006C

        JSR     R5,     L_556A                  ; 5B13   0004 0154 016A

        MVII    #$000C, R1                      ; 5B16   02B9 000C

        JSR     R5,     L_5B3C                  ; 5B18   0004 0158 033C

        MVII    #$0327, R3                      ; 5B1B   02BB 0327
        MVI     G_017F, R1                      ; 5B1D   0281 017F

        JSR     R5,     L_5B42                  ; 5B1F   0004 0158 0342

        SARC    R2,     1                       ; 5B22   007A
        MVII    #$032F, R3                      ; 5B23   02BB 032F
        MVI     G_017E, R1                      ; 5B25   0281 017E

        JSR     R5,     L_5B42                  ; 5B27   0004 0158 0342

        MVI     G_017D, R0                      ; 5B2A   0280 017D
        RRC     R0,     1                       ; 5B2C   0070
        SETC                                    ; 5B2D   0007
        RLC     R0,     1                       ; 5B2E   0050
        MVO     R0,     G_017D                  ; 5B2F   0240 017D

        JSR     R5,     L_67B9                  ; 5B31   0004 0164 03B9

        MVI     G_017C, R0                      ; 5B34   0280 017C

        JSR     R5,     L_5879                  ; 5B36   0004 0158 0079

        J       L_682A                          ; 5B39   0004 0368 002A

L_5B3C:
        SDBD                                    ; 5B3C   0001
        MVII    #$FF00, R2                      ; 5B3D   02BA 0000 00FF
        MVII    #$0325, R3                      ; 5B40   02BB 0325
L_5B42:
        DIS                                     ; 5B42   0003
        MVI@    R3,     R0                      ; 5B43   0298
        ANDR    R2,     R0                      ; 5B44   0190
        XORR    R1,     R0                      ; 5B45   01C8
        MVO@    R0,     R3                      ; 5B46   0258
        EIS                                     ; 5B47   0002
        MOVR    R5,     R7                      ; 5B48   00AF

L_5B49:
        PSHR    R5                              ; 5B49   0275
        MVII    #$0001, R3                      ; 5B4A   02BB 0001
        MVII    #$0007, R2                      ; 5B4C   02BA 0007

        JSR     R5,     L_552A                  ; 5B4E   0004 0154 012A

        SDBD                                    ; 5B51   0001
        MVII    #$00F0, R3                      ; 5B52   02BB 00F0 0000
        CLRR    R0                              ; 5B55   01C0
        MVO     R0,     G_010C                  ; 5B56   0240 010C
        MVO     R0,     G_010A                  ; 5B58   0240 010A
        DECR    R0                              ; 5B5A   0010
        MVO     R0,     G_01D6                  ; 5B5B   0240 01D6

        JSR     R5,     L_64BB                  ; 5B5D   0004 0164 00BB
        JSR     R5,     L_5BD0                  ; 5B60   0004 0158 03D0
        JSR     R5,     L_5C1E                  ; 5B63   0004 015C 001E

        MVII    #$0326, R3                      ; 5B66   02BB 0326
        SDBD                                    ; 5B68   0001
        MVII    #$6C6C, R4                      ; 5B69   02BC 006C 006C

        JSR     R5,     L_556C                  ; 5B6C   0004 0154 016C

        SDBD                                    ; 5B6F   0001
        MVII    #$2AFE, R0                      ; 5B70   02B8 00FE 002A
        MVII    #$0251, R4                      ; 5B73   02BC 0251
        MVO@    R0,     R4                      ; 5B75   0260
        ADDI    #$0008, R0                      ; 5B76   02F8 0008
        MVO@    R0,     R4                      ; 5B78   0260
        MVII    #$032B, R3                      ; 5B79   02BB 032B
        SDBD                                    ; 5B7B   0001
        MVII    #$6B36, R4                      ; 5B7C   02BC 0036 006B

        JSR     R5,     L_556C                  ; 5B7F   0004 0154 016C

        J       L_67FF                          ; 5B82   0004 0364 03FF

L_5B85:
        PSHR    R5                              ; 5B85   0275
L_5B86:
        MVI     G_019A, R0                      ; 5B86   0280 019A
        TSTR    R0                              ; 5B88   0080
        BNEQ    L_5B86                          ; 5B89   022C 0004

        DECR    R0                              ; 5B8B   0010
        MVO     R0,     G_019A                  ; 5B8C   0240 019A
        MVII    #$02F6, R2                      ; 5B8E   02BA 02F6
        MVII    #$0100, R4                      ; 5B90   02BC 0100
        MOVR    R4,     R5                      ; 5B92   00A5
        DIS                                     ; 5B93   0003
        SDBD                                    ; 5B94   0001
        MVI@    R4,     R0                      ; 5B95   02A0
        MVO@    R0,     R2                      ; 5B96   0250
        MVO@    R1,     R5                      ; 5B97   0269
        SWAP    R1,     1                       ; 5B98   0041
        MVO@    R1,     R5                      ; 5B99   0269
        EIS                                     ; 5B9A   0002
L_5B9B:
        PULR    R7                              ; 5B9B   02B7

        PSHR    R5                              ; 5B9C   0275
        MVII    #$02F6, R4                      ; 5B9D   02BC 02F6
        MVI@    R4,     R1                      ; 5B9F   02A1
        MOVR    R7,     R5                      ; 5BA0   00BD
        ADDI    #$0003, R5                      ; 5BA1   02FD 0003
        MOVR    R1,     R7                      ; 5BA3   008F

        MVII    #$0136, R2                      ; 5BA4   02BA 0136
        MVI@    R2,     R0                      ; 5BA6   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 5BA7   0004 0114 0268

        ADDI    #$0002, R0                      ; 5BAA   02F8 0002
        MVO@    R0,     R2                      ; 5BAC   0250
        MVII    #$002E, R1                      ; 5BAD   02B9 002E
        MVI     G_0179, R3                      ; 5BAF   0283 0179
        TSTR    R3                              ; 5BB1   009B
        BNEQ    L_5BB6                          ; 5BB2   020C 0002

        MVII    #$0028, R1                      ; 5BB4   02B9 0028
L_5BB6:
        CMPR    R1,     R0                      ; 5BB6   0148
        BLT     L_5B9B                          ; 5BB7   0225 001D

        COMR    R3                              ; 5BB9   001B
        MVO     R3,     G_0179                  ; 5BBA   0243 0179
        CLRR    R0                              ; 5BBC   01C0
        MVO     R0,     G_01D9                  ; 5BBD   0240 01D9

        JSR     R5,     L_57E8                  ; 5BBF   0004 0154 03E8

        PULR    R5                              ; 5BC2   02B5
L_5BC3:
        MVII    #$0100, R4                      ; 5BC3   02BC 0100
        MVI     G_02F6, R0                      ; 5BC5   0280 02F6
        DIS                                     ; 5BC7   0003
        MVO@    R0,     R4                      ; 5BC8   0260
        SWAP    R0,     1                       ; 5BC9   0040
        MVO@    R0,     R4                      ; 5BCA   0260
        EIS                                     ; 5BCB   0002
        CLRR    R0                              ; 5BCC   01C0
        MVO     R0,     G_019A                  ; 5BCD   0240 019A
        MOVR    R5,     R7                      ; 5BCF   00AF

L_5BD0:
        PSHR    R5                              ; 5BD0   0275
L_5BD1:
        MVII    #$0200, R4                      ; 5BD1   02BC 0200
        MVII    #$0014, R0                      ; 5BD3   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 5BD5   0004 0114 0338

        MVII    #$0005, R3                      ; 5BD8   02BB 0005
        MVII    #$0203, R4                      ; 5BDA   02BC 0203
        MVI     G_02F3, R2                      ; 5BDC   0282 02F3
        SDBD                                    ; 5BDE   0001
        CMPI    #$00E0, R2                      ; 5BDF   037A 00E0 0000
        BGT     L_5C01                          ; 5BE2   020E 001D

        JSR     R5,     X_PRINT_R5              ; 5BE4   0004 0118 007B
        STRING  "GAME"                          ; 5BE7   0047 0041 004D 0045
        DECLE   $0000                           ; 5BEB   0000

        MVI     G_0196, R4                      ; 5BEC   0284 0196
        SDBD                                    ; 5BEE   0001
        ADDI    #$5C0A, R4                      ; 5BEF   02FC 000A 005C
        MVI@    R4,     R0                      ; 5BF2   02A0
        MVII    #$0208, R4                      ; 5BF3   02BC 0208
        TSTR    R0                              ; 5BF5   0080
        BNEQ    L_5BFC                          ; 5BF6   020C 0004

        XORI    #$00F8, R3                      ; 5BF8   03FB 00F8
        MVO@    R3,     R4                      ; 5BFA   0263
        PULR    R7                              ; 5BFB   02B7

L_5BFC:
        MVII    #$0001, R1                      ; 5BFC   02B9 0001
        J       .EXEC.8C6                       ; 5BFE   0004 0318 00C6

L_5C01:
        JSR     R5,     X_PRINT_R5              ; 5C01   0004 0118 007B
        STRING  "DOUG"                          ; 5C04   0044 004F 0055 0047
        DECLE   $0000                           ; 5C08   0000

        PULR    R7                              ; 5C09   02B7

        DECLE   $0000,  $0001,  $0004,  $0005   ; 5C0A   0000 0001 0004 0005
        DECLE   $0002,  $0000,  $0006,  $0003   ; 5C0E   0002 0000 0006 0003
        DECLE   $0000                           ; 5C12   0000

        SETC                                    ; 5C13   0007
        PSHR    R5                              ; 5C14   0275
L_5C15:
        MVII    #$019F, R1                      ; 5C15   02B9 019F
        MVI@    R1,     R0                      ; 5C17   0288
        INCR    R0                              ; 5C18   0008
        MVO@    R0,     R1                      ; 5C19   0248

        JSR     R5,     L_5BD0                  ; 5C1A   0004 0158 03D0

        INCR    R7                              ; 5C1D   000F

L_5C1E:
        PSHR    R5                              ; 5C1E   0275
L_5C1F:
        CLRR    R3                              ; 5C1F   01DB
        CMP     G_0176, R3                      ; 5C20   0343 0176
        BNEQ    L_5CC5                          ; 5C22   020C 00A1

        CMP     G_01CA, R3                      ; 5C24   0343 01CA
        BNEQ    L_5C38                          ; 5C26   020C 0010

        MVI     G_018D, R0                      ; 5C28   0280 018D
        MVII    #$0001, R1                      ; 5C2A   02B9 0001
        MVII    #$0006, R3                      ; 5C2C   02BB 0006
        MVII    #$0201, R4                      ; 5C2E   02BC 0201
        MVO@    R3,     R4                      ; 5C30   0263
        DECR    R4                              ; 5C31   0014
        TSTR    R0                              ; 5C32   0080
        BEQ     L_5C38                          ; 5C33   0204 0003

        JSR     R5,     X_PRNUM_RGT             ; 5C35   0004 0118 00C5

L_5C38:
        MVI     G_0195, R0                      ; 5C38   0280 0195
        ANDI    #$0080, R0                      ; 5C3A   03B8 0080
        BEQ     L_5C66                          ; 5C3C   0204 0028

        MVII    #$0007, R3                      ; 5C3E   02BB 0007
        MVII    #$018E, R4                      ; 5C40   02BC 018E
        MVI@    R4,     R0                      ; 5C42   02A0
        SDBD                                    ; 5C43   0001
        MVI@    R4,     R1                      ; 5C44   02A1
        PSHR    R1                              ; 5C45   0271
        TSTR    R1                              ; 5C46   0089
        BEQ     L_5C4B                          ; 5C47   0204 0002

        ADDI    #$0064, R0                      ; 5C49   02F8 0064
L_5C4B:
        MVII    #$0003, R1                      ; 5C4B   02B9 0003
        MVII    #$020F, R4                      ; 5C4D   02BC 020F

        JSR     R5,     X_PRNUM_RGT             ; 5C4F   0004 0118 00C5

        PULR    R0                              ; 5C52   02B0
        TSTR    R0                              ; 5C53   0080
        BEQ     L_5C61                          ; 5C54   0204 000B

        MVII    #$0004, R1                      ; 5C56   02B9 0004
        MVII    #$020B, R4                      ; 5C58   02BC 020B

        JSR     R5,     X_PRNUM_RGT             ; 5C5A   0004 0118 00C5

        MVII    #$0067, R0                      ; 5C5D   02B8 0067
        MVO     R0,     .BTAB.0F                ; 5C5F   0240 020F
L_5C61:
        ADDI    #$0080, R3                      ; 5C61   02FB 0080
        MVO     R3,     .BTAB.12                ; 5C63   0243 0212
        PULR    R7                              ; 5C65   02B7

L_5C66:
        CLRR    R3                              ; 5C66   01DB
        CMP     G_01CA, R3                      ; 5C67   0343 01CA
        BEQ     L_5C74                          ; 5C69   0204 0009

        CMP     G_01E4, R3                      ; 5C6B   0343 01E4
        BNEQ    L_5C74                          ; 5C6D   020C 0005

        MVII    #$014A, R3                      ; 5C6F   02BB 014A
        MVO     R3,     .BTAB.13                ; 5C71   0243 0213
        CLRR    R3                              ; 5C73   01DB
L_5C74:
        INCR    R7                              ; 5C74   000F

        PSHR    R5                              ; 5C75   0275

L_5C76:
        JSR     R5,     L_5CA5                  ; 5C76   0004 015C 00A5

        INCR    R7                              ; 5C79   000F

        PSHR    R5                              ; 5C7A   0275
L_5C7B:
        MVII    #$0071, R2                      ; 5C7B   02BA 0071
        MVO     R2,     .BTAB.11                ; 5C7D   0242 0211
        MVII    #$003C, R2                      ; 5C7F   02BA 003C

        JSR     R5,     X_DIV                   ; 5C81   0004 011C 01FB

        PSHR    R0                              ; 5C84   0270
        MVII    #$0002, R2                      ; 5C85   02BA 0002
        MVII    #$020F, R4                      ; 5C87   02BC 020F
        TSTR    R0                              ; 5C89   0080
        BEQ     L_5C90                          ; 5C8A   0204 0004

        ADDI    #$0064, R1                      ; 5C8C   02F9 0064
        INCR    R2                              ; 5C8E   000A
        DECR    R4                              ; 5C8F   0014
L_5C90:
        MOVR    R1,     R0                      ; 5C90   0088
        MOVR    R2,     R1                      ; 5C91   0091

        JSR     R5,     X_PRNUM_RGT             ; 5C92   0004 0118 00C5

        PULR    R0                              ; 5C95   02B0
        TSTR    R0                              ; 5C96   0080
        BEQ     L_5CC5                          ; 5C97   0204 002C

        MVII    #$0002, R1                      ; 5C99   02B9 0002
        MVII    #$020C, R4                      ; 5C9B   02BC 020C

        JSR     R5,     X_PRNUM_RGT             ; 5C9D   0004 0118 00C5

        MVII    #$00D1, R0                      ; 5CA0   02B8 00D1
        MVO     R0,     .BTAB.0E                ; 5CA2   0240 020E
L_5CA4:
        PULR    R7                              ; 5CA4   02B7

L_5CA5:
        PSHR    R5                              ; 5CA5   0275
        CMPI    #$0318, R6                      ; 5CA6   037E 0318
        BGE     L_5CA4                          ; 5CA8   022D 0005

        MVI     G_02F5, R1                      ; 5CAA   0281 02F5
        MVII    #$000A, R2                      ; 5CAC   02BA 000A

        JSR     R5,     X_DIV                   ; 5CAE   0004 011C 01FB

        MOVR    R1,     R0                      ; 5CB1   0088
        MVII    #$0001, R1                      ; 5CB2   02B9 0001
        MVII    #$0001, R3                      ; 5CB4   02BB 0001
        MVII    #$0212, R4                      ; 5CB6   02BC 0212

        JSR     R5,     X_PRNUM_RGT             ; 5CB8   0004 0118 00C5

        MVI     G_02F5, R1                      ; 5CBB   0281 02F5
        MVII    #$000A, R2                      ; 5CBD   02BA 000A

        JSR     R5,     X_DIV                   ; 5CBF   0004 011C 01FB

        MOVR    R0,     R2                      ; 5CC2   0082
        MOVR    R1,     R0                      ; 5CC3   0088
        MOVR    R2,     R1                      ; 5CC4   0091
L_5CC5:
        PULR    R7                              ; 5CC5   02B7

L_5CC6:
        PSHR    R5                              ; 5CC6   0275
        CLRR    R3                              ; 5CC7   01DB
        CMP     G_01A0, R3                      ; 5CC8   0343 01A0
        BEQ     L_5CC5                          ; 5CCA   0224 0006

        MVII    #$01A1, R1                      ; 5CCC   02B9 01A1
        MVI@    R1,     R0                      ; 5CCE   0288
        INCR    R0                              ; 5CCF   0008
        MVO@    R0,     R1                      ; 5CD0   0248
        CMPI    #$0006, R0                      ; 5CD1   0378 0006
        BLT     L_5CC5                          ; 5CD3   0225 000F

        MVO@    R3,     R1                      ; 5CD5   024B
        MVI     G_02F5, R0                      ; 5CD6   0280 02F5
        INCR    R0                              ; 5CD8   0008
        MVO     R0,     G_02F5                  ; 5CD9   0240 02F5
        CMP     G_01D6, R3                      ; 5CDB   0343 01D6
        BEQ     L_5CC5                          ; 5CDD   0224 0019

        JSR     R5,     L_5CA5                  ; 5CDF   0004 015C 00A5

        TSTR    R0                              ; 5CE2   0080
        BNEQ    L_5CC5                          ; 5CE3   022C 001F

        SDBD                                    ; 5CE5   0001
        CMPI    #$0BB8, R1                      ; 5CE6   0379 00B8 000B
        BLT     L_5CED                          ; 5CE9   0205 0002

        MVO     R0,     G_01A0                  ; 5CEB   0240 01A0
L_5CED:
        B       L_5C7B                          ; 5CED   0220 0073

        PSHR    R5                              ; 5CEF   0275
        MVI     G_01D6, R0                      ; 5CF0   0280 01D6
        ADD     G_017C, R0                      ; 5CF2   02C0 017C
        ADD     G_01CA, R0                      ; 5CF4   02C0 01CA
        BNEQ    L_5D28                          ; 5CF6   020C 0030

        MVI     G_017B, R0                      ; 5CF8   0280 017B
        CMPI    #$0008, R0                      ; 5CFA   0378 0008
        BNEQ    L_5D28                          ; 5CFC   020C 002A

        MVI     G_033D, R0                      ; 5CFE   0280 033D
        ADD     G_033E, R0                      ; 5D00   02C0 033E
        BEQ     L_5D1C                          ; 5D02   0204 0018

        MVI     G_0178, R0                      ; 5D04   0280 0178
        BEQ     L_5D28                          ; 5D06   0204 0020

        MVI     G_010C, R0                      ; 5D08   0280 010C
        ADD     G_012A, R0                      ; 5D0A   02C0 012A
        MVII    #$033D, R4                      ; 5D0C   02BC 033D
        MVII    #$0136, R5                      ; 5D0E   02BD 0136
        MVII    #$0002, R1                      ; 5D10   02B9 0002
L_5D12:
        MVI@    R4,     R2                      ; 5D12   02A2
        AND@    R5,     R2                      ; 5D13   03AA
        ADDR    R2,     R0                      ; 5D14   00D0
        INCR    R5                              ; 5D15   000D
        DECR    R1                              ; 5D16   0011
        BNEQ    L_5D12                          ; 5D17   022C 0006

        TSTR    R0                              ; 5D19   0080
        BNEQ    L_5D28                          ; 5D1A   020C 000C

L_5D1C:
        MVI     G_0198, R0                      ; 5D1C   0280 0198
        INCR    R0                              ; 5D1E   0008
        MVO     R0,     G_0198                  ; 5D1F   0240 0198
        CMPI    #$0003, R0                      ; 5D21   0378 0003
        BLT     L_5D2B                          ; 5D23   0205 0006

        JSR     R5,     L_5D2C                  ; 5D25   0004 015C 012C

L_5D28:
        CLRR    R0                              ; 5D28   01C0
        MVO     R0,     G_0198                  ; 5D29   0240 0198
L_5D2B:
        PULR    R7                              ; 5D2B   02B7

L_5D2C:
        PSHR    R5                              ; 5D2C   0275

L_5D2D:
        JSR     R5,     L_6894                  ; 5D2D   0004 0168 0094
        JSR     R5,     L_5510                  ; 5D30   0004 0154 0110
        DECLE   $000A                           ; 5D33   000A

        MVI     G_017C, R0                      ; 5D34   0280 017C
        MVO     R0,     G_01E4                  ; 5D36   0240 01E4
        CLRR    R0                              ; 5D38   01C0

        JSR     R5,     L_5879                  ; 5D39   0004 0158 0079

        MVII    #$0002, R2                      ; 5D3C   02BA 0002
        MVO     R2,     G_01CA                  ; 5D3E   0242 01CA
        CLRR    R3                              ; 5D40   01DB

        JSR     R5,     L_552A                  ; 5D41   0004 0154 012A

        MVII    #$0005, R2                      ; 5D44   02BA 0005
        MVII    #$0003, R3                      ; 5D46   02BB 0003

        JSR     R5,     L_552A                  ; 5D48   0004 0154 012A

        PULR    R7                              ; 5D4B   02B7

        ADDI    #$0355, R3                      ; 5D4C   02FB 0355
        CLRR    R0                              ; 5D4E   01C0
        MVO@    R0,     R3                      ; 5D4F   0258
L_5D50:
        MOVR    R5,     R7                      ; 5D50   00AF

        PSHR    R5                              ; 5D51   0275
        MVI     G_01D6, R0                      ; 5D52   0280 01D6
        TSTR    R0                              ; 5D54   0080
        BNEQ    L_5D7A                          ; 5D55   020C 0023

        MVII    #$0005, R4                      ; 5D57   02BC 0005

L_5D59:
        JSR     R5,     L_58B9                  ; 5D59   0004 0158 00B9

        CMPI    #$0007, R4                      ; 5D5C   037C 0007
        BGT     L_5D7A                          ; 5D5E   020E 001A

        MOVR    R4,     R3                      ; 5D60   00A3
        ADDI    #$0196, R3                      ; 5D61   02FB 0196
        MVI@    R3,     R0                      ; 5D63   0298
        TSTR    R0                              ; 5D64   0080
        BEQ     L_5D7A                          ; 5D65   0204 0013

        CMPI    #$0003, R0                      ; 5D67   0378 0003
        BNEQ    L_5D70                          ; 5D69   020C 0005

        MVO     R4,     G_01E5                  ; 5D6B   0244 01E5
        INCR    R4                              ; 5D6D   000C
        B       L_5D59                          ; 5D6E   0220 0016

L_5D70:
        MOVR    R4,     R3                      ; 5D70   00A3
        ADDI    #$0325, R3                      ; 5D71   02FB 0325
        SDBD                                    ; 5D73   0001
        MVII    #$6BED, R4                      ; 5D74   02BC 00ED 006B

        JSR     R5,     L_556C                  ; 5D77   0004 0154 016C

L_5D7A:
        PULR    R7                              ; 5D7A   02B7

        PULR    R0                              ; 5D7B   02B0
        CLRR    R0                              ; 5D7C   01C0
        PSHR    R0                              ; 5D7D   0270
        PSHR    R5                              ; 5D7E   0275
        MVO     R2,     G_01D5                  ; 5D7F   0242 01D5
        MVII    #$0002, R0                      ; 5D81   02B8 0002

        JSR     R5,     L_6168                  ; 5D83   0004 0160 0168

        MVI     G_01C6, R0                      ; 5D86   0280 01C6
        TSTR    R0                              ; 5D88   0080
        BNEQ    L_5D8F                          ; 5D89   020C 0004

        ADD     G_0178, R0                      ; 5D8B   02C0 0178
        BNEQ    L_5D96                          ; 5D8D   020C 0007

L_5D8F:
        MVI     G_01D5, R0                      ; 5D8F   0280 01D5
        MVII    #$0002, R2                      ; 5D91   02BA 0002

        JSR     R5,     L_6168                  ; 5D93   0004 0160 0168

L_5D96:
        J       L_67EB                          ; 5D96   0004 0364 03EB

        PSHR    R5                              ; 5D99   0275
        CMPR    R1,     R2                      ; 5D9A   014A
        BLT     L_5D7A                          ; 5D9B   0225 0022

        CLRR    R0                              ; 5D9D   01C0
        MVO     R0,     G_01D5                  ; 5D9E   0240 01D5
        MOVR    R1,     R0                      ; 5DA0   0088
        PSHR    R0                              ; 5DA1   0270
        PSHR    R2                              ; 5DA2   0272

        JSR     R5,     L_6168                  ; 5DA3   0004 0160 0168

        PULR    R0                              ; 5DA6   02B0
        PULR    R2                              ; 5DA7   02B2

        JSR     R5,     L_6168                  ; 5DA8   0004 0160 0168

        MVI     G_01D5, R0                      ; 5DAB   0280 01D5
        TSTR    R0                              ; 5DAD   0080
        BNEQ    L_5D7A                          ; 5DAE   022C 0035
        J       L_67EB                          ; 5DB0   0004 0364 03EB

        MVII    #$00FF, R0                      ; 5DB3   02B8 00FF
        MVII    #$0064, R1                      ; 5DB5   02B9 0064
L_5DB7:
        MVO     R0,     G_01C7                  ; 5DB7   0240 01C7
        MVO     R1,     G_0351                  ; 5DB9   0241 0351
        MVI     G_0350, R0                      ; 5DBB   0280 0350
        TSTR    R0                              ; 5DBD   0080
        BNEQ    L_5D50                          ; 5DBE   022C 006F
        J       L_66E8                          ; 5DC0   0004 0364 02E8

        PSHR    R5                              ; 5DC3   0275
        CLRR    R0                              ; 5DC4   01C0
L_5DC5:
        MVO     R0,     G_01EA                  ; 5DC5   0240 01EA

        JSR     R5,     L_5DDF                  ; 5DC7   0004 015C 01DF

        MVI     G_01EA, R0                      ; 5DCA   0280 01EA
        INCR    R0                              ; 5DCC   0008
        CMPI    #$0008, R0                      ; 5DCD   0378 0008
        BGE     L_603B                          ; 5DCF   020D 026A

        CMPI    #$0002, R0                      ; 5DD1   0378 0002
        BNEQ    L_5DC5                          ; 5DD3   022C 000F

        MVI     G_01D6, R0                      ; 5DD5   0280 01D6
        TSTR    R0                              ; 5DD7   0080
        BNEQ    L_603B                          ; 5DD8   020C 0261

        MVII    #$0005, R0                      ; 5DDA   02B8 0005
        B       L_5DC5                          ; 5DDC   0220 0018

        CLRR    R0                              ; 5DDE   01C0
L_5DDF:
        PSHR    R5                              ; 5DDF   0275
        MVO     R0,     G_01E9                  ; 5DE0   0240 01E9
        MVI     G_017B, R2                      ; 5DE2   0282 017B
        CMPI    #$0009, R2                      ; 5DE4   037A 0009
        BEQ     L_603B                          ; 5DE6   0204 0253

        MOVR    R0,     R1                      ; 5DE8   0081
        ADDI    #$033D, R1                      ; 5DE9   02F9 033D
        MVI@    R1,     R2                      ; 5DEB   028A
        TSTR    R2                              ; 5DEC   0092
        BEQ     L_603B                          ; 5DED   0204 024C

        ADDI    #$0010, R1                      ; 5DEF   02F9 0010
        MVI@    R1,     R2                      ; 5DF1   028A
        TSTR    R2                              ; 5DF2   0092
        BNEQ    L_603B                          ; 5DF3   020C 0246

        MVO     R2,     G_01D8                  ; 5DF5   0242 01D8
        CMP     G_017B, R0                      ; 5DF7   0340 017B
        BNEQ    L_5E02                          ; 5DF9   020C 0007

        MVI     G_01D9, R3                      ; 5DFB   0283 01D9
        TSTR    R3                              ; 5DFD   009B
        BEQ     L_5E31                          ; 5DFE   0204 0031
        B       L_5E58                          ; 5E00   0200 0056

L_5E02:
        SUBI    #$0020, R1                      ; 5E02   0339 0020
        MVI@    R1,     R2                      ; 5E04   028A
        ANDI    #$007F, R2                      ; 5E05   03BA 007F
        MOVR    R0,     R3                      ; 5E07   0083
        ADDI    #$0196, R3                      ; 5E08   02FB 0196
        MVI@    R3,     R3                      ; 5E0A   029B
        CMPI    #$0068, R2                      ; 5E0B   037A 0068
        BLT     L_5E31                          ; 5E0D   0205 0022

        CMPI    #$0003, R3                      ; 5E0F   037B 0003
        BNEQ    L_5E17                          ; 5E11   020C 0004

        MOVR    R0,     R3                      ; 5E13   0083
        J       L_552C                          ; 5E14   0004 0354 012C

L_5E17:
        MOVR    R0,     R3                      ; 5E17   0083
        ADDI    #$0325, R3                      ; 5E18   02FB 0325
        MVII    #$002C, R0                      ; 5E1A   02B8 002C

        JSR     R5,     X_RAND2                 ; 5E1C   0004 0114 029E

        SUBI    #$0014, R0                      ; 5E1F   0338 0014
        ADD     G_0327, R0                      ; 5E21   02C0 0327
        ANDI    #$00F8, R0                      ; 5E23   03B8 00F8
        MOVR    R0,     R1                      ; 5E25   0081
        SDBD                                    ; 5E26   0001
        MVII    #$FF00, R2                      ; 5E27   02BA 0000 00FF

        JSR     R5,     L_5B42                  ; 5E2A   0004 0158 0342

        MVI     G_01E9, R0                      ; 5E2D   0280 01E9
        B       L_5E39                          ; 5E2F   0200 0008

L_5E31:
        CMPI    #$0005, R0                      ; 5E31   0378 0005
        BLT     L_5E39                          ; 5E33   0205 0004

        CMPI    #$0003, R3                      ; 5E35   037B 0003
        BEQ     L_603B                          ; 5E37   0204 0202

L_5E39:
        MOVR    R0,     R3                      ; 5E39   0083

        JSR     R5,     L_55FE                  ; 5E3A   0004 0154 01FE

        MVI     G_01E9, R2                      ; 5E3D   0282 01E9
        MVI@    R4,     R1                      ; 5E3F   02A1
        SUBI    #$0201, R4                      ; 5E40   033C 0201
        MVO     R4,     G_01DA                  ; 5E42   0244 01DA
        CLRR    R0                              ; 5E44   01C0
        DECR    R0                              ; 5E45   0010
        SDBD                                    ; 5E46   0001
        MVII    #$6F70, R4                      ; 5E47   02BC 0070 006F
L_5E4A:
        INCR    R0                              ; 5E4A   0008
        CMPI    #$0047, R0                      ; 5E4B   0378 0047
        BGE     L_5E6B                          ; 5E4D   020D 001C

        SDBD                                    ; 5E4F   0001
        CMP@    R4,     R1                      ; 5E50   0361
        BNEQ    L_5E4A                          ; 5E51   022C 0008

L_5E53:
        JSR     R5,     L_5FA5                  ; 5E53   0004 015C 03A5

        MVI     G_01E9, R2                      ; 5E56   0282 01E9
L_5E58:
        ADDI    #$0335, R2                      ; 5E58   02FA 0335
        MVI@    R2,     R3                      ; 5E5A   0293
        SDBD                                    ; 5E5B   0001
        MVII    #$2000, R1                      ; 5E5C   02B9 0000 0020
        COMR    R1                              ; 5E5F   0019
        ANDR    R1,     R3                      ; 5E60   018B
        COMR    R1                              ; 5E61   0019
        MVI     G_01D8, R0                      ; 5E62   0280 01D8

        JSR     R5,     X_EXT_SIGN_LO           ; 5E64   0004 0114 0268

        ANDR    R0,     R1                      ; 5E67   0181
        XORR    R1,     R3                      ; 5E68   01CB
        MVO@    R3,     R2                      ; 5E69   0253
        PULR    R7                              ; 5E6A   02B7

L_5E6B:
        MVII    #$0001, R0                      ; 5E6B   02B8 0001
        CMPI    #$0005, R2                      ; 5E6D   037A 0005
        BGE     L_5E53                          ; 5E6F   022D 001D
        PULR    R7                              ; 5E71   02B7

        PSHR    R5                              ; 5E72   0275
        MVI     G_01D3, R0                      ; 5E73   0280 01D3

        JSR     R5,     L_5F8F                  ; 5E75   0004 015C 038F

        SUBR    R2,     R0                      ; 5E78   0110
        ANDI    #$00FF, R0                      ; 5E79   03B8 00FF
        DIS                                     ; 5E7B   0003
        MVI     G_01D0, R1                      ; 5E7C   0281 01D0
        ADDR    R1,     R0                      ; 5E7E   00C8
        MVI     G_010A, R1                      ; 5E7F   0281 010A
        EIS                                     ; 5E81   0002
        BNEQ    L_5E89                          ; 5E82   020C 0005

        JSR     R5,     L_5F9E                  ; 5E84   0004 015C 039E

        B       L_5EE1                          ; 5E87   0200 0058

L_5E89:
        MVI     .ISRVEC.0,R0                    ; 5E89   0280 0100
        DECLE   $0001                           ; 5E8B   0001

        SUBI    #$0050, R0                      ; 5E8C   0338 0050
        RLC     R0,     2                       ; 5E8E   0054
        BEQ     L_603B                          ; 5E8F   0204 01AA

        JSR     R5,     L_5F9E                  ; 5E91   0004 015C 039E

        CLRR    R0                              ; 5E94   01C0
        MVO     R0,     G_01D0                  ; 5E95   0240 01D0
        ADDI    #$0278, R2                      ; 5E97   02FA 0278
        MVII    #$01A6, R4                      ; 5E99   02BC 01A6
        MVII    #$01B8, R5                      ; 5E9B   02BD 01B8
        MVII    #$0009, R0                      ; 5E9D   02B8 0009
        MVII    #$0024, R1                      ; 5E9F   02B9 0024
L_5EA1:
        PSHR    R0                              ; 5EA1   0270
        MVI@    R2,     R0                      ; 5EA2   0290
        PSHR    R1                              ; 5EA3   0271
        CLRR    R1                              ; 5EA4   01C9
        DECR    R1                              ; 5EA5   0011
        PSHR    R5                              ; 5EA6   0275
        SDBD                                    ; 5EA7   0001
        MVII    #$6F70, R5                      ; 5EA8   02BD 0070 006F
L_5EAB:
        INCR    R1                              ; 5EAB   0009
        CMPI    #$0047, R1                      ; 5EAC   0379 0047
        BGE     L_5EDD                          ; 5EAE   020D 002D

        SDBD                                    ; 5EB0   0001
        CMP@    R5,     R0                      ; 5EB1   0368
        BNEQ    L_5EAB                          ; 5EB2   022C 0008

L_5EB4:
        PULR    R5                              ; 5EB4   02B5
        MVO@    R1,     R5                      ; 5EB5   0269
        PSHR    R5                              ; 5EB6   0275
        SLR     R0,     2                       ; 5EB7   0064
        SLR     R0,     1                       ; 5EB8   0060
        ANDI    #$013F, R0                      ; 5EB9   03B8 013F
        XORI    #$0100, R0                      ; 5EBB   03F8 0100
        CMPI    #$0040, R0                      ; 5EBD   0378 0040
        BLT     L_5EC3                          ; 5EBF   0205 0002

        MVII    #$0020, R0                      ; 5EC1   02B8 0020
L_5EC3:
        SLL     R0,     1                       ; 5EC3   0048
        SDBD                                    ; 5EC4   0001
        ADDI    #$62A0, R0                      ; 5EC5   02F8 00A0 0062
        MOVR    R0,     R5                      ; 5EC8   0085
        MVI@    R5,     R0                      ; 5EC9   02A8
        MVO@    R0,     R4                      ; 5ECA   0260
        MVI@    R5,     R0                      ; 5ECB   02A8
        MVO@    R0,     R4                      ; 5ECC   0260
        PULR    R5                              ; 5ECD   02B5
        PULR    R1                              ; 5ECE   02B1
        PULR    R0                              ; 5ECF   02B0
        DECR    R0                              ; 5ED0   0010
        BEQ     L_5EE1                          ; 5ED1   0204 000E

        RRC     R1,     1                       ; 5ED3   0071
        BC      L_5ED9                          ; 5ED4   0201 0003

        INCR    R2                              ; 5ED6   000A
        B       L_5EA1                          ; 5ED7   0220 0037

L_5ED9:
        ADDI    #$0012, R2                      ; 5ED9   02FA 0012
        B       L_5EA1                          ; 5EDB   0220 003B

L_5EDD:
        MVII    #$0001, R1                      ; 5EDD   02B9 0001
        B       L_5EB4                          ; 5EDF   0220 002C

L_5EE1:
        MVII    #$0186, R4                      ; 5EE1   02BC 0186
        MVII    #$0007, R0                      ; 5EE3   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 5EE5   0004 0114 0338

        MVI     G_017D, R0                      ; 5EE8   0280 017D
        ANDI    #$0007, R0                      ; 5EEA   03B8 0007
        SLL     R0,     2                       ; 5EEC   004C
        SLL     R0,     1                       ; 5EED   0048
        SDBD                                    ; 5EEE   0001
        ADDI    #$6260, R0                      ; 5EEF   02F8 0060 0062
        MOVR    R0,     R4                      ; 5EF2   0084
        MVII    #$0004, R1                      ; 5EF3   02B9 0004
        MVII    #$001B, R2                      ; 5EF5   02BA 001B
L_5EF7:
        MVO     R2,     G_01C1                  ; 5EF7   0242 01C1
        MVI@    R4,     R0                      ; 5EF9   02A0
        MVI     G_01D1, R3                      ; 5EFA   0283 01D1
        ANDI    #$0007, R3                      ; 5EFC   03BB 0007
L_5EFE:
        TSTR    R3                              ; 5EFE   009B
        BEQ     L_5F05                          ; 5EFF   0204 0004

        DECR    R3                              ; 5F01   0013
        SLL     R0,     1                       ; 5F02   0048
        B       L_5EFE                          ; 5F03   0220 0006

L_5F05:
        MVO     R0,     G_01C3                  ; 5F05   0240 01C3
        SWAP    R0,     1                       ; 5F07   0040
        MVO     R0,     G_01C2                  ; 5F08   0240 01C2
        MVI@    R4,     R0                      ; 5F0A   02A0
        MVI     G_01D2, R3                      ; 5F0B   0283 01D2
        ANDI    #$0007, R3                      ; 5F0D   03BB 0007
L_5F0F:
        TSTR    R3                              ; 5F0F   009B
        BEQ     L_5F16                          ; 5F10   0204 0004

        DECR    R3                              ; 5F12   0013
        SLL     R0,     1                       ; 5F13   0048
        B       L_5F0F                          ; 5F14   0220 0006

L_5F16:
        MVO     R0,     G_01C5                  ; 5F16   0240 01C5
        SWAP    R0,     1                       ; 5F18   0040
        MVO     R0,     G_01C4                  ; 5F19   0240 01C4
        MVII    #$001B, R3                      ; 5F1B   02BB 001B
        MVO     R1,     G_01A2                  ; 5F1D   0241 01A2
        PSHR    R4                              ; 5F1F   0274
        MVII    #$01A6, R4                      ; 5F20   02BC 01A6
        CLRR    R1                              ; 5F22   01C9
L_5F23:
        RRC     R2,     1                       ; 5F23   0072
        BC      L_5F2A                          ; 5F24   0201 0004

        INCR    R4                              ; 5F26   000C
        INCR    R4                              ; 5F27   000C
        B       L_5F5A                          ; 5F28   0200 0030

L_5F2A:
        MVI@    R4,     R0                      ; 5F2A   02A0
        RRC     R3,     1                       ; 5F2B   0073
        BNC     L_5F32                          ; 5F2C   0209 0004

        AND     G_01C2, R0                      ; 5F2E   0380 01C2
        B       L_5F34                          ; 5F30   0200 0002

L_5F32:
        AND     G_01C3, R0                      ; 5F32   0380 01C3
L_5F34:
        BNEQ    L_5F3A                          ; 5F34   020C 0004

        INCR    R4                              ; 5F36   000C
        RRC     R3,     1                       ; 5F37   0073
        B       L_5F5A                          ; 5F38   0200 0020

L_5F3A:
        MVI@    R4,     R0                      ; 5F3A   02A0
        RRC     R3,     1                       ; 5F3B   0073
        BNC     L_5F42                          ; 5F3C   0209 0004

        AND     G_01C4, R0                      ; 5F3E   0380 01C4
        B       L_5F44                          ; 5F40   0200 0002

L_5F42:
        AND     G_01C5, R0                      ; 5F42   0380 01C5
L_5F44:
        BEQ     L_5F5A                          ; 5F44   0204 0014

        MVO     R1,     G_01A3                  ; 5F46   0241 01A3
        PSHR    R2                              ; 5F48   0272
        MVII    #$01B8, R0                      ; 5F49   02B8 01B8
        PSHR    R3                              ; 5F4B   0273
        PSHR    R4                              ; 5F4C   0274
        ADDR    R1,     R0                      ; 5F4D   00C8
        MOVR    R0,     R4                      ; 5F4E   0084
        MVI@    R4,     R0                      ; 5F4F   02A0
        CLRR    R2                              ; 5F50   01D2
        DECR    R2                              ; 5F51   0012

        JSR     R5,     L_5FA5                  ; 5F52   0004 015C 03A5

        PULR    R4                              ; 5F55   02B4
        PULR    R3                              ; 5F56   02B3
        PULR    R2                              ; 5F57   02B2
        MVI     G_01A3, R1                      ; 5F58   0281 01A3
L_5F5A:
        INCR    R1                              ; 5F5A   0009
        CMPI    #$0009, R1                      ; 5F5B   0379 0009
        BNEQ    L_5F23                          ; 5F5D   022C 003B

        MVI     G_01C1, R2                      ; 5F5F   0282 01C1
        SLL     R2,     1                       ; 5F61   004A
        PULR    R4                              ; 5F62   02B4
        MVI     G_01A2, R1                      ; 5F63   0281 01A2
        DECR    R1                              ; 5F65   0011
        CMPI    #$0002, R1                      ; 5F66   0379 0002
        BNEQ    L_5F6B                          ; 5F68   020C 0001

        SLL     R2,     1                       ; 5F6A   004A
L_5F6B:
        TSTR    R1                              ; 5F6B   0089
        BNEQ    L_5EF7                          ; 5F6C   022C 0076

        MVI     G_0189, R0                      ; 5F6E   0280 0189
        MVI     G_0178, R2                      ; 5F70   0282 0178
        MVO     R0,     G_0178                  ; 5F72   0240 0178
        TSTR    R0                              ; 5F74   0080
        BEQ     L_5F7F                          ; 5F75   0204 0008

        MVO     R1,     G_01C7                  ; 5F77   0241 01C7
        TSTR    R2                              ; 5F79   0092
        BNEQ    L_5F7F                          ; 5F7A   020C 0003

        JSR     R5,     L_6818                  ; 5F7C   0004 0168 0018

L_5F7F:
        MVI     G_018A, R0                      ; 5F7F   0280 018A
        MVO     R0,     G_01C8                  ; 5F81   0240 01C8
        MVI     G_018B, R0                      ; 5F83   0280 018B
        MVO     R0,     G_01C6                  ; 5F85   0240 01C6
        MVI     G_018C, R0                      ; 5F87   0280 018C
        TSTR    R0                              ; 5F89   0080
        BEQ     L_603B                          ; 5F8A   0204 00AF
        J       L_67EB                          ; 5F8C   0004 0364 03EB

L_5F8F:
        MVI     G_0327, R2                      ; 5F8F   0282 0327
        MOVR    R2,     R3                      ; 5F91   0093
        ANDI    #$00FF, R2                      ; 5F92   03BA 00FF
        SUBI    #$000D, R2                      ; 5F94   033A 000D
        SAR     R2,     2                       ; 5F96   006E
        SAR     R2,     1                       ; 5F97   006A
        SUBI    #$0004, R3                      ; 5F98   033B 0004
        NEGR    R3                              ; 5F9A   0023
        ANDI    #$0007, R3                      ; 5F9B   03BB 0007
        MOVR    R5,     R7                      ; 5F9D   00AF

L_5F9E:
        MVO     R1,     G_01D2                  ; 5F9E   0241 01D2
        MVO     R2,     G_01D3                  ; 5FA0   0242 01D3
        MVO     R3,     G_01D1                  ; 5FA2   0243 01D1
        MOVR    R5,     R7                      ; 5FA4   00AF

L_5FA5:
        PSHR    R5                              ; 5FA5   0275
        MVO     R0,     G_01EB                  ; 5FA6   0240 01EB
        SARC    R0,     1                       ; 5FA8   0078
        MOVR    R0,     R4                      ; 5FA9   0084
        RLC     R0,     1                       ; 5FAA   0050
        SDBD                                    ; 5FAB   0001
        ADDI    #$5FC3, R4                      ; 5FAC   02FC 00C3 005F
        MVI@    R4,     R3                      ; 5FAF   02A3
        ANDI    #$0001, R0                      ; 5FB0   03B8 0001
        BEQ     L_5FB7                          ; 5FB2   0204 0003

        SLR     R3,     2                       ; 5FB4   0067
        SLR     R3,     2                       ; 5FB5   0067
        SLR     R3,     1                       ; 5FB6   0063
L_5FB7:
        MVI     G_01EB, R0                      ; 5FB7   0280 01EB
        ANDI    #$001F, R3                      ; 5FB9   03BB 001F
        SDBD                                    ; 5FBB   0001
        MVII    #$5FE7, R4                      ; 5FBC   02BC 00E7 005F
        ADDR    R4,     R3                      ; 5FBF   00E3
        ADD@    R3,     R4                      ; 5FC0   02DC
        CLRR    R3                              ; 5FC1   01DB
        MOVR    R4,     R7                      ; 5FC2   00A7

        DECLE   $0082,  $0182,  $00A5,  $00C5   ; 5FC3   0082 0182 00A5 00C5
        DECLE   $00C6,  $0063,  $0108,  $0129   ; 5FC7   00C6 0063 0108 0129
        DECLE   $014A,  $016B,  $00F0,  $01EF   ; 5FCB   014A 016B 00F0 01EF
        DECLE   $0000,  $01EF,  $0000,  $01EF   ; 5FCF   0000 01EF 0000 01EF
        DECLE   $0000,  $01EF                   ; 5FD3   0000 01EF

        INCR    R7                              ; 5FD5   000F

        MVO@    R2,     R2                      ; 5FD6   0252
L_5FD7:
        NEGR    R1                              ; 5FD7   0021
        NEGR    R1                              ; 5FD8   0021
        NEGR    R1                              ; 5FD9   0021
        DIS                                     ; 5FDA   0003
        INCR    R7                              ; 5FDB   000F
        INCR    R7                              ; 5FDC   000F

L_5FDD:
        SAR     R3,     2                       ; 5FDD   006F
L_5FDE:
        ANDR    R4,     R3                      ; 5FDE   01A3
        ANDR    R5,     R5                      ; 5FDF   01AD
        ANDR    R5,     R5                      ; 5FE0   01AD
        ANDR    R5,     R5                      ; 5FE1   01AD
        XORR    R1,     R5                      ; 5FE2   01CD
        XORR    R1,     R6                      ; 5FE3   01CE
        XORR    R1,     R6                      ; 5FE4   01CE
L_5FE5:
        BGT     L_5FE5                          ; 5FE5   022E 0001
        ADDR    R0,     R7                      ; 5FE7   00C7

        RLC     R1,     2                       ; 5FE8   0055
        ADDR    R5,     R4                      ; 5FE9   00EC
        SLR     R0,     1                       ; 5FEA   0060
        SUBR    R2,     R1                      ; 5FEB   0111
        SUBR    R4,     R5                      ; 5FEC   0125
        SUBR    R4,     R4                      ; 5FED   0124
        MVO@    R4,     R1                      ; 5FEE   024C
        SUBR    R4,     R3                      ; 5FEF   0123
        SUBR    R4,     R0                      ; 5FF0   0120
        SUBR    R4,     R2                      ; 5FF1   0122
        SUBR    R3,     R7                      ; 5FF2   011F

        DECLE   $0042,  $0013,  $00B6,  $00D1   ; 5FF3   0042 0013 00B6 00D1
        DECLE   $0212                           ; 5FF7   0212

        MVO@    R4,     R4                      ; 5FF8   0264
        XORR    R7,     R3                      ; 5FF9   01FB
L_5FFA:
        CMP     G_017B, R2                      ; 5FFA   0342 017B
        BEQ     L_603B                          ; 5FFC   0204 003D

        TSTR    R2                              ; 5FFE   0092
        BPL     L_6005                          ; 5FFF   0203 0004

        PULR    R5                              ; 6001   02B5
        B       L_61C3                          ; 6002   0200 01BF

L_6004:
        PSHR    R5                              ; 6004   0275
L_6005:
        CLRR    R0                              ; 6005   01C0
        CLRR    R1                              ; 6006   01C9
        PULR    R5                              ; 6007   02B5
L_6008:
        CMPI    #$0005, R2                      ; 6008   037A 0005
        BLT     L_6021                          ; 600A   0205 0015

        MVO     R2,     G_01EC                  ; 600C   0242 01EC
        SUBI    #$0005, R2                      ; 600E   033A 0005
        ADDI    #$019B, R2                      ; 6010   02FA 019B
        MVI@    R2,     R4                      ; 6012   0294
        DECR    R4                              ; 6013   0014
        BNEQ    L_601A                          ; 6014   020C 0004

        SAR     R0,     1                       ; 6016   0068
        SAR     R1,     1                       ; 6017   0069
        B       L_601F                          ; 6018   0200 0005

L_601A:
        DECR    R4                              ; 601A   0014
        BNEQ    L_601F                          ; 601B   020C 0002

        SLL     R0,     1                       ; 601D   0048
        SLL     R1,     1                       ; 601E   0049
L_601F:
        MVI     G_01EC, R2                      ; 601F   0282 01EC
L_6021:
        SLL     R2,     1                       ; 6021   004A
        ADDI    #$0126, R2                      ; 6022   02FA 0126
        MVO@    R0,     R2                      ; 6024   0250
        ADDI    #$0010, R2                      ; 6025   02FA 0010
        MVO@    R1,     R2                      ; 6027   0251
        MOVR    R5,     R7                      ; 6028   00AF

        CMP     G_017B, R2                      ; 6029   0342 017B
        BEQ     L_61D1                          ; 602B   0204 01A4

        TSTR    R2                              ; 602D   0092
        BPL     L_6005                          ; 602E   0223 002A

        JSR     R5,     L_61C3                  ; 6030   0004 0160 01C3

        MVI     G_018B, R0                      ; 6033   0280 018B
        TSTR    R0                              ; 6035   0080
        BNEQ    L_603B                          ; 6036   020C 0003

        DECR    R0                              ; 6038   0010
        MVO     R0,     G_018B                  ; 6039   0240 018B
L_603B:
        PULR    R7                              ; 603B   02B7

        TSTR    R2                              ; 603C   0092
        BMI     L_6047                          ; 603D   020B 0008

        CMPI    #$0028, R0                      ; 603F   0378 0028
        BEQ     L_6047                          ; 6041   0204 0004

        CLRR    R0                              ; 6043   01C0
        DECR    R0                              ; 6044   0010
        MVO     R0,     G_01D8                  ; 6045   0240 01D8
L_6047:
        CMP     G_017B, R2                      ; 6047   0342 017B
        BEQ     L_606E                          ; 6049   0204 0023

        MVI     G_01D6, R1                      ; 604B   0281 01D6
        TSTR    R1                              ; 604D   0089
        BNEQ    L_603B                          ; 604E   022C 0014

        CLRR    R0                              ; 6050   01C0
        TSTR    R2                              ; 6051   0092
        BMI     L_605D                          ; 6052   020B 0009

        CMPI    #$0005, R2                      ; 6054   037A 0005
        BGE     L_5FFA                          ; 6056   022D 005D

        MOVR    R2,     R1                      ; 6058   0091
        ADDI    #$0325, R1                      ; 6059   02F9 0325
        B       L_6061                          ; 605B   0200 0004

L_605D:
        MVO     R0,     G_010C                  ; 605D   0240 010C
        MVII    #$0327, R1                      ; 605F   02B9 0327
L_6061:
        MVII    #$0032, R0                      ; 6061   02B8 0032
        MVI@    R1,     R1                      ; 6063   0289
        ADDI    #$0028, R1                      ; 6064   02F9 0028
        ANDI    #$00FF, R1                      ; 6066   03B9 00FF
        CMPI    #$0084, R1                      ; 6068   0379 0084
        BLT     L_60B0                          ; 606A   0205 0044
        B       L_60BA                          ; 606C   0200 004C

L_606E:
        CLRR    R0                              ; 606E   01C0
        DECR    R0                              ; 606F   0010
        MVO     R0,     G_0179                  ; 6070   0240 0179
        PULR    R7                              ; 6072   02B7

L_6073:
        PSHR    R5                              ; 6073   0275
L_6074:
        MOVR    R2,     R3                      ; 6074   0093

        JSR     R5,     L_552C                  ; 6075   0004 0154 012C

        J       L_6838                          ; 6078   0004 0368 0038

L_607B:
        CLRR    R0                              ; 607B   01C0
        DECR    R0                              ; 607C   0010
        MVO     R0,     G_01D9                  ; 607D   0240 01D9
        MVII    #$000D, R0                      ; 607F   02B8 000D
        MVII    #$0022, R1                      ; 6081   02B9 0022
        MVI     G_0179, R3                      ; 6083   0283 0179
        TSTR    R3                              ; 6085   009B
        BNEQ    L_608B                          ; 6086   020C 0003

        NEGR    R0                              ; 6088   0020
        MVII    #$0030, R1                      ; 6089   02B9 0030
L_608B:
        NEGR    R1                              ; 608B   0021

        JSR     R5,     L_6008                  ; 608C   0004 0160 0008

        CLRR    R2                              ; 608F   01D2

        JSR     R5,     L_5858                  ; 6090   0004 0158 0058

        SDBD                                    ; 6093   0001
        MVII    #$5B9C, R1                      ; 6094   02B9 009C 005B

        JSR     R5,     L_5B85                  ; 6097   0004 0158 0385

        J       L_6885                          ; 609A   0004 0368 0085

        CMP     G_017B, R2                      ; 609D   0342 017B
        BEQ     L_607B                          ; 609F   0224 0025

        MVII    #$0026, R0                      ; 60A1   02B8 0026
        TSTR    R2                              ; 60A3   0092
        BPL     L_60AA                          ; 60A4   0203 0004

        SLR     R0,     1                       ; 60A6   0060
        MVO     R0,     G_012A                  ; 60A7   0240 012A
        PULR    R7                              ; 60A9   02B7

L_60AA:
        CLRR    R1                              ; 60AA   01C9
        PULR    R5                              ; 60AB   02B5
        B       L_6008                          ; 60AC   0220 00A5

        MVII    #$0026, R0                      ; 60AE   02B8 0026
L_60B0:
        MVII    #$0001, R3                      ; 60B0   02BB 0001
        CMP     G_017B, R2                      ; 60B2   0342 017B
        BEQ     L_607B                          ; 60B4   0224 003A
        B       L_60BD                          ; 60B6   0200 0005

        MVII    #$0026, R0                      ; 60B8   02B8 0026
L_60BA:
        MVII    #$00FF, R3                      ; 60BA   02BB 00FF
        NEGR    R0                              ; 60BC   0020
L_60BD:
        TSTR    R2                              ; 60BD   0092
        BPL     L_60CA                          ; 60BE   0203 000A

        MVO     R0,     G_012A                  ; 60C0   0240 012A
        MOVR    R3,     R0                      ; 60C2   0098
        MVII    #$0006, R1                      ; 60C3   02B9 0006

        JSR     R5,     L_5DB7                  ; 60C5   0004 015C 01B7

        B       L_60CE                          ; 60C8   0200 0004

L_60CA:
        CLRR    R1                              ; 60CA   01C9

        JSR     R5,     L_6008                  ; 60CB   0004 0160 0008

L_60CE:
        CLRR    R0                              ; 60CE   01C0
        DECR    R0                              ; 60CF   0010
        MVO     R0,     G_018C                  ; 60D0   0240 018C
        PULR    R7                              ; 60D2   02B7

        CMP     G_017B, R2                      ; 60D3   0342 017B
        BEQ     L_61D1                          ; 60D5   0204 00FA

        TSTR    R2                              ; 60D7   0092
        BPL     L_6074                          ; 60D8   0223 0065

        PSHR    R1                              ; 60DA   0271
        MVI     G_018A, R0                      ; 60DB   0280 018A
        TSTR    R0                              ; 60DD   0080
        BNEQ    L_60F1                          ; 60DE   020C 0011

        JSR     R5,     L_67EA                  ; 60E0   0004 0164 03EA

        MVI     G_01C8, R0                      ; 60E3   0280 01C8
        TSTR    R0                              ; 60E5   0080
        BNEQ    L_60F1                          ; 60E6   020C 0009

        MVI     G_0195, R0                      ; 60E8   0280 0195
        ANDI    #$0001, R0                      ; 60EA   03B8 0001
        BEQ     L_60F1                          ; 60EC   0204 0003

        JSR     R5,     L_58C8                  ; 60EE   0004 0158 00C8

L_60F1:
        MVII    #$0001, R0                      ; 60F1   02B8 0001
        MVO     R0,     G_018A                  ; 60F3   0240 018A
        PULR    R1                              ; 60F5   02B1
        B       L_6196                          ; 60F6   0200 009E

        CMP     G_017B, R2                      ; 60F8   0342 017B
        BEQ     L_61D1                          ; 60FA   0204 00D5

        TSTR    R2                              ; 60FC   0092
        BMI     L_603B                          ; 60FD   022B 00C3

        CLRR    R0                              ; 60FF   01C0
        MVI     G_0180, R1                      ; 6100   0281 0180
        NEGR    R1                              ; 6102   0021
        PULR    R5                              ; 6103   02B5
        B       L_6008                          ; 6104   0220 00FD

        INCR    R3                              ; 6106   000B
        ADDI    #$0003, R3                      ; 6107   02FB 0003
        INCR    R3                              ; 6109   000B
        INCR    R3                              ; 610A   000B
        INCR    R3                              ; 610B   000B
        CLRR    R0                              ; 610C   01C0
        CLRR    R4                              ; 610D   01E4
        MVI     G_0181, R1                      ; 610E   0281 0181
        RRC     R3,     1                       ; 6110   0073
        BNC     L_6116                          ; 6111   0209 0003

        MVI     G_0182, R1                      ; 6113   0281 0182
        INCR    R4                              ; 6115   000C
L_6116:
        RRC     R3,     1                       ; 6116   0073
        BNC     L_611F                          ; 6117   0209 0006

        SLR     R1,     1                       ; 6119   0061
        MOVR    R1,     R0                      ; 611A   0088
        RRC     R3,     1                       ; 611B   0073
        BNC     L_611F                          ; 611C   0209 0001

        NEGR    R0                              ; 611E   0020
L_611F:
        SUB     G_0180, R1                      ; 611F   0301 0180
        NEGR    R1                              ; 6121   0021
        CMP     G_017B, R2                      ; 6122   0342 017B
        BEQ     L_61D1                          ; 6124   0204 00AB

        TSTR    R2                              ; 6126   0092
        BPL     L_6148                          ; 6127   0203 001F

        TSTR    R4                              ; 6129   00A4
        BNEQ    L_6138                          ; 612A   020C 000C

        MVI     G_0188, R4                      ; 612C   0284 0188
        ANDI    #$0002, R4                      ; 612E   03BC 0002
        BNEQ    L_6147                          ; 6130   020C 0015

        MVII    #$0002, R4                      ; 6132   02BC 0002
        XOR     G_0188, R4                      ; 6134   03C4 0188
        B       L_6140                          ; 6136   0200 0008

L_6138:
        MVI     G_0188, R4                      ; 6138   0284 0188
        ANDI    #$0001, R4                      ; 613A   03BC 0001
        BNEQ    L_6147                          ; 613C   020C 0009

        MVII    #$0003, R4                      ; 613E   02BC 0003
L_6140:
        MVO     R4,     G_0188                  ; 6140   0244 0188
        NOP                                     ; 6142   0034
        MVO     R0,     G_0186                  ; 6143   0240 0186
        MVO     R1,     G_0187                  ; 6145   0241 0187
L_6147:
        PULR    R7                              ; 6147   02B7

L_6148:
        SUB     G_0180, R1                      ; 6148   0301 0180
        PULR    R5                              ; 614A   02B5
        B       L_6008                          ; 614B   0220 0144

L_614D:
        PSHR    R5                              ; 614D   0275
        MVII    #$0003, R2                      ; 614E   02BA 0003

        JSR     R5,     X_DIV                   ; 6150   0004 011C 01FB

        MOVR    R0,     R2                      ; 6153   0082
        SDBD                                    ; 6154   0001
        MVII    #$6165, R3                      ; 6155   02BB 0065 0061
        ADDR    R3,     R1                      ; 6158   00D9
        ADDR    R3,     R2                      ; 6159   00DA
        MVI@    R1,     R0                      ; 615A   0288
        MVI@    R2,     R1                      ; 615B   0291
        SUBI    #$0004, R0                      ; 615C   0338 0004
        SUBI    #$0004, R1                      ; 615E   0339 0004
        SUB     G_01D1, R0                      ; 6160   0300 01D1
        SUB     G_01D2, R1                      ; 6162   0301 01D2
        PULR    R7                              ; 6164   02B7

        DECLE   $0010,  $0008,  $0000           ; 6165   0010 0008 0000
L_6168:
        PSHR    R5                              ; 6168   0275
        CMPI    #$0002, R2                      ; 6169   037A 0002
        BEQ     L_617C                          ; 616B   0204 000F

        MOVR    R2,     R1                      ; 616D   0091
        ADDI    #$0196, R1                      ; 616E   02F9 0196
        MVI@    R1,     R1                      ; 6170   0289
        CMPI    #$0003, R1                      ; 6171   0379 0003
        BNEQ    L_617C                          ; 6173   020C 0007

        MVO     R1,     G_01D5                  ; 6175   0241 01D5
        MOVR    R0,     R2                      ; 6177   0082

        JSR     R5,     L_6074                  ; 6178   0004 0160 0074

        PULR    R7                              ; 617B   02B7

L_617C:
        PSHR    R2                              ; 617C   0272
        PSHR    R0                              ; 617D   0270
        ADDI    #$0325, R2                      ; 617E   02FA 0325
        MOVR    R2,     R4                      ; 6180   0094
        CLRR    R2                              ; 6181   01D2
        CLRR    R3                              ; 6182   01DB

        JSR     R5,     L_55A3                  ; 6183   0004 0154 01A3

        MOVR    R3,     R2                      ; 6186   009A
        MOVR    R4,     R3                      ; 6187   00A3
        NEGR    R2                              ; 6188   0022
        NEGR    R3                              ; 6189   0023
        PULR    R4                              ; 618A   02B4
        ADDI    #$0325, R4                      ; 618B   02FC 0325

        JSR     R5,     L_55A3                  ; 618D   0004 0154 01A3

        MOVR    R3,     R0                      ; 6190   0098
        MOVR    R4,     R1                      ; 6191   00A1
        PULR    R2                              ; 6192   02B2
        B       L_619B                          ; 6193   0200 0006

        PSHR    R5                              ; 6195   0275

L_6196:
        JSR     R5,     L_614D                  ; 6196   0004 0160 014D

        MVII    #$0002, R2                      ; 6199   02BA 0002
L_619B:
        PSHR    R2                              ; 619B   0272

        JSR     R5,     .EXEC.A2F               ; 619C   0004 0118 022F

        MVII    #$0003, R0                      ; 619F   02B8 0003

        JSR     R5,     X_RAND2                 ; 61A1   0004 0114 029E

        DECR    R0                              ; 61A4   0010
        ADDR    R1,     R0                      ; 61A5   00C8
        MVII    #$0026, R1                      ; 61A6   02B9 0026

        JSR     R5,     L_55F0                  ; 61A8   0004 0154 01F0

        PULR    R0                              ; 61AB   02B0
        MOVR    R0,     R3                      ; 61AC   0083
        SLL     R3,     1                       ; 61AD   004B
        ADDI    #$0126, R3                      ; 61AE   02FB 0126
        MVO@    R1,     R3                      ; 61B0   0259
        CMPI    #$0002, R0                      ; 61B1   0378 0002
        BNEQ    L_61B9                          ; 61B3   020C 0004

        NEGR    R2                              ; 61B5   0022
        MVO     R2,     G_010C                  ; 61B6   0242 010C
        PULR    R7                              ; 61B8   02B7

L_61B9:
        ADDI    #$0010, R3                      ; 61B9   02FB 0010
        MVO@    R2,     R3                      ; 61BB   025A
        MOVR    R0,     R4                      ; 61BC   0084
        ADDI    #$034D, R4                      ; 61BD   02FC 034D
        MVII    #$0005, R3                      ; 61BF   02BB 0005
        MVO@    R3,     R4                      ; 61C1   0263
        PULR    R7                              ; 61C2   02B7

L_61C3:
        CLRR    R0                              ; 61C3   01C0
        DECR    R0                              ; 61C4   0010
        MVO     R0,     G_0189                  ; 61C5   0240 0189
        MOVR    R5,     R7                      ; 61C7   00AF

L_61C8:
        DIS                                     ; 61C8   0003
        MVI     G_032D, R0                      ; 61C9   0280 032D
        XORI    #$0080, R0                      ; 61CB   03F8 0080
        MVO     R0,     G_032D                  ; 61CD   0240 032D
        EIS                                     ; 61CF   0002
        MOVR    R5,     R7                      ; 61D0   00AF

L_61D1:
        JSR     R5,     L_61C8                  ; 61D1   0004 0160 01C8
        JSR     R5,     L_6004                  ; 61D4   0004 0160 0004
        JSR     R5,     L_5513                  ; 61D7   0004 0154 0113
        DECLE   $0002                           ; 61DA   0002

        MVII    #$0008, R0                      ; 61DB   02B8 0008
        MVO     R0,     G_017B                  ; 61DD   0240 017B
        J       L_5947                          ; 61DF   0004 0358 0147

        CMP     G_017B, R2                      ; 61E2   0342 017B
        BNEQ    L_603B                          ; 61E4   022C 01AA

        MVII    #$0063, R3                      ; 61E6   02BB 0063
        MVO     R3,     G_01E2                  ; 61E8   0243 01E2

        JSR     R5,     L_62F6                  ; 61EA   0004 0160 02F6
        JSR     R5,     L_62E5                  ; 61ED   0004 0160 02E5
        JSR     R5,     L_61FE                  ; 61F0   0004 0160 01FE

        MVI     G_01DC, R0                      ; 61F3   0280 01DC
        TSTR    R0                              ; 61F5   0080
        BNEQ    L_6316                          ; 61F6   020C 011E
        PULR    R7                              ; 61F8   02B7

        CMP     G_017B, R2                      ; 61F9   0342 017B
        BNEQ    L_603B                          ; 61FB   022C 01C1
        INCR    R7                              ; 61FD   000F

L_61FE:
        PSHR    R5                              ; 61FE   0275

L_61FF:
        JSR     R5,     L_6875                  ; 61FF   0004 0168 0075

        CLRR    R3                              ; 6202   01DB
        MVO     R3,     G_01DF                  ; 6203   0243 01DF
        INCR    R3                              ; 6205   000B

        JSR     R5,     L_62F6                  ; 6206   0004 0160 02F6

        MVII    #$0001, R2                      ; 6209   02BA 0001

        JSR     R5,     L_5851                  ; 620B   0004 0158 0051
        JSR     R5,     L_6004                  ; 620E   0004 0160 0004

        MVI     G_01DA, R3                      ; 6211   0283 01DA

        JSR     R5,     L_6347                  ; 6213   0004 0160 0347

        MVO@    R0,     R4                      ; 6216   0260
        MVI     G_01DC, R0                      ; 6217   0280 01DC
        DECR    R0                              ; 6219   0010
        MVO     R0,     G_01DC                  ; 621A   0240 01DC
        MVI     G_01DE, R0                      ; 621C   0280 01DE
        INCR    R0                              ; 621E   0008
        MVO     R0,     G_01DE                  ; 621F   0240 01DE
        CMPI    #$0002, R0                      ; 6221   0378 0002
        BLE     L_6228                          ; 6223   0206 0003

        JSR     R5,     L_6315                  ; 6225   0004 0160 0315

L_6228:
        MVI     G_01DC, R0                      ; 6228   0280 01DC
        TSTR    R0                              ; 622A   0080
        BEQ     L_6230                          ; 622B   0204 0003

        JSR     R5,     L_6359                  ; 622D   0004 0160 0359

L_6230:
        J       L_5C1F                          ; 6230   0004 035C 001F

        CMP     G_017B, R2                      ; 6233   0342 017B
        BNEQ    L_603B                          ; 6235   022C 01FB

        MVII    #$0013, R3                      ; 6237   02BB 0013
        MVI     G_018D, R0                      ; 6239   0280 018D
        INCR    R0                              ; 623B   0008
        MVO     R0,     G_018D                  ; 623C   0240 018D

        JSR     R5,     L_62F6                  ; 623E   0004 0160 02F6
        JSR     R5,     L_61FE                  ; 6241   0004 0160 01FE

        MVI     G_01DC, R0                      ; 6244   0280 01DC
        CMP     G_01DD, R0                      ; 6246   0340 01DD
        BGE     L_6316                          ; 6248   020D 00CC
        PULR    R7                              ; 624A   02B7

        CMP     G_017B, R2                      ; 624B   0342 017B
        BNEQ    L_603B                          ; 624D   022C 0213

        JSR     R5,     L_6875                  ; 624F   0004 0168 0075

        MVII    #$0005, R3                      ; 6252   02BB 0005

        JSR     R5,     L_62F6                  ; 6254   0004 0160 02F6

        MVI     G_01DA, R3                      ; 6257   0283 01DA

        JSR     R5,     L_6347                  ; 6259   0004 0160 0347

        MVO@    R0,     R4                      ; 625C   0260
        J       L_5C1F                          ; 625D   0004 035C 001F

        DECLE   $003F,  $0007,  $00FC,  $0007   ; 6260   003F 0007 00FC 0007
        DECLE   $003F,  $00E0,  $00FC,  $00E0   ; 6264   003F 00E0 00FC 00E0
        DECLE   $001F                           ; 6268   001F

        DIS                                     ; 6269   0003
        ADDR    R7,     R6                      ; 626A   00FE
        INCR    R7                              ; 626B   000F

        SARC    R3,     2                       ; 626C   007F
L_626D:
        ADDR    R6,     R0                      ; 626D   00F0
        DECLE   $00F8,  $00C0,  $0007,  $0007   ; 626E   00F8 00C0 0007 0007
        DECLE   $00F8,  $001F,  $001F,  $00F8   ; 6272   00F8 001F 001F 00F8
        DECLE   $00E0,  $00E0,  $0003,  $001F   ; 6276   00E0 00E0 0003 001F

        ADDR    R6,     R0                      ; 627A   00F0
        SARC    R3,     2                       ; 627B   007F
        INCR    R7                              ; 627C   000F

        ADDR    R7,     R6                      ; 627D   00FE
L_627E:
        ADDR    R0,     R0                      ; 627E   00C0
        DECLE   $00F8,  $0007,  $003F,  $00E0   ; 627F   00F8 0007 003F 00E0
        DECLE   $003F                           ; 6283   003F

        SETC                                    ; 6284   0007
        ADDR    R7,     R4                      ; 6285   00FC
        ADDR    R4,     R0                      ; 6286   00E0
        ADDR    R7,     R4                      ; 6287   00FC
        INCR    R7                              ; 6288   000F

        SARC    R3,     2                       ; 6289   007F
L_628A:
        ADDR    R0,     R0                      ; 628A   00C0
        DECLE   $001F,  $0003,  $00F8,  $00F0   ; 628B   001F 0003 00F8 00F0
        DECLE   $00FE,  $001F,  $001F           ; 628F   00FE 001F 001F

        ADDR    R4,     R0                      ; 6292   00E0
        DIS                                     ; 6293   0003
        SETC                                    ; 6294   0007
        ADDR    R0,     R0                      ; 6295   00C0
        ADDR    R7,     R0                      ; 6296   00F8
        ADDR    R7,     R0                      ; 6297   00F8
        SARC    R3,     2                       ; 6298   007F
        INCR    R7                              ; 6299   000F

        ADDR    R7,     R0                      ; 629A   00F8
L_629B:
        DIS                                     ; 629B   0003
        DECLE   $001F,  $00C0,  $00FE,  $00F0   ; 629C   001F 00C0 00FE 00F0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62A0   00FF 00FF 00FF 00FF
        DECLE   $003F,  $003F,  $00FC,  $00FC   ; 62A4   003F 003F 00FC 00FC
        DECLE   $003F,  $00FC,  $00FC,  $003F   ; 62A8   003F 00FC 00FC 003F
        DECLE   $00FF,  $00FF,  $00FF,  $003F   ; 62AC   00FF 00FF 00FF 003F
        DECLE   $00FF,  $00FC,  $00FC,  $00FF   ; 62B0   00FF 00FC 00FC 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62B4   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; 62B8   00FF

        ADDR    R7,     R4                      ; 62B9   00FC
        ADDR    R6,     R0                      ; 62BA   00F0
        ADDR    R6,     R0                      ; 62BB   00F0
        ADDR    R6,     R0                      ; 62BC   00F0
        INCR    R7                              ; 62BD   000F
        INCR    R7                              ; 62BE   000F
L_62BF:
        INCR    R7                              ; 62BF   000F
L_62C0:
        INCR    R7                              ; 62C0   000F

L_62C1:
        ADDR    R6,     R0                      ; 62C1   00F0
L_62C2:
        ADDR    R7,     R0                      ; 62C2   00F8
        DECLE   $00F8,  $00F8,  $001F,  $001F   ; 62C3   00F8 00F8 001F 001F
        DECLE   $001F,  $001F,  $00F8,  $0080   ; 62C7   001F 001F 00F8 0080
        DECLE   $0080,  $0080,  $0001,  $0001   ; 62CB   0080 0080 0001 0001
        DECLE   $0001,  $0001,  $0080,  $00FF   ; 62CF   0001 0001 0080 00FF
        DECLE   $00FF,  $003E,  $003C,  $007E   ; 62D3   00FF 003E 003C 007E
        DECLE   $001F,  $00FF,  $00FF,  $00FF   ; 62D7   001F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62DB   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62DF   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; 62E3   00FF
L_62E4:
        PULR    R5                              ; 62E4   02B5
L_62E5:
        SDBD                                    ; 62E5   0001
        MVII    #$6F84, R4                      ; 62E6   02BC 0084 006F
        SDBD                                    ; 62E9   0001
        MVI@    R4,     R0                      ; 62EA   02A0
        MVII    #$028F, R4                      ; 62EB   02BC 028F
        MVO@    R0,     R4                      ; 62ED   0260
        MVO@    R0,     R4                      ; 62EE   0260
        MVII    #$0002, R2                      ; 62EF   02BA 0002
        MVII    #$0003, R3                      ; 62F1   02BB 0003
        J       L_552A                          ; 62F3   0004 0354 012A

L_62F6:
        PSHR    R5                              ; 62F6   0275
        MVII    #$018E, R4                      ; 62F7   02BC 018E
        MOVR    R4,     R5                      ; 62F9   00A5
        MVI@    R4,     R1                      ; 62FA   02A1
        ADDR    R3,     R1                      ; 62FB   00D9
        CMPI    #$0064, R1                      ; 62FC   0379 0064
        BLT     L_6308                          ; 62FE   0205 0008

        SUBI    #$0064, R1                      ; 6300   0339 0064
        MVO@    R1,     R5                      ; 6302   0269
        SDBD                                    ; 6303   0001
        MVI@    R4,     R1                      ; 6304   02A1
        INCR    R1                              ; 6305   0009
        MVO@    R1,     R5                      ; 6306   0269
        SWAP    R1,     1                       ; 6307   0041
L_6308:
        MVO@    R1,     R5                      ; 6308   0269
L_6309:
        PULR    R7                              ; 6309   02B7

        PSHR    R5                              ; 630A   0275
        MVI     G_0352, R0                      ; 630B   0280 0352
        TSTR    R0                              ; 630D   0080
        BNEQ    L_6309                          ; 630E   022C 0006

        MOVR    R2,     R3                      ; 6310   0093

        JSR     R5,     L_552C                  ; 6311   0004 0154 012C

        INCR    R7                              ; 6314   000F

L_6315:
        PSHR    R5                              ; 6315   0275
L_6316:
        MVI     G_033D, R0                      ; 6316   0280 033D
        TSTR    R0                              ; 6318   0080
        BEQ     L_6309                          ; 6319   0224 0011

        MVI     G_0342, R0                      ; 631B   0280 0342
        TSTR    R0                              ; 631D   0080
        BNEQ    L_6309                          ; 631E   022C 0016

        MVII    #$032A, R3                      ; 6320   02BB 032A
        SDBD                                    ; 6322   0001
        MVII    #$6BBE, R4                      ; 6323   02BC 00BE 006B

        JSR     R5,     L_556C                  ; 6326   0004 0154 016C

        MVI     G_0325, R2                      ; 6329   0282 0325
        ANDI    #$00FF, R2                      ; 632B   03BA 00FF
        MVI     G_032D, R3                      ; 632D   0283 032D
        ANDI    #$007F, R3                      ; 632F   03BB 007F
        MVII    #$0050, R1                      ; 6331   02B9 0050
        MVII    #$032A, R4                      ; 6333   02BC 032A

        JSR     R5,     L_55BD                  ; 6335   0004 0154 01BD

        MVI     G_0136, R0                      ; 6338   0280 0136
        ADD     G_0140, R0                      ; 633A   02C0 0140
        MVO     R0,     G_0140                  ; 633C   0240 0140
        MVI     G_0126, R0                      ; 633E   0280 0126
        ADD     G_0130, R0                      ; 6340   02C0 0130
        MVO     R0,     G_0130                  ; 6342   0240 0130
        J       L_6876                          ; 6344   0004 0368 0076

L_6347:
        SDBD                                    ; 6347   0001
        MVII    #$6F84, R4                      ; 6348   02BC 0084 006F
        SDBD                                    ; 634B   0001
        MVI@    R4,     R0                      ; 634C   02A0
        MOVR    R3,     R4                      ; 634D   009C
        ADDI    #$0200, R4                      ; 634E   02FC 0200
        MOVR    R5,     R7                      ; 6350   00AF

        PSHR    R5                              ; 6351   0275
        MVI     G_0128, R0                      ; 6352   0280 0128
        ADD     G_0138, R0                      ; 6354   02C0 0138
        BEQ     L_6309                          ; 6356   0224 004E
        INCR    R7                              ; 6358   000F

L_6359:
        PSHR    R5                              ; 6359   0275
L_635A:
        MVI     G_01E8, R3                      ; 635A   0283 01E8
L_635C:
        MVO     R3,     G_01E8                  ; 635C   0243 01E8
        PSHR    R3                              ; 635E   0273
        SDBD                                    ; 635F   0001
        ADDI    #$639D, R3                      ; 6360   02FB 009D 0063
        MVI@    R3,     R5                      ; 6363   029D
        SDBD                                    ; 6364   0001
        ADDI    #$6F70, R5                      ; 6365   02FD 0070 006F
        SDBD                                    ; 6368   0001
        MVI@    R5,     R0                      ; 6369   02A8
        MVII    #$0200, R4                      ; 636A   02BC 0200
        ADD     G_01DB, R4                      ; 636C   02C4 01DB
L_636E:
        CMPI    #$02F0, R4                      ; 636E   037C 02F0
        BGE     L_6394                          ; 6370   020D 0022

        CMP@    R4,     R0                      ; 6372   0360
        BNEQ    L_636E                          ; 6373   022C 0006

        PULR    R3                              ; 6375   02B3
        SUBI    #$0201, R4                      ; 6376   033C 0201
        MVO     R4,     G_01DB                  ; 6378   0244 01DB
        MOVR    R4,     R1                      ; 637A   00A1
        MVII    #$0014, R2                      ; 637B   02BA 0014

        JSR     R5,     X_DIV                   ; 637D   0004 011C 01FB

        INCR    R0                              ; 6380   0008
        INCR    R1                              ; 6381   0009
        SLL     R0,     2                       ; 6382   004C
        SLL     R0,     1                       ; 6383   0048
        SLL     R1,     2                       ; 6384   004D
        SLL     R1,     1                       ; 6385   0049
        MOVR    R1,     R2                      ; 6386   008A
        MOVR    R0,     R3                      ; 6387   0083
        MVII    #$0014, R1                      ; 6388   02B9 0014
        MVII    #$0326, R4                      ; 638A   02BC 0326

        JSR     R5,     L_55BD                  ; 638C   0004 0154 01BD

        MVII    #$0001, R2                      ; 638F   02BA 0001
        J       L_5859                          ; 6391   0004 0358 0059

L_6394:
        PULR    R3                              ; 6394   02B3
        INCR    R3                              ; 6395   000B
        MVO     R3,     G_01DB                  ; 6396   0243 01DB
        CMPI    #$0002, R3                      ; 6398   037B 0002
        BLE     L_635C                          ; 639A   0226 003F
        PULR    R7                              ; 639C   02B7

        ADCR    R0                              ; 639D   0028
        ADCR    R2                              ; 639E   002A
        SLL     R2,     2                       ; 639F   004E
        PSHR    R5                              ; 63A0   0275
        MVII    #$0001, R3                      ; 63A1   02BB 0001

        JSR     R5,     L_55FE                  ; 63A3   0004 0154 01FE

        SUBI    #$0200, R4                      ; 63A6   033C 0200
        MVI     G_01DB, R3                      ; 63A8   0283 01DB
        CMPR    R3,     R4                      ; 63AA   015C
        BNEQ    L_6309                          ; 63AB   022C 00A3

        MVII    #$0001, R2                      ; 63AD   02BA 0001

        JSR     R5,     L_5851                  ; 63AF   0004 0158 0051
        JSR     R5,     L_6004                  ; 63B2   0004 0160 0004

        MVI     G_01DB, R3                      ; 63B5   0283 01DB

        JSR     R5,     L_6347                  ; 63B7   0004 0160 0347

        CMP@    R4,     R0                      ; 63BA   0360
        BEQ     L_6309                          ; 63BB   0224 00B3

        DECR    R4                              ; 63BD   0014
        MVO@    R0,     R4                      ; 63BE   0260

        JSR     R5,     L_6868                  ; 63BF   0004 0168 0068

        MVI     G_01DC, R1                      ; 63C2   0281 01DC
        DECR    R1                              ; 63C4   0011
        MVO     R1,     G_01DC                  ; 63C5   0241 01DC
        CLRR    R0                              ; 63C7   01C0
        MVO     R0,     G_01DE                  ; 63C8   0240 01DE
        MVI     G_01DF, R0                      ; 63CA   0280 01DF
        INCR    R0                              ; 63CC   0008
        MVO     R0,     G_01DF                  ; 63CD   0240 01DF
        TSTR    R1                              ; 63CF   0089
        BEQ     L_62E4                          ; 63D0   0224 00ED

        CMPI    #$0002, R0                      ; 63D2   0378 0002
        BGE     L_6309                          ; 63D4   022D 00CC

        SARC    R1,     1                       ; 63D6   0079
        BNC     L_6309                          ; 63D7   0229 00CF
        B       L_635A                          ; 63D9   0220 0080

        PSHR    R5                              ; 63DB   0275
        MOVR    R2,     R3                      ; 63DC   0093

        JSR     R5,     L_552C                  ; 63DD   0004 0154 012C

        INCR    R7                              ; 63E0   000F

        PSHR    R5                              ; 63E1   0275
L_63E2:
        CLRR    R2                              ; 63E2   01D2

        JSR     R5,     L_6073                  ; 63E3   0004 0160 0073

        MVII    #$0008, R0                      ; 63E6   02B8 0008
        MVO     R0,     G_017B                  ; 63E8   0240 017B
        MVI     G_01D6, R4                      ; 63EA   0284 01D6
        TSTR    R4                              ; 63EC   00A4
        BNEQ    L_63F4                          ; 63ED   020C 0005

        JSR     R5,     L_5513                  ; 63EF   0004 0154 0113
        DECLE   $0002                           ; 63F2   0002

        PULR    R7                              ; 63F3   02B7

L_63F4:
        JSR     R5,     L_5510                  ; 63F4   0004 0154 0110
        DECLE   $0040                           ; 63F7   0040

        MOVR    R4,     R0                      ; 63F8   00A0
L_63F9:
        MVO     R0,     G_01E7                  ; 63F9   0240 01E7
        MVII    #$003C, R0                      ; 63FB   02B8 003C
        MVO     R0,     G_034E                  ; 63FD   0240 034E
        PULR    R7                              ; 63FF   02B7

L_6400:
        PSHR    R5                              ; 6400   0275
        MVII    #$0326, R1                      ; 6401   02B9 0326
        DIS                                     ; 6403   0003
        MVI@    R1,     R0                      ; 6404   0288
        SDBD                                    ; 6405   0001
        XORI    #$0800, R0                      ; 6406   03F8 0000 0008
        MVO@    R0,     R1                      ; 6409   0248
        EIS                                     ; 640A   0002

        JSR     R5,     L_5513                  ; 640B   0004 0154 0113
        DECLE   $0010                           ; 640E   0010

        CLRR    R0                              ; 640F   01C0
        MVO     R0,     G_01D4                  ; 6410   0240 01D4
        MVO     R0,     G_01DE                  ; 6412   0240 01DE
        MVO     R0,     G_01E8                  ; 6414   0240 01E8
        MVO     R0,     G_01DB                  ; 6416   0240 01DB
        MVII    #$0004, R0                      ; 6418   02B8 0004

        JSR     R5,     X_RAND2                 ; 641A   0004 0114 029E

        ADDI    #$0003, R0                      ; 641D   02F8 0003
        MVO     R0,     G_01DC                  ; 641F   0240 01DC
        SDBD                                    ; 6421   0001
        MVII    #$6F84, R4                      ; 6422   02BC 0084 006F
        SDBD                                    ; 6425   0001
        MVI@    R4,     R3                      ; 6426   02A3
        MVI     G_01E1, R0                      ; 6427   0280 01E1
        TSTR    R0                              ; 6429   0080
        BEQ     L_6455                          ; 642A   0204 0029

        PSHR    R3                              ; 642C   0273
        MVII    #$0002, R2                      ; 642D   02BA 0002
        MVII    #$0328, R3                      ; 642F   02BB 0328
        SDBD                                    ; 6431   0001
        MVII    #$6B0D, R4                      ; 6432   02BC 000D 006B

        JSR     R5,     L_556A                  ; 6435   0004 0154 016A

        PULR    R3                              ; 6438   02B3
        SDBD                                    ; 6439   0001
        MVII    #$6FBC, R4                      ; 643A   02BC 00BC 006F
        SDBD                                    ; 643D   0001
        MVI@    R4,     R0                      ; 643E   02A0
        SDBD                                    ; 643F   0001
        MVI@    R4,     R1                      ; 6440   02A1
        MVII    #$028F, R4                      ; 6441   02BC 028F
        MVO@    R0,     R4                      ; 6443   0260
        MVO@    R1,     R4                      ; 6444   0261

        JSR     R5,     L_6492                  ; 6445   0004 0164 0092

        MVII    #$0003, R1                      ; 6448   02B9 0003
        MVI     G_01DC, R0                      ; 644A   0280 01DC
        ADDR    R1,     R0                      ; 644C   00C8
        MVO     R0,     G_01DC                  ; 644D   0240 01DC
        INCR    R1                              ; 644F   0009
        MVO     R1,     G_01DD                  ; 6450   0241 01DD
        DECR    R1                              ; 6452   0011
        B       L_646A                          ; 6453   0200 0015

L_6455:
        JSR     R5,     L_6492                  ; 6455   0004 0164 0092

        MVI     G_0195, R0                      ; 6458   0280 0195
        ANDI    #$0002, R0                      ; 645A   03B8 0002
        BEQ     L_6466                          ; 645C   0204 0008

        MVI     G_017C, R1                      ; 645E   0281 017C
        INCR    R1                              ; 6460   0009
        MVII    #$008A, R4                      ; 6461   02BC 008A

        JSR     R5,     L_646D                  ; 6463   0004 0164 006D

L_6466:
        MVII    #$0001, R1                      ; 6466   02B9 0001
        MVO     R1,     G_01DD                  ; 6468   0241 01DD
L_646A:
        MVII    #$002A, R4                      ; 646A   02BC 002A
        INCR    R7                              ; 646C   000F

L_646D:
        PSHR    R5                              ; 646D   0275
L_646E:
        SDBD                                    ; 646E   0001
        ADDI    #$6F70, R4                      ; 646F   02FC 0070 006F
        SDBD                                    ; 6472   0001
        MVI@    R4,     R2                      ; 6473   02A2
L_6474:
        MVII    #$0008, R0                      ; 6474   02B8 0008

        JSR     R5,     X_RAND2                 ; 6476   0004 0114 029E

        ADDI    #$0002, R0                      ; 6479   02F8 0002
        SLL     R0,     2                       ; 647B   004C
        MOVR    R0,     R4                      ; 647C   0084
        SLL     R0,     2                       ; 647D   004C
        ADDR    R0,     R4                      ; 647E   00C4
        MVII    #$000C, R0                      ; 647F   02B8 000C

        JSR     R5,     X_RAND2                 ; 6481   0004 0114 029E

        ADDI    #$0005, R0                      ; 6484   02F8 0005
        ADDR    R0,     R4                      ; 6486   00C4
        ADDI    #$0200, R4                      ; 6487   02FC 0200
        CMP@    R4,     R3                      ; 6489   0363
        BNEQ    L_6474                          ; 648A   022C 0017

        DECR    R4                              ; 648C   0014
        MVO@    R2,     R4                      ; 648D   0262
        DECR    R1                              ; 648E   0011
        BNEQ    L_6474                          ; 648F   022C 001C
        PULR    R7                              ; 6491   02B7

L_6492:
        PSHR    R5                              ; 6492   0275
        MVI     G_01DC, R1                      ; 6493   0281 01DC
        DECR    R1                              ; 6495   0011
        MVII    #$0028, R4                      ; 6496   02BC 0028
        B       L_646E                          ; 6498   0220 002B

L_649A:
        PSHR    R5                              ; 649A   0275
        CLRR    R0                              ; 649B   01C0
        DECR    R0                              ; 649C   0010
        MVO     R0,     G_01D0                  ; 649D   0240 01D0
        MVI     G_02F3, R3                      ; 649F   0283 02F3
        CMPI    #$0002, R2                      ; 64A1   037A 0002
        BEQ     L_64AE                          ; 64A3   0204 0009

        MVII    #$00DC, R0                      ; 64A5   02B8 00DC
        INCR    R3                              ; 64A7   000B
        MVO     R3,     G_02F3                  ; 64A8   0243 02F3
        ADDI    #$000B, R3                      ; 64AA   02FB 000B
        B       L_64ED                          ; 64AC   0200 003F

L_64AE:
        MVI     G_01CA, R0                      ; 64AE   0280 01CA
        TSTR    R0                              ; 64B0   0080
        BEQ     L_64B6                          ; 64B1   0204 0003
        J       L_5C15                          ; 64B3   0004 035C 0015

L_64B6:
        DECR    R3                              ; 64B6   0013
        MVO     R3,     G_02F3                  ; 64B7   0243 02F3
        B       L_64ED                          ; 64B9   0200 0032

L_64BB:
        PSHR    R5                              ; 64BB   0275
        SDBD                                    ; 64BC   0001
        MVII    #$64C9, R1                      ; 64BD   02B9 00C9 0064

        JSR     R5,     L_5B85                  ; 64C0   0004 0158 0385

L_64C3:
        MVI     G_019A, R0                      ; 64C3   0280 019A
        TSTR    R0                              ; 64C5   0080
        BNEQ    L_64C3                          ; 64C6   022C 0004
        PULR    R7                              ; 64C8   02B7

        PSHR    R5                              ; 64C9   0275
        DIS                                     ; 64CA   0003
        MVI     G_01D6, R0                      ; 64CB   0280 01D6
        COMR    R0                              ; 64CD   0018
        ANDI    #$0002, R0                      ; 64CE   03B8 0002
        MVO     R0,     .STIC.EDGE              ; 64D0   0240 0032
        CLRR    R0                              ; 64D2   01C0
L_64D3:
        PSHR    R0                              ; 64D3   0270
        PSHR    R3                              ; 64D4   0273

        JSR     R5,     L_64EC                  ; 64D5   0004 0164 00EC

        PULR    R3                              ; 64D8   02B3
        PULR    R0                              ; 64D9   02B0
        INCR    R3                              ; 64DA   000B
        ADDI    #$0014, R0                      ; 64DB   02F8 0014
        CMPI    #$00DC, R0                      ; 64DD   0378 00DC
        BLE     L_64D3                          ; 64DF   0226 000D

        SDBD                                    ; 64E1   0001
        MVII    #$5BC3, R0                      ; 64E2   02B8 00C3 005B
        MVII    #$0100, R4                      ; 64E5   02BC 0100
        MVO@    R0,     R4                      ; 64E7   0260
        SWAP    R0,     1                       ; 64E8   0040
        MVO@    R0,     R4                      ; 64E9   0260
        EIS                                     ; 64EA   0002
        PULR    R7                              ; 64EB   02B7

L_64EC:
        PSHR    R5                              ; 64EC   0275
L_64ED:
        MVO     R0,     G_01CD                  ; 64ED   0240 01CD
        MVI     G_0176, R1                      ; 64EF   0281 0176
        ADD     G_01D6, R1                      ; 64F1   02C1 01D6
        BNEQ    L_650C                          ; 64F3   020C 0017

        SDBD                                    ; 64F5   0001
        MVII    #$00D8, R1                      ; 64F6   02B9 00D8 0000
        TSTR    R3                              ; 64F9   009B
        BPL     L_6506                          ; 64FA   0203 000A

        ADDR    R1,     R3                      ; 64FC   00CB
        MVO     R3,     G_02F3                  ; 64FD   0243 02F3
        MOVR    R1,     R2                      ; 64FF   008A
        SLR     R2,     2                       ; 6500   0066
        SLR     R2,     1                       ; 6501   0062
        ADD     G_01E0, R2                      ; 6502   02C2 01E0
        MVO     R2,     G_01E0                  ; 6504   0242 01E0
L_6506:
        CMPR    R1,     R3                      ; 6506   014B
        BLT     L_650C                          ; 6507   0205 0003

        SUBR    R1,     R3                      ; 6509   010B
        B       L_6506                          ; 650A   0220 0005

L_650C:
        MOVR    R3,     R0                      ; 650C   0098
        ANDI    #$0007, R0                      ; 650D   03B8 0007
        MVO     R0,     G_01CB                  ; 650F   0240 01CB
        SLR     R3,     2                       ; 6511   0067
        SLR     R3,     1                       ; 6512   0063
        SDBD                                    ; 6513   0001
        ADDI    #$6CA8, R3                      ; 6514   02FB 00A8 006C
        MOVR    R3,     R4                      ; 6517   009C
        MVI@    R4,     R3                      ; 6518   02A3
        SLL     R3,     2                       ; 6519   004F
        SLL     R3,     2                       ; 651A   004F
        SDBD                                    ; 651B   0001
        ADDI    #$6CC8, R3                      ; 651C   02FB 00C8 006C
        SDBD                                    ; 651F   0001
        MVII    #$6F72, R4                      ; 6520   02BC 0072 006F
        SDBD                                    ; 6523   0001
        MVI@    R4,     R0                      ; 6524   02A0
        MVII    #$0200, R4                      ; 6525   02BC 0200
        ADD     G_01CD, R4                      ; 6527   02C4 01CD
        MVII    #$0014, R1                      ; 6529   02B9 0014
L_652B:
        MVO@    R0,     R4                      ; 652B   0260
        DECR    R1                              ; 652C   0011
        BNEQ    L_652B                          ; 652D   022C 0003

        MOVR    R3,     R4                      ; 652F   009C
        MVII    #$0001, R0                      ; 6530   02B8 0001
        MVO     R0,     G_01CF                  ; 6532   0240 01CF
        MVO     R0,     G_01CC                  ; 6534   0240 01CC
        SDBD                                    ; 6536   0001
        MVII    #$6DB8, R2                      ; 6537   02BA 00B8 006D
        SDBD                                    ; 653A   0001
        MVII    #$6F10, R3                      ; 653B   02BB 0010 006F

        JSR     R5,     L_6651                  ; 653E   0004 0164 0251

        BLE     L_6550                          ; 6541   0206 000D

        MVII    #$0014, R0                      ; 6543   02B8 0014
        CMPR    R0,     R1                      ; 6545   0141
        BLE     L_6549                          ; 6546   0206 0001

        MOVR    R0,     R1                      ; 6548   0081
L_6549:
        PSHR    R4                              ; 6549   0274

        JSR     R5,     L_661A                  ; 654A   0004 0164 021A
        JSR     R5,     L_662E                  ; 654D   0004 0164 022E

L_6550:
        SDBD                                    ; 6550   0001
        MVII    #$6DE8, R2                      ; 6551   02BA 00E8 006D
        SDBD                                    ; 6554   0001
        MVII    #$6F18, R3                      ; 6555   02BB 0018 006F

        JSR     R5,     L_6651                  ; 6558   0004 0164 0251

        CMPI    #$0013, R1                      ; 655B   0379 0013
        BGE     L_656B                          ; 655D   020D 000C

        PSHR    R4                              ; 655F   0274

        JSR     R5,     L_661A                  ; 6560   0004 0164 021A

        ADDR    R1,     R4                      ; 6563   00CC
        INCR    R4                              ; 6564   000C
        SUBI    #$0013, R1                      ; 6565   0339 0013
        NEGR    R1                              ; 6567   0021

        JSR     R5,     L_662E                  ; 6568   0004 0164 022E

L_656B:
        CLRR    R0                              ; 656B   01C0
        MVO     R0,     G_01CF                  ; 656C   0240 01CF
        MVII    #$0002, R0                      ; 656E   02B8 0002
        MVO     R0,     G_01CC                  ; 6570   0240 01CC
        SDBD                                    ; 6572   0001
        MVII    #$6E10, R2                      ; 6573   02BA 0010 006E
        SDBD                                    ; 6576   0001
        MVII    #$6F20, R3                      ; 6577   02BB 0020 006F

        JSR     R5,     L_6651                  ; 657A   0004 0164 0251
        JSR     R5,     L_6651                  ; 657D   0004 0164 0251
        JSR     R5,     L_6651                  ; 6580   0004 0164 0251
        JSR     R5,     L_6651                  ; 6583   0004 0164 0251

        SDBD                                    ; 6586   0001
        MVII    #$6E60, R2                      ; 6587   02BA 0060 006E
        SDBD                                    ; 658A   0001
        MVII    #$6F30, R3                      ; 658B   02BB 0030 006F
        MVI     G_01D4, R0                      ; 658E   0280 01D4
        TSTR    R0                              ; 6590   0080
        BEQ     L_6595                          ; 6591   0204 0002

        ADDI    #$0010, R3                      ; 6593   02FB 0010

L_6595:
        JSR     R5,     L_6651                  ; 6595   0004 0164 0251
        JSR     R5,     L_6651                  ; 6598   0004 0164 0251
        JSR     R5,     L_6651                  ; 659B   0004 0164 0251
        JSR     R5,     L_6651                  ; 659E   0004 0164 0251

        MVII    #$0003, R0                      ; 65A1   02B8 0003
        MVO     R0,     G_01CC                  ; 65A3   0240 01CC
        SDBD                                    ; 65A5   0001
        MVII    #$6EDC, R2                      ; 65A6   02BA 00DC 006E
        SDBD                                    ; 65A9   0001
        MVII    #$6F50, R3                      ; 65AA   02BB 0050 006F

        JSR     R5,     L_6651                  ; 65AD   0004 0164 0251
        JSR     R5,     L_6651                  ; 65B0   0004 0164 0251
        JSR     R5,     L_6651                  ; 65B3   0004 0164 0251

        MVII    #$0001, R0                      ; 65B6   02B8 0001
        MVO     R0,     G_01CC                  ; 65B8   0240 01CC
        SDBD                                    ; 65BA   0001
        MVII    #$6F08, R2                      ; 65BB   02BA 0008 006F
        SDBD                                    ; 65BE   0001
        MVII    #$6F68, R3                      ; 65BF   02BB 0068 006F

        JSR     R5,     L_6651                  ; 65C2   0004 0164 0251
        JSR     R5,     L_6634                  ; 65C5   0004 0164 0234
        DECLE   $0283,  $0195,  $03BB,  $0020   ; 65C8   0283 0195 03BB 0020
        DECLE   $0204,  $0015,  $0283,  $02F3   ; 65CC   0204 0015 0283 02F3
        DECLE   $037B,  $000A,  $020C,  $000F   ; 65D0   037B 000A 020C 000F
        DECLE   $0001                           ; 65D4   0001

        MVII    #$0008, R0                      ; 65D5   02B8 0008
        ADCR    R2                              ; 65D7   002A
        MOVR    R0,     R1                      ; 65D8   0081
        XORI    #$0007, R1                      ; 65D9   03F9 0007
        MVII    #$0201, R4                      ; 65DB   02BC 0201
        MVO@    R0,     R4                      ; 65DD   0260
        MVO@    R1,     R4                      ; 65DE   0261
        ADDI    #$000C, R4                      ; 65DF   02FC 000C
        MVO@    R1,     R4                      ; 65E1   0261
        MVO@    R0,     R4                      ; 65E2   0260
        MVI     G_01E5, R3                      ; 65E3   0283 01E5
        TSTR    R3                              ; 65E5   009B
        BEQ     L_6619                          ; 65E6   0204 0031

        ADDI    #$033D, R3                      ; 65E8   02FB 033D
        MVI@    R3,     R0                      ; 65EA   0298
        ADD     G_01D6, R0                      ; 65EB   02C0 01D6
        ADD     G_01CA, R0                      ; 65ED   02C0 01CA
        ADD     G_01CD, R0                      ; 65EF   02C0 01CD
        BNEQ    L_6619                          ; 65F1   020C 0026

        MVII    #$0003, R0                      ; 65F3   02B8 0003

        JSR     R5,     X_RAND2                 ; 65F5   0004 0114 029E

        ADD     G_01D3, R0                      ; 65F8   02C0 01D3
        MOVR    R0,     R4                      ; 65FA   0084
        ADDI    #$0200, R4                      ; 65FB   02FC 0200
        MVI@    R4,     R1                      ; 65FD   02A1
        CMPI    #$0200, R1                      ; 65FE   0379 0200
        BNEQ    L_6619                          ; 6600   020C 0017

        INCR    R0                              ; 6602   0008
        SLL     R0,     2                       ; 6603   004C
        SLL     R0,     1                       ; 6604   0048
        PSHR    R0                              ; 6605   0270
        SUBI    #$0018, R3                      ; 6606   033B 0018
        PSHR    R3                              ; 6608   0273
        SDBD                                    ; 6609   0001
        MVII    #$6B57, R4                      ; 660A   02BC 0057 006B

        JSR     R5,     L_556C                  ; 660D   0004 0154 016C

        PULR    R3                              ; 6610   02B3
        PULR    R1                              ; 6611   02B1
        SDBD                                    ; 6612   0001
        MVII    #$FF00, R2                      ; 6613   02BA 0000 00FF

        JSR     R5,     L_5B42                  ; 6616   0004 0158 0342

L_6619:
        PULR    R7                              ; 6619   02B7

L_661A:
        SDBD                                    ; 661A   0001
        MVII    #$6F86, R4                      ; 661B   02BC 0086 006F
        MVI     G_01D6, R0                      ; 661E   0280 01D6
        TSTR    R0                              ; 6620   0080
        BEQ     L_6627                          ; 6621   0204 0004

        SDBD                                    ; 6623   0001
        MVII    #$6F84, R4                      ; 6624   02BC 0084 006F
L_6627:
        SDBD                                    ; 6627   0001
        MVI@    R4,     R0                      ; 6628   02A0
        MVII    #$0200, R4                      ; 6629   02BC 0200
        ADD     G_01CD, R4                      ; 662B   02C4 01CD
        MOVR    R5,     R7                      ; 662D   00AF

L_662E:
        MVO@    R0,     R4                      ; 662E   0260
        DECR    R1                              ; 662F   0011
        BNEQ    L_662E                          ; 6630   022C 0003

        PULR    R4                              ; 6632   02B4
        MOVR    R5,     R7                      ; 6633   00AF

L_6634:
        PSHR    R2                              ; 6634   0272
        MVII    #$0200, R2                      ; 6635   02BA 0200
        ADD     G_01CD, R2                      ; 6637   02C2 01CD
        ADDR    R2,     R1                      ; 6639   00D1
L_663A:
        DECR    R1                              ; 663A   0011
        CMPR    R2,     R1                      ; 663B   0151
        BLT     L_664F                          ; 663C   0205 0011

        MVI@    R1,     R0                      ; 663E   0288
        SDBD                                    ; 663F   0001
        ANDI    #$3600, R0                      ; 6640   03B8 0000 0036
        CMPI    #$0200, R0                      ; 6643   0378 0200
        BNEQ    L_664F                          ; 6645   020C 0008

        MVI@    R1,     R0                      ; 6647   0288
        SDBD                                    ; 6648   0001
        XORI    #$2400, R0                      ; 6649   03F8 0000 0024
        MVO@    R0,     R1                      ; 664C   0248
        B       L_663A                          ; 664D   0220 0014

L_664F:
        PULR    R2                              ; 664F   02B2
        MOVR    R5,     R7                      ; 6650   00AF

L_6651:
        PSHR    R5                              ; 6651   0275
        MVI@    R4,     R0                      ; 6652   02A0
        PSHR    R4                              ; 6653   0274
        MOVR    R0,     R1                      ; 6654   0081
        PSHR    R2                              ; 6655   0272
        PSHR    R3                              ; 6656   0273
        SLR     R0,     2                       ; 6657   0064
        SLR     R0,     1                       ; 6658   0060
        ANDI    #$007C, R0                      ; 6659   03B8 007C
        ADDR    R0,     R2                      ; 665B   00C2
        ANDI    #$001F, R1                      ; 665C   03B9 001F
        TSTR    R1                              ; 665E   0089
        BEQ     L_66E4                          ; 665F   0204 0083

        SUBI    #$0006, R1                      ; 6661   0339 0006
        MVI     G_01CB, R0                      ; 6663   0280 01CB
        CLRR    R4                              ; 6665   01E4
L_6666:
        MVI@    R2,     R3                      ; 6666   0293
        TSTR    R4                              ; 6667   00A4
        BEQ     L_6671                          ; 6668   0204 0007

        SLR     R3,     2                       ; 666A   0067
        SLR     R3,     2                       ; 666B   0067
        SLR     R3,     1                       ; 666C   0063
        INCR    R2                              ; 666D   000A
        CLRR    R4                              ; 666E   01E4
        B       L_6672                          ; 666F   0200 0001

L_6671:
        INCR    R4                              ; 6671   000C
L_6672:
        TSTR    R0                              ; 6672   0080
        BEQ     L_66BB                          ; 6673   0204 0046

        CMPI    #$0001, R0                      ; 6675   0378 0001
        BNEQ    L_66AE                          ; 6677   020C 0035

        MVI     G_01CF, R0                      ; 6679   0280 01CF
        TSTR    R0                              ; 667B   0080
        BEQ     L_66AF                          ; 667C   0204 0031

        PULR    R0                              ; 667E   02B0
        PSHR    R0                              ; 667F   0270
        PSHR    R3                              ; 6680   0273
        SLR     R3,     2                       ; 6681   0067
        ANDI    #$0007, R3                      ; 6682   03BB 0007
        ADDR    R0,     R3                      ; 6684   00C3
        TSTR    R1                              ; 6685   0089
        BMI     L_66AA                          ; 6686   020B 0022

        CMPI    #$0013, R1                      ; 6688   0379 0013
        BGT     L_66AA                          ; 668A   020E 001E

        MVI@    R3,     R0                      ; 668C   0298
        CMPI    #$00FF, R0                      ; 668D   0378 00FF
        BEQ     L_66AA                          ; 668F   0204 0019

        SLL     R0,     1                       ; 6691   0048
        SDBD                                    ; 6692   0001
        ADDI    #$6F70, R0                      ; 6693   02F8 0070 006F
        MOVR    R0,     R5                      ; 6696   0085
        SDBD                                    ; 6697   0001
        MVI@    R5,     R0                      ; 6698   02A8
        SDBD                                    ; 6699   0001
        ANDI    #$C9F8, R0                      ; 669A   03B8 00F8 00C9
        MOVR    R0,     R5                      ; 669D   0085
        MVII    #$0200, R3                      ; 669E   02BB 0200
        ADD     G_01CD, R3                      ; 66A0   02C3 01CD
        ADDR    R1,     R3                      ; 66A2   00CB
        MVI@    R3,     R0                      ; 66A3   0298
        SDBD                                    ; 66A4   0001
        ANDI    #$3600, R0                      ; 66A5   03B8 0000 0036
        XORR    R5,     R0                      ; 66A8   01E8
        MVO@    R0,     R3                      ; 66A9   0258
L_66AA:
        PULR    R3                              ; 66AA   02B3
        CLRR    R0                              ; 66AB   01C0
        B       L_66AF                          ; 66AC   0200 0001

L_66AE:
        DECR    R0                              ; 66AE   0010
L_66AF:
        ANDI    #$0003, R3                      ; 66AF   03BB 0003
        CMPI    #$0003, R3                      ; 66B1   037B 0003
        BEQ     L_66B8                          ; 66B3   0204 0003

        ADDR    R3,     R1                      ; 66B5   00D9
        B       L_6666                          ; 66B6   0220 0051

L_66B8:
        DECR    R1                              ; 66B8   0011
        B       L_6666                          ; 66B9   0220 0054

L_66BB:
        SLR     R3,     2                       ; 66BB   0067
        ANDI    #$0007, R3                      ; 66BC   03BB 0007
        PULR    R2                              ; 66BE   02B2
        PSHR    R2                              ; 66BF   0272
        ADDR    R2,     R3                      ; 66C0   00D3
        MVI     G_01CC, R4                      ; 66C1   0284 01CC
L_66C3:
        TSTR    R1                              ; 66C3   0089
        BMI     L_66DD                          ; 66C4   020B 0017

        CMPI    #$0013, R1                      ; 66C6   0379 0013
        BGT     L_66DD                          ; 66C8   020E 0013

        MVII    #$0200, R2                      ; 66CA   02BA 0200
        ADD     G_01CD, R2                      ; 66CC   02C2 01CD
        ADDR    R1,     R2                      ; 66CE   00CA
        MVI@    R3,     R0                      ; 66CF   0298
        CMPI    #$00FF, R0                      ; 66D0   0378 00FF
        BEQ     L_66DD                          ; 66D2   0204 0009

        SLL     R0,     1                       ; 66D4   0048
        SDBD                                    ; 66D5   0001
        ADDI    #$6F70, R0                      ; 66D6   02F8 0070 006F
        MOVR    R0,     R5                      ; 66D9   0085
        SDBD                                    ; 66DA   0001
        MVI@    R5,     R0                      ; 66DB   02A8
        MVO@    R0,     R2                      ; 66DC   0250
L_66DD:
        INCR    R1                              ; 66DD   0009
        ADDI    #$0008, R3                      ; 66DE   02FB 0008
        DECR    R4                              ; 66E0   0014
        BNEQ    L_66C3                          ; 66E1   022C 001F

        DECR    R1                              ; 66E3   0011
L_66E4:
        PULR    R3                              ; 66E4   02B3
        PULR    R2                              ; 66E5   02B2
        PULR    R4                              ; 66E6   02B4
        PULR    R7                              ; 66E7   02B7

L_66E8:
        PSHR    R5                              ; 66E8   0275
L_66E9:
        MVI     G_01A4, R0                      ; 66E9   0280 01A4
        MVI     G_0197, R2                      ; 66EB   0282 0197
        MVI     G_0178, R1                      ; 66ED   0281 0178
        TSTR    R1                              ; 66EF   0089
        BEQ     L_66F6                          ; 66F0   0204 0004

        MVI     G_0185, R2                      ; 66F2   0282 0185
        B       L_66FE                          ; 66F4   0200 0008

L_66F6:
        MVI     G_01C7, R1                      ; 66F6   0281 01C7
        TSTR    R1                              ; 66F8   0089
        BEQ     L_66FE                          ; 66F9   0204 0003

        MOVR    R1,     R0                      ; 66FB   0088
        MVI     G_017A, R2                      ; 66FC   0282 017A
L_66FE:
        TSTR    R0                              ; 66FE   0080
        BEQ     L_67A4                          ; 66FF   0204 00A3

        MVO     R2,     G_0350                  ; 6701   0242 0350
        MVII    #$017D, R3                      ; 6703   02BB 017D
        ADD@    R3,     R0                      ; 6705   02D8
        ANDI    #$000F, R0                      ; 6706   03B8 000F
        MVO@    R0,     R3                      ; 6708   0258
        B       L_67BA                          ; 6709   0200 00AF

        CLRR    R0                              ; 670B   01C0
        MVO     R0,     G_01C7                  ; 670C   0240 01C7
        MOVR    R5,     R7                      ; 670E   00AF

L_670F:
        PSHR    R5                              ; 670F   0275
        MVO     R0,     G_01EE                  ; 6710   0240 01EE
        TSTR    R0                              ; 6712   0080
        BPL     L_6718                          ; 6713   0203 0003

        CLRR    R2                              ; 6715   01D2
        B       L_671E                          ; 6716   0200 0006

L_6718:
        MVII    #$0004, R1                      ; 6718   02B9 0004

        JSR     R5,     L_55F0                  ; 671A   0004 0154 01F0

        NEGR    R2                              ; 671D   0022
L_671E:
        MVO     R2,     G_01A5                  ; 671E   0242 01A5
        MVI     G_01EE, R0                      ; 6720   0280 01EE

        JSR     R5,     X_EXT_SIGN_LO           ; 6722   0004 0114 0268

        PULR    R7                              ; 6725   02B7

L_6726:
        MOVR    R0,     R1                      ; 6726   0081
        SAR     R1,     1                       ; 6727   0069
        SDBD                                    ; 6728   0001
        ADDI    #$673C, R1                      ; 6729   02F9 003C 0067
        MVI@    R1,     R1                      ; 672C   0289
        MVO     R1,     G_01A4                  ; 672D   0241 01A4
        MOVR    R0,     R1                      ; 672F   0081
        ANDI    #$0007, R1                      ; 6730   03B9 0007
        SAR     R1,     1                       ; 6732   0069
        SDBD                                    ; 6733   0001
        ADDI    #$6744, R1                      ; 6734   02F9 0044 0067
        MVI@    R1,     R1                      ; 6737   0289
        MVO     R1,     G_0197                  ; 6738   0241 0197
        MOVR    R5,     R7                      ; 673A   00AF

        DECLE   $0000,  $00FF,  $00FF,  $0000   ; 673B   0000 00FF 00FF 0000
        DECLE   $0001,  $0001,  $0001,  $0000   ; 673F   0001 0001 0001 0000
        DECLE   $00FF,  $0004,  $000A,  $0000   ; 6743   00FF 0004 000A 0000

        INCR    R2                              ; 6747   000A
        PSHR    R5                              ; 6748   0275
        MVII    #$0002, R0                      ; 6749   02B8 0002
        MVO     R0,     G_034F                  ; 674B   0240 034F
        MVI     G_019F, R3                      ; 674D   0283 019F
        CMPR    R0,     R3                      ; 674F   0143
        BGE     L_679D                          ; 6750   020D 004B

        CLRR    R1                              ; 6752   01C9
        CLRR    R2                              ; 6753   01D2
        MVI     G_01CA, R3                      ; 6754   0283 01CA
        TSTR    R3                              ; 6756   009B
        BNEQ    L_6789                          ; 6757   020C 0030

        MVI     G_02F3, R3                      ; 6759   0283 02F3
        CMPI    #$0004, R3                      ; 675B   037B 0004
        BGE     L_6768                          ; 675D   020D 0009

        MVI     G_0195, R3                      ; 675F   0283 0195
        ANDI    #$0020, R3                      ; 6761   03BB 0020
        BEQ     L_6768                          ; 6763   0204 0003

        JSR     R5,     L_5D2C                  ; 6765   0004 015C 012C

L_6768:
        MVI     G_0178, R3                      ; 6768   0283 0178
        MVI     G_0183, R1                      ; 676A   0281 0183
        TSTR    R3                              ; 676C   009B
        BEQ     L_6771                          ; 676D   0204 0002

        MVI     G_0184, R1                      ; 676F   0281 0184
L_6771:
        MVI     G_01A5, R0                      ; 6771   0280 01A5

        JSR     R5,     X_EXT_SIGN_LO           ; 6773   0004 0114 0268
        JSR     R5,     X_MPY                   ; 6776   0004 011C 01DC

        SAR     R2,     2                       ; 6779   006E
        MOVR    R2,     R1                      ; 677A   0091
        MVI     G_017D, R0                      ; 677B   0280 017D

        JSR     R5,     L_55F0                  ; 677D   0004 0154 01F0

        MVI     G_0178, R3                      ; 6780   0283 0178
        TSTR    R3                              ; 6782   009B
        BNEQ    L_678B                          ; 6783   020C 0006

        ADD     G_0186, R1                      ; 6785   02C1 0186
        ADD     G_0187, R2                      ; 6787   02C2 0187
L_6789:
        SUB     G_0180, R2                      ; 6789   0302 0180
L_678B:
        NEGR    R2                              ; 678B   0022
        MOVR    R1,     R0                      ; 678C   0088
        MVII    #$012A, R3                      ; 678D   02BB 012A
        MVI@    R3,     R1                      ; 678F   0299

        JSR     R5,     L_67A5                  ; 6790   0004 0164 03A5

        MVO@    R1,     R3                      ; 6793   0259
        MOVR    R2,     R0                      ; 6794   0090
        MVII    #$010C, R3                      ; 6795   02BB 010C
        MVI@    R3,     R1                      ; 6797   0299

        JSR     R5,     L_67A5                  ; 6798   0004 0164 03A5

        MVO@    R1,     R3                      ; 679B   0259
        PULR    R7                              ; 679C   02B7

L_679D:
        CLRR    R0                              ; 679D   01C0
        MVO     R0,     G_012A                  ; 679E   0240 012A
        MVO     R0,     G_010C                  ; 67A0   0240 010C
        MVO     R0,     G_010A                  ; 67A2   0240 010A
L_67A4:
        PULR    R7                              ; 67A4   02B7

L_67A5:
        PSHR    R5                              ; 67A5   0275
        SUBR    R1,     R0                      ; 67A6   0108

        JSR     R5,     X_EXT_SIGN_LO           ; 67A7   0004 0114 0268

        BMI     L_67B0                          ; 67AA   020B 0004
        BEQ     L_67B0                          ; 67AC   0204 0002

        ADDI    #$0001, R0                      ; 67AE   02F8 0001
L_67B0:
        SAR     R0,     1                       ; 67B0   0068
        ADDR    R0,     R1                      ; 67B1   00C1
        SAR     R0,     1                       ; 67B2   0068
        TSTR    R0                              ; 67B3   0080
        BPL     L_67B7                          ; 67B4   0203 0001

        INCR    R0                              ; 67B6   0008
L_67B7:
        ADDR    R0,     R1                      ; 67B7   00C1
        PULR    R7                              ; 67B8   02B7

L_67B9:
        PSHR    R5                              ; 67B9   0275

L_67BA:
        JSR     R5,     L_68CB                  ; 67BA   0004 0168 00CB

        MVO     R1,     G_0347                  ; 67BD   0241 0347
        MVII    #$0001, R2                      ; 67BF   02BA 0001
        MVII    #$032F, R3                      ; 67C1   02BB 032F

        JSR     R5,     L_68AD                  ; 67C3   0004 0168 00AD

        ADDI    #$0004, R0                      ; 67C6   02F8 0004
        ANDI    #$0007, R0                      ; 67C8   03B8 0007
        SUBI    #$0004, R0                      ; 67CA   0338 0004
        ANDI    #$000F, R0                      ; 67CC   03B8 000F

        JSR     R5,     L_68CB                  ; 67CE   0004 0168 00CB

        MVO     R1,     G_0348                  ; 67D1   0241 0348
        MVII    #$0001, R2                      ; 67D3   02BA 0001
        MVII    #$0330, R3                      ; 67D5   02BB 0330

        JSR     R5,     L_68AD                  ; 67D7   0004 0168 00AD

        ADDI    #$0008, R0                      ; 67DA   02F8 0008
        ANDI    #$000F, R0                      ; 67DC   03B8 000F

        JSR     R5,     L_68CB                  ; 67DE   0004 0168 00CB

        MVO     R1,     G_0349                  ; 67E1   0241 0349
        MVII    #$0001, R2                      ; 67E3   02BA 0001
        MVII    #$0331, R3                      ; 67E5   02BB 0331
        J       L_68AE                          ; 67E7   0004 0368 00AE

L_67EA:
        PSHR    R5                              ; 67EA   0275

L_67EB:
        JSR     R5,     X_PLAY_SFX2             ; 67EB   0004 0118 03BE
        DECLE   $00B0                           ; 67EE  SFX prio
        DECLE   $0169                           ; 67EF  SFX data
        DECLE   $002C,  $0000                   ; 67F0  SFX data
        DECLE   $000B                           ; 67F2  SFX data
        DECLE   $0040,  $0300                   ; 67F3  SFX data
        DECLE   $010D                           ; 67F5  SFX data
        DECLE   $00A1,  $0300                   ; 67F6  SFX data
        DECLE   $008F,  $001E                   ; 67F8  SFX data
        DECLE   $0077,  $0032,  $0068           ; 67FA  SFX data
        DECLE   $02CF                           ; 67FD  SFX end

L_67FE:
        PSHR    R5                              ; 67FE   0275

L_67FF:
        JSR     R5,     X_PLAY_SFX2             ; 67FF   0004 0118 03BE
        DECLE   $00D0                           ; 6802  SFX prio
        DECLE   $02CF                           ; 6803  SFX end


        PSHR    R5                              ; 6804   0275

L_6805:
        JSR     R5,     X_PLAY_SFX2             ; 6805   0004 0118 03BE
        DECLE   $00B0                           ; 6808  SFX prio
        DECLE   $00F9                           ; 6809  SFX data
        DECLE   $0137                           ; 680A  SFX data
        DECLE   $010D                           ; 680B  SFX data
        DECLE   $000C,  $0200                   ; 680C  SFX data
        DECLE   $038B                           ; 680E  SFX data
        DECLE   $02AB                           ; 680F  SFX data
        DECLE   $002C,  $0300                   ; 6810  SFX data
        DECLE   $008F,  $0032                   ; 6812  SFX data
        DECLE   $0077,  $0032,  $0068           ; 6814  SFX data
        DECLE   $02CF                           ; 6817  SFX end

L_6818:
        PSHR    R5                              ; 6818   0275

        JSR     R5,     X_PLAY_SFX2             ; 6819   0004 0118 03BE
        DECLE   $00B0                           ; 681C  SFX prio
        DECLE   $00F9                           ; 681D  SFX data
        DECLE   $0137                           ; 681E  SFX data
        DECLE   $010D                           ; 681F  SFX data
        DECLE   $038B                           ; 6820  SFX data
        DECLE   $002C,  $0300                   ; 6821  SFX data
        DECLE   $008F,  $0032                   ; 6823  SFX data
        DECLE   $0077,  $0032,  $0068           ; 6825  SFX data
        DECLE   $02CF                           ; 6828  SFX end


        PSHR    R5                              ; 6829   0275

L_682A:
        JSR     R5,     X_PLAY_SFX2             ; 682A   0004 0118 03BE
        DECLE   $0088                           ; 682D  SFX prio
        DECLE   $010D                           ; 682E  SFX data
        DECLE   $0215                           ; 682F  SFX data
        DECLE   $01F9                           ; 6830  SFX data
        DECLE   $03CF                           ; 6831  SFX end

UC_6832:
        SDBD                                    ; 6832  SLIB UCALL target
        MVII    #$682E, R4                      ; 6833   02BC 002E 0068
        PULR    R7                              ; 6836   02B7

        PSHR    R5                              ; 6837   0275

L_6838:
        JSR     R5,     X_PLAY_SFX2             ; 6838   0004 0118 03BE
        DECLE   $00B0                           ; 683B  SFX prio
        DECLE   $0059,  $006D,  $0195,  $00B7   ; 683C   0059 006D 0195 00B7
        DECLE   $000C,  $00A0,  $000B,  $03C8   ; 6840   000C 00A0 000B 03C8
        DECLE   $0010,  $03F8,  $03FF,  $02B8   ; 6844   0010 03F8 03FF 02B8
        DECLE   $03F0,  $03D5,  $006B,  $000D   ; 6848   03F0 03D5 006B 000D
        DECLE   $03F8,  $03E0,  $0238,  $03F0   ; 684C   03F8 03E0 0238 03F0
        DECLE   $03F8,  $03D0,  $0215           ; 6850   03F8 03D0 0215

        SAR     R3,     1                       ; 6853   006B
        MVII    #$03D0, R0                      ; 6854   02B8 03D0
        SUBR    R7,     R0                      ; 6856   0138
        XOR@    R2,     R0                      ; 6857   03D0
        RRC     R3,     2                       ; 6858   0077
        GSWD    R2                              ; 6859   0032
        SAR     R0,     1                       ; 685A   0068
        ADD@    R1,     R7                      ; 685B   02CF

        MVI     G_01D6, R0                      ; 685C   0280 01D6
        TSTR    R0                              ; 685E   0080
        BNEQ    L_6862                          ; 685F   020C 0001
L_6861:
        MOVR    R5,     R7                      ; 6861   00AF

L_6862:
        MVI     G_0177, R0                      ; 6862   0280 0177
        CMPI    #$00FF, R0                      ; 6864   0378 00FF
        BEQ     L_6861                          ; 6866   0224 0006

L_6868:
        PSHR    R5                              ; 6868   0275

        JSR     R5,     X_PLAY_SFX2             ; 6869   0004 0118 03BE
        DECLE   $0084                           ; 686C  SFX prio
        DECLE   $000D,  $0137                   ; 686D   000D 0137

        INCR    R3                              ; 686F   000B
        INCR    R4                              ; 6870   000C
        TSTR    R0                              ; 6871   0080
        ADDI    #$006B, R1                      ; 6872   02F9 006B
        ADD@    R1,     R7                      ; 6874   02CF

L_6875:
        PSHR    R5                              ; 6875   0275

L_6876:
        JSR     R5,     X_PLAY_SFX2             ; 6876   0004 0118 03BE
        DECLE   $0088                           ; 6879  SFX prio
        DECLE   $01B9,  $0074,  $03FF           ; 687A   01B9 0074 03FF

        INCR    R5                              ; 687D   000D
        SAR     R0,     2                       ; 687E   006C
        SUB@    R5,     R1                      ; 687F   0329
        INCR    R3                              ; 6880   000B
        MOVR    R1,     R7                      ; 6881   008F

        RSWD    R4                              ; 6882   003C
        ADD@    R1,     R7                      ; 6883   02CF

L_6884:
        PSHR    R5                              ; 6884   0275

L_6885:
        JSR     R5,     X_PLAY_SFX2             ; 6885   0004 0118 03BE
        DECLE   $00C0                           ; 6888  SFX prio

        XOR@    R5,     R1                      ; 6889   03E9
        AND     G_0300, R0                      ; 688A   0380 0300
        MOVR    R4,     R1                      ; 688C   00A1
        SUB     G_008F, R0                      ; 688D   0300 008F
        INCR    R2                              ; 688F   000A
        RRC     R3,     2                       ; 6890   0077
        GSWD    R2                              ; 6891   0032
        SAR     R0,     1                       ; 6892   0068
        ADD@    R1,     R7                      ; 6893   02CF

L_6894:
        PSHR    R5                              ; 6894   0275

L_6895:
        JSR     R5,     X_PLAY_MUS1             ; 6895   0004 0118 0327
        DECLE   $0191                           ; 6898  Note (short)
        DECLE   $01DA                           ; 6899  Note (short)
        DECLE   $019A                           ; 689A  Note (short)
        DECLE   $020A                           ; 689B  Note (short)
        DECLE   $014A                           ; 689C  Note (short)
        DECLE   $018A                           ; 689D  Note (short)
        DECLE   $014A                           ; 689E  Note (short)
        DECLE   $019A                           ; 689F  Note (short)
        DECLE   $00DA                           ; 68A0  Note (short)
        DECLE   $011A                           ; 68A1  Note (short)
        DECLE   $00DA                           ; 68A2  Note (short)
        DECLE   $00F2                           ; 68A3  Note (short)
        DECLE   $0114                           ; 68A4  Note (short)
        DECLE   $0124                           ; 68A5  Note (short)
        DECLE   $014A                           ; 68A6  Note (short)
        DECLE   $012A                           ; 68A7  Note (short)
        DECLE   $011A                           ; 68A8  Note (short)
        DECLE   $00DA                           ; 68A9  Note (short)
        DECLE   $014F                           ; 68AA  Note (short)
        DECLE   $0000                           ; 68AB  End of music

        PULR    R7                              ; 68AC   02B7

L_68AD:
        PSHR    R5                              ; 68AD   0275
L_68AE:
        MOVR    R0,     R1                      ; 68AE   0081
        SARC    R1,     2                       ; 68AF   007D
        BC      L_68B4                          ; 68B0   0201 0002
        BNOV    L_68CA                          ; 68B2   020A 0016

L_68B4:
        PSHR    R2                              ; 68B4   0272
        SDBD                                    ; 68B5   0001
        MVII    #$6B28, R4                      ; 68B6   02BC 0028 006B
        ADDR    R1,     R4                      ; 68B9   00CC
        MVI@    R4,     R1                      ; 68BA   02A1
        SWAP    R1,     1                       ; 68BB   0041
        XOR@    R3,     R1                      ; 68BC   03D9
        SDBD                                    ; 68BD   0001
        ANDI    #$0C00, R1                      ; 68BE   03B9 0000 000C
L_68C1:
        DIS                                     ; 68C1   0003
        XOR@    R3,     R1                      ; 68C2   03D9
        MVO@    R1,     R3                      ; 68C3   0259
        EIS                                     ; 68C4   0002
        INCR    R3                              ; 68C5   000B
        DECR    R2                              ; 68C6   0012
        BNEQ    L_68C1                          ; 68C7   022C 0007

        SUB@    R6,     R3                      ; 68C9   0333
L_68CA:
        PULR    R7                              ; 68CA   02B7

L_68CB:
        MVII    #$0008, R2                      ; 68CB   02BA 0008
        MOVR    R0,     R1                      ; 68CD   0081
        CMPI    #$0004, R1                      ; 68CE   0379 0004
        BLE     L_68DC                          ; 68D0   0206 000A

        CMPR    R2,     R1                      ; 68D2   0151
        BLE     L_68DA                          ; 68D3   0206 0005

        CMPI    #$000C, R1                      ; 68D5   0379 000C
        BLT     L_68DC                          ; 68D7   0205 0003

        SUBR    R2,     R1                      ; 68D9   0111
L_68DA:
        SUBR    R1,     R2                      ; 68DA   010A
        MOVR    R2,     R1                      ; 68DB   0091
L_68DC:
        ANDI    #$0007, R1                      ; 68DC   03B9 0007
        MOVR    R5,     R7                      ; 68DE   00AF

        SLL     R0,     1                       ; 68DF   0048
        MOVR    R3,     R0                      ; 68E0   0098
        ADDR    R7,     R6                      ; 68E1   00FE
        ADDR    R7,     R0                      ; 68E2   00F8
        XORR    R6,     R0                      ; 68E3   01F0
        ADDR    R7,     R0                      ; 68E4   00F8
        ADDR    R7,     R4                      ; 68E5   00FC
        XORR    R7,     R6                      ; 68E6   01FE
        ADDR    R6,     R3                      ; 68E7   00F3
        ADDR    R6,     R1                      ; 68E8   00F1
        ADDR    R4,     R7                      ; 68E9   00E7
        ADDR    R0,     R7                      ; 68EA   00C7

        DECLE   $0093,  $0021,  $0001,  $0083   ; 68EB   0093 0021 0001 0083
        DECLE   $007F,  $001F,  $010F,  $001F   ; 68EF   007F 001F 010F 001F
        DECLE   $003F,  $017F,  $0100,  $0080   ; 68F3   003F 017F 0100 0080
        DECLE   $01C0,  $00E0,  $00F0,  $00FC   ; 68F7   01C0 00E0 00F0 00FC
        DECLE   $01FF,  $00FE,  $00F8,  $00C0   ; 68FB   01FF 00FE 00F8 00C0
        DECLE   $0380,  $0180,  $00C0,  $00E0   ; 68FF   0380 0180 00C0 00E0
        DECLE   $00FC,  $00FE,  $00FF,  $0201   ; 6903   00FC 00FE 00FF 0201
        DECLE   $0003,  $0007,  $003F           ; 6907   0003 0007 003F

        SARC    R3,     2                       ; 690A   007F
        ADDI    #$007F, R7                      ; 690B   02FF 007F

        DECLE   $001F,  $0003,  $0201,  $01FF   ; 690D   001F 0003 0201 01FF
        DECLE   $01FE,  $00FC,  $00F8,  $00E0   ; 6911   01FE 00FC 00F8 00E0
        DECLE   $0080,  $00C0,  $00F0,  $00F8   ; 6915   0080 00C0 00F0 00F8
        DECLE   $01FC,  $01FE,  $00FF,  $0003   ; 6919   01FC 01FE 00FF 0003
        DECLE   $000F,  $001F,  $013F           ; 691D   000F 001F 013F

        CMPR    R7,     R7                      ; 6920   017F
        ADDI    #$007F, R7                      ; 6921   02FF 007F

        DECLE   $013F,  $001F,  $000F,  $0003   ; 6923   013F 001F 000F 0003
        DECLE   $00FF,  $00FC,  $00F0,  $00E0   ; 6927   00FF 00FC 00F0 00E0
        DECLE   $01C0,  $0380,  $01C0,  $00E0   ; 692B   01C0 0380 01C0 00E0
        DECLE   $00F0,  $00FC,  $00FF,  $0201   ; 692F   00F0 00FC 00FF 0201
        DECLE   $0003,  $0007,  $000F,  $003F   ; 6933   0003 0007 000F 003F
        DECLE   $01FF,  $003F                   ; 6937   01FF 003F

        INCR    R7                              ; 6939   000F

        SETC                                    ; 693A   0007
L_693B:
        SUBR    R0,     R3                      ; 693B   0103
        DECLE   $0101,  $007E,  $003A,  $003B   ; 693C   0101 007E 003A 003B
        DECLE   $007C,  $01FE,  $007C,  $0038   ; 6940   007C 01FE 007C 0038
        DECLE   $00FF,  $00E3,  $00CD,  $0082   ; 6944   00FF 00E3 00CD 0082
        DECLE   $0080,  $00C1,  $03FF,  $00C3   ; 6948   0080 00C1 03FF 00C3
        DECLE   $009D,  $0002,  $0100,  $0081   ; 694C   009D 0002 0100 0081
        DECLE   $003C,  $0042,  $0099,  $01A1   ; 6950   003C 0042 0099 01A1
        DECLE   $0099,  $0042,  $003C,  $0018   ; 6954   0099 0042 003C 0018
        DECLE   $001C,  $0036,  $0300,  $0000   ; 6958   001C 0036 0300 0000
        DECLE   $0020,  $0011,  $0096,  $0044   ; 695C   0020 0011 0096 0044
        DECLE   $0028,  $0030,  $0108,  $0000   ; 6960   0028 0030 0108 0000
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 6964   001F 003F 007F 00FF
        DECLE   $0300,  $00F8,  $00FC,  $00FE   ; 6968   0300 00F8 00FC 00FE
        DECLE   $00FF,  $0200,  $03FF,  $03FF   ; 696C   00FF 0200 03FF 03FF
        DECLE   $00FF,  $0300,  $0000,  $0080   ; 6970   00FF 0300 0000 0080
        DECLE   $00C0,  $00FF,  $0001,  $0300   ; 6974   00C0 00FF 0001 0300
        DECLE   $0100,  $007F,  $0069,  $0004   ; 6978   0100 007F 0069 0004

        CLRC                                    ; 697C   0006
        SAR     R2,     1                       ; 697D   006A
        DIS                                     ; 697E   0003
        TSTR    R3                              ; 697F   009B
        ADDR    R5,     R7                      ; 6980   00EF

        DECLE   $0099,  $00E6,  $003F,  $00D3   ; 6981   0099 00E6 003F 00D3
        DECLE   $00FD,  $00F7                   ; 6985   00FD 00F7

        ADDR    R1,     R5                      ; 6987   00CD
        MOVR    R5,     R7                      ; 6988   00AF

        ADDR    R7,     R5                      ; 6989   00FD
        ADDR    R5,     R2                      ; 698A   00EA
        MOVR    R2,     R7                      ; 698B   0097

L_698C:
        RLC     R3,     1                       ; 698C   0053
        ADDR    R7,     R5                      ; 698D   00FD
        ADDR    R6,     R3                      ; 698E   00F3
        MOVR    R3,     R1                      ; 698F   0099
        ADDR    R1,     R7                      ; 6990   00CF

        DECLE   $00F9,  $00CC,  $0037           ; 6991   00F9 00CC 0037

        ADDR    R2,     R3                      ; 6994   00D3
        ADDR    R7,     R5                      ; 6995   00FD
        ADDR    R7,     R3                      ; 6996   00FB
        ADDR    R3,     R7                      ; 6997   00DF

        ADDR    R5,     R3                      ; 6998   00EB
        ADDR    R3,     R1                      ; 6999   00D9
        ADDR    R1,     R6                      ; 699A   00CE
        MOVR    R6,     R3                      ; 699B   00B3
        ADDR    R3,     R3                      ; 699C   00DB
        ADDR    R7,     R5                      ; 699D   00FD
        ADDR    R4,     R7                      ; 699E   00E7

        SARC    R0,     1                       ; 699F   0078
        TSTR    R0                              ; 69A0   0080
        DECR    R0                              ; 69A1   0010
L_69A2:
        ADCR    R1                              ; 69A2   0029
        SWAP    R1,     2                       ; 69A3   0045
        SWAP    R1,     1                       ; 69A4   0041
        SWAP    R2,     1                       ; 69A5   0042
        NOP                                     ; 69A6   0034
        SARC    R0,     1                       ; 69A7   0078

        JSR     R4,     .EXEC.824               ; 69A8   0004 0018 0024
        DECLE   $0045,  $0041,  $0042,  $0026   ; 69AB   0045 0041 0042 0026
        DECLE   $0038,  $0004,  $000A,  $003C   ; 69AF   0038 0004 000A 003C
        DECLE   $0040,  $0041,  $0002,  $000C   ; 69B3   0040 0041 0002 000C
        DECLE   $0018,  $0046,  $0099,  $0024   ; 69B7   0018 0046 0099 0024
        DECLE   $004C,  $0000,  $0002,  $001C   ; 69BB   004C 0000 0002 001C
        DECLE   $0048,  $0086,  $0039,  $0025   ; 69BF   0048 0086 0039 0025
        DECLE   $0008,  $0000,  $0020,  $001C   ; 69C3   0008 0000 0020 001C
        DECLE   $0020,  $00C6,  $0039,  $0001   ; 69C7   0020 00C6 0039 0001
        DECLE   $0029,  $0020,  $0020,  $0018   ; 69CB   0029 0020 0020 0018
        DECLE   $0030,  $0042,  $0019,  $0025   ; 69CF   0030 0042 0019 0025
        DECLE   $0029,  $0021,  $0020,  $0010   ; 69D3   0029 0021 0020 0010
        DECLE   $0038,  $0040,  $0011,  $0025   ; 69D7   0038 0040 0011 0025
        DECLE   $0049,  $0001,  $0002,  $0000   ; 69DB   0049 0001 0002 0000
        DECLE   $0040,  $0080,  $00C0,  $00C0   ; 69DF   0040 0080 00C0 00C0
        DECLE   $0080,  $0040,  $0000,  $0000   ; 69E3   0080 0040 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0060   ; 69E7   0000 0040 0040 0060
        DECLE   $0060,  $0030,  $0000,  $0000   ; 69EB   0060 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 69EF   0000 0000 0000 0080
        DECLE   $00E0,  $0060,  $0030,  $0000   ; 69F3   00E0 0060 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 69F7   0000 0000 0000 0040
        DECLE   $0070,  $003C,  $0000,  $0000   ; 69FB   0070 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FF   0000 0000 0000 0000
        DECLE   $0000,  $005A,  $003C,  $0040   ; 6A03   0000 005A 003C 0040
        DECLE   $0070,  $0078,  $0058,  $0040   ; 6A07   0070 0078 0058 0040
        DECLE   $0040,  $0040,  $0000,  $0060   ; 6A0B   0040 0040 0000 0060
        DECLE   $0070,  $0078,  $0040,  $0040   ; 6A0F   0070 0078 0040 0040
        DECLE   $0040,  $0040,  $0000,  $0040   ; 6A13   0040 0040 0000 0040
        DECLE   $0070,  $007C,  $0070,  $0040   ; 6A17   0070 007C 0070 0040
        DECLE   $0040,  $0040,  $0000,  $0000   ; 6A1B   0040 0040 0000 0000
        DECLE   $00D6,  $00FE,  $00D6,  $0010   ; 6A1F   00D6 00FE 00D6 0010
        DECLE   $0010,  $0010,  $0080,  $0044   ; 6A23   0010 0010 0080 0044
        DECLE   $002E,  $001F,  $007C,  $0038   ; 6A27   002E 001F 007C 0038
        DECLE   $0010,  $0000,  $0002,  $0004   ; 6A2B   0010 0000 0002 0004
        DECLE   $0048,  $00F0,  $00FC,  $003C   ; 6A2F   0048 00F0 00FC 003C
        DECLE   $0008,  $0000,  $0000,  $0048   ; 6A33   0008 0000 0000 0048
        DECLE   $0090,  $00D8,  $00D8,  $0090   ; 6A37   0090 00D8 00D8 0090
        DECLE   $0048,  $0000,  $0000,  $0010   ; 6A3B   0048 0000 0000 0010
        DECLE   $0050,  $0058,  $0078,  $006C   ; 6A3F   0050 0058 0078 006C
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6A43   0030 0000 0000 0000
        DECLE   $0020,  $0038,  $0098,  $00EC   ; 6A47   0020 0038 0098 00EC
        DECLE   $0060,  $0030,  $0000,  $0000   ; 6A4B   0060 0030 0000 0000
        DECLE   $0020,  $0038,  $005E,  $0070   ; 6A4F   0020 0038 005E 0070
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6A53   003C 0000 0000 0000
        DECLE   $0000,  $005A,  $003C,  $0000   ; 6A57   0000 005A 003C 0000
        DECLE   $005A,  $003C,  $0001,  $0000   ; 6A5B   005A 003C 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5F   0000 0000 0000 0000
        DECLE   $00F8,  $00FC,  $00FE,  $00FE   ; 6A63   00F8 00FC 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FC,  $00F8   ; 6A67   00FE 00FE 00FC 00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0078   ; 6A6F   0000 0000 0000 0078
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 6A73   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $00F8,  $00E0,  $0080   ; 6A77   00FE 00F8 00E0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F8,  $00FC   ; 6A7F   0000 0000 00F8 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 6A83   00FC 00FC 00FC 00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; 6A87   00F8 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6A8B   0080 0000 0000 0000
        DECLE   $0000,  $00F0,  $00F0,  $00F8   ; 6A8F   0000 00F0 00F0 00F8
        DECLE   $00F8,  $00F8,  $00F8,  $00F0   ; 6A93   00F8 00F8 00F8 00F0
        DECLE   $00F0,  $00E0,  $00E0,  $00C0   ; 6A97   00F0 00E0 00E0 00C0
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 6A9B   00C0 0080 0080 0000
        DECLE   $0000,  $00C0,  $00E0,  $00F0   ; 6A9F   0000 00C0 00E0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6AA3   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6AA7   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00E0,  $00C0,  $0000   ; 6AAB   00F0 00E0 00C0 0000
        DECLE   $0049,  $0092,  $00DB,  $00DB   ; 6AAF   0049 0092 00DB 00DB
        DECLE   $0092,  $0049,  $0000           ; 6AB3   0092 0049 0000

        JSR     R4,     .EXEC.456               ; 6AB6   0004 0014 0056
        DECLE   $005E,  $007B,  $006C,  $0030   ; 6AB9   005E 007B 006C 0030
        DECLE   $0000                           ; 6ABD   0000

        INCR    R0                              ; 6ABE   0008
        INCR    R6                              ; 6ABF   000E
        NEGR    R6                              ; 6AC0   0026
        RSWD    R3                              ; 6AC1   003B
        MOVR    R3,     R0                      ; 6AC2   0098
        ADDR    R5,     R4                      ; 6AC3   00EC
        SLR     R0,     1                       ; 6AC4   0060
        GSWD    R0                              ; 6AC5   0030
        DECR    R0                              ; 6AC6   0010
        COMR    R4                              ; 6AC7   001C
        ADCR    R7                              ; 6AC8   002F

        RSWD    R0                              ; 6AC9   0038
L_6ACA:
        SLLC    R2,     2                       ; 6ACA   005E
        DECLE   $0070,  $003C,  $0000,  $005A   ; 6ACB   0070 003C 0000 005A
        DECLE   $003C,  $0000,  $005A,  $003C   ; 6ACF   003C 0000 005A 003C
        DECLE   $0000                           ; 6AD3   0000

        SLLC    R2,     1                       ; 6AD4   005A
        RSWD    R4                              ; 6AD5   003C
        SWAP    R2,     1                       ; 6AD6   0042
        SARC    R2,     2                       ; 6AD7   007E
        SARC    R2,     2                       ; 6AD8   007E
        SARC    R2,     2                       ; 6AD9   007E
        SWAP    R2,     1                       ; 6ADA   0042
        SARC    R2,     2                       ; 6ADB   007E
        RSWD    R4                              ; 6ADC   003C
        RSWD    R4                              ; 6ADD   003C
        SARC    R2,     2                       ; 6ADE   007E
        SARC    R2,     2                       ; 6ADF   007E
        SARC    R2,     2                       ; 6AE0   007E
        SWAP    R2,     1                       ; 6AE1   0042
        SARC    R2,     2                       ; 6AE2   007E
        SARC    R2,     2                       ; 6AE3   007E
        RSWD    R4                              ; 6AE4   003C
        RSWD    R4                              ; 6AE5   003C
        SARC    R2,     2                       ; 6AE6   007E
        SARC    R2,     2                       ; 6AE7   007E
        SWAP    R2,     1                       ; 6AE8   0042
        SARC    R2,     2                       ; 6AE9   007E
        SARC    R2,     2                       ; 6AEA   007E
        SARC    R2,     2                       ; 6AEB   007E
        RSWD    R4                              ; 6AEC   003C
        RSWD    R4                              ; 6AED   003C
        SARC    R2,     2                       ; 6AEE   007E
        SWAP    R2,     1                       ; 6AEF   0042
        SARC    R2,     2                       ; 6AF0   007E
        SARC    R2,     2                       ; 6AF1   007E
        SARC    R2,     2                       ; 6AF2   007E
        SARC    R2,     2                       ; 6AF3   007E
        RSWD    R4                              ; 6AF4   003C
        ADDR    R4,     R0                      ; 6AF5   00E0
        RRC     R0,     1                       ; 6AF6   0070
        ADDR    R7,     R0                      ; 6AF7   00F8
        MOVR    R6,     R1                      ; 6AF8   00B1
        NEGR    R2                              ; 6AF9   0022
        RRC     R0,     2                       ; 6AFA   0074
        SARC    R0,     1                       ; 6AFB   0078
        SARC    R0,     1                       ; 6AFC   0078
        GSWD    R0                              ; 6AFD   0030
        SARC    R0,     1                       ; 6AFE   0078
        MOVR    R7,     R4                      ; 6AFF   00BC
        ADCR    R6                              ; 6B00   002E
        SLR     R2,     1                       ; 6B01   0062
        SWAP    R2,     1                       ; 6B02   0042
        SWAP    R2,     2                       ; 6B03   0046
        SLR     R3,     2                       ; 6B04   0067
        ANDR    R0,     R0                      ; 6B05   0180
        ANDR    R2,     R0                      ; 6B06   0190
        ANDR    R4,     R0                      ; 6B07   01A0
        ANDR    R6,     R0                      ; 6B08   01B0
        CLRR    R0                              ; 6B09   01C0
L_6B0A:
        XORR    R2,     R0                      ; 6B0A   01D0
        DECLE   $01E0,  $01F0,  $0021,  $0008   ; 6B0B   01E0 01F0 0021 0008
        DECLE   $00C0,  $0000,  $0003,  $0000   ; 6B0F   00C0 0000 0003 0000
        DECLE   $002C,  $006B,  $0000,  $0000   ; 6B13   002C 006B 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B17   0000 0000 0000 0000
        DECLE   $0000,  $0048,  $0080,  $0040   ; 6B1B   0000 0048 0080 0040
        DECLE   $0003,  $0000,  $0031,  $006B   ; 6B1F   0003 0000 0031 006B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B23   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0004,  $000C   ; 6B27   0008 0000 0004 000C
        DECLE   $0008,  $0057,  $0058,  $00F9   ; 6B2B   0008 0057 0058 00F9
        DECLE   $006B,  $0001,  $0057,  $0058   ; 6B2F   006B 0001 0057 0058
        DECLE   $0042,  $006B,  $0001,  $0013   ; 6B33   0042 006B 0001 0013
        DECLE   $0008,  $00A1,  $0000,  $0007   ; 6B37   0008 00A1 0000 0007
        DECLE   $0000,  $0052,  $006B,  $0000   ; 6B3B   0000 0052 006B 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3F   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0012,  $00FF   ; 6B43   0000 0024 0012 00FF
        DECLE   $0009,  $00C9,  $0029,  $00E9   ; 6B47   0009 00C9 0029 00E9
        DECLE   $00C9,  $0009,  $0009,  $00F7   ; 6B4B   00C9 0009 0009 00F7
        DECLE   $0009,  $0009,  $00FF,  $0057   ; 6B4F   0009 0009 00FF 0057
        DECLE   $0058,  $00F5,  $006A,  $0001   ; 6B53   0058 00F5 006A 0001
        DECLE   $0000,  $0009,  $0008,  $0081   ; 6B57   0000 0009 0008 0081
        DECLE   $0007,  $0000,  $00B4,  $006B   ; 6B5B   0007 0000 00B4 006B
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6B5F   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $000C   ; 6B63   0000 0000 000C 000C
        DECLE   $000C,  $0018,  $0038,  $0038   ; 6B67   000C 0018 0038 0038
        DECLE   $003C,  $0018,  $0018,  $001C   ; 6B6B   003C 0018 0018 001C
        DECLE   $0014,  $0014,  $0034,  $0064   ; 6B6F   0014 0014 0034 0064
        DECLE   $0046,  $0000,  $0000,  $000C   ; 6B73   0046 0000 0000 000C
        DECLE   $000C,  $000C,  $0018,  $0018   ; 6B77   000C 000C 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6B7B   0018 0018 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0008   ; 6B7F   0018 0078 0048 0008
        DECLE   $000C,  $0000,  $000C,  $000C   ; 6B83   000C 0000 000C 000C
        DECLE   $000C,  $0018,  $0038,  $005A   ; 6B87   000C 0018 0038 005A
        DECLE   $005C,  $0018,  $0018,  $0018   ; 6B8B   005C 0018 0018 0018
        DECLE   $0038,  $0030,  $0010,  $0010   ; 6B8F   0038 0030 0010 0010
        DECLE   $0018,  $000C,  $000C,  $000C   ; 6B93   0018 000C 000C 000C
        DECLE   $0018,  $003A,  $005C,  $0058   ; 6B97   0018 003A 005C 0058
        DECLE   $0018,  $0018,  $001C,  $001C   ; 6B9B   0018 0018 001C 001C
        DECLE   $0014,  $0014,  $0034,  $0026   ; 6B9F   0014 0014 0034 0026
        DECLE   $0020,  $0000,  $0000,  $0018   ; 6BA3   0020 0000 0000 0018
        DECLE   $0018,  $0018,  $0000           ; 6BA7   0018 0018 0000

        RSWD    R4                              ; 6BAA   003C
        SLLC    R2,     1                       ; 6BAB   005A
        SWAP    R2,     1                       ; 6BAC   0042
        RSWD    R4                              ; 6BAD   003C
        COMR    R0                              ; 6BAE   0018
        COMR    R0                              ; 6BAF   0018
        COMR    R0                              ; 6BB0   0018
        COMR    R0                              ; 6BB1   0018
        COMR    R0                              ; 6BB2   0018
        RSWD    R4                              ; 6BB3   003C
        RLC     R3,     2                       ; 6BB4   0057
        SLLC    R0,     1                       ; 6BB5   0058
        MOVR    R3,     R7                      ; 6BB6   009F

        DECLE   $0069,  $0008,  $0018,  $00B3   ; 6BB7   0069 0008 0018 00B3
        DECLE   $005D,  $00B3,  $005D,  $0015   ; 6BBB   005D 00B3 005D 0015
        DECLE   $0009,  $001F,  $0001,  $0000   ; 6BBF   0009 001F 0001 0000
        DECLE   $0010,  $00E3,  $006B,  $0010   ; 6BC3   0010 00E3 006B 0010
        DECLE   $0000,  $000E,  $0000,  $0000   ; 6BC7   0000 000E 0000 0000
        DECLE   $0000,  $0018,  $005A,  $005A   ; 6BCB   0000 0018 005A 005A
        DECLE   $0042,  $003C,  $0000,  $0000   ; 6BCF   0042 003C 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0000   ; 6BD3   0018 0018 0018 0000
        DECLE   $007E,  $0081,  $0000,  $0000   ; 6BD7   007E 0081 0000 0000
        DECLE   $0018,  $005A,  $005A,  $0042   ; 6BDB   0018 005A 005A 0042
        DECLE   $003C,  $0018,  $0099,  $00FF   ; 6BDF   003C 0018 0099 00FF
        DECLE   $0057,  $0058,  $001D,  $006A   ; 6BE3   0057 0058 001D 006A
        DECLE   $0003,  $0201,  $00DB,  $0063   ; 6BE7   0003 0201 00DB 0063
        DECLE   $000A,  $0063,  $0000,  $0009   ; 6BEB   000A 0063 0000 0009
        DECLE   $006C,  $0080,  $0000,  $0000   ; 6BEF   006C 0080 0000 0000
        DECLE   $0009,  $006C,  $0020,  $0000   ; 6BF3   0009 006C 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF7   0000 0000 0000 0000
        DECLE   $0090,  $0048,  $003F,  $0024   ; 6BFB   0090 0048 003F 0024
        DECLE   $00A4,  $00A5,  $0025,  $0024   ; 6BFF   00A4 00A5 0025 0024
        DECLE   $0024,  $0024,  $003B,  $0024   ; 6C03   0024 0024 003B 0024
        DECLE   $0024,  $003F,  $004C,  $005D   ; 6C07   0024 003F 004C 005D
        DECLE   $00D5,  $006A,  $0004,  $00F8   ; 6C0B   00D5 006A 0004 00F8
        DECLE   $007B,  $005D,  $007B,  $005D   ; 6C0F   007B 005D 007B 005D
        DECLE   $0099,  $005D,  $0099,  $005D   ; 6C13   0099 005D 0099 005D
        DECLE   $0099,  $005D,  $0054,  $0000   ; 6C17   0099 005D 0054 0000
        DECLE   $0044,  $0001,  $0006,  $0000   ; 6C1B   0044 0001 0006 0000
        DECLE   $0043,  $006C,  $0004,  $0000   ; 6C1F   0043 006C 0004 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6C23   0001 0000 0000 0000
        DECLE   $0000,  $0049,  $0080,  $0041   ; 6C27   0000 0049 0080 0041
        DECLE   $0002,  $0000,  $0052,  $006C   ; 6C2B   0002 0000 0052 006C
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6C2F   0004 0000 0000 0000
        DECLE   $0004,  $00FC,  $0000,  $0049   ; 6C33   0004 00FC 0000 0049
        DECLE   $0080,  $0045,  $0002,  $0000   ; 6C37   0080 0045 0002 0000
        DECLE   $0058,  $006C,  $0004,  $0000   ; 6C3B   0058 006C 0004 0000
        DECLE   $0000,  $0000,  $00F8,  $0000   ; 6C3F   0000 0000 00F8 0000
        DECLE   $0048,  $0067,  $00DE,  $0069   ; 6C43   0048 0067 00DE 0069
        DECLE   $0005,  $0048,  $0067,  $0035   ; 6C47   0005 0048 0067 0035
        DECLE   $006A,  $0005,  $0048,  $0067   ; 6C4B   006A 0005 0048 0067
        DECLE   $00AE,  $006A,  $0005,  $00E8   ; 6C4F   00AE 006A 0005 00E8
        DECLE   $0066,  $005F,  $006A,  $0005   ; 6C53   0066 005F 006A 0005
        DECLE   $0000,  $000B,  $0067,  $005F   ; 6C57   0000 000B 0067 005F
        DECLE   $006A,  $0005,  $0000           ; 6C5B   006A 0005 0000

        RLC     R3,     2                       ; 6C5E   0057
        SLLC    R0,     1                       ; 6C5F   0058
        SLR     R0,     2                       ; 6C60   0064
        SAR     R3,     1                       ; 6C61   006B
        J       .EXEC.858                       ; 6C62   0004 0318 0058

        SLLC    R1,     1                       ; 6C65   0059
        SLLC    R0,     1                       ; 6C66   0058
        SLLC    R1,     1                       ; 6C67   0059
L_6C68:
        ADDR    R3,     R6                      ; 6C68   00DE
        DECLE   $005D,  $006B,  $005A,  $0022   ; 6C69   005D 006B 005A 0022
        DECLE   $0001,  $00AB,  $0080,  $0007   ; 6C6D   0001 00AB 0080 0007
        DECLE   $0000,  $007A,  $006C,  $0004   ; 6C71   0000 007A 006C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C75   0000 0000 0000 0000
        DECLE   $0000,  $0047,  $005A,  $0064   ; 6C79   0000 0047 005A 0064
        DECLE   $006B,  $0004,  $0100,  $00A0   ; 6C7D   006B 0004 0100 00A0
        DECLE   $0063,  $0000,  $0009,  $0044   ; 6C81   0063 0000 0009 0044
        DECLE   $0080,  $0006,  $0000,  $0090   ; 6C85   0080 0006 0000 0090
        DECLE   $006C,  $0002,  $0000,  $0000   ; 6C89   006C 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0027   ; 6C8D   0000 0000 0000 0027
        DECLE   $0059,  $00CB,  $006B,  $0002   ; 6C91   0059 00CB 006B 0002
        DECLE   $0000,  $0057,  $0058,  $00CB   ; 6C95   0000 0057 0058 00CB
        DECLE   $006B,  $0002,  $02F8,  $0061   ; 6C99   006B 0002 02F8 0061
        DECLE   $0059,  $0061,  $0059,  $0073   ; 6C9D   0059 0061 0059 0073
        DECLE   $0060,  $0073,  $0060,  $0073   ; 6CA1   0060 0073 0060 0073
        DECLE   $0060,  $0073,  $0060,  $0009   ; 6CA5   0060 0073 0060 0009
        DECLE   $0004,  $0008,  $0007,  $000B   ; 6CA9   0004 0008 0007 000B
        DECLE   $0000,  $0003,  $0009,  $000C   ; 6CAD   0000 0003 0009 000C
        DECLE   $000D,  $000E,  $0009,  $0002   ; 6CB1   000D 000E 0009 0002
        DECLE   $0003,  $000A,  $0003,  $000A   ; 6CB5   0003 000A 0003 000A
        DECLE   $0009,  $0003,  $0008,  $0007   ; 6CB9   0009 0003 0008 0007
        DECLE   $0006,  $0009,  $0002,  $0001   ; 6CBD   0006 0009 0002 0001
        DECLE   $0000,  $0004,  $0009,  $0002   ; 6CC1   0000 0004 0009 0002
        DECLE   $0004,  $0005,  $0005           ; 6CC5   0004 0005 0005

        INCR    R4                              ; 6CC8   000C
        COMR    R0                              ; 6CC9   0018
        GSWD    R2                              ; 6CCA   0032
        ADDR    R1,     R7                      ; 6CCB   00CF

        DECLE   $0015,  $0000,  $002F,  $0054   ; 6CCC   0015 0000 002F 0054
        DECLE   $0000,  $0000,  $0018,  $0046   ; 6CD0   0000 0000 0018 0046
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD4   0000 0000 0000 0000
        DECLE   $002A,  $0036,  $0051,  $0070   ; 6CD8   002A 0036 0051 0070
        DECLE   $0000,  $0000,  $008D,  $00B3   ; 6CDC   0000 0000 008D 00B3
        DECLE   $0000,  $0000,  $0037,  $0066   ; 6CE0   0000 0000 0037 0066
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE4   0000 0000 0000 0000
        DECLE   $0049,  $0055,  $008C,  $0033   ; 6CE8   0049 0055 008C 0033
        DECLE   $00AA,  $0000                   ; 6CEC   00AA 0000

        CMPR    R6,     R2                      ; 6CEE   0172
        SUBR    R5,     R7                      ; 6CEF   012F

        DECLE   $0000,  $0000,  $0026,  $00B5   ; 6CF0   0000 0000 0026 00B5
        DECLE   $009A,  $0000,  $0000,  $0000   ; 6CF4   009A 0000 0000 0000

        SAR     R2,     1                       ; 6CF8   006A
        RRC     R2,     2                       ; 6CF9   0076
        MVO@    R4,     R1                      ; 6CFA   024C
        MOVR    R5,     R7                      ; 6CFB   00AF

        DECLE   $0211,  $01F3,  $006D,  $0000   ; 6CFC   0211 01F3 006D 0000
        DECLE   $0000,  $0000,  $0077,  $0007   ; 6D00   0000 0000 0077 0007
        DECLE   $0027,  $0000,  $0000,  $0000   ; 6D04   0027 0000 0000 0000
        DECLE   $0049,  $0055,  $0000,  $0000   ; 6D08   0049 0055 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0035,  $0026   ; 6D10   0000 0000 0035 0026
        DECLE   $0157,  $0000,  $0000,  $0000   ; 6D14   0157 0000 0000 0000
        DECLE   $001F,  $001F,  $0000,  $0000   ; 6D18   001F 001F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0073,  $0008   ; 6D20   0000 0000 0073 0008
        DECLE   $004D,  $0000,  $0000,  $0000   ; 6D24   004D 0000 0000 0000
        DECLE   $0087,  $0093,  $010C,  $0134   ; 6D28   0087 0093 010C 0134
        DECLE   $0155,  $0000,  $00CF,  $0009   ; 6D2C   0155 0000 00CF 0009
        DECLE   $0000,  $0000,  $0114,  $00D6   ; 6D30   0000 0000 0114 00D6
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6D34   0038 0000 0000 0000
        DECLE   $00AD,  $00B8,  $0171,  $0174   ; 6D38   00AD 00B8 0171 0174
        DECLE   $0190,  $0000,  $010F,  $00EB   ; 6D3C   0190 0000 010F 00EB
        DECLE   $0153,  $0000,  $010A,  $0047   ; 6D40   0153 0000 010A 0047
        DECLE   $00F4,  $0000,  $0000,  $0000   ; 6D44   00F4 0000 0000 0000
        DECLE   $00CA,  $00D6,  $01B2,  $01CE   ; 6D48   00CA 00D6 01B2 01CE
        DECLE   $01F6,  $0000,  $01D2,  $018F   ; 6D4C   01F6 0000 01D2 018F
        DECLE   $01B3,  $0000,  $00C7,  $0029   ; 6D50   01B3 0000 00C7 0029
        DECLE   $00EA,  $0000,  $0000,  $0000   ; 6D54   00EA 0000 0000 0000
        DECLE   $00EA,  $00F6,  $00AE,  $020F   ; 6D58   00EA 00F6 00AE 020F
        DECLE   $01F4,  $0000,  $01F0,  $0000   ; 6D5C   01F4 0000 01F0 0000
        DECLE   $0000,  $0000,  $0146,  $0018   ; 6D60   0000 0000 0146 0018
        DECLE   $0058,  $002A,  $0000,  $0000   ; 6D64   0058 002A 0000 0000
        DECLE   $010A,  $0115,  $016C,  $022E   ; 6D68   010A 0115 016C 022E
        DECLE   $0232,  $0252,  $02AE,  $0270   ; 6D6C   0232 0252 02AE 0270
        DECLE   $024C,  $0293,  $0047,  $0136   ; 6D70   024C 0293 0047 0136
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6D74   0038 0000 0000 0000
        DECLE   $0127,  $0133,  $01CF,  $010B   ; 6D78   0127 0133 01CF 010B
        DECLE   $0211                           ; 6D7C   0211

        ANDR    R6,     R2                      ; 6D7D   01B2
        ADD@    R1,     R1                      ; 6D7E   02C9
        ADD@    R5,     R7                      ; 6D7F   02EF

        DECLE   $0314,  $0000,  $0027,  $0114   ; 6D80   0314 0000 0027 0114
        DECLE   $0057,  $0000,  $0000,  $0000   ; 6D84   0057 0000 0000 0000

        CMPR    R1,     R2                      ; 6D88   014A
        ADDR    R2,     R6                      ; 6D89   00D6
        MOVR    R6,     R0                      ; 6D8A   00B0
        SUBR    R1,     R7                      ; 6D8B   010F

        DECLE   $0000,  $0000,  $0354,  $0334   ; 6D8C   0000 0000 0354 0334
        DECLE   $02ED,  $0000,  $0067,  $00ED   ; 6D90   02ED 0000 0067 00ED
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D94   0000 0000 0000 0000
        DECLE   $00B0,  $00B8,  $0215,  $0270   ; 6D98   00B0 00B8 0215 0270
        DECLE   $01F4,  $0000,  $0372,  $0393   ; 6D9C   01F4 0000 0372 0393
        DECLE   $0000,  $0000,  $010D,  $0066   ; 6DA0   0000 0000 010D 0066
        DECLE   $0156,  $0000,  $0000,  $0000   ; 6DA4   0156 0000 0000 0000
        DECLE   $016B,  $0093,  $0110,  $00AC   ; 6DA8   016B 0093 0110 00AC
        DECLE   $0131,  $0000,  $03AD,  $03D3   ; 6DAC   0131 0000 03AD 03D3
        DECLE   $0000,  $0000,  $0027,  $0057   ; 6DB0   0000 0000 0027 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB4   0000 0000 0000 0000
        DECLE   $016C,  $0313,  $026B,  $0199   ; 6DB8   016C 0313 026B 0199
        DECLE   $0064,  $032B,  $0195,  $0099   ; 6DBC   0064 032B 0195 0099
        DECLE   $032B,  $0324,  $016C,  $0318   ; 6DC0   032B 0324 016C 0318
        DECLE   $0304,  $0099,  $0178,  $0313   ; 6DC4   0304 0099 0178 0313
        DECLE   $00B9,  $01B5,  $0064,  $0303   ; 6DC8   00B9 01B5 0064 0303
        DECLE   $0163,  $0073,  $026B,  $0318   ; 6DCC   0163 0073 026B 0318
        DECLE   $0334,  $00B5,  $0164,  $0099   ; 6DD0   0334 00B5 0164 0099
        DECLE   $030C,  $0163,  $0099,  $0318   ; 6DD4   030C 0163 0099 0318
        DECLE   $0334,  $0304,  $026B,  $0318   ; 6DD8   0334 0304 026B 0318
        DECLE   $00B9,  $02A5,  $006C,  $0299   ; 6DDC   00B9 02A5 006C 0299
        DECLE   $0334,  $00B5,  $02A5,  $0285   ; 6DE0   0334 00B5 02A5 0285
        DECLE   $0304,  $0199,  $026B,  $0303   ; 6DE4   0304 0199 026B 0303
        DECLE   $02EF,  $0369,  $0197,  $0301   ; 6DE8   02EF 0369 0197 0301
        DECLE   $009B,  $0238                   ; 6DEC   009B 0238

        SUBR    R4,     R1                      ; 6DEE   0121
        SUB@    R2,     R1                      ; 6DEF   0311
        MVI@    R1,     R7                      ; 6DF0   028F

        DECLE   $009B,  $0229,  $0301,  $029B   ; 6DF1   009B 0229 0301 029B
        DECLE   $0318,  $0229,  $009B,  $0221   ; 6DF5   0318 0229 009B 0221
        DECLE   $0021,  $0369,  $0197,  $0361   ; 6DF9   0021 0369 0197 0361
        DECLE   $00F7,  $01F7,  $0187,  $0229   ; 6DFD   00F7 01F7 0187 0229

        TSTR    R3                              ; 6E01   009B
        BNC     L_6C68                          ; 6E02   0229 019B
        BNC     L_6B0A                          ; 6E04   0229 02FB
        MOVR    R1,     R7                      ; 6E06   008F

        DECLE   $0301,  $0124,  $0371,  $0197   ; 6E07   0301 0124 0371 0197
        DECLE   $0311,  $0229,  $0221,  $0301   ; 6E0B   0311 0229 0221 0301
        DECLE   $0301,  $039C,  $001C,  $039C   ; 6E0F   0301 039C 001C 039C
        DECLE   $039C,  $038C,  $039C,  $039C   ; 6E13   039C 038C 039C 039C
        DECLE   $039C,  $039C,  $039C,  $039C   ; 6E17   039C 039C 039C 039C
        DECLE   $0001,  $039C,  $007C,  $0390   ; 6E1B   0001 039C 007C 0390
        DECLE   $039C,  $01DC,  $039C,  $021C   ; 6E1F   039C 01DC 039C 021C
        DECLE   $039C,  $001C,  $0005,  $039C   ; 6E23   039C 001C 0005 039C
        DECLE   $039C,  $039C,  $039C,  $019C   ; 6E27   039C 039C 039C 019C
        DECLE   $039C,  $039C,  $0398,  $039C   ; 6E2B   039C 039C 0398 039C
        DECLE   $039C,  $024D,  $038E,  $019C   ; 6E2F   039C 024D 038E 019C
        DECLE   $039C,  $039C,  $007C,  $0085   ; 6E33   039C 039C 007C 0085
        DECLE   $0390,  $039C,  $039C,  $0001   ; 6E37   0390 039C 039C 0001
        DECLE   $0380,  $039C,  $029C,  $039C   ; 6E3B   0380 039C 029C 039C
        DECLE   $039C,  $039C,  $007C,  $0180   ; 6E3F   039C 039C 007C 0180
        DECLE   $039C,  $039C,  $038C,  $039C   ; 6E43   039C 039C 038C 039C
        DECLE   $039C,  $039C,  $039C,  $0080   ; 6E47   039C 039C 039C 0080
        DECLE   $0390,  $039C,  $007C,  $0204   ; 6E4B   0390 039C 007C 0204
        DECLE   $039C,  $019C,  $039C,  $039C   ; 6E4F   039C 019C 039C 039C
        DECLE   $039C,  $038E,  $02FC,  $039F   ; 6E53   039C 038E 02FC 039F
        DECLE   $038C,  $0383,  $0382,  $001C   ; 6E57   038C 0383 0382 001C
        DECLE   $039C,  $039C,  $039C,  $018F   ; 6E5B   039C 039C 039C 018F

        AND@    R3,     R4                      ; 6E5F   039C
        SUBI    #$0339, R1                      ; 6E60   0339 0339
        AND     G_039C, R0                      ; 6E62   0380 039C
        MVI@    R3,     R0                      ; 6E64   0298
        ADD@    R5,     R3                      ; 6E65   02EB
        DECR    R4                              ; 6E66   0014
        AND@    R3,     R4                      ; 6E67   039C
        ADD@    R6,     R7                      ; 6E68   02F7

        SUBR    R2,     R4                      ; 6E69   0114
        MVI@    R1,     R3                      ; 6E6A   028B
        AND     G_009C, R0                      ; 6E6B   0380 009C
        SUB@    R5,     R0                      ; 6E6D   0328
        SUBI    #$0108, R1                      ; 6E6E   0339 0108
        AND@    R3,     R4                      ; 6E70   039C
        MVI     G_0328, R7                      ; 6E71   0287 0328

        SUB@    R3,     R1                      ; 6E73   0319
        SUBR    R0,     R4                      ; 6E74   0104
        MVI@    R1,     R3                      ; 6E75   028B
        SUBI    #$0119, R1                      ; 6E76   0339 0119
        SUBI    #$02EB, R1                      ; 6E78   0339 02EB
        SUBR    R2,     R4                      ; 6E7A   0114
        SUB@    R1,     R0                      ; 6E7B   0308
        AND@    R3,     R4                      ; 6E7C   039C
        AND@    R3,     R4                      ; 6E7D   039C
        ADDR    R7,     R4                      ; 6E7E   00FC
        MVI@    R2,     R7                      ; 6E7F   0297
        ADD@    R6,     R7                      ; 6E80   02F7
        MVI@    R2,     R7                      ; 6E81   0297

        SUB@    R5,     R0                      ; 6E82   0328
        SUBI    #$0287, R1                      ; 6E83   0339 0287
        ADD@    R5,     R3                      ; 6E85   02EB
        SUBR    R2,     R4                      ; 6E86   0114
        COMR    R1                              ; 6E87   0019
        MVI     G_0108, R7                      ; 6E88   0287 0108

        ADD@    R5,     R3                      ; 6E8A   02EB
        DECR    R4                              ; 6E8B   0014
        AND@    R3,     R4                      ; 6E8C   039C
        MVI     G_0328, R7                      ; 6E8D   0287 0328

        AND     G_0114, R0                      ; 6E8F   0380 0114
        SUBI    #$0019, R1                      ; 6E91   0339 0019
        AND@    R3,     R4                      ; 6E93   039C
        SUB@    R4,     R4                      ; 6E94   0324
        ADD@    R5,     R3                      ; 6E95   02EB
        DECR    R4                              ; 6E96   0014
        AND@    R3,     R4                      ; 6E97   039C
        AND@    R3,     R4                      ; 6E98   039C
        AND@    R3,     R4                      ; 6E99   039C
        CMPR    R4,     R4                      ; 6E9A   0164
        MVI@    R2,     R7                      ; 6E9B   0297

        SUBR    R3,     R1                      ; 6E9C   0119
        CMPR    R5,     R0                      ; 6E9D   0168
        MVI@    R2,     R7                      ; 6E9E   0297

        AND     .PSG1.chn_b_vol,R0              ; 6E9F   0380 00FC
        MVI@    R2,     R7                      ; 6EA1   0297

        INCR    R0                              ; 6EA2   0008
        AND@    R3,     R4                      ; 6EA3   039C
        MOVR    R3,     R4                      ; 6EA4   009C
        SUBI    #$0380, R1                      ; 6EA5   0339 0380
        AND@    R3,     R4                      ; 6EA7   039C
        SUB@    R4,     R4                      ; 6EA8   0324
        CMPR    R7,     R1                      ; 6EA9   0179
        MVI@    R2,     R7                      ; 6EAA   0297

        AND     .BTAB.EB,R0                     ; 6EAB   0380 02EB
        SUBR    R2,     R4                      ; 6EAD   0114
        SUBI    #$0008, R1                      ; 6EAE   0339 0008
        ADDR    R7,     R4                      ; 6EB0   00FC
        CMPR    R6,     R4                      ; 6EB1   0174
        MVI@    R2,     R7                      ; 6EB2   0297

        INCR    R0                              ; 6EB3   0008
        AND@    R3,     R4                      ; 6EB4   039C
        SUBR    R0,     R4                      ; 6EB5   0104
        MOVR    R0,     R2                      ; 6EB6   0082
        SUBR    R1,     R0                      ; 6EB7   0108
        SUBI    #$0339, R1                      ; 6EB8   0339 0339
        SUBR    R3,     R1                      ; 6EBA   0119
        SUB@    R1,     R0                      ; 6EBB   0308
        SUBR    R1,     R0                      ; 6EBC   0108
        SUBI    #$0339, R1                      ; 6EBD   0339 0339
        AND     G_039C, R0                      ; 6EBF   0380 039C
        AND@    R3,     R4                      ; 6EC1   039C
        SUBI    #$028B, R1                      ; 6EC2   0339 028B
        SUB@    R4,     R4                      ; 6EC4   0324
        SUBR    R3,     R1                      ; 6EC5   0119
        ADD@    R5,     R3                      ; 6EC6   02EB
        ADD@    R6,     R7                      ; 6EC7   02F7

        AND@    R3,     R4                      ; 6EC8   039C
        ADDI    #$0297, R4                      ; 6EC9   02FC 0297
        SUBR    R1,     R0                      ; 6ECB   0108
        ADD@    R5,     R3                      ; 6ECC   02EB
        ADD@    R6,     R7                      ; 6ECD   02F7
        ADD@    R6,     R7                      ; 6ECE   02F7

        SUB@    R2,     R4                      ; 6ECF   0314
        SUBR    R1,     R0                      ; 6ED0   0108
        ADD@    R5,     R3                      ; 6ED1   02EB
        ADD@    R6,     R7                      ; 6ED2   02F7
        MVI@    R2,     R7                      ; 6ED3   0297

        SUBI    #$0168, R1                      ; 6ED4   0339 0168
        MVI@    R2,     R7                      ; 6ED6   0297

        DECLE   $0380,  $039C,  $039C,  $009C   ; 6ED7   0380 039C 039C 009C
        DECLE   $0008,  $001C,  $0164,  $001F   ; 6EDB   0008 001C 0164 001F
        DECLE   $0104,  $039C,  $001C,  $0104   ; 6EDF   0104 039C 001C 0104
        DECLE   $039C,  $0080,  $0080,  $0388   ; 6EE3   039C 0080 0080 0388
        DECLE   $039C,  $001C,  $0104,  $001D   ; 6EE7   039C 001C 0104 001D
        DECLE   $0104,  $02FB,  $02FB,  $02FB   ; 6EEB   0104 02FB 02FB 02FB
        DECLE   $0190,  $001C,  $0144,  $001D   ; 6EEF   0190 001C 0144 001D
        DECLE   $0104,  $001C,  $0104,  $039C   ; 6EF3   0104 001C 0104 039C
        DECLE   $039C,  $039C,  $039C,  $039C   ; 6EF7   039C 039C 039C 039C
        DECLE   $001C,  $0104,  $039C,  $039C   ; 6EFB   001C 0104 039C 039C
        DECLE   $039C,  $0080,  $0388,  $039C   ; 6EFF   039C 0080 0388 039C
        DECLE   $039C,  $039C,  $039C,  $001C   ; 6F03   039C 039C 039C 001C
        DECLE   $0104,  $039C,  $0164,  $0078   ; 6F07   0104 039C 0164 0078
        DECLE   $0103,  $02BD,  $018D,  $0163   ; 6F0B   0103 02BD 018D 0163
        DECLE   $0013,  $0018,  $0019,  $001C   ; 6F0F   0013 0018 0019 001C
        DECLE   $001D,  $0020,  $0021,  $0025   ; 6F13   001D 0020 0021 0025
        DECLE   $000A,  $001B,  $001A,  $001F   ; 6F17   000A 001B 001A 001F
        DECLE   $001E,  $0023,  $0022,  $0024   ; 6F1B   001E 0023 0022 0024
        DECLE   $000A,  $0003,  $0003,  $00FF   ; 6F1F   000A 0003 0003 00FF
        DECLE   $0000,  $0000,  $0002,  $00FF   ; 6F23   0000 0000 0002 00FF
        DECLE   $00FF,  $00FF,  $0003,  $0003   ; 6F27   00FF 00FF 0003 0003
        DECLE   $00FF,  $0002,  $00FF,  $00FF   ; 6F2B   00FF 0002 00FF 00FF
        DECLE   $00FF,  $0004,  $0006,  $0005   ; 6F2F   00FF 0004 0006 0005
        DECLE   $0000,  $00FF,  $000C,  $000E   ; 6F33   0000 00FF 000C 000E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6F37   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; 6F3B   00FF

        EIS                                     ; 6F3C   0002
        INCR    R5                              ; 6F3D   000D
        INCR    R7                              ; 6F3E   000F

        DECLE   $00FF                           ; 6F3F   00FF
L_6F40:
        SETC                                    ; 6F40   0007
        DECLE   $0009,  $0008,  $0000,  $00FF   ; 6F41   0009 0008 0000 00FF
        DECLE   $0010,  $0012,  $00FF,  $00FF   ; 6F45   0010 0012 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0002   ; 6F49   00FF 00FF 00FF 0002
        DECLE   $0011,  $0013,  $00FF,  $002A   ; 6F4D   0011 0013 00FF 002A
        DECLE   $002C,  $00FF,  $00FF,  $00FF   ; 6F51   002C 00FF 00FF 00FF
        DECLE   $0035,  $0036,  $00FF           ; 6F55   0035 0036 00FF

        SWAP    R2,     2                       ; 6F58   0046
        ADCR    R1                              ; 6F59   0029
        ADCR    R0                              ; 6F5A   0028
        DECR    R6                              ; 6F5B   0016
L_6F5C:
        DECR    R7                              ; 6F5C   0017

        DECLE   $0001,  $0001,  $00FF,  $002B   ; 6F5D   0001 0001 00FF 002B
        DECLE   $002D,  $00FF,  $00FF,  $0022   ; 6F61   002D 00FF 00FF 0022
        DECLE   $001E,  $0022,  $00FF,  $0037   ; 6F65   001E 0022 00FF 0037
        DECLE   $0038,  $0039,  $003A,  $003B   ; 6F69   0038 0039 003A 003B
        DECLE   $003C,  $003D,  $00FF,  $00D1   ; 6F6D   003C 003D 00FF 00D1
        DECLE   $000E,  $0000,  $0002,  $00D9   ; 6F71   000E 0000 0002 00D9
        DECLE   $000E,  $0001,  $001E,  $0041   ; 6F75   000E 0001 001E 0041
        DECLE   $001A,  $0031,  $001A,  $0039   ; 6F79   001A 0031 001A 0039
        DECLE   $001A,  $0041,  $002E,  $0031   ; 6F7D   001A 0041 002E 0031
        DECLE   $002E,  $0039,  $002E,  $0000   ; 6F81   002E 0039 002E 0000
        DECLE   $0022,  $000D,  $0009,  $0011   ; 6F85   0022 000D 0009 0011
        DECLE   $001A,  $0019,  $001A,  $0021   ; 6F89   001A 0019 001A 0021
        DECLE   $001A,  $0029,  $001A,  $0011   ; 6F8D   001A 0029 001A 0011
        DECLE   $002E,  $0019,  $002E,  $0021   ; 6F91   002E 0019 002E 0021
        DECLE   $002E,  $0029,  $002E,  $0008   ; 6F95   002E 0029 002E 0008
        DECLE   $002A,  $00CE,  $002A,  $0061   ; 6F99   002A 00CE 002A 0061
        DECLE   $001A,  $00A1,  $001A,  $006D   ; 6F9D   001A 00A1 001A 006D
        DECLE   $0008,  $0075,  $000A,  $007D   ; 6FA1   0008 0075 000A 007D
        DECLE   $000A,  $0085,  $0008,  $008D   ; 6FA5   000A 0085 0008 008D
        DECLE   $0008,  $0095,  $000A,  $009D   ; 6FA9   0008 0095 000A 009D
        DECLE   $000A,  $00A5,  $0008,  $00AD   ; 6FAD   000A 00A5 0008 00AD
        DECLE   $0008,  $00B5,  $000A,  $00BD   ; 6FB1   0008 00B5 000A 00BD
        DECLE   $000A,  $00C5,  $0008,  $005D   ; 6FB5   000A 00C5 0008 005D
        DECLE   $0008,  $004D,  $0008,  $0015   ; 6FB9   0008 004D 0008 0015
        DECLE   $001F,  $001D,  $001F           ; 6FBD   001F 001D 001F

        ADDR    R5,     R0                      ; 6FC0   00E8
        ADCR    R2                              ; 6FC1   002A
        ADDR    R6,     R0                      ; 6FC2   00F0
        ADCR    R0                              ; 6FC3   0028
        MOVR    R3,     R4                      ; 6FC4   009C
        ADCR    R2                              ; 6FC5   002A
        MOVR    R2,     R4                      ; 6FC6   0094
        ADCR    R2                              ; 6FC7   002A
        TSTR    R4                              ; 6FC8   00A4
        ADCR    R2                              ; 6FC9   002A
        MOVR    R1,     R4                      ; 6FCA   008C
        ADCR    R2                              ; 6FCB   002A
        SLR     R0,     1                       ; 6FCC   0060
        INCR    R2                              ; 6FCD   000A
        SAR     R0,     1                       ; 6FCE   0068
        INCR    R2                              ; 6FCF   000A
        TSTR    R0                              ; 6FD0   0080
        INCR    R2                              ; 6FD1   000A
        MOVR    R1,     R0                      ; 6FD2   0088
        INCR    R2                              ; 6FD3   000A
        MOVR    R4,     R0                      ; 6FD4   00A0
        INCR    R2                              ; 6FD5   000A
        MOVR    R5,     R0                      ; 6FD6   00A8
        INCR    R2                              ; 6FD7   000A
        ADDR    R0,     R0                      ; 6FD8   00C0
        INCR    R2                              ; 6FD9   000A
        MOVR    R1,     R5                      ; 6FDA   008D
        INCR    R2                              ; 6FDB   000A
        TSTR    R5                              ; 6FDC   00AD
        INCR    R2                              ; 6FDD   000A
        SAR     R3,     2                       ; 6FDE   006F
        INCR    R2                              ; 6FDF   000A
        RRC     R3,     2                       ; 6FE0   0077
        INCR    R2                              ; 6FE1   000A
        MOVR    R1,     R7                      ; 6FE2   008F

        INCR    R2                              ; 6FE3   000A
        MOVR    R2,     R7                      ; 6FE4   0097

        INCR    R2                              ; 6FE5   000A
        MOVR    R5,     R7                      ; 6FE6   00AF

        DECLE   $000A,  $00B7,  $000A,  $004F   ; 6FE7   000A 00B7 000A 004F
        DECLE   $000A,  $0000                   ; 6FEB   000A 0000

        NEGR    R6                              ; 6FED   0026
        RRC     R1,     2                       ; 6FEE   0075
        ADCR    R6                              ; 6FEF   002E
        MOVR    R2,     R5                      ; 6FF0   0095
        ADCR    R6                              ; 6FF1   002E
        MOVR    R6,     R5                      ; 6FF2   00B5
        ADCR    R6                              ; 6FF3   002E
        SAR     R0,     1                       ; 6FF4   0068
        ADCR    R6                              ; 6FF5   002E
        MOVR    R1,     R0                      ; 6FF6   0088
        ADCR    R6                              ; 6FF7   002E
        MOVR    R5,     R0                      ; 6FF8   00A8
        ADCR    R6                              ; 6FF9   002E
        RLC     R1,     2                       ; 6FFA   0055
        COMR    R6                              ; 6FFB   001E
        INCR    R4                              ; 6FFC   000C
        INCR    R1                              ; 6FFD   0009
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5017       <entry>
;;  $505B       $505F  
;;  $5065       $5067  
;;  $506A       $506D  
;;  $5072       $508A  
;;  $508C       $5072  
;;  $509C       $50BD  
;;  $50A8       $50A3  
;;  $50B6       $50A1   $50A6  
;;  $50B8       $50B4  
;;  $50BF       $5090  
;;  $50C0       $507B  
;;  $50CA       $50E2  
;;  $50DF       $50CB   $50CF  
;;  $50E5       $507E  
;;  $50EA       $5143  
;;  $50F1       $50EE  
;;  $50F8       $50F5  
;;  $510A       $513C  
;;  $5128       $511D  
;;  $512E       $5124  
;;  $5136       $510B  
;;  $5139       $5134  
;;  $513B       $5137  
;;  $513E       $5100   $5106  
;;  $5146       $5075   $5081  
;;  $515C       $514A  
;;  $5171       $515D   $516C  
;;  $5172       $5158   $516E  
;;  $5173       $518C  
;;  $5188       $517D  
;;  $518F       $5183  
;;  $51A4       $51A0  
;;  $51A5       $51A3  
;;  $51AC       $51A6  
;;  $51AD       $519A   $51A9  
;;  $51B2       $519D  
;;  $51BB       $51D5  
;;  $51CE       $51D8  
;;  $51CF       $51CA  
;;  $51E0       $51D3  
;;  $51EF       $51FA  
;;  $520D       $5271  
;;  $525B       $5246  
;;  $525C       $525A  
;;  $526D       $5213   $5219  
;;  $527E       $52B4  
;;  $52AF       $528F  
;;  $52B6       $5282  
;;  $52C5       $52BD  
;;  $52DA       $52D2  
;;  $52F0       $52EB  
;;  $52F9       $5307  
;;  $5302       $52FC   $52FF  
;;  $531E       $5315  
;;  $5329       $52CB   $52E0  
;;  $532C       $535D  
;;  $533A       $5333  
;;  $5357       $5353  
;;  $535A       $5338  
;;  $5360       $51E5  
;;  $5364       $5362  
;;  $536A       $537B  
;;  $537E       $5335  
;;  $53AE       $5396  
;;  $53C2       $53BE  
;;  $53C3       $53C1  
;;  $53CE       $53A1  
;;  $53E1       $53E6  
;;  $53E8       $53D8  
;;  $53F0       $53EC  
;;  $53F7       $5403  
;;  $53FE       $5400  
;;  $5406       $52B6  
;;  $5411       $540D  
;;  $542D       $5426  
;;  $542E       $542C  
;;  $5446       $542A  
;;  $5459       $5456  
;;  $546F       $546B  
;;  $5498       $52ED  
;;  $54A5       $54A2  
;;  $54AD       $54A8   $54BC  
;;  $54BA       $54AF  
;;  $54BF       $5481  
;;  $54CC       $54F7  
;;  $54FB       $54C2  
;;  $5501       $5504  
;;  $5506       $54F9  
;;  $5508       $5346   $541B  
;;  $550B       $550D  
;;  $550F       $5509  
;;  $5510       $563D   $56B4   $57E1   $5AF7   $5D30   $63F4  
;;  $5513       $5671   $56D7   $579E   $5966   $5A66   $61D7   $63EF   $640B  
;;  $5514       $5512  
;;  $5517       $551D   $5525  
;;  $5520       $5519  
;;  $5527       $563A  
;;  $552A       $5AFF   $5B4E   $5D41   $5D48   $62F3  
;;  $552C       $555A   $596B   $5E14   $6075   $6311   $63DD  
;;  $552D       $552B  
;;  $5538       $5550  
;;  $5553       $5937   $594C  
;;  $556A       $5B13   $6435  
;;  $556C       $56C8   $58E7   $5B6C   $5B7F   $5D77   $6326   $660D  
;;  $556D       $556B  
;;  $556E       $5597  
;;  $559A       $5570   $5580   $55A0  
;;  $55A3       $55C0   $6183   $618D  
;;  $55BA       $55B7  
;;  $55BD       $6335   $638C  
;;  $55E9       $5825  
;;  $55EB       $581E   $5918  
;;  $55F0       $581A   $5910   $61A8   $671A   $677D  
;;  $55FE       $5E3A   $63A3  
;;  $5634       $5632  
;;  $5639       $5667   $56B1  
;;  $5666       $506F  
;;  $56AE       $574D  
;;  $56DC       $5ADF  
;;  $56E1       $56ED  
;;  $56EF       $56E6  
;;  $56F3       $56FA  
;;  $56F9       $56F6  
;;  $570E       $5714  
;;  $571A       $56FD   $5704  
;;  $572C       $572A  
;;  $572F       $572D  
;;  $5750       $5746  
;;  $5768       $5758  
;;  $577B       $5777  
;;  $578B       $577C  
;;  $5795       $578C  
;;  $57B5       $57B1  
;;  $57E8       $5BBF  
;;  $57E9       $5944   $5AE6  
;;  $57F0       $57EE  
;;  $57F5       $574B   $5754   $5761   $5770   $57B9   $57BF   $57C7   $57CD  
;;  $57F5       $57FC   $5802   $580A   $580F   $5830   $5838   $584A   $5ADA  
;;  $57FE       $57F3  
;;  $5825       $5815  
;;  $582D       $5808  
;;  $583A       $5833  
;;  $5848       $5843  
;;  $5851       $5829   $620B   $63AF  
;;  $5857       $595B   $5989  
;;  $5858       $6090  
;;  $5859       $5822   $6391  
;;  $5866       $5861  
;;  $5874       $5871  
;;  $5879       $58DC   $5971   $5B36   $5D39  
;;  $589B       $5889  
;;  $58AE       $5899  
;;  $58B2       $5882   $5885   $58CF   $58D7   $597A   $5980  
;;  $58B9       $58D2   $5D59  
;;  $58BC       $58C2  
;;  $58C5       $58BE  
;;  $58C8       $57DE   $60EE  
;;  $590E       $5925  
;;  $591C       $5904  
;;  $5927       $56D1  
;;  $5947       $592C   $61DF  
;;  $59A0       $5999  
;;  $59AA       $59AC  
;;  $59CA       $59DC  
;;  $59D9       $59D1  
;;  $59DA       $59D7  
;;  $5A44       $5A42  
;;  $5A63       $5A4B  
;;  $5A6A       $5A70   $5A8B   $5AD2  
;;  $5A82       $5A98  
;;  $5A85       $5A80  
;;  $5A95       $5A87  
;;  $5AB9       $5AB1  
;;  $5AE2       $5A93  
;;  $5AE9       $5A63   $5A90  
;;  $5B3C       $56CD   $5AC7   $5B18  
;;  $5B42       $5B1F   $5B27   $5E2A   $6616  
;;  $5B49       $56D4   $5AC2  
;;  $5B85       $598F   $6097   $64C0  
;;  $5B86       $5B89  
;;  $5B9B       $5BB7  
;;  $5BB6       $5BB2  
;;  $5BC3       $59DE  
;;  $5BD0       $5798   $5A56   $5B60   $5C1A  
;;  $5BD1       $5765  
;;  $5BFC       $5BF6  
;;  $5C01       $5BE2  
;;  $5C15       $64B3  
;;  $5C1E       $579B   $5A59   $5B63  
;;  $5C1F       $5C1D   $6230   $625D  
;;  $5C38       $5C26   $5C33  
;;  $5C4B       $5C47  
;;  $5C61       $5C54  
;;  $5C66       $5C3C  
;;  $5C74       $5C69   $5C6D  
;;  $5C76       $5C74  
;;  $5C7B       $5C79   $5CED  
;;  $5C90       $5C8A  
;;  $5CA4       $5CA8  
;;  $5CA5       $5C76   $5CDF  
;;  $5CC5       $5C22   $5C97   $5CCA   $5CD3   $5CDD   $5CE3  
;;  $5CC6       $52F3  
;;  $5CED       $5CE9  
;;  $5D12       $5D17  
;;  $5D1C       $5D02  
;;  $5D28       $5CF6   $5CFC   $5D06   $5D1A  
;;  $5D2B       $5D23  
;;  $5D2C       $5D25   $6765  
;;  $5D2D       $5982  
;;  $5D50       $5DBE  
;;  $5D59       $5D6E  
;;  $5D70       $5D69  
;;  $5D7A       $5D55   $5D5E   $5D65   $5D9B   $5DAE  
;;  $5D8F       $5D89  
;;  $5D96       $5D8D  
;;  $5DB7       $60C5  
;;  $5DC5       $5DD3   $5DDC  
;;  $5DDF       $5DC7  
;;  $5E02       $5DF9  
;;  $5E17       $5E11  
;;  $5E31       $5DFE   $5E0D  
;;  $5E39       $5E2F   $5E33  
;;  $5E4A       $5E51  
;;  $5E53       $5E6F  
;;  $5E58       $5E00  
;;  $5E6B       $5E4D  
;;  $5E89       $5E82  
;;  $5EA1       $5ED7   $5EDB  
;;  $5EAB       $5EB2  
;;  $5EB4       $5EDF  
;;  $5EC3       $5EBF  
;;  $5ED9       $5ED4  
;;  $5EDD       $5EAE  
;;  $5EE1       $5E87   $5ED1  
;;  $5EF7       $5F6C  
;;  $5EFE       $5F03  
;;  $5F05       $5EFF  
;;  $5F0F       $5F14  
;;  $5F16       $5F10  
;;  $5F23       $5F5D  
;;  $5F2A       $5F24  
;;  $5F32       $5F2C  
;;  $5F34       $5F30  
;;  $5F3A       $5F34  
;;  $5F42       $5F3C  
;;  $5F44       $5F40  
;;  $5F5A       $5F28   $5F38   $5F44  
;;  $5F6B       $5F68  
;;  $5F7F       $5F75   $5F7A  
;;  $5F8F       $5E75  
;;  $5F9E       $5E84   $5E91  
;;  $5FA5       $5E53   $5F52  
;;  $5FB7       $5FB2  
;;  $5FD7       $5FD5  
;;  $5FDD       $5FDB  
;;  $5FDE       $5FDC  
;;  $5FE5       $5FE5  
;;  $5FFA       $6056  
;;  $6004       $592F   $5A8D   $5A9A   $61D4   $620E   $63B2  
;;  $6005       $5FFF   $602E  
;;  $6008       $608C   $60AC   $60CB   $6104   $614B  
;;  $601A       $6014  
;;  $601F       $6018   $601B  
;;  $6021       $600A  
;;  $603B       $5DCF   $5DD8   $5DE6   $5DED   $5DF3   $5E37   $5E8F   $5F8A  
;;  $603B       $5FFC   $6036   $604E   $60FD   $61E4   $61FB   $6235   $624D  
;;  $6047       $603D   $6041  
;;  $605D       $6052  
;;  $6061       $605B  
;;  $606E       $6049  
;;  $6073       $63E3  
;;  $6074       $60D8   $6178  
;;  $607B       $609F   $60B4  
;;  $608B       $6086  
;;  $60AA       $60A4  
;;  $60B0       $606A  
;;  $60BA       $606C  
;;  $60BD       $60B6  
;;  $60CA       $60BE  
;;  $60CE       $60C8  
;;  $60F1       $60DE   $60E6   $60EC  
;;  $6116       $6111  
;;  $611F       $6117   $611C  
;;  $6138       $612A  
;;  $6140       $6136  
;;  $6147       $6130   $613C  
;;  $6148       $6127  
;;  $614D       $6196  
;;  $6168       $5D83   $5D93   $5DA3   $5DA8  
;;  $617C       $616B   $6173  
;;  $6196       $60F6  
;;  $619B       $6193  
;;  $61B9       $61B3  
;;  $61C3       $6002   $6030  
;;  $61C8       $593A   $61D1  
;;  $61D1       $602B   $60D5   $60FA   $6124  
;;  $61FE       $61F0   $6241  
;;  $61FF       $61FD  
;;  $6228       $6223  
;;  $6230       $622B  
;;  $626D       $626B  
;;  $627E       $627C  
;;  $628A       $6288  
;;  $629B       $6299  
;;  $62BF       $62BD  
;;  $62C0       $62BE  
;;  $62C1       $62BF  
;;  $62C2       $62C0  
;;  $62E4       $63D0  
;;  $62E5       $61ED  
;;  $62F6       $61EA   $6206   $623E   $6254  
;;  $6308       $62FE  
;;  $6309       $630E   $6319   $631E   $6356   $63AB   $63BB   $63D4   $63D7  
;;  $6315       $6225  
;;  $6316       $61F6   $6248   $6314  
;;  $6347       $6213   $6259   $63B7  
;;  $6359       $622D  
;;  $635A       $6358   $63D9  
;;  $635C       $639A  
;;  $636E       $6373  
;;  $6394       $6370  
;;  $63E2       $5A82   $63E0  
;;  $63F4       $63ED  
;;  $63F9       $5A60  
;;  $6400       $5ADC  
;;  $6455       $642A  
;;  $6466       $645C  
;;  $646A       $6453  
;;  $646D       $6463  
;;  $646E       $646C   $6498  
;;  $6474       $648A   $648F  
;;  $6492       $6445   $6455  
;;  $649A       $5484  
;;  $64AE       $64A3  
;;  $64B6       $64B1  
;;  $64BB       $566E   $5B04   $5B5D  
;;  $64C3       $64C6  
;;  $64D3       $64DF  
;;  $64EC       $64D5  
;;  $64ED       $64AC   $64B9  
;;  $6506       $64FA   $650A  
;;  $650C       $64F3   $6507  
;;  $652B       $652D  
;;  $6549       $6546  
;;  $6550       $6541  
;;  $656B       $655D  
;;  $6595       $6591  
;;  $6619       $65E6   $65F1   $6600  
;;  $661A       $654A   $6560  
;;  $6627       $6621  
;;  $662E       $654D   $6568   $6630  
;;  $6634       $65C5  
;;  $663A       $664D  
;;  $664F       $663C   $6645  
;;  $6651       $653E   $6558   $657A   $657D   $6580   $6583   $6595   $6598  
;;  $6651       $659B   $659E   $65AD   $65B0   $65B3   $65C2  
;;  $6666       $66B6   $66B9  
;;  $6671       $6668  
;;  $6672       $666F  
;;  $66AA       $6686   $668A   $668F  
;;  $66AE       $6677  
;;  $66AF       $667C   $66AC  
;;  $66B8       $66B3  
;;  $66BB       $6673  
;;  $66C3       $66E1  
;;  $66DD       $66C4   $66C8   $66D2  
;;  $66E4       $665F  
;;  $66E8       $5DC0  
;;  $66E9       $5845  
;;  $66F6       $66F0  
;;  $66FE       $66F4   $66F9  
;;  $670F       $57DB   $583D   $5896  
;;  $6718       $6713  
;;  $671E       $6716  
;;  $6726       $57D8   $583A   $5893  
;;  $6768       $675D   $6763  
;;  $6771       $676D  
;;  $6789       $6757  
;;  $678B       $6783  
;;  $679D       $6750  
;;  $67A4       $66FF  
;;  $67A5       $6790   $6798  
;;  $67B0       $67AA   $67AC  
;;  $67B7       $67B4  
;;  $67B9       $5B31  
;;  $67BA       $6709  
;;  $67EA       $60E0  
;;  $67EB       $5D96   $5DB0   $5F8C  
;;  $67FE       $56AE  
;;  $67FF       $5B82  
;;  $6805       $5955  
;;  $6818       $5F7C  
;;  $682A       $5B39  
;;  $6832       <entry>
;;  $6838       $6078  
;;  $6861       $6866  
;;  $6862       $685F  
;;  $6868       $63BF  
;;  $6875       $5A5C   $61FF   $624F  
;;  $6876       $57A2   $6344  
;;  $6884       $5974  
;;  $6885       $57E5   $609A  
;;  $6894       $5D2D  
;;  $6895       $56AA  
;;  $68AD       $67C3   $67D7  
;;  $68AE       $5876   $67E7  
;;  $68B4       $68B0  
;;  $68C1       $68C7  
;;  $68CA       $68B2  
;;  $68CB       $67BA   $67CE   $67DE  
;;  $68DA       $68D3  
;;  $68DC       $68D0   $68D7  
;;  $693B       $6939  
;;  $698C       $690B  
;;  $69A2       $6921  
;;  $6ACA       $6AC8  
;;  $6B0A       $6E04  
;;  $6C68       $6E02  
;;  $6F40       $6F3E  
;;  $6F5C       $6F5C  
;; ======================================================================== ;;
