
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
        MVII    #$4DCD, R0                      ; 5022   02B8 00CD 004D
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
        MVII    #$4CEA, R4                      ; 5039   02BC 00EA 004C
        MVII    #$0328, R5                      ; 503C   02BD 0328
L_503E:
        MVI@    R4,     R0                      ; 503E   02A0
        XORR    R2,     R0                      ; 503F   01D0
        MVO@    R0,     R5                      ; 5040   0268
        DECR    R1                              ; 5041   0011
        BNEQ    L_503E                          ; 5042   022C 0005

        MVII    #$0171, R4                      ; 5044   02BC 0171
        MVII    #$0003, R2                      ; 5046   02BA 0003
L_5048:
        MVO@    R0,     R4                      ; 5048   0260
        DECR    R2                              ; 5049   0012
        BNEQ    L_5048                          ; 504A   022C 0003

        EIS                                     ; 504C   0002
L_504D:
        MVI     G_010F, R0                      ; 504D   0280 010F
        TSTR    R0                              ; 504F   0080
        BNEQ    L_504D                          ; 5050   022C 0004

        JSR     R5,     G_4D16                  ; 5052   0004 014C 0116
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
        MVII    #$4D04, R4                      ; 5074   02BC 0004 004D
        MVII    #$0163, R3                      ; 5077   02BB 0163
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
        CMPI    #$0169, R3                      ; 5098   037B 0169
        BLT     L_5079                          ; 509A   0225 0022

L_509C:
        PULR    R7                              ; 509C   02B7
        PSHR    R5                              ; 509D   0275
L_509E:
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
        MVII    #$034B, R3                      ; 50C3   02BB 034B
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
        CMPI    #$0353, R3                      ; 5112   037B 0353
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
        MVII    #$0003, R0                      ; 513A   02B8 0003
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
L_5160:
        PSHR    R5                              ; 5160   0275
        DECR    R2                              ; 5161   0012
        MOVR    R3,     R1                      ; 5162   0099
        ANDI    #$000F, R1                      ; 5163   03B9 000F
        MOVR    R3,     R0                      ; 5165   0098
        SWAP    R0,     1                       ; 5166   0040
        ANDI    #$003E, R0                      ; 5167   03B8 003E
        SLR     R0,     1                       ; 5169   0060
        TSTR    R0                              ; 516A   0080
        BEQ     L_517E                          ; 516B   0204 0011

L_516D:
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
        MVO     R0,     G_0174                  ; 518E   0240 0174
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

L_51A8:
        DECR    R1                              ; 51A8   0011
        BEQ     L_519F                          ; 51A9   0224 000B

        MVI     G_0174, R1                      ; 51AB   0281 0174
        MVO     R1,     .STIC.BORD              ; 51AD   0241 002C
        MVO     R0,     G_0102                  ; 51AF   0240 0102
L_51B1:
        MVO     R0,     .STIC.VIDEN             ; 51B1   0240 0020
        INCR    R0                              ; 51B3   0008
        MVO     R0,     G_0103                  ; 51B4   0240 0103

        JSR     R5,     G_4B0A                  ; 51B6   0004 0148 030A

        MVII    #$034B, R3                      ; 51B9   02BB 034B
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

        MVII    #$0169, R1                      ; 51DE   02B9 0169
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
        MVII    #$4CEA, R5                      ; 51FB   02BD 00EA 004C
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
L_5217:
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
        CMPI    #$0003, R1                      ; 5249   0379 0003
        BGT     L_527F                          ; 524B   020E 0032

        MVI@    R4,     R3                      ; 524D   02A3
        ANDI    #$000F, R3                      ; 524E   03BB 000F
        PSHR    R4                              ; 5250   0274
        SDBD                                    ; 5251   0001
        MVI@    R5,     R4                      ; 5252   02AC
        PSHR    R5                              ; 5253   0275
        MVII    #$0171, R1                      ; 5254   02B9 0171
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
        MVII    #$0003, R0                      ; 5373   02B8 0003
        MVII    #$0348, R1                      ; 5375   02B9 0348
        SDBD                                    ; 5377   0001
        MVII    #$4CF2, R4                      ; 5378   02BC 00F2 004C
        TSTR    R0                              ; 537B   0080
        BEQ     L_538C                          ; 537C   0204 000E

        JSR     R5,     .EXEC.730               ; 537E   0004 0114 0330

        MVII    #$0003, R0                      ; 5381   02B8 0003
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
        MVII    #$622A, R4                      ; 538D   02BC 002A 0062
        MVI@    R4,     R1                      ; 5390   02A1
        SDBD                                    ; 5391   0001
        ADDI    #$3800, R1                      ; 5392   02F9 0000 0038
        MVI@    R4,     R0                      ; 5395   02A0

        JSR     R5,     .EXEC.730               ; 5396   0004 0114 0330

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
        MVII    #$0169, R1                      ; 53DD   02B9 0169
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
L_5481:
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
        DECLE   $0001,  $0000,  $0000,  $0000   ; 54E3   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 54E7   0000 0000 0000

        ANDR    R2,     R0                      ; 54EA   0190
        ANDR    R3,     R0                      ; 54EB   0198
        ANDR    R4,     R0                      ; 54EC   01A0
        ANDR    R6,     R0                      ; 54ED   01B0
        CLRR    R0                              ; 54EE   01C0
        XORR    R2,     R0                      ; 54EF   01D0
        XORR    R4,     R0                      ; 54F0   01E0
        XORR    R6,     R0                      ; 54F1   01F0
        DECLE   $0000,  $0000,  $0000           ; 54F2   0000 0000 0000

        INCR    R1                              ; 54F5   0009
        SLR     R2,     1                       ; 54F6   0062
        INCR    R4                              ; 54F7   000C
        SLR     R2,     1                       ; 54F8   0062
        INCR    R7                              ; 54F9   000F
        SLR     R2,     1                       ; 54FA   0062
        NEGR    R0                              ; 54FB   0020
        DECR    R0                              ; 54FC   0010
        DECR    R0                              ; 54FD   0010
        ADDR    R3,     R4                      ; 54FE   00DC
        SLR     R0,     2                       ; 54FF   0064
        ADDR    R3,     R7                      ; 5500   00DF
        SLR     R0,     2                       ; 5501   0064
L_5502:
        ADDR    R4,     R2                      ; 5502   00E2
        SLR     R0,     2                       ; 5503   0064
        INCR    R2                              ; 5504   000A
        ADDR    R7,     R0                      ; 5505   00F8
        RLC     R3,     1                       ; 5506   0053
        ADDR    R7,     R7                      ; 5507   00FF
        MOVR    R0,     R6                      ; 5508   0086
        RLC     R3,     2                       ; 5509   0057
        ADDR    R7,     R7                      ; 550A   00FF
        ADDR    R3,     R2                      ; 550B   00DA
        RLC     R2,     2                       ; 550C   0056
        ADDR    R7,     R7                      ; 550D   00FF
        MOVR    R0,     R7                      ; 550E   0087
        RLC     R2,     1                       ; 550F   0052
        ADDR    R7,     R7                      ; 5510   00FF
        MOVR    R0,     R6                      ; 5511   0086
        SLLC    R0,     1                       ; 5512   0058
        DIS                                     ; 5513   0003
        MOVR    R4,     R5                      ; 5514   00A5
        SLL     R2,     2                       ; 5515   004E
        PSHR    R5                              ; 5516   0275
        SDBD                                    ; 5517   0001
        MVII    #$0077, R0                      ; 5518   02B8 0077 0000
        MVO     R0,     .ISRVEC.0               ; 551B   0240 0100
        SDBD                                    ; 551D   0001
        MVII    #$0052, R0                      ; 551E   02B8 0052 0000
        MVO     R0,     .ISRVEC.1               ; 5521   0240 0101
        MVII    #$0003, R0                      ; 5523   02B8 0003
        MVO     R0,     G_010C                  ; 5525   0240 010C

        JSR     R5,     G_4E5E                  ; 5527   0004 014C 025E

        SDBD                                    ; 552A   0001
        MVII    #$0982, R0                      ; 552B   02B8 0082 0009
        MVO     R0,     .BTAB.04                ; 552E   0240 0204
        MVII    #$0002, R3                      ; 5530   02BB 0002
        MVII    #$0205, R4                      ; 5532   02BC 0205

        JSR     R5,     X_PRINT_R5              ; 5534   0004 0118 007B

        GSWD    R1                              ; 5537   0031
        RSWD    R1                              ; 5538   0039
L_5539:
        RSWD    R0                              ; 5539   0038
        GSWD    R2                              ; 553A   0032
        NEGR    R0                              ; 553B   0020
        SLL     R1,     1                       ; 553C   0049
        SLL     R1,     2                       ; 553D   004D
        SWAP    R1,     1                       ; 553E   0041
        SWAP    R3,     2                       ; 553F   0047
        SLL     R1,     1                       ; 5540   0049
        SWAP    R3,     1                       ; 5541   0043
        DECLE   $0000                           ; 5542   0000

        SDBD                                    ; 5543   0001
        MVII    #$54A0, R0                      ; 5544   02B8 00A0 0054
        MVO     R0,     G_035A                  ; 5547   0240 035A

        JSR     R5,     L_5481                  ; 5549   0004 0154 0081
        JSR     R5,     G_4E0C                  ; 554C   0004 014C 020C
        JSR     R5,     .EXEC.4F1               ; 554F   0004 0114 00F1

        SDBD                                    ; 5552   0001
        MVII    #$5FD6, R0                      ; 5553   02B8 00D6 005F
        MVO     R0,     G_0330                  ; 5556   0240 0330
        MVII    #$0001, R0                      ; 5558   02B8 0001
        MVO     R0,     G_019A                  ; 555A   0240 019A

        JSR     R5,     G_4DE3                  ; 555C   0004 014C 01E3

        PULR    R7                              ; 555F   02B7
        PSHR    R5                              ; 5560   0275
        TSTR    R0                              ; 5561   0080
        BMI     L_55CC                          ; 5562   020B 0068

        PSHR    R0                              ; 5564   0270
        PSHR    R1                              ; 5565   0271
        MVII    #$0200, R4                      ; 5566   02BC 0200
        MVII    #$0014, R0                      ; 5568   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 556A   0004 0114 0338

        MVII    #$0125, R4                      ; 556D   02BC 0125
        MVII    #$0046, R0                      ; 556F   02B8 0046

        JSR     R5,     X_FILL_ZERO             ; 5571   0004 0114 0338

        MVII    #$0169, R4                      ; 5574   02BC 0169
        MVII    #$0087, R0                      ; 5576   02B8 0087

        JSR     R5,     X_FILL_ZERO             ; 5578   0004 0114 0338

        MVII    #$0318, R4                      ; 557B   02BC 0318
        MVII    #$0008, R0                      ; 557D   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 557F   0004 0114 0338

        PULR    R2                              ; 5582   02B2
        PULR    R0                              ; 5583   02B0
        MOVR    R0,     R1                      ; 5584   0081
        SDBD                                    ; 5585   0001
        ADDI    #$4DD7, R1                      ; 5586   02F9 00D7 004D
        MVI@    R1,     R0                      ; 5589   0288
        MVO     R0,     G_0185                  ; 558A   0240 0185
        ANDI    #$0003, R0                      ; 558C   03B8 0003
        CMPI    #$0001, R0                      ; 558E   0378 0001
        BNEQ    L_5599                          ; 5590   020C 0007

        XORI    #$0001, R2                      ; 5592   03FA 0001
        MVO     R2,     G_0184                  ; 5594   0242 0184

        JSR     R5,     L_58B1                  ; 5596   0004 0158 00B1

L_5599:
        SDBD                                    ; 5599   0001
        MVII    #$4E6E, R0                      ; 559A   02B8 006E 004E
        MVO     R0,     G_035D                  ; 559D   0240 035D
        MVII    #$0003, R0                      ; 559F   02B8 0003
        MVO     R0,     G_0181                  ; 55A1   0240 0181
        MVO     R0,     G_0183                  ; 55A3   0240 0183

        JSR     R5,     G_4F00                  ; 55A5   0004 014C 0300
        JSR     R5,     G_4F3A                  ; 55A8   0004 014C 033A

        MVII    #$0001, R0                      ; 55AB   02B8 0001
        MVO     R0,     G_019B                  ; 55AD   0240 019B
        SDBD                                    ; 55AF   0001
        MVII    #$54A0, R0                      ; 55B0   02B8 00A0 0054
        MVO     R0,     G_035A                  ; 55B3   0240 035A

        JSR     R5,     L_5481                  ; 55B5   0004 0154 0081
        JSR     R5,     G_4E0C                  ; 55B8   0004 014C 020C

        MVI     G_0185, R0                      ; 55BB   0280 0185
        ANDI    #$0003, R0                      ; 55BD   03B8 0003
        CMPI    #$0003, R0                      ; 55BF   0378 0003
        BNEQ    L_55C7                          ; 55C1   020C 0004

        MVII    #$0050, R0                      ; 55C3   02B8 0050
        MVO     R0,     G_0167                  ; 55C5   0240 0167

L_55C7:
        JSR     R5,     G_4BA2                  ; 55C7   0004 0148 03A2

        SAR     R3,     2                       ; 55CA   006F
        SLLC    R0,     2                       ; 55CB   005C
L_55CC:
        PULR    R7                              ; 55CC   02B7
        DECLE   $0000,  $0000                   ; 55CD   0000 0000

        SLR     R0,     1                       ; 55CF   0060
        SLL     R1,     2                       ; 55D0   004D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D1   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 55D5   0000 0000

        INCR    R6                              ; 55D7   000E
        DECLE   $0001                           ; 55D8   0001

        EIS                                     ; 55D9   0002
        DIS                                     ; 55DA   0003
        INCR    R1                              ; 55DB   0009
        INCR    R2                              ; 55DC   000A
        INCR    R3                              ; 55DD   000B
        DECLE   $0005                           ; 55DE   0005

        CLRC                                    ; 55DF   0006
        SETC                                    ; 55E0   0007
        INCR    R5                              ; 55E1   000D
        INCR    R7                              ; 55E2   000F
        PSHR    R5                              ; 55E3   0275

        JSR     R5,     G_4EBB                  ; 55E4   0004 014C 02BB

        MVII    #$0088, R0                      ; 55E7   02B8 0088

        JSR     R5,     X_RAND2                 ; 55E9   0004 0114 029E

        ADDI    #$0010, R0                      ; 55EC   02F8 0010
        MOVR    R0,     R2                      ; 55EE   0082
        MVII    #$0048, R3                      ; 55EF   02BB 0048
        MVII    #$0318, R1                      ; 55F1   02B9 0318
        MVI@    R1,     R0                      ; 55F3   0288
        ANDI    #$00FF, R0                      ; 55F4   03B8 00FF
        CMPI    #$00D2, R0                      ; 55F6   0378 00D2
        BLT     L_55FB                          ; 55F8   0205 0001

        CLRR    R0                              ; 55FA   01C0

L_55FB:
        JSR     R5,     X_CLAMP                 ; 55FB   0004 0114 0270

        INCR    R0                              ; 55FE   0008
        MOVR    R3,     R7                      ; 55FF   009F
        SDBD                                    ; 5600   0001
        XORI    #$0B00, R0                      ; 5601   03F8 0000 000B
        MVO@    R0,     R1                      ; 5604   0248
        MOVR    R1,     R4                      ; 5605   008C
        MVII    #$003F, R1                      ; 5606   02B9 003F

        JSR     R5,     G_4C59                  ; 5608   0004 014C 0059

        PULR    R7                              ; 560B   02B7
        PSHR    R5                              ; 560C   0275
        MVII    #$0340, R4                      ; 560D   02BC 0340
        MVII    #$0008, R0                      ; 560F   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5611   0004 0114 0338

        CLRR    R0                              ; 5614   01C0
        MVO     R0,     G_010D                  ; 5615   0240 010D
        MVII    #$00FF, R0                      ; 5617   02B8 00FF
        MVO     R0,     G_0166                  ; 5619   0240 0166

        JSR     R5,     L_505A                  ; 561B   0004 0150 005A

        MVII    #$0001, R0                      ; 561E   02B8 0001
        MVO     R0,     G_0186                  ; 5620   0240 0186
        MVO     R0,     G_01B7                  ; 5622   0240 01B7
        SDBD                                    ; 5624   0001
        MVII    #$5FFC, R0                      ; 5625   02B8 00FC 005F
        MVO     R0,     G_01A2                  ; 5628   0240 01A2
        SWAP    R0,     1                       ; 562A   0040
        MVO     R0,     G_01A3                  ; 562B   0240 01A3
        MVII    #$0187, R4                      ; 562D   02BC 0187
        MVII    #$001F, R0                      ; 562F   02B8 001F
        MVII    #$000F, R1                      ; 5631   02B9 000F
        MVII    #$000A, R2                      ; 5633   02BA 000A
        MVI     G_0185, R3                      ; 5635   0283 0185
        ANDI    #$0008, R3                      ; 5637   03BB 0008
        BEQ     L_5641                          ; 5639   0204 0006

        MVII    #$0028, R0                      ; 563B   02B8 0028
        MVII    #$0018, R1                      ; 563D   02B9 0018
        MVII    #$0004, R2                      ; 563F   02BA 0004
L_5641:
        MVO@    R0,     R4                      ; 5641   0260
        MVO@    R1,     R4                      ; 5642   0261
        MVO@    R2,     R4                      ; 5643   0262
        MVII    #$0002, R0                      ; 5644   02B8 0002
        MVO     R0,     G_01BC                  ; 5646   0240 01BC
        MVII    #$034B, R4                      ; 5648   02BC 034B
        MVII    #$0009, R0                      ; 564A   02B8 0009

        JSR     R5,     X_FILL_ZERO             ; 564C   0004 0114 0338

        MVII    #$0198, R4                      ; 564F   02BC 0198
        SDBD                                    ; 5651   0001
        MVI@    R4,     R7                      ; 5652   02A7
        PSHR    R5                              ; 5653   0275
        MVII    #$0214, R5                      ; 5654   02BD 0214
        SDBD                                    ; 5656   0001
        MVII    #$66E7, R4                      ; 5657   02BC 00E7 0066
        MVII    #$0078, R1                      ; 565A   02B9 0078
        B       L_5667                          ; 565C   0200 0009

        PSHR    R5                              ; 565E   0275
        MVII    #$0250, R5                      ; 565F   02BD 0250
        SDBD                                    ; 5661   0001
        MVII    #$639C, R4                      ; 5662   02BC 009C 0063
        MVII    #$00A0, R1                      ; 5665   02B9 00A0
L_5667:
        SDBD                                    ; 5667   0001
        MVI@    R4,     R0                      ; 5668   02A0
        MVO@    R0,     R5                      ; 5669   0268
        DECR    R1                              ; 566A   0011
        BNEQ    L_5667                          ; 566B   022C 0005

        PULR    R7                              ; 566D   02B7
        SARC    R0,     1                       ; 566E   0078
        SLL     R2,     2                       ; 566F   004E
        MOVR    R3,     R0                      ; 5670   0098
        SLL     R2,     2                       ; 5671   004E
        MOVR    R5,     R7                      ; 5672   00AF
        SLL     R2,     2                       ; 5673   004E
        MOVR    R5,     R7                      ; 5674   00AF
        SLL     R2,     2                       ; 5675   004E
        MOVR    R5,     R7                      ; 5676   00AF
        SLL     R2,     2                       ; 5677   004E
        MVI     G_0184, R3                      ; 5678   0283 0184
        CMPR    R1,     R3                      ; 567A   014B
        BNEQ    L_5694                          ; 567B   020C 0017

        CLRR    R2                              ; 567D   01D2
        TSTR    R0                              ; 567E   0080
        BMI     L_568D                          ; 567F   020B 000C

        MVII    #$003F, R2                      ; 5681   02BA 003F
        CMPI    #$0004, R0                      ; 5683   0378 0004
        BLT     L_568D                          ; 5685   0205 0006

        CMPI    #$000C, R0                      ; 5687   0378 000C
        BGE     L_568D                          ; 5689   020D 0002

        MVII    #$00C1, R2                      ; 568B   02BA 00C1
L_568D:
        MVI     G_019C, R0                      ; 568D   0280 019C
        TSTR    R0                              ; 568F   0080
        BNEQ    L_5695                          ; 5690   020C 0003

        MVO     R2,     G_0126                  ; 5692   0242 0126
L_5694:
        MOVR    R5,     R7                      ; 5694   00AF
L_5695:
        MVO     R2,     G_01B8                  ; 5695   0242 01B8
        MOVR    R5,     R7                      ; 5697   00AF
        CMP     G_0184, R1                      ; 5698   0341 0184
        BNEQ    L_56A4                          ; 569A   020C 0008

        MVII    #$0001, R0                      ; 569C   02B8 0001
        MVO     R0,     G_0178                  ; 569E   0240 0178
        MVII    #$0003, R0                      ; 56A0   02B8 0003
        MVO     R0,     G_0168                  ; 56A2   0240 0168
L_56A4:
        MOVR    R5,     R7                      ; 56A4   00AF
        PSHR    R5                              ; 56A5   0275
        MVI     G_0178, R0                      ; 56A6   0280 0178
        TSTR    R0                              ; 56A8   0080
        BNEQ    L_56BC                          ; 56A9   020C 0011

        COMR    R0                              ; 56AB   0018
        MVO     R0,     G_0168                  ; 56AC   0240 0168
        PULR    R7                              ; 56AE   02B7
        MVI     G_0184, R2                      ; 56AF   0282 0184
        CMPR    R1,     R2                      ; 56B1   014A
        BNEQ    L_56BA                          ; 56B2   020C 0006

        CLRR    R1                              ; 56B4   01C9
        MVO     R1,     G_0178                  ; 56B5   0241 0178
        TSTR    R0                              ; 56B7   0080
        BPL     L_56BB                          ; 56B8   0203 0001

L_56BA:
        MOVR    R5,     R7                      ; 56BA   00AF
L_56BB:
        PSHR    R5                              ; 56BB   0275
L_56BC:
        CLRR    R0                              ; 56BC   01C0
        CMP     G_019C, R0                      ; 56BD   0340 019C
        BNEQ    L_56FF                          ; 56BF   020C 003E

        CMP     G_0186, R0                      ; 56C1   0340 0186
        BEQ     L_56FF                          ; 56C3   0204 003A

        MVI     G_0318, R1                      ; 56C5   0281 0318
        ANDI    #$00FF, R1                      ; 56C7   03B9 00FF
        CMPI    #$0008, R1                      ; 56C9   0379 0008
        BLT     L_56FF                          ; 56CB   0205 0032

        CMPI    #$009F, R1                      ; 56CD   0379 009F
        BGT     L_56FF                          ; 56CF   020E 002E

        CLRR    R0                              ; 56D1   01C0
        MVO     R0,     G_0186                  ; 56D2   0240 0186
        MVI     G_019A, R0                      ; 56D4   0280 019A
        TSTR    R0                              ; 56D6   0080
        BNEQ    L_56DE                          ; 56D7   020C 0005

        JSR     R5,     G_4B9A                  ; 56D9   0004 0148 039A

        ADDR    R3,     R1                      ; 56DC   00D9
        SLLC    R3,     1                       ; 56DD   005B
L_56DE:
        MVII    #$0318, R2                      ; 56DE   02BA 0318
        MVII    #$0319, R3                      ; 56E0   02BB 0319
        SDBD                                    ; 56E2   0001
        MVII    #$5EB0, R4                      ; 56E3   02BC 00B0 005E

        JSR     R5,     L_5160                  ; 56E6   0004 0150 0160

        MVI     G_0185, R0                      ; 56E9   0280 0185
        ANDI    #$0004, R0                      ; 56EB   03B8 0004
        BEQ     L_56F9                          ; 56ED   0204 000A

        SDBD                                    ; 56EF   0001
        MVII    #$4000, R0                      ; 56F0   02B8 0000 0040
        DIS                                     ; 56F3   0003
        XOR     G_0319, R0                      ; 56F4   03C0 0319
        MVO     R0,     G_0319                  ; 56F6   0240 0319
        EIS                                     ; 56F8   0002
L_56F9:
        MVII    #$01A2, R4                      ; 56F9   02BC 01A2
        SDBD                                    ; 56FB   0001
        MVI@    R4,     R0                      ; 56FC   02A0
        MVO     R0,     G_0331                  ; 56FD   0240 0331
L_56FF:
        PULR    R7                              ; 56FF   02B7
        PSHR    R5                              ; 5700   0275
        MVI     G_0177, R0                      ; 5701   0280 0177
        PSHR    R0                              ; 5703   0270
        TSTR    R0                              ; 5704   0080
        BEQ     L_5717                          ; 5705   0204 0010

        MVII    #$0006, R3                      ; 5707   02BB 0006
        MVI     G_0184, R1                      ; 5709   0281 0184
        TSTR    R1                              ; 570B   0089
        BEQ     L_5710                          ; 570C   0204 0002

        MVII    #$0002, R3                      ; 570E   02BB 0002
L_5710:
        MVII    #$0202, R4                      ; 5710   02BC 0202
        MVII    #$0002, R1                      ; 5712   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5714   0004 0118 00C5

L_5717:
        MVII    #$0204, R4                      ; 5717   02BC 0204
        MVI     G_0176, R0                      ; 5719   0280 0176
        MVII    #$0064, R1                      ; 571B   02B9 0064

        JSR     R5,     X_MPY                   ; 571D   0004 011C 01DC

        MOVR    R2,     R0                      ; 5720   0090
        ADD     G_0175, R0                      ; 5721   02C0 0175
        MVII    #$0006, R3                      ; 5723   02BB 0006
        MVI     G_0184, R1                      ; 5725   0281 0184
        TSTR    R1                              ; 5727   0089
        BEQ     L_572C                          ; 5728   0204 0002

        MVII    #$0002, R3                      ; 572A   02BB 0002
L_572C:
        MVII    #$0004, R1                      ; 572C   02B9 0004
        PULR    R2                              ; 572E   02B2
        TSTR    R2                              ; 572F   0092
        BEQ     L_5736                          ; 5730   0204 0004

        JSR     R5,     X_PRNUM_ZRO             ; 5732   0004 0118 00AD

        PULR    R7                              ; 5735   02B7

L_5736:
        JSR     R5,     X_PRNUM_RGT             ; 5736   0004 0118 00C5

        PULR    R7                              ; 5739   02B7
        PSHR    R5                              ; 573A   0275
        MVII    #$0006, R3                      ; 573B   02BB 0006
        MVI     G_0184, R1                      ; 573D   0281 0184
        TSTR    R1                              ; 573F   0089
        BEQ     L_5744                          ; 5740   0204 0002

        MVII    #$0002, R3                      ; 5742   02BB 0002
L_5744:
        MVII    #$020F, R4                      ; 5744   02BC 020F
        MVI     G_0181, R0                      ; 5746   0280 0181
        MVII    #$0001, R1                      ; 5748   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 574A   0004 0118 00C5

        PULR    R7                              ; 574D   02B7
        MVII    #$00FF, R0                      ; 574E   02B8 00FF
        B       L_5754                          ; 5750   0200 0002

        MVII    #$0001, R0                      ; 5752   02B8 0001
L_5754:
        PSHR    R5                              ; 5754   0275
        PSHR    R3                              ; 5755   0273
        ADDI    #$018C, R3                      ; 5756   02FB 018C
        MVO@    R0,     R3                      ; 5758   0258
        PULR    R3                              ; 5759   02B3

        JSR     R5,     G_4CB6                  ; 575A   0004 014C 00B6

        PULR    R7                              ; 575D   02B7
        PSHR    R5                              ; 575E   0275
        MVII    #$00FF, R0                      ; 575F   02B8 00FF
        MVO     R0,     G_0163                  ; 5761   0240 0163
        MVII    #$0002, R2                      ; 5763   02BA 0002
        MVII    #$0006, R1                      ; 5765   02B9 0006
        MVII    #$018E, R4                      ; 5767   02BC 018E
L_5769:
        MVI@    R4,     R0                      ; 5769   02A0
        CMPI    #$00FD, R0                      ; 576A   0378 00FD
        BNEQ    L_5772                          ; 576C   020C 0004

        MOVR    R2,     R3                      ; 576E   0093

        JSR     R5,     G_4F4E                  ; 576F   0004 014C 034E

L_5772:
        INCR    R2                              ; 5772   000A
        DECR    R1                              ; 5773   0011
        BNEQ    L_5769                          ; 5774   022C 000C

        MVII    #$0318, R3                      ; 5776   02BB 0318
        SDBD                                    ; 5778   0001
        MVII    #$5EBE, R4                      ; 5779   02BC 00BE 005E

        JSR     R5,     L_516D                  ; 577C   0004 0150 016D

        MVII    #$0001, R0                      ; 577F   02B8 0001
        MVO     R0,     G_019C                  ; 5781   0240 019C
        MVI     G_018C, R0                      ; 5783   0280 018C
        MVO     R0,     G_0163                  ; 5785   0240 0163
        MVO     R0,     G_01A0                  ; 5787   0240 01A0
        MVI     G_019A, R0                      ; 5789   0280 019A
        TSTR    R0                              ; 578B   0080
        BNEQ    L_5798                          ; 578C   020C 000A

        INCR    R0                              ; 578E   0008
        ADD     G_01BB, R0                      ; 578F   02C0 01BB
        MVO     R0,     G_01BB                  ; 5791   0240 01BB

        JSR     R5,     G_4B9A                  ; 5793   0004 0148 039A

        RLC     R2,     1                       ; 5796   0052
        SLLC    R0,     2                       ; 5797   005C
L_5798:
        PULR    R7                              ; 5798   02B7
        PSHR    R5                              ; 5799   0275
        MVI     G_019A, R0                      ; 579A   0280 019A
        TSTR    R0                              ; 579C   0080
L_579D:
        BNEQ    L_57A9                          ; 579D   020C 000A

        MVI     G_0181, R0                      ; 579F   0280 0181
        DECR    R0                              ; 57A1   0010
        BMI     L_57C0                          ; 57A2   020B 001C

        MVO     R0,     G_0181                  ; 57A4   0240 0181

        JSR     R5,     G_4F3A                  ; 57A6   0004 014C 033A
L_57A9:
        JSR     R5,     L_505A                  ; 57A9   0004 0150 005A

        CLRR    R0                              ; 57AC   01C0
        MVO     R0,     G_01B8                  ; 57AD   0240 01B8
        MVO     R0,     G_019C                  ; 57AF   0240 019C
        MVI     G_019A, R0                      ; 57B1   0280 019A
        TSTR    R0                              ; 57B3   0080
        BEQ     L_57BF                          ; 57B4   0204 0009

        SDBD                                    ; 57B6   0001
        MVII    #$5FD6, R0                      ; 57B7   02B8 00D6 005F
        MVO     R0,     G_0330                  ; 57BA   0240 0330

        JSR     R5,     G_4DE3                  ; 57BC   0004 014C 01E3

L_57BF:
        PULR    R7                              ; 57BF   02B7
L_57C0:
        MVII    #$0318, R4                      ; 57C0   02BC 0318
        MVII    #$0008, R0                      ; 57C2   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 57C4   0004 0114 0338

        MVII    #$0330, R4                      ; 57C7   02BC 0330
        MVII    #$0008, R0                      ; 57C9   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 57CB   0004 0114 0338

        MVII    #$018E, R4                      ; 57CE   02BC 018E
        MVII    #$0006, R1                      ; 57D0   02B9 0006
        MVII    #$0002, R0                      ; 57D2   02B8 0002
L_57D4:
        MVO@    R0,     R4                      ; 57D4   0260
        DECR    R1                              ; 57D5   0011
        BNEQ    L_57D4                          ; 57D6   022C 0003

        CLRR    R0                              ; 57D8   01C0
        MVO     R0,     G_019C                  ; 57D9   0240 019C
        MVI     G_0185, R0                      ; 57DB   0280 0185
        CMPI    #$0002, R0                      ; 57DD   0378 0002
        BNEQ    L_57EF                          ; 57DF   020C 000E

        MVI     G_01BC, R0                      ; 57E1   0280 01BC
        DECR    R0                              ; 57E3   0010
L_57E4:
        MVO     R0,     G_01BC                  ; 57E4   0240 01BC
        CMPI    #$0001, R0                      ; 57E6   0378 0001
        BNEQ    L_57EF                          ; 57E8   020C 0005

        JSR     R5,     L_505A                  ; 57EA   0004 0150 005A

        B       L_5ADE                          ; 57ED   0200 02EF

L_57EF:
        JSR     R5,     L_5E69                  ; 57EF   0004 015C 0269

        MVI     G_019B, R0                      ; 57F2   0280 019B
        CMPI    #$0004, R0                      ; 57F4   0378 0004
        BNEQ    L_5841                          ; 57F6   020C 0049

        CLRR    R0                              ; 57F8   01C0
        MVO     R0,     G_019B                  ; 57F9   0240 019B
        DECR    R0                              ; 57FB   0010
        MVO     R0,     G_0166                  ; 57FC   0240 0166
        MVII    #$0200, R4                      ; 57FE   02BC 0200
        MVII    #$00F0, R0                      ; 5800   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5802   0004 0114 0338

        SDBD                                    ; 5805   0001
        MVII    #$622A, R4                      ; 5806   02BC 002A 0062
        MVI@    R4,     R0                      ; 5809   02A0
        SDBD                                    ; 580A   0001
        ADDI    #$3800, R0                      ; 580B   02F8 0000 0038
        MVO     R0,     G_0356                  ; 580E   0240 0356
        MVI@    R4,     R0                      ; 5810   02A0
        SLR     R0,     2                       ; 5811   0064
        SLR     R0,     1                       ; 5812   0060
        MVO     R0,     G_0357                  ; 5813   0240 0357
        MVO     R4,     G_0355                  ; 5815   0244 0355
        CLRR    R0                              ; 5817   01C0
        MVO     R0,     G_01A5                  ; 5818   0240 01A5
        MVO     R0,     G_01A7                  ; 581A   0240 01A7
        MVO     R0,     G_01AA                  ; 581C   0240 01AA
        INCR    R0                              ; 581E   0008
        MVO     R0,     G_018A                  ; 581F   0240 018A
