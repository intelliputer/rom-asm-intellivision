
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  End of timer table

        BIDECLE $5000           ; 5002  Ptr: EXEC timer table
        BIDECLE $5017           ; 5004  Ptr: Start of game
        BIDECLE $500F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500F           ; 500A  Ptr: Date/Title
        DECLE   $0082           ; 500C  Key-click / flags
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
        MVII    #$5323, R0                      ; 5019   02B8 0023 0053
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02F6, R6                      ; 5021   02BE 02F6
        MVI     G_02F0, R3                      ; 5023   0283 02F0
        MVII    #$00F6, R0                      ; 5025   02B8 00F6
        MVII    #$0200, R4                      ; 5027   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5029   0004 0114 0338

        MVO     R3,     G_02F0                  ; 502C   0243 02F0
        MVII    #$0324, R4                      ; 502E   02BC 0324
        MVII    #$0047, R0                      ; 5030   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; 5032   0004 0114 0338

        MVII    #$0102, R4                      ; 5035   02BC 0102
        MVII    #$00EE, R0                      ; 5037   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 5039   0004 0114 0338

        SDBD                                    ; 503C   0001
        MVII    #$538D, R0                      ; 503D   02B8 008D 0053
        MVO     R0,     G_035D                  ; 5040   0240 035D
        CLRR    R0                              ; 5042   01C0
        DECR    R0                              ; 5043   0010
        MVO     R0,     G_035E                  ; 5044   0240 035E
        NEGR    R0                              ; 5046   0020
        MVO     R0,     G_0147                  ; 5047   0240 0147
        INCR    R0                              ; 5049   0008
        MVO     R0,     G_010F                  ; 504A   0240 010F
        INCR    R0                              ; 504C   0008
        MVO     R0,     G_010C                  ; 504D   0240 010C
        MVII    #$0008, R2                      ; 504F   02BA 0008
        SWAP    R2,     1                       ; 5051   0042
        MVII    #$0008, R1                      ; 5052   02B9 0008
        SDBD                                    ; 5054   0001
        MVII    #$5373, R4                      ; 5055   02BC 0073 0053
        MVII    #$0334, R5                      ; 5058   02BD 0334
L_505A:
        MVI@    R4,     R0                      ; 505A   02A0
        XORR    R2,     R0                      ; 505B   01D0
        MVO@    R0,     R5                      ; 505C   0268
        DECR    R1                              ; 505D   0011
        BNEQ    L_505A                          ; 505E   022C 0005

        SDBD                                    ; 5060   0001
        MVII    #$3800, R4                      ; 5061   02BC 0000 0038
        MVII    #$00FF, R0                      ; 5064   02B8 00FF
        MVII    #$0008, R2                      ; 5066   02BA 0008
L_5068:
        MVO@    R0,     R4                      ; 5068   0260
        DECR    R2                              ; 5069   0012
        BNEQ    L_5068                          ; 506A   022C 0003

        EIS                                     ; 506C   0002
L_506D:
        MVI     G_010F, R0                      ; 506D   0280 010F
        TSTR    R0                              ; 506F   0080
        BNEQ    L_506D                          ; 5070   022C 0004

        MVO     R0,     G_017C                  ; 5072   0240 017C
        INCR    R0                              ; 5074   0008
        MVO     R0,     G_0177                  ; 5075   0240 0177

        JSR     R5,     L_5D8E                  ; 5077   0004 015C 018E

        MVII    #$0219, R4                      ; 507A   02BC 0219
        MVII    #$0002, R3                      ; 507C   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 507E   0004 0118 007B
        STRING  "DRAGONFIRE"                    ; 5081  
        DECLE   $0000                           ; 508B   0000

        SDBD                                    ; 508C   0001
        MVII    #$0EF4, R3                      ; 508D   02BB 00F4 000E
        MVII    #$02E0, R4                      ; 5090   02BC 02E0
        MVO@    R3,     R4                      ; 5092   0263
        SDBD                                    ; 5093   0001
        MVII    #$0604, R3                      ; 5094   02BB 0004 0006

        JSR     R5,     X_PRINT_R5              ; 5097   0004 0118 007B
        STRING  "1982 IMAGIC"                   ; 509A  
        DECLE   $0000                           ; 50A5   0000
L_50A6:
        MVI     G_010E, R0                      ; 50A6   0280 010E
        TSTR    R0                              ; 50A8   0080
        BNEQ    L_50D8                          ; 50A9   020C 002D

        MVII    #$0003, R0                      ; 50AB   02B8 0003
        MVO     R0,     G_010E                  ; 50AD   0240 010E
        SDBD                                    ; 50AF   0001
        MVII    #$537B, R4                      ; 50B0   02BC 007B 0053
        MVII    #$015D, R3                      ; 50B3   02BB 015D
L_50B5:
        MVI@    R3,     R0                      ; 50B5   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 50B6   0004 0114 0268

        TSTR    R0                              ; 50B9   0080
        BMI     L_50CF                          ; 50BA   020B 0013
        BEQ     L_50C1                          ; 50BC   0204 0003

        DECR    R0                              ; 50BE   0010
        BNEQ    L_50CF                          ; 50BF   020C 000E

L_50C1:
        MVI@    R4,     R0                      ; 50C1   02A0
        MVO@    R0,     R3                      ; 50C2   0258
        PSHR    R4                              ; 50C3   0274
        PSHR    R3                              ; 50C4   0273
        SDBD                                    ; 50C5   0001
        MVII    #$50CB, R5                      ; 50C6   02BD 00CB 0050
        SDBD                                    ; 50C9   0001
        MVI@    R4,     R7                      ; 50CA   02A7

        PULR    R3                              ; 50CB   02B3
        PULR    R4                              ; 50CC   02B4
        B       L_50D1                          ; 50CD   0200 0002

L_50CF:
        MVO@    R0,     R3                      ; 50CF   0258
        INCR    R4                              ; 50D0   000C
L_50D1:
        INCR    R3                              ; 50D1   000B
        ADDI    #$0002, R4                      ; 50D2   02FC 0002
        CMPI    #$0163, R3                      ; 50D4   037B 0163
        BLT     L_50B5                          ; 50D6   0225 0022

L_50D8:
        CLRR    R1                              ; 50D8   01C9
        DIS                                     ; 50D9   0003
        MVI     G_010D, R2                      ; 50DA   0282 010D
        MVO     R1,     G_010D                  ; 50DC   0241 010D
        EIS                                     ; 50DE   0002
        MVII    #$033C, R3                      ; 50DF   02BB 033C
L_50E1:
        RRC     R2,     1                       ; 50E1   0072
        BNC     L_50F6                          ; 50E2   0209 0012

        MVI@    R3,     R4                      ; 50E4   029C
        TSTR    R4                              ; 50E5   00A4
        BEQ     L_50F6                          ; 50E6   0204 000E

        ADDI    #$0000, R4                      ; 50E8   02FC 0000
        SDBD                                    ; 50EA   0001
        MVII    #$50F4, R5                      ; 50EB   02BD 00F4 0050
        PSHR    R2                              ; 50EE   0272
        PSHR    R3                              ; 50EF   0273
        SUBI    #$033C, R3                      ; 50F0   033B 033C
        SDBD                                    ; 50F2   0001
        MVI@    R4,     R7                      ; 50F3   02A7

        PULR    R3                              ; 50F4   02B3
        PULR    R2                              ; 50F5   02B2
L_50F6:
        INCR    R3                              ; 50F6   000B
        CMPI    #$0343, R3                      ; 50F7   037B 0343
        BLE     L_50E1                          ; 50F9   0226 0019

        MVII    #$0354, R3                      ; 50FB   02BB 0354
        MVII    #$0324, R2                      ; 50FD   02BA 0324
L_50FF:
        CLRR    R5                              ; 50FF   01ED
        MVI@    R2,     R0                      ; 5100   0290
        ANDI    #$0100, R0                      ; 5101   03B8 0100
        BNEQ    L_5106                          ; 5103   020C 0001

        INCR    R5                              ; 5105   000D
L_5106:
        ADDI    #$0018, R2                      ; 5106   02FA 0018
        MVI@    R2,     R4                      ; 5108   0294
        TSTR    R4                              ; 5109   00A4
        BNEQ    L_510D                          ; 510A   020C 0001

        INCR    R5                              ; 510C   000D
L_510D:
        CLRR    R1                              ; 510D   01C9
        MVII    #$03FF, R0                      ; 510E   02B8 03FF
        DIS                                     ; 5110   0003
        AND@    R3,     R0                      ; 5111   0398
        MVO@    R1,     R3                      ; 5112   0259
        EIS                                     ; 5113   0002
        TSTR    R5                              ; 5114   00AD
        BNEQ    L_5153                          ; 5115   020C 003C

        ADDI    #$0005, R4                      ; 5117   02FC 0005
        MVI@    R4,     R1                      ; 5119   02A1
        ANDR    R1,     R0                      ; 511A   0188
        BEQ     L_5153                          ; 511B   0204 0036

        MVII    #$000A, R5                      ; 511D   02BD 000A
L_511F:
        SARC    R0,     1                       ; 511F   0078
        BNC     L_514B                          ; 5120   0209 0029

        SLR     R1,     1                       ; 5122   0061
        PSHR    R5                              ; 5123   0275
        PSHR    R4                              ; 5124   0274
        PSHR    R3                              ; 5125   0273
        NOP                                     ; 5126   0034
        PSHR    R2                              ; 5127   0272
        PSHR    R1                              ; 5128   0271
        PSHR    R0                              ; 5129   0270
        SUBI    #$033C, R2                      ; 512A   033A 033C
        NEGR    R5                              ; 512C   0025
        MOVR    R5,     R1                      ; 512D   00A9
        ADDI    #$000A, R1                      ; 512E   02F9 000A
        CMPI    #$0007, R1                      ; 5130   0379 0007
        BGT     L_513D                          ; 5132   020E 0009

        ADDI    #$0324, R1                      ; 5134   02F9 0324
        MVI@    R1,     R0                      ; 5136   0288
        ANDI    #$0100, R0                      ; 5137   03B8 0100
        BEQ     L_5143                          ; 5139   0204 0008

        SUBI    #$0324, R1                      ; 513B   0339 0324
L_513D:
        SDBD                                    ; 513D   0001
        MVII    #$5143, R5                      ; 513E   02BD 0043 0051
        SDBD                                    ; 5141   0001
        MVI@    R4,     R7                      ; 5142   02A7

L_5143:
        PULR    R0                              ; 5143   02B0
        PULR    R1                              ; 5144   02B1
        PULR    R2                              ; 5145   02B2
        PULR    R3                              ; 5146   02B3
        PULR    R4                              ; 5147   02B4
        PULR    R5                              ; 5148   02B5
        B       L_514E                          ; 5149   0200 0003

L_514B:
        SARC    R1,     1                       ; 514B   0079
        BNC     L_5150                          ; 514C   0209 0002

L_514E:
        ADDI    #$0002, R4                      ; 514E   02FC 0002
L_5150:
        DECR    R5                              ; 5150   0015
        BNEQ    L_511F                          ; 5151   022C 0033

L_5153:
        SUBI    #$0017, R2                      ; 5153   033A 0017
        INCR    R3                              ; 5155   000B
        CMPI    #$035C, R3                      ; 5156   037B 035C
        BLT     L_50FF                          ; 5158   0225 005A

        MVI     G_0110, R0                      ; 515A   0280 0110
        RRC     R0,     1                       ; 515C   0070
        BC      L_51A9                          ; 515D   0201 004A

        SETC                                    ; 515F   0007
        RLC     R0,     1                       ; 5160   0050
        MVO     R0,     G_0110                  ; 5161   0240 0110
        MVII    #$0344, R2                      ; 5163   02BA 0344
        MVII    #$033C, R4                      ; 5165   02BC 033C
        MVII    #$0004, R1                      ; 5167   02B9 0004
        MVII    #$0008, R0                      ; 5169   02B8 0008
L_516B:
        MVI@    R2,     R3                      ; 516B   0293
        PSHR    R2                              ; 516C   0272
        MVI@    R4,     R2                      ; 516D   02A2
        TSTR    R2                              ; 516E   0092
        BEQ     L_51A1                          ; 516F   0204 0030

        ADDR    R1,     R2                      ; 5171   00CA
        MVI@    R2,     R2                      ; 5172   0292
        PSHR    R0                              ; 5173   0270
        PSHR    R1                              ; 5174   0271
        DECR    R2                              ; 5175   0012
        MOVR    R3,     R1                      ; 5176   0099
        ANDI    #$000F, R1                      ; 5177   03B9 000F
        MOVR    R3,     R0                      ; 5179   0098
        SWAP    R0,     1                       ; 517A   0040
        ANDI    #$003E, R0                      ; 517B   03B8 003E
        SLR     R0,     1                       ; 517D   0060
        TSTR    R0                              ; 517E   0080
        BEQ     L_5192                          ; 517F   0204 0011

        DECR    R0                              ; 5181   0010
        BNEQ    L_5197                          ; 5182   020C 0013

        TSTR    R3                              ; 5184   009B
        BPL     L_5189                          ; 5185   0203 0002

        DECR    R1                              ; 5187   0011
        INCR    R7                              ; 5188   000F

L_5189:
        INCR    R1                              ; 5189   0009
L_518A:
        TSTR    R1                              ; 518A   0089
        BMI     L_5191                          ; 518B   020B 0004

        CMPR    R2,     R1                      ; 518D   0151
        BLE     L_5192                          ; 518E   0206 0002

        CLRR    R2                              ; 5190   01D2
L_5191:
        MOVR    R2,     R1                      ; 5191   0091
L_5192:
        MOVR    R3,     R0                      ; 5192   0098
        ANDI    #$01F0, R0                      ; 5193   03B8 01F0
        SLR     R0,     2                       ; 5195   0064
        SLR     R0,     2                       ; 5196   0064
L_5197:
        SDBD                                    ; 5197   0001
        ANDI    #$81F0, R3                      ; 5198   03BB 00F0 0081
        SWAP    R0,     1                       ; 519B   0040
        SLL     R0,     1                       ; 519C   0048
        XORR    R0,     R3                      ; 519D   01C3
        XORR    R1,     R3                      ; 519E   01CB
        PULR    R1                              ; 519F   02B1
        PULR    R0                              ; 51A0   02B0
L_51A1:
        PULR    R2                              ; 51A1   02B2
        MVO@    R3,     R2                      ; 51A2   0253
        INCR    R2                              ; 51A3   000A
        DECR    R0                              ; 51A4   0010
        BNEQ    L_516B                          ; 51A5   022C 003B
        B       L_51B0                          ; 51A7   0200 0007

L_51A9:
        RRC     R0,     1                       ; 51A9   0070
        BC      L_51B0                          ; 51AA   0201 0004

        MVII    #$0003, R0                      ; 51AC   02B8 0003
        MVO     R0,     G_0110                  ; 51AE   0240 0110

L_51B0:
        JSR     R5,     .EXEC.4F1               ; 51B0   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 51B3   0004 0118 02AD

        B       L_50A6                          ; 51B6   0220 0111

L_51B8:
        MVI     .STIC.BORD,R0                   ; 51B8   0280 002C
        MVO     R0,     G_016B                  ; 51BA   0240 016B
        MVO     R1,     .STIC.BORD              ; 51BC   0241 002C
        MVII    #$0081, R1                      ; 51BE   02B9 0081
        MVO     R1,     G_0102                  ; 51C0   0241 0102
        PULR    R7                              ; 51C2   02B7

        PSHR    R5                              ; 51C3   0275
        MVI     G_0103, R0                      ; 51C4   0280 0103
        TSTR    R0                              ; 51C6   0080
        BEQ     L_51CC                          ; 51C7   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 51C9   0240 0020
L_51CB:
        PULR    R7                              ; 51CB   02B7

L_51CC:
        MVI     G_0102, R1                      ; 51CC   0281 0102
        SUBI    #$0080, R1                      ; 51CE   0339 0080
        BMI     L_51DD                          ; 51D0   020B 000B
        BEQ     L_51B8                          ; 51D2   0224 001B

        DECR    R1                              ; 51D4   0011
        BEQ     L_51CB                          ; 51D5   0224 000B

        MVI     G_016B, R1                      ; 51D7   0281 016B
        MVO     R1,     .STIC.BORD              ; 51D9   0241 002C
        MVO     R0,     G_0102                  ; 51DB   0240 0102
L_51DD:
        MVO     R0,     .STIC.VIDEN             ; 51DD   0240 0020
        INCR    R0                              ; 51DF   0008
        MVO     R0,     G_0103                  ; 51E0   0240 0103
        MVII    #$0324, R4                      ; 51E2   02BC 0324
        CLRR    R5                              ; 51E4   01ED
        MVII    #$0003, R1                      ; 51E5   02B9 0003
L_51E7:
        MVI@    R4,     R0                      ; 51E7   02A0
        MVO@    R0,     R5                      ; 51E8   0268
        MVI@    R4,     R0                      ; 51E9   02A0
        MVO@    R0,     R5                      ; 51EA   0268
        MVI@    R4,     R0                      ; 51EB   02A0
        MVO@    R0,     R5                      ; 51EC   0268
        MVI@    R4,     R0                      ; 51ED   02A0
        MVO@    R0,     R5                      ; 51EE   0268
        MVI@    R4,     R0                      ; 51EF   02A0
        MVO@    R0,     R5                      ; 51F0   0268
        MVI@    R4,     R0                      ; 51F1   02A0
        MVO@    R0,     R5                      ; 51F2   0268
        MVI@    R4,     R0                      ; 51F3   02A0
        MVO@    R0,     R5                      ; 51F4   0268
        MVI@    R4,     R0                      ; 51F5   02A0
        MVO@    R0,     R5                      ; 51F6   0268
        DECR    R1                              ; 51F7   0011
        BNEQ    L_51E7                          ; 51F8   022C 0012

        MVI     G_0177, R3                      ; 51FA   0283 0177
        DECR    R3                              ; 51FC   0013
        MVO     R3,     G_0177                  ; 51FD   0243 0177
        MVII    #$0354, R3                      ; 51FF   02BB 0354
        MVII    #$0018, R2                      ; 5201   02BA 0018
        CLRR    R5                              ; 5203   01ED
        MVII    #$0008, R4                      ; 5204   02BC 0008
