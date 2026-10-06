
        ORG     $5000
.HEADER:
        BIDECLE $B801           ; 5000  Ptr: MOB graphic images
        BIDECLE $4B16           ; 5002  Ptr: EXEC timer table
        DECLE   $0240,  $0100   ; 5004  Ptr: Start of game
        BIDECLE $4040           ; 5006  Ptr: Backgnd gfx list
        DECLE   $0101,  $02BE   ; 5008  Ptr: GRAM init sequence
        DECLE   $02F0,  $02B8   ; 500A  Ptr: Date/Title
        DECLE   $00F0           ; 500C  Key-click / flags
        DECLE   $02BC           ; 500D  Border extension
        DECLE   $0200           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0114   ; 500F  Color Stack init (0, 1)
        DECLE   $0338,  $02BC   ; 5011  Color Stack init (2, 3)
        DECLE   $0318           ; 5013  Border color init


        MVII    #$0047, R0                      ; 5014   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; 5016   0004 0114 0338

        MVII    #$0102, R4                      ; 5019   02BC 0102
        MVII    #$00EE, R0                      ; 501B   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 501D   0004 0114 0338

        SDBD                                    ; 5020   0001
        MVII    #$57E8, R0                      ; 5021   02B8 00E8 0057
        MVO     R0,     G_035D                  ; 5024   0240 035D
        MVII    #$0002, R0                      ; 5026   02B8 0002
        MVO     R0,     G_010C                  ; 5028   0240 010C
        MVO     R0,     G_010F                  ; 502A   0240 010F
        MVII    #$0008, R2                      ; 502C   02BA 0008
        SWAP    R2,     1                       ; 502E   0042
        MVII    #$0008, R1                      ; 502F   02B9 0008
        SDBD                                    ; 5031   0001
        MVII    #$57AC, R4                      ; 5032   02BC 00AC 0057
        MVII    #$0328, R5                      ; 5035   02BD 0328
L_5037:
        MVI@    R4,     R0                      ; 5037   02A0
        XORR    R2,     R0                      ; 5038   01D0
        MVO@    R0,     R5                      ; 5039   0268
        DECR    R1                              ; 503A   0011
        BNEQ    L_5037                          ; 503B   022C 0005

        MVII    #$0179, R1                      ; 503D   02B9 0179
        MVII    #$0007, R2                      ; 503F   02BA 0007
L_5041:
        MVO@    R0,     R1                      ; 5041   0248
        DECR    R2                              ; 5042   0012
        BNEQ    L_5041                          ; 5043   022C 0003

        EIS                                     ; 5045   0002
L_5046:
        MVI     G_010F, R0                      ; 5046   0280 010F
        TSTR    R0                              ; 5048   0080
        BNEQ    L_5046                          ; 5049   022C 0004

        JSR     R5,     L_5053                  ; 504B   0004 0150 0053

        MVI     G_010E, R0                      ; 504E   0280 010E
        TSTR    R0                              ; 5050   0080
        BNEQ    L_5080                          ; 5051   020C 002D

L_5053:
        MVII    #$0003, R0                      ; 5053   02B8 0003
        MVO     R0,     G_010E                  ; 5055   0240 010E
        SDBD                                    ; 5057   0001
        MVII    #$5041, R4                      ; 5058   02BC 0041 0050
        MVII    #$016B, R3                      ; 505B   02BB 016B
L_505D:
        MVI@    R3,     R0                      ; 505D   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 505E   0004 0114 0268

        TSTR    R0                              ; 5061   0080
        BMI     L_5077                          ; 5062   020B 0013
        BEQ     L_5069                          ; 5064   0204 0003

        DECR    R0                              ; 5066   0010
        BNEQ    L_5077                          ; 5067   020C 000E

L_5069:
        MVI@    R4,     R0                      ; 5069   02A0
        MVO@    R0,     R3                      ; 506A   0258
        PSHR    R4                              ; 506B   0274
        PSHR    R3                              ; 506C   0273
        SDBD                                    ; 506D   0001
        MVII    #$4873, R5                      ; 506E   02BD 0073 0048
        SDBD                                    ; 5071   0001
        MVI@    R4,     R7                      ; 5072   02A7

        PULR    R3                              ; 5073   02B3
        PULR    R4                              ; 5074   02B4
        B       L_5079                          ; 5075   0200 0002

L_5077:
        MVO@    R0,     R3                      ; 5077   0258
        INCR    R4                              ; 5078   000C
L_5079:
        INCR    R3                              ; 5079   000B
        ADDI    #$0002, R4                      ; 507A   02FC 0002
        CMPI    #$0171, R3                      ; 507C   037B 0171
        BLT     L_505D                          ; 507E   0225 0022

L_5080:
        CLRR    R1                              ; 5080   01C9
        DIS                                     ; 5081   0003
        MVI     G_010D, R2                      ; 5082   0282 010D
        MVO     R1,     G_010D                  ; 5084   0241 010D
        EIS                                     ; 5086   0002
        MVII    #$0330, R3                      ; 5087   02BB 0330
L_5089:
        RRC     R2,     1                       ; 5089   0072
        BNC     L_509E                          ; 508A   0209 0012

        MVI@    R3,     R4                      ; 508C   029C
        TSTR    R4                              ; 508D   00A4
        BEQ     L_509E                          ; 508E   0204 000E

        ADDI    #$0000, R4                      ; 5090   02FC 0000
        SDBD                                    ; 5092   0001
        MVII    #$489C, R5                      ; 5093   02BD 009C 0048
        PSHR    R2                              ; 5096   0272
        PSHR    R3                              ; 5097   0273
        SUBI    #$0330, R3                      ; 5098   033B 0330
        SDBD                                    ; 509A   0001
        MVI@    R4,     R7                      ; 509B   02A7

        PULR    R3                              ; 509C   02B3
        PULR    R2                              ; 509D   02B2
L_509E:
        INCR    R3                              ; 509E   000B
        CMPI    #$0337, R3                      ; 509F   037B 0337
        BLE     L_5089                          ; 50A1   0226 0019

        MVII    #$034F, R3                      ; 50A3   02BB 034F
        MVII    #$0318, R2                      ; 50A5   02BA 0318
L_50A7:
        CLRR    R5                              ; 50A7   01ED
        MVI@    R2,     R0                      ; 50A8   0290
        ANDI    #$0100, R0                      ; 50A9   03B8 0100
        BNEQ    L_50AE                          ; 50AB   020C 0001

        INCR    R5                              ; 50AD   000D
L_50AE:
        ADDI    #$0018, R2                      ; 50AE   02FA 0018
        MVI@    R2,     R4                      ; 50B0   0294
        TSTR    R4                              ; 50B1   00A4
        BNEQ    L_50B5                          ; 50B2   020C 0001

        INCR    R5                              ; 50B4   000D
L_50B5:
        CLRR    R1                              ; 50B5   01C9
        MVII    #$03FF, R0                      ; 50B6   02B8 03FF
        DIS                                     ; 50B8   0003
        AND@    R3,     R0                      ; 50B9   0398
        MVO@    R1,     R3                      ; 50BA   0259
        EIS                                     ; 50BB   0002
        TSTR    R5                              ; 50BC   00AD
        BNEQ    L_50EF                          ; 50BD   020C 0030

        ADDI    #$0005, R4                      ; 50BF   02FC 0005
        MVI@    R4,     R1                      ; 50C1   02A1
        ANDR    R1,     R0                      ; 50C2   0188
        BEQ     L_50EF                          ; 50C3   0204 002A

        MVII    #$000A, R5                      ; 50C5   02BD 000A
L_50C7:
        SARC    R0,     1                       ; 50C7   0078
        BNC     L_50E7                          ; 50C8   0209 001D

        SLR     R1,     1                       ; 50CA   0061
        PSHR    R5                              ; 50CB   0275
        PSHR    R3                              ; 50CC   0273
        PSHR    R2                              ; 50CD   0272
        NOP                                     ; 50CE   0034
        PSHR    R1                              ; 50CF   0271
        PSHR    R0                              ; 50D0   0270
        SUBI    #$0330, R2                      ; 50D1   033A 0330
        NEGR    R5                              ; 50D3   0025
        MOVR    R5,     R1                      ; 50D4   00A9
L_50D5:
        ADDI    #$000A, R1                      ; 50D5   02F9 000A
        SDBD                                    ; 50D7   0001
        MVII    #$48DF, R5                      ; 50D8   02BD 00DF 0048
        SDBD                                    ; 50DB   0001
        MVI@    R4,     R0                      ; 50DC   02A0
        PSHR    R4                              ; 50DD   0274
        MOVR    R0,     R7                      ; 50DE   0087

        PULR    R4                              ; 50DF   02B4
        PULR    R0                              ; 50E0   02B0
        PULR    R1                              ; 50E1   02B1
        PULR    R2                              ; 50E2   02B2
        PULR    R3                              ; 50E3   02B3
        PULR    R5                              ; 50E4   02B5
        B       L_50EC                          ; 50E5   0200 0005

L_50E7:
        SARC    R1,     1                       ; 50E7   0079
        BNC     L_50EC                          ; 50E8   0209 0002

        ADDI    #$0002, R4                      ; 50EA   02FC 0002
L_50EC:
        DECR    R5                              ; 50EC   0015
        BNEQ    L_50C7                          ; 50ED   022C 0027

L_50EF:
        SUBI    #$0017, R2                      ; 50EF   033A 0017
        INCR    R3                              ; 50F1   000B
        CMPI    #$0357, R3                      ; 50F2   037B 0357
        BLT     L_50A7                          ; 50F4   0225 004E

        MVI     G_0110, R0                      ; 50F6   0280 0110
        RRC     R0,     1                       ; 50F8   0070
        BC      L_5109                          ; 50F9   0201 000E

        SETC                                    ; 50FB   0007
        RLC     R0,     1                       ; 50FC   0050
        MVO     R0,     G_0110                  ; 50FD   0240 0110
        MVII    #$0338, R2                      ; 50FF   02BA 0338
        MVII    #$0330, R4                      ; 5101   02BC 0330
        MVII    #$0004, R1                      ; 5103   02B9 0004
        MVII    #$0008, R0                      ; 5105   02B8 0008
        B       L_511B                          ; 5107   0200 0012

L_5109:
        RRC     R0,     1                       ; 5109   0070
        BC      L_515D                          ; 510A   0201 0051

        MVII    #$0003, R0                      ; 510C   02B8 0003
        MVO     R0,     G_0110                  ; 510E   0240 0110
        MVII    #$0348, R2                      ; 5110   02BA 0348
        MVII    #$015D, R4                      ; 5112   02BC 015D
        MVII    #$0002, R1                      ; 5114   02B9 0002
        MVII    #$0007, R0                      ; 5116   02B8 0007
        TSTR    R0                              ; 5118   0080
        BEQ     L_515D                          ; 5119   0204 0042

L_511B:
        MVI@    R2,     R3                      ; 511B   0293
        DECLE   $0272,  $037A,  $0348,  $020D   ; 511C   0272 037A 0348 020D
        DECLE   $0001,  $000F,  $0001           ; 5120   0001 000F 0001

        MVI@    R4,     R2                      ; 5123   02A2
        TSTR    R2                              ; 5124   0092
        BEQ     L_5157                          ; 5125   0204 0030

        ADDR    R1,     R2                      ; 5127   00CA
        MVI@    R2,     R2                      ; 5128   0292
        PSHR    R0                              ; 5129   0270
        PSHR    R1                              ; 512A   0271
        DECR    R2                              ; 512B   0012
        MOVR    R3,     R1                      ; 512C   0099
        ANDI    #$000F, R1                      ; 512D   03B9 000F
        MOVR    R3,     R0                      ; 512F   0098
        SWAP    R0,     1                       ; 5130   0040
        ANDI    #$003E, R0                      ; 5131   03B8 003E
        SLR     R0,     1                       ; 5133   0060
        TSTR    R0                              ; 5134   0080
        BEQ     L_5148                          ; 5135   0204 0011

        DECR    R0                              ; 5137   0010
        BNEQ    L_514D                          ; 5138   020C 0013

        TSTR    R3                              ; 513A   009B
        BPL     L_513F                          ; 513B   0203 0002

        DECR    R1                              ; 513D   0011
        INCR    R7                              ; 513E   000F

L_513F:
        INCR    R1                              ; 513F   0009
L_5140:
        TSTR    R1                              ; 5140   0089
        BMI     L_5147                          ; 5141   020B 0004

        CMPR    R2,     R1                      ; 5143   0151
        BLE     L_5148                          ; 5144   0206 0002

        CLRR    R2                              ; 5146   01D2
L_5147:
        MOVR    R2,     R1                      ; 5147   0091
L_5148:
        MOVR    R3,     R0                      ; 5148   0098
        ANDI    #$01F0, R0                      ; 5149   03B8 01F0
        SLR     R0,     2                       ; 514B   0064
        SLR     R0,     2                       ; 514C   0064
L_514D:
        SDBD                                    ; 514D   0001
        ANDI    #$81F0, R3                      ; 514E   03BB 00F0 0081
        SWAP    R0,     1                       ; 5151   0040
        SLL     R0,     1                       ; 5152   0048
        XORR    R0,     R3                      ; 5153   01C3
        XORR    R1,     R3                      ; 5154   01CB
        PULR    R1                              ; 5155   02B1
        PULR    R0                              ; 5156   02B0
L_5157:
        PULR    R2                              ; 5157   02B2
        MVO@    R3,     R2                      ; 5158   0253
        INCR    R2                              ; 5159   000A
        DECR    R0                              ; 515A   0010
        BNEQ    L_511B                          ; 515B   022C 0041

L_515D:
        JSR     R5,     .EXEC.4F1               ; 515D   0004 0114 00F1

        MVII    #$0106, R4                      ; 5160   02BC 0106
        SDBD                                    ; 5162   0001
        MVI@    R4,     R0                      ; 5163   02A0
        TSTR    R0                              ; 5164   0080
        BEQ     L_516E                          ; 5165   0204 0007

        SUBI    #$0002, R4                      ; 5167   033C 0002
        SDBD                                    ; 5169   0001
        MVII    #$496E, R5                      ; 516A   02BD 006E 0049
        MOVR    R0,     R7                      ; 516D   0087

L_516E:
        CMPI    #$010A, R4                      ; 516E   037C 010A
        DECLE   $0226,  $000F,  $0004           ; 5170   0226 000F 0004

        CMP@    R1,     R0                      ; 5173   0348
        SLL     R2,     2                       ; 5174   004E
        CLRR    R0                              ; 5175   01C0
        MVO     R0,     .STIC.BORD              ; 5176   0240 002C
        PULR    R7                              ; 5178   02B7

        PSHR    R5                              ; 5179   0275
        MVI     G_0103, R0                      ; 517A   0280 0103
        TSTR    R0                              ; 517C   0080
        BEQ     L_5182                          ; 517D   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 517F   0240 0020
        PULR    R7                              ; 5181   02B7

L_5182:
        MVI     G_0102, R1                      ; 5182   0281 0102
        DECLE   $0379,  $0080,  $0224,  $0012   ; 5184   0379 0080 0224 0012
        DECLE   $0240,  $0020,  $0008,  $0240   ; 5188   0240 0020 0008 0240
        DECLE   $0103,  $0004                   ; 518C   0103 0004

        CMPR    R1,     R0                      ; 518E   0148
        ADDI    #$02B9, R4                      ; 518F   02FC 02B9
        INCR    R0                              ; 5191   0008
        MVO     R1,     .STIC.BORD              ; 5192   0241 002C
        MVI     G_018A, R0                      ; 5194   0280 018A
        MVO     R0,     .STIC.HDLY              ; 5196   0240 0030
        MVI     G_018B, R0                      ; 5198   0280 018B
        MVO     R0,     .STIC.VDLY              ; 519A   0240 0031
        MVII    #$034F, R3                      ; 519C   02BB 034F
        MVII    #$0018, R2                      ; 519E   02BA 0018
        CLRR    R5                              ; 51A0   01ED
        MVII    #$0008, R4                      ; 51A1   02BC 0008
L_51A3:
        MVI@    R2,     R0                      ; 51A3   0290
        MVO@    R5,     R2                      ; 51A4   0255
        MVI@    R3,     R1                      ; 51A5   0299
        COMR    R0                              ; 51A6   0018
        ANDR    R0,     R1                      ; 51A7   0181
        COMR    R0                              ; 51A8   0018
        XORR    R0,     R1                      ; 51A9   01C1
        MVO@    R1,     R3                      ; 51AA   0259
        INCR    R2                              ; 51AB   000A
        INCR    R3                              ; 51AC   000B
        DECR    R4                              ; 51AD   0014
        BNEQ    L_51A3                          ; 51AE   022C 000C

        MVI     G_0104, R2                      ; 51B0   0282 0104
        SLL     R2,     1                       ; 51B2   004A
        MVII    #$0338, R4                      ; 51B3   02BC 0338
        MVII    #$0330, R5                      ; 51B5   02BD 0330
        ADDR    R2,     R4                      ; 51B7   00D4
        ADDR    R2,     R5                      ; 51B8   00D5
L_51B9:
        MVI@    R4,     R3                      ; 51B9   02A3
        ANDI    #$000F, R3                      ; 51BA   03BB 000F
        PSHR    R4                              ; 51BC   0274
        MVI@    R5,     R4                      ; 51BD   02AC
        TSTR    R4                              ; 51BE   00A4
        BEQ     L_5219                          ; 51BF   0204 0058

        MVII    #$0171, R1                      ; 51C1   02B9 0171
        ADDR    R2,     R1                      ; 51C3   00D1
        CMP@    R1,     R3                      ; 51C4   034B
        BEQ     L_5219                          ; 51C5   0204 0052

        MVO@    R3,     R1                      ; 51C7   024B
        PSHR    R5                              ; 51C8   0275
        MVII    #$0318, R1                      ; 51C9   02B9 0318
        ADDR    R2,     R1                      ; 51CB   00D1
L_51CC:
        MVI@    R1,     R0                      ; 51CC   0288
        PSHR    R1                              ; 51CD   0271
        MOVR    R0,     R1                      ; 51CE   0081
        SDBD                                    ; 51CF   0001
        ANDI    #$FDFF, R0                      ; 51D0   03B8 00FF 00FD
        SDBD                                    ; 51D3   0001
        ANDI    #$0800, R1                      ; 51D4   03B9 0000 0008
        SLR     R1,     2                       ; 51D7   0065
        XORR    R1,     R0                      ; 51D8   01C8
        PULR    R1                              ; 51D9   02B1
        MVO@    R0,     R1                      ; 51DA   0248
        ADDI    #$0002, R4                      ; 51DB   02FC 0002
        SDBD                                    ; 51DD   0001
        MVII    #$57AC, R5                      ; 51DE   02BD 00AC 0057
        ADDR    R2,     R5                      ; 51E1   00D5
        MVI@    R5,     R5                      ; 51E2   02AD
        SDBD                                    ; 51E3   0001
        ADDI    #$3800, R5                      ; 51E4   02FD 0000 0038
        MVII    #$0320, R1                      ; 51E7   02B9 0320
        ADDR    R2,     R1                      ; 51E9   00D1
        MVI@    R1,     R0                      ; 51EA   0288
        SLL     R3,     2                       ; 51EB   004F
        SLL     R3,     1                       ; 51EC   004B
        SDBD                                    ; 51ED   0001
        MVI@    R4,     R1                      ; 51EE   02A1
        MOVR    R1,     R4                      ; 51EF   008C
        ANDI    #$0080, R0                      ; 51F0   03B8 0080
        BEQ     L_5207                          ; 51F2   0204 0013

        SLL     R3,     1                       ; 51F4   004B
        ADDR    R3,     R4                      ; 51F5   00DC
        MVI@    R4,     R0                      ; 51F6   02A0
        MVO@    R0,     R5                      ; 51F7   0268
        MVI@    R4,     R0                      ; 51F8   02A0
        MVO@    R0,     R5                      ; 51F9   0268
        MVI@    R4,     R0                      ; 51FA   02A0
        MVO@    R0,     R5                      ; 51FB   0268
        MVI@    R4,     R0                      ; 51FC   02A0
        MVO@    R0,     R5                      ; 51FD   0268
        MVI@    R4,     R0                      ; 51FE   02A0
        MVO@    R0,     R5                      ; 51FF   0268
        MVI@    R4,     R0                      ; 5200   02A0
        MVO@    R0,     R5                      ; 5201   0268
        MVI@    R4,     R0                      ; 5202   02A0
        MVO@    R0,     R5                      ; 5203   0268
        MVI@    R4,     R0                      ; 5204   02A0
        MVO@    R0,     R5                      ; 5205   0268
        INCR    R7                              ; 5206   000F

L_5207:
        ADDR    R3,     R4                      ; 5207   00DC
L_5208:
        MVI@    R4,     R0                      ; 5208   02A0
        MVO@    R0,     R5                      ; 5209   0268
        MVI@    R4,     R0                      ; 520A   02A0
        MVO@    R0,     R5                      ; 520B   0268
        MVI@    R4,     R0                      ; 520C   02A0
        MVO@    R0,     R5                      ; 520D   0268
        MVI@    R4,     R0                      ; 520E   02A0
        MVO@    R0,     R5                      ; 520F   0268
        MVI@    R4,     R0                      ; 5210   02A0
        MVO@    R0,     R5                      ; 5211   0268
        MVI@    R4,     R0                      ; 5212   02A0
        MVO@    R0,     R5                      ; 5213   0268
        MVI@    R4,     R0                      ; 5214   02A0
        MVO@    R0,     R5                      ; 5215   0268
        MVI@    R4,     R0                      ; 5216   02A0
        MVO@    R0,     R5                      ; 5217   0268
        PULR    R5                              ; 5218   02B5
L_5219:
        PULR    R4                              ; 5219   02B4
        INCR    R2                              ; 521A   000A
        MOVR    R2,     R0                      ; 521B   0090
        SARC    R0,     1                       ; 521C   0078
        BC      L_51B9                          ; 521D   0221 0065

        MVI     G_0104, R2                      ; 521F   0282 0104
        SLL     R2,     1                       ; 5221   004A
        MVII    #$0348, R4                      ; 5222   02BC 0348
        MVII    #$015D, R5                      ; 5224   02BD 015D
        ADDR    R2,     R4                      ; 5226   00D4
        SLL     R2,     1                       ; 5227   004A
        ADDR    R2,     R5                      ; 5228   00D5
        SLR     R2,     1                       ; 5229   0062
L_522A:
        MOVR    R2,     R1                      ; 522A   0091
        INCR    R1                              ; 522B   0009
        CMPI    #$0007, R1                      ; 522C   0379 0007
        BGT     L_5262                          ; 522E   020E 0032

        MVI@    R4,     R3                      ; 5230   02A3
        ANDI    #$000F, R3                      ; 5231   03BB 000F
        PSHR    R4                              ; 5233   0274
L_5234:
        SDBD                                    ; 5234   0001
        MVI@    R5,     R4                      ; 5235   02AC
        PSHR    R5                              ; 5236   0275
        MVII    #$0179, R1                      ; 5237   02B9 0179
        ADDR    R2,     R1                      ; 5239   00D1
        CMP@    R1,     R3                      ; 523A   034B
        BEQ     L_525B                          ; 523B   0204 001E

        MVO@    R3,     R1                      ; 523D   024B
        SLL     R3,     2                       ; 523E   004F
        SLL     R3,     1                       ; 523F   004B
        SDBD                                    ; 5240   0001
        ADD@    R4,     R3                      ; 5241   02E3
        MOVR    R3,     R4                      ; 5242   009C
        MOVR    R2,     R1                      ; 5243   0091
L_5244:
        SLL     R1,     2                       ; 5244   004D
        SLL     R1,     1                       ; 5245   0049
        SDBD                                    ; 5246   0001
        ADDI    #$3800, R1                      ; 5247   02F9 0000 0038
        MOVR    R1,     R5                      ; 524A   008D
        MVI@    R4,     R0                      ; 524B   02A0
        MVO@    R0,     R5                      ; 524C   0268
        MVI@    R4,     R0                      ; 524D   02A0
        MVO@    R0,     R5                      ; 524E   0268
        MVI@    R4,     R0                      ; 524F   02A0
        MVO@    R0,     R5                      ; 5250   0268
        MVI@    R4,     R0                      ; 5251   02A0
        MVO@    R0,     R5                      ; 5252   0268
        MVI@    R4,     R0                      ; 5253   02A0
        MVO@    R0,     R5                      ; 5254   0268
L_5255:
        MVI@    R4,     R0                      ; 5255   02A0
        MVO@    R0,     R5                      ; 5256   0268
        MVI@    R4,     R0                      ; 5257   02A0
        MVO@    R0,     R5                      ; 5258   0268
        MVI@    R4,     R0                      ; 5259   02A0
        MVO@    R0,     R5                      ; 525A   0268
L_525B:
        PULR    R5                              ; 525B   02B5
        PULR    R4                              ; 525C   02B4
        INCR    R2                              ; 525D   000A
        MOVR    R2,     R0                      ; 525E   0090
        SARC    R0,     1                       ; 525F   0078
        BC      L_522A                          ; 5260   0221 0037

L_5262:
        MVII    #$00FF, R0                      ; 5262   02B8 00FF
        DECLE   $02BB,  $0318,  $02BC,  $0125   ; 5264   02BB 0318 02BC 0125
        DECLE   $0004                           ; 5268   0004

        CMPR    R1,     R0                      ; 5269   0148
        MVII    #$02B8, R1                      ; 526A   02B9 02B8
        SARC    R3,     2                       ; 526C   007F
L_526D:
        MVII    #$0320, R3                      ; 526D   02BB 0320
        DECLE   $02BC,  $0135,  $0004           ; 526F   02BC 0135 0004

        CMPR    R1,     R0                      ; 5272   0148
        MVII    #$01C9, R1                      ; 5273   02B9 01C9
        MVII    #$0340, R3                      ; 5275   02BB 0340
L_5277:
        CLRC                                    ; 5277   0006
        MVI@    R3,     R0                      ; 5278   0298
        TSTR    R0                              ; 5279   0080
        BEQ     L_5280                          ; 527A   0204 0004

        DECR    R0                              ; 527C   0010
        BNEQ    L_5280                          ; 527D   020C 0001

        SETC                                    ; 527F   0007
L_5280:
        RRC     R1,     1                       ; 5280   0071
        MVO@    R0,     R3                      ; 5281   0258
        INCR    R3                              ; 5282   000B
        CMPI    #$0347, R3                      ; 5283   037B 0347
        BLE     L_5277                          ; 5285   0226 000F

        SWAP    R1,     1                       ; 5287   0041
        MVI     G_010D, R0                      ; 5288   0280 010D
        COMR    R0                              ; 528A   0018
        ANDR    R0,     R1                      ; 528B   0181
        COMR    R0                              ; 528C   0018
        XORR    R0,     R1                      ; 528D   01C1
L_528E:
        MVO     R1,     G_010D                  ; 528E   0241 010D
        MVI     G_010E, R0                      ; 5290   0280 010E
        TSTR    R0                              ; 5292   0080
        BEQ     L_529C                          ; 5293   0204 0007

        AND     G_0110, R0                      ; 5295   0380 0110
        MVO     R0,     G_0110                  ; 5297   0240 0110
        DECR    R0                              ; 5299   0010
        MVO     R0,     G_010E                  ; 529A   0240 010E
L_529C:
        MVII    #$0180, R3                      ; 529C   02BB 0180
        MVII    #$0003, R1                      ; 529E   02B9 0003
L_52A0:
        MVI@    R3,     R0                      ; 52A0   0298
        TSTR    R0                              ; 52A1   0080
        BEQ     L_52A6                          ; 52A2   0204 0002

        DECR    R0                              ; 52A4   0010
        MVO@    R0,     R3                      ; 52A5   0258
L_52A6:
        INCR    R3                              ; 52A6   000B
        DECR    R1                              ; 52A7   0011
        BNEQ    L_52A0                          ; 52A8   022C 0009

        MVII    #$00FF, R0                      ; 52AA   02B8 00FF
        MVO     R0,     G_011D                  ; 52AC   0240 011D
        MVI     G_0104, R0                      ; 52AE   0280 0104
        INCR    R0                              ; 52B0   0008
        ANDI    #$0003, R0                      ; 52B1   03B8 0003
        MVO     R0,     G_0104                  ; 52B3   0240 0104
        CLRR    R0                              ; 52B5   01C0
L_52B6:
        MVO     R0,     G_0103                  ; 52B6   0240 0103
        PULR    R7                              ; 52B8   02B7

        PSHR    R5                              ; 52B9   0275
        MVII    #$0008, R5                      ; 52BA   02BD 0008
L_52BC:
        PSHR    R5                              ; 52BC   0275
        MVI@    R3,     R1                      ; 52BD   0299
        SDBD                                    ; 52BE   0001
        MVII    #$4000, R5                      ; 52BF   02BD 0000 0040
        ANDR    R1,     R5                      ; 52C2   018D
        BEQ     L_52D9                          ; 52C3   0204 0014

        PSHR    R0                              ; 52C5   0270
        MOVR    R0,     R2                      ; 52C6   0082
        DECR    R3                              ; 52C7   0013
        MVI@    R3,     R1                      ; 52C8   0299
        ANDR    R0,     R1                      ; 52C9   0181
        INCR    R3                              ; 52CA   000B
        INCR    R4                              ; 52CB   000C
        MVI@    R4,     R0                      ; 52CC   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52CD   0004 0114 0268

        ADDR    R0,     R1                      ; 52D0   00C1
        ANDR    R2,     R1                      ; 52D1   0191
        COMR    R2                              ; 52D2   001A
        AND@    R3,     R2                      ; 52D3   039A
        XORR    R2,     R1                      ; 52D4   01D1
        MVO@    R1,     R3                      ; 52D5   0259
        PULR    R0                              ; 52D6   02B0
        B       L_52F6                          ; 52D7   0200 001D

L_52D9:
        ANDR    R0,     R1                      ; 52D9   0181
        PSHR    R0                              ; 52DA   0270
        SWAP    R1,     1                       ; 52DB   0041
        PSHR    R4                              ; 52DC   0274
        XOR@    R4,     R1                      ; 52DD   03E1
        MVI@    R4,     R0                      ; 52DE   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52DF   0004 0114 0268

        MVI     G_010C, R2                      ; 52E2   0282 010C
        TSTR    R2                              ; 52E4   0092
        BEQ     L_52EB                          ; 52E5   0204 0004

L_52E7:
        SLL     R0,     1                       ; 52E7   0048
        DECR    R2                              ; 52E8   0012
        BNEQ    L_52E7                          ; 52E9   022C 0003

L_52EB:
        ADDR    R0,     R1                      ; 52EB   00C1
        PULR    R2                              ; 52EC   02B2
        MVO@    R1,     R2                      ; 52ED   0251
        SWAP    R1,     1                       ; 52EE   0041
        PULR    R0                              ; 52EF   02B0
        ANDR    R0,     R1                      ; 52F0   0181
        MOVR    R0,     R2                      ; 52F1   0082
        COMR    R2                              ; 52F2   001A
        AND@    R3,     R2                      ; 52F3   039A
        XORR    R1,     R2                      ; 52F4   01CA
        MVO@    R2,     R3                      ; 52F5   025A
L_52F6:
        INCR    R3                              ; 52F6   000B
        PULR    R5                              ; 52F7   02B5
        DECR    R5                              ; 52F8   0015
        BNEQ    L_52BC                          ; 52F9   022C 003E
        PULR    R7                              ; 52FB   02B7

        PSHR    R5                              ; 52FC   0275
        MVII    #$0318, R4                      ; 52FD   02BC 0318
L_52FF:
        CLRR    R5                              ; 52FF   01ED
        MVII    #$0003, R1                      ; 5300   02B9 0003
L_5302:
        MVI@    R4,     R0                      ; 5302   02A0
        MVO@    R0,     R5                      ; 5303   0268
        MVI@    R4,     R0                      ; 5304   02A0
        MVO@    R0,     R5                      ; 5305   0268
        MVI@    R4,     R0                      ; 5306   02A0
        MVO@    R0,     R5                      ; 5307   0268
        MVI@    R4,     R0                      ; 5308   02A0
        MVO@    R0,     R5                      ; 5309   0268
        MVI@    R4,     R0                      ; 530A   02A0
        MVO@    R0,     R5                      ; 530B   0268
L_530C:
        MVI@    R4,     R0                      ; 530C   02A0
        MVO@    R0,     R5                      ; 530D   0268
        MVI@    R4,     R0                      ; 530E   02A0
        MVO@    R0,     R5                      ; 530F   0268
        MVI@    R4,     R0                      ; 5310   02A0
        MVO@    R0,     R5                      ; 5311   0268
        DECR    R1                              ; 5312   0011
        BNEQ    L_5302                          ; 5313   022C 0012
        PULR    R7                              ; 5315   02B7

        DECLE   $0275,  $0003,  $0004           ; 5316   0275 0003 0004

        CMPR    R1,     R0                      ; 5319   0148
        SUB@    R6,     R0                      ; 531A   0330
        MVII    #$0020, R0                      ; 531B   02B8 0020
        CLRR    R4                              ; 531D   01E4
        MVO     R4,     G_010F                  ; 531E   0244 010F

        JSR     R5,     X_FILL_ZERO             ; 5320   0004 0114 0338
        DECLE   $0004                           ; 5323   0004

        CMPR    R1,     R0                      ; 5324   0148
        CMP@    R2,     R0                      ; 5325   0350
        MVII    #$0079, R0                      ; 5326   02B8 0079
        MVO     R0,     .ISRVEC.0               ; 5328   0240 0100
        MVII    #$0049, R0                      ; 532A   02B8 0049
        MVO     R0,     .ISRVEC.1               ; 532C   0240 0101
        EIS                                     ; 532E   0002
        PULR    R7                              ; 532F   02B7

        PSHR    R5                              ; 5330   0275
        CLRR    R0                              ; 5331   01C0
        MVO     R0,     .STIC.HDLY              ; 5332   0240 0030
        MVO     R0,     .STIC.VDLY              ; 5334   0240 0031
        SDBD                                    ; 5336   0001
        MVII    #$503A, R4                      ; 5337   02BC 003A 0050
        MVI@    R4,     R0                      ; 533A   02A0
        MVO     R0,     G_0105                  ; 533B   0240 0105
        MVII    #$0021, R1                      ; 533D   02B9 0021
        TSTR    R0                              ; 533F   0080
        BEQ     L_5344                          ; 5340   0204 0002

        MVO@    R0,     R1                      ; 5342   0248
        INCR    R7                              ; 5343   000F

L_5344:
        MVI@    R1,     R0                      ; 5344   0288
L_5345:
        MVII    #$0028, R1                      ; 5345   02B9 0028
        MVII    #$0005, R0                      ; 5347   02B8 0005

        JSR     R5,     .EXEC.730               ; 5349   0004 0114 0330

        MVI@    R4,     R0                      ; 534C   02A0
        MVO     R0,     .STIC.EDGE              ; 534D   0240 0032
        PULR    R7                              ; 534F   02B7

        PSHR    R5                              ; 5350   0275
        MVII    #$0007, R0                      ; 5351   02B8 0007
        MVII    #$0348, R1                      ; 5353   02B9 0348
        SDBD                                    ; 5355   0001
        MVII    #$57C2, R4                      ; 5356   02BC 00C2 0057
        TSTR    R0                              ; 5359   0080
        BEQ     L_536A                          ; 535A   0204 000E

        JSR     R5,     .EXEC.730               ; 535C   0004 0114 0330

        MVII    #$0007, R0                      ; 535F   02B8 0007
        MVII    #$015D, R5                      ; 5361   02BD 015D