L_5821:
        SDBD                                    ; 5821   0001
        MVII    #$6209, R0                      ; 5822   02B8 0009 0062
        MVO     R0,     G_0359                  ; 5825   0240 0359
        SDBD                                    ; 5827   0001
        MVII    #$5AEA, R0                      ; 5828   02B8 00EA 005A
        DIS                                     ; 582B   0003
        MVO     R0,     .ISRVEC.0               ; 582C   0240 0100
        SWAP    R0,     1                       ; 582E   0040
        MVO     R0,     .ISRVEC.1               ; 582F   0240 0101
        EIS                                     ; 5831   0002
        MVII    #$0001, R0                      ; 5832   02B8 0001
        MVO     R0,     G_01A8                  ; 5834   0240 01A8
L_5836:
        MVI     G_01A8, R0                      ; 5836   0280 01A8
        TSTR    R0                              ; 5838   0080
        BNEQ    L_5836                          ; 5839   022C 0004

        JSR     R5,     G_4E5E                  ; 583B   0004 014C 025E
        JSR     R5,     G_4F00                  ; 583E   0004 014C 0300

L_5841:
        MVI     G_0185, R0                      ; 5841   0280 0185
        ANDI    #$0003, R0                      ; 5843   03B8 0003
        CMPI    #$0002, R0                      ; 5845   0378 0002
        BNEQ    L_5853                          ; 5847   020C 000A

        INCR    R0                              ; 5849   0008
        MVO     R0,     G_0185                  ; 584A   0240 0185
        CLRR    R0                              ; 584C   01C0
        MVO     R0,     G_01BB                  ; 584D   0240 01BB
        MVII    #$0050, R0                      ; 584F   02B8 0050
        MVO     R0,     G_0167                  ; 5851   0240 0167
L_5853:
        SDBD                                    ; 5853   0001
        MVII    #$4DCD, R0                      ; 5854   02B8 00CD 004D
        MVO     R0,     G_035D                  ; 5857   0240 035D
        PULR    R7                              ; 5859   02B7
        PSHR    R5                              ; 585A   0275
        SDBD                                    ; 585B   0001
        MVII    #$5EA2, R4                      ; 585C   02BC 00A2 005E
        MVII    #$0318, R3                      ; 585F   02BB 0318

        JSR     R5,     G_4BC3                  ; 5861   0004 0148 03C3

        MVI     G_0184, R0                      ; 5864   0280 0184
        TSTR    R0                              ; 5866   0080
        BEQ     L_5873                          ; 5867   0204 000A

        MVI     G_0328, R0                      ; 5869   0280 0328
        SDBD                                    ; 586B   0001
        ANDI    #$EFF8, R0                      ; 586C   03B8 00F8 00EF
        XORI    #$0002, R0                      ; 586F   03F8 0002
        MVO     R0,     G_0328                  ; 5871   0240 0328
L_5873:
        MVII    #$0048, R0                      ; 5873   02B8 0048
        MVI     G_019B, R1                      ; 5875   0281 019B
        CMPI    #$0004, R1                      ; 5877   0379 0004
        BNEQ    L_587D                          ; 5879   020C 0002

        MVII    #$0060, R0                      ; 587B   02B8 0060
L_587D:
        XOR     G_0320, R0                      ; 587D   03C0 0320
        MVO     R0,     G_0320                  ; 587F   0240 0320
        MVII    #$0050, R1                      ; 5881   02B9 0050
        MVI     G_01B8, R0                      ; 5883   0280 01B8
        TSTR    R0                              ; 5885   0080
        BEQ     L_5890                          ; 5886   0204 0008

        MVII    #$009E, R1                      ; 5888   02B9 009E
        CMPI    #$003F, R0                      ; 588A   0378 003F
        BEQ     L_5890                          ; 588C   0204 0002

        MVII    #$0010, R1                      ; 588E   02B9 0010
L_5890:
        DIS                                     ; 5890   0003
        XOR     G_0318, R1                      ; 5891   03C1 0318
        MVO     R1,     G_0318                  ; 5893   0241 0318
        EIS                                     ; 5895   0002
        MVII    #$0200, R0                      ; 5896   02B8 0200
L_5898:
        MVI     G_0318, R1                      ; 5898   0281 0318
        ANDR    R0,     R1                      ; 589A   0181
        BEQ     L_5898                          ; 589B   0224 0004

        PULR    R7                              ; 589D   02B7
        CLRR    R0                              ; 589E   01C0
        MVO     R0,     G_0319                  ; 589F   0240 0319
        MVO     R0,     G_0138                  ; 58A1   0240 0138
        NOP                                     ; 58A3   0034
        MVO     R0,     G_0321                  ; 58A4   0240 0321
        NOP                                     ; 58A6   0034
        MVO     R2,     G_0341                  ; 58A7   0242 0341
        MOVR    R5,     R7                      ; 58A9   00AF
        PSHR    R5                              ; 58AA   0275
        ADDI    #$0320, R2                      ; 58AB   02FA 0320
        MVI@    R2,     R0                      ; 58AD   0290
        ANDI    #$007F, R0                      ; 58AE   03B8 007F
        CMPI    #$0048, R0                      ; 58B0   0378 0048
        BLT     L_58BA                          ; 58B2   0205 0006

        SUBI    #$0320, R2                      ; 58B4   033A 0320
        MOVR    R2,     R3                      ; 58B6   0093

        JSR     R5,     G_4F4E                  ; 58B7   0004 014C 034E

L_58BA:
        PULR    R7                              ; 58BA   02B7
        PSHR    R5                              ; 58BB   0275
        CLRR    R0                              ; 58BC   01C0
        MVO     R0,     G_0126                  ; 58BD   0240 0126
        MVI     G_0318, R0                      ; 58BF   0280 0318
        MOVR    R0,     R1                      ; 58C1   0081
        SDBD                                    ; 58C2   0001
L_58C3:
        ANDI    #$FF00, R1                      ; 58C3   03B9 0000 00FF
        ANDI    #$00FF, R0                      ; 58C6   03B8 00FF
        CMPI    #$00D2, R0                      ; 58C8   0378 00D2
        BLT     L_58CD                          ; 58CA   0205 0001

        CLRR    R0                              ; 58CC   01C0

L_58CD:
        JSR     R5,     X_CLAMP                 ; 58CD   0004 0114 0270

        INCR    R0                              ; 58D0   0008
        MOVR    R3,     R7                      ; 58D1   009F
        XORR    R1,     R0                      ; 58D2   01C8
        MVO     R0,     G_0318                  ; 58D3   0240 0318
        PULR    R7                              ; 58D5   02B7
        PSHR    R5                              ; 58D6   0275
        MOVR    R1,     R3                      ; 58D7   008B
        ADDI    #$018C, R1                      ; 58D8   02F9 018C
        MVI@    R1,     R0                      ; 58DA   0288
        ANDI    #$0080, R0                      ; 58DB   03B8 0080
        BEQ     L_58E0                          ; 58DD   0204 0001

        PULR    R7                              ; 58DF   02B7

L_58E0:
        JSR     R5,     L_509E                  ; 58E0   0004 0150 009E
        JSR     R5,     L_5CED                  ; 58E3   0004 015C 00ED

        MOVR    R3,     R1                      ; 58E6   0099
        MVII    #$0194, R5                      ; 58E7   02BD 0194
        SDBD                                    ; 58E9   0001
        MVI@    R5,     R7                      ; 58EA   02AF
        PSHR    R5                              ; 58EB   0275
        MVI     G_0319, R1                      ; 58EC   0281 0319

        JSR     R5,     L_509E                  ; 58EE   0004 0150 009E

        ANDI    #$00FF, R1                      ; 58F1   03B9 00FF
        SUBI    #$0005, R1                      ; 58F3   0339 0005
        SLR     R1,     2                       ; 58F5   0065
        SLR     R1,     1                       ; 58F6   0061
        CMPI    #$0009, R1                      ; 58F7   0379 0009
        BEQ     L_5900                          ; 58F9   0204 0005

        CMPI    #$000A, R1                      ; 58FB   0379 000A
        BEQ     L_5900                          ; 58FD   0204 0001

        PULR    R7                              ; 58FF   02B7
L_5900:
        CLRR    R0                              ; 5900   01C0
        MVO     R0,     G_0186                  ; 5901   0240 0186
        ADDI    #$0278, R1                      ; 5903   02F9 0278
        MVI@    R1,     R0                      ; 5905   0288
        TSTR    R0                              ; 5906   0080
        BNEQ    L_595F                          ; 5907   020C 0056

        MOVR    R6,     R1                      ; 5909   00B1
L_590A:
        SUBI    #$0003, R1                      ; 590A   0339 0003
        CLRR    R0                              ; 590C   01C0
        MVO@    R0,     R1                      ; 590D   0248
        MVII    #$0001, R0                      ; 590E   02B8 0001
        MVO     R0,     G_0166                  ; 5910   0240 0166
        CLRR    R0                              ; 5912   01C0
        COMR    R0                              ; 5913   0018
        MVO     R0,     G_0165                  ; 5914   0240 0165
        MVO     R0,     G_0164                  ; 5916   0240 0164
        MVII    #$0200, R4                      ; 5918   02BC 0200
        MVII    #$0014, R0                      ; 591A   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 591C   0004 0114 0338
        JSR     R5,     L_532E                  ; 591F   0004 0150 032E

L_5922:
        MVII    #$018E, R4                      ; 5922   02BC 018E
        MVII    #$0006, R1                      ; 5924   02B9 0006
        MVII    #$0003, R0                      ; 5926   02B8 0003
L_5928:
        MVO@    R0,     R4                      ; 5928   0260
        DECR    R1                              ; 5929   0011
        BNEQ    L_5928                          ; 592A   022C 0003

        JSR     R5,     L_5E69                  ; 592C   0004 015C 0269

        CLRR    R0                              ; 592F   01C0
        MVO     R0,     G_0342                  ; 5930   0240 0342
        MVO     R0,     G_010D                  ; 5932   0240 010D
        MVII    #$031A, R3                      ; 5934   02BB 031A
        SDBD                                    ; 5936   0001
        MVII    #$5EF6, R4                      ; 5937   02BC 00F6 005E
        MVII    #$0006, R2                      ; 593A   02BA 0006
L_593C:
        PSHR    R3                              ; 593C   0273
        PSHR    R4                              ; 593D   0274
        PSHR    R2                              ; 593E   0272

        JSR     R5,     G_4BC3                  ; 593F   0004 0148 03C3

        PULR    R2                              ; 5942   02B2
        PULR    R4                              ; 5943   02B4
        PULR    R3                              ; 5944   02B3
        INCR    R3                              ; 5945   000B
        DECR    R2                              ; 5946   0012
        BNEQ    L_593C                          ; 5947   022C 000C

        SDBD                                    ; 5949   0001
        MVII    #$524B, R0                      ; 594A   02B8 004B 0052
        MVO     R0,     G_0355                  ; 594D   0240 0355
        MVII    #$0016, R0                      ; 594F   02B8 0016
        MVO     R0,     G_0357                  ; 5951   0240 0357
        MVII    #$0002, R2                      ; 5953   02BA 0002
L_5955:
        PSHR    R2                              ; 5955   0272

        JSR     R5,     L_51A8                  ; 5956   0004 0150 01A8

        PULR    R2                              ; 5959   02B2
        INCR    R2                              ; 595A   000A
        CMPI    #$0008, R2                      ; 595B   037A 0008
        BNEQ    L_5955                          ; 595D   022C 0009

L_595F:
        PULR    R7                              ; 595F   02B7
        PSHR    R5                              ; 5960   0275
        MVI@    R2,     R0                      ; 5961   0290
        ANDI    #$00FF, R0                      ; 5962   03B8 00FF
        PSHR    R0                              ; 5964   0270
        ADDI    #$0008, R2                      ; 5965   02FA 0008
        MVI@    R2,     R0                      ; 5967   0290
        ANDI    #$007F, R0                      ; 5968   03B8 007F
        PSHR    R0                              ; 596A   0270
        B       L_597A                          ; 596B   0200 000D

        PSHR    R5                              ; 596D   0275
        MVI@    R3,     R0                      ; 596E   0298
        ANDI    #$00FF, R0                      ; 596F   03B8 00FF
        PSHR    R0                              ; 5971   0270
        ADDI    #$0008, R3                      ; 5972   02FB 0008
        MVI@    R3,     R0                      ; 5974   0298
        ANDI    #$007F, R0                      ; 5975   03B8 007F
        PSHR    R0                              ; 5977   0270
        SUBI    #$0008, R3                      ; 5978   033B 0008
L_597A:
        PSHR    R3                              ; 597A   0273

        JSR     R5,     G_4BC3                  ; 597B   0004 0148 03C3

        PULR    R3                              ; 597E   02B3
        SUBI    #$0318, R3                      ; 597F   033B 0318

        JSR     R5,     L_5199                  ; 5981   0004 0150 0199

        ADDI    #$0318, R3                      ; 5984   02FB 0318
        PULR    R2                              ; 5986   02B2
        PULR    R1                              ; 5987   02B1
        MVI@    R3,     R0                      ; 5988   0298
        SDBD                                    ; 5989   0001
        ANDI    #$FF00, R0                      ; 598A   03B8 0000 00FF
        XORR    R0,     R1                      ; 598D   01C1
        MVO@    R1,     R3                      ; 598E   0259
        ADDI    #$0008, R3                      ; 598F   02FB 0008
        MVI@    R3,     R0                      ; 5991   0298
        SDBD                                    ; 5992   0001
        ANDI    #$FF80, R0                      ; 5993   03B8 0080 00FF
        XORR    R2,     R0                      ; 5996   01D0
        MVO@    R0,     R3                      ; 5997   0258
        PULR    R7                              ; 5998   02B7
        PSHR    R5                              ; 5999   0275
L_599A:
        PSHR    R0                              ; 599A   0270
        MOVR    R3,     R0                      ; 599B   0098

        JSR     R5,     X_POW2                  ; 599C   0004 0114 0345

        COMR    R0                              ; 599F   0018
        DIS                                     ; 59A0   0003
        AND     G_010D, R0                      ; 59A1   0380 010D
        MVO     R0,     G_010D                  ; 59A3   0240 010D
        EIS                                     ; 59A5   0002
        PULR    R0                              ; 59A6   02B0
        PULR    R7                              ; 59A7   02B7
        PSHR    R5                              ; 59A8   0275
        MVI     G_0357, R0                      ; 59A9   0280 0357
        DECR    R0                              ; 59AB   0010
        BMI     L_59EE                          ; 59AC   020B 0040

        MVO     R0,     G_0357                  ; 59AE   0240 0357
        MVI     G_0355, R4                      ; 59B0   0284 0355
        MVI@    R4,     R1                      ; 59B2   02A1
        MOVR    R1,     R3                      ; 59B3   008B
        CLRR    R0                              ; 59B4   01C0
        MVO@    R0,     R3                      ; 59B5   0258
        INCR    R3                              ; 59B6   000B
        MVO@    R0,     R3                      ; 59B7   0258
        ADDI    #$0014, R3                      ; 59B8   02FB 0014
        MVO@    R0,     R3                      ; 59BA   0258
        DECR    R3                              ; 59BB   0013
        MVO@    R0,     R3                      ; 59BC   0258
        PSHR    R2                              ; 59BD   0272

        JSR     R5,     L_5217                  ; 59BE   0004 0150 0217

        PULR    R3                              ; 59C1   02B3
        PSHR    R4                              ; 59C2   0274
        ADDI    #$0318, R3                      ; 59C3   02FB 0318
        PSHR    R3                              ; 59C5   0273
        MVO@    R0,     R3                      ; 59C6   0258
L_59C7:
        ADDI    #$0008, R3                      ; 59C7   02FB 0008
        MVO@    R1,     R3                      ; 59C9   0259
        SUBI    #$0008, R3                      ; 59CA   033B 0008
L_59CC:
        SDBD                                    ; 59CC   0001
        MVII    #$5EF6, R4                      ; 59CD   02BC 00F6 005E

        JSR     R5,     L_516D                  ; 59D0   0004 0150 016D

        PULR    R3                              ; 59D3   02B3
        PULR    R4                              ; 59D4   02B4
        MVI@    R4,     R1                      ; 59D5   02A1
        MVO     R4,     G_0355                  ; 59D6   0244 0355
        MOVR    R3,     R4                      ; 59D8   009C
        SDBD                                    ; 59D9   0001
        ADDI    #$523F, R1                      ; 59DA   02F9 003F 0052
        MVI@    R1,     R2                      ; 59DD   028A
        SDBD                                    ; 59DE   0001
        ADDI    #$0006, R1                      ; 59DF   02F9 0006 0000
        MVI@    R1,     R3                      ; 59E2   028B
        MVII    #$001F, R1                      ; 59E3   02B9 001F

        JSR     R5,     G_4C5C                  ; 59E5   0004 014C 005C
        JSR     R5,     G_4B9A                  ; 59E8   0004 0148 039A

        RLC     R2,     1                       ; 59EB   0052
        SLLC    R0,     2                       ; 59EC   005C
L_59ED:
        PULR    R7                              ; 59ED   02B7
L_59EE:
        MOVR    R2,     R3                      ; 59EE   0093
        MVII    #$0002, R0                      ; 59EF   02B8 0002

        JSR     R5,     G_4F54                  ; 59F1   0004 014C 0354

        MVII    #$0006, R1                      ; 59F4   02B9 0006
        MVII    #$018E, R4                      ; 59F6   02BC 018E
        MVII    #$0002, R0                      ; 59F8   02B8 0002
L_59FA:
        CMP@    R4,     R0                      ; 59FA   0360
        BNEQ    L_59ED                          ; 59FB   022C 000F

        DECR    R1                              ; 59FD   0011
        BNEQ    L_59FA                          ; 59FE   022C 0005

        CLRR    R0                              ; 5A00   01C0
        COMR    R0                              ; 5A01   0018
        MVO     R0,     G_0166                  ; 5A02   0240 0166
        CLRR    R0                              ; 5A04   01C0
        MVO     R0,     G_01B9                  ; 5A05   0240 01B9
        MVO     R0,     G_01BA                  ; 5A07   0240 01BA

        JSR     R5,     L_532E                  ; 5A09   0004 0150 032E

        SDBD                                    ; 5A0C   0001
        MVII    #$602C, R0                      ; 5A0D   02B8 002C 0060
        MVO     R0,     G_0337                  ; 5A10   0240 0337
        MVII    #$0040, R0                      ; 5A12   02B8 0040
        MVO     R0,     G_0347                  ; 5A14   0240 0347
        PULR    R7                              ; 5A16   02B7
        PSHR    R5                              ; 5A17   0275
        PSHR    R4                              ; 5A18   0274
        SUBI    #$0200, R1                      ; 5A19   0339 0200
        MVII    #$0014, R2                      ; 5A1B   02BA 0014

        JSR     R5,     X_DIV                   ; 5A1D   0004 011C 01FB

        MOVR    R1,     R4                      ; 5A20   008C
        INCR    R0                              ; 5A21   0008
        MVII    #$0008, R1                      ; 5A22   02B9 0008

        JSR     R5,     X_MPY                   ; 5A24   0004 011C 01DC

        PSHR    R2                              ; 5A27   0272
        MOVR    R4,     R1                      ; 5A28   00A1
        INCR    R1                              ; 5A29   0009
        MVII    #$0008, R0                      ; 5A2A   02B8 0008

        JSR     R5,     X_MPY                   ; 5A2C   0004 011C 01DC

        MOVR    R2,     R0                      ; 5A2F   0090
        PULR    R1                              ; 5A30   02B1
        PULR    R4                              ; 5A31   02B4
        PULR    R7                              ; 5A32   02B7
        ADDI    #$0328, R3                      ; 5A33   02FB 0328
        MVII    #$0005, R0                      ; 5A35   02B8 0005
        XOR@    R3,     R0                      ; 5A37   03D8
        MVO@    R0,     R3                      ; 5A38   0258
        ADDI    #$0018, R3                      ; 5A39   02FB 0018
        MVII    #$0001, R0                      ; 5A3B   02B8 0001
        MVO@    R0,     R3                      ; 5A3D   0258
        MOVR    R5,     R7                      ; 5A3E   00AF
        DECLE   $0000,  $0000,  $0000           ; 5A3F   0000 0000 0000

        MOVR    R4,     R0                      ; 5A42   00A0
        MOVR    R4,     R0                      ; 5A43   00A0
        MOVR    R4,     R0                      ; 5A44   00A0
        DECLE   $0000                           ; 5A45   0000

        ADCR    R5                              ; 5A46   002D
        SWAP    R0,     1                       ; 5A47   0040
        DECLE   $0000                           ; 5A48   0000

        ADCR    R5                              ; 5A49   002D
        SWAP    R0,     1                       ; 5A4A   0040
        DECLE   $021C                           ; 5A4B   021C
L_5A4C:
        DECLE   $0000,  $021E                   ; 5A4C   0000 021E

        DIS                                     ; 5A4E   0003
        MVO     R4,     .STIC.X.1               ; 5A4F   0244 0001
        MVO     R6,     .STIC.X.4               ; 5A51   0246 0004
        MVO@    R4,     R5                      ; 5A53   026C
        EIS                                     ; 5A54   0002
        MVO@    R6,     R5                      ; 5A55   026E
        DECLE   $0005                           ; 5A56   0005
L_5A57:
        DECLE   $021A,  $0000                   ; 5A57   021A 0000

        B       L_5A57                          ; 5A59   0220 0003

        MVO     R2,     .STIC.X.1               ; 5A5B   0242 0001
        MVO@    R0,     R1                      ; 5A5D   0248

        JSRD    R6,     L_6802                  ; 5A5E   0004 026A 0002

        PSHR    R0                              ; 5A61   0270
        DECLE   $0005                           ; 5A62   0005

        MVO     R0,     .STIC.X.0               ; 5A63   0240 0000
        MVO@    R2,     R1                      ; 5A65   024A
        DIS                                     ; 5A66   0003
        MVO@    R0,     R5                      ; 5A67   0268
        EIS                                     ; 5A68   0002
        PSHR    R2                              ; 5A69   0272
        DECLE   $0005,  $023E,  $0001           ; 5A6A   0005 023E 0001

        MVO@    R4,     R1                      ; 5A6D   024C

        JSRD    R6,     L_6402                  ; 5A6E   0004 0266 0002

        PSHR    R4                              ; 5A71   0274
        DECLE   $0005,  $023C,  $0001           ; 5A72   0005 023C 0001

        MVO@    R6,     R1                      ; 5A75   024E

        JSRE    R6,     G_7680                  ; 5A76   0004 0275 0280

        ANDR    R7,     R1                      ; 5A79   01B9
        MVO     R0,     .STIC.HDLY              ; 5A7A   0240 0030
        MVI     G_01BA, R0                      ; 5A7C   0280 01BA
        MVO     R0,     .STIC.VDLY              ; 5A7E   0240 0031

        JSR     R5,     G_4997                  ; 5A80   0004 0148 0197

        CLRR    R0                              ; 5A83   01C0
        MVO     R0,     G_010F                  ; 5A84   0240 010F
        PULR    R7                              ; 5A86   02B7
        PSHR    R5                              ; 5A87   0275
        MVII    #$0002, R0                      ; 5A88   02B8 0002
        XOR     G_01B9, R0                      ; 5A8A   03C0 01B9
        MVO     R0,     G_01B9                  ; 5A8C   0240 01B9
        MVII    #$0002, R0                      ; 5A8E   02B8 0002
        XOR     G_01BA, R0                      ; 5A90   03C0 01BA
        MVO     R0,     G_01BA                  ; 5A92   0240 01BA
        MVII    #$0001, R0                      ; 5A94   02B8 0001
        MVO     R0,     G_0166                  ; 5A96   0240 0166
        PULR    R7                              ; 5A98   02B7
        PSHR    R5                              ; 5A99   0275
        MVI     G_019A, R0                      ; 5A9A   0280 019A
        TSTR    R0                              ; 5A9C   0080
        BNEQ    L_5AA8                          ; 5A9D   020C 0009

        MVI     G_018A, R1                      ; 5A9F   0281 018A
        DECR    R1                              ; 5AA1   0011
        MVO     R1,     G_018A                  ; 5AA2   0241 018A
        CMP     G_018B, R1                      ; 5AA4   0341 018B
        BLT     L_5AAC                          ; 5AA6   0205 0004

L_5AA8:
        MVII    #$0196, R5                      ; 5AA8   02BD 0196
        SDBD                                    ; 5AAA   0001
        MVI@    R5,     R7                      ; 5AAB   02AF
L_5AAC:
        MVII    #$0002, R0                      ; 5AAC   02B8 0002

        JSR     R5,     G_4F54                  ; 5AAE   0004 014C 0354

        TSTR    R1                              ; 5AB1   0089
        BEQ     L_5AB6                          ; 5AB2   0204 0002

        PULR    R7                              ; 5AB4   02B7
        PSHR    R5                              ; 5AB5   0275
L_5AB6:
        CLRR    R0                              ; 5AB6   01C0
        MVO     R0,     G_0126                  ; 5AB7   0240 0126
L_5AB9:
        COMR    R0                              ; 5AB9   0018
        MVO     R0,     G_0163                  ; 5ABA   0240 0163

        JSR     R5,     L_532E                  ; 5ABC   0004 0150 032E

        MVI     G_01A0, R0                      ; 5ABF   0280 01A0
        TSTR    R0                              ; 5AC1   0080
        BNEQ    L_5AD0                          ; 5AC2   020C 000C

        MVI     G_0181, R0                      ; 5AC4   0280 0181
        CMPI    #$0006, R0                      ; 5AC6   0378 0006
        BGE     L_5AD0                          ; 5AC8   020D 0006

        INCR    R0                              ; 5ACA   0008
        MVO     R0,     G_0181                  ; 5ACB   0240 0181

        JSR     R5,     G_4F3A                  ; 5ACD   0004 014C 033A

L_5AD0:
        MVI     G_0185, R0                      ; 5AD0   0280 0185
        ANDI    #$0003, R0                      ; 5AD2   03B8 0003
        CMPI    #$0002, R0                      ; 5AD4   0378 0002
        BNEQ    L_5B0A                          ; 5AD6   020C 0032

        MVI     G_01BC, R0                      ; 5AD8   0280 01BC
        CMPI    #$0002, R0                      ; 5ADA   0378 0002
        BNEQ    L_5B0A                          ; 5ADC   020C 002C

L_5ADE:
        JSR     R5,     L_58B1                  ; 5ADE   0004 0158 00B1

        MVII    #$0001, R0                      ; 5AE1   02B8 0001
        MVO     R0,     G_010F                  ; 5AE3   0240 010F
L_5AE5:
        CMP     G_010F, R0                      ; 5AE5   0340 010F
        BEQ     L_5AE5                          ; 5AE7   0224 0003

        MVI     G_0184, R0                      ; 5AE9   0280 0184
        CMPI    #$0001, R0                      ; 5AEB   0378 0001
        BNEQ    L_5B0A                          ; 5AED   020C 001B

        MVI     G_035A, R0                      ; 5AEF   0280 035A
        SDBD                                    ; 5AF1   0001
        SUBI    #$0010, R0                      ; 5AF2   0338 0010 0000
        MVO     R0,     G_035A                  ; 5AF5   0240 035A
        MVI     G_019B, R0                      ; 5AF7   0280 019B
        CMPI    #$0004, R0                      ; 5AF9   0378 0004
        BNEQ    L_5B17                          ; 5AFB   020C 001A

        MVII    #$00FF, R0                      ; 5AFD   02B8 00FF
        MVO     R0,     G_0166                  ; 5AFF   0240 0166

        JSR     R5,     G_4E53                  ; 5B01   0004 014C 0253

        MVII    #$0001, R0                      ; 5B04   02B8 0001
        MVO     R0,     G_0186                  ; 5B06   0240 0186
        B       L_5B17                          ; 5B08   0200 000D

L_5B0A:
        MVI     G_019B, R0                      ; 5B0A   0280 019B
        CMPI    #$0003, R0                      ; 5B0C   0378 0003
        BEQ     L_5B1E                          ; 5B0E   0204 000E

        INCR    R0                              ; 5B10   0008
        MVO     R0,     G_019B                  ; 5B11   0240 019B
        CMPI    #$0004, R0                      ; 5B13   0378 0004
        BGT     L_5B80                          ; 5B15   020E 0069

L_5B17:
        JSR     R5,     L_5481                  ; 5B17   0004 0154 0081

L_5B1A:
        MVII    #$0198, R4                      ; 5B1A   02BC 0198
        SDBD                                    ; 5B1C   0001
        MVI@    R4,     R7                      ; 5B1D   02A7
L_5B1E:
        MVO     R0,     G_01A8                  ; 5B1E   0240 01A8

        JSR     R5,     L_532E                  ; 5B20   0004 0150 032E

        SDBD                                    ; 5B23   0001
        MVII    #$6026, R0                      ; 5B24   02B8 0026 0060
        MVO     R0,     G_0337                  ; 5B27   0240 0337
        MVII    #$0080, R0                      ; 5B29   02B8 0080
        MVO     R0,     G_0347                  ; 5B2B   0240 0347
        PULR    R7                              ; 5B2D   02B7
        PSHR    R5                              ; 5B2E   0275
        MVII    #$0002, R3                      ; 5B2F   02BB 0002
        MVII    #$0006, R2                      ; 5B31   02BA 0006

        JSR     R5,     G_4CB4                  ; 5B33   0004 014C 00B4

        MVII    #$018E, R4                      ; 5B36   02BC 018E
        MVII    #$0006, R1                      ; 5B38   02B9 0006
        MVII    #$0002, R0                      ; 5B3A   02B8 0002
L_5B3C:
        MVO@    R0,     R4                      ; 5B3C   0260
        DECR    R1                              ; 5B3D   0011
        BNEQ    L_5B3C                          ; 5B3E   022C 0003

        MVII    #$012A, R4                      ; 5B40   02BC 012A
        MVII    #$013A, R5                      ; 5B42   02BD 013A
        MVII    #$0006, R2                      ; 5B44   02BA 0006
L_5B46:
        MVO@    R0,     R4                      ; 5B46   0260
        INCR    R4                              ; 5B47   000C
        MVO@    R0,     R5                      ; 5B48   0268
        INCR    R5                              ; 5B49   000D
        DECR    R2                              ; 5B4A   0012
        BNEQ    L_5B46                          ; 5B4B   022C 0006

        PULR    R7                              ; 5B4D   02B7
        PSHR    R5                              ; 5B4E   0275
        MVI     G_0187, R0                      ; 5B4F   0280 0187
        SLR     R0,     1                       ; 5B51   0060
        MVO     R0,     G_0187                  ; 5B52   0240 0187

        JSR     R5,     L_5E69                  ; 5B54   0004 015C 0269
        JSR     R5,     L_5D13                  ; 5B57   0004 015C 0113
        JSR     R5,     L_590A                  ; 5B5A   0004 0158 010A
L_5B5D:
        JSR     R5,     G_4BA9                  ; 5B5D   0004 0148 03A9

        MVI     G_01A8, R0                      ; 5B60   0280 01A8
        TSTR    R0                              ; 5B62   0080
        BNEQ    L_5B5D                          ; 5B63   022C 0007

        SDBD                                    ; 5B65   0001
        MVII    #$5FE6, R0                      ; 5B66   02B8 00E6 005F
        MVO     R0,     G_0331                  ; 5B69   0240 0331

        JSR     R5,     L_5E69                  ; 5B6B   0004 015C 0269
        JSR     R5,     G_4F00                  ; 5B6E   0004 014C 0300
        JSR     R5,     G_4F3A                  ; 5B71   0004 014C 033A
        JSR     R5,     G_4BA2                  ; 5B74   0004 0148 03A2

        SAR     R3,     2                       ; 5B77   006F
        SLLC    R0,     2                       ; 5B78   005C
        MVI     G_019B, R0                      ; 5B79   0280 019B
        INCR    R0                              ; 5B7B   0008
        MVO     R0,     G_019B                  ; 5B7C   0240 019B
        B       L_5B17                          ; 5B7E   0220 0068

L_5B80:
        JSR     R5,     L_5D1D                  ; 5B80   0004 015C 011D
        JSR     R5,     L_5922                  ; 5B83   0004 0158 0122

        MVII    #$0001, R0                      ; 5B86   02B8 0001
        MVO     R0,     G_01A8                  ; 5B88   0240 01A8

L_5B8A:
        JSR     R5,     G_4BA9                  ; 5B8A   0004 0148 03A9

        MVI     G_01A8, R0                      ; 5B8D   0280 01A8
        TSTR    R0                              ; 5B8F   0080
        BNEQ    L_5B8A                          ; 5B90   022C 0007

        MVI     G_0187, R0                      ; 5B92   0280 0187
        SLL     R0,     1                       ; 5B94   0048
        MVO     R0,     G_0187                  ; 5B95   0240 0187
        MVI     G_01B7, R0                      ; 5B97   0280 01B7
        INCR    R0                              ; 5B99   0008
        ANDI    #$00FF, R0                      ; 5B9A   03B8 00FF
        BEQ     L_5BA0                          ; 5B9C   0204 0002

        MVO     R0,     G_01B7                  ; 5B9E   0240 01B7