L_5206:
        MVI@    R2,     R0                      ; 5206   0290
        MVO@    R5,     R2                      ; 5207   0255
        MVI@    R3,     R1                      ; 5208   0299
        COMR    R0                              ; 5209   0018
        ANDR    R0,     R1                      ; 520A   0181
        COMR    R0                              ; 520B   0018
        XORR    R0,     R1                      ; 520C   01C1
        MVO@    R1,     R3                      ; 520D   0259
        INCR    R2                              ; 520E   000A
        INCR    R3                              ; 520F   000B
        DECR    R4                              ; 5210   0014
        BNEQ    L_5206                          ; 5211   022C 000C

        MVI     G_0104, R2                      ; 5213   0282 0104
        SLL     R2,     1                       ; 5215   004A
        MVII    #$0344, R4                      ; 5216   02BC 0344
        MVII    #$033C, R5                      ; 5218   02BD 033C
        ADDR    R2,     R4                      ; 521A   00D4
        ADDR    R2,     R5                      ; 521B   00D5
L_521C:
        MVI@    R4,     R3                      ; 521C   02A3
        ANDI    #$000F, R3                      ; 521D   03BB 000F
        PSHR    R4                              ; 521F   0274
        MVI@    R5,     R4                      ; 5220   02AC
        TSTR    R4                              ; 5221   00A4
        BEQ     L_527C                          ; 5222   0204 0058

        MVII    #$0163, R1                      ; 5224   02B9 0163
        ADDR    R2,     R1                      ; 5226   00D1
        CMP@    R1,     R3                      ; 5227   034B
        BEQ     L_527C                          ; 5228   0204 0052

        MVO@    R3,     R1                      ; 522A   024B
        PSHR    R5                              ; 522B   0275
        MVII    #$0324, R1                      ; 522C   02B9 0324
        ADDR    R2,     R1                      ; 522E   00D1
        MVI@    R1,     R0                      ; 522F   0288
        PSHR    R1                              ; 5230   0271
        MOVR    R0,     R1                      ; 5231   0081
        SDBD                                    ; 5232   0001
        ANDI    #$FDFF, R0                      ; 5233   03B8 00FF 00FD
        SDBD                                    ; 5236   0001
        ANDI    #$0800, R1                      ; 5237   03B9 0000 0008
        SLR     R1,     2                       ; 523A   0065
        XORR    R1,     R0                      ; 523B   01C8
        PULR    R1                              ; 523C   02B1
        MVO@    R0,     R1                      ; 523D   0248
        ADDI    #$0002, R4                      ; 523E   02FC 0002
        SDBD                                    ; 5240   0001
        MVII    #$5373, R5                      ; 5241   02BD 0073 0053
        ADDR    R2,     R5                      ; 5244   00D5
        MVI@    R5,     R5                      ; 5245   02AD
        SDBD                                    ; 5246   0001
        ADDI    #$3800, R5                      ; 5247   02FD 0000 0038
        MVII    #$032C, R1                      ; 524A   02B9 032C
        ADDR    R2,     R1                      ; 524C   00D1
        MVI@    R1,     R0                      ; 524D   0288
        SLL     R3,     2                       ; 524E   004F
        SLL     R3,     1                       ; 524F   004B
        SDBD                                    ; 5250   0001
        MVI@    R4,     R1                      ; 5251   02A1
        MOVR    R1,     R4                      ; 5252   008C
        ANDI    #$0080, R0                      ; 5253   03B8 0080
        BEQ     L_526A                          ; 5255   0204 0013

        SLL     R3,     1                       ; 5257   004B
        ADDR    R3,     R4                      ; 5258   00DC
        MVI@    R4,     R0                      ; 5259   02A0
        MVO@    R0,     R5                      ; 525A   0268
        MVI@    R4,     R0                      ; 525B   02A0
        MVO@    R0,     R5                      ; 525C   0268
        MVI@    R4,     R0                      ; 525D   02A0
        MVO@    R0,     R5                      ; 525E   0268
        MVI@    R4,     R0                      ; 525F   02A0
        MVO@    R0,     R5                      ; 5260   0268
        MVI@    R4,     R0                      ; 5261   02A0
        MVO@    R0,     R5                      ; 5262   0268
        MVI@    R4,     R0                      ; 5263   02A0
        MVO@    R0,     R5                      ; 5264   0268
        MVI@    R4,     R0                      ; 5265   02A0
        MVO@    R0,     R5                      ; 5266   0268
        MVI@    R4,     R0                      ; 5267   02A0
        MVO@    R0,     R5                      ; 5268   0268
        INCR    R7                              ; 5269   000F

L_526A:
        ADDR    R3,     R4                      ; 526A   00DC
L_526B:
        MVI@    R4,     R0                      ; 526B   02A0
        MVO@    R0,     R5                      ; 526C   0268
        MVI@    R4,     R0                      ; 526D   02A0
        MVO@    R0,     R5                      ; 526E   0268
        MVI@    R4,     R0                      ; 526F   02A0
        MVO@    R0,     R5                      ; 5270   0268
        MVI@    R4,     R0                      ; 5271   02A0
        MVO@    R0,     R5                      ; 5272   0268
        MVI@    R4,     R0                      ; 5273   02A0
        MVO@    R0,     R5                      ; 5274   0268
        MVI@    R4,     R0                      ; 5275   02A0
        MVO@    R0,     R5                      ; 5276   0268
        MVI@    R4,     R0                      ; 5277   02A0
        MVO@    R0,     R5                      ; 5278   0268
        MVI@    R4,     R0                      ; 5279   02A0
        MVO@    R0,     R5                      ; 527A   0268
        PULR    R5                              ; 527B   02B5
L_527C:
        PULR    R4                              ; 527C   02B4
        INCR    R2                              ; 527D   000A
        MOVR    R2,     R0                      ; 527E   0090
        SARC    R0,     1                       ; 527F   0078
        BC      L_521C                          ; 5280   0221 0065

        MVI     G_0177, R2                      ; 5282   0282 0177
        TSTR    R2                              ; 5284   0092
        BNEQ    L_5293                          ; 5285   020C 000C

        SDBD                                    ; 5287   0001
        MVII    #$3800, R1                      ; 5288   02B9 0000 0038
        MVI@    R1,     R0                      ; 528B   0288
        XORI    #$00FF, R0                      ; 528C   03F8 00FF
        MVO@    R0,     R1                      ; 528E   0248
        MVII    #$0018, R0                      ; 528F   02B8 0018
        MVO     R0,     G_0177                  ; 5291   0240 0177
L_5293:
        MVII    #$00FF, R0                      ; 5293   02B8 00FF
        MVII    #$0324, R3                      ; 5295   02BB 0324
        MVII    #$0125, R4                      ; 5297   02BC 0125

        JSR     R5,     L_52DB                  ; 5299   0004 0150 02DB

        MVII    #$007F, R0                      ; 529C   02B8 007F
        MVII    #$032C, R3                      ; 529E   02BB 032C
        MVII    #$0135, R4                      ; 52A0   02BC 0135

        JSR     R5,     L_52DB                  ; 52A2   0004 0150 02DB

        CLRR    R1                              ; 52A5   01C9
        MVII    #$034C, R3                      ; 52A6   02BB 034C
L_52A8:
        CLRC                                    ; 52A8   0006
        MVI@    R3,     R0                      ; 52A9   0298
        TSTR    R0                              ; 52AA   0080
        BEQ     L_52B1                          ; 52AB   0204 0004

        DECR    R0                              ; 52AD   0010
        BNEQ    L_52B1                          ; 52AE   020C 0001

        SETC                                    ; 52B0   0007
L_52B1:
        RRC     R1,     1                       ; 52B1   0071
        MVO@    R0,     R3                      ; 52B2   0258
        INCR    R3                              ; 52B3   000B
        CMPI    #$0353, R3                      ; 52B4   037B 0353
        BLE     L_52A8                          ; 52B6   0226 000F

        SWAP    R1,     1                       ; 52B8   0041
        MVI     G_010D, R0                      ; 52B9   0280 010D
        COMR    R0                              ; 52BB   0018
        ANDR    R0,     R1                      ; 52BC   0181
        COMR    R0                              ; 52BD   0018
        XORR    R0,     R1                      ; 52BE   01C1
        MVO     R1,     G_010D                  ; 52BF   0241 010D
        MVI     G_010E, R0                      ; 52C1   0280 010E
        TSTR    R0                              ; 52C3   0080
        BEQ     L_52CD                          ; 52C4   0204 0007

        AND     G_0110, R0                      ; 52C6   0380 0110
        MVO     R0,     G_0110                  ; 52C8   0240 0110
        DECR    R0                              ; 52CA   0010
        MVO     R0,     G_010E                  ; 52CB   0240 010E

L_52CD:
        JSR     R5,     X_PLAY_NOTE             ; 52CD   0004 0118 02BD

        MVI     G_0104, R0                      ; 52D0   0280 0104
        INCR    R0                              ; 52D2   0008
        ANDI    #$0003, R0                      ; 52D3   03B8 0003
        MVO     R0,     G_0104                  ; 52D5   0240 0104
        CLRR    R0                              ; 52D7   01C0
        MVO     R0,     G_0103                  ; 52D8   0240 0103
        PULR    R7                              ; 52DA   02B7

L_52DB:
        PSHR    R5                              ; 52DB   0275
        MVII    #$0008, R5                      ; 52DC   02BD 0008
L_52DE:
        PSHR    R5                              ; 52DE   0275
        MVI@    R3,     R1                      ; 52DF   0299
        SDBD                                    ; 52E0   0001
        MVII    #$4000, R5                      ; 52E1   02BD 0000 0040
        ANDR    R1,     R5                      ; 52E4   018D
        BEQ     L_52EC                          ; 52E5   0204 0005

        JSR     R5,     L_530F                  ; 52E7   0004 0150 030F

        B       L_5309                          ; 52EA   0200 001D

L_52EC:
        ANDR    R0,     R1                      ; 52EC   0181
        PSHR    R0                              ; 52ED   0270
        SWAP    R1,     1                       ; 52EE   0041
        PSHR    R4                              ; 52EF   0274
        XOR@    R4,     R1                      ; 52F0   03E1
        MVI@    R4,     R0                      ; 52F1   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52F2   0004 0114 0268

        MVI     G_010C, R2                      ; 52F5   0282 010C
        TSTR    R2                              ; 52F7   0092
        BEQ     L_52FE                          ; 52F8   0204 0004

L_52FA:
        SLL     R0,     1                       ; 52FA   0048
        DECR    R2                              ; 52FB   0012
        BNEQ    L_52FA                          ; 52FC   022C 0003

L_52FE:
        ADDR    R0,     R1                      ; 52FE   00C1
        PULR    R2                              ; 52FF   02B2
        MVO@    R1,     R2                      ; 5300   0251
        SWAP    R1,     1                       ; 5301   0041
        PULR    R0                              ; 5302   02B0
        ANDR    R0,     R1                      ; 5303   0181
        MOVR    R0,     R2                      ; 5304   0082
        COMR    R2                              ; 5305   001A
        AND@    R3,     R2                      ; 5306   039A
        XORR    R1,     R2                      ; 5307   01CA
        MVO@    R2,     R3                      ; 5308   025A
L_5309:
        INCR    R3                              ; 5309   000B
        PULR    R5                              ; 530A   02B5
        DECR    R5                              ; 530B   0015
        BNEQ    L_52DE                          ; 530C   022C 002F
        PULR    R7                              ; 530E   02B7

L_530F:
        PSHR    R5                              ; 530F   0275
        PSHR    R0                              ; 5310   0270
        MOVR    R0,     R2                      ; 5311   0082
        DECR    R3                              ; 5312   0013
        MVI@    R3,     R1                      ; 5313   0299
        ANDR    R0,     R1                      ; 5314   0181
        INCR    R3                              ; 5315   000B
        INCR    R4                              ; 5316   000C
        MVI@    R4,     R0                      ; 5317   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5318   0004 0114 0268

        ADDR    R0,     R1                      ; 531B   00C1
        ANDR    R2,     R1                      ; 531C   0191
        COMR    R2                              ; 531D   001A
        AND@    R3,     R2                      ; 531E   039A
        XORR    R2,     R1                      ; 531F   01D1
        MVO@    R1,     R3                      ; 5320   0259
        PULR    R0                              ; 5321   02B0
        PULR    R7                              ; 5322   02B7

        PSHR    R5                              ; 5323   0275
        DIS                                     ; 5324   0003

        JSR     R5,     L_533D                  ; 5325   0004 0150 033D

        MVII    #$0020, R0                      ; 5328   02B8 0020
        CLRR    R4                              ; 532A   01E4
        MVO     R4,     G_010F                  ; 532B   0244 010F

        JSR     R5,     X_FILL_ZERO             ; 532D   0004 0114 0338
        JSR     R5,     L_535D                  ; 5330   0004 0150 035D

        MVII    #$00C3, R0                      ; 5333   02B8 00C3
        MVO     R0,     .ISRVEC.0               ; 5335   0240 0100
        MVII    #$0051, R0                      ; 5337   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 5339   0240 0101
        EIS                                     ; 533B   0002
        PULR    R7                              ; 533C   02B7

L_533D:
        PSHR    R5                              ; 533D   0275
        CLRR    R0                              ; 533E   01C0
        MVO     R0,     .STIC.HDLY              ; 533F   0240 0030
        MVO     R0,     .STIC.VDLY              ; 5341   0240 0031
        SDBD                                    ; 5343   0001
        MVII    #$536C, R4                      ; 5344   02BC 006C 0053
        MVI@    R4,     R0                      ; 5347   02A0
        MVO     R0,     G_0105                  ; 5348   0240 0105
        MVII    #$0021, R1                      ; 534A   02B9 0021
        TSTR    R0                              ; 534C   0080
        BEQ     L_5351                          ; 534D   0204 0002

        MVO@    R0,     R1                      ; 534F   0248
        INCR    R7                              ; 5350   000F

L_5351:
        MVI@    R1,     R0                      ; 5351   0288
L_5352:
        MVII    #$0028, R1                      ; 5352   02B9 0028
        MVII    #$0005, R0                      ; 5354   02B8 0005

        JSR     R5,     .EXEC.730               ; 5356   0004 0114 0330

        MVI@    R4,     R0                      ; 5359   02A0
        MVO     R0,     .STIC.EDGE              ; 535A   0240 0032
        PULR    R7                              ; 535C   02B7