L_5363:
        MVI@    R4,     R1                      ; 5363   02A1
        MVO@    R1,     R5                      ; 5364   0269
        MVI@    R4,     R1                      ; 5365   02A1
        MVO@    R1,     R5                      ; 5366   0269
        DECR    R0                              ; 5367   0010
        BNEQ    L_5363                          ; 5368   022C 0006

L_536A:
        SDBD                                    ; 536A   0001
        MVII    #$6311, R4                      ; 536B   02BC 0011 0063
        MVI@    R4,     R1                      ; 536E   02A1
        SDBD                                    ; 536F   0001
        ADDI    #$3800, R1                      ; 5370   02F9 0000 0038
        MVI@    R4,     R0                      ; 5373   02A0

        JSR     R5,     .EXEC.730               ; 5374   0004 0114 0330

        PULR    R7                              ; 5377   02B7

        MVII    #$0106, R4                      ; 5378   02BC 0106
        B       L_5382                          ; 537A   0200 0006

        MVII    #$0108, R4                      ; 537C   02BC 0108
        B       L_5382                          ; 537E   0200 0002

        MVII    #$010A, R4                      ; 5380   02BC 010A
L_5382:
        MVI@    R5,     R0                      ; 5382   02A8
        MVO@    R0,     R4                      ; 5383   0260
        MVI@    R5,     R0                      ; 5384   02A8
        MVO@    R0,     R4                      ; 5385   0260
        MOVR    R5,     R7                      ; 5386   00AF

        DECR    R2                              ; 5387   0012
        INCR    R7                              ; 5388   000F

        CLRR    R2                              ; 5389   01D2
L_538A:
        PSHR    R5                              ; 538A   0275
L_538B:
        MVII    #$0002, R1                      ; 538B   02B9 0002
        DECLE   $0004,  $0148,  $03B7           ; 538D   0004 0148 03B7

        SDBD                                    ; 5390   0001
        MVI@    R4,     R0                      ; 5391   02A0
        MVI@    R3,     R1                      ; 5392   0299
        SDBD                                    ; 5393   0001
        ANDI    #$0FF8, R1                      ; 5394   03B9 00F8 000F
        XORR    R0,     R1                      ; 5397   01C1
        MVO@    R1,     R3                      ; 5398   0259
        ADDI    #$0008, R3                      ; 5399   02FB 0008
L_539B:
        MVII    #$0003, R1                      ; 539B   02B9 0003
        DECLE   $0004,  $0148,  $03B7           ; 539D   0004 0148 03B7

        SUBI    #$0348, R3                      ; 53A0   033B 0348
        PSHR    R3                              ; 53A2   0273
        MVII    #$0171, R1                      ; 53A3   02B9 0171
        ADDR    R3,     R1                      ; 53A5   00D9
        MVO@    R1,     R1                      ; 53A6   0249
        SLL     R3,     1                       ; 53A7   004B
        ADDI    #$0126, R3                      ; 53A8   02FB 0126
        MVI@    R4,     R0                      ; 53AA   02A0
        MVO@    R0,     R3                      ; 53AB   0258
        ADDI    #$0010, R3                      ; 53AC   02FB 0010
        MVI@    R4,     R0                      ; 53AE   02A0
        MVO@    R0,     R3                      ; 53AF   0258
        PULR    R3                              ; 53B0   02B3
        ADDI    #$0319, R3                      ; 53B1   02FB 0319
        DECR    R2                              ; 53B3   0012
        BPL     L_538B                          ; 53B4   0223 002A
        PULR    R7                              ; 53B6   02B7

L_53B7:
        SDBD                                    ; 53B7   0001
        MVI@    R4,     R0                      ; 53B8   02A0
        MVO@    R0,     R3                      ; 53B9   0258
        ADDI    #$0008, R3                      ; 53BA   02FB 0008
        DECR    R1                              ; 53BC   0011
        BNEQ    L_53B7                          ; 53BD   022C 0007
        MOVR    R5,     R7                      ; 53BF   00AF

        MVI@    R4,     R0                      ; 53C0   02A0
        ANDI    #$00FF, R0                      ; 53C1   03B8 00FF
        ADDI    #$0007, R4                      ; 53C3   02FC 0007
        MVI@    R4,     R1                      ; 53C5   02A1
        ANDI    #$007F, R1                      ; 53C6   03B9 007F
        PSHR    R5                              ; 53C8   0275

        JSR     R5,     .EXEC.78C               ; 53C9   0004 0114 038C

        MOVR    R0,     R3                      ; 53CC   0083
        MOVR    R1,     R4                      ; 53CD   008C
        MOVR    R2,     R1                      ; 53CE   0091

        JSR     R5,     X_SQRT                  ; 53CF   0004 011C 0223

        PULR    R7                              ; 53D2   02B7

        MVII    #$0001, R0                      ; 53D3   02B8 0001
        INCR    R7                              ; 53D5   000F

        CLRR    R0                              ; 53D6   01C0
L_53D7:
        PSHR    R5                              ; 53D7   0275
        DECLE   $0270,  $0274,  $0271,  $0004   ; 53D8   0270 0274 0271 0004

        CMPR    R1,     R0                      ; 53DC   0148
        XOR     G_0098, R0                      ; 53DD   03C0 0098
        MOVR    R2,     R3                      ; 53DF   0093
        PULR    R1                              ; 53E0   02B1
        PSHR    R1                              ; 53E1   0271

        JSR     R5,     X_MPY                   ; 53E2   0004 011C 01DC

        MOVR    R2,     R1                      ; 53E5   0091
        MOVR    R3,     R2                      ; 53E6   009A

        JSR     R5,     X_DIVR                  ; 53E7   0004 011C 01F8

        PULR    R1                              ; 53EA   02B1
        PSHR    R0                              ; 53EB   0270
        MOVR    R4,     R0                      ; 53EC   00A0
        MOVR    R1,     R4                      ; 53ED   008C

        JSR     R5,     X_MPY                   ; 53EE   0004 011C 01DC

        MOVR    R2,     R1                      ; 53F1   0091
        MOVR    R3,     R2                      ; 53F2   009A

        JSR     R5,     X_DIVR                  ; 53F3   0004 011C 01F8

        PULR    R1                              ; 53F6   02B1
        PULR    R2                              ; 53F7   02B2
        PULR    R5                              ; 53F8   02B5
        SUBI    #$0318, R2                      ; 53F9   033A 0318
        PSHR    R2                              ; 53FB   0272
        SLL     R2,     1                       ; 53FC   004A
        ADDI    #$0126, R2                      ; 53FD   02FA 0126
        MVO@    R1,     R2                      ; 53FF   0251
        ADDI    #$0010, R2                      ; 5400   02FA 0010
        MVO@    R0,     R2                      ; 5402   0250
        TSTR    R5                              ; 5403   00AD
        BEQ     L_5429                          ; 5404   0204 0023

        MOVR    R4,     R2                      ; 5406   00A2
        MOVR    R3,     R1                      ; 5407   0099
        CMPI    #$007F, R1                      ; 5408   0379 007F
        BGT     L_5412                          ; 540A   020E 0006

        SWAP    R1,     1                       ; 540C   0041

        JSR     R5,     X_DIVR                  ; 540D   0004 011C 01F8

        B       L_5416                          ; 5410   0200 0004

L_5412:
        JSR     R5,     X_DIVR                  ; 5412   0004 011C 01F8

        SWAP    R0,     1                       ; 5415   0040
L_5416:
        MVI     G_010C, R1                      ; 5416   0281 010C
        TSTR    R1                              ; 5418   0089
        BEQ     L_541F                          ; 5419   0204 0004

L_541B:
        SLR     R0,     1                       ; 541B   0060
        DECR    R1                              ; 541C   0011
        BNEQ    L_541B                          ; 541D   022C 0003

L_541F:
        TSTR    R0                              ; 541F   0080
        BNEQ    L_5424                          ; 5420   020C 0002

        MVII    #$0001, R0                      ; 5422   02B8 0001
L_5424:
        PULR    R2                              ; 5424   02B2
        ADDI    #$0340, R2                      ; 5425   02FA 0340
        MVO@    R0,     R2                      ; 5427   0250
        INCR    R7                              ; 5428   000F

L_5429:
        PULR    R2                              ; 5429   02B2
L_542A:
        PULR    R7                              ; 542A   02B7

        DECLE   $0275,  $0004                   ; 542B   0275 0004

        CMPR    R1,     R4                      ; 542D   014C
        XORR    R7,     R5                      ; 542E   01FD
        ANDI    #$001B, R0                      ; 542F   03B8 001B
        MVO     R0,     .PSG0.chan_enable       ; 5431   0240 01F8
        MVII    #$00FF, R0                      ; 5433   02B8 00FF
        MVO     R0,     .PSG0.chn_c_lo          ; 5435   0240 01F2
        MVO     R0,     .PSG0.chn_c_hi          ; 5437   0240 01F6
        MVII    #$0007, R0                      ; 5439   02B8 0007
        MVO     R0,     .PSG0.chn_c_vol         ; 543B   0240 01FD
        B       L_55E7                          ; 543D   0200 01A8

        DECLE   $0275,  $0004                   ; 543F   0275 0004

        CMPR    R1,     R4                      ; 5441   014C
        XORR    R6,     R4                      ; 5442   01F4
        ANDI    #$002D, R0                      ; 5443   03B8 002D
        MVO     R0,     .PSG0.chan_enable       ; 5445   0240 01F8
        CLRR    R0                              ; 5447   01C0
        MVO     R0,     .PSG0.noise             ; 5448   0240 01F9
        MVO     R0,     G_0181                  ; 544A   0240 0181
        NEGR    R0                              ; 544C   0020
        MVO     R0,     .PSG0.chn_b_lo          ; 544D   0240 01F1
        MVII    #$000F, R0                      ; 544F   02B8 000F
        MVO     R0,     .PSG0.chn_b_hi          ; 5451   0240 01F5
        MVO     R0,     .PSG0.chn_b_vol         ; 5453   0240 01FC
        INCR    R7                              ; 5455   000F

        PSHR    R5                              ; 5456   0275
L_5457:
        MOVR    R7,     R3                      ; 5457   00BB
        MVI     G_0181, R0                      ; 5458   0280 0181
        TSTR    R0                              ; 545A   0080
        BNEQ    L_5471                          ; 545B   020C 0014

        MVI     .PSG0.chn_b_vol,R0              ; 545D   0280 01FC
        ANDI    #$000F, R0                      ; 545F   03B8 000F
        TSTR    R0                              ; 5461   0080
        BEQ     L_55E7                          ; 5462   0204 0183

        DECR    R0                              ; 5464   0010
        MVO     R0,     .PSG0.chn_b_vol         ; 5465   0240 01FC
        MVI     .PSG0.chn_b_lo,R0               ; 5467   0280 01F1
        SUBI    #$0010, R0                      ; 5469   0338 0010
        MVO     R0,     .PSG0.chn_b_lo          ; 546B   0240 01F1
        MVII    #$0003, R0                      ; 546D   02B8 0003
        MVO     R0,     G_0181                  ; 546F   0240 0181
L_5471:
        SUBI    #$0002, R3                      ; 5471   033B 0002
        MVO@    R3,     R4                      ; 5473   0263
        SWAP    R3,     1                       ; 5474   0043
        MVO@    R3,     R4                      ; 5475   0263
        PULR    R7                              ; 5476   02B7

        DECLE   $0275,  $0004                   ; 5477   0275 0004

        CMPR    R1,     R4                      ; 5479   014C
        XORR    R7,     R5                      ; 547A   01FD
        ANDI    #$003B, R0                      ; 547B   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 547D   0240 01F8
        CLRR    R0                              ; 547F   01C0
        MVO     R0,     G_0182                  ; 5480   0240 0182
        MVO     R0,     .PSG0.chn_c_hi          ; 5482   0240 01F6
        MVO     R0,     .PSG0.envlp_hi          ; 5484   0240 01F7
        MVII    #$006A, R0                      ; 5486   02B8 006A
        MVO     R0,     .PSG0.envlp_lo          ; 5488   0240 01F3
        MVO     R0,     .PSG0.envelope          ; 548A   0240 01FA
        MVII    #$0030, R0                      ; 548C   02B8 0030
        MVO     R0,     .PSG0.chn_c_vol         ; 548E   0240 01FD
        MVII    #$001F, R0                      ; 5490   02B8 001F
        MVO     R0,     .PSG0.chn_c_lo          ; 5492   0240 01F2
        INCR    R7                              ; 5494   000F

        PSHR    R5                              ; 5495   0275
L_5496:
        MOVR    R7,     R3                      ; 5496   00BB
        MVI     G_0182, R0                      ; 5497   0280 0182
        TSTR    R0                              ; 5499   0080
        BNEQ    L_54AD                          ; 549A   020C 0011

        MVI     G_01C6, R0                      ; 549C   0280 01C6
        TSTR    R0                              ; 549E   0080
        BNEQ    L_54A4                          ; 549F   020C 0003

        MVII    #$0030, R0                      ; 54A1   02B8 0030
        INCR    R7                              ; 54A3   000F

L_54A4:
        CLRR    R0                              ; 54A4   01C0
L_54A5:
        MVO     R0,     G_01C6                  ; 54A5   0240 01C6
        MVO     R0,     .PSG0.chn_c_vol         ; 54A7   0240 01FD
        MVII    #$0014, R0                      ; 54A9   02B8 0014
        MVO     R0,     G_0182                  ; 54AB   0240 0182
L_54AD:
        SUBI    #$0002, R3                      ; 54AD   033B 0002
        MVO@    R3,     R4                      ; 54AF   0263
        SWAP    R3,     1                       ; 54B0   0043
        MVO@    R3,     R4                      ; 54B1   0263
        PULR    R7                              ; 54B2   02B7

        DECLE   $0275,  $0004                   ; 54B3   0275 0004

        CMPR    R1,     R4                      ; 54B5   014C
        XORR    R5,     R3                      ; 54B6   01EB
        ANDI    #$003E, R0                      ; 54B7   03B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 54B9   0240 01F8
        MVII    #$000D, R0                      ; 54BB   02B8 000D
        MVO     R0,     .PSG0.chn_a_vol         ; 54BD   0240 01FB
        MVII    #$0001, R0                      ; 54BF   02B8 0001
        MVO     R0,     .PSG0.chn_a_hi          ; 54C1   0240 01F4
        MVII    #$00FF, R0                      ; 54C3   02B8 00FF
        MVO     R0,     .PSG0.chn_a_lo          ; 54C5   0240 01F0
        MVII    #$0001, R0                      ; 54C7   02B8 0001
        MVO     R0,     G_0180                  ; 54C9   0240 0180
        INCR    R7                              ; 54CB   000F

        PSHR    R5                              ; 54CC   0275
L_54CD:
        MVI     G_0180, R0                      ; 54CD   0280 0180
        TSTR    R0                              ; 54CF   0080
        BNEQ    L_54E0                          ; 54D0   020C 000E

        MVI     .PSG0.chn_a_lo,R0               ; 54D2   0280 01F0
        CMPI    #$0012, R0                      ; 54D4   0378 0012
        BLT     L_54F4                          ; 54D6   0205 001C

        SUBI    #$0012, R0                      ; 54D8   0338 0012
        MVO     R0,     .PSG0.chn_a_lo          ; 54DA   0240 01F0
        MVII    #$0001, R0                      ; 54DC   02B8 0001
        MVO     R0,     G_0180                  ; 54DE   0240 0180
L_54E0:
        SDBD                                    ; 54E0   0001
        MVII    #$4CCC, R0                      ; 54E1   02B8 00CC 004C
        MVO@    R0,     R4                      ; 54E4   0260
        SWAP    R0,     1                       ; 54E5   0040
        MVO@    R0,     R4                      ; 54E6   0260
        PULR    R7                              ; 54E7   02B7

        PSHR    R5                              ; 54E8   0275
        MVI     G_0180, R0                      ; 54E9   0280 0180
        TSTR    R0                              ; 54EB   0080
        BNEQ    L_54FC                          ; 54EC   020C 000E

        MVI     .PSG0.chn_a_lo,R0               ; 54EE   0280 01F0
        CMPI    #$00DA, R0                      ; 54F0   0378 00DA
        BGT     L_5504                          ; 54F2   020E 0010

L_54F4:
        ADDI    #$0012, R0                      ; 54F4   02F8 0012
        MVO     R0,     .PSG0.chn_a_lo          ; 54F6   0240 01F0
        MVII    #$0001, R0                      ; 54F8   02B8 0001
        MVO     R0,     G_0180                  ; 54FA   0240 0180
L_54FC:
        SDBD                                    ; 54FC   0001
        MVII    #$4CE8, R0                      ; 54FD   02B8 00E8 004C
        MVO@    R0,     R4                      ; 5500   0260
        SWAP    R0,     1                       ; 5501   0040
        MVO@    R0,     R4                      ; 5502   0260
        PULR    R7                              ; 5503   02B7

L_5504:
        CLRR    R0                              ; 5504   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 5505   0240 01FB
        B       L_55E7                          ; 5507   0200 00DE

        DECLE   $0275,  $0004                   ; 5509   0275 0004

        CMPR    R1,     R4                      ; 550B   014C
        XORR    R7,     R5                      ; 550C   01FD
        ANDI    #$003B, R0                      ; 550D   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 550F   0240 01F8
        MVII    #$000F, R0                      ; 5511   02B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 5513   0240 01FD
        CLRR    R0                              ; 5515   01C0
        MVO     R0,     .PSG0.chn_c_hi          ; 5516   0240 01F6
        INCR    R0                              ; 5518   0008
        MVO     R0,     G_0182                  ; 5519   0240 0182
        MVII    #$0020, R0                      ; 551B   02B8 0020
        MVO     R0,     .PSG0.chn_c_lo          ; 551D   0240 01F2
        INCR    R7                              ; 551F   000F

        PSHR    R5                              ; 5520   0275
L_5521:
        MOVR    R7,     R3                      ; 5521   00BB
        MVI     G_0182, R2                      ; 5522   0282 0182
        DECR    R2                              ; 5524   0012
        BPL     L_552E                          ; 5525   0203 0007

        MVI     .PSG0.chn_c_lo,R0               ; 5527   0280 01F2
        INCR    R0                              ; 5529   0008
        MVO     R0,     .PSG0.chn_c_lo          ; 552A   0240 01F2
        MVII    #$0002, R2                      ; 552C   02BA 0002
L_552E:
        MVO     R2,     G_0182                  ; 552E   0242 0182
        SUBI    #$0002, R3                      ; 5530   033B 0002
        MVO@    R3,     R4                      ; 5532   0263
        SWAP    R3,     1                       ; 5533   0043
        MVO@    R3,     R4                      ; 5534   0263
        PULR    R7                              ; 5535   02B7

        DECLE   $0275,  $0004                   ; 5536   0275 0004

        CMPR    R1,     R4                      ; 5538   014C
        XORR    R7,     R5                      ; 5539   01FD
        ANDI    #$001B, R0                      ; 553A   03B8 001B
        MVO     R0,     .PSG0.chan_enable       ; 553C   0240 01F8
        CLRR    R0                              ; 553E   01C0
        MVO     R0,     .PSG0.envelope          ; 553F   0240 01FA
        INCR    R0                              ; 5541   0008
        MVO     R0,     G_0182                  ; 5542   0240 0182
        INCR    R0                              ; 5544   0008
        MVO     R0,     .PSG0.noise             ; 5545   0240 01F9
        MVO     R0,     .PSG0.chn_c_hi          ; 5547   0240 01F6
        NEGR    R0                              ; 5549   0020
        MVO     R0,     .PSG0.chn_c_lo          ; 554A   0240 01F2
        MVII    #$0030, R0                      ; 554C   02B8 0030
        MVO     R0,     .PSG0.envlp_hi          ; 554E   0240 01F7
        MVO     R0,     .PSG0.chn_c_vol         ; 5550   0240 01FD
        INCR    R7                              ; 5552   000F

        PSHR    R5                              ; 5553   0275
L_5554:
        MOVR    R7,     R3                      ; 5554   00BB
        MVI     G_0182, R0                      ; 5555   0280 0182
        TSTR    R0                              ; 5557   0080
        BNEQ    L_5563                          ; 5558   020C 0009

        INCR    R0                              ; 555A   0008
        MVO     R0,     G_0182                  ; 555B   0240 0182
        MVI     .PSG0.chn_c_lo,R0               ; 555D   0280 01F2
        SUBI    #$0020, R0                      ; 555F   0338 0020
        MVO     R0,     .PSG0.chn_c_lo          ; 5561   0240 01F2
L_5563:
        SUBI    #$0002, R3                      ; 5563   033B 0002
        MVO@    R3,     R4                      ; 5565   0263
        SWAP    R3,     1                       ; 5566   0043
        MVO@    R3,     R4                      ; 5567   0263
        PULR    R7                              ; 5568   02B7

        DECLE   $0275,  $0004                   ; 5569   0275 0004

        CMPR    R1,     R4                      ; 556B   014C
        XORR    R6,     R4                      ; 556C   01F4
        ANDI    #$003D, R0                      ; 556D   03B8 003D
        MVO     R0,     .PSG0.chan_enable       ; 556F   0240 01F8
        MVII    #$000F, R0                      ; 5571   02B8 000F
        MVO     R0,     .PSG0.chn_b_lo          ; 5573   0240 01F1
        CLRR    R0                              ; 5575   01C0
        MVO     R0,     .PSG0.chn_b_hi          ; 5576   0240 01F5
        MVO     R0,     .PSG0.envlp_hi          ; 5578   0240 01F7
        MVII    #$0070, R0                      ; 557A   02B8 0070
L_557C:
        MVO     R0,     .PSG0.envlp_lo          ; 557C   0240 01F3
        MVII    #$000A, R0                      ; 557E   02B8 000A
        MVO     R0,     .PSG0.envelope          ; 5580   0240 01FA
        MVII    #$0030, R0                      ; 5582   02B8 0030
        MVO     R0,     .PSG0.chn_b_vol         ; 5584   0240 01FC
        MVII    #$0014, R0                      ; 5586   02B8 0014
        MVO     R0,     G_0181                  ; 5588   0240 0181
        INCR    R7                              ; 558A   000F

        PSHR    R5                              ; 558B   0275
L_558C:
        MOVR    R7,     R3                      ; 558C   00BB
        DECLE   $0280,  $0181,  $0080,  $0204   ; 558D   0280 0181 0080 0204
        DECLE   $000D                           ; 5591   000D

        MVII    #$0020, R0                      ; 5592   02B8 0020

        JSR     R5,     X_RAND1                 ; 5594   0004 0114 027D

        MVO     R0,     .PSG0.chn_b_lo          ; 5597   0240 01F1
        SUBI    #$0002, R3                      ; 5599   033B 0002
        MVO@    R3,     R4                      ; 559B   0263
        SWAP    R3,     1                       ; 559C   0043
        MVO@    R3,     R4                      ; 559D   0263
        PULR    R7                              ; 559E   02B7

        DECLE   $0004                           ; 559F   0004

        CMPR    R1,     R4                      ; 55A0   014C
        XORR    R6,     R4                      ; 55A1   01F4
        MVO     R0,     .PSG0.chan_enable       ; 55A2   0240 01F8
        B       L_55E7                          ; 55A4   0200 0041

        DECLE   $0275,  $0004                   ; 55A6   0275 0004

        CMPR    R1,     R4                      ; 55A8   014C
        XORR    R5,     R3                      ; 55A9   01EB
        ANDI    #$0036, R0                      ; 55AA   03B8 0036
        MVO     R0,     .PSG0.chan_enable       ; 55AC   0240 01F8
        MVII    #$00FF, R0                      ; 55AE   02B8 00FF
        MVO     R0,     .PSG0.chn_a_lo          ; 55B0   0240 01F0
        MVII    #$000E, R0                      ; 55B2   02B8 000E
        MVO     R0,     .PSG0.chn_a_hi          ; 55B4   0240 01F4
        MVO     R0,     .PSG0.chn_a_vol         ; 55B6   0240 01FB
        MVO     R0,     G_0180                  ; 55B8   0240 0180
        MVI     G_01BC, R0                      ; 55BA   0280 01BC
        TSTR    R0                              ; 55BC   0080
        BNEQ    L_55D0                          ; 55BD   020C 0011
        INCR    R7                              ; 55BF   000F

        PSHR    R5                              ; 55C0   0275
L_55C1:
        MOVR    R7,     R1                      ; 55C1   00B9
        MVI     G_0180, R0                      ; 55C2   0280 0180
        TSTR    R0                              ; 55C4   0080
        BEQ     L_55CD                          ; 55C5   0204 0006

        SUBI    #$0002, R1                      ; 55C7   0339 0002
        MVO@    R1,     R4                      ; 55C9   0261
        SWAP    R1,     1                       ; 55CA   0041
        MVO@    R1,     R4                      ; 55CB   0261
        PULR    R7                              ; 55CC   02B7

L_55CD:
        CLRR    R0                              ; 55CD   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 55CE   0240 01FB
L_55D0:
        B       L_55E7                          ; 55D0   0200 0015

        PSHR    R5                              ; 55D2   0275
        PSHR    R4                              ; 55D3   0274

        JSR     R5,     .EXEC.A83               ; 55D4   0004 0118 0283

        MVII    #$003F, R0                      ; 55D7   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 55D9   0240 01F8
        MVII    #$0106, R4                      ; 55DB   02BC 0106
        MVII    #$0006, R3                      ; 55DD   02BB 0006
        CLRR    R0                              ; 55DF   01C0
L_55E0:
        MVO@    R0,     R4                      ; 55E0   0260
        DECR    R3                              ; 55E1   0013
        TSTR    R3                              ; 55E2   009B
        BNEQ    L_55E0                          ; 55E3   022C 0004

        PULR    R4                              ; 55E5   02B4
        PULR    R7                              ; 55E6   02B7

L_55E7:
        CLRR    R0                              ; 55E7   01C0
        MVO@    R0,     R4                      ; 55E8   0260
        MVO@    R0,     R4                      ; 55E9   0260
        PULR    R7                              ; 55EA   02B7

        CLRR    R0                              ; 55EB   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 55EC   0240 01FB
        MVI     .PSG0.chan_enable,R0            ; 55EE   0280 01F8
        MVII    #$0009, R1                      ; 55F0   02B9 0009
        B       L_5604                          ; 55F2   0200 0010

        CLRR    R0                              ; 55F4   01C0
        MVO     R0,     .PSG0.chn_b_vol         ; 55F5   0240 01FC
        MVI     .PSG0.chan_enable,R0            ; 55F7   0280 01F8
        MVII    #$0012, R1                      ; 55F9   02B9 0012
        B       L_5604                          ; 55FB   0200 0007

        CLRR    R0                              ; 55FD   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 55FE   0240 01FD
        MVI     .PSG0.chan_enable,R0            ; 5600   0280 01F8
        MVII    #$0024, R1                      ; 5602   02B9 0024
L_5604:
        COMR    R1                              ; 5604   0019
        ANDR    R1,     R0                      ; 5605   0188
        COMR    R1                              ; 5606   0019
        XORR    R1,     R0                      ; 5607   01C8
        MOVR    R5,     R7                      ; 5608   00AF

        DECLE   $0275,  $0001,  $02BC,  $00BE   ; 5609   0275 0001 02BC 00BE
        DECLE   $0001,  $0001,  $02A0,  $0008   ; 560D   0001 0001 02A0 0008
        DECLE   $0204,  $0056                   ; 5611   0204 0056

        DECR    R0                              ; 5613   0010
        MOVR    R0,     R4                      ; 5614   0084
        MVI@    R4,     R1                      ; 5615   02A1
        CMPI    #$03FF, R1                      ; 5616   0379 03FF
        BEQ     L_5654                          ; 5618   0204 003A

        MOVR    R1,     R2                      ; 561A   008A
        ANDI    #$0300, R1                      ; 561B   03B9 0300
        SWAP    R1,     1                       ; 561D   0041
        DECR    R1                              ; 561E   0011
        BMI     L_5664                          ; 561F   020B 0043

        DECR    R1                              ; 5621   0011
        BEQ     L_5645                          ; 5622   0204 0021

L_5624:
        DECR    R1                              ; 5624   0011
        DECLE   $0204,  $0014,  $02F8,  $0003   ; 5625   0204 0014 02F8 0003
        DECLE   $0004                           ; 5629   0004

        CMPR    R1,     R4                      ; 562A   014C
        MVO@    R5,     R5                      ; 562B   026D
        ANDI    #$00FF, R2                      ; 562C   03BA 00FF
        MVO     R2,     .PSG0.chn_a_hi          ; 562E   0242 01F4
        SLR     R2,     2                       ; 5630   0066
        SLR     R2,     2                       ; 5631   0066
        MVO     R2,     .PSG0.chn_a_vol         ; 5632   0242 01FB
        MVI@    R4,     R0                      ; 5634   02A0
        MVO     R0,     .PSG0.chn_a_lo          ; 5635   0240 01F0
        MVI@    R4,     R0                      ; 5637   02A0
        MVO     R0,     G_0180                  ; 5638   0240 0180
        PULR    R7                              ; 563A   02B7

        ANDI    #$00FF, R2                      ; 563B   03BA 00FF
        MVO     R2,     G_0180                  ; 563D   0242 0180
        MVI     G_01C4, R3                      ; 563F   0283 01C4
        MVO     R3,     .PSG0.chn_a_vol         ; 5641   0243 01FB
        B       L_564F                          ; 5643   0200 000A

L_5645:
        MVI     .PSG0.chn_a_vol,R3              ; 5645   0283 01FB
        MVO     R3,     G_01C4                  ; 5647   0243 01C4
        CLRR    R1                              ; 5649   01C9
        MVO     R1,     .PSG0.chn_a_vol         ; 564A   0241 01FB
        INCR    R1                              ; 564C   0009
        MVO     R1,     G_0180                  ; 564D   0241 0180
L_564F:
        INCR    R0                              ; 564F   0008
        DECLE   $0004                           ; 5650   0004

        CMPR    R1,     R4                      ; 5651   014C
        MVO@    R5,     R5                      ; 5652   026D
        PULR    R7                              ; 5653   02B7

L_5654:
        MVI     G_01BD, R0                      ; 5654   0280 01BD
        TSTR    R0                              ; 5656   0080
        BEQ     L_5664                          ; 5657   0204 000B

L_5659:
        SDBD                                    ; 5659   0001
        DECLE   $02B8,  $0048,  $004F,  $0004   ; 565A   02B8 0048 004F 0004

        CMPR    R1,     R4                      ; 565E   014C
        MVO@    R5,     R5                      ; 565F   026D
        CLRR    R0                              ; 5660   01C0
        MVO     R0,     G_01BD                  ; 5661   0240 01BD
        PULR    R7                              ; 5663   02B7

L_5664:
        CLRR    R0                              ; 5664   01C0
        DECLE   $0018,  $0004,  $014C,  $026D   ; 5665   0018 0004 014C 026D
        DECLE   $0004                           ; 5669   0004

        CMPR    R1,     R4                      ; 566A   014C
        XORR    R5,     R3                      ; 566B   01EB
        PULR    R7                              ; 566C   02B7

        PSHR    R5                              ; 566D   0275
        SDBD                                    ; 566E   0001
        MVII    #$01BE, R5                      ; 566F   02BD 00BE 0001
        MVO@    R0,     R5                      ; 5672   0268
        SWAP    R0,     1                       ; 5673   0040
        MVO@    R0,     R5                      ; 5674   0268
        PULR    R7                              ; 5675   02B7

        DECLE   $01E0,  $006B,  $0005,  $0200   ; 5676   01E0 006B 0005 0200
        DECLE   $01E0,  $0071,  $0005,  $0200   ; 567A   01E0 0071 0005 0200
        DECLE   $01E0,  $006B,  $0005,  $0200   ; 567E   01E0 006B 0005 0200

        XORR    R4,     R0                      ; 5682   01E0
        MOVR    R1,     R7                      ; 5683   008F

        DECLE   $0011,  $0200,  $01E0,  $00AA   ; 5684   0011 0200 01E0 00AA
        DECLE   $0005,  $0200,  $01E0,  $00BE   ; 5688   0005 0200 01E0 00BE
        DECLE   $0005,  $0200,  $01E0,  $00AA   ; 568C   0005 0200 01E0 00AA
        DECLE   $0005,  $0200,  $01E0           ; 5690   0005 0200 01E0

        ADDR    R2,     R6                      ; 5693   00D6
        DECR    R1                              ; 5694   0011
        B       L_5878                          ; 5695   0200 01E1

        DECLE   $001D,  $0005,  $0200,  $01E0   ; 5697   001D 0005 0200 01E0
        DECLE   $00FE,  $0005,  $0200,  $01E0   ; 569B   00FE 0005 0200 01E0
        DECLE   $00E2,  $0005,  $0200,  $01E0   ; 569F   00E2 0005 0200 01E0
        DECLE   $00D6,  $0011,  $0200,  $01E0   ; 56A3   00D6 0011 0200 01E0
        DECLE   $00BE,  $0005,  $0200,  $01E0   ; 56A7   00BE 0005 0200 01E0
        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56AB   00AA 0005 0200 01E0
        DECLE   $00BE,  $0005                   ; 56AF   00BE 0005

        B       L_5893                          ; 56B1   0200 01E0

        ADDR    R2,     R6                      ; 56B3   00D6
        DECR    R1                              ; 56B4   0011
        B       L_5898                          ; 56B5   0200 01E1

        DECLE   $001D,  $0005,  $0200,  $01E0   ; 56B7   001D 0005 0200 01E0
        DECLE   $00FE,  $0005,  $0200,  $01E0   ; 56BB   00FE 0005 0200 01E0
        DECLE   $00E2,  $0005,  $0200,  $01E0   ; 56BF   00E2 0005 0200 01E0
        DECLE   $00D6,  $0005,  $0200,  $01E0   ; 56C3   00D6 0005 0200 01E0
        DECLE   $00E2,  $0005,  $0200,  $01E0   ; 56C7   00E2 0005 0200 01E0
        DECLE   $00D6,  $0005,  $0200,  $01E0   ; 56CB   00D6 0005 0200 01E0
        DECLE   $00BE,  $0005,  $0200,  $01E0   ; 56CF   00BE 0005 0200 01E0
        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56D3   00AA 0005 0200 01E0
        DECLE   $00BE,  $0005,  $0200,  $01E0   ; 56D7   00BE 0005 0200 01E0
        DECLE   $00D6,  $0011,  $0200,  $01E0   ; 56DB   00D6 0011 0200 01E0
        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56DF   00AA 0005 0200 01E0
        DECLE   $00BE,  $0005,  $0200,  $01E0   ; 56E3   00BE 0005 0200 01E0
        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56E7   00AA 0005 0200 01E0

        MOVR    R4,     R0                      ; 56EB   00A0
        DECR    R1                              ; 56EC   0011
        B       L_58CF                          ; 56ED   0200 01E0

        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56EF   00AA 0005 0200 01E0
        DECLE   $00A0,  $0005,  $0200,  $01E0   ; 56F3   00A0 0005 0200 01E0
        DECLE   $00AA,  $0005,  $0200,  $01E0   ; 56F7   00AA 0005 0200 01E0

        MOVR    R7,     R6                      ; 56FB   00BE
        DECR    R1                              ; 56FC   0011
        B       L_58DF                          ; 56FD   0200 01E0
        MOVR    R2,     R7                      ; 56FF   0097

        DECLE   $0005,  $0200,  $01E0,  $008F   ; 5700   0005 0200 01E0 008F
        DECLE   $0005,  $0200,  $01E0,  $007F   ; 5704   0005 0200 01E0 007F
        DECLE   $0005,  $0200,  $01E0,  $008F   ; 5708   0005 0200 01E0 008F
        DECLE   $0005,  $0200,  $01E0,  $007F   ; 570C   0005 0200 01E0 007F
        DECLE   $0005,  $0200,  $01E0,  $0071   ; 5710   0005 0200 01E0 0071
        DECLE   $0005,  $0200,  $01E0,  $007F   ; 5714   0005 0200 01E0 007F
        DECLE   $0005,  $0200,  $01E0,  $0071   ; 5718   0005 0200 01E0 0071
        DECLE   $0005,  $0200,  $01E0,  $006B   ; 571C   0005 0200 01E0 006B
        DECLE   $0005,  $0200,  $01E0,  $0071   ; 5720   0005 0200 01E0 0071
        DECLE   $0005,  $0200,  $01E0,  $006B   ; 5724   0005 0200 01E0 006B
        DECLE   $0005,  $0200,  $01E0,  $005F   ; 5728   0005 0200 01E0 005F
        DECLE   $0005,  $0200,  $01E0,  $0071   ; 572C   0005 0200 01E0 0071
        DECLE   $0005,  $0200                   ; 5730   0005 0200

        XORR    R4,     R0                      ; 5732   01E0
        MOVR    R1,     R7                      ; 5733   008F

        DECLE   $0005,  $0200,  $01E0,  $007F   ; 5734   0005 0200 01E0 007F
        DECLE   $0005                           ; 5738   0005

        B       L_591B                          ; 5739   0200 01E0
        MOVR    R2,     R7                      ; 573B   0097

        DECLE   $0005                           ; 573C   0005

        B       L_591F                          ; 573D   0200 01E0
        MOVR    R1,     R7                      ; 573F   008F

        DECLE   $0005,  $0200,  $0305           ; 5740   0005 0200 0305

        B       L_5A4A                          ; 5743   0200 0305
        B       L_5A4C                          ; 5745   0200 0305

        DECLE   $0000,  $01E1,  $000D,  $0005   ; 5747   0000 01E1 000D 0005
        DECLE   $0200,  $01E0,  $00B4,  $0005   ; 574B   0200 01E0 00B4 0005
        DECLE   $0200,  $01E1,  $000D,  $0005   ; 574F   0200 01E1 000D 0005
        DECLE   $0200,  $01E0,  $00D6,  $0005   ; 5753   0200 01E0 00D6 0005

        B       L_5939                          ; 5757   0200 01E0

        MOVR    R6,     R4                      ; 5759   00B4
        INCR    R3                              ; 575A   000B
        B       L_593E                          ; 575B   0200 01E1

        DECLE   $001D,  $0005,  $0200,  $01E0   ; 575D   001D 0005 0200 01E0
        DECLE   $00B4,  $0005,  $0200,  $01E1   ; 5761   00B4 0005 0200 01E1
        DECLE   $001D,  $0005,  $0200,  $01E0   ; 5765   001D 0005 0200 01E0
        DECLE   $00F0,  $0005,  $0200,  $01E0   ; 5769   00F0 0005 0200 01E0
        DECLE   $00B4,  $001D,  $0100,  $0000   ; 576D   00B4 001D 0100 0000
        DECLE   $0007,  $03FF,  $01E0,  $00FE   ; 5771   0007 03FF 01E0 00FE
        DECLE   $0006,  $01E0,  $00E2,  $0006   ; 5775   0006 01E0 00E2 0006
        DECLE   $01E0,  $00D6,  $0006,  $01E1   ; 5779   01E0 00D6 0006 01E1
        DECLE   $001D,  $0006,  $01E0,  $00FE   ; 577D   001D 0006 01E0 00FE
        DECLE   $0006,  $01E0,  $00E2,  $0006   ; 5781   0006 01E0 00E2 0006
        DECLE   $01E0,  $00D6,  $0006,  $0200   ; 5785   01E0 00D6 0006 0200
        DECLE   $01E0,  $00FE,  $0005           ; 5789   01E0 00FE 0005

        XORR    R4,     R0                      ; 578C   01E0
        ADDR    R4,     R2                      ; 578D   00E2
        CLRC                                    ; 578E   0006