L_5BA0:
        MVI     G_01B7, R1                      ; 5BA0   0281 01B7
        CMPI    #$0003, R1                      ; 5BA2   0379 0003
        BNEQ    L_5BC1                          ; 5BA4   020C 001B

        MVI     G_0187, R0                      ; 5BA6   0280 0187
        ADDI    #$0008, R0                      ; 5BA8   02F8 0008
        CMPI    #$0040, R0                      ; 5BAA   0378 0040
        BGE     L_5BB0                          ; 5BAC   020D 0002

        MVO     R0,     G_0187                  ; 5BAE   0240 0187
L_5BB0:
        MVI     G_0188, R0                      ; 5BB0   0280 0188
        ADDI    #$0004, R0                      ; 5BB2   02F8 0004
        CMPI    #$0020, R0                      ; 5BB4   0378 0020
        BGE     L_5BBA                          ; 5BB6   020D 0002

        MVO     R0,     G_0188                  ; 5BB8   0240 0188
L_5BBA:
        MVI     G_0189, R0                      ; 5BBA   0280 0189
        DECR    R0                              ; 5BBC   0010
        BEQ     L_5BC1                          ; 5BBD   0204 0002

        MVO     R0,     G_0189                  ; 5BBF   0240 0189
L_5BC1:
        MVI     G_0176, R0                      ; 5BC1   0280 0176
        ADDI    #$000A, R0                      ; 5BC3   02F8 000A
        MVO     R0,     G_0176                  ; 5BC5   0240 0176

        JSR     R5,     G_4F00                  ; 5BC7   0004 014C 0300

        SDBD                                    ; 5BCA   0001
        MVII    #$5FFC, R0                      ; 5BCB   02B8 00FC 005F
        MVO     R0,     G_0331                  ; 5BCE   0240 0331

        JSR     R5,     G_4BA2                  ; 5BD0   0004 0148 03A2

L_5BD3:
        SAR     R3,     2                       ; 5BD3   006F
        SLLC    R0,     2                       ; 5BD4   005C
        CLRR    R0                              ; 5BD5   01C0
        MVO     R0,     G_0342                  ; 5BD6   0240 0342
        MVO     R0,     G_010D                  ; 5BD8   0240 010D
        CLRR    R0                              ; 5BDA   01C0
        COMR    R0                              ; 5BDB   0018
        MVO     R0,     G_0164                  ; 5BDC   0240 0164

        JSR     R5,     G_4F00                  ; 5BDE   0004 014C 0300
        JSR     R5,     G_4F3A                  ; 5BE1   0004 014C 033A

        SDBD                                    ; 5BE4   0001
        MVII    #$54A0, R0                      ; 5BE5   02B8 00A0 0054
        MVO     R0,     G_035A                  ; 5BE8   0240 035A
        MVII    #$0001, R0                      ; 5BEA   02B8 0001
        MVO     R0,     G_019B                  ; 5BEC   0240 019B

        JSR     R5,     G_4BA2                  ; 5BEE   0004 0148 03A2

        SAR     R3,     2                       ; 5BF1   006F
        SLLC    R0,     2                       ; 5BF2   005C
        B       L_5B17                          ; 5BF3   0220 00DD

        MVO     R3,     G_0186                  ; 5BF5   0243 0186
        MOVR    R5,     R7                      ; 5BF7   00AF
        PSHR    R5                              ; 5BF8   0275
        MVII    #$0006, R1                      ; 5BF9   02B9 0006
        MVII    #$018E, R4                      ; 5BFB   02BC 018E
L_5BFD:
        MVI@    R4,     R0                      ; 5BFD   02A0
        CMPI    #$00FF, R0                      ; 5BFE   0378 00FF
        BEQ     L_5C0A                          ; 5C00   0204 0008

        DECR    R1                              ; 5C02   0011
        BNEQ    L_5BFD                          ; 5C03   022C 0007

        MVI     G_018C, R0                      ; 5C05   0280 018C
        MVO     R0,     G_0163                  ; 5C07   0240 0163
        PULR    R7                              ; 5C09   02B7
L_5C0A:
        DECR    R4                              ; 5C0A   0014
        PSHR    R4                              ; 5C0B   0274
        MVII    #$007F, R0                      ; 5C0C   02B8 007F
        MVO     R0,     G_019D                  ; 5C0E   0240 019D
        CLRR    R0                              ; 5C10   01C0
        MVO     R0,     G_019E                  ; 5C11   0240 019E
        MVO     R0,     G_019F                  ; 5C13   0240 019F
        MVI     G_0318, R2                      ; 5C15   0282 0318
        ANDI    #$00FF, R2                      ; 5C17   03BA 00FF
        MVII    #$031A, R4                      ; 5C19   02BC 031A
        MVII    #$018E, R5                      ; 5C1B   02BD 018E
L_5C1D:
        CMPI    #$0193, R5                      ; 5C1D   037D 0193
        BGT     L_5C41                          ; 5C1F   020E 0020

        MVI@    R4,     R1                      ; 5C21   02A1
        MVI@    R5,     R0                      ; 5C22   02A8
        ANDI    #$0080, R0                      ; 5C23   03B8 0080
        BNEQ    L_5C1D                          ; 5C25   022C 0009

        MOVR    R1,     R0                      ; 5C27   0088
        ANDI    #$0100, R0                      ; 5C28   03B8 0100
        BEQ     L_5C1D                          ; 5C2A   0224 000E

        ANDI    #$00FF, R1                      ; 5C2C   03B9 00FF
        SUBR    R2,     R1                      ; 5C2E   0111
        BPL     L_5C32                          ; 5C2F   0203 0001

        NEGR    R1                              ; 5C31   0021
L_5C32:
        CMP     G_019D, R1                      ; 5C32   0341 019D
        BGE     L_5C1D                          ; 5C34   022D 0018

        MOVR    R4,     R0                      ; 5C36   00A0
        DECR    R0                              ; 5C37   0010
        MVO     R0,     G_019E                  ; 5C38   0240 019E
        SWAP    R0,     1                       ; 5C3A   0040
        MVO     R0,     G_019F                  ; 5C3B   0240 019F
        MVO     R1,     G_019D                  ; 5C3D   0241 019D
        B       L_5C1D                          ; 5C3F   0220 0023

L_5C41:
        PULR    R3                              ; 5C41   02B3
        MVI     G_019F, R1                      ; 5C42   0281 019F
        SWAP    R1,     1                       ; 5C44   0041
        XOR     G_019E, R1                      ; 5C45   03C1 019E
        TSTR    R1                              ; 5C47   0089
        BEQ     L_5C74                          ; 5C48   0204 002A

        MVII    #$00FD, R0                      ; 5C4A   02B8 00FD
        MVO@    R0,     R3                      ; 5C4C   0258
        ADDI    #$018C, R3                      ; 5C4D   02FB 018C
        MOVR    R1,     R2                      ; 5C4F   008A
        MVI     G_01B7, R0                      ; 5C50   0280 01B7
        CMPI    #$0007, R0                      ; 5C52   0378 0007
        BLT     L_5C58                          ; 5C54   0205 0002

        MVII    #$0006, R0                      ; 5C56   02B8 0006

L_5C58:
        JSR     R5,     X_RAND2                 ; 5C58   0004 0114 029E

        MOVR    R0,     R5                      ; 5C5B   0085
L_5C5C:
        ADDR    R5,     R5                      ; 5C5C   00ED
        SDBD                                    ; 5C5D   0001
        ADDI    #$5475, R5                      ; 5C5E   02FD 0075 0054
        SDBD                                    ; 5C61   0001
        MVI@    R5,     R4                      ; 5C62   02AC
        PSHR    R3                              ; 5C63   0273

        JSR     R5,     L_5160                  ; 5C64   0004 0150 0160

        PULR    R3                              ; 5C67   02B3
        SUBI    #$0318, R3                      ; 5C68   033B 0318
        SLL     R3,     1                       ; 5C6A   004B
        ADDI    #$0136, R3                      ; 5C6B   02FB 0136
        MVI     G_0188, R0                      ; 5C6D   0280 0188
        MVO@    R0,     R3                      ; 5C6F   0258
        MVI     G_018C, R0                      ; 5C70   0280 018C
        MVO     R0,     G_0163                  ; 5C72   0240 0163
L_5C74:
        PULR    R7                              ; 5C74   02B7
        DECLE   $0004                           ; 5C75   0004

        SLLC    R3,     2                       ; 5C76   005F
        MOVR    R5,     R4                      ; 5C77   00AC
        SLLC    R3,     2                       ; 5C78   005F
        MOVR    R5,     R4                      ; 5C79   00AC
        SLLC    R3,     2                       ; 5C7A   005F
        ADDR    R1,     R0                      ; 5C7B   00C8
        SLLC    R3,     2                       ; 5C7C   005F
        ADDR    R1,     R0                      ; 5C7D   00C8
        SLLC    R3,     2                       ; 5C7E   005F
        ADDR    R1,     R0                      ; 5C7F   00C8
        SLLC    R3,     2                       ; 5C80   005F
        PSHR    R5                              ; 5C81   0275
        MVII    #$018A, R5                      ; 5C82   02BD 018A
        MVI     G_035A, R4                      ; 5C84   0284 035A
        MVII    #$000A, R3                      ; 5C86   02BB 000A
L_5C88:
        MVI@    R4,     R0                      ; 5C88   02A0
        MVO@    R0,     R5                      ; 5C89   0268
        DECR    R3                              ; 5C8A   0013
        BNEQ    L_5C88                          ; 5C8B   022C 0004

        MVO     R3,     G_01A0                  ; 5C8D   0243 01A0
        MVII    #$0003, R1                      ; 5C8F   02B9 0003
L_5C91:
        SDBD                                    ; 5C91   0001
        MVI@    R4,     R0                      ; 5C92   02A0
        MVO@    R0,     R5                      ; 5C93   0268
        SWAP    R0,     1                       ; 5C94   0040
        MVO@    R0,     R5                      ; 5C95   0268
        DECR    R1                              ; 5C96   0011
        BNEQ    L_5C91                          ; 5C97   022C 0007

        MVO     R4,     G_035A                  ; 5C99   0244 035A
        MVI     G_018C, R0                      ; 5C9B   0280 018C
        MVO     R0,     G_0163                  ; 5C9D   0240 0163
        PULR    R7                              ; 5C9F   02B7
        INCR    R0                              ; 5CA0   0008
        EIS                                     ; 5CA1   0002
        INCR    R2                              ; 5CA2   000A
        EIS                                     ; 5CA3   0002
        ADDR    R7,     R7                      ; 5CA4   00FF
        ADDR    R7,     R7                      ; 5CA5   00FF
        DIS                                     ; 5CA6   0003
        DIS                                     ; 5CA7   0003
        DIS                                     ; 5CA8   0003
        DIS                                     ; 5CA9   0003
        ADDR    R5,     R4                      ; 5CAA   00EC
        RLC     R0,     2                       ; 5CAB   0054
        DIS                                     ; 5CAC   0003
        RLC     R1,     2                       ; 5CAD   0055
        ADCR    R2                              ; 5CAE   002A
L_5CAF:
        RLC     R1,     2                       ; 5CAF   0055
        INCR    R0                              ; 5CB0   0008
        EIS                                     ; 5CB1   0002
        INCR    R2                              ; 5CB2   000A
        EIS                                     ; 5CB3   0002
        ADDR    R7,     R7                      ; 5CB4   00FF
        ADDR    R7,     R7                      ; 5CB5   00FF
        DIS                                     ; 5CB6   0003
        DIS                                     ; 5CB7   0003
        DIS                                     ; 5CB8   0003
        DIS                                     ; 5CB9   0003
        SLL     R1,     1                       ; 5CBA   0049
L_5CBB:
        RLC     R1,     2                       ; 5CBB   0055
        MOVR    R4,     R5                      ; 5CBC   00A5
        RLC     R1,     2                       ; 5CBD   0055
        RSWD    R6                              ; 5CBE   003E
        RLC     R1,     2                       ; 5CBF   0055
        INCR    R0                              ; 5CC0   0008
L_5CC1:
        DECLE   $0001                           ; 5CC1   0001

        INCR    R2                              ; 5CC2   000A
        DECLE   $0001                           ; 5CC3   0001

        ADDR    R7,     R7                      ; 5CC4   00FF
        SETC                                    ; 5CC5   0007
        INCR    R0                              ; 5CC6   0008
L_5CC7:
        INCR    R0                              ; 5CC7   0008
        INCR    R0                              ; 5CC8   0008
        INCR    R0                              ; 5CC9   0008
        DECR    R3                              ; 5CCA   0013
        RLC     R2,     2                       ; 5CCB   0056
L_5CCC:
        ADDR    R1,     R4                      ; 5CCC   00CC
        RLC     R1,     2                       ; 5CCD   0055
        ADDR    R1,     R4                      ; 5CCE   00CC
        RLC     R1,     2                       ; 5CCF   0055
        EIS                                     ; 5CD0   0002
        EIS                                     ; 5CD1   0002
        INCR    R2                              ; 5CD2   000A
        DECLE   $0000                           ; 5CD3   0000

        EIS                                     ; 5CD4   0002
        DECLE   $0001                           ; 5CD5   0001
L_5CD6:
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5CD6   0001 0001 0001 0001

        SLR     R2,     2                       ; 5CDA   0066
        RLC     R3,     2                       ; 5CDB   0057
        MOVR    R4,     R5                      ; 5CDC   00A5
        RLC     R1,     2                       ; 5CDD   0055
        MOVR    R4,     R3                      ; 5CDE   00A3
        RLC     R2,     2                       ; 5CDF   0056
        MOVR    R2,     R3                      ; 5CE0   0093
        J       G_4F52                          ; 5CE1   0004 034C 0352

        PSHR    R5                              ; 5CE4   0275
        MOVR    R2,     R3                      ; 5CE5   0093

        JSR     R5,     G_4F52                  ; 5CE6   0004 014C 0352

        J       G_4F76                          ; 5CE9   0004 034C 0376

        ADDI    #$0318, R1                      ; 5CEC   02F9 0318
        MVI@    R1,     R0                      ; 5CEE   0288
        ANDI    #$0100, R0                      ; 5CEF   03B8 0100
        BEQ     L_5D77                          ; 5CF1   0204 0084

        PSHR    R1                              ; 5CF3   0271
        MVII    #$0019, R1                      ; 5CF4   02B9 0019

        JSR     R5,     L_57F3                  ; 5CF6   0004 0154 03F3

        PULR    R3                              ; 5CF9   02B3
        SDBD                                    ; 5CFA   0001
        MVII    #$5ECC, R4                      ; 5CFB   02BC 00CC 005E

        JSR     R5,     L_57E4                  ; 5CFE   0004 0154 03E4

        PULR    R7                              ; 5D01   02B7
        PSHR    R5                              ; 5D02   0275
        ANDI    #$000E, R3                      ; 5D03   03BB 000E
        MOVR    R3,     R1                      ; 5D05   0099
        PSHR    R1                              ; 5D06   0271
        ADDI    #$0318, R3                      ; 5D07   02FB 0318
        SDBD                                    ; 5D09   0001
        MVII    #$5F12, R4                      ; 5D0A   02BC 0012 005F
        MVII    #$0002, R2                      ; 5D0D   02BA 0002

        JSR     R5,     G_4BC1                  ; 5D0F   0004 0148 03C1

        PULR    R4                              ; 5D12   02B4
L_5D13:
        MOVR    R4,     R3                      ; 5D13   00A3
        ADDI    #$018C, R4                      ; 5D14   02FC 018C
        MVII    #$0003, R0                      ; 5D16   02B8 0003
        MVO@    R0,     R4                      ; 5D18   0260
        MVO@    R0,     R4                      ; 5D19   0260
        MVII    #$0088, R0                      ; 5D1A   02B8 0088

        JSR     R5,     X_RAND2                 ; 5D1C   0004 0114 029E

        ADDI    #$0010, R0                      ; 5D1F   02F8 0010
        MOVR    R4,     R1                      ; 5D21   00A1
        ADDI    #$018A, R1                      ; 5D22   02F9 018A
        XOR@    R1,     R0                      ; 5D24   03C8
        MVO@    R0,     R1                      ; 5D25   0248

        JSR     R5,     L_579D                  ; 5D26   0004 0154 039D

        PULR    R7                              ; 5D29   02B7
        SDBD                                    ; 5D2A   0001
        MVII    #$5FFC, R0                      ; 5D2B   02B8 00FC 005F
        MVO     R0,     G_01A2                  ; 5D2E   0240 01A2
        SWAP    R0,     1                       ; 5D30   0040
        MVO     R0,     G_01A3                  ; 5D31   0240 01A3
        MVII    #$0004, R3                      ; 5D33   02BB 0004

        JSR     R5,     L_5502                  ; 5D35   0004 0154 0102

        MVII    #$0006, R3                      ; 5D38   02BB 0006

        JSR     R5,     L_5502                  ; 5D3A   0004 0154 0102

        PULR    R7                              ; 5D3D   02B7
        MVII    #$0004, R3                      ; 5D3E   02BB 0004

        JSR     R5,     L_55A4                  ; 5D40   0004 0154 01A4

        MVII    #$0006, R3                      ; 5D43   02BB 0006

        JSR     R5,     L_55A4                  ; 5D45   0004 0154 01A4

        PULR    R7                              ; 5D48   02B7
        ADDI    #$0318, R1                      ; 5D49   02F9 0318
        MVI@    R1,     R0                      ; 5D4B   0288
        ANDI    #$0100, R0                      ; 5D4C   03B8 0100
        BEQ     L_5D77                          ; 5D4E   0204 0027

        PSHR    R1                              ; 5D50   0271
        MVII    #$0019, R1                      ; 5D51   02B9 0019

        JSR     R5,     L_57F3                  ; 5D53   0004 0154 03F3

        PULR    R1                              ; 5D56   02B1
        MOVR    R1,     R3                      ; 5D57   008B
        SDBD                                    ; 5D58   0001
        ADDI    #$FE74, R1                      ; 5D59   02F9 0074 00FE
        MVI@    R1,     R0                      ; 5D5C   0288
        CMPI    #$0003, R0                      ; 5D5D   0378 0003
        BEQ     L_5D78                          ; 5D5F   0204 0017

        CMPI    #$0005, R0                      ; 5D61   0378 0005
        BEQ     L_5D9C                          ; 5D63   0204 0037

        SDBD                                    ; 5D65   0001
        MVII    #$5EDA, R4                      ; 5D66   02BC 00DA 005E
        PSHR    R3                              ; 5D69   0273

L_5D6A:
        JSR     R5,     L_57E4                  ; 5D6A   0004 0154 03E4

        PULR    R1                              ; 5D6D   02B1
        SUBI    #$0318, R1                      ; 5D6E   0339 0318
        XORI    #$0001, R1                      ; 5D70   03F9 0001
        ADDI    #$018C, R1                      ; 5D72   02F9 018C
        MVII    #$0005, R2                      ; 5D74   02BA 0005
        MVO@    R2,     R1                      ; 5D76   024A
L_5D77:
        PULR    R7                              ; 5D77   02B7
L_5D78:
        SUBI    #$018C, R1                      ; 5D78   0339 018C
        ANDI    #$000E, R1                      ; 5D7A   03B9 000E
        XORI    #$0001, R1                      ; 5D7C   03F9 0001
        ADDI    #$0318, R1                      ; 5D7E   02F9 0318
        MVI@    R1,     R0                      ; 5D80   0288
        SDBD                                    ; 5D81   0001
        ANDI    #$BFFF, R0                      ; 5D82   03B8 00FF 00BF
        MVO@    R0,     R1                      ; 5D85   0248
        ADDI    #$0008, R1                      ; 5D86   02F9 0008
        MVI@    R1,     R0                      ; 5D88   0288
        SDBD                                    ; 5D89   0001
        ANDI    #$BFFF, R0                      ; 5D8A   03B8 00FF 00BF
        MVO@    R0,     R1                      ; 5D8D   0248
        SUBI    #$0195, R1                      ; 5D8E   0339 0195
        MVII    #$0004, R0                      ; 5D90   02B8 0004
        MVO@    R0,     R1                      ; 5D92   0248
        INCR    R1                              ; 5D93   0009
        MVO@    R0,     R1                      ; 5D94   0248
        SUBI    #$018C, R1                      ; 5D95   0339 018C
        MOVR    R1,     R3                      ; 5D97   008B

        JSR     R5,     L_579D                  ; 5D98   0004 0154 039D

        PULR    R7                              ; 5D9B   02B7
L_5D9C:
        SDBD                                    ; 5D9C   0001
        MVII    #$5ECC, R4                      ; 5D9D   02BC 00CC 005E

        JSR     R5,     L_57E4                  ; 5DA0   0004 0154 03E4

        PULR    R7                              ; 5DA3   02B7
        PSHR    R5                              ; 5DA4   0275
        ANDI    #$000E, R3                      ; 5DA5   03BB 000E
        MOVR    R3,     R1                      ; 5DA7   0099
        PSHR    R1                              ; 5DA8   0271
        ADDI    #$0318, R3                      ; 5DA9   02FB 0318
        SDBD                                    ; 5DAB   0001
        MVII    #$5F2E, R4                      ; 5DAC   02BC 002E 005F
        MVII    #$0002, R2                      ; 5DAF   02BA 0002

        JSR     R5,     G_4BC1                  ; 5DB1   0004 0148 03C1

        PULR    R4                              ; 5DB4   02B4
        MOVR    R4,     R3                      ; 5DB5   00A3
        ADDI    #$018C, R4                      ; 5DB6   02FC 018C
        MVII    #$0003, R0                      ; 5DB8   02B8 0003
        MVO@    R0,     R4                      ; 5DBA   0260
        MVO@    R0,     R4                      ; 5DBB   0260
        MVII    #$0088, R0                      ; 5DBC   02B8 0088

        JSR     R5,     X_RAND2                 ; 5DBE   0004 0114 029E

        ADDI    #$0010, R0                      ; 5DC1   02F8 0010
        MOVR    R4,     R1                      ; 5DC3   00A1
        ADDI    #$018A, R1                      ; 5DC4   02F9 018A
        XOR@    R1,     R0                      ; 5DC6   03C8
        MVO@    R0,     R1                      ; 5DC7   0248

        JSR     R5,     L_579D                  ; 5DC8   0004 0154 039D

        PULR    R7                              ; 5DCB   02B7

        JSR     R5,     L_532E                  ; 5DCC   0004 0150 032E

        MVII    #$012A, R4                      ; 5DCF   02BC 012A
        MVII    #$013A, R5                      ; 5DD1   02BD 013A
        MVII    #$0006, R1                      ; 5DD3   02B9 0006
        CLRR    R0                              ; 5DD5   01C0
L_5DD6:
        MVO@    R0,     R4                      ; 5DD6   0260
        INCR    R4                              ; 5DD7   000C
        MVO@    R0,     R5                      ; 5DD8   0268
        INCR    R5                              ; 5DD9   000D
        DECR    R1                              ; 5DDA   0011
        BNEQ    L_5DD6                          ; 5DDB   022C 0006

        MVII    #$0005, R1                      ; 5DDD   02B9 0005
        MVO     R1,     G_01A1                  ; 5DDF   0241 01A1
        MVII    #$00FF, R0                      ; 5DE1   02B8 00FF
        MVO     R0,     G_018E                  ; 5DE3   0240 018E
        MVII    #$018F, R4                      ; 5DE5   02BC 018F
        MVII    #$0007, R0                      ; 5DE7   02B8 0007
        MVO@    R0,     R4                      ; 5DE9   0260
        MVII    #$0004, R1                      ; 5DEA   02B9 0004
        MVII    #$0008, R0                      ; 5DEC   02B8 0008
L_5DEE:
        MVO@    R0,     R4                      ; 5DEE   0260
        DECR    R1                              ; 5DEF   0011
        BNEQ    L_5DEE                          ; 5DF0   022C 0003

        MVII    #$031B, R3                      ; 5DF2   02BB 031B
        SDBD                                    ; 5DF4   0001
        MVII    #$5F4A, R4                      ; 5DF5   02BC 004A 005F
        MVII    #$0005, R2                      ; 5DF8   02BA 0005

        JSR     R5,     G_4BC1                  ; 5DFA   0004 0148 03C1

        MVII    #$0038, R0                      ; 5DFD   02B8 0038

        JSR     R5,     X_RAND2                 ; 5DFF   0004 0114 029E

        ADDI    #$0010, R0                      ; 5E02   02F8 0010
        MVI     G_031B, R1                      ; 5E04   0281 031B
        SDBD                                    ; 5E06   0001
        ANDI    #$FF00, R1                      ; 5E07   03B9 0000 00FF
        XORR    R0,     R1                      ; 5E0A   01C1
        MVO     R1,     G_031B                  ; 5E0B   0241 031B
        MVII    #$0003, R3                      ; 5E0D   02BB 0003

        JSR     R5,     L_57A5                  ; 5E0F   0004 0154 03A5

        PULR    R7                              ; 5E12   02B7
        ADDI    #$0318, R3                      ; 5E13   02FB 0318
        MVI@    R3,     R0                      ; 5E15   0298
        ANDI    #$0100, R0                      ; 5E16   03B8 0100
        BEQ     L_5E78                          ; 5E18   0204 005E

        MOVR    R1,     R4                      ; 5E1A   008C
        PSHR    R1                              ; 5E1B   0271
        ADDI    #$018C, R4                      ; 5E1C   02FC 018C
        MVII    #$00FE, R0                      ; 5E1E   02B8 00FE
        MVO@    R0,     R4                      ; 5E20   0260
        INCR    R1                              ; 5E21   0009
        ADDI    #$0318, R1                      ; 5E22   02F9 0318
        CMPI    #$0320, R1                      ; 5E24   0379 0320
        BEQ     L_5E4E                          ; 5E26   0204 0026

        MVI@    R1,     R0                      ; 5E28   0288
        MOVR    R0,     R3                      ; 5E29   0083
        SDBD                                    ; 5E2A   0001
        ANDI    #$4000, R0                      ; 5E2B   03B8 0000 0040
        BEQ     L_5E4E                          ; 5E2E   0204 001E

        SDBD                                    ; 5E30   0001
        XORI    #$4000, R3                      ; 5E31   03FB 0000 0040
        MVO@    R3,     R1                      ; 5E34   024B
        ADDI    #$0008, R1                      ; 5E35   02F9 0008
        MVI@    R1,     R3                      ; 5E37   028B
        SDBD                                    ; 5E38   0001
        XORI    #$4000, R3                      ; 5E39   03FB 0000 0040
        MVO@    R3,     R1                      ; 5E3C   024B
        SUBI    #$0320, R1                      ; 5E3D   0339 0320
        MOVR    R1,     R4                      ; 5E3F   008C
        ADDI    #$018C, R1                      ; 5E40   02F9 018C
        MVII    #$0003, R0                      ; 5E42   02B8 0003
        MVO@    R0,     R1                      ; 5E44   0248

        JSR     R5,     L_5679                  ; 5E45   0004 0154 0279

        MOVR    R4,     R3                      ; 5E48   00A3

        JSR     R5,     L_57A5                  ; 5E49   0004 0154 03A5

        B       L_5E51                          ; 5E4C   0200 0003

L_5E4E:
        JSR     R5,     L_5679                  ; 5E4E   0004 0154 0279

L_5E51:
        PULR    R1                              ; 5E51   02B1
        ADDI    #$0318, R1                      ; 5E52   02F9 0318
        MOVR    R1,     R3                      ; 5E54   008B
        MVI@    R1,     R0                      ; 5E55   0288
        SDBD                                    ; 5E56   0001
        MVII    #$BFFF, R2                      ; 5E57   02BA 00FF 00BF
        ANDR    R2,     R0                      ; 5E5A   0190
        MVO@    R0,     R1                      ; 5E5B   0248
        ADDI    #$0008, R1                      ; 5E5C   02F9 0008
        MVI@    R1,     R0                      ; 5E5E   0288
        ANDR    R2,     R0                      ; 5E5F   0190
        MVO@    R0,     R1                      ; 5E60   0248
        SDBD                                    ; 5E61   0001
        MVII    #$5EE8, R4                      ; 5E62   02BC 00E8 005E
        MVI     G_01A1, R0                      ; 5E65   0280 01A1
        DECR    R0                              ; 5E67   0010
        MVO     R0,     G_01A1                  ; 5E68   0240 01A1
        BNEQ    L_5E70                          ; 5E6A   020C 0004

        SDBD                                    ; 5E6C   0001
        SUBI    #$001C, R4                      ; 5E6D   033C 001C 0000

L_5E70:
        JSR     R5,     L_57E4                  ; 5E70   0004 0154 03E4

        MVII    #$0019, R1                      ; 5E73   02B9 0019

        JSR     R5,     L_57F3                  ; 5E75   0004 0154 03F3

L_5E78:
        PULR    R7                              ; 5E78   02B7
        PSHR    R5                              ; 5E79   0275
        MVII    #$018F, R1                      ; 5E7A   02B9 018F
L_5E7C:
        CMPI    #$0194, R1                      ; 5E7C   0379 0194
        BEQ     L_5EA2                          ; 5E7E   0204 0022

        MVI@    R1,     R0                      ; 5E80   0288
L_5E81:
        MOVR    R0,     R2                      ; 5E81   0082
        ANDI    #$0080, R0                      ; 5E82   03B8 0080
        BNEQ    L_5E8A                          ; 5E84   020C 0004

        CMPI    #$0003, R2                      ; 5E86   037A 0003
        BGE     L_5E8D                          ; 5E88   020D 0003

L_5E8A:
        INCR    R1                              ; 5E8A   0009
L_5E8B:
        B       L_5E7C                          ; 5E8B   0220 0010

L_5E8D:
        MVII    #$0003, R3                      ; 5E8D   02BB 0003
        MOVR    R1,     R2                      ; 5E8F   008A
        INCR    R2                              ; 5E90   000A
L_5E91:
        CMPI    #$0194, R2                      ; 5E91   037A 0194
        BEQ     L_5E9E                          ; 5E93   0204 0009

L_5E95:
        MVI@    R2,     R0                      ; 5E95   0290
        CMPI    #$0008, R0                      ; 5E96   0378 0008
        BNEQ    L_5E9E                          ; 5E98   020C 0004

        INCR    R3                              ; 5E9A   000B
        INCR    R2                              ; 5E9B   000A
        B       L_5E91                          ; 5E9C   0220 000C

L_5E9E:
        MVO@    R3,     R1                      ; 5E9E   024B
        MOVR    R2,     R1                      ; 5E9F   0091
        B       L_5E7C                          ; 5EA0   0220 0025

L_5EA2:
        PULR    R7                              ; 5EA2   02B7
        SDBD                                    ; 5EA3   0001
        MVII    #$5FE6, R0                      ; 5EA4   02B8 00E6 005F
        MVO     R0,     G_01A2                  ; 5EA7   0240 01A2
        SWAP    R0,     1                       ; 5EA9   0040
        MVO     R0,     G_01A3                  ; 5EAA   0240 01A3
        MVII    #$031A, R3                      ; 5EAC   02BB 031A
        SDBD                                    ; 5EAE   0001
        MVII    #$5F90, R4                      ; 5EAF   02BC 0090 005F

        JSR     R5,     G_4BC3                  ; 5EB2   0004 0148 03C3

L_5EB5:
        MVI     G_031A, R0                      ; 5EB5   0280 031A
        ANDI    #$0200, R0                      ; 5EB7   03B8 0200
        BEQ     L_5EB5                          ; 5EB9   0224 0005

        MVI     G_018C, R0                      ; 5EBB   0280 018C
        MVO     R0,     G_0165                  ; 5EBD   0240 0165
        MVII    #$0001, R0                      ; 5EBF   02B8 0001
        MVO     R0,     G_0342                  ; 5EC1   0240 0342
        MVII    #$0005, R0                      ; 5EC3   02B8 0005
        MVI     G_01B7, R1                      ; 5EC5   0281 01B7
        INCR    R1                              ; 5EC7   0009

        JSR     R5,     X_MPY                   ; 5EC8   0004 011C 01DC

        MOVR    R2,     R0                      ; 5ECB   0090
        ADDI    #$000F, R0                      ; 5ECC   02F8 000F
        MVO     R0,     G_01B4                  ; 5ECE   0240 01B4
        SLR     R0,     2                       ; 5ED0   0064
        MVO     R0,     G_01B6                  ; 5ED1   0240 01B6
        MVO     R0,     G_01B5                  ; 5ED3   0240 01B5
        MVII    #$0001, R0                      ; 5ED5   02B8 0001
        MVO     R0,     G_0164                  ; 5ED7   0240 0164
        PULR    R7                              ; 5ED9   02B7
        PSHR    R5                              ; 5EDA   0275
        MVI     G_019B, R0                      ; 5EDB   0280 019B
        CMPI    #$0004, R0                      ; 5EDD   0378 0004
        BNEQ    L_5EF2                          ; 5EDF   020C 0011

        MVII    #$018E, R3                      ; 5EE1   02BB 018E
        MVII    #$0006, R1                      ; 5EE3   02B9 0006
L_5EE5:
        MVI@    R3,     R0                      ; 5EE5   0298
        CMPI    #$0001, R0                      ; 5EE6   0378 0001
        BEQ     L_5EF3                          ; 5EE8   0204 0009

        INCR    R3                              ; 5EEA   000B
        DECR    R1                              ; 5EEB   0011
        BNEQ    L_5EE5                          ; 5EEC   022C 0008

        MVI     G_018C, R0                      ; 5EEE   0280 018C
        MVO     R0,     G_0165                  ; 5EF0   0240 0165
L_5EF2:
        PULR    R7                              ; 5EF2   02B7