L_535D:
        PSHR    R5                              ; 535D   0275
        SDBD                                    ; 535E   0001
        MVII    #$5397, R4                      ; 535F   02BC 0097 0053
        MVI@    R4,     R1                      ; 5362   02A1
        SDBD                                    ; 5363   0001
        ADDI    #$3800, R1                      ; 5364   02F9 0000 0038
        MVI@    R4,     R0                      ; 5367   02A0

        JSR     R5,     .EXEC.730               ; 5368   0004 0114 0330

        PULR    R7                              ; 536B   02B7

        DECLE   $0001,  $0005,  $0005,  $0005   ; 536C   0001 0005 0005 0005
        DECLE   $0005,  $0000,  $0000,  $01F0   ; 5370   0005 0000 0000 01F0
        DECLE   $01E0,  $01D0,  $01C0,  $01B0   ; 5374   01E0 01D0 01C0 01B0
        DECLE   $01A0,  $0190,  $0180,  $0001   ; 5378   01A0 0190 0180 0001
        DECLE   $0021,  $005A,  $0001,  $006D   ; 537C   0021 005A 0001 006D
        DECLE   $005A,  $000A,  $007F,  $005B   ; 5380   005A 000A 007F 005B
        DECLE   $000A,  $00A3,  $005B,  $0003   ; 5384   000A 00A3 005B 0003
        DECLE   $00F5,  $005B,  $000A,  $00FE   ; 5388   00F5 005B 000A 00FE
        DECLE   $005B,  $00B7,  $0058,  $006F   ; 538C   005B 00B7 0058 006F
        DECLE   $0059,  $0057,  $0059,  $0057   ; 5390   0059 0057 0059 0057
        DECLE   $0059,  $0057,  $0059,  $0008   ; 5394   0059 0057 0059 0008
        DECLE   $00F0,  $003C,  $003C,  $00FF   ; 5398   00F0 003C 003C 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 539C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $003C,  $003C,  $00FC   ; 53A0   00FF 003C 003C 00FC
        DECLE   $00FC,  $00FC,  $00F8,  $00F0   ; 53A4   00FC 00FC 00F8 00F0
        DECLE   $00C0,  $003C,  $003C,  $003F   ; 53A8   00C0 003C 003C 003F
        DECLE   $003F,  $003F,  $001F,  $000F   ; 53AC   003F 003F 001F 000F
        DECLE   $0003,  $0000,  $0001,  $0001   ; 53B0   0003 0000 0001 0001
        DECLE   $0007,  $0007,  $0001,  $0001   ; 53B4   0007 0007 0001 0001
        DECLE   $0000,  $0000,  $0080,  $0080   ; 53B8   0000 0000 0080 0080
        DECLE   $00E0,  $00E0,  $0080,  $0080   ; 53BC   00E0 00E0 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0018   ; 53C0   0000 0000 0000 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 53C4   0018 0018 0018 0018
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 53C8   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 53CC   00FF 00FF 00FF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 53D0   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 53D4   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 53D8   00FE 00FF 00FF 00FF
        DECLE   $00E7,  $00C3,  $0081,  $0000   ; 53DC   00E7 00C3 0081 0000
        DECLE   $0000,  $00FC,  $00F0,  $00C0   ; 53E0   0000 00FC 00F0 00C0
        DECLE   $0080,  $0080,  $0000,  $0000   ; 53E4   0080 0080 0000 0000
        DECLE   $0000,  $003F,  $000F,  $0003   ; 53E8   0000 003F 000F 0003
        DECLE   $0001,  $0001,  $0000,  $0000   ; 53EC   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 53F0   0000 0000 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53F4   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 53F8   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003F,  $000F   ; 53FC   00FF 00FF 003F 000F
        DECLE   $0003,  $00FF,  $00FF,  $00FF   ; 5400   0003 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00F0   ; 5404   00FF 00FF 00FC 00F0
        DECLE   $00C0,  $00FF,  $003F,  $000F   ; 5408   00C0 00FF 003F 000F
        DECLE   $0003,  $0000,  $0018,  $0018   ; 540C   0003 0000 0018 0018
        DECLE   $0018,  $00FF,  $00FC,  $00F0   ; 5410   0018 00FF 00FC 00F0
        DECLE   $00C0,  $0000,  $0018,  $0018   ; 5414   00C0 0000 0018 0018
        DECLE   $0018,  $00FF,  $00FF,  $00FF   ; 5418   0018 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 541C   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; 5420   00FF

        ADDR    R5,     R7                      ; 5421   00EF
        ADDR    R0,     R7                      ; 5422   00C7

        DECLE   $0083,  $0001,  $0001,  $0001   ; 5423   0083 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5427   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 542B   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $0000,  $0000   ; 542F   00C0 00C0 0000 0000
        DECLE   $0000,  $0008,  $001C,  $0008   ; 5433   0000 0008 001C 0008
        DECLE   $0014,  $0000,  $003C,  $007E   ; 5437   0014 0000 003C 007E
        DECLE   $00FF,  $00FE,  $00BF,  $00FF   ; 543B   00FF 00FE 00BF 00FF
        DECLE   $00FE,  $00FF,  $0066,  $0042   ; 543F   00FE 00FF 0066 0042
        DECLE   $0042,  $0000,  $00BD,  $0099   ; 5443   0042 0000 00BD 0099
        DECLE   $0099,  $00FF,  $00BE,  $00AA   ; 5447   0099 00FF 00BE 00AA
        DECLE   $0080,  $00AA,  $00AA,  $00AA   ; 544B   0080 00AA 00AA 00AA
        DECLE   $00C1,  $00FF                   ; 544F   00C1 00FF

        SARC    R0,     1                       ; 5451   0078
        SLR     R2,     1                       ; 5452   0062
        EIS                                     ; 5453   0002
        ADDR    R0,     R0                      ; 5454   00C0
        ADDR    R4,     R7                      ; 5455   00E7

        DECLE   $00C3,  $00FF,  $00FF           ; 5456   00C3 00FF 00FF

        MOVR    R0,     R7                      ; 5459   0087

        SWAP    R3,     1                       ; 545A   0043
        NEGR    R1                              ; 545B   0021
        DECR    R0                              ; 545C   0010
        MOVR    R1,     R7                      ; 545D   008F

        DECLE   $00C8,  $00E8,  $00FF,  $00C3   ; 545E   00C8 00E8 00FF 00C3
        DECLE   $00BD,  $0081,  $00C3,  $0081   ; 5462   00BD 0081 00C3 0081
        DECLE   $0000,  $0081,  $00FF,  $00D7   ; 5466   0000 0081 00FF 00D7
        DECLE   $0055,  $0055,  $0055,  $0001   ; 546A   0055 0055 0055 0001

        ADDR    R5,     R7                      ; 546E   00EF
        ADDR    R0,     R7                      ; 546F   00C7

        DECLE   $00FF                           ; 5470   00FF

        ADDR    R0,     R3                      ; 5471   00C3
        ADDR    R4,     R7                      ; 5472   00E7

        DECLE   $00C3,  $0091,  $0020,  $0091   ; 5473   00C3 0091 0020 0091
        DECLE   $00C3,  $00FF,  $00FF,  $00B8   ; 5477   00C3 00FF 00FF 00B8
        DECLE   $0057,  $0010,  $005E,  $0051   ; 547B   0057 0010 005E 0051
        DECLE   $00FF,  $00FF,  $003C,  $0042   ; 547F   00FF 00FF 003C 0042
        DECLE   $0099,  $00A1,  $00A1,  $0099   ; 5483   0099 00A1 00A1 0099
        DECLE   $0042,  $003C,  $0098,  $0009   ; 5487   0042 003C 0098 0009
        DECLE   $00C0,  $0004,  $0002,  $0030   ; 548B   00C0 0004 0002 0030
        DECLE   $003D,  $0055,  $0000,  $0000   ; 548F   003D 0055 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5493   0000 0000 0000 0000
        DECLE   $0000,  $0049,  $0080,  $0044   ; 5497   0000 0049 0080 0044
        DECLE   $0004,  $0030,  $0049,  $0055   ; 549B   0004 0030 0049 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 549F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0009   ; 54A3   0000 0000 0008 0009
        DECLE   $00C0,  $0000,  $0002,  $0020   ; 54A7   00C0 0000 0002 0020
        DECLE   $0051,  $0055,  $0010,  $0000   ; 54AB   0051 0055 0010 0000
        DECLE   $0090,  $0000,  $0037,  $0000   ; 54AF   0090 0000 0037 0000
        DECLE   $0008,  $0009,  $00C5,  $0000   ; 54B3   0008 0009 00C5 0000
        DECLE   $0002,  $0020,  $0051,  $0055   ; 54B7   0002 0020 0051 0055
        DECLE   $0010,  $0000,  $00E8,  $0000   ; 54BB   0010 0000 00E8 0000
        DECLE   $001E,  $0000,  $0019,  $0009   ; 54BF   001E 0000 0019 0009
        DECLE   $0095,  $0000,  $0002,  $0010   ; 54C3   0095 0000 0002 0010
        DECLE   $0025,  $0055,  $0000,  $0000   ; 54C7   0025 0055 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54CB   0000 0000 0000 0000
        DECLE   $0016,  $0008,  $0092,  $0000   ; 54CF   0016 0008 0092 0000
        DECLE   $0005,  $0030,  $00DB,  $0054   ; 54D3   0005 0030 00DB 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003F,  $0057   ; 54DB   0000 0000 003F 0057
        DECLE   $0002,  $0000,  $0020,  $0009   ; 54DF   0002 0000 0020 0009
        DECLE   $00D8,  $0000,  $0000,  $0000   ; 54E3   00D8 0000 0000 0000
        DECLE   $0061,  $0055,  $0010,  $0000   ; 54E7   0061 0055 0010 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 54EB   0002 0000 0000 0000
        DECLE   $0000,  $0048,  $0080,  $0040   ; 54EF   0000 0048 0080 0040
        DECLE   $0000,  $0000,  $0067,  $0055   ; 54F3   0000 0000 0067 0055
        DECLE   $0010,  $0000,  $0000,  $0000   ; 54F7   0010 0000 0000 0000
        DECLE   $03F8,  $0000,  $0000,  $0048   ; 54FB   03F8 0000 0000 0048
        DECLE   $0080,  $0040,  $0000,  $0000   ; 54FF   0080 0040 0000 0000
        DECLE   $006D,  $0055,  $0010,  $0000   ; 5503   006D 0055 0010 0000
        DECLE   $0000,  $0000,  $03F8,  $0000   ; 5507   0000 0000 03F8 0000
        DECLE   $0000,  $0048,  $0080,  $0040   ; 550B   0000 0048 0080 0040
        DECLE   $0000,  $0000,  $0073,  $0055   ; 550F   0000 0000 0073 0055
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5513   0010 0000 0000 0000
        DECLE   $03F8,  $0000,  $0000,  $0008   ; 5517   03F8 0000 0000 0008
        DECLE   $00D2,  $0000,  $0001,  $0000   ; 551B   00D2 0000 0001 0000
        DECLE   $005B,  $0055,  $0030,  $0000   ; 551F   005B 0055 0030 0000
        DECLE   $0028,  $0000,  $0000,  $0000   ; 5523   0028 0000 0000 0000
        DECLE   $00B4,  $0056,  $0003,  $0003   ; 5527   00B4 0056 0003 0003
        DECLE   $00B2,  $0057,  $00B2,  $0057   ; 552B   00B2 0057 00B2 0057
        DECLE   $0000,  $0009,  $00D0,  $0000   ; 552F   0000 0009 00D0 0000
        DECLE   $0002,  $0000,  $0079,  $0055   ; 5533   0002 0000 0079 0055
        DECLE   $0010,  $0000,  $0020,  $0000   ; 5537   0010 0000 0020 0000
        DECLE   $0000,  $03C0,  $0045,  $005C   ; 553B   0000 03C0 0045 005C
        DECLE   $00A0,  $0055,  $0003,  $010C   ; 553F   00A0 0055 0003 010C
        DECLE   $00B2,  $0057,  $00B2,  $0057   ; 5543   00B2 0057 00B2 0057
        DECLE   $000D,  $0058,  $0082,  $005C   ; 5547   000D 0058 0082 005C
        DECLE   $00E0,  $0055,  $0003,  $0100   ; 554B   00E0 0055 0003 0100
        DECLE   $000D,  $0058,  $00BF,  $005C   ; 554F   000D 0058 00BF 005C
        DECLE   $005D,  $0056,  $0002,  $0003   ; 5553   005D 0056 0002 0003
        DECLE   $00B2,  $0057,  $00B2,  $0057   ; 5557   00B2 0057 00B2 0057
        DECLE   $006A,  $005C,  $0075,  $0056   ; 555B   006A 005C 0075 0056
        DECLE   $0004,  $0000,  $0083,  $005C   ; 555F   0004 0000 0083 005C
        DECLE   $001D,  $0056,  $0003,  $0000   ; 5563   001D 0056 0003 0000

        ADCR    R1                              ; 5567   0029
        SLLC    R1,     2                       ; 5568   005D
        ADDR    R3,     R7                      ; 5569   00DF

        DECLE   $0056,  $0003,  $0000           ; 556A   0056 0003 0000

        MOVR    R3,     R0                      ; 556D   0098
        SLLC    R0,     2                       ; 556E   005C
        INCR    R7                              ; 556F   000F

        RLC     R3,     2                       ; 5570   0057
L_5571:
        DIS                                     ; 5571   0003
        DECLE   $0000,  $00EB,  $005C,  $005F   ; 5572   0000 00EB 005C 005F
        DECLE   $0057,  $0003,  $0000,  $0046   ; 5576   0057 0003 0000 0046
        DECLE   $005F,  $0081,  $0055,  $0002   ; 557A   005F 0081 0055 0002
        DECLE   $0001,  $008F,  $0057,  $0008   ; 557E   0001 008F 0057 0008
        DECLE   $0024,  $0019,  $0074,  $00FE   ; 5582   0024 0019 0074 00FE
        DECLE   $005E,  $007A,  $003D,  $0098   ; 5586   005E 007A 003D 0098
        DECLE   $0000,  $0048,  $0002,  $0012   ; 558A   0000 0048 0002 0012
        DECLE   $0040,  $0008,  $0052,  $0000   ; 558E   0040 0008 0052 0000
        DECLE   $0018,  $003C,  $003A,  $006E   ; 5592   0018 003C 003A 006E
        DECLE   $003F,  $00FE,  $006E,  $003C   ; 5596   003F 00FE 006E 003C
        DECLE   $001A,  $0042,  $0048,  $001A   ; 559A   001A 0042 0048 001A
        DECLE   $005A,  $0010,  $0000,  $0000   ; 559E   005A 0010 0000 0000
        DECLE   $0000,  $000C,  $000C,  $0000   ; 55A2   0000 000C 000C 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 55A6   0002 0000 0000 0000
        DECLE   $001C,  $0014,  $0034,  $0064   ; 55AA   001C 0014 0034 0064
        DECLE   $00C4,  $0086,  $0000,  $000C   ; 55AE   00C4 0086 0000 000C
        DECLE   $000C,  $0000,  $0000,  $0002   ; 55B2   000C 0000 0000 0002
        DECLE   $0000,  $0000,  $0018,  $0018   ; 55B6   0000 0000 0018 0018
        DECLE   $0018,  $0018,  $0078,  $0048   ; 55BA   0018 0018 0078 0048
        DECLE   $0008,  $000C,  $0000,  $000C   ; 55BE   0008 000C 0000 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 55C2   000C 0000 0000 0000
        DECLE   $0000,  $0004,  $0018,  $0018   ; 55C6   0000 0004 0018 0018
        DECLE   $0018,  $0038,  $0030,  $0010   ; 55CA   0018 0038 0030 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 55CE   0010 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D2   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0020   ; 55D6   0000 0030 0030 0020
        DECLE   $0000,  $0000,  $0000,  $003C   ; 55DA   0000 0000 0000 003C
        DECLE   $0006,  $003E,  $0000,  $0000   ; 55DE   0006 003E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 55E2   0000 0000 0000 0018
        DECLE   $0018,  $001C,  $0018,  $0018   ; 55E6   0018 001C 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55EE   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0038,  $0038   ; 55F2   0000 0018 0038 0038
        DECLE   $001C,  $0018,  $0000,  $0000   ; 55F6   001C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55FE   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0038,  $0078   ; 5602   0000 0018 0038 0078
        DECLE   $0018,  $0018,  $001C,  $0000   ; 5606   0018 0018 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 560A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 560E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5612   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5616   0000 0000 0000 0000
        DECLE   $007E,  $0070,  $0070,  $0000   ; 561A   007E 0070 0070 0000
        DECLE   $0000,  $0000,  $0008,  $0004   ; 561E   0000 0000 0008 0004
        DECLE   $0004                           ; 5622   0004

        EIS                                     ; 5623   0002
        ADDR    R4,     R1                      ; 5624   00E1
        RRC     R0,     1                       ; 5625   0070
        ADDR    R7,     R1                      ; 5626   00F9
        ADDR    R5,     R7                      ; 5627   00EF

        DECLE   $00FF,  $00F8,  $0090,  $0020   ; 5628   00FF 00F8 0090 0020
        DECLE   $0000,  $0000,  $0000,  $0040   ; 562C   0000 0000 0000 0040
        DECLE   $0010,  $0008,  $0004,  $0000   ; 5630   0010 0008 0004 0000

        ADDR    R4,     R0                      ; 5634   00E0
        RRC     R0,     1                       ; 5635   0070
        ADDR    R7,     R1                      ; 5636   00F9
        ADDR    R5,     R7                      ; 5637   00EF

        DECLE   $00FF,  $00F8,  $0090,  $0020   ; 5638   00FF 00F8 0090 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 563C   0000 0000 0000 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5640   0040 0000 0000 0000

        ADDR    R4,     R0                      ; 5644   00E0
        RRC     R0,     1                       ; 5645   0070
        ADDR    R7,     R0                      ; 5646   00F8
        ADDR    R5,     R7                      ; 5647   00EF

        DECLE   $00FF,  $00F8,  $0090,  $0020   ; 5648   00FF 00F8 0090 0020
        DECLE   $0000,  $00E1,  $0071,  $0033   ; 564C   0000 00E1 0071 0033
        DECLE   $0037,  $006F,  $00FE,  $00BE   ; 5650   0037 006F 00FE 00BE
        DECLE   $00BF,  $00EC,  $00BC,  $00E8   ; 5654   00BF 00EC 00BC 00E8
        DECLE   $00F0,  $00C0,  $0080,  $00E0   ; 5658   00F0 00C0 0080 00E0
        DECLE   $0000,  $0000,  $0004           ; 565C   0000 0000 0004

        SLL     R2,     1                       ; 565F   004A