L_578F:
        XORR    R4,     R0                      ; 578F   01E0
        ADDR    R1,     R2                      ; 5790   00CA
        CLRC                                    ; 5791   0006
        XORR    R4,     R0                      ; 5792   01E0
        MOVR    R7,     R6                      ; 5793   00BE
        CLRC                                    ; 5794   0006
        XORR    R4,     R0                      ; 5795   01E0
        ADDR    R7,     R6                      ; 5796   00FE
        CLRC                                    ; 5797   0006
        XORR    R4,     R0                      ; 5798   01E0
        ADDR    R4,     R2                      ; 5799   00E2
        CLRC                                    ; 579A   0006
        XORR    R4,     R0                      ; 579B   01E0
        ADDR    R1,     R2                      ; 579C   00CA
        CLRC                                    ; 579D   0006
        XORR    R4,     R0                      ; 579E   01E0
        MOVR    R7,     R6                      ; 579F   00BE
        CLRC                                    ; 57A0   0006
        B       L_5983                          ; 57A1   0200 01E0

        DECLE   $00D6,  $0005                   ; 57A3   00D6 0005

        XORR    R4,     R0                      ; 57A5   01E0
        MOVR    R7,     R6                      ; 57A6   00BE
        CLRC                                    ; 57A7   0006
        XORR    R4,     R0                      ; 57A8   01E0
        MOVR    R5,     R2                      ; 57A9   00AA
        CLRC                                    ; 57AA   0006
        XORR    R4,     R0                      ; 57AB   01E0
        MOVR    R4,     R0                      ; 57AC   00A0
        CLRC                                    ; 57AD   0006
        XORR    R4,     R0                      ; 57AE   01E0
        MOVR    R5,     R2                      ; 57AF   00AA
        CLRC                                    ; 57B0   0006
        XORR    R4,     R0                      ; 57B1   01E0
        MOVR    R4,     R0                      ; 57B2   00A0
        CLRC                                    ; 57B3   0006
L_57B4:
        XORR    R4,     R0                      ; 57B4   01E0
        MOVR    R1,     R7                      ; 57B5   008F

        DECLE   $0006,  $01E0,  $007F,  $0006   ; 57B6   0006 01E0 007F 0006
        DECLE   $01E0,  $00A0,  $0006,  $01E0   ; 57BA   01E0 00A0 0006 01E0
        DECLE   $00BE,  $0006,  $01E0,  $00E2   ; 57BE   00BE 0006 01E0 00E2
        DECLE   $0006,  $01E0,  $00D6,  $0006   ; 57C2   0006 01E0 00D6 0006
        DECLE   $01E1,  $001D,  $0006,  $01E0   ; 57C6   01E1 001D 0006 01E0
        DECLE   $00D6,  $0006,  $01E0,  $00AA   ; 57CA   00D6 0006 01E0 00AA
        DECLE   $0006,  $01E0,  $00D6,  $000C   ; 57CE   0006 01E0 00D6 000C
        DECLE   $0000                           ; 57D2   0000

        XORR    R6,     R1                      ; 57D3   01F1
        INCR    R5                              ; 57D4   000D
        DECR    R4                              ; 57D5   0014
        XORR    R6,     R0                      ; 57D6   01F0
L_57D7:
        ADDR    R7,     R6                      ; 57D7   00FE
        DECLE   $001E,  $01F1,  $0094,  $000A   ; 57D8   001E 01F1 0094 000A
        DECLE   $01F1,  $007D,  $000A,  $01F1   ; 57DC   01F1 007D 000A 01F1
        DECLE   $0053,  $000A,  $01F1,  $00C5   ; 57E0   0053 000A 01F1 00C5
        DECLE   $000A,  $01F1,  $00FC,  $000A   ; 57E4   000A 01F1 00FC 000A
        DECLE   $01F1,  $007D,  $0028,  $0000   ; 57E8   01F1 007D 0028 0000

        SDBD                                    ; 57EC   0001
        MVII    #$4E76, R0                      ; 57ED   02B8 0076 004E
        B       L_5808                          ; 57F0   0200 0016

        SDBD                                    ; 57F2   0001
        MVII    #$4F48, R0                      ; 57F3   02B8 0048 004F
        B       L_5808                          ; 57F6   0200 0010

        SDBD                                    ; 57F8   0001
        MVII    #$4EFE, R0                      ; 57F9   02B8 00FE 004E
        B       L_5808                          ; 57FC   0200 000A

        SDBD                                    ; 57FE   0001
        MVII    #$4F73, R0                      ; 57FF   02B8 0073 004F
        B       L_5808                          ; 5802   0200 0004

        SDBD                                    ; 5804   0001
        MVII    #$4FD3, R0                      ; 5805   02B8 00D3 004F
L_5808:
        PSHR    R5                              ; 5808   0275
        DECLE   $0004,  $014C,  $026D,  $0004   ; 5809   0004 014C 026D 0004

        CMPR    R1,     R4                      ; 580D   014C
        XORR    R5,     R3                      ; 580E   01EB
        ANDI    #$003E, R0                      ; 580F   03B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 5811   0240 01F8
        MVO     R0,     G_01BD                  ; 5813   0240 01BD
        CLRR    R0                              ; 5815   01C0
        MVO     R0,     G_0180                  ; 5816   0240 0180
        INCR    R7                              ; 5818   000F

        PSHR    R5                              ; 5819   0275
L_581A:
        MVI     G_0180, R0                      ; 581A   0280 0180
        DECLE   $0080,  $020C,  $0005,  $0004   ; 581C   0080 020C 0005 0004
        DECLE   $014C,  $0209,  $02BC,  $0106   ; 5820   014C 0209 02BC 0106
        DECLE   $0001,  $02BD,  $00BE,  $0001   ; 5824   0001 02BD 00BE 0001
        DECLE   $0001,  $02A8,  $0008,  $020C   ; 5828   0001 02A8 0008 020C
        DECLE   $0005,  $0004                   ; 582C   0005 0004

        CMPR    R1,     R4                      ; 582E   014C
        XORR    R5,     R3                      ; 582F   01EB
        B       L_55E7                          ; 5830   0220 024A

        SDBD                                    ; 5832   0001
        MVII    #$5019, R0                      ; 5833   02B8 0019 0050
        MVO@    R0,     R4                      ; 5836   0260
        SWAP    R0,     1                       ; 5837   0040
        MVO@    R0,     R4                      ; 5838   0260
        PULR    R7                              ; 5839   02B7

        DECLE   $0001,  $000D,  $000D,  $000D   ; 583A   0001 000D 000D 000D
        DECLE   $000D,  $0008,  $0000,  $0001   ; 583E   000D 0008 0000 0001
        DECLE   $0052,  $0054,  $0004,  $0096   ; 5842   0052 0054 0004 0096
        DECLE   $0055,  $0001,  $0087,  $0055   ; 5846   0055 0001 0087 0055
        DECLE   $0023,  $0000,  $0058,  $003C   ; 584A   0023 0000 0058 003C
        DECLE   $009E,  $0056,  $0027           ; 584E   009E 0056 0027

        SLR     R3,     1                       ; 5851   0063
        RLC     R2,     2                       ; 5852   0056
        PSHR    R5                              ; 5853   0275

        JSR     R5,     L_5FB7                  ; 5854   0004 015C 03B7

        DIS                                     ; 5857   0003

        JSR     R5,     L_539B                  ; 5858   0004 0150 039B
        DECLE   $01C9,  $0004,  $015C,  $008E   ; 585B   01C9 0004 015C 008E

        MVII    #$0252, R4                      ; 585F   02BC 0252
        SDBD                                    ; 5861   0001
        MVII    #$3201, R3                      ; 5862   02BB 0001 0032

        JSR     R5,     X_PRINT_R5              ; 5865   0004 0118 007B
        STRING  "BEAUTY"                        ; 5868  
        DECLE   $0000                           ; 586E   0000

        MVII    #$0268, R4                      ; 586F   02BC 0268

        JSR     R5,     X_PRINT_R5              ; 5871   0004 0118 007B
        STRING  "AND"                           ; 5874   0041 004E 0044
        DECLE   $0000                           ; 5877   0000
L_5878:
        MVII    #$0271, R4                      ; 5878   02BC 0271

        JSR     R5,     X_PRINT_R5              ; 587A   0004 0118 007B
        STRING  "THE"                           ; 587D   0054 0048 0045
        DECLE   $0000                           ; 5880   0000

        MVII    #$0286, R4                      ; 5881   02BC 0286

        JSR     R5,     X_PRINT_R5              ; 5883   0004 0118 007B
        STRING  "BEAST"                         ; 5886  
        DECLE   $0000,  $0004                   ; 588B   0000 0004

        CMPR    R1,     R4                      ; 588D   014C
        XOR@    R5,     R4                      ; 588E   03EC

L_588F:
        JSR     R5,     L_557C                  ; 588F   0004 0154 017C

        DECR    R4                              ; 5892   0014
L_5893:
        MVII    #$0001, R1                      ; 5893   02B9 0001

        JSR     R5,     L_5FD0                  ; 5895   0004 015C 03D0

L_5898:
        MVII    #$0002, R1                      ; 5898   02B9 0002
        MVO     R1,     G_0189                  ; 589A   0241 0189

        JSR     R5,     L_557C                  ; 589C   0004 0154 017C

        DECR    R4                              ; 589F   0014
        CLRR    R1                              ; 58A0   01C9

        JSR     R5,     L_5FD0                  ; 58A1   0004 015C 03D0

        B       L_588F                          ; 58A4   0220 0016

        MVII    #$0044, R0                      ; 58A6   02B8 0044
        MVII    #$0183, R4                      ; 58A8   02BC 0183

        JSR     R5,     X_FILL_ZERO             ; 58AA   0004 0114 0338

        MVII    #$0006, R0                      ; 58AD   02B8 0006
        MVII    #$016B, R4                      ; 58AF   02BC 016B

        JSR     R5,     X_FILL_ZERO             ; 58B1   0004 0114 0338
        DECLE   $02B9,  $0005,  $0241,  $0348   ; 58B4   02B9 0005 0241 0348
        DECLE   $0001,  $02B9,  $00FF,  $00FF   ; 58B8   0001 02B9 00FF 00FF
        DECLE   $0241,  $035E,  $02B9,  $0001   ; 58BC   0241 035E 02B9 0001
        DECLE   $0241,  $0189,  $02B9,  $0003   ; 58C0   0241 0189 02B9 0003
        DECLE   $0241,  $018D,  $0004,  $014C   ; 58C4   0241 018D 0004 014C
        DECLE   $01D2,  $0004,  $015C,  $0384   ; 58C8   01D2 0004 015C 0384

        JSR     R5,     L_50D5                  ; 58CC   0004 0150 00D5
L_58CF:
        JSR     R5,     L_530C                  ; 58CF   0004 0150 030C
        DECLE   $0004,  $0358,  $02E3           ; 58D2   0004 0358 02E3

        PSHR    R5                              ; 58D5   0275
        DIS                                     ; 58D6   0003
        MVI     G_0190, R1                      ; 58D7   0281 0190

        JSR     R5,     L_52B6                  ; 58D9   0004 0150 02B6
        DECLE   $0281,  $0190,  $0001           ; 58DC   0281 0190 0001
L_58DF:
        ADDI    #$0038, R1                      ; 58DF   02F9 0038
        SLR     R2,     1                       ; 58E1   0062
        MVII    #$01C4, R4                      ; 58E2   02BC 01C4
        MVI@    R1,     R3                      ; 58E4   028B
        ADDI    #$003C, R4                      ; 58E5   02FC 003C

        JSR     R5,     L_51CC                  ; 58E7   0004 0150 01CC
        DECLE   $037C,  $02B4,  $022C,  $0008   ; 58EA   037C 02B4 022C 0008
        DECLE   $0280,  $018E,  $004C,  $0048   ; 58EE   0280 018E 004C 0048
        DECLE   $0240,  $018E,  $0280,  $018F   ; 58F2   0240 018E 0280 018F
        DECLE   $004C,  $0048,  $0240,  $018F   ; 58F6   004C 0048 0240 018F
        DECLE   $0280,  $0190,  $0080,  $020C   ; 58FA   0280 0190 0080 020C
        DECLE   $002D,  $01C9,  $02BC,  $02DD   ; 58FE   002D 01C9 02BC 02DD
        DECLE   $0261,  $0001,  $02B9,  $0000   ; 5902   0261 0001 02B9 0000
        DECLE   $0016,  $02BC,  $02ED,  $0261   ; 5906   0016 02BC 02ED 0261
        DECLE   $0001                           ; 590A   0001

        MVII    #$00BA, R1                      ; 590B   02B9 00BA
        INCR    R0                              ; 590D   0008
        MVO@    R1,     R4                      ; 590E   0261
        MVII    #$02DE, R4                      ; 590F   02BC 02DE
        SDBD                                    ; 5911   0001
        MVII    #$0600, R1                      ; 5912   02B9 0000 0006
        MVII    #$000F, R0                      ; 5915   02B8 000F

        JSR     R5,     X_FILL_MEM              ; 5917   0004 0114 0341
        DECLE   $0001                           ; 591A   0001
L_591B:
        MVII    #$0030, R1                      ; 591B   02B9 0030
        DECLE   $001A,  $0001                   ; 591D   001A 0001
L_591F:
        MVII    #$0040, R2                      ; 591F   02BA 0040
        COMR    R2                              ; 5921   001A
        MVII    #$02D0, R4                      ; 5922   02BC 02D0
        MVO@    R1,     R4                      ; 5924   0261
        MVO@    R2,     R4                      ; 5925   0262
        MVO@    R1,     R4                      ; 5926   0261
        ADDI    #$0011, R4                      ; 5927   02FC 0011
        MVO@    R1,     R4                      ; 5929   0261
        MVO@    R2,     R4                      ; 592A   0262
        MVO@    R1,     R4                      ; 592B   0261
        MVI     G_0190, R3                      ; 592C   0283 0190
        CMPI    #$000A, R3                      ; 592E   037B 000A
        BEQ     L_5937                          ; 5930   0204 0005

        MVII    #$005A, R2                      ; 5932   02BA 005A

        JSR     R5,     L_5659                  ; 5934   0004 0154 0259

L_5937:
        MVII    #$0092, R2                      ; 5937   02BA 0092

L_5939:
        JSR     R5,     L_5659                  ; 5939   0004 0154 0259

        MVII    #$00D4, R2                      ; 593C   02BA 00D4

L_593E:
        JSR     R5,     L_5624                  ; 593E   0004 0154 0224

        MVII    #$0002, R0                      ; 5941   02B8 0002
        MVO     R0,     G_01AC                  ; 5943   0240 01AC
        MVI     G_0190, R0                      ; 5945   0280 0190
        CMPI    #$000A, R0                      ; 5947   0378 000A
        BNEQ    L_598A                          ; 5949   020C 003F

        SDBD                                    ; 594B   0001
        MVII    #$1600, R1                      ; 594C   02B9 0000 0016
        MVII    #$020F, R4                      ; 594F   02BC 020F
L_5951:
        MVO@    R1,     R4                      ; 5951   0261
        ADDI    #$0013, R4                      ; 5952   02FC 0013
        CMPI    #$02F0, R4                      ; 5954   037C 02F0
        BNC     L_5951                          ; 5956   0229 0006

        MVII    #$003C, R0                      ; 5958   02B8 003C
        SDBD                                    ; 595A   0001
        MVII    #$3200, R1                      ; 595B   02B9 0000 0032
        MVII    #$0200, R4                      ; 595E   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5960   0004 0114 0341

        MVII    #$0008, R0                      ; 5963   02B8 0008
        SDBD                                    ; 5965   0001
        MVII    #$083C, R1                      ; 5966   02B9 003C 0008
        MVII    #$022E, R4                      ; 5969   02BC 022E

        JSR     R5,     X_FILL_MEM              ; 596B   0004 0114 0341

        MVII    #$0246, R4                      ; 596E   02BC 0246
        SDBD                                    ; 5970   0001
        MVII    #$0600, R1                      ; 5971   02B9 0000 0006
        MVO@    R1,     R4                      ; 5974   0261
        MVO@    R1,     R4                      ; 5975   0261
        MVO@    R1,     R4                      ; 5976   0261
        MVO@    R1,     R4                      ; 5977   0261
        MVII    #$000B, R0                      ; 5978   02B8 000B
        SDBD                                    ; 597A   0001
        MVII    #$286B, R1                      ; 597B   02B9 006B 0028
        MVII    #$027C, R4                      ; 597E   02BC 027C

        JSR     R5,     X_FILL_MEM              ; 5980   0004 0114 0341

L_5983:
        SDBD                                    ; 5983   0001
        DECLE   $02BC,  $008C,  $0051,  $0004   ; 5984   02BC 008C 0051 0004

        CMPR    R3,     R4                      ; 5988   015C
        XOR@    R3,     R4                      ; 5989   03DC
L_598A:
        EIS                                     ; 598A   0002
        PULR    R7                              ; 598B   02B7

        DECLE   $002C,  $003B,  $0068,  $0000   ; 598C   002C 003B 0068 0000
        DECLE   $0032,  $0067,  $0000,  $0032   ; 5990   0032 0067 0000 0032
        DECLE   $0054,  $0000,  $0032,  $0040   ; 5994   0054 0000 0032 0040
        DECLE   $002C,  $003B,  $002D,  $0024   ; 5998   002C 003B 002D 0024
        DECLE   $001F,  $0036,  $0000,  $0016   ; 599C   001F 0036 0000 0016
        DECLE   $004A,  $0000,  $0016,  $005E   ; 59A0   004A 0000 0016 005E
        DECLE   $0000,  $0032,  $004B,  $0000   ; 59A4   0000 0032 004B 0000
        DECLE   $0032,  $005F,  $002C,  $001F   ; 59A8   0032 005F 002C 001F
        DECLE   $0072,  $0024,  $001F,  $0073   ; 59AC   0072 0024 001F 0073
        DECLE   $0000,  $0032,  $0074,  $0058   ; 59B0   0000 0032 0074 0058
        DECLE   $000E,  $0071,  $0000           ; 59B4   000E 0071 0000

        GSWD    R2                              ; 59B7   0032
        MOVR    R6,     R0                      ; 59B8   00B0
        MOVR    R2,     R5                      ; 59B9   0095
        RSWD    R2                              ; 59BA   003A
        ADDR    R5,     R4                      ; 59BB   00EC
        MOVR    R3,     R5                      ; 59BC   009D
        RSWD    R2                              ; 59BD   003A
        ADDR    R3,     R7                      ; 59BE   00DF

        DECLE   $0000                           ; 59BF   0000

        GSWD    R2                              ; 59C0   0032
        MOVR    R4,     R3                      ; 59C1   00A3
        MOVR    R4,     R7                      ; 59C2   00A7

        RSWD    R2                              ; 59C3   003A
        INCR    R4                              ; 59C4   000C
        MOVR    R5,     R7                      ; 59C5   00AF

        DECLE   $003A,  $000D,  $0000,  $0000   ; 59C6   003A 000D 0000 0000
        DECLE   $0000,  $0000,  $0275,  $0274   ; 59CA   0000 0000 0275 0274
        DECLE   $0271,  $0273,  $03BB,  $000F   ; 59CE   0271 0273 03BB 000F
        DECLE   $0243,  $018E,  $0243,  $018F   ; 59D2   0243 018E 0243 018F
        DECLE   $00DC,  $0001,  $02B8,  $0063   ; 59D6   00DC 0001 02B8 0063
        DECLE   $001E,  $0001,  $02B9,  $0000   ; 59DA   001E 0001 02B9 0000
        DECLE   $0006,  $0001,  $02BA,  $0058   ; 59DE   0006 0001 02BA 0058
        DECLE   $000E,  $0004,  $0150,  $0286   ; 59E2   000E 0004 0150 0286

        ADDI    #$0026, R4                      ; 59E6   02FC 0026

        JSR     R5,     L_5234                  ; 59E8   0004 0150 0234
        BIDECLE $F801                           ; 59EB   0001 02F8
L_59ED:
        RRC     R3,     1                       ; 59ED   0073
        INCR    R0                              ; 59EE   0008
        MVO@    R0,     R4                      ; 59EF   0260
        SUBI    #$0027, R4                      ; 59F0   033C 0027

        JSR     R5,     L_5255                  ; 59F2   0004 0150 0255
        JSR     R5,     L_526D                  ; 59F5   0004 0150 026D

        MVII    #$0002, R2                      ; 59F8   02BA 0002
L_59FA:
        PSHR    R2                              ; 59FA   0272

        JSR     R5,     L_5244                  ; 59FB   0004 0150 0244
        DECLE   $0004,  $0150,  $0274           ; 59FE   0004 0150 0274

        JSR     R5,     L_525B                  ; 5A01   0004 0150 025B
        DECLE   $0004,  $0150,  $0274           ; 5A04   0004 0150 0274

        PULR    R2                              ; 5A07   02B2
        DECR    R2                              ; 5A08   0012
        BNEQ    L_59FA                          ; 5A09   022C 0010

        JSR     R5,     L_5244                  ; 5A0B   0004 0150 0244
        JSR     R5,     L_526D                  ; 5A0E   0004 0150 026D
        JSR     R5,     L_5255                  ; 5A11   0004 0150 0255
        JSR     R5,     L_525B                  ; 5A14   0004 0150 025B

        SDBD                                    ; 5A17   0001
        MVII    #$1E78, R0                      ; 5A18   02B8 0078 001E
        SDBD                                    ; 5A1B   0001
        MVII    #$1E80, R1                      ; 5A1C   02B9 0080 001E
        SDBD                                    ; 5A1F   0001
        MVII    #$1E88, R2                      ; 5A20   02BA 0088 001E

        JSR     R5,     L_528E                  ; 5A23   0004 0150 028E

        ADDI    #$0028, R4                      ; 5A26   02FC 0028

        JSR     R5,     L_5234                  ; 5A28   0004 0150 0234
        BIDECLE $F801                           ; 5A2B   0001 02F8

        ADDR    R0,     R0                      ; 5A2D   00C0
        INCR    R0                              ; 5A2E   0008
        MVO@    R0,     R4                      ; 5A2F   0260
        PULR    R3                              ; 5A30   02B3
        PULR    R1                              ; 5A31   02B1
        PULR    R4                              ; 5A32   02B4
        PULR    R7                              ; 5A33   02B7

        PSHR    R4                              ; 5A34   0274
        ADDI    #$0014, R4                      ; 5A35   02FC 0014
        CMPI    #$02F0, R4                      ; 5A37   037C 02F0
        BNC     L_5A3D                          ; 5A39   0209 0002

        SUBI    #$0014, R4                      ; 5A3B   033C 0014
L_5A3D:
        MVI@    R4,     R0                      ; 5A3D   02A0
        SDBD                                    ; 5A3E   0001
        ANDI    #$3600, R0                      ; 5A3F   03B8 0000 0036
        PULR    R4                              ; 5A42   02B4
        MOVR    R5,     R7                      ; 5A43   00AF

        DECLE   $0275,  $0001,  $02B8,  $006B   ; 5A44   0275 0001 02B8 006B
        DECLE   $001E,  $0001                   ; 5A48   001E 0001
L_5A4A:
        MVII    #$0000, R1                      ; 5A4A   02B9 0000
L_5A4C:
        CLRC                                    ; 5A4C   0006
        DECLE   $0001,  $02BA,  $0050,  $000E   ; 5A4D   0001 02BA 0050 000E
        DECLE   $0004,  $0150,  $0286,  $02B7   ; 5A51   0004 0150 0286 02B7
        DECLE   $02B3,  $0273,  $03BB,  $0080   ; 5A55   02B3 0273 03BB 0080
        DECLE   $0204,  $0011,  $0001,  $02B8   ; 5A59   0204 0011 0001 02B8
        DECLE   $006B,  $001E,  $0001,  $02B9   ; 5A5D   006B 001E 0001 02B9
        DECLE   $0000,  $0006,  $0001,  $02BA   ; 5A61   0000 0006 0001 02BA
        DECLE   $0058,  $000E,  $0275,  $0004   ; 5A65   0058 000E 0275 0004
        DECLE   $0150,  $0286                   ; 5A69   0150 0286

        PULR    R5                              ; 5A6B   02B5
        MOVR    R5,     R7                      ; 5A6C   00AF

        DECLE   $02B3,  $0273,  $0099,  $03BB   ; 5A6D   02B3 0273 0099 03BB
        DECLE   $0040,  $0204,  $0011,  $0001   ; 5A71   0040 0204 0011 0001
        DECLE   $02B8,  $006B,  $001E,  $0001   ; 5A75   02B8 006B 001E 0001
        DECLE   $02B9,  $004F,  $0008,  $0001   ; 5A79   02B9 004F 0008 0001
        DECLE   $02BA,  $0058,  $000E,  $0275   ; 5A7D   02BA 0058 000E 0275
        DECLE   $0004,  $0150,  $0286           ; 5A81   0004 0150 0286

        PULR    R5                              ; 5A84   02B5
        MOVR    R5,     R7                      ; 5A85   00AF

        CMPI    #$023C, R4                      ; 5A86   037C 023C
        BPL     L_5A8E                          ; 5A88   0203 0004

        SDBD                                    ; 5A8A   0001
        MVII    #$0600, R0                      ; 5A8B   02B8 0000 0006
L_5A8E:
        MVO@    R0,     R4                      ; 5A8E   0260
        ADDI    #$0013, R4                      ; 5A8F   02FC 0013
        MVO@    R1,     R4                      ; 5A91   0261
        ADDI    #$0013, R4                      ; 5A92   02FC 0013
        MVO@    R2,     R4                      ; 5A94   0262
        SUBI    #$0028, R4                      ; 5A95   033C 0028
        MVI     G_018F, R0                      ; 5A97   0280 018F
        INCR    R0                              ; 5A99   0008
        MVO     R0,     G_018F                  ; 5A9A   0240 018F
        MOVR    R5,     R7                      ; 5A9C   00AF

        SDBD                                    ; 5A9D   0001
        MVII    #$3AA7, R0                      ; 5A9E   02B8 00A7 003A
        SDBD                                    ; 5AA1   0001
        MVII    #$3AAF, R3                      ; 5AA2   02BB 00AF 003A
L_5AA5:
        MVI@    R4,     R2                      ; 5AA5   02A2
        TSTR    R2                              ; 5AA6   0092
        BEQ     L_5AB0                          ; 5AA7   0204 0007

        ADDI    #$0200, R2                      ; 5AA9   02FA 0200
        MVO@    R0,     R2                      ; 5AAB   0250
        INCR    R2                              ; 5AAC   000A
        MVO@    R3,     R2                      ; 5AAD   0253
        B       L_5AA5                          ; 5AAE   0220 000A
L_5AB0:
        MOVR    R5,     R7                      ; 5AB0   00AF

        DECLE   $0050,  $0026,  $0019,  $0049   ; 5AB1   0050 0026 0019 0049
        DECLE   $0000                           ; 5AB5   0000

        PSHR    R5                              ; 5AB6   0275
        PSHR    R1                              ; 5AB7   0271
        MVII    #$00F0, R0                      ; 5AB8   02B8 00F0
        SDBD                                    ; 5ABA   0001
        MVII    #$3200, R1                      ; 5ABB   02B9 0000 0032
        MVII    #$0200, R4                      ; 5ABE   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5AC0   0004 0114 0341
        DECLE   $02B1,  $0001,  $02BC,  $00B1   ; 5AC3   02B1 0001 02BC 00B1
        DECLE   $0052,  $0004,  $0150,  $029D   ; 5AC7   0052 0004 0150 029D

        INCR    R1                              ; 5ACB   0009
        CMPI    #$000D, R1                      ; 5ACC   0379 000D
        BPL     L_5AFE                          ; 5ACE   0203 002E

        SLL     R1,     2                       ; 5AD0   004D
        MOVR    R1,     R4                      ; 5AD1   008C
        SLL     R1,     2                       ; 5AD2   004D
        ADDR    R1,     R4                      ; 5AD3   00CC
        ADDI    #$0200, R4                      ; 5AD4   02FC 0200
        SDBD                                    ; 5AD6   0001
        MVII    #$3A9D, R0                      ; 5AD7   02B8 009D 003A
        SDBD                                    ; 5ADA   0001
        MVII    #$3A95, R1                      ; 5ADB   02B9 0095 003A

        JSR     R5,     L_52FF                  ; 5ADE   0004 0150 02FF

        SDBD                                    ; 5AE1   0001
        MVII    #$2A94, R0                      ; 5AE2   02B8 0094 002A
        SDBD                                    ; 5AE5   0001
        MVII    #$2A9C, R1                      ; 5AE6   02B9 009C 002A

        JSR     R5,     L_52FF                  ; 5AE9   0004 0150 02FF

        SDBD                                    ; 5AEC   0001
        MVII    #$2898, R0                      ; 5AED   02B8 0098 0028
        SDBD                                    ; 5AF0   0001
        MVII    #$2890, R1                      ; 5AF1   02B9 0090 0028

        JSR     R5,     L_52FF                  ; 5AF4   0004 0150 02FF

        MVII    #$0000, R0                      ; 5AF7   02B8 0000
L_5AF9:
        MVO@    R0,     R4                      ; 5AF9   0260
        CMPI    #$02F0, R4                      ; 5AFA   037C 02F0
        BNEQ    L_5AF9                          ; 5AFC   022C 0004
L_5AFE:
        PULR    R7                              ; 5AFE   02B7

        MVII    #$000A, R2                      ; 5AFF   02BA 000A
L_5B01:
        MVO@    R0,     R4                      ; 5B01   0260
        MVO@    R1,     R4                      ; 5B02   0261
        DECR    R2                              ; 5B03   0012
        BNEQ    L_5B01                          ; 5B04   022C 0004

        CMPI    #$02F0, R4                      ; 5B06   037C 02F0
        BMI     L_5B0B                          ; 5B08   020B 0001

        PULR    R5                              ; 5B0A   02B5
L_5B0B:
        MOVR    R5,     R7                      ; 5B0B   00AF

        PSHR    R5                              ; 5B0C   0275
        CLRR    R2                              ; 5B0D   01D2
L_5B0E:
        SDBD                                    ; 5B0E   0001
        MVII    #$537D, R5                      ; 5B0F   02BD 007D 0053
        MVII    #$0203, R4                      ; 5B12   02BC 0203
        CLRR    R3                              ; 5B14   01DB
        MVII    #$0017, R0                      ; 5B15   02B8 0017
        MVI     G_0190, R1                      ; 5B17   0281 0190
        CMPI    #$0002, R1                      ; 5B19   0379 0002
        BNC     L_5B2E                          ; 5B1B   0209 0011

        INCR    R4                              ; 5B1D   000C
        MVII    #$0008, R3                      ; 5B1E   02BB 0008
        MVII    #$000C, R0                      ; 5B20   02B8 000C
        CMPI    #$000A, R1                      ; 5B22   0379 000A
        BNEQ    L_5B2E                          ; 5B24   020C 0008

        ADDI    #$003D, R4                      ; 5B26   02FC 003D
        MVII    #$0018, R2                      ; 5B28   02BA 0018
L_5B2A:
        MVII    #$0010, R3                      ; 5B2A   02BB 0010
        MVII    #$0001, R0                      ; 5B2C   02B8 0001