L_5EF3:
        MVII    #$0003, R0                      ; 5EF3   02B8 0003
        MVO@    R0,     R3                      ; 5EF5   0258
        SUBI    #$018C, R3                      ; 5EF6   033B 018C
        PSHR    R3                              ; 5EF8   0273
        ADDI    #$0318, R3                      ; 5EF9   02FB 0318
        SDBD                                    ; 5EFB   0001
        MVII    #$5F9E, R4                      ; 5EFC   02BC 009E 005F
        MVII    #$031A, R2                      ; 5EFF   02BA 031A

        JSR     R5,     L_5160                  ; 5F01   0004 0150 0160

        PULR    R3                              ; 5F04   02B3

        JSR     R5,     L_5710                  ; 5F05   0004 0154 0310

        MVI     G_018C, R0                      ; 5F08   0280 018C
        MVO     R0,     G_0165                  ; 5F0A   0240 0165
        PULR    R7                              ; 5F0C   02B7
        MVII    #$0001, R0                      ; 5F0D   02B8 0001
        INCR    R7                              ; 5F0F   000F
        CLRR    R0                              ; 5F10   01C0
        PSHR    R5                              ; 5F11   0275
        PSHR    R0                              ; 5F12   0270
        MOVR    R3,     R4                      ; 5F13   009C
        ADDI    #$0320, R3                      ; 5F14   02FB 0320
        MVI@    R3,     R0                      ; 5F16   0298
        ANDI    #$007F, R0                      ; 5F17   03B8 007F
        CMPI    #$0050, R0                      ; 5F19   0378 0050
        BGE     L_5F4C                          ; 5F1B   020D 002F

        SUBI    #$0008, R3                      ; 5F1D   033B 0008
        MVI@    R3,     R0                      ; 5F1F   0298
        ANDI    #$00FF, R0                      ; 5F20   03B8 00FF
        CMPI    #$0008, R0                      ; 5F22   0378 0008
        BLT     L_5F4C                          ; 5F24   0205 0026

        CMPI    #$009E, R0                      ; 5F26   0378 009E
        BGT     L_5F4C                          ; 5F28   020E 0022

        ADDI    #$0318, R4                      ; 5F2A   02FC 0318
        MVI     G_0318, R2                      ; 5F2C   0282 0318
        ANDI    #$00FF, R2                      ; 5F2E   03BA 00FF
        MOVR    R2,     R0                      ; 5F30   0090
        BMI     L_5F4C                          ; 5F31   020B 0019

        CMPI    #$00A6, R0                      ; 5F33   0378 00A6
        BGT     L_5F4C                          ; 5F35   020E 0015

        MVII    #$0060, R3                      ; 5F37   02BB 0060
        MVI     G_0187, R1                      ; 5F39   0281 0187
        PULR    R0                              ; 5F3B   02B0
        TSTR    R0                              ; 5F3C   0080
        BEQ     L_5F41                          ; 5F3D   0204 0002

        MVI     G_0188, R1                      ; 5F3F   0281 0188
L_5F41:
        PSHR    R4                              ; 5F41   0274

        JSR     R5,     G_4C5C                  ; 5F42   0004 014C 005C

        PULR    R4                              ; 5F45   02B4
        MVI     G_0189, R0                      ; 5F46   0280 0189
        ADDI    #$0028, R4                      ; 5F48   02FC 0028
        MVO@    R0,     R4                      ; 5F4A   0260
        PULR    R7                              ; 5F4B   02B7
L_5F4C:
        PULR    R0                              ; 5F4C   02B0
        PULR    R7                              ; 5F4D   02B7
        MVI     G_031A, R0                      ; 5F4E   0280 031A
        MOVR    R0,     R1                      ; 5F50   0081
        ANDI    #$00FF, R0                      ; 5F51   03B8 00FF
        SDBD                                    ; 5F53   0001
        ANDI    #$FF00, R1                      ; 5F54   03B9 0000 00FF
        INCR    R0                              ; 5F57   0008
        CMPI    #$0089, R0                      ; 5F58   0378 0089
        BLT     L_5F5E                          ; 5F5A   0205 0002

        MVII    #$0020, R0                      ; 5F5C   02B8 0020
L_5F5E:
        XORR    R0,     R1                      ; 5F5E   01C1
        MVO     R1,     G_031A                  ; 5F5F   0241 031A
        MVII    #$0001, R0                      ; 5F61   02B8 0001
        MVO     R0,     G_0342                  ; 5F63   0240 0342
        MOVR    R5,     R7                      ; 5F65   00AF
        ADDI    #$0318, R1                      ; 5F66   02F9 0318
        MVI@    R1,     R0                      ; 5F68   0288
        ANDI    #$0100, R0                      ; 5F69   03B8 0100
        BEQ     L_5F85                          ; 5F6B   0204 0018

        SUBI    #$0318, R1                      ; 5F6D   0339 0318
        ADDI    #$018C, R1                      ; 5F6F   02F9 018C
        MVII    #$0001, R0                      ; 5F71   02B8 0001
        MVO@    R0,     R1                      ; 5F73   0248
        SUBI    #$018C, R1                      ; 5F74   0339 018C
        ADDI    #$0318, R1                      ; 5F76   02F9 0318
        MOVR    R1,     R3                      ; 5F78   008B
        SDBD                                    ; 5F79   0001
        MVII    #$5EDA, R4                      ; 5F7A   02BC 00DA 005E

        JSR     R5,     L_57E4                  ; 5F7D   0004 0154 03E4

        MVII    #$0001, R1                      ; 5F80   02B9 0001

        JSR     R5,     L_57F3                  ; 5F82   0004 0154 03F3

L_5F85:
        PULR    R7                              ; 5F85   02B7
        PSHR    R5                              ; 5F86   0275
        MVI     G_019B, R0                      ; 5F87   0280 019B
        CMPI    #$0004, R0                      ; 5F89   0378 0004
        BNEQ    L_5F9C                          ; 5F8B   020C 000F

        MVII    #$027A, R4                      ; 5F8D   02BC 027A
        MOVR    R4,     R5                      ; 5F8F   00A5
        MVII    #$0010, R1                      ; 5F90   02B9 0010
L_5F92:
        MVI@    R4,     R0                      ; 5F92   02A0
        XORI    #$0004, R0                      ; 5F93   03F8 0004
        MVO@    R0,     R5                      ; 5F95   0268
        DECR    R1                              ; 5F96   0011
        BNEQ    L_5F92                          ; 5F97   022C 0006

        INCR    R1                              ; 5F99   0009
        MVO     R1,     G_0164                  ; 5F9A   0241 0164
L_5F9C:
        PULR    R7                              ; 5F9C   02B7
        MVII    #$0088, R0                      ; 5F9D   02B8 0088
        B       L_5FB5                          ; 5F9F   0200 0014

        MVII    #$0078, R0                      ; 5FA1   02B8 0078
        B       L_5FB5                          ; 5FA3   0200 0010

        MOVR    R3,     R4                      ; 5FA5   009C
        ADDI    #$018C, R3                      ; 5FA6   02FB 018C
        MVI@    R3,     R1                      ; 5FA8   0299
        SUBI    #$0002, R1                      ; 5FA9   0339 0002
        MVII    #$00A0, R0                      ; 5FAB   02B8 00A0
L_5FAD:
        SUBI    #$0010, R0                      ; 5FAD   0338 0010
        DECR    R1                              ; 5FAF   0011
        BNEQ    L_5FAD                          ; 5FB0   022C 0004

        MOVR    R4,     R3                      ; 5FB2   00A3
        B       L_5FB5                          ; 5FB3   0200 0000

L_5FB5:
        PSHR    R5                              ; 5FB5   0275
        PSHR    R0                              ; 5FB6   0270
        MOVR    R3,     R1                      ; 5FB7   0099
        ADDI    #$0318, R1                      ; 5FB8   02F9 0318
        MVI@    R1,     R0                      ; 5FBA   0288
        MOVR    R0,     R2                      ; 5FBB   0082
        ANDI    #$00FF, R0                      ; 5FBC   03B8 00FF
        CMPI    #$00D2, R0                      ; 5FBE   0378 00D2
        BLT     L_5FC3                          ; 5FC0   0205 0001

        CLRR    R0                              ; 5FC2   01C0

L_5FC3:
        JSR     R5,     X_CLAMP                 ; 5FC3   0004 0114 0270

        INCR    R0                              ; 5FC6   0008
        MOVR    R3,     R7                      ; 5FC7   009F
        SDBD                                    ; 5FC8   0001
        ANDI    #$FF00, R2                      ; 5FC9   03BA 0000 00FF
        XORR    R0,     R2                      ; 5FCC   01C2
        MVO@    R2,     R1                      ; 5FCD   024A
        MOVR    R1,     R4                      ; 5FCE   008C
        PULR    R0                              ; 5FCF   02B0

        JSR     R5,     X_RAND2                 ; 5FD0   0004 0114 029E

        ADDI    #$0010, R0                      ; 5FD3   02F8 0010
        MOVR    R0,     R2                      ; 5FD5   0082
        MVII    #$002F, R0                      ; 5FD6   02B8 002F

        JSR     R5,     X_RAND2                 ; 5FD8   0004 0114 029E

        ADDI    #$0010, R0                      ; 5FDB   02F8 0010
        MOVR    R0,     R3                      ; 5FDD   0083
        MVI     G_0187, R1                      ; 5FDE   0281 0187

        JSR     R5,     G_4C59                  ; 5FE0   0004 014C 0059

        PULR    R7                              ; 5FE3   02B7
        PSHR    R5                              ; 5FE4   0275

        JSR     R5,     L_516D                  ; 5FE5   0004 0150 016D

        MVI     G_019A, R0                      ; 5FE8   0280 019A
        TSTR    R0                              ; 5FEA   0080
        BNEQ    L_5FF2                          ; 5FEB   020C 0005

        JSR     R5,     G_4B9E                  ; 5FED   0004 0148 039E

        COMR    R1                              ; 5FF0   0019
        SLLC    R0,     2                       ; 5FF1   005C
L_5FF2:
        PULR    R7                              ; 5FF2   02B7
        PSHR    R5                              ; 5FF3   0275
        MVI     G_019A, R0                      ; 5FF4   0280 019A
        TSTR    R0                              ; 5FF6   0080
        BNEQ    L_6021                          ; 5FF7   020C 0028

        MVI     G_0175, R0                      ; 5FF9   0280 0175
        ADDR    R1,     R0                      ; 5FFB   00C8
        MVO     R0,     G_0175                  ; 5FFC   0240 0175
        CMPI    #$0063, R0                      ; 5FFE   0378 0063
        BLE     L_601E                          ; 6000   0206 001C

        SUBI    #$0064, R0                      ; 6002   0338 0064
        MVO     R0,     G_0175                  ; 6004   0240 0175
        MVI     G_0176, R0                      ; 6006   0280 0176
        INCR    R0                              ; 6008   0008
        MVO     R0,     G_0176                  ; 6009   0240 0176
        CMPI    #$0063, R0                      ; 600B   0378 0063
        BLE     L_601E                          ; 600D   0206 000F

        CLRR    R0                              ; 600F   01C0
        MVO     R0,     G_0176                  ; 6010   0240 0176
        MVI     G_0177, R0                      ; 6012   0280 0177
        INCR    R0                              ; 6014   0008
        MVO     R0,     G_0177                  ; 6015   0240 0177
        CMPI    #$0063, R0                      ; 6017   0378 0063
        BLE     L_601E                          ; 6019   0206 0003

        CLRR    R0                              ; 601B   01C0
        MVO     R0,     G_0177                  ; 601C   0240 0177

L_601E:
        JSR     R5,     G_4F00                  ; 601E   0004 014C 0300

L_6021:
        PULR    R7                              ; 6021   02B7
        PSHR    R5                              ; 6022   0275
        ADDI    #$0320, R2                      ; 6023   02FA 0320
        MVI@    R2,     R0                      ; 6025   0290
        ANDI    #$007F, R0                      ; 6026   03B8 007F
        CMPI    #$0048, R0                      ; 6028   0378 0048
        BLT     L_603F                          ; 602A   0205 0013

        MVII    #$0040, R0                      ; 602C   02B8 0040
        MVO@    R0,     R2                      ; 602E   0250
        SUBI    #$0008, R2                      ; 602F   033A 0008
        MVI@    R2,     R0                      ; 6031   0290
        ANDI    #$00FF, R0                      ; 6032   03B8 00FF
        SUBI    #$0004, R0                      ; 6034   0338 0004
        MVO@    R0,     R2                      ; 6036   0250
        MOVR    R2,     R3                      ; 6037   0093
        SDBD                                    ; 6038   0001
        MVII    #$5FBA, R4                      ; 6039   02BC 00BA 005F

        JSR     R5,     L_516D                  ; 603C   0004 0150 016D

L_603F:
        PULR    R7                              ; 603F   02B7
        PSHR    R5                              ; 6040   0275
        MVI     G_0319, R1                      ; 6041   0281 0319

        JSR     R5,     L_509E                  ; 6043   0004 0150 009E

        ANDI    #$00FF, R1                      ; 6046   03B9 00FF
        CMPI    #$001D, R1                      ; 6048   0379 001D
        BLT     L_6061                          ; 604A   0205 0015

        CMPI    #$008C, R1                      ; 604C   0379 008C
        BGT     L_6061                          ; 604E   020E 0011

        MVI     G_01B4, R0                      ; 6050   0280 01B4
        TSTR    R0                              ; 6052   0080
        BEQ     L_6061                          ; 6053   0204 000C

        DECR    R0                              ; 6055   0010
        MVO     R0,     G_01B4                  ; 6056   0240 01B4
        BEQ     L_6078                          ; 6058   0204 001E

        MVI     G_01B5, R0                      ; 605A   0280 01B5
        DECR    R0                              ; 605C   0010
        MVO     R0,     G_01B5                  ; 605D   0240 01B5
        BEQ     L_6062                          ; 605F   0204 0001

L_6061:
        PULR    R7                              ; 6061   02B7
L_6062:
        MVII    #$027B, R4                      ; 6062   02BC 027B
        MOVR    R4,     R5                      ; 6064   00A5
        MVII    #$000E, R1                      ; 6065   02B9 000E
L_6067:
        MVI@    R4,     R0                      ; 6067   02A0
        ADDI    #$0008, R0                      ; 6068   02F8 0008
        MVO@    R0,     R5                      ; 606A   0268
        DECR    R1                              ; 606B   0011
        BNEQ    L_6067                          ; 606C   022C 0006

        MVI     G_01B6, R0                      ; 606E   0280 01B6
        MVO     R0,     G_01B5                  ; 6070   0240 01B5
        CLRR    R0                              ; 6072   01C0
        DIS                                     ; 6073   0003
        MVO     R0,     G_034C                  ; 6074   0240 034C
        EIS                                     ; 6076   0002
        PULR    R7                              ; 6077   02B7
L_6078:
        CLRR    R0                              ; 6078   01C0
        COMR    R0                              ; 6079   0018
        MVO     R0,     G_0164                  ; 607A   0240 0164
        MVII    #$027A, R5                      ; 607C   02BD 027A
        CLRR    R0                              ; 607E   01C0
        MVII    #$0010, R1                      ; 607F   02B9 0010
L_6081:
        MVO@    R0,     R5                      ; 6081   0268
        DECR    R1                              ; 6082   0011
        BNEQ    L_6081                          ; 6083   022C 0003

        PULR    R7                              ; 6085   02B7
        PSHR    R5                              ; 6086   0275
        MVI     G_0185, R0                      ; 6087   0280 0185
        ANDI    #$0003, R0                      ; 6089   03B8 0003
        CMPI    #$0003, R0                      ; 608B   0378 0003
        BNEQ    L_60AA                          ; 608D   020C 001B

        JSR     R5,     L_58C3                  ; 608F   0004 0158 00C3

        MVI     G_01BB, R3                      ; 6092   0283 01BB
        PSHR    R3                              ; 6094   0273
        SLL     R3,     2                       ; 6095   004F
        ADD@    R6,     R3                      ; 6096   02F3
        BEQ     L_60A5                          ; 6097   0204 000C

L_6099:
        MVII    #$0064, R1                      ; 6099   02B9 0064
        PSHR    R3                              ; 609B   0273

        JSR     R5,     L_57F3                  ; 609C   0004 0154 03F3

        PULR    R3                              ; 609F   02B3
        DECR    R3                              ; 60A0   0013
        BNEQ    L_6099                          ; 60A1   022C 0009

        MVO     R3,     G_01BB                  ; 60A3   0243 01BB
L_60A5:
        MVII    #$0050, R0                      ; 60A5   02B8 0050
        MVO     R0,     G_0167                  ; 60A7   0240 0167
        PULR    R7                              ; 60A9   02B7
L_60AA:
        SDBD                                    ; 60AA   0001
        MVII    #$FFFF, R0                      ; 60AB   02B8 00FF 00FF
        MVO     R0,     G_0167                  ; 60AE   0240 0167
        PULR    R7                              ; 60B0   02B7
        MVII    #$0181, R3                      ; 60B1   02BB 0181
        MVII    #$0182, R1                      ; 60B3   02B9 0182
        MVII    #$0183, R2                      ; 60B5   02BA 0183
        MVI     G_0184, R4                      ; 60B7   0284 0184
        TSTR    R4                              ; 60B9   00A4
        BEQ     L_60BF                          ; 60BA   0204 0003

        PSHR    R1                              ; 60BC   0271
        MOVR    R2,     R1                      ; 60BD   0091
        PULR    R2                              ; 60BE   02B2
L_60BF:
        MVI@    R3,     R0                      ; 60BF   0298
        MVO@    R0,     R1                      ; 60C0   0248
        MVI@    R2,     R0                      ; 60C1   0290
        MVO@    R0,     R3                      ; 60C2   0258
        PSHR    R5                              ; 60C3   0275
        MVI     G_0184, R3                      ; 60C4   0283 0184
        XORI    #$0001, R3                      ; 60C6   03FB 0001
        MVO     R3,     G_0184                  ; 60C8   0243 0184
        MVII    #$0175, R4                      ; 60CA   02BC 0175
        MVII    #$0179, R5                      ; 60CC   02BD 0179
        MVII    #$017D, R1                      ; 60CE   02B9 017D
        MVII    #$0004, R2                      ; 60D0   02BA 0004
        TSTR    R3                              ; 60D2   009B
        BEQ     L_60D8                          ; 60D3   0204 0003

        MOVR    R1,     R0                      ; 60D5   0088
        MOVR    R5,     R1                      ; 60D6   00A9
        MOVR    R0,     R5                      ; 60D7   0085
L_60D8:
        MVI@    R4,     R0                      ; 60D8   02A0
        MVO@    R0,     R5                      ; 60D9   0268
        DECR    R2                              ; 60DA   0012
        BNEQ    L_60D8                          ; 60DB   022C 0004

        MVII    #$0004, R2                      ; 60DD   02BA 0004
        MOVR    R1,     R5                      ; 60DF   008D
        SUBI    #$0004, R4                      ; 60E0   033C 0004
L_60E2:
        MVI@    R5,     R0                      ; 60E2   02A8
        MVO@    R0,     R4                      ; 60E3   0260
        DECR    R2                              ; 60E4   0012
        BNEQ    L_60E2                          ; 60E5   022C 0004

        MVII    #$0006, R0                      ; 60E7   02B8 0006
        TSTR    R3                              ; 60E9   009B
        BEQ     L_60EE                          ; 60EA   0204 0002

        MVII    #$0002, R0                      ; 60EC   02B8 0002
L_60EE:
        MVI     G_0328, R1                      ; 60EE   0281 0328
        SDBD                                    ; 60F0   0001
        ANDI    #$EFF8, R1                      ; 60F1   03B9 00F8 00EF
        XORR    R0,     R1                      ; 60F4   01C1
        MVO     R1,     G_0328                  ; 60F5   0241 0328

        JSR     R5,     G_4F00                  ; 60F7   0004 014C 0300
        JSR     R5,     G_4F3A                  ; 60FA   0004 014C 033A

        CLRR    R0                              ; 60FD   01C0
        MVO     R0,     G_0126                  ; 60FE   0240 0126
        MVI     G_0178, R0                      ; 6100   0280 0178
        TSTR    R0                              ; 6102   0080
        BEQ     L_6109                          ; 6103   0204 0004

        MVII    #$0003, R0                      ; 6105   02B8 0003
        MVO     R0,     G_0168                  ; 6107   0240 0168
L_6109:
        PULR    R7                              ; 6109   02B7
        PSHR    R5                              ; 610A   0275
        MVII    #$0068, R0                      ; 610B   02B8 0068
        MVO     R0,     G_01A6                  ; 610D   0240 01A6
        MVII    #$000B, R0                      ; 610F   02B8 000B
        MVII    #$000C, R1                      ; 6111   02B9 000C
        MVII    #$0001, R2                      ; 6113   02BA 0001
        MVO     R2,     G_01A5                  ; 6115   0242 01A5
        SDBD                                    ; 6117   0001
        MVII    #$64DC, R3                      ; 6118   02BB 00DC 0064
        SDBD                                    ; 611B   0001
        MVII    #$6565, R4                      ; 611C   02BC 0065 0065
        CLRR    R5                              ; 611F   01ED
        B       L_613A                          ; 6120   0200 0018

        PSHR    R5                              ; 6122   0275
        SDBD                                    ; 6123   0001
        MVII    #$FFBC, R0                      ; 6124   02B8 00BC 00FF
        MVO     R0,     G_01A6                  ; 6127   0240 01A6
        MVII    #$0006, R0                      ; 6129   02B8 0006
        MVII    #$0004, R1                      ; 612B   02B9 0004
        CLRR    R2                              ; 612D   01D2
        MVO     R2,     G_01A5                  ; 612E   0242 01A5
        SDBD                                    ; 6130   0001
        MVII    #$6209, R3                      ; 6131   02BB 0009 0062
        SDBD                                    ; 6134   0001
        MVII    #$622A, R4                      ; 6135   02BC 002A 0062
        MVII    #$0007, R5                      ; 6138   02BD 0007
L_613A:
        MVO     R0,     G_01A7                  ; 613A   0240 01A7
        MVO     R1,     G_0358                  ; 613C   0241 0358
        MVO     R3,     G_0359                  ; 613E   0243 0359
        MVO     R5,     G_018A                  ; 6140   0245 018A
        MVII    #$00FF, R0                      ; 6142   02B8 00FF
        MVO     R0,     G_01AA                  ; 6144   0240 01AA
        MVI     G_0320, R0                      ; 6146   0280 0320
        MVO     R0,     G_0321                  ; 6148   0240 0321
        CLRR    R0                              ; 614A   01C0
        MVO     R0,     G_01A9                  ; 614B   0240 01A9
        MVI@    R4,     R0                      ; 614D   02A0
        SDBD                                    ; 614E   0001
        ADDI    #$3800, R0                      ; 614F   02F8 0000 0038
        MVO     R0,     G_0356                  ; 6152   0240 0356
        MVI@    R4,     R0                      ; 6154   02A0
        SLR     R0,     2                       ; 6155   0064
        SLR     R0,     1                       ; 6156   0060
        MVO     R0,     G_0357                  ; 6157   0240 0357
        MVO     R4,     G_0355                  ; 6159   0244 0355
        SDBD                                    ; 615B   0001
        MVII    #$597A, R0                      ; 615C   02B8 007A 0059
L_615F:
        MVI     G_0103, R1                      ; 615F   0281 0103
        TSTR    R1                              ; 6161   0089
        BNEQ    L_615F                          ; 6162   022C 0004

L_6164:
        DIS                                     ; 6164   0003
        MVO     R0,     .ISRVEC.0               ; 6165   0240 0100
        SWAP    R0,     1                       ; 6167   0040
        MVO     R0,     .ISRVEC.1               ; 6168   0240 0101
        EIS                                     ; 616A   0002
L_616B:
        MVI     G_0329, R0                      ; 616B   0280 0329
        SDBD                                    ; 616D   0001
        XORI    #$1002, R0                      ; 616E   03F8 0002 0010
        MVO     R0,     G_0329                  ; 6171   0240 0329

        JSR     R5,     L_5ADB                  ; 6173   0004 0158 02DB

        CLRR    R0                              ; 6176   01C0
        MVO     R0,     G_0103                  ; 6177   0240 0103
        PULR    R7                              ; 6179   02B7
        PSHR    R5                              ; 617A   0275
        MVI     G_0103, R0                      ; 617B   0280 0103
        TSTR    R0                              ; 617D   0080
        BEQ     L_6183                          ; 617E   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 6180   0240 0020
        PULR    R7                              ; 6182   02B7
L_6183:
        INCR    R0                              ; 6183   0008
        MVO     R0,     G_0103                  ; 6184   0240 0103
        MVII    #$0002, R0                      ; 6186   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 6188   0240 0032
        MVI     .STIC.X.0,R0                    ; 618A   0280 0000
        MVO     R0,     .STIC.X.1               ; 618C   0240 0001
        MVI     G_0329, R0                      ; 618E   0280 0329
        SDBD                                    ; 6190   0001
        ANDI    #$EFF8, R0                      ; 6191   03B8 00F8 00EF
        SDBD                                    ; 6194   0001
        XORI    #$1002, R0                      ; 6195   03F8 0002 0010
        MVO     R0,     G_0329                  ; 6198   0240 0329
        CLRR    R0                              ; 619A   01C0
        MVII    #$0006, R1                      ; 619B   02B9 0006
        MVII    #$0002, R4                      ; 619D   02BC 0002
L_619F:
        MVO@    R0,     R4                      ; 619F   0260
        DECR    R1                              ; 61A0   0011
        BNEQ    L_619F                          ; 61A1   022C 0003

        SDBD                                    ; 61A3   0001
        MVII    #$6092, R4                      ; 61A4   02BC 0092 0060
        MVII    #$003B, R0                      ; 61A7   02B8 003B
        CMP     .PSG0.rgt_hand,R0               ; 61A9   0340 01FE
        BNEQ    L_61B1                          ; 61AB   020C 0004

        SDBD                                    ; 61AD   0001
        MVII    #$609A, R4                      ; 61AE   02BC 009A 0060
L_61B1:
        SDBD                                    ; 61B1   0001
        MVII    #$3998, R5                      ; 61B2   02BD 0098 0039
        MVII    #$0008, R1                      ; 61B5   02B9 0008
L_61B7:
        MVI@    R4,     R0                      ; 61B7   02A0
        MVO@    R0,     R5                      ; 61B8   0268
        DECR    R1                              ; 61B9   0011
        BNEQ    L_61B7                          ; 61BA   022C 0004

        MVO     R1,     G_01A4                  ; 61BC   0241 01A4
        MVII    #$0014, R1                      ; 61BE   02B9 0014
        MVII    #$0200, R4                      ; 61C0   02BC 0200
L_61C2:
        MVO@    R0,     R4                      ; 61C2   0260
        DECR    R1                              ; 61C3   0011
        BNEQ    L_61C2                          ; 61C4   022C 0003

        MVO     R0,     .STIC.VIDEN             ; 61C6   0240 0020
        SDBD                                    ; 61C8   0001
        MVII    #$59CE, R0                      ; 61C9   02B8 00CE 0059
        B       L_6164                          ; 61CC   0220 0069

        PSHR    R5                              ; 61CE   0275
        MVO     R0,     .STIC.VIDEN             ; 61CF   0240 0020
        MVI     G_0103, R0                      ; 61D1   0280 0103
        TSTR    R0                              ; 61D3   0080
        BEQ     L_61D7                          ; 61D4   0204 0001

        PULR    R7                              ; 61D6   02B7
L_61D7:
        INCR    R0                              ; 61D7   0008
        MVO     R0,     G_0103                  ; 61D8   0240 0103
        MVI     G_01A5, R1                      ; 61DA   0281 01A5
        MVO     R1,     .STIC.VDLY              ; 61DC   0241 0031
        MVI     G_0329, R0                      ; 61DE   0280 0329
        MVO     R0,     .STIC.A.1               ; 61E0   0240 0011
        MVI     G_0321, R0                      ; 61E2   0280 0321
        MVO     R0,     .STIC.Y.0               ; 61E4   0240 0008
        ADDI    #$0008, R0                      ; 61E6   02F8 0008
        MVO     R0,     .STIC.Y.1               ; 61E8   0240 0009
        CMP     G_018A, R1                      ; 61EA   0341 018A
        BNEQ    L_61FC                          ; 61EC   020C 000E

        MVI     G_01A9, R0                      ; 61EE   0280 01A9
        TSTR    R0                              ; 61F0   0080
        BNEQ    L_61FF                          ; 61F1   020C 000C

        JSR     R5,     L_5A4C                  ; 61F3   0004 0158 024C

        CLRR    R0                              ; 61F6   01C0
        COMR    R0                              ; 61F7   0018
        MVO     R0,     G_01A9                  ; 61F8   0240 01A9
        B       L_61FF                          ; 61FA   0200 0003

L_61FC:
        CLRR    R0                              ; 61FC   01C0
        MVO     R0,     G_01A9                  ; 61FD   0240 01A9
L_61FF:
        MVI     G_01A7, R0                      ; 61FF   0280 01A7
        ADD     G_01A5, R0                      ; 6201   02C0 01A5
        BEQ     L_6239                          ; 6203   0204 0034

        MVI     G_01A5, R1                      ; 6205   0281 01A5
        SWAP    R1,     1                       ; 6207   0041
        XOR     G_01A4, R1                      ; 6208   03C1 01A4
        MVI     G_01A6, R0                      ; 620A   0280 01A6

        JSR     R5,     X_EXT_SIGN_LO           ; 620C   0004 0114 0268

        ADDR    R0,     R1                      ; 620F   00C1
        MVO     R1,     G_01A4                  ; 6210   0241 01A4
        SWAP    R1,     1                       ; 6212   0041
        ANDI    #$0007, R1                      ; 6213   03B9 0007
        MVO     R1,     G_01A5                  ; 6215   0241 01A5
        MVI     G_0358, R0                      ; 6217   0280 0358
        TSTR    R0                              ; 6219   0080
        BEQ     L_6221                          ; 621A   0204 0005

        JSR     R5,     L_5AC9                  ; 621C   0004 0158 02C9

        B       L_616B                          ; 621F   0220 00B5

L_6221:
        SUB     G_018A, R1                      ; 6221   0301 018A
        BNEQ    L_616B                          ; 6223   022C 00B9

        ADD     G_01A9, R1                      ; 6225   02C1 01A9
        BNEQ    L_616B                          ; 6227   022C 00BD

        MVI     G_018A, R0                      ; 6229   0280 018A
        MVII    #$0008, R1                      ; 622B   02B9 0008
        TSTR    R0                              ; 622D   0080
        BEQ     L_6231                          ; 622E   0204 0001

        NEGR    R1                              ; 6230   0021
L_6231:
        ADD     G_0321, R1                      ; 6231   02C1 0321
        MVO     R1,     G_0320                  ; 6233   0241 0320
        MVO     R1,     G_0321                  ; 6235   0241 0321
        B       L_616B                          ; 6237   0220 00CD

L_6239:
        MVI     G_01AA, R0                      ; 6239   0280 01AA
        COMR    R0                              ; 623B   0018
        MVO     R0,     G_01AA                  ; 623C   0240 01AA
        ANDI    #$00FF, R0                      ; 623E   03B8 00FF
        SDBD                                    ; 6240   0001
        MVII    #$5AEA, R0                      ; 6241   02B8 00EA 005A
        BEQ     L_6164                          ; 6244   0224 00E1

        SDBD                                    ; 6246   0001
        MVII    #$5BAE, R0                      ; 6247   02B8 00AE 005B
        B       L_6164                          ; 624A   0220 00E7

        PSHR    R5                              ; 624C   0275
        MVI     G_018A, R1                      ; 624D   0281 018A
        MVII    #$000B, R2                      ; 624F   02BA 000B
        MVII    #$0200, R5                      ; 6251   02BD 0200
        MVII    #$0214, R4                      ; 6253   02BC 0214
        TSTR    R1                              ; 6255   0089
        BNEQ    L_625C                          ; 6256   020C 0004

        MVII    #$02DC, R5                      ; 6258   02BD 02DC
        MVII    #$02C8, R4                      ; 625A   02BC 02C8
L_625C:
        MVI@    R4,     R0                      ; 625C   02A0
        MVO@    R0,     R5                      ; 625D   0268
        MVI@    R4,     R0                      ; 625E   02A0
        MVO@    R0,     R5                      ; 625F   0268
        MVI@    R4,     R0                      ; 6260   02A0
L_6261:
        MVO@    R0,     R5                      ; 6261   0268
        MVI@    R4,     R0                      ; 6262   02A0
        MVO@    R0,     R5                      ; 6263   0268
        MVI@    R4,     R0                      ; 6264   02A0
        MVO@    R0,     R5                      ; 6265   0268
        MVI@    R4,     R0                      ; 6266   02A0
        MVO@    R0,     R5                      ; 6267   0268
        MVI@    R4,     R0                      ; 6268   02A0
        MVO@    R0,     R5                      ; 6269   0268
        MVI@    R4,     R0                      ; 626A   02A0
        MVO@    R0,     R5                      ; 626B   0268
        MVI@    R4,     R0                      ; 626C   02A0
        MVO@    R0,     R5                      ; 626D   0268
        MVI@    R4,     R0                      ; 626E   02A0
        MVO@    R0,     R5                      ; 626F   0268
        MVI@    R4,     R0                      ; 6270   02A0
        MVO@    R0,     R5                      ; 6271   0268
        MVI@    R4,     R0                      ; 6272   02A0
        MVO@    R0,     R5                      ; 6273   0268
        MVI@    R4,     R0                      ; 6274   02A0
        MVO@    R0,     R5                      ; 6275   0268
        MVI@    R4,     R0                      ; 6276   02A0
        MVO@    R0,     R5                      ; 6277   0268
        MVI@    R4,     R0                      ; 6278   02A0
        MVO@    R0,     R5                      ; 6279   0268
        MVI@    R4,     R0                      ; 627A   02A0
        MVO@    R0,     R5                      ; 627B   0268
        MVI@    R4,     R0                      ; 627C   02A0
        MVO@    R0,     R5                      ; 627D   0268
        MVI@    R4,     R0                      ; 627E   02A0
        MVO@    R0,     R5                      ; 627F   0268
        MVI@    R4,     R0                      ; 6280   02A0
        MVO@    R0,     R5                      ; 6281   0268
        MVI@    R4,     R0                      ; 6282   02A0
        MVO@    R0,     R5                      ; 6283   0268
        TSTR    R1                              ; 6284   0089
        BNEQ    L_628B                          ; 6285   020C 0004

        SUBI    #$0028, R4                      ; 6287   033C 0028
        SUBI    #$0028, R5                      ; 6289   033D 0028