L_5660:
        DECR    R7                              ; 5660   0017

        DECLE   $00AA,  $0004,  $0000,  $0000   ; 5661   00AA 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5665   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5669   0000 0000 0000 0000
        DECLE   $0000,  $008A,  $002D,  $0007   ; 566D   0000 008A 002D 0007
        DECLE   $0056,  $0008,  $0000,  $0000   ; 5671   0056 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5675   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5679   0000 0000 0000 0000
        DECLE   $0010,  $0030,  $0010,  $0028   ; 567D   0010 0030 0010 0028
        DECLE   $0030,  $0010,  $0038,  $007C   ; 5681   0030 0010 0038 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5685   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $006A   ; 5689   0000 0000 0040 006A
        DECLE   $0098,  $00B4,  $0010,  $0020   ; 568D   0098 00B4 0010 0020
        DECLE   $0030,  $0010,  $0018,  $0038   ; 5691   0030 0010 0018 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5695   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0068   ; 5699   0000 0000 0000 0068
        DECLE   $0090,  $00B4,  $006A,  $00A3   ; 569D   0090 00B4 006A 00A3
        DECLE   $0010,  $0010,  $0000,  $0010   ; 56A1   0010 0010 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56AD   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0042,  $0082   ; 56B1   0002 0000 0042 0082
        DECLE   $007F,  $0082,  $0000,  $0000   ; 56B5   007F 0082 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 56C1   0000 0000 0000 0080
        DECLE   $0040,  $00B0,  $000C,  $0003   ; 56C5   0040 00B0 000C 0003
        DECLE   $0002,  $0000,  $0000,  $0000   ; 56C9   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 56D1   0000 0000 0000 0040
        DECLE   $0040,  $00C0,  $0020,  $0010   ; 56D5   0040 00C0 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0003   ; 56D9   0008 0004 0002 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 56E1   0000 0000 0000 0080
        DECLE   $00C0,  $00E1,  $00F0,  $00F8   ; 56E5   00C0 00E1 00F0 00F8
        DECLE   $00FF,  $00FF,  $00F1,  $00E1   ; 56E9   00FF 00FF 00F1 00E1
        DECLE   $0061,  $0038,  $0000,  $0000   ; 56ED   0061 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 56F1   0000 0000 0000 0080
        DECLE   $00E0,  $00F1,  $00F8,  $00FC   ; 56F5   00E0 00F1 00F8 00FC
        DECLE   $00FF,  $00FF,  $00F1,  $00F9   ; 56F9   00FF 00FF 00F1 00F9
        DECLE   $00D9,  $003C,  $0010,  $0000   ; 56FD   00D9 003C 0010 0000
        DECLE   $0002,  $0000,  $0000,  $0080   ; 5701   0002 0000 0000 0080
        DECLE   $00E0,  $00F1,  $00F8,  $00FC   ; 5705   00E0 00F1 00F8 00FC
        DECLE   $00FF,  $00FF                   ; 5709   00FF 00FF

        ADDR    R6,     R1                      ; 570B   00F1
        ADDR    R7,     R1                      ; 570C   00F9
        SLR     R1,     1                       ; 570D   0061
        RRC     R0,     1                       ; 570E   0070
        NEGR    R1                              ; 570F   0021
        COMR    R6                              ; 5710   001E
        MOVR    R0,     R2                      ; 5711   0082
        ADDR    R1,     R7                      ; 5712   00CF

        SWAP    R1,     1                       ; 5713   0041
        MOVR    R0,     R7                      ; 5714   0087

        DIS                                     ; 5715   0003
        SETC                                    ; 5716   0007
        MOVR    R1,     R7                      ; 5717   008F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5718   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00F0,  $0000           ; 571C   00FC 00F0 0000

        TSTR    R0                              ; 571F   0080
        COMR    R6                              ; 5720   001E
        EIS                                     ; 5721   0002
        MOVR    R1,     R7                      ; 5722   008F

        ADDR    R0,     R1                      ; 5723   00C1
        SWAP    R3,     2                       ; 5724   0047
        ADDR    R0,     R3                      ; 5725   00C3
        MOVR    R0,     R7                      ; 5726   0087
        ADDR    R1,     R7                      ; 5727   00CF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5728   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $0078,  $0000           ; 572C   00FE 0078 0000

        RSWD    R6                              ; 572F   003E
        EIS                                     ; 5730   0002
        MOVR    R3,     R6                      ; 5731   009E
        ADDR    R0,     R3                      ; 5732   00C3
        SLL     R3,     2                       ; 5733   004F
        MOVR    R0,     R1                      ; 5734   0081
        DIS                                     ; 5735   0003
        SETC                                    ; 5736   0007
        MOVR    R1,     R7                      ; 5737   008F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5738   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00F0,  $0000,  $00E4   ; 573C   00FC 00F0 0000 00E4
        DECLE   $0026,  $007A,  $007A,  $003B   ; 5740   0026 007A 007A 003B
        DECLE   $0031,  $0071,  $00FB,  $00BF   ; 5744   0031 0071 00FB 00BF
        DECLE   $00FB,  $0071,  $0031,  $0073   ; 5748   00FB 0071 0031 0073
        DECLE   $0076,  $0074,  $0074,  $00E2   ; 574C   0076 0074 0074 00E2
        DECLE   $0021,  $0079,  $0079,  $0039   ; 5750   0021 0079 0079 0039
        DECLE   $0031,  $0071,  $00FB,  $00FF   ; 5754   0031 0071 00FB 00FF
        DECLE   $007B,  $0031,  $0071,  $0071   ; 5758   007B 0031 0071 0071
        DECLE   $0071,  $0071,  $0071,  $000E   ; 575C   0071 0071 0071 000E
        DECLE   $001F,  $0019,  $0030,  $0060   ; 5760   001F 0019 0030 0060
        DECLE   $00E0,  $00E0,  $00F7,  $00FF   ; 5764   00E0 00E0 00F7 00FF
        DECLE   $007F,  $003F,  $007F,  $007B   ; 5768   007F 003F 007F 007B
        DECLE   $0071,  $0030,  $007E,  $0020   ; 576C   0071 0030 007E 0020
        DECLE   $000E,  $001F,  $0011,  $0030   ; 5770   000E 001F 0011 0030
        DECLE   $0060,  $00E0,  $00F3,  $00FF   ; 5774   0060 00E0 00F3 00FF
        DECLE   $00FF,  $003F,  $003F,  $007F   ; 5778   00FF 003F 003F 007F
        DECLE   $00F8,  $0070,  $0038,  $008E   ; 577C   00F8 0070 0038 008E
        DECLE   $001F,  $0019,  $0030,  $0060   ; 5780   001F 0019 0030 0060
        DECLE   $00E0,  $00E0,  $00F7,  $00FF   ; 5784   00E0 00E0 00F7 00FF
        DECLE   $007F,  $003F,  $00BF,  $00FF   ; 5788   007F 003F 00BF 00FF

        ADDR    R7,     R1                      ; 578C   00F9
        SAR     R0,     2                       ; 578D   006C
        ADCR    R6                              ; 578E   002E
        PSHR    R5                              ; 578F   0275
        CLRR    R0                              ; 5790   01C0
        MVO     R0,     G_0354                  ; 5791   0240 0354
        MVI     G_0324, R0                      ; 5793   0280 0324
        SDBD                                    ; 5795   0001
        ANDI    #$FEFF, R0                      ; 5796   03B8 00FF 00FE
        MVO     R0,     G_0324                  ; 5799   0240 0324

        JSR     R5,     L_5DE2                  ; 579B   0004 015C 01E2

        DECR    R0                              ; 579E   0010
        MVO@    R0,     R1                      ; 579F   0248
        MVII    #$000F, R0                      ; 57A0   02B8 000F
        MVO     R0,     G_0350                  ; 57A2   0240 0350
        MVO     R0,     G_017B                  ; 57A4   0240 017B

        JSR     R5,     L_5D29                  ; 57A6   0004 015C 0129

        MVII    #$0003, R0                      ; 57A9   02B8 0003
        MVO     R0,     G_0344                  ; 57AB   0240 0344
        MVO     R0,     G_0345                  ; 57AD   0240 0345
        J       L_5FCD                          ; 57AF   0004 035C 03CD

        PSHR    R5                              ; 57B2   0275
        CLRR    R0                              ; 57B3   01C0
        MVO     R0,     G_0354                  ; 57B4   0240 0354
        MVI     G_017A, R0                      ; 57B6   0280 017A
        TSTR    R0                              ; 57B8   0080
        BNEQ    L_5956                          ; 57B9   020C 019B

        MVI     G_0324, R0                      ; 57BB   0280 0324
        ANDI    #$00FF, R0                      ; 57BD   03B8 00FF
        CMPI    #$009E, R0                      ; 57BF   0378 009E
        BGE     L_5956                          ; 57C1   020D 0193

        PSHR    R0                              ; 57C3   0270
        MVO     R0,     G_0178                  ; 57C4   0240 0178
        CLRR    R0                              ; 57C6   01C0
        MVO     R0,     G_0175                  ; 57C7   0240 0175
        MVII    #$0003, R2                      ; 57C9   02BA 0003
        MVII    #$0002, R3                      ; 57CB   02BB 0002

        JSR     R5,     L_5F44                  ; 57CD   0004 015C 0344

        SDBD                                    ; 57D0   0001
        MVII    #$0804, R1                      ; 57D1   02B9 0004 0008
        MVII    #$032C, R3                      ; 57D4   02BB 032C
        MVI@    R3,     R0                      ; 57D6   0298
        ADDR    R1,     R0                      ; 57D7   00C8
        MVO@    R0,     R3                      ; 57D8   0258
        INCR    R3                              ; 57D9   000B
        ADD@    R3,     R1                      ; 57DA   02D9
        MVO@    R1,     R3                      ; 57DB   0259
        SDBD                                    ; 57DC   0001
        MVII    #$DFFF, R1                      ; 57DD   02B9 00FF 00DF
        MVII    #$0334, R3                      ; 57E0   02BB 0334
        MVI@    R3,     R0                      ; 57E2   0298
        ANDR    R1,     R0                      ; 57E3   0188
        MVO@    R0,     R3                      ; 57E4   0258
        INCR    R3                              ; 57E5   000B
        AND@    R3,     R1                      ; 57E6   0399
        MVO@    R1,     R3                      ; 57E7   0259
        PULR    R2                              ; 57E8   02B2
        MVII    #$0015, R3                      ; 57E9   02BB 0015
        CMPI    #$001D, R2                      ; 57EB   037A 001D
        BLT     L_57F5                          ; 57ED   0205 0006

        NEGR    R3                              ; 57EF   0023
        CMPI    #$008F, R2                      ; 57F0   037A 008F
        BGT     L_57F5                          ; 57F2   020E 0001

        CLRR    R3                              ; 57F4   01DB
L_57F5:
        MVII    #$001D, R1                      ; 57F5   02B9 001D
        MVII    #$0011, R2                      ; 57F7   02BA 0011
        MVO     R2,     G_034C                  ; 57F9   0242 034C
        MVO     R1,     G_0136                  ; 57FB   0241 0136
        MVO     R3,     G_0126                  ; 57FD   0243 0126

        JSR     R5,     L_5F2F                  ; 57FF   0004 015C 032F

        J       L_5FCD                          ; 5802   0004 035C 03CD

        DECLE   $0001,  $0002,  $0003,  $0004   ; 5805   0001 0002 0003 0004
        DECLE   $0005,  $0008,  $000A,  $0001   ; 5809   0005 0008 000A 0001

        PSHR    R5                              ; 580D   0275
        MVI     G_034D, R0                      ; 580E   0280 034D
        TSTR    R0                              ; 5810   0080
        BNEQ    L_5956                          ; 5811   020C 0143

        MVO     R0,     G_0354                  ; 5813   0240 0354
        MVO     R0,     G_0355                  ; 5815   0240 0355
        MVII    #$0003, R0                      ; 5817   02B8 0003
        MVO     R0,     G_034D                  ; 5819   0240 034D
        MVI     G_0324, R0                      ; 581B   0280 0324
        ANDI    #$00FF, R0                      ; 581D   03B8 00FF
        SUBI    #$0008, R0                      ; 581F   0338 0008
        SLR     R0,     2                       ; 5821   0064
        SLR     R0,     1                       ; 5822   0060
        MOVR    R0,     R4                      ; 5823   0084
        MVI     G_032C, R1                      ; 5824   0281 032C
        ANDI    #$007F, R1                      ; 5826   03B9 007F
        SUBI    #$0008, R1                      ; 5828   0339 0008
        SLR     R1,     2                       ; 582A   0065
        SLR     R1,     1                       ; 582B   0061
        SLL     R1,     2                       ; 582C   004D
        ADDR    R1,     R4                      ; 582D   00CC
        SLL     R1,     2                       ; 582E   004D
        ADDR    R1,     R4                      ; 582F   00CC
        ADDI    #$0200, R4                      ; 5830   02FC 0200
        MVI@    R4,     R0                      ; 5832   02A0
        TSTR    R0                              ; 5833   0080
        BNEQ    L_5841                          ; 5834   020C 000B

        MVI@    R4,     R0                      ; 5836   02A0
        TSTR    R0                              ; 5837   0080
        BNEQ    L_5841                          ; 5838   020C 0007

        ADDI    #$0012, R4                      ; 583A   02FC 0012
        MVI@    R4,     R0                      ; 583C   02A0
        TSTR    R0                              ; 583D   0080
        BNEQ    L_5841                          ; 583E   020C 0001

        MVI@    R4,     R0                      ; 5840   02A0
L_5841:
        DECR    R4                              ; 5841   0014
        ANDI    #$01F8, R0                      ; 5842   03B8 01F8
        CMPI    #$00B0, R0                      ; 5844   0378 00B0
        BLT     L_5876                          ; 5846   0205 002E

        CMPI    #$00E8, R0                      ; 5848   0378 00E8
        BGT     L_5876                          ; 584A   020E 002A

        SLR     R0,     2                       ; 584C   0064
        SLR     R0,     1                       ; 584D   0060
        MOVR    R0,     R1                      ; 584E   0081
        CLRR    R0                              ; 584F   01C0
        MVO@    R0,     R4                      ; 5850   0260
        SUBI    #$0016, R1                      ; 5851   0339 0016
        ADDR    R7,     R1                      ; 5853   00F9
        SUBI    #$004F, R1                      ; 5854   0339 004F
        MVI@    R1,     R2                      ; 5856   028A

        JSR     R5,     L_5F29                  ; 5857   0004 015C 0329

        CMPI    #$0006, R0                      ; 585A   0378 0006
        BLT     L_585F                          ; 585C   0205 0001

        SLL     R2,     1                       ; 585E   004A

L_585F:
        JSR     R5,     L_5E3E                  ; 585F   0004 015C 023E
        JSR     R5,     L_5CF0                  ; 5862   0004 015C 00F0

        MVI     G_0172, R0                      ; 5865   0280 0172
        DECR    R0                              ; 5867   0010
        MVO     R0,     G_0172                  ; 5868   0240 0172
        BNEQ    L_5873                          ; 586A   020C 0007

        SDBD                                    ; 586C   0001
        MVII    #$08AA, R3                      ; 586D   02BB 00AA 0008
        MVII    #$0215, R4                      ; 5870   02BC 0215
        MVO@    R3,     R4                      ; 5872   0263
L_5873:
        J       L_5FE3                          ; 5873   0004 035C 03E3

L_5876:
        CLRR    R3                              ; 5876   01DB
        MVO     R3,     G_034D                  ; 5877   0243 034D
        CMPI    #$00A8, R0                      ; 5879   0378 00A8
        BNEQ    L_5956                          ; 587B   020C 00D9

        MVI     G_0324, R0                      ; 587D   0280 0324
        ANDI    #$00FF, R0                      ; 587F   03B8 00FF
        CMPI    #$0032, R0                      ; 5881   0378 0032
        BLT     L_5890                          ; 5883   0205 000B

        MVI     G_032C, R0                      ; 5885   0280 032C
        SDBD                                    ; 5887   0001
        ANDI    #$0400, R0                      ; 5888   03B8 0000 0004
        BNEQ    L_5956                          ; 588B   020C 00C9
        J       L_5D75                          ; 588D   0004 035C 0175

L_5890:
        MVII    #$000A, R2                      ; 5890   02BA 000A

        JSR     R5,     L_5E3E                  ; 5892   0004 015C 023E

        MVI     G_0171, R2                      ; 5895   0282 0171
        MVII    #$016F, R1                      ; 5897   02B9 016F
        ADDR    R2,     R1                      ; 5899   00D1
        MVI@    R1,     R0                      ; 589A   0288
        INCR    R0                              ; 589B   0008
        MVO@    R0,     R1                      ; 589C   0248
        MVII    #$016E, R1                      ; 589D   02B9 016E
        SUBR    R2,     R1                      ; 589F   0111
        MVI@    R1,     R0                      ; 58A0   0288
        TSTR    R0                              ; 58A1   0080
        BEQ     L_58A8                          ; 58A2   0204 0004

        XORI    #$0001, R2                      ; 58A4   03FA 0001
        MVO     R2,     G_0171                  ; 58A6   0242 0171
L_58A8:
        CLRR    R0                              ; 58A8   01C0
        MVO     R0,     G_0126                  ; 58A9   0240 0126
        MVO     R0,     G_0136                  ; 58AB   0240 0136

        JSR     R5,     L_5EC1                  ; 58AD   0004 015C 02C1

        J       L_5FE3                          ; 58B0   0004 035C 03E3

        DECLE   $0055,  $00FC,  $00BF           ; 58B3   0055 00FC 00BF

        SLLC    R2,     1                       ; 58B6   005A
L_58B7:
        PSHR    R5                              ; 58B7   0275
        CMP     G_0171, R1                      ; 58B8   0341 0171
        BNEQ    L_5956                          ; 58BA   020C 009A

        MVI     G_017A, R2                      ; 58BC   0282 017A
        TSTR    R2                              ; 58BE   0092
        BNEQ    L_590C                          ; 58BF   020C 004B

        ANDI    #$00FF, R0                      ; 58C1   03B8 00FF
        CMP     G_0174, R0                      ; 58C3   0340 0174
        BEQ     L_5956                          ; 58C5   0204 008F

        MVO     R0,     G_0174                  ; 58C7   0240 0174
        MVI     G_0178, R2                      ; 58C9   0282 0178
        ADD     G_0175, R2                      ; 58CB   02C2 0175
        BNEQ    L_5956                          ; 58CD   020C 0087

        CMPI    #$00FF, R0                      ; 58CF   0378 00FF
        BEQ     L_5907                          ; 58D1   0204 0034

        CLRR    R3                              ; 58D3   01DB
        MVO     R3,     G_017E                  ; 58D4   0243 017E
        MOVR    R0,     R3                      ; 58D6   0083
        SLR     R3,     2                       ; 58D7   0067
        ANDI    #$0003, R0                      ; 58D8   03B8 0003
        ADDR    R7,     R3                      ; 58DA   00FB
        SUBI    #$0028, R3                      ; 58DB   033B 0028
        MVI@    R3,     R2                      ; 58DD   029A
L_58DE:
        DECR    R0                              ; 58DE   0010
        BMI     L_58E4                          ; 58DF   020B 0003

        SLR     R2,     2                       ; 58E1   0066
        B       L_58DE                          ; 58E2   0220 0005

L_58E4:
        ANDI    #$0003, R2                      ; 58E4   03BA 0003
        CLRR    R0                              ; 58E6   01C0
        CLRR    R1                              ; 58E7   01C9
        MOVR    R2,     R3                      ; 58E8   0093
        ANDI    #$0001, R3                      ; 58E9   03BB 0001
        BEQ     L_58F1                          ; 58EB   0204 0004

        MVII    #$0028, R0                      ; 58ED   02B8 0028
        MVII    #$0010, R1                      ; 58EF   02B9 0010
L_58F1:
        SARC    R2,     2                       ; 58F1   007E
        BNOV    L_58FA                          ; 58F2   020A 0006

        NEGR    R0                              ; 58F4   0020
        TSTR    R3                              ; 58F5   009B
        BNEQ    L_58FA                          ; 58F6   020C 0002

        MVII    #$0003, R1                      ; 58F8   02B9 0003
L_58FA:
        MVO     R0,     G_0126                  ; 58FA   0240 0126
        MVO     R1,     G_0344                  ; 58FC   0241 0344
        NOP                                     ; 58FE   0034
        MVO     R1,     G_0345                  ; 58FF   0241 0345
        MVO     R3,     G_017D                  ; 5901   0243 017D

        JSR     R5,     L_5D0E                  ; 5903   0004 015C 010E

        PULR    R7                              ; 5906   02B7

L_5907:
        MVII    #$0002, R0                      ; 5907   02B8 0002
        MVO     R0,     G_017E                  ; 5909   0240 017E
        PULR    R7                              ; 590B   02B7

L_590C:
        MVI     G_0350, R3                      ; 590C   0283 0350
        TSTR    R3                              ; 590E   009B
        BNEQ    L_5956                          ; 590F   020C 0045

        MVI     G_017B, R3                      ; 5911   0283 017B
        TSTR    R3                              ; 5913   009B
        BEQ     L_591D                          ; 5914   0204 0007

        CMPI    #$0008, R0                      ; 5916   0378 0008
        BNEQ    L_5956                          ; 5918   020C 003C

        CLRR    R3                              ; 591A   01DB
        MVO     R3,     G_017B                  ; 591B   0243 017B