L_5B2E:
        MVO     R3,     G_0194                  ; 5B2E   0243 0194
        DECLE   $0242,  $0195,  $0240,  $0196   ; 5B30   0242 0195 0240 0196
        DECLE   $02BB,  $0003,  $02BA,  $0005   ; 5B34   02BB 0003 02BA 0005
        DECLE   $0001,  $02A9,  $0261,  $0012   ; 5B38   0001 02A9 0261 0012
        DECLE   $022C,  $0005,  $02FC,  $000F   ; 5B3C   022C 0005 02FC 000F
        DECLE   $0013,  $022C,  $000C,  $02BB   ; 5B40   0013 022C 000C 02BB
        DECLE   $031F,  $0001,  $02BC,  $00AE   ; 5B44   031F 0001 02BC 00AE
        DECLE   $0067,  $02B9,  $0007,  $0004   ; 5B48   0067 02B9 0007 0004
        DECLE   $0150,  $0357,  $0004,  $0158   ; 5B4C   0150 0357 0004 0158
        DECLE   $0067,  $0004                   ; 5B50   0067 0004

        CMPR    R1,     R0                      ; 5B52   0148
        AND     .STIC.CS.3,R0                   ; 5B53   0380 002B
        SLL     R0,     2                       ; 5B55   004C
        PULR    R7                              ; 5B56   02B7

        SDBD                                    ; 5B57   0001
        MVII    #$0800, R0                      ; 5B58   02B8 0000 0008
        PSHR    R5                              ; 5B5B   0275
        PSHR    R0                              ; 5B5C   0270
        PSHR    R1                              ; 5B5D   0271

        JSR     R5,     L_5FEC                  ; 5B5E   0004 015C 03EC
        DECLE   $0004                           ; 5B61   0004

        CMPR    R1,     R0                      ; 5B62   0148
        AND@    R1,     R1                      ; 5B63   0389
        PULR    R4                              ; 5B64   02B4
        PULR    R2                              ; 5B65   02B2
        MVII    #$0318, R3                      ; 5B66   02BB 0318
        ADDR    R4,     R3                      ; 5B68   00E3
        MVI@    R3,     R1                      ; 5B69   0299
        SDBD                                    ; 5B6A   0001
        ANDI    #$F5FF, R1                      ; 5B6B   03B9 00FF 00F5
        XORR    R2,     R1                      ; 5B6E   01D1
        MVI     G_0194, R0                      ; 5B6F   0280 0194
        ADDR    R0,     R1                      ; 5B71   00C1
        MVII    #$0320, R3                      ; 5B72   02BB 0320
        ADDR    R4,     R3                      ; 5B74   00E3
        MVI@    R3,     R2                      ; 5B75   029A
        MVI     G_0195, R0                      ; 5B76   0280 0195
        ADDR    R0,     R2                      ; 5B78   00C2
        PULR    R5                              ; 5B79   02B5
        J       L_5E94                          ; 5B7A   0004 035C 0294

        DECR    R0                              ; 5B7D   0010
        INCR    R6                              ; 5B7E   000E
        COMR    R0                              ; 5B7F   0018
        INCR    R6                              ; 5B80   000E
        COMR    R6                              ; 5B81   001E
        INCR    R7                              ; 5B82   000F

        ADDR    R2,     R0                      ; 5B83   00D0
L_5B84:
        INCR    R6                              ; 5B84   000E
        DECLE   $000B,  $001A,  $0020,  $000E   ; 5B85   000B 001A 0020 000E
        DECLE   $0028,  $000E,  $00D8,  $002C   ; 5B89   0028 000E 00D8 002C
        DECLE   $00E0,  $000E,  $00E8,  $000E   ; 5B8D   00E0 000E 00E8 000E
        DECLE   $0058,  $000E,  $00F0,  $000E   ; 5B91   0058 000E 00F0 000E
        DECLE   $00F8,  $000E,  $0000           ; 5B95   00F8 000E 0000

        INCR    R7                              ; 5B98   000F

        SLLC    R0,     1                       ; 5B99   0058
L_5B9A:
        INCR    R6                              ; 5B9A   000E
        PSHR    R5                              ; 5B9B   0275
        MVII    #$0006, R1                      ; 5B9C   02B9 0006

        JSR     R5,     L_52B6                  ; 5B9E   0004 0150 02B6

        MVI     G_018D, R3                      ; 5BA1   0283 018D
        DECR    R3                              ; 5BA3   0013
        BMI     L_5BC1                          ; 5BA4   020B 001B

        CMPI    #$0007, R3                      ; 5BA6   037B 0007
        BNC     L_5BAC                          ; 5BA8   0209 0002

        MVII    #$0006, R3                      ; 5BAA   02BB 0006
L_5BAC:
        MVII    #$02C9, R4                      ; 5BAC   02BC 02C9
        DECLE   $0001,  $02BA,  $0009,  $0009   ; 5BAE   0001 02BA 0009 0009
        DECLE   $0001                           ; 5BB2   0001

        MVII    #$0011, R0                      ; 5BB3   02B8 0011
        INCR    R1                              ; 5BB5   0009
L_5BB6:
        DECR    R3                              ; 5BB6   0013
        BMI     L_5BC1                          ; 5BB7   020B 0008

        MVO@    R2,     R4                      ; 5BB9   0262
        ADDI    #$0013, R4                      ; 5BBA   02FC 0013
        MVO@    R0,     R4                      ; 5BBC   0260
        SUBI    #$0014, R4                      ; 5BBD   033C 0014
        B       L_5BB6                          ; 5BBF   0220 000A

L_5BC1:
        MVI     G_0191, R0                      ; 5BC1   0280 0191
        MOVR    R0,     R2                      ; 5BC3   0082
        TSTR    R0                              ; 5BC4   0080
        BEQ     L_5BEF                          ; 5BC5   0204 0028

        MVII    #$02E9, R4                      ; 5BC7   02BC 02E9
        MVII    #$0003, R1                      ; 5BC9   02B9 0003
        MVII    #$0003, R3                      ; 5BCB   02BB 0003

        JSR     R5,     X_PRNUM_RGT             ; 5BCD   0004 0118 00C5

        CMPI    #$0005, R2                      ; 5BD0   037A 0005
        BNC     L_5BEF                          ; 5BD2   0209 001B

        SUBI    #$0014, R4                      ; 5BD4   033C 0014
        CMPI    #$000A, R2                      ; 5BD6   037A 000A
        BPL     L_5BE5                          ; 5BD8   0203 000B

        JSR     R5,     X_PRINT_R5              ; 5BDA   0004 0118 007B
        STRING  "GREAT"                         ; 5BDD  
        DECLE   $0000                           ; 5BE2   0000

        B       L_5BEF                          ; 5BE3   0200 000A

L_5BE5:
        JSR     R5,     X_PRINT_R5              ; 5BE5   0004 0118 007B
        STRING  "SUPER!"                        ; 5BE8  
        DECLE   $0000                           ; 5BEE   0000
L_5BEF:
        MVI     G_0190, R3                      ; 5BEF   0283 0190
        INCR    R3                              ; 5BF1   000B
        SDBD                                    ; 5BF2   0001
        MVII    #$5431, R5                      ; 5BF3   02BD 0031 0054
        MVII    #$02E4, R4                      ; 5BF6   02BC 02E4
        SDBD                                    ; 5BF8   0001
        MVII    #$0802, R2                      ; 5BF9   02BA 0002 0008
        B       L_5C02                          ; 5BFC   0200 0004

L_5BFE:
        SDBD                                    ; 5BFE   0001
        MVII    #$0803, R2                      ; 5BFF   02BA 0003 0008
L_5C02:
        DECR    R3                              ; 5C02   0013
        BEQ     L_5BFE                          ; 5C03   0224 0006

        MVII    #$0003, R0                      ; 5C05   02B8 0003
L_5C07:
        MVI@    R5,     R1                      ; 5C07   02A9
        SLL     R1,     2                       ; 5C08   004D
        SLL     R1,     1                       ; 5C09   0049
        XORR    R2,     R1                      ; 5C0A   01D1
        CMPR    R2,     R1                      ; 5C0B   0151
        BNEQ    L_5C12                          ; 5C0C   020C 0004

        SDBD                                    ; 5C0E   0001
        XORI    #$0800, R1                      ; 5C0F   03F9 0000 0008
L_5C12:
        PSHR    R0                              ; 5C12   0270
        DECLE   $0274,  $0275,  $033C,  $0006   ; 5C13   0274 0275 033C 0006
        DECLE   $0378,  $0002,  $0001,  $02B8   ; 5C17   0378 0002 0001 02B8
        DECLE   $0000,  $0032,  $0204,  $0003   ; 5C1B   0000 0032 0204 0003
        DECLE   $0004,  $0150,  $0234,  $01C1   ; 5C1F   0004 0150 0234 01C1
        DECLE   $02B5                           ; 5C23   02B5

        PULR    R4                              ; 5C24   02B4
        PULR    R0                              ; 5C25   02B0
        MVO@    R1,     R4                      ; 5C26   0261
        DECR    R0                              ; 5C27   0010
        BNEQ    L_5C07                          ; 5C28   022C 0022

        SUBI    #$0017, R4                      ; 5C2A   033C 0017
        CMPI    #$0214, R4                      ; 5C2C   037C 0214
        BPL     L_5C02                          ; 5C2E   0223 002D
        PULR    R7                              ; 5C30   02B7

        DECLE   $0007,  $0027,  $0007,  $0007   ; 5C31   0007 0027 0007 0007
        DECLE   $0027,  $0007,  $0007,  $0027   ; 5C35   0027 0007 0007 0027
        DECLE   $0007,  $002E,  $0027,  $002F   ; 5C39   0007 002E 0027 002F
        DECLE   $002E,  $0027,  $002F,  $002C   ; 5C3D   002E 0027 002F 002C
        DECLE   $0027,  $002D,  $002C,  $0027   ; 5C41   0027 002D 002C 0027
        DECLE   $002D,  $002A,  $0027,  $002B   ; 5C45   002D 002A 0027 002B
        DECLE   $002A,  $0027,  $002B,  $0028   ; 5C49   002A 0027 002B 0028
        DECLE   $0027,  $0029,  $0000,  $0026   ; 5C4D   0027 0029 0000 0026
        DECLE   $0000                           ; 5C51   0000

        PSHR    R5                              ; 5C52   0275
        MVII    #$0002, R4                      ; 5C53   02BC 0002
L_5C55:
        MVII    #$0330, R3                      ; 5C55   02BB 0330
        DECLE   $00E3,  $029A,  $0001,  $037A   ; 5C57   00E3 029A 0001 037A
        DECLE   $00D1,  $0062,  $0204,  $0006   ; 5C5B   00D1 0062 0204 0006
        DECLE   $0001,  $037A,  $00E1,  $0062   ; 5C5F   0001 037A 00E1 0062
        DECLE   $020C,  $000F,  $0004,  $015C   ; 5C63   020C 000F 0004 015C
        DECLE   $0370,  $0204,  $000A,  $01C9   ; 5C67   0370 0204 000A 01C9
        DECLE   $02BA,  $0060,  $0004,  $015C   ; 5C6B   02BA 0060 0004 015C
        DECLE   $0281                           ; 5C6F   0281

        MVII    #$0340, R3                      ; 5C70   02BB 0340
        ADDR    R4,     R3                      ; 5C72   00E3
        MVO@    R2,     R3                      ; 5C73   025A
        INCR    R4                              ; 5C74   000C
        CMPI    #$0007, R4                      ; 5C75   037C 0007
        BNC     L_5C55                          ; 5C77   0229 0023

        MVI     G_0192, R4                      ; 5C79   0284 0192
        DECR    R4                              ; 5C7B   0014
        BMI     L_5C9E                          ; 5C7C   020B 0020

        MVO     R4,     G_0192                  ; 5C7E   0244 0192
        SDBD                                    ; 5C80   0001
        ADDI    #$648E, R4                      ; 5C81   02FC 008E 0064
        MVI@    R4,     R1                      ; 5C84   02A1
        MVO     R1,     G_018A                  ; 5C85   0241 018A
        MVI@    R4,     R1                      ; 5C87   02A1
        MVO     R1,     G_018B                  ; 5C88   0241 018B
        TSTR    R1                              ; 5C8A   0089
        BNEQ    L_5C9E                          ; 5C8B   020C 0011

        MVI     G_0189, R0                      ; 5C8D   0280 0189
L_5C8F:
        TSTR    R0                              ; 5C8F   0080
        BEQ     L_5D78                          ; 5C90   0204 00E6

        JSR     R5,     L_557C                  ; 5C92   0004 0154 017C
        DECLE   $0012,  $0004,  $014C,  $01D2   ; 5C95   0012 0004 014C 01D2
        DECLE   $0004                           ; 5C99   0004

        CMPR    R1,     R0                      ; 5C9A   0148
        AND     .STIC.CS.3,R0                   ; 5C9B   0380 002B
        SLL     R0,     2                       ; 5C9D   004C
L_5C9E:
        MVI     G_0198, R0                      ; 5C9E   0280 0198
        MVI     G_0199, R1                      ; 5CA0   0281 0199
        ADDR    R0,     R1                      ; 5CA2   00C1
        BNEQ    L_5D78                          ; 5CA3   020C 00D3

        MVI     G_019F, R0                      ; 5CA5   0280 019F
        DECR    R0                              ; 5CA7   0010
        BEQ     L_5CB5                          ; 5CA8   0204 000B

        MVO     R0,     G_019F                  ; 5CAA   0240 019F
        DECR    R0                              ; 5CAC   0010
        BNEQ    L_5CB5                          ; 5CAD   020C 0006

        MVI     G_0318, R0                      ; 5CAF   0280 0318
        XORI    #$0100, R0                      ; 5CB1   03F8 0100
        MVO     R0,     G_0318                  ; 5CB3   0240 0318
L_5CB5:
        CLRR    R4                              ; 5CB5   01E4
        DECLE   $0004,  $015C,  $0370,  $0204   ; 5CB6   0004 015C 0370 0204
        DECLE   $0054,  $0280,  $0190,  $0080   ; 5CBA   0054 0280 0190 0080
        DECLE   $020C,  $001F,  $0280,  $0320   ; 5CBE   020C 001F 0280 0320
        DECLE   $03B8,  $007F,  $0378,  $0041   ; 5CC2   03B8 007F 0378 0041
        DECLE   $0209,  $0017                   ; 5CC6   0209 0017

        MVI     G_0318, R1                      ; 5CC8   0281 0318
        MOVR    R1,     R2                      ; 5CCA   008A
        ANDI    #$00FF, R1                      ; 5CCB   03B9 00FF
        CMPI    #$0008, R1                      ; 5CCD   0379 0008
        BPL     L_5CD5                          ; 5CCF   0203 0004

        ADDI    #$0007, R2                      ; 5CD1   02FA 0007
        B       L_5CDB                          ; 5CD3   0200 0006

L_5CD5:
        CMPI    #$00A0, R1                      ; 5CD5   0379 00A0
        BNC     L_5D0F                          ; 5CD7   0209 0036

        SUBI    #$0007, R2                      ; 5CD9   033A 0007
L_5CDB:
        MVO     R2,     G_0318                  ; 5CDB   0242 0318
        B       L_5D0F                          ; 5CDD   0200 0030

        DECLE   $0004,  $014C,  $01D2,  $0004   ; 5CDF   0004 014C 01D2 0004
        DECLE   $0148,  $0380,  $0009,  $004D   ; 5CE3   0148 0380 0009 004D
        DECLE   $0280,  $0320,  $0001,  $03F8   ; 5CE7   0280 0320 0001 03F8
        DECLE   $0000,  $0008,  $0240,  $0320   ; 5CEB   0000 0008 0240 0320
        DECLE   $0001                           ; 5CEF   0001

        XORI    #$0000, R0                      ; 5CF0   03F8 0000
        SWAP    R0,     1                       ; 5CF2   0040
        MVO     R0,     G_0321                  ; 5CF3   0240 0321
        MVI     G_0190, R0                      ; 5CF5   0280 0190
        CMPI    #$000A, R0                      ; 5CF7   0378 000A
        BNEQ    L_5CFE                          ; 5CF9   020C 0003

        DECR    R0                              ; 5CFB   0010
        MVO     R0,     G_0190                  ; 5CFC   0240 0190
L_5CFE:
        CLRR    R1                              ; 5CFE   01C9
        DECLE   $0001,  $02BA,  $00BE,  $0062   ; 5CFF   0001 02BA 00BE 0062
        DECLE   $01E4,  $0004,  $015C,  $02A0   ; 5D03   01E4 0004 015C 02A0
        DECLE   $0001,  $02BA,  $00CA,  $0062   ; 5D07   0001 02BA 00CA 0062
        DECLE   $000C,  $0004,  $0358,  $01FE   ; 5D0B   000C 0004 0358 01FE
L_5D0F:
        JSR     R5,     L_57B4                  ; 5D0F   0004 0154 03B4

        BC      L_5D22                          ; 5D12   0201 000E

        MVI     G_0318, R0                      ; 5D14   0280 0318
        ANDI    #$00FF, R0                      ; 5D16   03B8 00FF
        MVI     G_0194, R1                      ; 5D18   0281 0194
        ADDI    #$0046, R1                      ; 5D1A   02F9 0046
        CMPR    R1,     R0                      ; 5D1C   0148
        BC      L_5D22                          ; 5D1D   0201 0003
        J       L_5B2A                          ; 5D1F   0004 0358 032A

L_5D22:
        MVI     G_019A, R1                      ; 5D22   0281 019A
        DECR    R1                              ; 5D24   0011
        BMI     L_5D38                          ; 5D25   020B 0011

        MVO     R1,     G_019A                  ; 5D27   0241 019A
        CMPI    #$0028, R1                      ; 5D29   0379 0028
        BNC     L_5D34                          ; 5D2B   0209 0007

        MVI     G_0328, R0                      ; 5D2D   0280 0328
        INCR    R0                              ; 5D2F   0008
        ANDI    #$0007, R0                      ; 5D30   03B8 0007
        B       L_5D3A                          ; 5D32   0200 0006

L_5D34:
        MVII    #$0002, R0                      ; 5D34   02B8 0002
        B       L_5D3A                          ; 5D36   0200 0002

L_5D38:
        MVII    #$0006, R0                      ; 5D38   02B8 0006
L_5D3A:
        MVI     G_0328, R1                      ; 5D3A   0281 0328
        SDBD                                    ; 5D3C   0001
        ANDI    #$FFF8, R1                      ; 5D3D   03B9 00F8 00FF
        XORR    R0,     R1                      ; 5D40   01C1
        MVO     R1,     G_0328                  ; 5D41   0241 0328
        MVI     G_0197, R1                      ; 5D43   0281 0197
        TSTR    R1                              ; 5D45   0089
        BEQ     L_5D6F                          ; 5D46   0204 0027

        MVI     G_01AB, R3                      ; 5D48   0283 01AB
        ADDI    #$0200, R3                      ; 5D4A   02FB 0200
        MVI@    R3,     R1                      ; 5D4C   0299
        SDBD                                    ; 5D4D   0001
        CMPI    #$084F, R1                      ; 5D4E   0379 004F 0008
        BNEQ    L_5D56                          ; 5D51   020C 0003
        J       L_59ED                          ; 5D53   0004 0358 01ED

L_5D56:
        MVI     G_0320, R4                      ; 5D56   0284 0320
        DECLE   $03BC,  $007F,  $0281,  $0197   ; 5D58   03BC 007F 0281 0197
        DECLE   $00A2,  $02FA,  $0014,  $014A   ; 5D5C   00A2 02FA 0014 014A
        DECLE   $0209,  $0017,  $033A,  $0028   ; 5D60   0209 0017 033A 0028
        DECLE   $0151,  $0209,  $0012           ; 5D64   0151 0209 0012

        SUBR    R4,     R1                      ; 5D67   0121
        BPL     L_5D6B                          ; 5D68   0203 0001

        NEGR    R1                              ; 5D6A   0021
L_5D6B:
        CMPI    #$0003, R1                      ; 5D6B   0379 0003
        DECLE   $0209,  $000A                   ; 5D6D   0209 000A
L_5D6F:
        MVI     G_01A3, R0                      ; 5D6F   0280 01A3
        CMPI    #$003C, R0                      ; 5D71   0378 003C
        BPL     L_5D78                          ; 5D73   0203 0003

        INCR    R0                              ; 5D75   0008
        MVO     R0,     G_01A3                  ; 5D76   0240 01A3
L_5D78:
        PULR    R7                              ; 5D78   02B7

        DECLE   $0004,  $0360,  $00D5           ; 5D79   0004 0360 00D5

        MVI@    R5,     R1                      ; 5D7C   02A9
        MVO     R1,     G_0183                  ; 5D7D   0241 0183
        NOP                                     ; 5D7F   0034
        MOVR    R5,     R0                      ; 5D80   00A8
        MVO     R0,     G_01AF                  ; 5D81   0240 01AF
        SWAP    R0,     1                       ; 5D83   0040
        MVO     R0,     G_01B0                  ; 5D84   0240 01B0
        PULR    R7                              ; 5D86   02B7

        PSHR    R5                              ; 5D87   0275
        MVI     G_0183, R2                      ; 5D88   0282 0183
        TSTR    R2                              ; 5D8A   0092
        BEQ     L_5D78                          ; 5D8B   0224 0014

        DECR    R2                              ; 5D8D   0012
        MVO     R2,     G_0183                  ; 5D8E   0242 0183
        BNEQ    L_5D78                          ; 5D90   022C 0019

        MVII    #$01AF, R4                      ; 5D92   02BC 01AF
        SDBD                                    ; 5D94   0001
        MVI@    R4,     R7                      ; 5D95   02A7

        PSHR    R5                              ; 5D96   0275
        MVI     G_01A9, R1                      ; 5D97   0281 01A9
        SLR     R1,     1                       ; 5D99   0061
        MVII    #$0009, R0                      ; 5D9A   02B8 0009
        SUBR    R1,     R0                      ; 5D9C   0108
        MVI     G_0191, R2                      ; 5D9D   0282 0191
        CMPI    #$0006, R2                      ; 5D9F   037A 0006
        BNC     L_5DAE                          ; 5DA1   0209 000B

        DECR    R0                              ; 5DA3   0010
        CMPI    #$000A, R2                      ; 5DA4   037A 000A
        BNC     L_5DAE                          ; 5DA6   0209 0006

        DECR    R0                              ; 5DA8   0010
        CMPI    #$000F, R2                      ; 5DA9   037A 000F
        BNC     L_5DAE                          ; 5DAB   0209 0001

        DECR    R0                              ; 5DAD   0010
L_5DAE:
        MVO     R0,     G_016C                  ; 5DAE   0240 016C
        MVI     G_034E, R5                      ; 5DB0   0285 034E
        MOVR    R5,     R3                      ; 5DB2   00AB
        ADDI    #$0010, R3                      ; 5DB3   02FB 0010
        ANDI    #$00F0, R3                      ; 5DB5   03BB 00F0
        CMPI    #$0080, R3                      ; 5DB7   037B 0080
        BNEQ    L_5DBD                          ; 5DB9   020C 0002

        MVII    #$0010, R3                      ; 5DBB   02BB 0010
L_5DBD:
        SDBD                                    ; 5DBD   0001
        ANDI    #$FF0F, R5                      ; 5DBE   03BD 000F 00FF
        XORR    R3,     R5                      ; 5DC1   01DD
        MVO     R5,     G_034E                  ; 5DC2   0245 034E
        MVI     G_01AE, R0                      ; 5DC4   0280 01AE
        TSTR    R0                              ; 5DC6   0080
        MVI     G_0348, R1                      ; 5DC7   0281 0348
        BNEQ    L_5DDF                          ; 5DC9   020C 0014

        DECR    R1                              ; 5DCB   0011
        BPL     L_5E21                          ; 5DCC   0203 0053

        MVI     G_01AD, R2                      ; 5DCE   0282 01AD
        ADDI    #$0200, R2                      ; 5DD0   02FA 0200
        SDBD                                    ; 5DD2   0001
        MVII    #$084F, R3                      ; 5DD3   02BB 004F 0008
        MVO@    R3,     R2                      ; 5DD6   0253

        JSR     R5,     L_5624                  ; 5DD7   0004 0154 0224

        MVO     R2,     G_01AE                  ; 5DDA   0242 01AE
        CLRR    R1                              ; 5DDC   01C9
        B       L_5E21                          ; 5DDD   0200 0042

L_5DDF:
        INCR    R1                              ; 5DDF   0009
        CMPI    #$0006, R1                      ; 5DE0   0379 0006
        BNEQ    L_5E21                          ; 5DE2   020C 003D

        MVI     G_01AD, R2                      ; 5DE4   0282 01AD
        ADDI    #$0200, R2                      ; 5DE6   02FA 0200
        SDBD                                    ; 5DE8   0001
        MVII    #$08CF, R1                      ; 5DE9   02B9 00CF 0008
        MVO@    R1,     R2                      ; 5DEC   0251
        MVI     G_01AC, R2                      ; 5DED   0282 01AC
L_5DEF:
        MVII    #$0003, R0                      ; 5DEF   02B8 0003

        JSR     R5,     X_RAND2                 ; 5DF1   0004 0114 029E

        CMPR    R0,     R2                      ; 5DF4   0142
        BEQ     L_5DEF                          ; 5DF5   0224 0007

        MVI     G_0190, R3                      ; 5DF7   0283 0190
        CMPI    #$000A, R3                      ; 5DF9   037B 000A
        BNEQ    L_5E00                          ; 5DFB   020C 0003

        TSTR    R0                              ; 5DFD   0080
        BEQ     L_5DEF                          ; 5DFE   0224 0010

L_5E00:
        MVO     R0,     G_01AC                  ; 5E00   0240 01AC
        SDBD                                    ; 5E02   0001
        MVII    #$57BF, R2                      ; 5E03   02BA 00BF 0057
        ADDR    R0,     R2                      ; 5E06   00C2
        MVI@    R2,     R3                      ; 5E07   0293
        ADDI    #$0200, R3                      ; 5E08   02FB 0200
L_5E0A:
        ADDI    #$0002, R3                      ; 5E0A   02FB 0002
        MVI@    R3,     R2                      ; 5E0C   029A
        SDBD                                    ; 5E0D   0001
        CMPI    #$08CF, R2                      ; 5E0E   037A 00CF 0008
        BNEQ    L_5E0A                          ; 5E11   022C 0008

        SDBD                                    ; 5E13   0001
        MVII    #$0807, R1                      ; 5E14   02B9 0007 0008
        MVO@    R1,     R3                      ; 5E17   0259
        SUBI    #$0200, R3                      ; 5E18   033B 0200
        MVO     R3,     G_01AD                  ; 5E1A   0243 01AD
        CLRR    R1                              ; 5E1C   01C9
        MVO     R1,     G_01AE                  ; 5E1D   0241 01AE
        MVII    #$0005, R1                      ; 5E1F   02B9 0005
L_5E21:
        MVO     R1,     G_0348                  ; 5E21   0241 0348
        PULR    R7                              ; 5E23   02B7

        PSHR    R5                              ; 5E24   0275
        MVO     R2,     G_01AD                  ; 5E25   0242 01AD
L_5E27:
        MVII    #$000B, R0                      ; 5E27   02B8 000B

        JSR     R5,     X_RAND2                 ; 5E29   0004 0114 029E

        SLL     R0,     1                       ; 5E2C   0048
        SUBI    #$000A, R0                      ; 5E2D   0338 000A
        BEQ     L_5E27                          ; 5E2F   0224 0009

        MVI     G_01AD, R2                      ; 5E31   0282 01AD
        ADDI    #$0200, R2                      ; 5E33   02FA 0200
        ADDR    R0,     R2                      ; 5E35   00C2
        MVI@    R2,     R1                      ; 5E36   0291
        SDBD                                    ; 5E37   0001
        CMPI    #$084F, R1                      ; 5E38   0379 004F 0008
        BNEQ    L_5E27                          ; 5E3B   022C 0015

        ADDI    #$003C, R2                      ; 5E3D   02FA 003C
        MVI@    R2,     R1                      ; 5E3F   0291
        SDBD                                    ; 5E40   0001
        CMPI    #$08CF, R1                      ; 5E41   0379 00CF 0008
        BEQ     L_5E27                          ; 5E44   0224 001E

        SUBI    #$0078, R2                      ; 5E46   033A 0078
        MVI@    R2,     R1                      ; 5E48   0291
        SDBD                                    ; 5E49   0001
        CMPI    #$08CF, R1                      ; 5E4A   0379 00CF 0008
        BEQ     L_5E27                          ; 5E4D   0224 0027

        ADDI    #$003C, R2                      ; 5E4F   02FA 003C
        SDBD                                    ; 5E51   0001
        MVII    #$0807, R1                      ; 5E52   02B9 0007 0008
        MVO@    R1,     R2                      ; 5E55   0251
        MVO     R2,     G_01AD                  ; 5E56   0242 01AD
        PULR    R7                              ; 5E58   02B7

        PSHR    R5                              ; 5E59   0275

        JSR     R5,     L_5624                  ; 5E5A   0004 0154 0224

        SDBD                                    ; 5E5D   0001
        MVII    #$08CF, R1                      ; 5E5E   02B9 00CF 0008
        MVO@    R1,     R2                      ; 5E61   0251
        PULR    R7                              ; 5E62   02B7

        PSHR    R5                              ; 5E63   0275
        MVI     G_019A, R1                      ; 5E64   0281 019A
        TSTR    R1                              ; 5E66   0089
        BNEQ    L_5E9D                          ; 5E67   020C 0034

        JSR     R5,     L_5EDB                  ; 5E69   0004 015C 02DB

        BEQ     L_5E9D                          ; 5E6C   0204 002F

        MVI     G_01A0, R1                      ; 5E6E   0281 01A0
        ADDI    #$0330, R1                      ; 5E70   02F9 0330
        MVI@    R1,     R0                      ; 5E72   0288
        SDBD                                    ; 5E73   0001
        CMPI    #$62EB, R0                      ; 5E74   0378 00EB 0062
        BEQ     L_5E9D                          ; 5E77   0204 0024

        JSR     R5,     L_57B4                  ; 5E79   0004 0154 03B4
        DECLE   $0209,  $001F,  $0244,  $01A0   ; 5E7C   0209 001F 0244 01A0
        DECLE   $02BB,  $0318,  $00E3,  $0001   ; 5E80   02BB 0318 00E3 0001
        DECLE   $02BC,  $0060,  $0062,  $0281   ; 5E84   02BC 0060 0062 0281
        DECLE   $01A0,  $0004,  $0150,  $0357   ; 5E88   01A0 0004 0150 0357

        MVII    #$0064, R0                      ; 5E8C   02B8 0064

        JSR     R5,     X_RAND2                 ; 5E8E   0004 0114 029E

        ADDI    #$0019, R0                      ; 5E91   02F8 0019
        MOVR    R0,     R2                      ; 5E93   0082
L_5E94:
        MVII    #$0060, R3                      ; 5E94   02BB 0060
        DECLE   $02FC,  $0318,  $02B9,  $0032   ; 5E96   02FC 0318 02B9 0032
        DECLE   $0004                           ; 5E9A   0004

        CMPR    R1,     R0                      ; 5E9B   0148
        XOR@    R2,     R3                      ; 5E9C   03D3
L_5E9D:
        PULR    R7                              ; 5E9D   02B7

        PSHR    R5                              ; 5E9E   0275
        MVI     G_019B, R1                      ; 5E9F   0281 019B
        ADDI    #$0330, R1                      ; 5EA1   02F9 0330
        MVI@    R1,     R0                      ; 5EA3   0288
        SDBD                                    ; 5EA4   0001
        CMPI    #$62F3, R0                      ; 5EA5   0378 00F3 0062
        BEQ     L_5F31                          ; 5EA8   0204 0087

        SDBD                                    ; 5EAA   0001
        CMPI    #$62FB, R0                      ; 5EAB   0378 00FB 0062
        BEQ     L_5F31                          ; 5EAE   0204 0081

        MVI     G_0199, R1                      ; 5EB0   0281 0199
        TSTR    R1                              ; 5EB2   0089
        BNEQ    L_5F31                          ; 5EB3   020C 007C

        JSR     R5,     L_5EDB                  ; 5EB5   0004 015C 02DB

        BEQ     L_5F31                          ; 5EB8   0204 0077

        MVI     G_019F, R0                      ; 5EBA   0280 019F
        CMPI    #$0002, R0                      ; 5EBC   0378 0002
        BPL     L_5F31                          ; 5EBE   0203 0071

        MVO     R4,     G_019B                  ; 5EC0   0244 019B
L_5EC2:
        MVI     G_0320, R2                      ; 5EC2   0282 0320
        ADDI    #$0008, R2                      ; 5EC4   02FA 0008
        ANDI    #$007F, R2                      ; 5EC6   03BA 007F

        JSR     R5,     L_5EED                  ; 5EC8   0004 015C 02ED

        CMPI    #$0016, R2                      ; 5ECB   037A 0016
        BPL     L_5ED1                          ; 5ECD   0203 0002

        MVII    #$0018, R2                      ; 5ECF   02BA 0018
L_5ED1:
        SUBI    #$0002, R2                      ; 5ED1   033A 0002
        MVII    #$0002, R0                      ; 5ED3   02B8 0002

        JSR     R5,     X_RAND2                 ; 5ED5   0004 0114 029E

        PSHR    R0                              ; 5ED8   0270
        MVII    #$0002, R0                      ; 5ED9   02B8 0002

L_5EDB:
        JSR     R5,     X_RAND2                 ; 5EDB   0004 0114 029E

        TSTR    R0                              ; 5EDE   0080
        BEQ     L_5EF3                          ; 5EDF   0204 0012

        MVI     G_018F, R4                      ; 5EE1   0284 018F
        MVI     G_018E, R5                      ; 5EE3   0285 018E
        ADDI    #$0002, R4                      ; 5EE5   02FC 0002
        SDBD                                    ; 5EE7   0001
        XORI    #$0400, R2                      ; 5EE8   03FA 0000 0004
        MVII    #$0028, R3                      ; 5EEB   02BB 0028
L_5EED:
        SDBD                                    ; 5EED   0001
        MVII    #$0908, R1                      ; 5EEE   02B9 0008 0009
        B       L_5F01                          ; 5EF1   0200 000E

L_5EF3:
        MVI     G_018E, R4                      ; 5EF3   0284 018E
        MVI     G_018F, R5                      ; 5EF5   0285 018F
        SUBI    #$0002, R4                      ; 5EF7   033C 0002
        SDBD                                    ; 5EF9   0001
        MVII    #$FFD8, R3                      ; 5EFA   02BB 00D8 00FF
        SDBD                                    ; 5EFD   0001
        MVII    #$0998, R1                      ; 5EFE   02B9 0098 0009
L_5F01:
        PULR    R0                              ; 5F01   02B0
        TSTR    R0                              ; 5F02   0080
        BEQ     L_5F32                          ; 5F03   0204 002D

        PSHR    R4                              ; 5F05   0274
        PSHR    R2                              ; 5F06   0272
        XORI    #$0080, R2                      ; 5F07   03FA 0080
        MOVR    R5,     R1                      ; 5F09   00A9
        SDBD                                    ; 5F0A   0001
        XORI    #$0900, R1                      ; 5F0B   03F9 0000 0009
        MVI     G_019B, R4                      ; 5F0E   0284 019B

        JSR     R5,     L_5E94                  ; 5F10   0004 015C 0294
        DECLE   $02B9,  $0010,  $0001,  $02BA   ; 5F13   02B9 0010 0001 02BA
        DECLE   $00F3,  $0062,  $0004,  $015C   ; 5F17   00F3 0062 0004 015C
        DECLE   $02A0,  $0004,  $015C,  $027F   ; 5F1B   02A0 0004 015C 027F

        SDBD                                    ; 5F1F   0001
        MVII    #$1000, R1                      ; 5F20   02B9 0000 0010

        JSR     R5,     L_5EC2                  ; 5F23   0004 015C 02C2
        DECLE   $02B3,  $02B2,  $03BB,  $007F   ; 5F26   02B3 02B2 03BB 007F
        DECLE   $02FC,  $0318,  $02B9,  $0028   ; 5F2A   02FC 0318 02B9 0028
        DECLE   $0004                           ; 5F2E   0004

        CMPR    R1,     R0                      ; 5F2F   0148
        XOR@    R2,     R3                      ; 5F30   03D3