L_628B:
        DECR    R2                              ; 628B   0012
        BNEQ    L_625C                          ; 628C   022C 0031

        MVI     G_01A7, R0                      ; 628E   0280 01A7
        DECR    R0                              ; 6290   0010
        MVO     R0,     G_01A7                  ; 6291   0240 01A7
        MVI     G_01AA, R0                      ; 6293   0280 01AA
        TSTR    R0                              ; 6295   0080
        BNEQ    L_62B2                          ; 6296   020C 001A

        MVI     G_0355, R4                      ; 6298   0284 0355
        MVII    #$0200, R5                      ; 629A   02BD 0200
        TSTR    R1                              ; 629C   0089
        BEQ     L_62A1                          ; 629D   0204 0002

        MVII    #$02DC, R5                      ; 629F   02BD 02DC
L_62A1:
        MVII    #$0014, R2                      ; 62A1   02BA 0014
L_62A3:
        SDBD                                    ; 62A3   0001
        MVI@    R4,     R0                      ; 62A4   02A0
        MVO@    R0,     R5                      ; 62A5   0268
        DECR    R2                              ; 62A6   0012
        BNEQ    L_62A3                          ; 62A7   022C 0005

        TSTR    R1                              ; 62A9   0089
        BNEQ    L_62AE                          ; 62AA   020C 0002

        SUBI    #$0050, R4                      ; 62AC   033C 0050
L_62AE:
        MVO     R4,     G_0355                  ; 62AE   0244 0355
        B       L_62C0                          ; 62B0   0200 000E

L_62B2:
        CLRR    R0                              ; 62B2   01C0
        MVII    #$0014, R2                      ; 62B3   02BA 0014
        MVII    #$0200, R4                      ; 62B5   02BC 0200
        TSTR    R1                              ; 62B7   0089
        BEQ     L_62BC                          ; 62B8   0204 0002

        MVII    #$02DC, R4                      ; 62BA   02BC 02DC
L_62BC:
        MVO@    R0,     R4                      ; 62BC   0260
        DECR    R2                              ; 62BD   0012
        BNEQ    L_62BC                          ; 62BE   022C 0003

L_62C0:
        MVI     G_0358, R0                      ; 62C0   0280 0358
        DECR    R0                              ; 62C2   0010
        BMI     L_62C7                          ; 62C3   020B 0002

        MVO     R0,     G_0358                  ; 62C5   0240 0358
L_62C7:
        PULR    R7                              ; 62C7   02B7
        PULR    R7                              ; 62C8   02B7
        MVI     G_01A5, R1                      ; 62C9   0281 01A5
        ANDI    #$007F, R1                      ; 62CB   03B9 007F
        MVI     G_0320, R2                      ; 62CD   0282 0320
        MOVR    R2,     R3                      ; 62CF   0093
        SDBD                                    ; 62D0   0001
        ANDI    #$FF80, R2                      ; 62D1   03BA 0080 00FF
        ANDI    #$007F, R3                      ; 62D4   03BB 007F
        SUBR    R1,     R3                      ; 62D6   010B
        XORR    R2,     R3                      ; 62D7   01D3
        MVO     R3,     G_0321                  ; 62D8   0243 0321
        MOVR    R5,     R7                      ; 62DA   00AF
        MVII    #$0145, R3                      ; 62DB   02BB 0145
        MVII    #$0003, R1                      ; 62DD   02B9 0003
L_62DF:
        MVI@    R3,     R0                      ; 62DF   0298
        TSTR    R0                              ; 62E0   0080
        BEQ     L_62E5                          ; 62E1   0204 0002

        DECR    R0                              ; 62E3   0010
        MVO@    R0,     R3                      ; 62E4   0258
L_62E5:
        INCR    R3                              ; 62E5   000B
        DECR    R1                              ; 62E6   0011
        BNEQ    L_62DF                          ; 62E7   022C 0009

        MOVR    R5,     R7                      ; 62E9   00AF
        PSHR    R5                              ; 62EA   0275
        MVO     R0,     .STIC.VIDEN             ; 62EB   0240 0020
        MVI     G_0103, R0                      ; 62ED   0280 0103
        TSTR    R0                              ; 62EF   0080
        BEQ     L_62F3                          ; 62F0   0204 0001

        PULR    R7                              ; 62F2   02B7
L_62F3:
        INCR    R0                              ; 62F3   0008
        MVO     R0,     G_0103                  ; 62F4   0240 0103
        MVI     G_0329, R0                      ; 62F6   0280 0329
        MVO     R0,     .STIC.A.1               ; 62F8   0240 0011
        MVI     G_0356, R5                      ; 62FA   0285 0356
        MVI     G_0355, R4                      ; 62FC   0284 0355
        MVI     G_0357, R1                      ; 62FE   0281 0357
        MVII    #$0008, R2                      ; 6300   02BA 0008
L_6302:
        TSTR    R1                              ; 6302   0089
        BEQ     L_6321                          ; 6303   0204 001C

        MVI@    R4,     R0                      ; 6305   02A0
        MVO@    R0,     R5                      ; 6306   0268
        MVI@    R4,     R0                      ; 6307   02A0
        MVO@    R0,     R5                      ; 6308   0268
        MVI@    R4,     R0                      ; 6309   02A0
        MVO@    R0,     R5                      ; 630A   0268
        MVI@    R4,     R0                      ; 630B   02A0
        MVO@    R0,     R5                      ; 630C   0268
        MVI@    R4,     R0                      ; 630D   02A0
        MVO@    R0,     R5                      ; 630E   0268
        MVI@    R4,     R0                      ; 630F   02A0
        MVO@    R0,     R5                      ; 6310   0268
        MVI@    R4,     R0                      ; 6311   02A0
        MVO@    R0,     R5                      ; 6312   0268
        MVI@    R4,     R0                      ; 6313   02A0
        MVO@    R0,     R5                      ; 6314   0268
        DECR    R1                              ; 6315   0011
        DECR    R2                              ; 6316   0012
        BNEQ    L_6302                          ; 6317   022C 0016

        MVO     R4,     G_0355                  ; 6319   0244 0355
        MVO     R5,     G_0356                  ; 631B   0245 0356
        MVO     R1,     G_0357                  ; 631D   0241 0357
        B       L_616B                          ; 631F   0220 01B5

L_6321:
        MVO     R4,     G_0355                  ; 6321   0244 0355
        SDBD                                    ; 6323   0001
        MVII    #$5B29, R0                      ; 6324   02B8 0029 005B
        B       L_6164                          ; 6327   0220 01C4

        PSHR    R5                              ; 6329   0275
        MVO     R0,     .STIC.VIDEN             ; 632A   0240 0020
        MVI     G_0103, R0                      ; 632C   0280 0103
        TSTR    R0                              ; 632E   0080
        BEQ     L_6332                          ; 632F   0204 0001

        PULR    R7                              ; 6331   02B7
L_6332:
        INCR    R0                              ; 6332   0008
        MVO     R0,     G_0103                  ; 6333   0240 0103
        SDBD                                    ; 6335   0001
        MVII    #$3800, R5                      ; 6336   02BD 0000 0038
        MVI     G_0359, R4                      ; 6339   0284 0359
        MVII    #$0003, R1                      ; 633B   02B9 0003
L_633D:
        TSTR    R1                              ; 633D   0089
        BEQ     L_635C                          ; 633E   0204 001C

        SDBD                                    ; 6340   0001
L_6341:
        MVI@    R4,     R3                      ; 6341   02A3
        MVI@    R4,     R0                      ; 6342   02A0
        TSTR    R0                              ; 6343   0080
        BEQ     L_635C                          ; 6344   0204 0016

        MOVR    R4,     R2                      ; 6346   00A2
        MOVR    R3,     R4                      ; 6347   009C
        MVI@    R4,     R0                      ; 6348   02A0
        MVO@    R0,     R5                      ; 6349   0268
        MVI@    R4,     R0                      ; 634A   02A0
        MVO@    R0,     R5                      ; 634B   0268
        MVI@    R4,     R0                      ; 634C   02A0
        MVO@    R0,     R5                      ; 634D   0268
        MVI@    R4,     R0                      ; 634E   02A0
        MVO@    R0,     R5                      ; 634F   0268
        MVI@    R4,     R0                      ; 6350   02A0
        MVO@    R0,     R5                      ; 6351   0268
        MVI@    R4,     R0                      ; 6352   02A0
        MVO@    R0,     R5                      ; 6353   0268
        MVI@    R4,     R0                      ; 6354   02A0
        MVO@    R0,     R5                      ; 6355   0268
        MVI@    R4,     R0                      ; 6356   02A0
        MVO@    R0,     R5                      ; 6357   0268
        MOVR    R2,     R4                      ; 6358   0094
        DECR    R1                              ; 6359   0011
        B       L_633D                          ; 635A   0220 001E

L_635C:
        SDBD                                    ; 635C   0001
        MVII    #$6209, R3                      ; 635D   02BB 0009 0062
        SDBD                                    ; 6360   0001
        MVII    #$4CF2, R4                      ; 6361   02BC 00F2 004C
        MVI     G_018A, R0                      ; 6364   0280 018A
        TSTR    R0                              ; 6366   0080
        BNEQ    L_6371                          ; 6367   020C 0008

        SDBD                                    ; 6369   0001
        ADDI    #$0009, R4                      ; 636A   02FC 0009 0000
        SDBD                                    ; 636D   0001
        MVII    #$64DC, R3                      ; 636E   02BB 00DC 0064
L_6371:
        MVII    #$0003, R0                      ; 6371   02B8 0003
        MVII    #$0348, R1                      ; 6373   02B9 0348

        JSR     R5,     .EXEC.730               ; 6375   0004 0114 0330

        MVII    #$0003, R1                      ; 6378   02B9 0003
        MVII    #$015D, R4                      ; 637A   02BC 015D
L_637C:
        MVO@    R3,     R4                      ; 637C   0263
        SWAP    R3,     1                       ; 637D   0043
        MVO@    R3,     R4                      ; 637E   0263
        SWAP    R3,     1                       ; 637F   0043
        SDBD                                    ; 6380   0001
        ADDI    #$0003, R3                      ; 6381   02FB 0003 0000
        DECR    R1                              ; 6384   0011
        BNEQ    L_637C                          ; 6385   022C 000A

        CLRR    R0                              ; 6387   01C0
        MVII    #$0009, R2                      ; 6388   02BA 0009
        MVI     G_018A, R1                      ; 638A   0281 018A
        CMPI    #$0001, R1                      ; 638C   0379 0001
        BEQ     L_6399                          ; 638E   0204 0009

        MVII    #$0008, R0                      ; 6390   02B8 0008
        TSTR    R1                              ; 6392   0089
        BNEQ    L_6399                          ; 6393   020C 0004

        MVII    #$0007, R0                      ; 6395   02B8 0007
        MVII    #$0004, R2                      ; 6397   02BA 0004
L_6399:
        MVO     R0,     G_01A7                  ; 6399   0240 01A7
        MVO     R2,     G_0358                  ; 639B   0242 0358
        MVI     G_018A, R0                      ; 639D   0280 018A
        TSTR    R0                              ; 639F   0080
        BNEQ    L_63A8                          ; 63A0   020C 0006

        SDBD                                    ; 63A2   0001
        MVII    #$67AF, R4                      ; 63A3   02BC 00AF 0067
        MVO     R4,     G_0355                  ; 63A6   0244 0355
L_63A8:
        SDBD                                    ; 63A8   0001
        MVII    #$59CE, R0                      ; 63A9   02B8 00CE 0059
        B       L_6164                          ; 63AC   0220 0249

        PSHR    R5                              ; 63AE   0275
        MVI     G_0103, R0                      ; 63AF   0280 0103
        TSTR    R0                              ; 63B1   0080
        BEQ     L_63B7                          ; 63B2   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 63B4   0240 0020
        PULR    R7                              ; 63B6   02B7
L_63B7:
        INCR    R0                              ; 63B7   0008
        MVO     R0,     G_0103                  ; 63B8   0240 0103
        CLRR    R0                              ; 63BA   01C0
        MVO     R0,     .STIC.EDGE              ; 63BB   0240 0032
        MVO     R0,     G_0319                  ; 63BD   0240 0319
        INCR    R0                              ; 63BF   0008
        MVO     R0,     G_0186                  ; 63C0   0240 0186
        MVI     G_0320, R0                      ; 63C2   0280 0320
        SDBD                                    ; 63C4   0001
        ANDI    #$FFF8, R0                      ; 63C5   03B8 00F8 00FF
        MVO     R0,     G_0320                  ; 63C8   0240 0320
        SDBD                                    ; 63CA   0001
        MVII    #$5277, R0                      ; 63CB   02B8 0077 0052
        CLRR    R1                              ; 63CE   01C9
        MVO     R1,     G_01A8                  ; 63CF   0241 01A8
        MVO     R1,     .STIC.VIDEN             ; 63D1   0241 0020
        SDBD                                    ; 63D3   0001
        MVII    #$5277, R0                      ; 63D4   02B8 0077 0052
        B       L_6164                          ; 63D7   0220 0274

        PSHR    R5                              ; 63D9   0275

        JSR     R5,     L_5E81                  ; 63DA   0004 015C 0281

        ANDI    #$0036, R0                      ; 63DD   03B8 0036
        MVO     R0,     .PSG0.chan_enable       ; 63DF   0240 01F8
        CLRR    R0                              ; 63E1   01C0
        MVO     R0,     .PSG0.chn_a_lo          ; 63E2   0240 01F0
        MVO     R0,     .PSG0.envelope          ; 63E4   0240 01FA
        INCR    R0                              ; 63E6   0008
        MVO     R0,     .PSG0.chn_a_hi          ; 63E7   0240 01F4
        INCR    R0                              ; 63E9   0008
        MVO     R0,     .PSG0.noise             ; 63EA   0240 01F9
        INCR    R0                              ; 63EC   0008
        MVO     R0,     G_0145                  ; 63ED   0240 0145
        MVII    #$0030, R0                      ; 63EF   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 63F1   0240 01FB
        MVII    #$0010, R0                      ; 63F3   02B8 0010
        MVO     R0,     .PSG0.envlp_hi          ; 63F5   0240 01F7
        INCR    R7                              ; 63F7   000F
        PSHR    R5                              ; 63F8   0275
        MOVR    R7,     R3                      ; 63F9   00BB
        MVI     G_0145, R0                      ; 63FA   0280 0145
        TSTR    R0                              ; 63FC   0080
        BNEQ    L_640C                          ; 63FD   020C 000D

        MVI     .PSG0.chn_a_hi,R2               ; 63FF   0282 01F4
        CMPI    #$0005, R2                      ; 6401   037A 0005
        BGE     L_667D                          ; 6403   020D 0278

        INCR    R2                              ; 6405   000A
        MVO     R2,     .PSG0.chn_a_hi          ; 6406   0242 01F4
        MVII    #$0003, R2                      ; 6408   02BA 0003
        MVO     R2,     G_0145                  ; 640A   0242 0145
L_640C:
        SWAP    R0,     1                       ; 640C   0040
        SLR     R0,     2                       ; 640D   0064
        MVII    #$00FF, R1                      ; 640E   02B9 00FF
        SUBR    R0,     R1                      ; 6410   0101
        MVO     R1,     .PSG0.chn_a_lo          ; 6411   0241 01F0
        SUBI    #$0002, R3                      ; 6413   033B 0002
        MVO@    R3,     R4                      ; 6415   0263
        SWAP    R3,     1                       ; 6416   0043
        MVO@    R3,     R4                      ; 6417   0263
        PULR    R7                              ; 6418   02B7
        PSHR    R5                              ; 6419   0275

        JSR     R5,     L_5E8B                  ; 641A   0004 015C 028B

        ANDI    #$003D, R0                      ; 641D   03B8 003D
        MVO     R0,     .PSG0.chan_enable       ; 641F   0240 01F8
        MVII    #$000F, R0                      ; 6421   02B8 000F
L_6423:
        MVO     R0,     .PSG0.chn_b_lo          ; 6423   0240 01F1
        CLRR    R0                              ; 6425   01C0
        MVO     R0,     .PSG0.chn_b_hi          ; 6426   0240 01F5
        MVII    #$000D, R0                      ; 6428   02B8 000D
        MVO     R0,     .PSG0.chn_b_vol         ; 642A   0240 01FC
        MVII    #$0014, R0                      ; 642C   02B8 0014
        MVO     R0,     G_0146                  ; 642E   0240 0146
        INCR    R7                              ; 6430   000F
        PSHR    R5                              ; 6431   0275
        MOVR    R7,     R3                      ; 6432   00BB
        MVI     G_0146, R0                      ; 6433   0280 0146
        TSTR    R0                              ; 6435   0080
        BEQ     L_6445                          ; 6436   0204 000D

        MVII    #$0008, R0                      ; 6438   02B8 0008

        JSR     R5,     X_RAND1                 ; 643A   0004 0114 027D

        MVO     R0,     .PSG0.chn_b_lo          ; 643D   0240 01F1
        SUBI    #$0002, R3                      ; 643F   033B 0002
        MVO@    R3,     R4                      ; 6441   0263
        SWAP    R3,     1                       ; 6442   0043
        MVO@    R3,     R4                      ; 6443   0263
        PULR    R7                              ; 6444   02B7

L_6445:
        JSR     R5,     L_5E8B                  ; 6445   0004 015C 028B

        MVO     R0,     .PSG0.chan_enable       ; 6448   0240 01F8
        B       L_667D                          ; 644A   0200 0231

        MVII    #$0070, R0                      ; 644C   02B8 0070
        MVO     R0,     .PSG0.envlp_hi          ; 644E   0240 01F7
        B       L_645C                          ; 6450   0200 000A

        MVII    #$0040, R0                      ; 6452   02B8 0040
        MVO     R0,     .PSG0.envlp_hi          ; 6454   0240 01F7
        B       L_645C                          ; 6456   0200 0004

        MVII    #$0010, R0                      ; 6458   02B8 0010
        MVO     R0,     .PSG0.envlp_hi          ; 645A   0240 01F7
L_645C:
        PSHR    R5                              ; 645C   0275

        JSR     R5,     L_5E81                  ; 645D   0004 015C 0281

        ANDI    #$0037, R0                      ; 6460   03B8 0037
        MVO     R0,     .PSG0.chan_enable       ; 6462   0240 01F8
        CLRR    R0                              ; 6464   01C0
        MVO     R0,     .PSG0.noise             ; 6465   0240 01F9
        MVO     R0,     .PSG0.envelope          ; 6467   0240 01FA
        MVII    #$0030, R0                      ; 6469   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 646B   0240 01FB
        B       L_667D                          ; 646D   0200 020E

        PSHR    R5                              ; 646F   0275

        JSR     R5,     L_5E95                  ; 6470   0004 015C 0295

        ANDI    #$003B, R0                      ; 6473   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 6475   0240 01F8

        JSR     R5,     L_5CAF                  ; 6477   0004 015C 00AF
        JSR     R5,     L_5CC7                  ; 647A   0004 015C 00C7

        BNEQ    L_64A7                          ; 647D   020C 0028

        MVII    #$000F, R0                      ; 647F   02B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 6481   0240 01FD
        CLRR    R0                              ; 6483   01C0
        MVO     R0,     G_01AF                  ; 6484   0240 01AF

        JSR     R5,     L_5CC7                  ; 6486   0004 015C 00C7

        BNEQ    L_6499                          ; 6489   020C 000E

        MVI     G_01AF, R2                      ; 648B   0282 01AF

        JSR     R5,     L_5CCC                  ; 648D   0004 015C 00CC

        CMPI    #$000B, R2                      ; 6490   037A 000B
        BGT     L_64A1                          ; 6492   020E 000D

        MVO     R2,     G_01AF                  ; 6494   0242 01AF

        JSR     R5,     L_5CC1                  ; 6496   0004 015C 00C1

L_6499:
        SDBD                                    ; 6499   0001
        MVII    #$5C86, R0                      ; 649A   02B8 0086 005C
        MVO@    R0,     R4                      ; 649D   0260
        SWAP    R0,     1                       ; 649E   0040
        MVO@    R0,     R4                      ; 649F   0260
        PULR    R7                              ; 64A0   02B7
L_64A1:
        CLRR    R0                              ; 64A1   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 64A2   0240 01FD

        JSR     R5,     L_5CBB                  ; 64A4   0004 015C 00BB

L_64A7:
        SDBD                                    ; 64A7   0001
        MVII    #$5C7A, R0                      ; 64A8   02B8 007A 005C
        MVO@    R0,     R4                      ; 64AB   0260
        SWAP    R0,     1                       ; 64AC   0040
        MVO@    R0,     R4                      ; 64AD   0260
        PULR    R7                              ; 64AE   02B7
        PSHR    R5                              ; 64AF   0275
        MVII    #$0005, R0                      ; 64B0   02B8 0005
        MVO     R0,     .PSG0.chn_c_hi          ; 64B2   0240 01F6
        CLRR    R0                              ; 64B4   01C0
        MVO     R0,     .PSG0.chn_c_lo          ; 64B5   0240 01F2

        JSR     R5,     L_5CBB                  ; 64B7   0004 015C 00BB

        PULR    R7                              ; 64BA   02B7
        PSHR    R5                              ; 64BB   0275
        MVII    #$001E, R0                      ; 64BC   02B8 001E
        MVO     R0,     G_0147                  ; 64BE   0240 0147
        PULR    R7                              ; 64C0   02B7
        PSHR    R5                              ; 64C1   0275
        MVII    #$0001, R0                      ; 64C2   02B8 0001
        MVO     R0,     G_0147                  ; 64C4   0240 0147
        PULR    R7                              ; 64C6   02B7
        PSHR    R5                              ; 64C7   0275
        MVI     G_0147, R0                      ; 64C8   0280 0147
        TSTR    R0                              ; 64CA   0080
        PULR    R7                              ; 64CB   02B7
        PSHR    R5                              ; 64CC   0275
        SDBD                                    ; 64CD   0001
        MVII    #$5CE1, R3                      ; 64CE   02BB 00E1 005C
        ADDR    R2,     R3                      ; 64D1   00D3
        MVI@    R3,     R1                      ; 64D2   0299
        MVI     .PSG0.chn_c_lo,R0               ; 64D3   0280 01F2
        ANDI    #$00F0, R0                      ; 64D5   03B8 00F0
        ADDR    R1,     R0                      ; 64D7   00C8
        MVO     R0,     .PSG0.chn_c_lo          ; 64D8   0240 01F2
        INCR    R2                              ; 64DA   000A
        MVI     .PSG0.chn_c_vol,R0              ; 64DB   0280 01FD
        DECR    R0                              ; 64DD   0010
        MVO     R0,     .PSG0.chn_c_vol         ; 64DE   0240 01FD
        PULR    R7                              ; 64E0   02B7
        DECLE   $0000                           ; 64E1   0000

        INCR    R4                              ; 64E2   000C
        DECLE   $0000                           ; 64E3   0000

        INCR    R2                              ; 64E4   000A
        DECLE   $0000                           ; 64E5   0000

        INCR    R0                              ; 64E6   0008
        DECLE   $0000                           ; 64E7   0000

        CLRC                                    ; 64E8   0006
        DECLE   $0000                           ; 64E9   0000

        JSR     R4,     .STIC.X.2               ; 64EA   0004 0000 0002

        PSHR    R5                              ; 64ED   0275
        MVI     .PSG0.chn_c_hi,R0               ; 64EE   0280 01F6
        MVI     .PSG0.chn_c_lo,R1               ; 64F0   0281 01F2
        ANDI    #$000F, R0                      ; 64F2   03B8 000F
        ANDI    #$00FF, R1                      ; 64F4   03B9 00FF
        SWAP    R0,     1                       ; 64F6   0040
        ADDR    R0,     R1                      ; 64F7   00C1
        SUBI    #$0010, R1                      ; 64F8   0339 0010
        MVO     R1,     .PSG0.chn_c_lo          ; 64FA   0241 01F2
        SWAP    R1,     1                       ; 64FC   0041
        MVO     R1,     .PSG0.chn_c_hi          ; 64FD   0241 01F6
        PULR    R7                              ; 64FF   02B7
        PSHR    R5                              ; 6500   0275
        MVI     .PSG0.chn_c_hi,R0               ; 6501   0280 01F6
        MVI     .PSG0.chn_c_lo,R1               ; 6503   0281 01F2
        ANDI    #$000F, R0                      ; 6505   03B8 000F
        ANDI    #$00FF, R1                      ; 6507   03B9 00FF
        SWAP    R0,     1                       ; 6509   0040
        ADDR    R0,     R1                      ; 650A   00C1
        ADDI    #$0010, R1                      ; 650B   02F9 0010
        MVO     R1,     .PSG0.chn_c_lo          ; 650D   0241 01F2
        SWAP    R1,     1                       ; 650F   0041
L_6510:
        MVO     R1,     .PSG0.chn_c_hi          ; 6510   0241 01F6
        PULR    R7                              ; 6512   02B7
        SDBD                                    ; 6513   0001
        MVII    #$5DF8, R0                      ; 6514   02B8 00F8 005D
        SDBD                                    ; 6517   0001
        MVII    #$5E11, R1                      ; 6518   02B9 0011 005E
        B       L_6525                          ; 651B   0200 0008

        SDBD                                    ; 651D   0001
        MVII    #$5E2B, R0                      ; 651E   02B8 002B 005E
        SDBD                                    ; 6521   0001
        MVII    #$5E50, R1                      ; 6522   02B9 0050 005E
L_6525:
        SDBD                                    ; 6525   0001
        MVII    #$FFFF, R2                      ; 6526   02BA 00FF 00FF
        PSHR    R5                              ; 6529   0275
        MVII    #$01AB, R5                      ; 652A   02BD 01AB
        MVO@    R0,     R5                      ; 652C   0268
        SWAP    R0,     1                       ; 652D   0040
        MVO@    R0,     R5                      ; 652E   0268
        MVO@    R1,     R5                      ; 652F   0269
        SWAP    R1,     1                       ; 6530   0041
        MVO@    R1,     R5                      ; 6531   0269
        MVO@    R2,     R5                      ; 6532   026A
        SWAP    R2,     1                       ; 6533   0042
        MVO@    R2,     R5                      ; 6534   026A

        JSR     R5,     .EXEC.A83               ; 6535   0004 0118 0283

        MVII    #$0106, R4                      ; 6538   02BC 0106
        MVII    #$0038, R0                      ; 653A   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 653C   0240 01F8
        CLRR    R0                              ; 653E   01C0
        MVII    #$0145, R5                      ; 653F   02BD 0145
        MVO@    R0,     R5                      ; 6541   0268
        MVO@    R0,     R5                      ; 6542   0268
        MVO@    R0,     R5                      ; 6543   0268
        INCR    R7                              ; 6544   000F
        PSHR    R5                              ; 6545   0275
        CLRR    R3                              ; 6546   01DB

L_6547:
        JSR     R5,     L_5D6A                  ; 6547   0004 015C 016A

        INCR    R3                              ; 654A   000B
        CMPI    #$0003, R3                      ; 654B   037B 0003
        BNEQ    L_6547                          ; 654D   022C 0007

        MVII    #$01AB, R5                      ; 654F   02BD 01AB
        MVII    #$0003, R2                      ; 6551   02BA 0003
L_6553:
        SDBD                                    ; 6553   0001
        MVI@    R5,     R0                      ; 6554   02A8
        SDBD                                    ; 6555   0001
        CMPI    #$FFFF, R0                      ; 6556   0378 00FF 00FF
        BNEQ    L_6562                          ; 6559   020C 0007

        DECR    R2                              ; 655B   0012
        BNEQ    L_6553                          ; 655C   022C 000A

        JSR     R5,     L_5E69                  ; 655E   0004 015C 0269

        PULR    R7                              ; 6561   02B7
L_6562:
        SDBD                                    ; 6562   0001
        MVII    #$5D45, R0                      ; 6563   02B8 0045 005D
        MVO@    R0,     R4                      ; 6566   0260
        SWAP    R0,     1                       ; 6567   0040
        MVO@    R0,     R4                      ; 6568   0260
        PULR    R7                              ; 6569   02B7
        PSHR    R5                              ; 656A   0275
        PSHR    R4                              ; 656B   0274
        MVII    #$0145, R4                      ; 656C   02BC 0145
        ADDR    R3,     R4                      ; 656E   00DC
        MVI@    R4,     R0                      ; 656F   02A0
        TSTR    R0                              ; 6570   0080
        BEQ     L_6575                          ; 6571   0204 0002

        PULR    R4                              ; 6573   02B4
        PULR    R7                              ; 6574   02B7
L_6575:
        MVII    #$01AB, R4                      ; 6575   02BC 01AB
        SLL     R3,     1                       ; 6577   004B
        ADDR    R3,     R4                      ; 6578   00DC
        SLR     R3,     1                       ; 6579   0063
        SDBD                                    ; 657A   0001
        MVI@    R4,     R1                      ; 657B   02A1
        SDBD                                    ; 657C   0001
        CMPI    #$FFFF, R1                      ; 657D   0379 00FF 00FF
        BEQ     L_65DD                          ; 6580   0204 005B

        MOVR    R1,     R4                      ; 6582   008C
        MVII    #$01FB, R5                      ; 6583   02BD 01FB
        ADDR    R3,     R5                      ; 6585   00DD
        MVI@    R4,     R0                      ; 6586   02A0
        MOVR    R0,     R1                      ; 6587   0081
        ANDI    #$0300, R1                      ; 6588   03B9 0300
        SWAP    R1,     1                       ; 658A   0041
        TSTR    R1                              ; 658B   0089
        BEQ     L_65B0                          ; 658C   0204 0022

        CMPI    #$0002, R1                      ; 658E   0379 0002
        BEQ     L_65B9                          ; 6590   0204 0027

        CMPI    #$0003, R1                      ; 6592   0379 0003
        BEQ     L_65CC                          ; 6594   0204 0036

        MOVR    R0,     R1                      ; 6596   0081
        ANDI    #$000F, R1                      ; 6597   03B9 000F
        ANDI    #$00F0, R0                      ; 6599   03B8 00F0
        SLR     R0,     2                       ; 659B   0064
        SLR     R0,     2                       ; 659C   0064
        MVO@    R0,     R5                      ; 659D   0268
        SUBI    #$0008, R5                      ; 659E   033D 0008
        MVO@    R1,     R5                      ; 65A0   0269
        SUBI    #$0005, R5                      ; 65A1   033D 0005
        MVI@    R4,     R0                      ; 65A3   02A0
        MVO@    R0,     R5                      ; 65A4   0268
        MVII    #$0145, R5                      ; 65A5   02BD 0145
        ADDR    R3,     R5                      ; 65A7   00DD
        MVI@    R4,     R0                      ; 65A8   02A0
        MVO@    R0,     R5                      ; 65A9   0268
        MOVR    R4,     R1                      ; 65AA   00A1

        JSR     R5,     L_5DEE                  ; 65AB   0004 015C 01EE

        PULR    R4                              ; 65AE   02B4
        PULR    R7                              ; 65AF   02B7
L_65B0:
        SDBD                                    ; 65B0   0001
        MVII    #$FFFF, R1                      ; 65B1   02B9 00FF 00FF

        JSR     R5,     L_5DEE                  ; 65B4   0004 015C 01EE

        B       L_65DD                          ; 65B7   0200 0024

L_65B9:
        MOVR    R5,     R2                      ; 65B9   00AA
        MVII    #$01B1, R5                      ; 65BA   02BD 01B1
        ADDR    R3,     R5                      ; 65BC   00DD
        MVI@    R2,     R0                      ; 65BD   0290
        MVO@    R0,     R5                      ; 65BE   0268
        MVII    #$0145, R5                      ; 65BF   02BD 0145
        ADDR    R3,     R5                      ; 65C1   00DD
        CLRR    R0                              ; 65C2   01C0
        MVO@    R0,     R2                      ; 65C3   0250
        INCR    R0                              ; 65C4   0008
        MVO@    R0,     R5                      ; 65C5   0268
        MOVR    R4,     R1                      ; 65C6   00A1

        JSR     R5,     L_5DEE                  ; 65C7   0004 015C 01EE

        PULR    R4                              ; 65CA   02B4
        PULR    R7                              ; 65CB   02B7
L_65CC:
        ANDI    #$00FF, R0                      ; 65CC   03B8 00FF
        MVII    #$0145, R2                      ; 65CE   02BA 0145
        ADDR    R3,     R2                      ; 65D0   00DA
        MVO@    R0,     R2                      ; 65D1   0250
        MVII    #$01B1, R2                      ; 65D2   02BA 01B1
        ADDR    R3,     R2                      ; 65D4   00DA
        MVI@    R2,     R0                      ; 65D5   0290
        MVO@    R0,     R5                      ; 65D6   0268
        MOVR    R4,     R1                      ; 65D7   00A1

        JSR     R5,     L_5DEE                  ; 65D8   0004 015C 01EE

        PULR    R4                              ; 65DB   02B4
        PULR    R7                              ; 65DC   02B7