L_591D:
        TSTR    R0                              ; 591D   0080
        BMI     L_5952                          ; 591E   020B 0032

        CLRR    R3                              ; 5920   01DB
        MVO     R3,     G_034F                  ; 5921   0243 034F
        MVI     G_010D, R3                      ; 5923   0283 010D
        ANDI    #$00F7, R3                      ; 5925   03BB 00F7
        MVO     R3,     G_010D                  ; 5927   0243 010D
        MOVR    R0,     R1                      ; 5929   0081
        MVII    #$0046, R0                      ; 592A   02B8 0046

        JSR     R5,     L_5F29                  ; 592C   0004 015C 0329

        ADDI    #$0023, R0                      ; 592F   02F8 0023
        CMPI    #$0032, R0                      ; 5931   0378 0032
        BLT     L_5937                          ; 5933   0205 0002

        MVII    #$0032, R0                      ; 5935   02B8 0032

L_5937:
        JSR     R5,     .EXEC.629               ; 5937   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 593A   0004 0114 0357

        MVO     R0,     G_0126                  ; 593D   0240 0126
        MVO     R1,     G_0136                  ; 593F   0241 0136

        JSR     R5,     L_5D0E                  ; 5941   0004 015C 010E

        MVII    #$0010, R0                      ; 5944   02B8 0010
        MVI     G_0344, R1                      ; 5946   0281 0344
        TSTR    R1                              ; 5948   0089
        BNEQ    L_594F                          ; 5949   020C 0004

        MVO     R0,     G_0344                  ; 594B   0240 0344
        MVO     R0,     G_0345                  ; 594D   0240 0345
L_594F:
        MVO     R0,     G_017D                  ; 594F   0240 017D
        PULR    R7                              ; 5951   02B7

L_5952:
        MVII    #$0006, R2                      ; 5952   02BA 0006
        MVO     R2,     G_034F                  ; 5954   0242 034F
L_5956:
        PULR    R7                              ; 5956   02B7

        PSHR    R5                              ; 5957   0275
        CMP     G_0171, R1                      ; 5958   0341 0171
        BNEQ    L_5956                          ; 595A   022C 0005

        CMPI    #$0001, R0                      ; 595C   0378 0001
        BLT     L_5956                          ; 595E   0225 0009

        MVI     G_017A, R2                      ; 5960   0282 017A
        ADD     G_0178, R2                      ; 5962   02C2 0178
        ADD     G_0175, R2                      ; 5964   02C2 0175
        BNEQ    L_5956                          ; 5966   022C 0011

        MVII    #$000E, R0                      ; 5968   02B8 000E
        MVO     R0,     G_0175                  ; 596A   0240 0175
        J       L_5FC1                          ; 596C   0004 035C 03C1

        PSHR    R5                              ; 596F   0275
        CMPI    #$000B, R0                      ; 5970   0378 000B
        BEQ     L_5982                          ; 5972   0204 000E

        CMPI    #$0001, R0                      ; 5974   0378 0001
        BEQ     L_59FC                          ; 5976   0204 0084

        MVI     G_0179, R2                      ; 5978   0282 0179
        TSTR    R2                              ; 597A   0092
        BEQ     L_5956                          ; 597B   0224 0026

        MVI     G_017C, R2                      ; 597D   0282 017C
        TSTR    R2                              ; 597F   0092
        BNEQ    L_59D0                          ; 5980   020C 004E

L_5982:
        CLRR    R2                              ; 5982   01D2
        MVII    #$02F1, R4                      ; 5983   02BC 02F1
        MVO@    R2,     R4                      ; 5985   0262
        MVO@    R2,     R4                      ; 5986   0262
        MVII    #$0012, R0                      ; 5987   02B8 0012
        MVO@    R2,     R4                      ; 5989   0262
        MVO@    R2,     R4                      ; 598A   0262
        MVII    #$016D, R4                      ; 598B   02BC 016D

        JSR     R5,     X_FILL_ZERO             ; 598D   0004 0114 0338
        JSR     R5,     L_5F2F                  ; 5990   0004 015C 032F
        JSR     R5,     L_5F41                  ; 5993   0004 015C 0341
        JSR     R5,     L_5E0A                  ; 5996   0004 015C 020A

        MVII    #$0007, R2                      ; 5999   02BA 0007
        MVO     R2,     G_016D                  ; 599B   0242 016D
        MVO     R2,     G_016E                  ; 599D   0242 016E
        SLR     R2,     2                       ; 599F   0066
        MVO     R2,     G_017C                  ; 59A0   0242 017C
        MVO     R2,     G_0179                  ; 59A2   0242 0179
        MVII    #$02DD, R4                      ; 59A4   02BC 02DD
        SDBD                                    ; 59A6   0001
        MVII    #$0602, R3                      ; 59A7   02BB 0002 0006

        JSR     R5,     X_PRINT_R5              ; 59AA   0004 0118 007B
        STRING  "PLAYERS?"                      ; 59AD  
        DECLE   $0000                           ; 59B5   0000

        JSR     R5,     X_PLAY_MUS2             ; 59B6   0004 0118 035D
        DECLE   $014C                           ; 59B9  Note (short)
        DECLE   $019C                           ; 59BA  Note (short)
        DECLE   $0004                           ; 59BB  Note (short)
        DECLE   $019C                           ; 59BC  Note (short)
        DECLE   $01DC                           ; 59BD  Note (short)
        DECLE   $0004                           ; 59BE  Note (short)
        DECLE   $01DC                           ; 59BF  Note (short)
        DECLE   $01BC                           ; 59C0  Note (short)
        DECLE   $019C                           ; 59C1  Note (short)
        DECLE   $016C                           ; 59C2  Note (short)
        DECLE   $014E                           ; 59C3  Note (short)
        DECLE   $014C                           ; 59C4  Note (short)
        DECLE   $019C                           ; 59C5  Note (short)
        DECLE   $0004                           ; 59C6  Note (short)
        DECLE   $019C                           ; 59C7  Note (short)
        DECLE   $01DC                           ; 59C8  Note (short)
        DECLE   $0004                           ; 59C9  Note (short)
        DECLE   $01DC                           ; 59CA  Note (short)
        DECLE   $01BC                           ; 59CB  Note (short)
        DECLE   $0006                           ; 59CC  Note (short)
        DECLE   $019F                           ; 59CD  Note (short)
        DECLE   $0000                           ; 59CE  End of music

        PULR    R7                              ; 59CF   02B7

L_59D0:
        CMPI    #$0001, R2                      ; 59D0   037A 0001
        BNEQ    L_5A04                          ; 59D2   020C 0030

        MVII    #$0008, R3                      ; 59D4   02BB 0008
        CMPI    #$0000, R0                      ; 59D6   0378 0000
        BEQ     L_59E1                          ; 59D8   0204 0007

        CMPI    #$000A, R0                      ; 59DA   0378 000A
        BNEQ    L_5956                          ; 59DC   022C 0087

        CLRR    R3                              ; 59DE   01DB
        MVO     R3,     G_016E                  ; 59DF   0243 016E
L_59E1:
        INCR    R2                              ; 59E1   000A
        MVO     R2,     G_017C                  ; 59E2   0242 017C
        SDBD                                    ; 59E4   0001
        ADDI    #$068D, R3                      ; 59E5   02FB 008D 0006
        MVII    #$02E6, R4                      ; 59E8   02BC 02E6
        MVO@    R3,     R4                      ; 59EA   0263
        SDBD                                    ; 59EB   0001
        MVII    #$0602, R3                      ; 59EC   02BB 0002 0006
        MVII    #$02E8, R4                      ; 59EF   02BC 02E8

        JSR     R5,     X_PRINT_R5              ; 59F1   0004 0118 007B
        STRING  "LEVEL?"                        ; 59F4  
        DECLE   $0000                           ; 59FA   0000

        PULR    R7                              ; 59FB   02B7

L_59FC:
        MVI     G_017A, R1                      ; 59FC   0281 017A
        TSTR    R1                              ; 59FE   0089
        BNEQ    L_5956                          ; 59FF   022C 00AA

        MVO     R0,     G_0173                  ; 5A01   0240 0173
        PULR    R7                              ; 5A03   02B7

L_5A04:
        CLRR    R2                              ; 5A04   01D2
        CMPI    #$0007, R0                      ; 5A05   0378 0007
        BEQ     L_5A15                          ; 5A07   0204 000C

        CMPI    #$0008, R0                      ; 5A09   0378 0008
        BEQ     L_5A13                          ; 5A0B   0204 0006

        CMPI    #$0009, R0                      ; 5A0D   0378 0009
        BNEQ    L_5956                          ; 5A0F   022C 00BA

        ADDI    #$0004, R2                      ; 5A11   02FA 0004
L_5A13:
        ADDI    #$0004, R2                      ; 5A13   02FA 0004
L_5A15:
        MVO     R2,     G_016F                  ; 5A15   0242 016F
        MVO     R2,     G_0170                  ; 5A17   0242 0170
        CLRR    R2                              ; 5A19   01D2
        MVO     R2,     G_0179                  ; 5A1A   0242 0179
        MVO     R2,     G_017C                  ; 5A1C   0242 017C
        J       L_5EC2                          ; 5A1E   0004 035C 02C2

        PSHR    R5                              ; 5A21   0275
        MVI     G_035E, R3                      ; 5A22   0283 035E
        DECR    R3                              ; 5A24   0013
        MVO     R3,     G_035E                  ; 5A25   0243 035E
        MVI     G_017A, R0                      ; 5A27   0280 017A
        TSTR    R0                              ; 5A29   0080
        BNEQ    L_5956                          ; 5A2A   022C 00D5

        MVI     G_0175, R2                      ; 5A2C   0282 0175
        TSTR    R2                              ; 5A2E   0092
        BEQ     L_5A5F                          ; 5A2F   0204 002E

        CLRR    R3                              ; 5A31   01DB
        MVO     R3,     G_017D                  ; 5A32   0243 017D
        MVI     G_032C, R3                      ; 5A34   0283 032C
        DECR    R2                              ; 5A36   0012
        BEQ     L_5A49                          ; 5A37   0204 0010

        CMPI    #$0006, R2                      ; 5A39   037A 0006
        BLT     L_5A43                          ; 5A3B   0205 0006

        CMPI    #$0009, R2                      ; 5A3D   037A 0009
        BLT     L_5A46                          ; 5A3F   0205 0005

        DECR    R3                              ; 5A41   0013
        INCR    R7                              ; 5A42   000F

L_5A43:
        INCR    R3                              ; 5A43   000B
L_5A44:
        MVO     R3,     G_032C                  ; 5A44   0243 032C
L_5A46:
        MVO     R2,     G_0175                  ; 5A46   0242 0175
        PULR    R7                              ; 5A48   02B7

L_5A49:
        MVO     R2,     G_017E                  ; 5A49   0242 017E
        MVO     R2,     G_0175                  ; 5A4B   0242 0175
        SDBD                                    ; 5A4D   0001
        ANDI    #$FF80, R3                      ; 5A4E   03BB 0080 00FF
        ADDI    #$0040, R3                      ; 5A51   02FB 0040
        MVO     R3,     G_032C                  ; 5A53   0243 032C
        MVI     G_0171, R1                      ; 5A55   0281 0171
        MVI     G_0174, R0                      ; 5A57   0280 0174

        JSR     R5,     L_58B7                  ; 5A59   0004 0158 00B7

        J       L_5FC1                          ; 5A5C   0004 035C 03C1

L_5A5F:
        MVI     G_017E, R3                      ; 5A5F   0283 017E
        TSTR    R3                              ; 5A61   009B
        BEQ     L_5956                          ; 5A62   0224 010D

        DECR    R3                              ; 5A64   0013
        MVO     R3,     G_017E                  ; 5A65   0243 017E
        BNEQ    L_5956                          ; 5A67   022C 0112

        JSR     R5,     L_5D29                  ; 5A69   0004 015C 0129

        PULR    R7                              ; 5A6C   02B7

        PSHR    R5                              ; 5A6D   0275
        MVI     G_017A, R0                      ; 5A6E   0280 017A
        TSTR    R0                              ; 5A70   0080
        BNEQ    L_5B43                          ; 5A71   020C 00D0

        MVI     G_0324, R0                      ; 5A73   0280 0324
        MOVR    R0,     R1                      ; 5A75   0081
        ANDI    #$00FF, R0                      ; 5A76   03B8 00FF
        CMPI    #$000C, R0                      ; 5A78   0378 000C
        BGT     L_5B1D                          ; 5A7A   020E 00A1

        JSR     R5,     L_5F41                  ; 5A7C   0004 015C 0341

        CLRR    R0                              ; 5A7F   01C0
        MVO     R0,     G_017B                  ; 5A80   0240 017B
        MVO     R0,     G_0354                  ; 5A82   0240 0354

        JSR     R5,     L_5D74                  ; 5A84   0004 015C 0174
        JSR     R5,     .EXEC.A83               ; 5A87   0004 0118 0283

        MVII    #$0004, R2                      ; 5A8A   02BA 0004
        MVO     R2,     G_017A                  ; 5A8C   0242 017A
        MVO     R2,     G_017B                  ; 5A8E   0242 017B
        MVII    #$0326, R3                      ; 5A90   02BB 0326
        SDBD                                    ; 5A92   0001
        MVII    #$54E1, R4                      ; 5A93   02BC 00E1 0054

        JSR     R5,     L_5F68                  ; 5A96   0004 015C 0368
        JSR     R5,     L_5F14                  ; 5A99   0004 015C 0314

        MVO     R2,     G_012A                  ; 5A9C   0242 012A

        JSR     R5,     L_5F29                  ; 5A9E   0004 015C 0329

        ADDI    #$0005, R0                      ; 5AA1   02F8 0005
        ANDI    #$000F, R0                      ; 5AA3   03B8 000F
        CMPI    #$0008, R0                      ; 5AA5   0378 0008
        BLT     L_5AAD                          ; 5AA7   0205 0004

        SDBD                                    ; 5AA9   0001
        XORI    #$1008, R0                      ; 5AAA   03F8 0008 0010
L_5AAD:
        MVII    #$0003, R2                      ; 5AAD   02BA 0003
        MVII    #$0336, R3                      ; 5AAF   02BB 0336
L_5AB1:
        MVI@    R3,     R4                      ; 5AB1   029C
        ADDR    R0,     R4                      ; 5AB2   00C4
        MVO@    R4,     R3                      ; 5AB3   025C
        INCR    R3                              ; 5AB4   000B
        DECR    R2                              ; 5AB5   0012
        BPL     L_5AB1                          ; 5AB6   0223 0006

        MVII    #$0200, R4                      ; 5AB8   02BC 0200
        SDBD                                    ; 5ABA   0001
        MVII    #$1898, R3                      ; 5ABB   02BB 0098 0018
L_5ABE:
        MVO@    R3,     R4                      ; 5ABE   0263
        CMPI    #$0214, R4                      ; 5ABF   037C 0214
        BLT     L_5ABE                          ; 5AC1   0225 0004

        CLRR    R3                              ; 5AC3   01DB
L_5AC4:
        MVO@    R3,     R4                      ; 5AC4   0263
        MVO@    R3,     R4                      ; 5AC5   0263
        CMPI    #$02F0, R4                      ; 5AC6   037C 02F0
        BLT     L_5AC4                          ; 5AC8   0225 0005

        MVII    #$02C6, R4                      ; 5ACA   02BC 02C6
        SDBD                                    ; 5ACC   0001
        MVII    #$08AA, R3                      ; 5ACD   02BB 00AA 0008
        MVO@    R3,     R4                      ; 5AD0   0263

        JSR     R5,     L_5CF0                  ; 5AD1   0004 015C 00F0

        MVII    #$0008, R2                      ; 5AD4   02BA 0008
        MVO     R2,     G_0172                  ; 5AD6   0242 0172
        MVII    #$0229, R1                      ; 5AD8   02B9 0229
L_5ADA:
        MVII    #$0010, R0                      ; 5ADA   02B8 0010

        JSR     R5,     X_RAND2                 ; 5ADC   0004 0114 029E

        MOVR    R1,     R4                      ; 5ADF   008C
        ADDI    #$0014, R1                      ; 5AE0   02F9 0014
        ADDR    R0,     R4                      ; 5AE2   00C4
        SDBD                                    ; 5AE3   0001
        MVII    #$3FFF, R0                      ; 5AE4   02B8 00FF 003F

        JSR     R5,     X_RAND2                 ; 5AE7   0004 0114 029E

        SDBD                                    ; 5AEA   0001
        ANDI    #$3600, R0                      ; 5AEB   03B8 0000 0036
        BNEQ    L_5AF4                          ; 5AEE   020C 0004

        SDBD                                    ; 5AF0   0001
        MVII    #$2400, R0                      ; 5AF1   02B8 0000 0024
L_5AF4:
        MOVR    R0,     R3                      ; 5AF4   0083
        MVII    #$0007, R0                      ; 5AF5   02B8 0007

        JSR     R5,     X_RAND2                 ; 5AF7   0004 0114 029E

        ADD     G_0173, R0                      ; 5AFA   02C0 0173
        SLL     R0,     2                       ; 5AFC   004C
        SLL     R0,     1                       ; 5AFD   0048
        ADDR    R0,     R3                      ; 5AFE   00C3
        SDBD                                    ; 5AFF   0001
        ADDI    #$08B0, R3                      ; 5B00   02FB 00B0 0008
        MVO@    R3,     R4                      ; 5B03   0263
        DECR    R2                              ; 5B04   0012
        BGT     L_5ADA                          ; 5B05   022E 002C

        JSR     R5,     X_PLAY_SFX2             ; 5B07   0004 0118 03BE
        DECLE   $00A0                           ; 5B0A  SFX prio
        DECLE   $03E9                           ; 5B0B  SFX data
        DECLE   $0300,  $01AB                   ; 5B0C  SFX data
        DECLE   $008F,  $000A                   ; 5B0E  SFX data
        DECLE   $0300,  $011D                   ; 5B10  SFX data
        DECLE   $008F,  $0014                   ; 5B12  SFX data
        DECLE   $0300,  $01AB                   ; 5B14  SFX data
        DECLE   $008F,  $000A                   ; 5B16  SFX data
        DECLE   $0300,  $011D                   ; 5B18  SFX data
        DECLE   $008F,  $0014                   ; 5B1A  SFX data
        DECLE   $02CF                           ; 5B1C  SFX end

L_5B1D:
        CMPI    #$00A1, R0                      ; 5B1D   0378 00A1
        BLT     L_5B2C                          ; 5B1F   0205 000B

        SDBD                                    ; 5B21   0001
        MVII    #$0BA1, R1                      ; 5B22   02B9 00A1 000B
        MVO     R1,     G_0324                  ; 5B25   0241 0324
        CLRR    R1                              ; 5B27   01C9
        MVO     R1,     G_017D                  ; 5B28   0241 017D
        MVO     R1,     G_0126                  ; 5B2A   0241 0126