L_5F31:
        PULR    R7                              ; 5F31   02B7

L_5F32:
        MVO     R3,     G_019E                  ; 5F32   0243 019E
        SUBI    #$0006, R2                      ; 5F34   033A 0006
        MVI     G_019B, R4                      ; 5F36   0284 019B

        JSR     R5,     L_5E94                  ; 5F38   0004 015C 0294
        DECLE   $02B9,  $0010,  $0001,  $02BA   ; 5F3B   02B9 0010 0001 02BA
        DECLE   $00FB,  $0062,  $0004,  $015C   ; 5F3F   00FB 0062 0004 015C
        DECLE   $02A0                           ; 5F43   02A0

        MVII    #$0002, R0                      ; 5F44   02B8 0002

        JSR     R5,     X_RAND2                 ; 5F46   0004 0114 029E
        DECLE   $0240,  $019D,  $0004           ; 5F49   0240 019D 0004

        CMPR    R1,     R0                      ; 5F4C   0148
        AND     G_0077, R0                      ; 5F4D   0380 0077
        SLL     R0,     2                       ; 5F4F   004C
        CLRR    R0                              ; 5F50   01C0
        MVO     R0,     G_019C                  ; 5F51   0240 019C
L_5F53:
        MVI     G_019C, R3                      ; 5F53   0283 019C
        DECLE   $0001,  $02FB,  $00D0,  $0066   ; 5F55   0001 02FB 00D0 0066
        DECLE   $0281,  $019E,  $029A,  $0092   ; 5F59   0281 019E 029A 0092
        DECLE   $0224,  $000E,  $0284,  $019B   ; 5F5D   0224 000E 0284 019B
        DECLE   $0004,  $015C,  $0281           ; 5F61   0004 015C 0281

        MVII    #$000E, R2                      ; 5F64   02BA 000E
        MVII    #$0007, R1                      ; 5F66   02B9 0007
        MVI     G_019D, R0                      ; 5F68   0280 019D
        TSTR    R0                              ; 5F6A   0080
        BEQ     L_5F6F                          ; 5F6B   0204 0002

        MVII    #$0000, R1                      ; 5F6D   02B9 0000

L_5F6F:
        JSR     R5,     L_5EC2                  ; 5F6F   0004 015C 02C2

        PULR    R7                              ; 5F72   02B7

        DECLE   $009A,  $0281,  $01A9,  $02BB   ; 5F73   009A 0281 01A9 02BB
        DECLE   $000F,  $010B,  $004F,  $004B   ; 5F77   000F 010B 004F 004B
        DECLE   $0243,  $016F,  $0281,  $0330   ; 5F7B   0243 016F 0281 0330
        DECLE   $0001,  $0379,  $00BE,  $0062   ; 5F7F   0001 0379 00BE 0062
        DECLE   $0204,  $0007,  $0275,  $0004   ; 5F83   0204 0007 0275 0004

        CMPR    R1,     R0                      ; 5F87   0148
        AND     .STIC.CS.3,R0                   ; 5F88   0380 002B
        SLL     R0,     2                       ; 5F8A   004C
        PULR    R5                              ; 5F8B   02B5
        MOVR    R2,     R4                      ; 5F8C   0094
        INCR    R7                              ; 5F8D   000F

        MOVR    R3,     R4                      ; 5F8E   009C
L_5F8F:
        PSHR    R5                              ; 5F8F   0275
        DECLE   $0004,  $015C,  $03C2,  $0004   ; 5F90   0004 015C 03C2 0004
        DECLE   $015C,  $027F,  $02BB,  $0318   ; 5F94   015C 027F 02BB 0318
        DECLE   $00E3,  $0001,  $02BC,  $00FB   ; 5F98   00E3 0001 02BC 00FB
        DECLE   $0064,  $0004                   ; 5F9C   0064 0004

        CMPR    R1,     R0                      ; 5F9E   0148
        AND@    R1,     R1                      ; 5F9F   0389

        JSR     R5,     L_5FC9                  ; 5FA0   0004 015C 03C9

L_5FA3:
        PULR    R7                              ; 5FA3   02B7

        PSHR    R5                              ; 5FA4   0275
        MVI     G_019C, R0                      ; 5FA5   0280 019C
        INCR    R0                              ; 5FA7   0008
        MVO     R0,     G_019C                  ; 5FA8   0240 019C
        B       L_5F53                          ; 5FAA   0220 0058

        ANDR    R0,     R0                      ; 5FAC   0180
        ANDR    R2,     R0                      ; 5FAD   0190
        ANDR    R4,     R0                      ; 5FAE   01A0
        ANDR    R6,     R0                      ; 5FAF   01B0
        CLRR    R0                              ; 5FB0   01C0
        XORR    R2,     R0                      ; 5FB1   01D0
        XORR    R4,     R0                      ; 5FB2   01E0
        XORR    R6,     R0                      ; 5FB3   01F0
        PSHR    R5                              ; 5FB4   0275
        MVI     G_0320, R0                      ; 5FB5   0280 0320
L_5FB7:
        ANDI    #$007F, R0                      ; 5FB7   03B8 007F
        MVI     G_0195, R1                      ; 5FB9   0281 0195
        ADDI    #$0010, R1                      ; 5FBB   02F9 0010
        CMPR    R1,     R0                      ; 5FBD   0148
        PULR    R7                              ; 5FBE   02B7

        DECLE   $0052,  $008E,  $00CA,  $0005   ; 5FBF   0052 008E 00CA 0005

        NEGR    R0                              ; 5FC3   0020
        SWAP    R0,     1                       ; 5FC4   0040
        SWAP    R0,     1                       ; 5FC5   0040
        SWAP    R0,     1                       ; 5FC6   0040
        SWAP    R0,     1                       ; 5FC7   0040
        NEGR    R0                              ; 5FC8   0020
L_5FC9:
        SLLC    R3,     1                       ; 5FC9   005B
        SLR     R0,     2                       ; 5FCA   0064
        MOVR    R2,     R6                      ; 5FCB   0096
        SLR     R0,     2                       ; 5FCC   0064
L_5FCD:
        DECR    R7                              ; 5FCD   0017

        SLR     R3,     2                       ; 5FCE   0067
        INCR    R3                              ; 5FCF   000B
L_5FD0:
        SLR     R1,     2                       ; 5FD0   0065
        ADCR    R6                              ; 5FD1   002E
        SLR     R1,     2                       ; 5FD2   0065
        NOP                                     ; 5FD3   0034
        SLR     R2,     2                       ; 5FD4   0066
        MOVR    R2,     R1                      ; 5FD5   0091
        SLR     R1,     2                       ; 5FD6   0065
        MVI     G_0189, R3                      ; 5FD7   0283 0189
        CMPI    #$0002, R3                      ; 5FD9   037B 0002
        BEQ     L_5FE1                          ; 5FDB   0204 0004

        DECR    R3                              ; 5FDD   0013
        BEQ     L_5FE7                          ; 5FDE   0204 0007
        PULR    R7                              ; 5FE0   02B7

L_5FE1:
        TSTR    R0                              ; 5FE1   0080
        DECLE   $022B,  $0003,  $0004,  $0350   ; 5FE2   022B 0003 0004 0350
        DECLE   $00A6                           ; 5FE6   00A6
L_5FE7:
        MOVR    R5,     R7                      ; 5FE7   00AF

        DECR    R3                              ; 5FE8   0013
        SLR     R0,     1                       ; 5FE9   0060
        ADDR    R7,     R1                      ; 5FEA   00F9
        SLLC    R3,     2                       ; 5FEB   005F
L_5FEC:
        SARC    R2,     2                       ; 5FEC   007E
        DECLE   $0061,  $007E,  $0061,  $007E   ; 5FED   0061 007E 0061 007E
        DECLE   $0061,  $0000,  $0000,  $0000   ; 5FF1   0061 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5FFD   0000 0000 0000

        PSHR    R5                              ; 6000   0275
        MVII    #$001E, R2                      ; 6001   02BA 001E
        MVI     G_0191, R3                      ; 6003   0283 0191
        CMPI    #$0004, R3                      ; 6005   037B 0004
        BPL     L_6011                          ; 6007   0203 0008

        ADDI    #$000F, R2                      ; 6009   02FA 000F
        CMPI    #$0002, R3                      ; 600B   037B 0002
        BPL     L_6011                          ; 600D   0203 0002

        ADDI    #$0014, R2                      ; 600F   02FA 0014
L_6011:
        MVO     R2,     G_016E                  ; 6011   0242 016E
        SDBD                                    ; 6013   0001
        MVII    #$65D3, R1                      ; 6014   02B9 00D3 0065
        MVII    #$0020, R2                      ; 6017   02BA 0020
        MVII    #$0002, R0                      ; 6019   02B8 0002

        JSR     R5,     X_RAND2                 ; 601B   0004 0114 029E

        TSTR    R0                              ; 601E   0080
        BNEQ    L_6026                          ; 601F   020C 0005

        SDBD                                    ; 6021   0001
        MVII    #$6496, R1                      ; 6022   02B9 0096 0064
        CLRR    R2                              ; 6025   01D2
L_6026:
        MVO     R2,     G_033F                  ; 6026   0242 033F
        MVII    #$015F, R4                      ; 6028   02BC 015F
        MVO@    R1,     R4                      ; 602A   0261
        SWAP    R1,     1                       ; 602B   0041
        MVO@    R1,     R4                      ; 602C   0261

        JSR     R5,     L_5EDB                  ; 602D   0004 015C 02DB
        DECLE   $0204,  $0010,  $02BB,  $0318   ; 6030   0204 0010 02BB 0318
        DECLE   $00E3,  $00A1,  $0001,  $02BC   ; 6034   00E3 00A1 0001 02BC
        DECLE   $0078,  $0062,  $0004,  $0150   ; 6038   0078 0062 0004 0150
        DECLE   $0357,  $02B9,  $0031,  $0004   ; 603C   0357 02B9 0031 0004
        DECLE   $0158,  $0068                   ; 6040   0158 0068

        PULR    R7                              ; 6042   02B7

        PSHR    R5                              ; 6043   0275
        MVII    #$0004, R0                      ; 6044   02B8 0004

        JSR     R5,     X_RAND2                 ; 6046   0004 0114 029E
        DECLE   $0281,  $01A9,  $0061,  $00C8   ; 6049   0281 01A9 0061 00C8
        DECLE   $004C,  $0048,  $02BA,  $01B4   ; 604D   004C 0048 02BA 01B4
        DECLE   $00DA,  $0250,  $0099,  $02FB   ; 6051   00DA 0250 0099 02FB
        DECLE   $0318,  $0001,  $02BC,  $0086   ; 6055   0318 0001 02BC 0086
        DECLE   $0062,  $0001,  $02B8,  $0000   ; 6059   0062 0001 02B8 0000
        DECLE   $000A,  $0004,  $0150,  $035B   ; 605D   000A 0004 0150 035B

        ADDI    #$0340, R4                      ; 6061   02FC 0340
        MVI     G_0196, R1                      ; 6063   0281 0196
        MVO@    R1,     R4                      ; 6065   0261
        PULR    R5                              ; 6066   02B5
        CLRR    R1                              ; 6067   01C9
        MVII    #$034A, R4                      ; 6068   02BC 034A
        MVO@    R1,     R4                      ; 606A   0261
        MVO@    R1,     R4                      ; 606B   0261
        NOP                                     ; 606C   0034
        MVO@    R1,     R4                      ; 606D   0261
        MVO@    R1,     R4                      ; 606E   0261
        MVII    #$017B, R4                      ; 606F   02BC 017B
        MVO@    R4,     R4                      ; 6071   0264
        NOP                                     ; 6072   0034
        MVO@    R4,     R4                      ; 6073   0264
        MVO@    R4,     R4                      ; 6074   0264
        MVO@    R4,     R4                      ; 6075   0264
        MOVR    R5,     R7                      ; 6076   00AF

        DECLE   $0275,  $0243,  $01AA,  $02BC   ; 6077   0275 0243 01AA 02BC
        DECLE   $0136,  $00DC,  $00DC,  $02A0   ; 607B   0136 00DC 00DC 02A0
        DECLE   $0270,  $009C,  $0004,  $015C   ; 607F   0270 009C 0004 015C
        DECLE   $027F                           ; 6083   027F

        MVII    #$0320, R1                      ; 6084   02B9 0320
        ADDR    R3,     R1                      ; 6086   00D9
        MVI@    R1,     R2                      ; 6087   028A
        ANDI    #$007F, R2                      ; 6088   03BA 007F
        SUBI    #$0016, R2                      ; 608A   033A 0016

        JSR     R5,     L_5EED                  ; 608C   0004 015C 02ED

        MVI@    R1,     R2                      ; 608F   028A
        ADDR    R0,     R2                      ; 6090   00C2
        MVO@    R2,     R1                      ; 6091   024A
        MVII    #$0318, R1                      ; 6092   02B9 0318
        ADDR    R3,     R1                      ; 6094   00D9
        MVI@    R1,     R2                      ; 6095   028A
        SDBD                                    ; 6096   0001
        ANDI    #$0FE0, R2                      ; 6097   03BA 00E0 000F
        ADDI    #$0010, R2                      ; 609A   02FA 0010
        MVO@    R2,     R1                      ; 609C   024A
        CLRR    R0                              ; 609D   01C0
        MVO     R0,     G_01A8                  ; 609E   0240 01A8
        PULR    R0                              ; 60A0   02B0
        TSTR    R0                              ; 60A1   0080
        BEQ     L_60F2                          ; 60A2   0204 004E

        MVI     G_01A7, R0                      ; 60A4   0280 01A7
        TSTR    R0                              ; 60A6   0080
        BNEQ    L_60F2                          ; 60A7   020C 0049

        MVII    #$0330, R1                      ; 60A9   02B9 0330
        ADDR    R3,     R1                      ; 60AB   00D9
        MVI@    R1,     R0                      ; 60AC   0288
        SDBD                                    ; 60AD   0001
        CMPI    #$62D1, R0                      ; 60AE   0378 00D1 0062
        BNEQ    L_60F2                          ; 60B1   020C 003F

        MVI     G_0191, R0                      ; 60B3   0280 0191
        TSTR    R0                              ; 60B5   0080
        BEQ     L_60F2                          ; 60B6   0204 003A

        JSR     R5,     L_5EDB                  ; 60B8   0004 015C 02DB

        BEQ     L_60F2                          ; 60BB   0204 0035

        MVO     R4,     G_01A7                  ; 60BD   0244 01A7
        MVO     R4,     G_01A8                  ; 60BF   0244 01A8
        MVII    #$0318, R5                      ; 60C1   02BD 0318
        ADDR    R3,     R5                      ; 60C3   00DD
        MVI@    R5,     R1                      ; 60C4   02A9
        ADDI    #$0007, R5                      ; 60C5   02FD 0007
        MVI@    R5,     R2                      ; 60C7   02AA

        JSR     R5,     L_5E94                  ; 60C8   0004 015C 0294

        MVII    #$01B4, R5                      ; 60CB   02BD 01B4
        ADDR    R3,     R5                      ; 60CD   00DD
        MVI@    R5,     R1                      ; 60CE   02A9
        MVII    #$01B4, R5                      ; 60CF   02BD 01B4
        ADDR    R4,     R5                      ; 60D1   00E5
        DECR    R1                              ; 60D2   0011
        MVO@    R1,     R5                      ; 60D3   0269
        MVII    #$0006, R1                      ; 60D4   02B9 0006
        MVII    #$0001, R2                      ; 60D6   02BA 0001

        JSR     R5,     L_5EC2                  ; 60D8   0004 015C 02C2
        DECLE   $01C9,  $0001,  $02BA,  $00E1   ; 60DB   01C9 0001 02BA 00E1
        DECLE   $0062,  $0004,  $015C,  $02A0   ; 60DF   0062 0004 015C 02A0
        DECLE   $009C,  $0004,  $015C,  $02A0   ; 60E3   009C 0004 015C 02A0

        MVII    #$0006, R1                      ; 60E7   02B9 0006
        CLRR    R2                              ; 60E9   01D2

        JSR     R5,     L_5EC2                  ; 60EA   0004 015C 02C2
        DECLE   $0004                           ; 60ED   0004

        CMPR    R1,     R0                      ; 60EE   0148
        CMPI    #$003F, R4                      ; 60EF   037C 003F
        SLL     R0,     2                       ; 60F1   004C
L_60F2:
        MVII    #$01B4, R5                      ; 60F2   02BD 01B4
        ADDR    R5,     R3                      ; 60F4   00EB
        MVI@    R3,     R1                      ; 60F5   0299
        SDBD                                    ; 60F6   0001
        MVII    #$5954, R2                      ; 60F7   02BA 0054 0059
        ADDR    R1,     R2                      ; 60FA   00CA
        INCR    R1                              ; 60FB   0009
        MVO@    R1,     R3                      ; 60FC   0259
        MVI@    R2,     R4                      ; 60FD   0294
        MVII    #$0009, R0                      ; 60FE   02B8 0009

L_6100:
        JSR     R5,     X_RAND2                 ; 6100   0004 0114 029E

        MOVR    R0,     R3                      ; 6103   0083
        SLL     R3,     1                       ; 6104   004B
        ADDR    R3,     R0                      ; 6105   00D8
        MVI     G_01AA, R3                      ; 6106   0283 01AA
        MVI     G_01A8, R1                      ; 6108   0281 01A8
        TSTR    R1                              ; 610A   0089
        BNEQ    L_6115                          ; 610B   020C 0008

        MVI     G_01A7, R1                      ; 610D   0281 01A7
        CMPR    R3,     R1                      ; 610F   0159
        BNEQ    L_6116                          ; 6110   020C 0004

        CLRR    R0                              ; 6112   01C0
        MVO     R0,     G_01A7                  ; 6113   0240 01A7
L_6115:
        MOVR    R0,     R4                      ; 6115   0084
L_6116:
        SDBD                                    ; 6116   0001
        DECLE   $02FC,  $0036,  $0059,  $02B9   ; 6117   02FC 0036 0059 02B9
        DECLE   $0340,  $00D9,  $02A2,  $024A   ; 611B   0340 00D9 02A2 024A
        DECLE   $02A1,  $02A2,  $009C,  $0004   ; 611F   02A1 02A2 009C 0004
        DECLE   $015C,  $0281                   ; 6123   015C 0281

        ADDI    #$0338, R3                      ; 6125   02FB 0338
        MVI@    R3,     R2                      ; 6127   029A
        ANDI    #$000F, R2                      ; 6128   03BA 000F
        ADDI    #$0010, R2                      ; 612A   02FA 0010
        CMPI    #$0080, R1                      ; 612C   0379 0080
        BPL     L_6134                          ; 612E   0203 0004

        SDBD                                    ; 6130   0001
        XORI    #$8000, R2                      ; 6131   03FA 0000 0080
L_6134:
        MVO@    R2,     R3                      ; 6134   025A
        PULR    R7                              ; 6135   02B7

        DECLE   $0015,  $0000,  $0040,  $0010   ; 6136   0015 0000 0040 0010
        DECLE   $0000,  $0060,  $0040,  $00E0   ; 613A   0000 0060 0040 00E0
        DECLE   $0000,  $0034,  $00D8,  $0000   ; 613E   0000 0034 00D8 0000
        DECLE   $0037,  $00DC,  $001C,  $0025   ; 6142   0037 00DC 001C 0025
        DECLE   $00C8,  $002A,  $0040,  $0020   ; 6146   00C8 002A 0040 0020
        DECLE   $0000,  $0034,  $0028,  $0000   ; 614A   0000 0034 0028 0000

        RSWD    R0                              ; 614E   0038
        NEGR    R4                              ; 614F   0024
        COMR    R4                              ; 6150   001C
        NEGR    R6                              ; 6151   0026
        NOP                                     ; 6152   0034
        ADCR    R2                              ; 6153   002A
L_6154:
        DECR    R2                              ; 6154   0012
        DECLE   $0012,  $0000,  $0006,  $0006   ; 6155   0012 0000 0006 0006
        DECLE   $0000,  $0012,  $0012,  $0012   ; 6159   0000 0012 0012 0012
        DECLE   $0000,  $0006,  $0000,  $0012   ; 615D   0000 0006 0000 0012
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6161   0000 0000 0000 0012
        DECLE   $0000,  $0012,  $0000,  $0012   ; 6165   0000 0012 0000 0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6169   0000 0000 0000 0000
        DECLE   $0012,  $0012,  $0000,  $0006   ; 616D   0012 0012 0000 0006
        DECLE   $0000,  $0000,  $0000,  $0015   ; 6171   0000 0000 0000 0015
        DECLE   $0012,  $0003,  $0009,  $0003   ; 6175   0012 0003 0009 0003
        DECLE   $0015,  $0003,  $0003,  $0018   ; 6179   0015 0003 0003 0018
        DECLE   $0015,  $000C,  $0000,  $0015   ; 617D   0015 000C 0000 0015
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6181   0003 0003 0003 0003
        DECLE   $0015,  $0015,  $0003,  $0009   ; 6185   0015 0015 0003 0009
        DECLE   $0009,  $0003,  $0003,  $0015   ; 6189   0009 0003 0003 0015
        DECLE   $0015,  $000C,  $0003,  $0015   ; 618D   0015 000C 0003 0015
        DECLE   $0003,  $0009,  $0003,  $0015   ; 6191   0003 0009 0003 0015
        DECLE   $000F,  $001B,  $000F,  $001B   ; 6195   000F 001B 000F 001B
        DECLE   $000F,  $0003,  $0000,  $0275   ; 6199   000F 0003 0000 0275
        DECLE   $0280,  $0199,  $0080,  $020C   ; 619D   0280 0199 0080 020C
        DECLE   $004A,  $0280,  $019F,  $0378   ; 61A1   004A 0280 019F 0378
        DECLE   $0003,  $0203,  $0044,  $02B9   ; 61A5   0003 0203 0044 02B9
        DECLE   $003A,  $0241,  $019A,  $0272   ; 61A9   003A 0241 019A 0272
        DECLE   $0004,  $0150,  $0004,  $0200   ; 61AD   0004 0150 0004 0200
        DECLE   $0014,  $0275,  $0280,  $019A   ; 61B1   0014 0275 0280 019A
        DECLE   $0080,  $0204,  $0035,  $0272   ; 61B5   0080 0204 0035 0272
        DECLE   $0281,  $019B,  $014A,  $020C   ; 61B9   0281 019B 014A 020C
        DECLE   $0003,  $0004,  $0154,  $0374   ; 61BD   0003 0004 0154 0374
        DECLE   $0004                           ; 61C1   0004

        CMPR    R1,     R0                      ; 61C2   0148
        CMPI    #$0069, R4                      ; 61C3   037C 0069
        SLL     R1,     2                       ; 61C5   004D
        PULR    R3                              ; 61C6   02B3
        PSHR    R3                              ; 61C7   0273
        ADDI    #$0318, R3                      ; 61C8   02FB 0318
        SDBD                                    ; 61CA   0001
        MVII    #$626A, R4                      ; 61CB   02BC 006A 0062

        JSR     R5,     L_5FEC                  ; 61CE   0004 015C 03EC
        DECLE   $0004                           ; 61D1   0004

        CMPR    R1,     R0                      ; 61D2   0148
        AND@    R1,     R1                      ; 61D3   0389
        MVI     G_0320, R2                      ; 61D4   0282 0320
        ANDI    #$007F, R2                      ; 61D6   03BA 007F
        ADDI    #$000C, R2                      ; 61D8   02FA 000C

        JSR     R5,     L_5EED                  ; 61DA   0004 015C 02ED

        MVI     G_0318, R1                      ; 61DD   0281 0318
        SDBD                                    ; 61DF   0001
        ANDI    #$FEFF, R1                      ; 61E0   03B9 00FF 00FE
        PULR    R4                              ; 61E3   02B4

        JSR     R5,     L_5E94                  ; 61E4   0004 015C 0294
        DECLE   $02B9,  $0032,  $0004,  $015C   ; 61E7   02B9 0032 0004 015C
        DECLE   $0300                           ; 61EB   0300
L_61EC:
        PULR    R7                              ; 61EC   02B7

        DECLE   $0281,  $0199,  $0089,  $022C   ; 61ED   0281 0199 0089 022C
        DECLE   $0005,  $0004,  $0148,  $0378   ; 61F1   0005 0004 0148 0378
        DECLE   $00A6,  $004D,  $02B9,  $0010   ; 61F5   00A6 004D 02B9 0010
        DECLE   $0001,  $02BA,  $00A0,  $0062   ; 61F9   0001 02BA 00A0 0062
        DECLE   $01E4,  $0004,  $015C,  $02A0   ; 61FD   01E4 0004 015C 02A0
        DECLE   $0009,  $0241,  $0199,  $0004   ; 6201   0009 0241 0199 0004
        DECLE   $015C,  $03A6                   ; 6205   015C 03A6

        MVI     G_0328, R0                      ; 6207   0280 0328
        SDBD                                    ; 6209   0001
        ANDI    #$FFF0, R0                      ; 620A   03B8 00F0 00FF
        XORI    #$0006, R0                      ; 620D   03F8 0006
        MVO     R0,     G_0328                  ; 620F   0240 0328
        MVII    #$0065, R1                      ; 6211   02B9 0065
        B       L_6217                          ; 6213   0200 0002

L_6215:
        MVII    #$007E, R1                      ; 6215   02B9 007E
L_6217:
        MVI     G_0318, R2                      ; 6217   0282 0318
        DECLE   $0001,  $03BA,  $00FF,  $00FE   ; 6219   0001 03BA 00FF 00FE
        DECLE   $0242,  $0318,  $03BA,  $00FF   ; 621D   0242 0318 03BA 00FF
        DECLE   $02BB,  $0060,  $02BC,  $0318   ; 6221   02BB 0060 02BC 0318
        DECLE   $0004                           ; 6225   0004

        CMPR    R1,     R0                      ; 6226   0148
        XOR@    R2,     R3                      ; 6227   03D3
        PULR    R7                              ; 6228   02B7

L_6229:
        PSHR    R5                              ; 6229   0275
        DECLE   $0281,  $0340,  $0089,  $022C   ; 622A   0281 0340 0089 022C
        DECLE   $0006,  $0004,  $015C,  $0397   ; 622E   0006 0004 015C 0397

        JSR     R5,     L_578F                  ; 6232   0004 0154 038F

        MVI     G_0190, R1                      ; 6235   0281 0190
        DECR    R1                              ; 6237   0011
        BMI     L_6247                          ; 6238   020B 000D

        MVO     R1,     G_0190                  ; 623A   0241 0190
        SDBD                                    ; 623C   0001
        MVII    #$0988, R0                      ; 623D   02B8 0088 0009
        MVO     R0,     G_0320                  ; 6240   0240 0320

        JSR     R5,     L_50D5                  ; 6242   0004 0150 00D5

        B       L_6215                          ; 6245   0220 0031

L_6247:
        MVI     G_0337, R0                      ; 6247   0280 0337
        SDBD                                    ; 6249   0001
        CMPI    #$630B, R0                      ; 624A   0378 000B 0063
        BEQ     L_6252                          ; 624D   0204 0003

        JSR     R5,     L_530C                  ; 624F   0004 0150 030C
L_6252:
        JSR     R5,     L_6229                  ; 6252   0004 0160 0229

        B       L_625D                          ; 6255   0200 0006

        PSHR    R5                              ; 6257   0275
        MVI     G_0340, R1                      ; 6258   0281 0340
        TSTR    R1                              ; 625A   0089
        BNEQ    L_61EC                          ; 625B   022C 0070

L_625D:
        JSR     R5,     L_5FA3                  ; 625D   0004 015C 03A3
        DECLE   $0281,  $018D,  $0011,  $0241   ; 6260   0281 018D 0011 0241
        DECLE   $018D,  $020C,  $007C,  $0241   ; 6264   018D 020C 007C 0241
        DECLE   $0189,  $0282,  $018A,  $0092   ; 6268   0189 0282 018A 0092
        DECLE   $020C,  $0003,  $0004,  $014C   ; 626C   020C 0003 0004 014C
        DECLE   $01D2,  $0004,  $015C,  $031E   ; 6270   01D2 0004 015C 031E
        DECLE   $02B9,  $0002,  $0004,  $015C   ; 6274   02B9 0002 0004 015C
        DECLE   $008E                           ; 6278   008E

        MVII    #$0320, R3                      ; 6279   02BB 0320
L_627B:
        MVI@    R3,     R1                      ; 627B   0299
        ADDI    #$0007, R1                      ; 627C   02F9 0007
        MVO@    R1,     R3                      ; 627E   0259
        INCR    R3                              ; 627F   000B
        CMPI    #$0328, R3                      ; 6280   037B 0328
        BNEQ    L_627B                          ; 6282   022C 0008

        JSR     R5,     L_557C                  ; 6284   0004 0154 017C
        DECLE   $0016,  $0004                   ; 6287   0016 0004

        CMPR    R1,     R4                      ; 6289   014C
        XOR@    R5,     R4                      ; 628A   03EC
        MVII    #$0002, R1                      ; 628B   02B9 0002
        MVO     R1,     G_0189                  ; 628D   0241 0189

        JSR     R5,     L_557C                  ; 628F   0004 0154 017C
        DECLE   $0001,  $0281,  $0318,  $03B9   ; 6292   0001 0281 0318 03B9
        DECLE   $00FF,  $0379,  $0058,  $0229   ; 6296   00FF 0379 0058 0229
        DECLE   $000B,  $02BC,  $0004,  $0004   ; 629A   000B 02BC 0004 0004
        DECLE   $015C,  $027F,  $0014,  $0223   ; 629E   015C 027F 0014 0223
        DECLE   $0005                           ; 62A2   0005
L_62A3:
        MVII    #$031D, R4                      ; 62A3   02BC 031D
        MVI@    R4,     R3                      ; 62A5   02A3
        CMPI    #$0020, R3                      ; 62A6   037B 0020
        BNC     L_62B0                          ; 62A8   0209 0006

        SDBD                                    ; 62AA   0001
        CMPI    #$0BA0, R3                      ; 62AB   037B 00A0 000B
        BNC     L_62B5                          ; 62AE   0209 0005

L_62B0:
        CLRR    R0                              ; 62B0   01C0
        DECR    R4                              ; 62B1   0014
        MVO@    R0,     R4                      ; 62B2   0260
        MVO@    R0,     R4                      ; 62B3   0260
        MVO@    R0,     R4                      ; 62B4   0260
L_62B5:
        MVI     G_0197, R0                      ; 62B5   0280 0197
        CMPI    #$0011, R0                      ; 62B7   0378 0011
        BEQ     L_62BD                          ; 62B9   0204 0002

        MVII    #$0010, R0                      ; 62BB   02B8 0010
L_62BD:
        INCR    R0                              ; 62BD   0008
        MVO     R0,     G_0197                  ; 62BE   0240 0197
        CLRR    R0                              ; 62C0   01C0
        MVO     R0,     G_01A3                  ; 62C1   0240 01A3

L_62C3:
        JSR     R5,     L_557C                  ; 62C3   0004 0154 017C

        DIS                                     ; 62C6   0003
        MVI     G_01A3, R4                      ; 62C7   0284 01A3
        MOVR    R4,     R3                      ; 62C9   00A3
        MOVR    R4,     R1                      ; 62CA   00A1
        SLL     R1,     2                       ; 62CB   004D
        SLL     R1,     1                       ; 62CC   0049
        SDBD                                    ; 62CD   0001
        ADDI    #$0A59, R1                      ; 62CE   02F9 0059 000A
        ADDI    #$0318, R4                      ; 62D1   02FC 0318
        MVO@    R1,     R4                      ; 62D3   0261
        MOVR    R3,     R4                      ; 62D4   009C
        ADDI    #$0320, R4                      ; 62D5   02FC 0320
        INCR    R3                              ; 62D7   000B
        MVO     R3,     G_01A3                  ; 62D8   0243 01A3
        MVI     G_0197, R1                      ; 62DA   0281 0197
        MVO@    R1,     R4                      ; 62DC   0261
        CMPI    #$0325, R4                      ; 62DD   037C 0325
        BNEQ    L_62C3                          ; 62DF   022C 001D
        B       L_62A3                          ; 62E1   0220 003F

        DECLE   $0004,  $014C,  $01F4,  $01E4   ; 62E3   0004 014C 01F4 01E4
        DECLE   $0004,  $015C,  $027F           ; 62E7   0004 015C 027F

        MVO     R4,     G_0197                  ; 62EA   0244 0197
        MVO     R4,     G_01A2                  ; 62EC   0244 01A2
        MVO     R4,     G_0199                  ; 62EE   0244 0199
        NOP                                     ; 62F0   0034
        MVO     R4,     G_01A4                  ; 62F1   0244 01A4
        MVO     R4,     G_019A                  ; 62F3   0244 019A
        MVII    #$0016, R0                      ; 62F5   02B8 0016
        MVO     R0,     G_019F                  ; 62F7   0240 019F
        NOP                                     ; 62F9   0034
        MVII    #$00FE, R0                      ; 62FA   02B8 00FE
        MVO     R0,     G_01A5                  ; 62FC   0240 01A5
        MVII    #$0002, R2                      ; 62FE   02BA 0002
        MVII    #$0318, R3                      ; 6300   02BB 0318
        SDBD                                    ; 6302   0001
        MVII    #$6244, R4                      ; 6303   02BC 0044 0062

        JSR     R5,     L_5FEC                  ; 6306   0004 015C 03EC

        J       L_5B0E                          ; 6309   0004 0358 030E
        B       L_6329                          ; 630C   0200 001B

        DECLE   $0004,  $0148,  $0387           ; 630E   0004 0148 0387

        MVII    #$0032, R0                      ; 6311   02B8 0032

        JSR     R5,     X_RAND2                 ; 6313   0004 0114 029E

        MVI     G_0318, R1                      ; 6316   0281 0318
        ADDR    R0,     R1                      ; 6318   00C1
        DIS                                     ; 6319   0003
        ANDI    #$00FF, R1                      ; 631A   03B9 00FF
        SDBD                                    ; 631C   0001
        XORI    #$0A00, R1                      ; 631D   03F9 0000 000A
        MVO     R1,     G_0318                  ; 6320   0241 0318
        SDBD                                    ; 6322   0001
        XORI    #$4000, R1                      ; 6323   03F9 0000 0040
        MVO     R1,     G_0319                  ; 6326   0241 0319
        EIS                                     ; 6328   0002
L_6329:
        PULR    R7                              ; 6329   02B7

        DECLE   $01E4,  $0004,  $015C,  $027F   ; 632A   01E4 0004 015C 027F
        DECLE   $0004,  $014C,  $01D2,  $02B9   ; 632E   0004 014C 01D2 02B9
        DECLE   $0064,  $0241,  $0199,  $0241   ; 6332   0064 0241 0199 0241
        DECLE   $0197,  $0004,  $015C,  $0300   ; 6336   0197 0004 015C 0300

        MVI     G_0190, R1                      ; 633A   0281 0190
        INCR    R1                              ; 633C   0009
        MVO     R1,     G_0190                  ; 633D   0241 0190
        ANDI    #$0003, R1                      ; 633F   03B9 0003
        MVI     G_0191, R2                      ; 6341   0282 0191
        CMPI    #$0005, R2                      ; 6343   037A 0005
        BPL     L_6349                          ; 6345   0203 0002

        ANDI    #$0001, R1                      ; 6347   03B9 0001