L_65DD:
        PULR    R4                              ; 65DD   02B4
        SLL     R3,     2                       ; 65DE   004F
        MOVR    R3,     R2                      ; 65DF   009A
        SLR     R3,     2                       ; 65E0   0067
        ADDR    R2,     R7                      ; 65E1   00D7

        JSR     R5,     L_5E81                  ; 65E2   0004 015C 0281

        PULR    R7                              ; 65E5   02B7

        JSR     R5,     L_5E8B                  ; 65E6   0004 015C 028B

        PULR    R7                              ; 65E9   02B7

        JSR     R5,     L_5E95                  ; 65EA   0004 015C 0295

        PULR    R7                              ; 65ED   02B7
        PSHR    R5                              ; 65EE   0275
        MVII    #$01AB, R5                      ; 65EF   02BD 01AB
        SLL     R3,     1                       ; 65F1   004B
        ADDR    R3,     R5                      ; 65F2   00DD
        SLR     R3,     1                       ; 65F3   0063
        MVO@    R1,     R5                      ; 65F4   0269
        SWAP    R1,     1                       ; 65F5   0041
        MVO@    R1,     R5                      ; 65F6   0269
        PULR    R7                              ; 65F7   02B7
        XORR    R2,     R6                      ; 65F8   01D6
        MOVR    R5,     R6                      ; 65F9   00AE
        GSWD    R0                              ; 65FA   0030
        XORR    R2,     R7                      ; 65FB   01D7
        DECR    R4                              ; 65FC   0014
        GSWD    R0                              ; 65FD   0030
        XORR    R2,     R7                      ; 65FE   01D7
        ADDR    R6,     R2                      ; 65FF   00F2
        COMR    R0                              ; 6600   0018
        XORR    R2,     R7                      ; 6601   01D7
        DECR    R4                              ; 6602   0014
        COMR    R0                              ; 6603   0018
        XORR    R2,     R6                      ; 6604   01D6
        MOVR    R5,     R6                      ; 6605   00AE
        COMR    R0                              ; 6606   0018
        XORR    R2,     R5                      ; 6607   01D5
        MOVR    R3,     R6                      ; 6608   009E
        SLL     R0,     1                       ; 6609   0048
        XORR    R2,     R5                      ; 660A   01D5
        SLL     R1,     2                       ; 660B   004D
        COMR    R0                              ; 660C   0018
        XORR    R3,     R0                      ; 660D   01D8
        SAR     R3,     1                       ; 660E   006B
        SLL     R0,     1                       ; 660F   0048
        DECLE   $0000                           ; 6610   0000

        XORR    R2,     R3                      ; 6611   01D3
        RLC     R3,     2                       ; 6612   0057
        GSWD    R0                              ; 6613   0030
        XORR    R2,     R3                      ; 6614   01D3
        MOVR    R1,     R2                      ; 6615   008A
        GSWD    R0                              ; 6616   0030
        XORR    R2,     R3                      ; 6617   01D3
        ADDR    R7,     R1                      ; 6618   00F9
        COMR    R0                              ; 6619   0018
        XORR    R2,     R3                      ; 661A   01D3
        MOVR    R1,     R2                      ; 661B   008A
        COMR    R0                              ; 661C   0018
        XORR    R2,     R3                      ; 661D   01D3
        RLC     R3,     2                       ; 661E   0057
        COMR    R0                              ; 661F   0018
        CLRR    R2                              ; 6620   01D2
        ADDR    R1,     R7                      ; 6621   00CF
        SLL     R0,     1                       ; 6622   0048
        CLRR    R2                              ; 6623   01D2
        MOVR    R4,     R7                      ; 6624   00A7
        COMR    R0                              ; 6625   0018
        XORR    R2,     R4                      ; 6626   01D4
        DECLE   $0035                           ; 6627   0035

        SLL     R0,     1                       ; 6628   0048
        DECLE   $0000,  $0000                   ; 6629   0000 0000

        SUBR    R0,     R0                      ; 662B   0100
        DECLE   $0000                           ; 662C   0000

        SARC    R0,     1                       ; 662D   0078
        XORR    R4,     R1                      ; 662E   01E1
        SARC    R1,     2                       ; 662F   007D
        ADCR    R0                              ; 6630   0028
        XORR    R4,     R1                      ; 6631   01E1
        MOVR    R2,     R4                      ; 6632   0094
        INCR    R2                              ; 6633   000A
        XORR    R4,     R1                      ; 6634   01E1
        SARC    R1,     2                       ; 6635   007D
        INCR    R2                              ; 6636   000A
        XORR    R4,     R1                      ; 6637   01E1
        RLC     R3,     1                       ; 6638   0053
        DECR    R4                              ; 6639   0014
        XORR    R4,     R1                      ; 663A   01E1
        ADDR    R0,     R5                      ; 663B   00C5
        ADCR    R0                              ; 663C   0028
        XORR    R4,     R1                      ; 663D   01E1
        ADDR    R7,     R4                      ; 663E   00FC
        ADCR    R0                              ; 663F   0028
        XORR    R4,     R2                      ; 6640   01E2
        RSWD    R3                              ; 6641   003B
        ADCR    R0                              ; 6642   0028
        XORR    R4,     R2                      ; 6643   01E2
        SLLC    R1,     2                       ; 6644   005D
        INCR    R2                              ; 6645   000A
        XORR    R4,     R2                      ; 6646   01E2
        RSWD    R3                              ; 6647   003B
        INCR    R2                              ; 6648   000A
        XORR    R4,     R1                      ; 6649   01E1
        ADDR    R7,     R4                      ; 664A   00FC
        DECR    R4                              ; 664B   0014
        XORR    R4,     R2                      ; 664C   01E2
        MOVR    R4,     R7                      ; 664D   00A7
        ADCR    R0                              ; 664E   0028
        DECLE   $0000                           ; 664F   0000

        SUBR    R0,     R0                      ; 6650   0100
        DECLE   $0000                           ; 6651   0000

        SARC    R0,     1                       ; 6652   0078
        ANDR    R6,     R2                      ; 6653   01B2
        ADDR    R7,     R2                      ; 6654   00FA
        ADCR    R0                              ; 6655   0028
        ANDR    R6,     R3                      ; 6656   01B3
        NEGR    R7                              ; 6657   0027
        ADCR    R0                              ; 6658   0028
        ANDR    R6,     R2                      ; 6659   01B2
        ADDR    R7,     R2                      ; 665A   00FA
        ADCR    R0                              ; 665B   0028
        ANDR    R6,     R3                      ; 665C   01B3
        NEGR    R7                              ; 665D   0027
        ADCR    R0                              ; 665E   0028
        ANDR    R6,     R4                      ; 665F   01B4
        RRC     R1,     2                       ; 6660   0075
        ADCR    R0                              ; 6661   0028
        ANDR    R6,     R4                      ; 6662   01B4
        MOVR    R7,     R1                      ; 6663   00B9
        ADCR    R0                              ; 6664   0028
        ANDR    R6,     R5                      ; 6665   01B5
        SLL     R1,     2                       ; 6666   004D
        ADCR    R0                              ; 6667   0028
        DECLE   $0000                           ; 6668   0000

        PSHR    R5                              ; 6669   0275
        PSHR    R4                              ; 666A   0274

        JSR     R5,     .EXEC.A83               ; 666B   0004 0118 0283

        MVII    #$003F, R0                      ; 666E   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6670   0240 01F8
        MVII    #$0106, R4                      ; 6672   02BC 0106
        MVII    #$0006, R3                      ; 6674   02BB 0006
        CLRR    R0                              ; 6676   01C0
L_6677:
        MVO@    R0,     R4                      ; 6677   0260
        DECR    R3                              ; 6678   0013
        BNEQ    L_6677                          ; 6679   022C 0003

        PULR    R4                              ; 667B   02B4
        PULR    R7                              ; 667C   02B7
L_667D:
        CLRR    R0                              ; 667D   01C0
        MVO@    R0,     R4                      ; 667E   0260
        MVO@    R0,     R4                      ; 667F   0260
        PULR    R7                              ; 6680   02B7
        PSHR    R5                              ; 6681   0275
        CLRR    R0                              ; 6682   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 6683   0240 01FB
        MVI     .PSG0.chan_enable,R0            ; 6685   0280 01F8
        MVII    #$0009, R1                      ; 6687   02B9 0009
        B       L_669D                          ; 6689   0200 0012

        PSHR    R5                              ; 668B   0275
        CLRR    R0                              ; 668C   01C0
        MVO     R0,     .PSG0.chn_b_vol         ; 668D   0240 01FC
        MVI     .PSG0.chan_enable,R0            ; 668F   0280 01F8
        MVII    #$0012, R1                      ; 6691   02B9 0012
        B       L_669D                          ; 6693   0200 0008

        PSHR    R5                              ; 6695   0275
        CLRR    R0                              ; 6696   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 6697   0240 01FD
        MVI     .PSG0.chan_enable,R0            ; 6699   0280 01F8
        MVII    #$0024, R1                      ; 669B   02B9 0024
L_669D:
        COMR    R1                              ; 669D   0019
        ANDR    R1,     R0                      ; 669E   0188
        COMR    R1                              ; 669F   0019
        XORR    R1,     R0                      ; 66A0   01C8
        PULR    R7                              ; 66A1   02B7
        DECLE   $0000                           ; 66A2   0000

        INCR    R1                              ; 66A3   0009
        DECLE   $0000,  $0001                   ; 66A4   0000 0001

        CLRC                                    ; 66A6   0006
        DECLE   $0000                           ; 66A7   0000

        ADDR    R3,     R6                      ; 66A8   00DE
        SLLC    R3,     2                       ; 66A9   005F
        DECLE   $0000,  $0000                   ; 66AA   0000 0000

        ADDR    R6,     R5                      ; 66AC   00F5
        RLC     R3,     1                       ; 66AD   0053
        DECLE   $0000,  $0000,  $0000           ; 66AE   0000 0000 0000

        INCR    R1                              ; 66B1   0009
        DECLE   $0000,  $0000                   ; 66B2   0000 0000

        SETC                                    ; 66B4   0007
        DECLE   $0000                           ; 66B5   0000

        ADDR    R7,     R4                      ; 66B6   00FC
        SLLC    R3,     2                       ; 66B7   005F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B8   0000 0000 0000 0000
        DECLE   $0000                           ; 66BC   0000

        MOVR    R4,     R1                      ; 66BD   00A1
        DECLE   $0000                           ; 66BE   0000

        INCR    R0                              ; 66BF   0008
        DECLE   $0000,  $0001                   ; 66C0   0000 0001

        EIS                                     ; 66C2   0002
        DECLE   $0000                           ; 66C3   0000

        INCR    R6                              ; 66C4   000E
        SLR     R0,     1                       ; 66C5   0060
        NEGR    R0                              ; 66C6   0020
        DECLE   $0000                           ; 66C7   0000

        ADCR    R0                              ; 66C8   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C9   0000 0000 0000 0000

        INCR    R4                              ; 66CD   000C
        TSTR    R0                              ; 66CE   0080
        DECLE   $0000                           ; 66CF   0000

        CLRC                                    ; 66D0   0006
        DECLE   $0000                           ; 66D1   0000

        DECR    R4                              ; 66D2   0014
        SLR     R0,     1                       ; 66D3   0060
        NEGR    R0                              ; 66D4   0020
        DECLE   $0000                           ; 66D5   0000

        ADCR    R0                              ; 66D6   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D7   0000 0000 0000 0000

        INCR    R4                              ; 66DB   000C
        TSTR    R0                              ; 66DC   0080
        DECLE   $0000                           ; 66DD   0000

        CLRC                                    ; 66DE   0006
        DECLE   $0000                           ; 66DF   0000

        COMR    R2                              ; 66E0   001A
        SLR     R0,     1                       ; 66E1   0060
        NEGR    R0                              ; 66E2   0020
        DECLE   $0000                           ; 66E3   0000

        ADCR    R0                              ; 66E4   0028
L_66E5:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E5   0000 0000 0000 0000

        INCR    R5                              ; 66E9   000D
        TSTR    R0                              ; 66EA   0080
        DECLE   $0000                           ; 66EB   0000

        CLRC                                    ; 66EC   0006
        DECLE   $0000                           ; 66ED   0000

        NEGR    R0                              ; 66EE   0020
        SLR     R0,     1                       ; 66EF   0060
        NEGR    R0                              ; 66F0   0020
        DECLE   $0000                           ; 66F1   0000

        ADCR    R0                              ; 66F2   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F3   0000 0000 0000 0000

        INCR    R5                              ; 66F7   000D
        TSTR    R0                              ; 66F8   0080
        DECLE   $0001                           ; 66F9   0001

        EIS                                     ; 66FA   0002
        DECLE   $0000                           ; 66FB   0000

        SLR     R2,     2                       ; 66FC   0066
        SLR     R0,     1                       ; 66FD   0060
        DECR    R0                              ; 66FE   0010
        DECLE   $0000,  $0001,  $0000,  $0000   ; 66FF   0000 0001 0000 0000
        DECLE   $0000,  $0000                   ; 6703   0000 0000

        INCR    R1                              ; 6705   0009
        TSTR    R0                              ; 6706   0080
        DECLE   $0000                           ; 6707   0000

        CLRC                                    ; 6708   0006
        DECLE   $0000                           ; 6709   0000

        GSWD    R2                              ; 670A   0032
        SLR     R0,     1                       ; 670B   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6710   0000 0000 0000

        INCR    R5                              ; 6713   000D
        TSTR    R0                              ; 6714   0080
        DECLE   $0000                           ; 6715   0000

        EIS                                     ; 6716   0002
        DECLE   $0000                           ; 6717   0000

        RSWD    R6                              ; 6718   003E
        SLR     R0,     1                       ; 6719   0060
        DECR    R0                              ; 671A   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671B   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 671F   0000 0000

        SLL     R0,     2                       ; 6721   004C
        TSTR    R0                              ; 6722   0080
        SWAP    R0,     1                       ; 6723   0040
        CLRC                                    ; 6724   0006
        DECLE   $0000                           ; 6725   0000

        SLLC    R2,     1                       ; 6726   005A
        SLR     R0,     1                       ; 6727   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6728   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 672C   0000 0000 0000

        INCR    R1                              ; 672F   0009
        TSTR    R0                              ; 6730   0080
        DECLE   $0000                           ; 6731   0000

        EIS                                     ; 6732   0002
        DECLE   $0000                           ; 6733   0000

        SWAP    R0,     2                       ; 6734   0044
        SLR     R0,     1                       ; 6735   0060
        DECR    R0                              ; 6736   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6737   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 673B   0000 0000

        SLL     R1,     1                       ; 673D   0049
        TSTR    R0                              ; 673E   0080
        SWAP    R0,     1                       ; 673F   0040
        EIS                                     ; 6740   0002
        DECLE   $0000                           ; 6741   0000

        SWAP    R0,     2                       ; 6742   0044
        SLR     R0,     1                       ; 6743   0060
        DECR    R0                              ; 6744   0010
        DECLE   $0000,  $0000,  $0000           ; 6745   0000 0000 0000

        INCR    R0                              ; 6748   0008
        DECLE   $0000,  $0000                   ; 6749   0000 0000

        INCR    R5                              ; 674B   000D
        TSTR    R0                              ; 674C   0080
        DECLE   $0000,  $0001,  $0000           ; 674D   0000 0001 0000

        SLL     R2,     1                       ; 6750   004A
        SLR     R0,     1                       ; 6751   0060
        DECR    R0                              ; 6752   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6753   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6757   0000 0000

        SLL     R1,     2                       ; 6759   004D
        TSTR    R0                              ; 675A   0080
        SWAP    R0,     1                       ; 675B   0040
        DECLE   $0001,  $0000                   ; 675C   0001 0000

        SLL     R2,     1                       ; 675E   004A
        SLR     R0,     1                       ; 675F   0060
        DECR    R0                              ; 6760   0010
        DECLE   $0000,  $0000,  $0000           ; 6761   0000 0000 0000

        DECR    R0                              ; 6764   0010
        DECLE   $0000,  $0000                   ; 6765   0000 0000

        SLL     R1,     2                       ; 6767   004D
        TSTR    R0                              ; 6768   0080
        SWAP    R0,     1                       ; 6769   0040
        EIS                                     ; 676A   0002
        DECLE   $0000                           ; 676B   0000

        SLL     R2,     1                       ; 676C   004A
        SLR     R0,     1                       ; 676D   0060
        DECR    R0                              ; 676E   0010
        DECLE   $0000,  $0000,  $0000           ; 676F   0000 0000 0000

        DECR    R0                              ; 6772   0010
        DECLE   $0000,  $0000                   ; 6773   0000 0000

        SLL     R1,     2                       ; 6775   004D
        TSTR    R0                              ; 6776   0080
        SWAP    R0,     1                       ; 6777   0040
        EIS                                     ; 6778   0002
        DECLE   $0000                           ; 6779   0000

        SLL     R2,     1                       ; 677A   004A
        SLR     R0,     1                       ; 677B   0060
        DECR    R0                              ; 677C   0010
        DECLE   $0000,  $0000,  $0000           ; 677D   0000 0000 0000

        DECR    R0                              ; 6780   0010
        DECLE   $0000,  $0000                   ; 6781   0000 0000

        SLL     R1,     2                       ; 6783   004D
        TSTR    R0                              ; 6784   0080
        SWAP    R0,     1                       ; 6785   0040
        CLRC                                    ; 6786   0006
        DECLE   $0000                           ; 6787   0000

        SLL     R2,     1                       ; 6788   004A
        SLR     R0,     1                       ; 6789   0060
        DECR    R0                              ; 678A   0010
        DECLE   $0000,  $0000,  $0000           ; 678B   0000 0000 0000

        DECR    R0                              ; 678E   0010
        DECLE   $0000                           ; 678F   0000

        NEGR    R0                              ; 6790   0020
        INCR    R1                              ; 6791   0009
        GSWD    R0                              ; 6792   0030
        DECLE   $0001,  $0000,  $0000           ; 6793   0001 0000 0000

        SLR     R0,     1                       ; 6796   0060
        SLR     R0,     1                       ; 6797   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6798   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 679C   0000 0000 0000

        INCR    R1                              ; 679F   0009
        TSTR    R0                              ; 67A0   0080
        DECLE   $0000                           ; 67A1   0000

        CLRC                                    ; 67A2   0006
        DECLE   $0000                           ; 67A3   0000

        RLC     R0,     1                       ; 67A4   0050
        SLR     R0,     1                       ; 67A5   0060
        DECR    R0                              ; 67A6   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A7   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 67AB   0000 0000

        INCR    R1                              ; 67AD   0009
        TSTR    R0                              ; 67AE   0080
        DECLE   $0000                           ; 67AF   0000

        CLRC                                    ; 67B0   0006
        DECLE   $0000                           ; 67B1   0000

        SAR     R2,     2                       ; 67B2   006E
        SLR     R0,     1                       ; 67B3   0060
        DECR    R0                              ; 67B4   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B5   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 67B9   0000 0000

        INCR    R5                              ; 67BB   000D
        TSTR    R0                              ; 67BC   0080
        DECLE   $0001                           ; 67BD   0001

        CLRC                                    ; 67BE   0006
        DECLE   $0000                           ; 67BF   0000

        SARC    R0,     1                       ; 67C0   0078
        SLR     R0,     1                       ; 67C1   0060
        DECR    R0                              ; 67C2   0010
        DECLE   $0000                           ; 67C3   0000

        DECR    R4                              ; 67C4   0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C5   0000 0000 0000 0000

        INCR    R1                              ; 67C9   0009
        TSTR    R0                              ; 67CA   0080
        DECLE   $0000                           ; 67CB   0000

        EIS                                     ; 67CC   0002
        DECR    R0                              ; 67CD   0010
        TSTR    R0                              ; 67CE   0080
        SLR     R0,     1                       ; 67CF   0060
        NEGR    R0                              ; 67D0   0020
        DECLE   $0000,  $0001,  $0000,  $0000   ; 67D1   0000 0001 0000 0000
        DECLE   $0000                           ; 67D5   0000

        ADDR    R4,     R3                      ; 67D6   00E3
        SLL     R1,     2                       ; 67D7   004D
        MOVR    R1,     R2                      ; 67D8   008A
        SLR     R0,     1                       ; 67D9   0060
        DECLE   $0001                           ; 67DA   0001

        B       L_68C0                          ; 67DB   0200 00E3

        SLL     R1,     2                       ; 67DD   004D
        DECLE   $0000,  $0000                   ; 67DE   0000 0000

        MOVR    R1,     R2                      ; 67E0   008A
        SLR     R0,     1                       ; 67E1   0060
        DECLE   $0001                           ; 67E2   0001

        B       L_68A0                          ; 67E3   0200 00BB

        RLC     R0,     1                       ; 67E5   0050
        ADDR    R6,     R5                      ; 67E6   00F5
        RLC     R3,     1                       ; 67E7   0053
        DECLE   $0001                           ; 67E8   0001

        SLR     R2,     1                       ; 67E9   0062
        SDBD                                    ; 67EA   0001
        XORI    #$50EB, R4                      ; 67EB   03FC 00EB 0050
        ADDR    R2,     R6                      ; 67EE   00D6
        RLC     R0,     1                       ; 67EF   0050
        ADDR    R2,     R6                      ; 67F0   00D6
        RLC     R0,     1                       ; 67F1   0050
        ADDR    R2,     R6                      ; 67F2   00D6
        RLC     R0,     1                       ; 67F3   0050
        ADDR    R2,     R6                      ; 67F4   00D6
        RLC     R0,     1                       ; 67F5   0050
        ADDR    R2,     R6                      ; 67F6   00D6
        RLC     R0,     1                       ; 67F7   0050
        SWAP    R0,     1                       ; 67F8   0040
        SLLC    R0,     1                       ; 67F9   0058
        MOVR    R3,     R6                      ; 67FA   009E
        RLC     R0,     1                       ; 67FB   0050
        ADDR    R6,     R5                      ; 67FC   00F5
        RLC     R3,     1                       ; 67FD   0053
        DECLE   $0001                           ; 67FE   0001

        SLR     R2,     1                       ; 67FF   0062
        SDBD                                    ; 6800   0001
        ADDI    #$50D6, R0                      ; 6801   02F8 00D6 0050
        ADDR    R2,     R6                      ; 6804   00D6
        RLC     R0,     1                       ; 6805   0050
        ADDR    R2,     R6                      ; 6806   00D6
        RLC     R0,     1                       ; 6807   0050
        ADDR    R2,     R6                      ; 6808   00D6
        RLC     R0,     1                       ; 6809   0050
        ADDR    R2,     R6                      ; 680A   00D6
        RLC     R0,     1                       ; 680B   0050
        MOVR    R3,     R6                      ; 680C   009E
        RLC     R0,     1                       ; 680D   0050
        MOVR    R3,     R1                      ; 680E   0099
        SLL     R3,     2                       ; 680F   004F
        ADDR    R5,     R4                      ; 6810   00EC
L_6811:
        SLR     R0,     1                       ; 6811   0060
        DIS                                     ; 6812   0003
        DECLE   $0000                           ; 6813   0000

        MOVR    R3,     R1                      ; 6814   0099
        RLC     R2,     1                       ; 6815   0052
        MOVR    R7,     R6                      ; 6816   00BE
        SLR     R0,     1                       ; 6817   0060
        DIS                                     ; 6818   0003
        DECLE   $0000                           ; 6819   0000

        RLC     R2,     1                       ; 681A   0052
        SLL     R3,     2                       ; 681B   004F
        MOVR    R7,     R6                      ; 681C   00BE
        SLR     R0,     1                       ; 681D   0060
        DIS                                     ; 681E   0003
        DECLE   $0000                           ; 681F   0000

        SLL     R2,     2                       ; 6820   004E
        SLL     R3,     2                       ; 6821   004F
        MOVR    R7,     R6                      ; 6822   00BE
        SLR     R0,     1                       ; 6823   0060
        DIS                                     ; 6824   0003
        DECLE   $0000                           ; 6825   0000

        SLL     R2,     2                       ; 6826   004E
        RLC     R3,     1                       ; 6827   0053
        MOVR    R7,     R6                      ; 6828   00BE
        SLR     R0,     1                       ; 6829   0060
        DECLE   $0001,  $0000                   ; 682A   0001 0000

        MOVR    R6,     R5                      ; 682C   00B5
        RLC     R2,     1                       ; 682D   0052
        MOVR    R7,     R6                      ; 682E   00BE
        SLR     R0,     1                       ; 682F   0060
        DECLE   $0001,  $0000                   ; 6830   0001 0000

        SLL     R2,     2                       ; 6832   004E
        SLL     R3,     2                       ; 6833   004F
        ADDR    R7,     R1                      ; 6834   00F9
        SLR     R1,     1                       ; 6835   0061
        DECLE   $0001                           ; 6836   0001

        SUB     G_005E, R1                      ; 6837   0301 005E
        SLL     R3,     2                       ; 6839   004F
        MOVR    R5,     R2                      ; 683A   00AA
        RLC     R0,     1                       ; 683B   0050
        MOVR    R5,     R2                      ; 683C   00AA
        RLC     R0,     1                       ; 683D   0050
        MOVR    R3,     R5                      ; 683E   009D
        RLC     R3,     2                       ; 683F   0057
        RSWD    R2                              ; 6840   003A
        SLR     R1,     1                       ; 6841   0061

        JSR     R4,     G_00A1                  ; 6842   0004 0000 00A1

        RLC     R3,     2                       ; 6845   0057

        JSRE    R4,     L_6003                  ; 6846   0004 0061 0003
        DECLE   $0000                           ; 6849   0000

        MOVR    R4,     R5                      ; 684A   00A5
        RLC     R3,     2                       ; 684B   0057
        ADDR    R2,     R0                      ; 684C   00D0
        SLR     R1,     1                       ; 684D   0061
        DIS                                     ; 684E   0003
        DECLE   $0000                           ; 684F   0000

        DECR    R0                              ; 6850   0010
        RLC     R3,     2                       ; 6851   0057
        RSWD    R2                              ; 6852   003A
        SLR     R1,     1                       ; 6853   0061

        JSRE    R6,     G_00E4                  ; 6854   0004 0201 00E4

        RLC     R0,     2                       ; 6857   0054
        ADDR    R4,     R0                      ; 6858   00E0
        RLC     R0,     2                       ; 6859   0054
        DECLE   $0000,  $0000                   ; 685A   0000 0000

        GSWD    R0                              ; 685C   0030
        SLR     R1,     1                       ; 685D   0061
        DECLE   $0001,  $0000                   ; 685E   0001 0000

        SLL     R2,     2                       ; 6860   004E
        RLC     R3,     2                       ; 6861   0057
        DECR    R4                              ; 6862   0014
        SLR     R3,     1                       ; 6863   0063
        DECLE   $0001,  $0000                   ; 6864   0001 0000

        GSWD    R3                              ; 6866   0033
        RLC     R2,     1                       ; 6867   0052
        MOVR    R7,     R6                      ; 6868   00BE
        SLR     R0,     1                       ; 6869   0060
        DIS                                     ; 686A   0003
        B       L_6915                          ; 686B   0200 00A8

        RLC     R1,     1                       ; 686D   0051
        DECLE   $0000,  $0000                   ; 686E   0000 0000

        RRC     R1,     2                       ; 6870   0075
        SLR     R1,     1                       ; 6871   0061
        DIS                                     ; 6872   0003
        SUBR    R0,     R1                      ; 6873   0101
        SLLC    R2,     2                       ; 6874   005E
        SLL     R3,     2                       ; 6875   004F
        NEGR    R2                              ; 6876   0022
        SLLC    R0,     1                       ; 6877   0058
        SLL     R2,     2                       ; 6878   004E
        SLL     R3,     2                       ; 6879   004F
        MOVR    R4,     R1                      ; 687A   00A1
        SLR     R1,     1                       ; 687B   0061
        DIS                                     ; 687C   0003
        DECLE   $0001                           ; 687D   0001

        SLLC    R2,     2                       ; 687E   005E
        SLL     R3,     2                       ; 687F   004F
        INCR    R5                              ; 6880   000D
        RLC     R3,     2                       ; 6881   0057
        MOVR    R4,     R2                      ; 6882   00A2
        SLR     R0,     1                       ; 6883   0060
        EIS                                     ; 6884   0002
        SUBR    R0,     R1                      ; 6885   0101
        SLLC    R2,     2                       ; 6886   005E
        SLL     R3,     2                       ; 6887   004F
        MOVR    R5,     R2                      ; 6888   00AA
        RLC     R0,     1                       ; 6889   0050
        COMR    R0                              ; 688A   0018
        SARC    R2,     2                       ; 688B   007E
        SLLC    R2,     1                       ; 688C   005A
        RSWD    R4                              ; 688D   003C
        MOVR    R3,     R1                      ; 688E   0099
        MOVR    R7,     R5                      ; 688F   00BD
        ADDR    R7,     R7                      ; 6890   00FF
        MOVR    R7,     R5                      ; 6891   00BD
        COMR    R0                              ; 6892   0018
        RSWD    R4                              ; 6893   003C
        RSWD    R6                              ; 6894   003E
        SARC    R0,     2                       ; 6895   007C
        NOP                                     ; 6896   0034
        DECR    R0                              ; 6897   0010
        DECR    R0                              ; 6898   0010
        DECLE   $0000                           ; 6899   0000

        SLR     R1,     2                       ; 689A   0065
        MOVR    R2,     R5                      ; 689B   0095
        MOVR    R0,     R6                      ; 689C   0086
        TSTR    R6                              ; 689D   00B6
        MOVR    R2,     R5                      ; 689E   0095
        SLR     R1,     2                       ; 689F   0065
L_68A0:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A0   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 68A4   0000 0000

        COMR    R0                              ; 68A6   0018
        RSWD    R4                              ; 68A7   003C
        SARC    R2,     2                       ; 68A8   007E
        SLL     R2,     1                       ; 68A9   004A
        SLL     R2,     1                       ; 68AA   004A
        SARC    R2,     2                       ; 68AB   007E
        RSWD    R4                              ; 68AC   003C
        COMR    R0                              ; 68AD   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B2   0000 0000 0000 0000

        SLLC    R2,     1                       ; 68B6   005A
        RSWD    R4                              ; 68B7   003C
        SARC    R2,     2                       ; 68B8   007E
        RLC     R2,     1                       ; 68B9   0052
        RLC     R2,     1                       ; 68BA   0052
        SARC    R2,     2                       ; 68BB   007E
        RSWD    R4                              ; 68BC   003C
        SLLC    R2,     1                       ; 68BD   005A
        DECLE   $0000,  $0000                   ; 68BE   0000 0000
L_68C0:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C0   0000 0000 0000 0000

        COMR    R0                              ; 68C4   0018
        COMR    R0                              ; 68C5   0018
        COMR    R0                              ; 68C6   0018
        COMR    R0                              ; 68C7   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CC   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 68D0   0000 0000

        INCR    R0                              ; 68D2   0008
        NEGR    R0                              ; 68D3   0020
        DECLE   $0000                           ; 68D4   0000

        JSR     R4,     G_2010                  ; 68D5   0004 0020 0010
        JSR     R4,     .STIC.X.0               ; 68D8   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DB   0000 0000 0000 0000

        DECR    R0                              ; 68DF   0010
        MOVR    R0,     R2                      ; 68E0   0082
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E1   0000 0000 0000 0000

        SWAP    R2,     1                       ; 68E5   0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E6   0000 0000 0000 0000

        DECR    R0                              ; 68EA   0010
        EIS                                     ; 68EB   0002
        DECLE   $0000,  $0000,  $0000           ; 68EC   0000 0000 0000

        COMR    R0                              ; 68EF   0018
        COMR    R0                              ; 68F0   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F1   0000 0000 0000 0000

        INCR    R0                              ; 68F5   0008
        NEGR    R0                              ; 68F6   0020
        EIS                                     ; 68F7   0002
        NEGR    R0                              ; 68F8   0020
        INCR    R0                              ; 68F9   0008
        DECLE   $0000,  $0000                   ; 68FA   0000 0000

        RLC     R0,     1                       ; 68FC   0050

        JSR     R4,     .STIC.X.1               ; 68FD   0004 0000 0001

        TSTR    R0                              ; 6900   0080
        DECLE   $0000                           ; 6901   0000

        NEGR    R0                              ; 6902   0020
        DECLE   $0004                           ; 6903   0004

        ADDR    R0,     R3                      ; 6904   00C3
        NEGR    R4                              ; 6905   0024
        NEGR    R4                              ; 6906   0024
        NEGR    R4                              ; 6907   0024
        RSWD    R4                              ; 6908   003C
        MOVR    R4,     R5                      ; 6909   00A5
        ADDR    R7,     R7                      ; 690A   00FF
        ADDR    R7,     R7                      ; 690B   00FF
        MOVR    R7,     R5                      ; 690C   00BD
        MOVR    R7,     R5                      ; 690D   00BD
        MOVR    R3,     R1                      ; 690E   0099
        MOVR    R3,     R1                      ; 690F   0099
        MOVR    R0,     R1                      ; 6910   0081
        MOVR    R0,     R1                      ; 6911   0081
        SWAP    R2,     1                       ; 6912   0042
        DECLE   $0000                           ; 6913   0000

        SLR     R2,     2                       ; 6914   0066