L_5B2C:
        MVI     G_0330, R0                      ; 5B2C   0280 0330
        ANDI    #$007F, R0                      ; 5B2E   03B8 007F
        CMPI    #$0044, R0                      ; 5B30   0378 0044
        BLT     L_5BF4                          ; 5B32   0205 00C0

        MVII    #$0003, R2                      ; 5B34   02BA 0003
        MVO     R2,     G_0176                  ; 5B36   0242 0176
        DECR    R2                              ; 5B38   0012
        MVII    #$0328, R3                      ; 5B39   02BB 0328
        SDBD                                    ; 5B3B   0001
        MVII    #$54C1, R4                      ; 5B3C   02BC 00C1 0054

        JSR     R5,     L_5F68                  ; 5B3F   0004 015C 0368

        PULR    R7                              ; 5B42   02B7

L_5B43:
        CLRR    R2                              ; 5B43   01D2
        MVI     G_0324, R0                      ; 5B44   0280 0324
        MOVR    R0,     R1                      ; 5B46   0081
        SDBD                                    ; 5B47   0001
        ANDI    #$FF00, R1                      ; 5B48   03B9 0000 00FF
        ADDI    #$000B, R1                      ; 5B4B   02F9 000B
        ANDI    #$00FF, R0                      ; 5B4D   03B8 00FF
        CMPI    #$000A, R0                      ; 5B4F   0378 000A
        BLT     L_5B5D                          ; 5B51   0205 000A

        CMPI    #$00DC, R0                      ; 5B53   0378 00DC
        BGT     L_5B5D                          ; 5B55   020E 0006

        CMPI    #$009E, R0                      ; 5B57   0378 009E
        BLE     L_5B61                          ; 5B59   0206 0006

        ADDI    #$0092, R1                      ; 5B5B   02F9 0092
L_5B5D:
        MVO     R2,     G_0126                  ; 5B5D   0242 0126
        MVO     R1,     G_0324                  ; 5B5F   0241 0324
L_5B61:
        MVI     G_032C, R0                      ; 5B61   0280 032C
        MOVR    R0,     R1                      ; 5B63   0081
        SDBD                                    ; 5B64   0001
        ANDI    #$FF80, R1                      ; 5B65   03B9 0080 00FF
        ADDI    #$0013, R1                      ; 5B68   02F9 0013
        ANDI    #$007F, R0                      ; 5B6A   03B8 007F
        CMPI    #$0012, R0                      ; 5B6C   0378 0012
        BLT     L_5B7A                          ; 5B6E   0205 000A

        CMPI    #$0073, R0                      ; 5B70   0378 0073
        BGT     L_5B7A                          ; 5B72   020E 0006

        CMPI    #$0050, R0                      ; 5B74   0378 0050
        BLE     L_5BF4                          ; 5B76   0206 007C

        ADDI    #$003C, R1                      ; 5B78   02F9 003C
L_5B7A:
        MVO     R2,     G_0136                  ; 5B7A   0242 0136
        MVO     R1,     G_032C                  ; 5B7C   0241 032C
        PULR    R7                              ; 5B7E   02B7

        PSHR    R5                              ; 5B7F   0275
        MVI     G_017A, R0                      ; 5B80   0280 017A
        TSTR    R0                              ; 5B82   0080
        BEQ     L_5BF4                          ; 5B83   0204 006F

        MVII    #$0002, R0                      ; 5B85   02B8 0002
        MVO     R0,     G_034E                  ; 5B87   0240 034E
        MVI     G_017B, R0                      ; 5B89   0280 017B
        ADD     G_0179, R0                      ; 5B8B   02C0 0179
        BNEQ    L_5BF4                          ; 5B8D   020C 0065

        MVI     G_0324, R0                      ; 5B8F   0280 0324
        ANDI    #$00FF, R0                      ; 5B91   03B8 00FF
        MVI     G_0326, R1                      ; 5B93   0281 0326
        ANDI    #$00FF, R1                      ; 5B95   03B9 00FF
        SUBR    R1,     R0                      ; 5B97   0108
        MVI     G_032E, R1                      ; 5B98   0281 032E
        SDBD                                    ; 5B9A   0001
        ANDI    #$0400, R1                      ; 5B9B   03B9 0000 0004
        NEGR    R1                              ; 5B9E   0021
        XORR    R0,     R1                      ; 5B9F   01C1
        BMI     L_5D36                          ; 5BA0   020B 0194
        PULR    R7                              ; 5BA2   02B7

        PSHR    R5                              ; 5BA3   0275
        MVI     G_017B, R0                      ; 5BA4   0280 017B
        TSTR    R0                              ; 5BA6   0080
        BNEQ    L_5BE6                          ; 5BA7   020C 003D

        MVI     G_017A, R0                      ; 5BA9   0280 017A
        TSTR    R0                              ; 5BAB   0080
        BEQ     L_5BE6                          ; 5BAC   0204 0038

        MVI     G_0324, R0                      ; 5BAE   0280 0324
        SUB     G_0326, R0                      ; 5BB0   0300 0326
        BPL     L_5BB5                          ; 5BB2   0203 0001

        NEGR    R0                              ; 5BB4   0020
L_5BB5:
        CMPI    #$0014, R0                      ; 5BB5   0378 0014
        BGT     L_5BE6                          ; 5BB7   020E 002D

        MVI     G_0126, R3                      ; 5BB9   0283 0126
        TSTR    R3                              ; 5BBB   009B
        BNEQ    L_5BC2                          ; 5BBC   020C 0004

        CMPI    #$0005, R0                      ; 5BBE   0378 0005
        BGT     L_5BE6                          ; 5BC0   020E 0024

L_5BC2:
        MVII    #$032A, R3                      ; 5BC2   02BB 032A
        MVI     G_0342, R0                      ; 5BC4   0280 0342
        TSTR    R0                              ; 5BC6   0080
        BEQ     L_5BD0                          ; 5BC7   0204 0007

        MVI     G_0343, R0                      ; 5BC9   0280 0343
        TSTR    R0                              ; 5BCB   0080
        BNEQ    L_5BE6                          ; 5BCC   020C 0018

        ADDI    #$0001, R3                      ; 5BCE   02FB 0001
L_5BD0:
        PSHR    R3                              ; 5BD0   0273
        SDBD                                    ; 5BD1   0001
        MVII    #$552F, R4                      ; 5BD2   02BC 002F 0055

        JSR     R5,     L_5F6A                  ; 5BD5   0004 015C 036A

        MVI     G_0326, R2                      ; 5BD8   0282 0326
        PULR    R3                              ; 5BDA   02B3
        MVO@    R2,     R3                      ; 5BDB   025A

        JSR     R5,     L_5FA1                  ; 5BDC   0004 015C 03A1

        MVII    #$000C, R1                      ; 5BDF   02B9 000C
        MVO     R1,     G_0351                  ; 5BE1   0241 0351
        SLR     R1,     2                       ; 5BE3   0065
        MVO     R1,     G_0346                  ; 5BE4   0241 0346
L_5BE6:
        MVII    #$000B, R2                      ; 5BE6   02BA 000B

        JSR     R5,     L_5F29                  ; 5BE8   0004 015C 0329

        CMPI    #$0008, R0                      ; 5BEB   0378 0008
        BLT     L_5BF1                          ; 5BED   0205 0002

        MVII    #$0008, R0                      ; 5BEF   02B8 0008
L_5BF1:
        SUBR    R0,     R2                      ; 5BF1   0102
        MVO     R2,     G_0160                  ; 5BF2   0242 0160
L_5BF4:
        PULR    R7                              ; 5BF4   02B7

        PSHR    R5                              ; 5BF5   0275
        MVI     G_017D, R0                      ; 5BF6   0280 017D
        TSTR    R0                              ; 5BF8   0080
        BEQ     L_5BF4                          ; 5BF9   0224 0006
        J       L_5FC1                          ; 5BFB   0004 035C 03C1

        PSHR    R5                              ; 5BFE   0275
        MVI     G_017A, R0                      ; 5BFF   0280 017A
        TSTR    R0                              ; 5C01   0080
        BNEQ    L_5BF4                          ; 5C02   022C 000F

        MVI     G_0176, R2                      ; 5C04   0282 0176
        TSTR    R2                              ; 5C06   0092
        BEQ     L_5BF4                          ; 5C07   0224 0014

        DECR    R2                              ; 5C09   0012
        MVO     R2,     G_0176                  ; 5C0A   0242 0176

        JSR     R5,     L_5F29                  ; 5C0C   0004 015C 0329

        CMPI    #$0004, R0                      ; 5C0F   0378 0004
        BLT     L_5BF4                          ; 5C11   0225 001E

        CMPI    #$0002, R2                      ; 5C13   037A 0002
        BEQ     L_5C23                          ; 5C15   0204 000C

        MVI     G_0348, R1                      ; 5C17   0281 0348
        INCR    R1                              ; 5C19   0009
        MVO     R1,     G_0348                  ; 5C1A   0241 0348
        MVI     G_013E, R1                      ; 5C1C   0281 013E
        ADDI    #$000A, R1                      ; 5C1E   02F9 000A
        MVO     R1,     G_013E                  ; 5C20   0241 013E
        PULR    R7                              ; 5C22   02B7

L_5C23:
        MVII    #$001E, R0                      ; 5C23   02B8 001E

        JSR     R5,     X_RAND2                 ; 5C25   0004 0114 029E

        ADDI    #$000F, R0                      ; 5C28   02F8 000F
        MVO     R0,     G_012E                  ; 5C2A   0240 012E
        MVII    #$000A, R0                      ; 5C2C   02B8 000A
        MVO     R0,     G_013E                  ; 5C2E   0240 013E
        MVII    #$0001, R0                      ; 5C30   02B8 0001
        MVO     R0,     G_0349                  ; 5C32   0240 0349

        JSR     R5,     X_PLAY_SFX2             ; 5C34   0004 0118 03BE
        DECLE   $008E                           ; 5C37  SFX prio
        DECLE   $002F                           ; 5C38  SFX data
        DECLE   $03E9                           ; 5C39  SFX data
        DECLE   $0040,  $02F9                   ; 5C3A  SFX data
        DECLE   $001C,  $0300                   ; 5C3C  SFX data
        DECLE   $00B7                           ; 5C3E  SFX data
        DECLE   $000B                           ; 5C3F  SFX data
        DECLE   $00F1,  $03EC                   ; 5C40  SFX data
        DECLE   $02AB                           ; 5C42  SFX data
        DECLE   $02CF                           ; 5C43  SFX end


        ADCR    R7                              ; 5C44   002F

        PSHR    R5                              ; 5C45   0275
L_5C46:
        MVI     G_0324, R0                      ; 5C46   0280 0324
        PSHR    R0                              ; 5C48   0270
        MVII    #$0001, R3                      ; 5C49   02BB 0001

        JSR     R5,     L_5F46                  ; 5C4B   0004 015C 0346

        MVII    #$0324, R3                      ; 5C4E   02BB 0324
        SDBD                                    ; 5C50   0001
        MVII    #$5519, R4                      ; 5C51   02BC 0019 0055

        JSR     R5,     L_5F6A                  ; 5C54   0004 015C 036A

        PULR    R0                              ; 5C57   02B0
        MVO     R0,     G_0324                  ; 5C58   0240 0324

        JSR     R5,     X_PLAY_SFX2             ; 5C5A   0004 0118 03BE
        DECLE   $009A                           ; 5C5D  SFX prio
        DECLE   $02F9                           ; 5C5E  SFX data
        DECLE   $0137                           ; 5C5F  SFX data
        DECLE   $004D                           ; 5C60  SFX data
        DECLE   $000C,  $0200                   ; 5C61  SFX data
        DECLE   $038B                           ; 5C63  SFX data
        DECLE   $022B                           ; 5C64  SFX data
        DECLE   $002C,  $0300                   ; 5C65  SFX data
        DECLE   $008F,  $0032                   ; 5C67  SFX data
        DECLE   $02CF                           ; 5C69  SFX end


        PSHR    R5                              ; 5C6A   0275

        JSR     R5,     L_5DE2                  ; 5C6B   0004 015C 01E2

        DECR    R0                              ; 5C6E   0010
        MVO@    R0,     R1                      ; 5C6F   0248
        TSTR    R0                              ; 5C70   0080
        BNEQ    L_5C7F                          ; 5C71   020C 000C

        JSR     R5,     L_5DE8                  ; 5C73   0004 015C 01E8

        TSTR    R0                              ; 5C76   0080
        BNEQ    L_5C7F                          ; 5C77   020C 0006

        JSR     R5,     L_5D8E                  ; 5C79   0004 015C 018E

        J       L_5DAC                          ; 5C7C   0004 035C 01AC
L_5C7F:
        J       L_5EEE                          ; 5C7F   0004 035C 02EE
        MOVR    R5,     R7                      ; 5C82   00AF

        PSHR    R5                              ; 5C83   0275
        MVII    #$0002, R2                      ; 5C84   02BA 0002
        MVO     R2,     G_034E                  ; 5C86   0242 034E
        MVI     G_0326, R0                      ; 5C88   0280 0326
        ANDI    #$00FF, R0                      ; 5C8A   03B8 00FF
        CMPI    #$000C, R0                      ; 5C8C   0378 000C
        BLT     L_5C95                          ; 5C8E   0205 0005

        CMPI    #$009C, R0                      ; 5C90   0378 009C
        BLT     L_5BF4                          ; 5C92   0225 009F

        NEGR    R0                              ; 5C94   0020
L_5C95:
        J       L_5D36                          ; 5C95   0004 035C 0136

        PSHR    R5                              ; 5C98   0275

        JSR     R5,     L_5DE2                  ; 5C99   0004 015C 01E2

        TSTR    R0                              ; 5C9C   0080
        BNEQ    L_5CB6                          ; 5C9D   020C 0017

        JSR     R5,     L_5DE8                  ; 5C9F   0004 015C 01E8

        TSTR    R0                              ; 5CA2   0080
        BNEQ    L_5CB3                          ; 5CA3   020C 000E

        MVII    #$0002, R2                      ; 5CA5   02BA 0002
        MVO     R2,     G_0179                  ; 5CA7   0242 0179
        CLRR    R3                              ; 5CA9   01DB

        JSR     R5,     L_5F44                  ; 5CAA   0004 015C 0344
        JSR     R5,     L_5DF2                  ; 5CAD   0004 015C 01F2

        J       L_5DAC                          ; 5CB0   0004 035C 01AC
L_5CB3:
        J       L_5EC2                          ; 5CB3   0004 035C 02C2

L_5CB6:
        CLRR    R0                              ; 5CB6   01C0
        MVO     R0,     G_017B                  ; 5CB7   0240 017B

        JSR     R5,     L_5D74                  ; 5CB9   0004 015C 0174

        J       L_5CF1                          ; 5CBC   0004 035C 00F1

        PSHR    R5                              ; 5CBF   0275
        PSHR    R3                              ; 5CC0   0273
        SDBD                                    ; 5CC1   0001
        MVII    #$54A5, R4                      ; 5CC2   02BC 00A5 0054
        CMPI    #$0003, R3                      ; 5CC5   037B 0003
        BNEQ    L_5CCD                          ; 5CC7   020C 0004

        SDBD                                    ; 5CC9   0001
        MVII    #$54B3, R4                      ; 5CCA   02BC 00B3 0054
L_5CCD:
        ADDI    #$0324, R3                      ; 5CCD   02FB 0324

        JSR     R5,     L_5F6A                  ; 5CCF   0004 015C 036A

        MVI     G_0179, R0                      ; 5CD2   0280 0179
        TSTR    R0                              ; 5CD4   0080
        BNEQ    L_5CDA                          ; 5CD5   020C 0003

        JSR     R5,     L_5FA1                  ; 5CD7   0004 015C 03A1

L_5CDA:
        PULR    R3                              ; 5CDA   02B3
        CMPI    #$0003, R3                      ; 5CDB   037B 0003
        BNEQ    L_5CEA                          ; 5CDD   020C 000B

        JSR     R5,     L_5F29                  ; 5CDF   0004 015C 0329

        CMPI    #$0005, R0                      ; 5CE2   0378 0005
        BLT     L_5CEA                          ; 5CE4   0205 0004

        MVII    #$0023, R0                      ; 5CE6   02B8 0023
        MVO     R0,     G_012C                  ; 5CE8   0240 012C
L_5CEA:
        PULR    R7                              ; 5CEA   02B7

        MVI     G_0347, R0                      ; 5CEB   0280 0347
        MVO     R0,     G_0346                  ; 5CED   0240 0346
        MOVR    R5,     R7                      ; 5CEF   00AF

L_5CF0:
        PSHR    R5                              ; 5CF0   0275

L_5CF1:
        JSR     R5,     L_5E0A                  ; 5CF1   0004 015C 020A

        SDBD                                    ; 5CF4   0001
        MVII    #$0EA0, R3                      ; 5CF5   02BB 00A0 000E
        ADD     G_0171, R3                      ; 5CF8   02C3 0171
        MVII    #$02DF, R4                      ; 5CFA   02BC 02DF

        JSR     R5,     L_5DE2                  ; 5CFC   0004 015C 01E2

L_5CFF:
        CMPI    #$0002, R0                      ; 5CFF   0378 0002
        BLT     L_5D07                          ; 5D01   0205 0004

        MVO@    R3,     R4                      ; 5D03   0263
        DECR    R0                              ; 5D04   0010
        B       L_5CFF                          ; 5D05   0220 0007

L_5D07:
        MVII    #$02E6, R4                      ; 5D07   02BC 02E6
        MVI     G_0171, R2                      ; 5D09   0282 0171
        J       L_5E18                          ; 5D0B   0004 035C 0218