L_6349:
        TSTR    R1                              ; 6349   0089
        BNEQ    L_635E                          ; 634A   020C 0012

        MVI     G_01A9, R1                      ; 634C   0281 01A9
        INCR    R1                              ; 634E   0009
        CMPI    #$000C, R1                      ; 634F   0379 000C
        BEQ     L_6355                          ; 6351   0204 0002

        MVO     R1,     G_01A9                  ; 6353   0241 01A9
L_6355:
        MVI     G_018D, R1                      ; 6355   0281 018D
        INCR    R1                              ; 6357   0009
        CMPI    #$0008, R1                      ; 6358   0379 0008
        BEQ     L_635E                          ; 635A   0204 0002

        MVO     R1,     G_018D                  ; 635C   0241 018D
L_635E:
        MVI     G_0190, R2                      ; 635E   0282 0190
        DECLE   $037A,  $000B,  $020C,  $001C   ; 6360   037A 000B 020C 001C
        DECLE   $0280,  $0191,  $0008,  $0240   ; 6364   0280 0191 0008 0240
        DECLE   $0191,  $01C0,  $0240,  $0190   ; 6368   0191 01C0 0240 0190
        DECLE   $0004,  $015C,  $031E,  $02BA   ; 636C   0004 015C 031E 02BA
        DECLE   $0003,  $02BB,  $0318,  $0001   ; 6370   0003 02BB 0318 0001
        DECLE   $02BC,  $0029,  $005C,  $0004   ; 6374   02BC 0029 005C 0004
        DECLE   $0148,  $0387,  $0004           ; 6378   0148 0387 0004

        CMPR    R1,     R0                      ; 637B   0148
        AND     .STIC.Y.1,R0                    ; 637C   0380 0009
        SLL     R1,     2                       ; 637E   004D
        PULR    R7                              ; 637F   02B7

        DECLE   $0004                           ; 6380   0004

        CMPR    R3,     R4                      ; 6381   015C
        SUB@    R3,     R6                      ; 6382   031E
        MVII    #$0004, R0                      ; 6383   02B8 0004
        MVI     G_0191, R1                      ; 6385   0281 0191
        CMPI    #$0003, R1                      ; 6387   0379 0003
        BMI     L_638C                          ; 6389   020B 0001

        INCR    R0                              ; 638B   0008

L_638C:
        JSR     R5,     X_RAND2                 ; 638C   0004 0114 029E
        DECLE   $02F8,  $0003,  $0081,  $0004   ; 638F   02F8 0003 0081 0004
        DECLE   $015C,  $008E,  $02B9,  $00DC   ; 6393   015C 008E 02B9 00DC
        DECLE   $0241,  $0340,  $0283,  $0193   ; 6397   0241 0340 0283 0193
        DECLE   $000B,  $0243,  $0193,  $0013   ; 639B   000B 0243 0193 0013
        DECLE   $0204,  $0010,  $0013,  $0204   ; 639F   0204 0010 0013 0204
        DECLE   $0008,  $0013,  $0243,  $0193   ; 63A3   0008 0013 0243 0193
        DECLE   $0004,  $014C,  $03F2,  $0200   ; 63A7   0004 014C 03F2 0200
        DECLE   $0008,  $0004,  $014C,  $03F8   ; 63AB   0008 0004 014C 03F8
        DECLE   $0200,  $0003,  $0004,  $014C   ; 63AF   0200 0003 0004 014C
        DECLE   $03FE,  $02B7,  $0275,  $0280   ; 63B3   03FE 02B7 0275 0280
        DECLE   $0340,  $0080,  $022C,  $0006   ; 63B7   0340 0080 022C 0006

        JSR     R5,     L_5FA3                  ; 63BB   0004 015C 03A3
        DECLE   $0004,  $0350,  $00C6           ; 63BE   0004 0350 00C6

        PSHR    R5                              ; 63C1   0275
        MVI     G_0330, R1                      ; 63C2   0281 0330
        SDBD                                    ; 63C4   0001
        CMPI    #$5C53, R1                      ; 63C5   0379 0053 005C
        BNEQ    L_63D9                          ; 63C8   020C 000F

        MVI     G_0320, R1                      ; 63CA   0281 0320
        ANDI    #$007F, R1                      ; 63CC   03B9 007F
        CMPI    #$0050, R1                      ; 63CE   0379 0050
        BNC     L_63D9                          ; 63D0   0209 0007

        JSR     R5,     L_6229                  ; 63D2   0004 0160 0229

        MVII    #$001E, R1                      ; 63D5   02B9 001E
        MVO     R1,     G_0341                  ; 63D7   0241 0341
L_63D9:
        PULR    R7                              ; 63D9   02B7

        PSHR    R5                              ; 63DA   0275
        MVI     G_0341, R4                      ; 63DB   0284 0341
        TSTR    R4                              ; 63DD   00A4
        BNEQ    L_63D9                          ; 63DE   022C 0006

        JSR     R5,     L_578F                  ; 63E0   0004 0154 038F

        MVII    #$0001, R1                      ; 63E3   02B9 0001
        MVO     R1,     G_01BC                  ; 63E5   0241 01BC
        SDBD                                    ; 63E7   0001
        MVII    #$FFB0, R2                      ; 63E8   02BA 00B0 00FF

        JSR     R5,     L_5C8F                  ; 63EB   0004 015C 008F

        MVII    #$0003, R4                      ; 63EE   02BC 0003

        JSR     R5,     L_578F                  ; 63F0   0004 0154 038F

        INCR    R4                              ; 63F3   000C

        JSR     R5,     L_578F                  ; 63F4   0004 0154 038F

        INCR    R4                              ; 63F7   000C

        JSR     R5,     L_578F                  ; 63F8   0004 0154 038F
        DECLE   $0004                           ; 63FB   0004

        CMPR    R1,     R0                      ; 63FC   0148
        CMPI    #$00A6, R0                      ; 63FD   0378 00A6
        SLL     R1,     2                       ; 63FF   004D

        JSR     R5,     L_557C                  ; 6400   0004 0154 017C

L_6403:
        COMR    R6                              ; 6403   001E

L_6404:
        JSR     R5,     L_557C                  ; 6404   0004 0154 017C
        DECLE   $0001                           ; 6407   0001

        MVI     G_031F, R1                      ; 6408   0281 031F
        ANDI    #$00FF, R1                      ; 640A   03B9 00FF
        CMPI    #$0050, R1                      ; 640C   0379 0050
        BNC     L_6404                          ; 640E   0229 000B

        SDBD                                    ; 6410   0001
        ADDI    #$0A03, R1                      ; 6411   02F9 0003 000A
        MVO     R1,     G_0319                  ; 6414   0241 0319
        MVI     G_0134, R0                      ; 6416   0280 0134
        MVO     R0,     G_0128                  ; 6418   0240 0128

        JSR     R5,     L_557C                  ; 641A   0004 0154 017C
        DECLE   $0050,  $01C0,  $0240,  $01BC   ; 641D   0050 01C0 0240 01BC
        DECLE   $02B9,  $01F4,  $0004,  $015C   ; 6421   02B9 01F4 0004 015C
        DECLE   $0300,  $0004,  $0358,  $03BB   ; 6425   0300 0004 0358 03BB
        DECLE   $0049,  $0009,  $0094,  $0000   ; 6429   0049 0009 0094 0000
        DECLE   $0000,  $0000,  $0053,  $005C   ; 642D   0000 0000 0053 005C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6431   0000 0000 0000 0000
        DECLE   $0000,  $0028,  $0052,  $0008   ; 6435   0000 0028 0052 0008
        DECLE   $000F,  $0000,  $0000,  $0000   ; 6439   000F 0000 0000 0000
        DECLE   $005B,  $005C,  $0030,  $0000   ; 643D   005B 005C 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6441   0000 0000 0000 0000
        DECLE   $0000,  $0048,  $0000,  $0040   ; 6445   0000 0048 0000 0040
        DECLE   $0000,  $0000,  $0061,  $005C   ; 6449   0000 0000 0061 005C
        DECLE   $0020,  $0000,  $0000,  $0000   ; 644D   0020 0000 0000 0000
        DECLE   $00FD,  $0000,  $000A,  $0061   ; 6451   00FD 0000 000A 0061
        DECLE   $007E,  $005C,  $0001,  $0200   ; 6455   007E 005C 0001 0200
        DECLE   $00C1,  $005B,  $00DA,  $005B   ; 6459   00C1 005B 00DA 005B
        DECLE   $0066,  $005C,  $0003,  $0000   ; 645D   0066 005C 0003 0000
        DECLE   $000A,  $0061,  $0066,  $005C   ; 6461   000A 0061 0066 005C
        DECLE   $0003,  $0000,  $0000,  $0028   ; 6465   0003 0000 0000 0028
        DECLE   $0010,  $0010,  $0010,  $0028   ; 6469   0010 0010 0010 0028
        DECLE   $0028,  $0000,  $0000,  $0000   ; 646D   0028 0000 0000 0000
        DECLE   $0038,  $0010,  $0010,  $0028   ; 6471   0038 0010 0010 0028
        DECLE   $0028,  $0000,  $0000,  $0000   ; 6475   0028 0000 0000 0000
        DECLE   $0010,  $0038,  $0010,  $0028   ; 6479   0010 0038 0010 0028
        DECLE   $0028,  $000C,  $0008,  $0018   ; 647D   0028 000C 0008 0018
        DECLE   $0030,  $0033,  $0062,  $0066   ; 6481   0030 0033 0062 0066
        DECLE   $007C,  $0070,  $0072,  $007E   ; 6485   007C 0070 0072 007E
        DECLE   $0038,  $0030,  $0078,  $00D8   ; 6489   0038 0030 0078 00D8
        DECLE   $0080,  $01D2,  $0275,  $0272   ; 648D   0080 01D2 0275 0272
        DECLE   $0241,  $018C,  $0283,  $01BC   ; 6491   0241 018C 0283 01BC
        DECLE   $009B,  $020C,  $0016,  $0004   ; 6495   009B 020C 0016 0004
        DECLE   $015C,  $0384                   ; 6499   015C 0384

        DIS                                     ; 649B   0003
        MVII    #$0330, R4                      ; 649C   02BC 0330
        SDBD                                    ; 649E   0001
        MVII    #$5CF7, R3                      ; 649F   02BB 00F7 005C
L_64A2:
        MVO@    R3,     R4                      ; 64A2   0263
        ADDI    #$0006, R3                      ; 64A3   02FB 0006
        CMPI    #$0336, R4                      ; 64A5   037C 0336
        BNEQ    L_64A2                          ; 64A7   022C 0006

        MVI     G_018C, R1                      ; 64A9   0281 018C

        JSR     R5,     L_5FD0                  ; 64AB   0004 015C 03D0
        DECLE   $0003,  $02BC,  $0336,  $0001   ; 64AE   0003 02BC 0336 0001
        DECLE   $02BB,  $001B,  $005D,  $0263   ; 64B2   02BB 001B 005D 0263
        DECLE   $02FB,  $0006,  $0263,  $02B9   ; 64B6   02FB 0006 0263 02B9
        DECLE   $0010,  $0241,  $0199,  $0241   ; 64BA   0010 0241 0199 0241
        DECLE   $033F,  $0049,  $0241,  $033E   ; 64BE   033F 0049 0241 033E
        DECLE   $01E4,  $0244,  $033D,  $0002   ; 64C2   01E4 0244 033D 0002
        DECLE   $02B3,  $0001                   ; 64C6   02B3 0001

        ADDI    #$00FF, R3                      ; 64C8   02FB 00FF
        INCR    R0                              ; 64CA   0008
L_64CB:
        MVI     G_01BC, R5                      ; 64CB   0285 01BC
        TSTR    R5                              ; 64CD   00AD
        BEQ     L_64D4                          ; 64CE   0204 0004

        CMPI    #$0006, R4                      ; 64D0   037C 0006
        BNC     L_64E0                          ; 64D2   0209 000C

L_64D4:
        CLRR    R2                              ; 64D4   01D2
        DECLE   $02B9,  $001E,  $0004,  $015C   ; 64D5   02B9 001E 0004 015C
        DECLE   $0281                           ; 64D9   0281

        MOVR    R3,     R1                      ; 64DA   0099
        MVII    #$000B, R2                      ; 64DB   02BA 000B

        JSR     R5,     L_5E94                  ; 64DD   0004 015C 0294

L_64E0:
        ADDI    #$0008, R3                      ; 64E0   02FB 0008
        INCR    R4                              ; 64E2   000C
        CMPI    #$0008, R4                      ; 64E3   037C 0008
        BNEQ    L_64CB                          ; 64E5   022C 001B

        MVII    #$000A, R1                      ; 64E7   02B9 000A
        MVO     R1,     G_0326                  ; 64E9   0241 0326
        XORI    #$0080, R1                      ; 64EB   03F9 0080
        MVO     R1,     G_0327                  ; 64ED   0241 0327
        MVII    #$0171, R4                      ; 64EF   02BC 0171
L_64F1:
        MVO@    R4,     R4                      ; 64F1   0264
        CMPI    #$0179, R4                      ; 64F2   037C 0179
        BNEQ    L_64F1                          ; 64F4   022C 0004
        PULR    R7                              ; 64F6   02B7

        DECLE   $00B5,  $005B,  $0027,  $005D   ; 64F7   00B5 005B 0027 005D
        DECLE   $0008,  $0000,  $000A,  $0061   ; 64FB   0008 0000 000A 0061
        DECLE   $0067,  $005D,  $0008,  $0000   ; 64FF   0067 005D 0008 0000

        INCR    R2                              ; 6503   000A
        SLR     R1,     1                       ; 6504   0061
        MOVR    R4,     R7                      ; 6505   00A7

        DECLE   $005D,  $0008,  $0000           ; 6506   005D 0008 0000

        INCR    R2                              ; 6509   000A
        SLR     R1,     1                       ; 650A   0061
        ADDR    R4,     R7                      ; 650B   00E7

        DECLE   $005D,  $0008,  $0000,  $000A   ; 650C   005D 0008 0000 000A
        DECLE   $0061,  $0027,  $005E,  $0008   ; 6510   0061 0027 005E 0008
        DECLE   $0000,  $000A,  $0061,  $0067   ; 6514   0000 000A 0061 0067
        DECLE   $005E,  $0001,  $0000,  $000A   ; 6518   005E 0001 0000 000A
        DECLE   $0061,  $006F,  $005E,  $0002   ; 651C   0061 006F 005E 0002
        DECLE   $0000,  $000A,  $0061,  $00CB   ; 6520   0000 000A 0061 00CB
        DECLE   $0064,  $0002,  $0000,  $0080   ; 6524   0064 0002 0000 0080
        DECLE   $0080,  $0080,  $00C0,  $00AA   ; 6528   0080 0080 00C0 00AA
        DECLE   $00AA,  $00C4,  $0018,  $0000   ; 652C   00AA 00C4 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6530   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0062   ; 6534   0000 0000 0000 0062
        DECLE   $0085,  $0085,  $0085,  $00B7   ; 6538   0085 0085 0085 00B7
        DECLE   $0095,  $0095,  $0065,  $0063   ; 653C   0095 0095 0065 0063
        DECLE   $0084,  $0084,  $0084,  $00B4   ; 6540   0084 0084 0084 00B4
        DECLE   $0094,  $0094,  $0063,  $0045   ; 6544   0094 0094 0063 0045
        DECLE   $0045,  $0045,  $0045,  $0045   ; 6548   0045 0045 0045 0045
        DECLE   $0055,  $006D,  $0045,  $0000   ; 654C   0055 006D 0045 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6550   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6554   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6558   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0019   ; 655C   0000 0000 0000 0019
        DECLE   $0025,  $0025,  $003D,  $0025   ; 6560   0025 0025 003D 0025
        DECLE   $0025,  $0025,  $0025,  $000E   ; 6564   0025 0025 0025 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; 6568   0004 0004 0004 0004
        DECLE   $0004,  $0004                   ; 656C   0004 0004

        INCR    R6                              ; 656E   000E
        SARC    R0,     1                       ; 656F   0078
        MOVR    R0,     R4                      ; 6570   0084
        MOVR    R6,     R4                      ; 6571   00B4
        TSTR    R4                              ; 6572   00A4
        TSTR    R4                              ; 6573   00A4
        MOVR    R6,     R4                      ; 6574   00B4
        MOVR    R0,     R4                      ; 6575   0084
        SARC    R0,     1                       ; 6576   0078
        SWAP    R1,     2                       ; 6577   0045
        SAR     R1,     2                       ; 6578   006D
        RLC     R1,     2                       ; 6579   0055
        RLC     R1,     2                       ; 657A   0055
        SWAP    R1,     2                       ; 657B   0045
        SWAP    R1,     2                       ; 657C   0045
        SWAP    R1,     2                       ; 657D   0045
        SWAP    R1,     2                       ; 657E   0045
        COMR    R1                              ; 657F   0019
        MOVR    R4,     R5                      ; 6580   00A5
        MOVR    R4,     R5                      ; 6581   00A5
        MOVR    R4,     R5                      ; 6582   00A5
        MOVR    R4,     R5                      ; 6583   00A5
        MOVR    R4,     R5                      ; 6584   00A5
        MOVR    R4,     R5                      ; 6585   00A5
        COMR    R1                              ; 6586   0019
        ADDR    R2,     R1                      ; 6587   00D1
        DECR    R1                              ; 6588   0011
        DECR    R1                              ; 6589   0011
        MOVR    R2,     R1                      ; 658A   0091
        DECR    R1                              ; 658B   0011
        DECR    R1                              ; 658C   0011
        DECR    R1                              ; 658D   0011
        ADDR    R3,     R5                      ; 658E   00DD
        INCR    R0                              ; 658F   0008
        INCR    R0                              ; 6590   0008
        INCR    R0                              ; 6591   0008
        INCR    R0                              ; 6592   0008
        INCR    R0                              ; 6593   0008
        INCR    R0                              ; 6594   0008
        INCR    R0                              ; 6595   0008
        INCR    R6                              ; 6596   000E
        MOVR    R2,     R3                      ; 6597   0093
        MOVR    R2,     R4                      ; 6598   0094
        ADDR    R2,     R4                      ; 6599   00D4
        ADDR    R2,     R4                      ; 659A   00D4
        MOVR    R6,     R4                      ; 659B   00B4
        MOVR    R6,     R4                      ; 659C   00B4
        MOVR    R2,     R4                      ; 659D   0094
        MOVR    R2,     R3                      ; 659E   0093
L_659F:
        DECR    R7                              ; 659F   0017

        DECR    R4                              ; 65A0   0014
        DECR    R4                              ; 65A1   0014
        DECR    R6                              ; 65A2   0016
        DECR    R4                              ; 65A3   0014
        RLC     R0,     2                       ; 65A4   0054
        MOVR    R6,     R4                      ; 65A5   00B4
L_65A6:
        DECR    R7                              ; 65A6   0017

        DECLE   $0089,  $00DA,  $00AA,  $008B   ; 65A7   0089 00DA 00AA 008B
        DECLE   $008A,  $008A,  $008A,  $008A   ; 65AB   008A 008A 008A 008A
        DECLE   $0046,  $00C9,  $0049,  $0047   ; 65AF   0046 00C9 0049 0047
        DECLE   $0041,  $0041,  $0049,  $00E6   ; 65B3   0041 0041 0049 00E6
        DECLE   $00C3,  $0004,  $0004,  $0084   ; 65B7   00C3 0004 0004 0084
        DECLE   $0004,  $0004,  $0004           ; 65BB   0004 0004 0004

        ADDR    R0,     R3                      ; 65BE   00C3
        ADDR    R0,     R0                      ; 65BF   00C0
        NEGR    R0                              ; 65C0   0020
        NEGR    R0                              ; 65C1   0020
        NEGR    R0                              ; 65C2   0020
        NEGR    R0                              ; 65C3   0020
        NEGR    R0                              ; 65C4   0020
        NEGR    R1                              ; 65C5   0021
        ADDR    R0,     R1                      ; 65C6   00C1
        DIS                                     ; 65C7   0003
        EIS                                     ; 65C8   0002
        EIS                                     ; 65C9   0002
        EIS                                     ; 65CA   0002
        EIS                                     ; 65CB   0002
        EIS                                     ; 65CC   0002
        EIS                                     ; 65CD   0002
        ADDR    R0,     R3                      ; 65CE   00C3
        MOVR    R2,     R3                      ; 65CF   0093
        MOVR    R2,     R4                      ; 65D0   0094
        MOVR    R2,     R4                      ; 65D1   0094
        MOVR    R2,     R4                      ; 65D2   0094
        MOVR    R2,     R4                      ; 65D3   0094
        MOVR    R2,     R4                      ; 65D4   0094
        MOVR    R2,     R4                      ; 65D5   0094
        RRC     R3,     1                       ; 65D6   0073
        RSWD    R0                              ; 65D7   0038
        MOVR    R2,     R0                      ; 65D8   0090
        MOVR    R2,     R0                      ; 65D9   0090
        MOVR    R2,     R0                      ; 65DA   0090
        MOVR    R2,     R0                      ; 65DB   0090
        MOVR    R2,     R0                      ; 65DC   0090
        MOVR    R2,     R0                      ; 65DD   0090
        DECR    R0                              ; 65DE   0010
        GSWD    R3                              ; 65DF   0033
        RLC     R0,     2                       ; 65E0   0054
        SWAP    R0,     2                       ; 65E1   0044
        SLR     R0,     2                       ; 65E2   0064
        DECR    R4                              ; 65E3   0014
        DECR    R4                              ; 65E4   0014
        RLC     R0,     2                       ; 65E5   0054
        SLR     R3,     1                       ; 65E6   0063
        MOVR    R1,     R4                      ; 65E7   008C
        RLC     R0,     1                       ; 65E8   0050
        RLC     R0,     1                       ; 65E9   0050
        ADDR    R2,     R0                      ; 65EA   00D0
        RLC     R2,     2                       ; 65EB   0056
        RLC     R2,     1                       ; 65EC   0052
        RLC     R2,     1                       ; 65ED   0052
        SLL     R0,     2                       ; 65EE   004C
        GSWD    R1                              ; 65EF   0031
        SLL     R2,     1                       ; 65F0   004A
        SLL     R0,     1                       ; 65F1   0048
        GSWD    R0                              ; 65F2   0030
        SLL     R1,     1                       ; 65F3   0049
        SLL     R2,     1                       ; 65F4   004A
        SLL     R2,     1                       ; 65F5   004A
        GSWD    R3                              ; 65F6   0033
        NEGR    R2                              ; 65F7   0022
        MOVR    R4,     R2                      ; 65F8   00A2
        MOVR    R4,     R2                      ; 65F9   00A2
        MOVR    R4,     R2                      ; 65FA   00A2
        MOVR    R2,     R4                      ; 65FB   0094
        MOVR    R2,     R4                      ; 65FC   0094
        MOVR    R2,     R4                      ; 65FD   0094
        INCR    R0                              ; 65FE   0008
        ADDR    R4,     R6                      ; 65FF   00E6
        SLL     R1,     1                       ; 6600   0049
        SLL     R1,     1                       ; 6601   0049
        SLL     R1,     1                       ; 6602   0049
        SLL     R1,     1                       ; 6603   0049
        SLL     R1,     1                       ; 6604   0049
        SLL     R1,     1                       ; 6605   0049
        ADDR    R0,     R6                      ; 6606   00C6
        TSTR    R1                              ; 6607   0089
        RLC     R1,     2                       ; 6608   0055
        RLC     R1,     2                       ; 6609   0055
        RLC     R1,     2                       ; 660A   0055
        RLC     R1,     2                       ; 660B   0055
        RLC     R1,     2                       ; 660C   0055
        RLC     R1,     2                       ; 660D   0055
        TSTR    R1                              ; 660E   0089
        NEGR    R5                              ; 660F   0025
        MOVR    R5,     R0                      ; 6610   00A8
        ADCR    R0                              ; 6611   0028
        GSWD    R0                              ; 6612   0030
        ADCR    R0                              ; 6613   0028
        ADCR    R0                              ; 6614   0028
        TSTR    R4                              ; 6615   00A4
        NEGR    R4                              ; 6616   0024
        ADDR    R4,     R3                      ; 6617   00E3
        MOVR    R2,     R4                      ; 6618   0094
        MOVR    R2,     R4                      ; 6619   0094
        ADDR    R4,     R7                      ; 661A   00E7

        DECLE   $0094,  $0094,  $0094,  $00E4   ; 661B   0094 0094 0094 00E4
        DECLE   $0022,  $00B6,  $00AA,  $00A2   ; 661F   0022 00B6 00AA 00A2
        DECLE   $00A2,  $00A2,  $00A2,  $0022   ; 6623   00A2 00A2 00A2 0022
        DECLE   $00E6,  $0049,  $0048,  $0048   ; 6627   00E6 0049 0048 0048
        DECLE   $0048,  $0048,  $0049,  $00E6   ; 662B   0048 0048 0049 00E6
        DECLE   $0080,  $0040,  $0040,  $0080   ; 662F   0080 0040 0040 0080
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6633   0000 0000 0000 00C0
        DECLE   $00EE,  $0089,  $0089,  $00CE   ; 6637   00EE 0089 0089 00CE
        DECLE   $008C,  $008A,  $0089,  $00E9   ; 663B   008C 008A 0089 00E9
        DECLE   $0072,  $004A,  $004A,  $0072   ; 663F   0072 004A 004A 0072
        DECLE   $004A,  $0048,  $004A,  $0072   ; 6643   004A 0048 004A 0072
        DECLE   $002E,  $0028,  $00A8,  $00AC   ; 6647   002E 0028 00A8 00AC
        DECLE   $0068,  $0068,  $0028,  $002E   ; 664B   0068 0068 0028 002E
        DECLE   $0010,  $00A0,  $00A0,  $0040   ; 664F   0010 00A0 00A0 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6653   0040 0040 0040 0040
        DECLE   $0038,  $00A4,  $00A4,  $00A4   ; 6657   0038 00A4 00A4 00A4
        DECLE   $00A4,  $00A4,  $00A4,  $00B8   ; 665B   00A4 00A4 00A4 00B8
        DECLE   $00E0,  $0080,  $0080,  $00C0   ; 665F   00E0 0080 0080 00C0
        DECLE   $0080,  $0080,  $0080,  $00E0   ; 6663   0080 0080 0080 00E0
        DECLE   $0040,  $0020,  $0010,  $0008   ; 6667   0040 0020 0010 0008
        DECLE   $0007,  $0008,  $0030,  $0040   ; 666B   0007 0008 0030 0040
        DECLE   $0000,  $0030,  $0031,  $0030   ; 666F   0000 0030 0031 0030
        DECLE   $0038,  $003F,  $000F,  $0000   ; 6673   0038 003F 000F 0000
        DECLE   $0000,  $0030,  $0030,  $0031   ; 6677   0000 0030 0030 0031
        DECLE   $0038,  $003F,  $000F,  $0000   ; 667B   0038 003F 000F 0000

        CLRR    R1                              ; 667F   01C9
        CLRR    R2                              ; 6680   01D2
        PSHR    R5                              ; 6681   0275
        PSHR    R3                              ; 6682   0273
        PSHR    R0                              ; 6683   0270
        MVII    #$0126, R3                      ; 6684   02BB 0126
        ADDR    R4,     R3                      ; 6686   00E3
        ADDR    R4,     R3                      ; 6687   00E3
        MVO@    R1,     R3                      ; 6688   0259
        CLRR    R0                              ; 6689   01C0
        DECR    R3                              ; 668A   0013
        MVO@    R0,     R3                      ; 668B   0258
        ADDI    #$0011, R3                      ; 668C   02FB 0011
        MVO@    R2,     R3                      ; 668E   025A
        DECR    R3                              ; 668F   0013
        MVO@    R0,     R3                      ; 6690   0258
        PULR    R0                              ; 6691   02B0
        PULR    R3                              ; 6692   02B3
        PULR    R7                              ; 6693   02B7

        PSHR    R5                              ; 6694   0275
        PSHR    R3                              ; 6695   0273
        MVII    #$0318, R3                      ; 6696   02BB 0318
        ADDR    R4,     R3                      ; 6698   00E3
        MVO@    R1,     R3                      ; 6699   0259
        MVII    #$0320, R3                      ; 669A   02BB 0320
        ADDR    R4,     R3                      ; 669C   00E3
        MVO@    R2,     R3                      ; 669D   025A
        PULR    R3                              ; 669E   02B3
        PULR    R7                              ; 669F   02B7

        PSHR    R5                              ; 66A0   0275
        PSHR    R3                              ; 66A1   0273
        MVI     G_0330, R3                      ; 66A2   0283 0330
        SDBD                                    ; 66A4   0001
        CMPI    #$5CF7, R3                      ; 66A5   037B 00F7 005C
        BEQ     L_66C0                          ; 66A8   0204 0016

        TSTR    R4                              ; 66AA   00A4
        BNEQ    L_66B2                          ; 66AB   020C 0005

        MVI     G_0199, R5                      ; 66AD   0285 0199
        TSTR    R5                              ; 66AF   00AD
        BNEQ    L_66C0                          ; 66B0   020C 000E

L_66B2:
        MVII    #$0338, R3                      ; 66B2   02BB 0338
        ADDR    R4,     R3                      ; 66B4   00E3
        MVO@    R1,     R3                      ; 66B5   0259
        MVII    #$0330, R3                      ; 66B6   02BB 0330
        ADDR    R4,     R3                      ; 66B8   00E3
        MVO@    R2,     R3                      ; 66B9   025A
        MVII    #$0171, R3                      ; 66BA   02BB 0171
        ADDR    R4,     R3                      ; 66BC   00E3
        MVII    #$0088, R5                      ; 66BD   02BD 0088
        MVO@    R5,     R3                      ; 66BF   025D
L_66C0:
        PULR    R3                              ; 66C0   02B3
        PULR    R7                              ; 66C1   02B7

        PSHR    R5                              ; 66C2   0275
        PSHR    R3                              ; 66C3   0273
        MVII    #$0328, R3                      ; 66C4   02BB 0328
        ADDR    R4,     R3                      ; 66C6   00E3
        MVI@    R3,     R5                      ; 66C7   029D
        SDBD                                    ; 66C8   0001
        ANDI    #$EFFF, R5                      ; 66C9   03BD 00FF 00EF
        SDBD                                    ; 66CC   0001
        ANDI    #$FFF8, R5                      ; 66CD   03BD 00F8 00FF
        COMR    R5                              ; 66D0   001D
        ANDR    R5,     R1                      ; 66D1   01A9
        COMR    R5                              ; 66D2   001D
        XORR    R5,     R1                      ; 66D3   01E9
        MVO@    R1,     R3                      ; 66D4   0259
        MVII    #$0340, R3                      ; 66D5   02BB 0340
        ADDR    R4,     R3                      ; 66D7   00E3
        MVO@    R2,     R3                      ; 66D8   025A
        PULR    R3                              ; 66D9   02B3
        PULR    R7                              ; 66DA   02B7

        PSHR    R5                              ; 66DB   0275
        MVII    #$0332, R4                      ; 66DC   02BC 0332
L_66DE:
        MVI@    R4,     R1                      ; 66DE   02A1
        TSTR    R1                              ; 66DF   0089
        BEQ     L_66E9                          ; 66E0   0204 0007

        CMPI    #$0337, R4                      ; 66E2   037C 0337
        BNC     L_66DE                          ; 66E4   0229 0007

        ANDI    #$0000, R1                      ; 66E6   03B9 0000
        PULR    R7                              ; 66E8   02B7

L_66E9:
        SUBI    #$0331, R4                      ; 66E9   033C 0331
        INCR    R1                              ; 66EB   0009
        PULR    R7                              ; 66EC   02B7

        PSHR    R1                              ; 66ED   0271
        PSHR    R2                              ; 66EE   0272
        CLRR    R1                              ; 66EF   01C9
        SUBI    #$000C, R2                      ; 66F0   033A 000C
        BMI     L_66FA                          ; 66F2   020B 0006

L_66F4:
        ADDI    #$0018, R1                      ; 66F4   02F9 0018
        SUBI    #$0018, R2                      ; 66F6   033A 0018
        BPL     L_66F4                          ; 66F8   0223 0005

L_66FA:
        MOVR    R1,     R2                      ; 66FA   008A
        MOVR    R1,     R0                      ; 66FB   0088
        PULR    R1                              ; 66FC   02B1
        SUBR    R1,     R0                      ; 66FD   0108
        PULR    R1                              ; 66FE   02B1
        MOVR    R5,     R7                      ; 66FF   00AF

        PSHR    R5                              ; 6700   0275
        PSHR    R3                              ; 6701   0273
        PSHR    R0                              ; 6702   0270
        MVII    #$0185, R3                      ; 6703   02BB 0185
L_6705:
        MVI@    R3,     R0                      ; 6705   0298
        ADDR    R1,     R0                      ; 6706   00C8
        INCR    R3                              ; 6707   000B
        MVI@    R3,     R1                      ; 6708   0299
L_6709:
        CMPI    #$0064, R0                      ; 6709   0378 0064
        BNC     L_6712                          ; 670B   0209 0005

        SUBI    #$0064, R0                      ; 670D   0338 0064
        INCR    R1                              ; 670F   0009
        B       L_6709                          ; 6710   0220 0008

L_6712:
        MVO@    R1,     R3                      ; 6712   0259
        DECR    R3                              ; 6713   0013
        MVO@    R0,     R3                      ; 6714   0258
        INCR    R3                              ; 6715   000B
        CLRR    R1                              ; 6716   01C9
        CMPI    #$0189, R3                      ; 6717   037B 0189
        BNC     L_6705                          ; 6719   0229 0015

        PULR    R0                              ; 671B   02B0
        PULR    R3                              ; 671C   02B3
        PULR    R7                              ; 671D   02B7

        PSHR    R5                              ; 671E   0275

        JSR     R5,     L_5FB7                  ; 671F   0004 015C 03B7
        DECLE   $0004,  $015C,  $0384           ; 6722   0004 015C 0384

        DIS                                     ; 6725   0003

        JSR     R5,     L_539B                  ; 6726   0004 0150 039B

        CLRR    R1                              ; 6729   01C9
        MVII    #$0187, R2                      ; 672A   02BA 0187
        MVII    #$0233, R4                      ; 672C   02BC 0233
        PSHR    R4                              ; 672E   0274
L_672F:
        MVI@    R2,     R0                      ; 672F   0290
        TSTR    R1                              ; 6730   0089
        BNEQ    L_673A                          ; 6731   020C 0007

        CMPI    #$0185, R2                      ; 6733   037A 0185
        BEQ     L_673A                          ; 6735   0204 0003

        TSTR    R0                              ; 6737   0080
        BEQ     L_6758                          ; 6738   0204 001E

L_673A:
        PSHR    R1                              ; 673A   0271
        PSHR    R0                              ; 673B   0270
        MVII    #$0002, R1                      ; 673C   02B9 0002
        MVII    #$0006, R3                      ; 673E   02BB 0006

        JSR     R5,     X_PRNUM_RGT             ; 6740   0004 0118 00C5

        PULR    R0                              ; 6743   02B0
        PULR    R1                              ; 6744   02B1
        CMPI    #$000A, R0                      ; 6745   0378 000A
        BC      L_6754                          ; 6747   0201 000B

        TSTR    R1                              ; 6749   0089
        BEQ     L_6754                          ; 674A   0204 0008

        CLRR    R0                              ; 674C   01C0
        MVII    #$0001, R1                      ; 674D   02B9 0001
        MVII    #$0006, R3                      ; 674F   02BB 0006

        JSR     R5,     X_PRNUM_RGT             ; 6751   0004 0118 00C5