L_6915:
        MOVR    R4,     R5                      ; 6915   00A5
        MOVR    R7,     R5                      ; 6916   00BD
        ADDR    R7,     R7                      ; 6917   00FF
        ADDR    R7,     R7                      ; 6918   00FF
        MOVR    R7,     R5                      ; 6919   00BD
        MOVR    R4,     R5                      ; 691A   00A5
        MOVR    R7,     R5                      ; 691B   00BD
        MOVR    R3,     R1                      ; 691C   0099
        SWAP    R2,     1                       ; 691D   0042
        NEGR    R4                              ; 691E   0024
        COMR    R0                              ; 691F   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6920   0000 0000 0000 0000

        SWAP    R2,     1                       ; 6924   0042
        MOVR    R4,     R5                      ; 6925   00A5
        NEGR    R4                              ; 6926   0024
        RSWD    R4                              ; 6927   003C
        MOVR    R4,     R5                      ; 6928   00A5
        ADDR    R7,     R7                      ; 6929   00FF
        MOVR    R7,     R5                      ; 692A   00BD
        MOVR    R7,     R5                      ; 692B   00BD
        MOVR    R3,     R1                      ; 692C   0099
        MOVR    R3,     R1                      ; 692D   0099
        SWAP    R2,     1                       ; 692E   0042
        NEGR    R4                              ; 692F   0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6930   0000 0000 0000 0000

        NEGR    R4                              ; 6934   0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6935   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6939   0000 0000
L_693B:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693B   0000 0000 0000 0000
        DECLE   $0000                           ; 693F   0000

        ADDR    R7,     R7                      ; 6940   00FF
        COMR    R0                              ; 6941   0018
        COMR    R0                              ; 6942   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6943   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6947   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 694B   0000 0000 0000

        MOVR    R0,     R1                      ; 694E   0081
        SWAP    R2,     1                       ; 694F   0042
        RSWD    R4                              ; 6950   003C
        COMR    R0                              ; 6951   0018
        COMR    R0                              ; 6952   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6953   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6957   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695B   0000 0000 0000 0000
        DECLE   $0000                           ; 695F   0000

        ADDR    R7,     R7                      ; 6960   00FF
        COMR    R0                              ; 6961   0018
        COMR    R0                              ; 6962   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6963   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6967   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 696B   0000 0000 0000 0000
        DECLE   $0000                           ; 696F   0000

        RSWD    R4                              ; 6970   003C
        SLLC    R2,     1                       ; 6971   005A
        MOVR    R3,     R1                      ; 6972   0099
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6973   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6977   0000 0000 0000

        SWAP    R0,     1                       ; 697A   0040
        SWAP    R2,     2                       ; 697B   0046
        ADCR    R0                              ; 697C   0028
        DECR    R0                              ; 697D   0010
        ADCR    R0                              ; 697E   0028
        ADDR    R0,     R4                      ; 697F   00C4

        JSR     R4,     .STIC.X.0               ; 6980   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6983   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6987   0000 0000

        DECR    R0                              ; 6989   0010
        NEGR    R0                              ; 698A   0020
        NEGR    R6                              ; 698B   0026
        COMR    R1                              ; 698C   0019
        MOVR    R3,     R0                      ; 698D   0098
        SLR     R0,     2                       ; 698E   0064

        JSR     R4,     G_0800                  ; 698F   0004 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6992   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6996   0000 0000 0000

        CLRC                                    ; 6999   0006
        MOVR    R1,     R0                      ; 699A   0088
        MOVR    R2,     R0                      ; 699B   0090
        SLLC    R0,     2                       ; 699C   005C
        RSWD    R2                              ; 699D   003A
        INCR    R1                              ; 699E   0009
        DECR    R1                              ; 699F   0011
        SLR     R0,     1                       ; 69A0   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A9   0000 0000 0000 0000

        COMR    R0                              ; 69AD   0018
        COMR    R0                              ; 69AE   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B7   0000 0000 0000 0000

        COMR    R0                              ; 69BB   0018
        RSWD    R4                              ; 69BC   003C
        RSWD    R4                              ; 69BD   003C
        COMR    R0                              ; 69BE   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C3   0000 0000 0000 0000
        DECLE   $0000                           ; 69C7   0000

        COMR    R0                              ; 69C8   0018
        SARC    R2,     2                       ; 69C9   007E
        ADDR    R7,     R7                      ; 69CA   00FF
        ADDR    R7,     R7                      ; 69CB   00FF
        ADDR    R7,     R7                      ; 69CC   00FF
        ADDR    R7,     R7                      ; 69CD   00FF
        SARC    R2,     2                       ; 69CE   007E
        RSWD    R4                              ; 69CF   003C
        NEGR    R4                              ; 69D0   0024
        COMR    R0                              ; 69D1   0018
        RSWD    R4                              ; 69D2   003C
        NEGR    R4                              ; 69D3   0024
        NEGR    R4                              ; 69D4   0024
        NEGR    R4                              ; 69D5   0024
        SWAP    R2,     1                       ; 69D6   0042
        SWAP    R2,     1                       ; 69D7   0042
        SWAP    R2,     1                       ; 69D8   0042
        MOVR    R0,     R1                      ; 69D9   0081
        MOVR    R0,     R1                      ; 69DA   0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 69DF   0000 0000 0000

        NEGR    R4                              ; 69E2   0024
        COMR    R0                              ; 69E3   0018
        SARC    R2,     2                       ; 69E4   007E
        SARC    R2,     2                       ; 69E5   007E
        SLLC    R2,     1                       ; 69E6   005A
        MOVR    R0,     R1                      ; 69E7   0081
        MOVR    R0,     R1                      ; 69E8   0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69ED   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 69F1   0000 0000

        MOVR    R4,     R5                      ; 69F3   00A5
        MOVR    R3,     R1                      ; 69F4   0099
        ADDR    R3,     R3                      ; 69F5   00DB
        SLLC    R2,     1                       ; 69F6   005A
        SARC    R2,     2                       ; 69F7   007E
        COMR    R0                              ; 69F8   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FD   0000 0000 0000 0000

        DECR    R0                              ; 6A01   0010
        DECR    R0                              ; 6A02   0010
        DECR    R0                              ; 6A03   0010
        DECR    R0                              ; 6A04   0010
        DECR    R0                              ; 6A05   0010
        DECR    R0                              ; 6A06   0010
        DECR    R0                              ; 6A07   0010
        DECR    R0                              ; 6A08   0010
        DECR    R2                              ; 6A09   0012
        SLR     R2,     1                       ; 6A0A   0062
        DECLE   $0001                           ; 6A0B   0001

        COMR    R2                              ; 6A0C   001A
        SLR     R2,     1                       ; 6A0D   0062
        DECLE   $0001                           ; 6A0E   0001

        NEGR    R2                              ; 6A0F   0022
        SLR     R2,     1                       ; 6A10   0062
        DECLE   $0001                           ; 6A11   0001

        ADDR    R7,     R7                      ; 6A12   00FF
        MOVR    R0,     R7                      ; 6A13   0087
        ADDR    R7,     R7                      ; 6A14   00FF
        MOVR    R0,     R3                      ; 6A15   0083
        DECLE   $0000                           ; 6A16   0000

        ADDR    R7,     R7                      ; 6A17   00FF
        MOVR    R4,     R7                      ; 6A18   00A7
        ADDR    R7,     R7                      ; 6A19   00FF
        ADDR    R7,     R7                      ; 6A1A   00FF
        ADDR    R7,     R7                      ; 6A1B   00FF
        ADDR    R7,     R4                      ; 6A1C   00FC
        ADDR    R0,     R0                      ; 6A1D   00C0
        RRC     R0,     1                       ; 6A1E   0070
        TSTR    R7                              ; 6A1F   00BF
        ADDR    R0,     R1                      ; 6A20   00C1
        ADDR    R7,     R7                      ; 6A21   00FF
        ADDR    R7,     R0                      ; 6A22   00F8
        ADDR    R0,     R0                      ; 6A23   00C0
        COMR    R7                              ; 6A24   001F
        ADDR    R7,     R7                      ; 6A25   00FF
        SARC    R3,     2                       ; 6A26   007F
        DIS                                     ; 6A27   0003
        ADDR    R6,     R0                      ; 6A28   00F0
        ADDR    R7,     R7                      ; 6A29   00FF
        COMR    R0                              ; 6A2A   0018
        CMPR    R6,     R0                      ; 6A2B   0170
        DECLE   $0000,  $0000                   ; 6A2C   0000 0000

        ADDR    R7,     R7                      ; 6A2E   00FF
        ADDR    R7,     R7                      ; 6A2F   00FF
        ADDR    R7,     R7                      ; 6A30   00FF
        ADDR    R7,     R7                      ; 6A31   00FF
        DECLE   $0000                           ; 6A32   0000

        ADDR    R7,     R7                      ; 6A33   00FF
        RSWD    R7                              ; 6A34   003F
        DIS                                     ; 6A35   0003
        DECLE   $0000                           ; 6A36   0000

        ADDR    R7,     R0                      ; 6A37   00F8
        ADDR    R7,     R7                      ; 6A38   00FF
        ADDR    R7,     R4                      ; 6A39   00FC
        DECLE   $0000                           ; 6A3A   0000

        ADDR    R7,     R7                      ; 6A3B   00FF
        ADDR    R7,     R7                      ; 6A3C   00FF
        ADDR    R7,     R7                      ; 6A3D   00FF
        RSWD    R7                              ; 6A3E   003F
        SETC                                    ; 6A3F   0007
        COMR    R7                              ; 6A40   001F
        SARC    R3,     2                       ; 6A41   007F
        ADDR    R7,     R7                      ; 6A42   00FF
        ADDR    R7,     R7                      ; 6A43   00FF
        ADDR    R7,     R7                      ; 6A44   00FF
        ADDR    R4,     R5                      ; 6A45   00E5
        ADDR    R7,     R7                      ; 6A46   00FF
        ADDR    R4,     R3                      ; 6A47   00E3
        TSTR    R0                              ; 6A48   0080
        ADDR    R0,     R1                      ; 6A49   00C1
        SARC    R3,     2                       ; 6A4A   007F
        MOVR    R0,     R5                      ; 6A4B   0085
        ADDR    R7,     R7                      ; 6A4C   00FF
        ADDR    R7,     R0                      ; 6A4D   00F8
        ADDR    R4,     R3                      ; 6A4E   00E3
        RRC     R0,     1                       ; 6A4F   0070
        MOVR    R3,     R7                      ; 6A50   009F
        ADDR    R4,     R0                      ; 6A51   00E0
        ADDR    R7,     R7                      ; 6A52   00FF
        ADDR    R7,     R7                      ; 6A53   00FF
        ADDR    R7,     R7                      ; 6A54   00FF
        SETC                                    ; 6A55   0007
        ADDR    R6,     R0                      ; 6A56   00F0
        DIS                                     ; 6A57   0003
        ADDR    R7,     R7                      ; 6A58   00FF
        NEGR    R3                              ; 6A59   0023
        ADDR    R7,     R7                      ; 6A5A   00FF
        ADDR    R7,     R7                      ; 6A5B   00FF
        ADDR    R7,     R7                      ; 6A5C   00FF
        ADDR    R6,     R0                      ; 6A5D   00F0
        MOVR    R0,     R7                      ; 6A5E   0087
        ADDR    R4,     R1                      ; 6A5F   00E1
        SARC    R0,     1                       ; 6A60   0078
        RSWD    R7                              ; 6A61   003F
        MOVR    R2,     R0                      ; 6A62   0090
        ADDR    R7,     R7                      ; 6A63   00FF
        ADDR    R7,     R7                      ; 6A64   00FF
        SETC                                    ; 6A65   0007
        ADDR    R4,     R0                      ; 6A66   00E0
        ADDR    R7,     R1                      ; 6A67   00F9
        DIS                                     ; 6A68   0003
        ADDR    R7,     R7                      ; 6A69   00FF
        RSWD    R7                              ; 6A6A   003F
        ADDR    R7,     R7                      ; 6A6B   00FF
        ADDR    R7,     R7                      ; 6A6C   00FF
        ADDR    R7,     R7                      ; 6A6D   00FF
        ADDR    R7,     R7                      ; 6A6E   00FF
        ADDR    R7,     R7                      ; 6A6F   00FF
        ADDR    R6,     R0                      ; 6A70   00F0
        ADDR    R0,     R0                      ; 6A71   00C0
        SETC                                    ; 6A72   0007
        ADDR    R0,     R3                      ; 6A73   00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 6A78   0000 0000 0001

        DIS                                     ; 6A7B   0003
        ADDR    R7,     R7                      ; 6A7C   00FF
        ADDR    R7,     R7                      ; 6A7D   00FF
        ADDR    R7,     R7                      ; 6A7E   00FF
        ADDR    R7,     R7                      ; 6A7F   00FF
        ADDR    R7,     R7                      ; 6A80   00FF
        ADDR    R7,     R4                      ; 6A81   00FC
        ADDR    R4,     R0                      ; 6A82   00E0
        TSTR    R0                              ; 6A83   0080
        ADDR    R7,     R7                      ; 6A84   00FF
        ADDR    R7,     R7                      ; 6A85   00FF
        ADDR    R7,     R7                      ; 6A86   00FF
        ADDR    R7,     R7                      ; 6A87   00FF
        ADDR    R7,     R6                      ; 6A88   00FE
        ADDR    R7,     R4                      ; 6A89   00FC
        ADDR    R7,     R0                      ; 6A8A   00F8
        ADDR    R6,     R0                      ; 6A8B   00F0
        ADDR    R6,     R0                      ; 6A8C   00F0
        SLR     R0,     1                       ; 6A8D   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6A92   0000 0000

        SARC    R0,     2                       ; 6A94   007C
        ADDR    R4,     R0                      ; 6A95   00E0
        ADDR    R0,     R0                      ; 6A96   00C0
        TSTR    R0                              ; 6A97   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A98   0000 0000 0000 0000

        RSWD    R0                              ; 6A9C   0038
        COMR    R4                              ; 6A9D   001C
        NEGR    R1                              ; 6A9E   0021
        GSWD    R1                              ; 6A9F   0031
        DECLE   $0000                           ; 6AA0   0000

        INCR    R0                              ; 6AA1   0008
        TSTR    R0                              ; 6AA2   0080
        ADDR    R2,     R0                      ; 6AA3   00D0
        TSTR    R0                              ; 6AA4   0080
        ADDR    R4,     R0                      ; 6AA5   00E0
        ADDR    R7,     R0                      ; 6AA6   00F8
        ADDR    R7,     R6                      ; 6AA7   00FE
        ADDR    R7,     R7                      ; 6AA8   00FF
        ADDR    R7,     R7                      ; 6AA9   00FF
        ADDR    R7,     R7                      ; 6AAA   00FF
        ADDR    R7,     R7                      ; 6AAB   00FF
        ADDR    R4,     R0                      ; 6AAC   00E0
        ADDR    R0,     R0                      ; 6AAD   00C0
        TSTR    R0                              ; 6AAE   0080
        TSTR    R0                              ; 6AAF   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB0   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 6AB4   0000 0001

        DIS                                     ; 6AB6   0003
        DIS                                     ; 6AB7   0003
        SETC                                    ; 6AB8   0007
        INCR    R7                              ; 6AB9   000F
        COMR    R7                              ; 6ABA   001F
        RSWD    R7                              ; 6ABB   003F
        ADDR    R4,     R0                      ; 6ABC   00E0
        ADDR    R0,     R0                      ; 6ABD   00C0
        TSTR    R0                              ; 6ABE   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABF   0000 0000 0000 0000
        DECLE   $0000                           ; 6AC3   0000

        ADDR    R7,     R7                      ; 6AC4   00FF
        ADDR    R7,     R7                      ; 6AC5   00FF
        ADDR    R7,     R7                      ; 6AC6   00FF
        ADDR    R7,     R7                      ; 6AC7   00FF
        ADDR    R7,     R7                      ; 6AC8   00FF
        ADDR    R7,     R6                      ; 6AC9   00FE
        ADDR    R7,     R4                      ; 6ACA   00FC
        ADDR    R7,     R0                      ; 6ACB   00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6AD0   0000 0000 0000

        GSWD    R3                              ; 6AD3   0033
        SETC                                    ; 6AD4   0007
        INCR    R7                              ; 6AD5   000F
        COMR    R7                              ; 6AD6   001F
        RSWD    R1                              ; 6AD7   0039
        SAR     R1,     2                       ; 6AD8   006D
        SWAP    R0,     1                       ; 6AD9   0040
        ADDR    R0,     R0                      ; 6ADA   00C0
        ADDR    R0,     R0                      ; 6ADB   00C0
        SETC                                    ; 6ADC   0007
        MOVR    R0,     R1                      ; 6ADD   0081
        ADDR    R0,     R0                      ; 6ADE   00C0
        ADDR    R0,     R0                      ; 6ADF   00C0
        TSTR    R0                              ; 6AE0   0080
        DECLE   $0000,  $0000                   ; 6AE1   0000 0000

        NEGR    R0                              ; 6AE3   0020
        ADDR    R7,     R7                      ; 6AE4   00FF
        ADDR    R7,     R7                      ; 6AE5   00FF
        SARC    R3,     2                       ; 6AE6   007F
        COMR    R7                              ; 6AE7   001F
        COMR    R7                              ; 6AE8   001F
        COMR    R7                              ; 6AE9   001F
        RSWD    R7                              ; 6AEA   003F
        SARC    R3,     2                       ; 6AEB   007F
        ADDR    R6,     R3                      ; 6AEC   00F3
        ADDR    R4,     R1                      ; 6AED   00E1
        ADDR    R0,     R0                      ; 6AEE   00C0
        ADDR    R4,     R2                      ; 6AEF   00E2
        ADDR    R7,     R7                      ; 6AF0   00FF
        ADDR    R7,     R7                      ; 6AF1   00FF
        ADDR    R7,     R5                      ; 6AF2   00FD
        ADDR    R7,     R0                      ; 6AF3   00F8
        DIS                                     ; 6AF4   0003
        DECLE   $0001                           ; 6AF5   0001

        INCR    R5                              ; 6AF6   000D
        SARC    R3,     2                       ; 6AF7   007F
        ADDR    R7,     R7                      ; 6AF8   00FF
        ADDR    R7,     R7                      ; 6AF9   00FF
        ADDR    R7,     R7                      ; 6AFA   00FF
        ADDR    R7,     R7                      ; 6AFB   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFC   0000 0000 0000 0000

        DIS                                     ; 6B00   0003
        SETC                                    ; 6B01   0007
        RSWD    R7                              ; 6B02   003F
        ADDR    R7,     R7                      ; 6B03   00FF
        DIS                                     ; 6B04   0003
        INCR    R7                              ; 6B05   000F
        COMR    R0                              ; 6B06   0018
        DIS                                     ; 6B07   0003
        COMR    R7                              ; 6B08   001F
        ADDR    R7,     R7                      ; 6B09   00FF
        ADDR    R7,     R7                      ; 6B0A   00FF
        ADDR    R7,     R7                      ; 6B0B   00FF
        ADDR    R7,     R7                      ; 6B0C   00FF
        ADDR    R7,     R7                      ; 6B0D   00FF
        ADDR    R7,     R6                      ; 6B0E   00FE
        ADDR    R6,     R0                      ; 6B0F   00F0
        TSTR    R0                              ; 6B10   0080
        DECLE   $0000,  $0000,  $0000           ; 6B11   0000 0000 0000

        ADDR    R7,     R7                      ; 6B14   00FF
        ADDR    R7,     R7                      ; 6B15   00FF
        ADDR    R7,     R7                      ; 6B16   00FF
        ADDR    R7,     R7                      ; 6B17   00FF
        ADDR    R7,     R7                      ; 6B18   00FF
        ADDR    R7,     R7                      ; 6B19   00FF
        ADDR    R7,     R7                      ; 6B1A   00FF
        ADDR    R7,     R7                      ; 6B1B   00FF
        ADDR    R7,     R7                      ; 6B1C   00FF
        ADDR    R4,     R0                      ; 6B1D   00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6B22   0000 0000

        ADDR    R7,     R6                      ; 6B24   00FE
        ADDR    R7,     R0                      ; 6B25   00F8
        ADDR    R6,     R0                      ; 6B26   00F0
        ADDR    R0,     R0                      ; 6B27   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B28   0000 0000 0000 0000

        ADDR    R7,     R0                      ; 6B2C   00F8
        ADDR    R7,     R0                      ; 6B2D   00F8
        ADDR    R6,     R0                      ; 6B2E   00F0
        ADDR    R6,     R0                      ; 6B2F   00F0
        ADDR    R4,     R0                      ; 6B30   00E0
        ADDR    R4,     R0                      ; 6B31   00E0
        ADDR    R0,     R0                      ; 6B32   00C0
        ADDR    R0,     R0                      ; 6B33   00C0
        ADDR    R7,     R7                      ; 6B34   00FF
        ADDR    R7,     R7                      ; 6B35   00FF
        ADDR    R6,     R0                      ; 6B36   00F0
        DECLE   $0000                           ; 6B37   0000

        SETC                                    ; 6B38   0007
        SARC    R3,     2                       ; 6B39   007F
        ADDR    R7,     R7                      ; 6B3A   00FF
        ADDR    R7,     R7                      ; 6B3B   00FF
        ADDR    R7,     R4                      ; 6B3C   00FC
        TSTR    R0                              ; 6B3D   0080
        DIS                                     ; 6B3E   0003
        SARC    R3,     2                       ; 6B3F   007F
        ADDR    R7,     R7                      ; 6B40   00FF
        ADDR    R7,     R7                      ; 6B41   00FF
        ADDR    R7,     R7                      ; 6B42   00FF
        ADDR    R7,     R7                      ; 6B43   00FF
        DECLE   $0000,  $0000                   ; 6B44   0000 0000

        ADDR    R7,     R7                      ; 6B46   00FF
        ADDR    R7,     R7                      ; 6B47   00FF
        ADDR    R7,     R7                      ; 6B48   00FF
        ADDR    R7,     R7                      ; 6B49   00FF
        ADDR    R7,     R7                      ; 6B4A   00FF
        ADDR    R7,     R7                      ; 6B4B   00FF
        DECLE   $0000,  $0000                   ; 6B4C   0000 0000

        ADDR    R7,     R0                      ; 6B4E   00F8
        ADDR    R7,     R7                      ; 6B4F   00FF
        ADDR    R7,     R7                      ; 6B50   00FF
        ADDR    R7,     R7                      ; 6B51   00FF
        ADDR    R7,     R7                      ; 6B52   00FF
        ADDR    R7,     R7                      ; 6B53   00FF
        SARC    R3,     2                       ; 6B54   007F
        DECLE   $0001,  $0000,  $0000           ; 6B55   0001 0000 0000

        ADDR    R4,     R0                      ; 6B58   00E0
        ADDR    R7,     R4                      ; 6B59   00FC
        ADDR    R7,     R7                      ; 6B5A   00FF
        ADDR    R7,     R7                      ; 6B5B   00FF
        ADDR    R7,     R7                      ; 6B5C   00FF
        ADDR    R7,     R7                      ; 6B5D   00FF
        RSWD    R7                              ; 6B5E   003F
        INCR    R7                              ; 6B5F   000F
        DIS                                     ; 6B60   0003
        DECLE   $0000,  $0000                   ; 6B61   0000 0000

        TSTR    R0                              ; 6B63   0080
        ADDR    R7,     R7                      ; 6B64   00FF
        ADDR    R7,     R7                      ; 6B65   00FF
        ADDR    R6,     R0                      ; 6B66   00F0
        ADDR    R0,     R7                      ; 6B67   00C7
        DECLE   $0000                           ; 6B68   0000

        ADDR    R7,     R7                      ; 6B69   00FF
        DECLE   $0005                           ; 6B6A   0005

        ADDR    R7,     R7                      ; 6B6B   00FF
        ADDR    R7,     R7                      ; 6B6C   00FF
        DIS                                     ; 6B6D   0003
        SARC    R0,     2                       ; 6B6E   007C
        ADDR    R7,     R7                      ; 6B6F   00FF
        RSWD    R7                              ; 6B70   003F
        ADDR    R0,     R0                      ; 6B71   00C0
        ADDR    R7,     R7                      ; 6B72   00FF
        ADDR    R0,     R2                      ; 6B73   00C2
        ADDR    R7,     R7                      ; 6B74   00FF
        ADDR    R7,     R7                      ; 6B75   00FF
        INCR    R7                              ; 6B76   000F
        ADDR    R0,     R1                      ; 6B77   00C1
        ADDR    R6,     R0                      ; 6B78   00F0
        DIS                                     ; 6B79   0003
        ADDR    R7,     R7                      ; 6B7A   00FF
        ADDR    R7,     R7                      ; 6B7B   00FF
        ADDR    R7,     R7                      ; 6B7C   00FF
        ADDR    R3,     R7                      ; 6B7D   00DF
        MOVR    R5,     R7                      ; 6B7E   00AF
        RSWD    R4                              ; 6B7F   003C
        ADDR    R4,     R0                      ; 6B80   00E0
        TSTR    R0                              ; 6B81   0080
        ADDR    R5,     R0                      ; 6B82   00E8
        ADDR    R7,     R6                      ; 6B83   00FE
        ADDR    R7,     R7                      ; 6B84   00FF
        ADDR    R6,     R1                      ; 6B85   00F1
        MOVR    R0,     R4                      ; 6B86   0084
        INCR    R7                              ; 6B87   000F
        COMR    R3                              ; 6B88   001B
        RRC     R1,     1                       ; 6B89   0071
        ADDR    R4,     R6                      ; 6B8A   00E6
        ADDR    R3,     R7                      ; 6B8B   00DF
        ADDR    R7,     R7                      ; 6B8C   00FF
        ADDR    R7,     R7                      ; 6B8D   00FF
        ADDR    R7,     R7                      ; 6B8E   00FF
        SARC    R3,     2                       ; 6B8F   007F
        TSTR    R7                              ; 6B90   00BF
        ADDR    R1,     R7                      ; 6B91   00CF
        ADDR    R6,     R7                      ; 6B92   00F7
        ADDR    R7,     R7                      ; 6B93   00FF
        RSWD    R4                              ; 6B94   003C
        SWAP    R2,     1                       ; 6B95   0042
        MOVR    R3,     R1                      ; 6B96   0099
        MOVR    R4,     R1                      ; 6B97   00A1
        MOVR    R4,     R1                      ; 6B98   00A1
        MOVR    R3,     R1                      ; 6B99   0099
        SWAP    R2,     1                       ; 6B9A   0042
        RSWD    R4                              ; 6B9B   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6BB8   0000 0000 0000

        INCR    R1                              ; 6BBB   0009
        SAR     R0,     1                       ; 6BBC   0068
        RSWD    R2                              ; 6BBD   003A
        ADDR    R7,     R0                      ; 6BBE   00F8
        RSWD    R2                              ; 6BBF   003A
        INCR    R0                              ; 6BC0   0008
        RSWD    R3                              ; 6BC1   003B
        DECLE   $0000                           ; 6BC2   0000

        GSWD    R2                              ; 6BC3   0032
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDC   0000 0000 0000 0000

        MOVR    R6,     R0                      ; 6BE0   00B0
        RSWD    R2                              ; 6BE1   003A
        DECR    R0                              ; 6BE2   0010
        RSWD    R3                              ; 6BE3   003B
        DECLE   $0000                           ; 6BE4   0000

        GSWD    R2                              ; 6BE5   0032
        DECLE   $0000                           ; 6BE6   0000

        GSWD    R2                              ; 6BE7   0032
        ADDR    R5,     R5                      ; 6BE8   00ED
        RSWD    R2                              ; 6BE9   003A
        ADDR    R4,     R5                      ; 6BEA   00E5
        RSWD    R2                              ; 6BEB   003A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFC   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6C00   0000 0000
