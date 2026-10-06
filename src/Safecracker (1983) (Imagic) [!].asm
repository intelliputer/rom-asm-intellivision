
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
        MVII    #$5325, R0                      ; 5019   02B8 0025 0053
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02F4, R6                      ; 5021   02BE 02F4
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
        MVII    #$54D6, R0                      ; 5039   02B8 00D6 0054
        MVO     R0,     G_035D                  ; 503C   0240 035D
        MVII    #$0001, R0                      ; 503E   02B8 0001
        MVO     R0,     G_0147                  ; 5040   0240 0147
        INCR    R0                              ; 5042   0008
        MVO     R0,     G_0116                  ; 5043   0240 0116
        MVO     R0,     G_010E                  ; 5045   0240 010E
        MVO     R0,     G_0119                  ; 5047   0240 0119
        CLRR    R0                              ; 5049   01C0
        DECR    R0                              ; 504A   0010
        MVO     R0,     G_035E                  ; 504B   0240 035E
        MVII    #$0008, R2                      ; 504D   02BA 0008
        SWAP    R2,     1                       ; 504F   0042
        MVII    #$0008, R1                      ; 5050   02B9 0008
        SDBD                                    ; 5052   0001
        MVII    #$577A, R4                      ; 5053   02BC 007A 0057
        MVII    #$0335, R5                      ; 5056   02BD 0335
L_5058:
        MVI@    R4,     R0                      ; 5058   02A0
        XORR    R2,     R0                      ; 5059   01D0
        MVO@    R0,     R5                      ; 505A   0268
        DECR    R1                              ; 505B   0011
        BNEQ    L_5058                          ; 505C   022C 0005

        EIS                                     ; 505E   0002
L_505F:
        MVI     G_0119, R0                      ; 505F   0280 0119
        TSTR    R0                              ; 5061   0080
        BNEQ    L_505F                          ; 5062   022C 0004

        JSR     R5,     L_5782                  ; 5064   0004 0154 0382
L_5067:
        JSR     R5,     L_507E                  ; 5067   0004 0150 007E
        JSR     R5,     L_50D7                  ; 506A   0004 0150 00D7
        JSR     R5,     L_50B2                  ; 506D   0004 0150 00B2
        JSR     R5,     L_5138                  ; 5070   0004 0150 0138
        JSR     R5,     L_50D7                  ; 5073   0004 0150 00D7
        JSR     R5,     .EXEC.4F1               ; 5076   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 5079   0004 0118 02AD

        B       L_5067                          ; 507C   0220 0016

L_507E:
        PSHR    R5                              ; 507E   0275
        MVI     G_0118, R0                      ; 507F   0280 0118
        TSTR    R0                              ; 5081   0080
        BNEQ    L_50B1                          ; 5082   020C 002D

        MVII    #$0003, R0                      ; 5084   02B8 0003
        MVO     R0,     G_0118                  ; 5086   0240 0118
        SDBD                                    ; 5088   0001
        MVII    #$55A7, R4                      ; 5089   02BC 00A7 0055
        MVII    #$015D, R3                      ; 508C   02BB 015D
L_508E:
        MVI@    R3,     R0                      ; 508E   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 508F   0004 0114 0268

        TSTR    R0                              ; 5092   0080
        BMI     L_50A8                          ; 5093   020B 0013
        BEQ     L_509A                          ; 5095   0204 0003

        DECR    R0                              ; 5097   0010
        BNEQ    L_50A8                          ; 5098   020C 000E

L_509A:
        MVI@    R4,     R0                      ; 509A   02A0
        MVO@    R0,     R3                      ; 509B   0258
        PSHR    R4                              ; 509C   0274
        PSHR    R3                              ; 509D   0273
        SDBD                                    ; 509E   0001
        MVII    #$50A4, R5                      ; 509F   02BD 00A4 0050
        SDBD                                    ; 50A2   0001
        MVI@    R4,     R7                      ; 50A3   02A7

        PULR    R3                              ; 50A4   02B3
        PULR    R4                              ; 50A5   02B4
        B       L_50AA                          ; 50A6   0200 0002

L_50A8:
        MVO@    R0,     R3                      ; 50A8   0258
        INCR    R4                              ; 50A9   000C
L_50AA:
        INCR    R3                              ; 50AA   000B
        ADDI    #$0002, R4                      ; 50AB   02FC 0002
        CMPI    #$0166, R3                      ; 50AD   037B 0166
        BLT     L_508E                          ; 50AF   0225 0022
L_50B1:
        PULR    R7                              ; 50B1   02B7

L_50B2:
        PSHR    R5                              ; 50B2   0275
        CLRR    R1                              ; 50B3   01C9
        DIS                                     ; 50B4   0003
        MVI     G_0117, R2                      ; 50B5   0282 0117
        MVO     R1,     G_0117                  ; 50B7   0241 0117
        EIS                                     ; 50B9   0002
        MVII    #$033D, R3                      ; 50BA   02BB 033D
L_50BC:
        RRC     R2,     1                       ; 50BC   0072
        BNC     L_50D1                          ; 50BD   0209 0012

        MVI@    R3,     R4                      ; 50BF   029C
        TSTR    R4                              ; 50C0   00A4
        BEQ     L_50D1                          ; 50C1   0204 000E

        ADDI    #$0000, R4                      ; 50C3   02FC 0000
        SDBD                                    ; 50C5   0001
        MVII    #$50CF, R5                      ; 50C6   02BD 00CF 0050
        PSHR    R2                              ; 50C9   0272
        PSHR    R3                              ; 50CA   0273
        SUBI    #$033D, R3                      ; 50CB   033B 033D
        SDBD                                    ; 50CD   0001
        MVI@    R4,     R7                      ; 50CE   02A7

        PULR    R3                              ; 50CF   02B3
        PULR    R2                              ; 50D0   02B2
L_50D1:
        INCR    R3                              ; 50D1   000B
        CMPI    #$0344, R3                      ; 50D2   037B 0344
        BLE     L_50BC                          ; 50D4   0226 0019
        PULR    R7                              ; 50D6   02B7

L_50D7:
        PSHR    R5                              ; 50D7   0275
        MVII    #$0355, R3                      ; 50D8   02BB 0355
        MVII    #$0325, R2                      ; 50DA   02BA 0325
L_50DC:
        CLRR    R5                              ; 50DC   01ED
        MVI@    R2,     R0                      ; 50DD   0290
        ANDI    #$0100, R0                      ; 50DE   03B8 0100
        BNEQ    L_50E3                          ; 50E0   020C 0001

        INCR    R5                              ; 50E2   000D
L_50E3:
        ADDI    #$0018, R2                      ; 50E3   02FA 0018
        MVI@    R2,     R4                      ; 50E5   0294
        TSTR    R4                              ; 50E6   00A4
        BNEQ    L_50EA                          ; 50E7   020C 0001

        INCR    R5                              ; 50E9   000D
L_50EA:
        CLRR    R1                              ; 50EA   01C9
        MVII    #$03FF, R0                      ; 50EB   02B8 03FF
        DIS                                     ; 50ED   0003
        AND@    R3,     R0                      ; 50EE   0398
        MVO@    R1,     R3                      ; 50EF   0259
        EIS                                     ; 50F0   0002
        TSTR    R5                              ; 50F1   00AD
        BNEQ    L_5130                          ; 50F2   020C 003C

        ADDI    #$0005, R4                      ; 50F4   02FC 0005
        MVI@    R4,     R1                      ; 50F6   02A1
        ANDR    R1,     R0                      ; 50F7   0188
        BEQ     L_5130                          ; 50F8   0204 0036

        MVII    #$000A, R5                      ; 50FA   02BD 000A
L_50FC:
        SARC    R0,     1                       ; 50FC   0078
        BNC     L_5128                          ; 50FD   0209 0029

        SLR     R1,     1                       ; 50FF   0061
        PSHR    R5                              ; 5100   0275
        PSHR    R4                              ; 5101   0274
        PSHR    R3                              ; 5102   0273
        NOP                                     ; 5103   0034
        PSHR    R2                              ; 5104   0272
        PSHR    R1                              ; 5105   0271
        PSHR    R0                              ; 5106   0270
        SUBI    #$033D, R2                      ; 5107   033A 033D
        NEGR    R5                              ; 5109   0025
        MOVR    R5,     R1                      ; 510A   00A9
        ADDI    #$000A, R1                      ; 510B   02F9 000A
        CMPI    #$0007, R1                      ; 510D   0379 0007
        BGT     L_511A                          ; 510F   020E 0009

        ADDI    #$0325, R1                      ; 5111   02F9 0325
        MVI@    R1,     R0                      ; 5113   0288
        ANDI    #$0100, R0                      ; 5114   03B8 0100
        BEQ     L_5120                          ; 5116   0204 0008

        SUBI    #$0325, R1                      ; 5118   0339 0325
L_511A:
        SDBD                                    ; 511A   0001
        MVII    #$5120, R5                      ; 511B   02BD 0020 0051
        SDBD                                    ; 511E   0001
        MVI@    R4,     R7                      ; 511F   02A7

L_5120:
        PULR    R0                              ; 5120   02B0
        PULR    R1                              ; 5121   02B1
        PULR    R2                              ; 5122   02B2
        PULR    R3                              ; 5123   02B3
        PULR    R4                              ; 5124   02B4
        PULR    R5                              ; 5125   02B5
        B       L_512B                          ; 5126   0200 0003

L_5128:
        SARC    R1,     1                       ; 5128   0079
        BNC     L_512D                          ; 5129   0209 0002

L_512B:
        ADDI    #$0002, R4                      ; 512B   02FC 0002
L_512D:
        DECR    R5                              ; 512D   0015
        BNEQ    L_50FC                          ; 512E   022C 0033

L_5130:
        SUBI    #$0017, R2                      ; 5130   033A 0017
        INCR    R3                              ; 5132   000B
        CMPI    #$035D, R3                      ; 5133   037B 035D
        BLT     L_50DC                          ; 5135   0225 005A
        PULR    R7                              ; 5137   02B7

L_5138:
        PSHR    R5                              ; 5138   0275
        MVI     G_011A, R0                      ; 5139   0280 011A
        XORI    #$0001, R0                      ; 513B   03F8 0001
        MVO     R0,     G_011A                  ; 513D   0240 011A
        PULR    R7                              ; 513F   02B7

L_5140:
        MVI     .STIC.BORD,R0                   ; 5140   0280 002C
        MVO     R0,     G_0170                  ; 5142   0240 0170
        MVO     R1,     .STIC.BORD              ; 5144   0241 002C
        MVII    #$0081, R1                      ; 5146   02B9 0081
        MVO     R1,     G_0102                  ; 5148   0241 0102
        PULR    R7                              ; 514A   02B7

        PSHR    R5                              ; 514B   0275
        MVI     G_0103, R0                      ; 514C   0280 0103
        TSTR    R0                              ; 514E   0080
        BEQ     L_5154                          ; 514F   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 5151   0240 0020
L_5153:
        PULR    R7                              ; 5153   02B7

L_5154:
        MVI     G_0102, R1                      ; 5154   0281 0102
        SUBI    #$0080, R1                      ; 5156   0339 0080
        BMI     L_5165                          ; 5158   020B 000B
        BEQ     L_5140                          ; 515A   0224 001B

        DECR    R1                              ; 515C   0011
        BEQ     L_5153                          ; 515D   0224 000B

        MVI     G_0170, R1                      ; 515F   0281 0170
        MVO     R1,     .STIC.BORD              ; 5161   0241 002C
        MVO     R0,     G_0102                  ; 5163   0240 0102
L_5165:
        MVO     R0,     .STIC.VIDEN             ; 5165   0240 0020
        INCR    R0                              ; 5167   0008
        MVO     R0,     G_0103                  ; 5168   0240 0103

        JSR     R5,     L_52F5                  ; 516A   0004 0150 02F5
        JSR     R5,     L_52D7                  ; 516D   0004 0150 02D7

        MVII    #$0355, R3                      ; 5170   02BB 0355
        MVII    #$0018, R2                      ; 5172   02BA 0018
        CLRR    R5                              ; 5174   01ED
        MVII    #$0008, R4                      ; 5175   02BC 0008
L_5177:
        MVI@    R2,     R0                      ; 5177   0290
        MVO@    R5,     R2                      ; 5178   0255
        MVI@    R3,     R1                      ; 5179   0299
        COMR    R0                              ; 517A   0018
        ANDR    R0,     R1                      ; 517B   0181
        COMR    R0                              ; 517C   0018
        XORR    R0,     R1                      ; 517D   01C1
        MVO@    R1,     R3                      ; 517E   0259
        INCR    R2                              ; 517F   000A
        INCR    R3                              ; 5180   000B
        DECR    R4                              ; 5181   0014
        BNEQ    L_5177                          ; 5182   022C 000C

        MVI     G_0106, R0                      ; 5184   0280 0106
        MVO     R0,     .STIC.HDLY              ; 5186   0240 0030
        MVI     G_010A, R0                      ; 5188   0280 010A
        MVO     R0,     .STIC.VDLY              ; 518A   0240 0031
        MVI     G_0104, R2                      ; 518C   0282 0104
        SLL     R2,     1                       ; 518E   004A
        MVII    #$0345, R4                      ; 518F   02BC 0345
        MVII    #$033D, R5                      ; 5191   02BD 033D
        ADDR    R2,     R4                      ; 5193   00D4
        ADDR    R2,     R5                      ; 5194   00D5
L_5195:
        MVI@    R4,     R3                      ; 5195   02A3
        ANDI    #$000F, R3                      ; 5196   03BB 000F
        PSHR    R4                              ; 5198   0274
        MVI@    R5,     R4                      ; 5199   02AC
        TSTR    R4                              ; 519A   00A4
        BEQ     L_51F5                          ; 519B   0204 0058

        MVII    #$0166, R1                      ; 519D   02B9 0166
        ADDR    R2,     R1                      ; 519F   00D1
        CMP@    R1,     R3                      ; 51A0   034B
        BEQ     L_51F5                          ; 51A1   0204 0052

        MVO@    R3,     R1                      ; 51A3   024B
        PSHR    R5                              ; 51A4   0275
        MVII    #$0325, R1                      ; 51A5   02B9 0325
        ADDR    R2,     R1                      ; 51A7   00D1
        MVI@    R1,     R0                      ; 51A8   0288
        PSHR    R1                              ; 51A9   0271
        MOVR    R0,     R1                      ; 51AA   0081
        SDBD                                    ; 51AB   0001
        ANDI    #$FDFF, R0                      ; 51AC   03B8 00FF 00FD
        SDBD                                    ; 51AF   0001
        ANDI    #$0800, R1                      ; 51B0   03B9 0000 0008
        SLR     R1,     2                       ; 51B3   0065
        XORR    R1,     R0                      ; 51B4   01C8
        PULR    R1                              ; 51B5   02B1
        MVO@    R0,     R1                      ; 51B6   0248
        ADDI    #$0002, R4                      ; 51B7   02FC 0002
        SDBD                                    ; 51B9   0001
        MVII    #$577A, R5                      ; 51BA   02BD 007A 0057
        ADDR    R2,     R5                      ; 51BD   00D5
        MVI@    R5,     R5                      ; 51BE   02AD
        SDBD                                    ; 51BF   0001
        ADDI    #$3800, R5                      ; 51C0   02FD 0000 0038
        MVII    #$032D, R1                      ; 51C3   02B9 032D
        ADDR    R2,     R1                      ; 51C5   00D1
        MVI@    R1,     R0                      ; 51C6   0288
        SLL     R3,     2                       ; 51C7   004F
        SLL     R3,     1                       ; 51C8   004B
        SDBD                                    ; 51C9   0001
        MVI@    R4,     R1                      ; 51CA   02A1
        MOVR    R1,     R4                      ; 51CB   008C
        ANDI    #$0080, R0                      ; 51CC   03B8 0080
        BEQ     L_51E3                          ; 51CE   0204 0013

        SLL     R3,     1                       ; 51D0   004B
        ADDR    R3,     R4                      ; 51D1   00DC
        MVI@    R4,     R0                      ; 51D2   02A0
        MVO@    R0,     R5                      ; 51D3   0268
        MVI@    R4,     R0                      ; 51D4   02A0
        MVO@    R0,     R5                      ; 51D5   0268
        MVI@    R4,     R0                      ; 51D6   02A0
        MVO@    R0,     R5                      ; 51D7   0268
        MVI@    R4,     R0                      ; 51D8   02A0
        MVO@    R0,     R5                      ; 51D9   0268
        MVI@    R4,     R0                      ; 51DA   02A0
        MVO@    R0,     R5                      ; 51DB   0268
        MVI@    R4,     R0                      ; 51DC   02A0
        MVO@    R0,     R5                      ; 51DD   0268
        MVI@    R4,     R0                      ; 51DE   02A0
        MVO@    R0,     R5                      ; 51DF   0268
        MVI@    R4,     R0                      ; 51E0   02A0
        MVO@    R0,     R5                      ; 51E1   0268
        INCR    R7                              ; 51E2   000F

L_51E3:
        ADDR    R3,     R4                      ; 51E3   00DC
L_51E4:
        MVI@    R4,     R0                      ; 51E4   02A0
        MVO@    R0,     R5                      ; 51E5   0268
        MVI@    R4,     R0                      ; 51E6   02A0
        MVO@    R0,     R5                      ; 51E7   0268
        MVI@    R4,     R0                      ; 51E8   02A0
        MVO@    R0,     R5                      ; 51E9   0268
        MVI@    R4,     R0                      ; 51EA   02A0
        MVO@    R0,     R5                      ; 51EB   0268
        MVI@    R4,     R0                      ; 51EC   02A0
        MVO@    R0,     R5                      ; 51ED   0268
        MVI@    R4,     R0                      ; 51EE   02A0
        MVO@    R0,     R5                      ; 51EF   0268
        MVI@    R4,     R0                      ; 51F0   02A0
        MVO@    R0,     R5                      ; 51F1   0268
        MVI@    R4,     R0                      ; 51F2   02A0
        MVO@    R0,     R5                      ; 51F3   0268
        PULR    R5                              ; 51F4   02B5
L_51F5:
        PULR    R4                              ; 51F5   02B4
        INCR    R2                              ; 51F6   000A
        MOVR    R2,     R0                      ; 51F7   0090
        SARC    R0,     1                       ; 51F8   0078
        BC      L_5195                          ; 51F9   0221 0065

        MVI     G_0172, R1                      ; 51FB   0281 0172
        INCR    R1                              ; 51FD   0009
        CMPI    #$0007, R1                      ; 51FE   0379 0007
        BLT     L_5227                          ; 5200   0205 0025

        CLRR    R1                              ; 5202   01C9
        PSHR    R5                              ; 5203   0275
        SDBD                                    ; 5204   0001
        MVII    #$5597, R4                      ; 5205   02BC 0097 0055
        MVI     G_0171, R0                      ; 5208   0280 0171
        XORI    #$0001, R0                      ; 520A   03F8 0001
        MVO     R0,     G_0171                  ; 520C   0240 0171
        BEQ     L_5212                          ; 520E   0204 0002

        ADDI    #$0008, R4                      ; 5210   02FC 0008
L_5212:
        SDBD                                    ; 5212   0001
        MVII    #$3800, R5                      ; 5213   02BD 0000 0038
        MVI@    R4,     R0                      ; 5216   02A0
        MVO@    R0,     R5                      ; 5217   0268
        MVI@    R4,     R0                      ; 5218   02A0
        MVO@    R0,     R5                      ; 5219   0268
        MVI@    R4,     R0                      ; 521A   02A0
        MVO@    R0,     R5                      ; 521B   0268
        MVI@    R4,     R0                      ; 521C   02A0
        MVO@    R0,     R5                      ; 521D   0268
        MVI@    R4,     R0                      ; 521E   02A0
        MVO@    R0,     R5                      ; 521F   0268
        MVI@    R4,     R0                      ; 5220   02A0
        MVO@    R0,     R5                      ; 5221   0268
        MVI@    R4,     R0                      ; 5222   02A0
        MVO@    R0,     R5                      ; 5223   0268
        MVI@    R4,     R0                      ; 5224   02A0
        MVO@    R0,     R5                      ; 5225   0268
        PULR    R5                              ; 5226   02B5
L_5227:
        MVO     R1,     G_0172                  ; 5227   0241 0172

        JSR     R5,     L_537E                  ; 5229   0004 0150 037E

        CLRR    R2                              ; 522C   01D2
        MVI     G_0104, R1                      ; 522D   0281 0104
        RRC     R1,     1                       ; 522F   0071
        BC      L_5238                          ; 5230   0201 0006

        MVI     G_0109, R0                      ; 5232   0280 0109

        JSR     R5,     X_EXT_SIGN_LO           ; 5234   0004 0114 0268

        MOVR    R0,     R2                      ; 5237   0082
L_5238:
        MVII    #$00FF, R0                      ; 5238   02B8 00FF
        MVII    #$0325, R3                      ; 523A   02BB 0325
        MVII    #$0125, R4                      ; 523C   02BC 0125

        JSR     R5,     L_52A0                  ; 523E   0004 0150 02A0

        CLRR    R2                              ; 5241   01D2
        MVI     G_0104, R1                      ; 5242   0281 0104
        RRC     R1,     1                       ; 5244   0071
        BNC     L_524D                          ; 5245   0209 0006

        MVI     G_010D, R0                      ; 5247   0280 010D

        JSR     R5,     X_EXT_SIGN_LO           ; 5249   0004 0114 0268

        MOVR    R0,     R2                      ; 524C   0082
L_524D:
        MVII    #$007F, R0                      ; 524D   02B8 007F
        MVII    #$032D, R3                      ; 524F   02BB 032D
        MVII    #$0135, R4                      ; 5251   02BC 0135

        JSR     R5,     L_52A0                  ; 5253   0004 0150 02A0

        MVII    #$0100, R4                      ; 5256   02BC 0100
        SDBD                                    ; 5258   0001
        MVI@    R4,     R0                      ; 5259   02A0
        SDBD                                    ; 525A   0001
        CMPI    #$53C8, R0                      ; 525B   0378 00C8 0053
        BNEQ    L_5263                          ; 525E   020C 0003

        JSR     R5,     L_5410                  ; 5260   0004 0154 0010
L_5263:
        JSR     R5,     X_PLAY_NOTE             ; 5263   0004 0118 02BD

        CLRR    R1                              ; 5266   01C9
        MVII    #$034D, R3                      ; 5267   02BB 034D
L_5269:
        CLRC                                    ; 5269   0006
        MVI@    R3,     R0                      ; 526A   0298
        TSTR    R0                              ; 526B   0080
        BEQ     L_5272                          ; 526C   0204 0004

        DECR    R0                              ; 526E   0010
        BNEQ    L_5272                          ; 526F   020C 0001

        SETC                                    ; 5271   0007
L_5272:
        RRC     R1,     1                       ; 5272   0071
        MVO@    R0,     R3                      ; 5273   0258
        INCR    R3                              ; 5274   000B
        CMPI    #$0354, R3                      ; 5275   037B 0354
        BLE     L_5269                          ; 5277   0226 000F

        SWAP    R1,     1                       ; 5279   0041
        MVI     G_0117, R0                      ; 527A   0280 0117
        COMR    R0                              ; 527C   0018
        ANDR    R0,     R1                      ; 527D   0181
        COMR    R0                              ; 527E   0018
        XORR    R0,     R1                      ; 527F   01C1
        MVO     R1,     G_0117                  ; 5280   0241 0117
        MVI     G_0118, R0                      ; 5282   0280 0118
        TSTR    R0                              ; 5284   0080
        BEQ     L_528E                          ; 5285   0204 0007

        AND     G_011A, R0                      ; 5287   0380 011A
        MVO     R0,     G_011A                  ; 5289   0240 011A
        DECR    R0                              ; 528B   0010
        MVO     R0,     G_0118                  ; 528C   0240 0118
L_528E:
        MVI     G_0104, R0                      ; 528E   0280 0104
        INCR    R0                              ; 5290   0008
        ANDI    #$0003, R0                      ; 5291   03B8 0003
        MVO     R0,     G_0104                  ; 5293   0240 0104
        CLRR    R0                              ; 5295   01C0
        MVO     R0,     G_0103                  ; 5296   0240 0103
        MVI     G_0189, R0                      ; 5298   0280 0189
        DECR    R0                              ; 529A   0010
        BMI     L_529F                          ; 529B   020B 0002

        MVO     R0,     G_0189                  ; 529D   0240 0189
L_529F:
        PULR    R7                              ; 529F   02B7

L_52A0:
        PSHR    R5                              ; 52A0   0275
        MVII    #$0008, R5                      ; 52A1   02BD 0008
L_52A3:
        PSHR    R5                              ; 52A3   0275
        MVI@    R3,     R1                      ; 52A4   0299
        SDBD                                    ; 52A5   0001
        MVII    #$4000, R5                      ; 52A6   02BD 0000 0040
        ANDR    R1,     R5                      ; 52A9   018D
        BEQ     L_52B1                          ; 52AA   0204 0005

        JSR     R5,     L_530F                  ; 52AC   0004 0150 030F

        B       L_52D1                          ; 52AF   0200 0020

L_52B1:
        PSHR    R2                              ; 52B1   0272
        ANDR    R0,     R1                      ; 52B2   0181
        PSHR    R0                              ; 52B3   0270
        SWAP    R1,     1                       ; 52B4   0041
        PSHR    R4                              ; 52B5   0274
        XOR@    R4,     R1                      ; 52B6   03E1
        MVI@    R4,     R0                      ; 52B7   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52B8   0004 0114 0268

        MVI     G_0116, R2                      ; 52BB   0282 0116

        JSR     R5,     L_54C4                  ; 52BD   0004 0154 00C4

        ADDR    R0,     R1                      ; 52C0   00C1
        PULR    R2                              ; 52C1   02B2
        MVO@    R1,     R2                      ; 52C2   0251
        SWAP    R1,     1                       ; 52C3   0041
        PULR    R0                              ; 52C4   02B0
        ANDR    R0,     R1                      ; 52C5   0181
        MOVR    R0,     R2                      ; 52C6   0082
        COMR    R2                              ; 52C7   001A
        PULR    R5                              ; 52C8   02B5
        AND@    R3,     R2                      ; 52C9   039A
        BMI     L_52CE                          ; 52CA   020B 0002

        SUBR    R5,     R1                      ; 52CC   0129
        ANDR    R0,     R1                      ; 52CD   0181
L_52CE:
        XORR    R2,     R1                      ; 52CE   01D1
        MVO@    R1,     R3                      ; 52CF   0259
        MOVR    R5,     R2                      ; 52D0   00AA
L_52D1:
        INCR    R3                              ; 52D1   000B
        PULR    R5                              ; 52D2   02B5
        DECR    R5                              ; 52D3   0015
        BNEQ    L_52A3                          ; 52D4   022C 0032
        PULR    R7                              ; 52D6   02B7

L_52D7:
        MVII    #$0001, R1                      ; 52D7   02B9 0001
        INCR    R7                              ; 52D9   000F

        CLRR    R1                              ; 52DA   01C9
L_52DB:
        PSHR    R5                              ; 52DB   0275
        MVII    #$0325, R4                      ; 52DC   02BC 0325
        CLRR    R5                              ; 52DE   01ED
        ADDI    #$0002, R1                      ; 52DF   02F9 0002
L_52E1:
        MVI@    R4,     R0                      ; 52E1   02A0
        MVO@    R0,     R5                      ; 52E2   0268
        MVI@    R4,     R0                      ; 52E3   02A0
        MVO@    R0,     R5                      ; 52E4   0268
        MVI@    R4,     R0                      ; 52E5   02A0
        MVO@    R0,     R5                      ; 52E6   0268
        MVI@    R4,     R0                      ; 52E7   02A0
        MVO@    R0,     R5                      ; 52E8   0268
        MVI@    R4,     R0                      ; 52E9   02A0
        MVO@    R0,     R5                      ; 52EA   0268
        MVI@    R4,     R0                      ; 52EB   02A0
        MVO@    R0,     R5                      ; 52EC   0268
        MVI@    R4,     R0                      ; 52ED   02A0
        MVO@    R0,     R5                      ; 52EE   0268
        MVI@    R4,     R0                      ; 52EF   02A0
        MVO@    R0,     R5                      ; 52F0   0268
        DECR    R1                              ; 52F1   0011
        BNEQ    L_52E1                          ; 52F2   022C 0012
        PULR    R7                              ; 52F4   02B7

L_52F5:
        PSHR    R5                              ; 52F5   0275
        MVI     G_0104, R2                      ; 52F6   0282 0104
        SLL     R2,     1                       ; 52F8   004A
        MVII    #$0173, R5                      ; 52F9   02BD 0173
        MVII    #$032D, R3                      ; 52FB   02BB 032D
        ADDR    R2,     R5                      ; 52FD   00D5
        ADDR    R2,     R3                      ; 52FE   00D3
L_52FF:
        MVI@    R5,     R1                      ; 52FF   02A9
        SWAP    R1,     1                       ; 5300   0041
        SDBD                                    ; 5301   0001
        MVII    #$FBFF, R0                      ; 5302   02B8 00FF 00FB
        AND@    R3,     R0                      ; 5305   0398
        XORR    R1,     R0                      ; 5306   01C8
        MVO@    R0,     R3                      ; 5307   0258
        INCR    R3                              ; 5308   000B
        INCR    R2                              ; 5309   000A
        MOVR    R2,     R0                      ; 530A   0090
        SARC    R0,     1                       ; 530B   0078
        BC      L_52FF                          ; 530C   0221 000E
        PULR    R7                              ; 530E   02B7

L_530F:
        PSHR    R5                              ; 530F   0275
        PSHR    R0                              ; 5310   0270
        MOVR    R0,     R5                      ; 5311   0085
        DECR    R3                              ; 5312   0013
        MVI@    R3,     R1                      ; 5313   0299
        ANDR    R0,     R1                      ; 5314   0181
        INCR    R3                              ; 5315   000B
        INCR    R4                              ; 5316   000C
        MVI@    R4,     R0                      ; 5317   02A0
        PSHR    R5                              ; 5318   0275

        JSR     R5,     X_EXT_SIGN_LO           ; 5319   0004 0114 0268

        PULR    R5                              ; 531C   02B5
        ADDR    R0,     R1                      ; 531D   00C1
        ANDR    R5,     R1                      ; 531E   01A9
        COMR    R5                              ; 531F   001D
        AND@    R3,     R5                      ; 5320   039D
        XORR    R5,     R1                      ; 5321   01E9
        MVO@    R1,     R3                      ; 5322   0259
        PULR    R0                              ; 5323   02B0
        PULR    R7                              ; 5324   02B7

        PSHR    R5                              ; 5325   0275
        DIS                                     ; 5326   0003

        JSR     R5,     L_533F                  ; 5327   0004 0150 033F

        MVII    #$0020, R0                      ; 532A   02B8 0020
        CLRR    R4                              ; 532C   01E4
        MVO     R4,     G_0119                  ; 532D   0244 0119

        JSR     R5,     X_FILL_ZERO             ; 532F   0004 0114 0338
        JSR     R5,     L_535F                  ; 5332   0004 0150 035F

        MVII    #$004B, R0                      ; 5335   02B8 004B
        MVO     R0,     .ISRVEC.0               ; 5337   0240 0100
        MVII    #$0051, R0                      ; 5339   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 533B   0240 0101
        EIS                                     ; 533D   0002
        PULR    R7                              ; 533E   02B7

L_533F:
        PSHR    R5                              ; 533F   0275
        CLRR    R0                              ; 5340   01C0
        MVO     R0,     .STIC.HDLY              ; 5341   0240 0030
        MVO     R0,     .STIC.VDLY              ; 5343   0240 0031
        SDBD                                    ; 5345   0001
        MVII    #$5779, R4                      ; 5346   02BC 0079 0057
        MVI@    R4,     R0                      ; 5349   02A0
        MVO     R0,     G_0105                  ; 534A   0240 0105
        MVII    #$0021, R1                      ; 534C   02B9 0021
        TSTR    R0                              ; 534E   0080
        BEQ     L_5353                          ; 534F   0204 0002

        MVO@    R0,     R1                      ; 5351   0248
        INCR    R7                              ; 5352   000F

L_5353:
        MVI@    R1,     R0                      ; 5353   0288
L_5354:
        MVII    #$0028, R1                      ; 5354   02B9 0028
        MVII    #$0005, R0                      ; 5356   02B8 0005

        JSR     R5,     .EXEC.730               ; 5358   0004 0114 0330

        MVI@    R4,     R0                      ; 535B   02A0
        MVO     R0,     .STIC.EDGE              ; 535C   0240 0032
        PULR    R7                              ; 535E   02B7

L_535F:
        PSHR    R5                              ; 535F   0275
        SDBD                                    ; 5360   0001
        MVII    #$59F4, R4                      ; 5361   02BC 00F4 0059

        JSR     R5,     L_5368                  ; 5364   0004 0150 0368

        PULR    R7                              ; 5367   02B7

L_5368:
        PSHR    R5                              ; 5368   0275
        MVI@    R4,     R5                      ; 5369   02A5
        SDBD                                    ; 536A   0001
        ADDI    #$3800, R5                      ; 536B   02FD 0000 0038
        MVI@    R4,     R0                      ; 536E   02A0
L_536F:
        MVI@    R4,     R1                      ; 536F   02A1
        MOVR    R1,     R2                      ; 5370   008A
        SWAP    R2,     1                       ; 5371   0042
        ANDI    #$0003, R2                      ; 5372   03BA 0003
        ANDI    #$00FF, R1                      ; 5374   03B9 00FF
L_5376:
        MVO@    R1,     R5                      ; 5376   0269
        DECR    R2                              ; 5377   0012
        BPL     L_5376                          ; 5378   0223 0003

        DECR    R0                              ; 537A   0010
        BNEQ    L_536F                          ; 537B   022C 000D
        PULR    R7                              ; 537D   02B7

L_537E:
        PSHR    R5                              ; 537E   0275
        MVII    #$0106, R4                      ; 537F   02BC 0106
        MVI     G_0104, R2                      ; 5381   0282 0104
        ANDI    #$0001, R2                      ; 5383   03BA 0001
        BEQ     L_5389                          ; 5385   0204 0002

        ADDI    #$0004, R4                      ; 5387   02FC 0004
L_5389:
        MVI@    R4,     R1                      ; 5389   02A1
        SWAP    R1,     1                       ; 538A   0041
        XOR@    R4,     R1                      ; 538B   03E1
        MVI@    R4,     R0                      ; 538C   02A0
        PSHR    R2                              ; 538D   0272

        JSR     R5,     X_EXT_SIGN_LO           ; 538E   0004 0114 0268

        MVI     G_010E, R2                      ; 5391   0282 010E

        JSR     R5,     L_54C4                  ; 5393   0004 0154 00C4

        PULR    R2                              ; 5396   02B2
        ADDR    R0,     R1                      ; 5397   00C1
        MOVR    R1,     R0                      ; 5398   0088
        SLL     R2,     1                       ; 5399   004A
        SAR     R0,     2                       ; 539A   006C
        SAR     R0,     2                       ; 539B   006C
        SAR     R0,     2                       ; 539C   006C
        SAR     R0,     2                       ; 539D   006C
        BMI     L_53A5                          ; 539E   020B 0005

        CMPI    #$0007, R0                      ; 53A0   0378 0007
        BLE     L_53BE                          ; 53A2   0206 001A
        INCR    R7                              ; 53A4   000F

L_53A5:
        INCR    R2                              ; 53A5   000A
L_53A6:
        MVO     R2,     G_010F                  ; 53A6   0242 010F
        MVI     .ISRVEC.0,R2                    ; 53A8   0282 0100
        MVO     R2,     G_016E                  ; 53AA   0242 016E
        MVI     .ISRVEC.1,R2                    ; 53AC   0282 0101
        MVO     R2,     G_016F                  ; 53AE   0242 016F
        SDBD                                    ; 53B0   0001
        MVII    #$00C8, R2                      ; 53B1   02BA 00C8 0000
        MVO     R2,     .ISRVEC.0               ; 53B4   0242 0100
        SDBD                                    ; 53B6   0001
        MVII    #$0053, R2                      ; 53B7   02BA 0053 0000
        MVO     R2,     .ISRVEC.1               ; 53BA   0242 0101
        ANDI    #$0007, R0                      ; 53BC   03B8 0007
L_53BE:
        SUBI    #$0003, R4                      ; 53BE   033C 0003
        MOVR    R0,     R2                      ; 53C0   0082
        SUB@    R4,     R2                      ; 53C1   0322
        DECR    R4                              ; 53C2   0014
        MVO@    R0,     R4                      ; 53C3   0260
        MVO@    R1,     R4                      ; 53C4   0261
        INCR    R4                              ; 53C5   000C
        MVO@    R2,     R4                      ; 53C6   0262
        PULR    R7                              ; 53C7   02B7

        PSHR    R5                              ; 53C8   0275
        MVO     R0,     .STIC.VIDEN             ; 53C9   0240 0020
        MVI     G_0103, R0                      ; 53CB   0280 0103
        TSTR    R0                              ; 53CD   0080
        BEQ     L_53D1                          ; 53CE   0204 0001
        PULR    R7                              ; 53D0   02B7

L_53D1:
        INCR    R0                              ; 53D1   0008
        MVO     R0,     G_0103                  ; 53D2   0240 0103
        MVI     G_0106, R0                      ; 53D4   0280 0106
        MVO     R0,     .STIC.HDLY              ; 53D6   0240 0030
        MVI     G_010A, R0                      ; 53D8   0280 010A
        MVO     R0,     .STIC.VDLY              ; 53DA   0240 0031
        MVII    #$0008, R5                      ; 53DC   02BD 0008
        MVII    #$032D, R4                      ; 53DE   02BC 032D
        MVI     G_010F, R2                      ; 53E0   0282 010F
        RRC     R2,     2                       ; 53E2   0076
        BOV     L_53E7                          ; 53E3   0202 0002

        SUBR    R5,     R4                      ; 53E5   012C
        CLRR    R5                              ; 53E6   01ED
L_53E7:
        MVI@    R4,     R0                      ; 53E7   02A0
        MVO@    R0,     R5                      ; 53E8   0268
        MVI@    R4,     R0                      ; 53E9   02A0
        MVO@    R0,     R5                      ; 53EA   0268
        MVI@    R4,     R0                      ; 53EB   02A0
        MVO@    R0,     R5                      ; 53EC   0268
        MVI@    R4,     R0                      ; 53ED   02A0
        MVO@    R0,     R5                      ; 53EE   0268
        MVI@    R4,     R0                      ; 53EF   02A0
        MVO@    R0,     R5                      ; 53F0   0268
        MVI@    R4,     R0                      ; 53F1   02A0
        MVO@    R0,     R5                      ; 53F2   0268
        MVI@    R4,     R0                      ; 53F3   02A0
        MVO@    R0,     R5                      ; 53F4   0268
        MVI@    R4,     R0                      ; 53F5   02A0
        MVO@    R0,     R5                      ; 53F6   0268
        MVI     G_010F, R2                      ; 53F7   0282 010F

        JSR     R5,     L_5437                  ; 53F9   0004 0154 0037
        JSR     R5,     L_57CD                  ; 53FC   0004 0154 03CD
        JSR     R5,     X_PLAY_NOTE             ; 53FF   0004 0118 02BD

        DIS                                     ; 5402   0003
        MVI     G_016E, R0                      ; 5403   0280 016E
        MVO     R0,     .ISRVEC.0               ; 5405   0240 0100
        MVI     G_016F, R0                      ; 5407   0280 016F
        MVO     R0,     .ISRVEC.1               ; 5409   0240 0101
        EIS                                     ; 540B   0002
        CLRR    R0                              ; 540C   01C0
        MVO     R0,     G_0103                  ; 540D   0240 0103
        PULR    R7                              ; 540F   02B7

L_5410:
        PSHR    R5                              ; 5410   0275
        MVII    #$0008, R5                      ; 5411   02BD 0008
        MVII    #$0325, R3                      ; 5413   02BB 0325
        MVII    #$0008, R0                      ; 5415   02B8 0008
        MVI     G_010F, R1                      ; 5417   0281 010F
        RRC     R1,     1                       ; 5419   0071
        BNC     L_541D                          ; 541A   0209 0001

        NEGR    R0                              ; 541C   0020
L_541D:
        MVII    #$00FF, R2                      ; 541D   02BA 00FF
        RRC     R1,     1                       ; 541F   0071
        BNC     L_5425                          ; 5420   0209 0003

        ADDR    R5,     R3                      ; 5422   00EB
        MVII    #$007F, R2                      ; 5423   02BA 007F
L_5425:
        MVI@    R3,     R4                      ; 5425   029C
        TSTR    R4                              ; 5426   00A4
        BPL     L_5432                          ; 5427   0203 0009

        COMR    R2                              ; 5429   001A
        ANDR    R2,     R4                      ; 542A   0194
        COMR    R2                              ; 542B   001A
        MVI@    R3,     R1                      ; 542C   0299
        ANDR    R2,     R1                      ; 542D   0191
        ADDR    R0,     R1                      ; 542E   00C1
        ANDR    R2,     R1                      ; 542F   0191
        XORR    R4,     R1                      ; 5430   01E1
        MVO@    R1,     R3                      ; 5431   0259
L_5432:
        INCR    R3                              ; 5432   000B
        DECR    R5                              ; 5433   0015
        BNEQ    L_5425                          ; 5434   022C 0010
        PULR    R7                              ; 5436   02B7

L_5437:
        PSHR    R5                              ; 5437   0275
        PSHR    R2                              ; 5438   0272
        RRC     R2,     1                       ; 5439   0072
        BC      L_5449                          ; 543A   0201 000D

        RRC     R2,     1                       ; 543C   0072
        BC      L_5444                          ; 543D   0201 0005

        JSR     R5,     L_5456                  ; 543F   0004 0154 0056

        B       L_5454                          ; 5442   0200 0010

L_5444:
        JSR     R5,     L_546D                  ; 5444   0004 0154 006D

        B       L_5454                          ; 5447   0200 000B

L_5449:
        RRC     R2,     1                       ; 5449   0072
        BC      L_5451                          ; 544A   0201 0005

        JSR     R5,     L_54A4                  ; 544C   0004 0154 00A4

        B       L_5454                          ; 544F   0200 0003

L_5451:
        JSR     R5,     L_54B7                  ; 5451   0004 0154 00B7

L_5454:
        PULR    R2                              ; 5454   02B2
        PULR    R7                              ; 5455   02B7

L_5456:
        PSHR    R5                              ; 5456   0275
        MVII    #$0213, R3                      ; 5457   02BB 0213
        MVII    #$0212, R2                      ; 5459   02BA 0212
L_545B:
        MVII    #$0013, R1                      ; 545B   02B9 0013
L_545D:
        MVI@    R2,     R0                      ; 545D   0290
        MVO@    R0,     R3                      ; 545E   0258
        DECR    R3                              ; 545F   0013
        DECR    R2                              ; 5460   0012
        DECR    R1                              ; 5461   0011
        BNEQ    L_545D                          ; 5462   022C 0006

        ADDI    #$0027, R3                      ; 5464   02FB 0027
        ADDI    #$0027, R2                      ; 5466   02FA 0027
        CMPI    #$02F0, R2                      ; 5468   037A 02F0
        BLT     L_545B                          ; 546A   0225 0010
        PULR    R7                              ; 546C   02B7

L_546D:
        PSHR    R5                              ; 546D   0275
        MVII    #$02C8, R4                      ; 546E   02BC 02C8
        MVII    #$02DC, R5                      ; 5470   02BD 02DC
        MVII    #$0028, R1                      ; 5472   02B9 0028
        MVII    #$000B, R2                      ; 5474   02BA 000B
L_5476:
        MVI@    R4,     R0                      ; 5476   02A0
        MVO@    R0,     R5                      ; 5477   0268
        MVI@    R4,     R0                      ; 5478   02A0
        MVO@    R0,     R5                      ; 5479   0268
        MVI@    R4,     R0                      ; 547A   02A0
        MVO@    R0,     R5                      ; 547B   0268
        MVI@    R4,     R0                      ; 547C   02A0
        MVO@    R0,     R5                      ; 547D   0268
        MVI@    R4,     R0                      ; 547E   02A0
        MVO@    R0,     R5                      ; 547F   0268
        MVI@    R4,     R0                      ; 5480   02A0
        MVO@    R0,     R5                      ; 5481   0268
        MVI@    R4,     R0                      ; 5482   02A0
        MVO@    R0,     R5                      ; 5483   0268
        MVI@    R4,     R0                      ; 5484   02A0
        MVO@    R0,     R5                      ; 5485   0268
        MVI@    R4,     R0                      ; 5486   02A0
        MVO@    R0,     R5                      ; 5487   0268
        MVI@    R4,     R0                      ; 5488   02A0
        MVO@    R0,     R5                      ; 5489   0268
        MVI@    R4,     R0                      ; 548A   02A0
        MVO@    R0,     R5                      ; 548B   0268
        MVI@    R4,     R0                      ; 548C   02A0
        MVO@    R0,     R5                      ; 548D   0268
        MVI@    R4,     R0                      ; 548E   02A0
        MVO@    R0,     R5                      ; 548F   0268
        MVI@    R4,     R0                      ; 5490   02A0
        MVO@    R0,     R5                      ; 5491   0268
        MVI@    R4,     R0                      ; 5492   02A0
        MVO@    R0,     R5                      ; 5493   0268
        MVI@    R4,     R0                      ; 5494   02A0
        MVO@    R0,     R5                      ; 5495   0268
        MVI@    R4,     R0                      ; 5496   02A0
        MVO@    R0,     R5                      ; 5497   0268
        MVI@    R4,     R0                      ; 5498   02A0
        MVO@    R0,     R5                      ; 5499   0268
        MVI@    R4,     R0                      ; 549A   02A0
        MVO@    R0,     R5                      ; 549B   0268
        MVI@    R4,     R0                      ; 549C   02A0
        MVO@    R0,     R5                      ; 549D   0268
        SUBR    R1,     R4                      ; 549E   010C
        SUBR    R1,     R5                      ; 549F   010D
        DECR    R2                              ; 54A0   0012
        BNEQ    L_5476                          ; 54A1   022C 002C
        PULR    R7                              ; 54A3   02B7

L_54A4:
        PSHR    R5                              ; 54A4   0275
        MVII    #$0200, R5                      ; 54A5   02BD 0200
        MVII    #$0201, R4                      ; 54A7   02BC 0201
L_54A9:
        MVII    #$0013, R1                      ; 54A9   02B9 0013
L_54AB:
        MVI@    R4,     R0                      ; 54AB   02A0
        MVO@    R0,     R5                      ; 54AC   0268
        DECR    R1                              ; 54AD   0011
        BNEQ    L_54AB                          ; 54AE   022C 0004

        INCR    R4                              ; 54B0   000C
        INCR    R5                              ; 54B1   000D
        CMPI    #$02DD, R4                      ; 54B2   037C 02DD
        BLE     L_54A9                          ; 54B4   0226 000C
        PULR    R7                              ; 54B6   02B7

L_54B7:
        PSHR    R5                              ; 54B7   0275
        MVII    #$0200, R5                      ; 54B8   02BD 0200
        MVII    #$0214, R4                      ; 54BA   02BC 0214
        MVII    #$00DC, R1                      ; 54BC   02B9 00DC
L_54BE:
        MVI@    R4,     R0                      ; 54BE   02A0
        MVO@    R0,     R5                      ; 54BF   0268
        DECR    R1                              ; 54C0   0011
        BNEQ    L_54BE                          ; 54C1   022C 0004
        PULR    R7                              ; 54C3   02B7

L_54C4:
        TSTR    R2                              ; 54C4   0092
        BEQ     L_54CB                          ; 54C5   0204 0004

L_54C7:
        SLL     R0,     1                       ; 54C7   0048
        DECR    R2                              ; 54C8   0012
        BNEQ    L_54C7                          ; 54C9   022C 0003
L_54CB:
        MOVR    R5,     R7                      ; 54CB   00AF

        DECLE   $00BF                           ; 54CC   00BF

        SLR     R1,     2                       ; 54CD   0065
        TSTR    R3                              ; 54CE   009B
        SAR     R0,     1                       ; 54CF   0068
        ADDR    R0,     R0                      ; 54D0   00C0
        SLR     R2,     2                       ; 54D1   0066
        ADDR    R0,     R3                      ; 54D2   00C3
        RLC     R3,     2                       ; 54D3   0057
        MOVR    R7,     R5                      ; 54D4   00BD
        SLR     R2,     2                       ; 54D5   0066
        ADDR    R0,     R3                      ; 54D6   00C3
        RLC     R3,     2                       ; 54D7   0057
        ADDR    R5,     R4                      ; 54D8   00EC
        RLC     R0,     2                       ; 54D9   0054
        ADDR    R0,     R3                      ; 54DA   00C3
        RLC     R3,     2                       ; 54DB   0057
        ADDR    R0,     R3                      ; 54DC   00C3
        RLC     R3,     2                       ; 54DD   0057
        ADDR    R0,     R3                      ; 54DE   00C3
        RLC     R3,     2                       ; 54DF   0057
        ADDR    R0,     R3                      ; 54E0   00C3
        RLC     R3,     2                       ; 54E1   0057
        ADDR    R0,     R3                      ; 54E2   00C3
        RLC     R3,     2                       ; 54E3   0057
        MOVR    R7,     R1                      ; 54E4   00B9
        SAR     R2,     1                       ; 54E5   006A
        NEGR    R3                              ; 54E6   0023
        SAR     R3,     1                       ; 54E7   006B
        GSWD    R1                              ; 54E8   0031
        SAR     R3,     1                       ; 54E9   006B
        GSWD    R1                              ; 54EA   0031
        SAR     R3,     1                       ; 54EB   006B
        PSHR    R5                              ; 54EC   0275
        MVO     R1,     G_0188                  ; 54ED   0241 0188
        CLRR    R1                              ; 54EF   01C9
        CMPI    #$0007, R0                      ; 54F0   0378 0007
        BLT     L_57C2                          ; 54F2   0205 02CE
        BEQ     L_5500                          ; 54F4   0204 000A

        CMPI    #$0009, R0                      ; 54F6   0378 0009
        BGT     L_57C2                          ; 54F8   020E 02C8
        BLT     L_54FE                          ; 54FA   0205 0002

        ADDI    #$0004, R1                      ; 54FC   02F9 0004
L_54FE:
        ADDI    #$0004, R1                      ; 54FE   02F9 0004
L_5500:
        MVO     R1,     G_019D                  ; 5500   0241 019D
        CLRR    R0                              ; 5502   01C0
        MVO     R0,     G_01C0                  ; 5503   0240 01C0
        MVO     R0,     G_02F1                  ; 5505   0240 02F1
        DECR    R0                              ; 5507   0010
        MVII    #$0005, R0                      ; 5508   02B8 0005
        MVO     R0,     G_019F                  ; 550A   0240 019F
        MVI     G_018E, R1                      ; 550C   0281 018E
        MVO     R1,     G_035E                  ; 550E   0241 035E

        JSR     R5,     L_6DDF                  ; 5510   0004 016C 01DF
L_5513:
        JSR     R5,     L_5583                  ; 5513   0004 0154 0183
        DECLE   $03FF                           ; 5516   03FF

        CLRR    R1                              ; 5517   01C9
        MVO     R1,     G_0198                  ; 5518   0241 0198
        MVO     R1,     G_018F                  ; 551A   0241 018F
        MVO     R1,     G_0185                  ; 551C   0241 0185
        MVO     R1,     G_0186                  ; 551E   0241 0186
        INCR    R1                              ; 5520   0009
        MVO     R1,     G_01A7                  ; 5521   0241 01A7

        JSR     R5,     L_56D7                  ; 5523   0004 0154 02D7
        JSR     R5,     L_5571                  ; 5526   0004 0154 0171
        JSR     R5,     L_61CD                  ; 5529   0004 0160 01CD
        JSR     R5,     L_5550                  ; 552C   0004 0154 0150

        CLRR    R4                              ; 552F   01E4

        JSR     R5,     L_5534                  ; 5530   0004 0154 0134

        PULR    R7                              ; 5533   02B7

L_5534:
        SDBD                                    ; 5534   0001
        ADDI    #$54CC, R4                      ; 5535   02FC 00CC 0054
        MVO     R4,     G_035D                  ; 5538   0244 035D
        MOVR    R5,     R7                      ; 553A   00AF

L_553B:
        MVII    #$0100, R4                      ; 553B   02BC 0100
        DIS                                     ; 553D   0003
        SDBD                                    ; 553E   0001
        MVI@    R4,     R1                      ; 553F   02A1
        SDBD                                    ; 5540   0001
        CMPI    #$514B, R1                      ; 5541   0379 004B 0051
        BEQ     L_5548                          ; 5544   0204 0002

        EIS                                     ; 5546   0002
        MOVR    R5,     R7                      ; 5547   00AF

L_5548:
        MVII    #$0100, R4                      ; 5548   02BC 0100
        DIS                                     ; 554A   0003
        MVO@    R0,     R4                      ; 554B   0260
        SWAP    R0,     1                       ; 554C   0040
        MVO@    R0,     R4                      ; 554D   0260
        EIS                                     ; 554E   0002
        MOVR    R5,     R7                      ; 554F   00AF

L_5550:
        PSHR    R5                              ; 5550   0275
        CLRR    R2                              ; 5551   01D2
        MVO     R2,     G_01A6                  ; 5552   0242 01A6
        MVO     R2,     G_0108                  ; 5554   0242 0108
        MVO     R2,     G_010C                  ; 5556   0242 010C
        MVII    #$0002, R2                      ; 5558   02BA 0002
        MVII    #$032B, R3                      ; 555A   02BB 032B
        SDBD                                    ; 555C   0001
        MVII    #$6231, R4                      ; 555D   02BC 0031 0062

        JSR     R5,     L_5705                  ; 5560   0004 0154 0305

        MVII    #$0006, R3                      ; 5563   02BB 0006
        SDBD                                    ; 5565   0001
        MVII    #$2001, R2                      ; 5566   02BA 0001 0020

        JSR     R5,     L_641F                  ; 5569   0004 0164 001F

        MVII    #$0006, R2                      ; 556C   02BA 0006
        J       L_6BD4                          ; 556E   0004 0368 03D4

L_5571:
        PSHR    R5                              ; 5571   0275
        MVII    #$005B, R0                      ; 5572   02B8 005B
        MVO     R0,     G_017B                  ; 5574   0240 017B
        MVII    #$0078, R0                      ; 5576   02B8 0078
        MVO     R0,     G_017C                  ; 5578   0240 017C

        JSR     R5,     L_6FDA                  ; 557A   0004 016C 03DA

        J       L_5944                          ; 557D   0004 0358 0144

L_5580:
        MVII    #$0080, R3                      ; 5580   02BB 0080
        INCR    R7                              ; 5582   000F

L_5583:
        CLRR    R3                              ; 5583   01DB
L_5584:
        MVI@    R5,     R1                      ; 5584   02A9
        MVII    #$015C, R2                      ; 5585   02BA 015C
L_5587:
        INCR    R2                              ; 5587   000A
        RRC     R1,     1                       ; 5588   0071
        BC      L_5590                          ; 5589   0201 0005

        CMPI    #$0165, R2                      ; 558B   037A 0165
        BLT     L_5587                          ; 558D   0225 0007
        MOVR    R5,     R7                      ; 558F   00AF

L_5590:
        MVI@    R2,     R0                      ; 5590   0290
        ANDI    #$007F, R0                      ; 5591   03B8 007F
        XORR    R3,     R0                      ; 5593   01D8
        MVO@    R0,     R2                      ; 5594   0250
        B       L_5587                          ; 5595   0220 000F

        DECLE   $00B6,  $00AD,  $0056,  $00DC   ; 5597   00B6 00AD 0056 00DC
        DECLE   $00CA,  $00B0,  $00E8,  $00C0   ; 559B   00CA 00B0 00E8 00C0
        DECLE   $003D,  $00D6,  $00DC,  $0079   ; 559F   003D 00D6 00DC 0079
        DECLE   $00B8,  $0064,  $00C0,  $00C0   ; 55A3   00B8 0064 00C0 00C0
        DECLE   $0016,  $0049,  $0056,  $0002   ; 55A7   0016 0049 0056 0002
        DECLE   $0094,  $0056,  $0001,  $00BF   ; 55AB   0094 0056 0001 00BF

        SLR     R1,     2                       ; 55AF   0065
        INCR    R7                              ; 55B0   000F

        ADDR    R2,     R3                      ; 55B1   00D3
L_55B2:
        SLR     R0,     2                       ; 55B2   0064
        DECLE   $0005,  $00C2,  $0055,  $0001   ; 55B3   0005 00C2 0055 0001

        ADDR    R0,     R3                      ; 55B7   00C3
        RLC     R3,     2                       ; 55B8   0057
        SARC    R0,     1                       ; 55B9   0078
        ADDR    R0,     R7                      ; 55BA   00C7

        DECLE   $0056,  $0001,  $00C2,  $006C   ; 55BB   0056 0001 00C2 006C
        DECLE   $0003,  $00FF                   ; 55BF   0003 00FF

        RLC     R1,     2                       ; 55C1   0055
        PSHR    R5                              ; 55C2   0275
        MVII    #$0001, R5                      ; 55C3   02BD 0001
        MVII    #$0325, R1                      ; 55C5   02B9 0325
        MVII    #$032D, R2                      ; 55C7   02BA 032D
L_55C9:
        MOVR    R1,     R3                      ; 55C9   008B
        SUBI    #$0325, R3                      ; 55CA   033B 0325
        MVI@    R1,     R4                      ; 55CC   028C
        MVI@    R2,     R0                      ; 55CD   0290
        ANDI    #$00FF, R4                      ; 55CE   03BC 00FF
        CMPI    #$00AF, R4                      ; 55D0   037C 00AF
        BGT     L_55DA                          ; 55D2   020E 0006

        ANDI    #$007F, R0                      ; 55D4   03B8 007F
        CMPI    #$006E, R0                      ; 55D6   0378 006E
        BLT     L_55F6                          ; 55D8   0205 001C

L_55DA:
        MVI     G_01AA, R5                      ; 55DA   0285 01AA
        TSTR    R5                              ; 55DC   00AD
        BNEQ    L_55F6                          ; 55DD   020C 0017

        CMPI    #$0004, R3                      ; 55DF   037B 0004
        BNEQ    L_55EB                          ; 55E1   020C 0008

        MVI     G_018F, R0                      ; 55E3   0280 018F
        SWAP    R0,     2                       ; 55E5   0044
        BPL     L_55EB                          ; 55E6   0203 0003

        NEGR    R0                              ; 55E8   0020
        MVO     R0,     G_018F                  ; 55E9   0240 018F
L_55EB:
        PSHR    R5                              ; 55EB   0275
        PSHR    R1                              ; 55EC   0271
        PSHR    R2                              ; 55ED   0272
        MVII    #$0002, R2                      ; 55EE   02BA 0002

        JSR     R5,     L_56DA                  ; 55F0   0004 0154 02DA

        PULR    R2                              ; 55F3   02B2
        PULR    R1                              ; 55F4   02B1
        PULR    R5                              ; 55F5   02B5
L_55F6:
        ADDI    #$0004, R1                      ; 55F6   02F9 0004
        ADDI    #$0004, R2                      ; 55F8   02FA 0004
        DECR    R5                              ; 55FA   0015
        BPL     L_55C9                          ; 55FB   0223 0033
        B       L_5966                          ; 55FD   0200 0367

        PSHR    R5                              ; 55FF   0275
        MVI     G_019D, R1                      ; 5600   0281 019D
        CMPI    #$0002, R1                      ; 5602   0379 0002
        BLT     L_57C2                          ; 5604   0205 01BC

        MVI     G_018F, R1                      ; 5606   0281 018F
        SWAP    R1,     2                       ; 5608   0045
        BPL     L_57C2                          ; 5609   0203 01B7

        MVI     G_01BF, R1                      ; 560B   0281 01BF
        TSTR    R1                              ; 560D   0089
        BEQ     L_5636                          ; 560E   0204 0026

        JSR     R5,     L_6FC6                  ; 5610   0004 016C 03C6

        MVII    #$00FF, R0                      ; 5613   02B8 00FF
        ANDR    R0,     R1                      ; 5615   0181
        ANDR    R0,     R2                      ; 5616   0182
        SARC    R0,     1                       ; 5617   0078
        ANDR    R0,     R3                      ; 5618   0183
        ANDR    R0,     R4                      ; 5619   0184
        MVII    #$0001, R0                      ; 561A   02B8 0001
        CMPR    R4,     R3                      ; 561C   0163
        BLT     L_5620                          ; 561D   0205 0001

        INCR    R0                              ; 561F   0008
L_5620:
        CMPR    R2,     R1                      ; 5620   0151
        BLT     L_5625                          ; 5621   0205 0002

        XORI    #$0001, R0                      ; 5623   03F8 0001
L_5625:
        MOVR    R0,     R3                      ; 5625   0083
        PSHR    R0                              ; 5626   0270
        MVII    #$0329, R2                      ; 5627   02BA 0329
        MOVR    R2,     R0                      ; 5629   0090
        MVII    #$0331, R1                      ; 562A   02B9 0331

        JSR     R5,     L_62D9                  ; 562C   0004 0160 02D9

        PULR    R1                              ; 562F   02B1
        TSTR    R0                              ; 5630   0080
        BNEQ    L_5636                          ; 5631   020C 0003

        JSR     R5,     L_6C06                  ; 5633   0004 016C 0006

L_5636:
        MVI     G_019D, R0                      ; 5636   0280 019D
        CMPI    #$0004, R0                      ; 5638   0378 0004
        BLT     L_57C2                          ; 563A   0205 0186

        MVI     G_01A2, R0                      ; 563C   0280 01A2
        DECR    R0                              ; 563E   0010
        BGT     L_5646                          ; 563F   020E 0005

        JSR     R5,     L_6C4E                  ; 5641   0004 016C 004E

        MVII    #$0006, R0                      ; 5644   02B8 0006
L_5646:
        MVO     R0,     G_01A2                  ; 5646   0240 01A2
        PULR    R7                              ; 5648   02B7

        PSHR    R5                              ; 5649   0275
        MVI     G_0198, R0                      ; 564A   0280 0198
        CMPI    #$0001, R0                      ; 564C   0378 0001
        BEQ     L_566C                          ; 564E   0204 001C

        MVI     G_0196, R0                      ; 5650   0280 0196
        TSTR    R0                              ; 5652   0080
        BEQ     L_566C                          ; 5653   0204 0017

        MVI     G_01AC, R2                      ; 5655   0282 01AC
        TSTR    R2                              ; 5657   0092
        BNEQ    L_566C                          ; 5658   020C 0012

        MVI     G_01A1, R2                      ; 565A   0282 01A1
        DECR    R2                              ; 565C   0012
        BLT     L_566C                          ; 565D   0205 000D

        MVO     R2,     G_01A1                  ; 565F   0242 01A1
        PSHR    R2                              ; 5661   0272

        JSR     R5,     L_6B0F                  ; 5662   0004 0168 030F

        PULR    R2                              ; 5665   02B2
        TSTR    R2                              ; 5666   0092
        BGT     L_566C                          ; 5667   020E 0003

        JSR     R5,     L_69F9                  ; 5669   0004 0168 01F9

L_566C:
        MVI     G_01AA, R0                      ; 566C   0280 01AA
        DECR    R0                              ; 566E   0010
        BMI     L_5673                          ; 566F   020B 0002

        MVO     R0,     G_01AA                  ; 5671   0240 01AA
L_5673:
        MVI     G_01C0, R0                      ; 5673   0280 01C0
        DECR    R0                              ; 5675   0010
        BMI     L_567E                          ; 5676   020B 0006

        MVO     R0,     G_01C0                  ; 5678   0240 01C0
        BGT     L_567E                          ; 567A   020E 0002
        MVI     G_02F2, R7                      ; 567C   0287 02F2
L_567E:
        PULR    R7                              ; 567E   02B7

L_567F:
        PSHR    R5                              ; 567F   0275
        MVII    #$0006, R0                      ; 5680   02B8 0006
        MVO     R0,     G_0189                  ; 5682   0240 0189
        ADD     G_0185, R2                      ; 5684   02C2 0185
        ANDI    #$0003, R2                      ; 5686   03BA 0003
        MVO     R2,     G_0185                  ; 5688   0242 0185
        MVO     R2,     G_0186                  ; 568A   0242 0186

        JSR     R5,     L_6692                  ; 568C   0004 0164 0292

        MVII    #$0006, R2                      ; 568F   02BA 0006
        J       L_6BD4                          ; 5691   0004 0368 03D4

        PSHR    R5                              ; 5694   0275
        MVI     G_01A0, R3                      ; 5695   0283 01A0
        DECR    R3                              ; 5697   0013
        BMI     L_57C2                          ; 5698   020B 0128

        MVO     R3,     G_01A0                  ; 569A   0243 01A0
        BEQ     L_56AB                          ; 569C   0204 000D

        MVII    #$0004, R0                      ; 569E   02B8 0004

        JSR     R5,     X_RAND1                 ; 56A0   0004 0114 027D

        CLRR    R1                              ; 56A3   01C9
        SARC    R0,     2                       ; 56A4   007C
        RLC     R1,     2                       ; 56A5   0055
        MVO     R0,     G_0106                  ; 56A6   0240 0106
        MVO     R1,     G_010A                  ; 56A8   0241 010A
        PULR    R7                              ; 56AA   02B7

L_56AB:
        MVO     R3,     G_01A1                  ; 56AB   0243 01A1
        J       L_6BB6                          ; 56AD   0004 0368 03B6

        CLRR    R1                              ; 56B0   01C9
        MVI     G_018F, R2                      ; 56B1   0282 018F
        SWAP    R2,     2                       ; 56B3   0046
        BPL     L_56C4                          ; 56B4   0203 000E

        MVI     G_019D, R2                      ; 56B6   0282 019D
        CMPI    #$000A, R2                      ; 56B8   037A 000A
        BLT     L_56C4                          ; 56BA   0205 0008

        MVI     G_0344, R2                      ; 56BC   0282 0344
        TSTR    R2                              ; 56BE   0092
        BEQ     L_56C4                          ; 56BF   0204 0003

        JSR     R5,     L_6D17                  ; 56C1   0004 016C 0117

L_56C4:
        MVO     R1,     G_01A5                  ; 56C4   0241 01A5
        PULR    R7                              ; 56C6   02B7

        PSHR    R5                              ; 56C7   0275
        MVI     G_018F, R0                      ; 56C8   0280 018F
        SWAP    R0,     2                       ; 56CA   0044
        BPL     L_56D0                          ; 56CB   0203 0003

        JSR     R5,     L_6F07                  ; 56CD   0004 016C 0307

L_56D0:
        PULR    R7                              ; 56D0   02B7

L_56D1:
        MVI@    R5,     R0                      ; 56D1   02A8
        MVO     R0,     G_01C0                  ; 56D2   0240 01C0
        MVO     R5,     G_02F2                  ; 56D4   0245 02F2
        PULR    R7                              ; 56D6   02B7

L_56D7:
        MVII    #$0008, R2                      ; 56D7   02BA 0008
        CLRR    R3                              ; 56D9   01DB
L_56DA:
        DECR    R2                              ; 56DA   0012
        INCR    R7                              ; 56DB   000F

L_56DC:
        CLRR    R2                              ; 56DC   01D2
L_56DD:
        PSHR    R5                              ; 56DD   0275
        PSHR    R3                              ; 56DE   0273
        MOVR    R3,     R4                      ; 56DF   009C
        MOVR    R3,     R5                      ; 56E0   009D
        ADDI    #$0325, R4                      ; 56E1   02FC 0325
        ADDI    #$033D, R5                      ; 56E3   02FD 033D
L_56E5:
        CLRR    R0                              ; 56E5   01C0
        MVO@    R0,     R4                      ; 56E6   0260
        MVO@    R0,     R5                      ; 56E7   0268
        PSHR    R5                              ; 56E8   0275
        ADDI    #$000F, R5                      ; 56E9   02FD 000F
        MVO@    R0,     R5                      ; 56EB   0268
        SUBI    #$034E, R5                      ; 56EC   033D 034E
        MOVR    R5,     R3                      ; 56EE   00AB

        JSR     R5,     L_56F8                  ; 56EF   0004 0154 02F8

        PULR    R5                              ; 56F2   02B5
        DECR    R2                              ; 56F3   0012
        BPL     L_56E5                          ; 56F4   0223 0010

        PULR    R3                              ; 56F6   02B3
        PULR    R7                              ; 56F7   02B7

L_56F8:
        PSHR    R5                              ; 56F8   0275
        MOVR    R3,     R0                      ; 56F9   0098

        JSR     R5,     X_POW2                  ; 56FA   0004 0114 0345

        COMR    R0                              ; 56FD   0018
        DIS                                     ; 56FE   0003
        AND     G_0117, R0                      ; 56FF   0380 0117
        MVO     R0,     G_0117                  ; 5701   0240 0117
        EIS                                     ; 5703   0002
        PULR    R7                              ; 5704   02B7

L_5705:
        DECR    R2                              ; 5705   0012
        INCR    R7                              ; 5706   000F

L_5707:
        CLRR    R2                              ; 5707   01D2
L_5708:
        PSHR    R5                              ; 5708   0275
L_5709:
        MVII    #$0002, R1                      ; 5709   02B9 0002

        JSR     R5,     L_5735                  ; 570B   0004 0154 0335

        SDBD                                    ; 570E   0001
        MVI@    R4,     R0                      ; 570F   02A0
        MVI@    R3,     R1                      ; 5710   0299
        SDBD                                    ; 5711   0001
        ANDI    #$0FF8, R1                      ; 5712   03B9 00F8 000F
        XORR    R0,     R1                      ; 5715   01C1
        MVO@    R1,     R3                      ; 5716   0259
        ADDI    #$0008, R3                      ; 5717   02FB 0008
        MVII    #$0003, R1                      ; 5719   02B9 0003

        JSR     R5,     L_5735                  ; 571B   0004 0154 0335

        SUBI    #$0355, R3                      ; 571E   033B 0355
        MVII    #$0166, R1                      ; 5720   02B9 0166
        ADDR    R3,     R1                      ; 5722   00D9
        MVO@    R1,     R1                      ; 5723   0249
        PSHR    R3                              ; 5724   0273
        SLL     R3,     1                       ; 5725   004B
        ADDI    #$0126, R3                      ; 5726   02FB 0126
        MVI@    R4,     R0                      ; 5728   02A0
        MVO@    R0,     R3                      ; 5729   0258
        ADDI    #$0010, R3                      ; 572A   02FB 0010
        MVI@    R4,     R0                      ; 572C   02A0
        MVO@    R0,     R3                      ; 572D   0258
        PULR    R3                              ; 572E   02B3
        ADDI    #$0326, R3                      ; 572F   02FB 0326
        DECR    R2                              ; 5731   0012
        BPL     L_5709                          ; 5732   0223 002A
        PULR    R7                              ; 5734   02B7

L_5735:
        SDBD                                    ; 5735   0001
        MVI@    R4,     R0                      ; 5736   02A0
        MVO@    R0,     R3                      ; 5737   0258
        ADDI    #$0008, R3                      ; 5738   02FB 0008
        DECR    R1                              ; 573A   0011
        BNEQ    L_5735                          ; 573B   022C 0007
        MOVR    R5,     R7                      ; 573D   00AF

L_573E:
        CLRR    R1                              ; 573E   01C9
        CLRR    R2                              ; 573F   01D2
L_5740:
        MVO@    R1,     R3                      ; 5740   0259
        ADDI    #$0010, R3                      ; 5741   02FB 0010
        MVO@    R2,     R3                      ; 5743   025A
        MOVR    R5,     R7                      ; 5744   00AF

L_5745:
        PSHR    R3                              ; 5745   0273
        ADDI    #$0325, R3                      ; 5746   02FB 0325
        MVI@    R3,     R0                      ; 5748   0298
        ANDI    #$00FF, R0                      ; 5749   03B8 00FF
        MOVR    R1,     R2                      ; 574B   008A
        RRC     R1,     1                       ; 574C   0071
        BC      L_5751                          ; 574D   0201 0002

        SUBI    #$0008, R0                      ; 574F   0338 0008
L_5751:
        TSTR    R0                              ; 5751   0080
        BMI     L_5775                          ; 5752   020B 0021

        SLR     R0,     2                       ; 5754   0064
        SLR     R0,     1                       ; 5755   0060
        ADDI    #$0008, R3                      ; 5756   02FB 0008
        MOVR    R0,     R4                      ; 5758   0084
        MVI@    R3,     R1                      ; 5759   0299
        ANDI    #$007F, R1                      ; 575A   03B9 007F
        CMPI    #$0008, R2                      ; 575C   037A 0008
        BLT     L_5762                          ; 575E   0205 0002

        SUBI    #$0008, R1                      ; 5760   0339 0008
L_5762:
        TSTR    R1                              ; 5762   0089
        BPL     L_5767                          ; 5763   0203 0002
        B       L_5775                          ; 5765   0200 000E

L_5767:
        SLR     R1,     2                       ; 5767   0065
        SLR     R1,     1                       ; 5768   0061
        SLL     R1,     2                       ; 5769   004D
        ADDR    R1,     R4                      ; 576A   00CC
        SLL     R1,     2                       ; 576B   004D
        ADDR    R1,     R4                      ; 576C   00CC
        ADDI    #$0200, R4                      ; 576D   02FC 0200
        CMPI    #$02F0, R4                      ; 576F   037C 02F0
        BGE     L_5775                          ; 5771   020D 0002

        PULR    R3                              ; 5773   02B3
        MOVR    R5,     R7                      ; 5774   00AF

L_5775:
        CLRR    R4                              ; 5775   01E4
        DECR    R4                              ; 5776   0014
        PULR    R3                              ; 5777   02B3
        MOVR    R5,     R7                      ; 5778   00AF

        DECLE   $0001                           ; 5779   0001

        SUB@    R6,     R0                      ; 577A   0330
        CMP     G_0360, R0                      ; 577B   0340 0360
        CMP@    R6,     R0                      ; 577D   0370
        AND     G_03A0, R0                      ; 577E   0380 03A0
        XOR     G_03E0, R0                      ; 5780   03C0 03E0
L_5782:
        PSHR    R5                              ; 5782   0275
        MVII    #$0004, R1                      ; 5783   02B9 0004
        MVO     R1,     G_0116                  ; 5785   0241 0116
        DECR    R1                              ; 5787   0011
        MVO     R1,     G_010E                  ; 5788   0241 010E

        JSR     R5,     L_5580                  ; 578A   0004 0154 0180
        DECLE   $03DF                           ; 578D   03DF

        JSR     R5,     L_5571                  ; 578E   0004 0154 0171

        MVII    #$003C, R0                      ; 5791   02B8 003C
        MVII    #$0007, R3                      ; 5793   02BB 0007
        MVII    #$0200, R4                      ; 5795   02BC 0200

        JSR     R5,     .EXEC.853               ; 5797   0004 0118 0053

        MVII    #$0219, R4                      ; 579A   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 579C   0004 0118 007B
        STRING  "SAFECRACKER"                   ; 579F  
        DECLE   $0000                           ; 57AA   0000

        MVII    #$022C, R4                      ; 57AB   02BC 022C
        SDBD                                    ; 57AD   0001
        MVII    #$0907, R1                      ; 57AE   02B9 0007 0009
        MVO@    R1,     R4                      ; 57B1   0261

        JSR     R5,     X_PRINT_R5              ; 57B2   0004 0118 007B
        STRING  "1983  IMAGIC"                  ; 57B5  
        DECLE   $0000                           ; 57C1   0000
L_57C2:
        PULR    R7                              ; 57C2   02B7

        MVII    #$00FF, R0                      ; 57C3   02B8 00FF
        MVO     R0,     G_011D                  ; 57C5   0240 011D
        MVI     G_018E, R0                      ; 57C7   0280 018E
        INCR    R0                              ; 57C9   0008
        MVO     R0,     G_018E                  ; 57CA   0240 018E
        MOVR    R5,     R7                      ; 57CC   00AF

L_57CD:
        PSHR    R5                              ; 57CD   0275
        CMPI    #$0002, R2                      ; 57CE   037A 0002
        BLT     L_585D                          ; 57D0   0205 008B
        B       L_57D4                          ; 57D2   0200 0000

L_57D4:
        MVI     G_017C, R0                      ; 57D4   0280 017C
        CMPI    #$0002, R2                      ; 57D6   037A 0002
        BEQ     L_57DC                          ; 57D8   0204 0002

        INCR    R0                              ; 57DA   0008
        INCR    R7                              ; 57DB   000F

L_57DC:
        DECR    R0                              ; 57DC   0010
L_57DD:
        MVO     R0,     G_017C                  ; 57DD   0240 017C
        MVII    #$0200, R4                      ; 57DF   02BC 0200
        RRC     R2,     1                       ; 57E1   0072
        BNC     L_57E8                          ; 57E2   0209 0004

        ADDI    #$00DC, R4                      ; 57E4   02FC 00DC
        ADDI    #$000B, R0                      ; 57E6   02F8 000B
L_57E8:
        INCR    R7                              ; 57E8   000F

L_57E9:
        PSHR    R5                              ; 57E9   0275
L_57EA:
        MVO     R0,     G_017E                  ; 57EA   0240 017E
        MVI     G_017B, R2                      ; 57EC   0282 017B
        MOVR    R2,     R1                      ; 57EE   0091

        JSR     R5,     L_581C                  ; 57EF   0004 0158 001C

        MVII    #$0014, R0                      ; 57F2   02B8 0014
        MVO     R1,     G_017D                  ; 57F4   0241 017D
        ANDI    #$001F, R1                      ; 57F6   03B9 001F
        PSHR    R1                              ; 57F8   0271
L_57F9:
        MVI@    R2,     R1                      ; 57F9   0291

        JSR     R5,     L_588B                  ; 57FA   0004 0158 008B

        PULR    R5                              ; 57FD   02B5
L_57FE:
        MVO@    R1,     R4                      ; 57FE   0261
        DECR    R0                              ; 57FF   0010
        BEQ     L_581B                          ; 5800   0204 0019

        INCR    R5                              ; 5802   000D
        DECR    R3                              ; 5803   0013
        BNEQ    L_57FE                          ; 5804   022C 0007

        CMPI    #$001F, R5                      ; 5806   037D 001F
        BGT     L_5812                          ; 5808   020E 0008

        PSHR    R5                              ; 580A   0275
        INCR    R2                              ; 580B   000A
        MVI@    R2,     R3                      ; 580C   0293
        ANDI    #$0003, R3                      ; 580D   03BB 0003
        INCR    R3                              ; 580F   000B
        B       L_57F9                          ; 5810   0220 0018

L_5812:
        PSHR    R0                              ; 5812   0270

        JSR     R5,     L_584D                  ; 5813   0004 0158 004D

        PULR    R0                              ; 5816   02B0
        CLRR    R1                              ; 5817   01C9
        PSHR    R1                              ; 5818   0271
        B       L_57F9                          ; 5819   0220 0021
L_581B:
        PULR    R7                              ; 581B   02B7

L_581C:
        PSHR    R5                              ; 581C   0275
L_581D:
        PSHR    R2                              ; 581D   0272
        MVO     R2,     G_017D                  ; 581E   0242 017D
        PSHR    R0                              ; 5820   0270
        ANDI    #$00E0, R0                      ; 5821   03B8 00E0
        SLR     R0,     2                       ; 5823   0064
        SDBD                                    ; 5824   0001
        ADDI    #$59B4, R0                      ; 5825   02F8 00B4 0059
        ANDI    #$00E0, R2                      ; 5828   03BA 00E0
        SLR     R2,     2                       ; 582A   0066
        SLR     R2,     2                       ; 582B   0066
        SLR     R2,     1                       ; 582C   0062
        ADDR    R0,     R2                      ; 582D   00C2
        MVI@    R2,     R5                      ; 582E   0295
        MVO     R5,     G_0195                  ; 582F   0245 0195
        SDBD                                    ; 5831   0001
        ADDI    #$59B0, R5                      ; 5832   02FD 00B0 0059
        SDBD                                    ; 5835   0001
        MVI@    R5,     R2                      ; 5836   02AA
        PULR    R0                              ; 5837   02B0
        ANDI    #$001F, R0                      ; 5838   03B8 001F
        BEQ     L_5840                          ; 583A   0204 0004

L_583C:
        ADD@    R2,     R2                      ; 583C   02D2
        DECR    R0                              ; 583D   0010
        BNEQ    L_583C                          ; 583E   022C 0003

L_5840:
        PULR    R3                              ; 5840   02B3
        ANDI    #$001F, R3                      ; 5841   03BB 001F
L_5843:
        INCR    R2                              ; 5843   000A
        MVI@    R2,     R0                      ; 5844   0290
        ANDI    #$0003, R0                      ; 5845   03B8 0003
        INCR    R0                              ; 5847   0008
        SUBR    R0,     R3                      ; 5848   0103
        BGE     L_5843                          ; 5849   022D 0007

        NEGR    R3                              ; 584B   0023
        PULR    R7                              ; 584C   02B7

L_584D:
        PSHR    R5                              ; 584D   0275
        MVI     G_017B, R2                      ; 584E   0282 017B
        MVII    #$0020, R0                      ; 5850   02B8 0020
        ADDR    R0,     R2                      ; 5852   00C2
        ADD     G_017D, R0                      ; 5853   02C0 017D
        MVO     R0,     G_017D                  ; 5855   0240 017D
        ANDI    #$00E0, R2                      ; 5857   03BA 00E0
        MVI     G_017E, R0                      ; 5859   0280 017E
        B       L_581D                          ; 585B   0220 003F

L_585D:
        MVI     G_017B, R0                      ; 585D   0280 017B
        CLRR    R4                              ; 585F   01E4
        TSTR    R2                              ; 5860   0092
        BEQ     L_5867                          ; 5861   0204 0004

        MVII    #$0013, R4                      ; 5863   02BC 0013
        INCR    R0                              ; 5865   0008
        INCR    R7                              ; 5866   000F

L_5867:
        DECR    R0                              ; 5867   0010
L_5868:
        MVO     R0,     G_017B                  ; 5868   0240 017B
        ADDR    R4,     R0                      ; 586A   00E0
        MVO     R0,     G_017D                  ; 586B   0240 017D
        ADDI    #$0200, R4                      ; 586D   02FC 0200
        MVI     G_017C, R0                      ; 586F   0280 017C
        DECR    R0                              ; 5871   0010
        MVII    #$000C, R1                      ; 5872   02B9 000C
L_5874:
        MVI     G_017D, R2                      ; 5874   0282 017D
        INCR    R0                              ; 5876   0008
        MVO     R0,     G_017E                  ; 5877   0240 017E
        PSHR    R1                              ; 5879   0271

        JSR     R5,     L_581C                  ; 587A   0004 0158 001C

        MVI@    R2,     R1                      ; 587D   0291

        JSR     R5,     L_588B                  ; 587E   0004 0158 008B

        MVO@    R1,     R4                      ; 5881   0261
        MVI     G_017E, R0                      ; 5882   0280 017E
        ADDI    #$0013, R4                      ; 5884   02FC 0013
        PULR    R1                              ; 5886   02B1
        DECR    R1                              ; 5887   0011
        BNEQ    L_5874                          ; 5888   022C 0015
        PULR    R7                              ; 588A   02B7

L_588B:
        PSHR    R5                              ; 588B   0275
        PSHR    R4                              ; 588C   0274
        PSHR    R2                              ; 588D   0272
        PSHR    R0                              ; 588E   0270
        SDBD                                    ; 588F   0001
        MVII    #$60B0, R2                      ; 5890   02BA 00B0 0060
        SDBD                                    ; 5893   0001
        MVII    #$61AC, R4                      ; 5894   02BC 00AC 0061
        SLR     R1,     2                       ; 5897   0065
        ADDR    R1,     R2                      ; 5898   00CA
L_5899:
        INCR    R4                              ; 5899   000C
        MVI@    R4,     R0                      ; 589A   02A0
        CMPR    R0,     R1                      ; 589B   0141
        BGE     L_5899                          ; 589C   022D 0004

        MVI@    R4,     R1                      ; 589E   02A1
        SLL     R1,     2                       ; 589F   004D
        SLL     R1,     2                       ; 58A0   004D
        PSHR    R1                              ; 58A1   0271
        MVI@    R2,     R0                      ; 58A2   0290
        MOVR    R0,     R2                      ; 58A3   0082
        ANDI    #$0200, R0                      ; 58A4   03B8 0200
        BEQ     L_58AA                          ; 58A6   0204 0002

        SLL     R0,     2                       ; 58A8   004C
        XORR    R0,     R1                      ; 58A9   01C1
L_58AA:
        ANDI    #$01FF, R2                      ; 58AA   03BA 01FF
        XORR    R2,     R1                      ; 58AC   01D1
        PULR    R2                              ; 58AD   02B2

        JSR     R5,     L_58B5                  ; 58AE   0004 0158 00B5

        PULR    R0                              ; 58B1   02B0
        PULR    R2                              ; 58B2   02B2
        PULR    R4                              ; 58B3   02B4
        PULR    R7                              ; 58B4   02B7

L_58B5:
        PSHR    R5                              ; 58B5   0275
        PSHR    R1                              ; 58B6   0271
        ANDI    #$01F8, R1                      ; 58B7   03B9 01F8
        CMPI    #$0060, R1                      ; 58B9   0379 0060
        PULR    R1                              ; 58BB   02B1
        BNEQ    L_58D3                          ; 58BC   020C 0015

        MVI     G_017D, R4                      ; 58BE   0284 017D
        ANDI    #$00E0, R4                      ; 58C0   03BC 00E0
        CMPI    #$0040, R4                      ; 58C2   037C 0040
        BNEQ    L_58CE                          ; 58C4   020C 0008

        MVI     G_017E, R4                      ; 58C6   0284 017E
        ANDI    #$00E0, R4                      ; 58C8   03BC 00E0
        CMPI    #$0060, R4                      ; 58CA   037C 0060
        BEQ     L_58D2                          ; 58CC   0204 0004

L_58CE:
        SDBD                                    ; 58CE   0001
        ANDI    #$FFF9, R1                      ; 58CF   03B9 00F9 00FF
L_58D2:
        PULR    R7                              ; 58D2   02B7

L_58D3:
        SDBD                                    ; 58D3   0001
        CMPI    #$3000, R2                      ; 58D4   037A 0000 0030
        BNEQ    L_590E                          ; 58D7   020C 0035

        CLRR    R5                              ; 58D9   01ED
        MVI     G_017D, R4                      ; 58DA   0284 017D
        ANDI    #$00E0, R4                      ; 58DC   03BC 00E0
        CMPI    #$0060, R4                      ; 58DE   037C 0060
        BNEQ    L_58EA                          ; 58E0   020C 0008

        MVI     G_017E, R4                      ; 58E2   0284 017E
        ANDI    #$00E0, R4                      ; 58E4   03BC 00E0
        CMPI    #$0060, R4                      ; 58E6   037C 0060
        BEQ     L_58EC                          ; 58E8   0204 0002

L_58EA:
        MVII    #$0007, R5                      ; 58EA   02BD 0007
L_58EC:
        MOVR    R1,     R0                      ; 58EC   0088
        DECLE   $03B8,  $0007,  $0001,  $03B9   ; 58ED   03B8 0007 0001 03B9
        DECLE   $00F8,  $0009,  $0001,  $0379   ; 58F1   00F8 0009 0001 0379
        DECLE   $0078,  $0008,  $0204,  $000F   ; 58F5   0078 0008 0204 000F
        DECLE   $0001                           ; 58F9   0001

        CMPI    #$0080, R1                      ; 58FA   0379 0080
        INCR    R0                              ; 58FC   0008
        BEQ     L_5908                          ; 58FD   0204 0009

        XORR    R0,     R1                      ; 58FF   01C1
        TSTR    R5                              ; 5900   00AD
        BEQ     L_5942                          ; 5901   0204 003F

        SDBD                                    ; 5903   0001
        XORI    #$2600, R1                      ; 5904   03F9 0000 0026
        PULR    R7                              ; 5907   02B7

L_5908:
        SDBD                                    ; 5908   0001
        XORI    #$0600, R5                      ; 5909   03FD 0000 0006
        XORR    R5,     R1                      ; 590C   01E9
        PULR    R7                              ; 590D   02B7

L_590E:
        SDBD                                    ; 590E   0001
        MVII    #$09F8, R5                      ; 590F   02BD 00F8 0009
        MOVR    R1,     R0                      ; 5912   0088
        ANDR    R5,     R0                      ; 5913   01A8
        COMR    R5                              ; 5914   001D
        CMPI    #$0028, R0                      ; 5915   0378 0028
        BGT     L_5942                          ; 5917   020E 0029

        MVI     G_0198, R0                      ; 5919   0280 0198
        TSTR    R0                              ; 591B   0080
        BEQ     L_5920                          ; 591C   0204 0002

        ANDR    R5,     R1                      ; 591E   01A9
        PULR    R7                              ; 591F   02B7

L_5920:
        MOVR    R1,     R2                      ; 5920   008A
        ANDI    #$0038, R2                      ; 5921   03BA 0038
        BEQ     L_5942                          ; 5923   0204 001D

        ANDR    R5,     R1                      ; 5925   01A9
        CMP     G_0197, R2                      ; 5926   0342 0197
        BNEQ    L_5942                          ; 5928   020C 0018

        MVI     G_017D, R4                      ; 592A   0284 017D
        ANDI    #$00E0, R4                      ; 592C   03BC 00E0
        MVI     G_01B1, R5                      ; 592E   0285 01B1
        ANDI    #$00E0, R5                      ; 5930   03BD 00E0
        CMPR    R5,     R4                      ; 5932   016C
        BNEQ    L_5942                          ; 5933   020C 000D

        MVI     G_017E, R4                      ; 5935   0284 017E
        ANDI    #$00E0, R4                      ; 5937   03BC 00E0
        MVI     G_01B2, R5                      ; 5939   0285 01B2
        ANDI    #$00E0, R5                      ; 593B   03BD 00E0
        CMPR    R5,     R4                      ; 593D   016C
        BNEQ    L_5942                          ; 593E   020C 0002

        XORI    #$0050, R1                      ; 5940   03F9 0050
L_5942:
        PULR    R7                              ; 5942   02B7

L_5943:
        PSHR    R5                              ; 5943   0275
L_5944:
        SDBD                                    ; 5944   0001
        MVII    #$57C3, R0                      ; 5945   02B8 00C3 0057

        JSR     R5,     L_5548                  ; 5948   0004 0154 0148

        MVI     G_017C, R0                      ; 594B   0280 017C
        MVII    #$0200, R4                      ; 594D   02BC 0200
L_594F:
        PSHR    R0                              ; 594F   0270
        PSHR    R4                              ; 5950   0274

        JSR     R5,     L_57E9                  ; 5951   0004 0154 03E9

        PULR    R4                              ; 5954   02B4
        PULR    R0                              ; 5955   02B0
        INCR    R0                              ; 5956   0008
        ADDI    #$0014, R4                      ; 5957   02FC 0014
        CMPI    #$02F0, R4                      ; 5959   037C 02F0
        BLT     L_594F                          ; 595B   0225 000D

        SDBD                                    ; 595D   0001
        MVII    #$514B, R0                      ; 595E   02B8 004B 0051
        PULR    R5                              ; 5961   02B5
        J       L_5548                          ; 5962   0004 0354 0148

        PSHR    R5                              ; 5965   0275
L_5966:
        MVI     G_01BB, R0                      ; 5966   0280 01BB
        TSTR    R0                              ; 5968   0080
        BNEQ    L_5974                          ; 5969   020C 0009

        MVI     G_0198, R0                      ; 596B   0280 0198
        TSTR    R0                              ; 596D   0080
        BNEQ    L_5974                          ; 596E   020C 0004

        MVII    #$000F, R1                      ; 5970   02B9 000F
        B       L_598B                          ; 5972   0200 0017

L_5974:
        JSR     R5,     L_6FE0                  ; 5974   0004 016C 03E0

        MVI     G_01B1, R2                      ; 5977   0282 01B1
        MVI     G_01B2, R3                      ; 5979   0283 01B2
        CLRR    R4                              ; 597B   01E4
        CMPR    R1,     R3                      ; 597C   014B
        BLT     L_5981                          ; 597D   0205 0002

        XORI    #$0001, R4                      ; 597F   03FC 0001
L_5981:
        CMPR    R0,     R2                      ; 5981   0142
        BLT     L_5986                          ; 5982   0205 0002

        XORI    #$0002, R4                      ; 5984   03FC 0002
L_5986:
        SDBD                                    ; 5986   0001
        ADDI    #$5994, R4                      ; 5987   02FC 0094 0059
        MVI@    R4,     R1                      ; 598A   02A1
L_598B:
        MVI     G_01BE, R2                      ; 598B   0282 01BE
        CMPR    R1,     R2                      ; 598D   014A
        BEQ     L_5993                          ; 598E   0204 0003

        JSR     R5,     L_67F1                  ; 5990   0004 0164 03F1

L_5993:
        PULR    R7                              ; 5993   02B7

        DECLE   $0002,  $0001                   ; 5994   0002 0001

        CLRC                                    ; 5996   0006
        INCR    R6                              ; 5997   000E
L_5998:
        MVI     G_01B1, R2                      ; 5998   0282 01B1
        MVI     G_01B2, R3                      ; 599A   0283 01B2
        B       L_59A2                          ; 599C   0200 0004

L_599E:
        MVII    #$0065, R2                      ; 599E   02BA 0065
        MVII    #$007E, R3                      ; 59A0   02BB 007E
L_59A2:
        PSHR    R5                              ; 59A2   0275

        JSR     R5,     L_6FE0                  ; 59A3   0004 016C 03E0
        JSR     R5,     .EXEC.78C               ; 59A6   0004 0114 038C

        CLRR    R0                              ; 59A9   01C0
        CMPI    #$0010, R2                      ; 59AA   037A 0010
        BC      L_59AF                          ; 59AC   0201 0001

        INCR    R0                              ; 59AE   0008
L_59AF:
        PULR    R7                              ; 59AF   02B7

        DECLE   $00A5,  $005A,  $00A5,  $005D   ; 59B0   00A5 005A 00A5 005D
        DECLE   $0002,  $0002,  $0000,  $0002   ; 59B4   0002 0002 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0002   ; 59B8   0000 0002 0000 0002
        DECLE   $0002,  $0002,  $0002,  $0000   ; 59BC   0002 0002 0002 0000
        DECLE   $0002,  $0000,  $0002,  $0000   ; 59C0   0002 0000 0002 0000
        DECLE   $0000,  $0002,  $0000,  $0002   ; 59C4   0000 0002 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0002   ; 59C8   0000 0002 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0002   ; 59CC   0000 0000 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0000   ; 59D0   0000 0002 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 59D4   0000 0002 0000 0000
        DECLE   $0002,  $0000,  $0002,  $0002   ; 59D8   0002 0000 0002 0002
        DECLE   $0000,  $0002,  $0002,  $0002   ; 59DC   0000 0002 0002 0002
        DECLE   $0002,  $0000,  $0002,  $0000   ; 59E0   0002 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E4   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0002,  $0000   ; 59E8   0002 0000 0002 0000
        DECLE   $0000,  $0000,  $0002,  $0002   ; 59EC   0000 0000 0002 0002
        DECLE   $0000,  $0000,  $0000           ; 59F0   0000 0000 0000

        EIS                                     ; 59F3   0002
        INCR    R0                              ; 59F4   0008
        MOVR    R5,     R7                      ; 59F5   00AF

        DECLE   $0300,  $0003,  $000F,  $003F   ; 59F6   0300 0003 000F 003F
        DECLE   $00FF,  $0003,  $000F,  $003F   ; 59FA   00FF 0003 000F 003F
        DECLE   $03FF,  $00FF,  $00C0,  $00F0   ; 59FE   03FF 00FF 00C0 00F0
        DECLE   $00FC,  $03FF,  $00FF,  $0300   ; 5A02   00FC 03FF 00FF 0300
        DECLE   $00C0,  $00F0,  $00FC,  $00FF   ; 5A06   00C0 00F0 00FC 00FF
        DECLE   $03FF,  $00FC,  $00F0,  $00C0   ; 5A0A   03FF 00FC 00F0 00C0
        DECLE   $0000,  $00FC,  $00F0,  $00C0   ; 5A0E   0000 00FC 00F0 00C0
        DECLE   $0300,  $0000,  $003F           ; 5A12   0300 0000 003F

        INCR    R7                              ; 5A15   000F

        DIS                                     ; 5A16   0003
L_5A17:
        SUB     .STIC.X.0,R0                    ; 5A17   0300 0000
        DECLE   $03FF,  $003F,  $000F,  $0003   ; 5A19   03FF 003F 000F 0003
        DECLE   $0000,  $03FF,  $03FF,  $0381   ; 5A1D   0000 03FF 03FF 0381
        DECLE   $0381,  $0380,  $0380,  $0008   ; 5A21   0381 0380 0380 0008
        DECLE   $003E,  $0028,  $003E,  $000A   ; 5A25   003E 0028 003E 000A
        DECLE   $003E,  $0008,  $0000           ; 5A29   003E 0008 0000

        ADDR    R6,     R3                      ; 5A2C   00F3
        ADDR    R0,     R3                      ; 5A2D   00C3
        INCR    R7                              ; 5A2E   000F

        DECLE   $003F                           ; 5A2F   003F
L_5A30:
        ADDR    R6,     R3                      ; 5A30   00F3
        ADDR    R0,     R3                      ; 5A31   00C3
        INCR    R7                              ; 5A32   000F

        DECLE   $003F                           ; 5A33   003F
L_5A34:
        ADDR    R1,     R7                      ; 5A34   00CF

        ADDR    R0,     R3                      ; 5A35   00C3
        ADDR    R6,     R0                      ; 5A36   00F0
        ADDR    R7,     R4                      ; 5A37   00FC
        ADDR    R1,     R7                      ; 5A38   00CF

        ADDR    R0,     R3                      ; 5A39   00C3
        ADDR    R6,     R0                      ; 5A3A   00F0
        ADDR    R7,     R4                      ; 5A3B   00FC
        ADDR    R7,     R1                      ; 5A3C   00F9
        ADDR    R4,     R1                      ; 5A3D   00E1
        MOVR    R0,     R1                      ; 5A3E   0081
        MOVR    R0,     R7                      ; 5A3F   0087
        MOVR    R3,     R7                      ; 5A40   009F

        DECLE   $02FF                           ; 5A41   02FF

        MOVR    R3,     R7                      ; 5A42   009F
        MOVR    R0,     R7                      ; 5A43   0087

        MOVR    R0,     R1                      ; 5A44   0081
        ADDR    R4,     R1                      ; 5A45   00E1
        ADDR    R7,     R1                      ; 5A46   00F9
        ADDI    #$02FF, R7                      ; 5A47   02FF 02FF
        MOVR    R3,     R7                      ; 5A49   009F
        MOVR    R0,     R7                      ; 5A4A   0087

        MOVR    R0,     R1                      ; 5A4B   0081
        ADDR    R4,     R1                      ; 5A4C   00E1
        ADDR    R7,     R1                      ; 5A4D   00F9
        ADDI    #$00F9, R7                      ; 5A4E   02FF 00F9

        ADDR    R4,     R1                      ; 5A50   00E1
        MOVR    R0,     R1                      ; 5A51   0081
        MOVR    R0,     R7                      ; 5A52   0087
        MOVR    R3,     R7                      ; 5A53   009F

        AND     G_0083, R0                      ; 5A54   0380 0083
        MOVR    R1,     R7                      ; 5A56   008F

        DECLE   $00BF,  $00FF,  $0300,  $0200   ; 5A57   00BF 00FF 0300 0200
        DECLE   $00FF,  $00FF                   ; 5A5B   00FF 00FF

        SUB     .BTAB.00,R0                     ; 5A5D   0300 0200
        INCR    R0                              ; 5A5F   0008
        SUBR    R3,     R4                      ; 5A60   011C
        SKIP                                    ; 5A61   0208
        COMR    R0                              ; 5A62   0018
        INCR    R4                              ; 5A63   000C
        GSWD    R0                              ; 5A64   0030
L_5A65:
        ADCR    R4                              ; 5A65   002C
        DECLE   $002B,  $0029,  $00E9,  $00F9   ; 5A66   002B 0029 00E9 00F9
        DECLE   $00FD,  $00FF,  $001E,  $003D   ; 5A6A   00FD 00FF 001E 003D
        DECLE   $007B,  $00F6,  $000C,  $00E8   ; 5A6E   007B 00F6 000C 00E8
        DECLE   $0100,  $0301,  $0301,  $0000   ; 5A72   0100 0301 0301 0000
        DECLE   $0001,  $000F,  $001F,  $023F   ; 5A76   0001 000F 001F 023F

        SARC    R3,     2                       ; 5A7A   007F
        COMR    R2                              ; 5A7B   001A
        ADCR    R6                              ; 5A7C   002E
        SARC    R3,     2                       ; 5A7D   007F
        RSWD    R6                              ; 5A7E   003E
        COMR    R2                              ; 5A7F   001A
        INCR    R4                              ; 5A80   000C
        SUBR    R1,     R0                      ; 5A81   0108
        SLLC    R3,     2                       ; 5A82   005F
        MOVR    R5,     R3                      ; 5A83   00AB
L_5A84:
        DECR    R7                              ; 5A84   0017

        DECLE   $0002,  $00C5,  $00C2,  $00F1   ; 5A85   0002 00C5 00C2 00F1
        DECLE   $00FA,  $0100,  $0180,  $00C8   ; 5A89   00FA 0100 0180 00C8
        DECLE   $00FC,  $00FE,  $00FC,  $00FF   ; 5A8D   00FC 00FE 00FC 00FF
        DECLE   $017F,  $001F                   ; 5A91   017F 001F

        INCR    R7                              ; 5A93   000F

        INCR    R5                              ; 5A94   000D
L_5A95:
        COMR    R0                              ; 5A95   0018
        DECLE   $0000,  $00FE,  $01FC,  $00FE   ; 5A96   0000 00FE 01FC 00FE
        DECLE   $00FC,  $00F8,  $0070,  $0000   ; 5A9A   00FC 00F8 0070 0000
        DECLE   $003C,  $0042,  $009D,  $01A1   ; 5A9E   003C 0042 009D 01A1
        DECLE   $009D,  $0042,  $003C,  $0019   ; 5AA2   009D 0042 003C 0019
        DECLE   $0373,  $0371,  $0374,  $0378   ; 5AA6   0373 0371 0374 0378
        DECLE   $009C,  $00A0,  $0320,  $0324   ; 5AAA   009C 00A0 0320 0324
        DECLE   $0328,  $032C,  $00A4,  $00A8   ; 5AAE   0328 032C 00A4 00A8
        DECLE   $0000,  $0004                   ; 5AB2   0000 0004

        INCR    R0                              ; 5AB4   0008
        INCR    R4                              ; 5AB5   000C
        MOVR    R5,     R4                      ; 5AB6   00AC
        MOVR    R6,     R0                      ; 5AB7   00B0
        MOVR    R6,     R4                      ; 5AB8   00B4
        MOVR    R7,     R0                      ; 5AB9   00B8
        CMPI    #$0380, R4                      ; 5ABA   037C 0380
        CMP@    R6,     R3                      ; 5ABC   0373
L_5ABD:
        CMP@    R6,     R1                      ; 5ABD   0371
        DECLE   $001A,  $0373,  $0374,  $0378   ; 5ABE   001A 0373 0374 0378
        DECLE   $02C8,  $02CC,  $0000,  $0010   ; 5AC2   02C8 02CC 0000 0010
        DECLE   $0008,  $000C,  $0330,  $0334   ; 5AC6   0008 000C 0330 0334
        DECLE   $0000,  $0010,  $0204,  $0208   ; 5ACA   0000 0010 0204 0208
        DECLE   $0015,  $00BC,  $00C0,  $0384   ; 5ACE   0015 00BC 00C0 0384
        DECLE   $0388,  $038C,  $0390,  $037C   ; 5AD2   0388 038C 0390 037C
        DECLE   $0380,  $0373,  $0018,  $0373   ; 5AD6   0380 0373 0018 0373
        DECLE   $038C,  $0390,  $02D0,  $02D4   ; 5ADA   038C 0390 02D0 02D4
        DECLE   $019C,  $01A0,  $0018,  $001C   ; 5ADE   019C 01A0 0018 001C
        DECLE   $0000                           ; 5AE2   0000

        DECR    R0                              ; 5AE3   0010
        DECR    R5                              ; 5AE4   0015
        BEQ     L_5CEF                          ; 5AE5   0204 0208

        DECR    R5                              ; 5AE7   0015
        ANDR    R4,     R4                      ; 5AE8   01A4
        ANDR    R5,     R0                      ; 5AE9   01A8
        CMP@    R6,     R1                      ; 5AEA   0371
        CMP@    R6,     R4                      ; 5AEB   0374
        CMPI    #$0394, R0                      ; 5AEC   0378 0394
        AND@    R3,     R0                      ; 5AEE   0398
        CMP@    R6,     R3                      ; 5AEF   0373
        DECR    R6                              ; 5AF0   0016
        CMP@    R6,     R3                      ; 5AF1   0373
        AND@    R3,     R4                      ; 5AF2   039C
        AND@    R4,     R0                      ; 5AF3   03A0
        ANDR    R5,     R5                      ; 5AF4   01AD
        ANDR    R6,     R0                      ; 5AF5   01B0
        ANDR    R6,     R4                      ; 5AF6   01B4
        ANDR    R7,     R0                      ; 5AF7   01B8
        ADD@    R3,     R0                      ; 5AF8   02D8
        ANDR    R3,     R4                      ; 5AF9   019C
        ANDR    R4,     R0                      ; 5AFA   01A0
L_5AFB:
        DECR    R7                              ; 5AFB   0017

        COMR    R0                              ; 5AFC   0018
        COMR    R4                              ; 5AFD   001C
        ANDR    R7,     R4                      ; 5AFE   01BC
        MVO@    R0,     R5                      ; 5AFF   0268
        CMP@    R6,     R4                      ; 5B00   0374
        CMPI    #$0394, R0                      ; 5B01   0378 0394
        AND@    R3,     R0                      ; 5B03   0398
        CMP@    R6,     R3                      ; 5B04   0373
        CMP@    R6,     R1                      ; 5B05   0371
        COMR    R2                              ; 5B06   001A
        CMPI    #$0380, R4                      ; 5B07   037C 0380
        AND@    R3,     R4                      ; 5B09   039C
        AND@    R4,     R0                      ; 5B0A   03A0
        ANDR    R5,     R6                      ; 5B0B   01AE
        XOR@    R6,     R0                      ; 5B0C   03F0
        ANDR    R5,     R4                      ; 5B0D   01AC
        NEGR    R0                              ; 5B0E   0020
        XORR    R0,     R1                      ; 5B0F   01C1
        XORR    R0,     R4                      ; 5B10   01C4
        MVO@    R4,     R5                      ; 5B11   026C
        ANDR    R3,     R4                      ; 5B12   019C
        ANDR    R4,     R0                      ; 5B13   01A0
        COMR    R0                              ; 5B14   0018
        COMR    R4                              ; 5B15   001C
        NEGR    R4                              ; 5B16   0024
        ADCR    R0                              ; 5B17   0028
        ADD@    R3,     R4                      ; 5B18   02DC
        ADD@    R3,     R0                      ; 5B19   02D8
        AND@    R2,     R4                      ; 5B1A   0394
        AND@    R3,     R0                      ; 5B1B   0398
        CMP@    R6,     R3                      ; 5B1C   0373
        CMP@    R6,     R1                      ; 5B1D   0371
L_5B1E:
        CMP@    R6,     R4                      ; 5B1E   0374
        CMPI    #$001B, R0                      ; 5B1F   0378 001B
        ADD@    R1,     R0                      ; 5B21   02C8
        CLRR    R0                              ; 5B22   01C0
        SUBR    R3,     R4                      ; 5B23   011C
        ANDR    R5,     R6                      ; 5B24   01AE
        XOR@    R6,     R0                      ; 5B25   03F0
        NEGR    R0                              ; 5B26   0020
        ADCR    R4                              ; 5B27   002C
        XORR    R1,     R0                      ; 5B28   01C8
        AND@    R1,     R4                      ; 5B29   038C
        AND@    R2,     R0                      ; 5B2A   0390
        XORR    R1,     R4                      ; 5B2B   01CC
        XORR    R2,     R0                      ; 5B2C   01D0
        XORR    R0,     R4                      ; 5B2D   01C4
        MVO@    R4,     R5                      ; 5B2E   026C
        XORR    R2,     R4                      ; 5B2F   01D4
        ADCR    R0                              ; 5B30   0028
        GSWD    R0                              ; 5B31   0030
        NOP                                     ; 5B32   0034
        AND@    R2,     R4                      ; 5B33   0394
        AND@    R3,     R0                      ; 5B34   0398
        CMP@    R6,     R3                      ; 5B35   0373
        CMP@    R6,     R1                      ; 5B36   0371
        AND@    R3,     R4                      ; 5B37   039C
        AND@    R4,     R0                      ; 5B38   03A0
        ADD@    R4,     R0                      ; 5B39   02E0
        ADD@    R2,     R4                      ; 5B3A   02D4
        COMR    R4                              ; 5B3B   001C
        MOVR    R5,     R0                      ; 5B3C   00A8
        TSTR    R4                              ; 5B3D   00A4
        SUBR    R4,     R0                      ; 5B3E   0120
        RSWD    R0                              ; 5B3F   0038
        RSWD    R4                              ; 5B40   003C
        NEGR    R0                              ; 5B41   0020
        ADCR    R4                              ; 5B42   002C
        XORR    R1,     R0                      ; 5B43   01C8
        PSHR    R0                              ; 5B44   0270
        XORR    R1,     R0                      ; 5B45   01C8
        CMP@    R6,     R1                      ; 5B46   0371
        AND@    R1,     R4                      ; 5B47   038C
        AND@    R2,     R0                      ; 5B48   0390
L_5B49:
        XORR    R1,     R4                      ; 5B49   01CC
        XORR    R3,     R0                      ; 5B4A   01D8
        ANDR    R7,     R0                      ; 5B4B   01B8
        NOP                                     ; 5B4C   0034
        AND@    R2,     R4                      ; 5B4D   0394
        AND@    R3,     R0                      ; 5B4E   0398
        CMP@    R6,     R3                      ; 5B4F   0373
        CMP@    R6,     R1                      ; 5B50   0371
        AND@    R3,     R4                      ; 5B51   039C
        AND@    R4,     R0                      ; 5B52   03A0
        BEQ     L_5D5D                          ; 5B53   0204 0208

        ANDR    R4,     R4                      ; 5B55   01A4
        ANDR    R5,     R0                      ; 5B56   01A8
L_5B57:
        DECR    R7                              ; 5B57   0017

        DECLE   $00A8,  $00B0,  $0275,  $0120   ; 5B58   00A8 00B0 0275 0120
        DECLE   $0124,  $0272,  $01C8,  $0373   ; 5B5C   0124 0272 01C8 0373
        DECLE   $038C,  $0390,  $0394,  $0398   ; 5B60   038C 0390 0394 0398
        DECLE   $0373,  $0371,  $0374,  $0378   ; 5B64   0373 0371 0374 0378
        DECLE   $019C,  $01A0,  $01A4,  $01A8   ; 5B68   019C 01A0 01A4 01A8
        DECLE   $0278,  $0268,  $0014,  $00A4   ; 5B6C   0278 0268 0014 00A4
        DECLE   $00A8,  $0276,  $0124,  $0272   ; 5B70   00A8 0276 0124 0272
        DECLE   $01C8,  $0373,  $0373,  $0373   ; 5B74   01C8 0373 0373 0373
        DECLE   $0374,  $0378,  $0394,  $0398   ; 5B78   0374 0378 0394 0398
        DECLE   $026C,  $027C,  $01DC,  $0268   ; 5B7C   026C 027C 01DC 0268
        DECLE   $0278                           ; 5B80   0278

        MVO@    R0,     R5                      ; 5B81   0268
L_5B82:
        DECR    R7                              ; 5B82   0017

        MOVR    R5,     R0                      ; 5B83   00A8
        MOVR    R5,     R0                      ; 5B84   00A8
        PSHR    R6                              ; 5B85   0276
        SUBR    R4,     R4                      ; 5B86   0124
        PSHR    R2                              ; 5B87   0272
        XORR    R1,     R0                      ; 5B88   01C8
        CMPI    #$0380, R4                      ; 5B89   037C 0380
        CMP@    R6,     R3                      ; 5B8B   0373
        CMP@    R6,     R3                      ; 5B8C   0373
        CMP@    R6,     R4                      ; 5B8D   0374
        CMPI    #$0394, R0                      ; 5B8E   0378 0394
        AND@    R3,     R0                      ; 5B90   0398
        AND@    R3,     R4                      ; 5B91   039C
        AND@    R4,     R0                      ; 5B92   03A0
        SWAP    R0,     1                       ; 5B93   0040
        SWAP    R0,     2                       ; 5B94   0044
        XORR    R3,     R4                      ; 5B95   01DC
        ADCR    R0                              ; 5B96   0028
        ADD@    R3,     R4                      ; 5B97   02DC
        ADDR    R0,     R4                      ; 5B98   00C4
        COMR    R3                              ; 5B99   001B
        MOVR    R5,     R0                      ; 5B9A   00A8
        TSTR    R4                              ; 5B9B   00A4
        SUBR    R4,     R0                      ; 5B9C   0120
        SUBR    R5,     R0                      ; 5B9D   0128
        PSHR    R4                              ; 5B9E   0274
        SUBR    R4,     R4                      ; 5B9F   0124
        PSHR    R0                              ; 5BA0   0270
        SUBR    R5,     R4                      ; 5BA1   012C
        SUBR    R6,     R0                      ; 5BA2   0130
        SUBR    R6,     R4                      ; 5BA3   0134
        AND@    R2,     R4                      ; 5BA4   0394
        AND@    R3,     R0                      ; 5BA5   0398
        CMP@    R6,     R3                      ; 5BA6   0373
        CMP@    R6,     R3                      ; 5BA7   0373
        AND@    R1,     R4                      ; 5BA8   038C
        AND@    R2,     R0                      ; 5BA9   0390
        CMPI    #$0380, R4                      ; 5BAA   037C 0380
        ANDR    R3,     R4                      ; 5BAC   019C
        ANDR    R4,     R0                      ; 5BAD   01A0
        ANDR    R4,     R4                      ; 5BAE   01A4
        ANDR    R5,     R0                      ; 5BAF   01A8
        ADD@    R3,     R4                      ; 5BB0   02DC
        ADD@    R4,     R4                      ; 5BB1   02E4
        MOVR    R3,     R4                      ; 5BB2   009C
        MOVR    R6,     R0                      ; 5BB3   00B0
        COMR    R0                              ; 5BB4   0018
        TSTR    R4                              ; 5BB5   00A4
        MOVR    R6,     R0                      ; 5BB6   00B0
        SUBR    R7,     R0                      ; 5BB7   0138
        SLL     R0,     1                       ; 5BB8   0048
        SUBR    R4,     R0                      ; 5BB9   0120
        SUBR    R4,     R4                      ; 5BBA   0124
        SUBR    R6,     R0                      ; 5BBB   0130
        NOP                                     ; 5BBC   0034
        AND@    R2,     R4                      ; 5BBD   0394
        AND@    R3,     R0                      ; 5BBE   0398
        CMP@    R6,     R3                      ; 5BBF   0373
        CMP@    R6,     R3                      ; 5BC0   0373
        CMP@    R6,     R3                      ; 5BC1   0373
        AND@    R1,     R4                      ; 5BC2   038C
        AND@    R2,     R0                      ; 5BC3   0390
        XORR    R1,     R4                      ; 5BC4   01CC
        XORR    R3,     R0                      ; 5BC5   01D8
        ANDR    R7,     R0                      ; 5BC6   01B8
        ADD@    R3,     R0                      ; 5BC7   02D8
        MOVR    R3,     R4                      ; 5BC8   009C
        MOVR    R4,     R0                      ; 5BC9   00A0
        TSTR    R4                              ; 5BCA   00A4
        MOVR    R5,     R0                      ; 5BCB   00A8
L_5BCC:
        DECR    R7                              ; 5BCC   0017

        DECLE   $00A8,  $00A4,  $00A8,  $00B8   ; 5BCD   00A8 00A4 00A8 00B8
        DECLE   $02E8,  $02EC,  $0394,  $0398   ; 5BD1   02E8 02EC 0394 0398
        DECLE   $0373,  $0370,  $0370,  $039C   ; 5BD5   0373 0370 0370 039C
        DECLE   $03A0,  $03A4,  $03A8,  $0373   ; 5BD9   03A0 03A4 03A8 0373
        DECLE   $0370,  $0370,  $038C,  $0390   ; 5BDD   0370 0370 038C 0390
        DECLE   $01C1,  $00AB,  $0018,  $00A4   ; 5BE1   01C1 00AB 0018 00A4
        DECLE   $00B0,  $00C8,  $00CC,  $0394   ; 5BE5   00B0 00C8 00CC 0394
        DECLE   $0398,  $0373,  $0371,  $039C   ; 5BE9   0398 0373 0371 039C
        DECLE   $03A0,  $0014,  $004C,  $0050   ; 5BED   03A0 0014 004C 0050
        DECLE   $020C,  $03A4,  $03A8,  $0373   ; 5BF1   020C 03A4 03A8 0373
        DECLE   $0371,  $038C,  $0390,  $00D0   ; 5BF5   0371 038C 0390 00D0
        DECLE   $00D4,  $00A9,  $0019,  $00C8   ; 5BF9   00D4 00A9 0019 00C8
        DECLE   $00CC,  $0394,  $0398,  $0373   ; 5BFD   00CC 0394 0398 0373
        DECLE   $0371,  $0374,  $0378,  $0050   ; 5C01   0371 0374 0378 0050
        DECLE   $0054,  $0014,  $0210,  $0214   ; 5C05   0054 0014 0210 0214
        DECLE   $0058,  $005C,  $0218           ; 5C09   0058 005C 0218

        CMPI    #$0380, R4                      ; 5C0C   037C 0380
        CMP@    R6,     R3                      ; 5C0E   0373
        CMP@    R6,     R1                      ; 5C0F   0371
        AND@    R1,     R4                      ; 5C10   038C
        AND@    R2,     R0                      ; 5C11   0390
        ADDR    R2,     R0                      ; 5C12   00D0
        ADDR    R2,     R4                      ; 5C13   00D4
L_5C14:
        DECR    R7                              ; 5C14   0017

        DECLE   $0394,  $0398,  $0373,  $0371   ; 5C15   0394 0398 0373 0371
        DECLE   $0374,  $0378,  $013C,  $0140   ; 5C19   0374 0378 013C 0140
        DECLE   $021C,  $01E0,  $0050,  $0054   ; 5C1D   021C 01E0 0050 0054
        DECLE   $005C,  $0218                   ; 5C21   005C 0218

        XORR    R4,     R1                      ; 5C23   01E1
        XORR    R0,     R1                      ; 5C24   01C1
        CMPI    #$0380, R4                      ; 5C25   037C 0380
        CMP@    R6,     R3                      ; 5C27   0373
        CMP@    R6,     R1                      ; 5C28   0371
        AND@    R1,     R4                      ; 5C29   038C
        AND@    R2,     R0                      ; 5C2A   0390
L_5C2B:
        DECR    R7                              ; 5C2B   0017

        DECLE   $0373,  $0371,  $0374,  $0378   ; 5C2C   0373 0371 0374 0378
        DECLE   $02F0,  $02F4,  $0280,  $0284   ; 5C30   02F0 02F4 0280 0284
        DECLE   $01E4,  $01E1,  $021C,  $0220   ; 5C34   01E4 01E1 021C 0220
        DECLE   $01E1,  $01E8,  $0000           ; 5C38   01E1 01E8 0000

        DECR    R0                              ; 5C3B   0010
        SLR     R0,     1                       ; 5C3C   0060
        SLR     R0,     2                       ; 5C3D   0064
        CMPI    #$0380, R4                      ; 5C3E   037C 0380
        CMP@    R6,     R3                      ; 5C40   0373
        CMP@    R6,     R1                      ; 5C41   0371
L_5C42:
        DECR    R7                              ; 5C42   0017

        DECLE   $0373,  $0374,  $0378,  $02F0   ; 5C43   0373 0374 0378 02F0
        DECLE   $02F4,  $0144,  $0148,  $0288   ; 5C47   02F4 0144 0148 0288
        DECLE   $028C,  $01E6,  $021C           ; 5C4B   028C 01E6 021C

        B       L_5A65                          ; 5C4E   0220 01EA

        CMPR    R1,     R4                      ; 5C50   014C
        SUBR    R3,     R4                      ; 5C51   011C
        NEGR    R0                              ; 5C52   0020
        ADCR    R4                              ; 5C53   002C
        MOVR    R6,     R4                      ; 5C54   00B4
        MOVR    R7,     R0                      ; 5C55   00B8
        CMPI    #$0380, R4                      ; 5C56   037C 0380
        CMP@    R6,     R3                      ; 5C58   0373
L_5C59:
        DECR    R7                              ; 5C59   0017

        DECLE   $0373,  $038C,  $0390,  $00D0   ; 5C5A   0373 038C 0390 00D0
        DECLE   $00D4,  $0150,  $0154,  $0158   ; 5C5E   00D4 0150 0154 0158
        DECLE   $0290,  $01E6,  $021C,  $0220   ; 5C62   0290 01E6 021C 0220
        DECLE   $01EA,  $0274,  $015C,  $0160   ; 5C66   01EA 0274 015C 0160
        DECLE   $0270,  $00C8,  $00CC,  $0394   ; 5C6A   0270 00C8 00CC 0394
        DECLE   $0398,  $0373,  $0015,  $0373   ; 5C6E   0398 0373 0015 0373
        DECLE   $0371,  $038C,  $0390,  $0294   ; 5C72   0371 038C 0390 0294
        DECLE   $0298,  $029C,  $0048,  $01E6   ; 5C76   0298 029C 0048 01E6
        DECLE   $021C,  $0220,  $01EA,  $0138   ; 5C7A   021C 0220 01EA 0138
        DECLE   $0164,  $0168,  $0134,  $0394   ; 5C7E   0164 0168 0134 0394
        DECLE   $0398,  $0373,  $0371,  $0019   ; 5C82   0398 0373 0371 0019
        DECLE   $037C,  $0380,  $0373,  $0371   ; 5C86   037C 0380 0373 0371
        DECLE   $038C,  $0390,  $01C0,  $02C8   ; 5C8A   038C 0390 01C0 02C8
        DECLE   $01E4,  $0214,  $01E4,  $021C   ; 5C8E   01E4 0214 01E4 021C
        DECLE   $0220,  $01E8,  $0224,  $01E8   ; 5C92   0220 01E8 0224 01E8
        DECLE   $00C8,  $01C0,  $0394,  $0398   ; 5C96   00C8 01C0 0394 0398
        DECLE   $0373,  $0371,  $0374,  $0378   ; 5C9A   0373 0371 0374 0378
        DECLE   $0018,  $0068,  $006C,  $03A4   ; 5C9E   0018 0068 006C 03A4
        DECLE   $03A8,  $0373,  $0371,  $038C   ; 5CA2   03A8 0373 0371 038C
        DECLE   $0390,  $0228,  $0048,  $01E4   ; 5CA6   0390 0228 0048 01E4
        DECLE   $021C,  $0220,  $01E8,  $0030   ; 5CAA   021C 0220 01E8 0030
        DECLE   $022C,  $0394,  $0398,  $0373   ; 5CAE   022C 0394 0398 0373
        DECLE   $0371,  $0374,  $0378,  $01C1   ; 5CB2   0371 0374 0378 01C1
        DECLE   $0018,  $0038,  $003C,  $0020   ; 5CB6   0018 0038 003C 0020
        DECLE   $016C,  $037C,  $0380,  $0373   ; 5CBA   016C 037C 0380 0373
        DECLE   $0371,  $038C,  $0390,  $0228   ; 5CBE   0371 038C 0390 0228
        DECLE   $0230,  $0234,  $022C,  $0394   ; 5CC2   0230 0234 022C 0394

        AND@    R3,     R0                      ; 5CC6   0398
        CMP@    R6,     R3                      ; 5CC7   0373
        CMP@    R6,     R1                      ; 5CC8   0371
        CMP@    R6,     R4                      ; 5CC9   0374
        CMPI    #$009C, R0                      ; 5CCA   0378 009C
        MOVR    R4,     R0                      ; 5CCC   00A0
        MOVR    R5,     R1                      ; 5CCD   00A9
        DECR    R6                              ; 5CCE   0016
        PSHR    R4                              ; 5CCF   0274
        XORR    R1,     R0                      ; 5CD0   01C8
        CMPR    R4,     R0                      ; 5CD1   0160
        PSHR    R0                              ; 5CD2   0270
        MOVR    R6,     R4                      ; 5CD3   00B4
        MOVR    R7,     R0                      ; 5CD4   00B8
        CMPI    #$0380, R4                      ; 5CD5   037C 0380
        CMP@    R6,     R3                      ; 5CD7   0373
        CMP@    R6,     R1                      ; 5CD8   0371
        AND@    R1,     R4                      ; 5CD9   038C
        AND@    R2,     R0                      ; 5CDA   0390
        AND@    R2,     R4                      ; 5CDB   0394
        AND@    R3,     R0                      ; 5CDC   0398
        CMP@    R6,     R3                      ; 5CDD   0373
        CMP@    R6,     R1                      ; 5CDE   0371
        CMP@    R6,     R4                      ; 5CDF   0374
        CMPI    #$009C, R0                      ; 5CE0   0378 009C
        MOVR    R4,     R0                      ; 5CE2   00A0
        MOVR    R5,     R3                      ; 5CE3   00AB
        DECR    R5                              ; 5CE4   0015
        PSHR    R4                              ; 5CE5   0274
        CMPR    R6,     R0                      ; 5CE6   0170
        CMPR    R4,     R0                      ; 5CE7   0160
        PSHR    R0                              ; 5CE8   0270
        ADDR    R3,     R0                      ; 5CE9   00D8
        ADDR    R3,     R4                      ; 5CEA   00DC
        SLR     R0,     1                       ; 5CEB   0060
        SLR     R0,     2                       ; 5CEC   0064
        CMPI    #$0380, R4                      ; 5CED   037C 0380
L_5CEF:
        CMP@    R6,     R3                      ; 5CEF   0373
        DECLE   $0373,  $0373,  $0374,  $0378   ; 5CF0   0373 0373 0374 0378
        DECLE   $0068,  $006C,  $00BC,  $00C0   ; 5CF4   0068 006C 00BC 00C0
        DECLE   $00AB,  $0018,  $0274,  $01C8   ; 5CF8   00AB 0018 0274 01C8
        DECLE   $0160,  $0270,  $01AD,  $01A4   ; 5CFC   0160 0270 01AD 01A4
        DECLE   $01A8,  $00B4,  $00B8,  $037C   ; 5D00   01A8 00B4 00B8 037C
        DECLE   $0380,  $0373,  $0373,  $0374   ; 5D04   0380 0373 0373 0374
        DECLE   $0378,  $009C,  $00A0,  $0238   ; 5D08   0378 009C 00A0 0238

        BNEQ    L_5D23                          ; 5D0C   020C 0015

        MOVR    R7,     R4                      ; 5D0E   00BC
        ADDR    R0,     R0                      ; 5D0F   00C0
        MOVR    R5,     R1                      ; 5D10   00A9
        COMR    R2                              ; 5D11   001A
        PSHR    R4                              ; 5D12   0274
        XORR    R1,     R0                      ; 5D13   01C8
        CMPR    R4,     R0                      ; 5D14   0160
        PSHR    R0                              ; 5D15   0270
        ANDR    R4,     R4                      ; 5D16   01A4
        ANDR    R5,     R0                      ; 5D17   01A8
        ANDR    R7,     R4                      ; 5D18   01BC
        MVO@    R0,     R5                      ; 5D19   0268
        ADDR    R1,     R0                      ; 5D1A   00C8
        ADDR    R1,     R4                      ; 5D1B   00CC
        AND@    R2,     R4                      ; 5D1C   0394
        AND@    R3,     R0                      ; 5D1D   0398
        CMP@    R6,     R3                      ; 5D1E   0373
        CMP@    R6,     R3                      ; 5D1F   0373
        AND@    R1,     R4                      ; 5D20   038C
        AND@    R2,     R0                      ; 5D21   0390
        ADDR    R2,     R0                      ; 5D22   00D0
L_5D23:
        ADDR    R2,     R4                      ; 5D23   00D4
        DECLE   $023C,  $01E4,  $0238,  $020C   ; 5D24   023C 01E4 0238 020C
        DECLE   $0015,  $00BC,  $00C0,  $0018   ; 5D28   0015 00BC 00C0 0018
        DECLE   $0274,  $0170,  $0160,  $0270   ; 5D2C   0274 0170 0160 0270
        DECLE   $01EC,  $0268,  $01F0,  $01F4   ; 5D30   01EC 0268 01F0 01F4
        DECLE   $0394,  $0398,  $0373,  $0373   ; 5D34   0394 0398 0373 0373
        DECLE   $0373,  $038C,  $0390,  $0228   ; 5D38   0373 038C 0390 0228
        DECLE   $0240,  $023C,  $01E4,  $0238   ; 5D3C   0240 023C 01E4 0238
        DECLE   $020C,  $0244,  $0218           ; 5D40   020C 0244 0218

        COMR    R0                              ; 5D43   0018
        PSHR    R4                              ; 5D44   0274
        XORR    R1,     R0                      ; 5D45   01C8
        CMPR    R4,     R0                      ; 5D46   0160
        PSHR    R0                              ; 5D47   0270
L_5D48:
        XORR    R6,     R0                      ; 5D48   01F0
        DECLE   $01F4,  $0394,  $0398,  $0373   ; 5D49   01F4 0394 0398 0373
        DECLE   $0371,  $0374,  $0378,  $037C   ; 5D4D   0371 0374 0378 037C
        DECLE   $0380,  $0373,  $0371,  $038C   ; 5D51   0380 0373 0371 038C
        DECLE   $0390,  $0228                   ; 5D55   0390 0228

        MVO     R0,     .BTAB.3D                ; 5D57   0240 023D
        B       L_5B1E                          ; 5D59   0220 023C

        COMR    R1                              ; 5D5B   0019
        ADDR    R4,     R0                      ; 5D5C   00E0
L_5D5D:
        ADDR    R4,     R4                      ; 5D5D   00E4
        DECLE   $0168,  $0134,  $0394,  $0398   ; 5D5E   0168 0134 0394 0398
        DECLE   $0373,  $0371,  $0374,  $0378   ; 5D62   0373 0371 0374 0378
        DECLE   $009C,  $00A0,  $00B4,  $00B8   ; 5D66   009C 00A0 00B4 00B8
        DECLE   $037C,  $0380,  $0373,  $0371   ; 5D6A   037C 0380 0373 0371
        DECLE   $038C,  $0390,  $0228,  $0230   ; 5D6E   038C 0390 0228 0230
        DECLE   $0248,  $024C,  $0018,  $00C8   ; 5D72   0248 024C 0018 00C8
        DECLE   $00CC,  $0394,  $0398,  $0373   ; 5D76   00CC 0394 0398 0373
        DECLE   $0371,  $0374,  $0378,  $009C   ; 5D7A   0371 0374 0378 009C
        DECLE   $00A0,  $00B0,  $00A5,  $00A8   ; 5D7E   00A0 00B0 00A5 00A8
        DECLE   $00B4,  $00B8,  $037C,  $0380   ; 5D82   00B4 00B8 037C 0380
        DECLE   $0373,  $0371,  $038C,  $0390   ; 5D86   0373 0371 038C 0390
        DECLE   $00D0,  $00D4,  $0019,  $0394   ; 5D8A   00D0 00D4 0019 0394
        DECLE   $0398,  $0373,  $0371,  $0374   ; 5D8E   0398 0373 0371 0374
        DECLE   $0378,  $009C,  $00A0,  $00B0   ; 5D92   0378 009C 00A0 00B0
        DECLE   $00A4,  $00A8,  $00A4,  $00A8   ; 5D96   00A4 00A8 00A4 00A8
        DECLE   $00A4,  $00A8,  $00B0,  $00B4   ; 5D9A   00A4 00A8 00B0 00B4
        DECLE   $00B8,  $037C,  $0380,  $0373   ; 5D9E   00B8 037C 0380 0373
        DECLE   $0371,  $038C,  $0390,  $0019   ; 5DA2   0371 038C 0390 0019
        DECLE   $0373,  $0371,  $0374,  $0378   ; 5DA6   0373 0371 0374 0378
        DECLE   $0068,  $006C,  $00BC,  $00C0   ; 5DAA   0068 006C 00BC 00C0
        DECLE   $00E8,  $0174,  $00D8,  $00DC   ; 5DAE   00E8 0174 00D8 00DC
        DECLE   $00BC,  $00C0,  $00E8,  $00EC   ; 5DB2   00BC 00C0 00E8 00EC
        DECLE   $00D8,  $00DC,  $0060,  $0064   ; 5DB6   00D8 00DC 0060 0064
        DECLE   $037C,  $0380,  $0373,  $0371   ; 5DBA   037C 0380 0373 0371
        DECLE   $001A,  $0370,  $0371,  $0370   ; 5DBE   001A 0370 0371 0370
        DECLE   $0374,  $0378,  $02F8,  $01C0   ; 5DC2   0374 0378 02F8 01C0
        DECLE   $014C,  $011C,  $01AD,  $0178   ; 5DC6   014C 011C 01AD 0178
        DECLE   $0128,  $0238,  $020C,  $0244   ; 5DCA   0128 0238 020C 0244
        DECLE   $0218                           ; 5DCE   0218

        CMPR    R7,     R4                      ; 5DCF   017C
        SUBR    R5,     R4                      ; 5DD0   012C
        ANDR    R5,     R5                      ; 5DD1   01AD
        ANDR    R0,     R0                      ; 5DD2   0180
        CMPR    R5,     R4                      ; 5DD3   016C
        XORR    R0,     R1                      ; 5DD4   01C1
        CMPI    #$0380, R4                      ; 5DD5   037C 0380
        CMP@    R6,     R3                      ; 5DD7   0373
        COMR    R1                              ; 5DD8   0019
        CMP@    R6,     R3                      ; 5DD9   0373
        AND@    R1,     R4                      ; 5DDA   038C
        AND@    R2,     R0                      ; 5DDB   0390
        ADDI    #$02F8, R4                      ; 5DDC   02FC 02F8
        MVI@    R4,     R0                      ; 5DDE   02A0
        ANDR    R0,     R4                      ; 5DDF   0184
        CMPR    R1,     R4                      ; 5DE0   014C
        SUBR    R3,     R4                      ; 5DE1   011C
        ANDR    R5,     R5                      ; 5DE2   01AD
        CLRR    R4                              ; 5DE3   01E4
        XORR    R4,     R0                      ; 5DE4   01E0
        MVO@    R0,     R2                      ; 5DE5   0250
        XORR    R5,     R0                      ; 5DE6   01E8
        ANDR    R5,     R5                      ; 5DE7   01AD
        ANDR    R0,     R0                      ; 5DE8   0180
        CMPR    R5,     R4                      ; 5DE9   016C
        MVI@    R4,     R4                      ; 5DEA   02A4
        SUBR    R4,     R0                      ; 5DEB   0120
        SAR     R0,     1                       ; 5DEC   0068
        ADD@    R2,     R4                      ; 5DED   02D4
        AND@    R2,     R4                      ; 5DEE   0394
        AND@    R3,     R0                      ; 5DEF   0398
        CMP@    R6,     R3                      ; 5DF0   0373
        COMR    R3                              ; 5DF1   001B
        CMP@    R6,     R2                      ; 5DF2   0372
        CMP@    R6,     R0                      ; 5DF3   0370
        CMP@    R6,     R1                      ; 5DF4   0371
        AND@    R1,     R4                      ; 5DF5   038C
        AND@    R2,     R0                      ; 5DF6   0390
        ANDR    R1,     R0                      ; 5DF7   0188
        ANDR    R1,     R4                      ; 5DF8   018C
        RRC     R0,     1                       ; 5DF9   0070
        ANDR    R0,     R4                      ; 5DFA   0184
        CMPR    R1,     R4                      ; 5DFB   014C
        SUBR    R3,     R4                      ; 5DFC   011C
        CLRR    R4                              ; 5DFD   01E4
        XORR    R4,     R0                      ; 5DFE   01E0
        MVO@    R0,     R2                      ; 5DFF   0250
        XORR    R5,     R0                      ; 5E00   01E8
        ANDR    R0,     R0                      ; 5E01   0180
        CMPR    R5,     R4                      ; 5E02   016C
        RRC     R0,     2                       ; 5E03   0074
        SARC    R0,     1                       ; 5E04   0078
        RRC     R0,     2                       ; 5E05   0074
        SARC    R0,     1                       ; 5E06   0078
        XOR@    R6,     R0                      ; 5E07   03F0
        ANDR    R5,     R4                      ; 5E08   01AC
        AND@    R4,     R4                      ; 5E09   03A4
        AND@    R5,     R0                      ; 5E0A   03A8
        CMP@    R6,     R3                      ; 5E0B   0373
        COMR    R4                              ; 5E0C   001C
        CMPI    #$0380, R4                      ; 5E0D   037C 0380
        CMP@    R6,     R3                      ; 5E0F   0373
        CMP@    R6,     R1                      ; 5E10   0371
        AND@    R1,     R4                      ; 5E11   038C
        AND@    R2,     R0                      ; 5E12   0390
        SARC    R0,     2                       ; 5E13   007C
        ANDR    R1,     R4                      ; 5E14   018C
        MVI@    R4,     R0                      ; 5E15   02A0
        ANDR    R0,     R4                      ; 5E16   0184
        CLRR    R4                              ; 5E17   01E4
        XORR    R4,     R0                      ; 5E18   01E0
        MVO@    R0,     R2                      ; 5E19   0250
        XORR    R5,     R0                      ; 5E1A   01E8
        CMPR    R3,     R4                      ; 5E1B   015C
        SUBR    R4,     R0                      ; 5E1C   0120
        GSWD    R0                              ; 5E1D   0030
        NOP                                     ; 5E1E   0034
        TSTR    R0                              ; 5E1F   0080
        MOVR    R0,     R4                      ; 5E20   0084
        ANDR    R5,     R4                      ; 5E21   01AC
        XOR@    R6,     R0                      ; 5E22   03F0
        ANDR    R5,     R5                      ; 5E23   01AD
        AND@    R4,     R4                      ; 5E24   03A4
        AND@    R5,     R0                      ; 5E25   03A8
        CMP@    R6,     R4                      ; 5E26   0374
        CMPI    #$001B, R0                      ; 5E27   0378 001B
        ADD@    R1,     R0                      ; 5E29   02C8
        ADDI    #$037C, R4                      ; 5E2A   02FC 037C
        AND     G_0373, R0                      ; 5E2C   0380 0373
        CMP@    R6,     R1                      ; 5E2E   0371
        AND@    R1,     R4                      ; 5E2F   038C
        AND@    R2,     R0                      ; 5E30   0390
        ANDR    R1,     R0                      ; 5E31   0188
        ANDR    R1,     R4                      ; 5E32   018C
        CLRR    R4                              ; 5E33   01E4
        XORR    R4,     R0                      ; 5E34   01E0
        MVO@    R0,     R2                      ; 5E35   0250
        XORR    R5,     R0                      ; 5E36   01E8
        SUBR    R6,     R0                      ; 5E37   0130
        SUBR    R6,     R4                      ; 5E38   0134
        AND@    R2,     R4                      ; 5E39   0394
        AND@    R3,     R0                      ; 5E3A   0398
        XORR    R7,     R0                      ; 5E3B   01F8
        MOVR    R1,     R0                      ; 5E3C   0088
        TSTR    R0                              ; 5E3D   0080
        MOVR    R0,     R4                      ; 5E3E   0084
        XOR@    R6,     R0                      ; 5E3F   03F0
        ANDR    R5,     R6                      ; 5E40   01AE
        ADD@    R4,     R0                      ; 5E41   02E0
        ADD@    R2,     R4                      ; 5E42   02D4
L_5E43:
        COMR    R2                              ; 5E43   001A
        DECLE   $00A5,  $00B4,  $00B8,  $037C   ; 5E44   00A5 00B4 00B8 037C
        DECLE   $0380,  $0373,  $0371,  $038C   ; 5E48   0380 0373 0371 038C
        DECLE   $0390,  $0228,  $0230           ; 5E4C   0390 0228 0230

        MVO@    R4,     R2                      ; 5E4F   0254
        BNEQ    L_5ABD                          ; 5E50   022C 0394

        AND@    R3,     R0                      ; 5E52   0398
        CMP@    R6,     R1                      ; 5E53   0371
        XORR    R7,     R0                      ; 5E54   01F8
        MOVR    R1,     R4                      ; 5E55   008C
        XORR    R7,     R0                      ; 5E56   01F8
        XORR    R7,     R0                      ; 5E57   01F8
        TSTR    R0                              ; 5E58   0080
        MOVR    R0,     R4                      ; 5E59   0084
        ANDR    R5,     R5                      ; 5E5A   01AD
        MVI@    R5,     R0                      ; 5E5B   02A8
        MVI@    R5,     R4                      ; 5E5C   02AC
        COMR    R1                              ; 5E5D   0019
        TSTR    R4                              ; 5E5E   00A4
        MOVR    R5,     R0                      ; 5E5F   00A8
        SUB@    R4,     R0                      ; 5E60   0320
        SUB@    R4,     R4                      ; 5E61   0324
        SUBI    #$033C, R0                      ; 5E62   0338 033C
        CMPI    #$0380, R4                      ; 5E64   037C 0380
        CMP@    R6,     R3                      ; 5E66   0373
        CMP@    R6,     R1                      ; 5E67   0371
        AND@    R1,     R4                      ; 5E68   038C
        AND@    R2,     R0                      ; 5E69   0390
        AND@    R2,     R4                      ; 5E6A   0394
        AND@    R3,     R0                      ; 5E6B   0398
        CMP@    R6,     R3                      ; 5E6C   0373
        XORR    R7,     R0                      ; 5E6D   01F8
        ANDR    R5,     R4                      ; 5E6E   01AC
        MOVR    R2,     R0                      ; 5E6F   0090
        MOVR    R1,     R4                      ; 5E70   008C
        MOVR    R2,     R4                      ; 5E71   0094
        XORR    R7,     R0                      ; 5E72   01F8
        TSTR    R0                              ; 5E73   0080
        MVI@    R5,     R4                      ; 5E74   02AC
        XORR    R7,     R1                      ; 5E75   01F9
        DECR    R6                              ; 5E76   0016
        SUB@    R4,     R0                      ; 5E77   0320
        SUB@    R4,     R4                      ; 5E78   0324
        CMP     .PSG1.chn_a_lo,R1               ; 5E79   0341 00F0
        ADDR    R6,     R4                      ; 5E7B   00F4
        MOVR    R6,     R4                      ; 5E7C   00B4
        MOVR    R7,     R0                      ; 5E7D   00B8
        CMPI    #$0380, R4                      ; 5E7E   037C 0380
        CMP@    R6,     R3                      ; 5E80   0373
        CMP@    R6,     R3                      ; 5E81   0373
        CMP@    R6,     R3                      ; 5E82   0373
        XORR    R7,     R0                      ; 5E83   01F8
        ANDR    R5,     R4                      ; 5E84   01AC
        AND@    R5,     R4                      ; 5E85   03AC
        AND@    R6,     R0                      ; 5E86   03B0
        PULR    R0                              ; 5E87   02B0
        XORR    R7,     R1                      ; 5E88   01F9
        PULR    R4                              ; 5E89   02B4
        MOVR    R3,     R0                      ; 5E8A   0098
        XORR    R7,     R0                      ; 5E8B   01F8
        DECR    R3                              ; 5E8C   0013
        CMP     G_00AB, R3                      ; 5E8D   0343 00AB
        MOVR    R6,     R4                      ; 5E8F   00B4
        ADD@    R1,     R0                      ; 5E90   02C8
        CMPI    #$0380, R4                      ; 5E91   037C 0380
        CMP@    R6,     R3                      ; 5E93   0373
        CMP@    R6,     R3                      ; 5E94   0373
        CMP@    R6,     R4                      ; 5E95   0374
        CMPI    #$02B8, R0                      ; 5E96   0378 02B8
        ANDR    R5,     R4                      ; 5E98   01AC
        CMP@    R6,     R1                      ; 5E99   0371
        DECR    R4                              ; 5E9A   0014
        XORR    R7,     R1                      ; 5E9B   01F9
        PULR    R4                              ; 5E9C   02B4
        MOVR    R3,     R0                      ; 5E9D   0098
        XORR    R7,     R0                      ; 5E9E   01F8
        DECR    R5                              ; 5E9F   0015
        CMP     G_00AB, R3                      ; 5EA0   0343 00AB
        ADDR    R1,     R0                      ; 5EA2   00C8
        ADDI    #$0394, R4                      ; 5EA3   02FC 0394
        AND@    R3,     R0                      ; 5EA5   0398
        CMP@    R6,     R3                      ; 5EA6   0373
        CMP@    R6,     R3                      ; 5EA7   0373
        AND@    R1,     R4                      ; 5EA8   038C
        AND@    R2,     R0                      ; 5EA9   0390
        MVI@    R2,     R4                      ; 5EAA   0294
L_5EAB:
        SLL     R0,     1                       ; 5EAB   0048
        CMPI    #$0380, R4                      ; 5EAC   037C 0380
        DECR    R4                              ; 5EAE   0014
        MVII    #$01F8, R0                      ; 5EAF   02B8 01F8
        PULR    R4                              ; 5EB1   02B4
        MOVR    R3,     R0                      ; 5EB2   0098
        XORR    R7,     R0                      ; 5EB3   01F8
L_5EB4:
        DECR    R7                              ; 5EB4   0017

        CMP     G_0348, R4                      ; 5EB5   0344 0348
        CMP     .PSG1.chan_enable,R1            ; 5EB7   0341 00F8
        ADDR    R7,     R4                      ; 5EB9   00FC
        ADDR    R1,     R0                      ; 5EBA   00C8
        ADDR    R1,     R4                      ; 5EBB   00CC
        AND@    R2,     R4                      ; 5EBC   0394
        AND@    R3,     R0                      ; 5EBD   0398
        CMP@    R6,     R3                      ; 5EBE   0373
        CMP@    R6,     R3                      ; 5EBF   0373
        CMP@    R6,     R3                      ; 5EC0   0373
        AND@    R1,     R4                      ; 5EC1   038C
        AND@    R2,     R0                      ; 5EC2   0390
        SUB     G_0304, R0                      ; 5EC3   0300 0304
        DECR    R4                              ; 5EC5   0014
        MVII    #$01F8, R0                      ; 5EC6   02B8 01F8
        PULR    R4                              ; 5EC8   02B4
        SUBR    R0,     R0                      ; 5EC9   0100
        SUBR    R0,     R4                      ; 5ECA   0104
        COMR    R2                              ; 5ECB   001A
        TSTR    R4                              ; 5ECC   00A4
        MOVR    R5,     R0                      ; 5ECD   00A8
        CMP     G_0108, R4                      ; 5ECE   0344 0108
        CMP@    R1,     R4                      ; 5ED0   034C
        CMP@    R2,     R0                      ; 5ED1   0350
        AND@    R2,     R4                      ; 5ED2   0394
        AND@    R3,     R0                      ; 5ED3   0398
        CMP@    R6,     R3                      ; 5ED4   0373
        CMP@    R6,     R0                      ; 5ED5   0370
        CMP@    R6,     R0                      ; 5ED6   0370
        CMP@    R6,     R4                      ; 5ED7   0374
        CMPI    #$037C, R0                      ; 5ED8   0378 037C
        AND     G_0373, R0                      ; 5EDA   0380 0373
        CMP@    R6,     R1                      ; 5EDC   0371
        AND@    R1,     R4                      ; 5EDD   038C
        AND@    R2,     R0                      ; 5EDE   0390
        SARC    R0,     2                       ; 5EDF   007C
        MVI@    R3,     R0                      ; 5EE0   0298
        SUBR    R0,     R0                      ; 5EE1   0100
        SUBR    R0,     R4                      ; 5EE2   0104
        TSTR    R4                              ; 5EE3   00A4
        MOVR    R5,     R0                      ; 5EE4   00A8
        COMR    R1                              ; 5EE5   0019
        MOVR    R5,     R0                      ; 5EE6   00A8
        TSTR    R4                              ; 5EE7   00A4
        ADDR    R1,     R0                      ; 5EE8   00C8
        ADDR    R1,     R4                      ; 5EE9   00CC
        AND@    R2,     R4                      ; 5EEA   0394
L_5EEB:
        AND@    R3,     R0                      ; 5EEB   0398
        CMP@    R6,     R3                      ; 5EEC   0373
        CMP@    R6,     R1                      ; 5EED   0371
        CMP@    R6,     R4                      ; 5EEE   0374
        CMPI    #$0308, R0                      ; 5EEF   0378 0308
        SUB@    R1,     R4                      ; 5EF1   030C
        SUBI    #$01C0, R0                      ; 5EF2   0338 01C0
        CMPI    #$0380, R4                      ; 5EF4   037C 0380
        CMP@    R6,     R3                      ; 5EF6   0373
        CMP@    R6,     R1                      ; 5EF7   0371
        AND@    R1,     R4                      ; 5EF8   038C
        AND@    R2,     R0                      ; 5EF9   0390
        ADDR    R2,     R0                      ; 5EFA   00D0
        ADDR    R2,     R4                      ; 5EFB   00D4
        MOVR    R6,     R0                      ; 5EFC   00B0
        TSTR    R4                              ; 5EFD   00A4
        COMR    R1                              ; 5EFE   0019
        ADDR    R1,     R0                      ; 5EFF   00C8
        ADDR    R1,     R4                      ; 5F00   00CC
        AND@    R2,     R4                      ; 5F01   0394
        AND@    R3,     R0                      ; 5F02   0398
        CMP@    R6,     R3                      ; 5F03   0373
        CMP@    R6,     R1                      ; 5F04   0371
        CMP@    R6,     R4                      ; 5F05   0374
L_5F06:
        CMPI    #$0308, R0                      ; 5F06   0378 0308
        SUB@    R1,     R4                      ; 5F08   030C
        CMP     G_0354, R0                      ; 5F09   0340 0354
        CMP@    R3,     R0                      ; 5F0B   0358
        CLRR    R0                              ; 5F0C   01C0
        SUBI    #$033C, R0                      ; 5F0D   0338 033C
        CMPI    #$0380, R4                      ; 5F0F   037C 0380
        CMP@    R6,     R3                      ; 5F11   0373
        CMP@    R6,     R1                      ; 5F12   0371
        AND@    R1,     R4                      ; 5F13   038C
        AND@    R2,     R0                      ; 5F14   0390
        ADDR    R2,     R0                      ; 5F15   00D0
        ADDR    R2,     R4                      ; 5F16   00D4
        COMR    R1                              ; 5F17   0019
        AND@    R2,     R4                      ; 5F18   0394
        AND@    R3,     R0                      ; 5F19   0398
        CMP@    R6,     R3                      ; 5F1A   0373
        CMP@    R6,     R1                      ; 5F1B   0371
        CMP@    R6,     R4                      ; 5F1C   0374
        CMPI    #$0308, R0                      ; 5F1D   0378 0308
        SUB@    R1,     R4                      ; 5F1F   030C
        CMP     G_0358, R0                      ; 5F20   0340 0358
        CMP@    R2,     R4                      ; 5F22   0354
        CMP@    R3,     R4                      ; 5F23   035C
        CMP     G_01C0, R0                      ; 5F24   0340 01C0
        CMP@    R3,     R0                      ; 5F26   0358
        CMP     G_0338, R0                      ; 5F27   0340 0338
        SUBI    #$037C, R4                      ; 5F29   033C 037C
        AND     G_0373, R0                      ; 5F2B   0380 0373
        CMP@    R6,     R1                      ; 5F2D   0371
        AND@    R1,     R4                      ; 5F2E   038C
        AND@    R2,     R0                      ; 5F2F   0390
L_5F30:
        COMR    R1                              ; 5F30   0019
        CMP@    R6,     R3                      ; 5F31   0373
        CMP@    R6,     R1                      ; 5F32   0371
        CMP@    R6,     R4                      ; 5F33   0374
        CMPI    #$0308, R0                      ; 5F34   0378 0308
        SUB@    R1,     R4                      ; 5F36   030C
        CMP@    R2,     R4                      ; 5F37   0354
        CMP@    R4,     R0                      ; 5F38   0360
        XORR    R1,     R0                      ; 5F39   01C8
L_5F3A:
        CMP@    R3,     R4                      ; 5F3A   035C
        CMP@    R4,     R0                      ; 5F3B   0360
        CMP@    R4,     R4                      ; 5F3C   0364
        CMP@    R3,     R0                      ; 5F3D   0358
        CLRR    R0                              ; 5F3E   01C0
        CMP@    R5,     R0                      ; 5F3F   0368
        CMP@    R5,     R4                      ; 5F40   036C
        CMP     G_0354, R0                      ; 5F41   0340 0354
        SUBI    #$033C, R0                      ; 5F43   0338 033C
        CMPI    #$0380, R4                      ; 5F45   037C 0380
        CMP@    R6,     R3                      ; 5F47   0373
        CMP@    R6,     R1                      ; 5F48   0371
        COMR    R1                              ; 5F49   0019
        CMP@    R6,     R3                      ; 5F4A   0373
        CMP@    R6,     R4                      ; 5F4B   0374
        CMPI    #$0308, R0                      ; 5F4C   0378 0308
        SUB@    R1,     R4                      ; 5F4E   030C
        CMP     G_0358, R0                      ; 5F4F   0340 0358
        CMP     G_0310, R0                      ; 5F51   0340 0310
        XORR    R1,     R2                      ; 5F53   01CA
        CMP@    R3,     R4                      ; 5F54   035C
        CMP     G_01C0, R0                      ; 5F55   0340 01C0
        SUBI    #$033C, R0                      ; 5F57   0338 033C
        CMP@    R5,     R0                      ; 5F59   0368
        CMP@    R5,     R4                      ; 5F5A   036C
        CMP@    R3,     R0                      ; 5F5B   0358
        CMP@    R2,     R4                      ; 5F5C   0354
        SUBI    #$033C, R0                      ; 5F5D   0338 033C
        CMPI    #$0380, R4                      ; 5F5F   037C 0380
        CMP@    R6,     R3                      ; 5F61   0373
        COMR    R2                              ; 5F62   001A
        CMP@    R6,     R3                      ; 5F63   0373
        AND@    R1,     R4                      ; 5F64   038C
        AND@    R2,     R0                      ; 5F65   0390
        CMP@    R5,     R0                      ; 5F66   0368
        CMP@    R5,     R4                      ; 5F67   036C
        CMP@    R2,     R5                      ; 5F68   0355
        CMP     G_0314, R0                      ; 5F69   0340 0314
        SUB@    R2,     R0                      ; 5F6B   0310
        XORR    R1,     R0                      ; 5F6C   01C8
        XORR    R1,     R0                      ; 5F6D   01C8
        CMP@    R4,     R4                      ; 5F6E   0364
        CMP@    R2,     R4                      ; 5F6F   0354
        CLRR    R0                              ; 5F70   01C0
        CMP@    R3,     R0                      ; 5F71   0358
        CMP@    R2,     R4                      ; 5F72   0354
        SUBI    #$033C, R0                      ; 5F73   0338 033C
        CMP@    R5,     R0                      ; 5F75   0368
        CMP@    R5,     R4                      ; 5F76   036C
        CMP@    R1,     R4                      ; 5F77   034C
        CMP@    R2,     R0                      ; 5F78   0350
        AND@    R2,     R4                      ; 5F79   0394
        AND@    R3,     R0                      ; 5F7A   0398
        CMP@    R6,     R3                      ; 5F7B   0373
L_5F7C:
        DECR    R7                              ; 5F7C   0017

        CMP@    R6,     R3                      ; 5F7D   0373
        CMP@    R6,     R1                      ; 5F7E   0371
        AND@    R1,     R4                      ; 5F7F   038C
        AND@    R2,     R0                      ; 5F80   0390
        CMP@    R5,     R0                      ; 5F81   0368
        CMP@    R5,     R4                      ; 5F82   036C
        CMP@    R3,     R0                      ; 5F83   0358
        CMP     G_0314, R0                      ; 5F84   0340 0314
        SUB@    R2,     R0                      ; 5F86   0310
        SUB@    R3,     R0                      ; 5F87   0318
        CMP     G_0358, R0                      ; 5F88   0340 0358
        CLRR    R0                              ; 5F8A   01C0
        CMP     G_0354, R1                      ; 5F8B   0341 0354
        CMP@    R3,     R0                      ; 5F8D   0358
        XORR    R0,     R1                      ; 5F8E   01C1
        AND@    R2,     R4                      ; 5F8F   0394
        AND@    R3,     R0                      ; 5F90   0398
        CMP@    R6,     R3                      ; 5F91   0373
        CMP@    R6,     R1                      ; 5F92   0371
        COMR    R1                              ; 5F93   0019
        CMPI    #$0380, R4                      ; 5F94   037C 0380
        CMP@    R6,     R3                      ; 5F96   0373
        CMP@    R6,     R1                      ; 5F97   0371
        AND@    R1,     R4                      ; 5F98   038C
        AND@    R2,     R0                      ; 5F99   0390
        CMP@    R5,     R0                      ; 5F9A   0368
        CMP@    R5,     R4                      ; 5F9B   036C
        CMP     G_01C0, R0                      ; 5F9C   0340 01C0
        SUB@    R3,     R4                      ; 5F9E   031C
        CMP@    R1,     R4                      ; 5F9F   034C
        CMP@    R2,     R0                      ; 5FA0   0350
        CLRR    R0                              ; 5FA1   01C0
        CMP@    R3,     R0                      ; 5FA2   0358
        CMP     G_034C, R0                      ; 5FA3   0340 034C
        CMP@    R2,     R0                      ; 5FA5   0350
        AND@    R2,     R4                      ; 5FA6   0394
        AND@    R3,     R0                      ; 5FA7   0398
        CMP@    R6,     R3                      ; 5FA8   0373
        CMP@    R6,     R1                      ; 5FA9   0371
        CMP@    R6,     R4                      ; 5FAA   0374
        CMPI    #$0017, R0                      ; 5FAB   0378 0017
        XORR    R0,     R1                      ; 5FAD   01C1
        CMPI    #$0380, R4                      ; 5FAE   037C 0380
        CMP@    R6,     R3                      ; 5FB0   0373
        CMP@    R6,     R1                      ; 5FB1   0371
        AND@    R1,     R4                      ; 5FB2   038C
        AND@    R2,     R0                      ; 5FB3   0390
        CMP@    R5,     R0                      ; 5FB4   0368
        CLRR    R0                              ; 5FB5   01C0
        CMP@    R2,     R0                      ; 5FB6   0350
        SUB@    R1,     R0                      ; 5FB7   0308
        SUB@    R1,     R4                      ; 5FB8   030C
        CLRR    R0                              ; 5FB9   01C0
        CMP@    R1,     R4                      ; 5FBA   034C
        CMP@    R2,     R0                      ; 5FBB   0350
        AND@    R2,     R4                      ; 5FBC   0394
        AND@    R3,     R0                      ; 5FBD   0398
        CMP@    R6,     R3                      ; 5FBE   0373
        CMP@    R6,     R1                      ; 5FBF   0371
        CMP@    R6,     R4                      ; 5FC0   0374
        CMPI    #$01C1, R0                      ; 5FC1   0378 01C1
        COMR    R0                              ; 5FC3   0018
        MOVR    R5,     R1                      ; 5FC4   00A9
        MOVR    R6,     R4                      ; 5FC5   00B4
        MOVR    R7,     R0                      ; 5FC6   00B8
        CMPI    #$0380, R4                      ; 5FC7   037C 0380
        CMP@    R6,     R3                      ; 5FC9   0373
        CMP@    R6,     R1                      ; 5FCA   0371
        AND@    R1,     R4                      ; 5FCB   038C
        AND@    R2,     R0                      ; 5FCC   0390
        ADD@    R1,     R0                      ; 5FCD   02C8
        CMP@    R5,     R4                      ; 5FCE   036C
        CMP@    R1,     R4                      ; 5FCF   034C
        CLRR    R0                              ; 5FD0   01C0
        AND@    R2,     R4                      ; 5FD1   0394
        AND@    R3,     R0                      ; 5FD2   0398
        CMP@    R6,     R3                      ; 5FD3   0373
        CMP@    R6,     R1                      ; 5FD4   0371
        CMP@    R6,     R4                      ; 5FD5   0374
        CMPI    #$009C, R0                      ; 5FD6   0378 009C
        MOVR    R4,     R0                      ; 5FD8   00A0
        TSTR    R4                              ; 5FD9   00A4
        MOVR    R6,     R0                      ; 5FDA   00B0
        DECR    R6                              ; 5FDB   0016
        MOVR    R5,     R3                      ; 5FDC   00AB
        MOVR    R6,     R4                      ; 5FDD   00B4
        MOVR    R7,     R0                      ; 5FDE   00B8
        CMPI    #$0380, R4                      ; 5FDF   037C 0380
        CMP@    R6,     R3                      ; 5FE1   0373
        CMP@    R6,     R1                      ; 5FE2   0371
        AND@    R1,     R4                      ; 5FE3   038C
        AND@    R2,     R0                      ; 5FE4   0390
        AND@    R2,     R4                      ; 5FE5   0394
        AND@    R3,     R0                      ; 5FE6   0398
        CMP@    R6,     R3                      ; 5FE7   0373
        CMP@    R6,     R1                      ; 5FE8   0371
        CMP@    R6,     R4                      ; 5FE9   0374
        CMPI    #$0068, R0                      ; 5FEA   0378 0068
        SAR     R0,     2                       ; 5FEC   006C
        INCR    R0                              ; 5FED   0008
        INCR    R4                              ; 5FEE   000C
        MOVR    R5,     R0                      ; 5FEF   00A8
        TSTR    R4                              ; 5FF0   00A4
        DECR    R6                              ; 5FF1   0016
        SUBR    R1,     R4                      ; 5FF2   010C
        SUBR    R2,     R0                      ; 5FF3   0110
        MVO@    R0,     R3                      ; 5FF4   0258
        MVO@    R4,     R3                      ; 5FF5   025C
        SUBR    R1,     R4                      ; 5FF6   010C
        SUBR    R2,     R0                      ; 5FF7   0110
        MVO@    R0,     R4                      ; 5FF8   0260
        MVO@    R4,     R4                      ; 5FF9   0264
        CMPI    #$0380, R4                      ; 5FFA   037C 0380
        CMP@    R6,     R3                      ; 5FFC   0373
        CMP@    R6,     R3                      ; 5FFD   0373
        CMP@    R6,     R3                      ; 5FFE   0373
        CMP@    R6,     R4                      ; 5FFF   0374
        CMPI    #$02FD, R0                      ; 6000   0378 02FD
        ANDR    R3,     R4                      ; 6002   019C
        ANDR    R4,     R0                      ; 6003   01A0
        DECR    R5                              ; 6004   0015
        INCR    R0                              ; 6005   0008
        INCR    R4                              ; 6006   000C
        COMR    R0                              ; 6007   0018
        AND@    R6,     R4                      ; 6008   03B4
        ANDI    #$01E3, R0                      ; 6009   03B8 01E3
        ANDI    #$03C0, R4                      ; 600B   03BC 03C0
        MOVR    R6,     R4                      ; 600D   00B4
        MOVR    R7,     R0                      ; 600E   00B8
        CMPI    #$0380, R4                      ; 600F   037C 0380
        CMP@    R6,     R3                      ; 6011   0373
        CMP@    R6,     R3                      ; 6012   0373
        CMP@    R6,     R4                      ; 6013   0374
        CMPI    #$009C, R0                      ; 6014   0378 009C
        MOVR    R4,     R0                      ; 6016   00A0
        ADDI    #$02C8, R4                      ; 6017   02FC 02C8
        MVO@    R4,     R5                      ; 6019   026C
        ANDR    R7,     R4                      ; 601A   01BC
        ANDR    R3,     R4                      ; 601B   019C
        ANDR    R4,     R0                      ; 601C   01A0
        ANDR    R4,     R4                      ; 601D   01A4
        ANDR    R5,     R0                      ; 601E   01A8
        COMR    R2                              ; 601F   001A
        XOR     G_03C8, R4                      ; 6020   03C4 03C8
        AND@    R6,     R4                      ; 6022   03B4
        ANDI    #$03BC, R0                      ; 6023   03B8 03BC
        XOR     G_03C8, R0                      ; 6025   03C0 03C8
        XOR@    R1,     R4                      ; 6027   03CC
        ADDR    R1,     R0                      ; 6028   00C8
        ADDR    R1,     R4                      ; 6029   00CC
        AND@    R2,     R4                      ; 602A   0394
        AND@    R3,     R0                      ; 602B   0398
        CMP@    R6,     R3                      ; 602C   0373
        CMP@    R6,     R3                      ; 602D   0373
        AND@    R1,     R4                      ; 602E   038C
        AND@    R2,     R0                      ; 602F   0390
        ADDR    R2,     R0                      ; 6030   00D0
        ADDR    R2,     R4                      ; 6031   00D4
        ADDI    #$01CC, R5                      ; 6032   02FD 01CC
        XORR    R2,     R0                      ; 6034   01D0
        XORR    R7,     R4                      ; 6035   01FC
        B       L_6078                          ; 6036   0200 0040

        SWAP    R0,     2                       ; 6038   0044
        DECR    R6                              ; 6039   0016
        XOR@    R2,     R0                      ; 603A   03D0
        XOR@    R2,     R4                      ; 603B   03D4
        XOR     G_03C8, R4                      ; 603C   03C4 03C8
        XOR@    R3,     R0                      ; 603E   03D8
        XOR@    R1,     R4                      ; 603F   03CC
        XOR@    R3,     R4                      ; 6040   03DC
        XOR@    R4,     R0                      ; 6041   03E0
        AND@    R2,     R4                      ; 6042   0394
        AND@    R3,     R0                      ; 6043   0398
        CMP@    R6,     R3                      ; 6044   0373
        CMP@    R6,     R3                      ; 6045   0373
        CMP@    R6,     R3                      ; 6046   0373
        AND@    R1,     R4                      ; 6047   038C
        AND@    R2,     R0                      ; 6048   0390
        ADDI    #$00A0, R6                      ; 6049   02FE 00A0
        CMPR    R1,     R4                      ; 604B   014C
        SUBR    R3,     R4                      ; 604C   011C
        ANDR    R0,     R0                      ; 604D   0180
        CMPR    R5,     R4                      ; 604E   016C
        COMR    R1                              ; 604F   0019
        ADDR    R1,     R0                      ; 6050   00C8
        CLRR    R0                              ; 6051   01C0
        XOR@    R4,     R4                      ; 6052   03E4
        XOR@    R5,     R0                      ; 6053   03E8
        XOR@    R5,     R4                      ; 6054   03EC
        XOR@    R4,     R0                      ; 6055   03E0
        AND@    R2,     R4                      ; 6056   0394
        AND@    R3,     R0                      ; 6057   0398
        CMP@    R6,     R3                      ; 6058   0373
        CMP@    R6,     R1                      ; 6059   0371
        CMP@    R6,     R4                      ; 605A   0374
        CMPI    #$037C, R0                      ; 605B   0378 037C
        AND     G_0373, R0                      ; 605D   0380 0373
        CMP@    R6,     R1                      ; 605F   0371
        AND@    R1,     R4                      ; 6060   038C
        AND@    R2,     R0                      ; 6061   0390
        ADD@    R1,     R0                      ; 6062   02C8
        ADDR    R2,     R4                      ; 6063   00D4
        MVI@    R4,     R0                      ; 6064   02A0
        ANDR    R2,     R0                      ; 6065   0190
        SUBR    R4,     R4                      ; 6066   0124
        MVII    #$0018, R4                      ; 6067   02BC 0018
        MOVR    R6,     R4                      ; 6069   00B4
        MOVR    R7,     R0                      ; 606A   00B8
        XORR    R0,     R1                      ; 606B   01C1
        AND@    R2,     R4                      ; 606C   0394
        AND@    R3,     R0                      ; 606D   0398
        CMP@    R6,     R3                      ; 606E   0373
        CMP@    R6,     R1                      ; 606F   0371
        CMP@    R6,     R4                      ; 6070   0374
        CMPI    #$0068, R0                      ; 6071   0378 0068
        SAR     R0,     2                       ; 6073   006C
        SLR     R0,     1                       ; 6074   0060
        SLR     R0,     2                       ; 6075   0064
        CMPI    #$0380, R4                      ; 6076   037C 0380
L_6078:
        CMP@    R6,     R3                      ; 6078   0373
        CMP@    R6,     R1                      ; 6079   0371
        AND@    R1,     R4                      ; 607A   038C
        AND@    R2,     R0                      ; 607B   0390
        ANDR    R1,     R0                      ; 607C   0188
        CMPR    R4,     R4                      ; 607D   0164
        ANDR    R2,     R4                      ; 607E   0194
        ANDR    R3,     R0                      ; 607F   0198
        COMR    R1                              ; 6080   0019
        ADDR    R1,     R0                      ; 6081   00C8
        ADDR    R1,     R4                      ; 6082   00CC
        AND@    R2,     R4                      ; 6083   0394
        AND@    R3,     R0                      ; 6084   0398
        CMP@    R6,     R3                      ; 6085   0373
        CMP@    R6,     R1                      ; 6086   0371
        CMP@    R6,     R4                      ; 6087   0374
        CMPI    #$009C, R0                      ; 6088   0378 009C
        MOVR    R4,     R0                      ; 608A   00A0
        ADD     .BTAB.C4,R0                     ; 608B   02C0 02C4
        MVI@    R5,     R0                      ; 608D   02A8
        MVI@    R5,     R4                      ; 608E   02AC
        MOVR    R6,     R4                      ; 608F   00B4
        MOVR    R7,     R0                      ; 6090   00B8
        CMPI    #$0380, R4                      ; 6091   037C 0380
        CMP@    R6,     R3                      ; 6093   0373
        CMP@    R6,     R1                      ; 6094   0371
        AND@    R1,     R4                      ; 6095   038C
        AND@    R2,     R0                      ; 6096   0390
        ADDR    R2,     R0                      ; 6097   00D0
        ADDR    R2,     R4                      ; 6098   00D4
L_6099:
        DECR    R7                              ; 6099   0017

        DECLE   $0394,  $0398,  $0373,  $0371   ; 609A   0394 0398 0373 0371
        DECLE   $0374,  $0378,  $009C,  $00A0   ; 609E   0374 0378 009C 00A0
        DECLE   $00A9,  $0114,  $0118,  $0100   ; 60A2   00A9 0114 0118 0100
        DECLE   $0104,  $00A9,  $00B4,  $00B8   ; 60A6   0104 00A9 00B4 00B8
        DECLE   $037C,  $0380,  $0373,  $0371   ; 60AA   037C 0380 0373 0371
        DECLE   $038C,  $0390,  $022C,  $0207   ; 60AE   038C 0390 022C 0207
        DECLE   $023C,  $0244,  $0234,  $0006   ; 60B2   023C 0244 0234 0006
        DECLE   $020E,  $0216,  $0209,  $022E   ; 60B6   020E 0216 0209 022E
        DECLE   $0236,  $0211,  $020B,  $0213   ; 60BA   0236 0211 020B 0213
        DECLE   $0219,  $0221,  $023E,  $0246   ; 60BE   0219 0221 023E 0246
        DECLE   $0223,  $0212,  $021A,  $0222   ; 60C2   0223 0212 021A 0222
        DECLE   $022A,  $020A,  $023B,  $0243   ; 60C6   022A 020A 023B 0243
        DECLE   $022B,  $0233,  $0239,  $0229   ; 60CA   022B 0233 0239 0229
        DECLE   $0231,  $021B,  $021F           ; 60CE   0231 021B 021F

        BUSC    L_5E43                          ; 60D1   0227 028F

        MVO     R7,     .BTAB.3F                ; 60D3   0247 023F
        MVI     .BTAB.7F,R7                     ; 60D5   0287 027F

        DECLE   $022B,  $0233,  $02DD,  $0000   ; 60D7   022B 0233 02DD 0000
        DECLE   $022C,  $02B7,  $023B           ; 60DB   022C 02B7 023B

        MVO     R3,     .BTAB.18                ; 60DE   0243 0218
        B       L_5EAB                          ; 60E0   0220 0236

        DECLE   $020B,  $0213,  $021B,  $0223   ; 60E2   020B 0213 021B 0223
        DECLE   $0208,  $0210,  $0239,  $0241   ; 60E6   0208 0210 0239 0241
        DECLE   $02D1,  $02E9,  $022D,  $0235   ; 60EA   02D1 02E9 022D 0235
        DECLE   $021D,  $0225,  $022F,  $0237   ; 60EE   021D 0225 022F 0237
        DECLE   $0245,  $020A,  $0212,  $023F   ; 60F2   0245 020A 0212 023F

        MVO     R7,     .BTAB.40                ; 60F6   0247 0240
        INCR    R7                              ; 60F8   000F

        MVO@    R4,     R3                      ; 60F9   025C
L_60FA:
        B       L_5EEB                          ; 60FA   0220 0210

        DECLE   $020B,  $0213,  $021C,  $022B   ; 60FC   020B 0213 021C 022B
        DECLE   $0233,  $022C,  $0234,  $0238   ; 6100   0233 022C 0234 0238
        DECLE   $021F,  $0227,  $020F,  $0006   ; 6104   021F 0227 020F 0006
        DECLE   $025B,  $02BB,  $029B,  $0230   ; 6108   025B 02BB 029B 0230
        DECLE   $0267,  $02F4,  $0218,  $0208   ; 610C   0267 02F4 0218 0208
        DECLE   $0228                           ; 6110   0228
L_6111:
        DECR    R7                              ; 6111   0017

        DECLE   $021B,  $0223,  $0027,  $029C   ; 6112   021B 0223 0027 029C
        DECLE   $0214,  $0238,  $0240,  $0228   ; 6116   0214 0238 0240 0228
        DECLE   $0230,  $0248,  $0218,  $0220   ; 611A   0230 0248 0218 0220
        DECLE   $029B,  $0006,  $024B,  $0010   ; 611E   029B 0006 024B 0010
        DECLE   $0249,  $021B,  $02BB,  $025B   ; 6122   0249 021B 02BB 025B
        DECLE   $0223,  $0258,  $024A,  $0272   ; 6126   0223 0258 024A 0272
        DECLE   $026A,  $024E,  $020B,  $0213   ; 612A   026A 024E 020B 0213
        DECLE   $024F,  $0208,  $0210           ; 612E   024F 0208 0210

        PSHR    R0                              ; 6131   0270
        MVO@    R0,     R5                      ; 6132   0268
        MVO     R0,     .BTAB.18                ; 6133   0240 0218
        B       L_5F06                          ; 6135   0220 0230

        DECLE   $0018,  $025C,  $0208,  $021B   ; 6137   0018 025C 0208 021B
        DECLE   $0213,  $0223,  $020B,  $0238   ; 613B   0213 0223 020B 0238
        DECLE   $0006,  $02BB,  $0228,  $029C   ; 613F   0006 02BB 0228 029C
        DECLE   $0214,  $025B,  $029B,  $023C   ; 6143   0214 025B 029B 023C
        DECLE   $0244,  $023B,  $0243,  $027E   ; 6147   0244 023B 0243 027E
        DECLE   $0286,  $0269,  $0271,  $0296   ; 614B   0286 0269 0271 0296
        DECLE   $028E,  $0239                   ; 614F   028E 0239

        MVO     R1,     .BTAB.21                ; 6151   0241 0221
        NEGR    R0                              ; 6153   0020
        B       L_5F3A                          ; 6154   0220 021B

        DECLE   $0223,  $020B,  $0281,  $0291   ; 6156   0223 020B 0281 0291
        DECLE   $0228,  $0230,  $0218,  $0259   ; 615A   0228 0230 0218 0259
        DECLE   $0018,  $0279,  $0238           ; 615E   0018 0279 0238

        MVO     R0,     .BTAB.B7                ; 6161   0240 02B7
        ADD@    R3,     R5                      ; 6163   02DD
        SKIP                                    ; 6164   0208
        B       L_5F30                          ; 6165   0220 0236

        DECLE   $022E,  $0218,  $0230,  $0239   ; 6167   022E 0218 0230 0239
        DECLE   $0231,  $020C,  $0214,  $02DC   ; 616B   0231 020C 0214 02DC
        DECLE   $0006,  $021B,  $0223,  $020D   ; 616F   0006 021B 0223 020D
        DECLE   $0215,  $02F1,  $02ED,  $02F9   ; 6173   0215 02F1 02ED 02F9
        DECLE   $02D5,  $022C,  $0234,  $023C   ; 6177   02D5 022C 0234 023C
        DECLE   $0244,  $020C,  $0214,  $023B   ; 617B   0244 020C 0214 023B
        DECLE   $0243,  $0006,  $021C,  $0224   ; 617F   0243 0006 021C 0224
        DECLE   $020B,  $0213                   ; 6183   020B 0213

        ADD@    R3,     R4                      ; 6185   02DC
        PULR    R7                              ; 6186   02B7

        DECLE   $02E9,  $02D1,  $02F9,  $021B   ; 6187   02E9 02D1 02F9 021B
        DECLE   $0223,  $0006,  $020B,  $0213   ; 618B   0223 0006 020B 0213
        DECLE   $021B,  $0223,  $022C,  $0234   ; 618F   021B 0223 022C 0234
        DECLE   $023B,  $0243,  $022B,  $0233   ; 6193   023B 0243 022B 0233
        DECLE   $0208,  $0210,  $0218,  $0220   ; 6197   0208 0210 0218 0220
        DECLE   $0238,  $0240,  $023A,  $0242   ; 619B   0238 0240 023A 0242
        DECLE   $022A,  $0232,  $0280,  $0006   ; 619F   022A 0232 0280 0006
        DECLE   $0278,  $021C,  $02BB,  $025B   ; 61A3   0278 021C 02BB 025B
        DECLE   $020B,  $0213,  $021B,  $0223   ; 61A7   020B 0213 021B 0223
        DECLE   $029B,  $0248,  $0027,  $0000   ; 61AB   029B 0248 0027 0000
        DECLE   $0047,  $0200,  $0067,  $0020   ; 61AF   0047 0200 0067 0020
        DECLE   $0081,  $0240,  $009A,  $0040   ; 61B3   0081 0240 009A 0040
        DECLE   $00B2,  $0260,  $00C8,  $0060   ; 61B7   00B2 0260 00C8 0060
        DECLE   $00DC,  $0220                   ; 61BB   00DC 0220

        ADDR    R5,     R5                      ; 61BD   00ED
        SUBR    R0,     R0                      ; 61BE   0100
        ADDR    R7,     R4                      ; 61BF   00FC
        SUB     .PSG1.chn_c_vol,R0              ; 61C0   0300 00FD
        CMP@    R4,     R0                      ; 61C2   0360
        ADDR    R7,     R5                      ; 61C3   00FD
        CMP     .PSG1.chn_c_vol,R0              ; 61C4   0340 00FD
        SUB@    R4,     R0                      ; 61C6   0320
        ADDR    R7,     R5                      ; 61C7   00FD
        CMPR    R4,     R0                      ; 61C8   0160
        ADDR    R7,     R5                      ; 61C9   00FD
        CMPR    R0,     R0                      ; 61CA   0140
        ADDR    R7,     R5                      ; 61CB   00FD
        SUBR    R4,     R0                      ; 61CC   0120
L_61CD:
        PSHR    R5                              ; 61CD   0275
        MVII    #$0008, R0                      ; 61CE   02B8 0008
        MVI     G_019D, R1                      ; 61D0   0281 019D
        SLR     R1,     1                       ; 61D2   0061
        PSHR    R1                              ; 61D3   0271
        ADDI    #$0002, R1                      ; 61D4   02F9 0002
        CMPR    R0,     R1                      ; 61D6   0141
        BGE     L_61DA                          ; 61D7   020D 0001

        MOVR    R1,     R0                      ; 61D9   0088
L_61DA:
        PULR    R1                              ; 61DA   02B1
        PSHR    R0                              ; 61DB   0270
        NEGR    R1                              ; 61DC   0021
        ADDI    #$0003, R1                      ; 61DD   02F9 0003
        MOVR    R1,     R2                      ; 61DF   008A

        JSR     R5,     X_RAND2                 ; 61E0   0004 0114 029E

        ADDR    R0,     R2                      ; 61E3   00C2
        PULR    R0                              ; 61E4   02B0
        SLL     R2,     2                       ; 61E5   004E
        SLL     R2,     2                       ; 61E6   004E
        SLL     R2,     1                       ; 61E7   004A
        PSHR    R2                              ; 61E8   0272

        JSR     R5,     X_RAND2                 ; 61E9   0004 0114 029E

        ADDR    R1,     R0                      ; 61EC   00C8
        SLL     R0,     2                       ; 61ED   004C
        SLL     R0,     2                       ; 61EE   004C
        SLL     R0,     1                       ; 61EF   0048
        PSHR    R0                              ; 61F0   0270

        JSR     R5,     L_581C                  ; 61F1   0004 0158 001C

        MVII    #$0002, R0                      ; 61F4   02B8 0002

        JSR     R5,     X_RAND1                 ; 61F6   0004 0114 027D

        MOVR    R0,     R1                      ; 61F9   0081
        INCR    R1                              ; 61FA   0009
        SLL     R1,     2                       ; 61FB   004D
        SLL     R1,     1                       ; 61FC   0049
        MVO     R1,     G_0197                  ; 61FD   0241 0197
        MVI     G_0195, R1                      ; 61FF   0281 0195
        SLL     R1,     1                       ; 6201   0049
        ADDR    R0,     R1                      ; 6202   00C1
        SDBD                                    ; 6203   0001
        ADDI    #$621B, R1                      ; 6204   02F9 001B 0062
        MVI@    R1,     R2                      ; 6207   028A
        MOVR    R2,     R3                      ; 6208   0093
        PULR    R1                              ; 6209   02B1
        ANDI    #$00E0, R1                      ; 620A   03B9 00E0
        ANDI    #$001F, R2                      ; 620C   03BA 001F
        XORR    R2,     R1                      ; 620E   01D1
        MVO     R1,     G_01B2                  ; 620F   0241 01B2
        PULR    R1                              ; 6211   02B1
        ANDI    #$00E0, R1                      ; 6212   03B9 00E0
        SLR     R3,     2                       ; 6214   0067
        SLR     R3,     2                       ; 6215   0067
        SLR     R3,     1                       ; 6216   0063
        XORR    R3,     R1                      ; 6217   01D9
        MVO     R1,     G_01B1                  ; 6218   0241 01B1
        PULR    R7                              ; 621A   02B7

        DECLE   $00CD,  $0187                   ; 621B   00CD 0187

        ANDR    R2,     R6                      ; 621D   0196
        SUBR    R2,     R5                      ; 621E   0115
        MVI     G_0125, R7                      ; 621F   0287 0125

        DECLE   $02CC,  $039E,  $0058,  $0089   ; 6221   02CC 039E 0058 0089
        DECLE   $0038,  $0080,  $0004,  $0020   ; 6225   0038 0080 0004 0020
        DECLE   $0069,  $0062,  $0000,  $0000   ; 6229   0069 0062 0000 0000
        DECLE   $000F,  $0000,  $0000,  $0000   ; 622D   000F 0000 0000 0000
        DECLE   $0058,  $0009,  $00B8,  $0000   ; 6231   0058 0009 00B8 0000
        DECLE   $0002,  $0020,  $0077,  $0062   ; 6235   0002 0020 0077 0062
        DECLE   $0000,  $0000,  $0001,  $0000   ; 6239   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0049   ; 623D   0000 0000 0000 0049
        DECLE   $0080,  $0040,  $0002,  $0020   ; 6241   0080 0040 0002 0020
        DECLE   $0077,  $0062,  $0000,  $0000   ; 6245   0077 0062 0000 0000
        DECLE   $0001,  $0000,  $0008,  $0000   ; 6249   0001 0000 0008 0000
        DECLE   $0000                           ; 624D   0000

        TSTR    R1                              ; 624E   0089
        TSTR    R0                              ; 624F   0080
        TSTR    R0                              ; 6250   0080
        EIS                                     ; 6251   0002
        NEGR    R0                              ; 6252   0020
        MOVR    R0,     R7                      ; 6253   0087

        DECLE   $0062,  $0000,  $0000,  $0001   ; 6254   0062 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6258   0000 0000 0000 0000

        ADDR    R1,     R1                      ; 625C   00C9
        TSTR    R0                              ; 625D   0080
        ADDR    R0,     R0                      ; 625E   00C0
        EIS                                     ; 625F   0002
        NEGR    R0                              ; 6260   0020
        MOVR    R0,     R7                      ; 6261   0087

        DECLE   $0062,  $0000,  $0000,  $0001   ; 6262   0062 0000 0000 0001
        DECLE   $0000,  $0008,  $0000,  $00DC   ; 6266   0000 0008 0000 00DC
        DECLE   $0056,  $0093,  $0062,  $0001   ; 626A   0056 0093 0062 0001
        DECLE   $0033,  $00FF,  $0063,  $00FF   ; 626E   0033 00FF 0063 00FF
        DECLE   $0063,  $00FF,  $0063,  $00FF   ; 6272   0063 00FF 0063 00FF
        DECLE   $0063,  $00C5,  $0064,  $0099   ; 6276   0063 00C5 0064 0099
        DECLE   $0062,  $0004,  $0133,  $0035   ; 627A   0062 0004 0133 0035
        DECLE   $0064,  $0035,  $0064,  $0035   ; 627E   0064 0035 0064 0035
        DECLE   $0064,  $0035,  $0064,  $0039   ; 6282   0064 0035 0064 0039
        DECLE   $0063,  $007A,  $0064,  $0099   ; 6286   0063 007A 0064 0099
        DECLE   $0062,  $0004,  $0103,  $00AE   ; 628A   0062 0004 0103 00AE
        DECLE   $0063,  $00AE,  $0063,  $0039   ; 628E   0063 00AE 0063 0039
        DECLE   $0063,  $0000,  $0000,  $0030   ; 6292   0063 0000 0000 0030
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6296   0030 0000 0000 0000
        DECLE   $0000,  $000F,  $001F,  $003F   ; 629A   0000 000F 001F 003F

        SARC    R3,     2                       ; 629E   007F
        SARC    R3,     2                       ; 629F   007F
        SWAP    R1,     1                       ; 62A0   0041
        SWAP    R1,     1                       ; 62A1   0041
        SARC    R3,     2                       ; 62A2   007F
        SARC    R3,     2                       ; 62A3   007F
        ADDR    R3,     R6                      ; 62A4   00DE
        ADDR    R6,     R3                      ; 62A5   00F3
        ADDR    R3,     R7                      ; 62A6   00DF

        DECLE   $0050,  $0020,  $0000,  $0000   ; 62A7   0050 0020 0000 0000

        ADDR    R6,     R0                      ; 62AB   00F0
        ADDR    R5,     R6                      ; 62AC   00EE
        ADDR    R3,     R6                      ; 62AD   00DE
        MOVR    R5,     R7                      ; 62AE   00AF

        DECLE   $006F,  $00BF,  $00BD,  $00FD   ; 62AF   006F 00BF 00BD 00FD
        DECLE   $00FA,  $00F0,  $00F0,  $00D0   ; 62B3   00FA 00F0 00F0 00D0
        DECLE   $00D0,  $0060,  $007F,  $005F   ; 62B7   00D0 0060 007F 005F
        DECLE   $006F,  $0057,  $005C,  $0074   ; 62BB   006F 0057 005C 0074
        DECLE   $0077,  $00FF,  $00FF,  $00BF   ; 62BF   0077 00FF 00FF 00BF
        DECLE   $00BF,  $006F,  $0007,  $0002   ; 62C3   00BF 006F 0007 0002
        DECLE   $0003,  $0001                   ; 62C7   0003 0001

        TSTR    R0                              ; 62C9   0080
        ADDR    R0,     R0                      ; 62CA   00C0
        ADDR    R4,     R0                      ; 62CB   00E0
        ADDR    R6,     R0                      ; 62CC   00F0
        DECR    R0                              ; 62CD   0010
        DECR    R0                              ; 62CE   0010
        ADDR    R6,     R0                      ; 62CF   00F0
        ADDR    R7,     R0                      ; 62D0   00F8
        ADDR    R7,     R4                      ; 62D1   00FC
        ADDR    R5,     R6                      ; 62D2   00EE
        ADCR    R1                              ; 62D3   0029
        ADDR    R5,     R7                      ; 62D4   00EF

        DECLE   $00AB,  $00FF                   ; 62D5   00AB 00FF

        MOVR    R0,     R6                      ; 62D7   0086
        TSTR    R0                              ; 62D8   0080
L_62D9:
        PSHR    R5                              ; 62D9   0275
        PSHR    R0                              ; 62DA   0270
        PSHR    R3                              ; 62DB   0273
        MVII    #$017B, R4                      ; 62DC   02BC 017B
        MVII    #$0100, R5                      ; 62DE   02BD 0100
        DIS                                     ; 62E0   0003
        SDBD                                    ; 62E1   0001
        MVI@    R5,     R3                      ; 62E2   02AB
        MVI@    R2,     R5                      ; 62E3   0295
        MVI@    R1,     R1                      ; 62E4   0289
        MVI@    R4,     R2                      ; 62E5   02A2
        MVI@    R4,     R0                      ; 62E6   02A0
        EIS                                     ; 62E7   0002
        SDBD                                    ; 62E8   0001
        CMPI    #$53C8, R3                      ; 62E9   037B 00C8 0053
        BNEQ    L_62F3                          ; 62EC   020C 0005

        PULR    R2                              ; 62EE   02B2
        PULR    R2                              ; 62EF   02B2
        MVII    #$0001, R0                      ; 62F0   02B8 0001
        PULR    R7                              ; 62F2   02B7

L_62F3:
        ANDI    #$001F, R2                      ; 62F3   03BA 001F
        SLL     R2,     2                       ; 62F5   004E
        SLL     R2,     1                       ; 62F6   004A
        MVII    #$00FF, R3                      ; 62F7   02BB 00FF
        ANDR    R3,     R5                      ; 62F9   019D
        ADDR    R5,     R2                      ; 62FA   00EA
        ANDR    R3,     R2                      ; 62FB   019A
        ANDI    #$001F, R0                      ; 62FC   03B8 001F
        SLL     R0,     2                       ; 62FE   004C
        SLL     R0,     1                       ; 62FF   0048
        ANDI    #$007F, R1                      ; 6300   03B9 007F
        ADDR    R1,     R0                      ; 6302   00C8
        ANDR    R3,     R0                      ; 6303   0198
        SLL     R0,     1                       ; 6304   0048
        PULR    R3                              ; 6305   02B3
        RRC     R3,     1                       ; 6306   0073
        BNC     L_630C                          ; 6307   0209 0003

        SUBI    #$014E, R0                      ; 6309   0338 014E
        INCR    R7                              ; 630B   000F

L_630C:
        NEGR    R0                              ; 630C   0020
L_630D:
        PULR    R5                              ; 630D   02B5
        TSTR    R5                              ; 630E   00AD
        BEQ     L_6318                          ; 630F   0204 0007

        ADDI    #$0015, R0                      ; 6311   02F8 0015
        MOVR    R0,     R1                      ; 6313   0081
        ADDI    #$0015, R1                      ; 6314   02F9 0015
        B       L_631D                          ; 6316   0200 0005

L_6318:
        ADDI    #$000D, R0                      ; 6318   02F8 000D
        MOVR    R0,     R1                      ; 631A   0081
        ADDI    #$003C, R1                      ; 631B   02F9 003C
L_631D:
        MVII    #$0002, R4                      ; 631D   02BC 0002
L_631F:
        TSTR    R1                              ; 631F   0089
        BMI     L_6325                          ; 6320   020B 0003

        CMPR    R0,     R2                      ; 6322   0142
        BGE     L_632E                          ; 6323   020D 0009

L_6325:
        ADDI    #$0100, R0                      ; 6325   02F8 0100
        ADDI    #$0100, R1                      ; 6327   02F9 0100
        DECR    R4                              ; 6329   0014
        BPL     L_631F                          ; 632A   0223 000C
        B       L_6331                          ; 632C   0200 0003

L_632E:
        CMPR    R1,     R2                      ; 632E   014A
        BLT     L_6337                          ; 632F   0205 0006

L_6331:
        TSTR    R0                              ; 6331   0080
        BMI     L_6325                          ; 6332   022B 000E

        CLRR    R0                              ; 6334   01C0
        DECR    R0                              ; 6335   0010
        PULR    R7                              ; 6336   02B7

L_6337:
        CLRR    R0                              ; 6337   01C0
        PULR    R7                              ; 6338   02B7

        PSHR    R5                              ; 6339   0275
        PSHR    R2                              ; 633A   0272
        MOVR    R2,     R1                      ; 633B   0091
        MOVR    R2,     R3                      ; 633C   0093
        ADDI    #$017F, R3                      ; 633D   02FB 017F
        MVI@    R3,     R3                      ; 633F   029B
        ADDI    #$0325, R2                      ; 6340   02FA 0325
        ADDI    #$032D, R1                      ; 6342   02F9 032D
        CMPI    #$032B, R2                      ; 6344   037A 032B
        BGE     L_6353                          ; 6346   020D 000B

        CLRR    R0                              ; 6348   01C0

        JSR     R5,     L_62D9                  ; 6349   0004 0160 02D9

        PULR    R3                              ; 634C   02B3
        TSTR    R0                              ; 634D   0080
        BPL     L_6479                          ; 634E   0203 0129

        CLRR    R0                              ; 6350   01C0
        B       L_63B0                          ; 6351   0200 005D

L_6353:
        MVI@    R2,     R0                      ; 6353   0290
        MVI@    R1,     R5                      ; 6354   028D
        PSHR    R0                              ; 6355   0270
        PSHR    R5                              ; 6356   0275
        PSHR    R3                              ; 6357   0273
        ADDI    #$0002, R0                      ; 6358   02F8 0002
        ADDI    #$0001, R5                      ; 635A   02FD 0001
        RRC     R3,     1                       ; 635C   0073
        BNC     L_6361                          ; 635D   0209 0002

        SUBI    #$0002, R5                      ; 635F   033D 0002
L_6361:
        PULR    R3                              ; 6361   02B3
        PSHR    R3                              ; 6362   0273
        MVII    #$01A3, R2                      ; 6363   02BA 01A3
        MVII    #$01A4, R1                      ; 6365   02B9 01A4
        MVO@    R0,     R2                      ; 6367   0250
        MVO@    R5,     R1                      ; 6368   024D
        CLRR    R0                              ; 6369   01C0

        JSR     R5,     L_62D9                  ; 636A   0004 0160 02D9

        NEGR    R0                              ; 636D   0020
        SLL     R0,     1                       ; 636E   0048
        MOVR    R0,     R4                      ; 636F   0084
        PULR    R3                              ; 6370   02B3
        PULR    R1                              ; 6371   02B1
        PULR    R2                              ; 6372   02B2
        PSHR    R3                              ; 6373   0273
        SUBI    #$0002, R2                      ; 6374   033A 0002
        SUBI    #$0001, R1                      ; 6376   0339 0001
        RRC     R3,     1                       ; 6378   0073
        BNC     L_637D                          ; 6379   0209 0002

        ADDI    #$0002, R1                      ; 637B   02F9 0002
L_637D:
        MVO     R1,     G_01A4                  ; 637D   0241 01A4
        MVO     R2,     G_01A3                  ; 637F   0242 01A3
        MVII    #$01A4, R1                      ; 6381   02B9 01A4
        MVII    #$01A3, R2                      ; 6383   02BA 01A3
        PULR    R3                              ; 6385   02B3
        ANDI    #$0001, R3                      ; 6386   03BB 0001
        CLRR    R0                              ; 6388   01C0
        PSHR    R4                              ; 6389   0274

        JSR     R5,     L_62D9                  ; 638A   0004 0160 02D9

        PULR    R4                              ; 638D   02B4
        NEGR    R0                              ; 638E   0020
        PULR    R3                              ; 638F   02B3
        ADDR    R0,     R4                      ; 6390   00C4
        BLE     L_6479                          ; 6391   0206 00E6

        MVII    #$0001, R2                      ; 6393   02BA 0001
        CMPI    #$0001, R4                      ; 6395   037C 0001
        BEQ     L_639E                          ; 6397   0204 0005

        CMPI    #$0002, R4                      ; 6399   037C 0002
        BNEQ    L_63B0                          ; 639B   020C 0013

        NEGR    R2                              ; 639D   0022

L_639E:
        JSR     R5,     L_6FED                  ; 639E   0004 016C 03ED

        MVO     R0,     G_018D                  ; 63A1   0240 018D

        JSR     R5,     L_6694                  ; 63A3   0004 0164 0294

        MVII    #$000A, R0                      ; 63A6   02B8 000A
        MVO     R0,     G_01AB                  ; 63A8   0240 01AB

        JSR     R5,     L_6F4E                  ; 63AA   0004 016C 034E

        PULR    R7                              ; 63AD   02B7

        CLRR    R3                              ; 63AE   01DB
L_63AF:
        PSHR    R5                              ; 63AF   0275
L_63B0:
        ANDI    #$0006, R3                      ; 63B0   03BB 0006
        CMPI    #$0006, R3                      ; 63B2   037B 0006
        BNEQ    L_63BD                          ; 63B4   020C 0007

        MVII    #$000E, R4                      ; 63B6   02BC 000E

        JSR     R5,     L_5534                  ; 63B8   0004 0154 0134

        MVO     R0,     G_019A                  ; 63BB   0240 019A
L_63BD:
        PSHR    R3                              ; 63BD   0273

        JSR     R5,     L_63EC                  ; 63BE   0004 0160 03EC
        JSR     R5,     L_6F9F                  ; 63C1   0004 016C 039F

        PULR    R3                              ; 63C4   02B3
        ADDI    #$032D, R3                      ; 63C5   02FB 032D
        MVI@    R3,     R0                      ; 63C7   0298
        PSHR    R0                              ; 63C8   0270
        SUBI    #$0008, R3                      ; 63C9   033B 0008
        MVI@    R3,     R0                      ; 63CB   0298
        PSHR    R0                              ; 63CC   0270
        PSHR    R3                              ; 63CD   0273
        SDBD                                    ; 63CE   0001
        MVII    #$6706, R4                      ; 63CF   02BC 0006 0067

        JSR     R5,     L_5707                  ; 63D2   0004 0154 0307

        SUBI    #$0325, R3                      ; 63D5   033B 0325

        JSR     R5,     L_56DC                  ; 63D7   0004 0154 02DC

        PULR    R2                              ; 63DA   02B2
        SDBD                                    ; 63DB   0001
        MVII    #$FAFF, R1                      ; 63DC   02B9 00FF 00FA
        AND@    R6,     R1                      ; 63DF   03B1
        SDBD                                    ; 63E0   0001
        XORI    #$0400, R1                      ; 63E1   03F9 0000 0004
        MVO@    R1,     R2                      ; 63E4   0251
        ADDI    #$0008, R2                      ; 63E5   02FA 0008
        PULR    R1                              ; 63E7   02B1
        XORI    #$0100, R1                      ; 63E8   03F9 0100
        MVO@    R1,     R2                      ; 63EA   0251
        PULR    R7                              ; 63EB   02B7

L_63EC:
        PSHR    R5                              ; 63EC   0275
        CMPI    #$0006, R3                      ; 63ED   037B 0006
        BEQ     L_63F8                          ; 63EF   0204 0007

        SLL     R3,     1                       ; 63F1   004B
        ADDI    #$0126, R3                      ; 63F2   02FB 0126

        JSR     R5,     L_573E                  ; 63F4   0004 0154 033E

        PULR    R7                              ; 63F7   02B7

L_63F8:
        CLRR    R3                              ; 63F8   01DB
        MVO     R3,     G_018A                  ; 63F9   0243 018A

        JSR     R5,     L_6692                  ; 63FB   0004 0164 0292

        PULR    R7                              ; 63FE   02B7

        PSHR    R5                              ; 63FF   0275
        PSHR    R1                              ; 6400   0271
        MVII    #$0003, R3                      ; 6401   02BB 0003

        JSR     R5,     L_56DC                  ; 6403   0004 0154 02DC

        PULR    R3                              ; 6406   02B3
        MVI     G_019B, R0                      ; 6407   0280 019B
        DECR    R0                              ; 6409   0010
        MVO     R0,     G_019B                  ; 640A   0240 019B
        BGT     L_641E                          ; 640C   020E 0010

        JSR     R5,     L_63AF                  ; 640E   0004 0160 03AF

        MVI     G_018F, R1                      ; 6411   0281 018F
        TSTR    R1                              ; 6413   0089
        BNEQ    L_641E                          ; 6414   020C 0008

        INCR    R1                              ; 6416   0009
        MVO     R1,     G_018F                  ; 6417   0241 018F
        INCR    R1                              ; 6419   0009
        NEGR    R1                              ; 641A   0021

        JSR     R5,     L_6C40                  ; 641B   0004 016C 0040

L_641E:
        PULR    R7                              ; 641E   02B7

L_641F:
        MVII    #$0001, R4                      ; 641F   02BC 0001
        INCR    R7                              ; 6421   000F

L_6422:
        CLRR    R4                              ; 6422   01E4
L_6423:
        PSHR    R3                              ; 6423   0273
        ADDI    #$0335, R3                      ; 6424   02FB 0335
        DIS                                     ; 6426   0003
        MVI@    R3,     R0                      ; 6427   0298
        SDBD                                    ; 6428   0001
        ANDI    #$CFF8, R0                      ; 6429   03B8 00F8 00CF
        XORR    R2,     R0                      ; 642C   01D0
        MVO@    R0,     R3                      ; 642D   0258
        EIS                                     ; 642E   0002
        PULR    R3                              ; 642F   02B3
        INCR    R3                              ; 6430   000B
        DECR    R4                              ; 6431   0014
        BPL     L_6422                          ; 6432   0223 0011
        MOVR    R5,     R7                      ; 6434   00AF

        PSHR    R5                              ; 6435   0275
        MOVR    R1,     R0                      ; 6436   0088
        AND     G_018F, R0                      ; 6437   0380 018F
        MVO     R0,     G_0190                  ; 6439   0240 0190
        MVII    #$0325, R3                      ; 643B   02BB 0325
        MVII    #$0006, R4                      ; 643D   02BC 0006
L_643F:
        MVI@    R3,     R0                      ; 643F   0298
        SDBD                                    ; 6440   0001
        ANDI    #$FEFF, R0                      ; 6441   03B8 00FF 00FE
        MVO@    R0,     R3                      ; 6444   0258
        INCR    R3                              ; 6445   000B
        DECR    R4                              ; 6446   0014
        BNEQ    L_643F                          ; 6447   022C 0009

        PSHR    R2                              ; 6449   0272
        MVI     G_018F, R3                      ; 644A   0283 018F
        SWAP    R3,     2                       ; 644C   0047
        BPL     L_6458                          ; 644D   0203 0009

        CMPI    #$0002, R1                      ; 644F   0379 0002
        BLE     L_6458                          ; 6451   0206 0005

        CLRR    R0                              ; 6453   01C0
        MVO     R0,     G_01BF                  ; 6454   0240 01BF
        B       L_645C                          ; 6456   0200 0004

L_6458:
        MOVR    R1,     R3                      ; 6458   008B

        JSR     R5,     L_63AF                  ; 6459   0004 0160 03AF

L_645C:
        CLRR    R0                              ; 645C   01C0
        DECR    R0                              ; 645D   0010
        PULR    R3                              ; 645E   02B3
        J       L_63B0                          ; 645F   0004 0360 03B0

        PSHR    R5                              ; 6462   0275
        MVI     G_01A6, R0                      ; 6463   0280 01A6
        INCR    R0                              ; 6465   0008
        MVO     R0,     G_01A6                  ; 6466   0240 01A6
        CMPI    #$0003, R0                      ; 6468   0378 0003
        BLT     L_6479                          ; 646A   0205 000D

        MVO     R1,     G_0190                  ; 646C   0241 0190
        PSHR    R2                              ; 646E   0272
        MOVR    R1,     R3                      ; 646F   008B

        JSR     R5,     L_63AF                  ; 6470   0004 0160 03AF

        PULR    R3                              ; 6473   02B3

        JSR     R5,     L_56DC                  ; 6474   0004 0154 02DC

        MVO     R2,     G_019A                  ; 6477   0242 019A
L_6479:
        PULR    R7                              ; 6479   02B7

L_647A:
        PSHR    R5                              ; 647A   0275
        PSHR    R3                              ; 647B   0273
        MVII    #$017F, R1                      ; 647C   02B9 017F
        ADDR    R3,     R1                      ; 647E   00D9
        MVI@    R1,     R1                      ; 647F   0289

        JSR     R5,     L_5745                  ; 6480   0004 0154 0345

        PSHR    R3                              ; 6483   0273
        ADDI    #$0325, R3                      ; 6484   02FB 0325
        PULR    R5                              ; 6486   02B5
        SDBD                                    ; 6487   0001
        MVII    #$0A00, R2                      ; 6488   02BA 0000 000A
        CMPI    #$0006, R5                      ; 648B   037D 0006
        BGE     L_6491                          ; 648D   020D 0002

        XORI    #$0100, R2                      ; 648F   03FA 0100
L_6491:
        MOVR    R2,     R5                      ; 6491   0095
        COMR    R5                              ; 6492   001D
        TSTR    R4                              ; 6493   00A4
        BMI     L_64B8                          ; 6494   020B 0022

        MVI@    R4,     R1                      ; 6496   02A1
        MOVR    R1,     R0                      ; 6497   0088
        SDBD                                    ; 6498   0001
        ANDI    #$3600, R0                      ; 6499   03B8 0000 0036
        ANDI    #$0007, R1                      ; 649C   03B9 0007
        SDBD                                    ; 649E   0001
        CMPI    #$1000, R0                      ; 649F   0378 0000 0010
        BEQ     L_64B8                          ; 64A2   0204 0014

        SDBD                                    ; 64A4   0001
        CMPI    #$0600, R0                      ; 64A5   0378 0000 0006
        BEQ     L_64B8                          ; 64A8   0204 000E

        CMPI    #$0003, R1                      ; 64AA   0379 0003
        BEQ     L_64B8                          ; 64AC   0204 000A

        TSTR    R1                              ; 64AE   0089
        BNEQ    L_64B7                          ; 64AF   020C 0006

        SDBD                                    ; 64B1   0001
        CMPI    #$3600, R0                      ; 64B2   0378 0000 0036
        BNEQ    L_64B8                          ; 64B5   020C 0001

L_64B7:
        CLRR    R2                              ; 64B7   01D2
L_64B8:
        DIS                                     ; 64B8   0003
        MVI@    R3,     R1                      ; 64B9   0299
        ANDR    R5,     R1                      ; 64BA   01A9
        XORR    R2,     R1                      ; 64BB   01D1
        MVO@    R1,     R3                      ; 64BC   0259
        EIS                                     ; 64BD   0002
        CLRR    R0                              ; 64BE   01C0
        INCR    R0                              ; 64BF   0008
        PULR    R3                              ; 64C0   02B3
        ADDI    #$034D, R3                      ; 64C1   02FB 034D
        MVO@    R0,     R3                      ; 64C3   0258
        PULR    R7                              ; 64C4   02B7

        PSHR    R5                              ; 64C5   0275

        JSR     R5,     L_647A                  ; 64C6   0004 0164 007A

        MVI     G_01AB, R0                      ; 64C9   0280 01AB
        DECR    R0                              ; 64CB   0010
        BMI     L_6479                          ; 64CC   022B 0054

        MVO     R0,     G_01AB                  ; 64CE   0240 01AB
        J       L_665A                          ; 64D0   0004 0364 025A

        PSHR    R5                              ; 64D3   0275
        MVII    #$0100, R4                      ; 64D4   02BC 0100
        SDBD                                    ; 64D6   0001
        MVI@    R4,     R1                      ; 64D7   02A1
        SDBD                                    ; 64D8   0001
        CMPI    #$53C8, R1                      ; 64D9   0379 00C8 0053
        BEQ     L_65BE                          ; 64DC   0204 00E0

        MVI     G_01B0, R1                      ; 64DE   0281 01B0
        TSTR    R1                              ; 64E0   0089
        BNEQ    L_64E8                          ; 64E1   020C 0005

        MVI     G_019D, R1                      ; 64E3   0281 019D
        TSTR    R1                              ; 64E5   0089
        BEQ     L_65BE                          ; 64E6   0204 00D6

L_64E8:
        MVII    #$0004, R5                      ; 64E8   02BD 0004
        MVI     G_0341, R1                      ; 64EA   0281 0341
        TSTR    R1                              ; 64EC   0089
        BEQ     L_64FB                          ; 64ED   0204 000C

        MVI     G_019D, R1                      ; 64EF   0281 019D
        CMPI    #$0008, R1                      ; 64F1   0379 0008
        BLT     L_65BE                          ; 64F3   0205 00C9

        CLRR    R5                              ; 64F5   01ED
        MVI     G_033D, R1                      ; 64F6   0281 033D
        TSTR    R1                              ; 64F8   0089
        BNEQ    L_65BE                          ; 64F9   020C 00C3

L_64FB:
        PSHR    R5                              ; 64FB   0275
        MVII    #$0002, R0                      ; 64FC   02B8 0002

        JSR     R5,     X_RAND1                 ; 64FE   0004 0114 027D

        PULR    R5                              ; 6501   02B5
        CMP     G_0185, R0                      ; 6502   0340 0185
        BNEQ    L_6508                          ; 6504   020C 0002

        XORI    #$0002, R0                      ; 6506   03F8 0002
L_6508:
        PSHR    R0                              ; 6508   0270
        PSHR    R0                              ; 6509   0270
        MVI     G_017C, R1                      ; 650A   0281 017C
        ANDI    #$001F, R1                      ; 650C   03B9 001F
        CLRR    R4                              ; 650E   01E4
        CMPI    #$0002, R0                      ; 650F   0378 0002
        BGE     L_6515                          ; 6511   020D 0002

        ADDI    #$000C, R4                      ; 6513   02FC 000C
L_6515:
        PULR    R2                              ; 6515   02B2
        PSHR    R4                              ; 6516   0274
        ADDR    R4,     R1                      ; 6517   00E1
        SLL     R1,     1                       ; 6518   0049
        PSHR    R5                              ; 6519   0275
        ADDI    #$017F, R5                      ; 651A   02FD 017F
        MVO@    R2,     R5                      ; 651C   026A
        MVO@    R2,     R5                      ; 651D   026A
        PULR    R5                              ; 651E   02B5
        RRC     R2,     1                       ; 651F   0072
        BNC     L_6525                          ; 6520   0209 0003

        SUBI    #$0029, R1                      ; 6522   0339 0029
        INCR    R7                              ; 6524   000F

L_6525:
        NEGR    R1                              ; 6525   0021
L_6526:
        ADDI    #$0003, R1                      ; 6526   02F9 0003
        ANDI    #$001F, R1                      ; 6528   03B9 001F
        MVII    #$0002, R0                      ; 652A   02B8 0002
        PSHR    R5                              ; 652C   0275

        JSR     R5,     X_RAND1                 ; 652D   0004 0114 027D

        PULR    R3                              ; 6530   02B3
        MVI     G_018F, R5                      ; 6531   0285 018F
        TSTR    R5                              ; 6533   00AD
        BNEQ    L_6544                          ; 6534   020C 000E

        MVI     G_019D, R5                      ; 6536   0285 019D
        CMPI    #$0003, R5                      ; 6538   037D 0003
        BGT     L_6544                          ; 653A   020E 0008

        MVII    #$0003, R2                      ; 653C   02BA 0003
        CMPI    #$0002, R0                      ; 653E   0378 0002
        BGE     L_6543                          ; 6540   020D 0001

        CLRR    R2                              ; 6542   01D2
L_6543:
        MOVR    R2,     R0                      ; 6543   0090
L_6544:
        ADDR    R0,     R1                      ; 6544   00C1
        MVI     G_017B, R2                      ; 6545   0282 017B
        ANDI    #$001F, R2                      ; 6547   03BA 001F
        SUBR    R2,     R1                      ; 6549   0111
        PSHR    R1                              ; 654A   0271
        PSHR    R3                              ; 654B   0273
        ADDI    #$0325, R3                      ; 654C   02FB 0325
        SDBD                                    ; 654E   0001
        MVII    #$624D, R4                      ; 654F   02BC 004D 0062
        MVII    #$0002, R2                      ; 6552   02BA 0002

        JSR     R5,     L_5705                  ; 6554   0004 0154 0305

        PULR    R2                              ; 6557   02B2
        PSHR    R2                              ; 6558   0272
        SDBD                                    ; 6559   0001
        MVII    #$2007, R1                      ; 655A   02B9 0007 0020
        MVI     G_018F, R3                      ; 655D   0283 018F
        TSTR    R3                              ; 655F   009B
        BEQ     L_6571                          ; 6560   0204 000F

        CMPI    #$0002, R2                      ; 6562   037A 0002
        BLE     L_6571                          ; 6564   0206 000B

        SDBD                                    ; 6566   0001
        MVII    #$2000, R1                      ; 6567   02B9 0000 0020
        CLRR    R0                              ; 656A   01C0
        DECR    R0                              ; 656B   0010
        MVO     R0,     G_018F                  ; 656C   0240 018F
        NEGR    R0                              ; 656E   0020
        MVO     R3,     G_01BF                  ; 656F   0243 01BF
L_6571:
        PSHR    R2                              ; 6571   0272
        MOVR    R2,     R3                      ; 6572   0093
        MOVR    R1,     R2                      ; 6573   008A

        JSR     R5,     L_641F                  ; 6574   0004 0164 001F

        PULR    R2                              ; 6577   02B2

        JSR     R5,     L_6BD3                  ; 6578   0004 0168 03D3

        PULR    R3                              ; 657B   02B3
        PULR    R1                              ; 657C   02B1
        SLL     R1,     2                       ; 657D   004D
        SLL     R1,     1                       ; 657E   0049
        PULR    R2                              ; 657F   02B2
        SLL     R2,     2                       ; 6580   004E
        SLL     R2,     1                       ; 6581   004A
        ANDI    #$007F, R2                      ; 6582   03BA 007F
        MVII    #$00FF, R0                      ; 6584   02B8 00FF
        ANDR    R0,     R1                      ; 6586   0181
        SWAP    R0,     1                       ; 6587   0040
        PSHR    R3                              ; 6588   0273
        MOVR    R2,     R5                      ; 6589   0095
        MOVR    R3,     R2                      ; 658A   009A
        ADDI    #$0325, R2                      ; 658B   02FA 0325
        ADDI    #$032D, R3                      ; 658D   02FB 032D
        DIS                                     ; 658F   0003
        MVI@    R2,     R4                      ; 6590   0294
        ANDR    R0,     R4                      ; 6591   0184
        ADDR    R4,     R1                      ; 6592   00E1
        MVO@    R1,     R2                      ; 6593   0251
        EIS                                     ; 6594   0002
        SARC    R0,     1                       ; 6595   0078
        DIS                                     ; 6596   0003
        AND@    R3,     R0                      ; 6597   0398
        ADDR    R0,     R5                      ; 6598   00C5
        MVO@    R5,     R3                      ; 6599   025D
        EIS                                     ; 659A   0002
        PULR    R2                              ; 659B   02B2
        PULR    R0                              ; 659C   02B0
        MVII    #$0007, R1                      ; 659D   02B9 0007
        MVI     G_019D, R3                      ; 659F   0283 019D
        SLR     R3,     1                       ; 65A1   0063
        ADDR    R3,     R1                      ; 65A2   00D9
        MVII    #$0020, R4                      ; 65A3   02BC 0020
        CMPR    R4,     R1                      ; 65A5   0161
        BLE     L_65A9                          ; 65A6   0206 0001

        MOVR    R4,     R1                      ; 65A8   00A1
L_65A9:
        MVO     R1,     G_018B                  ; 65A9   0241 018B
        PSHR    R2                              ; 65AB   0272

        JSR     R5,     L_66A1                  ; 65AC   0004 0164 02A1

        PULR    R3                              ; 65AF   02B3
        SLL     R3,     1                       ; 65B0   004B
        ADDI    #$0126, R3                      ; 65B1   02FB 0126

        JSR     R5,     L_5740                  ; 65B3   0004 0154 0340

        MVII    #$0002, R0                      ; 65B6   02B8 0002
        MVO     R0,     G_019B                  ; 65B8   0240 019B
        MVII    #$0002, R0                      ; 65BA   02B8 0002
        MVO     R0,     G_01AA                  ; 65BC   0240 01AA
L_65BE:
        PULR    R7                              ; 65BE   02B7

        PSHR    R5                              ; 65BF   0275
        MVI     G_0344, R0                      ; 65C0   0280 0344
        TSTR    R0                              ; 65C2   0080
        BEQ     L_6617                          ; 65C3   0204 0052

        MVI     G_019F, R0                      ; 65C5   0280 019F
        TSTR    R0                              ; 65C7   0080
        BNEQ    L_65CB                          ; 65C8   020C 0001
        PULR    R7                              ; 65CA   02B7

L_65CB:
        MVII    #$011F, R1                      ; 65CB   02B9 011F
        ADD     G_0188, R1                      ; 65CD   02C1 0188
        MVI@    R1,     R0                      ; 65CF   0288
        ADDI    #$0002, R1                      ; 65D0   02F9 0002
        MVI@    R1,     R3                      ; 65D2   028B
        CMPI    #$000F, R0                      ; 65D3   0378 000F
        BGT     L_665A                          ; 65D5   020E 0083

        ADDI    #$0002, R0                      ; 65D7   02F8 0002
        ANDI    #$000F, R0                      ; 65D9   03B8 000F
        CLRR    R2                              ; 65DB   01D2
        DECR    R2                              ; 65DC   0012
        SARC    R0,     2                       ; 65DD   007C
        BEQ     L_663B                          ; 65DE   0204 005B

        MVII    #$0001, R2                      ; 65E0   02BA 0001
        CMPI    #$0002, R0                      ; 65E2   0378 0002
        BEQ     L_663B                          ; 65E4   0204 0055
        BLT     L_6618                          ; 65E6   0205 0030

        CMPI    #$0002, R3                      ; 65E8   037B 0002
        BNEQ    L_65FD                          ; 65EA   020C 0011

        MVI     G_0189, R0                      ; 65EC   0280 0189
        TSTR    R0                              ; 65EE   0080
        BNEQ    L_6617                          ; 65EF   020C 0026

        MVII    #$0002, R2                      ; 65F1   02BA 0002

        JSR     R5,     L_567F                  ; 65F3   0004 0154 027F

        MVI     G_018A, R1                      ; 65F6   0281 018A
        MOVR    R1,     R2                      ; 65F8   008A
        SARC    R1,     2                       ; 65F9   007D
        SUBR    R1,     R2                      ; 65FA   010A
        B       L_660F                          ; 65FB   0200 0012

L_65FD:
        MVI     G_018A, R2                      ; 65FD   0282 018A
        SUBI    #$000F, R2                      ; 65FF   033A 000F
        MVI     G_019D, R0                      ; 6601   0280 019D
        CMPI    #$0014, R0                      ; 6603   0378 0014
        BLE     L_6609                          ; 6605   0206 0002

        SUBI    #$000A, R2                      ; 6607   033A 000A
L_6609:
        TSTR    R2                              ; 6609   0092
        BGT     L_660F                          ; 660A   020E 0003

        CLRR    R2                              ; 660C   01D2
        B       L_6612                          ; 660D   0200 0003

L_660F:
        JSR     R5,     L_6F4E                  ; 660F   0004 016C 034E

L_6612:
        MVO     R2,     G_018A                  ; 6612   0242 018A

        JSR     R5,     L_6692                  ; 6614   0004 0164 0292

L_6617:
        PULR    R7                              ; 6617   02B7

L_6618:
        MVI     G_018A, R2                      ; 6618   0282 018A
        CMPI    #$0045, R2                      ; 661A   037A 0045
        BGE     L_665A                          ; 661C   020D 003C

        MVI     G_0187, R2                      ; 661E   0282 0187
        TSTR    R2                              ; 6620   0092
        BNEQ    L_6629                          ; 6621   020C 0006

        INCR    R2                              ; 6623   000A
        MVO     R2,     G_0187                  ; 6624   0242 0187

        JSR     R5,     L_6F6D                  ; 6626   0004 016C 036D

L_6629:
        MVI     G_018A, R2                      ; 6629   0282 018A
        ADDI    #$0006, R2                      ; 662B   02FA 0006
        MVI     G_019D, R0                      ; 662D   0280 019D
        CMPI    #$0014, R0                      ; 662F   0378 0014
        BLE     L_6635                          ; 6631   0206 0002

        ADDI    #$0005, R2                      ; 6633   02FA 0005
L_6635:
        MVO     R2,     G_018A                  ; 6635   0242 018A

        JSR     R5,     L_6692                  ; 6637   0004 0164 0292

        PULR    R7                              ; 663A   02B7

L_663B:
        CMPI    #$0002, R3                      ; 663B   037B 0002
        BNEQ    L_664F                          ; 663D   020C 0010

        MVI     G_0189, R0                      ; 663F   0280 0189
        TSTR    R0                              ; 6641   0080
        BNEQ    L_664E                          ; 6642   020C 000A

        ADD     G_018A, R0                      ; 6644   02C0 018A
        BEQ     L_664E                          ; 6646   0204 0006

        JSR     R5,     L_567F                  ; 6648   0004 0154 027F

        J       L_6F4F                          ; 664B   0004 036C 034F
L_664E:
        PULR    R7                              ; 664E   02B7

L_664F:
        MVI     G_018D, R1                      ; 664F   0281 018D
        TSTR    R1                              ; 6651   0089
        BNEQ    L_6659                          ; 6652   020C 0005

        MVO     R2,     G_018D                  ; 6654   0242 018D

        JSR     R5,     L_666B                  ; 6656   0004 0164 026B

L_6659:
        PULR    R7                              ; 6659   02B7

L_665A:
        MVI     G_0187, R2                      ; 665A   0282 0187
        TSTR    R2                              ; 665C   0092
        BEQ     L_6662                          ; 665D   0204 0003

        JSR     R5,     L_6FAD                  ; 665F   0004 016C 03AD

L_6662:
        CLRR    R2                              ; 6662   01D2
        MVO     R2,     G_0187                  ; 6663   0242 0187
        MVO     R2,     G_018D                  ; 6665   0242 018D

        JSR     R5,     L_6692                  ; 6667   0004 0164 0292

        PULR    R7                              ; 666A   02B7

L_666B:
        PSHR    R5                              ; 666B   0275
        ADD     G_0185, R2                      ; 666C   02C2 0185
        MOVR    R2,     R0                      ; 666E   0090
        MVI     G_018A, R1                      ; 666F   0281 018A
        MOVR    R1,     R2                      ; 6671   008A
        SARC    R1,     1                       ; 6672   0079
        SARC    R2,     2                       ; 6673   007E
        ADDR    R2,     R1                      ; 6674   00D1

        JSR     R5,     L_66A1                  ; 6675   0004 0164 02A1

        NEGR    R1                              ; 6678   0021
        NEGR    R2                              ; 6679   0022
        SWAP    R1,     1                       ; 667A   0041
        MVI     G_0108, R3                      ; 667B   0283 0108
        SWAP    R3,     1                       ; 667D   0043
        ADDR    R3,     R1                      ; 667E   00D9
        BNOV    L_668A                          ; 667F   020A 0009
        BMI     L_6687                          ; 6681   020B 0004

        MVII    #$0081, R1                      ; 6683   02B9 0081
        B       L_6689                          ; 6685   0200 0002

L_6687:
        MVII    #$007F, R1                      ; 6687   02B9 007F
L_6689:
        SWAP    R1,     1                       ; 6689   0041
L_668A:
        ADD     G_010C, R2                      ; 668A   02C2 010C
        SWAP    R1,     1                       ; 668C   0041
        MVO     R1,     G_0108                  ; 668D   0241 0108
        MVO     R2,     G_010C                  ; 668F   0242 010C
        PULR    R7                              ; 6691   02B7

L_6692:
        MVI     G_0185, R0                      ; 6692   0280 0185
L_6694:
        PSHR    R5                              ; 6694   0275
        MVI     G_018A, R1                      ; 6695   0281 018A

        JSR     R5,     L_66A1                  ; 6697   0004 0164 02A1

        NEGR    R1                              ; 669A   0021
        NEGR    R2                              ; 669B   0022
        MVO     R1,     G_0108                  ; 669C   0241 0108
        MVO     R2,     G_010C                  ; 669E   0242 010C
        PULR    R7                              ; 66A0   02B7

L_66A1:
        PSHR    R5                              ; 66A1   0275
        ANDI    #$0003, R0                      ; 66A2   03B8 0003
        PSHR    R0                              ; 66A4   0270
        MVII    #$0072, R0                      ; 66A5   02B8 0072

        JSR     R5,     X_MPY                   ; 66A7   0004 011C 01DC

        SWAP    R2,     1                       ; 66AA   0042
        ANDI    #$00FF, R2                      ; 66AB   03BA 00FF
        PULR    R0                              ; 66AD   02B0
        MOVR    R2,     R1                      ; 66AE   0091
        SLL     R1,     1                       ; 66AF   0049
        MOVR    R0,     R3                      ; 66B0   0083
        RRC     R0,     2                       ; 66B1   0074
        BOV     L_66B5                          ; 66B2   0202 0001

        NEGR    R2                              ; 66B4   0022
L_66B5:
        MOVR    R3,     R0                      ; 66B5   0098
        RRC     R0,     1                       ; 66B6   0070
        XORR    R3,     R0                      ; 66B7   01D8
        RRC     R0,     1                       ; 66B8   0070
        BNC     L_66BC                          ; 66B9   0209 0001

        NEGR    R1                              ; 66BB   0021
L_66BC:
        PULR    R7                              ; 66BC   02B7

        MVII    #$0002, R2                      ; 66BD   02BA 0002
        INCR    R7                              ; 66BF   000F

        CLRR    R2                              ; 66C0   01D2
L_66C1:
        PSHR    R5                              ; 66C1   0275
        TSTR    R0                              ; 66C2   0080
        BLT     L_6705                          ; 66C3   0205 0040

        MVI     G_0340, R0                      ; 66C5   0280 0340
        TSTR    R0                              ; 66C7   0080
        BNEQ    L_6705                          ; 66C8   020C 003B

        PSHR    R2                              ; 66CA   0272
        MVII    #$0328, R3                      ; 66CB   02BB 0328
        SDBD                                    ; 66CD   0001
        MVII    #$6223, R4                      ; 66CE   02BC 0023 0062

        JSR     R5,     L_5707                  ; 66D1   0004 0154 0307

        MVII    #$0008, R2                      ; 66D4   02BA 0008
        MVO     R2,     G_01A9                  ; 66D6   0242 01A9
L_66D8:
        MVII    #$0100, R5                      ; 66D8   02BD 0100
        SDBD                                    ; 66DA   0001
        MVI@    R5,     R0                      ; 66DB   02A8
        SDBD                                    ; 66DC   0001
        CMPI    #$53C8, R0                      ; 66DD   0378 00C8 0053
        BEQ     L_66D8                          ; 66E0   0224 0009

        DIS                                     ; 66E2   0003
        MVI     G_0330, R2                      ; 66E3   0282 0330
        SUB     G_010A, R2                      ; 66E5   0302 010A
        MVI     G_0328, R1                      ; 66E7   0281 0328
        SUB     G_0106, R1                      ; 66E9   0301 0106
        MVO     R1,     G_0328                  ; 66EB   0241 0328
        MVO     R2,     G_0330                  ; 66ED   0242 0330
        EIS                                     ; 66EF   0002
        PULR    R0                              ; 66F0   02B0
        ADD     G_0185, R0                      ; 66F1   02C0 0185
        MVII    #$0064, R1                      ; 66F3   02B9 0064

        JSR     R5,     L_66A1                  ; 66F5   0004 0164 02A1

        MVII    #$012C, R3                      ; 66F8   02BB 012C

        JSR     R5,     L_5740                  ; 66FA   0004 0154 0340

        MVI     G_0187, R0                      ; 66FD   0280 0187
        TSTR    R0                              ; 66FF   0080
        BNEQ    L_6705                          ; 6700   020C 0003

        JSR     R5,     L_6EEC                  ; 6702   0004 016C 02EC

L_6705:
        PULR    R7                              ; 6705   02B7

        DECLE   $0000,  $000C,  $0080,  $0001   ; 6706   0000 000C 0080 0001
        DECLE   $0007,  $0000,  $0014,  $0067   ; 670A   0007 0000 0014 0067
        DECLE   $0000,  $0000,  $0007,  $0000   ; 670E   0000 0000 0007 0000
        DECLE   $0000,  $0000,  $0049,  $0067   ; 6712   0000 0000 0049 0067
        DECLE   $0019,  $0067,  $0003,  $0000   ; 6716   0019 0067 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0016   ; 671A   0000 0000 0000 0016
        DECLE   $001C,  $000C,  $0016,  $0000   ; 671E   001C 000C 0016 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6722   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6726   0000 0000 0000 0080
        DECLE   $0010,  $0042,  $0076,  $00BE   ; 672A   0010 0042 0076 00BE
        DECLE   $007C,  $003E,  $0074,  $0040   ; 672E   007C 003E 0074 0040
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6732   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 6736   0000 0000 0000 0010
        DECLE   $0009,  $00BB,  $005E,  $00EC   ; 673A   0009 00BB 005E 00EC
        DECLE   $0067,  $00C2,  $0034,  $006E   ; 673E   0067 00C2 0034 006E
        DECLE   $008C,  $0013,  $0044,  $0002   ; 6742   008C 0013 0044 0002
        DECLE   $0000,  $0000,  $0000           ; 6746   0000 0000 0000

        PSHR    R5                              ; 6749   0275
        MOVR    R3,     R2                      ; 674A   009A
        ADDI    #$0345, R2                      ; 674B   02FA 0345
        MVI@    R2,     R1                      ; 674D   0291
        INCR    R1                              ; 674E   0009
        CMPI    #$0003, R1                      ; 674F   0379 0003
        BGE     L_675A                          ; 6751   020D 0007

        MVO@    R1,     R2                      ; 6753   0251
        ADDI    #$0008, R2                      ; 6754   02FA 0008
        ADDI    #$0007, R1                      ; 6756   02F9 0007
        MVO@    R1,     R2                      ; 6758   0251
        PULR    R7                              ; 6759   02B7

L_675A:
        JSR     R5,     L_56DC                  ; 675A   0004 0154 02DC

        CMPI    #$0006, R3                      ; 675D   037B 0006
        BNEQ    L_67C1                          ; 675F   020C 0060

        MVI     G_019F, R0                      ; 6761   0280 019F
        DECR    R0                              ; 6763   0010
        MVO     R0,     G_019F                  ; 6764   0240 019F
        BEQ     L_67C2                          ; 6766   0204 005A

        MVI     G_018F, R0                      ; 6768   0280 018F
        MVI     G_019A, R0                      ; 676A   0280 019A
        SWAP    R0,     2                       ; 676C   0044
        BPL     L_677B                          ; 676D   0203 000C

        MVI     G_0190, R0                      ; 676F   0280 0190
        CMPI    #$0002, R0                      ; 6771   0378 0002
        BLE     L_677B                          ; 6773   0206 0006

        JSR     R5,     L_69A3                  ; 6775   0004 0168 01A3

        J       L_5513                          ; 6778   0004 0354 0113

L_677B:
        MVI     G_017C, R0                      ; 677B   0280 017C
        ADDI    #$0006, R0                      ; 677D   02F8 0006
        ANDI    #$001F, R0                      ; 677F   03B8 001F
        SLL     R0,     1                       ; 6781   0048
        MOVR    R0,     R4                      ; 6782   0084
        NEGR    R0                              ; 6783   0020
        SUBI    #$0028, R4                      ; 6784   033C 0028
        MVII    #$0001, R5                      ; 6786   02BD 0001
L_6788:
        SUBI    #$0007, R0                      ; 6788   0338 0007
        ANDI    #$001F, R0                      ; 678A   03B8 001F
        MVI     G_017B, R1                      ; 678C   0281 017B
        MOVR    R1,     R2                      ; 678E   008A
        ANDI    #$00E0, R1                      ; 678F   03B9 00E0
        ANDI    #$001F, R2                      ; 6791   03BA 001F
        MVII    #$0020, R3                      ; 6793   02BB 0020
        SUBR    R0,     R2                      ; 6795   0102
        BPL     L_679A                          ; 6796   0203 0002

        NEGR    R2                              ; 6798   0022
        NEGR    R3                              ; 6799   0023
L_679A:
        CMPI    #$0006, R2                      ; 679A   037A 0006
        BLT     L_679F                          ; 679C   0205 0001

        ADDR    R3,     R0                      ; 679E   00D8
L_679F:
        ADDR    R0,     R1                      ; 679F   00C1
        DECR    R5                              ; 67A0   0015
        BMI     L_67B0                          ; 67A1   020B 000D

        MVI     G_017B, R3                      ; 67A3   0283 017B
        SUBR    R1,     R3                      ; 67A5   010B
        BPL     L_67A9                          ; 67A6   0203 0001

        NEGR    R3                              ; 67A8   0023
L_67A9:
        CMPI    #$000A, R3                      ; 67A9   037B 000A
        BLT     L_67B0                          ; 67AB   0205 0003

        MOVR    R4,     R0                      ; 67AD   00A0
        B       L_6788                          ; 67AE   0220 0027

L_67B0:
        NEGR    R5                              ; 67B0   0025
        MVO     R5,     G_0185                  ; 67B1   0245 0185
        MVO     R5,     G_0186                  ; 67B3   0245 0186
        MVO     R1,     G_017B                  ; 67B5   0241 017B

        JSR     R5,     L_56D7                  ; 67B7   0004 0154 02D7
        JSR     R5,     L_6A1F                  ; 67BA   0004 0168 021F

        CLRR    R4                              ; 67BD   01E4

        JSR     R5,     L_5534                  ; 67BE   0004 0154 0134

L_67C1:
        PULR    R7                              ; 67C1   02B7

L_67C2:
        JSR     R5,     L_6E98                  ; 67C2   0004 016C 0298

        MVII    #$02DC, R4                      ; 67C5   02BC 02DC
        MVII    #$0014, R0                      ; 67C7   02B8 0014
        CLRR    R1                              ; 67C9   01C9

        JSR     R5,     X_FILL_MEM              ; 67CA   0004 0114 0341

        MVII    #$02E0, R4                      ; 67CD   02BC 02E0

        JSR     R5,     L_6A81                  ; 67CF   0004 0168 0281

        MVII    #$00FF, R0                      ; 67D2   02B8 00FF
        MVO     R0,     G_01AF                  ; 67D4   0240 01AF
        CLRR    R4                              ; 67D6   01E4

        JSR     R5,     L_5534                  ; 67D7   0004 0154 0134

        PULR    R7                              ; 67DA   02B7

        PSHR    R5                              ; 67DB   0275
        MVI     G_01BE, R2                      ; 67DC   0282 01BE
        MVO     R2,     .STIC.BORD              ; 67DE   0242 002C
        MVO     R2,     .STIC.VIDEN             ; 67E0   0242 0020
        CLRR    R1                              ; 67E2   01C9
        SWAP    R2,     2                       ; 67E3   0046
        BMI     L_67E7                          ; 67E4   020B 0001

        DECR    R1                              ; 67E6   0011
L_67E7:
        MVO     R1,     .STIC.EDGE              ; 67E7   0241 0032
        SDBD                                    ; 67E9   0001
        MVII    #$514B, R0                      ; 67EA   02B8 004B 0051

        JSR     R5,     L_5548                  ; 67ED   0004 0154 0148

        PULR    R7                              ; 67F0   02B7

L_67F1:
        PSHR    R5                              ; 67F1   0275
        MVO     R1,     G_01BE                  ; 67F2   0241 01BE
        SDBD                                    ; 67F4   0001
        MVII    #$67DB, R0                      ; 67F5   02B8 00DB 0067

        JSR     R5,     L_553B                  ; 67F8   0004 0154 013B

        SDBD                                    ; 67FB   0001
        CMPI    #$514B, R1                      ; 67FC   0379 004B 0051
        BEQ     L_6804                          ; 67FF   0204 0003

        CLRR    R1                              ; 6801   01C9
        MVO     R1,     G_01BE                  ; 6802   0241 01BE
L_6804:
        PULR    R7                              ; 6804   02B7

L_6805:
        PSHR    R5                              ; 6805   0275
        SDBD                                    ; 6806   0001
        MVII    #$6829, R3                      ; 6807   02BB 0029 0068
        MVII    #$0200, R4                      ; 680A   02BC 0200
        MVII    #$00F0, R0                      ; 680C   02B8 00F0
L_680E:
        MVI@    R3,     R1                      ; 680E   0299
        MOVR    R1,     R2                      ; 680F   008A
        SLR     R2,     2                       ; 6810   0066
        SLR     R2,     2                       ; 6811   0066
        SLR     R2,     1                       ; 6812   0062
        ANDI    #$001F, R1                      ; 6813   03B9 001F
        INCR    R2                              ; 6815   000A
        ADDR    R1,     R1                      ; 6816   00C9
        SDBD                                    ; 6817   0001
        ADDI    #$686F, R1                      ; 6818   02F9 006F 0068
        MOVR    R1,     R5                      ; 681B   008D
        SDBD                                    ; 681C   0001
        MVI@    R5,     R1                      ; 681D   02A9
L_681E:
        MVO@    R1,     R4                      ; 681E   0261
        DECR    R0                              ; 681F   0010
        BEQ     L_6828                          ; 6820   0204 0006

        DECR    R2                              ; 6822   0012
        BNEQ    L_681E                          ; 6823   022C 0006

        INCR    R3                              ; 6825   000B
        B       L_680E                          ; 6826   0220 0019
L_6828:
        PULR    R7                              ; 6828   02B7

        DECLE   $0020,  $0221,  $0020,  $0021   ; 6829   0020 0221 0020 0021
        DECLE   $0066,  $0021,  $0002,  $0003   ; 682D   0066 0021 0002 0003
        DECLE   $0060,  $0004,  $0005           ; 6831   0060 0004 0005

        NEGR    R1                              ; 6834   0021
        NEGR    R0                              ; 6835   0020
        NEGR    R1                              ; 6836   0021
        SLR     R2,     2                       ; 6837   0066
        NEGR    R1                              ; 6838   0021
        SETC                                    ; 6839   0007
        SAR     R0,     1                       ; 683A   0068
        SETC                                    ; 683B   0007
        ADCR    R1                              ; 683C   0029
        NEGR    R1                              ; 683D   0021
        NEGR    R0                              ; 683E   0020
        NEGR    R1                              ; 683F   0021
        SLR     R2,     2                       ; 6840   0066
        NEGR    R1                              ; 6841   0021
        INCR    R2                              ; 6842   000A
        SETC                                    ; 6843   0007
        ADCR    R0                              ; 6844   0028
        SETC                                    ; 6845   0007
        INCR    R3                              ; 6846   000B
        ADCR    R1                              ; 6847   0029
        NEGR    R1                              ; 6848   0021
        NEGR    R0                              ; 6849   0020
        ADDR    R4,     R1                      ; 684A   00E1
        ADCR    R2                              ; 684B   002A
        SAR     R3,     1                       ; 684C   006B
        ADCR    R1                              ; 684D   0029
        NEGR    R1                              ; 684E   0021
        NEGR    R0                              ; 684F   0020
        ADDR    R4,     R1                      ; 6850   00E1
        INCR    R2                              ; 6851   000A
        SETC                                    ; 6852   0007
        ADCR    R4                              ; 6853   002C
        INCR    R5                              ; 6854   000D
        INCR    R3                              ; 6855   000B
        ADCR    R1                              ; 6856   0029
        NEGR    R1                              ; 6857   0021
        INCR    R6                              ; 6858   000E
        INCR    R7                              ; 6859   000F

        ADDR    R6,     R0                      ; 685A   00F0
L_685B:
        INCR    R2                              ; 685B   000A
        SAR     R0,     1                       ; 685C   0068
        INCR    R3                              ; 685D   000B
        ADCR    R1                              ; 685E   0029
        GSWD    R1                              ; 685F   0031
        SUBR    R6,     R0                      ; 6860   0130
        MOVR    R4,     R7                      ; 6861   00A7

        DECLE   $0012,  $0013,  $0031,  $0130   ; 6862   0012 0013 0031 0130
        DECLE   $0014,  $0015,  $00F1,  $0170   ; 6866   0014 0015 00F1 0170
        DECLE   $0014,  $0015,  $00B1,  $03E0   ; 686A   0014 0015 00B1 03E0
        DECLE   $00E0,  $0000,  $0006,  $0000   ; 686E   00E0 0000 0006 0000
        DECLE   $0036,  $000B,  $003E,  $0013   ; 6872   0036 000B 003E 0013
        DECLE   $003E,  $000C,  $000E,  $0014   ; 6876   003E 000C 000E 0014
        DECLE   $000E,  $0058,  $003A,  $0000   ; 687A   000E 0058 003A 0000
        DECLE   $0010,  $00A0,  $0018,  $0000   ; 687E   0010 00A0 0018 0000
        DECLE   $0020,  $00C8,  $0018,  $0058   ; 6882   0020 00C8 0018 0058
        DECLE   $0018,  $00A8,  $0018,  $0050   ; 6886   0018 00A8 0018 0050
        DECLE   $0010,  $0009,  $000E,  $0011   ; 688A   0010 0009 000E 0011
        DECLE   $000E,  $0000,  $0002,  $0000   ; 688E   000E 0000 0002 0000
        DECLE   $0000                           ; 6892   0000

        INCR    R0                              ; 6893   0008
        ADCR    R0                              ; 6894   0028
        DECR    R0                              ; 6895   0010
        ADCR    R0                              ; 6896   0028
        COMR    R1                              ; 6897   0019
        INCR    R0                              ; 6898   0008
        NEGR    R1                              ; 6899   0021
        INCR    R0                              ; 689A   0008
        PSHR    R5                              ; 689B   0275
        MVI     G_01AF, R3                      ; 689C   0283 01AF
        TSTR    R3                              ; 689E   009B
        BEQ     L_68A4                          ; 689F   0204 0003
        J       X_RESET                         ; 68A1   0004 0310 0000

L_68A4:
        TSTR    R0                              ; 68A4   0080
        BNEQ    L_68AC                          ; 68A5   020C 0005

        JSR     R5,     L_69A3                  ; 68A7   0004 0168 01A3

        B       L_6A12                          ; 68AA   0200 0166

L_68AC:
        CMPI    #$000B, R0                      ; 68AC   0378 000B
        BNEQ    L_68E1                          ; 68AE   020C 0031

        MVI     G_0108, R0                      ; 68B0   0280 0108
        TSTR    R0                              ; 68B2   0080
        BNEQ    L_68E1                          ; 68B3   020C 002C

        ADD     G_0198, R0                      ; 68B5   02C0 0198
        BNEQ    L_68E2                          ; 68B7   020C 0029

        JSR     R5,     L_5998                  ; 68B9   0004 0158 0198

        TSTR    R0                              ; 68BC   0080
        BEQ     L_68F0                          ; 68BD   0204 0031

        MVII    #$0001, R1                      ; 68BF   02B9 0001
        MVO     R1,     G_0196                  ; 68C1   0241 0196
L_68C3:
        CLRR    R1                              ; 68C3   01C9
        MVO     R1,     G_01AC                  ; 68C4   0241 01AC

        JSR     R5,     L_6F48                  ; 68C6   0004 016C 0348
        JSR     R5,     L_6907                  ; 68C9   0004 0168 0107

        MVI     G_019E, R1                      ; 68CC   0281 019E
        INCR    R1                              ; 68CE   0009
        MVO     R1,     G_019E                  ; 68CF   0241 019E
        CMPI    #$0004, R1                      ; 68D1   0379 0004
        BNEQ    L_68E1                          ; 68D3   020C 000C

        MVI     G_019D, R1                      ; 68D5   0281 019D
        CMPI    #$0028, R1                      ; 68D7   0379 0028
        BGE     L_68DE                          ; 68D9   020D 0003

        INCR    R1                              ; 68DB   0009
        MVO     R1,     G_019D                  ; 68DC   0241 019D
L_68DE:
        CLRR    R1                              ; 68DE   01C9
        MVO     R1,     G_019E                  ; 68DF   0241 019E
L_68E1:
        PULR    R7                              ; 68E1   02B7

L_68E2:
        JSR     R5,     L_599E                  ; 68E2   0004 0158 019E

        TSTR    R0                              ; 68E5   0080
        BEQ     L_68E1                          ; 68E6   0224 0006

        JSR     R5,     L_6989                  ; 68E8   0004 0168 0189

        CLRR    R1                              ; 68EB   01C9
        MVO     R1,     G_01BC                  ; 68EC   0241 01BC
        B       L_6A12                          ; 68EE   0200 0122

L_68F0:
        MVI     G_01BC, R2                      ; 68F0   0282 01BC
        TSTR    R2                              ; 68F2   0092
        BNEQ    L_68E2                          ; 68F3   022C 0012

        MVII    #$0046, R2                      ; 68F5   02BA 0046
        MVII    #$007E, R3                      ; 68F7   02BB 007E

        JSR     R5,     L_59A2                  ; 68F9   0004 0158 01A2

        TSTR    R0                              ; 68FC   0080
        BEQ     L_68E2                          ; 68FD   0224 001C

        MVII    #$0002, R1                      ; 68FF   02B9 0002
        MVO     R1,     G_0196                  ; 6901   0241 0196
        MVO     R1,     G_01BC                  ; 6903   0241 01BC
        B       L_68C3                          ; 6905   0220 0043

L_6907:
        PSHR    R5                              ; 6907   0275

        JSR     R5,     L_5580                  ; 6908   0004 0154 0180
        DECLE   $03FF                           ; 690B   03FF

        JSR     R5,     L_56D7                  ; 690C   0004 0154 02D7
        JSR     R5,     L_6FDA                  ; 690F   0004 016C 03DA

        CLRR    R3                              ; 6912   01DB
        MVO     R3,     G_01BD                  ; 6913   0243 01BD
        MVII    #$0006, R3                      ; 6915   02BB 0006

        JSR     R5,     L_63EC                  ; 6917   0004 0160 03EC

        MVII    #$0083, R1                      ; 691A   02B9 0083

        JSR     R5,     L_67F1                  ; 691C   0004 0164 03F1
        JSR     R5,     L_6805                  ; 691F   0004 0168 0005

        SDBD                                    ; 6922   0001
        MVII    #$0600, R3                      ; 6923   02BB 0000 0006
        MVII    #$02C9, R4                      ; 6926   02BC 02C9

        JSR     R5,     X_PRINT_R5              ; 6928   0004 0118 007B
        STRING  "COMBINATIONS"                  ; 692B  
        DECLE   $0000                           ; 6937   0000

        MVII    #$02DD, R4                      ; 6938   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 693A   0004 0118 007B
        STRING  "TIME"                          ; 693D   0054 0049 004D 0045
        DECLE   $0000                           ; 6941   0000

        MVII    #$0016, R4                      ; 6942   02BC 0016

        JSR     R5,     L_5534                  ; 6944   0004 0154 0134

        MVO     R2,     G_01B3                  ; 6947   0242 01B3
        MVII    #$0064, R0                      ; 6949   02B8 0064

        JSR     R5,     X_RAND2                 ; 694B   0004 0114 029E

        MVO     R0,     G_01B4                  ; 694E   0240 01B4
        MVI     G_019D, R2                      ; 6950   0282 019D
        SARC    R2,     1                       ; 6952   007A
        BNEQ    L_6956                          ; 6953   020C 0001

        INCR    R2                              ; 6955   000A
L_6956:
        MVII    #$0002, R0                      ; 6956   02B8 0002
        MVI     G_0196, R1                      ; 6958   0281 0196
        CMPI    #$0002, R1                      ; 695A   0379 0002
        BEQ     L_6962                          ; 695C   0204 0004

        JSR     R5,     X_RAND2                 ; 695E   0004 0114 029E

        ADDR    R2,     R0                      ; 6961   00D0
L_6962:
        MVO     R0,     G_0199                  ; 6962   0240 0199
        MVII    #$0002, R1                      ; 6964   02B9 0002
        SDBD                                    ; 6966   0001
        MVII    #$0600, R3                      ; 6967   02BB 0000 0006
        MVII    #$02D6, R4                      ; 696A   02BC 02D6

        JSR     R5,     X_PRNUM_RGT             ; 696C   0004 0118 00C5

        MVII    #$0003, R0                      ; 696F   02B8 0003
        MVI     G_019D, R1                      ; 6971   0281 019D

        JSR     R5,     X_MPY                   ; 6973   0004 011C 01DC

        CMPI    #$001E, R2                      ; 6976   037A 001E
        BGE     L_697C                          ; 6978   020D 0002

        MVII    #$001E, R2                      ; 697A   02BA 001E
L_697C:
        MVO     R2,     G_01A1                  ; 697C   0242 01A1

        JSR     R5,     L_6B0F                  ; 697E   0004 0168 030F
        JSR     R5,     L_6B44                  ; 6981   0004 0168 0344
        JSR     R5,     L_5583                  ; 6984   0004 0154 0183
        DECLE   $0003                           ; 6987   0003

        PULR    R7                              ; 6988   02B7

L_6989:
        PSHR    R5                              ; 6989   0275
        MVI     G_01AD, R1                      ; 698A   0281 01AD

        JSR     R5,     L_6C40                  ; 698C   0004 016C 0040

        CLRR    R0                              ; 698F   01C0
        MVO     R0,     G_01B0                  ; 6990   0240 01B0
        MVO     R0,     G_0198                  ; 6992   0240 0198
        MVO     R0,     G_018F                  ; 6994   0240 018F
        MVO     R0,     G_01A6                  ; 6996   0240 01A6
        MVO     R0,     G_01AD                  ; 6998   0240 01AD
        MVO     R0,     G_01AE                  ; 699A   0240 01AE

        JSR     R5,     L_61CD                  ; 699C   0004 0160 01CD
        JSR     R5,     L_56D7                  ; 699F   0004 0154 02D7

        INCR    R7                              ; 69A2   000F

L_69A3:
        PSHR    R5                              ; 69A3   0275

L_69A4:
        JSR     R5,     .EXEC.A83               ; 69A4   0004 0118 0283
        JSR     R5,     L_5580                  ; 69A7   0004 0154 0180
        DECLE   $03FF                           ; 69AA   03FF

        CLRR    R1                              ; 69AB   01C9

        JSR     R5,     L_67F1                  ; 69AC   0004 0164 03F1

        SDBD                                    ; 69AF   0001
        MVII    #$6AFE, R0                      ; 69B0   02B8 00FE 006A

        JSR     R5,     L_5548                  ; 69B3   0004 0154 0148
        JSR     R5,     L_6A2E                  ; 69B6   0004 0168 022E

        MVII    #$0007, R3                      ; 69B9   02BB 0007
        MVII    #$02B5, R4                      ; 69BB   02BC 02B5

        JSR     R5,     X_PRINT_R5              ; 69BD   0004 0118 007B
        STRING  "COMBINATION"                   ; 69C0  
        DECLE   $0000                           ; 69CB   0000

        MVI     G_01B6, R0                      ; 69CC   0280 01B6
        MVII    #$0002, R1                      ; 69CE   02B9 0002
        MVII    #$02C4, R4                      ; 69D0   02BC 02C4

        JSR     R5,     X_PRNUM_ZRO             ; 69D2   0004 0118 00AD

        MVI     G_01B5, R0                      ; 69D5   0280 01B5
        MVII    #$02C1, R4                      ; 69D7   02BC 02C1

        JSR     R5,     X_PRNUM_ZRO             ; 69D9   0004 0118 00AD

        MVI     G_01BB, R0                      ; 69DC   0280 01BB
        TSTR    R0                              ; 69DE   0080
        BEQ     L_69EA                          ; 69DF   0204 0009

        CMPR    R1,     R0                      ; 69E1   0148
        BLE     L_69E5                          ; 69E2   0206 0001

        INCR    R0                              ; 69E4   0008
L_69E5:
        MVII    #$00FF, R1                      ; 69E5   02B9 00FF

        JSR     R5,     X_FILL_MEM              ; 69E7   0004 0114 0341

L_69EA:
        MVII    #$0067, R1                      ; 69EA   02B9 0067
        MVO     R1,     .BTAB.C3                ; 69EC   0241 02C3
        SDBD                                    ; 69EE   0001
        MVII    #$FFFF, R0                      ; 69EF   02B8 00FF 00FF
L_69F2:
        DECR    R0                              ; 69F2   0010
        BNEQ    L_69F2                          ; 69F3   022C 0002

L_69F5:
        DECR    R0                              ; 69F5   0010
        BNEQ    L_69F5                          ; 69F6   022C 0002
        PULR    R7                              ; 69F8   02B7

L_69F9:
        PSHR    R5                              ; 69F9   0275
L_69FA:
        MVII    #$0001, R0                      ; 69FA   02B8 0001
        MVO     R0,     G_018F                  ; 69FC   0240 018F
        MVO     R0,     G_0198                  ; 69FE   0240 0198
        MVII    #$0065, R0                      ; 6A00   02B8 0065
        MVII    #$007E, R1                      ; 6A02   02B9 007E
        MVO     R0,     G_01B1                  ; 6A04   0240 01B1
        MVO     R1,     G_01B2                  ; 6A06   0241 01B2
        MVII    #$0002, R2                      ; 6A08   02BA 0002
        MVII    #$0002, R3                      ; 6A0A   02BB 0002

        JSR     R5,     L_56DA                  ; 6A0C   0004 0154 02DA

        CLRR    R1                              ; 6A0F   01C9
        MVO     R1,     G_0196                  ; 6A10   0241 0196
L_6A12:
        MVII    #$0000, R1                      ; 6A12   02B9 0000

        JSR     R5,     L_67F1                  ; 6A14   0004 0164 03F1
        JSR     R5,     L_6A1F                  ; 6A17   0004 0168 021F

        CLRR    R4                              ; 6A1A   01E4

        JSR     R5,     L_5534                  ; 6A1B   0004 0154 0134

        PULR    R7                              ; 6A1E   02B7

L_6A1F:
        PSHR    R5                              ; 6A1F   0275

        JSR     R5,     L_6FDA                  ; 6A20   0004 016C 03DA
        JSR     R5,     L_5943                  ; 6A23   0004 0158 0143
        JSR     R5,     L_5550                  ; 6A26   0004 0154 0150
        JSR     R5,     L_5583                  ; 6A29   0004 0154 0183
        DECLE   $03FF                           ; 6A2C   03FF

        PULR    R7                              ; 6A2D   02B7

L_6A2E:
        PSHR    R5                              ; 6A2E   0275

        JSR     R5,     L_6F48                  ; 6A2F   0004 016C 0348

        MVII    #$00F0, R0                      ; 6A32   02B8 00F0
        MVII    #$0200, R4                      ; 6A34   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 6A36   0004 0114 0338

        MVII    #$0007, R3                      ; 6A39   02BB 0007
        MVII    #$027A, R4                      ; 6A3B   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 6A3D   0004 0118 007B
        STRING  "LIVES:"                        ; 6A40  
        DECLE   $0000                           ; 6A46   0000

        MVI     G_019F, R0                      ; 6A47   0280 019F
        MVII    #$0287, R4                      ; 6A49   02BC 0287
        MVII    #$0001, R1                      ; 6A4B   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6A4D   0004 0118 00C5

        MVII    #$0218, R4                      ; 6A50   02BC 0218

        JSR     R5,     X_PRINT_R5              ; 6A52   0004 0118 007B
        STRING  "DESTINATION"                   ; 6A55  
        DECLE   $0000                           ; 6A60   0000

        MVII    #$0005, R3                      ; 6A61   02BB 0005
        SDBD                                    ; 6A63   0001
        MVII    #$6AA0, R1                      ; 6A64   02B9 00A0 006A
        MVI     G_0198, R0                      ; 6A67   0280 0198
        TSTR    R0                              ; 6A69   0080
        BEQ     L_6A70                          ; 6A6A   0204 0004

        SDBD                                    ; 6A6C   0001
        ADDI    #$0008, R1                      ; 6A6D   02F9 0008 0000
L_6A70:
        MVI     G_01BB, R2                      ; 6A70   0282 01BB
        TSTR    R2                              ; 6A72   0092
        BNEQ    L_6A79                          ; 6A73   020C 0004

        SDBD                                    ; 6A75   0001
        MVII    #$6AB0, R1                      ; 6A76   02B9 00B0 006A
L_6A79:
        MVII    #$022D, R4                      ; 6A79   02BC 022D

        JSR     R5,     X_PRINT_R1              ; 6A7B   0004 0118 0067

        MVII    #$0252, R4                      ; 6A7E   02BC 0252
        INCR    R7                              ; 6A80   000F

L_6A81:
        PSHR    R5                              ; 6A81   0275
L_6A82:
        MVII    #$0007, R3                      ; 6A82   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 6A84   0004 0118 007B
        STRING  "SCORE:  "                      ; 6A87  
        DECLE   $0000                           ; 6A8F   0000

        MVI     G_02F1, R0                      ; 6A90   0280 02F1
        MVII    #$0004, R1                      ; 6A92   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 6A94   0004 0118 00C5

        ADDI    #$0004, R4                      ; 6A97   02FC 0004

        JSR     R5,     X_PRINT_R5              ; 6A99   0004 0118 007B
        STRING  "00"                            ; 6A9C   0030 0030
        DECLE   $0000                           ; 6A9E   0000

        PULR    R7                              ; 6A9F   02B7

        DECLE   $0045,  $004D,  $0042,  $0041   ; 6AA0   0045 004D 0042 0041
        DECLE   $0053,  $0053,  $0059,  $0000   ; 6AA4   0053 0053 0059 0000
        DECLE   $0048,  $0049,  $0044,  $0045   ; 6AA8   0048 0049 0044 0045
        DECLE   $004F,  $0055,  $0054,  $0000   ; 6AAC   004F 0055 0054 0000
        DECLE   $0054,  $0052,  $0045,  $0041   ; 6AB0   0054 0052 0045 0041
        DECLE   $0053,  $0055,  $0052,  $0059   ; 6AB4   0053 0055 0052 0059
        DECLE   $0000                           ; 6AB8   0000

        PSHR    R5                              ; 6AB9   0275
        CMPI    #$0002, R0                      ; 6ABA   0378 0002
        BNEQ    L_6AC1                          ; 6ABC   020C 0003

        MVO     R0,     G_01C1                  ; 6ABE   0240 01C1
L_6AC0:
        PULR    R7                              ; 6AC0   02B7

L_6AC1:
        MVI     G_01C1, R1                      ; 6AC1   0281 01C1
        ADDR    R0,     R1                      ; 6AC3   00C1
        CMPI    #$000A, R1                      ; 6AC4   0379 000A
        BNEQ    L_6AD2                          ; 6AC6   020C 000A

        SDBD                                    ; 6AC8   0001
        MVII    #$0B0E, R1                      ; 6AC9   02B9 000E 000B
        MVII    #$025C, R4                      ; 6ACC   02BC 025C
        MVO@    R1,     R4                      ; 6ACE   0261
        ADDI    #$0008, R1                      ; 6ACF   02F9 0008
        MVO@    R1,     R4                      ; 6AD1   0261
L_6AD2:
        CLRR    R1                              ; 6AD2   01C9
        DECR    R1                              ; 6AD3   0011
        MVO     R1,     G_01C1                  ; 6AD4   0241 01C1
        CMPI    #$000B, R0                      ; 6AD6   0378 000B
        BNEQ    L_6ADD                          ; 6AD8   020C 0003
        J       L_6B6C                          ; 6ADA   0004 0368 036C

L_6ADD:
        CMPI    #$000A, R0                      ; 6ADD   0378 000A
        BEQ     L_69FA                          ; 6ADF   0224 00E6

        CMPI    #$0004, R0                      ; 6AE1   0378 0004
        BNEQ    L_6AC0                          ; 6AE3   022C 0024

        MVI     G_0196, R0                      ; 6AE5   0280 0196
        CMPI    #$0002, R0                      ; 6AE7   0378 0002
        BEQ     L_6AC0                          ; 6AE9   0224 002A

        MVI     G_018F, R0                      ; 6AEB   0280 018F
        TSTR    R0                              ; 6AED   0080
        BNEQ    L_6AF5                          ; 6AEE   020C 0005

        INCR    R0                              ; 6AF0   0008
        MVO     R0,     G_018F                  ; 6AF1   0240 018F
        MVO     R0,     G_01B0                  ; 6AF3   0240 01B0
L_6AF5:
        MVII    #$0007, R0                      ; 6AF5   02B8 0007
        MVO     R0,     G_01AC                  ; 6AF7   0240 01AC
        MVO     R0,     G_01A0                  ; 6AF9   0240 01A0
        J       L_6FA0                          ; 6AFB   0004 036C 03A0

        MVO     R1,     .STIC.VIDEN             ; 6AFE   0241 0020
        CLRR    R3                              ; 6B00   01DB
        MVO     R3,     .STIC.BORD              ; 6B01   0243 002C
        SDBD                                    ; 6B03   0001
        MVII    #$F4FF, R0                      ; 6B04   02B8 00FF 00F4
L_6B07:
        AND@    R3,     R0                      ; 6B07   0398
        MVO@    R0,     R3                      ; 6B08   0258
        INCR    R3                              ; 6B09   000B
        CMPI    #$0007, R3                      ; 6B0A   037B 0007
        BLE     L_6B07                          ; 6B0C   0226 0006
        MOVR    R5,     R7                      ; 6B0E   00AF

L_6B0F:
        PSHR    R5                              ; 6B0F   0275
        MVI     G_0196, R0                      ; 6B10   0280 0196
        TSTR    R0                              ; 6B12   0080
        BEQ     L_6B22                          ; 6B13   0204 000D

        MVI     G_01A1, R0                      ; 6B15   0280 01A1
        MVII    #$0003, R1                      ; 6B17   02B9 0003
        SDBD                                    ; 6B19   0001
        MVII    #$0600, R3                      ; 6B1A   02BB 0000 0006
        MVII    #$02E2, R4                      ; 6B1D   02BC 02E2

        JSR     R5,     X_PRNUM_RGT             ; 6B1F   0004 0118 00C5

L_6B22:
        PULR    R7                              ; 6B22   02B7

        PSHR    R5                              ; 6B23   0275
        TSTR    R0                              ; 6B24   0080
        BMI     L_6B30                          ; 6B25   020B 0009

        JSR     R5,     L_6B44                  ; 6B27   0004 0168 0344
        JSR     R5,     L_6B44                  ; 6B2A   0004 0168 0344
        JSR     R5,     L_6B44                  ; 6B2D   0004 0168 0344

L_6B30:
        PULR    R7                              ; 6B30   02B7

        PSHR    R5                              ; 6B31   0275
        TSTR    R0                              ; 6B32   0080
        BMI     L_6B43                          ; 6B33   020B 000E

        MVI     G_01B3, R1                      ; 6B35   0281 01B3
        DECR    R1                              ; 6B37   0011
        MVO     R1,     G_01B3                  ; 6B38   0241 01B3
        BPL     L_6B43                          ; 6B3A   0203 0007

        MVII    #$000A, R1                      ; 6B3C   02B9 000A
        MVO     R1,     G_01B3                  ; 6B3E   0241 01B3

        JSR     R5,     L_6B44                  ; 6B40   0004 0168 0344

L_6B43:
        PULR    R7                              ; 6B43   02B7

L_6B44:
        PSHR    R5                              ; 6B44   0275
        MVI     G_01BD, R0                      ; 6B45   0280 01BD
        INCR    R0                              ; 6B47   0008
        CMPI    #$0064, R0                      ; 6B48   0378 0064
        BLT     L_6B4D                          ; 6B4A   0205 0001

        CLRR    R0                              ; 6B4C   01C0
L_6B4D:
        MVII    #$0207, R3                      ; 6B4D   02BB 0207
        MVO     R0,     G_01BD                  ; 6B4F   0240 01BD
        CMP     G_01B4, R0                      ; 6B51   0340 01B4
        BNEQ    L_6B64                          ; 6B53   020C 000F

        MVI     G_0196, R2                      ; 6B55   0282 0196
        CMPI    #$0002, R2                      ; 6B57   037A 0002
        BEQ     L_6B64                          ; 6B59   0204 0009

        PSHR    R0                              ; 6B5B   0270

        JSR     R5,     L_6F3F                  ; 6B5C   0004 016C 033F

        PULR    R0                              ; 6B5F   02B0
        SDBD                                    ; 6B60   0001
        MVII    #$0407, R3                      ; 6B61   02BB 0007 0004
L_6B64:
        MVII    #$025C, R4                      ; 6B64   02BC 025C
        MVII    #$0002, R1                      ; 6B66   02B9 0002
        J       .EXEC.8C6                       ; 6B68   0004 0318 00C6

        PSHR    R5                              ; 6B6B   0275
L_6B6C:
        MVI     G_0196, R1                      ; 6B6C   0281 0196
        CMPI    #$0002, R1                      ; 6B6E   0379 0002
        BNEQ    L_6B7D                          ; 6B70   020C 000B

        MVII    #$01B7, R1                      ; 6B72   02B9 01B7
        SUB     G_0199, R1                      ; 6B74   0301 0199
        MVI     G_01BD, R0                      ; 6B76   0280 01BD
        CMP@    R1,     R0                      ; 6B78   0348
        BNEQ    L_6BB4                          ; 6B79   020C 0039
        B       L_6B93                          ; 6B7B   0200 0016

L_6B7D:
        MVI     G_01BD, R0                      ; 6B7D   0280 01BD
        CMP     G_01B4, R0                      ; 6B7F   0340 01B4
        BNEQ    L_6BB4                          ; 6B81   020C 0031

        MVII    #$0002, R1                      ; 6B83   02B9 0002
        MVII    #$0207, R3                      ; 6B85   02BB 0207
        MVII    #$025C, R4                      ; 6B87   02BC 025C

        JSR     R5,     X_PRNUM_RGT             ; 6B89   0004 0118 00C5

        MVII    #$0064, R0                      ; 6B8C   02B8 0064

        JSR     R5,     X_RAND2                 ; 6B8E   0004 0114 029E

        MVO     R0,     G_01B4                  ; 6B91   0240 01B4
L_6B93:
        MVI     G_0199, R0                      ; 6B93   0280 0199
        DECR    R0                              ; 6B95   0010
        MVO     R0,     G_0199                  ; 6B96   0240 0199
        PSHR    R0                              ; 6B98   0270
        MVII    #$0002, R1                      ; 6B99   02B9 0002
        SDBD                                    ; 6B9B   0001
        MVII    #$0600, R3                      ; 6B9C   02BB 0000 0006
        MVII    #$02D6, R4                      ; 6B9F   02BC 02D6

        JSR     R5,     X_PRNUM_RGT             ; 6BA1   0004 0118 00C5

        PULR    R0                              ; 6BA4   02B0
        TSTR    R0                              ; 6BA5   0080
        BNEQ    L_6BB4                          ; 6BA6   020C 000C

        MVII    #$0002, R0                      ; 6BA8   02B8 0002
        MVO     R0,     G_01AE                  ; 6BAA   0240 01AE

        JSR     R5,     L_6BB5                  ; 6BAC   0004 0168 03B5

        MVII    #$0005, R1                      ; 6BAF   02B9 0005

        JSR     R5,     L_6C40                  ; 6BB1   0004 016C 0040

L_6BB4:
        PULR    R7                              ; 6BB4   02B7

L_6BB5:
        PSHR    R5                              ; 6BB5   0275

L_6BB6:
        JSR     R5,     L_6FDA                  ; 6BB6   0004 016C 03DA

        MVII    #$0001, R0                      ; 6BB9   02B8 0001
        MVO     R0,     G_0198                  ; 6BBB   0240 0198
        MVII    #$0001, R4                      ; 6BBD   02BC 0001
        MVO     R4,     G_01AC                  ; 6BBF   0244 01AC
        MVII    #$000E, R4                      ; 6BC1   02BC 000E

        JSR     R5,     L_5534                  ; 6BC3   0004 0154 0134
        JSR     R5,     L_6C26                  ; 6BC6   0004 016C 0026
        JSR     R5,     L_6D55                  ; 6BC9   0004 016C 0155
        JSR     R5,     L_56D1                  ; 6BCC   0004 0154 02D1
        DECLE   $0003                           ; 6BCF   0003

        J       L_69FA                          ; 6BD0   0004 0368 01FA

L_6BD3:
        PSHR    R5                              ; 6BD3   0275
L_6BD4:
        PSHR    R2                              ; 6BD4   0272

        JSR     R5,     L_6BE5                  ; 6BD5   0004 0168 03E5

        PULR    R5                              ; 6BD8   02B5
        MOVR    R5,     R4                      ; 6BD9   00AC
        ADDI    #$0345, R5                      ; 6BDA   02FD 0345
        ADDI    #$0173, R4                      ; 6BDC   02FC 0173
        DIS                                     ; 6BDE   0003
        MVO@    R3,     R5                      ; 6BDF   026B
        MVO@    R0,     R5                      ; 6BE0   0268
        MVO@    R1,     R4                      ; 6BE1   0261
        MVO@    R1,     R4                      ; 6BE2   0261
        EIS                                     ; 6BE3   0002
        PULR    R7                              ; 6BE4   02B7

L_6BE5:
        MOVR    R2,     R3                      ; 6BE5   0093
        ADDI    #$017F, R2                      ; 6BE6   02FA 017F
        MVI@    R2,     R1                      ; 6BE8   0291
        SLL     R1,     1                       ; 6BE9   0049
        SDBD                                    ; 6BEA   0001
        ADDI    #$6BFE, R1                      ; 6BEB   02F9 00FE 006B
        MVI@    R1,     R3                      ; 6BEE   028B
        INCR    R1                              ; 6BEF   0009
        MVI@    R1,     R0                      ; 6BF0   0288
        MOVR    R0,     R1                      ; 6BF1   0081
        ANDI    #$0003, R0                      ; 6BF2   03B8 0003
        ANDI    #$0003, R3                      ; 6BF4   03BB 0003
        SARC    R1,     2                       ; 6BF6   007D
        BEQ     L_6BFC                          ; 6BF7   0204 0003

        MVII    #$0004, R1                      ; 6BF9   02B9 0004
        INCR    R7                              ; 6BFB   000F

L_6BFC:
        CLRR    R1                              ; 6BFC   01C9
L_6BFD:
        MOVR    R5,     R7                      ; 6BFD   00AF

        DECLE   $0000,  $0001,  $0005,  $0004   ; 6BFE   0000 0001 0005 0004

        SETC                                    ; 6C02   0007
        CLRC                                    ; 6C03   0006
        EIS                                     ; 6C04   0002
        DIS                                     ; 6C05   0003
L_6C06:
        PSHR    R5                              ; 6C06   0275
        MVI     G_0342, R3                      ; 6C07   0283 0342
        TSTR    R3                              ; 6C09   009B
        BEQ     L_6C25                          ; 6C0A   0204 0019

        MVI     G_017F, R3                      ; 6C0C   0283 017F
        CMPR    R3,     R1                      ; 6C0E   0159
        BEQ     L_6C25                          ; 6C0F   0204 0014

        MOVR    R1,     R0                      ; 6C11   0088
        MVO     R0,     G_0183                  ; 6C12   0240 0183
        MVO     R0,     G_0184                  ; 6C14   0240 0184
        MVI     G_018B, R1                      ; 6C16   0281 018B

        JSR     R5,     L_66A1                  ; 6C18   0004 0164 02A1

        MVII    #$012E, R3                      ; 6C1B   02BB 012E

        JSR     R5,     L_5740                  ; 6C1D   0004 0154 0340

        MVII    #$0004, R2                      ; 6C20   02BA 0004

        JSR     R5,     L_6BD3                  ; 6C22   0004 0168 03D3

L_6C25:
        PULR    R7                              ; 6C25   02B7

L_6C26:
        MVII    #$024A, R2                      ; 6C26   02BA 024A
        CLRR    R1                              ; 6C28   01C9
        MVII    #$0004, R3                      ; 6C29   02BB 0004
L_6C2B:
        MVII    #$0004, R4                      ; 6C2B   02BC 0004
L_6C2D:
        MVO@    R1,     R2                      ; 6C2D   0251
        ADDI    #$0014, R2                      ; 6C2E   02FA 0014
        DECR    R4                              ; 6C30   0014
        BGT     L_6C2D                          ; 6C31   022E 0005

        SDBD                                    ; 6C33   0001
        MVII    #$0400, R0                      ; 6C34   02B8 0000 0004
L_6C37:
        DECR    R0                              ; 6C37   0010
        BNEQ    L_6C37                          ; 6C38   022C 0002

        SUBI    #$0051, R2                      ; 6C3A   033A 0051
        DECR    R3                              ; 6C3C   0013
        BGT     L_6C2B                          ; 6C3D   022E 0013
        MOVR    R5,     R7                      ; 6C3F   00AF

L_6C40:
        ADD     G_02F1, R1                      ; 6C40   02C1 02F1
        BMI     L_6C4A                          ; 6C42   020B 0006

        SDBD                                    ; 6C44   0001
        CMPI    #$270F, R1                      ; 6C45   0379 000F 0027
        BLE     L_6C4B                          ; 6C48   0206 0001

L_6C4A:
        CLRR    R1                              ; 6C4A   01C9
L_6C4B:
        MVO     R1,     G_02F1                  ; 6C4B   0241 02F1
        MOVR    R5,     R7                      ; 6C4D   00AF

L_6C4E:
        PSHR    R5                              ; 6C4E   0275
        MVI     G_018F, R0                      ; 6C4F   0280 018F
        SWAP    R0,     2                       ; 6C51   0044
        BPL     L_6CA2                          ; 6C52   0203 004E

        MVI     G_033F, R0                      ; 6C54   0280 033F
        TSTR    R0                              ; 6C56   0080
        BNEQ    L_6CA2                          ; 6C57   020C 0049

        MVI     G_0342, R0                      ; 6C59   0280 0342
        TSTR    R0                              ; 6C5B   0080
        BEQ     L_6CA2                          ; 6C5C   0204 0044

        MVI     G_0185, R0                      ; 6C5E   0280 0185
        MVI     G_0183, R1                      ; 6C60   0281 0183
        XORR    R1,     R0                      ; 6C62   01C8
        RRC     R0,     1                       ; 6C63   0070
        BC      L_6CA2                          ; 6C64   0201 003C

        MVO     R1,     G_0181                  ; 6C66   0241 0181
        PSHR    R1                              ; 6C68   0271
        MVII    #$0327, R3                      ; 6C69   02BB 0327
        SDBD                                    ; 6C6B   0001
        MVII    #$6CA3, R4                      ; 6C6C   02BC 00A3 006C

        JSR     R5,     L_5707                  ; 6C6F   0004 0154 0307

        MVII    #$0006, R0                      ; 6C72   02B8 0006
        MVO     R0,     G_01A8                  ; 6C74   0240 01A8
        MVII    #$0332, R2                      ; 6C76   02BA 0332
        MVII    #$032F, R3                      ; 6C78   02BB 032F
        MVII    #$007F, R0                      ; 6C7A   02B8 007F
        MOVR    R0,     R1                      ; 6C7C   0081
        COMR    R1                              ; 6C7D   0019
        DIS                                     ; 6C7E   0003
        AND@    R2,     R0                      ; 6C7F   0390
        AND@    R3,     R1                      ; 6C80   0399
        XORR    R0,     R1                      ; 6C81   01C1
        MVO@    R1,     R3                      ; 6C82   0259
        EIS                                     ; 6C83   0002
        MVII    #$032A, R2                      ; 6C84   02BA 032A
        MVII    #$0327, R3                      ; 6C86   02BB 0327
        MVII    #$00FF, R0                      ; 6C88   02B8 00FF
        MOVR    R0,     R1                      ; 6C8A   0081
        COMR    R1                              ; 6C8B   0019
        DIS                                     ; 6C8C   0003
        AND@    R2,     R0                      ; 6C8D   0390
        AND@    R3,     R1                      ; 6C8E   0399
        XORR    R0,     R1                      ; 6C8F   01C1
        XORI    #$0100, R1                      ; 6C90   03F9 0100
        MVO@    R1,     R3                      ; 6C92   0259
        EIS                                     ; 6C93   0002
        PULR    R0                              ; 6C94   02B0
        MVII    #$0064, R1                      ; 6C95   02B9 0064

        JSR     R5,     L_66A1                  ; 6C97   0004 0164 02A1

        MVII    #$012A, R3                      ; 6C9A   02BB 012A

        JSR     R5,     L_5740                  ; 6C9C   0004 0154 0340
        JSR     R5,     L_6EEC                  ; 6C9F   0004 016C 02EC

L_6CA2:
        PULR    R7                              ; 6CA2   02B7

        DECLE   $0000,  $0088,  $0000,  $0080   ; 6CA3   0000 0088 0000 0080
        DECLE   $0000,  $0020,  $00B1,  $006C   ; 6CA7   0000 0020 00B1 006C
        DECLE   $0000,  $0000,  $0014,  $0000   ; 6CAB   0000 0000 0014 0000
        DECLE   $0000,  $0001,  $00DC,  $0056   ; 6CAF   0000 0001 00DC 0056
        DECLE   $0093,  $0062,  $0001           ; 6CB3   0093 0062 0001

        ADD     G_0062, R0                      ; 6CB6   02C0 0062
        SLR     R0,     2                       ; 6CB8   0064
        SLR     R2,     1                       ; 6CB9   0062
        SLR     R0,     2                       ; 6CBA   0064
        MOVR    R7,     R5                      ; 6CBB   00BD
        SAR     R0,     2                       ; 6CBC   006C
        MVII    #$0002, R3                      ; 6CBD   02BB 0002
        J       L_56DC                          ; 6CBF   0004 0354 02DC

        PSHR    R5                              ; 6CC2   0275
        MVI     G_0342, R2                      ; 6CC3   0282 0342
        TSTR    R2                              ; 6CC5   0092
        BEQ     L_6D03                          ; 6CC6   0204 003B

        JSR     R5,     L_6FC6                  ; 6CC8   0004 016C 03C6

        SDBD                                    ; 6CCB   0001
        CMPI    #$514B, R0                      ; 6CCC   0378 004B 0051
        BNEQ    L_6D03                          ; 6CCF   020C 0032

        SUBI    #$0013, R2                      ; 6CD1   033A 0013
        MVI     G_01A5, R0                      ; 6CD3   0280 01A5

        JSR     R5,     X_EXT_SIGN_LO           ; 6CD5   0004 0114 0268

        PSHR    R0                              ; 6CD8   0270
        TSTR    R0                              ; 6CD9   0080
        BEQ     L_6CFC                          ; 6CDA   0204 0020
        BMI     L_6CE0                          ; 6CDC   020B 0002

        ADDI    #$0026, R2                      ; 6CDE   02FA 0026
L_6CE0:
        MVO     R2,     G_01A3                  ; 6CE0   0242 01A3

        JSR     R5,     L_6D47                  ; 6CE2   0004 016C 0147

        MVII    #$01A3, R2                      ; 6CE5   02BA 01A3
        MVII    #$0331, R1                      ; 6CE7   02B9 0331
        MVI     G_0183, R3                      ; 6CE9   0283 0183
        ANDI    #$0001, R3                      ; 6CEB   03BB 0001
        CLRR    R0                              ; 6CED   01C0

        JSR     R5,     L_62D9                  ; 6CEE   0004 0160 02D9

        TSTR    R0                              ; 6CF1   0080
        BNEQ    L_6CFC                          ; 6CF2   020C 0008

        PULR    R2                              ; 6CF4   02B2
        MVII    #$0004, R3                      ; 6CF5   02BB 0004

        JSR     R5,     L_6FED                  ; 6CF7   0004 016C 03ED

        B       L_6D05                          ; 6CFA   0200 0009

L_6CFC:
        PULR    R1                              ; 6CFC   02B1
        CLRR    R1                              ; 6CFD   01C9
        MVO     R1,     G_01A5                  ; 6CFE   0241 01A5

        JSR     R5,     L_6D47                  ; 6D00   0004 016C 0147

L_6D03:
        PULR    R7                              ; 6D03   02B7

        PSHR    R5                              ; 6D04   0275
L_6D05:
        MVI     G_018B, R1                      ; 6D05   0281 018B

        JSR     R5,     L_66A1                  ; 6D07   0004 0164 02A1

        SARC    R1,     2                       ; 6D0A   007D
        SARC    R2,     2                       ; 6D0B   007E
        MVI     G_012E, R3                      ; 6D0C   0283 012E
        MVI     G_013E, R4                      ; 6D0E   0284 013E
        ADDR    R3,     R1                      ; 6D10   00D9
        ADDR    R4,     R2                      ; 6D11   00E2
        MVO     R1,     G_012E                  ; 6D12   0241 012E
        MVO     R2,     G_013E                  ; 6D14   0242 013E
        PULR    R7                              ; 6D16   02B7

L_6D17:
        PSHR    R5                              ; 6D17   0275

        JSR     R5,     L_6FC6                  ; 6D18   0004 016C 03C6

        MOVR    R2,     R5                      ; 6D1B   0095
        MOVR    R4,     R2                      ; 6D1C   00A2
        MOVR    R5,     R4                      ; 6D1D   00AC
        SDBD                                    ; 6D1E   0001
        CMPI    #$53C8, R0                      ; 6D1F   0378 00C8 0053
        BEQ     L_6D45                          ; 6D22   0204 0021

        MVII    #$00FF, R0                      ; 6D24   02B8 00FF
        ANDR    R0,     R1                      ; 6D26   0181
        ANDR    R0,     R4                      ; 6D27   0184
        SLR     R0,     1                       ; 6D28   0060
        ANDR    R0,     R3                      ; 6D29   0183
        ANDR    R0,     R2                      ; 6D2A   0182
        MVI     G_0183, R0                      ; 6D2B   0280 0183
        XOR     G_0185, R0                      ; 6D2D   03C0 0185
        RRC     R0,     1                       ; 6D2F   0070
        BC      L_6D45                          ; 6D30   0201 0013

        SLL     R3,     1                       ; 6D32   004B
        SLL     R2,     1                       ; 6D33   004A
        MVI     G_0183, R0                      ; 6D34   0280 0183
        RRC     R0,     1                       ; 6D36   0070
        BNC     L_6D3B                          ; 6D37   0209 0002

        NEGR    R3                              ; 6D39   0023
        NEGR    R2                              ; 6D3A   0022
L_6D3B:
        ADDR    R1,     R3                      ; 6D3B   00CB
        ADDR    R2,     R4                      ; 6D3C   00D4
        CLRR    R1                              ; 6D3D   01C9
        CMPR    R3,     R4                      ; 6D3E   015C
        BLT     L_6D43                          ; 6D3F   0205 0002

        DECR    R1                              ; 6D41   0011
        INCR    R7                              ; 6D42   000F

L_6D43:
        INCR    R1                              ; 6D43   0009
L_6D44:
        PULR    R7                              ; 6D44   02B7

L_6D45:
        CLRR    R1                              ; 6D45   01C9
        PULR    R7                              ; 6D46   02B7

L_6D47:
        PSHR    R5                              ; 6D47   0275
        MVI     G_0183, R0                      ; 6D48   0280 0183
        MVI     G_018B, R1                      ; 6D4A   0281 018B

        JSR     R5,     L_66A1                  ; 6D4C   0004 0164 02A1

        MVII    #$012E, R3                      ; 6D4F   02BB 012E

        JSR     R5,     L_5740                  ; 6D51   0004 0154 0340

        PULR    R7                              ; 6D54   02B7

L_6D55:
        PSHR    R5                              ; 6D55   0275
        MVI     G_0196, R0                      ; 6D56   0280 0196
        CMPI    #$0002, R0                      ; 6D58   0378 0002
        BEQ     L_6DC7                          ; 6D5A   0204 006B

        MVII    #$0327, R3                      ; 6D5C   02BB 0327
        SDBD                                    ; 6D5E   0001
        MVII    #$6E06, R4                      ; 6D5F   02BC 0006 006E

        JSR     R5,     L_5707                  ; 6D62   0004 0154 0307

        SDBD                                    ; 6D65   0001
        MVII    #$6E06, R4                      ; 6D66   02BC 0006 006E

        JSR     R5,     L_5707                  ; 6D69   0004 0154 0307

        MVII    #$0040, R0                      ; 6D6C   02B8 0040
        SWAP    R0,     1                       ; 6D6E   0040
        MOVR    R0,     R1                      ; 6D6F   0081
        ADD     G_0328, R0                      ; 6D70   02C0 0328
        MVO     R0,     G_0328                  ; 6D72   0240 0328
        ADD     G_0330, R1                      ; 6D74   02C1 0330
        MVO     R1,     G_0330                  ; 6D76   0241 0330
        MVII    #$0002, R0                      ; 6D78   02B8 0002

        JSR     R5,     X_RAND1                 ; 6D7A   0004 0114 027D

        PSHR    R0                              ; 6D7D   0270
        SLL     R0,     1                       ; 6D7E   0048
        PSHR    R0                              ; 6D7F   0270
        SDBD                                    ; 6D80   0001
        MVII    #$6DBF, R4                      ; 6D81   02BC 00BF 006D
        ADDR    R0,     R4                      ; 6D84   00C4
        MVI@    R4,     R1                      ; 6D85   02A1
        ADD     G_012C, R1                      ; 6D86   02C1 012C
        MVO     R1,     G_012C                  ; 6D88   0241 012C
        MVI@    R4,     R1                      ; 6D8A   02A1
        MVII    #$0337, R3                      ; 6D8B   02BB 0337
        MOVR    R1,     R2                      ; 6D8D   008A
L_6D8E:
        ANDI    #$000F, R1                      ; 6D8E   03B9 000F
        RRC     R1,     1                       ; 6D90   0071
        BNC     L_6D97                          ; 6D91   0209 0004

        SDBD                                    ; 6D93   0001
        ADDI    #$1000, R1                      ; 6D94   02F9 0000 0010
L_6D97:
        ADD@    R3,     R1                      ; 6D97   02D9
        MVO@    R1,     R3                      ; 6D98   0259
        MOVR    R2,     R1                      ; 6D99   0091
        SLR     R1,     2                       ; 6D9A   0065
        SLR     R1,     2                       ; 6D9B   0065
        INCR    R3                              ; 6D9C   000B
        CMPI    #$0338, R3                      ; 6D9D   037B 0338
        BEQ     L_6D8E                          ; 6D9F   0224 0012

        MVII    #$0347, R4                      ; 6DA1   02BC 0347
        PULR    R0                              ; 6DA3   02B0
        MVO@    R0,     R4                      ; 6DA4   0260
        INCR    R0                              ; 6DA5   0008
        MVO@    R0,     R4                      ; 6DA6   0260
        PULR    R0                              ; 6DA7   02B0
        ADDI    #$0002, R0                      ; 6DA8   02F8 0002
        MVO     R0,     G_01AD                  ; 6DAA   0240 01AD
        MVI     G_01AE, R1                      ; 6DAC   0281 01AE
        CMPI    #$0002, R1                      ; 6DAE   0379 0002
        BNEQ    L_6DBE                          ; 6DB0   020C 000C

        MVI     G_01BB, R1                      ; 6DB2   0281 01BB
        DECR    R1                              ; 6DB4   0011
        BMI     L_6DBE                          ; 6DB5   020B 0007

        MVO     R1,     G_01BB                  ; 6DB7   0241 01BB
        ADDI    #$01B7, R1                      ; 6DB9   02F9 01B7
        MVI@    R1,     R0                      ; 6DBB   0288
        MVO     R0,     .BTAB.47                ; 6DBC   0240 0247
L_6DBE:
        PULR    R7                              ; 6DBE   02B7

        DECLE   $0006,  $00C3,  $0008,  $0011   ; 6DBF   0006 00C3 0008 0011
        DECLE   $0000                           ; 6DC3   0000

        COMR    R1                              ; 6DC4   0019
        INCR    R0                              ; 6DC5   0008
        GSWD    R3                              ; 6DC6   0033
L_6DC7:
        SDBD                                    ; 6DC7   0001
        MVII    #$6E01, R4                      ; 6DC8   02BC 0001 006E
        SDBD                                    ; 6DCB   0001
        MVII    #$08C6, R1                      ; 6DCC   02B9 00C6 0008
L_6DCF:
        MVI@    R4,     R3                      ; 6DCF   02A3
        MVO@    R1,     R3                      ; 6DD0   0259
        CMPI    #$0272, R3                      ; 6DD1   037B 0272
        BNEQ    L_6DCF                          ; 6DD3   022C 0005

        MVI     G_019F, R0                      ; 6DD5   0280 019F
        INCR    R0                              ; 6DD7   0008
        MVO     R0,     G_019F                  ; 6DD8   0240 019F
        MVII    #$000A, R0                      ; 6DDA   02B8 000A
        MVO     R0,     G_01AD                  ; 6DDC   0240 01AD
        INCR    R7                              ; 6DDE   000F

L_6DDF:
        PSHR    R5                              ; 6DDF   0275
L_6DE0:
        MVII    #$0004, R0                      ; 6DE0   02B8 0004
        MVO     R0,     G_01BB                  ; 6DE2   0240 01BB
        MVII    #$0064, R0                      ; 6DE4   02B8 0064

        JSR     R5,     X_RAND2                 ; 6DE6   0004 0114 029E

        MVO     R0,     G_01B5                  ; 6DE9   0240 01B5
        MVII    #$0002, R1                      ; 6DEB   02B9 0002
        MVII    #$0007, R3                      ; 6DED   02BB 0007
        MVII    #$01B7, R4                      ; 6DEF   02BC 01B7

        JSR     R5,     X_PRNUM_ZRO             ; 6DF1   0004 0118 00AD

        MVII    #$0064, R0                      ; 6DF4   02B8 0064

        JSR     R5,     X_RAND2                 ; 6DF6   0004 0114 029E

        MVO     R0,     G_01B6                  ; 6DF9   0240 01B6
        MVII    #$01B9, R4                      ; 6DFB   02BC 01B9

        JSR     R5,     X_PRNUM_ZRO             ; 6DFD   0004 0118 00AD

        PULR    R7                              ; 6E00   02B7

        DECLE   $0284,  $0285,  $0286,  $0271   ; 6E01   0284 0285 0286 0271
        DECLE   $0272,  $0068,  $0008,  $00B0   ; 6E05   0272 0068 0008 00B0
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6E09   0000 0000 0000 0012
        DECLE   $006E,  $0000,  $0000,  $0000   ; 6E0D   006E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6E11   0000 0000 0000 0018
        DECLE   $006E,  $0008,  $0000,  $007F   ; 6E15   006E 0008 0000 007F
        DECLE   $0079,  $0079,  $007F,  $0055   ; 6E19   0079 0079 007F 0055
        DECLE   $007F,  $0069,  $004D,  $0069   ; 6E1D   007F 0069 004D 0069
        DECLE   $006D,  $0069,  $007F,  $0055   ; 6E21   006D 0069 007F 0055
        DECLE   $007F,  $0000,  $0000,  $0000   ; 6E25   007F 0000 0000 0000
        DECLE   $0020,  $0090,  $0050,  $0020   ; 6E29   0020 0090 0050 0020
        DECLE   $0018,  $0028,  $0038,  $003C   ; 6E2D   0018 0028 0038 003C
        DECLE   $000C,  $0006,  $0003,  $0001   ; 6E31   000C 0006 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E35   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $003F,  $007F   ; 6E39   0000 0007 003F 007F
        DECLE   $0080,  $00BF,  $00B0,  $00E3   ; 6E3D   0080 00BF 00B0 00E3
        DECLE   $00E6,  $00E6,  $00E3,  $00A8   ; 6E41   00E6 00E6 00E3 00A8
        DECLE   $00BF,  $0080,  $00FF,  $001F   ; 6E45   00BF 0080 00FF 001F
        DECLE   $001B,  $0095,  $00FB,  $00FF   ; 6E49   001B 0095 00FB 00FF
        DECLE   $0004,  $00F4,  $0057,  $001D   ; 6E4D   0004 00F4 0057 001D
        DECLE   $009C,  $009C,  $001C,  $0034   ; 6E51   009C 009C 001C 0034
        DECLE   $00F4,  $0004,  $00FC,  $0000   ; 6E55   00F4 0004 00FC 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6E59   0000 0000 0000 0038
        DECLE   $0038,  $0018,  $0038,  $0038   ; 6E5D   0038 0018 0038 0038
        DECLE   $0018,  $0038,  $0038,  $0018   ; 6E61   0018 0038 0038 0018
        DECLE   $0038,  $0038,  $0010,  $000A   ; 6E65   0038 0038 0010 000A
        DECLE   $0001,  $007C,  $0038,  $0039   ; 6E69   0001 007C 0038 0039
        DECLE   $0038,  $0038,  $003A,  $0038   ; 6E6D   0038 0038 003A 0038
        DECLE   $0038,  $0039,  $0038,  $0038   ; 6E71   0038 0039 0038 0038
        DECLE   $0038,  $0038,  $0010,  $0007   ; 6E75   0038 0038 0010 0007
        DECLE   $0008,  $0012,  $0012,  $0018   ; 6E79   0008 0012 0012 0018
        DECLE   $001F,  $003F,  $0043,  $0099   ; 6E7D   001F 003F 0043 0099
        DECLE   $0099,  $0043,  $00BD,  $0043   ; 6E81   0099 0043 00BD 0043
        DECLE   $007E,  $003C,  $0000           ; 6E85   007E 003C 0000

        ADDR    R0,     R0                      ; 6E88   00C0
        RSWD    R4                              ; 6E89   003C
        SWAP    R2,     1                       ; 6E8A   0042
        MOVR    R3,     R1                      ; 6E8B   0099
        COMR    R1                              ; 6E8C   0019
        SWAP    R2,     1                       ; 6E8D   0042
        MOVR    R7,     R5                      ; 6E8E   00BD
        ADDR    R0,     R3                      ; 6E8F   00C3
        SARC    R2,     2                       ; 6E90   007E
        RSWD    R5                              ; 6E91   003D
        INCR    R2                              ; 6E92   000A
        DECR    R4                              ; 6E93   0014
        ADCR    R0                              ; 6E94   0028
        GSWD    R0                              ; 6E95   0030
        NEGR    R0                              ; 6E96   0020
        RSWD    R0                              ; 6E97   0038
L_6E98:
        PSHR    R5                              ; 6E98   0275

        JSR     R5,     L_6F83                  ; 6E99   0004 016C 0383
        JSR     R5,     L_56D7                  ; 6E9C   0004 0154 02D7
        JSR     R5,     L_5580                  ; 6E9F   0004 0154 0180
        DECLE   $03FF                           ; 6EA2   03FF

        JSR     R5,     L_6FDA                  ; 6EA3   0004 016C 03DA

        CLRR    R1                              ; 6EA6   01C9
        MVO     R1,     G_018A                  ; 6EA7   0241 018A

        JSR     R5,     L_6692                  ; 6EA9   0004 0164 0292

        MVII    #$0080, R1                      ; 6EAC   02B9 0080

        JSR     R5,     L_67F1                  ; 6EAE   0004 0164 03F1

        MVII    #$0014, R0                      ; 6EB1   02B8 0014
        MVII    #$0007, R1                      ; 6EB3   02B9 0007
        MVII    #$0200, R4                      ; 6EB5   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 6EB7   0004 0114 0341

        MVII    #$0007, R3                      ; 6EBA   02BB 0007
        MVII    #$0206, R4                      ; 6EBC   02BC 0206

        JSR     R5,     X_PRINT_R5              ; 6EBE   0004 0118 007B
        STRING  "GAME OVER"                     ; 6EC1  
        DECLE   $0000                           ; 6ECA   0000

        MVII    #$0217, R1                      ; 6ECB   02B9 0217
        MVII    #$0006, R4                      ; 6ECD   02BC 0006
        PSHR    R1                              ; 6ECF   0271
        SDBD                                    ; 6ED0   0001
        MVII    #$0857, R3                      ; 6ED1   02BB 0057 0008
L_6ED4:
        MVII    #$000B, R2                      ; 6ED4   02BA 000B
L_6ED6:
        MVO@    R3,     R1                      ; 6ED6   024B
        ADDI    #$0014, R1                      ; 6ED7   02F9 0014
        DECR    R2                              ; 6ED9   0012
        BNEQ    L_6ED6                          ; 6EDA   022C 0005

        PULR    R1                              ; 6EDC   02B1
        ADDI    #$0003, R1                      ; 6EDD   02F9 0003
        PSHR    R1                              ; 6EDF   0271
        SDBD                                    ; 6EE0   0001
        MVII    #$0400, R0                      ; 6EE1   02B8 0000 0004
L_6EE4:
        DECR    R0                              ; 6EE4   0010
        BNEQ    L_6EE4                          ; 6EE5   022C 0002

        DECR    R4                              ; 6EE7   0014
        BNEQ    L_6ED4                          ; 6EE8   022C 0015

        PULR    R1                              ; 6EEA   02B1
        PULR    R7                              ; 6EEB   02B7

L_6EEC:
        PSHR    R5                              ; 6EEC   0275

        JSR     R5,     .EXEC.A83               ; 6EED   0004 0118 0283

        MVII    #$0037, R0                      ; 6EF0   02B8 0037
        MVO     R0,     .PSG0.chan_enable       ; 6EF2   0240 01F8
        MVII    #$000F, R0                      ; 6EF4   02B8 000F
        MVO     R0,     .PSG0.noise             ; 6EF6   0240 01F9
        MVII    #$003C, R0                      ; 6EF8   02B8 003C
        MVO     R0,     G_0155                  ; 6EFA   0240 0155
        MVII    #$0030, R0                      ; 6EFC   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 6EFE   0240 01FB
        MVO     R0,     .PSG0.envlp_hi          ; 6F00   0240 01F7
        CLRR    R0                              ; 6F02   01C0
        MVO     R0,     .PSG0.envelope          ; 6F03   0240 01FA
        B       L_6FB7                          ; 6F05   0200 00B0

L_6F07:
        PSHR    R5                              ; 6F07   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F08   0004 0118 03BE
        DECLE   $0090                           ; 6F0B  SFX prio
        DECLE   $0359                           ; 6F0C  SFX data
        DECLE   $003D                           ; 6F0D  SFX data
        DECLE   $015D                           ; 6F0E  SFX data
        DECLE   $0108,  $01C0                   ; 6F0F  SFX data
        DECLE   $0001,  $03E2                   ; 6F11  SFX data
        DECLE   $0077,  $0024,  $006F           ; 6F13  SFX data
        DECLE   $0063,  $03ED                   ; 6F16  SFX data
        DECLE   $0001,  $000A                   ; 6F18  SFX data
        DECLE   $0077,  $0031,  $006F           ; 6F1A  SFX data
        DECLE   $0183,  $03ED                   ; 6F1D  SFX data
        DECLE   $0023,  $03BA                   ; 6F1F  SFX data
        DECLE   $0077,  $00BE,  $006F           ; 6F21  SFX data
UC_6F24:
        MVI     .PSG0.chn_b_vol,R0              ; 6F24  SLIB UCALL target
        ANDI    #$000F, R0                      ; 6F26   03B8 000F
        CMPI    #$000E, R0                      ; 6F28   0378 000E
        BLT     L_6F2E                          ; 6F2A   0205 0002

        ADDI    #$0002, R4                      ; 6F2C   02FC 0002
L_6F2E:
        INCR    R0                              ; 6F2E   0008
        B       L_6F3C                          ; 6F2F   0200 000B

UC_6F31:
        MVI     .PSG0.chn_b_vol,R0              ; 6F31  SLIB UCALL target
        ANDI    #$000F, R0                      ; 6F33   03B8 000F
        CMPI    #$0004, R0                      ; 6F35   0378 0004
        BGT     L_6F3B                          ; 6F37   020E 0002

        ADDI    #$0002, R4                      ; 6F39   02FC 0002
L_6F3B:
        DECR    R0                              ; 6F3B   0010
L_6F3C:
        MVO     R0,     .PSG0.chn_b_vol         ; 6F3C   0240 01FC
        PULR    R7                              ; 6F3E   02B7

L_6F3F:
        PSHR    R5                              ; 6F3F   0275

        JSR     R5,     X_PLAY_SFX1             ; 6F40   0004 0118 03BB
        DECLE   $03E9                           ; 6F43  SFX data
        DECLE   $03C0,  $003F                   ; 6F44  SFX data
        DECLE   $022B                           ; 6F46  SFX data
        DECLE   $02CF                           ; 6F47  SFX end

L_6F48:
        PSHR    R5                              ; 6F48   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F49   0004 0118 03BE
        DECLE   $00FF                           ; 6F4C  SFX prio

        ADD@    R1,     R7                      ; 6F4D   02CF

L_6F4E:
        PSHR    R5                              ; 6F4E   0275
L_6F4F:
        MVI     G_033F, R0                      ; 6F4F   0280 033F
        ADD     G_0340, R0                      ; 6F51   02C0 0340
        BEQ     L_6F56                          ; 6F53   0204 0001
        PULR    R7                              ; 6F55   02B7

L_6F56:
        MVII    #$0005, R0                      ; 6F56   02B8 0005

        JSR     R5,     X_PLAY_SFX1             ; 6F58   0004 0118 03BB
        DECLE   $0389                           ; 6F5B  SFX data
        DECLE   $0240,  $00D0                   ; 6F5C  SFX data
        DECLE   $0248,  $00A8                   ; 6F5E  SFX data
        DECLE   $0244,  $00C0                   ; 6F60  SFX data
        DECLE   $021B                           ; 6F62  SFX data
        DECLE   $0023,  $03DC                   ; 6F63  SFX data
        DECLE   $03B7                           ; 6F65  SFX data
        DECLE   $000C,  $0100                   ; 6F66  SFX data
        DECLE   $000B                           ; 6F68  SFX data
        DECLE   $0077,  $00BE,  $006F           ; 6F69  SFX data
        DECLE   $02CF                           ; 6F6C  SFX end

L_6F6D:
        PSHR    R5                              ; 6F6D   0275
        MVI     G_033F, R0                      ; 6F6E   0280 033F
        ADD     G_0340, R0                      ; 6F70   02C0 0340
        BEQ     L_6F75                          ; 6F72   0204 0001
        PULR    R7                              ; 6F74   02B7

L_6F75:
        JSR     R5,     X_PLAY_SFX1             ; 6F75   0004 0118 03BB
        DECLE   $0359                           ; 6F78  SFX data
        DECLE   $0378,  $03FF                   ; 6F79  SFX data
        DECLE   $0001,  $0382                   ; 6F7B  SFX data
        DECLE   $008F,  $0050                   ; 6F7D  SFX data
        DECLE   $0077,  $00BE,  $006F           ; 6F7F  SFX data
        DECLE   $02CF                           ; 6F82  SFX end

L_6F83:
        PSHR    R5                              ; 6F83   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F84   0004 0118 03BE
        DECLE   $0097                           ; 6F87  SFX prio
        DECLE   $0079,  $03ED,  $010B,  $010C   ; 6F88   0079 03ED 010B 010C
        DECLE   $0000,  $03B7                   ; 6F8C   0000 03B7

        MOVR    R1,     R7                      ; 6F8E   008F

        DECLE   $001D,  $0209,  $016D,  $0040   ; 6F8F   001D 0209 016D 0040
        DECLE   $0050,  $0048,  $0050,  $0044   ; 6F93   0050 0048 0050 0044
        DECLE   $0050,  $000B,  $004C,  $0000   ; 6F97   0050 000B 004C 0000
        DECLE   $03B7                           ; 6F9B   03B7

        MOVR    R1,     R7                      ; 6F9C   008F

        SLR     R0,     2                       ; 6F9D   0064
        ADD@    R1,     R7                      ; 6F9E   02CF

L_6F9F:
        PSHR    R5                              ; 6F9F   0275

L_6FA0:
        JSR     R5,     X_PLAY_SFX2             ; 6FA0   0004 0118 03BE
        DECLE   $0095                           ; 6FA3  SFX prio
        DECLE   $0079,  $03B7,  $000B,  $03ED   ; 6FA4   0079 03B7 000B 03ED
        DECLE   $00CC,  $0000                   ; 6FA8   00CC 0000

        MOVR    R1,     R7                      ; 6FAA   008F

        SLR     R0,     2                       ; 6FAB   0064
        ADD@    R1,     R7                      ; 6FAC   02CF

L_6FAD:
        PSHR    R5                              ; 6FAD   0275
        MVI     G_033F, R2                      ; 6FAE   0282 033F
        ADD     G_0340, R2                      ; 6FB0   02C2 0340
        BNEQ    L_6FC5                          ; 6FB2   020C 0011

        JSR     R5,     .EXEC.A83               ; 6FB4   0004 0118 0283
L_6FB7:
        JSR     R5,     X_PLAY_SFX1             ; 6FB7   0004 0118 03BB
        DECLE   $0339                           ; 6FBA  SFX data
        DECLE   $0264,  $0200                   ; 6FBB  SFX data
        DECLE   $03CF                           ; 6FBD  SFX end

UC_6FBE:
        JSR     R5,     .EXEC.A83               ; 6FBE  SLIB UCALL target

        SDBD                                    ; 6FC1   0001
        MVII    #$6FBA, R4                      ; 6FC2   02BC 00BA 006F
L_6FC5:
        PULR    R7                              ; 6FC5   02B7

L_6FC6:
        PSHR    R5                              ; 6FC6   0275
        MVII    #$0100, R5                      ; 6FC7   02BD 0100
        MVII    #$032B, R1                      ; 6FC9   02B9 032B
        MVII    #$0329, R2                      ; 6FCB   02BA 0329
        MVII    #$0333, R3                      ; 6FCD   02BB 0333
        MVII    #$0331, R4                      ; 6FCF   02BC 0331
        DIS                                     ; 6FD1   0003
        SDBD                                    ; 6FD2   0001
        MVI@    R5,     R0                      ; 6FD3   02A8
        MVI@    R1,     R1                      ; 6FD4   0289
        MVI@    R2,     R2                      ; 6FD5   0292
        MVI@    R3,     R3                      ; 6FD6   029B
        MVI@    R4,     R4                      ; 6FD7   02A4
        EIS                                     ; 6FD8   0002
        PULR    R7                              ; 6FD9   02B7

L_6FDA:
        CLRR    R0                              ; 6FDA   01C0
        MVO     R0,     G_0106                  ; 6FDB   0240 0106
        MVO     R0,     G_010A                  ; 6FDD   0240 010A
        MOVR    R5,     R7                      ; 6FDF   00AF

L_6FE0:
        MVI     G_017B, R0                      ; 6FE0   0280 017B
        ADDI    #$000A, R0                      ; 6FE2   02F8 000A
        ANDI    #$00FF, R0                      ; 6FE4   03B8 00FF
        MVI     G_017C, R1                      ; 6FE6   0281 017C
        ADDI    #$0006, R1                      ; 6FE8   02F9 0006
        ANDI    #$00FF, R1                      ; 6FEA   03B9 00FF
        MOVR    R5,     R7                      ; 6FEC   00AF

L_6FED:
        MOVR    R3,     R4                      ; 6FED   009C
        MVII    #$0001, R0                      ; 6FEE   02B8 0001
        ADDI    #$017F, R4                      ; 6FF0   02FC 017F
        MVI@    R4,     R1                      ; 6FF2   02A1
        RRC     R1,     1                       ; 6FF3   0071
        BNC     L_6FF7                          ; 6FF4   0209 0001

        INCR    R0                              ; 6FF6   0008
L_6FF7:
        TSTR    R2                              ; 6FF7   0092
        BMI     L_6FFC                          ; 6FF8   020B 0002

        ADDI    #$0002, R0                      ; 6FFA   02F8 0002
L_6FFC:
        ANDI    #$0003, R0                      ; 6FFC   03B8 0003
        MOVR    R5,     R7                      ; 6FFE   00AF

        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5017       <entry>
;;  $5058       $505C  
;;  $505F       $5062  
;;  $5067       $507C  
;;  $507E       $5067  
;;  $508E       $50AF  
;;  $509A       $5095  
;;  $50A8       $5093   $5098  
;;  $50AA       $50A6  
;;  $50B1       $5082  
;;  $50B2       $506D  
;;  $50BC       $50D4  
;;  $50D1       $50BD   $50C1  
;;  $50D7       $506A   $5073  
;;  $50DC       $5135  
;;  $50E3       $50E0  
;;  $50EA       $50E7  
;;  $50FC       $512E  
;;  $511A       $510F  
;;  $5120       $5116  
;;  $5128       $50FD  
;;  $512B       $5126  
;;  $512D       $5129  
;;  $5130       $50F2   $50F8  
;;  $5138       $5070  
;;  $5140       $515A  
;;  $5153       $515D  
;;  $5154       $514F  
;;  $5165       $5158  
;;  $5177       $5182  
;;  $5195       $51F9  
;;  $51E3       $51CE  
;;  $51E4       $51E2  
;;  $51F5       $519B   $51A1  
;;  $5212       $520E  
;;  $5227       $5200  
;;  $5238       $5230  
;;  $524D       $5245  
;;  $5263       $525E  
;;  $5269       $5277  
;;  $5272       $526C   $526F  
;;  $528E       $5285  
;;  $529F       $529B  
;;  $52A0       $523E   $5253  
;;  $52A3       $52D4  
;;  $52B1       $52AA  
;;  $52CE       $52CA  
;;  $52D1       $52AF  
;;  $52D7       $516D  
;;  $52DB       $52D9  
;;  $52E1       $52F2  
;;  $52F5       $516A  
;;  $52FF       $530C  
;;  $530F       $52AC  
;;  $533F       $5327  
;;  $5353       $534F  
;;  $5354       $5352  
;;  $535F       $5332  
;;  $5368       $5364  
;;  $536F       $537B  
;;  $5376       $5378  
;;  $537E       $5229  
;;  $5389       $5385  
;;  $53A5       $539E  
;;  $53A6       $53A4  
;;  $53BE       $53A2  
;;  $53D1       $53CE  
;;  $53E7       $53E3  
;;  $5410       $5260  
;;  $541D       $541A  
;;  $5425       $5420   $5434  
;;  $5432       $5427  
;;  $5437       $53F9  
;;  $5444       $543D  
;;  $5449       $543A  
;;  $5451       $544A  
;;  $5454       $5442   $5447   $544F  
;;  $5456       $543F  
;;  $545B       $546A  
;;  $545D       $5462  
;;  $546D       $5444  
;;  $5476       $54A1  
;;  $54A4       $544C  
;;  $54A9       $54B4  
;;  $54AB       $54AE  
;;  $54B7       $5451  
;;  $54BE       $54C1  
;;  $54C4       $52BD   $5393  
;;  $54C7       $54C9  
;;  $54CB       $54C5  
;;  $54FE       $54FA  
;;  $5500       $54F4  
;;  $5513       $6778  
;;  $5534       $5530   $63B8   $67BE   $67D7   $6944   $6A1B   $6BC3  
;;  $553B       $67F8  
;;  $5548       $5544   $5948   $5962   $67ED   $69B3  
;;  $5550       $552C   $6A26  
;;  $5571       $5526   $578E  
;;  $5580       $578A   $6908   $69A7   $6E9F  
;;  $5583       $5513   $6984   $6A29  
;;  $5584       $5582  
;;  $5587       $558D   $5595  
;;  $5590       $5589  
;;  $55B2       $55B0  
;;  $55C9       $55FB  
;;  $55DA       $55D2  
;;  $55EB       $55E1   $55E6  
;;  $55F6       $55D8   $55DD  
;;  $5620       $561D  
;;  $5625       $5621  
;;  $5636       $560E   $5631  
;;  $5646       $563F  
;;  $566C       $564E   $5653   $5658   $565D   $5667  
;;  $5673       $566F  
;;  $567E       $5676   $567A  
;;  $567F       $65F3   $6648  
;;  $56AB       $569C  
;;  $56C4       $56B4   $56BA   $56BF  
;;  $56D0       $56CB  
;;  $56D1       $6BCC  
;;  $56D7       $5523   $67B7   $690C   $699F   $6E9C  
;;  $56DA       $55F0   $6A0C  
;;  $56DC       $63D7   $6403   $6474   $675A   $6CBF  
;;  $56DD       $56DB  
;;  $56E5       $56F4  
;;  $56F8       $56EF  
;;  $5705       $5560   $6554  
;;  $5707       $63D2   $66D1   $6C6F   $6D62   $6D69  
;;  $5708       $5706  
;;  $5709       $5732  
;;  $5735       $570B   $571B   $573B  
;;  $573E       $63F4  
;;  $5740       $65B3   $66FA   $6C1D   $6C9C   $6D51  
;;  $5745       $6480  
;;  $5751       $574D  
;;  $5762       $575E  
;;  $5767       $5763  
;;  $5775       $5752   $5765   $5771  
;;  $5782       $5064  
;;  $57C2       $54F2   $54F8   $5604   $5609   $563A   $5698  
;;  $57CD       $53FC  
;;  $57D4       $57D2  
;;  $57DC       $57D8  
;;  $57DD       $57DB  
;;  $57E8       $57E2  
;;  $57E9       $5951  
;;  $57EA       $57E8  
;;  $57F9       $5810   $5819  
;;  $57FE       $5804  
;;  $5812       $5808  
;;  $581B       $5800  
;;  $581C       $57EF   $587A   $61F1  
;;  $581D       $585B  
;;  $583C       $583E  
;;  $5840       $583A  
;;  $5843       $5849  
;;  $584D       $5813  
;;  $585D       $57D0  
;;  $5867       $5861  
;;  $5868       $5866  
;;  $5874       $5888  
;;  $588B       $57FA   $587E  
;;  $5899       $589C  
;;  $58AA       $58A6  
;;  $58B5       $58AE  
;;  $58CE       $58C4  
;;  $58D2       $58CC  
;;  $58D3       $58BC  
;;  $58EA       $58E0  
;;  $58EC       $58E8  
;;  $5908       $58FD  
;;  $590E       $58D7  
;;  $5920       $591C  
;;  $5942       $5901   $5917   $5923   $5928   $5933   $593E  
;;  $5943       $6A23  
;;  $5944       $557D  
;;  $594F       $595B  
;;  $5966       $55FD  
;;  $5974       $5969   $596E  
;;  $5981       $597D  
;;  $5986       $5982  
;;  $598B       $5972  
;;  $5993       $598E  
;;  $5998       $68B9  
;;  $599E       $68E2  
;;  $59A2       $599C   $68F9  
;;  $59AF       $59AC  
;;  $5A17       $5A15  
;;  $5A30       $5A2E  
;;  $5A34       $5A32  
;;  $5A65       $5C4E  
;;  $5A84       $5A84  
;;  $5A95       $5A93  
;;  $5ABD       $5E50  
;;  $5AFB       $5AFB  
;;  $5B1E       $5D59  
;;  $5B49       $5A4E  
;;  $5B57       $5B57  
;;  $5B82       $5B82  
;;  $5BCC       $5BCC  
;;  $5C14       $5C14  
;;  $5C2B       $5C2B  
;;  $5C42       $5C42  
;;  $5C59       $5C59  
;;  $5CEF       $5AE5  
;;  $5D23       $5D0C  
;;  $5D48       $5A47  
;;  $5D5D       $5B53  
;;  $5E43       $60D1  
;;  $5EAB       $60E0  
;;  $5EB4       $5EB4  
;;  $5EEB       $60FA  
;;  $5F06       $6135  
;;  $5F30       $6165  
;;  $5F3A       $6154  
;;  $5F7C       $5F7C  
;;  $6078       $6036  
;;  $6099       $6099  
;;  $60FA       $60F8  
;;  $6111       $6111  
;;  $61CD       $5529   $699C  
;;  $61DA       $61D7  
;;  $62D9       $562C   $6349   $636A   $638A   $6CEE  
;;  $62F3       $62EC  
;;  $630C       $6307  
;;  $630D       $630B  
;;  $6318       $630F  
;;  $631D       $6316  
;;  $631F       $632A  
;;  $6325       $6320   $6332  
;;  $632E       $6323  
;;  $6331       $632C  
;;  $6337       $632F  
;;  $6353       $6346  
;;  $6361       $635D  
;;  $637D       $6379  
;;  $639E       $6397  
;;  $63AF       $640E   $6459   $6470  
;;  $63B0       $6351   $639B   $645F  
;;  $63BD       $63B4  
;;  $63EC       $63BE   $6917  
;;  $63F8       $63EF  
;;  $641E       $640C   $6414  
;;  $641F       $5569   $6574  
;;  $6422       $6432  
;;  $6423       $6421  
;;  $643F       $6447  
;;  $6458       $644D   $6451  
;;  $645C       $6456  
;;  $6479       $634E   $6391   $646A   $64CC  
;;  $647A       $64C6  
;;  $6491       $648D  
;;  $64B7       $64AF  
;;  $64B8       $6494   $64A2   $64A8   $64AC   $64B5  
;;  $64E8       $64E1  
;;  $64FB       $64ED  
;;  $6508       $6504  
;;  $6515       $6511  
;;  $6525       $6520  
;;  $6526       $6524  
;;  $6543       $6540  
;;  $6544       $6534   $653A  
;;  $6571       $6560   $6564  
;;  $65A9       $65A6  
;;  $65BE       $64DC   $64E6   $64F3   $64F9  
;;  $65CB       $65C8  
;;  $65FD       $65EA  
;;  $6609       $6605  
;;  $660F       $65FB   $660A  
;;  $6612       $660D  
;;  $6617       $65C3   $65EF  
;;  $6618       $65E6  
;;  $6629       $6621  
;;  $6635       $6631  
;;  $663B       $65DE   $65E4  
;;  $664E       $6642   $6646  
;;  $664F       $663D  
;;  $6659       $6652  
;;  $665A       $64D0   $65D5   $661C  
;;  $6662       $665D  
;;  $666B       $6656  
;;  $6687       $6681  
;;  $6689       $6685  
;;  $668A       $667F  
;;  $6692       $568C   $63FB   $6614   $6637   $6667   $6EA9  
;;  $6694       $63A3  
;;  $66A1       $65AC   $6675   $6697   $66F5   $6C18   $6C97   $6D07   $6D4C  
;;  $66B5       $66B2  
;;  $66BC       $66B9  
;;  $66C1       $66BF  
;;  $66D8       $66E0  
;;  $6705       $66C3   $66C8   $6700  
;;  $675A       $6751  
;;  $677B       $676D   $6773  
;;  $6788       $67AE  
;;  $679A       $6796  
;;  $679F       $679C  
;;  $67A9       $67A6  
;;  $67B0       $67A1   $67AB  
;;  $67C1       $675F  
;;  $67C2       $6766  
;;  $67E7       $67E4  
;;  $67F1       $5990   $691C   $69AC   $6A14   $6EAE  
;;  $6804       $67FF  
;;  $6805       $691F  
;;  $680E       $6826  
;;  $681E       $6823  
;;  $6828       $6820  
;;  $685B       $6859  
;;  $68A4       $689F  
;;  $68AC       $68A5  
;;  $68C3       $6905  
;;  $68DE       $68D9  
;;  $68E1       $68AE   $68B3   $68D3   $68E6  
;;  $68E2       $68B7   $68F3   $68FD  
;;  $68F0       $68BD  
;;  $6907       $68C9  
;;  $6956       $6953  
;;  $6962       $695C  
;;  $697C       $6978  
;;  $6989       $68E8  
;;  $69A3       $6775   $68A7  
;;  $69A4       $69A2  
;;  $69E5       $69E2  
;;  $69EA       $69DF  
;;  $69F2       $69F3  
;;  $69F5       $69F6  
;;  $69F9       $5669  
;;  $69FA       $6ADF   $6BD0  
;;  $6A12       $68AA   $68EE  
;;  $6A1F       $67BA   $6A17  
;;  $6A2E       $69B6  
;;  $6A70       $6A6A  
;;  $6A79       $6A73  
;;  $6A81       $67CF  
;;  $6A82       $6A80  
;;  $6AC0       $6AE3   $6AE9  
;;  $6AC1       $6ABC  
;;  $6AD2       $6AC6  
;;  $6ADD       $6AD8  
;;  $6AF5       $6AEE  
;;  $6B07       $6B0C  
;;  $6B0F       $5662   $697E  
;;  $6B22       $6B13  
;;  $6B30       $6B25  
;;  $6B43       $6B33   $6B3A  
;;  $6B44       $6981   $6B27   $6B2A   $6B2D   $6B40  
;;  $6B4D       $6B4A  
;;  $6B64       $6B53   $6B59  
;;  $6B6C       $6ADA  
;;  $6B7D       $6B70  
;;  $6B93       $6B7B  
;;  $6BB4       $6B79   $6B81   $6BA6  
;;  $6BB5       $6BAC  
;;  $6BB6       $56AD  
;;  $6BD3       $6578   $6C22  
;;  $6BD4       $556E   $5691  
;;  $6BE5       $6BD5  
;;  $6BFC       $6BF7  
;;  $6BFD       $6BFB  
;;  $6C06       $5633  
;;  $6C25       $6C0A   $6C0F  
;;  $6C26       $6BC6  
;;  $6C2B       $6C3D  
;;  $6C2D       $6C31  
;;  $6C37       $6C38  
;;  $6C40       $641B   $698C   $6BB1  
;;  $6C4A       $6C42  
;;  $6C4B       $6C48  
;;  $6C4E       $5641  
;;  $6CA2       $6C52   $6C57   $6C5C   $6C64  
;;  $6CE0       $6CDC  
;;  $6CFC       $6CDA   $6CF2  
;;  $6D03       $6CC6   $6CCF  
;;  $6D05       $6CFA  
;;  $6D17       $56C1  
;;  $6D3B       $6D37  
;;  $6D43       $6D3F  
;;  $6D44       $6D42  
;;  $6D45       $6D22   $6D30  
;;  $6D47       $6CE2   $6D00  
;;  $6D55       $6BC9  
;;  $6D8E       $6D9F  
;;  $6D97       $6D91  
;;  $6DBE       $6DB0   $6DB5  
;;  $6DC7       $6D5A  
;;  $6DCF       $6DD3  
;;  $6DDF       $5510  
;;  $6DE0       $6DDE  
;;  $6E98       $67C2  
;;  $6ED4       $6EE8  
;;  $6ED6       $6EDA  
;;  $6EE4       $6EE5  
;;  $6EEC       $6702   $6C9F  
;;  $6F07       $56CD  
;;  $6F24       <entry>
;;  $6F2E       $6F2A  
;;  $6F31       <entry>
;;  $6F3B       $6F37  
;;  $6F3C       $6F2F  
;;  $6F3F       $6B5C  
;;  $6F48       $68C6   $6A2F  
;;  $6F4E       $63AA   $660F  
;;  $6F4F       $664B  
;;  $6F56       $6F53  
;;  $6F6D       $6626  
;;  $6F75       $6F72  
;;  $6F83       $6E99  
;;  $6F9F       $63C1  
;;  $6FA0       $6AFB  
;;  $6FAD       $665F  
;;  $6FB7       $6F05  
;;  $6FBE       <entry>
;;  $6FC5       $6FB2  
;;  $6FC6       $5610   $6CC8   $6D18  
;;  $6FDA       $557A   $690F   $6A20   $6BB6   $6EA3  
;;  $6FE0       $5974   $59A3  
;;  $6FED       $639E   $6CF7  
;;  $6FF7       $6FF4  
;;  $6FFC       $6FF8  
;; ======================================================================== ;;