L_6754:
        MVII    #$0001, R1                      ; 6754   02B9 0001
        ADDI    #$0002, R4                      ; 6756   02FC 0002
L_6758:
        DECR    R2                              ; 6758   0012
        CMPI    #$0184, R2                      ; 6759   037A 0184
        BNEQ    L_672F                          ; 675B   022C 002D

        PULR    R4                              ; 675D   02B4
        MVII    #$0006, R3                      ; 675E   02BB 0006
L_6760:
        MVI@    R4,     R1                      ; 6760   02A1
        DECR    R4                              ; 6761   0014
        SDBD                                    ; 6762   0001
        ANDI    #$CDFF, R1                      ; 6763   03B9 00FF 00CD
        SDBD                                    ; 6766   0001
        XORI    #$3200, R1                      ; 6767   03F9 0000 0032
        MVO@    R1,     R4                      ; 676A   0261
        DECR    R3                              ; 676B   0013
        BNEQ    L_6760                          ; 676C   022C 000D

        EIS                                     ; 676E   0002
        PULR    R7                              ; 676F   02B7

        PSHR    R5                              ; 6770   0275
        MVII    #$0318, R1                      ; 6771   02B9 0318
        ADDR    R4,     R1                      ; 6773   00E1
        MVI@    R1,     R0                      ; 6774   0288
        ANDI    #$00FF, R0                      ; 6775   03B8 00FF
        MVI     G_018E, R1                      ; 6777   0281 018E
        CMPR    R0,     R1                      ; 6779   0141
        BPL     L_6782                          ; 677A   0203 0006

        MVI     G_018F, R1                      ; 677C   0281 018F
        CMPR    R0,     R1                      ; 677E   0141
        BMI     L_6782                          ; 677F   020B 0001

        CLRR    R1                              ; 6781   01C9
L_6782:
        TSTR    R1                              ; 6782   0089
        PULR    R7                              ; 6783   02B7

        PSHR    R5                              ; 6784   0275
        MVII    #$0007, R4                      ; 6785   02BC 0007

        JSR     R5,     L_578F                  ; 6787   0004 0154 038F

        MVII    #$0001, R4                      ; 678A   02BC 0001

        JSR     R5,     L_578F                  ; 678C   0004 0154 038F

        DECR    R4                              ; 678F   0014

        JSR     R5,     L_578F                  ; 6790   0004 0154 038F
        DECLE   $0004,  $015C,  $0397           ; 6793   0004 015C 0397

        PULR    R7                              ; 6796   02B7

        PSHR    R5                              ; 6797   0275
        MVII    #$0002, R4                      ; 6798   02BC 0002

L_679A:
        JSR     R5,     L_578F                  ; 679A   0004 0154 038F

        INCR    R4                              ; 679D   000C
        CMPI    #$0007, R4                      ; 679E   037C 0007
        BNC     L_679A                          ; 67A0   0229 0007
        PULR    R7                              ; 67A2   02B7

        CLRR    R2                              ; 67A3   01D2
        B       L_67A8                          ; 67A4   0200 0002

        MVII    #$0080, R2                      ; 67A6   02BA 0080
L_67A8:
        MVO     R2,     G_0198                  ; 67A8   0242 0198
        MVII    #$016C, R3                      ; 67AA   02BB 016C
L_67AC:
        MVI@    R3,     R1                      ; 67AC   0299
        ANDI    #$007F, R1                      ; 67AD   03B9 007F
        XORR    R2,     R1                      ; 67AF   01D1
        MVO@    R1,     R3                      ; 67B0   0259
        INCR    R3                              ; 67B1   000B
        CMPI    #$0171, R3                      ; 67B2   037B 0171
        BNEQ    L_67AC                          ; 67B4   022C 0009
        MOVR    R5,     R7                      ; 67B6   00AF

        DECLE   $0275,  $0004,  $015C,  $03A6   ; 67B7   0275 0004 015C 03A6

        MVII    #$016D, R1                      ; 67BB   02B9 016D
        MVI@    R1,     R2                      ; 67BD   028A
        ANDI    #$007F, R2                      ; 67BE   03BA 007F
        MVO@    R2,     R1                      ; 67C0   024A
        PULR    R7                              ; 67C1   02B7

        PSHR    R0                              ; 67C2   0270
        PSHR    R1                              ; 67C3   0271
        PSHR    R2                              ; 67C4   0272
        NOP                                     ; 67C5   0034
        PSHR    R3                              ; 67C6   0273
        PSHR    R4                              ; 67C7   0274
        MOVR    R5,     R7                      ; 67C8   00AF

        PULR    R4                              ; 67C9   02B4
        PULR    R3                              ; 67CA   02B3
        PULR    R2                              ; 67CB   02B2
        NOP                                     ; 67CC   0034
        PULR    R1                              ; 67CD   02B1
        PULR    R0                              ; 67CE   02B0
        MOVR    R5,     R7                      ; 67CF   00AF

        MVO     R1,     G_0338                  ; 67D0   0241 0338
        MVO     R1,     G_0339                  ; 67D2   0241 0339
        MVO     R1,     G_033A                  ; 67D4   0241 033A
        NOP                                     ; 67D6   0034
        MVO     R1,     G_033B                  ; 67D7   0241 033B
        MVO     R1,     G_033C                  ; 67D9   0241 033C
        MOVR    R5,     R7                      ; 67DB   00AF

        PSHR    R1                              ; 67DC   0271
        PSHR    R2                              ; 67DD   0272
L_67DE:
        SDBD                                    ; 67DE   0001
        MVI@    R4,     R1                      ; 67DF   02A1
        TSTR    R1                              ; 67E0   0089
        BEQ     L_67E9                          ; 67E1   0204 0006

        MVI@    R4,     R2                      ; 67E3   02A2
        ADDI    #$0200, R2                      ; 67E4   02FA 0200
        MVO@    R1,     R2                      ; 67E6   0251
        B       L_67DE                          ; 67E7   0220 000A

L_67E9:
        PULR    R2                              ; 67E9   02B2
        PULR    R1                              ; 67EA   02B1
        MOVR    R5,     R7                      ; 67EB   00AF

        PSHR    R0                              ; 67EC   0270
        MVI     G_0330, R0                      ; 67ED   0280 0330
        SDBD                                    ; 67EF   0001
        CMPI    #$5CF7, R0                      ; 67F0   0378 00F7 005C
        PULR    R0                              ; 67F3   02B0
        BNEQ    L_67F8                          ; 67F4   020C 0002

        ADDI    #$0003, R5                      ; 67F6   02FD 0003
L_67F8:
        MOVR    R5,     R7                      ; 67F8   00AF

        PSHR    R5                              ; 67F9   0275

        JSR     R5,     L_57D7                  ; 67FA   0004 0154 03D7

        MVI     G_0330, R3                      ; 67FD   0283 0330
        SDBD                                    ; 67FF   0001
        CMPI    #$5C53, R3                      ; 6800   037B 0053 005C
        BNEQ    L_6812                          ; 6803   020C 000D

        TSTR    R1                              ; 6805   0089
        BEQ     L_6812                          ; 6806   0204 000A

        CMPI    #$0003, R0                      ; 6808   0378 0003
        BNEQ    L_6812                          ; 680A   020C 0006

        SDBD                                    ; 680C   0001
        MVII    #$1EB3, R2                      ; 680D   02BA 00B3 001E
        MVO     R2,     .BTAB.31                ; 6810   0242 0231
L_6812:
        PULR    R7                              ; 6812   02B7

        PSHR    R5                              ; 6813   0275

        JSR     R5,     L_57D7                  ; 6814   0004 0154 03D7

        MVO     R0,     G_01A5                  ; 6817   0240 01A5
        MVI     G_01A2, R1                      ; 6819   0281 01A2
        MVI     G_0199, R2                      ; 681B   0282 0199
        ADDR    R2,     R1                      ; 681D   00D1
        BNEQ    L_686D                          ; 681E   020C 004D

L_6820:
        MVI     G_01A5, R0                      ; 6820   0280 01A5
        CMPI    #$00FF, R0                      ; 6822   0378 00FF
        BEQ     L_690B                          ; 6824   0204 00E5

        CMPI    #$0002, R0                      ; 6826   0378 0002
        BNC     L_688C                          ; 6828   0209 0062

        CMPI    #$0006, R0                      ; 682A   0378 0006
        BNC     L_6838                          ; 682C   0209 000A

        CMPI    #$000A, R0                      ; 682E   0378 000A
        BNC     L_68A0                          ; 6830   0209 006E

        CMPI    #$000E, R0                      ; 6832   0378 000E
        BNC     L_686E                          ; 6834   0209 0038
        B       L_688C                          ; 6836   0200 0054

L_6838:
        MVI     G_0197, R0                      ; 6838   0280 0197
        TSTR    R0                              ; 683A   0080
        BNEQ    L_6854                          ; 683B   020C 0017

        SDBD                                    ; 683D   0001
        MVII    #$FFFF, R2                      ; 683E   02BA 00FF 00FF

        JSR     R5,     L_6154                  ; 6841   0004 0160 0154

        MVI     G_0320, R0                      ; 6844   0280 0320
        ANDI    #$007F, R0                      ; 6846   03B8 007F
        CMPI    #$0011, R0                      ; 6848   0378 0011
        BNC     L_686D                          ; 684A   0209 0021

        MVO     R0,     G_0197                  ; 684C   0240 0197
        MVI     G_0320, R1                      ; 684E   0281 0320
        SUBI    #$0003, R1                      ; 6850   0339 0003
        MVO     R1,     G_0320                  ; 6852   0241 0320
L_6854:
        MVII    #$00D0, R2                      ; 6854   02BA 00D0
L_6856:
        CLRR    R1                              ; 6856   01C9
        DECLE   $01E4,  $0004,  $015C,  $0281   ; 6857   01E4 0004 015C 0281
        DECLE   $02B9,  $0020,  $0001,  $02BA   ; 685B   02B9 0020 0001 02BA
        DECLE   $00C4,  $0062,  $0004,  $015C   ; 685F   00C4 0062 0004 015C
        DECLE   $02A0,  $02BC,  $0001,  $0001   ; 6863   02A0 02BC 0001 0001
        DECLE   $02BA,  $00CA,  $0062,  $0004   ; 6867   02BA 00CA 0062 0004
        DECLE   $015C,  $02A0                   ; 686B   015C 02A0
L_686D:
        PULR    R7                              ; 686D   02B7

L_686E:
        MVI     G_0197, R0                      ; 686E   0280 0197
        TSTR    R0                              ; 6870   0080
        BNEQ    L_6888                          ; 6871   020C 0015

        MVII    #$003B, R2                      ; 6873   02BA 003B

        JSR     R5,     L_6154                  ; 6875   0004 0160 0154

        MVI     G_0320, R0                      ; 6878   0280 0320
        ANDI    #$007F, R0                      ; 687A   03B8 007F
        CMPI    #$0057, R0                      ; 687C   0378 0057
        BPL     L_686D                          ; 687E   0223 0012

        MVO     R0,     G_0197                  ; 6880   0240 0197
        MVI     G_0320, R1                      ; 6882   0281 0320
        ADDI    #$0003, R1                      ; 6884   02F9 0003
        MVO     R1,     G_0320                  ; 6886   0241 0320
L_6888:
        MVII    #$0030, R2                      ; 6888   02BA 0030
        B       L_6856                          ; 688A   0220 0035

L_688C:
        MVI     G_0197, R0                      ; 688C   0280 0197
        TSTR    R0                              ; 688E   0080
        BNEQ    L_686D                          ; 688F   022C 0023

        MVII    #$0001, R1                      ; 6891   02B9 0001

        JSR     R5,     L_6100                  ; 6893   0004 0160 0100

        MVII    #$0032, R2                      ; 6896   02BA 0032
        MVI     G_0320, R5                      ; 6898   0285 0320
        SDBD                                    ; 689A   0001
        ANDI    #$FBFF, R5                      ; 689B   03BD 00FF 00FB
        B       L_68B8                          ; 689E   0200 0018

L_68A0:
        MVI     G_0197, R0                      ; 68A0   0280 0197
        TSTR    R0                              ; 68A2   0080
        BNEQ    L_686D                          ; 68A3   022C 0037

        MVII    #$0002, R1                      ; 68A5   02B9 0002

        JSR     R5,     L_6100                  ; 68A7   0004 0160 0100

        SDBD                                    ; 68AA   0001
        MVII    #$FFCE, R2                      ; 68AB   02BA 00CE 00FF
        MVI     G_0320, R5                      ; 68AE   0285 0320
        SDBD                                    ; 68B0   0001
        ANDI    #$FBFF, R5                      ; 68B1   03BD 00FF 00FB
        SDBD                                    ; 68B4   0001
        XORI    #$0400, R5                      ; 68B5   03FD 0000 0004
L_68B8:
        MVO     R2,     G_0126                  ; 68B8   0242 0126
        DECLE   $0245,  $0320,  $0001,  $03FD   ; 68BA   0245 0320 0001 03FD
        DECLE   $0000,  $0040,  $0245,  $0321   ; 68BE   0000 0040 0245 0321
        DECLE   $0001,  $02BA,  $00A6,  $0062   ; 68C2   0001 02BA 00A6 0062
        DECLE   $02B9,  $0010,  $01E4,  $0004   ; 68C6   02B9 0010 01E4 0004
        DECLE   $015C,  $02A0,  $0001,  $02BA   ; 68CA   015C 02A0 0001 02BA
        DECLE   $00AC,  $0062,  $000C,  $0004   ; 68CE   00AC 0062 000C 0004
        DECLE   $015C,  $02A0                   ; 68D2   015C 02A0

        PULR    R7                              ; 68D4   02B7

        DECLE   $01E4,  $0004,  $015C,  $027F   ; 68D5   01E4 0004 015C 027F
        DECLE   $0241,  $01A3,  $0241,  $01A4   ; 68D9   0241 01A3 0241 01A4
        DECLE   $0001,  $02BA,  $0094,  $0062   ; 68DD   0001 02BA 0094 0062
        DECLE   $0004,  $015C,  $02A0,  $0001   ; 68E1   0004 015C 02A0 0001
        DECLE   $02BA,  $009A,  $0062,  $000C   ; 68E5   02BA 009A 0062 000C
        DECLE   $0004,  $015C,  $02A0           ; 68E9   0004 015C 02A0

        MVI     G_0320, R1                      ; 68EC   0281 0320
        MOVR    R1,     R2                      ; 68EE   008A
        ANDI    #$007F, R2                      ; 68EF   03BA 007F
        ADDI    #$0008, R2                      ; 68F1   02FA 0008

        JSR     R5,     L_5EED                  ; 68F3   0004 015C 02ED
        DECLE   $00C1,  $0011,  $0241,  $0320   ; 68F6   00C1 0011 0241 0320
        DECLE   $01C0,  $0240,  $0197,  $0004   ; 68FA   01C0 0240 0197 0004
        DECLE   $0360,  $0210                   ; 68FE   0360 0210

        MVI     G_01A4, R2                      ; 6900   0282 01A4
        CMPR    R1,     R2                      ; 6902   014A
        BEQ     L_6908                          ; 6903   0204 0003

        CLRR    R0                              ; 6905   01C0
        MVO     R0,     G_01A3                  ; 6906   0240 01A3
L_6908:
        MVO     R1,     G_01A4                  ; 6908   0241 01A4
        MOVR    R5,     R7                      ; 690A   00AF

L_690B:
        MVII    #$00FE, R0                      ; 690B   02B8 00FE
        MVO     R0,     G_01A5                  ; 690D   0240 01A5
        MVII    #$0005, R1                      ; 690F   02B9 0005
        MVO     R1,     G_0347                  ; 6911   0241 0347
        PULR    R7                              ; 6913   02B7

        DECLE   $0275,  $0280,  $01A5,  $0378   ; 6914   0275 0280 01A5 0378
        DECLE   $00FE,  $020C,  $0038,  $0280   ; 6918   00FE 020C 0038 0280
        DECLE   $0199,  $0281,  $01A2,  $00C8   ; 691C   0199 0281 01A2 00C8
        DECLE   $020C,  $0031,  $01C0,  $0240   ; 6920   020C 0031 01C0 0240
        DECLE   $01A3,  $0240,  $01A4,  $0240   ; 6924   01A3 0240 01A4 0240
        DECLE   $0136,  $0034,  $0240,  $0126   ; 6928   0136 0034 0240 0126
        DECLE   $0280,  $0338,  $0001,  $03B8   ; 692C   0280 0338 0001 03B8
        DECLE   $000F,  $00FF,  $0240,  $0338   ; 6930   000F 00FF 0240 0338
        DECLE   $0280,  $0339,  $0001,  $03B8   ; 6934   0280 0339 0001 03B8
        DECLE   $000F,  $00FF,  $0240,  $0339   ; 6938   000F 00FF 0240 0339
        DECLE   $0281,  $0197,  $0089,  $020C   ; 693C   0281 0197 0089 020C
        DECLE   $0012,  $0281,  $0338,  $0001   ; 6940   0012 0281 0338 0001
        DECLE   $02BA,  $0094,  $0062,  $01E4   ; 6944   02BA 0094 0062 01E4
        DECLE   $0004,  $015C,  $02A0,  $0001   ; 6948   0004 015C 02A0 0001
        DECLE   $02BA,  $009A,  $0062,  $000C   ; 694C   02BA 009A 0062 000C
        DECLE   $0004,  $015C,  $02A0           ; 6950   0004 015C 02A0

        PULR    R7                              ; 6953   02B7

        MVI     G_0318, R3                      ; 6954   0283 0318
        ADDI    #$0004, R3                      ; 6956   02FB 0004
        ANDI    #$00FF, R3                      ; 6958   03BB 00FF
        SLR     R3,     2                       ; 695A   0067
        SLR     R3,     1                       ; 695B   0063
        MVI     G_0320, R1                      ; 695C   0281 0320
        SUBI    #$0004, R1                      ; 695E   0339 0004
        ANDI    #$007F, R1                      ; 6960   03B9 007F
        SLR     R1,     2                       ; 6962   0065
        SLR     R1,     1                       ; 6963   0061
        SLL     R1,     2                       ; 6964   004D
        ADDR    R1,     R3                      ; 6965   00CB
        SLL     R1,     2                       ; 6966   004D
        ADDR    R1,     R3                      ; 6967   00CB
        ADDI    #$0200, R3                      ; 6968   02FB 0200
        ADDR    R2,     R3                      ; 696A   00D3
        MVI@    R3,     R1                      ; 696B   0299
        SDBD                                    ; 696C   0001
        CMPI    #$0807, R1                      ; 696D   0379 0007 0008
        BEQ     L_6979                          ; 6970   0204 0007

        SDBD                                    ; 6972   0001
        CMPI    #$08CF, R1                      ; 6973   0379 00CF 0008
        BEQ     L_6979                          ; 6976   0204 0001
        PULR    R7                              ; 6978   02B7

L_6979:
        SUBI    #$0200, R3                      ; 6979   033B 0200
        MVO     R3,     G_01AB                  ; 697B   0243 01AB
        MOVR    R5,     R7                      ; 697D   00AF

        PSHR    R5                              ; 697E   0275

        JSR     R5,     L_57D7                  ; 697F   0004 0154 03D7
        DECLE   $0281,  $0199,  $0282,  $0197   ; 6982   0281 0199 0282 0197
        DECLE   $00D1,  $0282,  $01A2,  $00D1   ; 6986   00D1 0282 01A2 00D1
        DECLE   $020C,  $004F,  $0378,  $0001   ; 698A   020C 004F 0378 0001
        DECLE   $020C,  $004B,  $0004,  $0148   ; 698E   020C 004B 0004 0148
        DECLE   $0378,  $00B3,  $004C,  $0280   ; 6992   0378 00B3 004C 0280
        DECLE   $0320,  $0240,  $01A2,  $02B9   ; 6996   0320 0240 01A2 02B9
        DECLE   $0020,  $0001,  $02BA,  $00B2   ; 699A   0020 0001 02BA 00B2
        DECLE   $0062,  $01E4,  $0004,  $015C   ; 699E   0062 01E4 0004 015C
        DECLE   $02A0,  $0244,  $01A1,  $0001   ; 69A2   02A0 0244 01A1 0001
        DECLE   $02BA,  $00B8,  $0062,  $02BC   ; 69A6   02BA 00B8 0062 02BC
        DECLE   $0001,  $0004,  $015C,  $02A0   ; 69AA   0001 0004 015C 02A0

        MVI     G_01A4, R2                      ; 69AE   0282 01A4
        TSTR    R2                              ; 69B0   0092
        BEQ     L_69C9                          ; 69B1   0204 0016

        MVI     G_0126, R0                      ; 69B3   0280 0126
        MVI     G_01A3, R1                      ; 69B5   0281 01A3
        CMPI    #$0002, R2                      ; 69B7   037A 0002
        BEQ     L_69BF                          ; 69B9   0204 0004

        SLR     R0,     2                       ; 69BB   0064
        ADDR    R1,     R0                      ; 69BC   00C8
        B       L_69C7                          ; 69BD   0200 0008

L_69BF:
        NEGR    R0                              ; 69BF   0020
        ANDI    #$00FF, R0                      ; 69C0   03B8 00FF
        SLR     R0,     2                       ; 69C2   0064
        NEGR    R0                              ; 69C3   0020
        ANDI    #$00FF, R0                      ; 69C4   03B8 00FF
        SUBR    R1,     R0                      ; 69C6   0108
L_69C7:
        MVO     R0,     G_0126                  ; 69C7   0240 0126
L_69C9:
        SDBD                                    ; 69C9   0001
        MVII    #$621B, R1                      ; 69CA   02B9 001B 0062
        MVI     G_01A1, R0                      ; 69CD   0280 01A1
        ADDR    R0,     R1                      ; 69CF   00C1
        ADDI    #$0002, R0                      ; 69D0   02F8 0002
        MVO     R0,     G_01A1                  ; 69D2   0240 01A1
        MVI@    R1,     R3                      ; 69D4   028B
        MVO     R3,     G_0136                  ; 69D5   0243 0136
        INCR    R1                              ; 69D7   0009
        MVI@    R1,     R2                      ; 69D8   028A
        MVO     R2,     G_0340                  ; 69D9   0242 0340
        PULR    R7                              ; 69DB   02B7

        DECLE   $0275,  $0281,  $0199,  $0089   ; 69DC   0275 0281 0199 0089
        DECLE   $020C,  $0035,  $0280,  $01A1   ; 69E0   020C 0035 0280 01A1
        DECLE   $0001,  $0378,  $000E,  $0000   ; 69E4   0001 0378 000E 0000
        DECLE   $0229,  $0020,  $0280,  $01A2   ; 69E8   0229 0020 0280 01A2
        DECLE   $0281,  $0320,  $0001,  $03B9   ; 69EC   0281 0320 0001 03B9
        DECLE   $0080,  $000F,  $0019,  $0188   ; 69F0   0080 000F 0019 0188
        DECLE   $0019,  $01C8,  $0240,  $0320   ; 69F4   0019 01C8 0240 0320
        DECLE   $01C9,  $0241,  $01A2,  $0241   ; 69F8   01C9 0241 01A2 0241
        DECLE   $0136,  $0241,  $0126,  $0001   ; 69FC   0136 0241 0126 0001
        DECLE   $02BA,  $0094,  $0062,  $01E4   ; 6A00   02BA 0094 0062 01E4
        DECLE   $0004,  $015C,  $02A0,  $02BC   ; 6A04   0004 015C 02A0 02BC
        DECLE   $0001,  $0001,  $02BA,  $009A   ; 6A08   0001 0001 02BA 009A
        DECLE   $0062,  $0004,  $015C,  $02A0   ; 6A0C   0062 0004 015C 02A0

        MVI     G_01A5, R0                      ; 6A10   0280 01A5
        CMPI    #$00FE, R0                      ; 6A12   0378 00FE
        BNEQ    L_6820                          ; 6A14   022C 01F5
        PULR    R7                              ; 6A16   02B7

        CLRR    R0                              ; 6A17   01C0
        MVO     R0,     G_01A2                  ; 6A18   0240 01A2
        PULR    R7                              ; 6A1A   02B7

        DECLE   $00C0,  $0001,  $00C0,  $0006   ; 6A1B   00C0 0001 00C0 0006
        DECLE   $00F0,  $0002,  $00FF,  $000A   ; 6A1F   00F0 0002 00FF 000A
        DECLE   $0001,  $000A,  $0010,  $0002   ; 6A23   0001 000A 0010 0002
        DECLE   $0030,  $0006,  $0275,  $0004   ; 6A27   0030 0006 0275 0004

        CMPR    R1,     R0                      ; 6A2B   0148
        AND     G_0036, R0                      ; 6A2C   0380 0036
        SLL     R1,     2                       ; 6A2E   004D
        MVII    #$0006, R0                      ; 6A2F   02B8 0006
        MVO     R0,     G_0192                  ; 6A31   0240 0192
        MVII    #$0001, R0                      ; 6A33   02B8 0001
        MVO     R0,     G_018A                  ; 6A35   0240 018A
        PULR    R7                              ; 6A37   02B7

        DECLE   $00E2,  $00E2,  $00E2,  $0063   ; 6A38   00E2 00E2 00E2 0063
        DECLE   $0063,  $00A3,  $00A3,  $0024   ; 6A3C   0063 00A3 00A3 0024
        DECLE   $0024,  $0024,  $0024,  $0024   ; 6A40   0024 0024 0024 0024
        DECLE   $0037,  $0000,  $00D7,  $0001   ; 6A44   0037 0000 00D7 0001
        DECLE   $0006,  $0000,  $0094,  $0062   ; 6A48   0006 0000 0094 0062
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0037           ; 6A50   0000 0000 0037

        SWAP    R0,     1                       ; 6A53   0040
        ADDR    R2,     R7                      ; 6A54   00D7

        DECLE   $0041,  $0003,  $0010,  $009A   ; 6A55   0041 0003 0010 009A
        DECLE   $0062,  $0000,  $0000,  $0000   ; 6A59   0062 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0041   ; 6A5D   0000 0000 0000 0041
        DECLE   $0001,  $0089,  $0000,  $0002   ; 6A61   0001 0089 0000 0002
        DECLE   $0000,  $00EB,  $0062,  $0030   ; 6A65   0000 00EB 0062 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A69   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0000,  $0005   ; 6A6D   0000 0007 0000 0005
        DECLE   $0063,  $0000,  $0000,  $0032   ; 6A71   0063 0000 0000 0032
        DECLE   $0000,  $0000,  $0000,  $0021   ; 6A75   0000 0000 0000 0021
        DECLE   $0001,  $0005,  $0001,  $0002   ; 6A79   0001 0005 0001 0002
        DECLE   $0010,  $00DB,  $0062,  $0002   ; 6A7D   0010 00DB 0062 0002
        DECLE   $0000,  $002A,  $0000,  $0000   ; 6A81   0000 002A 0000 0000
        DECLE   $001A,  $0021,  $0001,  $0016   ; 6A85   001A 0021 0001 0016
        DECLE   $0001,  $0002,  $0010,  $00D1   ; 6A89   0001 0002 0010 00D1
        DECLE   $0062,  $0013,  $0080,  $0019   ; 6A8D   0062 0013 0080 0019
        DECLE   $0000,  $0028,  $0000,  $000A   ; 6A91   0000 0028 0000 000A
        DECLE   $0061,  $00D6,  $0065,  $0001   ; 6A95   0061 00D6 0065 0001
        DECLE   $0000,  $00B5,  $005B,  $0004   ; 6A99   0000 00B5 005B 0004
        DECLE   $0066,  $0001,  $0000,  $0057   ; 6A9D   0066 0001 0000 0057
        DECLE   $005A,  $0094,  $0065,  $0004   ; 6AA1   005A 0094 0065 0004
        DECLE   $0000,  $000A,  $0061,  $00D6   ; 6AA5   0000 000A 0061 00D6
        DECLE   $0065,  $0003,  $0000           ; 6AA9   0065 0003 0000

        INCR    R2                              ; 6AAC   000A
        SLR     R1,     1                       ; 6AAD   0061

        JSRD    R4,     L_6403                  ; 6AAE   0004 0066 0003
        DECLE   $0000,  $00DC,  $0061,  $0037   ; 6AB1   0000 00DC 0061 0037
        DECLE   $0066,  $0003,  $0000,  $000A   ; 6AB5   0066 0003 0000 000A
        DECLE   $0061,  $0064,  $0066,  $0003   ; 6AB9   0061 0064 0066 0003
        DECLE   $0000,  $0029,  $005A,  $0092   ; 6ABD   0000 0029 005A 0092
        DECLE   $0066,  $0002,  $0000,  $000A   ; 6AC1   0066 0002 0000 000A
        DECLE   $0061,  $0092,  $0066,  $0002   ; 6AC5   0061 0092 0066 0002
        DECLE   $0000,  $000A,  $0061,  $00B0   ; 6AC9   0000 000A 0061 00B0
        DECLE   $0066,  $0002,  $0000,  $0000   ; 6ACD   0066 0002 0000 0000

        RRC     R3,     2                       ; 6AD1   0077
        SLLC    R0,     1                       ; 6AD2   0058
        ADDR    R2,     R7                      ; 6AD3   00D7

        SLR     R2,     2                       ; 6AD4   0066
        INCR    R0                              ; 6AD5   0008
        BC      L_6B8A                          ; 6AD6   0201 00B2

        SLLC    R1,     1                       ; 6AD8   0059
        MOVR    R1,     R4                      ; 6AD9   008C
        RLC     R3,     2                       ; 6ADA   0057
        SWAP    R3,     1                       ; 6ADB   0043
        SLLC    R0,     1                       ; 6ADC   0058
        ADDR    R2,     R7                      ; 6ADD   00D7

        DECLE   $0066,  $0008,  $0000,  $0077   ; 6ADE   0066 0008 0000 0077
        DECLE   $0058,  $001A,  $0067,  $0008   ; 6AE2   0058 001A 0067 0008
        DECLE   $0201,  $00B2,  $0059,  $008C   ; 6AE6   0201 00B2 0059 008C
        DECLE   $0057,  $008E,  $0057,  $0060   ; 6AEA   0057 008E 0057 0060
        DECLE   $0067,  $0002,  $0001,  $009C   ; 6AEE   0067 0002 0001 009C
        DECLE   $0059,  $0073,  $0057,  $007E   ; 6AF2   0059 0073 0057 007E
        DECLE   $0067,  $0003,  $0001,  $00B2   ; 6AF6   0067 0003 0001 00B2
        DECLE   $0059,  $00A4,  $0057,  $00B8   ; 6AFA   0059 00A4 0057 00B8
        DECLE   $0067,  $0004,  $0201,  $00B2   ; 6AFE   0067 0004 0201 00B2
        DECLE   $0059,  $0074,  $0057,  $008E   ; 6B02   0059 0074 0057 008E
        DECLE   $0057,  $005A,  $0067,  $0001   ; 6B06   0057 005A 0067 0001
        DECLE   $0000,  $0014,  $0061,  $00D8   ; 6B0A   0000 0014 0061 00D8
        DECLE   $0067,  $0002,  $0000,  $0038   ; 6B0E   0067 0002 0000 0038
        DECLE   $0148,  $00FF,  $00FF,  $00FF   ; 6B12   0148 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B16   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003C,  $003C   ; 6B1A   00FF 00FF 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6B1E   003C 003C 003C 003C
        DECLE   $003C,  $00FF,  $0099,  $0099   ; 6B22   003C 00FF 0099 0099
        DECLE   $0099,  $00FF,  $0099,  $0099   ; 6B26   0099 00FF 0099 0099
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6B2A   00FF 0000 0000 0000
        DECLE   $0000                           ; 6B2E   0000

        RSWD    R4                              ; 6B2F   003C
        ADDR    R4,     R7                      ; 6B30   00E7

        DECLE   $00DB,  $00FF,  $0000,  $0000   ; 6B31   00DB 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6B35   0000 0000 0000 00FF
        DECLE   $0000,  $00FF,  $0000,  $0080   ; 6B39   0000 00FF 0000 0080
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B3D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6B41   00FF 00FF 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B45   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6B49   00FF 00FF 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0007   ; 6B4D   0000 0000 0001 0007
        DECLE   $001F,  $0000,  $0040,  $0080   ; 6B51   001F 0000 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6B55   0000 0000 0000 0008
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6B59   0018 0018 0018 0018
        DECLE   $0018,  $0010,  $0000,  $0000   ; 6B5D   0018 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B61   0000 0000 0000 0000

        SETC                                    ; 6B65   0007
        RSWD    R0                              ; 6B66   0038
        ADDR    R0,     R3                      ; 6B67   00C3
        INCR    R6                              ; 6B68   000E
        RSWD    R0                              ; 6B69   0038
        ADDR    R4,     R0                      ; 6B6A   00E0
        ADDR    R0,     R7                      ; 6B6B   00C7
        ADDR    R0,     R7                      ; 6B6C   00C7
        ADDR    R0,     R7                      ; 6B6D   00C7
        ADDR    R1,     R7                      ; 6B6E   00CF
        ADDR    R1,     R7                      ; 6B6F   00CF
        ADDR    R5,     R7                      ; 6B70   00EF
        ADDR    R5,     R7                      ; 6B71   00EF

        DECLE   $00FF,  $0000,  $0001,  $001D   ; 6B72   00FF 0000 0001 001D
        DECLE   $00DD,  $00FD,  $00FF,  $00FF   ; 6B76   00DD 00FD 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0039   ; 6B7A   00FF 0000 0000 0039
        DECLE   $007F,  $00FF,  $00FF,  $007F   ; 6B7E   007F 00FF 00FF 007F
        DECLE   $003D,  $0000,  $0000           ; 6B82   003D 0000 0000

        TSTR    R0                              ; 6B85   0080
        ADDR    R5,     R0                      ; 6B86   00E8
        ADDR    R7,     R4                      ; 6B87   00FC
        ADDR    R7,     R6                      ; 6B88   00FE
        MOVR    R7,     R4                      ; 6B89   00BC
L_6B8A:
        COMR    R0                              ; 6B8A   0018
        DECLE   $0077,  $0077,  $0057,  $0050   ; 6B8B   0077 0077 0057 0050
        DECLE   $00AA,  $00F8,  $00FA,  $00F8   ; 6B8F   00AA 00F8 00FA 00F8
        DECLE   $0000,  $0010,  $0038,  $007C   ; 6B93   0000 0010 0038 007C
        DECLE   $007C,  $0038,  $0038,  $007C   ; 6B97   007C 0038 0038 007C
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 6B9B   0000 0000 00C0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6B9F   0080 0000 0000 0000
        DECLE   $0099,  $00FF,  $0000,  $0000   ; 6BA3   0099 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAB   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6BAF   0000 0000

        ADDR    R0,     R0                      ; 6BB1   00C0
        ADDR    R7,     R0                      ; 6BB2   00F8
        MOVR    R0,     R1                      ; 6BB3   0081
        ADDR    R4,     R7                      ; 6BB4   00E7

        DECLE   $00FF,  $00FF,  $00FF,  $00C3   ; 6BB5   00FF 00FF 00FF 00C3
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; 6BB9   00FF 00FF 00FE 00FF
        DECLE   $00FF,  $00FF,  $00E0,  $0040   ; 6BBD   00FF 00FF 00E0 0040
        DECLE   $00C0,  $00E0,  $007C,  $00F8   ; 6BC1   00C0 00E0 007C 00F8
        DECLE   $00DC,  $00D8,  $0070,  $0000   ; 6BC5   00DC 00D8 0070 0000
        DECLE   $0000,  $0000                   ; 6BC9   0000 0000

        SETC                                    ; 6BCB   0007
        SETC                                    ; 6BCC   0007
        INCR    R7                              ; 6BCD   000F

        COMR    R6                              ; 6BCE   001E