L_6C02:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C02   0000 0000 0000 0000

        RRC     R0,     1                       ; 6C06   0070
        RSWD    R2                              ; 6C07   003A
        MOVR    R5,     R0                      ; 6C08   00A8
        RSWD    R2                              ; 6C09   003A
        DECLE   $0000                           ; 6C0A   0000

        GSWD    R2                              ; 6C0B   0032
        SLR     R1,     2                       ; 6C0C   0065
        RSWD    R2                              ; 6C0D   003A
        ADDR    R6,     R5                      ; 6C0E   00F5
        RSWD    R2                              ; 6C0F   003A
        DECLE   $0005                           ; 6C10   0005

        INCR    R1                              ; 6C11   0009
        DECLE   $0005                           ; 6C12   0005

        INCR    R1                              ; 6C13   0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C28   0000 0000 0000 0000

        MOVR    R6,     R0                      ; 6C2C   00B0
        RSWD    R2                              ; 6C2D   003A
        MOVR    R3,     R0                      ; 6C2E   0098
        RSWD    R2                              ; 6C2F   003A
        DECLE   $0000                           ; 6C30   0000

        GSWD    R2                              ; 6C31   0032
        MOVR    R7,     R5                      ; 6C32   00BD
        RSWD    R2                              ; 6C33   003A
        ADDR    R0,     R5                      ; 6C34   00C5
        RSWD    R2                              ; 6C35   003A
        ADDR    R1,     R5                      ; 6C36   00CD
        RSWD    R2                              ; 6C37   003A
        ADDR    R2,     R5                      ; 6C38   00D5
        RSWD    R2                              ; 6C39   003A
        ADDR    R3,     R5                      ; 6C3A   00DD
        RSWD    R2                              ; 6C3B   003A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C50   0000 0000 0000 0000

        COMR    R0                              ; 6C54   0018
        RSWD    R3                              ; 6C55   003B
        DECLE   $0000                           ; 6C56   0000

        GSWD    R2                              ; 6C57   0032
        MOVR    R4,     R5                      ; 6C58   00A5
        RSWD    R2                              ; 6C59   003A
        DECLE   $0005                           ; 6C5A   0005

        INCR    R1                              ; 6C5B   0009
        MOVR    R2,     R5                      ; 6C5C   0095
        RSWD    R2                              ; 6C5D   003A
        MOVR    R1,     R5                      ; 6C5E   008D
        RSWD    R2                              ; 6C5F   003A
        MOVR    R0,     R5                      ; 6C60   0085
        RSWD    R2                              ; 6C61   003A
        SARC    R1,     2                       ; 6C62   007D
        RSWD    R2                              ; 6C63   003A
        DIS                                     ; 6C64   0003
        INCR    R0                              ; 6C65   0008
        DIS                                     ; 6C66   0003
        INCR    R7                              ; 6C67   000F
        RSWD    R3                              ; 6C68   003B
        INCR    R0                              ; 6C69   0008
        SWAP    R3,     1                       ; 6C6A   0043
        INCR    R0                              ; 6C6B   0008
        DIS                                     ; 6C6C   0003
        INCR    R7                              ; 6C6D   000F
        DIS                                     ; 6C6E   0003
        INCR    R7                              ; 6C6F   000F
        SAR     R3,     1                       ; 6C70   006B
        INCR    R1                              ; 6C71   0009
        RRC     R3,     1                       ; 6C72   0073
        INCR    R1                              ; 6C73   0009
        SARC    R3,     1                       ; 6C74   007B
        INCR    R1                              ; 6C75   0009
        DIS                                     ; 6C76   0003
        INCR    R7                              ; 6C77   000F
        RSWD    R3                              ; 6C78   003B
        INCR    R0                              ; 6C79   0008
        SWAP    R3,     1                       ; 6C7A   0043
        INCR    R0                              ; 6C7B   0008
        DIS                                     ; 6C7C   0003
        INCR    R7                              ; 6C7D   000F
        GSWD    R3                              ; 6C7E   0033
        INCR    R0                              ; 6C7F   0008
        DIS                                     ; 6C80   0003
        INCR    R7                              ; 6C81   000F
        DIS                                     ; 6C82   0003
        INCR    R0                              ; 6C83   0008
        DIS                                     ; 6C84   0003
        INCR    R7                              ; 6C85   000F
        DIS                                     ; 6C86   0003
        INCR    R7                              ; 6C87   000F
        RSWD    R3                              ; 6C88   003B
        INCR    R0                              ; 6C89   0008
        SWAP    R3,     1                       ; 6C8A   0043
        INCR    R0                              ; 6C8B   0008
        SAR     R3,     1                       ; 6C8C   006B
        INCR    R1                              ; 6C8D   0009
        RRC     R3,     1                       ; 6C8E   0073
        INCR    R1                              ; 6C8F   0009
        SARC    R3,     1                       ; 6C90   007B
        INCR    R1                              ; 6C91   0009
        DIS                                     ; 6C92   0003
        INCR    R7                              ; 6C93   000F
        INCR    R3                              ; 6C94   000B
        INCR    R0                              ; 6C95   0008
        SLLC    R3,     1                       ; 6C96   005B
        INCR    R1                              ; 6C97   0009
        RLC     R3,     1                       ; 6C98   0053
        INCR    R0                              ; 6C99   0008
        DIS                                     ; 6C9A   0003
        INCR    R7                              ; 6C9B   000F
        DIS                                     ; 6C9C   0003
        INCR    R7                              ; 6C9D   000F
        RLC     R3,     1                       ; 6C9E   0053
        INCR    R1                              ; 6C9F   0009
        SLLC    R3,     1                       ; 6CA0   005B
        INCR    R1                              ; 6CA1   0009
        SLR     R3,     1                       ; 6CA2   0063
        INCR    R1                              ; 6CA3   0009
        DIS                                     ; 6CA4   0003
        INCR    R7                              ; 6CA5   000F
        INCR    R3                              ; 6CA6   000B
        INCR    R0                              ; 6CA7   0008
        DECR    R3                              ; 6CA8   0013
        INCR    R0                              ; 6CA9   0008
        COMR    R3                              ; 6CAA   001B
        INCR    R0                              ; 6CAB   0008
        NEGR    R3                              ; 6CAC   0023
        INCR    R0                              ; 6CAD   0008
        SWAP    R3,     1                       ; 6CAE   0043
        INCR    R0                              ; 6CAF   0008
        DIS                                     ; 6CB0   0003
        INCR    R7                              ; 6CB1   000F
        RLC     R3,     1                       ; 6CB2   0053
        INCR    R1                              ; 6CB3   0009
        SLR     R3,     1                       ; 6CB4   0063
        INCR    R1                              ; 6CB5   0009
        DIS                                     ; 6CB6   0003
        INCR    R7                              ; 6CB7   000F
        INCR    R3                              ; 6CB8   000B
        INCR    R0                              ; 6CB9   0008
        DECR    R3                              ; 6CBA   0013
        INCR    R0                              ; 6CBB   0008
        COMR    R3                              ; 6CBC   001B
        INCR    R0                              ; 6CBD   0008
        NEGR    R3                              ; 6CBE   0023
        INCR    R0                              ; 6CBF   0008
        ADCR    R3                              ; 6CC0   002B
        INCR    R0                              ; 6CC1   0008
        SAR     R3,     1                       ; 6CC2   006B
        INCR    R1                              ; 6CC3   0009
        RRC     R3,     1                       ; 6CC4   0073
        INCR    R1                              ; 6CC5   0009
        SARC    R3,     1                       ; 6CC6   007B
        INCR    R1                              ; 6CC7   0009
        SLL     R3,     1                       ; 6CC8   004B
        INCR    R0                              ; 6CC9   0008
        RLC     R3,     1                       ; 6CCA   0053
        INCR    R0                              ; 6CCB   0008
        RLC     R3,     1                       ; 6CCC   0053
        INCR    R0                              ; 6CCD   0008
        SLLC    R3,     1                       ; 6CCE   005B
        INCR    R0                              ; 6CCF   0008
        NEGR    R3                              ; 6CD0   0023
        INCR    R1                              ; 6CD1   0009
        ADCR    R3                              ; 6CD2   002B
        INCR    R1                              ; 6CD3   0009
        GSWD    R3                              ; 6CD4   0033
        INCR    R1                              ; 6CD5   0009
        RSWD    R3                              ; 6CD6   003B
        INCR    R1                              ; 6CD7   0009
        SWAP    R3,     1                       ; 6CD8   0043
        INCR    R1                              ; 6CD9   0009
        SLL     R3,     1                       ; 6CDA   004B
        INCR    R1                              ; 6CDB   0009
        ADDR    R4,     R5                      ; 6CDC   00E5
        SLR     R0,     2                       ; 6CDD   0064

        JSRE    R4,     G_0465                  ; 6CDE   0004 0005 0065
        JSRE    R4,     G_2465                  ; 6CE1   0004 0025 0065

        INCR    R0                              ; 6CE4   0008
        DECR    R0                              ; 6CE5   0010
        DECR    R0                              ; 6CE6   0010
        RSWD    R0                              ; 6CE7   0038
        ADCR    R0                              ; 6CE8   0028
        SARC    R0,     2                       ; 6CE9   007C
        SLLC    R0,     2                       ; 6CEA   005C
        ADDR    R6,     R7                      ; 6CEB   00F7
        ADDR    R7,     R7                      ; 6CEC   00FF
        DECR    R0                              ; 6CED   0010
        DECR    R0                              ; 6CEE   0010
        RSWD    R0                              ; 6CEF   0038
        RSWD    R0                              ; 6CF0   0038
        SAR     R0,     2                       ; 6CF1   006C
        SAR     R0,     2                       ; 6CF2   006C
        ADDR    R5,     R7                      ; 6CF3   00EF
        ADDR    R7,     R7                      ; 6CF4   00FF
        DECR    R0                              ; 6CF5   0010
        DECR    R0                              ; 6CF6   0010
        RSWD    R0                              ; 6CF7   0038
        RSWD    R0                              ; 6CF8   0038
        SLLC    R0,     2                       ; 6CF9   005C
        RRC     R0,     2                       ; 6CFA   0074
        ADDR    R3,     R7                      ; 6CFB   00DF
        ADDR    R7,     R7                      ; 6CFC   00FF
        DECR    R0                              ; 6CFD   0010
        DECR    R0                              ; 6CFE   0010
        RSWD    R0                              ; 6CFF   0038
        ADCR    R0                              ; 6D00   0028
        SARC    R0,     2                       ; 6D01   007C
        SLLC    R0,     2                       ; 6D02   005C
        ADDR    R6,     R7                      ; 6D03   00F7
        ADDR    R7,     R7                      ; 6D04   00FF
        SWAP    R0,     1                       ; 6D05   0040
        DECLE   $0000                           ; 6D06   0000

        NEGR    R4                              ; 6D07   0024
        INCR    R0                              ; 6D08   0008
        SLL     R2,     1                       ; 6D09   004A
        ADCR    R4                              ; 6D0A   002C
        MOVR    R7,     R5                      ; 6D0B   00BD
        SARC    R2,     2                       ; 6D0C   007E
        INCR    R0                              ; 6D0D   0008
        NEGR    R0                              ; 6D0E   0020
        TSTR    R1                              ; 6D0F   0089
        INCR    R0                              ; 6D10   0008
        ADCR    R0                              ; 6D11   0028
        MOVR    R7,     R1                      ; 6D12   00B9
        SARC    R2,     2                       ; 6D13   007E
        SARC    R2,     2                       ; 6D14   007E
        MOVR    R0,     R2                      ; 6D15   0082

        JSR     R4,     .EXEC.054               ; 6D16   0004 0010 0054

        DECR    R5                              ; 6D19   0015
        DECR    R4                              ; 6D1A   0014
        SLLC    R1,     2                       ; 6D1B   005D
        ADDR    R7,     R5                      ; 6D1C   00FD
        DECLE   $0000                           ; 6D1D   0000

        SWAP    R0,     1                       ; 6D1E   0040
        INCR    R1                              ; 6D1F   0009
        DECLE   $0000                           ; 6D20   0000

        JSRD    R4,     L_5C5C                  ; 6D21   0004 005E 005C

        ADDR    R7,     R7                      ; 6D24   00FF
        SARC    R2,     2                       ; 6D25   007E
        DECLE   $0000                           ; 6D26   0000

        COMR    R0                              ; 6D27   0018
        DECLE   $0000                           ; 6D28   0000

        ADDR    R4,     R7                      ; 6D29   00E7
        COMR    R0                              ; 6D2A   0018
        COMR    R0                              ; 6D2B   0018
        RSWD    R4                              ; 6D2C   003C
        ADDR    R7,     R4                      ; 6D2D   00FC
        DECLE   $0000                           ; 6D2E   0000

        INCR    R4                              ; 6D2F   000C
        DECLE   $0000                           ; 6D30   0000

        ADDR    R6,     R3                      ; 6D31   00F3
        COMR    R0                              ; 6D32   0018
        COMR    R0                              ; 6D33   0018
        RSWD    R4                              ; 6D34   003C
        ADDR    R7,     R1                      ; 6D35   00F9
        DECLE   $0000                           ; 6D36   0000

        CLRC                                    ; 6D37   0006
        DECLE   $0000                           ; 6D38   0000

        ADDR    R7,     R1                      ; 6D39   00F9
        COMR    R0                              ; 6D3A   0018
        COMR    R0                              ; 6D3B   0018
        RSWD    R4                              ; 6D3C   003C
        ADDR    R6,     R3                      ; 6D3D   00F3
        DECLE   $0000                           ; 6D3E   0000

        EIS                                     ; 6D3F   0002
        DECLE   $0000                           ; 6D40   0000

        ADDR    R7,     R4                      ; 6D41   00FC
        COMR    R0                              ; 6D42   0018
        COMR    R0                              ; 6D43   0018
        RSWD    R4                              ; 6D44   003C
        ADDR    R4,     R7                      ; 6D45   00E7
        DECLE   $0000                           ; 6D46   0000

        MOVR    R0,     R1                      ; 6D47   0081
        DECLE   $0000                           ; 6D48   0000

        SARC    R2,     2                       ; 6D49   007E
        COMR    R0                              ; 6D4A   0018
        COMR    R0                              ; 6D4B   0018
        RSWD    R4                              ; 6D4C   003C
        ADDR    R1,     R7                      ; 6D4D   00CF
        DECLE   $0000                           ; 6D4E   0000

        ADDR    R0,     R0                      ; 6D4F   00C0
        DECLE   $0000                           ; 6D50   0000

        RSWD    R7                              ; 6D51   003F
        COMR    R0                              ; 6D52   0018
        COMR    R0                              ; 6D53   0018
        RSWD    R4                              ; 6D54   003C
        MOVR    R3,     R7                      ; 6D55   009F
        DECLE   $0000                           ; 6D56   0000

        SLR     R0,     1                       ; 6D57   0060
        DECLE   $0000                           ; 6D58   0000

        MOVR    R3,     R7                      ; 6D59   009F
        COMR    R0                              ; 6D5A   0018
        COMR    R0                              ; 6D5B   0018
        RSWD    R4                              ; 6D5C   003C
        RSWD    R7                              ; 6D5D   003F
        DECLE   $0000                           ; 6D5E   0000

        GSWD    R0                              ; 6D5F   0030
        DECLE   $0000                           ; 6D60   0000

        ADDR    R1,     R7                      ; 6D61   00CF
        COMR    R0                              ; 6D62   0018
        COMR    R0                              ; 6D63   0018
        RSWD    R4                              ; 6D64   003C
        COMR    R0                              ; 6D65   0018
        CMPR    R3,     R0                      ; 6D66   0158
        DECR    R0                              ; 6D67   0010
        COMR    R0                              ; 6D68   0018
        COMR    R4                              ; 6D69   001C
        COMR    R4                              ; 6D6A   001C
        RSWD    R4                              ; 6D6B   003C
        RSWD    R4                              ; 6D6C   003C
        RSWD    R4                              ; 6D6D   003C
        SARC    R0,     2                       ; 6D6E   007C
        INCR    R0                              ; 6D6F   0008
        COMR    R0                              ; 6D70   0018
        RSWD    R0                              ; 6D71   0038
        RSWD    R0                              ; 6D72   0038
        RSWD    R4                              ; 6D73   003C
        RSWD    R4                              ; 6D74   003C
        RSWD    R4                              ; 6D75   003C
        RSWD    R6                              ; 6D76   003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D77   0000 0000 0000 0000
        DECLE   $0000                           ; 6D7B   0000

        ADDR    R4,     R0                      ; 6D7C   00E0
        ADDR    R7,     R4                      ; 6D7D   00FC
        ADDR    R7,     R4                      ; 6D7E   00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7F   0000 0000 0000 0000
        DECLE   $0000                           ; 6D83   0000

        ADDR    R7,     R7                      ; 6D84   00FF
        ADDR    R7,     R7                      ; 6D85   00FF
        ADDR    R7,     R7                      ; 6D86   00FF
        ADDR    R7,     R7                      ; 6D87   00FF
        ADDR    R6,     R7                      ; 6D88   00F7
        ADDR    R6,     R7                      ; 6D89   00F7
        ADDR    R6,     R7                      ; 6D8A   00F7
        RRC     R3,     2                       ; 6D8B   0077
        RRC     R3,     1                       ; 6D8C   0073
        RRC     R3,     1                       ; 6D8D   0073
        RRC     R3,     1                       ; 6D8E   0073
        DECLE   $0000                           ; 6D8F   0000

        EIS                                     ; 6D90   0002
        DECLE   $0005                           ; 6D91   0005

        INCR    R0                              ; 6D92   0008
        DECLE   $0000                           ; 6D93   0000

        GSWD    R0                              ; 6D94   0030
        COMR    R4                              ; 6D95   001C
        INCR    R7                              ; 6D96   000F
        DECLE   $0000                           ; 6D97   0000

        SWAP    R0,     1                       ; 6D98   0040
        MOVR    R4,     R0                      ; 6D99   00A0
        DECR    R0                              ; 6D9A   0010
        DECLE   $0000                           ; 6D9B   0000

        INCR    R4                              ; 6D9C   000C
        RSWD    R0                              ; 6D9D   0038
        ADDR    R6,     R0                      ; 6D9E   00F0
        DECLE   $0000,  $0000,  $0000           ; 6D9F   0000 0000 0000

        TSTR    R0                              ; 6DA2   0080
        SWAP    R0,     1                       ; 6DA3   0040
        NEGR    R0                              ; 6DA4   0020
        DECR    R0                              ; 6DA5   0010
        INCR    R0                              ; 6DA6   0008
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6DA7   0000 0000 0000 0001

        EIS                                     ; 6DAB   0002

        JSR     R4,     G_0810                  ; 6DAC   0004 0008 0010

        ADDR    R7,     R7                      ; 6DAF   00FF
        ADDR    R7,     R7                      ; 6DB0   00FF
        ADDR    R7,     R7                      ; 6DB1   00FF
        ADDR    R7,     R0                      ; 6DB2   00F8
        ADDR    R7,     R0                      ; 6DB3   00F8
        ADDR    R4,     R0                      ; 6DB4   00E0
        INCR    R2                              ; 6DB5   000A
        DECLE   $0000                           ; 6DB6   0000

        ADDR    R1,     R4                      ; 6DB7   00CC
        MOVR    R1,     R4                      ; 6DB8   008C
        MOVR    R1,     R4                      ; 6DB9   008C
        MOVR    R1,     R4                      ; 6DBA   008C
        MOVR    R1,     R4                      ; 6DBB   008C
        INCR    R5                              ; 6DBC   000D
        INCR    R5                              ; 6DBD   000D
        INCR    R5                              ; 6DBE   000D
        GSWD    R3                              ; 6DBF   0033
        GSWD    R1                              ; 6DC0   0031
        GSWD    R1                              ; 6DC1   0031
        GSWD    R1                              ; 6DC2   0031
        GSWD    R1                              ; 6DC3   0031
        MOVR    R6,     R0                      ; 6DC4   00B0
        MOVR    R6,     R0                      ; 6DC5   00B0
        MOVR    R6,     R0                      ; 6DC6   00B0
        ADDR    R7,     R7                      ; 6DC7   00FF
        MOVR    R0,     R3                      ; 6DC8   0083
        MOVR    R5,     R3                      ; 6DC9   00AB
        ADDR    R7,     R7                      ; 6DCA   00FF
        SLLC    R3,     2                       ; 6DCB   005F
        ADDR    R3,     R7                      ; 6DCC   00DF
        MOVR    R3,     R7                      ; 6DCD   009F
        EIS                                     ; 6DCE   0002
        ADDR    R7,     R7                      ; 6DCF   00FF
        ADDR    R7,     R7                      ; 6DD0   00FF
        ADDR    R7,     R7                      ; 6DD1   00FF
        ADDR    R5,     R7                      ; 6DD2   00EF
        MOVR    R4,     R7                      ; 6DD3   00A7
        MOVR    R0,     R7                      ; 6DD4   0087
        MOVR    R4,     R5                      ; 6DD5   00A5
        TSTR    R0                              ; 6DD6   0080
        ADDR    R7,     R7                      ; 6DD7   00FF
        ADDR    R6,     R1                      ; 6DD8   00F1
        ADDR    R6,     R4                      ; 6DD9   00F4
        ADDR    R6,     R0                      ; 6DDA   00F0
        TSTR    R2                              ; 6DDB   0092
        MOVR    R2,     R0                      ; 6DDC   0090
        MOVR    R0,     R4                      ; 6DDD   0084
        NEGR    R0                              ; 6DDE   0020
        ADDR    R7,     R7                      ; 6DDF   00FF
        ADDR    R7,     R6                      ; 6DE0   00FE
        ADDR    R7,     R6                      ; 6DE1   00FE
        ADDR    R7,     R4                      ; 6DE2   00FC
        ADDR    R6,     R4                      ; 6DE3   00F4
        ADDR    R6,     R0                      ; 6DE4   00F0
        ADDR    R2,     R0                      ; 6DE5   00D0
        TSTR    R0                              ; 6DE6   0080
        DECLE   $0000                           ; 6DE7   0000

        SETC                                    ; 6DE8   0007
        COMR    R7                              ; 6DE9   001F
        ADDR    R7,     R7                      ; 6DEA   00FF
        ADDR    R7,     R7                      ; 6DEB   00FF
        ADDR    R7,     R7                      ; 6DEC   00FF
        ADDR    R7,     R7                      ; 6DED   00FF
        ADDR    R7,     R7                      ; 6DEE   00FF
        DECLE   $0000,  $0000,  $0000           ; 6DEF   0000 0000 0000

        ADDR    R7,     R0                      ; 6DF2   00F8
        ADDR    R7,     R7                      ; 6DF3   00FF
        DECLE   $0000                           ; 6DF4   0000

        ADDR    R4,     R0                      ; 6DF5   00E0
        ADDR    R7,     R7                      ; 6DF6   00FF
        RSWD    R7                              ; 6DF7   003F
        RSWD    R7                              ; 6DF8   003F
        INCR    R7                              ; 6DF9   000F
        INCR    R7                              ; 6DFA   000F
        INCR    R7                              ; 6DFB   000F
        INCR    R7                              ; 6DFC   000F
        INCR    R7                              ; 6DFD   000F
        INCR    R7                              ; 6DFE   000F
        DECLE   $0000                           ; 6DFF   0000

        SLR     R2,     2                       ; 6E00   0066
        COMR    R0                              ; 6E01   0018
        SLR     R2,     2                       ; 6E02   0066
        SLR     R2,     2                       ; 6E03   0066
        COMR    R0                              ; 6E04   0018
        SLR     R2,     2                       ; 6E05   0066
        DECLE   $0000,  $0000,  $0000           ; 6E06   0000 0000 0000

        ADDR    R0,     R0                      ; 6E09   00C0
        ADDR    R0,     R0                      ; 6E0A   00C0
        ADDR    R0,     R0                      ; 6E0B   00C0
        ADDR    R0,     R0                      ; 6E0C   00C0
        ADDR    R7,     R7                      ; 6E0D   00FF
        ADDR    R7,     R7                      ; 6E0E   00FF
        DECLE   $0000,  $0000                   ; 6E0F   0000 0000

        EIS                                     ; 6E11   0002
        DIS                                     ; 6E12   0003
        DIS                                     ; 6E13   0003
        DIS                                     ; 6E14   0003
        ADDR    R7,     R7                      ; 6E15   00FF
        ADDR    R7,     R7                      ; 6E16   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E17   0000 0000 0000 0000
        DECLE   $0000                           ; 6E1B   0000

        SETC                                    ; 6E1C   0007
        RSWD    R7                              ; 6E1D   003F
        RSWD    R7                              ; 6E1E   003F
        ADDR    R7,     R7                      ; 6E1F   00FF
        ADDR    R7,     R3                      ; 6E20   00FB
        ADDR    R7,     R3                      ; 6E21   00FB
        ADDR    R6,     R1                      ; 6E22   00F1
        ADDR    R6,     R1                      ; 6E23   00F1
        ADDR    R2,     R1                      ; 6E24   00D1
        RLC     R1,     1                       ; 6E25   0051
        DECLE   $0000                           ; 6E26   0000

        ADDR    R7,     R7                      ; 6E27   00FF
        ADDR    R5,     R7                      ; 6E28   00EF
        ADDR    R5,     R7                      ; 6E29   00EF
        ADDR    R5,     R7                      ; 6E2A   00EF
        ADDR    R5,     R6                      ; 6E2B   00EE
        ADDR    R1,     R6                      ; 6E2C   00CE
        ADDR    R1,     R6                      ; 6E2D   00CE
        ADDR    R1,     R6                      ; 6E2E   00CE
        ADDR    R7,     R7                      ; 6E2F   00FF
        ADDR    R3,     R7                      ; 6E30   00DF
        ADDR    R3,     R7                      ; 6E31   00DF
        MOVR    R1,     R7                      ; 6E32   008F
        MOVR    R1,     R7                      ; 6E33   008F
        MOVR    R1,     R3                      ; 6E34   008B
        MOVR    R1,     R2                      ; 6E35   008A
        DECLE   $0000                           ; 6E36   0000

        RSWD    R7                              ; 6E37   003F
        RSWD    R7                              ; 6E38   003F
        RSWD    R3                              ; 6E39   003B
        RSWD    R3                              ; 6E3A   003B
        COMR    R3                              ; 6E3B   001B
        DECR    R1                              ; 6E3C   0011
        DECR    R1                              ; 6E3D   0011
        DECLE   $0000                           ; 6E3E   0000

        ADDR    R7,     R4                      ; 6E3F   00FC
        ADDR    R7,     R4                      ; 6E40   00FC
        ADDR    R3,     R4                      ; 6E41   00DC
        ADDR    R3,     R4                      ; 6E42   00DC
        ADDR    R3,     R0                      ; 6E43   00D8
        MOVR    R1,     R0                      ; 6E44   0088
        MOVR    R1,     R0                      ; 6E45   0088
        DECLE   $0000                           ; 6E46   0000

        DIS                                     ; 6E47   0003
        INCR    R7                              ; 6E48   000F
        RSWD    R7                              ; 6E49   003F
        ADDR    R7,     R4                      ; 6E4A   00FC
        ADDR    R0,     R0                      ; 6E4B   00C0
        DECLE   $0000                           ; 6E4C   0000

        INCR    R5                              ; 6E4D   000D
        ADDR    R3,     R7                      ; 6E4E   00DF
        ADDR    R0,     R0                      ; 6E4F   00C0
        ADDR    R6,     R0                      ; 6E50   00F0
        ADDR    R7,     R4                      ; 6E51   00FC
        RSWD    R7                              ; 6E52   003F
        DIS                                     ; 6E53   0003
        DECLE   $0000                           ; 6E54   0000

        MOVR    R6,     R0                      ; 6E55   00B0
        ADDR    R7,     R3                      ; 6E56   00FB
        ADDR    R0,     R0                      ; 6E57   00C0
        ADDR    R0,     R0                      ; 6E58   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E59   0000 0000 0000 0000

        MOVR    R7,     R0                      ; 6E5D   00B8
        ADDR    R7,     R4                      ; 6E5E   00FC
        DIS                                     ; 6E5F   0003
        DIS                                     ; 6E60   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E61   0000 0000 0000 0000

        COMR    R5                              ; 6E65   001D
        RSWD    R7                              ; 6E66   003F
        ADDR    R7,     R7                      ; 6E67   00FF
        ADDR    R0,     R1                      ; 6E68   00C1
        ADDR    R2,     R5                      ; 6E69   00D5
        ADDR    R7,     R7                      ; 6E6A   00FF
        ADDR    R7,     R2                      ; 6E6B   00FA
        ADDR    R7,     R3                      ; 6E6C   00FB
        ADDR    R7,     R1                      ; 6E6D   00F9
        ADDR    R0,     R0                      ; 6E6E   00C0
        ADDR    R7,     R7                      ; 6E6F   00FF
        SARC    R3,     2                       ; 6E70   007F
        SARC    R3,     2                       ; 6E71   007F
        RSWD    R7                              ; 6E72   003F
        ADCR    R7                              ; 6E73   002F
        INCR    R7                              ; 6E74   000F
        INCR    R3                              ; 6E75   000B
        DECLE   $0001                           ; 6E76   0001

        ADDR    R7,     R7                      ; 6E77   00FF
        ADDR    R7,     R7                      ; 6E78   00FF
        ADDR    R7,     R7                      ; 6E79   00FF
        COMR    R7                              ; 6E7A   001F
        COMR    R7                              ; 6E7B   001F
        SETC                                    ; 6E7C   0007
        RLC     R0,     1                       ; 6E7D   0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7E   0000 0000 0000 0000

        COMR    R7                              ; 6E82   001F
        ADDR    R7,     R7                      ; 6E83   00FF
        DECLE   $0000                           ; 6E84   0000

        SETC                                    ; 6E85   0007
        ADDR    R7,     R7                      ; 6E86   00FF
        DECLE   $0000                           ; 6E87   0000

        ADDR    R4,     R0                      ; 6E88   00E0
        ADDR    R7,     R0                      ; 6E89   00F8
        ADDR    R7,     R7                      ; 6E8A   00FF
        ADDR    R7,     R7                      ; 6E8B   00FF
        ADDR    R7,     R7                      ; 6E8C   00FF
        ADDR    R7,     R7                      ; 6E8D   00FF
        ADDR    R7,     R7                      ; 6E8E   00FF
        ADDR    R7,     R4                      ; 6E8F   00FC
        ADDR    R7,     R4                      ; 6E90   00FC
        ADDR    R6,     R0                      ; 6E91   00F0
        ADDR    R6,     R0                      ; 6E92   00F0
        ADDR    R6,     R0                      ; 6E93   00F0
        ADDR    R6,     R0                      ; 6E94   00F0
        ADDR    R6,     R0                      ; 6E95   00F0
        ADDR    R6,     R0                      ; 6E96   00F0
        ADDR    R7,     R7                      ; 6E97   00FF
        ADDR    R7,     R7                      ; 6E98   00FF
        ADDR    R7,     R7                      ; 6E99   00FF
        ADDR    R7,     R7                      ; 6E9A   00FF
        ADDR    R7,     R7                      ; 6E9B   00FF
        ADDR    R7,     R7                      ; 6E9C   00FF
        ADDR    R7,     R7                      ; 6E9D   00FF
        ADDR    R7,     R7                      ; 6E9E   00FF
        ADDR    R7,     R7                      ; 6E9F   00FF
        ADDR    R7,     R7                      ; 6EA0   00FF
        ADDR    R7,     R7                      ; 6EA1   00FF
        ADDR    R7,     R7                      ; 6EA2   00FF
        ADDR    R7,     R7                      ; 6EA3   00FF
        ADDR    R7,     R7                      ; 6EA4   00FF
        DECLE   $0000,  $0000                   ; 6EA5   0000 0000

        ADDR    R7,     R7                      ; 6EA7   00FF
        ADDR    R7,     R7                      ; 6EA8   00FF
        ADDR    R7,     R7                      ; 6EA9   00FF
        ADDR    R7,     R7                      ; 6EAA   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAB   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 6EAF   00FF
        ADDR    R7,     R7                      ; 6EB0   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF1   0000 0000 0000 0000

        COMR    R2                              ; 6EF5   001A
        INCR    R0                              ; 6EF6   0008
        ADDR    R1,     R2                      ; 6EF7   00CA
        INCR    R0                              ; 6EF8   0008
        GSWD    R2                              ; 6EF9   0032
        INCR    R0                              ; 6EFA   0008
        GSWD    R2                              ; 6EFB   0032
        INCR    R0                              ; 6EFC   0008
        ADCR    R2                              ; 6EFD   002A
        INCR    R0                              ; 6EFE   0008
        NEGR    R2                              ; 6EFF   0022
        INCR    R0                              ; 6F00   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F15   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6F19   0000 0000

        ADDR    R3,     R0                      ; 6F1B   00D8
        INCR    R4                              ; 6F1C   000C
        SWAP    R0,     1                       ; 6F1D   0040
        INCR    R4                              ; 6F1E   000C
        RLC     R0,     1                       ; 6F1F   0050
        INCR    R4                              ; 6F20   000C
        DECLE   $0000                           ; 6F21   0000

        JSR     R4,     .STIC.X.4               ; 6F22   0004 0000 0004

        SLLC    R0,     1                       ; 6F25   0058
        INCR    R4                              ; 6F26   000C
        SLL     R0,     1                       ; 6F27   0048
        INCR    R4                              ; 6F28   000C
        RSWD    R0                              ; 6F29   0038
        INCR    R4                              ; 6F2A   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F33   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6F37   0000 0000

        CLRC                                    ; 6F39   0006
        INCR    R0                              ; 6F3A   0008
        RSWD    R0                              ; 6F3B   0038
        INCR    R7                              ; 6F3C   000F
        MOVR    R4,     R0                      ; 6F3D   00A0
        INCR    R6                              ; 6F3E   000E
        MOVR    R6,     R2                      ; 6F3F   00B2
        INCR    R6                              ; 6F40   000E
        MOVR    R5,     R0                      ; 6F41   00A8
        INCR    R6                              ; 6F42   000E
        SAR     R0,     1                       ; 6F43   0068
        INCR    R4                              ; 6F44   000C
        DECR    R0                              ; 6F45   0010
        INCR    R5                              ; 6F46   000D
        DECLE   $0000                           ; 6F47   0000

        INCR    R5                              ; 6F48   000D
        DECLE   $0000                           ; 6F49   0000

        JSR     R4,     .STIC.X.4               ; 6F4A   0004 0000 0004

        ADDR    R7,     R0                      ; 6F4D   00F8
        INCR    R4                              ; 6F4E   000C
        INCR    R0                              ; 6F4F   0008
        INCR    R5                              ; 6F50   000D
        RRC     R0,     1                       ; 6F51   0070
        INCR    R4                              ; 6F52   000C
        SWAP    R0,     1                       ; 6F53   0040
        INCR    R7                              ; 6F54   000F
        MOVR    R6,     R2                      ; 6F55   00B2
        INCR    R6                              ; 6F56   000E
        GSWD    R0                              ; 6F57   0030
        INCR    R7                              ; 6F58   000F
        MOVR    R3,     R0                      ; 6F59   0098
        INCR    R6                              ; 6F5A   000E
        CLRC                                    ; 6F5B   0006
        INCR    R0                              ; 6F5C   0008
        DECLE   $0000,  $0000,  $0001,  $0000   ; 6F5D   0000 0000 0001 0000

        SARC    R2,     1                       ; 6F61   007A
        INCR    R0                              ; 6F62   0008
        ADCR    R0                              ; 6F63   0028
        ADCR    R5                              ; 6F64   002D
        MOVR    R1,     R0                      ; 6F65   0088
        INCR    R4                              ; 6F66   000C
        TSTR    R0                              ; 6F67   0080
        INCR    R6                              ; 6F68   000E
        ADDR    R0,     R2                      ; 6F69   00C2
        INCR    R6                              ; 6F6A   000E
        DECLE   $0000                           ; 6F6B   0000

        JSR     R4,     G_E80C                  ; 6F6C   0004 00E8 000C

        ADDR    R4,     R0                      ; 6F6F   00E0
        INCR    R4                              ; 6F70   000C
        INCR    R6                              ; 6F71   000E
        INCR    R0                              ; 6F72   0008
        INCR    R6                              ; 6F73   000E
        INCR    R0                              ; 6F74   0008
        ADDR    R2,     R0                      ; 6F75   00D0
        INCR    R4                              ; 6F76   000C
        ADDR    R6,     R0                      ; 6F77   00F0
        INCR    R4                              ; 6F78   000C
        DECLE   $0000                           ; 6F79   0000

        JSRD    R4,     G_B80E                  ; 6F7A   0004 00BA 000E

        TSTR    R0                              ; 6F7D   0080
        INCR    R4                              ; 6F7E   000C
        MOVR    R1,     R0                      ; 6F7F   0088
        INCR    R6                              ; 6F80   000E
        SLR     R0,     1                       ; 6F81   0060
        COMR    R0                              ; 6F82   0018
        COMR    R2                              ; 6F83   001A
        INCR    R1                              ; 6F84   0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F85   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6F89   0000 0000

        COMR    R0                              ; 6F8B   0018
        COMR    R4                              ; 6F8C   001C
        DECR    R0                              ; 6F8D   0010
        COMR    R4                              ; 6F8E   001C
        DECR    R0                              ; 6F8F   0010
        COMR    R4                              ; 6F90   001C
        DECR    R0                              ; 6F91   0010
        COMR    R4                              ; 6F92   001C
        DECR    R0                              ; 6F93   0010
        COMR    R4                              ; 6F94   001C
        DECR    R0                              ; 6F95   0010
        COMR    R4                              ; 6F96   001C
        DECR    R0                              ; 6F97   0010
        COMR    R4                              ; 6F98   001C
        DECR    R0                              ; 6F99   0010
        COMR    R4                              ; 6F9A   001C
        DECR    R0                              ; 6F9B   0010
        COMR    R4                              ; 6F9C   001C
        DECR    R0                              ; 6F9D   0010
        COMR    R4                              ; 6F9E   001C
        DECR    R0                              ; 6F9F   0010
        COMR    R4                              ; 6FA0   001C
        DECR    R0                              ; 6FA1   0010
        COMR    R4                              ; 6FA2   001C
        DECR    R0                              ; 6FA3   0010
        COMR    R4                              ; 6FA4   001C
        DECR    R0                              ; 6FA5   0010
        COMR    R4                              ; 6FA6   001C
        DECR    R0                              ; 6FA7   0010
        COMR    R4                              ; 6FA8   001C
        COMR    R0                              ; 6FA9   0018
        COMR    R4                              ; 6FAA   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAF   0000 0000 0000 0000

        NEGR    R2                              ; 6FB3   0022
        INCR    R1                              ; 6FB4   0009
        SLL     R2,     1                       ; 6FB5   004A
        INCR    R1                              ; 6FB6   0009
        SLL     R2,     1                       ; 6FB7   004A
        INCR    R1                              ; 6FB8   0009
        SLL     R2,     1                       ; 6FB9   004A
        INCR    R1                              ; 6FBA   0009
        SLL     R2,     1                       ; 6FBB   004A
        INCR    R1                              ; 6FBC   0009
        SLL     R2,     1                       ; 6FBD   004A
        INCR    R1                              ; 6FBE   0009
        SLL     R2,     1                       ; 6FBF   004A
        INCR    R1                              ; 6FC0   0009
        SLL     R2,     1                       ; 6FC1   004A
        INCR    R1                              ; 6FC2   0009
        SLL     R2,     1                       ; 6FC3   004A
        INCR    R1                              ; 6FC4   0009
        SLL     R2,     1                       ; 6FC5   004A
        INCR    R1                              ; 6FC6   0009
        SLL     R2,     1                       ; 6FC7   004A
        INCR    R1                              ; 6FC8   0009
        SLL     R2,     1                       ; 6FC9   004A
        INCR    R1                              ; 6FCA   0009
        SLL     R2,     1                       ; 6FCB   004A
        INCR    R1                              ; 6FCC   0009
        SLL     R2,     1                       ; 6FCD   004A
        INCR    R1                              ; 6FCE   0009
        SLL     R2,     1                       ; 6FCF   004A
        INCR    R1                              ; 6FD0   0009
        TSTR    R2                              ; 6FD1   0092
        INCR    R0                              ; 6FD2   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE7   0000 0000 0000 0000
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