L_5D0E:
        MVI     G_0126, R0                      ; 5D0E   0280 0126
        TSTR    R0                              ; 5D10   0080
        BEQ     L_5D28                          ; 5D11   0204 0015

        SDBD                                    ; 5D13   0001
        MVII    #$FBFF, R1                      ; 5D14   02B9 00FF 00FB
        MVI     G_032C, R2                      ; 5D17   0282 032C
        MVI     G_032D, R3                      ; 5D19   0283 032D
        ANDR    R1,     R2                      ; 5D1B   018A
        ANDR    R1,     R3                      ; 5D1C   018B
        ANDI    #$0080, R0                      ; 5D1D   03B8 0080
        BEQ     L_5D24                          ; 5D1F   0204 0003

        COMR    R1                              ; 5D21   0019
        ADDR    R1,     R2                      ; 5D22   00CA
        ADDR    R1,     R3                      ; 5D23   00CB
L_5D24:
        MVO     R3,     G_032D                  ; 5D24   0243 032D
        MVO     R2,     G_032C                  ; 5D26   0242 032C
L_5D28:
        MOVR    R5,     R7                      ; 5D28   00AF

L_5D29:
        CLRR    R0                              ; 5D29   01C0
        MVO     R0,     G_0126                  ; 5D2A   0240 0126
        MVO     R0,     G_0136                  ; 5D2C   0240 0136
        NOP                                     ; 5D2E   0034
        MVO     R0,     G_0344                  ; 5D2F   0240 0344
        MVO     R0,     G_0345                  ; 5D31   0240 0345
        MVO     R0,     G_017D                  ; 5D33   0240 017D
        MOVR    R5,     R7                      ; 5D35   00AF

L_5D36:
        JSR     R5,     L_5F14                  ; 5D36   0004 015C 0314

        NEGR    R2                              ; 5D39   0022
        MVO     R2,     G_012A                  ; 5D3A   0242 012A
        MVII    #$0008, R1                      ; 5D3C   02B9 0008
        SDBD                                    ; 5D3E   0001
        MVII    #$0400, R3                      ; 5D3F   02BB 0000 0004
        MVI     G_0326, R5                      ; 5D42   0285 0326
        MVI     G_032E, R2                      ; 5D44   0282 032E
        ANDR    R3,     R2                      ; 5D46   019A
        BNEQ    L_5D4B                          ; 5D47   020C 0002

        SUBI    #$0018, R5                      ; 5D49   033D 0018
L_5D4B:
        TSTR    R0                              ; 5D4B   0080
        BMI     L_5D57                          ; 5D4C   020B 0009

        NEGR    R1                              ; 5D4E   0021
        MVI     G_012A, R3                      ; 5D4F   0283 012A
        NEGR    R3                              ; 5D51   0023
        MVO     R3,     G_012A                  ; 5D52   0243 012A
        CLRR    R3                              ; 5D54   01DB
        ADDI    #$0018, R5                      ; 5D55   02FD 0018
L_5D57:
        MVO     R5,     G_0326                  ; 5D57   0245 0326
        SDBD                                    ; 5D59   0001
        MVII    #$FBFF, R0                      ; 5D5A   02B8 00FF 00FB
        MVI     G_032E, R2                      ; 5D5D   0282 032E
        ANDR    R0,     R2                      ; 5D5F   0182
        ADDR    R3,     R2                      ; 5D60   00DA
        MVO     R2,     G_032E                  ; 5D61   0242 032E
        SDBD                                    ; 5D63   0001
        ADDI    #$4080, R3                      ; 5D64   02FB 0080 0040
        MVII    #$032F, R4                      ; 5D67   02BC 032F
        MVO@    R3,     R4                      ; 5D69   0263
        MVO@    R3,     R4                      ; 5D6A   0263
        MVO@    R3,     R4                      ; 5D6B   0263
        MVII    #$012C, R4                      ; 5D6C   02BC 012C
        MVO@    R1,     R4                      ; 5D6E   0261
        INCR    R4                              ; 5D6F   000C
        MVO@    R1,     R4                      ; 5D70   0261
        INCR    R4                              ; 5D71   000C
        MVO@    R1,     R4                      ; 5D72   0261
        PULR    R7                              ; 5D73   02B7

L_5D74:
        PSHR    R5                              ; 5D74   0275
L_5D75:
        MVI     G_017B, R2                      ; 5D75   0282 017B
        TSTR    R2                              ; 5D77   0092
        BNEQ    L_5D8D                          ; 5D78   020C 0013

        MVO     R2,     G_017D                  ; 5D7A   0242 017D
        MVII    #$0002, R2                      ; 5D7C   02BA 0002
        MVO     R2,     G_017B                  ; 5D7E   0242 017B
        MVII    #$0324, R3                      ; 5D80   02BB 0324
        SDBD                                    ; 5D82   0001
        MVII    #$5489, R4                      ; 5D83   02BC 0089 0054

        JSR     R5,     L_5F68                  ; 5D86   0004 015C 0368

        MVII    #$00CF, R0                      ; 5D89   02B8 00CF
        MVO     R0,     G_032C                  ; 5D8B   0240 032C
L_5D8D:
        PULR    R7                              ; 5D8D   02B7

L_5D8E:
        PSHR    R5                              ; 5D8E   0275

        JSR     R5,     L_5F41                  ; 5D8F   0004 015C 0341
        JSR     R5,     L_5F2F                  ; 5D92   0004 015C 032F

        CLRR    R2                              ; 5D95   01D2
        MVO     R2,     G_017C                  ; 5D96   0242 017C
        INCR    R2                              ; 5D98   000A
        MVO     R2,     G_0179                  ; 5D99   0242 0179
        INCR    R2                              ; 5D9B   000A
        MVII    #$0326, R3                      ; 5D9C   02BB 0326
        SDBD                                    ; 5D9E   0001
        MVII    #$54A5, R4                      ; 5D9F   02BC 00A5 0054

        JSR     R5,     L_5F68                  ; 5DA2   0004 015C 0368
        JSR     R5,     L_5EC1                  ; 5DA5   0004 015C 02C1

        J       L_5DF3                          ; 5DA8   0004 035C 01F3

        PSHR    R5                              ; 5DAB   0275

L_5DAC:
        JSR     R5,     L_5F2F                  ; 5DAC   0004 015C 032F

        MVII    #$0005, R3                      ; 5DAF   02BB 0005
        MVII    #$0268, R4                      ; 5DB1   02BC 0268

        JSR     R5,     X_PRINT_R5              ; 5DB3   0004 0118 007B
        STRING  " GAME  OVER "                  ; 5DB6  
        DECLE   $0000                           ; 5DC2   0000

        JSR     R5,     X_PLAY_MUS2             ; 5DC3   0004 0118 035D
        DECLE   $00CE                           ; 5DC6  Note (short)
        DECLE   $00CE                           ; 5DC7  Note (short)
        DECLE   $00EE                           ; 5DC8  Note (short)
        DECLE   $010E                           ; 5DC9  Note (short)
        DECLE   $011E                           ; 5DCA  Note (short)
        DECLE   $011E                           ; 5DCB  Note (short)
        DECLE   $011E                           ; 5DCC  Note (short)
        DECLE   $010E                           ; 5DCD  Note (short)
        DECLE   $03F2,  $0119                   ; 5DCE  Note (long)
        DECLE   $0006                           ; 5DD0  Note (short)
        DECLE   $010E                           ; 5DD1  Note (short)
        DECLE   $010E                           ; 5DD2  Note (short)
        DECLE   $03F4,  $0139                   ; 5DD3  Note (long)
        DECLE   $010E                           ; 5DD5  Note (short)
        DECLE   $00CE                           ; 5DD6  Note (short)
        DECLE   $03F4,  $00E9                   ; 5DD7  Note (long)
        DECLE   $00EC                           ; 5DD9  Note (short)
        DECLE   $00EC                           ; 5DDA  Note (short)
        DECLE   $00EC                           ; 5DDB  Note (short)
        DECLE   $00EE                           ; 5DDC  Note (short)
        DECLE   $00EE                           ; 5DDD  Note (short)
        DECLE   $03F4,  $0101                   ; 5DDE  Note (long)
        DECLE   $0000                           ; 5DE0  End of music

        PULR    R7                              ; 5DE1   02B7

L_5DE2:
        MVII    #$016D, R1                      ; 5DE2   02B9 016D
        ADD     G_0171, R1                      ; 5DE4   02C1 0171
        MVI@    R1,     R0                      ; 5DE6   0288
        MOVR    R5,     R7                      ; 5DE7   00AF

L_5DE8:
        MVI     G_0171, R1                      ; 5DE8   0281 0171
        XORI    #$0001, R1                      ; 5DEA   03F9 0001
        MVO     R1,     G_0171                  ; 5DEC   0241 0171
        ADDI    #$016D, R1                      ; 5DEE   02F9 016D
        MVI@    R1,     R0                      ; 5DF0   0288
        MOVR    R5,     R7                      ; 5DF1   00AF

L_5DF2:
        PSHR    R5                              ; 5DF2   0275

L_5DF3:
        JSR     R5,     L_5E0A                  ; 5DF3   0004 015C 020A

        MVII    #$02DC, R4                      ; 5DF6   02BC 02DC
        CLRR    R2                              ; 5DF8   01D2

        JSR     R5,     L_5E17                  ; 5DF9   0004 015C 0217

        MVI     G_02F2, R0                      ; 5DFC   0280 02F2
        ADD     G_02F4, R0                      ; 5DFE   02C0 02F4
        TSTR    R0                              ; 5E00   0080
        BEQ     L_5BF4                          ; 5E01   0224 020E

        MVII    #$02E7, R4                      ; 5E03   02BC 02E7
        MVII    #$0001, R2                      ; 5E05   02BA 0001
        J       L_5E18                          ; 5E07   0004 035C 0218

L_5E0A:
        PSHR    R5                              ; 5E0A   0275
        SDBD                                    ; 5E0B   0001
        MVII    #$0600, R3                      ; 5E0C   02BB 0000 0006
        MVII    #$0014, R0                      ; 5E0F   02B8 0014
        MVII    #$02DC, R4                      ; 5E11   02BC 02DC

        JSR     R5,     .EXEC.853               ; 5E13   0004 0118 0053

        PULR    R7                              ; 5E16   02B7

L_5E17:
        PSHR    R5                              ; 5E17   0275
L_5E18:
        MVII    #$0006, R3                      ; 5E18   02BB 0006
        SWAP    R3,     1                       ; 5E1A   0043
        ADDR    R2,     R3                      ; 5E1B   00D3
        MVII    #$02F3, R1                      ; 5E1C   02B9 02F3
        ADDR    R2,     R1                      ; 5E1E   00D1
        PSHR    R1                              ; 5E1F   0271
        MVI@    R1,     R0                      ; 5E20   0288
        MVII    #$0004, R1                      ; 5E21   02B9 0004
        MOVR    R0,     R2                      ; 5E23   0082
        BEQ     L_5E29                          ; 5E24   0204 0003

        JSR     R5,     X_PRNUM_RGT             ; 5E26   0004 0118 00C5

L_5E29:
        PULR    R5                              ; 5E29   02B5
        SUBI    #$0002, R5                      ; 5E2A   033D 0002
        MVI@    R5,     R0                      ; 5E2C   02A8
        ADDR    R1,     R4                      ; 5E2D   00CC
        TSTR    R2                              ; 5E2E   0092
        BNEQ    L_5E36                          ; 5E2F   020C 0005

        JSR     R5,     X_PRNUM_RGT             ; 5E31   0004 0118 00C5

        B       L_5E39                          ; 5E34   0200 0003

L_5E36:
        JSR     R5,     X_PRNUM_ZRO             ; 5E36   0004 0118 00AD

L_5E39:
        ADDR    R1,     R4                      ; 5E39   00CC
        ADDI    #$0080, R3                      ; 5E3A   02FB 0080
        MVO@    R3,     R4                      ; 5E3C   0263
        PULR    R7                              ; 5E3D   02B7

L_5E3E:
        MVII    #$02F1, R1                      ; 5E3E   02B9 02F1
        ADD     G_0171, R1                      ; 5E40   02C1 0171
        ADD@    R1,     R2                      ; 5E42   02CA
        SDBD                                    ; 5E43   0001
        MVII    #$2710, R0                      ; 5E44   02B8 0010 0027
        CMPR    R0,     R2                      ; 5E47   0142
        BLT     L_5E52                          ; 5E48   0205 0008

        SUBR    R0,     R2                      ; 5E4A   0102
        ADDI    #$0002, R1                      ; 5E4B   02F9 0002
        MVI@    R1,     R3                      ; 5E4D   028B
        INCR    R3                              ; 5E4E   000B
        MVO@    R3,     R1                      ; 5E4F   024B
        SUBI    #$0002, R1                      ; 5E50   0339 0002
L_5E52:
        MVO@    R2,     R1                      ; 5E52   024A
        MOVR    R5,     R7                      ; 5E53   00AF

        DECLE   $0000,  $0000,  $000B,  $0008   ; 5E54   0000 0000 000B 0008
        DECLE   $0013,  $0008,  $001B,  $0008   ; 5E58   0013 0008 001B 0008
        DECLE   $0020,  $000E,  $0028,  $000E   ; 5E5C   0020 000E 0028 000E
        DECLE   $0053,  $0008,  $0040,  $0018   ; 5E60   0053 0008 0040 0018
        DECLE   $0048,  $0018,  $0038,  $0018   ; 5E64   0048 0018 0038 0018
        DECLE   $005B,  $0008,  $0078,  $003A   ; 5E68   005B 0008 0078 003A
        DECLE   $0068,  $003A,  $0030,  $0018   ; 5E6C   0068 003A 0030 0018
        DECLE   $0070,  $003A,  $0080,  $003A   ; 5E70   0070 003A 0080 003A
        DECLE   $0000,  $0032,  $0060,  $003A   ; 5E74   0000 0032 0060 003A
        DECLE   $0000,  $0010,  $0093,  $0008   ; 5E78   0000 0010 0093 0008
        DECLE   $008B,  $0008,  $0001,  $0008   ; 5E7C   008B 0008 0001 0008
        DECLE   $0000,  $0006,  $0001,  $003A   ; 5E80   0000 0006 0001 003A
        DECLE   $0001,  $0018,  $0014,  $0014   ; 5E84   0001 0018 0014 0014
        DECLE   $0022,  $0041,  $000E,  $0061   ; 5E88   0022 0041 000E 0061
        DECLE   $0022,  $0081,  $00A1,  $0010   ; 5E8C   0022 0081 00A1 0010
        DECLE   $0081,  $00A1,  $02C1,  $00C1   ; 5E90   0081 00A1 02C1 00C1
        DECLE   $00E1,  $0101,  $0121,  $000A   ; 5E94   00E1 0101 0121 000A
        DECLE   $00E1,  $0101,  $0121,  $0141   ; 5E98   00E1 0101 0121 0141
        DECLE   $02C2,  $0161,  $0181,  $01A1   ; 5E9C   02C2 0161 0181 01A1
        DECLE   $000C,  $01A1,  $01C1,  $01E1   ; 5EA0   000C 01A1 01C1 01E1
        DECLE   $02C2,  $0201,  $0221,  $0241   ; 5EA4   02C2 0201 0221 0241
        DECLE   $000C,  $0241,  $0221,  $0201   ; 5EA8   000C 0241 0221 0201
        DECLE   $0281,  $0261,  $0202,  $0241   ; 5EAC   0281 0261 0202 0241
        DECLE   $000C,  $0241,  $0202,  $0281   ; 5EB0   000C 0241 0202 0281
        DECLE   $0296,  $0201                   ; 5EB4   0296 0201

        MVO     R1,     .STIC.Y.4               ; 5EB6   0241 000C
        MVO     R1,     .BTAB.01                ; 5EB8   0241 0201
        ADD     .BTAB.E1,R4                     ; 5EBA   02C4 02E1
        SUB     .BTAB.AC,R1                     ; 5EBC   0301 02AC
        SUB     .BTAB.E1,R1                     ; 5EBE   0301 02E1
        ADD@    R2,     R6                      ; 5EC0   02D6
L_5EC1:
        PSHR    R5                              ; 5EC1   0275
L_5EC2:
        CLRR    R0                              ; 5EC2   01C0
        MVO     R0,     G_017A                  ; 5EC3   0240 017A
        MVO     R0,     G_0354                  ; 5EC5   0240 0354
        MVII    #$0200, R4                      ; 5EC7   02BC 0200
        MOVR    R7,     R1                      ; 5EC9   00B9
        SUBI    #$0044, R1                      ; 5ECA   0339 0044
L_5ECC:
        MVI@    R1,     R3                      ; 5ECC   028B
        INCR    R1                              ; 5ECD   0009
        MOVR    R3,     R2                      ; 5ECE   009A
        ANDI    #$001F, R3                      ; 5ECF   03BB 001F
        SLR     R2,     2                       ; 5ED1   0066
        SLR     R2,     2                       ; 5ED2   0066
        ANDI    #$00FE, R2                      ; 5ED3   03BA 00FE
        MOVR    R7,     R5                      ; 5ED5   00BD
        SUBI    #$0082, R5                      ; 5ED6   033D 0082
        ADDR    R2,     R5                      ; 5ED8   00D5
        SDBD                                    ; 5ED9   0001
        MVI@    R5,     R0                      ; 5EDA   02A8
L_5EDB:
        DECR    R3                              ; 5EDB   0013
        BMI     L_5EE1                          ; 5EDC   020B 0003

        MVO@    R0,     R4                      ; 5EDE   0260
        B       L_5EDB                          ; 5EDF   0220 0005

L_5EE1:
        CMPI    #$02F0, R4                      ; 5EE1   037C 02F0
        BLT     L_5ECC                          ; 5EE3   0225 0018

        MVI     G_0179, R0                      ; 5EE5   0280 0179
        TSTR    R0                              ; 5EE7   0080
        BNEQ    L_5BF4                          ; 5EE8   022C 02F5
        J       L_5EEE                          ; 5EEA   0004 035C 02EE

        PSHR    R5                              ; 5EED   0275

L_5EEE:
        JSR     R5,     L_5F41                  ; 5EEE   0004 015C 0341

        MVII    #$0006, R2                      ; 5EF1   02BA 0006
        MVII    #$0324, R3                      ; 5EF3   02BB 0324
        SDBD                                    ; 5EF5   0001
        MVII    #$5489, R4                      ; 5EF6   02BC 0089 0054

        JSR     R5,     L_5F68                  ; 5EF9   0004 015C 0368
        JSR     R5,     L_5F32                  ; 5EFC   0004 015C 0332
        JSR     R5,     L_5CF0                  ; 5EFF   0004 015C 00F0

        CLRR    R2                              ; 5F02   01D2
        MVO     R2,     G_0178                  ; 5F03   0242 0178
        MVO     R2,     G_0174                  ; 5F05   0242 0174
        MVO     R2,     G_0173                  ; 5F07   0242 0173
        MVII    #$0003, R1                      ; 5F09   02B9 0003
        MVO     R2,     G_017D                  ; 5F0B   0242 017D
        MVO     R2,     G_0175                  ; 5F0D   0242 0175
        MVO     R1,     G_0176                  ; 5F0F   0241 0176
        J       L_5FA2                          ; 5F11   0004 035C 03A2