L_6BCF:
        SARC    R3,     2                       ; 6BCF   007F
        DECLE   $00FF,  $0000,  $00FF,  $00C3   ; 6BD0   00FF 0000 00FF 00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD4   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $00FF,  $00E0   ; 6BD8   00FF 0000 00FF 00E0
        DECLE   $00E0,  $00F0,  $0078,  $00FE   ; 6BDC   00E0 00F0 0078 00FE
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; 6BE0   00FF 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6BE4   0000 0000 0000 0018
        DECLE   $003C,  $003E,  $001C,  $003C   ; 6BE8   003C 003E 001C 003C
        DECLE   $003E,  $003C,  $003C,  $003C   ; 6BEC   003E 003C 003C 003C
        DECLE   $0018,  $0018,  $001C,  $0000   ; 6BF0   0018 0018 001C 0000
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 6BF4   0018 003C 007E 00FF
        DECLE   $007E,  $00FF,  $00FF,  $00FE   ; 6BF8   007E 00FF 00FF 00FE
        DECLE   $00FC,  $00F8,  $00F0,  $00E0   ; 6BFC   00FC 00F8 00F0 00E0
        DECLE   $00C0,  $0080,  $0000,  $0001   ; 6C00   00C0 0080 0000 0001
        DECLE   $0003,  $0007,  $000F,  $001F   ; 6C04   0003 0007 000F 001F
        DECLE   $003F,  $007F,  $00FF,  $0000   ; 6C08   003F 007F 00FF 0000
        DECLE   $007E,  $007E,  $007E,  $00FF   ; 6C0C   007E 007E 007E 00FF
        DECLE   $00DB,  $00DB,  $00FF,  $00FF   ; 6C10   00DB 00DB 00FF 00FF
        DECLE   $0099,  $0099,  $0099,  $00FF   ; 6C14   0099 0099 0099 00FF
        DECLE   $0099,  $0099,  $00FF,  $0001   ; 6C18   0099 0099 00FF 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6C1C   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001           ; 6C20   0001 0001 0001

        TSTR    R0                              ; 6C23   0080
        TSTR    R0                              ; 6C24   0080
        TSTR    R0                              ; 6C25   0080
        TSTR    R0                              ; 6C26   0080
        TSTR    R0                              ; 6C27   0080
        TSTR    R0                              ; 6C28   0080
        TSTR    R0                              ; 6C29   0080
        TSTR    R0                              ; 6C2A   0080
        DIS                                     ; 6C2B   0003
        DIS                                     ; 6C2C   0003
        DIS                                     ; 6C2D   0003
        DIS                                     ; 6C2E   0003
        DIS                                     ; 6C2F   0003
        DIS                                     ; 6C30   0003
        DIS                                     ; 6C31   0003
        DIS                                     ; 6C32   0003
        ADDR    R0,     R0                      ; 6C33   00C0
        ADDR    R0,     R0                      ; 6C34   00C0
        ADDR    R0,     R0                      ; 6C35   00C0
        ADDR    R0,     R0                      ; 6C36   00C0
        ADDR    R0,     R0                      ; 6C37   00C0
        ADDR    R0,     R0                      ; 6C38   00C0
        ADDR    R0,     R0                      ; 6C39   00C0
        ADDR    R0,     R0                      ; 6C3A   00C0
        INCR    R7                              ; 6C3B   000F
        INCR    R7                              ; 6C3C   000F
L_6C3D:
        INCR    R7                              ; 6C3D   000F
L_6C3E:
        INCR    R7                              ; 6C3E   000F
L_6C3F:
        INCR    R7                              ; 6C3F   000F
L_6C40:
        INCR    R7                              ; 6C40   000F
L_6C41:
        INCR    R7                              ; 6C41   000F
L_6C42:
        INCR    R7                              ; 6C42   000F

L_6C43:
        ADDR    R6,     R0                      ; 6C43   00F0
L_6C44:
        ADDR    R6,     R0                      ; 6C44   00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6C45   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $003F,  $003F   ; 6C49   00F0 00F0 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6C4D   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $00FC,  $00FC   ; 6C51   003F 003F 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 6C55   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00FC,  $0060,  $0064   ; 6C59   00FC 00FC 0060 0064
        DECLE   $0006,  $0000,  $0000,  $00FF   ; 6C5D   0006 0000 0000 00FF
        DECLE   $0099,  $0099,  $0099,  $00FF   ; 6C61   0099 0099 0099 00FF
        DECLE   $0099,  $0099,  $00FF,  $0099   ; 6C65   0099 0099 00FF 0099
        DECLE   $0099,  $0099,  $00FF,  $0099   ; 6C69   0099 0099 00FF 0099
        DECLE   $0099,  $00FF,  $0000,  $0099   ; 6C6D   0099 00FF 0000 0099
        DECLE   $0099,  $00FF,  $0099,  $0099   ; 6C71   0099 00FF 0099 0099
        DECLE   $00FF,  $0000,  $0000,  $0099   ; 6C75   00FF 0000 0000 0099
        DECLE   $00FF,  $0099,  $0099,  $00FF   ; 6C79   00FF 0099 0099 00FF
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6C7D   0000 0000 0000 00FF
        DECLE   $0099,  $0099,  $00FF,  $0000   ; 6C81   0099 0099 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0099   ; 6C85   0000 0000 0000 0099
        DECLE   $0099,  $00FF,  $0000,  $0000   ; 6C89   0099 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6C8D   0000 0000 0000 0001
        DECLE   $0003,  $0002,  $0001,  $0003   ; 6C91   0003 0002 0001 0003
        DECLE   $0001,  $00AB,  $0064,  $0004   ; 6C95   0001 00AB 0064 0004
        DECLE   $0000,  $0000,  $00FF           ; 6C99   0000 0000 00FF

        ADDR    R4,     R7                      ; 6C9C   00E7

        ADDR    R0,     R3                      ; 6C9D   00C3
        ADDR    R4,     R7                      ; 6C9E   00E7

        DECLE   $0000,  $0042,  $0042,  $0081   ; 6C9F   0000 0042 0042 0081
        DECLE   $00FF,  $00FF                   ; 6CA3   00FF 00FF

        ADDR    R4,     R7                      ; 6CA5   00E7

        ADDR    R0,     R3                      ; 6CA6   00C3
        ADDR    R4,     R7                      ; 6CA7   00E7

        DECLE   $0000,  $0042,  $0081,  $00FF   ; 6CA8   0000 0042 0081 00FF
        DECLE   $00F3,  $00E1,  $00F3,  $0000   ; 6CAC   00F3 00E1 00F3 0000
        DECLE   $0062,  $0061,  $00A1,  $00FF   ; 6CB0   0062 0061 00A1 00FF

        ADDR    R4,     R7                      ; 6CB4   00E7

        ADDR    R0,     R3                      ; 6CB5   00C3
        ADDR    R4,     R7                      ; 6CB6   00E7

        DECLE   $0000,  $0042,  $0042,  $0081   ; 6CB7   0000 0042 0042 0081
        DECLE   $00FF                           ; 6CBB   00FF

        ADDR    R1,     R7                      ; 6CBC   00CF
        MOVR    R0,     R7                      ; 6CBD   0087
        ADDR    R1,     R7                      ; 6CBE   00CF

        DECLE   $0000,  $0046,  $0086,  $0085   ; 6CBF   0000 0046 0086 0085
        DECLE   $00FF                           ; 6CC3   00FF

        ADDR    R4,     R7                      ; 6CC4   00E7

        ADDR    R0,     R3                      ; 6CC5   00C3
        ADDR    R4,     R7                      ; 6CC6   00E7

        DECLE   $0000,  $0042,  $0042,  $0081   ; 6CC7   0000 0042 0042 0081
        DECLE   $007E,  $0002,  $0044,  $00C8   ; 6CCB   007E 0002 0044 00C8
        DECLE   $0050,  $00FC,  $00FE,  $00FC   ; 6CCF   0050 00FC 00FE 00FC
        DECLE   $0020,  $0010,  $0008,  $0014   ; 6CD3   0020 0010 0008 0014
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6CD7   0008 0000 0000 0000
        DECLE   $007E,  $0002,  $0044,  $00C8   ; 6CDB   007E 0002 0044 00C8
        DECLE   $0052,  $00FE,  $00FE,  $00FE   ; 6CDF   0052 00FE 00FE 00FE
        DECLE   $0022,  $0010,  $0008,  $0014   ; 6CE3   0022 0010 0008 0014
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6CE7   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6CEB   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6CEF   0001 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF3   0000 0000 0000 0000
        DECLE   $0018,  $000E,  $003F,  $003F   ; 6CF7   0018 000E 003F 003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D07   0000 0000 0000 0000
        DECLE   $000E,  $0065,  $0004,  $0000   ; 6D0B   000E 0065 0004 0000
        DECLE   $0000,  $0090,  $00F0,  $00E0   ; 6D0F   0000 0090 00F0 00E0
        DECLE   $00E0,  $00F3,  $00FF,  $0000   ; 6D13   00E0 00F3 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D17   0000 0000 0000 0000
        DECLE   $0000,  $0083,  $00FF,  $0000   ; 6D1B   0000 0083 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1F   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $000F,  $0000   ; 6D23   0000 0003 000F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D27   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $001F,  $0031   ; 6D2B   0000 0003 001F 0031
        DECLE   $0065,  $0004,  $0000,  $0000   ; 6D2F   0065 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003F,  $0007   ; 6D37   0000 0000 003F 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 6D3F   0000 0000 0000 0003
        DECLE   $000F,  $003F,  $001F,  $003C   ; 6D43   000F 003F 001F 003C
        DECLE   $0000,  $0000,  $0001,  $0003   ; 6D47   0000 0000 0001 0003
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6D4B   0007 0007 0007 0007
        DECLE   $000F,  $000B,  $00FF,  $00FF   ; 6D4F   000F 000B 00FF 00FF
        DECLE   $003F                           ; 6D53   003F

        INCR    R7                              ; 6D54   000F

        SETC                                    ; 6D55   0007
L_6D56:
        EIS                                     ; 6D56   0002
        DECLE   $0003,  $0007,  $00FF,  $00FF   ; 6D57   0003 0007 00FF 00FF
        DECLE   $003F                           ; 6D5B   003F

        INCR    R7                              ; 6D5C   000F

        SETC                                    ; 6D5D   0007
L_6D5E:
        EIS                                     ; 6D5E   0002
        DECLE   $0003,  $0007,  $00FF,  $00FF   ; 6D5F   0003 0007 00FF 00FF
        DECLE   $00FF                           ; 6D63   00FF

        ADDR    R1,     R7                      ; 6D64   00CF
        MOVR    R0,     R7                      ; 6D65   0087

        DECLE   $0002,  $0003,  $0007,  $00FF   ; 6D66   0002 0003 0007 00FF
        DECLE   $00FF,  $00FF                   ; 6D6A   00FF 00FF

        ADDR    R1,     R7                      ; 6D6C   00CF
        MOVR    R0,     R7                      ; 6D6D   0087

        MOVR    R0,     R2                      ; 6D6E   0082
        MOVR    R0,     R3                      ; 6D6F   0083
        MOVR    R0,     R7                      ; 6D70   0087

        DECLE   $00FF,  $00C2,  $00C2,  $00C2   ; 6D71   00FF 00C2 00C2 00C2
        DECLE   $00C2,  $00C2,  $00C2,  $00C2   ; 6D75   00C2 00C2 00C2 00C2
        DECLE   $00FF,  $0034,  $0034,  $0034   ; 6D79   00FF 0034 0034 0034
        DECLE   $0034,  $0034,  $0034,  $0034   ; 6D7D   0034 0034 0034 0034
        DECLE   $00FF,  $002C,  $002C,  $002C   ; 6D81   00FF 002C 002C 002C
        DECLE   $002C,  $002C,  $002C,  $002C   ; 6D85   002C 002C 002C 002C
        DECLE   $00FF,  $0043,  $0043,  $0043   ; 6D89   00FF 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; 6D8D   0043 0043 0043 0043
        DECLE   $0071,  $0065,  $0004,  $0000   ; 6D91   0071 0065 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6D95   0000 0000 0000 0018
        DECLE   $003C,  $003E,  $001C,  $003C   ; 6D99   003C 003E 001C 003C
        DECLE   $003E,  $003C,  $003C,  $003C   ; 6D9D   003E 003C 003C 003C
        DECLE   $0014,  $0034,  $0026,  $0000   ; 6DA1   0014 0034 0026 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6DA5   0000 0000 0000 0004
        DECLE   $0004,  $0008,  $006E,  $003F   ; 6DA9   0004 0008 006E 003F
        DECLE   $003C,  $007C,  $0078,  $0078   ; 6DAD   003C 007C 0078 0078
        DECLE   $0030,  $0010,  $0000,  $0000   ; 6DB1   0030 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0032   ; 6DB5   0000 0000 0000 0032
        DECLE   $0016,  $0014,  $000E,  $000E   ; 6DB9   0016 0014 000E 000E
        DECLE   $000E,  $003E,  $001E,  $001C   ; 6DBD   000E 003E 001E 001C
        DECLE   $003E,  $001E,  $000C,  $0000   ; 6DC1   003E 001E 000C 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 6DC5   0000 0000 0010 0010
        DECLE   $0010,  $0058,  $0058,  $003C   ; 6DC9   0010 0058 0058 003C
        DECLE   $001C,  $001E,  $003E,  $003C   ; 6DCD   001C 001E 003E 003C
        DECLE   $002C,  $0028,  $009B,  $0064   ; 6DD1   002C 0028 009B 0064
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6DD5   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6DD9   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0036,  $0034   ; 6DDD   001C 0034 0036 0034
        DECLE   $0034,  $003C,  $0018,  $0000   ; 6DE1   0034 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6DE9   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0036,  $0028   ; 6DED   001C 0034 0036 0028
        DECLE   $003C,  $003C,  $0014,  $0000   ; 6DF1   003C 003C 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6DF9   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0026,  $001A   ; 6DFD   001C 0034 0026 001A
        DECLE   $002C,  $003E,  $0062,  $0000   ; 6E01   002C 003E 0062 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6E05   0000 0000 0000 001E
        DECLE   $0038,  $0020,  $0000,  $0008   ; 6E09   0038 0020 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; 6E0D   0008 0008 0008 0000
        DECLE   $0000,  $0018,  $001C,  $0000   ; 6E11   0000 0018 001C 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6E15   0000 0000 0000 001E
        DECLE   $0038,  $0020,  $0000,  $0008   ; 6E19   0038 0020 0000 0008
        DECLE   $0008,  $0014,  $0000,  $0000   ; 6E1D   0008 0014 0000 0000
        DECLE   $0000,  $0034,  $0026,  $0000   ; 6E21   0000 0034 0026 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6E25   0000 0000 0000 001E
        DECLE   $0038,  $0020,  $0000,  $0008   ; 6E29   0038 0020 0000 0008
        DECLE   $0018,  $0020,  $0010,  $0000   ; 6E2D   0018 0020 0010 0000
        DECLE   $0000,  $0042,  $0063,  $0051   ; 6E31   0000 0042 0063 0051
        DECLE   $0065,  $0004,  $0000,  $0000   ; 6E35   0065 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6E39   0000 0000 0000 0004
        DECLE   $001E,  $001C,  $0070,  $0076   ; 6E3D   001E 001C 0070 0076
        DECLE   $0074,  $0034,  $003C,  $003C   ; 6E41   0074 0034 003C 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6E49   0000 0000 0000 0004
        DECLE   $001E,  $001C,  $0038,  $0030   ; 6E4D   001E 001C 0038 0030
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6E51   003C 003C 003C 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0078   ; 6E59   0000 0000 0000 0078
        DECLE   $007C,  $0018,  $0038,  $0038   ; 6E5D   007C 0018 0038 0038
        DECLE   $003C,  $003C,  $0020,  $0000   ; 6E61   003C 003C 0020 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6E65   0000 0000 0000 001E
        DECLE   $0038,  $0020,  $0000,  $0008   ; 6E69   0038 0020 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; 6E6D   0008 0008 0008 0000
        DECLE   $0000,  $0018,  $001C,  $0000   ; 6E71   0000 0018 001C 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6E75   0000 0000 0000 001E
        DECLE   $0038,  $0020,  $0000           ; 6E79   0038 0020 0000

        SWAP    R0,     1                       ; 6E7C   0040
        MOVR    R1,     R7                      ; 6E7D   008F

        DECLE   $0080,  $0000,  $0000,  $00C2   ; 6E7E   0080 0000 0000 00C2
        DECLE   $0083,  $0000,  $0000,  $0000   ; 6E82   0083 0000 0000 0000
        DECLE   $001E,  $0038,  $0020,  $0000   ; 6E86   001E 0038 0020 0000
        DECLE   $0000,  $0000                   ; 6E8A   0000 0000

        SWAP    R0,     1                       ; 6E8C   0040
        MOVR    R0,     R7                      ; 6E8D   0087

        DECLE   $0080,  $0001,  $00C7,  $0080   ; 6E8E   0080 0001 00C7 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00BC   ; 6E96   0000 0000 0000 00BC
        DECLE   $007E,  $007F,  $003D,  $003C   ; 6E9A   007E 007F 003D 003C
        DECLE   $007C,  $00EC,  $0000,  $0000   ; 6E9E   007C 00EC 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003D   ; 6EA6   0000 0000 0000 003D
        DECLE   $007E,  $00FE,  $00BC,  $003C   ; 6EAA   007E 00FE 00BC 003C
        DECLE   $003E,  $0037,  $0000,  $0000   ; 6EAE   003E 0037 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 6EB2   0000 0000 0018 003C
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6EB6   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBA   0000 0000 0000 0000
        DECLE   $00CC,  $000E,  $0000,  $0000   ; 6EBE   00CC 000E 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 6EC2   0000 0000 0018 003C
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6EC6   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECA   0000 0000 0000 0000
        DECLE   $0033,  $0070,  $000F,  $0007   ; 6ECE   0033 0070 000F 0007
        DECLE   $0001,  $00F8,  $00F0,  $00FE   ; 6ED2   0001 00F8 00F0 00FE
        DECLE   $0007,  $0000,  $0000,  $003C   ; 6ED6   0007 0000 0000 003C
        DECLE   $005E,  $00BF,  $00FF,  $007E   ; 6EDA   005E 00BF 00FF 007E
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6EDE   003C 0000 0000 003C
        DECLE   $007E,  $00BF,  $00BF,  $007E   ; 6EE2   007E 00BF 00BF 007E
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6EE6   003C 0000 0000 003C
        DECLE   $007E,  $00FF,  $00BF,  $005E   ; 6EEA   007E 00FF 00BF 005E
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6EEE   003C 0000 0000 003C
        DECLE   $007E,  $00FF,  $00FF,  $0066   ; 6EF2   007E 00FF 00FF 0066
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6EF6   003C 0000 0000 003C
        DECLE   $007E,  $00FF,  $00FD,  $007A   ; 6EFA   007E 00FF 00FD 007A
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6EFE   003C 0000 0000 003C
        DECLE   $007E,  $00FD,  $00FD,  $007E   ; 6F02   007E 00FD 00FD 007E
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6F06   003C 0000 0000 003C
        DECLE   $007A,  $00FD,  $00FF,  $007E   ; 6F0A   007A 00FD 00FF 007E
        DECLE   $003C,  $0000,  $0000,  $003C   ; 6F0E   003C 0000 0000 003C
        DECLE   $0066,  $00FF,  $00FF,  $007E   ; 6F12   0066 00FF 00FF 007E
        DECLE   $003C,  $00EB,  $0064,  $0004   ; 6F16   003C 00EB 0064 0004
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F1A   0000 0000 0000 0018
        DECLE   $002C,  $005E,  $003C,  $0018   ; 6F1E   002C 005E 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F22   0000 0000 0000 0018
        DECLE   $003C,  $005E,  $003C,  $0018   ; 6F26   003C 005E 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F2A   0000 0000 0000 0018
        DECLE   $003C,  $005E,  $002C,  $0018   ; 6F2E   003C 005E 002C 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F32   0000 0000 0000 0018
        DECLE   $003C,  $007E,  $0024,  $0018   ; 6F36   003C 007E 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F3A   0000 0000 0000 0018
        DECLE   $003C,  $007A,  $0024,  $0018   ; 6F3E   003C 007A 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F42   0000 0000 0000 0018
        DECLE   $003C,  $007A,  $003C,  $0018   ; 6F46   003C 007A 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F4A   0000 0000 0000 0018
        DECLE   $0034,  $007A,  $003C,  $0018   ; 6F4E   0034 007A 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6F52   0000 0000 0000 0018
        DECLE   $0024,  $007E,  $003C,  $0018   ; 6F56   0024 007E 003C 0018
        DECLE   $00E4,  $008A,  $00CA,  $002A   ; 6F5A   00E4 008A 00CA 002A
        DECLE   $002A,  $00C4,  $0000,  $0000   ; 6F5E   002A 00C4 0000 0000
        DECLE   $0000,  $0000,  $0000,  $006C   ; 6F62   0000 0000 0000 006C
        DECLE   $00EE,  $00FE,  $00FE,  $00FE   ; 6F66   00EE 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $007C,  $007C   ; 6F6A   00FE 00FE 007C 007C
        DECLE   $0038,  $0010,  $0000,  $0000   ; 6F6E   0038 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $006C   ; 6F76   0000 0000 0028 006C
        DECLE   $006C,  $0038,  $0038,  $0010   ; 6F7A   006C 0038 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7E   0000 0000 0000 0000
        DECLE   $0000                           ; 6F82   0000

        INCR    R0                              ; 6F83   0008
        DECR    R4                              ; 6F84   0014
        EIS                                     ; 6F85   0002
        RLC     R1,     1                       ; 6F86   0051
        RRC     R1,     1                       ; 6F87   0071
        ADDR    R4,     R7                      ; 6F88   00E7

        DECLE   $007F,  $003F,  $003F,  $0066   ; 6F89   007F 003F 003F 0066
        DECLE   $00CC,  $0000,  $0000,  $0000   ; 6F8D   00CC 0000 0000 0000
        DECLE   $0000,  $0004,  $000A,  $0001   ; 6F91   0000 0004 000A 0001
        DECLE   $0001                           ; 6F95   0001

        RLC     R1,     1                       ; 6F96   0051
        RRC     R1,     1                       ; 6F97   0071
        ADDR    R4,     R7                      ; 6F98   00E7

        DECLE   $007F,  $003F,  $007F,  $00BB   ; 6F99   007F 003F 007F 00BB
        DECLE   $0066,  $0000,  $0000,  $0000   ; 6F9D   0066 0000 0000 0000
        DECLE   $0000,  $0004,  $0006,  $0001   ; 6FA1   0000 0004 0006 0001
        DECLE   $0001                           ; 6FA5   0001

        RLC     R1,     1                       ; 6FA6   0051
        RRC     R1,     1                       ; 6FA7   0071
        ADDR    R4,     R7                      ; 6FA8   00E7

        DECLE   $007F,  $003F,  $003F,  $0077   ; 6FA9   007F 003F 003F 0077
        DECLE   $00BB,  $0030,  $0000,  $0088   ; 6FAD   00BB 0030 0000 0088
        DECLE   $0000,  $0000,  $0000,  $000B   ; 6FB1   0000 0000 0000 000B
        DECLE   $0063,  $0021,  $0000,  $0000   ; 6FB5   0063 0021 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; 6FB9   0000 0000 0000 001F
        DECLE   $0008,  $0000,  $0000,  $0001   ; 6FBD   0008 0000 0000 0001
        DECLE   $0003,  $0006,  $000E,  $001E   ; 6FC1   0003 0006 000E 001E
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6FC5   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; 6FC9   0000 0000 0000 001F
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6FCD   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6FD1   0000 0000 0000 001E
        DECLE   $000E,  $0006,  $0003,  $0000   ; 6FD5   000E 0006 0003 0000
        DECLE   $001C,  $003E,  $005E,  $0041   ; 6FD9   001C 003E 005E 0041
        DECLE   $0041,  $0036,  $0014,  $0000   ; 6FDD   0041 0036 0014 0000
        DECLE   $0008,  $0022,  $003E,  $0022   ; 6FE1   0008 0022 003E 0022
        DECLE   $003E,  $00BE,  $009C,  $0000   ; 6FE5   003E 00BE 009C 0000
        DECLE   $001C,  $003E,  $005E,  $0041   ; 6FE9   001C 003E 005E 0041
        DECLE   $0041,  $0036,  $0014,  $0000   ; 6FED   0041 0036 0014 0000

        INCR    R0                              ; 6FF1   0008
        NEGR    R2                              ; 6FF2   0022
        RSWD    R6                              ; 6FF3   003E
        RSWD    R6                              ; 6FF4   003E
        RSWD    R6                              ; 6FF5   003E
        MOVR    R7,     R6                      ; 6FF6   00BE
        MOVR    R3,     R4                      ; 6FF7   009C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5037       $503B  
;;  $5041       $5043  
;;  $5046       $5049  
;;  $5053       $504B  
;;  $505D       $507E  
;;  $5069       $5064  
;;  $5077       $5062   $5067  
;;  $5079       $5075  
;;  $5080       $5051  
;;  $5089       $50A1  
;;  $509E       $508A   $508E  
;;  $50A7       $50F4  
;;  $50AE       $50AB  
;;  $50B5       $50B2  
;;  $50C7       $50ED  
;;  $50D5       $58CC   $6242  
;;  $50E7       $50C8  
;;  $50EC       $50E5   $50E8  
;;  $50EF       $50BD   $50C3  
;;  $5109       $50F9  
;;  $511B       $5107   $515B  
;;  $513F       $513B  
;;  $5140       $513E  
;;  $5147       $5141  
;;  $5148       $5135   $5144  
;;  $514D       $5138  
;;  $5157       $5125  
;;  $515D       $510A   $5119  
;;  $516E       $5165  
;;  $5182       $517D  
;;  $51A3       $51AE  
;;  $51B9       $521D  
;;  $51CC       $58E7  
;;  $5207       $51F2  
;;  $5208       $5206  
;;  $5219       $51BF   $51C5  
;;  $522A       $5260  
;;  $5234       $59E8   $5A28  
;;  $5244       $59FB   $5A0B  
;;  $5255       $59F2   $5A11  
;;  $525B       $523B   $5A01   $5A14  
;;  $5262       $522E  
;;  $526D       $59F5   $5A0E  
;;  $5277       $5285  
;;  $5280       $527A   $527D  
;;  $528E       $5A23  
;;  $529C       $5293  
;;  $52A0       $52A8  
;;  $52A6       $52A2  
;;  $52B6       $58D9   $5B9E  
;;  $52BC       $52F9  
;;  $52D9       $52C3  
;;  $52E7       $52E9  
;;  $52EB       $52E5  
;;  $52F6       $52D7  
;;  $52FF       $5ADE   $5AE9   $5AF4  
;;  $5302       $5313  
;;  $530C       $58CF   $624F  
;;  $5344       $5340  
;;  $5345       $5343  
;;  $5363       $5368  
;;  $536A       $535A  
;;  $5382       $537A   $537E  
;;  $538A       $5388  
;;  $538B       $53B4  
;;  $539B       $5858   $6726  
;;  $53B7       $53BD  
;;  $53D7       $53D5  
;;  $5412       $540A  
;;  $5416       $5410  
;;  $541B       $541D  
;;  $541F       $5419  
;;  $5424       $5420  
;;  $5429       $5404  
;;  $542A       $5428  
;;  $5457       $5455  
;;  $5471       $545B  
;;  $5496       $5494  
;;  $54A4       $549F  
;;  $54A5       $54A3  
;;  $54AD       $549A  
;;  $54CD       $54CB  
;;  $54E0       $54D0  
;;  $54F4       $54D6  
;;  $54FC       $54EC  
;;  $5504       $54F2  
;;  $5521       $551F  
;;  $552E       $5525  
;;  $5554       $5552  
;;  $5563       $5558  
;;  $557C       $588F   $589C   $5C92   $6284   $628F   $62C3   $6400   $6404  
;;  $557C       $641A  
;;  $558C       $558A  
;;  $55C1       $55BF  
;;  $55CD       $55C5  
;;  $55D0       $55BD  
;;  $55E0       $55E3  
;;  $55E7       $543D   $5462   $5507   $55A4   $55D0   $5830  
;;  $5604       $55F2   $55FB  
;;  $5624       $593E   $5DD7   $5E5A  
;;  $5645       $5622  
;;  $564F       $5643  
;;  $5654       $5618  
;;  $5659       $5934   $5939  
;;  $5664       $561F   $5657  
;;  $578F       $6232   $63E0   $63F0   $63F4   $63F8   $6787   $678C   $6790  
;;  $578F       $679A  
;;  $57B4       $5D0F   $5E79  
;;  $57D7       $67FA   $6814   $697F  
;;  $5808       $57F0   $57F6   $57FC   $5802  
;;  $581A       $5818  
;;  $5878       $5695  
;;  $588F       $58A4  
;;  $5893       $56B1  
;;  $5898       $56B5  
;;  $58CF       $56ED  
;;  $58DF       $56FD  
;;  $591B       $5739  
;;  $591F       $573D  
;;  $5937       $5930  
;;  $5939       $5757  
;;  $593E       $575B  
;;  $5951       $5956  
;;  $5983       $57A1  
;;  $598A       $5949  
;;  $59ED       $5D53  
;;  $59FA       $5A09  
;;  $5A3D       $5A39  
;;  $5A4A       $5743  
;;  $5A4C       $5745  
;;  $5A8E       $5A88  
;;  $5AA5       $5AAE  
;;  $5AB0       $5AA7  
;;  $5AF9       $5AFC  
;;  $5AFE       $5ACE  
;;  $5B01       $5B04  
;;  $5B0B       $5B08  
;;  $5B0E       $6309  
;;  $5B2A       $5D1F  
;;  $5B2E       $5B1B   $5B24  
;;  $5B84       $5B82  
;;  $5B9A       $5B98  
;;  $5BAC       $5BA8  
;;  $5BB6       $5BBF  
;;  $5BC1       $5BA4   $5BB7  
;;  $5BE5       $5BD8  
;;  $5BEF       $5BC5   $5BD2   $5BE3  
;;  $5BFE       $5C03  
;;  $5C02       $5BFC   $5C2E  
;;  $5C07       $5C28  
;;  $5C12       $5C0C  
;;  $5C55       $5C77  
;;  $5C8F       $63EB  
;;  $5C9E       $5C7C   $5C8B  
;;  $5CB5       $5CA8   $5CAD  
;;  $5CD5       $5CCF  
;;  $5CDB       $5CD3  
;;  $5CFE       $5CF9  
;;  $5D0F       $5CD7   $5CDD  
;;  $5D22       $5D12   $5D1D  
;;  $5D34       $5D2B  
;;  $5D38       $5D25  
;;  $5D3A       $5D32   $5D36  
;;  $5D56       $5D51  
;;  $5D6B       $5D68  
;;  $5D6F       $5D46  
;;  $5D78       $5C90   $5CA3   $5D73   $5D8B   $5D90  
;;  $5DAE       $5DA1   $5DA6   $5DAB  
;;  $5DBD       $5DB9  
;;  $5DDF       $5DC9  
;;  $5DEF       $5DF5   $5DFE  
;;  $5E00       $5DFB  
;;  $5E0A       $5E11  
;;  $5E21       $5DCC   $5DDD   $5DE2  
;;  $5E27       $5E2F   $5E3B   $5E44   $5E4D  
;;  $5E94       $5B7A   $5F10   $5F38   $60C8   $61E4   $64DD  
;;  $5E9D       $5E67   $5E6C   $5E77  
;;  $5EC2       $5F23   $5F6F   $60D8   $60EA  
;;  $5ED1       $5ECD  
;;  $5EDB       $5E69   $5EB5   $602D   $60B8  
;;  $5EED       $5EC8   $608C   $61DA   $68F3  
;;  $5EF3       $5EDF  
;;  $5F01       $5EF1  
;;  $5F31       $5EA8   $5EAE   $5EB3   $5EB8   $5EBE  
;;  $5F32       $5F03  
;;  $5F53       $5FAA  
;;  $5F6F       $5F6B  
;;  $5F8F       $5F8D  
;;  $5FA3       $625D   $63BB  
;;  $5FB7       $5854   $671F  
;;  $5FC9       $5FA0  
;;  $5FCD       $5FCD  
;;  $5FD0       $5895   $58A1   $64AB  
;;  $5FE1       $5FDB  
;;  $5FE7       $5FDE  
;;  $5FEC       $5B5E   $61CE   $6306  
;;  $6011       $6007   $600D  
;;  $6026       $601F  
;;  $60F2       $60A2   $60A7   $60B1   $60B6   $60BB  
;;  $6100       $6893   $68A7  
;;  $6115       $610B  
;;  $6116       $6110  
;;  $6134       $612E  
;;  $6154       $6841   $6875  
;;  $61EC       $625B  
;;  $6215       $6245  
;;  $6217       $6213  
;;  $6229       $6252   $63D2  
;;  $6247       $6238  
;;  $6252       $624D  
;;  $625D       $6255  
;;  $627B       $6282  
;;  $62A3       $62E1  
;;  $62B0       $62A8  
;;  $62B5       $62AE  
;;  $62BD       $62B9  
;;  $62C3       $62DF  
;;  $6329       $630C  
;;  $6349       $6345  
;;  $6355       $6351  
;;  $635E       $634A   $635A  
;;  $638C       $6389  
;;  $63D9       $63C8   $63D0   $63DE  
;;  $6403       $6AAE  
;;  $6404       $640E  
;;  $64A2       $64A7  
;;  $64CB       $64E5  
;;  $64D4       $64CE  
;;  $64E0       $64D2  
;;  $64F1       $64F4  
;;  $659F       $659F  
;;  $65A6       $65A6  
;;  $66B2       $66AB  
;;  $66C0       $66A8   $66B0  
;;  $66DE       $66E4  
;;  $66E9       $66E0  
;;  $66F4       $66F8  
;;  $66FA       $66F2  
;;  $6705       $6719  
;;  $6709       $6710  
;;  $6712       $670B  
;;  $672F       $675B  
;;  $673A       $6731   $6735  
;;  $6754       $6747   $674A  
;;  $6758       $6738  
;;  $6760       $676C  
;;  $6782       $677A   $677F  
;;  $679A       $67A0  
;;  $67A8       $67A4  
;;  $67AC       $67B4  
;;  $67DE       $67E7  
;;  $67E9       $67E1  
;;  $67F8       $67F4  
;;  $6812       $6803   $6806   $680A  
;;  $6820       $6A14  
;;  $6838       $682C  
;;  $6854       $683B  
;;  $6856       $688A  
;;  $686D       $681E   $684A   $687E   $688F   $68A3  
;;  $686E       $6834  
;;  $6888       $6871  
;;  $688C       $6828   $6836  
;;  $68A0       $6830  
;;  $68B8       $689E  
;;  $6908       $6903  
;;  $690B       $6824  
;;  $6979       $6970   $6976  
;;  $69BF       $69B9  
;;  $69C7       $69BD  
;;  $69C9       $69B1  
;;  $6B8A       $6AD6  
;;  $6BCF       $6BCD  
;;  $6C3D       $6C3B  
;;  $6C3E       $6C3C  
;;  $6C3F       $6C3D  
;;  $6C40       $6C3E  
;;  $6C41       $6C3F  
;;  $6C42       $6C40  
;;  $6C43       $6C41  
;;  $6C44       $6C42  
;;  $6D56       $6D54  
;;  $6D5E       $6D5C  
;; ======================================================================== ;;
