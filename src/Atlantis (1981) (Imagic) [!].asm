
        ORG     $5000
.HEADER:
        DIS                                     ; 5000   0003
        SDBD                                    ; 5001   0001
        MVII    #$4B38, R0                      ; 5002   02B8 0038 004B
        MVO     R0,     .ISRVEC.0               ; 5005   0240 0100
        SWAP    R0,     1                       ; 5007   0040
        MVO     R0,     .ISRVEC.1               ; 5008   0240 0101
        MVII    #$02F0, R6                      ; 500A   02BE 02F0
        MVII    #$00F0, R0                      ; 500C   02B8 00F0
        MVII    #$0200, R4                      ; 500E   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5010   0004 0114 0338

        MVII    #$0318, R4                      ; 5013   02BC 0318
L_5015:
        MVII    #$0047, R0                      ; 5015   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; 5017   0004 0114 0338

        MVII    #$0102, R4                      ; 501A   02BC 0102
        MVII    #$00EE, R0                      ; 501C   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 501E   0004 0114 0338

        SDBD                                    ; 5021   0001
        MVII    #$5757, R0                      ; 5022   02B8 0057 0057
        MVO     R0,     G_035D                  ; 5025   0240 035D
        MVII    #$0002, R0                      ; 5027   02B8 0002
        MVO     R0,     G_010C                  ; 5029   0240 010C
        MVO     R0,     G_010F                  ; 502B   0240 010F
        SDBD                                    ; 502D   0001
        MVII    #$FFFF, R0                      ; 502E   02B8 00FF 00FF
        MVO     R0,     G_035E                  ; 5031   0240 035E
        MVII    #$0008, R2                      ; 5033   02BA 0008
        SWAP    R2,     1                       ; 5035   0042
        MVII    #$0008, R1                      ; 5036   02B9 0008
        SDBD                                    ; 5038   0001
        MVII    #$6151, R4                      ; 5039   02BC 0051 0061
        MVII    #$0328, R5                      ; 503C   02BD 0328
L_503E:
        MVI@    R4,     R0                      ; 503E   02A0
        XORR    R2,     R0                      ; 503F   01D0
        MVO@    R0,     R5                      ; 5040   0268
        DECR    R1                              ; 5041   0011
        BNEQ    L_503E                          ; 5042   022C 0005

        MVII    #$017B, R4                      ; 5044   02BC 017B
        MVII    #$0008, R2                      ; 5046   02BA 0008
L_5048:
        MVO@    R0,     R4                      ; 5048   0260
        DECR    R2                              ; 5049   0012
        BNEQ    L_5048                          ; 504A   022C 0003

        EIS                                     ; 504C   0002
L_504D:
        MVI     G_010F, R0                      ; 504D   0280 010F
        TSTR    R0                              ; 504F   0080
        BNEQ    L_504D                          ; 5050   022C 0004

        JSR     R5,     G_4CFC                  ; 5052   0004 014C 00FC
L_5055:
        JSR     R5,     G_4869                  ; 5055   0004 0148 0069
        JSR     R5,     G_489D                  ; 5058   0004 0148 009D
        JSR     R5,     G_48C2                  ; 505B   0004 0148 00C2
        JSR     R5,     G_4917                  ; 505E   0004 0148 0117
        JSR     R5,     .EXEC.4F1               ; 5061   0004 0114 00F1
        JSR     R5,     G_4BA9                  ; 5064   0004 0148 03A9

        B       L_5055                          ; 5067   0220 0013

        PSHR    R5                              ; 5069   0275
        MVI     G_010E, R0                      ; 506A   0280 010E
        TSTR    R0                              ; 506C   0080
        BNEQ    L_509C                          ; 506D   020C 002D

        MVII    #$0003, R0                      ; 506F   02B8 0003
        MVO     R0,     G_010E                  ; 5071   0240 010E
        SDBD                                    ; 5073   0001
        MVII    #$4CEA, R4                      ; 5074   02BC 00EA 004C
        MVII    #$016D, R3                      ; 5077   02BB 016D
L_5079:
        MVI@    R3,     R0                      ; 5079   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 507A   0004 0114 0268

        TSTR    R0                              ; 507D   0080
        BMI     L_5093                          ; 507E   020B 0013
        BEQ     L_5085                          ; 5080   0204 0003

        DECR    R0                              ; 5082   0010
        BNEQ    L_5093                          ; 5083   020C 000E

L_5085:
        MVI@    R4,     R0                      ; 5085   02A0
        MVO@    R0,     R3                      ; 5086   0258
        PSHR    R4                              ; 5087   0274
L_5088:
        PSHR    R3                              ; 5088   0273
        SDBD                                    ; 5089   0001
        MVII    #$488F, R5                      ; 508A   02BD 008F 0048
        SDBD                                    ; 508D   0001
        MVI@    R4,     R7                      ; 508E   02A7
        PULR    R3                              ; 508F   02B3
        PULR    R4                              ; 5090   02B4
        B       L_5095                          ; 5091   0200 0002

L_5093:
        MVO@    R0,     R3                      ; 5093   0258
        INCR    R4                              ; 5094   000C
L_5095:
        INCR    R3                              ; 5095   000B
        ADDI    #$0002, R4                      ; 5096   02FC 0002
        CMPI    #$0173, R3                      ; 5098   037B 0173
        BLT     L_5079                          ; 509A   0225 0022

L_509C:
        PULR    R7                              ; 509C   02B7
        PSHR    R5                              ; 509D   0275
        CLRR    R1                              ; 509E   01C9
        DIS                                     ; 509F   0003
        MVI     G_010D, R2                      ; 50A0   0282 010D
        MVO     R1,     G_010D                  ; 50A2   0241 010D
        EIS                                     ; 50A4   0002
        MVII    #$0330, R3                      ; 50A5   02BB 0330
L_50A7:
        RRC     R2,     1                       ; 50A7   0072
        BNC     L_50BC                          ; 50A8   0209 0012

        MVI@    R3,     R4                      ; 50AA   029C
        TSTR    R4                              ; 50AB   00A4
        BEQ     L_50BC                          ; 50AC   0204 000E

        ADDI    #$0000, R4                      ; 50AE   02FC 0000
        SDBD                                    ; 50B0   0001
        MVII    #$48BA, R5                      ; 50B1   02BD 00BA 0048
        PSHR    R2                              ; 50B4   0272
        PSHR    R3                              ; 50B5   0273
        SUBI    #$0330, R3                      ; 50B6   033B 0330
        SDBD                                    ; 50B8   0001
        MVI@    R4,     R7                      ; 50B9   02A7
        PULR    R3                              ; 50BA   02B3
        PULR    R2                              ; 50BB   02B2
L_50BC:
        INCR    R3                              ; 50BC   000B
        CMPI    #$0337, R3                      ; 50BD   037B 0337
        BLE     L_50A7                          ; 50BF   0226 0019

        PULR    R7                              ; 50C1   02B7
        PSHR    R5                              ; 50C2   0275
        MVII    #$0350, R3                      ; 50C3   02BB 0350
        MVII    #$0318, R2                      ; 50C5   02BA 0318
L_50C7:
        CLRR    R5                              ; 50C7   01ED
        MVI@    R2,     R0                      ; 50C8   0290
        ANDI    #$0100, R0                      ; 50C9   03B8 0100
        BNEQ    L_50CE                          ; 50CB   020C 0001

        INCR    R5                              ; 50CD   000D
L_50CE:
        ADDI    #$0018, R2                      ; 50CE   02FA 0018
        MVI@    R2,     R4                      ; 50D0   0294
        TSTR    R4                              ; 50D1   00A4
        BNEQ    L_50D5                          ; 50D2   020C 0001

        INCR    R5                              ; 50D4   000D
L_50D5:
        CLRR    R1                              ; 50D5   01C9
        MVII    #$03FF, R0                      ; 50D6   02B8 03FF
        DIS                                     ; 50D8   0003
        AND@    R3,     R0                      ; 50D9   0398
        MVO@    R1,     R3                      ; 50DA   0259
        EIS                                     ; 50DB   0002
        TSTR    R5                              ; 50DC   00AD
        BNEQ    L_510F                          ; 50DD   020C 0030

        ADDI    #$0005, R4                      ; 50DF   02FC 0005
        MVI@    R4,     R1                      ; 50E1   02A1
        ANDR    R1,     R0                      ; 50E2   0188
        BEQ     L_510F                          ; 50E3   0204 002A

        MVII    #$000A, R5                      ; 50E5   02BD 000A
L_50E7:
        SARC    R0,     1                       ; 50E7   0078
        BNC     L_5107                          ; 50E8   0209 001D

        SLR     R1,     1                       ; 50EA   0061
        PSHR    R5                              ; 50EB   0275
        PSHR    R3                              ; 50EC   0273
        PSHR    R2                              ; 50ED   0272
        NOP                                     ; 50EE   0034
        PSHR    R1                              ; 50EF   0271
        PSHR    R0                              ; 50F0   0270
        SUBI    #$0330, R2                      ; 50F1   033A 0330
        NEGR    R5                              ; 50F3   0025
        MOVR    R5,     R1                      ; 50F4   00A9
        ADDI    #$000A, R1                      ; 50F5   02F9 000A
        SDBD                                    ; 50F7   0001
        MVII    #$48FF, R5                      ; 50F8   02BD 00FF 0048
        SDBD                                    ; 50FB   0001
        MVI@    R4,     R0                      ; 50FC   02A0
        PSHR    R4                              ; 50FD   0274
        MOVR    R0,     R7                      ; 50FE   0087
        PULR    R4                              ; 50FF   02B4
        PULR    R0                              ; 5100   02B0
        PULR    R1                              ; 5101   02B1
        PULR    R2                              ; 5102   02B2
        PULR    R3                              ; 5103   02B3
        PULR    R5                              ; 5104   02B5
        B       L_510C                          ; 5105   0200 0005

L_5107:
        SARC    R1,     1                       ; 5107   0079
        BNC     L_510C                          ; 5108   0209 0002

        ADDI    #$0002, R4                      ; 510A   02FC 0002
L_510C:
        DECR    R5                              ; 510C   0015
        BNEQ    L_50E7                          ; 510D   022C 0027

L_510F:
        SUBI    #$0017, R2                      ; 510F   033A 0017
        INCR    R3                              ; 5111   000B
        CMPI    #$0358, R3                      ; 5112   037B 0358
        BLT     L_50C7                          ; 5114   0225 004E

        PULR    R7                              ; 5116   02B7
        PSHR    R5                              ; 5117   0275
        MVI     G_0110, R0                      ; 5118   0280 0110
        RRC     R0,     1                       ; 511A   0070
        BC      L_512D                          ; 511B   0201 0010

        SETC                                    ; 511D   0007
        RLC     R0,     1                       ; 511E   0050
        MVO     R0,     G_0110                  ; 511F   0240 0110
        MVII    #$0338, R2                      ; 5121   02BA 0338
        MVII    #$0330, R4                      ; 5123   02BC 0330
        MVII    #$0004, R1                      ; 5125   02B9 0004
        MVII    #$0008, R0                      ; 5127   02B8 0008

        JSR     R5,     G_4943                  ; 5129   0004 0148 0143

        PULR    R7                              ; 512C   02B7
L_512D:
        RRC     R0,     1                       ; 512D   0070
        BC      L_5142                          ; 512E   0201 0012

        MVII    #$0003, R0                      ; 5130   02B8 0003
        MVO     R0,     G_0110                  ; 5132   0240 0110
        MVII    #$0348, R2                      ; 5134   02BA 0348
        MVII    #$015D, R4                      ; 5136   02BC 015D
        MVII    #$0002, R1                      ; 5138   02B9 0002
        MVII    #$0008, R0                      ; 513A   02B8 0008
        TSTR    R0                              ; 513C   0080
        BEQ     L_5142                          ; 513D   0204 0003

        JSR     R5,     G_4943                  ; 513F   0004 0148 0143

L_5142:
        PULR    R7                              ; 5142   02B7
        PSHR    R5                              ; 5143   0275
L_5144:
        MVI@    R2,     R3                      ; 5144   0293
        PSHR    R2                              ; 5145   0272
        CMPI    #$0348, R2                      ; 5146   037A 0348
        BGE     L_514B                          ; 5148   020D 0001

        INCR    R7                              ; 514A   000F
L_514B:
        SDBD                                    ; 514B   0001
        MVI@    R4,     R2                      ; 514C   02A2
        TSTR    R2                              ; 514D   0092
        BEQ     L_5159                          ; 514E   0204 0009

        ADDR    R1,     R2                      ; 5150   00CA
        MVI@    R2,     R2                      ; 5151   0292
        PSHR    R0                              ; 5152   0270
        PSHR    R1                              ; 5153   0271

        JSR     R5,     G_4960                  ; 5154   0004 0148 0160

        PULR    R1                              ; 5157   02B1
        PULR    R0                              ; 5158   02B0
L_5159:
        PULR    R2                              ; 5159   02B2
        MVO@    R3,     R2                      ; 515A   0253
        INCR    R2                              ; 515B   000A
        DECR    R0                              ; 515C   0010
        BNEQ    L_5144                          ; 515D   022C 001A

        PULR    R7                              ; 515F   02B7
        PSHR    R5                              ; 5160   0275
        DECR    R2                              ; 5161   0012
        MOVR    R3,     R1                      ; 5162   0099
        ANDI    #$000F, R1                      ; 5163   03B9 000F
        MOVR    R3,     R0                      ; 5165   0098
        SWAP    R0,     1                       ; 5166   0040
        ANDI    #$003E, R0                      ; 5167   03B8 003E
        SLR     R0,     1                       ; 5169   0060
        TSTR    R0                              ; 516A   0080
L_516B:
        BEQ     L_517E                          ; 516B   0204 0011

        DECR    R0                              ; 516D   0010
        BNEQ    L_5183                          ; 516E   020C 0013

        TSTR    R3                              ; 5170   009B
        BPL     L_5175                          ; 5171   0203 0002

        DECR    R1                              ; 5173   0011
        INCR    R7                              ; 5174   000F
L_5175:
        INCR    R1                              ; 5175   0009
        TSTR    R1                              ; 5176   0089
        BMI     L_517D                          ; 5177   020B 0004

        CMPR    R2,     R1                      ; 5179   0151
        BLE     L_517E                          ; 517A   0206 0002

        CLRR    R2                              ; 517C   01D2
L_517D:
        MOVR    R2,     R1                      ; 517D   0091
L_517E:
        MOVR    R3,     R0                      ; 517E   0098
        ANDI    #$01F0, R0                      ; 517F   03B8 01F0
        SLR     R0,     2                       ; 5181   0064
        SLR     R0,     2                       ; 5182   0064
L_5183:
        SDBD                                    ; 5183   0001
        ANDI    #$81F0, R3                      ; 5184   03BB 00F0 0081
        SWAP    R0,     1                       ; 5187   0040
        SLL     R0,     1                       ; 5188   0048
        XORR    R0,     R3                      ; 5189   01C3
        XORR    R1,     R3                      ; 518A   01CB
        PULR    R7                              ; 518B   02B7
L_518C:
        MVI     .STIC.BORD,R0                   ; 518C   0280 002C
        MVO     R0,     G_0183                  ; 518E   0240 0183
        MVO     R1,     .STIC.BORD              ; 5190   0241 002C
        MVII    #$0081, R1                      ; 5192   02B9 0081
        MVO     R1,     G_0102                  ; 5194   0241 0102
        PULR    R7                              ; 5196   02B7
        PSHR    R5                              ; 5197   0275
        MVI     G_0103, R0                      ; 5198   0280 0103
        TSTR    R0                              ; 519A   0080
        BEQ     L_51A0                          ; 519B   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 519D   0240 0020
L_519F:
        PULR    R7                              ; 519F   02B7
L_51A0:
        MVI     G_0102, R1                      ; 51A0   0281 0102
        SUBI    #$0080, R1                      ; 51A2   0339 0080
        BMI     L_51B1                          ; 51A4   020B 000B
        BEQ     L_518C                          ; 51A6   0224 001B

        DECR    R1                              ; 51A8   0011
        BEQ     L_519F                          ; 51A9   0224 000B

        MVI     G_0183, R1                      ; 51AB   0281 0183
        MVO     R1,     .STIC.BORD              ; 51AD   0241 002C
        MVO     R0,     G_0102                  ; 51AF   0240 0102
L_51B1:
        MVO     R0,     .STIC.VIDEN             ; 51B1   0240 0020
        INCR    R0                              ; 51B3   0008
        MVO     R0,     G_0103                  ; 51B4   0240 0103

        JSR     R5,     G_4B0A                  ; 51B6   0004 0148 030A

        MVII    #$0350, R3                      ; 51B9   02BB 0350
        MVII    #$0018, R2                      ; 51BB   02BA 0018
        CLRR    R5                              ; 51BD   01ED
        MVII    #$0008, R4                      ; 51BE   02BC 0008
L_51C0:
        MVI@    R2,     R0                      ; 51C0   0290
        MVO@    R5,     R2                      ; 51C1   0255
        MVI@    R3,     R1                      ; 51C2   0299
        COMR    R0                              ; 51C3   0018
        ANDR    R0,     R1                      ; 51C4   0181
        COMR    R0                              ; 51C5   0018
        XORR    R0,     R1                      ; 51C6   01C1
        MVO@    R1,     R3                      ; 51C7   0259
        INCR    R2                              ; 51C8   000A
        INCR    R3                              ; 51C9   000B
        DECR    R4                              ; 51CA   0014
        BNEQ    L_51C0                          ; 51CB   022C 000C

        MVI     G_0104, R2                      ; 51CD   0282 0104
        SLL     R2,     1                       ; 51CF   004A
        MVII    #$0338, R4                      ; 51D0   02BC 0338
        MVII    #$0330, R5                      ; 51D2   02BD 0330
        ADDR    R2,     R4                      ; 51D4   00D4
        ADDR    R2,     R5                      ; 51D5   00D5
L_51D6:
        MVI@    R4,     R3                      ; 51D6   02A3
        ANDI    #$000F, R3                      ; 51D7   03BB 000F
        PSHR    R4                              ; 51D9   0274
        MVI@    R5,     R4                      ; 51DA   02AC
        TSTR    R4                              ; 51DB   00A4
        BEQ     L_5236                          ; 51DC   0204 0058

        MVII    #$0173, R1                      ; 51DE   02B9 0173
        ADDR    R2,     R1                      ; 51E0   00D1
        CMP@    R1,     R3                      ; 51E1   034B
        BEQ     L_5236                          ; 51E2   0204 0052

        MVO@    R3,     R1                      ; 51E4   024B
        PSHR    R5                              ; 51E5   0275
        MVII    #$0318, R1                      ; 51E6   02B9 0318
        ADDR    R2,     R1                      ; 51E8   00D1
        MVI@    R1,     R0                      ; 51E9   0288
        PSHR    R1                              ; 51EA   0271
        MOVR    R0,     R1                      ; 51EB   0081
        SDBD                                    ; 51EC   0001
        ANDI    #$FDFF, R0                      ; 51ED   03B8 00FF 00FD
        SDBD                                    ; 51F0   0001
        ANDI    #$0800, R1                      ; 51F1   03B9 0000 0008
        SLR     R1,     2                       ; 51F4   0065
        XORR    R1,     R0                      ; 51F5   01C8
        PULR    R1                              ; 51F6   02B1
        MVO@    R0,     R1                      ; 51F7   0248
        ADDI    #$0002, R4                      ; 51F8   02FC 0002
        SDBD                                    ; 51FA   0001
        MVII    #$6151, R5                      ; 51FB   02BD 0051 0061
        ADDR    R2,     R5                      ; 51FE   00D5
        MVI@    R5,     R5                      ; 51FF   02AD
        SDBD                                    ; 5200   0001
        ADDI    #$3800, R5                      ; 5201   02FD 0000 0038
        MVII    #$0320, R1                      ; 5204   02B9 0320
L_5206:
        ADDR    R2,     R1                      ; 5206   00D1
        MVI@    R1,     R0                      ; 5207   0288
        SLL     R3,     2                       ; 5208   004F
        SLL     R3,     1                       ; 5209   004B
        SDBD                                    ; 520A   0001
        MVI@    R4,     R1                      ; 520B   02A1
        MOVR    R1,     R4                      ; 520C   008C
        ANDI    #$0080, R0                      ; 520D   03B8 0080
        BEQ     L_5224                          ; 520F   0204 0013

        SLL     R3,     1                       ; 5211   004B
        ADDR    R3,     R4                      ; 5212   00DC
        MVI@    R4,     R0                      ; 5213   02A0
        MVO@    R0,     R5                      ; 5214   0268
        MVI@    R4,     R0                      ; 5215   02A0
        MVO@    R0,     R5                      ; 5216   0268
        MVI@    R4,     R0                      ; 5217   02A0
        MVO@    R0,     R5                      ; 5218   0268
        MVI@    R4,     R0                      ; 5219   02A0
        MVO@    R0,     R5                      ; 521A   0268
        MVI@    R4,     R0                      ; 521B   02A0
        MVO@    R0,     R5                      ; 521C   0268
        MVI@    R4,     R0                      ; 521D   02A0
        MVO@    R0,     R5                      ; 521E   0268
        MVI@    R4,     R0                      ; 521F   02A0
        MVO@    R0,     R5                      ; 5220   0268
        MVI@    R4,     R0                      ; 5221   02A0
        MVO@    R0,     R5                      ; 5222   0268
        INCR    R7                              ; 5223   000F
L_5224:
        ADDR    R3,     R4                      ; 5224   00DC
        MVI@    R4,     R0                      ; 5225   02A0
        MVO@    R0,     R5                      ; 5226   0268
        MVI@    R4,     R0                      ; 5227   02A0
        MVO@    R0,     R5                      ; 5228   0268
        MVI@    R4,     R0                      ; 5229   02A0
        MVO@    R0,     R5                      ; 522A   0268
        MVI@    R4,     R0                      ; 522B   02A0
        MVO@    R0,     R5                      ; 522C   0268
        MVI@    R4,     R0                      ; 522D   02A0
        MVO@    R0,     R5                      ; 522E   0268
        MVI@    R4,     R0                      ; 522F   02A0
        MVO@    R0,     R5                      ; 5230   0268
        MVI@    R4,     R0                      ; 5231   02A0
        MVO@    R0,     R5                      ; 5232   0268
        MVI@    R4,     R0                      ; 5233   02A0
        MVO@    R0,     R5                      ; 5234   0268
        PULR    R5                              ; 5235   02B5
L_5236:
        PULR    R4                              ; 5236   02B4
        INCR    R2                              ; 5237   000A
        MOVR    R2,     R0                      ; 5238   0090
        SARC    R0,     1                       ; 5239   0078
        BC      L_51D6                          ; 523A   0221 0065

        MVI     G_0104, R2                      ; 523C   0282 0104
        SLL     R2,     1                       ; 523E   004A
        MVII    #$0348, R4                      ; 523F   02BC 0348
        MVII    #$015D, R5                      ; 5241   02BD 015D
        ADDR    R2,     R4                      ; 5243   00D4
        SLL     R2,     1                       ; 5244   004A
        ADDR    R2,     R5                      ; 5245   00D5
        SLR     R2,     1                       ; 5246   0062
L_5247:
        MOVR    R2,     R1                      ; 5247   0091
        INCR    R1                              ; 5248   0009
        CMPI    #$0008, R1                      ; 5249   0379 0008
        BGT     L_527F                          ; 524B   020E 0032

        MVI@    R4,     R3                      ; 524D   02A3
        ANDI    #$000F, R3                      ; 524E   03BB 000F
        PSHR    R4                              ; 5250   0274
        SDBD                                    ; 5251   0001
        MVI@    R5,     R4                      ; 5252   02AC
        PSHR    R5                              ; 5253   0275
        MVII    #$017B, R1                      ; 5254   02B9 017B
        ADDR    R2,     R1                      ; 5256   00D1
        CMP@    R1,     R3                      ; 5257   034B
        BEQ     L_5278                          ; 5258   0204 001E

        MVO@    R3,     R1                      ; 525A   024B
        SLL     R3,     2                       ; 525B   004F
        SLL     R3,     1                       ; 525C   004B
        SDBD                                    ; 525D   0001
        ADD@    R4,     R3                      ; 525E   02E3
        MOVR    R3,     R4                      ; 525F   009C
        MOVR    R2,     R1                      ; 5260   0091
        SLL     R1,     2                       ; 5261   004D
        SLL     R1,     1                       ; 5262   0049
        SDBD                                    ; 5263   0001
        ADDI    #$3800, R1                      ; 5264   02F9 0000 0038
        MOVR    R1,     R5                      ; 5267   008D
        MVI@    R4,     R0                      ; 5268   02A0
        MVO@    R0,     R5                      ; 5269   0268
        MVI@    R4,     R0                      ; 526A   02A0
        MVO@    R0,     R5                      ; 526B   0268
        MVI@    R4,     R0                      ; 526C   02A0
        MVO@    R0,     R5                      ; 526D   0268
        MVI@    R4,     R0                      ; 526E   02A0
        MVO@    R0,     R5                      ; 526F   0268
        MVI@    R4,     R0                      ; 5270   02A0
        MVO@    R0,     R5                      ; 5271   0268
        MVI@    R4,     R0                      ; 5272   02A0
L_5273:
        MVO@    R0,     R5                      ; 5273   0268
        MVI@    R4,     R0                      ; 5274   02A0
        MVO@    R0,     R5                      ; 5275   0268
        MVI@    R4,     R0                      ; 5276   02A0
        MVO@    R0,     R5                      ; 5277   0268
L_5278:
        PULR    R5                              ; 5278   02B5
        PULR    R4                              ; 5279   02B4
        INCR    R2                              ; 527A   000A
        MOVR    R2,     R0                      ; 527B   0090
        SARC    R0,     1                       ; 527C   0078
        BC      L_5247                          ; 527D   0221 0037

L_527F:
        MVII    #$00FF, R0                      ; 527F   02B8 00FF
        MVII    #$0318, R3                      ; 5281   02BB 0318
        MVII    #$0125, R4                      ; 5283   02BC 0125

        JSR     R5,     G_4AD6                  ; 5285   0004 0148 02D6

        MVII    #$007F, R0                      ; 5288   02B8 007F
        MVII    #$0320, R3                      ; 528A   02BB 0320
        MVII    #$0135, R4                      ; 528C   02BC 0135

        JSR     R5,     G_4AD6                  ; 528E   0004 0148 02D6

        CLRR    R1                              ; 5291   01C9
        MVII    #$0340, R3                      ; 5292   02BB 0340
L_5294:
        CLRC                                    ; 5294   0006
        MVI@    R3,     R0                      ; 5295   0298
        TSTR    R0                              ; 5296   0080
        BEQ     L_529D                          ; 5297   0204 0004

        DECR    R0                              ; 5299   0010
        BNEQ    L_529D                          ; 529A   020C 0001

        SETC                                    ; 529C   0007
L_529D:
        RRC     R1,     1                       ; 529D   0071
        MVO@    R0,     R3                      ; 529E   0258
        INCR    R3                              ; 529F   000B
        CMPI    #$0347, R3                      ; 52A0   037B 0347
        BLE     L_5294                          ; 52A2   0226 000F

        SWAP    R1,     1                       ; 52A4   0041
        MVI     G_010D, R0                      ; 52A5   0280 010D
        COMR    R0                              ; 52A7   0018
        ANDR    R0,     R1                      ; 52A8   0181
        COMR    R0                              ; 52A9   0018
        XORR    R0,     R1                      ; 52AA   01C1
        MVO     R1,     G_010D                  ; 52AB   0241 010D
        MVI     G_010E, R0                      ; 52AD   0280 010E
        TSTR    R0                              ; 52AF   0080
        BEQ     L_52B9                          ; 52B0   0204 0007

        AND     G_0110, R0                      ; 52B2   0380 0110
        MVO     R0,     G_0110                  ; 52B4   0240 0110
        DECR    R0                              ; 52B6   0010
        MVO     R0,     G_010E                  ; 52B7   0240 010E
L_52B9:
        MVII    #$0145, R3                      ; 52B9   02BB 0145
        MVII    #$0003, R1                      ; 52BB   02B9 0003
L_52BD:
        MVI@    R3,     R0                      ; 52BD   0298
        TSTR    R0                              ; 52BE   0080
        BEQ     L_52C3                          ; 52BF   0204 0002

        DECR    R0                              ; 52C1   0010
        MVO@    R0,     R3                      ; 52C2   0258
L_52C3:
        INCR    R3                              ; 52C3   000B
        DECR    R1                              ; 52C4   0011
        BNEQ    L_52BD                          ; 52C5   022C 0009

        MVII    #$00FF, R0                      ; 52C7   02B8 00FF
        MVO     R0,     G_011D                  ; 52C9   0240 011D
        MVI     G_0104, R0                      ; 52CB   0280 0104
        INCR    R0                              ; 52CD   0008
        ANDI    #$0003, R0                      ; 52CE   03B8 0003
        MVO     R0,     G_0104                  ; 52D0   0240 0104
        CLRR    R0                              ; 52D2   01C0
        MVO     R0,     G_0103                  ; 52D3   0240 0103
        PULR    R7                              ; 52D5   02B7
        PSHR    R5                              ; 52D6   0275
        MVII    #$0008, R5                      ; 52D7   02BD 0008
L_52D9:
        PSHR    R5                              ; 52D9   0275
        MVI@    R3,     R1                      ; 52DA   0299
        SDBD                                    ; 52DB   0001
        MVII    #$4000, R5                      ; 52DC   02BD 0000 0040
        ANDR    R1,     R5                      ; 52DF   018D
        BEQ     L_52E7                          ; 52E0   0204 0005

        JSR     R5,     G_4B24                  ; 52E2   0004 0148 0324

        B       L_5304                          ; 52E5   0200 001D

L_52E7:
        ANDR    R0,     R1                      ; 52E7   0181
        PSHR    R0                              ; 52E8   0270
        SWAP    R1,     1                       ; 52E9   0041
        PSHR    R4                              ; 52EA   0274
        XOR@    R4,     R1                      ; 52EB   03E1
        MVI@    R4,     R0                      ; 52EC   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52ED   0004 0114 0268

        MVI     G_010C, R2                      ; 52F0   0282 010C
        TSTR    R2                              ; 52F2   0092
        BEQ     L_52F9                          ; 52F3   0204 0004

L_52F5:
        SLL     R0,     1                       ; 52F5   0048
        DECR    R2                              ; 52F6   0012
        BNEQ    L_52F5                          ; 52F7   022C 0003

L_52F9:
        ADDR    R0,     R1                      ; 52F9   00C1
        PULR    R2                              ; 52FA   02B2
        MVO@    R1,     R2                      ; 52FB   0251
        SWAP    R1,     1                       ; 52FC   0041
        PULR    R0                              ; 52FD   02B0
        ANDR    R0,     R1                      ; 52FE   0181
        MOVR    R0,     R2                      ; 52FF   0082
        COMR    R2                              ; 5300   001A
        AND@    R3,     R2                      ; 5301   039A
        XORR    R1,     R2                      ; 5302   01CA
        MVO@    R2,     R3                      ; 5303   025A
L_5304:
        INCR    R3                              ; 5304   000B
        PULR    R5                              ; 5305   02B5
        DECR    R5                              ; 5306   0015
        BNEQ    L_52D9                          ; 5307   022C 002F

        PULR    R7                              ; 5309   02B7
        PSHR    R5                              ; 530A   0275
        MVII    #$0318, R4                      ; 530B   02BC 0318
        CLRR    R5                              ; 530D   01ED
        MVII    #$0003, R1                      ; 530E   02B9 0003
L_5310:
        MVI@    R4,     R0                      ; 5310   02A0
        MVO@    R0,     R5                      ; 5311   0268
        MVI@    R4,     R0                      ; 5312   02A0
        MVO@    R0,     R5                      ; 5313   0268
        MVI@    R4,     R0                      ; 5314   02A0
        MVO@    R0,     R5                      ; 5315   0268
        MVI@    R4,     R0                      ; 5316   02A0
        MVO@    R0,     R5                      ; 5317   0268
        MVI@    R4,     R0                      ; 5318   02A0
        MVO@    R0,     R5                      ; 5319   0268
        MVI@    R4,     R0                      ; 531A   02A0
        MVO@    R0,     R5                      ; 531B   0268
        MVI@    R4,     R0                      ; 531C   02A0
        MVO@    R0,     R5                      ; 531D   0268
        MVI@    R4,     R0                      ; 531E   02A0
        MVO@    R0,     R5                      ; 531F   0268
        DECR    R1                              ; 5320   0011
        BNEQ    L_5310                          ; 5321   022C 0012

        PULR    R7                              ; 5323   02B7
        PSHR    R5                              ; 5324   0275
        PSHR    R0                              ; 5325   0270
        MOVR    R0,     R2                      ; 5326   0082
L_5327:
        DECR    R3                              ; 5327   0013
        MVI@    R3,     R1                      ; 5328   0299
        ANDR    R0,     R1                      ; 5329   0181
        INCR    R3                              ; 532A   000B
        INCR    R4                              ; 532B   000C
        MVI@    R4,     R0                      ; 532C   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 532D   0004 0114 0268

        ADDR    R0,     R1                      ; 5330   00C1
        ANDR    R2,     R1                      ; 5331   0191
        COMR    R2                              ; 5332   001A
        AND@    R3,     R2                      ; 5333   039A
        XORR    R2,     R1                      ; 5334   01D1
        MVO@    R1,     R3                      ; 5335   0259
        PULR    R0                              ; 5336   02B0
        PULR    R7                              ; 5337   02B7
        PSHR    R5                              ; 5338   0275
        DIS                                     ; 5339   0003

        JSR     R5,     G_4B52                  ; 533A   0004 0148 0352

        MVII    #$0020, R0                      ; 533D   02B8 0020
        CLRR    R4                              ; 533F   01E4
        MVO     R4,     G_010F                  ; 5340   0244 010F

        JSR     R5,     X_FILL_ZERO             ; 5342   0004 0114 0338
        JSR     R5,     G_4B72                  ; 5345   0004 0148 0372

        MVII    #$0097, R0                      ; 5348   02B8 0097
        MVO     R0,     .ISRVEC.0               ; 534A   0240 0100
        MVII    #$0049, R0                      ; 534C   02B8 0049
        MVO     R0,     .ISRVEC.1               ; 534E   0240 0101
        EIS                                     ; 5350   0002
        PULR    R7                              ; 5351   02B7
        PSHR    R5                              ; 5352   0275
        CLRR    R0                              ; 5353   01C0
        MVO     R0,     .STIC.HDLY              ; 5354   0240 0030
        MVO     R0,     .STIC.VDLY              ; 5356   0240 0031
        SDBD                                    ; 5358   0001
        MVII    #$4CE3, R4                      ; 5359   02BC 00E3 004C
        MVI@    R4,     R0                      ; 535C   02A0
        MVO     R0,     G_0105                  ; 535D   0240 0105
        MVII    #$0021, R1                      ; 535F   02B9 0021
        TSTR    R0                              ; 5361   0080
        BEQ     L_5366                          ; 5362   0204 0002

        MVO@    R0,     R1                      ; 5364   0248
        INCR    R7                              ; 5365   000F
L_5366:
        MVI@    R1,     R0                      ; 5366   0288
        MVII    #$0028, R1                      ; 5367   02B9 0028
        MVII    #$0005, R0                      ; 5369   02B8 0005

        JSR     R5,     .EXEC.730               ; 536B   0004 0114 0330

        MVI@    R4,     R0                      ; 536E   02A0
        MVO     R0,     .STIC.EDGE              ; 536F   0240 0032
        PULR    R7                              ; 5371   02B7
        PSHR    R5                              ; 5372   0275
        MVII    #$0008, R0                      ; 5373   02B8 0008
        MVII    #$0348, R1                      ; 5375   02B9 0348
        SDBD                                    ; 5377   0001
        MVII    #$64D1, R4                      ; 5378   02BC 00D1 0064
        TSTR    R0                              ; 537B   0080
        BEQ     L_538C                          ; 537C   0204 000E

        JSR     R5,     .EXEC.730               ; 537E   0004 0114 0330

        MVII    #$0008, R0                      ; 5381   02B8 0008
        MVII    #$015D, R5                      ; 5383   02BD 015D
L_5385:
        MVI@    R4,     R1                      ; 5385   02A1
        MVO@    R1,     R5                      ; 5386   0269
        MVI@    R4,     R1                      ; 5387   02A1
        MVO@    R1,     R5                      ; 5388   0269
        DECR    R0                              ; 5389   0010
        BNEQ    L_5385                          ; 538A   022C 0006

L_538C:
        SDBD                                    ; 538C   0001
        MVII    #$65E1, R4                      ; 538D   02BC 00E1 0065
        MVI@    R4,     R1                      ; 5390   02A1
        SDBD                                    ; 5391   0001
        ADDI    #$3800, R1                      ; 5392   02F9 0000 0038
        MVI@    R4,     R0                      ; 5395   02A0

        JSR     R5,     .EXEC.730               ; 5396   0004 0114 0330

L_5399:
        PULR    R7                              ; 5399   02B7
        MVII    #$0106, R4                      ; 539A   02BC 0106
        B       L_53A4                          ; 539C   0200 0006

        MVII    #$0108, R4                      ; 539E   02BC 0108
        B       L_53A4                          ; 53A0   0200 0002

        MVII    #$010A, R4                      ; 53A2   02BC 010A
L_53A4:
        MVI@    R5,     R0                      ; 53A4   02A8
        MVO@    R0,     R4                      ; 53A5   0260
        MVI@    R5,     R0                      ; 53A6   02A8
        MVO@    R0,     R4                      ; 53A7   0260
        MOVR    R5,     R7                      ; 53A8   00AF
        PSHR    R5                              ; 53A9   0275
        MVII    #$0106, R4                      ; 53AA   02BC 0106
L_53AC:
        SDBD                                    ; 53AC   0001
        MVI@    R4,     R0                      ; 53AD   02A0
        TSTR    R0                              ; 53AE   0080
        BEQ     L_53BC                          ; 53AF   0204 000B

        SUBI    #$0002, R4                      ; 53B1   033C 0002
        SDBD                                    ; 53B3   0001
        MVII    #$4BBC, R5                      ; 53B4   02BD 00BC 004B
        MOVR    R4,     R3                      ; 53B7   00A3
L_53B8:
        SUBI    #$0106, R3                      ; 53B8   033B 0106
        SLR     R3,     1                       ; 53BA   0063
        MOVR    R0,     R7                      ; 53BB   0087
L_53BC:
        CMPI    #$010A, R4                      ; 53BC   037C 010A
        BLE     L_53AC                          ; 53BE   0226 0013

        PULR    R7                              ; 53C0   02B7
        DECR    R2                              ; 53C1   0012
        INCR    R7                              ; 53C2   000F
        CLRR    R2                              ; 53C3   01D2
        PSHR    R5                              ; 53C4   0275
L_53C5:
        MVII    #$0002, R1                      ; 53C5   02B9 0002

        JSR     R5,     G_4BF6                  ; 53C7   0004 0148 03F6

        SDBD                                    ; 53CA   0001
        MVI@    R4,     R0                      ; 53CB   02A0
        MVI@    R3,     R1                      ; 53CC   0299
        SDBD                                    ; 53CD   0001
        ANDI    #$0FF8, R1                      ; 53CE   03B9 00F8 000F
        XORR    R0,     R1                      ; 53D1   01C1
        MVO@    R1,     R3                      ; 53D2   0259
        ADDI    #$0008, R3                      ; 53D3   02FB 0008
        MVII    #$0003, R1                      ; 53D5   02B9 0003

        JSR     R5,     G_4BF6                  ; 53D7   0004 0148 03F6

        SUBI    #$0348, R3                      ; 53DA   033B 0348
        PSHR    R3                              ; 53DC   0273
        MVII    #$0173, R1                      ; 53DD   02B9 0173
        ADDR    R3,     R1                      ; 53DF   00D9
        MVO@    R1,     R1                      ; 53E0   0249
        SLL     R3,     1                       ; 53E1   004B
        ADDI    #$0126, R3                      ; 53E2   02FB 0126
        MVI@    R4,     R0                      ; 53E4   02A0
        MVO@    R0,     R3                      ; 53E5   0258
        CLRR    R1                              ; 53E6   01C9
        DECR    R3                              ; 53E7   0013
        MVO@    R1,     R3                      ; 53E8   0259
        ADDI    #$0011, R3                      ; 53E9   02FB 0011
        MVI@    R4,     R0                      ; 53EB   02A0
        MVO@    R0,     R3                      ; 53EC   0258
        DECR    R3                              ; 53ED   0013
        MVO@    R1,     R3                      ; 53EE   0259
        PULR    R3                              ; 53EF   02B3
        ADDI    #$0319, R3                      ; 53F0   02FB 0319
        DECR    R2                              ; 53F2   0012
        BPL     L_53C5                          ; 53F3   0223 002F

        PULR    R7                              ; 53F5   02B7
L_53F6:
        SDBD                                    ; 53F6   0001
        MVI@    R4,     R0                      ; 53F7   02A0
        MVO@    R0,     R3                      ; 53F8   0258
        ADDI    #$0008, R3                      ; 53F9   02FB 0008
        DECR    R1                              ; 53FB   0011
        BNEQ    L_53F6                          ; 53FC   022C 0007

        MOVR    R5,     R7                      ; 53FE   00AF
        PSHR    R5                              ; 53FF   0275
        PSHR    R0                              ; 5400   0270
        PSHR    R1                              ; 5401   0271

        JSR     R5,     G_4C0D                  ; 5402   0004 014C 000D

        PULR    R1                              ; 5405   02B1
        PULR    R0                              ; 5406   02B0
        PSHR    R2                              ; 5407   0272

        JSR     R5,     G_4C0F                  ; 5408   0004 014C 000F

        PULR    R1                              ; 540B   02B1
        PULR    R7                              ; 540C   02B7
        SUBI    #$0004, R0                      ; 540D   0338 0004
        PSHR    R5                              ; 540F   0275
        TSTR    R1                              ; 5410   0089
        BPL     L_5416                          ; 5411   0203 0003

        NEGR    R1                              ; 5413   0021
        ADDI    #$0008, R0                      ; 5414   02F8 0008
L_5416:
        ANDI    #$000F, R0                      ; 5416   03B8 000F
        CLRR    R3                              ; 5418   01DB
L_5419:
        CMPI    #$0004, R0                      ; 5419   0378 0004
        BLE     L_5429                          ; 541B   0206 000C

        CMPI    #$0008, R0                      ; 541D   0378 0008
        BLE     L_5426                          ; 541F   0206 0005

        SUBI    #$0008, R0                      ; 5421   0338 0008
        INCR    R3                              ; 5423   000B
        B       L_5419                          ; 5424   0220 000C

L_5426:
        NEGR    R0                              ; 5426   0020
        ADDI    #$0008, R0                      ; 5427   02F8 0008
L_5429:
        SDBD                                    ; 5429   0001
        MVII    #$4C3A, R2                      ; 542A   02BA 003A 004C
        ADDR    R0,     R2                      ; 542D   00C2
        MVI@    R2,     R0                      ; 542E   0290

        JSR     R5,     X_MPY                   ; 542F   0004 011C 01DC

        SWAP    R2,     1                       ; 5432   0042
        ANDI    #$00FF, R2                      ; 5433   03BA 00FF
        TSTR    R3                              ; 5435   009B
        BNEQ    L_5439                          ; 5436   020C 0001

        NEGR    R2                              ; 5438   0022
L_5439:
        PULR    R7                              ; 5439   02B7
        DECLE   $0000                           ; 543A   0000

        SLR     R1,     1                       ; 543B   0061
        MOVR    R6,     R4                      ; 543C   00B4
        ADDR    R5,     R3                      ; 543D   00EB
        SUBR    R0,     R0                      ; 543E   0100
        CLRR    R1                              ; 543F   01C9
        CLRR    R2                              ; 5440   01D2
        MVO@    R1,     R3                      ; 5441   0259
        ADDI    #$0010, R3                      ; 5442   02FB 0010
        MVO@    R2,     R3                      ; 5444   025A
        MOVR    R5,     R7                      ; 5445   00AF
        MVI@    R4,     R0                      ; 5446   02A0
        ANDI    #$00FF, R0                      ; 5447   03B8 00FF
        ADDI    #$0007, R4                      ; 5449   02FC 0007
        MVI@    R4,     R1                      ; 544B   02A1
        ANDI    #$007F, R1                      ; 544C   03B9 007F
        PSHR    R5                              ; 544E   0275

        JSR     R5,     .EXEC.78C               ; 544F   0004 0114 038C

        MOVR    R0,     R3                      ; 5452   0083
        MOVR    R1,     R4                      ; 5453   008C
        MOVR    R2,     R1                      ; 5454   0091

        JSR     R5,     X_SQRT                  ; 5455   0004 011C 0223

        PULR    R7                              ; 5458   02B7
        MVII    #$0001, R0                      ; 5459   02B8 0001
        INCR    R7                              ; 545B   000F
        CLRR    R0                              ; 545C   01C0
        PSHR    R5                              ; 545D   0275
        PSHR    R0                              ; 545E   0270
        PSHR    R4                              ; 545F   0274
        PSHR    R1                              ; 5460   0271

        JSR     R5,     G_4C46                  ; 5461   0004 014C 0046

        MOVR    R3,     R0                      ; 5464   0098
        MOVR    R2,     R3                      ; 5465   0093
        PULR    R1                              ; 5466   02B1
        PSHR    R1                              ; 5467   0271

        JSR     R5,     X_MPY                   ; 5468   0004 011C 01DC

        MOVR    R2,     R1                      ; 546B   0091
        MOVR    R3,     R2                      ; 546C   009A

        JSR     R5,     X_DIVR                  ; 546D   0004 011C 01F8

        PULR    R1                              ; 5470   02B1
        PSHR    R0                              ; 5471   0270
        MOVR    R4,     R0                      ; 5472   00A0
        MOVR    R1,     R4                      ; 5473   008C

        JSR     R5,     X_MPY                   ; 5474   0004 011C 01DC

        MOVR    R2,     R1                      ; 5477   0091
        MOVR    R3,     R2                      ; 5478   009A

        JSR     R5,     X_DIVR                  ; 5479   0004 011C 01F8

        PULR    R1                              ; 547C   02B1
        PULR    R2                              ; 547D   02B2
        PULR    R5                              ; 547E   02B5
        SUBI    #$0318, R2                      ; 547F   033A 0318
        PSHR    R2                              ; 5481   0272
        SLL     R2,     1                       ; 5482   004A
        ADDI    #$0126, R2                      ; 5483   02FA 0126
        MVO@    R1,     R2                      ; 5485   0251
        ADDI    #$0010, R2                      ; 5486   02FA 0010
        MVO@    R0,     R2                      ; 5488   0250
        TSTR    R5                              ; 5489   00AD
        BEQ     L_54AF                          ; 548A   0204 0023

        MOVR    R4,     R2                      ; 548C   00A2
        MOVR    R3,     R1                      ; 548D   0099
        CMPI    #$007F, R1                      ; 548E   0379 007F
        BGT     L_5498                          ; 5490   020E 0006

        SWAP    R1,     1                       ; 5492   0041

        JSR     R5,     X_DIVR                  ; 5493   0004 011C 01F8

        B       L_549C                          ; 5496   0200 0004

L_5498:
        JSR     R5,     X_DIVR                  ; 5498   0004 011C 01F8

        SWAP    R0,     1                       ; 549B   0040
L_549C:
        MVI     G_010C, R1                      ; 549C   0281 010C
        TSTR    R1                              ; 549E   0089
        BEQ     L_54A5                          ; 549F   0204 0004

L_54A1:
        SLR     R0,     1                       ; 54A1   0060
        DECR    R1                              ; 54A2   0011
        BNEQ    L_54A1                          ; 54A3   022C 0003

L_54A5:
        TSTR    R0                              ; 54A5   0080
        BNEQ    L_54AA                          ; 54A6   020C 0002

        MVII    #$0001, R0                      ; 54A8   02B8 0001
L_54AA:
        PULR    R2                              ; 54AA   02B2
        ADDI    #$0340, R2                      ; 54AB   02FA 0340
        MVO@    R0,     R2                      ; 54AD   0250
        INCR    R7                              ; 54AE   000F
L_54AF:
        PULR    R2                              ; 54AF   02B2
        PULR    R7                              ; 54B0   02B7
        MVII    #$0008, R2                      ; 54B1   02BA 0008
        CLRR    R3                              ; 54B3   01DB
        DECR    R2                              ; 54B4   0012
        INCR    R7                              ; 54B5   000F
        CLRR    R2                              ; 54B6   01D2
        PSHR    R5                              ; 54B7   0275
        MOVR    R3,     R4                      ; 54B8   009C
        MOVR    R3,     R5                      ; 54B9   009D
        ADDI    #$0318, R4                      ; 54BA   02FC 0318
        ADDI    #$0330, R5                      ; 54BC   02FD 0330
L_54BE:
        CLRR    R0                              ; 54BE   01C0
        MVO@    R0,     R4                      ; 54BF   0260
        MVO@    R0,     R5                      ; 54C0   0268
        PSHR    R5                              ; 54C1   0275
        ADDI    #$000F, R5                      ; 54C2   02FD 000F
        MVO@    R0,     R5                      ; 54C4   0268
        SUBI    #$0341, R5                      ; 54C5   033D 0341
        MOVR    R5,     R0                      ; 54C7   00A8

        JSR     R5,     X_POW2                  ; 54C8   0004 0114 0345

        COMR    R0                              ; 54CB   0018
        DIS                                     ; 54CC   0003
        AND     G_010D, R0                      ; 54CD   0380 010D
        MVO     R0,     G_010D                  ; 54CF   0240 010D
        EIS                                     ; 54D1   0002
        PULR    R5                              ; 54D2   02B5
        DECR    R2                              ; 54D3   0012
        BPL     L_54BE                          ; 54D4   0223 0017

        PULR    R7                              ; 54D6   02B7
        PSHR    R5                              ; 54D7   0275
        PSHR    R3                              ; 54D8   0273
        PSHR    R1                              ; 54D9   0271

        JSR     R5,     G_4CB6                  ; 54DA   0004 014C 00B6

        PULR    R1                              ; 54DD   02B1
        PULR    R3                              ; 54DE   02B3
        ADDI    #$0330, R3                      ; 54DF   02FB 0330
        MVO@    R1,     R3                      ; 54E1   0259
        PULR    R7                              ; 54E2   02B7
        DECLE   $0001,  $0001,  $0000,  $0000   ; 54E3   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 54E7   0000 0000 0000

        INCR    R2                              ; 54EA   000A
        DECR    R1                              ; 54EB   0011
        SLL     R2,     2                       ; 54EC   004E
        DECLE   $0001                           ; 54ED   0001

        ADDR    R7,     R0                      ; 54EE   00F8
        RLC     R0,     1                       ; 54EF   0050
        COMR    R6                              ; 54F0   001E
        ADDR    R0,     R7                      ; 54F1   00C7
        SLLC    R1,     1                       ; 54F2   0059
        INCR    R2                              ; 54F3   000A
L_54F4:
        RSWD    R4                              ; 54F4   003C
        SLL     R1,     2                       ; 54F5   004D
        INCR    R7                              ; 54F6   000F
        ADDR    R7,     R5                      ; 54F7   00FD
        RLC     R0,     2                       ; 54F8   0054
        SARC    R0,     1                       ; 54F9   0078
        ADDR    R3,     R7                      ; 54FA   00DF
        SLL     R1,     2                       ; 54FB   004D
        PSHR    R5                              ; 54FC   0275

        JSR     R5,     L_5653                  ; 54FD   0004 0154 0253
        JSR     R5,     L_500B                  ; 5500   0004 0150 000B

        MVII    #$0021, R0                      ; 5503   02B8 0021
        MVO     R0,     G_0184                  ; 5505   0240 0184
        MVII    #$0001, R0                      ; 5507   02B8 0001
        MVO     R0,     G_0185                  ; 5509   0240 0185
        MVII    #$0018, R0                      ; 550B   02B8 0018
        MVO     R0,     G_0194                  ; 550D   0240 0194
        SDBD                                    ; 550F   0001
        MVII    #$3201, R3                      ; 5510   02BB 0001 0032
        MVII    #$0205, R4                      ; 5513   02BC 0205

        JSR     R5,     X_PRINT_R5              ; 5515   0004 0118 007B

        SLL     R1,     1                       ; 5518   0049
        SLL     R1,     2                       ; 5519   004D
L_551A:
        SWAP    R1,     1                       ; 551A   0041
        SWAP    R3,     2                       ; 551B   0047
        SLL     R1,     1                       ; 551C   0049
        SWAP    R3,     1                       ; 551D   0043
        NEGR    R0                              ; 551E   0020
        GSWD    R1                              ; 551F   0031
        RSWD    R1                              ; 5520   0039
        RSWD    R0                              ; 5521   0038
        GSWD    R2                              ; 5522   0032
        DECLE   $0000                           ; 5523   0000

        SDBD                                    ; 5524   0001
        MVII    #$3B79, R0                      ; 5525   02B8 0079 003B
        MVO     R0,     .BTAB.03                ; 5528   0240 0203
        MVII    #$0004, R0                      ; 552A   02B8 0004
        MVO     R0,     G_01B4                  ; 552C   0240 01B4
        MVII    #$00FF, R0                      ; 552E   02B8 00FF
        MVO     R0,     G_0172                  ; 5530   0240 0172
        MVO     R0,     G_016F                  ; 5532   0240 016F
        MVO     R0,     G_0171                  ; 5534   0240 0171
        MVO     R0,     G_0186                  ; 5536   0240 0186

        JSR     R5,     L_5746                  ; 5538   0004 0154 0346

        PULR    R7                              ; 553B   02B7
        PSHR    R5                              ; 553C   0275
        MVI     G_0190, R0                      ; 553D   0280 0190
        CMPI    #$0002, R0                      ; 553F   0378 0002
        BGT     L_5546                          ; 5541   020E 0003
        J       X_RESET                         ; 5543   0004 0310 0000

L_5546:
        MVI     G_01B4, R0                      ; 5546   0280 01B4
        DECR    R0                              ; 5548   0010
        MVO     R0,     G_01B4                  ; 5549   0240 01B4
        BNEQ    L_5577                          ; 554B   020C 002A

        MVII    #$0004, R0                      ; 554D   02B8 0004
        MVO     R0,     G_01B4                  ; 554F   0240 01B4
        MVII    #$0006, R0                      ; 5551   02B8 0006

        JSR     R5,     X_RAND1                 ; 5553   0004 0114 027D

        ADDI    #$0030, R0                      ; 5556   02F8 0030
        MOVR    R0,     R2                      ; 5558   0082
        MVII    #$01A3, R4                      ; 5559   02BC 01A3
L_555B:
        MVI@    R4,     R0                      ; 555B   02A0
        TSTR    R0                              ; 555C   0080
        BEQ     L_555B                          ; 555D   0224 0003

        CMPI    #$01A7, R4                      ; 555F   037C 01A7
L_5561:
        BGE     L_5580                          ; 5561   020D 001D
        B       L_556A                          ; 5563   0200 0005

        DECLE   $0000                           ; 5565   0000

        INCR    R6                              ; 5566   000E
        COMR    R2                              ; 5567   001A
        NEGR    R6                              ; 5568   0026
        GSWD    R2                              ; 5569   0032
L_556A:
        SDBD                                    ; 556A   0001
        MVII    #$4D65, R1                      ; 556B   02B9 0065 004D
        ADDR    R0,     R1                      ; 556E   00C1
        MVI@    R1,     R3                      ; 556F   028B
        MVII    #$0030, R1                      ; 5570   02B9 0030
        MVII    #$0318, R4                      ; 5572   02BC 0318

        JSR     R5,     G_4C59                  ; 5574   0004 014C 0059

L_5577:
        MVII    #$0001, R0                      ; 5577   02B8 0001

        JSR     R5,     X_RAND1                 ; 5579   0004 0114 027D

        MOVR    R0,     R3                      ; 557C   0083

        JSR     R5,     L_5823                  ; 557D   0004 0158 0023

L_5580:
        PULR    R7                              ; 5580   02B7
        PSHR    R5                              ; 5581   0275
        MVII    #$0032, R0                      ; 5582   02B8 0032
        MVO     R0,     G_018F                  ; 5584   0240 018F

        JSR     R5,     G_4FDE                  ; 5586   0004 014C 03DE

        MVII    #$0064, R0                      ; 5589   02B8 0064
        MVO     R0,     G_0172                  ; 558B   0240 0172
        MVII    #$00FF, R0                      ; 558D   02B8 00FF
        MVO     R0,     G_016D                  ; 558F   0240 016D
        MVO     R0,     G_016F                  ; 5591   0240 016F
        MVO     R0,     G_0171                  ; 5593   0240 0171

        JSR     R5,     L_5E89                  ; 5595   0004 015C 0289

        MVII    #$0217, R4                      ; 5598   02BC 0217
        SDBD                                    ; 559A   0001
        MVII    #$3201, R3                      ; 559B   02BB 0001 0032

        JSR     R5,     X_PRINT_R5              ; 559E   0004 0118 007B

        SWAP    R1,     1                       ; 55A1   0041
        RLC     R0,     2                       ; 55A2   0054
        SLL     R0,     2                       ; 55A3   004C
        SWAP    R1,     1                       ; 55A4   0041
        SLL     R2,     2                       ; 55A5   004E
        RLC     R0,     2                       ; 55A6   0054
        SLL     R1,     1                       ; 55A7   0049
        RLC     R3,     1                       ; 55A8   0053
        DECLE   $0000                           ; 55A9   0000

        MVII    #$022B, R4                      ; 55AA   02BC 022B
        SDBD                                    ; 55AC   0001
        MVII    #$3201, R3                      ; 55AD   02BB 0001 0032

        JSR     R5,     X_PRINT_R5              ; 55B0   0004 0118 007B

        SWAP    R0,     2                       ; 55B3   0044
        SWAP    R1,     1                       ; 55B4   0041
        SLLC    R1,     1                       ; 55B5   0059
        NEGR    R0                              ; 55B6   0020
        DECLE   $0000                           ; 55B7   0000

        MVI     G_0184, R0                      ; 55B8   0280 0184
        MOVR    R0,     R1                      ; 55BA   0081
        ANDI    #$0080, R0                      ; 55BB   03B8 0080
        BNEQ    L_55C4                          ; 55BD   020C 0005

        MVI     G_01B3, R0                      ; 55BF   0280 01B3
        INCR    R0                              ; 55C1   0008
        MVO     R0,     G_01B3                  ; 55C2   0240 01B3
L_55C4:
        ANDI    #$0040, R1                      ; 55C4   03B9 0040
        BNEQ    L_55CD                          ; 55C6   020C 0005

        MVI     G_01B4, R0                      ; 55C8   0280 01B4
        INCR    R0                              ; 55CA   0008
        MVO     R0,     G_01B4                  ; 55CB   0240 01B4
L_55CD:
        SDBD                                    ; 55CD   0001
        MVII    #$3201, R3                      ; 55CE   02BB 0001 0032
        MVII    #$0003, R1                      ; 55D1   02B9 0003
        MVII    #$0230, R4                      ; 55D3   02BC 0230

        JSR     R5,     X_PRNUM_RGT             ; 55D5   0004 0118 00C5

        CLRR    R3                              ; 55D8   01DB
        MVO     R3,     G_0186                  ; 55D9   0243 0186

        JSR     R5,     L_5622                  ; 55DB   0004 0154 0222

        PULR    R7                              ; 55DE   02B7
        PSHR    R5                              ; 55DF   0275

        JSR     R5,     L_6011                  ; 55E0   0004 0160 0011

        MVII    #$00FF, R0                      ; 55E3   02B8 00FF
        MVO     R0,     G_0172                  ; 55E5   0240 0172
        CLRR    R0                              ; 55E7   01C0
        MVO     R0,     G_016D                  ; 55E8   0240 016D
        MVO     R0,     G_0197                  ; 55EA   0240 0197
        MVO     R0,     G_019C                  ; 55EC   0240 019C
        MVI     G_0194, R1                      ; 55EE   0281 0194
        ADDI    #$0003, R1                      ; 55F0   02F9 0003
        CMPI    #$0080, R1                      ; 55F2   0379 0080
        BGE     L_55F8                          ; 55F4   020D 0002

        MVO     R1,     G_0194                  ; 55F6   0241 0194
L_55F8:
        MVII    #$0002, R0                      ; 55F8   02B8 0002
        MVO     R0,     G_01A2                  ; 55FA   0240 01A2
        MVI     G_0184, R0                      ; 55FC   0280 0184
        MOVR    R0,     R1                      ; 55FE   0081
        ANDI    #$0002, R0                      ; 55FF   03B8 0002
        BEQ     L_560A                          ; 5601   0204 0007

        ANDI    #$00C0, R1                      ; 5603   03B9 00C0
        BNEQ    L_560A                          ; 5605   020C 0003

        JSR     R5,     G_4EB0                  ; 5607   0004 014C 02B0
L_560A:
        JSR     R5,     G_4F54                  ; 560A   0004 014C 0354
        JSR     R5,     L_5746                  ; 560D   0004 0154 0346

        PULR    R7                              ; 5610   02B7
        PSHR    R5                              ; 5611   0275
        MVI     G_01C1, R0                      ; 5612   0280 01C1
        DECR    R0                              ; 5614   0010
        BMI     L_5638                          ; 5615   020B 0021

        MVO     R0,     G_01C1                  ; 5617   0240 01C1
L_5619:
        CMPI    #$0064, R0                      ; 5619   0378 0064
        BNEQ    L_5621                          ; 561B   020C 0004

        CLRR    R0                              ; 561D   01C0
        MVO     R0,     G_01C1                  ; 561E   0240 01C1
        PULR    R7                              ; 5620   02B7
L_5621:
        TSTR    R0                              ; 5621   0080
L_5622:
        BNEQ    L_56AF                          ; 5622   020C 008B

        JSR     R5,     G_4FDE                  ; 5624   0004 014C 03DE

        MVI     G_01A2, R0                      ; 5627   0280 01A2
        CMPI    #$00FF, R0                      ; 5629   0378 00FF
        BEQ     L_5630                          ; 562B   0204 0003

        JSR     R5,     L_500B                  ; 562D   0004 0150 000B
L_5630:
        JSR     R5,     G_4EB0                  ; 5630   0004 014C 02B0

        MVII    #$0069, R0                      ; 5633   02B8 0069
        MVO     R0,     G_01C1                  ; 5635   0240 01C1
        PULR    R7                              ; 5637   02B7
L_5638:
        MVI     G_0197, R4                      ; 5638   0284 0197
        CMPI    #$0004, R4                      ; 563A   037C 0004
        BGE     L_5656                          ; 563C   020D 0018

        TSTR    R4                              ; 563E   00A4
        BEQ     L_5648                          ; 563F   0204 0007

        ADDI    #$01A2, R4                      ; 5641   02FC 01A2
        MVI@    R4,     R0                      ; 5643   02A0
L_5644:
        CMPI    #$0001, R0                      ; 5644   0378 0001
        BEQ     L_56AF                          ; 5646   0204 0067

L_5648:
        MVI     G_019C, R2                      ; 5648   0282 019C
        SLL     R2,     1                       ; 564A   004A
        SDBD                                    ; 564B   0001
        ADDI    #$5025, R2                      ; 564C   02FA 0025 0050
        MOVR    R2,     R4                      ; 564F   0094

        JSR     R5,     L_5088                  ; 5650   0004 0150 0088

L_5653:
        DECR    R1                              ; 5653   0011
        SDBD                                    ; 5654   0001
        MVI@    R4,     R7                      ; 5655   02A7

L_5656:
        JSR     R5,     L_54F4                  ; 5656   0004 0154 00F4

        TSTR    R3                              ; 5659   009B
        BNEQ    L_56AF                          ; 565A   020C 0053

        MVI     G_0184, R0                      ; 565C   0280 0184
        ANDI    #$0020, R0                      ; 565E   03B8 0020
        BNEQ    L_5682                          ; 5660   020C 0020

        MVI     G_01A2, R0                      ; 5662   0280 01A2
        CMPI    #$00FF, R0                      ; 5664   0378 00FF
        BNEQ    L_5682                          ; 5666   020C 001A

L_5668:
        MVI     G_019C, R0                      ; 5668   0280 019C
        CMPI    #$0002, R0                      ; 566A   0378 0002
        BNEQ    L_5682                          ; 566C   020C 0014

        MVI     G_0184, R0                      ; 566E   0280 0184
        MOVR    R0,     R1                      ; 5670   0081
        ANDI    #$0002, R1                      ; 5671   03B9 0002
L_5673:
        BEQ     L_567E                          ; 5673   0204 0009

        MOVR    R0,     R1                      ; 5675   0081
        ANDI    #$0004, R1                      ; 5676   03B9 0004
        BNEQ    L_567E                          ; 5678   020C 0004

        ANDI    #$0040, R0                      ; 567A   03B8 0040
        BEQ     L_5682                          ; 567C   0204 0004

L_567E:
        JSR     R5,     G_4D81                  ; 567E   0004 014C 0181

        PULR    R7                              ; 5681   02B7
L_5682:
        CLRR    R0                              ; 5682   01C0
        MVO     R0,     G_0197                  ; 5683   0240 0197
        MVI     G_019C, R0                      ; 5685   0280 019C
        INCR    R0                              ; 5687   0008
        MVO     R0,     G_019C                  ; 5688   0240 019C
        CMPI    #$0003, R0                      ; 568A   0378 0003
        BNEQ    L_56AF                          ; 568C   020C 0021

        CLRR    R0                              ; 568E   01C0
        MVO     R0,     G_019C                  ; 568F   0240 019C
        MVI     G_0184, R0                      ; 5691   0280 0184
        MOVR    R0,     R1                      ; 5693   0081
        ANDI    #$0002, R1                      ; 5694   03B9 0002
        BEQ     L_56AC                          ; 5696   0204 0014

        ANDI    #$00C0, R0                      ; 5698   03B8 00C0
        BNEQ    L_56AC                          ; 569A   020C 0010

        JSR     R5,     G_4EB0                  ; 569C   0004 014C 02B0

        MVI     G_0184, R0                      ; 569F   0280 0184
        ANDI    #$0004, R0                      ; 56A1   03B8 0004
        BEQ     L_56AC                          ; 56A3   0204 0007

        JSR     R5,     L_5561                  ; 56A5   0004 0154 0161

        PULR    R7                              ; 56A8   02B7

        JSR     R5,     G_4EB0                  ; 56A9   0004 014C 02B0
L_56AC:
        JSR     R5,     G_4F54                  ; 56AC   0004 014C 0354

L_56AF:
        PULR    R7                              ; 56AF   02B7
        PSHR    R5                              ; 56B0   0275
        MVII    #$0069, R0                      ; 56B1   02B8 0069
        MVO     R0,     G_01C1                  ; 56B3   0240 01C1

        JSR     R5,     L_5E8F                  ; 56B5   0004 015C 028F
        JSR     R5,     L_5746                  ; 56B8   0004 0154 0346

        MVI     G_0184, R0                      ; 56BB   0280 0184
        MOVR    R0,     R1                      ; 56BD   0081
        ANDI    #$0004, R0                      ; 56BE   03B8 0004
        BNEQ    L_56F5                          ; 56C0   020C 0033

        ADDI    #$0004, R1                      ; 56C2   02F9 0004
        MVO     R1,     G_0184                  ; 56C4   0241 0184
        MVI     G_0199, R0                      ; 56C6   0280 0199
        MVO     R0,     G_019B                  ; 56C8   0240 019B
        MVI     G_0198, R0                      ; 56CA   0280 0198
        MVO     R0,     G_018E                  ; 56CC   0240 018E
        MVI     G_019A, R0                      ; 56CE   0280 019A
        MVO     R0,     G_0199                  ; 56D0   0240 0199
        MVI     G_018D, R0                      ; 56D2   0280 018D
        MVO     R0,     G_0198                  ; 56D4   0240 0198
        MVI     G_0190, R0                      ; 56D6   0280 0190
        MVO     R0,     G_0191                  ; 56D8   0240 0191
        MVI     G_0192, R0                      ; 56DA   0280 0192
        MVO     R0,     G_0190                  ; 56DC   0240 0190
        MVI     G_019E, R0                      ; 56DE   0280 019E
        SLL     R0,     2                       ; 56E0   004C
        SLL     R0,     2                       ; 56E1   004C
        ADD     G_019F, R0                      ; 56E2   02C0 019F
        MVO     R0,     G_01A0                  ; 56E4   0240 01A0
        MVI     G_01A1, R0                      ; 56E6   0280 01A1
        MOVR    R0,     R1                      ; 56E8   0081
        SLR     R1,     2                       ; 56E9   0065
        SLR     R1,     2                       ; 56EA   0065
        ANDI    #$000F, R0                      ; 56EB   03B8 000F
        ANDI    #$000F, R1                      ; 56ED   03B9 000F
        MVO     R0,     G_019F                  ; 56EF   0240 019F
        MVO     R1,     G_019E                  ; 56F1   0241 019E
        B       L_5726                          ; 56F3   0200 0031

L_56F5:
        ANDI    #$00FB, R1                      ; 56F5   03B9 00FB
        MVO     R1,     G_0184                  ; 56F7   0241 0184
        MVI     G_0199, R0                      ; 56F9   0280 0199
        MVO     R0,     G_019A                  ; 56FB   0240 019A
        MVI     G_0198, R0                      ; 56FD   0280 0198
        MVO     R0,     G_018D                  ; 56FF   0240 018D
        MVI     G_019B, R0                      ; 5701   0280 019B
        MVO     R0,     G_0199                  ; 5703   0240 0199
        MVI     G_018E, R0                      ; 5705   0280 018E
        MVO     R0,     G_0198                  ; 5707   0240 0198
        MVI     G_0190, R0                      ; 5709   0280 0190
        MVO     R0,     G_0192                  ; 570B   0240 0192
        MVI     G_0191, R0                      ; 570D   0280 0191
        MVO     R0,     G_0190                  ; 570F   0240 0190
        MVI     G_019E, R0                      ; 5711   0280 019E
        SLL     R0,     2                       ; 5713   004C
        SLL     R0,     2                       ; 5714   004C
        ADD     G_019F, R0                      ; 5715   02C0 019F
        MVO     R0,     G_01A1                  ; 5717   0240 01A1
        MVI     G_01A0, R0                      ; 5719   0280 01A0
        MOVR    R0,     R1                      ; 571B   0081
        SLR     R1,     2                       ; 571C   0065
        SLR     R1,     2                       ; 571D   0065
        ANDI    #$000F, R0                      ; 571E   03B8 000F
        ANDI    #$000F, R1                      ; 5720   03B9 000F
        MVO     R0,     G_019F                  ; 5722   0240 019F
        MVO     R1,     G_019E                  ; 5724   0241 019E

L_5726:
        JSR     R5,     L_5673                  ; 5726   0004 0154 0273

        MVI     G_01A2, R0                      ; 5729   0280 01A2
        CMPI    #$00FF, R0                      ; 572B   0378 00FF
        BEQ     L_5732                          ; 572D   0204 0003

L_572F:
        JSR     R5,     G_4FC8                  ; 572F   0004 014C 03C8

L_5732:
        MVI     G_01A2, R0                      ; 5732   0280 01A2
        CMPI    #$0002, R0                      ; 5734   0378 0002
        BNEQ    L_573D                          ; 5736   020C 0005

        JSR     R5,     L_5561                  ; 5738   0004 0154 0161

        B       L_5753                          ; 573B   0200 0016

L_573D:
        MVI     G_0198, R0                      ; 573D   0280 0198
        TSTR    R0                              ; 573F   0080
        BEQ     L_574D                          ; 5740   0204 000B

        JSR     R5,     L_573D                  ; 5742   0004 0154 033D

        CLRR    R0                              ; 5745   01C0
L_5746:
        MVO     R0,     G_0199                  ; 5746   0240 0199

        JSR     R5,     L_5552                  ; 5748   0004 0154 0152

        B       L_5753                          ; 574B   0200 0006

L_574D:
        JSR     R5,     L_572F                  ; 574D   0004 0154 032F

        CLRR    R0                              ; 5750   01C0
        MVO     R0,     G_0171                  ; 5751   0240 0171
L_5753:
        PULR    R7                              ; 5753   02B7
        PSHR    R5                              ; 5754   0275
        MVI     G_01A2, R0                      ; 5755   0280 01A2
        TSTR    R0                              ; 5757   0080
        BEQ     L_5782                          ; 5758   0204 0028

        CMPI    #$0002, R0                      ; 575A   0378 0002
        BEQ     L_576C                          ; 575C   0204 000E

        MVII    #$0000, R0                      ; 575E   02B8 0000
        MVO     R0,     G_018F                  ; 5760   0240 018F

        JSR     R5,     G_4FDE                  ; 5762   0004 014C 03DE

        CLRR    R0                              ; 5765   01C0
        MVO     R0,     G_016F                  ; 5766   0240 016F
        MVII    #$00FF, R0                      ; 5768   02B8 00FF
        B       L_57AF                          ; 576A   0200 0043

L_576C:
        MVII    #$0032, R0                      ; 576C   02B8 0032
        MVO     R0,     G_018F                  ; 576E   0240 018F

        JSR     R5,     G_4FDE                  ; 5770   0004 014C 03DE
        JSR     R5,     L_500B                  ; 5773   0004 0150 000B

        MVI     G_018C, R1                      ; 5776   0281 018C
        ADDI    #$000A, R1                      ; 5778   02F9 000A
        MVO     R1,     G_018C                  ; 577A   0241 018C

        JSR     R5,     L_5561                  ; 577C   0004 0154 0161

        CLRR    R0                              ; 577F   01C0
        B       L_57AF                          ; 5780   0200 002D

L_5782:
        MVII    #$0010, R0                      ; 5782   02B8 0010
        MVO     R0,     G_018F                  ; 5784   0240 018F

        JSR     R5,     G_4FDE                  ; 5786   0004 014C 03DE
        JSR     R5,     L_500B                  ; 5789   0004 0150 000B

        MVI     G_0184, R0                      ; 578C   0280 0184
        ANDI    #$0020, R0                      ; 578E   03B8 0020
        BEQ     L_57AD                          ; 5790   0204 001B

        SDBD                                    ; 5792   0001
        MVII    #$1001, R3                      ; 5793   02BB 0001 0010
        MVII    #$0205, R4                      ; 5796   02BC 0205

        JSR     R5,     X_PRINT_R5              ; 5798   0004 0118 007B

        SLL     R1,     1                       ; 579B   0049
        SLL     R1,     2                       ; 579C   004D
L_579D:
        SWAP    R1,     1                       ; 579D   0041
        SWAP    R3,     2                       ; 579E   0047
        SLL     R1,     1                       ; 579F   0049
        SWAP    R3,     1                       ; 57A0   0043
        NEGR    R0                              ; 57A1   0020
        GSWD    R1                              ; 57A2   0031
        RSWD    R1                              ; 57A3   0039
        RSWD    R0                              ; 57A4   0038
        GSWD    R2                              ; 57A5   0032
        DECLE   $0000                           ; 57A6   0000

        SDBD                                    ; 57A7   0001
        MVII    #$1979, R0                      ; 57A8   02B8 0079 0019
        MVO     R0,     .BTAB.03                ; 57AB   0240 0203
L_57AD:
        MVII    #$0001, R0                      ; 57AD   02B8 0001
L_57AF:
        MVO     R0,     G_01A2                  ; 57AF   0240 01A2
        MVII    #$0069, R0                      ; 57B1   02B8 0069
        MVO     R0,     G_01C1                  ; 57B3   0240 01C1

        JSR     R5,     L_5E8F                  ; 57B5   0004 015C 028F

        MVI     G_01A2, R0                      ; 57B8   0280 01A2
        CMPI    #$00FF, R0                      ; 57BA   0378 00FF
        BEQ     L_57C7                          ; 57BC   0204 0009

        MVII    #$0184, R0                      ; 57BE   02B8 0184
        ANDI    #$0020, R0                      ; 57C0   03B8 0020
        BNEQ    L_57C7                          ; 57C2   020C 0003

        JSR     R5,     G_4FC8                  ; 57C4   0004 014C 03C8

L_57C7:
        PULR    R7                              ; 57C7   02B7
        PSHR    R5                              ; 57C8   0275
        MVII    #$0188, R2                      ; 57C9   02BA 0188
        MVII    #$0202, R4                      ; 57CB   02BC 0202

        JSR     R5,     L_5CAF                  ; 57CD   0004 015C 00AF

        MVI     G_0184, R0                      ; 57D0   0280 0184
L_57D2:
        ANDI    #$0002, R0                      ; 57D2   03B8 0002
        BEQ     L_57DD                          ; 57D4   0204 0007

        MVII    #$018B, R2                      ; 57D6   02BA 018B
        MVII    #$020D, R4                      ; 57D8   02BC 020D

        JSR     R5,     L_5CAF                  ; 57DA   0004 015C 00AF

L_57DD:
        PULR    R7                              ; 57DD   02B7
        PSHR    R5                              ; 57DE   0275
L_57DF:
        MVII    #$0200, R4                      ; 57DF   02BC 0200
        MVII    #$00A0, R0                      ; 57E1   02B8 00A0
L_57E3:
        MVI     G_018F, R1                      ; 57E3   0281 018F
        SWAP    R1,     1                       ; 57E5   0041

        JSR     R5,     X_FILL_MEM              ; 57E6   0004 0114 0341

        SDBD                                    ; 57E9   0001
        MVII    #$080A, R0                      ; 57EA   02B8 000A 0008
        MVI     G_018F, R1                      ; 57ED   0281 018F
        SWAP    R1,     1                       ; 57EF   0041
        ADDR    R1,     R0                      ; 57F0   00C8
        MVO     R0,     .BTAB.8C                ; 57F1   0240 028C
        MVO     R0,     .BTAB.9F                ; 57F3   0240 029F
        SDBD                                    ; 57F5   0001
        MVII    #$0806, R0                      ; 57F6   02B8 0006 0008
        ADDR    R1,     R0                      ; 57F9   00C8
        MVO     R0,     .BTAB.94                ; 57FA   0240 0294
        SDBD                                    ; 57FC   0001
        MVII    #$0836, R0                      ; 57FD   02B8 0036 0008
        ADDR    R1,     R0                      ; 5800   00C8
        MVO     R0,     .BTAB.93                ; 5801   0240 0293
        SDBD                                    ; 5803   0001
        MVII    #$083E, R0                      ; 5804   02B8 003E 0008
        ADDR    R1,     R0                      ; 5807   00C8
        MVO     R0,     .BTAB.95                ; 5808   0240 0295
        PULR    R7                              ; 580A   02B7
        PSHR    R5                              ; 580B   0275
        MVI     G_018F, R0                      ; 580C   0280 018F
        SWAP    R0,     1                       ; 580E   0040
        MOVR    R0,     R1                      ; 580F   0081
        SDBD                                    ; 5810   0001
        ADDI    #$08B7, R0                      ; 5811   02F8 00B7 0008
        SDBD                                    ; 5814   0001
        ADDI    #$08DF, R1                      ; 5815   02F9 00DF 0008
        MVO     R0,     .BTAB.1A                ; 5818   0240 021A
        MVO     R1,     .BTAB.1B                ; 581A   0241 021B
        MVO     R0,     .BTAB.5F                ; 581C   0240 025F
        MVO     R1,     .BTAB.60                ; 581E   0241 0260
        MVO     R0,     .BTAB.69                ; 5820   0240 0269
        MVO     R1,     .BTAB.6A                ; 5822   0241 026A
        PULR    R7                              ; 5824   02B7
        ADCR    R3                              ; 5825   002B
        RLC     R0,     1                       ; 5826   0050
        SWAP    R3,     2                       ; 5827   0047
        RLC     R0,     1                       ; 5828   0050
        SLLC    R1,     1                       ; 5829   0059
        RLC     R0,     1                       ; 582A   0050
        CMPI    #$0008, R1                      ; 582B   0379 0008
        BLE     L_5836                          ; 582D   0206 0007

        MVII    #$0003, R0                      ; 582F   02B8 0003

        JSR     R5,     X_RAND2                 ; 5831   0004 0114 029E

        B       L_583B                          ; 5834   0200 0005

L_5836:
        MVII    #$0003, R2                      ; 5836   02BA 0003

        JSR     R5,     X_DIV                   ; 5838   0004 011C 01FB

L_583B:
        SLL     R1,     1                       ; 583B   0049
        SDBD                                    ; 583C   0001
        ADDI    #$5093, R1                      ; 583D   02F9 0093 0050
L_5840:
        MOVR    R1,     R5                      ; 5840   008D
        SDBD                                    ; 5841   0001
        MVI@    R5,     R4                      ; 5842   02AC

        JSR     R5,     L_50A9                  ; 5843   0004 0150 00A9

        PULR    R7                              ; 5846   02B7
        CMPI    #$000A, R1                      ; 5847   0379 000A
        BLT     L_5851                          ; 5849   0205 0006

        MVII    #$000A, R0                      ; 584B   02B8 000A

        JSR     R5,     X_RAND2                 ; 584D   0004 0114 029E

        MOVR    R0,     R1                      ; 5850   0081
L_5851:
        ANDI    #$0006, R1                      ; 5851   03B9 0006
        SDBD                                    ; 5853   0001
        ADDI    #$5099, R1                      ; 5854   02F9 0099 0050
        B       L_5840                          ; 5857   0220 0018

        CMPI    #$000A, R1                      ; 5859   0379 000A
        BLE     L_5863                          ; 585B   0206 0006

        MVII    #$0009, R0                      ; 585D   02B8 0009

        JSR     R5,     X_RAND2                 ; 585F   0004 0114 029E

        MOVR    R0,     R1                      ; 5862   0081
L_5863:
        MVII    #$0003, R2                      ; 5863   02BA 0003

        JSR     R5,     X_DIV                   ; 5865   0004 011C 01FB

        SLL     R0,     1                       ; 5868   0048
        MOVR    R0,     R5                      ; 5869   0085
        SDBD                                    ; 586A   0001
        ADDI    #$50A1, R5                      ; 586B   02FD 00A1 0050
        SDBD                                    ; 586E   0001
        MVI@    R5,     R4                      ; 586F   02AC

        JSR     R5,     L_50A9                  ; 5870   0004 0150 00A9

        ADDI    #$0180, R2                      ; 5873   02FA 0180
        MVI@    R2,     R0                      ; 5875   0290
        SUBI    #$0178, R2                      ; 5876   033A 0178
        MVII    #$0003, R1                      ; 5878   02B9 0003
        SDBD                                    ; 587A   0001
        ANDI    #$0400, R0                      ; 587B   03B8 0000 0004
        BNEQ    L_5881                          ; 587E   020C 0001

        NEGR    R1                              ; 5880   0021
L_5881:
        MVO@    R1,     R2                      ; 5881   0251
        ADDI    #$0004, R2                      ; 5882   02FA 0004
        MVII    #$0006, R0                      ; 5884   02B8 0006
        MVO@    R0,     R2                      ; 5886   0250
        PULR    R7                              ; 5887   02B7
        MVI     G_0184, R1                      ; 5888   0281 0184
        ANDI    #$0004, R1                      ; 588A   03B9 0004
        MVI     G_01B3, R1                      ; 588C   0281 01B3
        BEQ     L_5892                          ; 588E   0204 0002

        MVI     G_01B4, R1                      ; 5890   0281 01B4
L_5892:
        MOVR    R5,     R7                      ; 5892   00AF
        MOVR    R2,     R1                      ; 5893   0091
        SLR     R1,     1                       ; 5894   0061
        ADDR    R2,     R7                      ; 5895   00D7
        SLR     R1,     1                       ; 5896   0061
        MOVR    R7,     R3                      ; 5897   00BB
        SLR     R1,     1                       ; 5898   0061
        MOVR    R3,     R7                      ; 5899   009F
        SLR     R1,     1                       ; 589A   0061
        ADDR    R1,     R1                      ; 589B   00C9
        SLR     R1,     1                       ; 589C   0061
        ADDR    R5,     R5                      ; 589D   00ED
        SLR     R1,     1                       ; 589E   0061
        MOVR    R7,     R3                      ; 589F   00BB
        SLR     R1,     1                       ; 58A0   0061
        TSTR    R5                              ; 58A1   00AD
        SLR     R1,     1                       ; 58A2   0061
        ADDR    R7,     R3                      ; 58A3   00FB
        SLR     R1,     1                       ; 58A4   0061
        INCR    R1                              ; 58A5   0009
        SLR     R2,     1                       ; 58A6   0062
        ADDR    R5,     R5                      ; 58A7   00ED
        SLR     R1,     1                       ; 58A8   0061
        PSHR    R5                              ; 58A9   0275
        MVI     G_0197, R3                      ; 58AA   0283 0197
        MOVR    R3,     R2                      ; 58AC   009A
        ADDI    #$031B, R3                      ; 58AD   02FB 031B
        ADDI    #$01A3, R2                      ; 58AF   02FA 01A3
        MVII    #$0001, R0                      ; 58B1   02B8 0001
        MVO@    R0,     R2                      ; 58B3   0250
        PSHR    R2                              ; 58B4   0272
        PSHR    R3                              ; 58B5   0273

        JSR     R5,     G_4BC3                  ; 58B6   0004 0148 03C3

        MVII    #$0001, R0                      ; 58B9   02B8 0001

        JSR     R5,     X_RAND1                 ; 58BB   0004 0114 027D

        PULR    R3                              ; 58BE   02B3
        MVI     G_0194, R1                      ; 58BF   0281 0194
        TSTR    R0                              ; 58C1   0080
        BNEQ    L_58C5                          ; 58C2   020C 0001

        NEGR    R1                              ; 58C4   0021
L_58C5:
        MOVR    R3,     R2                      ; 58C5   009A
        SUBI    #$0318, R2                      ; 58C6   033A 0318
        SLL     R2,     1                       ; 58C8   004A
        ADDI    #$0126, R2                      ; 58C9   02FA 0126
        MVO@    R1,     R2                      ; 58CB   0251
        TSTR    R0                              ; 58CC   0080
        BEQ     L_58D9                          ; 58CD   0204 000A

        ADDI    #$0008, R3                      ; 58CF   02FB 0008
        MVI@    R3,     R0                      ; 58D1   0298
        SDBD                                    ; 58D2   0001
        ADDI    #$0400, R0                      ; 58D3   02F8 0000 0004
        MVO@    R0,     R3                      ; 58D6   0258
        SUBI    #$0008, R3                      ; 58D7   033B 0008
L_58D9:
        MVI     G_0197, R0                      ; 58D9   0280 0197
        INCR    R0                              ; 58DB   0008
        MVO     R0,     G_0197                  ; 58DC   0240 0197
        MVI     G_01A2, R0                      ; 58DE   0280 01A2
        CMPI    #$00FF, R0                      ; 58E0   0378 00FF
        BNEQ    L_58EC                          ; 58E2   020C 0008

        ADDI    #$0010, R3                      ; 58E4   02FB 0010
        MVI@    R3,     R0                      ; 58E6   0298
        SDBD                                    ; 58E7   0001
        ANDI    #$2FF8, R0                      ; 58E8   03B8 00F8 002F
        MVO@    R0,     R3                      ; 58EB   0258
L_58EC:
        MVI     G_01BF, R2                      ; 58EC   0282 01BF
        TSTR    R2                              ; 58EE   0092
        BNEQ    L_58F6                          ; 58EF   020C 0005

        JSR     R5,     G_4B9E                  ; 58F1   0004 0148 039E

        ADDR    R3,     R7                      ; 58F4   00DF
        SLLC    R1,     2                       ; 58F5   005D
L_58F6:
        PULR    R2                              ; 58F6   02B2
        PULR    R7                              ; 58F7   02B7
        PSHR    R5                              ; 58F8   0275
        MVI     G_0337, R0                      ; 58F9   0280 0337
        TSTR    R0                              ; 58FB   0080
        BEQ     L_5906                          ; 58FC   0204 0008

        MVI     G_032F, R0                      ; 58FE   0280 032F
        SDBD                                    ; 5900   0001
        XORI    #$1004, R0                      ; 5901   03F8 0004 0010
        MVO     R0,     G_032F                  ; 5904   0240 032F
L_5906:
        MVII    #$0005, R0                      ; 5906   02B8 0005

        JSR     R5,     X_RAND1                 ; 5908   0004 0114 027D

        ANDI    #$001B, R0                      ; 590B   03B8 001B
        SWAP    R0,     1                       ; 590D   0040
        SLL     R0,     1                       ; 590E   0048
        MVI     G_019E, R2                      ; 590F   0282 019E
        CMPI    #$0008, R2                      ; 5911   037A 0008
        BGE     L_5929                          ; 5913   020D 0014

        MVI     G_019F, R2                      ; 5915   0282 019F
        CMPI    #$0004, R2                      ; 5917   037A 0004
        BGE     L_5929                          ; 5919   020D 000E

        MVII    #$02BF, R4                      ; 591B   02BC 02BF
        MOVR    R4,     R5                      ; 591D   00A5
L_591E:
        MVI@    R4,     R1                      ; 591E   02A1
        SDBD                                    ; 591F   0001
        ANDI    #$09FF, R1                      ; 5920   03B9 00FF 0009
        ADDR    R0,     R1                      ; 5923   00C1
        MVO@    R1,     R5                      ; 5924   0269
        CMPI    #$02C3, R5                      ; 5925   037D 02C3
        BNEQ    L_591E                          ; 5927   022C 000A

L_5929:
        MVII    #$02B7, R4                      ; 5929   02BC 02B7
        MOVR    R4,     R5                      ; 592B   00A5
        MVI     G_019E, R2                      ; 592C   0282 019E
        CMPI    #$0002, R2                      ; 592E   037A 0002
        BGE     L_5943                          ; 5930   020D 0011

        MVI     G_019F, R2                      ; 5932   0282 019F
        CMPI    #$000C, R2                      ; 5934   037A 000C
        BGE     L_5943                          ; 5936   020D 000B

L_5938:
        MVI@    R4,     R1                      ; 5938   02A1
        SDBD                                    ; 5939   0001
        ANDI    #$09FF, R1                      ; 593A   03B9 00FF 0009
        ADDR    R0,     R1                      ; 593D   00C1
        MVO@    R1,     R5                      ; 593E   0269
        CMPI    #$02B9, R5                      ; 593F   037D 02B9
        BNEQ    L_5938                          ; 5941   022C 000A

L_5943:
        MVI     G_0330, R0                      ; 5943   0280 0330
        SDBD                                    ; 5945   0001
        CMPI    #$62E7, R0                      ; 5946   0378 00E7 0062
        BNEQ    L_596A                          ; 5949   020C 001F

        MVI     G_01C0, R0                      ; 594B   0280 01C0
        TSTR    R0                              ; 594D   0080
        BNEQ    L_596A                          ; 594E   020C 001A

        CLRR    R2                              ; 5950   01D2

        JSR     R5,     L_6131                  ; 5951   0004 0160 0131

        SWAP    R1,     1                       ; 5954   0041
        SLL     R2,     2                       ; 5955   004E
        RSWD    R6                              ; 5956   003E
        SWAP    R3,     1                       ; 5957   0043
        TSTR    R0                              ; 5958   0080
        BNEQ    L_596A                          ; 5959   020C 000F

        MVII    #$0020, R1                      ; 595B   02B9 0020
        MVII    #$0048, R2                      ; 595D   02BA 0048
        MVII    #$0043, R3                      ; 595F   02BB 0043
        MVII    #$0318, R4                      ; 5961   02BC 0318

        JSR     R5,     G_4C59                  ; 5963   0004 014C 0059

        MVII    #$0001, R0                      ; 5966   02B8 0001
        MVO     R0,     G_01C0                  ; 5968   0240 01C0
L_596A:
        PULR    R7                              ; 596A   02B7
        PSHR    R5                              ; 596B   0275
        MVI     G_0184, R0                      ; 596C   0280 0184
        ANDI    #$0001, R0                      ; 596E   03B8 0001
        BEQ     L_59E3                          ; 5970   0204 0071

        MVI     G_0184, R0                      ; 5972   0280 0184
        MOVR    R0,     R1                      ; 5974   0081
        ANDI    #$0004, R1                      ; 5975   03B9 0004
        BEQ     L_597F                          ; 5977   0204 0006

        ANDI    #$0040, R0                      ; 5979   03B8 0040
        BNEQ    L_59E3                          ; 597B   020C 0066
        B       L_5983                          ; 597D   0200 0004

L_597F:
        ANDI    #$0080, R0                      ; 597F   03B8 0080
        BNEQ    L_59E3                          ; 5981   020C 0060

L_5983:
        MVI     G_0337, R0                      ; 5983   0280 0337
        TSTR    R0                              ; 5985   0080
L_5986:
        BNEQ    L_59E3                          ; 5986   020C 005B

        PSHR    R2                              ; 5988   0272

        JSR     R5,     G_4B9A                  ; 5989   0004 0148 039A

        COMR    R1                              ; 598C   0019
        SLLC    R2,     2                       ; 598D   005E
        MVII    #$031F, R3                      ; 598E   02BB 031F
        SDBD                                    ; 5990   0001
        MVII    #$626B, R4                      ; 5991   02BC 006B 0062

        JSR     R5,     G_4BC3                  ; 5994   0004 0148 03C3

        PULR    R2                              ; 5997   02B2
        MVI@    R2,     R0                      ; 5998   0290
        ANDI    #$00FF, R0                      ; 5999   03B8 00FF
        ADD     G_031F, R0                      ; 599B   02C0 031F
        ADDI    #$0002, R0                      ; 599D   02F8 0002
        MVO     R0,     G_031F                  ; 599F   0240 031F
        ADDI    #$0028, R2                      ; 59A1   02FA 0028
        CLRR    R0                              ; 59A3   01C0
        MVO@    R0,     R2                      ; 59A4   0250
        SUBI    #$0340, R2                      ; 59A5   033A 0340
        MOVR    R2,     R0                      ; 59A7   0090
        PSHR    R2                              ; 59A8   0272

        JSR     R5,     X_POW2                  ; 59A9   0004 0114 0345

        COMR    R0                              ; 59AC   0018
        AND     G_010D, R0                      ; 59AD   0380 010D
        MVO     R0,     G_010D                  ; 59AF   0240 010D
        PULR    R2                              ; 59B1   02B2
        ADDI    #$0320, R2                      ; 59B2   02FA 0320
        MVI@    R2,     R0                      ; 59B4   0290
        SDBD                                    ; 59B5   0001
        ANDI    #$0400, R0                      ; 59B6   03B8 0000 0004
        MVI     G_0194, R1                      ; 59B9   0281 0194
        MVI     G_019E, R3                      ; 59BB   0283 019E
        SDBD                                    ; 59BD   0001
        ADDI    #$549A, R3                      ; 59BE   02FB 009A 0054
        TSTR    R0                              ; 59C1   0080
        BNEQ    L_59CB                          ; 59C2   020C 0007

        MVI     G_019F, R3                      ; 59C4   0283 019F
        SDBD                                    ; 59C6   0001
        ADDI    #$54C7, R3                      ; 59C7   02FB 00C7 0054
        NEGR    R1                              ; 59CA   0021
L_59CB:
        MVO     R1,     G_0134                  ; 59CB   0241 0134
        PSHR    R3                              ; 59CD   0273
        SUBI    #$0320, R2                      ; 59CE   033A 0320
        SLL     R2,     1                       ; 59D0   004A
        ADDI    #$0126, R2                      ; 59D1   02FA 0126
        MOVR    R2,     R3                      ; 59D3   0093
        CLRR    R2                              ; 59D4   01D2

        JSR     R5,     G_4C41                  ; 59D5   0004 014C 0041

        MVI     G_0194, R1                      ; 59D8   0281 0194
        MVII    #$031F, R4                      ; 59DA   02BC 031F
        MVII    #$0035, R3                      ; 59DC   02BB 0035
        PULR    R2                              ; 59DE   02B2
        MVI@    R2,     R2                      ; 59DF   0292

        JSR     R5,     G_4C59                  ; 59E0   0004 014C 0059

L_59E3:
        PULR    R7                              ; 59E3   02B7
        PSHR    R5                              ; 59E4   0275
        MOVR    R2,     R3                      ; 59E5   0093
        SDBD                                    ; 59E6   0001
        MVII    #$625D, R4                      ; 59E7   02BC 005D 0062

        JSR     R5,     L_60E9                  ; 59EA   0004 0160 00E9

        PULR    R7                              ; 59ED   02B7
        PSHR    R5                              ; 59EE   0275
        MOVR    R2,     R1                      ; 59EF   0091
        ADDI    #$0320, R2                      ; 59F0   02FA 0320
        MVI@    R2,     R0                      ; 59F2   0290
        ANDI    #$007F, R0                      ; 59F3   03B8 007F
        CMPI    #$0008, R0                      ; 59F5   0378 0008
        BGT     L_5A01                          ; 59F7   020E 0008

        MVI@    R2,     R0                      ; 59F9   0290
        ADDI    #$0003, R0                      ; 59FA   02F8 0003
        MVO@    R0,     R2                      ; 59FC   0250
        MOVR    R1,     R3                      ; 59FD   008B

        JSR     R5,     L_5D61                  ; 59FE   0004 015C 0161

L_5A01:
        MOVR    R1,     R2                      ; 5A01   008A
        ADDI    #$0350, R1                      ; 5A02   02F9 0350
        MVI@    R1,     R0                      ; 5A04   0288
        ANDI    #$0006, R0                      ; 5A05   03B8 0006
        BNEQ    L_5A72                          ; 5A07   020C 0069

        MVO@    R0,     R1                      ; 5A09   0248
        TSTR    R3                              ; 5A0A   009B
        ADDI    #$0318, R2                      ; 5A0B   02FA 0318
        MOVR    R2,     R4                      ; 5A0D   0094
        MVI@    R2,     R0                      ; 5A0E   0290
        MOVR    R0,     R3                      ; 5A0F   0083
        ANDI    #$00FF, R0                      ; 5A10   03B8 00FF
        SDBD                                    ; 5A12   0001
        ANDI    #$FF00, R3                      ; 5A13   03BB 0000 00FF
        ADDI    #$0008, R2                      ; 5A16   02FA 0008
        MVI@    R2,     R1                      ; 5A18   0291
        SDBD                                    ; 5A19   0001
        ANDI    #$0400, R1                      ; 5A1A   03B9 0000 0004
        CMPI    #$0050, R0                      ; 5A1D   0378 0050
        BLT     L_5A2B                          ; 5A1F   0205 000A

        CMPI    #$00DC, R0                      ; 5A21   0378 00DC
        BGT     L_5A2B                          ; 5A23   020E 0006

        TSTR    R1                              ; 5A25   0089
        BEQ     L_5A72                          ; 5A26   0204 004A

        CLRR    R0                              ; 5A28   01C0
        B       L_5A30                          ; 5A29   0200 0005

L_5A2B:
        TSTR    R1                              ; 5A2B   0089
        BNEQ    L_5A72                          ; 5A2C   020C 0044

        MVII    #$00A0, R0                      ; 5A2E   02B8 00A0
L_5A30:
        ADDR    R3,     R0                      ; 5A30   00D8
        MOVR    R4,     R1                      ; 5A31   00A1
        MOVR    R2,     R3                      ; 5A32   0093
        SUBI    #$0180, R3                      ; 5A33   033B 0180
        MVI@    R3,     R4                      ; 5A35   029C
        TSTR    R4                              ; 5A36   00A4
        BEQ     L_5A72                          ; 5A37   0204 0039

        CLRR    R5                              ; 5A39   01ED
        ADDI    #$01B0, R3                      ; 5A3A   02FB 01B0
        MVO@    R5,     R3                      ; 5A3C   025D
        SUBI    #$01B0, R3                      ; 5A3D   033B 01B0
        MVO@    R0,     R1                      ; 5A3F   0248
        INCR    R4                              ; 5A40   000C
        CMPI    #$0005, R4                      ; 5A41   037C 0005
        BEQ     L_5A66                          ; 5A43   0204 0021

        MVO@    R4,     R3                      ; 5A45   025C
        MVII    #$001A, R3                      ; 5A46   02BB 001A
        CMPI    #$0002, R4                      ; 5A48   037C 0002
        BEQ     L_5A54                          ; 5A4A   0204 0008

        MVII    #$0026, R3                      ; 5A4C   02BB 0026
        CMPI    #$0003, R4                      ; 5A4E   037C 0003
        BEQ     L_5A54                          ; 5A50   0204 0002

        MVII    #$0032, R3                      ; 5A52   02BB 0032
L_5A54:
        MVI@    R2,     R5                      ; 5A54   0295
        SDBD                                    ; 5A55   0001
        ANDI    #$FF80, R5                      ; 5A56   03BD 0080 00FF
        ADDR    R3,     R5                      ; 5A59   00DD
        MVO@    R5,     R2                      ; 5A5A   0255
        CMPI    #$0004, R4                      ; 5A5B   037C 0004
        BNEQ    L_5A72                          ; 5A5D   020C 0013

        SUBI    #$0008, R2                      ; 5A5F   033A 0008

        JSR     R5,     L_516B                  ; 5A61   0004 0150 016B

        B       L_5A72                          ; 5A64   0200 000C

L_5A66:
        SUBI    #$01A0, R3                      ; 5A66   033B 01A0

        JSR     R5,     L_60CA                  ; 5A68   0004 0160 00CA

        ADDI    #$01A0, R3                      ; 5A6B   02FB 01A0
        CLRR    R0                              ; 5A6D   01C0
        MVO@    R0,     R3                      ; 5A6E   0258

        JSR     R5,     L_5273                  ; 5A6F   0004 0150 0273

L_5A72:
        PULR    R7                              ; 5A72   02B7
        PSHR    R5                              ; 5A73   0275

        JSR     R5,     L_54F4                  ; 5A74   0004 0154 00F4

        TSTR    R3                              ; 5A77   009B
        BNEQ    L_5A7F                          ; 5A78   020C 0005

        JSR     R5,     G_4B9E                  ; 5A7A   0004 0148 039E

        RSWD    R1                              ; 5A7D   0039
        SLLC    R2,     2                       ; 5A7E   005E
L_5A7F:
        PULR    R7                              ; 5A7F   02B7
        PSHR    R5                              ; 5A80   0275
        PSHR    R3                              ; 5A81   0273
        SDBD                                    ; 5A82   0001
        MVII    #$6225, R4                      ; 5A83   02BC 0025 0062

        JSR     R5,     L_60E9                  ; 5A86   0004 0160 00E9

        PULR    R3                              ; 5A89   02B3
        XORI    #$0003, R3                      ; 5A8A   03FB 0003
        ADDI    #$0330, R3                      ; 5A8C   02FB 0330
        MVI@    R3,     R3                      ; 5A8E   029B
        SDBD                                    ; 5A8F   0001
        CMPI    #$632B, R3                      ; 5A90   037B 002B 0063
        BEQ     L_5A9A                          ; 5A93   0204 0005

        JSR     R5,     G_4B9A                  ; 5A95   0004 0148 039A

        ADDR    R1,     R0                      ; 5A98   00C8
        SLLC    R1,     2                       ; 5A99   005D
L_5A9A:
        PULR    R7                              ; 5A9A   02B7
        SLL     R0,     2                       ; 5A9B   004C
        SWAP    R1,     2                       ; 5A9C   0045
        SWAP    R2,     2                       ; 5A9D   0046
        RLC     R0,     2                       ; 5A9E   0054
        DECLE   $0000                           ; 5A9F   0000

        RLC     R2,     1                       ; 5AA0   0052
        SLL     R1,     1                       ; 5AA1   0049
        SWAP    R3,     2                       ; 5AA2   0047
        SLL     R0,     1                       ; 5AA3   0048
        RLC     R0,     2                       ; 5AA4   0054
        DECLE   $0000                           ; 5AA5   0000

        PSHR    R5                              ; 5AA6   0275

        JSR     R5,     G_4B9A                  ; 5AA7   0004 0148 039A

        MOVR    R7,     R4                      ; 5AAA   00BC
        SLLC    R1,     2                       ; 5AAB   005D
        MVI     G_0134, R1                      ; 5AAC   0281 0134
        PSHR    R1                              ; 5AAE   0271
        MVII    #$031F, R3                      ; 5AAF   02BB 031F
        SDBD                                    ; 5AB1   0001
        MVII    #$625D, R4                      ; 5AB2   02BC 005D 0062

        JSR     R5,     G_4BC3                  ; 5AB5   0004 0148 03C3

        PULR    R1                              ; 5AB8   02B1
        CMPI    #$0080, R1                      ; 5AB9   0379 0080
        BGT     L_5ADF                          ; 5ABB   020E 0022

        MVI     G_019E, R1                      ; 5ABD   0281 019E
        MVI     G_019F, R3                      ; 5ABF   0283 019F
        CMPI    #$0001, R1                      ; 5AC1   0379 0001
        BNEQ    L_5ACC                          ; 5AC3   020C 0007

        CMPI    #$000C, R3                      ; 5AC5   037B 000C
        BLT     L_5AD5                          ; 5AC7   0205 000C

        INCR    R1                              ; 5AC9   0009
        B       L_5AD5                          ; 5ACA   0200 0009

L_5ACC:
        CMPI    #$0007, R1                      ; 5ACC   0379 0007
        BNEQ    L_5AD5                          ; 5ACE   020C 0005

        CMPI    #$0004, R3                      ; 5AD0   037B 0004
        BLT     L_5AD5                          ; 5AD2   0205 0001

        INCR    R1                              ; 5AD4   0009
L_5AD5:
        INCR    R1                              ; 5AD5   0009
        MVO     R1,     G_019E                  ; 5AD6   0241 019E
        DECR    R1                              ; 5AD8   0011
        SDBD                                    ; 5AD9   0001
        ADDI    #$549A, R1                      ; 5ADA   02F9 009A 0054
        B       L_5AFF                          ; 5ADD   0200 0020

L_5ADF:
        MVI     G_019F, R1                      ; 5ADF   0281 019F
        MVI     G_019E, R3                      ; 5AE1   0283 019E
        CMPI    #$0003, R1                      ; 5AE3   0379 0003
        BNEQ    L_5AEE                          ; 5AE5   020C 0007

        CMPI    #$0008, R3                      ; 5AE7   037B 0008
        BLT     L_5AF7                          ; 5AE9   0205 000C

        INCR    R1                              ; 5AEB   0009
        B       L_5AF7                          ; 5AEC   0200 0009

L_5AEE:
        CMPI    #$000B, R1                      ; 5AEE   0379 000B
        BNEQ    L_5AF7                          ; 5AF0   020C 0005

        CMPI    #$0002, R3                      ; 5AF2   037B 0002
        BLT     L_5AF7                          ; 5AF4   0205 0001

        INCR    R1                              ; 5AF6   0009
L_5AF7:
        INCR    R1                              ; 5AF7   0009
        MVO     R1,     G_019F                  ; 5AF8   0241 019F
        DECR    R1                              ; 5AFA   0011
        SDBD                                    ; 5AFB   0001
        ADDI    #$54C7, R1                      ; 5AFC   02F9 00C7 0054
L_5AFF:
        MVI@    R1,     R0                      ; 5AFF   0288
        SUBI    #$0004, R0                      ; 5B00   0338 0004
        ADD     G_031F, R0                      ; 5B02   02C0 031F
        MVO     R0,     G_031F                  ; 5B04   0240 031F
        SDBD                                    ; 5B06   0001
        ADDI    #$000F, R1                      ; 5B07   02F9 000F 0000
        MVI@    R1,     R0                      ; 5B0A   0288
        ADD     G_0327, R0                      ; 5B0B   02C0 0327
        MVO     R0,     G_0327                  ; 5B0D   0240 0327
        SDBD                                    ; 5B0F   0001
        ADDI    #$000F, R1                      ; 5B10   02F9 000F 0000
        MVI@    R1,     R3                      ; 5B13   028B
        MVII    #$0201, R0                      ; 5B14   02B8 0201
        MVO@    R0,     R3                      ; 5B16   0258
        CMPI    #$02A2, R3                      ; 5B17   037B 02A2
        BEQ     L_5B23                          ; 5B19   0204 0008

        CMPI    #$02AF, R3                      ; 5B1B   037B 02AF
        BEQ     L_5B23                          ; 5B1D   0204 0004

        CMPI    #$02B7, R3                      ; 5B1F   037B 02B7
        BNEQ    L_5B2A                          ; 5B21   020C 0007

L_5B23:
        INCR    R3                              ; 5B23   000B
        MVO@    R0,     R3                      ; 5B24   0258

        JSR     R5,     L_5399                  ; 5B25   0004 0150 0399

        B       L_5B36                          ; 5B28   0200 000C

L_5B2A:
        CMPI    #$02BF, R3                      ; 5B2A   037B 02BF
        BNEQ    L_5B36                          ; 5B2C   020C 0008

        INCR    R3                              ; 5B2E   000B
        MOVR    R3,     R4                      ; 5B2F   009C
        MVO@    R0,     R4                      ; 5B30   0260
        MVO@    R0,     R4                      ; 5B31   0260
        MVO@    R0,     R4                      ; 5B32   0260

        JSR     R5,     L_5399                  ; 5B33   0004 0150 0399

L_5B36:
        MVI     G_0190, R0                      ; 5B36   0280 0190
        DECR    R0                              ; 5B38   0010
        MVO     R0,     G_0190                  ; 5B39   0240 0190
L_5B3B:
        BNEQ    L_5B98                          ; 5B3B   020C 005B

        MVI     G_0184, R0                      ; 5B3D   0280 0184
        ANDI    #$0002, R0                      ; 5B3F   03B8 0002
        BEQ     L_5D7D                          ; 5B41   0204 023A

        JSR     R5,     L_5622                  ; 5B43   0004 0154 0222

        CLRR    R0                              ; 5B46   01C0
        MVO     R0,     G_0197                  ; 5B47   0240 0197
        MVO     R0,     G_019C                  ; 5B49   0240 019C
        MVI     G_0184, R0                      ; 5B4B   0280 0184
        MOVR    R0,     R1                      ; 5B4D   0081
        ANDI    #$0004, R1                      ; 5B4E   03B9 0004
        BEQ     L_5B56                          ; 5B50   0204 0004

        ADDI    #$0040, R0                      ; 5B52   02F8 0040
        B       L_5B58                          ; 5B54   0200 0002

L_5B56:
        ADDI    #$0080, R0                      ; 5B56   02F8 0080
L_5B58:
        MVO     R0,     G_0184                  ; 5B58   0240 0184
        ANDI    #$00C0, R0                      ; 5B5A   03B8 00C0
        CMPI    #$00C0, R0                      ; 5B5C   0378 00C0
        BEQ     L_5D7D                          ; 5B5E   0204 021D

        MVII    #$000C, R0                      ; 5B60   02B8 000C
        MVO     R0,     G_01C1                  ; 5B62   0240 01C1
        MVI     G_0184, R0                      ; 5B64   0280 0184
        ANDI    #$0004, R0                      ; 5B66   03B8 0004
        SDBD                                    ; 5B68   0001
        MVII    #$529B, R1                      ; 5B69   02B9 009B 0052
        BEQ     L_5B72                          ; 5B6C   0204 0004

        SDBD                                    ; 5B6E   0001
        MVII    #$52A0, R1                      ; 5B6F   02B9 00A0 0052
L_5B72:
        MVI     G_018F, R3                      ; 5B72   0283 018F
        SWAP    R3,     1                       ; 5B74   0043
        ADDI    #$0001, R3                      ; 5B75   02FB 0001
        MVII    #$0240, R4                      ; 5B77   02BC 0240

        JSR     R5,     X_PRINT_R1              ; 5B79   0004 0118 0067

        MVII    #$0246, R4                      ; 5B7C   02BC 0246

        JSR     R5,     X_PRINT_R5              ; 5B7E   0004 0118 007B

        RLC     R0,     1                       ; 5B81   0050
        SLL     R0,     2                       ; 5B82   004C
        SWAP    R1,     1                       ; 5B83   0041
        SLLC    R1,     1                       ; 5B84   0059
        SWAP    R1,     2                       ; 5B85   0045
        RLC     R2,     1                       ; 5B86   0052
        DECLE   $0000                           ; 5B87   0000

        MVII    #$0269, R4                      ; 5B88   02BC 0269

        JSR     R5,     X_PRINT_R5              ; 5B8A   0004 0118 007B

        SWAP    R3,     2                       ; 5B8D   0047
        SWAP    R1,     1                       ; 5B8E   0041
        SLL     R1,     2                       ; 5B8F   004D
        SWAP    R1,     2                       ; 5B90   0045
        NEGR    R0                              ; 5B91   0020
        NEGR    R0                              ; 5B92   0020
        SLL     R3,     2                       ; 5B93   004F
        RLC     R2,     2                       ; 5B94   0056
        SWAP    R1,     2                       ; 5B95   0045
        RLC     R2,     1                       ; 5B96   0052
        DECLE   $0000                           ; 5B97   0000
L_5B98:
        PULR    R7                              ; 5B98   02B7
        PSHR    R5                              ; 5B99   0275
        MVII    #$0007, R3                      ; 5B9A   02BB 0007
        SDBD                                    ; 5B9C   0001
        MVII    #$6287, R4                      ; 5B9D   02BC 0087 0062

        JSR     R5,     L_60E9                  ; 5BA0   0004 0160 00E9

        MVI     G_031F, R0                      ; 5BA3   0280 031F
        SUBI    #$0004, R0                      ; 5BA5   0338 0004
        MVO     R0,     G_031F                  ; 5BA7   0240 031F
        PULR    R7                              ; 5BA9   02B7
        MVI     G_0195, R0                      ; 5BAA   0280 0195
        MVO     R0,     .STIC.HDLY              ; 5BAC   0240 0030
        MVI     G_0196, R0                      ; 5BAE   0280 0196
        MVO     R0,     .STIC.VDLY              ; 5BB0   0240 0031
        CLRR    R0                              ; 5BB2   01C0
        MVO     R0,     G_01A4                  ; 5BB3   0240 01A4
        J       G_4997                          ; 5BB5   0004 0348 0197

        PSHR    R5                              ; 5BB8   0275
        MVII    #$021A, R4                      ; 5BB9   02BC 021A
        MVII    #$0006, R3                      ; 5BBB   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5BBD   0004 0118 007B

        SWAP    R1,     1                       ; 5BC0   0041
        RLC     R0,     2                       ; 5BC1   0054
        SLL     R0,     2                       ; 5BC2   004C
        SWAP    R1,     1                       ; 5BC3   0041
        SLL     R2,     2                       ; 5BC4   004E
        RLC     R0,     2                       ; 5BC5   0054
        SLL     R1,     1                       ; 5BC6   0049
        RLC     R3,     1                       ; 5BC7   0053
        DECLE   $0000                           ; 5BC8   0000

        PULR    R7                              ; 5BC9   02B7
        PSHR    R5                              ; 5BCA   0275
        MVII    #$0318, R2                      ; 5BCB   02BA 0318

        JSR     R5,     L_60CD                  ; 5BCD   0004 0160 00CD

        MVI     G_0184, R0                      ; 5BD0   0280 0184
        ANDI    #$0002, R0                      ; 5BD2   03B8 0002
        BNEQ    L_5C2B                          ; 5BD4   020C 0055

        JSR     R5,     L_53B8                  ; 5BD6   0004 0150 03B8

        MVII    #$023F, R4                      ; 5BD9   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 5BDB   0004 0118 007B

        RLC     R3,     1                       ; 5BDE   0053
        RLC     R1,     2                       ; 5BDF   0055
        RLC     R2,     1                       ; 5BE0   0052
        RLC     R2,     2                       ; 5BE1   0056
        SLL     R1,     1                       ; 5BE2   0049
        RLC     R2,     2                       ; 5BE3   0056
        SWAP    R1,     2                       ; 5BE4   0045
        SWAP    R0,     2                       ; 5BE5   0044
        DECLE   $0000                           ; 5BE6   0000

        MVII    #$0248, R4                      ; 5BE7   02BC 0248
        MVII    #$0003, R1                      ; 5BE9   02B9 0003
        MVI     G_01B3, R0                      ; 5BEB   0280 01B3
        DECR    R0                              ; 5BED   0010

        JSR     R5,     X_PRNUM_RGT             ; 5BEE   0004 0118 00C5

        MVII    #$024C, R4                      ; 5BF1   02BC 024C
        MVI     G_01B3, R0                      ; 5BF3   0280 01B3
        CMPI    #$0002, R0                      ; 5BF5   0378 0002
        BNEQ    L_5C02                          ; 5BF7   020C 0009

        JSR     R5,     X_PRINT_R5              ; 5BF9   0004 0118 007B

        SWAP    R0,     2                       ; 5BFC   0044
        SWAP    R1,     1                       ; 5BFD   0041
        SLLC    R1,     1                       ; 5BFE   0059
        DECLE   $0000                           ; 5BFF   0000

        B       L_5C0A                          ; 5C00   0200 0008

L_5C02:
        JSR     R5,     X_PRINT_R5              ; 5C02   0004 0118 007B

        SWAP    R0,     2                       ; 5C05   0044
        SWAP    R1,     1                       ; 5C06   0041
        SLLC    R1,     1                       ; 5C07   0059
        RLC     R3,     1                       ; 5C08   0053
        DECLE   $0000                           ; 5C09   0000
L_5C0A:
        MVII    #$0253, R4                      ; 5C0A   02BC 0253

        JSR     R5,     X_PRINT_R5              ; 5C0C   0004 0118 007B

        RLC     R3,     1                       ; 5C0F   0053
        SWAP    R3,     1                       ; 5C10   0043
        SLL     R3,     2                       ; 5C11   004F
        RLC     R2,     1                       ; 5C12   0052
        SWAP    R1,     2                       ; 5C13   0045
        DECLE   $0000                           ; 5C14   0000

        MVI     G_0188, R0                      ; 5C15   0280 0188
        MVII    #$0259, R4                      ; 5C17   02BC 0259
        TSTR    R0                              ; 5C19   0080
        BNEQ    L_5C25                          ; 5C1A   020C 0009

        MVII    #$025B, R4                      ; 5C1C   02BC 025B
        MVI     G_0187, R0                      ; 5C1E   0280 0187
        TSTR    R0                              ; 5C20   0080
        BNEQ    L_5C25                          ; 5C21   020C 0002

        MVII    #$025D, R4                      ; 5C23   02BC 025D
L_5C25:
        MVII    #$0188, R2                      ; 5C25   02BA 0188

        JSR     R5,     L_5CD0                  ; 5C27   0004 015C 00D0

        PULR    R7                              ; 5C2A   02B7

L_5C2B:
        JSR     R5,     L_53B8                  ; 5C2B   0004 0150 03B8

        MVII    #$023E, R4                      ; 5C2E   02BC 023E

L_5C30:
        JSR     R5,     X_PRINT_R5              ; 5C30   0004 0118 007B

        RLC     R0,     1                       ; 5C33   0050
        SLL     R0,     2                       ; 5C34   004C
        SWAP    R1,     1                       ; 5C35   0041
        SLLC    R1,     1                       ; 5C36   0059
        SWAP    R1,     2                       ; 5C37   0045
        RLC     R2,     1                       ; 5C38   0052
        NEGR    R0                              ; 5C39   0020
        NEGR    R0                              ; 5C3A   0020
        RLC     R3,     1                       ; 5C3B   0053
        SWAP    R3,     1                       ; 5C3C   0043
        SLL     R3,     2                       ; 5C3D   004F
        RLC     R2,     1                       ; 5C3E   0052
        SWAP    R1,     2                       ; 5C3F   0045
        NEGR    R0                              ; 5C40   0020
        SWAP    R0,     2                       ; 5C41   0044
        SWAP    R1,     1                       ; 5C42   0041
        SLLC    R1,     1                       ; 5C43   0059
        RLC     R3,     1                       ; 5C44   0053
        DECLE   $0000                           ; 5C45   0000

        MVII    #$0252, R4                      ; 5C46   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 5C48   0004 0118 007B

        SLL     R0,     2                       ; 5C4B   004C
        SWAP    R1,     2                       ; 5C4C   0045
        SWAP    R2,     2                       ; 5C4D   0046
        RLC     R0,     2                       ; 5C4E   0054
        DECLE   $0000                           ; 5C4F   0000

        MVII    #$0266, R4                      ; 5C50   02BC 0266

        JSR     R5,     X_PRINT_R5              ; 5C52   0004 0118 007B

        RLC     R2,     1                       ; 5C55   0052
        SLL     R1,     1                       ; 5C56   0049
        SWAP    R3,     2                       ; 5C57   0047
        SLL     R0,     1                       ; 5C58   0048
        RLC     R0,     2                       ; 5C59   0054
        DECLE   $0000                           ; 5C5A   0000

        MVI     G_01B3, R0                      ; 5C5B   0280 01B3
        DECR    R0                              ; 5C5D   0010
        MVII    #$0003, R1                      ; 5C5E   02B9 0003
        MVII    #$0260, R4                      ; 5C60   02BC 0260

        JSR     R5,     X_PRNUM_RGT             ; 5C62   0004 0118 00C5

        MVI     G_01B4, R0                      ; 5C65   0280 01B4
        DECR    R0                              ; 5C67   0010
        MVII    #$0003, R1                      ; 5C68   02B9 0003
        MVII    #$0274, R4                      ; 5C6A   02BC 0274

        JSR     R5,     X_PRNUM_RGT             ; 5C6C   0004 0118 00C5

        MVII    #$0258, R4                      ; 5C6F   02BC 0258
        MVI     G_0188, R0                      ; 5C71   0280 0188
        TSTR    R0                              ; 5C73   0080
        BNEQ    L_5C7F                          ; 5C74   020C 0009

        MVII    #$025A, R4                      ; 5C76   02BC 025A
L_5C78:
        MVI     G_0187, R0                      ; 5C78   0280 0187
        TSTR    R0                              ; 5C7A   0080
        BNEQ    L_5C7F                          ; 5C7B   020C 0002

        MVII    #$025C, R4                      ; 5C7D   02BC 025C
L_5C7F:
        MVII    #$0188, R2                      ; 5C7F   02BA 0188

        JSR     R5,     L_5CD0                  ; 5C81   0004 015C 00D0

        MVII    #$026C, R4                      ; 5C84   02BC 026C
        MVI     G_018B, R0                      ; 5C86   0280 018B
        TSTR    R0                              ; 5C88   0080
        BNEQ    L_5C94                          ; 5C89   020C 0009

        MVII    #$026E, R4                      ; 5C8B   02BC 026E
        MVI     G_018A, R0                      ; 5C8D   0280 018A
        TSTR    R0                              ; 5C8F   0080
        BNEQ    L_5C94                          ; 5C90   020C 0002

        MVII    #$0270, R4                      ; 5C92   02BC 0270
L_5C94:
        MVII    #$018B, R2                      ; 5C94   02BA 018B

        JSR     R5,     L_5CD0                  ; 5C96   0004 015C 00D0

        PULR    R7                              ; 5C99   02B7
        NEGR    R0                              ; 5C9A   0020
        ADCR    R0                              ; 5C9B   0028
        NEGR    R4                              ; 5C9C   0024
        ADCR    R4                              ; 5C9D   002C
        NOP                                     ; 5C9E   0034
        RSWD    R4                              ; 5C9F   003C
        SLLC    R2,     1                       ; 5CA0   005A
        RRC     R0,     1                       ; 5CA1   0070
        SLR     R0,     2                       ; 5CA2   0064
        SAR     R0,     2                       ; 5CA3   006C
        RRC     R0,     2                       ; 5CA4   0074
        SARC    R0,     2                       ; 5CA5   007C
        MOVR    R1,     R0                      ; 5CA6   0088
        MOVR    R2,     R4                      ; 5CA7   0094
        MOVR    R3,     R4                      ; 5CA8   009C
        SLL     R0,     2                       ; 5CA9   004C
        RLC     R0,     2                       ; 5CAA   0054
        SLLC    R0,     1                       ; 5CAB   0058
        SLLC    R0,     1                       ; 5CAC   0058
        RLC     R0,     1                       ; 5CAD   0050
        SLL     R0,     1                       ; 5CAE   0048
L_5CAF:
        RLC     R0,     1                       ; 5CAF   0050
        RLC     R2,     1                       ; 5CB0   0052
        SLLC    R0,     1                       ; 5CB1   0058
        SLLC    R0,     1                       ; 5CB2   0058
        SLLC    R0,     1                       ; 5CB3   0058
        SLLC    R0,     1                       ; 5CB4   0058
        SLL     R0,     2                       ; 5CB5   004C
        RLC     R0,     1                       ; 5CB6   0050
        SLL     R0,     1                       ; 5CB7   0048
        MVI@    R4,     R2                      ; 5CB8   02A2
        PULR    R7                              ; 5CB9   02B7
        ADD@    R1,     R3                      ; 5CBA   02CB
        ADD@    R1,     R4                      ; 5CBB   02CC
        MVII    #$02A6, R1                      ; 5CBC   02B9 02A6
        MVII    #$02BF, R6                      ; 5CBE   02BE 02BF
        ADD@    R2,     R3                      ; 5CC0   02D3
        ADD@    R2,     R4                      ; 5CC1   02D4
        ADD@    R2,     R5                      ; 5CC2   02D5
        ADD@    R2,     R6                      ; 5CC3   02D6
        MVI@    R5,     R7                      ; 5CC4   02AF
        ADD     .BTAB.B2,R5                     ; 5CC5   02C5 02B2
        MOVR    R3,     R4                      ; 5CC7   009C
        MOVR    R2,     R4                      ; 5CC8   0094
        MOVR    R1,     R0                      ; 5CC9   0088
        RRC     R0,     1                       ; 5CCA   0070
        SARC    R0,     2                       ; 5CCB   007C
        RRC     R0,     2                       ; 5CCC   0074
        SAR     R0,     2                       ; 5CCD   006C
        SLR     R0,     2                       ; 5CCE   0064
        SLLC    R2,     1                       ; 5CCF   005A
L_5CD0:
        RSWD    R4                              ; 5CD0   003C
        NOP                                     ; 5CD1   0034
        ADCR    R0                              ; 5CD2   0028
        ADCR    R4                              ; 5CD3   002C
        NEGR    R4                              ; 5CD4   0024
L_5CD5:
        NEGR    R0                              ; 5CD5   0020
        SLL     R0,     1                       ; 5CD6   0048
        RLC     R0,     1                       ; 5CD7   0050
        SLL     R0,     2                       ; 5CD8   004C
        RLC     R2,     1                       ; 5CD9   0052
        SLLC    R0,     1                       ; 5CDA   0058
        SLLC    R0,     1                       ; 5CDB   0058
        SLLC    R0,     1                       ; 5CDC   0058
        SLLC    R0,     1                       ; 5CDD   0058
        RLC     R0,     1                       ; 5CDE   0050
        SLL     R0,     1                       ; 5CDF   0048
        RLC     R0,     1                       ; 5CE0   0050
        RLC     R0,     2                       ; 5CE1   0054
        SLLC    R0,     1                       ; 5CE2   0058
        SLLC    R0,     1                       ; 5CE3   0058
        SLL     R0,     2                       ; 5CE4   004C
        PULR    R2                              ; 5CE5   02B2
        ADD     .BTAB.AF,R5                     ; 5CE6   02C5 02AF
        MVII    #$02D6, R7                      ; 5CE8   02BF 02D6
        ADD@    R2,     R5                      ; 5CEA   02D5
        ADD@    R2,     R4                      ; 5CEB   02D4
        ADD@    R2,     R3                      ; 5CEC   02D3
        MVII    #$02A6, R6                      ; 5CED   02BE 02A6
        MVII    #$02B7, R1                      ; 5CEF   02B9 02B7
        ADD@    R1,     R4                      ; 5CF1   02CC
        ADD@    R1,     R3                      ; 5CF2   02CB
        MVI@    R4,     R2                      ; 5CF3   02A2
        PSHR    R5                              ; 5CF4   0275
        CLRR    R3                              ; 5CF5   01DB
        MVII    #$01A3, R4                      ; 5CF6   02BC 01A3
        SDBD                                    ; 5CF8   0001
        ADD@    R4,     R3                      ; 5CF9   02E3
        SDBD                                    ; 5CFA   0001
        ADD@    R4,     R3                      ; 5CFB   02E3
        PULR    R7                              ; 5CFC   02B7
        PSHR    R5                              ; 5CFD   0275
        MVI     G_0184, R0                      ; 5CFE   0280 0184
        ANDI    #$0020, R0                      ; 5D00   03B8 0020
        BNEQ    L_5D51                          ; 5D02   020C 004D

        MVI     G_0198, R0                      ; 5D04   0280 0198
        TSTR    R0                              ; 5D06   0080
        BNEQ    L_5D51                          ; 5D07   020C 0048

        MVI     G_0330, R0                      ; 5D09   0280 0330
        SDBD                                    ; 5D0B   0001
        CMPI    #$62E7, R0                      ; 5D0C   0378 00E7 0062
        BEQ     L_5D22                          ; 5D0F   0204 0011

        SDBD                                    ; 5D11   0001
        CMPI    #$6295, R0                      ; 5D12   0378 0095 0062
        BNEQ    L_5D51                          ; 5D15   020C 003A

        MVI     G_0199, R0                      ; 5D17   0280 0199
        CMPI    #$005A, R0                      ; 5D19   0378 005A
        BGE     L_5D4E                          ; 5D1B   020D 0031

        INCR    R0                              ; 5D1D   0008
        MVO     R0,     G_0199                  ; 5D1E   0240 0199
        B       L_5D4E                          ; 5D20   0200 002C

L_5D22:
        MVI     G_0328, R0                      ; 5D22   0280 0328
        SDBD                                    ; 5D24   0001
        ANDI    #$2FF8, R0                      ; 5D25   03B8 00F8 002F
        MVI     G_01A2, R1                      ; 5D28   0281 01A2
        CMPI    #$00FF, R1                      ; 5D2A   0379 00FF
        BEQ     L_5D32                          ; 5D2C   0204 0004

        ADDI    #$0006, R0                      ; 5D2E   02F8 0006
        B       L_5D36                          ; 5D30   0200 0004

L_5D32:
        SDBD                                    ; 5D32   0001
        ADDI    #$1002, R0                      ; 5D33   02F8 0002 0010
L_5D36:
        MVO     R0,     G_0328                  ; 5D36   0240 0328
        MVI     G_0199, R0                      ; 5D38   0280 0199
        DECR    R0                              ; 5D3A   0010
        MVO     R0,     G_0199                  ; 5D3B   0240 0199
        CMPI    #$0005, R0                      ; 5D3D   0378 0005
        BNEQ    L_5D48                          ; 5D3F   020C 0007

        JSR     R5,     G_4B9E                  ; 5D41   0004 0148 039E

        SLL     R2,     1                       ; 5D44   004A
        SLR     R0,     1                       ; 5D45   0060
        B       L_5D4E                          ; 5D46   0200 0006

L_5D48:
        TSTR    R0                              ; 5D48   0080
        BNEQ    L_5D4E                          ; 5D49   020C 0003

        JSR     R5,     L_5C30                  ; 5D4B   0004 015C 0030
L_5D4E:
        JSR     R5,     L_5552                  ; 5D4E   0004 0154 0152

L_5D51:
        PULR    R7                              ; 5D51   02B7
        PSHR    R5                              ; 5D52   0275
        MVI     G_0199, R0                      ; 5D53   0280 0199
        MVII    #$0002, R1                      ; 5D55   02B9 0002
        SDBD                                    ; 5D57   0001
        MVII    #$2201, R3                      ; 5D58   02BB 0001 0022
        MVII    #$02E3, R4                      ; 5D5B   02BC 02E3

        JSR     R5,     X_PRNUM_RGT             ; 5D5D   0004 0118 00C5

        PULR    R7                              ; 5D60   02B7
L_5D61:
        PSHR    R5                              ; 5D61   0275
        SDBD                                    ; 5D62   0001
        MVII    #$62E7, R0                      ; 5D63   02B8 00E7 0062
        CMP     G_0330, R0                      ; 5D66   0340 0330
        BEQ     L_5D7C                          ; 5D68   0204 0012

        CLRR    R0                              ; 5D6A   01C0
        MVO     R0,     G_0171                  ; 5D6B   0240 0171
        MVO     R0,     G_0198                  ; 5D6D   0240 0198

L_5D6F:
        JSR     R5,     L_572F                  ; 5D6F   0004 0154 032F

        MVI     G_0199, R0                      ; 5D72   0280 0199
        CMPI    #$001E, R0                      ; 5D74   0378 001E
        BGE     L_5D7C                          ; 5D76   020D 0004

        MVII    #$001E, R0                      ; 5D78   02B8 001E
        MVO     R0,     G_0199                  ; 5D7A   0240 0199
L_5D7C:
        PULR    R7                              ; 5D7C   02B7
L_5D7D:
        MVI     G_0184, R0                      ; 5D7D   0280 0184
        ANDI    #$00FE, R0                      ; 5D7F   03B8 00FE
        MVO     R0,     G_0184                  ; 5D81   0240 0184

        JSR     R5,     L_5668                  ; 5D83   0004 0154 0268
        JSR     R5,     L_5622                  ; 5D86   0004 0154 0222

        MVII    #$003C, R0                      ; 5D89   02B8 003C
        MVO     R0,     G_01A3                  ; 5D8B   0240 01A3
        MVII    #$0002, R0                      ; 5D8D   02B8 0002
        MVO     R0,     G_0195                  ; 5D8F   0240 0195
        MVO     R0,     G_0196                  ; 5D91   0240 0196

        JSR     R5,     G_4B9A                  ; 5D93   0004 0148 039A

        MOVR    R7,     R4                      ; 5D96   00BC
        SLLC    R1,     2                       ; 5D97   005D
        DIS                                     ; 5D98   0003
        SDBD                                    ; 5D99   0001
        MVII    #$53AA, R0                      ; 5D9A   02B8 00AA 0053
        MVO     R0,     .ISRVEC.0               ; 5D9D   0240 0100
        SWAP    R0,     1                       ; 5D9F   0040
        MVO     R0,     .ISRVEC.1               ; 5DA0   0240 0101
        EIS                                     ; 5DA2   0002
        MVII    #$0001, R0                      ; 5DA3   02B8 0001
        MVO     R0,     G_01A2                  ; 5DA5   0240 01A2
L_5DA7:
        MVII    #$0001, R0                      ; 5DA7   02B8 0001
        MVO     R0,     G_01A4                  ; 5DA9   0240 01A4

        JSR     R5,     G_4BA9                  ; 5DAB   0004 0148 03A9

L_5DAE:
        MVI     G_01A4, R0                      ; 5DAE   0280 01A4
        TSTR    R0                              ; 5DB0   0080
        BNEQ    L_5DAE                          ; 5DB1   022C 0004

        MVI     G_01A2, R0                      ; 5DB3   0280 01A2
        XORI    #$0001, R0                      ; 5DB5   03F8 0001
        MVO     R0,     G_01A2                  ; 5DB7   0240 01A2
        SDBD                                    ; 5DB9   0001
        MVII    #$2600, R1                      ; 5DBA   02B9 0000 0026
        BEQ     L_5DC3                          ; 5DBD   0204 0004

        SDBD                                    ; 5DBF   0001
        MVII    #$1000, R1                      ; 5DC0   02B9 0000 0010
L_5DC3:
        MVII    #$00A0, R0                      ; 5DC3   02B8 00A0
        MVII    #$0200, R4                      ; 5DC5   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5DC7   0004 0114 0341

        MVII    #$0002, R0                      ; 5DCA   02B8 0002

L_5DCC:
        JSR     R5,     X_RAND1                 ; 5DCC   0004 0114 027D

        MVO     R0,     G_0195                  ; 5DCF   0240 0195
        MVII    #$0002, R0                      ; 5DD1   02B8 0002

        JSR     R5,     X_RAND1                 ; 5DD3   0004 0114 027D

        MVO     R0,     G_0196                  ; 5DD6   0240 0196
        MVI     G_01A3, R0                      ; 5DD8   0280 01A3
        DECR    R0                              ; 5DDA   0010
        MVO     R0,     G_01A3                  ; 5DDB   0240 01A3
        BNEQ    L_5DA7                          ; 5DDD   022C 0037

        CLRR    R0                              ; 5DDF   01C0
        MVO     R0,     G_0195                  ; 5DE0   0240 0195
        MVO     R0,     G_0196                  ; 5DE2   0240 0196
        MVII    #$00A0, R0                      ; 5DE4   02B8 00A0
        MVII    #$0200, R4                      ; 5DE6   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5DE8   0004 0114 0338

        MVII    #$0001, R0                      ; 5DEB   02B8 0001
L_5DED:
        MVO     R0,     G_01A4                  ; 5DED   0240 01A4
L_5DEF:
        MVI     G_01A4, R0                      ; 5DEF   0280 01A4
        TSTR    R0                              ; 5DF1   0080
        BNEQ    L_5DEF                          ; 5DF2   022C 0004

        DIS                                     ; 5DF4   0003
        SDBD                                    ; 5DF5   0001
        MVII    #$4997, R0                      ; 5DF6   02B8 0097 0049
        MVO     R0,     .ISRVEC.0               ; 5DF9   0240 0100
        SWAP    R0,     1                       ; 5DFB   0040
        MVO     R0,     .ISRVEC.1               ; 5DFC   0240 0101
        EIS                                     ; 5DFE   0002
        MVII    #$0318, R3                      ; 5DFF   02BB 0318
        SDBD                                    ; 5E01   0001
        MVII    #$6167, R4                      ; 5E02   02BC 0067 0061

        JSR     R5,     G_4BC3                  ; 5E05   0004 0148 03C3
        JSR     R5,     L_5E83                  ; 5E08   0004 015C 0283

        MVI     G_0185, R0                      ; 5E0B   0280 0185
        SDBD                                    ; 5E0D   0001
        MVII    #$2201, R3                      ; 5E0E   02BB 0001 0022
        MVII    #$02E3, R4                      ; 5E11   02BC 02E3
        MVII    #$0002, R1                      ; 5E13   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5E15   0004 0118 00C5

        PULR    R7                              ; 5E18   02B7
        PSHR    R5                              ; 5E19   0275
        MVII    #$003B, R0                      ; 5E1A   02B8 003B
        MVII    #$0184, R4                      ; 5E1C   02BC 0184

        JSR     R5,     X_FILL_ZERO             ; 5E1E   0004 0114 0338

        PULR    R7                              ; 5E21   02B7
        PSHR    R5                              ; 5E22   0275
        MVII    #$0008, R0                      ; 5E23   02B8 0008
        MVII    #$0318, R4                      ; 5E25   02BC 0318

        JSR     R5,     X_FILL_ZERO             ; 5E27   0004 0114 0338

        MVII    #$0008, R0                      ; 5E2A   02B8 0008
        MVII    #$0330, R4                      ; 5E2C   02BC 0330

        JSR     R5,     X_FILL_ZERO             ; 5E2E   0004 0114 0338

        PULR    R7                              ; 5E31   02B7
        PSHR    R5                              ; 5E32   0275
        MVII    #$0003, R0                      ; 5E33   02B8 0003
        MVO     R0,     G_010C                  ; 5E35   0240 010C
        MVII    #$000F, R0                      ; 5E37   02B8 000F
        MVO     R0,     G_0190                  ; 5E39   0240 0190
        MVO     R0,     G_0191                  ; 5E3B   0240 0191
        MVO     R0,     G_0192                  ; 5E3D   0240 0192
        MVII    #$0032, R0                      ; 5E3F   02B8 0032
        MVO     R0,     G_018F                  ; 5E41   0240 018F
        PULR    R7                              ; 5E43   02B7
        PSHR    R5                              ; 5E44   0275
        SDBD                                    ; 5E45   0001
        MVII    #$674B, R5                      ; 5E46   02BD 004B 0067
        MVII    #$02A0, R4                      ; 5E49   02BC 02A0
L_5E4B:
        SDBD                                    ; 5E4B   0001
        MVI@    R5,     R0                      ; 5E4C   02A8
        MVO@    R0,     R4                      ; 5E4D   0260
        CMPI    #$02F0, R4                      ; 5E4E   037C 02F0
        BLT     L_5E4B                          ; 5E50   0225 0006

        PULR    R7                              ; 5E52   02B7
        PSHR    R5                              ; 5E53   0275

        JSR     R5,     L_5619                  ; 5E54   0004 0154 0219
        JSR     R5,     L_5622                  ; 5E57   0004 0154 0222
        JSR     R5,     L_5632                  ; 5E5A   0004 0154 0232
        JSR     R5,     G_4FDE                  ; 5E5D   0004 014C 03DE
        JSR     R5,     L_5644                  ; 5E60   0004 0154 0244

        MVII    #$0001, R0                      ; 5E63   02B8 0001
        MVO     R0,     G_0184                  ; 5E65   0240 0184
        PULR    R7                              ; 5E67   02B7
        PSHR    R5                              ; 5E68   0275
        MVII    #$00FF, R1                      ; 5E69   02B9 00FF
        MVII    #$0006, R0                      ; 5E6B   02B8 0006
        MVII    #$016D, R4                      ; 5E6D   02BC 016D

        JSR     R5,     X_FILL_MEM              ; 5E6F   0004 0114 0341

        PULR    R7                              ; 5E72   02B7
        PSHR    R5                              ; 5E73   0275
        SDBD                                    ; 5E74   0001
        MVII    #$56CB, R5                      ; 5E75   02BD 00CB 0056
        SDBD                                    ; 5E78   0001
        MVII    #$56F5, R4                      ; 5E79   02BC 00F5 0056
L_5E7C:
        MVI@    R4,     R3                      ; 5E7C   02A3
        SDBD                                    ; 5E7D   0001
        MVI@    R5,     R0                      ; 5E7E   02A8
        MVO@    R0,     R3                      ; 5E7F   0258
        CMPI    #$02B2, R3                      ; 5E80   037B 02B2
        BNEQ    L_5E7C                          ; 5E82   022C 0007

        SDBD                                    ; 5E84   0001
        MVII    #$56AD, R1                      ; 5E85   02B9 00AD 0056
        ADD     G_019E, R1                      ; 5E88   02C1 019E
        MVI@    R1,     R2                      ; 5E8A   028A
        SDBD                                    ; 5E8B   0001
        MVII    #$56F5, R4                      ; 5E8C   02BC 00F5 0056
L_5E8F:
        MVII    #$0200, R0                      ; 5E8F   02B8 0200
        TSTR    R2                              ; 5E91   0092
        BEQ     L_5E99                          ; 5E92   0204 0005

L_5E94:
        MVI@    R4,     R3                      ; 5E94   02A3
        MVO@    R0,     R3                      ; 5E95   0258
        DECR    R2                              ; 5E96   0012
        BNEQ    L_5E94                          ; 5E97   022C 0004

L_5E99:
        SDBD                                    ; 5E99   0001
        MVII    #$56BC, R1                      ; 5E9A   02B9 00BC 0056
        ADD     G_019F, R1                      ; 5E9D   02C1 019F
        MVI@    R1,     R2                      ; 5E9F   028A
        SDBD                                    ; 5EA0   0001
        MVII    #$570A, R4                      ; 5EA1   02BC 000A 0057
        TSTR    R2                              ; 5EA4   0092
        BEQ     L_5EAC                          ; 5EA5   0204 0005

L_5EA7:
        MVI@    R4,     R3                      ; 5EA7   02A3
        MVO@    R0,     R3                      ; 5EA8   0258
        DECR    R2                              ; 5EA9   0012
        BNEQ    L_5EA7                          ; 5EAA   022C 0004

L_5EAC:
        PULR    R7                              ; 5EAC   02B7
        DECLE   $0000                           ; 5EAD   0000

        EIS                                     ; 5EAE   0002

        JSRE    R4,     G_0406                  ; 5EAF   0004 0005 0006

        SETC                                    ; 5EB2   0007
        INCR    R0                              ; 5EB3   0008
        INCR    R1                              ; 5EB4   0009
        INCR    R5                              ; 5EB5   000D
        INCR    R6                              ; 5EB6   000E
        INCR    R7                              ; 5EB7   000F
        DECR    R0                              ; 5EB8   0010
        DECR    R1                              ; 5EB9   0011
        DECR    R3                              ; 5EBA   0013
        DECR    R4                              ; 5EBB   0014
        DECLE   $0000,  $0001                   ; 5EBC   0000 0001

        EIS                                     ; 5EBE   0002

        JSR     R4,     G_0809                  ; 5EBF   0004 0008 0009

        INCR    R2                              ; 5EC2   000A
        INCR    R3                              ; 5EC3   000B
        INCR    R4                              ; 5EC4   000C
        INCR    R5                              ; 5EC5   000D
        INCR    R6                              ; 5EC6   000E
        INCR    R7                              ; 5EC7   000F
        DECR    R1                              ; 5EC8   0011
        DECR    R2                              ; 5EC9   0012
        DECR    R3                              ; 5ECA   0013
        COMR    R1                              ; 5ECB   0019
        COMR    R4                              ; 5ECC   001C
        NEGR    R1                              ; 5ECD   0021
        COMR    R4                              ; 5ECE   001C
        SWAP    R1,     1                       ; 5ECF   0041
        INCR    R1                              ; 5ED0   0009
        SLLC    R1,     1                       ; 5ED1   0059
        INCR    R1                              ; 5ED2   0009
        SAR     R3,     1                       ; 5ED3   006B
        INCR    R3                              ; 5ED4   000B
        SLR     R3,     1                       ; 5ED5   0063
        INCR    R3                              ; 5ED6   000B
        ADCR    R1                              ; 5ED7   0029
        COMR    R0                              ; 5ED8   0018
L_5ED9:
        DECR    R1                              ; 5ED9   0011
        ADCR    R4                              ; 5EDA   002C
        DECR    R1                              ; 5EDB   0011
        ADCR    R4                              ; 5EDC   002C
        SWAP    R1,     1                       ; 5EDD   0041
        INCR    R1                              ; 5EDE   0009
        SLL     R1,     1                       ; 5EDF   0049
        INCR    R1                              ; 5EE0   0009
        RLC     R1,     1                       ; 5EE1   0051
        INCR    R1                              ; 5EE2   0009
        SLLC    R1,     1                       ; 5EE3   0059
        INCR    R1                              ; 5EE4   0009
        SLR     R3,     1                       ; 5EE5   0063
        INCR    R3                              ; 5EE6   000B
        SAR     R3,     1                       ; 5EE7   006B
        INCR    R3                              ; 5EE8   000B
        SLR     R3,     1                       ; 5EE9   0063
        INCR    R3                              ; 5EEA   000B
        SAR     R3,     1                       ; 5EEB   006B
        INCR    R3                              ; 5EEC   000B
        COMR    R1                              ; 5EED   0019
        COMR    R4                              ; 5EEE   001C
        NEGR    R1                              ; 5EEF   0021
        COMR    R4                              ; 5EF0   001C
        ADCR    R1                              ; 5EF1   0029
        COMR    R0                              ; 5EF2   0018
        DECR    R1                              ; 5EF3   0011
        ADCR    R4                              ; 5EF4   002C
        MVI@    R4,     R2                      ; 5EF5   02A2
        MVI@    R4,     R3                      ; 5EF6   02A3
        PULR    R7                              ; 5EF7   02B7
        MVII    #$02CB, R0                      ; 5EF8   02B8 02CB
        ADD@    R1,     R4                      ; 5EFA   02CC
        MVII    #$02A6, R1                      ; 5EFB   02B9 02A6
        MVII    #$02BF, R6                      ; 5EFD   02BE 02BF
        ADD     .BTAB.C1,R0                     ; 5EFF   02C0 02C1
        ADD     .BTAB.D3,R2                     ; 5F01   02C2 02D3
        ADD@    R2,     R4                      ; 5F03   02D4
        ADD@    R2,     R5                      ; 5F04   02D5
        ADD@    R2,     R6                      ; 5F05   02D6
        MVI@    R5,     R7                      ; 5F06   02AF
        PULR    R0                              ; 5F07   02B0
        ADD     .BTAB.B2,R5                     ; 5F08   02C5 02B2
        PULR    R2                              ; 5F0A   02B2
        ADD     .BTAB.B0,R5                     ; 5F0B   02C5 02B0
        MVI@    R5,     R7                      ; 5F0D   02AF
        ADD     .BTAB.C1,R2                     ; 5F0E   02C2 02C1
        ADD     .BTAB.BF,R0                     ; 5F10   02C0 02BF
        ADD@    R2,     R6                      ; 5F12   02D6
        ADD@    R2,     R5                      ; 5F13   02D5
        ADD@    R2,     R4                      ; 5F14   02D4
        ADD@    R2,     R3                      ; 5F15   02D3
        MVII    #$02A6, R6                      ; 5F16   02BE 02A6
        MVII    #$02B8, R1                      ; 5F18   02B9 02B8
        PULR    R7                              ; 5F1A   02B7
        ADD@    R1,     R4                      ; 5F1B   02CC
        PSHR    R5                              ; 5F1C   0275
        MVI     G_01C0, R0                      ; 5F1D   0280 01C0
        CMPI    #$0001, R0                      ; 5F1F   0378 0001
        BEQ     L_5F2B                          ; 5F21   0204 0008

        CLRR    R0                              ; 5F23   01C0
L_5F24:
        MVO     R0,     G_0126                  ; 5F24   0240 0126
        MVO     R0,     G_0136                  ; 5F26   0240 0136
        MVO     R0,     G_01C0                  ; 5F28   0240 01C0
        PULR    R7                              ; 5F2A   02B7

L_5F2B:
        JSR     R5,     L_572F                  ; 5F2B   0004 0154 032F

        PULR    R7                              ; 5F2E   02B7
        PSHR    R5                              ; 5F2F   0275
        CLRR    R0                              ; 5F30   01C0
        MVO     R0,     G_0348                  ; 5F31   0240 0348
        MVO     R0,     G_034E                  ; 5F33   0240 034E
        MVO     R0,     G_034F                  ; 5F35   0240 034F
        MVO     R0,     G_01C0                  ; 5F37   0240 01C0

        JSR     R5,     L_5746                  ; 5F39   0004 0154 0346

        PULR    R7                              ; 5F3C   02B7
        MVII    #$0001, R0                      ; 5F3D   02B8 0001
        MVO     R0,     G_0348                  ; 5F3F   0240 0348
        MVO     R0,     G_034E                  ; 5F41   0240 034E
        MVO     R0,     G_034F                  ; 5F43   0240 034F
        MOVR    R5,     R7                      ; 5F45   00AF
        PSHR    R5                              ; 5F46   0275
        MVII    #$0318, R3                      ; 5F47   02BB 0318
        SDBD                                    ; 5F49   0001
        MVII    #$6159, R4                      ; 5F4A   02BC 0059 0061

        JSR     R5,     G_4BC3                  ; 5F4D   0004 0148 03C3

        MVI     G_0184, R0                      ; 5F50   0280 0184
        ANDI    #$00E7, R0                      ; 5F52   03B8 00E7
        MVO     R0,     G_0184                  ; 5F54   0240 0184
        PULR    R7                              ; 5F56   02B7
        SLR     R1,     1                       ; 5F57   0061
        RLC     R3,     2                       ; 5F58   0057
        MOVR    R5,     R3                      ; 5F59   00AB
        SLLC    R0,     1                       ; 5F5A   0058

        JSR     R4,     L_58FF                  ; 5F5B   0004 0058 00FF

        RLC     R3,     2                       ; 5F5E   0057
        ADDR    R7,     R7                      ; 5F5F   00FF
        RLC     R3,     2                       ; 5F60   0057
        PSHR    R5                              ; 5F61   0275
        MVI     G_0184, R3                      ; 5F62   0283 0184
        ANDI    #$0001, R3                      ; 5F64   03BB 0001
        BEQ     L_5FFE                          ; 5F66   0204 0096

        TSTR    R0                              ; 5F68   0080
        BMI     L_5FF9                          ; 5F69   020B 008E

        MVI     G_0172, R2                      ; 5F6B   0282 0172
        CMPI    #$003C, R2                      ; 5F6D   037A 003C
        BGT     L_5F74                          ; 5F6F   020E 0003
        J       G_4DE0                          ; 5F71   0004 034C 01E0

L_5F74:
        MVI     G_0186, R2                      ; 5F74   0282 0186
        CMPI    #$00F0, R2                      ; 5F76   037A 00F0
        BLT     L_5FCF                          ; 5F78   0205 0055

        CMPI    #$00FE, R2                      ; 5F7A   037A 00FE
        BEQ     L_5FAA                          ; 5F7C   0204 002C

        CMPI    #$00FD, R2                      ; 5F7E   037A 00FD
        BEQ     L_5FB6                          ; 5F80   0204 0034

        PULR    R7                              ; 5F82   02B7
L_5F83:
        CMPI    #$0001, R0                      ; 5F83   0378 0001
        BNEQ    L_5FA9                          ; 5F85   020C 0022

        JSR     R5,     L_6011                  ; 5F87   0004 0160 0011
        JSR     R5,     L_5653                  ; 5F8A   0004 0154 0253
        JSR     R5,     L_5668                  ; 5F8D   0004 0154 0268

        CLRR    R0                              ; 5F90   01C0
        MVO     R0,     G_016E                  ; 5F91   0240 016E
        SDBD                                    ; 5F93   0001
        MVII    #$3201, R3                      ; 5F94   02BB 0001 0032
        MVII    #$0217, R4                      ; 5F97   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 5F99   0004 0118 007B

        RLC     R0,     1                       ; 5F9C   0050
        SLL     R0,     2                       ; 5F9D   004C
        SWAP    R1,     1                       ; 5F9E   0041
        SLLC    R1,     1                       ; 5F9F   0059
        SWAP    R1,     2                       ; 5FA0   0045
        RLC     R2,     1                       ; 5FA1   0052
        RLC     R3,     1                       ; 5FA2   0053
        RSWD    R2                              ; 5FA3   003A
        DECLE   $0000                           ; 5FA4   0000

        MVII    #$00FE, R0                      ; 5FA5   02B8 00FE
        MVO     R0,     G_0186                  ; 5FA7   0240 0186
L_5FA9:
        PULR    R7                              ; 5FA9   02B7
L_5FAA:
        MVII    #$0005, R0                      ; 5FAA   02B8 0005
        MVO     R0,     G_0185                  ; 5FAC   0240 0185
        MVII    #$0020, R0                      ; 5FAE   02B8 0020
        MVO     R0,     G_0194                  ; 5FB0   0240 0194
        MVII    #$0001, R0                      ; 5FB2   02B8 0001
        MVO     R0,     G_0184                  ; 5FB4   0240 0184

L_5FB6:
        JSR     R5,     G_4D81                  ; 5FB6   0004 014C 0181

        CLRR    R0                              ; 5FB9   01C0
        MVO     R0,     G_0186                  ; 5FBA   0240 0186
        PULR    R7                              ; 5FBC   02B7
        PSHR    R5                              ; 5FBD   0275
        MVI     G_0184, R2                      ; 5FBE   0282 0184
        MOVR    R2,     R5                      ; 5FC0   0095
        ANDI    #$0002, R5                      ; 5FC1   03BD 0002
        BEQ     L_5FCD                          ; 5FC3   0204 0008

        ANDI    #$0004, R2                      ; 5FC5   03BA 0004
        SLR     R2,     2                       ; 5FC7   0066
        XORR    R1,     R2                      ; 5FC8   01CA
        MVII    #$00FF, R2                      ; 5FC9   02BA 00FF
        BNEQ    L_5FCE                          ; 5FCB   020C 0001

L_5FCD:
        CLRR    R2                              ; 5FCD   01D2
L_5FCE:
        PULR    R7                              ; 5FCE   02B7

L_5FCF:
        JSR     R5,     L_57BD                  ; 5FCF   0004 0154 03BD

        TSTR    R2                              ; 5FD2   0092
        BNEQ    L_5FFE                          ; 5FD3   020C 0029

        MVI     G_0330, R4                      ; 5FD5   0284 0330
        TSTR    R4                              ; 5FD7   00A4
        BEQ     L_5FFE                          ; 5FD8   0204 0024

        MVII    #$0038, R1                      ; 5FDA   02B9 0038
        SDBD                                    ; 5FDC   0001
        CMPI    #$6295, R4                      ; 5FDD   037C 0095 0062
        BEQ     L_5FEF                          ; 5FE0   0204 000D

        SDBD                                    ; 5FE2   0001
        CMPI    #$62E7, R4                      ; 5FE3   037C 00E7 0062
        BNEQ    L_5FFE                          ; 5FE6   020C 0016

        MVI     G_01C0, R4                      ; 5FE8   0284 01C0
        TSTR    R4                              ; 5FEA   00A4
        BNEQ    L_5FFE                          ; 5FEB   020C 0011

        MVII    #$0028, R1                      ; 5FED   02B9 0028

L_5FEF:
        JSR     R5,     G_4BFF                  ; 5FEF   0004 0148 03FF

        MVII    #$0126, R3                      ; 5FF2   02BB 0126

        JSR     R5,     G_4C41                  ; 5FF4   0004 014C 0041

        B       L_5FFE                          ; 5FF7   0200 0005

L_5FF9:
        MVII    #$0126, R3                      ; 5FF9   02BB 0126

        JSR     R5,     G_4C3F                  ; 5FFB   0004 014C 003F

L_5FFE:
        PULR    R7                              ; 5FFE   02B7
        PSHR    R5                              ; 5FFF   0275
        MVII    #$0001, R3                      ; 6000   02BB 0001
        B       L_6006                          ; 6002   0200 0002

        PSHR    R5                              ; 6004   0275
        CLRR    R3                              ; 6005   01DB
L_6006:
        MVI     G_0184, R4                      ; 6006   0284 0184
        ANDI    #$0001, R4                      ; 6008   03BC 0001
        BEQ     L_60AA                          ; 600A   0204 009E

        MVI     G_0186, R4                      ; 600C   0284 0186
        CMPI    #$00F0, R4                      ; 600E   037C 00F0
        BGE     L_60AA                          ; 6010   020D 0098

        JSR     R5,     L_57BD                  ; 6012   0004 0154 03BD

        TSTR    R2                              ; 6015   0092
        BNEQ    L_60AA                          ; 6016   020C 0092

        MOVR    R3,     R1                      ; 6018   0099
        MVI     G_0184, R2                      ; 6019   0282 0184
        ANDI    #$0001, R2                      ; 601B   03BA 0001
        BEQ     L_60AA                          ; 601D   0204 008B

        CMPI    #$0001, R0                      ; 601F   0378 0001
        BNEQ    L_60AA                          ; 6021   020C 0087

        PSHR    R1                              ; 6023   0271
        MVII    #$0001, R0                      ; 6024   02B8 0001
        MVII    #$0402, R1                      ; 6026   02B9 0002 0004
L_6029:
        CMPR    R4,     R0                      ; 6029   0160
        SUBR    R1,     R7                      ; 602A   010F
        PULR    R1                              ; 602B   02B1
        TSTR    R3                              ; 602C   009B
        BEQ     L_60AA                          ; 602D   0204 007B

        SDBD                                    ; 602F   0001
        MVII    #$6295, R0                      ; 6030   02B8 0095 0062
L_6033:
        CMP     G_0330, R0                      ; 6033   0340 0330
        BNEQ    L_6063                          ; 6035   020C 002C

        SDBD                                    ; 6037   0001
        MVII    #$6183, R4                      ; 6038   02BC 0083 0061
        PSHR    R1                              ; 603B   0271
        PSHR    R3                              ; 603C   0273

L_603D:
        JSR     R5,     G_4BC3                  ; 603D   0004 0148 03C3

        PULR    R3                              ; 6040   02B3
        PULR    R1                              ; 6041   02B1
        SDBD                                    ; 6042   0001
        MVII    #$099E, R0                      ; 6043   02B8 009E 0009
        TSTR    R1                              ; 6046   0089
        BNEQ    L_604D                          ; 6047   020C 0004

        SDBD                                    ; 6049   0001
        MVII    #$090C, R0                      ; 604A   02B8 000C 0009
L_604D:
        MVO@    R0,     R3                      ; 604D   0258
        MOVR    R3,     R4                      ; 604E   009C
L_604F:
        MVII    #$003C, R1                      ; 604F   02B9 003C
        MVI     G_0318, R2                      ; 6051   0282 0318
        ANDI    #$00FF, R2                      ; 6053   03BA 00FF
        MVI     G_0320, R3                      ; 6055   0283 0320
        ANDI    #$007F, R3                      ; 6057   03BB 007F

        JSR     R5,     G_4C59                  ; 6059   0004 014C 0059
        JSR     R5,     G_4B9A                  ; 605C   0004 0148 039A

        MOVR    R2,     R5                      ; 605F   0095
        SLLC    R1,     2                       ; 6060   005D
        B       L_60AA                          ; 6061   0200 0047

L_6063:
        MVI     G_0184, R0                      ; 6063   0280 0184
        ANDI    #$0008, R0                      ; 6065   03B8 0008
        BEQ     L_60AA                          ; 6067   0204 0041

        PSHR    R0                              ; 6069   0270
L_606A:
        SDBD                                    ; 606A   0001
        MVII    #$62E7, R0                      ; 606B   02B8 00E7 0062
        CMP     G_0330, R0                      ; 606E   0340 0330
        PULR    R0                              ; 6070   02B0
        BNEQ    L_60AA                          ; 6071   020C 0037

        SDBD                                    ; 6073   0001
        MVII    #$6217, R4                      ; 6074   02BC 0017 0062
        PSHR    R1                              ; 6077   0271
L_6078:
        PSHR    R3                              ; 6078   0273

        JSR     R5,     G_4BC3                  ; 6079   0004 0148 03C3

L_607C:
        PULR    R3                              ; 607C   02B3
        PULR    R1                              ; 607D   02B1
L_607E:
        MOVR    R3,     R2                      ; 607E   009A
        ADDI    #$0008, R2                      ; 607F   02FA 0008
        MVI     G_0320, R0                      ; 6081   0280 0320
        ANDI    #$007F, R0                      ; 6083   03B8 007F
        TSTR    R1                              ; 6085   0089
        BEQ     L_608C                          ; 6086   0204 0004

        SDBD                                    ; 6088   0001
        ADDI    #$0400, R0                      ; 6089   02F8 0000 0004
L_608C:
        MVO@    R0,     R2                      ; 608C   0250
L_608D:
        MVI     G_0318, R0                      ; 608D   0280 0318
        SDBD                                    ; 608F   0001
        ANDI    #$FBFF, R0                      ; 6090   03B8 00FF 00FB
        SDBD                                    ; 6093   0001
        MVII    #$FFC4, R2                      ; 6094   02BA 00C4 00FF
        TSTR    R1                              ; 6097   0089
        BEQ     L_609E                          ; 6098   0204 0004

        MVII    #$003C, R2                      ; 609A   02BA 003C
        ADDI    #$0006, R0                      ; 609C   02F8 0006
L_609E:
        MVO@    R0,     R3                      ; 609E   0258
        SUBI    #$0318, R3                      ; 609F   033B 0318
        SLL     R3,     1                       ; 60A1   004B
        ADDI    #$0126, R3                      ; 60A2   02FB 0126
        MVO@    R2,     R3                      ; 60A4   025A

        JSR     R5,     G_4B9A                  ; 60A5   0004 0148 039A

L_60A8:
        SLL     R1,     2                       ; 60A8   004D
        SLLC    R2,     2                       ; 60A9   005E
L_60AA:
        PULR    R7                              ; 60AA   02B7
        PSHR    R5                              ; 60AB   0275
        MVI     G_0172, R4                      ; 60AC   0284 0172
        CMPI    #$00FF, R4                      ; 60AE   037C 00FF
        BNEQ    L_60AA                          ; 60B0   022C 0007

        MVI     G_0184, R2                      ; 60B2   0282 0184
        ANDI    #$0001, R2                      ; 60B4   03BA 0001
        BNEQ    L_60BE                          ; 60B6   020C 0006

L_60B8:
        CMPI    #$0003, R0                      ; 60B8   0378 0003
        BNEQ    L_60D0                          ; 60BA   020C 0014
        B       L_60D6                          ; 60BC   0200 0018

L_60BE:
        MVI     G_0186, R2                      ; 60BE   0282 0186
        CMPI    #$00F0, R2                      ; 60C0   037A 00F0
        BLT     L_6184                          ; 60C2   0205 00C0

        CMPI    #$00FF, R2                      ; 60C4   037A 00FF
        BEQ     L_5F83                          ; 60C6   0224 0144

        CMPI    #$00FE, R2                      ; 60C8   037A 00FE
L_60CA:
        BEQ     L_60D9                          ; 60CA   0204 000D

        CMPI    #$00FC, R2                      ; 60CC   037A 00FC
        BEQ     L_6115                          ; 60CE   0204 0045

L_60D0:
        JSR     R5,     G_4B9E                  ; 60D0   0004 0148 039E

        MOVR    R6,     R5                      ; 60D3   00B5
        SLR     R0,     1                       ; 60D4   0060
        PULR    R7                              ; 60D5   02B7
L_60D6:
        J       X_RESET                         ; 60D6   0004 0310 0000

L_60D9:
        MVII    #$0001, R1                      ; 60D9   02B9 0001
        CMPI    #$0007, R0                      ; 60DB   0378 0007
        BEQ     L_60ED                          ; 60DD   0204 000E

        CMPI    #$0009, R0                      ; 60DF   0378 0009
        BNEQ    L_60D0                          ; 60E1   022C 0012

        MVI     G_0184, R3                      ; 60E3   0283 0184
        ANDI    #$00F9, R3                      ; 60E5   03BB 00F9
        ADDI    #$0006, R3                      ; 60E7   02FB 0006
L_60E9:
        MVO     R3,     G_0184                  ; 60E9   0243 0184
        MVII    #$0002, R1                      ; 60EB   02B9 0002
L_60ED:
        MVO     R1,     G_0185                  ; 60ED   0241 0185
        SDBD                                    ; 60EF   0001
        MVII    #$3201, R3                      ; 60F0   02BB 0001 0032
        MVII    #$0220, R4                      ; 60F3   02BC 0220
        MOVR    R1,     R0                      ; 60F5   0088
        MVII    #$0001, R1                      ; 60F6   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 60F8   0004 0118 00C5

        SDBD                                    ; 60FB   0001
        MVII    #$3201, R3                      ; 60FC   02BB 0001 0032
        MVII    #$023F, R4                      ; 60FF   02BC 023F

L_6101:
        JSR     R5,     X_PRINT_R5              ; 6101   0004 0118 007B

        SLL     R0,     2                       ; 6104   004C
        SWAP    R1,     2                       ; 6105   0045
        RLC     R2,     2                       ; 6106   0056
        SWAP    R1,     2                       ; 6107   0045
L_6108:
        SLL     R0,     2                       ; 6108   004C
        RSWD    R2                              ; 6109   003A
        DECLE   $0000                           ; 610A   0000

        MVII    #$00FC, R0                      ; 610B   02B8 00FC
        MVO     R0,     G_0186                  ; 610D   0240 0186

L_610F:
        JSR     R5,     G_4B9E                  ; 610F   0004 0148 039E

        MOVR    R1,     R2                      ; 6112   008A
        SLR     R0,     1                       ; 6113   0060
        PULR    R7                              ; 6114   02B7
L_6115:
        MVII    #$0010, R2                      ; 6115   02BA 0010
        SDBD                                    ; 6117   0001
        MVII    #$5973, R1                      ; 6118   02B9 0073 0059
        CLRR    R3                              ; 611B   01DB
        CMPI    #$0004, R0                      ; 611C   0378 0004
        BEQ     L_613E                          ; 611E   0204 001E

        MVII    #$0018, R2                      ; 6120   02BA 0018
        SDBD                                    ; 6122   0001
        MVII    #$5978, R1                      ; 6123   02B9 0078 0059
        MVII    #$0002, R3                      ; 6126   02BB 0002
        CMPI    #$0005, R0                      ; 6128   0378 0005
        BEQ     L_613E                          ; 612A   0204 0012

        MVII    #$0020, R2                      ; 612C   02BA 0020
        SDBD                                    ; 612E   0001
        MVII    #$597F, R1                      ; 612F   02B9 007F 0059
        MVII    #$0004, R3                      ; 6132   02BB 0004
        CMPI    #$0006, R0                      ; 6134   0378 0006
        BEQ     L_613E                          ; 6136   0204 0006

        JSR     R5,     G_4B9E                  ; 6138   0004 0148 039E

        MOVR    R6,     R5                      ; 613B   00B5
        SLR     R0,     1                       ; 613C   0060
        PULR    R7                              ; 613D   02B7
L_613E:
        MVO     R2,     G_0194                  ; 613E   0242 0194
        MVI     G_0185, R0                      ; 6140   0280 0185
        ADDR    R3,     R0                      ; 6142   00D8
        MVO     R0,     G_0185                  ; 6143   0240 0185
        SDBD                                    ; 6145   0001
        MVII    #$3201, R3                      ; 6146   02BB 0001 0032
        MVII    #$0246, R4                      ; 6149   02BC 0246

        JSR     R5,     X_PRINT_R1              ; 614B   0004 0118 0067

        MVII    #$00FD, R0                      ; 614E   02B8 00FD
        MVO     R0,     G_0186                  ; 6150   0240 0186
        MVII    #$0265, R4                      ; 6152   02BC 0265
        SDBD                                    ; 6154   0001
        MVII    #$3201, R3                      ; 6155   02BB 0001 0032

        JSR     R5,     X_PRINT_R5              ; 6158   0004 0118 007B

        SLL     R0,     1                       ; 615B   0048
        SLL     R1,     1                       ; 615C   0049
        RLC     R0,     2                       ; 615D   0054
        NEGR    R0                              ; 615E   0020
        SWAP    R0,     2                       ; 615F   0044
        SLL     R1,     1                       ; 6160   0049
        RLC     R3,     1                       ; 6161   0053
        SLL     R3,     1                       ; 6162   004B
        NEGR    R0                              ; 6163   0020
        RLC     R0,     2                       ; 6164   0054
        SLL     R3,     2                       ; 6165   004F
        NEGR    R0                              ; 6166   0020
        RLC     R3,     1                       ; 6167   0053
        RLC     R0,     2                       ; 6168   0054
        SWAP    R1,     1                       ; 6169   0041
        RLC     R2,     1                       ; 616A   0052
        RLC     R0,     2                       ; 616B   0054
        DECLE   $0000                           ; 616C   0000

        JSR     R5,     G_4B9E                  ; 616D   0004 0148 039E

        MOVR    R1,     R2                      ; 6170   008A
        SLR     R0,     1                       ; 6171   0060
        PULR    R7                              ; 6172   02B7
        SWAP    R1,     2                       ; 6173   0045
        SWAP    R1,     1                       ; 6174   0041
        RLC     R3,     1                       ; 6175   0053
        SLLC    R1,     1                       ; 6176   0059
        DECLE   $0000                           ; 6177   0000

        SLL     R1,     2                       ; 6178   004D
        SWAP    R1,     2                       ; 6179   0045
        SWAP    R0,     2                       ; 617A   0044
        SLL     R1,     1                       ; 617B   0049
        RLC     R1,     2                       ; 617C   0055
        SLL     R1,     2                       ; 617D   004D
        DECLE   $0000                           ; 617E   0000

        SLL     R0,     1                       ; 617F   0048
        SWAP    R1,     1                       ; 6180   0041
        RLC     R2,     1                       ; 6181   0052
        SWAP    R0,     2                       ; 6182   0044
        DECLE   $0000                           ; 6183   0000
L_6184:
        TSTR    R0                              ; 6184   0080
        BNEQ    L_61C1                          ; 6185   020C 003A

        MVI     G_0184, R0                      ; 6187   0280 0184
        ANDI    #$0008, R0                      ; 6189   03B8 0008
        BNEQ    L_61C1                          ; 618B   020C 0034

        JSR     R5,     L_57BD                  ; 618D   0004 0154 03BD

        TSTR    R2                              ; 6190   0092
        BNEQ    L_61C6                          ; 6191   020C 0033

        MVI     G_0198, R2                      ; 6193   0282 0198
        TSTR    R2                              ; 6195   0092
        BNEQ    L_61C1                          ; 6196   020C 0029

        JSR     R5,     G_4B9E                  ; 6198   0004 0148 039E

        MOVR    R1,     R2                      ; 619B   008A
        SLR     R0,     1                       ; 619C   0060
        MVII    #$0318, R3                      ; 619D   02BB 0318
        SDBD                                    ; 619F   0001
        MVII    #$6175, R4                      ; 61A0   02BC 0075 0061

        JSR     R5,     G_4BC3                  ; 61A3   0004 0148 03C3
        JSR     R5,     L_573D                  ; 61A6   0004 0154 033D

        MVI     G_0184, R2                      ; 61A9   0282 0184
        ANDI    #$00E7, R2                      ; 61AB   03BA 00E7
        ADDI    #$0008, R2                      ; 61AD   02FA 0008
        MVO     R2,     G_0184                  ; 61AF   0242 0184
        MVII    #$0014, R1                      ; 61B1   02B9 0014
        MVII    #$0048, R2                      ; 61B3   02BA 0048
        MVII    #$0037, R3                      ; 61B5   02BB 0037
        MVII    #$0318, R4                      ; 61B7   02BC 0318

        JSR     R5,     G_4C59                  ; 61B9   0004 014C 0059

        MVII    #$0002, R0                      ; 61BC   02B8 0002
        MVO     R0,     G_01C0                  ; 61BE   0240 01C0
        PULR    R7                              ; 61C0   02B7

L_61C1:
        JSR     R5,     G_4B9E                  ; 61C1   0004 0148 039E

        MOVR    R6,     R5                      ; 61C4   00B5
        SLR     R0,     1                       ; 61C5   0060
L_61C6:
        PULR    R7                              ; 61C6   02B7
        PSHR    R5                              ; 61C7   0275
        MVI     G_01A2, R0                      ; 61C8   0280 01A2
        CMPI    #$00FF, R0                      ; 61CA   0378 00FF
        BNEQ    L_6213                          ; 61CC   020C 0045

        MVII    #$008C, R0                      ; 61CE   02B8 008C
        MVII    #$0200, R4                      ; 61D0   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 61D2   0004 0114 0338

        MVI     G_0193, R0                      ; 61D5   0280 0193
L_61D7:
        INCR    R0                              ; 61D7   0008
        MVO     R0,     G_0193                  ; 61D8   0240 0193
        CMPI    #$0002, R0                      ; 61DA   0378 0002
        BLT     L_61E9                          ; 61DC   0205 000B
        BEQ     L_61F6                          ; 61DE   0204 0016

        CMPI    #$0004, R0                      ; 61E0   0378 0004
        BMI     L_6208                          ; 61E2   020B 0024

        CLRR    R0                              ; 61E4   01C0
        MVO     R0,     G_0193                  ; 61E5   0240 0193
        B       L_61F6                          ; 61E7   0200 000D

L_61E9:
        SDBD                                    ; 61E9   0001
        MVII    #$5A8D, R3                      ; 61EA   02BB 008D 005A
        SDBD                                    ; 61ED   0001
        MVII    #$5A25, R4                      ; 61EE   02BC 0025 005A

        JSR     R5,     L_5A14                  ; 61F1   0004 0158 0214

        B       L_6213                          ; 61F4   0200 001D

L_61F6:
        SDBD                                    ; 61F6   0001
        MVII    #$5AB5, R3                      ; 61F7   02BB 00B5 005A
        SDBD                                    ; 61FA   0001
        MVII    #$5A3D, R4                      ; 61FB   02BC 003D 005A

        JSR     R5,     L_5A14                  ; 61FE   0004 0158 0214

        CLRR    R0                              ; 6201   01C0
        MVO     R0,     .BTAB.8E                ; 6202   0240 028E
        MVO     R0,     .BTAB.9D                ; 6204   0240 029D
        B       L_6213                          ; 6206   0200 000B

L_6208:
        SDBD                                    ; 6208   0001
        MVII    #$5AE5, R3                      ; 6209   02BB 00E5 005A
        SDBD                                    ; 620C   0001
        MVII    #$5A65, R4                      ; 620D   02BC 0065 005A

        JSR     R5,     L_5A14                  ; 6210   0004 0158 0214

L_6213:
        PULR    R7                              ; 6213   02B7
        PSHR    R5                              ; 6214   0275
        MOVR    R3,     R5                      ; 6215   009D
L_6216:
        SDBD                                    ; 6216   0001
        MVI@    R4,     R0                      ; 6217   02A0
        SDBD                                    ; 6218   0001
        MVI@    R4,     R1                      ; 6219   02A1
        TSTR    R1                              ; 621A   0089
        BEQ     L_6224                          ; 621B   0204 0007

L_621D:
        MVI@    R5,     R3                      ; 621D   02AB
        MVO@    R0,     R3                      ; 621E   0258
        DECR    R1                              ; 621F   0011
        BNEQ    L_621D                          ; 6220   022C 0004
        B       L_6216                          ; 6222   0220 000D

L_6224:
        PULR    R7                              ; 6224   02B7
        DECLE   $0000                           ; 6225   0000

        NEGR    R4                              ; 6226   0024
        COMR    R0                              ; 6227   0018
        DECLE   $0000                           ; 6228   0000

        RRC     R0,     1                       ; 6229   0070
        ADCR    R4                              ; 622A   002C

        JSR     R4,     G_0048                  ; 622B   0004 0000 0048

        ADCR    R4                              ; 622E   002C

        JSR     R4,     G_00A8                  ; 622F   0004 0000 00A8

        ADCR    R4                              ; 6232   002C

        JSR     R4,     G_0098                  ; 6233   0004 0000 0098

        ADCR    R4                              ; 6236   002C

        JSR     R4,     .STIC.X.0               ; 6237   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 623A   0000 0000 0000 0000

        NEGR    R4                              ; 623E   0024
        DECR    R2                              ; 623F   0012
        DECLE   $0000                           ; 6240   0000

        RRC     R2,     2                       ; 6241   0076
        INCR    R0                              ; 6242   0008
        DIS                                     ; 6243   0003
        DECLE   $0000                           ; 6244   0000

        SLL     R2,     2                       ; 6245   004E
        INCR    R0                              ; 6246   0008

        JSR     R4,     G_0056                  ; 6247   0004 0000 0056

        INCR    R0                              ; 624A   0008
        SETC                                    ; 624B   0007
        DECLE   $0000                           ; 624C   0000

        SWAP    R2,     2                       ; 624D   0046
        INCR    R0                              ; 624E   0008
        DECLE   $0001,  $0000                   ; 624F   0001 0000

        MOVR    R5,     R6                      ; 6251   00AE
        INCR    R0                              ; 6252   0008
        DIS                                     ; 6253   0003
        DECLE   $0000                           ; 6254   0000

        MOVR    R3,     R6                      ; 6255   009E
        INCR    R0                              ; 6256   0008

        JSR     R4,     G_0096                  ; 6257   0004 0000 0096

        INCR    R0                              ; 625A   0008
        SETC                                    ; 625B   0007
        DECLE   $0000                           ; 625C   0000

        MOVR    R0,     R6                      ; 625D   0086
        INCR    R0                              ; 625E   0008
        DECLE   $0001,  $0000,  $0000,  $0000   ; 625F   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6263   0000 0000 0000

        NEGR    R4                              ; 6266   0024
        NEGR    R2                              ; 6267   0022
        DECLE   $0000                           ; 6268   0000

        RLC     R0,     1                       ; 6269   0050
        ADCR    R4                              ; 626A   002C
        DECLE   $0005,  $0000                   ; 626B   0005 0000

        DECR    R6                              ; 626D   0016
        INCR    R1                              ; 626E   0009
        CLRC                                    ; 626F   0006
        DECLE   $0000                           ; 6270   0000

        ADDR    R7,     R6                      ; 6271   00FE
        INCR    R0                              ; 6272   0008
        CLRC                                    ; 6273   0006
        DECLE   $0000                           ; 6274   0000

        ADDR    R5,     R6                      ; 6275   00EE
        INCR    R0                              ; 6276   0008
        DECLE   $0001,  $0000                   ; 6277   0001 0000

        MOVR    R2,     R0                      ; 6279   0090
        ADCR    R4                              ; 627A   002C
        DECLE   $0005,  $0000                   ; 627B   0005 0000

        ADDR    R4,     R6                      ; 627D   00E6
        INCR    R0                              ; 627E   0008
        CLRC                                    ; 627F   0006
        DECLE   $0000                           ; 6280   0000

        ADDR    R1,     R6                      ; 6281   00CE
        INCR    R0                              ; 6282   0008
        CLRC                                    ; 6283   0006
        DECLE   $0000                           ; 6284   0000

        ADDR    R2,     R6                      ; 6285   00D6
        INCR    R0                              ; 6286   0008
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6287   0001 0000 0000 0000
        DECLE   $0000,  $0000                   ; 628B   0000 0000

        BC      L_6491                          ; 628D   0201 0202
        BPL     L_64A6                          ; 628F   0203 0215

        DECLE   $0216,  $0217                   ; 6291   0216 0217

        BNC     L_606A                          ; 6293   0229 022A

        DECLE   $023D,  $023E                   ; 6295   023D 023E

        MVO@    R1,     R2                      ; 6297   0251
        MVO@    R5,     R4                      ; 6298   0265
        DECLE   $0210,  $0211,  $0212           ; 6299   0210 0211 0212

        BEQ     L_6078                          ; 629C   0224 0225
        BLE     L_6066                          ; 629E   0226 0239

        DECLE   $023A                           ; 62A0   023A

        MVO@    R5,     R1                      ; 62A1   024D
        MVO@    R6,     R1                      ; 62A2   024E
        MVO@    R2,     R4                      ; 62A3   0262
        PSHR    R6                              ; 62A4   0276
        MVI@    R1,     R5                      ; 62A5   028D
        MVO@    R6,     R4                      ; 62A6   0266
        DECLE   $023F,  $0218,  $0279           ; 62A7   023F 0218 0279

        MVO@    R2,     R2                      ; 62AA   0252
        BMI     L_60A8                          ; 62AB   022B 0204

        MVI@    R3,     R6                      ; 62AD   029E
        PSHR    R5                              ; 62AE   0275
        MVO@    R4,     R1                      ; 62AF   024C
        BPL     L_6027                          ; 62B0   0223 028A

        MVO@    R1,     R4                      ; 62B2   0261
        DECLE   $0238                           ; 62B3   0238

        BESC    L_64BB                          ; 62B4   020F 0205
        BLE     L_64BF                          ; 62B6   0206 0207

        DECLE   $0219,  $021A                   ; 62B8   0219 021A

        BNEQ    L_608E                          ; 62BA   022C 022D

        MVO     R0,     .BTAB.53                ; 62BC   0240 0253
        BNEQ    L_64CD                          ; 62BE   020C 020D
        BGT     L_64E3                          ; 62C0   020E 0221
        BOV     L_608D                          ; 62C2   0222 0236

        DECLE   $0237                           ; 62C4   0237

        MVO@    R3,     R1                      ; 62C5   024B
        MVO@    R0,     R4                      ; 62C6   0260
        MVO@    R6,     R4                      ; 62C7   0266
        DECLE   $023F,  $0218,  $0279           ; 62C8   023F 0218 0279

        MVO@    R2,     R2                      ; 62CB   0252
        BMI     L_60C9                          ; 62CC   022B 0204

        DECLE   $027A                           ; 62CE   027A

        MVO@    R7,     R4                      ; 62CF   0267
        MVO@    R4,     R2                      ; 62D0   0254
        MVO     R1,     .BTAB.2E                ; 62D1   0241 022E
        DECLE   $021B                           ; 62D3   021B

        SKIP                                    ; 62D4   0208
        MVI@    R1,     R5                      ; 62D5   028D
        PSHR    R5                              ; 62D6   0275
        MVO@    R4,     R1                      ; 62D7   024C
        BPL     L_604F                          ; 62D8   0223 028A

        MVO@    R1,     R4                      ; 62DA   0261
        DECLE   $0238                           ; 62DB   0238

        BESC    L_6567                          ; 62DC   020F 0289

        PSHR    R4                              ; 62DE   0274
        MVO@    R7,     R3                      ; 62DF   025F
        MVO@    R2,     R1                      ; 62E0   024A
        DECLE   $0235                           ; 62E1   0235

        B       L_60D8                          ; 62E2   0220 020B

        MVI@    R3,     R6                      ; 62E4   029E
        BNC     L_64F1                          ; 62E5   0209 020A
        BMI     L_64F5                          ; 62E7   020B 020C
        BGE     L_64F9                          ; 62E9   020D 020E

        DECLE   $021C,  $021D,  $021E,  $021F   ; 62EB   021C 021D 021E 021F

        B       L_60C1                          ; 62EF   0220 022F

        DECLE   $0230,  $0231,  $0232           ; 62F1   0230 0231 0232

        MVO     R2,     .BTAB.43                ; 62F4   0242 0243
        MVO     R4,     .BTAB.55                ; 62F6   0244 0255
        MVO@    R6,     R2                      ; 62F8   0256
        MVO@    R0,     R5                      ; 62F9   0268
        BLT     L_6502                          ; 62FA   0205 0206
        BUSC    L_6506                          ; 62FC   0207 0208

        DECLE   $0233,  $0234                   ; 62FE   0233 0234

        MVO     R7,     .BTAB.48                ; 6300   0247 0248
        MVO@    R1,     R1                      ; 6302   0249
        MVO@    R5,     R3                      ; 6303   025D
        MVO@    R6,     R3                      ; 6304   025E
        PSHR    R3                              ; 6305   0273
        DECLE   $021B,  $027A                   ; 6306   021B 027A

        MVO@    R7,     R4                      ; 6308   0267
        MVO@    R4,     R2                      ; 6309   0254
        MVO     R1,     .BTAB.2E                ; 630A   0241 022E
        MVI@    R1,     R6                      ; 630C   028E
        DECLE   $027C                           ; 630D   027C

        MVO@    R2,     R5                      ; 630E   026A
        MVO@    R0,     R3                      ; 630F   0258
        BOV     L_6101                          ; 6310   0222 0210

        DECLE   $027B                           ; 6312   027B

        MVO@    R1,     R5                      ; 6313   0269
        MVO@    R7,     R2                      ; 6314   0257
        MVO     R5,     .BTAB.21                ; 6315   0245 0221
        BESC    L_65A6                          ; 6317   020F 028D

        MVI@    R1,     R1                      ; 6319   0289
        PSHR    R4                              ; 631A   0274
        MVO@    R7,     R3                      ; 631B   025F
        MVO@    R2,     R1                      ; 631C   024A
        DECLE   $0235                           ; 631D   0235

        BPL     L_6539                          ; 631E   0203 0219

        MVO@    R3,     R3                      ; 6320   025B
        PSHR    R1                              ; 6321   0271
        MVI     .BTAB.9D,R7                     ; 6322   0287 029D
        BEQ     L_6540                          ; 6324   0204 021A

        MVO     R6,     .BTAB.5C                ; 6326   0246 025C
        PSHR    R2                              ; 6328   0272
        MVI@    R1,     R0                      ; 6329   0288
        MVI@    R3,     R6                      ; 632A   029E
        PSHR    R5                              ; 632B   0275
        ADDI    #$0350, R1                      ; 632C   02F9 0350
        MVI@    R1,     R0                      ; 632E   0288
        ANDI    #$0200, R0                      ; 632F   03B8 0200
        BNEQ    L_63A9                          ; 6331   020C 0076

        SUBI    #$01B0, R1                      ; 6333   0339 01B0
        MVI@    R1,     R0                      ; 6335   0288
        TSTR    R0                              ; 6336   0080
        BEQ     L_63A9                          ; 6337   0204 0070

        SUBI    #$01A0, R1                      ; 6339   0339 01A0
        PSHR    R2                              ; 633B   0272
        PSHR    R1                              ; 633C   0271
        PSHR    R2                              ; 633D   0272
        PSHR    R1                              ; 633E   0271
        ADDI    #$01A0, R1                      ; 633F   02F9 01A0
        MVI@    R1,     R0                      ; 6341   0288
        CLRR    R2                              ; 6342   01D2
        MVO@    R2,     R1                      ; 6343   024A
        CMPI    #$0004, R0                      ; 6344   0378 0004
        BNEQ    L_6360                          ; 6346   020C 0018

        MVI     G_031F, R0                      ; 6348   0280 031F
        ADDI    #$0178, R1                      ; 634A   02F9 0178
        MVI@    R1,     R2                      ; 634C   028A
        ANDI    #$00FF, R0                      ; 634D   03B8 00FF
        ANDI    #$00FF, R2                      ; 634F   03BA 00FF
        SUBR    R2,     R0                      ; 6351   0110
        BLT     L_6360                          ; 6352   0205 000C

        CMPI    #$0008, R0                      ; 6354   0378 0008
        BGT     L_6360                          ; 6356   020E 0008

        MVII    #$0007, R3                      ; 6358   02BB 0007

        JSR     R5,     L_60CA                  ; 635A   0004 0160 00CA

        CLRR    R0                              ; 635D   01C0
        MVO     R0,     G_0347                  ; 635E   0240 0347
L_6360:
        MVI     G_018C, R1                      ; 6360   0281 018C

        JSR     R5,     L_5C78                  ; 6362   0004 015C 0078
        JSR     R5,     L_5CD5                  ; 6365   0004 015C 00D5

        PULR    R1                              ; 6368   02B1
        PULR    R2                              ; 6369   02B2
        MVII    #$0318, R3                      ; 636A   02BB 0318
        ADDR    R3,     R1                      ; 636C   00D9
        ADDR    R3,     R2                      ; 636D   00DA
        MVI@    R1,     R0                      ; 636E   0288
        MVI@    R2,     R4                      ; 636F   0294
        ANDI    #$00FF, R0                      ; 6370   03B8 00FF
        SDBD                                    ; 6372   0001
        ANDI    #$FF00, R4                      ; 6373   03BC 0000 00FF
        ADDR    R0,     R4                      ; 6376   00C4
        ADDI    #$0003, R4                      ; 6377   02FC 0003
        MVO@    R4,     R2                      ; 6379   0254
        ADDI    #$0008, R1                      ; 637A   02F9 0008
        ADDI    #$0008, R2                      ; 637C   02FA 0008
        MVI@    R1,     R0                      ; 637E   0288
        MVI@    R2,     R4                      ; 637F   0294
        ANDI    #$007F, R0                      ; 6380   03B8 007F
        SDBD                                    ; 6382   0001
        ANDI    #$FF80, R4                      ; 6383   03BC 0080 00FF
        ADDR    R0,     R4                      ; 6386   00C4
        ADDI    #$0002, R4                      ; 6387   02FC 0002
        MVO@    R4,     R2                      ; 6389   0254
        PULR    R3                              ; 638A   02B3
        MVI     G_01A2, R0                      ; 638B   0280 01A2
        CMPI    #$00FF, R0                      ; 638D   0378 00FF
        SDBD                                    ; 638F   0001
        MVII    #$6241, R4                      ; 6390   02BC 0041 0062
        BEQ     L_6399                          ; 6393   0204 0004

        SDBD                                    ; 6395   0001
        MVII    #$6233, R4                      ; 6396   02BC 0033 0062

L_6399:
        JSR     R5,     L_60E9                  ; 6399   0004 0160 00E9

        PULR    R3                              ; 639C   02B3
        SDBD                                    ; 639D   0001
        MVII    #$624F, R4                      ; 639E   02BC 004F 0062

        JSR     R5,     L_60E9                  ; 63A1   0004 0160 00E9
        JSR     R5,     G_4B9A                  ; 63A4   0004 0148 039A

        ADDR    R0,     R2                      ; 63A7   00C2
        SLLC    R1,     2                       ; 63A8   005D

L_63A9:
        JSR     R5,     L_5273                  ; 63A9   0004 0150 0273

        PULR    R7                              ; 63AC   02B7
        PSHR    R5                              ; 63AD   0275
        MVI     G_0320, R3                      ; 63AE   0283 0320
        CMPI    #$0044, R3                      ; 63B0   037B 0044
        BLT     L_63BF                          ; 63B2   0205 000B

        MVII    #$0126, R3                      ; 63B4   02BB 0126

        JSR     R5,     G_4C3F                  ; 63B6   0004 014C 003F

        MVI     G_0320, R0                      ; 63B9   0280 0320
        SUBI    #$0002, R0                      ; 63BB   0338 0002
        MVO     R0,     G_0320                  ; 63BD   0240 0320
L_63BF:
        PULR    R7                              ; 63BF   02B7
        PSHR    R5                              ; 63C0   0275
        MVI     G_0320, R0                      ; 63C1   0280 0320
        CMPI    #$0008, R0                      ; 63C3   0378 0008
        BLT     L_63CB                          ; 63C5   0205 0004

        CMPI    #$0046, R0                      ; 63C7   0378 0046
        BLT     L_63D2                          ; 63C9   0205 0007

L_63CB:
        MVII    #$0008, R0                      ; 63CB   02B8 0008
        MVO     R0,     G_0320                  ; 63CD   0240 0320
        CLRR    R0                              ; 63CF   01C0
        MVO     R0,     G_0136                  ; 63D0   0240 0136
L_63D2:
        MVI     G_0318, R0                      ; 63D2   0280 0318
        MOVR    R0,     R1                      ; 63D4   0081
        SDBD                                    ; 63D5   0001
        ANDI    #$FF00, R1                      ; 63D6   03B9 0000 00FF
        ANDI    #$00FF, R0                      ; 63D9   03B8 00FF
        CMPI    #$0008, R0                      ; 63DB   0378 0008
        BLT     L_63E3                          ; 63DD   0205 0004

        CMPI    #$00C8, R0                      ; 63DF   0378 00C8
        BLT     L_63E7                          ; 63E1   0205 0004

L_63E3:
        MVII    #$0008, R0                      ; 63E3   02B8 0008
        B       L_63ED                          ; 63E5   0200 0006

L_63E7:
        CMPI    #$009D, R0                      ; 63E7   0378 009D
        BLT     L_63F3                          ; 63E9   0205 0008

        MVII    #$009C, R0                      ; 63EB   02B8 009C
L_63ED:
        ADDR    R1,     R0                      ; 63ED   00C8
        MVO     R0,     G_0318                  ; 63EE   0240 0318
        CLRR    R0                              ; 63F0   01C0
        MVO     R0,     G_0126                  ; 63F1   0240 0126
L_63F3:
        PULR    R7                              ; 63F3   02B7
        PSHR    R5                              ; 63F4   0275
        MOVR    R2,     R3                      ; 63F5   0093
        SDBD                                    ; 63F6   0001
        MVII    #$625D, R4                      ; 63F7   02BC 005D 0062

        JSR     R5,     L_60E9                  ; 63FA   0004 0160 00E9

        PULR    R7                              ; 63FD   02B7
        PSHR    R5                              ; 63FE   0275
        MVI     G_0199, R0                      ; 63FF   0280 0199
        SUBI    #$0005, R0                      ; 6401   0338 0005
        CMPI    #$0001, R0                      ; 6403   0378 0001
        BGE     L_6409                          ; 6405   020D 0002

        MVII    #$0001, R0                      ; 6407   02B8 0001
L_6409:
        MVO     R0,     G_0199                  ; 6409   0240 0199
        CMPI    #$0005, R0                      ; 640B   0378 0005
        BGT     L_6414                          ; 640D   020E 0005

        JSR     R5,     G_4B9E                  ; 640F   0004 0148 039E

        SLL     R2,     1                       ; 6412   004A
        SLR     R0,     1                       ; 6413   0060
L_6414:
        MVI     G_0320, R0                      ; 6414   0280 0320
        MOVR    R0,     R3                      ; 6416   0083
        ADDI    #$0320, R1                      ; 6417   02F9 0320
        MVI@    R1,     R2                      ; 6419   028A
        ADDI    #$0003, R3                      ; 641A   02FB 0003
        ANDI    #$007F, R0                      ; 641C   03B8 007F
        ANDI    #$007F, R2                      ; 641E   03BA 007F
        CMPR    R2,     R0                      ; 6420   0150
        BGT     L_6425                          ; 6421   020E 0002

        SUBI    #$0006, R3                      ; 6423   033B 0006
L_6425:
        MVO     R3,     G_0320                  ; 6425   0243 0320

        JSR     R5,     G_4B9A                  ; 6427   0004 0148 039A

        ADDR    R1,     R0                      ; 642A   00C8
        SLLC    R1,     2                       ; 642B   005D

        JSR     R5,     L_5552                  ; 642C   0004 0154 0152

        PULR    R7                              ; 642F   02B7
        PSHR    R5                              ; 6430   0275
        MVII    #$00FF, R0                      ; 6431   02B8 00FF
        MVO     R0,     G_0171                  ; 6433   0240 0171
        MVO     R0,     G_0198                  ; 6435   0240 0198
        CLRR    R3                              ; 6437   01DB
        SDBD                                    ; 6438   0001
        MVII    #$6279, R4                      ; 6439   02BC 0079 0062

        JSR     R5,     L_60E9                  ; 643C   0004 0160 00E9
        JSR     R5,     G_4B9A                  ; 643F   0004 0148 039A

        ADDR    R0,     R2                      ; 6442   00C2
        SLLC    R1,     2                       ; 6443   005D
        CLRR    R0                              ; 6444   01C0
        MVO     R0,     G_0199                  ; 6445   0240 0199

        JSR     R5,     L_5552                  ; 6447   0004 0154 0152

        PULR    R7                              ; 644A   02B7
        PSHR    R5                              ; 644B   0275
        MVII    #$0318, R3                      ; 644C   02BB 0318
        SDBD                                    ; 644E   0001
        MVII    #$6159, R4                      ; 644F   02BC 0059 0061

        JSR     R5,     G_4BC3                  ; 6452   0004 0148 03C3

        MVI     G_0184, R0                      ; 6455   0280 0184
        ANDI    #$00E7, R0                      ; 6457   03B8 00E7
        MVO     R0,     G_0184                  ; 6459   0240 0184
        CLRR    R0                              ; 645B   01C0
        MVO     R0,     G_01C0                  ; 645C   0240 01C0
        PULR    R7                              ; 645E   02B7
        PSHR    R5                              ; 645F   0275
        MVI     G_01C0, R0                      ; 6460   0280 01C0
        TSTR    R0                              ; 6462   0080
        BNEQ    L_6470                          ; 6463   020C 000B

        MVI     G_0320, R0                      ; 6465   0280 0320
        ANDI    #$007F, R0                      ; 6467   03B8 007F
        CMPI    #$0044, R0                      ; 6469   0378 0044
        BLT     L_6470                          ; 646B   0205 0003

        JSR     R5,     L_5C30                  ; 646D   0004 015C 0030

L_6470:
        PULR    R7                              ; 6470   02B7
        PSHR    R5                              ; 6471   0275
        MVII    #$0126, R3                      ; 6472   02BB 0126

        JSR     R5,     G_4C3F                  ; 6474   0004 014C 003F

        PULR    R7                              ; 6477   02B7
        PSHR    R5                              ; 6478   0275
        PSHR    R3                              ; 6479   0273
        PSHR    R0                              ; 647A   0270
        MVI     G_0184, R0                      ; 647B   0280 0184
        ANDI    #$0020, R0                      ; 647D   03B8 0020
        BNEQ    L_64AC                          ; 647F   020C 002B

        MVI     G_0330, R0                      ; 6481   0280 0330
        SDBD                                    ; 6483   0001
        CMPI    #$62E7, R0                      ; 6484   0378 00E7 0062
        BNEQ    L_648A                          ; 6487   020C 0001

        SLL     R1,     2                       ; 6489   004D
L_648A:
        MVII    #$0186, R3                      ; 648A   02BB 0186
        MVII    #$0189, R5                      ; 648C   02BD 0189
        MVI     G_0184, R0                      ; 648E   0280 0184
        ANDI    #$0004, R0                      ; 6490   03B8 0004
        BEQ     L_6498                          ; 6492   0204 0004

        MVII    #$0189, R3                      ; 6494   02BB 0189
        MVII    #$018C, R5                      ; 6496   02BD 018C
L_6498:
        MVI@    R3,     R0                      ; 6498   0298
        ADDR    R1,     R0                      ; 6499   00C8
        CMPI    #$0064, R0                      ; 649A   0378 0064
        BNC     L_64AB                          ; 649C   0209 000D

        CLRR    R1                              ; 649E   01C9
L_649F:
        INCR    R1                              ; 649F   0009
        SUBI    #$0064, R0                      ; 64A0   0338 0064
        CMPI    #$0064, R0                      ; 64A2   0378 0064
        BC      L_649F                          ; 64A4   0221 0006

L_64A6:
        MVO@    R0,     R3                      ; 64A6   0258
        INCR    R3                              ; 64A7   000B
        CMPR    R5,     R3                      ; 64A8   016B
        BNC     L_6498                          ; 64A9   0229 0012

L_64AB:
        MVO@    R0,     R3                      ; 64AB   0258
L_64AC:
        PULR    R0                              ; 64AC   02B0
        PULR    R3                              ; 64AD   02B3
        PULR    R7                              ; 64AE   02B7
        PSHR    R5                              ; 64AF   0275
        MVI     G_0184, R0                      ; 64B0   0280 0184
        ANDI    #$0020, R0                      ; 64B2   03B8 0020
        BEQ     L_64B7                          ; 64B4   0204 0001

        PULR    R7                              ; 64B6   02B7
L_64B7:
        MVI     G_018F, R3                      ; 64B7   0283 018F
        SWAP    R3,     1                       ; 64B9   0043
        MVI     G_0184, R0                      ; 64BA   0280 0184
        ANDI    #$0004, R0                      ; 64BC   03B8 0004
        BNEQ    L_64C8                          ; 64BE   020C 0008

        CMPI    #$0188, R2                      ; 64C0   037A 0188
        BNEQ    L_64CE                          ; 64C2   020C 000A

        ADDI    #$0001, R3                      ; 64C4   02FB 0001
        B       L_64CE                          ; 64C6   0200 0006

L_64C8:
        CMPI    #$018B, R2                      ; 64C8   037A 018B
        BNEQ    L_64CE                          ; 64CA   020C 0002

        ADDI    #$0001, R3                      ; 64CC   02FB 0001
L_64CE:
        B       L_64F5                          ; 64CE   0200 0025

        PSHR    R5                              ; 64D0   0275
        MVII    #$0006, R3                      ; 64D1   02BB 0006
        B       L_64F5                          ; 64D3   0200 0020

        PSHR    R5                              ; 64D5   0275
        MVI     G_0184, R0                      ; 64D6   0280 0184
        ANDI    #$0020, R0                      ; 64D8   03B8 0020
        BNEQ    L_652D                          ; 64DA   020C 0051

        MVI     G_01A2, R0                      ; 64DC   0280 01A2
        CMPI    #$00FF, R0                      ; 64DE   0378 00FF
        BEQ     L_652D                          ; 64E0   0204 004B

        MVI     G_018F, R3                      ; 64E2   0283 018F
        SWAP    R3,     1                       ; 64E4   0043
        ADDI    #$0001, R3                      ; 64E5   02FB 0001
        MVII    #$0202, R4                      ; 64E7   02BC 0202
        MVII    #$0188, R2                      ; 64E9   02BA 0188
        MVI     G_0184, R0                      ; 64EB   0280 0184
        ANDI    #$0004, R0                      ; 64ED   03B8 0004
        BEQ     L_64F5                          ; 64EF   0204 0004

L_64F1:
        MVII    #$020D, R4                      ; 64F1   02BC 020D
L_64F3:
        MVII    #$018B, R2                      ; 64F3   02BA 018B
L_64F5:
        CLRR    R1                              ; 64F5   01C9
        MVI@    R2,     R0                      ; 64F6   0290
L_64F7:
        TSTR    R0                              ; 64F7   0080
        BEQ     L_6503                          ; 64F8   0204 0009

        MVII    #$0002, R1                      ; 64FA   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 64FC   0004 0118 00C5

        MVII    #$0001, R1                      ; 64FF   02B9 0001
        ADDI    #$1202, R4                      ; 6501   02FC 0002 0012
L_6504:
        MVI@    R2,     R0                      ; 6504   0290
        TSTR    R1                              ; 6505   0089
L_6506:
        BEQ     L_6513                          ; 6506   0204 000B

L_6508:
        MVII    #$0002, R1                      ; 6508   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 650A   0004 0118 00AD

        MVII    #$0001, R1                      ; 650D   02B9 0001
        ADDI    #$0002, R4                      ; 650F   02FC 0002
        B       L_651F                          ; 6511   0200 000C

L_6513:
        TSTR    R0                              ; 6513   0080
        BEQ     L_651F                          ; 6514   0204 0009

        MVII    #$0002, R1                      ; 6516   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6518   0004 0118 00C5

        MVII    #$0001, R1                      ; 651B   02B9 0001
        ADDI    #$1202, R4                      ; 651D   02FC 0002 0012
        MVI@    R2,     R0                      ; 6520   0290
        TSTR    R1                              ; 6521   0089
        MVII    #$0002, R1                      ; 6522   02B9 0002
        BEQ     L_652A                          ; 6524   0204 0004

        JSR     R5,     X_PRNUM_ZRO             ; 6526   0004 0118 00AD

        PULR    R7                              ; 6529   02B7

L_652A:
        JSR     R5,     X_PRNUM_RGT             ; 652A   0004 0118 00C5

L_652D:
        PULR    R7                              ; 652D   02B7
        PSHR    R5                              ; 652E   0275
        MVII    #$0340, R2                      ; 652F   02BA 0340
        ADDR    R3,     R2                      ; 6531   00DA
        MVII    #$0014, R0                      ; 6532   02B8 0014
        MVO@    R0,     R2                      ; 6534   0250
        SLL     R3,     1                       ; 6535   004B
        ADDI    #$0136, R3                      ; 6536   02FB 0136
        MVI@    R3,     R0                      ; 6538   0298
L_6539:
        NEGR    R0                              ; 6539   0020
        MVO@    R0,     R3                      ; 653A   0258
        PULR    R7                              ; 653B   02B7
        PSHR    R5                              ; 653C   0275
        MVI     G_0126, R0                      ; 653D   0280 0126

        JSR     R5,     X_EXT_SIGN_LO           ; 653F   0004 0114 0268

        NEGR    R0                              ; 6542   0020
        MVO     R0,     G_0126                  ; 6543   0240 0126
        MVII    #$0028, R0                      ; 6545   02B8 0028
        MVO     R0,     G_0340                  ; 6547   0240 0340
L_6549:
        PULR    R7                              ; 6549   02B7
        MOVR    R3,     R2                      ; 654A   009A
        MVII    #$005A, R0                      ; 654B   02B8 005A
        B       L_655E                          ; 654D   0200 000F

        MOVR    R3,     R2                      ; 654F   009A
        MVII    #$0020, R0                      ; 6550   02B8 0020
        B       L_655E                          ; 6552   0200 000A

        MOVR    R3,     R2                      ; 6554   009A
        MVII    #$0050, R0                      ; 6555   02B8 0050
        B       L_655E                          ; 6557   0200 0005

        MOVR    R3,     R2                      ; 6559   009A
        MVII    #$0032, R0                      ; 655A   02B8 0032
        B       L_655E                          ; 655C   0200 0000

L_655E:
        ADDI    #$0340, R2                      ; 655E   02FA 0340
        MVO@    R0,     R2                      ; 6560   0250
        PSHR    R5                              ; 6561   0275
        SLL     R3,     1                       ; 6562   004B
        ADDI    #$0136, R3                      ; 6563   02FB 0136
        MVI@    R3,     R0                      ; 6565   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 6566   0004 0114 0268

        NEGR    R0                              ; 6569   0020
        MVO@    R0,     R3                      ; 656A   0258
        PULR    R7                              ; 656B   02B7
        PSHR    R5                              ; 656C   0275
        MOVR    R3,     R2                      ; 656D   009A
        ADDI    #$01A8, R2                      ; 656E   02FA 01A8
        SLL     R3,     1                       ; 6570   004B
        ADDI    #$0126, R3                      ; 6571   02FB 0126
        MVI@    R3,     R0                      ; 6573   0298
        ADD@    R2,     R0                      ; 6574   02D0
        MVO@    R0,     R3                      ; 6575   0258
        ADDI    #$0010, R3                      ; 6576   02FB 0010
        SUBI    #$0004, R2                      ; 6578   033A 0004
        MVI@    R2,     R0                      ; 657A   0290
        CMPI    #$0007, R0                      ; 657B   0378 0007
        BNEQ    L_6582                          ; 657D   020C 0003

        MVI@    R3,     R1                      ; 657F   0299
        NEGR    R1                              ; 6580   0021
        MVO@    R1,     R3                      ; 6581   0259
L_6582:
        INCR    R0                              ; 6582   0008
L_6583:
        CMPI    #$0008, R0                      ; 6583   0378 0008
        BNEQ    L_658E                          ; 6585   020C 0007

        MOVR    R2,     R3                      ; 6587   0093
        ADDI    #$0004, R3                      ; 6588   02FB 0004
        MVI@    R3,     R1                      ; 658A   0299
        NEGR    R1                              ; 658B   0021
        MVO@    R1,     R3                      ; 658C   0259
        CLRR    R0                              ; 658D   01C0
L_658E:
        MVO@    R0,     R2                      ; 658E   0250
        ADDI    #$019C, R2                      ; 658F   02FA 019C
        MVII    #$0005, R0                      ; 6591   02B8 0005
        MVO@    R0,     R2                      ; 6593   0250
        PULR    R7                              ; 6594   02B7
        PSHR    R5                              ; 6595   0275

        JSR     R5,     L_6029                  ; 6596   0004 0160 0029

        ANDI    #$0037, R0                      ; 6599   03B8 0037
        MVO     R0,     .PSG0.chan_enable       ; 659B   0240 01F8

        JSR     R5,     L_6033                  ; 659D   0004 0160 0033

        ANDI    #$0027, R0                      ; 65A0   03B8 0027
        MVO     R0,     .PSG0.chan_enable       ; 65A2   0240 01F8
        CLRR    R0                              ; 65A4   01C0
        MVO     R0,     .PSG0.envlp_hi          ; 65A5   0240 01F7
        INCR    R0                              ; 65A7   0008
        MVO     R0,     .PSG0.noise             ; 65A8   0240 01F9
        MVII    #$00A0, R0                      ; 65AA   02B8 00A0
        MVO     R0,     .PSG0.envlp_lo          ; 65AC   0240 01F3
        MVII    #$000A, R0                      ; 65AE   02B8 000A
        MVO     R0,     .PSG0.envelope          ; 65B0   0240 01FA
        MVII    #$0030, R0                      ; 65B2   02B8 0030
        MVO     R0,     .PSG0.chn_b_vol         ; 65B4   0240 01FC
        MVII    #$000D, R0                      ; 65B6   02B8 000D
        MVO     R0,     .PSG0.chn_a_vol         ; 65B8   0240 01FB
        B       L_6825                          ; 65BA   0200 0269

        MVII    #$0070, R0                      ; 65BC   02B8 0070
        MVO     R0,     .PSG0.envlp_hi          ; 65BE   0240 01F7
        B       L_65CC                          ; 65C0   0200 000A

        MVII    #$0040, R0                      ; 65C2   02B8 0040
        MVO     R0,     .PSG0.envlp_hi          ; 65C4   0240 01F7
        B       L_65CC                          ; 65C6   0200 0004

        MVII    #$0010, R0                      ; 65C8   02B8 0010
L_65CA:
        MVO     R0,     .PSG0.envlp_hi          ; 65CA   0240 01F7
L_65CC:
        PSHR    R5                              ; 65CC   0275

        JSR     R5,     L_6029                  ; 65CD   0004 0160 0029

        ANDI    #$0037, R0                      ; 65D0   03B8 0037
        MVO     R0,     .PSG0.chan_enable       ; 65D2   0240 01F8
        CLRR    R0                              ; 65D4   01C0
        MVO     R0,     .PSG0.noise             ; 65D5   0240 01F9
        MVO     R0,     .PSG0.envelope          ; 65D7   0240 01FA
        MVII    #$0030, R0                      ; 65D9   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 65DB   0240 01FB
        B       L_6825                          ; 65DD   0200 0246

        PSHR    R5                              ; 65DF   0275

        JSR     R5,     L_603D                  ; 65E0   0004 0160 003D

        ANDI    #$003B, R0                      ; 65E3   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 65E5   0240 01F8
        MVII    #$0030, R0                      ; 65E7   02B8 0030
        MVO     R0,     G_01B5                  ; 65E9   0240 01B5
L_65EB:
        MVII    #$0001, R0                      ; 65EB   02B8 0001
        MVO     R0,     .PSG0.chn_c_hi          ; 65ED   0240 01F6
        NEGR    R0                              ; 65EF   0020
        MVO     R0,     .PSG0.chn_c_lo          ; 65F0   0240 01F2
        MVII    #$000D, R0                      ; 65F2   02B8 000D
        MVO     R0,     .PSG0.chn_c_vol         ; 65F4   0240 01FD
        MVII    #$000F, R0                      ; 65F6   02B8 000F
        MVO     R0,     G_0147                  ; 65F8   0240 0147
        INCR    R7                              ; 65FA   000F
        PSHR    R5                              ; 65FB   0275
        MVI     G_01B5, R0                      ; 65FC   0280 01B5
        DECR    R0                              ; 65FE   0010
        BEQ     L_6614                          ; 65FF   0204 0013

        MVO     R0,     G_01B5                  ; 6601   0240 01B5
        MVI     G_0147, R0                      ; 6603   0280 0147
        SLL     R0,     2                       ; 6605   004C
        SLL     R0,     1                       ; 6606   0048
        TSTR    R0                              ; 6607   0080
        BEQ     L_65EB                          ; 6608   0224 001E

        MVO     R0,     .PSG0.chn_c_lo          ; 660A   0240 01F2
        SDBD                                    ; 660C   0001
        MVII    #$5DFB, R0                      ; 660D   02B8 00FB 005D
        MVO@    R0,     R4                      ; 6610   0260
        SWAP    R0,     1                       ; 6611   0040
        MVO@    R0,     R4                      ; 6612   0260
        PULR    R7                              ; 6613   02B7

L_6614:
        JSR     R5,     L_603D                  ; 6614   0004 0160 003D

        B       L_663A                          ; 6617   0200 0021

        PSHR    R5                              ; 6619   0275

        JSR     R5,     L_6033                  ; 661A   0004 0160 0033
        JSR     R5,     L_6029                  ; 661D   0004 0160 0029

        ANDI    #$003E, R0                      ; 6620   03B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 6622   0240 01F8
        MVII    #$0030, R0                      ; 6624   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 6626   0240 01FB
        MVII    #$009A, R0                      ; 6628   02B8 009A
        MVO     R0,     .PSG0.chn_a_lo          ; 662A   0240 01F0
        MVO     R0,     .PSG0.chn_a_hi          ; 662C   0240 01F4
        MVII    #$0008, R0                      ; 662E   02B8 0008
        MVO     R0,     .PSG0.envelope          ; 6630   0240 01FA
        MVO     R0,     .PSG0.envlp_lo          ; 6632   0240 01F3
        CLRR    R0                              ; 6634   01C0
        MVO     R0,     .PSG0.envlp_hi          ; 6635   0240 01F7
        B       L_6825                          ; 6637   0200 01EC

        PSHR    R5                              ; 6639   0275

L_663A:
        JSR     R5,     L_603D                  ; 663A   0004 0160 003D

        ANDI    #$003B, R0                      ; 663D   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 663F   0240 01F8
        MVII    #$00EE, R0                      ; 6641   02B8 00EE
        MVO     R0,     .PSG0.chn_c_lo          ; 6643   0240 01F2
        MVO     R0,     .PSG0.chn_c_hi          ; 6645   0240 01F6
        MVII    #$000C, R0                      ; 6647   02B8 000C
        MVO     R0,     .PSG0.chn_c_vol         ; 6649   0240 01FD
        B       L_6825                          ; 664B   0200 01D8

        PSHR    R5                              ; 664D   0275

        JSR     R5,     L_6029                  ; 664E   0004 0160 0029

        ANDI    #$0036, R0                      ; 6651   03B8 0036
        MVO     R0,     .PSG0.chan_enable       ; 6653   0240 01F8
        CLRR    R0                              ; 6655   01C0
        MVO     R0,     .PSG0.chn_a_hi          ; 6656   0240 01F4
        MVO     R0,     .PSG0.envelope          ; 6658   0240 01FA
        INCR    R0                              ; 665A   0008
        MVO     R0,     G_0145                  ; 665B   0240 0145
        INCR    R0                              ; 665D   0008
        MVO     R0,     .PSG0.noise             ; 665E   0240 01F9
        NEGR    R0                              ; 6660   0020
        MVO     R0,     .PSG0.chn_a_lo          ; 6661   0240 01F0
        MVII    #$0030, R0                      ; 6663   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 6665   0240 01FB
        MVO     R0,     .PSG0.envlp_hi          ; 6667   0240 01F7
        INCR    R7                              ; 6669   000F
        PSHR    R5                              ; 666A   0275
        MOVR    R7,     R3                      ; 666B   00BB
        MVI     G_0145, R0                      ; 666C   0280 0145
        TSTR    R0                              ; 666E   0080
        BNEQ    L_667D                          ; 666F   020C 000C

        INCR    R0                              ; 6671   0008
        MVO     R0,     G_0145                  ; 6672   0240 0145
        MVI     .PSG0.chn_a_lo,R0               ; 6674   0280 01F0
        TSTR    R0                              ; 6676   0080
        BEQ     L_6825                          ; 6677   0204 01AC

        SUBI    #$0020, R0                      ; 6679   0338 0020
        MVO     R0,     .PSG0.chn_a_lo          ; 667B   0240 01F0
L_667D:
        SUBI    #$0002, R3                      ; 667D   033B 0002
        MVO@    R3,     R4                      ; 667F   0263
        SWAP    R3,     1                       ; 6680   0043
        MVO@    R3,     R4                      ; 6681   0263
        PULR    R7                              ; 6682   02B7
        SDBD                                    ; 6683   0001
        MVII    #$5F67, R0                      ; 6684   02B8 0067 005F
        B       L_6693                          ; 6687   0200 000A

        SDBD                                    ; 6689   0001
        MVII    #$5FBC, R0                      ; 668A   02B8 00BC 005F
        B       L_6693                          ; 668D   0200 0004

        SDBD                                    ; 668F   0001
        MVII    #$5FF9, R0                      ; 6690   02B8 00F9 005F
L_6693:
        SDBD                                    ; 6693   0001
        MVII    #$FFFF, R1                      ; 6694   02B9 00FF 00FF
        MOVR    R1,     R2                      ; 6697   008A
        PSHR    R5                              ; 6698   0275
        MVII    #$01B6, R5                      ; 6699   02BD 01B6
        MVO@    R0,     R5                      ; 669B   0268
        SWAP    R0,     1                       ; 669C   0040
        MVO@    R0,     R5                      ; 669D   0268
        MVO@    R1,     R5                      ; 669E   0269
        SWAP    R1,     1                       ; 669F   0041
        MVO@    R1,     R5                      ; 66A0   0269
        MVO@    R2,     R5                      ; 66A1   026A
        SWAP    R2,     1                       ; 66A2   0042
        MVO@    R2,     R5                      ; 66A3   026A

        JSR     R5,     .EXEC.A83               ; 66A4   0004 0118 0283

        MVII    #$0106, R4                      ; 66A7   02BC 0106
        MVII    #$0038, R0                      ; 66A9   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 66AB   0240 01F8
        CLRR    R0                              ; 66AD   01C0
        MVII    #$0145, R5                      ; 66AE   02BD 0145
        MVO@    R0,     R5                      ; 66B0   0268
        MVO@    R0,     R5                      ; 66B1   0268
        MVO@    R0,     R5                      ; 66B2   0268
        INCR    R7                              ; 66B3   000F
        PSHR    R5                              ; 66B4   0275
        CLRR    R3                              ; 66B5   01DB

L_66B6:
        JSR     R5,     L_5ED9                  ; 66B6   0004 015C 02D9

        INCR    R3                              ; 66B9   000B
        CMPI    #$0003, R3                      ; 66BA   037B 0003
        BNEQ    L_66B6                          ; 66BC   022C 0007

        MVII    #$01B6, R5                      ; 66BE   02BD 01B6
        MVII    #$0003, R2                      ; 66C0   02BA 0003
L_66C2:
        SDBD                                    ; 66C2   0001
        MVI@    R5,     R0                      ; 66C3   02A8
        SDBD                                    ; 66C4   0001
        CMPI    #$FFFF, R0                      ; 66C5   0378 00FF 00FF
        BNEQ    L_66D1                          ; 66C8   020C 0007

        DECR    R2                              ; 66CA   0012
        BNEQ    L_66C2                          ; 66CB   022C 000A

        JSR     R5,     L_6011                  ; 66CD   0004 0160 0011

        PULR    R7                              ; 66D0   02B7
L_66D1:
        SDBD                                    ; 66D1   0001
        MVII    #$5EB4, R0                      ; 66D2   02B8 00B4 005E
        MVO@    R0,     R4                      ; 66D5   0260
        SWAP    R0,     1                       ; 66D6   0040
        MVO@    R0,     R4                      ; 66D7   0260
        PULR    R7                              ; 66D8   02B7
        PSHR    R5                              ; 66D9   0275
        PSHR    R4                              ; 66DA   0274
        MVII    #$0145, R4                      ; 66DB   02BC 0145
        ADDR    R3,     R4                      ; 66DD   00DC
        MVI@    R4,     R0                      ; 66DE   02A0
        TSTR    R0                              ; 66DF   0080
        BEQ     L_66E4                          ; 66E0   0204 0002

        PULR    R4                              ; 66E2   02B4
        PULR    R7                              ; 66E3   02B7
L_66E4:
        MVII    #$01B6, R4                      ; 66E4   02BC 01B6
        SLL     R3,     1                       ; 66E6   004B
        ADDR    R3,     R4                      ; 66E7   00DC
        SLR     R3,     1                       ; 66E8   0063
        SDBD                                    ; 66E9   0001
        MVI@    R4,     R1                      ; 66EA   02A1
        SDBD                                    ; 66EB   0001
        CMPI    #$FFFF, R1                      ; 66EC   0379 00FF 00FF
        BEQ     L_674C                          ; 66EF   0204 005B

        MOVR    R1,     R4                      ; 66F1   008C
        MVII    #$01FB, R5                      ; 66F2   02BD 01FB
        ADDR    R3,     R5                      ; 66F4   00DD
        MVI@    R4,     R0                      ; 66F5   02A0
        MOVR    R0,     R1                      ; 66F6   0081
        ANDI    #$0300, R1                      ; 66F7   03B9 0300
        SWAP    R1,     1                       ; 66F9   0041
        TSTR    R1                              ; 66FA   0089
        BEQ     L_671F                          ; 66FB   0204 0022

        CMPI    #$0002, R1                      ; 66FD   0379 0002
        BEQ     L_6728                          ; 66FF   0204 0027

        CMPI    #$0003, R1                      ; 6701   0379 0003
        BEQ     L_673B                          ; 6703   0204 0036

        MOVR    R0,     R1                      ; 6705   0081
        ANDI    #$000F, R1                      ; 6706   03B9 000F
        ANDI    #$00F0, R0                      ; 6708   03B8 00F0
        SLR     R0,     2                       ; 670A   0064
        SLR     R0,     2                       ; 670B   0064
        MVO@    R0,     R5                      ; 670C   0268
        SUBI    #$0008, R5                      ; 670D   033D 0008
        MVO@    R1,     R5                      ; 670F   0269
        SUBI    #$0005, R5                      ; 6710   033D 0005
        MVI@    R4,     R0                      ; 6712   02A0
        MVO@    R0,     R5                      ; 6713   0268
        MVII    #$0145, R5                      ; 6714   02BD 0145
        ADDR    R3,     R5                      ; 6716   00DD
        MVI@    R4,     R0                      ; 6717   02A0
        MVO@    R0,     R5                      ; 6718   0268
        MOVR    R4,     R1                      ; 6719   00A1

        JSR     R5,     L_5F5D                  ; 671A   0004 015C 035D

        PULR    R4                              ; 671D   02B4
        PULR    R7                              ; 671E   02B7
L_671F:
        SDBD                                    ; 671F   0001
        MVII    #$FFFF, R1                      ; 6720   02B9 00FF 00FF

        JSR     R5,     L_5F5D                  ; 6723   0004 015C 035D

        B       L_674C                          ; 6726   0200 0024

L_6728:
        MOVR    R5,     R2                      ; 6728   00AA
        MVII    #$01BC, R5                      ; 6729   02BD 01BC
        ADDR    R3,     R5                      ; 672B   00DD
        MVI@    R2,     R0                      ; 672C   0290
        MVO@    R0,     R5                      ; 672D   0268
        MVII    #$0145, R5                      ; 672E   02BD 0145
        ADDR    R3,     R5                      ; 6730   00DD
        CLRR    R0                              ; 6731   01C0
        MVO@    R0,     R2                      ; 6732   0250
        INCR    R0                              ; 6733   0008
        MVO@    R0,     R5                      ; 6734   0268
        MOVR    R4,     R1                      ; 6735   00A1

        JSR     R5,     L_5F5D                  ; 6736   0004 015C 035D

        PULR    R4                              ; 6739   02B4
        PULR    R7                              ; 673A   02B7
L_673B:
        ANDI    #$00FF, R0                      ; 673B   03B8 00FF
        MVII    #$0145, R2                      ; 673D   02BA 0145
        ADDR    R3,     R2                      ; 673F   00DA
        MVO@    R0,     R2                      ; 6740   0250
        MVII    #$01BC, R2                      ; 6741   02BA 01BC
        ADDR    R3,     R2                      ; 6743   00DA
        MVI@    R2,     R0                      ; 6744   0290
        MVO@    R0,     R5                      ; 6745   0268
        MOVR    R4,     R1                      ; 6746   00A1

        JSR     R5,     L_5F5D                  ; 6747   0004 015C 035D

        PULR    R4                              ; 674A   02B4
        PULR    R7                              ; 674B   02B7
L_674C:
        PULR    R4                              ; 674C   02B4
        SLL     R3,     2                       ; 674D   004F
        MOVR    R3,     R2                      ; 674E   009A
        SLR     R3,     2                       ; 674F   0067
        ADDR    R2,     R7                      ; 6750   00D7

        JSR     R5,     L_6029                  ; 6751   0004 0160 0029

        PULR    R7                              ; 6754   02B7

        JSR     R5,     L_6033                  ; 6755   0004 0160 0033

        PULR    R7                              ; 6758   02B7

        JSR     R5,     L_603D                  ; 6759   0004 0160 003D

        PULR    R7                              ; 675C   02B7
        PSHR    R5                              ; 675D   0275
        MVII    #$01B6, R5                      ; 675E   02BD 01B6
        SLL     R3,     1                       ; 6760   004B
        ADDR    R3,     R5                      ; 6761   00DD
        SLR     R3,     1                       ; 6762   0063
        MVO@    R1,     R5                      ; 6763   0269
        SWAP    R1,     1                       ; 6764   0041
        MVO@    R1,     R5                      ; 6765   0269
        PULR    R7                              ; 6766   02B7
        ANDR    R4,     R1                      ; 6767   01A1
        ADDR    R0,     R5                      ; 6768   00C5
        DECR    R4                              ; 6769   0014
        B       L_6A75                          ; 676A   0200 0309

        ANDR    R4,     R1                      ; 676C   01A1
        RLC     R3,     1                       ; 676D   0053
        ADCR    R0                              ; 676E   0028
        SUBR    R0,     R0                      ; 676F   0100
        DECLE   $0000                           ; 6770   0000

        DECR    R4                              ; 6771   0014
        ANDR    R4,     R1                      ; 6772   01A1
        ADDR    R0,     R5                      ; 6773   00C5
        DECR    R4                              ; 6774   0014
        ANDR    R4,     R1                      ; 6775   01A1
        RLC     R3,     1                       ; 6776   0053
        INCR    R2                              ; 6777   000A
        ANDR    R4,     R1                      ; 6778   01A1
        INCR    R5                              ; 6779   000D
        ADCR    R0                              ; 677A   0028
        SUBR    R0,     R0                      ; 677B   0100
        DECLE   $0000                           ; 677C   0000

        DECR    R4                              ; 677D   0014
        ANDR    R6,     R1                      ; 677E   01B1
        ADDR    R0,     R5                      ; 677F   00C5
        DECR    R4                              ; 6780   0014
        ANDR    R6,     R1                      ; 6781   01B1
        RLC     R3,     1                       ; 6782   0053
        INCR    R2                              ; 6783   000A
        XORR    R0,     R1                      ; 6784   01C1
        INCR    R5                              ; 6785   000D
        DECR    R4                              ; 6786   0014
        SUBR    R0,     R0                      ; 6787   0100
        DECLE   $0000                           ; 6788   0000

        INCR    R2                              ; 6789   000A
        XORR    R0,     R1                      ; 678A   01C1
        ADDR    R0,     R5                      ; 678B   00C5
        DECR    R4                              ; 678C   0014
        XORR    R2,     R1                      ; 678D   01D1
        RLC     R3,     1                       ; 678E   0053
        INCR    R2                              ; 678F   000A
        XORR    R2,     R1                      ; 6790   01D1
        INCR    R5                              ; 6791   000D
        DECR    R4                              ; 6792   0014
        SUBR    R0,     R0                      ; 6793   0100
        DECLE   $0000                           ; 6794   0000

        INCR    R2                              ; 6795   000A
        ANDR    R4,     R1                      ; 6796   01A1
        ADDR    R0,     R5                      ; 6797   00C5
        DECR    R4                              ; 6798   0014
        ANDR    R4,     R1                      ; 6799   01A1
        RLC     R3,     1                       ; 679A   0053
        INCR    R2                              ; 679B   000A
        ANDR    R4,     R1                      ; 679C   01A1
        INCR    R5                              ; 679D   000D
        ADCR    R0                              ; 679E   0028
        SUBR    R0,     R0                      ; 679F   0100
        DECLE   $0000                           ; 67A0   0000

        DECR    R4                              ; 67A1   0014
        ANDR    R6,     R1                      ; 67A2   01B1
        RLC     R3,     1                       ; 67A3   0053
L_67A4:
        DECR    R4                              ; 67A4   0014
        XORR    R0,     R1                      ; 67A5   01C1
        INCR    R5                              ; 67A6   000D
        INCR    R2                              ; 67A7   000A
        XORR    R2,     R0                      ; 67A8   01D0
        ADDR    R4,     R2                      ; 67A9   00E2
        RSWD    R4                              ; 67AA   003C
        ANDR    R6,     R1                      ; 67AB   01B1
        INCR    R5                              ; 67AC   000D
        COMR    R6                              ; 67AD   001E
L_67AE:
        ANDR    R6,     R1                      ; 67AE   01B1
        RLC     R3,     1                       ; 67AF   0053
        COMR    R6                              ; 67B0   001E
        ANDR    R6,     R1                      ; 67B1   01B1
        ADDR    R0,     R5                      ; 67B2   00C5
        RSWD    R4                              ; 67B3   003C
        B       L_6ACA                          ; 67B4   0200 0314
        B       L_6AC2                          ; 67B6   0200 030A

        ANDR    R6,     R1                      ; 67B8   01B1
        RLC     R3,     1                       ; 67B9   0053
        RLC     R0,     1                       ; 67BA   0050
        DECLE   $0000                           ; 67BB   0000

        XORR    R2,     R1                      ; 67BC   01D1
        MOVR    R5,     R4                      ; 67BD   00AC
        INCR    R4                              ; 67BE   000C
        XORR    R2,     R1                      ; 67BF   01D1
        SWAP    R0,     1                       ; 67C0   0040
        INCR    R4                              ; 67C1   000C
        XORR    R2,     R0                      ; 67C2   01D0
        ADDR    R7,     R6                      ; 67C3   00FE
        CLRC                                    ; 67C4   0006
        XORR    R2,     R1                      ; 67C5   01D1
        SWAP    R0,     1                       ; 67C6   0040
        CLRC                                    ; 67C7   0006
        XORR    R2,     R1                      ; 67C8   01D1
        MOVR    R5,     R4                      ; 67C9   00AC
        CLRC                                    ; 67CA   0006
        SUBR    R0,     R0                      ; 67CB   0100
        DECLE   $0000                           ; 67CC   0000

        CLRC                                    ; 67CD   0006
        XORR    R2,     R1                      ; 67CE   01D1
        MOVR    R5,     R4                      ; 67CF   00AC
        INCR    R4                              ; 67D0   000C
        XORR    R2,     R1                      ; 67D1   01D1
        SWAP    R0,     1                       ; 67D2   0040
        INCR    R4                              ; 67D3   000C
        XORR    R2,     R0                      ; 67D4   01D0
        ADDR    R7,     R6                      ; 67D5   00FE
        CLRC                                    ; 67D6   0006
        XORR    R2,     R1                      ; 67D7   01D1
        SWAP    R0,     1                       ; 67D8   0040
        CLRC                                    ; 67D9   0006
        XORR    R2,     R1                      ; 67DA   01D1
        MOVR    R5,     R4                      ; 67DB   00AC
        CLRC                                    ; 67DC   0006
        SUBR    R0,     R0                      ; 67DD   0100
        DECLE   $0000                           ; 67DE   0000

        CLRC                                    ; 67DF   0006
        XORR    R2,     R1                      ; 67E0   01D1
        MOVR    R5,     R4                      ; 67E1   00AC
        INCR    R4                              ; 67E2   000C
        XORR    R2,     R1                      ; 67E3   01D1
        SWAP    R0,     1                       ; 67E4   0040
        INCR    R4                              ; 67E5   000C
        XORR    R2,     R0                      ; 67E6   01D0
        ADDR    R7,     R6                      ; 67E7   00FE
        CLRC                                    ; 67E8   0006
        XORR    R2,     R1                      ; 67E9   01D1
        SWAP    R0,     1                       ; 67EA   0040
        CLRC                                    ; 67EB   0006
        XORR    R2,     R1                      ; 67EC   01D1
        MOVR    R5,     R4                      ; 67ED   00AC
        INCR    R4                              ; 67EE   000C
        XORR    R2,     R1                      ; 67EF   01D1
        SWAP    R0,     1                       ; 67F0   0040
        INCR    R4                              ; 67F1   000C
        XORR    R2,     R0                      ; 67F2   01D0
        ADDR    R7,     R6                      ; 67F3   00FE
        COMR    R0                              ; 67F4   0018
        XORR    R2,     R1                      ; 67F5   01D1
        SWAP    R0,     1                       ; 67F6   0040
        INCR    R4                              ; 67F7   000C
        DECLE   $0000                           ; 67F8   0000

        XORR    R0,     R6                      ; 67F9   01C6
        MOVR    R5,     R6                      ; 67FA   00AE
        CLRC                                    ; 67FB   0006
        B       L_69D1                          ; 67FC   0200 01D3

        RLC     R3,     2                       ; 67FE   0057
        CLRC                                    ; 67FF   0006
        B       L_69E3                          ; 6800   0200 01E1

        MOVR    R5,     R4                      ; 6802   00AC
        CLRC                                    ; 6803   0006
        B       L_69F6                          ; 6804   0200 01F0

        ADDR    R2,     R6                      ; 6806   00D6
        CLRC                                    ; 6807   0006
        B       L_69FA                          ; 6808   0200 01F0

        SAR     R3,     1                       ; 680A   006B
        CLRC                                    ; 680B   0006
        B       L_69FE                          ; 680C   0200 01F0

        DECLE   $0035                           ; 680E   0035

        CLRC                                    ; 680F   0006
        DECLE   $0000                           ; 6810   0000

        PSHR    R5                              ; 6811   0275
        PSHR    R4                              ; 6812   0274

        JSR     R5,     .EXEC.A83               ; 6813   0004 0118 0283

        MVII    #$003F, R0                      ; 6816   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6818   0240 01F8
        MVII    #$0106, R4                      ; 681A   02BC 0106
        MVII    #$0006, R3                      ; 681C   02BB 0006
        CLRR    R0                              ; 681E   01C0
L_681F:
        MVO@    R0,     R4                      ; 681F   0260
        DECR    R3                              ; 6820   0013
        BNEQ    L_681F                          ; 6821   022C 0003

        PULR    R4                              ; 6823   02B4
        PULR    R7                              ; 6824   02B7
L_6825:
        CLRR    R0                              ; 6825   01C0
        MVO@    R0,     R4                      ; 6826   0260
        MVO@    R0,     R4                      ; 6827   0260
        PULR    R7                              ; 6828   02B7
        PSHR    R5                              ; 6829   0275
        CLRR    R0                              ; 682A   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 682B   0240 01FB
        MVI     .PSG0.chan_enable,R0            ; 682D   0280 01F8
        MVII    #$0009, R1                      ; 682F   02B9 0009
        B       L_6845                          ; 6831   0200 0012

        PSHR    R5                              ; 6833   0275
        CLRR    R0                              ; 6834   01C0
        MVO     R0,     .PSG0.chn_b_vol         ; 6835   0240 01FC
        MVI     .PSG0.chan_enable,R0            ; 6837   0280 01F8
        MVII    #$0012, R1                      ; 6839   02B9 0012
        B       L_6845                          ; 683B   0200 0008

        PSHR    R5                              ; 683D   0275
        CLRR    R0                              ; 683E   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 683F   0240 01FD
        MVI     .PSG0.chan_enable,R0            ; 6841   0280 01F8
        MVII    #$0024, R1                      ; 6843   02B9 0024
L_6845:
        COMR    R1                              ; 6845   0019
        ANDR    R1,     R0                      ; 6846   0188
        COMR    R1                              ; 6847   0019
        XORR    R1,     R0                      ; 6848   01C8
        PULR    R7                              ; 6849   02B7
        PSHR    R5                              ; 684A   0275

        JSR     R5,     L_603D                  ; 684B   0004 0160 003D

        ANDI    #$003B, R0                      ; 684E   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 6850   0240 01F8
        MVII    #$000F, R0                      ; 6852   02B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 6854   0240 01FD
        CLRR    R0                              ; 6856   01C0
        MVO     R0,     .PSG0.chn_c_lo          ; 6857   0240 01F2
        INCR    R0                              ; 6859   0008
        MVO     R0,     .PSG0.chn_c_hi          ; 685A   0240 01F6
        MVII    #$0009, R0                      ; 685C   02B8 0009
        MVO     R0,     G_01BF                  ; 685E   0240 01BF
        MVO     R0,     G_0147                  ; 6860   0240 0147
        INCR    R7                              ; 6862   000F
        PSHR    R5                              ; 6863   0275
        MOVR    R7,     R3                      ; 6864   00BB
        MVI     G_0147, R0                      ; 6865   0280 0147
        TSTR    R0                              ; 6867   0080
        BNEQ    L_687D                          ; 6868   020C 0013

        MVII    #$0005, R0                      ; 686A   02B8 0005
        MVO     R0,     G_0147                  ; 686C   0240 0147
        MVI     G_01BF, R0                      ; 686E   0280 01BF
        DECR    R0                              ; 6870   0010
        MVO     R0,     G_01BF                  ; 6871   0240 01BF
        BEQ     L_6883                          ; 6873   0204 000E

        MVI     .PSG0.chn_c_hi,R0               ; 6875   0280 01F6
        ANDI    #$000F, R0                      ; 6877   03B8 000F
        XORI    #$0003, R0                      ; 6879   03F8 0003
        MVO     R0,     .PSG0.chn_c_hi          ; 687B   0240 01F6
L_687D:
        SUBI    #$0002, R3                      ; 687D   033B 0002
        MVO@    R3,     R4                      ; 687F   0263
        SWAP    R3,     1                       ; 6880   0043
        MVO@    R3,     R4                      ; 6881   0263
        PULR    R7                              ; 6882   02B7

L_6883:
        JSR     R5,     L_603D                  ; 6883   0004 0160 003D

        MVO     R0,     .PSG0.chan_enable       ; 6886   0240 01F8
        B       L_6825                          ; 6888   0220 0064

        PSHR    R5                              ; 688A   0275

        JSR     R5,     L_603D                  ; 688B   0004 0160 003D

        ANDI    #$003B, R0                      ; 688E   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 6890   0240 01F8
        MVII    #$0080, R0                      ; 6892   02B8 0080
L_6894:
        MVO     R0,     .PSG0.chn_c_lo          ; 6894   0240 01F2
        MVO     R0,     .PSG0.chn_c_hi          ; 6896   0240 01F6
        MVII    #$000F, R0                      ; 6898   02B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 689A   0240 01FD
        MVII    #$0006, R0                      ; 689C   02B8 0006
        MVO     R0,     G_0147                  ; 689E   0240 0147
        INCR    R7                              ; 68A0   000F
        PSHR    R5                              ; 68A1   0275
        MOVR    R7,     R3                      ; 68A2   00BB
        MVI     G_0147, R0                      ; 68A3   0280 0147
        TSTR    R0                              ; 68A5   0080
        BEQ     L_68AE                          ; 68A6   0204 0006

        SUBI    #$0002, R3                      ; 68A8   033B 0002
        MVO@    R3,     R4                      ; 68AA   0263
        SWAP    R3,     1                       ; 68AB   0043
        MVO@    R3,     R4                      ; 68AC   0263
        PULR    R7                              ; 68AD   02B7

L_68AE:
        JSR     R5,     L_603D                  ; 68AE   0004 0160 003D

        MVO     R0,     .PSG0.chan_enable       ; 68B1   0240 01F8
        B       L_6825                          ; 68B3   0220 008F

        PSHR    R5                              ; 68B5   0275

        JSR     R5,     L_603D                  ; 68B6   0004 0160 003D

        ANDI    #$003B, R0                      ; 68B9   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 68BB   0240 01F8
        MVII    #$00CC, R0                      ; 68BD   02B8 00CC
        B       L_6894                          ; 68BF   0220 002C

        MOVR    R2,     R3                      ; 68C1   0093
        INCR    R7                              ; 68C2   000F
        MOVR    R3,     R2                      ; 68C3   009A
        ADDI    #$0340, R2                      ; 68C4   02FA 0340
        MVI@    R2,     R0                      ; 68C6   0290
        TSTR    R0                              ; 68C7   0080
        BNEQ    L_68DF                          ; 68C8   020C 0015

        MVII    #$0318, R2                      ; 68CA   02BA 0318
        ADDR    R3,     R2                      ; 68CC   00DA
        CLRR    R0                              ; 68CD   01C0
        MVO@    R0,     R2                      ; 68CE   0250
        ADDI    #$0018, R2                      ; 68CF   02FA 0018
        MVO@    R0,     R2                      ; 68D1   0250
        MOVR    R2,     R0                      ; 68D2   0090
        SUBI    #$0330, R0                      ; 68D3   0338 0330
        PSHR    R5                              ; 68D5   0275

        JSR     R5,     X_POW2                  ; 68D6   0004 0114 0345

        COMR    R0                              ; 68D9   0018
        AND     G_010D, R0                      ; 68DA   0380 010D
        MVO     R0,     G_010D                  ; 68DC   0240 010D
        PULR    R5                              ; 68DE   02B5
L_68DF:
        MOVR    R5,     R7                      ; 68DF   00AF
        PSHR    R5                              ; 68E0   0275
        MVII    #$0126, R2                      ; 68E1   02BA 0126
        SLL     R3,     1                       ; 68E3   004B
        ADDR    R2,     R3                      ; 68E4   00D3

        JSR     R5,     G_4C3F                  ; 68E5   0004 014C 003F

        PULR    R7                              ; 68E8   02B7
        PSHR    R5                              ; 68E9   0275
        ADDI    #$0318, R3                      ; 68EA   02FB 0318
        MOVR    R3,     R2                      ; 68EC   009A
        PSHR    R3                              ; 68ED   0273
        MVI@    R2,     R0                      ; 68EE   0290
        PSHR    R0                              ; 68EF   0270
        ADDI    #$0008, R2                      ; 68F0   02FA 0008
        MVI@    R2,     R0                      ; 68F2   0290
        PSHR    R0                              ; 68F3   0270

        JSR     R5,     G_4BC3                  ; 68F4   0004 0148 03C3

        PULR    R0                              ; 68F7   02B0
        PULR    R1                              ; 68F8   02B1
        PULR    R2                              ; 68F9   02B2
        MVI@    R2,     R3                      ; 68FA   0293
        SDBD                                    ; 68FB   0001
        ANDI    #$FF00, R3                      ; 68FC   03BB 0000 00FF
        ANDI    #$00FF, R1                      ; 68FF   03B9 00FF
        ADDR    R1,     R3                      ; 6901   00CB
        MVO@    R3,     R2                      ; 6902   0253
        ADDI    #$0008, R2                      ; 6903   02FA 0008
        MVI@    R2,     R3                      ; 6905   0293
        ANDI    #$007F, R0                      ; 6906   03B8 007F
        SDBD                                    ; 6908   0001
        ANDI    #$FF80, R3                      ; 6909   03BB 0080 00FF
        ADDR    R0,     R3                      ; 690C   00C3
        MVO@    R3,     R2                      ; 690D   0253
        PULR    R7                              ; 690E   02B7
        MVII    #$0330, R3                      ; 690F   02BB 0330
        ADDR    R0,     R3                      ; 6911   00C3
L_6912:
        MVI@    R3,     R0                      ; 6912   0298
        TSTR    R0                              ; 6913   0080
        BEQ     L_691D                          ; 6914   0204 0007

        INCR    R3                              ; 6916   000B
        DECR    R1                              ; 6917   0011
        BNEQ    L_6912                          ; 6918   022C 0007

        CLRR    R3                              ; 691A   01DB
        B       L_691F                          ; 691B   0200 0002

L_691D:
        SUBI    #$0018, R3                      ; 691D   033B 0018
L_691F:
        MOVR    R5,     R7                      ; 691F   00AF
        MVII    #$0330, R3                      ; 6920   02BB 0330
        ADDR    R0,     R3                      ; 6922   00C3
L_6923:
        MVI@    R3,     R0                      ; 6923   0298
        TSTR    R0                              ; 6924   0080
        BNEQ    L_692E                          ; 6925   020C 0007

        INCR    R3                              ; 6927   000B
        DECR    R1                              ; 6928   0011
        BNEQ    L_6923                          ; 6929   022C 0007

        CLRR    R3                              ; 692B   01DB
        B       L_6930                          ; 692C   0200 0002

L_692E:
        SUBI    #$0018, R3                      ; 692E   033B 0018
L_6930:
        MOVR    R5,     R7                      ; 6930   00AF
        PSHR    R2                              ; 6931   0272
        ADDI    #$0318, R2                      ; 6932   02FA 0318
        MVI@    R2,     R0                      ; 6934   0290
        ANDI    #$00FF, R0                      ; 6935   03B8 00FF
        CMP@    R5,     R0                      ; 6937   0368
        BLT     L_694B                          ; 6938   0205 0011

        CMP@    R5,     R0                      ; 693A   0368
        BGT     L_694B                          ; 693B   020E 000E

        ADDI    #$0008, R2                      ; 693D   02FA 0008
        MVI@    R2,     R0                      ; 693F   0290
        ANDI    #$007F, R0                      ; 6940   03B8 007F
        CMP@    R5,     R0                      ; 6942   0368
        BLT     L_694B                          ; 6943   0205 0006

        CMP@    R5,     R0                      ; 6945   0368
        BGT     L_694B                          ; 6946   020E 0003

        CLRR    R0                              ; 6948   01C0
        B       L_694F                          ; 6949   0200 0004

L_694B:
        SDBD                                    ; 694B   0001
        MVII    #$FFFF, R0                      ; 694C   02B8 00FF 00FF
L_694F:
        PULR    R2                              ; 694F   02B2
        MOVR    R5,     R7                      ; 6950   00AF
        XORR    R6,     R0                      ; 6951   01F0
        XORR    R4,     R0                      ; 6952   01E0
        XORR    R2,     R0                      ; 6953   01D0
        CLRR    R0                              ; 6954   01C0
        ANDR    R6,     R0                      ; 6955   01B0
        ANDR    R4,     R0                      ; 6956   01A0
        ANDR    R2,     R0                      ; 6957   0190
        ANDR    R0,     R0                      ; 6958   0180
        RLC     R0,     2                       ; 6959   0054
        INCR    R1                              ; 695A   0009
        GSWD    R1                              ; 695B   0031
        DECLE   $0000                           ; 695C   0000

        SETC                                    ; 695D   0007
        DECLE   $0000                           ; 695E   0000

        MOVR    R2,     R5                      ; 695F   0095
        SLR     R2,     1                       ; 6960   0062
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6961   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6965   0000 0000

        SLL     R0,     1                       ; 6967   0048
        INCR    R1                              ; 6968   0009
        SWAP    R2,     1                       ; 6969   0042
        DECLE   $0000                           ; 696A   0000

        CLRC                                    ; 696B   0006
        DECR    R0                              ; 696C   0010
        ADDR    R3,     R7                      ; 696D   00DF
        SLR     R2,     1                       ; 696E   0062
        SWAP    R0,     1                       ; 696F   0040
        DECLE   $0000                           ; 6970   0000

        INCR    R0                              ; 6971   0008
        DECLE   $0000                           ; 6972   0000

        ADDR    R0,     R0                      ; 6973   00C0
        ADDR    R5,     R0                      ; 6974   00E8
        SLL     R0,     1                       ; 6975   0048
        INCR    R1                              ; 6976   0009
        SWAP    R3,     1                       ; 6977   0043
        DECLE   $0000                           ; 6978   0000

        CLRC                                    ; 6979   0006
        DECLE   $0000                           ; 697A   0000

        ADDR    R4,     R7                      ; 697B   00E7
        SLR     R2,     1                       ; 697C   0062
        DECR    R0                              ; 697D   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 697E   0000 0000 0000 0000
        DECLE   $0000                           ; 6982   0000

        INCR    R4                              ; 6983   000C
        INCR    R1                              ; 6984   0009
        RSWD    R6                              ; 6985   003E
        DECLE   $0000                           ; 6986   0000

        CLRC                                    ; 6987   0006
        DECLE   $0000                           ; 6988   0000

        ADDR    R7,     R1                      ; 6989   00F9
        SLR     R2,     1                       ; 698A   0062
        DECR    R0                              ; 698B   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698C   0000 0000 0000 0000
        DECLE   $0000                           ; 6990   0000

        ADDR    R2,     R2                      ; 6991   00D2
        INCR    R1                              ; 6992   0009
        INCR    R6                              ; 6993   000E
        DECLE   $0000,  $0000,  $0000           ; 6994   0000 0000 0000

        ADDR    R4,     R5                      ; 6997   00E5
        SLR     R1,     1                       ; 6998   0061
        NEGR    R0                              ; 6999   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699A   0000 0000 0000 0000
        DECLE   $0000                           ; 699E   0000

        ADDR    R2,     R2                      ; 699F   00D2
        INCR    R1                              ; 69A0   0009
        INCR    R6                              ; 69A1   000E
        DECLE   $0000                           ; 69A2   0000

        CLRC                                    ; 69A3   0006
        DECLE   $0000                           ; 69A4   0000

        MOVR    R3,     R7                      ; 69A5   009F
        SLR     R2,     1                       ; 69A6   0062
        NEGR    R0                              ; 69A7   0020
        DECLE   $0000                           ; 69A8   0000

        COMR    R0                              ; 69A9   0018
        DECLE   $0000,  $0000                   ; 69AA   0000 0000

        DECR    R4                              ; 69AC   0014
        ADDR    R2,     R2                      ; 69AD   00D2
        INCR    R1                              ; 69AE   0009
        DECR    R2                              ; 69AF   0012
        DECLE   $0000                           ; 69B0   0000

        EIS                                     ; 69B1   0002
        DECR    R0                              ; 69B2   0010
        ADDR    R2,     R7                      ; 69B3   00D7
        SLR     R2,     1                       ; 69B4   0062
        NEGR    R0                              ; 69B5   0020
        DECLE   $0000,  $0005,  $0000,  $0000   ; 69B6   0000 0005 0000 0000
        DECLE   $0005                           ; 69BA   0005

        ADDR    R2,     R2                      ; 69BB   00D2
        INCR    R1                              ; 69BC   0009
        DECR    R2                              ; 69BD   0012
        DECLE   $0000,  $0001,  $0000           ; 69BE   0000 0001 0000

        MOVR    R4,     R7                      ; 69C1   00A7
        SLR     R2,     1                       ; 69C2   0062
        NEGR    R0                              ; 69C3   0020
        DECLE   $0000                           ; 69C4   0000

        SLLC    R2,     1                       ; 69C5   005A
        DECLE   $0000,  $0000,  $0005           ; 69C6   0000 0000 0005

        ADDR    R2,     R2                      ; 69C9   00D2
        INCR    R1                              ; 69CA   0009
        DECR    R2                              ; 69CB   0012
        DECLE   $0000                           ; 69CC   0000

        CLRC                                    ; 69CD   0006
        DECLE   $0000                           ; 69CE   0000

        MOVR    R5,     R7                      ; 69CF   00AF
        SLR     R2,     1                       ; 69D0   0062
L_69D1:
        SLR     R0,     1                       ; 69D1   0060
        DECLE   $0000                           ; 69D2   0000

        NEGR    R0                              ; 69D3   0020
        DECLE   $0000,  $0000                   ; 69D4   0000 0000

        DECR    R0                              ; 69D6   0010
        ADDR    R2,     R2                      ; 69D7   00D2
        INCR    R1                              ; 69D8   0009
        DECR    R2                              ; 69D9   0012
        DECLE   $0000                           ; 69DA   0000

        SETC                                    ; 69DB   0007
        DECLE   $0000                           ; 69DC   0000

        MOVR    R6,     R7                      ; 69DD   00B7
        SLR     R2,     1                       ; 69DE   0062
        NEGR    R0                              ; 69DF   0020
        DECLE   $0000                           ; 69E0   0000

        RLC     R0,     1                       ; 69E1   0050
        DECLE   $0000                           ; 69E2   0000
L_69E3:
        DECLE   $0000,  $0005,  $0000,  $0000   ; 69E3   0000 0005 0000 0000

        MOVR    R0,     R1                      ; 69E7   0081
        SLR     R3,     1                       ; 69E8   0063
        EIS                                     ; 69E9   0002
        B       L_6ADA                          ; 69EA   0200 00EE

        RLC     R1,     1                       ; 69EC   0051
        ADDR    R2,     R2                      ; 69ED   00D2
        INCR    R1                              ; 69EE   0009
        DECR    R2                              ; 69EF   0012
        DECLE   $0000,  $0001,  $0000           ; 69F0   0000 0001 0000

        ADDR    R1,     R7                      ; 69F3   00CF
        SLR     R2,     1                       ; 69F4   0062
        DECR    R0                              ; 69F5   0010
L_69F6:
        DECLE   $0000                           ; 69F6   0000

        GSWD    R2                              ; 69F7   0032
        DECLE   $0000,  $0000                   ; 69F8   0000 0000
L_69FA:
        INCR    R0                              ; 69FA   0008
        ADDR    R2,     R2                      ; 69FB   00D2
        INCR    R1                              ; 69FC   0009
        DECR    R2                              ; 69FD   0012
L_69FE:
        DECLE   $0000                           ; 69FE   0000

        CLRC                                    ; 69FF   0006
        DECLE   $0000                           ; 6A00   0000

        TSTR    R7                              ; 6A01   00BF
        SLR     R2,     1                       ; 6A02   0062
        SWAP    R0,     1                       ; 6A03   0040
        DECLE   $0000                           ; 6A04   0000

        GSWD    R2                              ; 6A05   0032
        DECLE   $0000,  $0000                   ; 6A06   0000 0000

        INCR    R0                              ; 6A08   0008
        ADDR    R2,     R2                      ; 6A09   00D2
        INCR    R1                              ; 6A0A   0009
        DECR    R2                              ; 6A0B   0012
        DECLE   $0000                           ; 6A0C   0000

        CLRC                                    ; 6A0D   0006
        DECLE   $0000                           ; 6A0E   0000

        ADDR    R0,     R7                      ; 6A0F   00C7
        SLR     R2,     1                       ; 6A10   0062
        DECR    R0                              ; 6A11   0010
        DECLE   $0000                           ; 6A12   0000

        SETC                                    ; 6A13   0007
        DECLE   $0000,  $0000                   ; 6A14   0000 0000

        JSR     R4,     .STIC.Y.0               ; 6A16   0004 0000 0008
        DECLE   $0000,  $0000                   ; 6A19   0000 0000

        CLRC                                    ; 6A1B   0006
        DECLE   $0000                           ; 6A1C   0000

        SETC                                    ; 6A1D   0007
        SLR     R3,     1                       ; 6A1E   0063
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6A23   0000 0000 0000

        INCR    R1                              ; 6A26   0009
        DECLE   $0000,  $0000                   ; 6A27   0000 0000

        SETC                                    ; 6A29   0007
        DECLE   $0000                           ; 6A2A   0000

        DECR    R7                              ; 6A2B   0017
        SLR     R3,     1                       ; 6A2C   0063
        DECR    R0                              ; 6A2D   0010
        DECLE   $0000                           ; 6A2E   0000

        NEGR    R0                              ; 6A2F   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A30   0000 0000 0000 0000

        INCR    R4                              ; 6A34   000C
        TSTR    R0                              ; 6A35   0080
        DECLE   $0000                           ; 6A36   0000

        CLRC                                    ; 6A37   0006
        DECLE   $0000                           ; 6A38   0000

        NEGR    R5                              ; 6A39   0025
        SLR     R3,     1                       ; 6A3A   0063
        NEGR    R0                              ; 6A3B   0020
        DECLE   $0000                           ; 6A3C   0000

        ADCR    R0                              ; 6A3D   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3E   0000 0000 0000 0000

        INCR    R4                              ; 6A42   000C
        TSTR    R0                              ; 6A43   0080
        DECLE   $0000                           ; 6A44   0000

        EIS                                     ; 6A45   0002
        DECR    R0                              ; 6A46   0010
        NEGR    R5                              ; 6A47   0025
        SLR     R3,     1                       ; 6A48   0063
        NEGR    R0                              ; 6A49   0020
        DECLE   $0000                           ; 6A4A   0000

        ADCR    R0                              ; 6A4B   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4C   0000 0000 0000 0000

        INCR    R0                              ; 6A50   0008
        DECLE   $0000,  $0000                   ; 6A51   0000 0000

        EIS                                     ; 6A53   0002
        DECLE   $0000                           ; 6A54   0000

        ADCR    R3                              ; 6A55   002B
        SLR     R3,     1                       ; 6A56   0063
        NEGR    R0                              ; 6A57   0020
        DECLE   $0000                           ; 6A58   0000

        COMR    R6                              ; 6A59   001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5A   0000 0000 0000 0000

        INCR    R0                              ; 6A5E   0008
        TSTR    R0                              ; 6A5F   0080
        DECLE   $0000,  $0000,  $0000           ; 6A60   0000 0000 0000

        GSWD    R1                              ; 6A63   0031
        SLR     R3,     1                       ; 6A64   0063
        NEGR    R0                              ; 6A65   0020
        DECLE   $0000                           ; 6A66   0000

        RLC     R0,     1                       ; 6A67   0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A68   0000 0000 0000 0000

        INCR    R0                              ; 6A6C   0008
        MOVR    R6,     R4                      ; 6A6D   00B4
        DIS                                     ; 6A6E   0003
        EIS                                     ; 6A6F   0002
        DECLE   $0000                           ; 6A70   0000

        SWAP    R3,     1                       ; 6A71   0043
        SLR     R3,     1                       ; 6A72   0063
        DECLE   $0000,  $0000                   ; 6A73   0000 0000
L_6A75:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A75   0000 0000 0000 0000
        DECLE   $0000                           ; 6A79   0000

        INCR    R4                              ; 6A7A   000C
        DECLE   $0000,  $0001                   ; 6A7B   0000 0001

        EIS                                     ; 6A7D   0002
        DECR    R0                              ; 6A7E   0010
        DECLE   $0037                           ; 6A7F   0037

        SLR     R3,     1                       ; 6A80   0063
        DECR    R0                              ; 6A81   0010
        DECLE   $0000                           ; 6A82   0000

        GSWD    R2                              ; 6A83   0032
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A84   0000 0000 0000 0000

        INCR    R4                              ; 6A88   000C
        DECLE   $0000,  $0000                   ; 6A89   0000 0000

        CLRC                                    ; 6A8B   0006
        DECLE   $0000                           ; 6A8C   0000

        RSWD    R5                              ; 6A8D   003D
        SLR     R3,     1                       ; 6A8E   0063
        DECR    R0                              ; 6A8F   0010
        DECLE   $0000                           ; 6A90   0000

        ADCR    R0                              ; 6A91   0028
        DECLE   $0000,  $0000,  $0000           ; 6A92   0000 0000 0000

        RRC     R1,     1                       ; 6A95   0071
        SLLC    R0,     2                       ; 6A96   005C
        SLL     R1,     1                       ; 6A97   0049
        SLR     R3,     1                       ; 6A98   0063
        DECLE   $0001                           ; 6A99   0001

        SUB     G_00AD, R0                      ; 6A9A   0300 00AD
        SLLC    R3,     1                       ; 6A9C   005B
        ADDR    R0,     R0                      ; 6A9D   00C0
        SLLC    R3,     1                       ; 6A9E   005B
        ADCR    R6                              ; 6A9F   002E
        SLLC    R1,     2                       ; 6AA0   005D
        RLC     R1,     1                       ; 6AA1   0051
        SLR     R3,     1                       ; 6AA2   0063
        EIS                                     ; 6AA3   0002
        B       L_6B94                          ; 6AA4   0200 00EE

        RLC     R1,     1                       ; 6AA6   0051
        SLL     R2,     1                       ; 6AA7   004A
        SLLC    R1,     2                       ; 6AA8   005D
        RRC     R1,     1                       ; 6AA9   0071
        SLR     R3,     1                       ; 6AAA   0063
        EIS                                     ; 6AAB   0002
        B       L_6B9C                          ; 6AAC   0200 00EE

        RLC     R1,     1                       ; 6AAE   0051
        SLL     R3,     2                       ; 6AAF   004F
        SLLC    R1,     2                       ; 6AB0   005D
        MOVR    R2,     R1                      ; 6AB1   0091
        SLR     R3,     1                       ; 6AB2   0063
        EIS                                     ; 6AB3   0002
        B       L_6BA4                          ; 6AB4   0200 00EE

        RLC     R1,     1                       ; 6AB6   0051
        RLC     R0,     2                       ; 6AB7   0054
        SLLC    R1,     2                       ; 6AB8   005D
        MOVR    R4,     R1                      ; 6AB9   00A1
        SLR     R3,     1                       ; 6ABA   0063
        EIS                                     ; 6ABB   0002
        B       L_6BAC                          ; 6ABC   0200 00EE

        RLC     R1,     1                       ; 6ABE   0051
        SLLC    R1,     1                       ; 6ABF   0059
        SLLC    R1,     2                       ; 6AC0   005D
        ADDR    R0,     R1                      ; 6AC1   00C1
L_6AC2:
        SLR     R3,     1                       ; 6AC2   0063
        EIS                                     ; 6AC3   0002
        B       L_6BB4                          ; 6AC4   0200 00EE

        RLC     R1,     1                       ; 6AC6   0051
        SAR     R0,     2                       ; 6AC7   006C
        SLLC    R1,     2                       ; 6AC8   005D
        ADDR    R2,     R1                      ; 6AC9   00D1
L_6ACA:
        SLR     R3,     1                       ; 6ACA   0063
        EIS                                     ; 6ACB   0002
        B       L_6BBC                          ; 6ACC   0200 00EE

        RLC     R1,     1                       ; 6ACE   0051
        SLLC    R1,     1                       ; 6ACF   0059
        SLLC    R1,     2                       ; 6AD0   005D
        MOVR    R6,     R1                      ; 6AD1   00B1
        SLR     R3,     1                       ; 6AD2   0063
        EIS                                     ; 6AD3   0002
        B       L_6BC4                          ; 6AD4   0200 00EE

        RLC     R1,     1                       ; 6AD6   0051
        SAR     R0,     2                       ; 6AD7   006C
        SLLC    R1,     2                       ; 6AD8   005D
        SLR     R1,     1                       ; 6AD9   0061
L_6ADA:
        SLR     R3,     1                       ; 6ADA   0063
        EIS                                     ; 6ADB   0002
        B       L_6BCC                          ; 6ADC   0200 00EE

        RLC     R1,     1                       ; 6ADE   0051
        RSWD    R4                              ; 6ADF   003C
        SLLC    R1,     2                       ; 6AE0   005D
        ADDR    R4,     R1                      ; 6AE1   00E1
        SLR     R3,     1                       ; 6AE2   0063
        EIS                                     ; 6AE3   0002
        B       L_6BB0                          ; 6AE4   0200 00CA

        RLC     R3,     1                       ; 6AE6   0053
        COMR    R4                              ; 6AE7   001C
        RLC     R3,     2                       ; 6AE8   0057
        ADDR    R4,     R1                      ; 6AE9   00E1
        SLR     R3,     1                       ; 6AEA   0063
        EIS                                     ; 6AEB   0002
        CMPI    #$00FE, R0                      ; 6AEC   0378 00FE
        SLLC    R3,     1                       ; 6AEE   005B
        ADDR    R7,     R6                      ; 6AEF   00FE
        SLLC    R3,     1                       ; 6AF0   005B
        ADDR    R7,     R6                      ; 6AF1   00FE
        SLLC    R3,     1                       ; 6AF2   005B
        ADDR    R7,     R6                      ; 6AF3   00FE
        SLLC    R3,     1                       ; 6AF4   005B
        SLLC    R3,     2                       ; 6AF5   005F
        SLLC    R0,     2                       ; 6AF6   005C
        ADDR    R0,     R0                      ; 6AF7   00C0
        SLLC    R3,     1                       ; 6AF8   005B
        TSTR    R0                              ; 6AF9   0080
        RLC     R2,     1                       ; 6AFA   0052
        ADDR    R6,     R1                      ; 6AFB   00F1
        SLR     R3,     1                       ; 6AFC   0063
        EIS                                     ; 6AFD   0002
        SARC    R0,     1                       ; 6AFE   0078
        ADCR    R3                              ; 6AFF   002B
        SLLC    R3,     1                       ; 6B00   005B
        ADCR    R3                              ; 6B01   002B
        SLLC    R3,     1                       ; 6B02   005B
        ADCR    R3                              ; 6B03   002B
        SLLC    R3,     1                       ; 6B04   005B
        ADCR    R3                              ; 6B05   002B
        SLLC    R3,     1                       ; 6B06   005B
        DECLE   $0000,  $0000,  $0001           ; 6B07   0000 0000 0001

        SLR     R0,     2                       ; 6B0A   0064
        DECLE   $0001,  $0278                   ; 6B0B   0001 0278

        ADCR    R3                              ; 6B0D   002B
        SLLC    R3,     1                       ; 6B0E   005B
        ADCR    R3                              ; 6B0F   002B
        SLLC    R3,     1                       ; 6B10   005B
        ADCR    R3                              ; 6B11   002B
        SLLC    R3,     1                       ; 6B12   005B
        ADCR    R3                              ; 6B13   002B
        SLLC    R3,     1                       ; 6B14   005B
        ADDR    R0,     R1                      ; 6B15   00C1
        SLR     R0,     1                       ; 6B16   0060
        ADDR    R0,     R3                      ; 6B17   00C3
        SLR     R0,     1                       ; 6B18   0060
        INCR    R1                              ; 6B19   0009
        SLR     R0,     2                       ; 6B1A   0064
        DECLE   $0005                           ; 6B1B   0005

        SARC    R0,     1                       ; 6B1C   0078
        ADCR    R3                              ; 6B1D   002B
        SLLC    R3,     1                       ; 6B1E   005B
        ADCR    R3                              ; 6B1F   002B
        SLLC    R3,     1                       ; 6B20   005B
        ADCR    R3                              ; 6B21   002B
        SLLC    R3,     1                       ; 6B22   005B
        ADCR    R3                              ; 6B23   002B
        SLLC    R3,     1                       ; 6B24   005B
        ADDR    R0,     R3                      ; 6B25   00C3
        SLR     R0,     1                       ; 6B26   0060
        GSWD    R1                              ; 6B27   0031
        SLR     R0,     2                       ; 6B28   0064
        DIS                                     ; 6B29   0003
        DECLE   $0000                           ; 6B2A   0000

        ADDR    R0,     R3                      ; 6B2B   00C3
        SLR     R0,     1                       ; 6B2C   0060
        INCR    R1                              ; 6B2D   0009
        SLR     R0,     2                       ; 6B2E   0064

        JSR     R4,     G_00C3                  ; 6B2F   0004 0000 00C3

        SLR     R0,     1                       ; 6B32   0060
        SLR     R1,     1                       ; 6B33   0061
        SLR     R0,     2                       ; 6B34   0064
        CLRC                                    ; 6B35   0006
        DECLE   $0000                           ; 6B36   0000

        SLL     R3,     1                       ; 6B37   004B
        SLLC    R0,     2                       ; 6B38   005C
        INCR    R1                              ; 6B39   0009
        SLR     R0,     2                       ; 6B3A   0064

        JSR     R4,     G_00C3                  ; 6B3B   0004 0000 00C3

        SLR     R0,     1                       ; 6B3E   0060
        INCR    R1                              ; 6B3F   0009
        SLR     R0,     2                       ; 6B40   0064

        JSR     R4,     G_00A6                  ; 6B41   0004 0000 00A6

        RLC     R2,     1                       ; 6B44   0052
        ADDR    R0,     R1                      ; 6B45   00C1
        SLR     R0,     2                       ; 6B46   0064
        DECLE   $0001,  $0000                   ; 6B47   0001 0000

        DECR    R0                              ; 6B49   0010
        DECR    R0                              ; 6B4A   0010
        DECLE   $0000                           ; 6B4B   0000

        ADDR    R0,     R6                      ; 6B4C   00C6
        DECLE   $0000                           ; 6B4D   0000

        DECR    R0                              ; 6B4E   0010
        DECR    R0                              ; 6B4F   0010
        DECLE   $0000,  $0000                   ; 6B50   0000 0000

        COMR    R0                              ; 6B52   0018
        RSWD    R4                              ; 6B53   003C
        SARC    R2,     2                       ; 6B54   007E
        SLL     R2,     1                       ; 6B55   004A
        SARC    R2,     2                       ; 6B56   007E
        SWAP    R2,     1                       ; 6B57   0042
        NEGR    R4                              ; 6B58   0024
        DECLE   $0000                           ; 6B59   0000

        COMR    R0                              ; 6B5A   0018
        RSWD    R4                              ; 6B5B   003C
        SARC    R2,     2                       ; 6B5C   007E
        RLC     R2,     1                       ; 6B5D   0052
        SARC    R2,     2                       ; 6B5E   007E
        RSWD    R4                              ; 6B5F   003C
        NEGR    R4                              ; 6B60   0024
        MOVR    R0,     R1                      ; 6B61   0081
        MOVR    R0,     R1                      ; 6B62   0081
        MOVR    R3,     R1                      ; 6B63   0099
        MOVR    R7,     R5                      ; 6B64   00BD
        ADDR    R7,     R7                      ; 6B65   00FF
        MOVR    R4,     R5                      ; 6B66   00A5
        MOVR    R0,     R1                      ; 6B67   0081
        DECLE   $0000                           ; 6B68   0000

        MOVR    R0,     R1                      ; 6B69   0081
        MOVR    R3,     R1                      ; 6B6A   0099
        MOVR    R3,     R1                      ; 6B6B   0099
        MOVR    R7,     R5                      ; 6B6C   00BD
        ADDR    R7,     R7                      ; 6B6D   00FF
        MOVR    R3,     R1                      ; 6B6E   0099
        MOVR    R0,     R1                      ; 6B6F   0081
        MOVR    R0,     R1                      ; 6B70   0081
        DIS                                     ; 6B71   0003
        INCR    R4                              ; 6B72   000C
        RRC     R0,     1                       ; 6B73   0070
        ADDR    R7,     R7                      ; 6B74   00FF
        RRC     R0,     1                       ; 6B75   0070
        INCR    R4                              ; 6B76   000C
        DIS                                     ; 6B77   0003
        DECLE   $0000,  $0000                   ; 6B78   0000 0000

        DIS                                     ; 6B7A   0003
        SARC    R0,     2                       ; 6B7B   007C
        ADDR    R2,     R0                      ; 6B7C   00D0
        SARC    R0,     2                       ; 6B7D   007C
        DIS                                     ; 6B7E   0003
        DECLE   $0000,  $0000                   ; 6B7F   0000 0000

        SETC                                    ; 6B81   0007
        NEGR    R2                              ; 6B82   0022
        RRC     R3,     2                       ; 6B83   0077
        MOVR    R5,     R2                      ; 6B84   00AA
        RRC     R3,     2                       ; 6B85   0077
        NEGR    R2                              ; 6B86   0022
        SETC                                    ; 6B87   0007
        DECLE   $0000                           ; 6B88   0000

        SETC                                    ; 6B89   0007
        NEGR    R2                              ; 6B8A   0022
        RRC     R3,     2                       ; 6B8B   0077
        ADDR    R7,     R7                      ; 6B8C   00FF
        RRC     R3,     2                       ; 6B8D   0077
        NEGR    R2                              ; 6B8E   0022
        SETC                                    ; 6B8F   0007
        DECLE   $0000,  $0000                   ; 6B90   0000 0000

        ADDR    R0,     R3                      ; 6B92   00C3
        ADDR    R3,     R3                      ; 6B93   00DB
L_6B94:
        NEGR    R4                              ; 6B94   0024
        NEGR    R4                              ; 6B95   0024
        NEGR    R4                              ; 6B96   0024
        ADDR    R3,     R3                      ; 6B97   00DB
        ADDR    R0,     R3                      ; 6B98   00C3
        DECLE   $0000                           ; 6B99   0000

        MOVR    R0,     R1                      ; 6B9A   0081
        SLLC    R2,     1                       ; 6B9B   005A
L_6B9C:
        RSWD    R4                              ; 6B9C   003C
        RSWD    R4                              ; 6B9D   003C
        RSWD    R4                              ; 6B9E   003C
        SLLC    R2,     1                       ; 6B9F   005A
        MOVR    R0,     R1                      ; 6BA0   0081
        DECLE   $0000                           ; 6BA1   0000

        INCR    R7                              ; 6BA2   000F
        NEGR    R2                              ; 6BA3   0022
L_6BA4:
        SLR     R2,     2                       ; 6BA4   0066
        ADDR    R7,     R4                      ; 6BA5   00FC
        SLR     R2,     2                       ; 6BA6   0066
        NEGR    R2                              ; 6BA7   0022
        INCR    R7                              ; 6BA8   000F
        DECLE   $0000                           ; 6BA9   0000

        INCR    R7                              ; 6BAA   000F
        ADCR    R2                              ; 6BAB   002A
L_6BAC:
        SLR     R2,     2                       ; 6BAC   0066
        ADDR    R3,     R6                      ; 6BAD   00DE
        SLR     R2,     2                       ; 6BAE   0066
        ADCR    R2                              ; 6BAF   002A
L_6BB0:
        INCR    R7                              ; 6BB0   000F
        DECLE   $0000                           ; 6BB1   0000

        RSWD    R4                              ; 6BB2   003C
        COMR    R0                              ; 6BB3   0018
L_6BB4:
        COMR    R0                              ; 6BB4   0018
        RSWD    R4                              ; 6BB5   003C
        ADDR    R7,     R7                      ; 6BB6   00FF
        MOVR    R3,     R1                      ; 6BB7   0099
        SARC    R2,     2                       ; 6BB8   007E
        DECLE   $0000                           ; 6BB9   0000

        COMR    R0                              ; 6BBA   0018
        COMR    R0                              ; 6BBB   0018
L_6BBC:
        COMR    R0                              ; 6BBC   0018
        RSWD    R4                              ; 6BBD   003C
        ADDR    R7,     R7                      ; 6BBE   00FF
        ADDR    R7,     R7                      ; 6BBF   00FF
        DECLE   $0000,  $0000,  $0001           ; 6BC0   0000 0000 0001

        NEGR    R3                              ; 6BC3   0023
L_6BC4:
        RRC     R1,     2                       ; 6BC4   0075
        ADDR    R7,     R7                      ; 6BC5   00FF
        RRC     R1,     2                       ; 6BC6   0075
        NEGR    R3                              ; 6BC7   0023
        DECLE   $0001,  $0000,  $0001           ; 6BC8   0001 0000 0001

        NEGR    R3                              ; 6BCB   0023
L_6BCC:
        RLC     R0,     2                       ; 6BCC   0054
        ADDR    R7,     R7                      ; 6BCD   00FF
        RLC     R0,     2                       ; 6BCE   0054
        NEGR    R3                              ; 6BCF   0023
        DECLE   $0001                           ; 6BD0   0001

        MOVR    R0,     R1                      ; 6BD1   0081
        ADDR    R0,     R3                      ; 6BD2   00C3
        SLR     R2,     2                       ; 6BD3   0066
        SARC    R2,     2                       ; 6BD4   007E
        SWAP    R2,     1                       ; 6BD5   0042
        SARC    R2,     2                       ; 6BD6   007E
        SLR     R2,     2                       ; 6BD7   0066
        ADDR    R0,     R3                      ; 6BD8   00C3
        ADDR    R4,     R7                      ; 6BD9   00E7
        ADDR    R0,     R3                      ; 6BDA   00C3
        SLR     R2,     2                       ; 6BDB   0066
        RSWD    R4                              ; 6BDC   003C
        COMR    R0                              ; 6BDD   0018
        RSWD    R4                              ; 6BDE   003C
        SARC    R2,     2                       ; 6BDF   007E
        ADDR    R3,     R3                      ; 6BE0   00DB
        COMR    R0                              ; 6BE1   0018
        ADDR    R7,     R7                      ; 6BE2   00FF
        ADCR    R2                              ; 6BE3   002A
        ADDR    R7,     R7                      ; 6BE4   00FF
        COMR    R0                              ; 6BE5   0018
        DECLE   $0000,  $0000,  $0000           ; 6BE6   0000 0000 0000

        COMR    R0                              ; 6BE9   0018
        ADDR    R7,     R7                      ; 6BEA   00FF
        RLC     R0,     2                       ; 6BEB   0054
        ADDR    R7,     R7                      ; 6BEC   00FF
        COMR    R0                              ; 6BED   0018
        DECLE   $0000,  $0000,  $0000           ; 6BEE   0000 0000 0000

        TSTR    R0                              ; 6BF1   0080
        ADDR    R4,     R0                      ; 6BF2   00E0
        NEGR    R0                              ; 6BF3   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF4   0000 0000 0000 0000
        DECLE   $0000                           ; 6BF8   0000

        SLR     R0,     1                       ; 6BF9   0060
        SWAP    R0,     1                       ; 6BFA   0040
        SWAP    R0,     1                       ; 6BFB   0040
        ADDR    R0,     R0                      ; 6BFC   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFD   0000 0000 0000 0000

        INCR    R4                              ; 6C01   000C
        DECLE   $0000                           ; 6C02   0000

        ADDR    R7,     R7                      ; 6C03   00FF
        DECLE   $0000                           ; 6C04   0000

        INCR    R4                              ; 6C05   000C
        DECLE   $0000,  $0000,  $0000           ; 6C06   0000 0000 0000

        COMR    R0                              ; 6C09   0018
        NEGR    R4                              ; 6C0A   0024
        SARC    R0,     1                       ; 6C0B   0078
        RSWD    R4                              ; 6C0C   003C
        ADDR    R7,     R7                      ; 6C0D   00FF
        RSWD    R5                              ; 6C0E   003D
        RSWD    R0                              ; 6C0F   0038
        SLLC    R0,     1                       ; 6C10   0058
        NEGR    R0                              ; 6C11   0020
        SLLC    R2,     1                       ; 6C12   005A
        SARC    R0,     2                       ; 6C13   007C
        ADDR    R7,     R7                      ; 6C14   00FF
        RSWD    R4                              ; 6C15   003C
        MOVR    R6,     R5                      ; 6C16   00B5
        DECR    R1                              ; 6C17   0011
        ADCR    R0                              ; 6C18   0028
        DECR    R0                              ; 6C19   0010
        SLL     R0,     2                       ; 6C1A   004C
        MOVR    R4,     R2                      ; 6C1B   00A2
        RLC     R0,     2                       ; 6C1C   0054
        MOVR    R5,     R3                      ; 6C1D   00AB
        SAR     R2,     2                       ; 6C1E   006E
        RSWD    R2                              ; 6C1F   003A
        INCR    R0                              ; 6C20   0008
        DECR    R0                              ; 6C21   0010
        SLLC    R2,     1                       ; 6C22   005A
        NEGR    R4                              ; 6C23   0024
        ADDR    R3,     R2                      ; 6C24   00DA
        ADDR    R3,     R7                      ; 6C25   00DF
        RLC     R2,     2                       ; 6C26   0056
        SAR     R2,     2                       ; 6C27   006E
        DECR    R4                              ; 6C28   0014
        RRC     R0,     2                       ; 6C29   0074
        ADDR    R2,     R2                      ; 6C2A   00D2
        RRC     R0,     2                       ; 6C2B   0074
        ADDR    R1,     R0                      ; 6C2C   00C8
        SLLC    R2,     2                       ; 6C2D   005E
        ADCR    R2                              ; 6C2E   002A
        SLLC    R0,     2                       ; 6C2F   005C
        SAR     R2,     1                       ; 6C30   006A
        DECR    R0                              ; 6C31   0010
        RSWD    R0                              ; 6C32   0038
        RSWD    R4                              ; 6C33   003C
        RSWD    R6                              ; 6C34   003E
        SARC    R0,     1                       ; 6C35   0078
        ADDR    R7,     R6                      ; 6C36   00FE
        ADDR    R7,     R7                      ; 6C37   00FF
        SARC    R0,     2                       ; 6C38   007C
        SARC    R3,     2                       ; 6C39   007F
        RSWD    R4                              ; 6C3A   003C
        SARC    R2,     2                       ; 6C3B   007E
        RSWD    R0                              ; 6C3C   0038
        COMR    R4                              ; 6C3D   001C
        RSWD    R4                              ; 6C3E   003C
        RLC     R0,     2                       ; 6C3F   0054
        ADCR    R0                              ; 6C40   0028
        INCR    R0                              ; 6C41   0008
        COMR    R4                              ; 6C42   001C
        RSWD    R0                              ; 6C43   0038
        SARC    R0,     2                       ; 6C44   007C
        RSWD    R6                              ; 6C45   003E
        MOVR    R4,     R5                      ; 6C46   00A5
        ADDR    R7,     R7                      ; 6C47   00FF
        SLLC    R2,     1                       ; 6C48   005A
        RSWD    R4                              ; 6C49   003C
        SARC    R2,     2                       ; 6C4A   007E
        RSWD    R4                              ; 6C4B   003C
        SARC    R0,     1                       ; 6C4C   0078
        RSWD    R6                              ; 6C4D   003E
        SWAP    R0,     2                       ; 6C4E   0044
        NEGR    R2                              ; 6C4F   0022
        COMR    R2                              ; 6C50   001A
        GSWD    R0                              ; 6C51   0030
        COMR    R0                              ; 6C52   0018
        RSWD    R4                              ; 6C53   003C
        MOVR    R5,     R4                      ; 6C54   00AC
        SARC    R2,     2                       ; 6C55   007E
        RSWD    R4                              ; 6C56   003C
        ADDR    R7,     R7                      ; 6C57   00FF
        SARC    R1,     2                       ; 6C58   007D
        RSWD    R7                              ; 6C59   003F
        SARC    R0,     2                       ; 6C5A   007C
        MOVR    R5,     R2                      ; 6C5B   00AA
        RSWD    R4                              ; 6C5C   003C
        SARC    R2,     1                       ; 6C5D   007A
        SWAP    R2,     1                       ; 6C5E   0042
        NEGR    R0                              ; 6C5F   0020
        INCR    R0                              ; 6C60   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C69   0000 0000 0000 0000
        DECLE   $0000                           ; 6C6D   0000

        NEGR    R4                              ; 6C6E   0024
        DECLE   $0000                           ; 6C6F   0000

        COMR    R0                              ; 6C70   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C79   0000 0000 0000 0000

        SWAP    R2,     1                       ; 6C7D   0042
        DECLE   $0000                           ; 6C7E   0000

        COMR    R0                              ; 6C7F   0018
        RSWD    R4                              ; 6C80   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C85   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6C89   0000 0000

        NEGR    R4                              ; 6C8B   0024
        MOVR    R0,     R1                      ; 6C8C   0081
        COMR    R0                              ; 6C8D   0018
        RSWD    R4                              ; 6C8E   003C
        COMR    R0                              ; 6C8F   0018
        SARC    R2,     2                       ; 6C90   007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C95   0000 0000 0000 0000
        DECLE   $0000                           ; 6C99   0000

        RSWD    R4                              ; 6C9A   003C
        SARC    R2,     2                       ; 6C9B   007E
        RSWD    R4                              ; 6C9C   003C
        RSWD    R4                              ; 6C9D   003C
        RSWD    R4                              ; 6C9E   003C
        RSWD    R4                              ; 6C9F   003C
        SARC    R2,     2                       ; 6CA0   007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA1   0000 0000 0000 0000
        DECLE   $0000                           ; 6CA5   0000

        SARC    R2,     2                       ; 6CA6   007E
        ADDR    R7,     R7                      ; 6CA7   00FF
        ADDR    R7,     R7                      ; 6CA8   00FF
        SARC    R2,     2                       ; 6CA9   007E
        RSWD    R4                              ; 6CAA   003C
        MOVR    R7,     R5                      ; 6CAB   00BD
        RSWD    R4                              ; 6CAC   003C
        RSWD    R4                              ; 6CAD   003C
        RSWD    R4                              ; 6CAE   003C
        RSWD    R4                              ; 6CAF   003C
        MOVR    R7,     R5                      ; 6CB0   00BD
        RSWD    R4                              ; 6CB1   003C
        SARC    R2,     2                       ; 6CB2   007E
        ADDR    R7,     R7                      ; 6CB3   00FF
        ADDR    R7,     R7                      ; 6CB4   00FF
        ADDR    R7,     R7                      ; 6CB5   00FF
        SARC    R2,     2                       ; 6CB6   007E
        RSWD    R4                              ; 6CB7   003C
        MOVR    R7,     R5                      ; 6CB8   00BD
        RSWD    R4                              ; 6CB9   003C
        RSWD    R4                              ; 6CBA   003C
        RSWD    R4                              ; 6CBB   003C
        RSWD    R4                              ; 6CBC   003C
        RSWD    R4                              ; 6CBD   003C
        RSWD    R4                              ; 6CBE   003C
        RSWD    R4                              ; 6CBF   003C
        RSWD    R4                              ; 6CC0   003C
        SWAP    R0,     1                       ; 6CC1   0040
        SWAP    R0,     1                       ; 6CC2   0040
        SWAP    R0,     1                       ; 6CC3   0040
        SWAP    R0,     1                       ; 6CC4   0040
        SWAP    R0,     1                       ; 6CC5   0040
        SWAP    R0,     1                       ; 6CC6   0040
        SWAP    R0,     1                       ; 6CC7   0040
        SWAP    R0,     1                       ; 6CC8   0040
        SWAP    R0,     1                       ; 6CC9   0040
        SWAP    R0,     1                       ; 6CCA   0040
        SWAP    R0,     1                       ; 6CCB   0040
        SWAP    R0,     1                       ; 6CCC   0040
        SWAP    R0,     1                       ; 6CCD   0040
        SWAP    R0,     1                       ; 6CCE   0040
        SWAP    R0,     1                       ; 6CCF   0040
        SWAP    R0,     1                       ; 6CD0   0040
        DECLE   $0000                           ; 6CD1   0000

        NEGR    R0                              ; 6CD2   0020
        DECR    R0                              ; 6CD3   0010
        SWAP    R0,     1                       ; 6CD4   0040
        SWAP    R0,     1                       ; 6CD5   0040
        NEGR    R0                              ; 6CD6   0020
        DECLE   $0000,  $0000                   ; 6CD7   0000 0000

        ADDR    R5,     R1                      ; 6CD9   00E9
        SLR     R0,     2                       ; 6CDA   0064
        ADDR    R5,     R4                      ; 6CDB   00EC
        SLR     R0,     2                       ; 6CDC   0064
        ADDR    R5,     R7                      ; 6CDD   00EF
        SLR     R0,     2                       ; 6CDE   0064
        ADDR    R6,     R2                      ; 6CDF   00F2
        SLR     R0,     2                       ; 6CE0   0064
        ADDR    R6,     R5                      ; 6CE1   00F5
        SLR     R0,     2                       ; 6CE2   0064
        ADDR    R7,     R0                      ; 6CE3   00F8
        SLR     R0,     2                       ; 6CE4   0064
        ADDR    R7,     R3                      ; 6CE5   00FB
        SLR     R0,     2                       ; 6CE6   0064
        ADDR    R7,     R6                      ; 6CE7   00FE
        SLR     R0,     2                       ; 6CE8   0064
        DECLE   $0001                           ; 6CE9   0001

        SLR     R1,     2                       ; 6CEA   0065
        CLRC                                    ; 6CEB   0006
        DECR    R1                              ; 6CEC   0011
        SLR     R1,     2                       ; 6CED   0065
        INCR    R0                              ; 6CEE   0008
        RLC     R1,     1                       ; 6CEF   0051
        SLR     R1,     2                       ; 6CF0   0065
        EIS                                     ; 6CF1   0002
        RRC     R1,     1                       ; 6CF2   0071
        SLR     R1,     2                       ; 6CF3   0065
        DIS                                     ; 6CF4   0003
        TSTR    R1                              ; 6CF5   0089
        SLR     R1,     2                       ; 6CF6   0065
        DIS                                     ; 6CF7   0003
        MOVR    R4,     R1                      ; 6CF8   00A1
        SLR     R1,     2                       ; 6CF9   0065
        CLRC                                    ; 6CFA   0006
        SLR     R1,     1                       ; 6CFB   0061
        SLR     R1,     2                       ; 6CFC   0065
        EIS                                     ; 6CFD   0002
        ADDR    R2,     R1                      ; 6CFE   00D1
        SLR     R1,     2                       ; 6CFF   0065
        EIS                                     ; 6D00   0002
        SARC    R2,     2                       ; 6D01   007E
        MOVR    R0,     R1                      ; 6D02   0081
        DECLE   $0000                           ; 6D03   0000

        COMR    R0                              ; 6D04   0018
        ADDR    R7,     R7                      ; 6D05   00FF
        COMR    R0                              ; 6D06   0018
        ADDR    R7,     R7                      ; 6D07   00FF
        SLR     R2,     2                       ; 6D08   0066
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D09   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6D0D   0000 0000

        ADDR    R7,     R7                      ; 6D0F   00FF
        SLR     R2,     2                       ; 6D10   0066
        RSWD    R4                              ; 6D11   003C
        SWAP    R2,     1                       ; 6D12   0042
        SWAP    R2,     1                       ; 6D13   0042
        RSWD    R4                              ; 6D14   003C
        MOVR    R3,     R1                      ; 6D15   0099
        SLLC    R2,     1                       ; 6D16   005A
        ADDR    R7,     R7                      ; 6D17   00FF
        ADDR    R4,     R7                      ; 6D18   00E7
        SLR     R0,     1                       ; 6D19   0060
        RLC     R0,     1                       ; 6D1A   0050
        ADCR    R0                              ; 6D1B   0028
        NOP                                     ; 6D1C   0034
        COMR    R0                              ; 6D1D   0018
        SLLC    R2,     1                       ; 6D1E   005A
        ADDR    R7,     R7                      ; 6D1F   00FF
        ADDR    R4,     R7                      ; 6D20   00E7
        ADDR    R0,     R0                      ; 6D21   00C0
        SLR     R0,     1                       ; 6D22   0060
        GSWD    R0                              ; 6D23   0030
        COMR    R0                              ; 6D24   0018
        COMR    R0                              ; 6D25   0018
        COMR    R0                              ; 6D26   0018
        ADDR    R7,     R7                      ; 6D27   00FF
        ADDR    R7,     R7                      ; 6D28   00FF
        RRC     R0,     1                       ; 6D29   0070
        SARC    R0,     1                       ; 6D2A   0078
        RSWD    R4                              ; 6D2B   003C
        COMR    R4                              ; 6D2C   001C
        MOVR    R3,     R1                      ; 6D2D   0099
        SLLC    R2,     1                       ; 6D2E   005A
        ADDR    R7,     R7                      ; 6D2F   00FF
        ADDR    R4,     R7                      ; 6D30   00E7
        RSWD    R4                              ; 6D31   003C
        SARC    R2,     2                       ; 6D32   007E
        SARC    R2,     2                       ; 6D33   007E
        RSWD    R4                              ; 6D34   003C
        MOVR    R3,     R1                      ; 6D35   0099
        SLLC    R2,     1                       ; 6D36   005A
        ADDR    R7,     R7                      ; 6D37   00FF
        ADDR    R4,     R7                      ; 6D38   00E7
        INCR    R6                              ; 6D39   000E
        COMR    R6                              ; 6D3A   001E
        RSWD    R6                              ; 6D3B   003E
        RSWD    R4                              ; 6D3C   003C
        MOVR    R3,     R1                      ; 6D3D   0099
        SLLC    R2,     1                       ; 6D3E   005A
        ADDR    R7,     R7                      ; 6D3F   00FF
        ADDR    R4,     R7                      ; 6D40   00E7
        DIS                                     ; 6D41   0003
        CLRC                                    ; 6D42   0006
        INCR    R4                              ; 6D43   000C
        COMR    R0                              ; 6D44   0018
        MOVR    R3,     R1                      ; 6D45   0099
        SLLC    R2,     1                       ; 6D46   005A
        ADDR    R7,     R7                      ; 6D47   00FF
        ADDR    R4,     R7                      ; 6D48   00E7
        CLRC                                    ; 6D49   0006
        INCR    R2                              ; 6D4A   000A
        DECR    R6                              ; 6D4B   0016
        ADCR    R4                              ; 6D4C   002C
        MOVR    R3,     R1                      ; 6D4D   0099
        SLLC    R2,     1                       ; 6D4E   005A
        ADDR    R7,     R7                      ; 6D4F   00FF
        ADDR    R4,     R7                      ; 6D50   00E7
        ADDR    R4,     R7                      ; 6D51   00E7
        ADDR    R2,     R3                      ; 6D52   00D3
        ADDR    R6,     R7                      ; 6D53   00F7
        ADDR    R2,     R3                      ; 6D54   00D3
        ADDR    R6,     R7                      ; 6D55   00F7
        ADDR    R2,     R3                      ; 6D56   00D3
        ADDR    R6,     R7                      ; 6D57   00F7
        ADDR    R6,     R7                      ; 6D58   00F7
        ADDR    R4,     R7                      ; 6D59   00E7
        ADDR    R1,     R3                      ; 6D5A   00CB
        ADDR    R5,     R7                      ; 6D5B   00EF
        ADDR    R1,     R3                      ; 6D5C   00CB
        ADDR    R5,     R7                      ; 6D5D   00EF
        ADDR    R1,     R3                      ; 6D5E   00CB
        ADDR    R5,     R7                      ; 6D5F   00EF
        ADDR    R5,     R7                      ; 6D60   00EF
        DECLE   $0000,  $0000,  $0001           ; 6D61   0000 0000 0001

        EIS                                     ; 6D64   0002

        JSRD    R4,     .STIC.X.1               ; 6D65   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D68   0000 0000 0000 0000

        EIS                                     ; 6D6C   0002

        JSRD    R4,     .STIC.X.1               ; 6D6D   0004 0002 0001
        DECLE   $0000                           ; 6D70   0000

        ADDR    R7,     R7                      ; 6D71   00FF
        ADDR    R7,     R7                      ; 6D72   00FF
        ADDR    R6,     R0                      ; 6D73   00F0
        ADDR    R0,     R0                      ; 6D74   00C0
        NEGR    R4                              ; 6D75   0024
        ADDR    R0,     R0                      ; 6D76   00C0
        ADDR    R7,     R0                      ; 6D77   00F8
        ADDR    R7,     R4                      ; 6D78   00FC
        ADDR    R7,     R7                      ; 6D79   00FF
        ADDR    R7,     R7                      ; 6D7A   00FF
        ADDR    R6,     R0                      ; 6D7B   00F0
        ADDR    R0,     R0                      ; 6D7C   00C0
        DECR    R2                              ; 6D7D   0012
        ADDR    R0,     R0                      ; 6D7E   00C0
        ADDR    R7,     R0                      ; 6D7F   00F8
        ADDR    R7,     R4                      ; 6D80   00FC
        ADDR    R7,     R7                      ; 6D81   00FF
        ADDR    R7,     R7                      ; 6D82   00FF
        ADDR    R6,     R0                      ; 6D83   00F0
        ADDR    R0,     R0                      ; 6D84   00C0
        INCR    R1                              ; 6D85   0009
        ADDR    R0,     R0                      ; 6D86   00C0
        ADDR    R7,     R0                      ; 6D87   00F8
        ADDR    R7,     R4                      ; 6D88   00FC
        ADDR    R7,     R7                      ; 6D89   00FF
        ADDR    R7,     R7                      ; 6D8A   00FF
        INCR    R7                              ; 6D8B   000F
        DIS                                     ; 6D8C   0003
        NEGR    R4                              ; 6D8D   0024
        DIS                                     ; 6D8E   0003
        COMR    R7                              ; 6D8F   001F
        RSWD    R7                              ; 6D90   003F
        ADDR    R7,     R7                      ; 6D91   00FF
        ADDR    R7,     R7                      ; 6D92   00FF
        INCR    R7                              ; 6D93   000F
        DIS                                     ; 6D94   0003
        SLL     R0,     1                       ; 6D95   0048
        DIS                                     ; 6D96   0003
        COMR    R7                              ; 6D97   001F
        RSWD    R7                              ; 6D98   003F
        ADDR    R7,     R7                      ; 6D99   00FF
        ADDR    R7,     R7                      ; 6D9A   00FF
        INCR    R7                              ; 6D9B   000F
        DIS                                     ; 6D9C   0003
        MOVR    R2,     R0                      ; 6D9D   0090
        DIS                                     ; 6D9E   0003
        COMR    R7                              ; 6D9F   001F
        RSWD    R7                              ; 6DA0   003F
        ADDR    R7,     R7                      ; 6DA1   00FF
        ADDR    R7,     R7                      ; 6DA2   00FF
        ADDR    R7,     R7                      ; 6DA3   00FF
        ADDR    R4,     R7                      ; 6DA4   00E7
        ADDR    R0,     R3                      ; 6DA5   00C3
        MOVR    R0,     R1                      ; 6DA6   0081
        MOVR    R0,     R1                      ; 6DA7   0081
        COMR    R0                              ; 6DA8   0018
        ADDR    R7,     R7                      ; 6DA9   00FF
        ADDR    R7,     R7                      ; 6DAA   00FF
        ADDR    R7,     R7                      ; 6DAB   00FF
        ADDR    R4,     R7                      ; 6DAC   00E7
        ADDR    R0,     R3                      ; 6DAD   00C3
        MOVR    R0,     R1                      ; 6DAE   0081
        MOVR    R3,     R1                      ; 6DAF   0099
        NEGR    R4                              ; 6DB0   0024
        ADDR    R7,     R7                      ; 6DB1   00FF
        ADDR    R7,     R7                      ; 6DB2   00FF
        ADDR    R7,     R7                      ; 6DB3   00FF
        ADDR    R4,     R7                      ; 6DB4   00E7
        ADDR    R0,     R3                      ; 6DB5   00C3
        MOVR    R3,     R1                      ; 6DB6   0099
        MOVR    R4,     R5                      ; 6DB7   00A5
        SWAP    R2,     1                       ; 6DB8   0042
        ADDR    R7,     R7                      ; 6DB9   00FF
        ADDR    R7,     R7                      ; 6DBA   00FF
        ADDR    R7,     R7                      ; 6DBB   00FF
        ADDR    R4,     R7                      ; 6DBC   00E7
        ADDR    R3,     R3                      ; 6DBD   00DB
        MOVR    R4,     R5                      ; 6DBE   00A5
        MOVR    R4,     R5                      ; 6DBF   00A5
        SWAP    R2,     1                       ; 6DC0   0042
        ADDR    R7,     R7                      ; 6DC1   00FF
        ADDR    R7,     R7                      ; 6DC2   00FF
        ADDR    R7,     R7                      ; 6DC3   00FF
        ADDR    R4,     R7                      ; 6DC4   00E7
        ADDR    R0,     R3                      ; 6DC5   00C3
        MOVR    R0,     R1                      ; 6DC6   0081
        MOVR    R0,     R1                      ; 6DC7   0081
        DECLE   $0000                           ; 6DC8   0000

        ADDR    R7,     R7                      ; 6DC9   00FF
        ADDR    R7,     R7                      ; 6DCA   00FF
        ADDR    R7,     R7                      ; 6DCB   00FF
        ADDR    R4,     R7                      ; 6DCC   00E7
        ADDR    R0,     R3                      ; 6DCD   00C3
        MOVR    R0,     R1                      ; 6DCE   0081
        MOVR    R0,     R1                      ; 6DCF   0081
        DECLE   $0000,  $0000,  $0000           ; 6DD0   0000 0000 0000

        TSTR    R0                              ; 6DD3   0080
        SWAP    R0,     1                       ; 6DD4   0040
        NEGR    R0                              ; 6DD5   0020
        SWAP    R0,     1                       ; 6DD6   0040
        TSTR    R0                              ; 6DD7   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD8   0000 0000 0000 0000

        SWAP    R0,     1                       ; 6DDC   0040
        NEGR    R0                              ; 6DDD   0020
        SWAP    R0,     1                       ; 6DDE   0040
        TSTR    R0                              ; 6DDF   0080
        DECLE   $0000                           ; 6DE0   0000

        SWAP    R0,     1                       ; 6DE1   0040
        CMPR    R0,     R0                      ; 6DE2   0140
        INCR    R7                              ; 6DE3   000F
        INCR    R6                              ; 6DE4   000E
        COMR    R4                              ; 6DE5   001C
        COMR    R0                              ; 6DE6   0018
        GSWD    R0                              ; 6DE7   0030
        NEGR    R0                              ; 6DE8   0020
        SWAP    R0,     1                       ; 6DE9   0040
        TSTR    R0                              ; 6DEA   0080
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6DEB   0000 0000 0001 0001

        DIS                                     ; 6DEF   0003
        DIS                                     ; 6DF0   0003
        SETC                                    ; 6DF1   0007
        SETC                                    ; 6DF2   0007
        ADDR    R7,     R7                      ; 6DF3   00FF
        ADDR    R7,     R6                      ; 6DF4   00FE
        ADDR    R7,     R4                      ; 6DF5   00FC
        ADDR    R7,     R0                      ; 6DF6   00F8
        ADDR    R6,     R0                      ; 6DF7   00F0
        ADDR    R4,     R0                      ; 6DF8   00E0
        ADDR    R0,     R0                      ; 6DF9   00C0
        TSTR    R0                              ; 6DFA   0080
        INCR    R7                              ; 6DFB   000F
        DIS                                     ; 6DFC   0003
        SETC                                    ; 6DFD   0007
        INCR    R7                              ; 6DFE   000F
        SETC                                    ; 6DFF   0007
        DIS                                     ; 6E00   0003
        DECLE   $0001,  $0000                   ; 6E01   0001 0000

        ADDR    R4,     R7                      ; 6E03   00E7
        ADDR    R0,     R2                      ; 6E04   00C2
        MOVR    R0,     R6                      ; 6E05   0086
        ADDR    R1,     R2                      ; 6E06   00CA
        ADDR    R2,     R2                      ; 6E07   00D2
        ADDR    R4,     R3                      ; 6E08   00E3
        ADDR    R5,     R7                      ; 6E09   00EF
        ADDR    R7,     R7                      ; 6E0A   00FF
        COMR    R4                              ; 6E0B   001C
        INCR    R1                              ; 6E0C   0009
        INCR    R7                              ; 6E0D   000F
        INCR    R1                              ; 6E0E   0009
        INCR    R3                              ; 6E0F   000B
        COMR    R1                              ; 6E10   0019
        SLL     R3,     1                       ; 6E11   004B
        ADDR    R5,     R7                      ; 6E12   00EF
        INCR    R7                              ; 6E13   000F
        INCR    R7                              ; 6E14   000F
        COMR    R7                              ; 6E15   001F
        COMR    R7                              ; 6E16   001F
        RSWD    R7                              ; 6E17   003F
        RSWD    R7                              ; 6E18   003F
        SARC    R3,     2                       ; 6E19   007F
        SARC    R3,     2                       ; 6E1A   007F
        ADDR    R7,     R7                      ; 6E1B   00FF
        ADDR    R7,     R6                      ; 6E1C   00FE
        ADDR    R7,     R0                      ; 6E1D   00F8
        ADDR    R4,     R0                      ; 6E1E   00E0
        ADDR    R0,     R0                      ; 6E1F   00C0
        ADDR    R0,     R0                      ; 6E20   00C0
        TSTR    R0                              ; 6E21   0080
        DECLE   $0000                           ; 6E22   0000

        ADDR    R6,     R0                      ; 6E23   00F0
        RRC     R0,     1                       ; 6E24   0070
        RSWD    R0                              ; 6E25   0038
        COMR    R0                              ; 6E26   0018
        INCR    R4                              ; 6E27   000C

        JSRD    R4,     .STIC.X.1               ; 6E28   0004 0002 0001

        COMR    R7                              ; 6E2B   001F
        SETC                                    ; 6E2C   0007
        DIS                                     ; 6E2D   0003
        DECLE   $0001                           ; 6E2E   0001

        SETC                                    ; 6E2F   0007
        GSWD    R3                              ; 6E30   0033
        SARC    R3,     2                       ; 6E31   007F
        ADDR    R7,     R7                      ; 6E32   00FF
        ADDR    R7,     R7                      ; 6E33   00FF
        SARC    R3,     2                       ; 6E34   007F
        RSWD    R7                              ; 6E35   003F
        COMR    R7                              ; 6E36   001F
        INCR    R7                              ; 6E37   000F
        SETC                                    ; 6E38   0007
        DIS                                     ; 6E39   0003
        DECLE   $0001,  $0000,  $0000           ; 6E3A   0001 0000 0000

        TSTR    R0                              ; 6E3D   0080
        TSTR    R0                              ; 6E3E   0080
        ADDR    R0,     R0                      ; 6E3F   00C0
        ADDR    R0,     R0                      ; 6E40   00C0
        ADDR    R4,     R0                      ; 6E41   00E0
        ADDR    R4,     R0                      ; 6E42   00E0
        SARC    R3,     2                       ; 6E43   007F
        RSWD    R7                              ; 6E44   003F
        COMR    R7                              ; 6E45   001F
        SETC                                    ; 6E46   0007
        SETC                                    ; 6E47   0007
        DIS                                     ; 6E48   0003
        DIS                                     ; 6E49   0003
        DECLE   $0001                           ; 6E4A   0001

        ADDR    R6,     R0                      ; 6E4B   00F0
        ADDR    R6,     R0                      ; 6E4C   00F0
        ADDR    R7,     R0                      ; 6E4D   00F8
        ADDR    R7,     R0                      ; 6E4E   00F8
        ADDR    R7,     R4                      ; 6E4F   00FC
        ADDR    R7,     R4                      ; 6E50   00FC
        ADDR    R7,     R6                      ; 6E51   00FE
        ADDR    R7,     R6                      ; 6E52   00FE
        COMR    R0                              ; 6E53   0018
        RSWD    R6                              ; 6E54   003E
        SARC    R3,     2                       ; 6E55   007F
        RSWD    R7                              ; 6E56   003F
        SARC    R3,     2                       ; 6E57   007F
        RSWD    R3                              ; 6E58   003B
        DECR    R1                              ; 6E59   0011
        DECLE   $0000                           ; 6E5A   0000

        ADDR    R7,     R7                      ; 6E5B   00FF
        SARC    R3,     2                       ; 6E5C   007F
        RSWD    R7                              ; 6E5D   003F
        COMR    R7                              ; 6E5E   001F
        COMR    R7                              ; 6E5F   001F
        INCR    R7                              ; 6E60   000F
        COMR    R7                              ; 6E61   001F
        RSWD    R7                              ; 6E62   003F
        DECLE   $0001                           ; 6E63   0001

        DIS                                     ; 6E64   0003
        SETC                                    ; 6E65   0007
        INCR    R7                              ; 6E66   000F
        COMR    R7                              ; 6E67   001F
        INCR    R7                              ; 6E68   000F
        SETC                                    ; 6E69   0007
        INCR    R7                              ; 6E6A   000F
        ADDR    R7,     R7                      ; 6E6B   00FF
        ADDR    R7,     R7                      ; 6E6C   00FF
        ADDR    R7,     R7                      ; 6E6D   00FF
        ADDR    R7,     R7                      ; 6E6E   00FF
        ADDR    R7,     R7                      ; 6E6F   00FF
        RSWD    R7                              ; 6E70   003F
        INCR    R7                              ; 6E71   000F
        DIS                                     ; 6E72   0003
        DECLE   $0000                           ; 6E73   0000

        TSTR    R0                              ; 6E74   0080
        ADDR    R0,     R0                      ; 6E75   00C0
        ADDR    R4,     R0                      ; 6E76   00E0
        ADDR    R6,     R0                      ; 6E77   00F0
        RSWD    R0                              ; 6E78   0038
        INCR    R4                              ; 6E79   000C
        DIS                                     ; 6E7A   0003
        DECR    R0                              ; 6E7B   0010
        MOVR    R7,     R0                      ; 6E7C   00B8
        ADDR    R7,     R4                      ; 6E7D   00FC
        ADDR    R7,     R7                      ; 6E7E   00FF
        ADDR    R7,     R6                      ; 6E7F   00FE
        ADDR    R6,     R4                      ; 6E80   00F4
        TSTR    R0                              ; 6E81   0080
        DECLE   $0000                           ; 6E82   0000

        ADDR    R7,     R7                      ; 6E83   00FF
        RSWD    R7                              ; 6E84   003F
        INCR    R7                              ; 6E85   000F
        DIS                                     ; 6E86   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E87   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 6E8B   0000 0001

        DIS                                     ; 6E8D   0003
        SETC                                    ; 6E8E   0007
        INCR    R7                              ; 6E8F   000F
        COMR    R4                              ; 6E90   001C
        GSWD    R0                              ; 6E91   0030
        ADDR    R0,     R0                      ; 6E92   00C0
        ADDR    R0,     R0                      ; 6E93   00C0
        ADDR    R6,     R0                      ; 6E94   00F0
        SARC    R0,     1                       ; 6E95   0078
        SARC    R0,     2                       ; 6E96   007C
        RSWD    R4                              ; 6E97   003C
        RSWD    R6                              ; 6E98   003E
        COMR    R7                              ; 6E99   001F
        RSWD    R7                              ; 6E9A   003F
        ADDR    R7,     R7                      ; 6E9B   00FF
        ADDR    R7,     R7                      ; 6E9C   00FF
        ADDR    R7,     R7                      ; 6E9D   00FF
        ADDR    R7,     R7                      ; 6E9E   00FF
        ADDR    R7,     R7                      ; 6E9F   00FF
        ADDR    R7,     R4                      ; 6EA0   00FC
        ADDR    R6,     R0                      ; 6EA1   00F0
        ADDR    R0,     R0                      ; 6EA2   00C0
        ADDR    R7,     R7                      ; 6EA3   00FF
        ADDR    R7,     R7                      ; 6EA4   00FF
        ADDR    R7,     R7                      ; 6EA5   00FF
        ADDR    R6,     R3                      ; 6EA6   00F3
        ADDR    R4,     R5                      ; 6EA7   00E5
        ADDR    R0,     R6                      ; 6EA8   00C6
        MOVR    R1,     R7                      ; 6EA9   008F
        SLLC    R3,     2                       ; 6EAA   005F
        MOVR    R0,     R1                      ; 6EAB   0081
        ADDR    R0,     R7                      ; 6EAC   00C7
        ADDR    R5,     R7                      ; 6EAD   00EF
        ADDR    R7,     R7                      ; 6EAE   00FF
        ADDR    R7,     R7                      ; 6EAF   00FF
        SARC    R3,     2                       ; 6EB0   007F
        SLR     R3,     2                       ; 6EB1   0067
        MOVR    R0,     R3                      ; 6EB2   0083
        ADDR    R7,     R7                      ; 6EB3   00FF
        ADDR    R7,     R4                      ; 6EB4   00FC
        ADDR    R6,     R0                      ; 6EB5   00F0
        ADDR    R0,     R0                      ; 6EB6   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBB   0000 0000 0000 0000

        DECR    R0                              ; 6EBF   0010
        RSWD    R0                              ; 6EC0   0038
        SARC    R2,     2                       ; 6EC1   007E
        ADDR    R7,     R7                      ; 6EC2   00FF
        ADDR    R6,     R0                      ; 6EC3   00F0
        ADDR    R6,     R0                      ; 6EC4   00F0
        ADDR    R7,     R0                      ; 6EC5   00F8
        ADDR    R7,     R0                      ; 6EC6   00F8
        ADDR    R7,     R4                      ; 6EC7   00FC
        RSWD    R4                              ; 6EC8   003C
        INCR    R6                              ; 6EC9   000E
        DIS                                     ; 6ECA   0003
        RSWD    R7                              ; 6ECB   003F
        COMR    R7                              ; 6ECC   001F
        RSWD    R7                              ; 6ECD   003F
        RSWD    R7                              ; 6ECE   003F
        SARC    R3,     1                       ; 6ECF   007B
        RRC     R1,     1                       ; 6ED0   0071
        ADDR    R0,     R3                      ; 6ED1   00C3
        MOVR    R0,     R1                      ; 6ED2   0081
        MOVR    R3,     R5                      ; 6ED3   009D
        ADDR    R1,     R2                      ; 6ED4   00CA
        ADDR    R7,     R6                      ; 6ED5   00FE
        ADDR    R7,     R0                      ; 6ED6   00F8
        ADDR    R0,     R0                      ; 6ED7   00C0
        ADDR    R2,     R0                      ; 6ED8   00D0
        ADDR    R7,     R0                      ; 6ED9   00F8
        ADDR    R7,     R4                      ; 6EDA   00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDF   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 6EE3   00FF
        ADDR    R7,     R7                      ; 6EE4   00FF
        ADDR    R7,     R7                      ; 6EE5   00FF
        ADDR    R7,     R4                      ; 6EE6   00FC
        ADDR    R6,     R3                      ; 6EE7   00F3
        ADDR    R1,     R7                      ; 6EE8   00CF
        TSTR    R7                              ; 6EE9   00BF
        SARC    R3,     2                       ; 6EEA   007F
        ADDR    R7,     R7                      ; 6EEB   00FF
        ADDR    R7,     R0                      ; 6EEC   00F8
        MOVR    R0,     R7                      ; 6EED   0087
        SARC    R3,     2                       ; 6EEE   007F
        ADDR    R7,     R7                      ; 6EEF   00FF
        ADDR    R7,     R7                      ; 6EF0   00FF
        ADDR    R7,     R7                      ; 6EF1   00FF
        ADDR    R7,     R7                      ; 6EF2   00FF
        ADDR    R7,     R7                      ; 6EF3   00FF
        COMR    R7                              ; 6EF4   001F
        ADDR    R4,     R1                      ; 6EF5   00E1
        ADDR    R7,     R6                      ; 6EF6   00FE
        ADDR    R7,     R7                      ; 6EF7   00FF
        ADDR    R7,     R7                      ; 6EF8   00FF
        ADDR    R7,     R7                      ; 6EF9   00FF
        ADDR    R7,     R7                      ; 6EFA   00FF
        ADDR    R7,     R7                      ; 6EFB   00FF
        ADDR    R7,     R7                      ; 6EFC   00FF
        ADDR    R7,     R7                      ; 6EFD   00FF
        RSWD    R7                              ; 6EFE   003F
        ADDR    R1,     R7                      ; 6EFF   00CF
        ADDR    R6,     R3                      ; 6F00   00F3
        ADDR    R7,     R5                      ; 6F01   00FD
        ADDR    R7,     R6                      ; 6F02   00FE

        JSR     R4,     G_0C2E                  ; 6F03   0004 000C 002E

        SAR     R2,     1                       ; 6F06   006A
        SARC    R2,     2                       ; 6F07   007E
        SLLC    R3,     2                       ; 6F08   005F
        SARC    R3,     2                       ; 6F09   007F
        ADDR    R7,     R7                      ; 6F0A   00FF
        DECLE   $0000                           ; 6F0B   0000

        NEGR    R0                              ; 6F0C   0020
        GSWD    R0                              ; 6F0D   0030
        RSWD    R2                              ; 6F0E   003A
        SARC    R2,     1                       ; 6F0F   007A
        SLLC    R2,     2                       ; 6F10   005E
        ADDR    R7,     R3                      ; 6F11   00FB
        ADDR    R7,     R7                      ; 6F12   00FF
        INCR    R7                              ; 6F13   000F
        INCR    R7                              ; 6F14   000F
        COMR    R7                              ; 6F15   001F
        COMR    R7                              ; 6F16   001F
        RSWD    R7                              ; 6F17   003F
        RSWD    R4                              ; 6F18   003C
        RRC     R0,     1                       ; 6F19   0070
        ADDR    R0,     R0                      ; 6F1A   00C0
        RSWD    R4                              ; 6F1B   003C
        SWAP    R2,     1                       ; 6F1C   0042
        MOVR    R3,     R1                      ; 6F1D   0099
        MOVR    R4,     R1                      ; 6F1E   00A1
        MOVR    R4,     R1                      ; 6F1F   00A1
        MOVR    R3,     R1                      ; 6F20   0099
        SWAP    R2,     1                       ; 6F21   0042
        RSWD    R4                              ; 6F22   003C
        INCR    R0                              ; 6F23   0008
        RSWD    R2                              ; 6F24   003A
        RRC     R2,     2                       ; 6F25   0076
        RSWD    R3                              ; 6F26   003B
        DECR    R6                              ; 6F27   0016
        RSWD    R3                              ; 6F28   003B
        DECLE   $0000                           ; 6F29   0000

        GSWD    R2                              ; 6F2A   0032
        DECLE   $0000                           ; 6F2B   0000

        GSWD    R2                              ; 6F2C   0032
        DECLE   $0000                           ; 6F2D   0000

        GSWD    R2                              ; 6F2E   0032
        DECLE   $0000                           ; 6F2F   0000

        GSWD    R2                              ; 6F30   0032
        DECLE   $0000                           ; 6F31   0000

        GSWD    R2                              ; 6F32   0032
        CLRC                                    ; 6F33   0006
        RSWD    R2                              ; 6F34   003A
        DECLE   $0000                           ; 6F35   0000

        GSWD    R2                              ; 6F36   0032
        DECLE   $0000                           ; 6F37   0000

        GSWD    R2                              ; 6F38   0032
        DECLE   $0000                           ; 6F39   0000

        GSWD    R2                              ; 6F3A   0032
        DECLE   $0000                           ; 6F3B   0000

        GSWD    R2                              ; 6F3C   0032
        DECLE   $0000                           ; 6F3D   0000

        GSWD    R2                              ; 6F3E   0032
        DECLE   $0000                           ; 6F3F   0000

        GSWD    R2                              ; 6F40   0032
        DECLE   $0000                           ; 6F41   0000

        GSWD    R2                              ; 6F42   0032
        DECLE   $0000                           ; 6F43   0000

        GSWD    R2                              ; 6F44   0032
        ADDR    R4,     R6                      ; 6F45   00E6
        RSWD    R2                              ; 6F46   003A
        NEGR    R6                              ; 6F47   0026
        RSWD    R3                              ; 6F48   003B
        INCR    R0                              ; 6F49   0008
        RSWD    R2                              ; 6F4A   003A
        SLLC    R0,     2                       ; 6F4B   005C
        ADCR    R2                              ; 6F4C   002A
        MOVR    R4,     R1                      ; 6F4D   00A1
        ADCR    R0                              ; 6F4E   0028
        COMR    R1                              ; 6F4F   0019
        COMR    R4                              ; 6F50   001C
        NEGR    R1                              ; 6F51   0021
        COMR    R4                              ; 6F52   001C
        EIS                                     ; 6F53   0002
        EIS                                     ; 6F54   0002
        EIS                                     ; 6F55   0002
        EIS                                     ; 6F56   0002
        DECR    R1                              ; 6F57   0011
        ADCR    R4                              ; 6F58   002C
        SARC    R1,     1                       ; 6F59   0079
        ADCR    R2                              ; 6F5A   002A
        MOVR    R7,     R4                      ; 6F5B   00BC
        ADCR    R2                              ; 6F5C   002A
        MOVR    R7,     R1                      ; 6F5D   00B9
        ADCR    R0                              ; 6F5E   0028
        EIS                                     ; 6F5F   0002
        EIS                                     ; 6F60   0002
        EIS                                     ; 6F61   0002
        EIS                                     ; 6F62   0002
        EIS                                     ; 6F63   0002
        EIS                                     ; 6F64   0002
        EIS                                     ; 6F65   0002
        EIS                                     ; 6F66   0002
        EIS                                     ; 6F67   0002
        EIS                                     ; 6F68   0002
        COMR    R1                              ; 6F69   0019
        COMR    R4                              ; 6F6A   001C
        NEGR    R1                              ; 6F6B   0021
        COMR    R4                              ; 6F6C   001C
        EIS                                     ; 6F6D   0002
        EIS                                     ; 6F6E   0002
        DECR    R1                              ; 6F6F   0011
        ADCR    R4                              ; 6F70   002C
        MOVR    R7,     R4                      ; 6F71   00BC
        INCR    R2                              ; 6F72   000A
        DECLE   $0000                           ; 6F73   0000

        NEGR    R2                              ; 6F74   0022
        MOVR    R7,     R4                      ; 6F75   00BC
        ADCR    R2                              ; 6F76   002A
        SLR     R0,     2                       ; 6F77   0064
        INCR    R2                              ; 6F78   000A
        SWAP    R1,     1                       ; 6F79   0041
        INCR    R1                              ; 6F7A   0009
        SLLC    R1,     1                       ; 6F7B   0059
        INCR    R1                              ; 6F7C   0009
        ADCR    R1                              ; 6F7D   0029
        COMR    R0                              ; 6F7E   0018
        SAR     R1,     2                       ; 6F7F   006D
        INCR    R2                              ; 6F80   000A
        DECLE   $0000                           ; 6F81   0000

        NEGR    R2                              ; 6F82   0022
        ADCR    R4                              ; 6F83   002C
        ADCR    R3                              ; 6F84   002B
        SLLC    R1,     1                       ; 6F85   0059
        ADCR    R0                              ; 6F86   0028
        DECR    R1                              ; 6F87   0011
        ADCR    R4                              ; 6F88   002C
        SWAP    R1,     1                       ; 6F89   0041
        INCR    R1                              ; 6F8A   0009
        SLL     R1,     1                       ; 6F8B   0049
        INCR    R1                              ; 6F8C   0009
        RLC     R1,     1                       ; 6F8D   0051
        INCR    R1                              ; 6F8E   0009
        SLLC    R1,     1                       ; 6F8F   0059
        INCR    R1                              ; 6F90   0009
        ADDR    R0,     R5                      ; 6F91   00C5
        INCR    R2                              ; 6F92   000A
        MOVR    R4,     R1                      ; 6F93   00A1
        ADCR    R0                              ; 6F94   0028
        ADCR    R1                              ; 6F95   0029
        COMR    R0                              ; 6F96   0018
        SAR     R1,     2                       ; 6F97   006D
        INCR    R2                              ; 6F98   000A
        TSTR    R4                              ; 6F99   00A4
        ADCR    R2                              ; 6F9A   002A
        DECLE   $0005                           ; 6F9B   0005

        ADCR    R1                              ; 6F9C   0029
        SLLC    R0,     2                       ; 6F9D   005C
        ADCR    R2                              ; 6F9E   002A
        ADDR    R0,     R1                      ; 6F9F   00C1
        ADCR    R0                              ; 6FA0   0028
        SAR     R3,     1                       ; 6FA1   006B
        INCR    R3                              ; 6FA2   000B
        SLR     R3,     1                       ; 6FA3   0063
        INCR    R3                              ; 6FA4   000B
        MOVR    R7,     R5                      ; 6FA5   00BD
        INCR    R2                              ; 6FA6   000A
        ADDR    R6,     R4                      ; 6FA7   00F4
        ADCR    R2                              ; 6FA8   002A
        DECLE   $0000                           ; 6FA9   0000

        NEGR    R2                              ; 6FAA   0022
        SLLC    R0,     2                       ; 6FAB   005C
        ADCR    R2                              ; 6FAC   002A
        DECLE   $0004                           ; 6FAD   0004

        ADCR    R3                              ; 6FAE   002B
        NOP                                     ; 6FAF   0034
        INCR    R3                              ; 6FB0   000B
        SLR     R3,     1                       ; 6FB1   0063
        INCR    R3                              ; 6FB2   000B
        SAR     R3,     1                       ; 6FB3   006B
        INCR    R3                              ; 6FB4   000B
        SLR     R3,     1                       ; 6FB5   0063
        INCR    R3                              ; 6FB6   000B
        SAR     R3,     1                       ; 6FB7   006B
        INCR    R3                              ; 6FB8   000B
        MOVR    R7,     R5                      ; 6FB9   00BD
        INCR    R2                              ; 6FBA   000A
        MOVR    R7,     R4                      ; 6FBB   00BC
        ADCR    R2                              ; 6FBC   002A
        SLLC    R1,     2                       ; 6FBD   005D
        ADCR    R0                              ; 6FBE   0028
        DECLE   $0000                           ; 6FBF   0000

        NEGR    R2                              ; 6FC0   0022
        DECLE   $0000                           ; 6FC1   0000

        NEGR    R2                              ; 6FC2   0022
        DECLE   $0000                           ; 6FC3   0000

        NEGR    R2                              ; 6FC4   0022
        SARC    R1,     2                       ; 6FC5   007D
        ADCR    R0                              ; 6FC6   0028
        DECLE   $0004                           ; 6FC7   0004

        ADCR    R3                              ; 6FC8   002B
        MOVR    R4,     R5                      ; 6FC9   00A5
        ADCR    R0                              ; 6FCA   0028
        DECLE   $0000                           ; 6FCB   0000

        NEGR    R2                              ; 6FCC   0022
        DECLE   $0005                           ; 6FCD   0005

        ADCR    R1                              ; 6FCE   0029
        INCR    R5                              ; 6FCF   000D
        ADCR    R1                              ; 6FD0   0029
        DECLE   $0000                           ; 6FD1   0000

        NEGR    R2                              ; 6FD2   0022
        DECLE   $0000                           ; 6FD3   0000

        NEGR    R2                              ; 6FD4   0022
        MOVR    R7,     R4                      ; 6FD5   00BC
        ADCR    R2                              ; 6FD6   002A
        DECLE   $0000                           ; 6FD7   0000

        NEGR    R0                              ; 6FD8   0020
        MOVR    R1,     R5                      ; 6FD9   008D
        ADCR    R0                              ; 6FDA   0028
        DECLE   $0000                           ; 6FDB   0000

        NEGR    R2                              ; 6FDC   0022
        DECLE   $0005                           ; 6FDD   0005

        ADCR    R1                              ; 6FDE   0029
        DECLE   $0000                           ; 6FDF   0000

        NEGR    R2                              ; 6FE0   0022
        DECLE   $0000                           ; 6FE1   0000

        NEGR    R2                              ; 6FE2   0022
        ADCR    R4                              ; 6FE3   002C
        ADCR    R3                              ; 6FE4   002B
        DECLE   $0000                           ; 6FE5   0000

        NEGR    R0                              ; 6FE6   0020
        ADCR    R5                              ; 6FE7   002D
        ADCR    R1                              ; 6FE8   0029
        DECLE   $0005                           ; 6FE9   0005

        ADCR    R1                              ; 6FEA   0029
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