L_5F14:
        MVII    #$001E, R2                      ; 5F14   02BA 001E
        MVI     G_0179, R3                      ; 5F16   0283 0179
        TSTR    R3                              ; 5F18   009B
        BNEQ    L_5F28                          ; 5F19   020C 000D

        MVII    #$016F, R1                      ; 5F1B   02B9 016F
        ADD     G_0171, R1                      ; 5F1D   02C1 0171
        MVI@    R1,     R3                      ; 5F1F   028B
        SLL     R3,     2                       ; 5F20   004F
        ADDR    R3,     R2                      ; 5F21   00DA
        CMPI    #$0050, R2                      ; 5F22   037A 0050
        BLT     L_5F28                          ; 5F24   0205 0002

        MVII    #$0050, R2                      ; 5F26   02BA 0050
L_5F28:
        MOVR    R5,     R7                      ; 5F28   00AF

L_5F29:
        MVII    #$016F, R4                      ; 5F29   02BC 016F
        ADD     G_0171, R4                      ; 5F2B   02C4 0171
        MVI@    R4,     R0                      ; 5F2D   02A0
        MOVR    R5,     R7                      ; 5F2E   00AF

L_5F2F:
        MVII    #$0080, R3                      ; 5F2F   02BB 0080
        INCR    R7                              ; 5F31   000F

L_5F32:
        CLRR    R3                              ; 5F32   01DB
L_5F33:
        MVII    #$0005, R1                      ; 5F33   02B9 0005
        MVII    #$015D, R2                      ; 5F35   02BA 015D
L_5F37:
        MVI@    R2,     R0                      ; 5F37   0290
        ANDI    #$007F, R0                      ; 5F38   03B8 007F
        XORR    R3,     R0                      ; 5F3A   01D8
        MVO@    R0,     R2                      ; 5F3B   0250
        INCR    R2                              ; 5F3C   000A
        DECR    R1                              ; 5F3D   0011
        BPL     L_5F37                          ; 5F3E   0223 0008
        MOVR    R5,     R7                      ; 5F40   00AF

L_5F41:
        MVII    #$0008, R2                      ; 5F41   02BA 0008
        CLRR    R3                              ; 5F43   01DB
L_5F44:
        DECR    R2                              ; 5F44   0012
        INCR    R7                              ; 5F45   000F

L_5F46:
        CLRR    R2                              ; 5F46   01D2
L_5F47:
        PSHR    R5                              ; 5F47   0275
        MOVR    R3,     R4                      ; 5F48   009C
        MOVR    R3,     R5                      ; 5F49   009D
        ADDI    #$0324, R4                      ; 5F4A   02FC 0324
        ADDI    #$033C, R5                      ; 5F4C   02FD 033C
L_5F4E:
        CLRR    R0                              ; 5F4E   01C0
        MVO@    R0,     R4                      ; 5F4F   0260
        MVO@    R0,     R5                      ; 5F50   0268
        PSHR    R5                              ; 5F51   0275
        ADDI    #$000F, R5                      ; 5F52   02FD 000F
        MVO@    R0,     R5                      ; 5F54   0268
        SUBI    #$034D, R5                      ; 5F55   033D 034D
        MOVR    R5,     R3                      ; 5F57   00AB
        MOVR    R3,     R0                      ; 5F58   0098

        JSR     R5,     X_POW2                  ; 5F59   0004 0114 0345

        COMR    R0                              ; 5F5C   0018
        DIS                                     ; 5F5D   0003
        AND     G_010D, R0                      ; 5F5E   0380 010D
        MVO     R0,     G_010D                  ; 5F60   0240 010D
        EIS                                     ; 5F62   0002
        PULR    R5                              ; 5F63   02B5
        DECR    R2                              ; 5F64   0012
        BPL     L_5F4E                          ; 5F65   0223 0018
        PULR    R7                              ; 5F67   02B7

L_5F68:
        DECR    R2                              ; 5F68   0012
        INCR    R7                              ; 5F69   000F

L_5F6A:
        CLRR    R2                              ; 5F6A   01D2
L_5F6B:
        PSHR    R5                              ; 5F6B   0275
L_5F6C:
        MVII    #$0002, R1                      ; 5F6C   02B9 0002

        JSR     R5,     L_5F98                  ; 5F6E   0004 015C 0398

        SDBD                                    ; 5F71   0001
        MVI@    R4,     R0                      ; 5F72   02A0
        MVI@    R3,     R1                      ; 5F73   0299
        SDBD                                    ; 5F74   0001
        ANDI    #$0FF8, R1                      ; 5F75   03B9 00F8 000F
        XORR    R0,     R1                      ; 5F78   01C1
        MVO@    R1,     R3                      ; 5F79   0259
        ADDI    #$0008, R3                      ; 5F7A   02FB 0008
        MVII    #$0003, R1                      ; 5F7C   02B9 0003

        JSR     R5,     L_5F98                  ; 5F7E   0004 015C 0398

        SUBI    #$0354, R3                      ; 5F81   033B 0354
        MVII    #$0163, R1                      ; 5F83   02B9 0163
        ADDR    R3,     R1                      ; 5F85   00D9
        MVO@    R1,     R1                      ; 5F86   0249
        PSHR    R3                              ; 5F87   0273
        SLL     R3,     1                       ; 5F88   004B
        ADDI    #$0126, R3                      ; 5F89   02FB 0126
        MVI@    R4,     R0                      ; 5F8B   02A0
        MVO@    R0,     R3                      ; 5F8C   0258
        ADDI    #$0010, R3                      ; 5F8D   02FB 0010
        MVI@    R4,     R0                      ; 5F8F   02A0
        MVO@    R0,     R3                      ; 5F90   0258
        PULR    R3                              ; 5F91   02B3
        ADDI    #$0325, R3                      ; 5F92   02FB 0325
        DECR    R2                              ; 5F94   0012
        BPL     L_5F6C                          ; 5F95   0223 002A
        PULR    R7                              ; 5F97   02B7

L_5F98:
        SDBD                                    ; 5F98   0001
        MVI@    R4,     R0                      ; 5F99   02A0
        MVO@    R0,     R3                      ; 5F9A   0258
        ADDI    #$0008, R3                      ; 5F9B   02FB 0008
        DECR    R1                              ; 5F9D   0011
        BNEQ    L_5F98                          ; 5F9E   022C 0007
        MOVR    R5,     R7                      ; 5FA0   00AF

L_5FA1:
        PSHR    R5                              ; 5FA1   0275
L_5FA2:
        CLRR    R0                              ; 5FA2   01C0

        JSR     R5,     X_PLAY_SFX2             ; 5FA3   0004 0118 03BE
        DECLE   $0090                           ; 5FA6  SFX prio
        DECLE   $03ED                           ; 5FA7  SFX data
        DECLE   $0365                           ; 5FA8  SFX data
        DECLE   $00E9                           ; 5FA9  SFX data
        DECLE   $016B                           ; 5FAA  SFX data
        DECLE   $0077,  $00B1,  $005F           ; 5FAB  SFX data
        DECLE   $0023,  $03EC                   ; 5FAE  SFX data
        DECLE   $02CF                           ; 5FB0  SFX end

UC_5FB1:
        MVI     G_0155, R0                      ; 5FB1  SLIB UCALL target
        CMPI    #$0004, R0                      ; 5FB3   0378 0004
        BLE     L_5FBC                          ; 5FB5   0206 0005

        SUBI    #$0004, R0                      ; 5FB7   0338 0004
        MVO     R0,     G_0155                  ; 5FB9   0240 0155
        PULR    R7                              ; 5FBB   02B7

L_5FBC:
        SDBD                                    ; 5FBC   0001
        MVII    #$5FB0, R4                      ; 5FBD   02BC 00B0 005F
        PULR    R7                              ; 5FC0   02B7

L_5FC1:
        JSR     R5,     X_PLAY_SFX2             ; 5FC1   0004 0118 03BE
        DECLE   $0084                           ; 5FC4  SFX prio
        DECLE   $03ED,  $0237,  $000B,  $000C   ; 5FC5   03ED 0237 000B 000C
        DECLE   $0080,  $00E9,  $006B,  $03CF   ; 5FC9   0080 00E9 006B 03CF
L_5FCD:
        JSR     R5,     X_PLAY_SFX2             ; 5FCD   0004 0118 03BE
        DECLE   $0099                           ; 5FD0  SFX prio

        CMP     G_0040, R4                      ; 5FD1   0344 0040
        ANDI    #$000D, R1                      ; 5FD3   03B9 000D
        ADDR    R5,     R3                      ; 5FD5   00EB
        CMP     G_0060, R4                      ; 5FD6   0344 0060
        ADDR    R5,     R3                      ; 5FD8   00EB
        CMP     .IV.ALD,R4                      ; 5FD9   0344 0080
        ADDR    R5,     R3                      ; 5FDB   00EB
        CMP     G_0150, R4                      ; 5FDC   0344 0150
        ADDR    R5,     R3                      ; 5FDE   00EB
        CMP     .BTAB.10,R4                     ; 5FDF   0344 0210
        ADDR    R5,     R3                      ; 5FE1   00EB
        ADD@    R1,     R7                      ; 5FE2   02CF

L_5FE3:
        JSR     R5,     X_PLAY_SFX2             ; 5FE3   0004 0118 03BE
        DECLE   $0092                           ; 5FE6  SFX prio

        ADD     .PSG1.chn_a_lo,R0               ; 5FE7   02C0 00F0
        ADDR    R5,     R1                      ; 5FE9   00E9
        RRC     R3,     2                       ; 5FEA   0077
        ADDR    R5,     R7                      ; 5FEB   00EF

        SLLC    R3,     2                       ; 5FEC   005F
        NEGR    R3                              ; 5FED   0023
        XOR@    R5,     R5                      ; 5FEE   03ED
        MVI     .PSG0.chn_a_lo,R0               ; 5FEF   0280 01F0
        CMPI    #$0010, R0                      ; 5FF1   0378 0010
        BEQ     L_5FFA                          ; 5FF3   0204 0005

        SUBI    #$0010, R0                      ; 5FF5   0338 0010
        MVO     R0,     .PSG0.chn_a_lo          ; 5FF7   0240 01F0
        PULR    R7                              ; 5FF9   02B7

L_5FFA:
        SDBD                                    ; 5FFA   0001
        MVII    #$5FFF, R4                      ; 5FFB   02BC 00FF 005F
        PULR    R7                              ; 5FFE   02B7
        ADD@    R1,     R7                      ; 5FFF   02CF

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5017       <entry>
;;  $505A       $505E  
;;  $5068       $506A  
;;  $506D       $5070  
;;  $50A6       $51B6  
;;  $50B5       $50D6  
;;  $50C1       $50BC  
;;  $50CF       $50BA   $50BF  
;;  $50D1       $50CD  
;;  $50D8       $50A9  
;;  $50E1       $50F9  
;;  $50F6       $50E2   $50E6  
;;  $50FF       $5158  
;;  $5106       $5103  
;;  $510D       $510A  
;;  $511F       $5151  
;;  $513D       $5132  
;;  $5143       $5139  
;;  $514B       $5120  
;;  $514E       $5149  
;;  $5150       $514C  
;;  $5153       $5115   $511B  
;;  $516B       $51A5  
;;  $5189       $5185  
;;  $518A       $5188  
;;  $5191       $518B  
;;  $5192       $517F   $518E  
;;  $5197       $5182  
;;  $51A1       $516F  
;;  $51A9       $515D  
;;  $51B0       $51A7   $51AA  
;;  $51B8       $51D2  
;;  $51CB       $51D5  
;;  $51CC       $51C7  
;;  $51DD       $51D0  
;;  $51E7       $51F8  
;;  $5206       $5211  
;;  $521C       $5280  
;;  $526A       $5255  
;;  $526B       $5269  
;;  $527C       $5222   $5228  
;;  $5293       $5285  
;;  $52A8       $52B6  
;;  $52B1       $52AB   $52AE  
;;  $52CD       $52C4  
;;  $52DB       $5299   $52A2  
;;  $52DE       $530C  
;;  $52EC       $52E5  
;;  $52FA       $52FC  
;;  $52FE       $52F8  
;;  $5309       $52EA  
;;  $530F       $52E7  
;;  $533D       $5325  
;;  $5351       $534D  
;;  $5352       $5350  
;;  $535D       $5330  
;;  $5571       $556F  
;;  $5660       $5660  
;;  $57F5       $57ED   $57F2  
;;  $5841       $5834   $5838   $583E  
;;  $585F       $585C  
;;  $5873       $586A  
;;  $5876       $5846   $584A  
;;  $5890       $5883  
;;  $58A8       $58A2  
;;  $58B7       $5A59  
;;  $58DE       $58E2  
;;  $58E4       $58DF  
;;  $58F1       $58EB  
;;  $58FA       $58F2   $58F6  
;;  $5907       $58D1  
;;  $590C       $58BF  
;;  $591D       $5914  
;;  $5937       $5933  
;;  $594F       $5949  
;;  $5952       $591E  
;;  $5956       $57B9   $57C1   $5811   $587B   $588B   $58BA   $58C5   $58CD  
;;  $5956       $590F   $5918   $595A   $595E   $5966   $597B   $59DC   $59FF  
;;  $5956       $5A0F   $5A2A   $5A62   $5A67  
;;  $5982       $5972  
;;  $59D0       $5980  
;;  $59E1       $59D8  
;;  $59FC       $5976  
;;  $5A04       $59D2  
;;  $5A13       $5A0B  
;;  $5A15       $5A07  
;;  $5A43       $5A3B  
;;  $5A44       $5A42  
;;  $5A46       $5A3F  
;;  $5A49       $5A37  
;;  $5A5F       $5A2F  
;;  $5AAD       $5AA7  
;;  $5AB1       $5AB6  
;;  $5ABE       $5AC1  
;;  $5AC4       $5AC8  
;;  $5ADA       $5B05  
;;  $5AF4       $5AEE  
;;  $5B1D       $5A7A  
;;  $5B2C       $5B1F  
;;  $5B43       $5A71  
;;  $5B5D       $5B51   $5B55  
;;  $5B61       $5B59  
;;  $5B7A       $5B6E   $5B72  
;;  $5BB5       $5BB2  
;;  $5BC2       $5BBC  
;;  $5BD0       $5BC7  
;;  $5BE6       $5BA7   $5BAC   $5BB7   $5BC0   $5BCC  
;;  $5BF1       $5BED  
;;  $5BF4       $5B32   $5B76   $5B83   $5B8D   $5BF9   $5C02   $5C07   $5C11  
;;  $5BF4       $5C92   $5E01   $5EE8  
;;  $5C23       $5C15  
;;  $5C46       $5C44  
;;  $5C7F       $5C71   $5C77  
;;  $5C95       $5C8E  
;;  $5CB3       $5CA3  
;;  $5CB6       $5C9D  
;;  $5CCD       $5CC7  
;;  $5CDA       $5CD5  
;;  $5CEA       $5CDD   $5CE4  
;;  $5CF0       $5862   $5AD1   $5EFF  
;;  $5CF1       $5CBC  
;;  $5CFF       $5D05  
;;  $5D07       $5D01  
;;  $5D0E       $5903   $5941  
;;  $5D24       $5D1F  
;;  $5D28       $5D11  
;;  $5D29       $57A6   $5A69  
;;  $5D36       $5BA0   $5C95  
;;  $5D4B       $5D47  
;;  $5D57       $5D4C  
;;  $5D74       $5A84   $5CB9  
;;  $5D75       $588D  
;;  $5D8D       $5D78  
;;  $5D8E       $5077   $5C79  
;;  $5DAC       $5C7C   $5CB0  
;;  $5DE2       $579B   $5C6B   $5C99   $5CFC  
;;  $5DE8       $5C73   $5C9F  
;;  $5DF2       $5CAD  
;;  $5DF3       $5DA8  
;;  $5E0A       $5996   $5CF1   $5DF3  
;;  $5E17       $5DF9  
;;  $5E18       $5D0B   $5E07  
;;  $5E29       $5E24  
;;  $5E36       $5E2F  
;;  $5E39       $5E34  
;;  $5E3E       $585F   $5892  
;;  $5E52       $5E48  
;;  $5EC1       $58AD   $5DA5  
;;  $5EC2       $5A1E   $5CB3  
;;  $5ECC       $5EE3  
;;  $5EDB       $5EDF  
;;  $5EE1       $5EDC  
;;  $5EEE       $5C7F   $5EEA  
;;  $5F14       $5A99   $5D36  
;;  $5F28       $5F19   $5F24  
;;  $5F29       $5857   $592C   $5A9E   $5BE8   $5C0C   $5CDF  
;;  $5F2F       $57FF   $5990   $5D92   $5DAC  
;;  $5F32       $5EFC  
;;  $5F33       $5F31  
;;  $5F37       $5F3E  
;;  $5F41       $5993   $5A7C   $5D8F   $5EEE  
;;  $5F44       $57CD   $5CAA  
;;  $5F46       $5C4B  
;;  $5F47       $5F45  
;;  $5F4E       $5F65  
;;  $5F68       $5A96   $5B3F   $5D86   $5DA2   $5EF9  
;;  $5F6A       $5BD5   $5C54   $5CCF  
;;  $5F6B       $5F69  
;;  $5F6C       $5F95  
;;  $5F98       $5F6E   $5F7E   $5F9E  
;;  $5FA1       $5BDC   $5CD7  
;;  $5FA2       $5F11  
;;  $5FB1       <entry>
;;  $5FBC       $5FB5  
;;  $5FC1       $596C   $5A5C   $5BFB  
;;  $5FCD       $57AF   $5802  
;;  $5FE3       $5873   $58B0  
;;  $5FFA       $5FF3  
;; ======================================================================== ;;
