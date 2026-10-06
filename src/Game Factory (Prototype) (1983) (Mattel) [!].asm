
        ORG     $5000
.HEADER:
        BIDECLE $4085           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5096           ; 5004  Ptr: Start of game
        BIDECLE $552E           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $551D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5026           ; 500A  Ptr: Date/Title
        DECLE   $0180           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0006,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $00B3,  $0060,  $0002,  $0000; 501C  Timer dispatch/interval
        DECLE   $007F,  $0094,  $0001,  $0000; 5020  Timer dispatch/interval
        BIDECLE $0000           ; 5024  End of timer table

.TITLE:
        DECLE   $0052                           ; 5026  Cartridge year
        DECLE   $0000                           ; 5027  

.TITLECODE:
        ADDI    #$0003, R5                      ; 5028   02FD 0003
        PSHR    R5                              ; 502A   0275
        CLRR    R3                              ; 502B   01DB
        MVO     R3,     .STIC.CS.0              ; 502C   0243 0028
        MVO     R3,     .STIC.BORD              ; 502E   0243 002C
        MVI     G_0172, R0                      ; 5030   0280 0172
        TSTR    R0                              ; 5032   0080
        BNEQ    L_5092                          ; 5033   020C 005D

        SDBD                                    ; 5035   0001
        MVII    #$0800, R0                      ; 5036   02B8 0000 0008
        SDBD                                    ; 5039   0001
        MVII    #$8800, R4                      ; 503A   02BC 0000 0088

        JSR     R5,     X_FILL_ZERO             ; 503D   0004 0114 0338

        MVI     .BTAB.25,R0                     ; 5040   0280 0225
        XORI    #$0007, R0                      ; 5042   03F8 0007
        MVO     R0,     .BTAB.25                ; 5044   0240 0225
        MVII    #$023D, R4                      ; 5046   02BC 023D
        MVII    #$000D, R3                      ; 5048   02BB 000D
        MVO     R3,     G_017B                  ; 504A   0243 017B

        JSR     R5,     L_DDD3                  ; 504C   0004 01DC 01D3
        DECLE   $0180,  $0273,  $008B,  $0344   ; 504F   0180 0273 008B 0344
        DECLE   $0164,  $0053,  $022E           ; 5053   0164 0053 022E

        ANDR    R5,     R0                      ; 5056   01A8
        RLC     R2,     1                       ; 5057   0052
        AND@    R3,     R2                      ; 5058   039A
        CMP@    R3,     R2                      ; 5059   035A
        CMP@    R3,     R2                      ; 505A   035A
        XORR    R6,     R1                      ; 505B   01F1
        TSTR    R2                              ; 505C   0092
        MOVR    R1,     R5                      ; 505D   008D
        PSHR    R2                              ; 505E   0272
        XOR     .BTAB.BC,R0                     ; 505F   03C0 02BC
        ADD@    R1,     R1                      ; 5061   02C9

        JSR     R5,     L_DDD3                  ; 5062   0004 01DC 01D3
        DECLE   $035A,  $035E,  $029E,  $005E   ; 5065   035A 035E 029E 005E
        DECLE   $015E,  $013E,  $009A,  $0180   ; 5069   015E 013E 009A 0180
        DECLE   $0273,  $008B,  $035A,  $035E   ; 506D   0273 008B 035A 035E
        DECLE   $0000,  $02B8,  $0006,  $0240   ; 5071   0000 02B8 0006 0240
        DECLE   $017B,  $02BC,  $0290,  $0004   ; 5075   017B 02BC 0290 0004
        DECLE   $01DC,  $01D8                   ; 5079   01DC 01D8

        SARC    R0,     1                       ; 507B   0078
        ADDR    R3,     R6                      ; 507C   00DE
        EIS                                     ; 507D   0002
        MVII    #$0070, R1                      ; 507E   02B9 0070
        SWAP    R1,     1                       ; 5080   0041
        MVI@    R1,     R0                      ; 5081   0288
        SDBD                                    ; 5082   0001
        ANDI    #$FC00, R0                      ; 5083   03B8 0000 00FC
        BNEQ    L_514B                          ; 5086   020C 00C3

        JSR     R5,     L_53B4                  ; 5088   0004 0150 03B4
        DECLE   $02B8,  $000B,  $0240,  $018B   ; 508B   02B8 000B 0240 018B
        DECLE   $0004                           ; 508F   0004

        ANDR    R2,     R0                      ; 5090   0190
        CMPR    R3,     R4                      ; 5091   015C
L_5092:
        CLRR    R0                              ; 5092   01C0
        MVO     R0,     G_01AD                  ; 5093   0240 01AD
        PULR    R7                              ; 5095   02B7

.START:
        MVII    #$0003, R0                      ; 5096   02B8 0003
        MVO     R0,     G_0103                  ; 5098   0240 0103
        SDBD                                    ; 509A   0001
        MVII    #$5209, R0                      ; 509B   02B8 0009 0052
        MVO     R0,     .ISRVEC.0               ; 509E   0240 0100
        SWAP    R0,     1                       ; 50A0   0040
        MVO     R0,     .ISRVEC.1               ; 50A1   0240 0101
        MVII    #$0080, R0                      ; 50A3   02B8 0080
        MVO     R0,     G_0126                  ; 50A5   0240 0126
        MVO     R0,     G_0128                  ; 50A7   0240 0128
        MVII    #$0004, R0                      ; 50A9   02B8 0004
        MVO     R0,     G_0176                  ; 50AB   0240 0176
        EIS                                     ; 50AD   0002

        JSR     R5,     L_50D0                  ; 50AE   0004 0150 00D0

L_50B1:
        EIS                                     ; 50B1   0002
        MVI     G_0102, R0                      ; 50B2   0280 0102
        DECR    R0                              ; 50B4   0010
        BPL     L_50B1                          ; 50B5   0223 0005

        MVI     G_0103, R1                      ; 50B7   0281 0103
        MVO     R1,     G_0102                  ; 50B9   0241 0102
        NEGR    R0                              ; 50BB   0020

        JSR     R5,     X_RAND1                 ; 50BC   0004 0114 027D
        JSR     R5,     L_514C                  ; 50BF   0004 0150 014C
        JSR     R5,     .EXEC.7D5               ; 50C2   0004 0114 03D5
        JSR     R5,     .EXEC.4F1               ; 50C5   0004 0114 00F1
        JSR     R5,     L_52B9                  ; 50C8   0004 0150 02B9
        JSR     R5,     .EXEC.AAD               ; 50CB   0004 0118 02AD

        B       L_50B1                          ; 50CE   0220 001E

L_50D0:
        PSHR    R5                              ; 50D0   0275

        JSR     R5,     L_5401                  ; 50D1   0004 0154 0001
        BIDECLE $50D7                           ; 50D4   00D7 0050

        PULR    R7                              ; 50D6   02B7

        DECLE   $0271,  $0027,  $0051,  $002E   ; 50D7   0271 0027 0051 002E
        DECLE   $0051,  $0028,  $0000,  $0003   ; 50DB   0051 0028 0000 0003
        DECLE   $0000,  $02F4,  $003C,  $02F2   ; 50DF   0000 02F4 003C 02F2
        DECLE   $0218                           ; 50E3   0218

        SARC    R0,     1                       ; 50E4   0078
        ADDR    R3,     R6                      ; 50E5   00DE
        ADD@    R6,     R7                      ; 50E6   02F7

        DECLE   $0001,  $02DE,  $0053,  $017E   ; 50E7   0001 02DE 0053 017E
        DECLE   $01C6,  $035A,  $0351,  $028D   ; 50EB   01C6 035A 0351 028D
        DECLE   $0346,  $000C,  $009E,  $0000   ; 50EF   0346 000C 009E 0000

        ADD@    R6,     R3                      ; 50F3   02F3
        RLC     R0,     1                       ; 50F4   0050
        ADD@    R6,     R7                      ; 50F5   02F7

        INCR    R5                              ; 50F6   000D
        ADD@    R6,     R1                      ; 50F7   02F1
        MVII    #$00E9, R0                      ; 50F8   02B8 00E9
        MVO     R0,     .BTAB.E4                ; 50FA   0240 02E4
        MVII    #$0080, R0                      ; 50FC   02B8 0080
        MVO     R0,     G_0355                  ; 50FE   0240 0355
        MOVR    R7,     R0                      ; 5100   00B8
        ADDI    #$0044, R0                      ; 5101   02F8 0044
        MVO     R0,     G_0356                  ; 5103   0240 0356
        MVII    #$03F0, R0                      ; 5105   02B8 03F0
        MVO     R0,     G_035A                  ; 5107   0240 035A
        SDBD                                    ; 5109   0001
        MVII    #$0987, R1                      ; 510A   02B9 0087 0009
        MVII    #$0201, R4                      ; 510D   02BC 0201
        MVII    #$0012, R0                      ; 510F   02B8 0012

        JSR     R5,     X_FILL_MEM              ; 5111   0004 0114 0341

        MVII    #$0229, R4                      ; 5114   02BC 0229

        JSR     R5,     X_FILL_MEM              ; 5116   0004 0114 0341
        DECLE   $0004,  $01DC,  $01A3,  $0091   ; 5119   0004 01DC 01A3 0091
        DECLE   $00DE,  $00BB,  $00DE,  $0253   ; 511D   00DE 00BB 00DE 0253
        DECLE   $0280,  $0165,  $0004           ; 5121   0280 0165 0004

        XORR    R7,     R4                      ; 5124   01FC
        CMP@    R2,     R6                      ; 5125   0356
        PULR    R7                              ; 5126   02B7

        DECLE   $0275,  $0004                   ; 5127   0275 0004

        XORR    R7,     R4                      ; 5129   01FC
        CMP     .BTAB.40,R5                     ; 512A   0345 0240
        CMPR    R4,     R5                      ; 512C   0165
        PULR    R7                              ; 512D   02B7

        PSHR    R5                              ; 512E   0275
        MVI     G_0165, R5                      ; 512F   0285 0165
        ADDR    R5,     R5                      ; 5131   00ED
        ADDR    R7,     R5                      ; 5132   00FD
        ADDI    #$0008, R5                      ; 5133   02FD 0008
        SDBD                                    ; 5135   0001
        MVI@    R5,     R4                      ; 5136   02AC

        JSR     R5,     L_5403                  ; 5137   0004 0154 0003

        PULR    R7                              ; 513A   02B7

        RSWD    R1                              ; 513B   0039
        SLLC    R3,     2                       ; 513C   005F
        ADDR    R4,     R6                      ; 513D   00E6
        SAR     R1,     1                       ; 513E   0069
        MOVR    R5,     R7                      ; 513F   00AF
        ADDR    R2,     R7                      ; 5140   00D7

        DECLE   $0051,  $00AE,  $0000,  $0090   ; 5141   0051 00AE 0000 0090
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5145   0000 0000 0000 0000

        EIS                                     ; 5149   0002
        MOVR    R0,     R2                      ; 514A   0082
L_514B:
        DECR    R7                              ; 514B   0017

L_514C:
        PSHR    R5                              ; 514C   0275
        CLRR    R0                              ; 514D   01C0
        MVII    #$031D, R1                      ; 514E   02B9 031D
        MVII    #$0001, R2                      ; 5150   02BA 0001
        B       L_5173                          ; 5152   0200 001F

L_5154:
        MVO     R0,     G_011B                  ; 5154   0240 011B
        MVO     R1,     G_031B                  ; 5156   0241 031B
        MVO     R2,     G_011C                  ; 5158   0242 011C

        JSR     R5,     L_5178                  ; 515A   0004 0150 0178

        MOVR    R0,     R1                      ; 515D   0081
        RLC     R1,     1                       ; 515E   0051

        JSR     R5,     L_5178                  ; 515F   0004 0150 0178

        ADDR    R4,     R0                      ; 5162   00E0
        RLC     R1,     1                       ; 5163   0051

        JSR     R5,     L_5178                  ; 5164   0004 0150 0178

        ADDR    R7,     R1                      ; 5167   00F9
        DECR    R3                              ; 5168   0013
L_5169:
        MVI     G_011C, R2                      ; 5169   0282 011C
        SLL     R2,     1                       ; 516B   004A
        MVI     G_031B, R1                      ; 516C   0281 031B
        ADDI    #$0008, R1                      ; 516E   02F9 0008
        MVI     G_011B, R0                      ; 5170   0280 011B
        INCR    R0                              ; 5172   0008
L_5173:
        CMP     G_0104, R0                      ; 5173   0340 0104
        BLT     L_5154                          ; 5175   0225 0022
L_5177:
        PULR    R7                              ; 5177   02B7

L_5178:
        MVI     G_031B, R1                      ; 5178   0281 031B
        INCR    R1                              ; 517A   0009
        MVI@    R1,     R4                      ; 517B   028C
        TSTR    R4                              ; 517C   00A4
        BEQ     L_5169                          ; 517D   0224 0015

        SDBD                                    ; 517F   0001
        MVI@    R5,     R7                      ; 5180   02AF

        PSHR    R5                              ; 5181   0275
        MVO     R4,     G_0319                  ; 5182   0244 0319
        MVI     G_011C, R1                      ; 5184   0281 011C
        PSHR    R1                              ; 5186   0271
        SDBD                                    ; 5187   0001
        MVII    #$45D5, R5                      ; 5188   02BD 00D5 0045
        AND@    R5,     R1                      ; 518B   03A9
        PULR    R1                              ; 518C   02B1
        BEQ     L_519E                          ; 518D   0204 000F

        SUBI    #$0002, R4                      ; 518F   033C 0002
        SDBD                                    ; 5191   0001
        MVI@    R4,     R2                      ; 5192   02A2
        AND     G_010F, R1                      ; 5193   0381 010F
        BEQ     L_519E                          ; 5195   0204 0007

        MVO     R2,     G_031C                  ; 5197   0242 031C
        PSHR    R4                              ; 5199   0274

        JSR     R5,     .EXEC.4A1               ; 519A   0004 0114 00A1

        PULR    R4                              ; 519D   02B4
L_519E:
        ADDI    #$0006, R4                      ; 519E   02FC 0006
        MVI@    R4,     R0                      ; 51A0   02A0
        TSTR    R0                              ; 51A1   0080
        BEQ     L_5177                          ; 51A2   0224 002C

        MVI     G_011B, R1                      ; 51A4   0281 011B
        ADDI    #$0107, R1                      ; 51A6   02F9 0107
        MVI@    R1,     R1                      ; 51A8   0289
        ANDR    R0,     R1                      ; 51A9   0181
        BEQ     L_5177                          ; 51AA   0224 0034

        CLRR    R3                              ; 51AC   01DB
L_51AD:
        SARC    R1,     1                       ; 51AD   0079
        BNC     L_51CF                          ; 51AE   0209 001F

        PSHR    R4                              ; 51B0   0274
        PSHR    R3                              ; 51B1   0273
        MOVR    R3,     R2                      ; 51B2   009A
        SUB     G_011B, R2                      ; 51B3   0302 011B
        DECR    R2                              ; 51B5   0012
        SLL     R2,     1                       ; 51B6   004A
        ADDR    R2,     R4                      ; 51B7   00D4
        SDBD                                    ; 51B8   0001
        MVI@    R4,     R2                      ; 51B9   02A2
        MVO     R2,     G_031C                  ; 51BA   0242 031C
        PSHR    R1                              ; 51BC   0271
        SDBD                                    ; 51BD   0001
        MVII    #$8AE9, R1                      ; 51BE   02B9 00E9 008A
        MVI@    R1,     R1                      ; 51C1   0289
        CMP     G_011B, R1                      ; 51C2   0341 011B
        BEQ     L_51D8                          ; 51C4   0204 0012

        CMPR    R3,     R1                      ; 51C6   0159
        BEQ     L_51D8                          ; 51C7   0204 000F

L_51C9:
        JSR     R5,     .EXEC.29B               ; 51C9   0004 0110 029B

        PULR    R1                              ; 51CC   02B1
        PULR    R3                              ; 51CD   02B3
        PULR    R4                              ; 51CE   02B4
L_51CF:
        INCR    R3                              ; 51CF   000B
        CMP     G_0104, R3                      ; 51D0   0343 0104
        BGE     L_5177                          ; 51D2   022D 005C

        TSTR    R1                              ; 51D4   0089
        BNEQ    L_51AD                          ; 51D5   022C 0029
        PULR    R7                              ; 51D7   02B7

L_51D8:
        SDBD                                    ; 51D8   0001
        MVII    #$952A, R1                      ; 51D9   02B9 002A 0095
        MVO     R1,     G_031C                  ; 51DC   0241 031C
        B       L_51C9                          ; 51DE   0220 0016

        PSHR    R5                              ; 51E0   0275
        MOVR    R1,     R5                      ; 51E1   008D
        DECR    R5                              ; 51E2   0015
        MVI@    R5,     R3                      ; 51E3   02AB
        INCR    R5                              ; 51E4   000D
        MVI@    R5,     R1                      ; 51E5   02A9
        MVO     R1,     G_0319                  ; 51E6   0241 0319
        MVI     G_011C, R2                      ; 51E8   0282 011C
        AND     G_011A, R2                      ; 51EA   0382 011A
        MVI@    R5,     R2                      ; 51EC   02AA
        MVO     R2,     G_031A                  ; 51ED   0242 031A
        MVI@    R5,     R0                      ; 51EF   02A8
        BEQ     L_51FE                          ; 51F0   0204 000C

        MOVR    R0,     R1                      ; 51F2   0081
        MOVR    R0,     R2                      ; 51F3   0082
        ANDI    #$00FF, R2                      ; 51F4   03BA 00FF
        XORR    R2,     R1                      ; 51F6   01D1
        SWAP    R2,     1                       ; 51F7   0042
        SUBI    #$000B, R5                      ; 51F8   033D 000B
        ADD@    R5,     R1                      ; 51FA   02E9
        ADD@    R5,     R2                      ; 51FB   02EA
        B       L_5204                          ; 51FC   0200 0006

L_51FE:
        RLC     R3,     1                       ; 51FE   0053
        BC      L_5204                          ; 51FF   0201 0003

        JSR     R5,     .EXEC.477               ; 5201   0004 0114 0077

L_5204:
        MVII    #$0002, R5                      ; 5204   02BD 0002
        J       .EXEC.335                       ; 5206   0004 0310 0335

        PSHR    R5                              ; 5209   0275
        MVI     G_0163, R3                      ; 520A   0283 0163
        TSTR    R3                              ; 520C   009B
        BEQ     L_528C                          ; 520D   0204 007D

        DIS                                     ; 520F   0003
        CLRR    R1                              ; 5210   01C9
        MVO     R1,     G_0163                  ; 5211   0241 0163
        SARC    R3,     1                       ; 5213   007B
        BNC     L_521F                          ; 5214   0209 0009

        MVII    #$0139, R4                      ; 5216   02BC 0139
        SDBD                                    ; 5218   0001
        MVI@    R4,     R1                      ; 5219   02A1
        MVI@    R1,     R0                      ; 521A   0288
        MVO     R0,     .STIC.BORD              ; 521B   0240 002C
        MVO     R0,     G_0106                  ; 521D   0240 0106
L_521F:
        SARC    R3,     1                       ; 521F   007B
        BNC     L_5226                          ; 5220   0209 0004

        MVI     G_017C, R0                      ; 5222   0280 017C
        MVO     R0,     .STIC.CS.0              ; 5224   0240 0028
L_5226:
        SARC    R3,     1                       ; 5226   007B
        BNC     L_522E                          ; 5227   0209 0005

        CLRR    R0                              ; 5229   01C0
        MVO     R0,     G_0105                  ; 522A   0240 0105
        MVI     .STIC.MODE,R0                   ; 522C   0280 0021
L_522E:
        SARC    R3,     1                       ; 522E   007B
        BNC     L_5237                          ; 522F   0209 0006

        MVII    #$0001, R0                      ; 5231   02B8 0001
        MVO     R0,     G_0105                  ; 5233   0240 0105
        MVO     R0,     .STIC.MODE              ; 5235   0240 0021
L_5237:
        SARC    R3,     1                       ; 5237   007B
        BNC     L_5263                          ; 5238   0209 0029

        CLRR    R0                              ; 523A   01C0
        CLRR    R4                              ; 523B   01E4
        MVO@    R0,     R4                      ; 523C   0260
        MVO@    R0,     R4                      ; 523D   0260
        MVO@    R0,     R4                      ; 523E   0260
        MVO@    R0,     R4                      ; 523F   0260
        MVO@    R0,     R4                      ; 5240   0260
        MVO@    R0,     R4                      ; 5241   0260
        MVO@    R0,     R4                      ; 5242   0260
        MVO@    R0,     R4                      ; 5243   0260
        MVII    #$0018, R4                      ; 5244   02BC 0018
        MVO@    R0,     R4                      ; 5246   0260
        MVO@    R0,     R4                      ; 5247   0260
        MVO@    R0,     R4                      ; 5248   0260
        MVO@    R0,     R4                      ; 5249   0260
        MVO@    R0,     R4                      ; 524A   0260
        MVO@    R0,     R4                      ; 524B   0260
        MVO@    R0,     R4                      ; 524C   0260
        MVO@    R0,     R4                      ; 524D   0260
        SDBD                                    ; 524E   0001
        MVII    #$3980, R4                      ; 524F   02BC 0080 0039
        MVII    #$0080, R1                      ; 5252   02B9 0080
L_5254:
        MVO@    R0,     R4                      ; 5254   0260
        DECR    R1                              ; 5255   0011
        BNEQ    L_5254                          ; 5256   022C 0003

        MVII    #$0107, R4                      ; 5258   02BC 0107
        MVII    #$000A, R1                      ; 525A   02B9 000A
L_525C:
        MVO@    R0,     R4                      ; 525C   0260
        DECR    R1                              ; 525D   0011
        BNEQ    L_525C                          ; 525E   022C 0003

        JSR     R5,     .EXEC.7B3               ; 5260   0004 0114 03B3

L_5263:
        SARC    R3,     1                       ; 5263   007B
        BNC     L_528A                          ; 5264   0209 0024

        MVII    #$016C, R4                      ; 5266   02BC 016C
        SDBD                                    ; 5268   0001
        MVI@    R4,     R5                      ; 5269   02A5
L_526A:
        MVI@    R5,     R2                      ; 526A   02AA
        TSTR    R2                              ; 526B   0092
        BEQ     L_528A                          ; 526C   0204 001C

        SDBD                                    ; 526E   0001
        MVI@    R5,     R4                      ; 526F   02AC
        SDBD                                    ; 5270   0001
        MVI@    R5,     R1                      ; 5271   02A9
        MOVR    R5,     R3                      ; 5272   00AB
        MOVR    R1,     R5                      ; 5273   008D
L_5274:
        MVI@    R4,     R0                      ; 5274   02A0
        MVO@    R0,     R5                      ; 5275   0268
        MVI@    R4,     R0                      ; 5276   02A0
        MVO@    R0,     R5                      ; 5277   0268
        MVI@    R4,     R0                      ; 5278   02A0
        MVO@    R0,     R5                      ; 5279   0268
        MVI@    R4,     R0                      ; 527A   02A0
        MVO@    R0,     R5                      ; 527B   0268
        MVI@    R4,     R0                      ; 527C   02A0
        MVO@    R0,     R5                      ; 527D   0268
        MVI@    R4,     R0                      ; 527E   02A0
        MVO@    R0,     R5                      ; 527F   0268
        MVI@    R4,     R0                      ; 5280   02A0
        MVO@    R0,     R5                      ; 5281   0268
        MVI@    R4,     R0                      ; 5282   02A0
        MVO@    R0,     R5                      ; 5283   0268
        DECR    R2                              ; 5284   0012
        BNEQ    L_5274                          ; 5285   022C 0012

        MOVR    R3,     R5                      ; 5287   009D
        B       L_526A                          ; 5288   0220 001F

L_528A:
        EIS                                     ; 528A   0002
        PULR    R7                              ; 528B   02B7

L_528C:
        JSR     R5,     X_DEF_ISR               ; 528C   0004 0110 0126
        DECLE   $0280,  $015E,  $03B8,  $0008   ; 528F   0280 015E 03B8 0008
        DECLE   $0204,  $0003,  $0004           ; 5293   0204 0003 0004

        CMPR    R7,     R4                      ; 5296   017C
        PSHR    R0                              ; 5297   0270
        PULR    R7                              ; 5298   02B7

        DECLE   $0004                           ; 5299   0004

        CMPR    R6,     R0                      ; 529A   0170
        MVI@    R2,     R3                      ; 529B   0293
        SDBD                                    ; 529C   0001
        MVII    #$4053, R1                      ; 529D   02B9 0053 0040
        MVII    #$00FE, R0                      ; 52A0   02B8 00FE
        AND@    R1,     R0                      ; 52A2   0388
        MVI     G_0162, R2                      ; 52A3   0282 0162
        ANDI    #$0004, R2                      ; 52A5   03BA 0004
        BEQ     L_52AB                          ; 52A7   0204 0002

        ANDI    #$00F7, R0                      ; 52A9   03B8 00F7
L_52AB:
        MVO@    R0,     R1                      ; 52AB   0248
        DECLE   $02F9,  $0005,  $02B8,  $00D9   ; 52AC   02F9 0005 02B8 00D9
        DECLE   $0388,  $0248,  $00BD,  $02FD   ; 52B0   0388 0248 00BD 02FD
        DECLE   $0022,  $0275,  $0004           ; 52B4   0022 0275 0004

        CMPI    #$03E4, R0                      ; 52B7   0378 03E4
L_52B9:
        PSHR    R5                              ; 52B9   0275
        MVII    #$0004, R0                      ; 52BA   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 52BC   0004 0114 02E6
        DECLE   $015E,  $0280,  $0162,  $03B8   ; 52BF   015E 0280 0162 03B8
        DECLE   $0002,  $0204,  $000C,  $0280   ; 52C3   0002 0204 000C 0280
        DECLE   $0175,  $0080,  $0204,  $0007   ; 52C7   0175 0080 0204 0007
        DECLE   $0010,  $0240,  $0175,  $020C   ; 52CB   0010 0240 0175 020C
        DECLE   $0002,  $0220,  $0038,  $0004   ; 52CF   0002 0220 0038 0004

        CMPR    R7,     R0                      ; 52D3   0178
        XOR@    R4,     R0                      ; 52D4   03E0
        MVI     G_015E, R0                      ; 52D5   0280 015E
        ANDI    #$0010, R0                      ; 52D7   03B8 0010
        BNEQ    L_536B                          ; 52D9   020C 0090

        JSR     R5,     L_53CA                  ; 52DB   0004 0150 03CA

        MVI     G_0161, R0                      ; 52DE   0280 0161
        MVII    #$017D, R4                      ; 52E0   02BC 017D
        MVI     G_0165, R1                      ; 52E2   0281 0165
        MVI     G_017B, R2                      ; 52E4   0282 017B
        CMPI    #$0007, R0                      ; 52E6   0378 0007
        BEQ     L_5327                          ; 52E8   0204 003D

        CMPI    #$000D, R0                      ; 52EA   0378 000D
        BLT     L_536C                          ; 52EC   0205 007E
        BEQ     L_5318                          ; 52EE   0204 0028

        CMPI    #$0013, R0                      ; 52F0   0378 0013
        BEQ     L_5350                          ; 52F2   0204 005C

        CMPI    #$0017, R0                      ; 52F4   0378 0017
        BEQ     L_532E                          ; 52F6   0204 0036

        CMPI    #$001B, R0                      ; 52F8   0378 001B
        BEQ     L_531A                          ; 52FA   0204 001E

        CMPI    #$0020, R0                      ; 52FC   0378 0020
        BEQ     L_531E                          ; 52FE   0204 001E

        CMPI    #$0030, R0                      ; 5300   0378 0030
        BLT     L_5389                          ; 5302   0205 0085

        CMPI    #$0039, R0                      ; 5304   0378 0039
        BLE     L_5312                          ; 5306   0206 000A

        CMPI    #$0041, R0                      ; 5308   0378 0041
        BLT     L_5389                          ; 530A   0205 007D

        CMPI    #$005E, R0                      ; 530C   0378 005E
        BEQ     L_5395                          ; 530E   0204 0085
        B       L_531E                          ; 5310   0200 000C

L_5312:
        SUBI    #$0030, R0                      ; 5312   0338 0030
        B       L_5320                          ; 5314   0200 000A

L_5316:
        ADDI    #$0002, R4                      ; 5316   02FC 0002
L_5318:
        ADDI    #$0002, R4                      ; 5318   02FC 0002
L_531A:
        ADDI    #$0002, R4                      ; 531A   02FC 0002
L_531C:
        ADDI    #$0002, R4                      ; 531C   02FC 0002
L_531E:
        ADDI    #$0002, R4                      ; 531E   02FC 0002
L_5320:
        SDBD                                    ; 5320   0001
        MVI@    R4,     R1                      ; 5321   02A1
        TSTR    R1                              ; 5322   0089
        BEQ     L_536B                          ; 5323   0204 0046

        PULR    R5                              ; 5325   02B5
        MOVR    R1,     R7                      ; 5326   008F

L_5327:
        SDBD                                    ; 5327   0001
        MVII    #$9000, R4                      ; 5328   02BC 0000 0090
        J       L_5403                          ; 532B   0004 0354 0003

L_532E:
        JSR     R5,     L_FEA1                  ; 532E   0004 01FC 02A1

        BC      L_536B                          ; 5331   0201 0038

        DECR    R1                              ; 5333   0011
        BNEQ    L_536B                          ; 5334   020C 0035

        CMPI    #$000D, R2                      ; 5336   037A 000D
        BEQ     L_536B                          ; 5338   0204 0031

        MVII    #$016E, R4                      ; 533A   02BC 016E
        SDBD                                    ; 533C   0001
        MVI@    R4,     R1                      ; 533D   02A1
        SDBD                                    ; 533E   0001
        CMPI    #$6A39, R1                      ; 533F   0379 0039 006A
        BEQ     L_536B                          ; 5342   0204 0027

        SDBD                                    ; 5344   0001
        MVII    #$5014, R0                      ; 5345   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 5348   0240 02F0

        JSR     R5,     L_5401                  ; 534A   0004 0154 0001
        BIDECLE $6A39                           ; 534D   0039 006A

        PULR    R7                              ; 534F   02B7

L_5350:
        JSR     R5,     L_FEA1                  ; 5350   0004 01FC 02A1

        BC      L_536B                          ; 5353   0201 0016

        TSTR    R1                              ; 5355   0089
        BNEQ    L_536B                          ; 5356   020C 0013

        CMPI    #$000D, R2                      ; 5358   037A 000D
        BEQ     L_536B                          ; 535A   0204 000F

        MVII    #$016E, R4                      ; 535C   02BC 016E
        SDBD                                    ; 535E   0001
        MVI@    R4,     R1                      ; 535F   02A1
        SDBD                                    ; 5360   0001
        CMPI    #$5FA3, R1                      ; 5361   0379 00A3 005F
        BEQ     L_536B                          ; 5364   0204 0005

        JSR     R5,     L_5401                  ; 5366   0004 0154 0001
        BIDECLE $5FA3                           ; 5369   00A3 005F
L_536B:
        PULR    R7                              ; 536B   02B7

L_536C:
        CMPI    #$0008, R0                      ; 536C   0378 0008
        BLT     L_536B                          ; 536E   0225 0004

        CMPI    #$0009, R0                      ; 5370   0378 0009
        BEQ     L_536B                          ; 5372   0224 0008

        MVI     G_0176, R1                      ; 5374   0281 0176
        MVO     R1,     G_0175                  ; 5376   0241 0175
        SUBI    #$000A, R0                      ; 5378   0338 000A
        BMI     L_5382                          ; 537A   020B 0006
        BEQ     L_5385                          ; 537C   0204 0007

        ANDI    #$0001, R0                      ; 537E   03B8 0001
        B       L_531C                          ; 5380   0220 0065

L_5382:
        NEGR    R0                              ; 5382   0020
        B       L_531C                          ; 5383   0220 0068

L_5385:
        MVII    #$0003, R0                      ; 5385   02B8 0003
        B       L_531C                          ; 5387   0220 006C

L_5389:
        CMPI    #$0025, R0                      ; 5389   0378 0025
        BEQ     L_5395                          ; 538B   0204 0008

        CMPI    #$0027, R0                      ; 538D   0378 0027
        BEQ     L_5395                          ; 538F   0204 0004

        CMPI    #$003F, R0                      ; 5391   0378 003F
        BNEQ    L_536B                          ; 5393   022C 0029

L_5395:
        MVI     G_0162, R1                      ; 5395   0281 0162
        ANDI    #$0004, R1                      ; 5397   03B9 0004
        BEQ     L_536B                          ; 5399   0224 002F

        MVI     G_0176, R1                      ; 539B   0281 0176
        MVO     R1,     G_0175                  ; 539D   0241 0175
        SUBI    #$0027, R0                      ; 539F   0338 0027
        BEQ     L_5316                          ; 53A1   0224 008C
        BMI     L_53AD                          ; 53A3   020B 0008

        CMPI    #$0018, R0                      ; 53A5   0378 0018
        BEQ     L_53B0                          ; 53A7   0204 0007

        MVII    #$0001, R0                      ; 53A9   02B8 0001
        B       L_5316                          ; 53AB   0220 0096

L_53AD:
        NEGR    R0                              ; 53AD   0020
        B       L_5316                          ; 53AE   0220 0099

L_53B0:
        MVII    #$0003, R0                      ; 53B0   02B8 0003
        B       L_5316                          ; 53B2   0220 009D

L_53B4:
        PSHR    R5                              ; 53B4   0275
        MVII    #$0004, R0                      ; 53B5   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 53B7   0004 0114 02E6
        DECLE   $015E,  $0004                   ; 53BA   015E 0004

        CMPR    R7,     R0                      ; 53BC   0178
        XOR@    R4,     R0                      ; 53BD   03E0
        MVII    #$0001, R0                      ; 53BE   02B8 0001

        JSR     R5,     X_RAND1                 ; 53C0   0004 0114 027D
        DECLE   $0280,  $015E,  $03B8,  $0010   ; 53C3   0280 015E 03B8 0010
        DECLE   $022C,  $000D                   ; 53C7   022C 000D

        PULR    R7                              ; 53C9   02B7

L_53CA:
        PSHR    R5                              ; 53CA   0275
        MVI     G_0161, R0                      ; 53CB   0280 0161
        MVII    #$003C, R1                      ; 53CD   02B9 003C
        CMPI    #$000D, R0                      ; 53CF   0378 000D
        BEQ     L_53E7                          ; 53D1   0204 0014

        MVII    #$0050, R1                      ; 53D3   02B9 0050
        CMPI    #$001B, R0                      ; 53D5   0378 001B
        BEQ     L_53E7                          ; 53D7   0204 000E

        MVII    #$005F, R1                      ; 53D9   02B9 005F
        CMPI    #$002F, R0                      ; 53DB   0378 002F
        BLE     L_53E7                          ; 53DD   0206 0008

        MVII    #$0078, R1                      ; 53DF   02B9 0078
        CMPI    #$0039, R0                      ; 53E1   0378 0039
        BLE     L_53E7                          ; 53E3   0206 0002

        MVII    #$00A0, R1                      ; 53E5   02B9 00A0
L_53E7:
        MVO     R1,     .PSG1.chn_a_lo          ; 53E7   0241 00F0
        MVI     .PSG1.chan_enable,R0            ; 53E9   0280 00F8
        ANDI    #$00C0, R0                      ; 53EB   03B8 00C0
        XORI    #$003E, R0                      ; 53ED   03F8 003E
        MVO     R0,     .PSG1.chan_enable       ; 53EF   0240 00F8
        MVII    #$0030, R0                      ; 53F1   02B8 0030
        MVO     R0,     .PSG1.chn_a_vol         ; 53F3   0240 00FB
        MVII    #$002C, R0                      ; 53F5   02B8 002C
        MVO     R0,     .PSG1.envlp_lo          ; 53F7   0240 00F3
        MVII    #$0001, R0                      ; 53F9   02B8 0001
        MVO     R0,     .PSG1.envlp_hi          ; 53FB   0240 00F7
        CLRR    R0                              ; 53FD   01C0
        MVO     R0,     .PSG1.envelope          ; 53FE   0240 00FA
        PULR    R7                              ; 5400   02B7

L_5401:
        SDBD                                    ; 5401   0001
        MVI@    R5,     R4                      ; 5402   02AC
L_5403:
        PSHR    R5                              ; 5403   0275
        DIS                                     ; 5404   0003

        JSR     R5,     L_540A                  ; 5405   0004 0154 000A

        EIS                                     ; 5408   0002
        PULR    R7                              ; 5409   02B7

L_540A:
        PSHR    R5                              ; 540A   0275
        PSHR    R4                              ; 540B   0274

        JSR     R5,     X_STOP_SFX              ; 540C   0004 011C 02B4

        PULR    R4                              ; 540F   02B4
        CLRR    R1                              ; 5410   01C9
        MVO     R1,     G_0175                  ; 5411   0241 0175
        MVO     R1,     G_0162                  ; 5413   0241 0162
        MOVR    R4,     R3                      ; 5415   00A3
        MVO     R3,     G_016E                  ; 5416   0243 016E
        SWAP    R3,     1                       ; 5418   0043
        MVO     R3,     G_016F                  ; 5419   0243 016F
        MVI@    R4,     R3                      ; 541B   02A3
        MVII    #$017D, R5                      ; 541C   02BD 017D
L_541E:
        CLRR    R1                              ; 541E   01C9
        SARC    R3,     1                       ; 541F   007B
        BNC     L_5424                          ; 5420   0209 0002

        SDBD                                    ; 5422   0001
        MVI@    R4,     R1                      ; 5423   02A1
L_5424:
        MVO@    R1,     R5                      ; 5424   0269
        SWAP    R1,     1                       ; 5425   0041
        MVO@    R1,     R5                      ; 5426   0269
        CMPI    #$0187, R5                      ; 5427   037D 0187
        BLT     L_541E                          ; 5429   0225 000C

        CLRR    R0                              ; 542B   01C0
        MVO@    R0,     R5                      ; 542C   0268
        MVO@    R0,     R5                      ; 542D   0268
        SARC    R3,     1                       ; 542E   007B
        BNC     L_544C                          ; 542F   0209 001B

L_5431:
        MVI@    R4,     R1                      ; 5431   02A1
        DECLE   $0089,  $0204,  $0017,  $0379   ; 5432   0089 0204 0017 0379
        DECLE   $0028,  $020C,  $0008           ; 5436   0028 020C 0008

        MVI@    R4,     R2                      ; 5439   02A2
        MVO     R2,     G_017C                  ; 543A   0242 017C
        MVI@    R4,     R2                      ; 543C   02A2
        XORI    #$0002, R0                      ; 543D   03F8 0002
        B       L_5431                          ; 543F   0220 000F

        DECLE   $0001                           ; 5441   0001

        MVI@    R4,     R1                      ; 5442   02A1
        MVO     R1,     G_0139                  ; 5443   0241 0139
        SWAP    R1,     1                       ; 5445   0041
        MVO     R1,     G_013A                  ; 5446   0241 013A
        XORI    #$0001, R0                      ; 5448   03F8 0001
        B       L_5431                          ; 544A   0220 001A

L_544C:
        SARC    R3,     1                       ; 544C   007B
        BNC     L_5451                          ; 544D   0209 0002

        XORI    #$0010, R0                      ; 544F   03F8 0010
L_5451:
        SARC    R3,     1                       ; 5451   007B
        BNC     L_545D                          ; 5452   0209 0009

        SDBD                                    ; 5454   0001
        MVI@    R4,     R1                      ; 5455   02A1
        MVO     R1,     G_016C                  ; 5456   0241 016C
        SWAP    R1,     1                       ; 5458   0041
        MVO     R1,     G_016D                  ; 5459   0241 016D
        XORI    #$0020, R0                      ; 545B   03F8 0020
L_545D:
        SARC    R3,     1                       ; 545D   007B
        BNC     L_546A                          ; 545E   0209 000A

        MVI@    R4,     R1                      ; 5460   02A1
        TSTR    R1                              ; 5461   0089
        BNEQ    L_5468                          ; 5462   020C 0004

        XORI    #$0004, R0                      ; 5464   03F8 0004
        B       L_546A                          ; 5466   0200 0002

L_5468:
        XORI    #$0008, R0                      ; 5468   03F8 0008
L_546A:
        TSTR    R0                              ; 546A   0080
        BEQ     L_547B                          ; 546B   0204 000E

        MVO     R0,     G_0163                  ; 546D   0240 0163
        EIS                                     ; 546F   0002
L_5470:
        CMP     G_0163, R0                      ; 5470   0340 0163
        BEQ     L_5470                          ; 5472   0224 0003

        DIS                                     ; 5474   0003
        ANDI    #$0002, R0                      ; 5475   03B8 0002
        BEQ     L_547B                          ; 5477   0204 0002

        MVO     R2,     G_017C                  ; 5479   0242 017C
L_547B:
        PSHR    R4                              ; 547B   0274
        SARC    R3,     1                       ; 547C   007B
        BNC     L_5482                          ; 547D   0209 0003

        JSR     R5,     L_FCD2                  ; 547F   0004 01FC 00D2

L_5482:
        PULR    R1                              ; 5482   02B1
L_5483:
        MVI@    R1,     R4                      ; 5483   028C
        INCR    R1                              ; 5484   0009
        CMPI    #$02EF, R4                      ; 5485   037C 02EF
        BGT     L_548E                          ; 5487   020E 0005

        JSR     R5,     L_DDDA                  ; 5489   0004 01DC 01DA

        B       L_5483                          ; 548C   0220 000A

L_548E:
        CMPI    #$02F2, R4                      ; 548E   037C 02F2
        BEQ     L_54AC                          ; 5490   0204 001A

        CMPI    #$02F1, R4                      ; 5492   037C 02F1
        BEQ     L_54AB                          ; 5494   0204 0015

        CMPI    #$02F3, R4                      ; 5496   037C 02F3
        BEQ     L_54B8                          ; 5498   0204 001E

        CMPI    #$02F4, R4                      ; 549A   037C 02F4
        BEQ     L_54C1                          ; 549C   0204 0023

        CMPI    #$02F5, R4                      ; 549E   037C 02F5
        BEQ     L_550F                          ; 54A0   0204 006D

        CMPI    #$02F6, R4                      ; 54A2   037C 02F6
        BEQ     L_5500                          ; 54A4   0204 005A

        CMPI    #$02F7, R4                      ; 54A6   037C 02F7
        BEQ     L_5517                          ; 54A8   0204 006D
        PULR    R7                              ; 54AA   02B7
L_54AB:
        MOVR    R1,     R7                      ; 54AB   008F

L_54AC:
        MVI@    R1,     R4                      ; 54AC   028C
        INCR    R1                              ; 54AD   0009
        MOVR    R1,     R5                      ; 54AE   008D
        SDBD                                    ; 54AF   0001
        MVI@    R5,     R1                      ; 54B0   02A9
        MOVR    R5,     R0                      ; 54B1   00A8

        JSR     R5,     L_DDDA                  ; 54B2   0004 01DC 01DA

        MOVR    R0,     R1                      ; 54B5   0081
        B       L_5483                          ; 54B6   0220 0034

L_54B8:
        MVI@    R1,     R4                      ; 54B8   028C
        DECLE   $0244,  $0172,  $0004           ; 54B9   0244 0172 0004

        XORR    R7,     R4                      ; 54BC   01FC
        CMP@    R3,     R5                      ; 54BD   035D
        INCR    R1                              ; 54BE   0009
        B       L_5483                          ; 54BF   0220 003D

L_54C1:
        MVI@    R1,     R4                      ; 54C1   028C
        INCR    R1                              ; 54C2   0009
        MVI     G_0105, R0                      ; 54C3   0280 0105
        TSTR    R0                              ; 54C5   0080
        BEQ     L_54E4                          ; 54C6   0204 001C

        MOVR    R4,     R3                      ; 54C8   00A3
        MVII    #$0200, R4                      ; 54C9   02BC 0200
        ADDR    R4,     R3                      ; 54CB   00E3
        SDBD                                    ; 54CC   0001
        MVII    #$0600, R2                      ; 54CD   02BA 0000 0006
        MVI     G_0165, R0                      ; 54D0   0280 0165
        TSTR    R0                              ; 54D2   0080
        BEQ     L_54D6                          ; 54D3   0204 0001

        CLRR    R2                              ; 54D5   01D2
L_54D6:
        MVO@    R2,     R4                      ; 54D6   0262
        CMPR    R3,     R4                      ; 54D7   015C
        BLT     L_54D6                          ; 54D8   0225 0003

        SDBD                                    ; 54DA   0001
        MVII    #$09F0, R0                      ; 54DB   02B8 00F0 0009
        XOR     G_017C, R0                      ; 54DE   03C0 017C
        MVII    #$0014, R2                      ; 54E0   02BA 0014
        B       L_54F6                          ; 54E2   0200 0012

L_54E4:
        SDBD                                    ; 54E4   0001
        MVII    #$2660, R0                      ; 54E5   02B8 0060 0026
        XOR     G_017C, R0                      ; 54E8   03C0 017C
        ADDI    #$0200, R4                      ; 54EA   02FC 0200
        CLRR    R2                              ; 54EC   01D2
        MVO     R2,     .BTAB.00                ; 54ED   0242 0200
        MVO@    R0,     R4                      ; 54EF   0260
        SDBD                                    ; 54F0   0001
        XORI    #$2000, R0                      ; 54F1   03F8 0000 0020
        MVII    #$0013, R2                      ; 54F4   02BA 0013
L_54F6:
        MVO@    R0,     R4                      ; 54F6   0260
        DECR    R2                              ; 54F7   0012
        BNEQ    L_54F6                          ; 54F8   022C 0003

        MVI     G_017C, R0                      ; 54FA   0280 017C
        MVO     R0,     G_017B                  ; 54FC   0240 017B
        B       L_5483                          ; 54FE   0220 007C

L_5500:
        MOVR    R1,     R4                      ; 5500   008C
        SDBD                                    ; 5501   0001
        MVI@    R4,     R0                      ; 5502   02A0
        MOVR    R4,     R1                      ; 5503   00A1
        MVO     R0,     G_0187                  ; 5504   0240 0187
        SWAP    R0,     1                       ; 5506   0040
        MVO     R0,     G_0188                  ; 5507   0240 0188
        MVI     G_0162, R0                      ; 5509   0280 0162
        XORI    #$0004, R0                      ; 550B   03F8 0004
        MVO     R0,     G_0162                  ; 550D   0240 0162
L_550F:
        MVI     G_0162, R0                      ; 550F   0280 0162
        XORI    #$0002, R0                      ; 5511   03F8 0002
        MVO     R0,     G_0162                  ; 5513   0240 0162
        B       L_5483                          ; 5515   0220 0093

L_5517:
        MVI@    R1,     R0                      ; 5517   0288
        INCR    R1                              ; 5518   0009
        MVO     R0,     G_017B                  ; 5519   0240 017B
        B       L_5483                          ; 551B   0220 0099

.GRAM_INIT_551D:
        DECLE   $002E           ; 551D  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 551E  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5520  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5522  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5524  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0180   ; 5526  #20-23:  CART #20-23 ----
        DECLE   $001D,  $0010   ; 5528  #24-24:  GROM #0E-0E ----
        DECLE   $0019,  $0010   ; 552A  #25-25:  GROM #0C-0C ----
        DECLE   $0049,  $0380   ; 552C  #26-2D:  CART #24-2B ----

.GFX_LIST_552E:
        DECLE   $0000,  $001C,  $0036,  $0063   ; 552E  CART PIC #00
        DECLE   $007F,  $0063,  $0063,  $0000   ; 5532  
        DECLE   $0000,  $007E,  $0063,  $007E   ; 5536  CART PIC #01
        DECLE   $0063,  $0063,  $007E,  $0000   ; 553A  
        DECLE   $0000,  $003E,  $0063,  $0060   ; 553E  CART PIC #02
        DECLE   $0060,  $0063,  $003E,  $0000   ; 5542  
        DECLE   $0000,  $007E,  $0063,  $0063   ; 5546  CART PIC #03
        DECLE   $0063,  $0063,  $007E,  $0000   ; 554A  
        DECLE   $0000,  $007F,  $0060,  $007E   ; 554E  CART PIC #04
        DECLE   $0060,  $0060,  $007F,  $0000   ; 5552  
        DECLE   $0000,  $007F,  $0060,  $007E   ; 5556  CART PIC #05
        DECLE   $0060,  $0060,  $0060,  $0000   ; 555A  
        DECLE   $0000,  $003E,  $0063,  $0060   ; 555E  CART PIC #06
        DECLE   $0067,  $0063,  $003E,  $0000   ; 5562  
        DECLE   $0000,  $0063,  $0063,  $007F   ; 5566  CART PIC #07
        DECLE   $0063,  $0063,  $0063,  $0000   ; 556A  
        DECLE   $0000,  $003C,  $0018,  $0018   ; 556E  CART PIC #08
        DECLE   $0018,  $0018,  $003C,  $0000   ; 5572  
        DECLE   $0000,  $0003,  $0003,  $0003   ; 5576  CART PIC #09
        DECLE   $0063,  $0063,  $003E,  $0000   ; 557A  
        DECLE   $0000,  $0066,  $006C,  $0078   ; 557E  CART PIC #0A
        DECLE   $006C,  $0066,  $0063,  $0000   ; 5582  
        DECLE   $0000,  $0060,  $0060,  $0060   ; 5586  CART PIC #0B
        DECLE   $0060,  $0060,  $007F,  $0000   ; 558A  
        DECLE   $0000,  $0063,  $0077,  $007F   ; 558E  CART PIC #0C
        DECLE   $006B,  $0063,  $0063,  $0000   ; 5592  
        DECLE   $0000,  $0063,  $0073,  $007B   ; 5596  CART PIC #0D
        DECLE   $006F,  $0067,  $0063,  $0000   ; 559A  
        DECLE   $0000,  $003E,  $0063,  $0063   ; 559E  CART PIC #0E
        DECLE   $0063,  $0063,  $003E,  $0000   ; 55A2  
        DECLE   $0000,  $007E,  $0063,  $0063   ; 55A6  CART PIC #0F
        DECLE   $007E,  $0060,  $0060,  $0000   ; 55AA  
        DECLE   $0000,  $003E,  $0063,  $0063   ; 55AE  CART PIC #10
        DECLE   $0063,  $0066,  $003D,  $0000   ; 55B2  
        DECLE   $0000,  $007E,  $0063,  $0063   ; 55B6  CART PIC #11
        DECLE   $007C,  $0066,  $0063,  $0000   ; 55BA  
        DECLE   $0000,  $003E,  $0060,  $003E   ; 55BE  CART PIC #12
        DECLE   $0003,  $0063,  $003E,  $0000   ; 55C2  
        DECLE   $0000,  $007E,  $0018,  $0018   ; 55C6  CART PIC #13
        DECLE   $0018,  $0018,  $0018,  $0000   ; 55CA  
        DECLE   $0000,  $0063,  $0063,  $0063   ; 55CE  CART PIC #14
        DECLE   $0063,  $0063,  $003E,  $0000   ; 55D2  
        DECLE   $0000,  $0063,  $0066,  $0066   ; 55D6  CART PIC #15
        DECLE   $006C,  $006C,  $0078,  $0000   ; 55DA  
        DECLE   $0000,  $0063,  $0063,  $006B   ; 55DE  CART PIC #16
        DECLE   $007F,  $0077,  $0063,  $0000   ; 55E2  
        DECLE   $0000,  $0063,  $0036,  $0018   ; 55E6  CART PIC #17
        DECLE   $000C,  $0036,  $0063,  $0000   ; 55EA  
        DECLE   $0000,  $0066,  $0066,  $003C   ; 55EE  CART PIC #18
        DECLE   $0018,  $0018,  $0018,  $0000   ; 55F2  
        DECLE   $0000,  $007F,  $0003,  $000E   ; 55F6  CART PIC #19
        DECLE   $0038,  $0060,  $007F,  $0000   ; 55FA  
        DECLE   $0000,  $003E,  $0067,  $006F   ; 55FE  CART PIC #1A
        DECLE   $007B,  $0073,  $003E,  $0000   ; 5602  
        DECLE   $0000,  $000C,  $001C,  $000C   ; 5606  CART PIC #1B
        DECLE   $000C,  $000C,  $003F,  $0000   ; 560A  
        DECLE   $0000,  $003E,  $0063,  $0003   ; 560E  CART PIC #1C
        DECLE   $003E,  $0060,  $007F,  $0000   ; 5612  
        DECLE   $0000,  $003E,  $0003,  $001E   ; 5616  CART PIC #1D
        DECLE   $0003,  $0063,  $003E,  $0000   ; 561A  
        DECLE   $0000,  $000E,  $0016,  $0026   ; 561E  CART PIC #1E
        DECLE   $007F,  $0006,  $0006,  $0000   ; 5622  
        DECLE   $0000,  $007F,  $0060,  $007E   ; 5626  CART PIC #1F
        DECLE   $0003,  $0063,  $003E,  $0000   ; 562A  
        DECLE   $0000,  $001F,  $0030,  $007E   ; 562E  CART PIC #20
        DECLE   $0063,  $0063,  $003E,  $0000   ; 5632  
        DECLE   $0000,  $003F,  $0001,  $0003   ; 5636  CART PIC #21
        DECLE   $0006,  $000C,  $0018,  $0000   ; 563A  
        DECLE   $0000,  $003E,  $0063,  $003E   ; 563E  CART PIC #22
        DECLE   $0063,  $0063,  $003E,  $0000   ; 5642  
        DECLE   $0000,  $003E,  $0063,  $0063   ; 5646  CART PIC #23
        DECLE   $003F,  $0003,  $003E,  $0000   ; 564A  
        DECLE   $0000,  $001E,  $0033,  $0006   ; 564E  CART PIC #24
        DECLE   $000C,  $0000,  $0018,  $0000   ; 5652  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5656  CART PIC #25
        DECLE   $007F,  $0000,  $0000,  $0000   ; 565A  
        DECLE   $0000,  $0000,  $0018,  $0018   ; 565E  CART PIC #26
        DECLE   $007E,  $0018,  $0018,  $0000   ; 5662  
        DECLE   $0000,  $0002,  $0004,  $0008   ; 5666  CART PIC #27
        DECLE   $0010,  $0020,  $0040,  $0000   ; 566A  
        DECLE   $00C0,  $00C0,  $00C0,  $00F0   ; 566E  CART PIC #28
        DECLE   $00C0,  $00C0,  $00C0,  $00F0   ; 5672  
        DECLE   $00FF,  $0003,  $0003,  $0000   ; 5676  CART PIC #29
        DECLE   $0000,  $0000,  $0000,  $0000   ; 567A  
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 567E  CART PIC #2A
        DECLE   $00C0,  $00C0,  $00C0,  $00F0   ; 5682  
        DECLE   $0000,  $003C,  $0042,  $0099   ; 5686  CART PIC #2B
        DECLE   $00A1,  $0099,  $0042,  $003C   ; 568A  
        DECLE   $0000,  $0001                   ; 568E   0000 0001

        DIS                                     ; 5690   0003
        DIS                                     ; 5691   0003
        CLRC                                    ; 5692   0006
        INCR    R7                              ; 5693   000F

        COMR    R6                              ; 5694   001E
L_5695:
        RRC     R3,     2                       ; 5695   0077
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5696   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 569A   00FF 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 569E   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 56A2   00FF 00FF 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 56A6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 56AA   00FF 00FF 00FF 0000
        DECLE   $00EF,  $00FD,  $00FF,  $00FE   ; 56AE   00EF 00FD 00FF 00FE
        DECLE   $0078,  $00E0,  $0080,  $0000   ; 56B2   0078 00E0 0080 0000
        DECLE   $0080,  $00C0,  $00C0,  $00E0   ; 56B6   0080 00C0 00C0 00E0
        DECLE   $00B0,  $00F8,  $00FE,  $00F7   ; 56BA   00B0 00F8 00FE 00F7
        DECLE   $007B,  $008D,  $001A,  $0028   ; 56BE   007B 008D 001A 0028
        DECLE   $0084,  $0004,  $0006,  $000E   ; 56C2   0084 0004 0006 000E
        DECLE   $00F7,  $00BF,  $00FF,  $007F   ; 56C6   00F7 00BF 00FF 007F
        DECLE   $001E,  $0007,  $0001,  $0000   ; 56CA   001E 0007 0001 0000
        DECLE   $008F,  $0006,  $0001,  $0041   ; 56CE   008F 0006 0001 0041
        DECLE   $0004,  $0000,  $0000           ; 56D2   0004 0000 0000

        NEGR    R0                              ; 56D5   0020
        INCR    R6                              ; 56D6   000E
        MOVR    R3,     R7                      ; 56D7   009F

        SARC    R3,     2                       ; 56D8   007F
        SARC    R1,     2                       ; 56D9   007D
        ADDR    R3,     R7                      ; 56DA   00DF

        DECLE   $00FF,  $00FF,  $00FB,  $0000   ; 56DB   00FF 00FF 00FB 0000
        DECLE   $0007,  $001E,  $007F,  $007B   ; 56DF   0007 001E 007F 007B
        DECLE   $00FF,  $007F,  $00B7,  $00FF   ; 56E3   00FF 007F 00B7 00FF
        DECLE   $001F,  $0087,  $0001,  $0021   ; 56E7   001F 0087 0001 0021
        DECLE   $0000,  $0001,  $0012,  $0000   ; 56EB   0000 0001 0012 0000
        DECLE   $0028,  $007C,  $00B2,  $0058   ; 56EF   0028 007C 00B2 0058
        DECLE   $0015,  $0012,  $0037,  $0034   ; 56F3   0015 0012 0037 0034
        DECLE   $007E,  $00AE,  $0047,  $0086   ; 56F7   007E 00AE 0047 0086
        DECLE   $00ED,  $00AD,  $00CD,  $0000   ; 56FB   00ED 00AD 00CD 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 5703   0000 0000 0000 001E
        DECLE   $0037,  $0027,  $0068,  $0057   ; 5707   0037 0027 0068 0057
        DECLE   $005C,  $0050,  $0068,  $0000   ; 570B   005C 0050 0068 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 570F   0000 0000 0000 0000
        DECLE   $001E,  $0037,  $0027,  $0068   ; 5713   001E 0037 0027 0068
        DECLE   $0057,  $005C,  $0050,  $0048   ; 5717   0057 005C 0050 0048
        DECLE   $0070,  $0070,  $0070,  $001E   ; 571B   0070 0070 0070 001E
        DECLE   $0037,  $0027,  $0068,  $0050   ; 571F   0037 0027 0068 0050
        DECLE   $0058,  $0056,  $0048,  $0070   ; 5723   0058 0056 0048 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; 5727   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0000   ; 572B   0070 0070 0070 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 572F   0000 0000 0000 001E
        DECLE   $0037,  $0027,  $0068,  $0050   ; 5733   0037 0027 0068 0050
        DECLE   $005E,  $0050,  $0048,  $0070   ; 5737   005E 0050 0048 0070
        DECLE   $0070,  $0070,  $0070,  $0000   ; 573B   0070 0070 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $001C   ; 5743   0000 0000 000C 001C
        DECLE   $003C,  $006E,  $006F,  $00D0   ; 5747   003C 006E 006F 00D0
        DECLE   $00AE,  $00B8,  $00B0,  $0000   ; 574B   00AE 00B8 00B0 0000
        DECLE   $0000,  $0000,  $000C,  $001C   ; 574F   0000 0000 000C 001C
        DECLE   $003C,  $006E,  $006F,  $00D0   ; 5753   003C 006E 006F 00D0
        DECLE   $00AE,  $00B8,  $00A0,  $0090   ; 5757   00AE 00B8 00A0 0090
        DECLE   $00E0,  $00E0,  $00E0,  $000C   ; 575B   00E0 00E0 00E0 000C
        DECLE   $001C,  $003C,  $006E,  $006F   ; 575F   001C 003C 006E 006F
        DECLE   $00D0,  $00B0,  $00B0,  $00B0   ; 5763   00D0 00B0 00B0 00B0
        DECLE   $009E,  $00F0,  $00E0,  $00E0   ; 5767   009E 00F0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $0000   ; 576B   00E0 00E0 00E0 0000
        DECLE   $0000,  $0000,  $000C,  $003C   ; 576F   0000 0000 000C 003C
        DECLE   $006E,  $006F,  $00D0,  $00B0   ; 5773   006E 006F 00D0 00B0
        DECLE   $00AE,  $00B8,  $0090,  $00E0   ; 5777   00AE 00B8 0090 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $0000   ; 577B   00E0 00E0 00E0 0000
        DECLE   $0018,  $0018,  $0018,  $0064   ; 577F   0018 0018 0018 0064
        DECLE   $00FE,  $00BA,  $0082,  $00BA   ; 5783   00FE 00BA 0082 00BA
        DECLE   $0038,  $0010,  $0028,  $0028   ; 5787   0038 0010 0028 0028
        DECLE   $0028,  $006C,  $0000,  $0000   ; 578B   0028 006C 0000 0000
        DECLE   $0018,  $0019,  $0019,  $0067   ; 578F   0018 0019 0019 0067
        DECLE   $00FC,  $00B8,  $0080,  $00B8   ; 5793   00FC 00B8 0080 00B8
        DECLE   $0038,  $0010,  $0028,  $0028   ; 5797   0038 0010 0028 0028
        DECLE   $0028,  $006C,  $0000,  $0000   ; 579B   0028 006C 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 579F   0000 0018 0018 0018
        DECLE   $0064,  $00FE,  $00BA,  $0082   ; 57A3   0064 00FE 00BA 0082
        DECLE   $00BA,  $0038,  $0010,  $0028   ; 57A7   00BA 0038 0010 0028
        DECLE   $0028,  $0028,  $006C,  $0000   ; 57AB   0028 0028 006C 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 57AF   0000 0018 0018 0018
        DECLE   $0064,  $00FE,  $00BA,  $0082   ; 57B3   0064 00FE 00BA 0082
        DECLE   $00BA,  $0038,  $0010,  $0028   ; 57B7   00BA 0038 0010 0028
        DECLE   $0028,  $0028,  $006C,  $0000   ; 57BB   0028 0028 006C 0000
        DECLE   $000C,  $008C,  $008C,  $00E0   ; 57BF   000C 008C 008C 00E0
        DECLE   $002A,  $003A,  $0002,  $003A   ; 57C3   002A 003A 0002 003A
        DECLE   $0018,  $0000,  $0028,  $002C   ; 57C7   0018 0000 0028 002C
        DECLE   $0020,  $0030,  $0000,  $0000   ; 57CB   0020 0030 0000 0000
        DECLE   $000C,  $000C,  $000C,  $0020   ; 57CF   000C 000C 000C 0020
        DECLE   $00AA,  $00B9,  $0000,  $0038   ; 57D3   00AA 00B9 0000 0038
        DECLE   $0018,  $0020,  $0068,  $0048   ; 57D7   0018 0020 0068 0048
        DECLE   $004C,  $0000,  $0000,  $0000   ; 57DB   004C 0000 0000 0000
        DECLE   $000C,  $008C,  $008C,  $00E1   ; 57DF   000C 008C 008C 00E1
        DECLE   $002B,  $0038,  $0000,  $0038   ; 57E3   002B 0038 0000 0038
        DECLE   $0012,  $000E,  $0020,  $0020   ; 57E7   0012 000E 0020 0020
        DECLE   $0020,  $0030,  $0000,  $0000   ; 57EB   0020 0030 0000 0000
        DECLE   $0000,  $0000,  $000C,  $000C   ; 57EF   0000 0000 000C 000C
        DECLE   $000C,  $00E0,  $00AB,  $00B8   ; 57F3   000C 00E0 00AB 00B8
        DECLE   $0000,  $0038,  $0018,  $0020   ; 57F7   0000 0038 0018 0020
        DECLE   $0068,  $0048,  $004C,  $0000   ; 57FB   0068 0048 004C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57FF   0000 0000 0000 0000

        INCR    R4                              ; 5803   000C
L_5804:
        MOVR    R1,     R4                      ; 5804   008C
        DECLE   $008C,  $00E0,  $002A,  $003A   ; 5805   008C 00E0 002A 003A
        DECLE   $0002,  $003A,  $0018,  $0000   ; 5809   0002 003A 0018 0000
        DECLE   $0028,  $0000,  $0000,  $0000   ; 580D   0028 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5811   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $000C   ; 5815   0000 0000 000C 000C
        DECLE   $000C,  $0020,  $00AA,  $00B9   ; 5819   000C 0020 00AA 00B9
        DECLE   $0000,  $0000,  $0000,  $0000   ; 581D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5821   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5825   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $008C   ; 5829   0000 0000 000C 008C
        DECLE   $008C,  $0000,  $0000,  $0000   ; 582D   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5831   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5835   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 5839   0000 0000 0000 000C
        DECLE   $000C,  $0000,  $0000,  $0001   ; 583D   000C 0000 0000 0001
        DECLE   $0001,  $0003,  $0006,  $0054   ; 5841   0001 0003 0006 0054
        DECLE   $00FF,  $0037,  $00DF,  $00AA   ; 5845   00FF 0037 00DF 00AA
        DECLE   $00FF,  $00F8,  $0000,  $0000   ; 5849   00FF 00F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 584D   0000 0000 0000 0001
        DECLE   $0001,  $0003,  $0006,  $0054   ; 5851   0001 0003 0006 0054
        DECLE   $00FF,  $0037,  $00DF,  $00AA   ; 5855   00FF 0037 00DF 00AA
        DECLE   $00FF,  $001F,  $0000,  $0000   ; 5859   00FF 001F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585D   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0003,  $0006   ; 5861   0001 0001 0003 0006
        DECLE   $0054,  $00FF,  $0037,  $00DF   ; 5865   0054 00FF 0037 00DF
        DECLE   $00AA,  $00C3,  $0000,  $0000   ; 5869   00AA 00C3 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586D   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0003,  $0006   ; 5871   0001 0001 0003 0006
        DECLE   $0054,  $00FF,  $0037,  $00DF   ; 5875   0054 00FF 0037 00DF
        DECLE   $00AA,  $00F1,  $0000,  $0000   ; 5879   00AA 00F1 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 587D   0000 0000 0000 0004
        DECLE   $0006,  $0036,  $007F,  $00F8   ; 5881   0006 0036 007F 00F8
        DECLE   $009A,  $0032,  $00F4,  $0000   ; 5885   009A 0032 00F4 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5889   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 588D   0000 0000 0000 0004
        DECLE   $0006,  $003E,  $007F,  $00F0   ; 5891   0006 003E 007F 00F0
        DECLE   $00B8,  $001A,  $003A,  $0074   ; 5895   00B8 001A 003A 0074
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5899   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589D   0000 0000 0000 0000
        DECLE   $0000,  $0084,  $00F6,  $007E   ; 58A1   0000 0084 00F6 007E
        DECLE   $003F,  $00F8,  $0080,  $0000   ; 58A5   003F 00F8 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AD   0000 0000 0000 0000
        DECLE   $0080,  $00CE,  $00E1,  $0074   ; 58B1   0080 00CE 00E1 0074
        DECLE   $0066,  $007E,  $00F7,  $00B0   ; 58B5   0066 007E 00F7 00B0
        DECLE   $0080,  $0040,  $0000,  $0000   ; 58B9   0080 0040 0000 0000
        DECLE   $0000,  $0080,  $00E0,  $00F2   ; 58BD   0000 0080 00E0 00F2
        DECLE   $0074,  $0060,  $0024,  $0076   ; 58C1   0074 0060 0024 0076
        DECLE   $007E,  $00F7,  $0080,  $0040   ; 58C5   007E 00F7 0080 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 58CD   0000 0000 0000 0004
        DECLE   $00F7,  $0036,  $006F,  $00FE   ; 58D1   00F7 0036 006F 00FE
        DECLE   $00B8,  $0000,  $0000,  $0000   ; 58D5   00B8 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D9   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $0036,  $006B   ; 58DD   0000 001C 0036 006B
        DECLE   $00BF,  $00D7,  $0034,  $006E   ; 58E1   00BF 00D7 0034 006E
        DECLE   $0038,  $001C,  $0034,  $0028   ; 58E5   0038 001C 0034 0028
        DECLE   $0018,  $0010,  $0008,  $0010   ; 58E9   0018 0010 0008 0010
        DECLE   $0000                           ; 58ED   0000

        COMR    R4                              ; 58EE   001C
        ADCR    R2                              ; 58EF   002A
        SLL     R1,     2                       ; 58F0   004D
        ADDR    R7,     R3                      ; 58F1   00FB
        MOVR    R5,     R7                      ; 58F2   00AF

        DECLE   $0056,  $007A,  $001C,  $002C   ; 58F3   0056 007A 001C 002C
        DECLE   $0014,  $0028,  $0018,  $0008   ; 58F7   0014 0028 0018 0008
        DECLE   $0010,  $0008,  $0000,  $0000   ; 58FB   0010 0008 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0058   ; 58FF   0000 0000 0028 0058
        DECLE   $006C,  $00DE,  $00B4,  $004A   ; 5903   006C 00DE 00B4 004A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5907   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 590F   0000 0000 0000 00C0
        DECLE   $0027,  $0014,  $0038,  $004C   ; 5913   0027 0014 0038 004C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5917   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591F   0000 0000 0000 0000
        DECLE   $0076,  $00B9,  $002C,  $0040   ; 5923   0076 00B9 002C 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5927   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0034   ; 592F   0000 0000 0000 0034
        DECLE   $00EA,  $008D,  $0000,  $0000   ; 5933   00EA 008D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5937   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 593B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0034   ; 593F   0000 0000 0000 0034
        DECLE   $007A,  $004D,  $0080,  $0000   ; 5943   007A 004D 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5947   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594F   0000 0000 0000 0000
        DECLE   $0076,  $00B9,  $000C,  $0000   ; 5953   0076 00B9 000C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5957   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E1   ; 595F   0000 0000 0000 00E1
        DECLE   $0032,  $0014,  $0038,  $004C   ; 5963   0032 0014 0038 004C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5967   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596B   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0048,  $0014   ; 596F   0000 0010 0048 0014
        DECLE   $002C,  $0028,  $0018,  $00FF   ; 5973   002C 0028 0018 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5977   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0008   ; 597B   00FF 00FF 0000 0008
        DECLE   $0011,  $0030,  $003A,  $0054   ; 597F   0011 0030 003A 0054
        DECLE   $005C,  $0028,  $001A,  $00FF   ; 5983   005C 0028 001A 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5987   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $0010   ; 598B   0000 0000 00FF 0010
        DECLE   $0088,  $000C,  $005C,  $002A   ; 598F   0088 000C 005C 002A
        DECLE   $003A,  $0014,  $0058,  $00FF   ; 5993   003A 0014 0058 00FF
        DECLE   $00FF,  $00FF,  $0080,  $0000   ; 5997   00FF 00FF 0080 0000
        DECLE   $0000,  $00FF,  $00FF,  $0000   ; 599B   0000 00FF 00FF 0000
        DECLE   $0000,  $0008,  $0012,  $0028   ; 599F   0000 0008 0012 0028
        DECLE   $0034,  $0014,  $0018,  $00FF   ; 59A3   0034 0014 0018 00FF
        DECLE   $0040,  $0000,  $0000,  $0004   ; 59A7   0040 0000 0000 0004
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 59AB   00FF 00FF 00FF 0000
        DECLE   $0028,  $0020,  $0000,  $0000   ; 59AF   0028 0020 0000 0000
        DECLE   $0011,  $0050,  $0021,  $0000   ; 59B3   0011 0050 0021 0000
        DECLE   $0020,  $0001,  $0072,  $00FF   ; 59B7   0020 0001 0072 00FF
        DECLE   $00BF,  $00FF,  $00FB,  $0000   ; 59BB   00BF 00FF 00FB 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; 59BF   0000 0000 0020 0000
        DECLE   $0088,  $0020,  $0000,  $008A   ; 59C3   0088 0020 0000 008A
        DECLE   $0020,  $0001,  $00FF,  $00DF   ; 59C7   0020 0001 00FF 00DF
        DECLE   $00FE,  $00FF,  $00FF,  $0000   ; 59CB   00FE 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0008,  $0040   ; 59CF   0000 0000 0008 0040
        DECLE   $0000,  $0020,  $0038,  $00A2   ; 59D3   0000 0020 0038 00A2
        DECLE   $0049,  $00FF,  $00FD,  $00FF   ; 59D7   0049 00FF 00FD 00FF
        DECLE   $00EF,  $00FF,  $00FF,  $0000   ; 59DB   00EF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E3   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 59E7   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 59EB   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $005A,  $005A   ; 59EF   0000 0000 005A 005A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00A5,  $00A5   ; 59F7   0000 0000 00A5 00A5
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 59FB   0000 0000 0000 00FC
        DECLE   $0084,  $0084,  $0084,  $0084   ; 59FF   0084 0084 0084 0084
        DECLE   $0084,  $0084,  $0084,  $0084   ; 5A03   0084 0084 0084 0084
        DECLE   $00FC,  $0000,  $0000,  $0000   ; 5A07   00FC 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5A0B   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5A0F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5A13   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 5A17   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0275   ; 5A1B   0000 0000 0000 0275
        DECLE   $0010,  $020B,  $01B1,  $0340   ; 5A1F   0010 020B 01B1 0340
        DECLE   $0174,  $020D,  $01AD,  $0340   ; 5A23   0174 020D 01AD 0340
        DECLE   $0173,  $0204,  $01A9,  $0004   ; 5A27   0173 0204 01A9 0004

        XORR    R7,     R4                      ; 5A2B   01FC
        AND     .STIC.Y.7,R4                    ; 5A2C   0384 000F
L_5A2E:
        PSHR    R5                              ; 5A2E   0275
        DECLE   $0004,  $01FC,  $0390,  $0240   ; 5A2F   0004 01FC 0390 0240
        DECLE   $0173,  $0281,  $0162,  $03B9   ; 5A33   0173 0281 0162 03B9
        DECLE   $00F7,  $0241,  $0162,  $02BC   ; 5A37   00F7 0241 0162 02BC
        DECLE   $0247,  $0281,  $0165,  $0089   ; 5A3B   0247 0281 0165 0089
        DECLE   $020C,  $0011,  $0004,  $01DC   ; 5A3F   020C 0011 0004 01DC
        DECLE   $01D8                           ; 5A43   01D8

        COMR    R1                              ; 5A44   0019
        ADDR    R3,     R7                      ; 5A45   00DF

        DECLE   $0004,  $01DC,  $01D8           ; 5A46   0004 01DC 01D8

        GSWD    R1                              ; 5A49   0031
        ADDR    R3,     R7                      ; 5A4A   00DF

        DECLE   $0004,  $01DC,  $01D8           ; 5A4B   0004 01DC 01D8

        RLC     R2,     1                       ; 5A4E   0052
        ADDR    R3,     R7                      ; 5A4F   00DF
        B       L_5A5C                          ; 5A50   0200 000A

        DECLE   $0004,  $01DC,  $01D8           ; 5A52   0004 01DC 01D8

        NEGR    R5                              ; 5A55   0025
        ADDR    R3,     R7                      ; 5A56   00DF

        DECLE   $0004,  $01DC,  $01D8           ; 5A57   0004 01DC 01D8

        GSWD    R1                              ; 5A5A   0031
        ADDR    R3,     R7                      ; 5A5B   00DF

L_5A5C:
        JSR     R5,     L_63E2                  ; 5A5C   0004 0160 03E2
        DECLE   $02B1,  $02C5,  $02DA,  $0000   ; 5A5F   02B1 02C5 02DA 0000

        SLL     R0,     2                       ; 5A63   004C
        PSHR    R0                              ; 5A64   0270
        SLL     R0,     2                       ; 5A65   004C
        ADD@    R6,     R0                      ; 5A66   02F0
        ADDI    #$0247, R0                      ; 5A67   02F8 0247
        MOVR    R0,     R1                      ; 5A69   0081

        JSR     R5,     L_5F19                  ; 5A6A   0004 015C 0319

        PULR    R7                              ; 5A6D   02B7

L_5A6E:
        PSHR    R5                              ; 5A6E   0275
        DECLE   $0280,  $0165,  $0080,  $020C   ; 5A6F   0280 0165 0080 020C
        DECLE   $0008,  $02BC,  $0132,  $0001   ; 5A73   0008 02BC 0132 0001
L_5A77:
        MVI@    R4,     R1                      ; 5A77   02A1
        MVII    #$0008, R2                      ; 5A78   02BA 0008
        B       L_5A89                          ; 5A7A   0200 000D

        JSR     R5,     L_6C16                  ; 5A7C   0004 016C 0016

        DECR    R2                              ; 5A7F   0012
        SLL     R2,     2                       ; 5A80   004E
        SLL     R2,     2                       ; 5A81   004E
        SDBD                                    ; 5A82   0001
        ADDI    #$4085, R2                      ; 5A83   02FA 0085 0040
        MOVR    R2,     R1                      ; 5A86   0091
        MVII    #$0010, R2                      ; 5A87   02BA 0010
L_5A89:
        MVI     G_0162, R0                      ; 5A89   0280 0162
        ANDI    #$0008, R0                      ; 5A8B   03B8 0008
        BNEQ    L_5A99                          ; 5A8D   020C 000A

        MOVR    R1,     R4                      ; 5A8F   008C
        MVII    #$018C, R5                      ; 5A90   02BD 018C
        PSHR    R2                              ; 5A92   0272
L_5A93:
        MVI@    R4,     R0                      ; 5A93   02A0
        MVO@    R0,     R5                      ; 5A94   0268
        DECR    R2                              ; 5A95   0012
        BNEQ    L_5A93                          ; 5A96   022C 0004

        PULR    R2                              ; 5A98   02B2
L_5A99:
        MVI     G_0173, R0                      ; 5A99   0280 0173
        MVI     G_0177, R3                      ; 5A9B   0283 0177
        MVI     G_0162, R4                      ; 5A9D   0284 0162
        CMPI    #$0001, R0                      ; 5A9F   0378 0001
        BLT     L_5E5A                          ; 5AA1   0205 03B7
        BEQ     L_5C98                          ; 5AA3   0204 01F3

        CMPI    #$0003, R0                      ; 5AA5   0378 0003
        BLT     L_5BC9                          ; 5AA7   0205 0120
        BEQ     L_5ABD                          ; 5AA9   0204 0012

        CMPI    #$0005, R0                      ; 5AAB   0378 0005
        BLT     L_5AFD                          ; 5AAD   0205 004E
        BEQ     L_5B06                          ; 5AAF   0204 0055

        CMPI    #$0007, R0                      ; 5AB1   0378 0007
        BLT     L_5B25                          ; 5AB3   0205 0070
        BEQ     L_5B6F                          ; 5AB5   0204 00B8

        CMPI    #$0009, R0                      ; 5AB7   0378 0009
        BLT     L_5BA6                          ; 5AB9   0205 00EB
        B       L_5BD3                          ; 5ABB   0200 0116

L_5ABD:
        ANDI    #$0008, R4                      ; 5ABD   03BC 0008
        BEQ     L_5ACE                          ; 5ABF   0204 000D

L_5AC1:
        MVII    #$018C, R5                      ; 5AC1   02BD 018C
        MOVR    R1,     R4                      ; 5AC3   008C
L_5AC4:
        MVI@    R5,     R0                      ; 5AC4   02A8
        MVO@    R0,     R4                      ; 5AC5   0260
        DECR    R2                              ; 5AC6   0012
        BNEQ    L_5AC4                          ; 5AC7   022C 0004

        JSR     R5,     L_5A2E                  ; 5AC9   0004 0158 022E

        B       L_5BC4                          ; 5ACC   0200 00F6

L_5ACE:
        CLRR    R0                              ; 5ACE   01C0
        MOVR    R1,     R4                      ; 5ACF   008C
L_5AD0:
        MVO@    R0,     R4                      ; 5AD0   0260
        DECR    R2                              ; 5AD1   0012
        BNEQ    L_5AD0                          ; 5AD2   022C 0003

L_5AD4:
        MVI     G_0162, R0                      ; 5AD4   0280 0162
        XORI    #$0008, R0                      ; 5AD6   03F8 0008
        MVO     R0,     G_0162                  ; 5AD8   0240 0162
        MVI     G_0173, R0                      ; 5ADA   0280 0173
        SLL     R0,     2                       ; 5ADC   004C
        PSHR    R0                              ; 5ADD   0270
        SLL     R0,     2                       ; 5ADE   004C
        ADD@    R6,     R0                      ; 5ADF   02F0
        ADDI    #$0249, R0                      ; 5AE0   02F8 0249
        MOVR    R0,     R4                      ; 5AE2   0084
        MOVR    R4,     R3                      ; 5AE3   00A3
        SUBI    #$0002, R3                      ; 5AE4   033B 0002
        MVI@    R3,     R2                      ; 5AE6   029A
        XORI    #$0001, R2                      ; 5AE7   03FA 0001
        MVO@    R2,     R3                      ; 5AE9   025A
        SDBD                                    ; 5AEA   0001
        MVII    #$2C01, R3                      ; 5AEB   02BB 0001 002C

        JSR     R5,     L_DE4F                  ; 5AEE   0004 01DC 024F
        DECLE   $0005                           ; 5AF1   0005

        DECR    R4                              ; 5AF2   0014
        INCR    R5                              ; 5AF3   000D
        DIS                                     ; 5AF4   0003
        INCR    R6                              ; 5AF5   000E
        NEGR    R6                              ; 5AF6   0026
        MOVR    R4,     R1                      ; 5AF7   00A1

        JSR     R5,     L_5F2C                  ; 5AF8   0004 015C 032C

        B       L_5BC4                          ; 5AFB   0200 00C7

L_5AFD:
        MVI@    R1,     R0                      ; 5AFD   0288
        COMR    R0                              ; 5AFE   0018
        MVO@    R0,     R1                      ; 5AFF   0248
        INCR    R1                              ; 5B00   0009
        DECR    R2                              ; 5B01   0012
        BNEQ    L_5AFD                          ; 5B02   022C 0006
        B       L_5BC4                          ; 5B04   0200 00BE

L_5B06:
        MOVR    R1,     R4                      ; 5B06   008C
        SARC    R3,     1                       ; 5B07   007B
        BNC     L_5B16                          ; 5B08   0209 000C

        MVII    #$018C, R1                      ; 5B0A   02B9 018C
        ADDR    R2,     R1                      ; 5B0C   00D1
        DECR    R1                              ; 5B0D   0011
L_5B0E:
        MVI@    R1,     R0                      ; 5B0E   0288
        DECR    R1                              ; 5B0F   0011
        MVO@    R0,     R4                      ; 5B10   0260
        DECR    R2                              ; 5B11   0012
        BNEQ    L_5B0E                          ; 5B12   022C 0005
        B       L_5BC4                          ; 5B14   0200 00AE

L_5B16:
        MOVR    R1,     R5                      ; 5B16   008D
L_5B17:
        MVI@    R4,     R0                      ; 5B17   02A0
        MVII    #$0004, R1                      ; 5B18   02B9 0004
L_5B1A:
        SARC    R0,     2                       ; 5B1A   007C
        RLC     R3,     2                       ; 5B1B   0057
        DECR    R1                              ; 5B1C   0011
        BNEQ    L_5B1A                          ; 5B1D   022C 0004

        MVO@    R3,     R5                      ; 5B1F   026B
        DECR    R2                              ; 5B20   0012
        BNEQ    L_5B17                          ; 5B21   022C 000B
        B       L_5BC4                          ; 5B23   0200 009F

L_5B25:
        ANDI    #$0008, R4                      ; 5B25   03BC 0008
        BNEQ    L_5AC1                          ; 5B27   022C 0067

        SARC    R3,     1                       ; 5B29   007B
        BNC     L_5B4A                          ; 5B2A   0209 001E
        BNEQ    L_5B3D                          ; 5B2C   020C 000F

        ADDR    R2,     R1                      ; 5B2E   00D1
        DECR    R1                              ; 5B2F   0011
        CLRR    R3                              ; 5B30   01DB
L_5B31:
        MVI@    R1,     R0                      ; 5B31   0288
        COMR    R0                              ; 5B32   0018
        ANDR    R0,     R3                      ; 5B33   0183
        COMR    R0                              ; 5B34   0018
        XORR    R0,     R3                      ; 5B35   01C3
        MVO@    R3,     R1                      ; 5B36   024B
        DECR    R1                              ; 5B37   0011
        DECR    R2                              ; 5B38   0012
        BNEQ    L_5B31                          ; 5B39   022C 0009
        B       L_5AD4                          ; 5B3B   0220 0068

L_5B3D:
        CLRR    R3                              ; 5B3D   01DB
L_5B3E:
        MVI@    R1,     R0                      ; 5B3E   0288
        COMR    R0                              ; 5B3F   0018
        ANDR    R0,     R3                      ; 5B40   0183
        COMR    R0                              ; 5B41   0018
        XORR    R0,     R3                      ; 5B42   01C3
        MVO@    R3,     R1                      ; 5B43   024B
        INCR    R1                              ; 5B44   0009
        DECR    R2                              ; 5B45   0012
        BNEQ    L_5B3E                          ; 5B46   022C 0009
        B       L_5AD4                          ; 5B48   0220 0075
L_5B4A:
        BNEQ    L_5B5D                          ; 5B4A   020C 0011

L_5B4C:
        MVI@    R1,     R0                      ; 5B4C   0288
        SWAP    R0,     1                       ; 5B4D   0040
        BEQ     L_5B57                          ; 5B4E   0204 0007

        MVII    #$01FF, R3                      ; 5B50   02BB 01FF
L_5B52:
        SLR     R3,     1                       ; 5B52   0063
        RLC     R0,     1                       ; 5B53   0050
        BNC     L_5B52                          ; 5B54   0229 0003

        MVO@    R3,     R1                      ; 5B56   024B
L_5B57:
        INCR    R1                              ; 5B57   0009
        DECR    R2                              ; 5B58   0012
        BNEQ    L_5B4C                          ; 5B59   022C 000E
        B       L_5AD4                          ; 5B5B   0220 0088

L_5B5D:
        MVI@    R1,     R0                      ; 5B5D   0288
        TSTR    R0                              ; 5B5E   0080
        BEQ     L_5B69                          ; 5B5F   0204 0008

        MVII    #$00FF, R3                      ; 5B61   02BB 00FF
L_5B63:
        SLL     R3,     1                       ; 5B63   004B
        SARC    R0,     1                       ; 5B64   0078
        BNC     L_5B63                          ; 5B65   0229 0003

        SLR     R3,     1                       ; 5B67   0063
        MVO@    R3,     R1                      ; 5B68   024B
L_5B69:
        INCR    R1                              ; 5B69   0009
        DECR    R2                              ; 5B6A   0012
        BNEQ    L_5B5D                          ; 5B6B   022C 000F
        B       L_5AD4                          ; 5B6D   0220 009A

L_5B6F:
        SARC    R3,     1                       ; 5B6F   007B
        BNC     L_5B8F                          ; 5B70   0209 001D
        BNEQ    L_5B80                          ; 5B72   020C 000C

        MOVR    R1,     R4                      ; 5B74   008C
        MOVR    R1,     R5                      ; 5B75   008D
        MVI@    R4,     R3                      ; 5B76   02A3
        DECR    R2                              ; 5B77   0012
L_5B78:
        MVI@    R4,     R0                      ; 5B78   02A0
        MVO@    R0,     R5                      ; 5B79   0268
        DECR    R2                              ; 5B7A   0012
        BNEQ    L_5B78                          ; 5B7B   022C 0004

        MVO@    R3,     R5                      ; 5B7D   026B
        B       L_5BC4                          ; 5B7E   0200 0044

L_5B80:
        DECR    R2                              ; 5B80   0012
        ADDR    R2,     R1                      ; 5B81   00D1
        MVI@    R1,     R4                      ; 5B82   028C
        MOVR    R1,     R3                      ; 5B83   008B
        DECR    R3                              ; 5B84   0013
L_5B85:
        MVI@    R3,     R0                      ; 5B85   0298
        MVO@    R0,     R1                      ; 5B86   0248
        DECR    R1                              ; 5B87   0011
        DECR    R3                              ; 5B88   0013
        DECR    R2                              ; 5B89   0012
        BNEQ    L_5B85                          ; 5B8A   022C 0006

        MVO@    R4,     R1                      ; 5B8C   024C
        B       L_5BC4                          ; 5B8D   0200 0035
L_5B8F:
        BNEQ    L_5B9B                          ; 5B8F   020C 000A

L_5B91:
        MVI@    R1,     R0                      ; 5B91   0288
        SWAP    R0,     2                       ; 5B92   0044
        SLR     R0,     1                       ; 5B93   0060
        MVO@    R0,     R1                      ; 5B94   0248
        INCR    R1                              ; 5B95   0009
        DECR    R2                              ; 5B96   0012
        BNEQ    L_5B91                          ; 5B97   022C 0007
        B       L_5BC4                          ; 5B99   0200 0029

L_5B9B:
        MVI@    R1,     R0                      ; 5B9B   0288
        SWAP    R0,     2                       ; 5B9C   0044
        SLLC    R0,     1                       ; 5B9D   0058
        ADCR    R0                              ; 5B9E   0028
        MVO@    R0,     R1                      ; 5B9F   0248
        INCR    R1                              ; 5BA0   0009
        DECR    R2                              ; 5BA1   0012
        BNEQ    L_5B9B                          ; 5BA2   022C 0008
        B       L_5BC4                          ; 5BA4   0200 001E

L_5BA6:
        MVII    #$0008, R5                      ; 5BA6   02BD 0008
        MVII    #$0001, R0                      ; 5BA8   02B8 0001
        INCR    R7                              ; 5BAA   000F

L_5BAB:
        SLL     R0,     1                       ; 5BAB   0048
L_5BAC:
        MVII    #$0193, R2                      ; 5BAC   02BA 0193
        CLRR    R3                              ; 5BAE   01DB
L_5BAF:
        MVI@    R2,     R4                      ; 5BAF   0294
        ANDR    R0,     R4                      ; 5BB0   0184
        BEQ     L_5BB4                          ; 5BB1   0204 0001

        INCR    R3                              ; 5BB3   000B
L_5BB4:
        SLL     R3,     1                       ; 5BB4   004B
        DECR    R2                              ; 5BB5   0012
        CMPI    #$018C, R2                      ; 5BB6   037A 018C
        BGE     L_5BAF                          ; 5BB8   022D 000A

        SLR     R3,     1                       ; 5BBA   0063
        DECR    R5                              ; 5BBB   0015
        ADDR    R5,     R1                      ; 5BBC   00E9
        MVO@    R3,     R1                      ; 5BBD   024B
        SUBR    R5,     R1                      ; 5BBE   0129
        TSTR    R5                              ; 5BBF   00AD
        BNEQ    L_5BAB                          ; 5BC0   022C 0016
        B       L_5BC4                          ; 5BC2   0200 0000

L_5BC4:
        MVI     G_0165, R0                      ; 5BC4   0280 0165
        J       L_6395                          ; 5BC6   0004 0360 0395

L_5BC9:
        ANDI    #$0008, R4                      ; 5BC9   03BC 0008
        BNEQ    L_5AC1                          ; 5BCB   022C 010B

        MOVR    R7,     R4                      ; 5BCD   00BC
        ADDI    #$0006, R4                      ; 5BCE   02FC 0006

        JSR     R5,     L_540A                  ; 5BD0   0004 0154 000A

L_5BD3:
        PULR    R7                              ; 5BD3   02B7

        COMR    R1                              ; 5BD4   0019
        ADDR    R3,     R0                      ; 5BD5   00D8
        ADDR    R7,     R5                      ; 5BD6   00FD
        SLR     R3,     1                       ; 5BD7   0063
        SLLC    R0,     2                       ; 5BD8   005C
        NEGR    R1                              ; 5BD9   0021
        SLLC    R0,     2                       ; 5BDA   005C
        ADD@    R6,     R1                      ; 5BDB   02F1
        CLRR    R1                              ; 5BDC   01C9
        MVI     G_0165, R0                      ; 5BDD   0280 0165
        TSTR    R0                              ; 5BDF   0080
        PSHR    R0                              ; 5BE0   0270
        BEQ     L_5BE7                          ; 5BE1   0204 0004

        MVO     R1,     G_031E                  ; 5BE3   0241 031E
        B       L_5BE9                          ; 5BE5   0200 0002

L_5BE7:
        MVO     R1,     G_0326                  ; 5BE7   0241 0326
L_5BE9:
        MVII    #$0283, R4                      ; 5BE9   02BC 0283

        JSR     R5,     L_5F07                  ; 5BEB   0004 015C 0307

        MVII    #$0005, R1                      ; 5BEE   02B9 0005
        PULR    R0                              ; 5BF0   02B0
        TSTR    R0                              ; 5BF1   0080
        BNEQ    L_5BF6                          ; 5BF2   020C 0002

        MVII    #$0003, R1                      ; 5BF4   02B9 0003
L_5BF6:
        MVO     R1,     G_017B                  ; 5BF6   0241 017B
        MVII    #$0285, R4                      ; 5BF8   02BC 0285
        TSTR    R0                              ; 5BFA   0080
        BNEQ    L_5C0C                          ; 5BFB   020C 000F

        JSR     R5,     L_DDD3                  ; 5BFD   0004 01DC 01D3
        DECLE   $00B1,  $01CC,  $0396,  $00E8   ; 5C00   00B1 01CC 0396 00E8
        DECLE   $0047,  $0382,  $0011,  $007E   ; 5C04   0047 0382 0011 007E
        DECLE   $01BE,  $0000,  $0200,  $000D   ; 5C08   01BE 0000 0200 000D
L_5C0C:
        JSR     R5,     L_DDD3                  ; 5C0C   0004 01DC 01D3
        DECLE   $00B1,  $01CC,  $0396,  $00E8   ; 5C0F   00B1 01CC 0396 00E8
        DECLE   $0047,  $038F                   ; 5C13   0047 038F

        SUBR    R0,     R2                      ; 5C15   0102
        XOR@    R1,     R3                      ; 5C16   03CB
        XOR@    R1,     R5                      ; 5C17   03CD
        XOR     .BTAB.B8,R0                     ; 5C18   03C0 02B8
        ADDR    R2,     R6                      ; 5C1A   00D6
        MVO     R0,     G_0138                  ; 5C1B   0240 0138
        CLRR    R0                              ; 5C1D   01C0
        MVO     R0,     G_0137                  ; 5C1E   0240 0137
        PULR    R7                              ; 5C20   02B7

        PSHR    R5                              ; 5C21   0275
        MVI     G_0137, R0                      ; 5C22   0280 0137
        DECR    R0                              ; 5C24   0010
        BMI     L_5C64                          ; 5C25   020B 003D

        MVI     G_0165, R1                      ; 5C27   0281 0165
        TSTR    R1                              ; 5C29   0089
        BNEQ    L_5C3F                          ; 5C2A   020C 0013

        CMPI    #$002C, R0                      ; 5C2C   0378 002C
        BGT     L_5C5F                          ; 5C2E   020E 002F

        MVII    #$0132, R4                      ; 5C30   02BC 0132
        SDBD                                    ; 5C32   0001
        MVI@    R4,     R5                      ; 5C33   02A5
        SLL     R0,     2                       ; 5C34   004C
        SLL     R0,     1                       ; 5C35   0048
        SDBD                                    ; 5C36   0001
        ADDI    #$465F, R0                      ; 5C37   02F8 005F 0046
        MOVR    R0,     R4                      ; 5C3A   0084
        MVII    #$0008, R1                      ; 5C3B   02B9 0008
        B       L_5C55                          ; 5C3D   0200 0016

L_5C3F:
        CMPI    #$003F, R0                      ; 5C3F   0378 003F
        BGT     L_5C5F                          ; 5C41   020E 001C

        SLL     R0,     2                       ; 5C43   004C
        SLL     R0,     2                       ; 5C44   004C
        SDBD                                    ; 5C45   0001
        MVII    #$4085, R3                      ; 5C46   02BB 0085 0040
        ADDR    R3,     R0                      ; 5C49   00D8
        MOVR    R0,     R4                      ; 5C4A   0084

        JSR     R5,     L_6C16                  ; 5C4B   0004 016C 0016

        DECR    R2                              ; 5C4E   0012
        SLL     R2,     2                       ; 5C4F   004E
        SLL     R2,     2                       ; 5C50   004E
        ADDR    R3,     R2                      ; 5C51   00DA
        MOVR    R2,     R5                      ; 5C52   0095
        MVII    #$0010, R1                      ; 5C53   02B9 0010
L_5C55:
        MVI@    R4,     R0                      ; 5C55   02A0
        MVO@    R0,     R5                      ; 5C56   0268
        DECR    R1                              ; 5C57   0011
        BNEQ    L_5C55                          ; 5C58   022C 0004

        JSR     R5,     L_5C63                  ; 5C5A   0004 015C 0063

        B       L_5AD4                          ; 5C5D   0220 018A

L_5C5F:
        JSR     R5,     L_FDF8                  ; 5C5F   0004 01FC 01F8

        PULR    R7                              ; 5C62   02B7

L_5C63:
        PSHR    R5                              ; 5C63   0275
L_5C64:
        MVI     G_017C, R0                      ; 5C64   0280 017C
        MVO     R0,     G_017B                  ; 5C66   0240 017B
        B       L_5C6E                          ; 5C68   0200 0004

        PSHR    R5                              ; 5C6A   0275

        JSR     R5,     L_5F05                  ; 5C6B   0004 015C 0305

L_5C6E:
        MOVR    R7,     R4                      ; 5C6E   00BC
        ADDI    #$0006, R4                      ; 5C6F   02FC 0006

        JSR     R5,     L_540A                  ; 5C71   0004 0154 000A

        PULR    R7                              ; 5C74   02B7

        DECLE   $001F                           ; 5C75   001F

        COMR    R6                              ; 5C76   001E
        SLLC    R2,     1                       ; 5C77   005A
        SLLC    R3,     2                       ; 5C78   005F
        SLR     R3,     1                       ; 5C79   0063
        ADDR    R1,     R6                      ; 5C7A   00CE
        SLR     R2,     1                       ; 5C7B   0062
        RRC     R0,     2                       ; 5C7C   0074
        SLLC    R3,     2                       ; 5C7D   005F
        SAR     R2,     2                       ; 5C7E   006E
        SLLC    R2,     1                       ; 5C7F   005A
        ADD@    R6,     R6                      ; 5C80   02F6
        ADDR    R0,     R0                      ; 5C81   00C0
        SLR     R3,     1                       ; 5C82   0063
        ADD@    R6,     R1                      ; 5C83   02F1
        MVI     G_0165, R0                      ; 5C84   0280 0165
        TSTR    R0                              ; 5C86   0080
        BNEQ    L_5C8C                          ; 5C87   020C 0003
        J       L_623E                          ; 5C89   0004 0360 023E

L_5C8C:
        SDBD                                    ; 5C8C   0001
        MVII    #$6B37, R0                      ; 5C8D   02B8 0037 006B
        MVO     R0,     G_0183                  ; 5C90   0240 0183
        SWAP    R0,     1                       ; 5C92   0040
        MVO     R0,     G_0184                  ; 5C93   0240 0184
        J       L_6CB5                          ; 5C95   0004 036C 00B5

L_5C98:
        MOVR    R7,     R4                      ; 5C98   00BC
        ADDI    #$0054, R4                      ; 5C99   02FC 0054
        MVI     G_0165, R0                      ; 5C9B   0280 0165
        TSTR    R0                              ; 5C9D   0080
        BEQ     L_5CA3                          ; 5C9E   0204 0003

        MOVR    R7,     R4                      ; 5CA0   00BC
        ADDI    #$0006, R4                      ; 5CA1   02FC 0006

L_5CA3:
        JSR     R5,     L_540A                  ; 5CA3   0004 0154 000A

        PULR    R7                              ; 5CA6   02B7

        DECLE   $001F                           ; 5CA7   001F

        ADDR    R3,     R0                      ; 5CA8   00D8
        ADDR    R7,     R5                      ; 5CA9   00FD
        SLLC    R3,     2                       ; 5CAA   005F
        SLR     R3,     1                       ; 5CAB   0063
        ADDR    R1,     R6                      ; 5CAC   00CE
        SLR     R2,     1                       ; 5CAD   0062
        SLR     R3,     1                       ; 5CAE   0063
        SLLC    R0,     2                       ; 5CAF   005C
        DECR    R6                              ; 5CB0   0016
        SAR     R1,     2                       ; 5CB1   006D
        ADD@    R6,     R6                      ; 5CB2   02F6
        ADDR    R0,     R0                      ; 5CB3   00C0
        SLR     R3,     1                       ; 5CB4   0063
        ADD@    R6,     R1                      ; 5CB5   02F1
        MVII    #$026F, R4                      ; 5CB6   02BC 026F

        JSR     R5,     L_5F07                  ; 5CB8   0004 015C 0307

        MVII    #$0005, R0                      ; 5CBB   02B8 0005
        MVO     R0,     G_017B                  ; 5CBD   0240 017B
        MVII    #$026F, R4                      ; 5CBF   02BC 026F

        JSR     R5,     L_DDD3                  ; 5CC1   0004 01DC 01D3
        DECLE   $0253,  $0011,  $027A,  $0013   ; 5CC4   0253 0011 027A 0013
        DECLE   $039A,  $01E8,  $0053,  $03CB   ; 5CC8   039A 01E8 0053 03CB
        DECLE   $039C,  $00EE,  $02DA,  $0180   ; 5CCC   039C 00EE 02DA 0180
        DECLE   $01B8,  $038F                   ; 5CD0   01B8 038F

        SUBR    R0,     R2                      ; 5CD2   0102
        PSHR    R4                              ; 5CD3   0274
        BEQ     L_5A77                          ; 5CD4   0224 025E

        ANDR    R7,     R4                      ; 5CD6   01BC
        XOR     .BTAB.80,R0                     ; 5CD7   03C0 0280
        BUSC    L_5F5C                          ; 5CD9   0207 0281

        SKIP                                    ; 5CDB   0208
        MVO     R0,     .BTAB.89                ; 5CDC   0240 0289
        MVO     R1,     .BTAB.8A                ; 5CDE   0241 028A
        MVI     G_01A3, R0                      ; 5CE0   0280 01A3
        SLR     R0,     1                       ; 5CE2   0060
        MVO     R0,     G_0324                  ; 5CE3   0240 0324
        MVII    #$00D6, R4                      ; 5CE5   02BC 00D6
        MVO     R4,     G_0138                  ; 5CE7   0244 0138
        CLRR    R0                              ; 5CE9   01C0
        MVO     R0,     G_0137                  ; 5CEA   0240 0137
        PULR    R7                              ; 5CEC   02B7

        COMR    R2                              ; 5CED   001A
        COMR    R6                              ; 5CEE   001E
        SLLC    R1,     2                       ; 5CEF   005D
        SAR     R2,     1                       ; 5CF0   006A
        SLLC    R0,     2                       ; 5CF1   005C
        SAR     R2,     1                       ; 5CF2   006A
        SLLC    R0,     2                       ; 5CF3   005C
        ADD@    R6,     R5                      ; 5CF4   02F5
        ADD@    R6,     R1                      ; 5CF5   02F1

        JSR     R5,     L_5F05                  ; 5CF6   0004 015C 0305

        MVII    #$0004, R0                      ; 5CF9   02B8 0004
        MVO     R0,     G_0176                  ; 5CFB   0240 0176
        MVII    #$0066, R0                      ; 5CFD   02B8 0066
        MVO     R0,     G_019C                  ; 5CFF   0240 019C

        JSR     R5,     L_6116                  ; 5D01   0004 0160 0116
        DECLE   $0000                           ; 5D04   0000
        BIDECLE $30C6                           ; 5D05   00C6 0030

        MVII    #$0003, R0                      ; 5D07   02B8 0003
        MVO     R0,     G_017B                  ; 5D09   0240 017B
        MVII    #$020D, R4                      ; 5D0B   02BC 020D

        JSR     R5,     L_DDD3                  ; 5D0D   0004 01DC 01D3
        DECLE   $004E,  $016E,  $023E,  $0000   ; 5D10   004E 016E 023E 0000

        MVII    #$0001, R0                      ; 5D14   02B8 0001
        MVO     R0,     G_017B                  ; 5D16   0240 017B
        MVI     G_0164, R0                      ; 5D18   0280 0164
        ANDI    #$0001, R0                      ; 5D1A   03B8 0001
        B       L_5D31                          ; 5D1C   0200 0013

L_5D1E:
        PSHR    R5                              ; 5D1E   0275

        JSR     R5,     L_FE65                  ; 5D1F   0004 01FC 0265
        DECLE   $0046,  $002C,  $005D,  $0042   ; 5D22   0046 002C 005D 0042
        DECLE   $0029,  $005D,  $0000           ; 5D26   0029 005D 0000

        MVII    #$0001, R0                      ; 5D29   02B8 0001
        INCR    R7                              ; 5D2B   000F

        CLRR    R0                              ; 5D2C   01C0
L_5D2D:
        CMP     G_0173, R0                      ; 5D2D   0340 0173
        BEQ     L_5BD3                          ; 5D2F   0224 015D

L_5D31:
        MVO     R0,     G_0173                  ; 5D31   0240 0173
        MVI     G_0164, R1                      ; 5D33   0281 0164
        ANDI    #$00FE, R1                      ; 5D35   03B9 00FE
        XORR    R0,     R1                      ; 5D37   01C1
        MVO     R1,     G_0164                  ; 5D38   0241 0164
        MVII    #$02B8, R4                      ; 5D3A   02BC 02B8
        MVI     G_0165, R2                      ; 5D3C   0282 0165
        CMPI    #$0002, R2                      ; 5D3E   037A 0002
        BEQ     L_5D4A                          ; 5D40   0204 0008

        MVII    #$0220, R4                      ; 5D42   02BC 0220
        ANDI    #$0010, R1                      ; 5D44   03B9 0010
        BEQ     L_5D4A                          ; 5D46   0204 0002

        MVII    #$02B8, R4                      ; 5D48   02BC 02B8
L_5D4A:
        PSHR    R4                              ; 5D4A   0274

        JSR     R5,     L_DDD3                  ; 5D4B   0004 01DC 01D3
        DECLE   $00BA,  $00B1,  $01CD,  $027A   ; 5D4E   00BA 00B1 01CD 027A

        AND     G_0341, R1                      ; 5D52   0381 0341
        EIS                                     ; 5D54   0002
        CMPR    R3,     R2                      ; 5D55   015A
        XOR     .BTAB.B4,R0                     ; 5D56   03C0 02B4
        TSTR    R0                              ; 5D58   0080
        BEQ     L_5D5D                          ; 5D59   0204 0002

        ADDI    #$0014, R4                      ; 5D5B   02FC 0014
L_5D5D:
        PSHR    R0                              ; 5D5D   0270
        DECLE   $0004,  $01FC,  $03B0,  $0007   ; 5D5E   0004 01FC 03B0 0007
        DECLE   $0006,  $0000                   ; 5D62   0006 0000

        PULR    R0                              ; 5D64   02B0
        TSTR    R0                              ; 5D65   0080
        BNEQ    L_5D79                          ; 5D66   020C 0011

        JSR     R5,     L_5DF8                  ; 5D68   0004 015C 01F8
        DECLE   $025C                           ; 5D6B   025C

        MVII    #$02AB, R4                      ; 5D6C   02BC 02AB

        JSR     R5,     L_5F07                  ; 5D6E   0004 015C 0307
        JSR     R5,     L_5E3F                  ; 5D71   0004 015C 023F

        MOVR    R7,     R0                      ; 5D74   00B8
        ADDI    #$0014, R0                      ; 5D75   02F8 0014
        B       L_5D83                          ; 5D77   0200 000A

L_5D79:
        JSR     R5,     L_5DF4                  ; 5D79   0004 015C 01F4
        DECLE   $025C                           ; 5D7C   025C

        JSR     R5,     L_5E2A                  ; 5D7D   0004 015C 022A

        MOVR    R7,     R0                      ; 5D80   00B8
        ADDI    #$0010, R0                      ; 5D81   02F8 0010
L_5D83:
        MVO     R0,     G_0181                  ; 5D83   0240 0181
        SWAP    R0,     1                       ; 5D85   0040
        MVO     R0,     G_0182                  ; 5D86   0240 0182
        PULR    R7                              ; 5D88   02B7

        PSHR    R5                              ; 5D89   0275

        JSR     R5,     L_5E3F                  ; 5D8A   0004 015C 023F

        MVII    #$0008, R4                      ; 5D8D   02BC 0008
        B       L_5D97                          ; 5D8F   0200 0006

        PSHR    R5                              ; 5D91   0275

        JSR     R5,     L_5E2A                  ; 5D92   0004 015C 022A

        MVII    #$0010, R4                      ; 5D95   02BC 0010
L_5D97:
        MVII    #$0004, R3                      ; 5D97   02BB 0004
        DECLE   $0004,  $01FC,  $0226           ; 5D99   0004 01FC 0226

        MVI     G_0173, R0                      ; 5D9C   0280 0173
        TSTR    R0                              ; 5D9E   0080
        BNEQ    L_5DAA                          ; 5D9F   020C 0009

        JSR     R5,     L_5DD8                  ; 5DA1   0004 015C 01D8

        MVI@    R1,     R0                      ; 5DA4   0288
        ANDI    #$00F8, R0                      ; 5DA5   03B8 00F8
        XORR    R2,     R0                      ; 5DA7   01D0
        B       L_5DB6                          ; 5DA8   0200 000C

L_5DAA:
        ADDR    R7,     R2                      ; 5DAA   00FA
        ADDI    #$0058, R2                      ; 5DAB   02FA 0058
        MVI@    R2,     R2                      ; 5DAD   0292
        SLL     R2,     2                       ; 5DAE   004E

        JSR     R5,     L_5DD8                  ; 5DAF   0004 015C 01D8

        MVI@    R1,     R0                      ; 5DB2   0288
        ANDI    #$0007, R0                      ; 5DB3   03B8 0007
        XORR    R2,     R0                      ; 5DB5   01D0
L_5DB6:
        MVO@    R0,     R1                      ; 5DB6   0248
        DECLE   $0379,  $03FF,  $0201,  $0018   ; 5DB7   0379 03FF 0201 0018

        MVI     G_0164, R0                      ; 5DBB   0280 0164
        ANDI    #$0010, R0                      ; 5DBD   03B8 0010
        BNEQ    L_5DC8                          ; 5DBF   020C 0007

        JSR     R5,     L_6019                  ; 5DC1   0004 0160 0019

        MVO     R0,     .BTAB.09                ; 5DC4   0240 0209
        B       L_5DCB                          ; 5DC6   0200 0003

L_5DC8:
        JSR     R5,     L_6502                  ; 5DC8   0004 0164 0102

L_5DCB:
        MVI     G_0173, R0                      ; 5DCB   0280 0173
        PULR    R5                              ; 5DCD   02B5
        TSTR    R0                              ; 5DCE   0080
        BEQ     L_5E3F                          ; 5DCF   0204 006E
        B       L_5E2A                          ; 5DD1   0200 0057

        DECLE   $0004                           ; 5DD3   0004

        ANDR    R3,     R4                      ; 5DD4   019C
        CMP     .BTAB.20,R0                     ; 5DD5   0340 0220
        INCR    R4                              ; 5DD7   000C
L_5DD8:
        MVII    #$018B, R1                      ; 5DD8   02B9 018B
        PSHR    R0                              ; 5DDA   0270
        MVI     G_0165, R0                      ; 5DDB   0280 0165
        CMPI    #$0002, R0                      ; 5DDD   0378 0002
        BNEQ    L_5DEC                          ; 5DDF   020C 000B

        SDBD                                    ; 5DE1   0001
        MVII    #$8AF8, R1                      ; 5DE2   02B9 00F8 008A
        MVI     G_01C5, R0                      ; 5DE5   0280 01C5
        TSTR    R0                              ; 5DE7   0080
        BEQ     L_5DEC                          ; 5DE8   0204 0002

        ADDI    #$0002, R1                      ; 5DEA   02F9 0002
L_5DEC:
        PULR    R0                              ; 5DEC   02B0
        MOVR    R5,     R7                      ; 5DED   00AF

L_5DEE:
        ADDR    R7,     R2                      ; 5DEE   00FA
        ADDI    #$0014, R2                      ; 5DEF   02FA 0014
        MVI@    R2,     R2                      ; 5DF1   0292
        SWAP    R2,     1                       ; 5DF2   0042
        MOVR    R5,     R7                      ; 5DF3   00AF

L_5DF4:
        MVII    #$0036, R3                      ; 5DF4   02BB 0036
        B       L_5DFA                          ; 5DF6   0200 0002

L_5DF8:
        MVII    #$0026, R3                      ; 5DF8   02BB 0026
L_5DFA:
        SWAP    R3,     1                       ; 5DFA   0043
        MVI@    R5,     R4                      ; 5DFB   02AC
        MVII    #$0004, R2                      ; 5DFC   02BA 0004
        PSHR    R5                              ; 5DFE   0275
        MOVR    R2,     R1                      ; 5DFF   0091

        JSR     R5,     L_5E13                  ; 5E00   0004 015C 0213
        DECLE   $0000,  $0002,  $0004,  $0006   ; 5E03   0000 0002 0004 0006
        DECLE   $0020,  $0022,  $0024,  $0026   ; 5E07   0020 0022 0024 0026
        DECLE   $0010,  $0012,  $0014,  $0016   ; 5E0B   0010 0012 0014 0016
        DECLE   $0030,  $0032,  $0034,  $0036   ; 5E0F   0030 0032 0034 0036
L_5E13:
        SUBI    #$0200, R4                      ; 5E13   033C 0200
        MVO     R4,     G_0179                  ; 5E15   0244 0179
        ADDI    #$0200, R4                      ; 5E17   02FC 0200
L_5E19:
        MVI@    R5,     R0                      ; 5E19   02A8
        SWAP    R0,     1                       ; 5E1A   0040
        MVO@    R0,     R4                      ; 5E1B   0260
        CMPR    R3,     R0                      ; 5E1C   0158
        BEQ     L_5BD3                          ; 5E1D   0224 024B

        INCR    R4                              ; 5E1F   000C
        DECR    R2                              ; 5E20   0012
        BNEQ    L_5E19                          ; 5E21   022C 0009

        MVI     G_0179, R4                      ; 5E23   0284 0179
        ADDI    #$0228, R4                      ; 5E25   02FC 0228
        MOVR    R1,     R2                      ; 5E27   008A
        B       L_5E13                          ; 5E28   0220 0016

L_5E2A:
        PSHR    R5                              ; 5E2A   0275

        JSR     R5,     L_5DD8                  ; 5E2B   0004 015C 01D8

        PULR    R5                              ; 5E2E   02B5
        MVI@    R1,     R3                      ; 5E2F   028B
        ANDI    #$00F8, R3                      ; 5E30   03BB 00F8
        SLR     R3,     2                       ; 5E32   0067
        CLRR    R1                              ; 5E33   01C9
        SDBD                                    ; 5E34   0001
        MVII    #$5E03, R4                      ; 5E35   02BC 0003 005E
L_5E38:
        MVI@    R4,     R2                      ; 5E38   02A2
        CMPR    R3,     R2                      ; 5E39   015A
        BEQ     L_5E47                          ; 5E3A   0204 000B

        INCR    R1                              ; 5E3C   0009
        B       L_5E38                          ; 5E3D   0220 0006

L_5E3F:
        PSHR    R5                              ; 5E3F   0275

        JSR     R5,     L_5DD8                  ; 5E40   0004 015C 01D8

        PULR    R5                              ; 5E43   02B5
        MVI@    R1,     R1                      ; 5E44   0289
        ANDI    #$0007, R1                      ; 5E45   03B9 0007
L_5E47:
        MVII    #$0327, R4                      ; 5E47   02BC 0327
L_5E49:
        MOVR    R1,     R3                      ; 5E49   008B
        MOVR    R1,     R2                      ; 5E4A   008A
        ANDI    #$0003, R1                      ; 5E4B   03B9 0003
        XORR    R1,     R3                      ; 5E4D   01CB
        SLL     R1,     2                       ; 5E4E   004D
        SLL     R1,     2                       ; 5E4F   004D
        ADD     G_019C, R1                      ; 5E50   02C1 019C
        SWAP    R1,     1                       ; 5E52   0041
        SLL     R3,     2                       ; 5E53   004F
        ADDI    #$0027, R3                      ; 5E54   02FB 0027
        SWAP    R3,     1                       ; 5E56   0043
        MVO@    R1,     R4                      ; 5E57   0261
        MVO@    R3,     R4                      ; 5E58   0263
        MOVR    R5,     R7                      ; 5E59   00AF

L_5E5A:
        MVI     G_0165, R0                      ; 5E5A   0280 0165
        TSTR    R0                              ; 5E5C   0080
        BNEQ    L_5BD3                          ; 5E5D   022C 028B

        JSR     R5,     L_5F05                  ; 5E5F   0004 015C 0305

        MVO     R0,     .BTAB.09                ; 5E62   0240 0209
        MVI     G_0164, R0                      ; 5E64   0280 0164
        XORI    #$0002, R0                      ; 5E66   03F8 0002
        MVO     R0,     G_0164                  ; 5E68   0240 0164

        JSR     R5,     L_5401                  ; 5E6A   0004 0154 0001
        BIDECLE $5E70                           ; 5E6D   0070 005E

        PULR    R7                              ; 5E6F   02B7

        DECLE   $009E,  $005F,  $0063,  $00CE   ; 5E70   009E 005F 0063 00CE
        DECLE   $0062,  $00E0,  $0061,  $00E0   ; 5E74   0062 00E0 0061 00E0
        DECLE   $0061,  $0035                   ; 5E78   0061 0035

        SLR     R0,     1                       ; 5E7A   0060
        ADD@    R6,     R6                      ; 5E7B   02F6
        ADDR    R0,     R0                      ; 5E7C   00C0
        SLR     R3,     1                       ; 5E7D   0063
        ADD@    R6,     R1                      ; 5E7E   02F1
        MVII    #$0131, R1                      ; 5E7F   02B9 0131
        MVO     R1,     G_016C                  ; 5E81   0241 016C
        SWAP    R1,     1                       ; 5E83   0041
        MVO     R1,     G_016D                  ; 5E84   0241 016D
        MVI     G_0189, R0                      ; 5E86   0280 0189
        SLL     R0,     2                       ; 5E88   004C
        SLL     R0,     1                       ; 5E89   0048
        SDBD                                    ; 5E8A   0001
        ADDI    #$3800, R0                      ; 5E8B   02F8 0000 0038
        MVO     R0,     G_0134                  ; 5E8E   0240 0134
        SWAP    R0,     1                       ; 5E90   0040
        MVO     R0,     G_0135                  ; 5E91   0240 0135

        JSR     R5,     L_601D                  ; 5E93   0004 0160 001D

        MVO     R0,     .BTAB.09                ; 5E96   0240 0209

        JSR     R5,     L_5E9C                  ; 5E98   0004 015C 029C

        PULR    R7                              ; 5E9B   02B7

L_5E9C:
        PSHR    R5                              ; 5E9C   0275

        JSR     R5,     L_5FCC                  ; 5E9D   0004 015C 03CC

        INCR    R7                              ; 5EA0   000F

L_5EA1:
        PSHR    R5                              ; 5EA1   0275
L_5EA2:
        MVI     G_018A, R1                      ; 5EA2   0281 018A
        MVII    #$0014, R2                      ; 5EA4   02BA 0014

        JSR     R5,     X_DIV                   ; 5EA6   0004 011C 01FB

        SDBD                                    ; 5EA9   0001
        MVII    #$47C7, R2                      ; 5EAA   02BA 00C7 0047
        MVI@    R2,     R2                      ; 5EAD   0292

        JSR     R5,     L_5DEE                  ; 5EAE   0004 015C 01EE

        MVII    #$0009, R3                      ; 5EB1   02BB 0009
        MVII    #$020B, R4                      ; 5EB3   02BC 020B
        CMPI    #$0005, R0                      ; 5EB5   0378 0005
        BGT     L_5EBD                          ; 5EB7   020E 0004

        MVII    #$021F, R5                      ; 5EB9   02BD 021F
        B       L_5EC0                          ; 5EBB   0200 0003

L_5EBD:
        MOVR    R4,     R5                      ; 5EBD   00A5
        MVII    #$02E7, R4                      ; 5EBE   02BC 02E7
L_5EC0:
        MVO@    R2,     R4                      ; 5EC0   0262
        DECR    R3                              ; 5EC1   0013
        BNEQ    L_5EC0                          ; 5EC2   022C 0003

        MVII    #$0009, R3                      ; 5EC4   02BB 0009
        TSTR    R1                              ; 5EC6   0089
        BEQ     L_5ED3                          ; 5EC7   0204 000A

        CMPI    #$000C, R1                      ; 5EC9   0379 000C
        BLT     L_5EDE                          ; 5ECB   0205 0011

        MVII    #$0213, R4                      ; 5ECD   02BC 0213
        MVII    #$000C, R1                      ; 5ECF   02B9 000C
        B       L_5ED6                          ; 5ED1   0200 0003

L_5ED3:
        INCR    R5                              ; 5ED3   000D
        MVII    #$020B, R4                      ; 5ED4   02BC 020B
L_5ED6:
        DECR    R3                              ; 5ED6   0013
L_5ED7:
        MVO@    R2,     R4                      ; 5ED7   0262
        ADDI    #$0013, R4                      ; 5ED8   02FC 0013
        CMPI    #$02F0, R4                      ; 5EDA   037C 02F0
        BLT     L_5ED7                          ; 5EDC   0225 0006

L_5EDE:
        ADDR    R1,     R1                      ; 5EDE   00C9
        CMPI    #$0005, R0                      ; 5EDF   0378 0005
        BLE     L_5EE5                          ; 5EE1   0206 0002

        ADDI    #$0028, R1                      ; 5EE3   02F9 0028
L_5EE5:
        SDBD                                    ; 5EE5   0001
        ADDI    #$8800, R1                      ; 5EE6   02F9 0000 0088
        MVII    #$000B, R2                      ; 5EE9   02BA 000B
        MOVR    R1,     R4                      ; 5EEB   008C
L_5EEC:
        MOVR    R4,     R1                      ; 5EEC   00A1
        MVO     R3,     G_0179                  ; 5EED   0243 0179
        MVO     R5,     G_0324                  ; 5EEF   0245 0324
L_5EF1:
        SDBD                                    ; 5EF1   0001
        MVI@    R4,     R0                      ; 5EF2   02A0
        MVO@    R0,     R5                      ; 5EF3   0268
        DECR    R3                              ; 5EF4   0013
        BNEQ    L_5EF1                          ; 5EF5   022C 0005

        DECR    R2                              ; 5EF7   0012
        BEQ     L_5BD3                          ; 5EF8   0224 0326

        MVI     G_0179, R3                      ; 5EFA   0283 0179
        MVI     G_0324, R5                      ; 5EFC   0285 0324
        MOVR    R1,     R4                      ; 5EFE   008C
        ADDI    #$0014, R5                      ; 5EFF   02FD 0014
        ADDI    #$0028, R4                      ; 5F01   02FC 0028
        B       L_5EEC                          ; 5F03   0220 0018

L_5F05:
        MVII    #$020B, R4                      ; 5F05   02BC 020B
L_5F07:
        CLRR    R0                              ; 5F07   01C0
        MOVR    R4,     R2                      ; 5F08   00A2
        MVII    #$0009, R1                      ; 5F09   02B9 0009
L_5F0B:
        MVO@    R0,     R4                      ; 5F0B   0260
        DECR    R1                              ; 5F0C   0011
        BNEQ    L_5F0B                          ; 5F0D   022C 0003

        CMPI    #$02F0, R4                      ; 5F0F   037C 02F0
        BGE     L_5F18                          ; 5F11   020D 0005

        MOVR    R2,     R4                      ; 5F13   0094
        ADDI    #$0014, R4                      ; 5F14   02FC 0014
        B       L_5F07                          ; 5F16   0220 0010
L_5F18:
        MOVR    R5,     R7                      ; 5F18   00AF

L_5F19:
        CLRR    R2                              ; 5F19   01D2
L_5F1A:
        MVI@    R1,     R3                      ; 5F1A   028B
        TSTR    R3                              ; 5F1B   009B
        BEQ     L_5F26                          ; 5F1C   0204 0008

L_5F1E:
        SDBD                                    ; 5F1E   0001
        XORI    #$2401, R3                      ; 5F1F   03FB 0001 0024
        MVO@    R3,     R1                      ; 5F22   024B
        INCR    R1                              ; 5F23   0009
        B       L_5F1A                          ; 5F24   0220 000B

L_5F26:
        TSTR    R2                              ; 5F26   0092
        BNEQ    L_5F2C                          ; 5F27   020C 0003

        INCR    R2                              ; 5F29   000A
        B       L_5F1E                          ; 5F2A   0220 000D

L_5F2C:
        SDBD                                    ; 5F2C   0001
        MVII    #$09C6, R3                      ; 5F2D   02BB 00C6 0009
        MVI     G_0165, R2                      ; 5F30   0282 0165
        TSTR    R2                              ; 5F32   0092
        BEQ     L_5F37                          ; 5F33   0204 0002

        SUBI    #$0098, R3                      ; 5F35   033B 0098
L_5F37:
        MVO@    R3,     R1                      ; 5F37   024B
        MOVR    R5,     R7                      ; 5F38   00AF

        DECLE   $03F9,  $006A,  $00FF,  $00D0   ; 5F39   03F9 006A 00FF 00D0
        DECLE   $0050,  $0074,  $005F,  $0028   ; 5F3D   0050 0074 005F 0028
        DECLE   $0003,  $0001,  $002C,  $0046   ; 5F41   0003 0001 002C 0046
        DECLE   $005F,  $0000,  $0089,  $005F   ; 5F45   005F 0000 0089 005F
        DECLE   $0000,  $02F4,  $003C,  $02F2   ; 5F49   0000 02F4 003C 02F2
        DECLE   $0218                           ; 5F4D   0218

        MOVR    R2,     R1                      ; 5F4E   0091
        ADDR    R3,     R6                      ; 5F4F   00DE
        ADD@    R1,     R3                      ; 5F50   02CB
        RLC     R3,     1                       ; 5F51   0053
        CMPR    R7,     R6                      ; 5F52   017E
        CLRR    R2                              ; 5F53   01D2
        XOR     G_02F2, R0                      ; 5F54   03C0 02F2
        ADD@    R3,     R7                      ; 5F56   02DF

        MOVR    R7,     R3                      ; 5F57   00BB
        ADDR    R3,     R6                      ; 5F58   00DE
        ADD@    R6,     R3                      ; 5F59   02F3
        RLC     R0,     1                       ; 5F5A   0050
        ADD@    R6,     R1                      ; 5F5B   02F1
L_5F5C:
        MVII    #$00E9, R0                      ; 5F5C   02B8 00E9
        DECLE   $0240,  $02D1,  $02B8,  $0080   ; 5F5E   0240 02D1 02B8 0080
        DECLE   $0240,  $0126,  $02B8,  $0004   ; 5F62   0240 0126 02B8 0004
        DECLE   $0240,  $0176,  $0004,  $01DC   ; 5F66   0240 0176 0004 01DC
        DECLE   $01A3,  $00BB,  $00DE,  $00E6   ; 5F6A   01A3 00BB 00DE 00E6
        DECLE   $00DE,  $0253,  $0004           ; 5F6E   00DE 0253 0004

        XORR    R7,     R4                      ; 5F71   01FC
        AND@    R4,     R5                      ; 5F72   03A5
        PULR    R7                              ; 5F73   02B7

L_5F74:
        PSHR    R5                              ; 5F74   0275
        DECLE   $02B8,  $0004,  $0240,  $0176   ; 5F75   02B8 0004 0240 0176
        DECLE   $0004                           ; 5F79   0004

        XORR    R7,     R4                      ; 5F7A   01FC
        CMP@    R6,     R3                      ; 5F7B   0373
        SARC    R3,     2                       ; 5F7C   007F
        SLLC    R3,     2                       ; 5F7D   005F
        PULR    R7                              ; 5F7E   02B7

        DECLE   $00A3,  $005F,  $00CE,  $0060   ; 5F7F   00A3 005F 00CE 0060
        DECLE   $005B,  $0064,  $002E,  $0065   ; 5F83   005B 0064 002E 0065
        DECLE   $0093,  $0067,  $0024,  $002E   ; 5F87   0093 0067 0024 002E
        DECLE   $0055,  $0000,  $0038,  $0001   ; 5F8B   0055 0000 0038 0001
        DECLE   $0070,  $0030,  $0020,  $0039   ; 5F8F   0070 0030 0020 0039
        DECLE   $0001,  $0060,  $0030,  $0028   ; 5F93   0001 0060 0030 0028
        DECLE   $0039,  $0006,  $004E,  $0056   ; 5F97   0039 0006 004E 0056
        DECLE   $0030,  $0039,  $0004,  $003B   ; 5F9B   0030 0039 0004 003B
        DECLE   $0064,  $0060,  $0039,  $0000   ; 5F9F   0064 0060 0039 0000
        DECLE   $03DE,  $0057,  $0060,  $003B   ; 5FA3   03DE 0057 0060 003B
        DECLE   $0060,  $002E,  $0051,  $002E   ; 5FA7   0060 002E 0051 002E
        DECLE   $0051,  $0035,  $0060,  $0001   ; 5FAB   0051 0035 0060 0001

        ADD@    R6,     R6                      ; 5FAF   02F6
        MOVR    R4,     R7                      ; 5FB0   00A7

        SLR     R0,     1                       ; 5FB1   0060
        ADD@    R6,     R1                      ; 5FB2   02F1
        CLRR    R0                              ; 5FB3   01C0
        MVO     R0,     G_0126                  ; 5FB4   0240 0126
        MVII    #$0002, R0                      ; 5FB6   02B8 0002
        MVO     R0,     G_0176                  ; 5FB8   0240 0176

        JSR     R5,     L_5FCC                  ; 5FBA   0004 015C 03CC
        JSR     R5,     L_6005                  ; 5FBD   0004 0160 0005
        JSR     R5,     L_60BF                  ; 5FC0   0004 0160 00BF
L_5FC3:
        JSR     R5,     L_601D                  ; 5FC3   0004 0160 001D

        MVI     G_018A, R1                      ; 5FC6   0281 018A
        ADDI    #$0200, R1                      ; 5FC8   02F9 0200
        MVO@    R0,     R1                      ; 5FCA   0248
        PULR    R7                              ; 5FCB   02B7

L_5FCC:
        PSHR    R5                              ; 5FCC   0275
        MVII    #$0002, R0                      ; 5FCD   02B8 0002
        SDBD                                    ; 5FCF   0001
        MVII    #$45A5, R1                      ; 5FD0   02B9 00A5 0045
        MVII    #$034D, R2                      ; 5FD3   02BA 034D

        JSR     R5,     X_INIT_MOBS             ; 5FD5   0004 0114 02B4

        MVII    #$016E, R4                      ; 5FD8   02BC 016E
        SDBD                                    ; 5FDA   0001
        MVI@    R4,     R3                      ; 5FDB   02A3
        SDBD                                    ; 5FDC   0001
        CMPI    #$6897, R3                      ; 5FDD   037B 0097 0068
        BNEQ    L_5FEE                          ; 5FE0   020C 000C

        MVI     G_0173, R0                      ; 5FE2   0280 0173
        TSTR    R0                              ; 5FE4   0080
        BNEQ    L_5FEE                          ; 5FE5   020C 0007

        ADDI    #$0020, R1                      ; 5FE7   02F9 0020
        MVII    #$0355, R2                      ; 5FE9   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 5FEB   0004 0114 02B2

L_5FEE:
        CLRR    R2                              ; 5FEE   01D2
        MVII    #$034D, R1                      ; 5FEF   02B9 034D
L_5FF1:
        MVI@    R1,     R0                      ; 5FF1   0288
        SDBD                                    ; 5FF2   0001
        ANDI    #$E7FF, R0                      ; 5FF3   03B8 00FF 00E7
        MVO@    R0,     R1                      ; 5FF6   0248
        ADDI    #$0004, R1                      ; 5FF7   02F9 0004
        MVO@    R2,     R1                      ; 5FF9   024A
        ADDI    #$0004, R1                      ; 5FFA   02F9 0004
        CMPI    #$035D, R1                      ; 5FFC   0379 035D
        BLT     L_5FF1                          ; 5FFE   0225 000E

        EIS                                     ; 6000   0002

        JSR     R5,     L_FE47                  ; 6001   0004 01FC 0247

L_6004:
        PULR    R7                              ; 6004   02B7

L_6005:
        SDBD                                    ; 6005   0001
        MVII    #$47C7, R0                      ; 6006   02B8 00C7 0047
        MVO     R0,     G_0139                  ; 6009   0240 0139
        SWAP    R0,     1                       ; 600B   0040
        MVO     R0,     G_013A                  ; 600C   0240 013A
        MVII    #$0001, R0                      ; 600E   02B8 0001
        MVO     R0,     G_0163                  ; 6010   0240 0163
L_6012:
        CMP     G_0163, R0                      ; 6012   0340 0163
        BEQ     L_6012                          ; 6014   0224 0003

        MVO     R0,     .STIC.VIDEN             ; 6016   0240 0020
        MOVR    R5,     R7                      ; 6018   00AF

L_6019:
        MVII    #$002B, R0                      ; 6019   02B8 002B
        B       L_6029                          ; 601B   0200 000C

L_601D:
        MVI     G_0189, R0                      ; 601D   0280 0189
        MVI     G_0164, R1                      ; 601F   0281 0164
        ANDI    #$0010, R1                      ; 6021   03B9 0010
        BEQ     L_6029                          ; 6023   0204 0004

        MVI     G_019F, R0                      ; 6025   0280 019F
        ADDI    #$0030, R0                      ; 6027   02F8 0030
L_6029:
        PSHR    R5                              ; 6029   0275
        DECLE   $004C,  $0048,  $0001,  $03F8   ; 602A   004C 0048 0001 03F8
        DECLE   $0000,  $0008,  $0004,  $01FC   ; 602E   0000 0008 0004 01FC
        DECLE   $01CA                           ; 6032   01CA

        XORR    R1,     R0                      ; 6033   01C8
        PULR    R7                              ; 6034   02B7

        DECLE   $002D,  $005F,  $0046,  $0000   ; 6035   002D 005F 0046 0000
        DECLE   $0038,  $0000                   ; 6039   0038 0000
L_603B:
        PSHR    R5                              ; 603B   0275
        MVI     G_018A, R1                      ; 603C   0281 018A
        MOVR    R1,     R2                      ; 603E   008A

        JSR     R5,     L_FE24                  ; 603F   0004 01FC 0224

        DECR    R4                              ; 6042   0014
        ADDR    R6,     R0                      ; 6043   00F0
        MVO     R2,     G_018A                  ; 6044   0242 018A
        MOVR    R1,     R3                      ; 6046   008B
        SLL     R3,     1                       ; 6047   004B
        SDBD                                    ; 6048   0001
        ADDI    #$8800, R3                      ; 6049   02FB 0000 0088
        MOVR    R3,     R4                      ; 604C   009C
        SDBD                                    ; 604D   0001
        MVI@    R4,     R3                      ; 604E   02A3
        ADDI    #$0200, R1                      ; 604F   02F9 0200
        ADDI    #$0200, R2                      ; 6051   02FA 0200
        MVI@    R1,     R0                      ; 6053   0288
        MVO@    R3,     R1                      ; 6054   024B
        MVO@    R0,     R2                      ; 6055   0250
        PULR    R7                              ; 6056   02B7

L_6057:
        PSHR    R5                              ; 6057   0275
        MVI     G_018A, R4                      ; 6058   0284 018A
        ADDR    R4,     R4                      ; 605A   00E4
        SDBD                                    ; 605B   0001
        ADDI    #$8800, R4                      ; 605C   02FC 0000 0088

        JSR     R5,     L_FE65                  ; 605F   0004 01FC 0265
        DECLE   $0020,  $00A0,  $0060,  $0054   ; 6062   0020 00A0 0060 0054
        DECLE   $0069,  $0060,  $0000           ; 6066   0069 0060 0000

        SDBD                                    ; 6069   0001
        MVI@    R4,     R0                      ; 606A   02A0
        MOVR    R0,     R1                      ; 606B   0081
        SDBD                                    ; 606C   0001
        ANDI    #$09F8, R0                      ; 606D   03B8 00F8 0009
        XORR    R0,     R1                      ; 6070   01C1
        SDBD                                    ; 6071   0001
        ANDI    #$F7FF, R0                      ; 6072   03B8 00FF 00F7
        SLR     R0,     2                       ; 6075   0064
        SLR     R0,     1                       ; 6076   0060
        CMPI    #$0030, R0                      ; 6077   0378 0030
        BLT     L_608B                          ; 6079   0205 0010

        PSHR    R0                              ; 607B   0270
        SUBI    #$0030, R0                      ; 607C   0338 0030
        MVO     R0,     G_019F                  ; 607E   0240 019F
        MVI     G_0164, R0                      ; 6080   0280 0164
        ANDI    #$00EF, R0                      ; 6082   03B8 00EF
        XORI    #$0010, R0                      ; 6084   03F8 0010
        MVO     R0,     G_0164                  ; 6086   0240 0164
        PULR    R0                              ; 6088   02B0
        B       L_6095                          ; 6089   0200 000A

L_608B:
        MVO     R0,     G_0189                  ; 608B   0240 0189
        PSHR    R0                              ; 608D   0270
        MVI     G_0164, R0                      ; 608E   0280 0164
        ANDI    #$00EF, R0                      ; 6090   03B8 00EF
        MVO     R0,     G_0164                  ; 6092   0240 0164
        PULR    R0                              ; 6094   02B0
L_6095:
        MOVR    R1,     R2                      ; 6095   008A
        ANDI    #$0007, R2                      ; 6096   03BA 0007
        XORR    R2,     R1                      ; 6098   01D1
        SWAP    R1,     1                       ; 6099   0041
        SLL     R1,     2                       ; 609A   004D
        XORR    R1,     R2                      ; 609B   01CA
        MVO     R2,     G_018B                  ; 609C   0242 018B
        B       L_5FC3                          ; 609E   0220 00DC

        JSR     R5,     L_601D                  ; 60A0   0004 0160 001D

        MVO@    R0,     R4                      ; 60A3   0260
        SWAP    R0,     1                       ; 60A4   0040
        MVO@    R0,     R4                      ; 60A5   0260
        PULR    R7                              ; 60A6   02B7

        PSHR    R5                              ; 60A7   0275
        PSHR    R0                              ; 60A8   0270
        MVII    #$0020, R0                      ; 60A9   02B8 0020

        JSR     R5,     L_6057                  ; 60AB   0004 0160 0057

        PULR    R0                              ; 60AE   02B0

        JSR     R5,     L_603B                  ; 60AF   0004 0160 003B

        PULR    R7                              ; 60B2   02B7

L_60B3:
        PSHR    R5                              ; 60B3   0275
        MVI     G_018A, R1                      ; 60B4   0281 018A
        ADDI    #$0200, R1                      ; 60B6   02F9 0200
        MVI@    R1,     R0                      ; 60B8   0288
        SDBD                                    ; 60B9   0001
        XORI    #$1007, R0                      ; 60BA   03F8 0007 0010
        MVO@    R0,     R1                      ; 60BD   0248
        PULR    R7                              ; 60BE   02B7

L_60BF:
        PSHR    R5                              ; 60BF   0275
        SDBD                                    ; 60C0   0001
        MVII    #$8800, R4                      ; 60C1   02BC 0000 0088
        MVII    #$0200, R5                      ; 60C4   02BD 0200
L_60C6:
        SDBD                                    ; 60C6   0001
        MVI@    R4,     R0                      ; 60C7   02A0
        MVO@    R0,     R5                      ; 60C8   0268
        CMPI    #$02F0, R5                      ; 60C9   037D 02F0
        BLT     L_60C6                          ; 60CB   0225 0006
        PULR    R7                              ; 60CD   02B7

        DECLE   $03DC,  $00D2,  $0061,  $002E   ; 60CE   03DC 00D2 0061 002E
        DECLE   $0051,  $00E0,  $0061,  $0040   ; 60D2   0051 00E0 0061 0040
        DECLE   $0061,  $0001                   ; 60D6   0061 0001

        ADD@    R6,     R5                      ; 60D8   02F5
        ADD@    R6,     R4                      ; 60D9   02F4
        DECR    R4                              ; 60DA   0014
        ADD@    R6,     R1                      ; 60DB   02F1
        MVI     G_0164, R0                      ; 60DC   0280 0164
        ANDI    #$00EF, R0                      ; 60DE   03B8 00EF
        MVO     R0,     G_0164                  ; 60E0   0240 0164

        JSR     R5,     L_DE4C                  ; 60E2   0004 01DC 024C
        DECLE   $0001,  $000E,  $0207,  $0004   ; 60E5   0001 000E 0207 0004

        ADCR    R7                              ; 60E9   002F

        ADCR    R5                              ; 60EA   002D
L_60EB:
        ADCR    R6                              ; 60EB   002E
        DECLE   $003F,  $0004,  $01FC,  $01CA   ; 60EC   003F 0004 01FC 01CA

        SDBD                                    ; 60F0   0001
        XORI    #$0800, R1                      ; 60F1   03F9 0000 0008
        MVII    #$022A, R4                      ; 60F4   02BC 022A
        MVII    #$0005, R3                      ; 60F6   02BB 0005
L_60F8:
        MVII    #$0009, R0                      ; 60F8   02B8 0009
L_60FA:
        MVO@    R1,     R4                      ; 60FA   0261
        INCR    R4                              ; 60FB   000C
        ADDI    #$0008, R1                      ; 60FC   02F9 0008
        DECR    R0                              ; 60FE   0010
        BNEQ    L_60FA                          ; 60FF   022C 0006

        ADDI    #$0016, R4                      ; 6101   02FC 0016
        DECR    R3                              ; 6103   0013
        BNEQ    L_60F8                          ; 6104   022C 000D

        JSR     R5,     L_6116                  ; 6106   0004 0160 0116
        DECLE   $0000                           ; 6109   0000
        BIDECLE $30C6                           ; 610A   00C6 0030

        JSR     R5,     L_615A                  ; 610C   0004 0160 015A
        JSR     R5,     L_6136                  ; 610F   0004 0160 0136
        DECLE   $020C                           ; 6112   020C
        BIDECLE $0E01                           ; 6113   0001 000E

        PULR    R7                              ; 6115   02B7

L_6116:
        MVII    #$0325, R4                      ; 6116   02BC 0325
L_6118:
        PSHR    R4                              ; 6118   0274
        ADDI    #$0002, R4                      ; 6119   02FC 0002
        CLRR    R0                              ; 611B   01C0
        MVO@    R0,     R4                      ; 611C   0260
        MVO@    R0,     R4                      ; 611D   0260
        MVO@    R0,     R4                      ; 611E   0260
        MVI@    R5,     R0                      ; 611F   02A8
        MVO@    R0,     R4                      ; 6120   0260
        MVII    #$0002, R0                      ; 6121   02B8 0002
        MVO@    R0,     R4                      ; 6123   0260
        PULR    R4                              ; 6124   02B4
        SDBD                                    ; 6125   0001
        MVI@    R5,     R0                      ; 6126   02A8
        MVO@    R0,     R4                      ; 6127   0260
        MOVR    R7,     R0                      ; 6128   00B8
        ADDI    #$0006, R0                      ; 6129   02F8 0006
        MVO@    R0,     R4                      ; 612B   0260
L_612C:
        MOVR    R5,     R7                      ; 612C   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 612D   0000 0000 0000 0000
        DECLE   $00B8,  $0061,  $0001,  $0084   ; 6131   00B8 0061 0001 0084
        DECLE   $0000                           ; 6135   0000
L_6136:
        MVI@    R5,     R4                      ; 6136   02AC
        SDBD                                    ; 6137   0001
        MVI@    R5,     R0                      ; 6138   02A8
        XORI    #$01A0, R0                      ; 6139   03F8 01A0
        MVO@    R0,     R4                      ; 613B   0260
        ADDI    #$0008, R0                      ; 613C   02F8 0008
        MVO@    R0,     R4                      ; 613E   0260
        MOVR    R5,     R7                      ; 613F   00AF

        DECLE   $002D,  $005F,  $0046,  $0000   ; 6140   002D 005F 0046 0000
        DECLE   $0038,  $0003,  $002E,  $0055   ; 6144   0038 0003 002E 0055
        DECLE   $0068,  $0039,  $0001,  $00B6   ; 6148   0068 0039 0001 00B6
        DECLE   $0055,  $0070,  $0039,  $0001   ; 614C   0055 0070 0039 0001
        DECLE   $0046,  $0055,  $00F8,  $0039   ; 6150   0046 0055 00F8 0039
        DECLE   $0001,  $0060,  $0036,  $00F0   ; 6154   0001 0060 0036 00F0
        DECLE   $0039,  $0000                   ; 6158   0039 0000
L_615A:
        PSHR    R5                              ; 615A   0275
        MVI     G_0189, R1                      ; 615B   0281 0189
        MVII    #$0009, R2                      ; 615D   02BA 0009

        JSR     R5,     X_DIV                   ; 615F   0004 011C 01FB

        SLL     R1,     2                       ; 6162   004D
        SLL     R1,     2                       ; 6163   004D
        ADDI    #$0016, R1                      ; 6164   02F9 0016
        SWAP    R1,     1                       ; 6166   0041
        SLL     R0,     2                       ; 6167   004C
        SLL     R0,     2                       ; 6168   004C
        ADDI    #$0017, R0                      ; 6169   02F8 0017
        SWAP    R0,     1                       ; 616B   0040
        MVO     R0,     G_0328                  ; 616C   0240 0328
        MVO     R1,     G_0327                  ; 616E   0241 0327
        MVI     G_0189, R1                      ; 6170   0281 0189
        INCR    R1                              ; 6172   0009
        MVII    #$000A, R2                      ; 6173   02BA 000A

        JSR     R5,     X_DIV                   ; 6175   0004 011C 01FB
        JSR     R5,     L_617F                  ; 6178   0004 0160 017F

        ANDR    R4,     R0                      ; 617B   01A0
        MVO     R0,     .STIC.VIDEN             ; 617C   0240 0020
        PULR    R7                              ; 617E   02B7

L_617F:
        MVII    #$018C, R4                      ; 617F   02BC 018C
        MVII    #$0001, R2                      ; 6181   02BA 0001
        MVO@    R2,     R4                      ; 6183   0262
        SDBD                                    ; 6184   0001
        MVII    #$55FE, R2                      ; 6185   02BA 00FE 0055
        TSTR    R0                              ; 6188   0080
        BNEQ    L_6191                          ; 6189   020C 0006

        SDBD                                    ; 618B   0001
        MVII    #$3000, R0                      ; 618C   02B8 0000 0030
        B       L_6194                          ; 618F   0200 0003

L_6191:
        SLL     R0,     2                       ; 6191   004C
        SLL     R0,     1                       ; 6192   0048
        ADDR    R2,     R0                      ; 6193   00D0
L_6194:
        MVO@    R0,     R4                      ; 6194   0260
        SWAP    R0,     1                       ; 6195   0040
        MVO@    R0,     R4                      ; 6196   0260
        MVI@    R5,     R3                      ; 6197   02AB
        SDBD                                    ; 6198   0001
        ADDI    #$3800, R3                      ; 6199   02FB 0000 0038
        MVO@    R3,     R4                      ; 619C   0263
        SWAP    R3,     1                       ; 619D   0043
        MVO@    R3,     R4                      ; 619E   0263
        NOP                                     ; 619F   0034
        SWAP    R3,     1                       ; 61A0   0043
        SLL     R1,     2                       ; 61A1   004D
        SLL     R1,     1                       ; 61A2   0049
        ADDR    R2,     R1                      ; 61A3   00D1
        MVII    #$0001, R0                      ; 61A4   02B8 0001
        MVO@    R0,     R4                      ; 61A6   0260
        MVO@    R1,     R4                      ; 61A7   0261
        SWAP    R1,     1                       ; 61A8   0041
        MVO@    R1,     R4                      ; 61A9   0261
        ADDI    #$0008, R3                      ; 61AA   02FB 0008
        MVO@    R3,     R4                      ; 61AC   0263
        SWAP    R3,     1                       ; 61AD   0043
        MVO@    R3,     R4                      ; 61AE   0263
        CLRR    R0                              ; 61AF   01C0
        MVO@    R0,     R4                      ; 61B0   0260
        PSHR    R5                              ; 61B1   0275

        JSR     R5,     L_FE13                  ; 61B2   0004 01FC 0213
        DECLE   $008C,  $0001                   ; 61B5   008C 0001

        PULR    R7                              ; 61B7   02B7

        MVI@    R1,     R0                      ; 61B8   0288
        PSHR    R1                              ; 61B9   0271
        ADDI    #$0005, R1                      ; 61BA   02F9 0005
        MVI@    R1,     R2                      ; 61BC   028A
        PULR    R1                              ; 61BD   02B1
        TSTR    R2                              ; 61BE   0092
        BEQ     L_61C9                          ; 61BF   0204 0008

        SDBD                                    ; 61C1   0001
        XORI    #$1000, R0                      ; 61C2   03F8 0000 0010
        MVII    #$0002, R2                      ; 61C5   02BA 0002
        B       L_61CD                          ; 61C7   0200 0004

L_61C9:
        XORI    #$0004, R0                      ; 61C9   03F8 0004
        MVII    #$0001, R2                      ; 61CB   02BA 0001
L_61CD:
        MVO@    R0,     R1                      ; 61CD   0248
        ADDI    #$0006, R1                      ; 61CE   02F9 0006
        MVO@    R2,     R1                      ; 61D0   024A
        MOVR    R5,     R7                      ; 61D1   00AF

        PSHR    R5                              ; 61D2   0275
        MVI     G_0189, R2                      ; 61D3   0282 0189

        JSR     R5,     L_FE24                  ; 61D5   0004 01FC 0224

        INCR    R1                              ; 61D8   0009
        ADCR    R5                              ; 61D9   002D
        MVO     R2,     G_0189                  ; 61DA   0242 0189

        JSR     R5,     L_615A                  ; 61DC   0004 0160 015A

        PULR    R7                              ; 61DF   02B7

        PSHR    R5                              ; 61E0   0275
        CLRR    R0                              ; 61E1   01C0
        MVO     R0,     G_0325                  ; 61E2   0240 0325
        MVO     R0,     G_0326                  ; 61E4   0240 0326
        MVI     G_0164, R0                      ; 61E6   0280 0164
        ANDI    #$00FD, R0                      ; 61E8   03B8 00FD
        MVO     R0,     G_0164                  ; 61EA   0240 0164

        JSR     R5,     L_5401                  ; 61EC   0004 0154 0001
        BIDECLE $61F2                           ; 61EF   00F2 0061

        PULR    R7                              ; 61F1   02B7
        MVI@    R3,     R7                      ; 61F2   029F

        COMR    R6                              ; 61F3   001E
        SLLC    R2,     1                       ; 61F4   005A
        SLLC    R3,     2                       ; 61F5   005F
        SLR     R3,     1                       ; 61F6   0063
        ADDR    R1,     R6                      ; 61F7   00CE
        SLR     R2,     1                       ; 61F8   0062
        RRC     R0,     2                       ; 61F9   0074
        SLLC    R3,     2                       ; 61FA   005F
        SAR     R2,     2                       ; 61FB   006E
        SLLC    R2,     1                       ; 61FC   005A
        NEGR    R1                              ; 61FD   0021
        SLR     R0,     2                       ; 61FE   0064
        ADD@    R6,     R6                      ; 61FF   02F6
        ADDR    R0,     R0                      ; 6200   00C0
        SLR     R3,     1                       ; 6201   0063
        ADD@    R6,     R1                      ; 6202   02F1

        JSR     R5,     L_DE4C                  ; 6203   0004 01DC 024C

        DIS                                     ; 6206   0003
        INCR    R0                              ; 6207   0008
        BC      L_620E                          ; 6208   0201 0004
        ADCR    R7                              ; 620A   002F

        ADCR    R5                              ; 620B   002D
L_620C:
        ADCR    R6                              ; 620C   002E
        DECLE   $003F                           ; 620D   003F
L_620E:
        JSR     R5,     L_6136                  ; 620E   0004 0160 0136
        DECLE   $0206                           ; 6211   0206
        BIDECLE $0803                           ; 6212   0003 0008

        JSR     R5,     L_6255                  ; 6214   0004 0160 0255
        JSR     R5,     L_62A9                  ; 6217   0004 0160 02A9

        MVII    #$0009, R0                      ; 621A   02B8 0009
        MVO     R0,     G_0174                  ; 621C   0240 0174
        MVII    #$0131, R4                      ; 621E   02BC 0131
        MVII    #$0001, R0                      ; 6220   02B8 0001
        MVO@    R0,     R4                      ; 6222   0260
        MVI     G_0189, R0                      ; 6223   0280 0189
        SLL     R0,     2                       ; 6225   004C
        SLL     R0,     1                       ; 6226   0048
        SDBD                                    ; 6227   0001
        ADDI    #$465F, R0                      ; 6228   02F8 005F 0046
        MVO@    R0,     R4                      ; 622B   0260
        SWAP    R0,     1                       ; 622C   0040
        MVO@    R0,     R4                      ; 622D   0260
        SDBD                                    ; 622E   0001
        MVII    #$3958, R0                      ; 622F   02B8 0058 0039
        MVO@    R0,     R4                      ; 6232   0260
        SWAP    R0,     1                       ; 6233   0040
        MVO@    R0,     R4                      ; 6234   0260
        CLRR    R0                              ; 6235   01C0
        MVO@    R0,     R4                      ; 6236   0260

        JSR     R5,     L_FE13                  ; 6237   0004 01FC 0213
        DECLE   $0031,  $0001                   ; 623A   0031 0001

        MVO     R0,     .STIC.VIDEN             ; 623C   0240 0020
L_623E:
        MVII    #$0003, R0                      ; 623E   02B8 0003
        MVO     R0,     G_0176                  ; 6240   0240 0176

        JSR     R5,     L_5A2E                  ; 6242   0004 0158 022E
        JSR     R5,     L_6019                  ; 6245   0004 0160 0019
        JSR     R5,     L_6294                  ; 6248   0004 0160 0294
        JSR     R5,     L_6116                  ; 624B   0004 0160 0116
        DECLE   $0002                           ; 624E   0002
        BIDECLE $0082                           ; 624F   0082 0000

        JSR     R5,     L_633C                  ; 6251   0004 0160 033C

        PULR    R7                              ; 6254   02B7

L_6255:
        MVII    #$022A, R4                      ; 6255   02BC 022A
        MVII    #$0089, R0                      ; 6257   02B8 0089
        MVII    #$0008, R1                      ; 6259   02B9 0008
L_625B:
        MVO@    R0,     R4                      ; 625B   0260
        ADDI    #$0008, R0                      ; 625C   02F8 0008
        DECR    R1                              ; 625E   0011
        BNEQ    L_625B                          ; 625F   022C 0005

        SUBI    #$0040, R0                      ; 6261   0338 0040
        MVII    #$023D, R4                      ; 6263   02BC 023D
        MVII    #$0008, R1                      ; 6265   02B9 0008
L_6267:
        MVO@    R0,     R4                      ; 6267   0260
        ADDI    #$0008, R0                      ; 6268   02F8 0008
        ADDI    #$0013, R4                      ; 626A   02FC 0013
        DECR    R1                              ; 626C   0011
        BNEQ    L_6267                          ; 626D   022C 0007

        INCR    R4                              ; 626F   000C
        SDBD                                    ; 6270   0001
        MVII    #$09B1, R0                      ; 6271   02B8 00B1 0009
        MVI     G_0165, R1                      ; 6274   0281 0165
        TSTR    R1                              ; 6276   0089
        PSHR    R1                              ; 6277   0271
        BEQ     L_627C                          ; 6278   0204 0002

        SUBI    #$0058, R0                      ; 627A   0338 0058
L_627C:
        MVII    #$0008, R1                      ; 627C   02B9 0008
L_627E:
        MVO@    R0,     R4                      ; 627E   0260
        DECR    R1                              ; 627F   0011
        BNEQ    L_627E                          ; 6280   022C 0003

        ADDI    #$0008, R0                      ; 6282   02F8 0008
        PULR    R1                              ; 6284   02B1
        TSTR    R1                              ; 6285   0089
        BEQ     L_628A                          ; 6286   0204 0002

        SUBI    #$0010, R0                      ; 6288   0338 0010
L_628A:
        MVII    #$0008, R1                      ; 628A   02B9 0008
L_628C:
        SUBI    #$0014, R4                      ; 628C   033C 0014
        MVO@    R0,     R4                      ; 628E   0260
        DECR    R4                              ; 628F   0014
        DECR    R1                              ; 6290   0011
        BNEQ    L_628C                          ; 6291   022C 0006
        MOVR    R5,     R7                      ; 6293   00AF

L_6294:
        MVII    #$020C, R4                      ; 6294   02BC 020C
        MVII    #$0008, R1                      ; 6296   02B9 0008
L_6298:
        MVO@    R0,     R4                      ; 6298   0260
        DECR    R1                              ; 6299   0011
        BNEQ    L_6298                          ; 629A   022C 0003

        CMPI    #$0228, R4                      ; 629C   037C 0228
        BGE     L_62A6                          ; 629E   020D 0006

        MVII    #$0220, R4                      ; 62A0   02BC 0220
        MVII    #$0008, R1                      ; 62A2   02B9 0008
        B       L_6298                          ; 62A4   0220 000D

L_62A6:
        MVO     R0,     .BTAB.09                ; 62A6   0240 0209
        MOVR    R5,     R7                      ; 62A8   00AF

L_62A9:
        PSHR    R5                              ; 62A9   0275
        MVI     G_0189, R1                      ; 62AA   0281 0189
        SLL     R1,     2                       ; 62AC   004D
        SLL     R1,     1                       ; 62AD   0049
        SDBD                                    ; 62AE   0001
        ADDI    #$465F, R1                      ; 62AF   02F9 005F 0046
        MOVR    R1,     R5                      ; 62B2   008D
        MVII    #$0008, R0                      ; 62B3   02B8 0008
        MVII    #$023E, R4                      ; 62B5   02BC 023E
        MOVR    R0,     R3                      ; 62B7   0083
L_62B8:
        MVI@    R5,     R1                      ; 62B8   02A9
        SWAP    R1,     1                       ; 62B9   0041
L_62BA:
        SDBD                                    ; 62BA   0001
        MVII    #$0600, R2                      ; 62BB   02BA 0000 0006
        SLLC    R1,     1                       ; 62BE   0059
        BC      L_62C2                          ; 62BF   0201 0001

        CLRR    R2                              ; 62C1   01D2
L_62C2:
        MVO@    R2,     R4                      ; 62C2   0262
        DECR    R3                              ; 62C3   0013
        BNEQ    L_62BA                          ; 62C4   022C 000B

        ADDI    #$000C, R4                      ; 62C6   02FC 000C
        MVII    #$0008, R3                      ; 62C8   02BB 0008
        DECR    R0                              ; 62CA   0010
        BNEQ    L_62B8                          ; 62CB   022C 0014
        PULR    R7                              ; 62CD   02B7

L_62CE:
        PSHR    R5                              ; 62CE   0275
        MVO     R0,     G_0177                  ; 62CF   0240 0177
        MVI     G_0165, R2                      ; 62D1   0282 0165
        TSTR    R2                              ; 62D3   0092
        BNEQ    L_62F0                          ; 62D4   020C 001A

        MVI     G_0170, R1                      ; 62D6   0281 0170

        JSR     R5,     L_6301                  ; 62D8   0004 0160 0301
        DECLE   $0008                           ; 62DB   0008

        SUB@    R4,     R5                      ; 62DC   0325
        MVO     R1,     G_0170                  ; 62DD   0241 0170

L_62DF:
        JSR     R5,     L_633C                  ; 62DF   0004 0160 033C

        MVI     G_0164, R0                      ; 62E2   0280 0164
        ANDI    #$0002, R0                      ; 62E4   03B8 0002
        BNEQ    L_63A5                          ; 62E6   020C 00BD

        JSR     R5,     L_63E2                  ; 62E8   0004 0160 03E2
        DECLE   $02B1,  $02C5,  $02DA,  $0000   ; 62EB   02B1 02C5 02DA 0000

        PULR    R7                              ; 62EF   02B7

L_62F0:
        MOVR    R0,     R1                      ; 62F0   0081
        SARC    R1,     1                       ; 62F1   0079
        BC      L_62F6                          ; 62F2   0201 0002

        MVO     R0,     G_0178                  ; 62F4   0240 0178
L_62F6:
        MVI     G_0171, R1                      ; 62F6   0281 0171

        JSR     R5,     L_6301                  ; 62F8   0004 0160 0301
        DECLE   $0010                           ; 62FB   0010

        SUB@    R3,     R5                      ; 62FC   031D
        MVO     R1,     G_0171                  ; 62FD   0241 0171
        B       L_62DF                          ; 62FF   0220 0021

L_6301:
        MVI@    R5,     R4                      ; 6301   02AC
        PSHR    R1                              ; 6302   0271
        CLRR    R3                              ; 6303   01DB
        MOVR    R1,     R2                      ; 6304   008A
        ANDI    #$0007, R1                      ; 6305   03B9 0007
        SLR     R2,     2                       ; 6307   0066
        SLR     R2,     1                       ; 6308   0062
        SARC    R0,     1                       ; 6309   0078
        BC      L_631A                          ; 630A   0201 000E
        BNEQ    L_6315                          ; 630C   020C 0007

        INCR    R1                              ; 630E   0009
        CMPI    #$0008, R1                      ; 630F   0379 0008
        BGE     L_6323                          ; 6311   020D 0010
        B       L_6327                          ; 6313   0200 0012

L_6315:
        DECR    R1                              ; 6315   0011
L_6316:
        BMI     L_6323                          ; 6316   020B 000B
        B       L_6327                          ; 6318   0200 000D
L_631A:
        BNEQ    L_631F                          ; 631A   020C 0003

        DECR    R2                              ; 631C   0012
        B       L_6316                          ; 631D   0220 0008

L_631F:
        INCR    R2                              ; 631F   000A
        CMPR    R4,     R2                      ; 6320   0162
        BLT     L_6327                          ; 6321   0205 0004

L_6323:
        PULR    R1                              ; 6323   02B1
        INCR    R3                              ; 6324   000B
        B       L_632B                          ; 6325   0200 0004

L_6327:
        SLL     R2,     2                       ; 6327   004E
        SLL     R2,     1                       ; 6328   004A
        XORR    R2,     R1                      ; 6329   01D1
        PULR    R0                              ; 632A   02B0
L_632B:
        MVI@    R5,     R2                      ; 632B   02AA
        MVI@    R2,     R0                      ; 632C   0290
        SDBD                                    ; 632D   0001
        ANDI    #$EFFF, R0                      ; 632E   03B8 00FF 00EF
        SDBD                                    ; 6331   0001
        XORI    #$1000, R0                      ; 6332   03F8 0000 0010
        MVO@    R0,     R2                      ; 6335   0250
        ADDI    #$0006, R2                      ; 6336   02FA 0006
        MVII    #$0003, R0                      ; 6338   02B8 0003
        MVO@    R0,     R2                      ; 633A   0250
        MOVR    R5,     R7                      ; 633B   00AF

L_633C:
        MVI     G_0170, R1                      ; 633C   0281 0170
        MVI     G_0165, R0                      ; 633E   0280 0165
        TSTR    R0                              ; 6340   0080
        BEQ     L_6345                          ; 6341   0204 0002

        MVI     G_0171, R1                      ; 6343   0281 0171
L_6345:
        MOVR    R1,     R2                      ; 6345   008A
        ANDI    #$0007, R1                      ; 6346   03B9 0007
        XORR    R1,     R2                      ; 6348   01CA
        SLL     R1,     2                       ; 6349   004D
        SLL     R1,     1                       ; 634A   0049
        TSTR    R0                              ; 634B   0080
        BEQ     L_634F                          ; 634C   0204 0001

        SLR     R2,     1                       ; 634E   0062
L_634F:
        MVII    #$031F, R4                      ; 634F   02BC 031F
        TSTR    R0                              ; 6351   0080
        BNEQ    L_6356                          ; 6352   020C 0002

        MVII    #$0327, R4                      ; 6354   02BC 0327
L_6356:
        ADDI    #$0018, R1                      ; 6356   02F9 0018
        SWAP    R1,     1                       ; 6358   0041
        MVO@    R1,     R4                      ; 6359   0261
        ADDI    #$0020, R2                      ; 635A   02FA 0020
        SWAP    R2,     1                       ; 635C   0042
        MVO@    R2,     R4                      ; 635D   0262
        MOVR    R5,     R7                      ; 635E   00AF

L_635F:
        PSHR    R5                              ; 635F   0275
        MVI     G_0162, R1                      ; 6360   0281 0162
        ANDI    #$0008, R1                      ; 6362   03B9 0008
        BEQ     L_6373                          ; 6364   0204 000D

        JSR     R5,     L_FE65                  ; 6366   0004 01FC 0265
        DECLE   $0059,  $00A6,  $0063,  $004E   ; 6369   0059 00A6 0063 004E
        DECLE   $00AA,  $0063,  $0020,  $0077   ; 636D   00AA 0063 0020 0077
        DECLE   $0063,  $0000                   ; 6371   0063 0000
L_6373:
        CMPI    #$0020, R0                      ; 6373   0378 0020
        BNEQ    L_63A5                          ; 6375   020C 002E

        MVI     G_0165, R0                      ; 6377   0280 0165
        TSTR    R0                              ; 6379   0080
        PSHR    R0                              ; 637A   0270
        BNEQ    L_63AE                          ; 637B   020C 0031

        MVII    #$0132, R4                      ; 637D   02BC 0132
        SDBD                                    ; 637F   0001
        MVI@    R4,     R2                      ; 6380   02A2
        MVI     G_0170, R0                      ; 6381   0280 0170
L_6383:
        MOVR    R0,     R1                      ; 6383   0081
        ANDI    #$0007, R0                      ; 6384   03B8 0007
        SLR     R1,     2                       ; 6386   0065
        SLR     R1,     1                       ; 6387   0061
        ADDR    R1,     R2                      ; 6388   00CA
        MVII    #$0080, R1                      ; 6389   02B9 0080
L_638B:
        TSTR    R0                              ; 638B   0080
        BEQ     L_6392                          ; 638C   0204 0004

        DECR    R0                              ; 638E   0010
        SLR     R1,     1                       ; 638F   0061
        B       L_638B                          ; 6390   0220 0006

L_6392:
        XOR@    R2,     R1                      ; 6392   03D1
        MVO@    R1,     R2                      ; 6393   0251
        PULR    R0                              ; 6394   02B0
L_6395:
        TSTR    R0                              ; 6395   0080
        BNEQ    L_63BC                          ; 6396   020C 0024

        MVII    #$0020, R0                      ; 6398   02B8 0020
        MVO     R0,     G_0163                  ; 639A   0240 0163
L_639C:
        CMP     G_0163, R0                      ; 639C   0340 0163
        BEQ     L_639C                          ; 639E   0224 0003

        MVO     R0,     .STIC.VIDEN             ; 63A0   0240 0020

        JSR     R5,     L_62A9                  ; 63A2   0004 0160 02A9

L_63A5:
        PULR    R7                              ; 63A5   02B7

        JSR     R5,     L_5A6E                  ; 63A6   0004 0158 026E

        PULR    R7                              ; 63A9   02B7

        JSR     R5,     L_5A2E                  ; 63AA   0004 0158 022E

        PULR    R7                              ; 63AD   02B7

L_63AE:
        JSR     R5,     L_6C16                  ; 63AE   0004 016C 0016

        DECR    R2                              ; 63B1   0012
        SLL     R2,     2                       ; 63B2   004E
        SLL     R2,     2                       ; 63B3   004E
        SDBD                                    ; 63B4   0001
        ADDI    #$4085, R2                      ; 63B5   02FA 0085 0040
        MVI     G_0171, R0                      ; 63B8   0280 0171
        B       L_6383                          ; 63BA   0220 0038

L_63BC:
        JSR     R5,     L_6CDA                  ; 63BC   0004 016C 00DA

        PULR    R7                              ; 63BF   02B7

        PSHR    R5                              ; 63C0   0275
        PSHR    R0                              ; 63C1   0270
        MVII    #$0020, R0                      ; 63C2   02B8 0020

        JSR     R5,     L_635F                  ; 63C4   0004 0160 035F

        PULR    R0                              ; 63C7   02B0

        JSR     R5,     L_62CE                  ; 63C8   0004 0160 02CE

        TSTR    R3                              ; 63CB   009B
        BEQ     L_63A5                          ; 63CC   0224 0028

        MVII    #$0020, R0                      ; 63CE   02B8 0020

        JSR     R5,     L_635F                  ; 63D0   0004 0160 035F

        MVII    #$000A, R0                      ; 63D3   02B8 000A
        MVO     R0,     G_0175                  ; 63D5   0240 0175
        MVII    #$0323, R2                      ; 63D7   02BA 0323
        MVI     G_0165, R1                      ; 63D9   0281 0165
        TSTR    R1                              ; 63DB   0089
        BNEQ    L_63E0                          ; 63DC   020C 0002

        MVII    #$032B, R2                      ; 63DE   02BA 032B
L_63E0:
        MVO@    R0,     R2                      ; 63E0   0250
        PULR    R7                              ; 63E1   02B7

L_63E2:
        MVI     G_0165, R1                      ; 63E2   0281 0165
        TSTR    R1                              ; 63E4   0089
        BEQ     L_63ED                          ; 63E5   0204 0006

        MVI     G_0178, R2                      ; 63E7   0282 0178
        MVII    #$0261, R1                      ; 63E9   02B9 0261
        B       L_63F3                          ; 63EB   0200 0006

L_63ED:
        MVI@    R5,     R1                      ; 63ED   02A9
        TSTR    R1                              ; 63EE   0089
        BEQ     L_612C                          ; 63EF   0224 02C4

        MVI     G_0177, R2                      ; 63F1   0282 0177
L_63F3:
        ADDI    #$0027, R2                      ; 63F3   02FA 0027
        MVI     G_0165, R4                      ; 63F5   0284 0165
        TSTR    R4                              ; 63F7   00A4
        BEQ     L_63FC                          ; 63F8   0204 0002

        ADDI    #$0005, R2                      ; 63FA   02FA 0005
L_63FC:
        SLL     R2,     2                       ; 63FC   004E
        SLL     R2,     1                       ; 63FD   004A
        SDBD                                    ; 63FE   0001
        XORI    #$0801, R2                      ; 63FF   03FA 0001 0008
        MVI@    R1,     R4                      ; 6402   028C
        SDBD                                    ; 6403   0001
        CMPI    #$2D31, R4                      ; 6404   037C 0031 002D
        BEQ     L_63ED                          ; 6407   0224 001B

        SDBD                                    ; 6409   0001
        ANDI    #$2400, R4                      ; 640A   03BC 0000 0024
        BEQ     L_6413                          ; 640D   0204 0004

        SDBD                                    ; 640F   0001
        XORI    #$2401, R2                      ; 6410   03FA 0001 0024
L_6413:
        MVO@    R2,     R1                      ; 6413   024A
        MVII    #$016E, R4                      ; 6414   02BC 016E
        SDBD                                    ; 6416   0001
        MVII    #$5CA7, R1                      ; 6417   02B9 00A7 005C
        SDBD                                    ; 641A   0001
        CMP@    R4,     R1                      ; 641B   0361
        BNEQ    L_63ED                          ; 641C   022C 0030

        ADDI    #$0004, R5                      ; 641E   02FD 0004
        MOVR    R5,     R7                      ; 6420   00AF

        DECLE   $0024,  $002E,  $0055,  $0000   ; 6421   0024 002E 0055 0000
        DECLE   $0038,  $0001,  $004E,  $0056   ; 6425   0038 0001 004E 0056
        DECLE   $0030,  $0039,  $0004,  $003B   ; 6429   0030 0039 0004 003B
        DECLE   $0064,  $0038,  $0039,  $0002   ; 642D   0064 0038 0039 0002
        DECLE   $0076,  $0056,  $00B0,  $0039   ; 6431   0076 0056 00B0 0039
        DECLE   $0001,  $0000,  $0036,  $00C0   ; 6435   0001 0000 0036 00C0
        DECLE   $0039,  $0000,  $0000,  $0004   ; 6439   0039 0000 0000 0004
        DECLE   $0006,  $007F,  $0006,  $0004   ; 643D   0006 007F 0006 0004
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6441   0000 0000 0000 0008
        DECLE   $001C,  $003E,  $0008,  $0008   ; 6445   001C 003E 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0010   ; 6449   0008 0000 0000 0010
        DECLE   $0030,  $007F,  $0030,  $0010   ; 644D   0030 007F 0030 0010
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6451   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $003E,  $001C   ; 6455   0008 0008 003E 001C
        DECLE   $0008,  $0000,  $039B,  $00F2   ; 6459   0008 0000 039B 00F2
        DECLE   $0064,  $001E,  $005D,  $002E   ; 645D   0064 001E 005D 002E
        DECLE   $0051,  $002E,  $0051,  $0016   ; 6461   0051 002E 0051 0016
        DECLE   $0065,  $0001,  $02F4,  $0014   ; 6465   0065 0001 02F4 0014
        DECLE   $0203,  $000D,  $010C,  $0013   ; 6469   0203 000D 010C 0013
        DECLE   $0083,  $0342,  $0011,  $0072   ; 646D   0083 0342 0011 0072
        DECLE   $039E,  $0000,  $02F5,  $02F3   ; 6471   039E 0000 02F5 02F3
        DECLE   $0064,  $022A,  $03C2,  $035E   ; 6475   0064 022A 03C2 035E
        DECLE   $007A,  $03C4,  $035E,  $00BC   ; 6479   007A 03C4 035E 00BC
        DECLE   $039C,  $039C,  $035A,  $0342   ; 647D   039C 039C 035A 0342
        DECLE   $01CB,  $01D1,  $035E,  $0000   ; 6481   01CB 01D1 035E 0000

        ADD@    R6,     R1                      ; 6485   02F1
        MVII    #$0066, R0                      ; 6486   02B8 0066
        MVO     R0,     G_019C                  ; 6488   0240 019C
        MVI     G_017C, R0                      ; 648A   0280 017C
        MVO     R0,     G_017B                  ; 648C   0240 017B
        SDBD                                    ; 648E   0001
        MVII    #$0600, R0                      ; 648F   02B8 0000 0006
        MVII    #$000E, R1                      ; 6492   02B9 000E
        MVII    #$0203, R3                      ; 6494   02BB 0203

        JSR     R5,     L_64EA                  ; 6496   0004 0164 00EA
        JSR     R5,     L_5FCC                  ; 6499   0004 015C 03CC
        JSR     R5,     L_6502                  ; 649C   0004 0164 0102

        MVII    #$0278, R4                      ; 649F   02BC 0278
        SDBD                                    ; 64A1   0001
        MVII    #$09F1, R0                      ; 64A2   02B8 00F1 0009
        MVII    #$000B, R1                      ; 64A5   02B9 000B
L_64A7:
        MVO@    R0,     R4                      ; 64A7   0260
        DECR    R1                              ; 64A8   0011
        BNEQ    L_64A7                          ; 64A9   022C 0003

        SUBI    #$00D0, R0                      ; 64AB   0338 00D0
        MVII    #$0004, R1                      ; 64AD   02B9 0004
L_64AF:
        SUBI    #$0015, R4                      ; 64AF   033C 0015
        MVO@    R0,     R4                      ; 64B1   0260
        DECR    R1                              ; 64B2   0011
        BNEQ    L_64AF                          ; 64B3   022C 0005

        ADDI    #$0008, R0                      ; 64B5   02F8 0008
        SUBI    #$0015, R4                      ; 64B7   033C 0015
        MVO@    R0,     R4                      ; 64B9   0260

        JSR     R5,     L_6116                  ; 64BA   0004 0160 0116
        DECLE   $0000                           ; 64BD   0000
        BIDECLE $30C6                           ; 64BE   00C6 0030

        MVI     G_0164, R0                      ; 64C0   0280 0164
        ANDI    #$00EF, R0                      ; 64C2   03B8 00EF
        XORI    #$0010, R0                      ; 64C4   03F8 0010
        MVO     R0,     G_0164                  ; 64C6   0240 0164
        MOVR    R0,     R1                      ; 64C8   0081
        MVII    #$0046, R0                      ; 64C9   02B8 0046
        SARC    R1,     1                       ; 64CB   0079
        BNC     L_64D0                          ; 64CC   0209 0002

        MVII    #$0042, R0                      ; 64CE   02B8 0042

L_64D0:
        JSR     R5,     L_5D1E                  ; 64D0   0004 015C 011E

        MVII    #$032D, R4                      ; 64D3   02BC 032D

        JSR     R5,     L_6118                  ; 64D5   0004 0160 0118
        DECLE   $0000                           ; 64D8   0000
        BIDECLE $30C6                           ; 64D9   00C6 0030
L_64DB:
        MVI     G_019F, R0                      ; 64DB   0280 019F
        SLL     R0,     2                       ; 64DD   004C
        SLL     R0,     2                       ; 64DE   004C
        ADDI    #$0016, R0                      ; 64DF   02F8 0016
        SWAP    R0,     1                       ; 64E1   0040
        MVO     R0,     G_032F                  ; 64E2   0240 032F
        MVII    #$0027, R0                      ; 64E4   02B8 0027
        SWAP    R0,     1                       ; 64E6   0040
        MVO     R0,     G_0330                  ; 64E7   0240 0330
L_64E9:
        PULR    R7                              ; 64E9   02B7

L_64EA:
        MVI@    R3,     R2                      ; 64EA   029A
        XORR    R0,     R2                      ; 64EB   01C2
        MVO@    R2,     R3                      ; 64EC   025A
        INCR    R3                              ; 64ED   000B
        DECR    R1                              ; 64EE   0011
        BNEQ    L_64EA                          ; 64EF   022C 0006
        MOVR    R5,     R7                      ; 64F1   00AF

        PSHR    R5                              ; 64F2   0275
        DECR    R0                              ; 64F3   0010
        BMI     L_64E9                          ; 64F4   022B 000C

        CMPI    #$0003, R0                      ; 64F6   0378 0003
        BGT     L_64E9                          ; 64F8   022E 0010

        CMP     G_019F, R0                      ; 64FA   0340 019F
        BEQ     L_64E9                          ; 64FC   0224 0014

        MVO     R0,     G_019F                  ; 64FE   0240 019F
        B       L_64DB                          ; 6500   0220 0026

L_6502:
        PSHR    R5                              ; 6502   0275
        DECLE   $0004,  $01FC,  $01CA           ; 6503   0004 01FC 01CA

        SDBD                                    ; 6506   0001
        XORI    #$0980, R1                      ; 6507   03F9 0080 0009
        MVII    #$0252, R4                      ; 650A   02BC 0252
        MVII    #$0004, R0                      ; 650C   02B8 0004
L_650E:
        MVO@    R1,     R4                      ; 650E   0261
        INCR    R4                              ; 650F   000C
        ADDI    #$0008, R1                      ; 6510   02F9 0008
        DECR    R0                              ; 6512   0010
        BNEQ    L_650E                          ; 6513   022C 0006
        PULR    R7                              ; 6515   02B7

        DECLE   $0001,  $00E8,  $0035,  $0020   ; 6516   0001 00E8 0035 0020
        DECLE   $0039,  $0001,  $0026,  $0065   ; 651A   0039 0001 0026 0065
        DECLE   $0028,  $0039,  $0001,  $0060   ; 651E   0028 0039 0001 0060
        DECLE   $0036,  $00F0,  $0039,  $0000   ; 6522   0036 00F0 0039 0000
        DECLE   $00FF,  $0003,  $0003,  $0003   ; 6526   00FF 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 652A   0003 0003 0003 0003
        DECLE   $03D9,  $009D,  $00FF,  $002E   ; 652E   03D9 009D 00FF 002E
        DECLE   $0051,  $0076,  $0065,  $0089   ; 6532   0051 0076 0065 0089
        DECLE   $005F,  $0000,  $023D,  $0047   ; 6536   005F 0000 023D 0047
        DECLE   $000D,  $00C4,  $0342,  $01CB   ; 653A   000D 00C4 0342 01CB
        DECLE   $01D1,  $034E,  $00BA,  $03CE   ; 653E   01D1 034E 00BA 03CE
        DECLE   $03C0,  $02F4,  $0028,  $02F2   ; 6542   03C0 02F4 0028 02F2
        DECLE   $0204,  $0091,  $00DE,  $02F2   ; 6546   0204 0091 00DE 02F2
        DECLE   $0217,  $00D5,  $00DE,  $02F3   ; 654A   0217 00D5 00DE 02F3
        DECLE   $0064,  $02F1,  $0004,  $01DC   ; 654E   0064 02F1 0004 01DC
        DECLE   $01A3,  $005F,  $0065,  $0076   ; 6552   01A3 005F 0065 0076
        DECLE   $0065,  $0268,  $0004,  $01FC   ; 6556   0065 0268 0004 01FC
        DECLE   $0390,  $0004                   ; 655A   0390 0004

        XORR    R7,     R4                      ; 655C   01FC
        CMP@    R2,     R6                      ; 655D   0356
        PULR    R7                              ; 655E   02B7

        DECLE   $002E,  $0223,  $0091,  $039E   ; 655F   002E 0223 0091 039E
        DECLE   $0000,  $000B,  $017A,  $0040   ; 6563   0000 000B 017A 0040
        DECLE   $0223,  $0345,  $022E,  $01B3   ; 6567   0223 0345 022E 01B3
        DECLE   $025C,  $03C0,  $000B,  $017A   ; 656B   025C 03C0 000B 017A
        DECLE   $0040,  $0223,  $0341           ; 656F   0040 0223 0341

        EIS                                     ; 6572   0002
        CMPR    R2,     R2                      ; 6573   0152
        AND@    R3,     R4                      ; 6574   039C
        XOR     .BTAB.75,R0                     ; 6575   03C0 0275

        JSR     R5,     L_5401                  ; 6577   0004 0154 0001
        BIDECLE $657D                           ; 657A   007D 0065

        PULR    R7                              ; 657C   02B7

        DECLE   $039E,  $0062,  $0067,  $003E   ; 657D   039E 0062 0067 003E
        DECLE   $0066,  $0074,  $005F,  $008A   ; 6581   0066 0074 005F 008A
        DECLE   $0066,  $0073,  $0067,  $0001   ; 6585   0066 0073 0067 0001

        ADD@    R6,     R5                      ; 6589   02F5
        ADD@    R6,     R1                      ; 658A   02F1
        MVI     G_0164, R0                      ; 658B   0280 0164
        ANDI    #$00FB, R0                      ; 658D   03B8 00FB
        MVO     R0,     G_0164                  ; 658F   0240 0164
        MVI     G_0162, R0                      ; 6591   0280 0162
        ANDI    #$00F7, R0                      ; 6593   03B8 00F7
        MVO     R0,     G_0162                  ; 6595   0240 0162
        MVII    #$0016, R0                      ; 6597   02B8 0016
        MVO     R0,     G_019C                  ; 6599   0240 019C
        MVII    #$031D, R4                      ; 659B   02BC 031D

        JSR     R5,     L_6118                  ; 659D   0004 0160 0118
        DECLE   $0000                           ; 65A0   0000
        BIDECLE $30C6                           ; 65A1   00C6 0030

        MVI     G_0173, R0                      ; 65A3   0280 0173
        CMPI    #$0001, R0                      ; 65A5   0378 0001
        BEQ     L_65AF                          ; 65A7   0204 0006

        JSR     R5,     L_5DF4                  ; 65A9   0004 015C 01F4
        DECLE   $0252                           ; 65AC   0252

        B       L_65B3                          ; 65AD   0200 0004

L_65AF:
        JSR     R5,     L_5DF8                  ; 65AF   0004 015C 01F8
        DECLE   $0252                           ; 65B2   0252
L_65B3:
        JSR     R5,     L_DE4C                  ; 65B3   0004 01DC 024C
        DECLE   $0003,  $0008,  $0202,  $0006   ; 65B6   0003 0008 0202 0006
        DECLE   $0036,  $003B,  $0034,  $003C   ; 65BA   0036 003B 0034 003C
        DECLE   $003A,  $0038,  $0280,  $0173   ; 65BE   003A 0038 0280 0173
        DECLE   $0080,  $020C,  $000D,  $0004   ; 65C2   0080 020C 000D 0004
        DECLE   $01DC,  $024E,  $0217,  $0006   ; 65C6   01DC 024E 0217 0006
        DECLE   $0035,  $003D,  $002D,  $0037   ; 65CA   0035 003D 002D 0037

        RSWD    R0                              ; 65CE   0038
        ADCR    R5                              ; 65CF   002D
        B       L_6605                          ; 65D0   0200 0033

        DECLE   $0004,  $01DC,  $024E,  $0215   ; 65D2   0004 01DC 024E 0215
        DECLE   $0004,  $0038,  $0034,  $0036   ; 65D6   0004 0038 0034 0036
        DECLE   $003B,  $0378,  $0001,  $020C   ; 65DA   003B 0378 0001 020C
        DECLE   $000C,  $0004,  $01DC,  $024E   ; 65DE   000C 0004 01DC 024E
        DECLE   $021A,  $0005,  $0039,  $002D   ; 65E2   021A 0005 0039 002D
        DECLE   $003D,  $003C,  $002F,  $0200   ; 65E6   003D 003C 002F 0200
        DECLE   $0009,  $0004,  $01DC,  $024E   ; 65EA   0009 0004 01DC 024E
        DECLE   $021A,  $0004,  $0035,  $0034   ; 65EE   021A 0004 0035 0034
        DECLE   $0036,  $0037,  $0004,  $01DC   ; 65F2   0036 0037 0004 01DC
        DECLE   $024E,  $0228,  $0004           ; 65F6   024E 0228 0004

        RSWD    R1                              ; 65F9   0039
        ADCR    R5                              ; 65FA   002D
        RSWD    R5                              ; 65FB   003D
        ADCR    R6                              ; 65FC   002E
        TSTR    R0                              ; 65FD   0080
        BEQ     L_6605                          ; 65FE   0204 0005

        JSR     R5,     L_FE13                  ; 6600   0004 01FC 0213

        MOVR    R1,     R0                      ; 6603   0088
        SLR     R3,     2                       ; 6604   0067

L_6605:
        JSR     R5,     L_660C                  ; 6605   0004 0164 020C
        JSR     R5,     L_5E9C                  ; 6608   0004 015C 029C

        PULR    R7                              ; 660B   02B7

L_660C:
        PSHR    R5                              ; 660C   0275
L_660D:
        MVI     G_0173, R0                      ; 660D   0280 0173

        JSR     R5,     L_662C                  ; 660F   0004 0164 022C

        MVI@    R1,     R1                      ; 6612   0289
        ANDI    #$000F, R1                      ; 6613   03B9 000F
L_6615:
        MVII    #$031F, R4                      ; 6615   02BC 031F

        JSR     R5,     L_5E49                  ; 6617   0004 015C 0249

        TSTR    R0                              ; 661A   0080
        BEQ     L_6628                          ; 661B   0204 000B

L_661D:
        JSR     R5,     L_5DEE                  ; 661D   0004 015C 01EE

        MVI     G_0164, R0                      ; 6620   0280 0164
        ANDI    #$0004, R0                      ; 6622   03B8 0004
        BNEQ    L_6629                          ; 6624   020C 0003

        MVO     R2,     .BTAB.2D                ; 6626   0242 022D
L_6628:
        PULR    R7                              ; 6628   02B7

L_6629:
        MVO     R2,     .BTAB.32                ; 6629   0242 0232
        PULR    R7                              ; 662B   02B7

L_662C:
        MVI     G_0173, R0                      ; 662C   0280 0173
        MVII    #$019D, R1                      ; 662E   02B9 019D
        CMPI    #$0001, R0                      ; 6630   0378 0001
        BLT     L_6639                          ; 6632   0205 0005
        BEQ     L_663D                          ; 6634   0204 0007

        INCR    R1                              ; 6636   0009
        B       L_663D                          ; 6637   0200 0004

L_6639:
        SDBD                                    ; 6639   0001
        MVII    #$47C7, R1                      ; 663A   02B9 00C7 0047
L_663D:
        MOVR    R5,     R7                      ; 663D   00AF

        PSHR    R5                              ; 663E   0275
        MOVR    R0,     R2                      ; 663F   0082
        MVI     G_0162, R0                      ; 6640   0280 0162
        ANDI    #$0008, R0                      ; 6642   03B8 0008
        BNEQ    L_6628                          ; 6644   022C 001D

        MVI     G_0173, R0                      ; 6646   0280 0173

        JSR     R5,     L_662C                  ; 6648   0004 0164 022C

        MVII    #$0008, R4                      ; 664B   02BC 0008
        DECR    R0                              ; 664D   0010
        BEQ     L_6652                          ; 664E   0204 0002

        MVII    #$0010, R4                      ; 6650   02BC 0010
L_6652:
        MOVR    R2,     R0                      ; 6652   0090
        MVI@    R1,     R2                      ; 6653   028A
        MVI     G_0173, R1                      ; 6654   0281 0173
        TSTR    R1                              ; 6656   0089
        BEQ     L_6665                          ; 6657   0204 000C

        MVI     G_0164, R1                      ; 6659   0281 0164
        ANDI    #$0004, R1                      ; 665B   03B9 0004
        BEQ     L_6663                          ; 665D   0204 0004

        SLR     R2,     2                       ; 665F   0066
        SLR     R2,     2                       ; 6660   0066
        B       L_6665                          ; 6661   0200 0002

L_6663:
        ANDI    #$000F, R2                      ; 6663   03BA 000F
L_6665:
        MVII    #$0004, R3                      ; 6665   02BB 0004
        DECLE   $0004,  $01FC,  $0226           ; 6667   0004 01FC 0226

        MOVR    R1,     R4                      ; 666A   008C
        MVI     G_0173, R0                      ; 666B   0280 0173

        JSR     R5,     L_662C                  ; 666D   0004 0164 022C

        TSTR    R0                              ; 6670   0080
        BEQ     L_6680                          ; 6671   0204 000D

        TSTR    R4                              ; 6673   00A4
        BEQ     L_6680                          ; 6674   0204 000A

        MVI@    R1,     R3                      ; 6676   028B
        ANDI    #$000F, R3                      ; 6677   03BB 000F
        PSHR    R2                              ; 6679   0272
        SLL     R2,     2                       ; 667A   004E
        SLL     R2,     2                       ; 667B   004E
        XORR    R2,     R3                      ; 667C   01D3
        MVO@    R3,     R1                      ; 667D   024B
        PULR    R2                              ; 667E   02B2
        INCR    R7                              ; 667F   000F

L_6680:
        MVO@    R2,     R1                      ; 6680   024A
L_6681:
        PSHR    R0                              ; 6681   0270
        PSHR    R2                              ; 6682   0272

        JSR     R5,     L_5EA1                  ; 6683   0004 015C 02A1

        PULR    R1                              ; 6686   02B1
        PULR    R0                              ; 6687   02B0
        B       L_6615                          ; 6688   0220 0074

        MVI     G_0173, R0                      ; 668A   0280 0173
        TSTR    R0                              ; 668C   0080
        BNEQ    L_6692                          ; 668D   020C 0003
        J       L_5F74                          ; 668F   0004 035C 0374

L_6692:
        PSHR    R5                              ; 6692   0275
        DECLE   $0004,  $01FC,  $0208,  $0185   ; 6693   0004 01FC 0208 0185
        DECLE   $00B7,  $0066,  $0000           ; 6697   00B7 0066 0000

        MVI     G_0164, R1                      ; 669A   0281 0164
        XORI    #$0004, R1                      ; 669C   03F9 0004
        MVO     R1,     G_0164                  ; 669E   0241 0164

        JSR     R5,     L_DE4C                  ; 66A0   0004 01DC 024C

        DIS                                     ; 66A3   0003
L_66A4:
        INCR    R0                              ; 66A4   0008
        BESC    L_66A4                          ; 66A5   022F 0002
        ADCR    R7                              ; 66A7   002F

        RSWD    R5                              ; 66A8   003D

L_66A9:
        JSR     R5,     L_662C                  ; 66A9   0004 0164 022C

        MVI@    R1,     R2                      ; 66AC   028A
        MOVR    R2,     R3                      ; 66AD   0093
        SLL     R2,     2                       ; 66AE   004E
        SLL     R2,     2                       ; 66AF   004E
        ANDI    #$000F, R3                      ; 66B0   03BB 000F
        XORR    R3,     R2                      ; 66B2   01DA
        MVO@    R2,     R1                      ; 66B3   024A
        MOVR    R3,     R2                      ; 66B4   009A
        B       L_661D                          ; 66B5   0220 0099

        PSHR    R5                              ; 66B7   0275
        MVI     G_0173, R0                      ; 66B8   0280 0173

        JSR     R5,     L_662C                  ; 66BA   0004 0164 022C

        MVI@    R1,     R2                      ; 66BD   028A
        MOVR    R2,     R3                      ; 66BE   0093
        SLR     R3,     2                       ; 66BF   0067
        SLR     R3,     2                       ; 66C0   0067
        ANDI    #$000F, R2                      ; 66C1   03BA 000F
        DECR    R0                              ; 66C3   0010
        BEQ     L_66D4                          ; 66C4   0204 000E

        JSR     R5,     L_5DEE                  ; 66C6   0004 015C 01EE

        MOVR    R2,     R1                      ; 66C9   0091
        MOVR    R3,     R2                      ; 66CA   009A

        JSR     R5,     L_5DEE                  ; 66CB   0004 015C 01EE

        SDBD                                    ; 66CE   0001
        MVII    #$3600, R0                      ; 66CF   02B8 0000 0036
        B       L_66D8                          ; 66D2   0200 0004

L_66D4:
        MOVR    R2,     R1                      ; 66D4   0091
        MOVR    R3,     R2                      ; 66D5   009A
        MVII    #$0007, R0                      ; 66D6   02B8 0007
L_66D8:
        MVI     G_0162, R3                      ; 66D8   0283 0162
        ANDI    #$0008, R3                      ; 66DA   03BB 0008
        BNEQ    L_6715                          ; 66DC   020C 0037

        MVII    #$020B, R3                      ; 66DE   02BB 020B
L_66E0:
        PSHR    R3                              ; 66E0   0273
        MOVR    R3,     R5                      ; 66E1   009D
        ADDI    #$0009, R5                      ; 66E2   02FD 0009
L_66E4:
        MVI@    R3,     R4                      ; 66E4   029C
        SDBD                                    ; 66E5   0001
        ANDI    #$0800, R4                      ; 66E6   03BC 0000 0008
        BEQ     L_66F6                          ; 66E9   0204 000B

        MVI@    R3,     R4                      ; 66EB   029C
        ANDR    R0,     R4                      ; 66EC   0184
        CMPR    R4,     R1                      ; 66ED   0161
        BNEQ    L_66F6                          ; 66EE   020C 0006

        MVI@    R3,     R4                      ; 66F0   029C
        COMR    R0                              ; 66F1   0018
        ANDR    R0,     R4                      ; 66F2   0184
        COMR    R0                              ; 66F3   0018
        XORR    R2,     R4                      ; 66F4   01D4
        MVO@    R4,     R3                      ; 66F5   025C
L_66F6:
        INCR    R3                              ; 66F6   000B
        CMPR    R5,     R3                      ; 66F7   016B
        BLT     L_66E4                          ; 66F8   0225 0015

        PULR    R3                              ; 66FA   02B3
        ADDI    #$0014, R3                      ; 66FB   02FB 0014
        CMPI    #$02F0, R3                      ; 66FD   037B 02F0
        BLT     L_66E0                          ; 66FF   0225 0020

        MVI     G_0162, R0                      ; 6701   0280 0162
        XORI    #$0008, R0                      ; 6703   03F8 0008
        MVO     R0,     G_0162                  ; 6705   0240 0162
        MVII    #$023F, R4                      ; 6707   02BC 023F
        MVII    #$0007, R3                      ; 6709   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 670B   0004 0118 007B
        STRING  "KEEP?"                         ; 670E  
        DECLE   $0000                           ; 6713   0000

        PULR    R7                              ; 6714   02B7

L_6715:
        SDBD                                    ; 6715   0001
        MVII    #$8800, R4                      ; 6716   02BC 0000 0088
L_6719:
        SDBD                                    ; 6719   0001
        MVI@    R4,     R3                      ; 671A   02A3
        ANDR    R0,     R3                      ; 671B   0183
        CMPR    R3,     R1                      ; 671C   0159
        BNEQ    L_672C                          ; 671D   020C 000D

        SUBI    #$0002, R4                      ; 671F   033C 0002
        SDBD                                    ; 6721   0001
        MVI@    R4,     R3                      ; 6722   02A3
        COMR    R0                              ; 6723   0018
        ANDR    R0,     R3                      ; 6724   0183
        COMR    R0                              ; 6725   0018
        XORR    R2,     R3                      ; 6726   01D3
        SUBI    #$0002, R4                      ; 6727   033C 0002
        MVO@    R3,     R4                      ; 6729   0263
        SWAP    R3,     1                       ; 672A   0043
        MVO@    R3,     R4                      ; 672B   0263
L_672C:
        SDBD                                    ; 672C   0001
        CMPI    #$89E0, R4                      ; 672D   037C 00E0 0089
        BLT     L_6719                          ; 6730   0225 0018

        MVI     G_0173, R0                      ; 6732   0280 0173

        JSR     R5,     L_662C                  ; 6734   0004 0164 022C
        DECLE   $028A,  $0066,  $0066,  $024A   ; 6737   028A 0066 0066 024A
        DECLE   $0280,  $0162,  $03B8,  $00F7   ; 673B   0280 0162 03B8 00F7
        DECLE   $0240,  $0162,  $0280,  $0164   ; 673F   0240 0162 0280 0164
        DECLE   $03B8,  $00FB,  $0240,  $0164   ; 6743   03B8 00FB 0240 0164
        DECLE   $02BC,  $023F,  $02B9,  $0006   ; 6747   02BC 023F 02B9 0006
        DECLE   $01C0,  $0260,  $0011,  $022C   ; 674B   01C0 0260 0011 022C
        DECLE   $0003,  $02BC,  $022F,  $0260   ; 674F   0003 02BC 022F 0260
        DECLE   $0260,  $000C,  $0260,  $0004   ; 6753   0260 000C 0260 0004
        DECLE   $01FC,  $0208,  $0185,  $008A   ; 6757   01FC 0208 0185 008A
        DECLE   $0066,  $0000                   ; 675B   0066 0000

        JSR     R5,     L_5EA1                  ; 675D   0004 015C 02A1

        B       L_660D                          ; 6760   0220 0154

        PSHR    R5                              ; 6762   0275
        MVI     G_0162, R1                      ; 6763   0281 0162
        ANDI    #$0008, R1                      ; 6765   03B9 0008
        BEQ     L_6628                          ; 6767   0224 0140

        JSR     R5,     L_FE65                  ; 6769   0004 01FC 0265
        DECLE   $0059,  $00B8,  $0066,  $004E   ; 676C   0059 00B8 0066 004E
        DECLE   $003B,  $0067,  $0000,  $002D   ; 6770   003B 0067 0000 002D
        DECLE   $005F,  $0046,  $0000,  $0038   ; 6774   005F 0046 0000 0038
        DECLE   $0008,  $002E,  $0055,  $00A0   ; 6778   0008 002E 0055 00A0
        DECLE   $0039,  $0002,  $0096,  $0055   ; 677C   0039 0002 0096 0055
        DECLE   $00E0,  $0039,  $0003,  $00B6   ; 6780   00E0 0039 0003 00B6
        DECLE   $0055,  $0068,  $0039,  $0000   ; 6784   0055 0068 0039 0000
        DECLE   $0001,  $007E,  $0055,  $00B8   ; 6788   0001 007E 0055 00B8
        DECLE   $0039,  $0001,  $008E,  $0055   ; 678C   0039 0001 008E 0055
        DECLE   $0070,  $0039,  $0000,  $03BB   ; 6790   0070 0039 0000 03BB
        DECLE   $009D,  $00FF                   ; 6794   009D 00FF

        ADDR    R1,     R7                      ; 6796   00CF

        SLR     R3,     2                       ; 6797   0067
        ADCR    R6                              ; 6798   002E
        RLC     R1,     1                       ; 6799   0051
        COMR    R3                              ; 679A   001B
        SAR     R0,     1                       ; 679B   0068
        ADCR    R4                              ; 679C   002C
        MOVR    R3,     R7                      ; 679D   009F

        DECLE   $0067,  $0000,  $0089,  $005F   ; 679E   0067 0000 0089 005F
        DECLE   $0000,  $02F4,  $0014,  $02F2   ; 67A2   0000 02F4 0014 02F2
        DECLE   $0203,  $00DD,  $00DE,  $02F3   ; 67A6   0203 00DD 00DE 02F3
        DECLE   $0028,  $02F1,  $0280,  $0164   ; 67AA   0028 02F1 0280 0164
        DECLE   $03B8,  $00F7,  $0240,  $0164   ; 67AE   03B8 00F7 0240 0164
        DECLE   $0004,  $01DC,  $01A3,  $00BA   ; 67B2   0004 01DC 01A3 00BA
        DECLE   $0069,  $00E6,  $0069,  $022C   ; 67B6   0069 00E6 0069 022C
        DECLE   $0004,  $01FC,  $0390,  $0004   ; 67BA   0004 01FC 0390 0004

        XORR    R7,     R4                      ; 67BE   01FC
        CMP@    R2,     R6                      ; 67BF   0356
        SDBD                                    ; 67C0   0001
        MVII    #$067B, R0                      ; 67C1   02B8 007B 0006
        MVII    #$02B4, R4                      ; 67C4   02BC 02B4
        MVII    #$0014, R1                      ; 67C6   02B9 0014
L_67C8:
        MVO@    R0,     R4                      ; 67C8   0260
        DECR    R1                              ; 67C9   0011
        BNEQ    L_67C8                          ; 67CA   022C 0003

        CLRR    R2                              ; 67CC   01D2
        B       L_67E6                          ; 67CD   0200 0017

        PSHR    R5                              ; 67CF   0275
        MVI     G_0164, R3                      ; 67D0   0283 0164

        JSR     R5,     L_FE65                  ; 67D2   0004 01FC 0265
        DECLE   $0056,  $0011,  $0068,  $0043   ; 67D5   0056 0011 0068 0043
        DECLE   $00DC,  $0067,  $0000           ; 67D9   00DC 0067 0000

        MOVR    R7,     R2                      ; 67DC   00BA
        MOVR    R3,     R1                      ; 67DD   0099
        ANDI    #$0008, R3                      ; 67DE   03BB 0008
        BNEQ    L_6810                          ; 67E0   020C 002E

        XORI    #$0008, R1                      ; 67E2   03F9 0008
L_67E4:
        MVO     R1,     G_0164                  ; 67E4   0241 0164
L_67E6:
        MVI     G_017C, R0                      ; 67E6   0280 017C
        MVO     R0,     G_017B                  ; 67E8   0240 017B
        MVII    #$02CB, R4                      ; 67EA   02BC 02CB

        JSR     R5,     L_DDD3                  ; 67EC   0004 01DC 01D3
        DECLE   $02BA,  $02A8,  $0096,  $0352   ; 67EF   02BA 02A8 0096 0352
        DECLE   $0051,  $0084,  $01BC,  $005A   ; 67F3   0051 0084 01BC 005A
        DECLE   $004E,  $01F8,  $0352,  $0051   ; 67F7   004E 01F8 0352 0051
        DECLE   $0084,  $01BE,  $0000,  $0272   ; 67FB   0084 01BE 0000 0272
        DECLE   $0004                           ; 67FF   0004

        XORR    R7,     R4                      ; 6800   01FC
L_6801:
        CMP@    R3,     R5                      ; 6801   035D
        DECLE   $02B2,  $02BC,  $02CB,  $0092   ; 6802   02B2 02BC 02CB 0092
        DECLE   $0204,  $0002,  $02FC,  $0014   ; 6806   0204 0002 02FC 0014
        DECLE   $0004,  $01FC,  $03B0,  $000D   ; 680A   0004 01FC 03B0 000D
        DECLE   $0006,  $0000                   ; 680E   0006 0000
L_6810:
        PULR    R7                              ; 6810   02B7

        CLRR    R2                              ; 6811   01D2
        MOVR    R3,     R1                      ; 6812   0099
        ANDI    #$0008, R3                      ; 6813   03BB 0008
        BEQ     L_6810                          ; 6815   0224 0006

        ANDI    #$00F7, R1                      ; 6817   03B9 00F7
        B       L_67E4                          ; 6819   0220 0036

        PSHR    R5                              ; 681B   0275
        MVI     G_0164, R0                      ; 681C   0280 0164
        ANDI    #$0008, R0                      ; 681E   03B8 0008
        BNEQ    L_683E                          ; 6820   020C 001C

        MVI     G_0173, R0                      ; 6822   0280 0173
        SLL     R0,     1                       ; 6824   0048
        ADDR    R7,     R0                      ; 6825   00F8
        ADDI    #$014B, R0                      ; 6826   02F8 014B
        MOVR    R0,     R4                      ; 6828   0084
        SDBD                                    ; 6829   0001
        MVI@    R4,     R0                      ; 682A   02A0
        MVO     R0,     G_016C                  ; 682B   0240 016C
        SWAP    R0,     1                       ; 682D   0040
        MVO     R0,     G_016D                  ; 682E   0240 016D
        MVII    #$0020, R0                      ; 6830   02B8 0020
        MVO     R0,     G_0163                  ; 6832   0240 0163
L_6834:
        CMP     G_0163, R0                      ; 6834   0340 0163
        BEQ     L_6834                          ; 6836   0224 0003

        JSR     R5,     L_5401                  ; 6838   0004 0154 0001
        BIDECLE $6897                           ; 683B   0097 0068

        PULR    R7                              ; 683D   02B7

L_683E:
        MVII    #$0007, R0                      ; 683E   02B8 0007
        MVO     R0,     G_017B                  ; 6840   0240 017B
        MVII    #$02CB, R4                      ; 6842   02BC 02CB

        JSR     R5,     L_DDD3                  ; 6844   0004 01DC 01D3
        DECLE   $0011,  $009A,  $030E,  $029A   ; 6847   0011 009A 030E 029A
        DECLE   $0254,  $0224,  $03CD,  $03C0   ; 684B   0254 0224 03CD 03C0
        DECLE   $0004,  $01FC,  $035D,  $0004   ; 684F   0004 01FC 035D 0004
        DECLE   $01FC,  $0208,  $0185,  $0075   ; 6853   01FC 0208 0185 0075
        DECLE   $0068,  $017F,  $005D,  $0068   ; 6857   0068 017F 005D 0068
        DECLE   $0000                           ; 685B   0000

        PULR    R7                              ; 685C   02B7

        PSHR    R5                              ; 685D   0275

        JSR     R5,     L_FE65                  ; 685E   0004 01FC 0265
        DECLE   $0059,  $0076,  $0068,  $004E   ; 6861   0059 0076 0068 004E
        DECLE   $0068,  $0068,  $0000,  $0004   ; 6865   0068 0068 0000 0004
        DECLE   $01FC,  $0208                   ; 6869   01FC 0208

        ANDR    R0,     R5                      ; 686B   0185
        COMR    R3                              ; 686C   001B
        SAR     R0,     1                       ; 686D   0068
        CMPR    R7,     R7                      ; 686E   017F
        ADDR    R1,     R7                      ; 686F   00CF

        DECLE   $0067,  $0000                   ; 6870   0067 0000

        MOVR    R7,     R2                      ; 6872   00BA
        B       L_67E6                          ; 6873   0220 008E

        PSHR    R5                              ; 6875   0275
        MVII    #$0007, R0                      ; 6876   02B8 0007
        MVO     R0,     G_017B                  ; 6878   0240 017B
        MVII    #$02CB, R4                      ; 687A   02BC 02CB

        JSR     R5,     L_DDD3                  ; 687C   0004 01DC 01D3
        DECLE   $0242,  $0224,  $008D,  $0342   ; 687F   0242 0224 008D 0342
        DECLE   $01CF,  $0104,  $007E,  $0000   ; 6883   01CF 0104 007E 0000
        DECLE   $0004,  $01FC,  $035D,  $0004   ; 6887   0004 01FC 035D 0004
        DECLE   $01FC,  $0208,  $0185,  $002E   ; 688B   01FC 0208 0185 002E
        DECLE   $0051,  $017F,  $0000,  $0000   ; 688F   0051 017F 0000 0000
        DECLE   $0000                           ; 6893   0000
L_6894:
        MOVR    R7,     R2                      ; 6894   00BA
        B       L_68A7                          ; 6895   0200 0010

        DECLE   $0318,  $0074,  $005F,  $0074   ; 6897   0318 0074 005F 0074
        DECLE   $005F,  $0001                   ; 689B   005F 0001

        ADD@    R6,     R1                      ; 689D   02F1

        JSR     R5,     L_FE13                  ; 689E   0004 01FC 0213

        TSTR    R3                              ; 68A1   009B
        SAR     R1,     1                       ; 68A2   0069

        JSR     R5,     L_5FCC                  ; 68A3   0004 015C 03CC

        CLRR    R2                              ; 68A6   01D2
L_68A7:
        MVI     G_0173, R0                      ; 68A7   0280 0173
        MOVR    R0,     R3                      ; 68A9   0083
        SLL     R0,     1                       ; 68AA   0048
        ADDR    R7,     R0                      ; 68AB   00F8
        ADDI    #$00F5, R0                      ; 68AC   02F8 00F5
        MOVR    R0,     R5                      ; 68AE   0085
        SDBD                                    ; 68AF   0001
        MVI@    R5,     R4                      ; 68B0   02AC
L_68B1:
        MVI@    R4,     R1                      ; 68B1   02A1
        TSTR    R1                              ; 68B2   0089
        BEQ     L_68D1                          ; 68B3   0204 001C

        SDBD                                    ; 68B5   0001
        MVI@    R4,     R0                      ; 68B6   02A0
        MVI@    R4,     R5                      ; 68B7   02A5
        TSTR    R2                              ; 68B8   0092
        BEQ     L_68CB                          ; 68B9   0204 0010

        SUBI    #$0200, R5                      ; 68BB   033D 0200
        ADDR    R5,     R5                      ; 68BD   00ED
        SDBD                                    ; 68BE   0001
        ADDI    #$8800, R5                      ; 68BF   02FD 0000 0088
L_68C2:
        MVO@    R0,     R5                      ; 68C2   0268
        SWAP    R0,     1                       ; 68C3   0040
        MVO@    R0,     R5                      ; 68C4   0268
        SWAP    R0,     1                       ; 68C5   0040
        DECR    R1                              ; 68C6   0011
        BNEQ    L_68C2                          ; 68C7   022C 0006
        B       L_68B1                          ; 68C9   0220 0019

L_68CB:
        MVO@    R0,     R5                      ; 68CB   0268
        DECR    R1                              ; 68CC   0011
        BNEQ    L_68CB                          ; 68CD   022C 0003
        B       L_68B1                          ; 68CF   0220 001F

L_68D1:
        SDBD                                    ; 68D1   0001
        MVI@    R4,     R0                      ; 68D2   02A0
        TSTR    R0                              ; 68D3   0080
        BEQ     L_68ED                          ; 68D4   0204 0017

L_68D6:
        MVI@    R4,     R5                      ; 68D6   02A5
        TSTR    R5                              ; 68D7   00AD
        BEQ     L_68D1                          ; 68D8   0224 0008

        TSTR    R2                              ; 68DA   0092
        BEQ     L_68EA                          ; 68DB   0204 000D

        SUBI    #$0200, R5                      ; 68DD   033D 0200
        ADDR    R5,     R5                      ; 68DF   00ED
        SDBD                                    ; 68E0   0001
        ADDI    #$8800, R5                      ; 68E1   02FD 0000 0088
        MVO@    R0,     R5                      ; 68E4   0268
        SWAP    R0,     1                       ; 68E5   0040
        MVO@    R0,     R5                      ; 68E6   0268
        SWAP    R0,     1                       ; 68E7   0040
        B       L_68D6                          ; 68E8   0220 0013

L_68EA:
        MVO@    R0,     R5                      ; 68EA   0268
        B       L_68D6                          ; 68EB   0220 0016

L_68ED:
        MOVR    R3,     R1                      ; 68ED   0099
        ADDR    R7,     R1                      ; 68EE   00F9
        ADDI    #$00C5, R1                      ; 68EF   02F9 00C5
        TSTR    R2                              ; 68F1   0092
        BEQ     L_6944                          ; 68F2   0204 0050

        MVI@    R1,     R1                      ; 68F4   0289
        SDBD                                    ; 68F5   0001
        MVII    #$47C7, R2                      ; 68F6   02BA 00C7 0047
        MVO@    R1,     R2                      ; 68F9   0251
        CLRR    R0                              ; 68FA   01C0
        SDBD                                    ; 68FB   0001
        MVII    #$465F, R4                      ; 68FC   02BC 005F 0046
        MVII    #$0168, R1                      ; 68FF   02B9 0168
L_6901:
        MVO@    R0,     R4                      ; 6901   0260
        DECR    R1                              ; 6902   0011
        BNEQ    L_6901                          ; 6903   022C 0003

        CMPI    #$0005, R3                      ; 6905   037B 0005
        BEQ     L_6810                          ; 6907   0224 00F8

        SLL     R3,     1                       ; 6909   004B
        ADDR    R7,     R3                      ; 690A   00FB
        ADDI    #$0066, R3                      ; 690B   02FB 0066
        MOVR    R3,     R4                      ; 690D   009C
        SDBD                                    ; 690E   0001
        MVI@    R4,     R5                      ; 690F   02A5
        MVI@    R5,     R1                      ; 6910   02A9
        SLL     R1,     2                       ; 6911   004D
        SLL     R1,     1                       ; 6912   0049
        SDBD                                    ; 6913   0001
        MVI@    R5,     R4                      ; 6914   02AC
        SDBD                                    ; 6915   0001
        MVII    #$465F, R5                      ; 6916   02BD 005F 0046
L_6919:
        MVI@    R4,     R0                      ; 6919   02A0
        MVO@    R0,     R5                      ; 691A   0268
        DECR    R1                              ; 691B   0011
        BNEQ    L_6919                          ; 691C   022C 0004

        MVI     G_0173, R0                      ; 691E   0280 0173
        CMPI    #$0004, R0                      ; 6920   0378 0004
        BNEQ    L_6810                          ; 6922   022C 0113

        SDBD                                    ; 6924   0001
        MVII    #$8854, R5                      ; 6925   02BD 0054 0088
        SDBD                                    ; 6928   0001
        MVII    #$0E01, R0                      ; 6929   02B8 0001 000E
L_692C:
        MVII    #$0008, R1                      ; 692C   02B9 0008
L_692E:
        MVO@    R0,     R5                      ; 692E   0268
        SWAP    R0,     1                       ; 692F   0040
        MVO@    R0,     R5                      ; 6930   0268
        SWAP    R0,     1                       ; 6931   0040
        ADDI    #$0002, R5                      ; 6932   02FD 0002
        ADDI    #$0008, R0                      ; 6934   02F8 0008
        SDBD                                    ; 6936   0001
        CMPI    #$89B0, R5                      ; 6937   037D 00B0 0089
        BGT     L_6810                          ; 693A   022E 012B

        DECR    R1                              ; 693C   0011
        BNEQ    L_692E                          ; 693D   022C 0010

        ADDI    #$0030, R5                      ; 693F   02FD 0030
        B       L_692C                          ; 6941   0220 0016
        PULR    R7                              ; 6943   02B7

L_6944:
        MVO     R1,     G_0139                  ; 6944   0241 0139
        SWAP    R1,     1                       ; 6946   0041
        MVO     R1,     G_013A                  ; 6947   0241 013A
        MVII    #$0001, R0                      ; 6949   02B8 0001
        MVO     R0,     G_0163                  ; 694B   0240 0163
L_694D:
        CMP     G_0163, R0                      ; 694D   0340 0163
        BEQ     L_694D                          ; 694F   0224 0003

        MVO     R0,     .STIC.VIDEN             ; 6951   0240 0020
        MVI     G_0173, R0                      ; 6953   0280 0173
        CMPI    #$0004, R0                      ; 6955   0378 0004
        BNEQ    L_6810                          ; 6957   022C 0148

        MVII    #$022A, R5                      ; 6959   02BD 022A
        SDBD                                    ; 695B   0001
        MVII    #$0E01, R0                      ; 695C   02B8 0001 000E
L_695F:
        MVII    #$0008, R1                      ; 695F   02B9 0008
L_6961:
        MVO@    R0,     R5                      ; 6961   0268
        INCR    R5                              ; 6962   000D
        ADDI    #$0008, R0                      ; 6963   02F8 0008
        CMPI    #$02D8, R5                      ; 6965   037D 02D8
        BGT     L_6810                          ; 6967   022E 0158

        DECR    R1                              ; 6969   0011
        BNEQ    L_6961                          ; 696A   022C 000A

        ADDI    #$0018, R5                      ; 696C   02FD 0018
        B       L_695F                          ; 696E   0220 0010
        PULR    R7                              ; 6970   02B7

        SARC    R1,     2                       ; 6971   007D
        SAR     R1,     1                       ; 6972   0069
        MOVR    R0,     R3                      ; 6973   0083
        SAR     R1,     1                       ; 6974   0069
        TSTR    R1                              ; 6975   0089
        SAR     R1,     1                       ; 6976   0069
        MOVR    R1,     R7                      ; 6977   008F

        DECLE   $0069,  $0095,  $0069,  $009B   ; 6978   0069 0095 0069 009B
        DECLE   $0069,  $000E,  $008E,  $0056   ; 697C   0069 000E 008E 0056
        DECLE   $0000,  $0038,  $0000,  $0008   ; 6980   0000 0038 0000 0008
        DECLE   $003E,  $0098,  $0000,  $0038   ; 6984   003E 0098 0000 0038
        DECLE   $0000,  $0020,  $0025,  $0099   ; 6988   0000 0020 0025 0099
        DECLE   $0000,  $0038,  $0000,  $0009   ; 698C   0000 0038 0000 0009
        DECLE   $00D2,  $009A,  $0000,  $0038   ; 6990   00D2 009A 0000 0038
        DECLE   $0000,  $0028,  $002E,  $0055   ; 6994   0000 0028 002E 0055
        DECLE   $0000,  $0038,  $0000,  $0001   ; 6998   0000 0038 0000 0001
        DECLE   $0000,  $0030,  $0060,  $0039   ; 699C   0000 0030 0060 0039
        DECLE   $0000,  $0095,  $0092,  $007E   ; 69A0   0000 0095 0092 007E
        DECLE   $0098,  $0025,  $009A,  $001A   ; 69A4   0098 0025 009A 001A
        DECLE   $009B,  $00BD,  $009B,  $00AD   ; 69A8   009B 00BD 009B 00AD
        DECLE   $0069,  $00F0,  $0063,  $0009   ; 69AC   0069 00F0 0063 0009
        DECLE   $0200,  $0000,  $0000,  $0000   ; 69B0   0200 0000 0000 0000
        DECLE   $000E,  $0000,  $0000,  $0000   ; 69B4   000E 0000 0000 0000
        DECLE   $0001,  $0001,  $0068,  $01AE   ; 69B8   0001 0001 0068 01AE
        DECLE   $0240,  $0291,  $0356,  $01D1   ; 69BC   0240 0291 0356 01D1
        DECLE   $0163,  $039E,  $0000           ; 69C0   0163 039E 0000

        SLR     R0,     2                       ; 69C3   0064
        MOVR    R1,     R7                      ; 69C4   008F

        DECLE   $0352,  $01E0,  $0044,  $039E   ; 69C5   0352 01E0 0044 039E
        DECLE   $0000,  $000B,  $0104,  $01BA   ; 69C9   0000 000B 0104 01BA
        DECLE   $01EB,  $000D,  $0093,  $039E   ; 69CD   01EB 000D 0093 039E
        DECLE   $0000,  $0256,  $000C,  $01FC   ; 69D1   0000 0256 000C 01FC
        DECLE   $03C0,  $000B,  $01E7,  $0001   ; 69D5   03C0 000B 01E7 0001
        DECLE   $0093,  $0352,  $0093,  $039E   ; 69D9   0093 0352 0093 039E
        DECLE   $0000,  $002B,  $000D,  $015A   ; 69DD   0000 002B 000D 015A
        DECLE   $0242,  $0224,  $008D,  $039E   ; 69E1   0242 0224 008D 039E
        DECLE   $0000,  $03F9,  $006A,  $00FF   ; 69E5   0000 03F9 006A 00FF
        DECLE   $00D0,  $0050,  $0019,  $006A   ; 69E9   00D0 0050 0019 006A
        DECLE   $0028,  $000E,  $0001,  $002C   ; 69ED   0028 000E 0001 002C
        DECLE   $00F3,  $0069,  $0000,  $0089   ; 69F1   00F3 0069 0000 0089
        DECLE   $005F,  $0000,  $02F4,  $003C   ; 69F5   005F 0000 02F4 003C
        DECLE   $02F2,  $0217,  $0098,  $00DE   ; 69F9   02F2 0217 0098 00DE
        DECLE   $02DD,  $0053,  $017E,  $01D6   ; 69FD   02DD 0053 017E 01D6
        DECLE   $03C0,  $02F2,  $02E5,  $00E6   ; 6A01   03C0 02F2 02E5 00E6
        DECLE   $00DE,  $02F3,  $0050,  $02F1   ; 6A05   00DE 02F3 0050 02F1
        DECLE   $02B8,  $00E9,  $0240,  $02E3   ; 6A09   02B8 00E9 0240 02E3
        DECLE   $0004,  $01DC,  $01A3           ; 6A0D   0004 01DC 01A3

        ADDR    R4,     R6                      ; 6A10   00E6
        ADDR    R3,     R6                      ; 6A11   00DE
        COMR    R1                              ; 6A12   0019
        ADDR    R3,     R7                      ; 6A13   00DF

        DECLE   $0253,  $0004                   ; 6A14   0253 0004

        XORR    R7,     R4                      ; 6A16   01FC
        AND@    R4,     R5                      ; 6A17   03A5
        PULR    R7                              ; 6A18   02B7

L_6A19:
        PSHR    R5                              ; 6A19   0275
        DECLE   $0004                           ; 6A1A   0004

        XORR    R7,     R4                      ; 6A1B   01FC
        CMP@    R6,     R3                      ; 6A1C   0373
        ADCR    R3                              ; 6A1D   002B
        SAR     R2,     1                       ; 6A1E   006A
        PULR    R7                              ; 6A1F   02B7

L_6A20:
        PSHR    R5                              ; 6A20   0275
        MVI     G_0169, R2                      ; 6A21   0282 0169

        JSR     R5,     L_FE24                  ; 6A23   0004 01FC 0224
        DECLE   $0004                           ; 6A26   0004

        INCR    R0                              ; 6A27   0008
        MVO     R2,     G_0169                  ; 6A28   0242 0169
        PULR    R7                              ; 6A2A   02B7

        DECLE   $0039,  $006A,  $000C,  $006B   ; 6A2B   0039 006A 000C 006B
        DECLE   $0021,  $006E,  $0076,  $00D2   ; 6A2F   0021 006E 0076 00D2
        DECLE   $0098,  $0095,  $00AD,  $00AD   ; 6A33   0098 0095 00AD 00AD
        DECLE   $00AD,  $00D3,  $03FF           ; 6A37   00AD 00D3 03FF

        ADDR    R0,     R0                      ; 6A3A   00C0
        SAR     R2,     1                       ; 6A3B   006A
        ADDR    R5,     R3                      ; 6A3C   00EB
        SAR     R2,     1                       ; 6A3D   006A
        ADDR    R4,     R7                      ; 6A3E   00E7

        DECLE   $006A,  $002E,  $0051,  $002E   ; 6A3F   006A 002E 0051 002E
        DECLE   $0051,  $002C,  $0047,  $006A   ; 6A43   0051 002C 0047 006A
        DECLE   $0000,  $0089,  $005F,  $0000   ; 6A47   0000 0089 005F 0000
        DECLE   $02F4,  $0028,  $02F2,  $0203   ; 6A4B   02F4 0028 02F2 0203
        DECLE   $0098,  $00DE,  $02F2,  $0219   ; 6A4F   0098 00DE 02F2 0219
        DECLE   $00E6,  $00DE,  $02F1,  $0004   ; 6A53   00E6 00DE 02F1 0004

        XORR    R7,     R4                      ; 6A57   01FC
        CMP@    R3,     R5                      ; 6A58   035D

        JSR     R5,     L_6A75                  ; 6A59   0004 0168 0275
        DECLE   $0004                           ; 6A5C   0004

        XORR    R7,     R4                      ; 6A5D   01FC
        CMPR    R1,     R1                      ; 6A5E   0149
        PULR    R7                              ; 6A5F   02B7

        PSHR    R5                              ; 6A60   0275
        MOVR    R7,     R5                      ; 6A61   00BD
        ADDI    #$009A, R5                      ; 6A62   02FD 009A
        MVII    #$031F, R4                      ; 6A64   02BC 031F
L_6A66:
        MVI@    R5,     R1                      ; 6A66   02A9
        SWAP    R1,     1                       ; 6A67   0041
        MVO@    R1,     R4                      ; 6A68   0261
        MVI@    R5,     R1                      ; 6A69   02A9
        SWAP    R1,     1                       ; 6A6A   0041
        MVO@    R1,     R4                      ; 6A6B   0261
        ADDI    #$0006, R4                      ; 6A6C   02FC 0006
        SDBD                                    ; 6A6E   0001
        CMPI    #$6B0C, R5                      ; 6A6F   037D 000C 006B
        BLT     L_6A66                          ; 6A72   0225 000D
        PULR    R7                              ; 6A74   02B7

L_6A75:
        PSHR    R5                              ; 6A75   0275
        SDBD                                    ; 6A76   0001
        MVII    #$08D8, R0                      ; 6A77   02B8 00D8 0008
        CLRR    R4                              ; 6A7A   01E4
L_6A7B:
        PSHR    R4                              ; 6A7B   0274
        PSHR    R0                              ; 6A7C   0270
        MVI     G_0169, R3                      ; 6A7D   0283 0169
        CMPR    R3,     R4                      ; 6A7F   015C
        BEQ     L_6AA4                          ; 6A80   0204 0022
        BGT     L_6A87                          ; 6A82   020E 0003

        XORR    R3,     R4                      ; 6A84   01DC
        XORR    R4,     R3                      ; 6A85   01E3
        XORR    R3,     R4                      ; 6A86   01DC
L_6A87:
        MOVR    R3,     R0                      ; 6A87   0098

        JSR     R5,     L_FDB3                  ; 6A88   0004 01FC 01B3
        DECLE   $02F9,  $0002,  $008D,  $0001   ; 6A8B   02F9 0002 008D 0001
        DECLE   $02A9,  $02F9,  $0006,  $0289   ; 6A8F   02A9 02F9 0006 0289
        DECLE   $00A0,  $0004                   ; 6A93   00A0 0004

        XORR    R7,     R4                      ; 6A95   01FC
        ADDR    R5,     R1                      ; 6A96   00E9
        ANDR    R1,     R2                      ; 6A97   018A
        BNEQ    L_6A9F                          ; 6A98   020C 0005

        MVII    #$0001, R3                      ; 6A9A   02BB 0001
        CLRR    R5                              ; 6A9C   01ED
        B       L_6AAD                          ; 6A9D   0200 000E

L_6A9F:
        MVII    #$0006, R3                      ; 6A9F   02BB 0006
        CLRR    R5                              ; 6AA1   01ED
        B       L_6AAD                          ; 6AA2   0200 0009

L_6AA4:
        SDBD                                    ; 6AA4   0001
        MVII    #$2000, R3                      ; 6AA5   02BB 0000 0020
        MOVR    R3,     R5                      ; 6AA8   009D
        SDBD                                    ; 6AA9   0001
        XORI    #$0606, R5                      ; 6AAA   03FD 0006 0006
L_6AAD:
        PULR    R0                              ; 6AAD   02B0
        XORR    R0,     R3                      ; 6AAE   01C3
        PULR    R1                              ; 6AAF   02B1
        MOVR    R1,     R2                      ; 6AB0   008A
        ADDR    R7,     R2                      ; 6AB1   00FA
        ADDI    #$0042, R2                      ; 6AB2   02FA 0042
        MVI@    R2,     R4                      ; 6AB4   0294
        MVO@    R3,     R4                      ; 6AB5   0263
        MVO@    R5,     R4                      ; 6AB6   0265
        ADDI    #$0008, R0                      ; 6AB7   02F8 0008
        INCR    R1                              ; 6AB9   0009
        MOVR    R1,     R4                      ; 6ABA   008C
        CMPI    #$0008, R4                      ; 6ABB   037C 0008
        BLT     L_6A7B                          ; 6ABD   0225 0043
        PULR    R7                              ; 6ABF   02B7

        PSHR    R5                              ; 6AC0   0275

        JSR     R5,     L_FE56                  ; 6AC1   0004 01FC 0256
        DECLE   $0004,  $01FC,  $00E9,  $0272   ; 6AC4   0004 01FC 00E9 0272
        DECLE   $0004                           ; 6AC8   0004

        XORR    R7,     R4                      ; 6AC9   01FC
        SUBR    R0,     R0                      ; 6ACA   0100

        JSR     R5,     .EXEC.76C               ; 6ACB   0004 0114 036C
        DECLE   $02F9,  $0002,  $0082,  $004A   ; 6ACE   02F9 0002 0082 004A
        DECLE   $00FA,  $02FA,  $0029,  $0094   ; 6AD2   00FA 02FA 0029 0094
        DECLE   $02A2,  $0042,  $024A,  $0009   ; 6AD6   02A2 0042 024A 0009
        DECLE   $02A2,  $0042,  $024A,  $02B2   ; 6ADA   02A2 0042 024A 02B2
        DECLE   $0004                           ; 6ADE   0004

        XORR    R7,     R4                      ; 6ADF   01FC
        SUBR    R4,     R7                      ; 6AE0   0127

        MVO     R0,     G_0169                  ; 6AE1   0240 0169

        JSR     R5,     L_6A75                  ; 6AE3   0004 0168 0275

        PULR    R7                              ; 6AE6   02B7

        SLL     R0,     2                       ; 6AE7   004C
L_6AE8:
        J       L_F760                          ; 6AE8   0004 03F4 0360

        CMPI    #$0020, R0                      ; 6AEB   0378 0020
        BEQ     L_6AF0                          ; 6AED   0204 0001
        MOVR    R5,     R7                      ; 6AEF   00AF

L_6AF0:
        CLRR    R0                              ; 6AF0   01C0
        DECR    R0                              ; 6AF1   0010
        B       L_6AE8                          ; 6AF2   0220 000B

        DECLE   $023E,  $0242,  $0246,  $024A   ; 6AF4   023E 0242 0246 024A
        DECLE   $027C,  $0280,  $0284,  $0288   ; 6AF8   027C 0280 0284 0288
        DECLE   $0018,  $0029,  $0038,  $0029   ; 6AFC   0018 0029 0038 0029
        DECLE   $0058,  $0029,  $0078,  $0029   ; 6B00   0058 0029 0078 0029
        DECLE   $0028,  $0041,  $0048,  $0041   ; 6B04   0028 0041 0048 0041
        DECLE   $0068,  $0041,  $0088,  $0041   ; 6B08   0068 0041 0088 0041
        DECLE   $02D9,  $0030,  $006B,  $002E   ; 6B0C   02D9 0030 006B 002E
        DECLE   $0051,  $0042,  $006B,  $0089   ; 6B10   0051 0042 006B 0089
        DECLE   $005F,  $02F4,  $0050,  $02F2   ; 6B14   005F 02F4 0050 02F2
        DECLE   $0217,  $0098,  $00DE,  $02F2   ; 6B18   0217 0098 00DE 02F2
        DECLE   $022E,  $00ED,  $00DE,  $02F3   ; 6B1C   022E 00ED 00DE 02F3
        DECLE   $0078,  $02F1,  $0004,  $01DC   ; 6B20   0078 02F1 0004 01DC
        DECLE   $01A3,  $00DF,  $006D,  $00FA   ; 6B24   01A3 00DF 006D 00FA
        DECLE   $006D,  $027B,  $0280,  $01A0   ; 6B28   006D 027B 0280 01A0
        DECLE   $0004                           ; 6B2C   0004

        XORR    R7,     R4                      ; 6B2D   01FC
        CMP@    R2,     R6                      ; 6B2E   0356
L_6B2F:
        PULR    R7                              ; 6B2F   02B7

        DECLE   $0275,  $0004                   ; 6B30   0275 0004

        XORR    R7,     R4                      ; 6B32   01FC
        CMP     .BTAB.40,R5                     ; 6B33   0345 0240
        ANDR    R4,     R0                      ; 6B35   01A0
        PULR    R7                              ; 6B36   02B7

        PSHR    R5                              ; 6B37   0275

        JSR     R5,     .EXEC.7B3               ; 6B38   0004 0114 03B3
        JSR     R5,     L_FCD2                  ; 6B3B   0004 01FC 00D2
        JSR     R5,     L_FE47                  ; 6B3E   0004 01FC 0247

        INCR    R7                              ; 6B41   000F

        PSHR    R5                              ; 6B42   0275
L_6B43:
        MVII    #$0004, R0                      ; 6B43   02B8 0004
        MVO     R0,     G_0176                  ; 6B45   0240 0176
        MVI     G_01A0, R5                      ; 6B47   0285 01A0
        ADDR    R5,     R5                      ; 6B49   00ED
        ADDR    R7,     R5                      ; 6B4A   00FD
        ADDI    #$0008, R5                      ; 6B4B   02FD 0008
        SDBD                                    ; 6B4D   0001
        MVI@    R5,     R4                      ; 6B4E   02AC

        JSR     R5,     L_5403                  ; 6B4F   0004 0154 0003

        PULR    R7                              ; 6B52   02B7

        DECLE   $0059,  $006B,  $0000,  $00F0   ; 6B53   0059 006B 0000 00F0
        DECLE   $0000,  $00A0,  $03DD,  $00F2   ; 6B57   0000 00A0 03DD 00F2
        DECLE   $006B,  $0037,  $006C,  $0019   ; 6B5B   006B 0037 006C 0019
        DECLE   $006A,  $0066,  $006C,  $00C0   ; 6B5F   006A 0066 006C 00C0
        DECLE   $006D,  $0000,  $02F4,  $0014   ; 6B63   006D 0000 02F4 0014
        DECLE   $02F5,  $0205,  $00A6           ; 6B67   02F5 0205 00A6

        INCR    R0                              ; 6B6A   0008
        SUBR    R4,     R7                      ; 6B6B   0127

        RSWD    R2                              ; 6B6C   003A
        ANDR    R1,     R5                      ; 6B6D   018D
        XOR     G_02F3, R0                      ; 6B6E   03C0 02F3
        DECR    R4                              ; 6B70   0014
        ADD@    R4,     R1                      ; 6B71   02E1
        CMP     G_007A, R5                      ; 6B72   0345 007A
        CMPR    R7,     R2                      ; 6B74   017A
        MOVR    R0,     R2                      ; 6B75   0082
        CMP@    R1,     R2                      ; 6B76   034A
        XOR     G_02F1, R0                      ; 6B77   03C0 02F1
        MVII    #$020D, R2                      ; 6B79   02BA 020D
        MVI@    R2,     R1                      ; 6B7B   0291
        XORI    #$0006, R1                      ; 6B7C   03F9 0006
        MVO@    R1,     R2                      ; 6B7E   0251
        INCR    R2                              ; 6B7F   000A
        MVI@    R2,     R1                      ; 6B80   0291
        XORI    #$0006, R1                      ; 6B81   03F9 0006
        MVO@    R1,     R2                      ; 6B83   0251
        MVI     .BTAB.E5,R1                     ; 6B84   0281 02E5
        SDBD                                    ; 6B86   0001
        XORI    #$1001, R1                      ; 6B87   03F9 0001 0010
        MVO     R1,     .BTAB.E5                ; 6B8A   0241 02E5
        MVII    #$031D, R4                      ; 6B8C   02BC 031D

        JSR     R5,     L_6118                  ; 6B8E   0004 0160 0118
        DECLE   $0000                           ; 6B91   0000
        BIDECLE $3146                           ; 6B92   0046 0031
L_6B94:
        JSR     R5,     L_6B9E                  ; 6B94   0004 0168 039E
L_6B97:
        JSR     R5,     L_6C05                  ; 6B97   0004 016C 0005
        JSR     R5,     L_6C4E                  ; 6B9A   0004 016C 004E

        PULR    R7                              ; 6B9D   02B7

L_6B9E:
        PSHR    R5                              ; 6B9E   0275

        JSR     R5,     L_6DA4                  ; 6B9F   0004 016C 01A4

        MOVR    R1,     R0                      ; 6BA2   0088
        ADDR    R0,     R0                      ; 6BA3   00C0
        PSHR    R0                              ; 6BA4   0270
        SLL     R0,     2                       ; 6BA5   004C
        ADD@    R6,     R0                      ; 6BA6   02F0
        ADDR    R1,     R0                      ; 6BA7   00C8
        ADDR    R7,     R0                      ; 6BA8   00F8
        ADDI    #$01DA, R0                      ; 6BA9   02F8 01DA

        JSR     R5,     L_FE15                  ; 6BAB   0004 01FC 0215

        MVII    #$003C, R0                      ; 6BAE   02B8 003C
        MVII    #$02A0, R4                      ; 6BB0   02BC 02A0

        JSR     R5,     X_FILL_ZERO             ; 6BB2   0004 0114 0338

        SDBD                                    ; 6BB5   0001
        MVII    #$0873, R0                      ; 6BB6   02B8 0073 0008
        MOVR    R0,     R3                      ; 6BB9   0083
        ADDI    #$0008, R3                      ; 6BBA   02FB 0008
        MVII    #$022B, R4                      ; 6BBC   02BC 022B
        MVII    #$02B2, R2                      ; 6BBE   02BA 02B2
        ANDI    #$0002, R1                      ; 6BC0   03B9 0002
        BEQ     L_6BC6                          ; 6BC2   0204 0002

        MVII    #$0276, R2                      ; 6BC4   02BA 0276

L_6BC6:
        JSR     R5,     L_6BDD                  ; 6BC6   0004 0168 03DD

        MOVR    R3,     R0                      ; 6BC9   0098
        ADDI    #$0014, R2                      ; 6BCA   02FA 0014
        MVII    #$023F, R4                      ; 6BCC   02BC 023F

        JSR     R5,     L_6BDD                  ; 6BCE   0004 0168 03DD

        SDBD                                    ; 6BD1   0001
        MVII    #$0661, R0                      ; 6BD2   02B8 0061 0006
        ADDI    #$0014, R2                      ; 6BD5   02FA 0014
        MVII    #$0253, R4                      ; 6BD7   02BC 0253

        JSR     R5,     L_6BDD                  ; 6BD9   0004 0168 03DD

        PULR    R7                              ; 6BDC   02B7

L_6BDD:
        MVII    #$0008, R1                      ; 6BDD   02B9 0008
L_6BDF:
        MVO@    R0,     R4                      ; 6BDF   0260
        INCR    R4                              ; 6BE0   000C
        SDBD                                    ; 6BE1   0001
        CMPI    #$0800, R0                      ; 6BE2   0378 0000 0008
        BLT     L_6BE9                          ; 6BE5   0205 0002

        ADDI    #$0010, R0                      ; 6BE7   02F8 0010
L_6BE9:
        DECR    R1                              ; 6BE9   0011
        BNEQ    L_6BDF                          ; 6BEA   022C 000C

        ADDI    #$002C, R4                      ; 6BEC   02FC 002C
        CMPR    R2,     R4                      ; 6BEE   0154
        BLT     L_6BDD                          ; 6BEF   0225 0013
        MOVR    R5,     R7                      ; 6BF1   00AF

        PSHR    R5                              ; 6BF2   0275
        DECR    R0                              ; 6BF3   0010
        BMI     L_6B2F                          ; 6BF4   022B 00C6

        CMPI    #$0002, R0                      ; 6BF6   0378 0002
        BGT     L_6B2F                          ; 6BF8   022E 00CA

        JSR     R5,     L_6DA4                  ; 6BFA   0004 016C 01A4

        CMPR    R1,     R0                      ; 6BFD   0148
        BEQ     L_6B2F                          ; 6BFE   0224 00D0

        JSR     R5,     L_6DAD                  ; 6C00   0004 016C 01AD

        B       L_6B94                          ; 6C03   0220 0070

L_6C05:
        PSHR    R5                              ; 6C05   0275

        JSR     R5,     L_6C16                  ; 6C06   0004 016C 0016

        MOVR    R2,     R1                      ; 6C09   0091
        MVII    #$000A, R2                      ; 6C0A   02BA 000A

        JSR     R5,     X_DIV                   ; 6C0C   0004 011C 01FB
        JSR     R5,     L_617F                  ; 6C0F   0004 0160 017F

        SLR     R0,     1                       ; 6C12   0060
        MVO     R0,     .STIC.VIDEN             ; 6C13   0240 0020
        PULR    R7                              ; 6C15   02B7

L_6C16:
        PSHR    R5                              ; 6C16   0275

        JSR     R5,     L_6DA4                  ; 6C17   0004 016C 01A4

        INCR    R2                              ; 6C1A   000A
        CMPI    #$0001, R1                      ; 6C1B   0379 0001
        BLT     L_6C25                          ; 6C1D   0205 0006
        BEQ     L_6C23                          ; 6C1F   0204 0002

        ADDI    #$0018, R2                      ; 6C21   02FA 0018
L_6C23:
        ADDI    #$0018, R2                      ; 6C23   02FA 0018
L_6C25:
        CMPI    #$0040, R2                      ; 6C25   037A 0040
        BLE     L_6B2F                          ; 6C27   0226 00F9

        SUBI    #$0008, R2                      ; 6C29   033A 0008
        PSHR    R2                              ; 6C2B   0272

        JSR     R5,     L_6DA4                  ; 6C2C   0004 016C 01A4

        SUBI    #$0008, R2                      ; 6C2F   033A 0008
        MOVR    R2,     R0                      ; 6C31   0090

        JSR     R5,     L_6DB8                  ; 6C32   0004 016C 01B8

        PULR    R2                              ; 6C35   02B2
        PULR    R7                              ; 6C36   02B7

        PSHR    R5                              ; 6C37   0275

        JSR     R5,     L_6DA4                  ; 6C38   0004 016C 01A4

        MVII    #$0018, R4                      ; 6C3B   02BC 0018
        CMPI    #$0002, R1                      ; 6C3D   0379 0002
        BNEQ    L_6C43                          ; 6C3F   020C 0002

        MVII    #$0010, R4                      ; 6C41   02BC 0010
L_6C43:
        MVII    #$0008, R3                      ; 6C43   02BB 0008
        DECLE   $0004,  $01FC,  $0226           ; 6C45   0004 01FC 0226

        MOVR    R2,     R0                      ; 6C48   0090

        JSR     R5,     L_6DB8                  ; 6C49   0004 016C 01B8

        B       L_6B97                          ; 6C4C   0220 00B6

L_6C4E:
        PSHR    R5                              ; 6C4E   0275

        JSR     R5,     L_6DA4                  ; 6C4F   0004 016C 01A4

        MOVR    R2,     R1                      ; 6C52   0091
        ANDI    #$0007, R1                      ; 6C53   03B9 0007
        XORR    R1,     R2                      ; 6C55   01CA
        SLL     R1,     2                       ; 6C56   004D
        SLL     R1,     2                       ; 6C57   004D
        PSHR    R2                              ; 6C58   0272
        SLL     R2,     1                       ; 6C59   004A
        ADD@    R6,     R2                      ; 6C5A   02F2
        ADDI    #$001E, R1                      ; 6C5B   02F9 001E
        SWAP    R1,     1                       ; 6C5D   0041
        ADDI    #$0016, R2                      ; 6C5E   02FA 0016
        SWAP    R2,     1                       ; 6C60   0042
        MVO     R1,     G_031F                  ; 6C61   0241 031F
        MVO     R2,     G_0320                  ; 6C63   0242 0320
        PULR    R7                              ; 6C65   02B7

        PSHR    R5                              ; 6C66   0275
        MVII    #$0005, R0                      ; 6C67   02B8 0005
        MVO     R0,     G_017B                  ; 6C69   0240 017B

        JSR     R5,     L_5401                  ; 6C6B   0004 0154 0001
        BIDECLE $6C71                           ; 6C6E   0071 006C

        PULR    R7                              ; 6C70   02B7

        DECLE   $03DF,  $001E,  $005A,  $005F   ; 6C71   03DF 001E 005A 005F
        DECLE   $0063,  $00CE,  $0062,  $0037   ; 6C75   0063 00CE 0062 0037
        DECLE   $006B,  $006E,  $005A,  $0089   ; 6C79   006B 006E 005A 0089
        DECLE   $005F,  $0001,  $02F6,  $00C0   ; 6C7D   005F 0001 02F6 00C0
        DECLE   $0063,  $0202,  $01E8           ; 6C81   0063 0202 01E8

        RLC     R3,     1                       ; 6C84   0053
        XOR@    R1,     R3                      ; 6C85   03CB
        XOR     G_02F1, R0                      ; 6C86   03C0 02F1
        MVII    #$0003, R0                      ; 6C88   02B8 0003
        MVO     R0,     G_0176                  ; 6C8A   0240 0176
        MVII    #$0001, R0                      ; 6C8C   02B8 0001
        MVO     R0,     G_017B                  ; 6C8E   0240 017B
        MVI     G_0164, R0                      ; 6C90   0280 0164
        ANDI    #$00FD, R0                      ; 6C92   03B8 00FD
        MVO     R0,     G_0164                  ; 6C94   0240 0164
        MVII    #$0008, R0                      ; 6C96   02B8 0008
        MVO     R0,     G_0174                  ; 6C98   0240 0174

        JSR     R5,     L_6C16                  ; 6C9A   0004 016C 0016
        DECLE   $0012,  $004A,  $02B8,  $0001   ; 6C9D   0012 004A 02B8 0001
        DECLE   $0240,  $01A2,  $0242,  $01A3   ; 6CA1   0240 01A2 0242 01A3
        DECLE   $02B8,  $0004,  $00B9,  $02F9   ; 6CA5   02B8 0004 00B9 02F9
        DECLE   $015D,  $02BA,  $0325,  $0004   ; 6CA9   015D 02BA 0325 0004

        XORR    R6,     R4                      ; 6CAD   01F4
        CMP@    R2,     R3                      ; 6CAE   0353

        JSR     R5,     L_6CCE                  ; 6CAF   0004 016C 00CE
        JSR     R5,     L_6255                  ; 6CB2   0004 0160 0255
L_6CB5:
        JSR     R5,     L_6CDA                  ; 6CB5   0004 016C 00DA

        MVII    #$031D, R4                      ; 6CB8   02BC 031D

        JSR     R5,     L_6118                  ; 6CBA   0004 0160 0118
        DECLE   $0003                           ; 6CBD   0003
        BIDECLE $0082                           ; 6CBE   0082 0000

        JSR     R5,     L_633C                  ; 6CC0   0004 0160 033C
        JSR     R5,     L_5A2E                  ; 6CC3   0004 0158 022E
        JSR     R5,     L_FE13                  ; 6CC6   0004 01FC 0213

        ADDR    R7,     R2                      ; 6CC9   00FA
        SAR     R1,     2                       ; 6CCA   006D
        MVO     R0,     .STIC.VIDEN             ; 6CCB   0240 0020
        PULR    R7                              ; 6CCD   02B7

L_6CCE:
        PSHR    R5                              ; 6CCE   0275

        JSR     R5,     L_6C16                  ; 6CCF   0004 016C 0016
        DECLE   $0090,  $02BB,  $0007,  $0004   ; 6CD2   0090 02BB 0007 0004
        DECLE   $01DC,  $0260,  $0207           ; 6CD6   01DC 0260 0207

        PULR    R7                              ; 6CD9   02B7

L_6CDA:
        PSHR    R5                              ; 6CDA   0275

        JSR     R5,     L_6C16                  ; 6CDB   0004 016C 0016

L_6CDE:
        DECR    R2                              ; 6CDE   0012
        SLL     R2,     2                       ; 6CDF   004E
        SLL     R2,     2                       ; 6CE0   004E
        SDBD                                    ; 6CE1   0001
        ADDI    #$4085, R2                      ; 6CE2   02FA 0085 0040
        MOVR    R2,     R5                      ; 6CE5   0095
        MVII    #$023E, R4                      ; 6CE6   02BC 023E
L_6CE8:
        SDBD                                    ; 6CE8   0001
        MVII    #$0940, R0                      ; 6CE9   02B8 0040 0009
        MOVR    R0,     R1                      ; 6CEC   0081
        XORI    #$0003, R1                      ; 6CED   03F9 0003
        MVII    #$0008, R2                      ; 6CEF   02BA 0008
        MVI@    R5,     R3                      ; 6CF1   02AB
        SWAP    R3,     1                       ; 6CF2   0043
L_6CF3:
        SLLC    R3,     1                       ; 6CF3   005B
        BNC     L_6CF8                          ; 6CF4   0209 0002

        MVO@    R1,     R4                      ; 6CF6   0261
        INCR    R7                              ; 6CF7   000F

L_6CF8:
        MVO@    R0,     R4                      ; 6CF8   0260
L_6CF9:
        DECR    R2                              ; 6CF9   0012
        BNEQ    L_6CF3                          ; 6CFA   022C 0008

        MVII    #$0008, R2                      ; 6CFC   02BA 0008
        SUBR    R2,     R4                      ; 6CFE   0114
        MVI@    R5,     R3                      ; 6CFF   02AB
        SWAP    R3,     1                       ; 6D00   0043
L_6D01:
        MVI@    R4,     R0                      ; 6D01   02A0
        SLLC    R3,     1                       ; 6D02   005B
        BNC     L_6D0B                          ; 6D03   0209 0006

        SDBD                                    ; 6D05   0001
        XORI    #$0600, R0                      ; 6D06   03F8 0000 0006
        DECR    R4                              ; 6D09   0014
        MVO@    R0,     R4                      ; 6D0A   0260
L_6D0B:
        DECR    R2                              ; 6D0B   0012
        BNEQ    L_6D01                          ; 6D0C   022C 000C

        CMPI    #$02D1, R4                      ; 6D0E   037C 02D1
        BGT     L_6B2F                          ; 6D10   022E 01E2

        ADDI    #$000C, R4                      ; 6D12   02FC 000C
        B       L_6CE8                          ; 6D14   0220 002D

        DECLE   $0275,  $0280,  $0137,  $0080   ; 6D16   0275 0280 0137 0080
        DECLE   $0204,  $002A,  $0378,  $000F   ; 6D1A   0204 002A 0378 000F
        DECLE   $020E,  $002A,  $0282,  $0324   ; 6D1E   020E 002A 0282 0324
        DECLE   $0010,  $00C2,  $037A,  $003F   ; 6D22   0010 00C2 037A 003F
        DECLE   $020E,  $0022,  $0242,  $0137   ; 6D26   020E 0022 0242 0137
        DECLE   $0004,  $01FC,  $0208,  $017D   ; 6D2A   0004 01FC 0208 017D
        DECLE   $0000,  $0000,  $0185,  $004E   ; 6D2E   0000 0000 0185 004E
        DECLE   $006D,  $0000                   ; 6D32   006D 0000

        JSR     R5,     L_DE28                  ; 6D34   0004 01DC 0228

        XORI    #$0006, R3                      ; 6D37   03FB 0006
        MVI     G_0138, R1                      ; 6D39   0281 0138
        ADDI    #$0200, R1                      ; 6D3B   02F9 0200
        MVI@    R1,     R0                      ; 6D3D   0288
        XORR    R3,     R0                      ; 6D3E   01D8
        MVO@    R0,     R1                      ; 6D3F   0248
        INCR    R1                              ; 6D40   0009
        MVI@    R1,     R0                      ; 6D41   0288
        XORR    R3,     R0                      ; 6D42   01D8
        MVO@    R0,     R1                      ; 6D43   0248
        B       L_6D4F                          ; 6D44   0200 0009

        JSR     R5,     L_5C63                  ; 6D46   0004 015C 0063

        PULR    R7                              ; 6D49   02B7

        JSR     R5,     L_FDF8                  ; 6D4A   0004 01FC 01F8

        PULR    R7                              ; 6D4D   02B7

        PSHR    R5                              ; 6D4E   0275

L_6D4F:
        JSR     R5,     L_6C16                  ; 6D4F   0004 016C 0016

        DECR    R2                              ; 6D52   0012
        MVII    #$0001, R0                      ; 6D53   02B8 0001
        MVI     G_0178, R1                      ; 6D55   0281 0178
        TSTR    R1                              ; 6D57   0089
        BEQ     L_6D5B                          ; 6D58   0204 0001

        NEGR    R0                              ; 6D5A   0020
L_6D5B:
        MVI     G_0324, R3                      ; 6D5B   0283 0324
        MVI     G_0137, R4                      ; 6D5D   0284 0137
        ADDR    R0,     R2                      ; 6D5F   00C2
        BMI     L_6D7E                          ; 6D60   020B 001C

        CMPR    R3,     R2                      ; 6D62   015A
        BLT     L_6D7E                          ; 6D63   0205 0019

        CMPR    R4,     R2                      ; 6D65   0162
        BGT     L_6D80                          ; 6D66   020E 0018

L_6D68:
        MOVR    R2,     R1                      ; 6D68   0091
        SLL     R2,     1                       ; 6D69   004A
        MVO     R2,     G_01A3                  ; 6D6A   0242 01A3
        MVII    #$0018, R2                      ; 6D6C   02BA 0018

        JSR     R5,     X_DIV                   ; 6D6E   0004 011C 01FB

        SLL     R0,     2                       ; 6D71   004C
        SLL     R0,     2                       ; 6D72   004C
        SLL     R0,     1                       ; 6D73   0048
        XORR    R0,     R1                      ; 6D74   01C1
        MVO     R1,     G_01A1                  ; 6D75   0241 01A1

        JSR     R5,     L_6CCE                  ; 6D77   0004 016C 00CE
        JSR     R5,     L_6CDA                  ; 6D7A   0004 016C 00DA

        PULR    R7                              ; 6D7D   02B7

L_6D7E:
        MOVR    R4,     R2                      ; 6D7E   00A2
        INCR    R7                              ; 6D7F   000F

L_6D80:
        MOVR    R3,     R2                      ; 6D80   009A
L_6D81:
        B       L_6D68                          ; 6D81   0220 001A

        DECLE   $0001,  $0006,  $0056,  $0058   ; 6D83   0001 0006 0056 0058
        DECLE   $0038,  $0030,  $0085,  $0040   ; 6D87   0038 0030 0085 0040
        DECLE   $0070,  $0038,  $0000,  $0001   ; 6D8B   0070 0038 0000 0001
        DECLE   $000E,  $0056,  $0058,  $0038   ; 6D8F   000E 0056 0058 0038
        DECLE   $0030,  $0005,  $0042,  $0070   ; 6D93   0030 0005 0042 0070
        DECLE   $0038,  $0000,  $0001,  $0016   ; 6D97   0038 0000 0001 0016
        DECLE   $0056,  $0058,  $0038,  $0020   ; 6D9B   0056 0058 0038 0020
        DECLE   $0085,  $0043,  $0070,  $0038   ; 6D9F   0085 0043 0070 0038
        DECLE   $0000                           ; 6DA3   0000
L_6DA4:
        MVI     G_01A1, R1                      ; 6DA4   0281 01A1
        MOVR    R1,     R2                      ; 6DA6   008A
        ANDI    #$001F, R2                      ; 6DA7   03BA 001F
        SLR     R1,     2                       ; 6DA9   0065
        SLR     R1,     2                       ; 6DAA   0065
        SLR     R1,     1                       ; 6DAB   0061
        MOVR    R5,     R7                      ; 6DAC   00AF

L_6DAD:
        MVI     G_01A1, R1                      ; 6DAD   0281 01A1
        ANDI    #$001F, R1                      ; 6DAF   03B9 001F
        SLL     R0,     2                       ; 6DB1   004C
        SLL     R0,     2                       ; 6DB2   004C
        SLL     R0,     1                       ; 6DB3   0048
        XORR    R0,     R1                      ; 6DB4   01C1
        MVO     R1,     G_01A1                  ; 6DB5   0241 01A1
        MOVR    R5,     R7                      ; 6DB7   00AF

L_6DB8:
        MVI     G_01A1, R1                      ; 6DB8   0281 01A1
        ANDI    #$00E0, R1                      ; 6DBA   03B9 00E0
        XORR    R0,     R1                      ; 6DBC   01C1
        MVO     R1,     G_01A1                  ; 6DBD   0241 01A1
        MOVR    R5,     R7                      ; 6DBF   00AF

        DECLE   $0001,  $003E,  $0055,  $0000   ; 6DC0   0001 003E 0055 0000
        DECLE   $0038,  $0003,  $004E,  $0055   ; 6DC4   0038 0003 004E 0055
        DECLE   $0008,  $0038,  $0004,  $009E   ; 6DC8   0008 0038 0004 009E
        DECLE   $0055,  $0020,  $0038,  $0001   ; 6DCC   0055 0020 0038 0001
        DECLE   $006E,  $0055,  $0030,  $0038   ; 6DD0   006E 0055 0030 0038
        DECLE   $0002,  $00C6,  $0055,  $0040   ; 6DD4   0002 00C6 0055 0040
        DECLE   $0038,  $0001,  $0016,  $0056   ; 6DD8   0038 0001 0016 0056
        DECLE   $0050,  $0038,  $0000,  $02CE   ; 6DDC   0050 0038 0000 02CE
        DECLE   $022A,  $034E,  $01BA,  $01E8   ; 6DE0   022A 034E 01BA 01E8
        DECLE   $0053,  $0291,  $0092,  $039E   ; 6DE4   0053 0291 0092 039E
        DECLE   $0000,  $0064,  $00A8,  $01A4   ; 6DE8   0000 0064 00A8 01A4
        DECLE   $034E,  $0029,  $0082,  $027C   ; 6DEC   034E 0029 0082 027C
        DECLE   $03C0,  $01E8,  $0053,  $0291   ; 6DF0   03C0 01E8 0053 0291
        DECLE   $009A,  $0168,  $0031,  $0011   ; 6DF4   009A 0168 0031 0011
        DECLE   $031C,  $03C0,  $0001,  $0000   ; 6DF8   031C 03C0 0001 0000
        DECLE   $0036,  $0028,  $0039,  $0001   ; 6DFC   0036 0028 0039 0001
        DECLE   $0016,  $005A,  $0040,  $0039   ; 6E00   0016 005A 0040 0039
        DECLE   $0000                           ; 6E04   0000

        INCR    R7                              ; 6E05   000F

        SWAP    R3,     1                       ; 6E06   0043
L_6E07:
        DECR    R0                              ; 6E07   0010
        DECLE   $009E,  $0001                   ; 6E08   009E 0001

        SLLC    R0,     1                       ; 6E0A   0058
        INCR    R0                              ; 6E0B   0008
        INCR    R7                              ; 6E0C   000F

        SWAP    R3,     1                       ; 6E0D   0043
L_6E0E:
        GSWD    R0                              ; 6E0E   0030
        DECLE   $009E,  $0001                   ; 6E0F   009E 0001

        SAR     R0,     1                       ; 6E11   0068
        INCR    R0                              ; 6E12   0008
        INCR    R7                              ; 6E13   000F

        ADDR    R0,     R3                      ; 6E14   00C3
L_6E15:
        DECR    R0                              ; 6E15   0010
        DECLE   $009E,  $0001                   ; 6E16   009E 0001

        TSTR    R0                              ; 6E18   0080
        INCR    R0                              ; 6E19   0008
        INCR    R7                              ; 6E1A   000F

        ADDR    R0,     R3                      ; 6E1B   00C3
L_6E1C:
        GSWD    R0                              ; 6E1C   0030
        DECLE   $009E,  $0001,  $0090,  $0008   ; 6E1D   009E 0001 0090 0008
        DECLE   $025D,  $0062,  $006E,  $005C   ; 6E21   025D 0062 006E 005C
        DECLE   $006E,  $002E,  $0051,  $0000   ; 6E25   006E 002E 0051 0000
        DECLE   $00D0,  $02F4,  $0028,  $0201   ; 6E29   00D0 02F4 0028 0201

        MVO     R4,     .BTAB.7A                ; 6E2D   0244 027A
        SLL     R2,     2                       ; 6E2F   004E
        CMPR    R5,     R3                      ; 6E30   016B
        SUBR    R2,     R2                      ; 6E31   0112
        SUBR    R1,     R6                      ; 6E32   010E
        ANDR    R6,     R2                      ; 6E33   01B2
        CMP     G_01D1, R5                      ; 6E34   0345 01D1
        AND@    R3,     R2                      ; 6E36   039A
        CMP@    R3,     R2                      ; 6E37   035A
        CMP@    R3,     R2                      ; 6E38   035A
        XORR    R0,     R1                      ; 6E39   01C1
        SUBR    R4,     R4                      ; 6E3A   0124
        RLC     R3,     1                       ; 6E3B   0053
        XOR     G_02F5, R0                      ; 6E3C   03C0 02F5
        ADD@    R6,     R7                      ; 6E3E   02F7

        DECLE   $000E,  $02F2,  $02CA,  $0089   ; 6E3F   000E 02F2 02CA 0089
        DECLE   $00DE,  $02F1,  $0004           ; 6E43   00DE 02F1 0004

        XORR    R7,     R4                      ; 6E46   01FC
        CMPR    R1,     R1                      ; 6E47   0149

L_6E48:
        JSR     R5,     L_DE43                  ; 6E48   0004 01DC 0243

        BC      L_6E48                          ; 6E4B   0221 0004

        CMPR    R5,     R0                      ; 6E4D   0168
        PSHR    R5                              ; 6E4E   0275
        MVI     G_0169, R1                      ; 6E4F   0281 0169
        MVI     G_016B, R0                      ; 6E51   0280 016B
        CMPR    R0,     R1                      ; 6E53   0141
        BNEQ    L_6E59                          ; 6E54   020C 0003

        INCR    R0                              ; 6E56   0008
        ANDI    #$0007, R0                      ; 6E57   03B8 0007
L_6E59:
        INCR    R0                              ; 6E59   0008
        B       L_6E63                          ; 6E5A   0200 0007

        PSHR    R5                              ; 6E5C   0275

        JSR     R5,     L_6A20                  ; 6E5D   0004 0168 0220

        B       L_6E48                          ; 6E60   0220 0019

        PSHR    R5                              ; 6E62   0275

L_6E63:
        JSR     R5,     L_FE56                  ; 6E63   0004 01FC 0256

        MVI     G_0169, R2                      ; 6E66   0282 0169
        CMPR    R0,     R2                      ; 6E68   0142
        BEQ     L_6EB0                          ; 6E69   0204 0045

        MVO     R0,     G_016B                  ; 6E6B   0240 016B
        BGT     L_6E72                          ; 6E6D   020E 0003

        XORR    R0,     R2                      ; 6E6F   01C2
        XORR    R2,     R0                      ; 6E70   01D0
        XORR    R0,     R2                      ; 6E71   01C2

L_6E72:
        JSR     R5,     .EXEC.76C               ; 6E72   0004 0114 036C

        INCR    R1                              ; 6E75   0009
        MVI@    R1,     R1                      ; 6E76   0289
        ADDI    #$0006, R1                      ; 6E77   02F9 0006
        MVI@    R1,     R3                      ; 6E79   028B
        MOVR    R2,     R5                      ; 6E7A   0095
        SUBR    R0,     R2                      ; 6E7B   0102
        DECR    R2                              ; 6E7C   0012
        SLL     R2,     1                       ; 6E7D   004A
        INCR    R1                              ; 6E7E   0009
        ADDR    R1,     R2                      ; 6E7F   00CA
        MVO     R2,     G_016C                  ; 6E80   0242 016C
        SWAP    R2,     1                       ; 6E82   0042
        MVO     R2,     G_016D                  ; 6E83   0242 016D
        MVII    #$02DC, R4                      ; 6E85   02BC 02DC
        MVII    #$0014, R0                      ; 6E87   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 6E89   0004 0114 0338
        JSR     R5,     L_D059                  ; 6E8C   0004 01D0 0059

        SLL     R0,     1                       ; 6E8F   0048
        SDBD                                    ; 6E90   0001
        ADDI    #$D046, R0                      ; 6E91   02F8 0046 00D0
        MOVR    R0,     R5                      ; 6E94   0085
        SDBD                                    ; 6E95   0001
        MVI@    R5,     R1                      ; 6E96   02A9
        MVII    #$02DE, R4                      ; 6E97   02BC 02DE

        JSR     R5,     L_DDDA                  ; 6E99   0004 01DC 01DA
        DECLE   $0004                           ; 6E9C   0004

        XORR    R2,     R0                      ; 6E9D   01D0
        MVO@    R7,     R2                      ; 6E9E   0257
        MOVR    R3,     R2                      ; 6E9F   009A
        MVII    #$02D2, R4                      ; 6EA0   02BC 02D2
        INCR    R0                              ; 6EA2   0008
        MVII    #$0007, R3                      ; 6EA3   02BB 0007

        JSR     R5,     L_DE38                  ; 6EA5   0004 01DC 0238

        MOVR    R2,     R0                      ; 6EA8   0090
        INCR    R0                              ; 6EA9   0008
        ADDI    #$0005, R4                      ; 6EAA   02FC 0005

        JSR     R5,     L_DE38                  ; 6EAC   0004 01DC 0238

        PULR    R7                              ; 6EAF   02B7

L_6EB0:
        JSR     R5,     X_PLAY_RAZZ2            ; 6EB0   0004 011C 02BD

        PULR    R7                              ; 6EB3   02B7

        PSHR    R5                              ; 6EB4   0275
        MVI     G_01AD, R0                      ; 6EB5   0280 01AD
        ANDI    #$0080, R0                      ; 6EB7   03B8 0080
        BNEQ    L_6F4E                          ; 6EB9   020C 0093

        MVI     G_01AF, R0                      ; 6EBB   0280 01AF

        JSR     R5,     L_FE74                  ; 6EBD   0004 01FC 0274

        BNEQ    L_6F4E                          ; 6EC0   020C 008C

        CLRR    R0                              ; 6EC2   01C0
L_6EC3:
        MVO     R0,     G_01B2                  ; 6EC3   0240 01B2
        CMP     G_01AF, R0                      ; 6EC5   0340 01AF
        BEQ     L_6F47                          ; 6EC7   0204 007E

        CMP     G_01B8, R0                      ; 6EC9   0340 01B8
        BEQ     L_6F47                          ; 6ECB   0204 007A

        MVI     G_01B0, R1                      ; 6ECD   0281 01B0
        TSTR    R1                              ; 6ECF   0089
        BEQ     L_6ED5                          ; 6ED0   0204 0003

        CMPR    R0,     R1                      ; 6ED2   0141
        BEQ     L_6F47                          ; 6ED3   0204 0072

L_6ED5:
        JSR     R5,     L_FE74                  ; 6ED5   0004 01FC 0274

        BNEQ    L_6F47                          ; 6ED8   020C 006D

        MOVR    R0,     R1                      ; 6EDA   0081
        SDBD                                    ; 6EDB   0001
        ADDI    #$8AC1, R1                      ; 6EDC   02F9 00C1 008A
        MVI@    R1,     R1                      ; 6EDF   0289
        TSTR    R1                              ; 6EE0   0089
        BEQ     L_6F47                          ; 6EE1   0204 0064

        CLRR    R3                              ; 6EE3   01DB
        MOVR    R0,     R1                      ; 6EE4   0081
        SLL     R1,     1                       ; 6EE5   0049
        SDBD                                    ; 6EE6   0001
        ADDI    #$8AD9, R1                      ; 6EE7   02F9 00D9 008A
        INCR    R1                              ; 6EEA   0009
        MVI@    R1,     R2                      ; 6EEB   028A
        DECR    R2                              ; 6EEC   0012
        BMI     L_6EF3                          ; 6EED   020B 0004

        MVO@    R2,     R1                      ; 6EEF   024A
        BNEQ    L_6F47                          ; 6EF0   020C 0055

        INCR    R3                              ; 6EF2   000B
L_6EF3:
        DECR    R1                              ; 6EF3   0011
        MVI@    R1,     R2                      ; 6EF4   028A
        INCR    R1                              ; 6EF5   0009
        MVO@    R2,     R1                      ; 6EF6   024A
        TSTR    R3                              ; 6EF7   009B
        BEQ     L_6F47                          ; 6EF8   0204 004D

        JSR     R5,     .EXEC.76C               ; 6EFA   0004 0114 036C

        MOVR    R1,     R4                      ; 6EFD   008C
        ADDI    #$0002, R4                      ; 6EFE   02FC 0002
        MVI@    R4,     R2                      ; 6F00   02A2
        MVI@    R4,     R3                      ; 6F01   02A3
        SWAP    R2,     1                       ; 6F02   0042
        SWAP    R3,     1                       ; 6F03   0043
        MVI     G_01AF, R0                      ; 6F04   0280 01AF

        JSR     R5,     .EXEC.76C               ; 6F06   0004 0114 036C

        ADDI    #$0002, R1                      ; 6F09   02F9 0002
        MVI@    R1,     R0                      ; 6F0B   0288
        INCR    R1                              ; 6F0C   0009
        MVI@    R1,     R1                      ; 6F0D   0289
        SWAP    R0,     1                       ; 6F0E   0040
        SWAP    R1,     1                       ; 6F0F   0041
        MVII    #$00FF, R5                      ; 6F10   02BD 00FF
        ANDR    R5,     R0                      ; 6F12   01A8
        ANDR    R5,     R1                      ; 6F13   01A9
        ANDR    R5,     R2                      ; 6F14   01AA
        ANDR    R5,     R3                      ; 6F15   01AB
        SUBR    R2,     R0                      ; 6F16   0110
        SUBR    R3,     R1                      ; 6F17   0119

        JSR     R5,     .EXEC.A2F               ; 6F18   0004 0118 022F

        MVI     G_01B2, R2                      ; 6F1B   0282 01B2
        MOVR    R2,     R3                      ; 6F1D   0093
        SDBD                                    ; 6F1E   0001
        ADDI    #$8AC1, R3                      ; 6F1F   02FB 00C1 008A
        MVI@    R3,     R3                      ; 6F22   029B
        DECR    R3                              ; 6F23   0013
        BEQ     L_6F2A                          ; 6F24   0204 0004

        ADDI    #$0004, R1                      ; 6F26   02F9 0004
        ANDI    #$000F, R1                      ; 6F28   03B9 000F
L_6F2A:
        SLL     R2,     1                       ; 6F2A   004A
        SDBD                                    ; 6F2B   0001
        ADDI    #$8ACA, R2                      ; 6F2C   02FA 00CA 008A
        MVI@    R2,     R0                      ; 6F2F   0290

        JSR     R5,     .EXEC.629               ; 6F30   0004 0114 0229

        MVO@    R0,     R4                      ; 6F33   0260
        SUBI    #$0005, R4                      ; 6F34   033C 0005
        MVI@    R4,     R1                      ; 6F36   02A1
        SWAP    R0,     1                       ; 6F37   0040
        ANDI    #$00FF, R0                      ; 6F38   03B8 00FF
        BEQ     L_6F47                          ; 6F3A   0204 000B

        SDBD                                    ; 6F3C   0001
        ANDI    #$FDFF, R1                      ; 6F3D   03B9 00FF 00FD
        SWAP    R0,     2                       ; 6F40   0044
        BPL     L_6F45                          ; 6F41   0203 0002

        XORI    #$0200, R1                      ; 6F43   03F9 0200
L_6F45:
        DECR    R4                              ; 6F45   0014
        MVO@    R1,     R4                      ; 6F46   0261
L_6F47:
        MVI     G_01B2, R0                      ; 6F47   0280 01B2
        INCR    R0                              ; 6F49   0008
        CMPI    #$0008, R0                      ; 6F4A   0378 0008
        BLT     L_6EC3                          ; 6F4C   0225 008A
L_6F4E:
        PULR    R7                              ; 6F4E   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCF   0000 0000 0000 0000
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

        ORG     $D000

        COMR    R6                              ; D000   001E
        ADDR    R5,     R3                      ; D001   00EB
        SAR     R2,     1                       ; D002   006A
        ADDR    R4,     R7                      ; D003   00E7

        SAR     R2,     1                       ; D004   006A
        INCR    R7                              ; D005   000F

        MOVR    R2,     R0                      ; D006   0090
L_D007:
        INCR    R7                              ; D007   000F

        MOVR    R2,     R0                      ; D008   0090
L_D009:
        ADD@    R6,     R1                      ; D009   02F1
        MOVR    R7,     R0                      ; D00A   00B8
        ADDI    #$002B, R0                      ; D00B   02F8 002B
        B       L_D01B                          ; D00D   0200 000C

        MVII    #$0080, R0                      ; D00F   02B8 0080
        MVO     R0,     G_0102                  ; D011   0240 0102
L_D013:
        CMP     G_0102, R0                      ; D013   0340 0102
        BEQ     L_D013                          ; D015   0224 0003

        SDBD                                    ; D017   0001
        MVII    #$5014, R0                      ; D018   02B8 0014 0050
L_D01B:
        MVO     R0,     G_02F0                  ; D01B   0240 02F0
        MVII    #$02F1, R6                      ; D01D   02BE 02F1
        J       .EXEC.048                       ; D01F   0004 0310 0048

        DECLE   $0085,  $0040,  $003E,  $0090   ; D022   0085 0040 003E 0090
        DECLE   $0090,  $0090,  $005F,  $0046   ; D026   0090 0090 005F 0046
        DECLE   $0048,  $0090,  $0055,  $0090   ; D02A   0048 0090 0055 0090
        DECLE   $0181,  $0000,  $0001,  $0000   ; D02E   0181 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D032   0000 0000 0000 0000
        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; D036   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; D03A   01B0 01A0 0190 0180
        DECLE   $0050,  $0095,  $0001,  $0000   ; D03E   0050 0095 0001 0000
        DECLE   $00B4,  $006E,  $0014,  $0000   ; D042   00B4 006E 0014 0000
        DECLE   $0000,  $0000,  $002D,  $0001   ; D046   0000 0000 002D 0001
        DECLE   $0380,  $0011,  $0380,  $0021   ; D04A   0380 0011 0380 0021
        DECLE   $0380,  $0031,  $0380,  $0041   ; D04E   0380 0031 0380 0041
        DECLE   $0380,  $0051,  $0200,  $0052   ; D052   0380 0051 0200 0052
        DECLE   $0000                           ; D056   0000

        PSHR    R5                              ; D057   0275
        CLRR    R0                              ; D058   01C0
L_D059:
        MVO     R0,     .STIC.CS.0              ; D059   0240 0028
        MVO     R0,     .STIC.BORD              ; D05B   0240 002C
        MVII    #$0279, R4                      ; D05D   02BC 0279

        JSR     R5,     X_PRINT_R5              ; D05F   0004 0118 007B
        STRING  "Guess Who's Gonna   "          ; D062  
        STRING  "    be Dinner?"                ; D076  
        DECLE   $0000                           ; D084   0000

        MVII    #$009F, R0                      ; D085   02B8 009F
        MVO     R0,     .BTAB.D3                ; D087   0240 02D3
        MVI     .BTAB.25,R0                     ; D089   0280 0225
        XORI    #$0007, R0                      ; D08B   03F8 0007
        MVO     R0,     .BTAB.25                ; D08D   0240 0225
        PULR    R7                              ; D08F   02B7

        CLRR    R0                              ; D090   01C0
        MVO     R0,     G_01AD                  ; D091   0240 01AD
        SDBD                                    ; D093   0001
        MVII    #$8AC0, R5                      ; D094   02BD 00C0 008A
        MVI@    R5,     R0                      ; D097   02A8
        MVO     R0,     G_01AE                  ; D098   0240 01AE
        SDBD                                    ; D09A   0001
        MVII    #$8ABF, R1                      ; D09B   02B9 00BF 008A
        MVI@    R1,     R0                      ; D09E   0288
        MVO     R0,     G_01AF                  ; D09F   0240 01AF

        JSR     R5,     .EXEC.76C               ; D0A1   0004 0114 036C

        MVO     R1,     G_01B1                  ; D0A4   0241 01B1
        SDBD                                    ; D0A6   0001
        MVII    #$8ABE, R1                      ; D0A7   02B9 00BE 008A
        MVI@    R1,     R1                      ; D0AA   0289
        MVO     R1,     G_01B0                  ; D0AB   0241 01B0
        TSTR    R1                              ; D0AD   0089
        BNEQ    L_D0B6                          ; D0AE   020C 0006

        MVII    #$0080, R0                      ; D0B0   02B8 0080
        MVO     R0,     G_0126                  ; D0B2   0240 0126
        B       L_D0D7                          ; D0B4   0200 0021

L_D0B6:
        MVI     G_01AF, R0                      ; D0B6   0280 01AF

        JSR     R5,     L_FDB3                  ; D0B8   0004 01FC 01B3

        MOVR    R1,     R4                      ; D0BB   008C
        MVI     G_01B0, R0                      ; D0BC   0280 01B0

        JSR     R5,     L_FDB3                  ; D0BE   0004 01FC 01B3

        MOVR    R1,     R5                      ; D0C1   008D
        ADDI    #$0005, R4                      ; D0C2   02FC 0005
        ADDI    #$0005, R5                      ; D0C4   02FD 0005
        MVI@    R4,     R0                      ; D0C6   02A0
        MVI@    R5,     R1                      ; D0C7   02A9
        INCR    R4                              ; D0C8   000C
        INCR    R5                              ; D0C9   000D
        MVI@    R4,     R2                      ; D0CA   02A2
        MVI@    R5,     R3                      ; D0CB   02AB
        SUBR    R1,     R0                      ; D0CC   0108
        SUBR    R3,     R2                      ; D0CD   011A
        MVII    #$01B3, R4                      ; D0CE   02BC 01B3
        MVO@    R0,     R4                      ; D0D0   0260
        SWAP    R0,     1                       ; D0D1   0040
        MVO@    R0,     R4                      ; D0D2   0260
        NOP                                     ; D0D3   0034
        MVO@    R2,     R4                      ; D0D4   0262
        SWAP    R2,     1                       ; D0D5   0042
        MVO@    R2,     R4                      ; D0D6   0262
L_D0D7:
        SDBD                                    ; D0D7   0001
        MVII    #$8AE9, R3                      ; D0D8   02BB 00E9 008A
        MVI@    R3,     R3                      ; D0DB   029B
        MVO     R3,     G_01B8                  ; D0DC   0243 01B8
        SDBD                                    ; D0DE   0001
        MVII    #$8AF6, R4                      ; D0DF   02BC 00F6 008A
        MVI@    R4,     R0                      ; D0E2   02A0
        TSTR    R0                              ; D0E3   0080
        BEQ     L_D0E9                          ; D0E4   0204 0003

        MVI@    R4,     R0                      ; D0E6   02A0
        MVO     R0,     G_01B9                  ; D0E7   0240 01B9
L_D0E9:
        MVII    #$01BA, R4                      ; D0E9   02BC 01BA
        MVII    #$0004, R0                      ; D0EB   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; D0ED   0004 0114 0338
        JSR     R5,     L_FCD2                  ; D0F0   0004 01FC 00D2
        JSR     R5,     L_5FCC                  ; D0F3   0004 015C 03CC
        JSR     R5,     L_6005                  ; D0F6   0004 0160 0005

        MVII    #$031D, R4                      ; D0F9   02BC 031D
        MVII    #$0040, R0                      ; D0FB   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; D0FD   0004 0114 0338

        SDBD                                    ; D100   0001
        MVII    #$4545, R1                      ; D101   02B9 0045 0045
        MVII    #$031D, R2                      ; D104   02BA 031D
        CLRR    R3                              ; D106   01DB
L_D107:
        CMP     G_01B8, R3                      ; D107   0343 01B8
        BNEQ    L_D112                          ; D109   020C 0007

        CLRR    R0                              ; D10B   01C0
        MVO@    R0,     R2                      ; D10C   0250
        INCR    R2                              ; D10D   000A
        MVO@    R0,     R2                      ; D10E   0250
        DECR    R2                              ; D10F   0012
        B       L_D115                          ; D110   0200 0003

L_D112:
        JSR     R5,     X_INIT_MOB              ; D112   0004 0114 02B2

L_D115:
        ADDI    #$0008, R2                      ; D115   02FA 0008
        ADDI    #$0010, R1                      ; D117   02F9 0010
        INCR    R3                              ; D119   000B
        CMPI    #$0008, R3                      ; D11A   037B 0008
        BLT     L_D107                          ; D11C   0225 0016

        SDBD                                    ; D11E   0001
        MVII    #$8AFD, R1                      ; D11F   02B9 00FD 008A
        MVI@    R1,     R0                      ; D122   0288
        MVO     R0,     G_01C1                  ; D123   0240 01C1
        TSTR    R0                              ; D125   0080
        BEQ     L_D145                          ; D126   0204 001D

        DECR    R1                              ; D128   0011
        MVI@    R1,     R0                      ; D129   0288
        MVO     R0,     G_01C2                  ; D12A   0240 01C2
        MOVR    R0,     R2                      ; D12C   0082
        ADDR    R1,     R2                      ; D12D   00CA
        ADDI    #$0002, R2                      ; D12E   02FA 0002
        MVI@    R2,     R2                      ; D130   0292
        SARC    R0,     1                       ; D131   0078
        BNC     L_D13F                          ; D132   0209 000B

        MVII    #$0014, R4                      ; D134   02BC 0014
        BNEQ    L_D13A                          ; D136   020C 0002

        MVII    #$000C, R4                      ; D138   02BC 000C
L_D13A:
        SUBR    R2,     R4                      ; D13A   0114
        MOVR    R4,     R2                      ; D13B   00A2
        MVII    #$0010, R0                      ; D13C   02B8 0010
        INCR    R7                              ; D13E   000F

L_D13F:
        CLRR    R0                              ; D13F   01C0
L_D140:
        SLL     R2,     2                       ; D140   004E
        SLL     R2,     1                       ; D141   004A
        ADDR    R0,     R2                      ; D142   00C2
        MVO     R2,     G_01C3                  ; D143   0242 01C3

L_D145:
        JSR     R5,     L_60BF                  ; D145   0004 0160 00BF
        DECLE   $0004,  $0190,  $03CB,  $0004   ; D148   0004 0190 03CB 0004

        ANDR    R2,     R4                      ; D14C   0194
        MOVR    R1,     R4                      ; D14D   008C
        CLRR    R0                              ; D14E   01C0
L_D14F:
        PSHR    R0                              ; D14F   0270

        JSR     R5,     L_F59B                  ; D150   0004 01F4 019B

        PULR    R0                              ; D153   02B0
        INCR    R0                              ; D154   0008
        CMPI    #$0008, R0                      ; D155   0378 0008
        BLT     L_D14F                          ; D157   0225 0009
        J       L_50B1                          ; D159   0004 0350 00B1

        PSHR    R5                              ; D15C   0275
        SDBD                                    ; D15D   0001
        MVII    #$0270, R0                      ; D15E   02B8 0070 0002
        SDBD                                    ; D161   0001
        MVII    #$4085, R1                      ; D162   02B9 0085 0040
        SDBD                                    ; D165   0001
        MVII    #$56FE, R4                      ; D166   02BC 00FE 0056

        JSR     R5,     .EXEC.730               ; D169   0004 0114 0330

        MOVR    R5,     R1                      ; D16C   00A9
        ADDI    #$0110, R1                      ; D16D   02F9 0110
        MVII    #$0080, R0                      ; D16F   02B8 0080

        JSR     R5,     .EXEC.730               ; D171   0004 0114 0330

        MOVR    R5,     R1                      ; D174   00A9
        ADDI    #$0010, R1                      ; D175   02F9 0010
        MVII    #$0030, R0                      ; D177   02B8 0030

        JSR     R5,     .EXEC.730               ; D179   0004 0114 0330

        MOVR    R5,     R1                      ; D17C   00A9
        SUBI    #$00B0, R4                      ; D17D   033C 00B0
        MVII    #$0080, R0                      ; D17F   02B8 0080

        JSR     R5,     .EXEC.730               ; D181   0004 0114 0330

        MOVR    R5,     R1                      ; D184   00A9
        SDBD                                    ; D185   0001
        MVII    #$F811, R4                      ; D186   02BC 0011 00F8
        MVII    #$0090, R0                      ; D189   02B8 0090

        JSR     R5,     .EXEC.730               ; D18B   0004 0114 0330

        MOVR    R5,     R1                      ; D18E   00A9
        SDBD                                    ; D18F   0001
        MVII    #$9341, R4                      ; D190   02BC 0041 0093
        MVII    #$008A, R0                      ; D193   02B8 008A

        JSR     R5,     .EXEC.730               ; D195   0004 0114 0330

        SDBD                                    ; D198   0001
        MVII    #$89E2, R1                      ; D199   02B9 00E2 0089
L_D19C:
        MVII    #$0005, R0                      ; D19C   02B8 0005
        MOVR    R7,     R4                      ; D19E   00BC
        ADDI    #$00C1, R4                      ; D19F   02FC 00C1

        JSR     R5,     .EXEC.730               ; D1A1   0004 0114 0330

        ADDI    #$000B, R5                      ; D1A4   02FD 000B
        MOVR    R5,     R1                      ; D1A6   00A9
        SDBD                                    ; D1A7   0001
        CMPI    #$8A60, R1                      ; D1A8   0379 0060 008A
        BLT     L_D19C                          ; D1AB   0225 0010

        MVII    #$0008, R0                      ; D1AD   02B8 0008
        SDBD                                    ; D1AF   0001
        MVII    #$8A7E, R4                      ; D1B0   02BC 007E 008A
L_D1B3:
        MOVR    R7,     R5                      ; D1B3   00BD
        ADDI    #$00AC, R5                      ; D1B4   02FD 00AC
        MVI@    R5,     R1                      ; D1B6   02A9
        MVO@    R1,     R4                      ; D1B7   0261
        MVI@    R5,     R1                      ; D1B8   02A9
        MVO@    R1,     R4                      ; D1B9   0261
        ADDI    #$0006, R4                      ; D1BA   02FC 0006
        DECR    R0                              ; D1BC   0010
        BNEQ    L_D1B3                          ; D1BD   022C 000B

        MOVR    R7,     R4                      ; D1BF   00BC
        ADDI    #$00A5, R4                      ; D1C0   02FC 00A5
        SDBD                                    ; D1C2   0001
        MVII    #$89E6, R1                      ; D1C3   02B9 00E6 0089
        MVII    #$0009, R0                      ; D1C6   02B8 0009

        JSR     R5,     .EXEC.730               ; D1C8   0004 0114 0330

        MOVR    R7,     R4                      ; D1CB   00BC
        ADDI    #$00AC, R4                      ; D1CC   02FC 00AC
        SDBD                                    ; D1CE   0001
        MVII    #$89F6, R1                      ; D1CF   02B9 00F6 0089
        MVII    #$0009, R0                      ; D1D2   02B8 0009

        JSR     R5,     .EXEC.730               ; D1D4   0004 0114 0330

        MOVR    R7,     R4                      ; D1D7   00BC
        ADDI    #$0096, R4                      ; D1D8   02FC 0096
        SDBD                                    ; D1DA   0001
        MVII    #$8A06, R1                      ; D1DB   02B9 0006 008A
        MVII    #$000A, R0                      ; D1DE   02B8 000A

        JSR     R5,     .EXEC.730               ; D1E0   0004 0114 0330

        MOVR    R7,     R4                      ; D1E3   00BC
        ADDI    #$009D, R4                      ; D1E4   02FC 009D
        SDBD                                    ; D1E6   0001
        MVII    #$8A16, R1                      ; D1E7   02B9 0016 008A
        MVII    #$000A, R0                      ; D1EA   02B8 000A

        JSR     R5,     .EXEC.730               ; D1EC   0004 0114 0330

        MOVR    R7,     R4                      ; D1EF   00BC
        ADDI    #$009B, R4                      ; D1F0   02FC 009B
        SDBD                                    ; D1F2   0001
        MVII    #$8A26, R1                      ; D1F3   02B9 0026 008A
        MVII    #$000A, R0                      ; D1F6   02B8 000A

        JSR     R5,     .EXEC.730               ; D1F8   0004 0114 0330

        MVII    #$0009, R0                      ; D1FB   02B8 0009
        SDBD                                    ; D1FD   0001
        MVII    #$8A61, R1                      ; D1FE   02B9 0061 008A
        MVO@    R0,     R1                      ; D201   0248
        MVII    #$0088, R0                      ; D202   02B8 0088
        ADDI    #$0006, R1                      ; D204   02F9 0006
        MVO@    R0,     R1                      ; D206   0248
        ADDI    #$0009, R1                      ; D207   02F9 0009
        MVII    #$0001, R0                      ; D209   02B8 0001
        MVO@    R0,     R1                      ; D20B   0248
        SDBD                                    ; D20C   0001
        MVII    #$8ABE, R1                      ; D20D   02B9 00BE 008A
        MVII    #$0041, R0                      ; D210   02B8 0041
        MOVR    R7,     R4                      ; D212   00BC
        ADDI    #$000C, R4                      ; D213   02FC 000C

        JSR     R5,     .EXEC.730               ; D215   0004 0114 0330

        MVII    #$0000, R1                      ; D218   02B9 0000
        MVO     R1,     G_0173                  ; D21A   0241 0173
        J       L_6894                          ; D21C   0004 0368 0094

        DECLE   $0003,  $0002,  $0004,  $0001   ; D21F   0003 0002 0004 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; D223   0001 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; D227   0000 0001 0000 0000
        DECLE   $000C,  $000F,  $003C,  $0000   ; D22B   000C 000F 003C 0000
        DECLE   $003F,  $0000,  $003F,  $0000   ; D22F   003F 0000 003F 0000
        DECLE   $0030,  $0000,  $0020,  $0008   ; D233   0030 0000 0020 0008
        DECLE   $0018,  $0004,  $0000,  $0001   ; D237   0018 0004 0000 0001
        DECLE   $0000,  $0003,  $0000,  $0005   ; D23B   0000 0003 0000 0005
        DECLE   $0000,  $0005,  $0000,  $0005   ; D23F   0000 0005 0000 0005
        DECLE   $0000,  $0005,  $0000,  $0009   ; D243   0000 0005 0000 0009
        DECLE   $0000,  $0005,  $0000,  $0004   ; D247   0000 0005 0000 0004
        DECLE   $0004,  $0030,  $0000,  $0012   ; D24B   0004 0030 0000 0012
        DECLE   $0002,  $0003,  $0000,  $0000   ; D24F   0002 0003 0000 0000
        DECLE   $0000,  $0004,  $0002,  $0000   ; D253   0000 0004 0002 0000
        DECLE   $0001,  $0009,  $00C9,  $0001   ; D257   0001 0009 00C9 0001
        DECLE   $00CF,  $0012,  $0000,  $0001   ; D25B   00CF 0012 0000 0001
        DECLE   $0008,  $00C1,  $00F8,  $00C1   ; D25F   0008 00C1 00F8 00C1
        DECLE   $00F8,  $0001,  $0004,  $0018   ; D263   00F8 0001 0004 0018
        DECLE   $0000,  $0007,  $0020,  $0000   ; D267   0000 0007 0020 0000
        DECLE   $0018,  $0004,  $0001,  $0002   ; D26B   0018 0004 0001 0002
        DECLE   $003C,  $0000,  $0010,  $003F   ; D26F   003C 0000 0010 003F
        DECLE   $0002,  $0004,  $0004,  $0002   ; D273   0002 0004 0004 0002
        DECLE   $000A,  $0004,  $0020,  $0000   ; D277   000A 0004 0020 0000
        DECLE   $0007,  $0006,  $0002,  $0000   ; D27B   0007 0006 0002 0000
        DECLE   $0000,  $001E,  $0002,  $0030   ; D27F   0000 001E 0002 0030
        DECLE   $0000,  $0014,  $000C,  $0000   ; D283   0000 0014 000C 0000
        DECLE   $000C,  $000C,  $0011,  $0032   ; D287   000C 000C 0011 0032
        DECLE   $0002,  $0042,  $0000,  $0014   ; D28B   0002 0042 0000 0014
        DECLE   $000A,  $0000                   ; D28F   000A 0000

        INCR    R4                              ; D291   000C
        INCR    R4                              ; D292   000C
        DECR    R1                              ; D293   0011
        SLLC    R2,     1                       ; D294   005A
        SARC    R2,     1                       ; D295   007A
        SLR     R0,     1                       ; D296   0060
        RSWD    R3                              ; D297   003B
        B       L_D2D6                          ; D298   0200 003C

        DECLE   $0060,  $000B,  $02B4,  $0014   ; D29A   0060 000B 02B4 0014
        DECLE   $0089,  $003B,  $02A0,  $0005   ; D29E   0089 003B 02A0 0005
        DECLE   $000B,  $001A,  $028C,  $0005   ; D2A2   000B 001A 028C 0005
        DECLE   $0013,  $001A,  $0291,  $0005   ; D2A6   0013 001A 0291 0005
        DECLE   $001B,  $001A,  $0296,  $0005   ; D2AA   001B 001A 0296 0005
        DECLE   $0060,  $000F,  $029B,  $0000   ; D2AE   0060 000F 029B 0000
        DECLE   $0000,  $003A,  $0237,  $024A   ; D2B2   0000 003A 0237 024A
        DECLE   $0000,  $0003,  $003A,  $0248   ; D2B6   0000 0003 003A 0248
        DECLE   $0000,  $0000,  $002A,  $0270   ; D2BA   0000 0000 002A 0270
        DECLE   $0000,  $0025,  $0008,  $025D   ; D2BE   0000 0025 0008 025D
        DECLE   $0000,  $0028,  $003A,  $0239   ; D2C2   0000 0028 003A 0239
        DECLE   $024F,  $0000,  $002B,  $003A   ; D2C6   024F 0000 002B 003A
        DECLE   $0249,  $0000,  $0028,  $0028   ; D2CA   0249 0000 0028 0028
        DECLE   $0273,  $0000,  $0032,  $0008   ; D2CE   0273 0000 0032 0008
        DECLE   $0238,  $024E,  $0000           ; D2D2   0238 024E 0000

        RSWD    R4                              ; D2D5   003C
L_D2D6:
        INCR    R0                              ; D2D6   0008
        DECLE   $025E,  $0000,  $0040,  $0028   ; D2D7   025E 0000 0040 0028
        DECLE   $025F,  $0000,  $004C,  $0008   ; D2DB   025F 0000 004C 0008
        DECLE   $028A,  $0000,  $004D,  $003A   ; D2DF   028A 0000 004D 003A
        DECLE   $025B,  $025C,  $0000,  $004C   ; D2E3   025B 025C 0000 004C
        DECLE   $003A,  $026D,  $0000,  $004C   ; D2E7   003A 026D 0000 004C
        DECLE   $002A,  $026E,  $0000,  $004D   ; D2EB   002A 026E 0000 004D
        DECLE   $0028,  $0274,  $0000,  $0055   ; D2EF   0028 0274 0000 0055
        DECLE   $003A,  $025A,  $026C,  $0000   ; D2F3   003A 025A 026C 0000
        DECLE   $005D,  $0028,  $026F,  $0000   ; D2F7   005D 0028 026F 0000
        DECLE   $0058,  $002A,  $0275,  $0000   ; D2FB   0058 002A 0275 0000
        DECLE   $0058,  $0028,  $028B,  $0000   ; D2FF   0058 0028 028B 0000
        DECLE   $0065,  $0008,  $0271,  $0000   ; D303   0065 0008 0271 0000
        DECLE   $0065,  $003A,  $0278,  $027A   ; D307   0065 003A 0278 027A
        DECLE   $027C,  $027E,  $0000,  $0065   ; D30B   027C 027E 0000 0065
        DECLE   $0028,  $0280,  $0282,  $0286   ; D30F   0028 0280 0282 0286
        DECLE   $0000,  $0064,  $0008,  $0272   ; D313   0000 0064 0008 0272
        DECLE   $0284,  $0288,  $0000,  $006C   ; D317   0284 0288 0000 006C
        DECLE   $003A,  $027B,  $027D,  $0000   ; D31B   003A 027B 027D 0000
        DECLE   $006D,  $003A,  $027F,  $0000   ; D31F   006D 003A 027F 0000
        DECLE   $006D,  $0028,  $0281,  $0283   ; D323   006D 0028 0281 0283
        DECLE   $0000,  $006D,  $0008,  $0285   ; D327   0000 006D 0008 0285
        DECLE   $0287,  $0289,  $0000,  $0063   ; D32B   0287 0289 0000 0063
        DECLE   $0009,  $024B,  $024C,  $024D   ; D32F   0009 024B 024C 024D
        DECLE   $0260,  $0261,  $0262,  $0263   ; D333   0260 0261 0262 0263
        DECLE   $0276,  $0277,  $0000,  $0086   ; D337   0276 0277 0000 0086
        DECLE   $003B,  $0224,  $023A,  $0000   ; D33B   003B 0224 023A 0000
        DECLE   $0000,  $0000,  $0000,  $005D   ; D33F   0000 0000 0000 005D
        DECLE   $00D3,  $0043,  $00D6,  $005C   ; D343   00D3 0043 00D6 005C
        DECLE   $00AD,  $0004,  $0000,  $00FE   ; D347   00AD 0004 0000 00FE
        DECLE   $00F2,  $00F7,  $006C,  $00D8   ; D34B   00F2 00F7 006C 00D8
        DECLE   $00F2,  $00F7,  $00F2,  $00F7   ; D34F   00F2 00F7 00F2 00F7
        DECLE   $00F2,  $00F7,  $00F2,  $00F7   ; D353   00F2 00F7 00F2 00F7
        DECLE   $00F2,  $00F7,  $005D,  $00D3   ; D357   00F2 00F7 005D 00D3
        DECLE   $0043,  $00D6,  $005C,  $00AD   ; D35B   0043 00D6 005C 00AD
        DECLE   $0006,  $0030,  $00FC,  $006C   ; D35F   0006 0030 00FC 006C
        DECLE   $00D8,  $00F2,  $00F7,  $00F2   ; D363   00D8 00F2 00F7 00F2
        DECLE   $00F7,  $00F2,  $00F7,  $00F2   ; D367   00F7 00F2 00F7 00F2
        DECLE   $00F7,  $00F2,  $00F7           ; D36B   00F7 00F2 00F7

        SLLC    R1,     2                       ; D36E   005D
        ADDR    R2,     R3                      ; D36F   00D3
        SLL     R2,     2                       ; D370   004E
        ADDR    R2,     R7                      ; D371   00D7

        SLLC    R0,     2                       ; D372   005C
        TSTR    R5                              ; D373   00AD

        JSR     R4,     .EXEC.0E0               ; D374   0004 0010 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D377   0000 0000 0000 0000
        DECLE   $00F2,  $00F7,  $006C,  $00D8   ; D37B   00F2 00F7 006C 00D8
        DECLE   $00F2,  $00F7                   ; D37F   00F2 00F7

        SLLC    R1,     2                       ; D381   005D
        ADDR    R2,     R3                      ; D382   00D3
        SLL     R2,     2                       ; D383   004E
        ADDR    R2,     R7                      ; D384   00D7

        DECLE   $005C,  $00AD,  $0004,  $0028   ; D385   005C 00AD 0004 0028
        DECLE   $00E0,  $0000,  $0000,  $00F2   ; D389   00E0 0000 0000 00F2
        DECLE   $00F7,  $00F2,  $00F7,  $00F2   ; D38D   00F7 00F2 00F7 00F2
        DECLE   $00F7,  $005D,  $00D3,  $003E   ; D391   00F7 005D 00D3 003E
        DECLE   $00D5,  $005C,  $00AD,  $0001   ; D395   00D5 005C 00AD 0001
        DECLE   $0040,  $0060,  $00F2,  $00F7   ; D399   0040 0060 00F2 00F7
        DECLE   $00F2,  $00F7,  $0000,  $0000   ; D39D   00F2 00F7 0000 0000
        DECLE   $005D,  $00D3,  $0043,  $00D6   ; D3A1   005D 00D3 0043 00D6
        DECLE   $005C,  $00AD,  $0006,  $0042   ; D3A5   005C 00AD 0006 0042
        DECLE   $00C0,  $00F2,  $00F7,  $00F2   ; D3A9   00C0 00F2 00F7 00F2
        DECLE   $00F7                           ; D3AD   00F7

        SLLC    R1,     2                       ; D3AE   005D
        ADDR    R2,     R3                      ; D3AF   00D3
        SLL     R2,     2                       ; D3B0   004E
        ADDR    R2,     R7                      ; D3B1   00D7

        DECLE   $005C,  $00AD,  $0004,  $0008   ; D3B2   005C 00AD 0004 0008
        DECLE   $0080,  $00F2,  $00F7,  $005D   ; D3B6   0080 00F2 00F7 005D
        DECLE   $00D3,  $00BD,  $00F7,  $005C   ; D3BA   00D3 00BD 00F7 005C
        DECLE   $00AD,  $0008,  $0070,  $0000   ; D3BE   00AD 0008 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0088   ; D3C6   0000 0000 0008 0088
        DECLE   $0000                           ; D3CA   0000

        PSHR    R5                              ; D3CB   0275
        SDBD                                    ; D3CC   0001
        MVII    #$8AFA, R4                      ; D3CD   02BC 00FA 008A
        MVI@    R4,     R1                      ; D3D0   02A1

        JSR     R5,     L_FDCC                  ; D3D1   0004 01FC 01CC

        MOVR    R1,     R3                      ; D3D4   008B
        MVI@    R4,     R2                      ; D3D5   02A2
        MOVR    R2,     R4                      ; D3D6   0094
        ADDI    #$0200, R4                      ; D3D7   02FC 0200
        MVI     G_01AE, R0                      ; D3D9   0280 01AE
        MVII    #$0002, R1                      ; D3DB   02B9 0002

        JSR     R5,     L_FEA1                  ; D3DD   0004 01FC 02A1

        BC      L_D3E6                          ; D3E0   0201 0004

        JSR     R5,     X_PRNUM_ZRO             ; D3E2   0004 0118 00AD

        PULR    R7                              ; D3E5   02B7

L_D3E6:
        JSR     R5,     X_PRNUM_RGT             ; D3E6   0004 0118 00C5

        PULR    R7                              ; D3E9   02B7

        PSHR    R5                              ; D3EA   0275
        SDBD                                    ; D3EB   0001
        MVII    #$8AF8, R4                      ; D3EC   02BC 00F8 008A
        MVI@    R4,     R1                      ; D3EF   02A1

        JSR     R5,     L_FDCC                  ; D3F0   0004 01FC 01CC

        MOVR    R1,     R3                      ; D3F3   008B
        MVI@    R4,     R2                      ; D3F4   02A2
        MOVR    R2,     R4                      ; D3F5   0094
        ADDI    #$0200, R4                      ; D3F6   02FC 0200
        MVII    #$01BA, R5                      ; D3F8   02BD 01BA
        SDBD                                    ; D3FA   0001
        ADD@    R5,     R0                      ; D3FB   02E8
        SDBD                                    ; D3FC   0001
        MVI@    R5,     R1                      ; D3FD   02A9
L_D3FE:
        CMPI    #$03E8, R0                      ; D3FE   0378 03E8
        BLT     L_D407                          ; D400   0205 0005

        SUBI    #$03E8, R0                      ; D402   0338 03E8
        INCR    R1                              ; D404   0009
        B       L_D3FE                          ; D405   0220 0008

L_D407:
        SDBD                                    ; D407   0001
        CMPI    #$270F, R1                      ; D408   0379 000F 0027
        BLE     L_D415                          ; D40B   0206 0008

        CLRR    R1                              ; D40D   01C9
        MVO@    R3,     R4                      ; D40E   0263
        MVO@    R3,     R4                      ; D40F   0263
        NOP                                     ; D410   0034
        MVO@    R3,     R4                      ; D411   0263
        MVO@    R3,     R4                      ; D412   0263
        SUBI    #$0004, R4                      ; D413   033C 0004
L_D415:
        MVII    #$01BA, R5                      ; D415   02BD 01BA
        MVO@    R0,     R5                      ; D417   0268
        SWAP    R0,     1                       ; D418   0040
        MVO@    R0,     R5                      ; D419   0268
        SWAP    R0,     1                       ; D41A   0040
        NOP                                     ; D41B   0034
        MVO@    R1,     R5                      ; D41C   0269
        SWAP    R1,     1                       ; D41D   0041
        MVO@    R1,     R5                      ; D41E   0269
        SWAP    R1,     1                       ; D41F   0041
        TSTR    R1                              ; D420   0089
        BEQ     L_D43D                          ; D421   0204 001A

        PSHR    R0                              ; D423   0270
        MOVR    R1,     R0                      ; D424   0088
        MVII    #$0004, R1                      ; D425   02B9 0004

        JSR     R5,     L_FEA1                  ; D427   0004 01FC 02A1

        BC      L_D431                          ; D42A   0201 0005

        JSR     R5,     X_PRNUM_ZRO             ; D42C   0004 0118 00AD

        B       L_D434                          ; D42F   0200 0003

L_D431:
        JSR     R5,     X_PRNUM_RGT             ; D431   0004 0118 00C5

L_D434:
        PULR    R0                              ; D434   02B0
        DECR    R1                              ; D435   0011
        ADDI    #$0004, R4                      ; D436   02FC 0004

        JSR     R5,     X_PRNUM_ZRO             ; D438   0004 0118 00AD

        B       L_D444                          ; D43B   0200 0007

L_D43D:
        MVII    #$0003, R1                      ; D43D   02B9 0003
        ADDI    #$0004, R4                      ; D43F   02FC 0004

        JSR     R5,     X_PRNUM_RGT             ; D441   0004 0118 00C5

L_D444:
        XORI    #$0080, R3                      ; D444   03FB 0080
        ADDI    #$0003, R4                      ; D446   02FC 0003
        MVO@    R3,     R4                      ; D448   0263
        MVO@    R3,     R4                      ; D449   0263

        JSR     R5,     L_FEA1                  ; D44A   0004 01FC 02A1
        DECLE   $0209,  $002F,  $0001           ; D44D   0209 002F 0001

        MVII    #$00F6, R4                      ; D450   02BC 00F6
        MOVR    R1,     R2                      ; D452   008A
        MVI@    R4,     R0                      ; D453   02A0
        TSTR    R0                              ; D454   0080
        BEQ     L_D47E                          ; D455   0204 0027

        MVII    #$01BA, R5                      ; D457   02BD 01BA
        SDBD                                    ; D459   0001
        MVI@    R5,     R1                      ; D45A   02A9
        MVII    #$0064, R2                      ; D45B   02BA 0064

        JSR     R5,     X_DIV                   ; D45D   0004 011C 01FB

        MVI     G_01B9, R1                      ; D460   0281 01B9
        CMPR    R0,     R1                      ; D462   0141
        BNEQ    L_D47E                          ; D463   020C 0019

        ADD@    R4,     R1                      ; D465   02E1
        MVII    #$000A, R2                      ; D466   02BA 000A

        JSR     R5,     X_DIV                   ; D468   0004 011C 01FB
        DECLE   $0241,  $01B9,  $02B9,  $01AE   ; D46B   0241 01B9 02B9 01AE
        DECLE   $0288,  $0008,  $0378,  $0063   ; D46F   0288 0008 0378 0063
        DECLE   $020E,  $0004,  $0248,  $0004   ; D473   020E 0004 0248 0004

        ANDR    R2,     R0                      ; D477   0190
        XOR@    R1,     R3                      ; D478   03CB
        MVII    #$0015, R0                      ; D479   02B8 0015

        JSR     R5,     L_F627                  ; D47B   0004 01F4 0227

L_D47E:
        PULR    R7                              ; D47E   02B7

        DECLE   $0275,  $02B8,  $005B,  $0004   ; D47F   0275 02B8 005B 0004
        DECLE   $0190,  $03EA,  $01C0,  $0240   ; D483   0190 03EA 01C0 0240
        DECLE   $01AE,  $0004                   ; D487   01AE 0004

        ANDR    R2,     R0                      ; D489   0190
        XOR@    R1,     R3                      ; D48A   03CB
        PULR    R7                              ; D48B   02B7

        PSHR    R5                              ; D48C   0275
        SDBD                                    ; D48D   0001
        MVII    #$8B02, R4                      ; D48E   02BC 0002 008B
        MVO     R4,     G_035D                  ; D491   0244 035D
        MVII    #$000A, R0                      ; D493   02B8 000A

        JSR     R5,     X_FILL_ZERO             ; D495   0004 0114 0338
        DECLE   $033C,  $000A,  $0001,  $02B8   ; D498   033C 000A 0001 02B8
        DECLE   $0060,  $00F7,  $0260,  $0040   ; D49C   0060 00F7 0260 0040
        DECLE   $0260,  $0001,  $02B9,  $00E9   ; D4A0   0260 0001 02B9 00E9
        DECLE   $008A,  $0288,  $0378,  $0008   ; D4A4   008A 0288 0378 0008
        DECLE   $0204,  $0013,  $0004           ; D4A8   0204 0013 0004

        ANDR    R2,     R4                      ; D4AB   0194
        ADDR    R0,     R4                      ; D4AC   00C4
        MOVR    R1,     R5                      ; D4AD   008D
        ADDR    R5,     R5                      ; D4AE   00ED
        ADDR    R7,     R5                      ; D4AF   00FD
        ADDI    #$000E, R5                      ; D4B0   02FD 000E
        SDBD                                    ; D4B2   0001
        MVI@    R5,     R0                      ; D4B3   02A8
        CMPI    #$0002, R1                      ; D4B4   0379 0002
        BEQ     L_D4BA                          ; D4B6   0204 0002

        ADDI    #$0002, R4                      ; D4B8   02FC 0002
L_D4BA:
        MVO@    R0,     R4                      ; D4BA   0260
        SWAP    R0,     1                       ; D4BB   0040
        MVO@    R0,     R4                      ; D4BC   0260
L_D4BD:
        PULR    R7                              ; D4BD   02B7

        ADDR    R1,     R2                      ; D4BE   00CA
        MOVR    R2,     R4                      ; D4BF   0094
        ADDR    R2,     R2                      ; D4C0   00D2
        MOVR    R2,     R4                      ; D4C1   0094
        ADDR    R3,     R4                      ; D4C2   00DC
        MOVR    R2,     R4                      ; D4C3   0094
        SDBD                                    ; D4C4   0001
        MVII    #$8AEC, R1                      ; D4C5   02B9 00EC 008A
        MVI@    R1,     R1                      ; D4C8   0289
        MOVR    R5,     R7                      ; D4C9   00AF

        PSHR    R5                              ; D4CA   0275
        DECR    R0                              ; D4CB   0010
        BNEQ    L_D4BD                          ; D4CC   022C 0010

        MVII    #$01B7, R1                      ; D4CE   02B9 01B7
        B       L_D4EC                          ; D4D0   0200 001A

        PSHR    R5                              ; D4D2   0275
        DECR    R0                              ; D4D3   0010
        BNEQ    L_D4BD                          ; D4D4   022C 0018

        SDBD                                    ; D4D6   0001
        MVII    #$8AEA, R1                      ; D4D7   02B9 00EA 008A
        B       L_D4EC                          ; D4DA   0200 0010

        PSHR    R5                              ; D4DC   0275
        CMPI    #$0009, R0                      ; D4DD   0378 0009
        BGT     L_D4BD                          ; D4DF   022E 0023

        CMPI    #$0005, R0                      ; D4E1   0378 0005
        BEQ     L_D4BD                          ; D4E3   0224 0027

        DECR    R0                              ; D4E5   0010
        BMI     L_D4BD                          ; D4E6   022B 002A

        MOVR    R0,     R1                      ; D4E8   0081
        ADDR    R7,     R1                      ; D4E9   00F9
        ADDI    #$0037, R1                      ; D4EA   02F9 0037
L_D4EC:
        MVI@    R1,     R1                      ; D4EC   0289
        SDBD                                    ; D4ED   0001
        MVII    #$8AEB, R2                      ; D4EE   02BA 00EB 008A
        MVI@    R2,     R0                      ; D4F1   0290

        JSR     R5,     .EXEC.629               ; D4F2   0004 0114 0229

        MOVR    R0,     R3                      ; D4F5   0083
        MVI     G_01AF, R0                      ; D4F6   0280 01AF

        JSR     R5,     L_FE74                  ; D4F8   0004 01FC 0274

        BNEQ    L_D4BD                          ; D4FB   022C 003F

        PSHR    R1                              ; D4FD   0271
        SDBD                                    ; D4FE   0001
        MVII    #$8AE9, R1                      ; D4FF   02B9 00E9 008A
        MVI@    R1,     R0                      ; D502   0288

        JSR     R5,     .EXEC.76C               ; D503   0004 0114 036C

        MOVR    R1,     R2                      ; D506   008A

        JSR     R5,     L_FDB3                  ; D507   0004 01FC 01B3
        JSR     R5,     X_INIT_MOB              ; D50A   0004 0114 02B2

        PULR    R4                              ; D50D   02B4
        ADDI    #$0002, R4                      ; D50E   02FC 0002
        ADDI    #$0002, R2                      ; D510   02FA 0002
        MOVR    R2,     R5                      ; D512   0095
        MVI@    R4,     R1                      ; D513   02A1
        MVO@    R1,     R5                      ; D514   0269
        MVI@    R4,     R1                      ; D515   02A1
        MVO@    R1,     R5                      ; D516   0269
        MVO@    R3,     R5                      ; D517   026B
        SDBD                                    ; D518   0001
        MVII    #$8AED, R1                      ; D519   02B9 00ED 008A
        MVI@    R1,     R0                      ; D51C   0288

        JSR     R5,     L_F627                  ; D51D   0004 01F4 0227

        PULR    R7                              ; D520   02B7

        DECLE   $0006,  $0004,  $0002,  $0008   ; D521   0006 0004 0002 0008
        DECLE   $0000,  $0000                   ; D525   0000 0000

        INCR    R2                              ; D527   000A
        INCR    R4                              ; D528   000C
        INCR    R6                              ; D529   000E
        PSHR    R5                              ; D52A   0275

        JSR     R5,     L_FE82                  ; D52B   0004 01FC 0282

        SDBD                                    ; D52E   0001
        MVII    #$8AE9, R2                      ; D52F   02BA 00E9 008A
        MVI@    R2,     R2                      ; D532   0292
        CMPR    R0,     R2                      ; D533   0142
        BEQ     L_D53C                          ; D534   0204 0006

        XORR    R0,     R3                      ; D536   01C3
        XORR    R3,     R0                      ; D537   01D8
        XORR    R0,     R3                      ; D538   01C3

        JSR     R5,     .EXEC.76C               ; D539   0004 0114 036C

L_D53C:
        CLRR    R2                              ; D53C   01D2
        MVO@    R2,     R1                      ; D53D   024A
        INCR    R1                              ; D53E   0009
        MVO@    R2,     R1                      ; D53F   024A
        MOVR    R3,     R0                      ; D540   0098

        JSR     R5,     .EXEC.76C               ; D541   0004 0114 036C
        DECLE   $0001,  $02BA,  $00EE,  $008A   ; D544   0001 02BA 00EE 008A
        DECLE   $00C2,  $0292,  $0004,  $01D8   ; D548   00C2 0292 0004 01D8
        DECLE   $000E                           ; D54C   000E

        PULR    R7                              ; D54D   02B7

        PULR    R0                              ; D54E   02B0
        PULR    R7                              ; D54F   02B7

        PSHR    R5                              ; D550   0275
        MVI     G_01AD, R0                      ; D551   0280 01AD
        ANDI    #$0080, R0                      ; D553   03B8 0080
        BNEQ    L_D583                          ; D555   020C 002C

        MVI     G_01B0, R3                      ; D557   0283 01B0
        MVI     G_01AF, R0                      ; D559   0280 01AF

        JSR     R5,     L_FE82                  ; D55B   0004 01FC 0282

        PSHR    R0                              ; D55E   0270
        MOVR    R3,     R0                      ; D55F   0098

        JSR     R5,     .EXEC.772               ; D560   0004 0114 0372

        PULR    R0                              ; D563   02B0
        PSHR    R2                              ; D564   0272
        PSHR    R3                              ; D565   0273

        JSR     R5,     .EXEC.772               ; D566   0004 0114 0372

        PULR    R4                              ; D569   02B4
        PULR    R0                              ; D56A   02B0
        MVII    #$01B3, R5                      ; D56B   02BD 01B3
        SDBD                                    ; D56D   0001
        SUB@    R5,     R2                      ; D56E   032A
        BMI     L_D583                          ; D56F   020B 0012

        SDBD                                    ; D571   0001
        SUB@    R5,     R3                      ; D572   032B
        BMI     L_D583                          ; D573   020B 000E

        CMPI    #$00A8, R2                      ; D575   037A 00A8
        BGT     L_D583                          ; D577   020E 000A

        CMPI    #$0068, R3                      ; D579   037B 0068
        BGT     L_D583                          ; D57B   020E 0006

        CMPR    R2,     R0                      ; D57D   0150
        BNEQ    L_D584                          ; D57E   020C 0004

        CMPR    R3,     R4                      ; D580   015C
        BNEQ    L_D584                          ; D581   020C 0001
L_D583:
        PULR    R7                              ; D583   02B7

L_D584:
        SWAP    R2,     1                       ; D584   0042
        SWAP    R3,     1                       ; D585   0043
        ADDI    #$000A, R1                      ; D586   02F9 000A
        MVO@    R2,     R1                      ; D588   024A
        INCR    R1                              ; D589   0009
        MVO@    R3,     R1                      ; D58A   024B
        MVI     G_01AF, R0                      ; D58B   0280 01AF

        JSR     R5,     .EXEC.772               ; D58D   0004 0114 0372

        SWAP    R2,     1                       ; D590   0042
        SWAP    R3,     1                       ; D591   0043
        ADDI    #$0002, R1                      ; D592   02F9 0002
        MVO@    R2,     R1                      ; D594   024A
        INCR    R1                              ; D595   0009
        MVO@    R3,     R1                      ; D596   024B
        PULR    R7                              ; D597   02B7

        DECLE   $025F,  $003C,  $0096,  $0044   ; D598   025F 003C 0096 0044
        DECLE   $0096,  $007A,  $0096,  $002E   ; D59C   0096 007A 0096 002E
        DECLE   $0051,  $0080,  $0096,  $02F4   ; D5A0   0051 0080 0096 02F4
        DECLE   $0028,  $02F2,  $0203,  $0098   ; D5A4   0028 02F2 0203 0098
        DECLE   $00DE,  $02F2,  $0215           ; D5A8   00DE 02F2 0215

        SETC                                    ; D5AB   0007
        ADDR    R3,     R7                      ; D5AC   00DF

        DECLE   $021C,  $03CE,  $034E,  $0029   ; D5AD   021C 03CE 034E 0029
        DECLE   $0082,  $027A,  $03C0,  $02F5   ; D5B1   0082 027A 03C0 02F5
        DECLE   $02F1,  $0004                   ; D5B5   02F1 0004

        XORR    R7,     R4                      ; D5B7   01FC
        CMPR    R1,     R1                      ; D5B8   0149

L_D5B9:
        JSR     R5,     L_DE43                  ; D5B9   0004 01DC 0243
        DECLE   $0225,  $0004,  $01FC,  $035D   ; D5BC   0225 0004 01FC 035D
        DECLE   $0004,  $01D0,  $03ED           ; D5C0   0004 01D0 03ED

        MVII    #$003C, R0                      ; D5C3   02B8 003C
        MVII    #$02B4, R4                      ; D5C5   02BC 02B4

        JSR     R5,     X_FILL_ZERO             ; D5C7   0004 0114 0338

        MVII    #$0007, R2                      ; D5CA   02BA 0007
        MVO     R2,     G_017B                  ; D5CC   0242 017B
        MVI     G_0169, R0                      ; D5CE   0280 0169
        SDBD                                    ; D5D0   0001
        MVII    #$8ABF, R1                      ; D5D1   02B9 00BF 008A
        CMP@    R1,     R0                      ; D5D4   0348
        BEQ     L_D5E9                          ; D5D5   0204 0012

        SDBD                                    ; D5D7   0001
        MVII    #$8AE9, R1                      ; D5D8   02B9 00E9 008A
        CMP@    R1,     R0                      ; D5DB   0348
        BEQ     L_D631                          ; D5DC   0204 0053

        SDBD                                    ; D5DE   0001
        MVII    #$8ABE, R1                      ; D5DF   02B9 00BE 008A
        MVI@    R1,     R1                      ; D5E2   0289
        TSTR    R1                              ; D5E3   0089
        BEQ     L_D5FB                          ; D5E4   0204 0015

        CMPR    R1,     R0                      ; D5E6   0148
        BNEQ    L_D5FB                          ; D5E7   020C 0012

L_D5E9:
        MVII    #$02CD, R4                      ; D5E9   02BC 02CD

        JSR     R5,     L_DDD3                  ; D5EB   0004 01DC 01D3
        DECLE   $004E,  $01B3,  $022E,  $016B   ; D5EE   004E 01B3 022E 016B
        DECLE   $0083,  $0381,  $031A,  $01EB   ; D5F2   0083 0381 031A 01EB
        DECLE   $0018,  $0091,  $03C0,  $0200   ; D5F6   0018 0091 03C0 0200
        DECLE   $0035                           ; D5FA   0035
L_D5FB:
        MVII    #$0001, R2                      ; D5FB   02BA 0001
        MVO     R2,     G_017B                  ; D5FD   0242 017B
        MVII    #$02CA, R4                      ; D5FF   02BC 02CA

        JSR     R5,     L_DDD3                  ; D601   0004 01DC 01D3
        DECLE   $035A,  $00BA,  $00B1,  $0084   ; D604   035A 00BA 00B1 0084
        DECLE   $0345,  $01D1,  $019C,  $00FA   ; D608   0345 01D1 019C 00FA
        DECLE   $00F4,  $01B3,  $035A,  $0340   ; D60C   00F4 01B3 035A 0340
        DECLE   $0340,  $02AE,  $0103,  $03C0   ; D610   0340 02AE 0103 03C0
        DECLE   $0001,  $02F8,  $00C1,  $008A   ; D614   0001 02F8 00C1 008A
        DECLE   $0082,  $0290,  $02B9,  $000B   ; D618   0082 0290 02B9 000B
        DECLE   $02BC,  $02CC,  $0080,  $0204   ; D61C   02BC 02CC 0080 0204
        DECLE   $000A,  $02B9,  $0006,  $02BC   ; D620   000A 02B9 0006 02BC
        DECLE   $02DE,  $0010,  $0204,  $0003   ; D624   02DE 0010 0204 0003
        DECLE   $02BC,  $02E7,  $0009,  $0004   ; D628   02BC 02E7 0009 0004
        DECLE   $01FC,  $03B1,  $0006,  $0000   ; D62C   01FC 03B1 0006 0000
L_D630:
        PULR    R7                              ; D630   02B7

L_D631:
        MVII    #$02B9, R4                      ; D631   02BC 02B9

        JSR     R5,     L_DDD3                  ; D633   0004 01DC 01D3

        ADD     .STIC.Y.7,R4                    ; D636   02C4 000F
        XORR    R1,     R5                      ; D638   01CD
        XOR     .BTAB.20,R0                     ; D639   03C0 0220
        RLC     R2,     1                       ; D63B   0052
        PSHR    R5                              ; D63C   0275

        JSR     R5,     L_FE56                  ; D63D   0004 01FC 0256

        MVO     R0,     G_0169                  ; D640   0240 0169
        B       L_D5B9                          ; D642   0220 008A

        PSHR    R5                              ; D644   0275
        MVI     G_0169, R3                      ; D645   0283 0169
        SDBD                                    ; D647   0001
        MVII    #$8ABF, R2                      ; D648   02BA 00BF 008A
        CMP@    R2,     R3                      ; D64B   0353
        BEQ     L_D630                          ; D64C   0224 001D

        SDBD                                    ; D64E   0001
        MVII    #$8AE9, R2                      ; D64F   02BA 00E9 008A
        CMP@    R2,     R3                      ; D652   0353
        BEQ     L_D630                          ; D653   0224 0024

        SDBD                                    ; D655   0001
        MVII    #$8ABE, R2                      ; D656   02BA 00BE 008A
        MVI@    R2,     R2                      ; D659   0292
        TSTR    R2                              ; D65A   0092
        BEQ     L_D660                          ; D65B   0204 0003

        CMPR    R2,     R3                      ; D65D   0153
        BEQ     L_D630                          ; D65E   0224 002F

L_D660:
        CLRR    R4                              ; D660   01E4

        JSR     R5,     L_FE65                  ; D661   0004 01FC 0265
        DECLE   $0046,  $0070,  $0096,  $0041   ; D664   0046 0070 0096 0041
        DECLE   $006E,  $0096,  $0048,  $006F   ; D668   006E 0096 0048 006F
        DECLE   $0096,  $0000                   ; D66C   0096 0000

        INCR    R4                              ; D66E   000C
        INCR    R4                              ; D66F   000C
        SDBD                                    ; D670   0001
        ADDI    #$8AC1, R3                      ; D671   02FB 00C1 008A
        CMP@    R3,     R4                      ; D674   035C
        BEQ     L_D630                          ; D675   0224 0046

        MVO@    R4,     R3                      ; D677   025C
        B       L_D5B9                          ; D678   0220 00C0

        PSHR    R5                              ; D67A   0275

        JSR     R5,     L_6A20                  ; D67B   0004 0168 0220

        B       L_D5B9                          ; D67E   0220 00C6

        PSHR    R5                              ; D680   0275
        MVI     G_0169, R1                      ; D681   0281 0169
        SDBD                                    ; D683   0001
        MVII    #$8ABF, R2                      ; D684   02BA 00BF 008A
        CMP@    R2,     R1                      ; D687   0351
        BEQ     L_D630                          ; D688   0224 0059

        SDBD                                    ; D68A   0001
        MVII    #$8AE9, R2                      ; D68B   02BA 00E9 008A
        CMP@    R2,     R1                      ; D68E   0351
        BEQ     L_D630                          ; D68F   0224 0060

        SDBD                                    ; D691   0001
        MVII    #$8ABE, R2                      ; D692   02BA 00BE 008A
        MVI@    R2,     R2                      ; D695   0292
        TSTR    R2                              ; D696   0092
        BEQ     L_D69C                          ; D697   0204 0003

        CMPR    R2,     R1                      ; D699   0151
        BEQ     L_D630                          ; D69A   0224 006B

L_D69C:
        SDBD                                    ; D69C   0001
        ADDI    #$8AC1, R1                      ; D69D   02F9 00C1 008A
        MVI@    R1,     R2                      ; D6A0   028A
        MOVR    R7,     R4                      ; D6A1   00BC
        ADDI    #$000C, R4                      ; D6A2   02FC 000C
        TSTR    R2                              ; D6A4   0092
        BEQ     L_D6AA                          ; D6A5   0204 0003

        MOVR    R7,     R4                      ; D6A7   00BC
        ADDI    #$00B4, R4                      ; D6A8   02FC 00B4

L_D6AA:
        JSR     R5,     L_5403                  ; D6AA   0004 0154 0003

        PULR    R7                              ; D6AD   02B7

        ADD@    R3,     R5                      ; D6AE   02DD
        ADCR    R1                              ; D6AF   0029
        MOVR    R2,     R7                      ; D6B0   0097

        ADCR    R6                              ; D6B1   002E
        MOVR    R2,     R7                      ; D6B2   0097

        COMR    R1                              ; D6B3   0019
        SAR     R2,     1                       ; D6B4   006A
        SWAP    R2,     1                       ; D6B5   0042
        MOVR    R2,     R7                      ; D6B6   0097

        ADDR    R7,     R0                      ; D6B7   00F8
        ADDR    R6,     R5                      ; D6B8   00F5
        ADD@    R6,     R4                      ; D6B9   02F4
        ADCR    R0                              ; D6BA   0028
        ADD@    R6,     R2                      ; D6BB   02F2
        BC      L_D6C5                          ; D6BC   0201 0007
        ADDR    R3,     R7                      ; D6BE   00DF

        DECLE   $02F2,  $0208,  $00AE,  $0095   ; D6BF   02F2 0208 00AE 0095
        DECLE   $0219                           ; D6C3   0219

        MOVR    R6,     R1                      ; D6C4   00B1
L_D6C5:
        MOVR    R0,     R4                      ; D6C5   0084
        DECLE   $0345,  $01D1,  $019C,  $03C0   ; D6C6   0345 01D1 019C 03C0
        DECLE   $02F3,  $003C,  $0265,  $0244   ; D6CA   02F3 003C 0265 0244
        DECLE   $027A,  $0253,  $0011,  $027C   ; D6CE   027A 0253 0011 027C
        DECLE   $018E,  $0268,  $01CD,  $0345   ; D6D2   018E 0268 01CD 0345
        DECLE   $01D1,  $038E,  $0029,  $0082   ; D6D6   01D1 038E 0029 0082
        DECLE   $027E,  $0000                   ; D6DA   027E 0000

        ADD@    R6,     R5                      ; D6DC   02F5
        ADD@    R6,     R1                      ; D6DD   02F1
        SDBD                                    ; D6DE   0001
        MVII    #$8AE9, R1                      ; D6DF   02B9 00E9 008A
        MVI@    R1,     R0                      ; D6E2   0288
        MVO     R0,     G_01B8                  ; D6E3   0240 01B8
        MVI     G_0169, R2                      ; D6E5   0282 0169
        SDBD                                    ; D6E7   0001
        ADDI    #$8AC1, R2                      ; D6E8   02FA 00C1 008A
        MVI@    R2,     R2                      ; D6EB   0292
        TSTR    R2                              ; D6EC   0092
        BEQ     L_D705                          ; D6ED   0204 0016

        MVII    #$0001, R0                      ; D6EF   02B8 0001
        MVO     R0,     G_017B                  ; D6F1   0240 017B
        MVII    #$0219, R4                      ; D6F3   02BC 0219
        MOVR    R7,     R1                      ; D6F5   00B9
        ADDI    #$0132, R1                      ; D6F6   02F9 0132
        DECR    R2                              ; D6F8   0012
        BEQ     L_D6FF                          ; D6F9   0204 0004

        MOVR    R7,     R1                      ; D6FB   00B9
        ADDI    #$0132, R1                      ; D6FC   02F9 0132
        DECR    R4                              ; D6FE   0014

L_D6FF:
        JSR     R5,     L_DDDA                  ; D6FF   0004 01DC 01DA
        DECLE   $0004                           ; D702   0004

        XORR    R7,     R4                      ; D703   01FC
        CMP@    R3,     R5                      ; D704   035D
L_D705:
        MVII    #$0061, R0                      ; D705   02B8 0061
        MVO     R0,     G_0138                  ; D707   0240 0138

        JSR     R5,     L_DE43                  ; D709   0004 01DC 0243
        DECLE   $0211                           ; D70C   0211

        JSR     R5,     L_DE43                  ; D70D   0004 01DC 0243

        MVI@    R2,     R4                      ; D710   0294

L_D711:
        JSR     R5,     L_FD6D                  ; D711   0004 01FC 016D

        RSWD    R4                              ; D714   003C
        SLL     R0,     2                       ; D715   004C
        MVI     G_0169, R0                      ; D716   0280 0169

        JSR     R5,     L_F59B                  ; D718   0004 01F4 019B
        DECLE   $0004                           ; D71B   0004

        ANDR    R2,     R4                      ; D71C   0194
        CMP@    R2,     R0                      ; D71D   0350
        MVI@    R4,     R0                      ; D71E   02A0
        PSHR    R4                              ; D71F   0274

        JSR     R5,     L_F577                  ; D720   0004 01F4 0177

        PULR    R4                              ; D723   02B4
        MVI@    R4,     R0                      ; D724   02A0

        JSR     R5,     L_F589                  ; D725   0004 01F4 0189

        PULR    R7                              ; D728   02B7

        PSHR    R5                              ; D729   0275

        JSR     R5,     L_FDD8                  ; D72A   0004 01FC 01D8

        PULR    R7                              ; D72D   02B7

        DECLE   $0275,  $0004                   ; D72E   0275 0004

        ANDR    R2,     R4                      ; D730   0194
        CMP@    R2,     R0                      ; D731   0350
        MVI@    R4,     R1                      ; D732   02A1
        MVII    #$0001, R2                      ; D733   02BA 0001
        SARC    R0,     1                       ; D735   0078
        BC      L_D630                          ; D736   0221 0107
        BNEQ    L_D73B                          ; D738   020C 0001

        NEGR    R2                              ; D73A   0022
L_D73B:
        ADDR    R2,     R1                      ; D73B   00D1
        DECLE   $03B9,  $000F,  $0014,  $0261   ; D73C   03B9 000F 0014 0261
        DECLE   $0220,  $0026,  $0275,  $0280   ; D740   0220 0026 0275 0280
        DECLE   $0137,  $0378,  $003F,  $020E   ; D744   0137 0378 003F 020E
        DECLE   $000F,  $0004                   ; D748   000F 0004

        ANDR    R2,     R4                      ; D74A   0194
        CMP@    R2,     R0                      ; D74B   0350
        INCR    R4                              ; D74C   000C
        MVO@    R0,     R4                      ; D74D   0260
        B       L_D711                          ; D74E   0220 003E

        MVI     G_0169, R4                      ; D750   0284 0169
        ADDR    R4,     R4                      ; D752   00E4
        SDBD                                    ; D753   0001
        ADDI    #$8AC9, R4                      ; D754   02FC 00C9 008A
        MOVR    R5,     R7                      ; D757   00AF

        JSR     R5,     L_FDF8                  ; D758   0004 01FC 01F8

        PULR    R7                              ; D75B   02B7

        MVO@    R3,     R3                      ; D75C   025B
        ADDR    R4,     R3                      ; D75D   00E3
        MOVR    R2,     R7                      ; D75E   0097

        ADDR    R6,     R1                      ; D75F   00F1
        MOVR    R2,     R7                      ; D760   0097

        COMR    R1                              ; D761   0019
        SAR     R2,     1                       ; D762   006A
        INCR    R2                              ; D763   000A
        MOVR    R3,     R0                      ; D764   0098
        ADD@    R6,     R4                      ; D765   02F4
        ADCR    R0                              ; D766   0028
        ADD@    R6,     R2                      ; D767   02F2
        BC      L_D771                          ; D768   0201 0007
        ADDR    R3,     R7                      ; D76A   00DF

        ADD@    R6,     R2                      ; D76B   02F2
        SKIP                                    ; D76C   0208
        MOVR    R5,     R6                      ; D76D   00AE
        MOVR    R2,     R5                      ; D76E   0095
        ADD@    R1,     R1                      ; D76F   02C9
        MVO@    R2,     R3                      ; D770   025A
L_D771:
        MVO     R4,     .BTAB.7A                ; D771   0244 027A
        DECLE   $0253,  $0011,  $027A,  $018E   ; D773   0253 0011 027A 018E
        DECLE   $0268,  $01CD,  $03C0,  $02F3   ; D777   0268 01CD 03C0 02F3
        DECLE   $003C,  $0252,  $01C1,  $0124   ; D77B   003C 0252 01C1 0124
        DECLE   $0053,  $039C,  $01EB,  $0018   ; D77F   0053 039C 01EB 0018
        DECLE   $0091,  $0384,  $02A4,  $0238   ; D783   0091 0384 02A4 0238

        CMP@    R3,     R2                      ; D787   035A
        CMP@    R2,     R2                      ; D788   0352
        MOVR    R0,     R2                      ; D789   0082
        XORR    R1,     R5                      ; D78A   01CD
        SARC    R2,     1                       ; D78B   007A
        XOR     G_02F1, R0                      ; D78C   03C0 02F1
        MVII    #$0001, R0                      ; D78E   02B8 0001
        MVO     R0,     G_017B                  ; D790   0240 017B
        MVI     G_0169, R2                      ; D792   0282 0169
        SDBD                                    ; D794   0001
        ADDI    #$8AC1, R2                      ; D795   02FA 00C1 008A
        MVI@    R2,     R2                      ; D798   0292
        MVII    #$0219, R4                      ; D799   02BC 0219
        MOVR    R7,     R1                      ; D79B   00B9
        ADDI    #$008C, R1                      ; D79C   02F9 008C
        DECR    R2                              ; D79E   0012
        BEQ     L_D7A5                          ; D79F   0204 0004

        MOVR    R7,     R1                      ; D7A1   00B9
        ADDI    #$008C, R1                      ; D7A2   02F9 008C
        DECR    R4                              ; D7A4   0014
L_D7A5:
        PSHR    R2                              ; D7A5   0272

        JSR     R5,     L_DDDA                  ; D7A6   0004 01DC 01DA
        DECLE   $0004                           ; D7A9   0004

        XORR    R7,     R4                      ; D7AA   01FC
        CMP@    R3,     R5                      ; D7AB   035D
        PULR    R2                              ; D7AC   02B2
        MVII    #$0266, R4                      ; D7AD   02BC 0266
        MOVR    R7,     R1                      ; D7AF   00B9
        ADDI    #$0084, R1                      ; D7B0   02F9 0084
        TSTR    R2                              ; D7B2   0092
        BEQ     L_D7B8                          ; D7B3   0204 0003

        MOVR    R7,     R1                      ; D7B5   00B9
        ADDI    #$0084, R1                      ; D7B6   02F9 0084

L_D7B8:
        JSR     R5,     L_DDDA                  ; D7B8   0004 01DC 01DA
        JSR     R5,     L_DE43                  ; D7BB   0004 01DC 0243
        DECLE   $0211                           ; D7BE   0211

        JSR     R5,     L_DE43                  ; D7BF   0004 01DC 0243

        MVO@    R1,     R3                      ; D7C2   0259

        JSR     R5,     L_FD6D                  ; D7C3   0004 01FC 016D

        SARC    R0,     1                       ; D7C6   0078
        ADCR    R0                              ; D7C7   0028
L_D7C8:
        MVI     G_0169, R1                      ; D7C8   0281 0169
        SLL     R1,     1                       ; D7CA   0049
        SDBD                                    ; D7CB   0001
        ADDI    #$8AD9, R1                      ; D7CC   02F9 00D9 008A
        MVI@    R1,     R0                      ; D7CF   0288
        SDBD                                    ; D7D0   0001
        MVII    #$1896, R1                      ; D7D1   02B9 0096 0018
        CMPI    #$0001, R0                      ; D7D4   0378 0001
        BNEQ    L_D7D9                          ; D7D6   020C 0001

        CLRR    R1                              ; D7D8   01C9
L_D7D9:
        MVO     R1,     .BTAB.9C                ; D7D9   0241 029C
        MVII    #$0007, R3                      ; D7DB   02BB 0007
        MVII    #$0294, R4                      ; D7DD   02BC 0294

        JSR     R5,     L_DE38                  ; D7DF   0004 01DC 0238

        PULR    R7                              ; D7E2   02B7

        PSHR    R5                              ; D7E3   0275
        TSTR    R0                              ; D7E4   0080
        BEQ     L_D630                          ; D7E5   0224 01B6

        MVI     G_0169, R1                      ; D7E7   0281 0169
        SLL     R1,     1                       ; D7E9   0049
        SDBD                                    ; D7EA   0001
        ADDI    #$8AD9, R1                      ; D7EB   02F9 00D9 008A
        MVO@    R0,     R1                      ; D7EE   0248
        B       L_D7C8                          ; D7EF   0220 0028

        PSHR    R5                              ; D7F1   0275

        JSR     R5,     L_FE65                  ; D7F2   0004 01FC 0265

        RLC     R3,     1                       ; D7F5   0053
        ADDR    R7,     R1                      ; D7F6   00F9
        MOVR    R2,     R7                      ; D7F7   0097

        DECLE   $0000,  $02BC,  $02C9,  $02A0   ; D7F8   0000 02BC 02C9 02A0
        DECLE   $0014,  $03B8,  $0007,  $0378   ; D7FC   0014 03B8 0007 0378
        DECLE   $0007,  $0224,  $01D2,  $0004   ; D800   0007 0224 01D2 0004
        DECLE   $01FC,  $03B0,  $0012,  $0006   ; D804   01FC 03B0 0012 0006
        DECLE   $0000                           ; D808   0000

        PULR    R7                              ; D809   02B7

        PSHR    R5                              ; D80A   0275
        MVI     .BTAB.C9,R0                     ; D80B   0280 02C9
        ANDI    #$0007, R0                      ; D80D   03B8 0007
        CMPI    #$0007, R0                      ; D80F   0378 0007
        BNEQ    L_D630                          ; D811   022C 01E2

        JSR     R5,     L_5401                  ; D813   0004 0154 0001
        BIDECLE $96AE                           ; D816   00AE 0096

        MOVR    R7,     R0                      ; D818   00B8
        ADDI    #$0008, R0                      ; D819   02F8 0008
        MVO     R0,     G_0183                  ; D81B   0240 0183
        SWAP    R0,     1                       ; D81D   0040
        MVO     R0,     G_0184                  ; D81E   0240 0184
        PULR    R7                              ; D820   02B7

        PSHR    R5                              ; D821   0275

        JSR     R5,     L_5401                  ; D822   0004 0154 0001
        BIDECLE $975C                           ; D825   005C 0097

        PULR    R7                              ; D827   02B7

        DECLE   $035A,  $0347,  $028D,  $027A   ; D828   035A 0347 028D 027A
        DECLE   $035A,  $03C0,  $035A,  $0340   ; D82C   035A 03C0 035A 0340
        DECLE   $02AE,  $0103,  $035A,  $03C0   ; D830   02AE 0103 035A 03C0
        DECLE   $016E,  $004A,  $025A,  $01CD   ; D834   016E 004A 025A 01CD
        DECLE   $026E,  $03C0,  $0015,  $01C8   ; D838   026E 03C0 0015 01C8
        DECLE   $0072,  $03C0,  $00FF,  $00FF   ; D83C   0072 03C0 00FF 00FF
        DECLE   $00FF,  $00EF,  $00FF,  $00FF   ; D840   00FF 00EF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00BF,  $00FF   ; D844   00FF 00FF 00BF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; D848   00FF 00FF 00FE 00FF
        DECLE   $00FF,  $007F,  $00FF,  $00FF   ; D84C   00FF 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D850   00FF 00FF 00FF 00FF
        DECLE   $00EF,  $00FF,  $00FF,  $00FF   ; D854   00EF 00FF 00FF 00FF
        DECLE   $00F7,  $00FF,  $00FF,  $00FF   ; D858   00F7 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D85C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D860   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00EF,  $00FF,  $00FF   ; D864   00FF 00EF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FB,  $00FF   ; D868   00FF 00FF 00FB 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D86C   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00F8,  $00F8,  $00FC   ; D870   00FC 00F8 00F8 00FC
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D874   00FF 00FF 00FF 00FF
        DECLE   $003F,  $001F,  $001F,  $003F   ; D878   003F 001F 001F 003F
        DECLE   $00FF,  $00FF,  $00F0,  $0063   ; D87C   00FF 00FF 00F0 0063
        DECLE   $0009,  $0200,  $0000,  $0000   ; D880   0009 0200 0000 0000
        DECLE   $000A,  $0202,  $0234,  $025C   ; D884   000A 0202 0234 025C
        DECLE   $0289,  $02A1,  $0000,  $0000   ; D888   0289 02A1 0000 0000
        DECLE   $002E,  $0214,  $021B,  $0237   ; D88C   002E 0214 021B 0237
        DECLE   $023B,  $0255,  $0268,  $027F   ; D890   023B 0255 0268 027F

        MVI     .BTAB.8C,R4                     ; D894   0284 028C
        MVI@    R3,     R7                      ; D896   029F
        MVI@    R5,     R7                      ; D897   02AF

        DECLE   $02B9,  $02E2,  $02E8,  $0000   ; D898   02B9 02E2 02E8 0000
        DECLE   $0000,  $001A,  $023F,  $0256   ; D89C   0000 001A 023F 0256
        DECLE   $0282,  $02AE,  $02B5,  $0000   ; D8A0   0282 02AE 02B5 0000

        INCR    R0                              ; D8A4   0008
        INCR    R2                              ; D8A5   000A
        MVO@    R1,     R5                      ; D8A6   0269
        PSHR    R0                              ; D8A7   0270
        ADD@    R1,     R7                      ; D8A8   02CF

        DECLE   $0000,  $0008,  $003A,  $02DE   ; D8A9   0000 0008 003A 02DE
        DECLE   $0000,  $0010,  $003A,  $0206   ; D8AD   0000 0010 003A 0206
        DECLE   $0213,  $0218,  $0221,  $023A   ; D8B1   0213 0218 0221 023A
        DECLE   $023C,  $0245,  $024F,  $0265   ; D8B5   023C 0245 024F 0265
        DECLE   $0272,  $0273,  $027A           ; D8B9   0272 0273 027A

        MVI@    R1,     R6                      ; D8BC   028E
        MVI@    R2,     R2                      ; D8BD   0292
        MVI@    R5,     R1                      ; D8BE   02A9
        PULR    R2                              ; D8BF   02B2
        ADD     .BTAB.C9,R7                     ; D8C0   02C7 02C9

        DECLE   $02CC,  $02CE,  $02D1,  $0000   ; D8C2   02CC 02CE 02D1 0000
        DECLE   $0010,  $001A,  $02D3,  $0000   ; D8C6   0010 001A 02D3 0000
        DECLE   $0018,  $000A,  $0233,  $0263   ; D8CA   0018 000A 0233 0263
        DECLE   $02B2,  $0000,  $0020,  $001C   ; D8CE   02B2 0000 0020 001C
        DECLE   $0203,  $0224,  $026D,  $02E3   ; D8D2   0203 0224 026D 02E3
        DECLE   $0000,  $0020,  $001A,  $020C   ; D8D6   0000 0020 001A 020C
        DECLE   $0210,  $022D,  $0238,  $0248   ; D8DA   0210 022D 0238 0248
        DECLE   $025E,  $0267,  $0281,  $0286   ; D8DE   025E 0267 0281 0286
        DECLE   $0291,  $02C5,  $02E5,  $02EB   ; D8E2   0291 02C5 02E5 02EB
        DECLE   $0000                           ; D8E6   0000

        NEGR    R0                              ; D8E7   0020
        RSWD    R2                              ; D8E8   003A
        MVO@    R3,     R2                      ; D8E9   0253
        MVI@    R2,     R7                      ; D8EA   0297

        DECLE   $0000,  $0020,  $002C,  $029E   ; D8EB   0000 0020 002C 029E
        DECLE   $02C9,  $0000,  $0028,  $003A   ; D8EF   02C9 0000 0028 003A
        DECLE   $0217,  $024A,  $0257,  $026E   ; D8F3   0217 024A 0257 026E
        DECLE   $0278                           ; D8F7   0278

        MVI     .BTAB.8F,R5                     ; D8F8   0285 028F
        MVI@    R4,     R7                      ; D8FA   02A7

        DECLE   $02B8,  $02C1,  $02CB,  $0000   ; D8FB   02B8 02C1 02CB 0000
        DECLE   $0028,  $000A,  $0232,  $0243   ; D8FF   0028 000A 0232 0243
        DECLE   $025A,  $026F,  $0274,  $028B   ; D903   025A 026F 0274 028B
        DECLE   $0290,  $029C,  $02A5,  $02AC   ; D907   0290 029C 02A5 02AC
        DECLE   $02BF,  $02D5,  $0000,  $0028   ; D90B   02BF 02D5 0000 0028
        DECLE   $000C,  $021D                   ; D90F   000C 021D

        MVO@    R3,     R5                      ; D911   026B
        ADD@    R2,     R7                      ; D912   02D7

        DECLE   $02DB,  $0000,  $0028,  $001A   ; D913   02DB 0000 0028 001A
        DECLE   $0261,  $026A,  $02BB,  $0000   ; D917   0261 026A 02BB 0000
        DECLE   $0030,  $003A,  $025F,  $0000   ; D91B   0030 003A 025F 0000
        DECLE   $0038,  $000A,  $0260,  $0000   ; D91F   0038 000A 0260 0000
        DECLE   $0000,  $0000,  $00FF           ; D923   0000 0000 00FF

        ADDR    R5,     R7                      ; D926   00EF
        ADDR    R2,     R7                      ; D927   00D7
        ADDR    R2,     R7                      ; D928   00D7

        MOVR    R6,     R1                      ; D929   00B1
        MOVR    R7,     R2                      ; D92A   00BA
        MOVR    R7,     R2                      ; D92B   00BA
        SARC    R2,     2                       ; D92C   007E
        SARC    R0,     2                       ; D92D   007C
        MOVR    R7,     R1                      ; D92E   00B9
        ADDR    R2,     R3                      ; D92F   00D3
        ADDR    R0,     R7                      ; D930   00C7
        ADDR    R3,     R7                      ; D931   00DF

        DECLE   $00BF                           ; D932   00BF

        ADDR    R3,     R7                      ; D933   00DF
        ADDR    R5,     R7                      ; D934   00EF

        SARC    R3,     2                       ; D935   007F
        MOVR    R3,     R7                      ; D936   009F
        ADDR    R1,     R7                      ; D937   00CF
        ADDR    R4,     R7                      ; D938   00E7

        DECLE   $00F7,  $00F3,  $00F9,  $00FE   ; D939   00F7 00F3 00F9 00FE
        DECLE   $00FE,  $00F9,  $00F3,  $00F7   ; D93D   00FE 00F9 00F3 00F7

        ADDR    R4,     R7                      ; D941   00E7
        ADDR    R1,     R7                      ; D942   00CF
        MOVR    R3,     R7                      ; D943   009F

        SARC    R3,     2                       ; D944   007F
        SARC    R3,     2                       ; D945   007F
        MOVR    R3,     R7                      ; D946   009F
        ADDR    R1,     R7                      ; D947   00CF
        ADDR    R5,     R7                      ; D948   00EF
        ADDR    R4,     R7                      ; D949   00E7

        DECLE   $00F3,  $00F9,  $00FE,  $007F   ; D94A   00F3 00F9 00FE 007F
        DECLE   $00BF                           ; D94E   00BF

        MOVR    R3,     R7                      ; D94F   009F
        ADDR    R0,     R7                      ; D950   00C7

        DECLE   $00EB,  $00FC,  $00FE,  $00FF   ; D951   00EB 00FC 00FE 00FF

        ADDR    R7,     R6                      ; D955   00FE
        ADDR    R7,     R5                      ; D956   00FD
        ADDR    R7,     R1                      ; D957   00F9
        ADDR    R4,     R3                      ; D958   00E3
        ADDR    R2,     R7                      ; D959   00D7

        DECLE   $003F,  $007F,  $00FF,  $0001   ; D95A   003F 007F 00FF 0001
        DECLE   $0002,  $0004,  $0008,  $0010   ; D95E   0002 0004 0008 0010
        DECLE   $0020,  $0040,  $0080,  $0080   ; D962   0020 0040 0080 0080
        DECLE   $0040,  $0020,  $0010,  $0008   ; D966   0040 0020 0010 0008
        DECLE   $0004,  $0002,  $0001,  $00FF   ; D96A   0004 0002 0001 00FF
        DECLE   $0002,  $0004,  $0008,  $0010   ; D96E   0002 0004 0008 0010
        DECLE   $0020,  $0040,  $0080,  $00FF   ; D972   0020 0040 0080 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D976   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D97A   0000 0000 0000 00FF
        DECLE   $0040,  $0020,  $0010,  $0008   ; D97E   0040 0020 0010 0008
        DECLE   $0004,  $0002,  $0001,  $0008   ; D982   0004 0002 0001 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; D986   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $00FF   ; D98A   0008 0008 0008 00FF
        DECLE   $0008,  $0008,  $0008,  $0008   ; D98E   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $00C0   ; D992   0008 0008 0008 00C0
        DECLE   $0030,  $000C,  $0003,  $0000   ; D996   0030 000C 0003 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D99A   0000 0000 0000 00FF
        DECLE   $0030,  $000C,  $0003,  $0000   ; D99E   0030 000C 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; D9A6   0000 0000 0000 00C0
        DECLE   $0030,  $000C,  $0003,  $00FF   ; D9AA   0030 000C 0003 00FF
        DECLE   $0000,  $0000,  $0000,  $00C0   ; D9AE   0000 0000 0000 00C0
        DECLE   $0030,  $000C,  $0003,  $0003   ; D9B2   0030 000C 0003 0003
        DECLE   $000C,  $0030,  $00C0,  $0000   ; D9B6   000C 0030 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D9BA   0000 0000 0000 00FF
        DECLE   $000C,  $0030,  $00C0,  $0000   ; D9BE   000C 0030 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; D9C6   0000 0000 0000 0003
        DECLE   $000C,  $0030,  $00C0,  $00FF   ; D9CA   000C 0030 00C0 00FF
        DECLE   $0000,  $0000,  $0000,  $0003   ; D9CE   0000 0000 0000 0003
        DECLE   $000C,  $0030,  $00C0,  $00F0   ; D9D2   000C 0030 00C0 00F0
        DECLE   $000F,  $0000,  $0000,  $0000   ; D9D6   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DA   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $000F,  $0000   ; D9DE   0000 00F0 000F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; D9E6   0000 0000 0000 00F0
        DECLE   $000F,  $0000,  $0000,  $0000   ; D9EA   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9EE   0000 0000 0000 0000
        DECLE   $0000                           ; D9F2   0000

        ADDR    R6,     R0                      ; D9F3   00F0
        INCR    R7                              ; D9F4   000F

        DECLE   $000F                           ; D9F5   000F
L_D9F6:
        ADDR    R6,     R0                      ; D9F6   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9FB   0000 0000 0000 0000
        DECLE   $000F,  $00F0,  $0000,  $0000   ; D9FF   000F 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000F,  $00F0   ; DA07   0000 0000 000F 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA0F   0000 0000 0000 0000
        DECLE   $000F,  $00F0,  $00FF,  $00F0   ; DA13   000F 00F0 00FF 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C3,  $0081   ; DA1B   0000 0000 00C3 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA1F   0000 0000 0000 0000

        MOVR    R0,     R1                      ; DA23   0081
        ADDR    R0,     R3                      ; DA24   00C3
        SARC    R0,     1                       ; DA25   0078
        SLR     R1,     1                       ; DA26   0061
        INCR    R1                              ; DA27   0009
        B       L_DAA2                          ; DA28   0200 0078

        DECLE   $0060,  $003B,  $0278,  $0013   ; DA2A   0060 003B 0278 0013
        DECLE   $0050,  $003A,  $028D,  $0013   ; DA2E   0050 003A 028D 0013
        DECLE   $0050,  $003A,  $02B5,  $0000   ; DA32   0050 003A 02B5 0000
        DECLE   $0000,  $003A,  $0218,  $0224   ; DA36   0000 003A 0218 0224
        DECLE   $0228,  $0230,  $0234,  $023B   ; DA3A   0228 0230 0234 023B
        DECLE   $0000,  $0008,  $003A,  $022B   ; DA3E   0000 0008 003A 022B
        DECLE   $0232,  $023D,  $024E,  $0000   ; DA42   0232 023D 024E 0000
        DECLE   $0010,  $003A,  $022D,  $0239   ; DA46   0010 003A 022D 0239
        DECLE   $0000,  $0018,  $003A,  $022A   ; DA4A   0000 0018 003A 022A
        DECLE   $0231,  $0235,  $0000,  $0020   ; DA4E   0231 0235 0000 0020
        DECLE   $003A,  $0233,  $0000,  $0028   ; DA52   003A 0233 0000 0028
        DECLE   $003A,  $0236,  $0242,  $0000   ; DA56   003A 0236 0242 0000
        DECLE   $0030,  $003A,  $0237           ; DA5A   0030 003A 0237

        MVO     R3,     .STIC.X.0               ; DA5D   0243 0000
        RSWD    R0                              ; DA5F   0038
        RSWD    R2                              ; DA60   003A
        MVI     .BTAB.A6,R0                     ; DA61   0280 02A6
        ADD@    R1,     R4                      ; DA63   02CC
        ADD@    R3,     R7                      ; DA64   02DF

        DECLE   $0000,  $0040,  $003A,  $0284   ; DA65   0000 0040 003A 0284
        DECLE   $02AE,  $02D8,  $02ED,  $0000   ; DA69   02AE 02D8 02ED 0000
        DECLE   $0048,  $003A,  $0293,  $02B9   ; DA6D   0048 003A 0293 02B9
        DECLE   $0000,  $0058,  $003A,  $0299   ; DA71   0000 0058 003A 0299
        DECLE   $02C3,  $0000,  $0060,  $003A   ; DA75   02C3 0000 0060 003A
        DECLE   $0282,  $02AA,  $02D2,  $02E6   ; DA79   0282 02AA 02D2 02E6
        DECLE   $0000,  $0068,  $003A,  $0296   ; DA7D   0000 0068 003A 0296
        DECLE   $02BE,  $0000,  $0070,  $003A   ; DA81   02BE 0000 0070 003A
        DECLE   $0286,  $02B2,  $0000,  $0078   ; DA85   0286 02B2 0000 0078
        DECLE   $003A,  $029C,  $0000           ; DA89   003A 029C 0000

        TSTR    R0                              ; DA8C   0080
        RSWD    R2                              ; DA8D   003A
        MVI     .BTAB.B3,R7                     ; DA8E   0287 02B3

        DECLE   $0000,  $0088,  $003A,  $029D   ; DA90   0000 0088 003A 029D
        DECLE   $0000,  $0090,  $003A,  $027E   ; DA94   0000 0090 003A 027E
        DECLE   $02A2,  $0000,  $0098,  $003A   ; DA98   02A2 0000 0098 003A
        DECLE   $0290,  $02B4,  $0000,  $00A0   ; DA9C   0290 02B4 0000 00A0
        DECLE   $003A,  $027D                   ; DAA0   003A 027D
L_DAA2:
        MVI@    R4,     R1                      ; DAA2   02A1
        DECLE   $0000                           ; DAA3   0000

        MOVR    R5,     R0                      ; DAA4   00A8
        RSWD    R2                              ; DAA5   003A
        MVI@    R1,     R7                      ; DAA6   028F

        DECLE   $0000,  $00B0,  $003A,  $0288   ; DAA7   0000 00B0 003A 0288
        DECLE   $0000,  $00B8,  $003A,  $0289   ; DAAB   0000 00B8 003A 0289
        DECLE   $0000,  $00C0,  $003A,  $028A   ; DAAF   0000 00C0 003A 028A
        DECLE   $0000,  $00C8,  $003A,  $028B   ; DAB3   0000 00C8 003A 028B
        DECLE   $0000,  $00D0,  $003A,  $027C   ; DAB7   0000 00D0 003A 027C
        DECLE   $0000,  $00D8,  $003A,  $027B   ; DABB   0000 00D8 003A 027B
        DECLE   $0000,  $00E0,  $003A,  $027A   ; DABF   0000 00E0 003A 027A
        DECLE   $0000,  $00E8,  $003A,  $0279   ; DAC3   0000 00E8 003A 0279
        DECLE   $0000,  $00F0,  $003A,  $028C   ; DAC7   0000 00F0 003A 028C
        DECLE   $0000,  $00F8,  $002E,  $021A   ; DACB   0000 00F8 002E 021A
        DECLE   $0000,  $0000,  $0000           ; DACF   0000 0000 0000

        DECR    R0                              ; DAD2   0010
        RSWD    R0                              ; DAD3   0038
        RSWD    R0                              ; DAD4   0038
        RSWD    R0                              ; DAD5   0038
        RSWD    R0                              ; DAD6   0038
        RSWD    R0                              ; DAD7   0038
        RSWD    R0                              ; DAD8   0038
        DECR    R0                              ; DAD9   0010
        MOVR    R7,     R5                      ; DADA   00BD
        SLLC    R1,     2                       ; DADB   005D
        SARC    R1,     2                       ; DADC   007D
        SLLC    R2,     1                       ; DADD   005A
        COMR    R2                              ; DADE   001A
        COMR    R1                              ; DADF   0019
        DECR    R4                              ; DAE0   0014
        DECR    R0                              ; DAE1   0010
        SWAP    R2,     1                       ; DAE2   0042
        MOVR    R4,     R2                      ; DAE3   00A2
        MOVR    R0,     R2                      ; DAE4   0082
        MOVR    R4,     R5                      ; DAE5   00A5
        ADDR    R4,     R5                      ; DAE6   00E5
        ADDR    R4,     R6                      ; DAE7   00E6
        ADDR    R5,     R3                      ; DAE8   00EB
        ADDR    R5,     R7                      ; DAE9   00EF

        DECLE   $0010,  $0014,  $0019,  $001A   ; DAEA   0010 0014 0019 001A
        DECLE   $005A,  $007D,  $005D,  $00BD   ; DAEE   005A 007D 005D 00BD
        DECLE   $0000,  $0000,  $0000,  $0010   ; DAF2   0000 0000 0000 0010
        DECLE   $0038,  $0038,  $0038,  $0010   ; DAF6   0038 0038 0038 0010
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; DAFA   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DAFE   00FF 00FF 00FF 00FF
        DECLE   $00EF,  $00EB,  $00E6,  $00E5   ; DB02   00EF 00EB 00E6 00E5
        DECLE   $00A5,  $0082,  $00A2,  $0042   ; DB06   00A5 0082 00A2 0042
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; DB0A   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB0E   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $00FF   ; DB12   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB16   00FF 00FF 00FF 00FF
        DECLE   $0050,  $0063,  $0009,  $0200   ; DB1A   0050 0063 0009 0200
        DECLE   $00A0,  $0060,  $000B,  $0250   ; DB1E   00A0 0060 000B 0250
        DECLE   $0000,  $0003,  $000A,  $0272   ; DB22   0000 0003 000A 0272
        DECLE   $0295,  $029C,  $02B5,  $02C6   ; DB26   0295 029C 02B5 02C6
        DECLE   $02CD,  $02E0,  $0000,  $0008   ; DB2A   02CD 02E0 0000 0008
        DECLE   $002A,  $022A,  $022E,  $023B   ; DB2E   002A 022A 022E 023B
        DECLE   $0243,  $0000,  $0009,  $002A   ; DB32   0243 0000 0009 002A
        DECLE   $025A,  $0299,  $02AB,  $02ED   ; DB36   025A 0299 02AB 02ED
        DECLE   $0000,  $000C,  $002A,  $02AE   ; DB3A   0000 000C 002A 02AE
        DECLE   $02C1,  $0000,  $0014,  $002A   ; DB3E   02C1 0000 0014 002A
        DECLE   $0229,  $0241,  $0259,  $02AA   ; DB42   0229 0241 0259 02AA
        DECLE   $02DD,  $02EE,  $0000           ; DB46   02DD 02EE 0000

        DECR    R4                              ; DB49   0014
        INCR    R2                              ; DB4A   000A
        ADD@    R3,     R4                      ; DB4B   02DC
        ADD@    R3,     R6                      ; DB4C   02DE
        ADD@    R5,     R7                      ; DB4D   02EF

        DECLE   $0000,  $0011,  $002A,  $02BE   ; DB4E   0000 0011 002A 02BE
        DECLE   $0000,  $001C,  $002A,  $023A   ; DB52   0000 001C 002A 023A
        DECLE   $023E,  $0242,  $024B,  $024D   ; DB56   023E 0242 024B 024D
        DECLE   $024F,  $029A,  $02AD,  $02C2   ; DB5A   024F 029A 02AD 02C2
        DECLE   $02C3,  $02C4,  $0000,  $001D   ; DB5E   02C3 02C4 0000 001D
        DECLE   $000A,  $027B,  $0000,  $0019   ; DB62   000A 027B 0000 0019
        DECLE   $002A,  $02BF,  $0000,  $0023   ; DB66   002A 02BF 0000 0023
        DECLE   $0008,  $0201,  $0212,  $0214   ; DB6A   0008 0201 0212 0214
        DECLE   $0219,  $0223,  $0225,  $022C   ; DB6E   0219 0223 0225 022C
        DECLE   $0234,  $0236,  $0000,  $0023   ; DB72   0234 0236 0000 0023
        DECLE   $000A,  $027D,  $0000,  $0029   ; DB76   000A 027D 0000 0029
        DECLE   $000E,  $0253,  $0260,  $026B   ; DB7A   000E 0253 0260 026B
        DECLE   $026E,  $02D4,  $02D8,  $0000   ; DB7E   026E 02D4 02D8 0000
        DECLE   $0030,  $002A,  $0215,  $0226   ; DB82   0030 002A 0215 0226
        DECLE   $0228,  $022D,  $0237,  $0239   ; DB86   0228 022D 0237 0239
        DECLE   $023F,  $0240,  $0245,  $0248   ; DB8A   023F 0240 0245 0248
        DECLE   $024A,  $024C,  $0000,  $0034   ; DB8E   024A 024C 0000 0034
        DECLE   $002A,  $023C,  $023D           ; DB92   002A 023C 023D

        MVO@    R6,     R1                      ; DB95   024E
        MVI@    R5,     R7                      ; DB96   02AF

        DECLE   $02C0,  $0000,  $0031,  $002A   ; DB97   02C0 0000 0031 002A
        DECLE   $0258,  $0274,  $0286,  $0291   ; DB9B   0258 0274 0286 0291
        DECLE   $0296,  $029B,  $02A9,  $02AC   ; DB9F   0296 029B 02A9 02AC
        DECLE   $02B0,  $02C5,  $02C9,  $02DA   ; DBA3   02B0 02C5 02C9 02DA
        DECLE   $02E1,  $02EB,  $0000           ; DBA7   02E1 02EB 0000

        RSWD    R1                              ; DBAA   0039
        INCR    R6                              ; DBAB   000E
        MVO@    R1,     R2                      ; DBAC   0251
        MVO@    R2,     R2                      ; DBAD   0252
        MVO@    R1,     R4                      ; DBAE   0261
        MVO@    R2,     R4                      ; DBAF   0262
        MVO@    R4,     R5                      ; DBB0   026C
        MVO@    R5,     R5                      ; DBB1   026D
        ADD@    R2,     R5                      ; DBB2   02D5
        ADD@    R2,     R7                      ; DBB3   02D7

        DECLE   $0000,  $0041,  $000E,  $0250   ; DBB4   0000 0041 000E 0250
        DECLE   $0263,  $02D6,  $0000,  $0000   ; DBB8   0263 02D6 0000 0000
        DECLE   $0000,  $00F0,  $0060,  $000F   ; DBBC   0000 00F0 0060 000F
        DECLE   $0200,  $0000,  $0000,  $0000   ; DBC0   0200 0000 0000 0000
        DECLE   $03FE,  $0061,  $009C,  $00AE   ; DBC4   03FE 0061 009C 00AE
        DECLE   $009C,  $002E,  $0051,  $00BD   ; DBC8   009C 002E 0051 00BD
        DECLE   $009C,  $002C,  $00D0,  $009B   ; DBCC   009C 002C 00D0 009B
        DECLE   $0000,  $0089,  $005F,  $0000   ; DBD0   0000 0089 005F 0000
        DECLE   $02F4,  $0028,  $02F2,  $0202   ; DBD4   02F4 0028 02F2 0202
        DECLE   $00A1,  $00DE,  $02F2,  $0218   ; DBD8   00A1 00DE 02F2 0218
        DECLE   $00F7,  $00D7,  $02F3,  $0078   ; DBDC   00F7 00D7 02F3 0078
        DECLE   $023D,  $006E,  $0092,  $0353   ; DBE0   023D 006E 0092 0353
        DECLE   $00E8,  $025A,  $00C0,  $0184   ; DBE4   00E8 025A 00C0 0184
        DECLE   $0354,  $0244,  $039A,  $001A   ; DBE8   0354 0244 039A 001A
        DECLE   $00AE,  $0222,  $009A,  $00A8   ; DBEC   00AE 0222 009A 00A8
        DECLE   $008B,  $007E,  $01BE,  $0000   ; DBF0   008B 007E 01BE 0000

        ADD@    R6,     R5                      ; DBF4   02F5
        ADD@    R6,     R1                      ; DBF5   02F1
        MVII    #$0002, R0                      ; DBF6   02B8 0002
        MVO     R0,     G_0174                  ; DBF8   0240 0174
L_DBFA:
        SDBD                                    ; DBFA   0001
        MVII    #$8AFD, R1                      ; DBFB   02B9 00FD 008A
        MVI@    R1,     R0                      ; DBFE   0288
        SDBD                                    ; DBFF   0001
        MVII    #$08C7, R2                      ; DC00   02BA 00C7 0008
        TSTR    R0                              ; DC03   0080
        BNEQ    L_DC08                          ; DC04   020C 0002

        SUBI    #$0058, R2                      ; DC06   033A 0058
L_DC08:
        MVO     R2,     .BTAB.61                ; DC08   0242 0261
        TSTR    R0                              ; DC0A   0080
        BEQ     L_DC4A                          ; DC0B   0204 003D

        MVII    #$027A, R4                      ; DC0D   02BC 027A

        JSR     R5,     L_DDD3                  ; DC0F   0004 01DC 01D3
        DECLE   $01C1,  $0124,  $0053,  $025A   ; DC12   01C1 0124 0053 025A
        DECLE   $0005,  $00A4,  $0053,  $0083   ; DC16   0005 00A4 0053 0083
        DECLE   $0392,  $0093,  $0345,  $01D1   ; DC1A   0392 0093 0345 01D1
        DECLE   $0044,  $0345,  $0104,  $0163   ; DC1E   0044 0345 0104 0163
        DECLE   $03C0,  $0280,  $01BF,  $0004   ; DC22   03C0 0280 01BF 0004

        XORR    R7,     R4                      ; DC26   01FC
        CMP@    R2,     R6                      ; DC27   0356
        MVII    #$0001, R0                      ; DC28   02B8 0001
        MVO     R0,     G_017B                  ; DC2A   0240 017B
        MVII    #$02A3, R4                      ; DC2C   02BC 02A3

        JSR     R5,     L_DDD3                  ; DC2E   0004 01DC 01D3
        DECLE   $027A,  $026E,  $01FC,  $003A   ; DC31   027A 026E 01FC 003A
        DECLE   $002E,  $0273,  $01CC,  $038B   ; DC35   002E 0273 01CC 038B
        DECLE   $034B,  $0085,  $027C,  $023A   ; DC39   034B 0085 027C 023A
        DECLE   $0228                           ; DC3D   0228

        ADDR    R0,     R7                      ; DC3E   00C7

        DECLE   $027A,  $03C0,  $0004,  $01FC   ; DC3F   027A 03C0 0004 01FC
        DECLE   $035D,  $0280,  $01C0,  $0004   ; DC43   035D 0280 01C0 0004

        ANDR    R3,     R4                      ; DC47   019C
        RLC     R2,     1                       ; DC48   0052
L_DC49:
        PULR    R7                              ; DC49   02B7

L_DC4A:
        MVII    #$0278, R4                      ; DC4A   02BC 0278
        MVII    #$0078, R0                      ; DC4C   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; DC4E   0004 0114 0338

        PULR    R7                              ; DC51   02B7

        DECLE   $0275,  $004C,  $0270,  $004C   ; DC52   0275 004C 0270 004C
        DECLE   $02F0,  $02F8,  $02A3,  $0084   ; DC56   02F0 02F8 02A3 0084
        DECLE   $0004,  $01FC,  $03B0,  $0008   ; DC5A   0004 01FC 03B0 0008
        DECLE   $0006,  $0000                   ; DC5E   0006 0000

        PULR    R7                              ; DC60   02B7

        PSHR    R5                              ; DC61   0275
        SDBD                                    ; DC62   0001
        MVII    #$8AFD, R3                      ; DC63   02BB 00FD 008A
        CLRR    R4                              ; DC66   01E4

        JSR     R5,     L_FE65                  ; DC67   0004 01FC 0265
        DECLE   $0059,  $007D,  $009C,  $004E   ; DC6A   0059 007D 009C 004E
        DECLE   $0085,  $009C,  $0054,  $0095   ; DC6E   0085 009C 0054 0095
        DECLE   $009C,  $0042,  $0094,  $009C   ; DC72   009C 0042 0094 009C
        DECLE   $004C,  $0093,  $009C,  $0052   ; DC76   004C 0093 009C 0052
        DECLE   $0092,  $009C,  $0000           ; DC7A   0092 009C 0000

        MVI@    R3,     R4                      ; DC7D   029C
        TSTR    R4                              ; DC7E   00A4
        BNEQ    L_DC49                          ; DC7F   022C 0037

        INCR    R4                              ; DC81   000C
        MVO@    R4,     R3                      ; DC82   025C
        B       L_DBFA                          ; DC83   0220 008A

        MVI@    R3,     R4                      ; DC85   029C
        TSTR    R4                              ; DC86   00A4
        BEQ     L_DC49                          ; DC87   0224 003F

        CLRR    R4                              ; DC89   01E4
        MVO@    R4,     R3                      ; DC8A   025C
        MVI     G_0173, R2                      ; DC8B   0282 0173

        JSR     R5,     L_FED5                  ; DC8D   0004 01FC 02D5

        B       L_DBFA                          ; DC90   0220 0097

        DECLE   $000C,  $000C,  $000C,  $0298   ; DC92   000C 000C 000C 0298
        DECLE   $0080,  $0224,  $004F,  $0280   ; DC96   0080 0224 004F 0280
        DECLE   $01C0,  $0144,  $0224,  $0054   ; DC9A   01C0 0144 0224 0054
        DECLE   $0274,  $0004,  $019C,  $0052   ; DC9E   0274 0004 019C 0052
        DECLE   $02B0,  $0240,  $01C0,  $0001   ; DCA2   02B0 0240 01C0 0001
        DECLE   $02B9,  $00FC,  $008A,  $0248   ; DCA6   02B9 00FC 008A 0248
        DECLE   $0004                           ; DCAA   0004

        ANDR    R3,     R4                      ; DCAB   019C
        RLC     R2,     1                       ; DCAC   0052
        PULR    R7                              ; DCAD   02B7

        DECLE   $0275,  $0001,  $02B9,  $00FD   ; DCAE   0275 0001 02B9 00FD
        DECLE   $008A,  $0289,  $0089,  $0224   ; DCB2   008A 0289 0089 0224
        DECLE   $006D,  $0004,  $01FC,  $03BF   ; DCB6   006D 0004 01FC 03BF

        MVO     R0,     G_01BF                  ; DCBA   0240 01BF
        PULR    R7                              ; DCBC   02B7

        PSHR    R5                              ; DCBD   0275
        SDBD                                    ; DCBE   0001
        MVII    #$8AFD, R1                      ; DCBF   02B9 00FD 008A
        MVI@    R1,     R1                      ; DCC2   0289
        TSTR    R1                              ; DCC3   0089
        BEQ     L_DC49                          ; DCC4   0224 007C

        MVI     G_0173, R0                      ; DCC6   0280 0173
        MOVR    R7,     R4                      ; DCC8   00BC
        ADDI    #$000C, R4                      ; DCC9   02FC 000C
        TSTR    R0                              ; DCCB   0080
        BEQ     L_DCD1                          ; DCCC   0204 0003

        MOVR    R7,     R4                      ; DCCE   00BC
        ADDI    #$00A0, R4                      ; DCCF   02FC 00A0

L_DCD1:
        JSR     R5,     L_5403                  ; DCD1   0004 0154 0003

        PULR    R7                              ; DCD4   02B7

        DECLE   $021F                           ; DCD5   021F

        ADCR    R2                              ; DCD6   002A
        MOVR    R3,     R5                      ; DCD7   009D
        RSWD    R0                              ; DCD8   0038
        MOVR    R3,     R5                      ; DCD9   009D
        GSWD    R2                              ; DCDA   0032
        MOVR    R3,     R5                      ; DCDB   009D
        ADDR    R1,     R7                      ; DCDC   00CF
        ADDR    R2,     R7                      ; DCDD   00D7
        ADDR    R1,     R7                      ; DCDE   00CF
        ADDR    R2,     R7                      ; DCDF   00D7

        DECLE   $02F4,  $0028,  $02F2,  $0204   ; DCE0   02F4 0028 02F2 0204
        DECLE   $00F7,  $00D7,  $0216,  $01C1   ; DCE4   00F7 00D7 0216 01C1
        DECLE   $0124,  $0053,  $025A,  $0005   ; DCE8   0124 0053 025A 0005
        DECLE   $00A4,  $0053,  $0083,  $03C0   ; DCEC   00A4 0053 0083 03C0
        DECLE   $02F7,  $0009,  $02C9,  $01C1   ; DCF0   02F7 0009 02C9 01C1
        DECLE   $013E,  $017A,  $035A,  $0005   ; DCF4   013E 017A 035A 0005
        DECLE   $00A4,  $0053,  $0083,  $0341   ; DCF8   00A4 0053 0083 0341
        DECLE   $031C,  $0345,  $01D1,  $0044   ; DCFC   031C 0345 01D1 0044
        DECLE   $0345,  $0104,  $0163,  $03CD   ; DD00   0345 0104 0163 03CD
        DECLE   $03C0,  $02F5,  $02F1,  $0004   ; DD04   03C0 02F5 02F1 0004
        DECLE   $01FC,  $0149,  $0004,  $01D0   ; DD08   01FC 0149 0004 01D0
        DECLE   $03ED,  $0004,  $01DC,  $0243   ; DD0C   03ED 0004 01DC 0243
        DECLE   $02CE,  $0004                   ; DD10   02CE 0004

        ANDR    R3,     R4                      ; DD12   019C
        SUBR    R3,     R7                      ; DD13   011F

        SDBD                                    ; DD14   0001
        MVII    #$08C7, R0                      ; DD15   02B8 00C7 0008
        BNEQ    L_DD1C                          ; DD18   020C 0002

        SUBI    #$0058, R0                      ; DD1A   0338 0058
L_DD1C:
        MVO     R0,     .BTAB.EB                ; DD1C   0240 02EB
        PULR    R7                              ; DD1E   02B7

        PSHR    R5                              ; DD1F   0275
        MVI     G_0169, R0                      ; DD20   0280 0169

        JSR     R5,     L_FDB3                  ; DD22   0004 01FC 01B3

        ADDI    #$000C, R1                      ; DD25   02F9 000C
        MVI@    R1,     R2                      ; DD27   028A
        TSTR    R2                              ; DD28   0092
        PULR    R7                              ; DD29   02B7

        PSHR    R5                              ; DD2A   0275

        JSR     R5,     L_FE56                  ; DD2B   0004 01FC 0256
        DECLE   $0240,  $0169,  $0220,  $0027   ; DD2E   0240 0169 0220 0027

        PSHR    R5                              ; DD32   0275

        JSR     R5,     L_6A20                  ; DD33   0004 0168 0220
        DECLE   $0220,  $002D,  $0275,  $0270   ; DD36   0220 002D 0275 0270
        DECLE   $0004                           ; DD3A   0004

        ANDR    R3,     R4                      ; DD3B   019C
        SUBR    R3,     R7                      ; DD3C   011F

        PULR    R0                              ; DD3D   02B0
        MOVR    R2,     R4                      ; DD3E   0094
        MOVR    R1,     R3                      ; DD3F   008B

        JSR     R5,     L_FE65                  ; DD40   0004 01FC 0265
        DECLE   $0059,  $004A,  $009D,  $004E   ; DD43   0059 004A 009D 004E
        DECLE   $0050,  $009D,  $0000           ; DD47   0050 009D 0000

        TSTR    R4                              ; DD4A   00A4
        BNEQ    L_DC49                          ; DD4B   022C 0103

        INCR    R4                              ; DD4D   000C
        B       L_DD54                          ; DD4E   0200 0004

        TSTR    R4                              ; DD50   00A4
        BEQ     L_DC49                          ; DD51   0224 0109

        CLRR    R4                              ; DD53   01E4
L_DD54:
        MVO@    R4,     R3                      ; DD54   025C
        DECLE   $0001,  $02BD,  $00BE,  $008A   ; DD55   0001 02BD 00BE 008A
        DECLE   $02A8,  $0080,  $0224,  $0052   ; DD59   02A8 0080 0224 0052
        DECLE   $0340,  $0169,  $0204,  $0009   ; DD5D   0340 0169 0204 0009
        DECLE   $02A8,  $0340,  $0169,  $022C   ; DD61   02A8 0340 0169 022C
        DECLE   $005B                           ; DD65   005B

        ADDI    #$0010, R3                      ; DD66   02FB 0010
        B       L_DD6C                          ; DD68   0200 0002

        SUBI    #$0010, R3                      ; DD6A   033B 0010
L_DD6C:
        MVO@    R4,     R3                      ; DD6C   025C
        DECLE   $0220,  $0064                   ; DD6D   0220 0064

        AND@    R3,     R4                      ; DD6F   039C
        ADDR    R2,     R2                      ; DD70   00D2
        MOVR    R3,     R5                      ; DD71   009D
        ADDR    R1,     R7                      ; DD72   00CF
        ADDR    R2,     R7                      ; DD73   00D7
        ADDR    R1,     R7                      ; DD74   00CF
        ADDR    R2,     R7                      ; DD75   00D7

        DECLE   $0035,  $0060,  $0001           ; DD76   0035 0060 0001

        ADD@    R6,     R5                      ; DD79   02F5
        ADD@    R6,     R1                      ; DD7A   02F1

        JSR     R5,     L_5FCC                  ; DD7B   0004 015C 03CC
        JSR     R5,     L_6005                  ; DD7E   0004 0160 0005
L_DD81:
        JSR     R5,     L_60BF                  ; DD81   0004 0160 00BF

L_DD84:
        MVI     G_01C0, R0                      ; DD84   0280 01C0
        SDBD                                    ; DD86   0001
        MVII    #$8AFE, R1                      ; DD87   02B9 00FE 008A
        ADDR    R0,     R1                      ; DD8A   00C1
        MVI@    R1,     R2                      ; DD8B   028A
        CMPI    #$0001, R2                      ; DD8C   037A 0001
        BLE     L_DC49                          ; DD8E   0226 0146

        SDBD                                    ; DD90   0001
        MVII    #$47C7, R3                      ; DD91   02BB 00C7 0047
        MVI@    R3,     R3                      ; DD94   029B
        SDBD                                    ; DD95   0001
        ADDI    #$5E03, R3                      ; DD96   02FB 0003 005E
        MVI@    R3,     R3                      ; DD99   029B
        SWAP    R3,     1                       ; DD9A   0043
        DECR    R2                              ; DD9B   0012
        MVII    #$0200, R4                      ; DD9C   02BC 0200
        CMPI    #$0001, R0                      ; DD9E   0378 0001
        BGT     L_DDB8                          ; DDA0   020E 0016
        BNEQ    L_DDAE                          ; DDA2   020C 000A

        MOVR    R2,     R5                      ; DDA4   0095
        MVII    #$02DC, R4                      ; DDA5   02BC 02DC
L_DDA7:
        DECR    R5                              ; DDA7   0015
        BEQ     L_DDAE                          ; DDA8   0204 0004

        SUBI    #$0014, R4                      ; DDAA   033C 0014
        B       L_DDA7                          ; DDAC   0220 0006

L_DDAE:
        MVII    #$0014, R1                      ; DDAE   02B9 0014
L_DDB0:
        MVO@    R3,     R4                      ; DDB0   0263
        DECR    R1                              ; DDB1   0011
        BNEQ    L_DDB0                          ; DDB2   022C 0003

        DECR    R2                              ; DDB4   0012
        BNEQ    L_DDAE                          ; DDB5   022C 0008
        PULR    R7                              ; DDB7   02B7

L_DDB8:
        SARC    R0,     1                       ; DDB8   0078
        BNC     L_DDC4                          ; DDB9   0209 0009

        MVII    #$0213, R4                      ; DDBB   02BC 0213
        MOVR    R2,     R5                      ; DDBD   0095
L_DDBE:
        DECR    R5                              ; DDBE   0015
        BEQ     L_DDC4                          ; DDBF   0204 0003

        DECR    R4                              ; DDC1   0014
        B       L_DDBE                          ; DDC2   0220 0005

L_DDC4:
        MOVR    R2,     R1                      ; DDC4   0091
        MOVR    R4,     R5                      ; DDC5   00A5
L_DDC6:
        MVO@    R3,     R4                      ; DDC6   0263
        DECR    R1                              ; DDC7   0011
        BNEQ    L_DDC6                          ; DDC8   022C 0003

        MOVR    R5,     R4                      ; DDCA   00AC
        ADDI    #$0014, R4                      ; DDCB   02FC 0014
        CMPI    #$02F0, R4                      ; DDCD   037C 02F0
        BLT     L_DDC4                          ; DDCF   0225 000C
        PULR    R7                              ; DDD1   02B7

        PSHR    R5                              ; DDD2   0275
L_DDD3:
        MVI     G_01C0, R1                      ; DDD3   0281 01C0
        MOVR    R1,     R2                      ; DDD5   008A
        SDBD                                    ; DDD6   0001
        ADDI    #$8AFE, R2                      ; DDD7   02FA 00FE 008A
L_DDDA:
        MVI@    R2,     R3                      ; DDDA   0293
        MVII    #$0001, R4                      ; DDDB   02BC 0001
        CMPI    #$0001, R1                      ; DDDD   0379 0001
        BGT     L_DDFC                          ; DDDF   020E 001B
        BNEQ    L_DDE4                          ; DDE1   020C 0001

        NEGR    R4                              ; DDE3   0024
L_DDE4:
        SARC    R0,     1                       ; DDE4   0078
        BNC     L_DC49                          ; DDE5   0229 019D
        BNEQ    L_DDEA                          ; DDE7   020C 0001

        NEGR    R4                              ; DDE9   0024
L_DDEA:
        ADDR    R4,     R3                      ; DDEA   00E3
        BPL     L_DDEE                          ; DDEB   0203 0001

        CLRR    R3                              ; DDED   01DB
L_DDEE:
        CMPI    #$000C, R3                      ; DDEE   037B 000C
        BLE     L_DDF4                          ; DDF0   0206 0002

        MVII    #$000C, R3                      ; DDF2   02BB 000C
L_DDF4:
        MVI@    R2,     R1                      ; DDF4   0291
        MVO@    R3,     R2                      ; DDF5   0253
        CMPR    R1,     R3                      ; DDF6   014B
        BGT     L_DD84                          ; DDF7   022E 0074
        BLT     L_DD81                          ; DDF9   0225 0079
        PULR    R7                              ; DDFB   02B7

L_DDFC:
        CMPI    #$0002, R1                      ; DDFC   0379 0002
        BEQ     L_DE01                          ; DDFE   0204 0001

        NEGR    R4                              ; DE00   0024
L_DE01:
        SARC    R0,     1                       ; DE01   0078
        BC      L_DC49                          ; DE02   0221 01BA
        BEQ     L_DE07                          ; DE04   0204 0001

        NEGR    R4                              ; DE06   0024
L_DE07:
        ADDR    R4,     R3                      ; DE07   00E3
        BPL     L_DE0B                          ; DE08   0203 0001

        CLRR    R3                              ; DE0A   01DB
L_DE0B:
        CMPI    #$0014, R3                      ; DE0B   037B 0014
        BLE     L_DDF4                          ; DE0D   0226 001A

        MVII    #$0014, R3                      ; DE0F   02BB 0014
        B       L_DDF4                          ; DE11   0220 001E

        DECLE   $03FF,  $0094,  $009E,  $00A9   ; DE13   03FF 0094 009E 00A9
        DECLE   $009E,  $00CD,  $009E,  $002E   ; DE17   009E 00CD 009E 002E
        DECLE   $0051,  $00D4,  $009E,  $002C   ; DE1B   0051 00D4 009E 002C
        DECLE   $0021,  $009E,  $0000,  $0089   ; DE1F   0021 009E 0000 0089
        DECLE   $005F,  $0000                   ; DE23   005F 0000

        ADD@    R6,     R4                      ; DE25   02F4
        ADCR    R0                              ; DE26   0028
        ADD@    R6,     R2                      ; DE27   02F2
L_DE28:
        BOV     L_DECB                          ; DE28   0202 00A1

        DECLE   $00DE,  $02F2,  $021A           ; DE2A   00DE 02F2 021A

        ADDR    R7,     R6                      ; DE2D   00FE
        ADDR    R2,     R7                      ; DE2E   00D7

        ADD@    R6,     R3                      ; DE2F   02F3
        RLC     R0,     1                       ; DE30   0050
        MVO@    R1,     R2                      ; DE31   0251
        MVO     R4,     .BTAB.7A                ; DE32   0244 027A
        MVO     R2,     G_01D1                  ; DE34   0242 01D1
        MOVR    R3,     R2                      ; DE36   009A
        SLL     R2,     2                       ; DE37   004E
L_DE38:
        CMPR    R5,     R6                      ; DE38   016E
        DECLE   $023E,  $0000                   ; DE39   023E 0000

        MVO@    R5,     R4                      ; DE3B   0265
        MVO     R4,     .BTAB.7A                ; DE3C   0244 027A
        MVO     R2,     G_01D1                  ; DE3E   0242 01D1
        MOVR    R3,     R2                      ; DE40   009A
        CMPR    R5,     R6                      ; DE41   016E
        SWAP    R0,     1                       ; DE42   0040
L_DE43:
        MVO@    R0,     R5                      ; DE43   0268
        XORR    R1,     R5                      ; DE44   01CD
        XOR     .BTAB.79,R0                     ; DE45   03C0 0279
        ADCR    R6                              ; DE47   002E
        ANDR    R6,     R4                      ; DE48   01B4
        MVO@    R2,     R3                      ; DE49   025A
        CMPR    R5,     R0                      ; DE4A   0168
        MVI@    R4,     R4                      ; DE4B   02A4
L_DE4C:
        MVO@    R6,     R3                      ; DE4C   025E
        DECLE   $01BE,  $0000                   ; DE4D   01BE 0000
L_DE4F:
        ADD@    R6,     R5                      ; DE4F   02F5
        DECLE   $02F1,  $02B8,  $0080,  $0240   ; DE50   02F1 02B8 0080 0240
        DECLE   $0128,  $02B8,  $0003,  $0240   ; DE54   0128 02B8 0003 0240
        DECLE   $0174,  $0280,  $01C4,  $0004   ; DE58   0174 0280 01C4 0004

        XORR    R7,     R4                      ; DE5C   01FC
        CMP@    R2,     R6                      ; DE5D   0356
L_DE5E:
        SDBD                                    ; DE5E   0001
        MVII    #$8AF6, R4                      ; DE5F   02BC 00F6 008A
        MVI@    R4,     R0                      ; DE62   02A0
        SDBD                                    ; DE63   0001
        MVII    #$08C7, R2                      ; DE64   02BA 00C7 0008
        TSTR    R0                              ; DE67   0080
        BNEQ    L_DE6C                          ; DE68   020C 0002

        SUBI    #$0058, R2                      ; DE6A   033A 0058
L_DE6C:
        MVO     R2,     .BTAB.86                ; DE6C   0242 0286
        TSTR    R0                              ; DE6E   0080
        BEQ     L_DE8C                          ; DE6F   0204 001B

        MVI@    R4,     R0                      ; DE71   02A0
L_DE72:
        MVII    #$0007, R3                      ; DE72   02BB 0007
        MVII    #$0294, R4                      ; DE74   02BC 0294
        INCR    R7                              ; DE76   000F

L_DE77:
        CLRR    R0                              ; DE77   01C0

L_DE78:
        JSR     R5,     L_DE38                  ; DE78   0004 01DC 0238

        CMPI    #$0299, R4                      ; DE7B   037C 0299
        BLT     L_DE77                          ; DE7D   0225 0007

        MVII    #$028E, R4                      ; DE7F   02BC 028E

        JSR     R5,     L_DDD3                  ; DE81   0004 01DC 01D3

        MOVR    R2,     R5                      ; DE84   0095
        MOVR    R2,     R1                      ; DE85   0091
        SUB@    R3,     R4                      ; DE86   031C
        XORR    R5,     R6                      ; DE87   01EE
        SUBR    R1,     R5                      ; DE88   010D
        PSHR    R2                              ; DE89   0272
        XOR     .BTAB.B7,R0                     ; DE8A   03C0 02B7
L_DE8C:
        MVII    #$028C, R4                      ; DE8C   02BC 028C
        MVII    #$0028, R0                      ; DE8E   02B8 0028

        JSR     R5,     X_FILL_ZERO             ; DE90   0004 0114 0338

        PULR    R7                              ; DE93   02B7

        DECLE   $0275,  $0080,  $0224,  $000C   ; DE94   0275 0080 0224 000C
        DECLE   $0282,  $0173,  $037A,  $0002   ; DE98   0282 0173 037A 0002
        DECLE   $022C,  $0012,  $0001,  $02BC   ; DE9C   022C 0012 0001 02BC
        DECLE   $00F6,  $008A,  $02A2,  $0092   ; DEA0   00F6 008A 02A2 0092
        DECLE   $0224,  $001A                   ; DEA4   0224 001A

        MVO@    R0,     R4                      ; DEA6   0260
        B       L_DE72                          ; DEA7   0220 0036

        DECLE   $0275,  $0282,  $0173,  $037A   ; DEA9   0275 0282 0173 037A
        DECLE   $0002,  $022C,  $0024           ; DEAD   0002 022C 0024

        SDBD                                    ; DEB0   0001
        MVII    #$8AF6, R4                      ; DEB1   02BC 00F6 008A
        MVI@    R4,     R3                      ; DEB4   02A3

        JSR     R5,     L_FE65                  ; DEB5   0004 01FC 0265
        DECLE   $0059,  $00BF                   ; DEB8   0059 00BF

        MOVR    R3,     R6                      ; DEBA   009E
        SLL     R2,     2                       ; DEBB   004E
        ADDR    R0,     R7                      ; DEBC   00C7

        DECLE   $009E,  $0000,  $009B,  $022C   ; DEBD   009E 0000 009B 022C
        DECLE   $0036                           ; DEC1   0036

        INCR    R3                              ; DEC2   000B
L_DEC3:
        DECR    R4                              ; DEC3   0014
        MVO@    R3,     R4                      ; DEC4   0263
        B       L_DE5E                          ; DEC5   0220 0068

        DECLE   $009B,  $0224,  $003E           ; DEC7   009B 0224 003E

        CLRR    R3                              ; DECA   01DB
L_DECB:
        B       L_DEC3                          ; DECB   0220 0009

        DECLE   $0275,  $0004,  $01FC,  $03BF   ; DECD   0275 0004 01FC 03BF

        MVO     R0,     G_01C4                  ; DED1   0240 01C4
        PULR    R7                              ; DED3   02B7

        DECLE   $0275,  $0280,  $0173,  $00BC   ; DED4   0275 0280 0173 00BC
        DECLE   $02FC,  $000F,  $0080,  $0204   ; DED8   02FC 000F 0080 0204
        DECLE   $0006,  $00BC,  $02FC,  $00C6   ; DEDC   0006 00BC 02FC 00C6
        DECLE   $0010,  $022C,  $0057           ; DEE0   0010 022C 0057

        JSR     R5,     L_5403                  ; DEE3   0004 0154 0003

        PULR    R7                              ; DEE6   02B7

        AND@    R3,     R2                      ; DEE7   039A
        SAR     R2,     1                       ; DEE8   006A
        MOVR    R3,     R7                      ; DEE9   009F
        ADDR    R1,     R7                      ; DEEA   00CF
        ADDR    R2,     R7                      ; DEEB   00D7
        ADDR    R1,     R7                      ; DEEC   00CF
        ADDR    R2,     R7                      ; DEED   00D7

        DECLE   $0020,  $0065,  $0001,  $02F4   ; DEEE   0020 0065 0001 02F4
        DECLE   $0028,  $02F2,  $0206           ; DEF2   0028 02F2 0206

        ADDR    R7,     R6                      ; DEF5   00FE
        ADDR    R2,     R7                      ; DEF6   00D7

        DECLE   $02F2,  $0216,  $0032,  $009E   ; DEF7   02F2 0216 0032 009E
        DECLE   $0252,  $025A,  $0242,  $01D1   ; DEFB   0252 025A 0242 01D1
        DECLE   $009C,  $039C,  $017A,  $0168   ; DEFF   009C 039C 017A 0168
        DECLE   $02A4,  $025E,  $0000           ; DF03   02A4 025E 0000

        ADD@    R6,     R5                      ; DF06   02F5
        ADD@    R6,     R1                      ; DF07   02F1
        MVII    #$0002, R0                      ; DF08   02B8 0002
        MVO     R0,     G_0173                  ; DF0A   0240 0173
        MVII    #$0066, R0                      ; DF0C   02B8 0066
        MVO     R0,     G_019C                  ; DF0E   0240 019C
        SDBD                                    ; DF10   0001
        MVII    #$1200, R0                      ; DF11   02B8 0000 0012
        MVII    #$0028, R1                      ; DF14   02B9 0028
        MVII    #$0200, R3                      ; DF16   02BB 0200

        JSR     R5,     L_64EA                  ; DF18   0004 0164 00EA
        JSR     R5,     L_6116                  ; DF1B   0004 0160 0116
        DECLE   $0000                           ; DF1E   0000
        BIDECLE $30C6                           ; DF1F   00C6 0030

        MVI     G_0164, R1                      ; DF21   0281 0164
        MVII    #$0046, R0                      ; DF23   02B8 0046
        SARC    R1,     1                       ; DF25   0079
        BNC     L_DF2A                          ; DF26   0209 0002

        MVII    #$0042, R0                      ; DF28   02B8 0042

L_DF2A:
        JSR     R5,     L_5D1E                  ; DF2A   0004 015C 011E
        DECLE   $0004,  $019C,  $0340,  $0280   ; DF2D   0004 019C 0340 0280
        DECLE   $01C5,  $02BC,  $0252,  $0080   ; DF31   01C5 02BC 0252 0080
        DECLE   $0204,  $0002                   ; DF35   0204 0002
L_DF37:
        MVII    #$028E, R4                      ; DF37   02BC 028E
        DECLE   $0004,  $01FC,  $03B0,  $0007   ; DF39   0004 01FC 03B0 0007
        DECLE   $0006,  $0000                   ; DF3D   0006 0000

        PULR    R7                              ; DF3F   02B7

        PSHR    R5                              ; DF40   0275
        SDBD                                    ; DF41   0001
        MVII    #$8AF8, R4                      ; DF42   02BC 00F8 008A
        MVI@    R4,     R1                      ; DF45   02A1
        INCR    R4                              ; DF46   000C
        MVI@    R4,     R0                      ; DF47   02A0
        PSHR    R0                              ; DF48   0270

        JSR     R5,     L_FDCC                  ; DF49   0004 01FC 01CC

        MOVR    R1,     R3                      ; DF4C   008B
        MVII    #$023D, R4                      ; DF4D   02BC 023D

        JSR     R5,     X_PRINT_R5              ; DF4F   0004 0118 007B
        STRING  "000000000"                     ; DF52  
        DECLE   $0000                           ; DF5B   0000

        PULR    R1                              ; DF5C   02B1

        JSR     R5,     L_FDCC                  ; DF5D   0004 01FC 01CC

        MOVR    R1,     R3                      ; DF60   008B
        MVII    #$0279, R4                      ; DF61   02BC 0279

        JSR     R5,     X_PRINT_R5              ; DF63   0004 0118 007B
        STRING  "00"                            ; DF66   0030 0030
        DECLE   $0000                           ; DF68   0000

        PULR    R7                              ; DF69   02B7

        PSHR    R5                              ; DF6A   0275
        MVI     G_01C5, R3                      ; DF6B   0283 01C5

        JSR     R5,     L_FE65                  ; DF6D   0004 01FC 0265

        SWAP    R2,     2                       ; DF70   0046
        SARC    R1,     2                       ; DF71   007D
        MOVR    R3,     R7                      ; DF72   009F

        SWAP    R2,     1                       ; DF73   0042
        SARC    R1,     2                       ; DF74   007D
        MOVR    R3,     R7                      ; DF75   009F

        RLC     R3,     1                       ; DF76   0053
        MOVR    R0,     R1                      ; DF77   0081
        MOVR    R3,     R7                      ; DF78   009F

        SLL     R0,     2                       ; DF79   004C
        MOVR    R3,     R6                      ; DF7A   009E
        MOVR    R3,     R7                      ; DF7B   009F

        DECLE   $0000                           ; DF7C   0000

        JSR     R5,     L_5D1E                  ; DF7D   0004 015C 011E

        PULR    R7                              ; DF80   02B7

        DECLE   $009B,  $0224,  $00F8           ; DF81   009B 0224 00F8

        CLRR    R3                              ; DF84   01DB
L_DF85:
        MVO     R3,     G_01C5                  ; DF85   0243 01C5
        MVI     G_0173, R0                      ; DF87   0280 0173
        TSTR    R0                              ; DF89   0080
        BNEQ    L_DF91                          ; DF8A   020C 0005

        JSR     R5,     L_5E3F                  ; DF8C   0004 015C 023F

        B       L_DF94                          ; DF8F   0200 0003

L_DF91:
        JSR     R5,     L_5E2A                  ; DF91   0004 015C 022A

L_DF94:
        MVII    #$0252, R4                      ; DF94   02BC 0252
        DECLE   $0004,  $01FC,  $03B0,  $0007   ; DF96   0004 01FC 03B0 0007
        DECLE   $0006,  $0000                   ; DF9A   0006 0000

        B       L_DF37                          ; DF9C   0220 0066

        DECLE   $009B,  $022C,  $0115           ; DF9E   009B 022C 0115

        INCR    R3                              ; DFA1   000B
        B       L_DF85                          ; DFA2   0220 001E

        DECLE   $039C,  $00BF                   ; DFA4   039C 00BF

        MOVR    R3,     R7                      ; DFA6   009F
        ADDR    R1,     R7                      ; DFA7   00CF
        ADDR    R2,     R7                      ; DFA8   00D7
        ADDR    R1,     R7                      ; DFA9   00CF
        ADDR    R2,     R7                      ; DFAA   00D7

        DECLE   $0035,  $0060,  $0001           ; DFAB   0035 0060 0001

        ADD@    R6,     R6                      ; DFAE   02F6
        ADDR    R4,     R6                      ; DFAF   00E6
        MOVR    R3,     R7                      ; DFB0   009F

        ADD@    R6,     R1                      ; DFB1   02F1
        CLRR    R0                              ; DFB2   01C0
        MVO     R0,     G_0128                  ; DFB3   0240 0128

        JSR     R5,     L_5FCC                  ; DFB5   0004 015C 03CC
        JSR     R5,     L_6005                  ; DFB8   0004 0160 0005
L_DFBB:
        JSR     R5,     L_60BF                  ; DFBB   0004 0160 00BF

        PULR    R7                              ; DFBE   02B7

        PSHR    R5                              ; DFBF   0275
        SDBD                                    ; DFC0   0001
        MVII    #$8AF9, R1                      ; DFC1   02B9 00F9 008A
L_DFC4:
        MVI@    R1,     R2                      ; DFC4   028A
        DECLE   $02BC,  $00F0,  $02BB,  $0014   ; DFC5   02BC 00F0 02BB 0014
        DECLE   $0004,  $01FC,  $0226           ; DFC9   0004 01FC 0226

        PSHR    R1                              ; DFCC   0271
        MOVR    R2,     R3                      ; DFCD   0093
        MOVR    R2,     R1                      ; DFCE   0091
        MVII    #$0014, R2                      ; DFCF   02BA 0014

        JSR     R5,     X_DIV                   ; DFD1   0004 011C 01FB
        DECLE   $02B2,  $0001,  $037A,  $00F9   ; DFD4   02B2 0001 037A 00F9
        DECLE   $008A,  $020C,  $0004,  $0379   ; DFD8   008A 020C 0004 0379
        DECLE   $000B,  $0200,  $0002,  $0379   ; DFDC   000B 0200 0002 0379
        DECLE   $0012,  $022E,  $0157           ; DFE0   0012 022E 0157

        MVO@    R3,     R2                      ; DFE3   0253
        B       L_DFBB                          ; DFE4   0220 002A

        PSHR    R5                              ; DFE6   0275
        SDBD                                    ; DFE7   0001
        MVII    #$8AFB, R1                      ; DFE8   02B9 00FB 008A
        B       L_DFC4                          ; DFEB   0220 0028

        DECLE   $0000,  $0000,  $0000,  $0000   ; DFED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DFFD   0000 0000 0000

        ORG     $F000
        DECLE   $021F,  $00D0,  $00A0,  $00F2   ; F000   021F 00D0 00A0 00F2
        DECLE   $00A0,  $0029,  $00A1,  $0045   ; F004   00A0 0029 00A1 0045
        DECLE   $00A1,  $0050,  $00A1,  $02F4   ; F008   00A1 0050 00A1 02F4
        DECLE   $0028,  $02F2,  $0202,  $00F1   ; F00C   0028 02F2 0202 00F1
        DECLE   $006D,  $0219,  $01E6,  $035A   ; F010   006D 0219 01E6 035A
        DECLE   $034E,  $00BA,  $03C5,  $03C0   ; F014   034E 00BA 03C5 03C0
        DECLE   $02B5,  $005A,  $004E,  $01F8   ; F018   02B5 005A 004E 01F8
        DECLE   $03C0,  $02F3,  $0014,  $02BE   ; F01C   03C0 02F3 0014 02BE
        DECLE   $01E8,  $0053,  $0291,  $009E   ; F020   01E8 0053 0291 009E
        DECLE   $0000,  $02F5,  $02F1,  $0004   ; F024   0000 02F5 02F1 0004

        ANDR    R4,     R0                      ; F028   01A0
        XORR    R4,     R3                      ; F029   01E3
        MVII    #$0040, R0                      ; F02A   02B8 0040
        MVII    #$031D, R4                      ; F02C   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; F02E   0004 0114 0338
        DECLE   $0280,  $01A4,  $0064,  $0060   ; F031   0280 01A4 0064 0060
        DECLE   $0084,  $00E4,  $0001,  $02FC   ; F035   0084 00E4 0001 02FC
        DECLE   $00EC,  $00A1,  $0001,  $02A1   ; F039   00EC 00A1 0001 02A1
        DECLE   $0241,  $02F0,  $0270,  $0008   ; F03D   0241 02F0 0270 0008
        DECLE   $02BB,  $0007,  $0004,  $01DC   ; F041   02BB 0007 0004 01DC
        DECLE   $0260,  $021B                   ; F045   0260 021B

        PULR    R0                              ; F047   02B0
        SLL     R0,     2                       ; F048   004C
        SLL     R0,     2                       ; F049   004C
        PSHR    R0                              ; F04A   0270
        SDBD                                    ; F04B   0001
        ADDI    #$A26C, R0                      ; F04C   02F8 006C 00A2
        MOVR    R0,     R4                      ; F04F   0084
        SDBD                                    ; F050   0001
        MVII    #$8A82, R5                      ; F051   02BD 0082 008A
        MVII    #$0008, R1                      ; F054   02B9 0008
L_F056:
        MVI@    R4,     R0                      ; F056   02A0
        MVO@    R0,     R5                      ; F057   0268
        MVI@    R4,     R0                      ; F058   02A0
        MVO@    R0,     R5                      ; F059   0268
        ADDI    #$0006, R5                      ; F05A   02FD 0006
        DECR    R1                              ; F05C   0011
        BNEQ    L_F056                          ; F05D   022C 0008

        PULR    R4                              ; F05F   02B4
        SDBD                                    ; F060   0001
        ADDI    #$A22C, R4                      ; F061   02FC 002C 00A2
        MVII    #$031D, R5                      ; F064   02BD 031D
        MVII    #$0008, R1                      ; F066   02B9 0008
L_F068:
        MVI@    R4,     R0                      ; F068   02A0
        SDBD                                    ; F069   0001
        XORI    #$30C0, R0                      ; F06A   03F8 00C0 0030
        MVO@    R0,     R5                      ; F06D   0268
        ADDI    #$0004, R5                      ; F06E   02FD 0004
        MVI@    R4,     R0                      ; F070   02A0
        SLL     R0,     2                       ; F071   004C
        SLL     R0,     2                       ; F072   004C
        MVO@    R0,     R5                      ; F073   0268
        ADDI    #$0002, R5                      ; F074   02FD 0002
        DECR    R1                              ; F076   0011
        BNEQ    L_F068                          ; F077   022C 0010

        MVII    #$0008, R1                      ; F079   02B9 0008
        SDBD                                    ; F07B   0001
        MVII    #$8A7E, R3                      ; F07C   02BB 007E 008A
        SDBD                                    ; F07F   0001
        MVII    #$6AFC, R4                      ; F080   02BC 00FC 006A
        MVII    #$031E, R5                      ; F083   02BD 031E
L_F085:
        MVO@    R3,     R5                      ; F085   026B
        ADDI    #$0008, R3                      ; F086   02FB 0008
        MVI@    R4,     R0                      ; F088   02A0
        SWAP    R0,     1                       ; F089   0040
        MVI@    R4,     R2                      ; F08A   02A2
        SUBI    #$0008, R2                      ; F08B   033A 0008
        SWAP    R2,     1                       ; F08D   0042
        MVO@    R0,     R5                      ; F08E   0268
        MVO@    R2,     R5                      ; F08F   026A
        ADDI    #$0005, R5                      ; F090   02FD 0005
        DECR    R1                              ; F092   0011
        BNEQ    L_F085                          ; F093   022C 000F

L_F095:
        MVII    #$0050, R0                      ; F095   02B8 0050
        MVII    #$023C, R4                      ; F097   02BC 023C

        JSR     R5,     X_FILL_ZERO             ; F099   0004 0114 0338
        DECLE   $0282,  $01A4,  $03BA,  $0007   ; F09C   0282 01A4 03BA 0007
        DECLE   $0090,  $0001,  $02FA,  $00F4   ; F0A0   0090 0001 02FA 00F4
        DECLE   $006A,  $0292,  $0012,  $0001   ; F0A4   006A 0292 0012 0001
        DECLE   $02B9,  $0067,  $0009,  $0251   ; F0A8   02B9 0067 0009 0251
        DECLE   $0004,  $01D8,  $00F9           ; F0AC   0004 01D8 00F9

        ADDI    #$0004, R1                      ; F0AF   02F9 0004
        MVI@    R1,     R0                      ; F0B1   0288
        MVII    #$02BC, R4                      ; F0B2   02BC 02BC
        MVII    #$0007, R3                      ; F0B4   02BB 0007
        MVI     G_0162, R2                      ; F0B6   0282 0162
        ANDI    #$0020, R2                      ; F0B8   03BA 0020
        BNEQ    L_F0BF                          ; F0BA   020C 0003

        JSR     R5,     L_DE28                  ; F0BC   0004 01DC 0228

L_F0BF:
        PSHR    R0                              ; F0BF   0270

        JSR     R5,     L_DE38                  ; F0C0   0004 01DC 0238

        PULR    R1                              ; F0C3   02B1
        SDBD                                    ; F0C4   0001
        MVII    #$0890, R0                      ; F0C5   02B8 0090 0008
        XORR    R3,     R0                      ; F0C8   01D8
        DECR    R1                              ; F0C9   0011
        BNEQ    L_F0CD                          ; F0CA   020C 0001

        CLRR    R0                              ; F0CC   01C0
L_F0CD:
        MVO     R0,     .BTAB.C5                ; F0CD   0240 02C5
L_F0CF:
        PULR    R7                              ; F0CF   02B7

        PSHR    R5                              ; F0D0   0275
        MVI     G_0162, R1                      ; F0D1   0281 0162
        ANDI    #$0020, R1                      ; F0D3   03B9 0020
        BEQ     L_F0DB                          ; F0D5   0204 0004

        JSR     R5,     L_FDD8                  ; F0D7   0004 01FC 01D8

        PULR    R7                              ; F0DA   02B7

L_F0DB:
        DECR    R0                              ; F0DB   0010
        DECLE   $022B,  $000E,  $0378,  $0004   ; F0DC   022B 000E 0378 0004
        DECLE   $022D,  $0012,  $0281,  $01A4   ; F0E0   022D 0012 0281 01A4
        DECLE   $008A,  $03B9,  $00F8,  $01CA   ; F0E4   008A 03B9 00F8 01CA
        DECLE   $004C,  $0048,  $0141,  $0224   ; F0E8   004C 0048 0141 0224
        DECLE   $001D,  $01C2,  $0242,  $01A4   ; F0EC   001D 01C2 0242 01A4
        DECLE   $0220,  $00CA                   ; F0F0   0220 00CA

        PSHR    R5                              ; F0F2   0275

        JSR     R5,     L_FE65                  ; F0F3   0004 01FC 0265
        DECLE   $0043,  $00FA,  $00A0,  $0000   ; F0F6   0043 00FA 00A0 0000
        DECLE   $0280,  $0162,  $03B8,  $0020   ; F0FA   0280 0162 03B8 0020
        DECLE   $022C,  $0030,  $0004           ; F0FE   022C 0030 0004

        ANDR    R4,     R0                      ; F101   01A0
        XORR    R2,     R3                      ; F102   01D3
        ADDI    #$0003, R4                      ; F103   02FC 0003

        JSR     R5,     L_DDD3                  ; F105   0004 01DC 01D3
        DECLE   $0253,  $0011,  $027A,  $004E   ; F108   0253 0011 027A 004E
        DECLE   $01F8,  $010D,  $00DC,  $026E   ; F10C   01F8 010D 00DC 026E
        DECLE   $0356,  $00E0,  $027A,  $01E8   ; F110   0356 00E0 027A 01E8
        DECLE   $005E,  $017E,  $01BA,  $035E   ; F114   005E 017E 01BA 035E
        DECLE   $0000                           ; F118   0000

        MVI     G_0162, R0                      ; F119   0280 0162
        ANDI    #$00DF, R0                      ; F11B   03B8 00DF
        XORI    #$0020, R0                      ; F11D   03F8 0020
        MVO     R0,     G_0162                  ; F11F   0240 0162
        CLRR    R0                              ; F121   01C0
        MVO     R0,     G_0137                  ; F122   0240 0137
        MVII    #$00ED, R0                      ; F124   02B8 00ED
        MVO     R0,     G_0138                  ; F126   0240 0138
        PULR    R7                              ; F128   02B7

        PSHR    R5                              ; F129   0275
        MVI     G_01A4, R2                      ; F12A   0282 01A4
        MOVR    R2,     R1                      ; F12C   0091
        ANDI    #$0007, R2                      ; F12D   03BA 0007
        XORR    R2,     R1                      ; F12F   01D1
        PSHR    R1                              ; F130   0271

        JSR     R5,     L_FE24                  ; F131   0004 01FC 0224
        DECLE   $0004,  $0008,  $02B1,  $01D1   ; F134   0004 0008 02B1 01D1
        DECLE   $0241,  $01A4,  $0280,  $0162   ; F138   0241 01A4 0280 0162
        DECLE   $03B8,  $0020,  $022C,  $00AA   ; F13C   03B8 0020 022C 00AA
        DECLE   $0004                           ; F140   0004

        ANDR    R4,     R0                      ; F141   01A0
        XORR    R4,     R3                      ; F142   01E3
        B       L_F095                          ; F143   0220 00AF

        PSHR    R5                              ; F145   0275
        SDBD                                    ; F146   0001
        MVII    #$5014, R0                      ; F147   02B8 0014 0050
        MVO     R0,     G_02F0                  ; F14A   0240 02F0

        JSR     R5,     L_6A19                  ; F14C   0004 0168 0219

        PULR    R7                              ; F14F   02B7

        DECLE   $0275,  $0280,  $0162,  $03B8   ; F150   0275 0280 0162 03B8
        DECLE   $0020,  $0224,  $0087,  $0280   ; F154   0020 0224 0087 0280
        DECLE   $0137,  $0080,  $0204,  $0030   ; F158   0137 0080 0204 0030
        DECLE   $0010,  $0378,  $003F,  $020E   ; F15C   0010 0378 003F 020E
        DECLE   $006E,  $0083,  $0280,  $01A4   ; F160   006E 0083 0280 01A4
        DECLE   $03B8,  $0007,  $0004,  $01D8   ; F164   03B8 0007 0004 01D8
        DECLE   $00F9                           ; F168   00F9

        ADDI    #$0004, R1                      ; F169   02F9 0004
        MVI@    R1,     R0                      ; F16B   0288
        INCR    R1                              ; F16C   0009
        MVI@    R1,     R4                      ; F16D   028C
        MOVR    R0,     R2                      ; F16E   0082
        DECR    R2                              ; F16F   0012
        ADDR    R3,     R2                      ; F170   00DA
        CMPI    #$003F, R2                      ; F171   037A 003F
        BGT     L_F1CF                          ; F173   020E 005A

        MVO     R2,     G_0138                  ; F175   0242 0138
        SLL     R0,     2                       ; F177   004C
        SLL     R0,     2                       ; F178   004C
        MOVR    R3,     R1                      ; F179   0099
        SLL     R1,     2                       ; F17A   004D
        SLL     R1,     2                       ; F17B   004D
        SDBD                                    ; F17C   0001
        ADDI    #$4085, R1                      ; F17D   02F9 0085 0040
        ADDR    R4,     R4                      ; F180   00E4
        ADDR    R4,     R4                      ; F181   00E4
        ADDR    R4,     R4                      ; F182   00E4
        MVI     G_02F0, R5                      ; F183   0285 02F0
        SUBI    #$0014, R5                      ; F185   033D 0014
        SDBD                                    ; F187   0001
        ADD@    R5,     R4                      ; F188   02EC

        JSR     R5,     .EXEC.730               ; F189   0004 0114 0330
        DECLE   $0004,  $01A0,  $01E3,  $0004   ; F18C   0004 01A0 01E3 0004

        ANDR    R4,     R0                      ; F190   01A0
        XORR    R2,     R3                      ; F191   01D3
        MVI     G_0162, R0                      ; F192   0280 0162
        ANDI    #$00DF, R0                      ; F194   03B8 00DF
        MVO     R0,     G_0162                  ; F196   0240 0162
        MVI     G_0137, R0                      ; F198   0280 0137
        TSTR    R0                              ; F19A   0080
        BEQ     L_F0CF                          ; F19B   0224 00CD

        MVII    #$02D2, R4                      ; F19D   02BC 02D2

        JSR     R5,     L_DDD3                  ; F19F   0004 01DC 01D3
        DECLE   $004E,  $01E8,  $0083,  $0393   ; F1A2   004E 01E8 0083 0393
        DECLE   $01DA,  $03C0,  $0004,  $01DC   ; F1A6   01DA 03C0 0004 01DC
        DECLE   $025A,  $0280,  $0138,  $0008   ; F1AA   025A 0280 0138 0008
        DECLE   $0340,  $0137,  $0204,  $000E   ; F1AE   0340 0137 0204 000E
        DECLE   $0378,  $000A,  $0205,  $0001   ; F1B2   0378 000A 0205 0001
        DECLE   $000C,  $0004,  $01DC,  $025A   ; F1B6   000C 0004 01DC 025A

        SDBD                                    ; F1BA   0001
        MVII    #$193E, R1                      ; F1BB   02B9 003E 0019
        MVO     R1,     .BTAB.EB                ; F1BE   0241 02EB
        MVI     G_0137, R1                      ; F1C0   0281 0137
        DECR    R1                              ; F1C2   0011
        MVII    #$0018, R2                      ; F1C3   02BA 0018

        JSR     R5,     X_DIV                   ; F1C5   0004 011C 01FB

        SLL     R0,     2                       ; F1C8   004C
        SLL     R0,     2                       ; F1C9   004C
        SLL     R0,     1                       ; F1CA   0048
        XORR    R1,     R0                      ; F1CB   01C8
        MVO     R0,     G_01A1                  ; F1CC   0240 01A1
        PULR    R7                              ; F1CE   02B7

L_F1CF:
        JSR     R5,     L_FDF8                  ; F1CF   0004 01FC 01F8

        PULR    R7                              ; F1D2   02B7

        DECLE   $0275,  $02BC,  $02B5,  $0004   ; F1D3   0275 02BC 02B5 0004
        DECLE   $01FC,  $03B0,  $0006,  $0006   ; F1D7   01FC 03B0 0006 0006
        DECLE   $0000,  $0004,  $01FC,  $03B0   ; F1DB   0000 0004 01FC 03B0
        DECLE   $000D,  $0001                   ; F1DF   000D 0001

        DECR    R0                              ; F1E1   0010
        PULR    R7                              ; F1E2   02B7

        PSHR    R5                              ; F1E3   0275
        MVII    #$0028, R0                      ; F1E4   02B8 0028
        MVII    #$02C8, R4                      ; F1E6   02BC 02C8

        JSR     R5,     X_FILL_ZERO             ; F1E8   0004 0114 0338

        PULR    R7                              ; F1EB   02B7

        DECLE   $0008,  $00A2,  $0008,  $00A2   ; F1EC   0008 00A2 0008 00A2
        DECLE   $0024,  $00A2,  $0024,  $00A2   ; F1F0   0024 00A2 0024 00A2
        DECLE   $00AC,  $00A2,  $0000,  $0000   ; F1F4   00AC 00A2 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F200   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F204   0000 0000 0000 0000

        XORR    R6,     R0                      ; F208   01F0
        XORR    R4,     R0                      ; F209   01E0
        XORR    R2,     R0                      ; F20A   01D0
        CLRR    R0                              ; F20B   01C0
        ANDR    R6,     R0                      ; F20C   01B0
        ANDR    R4,     R0                      ; F20D   01A0
        ANDR    R2,     R0                      ; F20E   0190
        ANDR    R0,     R0                      ; F20F   0180
        ADDR    R3,     R4                      ; F210   00DC
        MOVR    R4,     R7                      ; F211   00A7

        DECLE   $0000,  $0000,  $0000,  $0000   ; F212   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F216   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F21A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F21E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $01F0,  $01E0   ; F222   0000 0000 01F0 01E0
        DECLE   $01D0,  $01C0,  $01B0,  $01A0   ; F226   01D0 01C0 01B0 01A0
        DECLE   $0190,  $0180,  $0006,  $0020   ; F22A   0190 0180 0006 0020
        DECLE   $0006,  $0020,  $0014,  $0020   ; F22E   0006 0020 0014 0020
        DECLE   $0014,  $0020,  $0003,  $003F   ; F232   0014 0020 0003 003F
        DECLE   $0003,  $0020,  $0010,  $000C   ; F236   0003 0020 0010 000C
        DECLE   $0010,  $000C,  $0012,  $0020   ; F23A   0010 000C 0012 0020
        DECLE   $0010,  $0020,  $0016,  $000A   ; F23E   0010 0020 0016 000A
        DECLE   $0007,  $003F,  $0006,  $003F   ; F242   0007 003F 0006 003F

        DECR    R0                              ; F246   0010
        NEGR    R0                              ; F247   0020
        DECR    R1                              ; F248   0011
        NEGR    R0                              ; F249   0020
        DECR    R1                              ; F24A   0011
        NEGR    R0                              ; F24B   0020
L_F24C:
        DECR    R7                              ; F24C   0017

        DECLE   $000A,  $0004                   ; F24D   000A 0004

        INCR    R2                              ; F24F   000A
        EIS                                     ; F250   0002
        NEGR    R0                              ; F251   0020
        DECR    R5                              ; F252   0015
        NEGR    R0                              ; F253   0020
        DECR    R0                              ; F254   0010
        NEGR    R0                              ; F255   0020
        CLRC                                    ; F256   0006
        NEGR    R0                              ; F257   0020
        DECR    R6                              ; F258   0016
        NEGR    R0                              ; F259   0020
        DECR    R2                              ; F25A   0012
        NEGR    R0                              ; F25B   0020
        DECR    R0                              ; F25C   0010
        DECR    R0                              ; F25D   0010
        DECR    R3                              ; F25E   0013
        DECR    R0                              ; F25F   0010
L_F260:
        DECR    R7                              ; F260   0017

        DECLE   $0010,  $0016,  $0020,  $0015   ; F261   0010 0016 0020 0015
        DECLE   $0020,  $0006,  $0020,  $0012   ; F265   0020 0006 0020 0012
        DECLE   $0020,  $0002,  $0020,  $0008   ; F269   0020 0002 0020 0008
        DECLE   $0000,  $0008,  $0010,  $0008   ; F26D   0000 0008 0010 0008
        DECLE   $0020,  $0008,  $0030,  $0008   ; F271   0020 0008 0030 0008
        DECLE   $0040,  $0004                   ; F275   0040 0004

        RLC     R0,     1                       ; F277   0050

        JSR     R4,     L_5804                  ; F278   0004 0058 0004

        SLR     R0,     1                       ; F27B   0060

        JSR     R4,     L_6801                  ; F27C   0004 0068 0001
        DECLE   $0070,  $0008,  $0072,  $0004   ; F27F   0070 0008 0072 0004
        DECLE   $0082,  $0004,  $008A,  $0004   ; F283   0082 0004 008A 0004
        DECLE   $0092,  $0002,  $009A,  $0004   ; F287   0092 0002 009A 0004
        DECLE   $009E,  $0004,  $0000,  $0004   ; F28B   009E 0004 0000 0004

        INCR    R0                              ; F28F   0008

        JSR     R4,     .EXEC.008               ; F290   0004 0010 0008

        COMR    R0                              ; F293   0018
        INCR    R0                              ; F294   0008
        ADCR    R0                              ; F295   0028
        CLRC                                    ; F296   0006
        RSWD    R0                              ; F297   0038
        INCR    R0                              ; F298   0008
        SWAP    R0,     2                       ; F299   0044
        CLRC                                    ; F29A   0006
        RLC     R0,     2                       ; F29B   0054

        JSR     R4,     L_6004                  ; F29C   0004 0060 0004
        DECLE   $0068,  $0004,  $0070,  $0003   ; F29F   0068 0004 0070 0003
        DECLE   $0078,  $0006,  $007E,  $0005   ; F2A3   0078 0006 007E 0005
        DECLE   $008A,  $0006,  $0094,  $0008   ; F2A7   008A 0006 0094 0008
        DECLE   $00A0,  $000C,  $000C,  $000C   ; F2AB   00A0 000C 000C 000C
        DECLE   $0008,  $003C,  $002C,  $002E   ; F2AF   0008 003C 002C 002E
        DECLE   $0018,  $0000,  $0018,  $001C   ; F2B3   0018 0000 0018 001C
        DECLE   $0074,  $0044,  $0004,  $0004   ; F2B7   0074 0044 0004 0004
        DECLE   $0006,  $0000,  $000C,  $000C   ; F2BB   0006 0000 000C 000C
        DECLE   $000C,  $0008,  $003C,  $002C   ; F2BF   000C 0008 003C 002C
        DECLE   $001C,  $0018,  $0000,  $0018   ; F2C3   001C 0018 0000 0018
        DECLE   $0078,  $0078,  $0040,  $0010   ; F2C7   0078 0078 0040 0010
        DECLE   $0018,  $0000,  $000C,  $000C   ; F2CB   0018 0000 000C 000C
        DECLE   $000C,  $0018,  $0018,  $0010   ; F2CF   000C 0018 0018 0010
        DECLE   $0018,  $0000,  $001C,  $0014   ; F2D3   0018 0000 001C 0014
        DECLE   $0014,  $0018,  $0018,  $0010   ; F2D7   0014 0018 0018 0010
        DECLE   $0018,  $000C,  $000C,  $000C   ; F2DB   0018 000C 000C 000C
        DECLE   $0018,  $0018,  $0018,  $001C   ; F2DF   0018 0018 0018 001C
        DECLE   $0000,  $001E,  $0012,  $0012   ; F2E3   0000 001E 0012 0012
        DECLE   $0034,  $0046,  $0040,  $0060   ; F2E7   0034 0046 0040 0060
        DECLE   $0000,  $000C,  $000C,  $000C   ; F2EB   0000 000C 000C 000C
        DECLE   $0008,  $003C,  $002C,  $002F   ; F2EF   0008 003C 002C 002F
        DECLE   $0018,  $0000,  $0018,  $001C   ; F2F3   0018 0000 0018 001C
        DECLE   $0014,  $0074,  $0044,  $0004   ; F2F7   0014 0074 0044 0004
        DECLE   $0006,  $0000,  $000C,  $000C   ; F2FB   0006 0000 000C 000C
        DECLE   $000C,  $0008,  $0018,  $0018   ; F2FF   000C 0008 0018 0018
        DECLE   $001C,  $0000,  $0018,  $0018   ; F303   001C 0000 0018 0018
        DECLE   $0018,  $0050,  $0050,  $0010   ; F307   0018 0050 0050 0010
        DECLE   $0018,  $0000,  $000C,  $000C   ; F30B   0018 0000 000C 000C
        DECLE   $000C,  $0018,  $003C,  $002A   ; F30F   000C 0018 003C 002A
        DECLE   $0010,  $000C,  $001C,  $0014   ; F313   0010 000C 001C 0014
        DECLE   $0018,  $0018,  $0018,  $0010   ; F317   0018 0018 0018 0010
        DECLE   $0018,  $000C,  $000C,  $000C   ; F31B   0018 000C 000C 000C
        DECLE   $0008,  $003C,  $004C,  $005F   ; F31F   0008 003C 004C 005F
        DECLE   $0018,  $0000,  $001E,  $0012   ; F323   0018 0000 001E 0012
        DECLE   $0014,  $0034,  $0046,  $0040   ; F327   0014 0034 0046 0040
        DECLE   $0060,  $000C,  $000C,  $000C   ; F32B   0060 000C 000C 000C
        DECLE   $0008,  $001C,  $002C,  $002E   ; F32F   0008 001C 002C 002E
        DECLE   $001E,  $001C,  $0014,  $0014   ; F333   001E 001C 0014 0014
        DECLE   $0014,  $0004,  $0004,  $0000   ; F337   0014 0004 0004 0000
        DECLE   $0000,  $0000,  $000C,  $000C   ; F33B   0000 0000 000C 000C
        DECLE   $000C,  $0008,  $001C,  $002C   ; F33F   000C 0008 001C 002C
        DECLE   $002E,  $003C,  $001C,  $0014   ; F343   002E 003C 001C 0014
        DECLE   $0014,  $0004,  $0004,  $0000   ; F347   0014 0004 0004 0000
        DECLE   $0004,  $0000,  $000C,  $000C   ; F34B   0004 0000 000C 000C
        DECLE   $000C,  $0008,  $001C,  $002C   ; F34F   000C 0008 001C 002C
        DECLE   $002E,  $001C,  $001C,  $0014   ; F353   002E 001C 001C 0014
        DECLE   $0014,  $0004,  $0004,  $0000   ; F357   0014 0004 0004 0000
        DECLE   $0004,  $000C,  $000C,  $000C   ; F35B   0004 000C 000C 000C
        DECLE   $0008,  $003C,  $002C,  $002E   ; F35F   0008 003C 002C 002E
        DECLE   $001E,  $001C,  $0014,  $0014   ; F363   001E 001C 0014 0014
        DECLE   $0014,  $0014,  $0000,  $0004   ; F367   0014 0014 0000 0004
        DECLE   $0000,  $0018,  $0018,  $0018   ; F36B   0000 0018 0018 0018
        DECLE   $000C,  $001E,  $003A,  $0038   ; F36F   000C 001E 003A 0038
        DECLE   $001C,  $001C,  $0014,  $0014   ; F373   001C 001C 0014 0014
        DECLE   $0014,  $0010,  $0010,  $0000   ; F377   0014 0010 0010 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F37B   0000 0000 0018 0018
        DECLE   $0018,  $0008,  $001E,  $001A   ; F37F   0018 0008 001E 001A
        DECLE   $003A,  $003C,  $001C,  $001C   ; F383   003A 003C 001C 001C
        DECLE   $0014,  $0014,  $0014,  $0000   ; F387   0014 0014 0014 0000
        DECLE   $0010,  $0000,  $0018,  $0018   ; F38B   0010 0000 0018 0018
        DECLE   $0018,  $0008,  $001C,  $003A   ; F38F   0018 0008 001C 003A
        DECLE   $003A,  $0018,  $001C,  $0014   ; F393   003A 0018 001C 0014
        DECLE   $0014,  $0010,  $0010,  $0000   ; F397   0014 0010 0010 0000
        DECLE   $0010,  $0018,  $0018,  $0018   ; F39B   0010 0018 0018 0018
        DECLE   $0008,  $001C,  $003A,  $003A   ; F39F   0008 001C 003A 003A
        DECLE   $001C,  $001C,  $0014,  $0014   ; F3A3   001C 001C 0014 0014
        DECLE   $0014,  $0010,  $0000,  $0010   ; F3A7   0014 0010 0000 0010
        DECLE   $0000,  $0000,  $001C,  $003C   ; F3AB   0000 0000 001C 003C
        DECLE   $000C,  $0038,  $002C,  $002C   ; F3AF   000C 0038 002C 002C
        DECLE   $000A,  $0018,  $001C,  $001C   ; F3B3   000A 0018 001C 001C
        DECLE   $0014,  $0074,  $0044,  $0004   ; F3B7   0014 0074 0044 0004
        DECLE   $0006,  $0000,  $0000,  $002C   ; F3BB   0006 0000 0000 002C
        DECLE   $001C,  $000C,  $0038,  $002C   ; F3BF   001C 000C 0038 002C
        DECLE   $0010,  $0008,  $0008,  $0018   ; F3C3   0010 0008 0008 0018
        DECLE   $0018,  $0078,  $0040,  $0010   ; F3C7   0018 0078 0040 0010
        DECLE   $0018,  $0000,  $0000,  $001C   ; F3CB   0018 0000 0000 001C
        DECLE   $003C,  $000C,  $0018,  $001C   ; F3CF   003C 000C 0018 001C
        DECLE   $0010,  $0018,  $0000,  $001C   ; F3D3   0010 0018 0000 001C
        DECLE   $0014,  $0018,  $0018,  $0010   ; F3D7   0014 0018 0018 0010
        DECLE   $0018,  $0000,  $0000,  $003C   ; F3DB   0018 0000 0000 003C
        DECLE   $001C,  $000C,  $0018,  $001C   ; F3DF   001C 000C 0018 001C
        DECLE   $001C,  $0000,  $001C,  $001E   ; F3E3   001C 0000 001C 001E
        DECLE   $0012,  $0014,  $0026,  $0040   ; F3E7   0012 0014 0026 0040
        DECLE   $0020,  $0000,  $000C,  $001C   ; F3EB   0020 0000 000C 001C
        DECLE   $003C,  $0008,  $003C,  $0028   ; F3EF   003C 0008 003C 0028
        DECLE   $000E,  $0010,  $0018,  $001C   ; F3F3   000E 0010 0018 001C
        DECLE   $0014,  $0074,  $0044,  $0004   ; F3F7   0014 0074 0044 0004
        DECLE   $0006,  $0000,  $000C,  $003C   ; F3FB   0006 0000 000C 003C
        DECLE   $001C,  $0008,  $001C,  $0018   ; F3FF   001C 0008 001C 0018
        DECLE   $001C,  $0000,  $0018,  $0018   ; F403   001C 0000 0018 0018
        DECLE   $0058,  $0050,  $0010,  $0018   ; F407   0058 0050 0010 0018
        DECLE   $0000,  $0000,  $0000,  $002C   ; F40B   0000 0000 0000 002C
        DECLE   $001C,  $000C,  $0018,  $003C   ; F40F   001C 000C 0018 003C
        DECLE   $002A,  $0010,  $000C,  $001C   ; F413   002A 0010 000C 001C
        DECLE   $0014,  $0018,  $0018,  $0010   ; F417   0014 0018 0018 0010
        DECLE   $0018,  $0000,  $001C,  $003C   ; F41B   0018 0000 001C 003C
        DECLE   $000C,  $0008,  $003C,  $002E   ; F41F   000C 0008 003C 002E
        DECLE   $0028,  $0008,  $001C,  $001E   ; F423   0028 0008 001C 001E
        DECLE   $0012,  $0014,  $0026,  $0040   ; F427   0012 0014 0026 0040
        DECLE   $0020,  $0000,  $000C,  $000C   ; F42B   0020 0000 000C 000C
        DECLE   $000C,  $0008,  $001C,  $003C   ; F42F   000C 0008 001C 003C
        DECLE   $002A,  $001E,  $001C,  $0014   ; F433   002A 001E 001C 0014
        DECLE   $0014,  $0004,  $0004,  $0000   ; F437   0014 0004 0004 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; F43B   0000 0000 0000 001C
        DECLE   $001C,  $000C,  $0008,  $001C   ; F43F   001C 000C 0008 001C
        DECLE   $003C,  $002A,  $003C,  $001C   ; F443   003C 002A 003C 001C
        DECLE   $0014,  $0014,  $0004,  $0000   ; F447   0014 0014 0004 0000
        DECLE   $0004,  $0000,  $0000,  $000C   ; F44B   0004 0000 0000 000C
        DECLE   $001C,  $000C,  $0018,  $003C   ; F44F   001C 000C 0018 003C
        DECLE   $002E,  $002A,  $001C,  $001C   ; F453   002E 002A 001C 001C
        DECLE   $0014,  $0014,  $0004,  $0000   ; F457   0014 0014 0004 0000
        DECLE   $0004,  $0000,  $000C,  $000C   ; F45B   0004 0000 000C 000C
        DECLE   $000C,  $0018,  $001C,  $002E   ; F45F   000C 0018 001C 002E
        DECLE   $000A,  $001C,  $001C,  $0014   ; F463   000A 001C 001C 0014
        DECLE   $0014,  $0004,  $0000,  $0004   ; F467   0014 0004 0000 0004
        DECLE   $0000,  $0000,  $0018,  $0018   ; F46B   0000 0000 0018 0018
        DECLE   $0018,  $000C,  $001E,  $002A   ; F46F   0018 000C 001E 002A
        DECLE   $0008,  $001C,  $001C,  $0014   ; F473   0008 001C 001C 0014
        DECLE   $0014,  $0010,  $0010,  $0000   ; F477   0014 0010 0010 0000
        DECLE   $0000,  $0000,  $0018,  $001C   ; F47B   0000 0000 0018 001C
        DECLE   $0018,  $000C,  $001E,  $002A   ; F47F   0018 000C 001E 002A
        DECLE   $002A,  $000C,  $001C,  $001C   ; F483   002A 000C 001C 001C
        DECLE   $0014,  $0014,  $0014,  $0000   ; F487   0014 0014 0014 0000
        DECLE   $0010,  $0000,  $0000,  $001C   ; F48B   0010 0000 0000 001C
        DECLE   $001C,  $0018,  $0008,  $001C   ; F48F   001C 0018 0008 001C
        DECLE   $001E,  $002A,  $001C,  $001C   ; F493   001E 002A 001C 001C
        DECLE   $0014,  $0014,  $0010,  $0000   ; F497   0014 0014 0010 0000
        DECLE   $0010,  $0000,  $0018,  $001C   ; F49B   0010 0000 0018 001C
        DECLE   $0018,  $0008,  $001C,  $002A   ; F49F   0018 0008 001C 002A
        DECLE   $000A,  $001C,  $001C,  $0014   ; F4A3   000A 001C 001C 0014
        DECLE   $0014,  $0014,  $0010,  $0000   ; F4A7   0014 0014 0010 0000
        DECLE   $0010,  $000C,  $000E,  $0000   ; F4AB   0010 000C 000E 0000
        DECLE   $000C,  $000C,  $000C,  $000C   ; F4AF   000C 000C 000C 000C
        DECLE   $000E,  $000C,  $000C,  $000C   ; F4B3   000E 000C 000C 000C
        DECLE   $003C,  $0028,  $0028,  $0008   ; F4B7   003C 0028 0028 0008
        DECLE   $000C,  $0006,  $0007,  $0000   ; F4BB   000C 0006 0007 0000
        DECLE   $000C,  $001C,  $001C,  $001E   ; F4BF   000C 001C 001C 001E
        DECLE   $0018,  $001C,  $003E,  $0022   ; F4C3   0018 001C 003E 0022
        DECLE   $002E,  $0028,  $0020,  $0020   ; F4C7   002E 0028 0020 0020
        DECLE   $0010,  $0006,  $0007,  $0000   ; F4CB   0010 0006 0007 0000
        DECLE   $001C,  $003C,  $002E,  $002C   ; F4CF   001C 003C 002E 002C
        DECLE   $0000,  $001C,  $003F,  $0021   ; F4D3   0000 001C 003F 0021
        DECLE   $0027,  $0024,  $0044,  $0040   ; F4D7   0027 0024 0044 0040
        DECLE   $0040,  $000C,  $000E,  $0000   ; F4DB   0040 000C 000E 0000
        DECLE   $0078,  $0058,  $005F,  $0018   ; F4DF   0078 0058 005F 0018
        DECLE   $0000,  $0018,  $003F,  $0021   ; F4E3   0000 0018 003F 0021
        DECLE   $0062,  $0042,  $00C0,  $0080   ; F4E7   0062 0042 00C0 0080
        DECLE   $0080,  $000C,  $000E,  $0070   ; F4EB   0080 000C 000E 0070
        DECLE   $0058,  $005F,  $0018,  $0018   ; F4EF   0058 005F 0018 0018
        DECLE   $0000,  $0018,  $003F,  $0021   ; F4F3   0000 0018 003F 0021
        DECLE   $0061,  $0041,  $00C0,  $0080   ; F4F7   0061 0041 00C0 0080
        DECLE   $0000,  $000C,  $000E,  $0000   ; F4FB   0000 000C 000E 0000
        DECLE   $0078,  $0058,  $005F,  $0018   ; F4FF   0078 0058 005F 0018
        DECLE   $0000,  $0018,  $003C,  $0024   ; F503   0000 0018 003C 0024
        DECLE   $0066,  $00C2,  $0082,  $0003   ; F507   0066 00C2 0082 0003
        DECLE   $0000,  $0006,  $0007,  $0000   ; F50B   0000 0006 0007 0000
        DECLE   $001C,  $003C,  $002E,  $002C   ; F50F   001C 003C 002E 002C
        DECLE   $0000,  $0038,  $003C,  $0024   ; F513   0000 0038 003C 0024
        DECLE   $00E4,  $0084,  $0084,  $0004   ; F517   00E4 0084 0084 0004
        DECLE   $0006,  $0006,  $0007,  $0000   ; F51B   0006 0006 0007 0000
        DECLE   $000C,  $001C,  $001C,  $001E   ; F51F   000C 001C 001C 001E
        DECLE   $0018,  $0018,  $0018,  $0018   ; F523   0018 0018 0018 0018
        DECLE   $0078,  $0048,  $0048,  $0008   ; F527   0078 0048 0048 0008
        DECLE   $000C,  $0018,  $0018,  $0000   ; F52B   000C 0018 0018 0000
        DECLE   $007C,  $007C,  $005A,  $001A   ; F52F   007C 007C 005A 001A
        DECLE   $0000,  $001A,  $0018,  $0018   ; F533   0000 001A 0018 0018
        DECLE   $0010,  $0010,  $0010,  $0000   ; F537   0010 0010 0010 0000
        DECLE   $0010,  $0018,  $0018,  $0000   ; F53B   0010 0018 0018 0000
        DECLE   $003C,  $007E,  $005A,  $005A   ; F53F   003C 007E 005A 005A
        DECLE   $0000,  $0018,  $0018,  $0018   ; F543   0000 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; F547   0018 0018 0018 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; F54B   0000 0018 0018 0000
        DECLE   $003E,  $003E,  $005A,  $0058   ; F54F   003E 003E 005A 0058
        DECLE   $0000,  $0058,  $0018,  $0018   ; F553   0000 0058 0018 0018
        DECLE   $0008,  $0008,  $0008,  $0000   ; F557   0008 0008 0008 0000
        DECLE   $0008,  $0018,  $0018,  $0000   ; F55B   0008 0018 0018 0000
        DECLE   $003C,  $007E,  $005A,  $005A   ; F55F   003C 007E 005A 005A
        DECLE   $0000,  $0018,  $0018,  $0018   ; F563   0000 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; F567   0018 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; F56B   0000 0000 0000 0030
        DECLE   $0020,  $0030,  $0020,  $0000   ; F56F   0020 0030 0020 0000

        RSWD    R4                              ; F573   003C
        NEGR    R0                              ; F574   0020
        GSWD    R0                              ; F575   0030
        NEGR    R0                              ; F576   0020
L_F577:
        GSWD    R0                              ; F577   0030
        DECLE   $0020,  $0048,  $0048,  $006C   ; F578   0020 0048 0048 006C
        DECLE   $0000,  $0030,  $0020,  $0030   ; F57C   0000 0030 0020 0030
        DECLE   $0020,  $0000,  $003C,  $0020   ; F580   0020 0000 003C 0020
        DECLE   $0030,  $0000,  $0030,  $0020   ; F584   0030 0000 0030 0020
        DECLE   $0000                           ; F588   0000
L_F589:
        NEGR    R0                              ; F589   0020
        DECLE   $0020,  $0030,  $0000,  $0000   ; F58A   0020 0030 0000 0000
        DECLE   $0030,  $0020,  $0030,  $0020   ; F58E   0030 0020 0030 0020
        DECLE   $0000,  $003C,  $0020,  $0030   ; F592   0000 003C 0020 0030
        DECLE   $0000                           ; F596   0000

        GSWD    R0                              ; F597   0030
        NEGR    R0                              ; F598   0020
        SLL     R0,     1                       ; F599   0048
        SWAP    R0,     1                       ; F59A   0040
L_F59B:
        SAR     R0,     2                       ; F59B   006C
        DECLE   $0000,  $0030,  $0020,  $0030   ; F59C   0000 0030 0020 0030
        DECLE   $0020,  $0000,  $003C,  $0030   ; F5A0   0020 0000 003C 0030
        DECLE   $0010,  $0030,  $0020,  $0020   ; F5A4   0010 0030 0020 0020
        DECLE   $0000,  $0020,  $0000,  $0030   ; F5A8   0000 0020 0000 0030
        DECLE   $0000,  $0030,  $0010,  $0030   ; F5AC   0000 0030 0010 0030
        DECLE   $0010,  $007C,  $008A,  $0038   ; F5B0   0010 007C 008A 0038
        DECLE   $0010,  $0038,  $0010,  $0028   ; F5B4   0010 0038 0010 0028
        DECLE   $0020,  $0008,  $0020,  $0008   ; F5B8   0020 0008 0020 0008
        DECLE   $0018,  $0000,  $0018,  $0010   ; F5BC   0018 0000 0018 0010
        DECLE   $007C,  $008E,  $0038,  $0000   ; F5C0   007C 008E 0038 0000
        DECLE   $0038,  $0030,  $0028,  $0000   ; F5C4   0038 0030 0028 0000
        DECLE   $0028,  $0000,  $0008,  $0008   ; F5C8   0028 0000 0008 0008
        DECLE   $0000,  $0018,  $0010,  $0018   ; F5CC   0000 0018 0010 0018
        DECLE   $0010,  $007C,  $00CE,  $0038   ; F5D0   0010 007C 00CE 0038
        DECLE   $0000,  $0038,  $0010,  $0028   ; F5D4   0000 0038 0010 0028
        DECLE   $0008,  $0020,  $0008,  $0020   ; F5D8   0008 0020 0008 0020
        DECLE   $0030,  $0000,  $0030,  $0010   ; F5DC   0030 0000 0030 0010
        DECLE   $003C,  $004E,  $00B8,  $0010   ; F5E0   003C 004E 00B8 0010
        DECLE   $0038,  $0028,  $0008,  $0020   ; F5E4   0038 0028 0008 0020
        DECLE   $0028,  $0000,  $0020,  $0020   ; F5E8   0028 0000 0020 0020
        DECLE   $0008,  $0044,  $0084,  $0084   ; F5EC   0008 0044 0084 0084
        DECLE   $0048,  $0030,  $00B0,  $007C   ; F5F0   0048 0030 00B0 007C
        DECLE   $0030,  $0078,  $0094,  $0020   ; F5F4   0030 0078 0094 0020
        DECLE   $0020,  $0028,  $0028,  $0010   ; F5F8   0020 0028 0028 0010
        DECLE   $0000,  $0008,  $0044,  $0084   ; F5FC   0000 0008 0044 0084
        DECLE   $0048,  $0030,  $0034,  $00F8   ; F600   0048 0030 0034 00F8
        DECLE   $0030,  $007C,  $0090,  $0020   ; F604   0030 007C 0090 0020
        DECLE   $0028,  $0028,  $0010,  $0000   ; F608   0028 0028 0010 0000
        DECLE   $0000,  $0048,  $0084,  $0084   ; F60C   0000 0048 0084 0084
        DECLE   $0048,  $0030,  $00B0,  $007C   ; F610   0048 0030 00B0 007C
        DECLE   $0030,  $00F8,  $0014,  $0020   ; F614   0030 00F8 0014 0020
        DECLE   $0020,  $0028,  $0018,  $0000   ; F618   0020 0028 0018 0000

        SWAP    R0,     1                       ; F61C   0040
        TSTR    R0                              ; F61D   0080
        MOVR    R1,     R0                      ; F61E   0088
        MOVR    R0,     R4                      ; F61F   0084
        SLL     R0,     1                       ; F620   0048
        GSWD    R0                              ; F621   0030
        NOP                                     ; F622   0034
        ADDR    R7,     R0                      ; F623   00F8
        GSWD    R0                              ; F624   0030
        SARC    R0,     2                       ; F625   007C
        MOVR    R2,     R0                      ; F626   0090
L_F627:
        NEGR    R0                              ; F627   0020
        DECLE   $0028,  $0028,  $0010,  $0000   ; F628   0028 0028 0010 0000
        DECLE   $0000,  $0000,  $0000,  $007E   ; F62C   0000 0000 0000 007E
        DECLE   $00FF,  $0000,  $00FF,  $003C   ; F630   00FF 0000 00FF 003C
        DECLE   $0018,  $0024,  $0042,  $0000   ; F634   0018 0024 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F638   0000 0000 0000 0000
        DECLE   $0028,  $0028,  $007C,  $007C   ; F63C   0028 0028 007C 007C
        DECLE   $0068,  $007C,  $0038,  $0000   ; F640   0068 007C 0038 0000
        DECLE   $007F,  $00FA,  $00B8,  $00B8   ; F644   007F 00FA 00B8 00B8
        DECLE   $0038,  $0030,  $0030,  $0038   ; F648   0038 0030 0030 0038
        DECLE   $0028,  $0028,  $007C,  $007C   ; F64C   0028 0028 007C 007C
        DECLE   $0054,  $007C,  $0039,  $0003   ; F650   0054 007C 0039 0003
        DECLE   $007D,  $00FF,  $00FC,  $00FC   ; F654   007D 00FF 00FC 00FC
        DECLE   $00A8,  $0028,  $006C,  $006C   ; F658   00A8 0028 006C 006C
        DECLE   $0028,  $0028,  $007C,  $007C   ; F65C   0028 0028 007C 007C
        DECLE   $0054,  $007D,  $003B,  $0001   ; F660   0054 007D 003B 0001
        DECLE   $007F,  $00FC,  $00BC,  $00BC   ; F664   007F 00FC 00BC 00BC
        DECLE   $00BC,  $0024,  $0066,  $0066   ; F668   00BC 0024 0066 0066
        DECLE   $0014,  $0014,  $003E,  $0016   ; F66C   0014 0014 003E 0016
        DECLE   $003E,  $003E,  $001C,  $0000   ; F670   003E 003E 001C 0000
        DECLE   $00FE,  $005F,  $001F,  $001E   ; F674   00FE 005F 001F 001E
        DECLE   $000A,  $000A,  $001B,  $001B   ; F678   000A 000A 001B 001B
        DECLE   $0008,  $0008,  $003E,  $002E   ; F67C   0008 0008 003E 002E
        DECLE   $002E,  $007E,  $001C,  $0000   ; F680   002E 007E 001C 0000
        DECLE   $00FE,  $005F,  $001D,  $001E   ; F684   00FE 005F 001D 001E
        DECLE   $000A,  $000A,  $001B,  $001B   ; F688   000A 000A 001B 001B
        DECLE   $0014,  $0014,  $003E,  $003E   ; F68C   0014 0014 003E 003E
        DECLE   $0016,  $003E,  $001C,  $0000   ; F690   0016 003E 001C 0000
        DECLE   $001E,  $003F,  $003F,  $003F   ; F694   001E 003F 003F 003F

        CLRC                                    ; F698   0006
        CLRC                                    ; F699   0006
        CLRC                                    ; F69A   0006
        INCR    R7                              ; F69B   000F

        DECR    R4                              ; F69C   0014
L_F69D:
        DECR    R4                              ; F69D   0014
        DECLE   $003E,  $002A,  $002A,  $002A   ; F69E   003E 002A 002A 002A
        DECLE   $001C,  $0000,  $003C,  $00FF   ; F6A2   001C 0000 003C 00FF
        DECLE   $00BD,  $003C,  $003C,  $0024   ; F6A6   00BD 003C 003C 0024
        DECLE   $0066,  $0066,  $0000,  $0000   ; F6AA   0066 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $0014   ; F6B6   0000 0000 0014 0014
        DECLE   $003E,  $003E,  $0018,  $0018   ; F6BA   003E 003E 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0014   ; F6CE   0000 0000 001C 0014
        DECLE   $0014,  $001C,  $0000,  $0000   ; F6D2   0014 001C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6DE   0000 0000 0000 0000
        DECLE   $0000,  $001E,  $0020,  $0022   ; F6E2   0000 001E 0020 0022
        DECLE   $002A,  $0000,  $0000,  $0000   ; F6E6   002A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6F2   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0000,  $0080   ; F6F6   0000 0024 0000 0080
        DECLE   $0001,  $0048,  $0000,  $0000   ; F6FA   0001 0048 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; F6FE   0000 0000 0000 0010
        DECLE   $0054,  $0038,  $00FE,  $0038   ; F702   0054 0038 00FE 0038
        DECLE   $0054,  $0010,  $0010,  $0000   ; F706   0054 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F70A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F70E   0000 0000 0000 0000
        DECLE   $0010,  $0038,  $007C,  $0038   ; F712   0010 0038 007C 0038
        DECLE   $0010,  $0010,  $0000,  $0000   ; F716   0010 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F71A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F71E   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0000   ; F722   0000 0030 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F726   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F72A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F72E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; F732   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F736   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007E   ; F73A   0000 0000 0000 007E
        DECLE   $007E,  $0042,  $007E,  $003C   ; F73E   007E 0042 007E 003C
        DECLE   $0000,  $00C3,  $00BD,  $0081   ; F742   0000 00C3 00BD 0081
        DECLE   $0081,  $003C,  $0000,  $0000   ; F746   0081 003C 0000 0000
        DECLE   $003C,  $007E,  $0000,  $0000   ; F74A   003C 007E 0000 0000
        DECLE   $007E,  $0042,  $0042,  $007E   ; F74E   007E 0042 0042 007E
        DECLE   $003C,  $0000,  $00DB,  $0081   ; F752   003C 0000 00DB 0081
        DECLE   $00BD,  $0081,  $003C,  $0000   ; F756   00BD 0081 003C 0000
        DECLE   $003C,  $007E,  $0000,  $0000   ; F75A   003C 007E 0000 0000
        DECLE   $0000                           ; F75E   0000

        SARC    R2,     2                       ; F75F   007E
L_F760:
        SWAP    R2,     1                       ; F760   0042
        DECLE   $0042,  $007E,  $003C,  $0000   ; F761   0042 007E 003C 0000
        DECLE   $00DB,  $00BD,  $00BD,  $00BD   ; F765   00DB 00BD 00BD 00BD
        DECLE   $0000,  $003C,  $007E,  $007E   ; F769   0000 003C 007E 007E
        DECLE   $0042,  $0042,  $007E,  $003C   ; F76D   0042 0042 007E 003C
        DECLE   $0000,  $00C3,  $00BD,  $0081   ; F771   0000 00C3 00BD 0081
        DECLE   $0081,  $0000,  $003C,  $0000   ; F775   0081 0000 003C 0000
        DECLE   $0000,  $003C,  $007E,  $0000   ; F779   0000 003C 007E 0000
        DECLE   $0000,  $007E,  $00FF,  $00CC   ; F77D   0000 007E 00FF 00CC
        DECLE   $00E1,  $00BF,  $008A,  $0080   ; F781   00E1 00BF 008A 0080
        DECLE   $00D4,  $00FE,  $0038,  $0038   ; F785   00D4 00FE 0038 0038
        DECLE   $007C,  $00C4,  $00C6,  $007E   ; F789   007C 00C4 00C6 007E
        DECLE   $00FF,  $00CC,  $00E1,  $00BF   ; F78D   00FF 00CC 00E1 00BF

        MOVR    R1,     R2                      ; F791   008A
        TSTR    R0                              ; F792   0080
        ADDR    R0,     R0                      ; F793   00C0
        ADDR    R0,     R0                      ; F794   00C0
        RLC     R0,     2                       ; F795   0054
        SARC    R2,     2                       ; F796   007E
        RSWD    R0                              ; F797   0038
        RSWD    R0                              ; F798   0038
        SARC    R0,     2                       ; F799   007C
        SWAP    R2,     2                       ; F79A   0046
        ADDR    R0,     R6                      ; F79B   00C6
        ADDR    R0,     R6                      ; F79C   00C6
        ADDR    R0,     R6                      ; F79D   00C6
        ADDR    R0,     R6                      ; F79E   00C6
        ADDR    R0,     R6                      ; F79F   00C6
        ADDR    R0,     R6                      ; F7A0   00C6
        ADDR    R0,     R4                      ; F7A1   00C4
        SWAP    R0,     2                       ; F7A2   0044
        SWAP    R0,     2                       ; F7A3   0044
        SWAP    R3,     2                       ; F7A4   0047
        SLR     R3,     2                       ; F7A5   0067
        NEGR    R3                              ; F7A6   0023
        NEGR    R0                              ; F7A7   0020
        NEGR    R0                              ; F7A8   0020
        SLR     R0,     1                       ; F7A9   0060
        ADDR    R4,     R0                      ; F7AA   00E0
        ADDR    R4,     R0                      ; F7AB   00E0
        ADDR    R0,     R6                      ; F7AC   00C6
        ADDR    R0,     R6                      ; F7AD   00C6
        ADDR    R0,     R6                      ; F7AE   00C6
        ADDR    R0,     R6                      ; F7AF   00C6
        ADDR    R0,     R6                      ; F7B0   00C6
        ADDR    R0,     R6                      ; F7B1   00C6
        SWAP    R2,     2                       ; F7B2   0046
        SWAP    R2,     2                       ; F7B3   0046
        SWAP    R0,     2                       ; F7B4   0044
        SLR     R0,     2                       ; F7B5   0064
        NEGR    R4                              ; F7B6   0024
        NEGR    R4                              ; F7B7   0024
        SLR     R0,     2                       ; F7B8   0064
        ADDR    R4,     R7                      ; F7B9   00E7
        ADDR    R0,     R7                      ; F7BA   00C7

        DECLE   $0003,  $00C6,  $00C6,  $00C6   ; F7BB   0003 00C6 00C6 00C6
        DECLE   $0046,  $0066,  $0066,  $0066   ; F7BF   0046 0066 0066 0066
        DECLE   $0026,  $0024,  $0024,  $0064   ; F7C3   0026 0024 0024 0064
        DECLE   $00E4,  $00C4,  $0007,  $0007   ; F7C7   00E4 00C4 0007 0007
        DECLE   $0003,  $00C6,  $00C6,  $00C6   ; F7CB   0003 00C6 00C6 00C6
        DECLE   $00C6,  $00C6,  $00C6,  $0046   ; F7CF   00C6 00C6 00C6 0046
        DECLE   $0046,  $0044,  $0064,  $0024   ; F7D3   0046 0044 0064 0024
        DECLE   $0024,  $0026,  $0067,  $00E3   ; F7D7   0024 0026 0067 00E3
        DECLE   $00E0,  $0000,  $00C4,  $0092   ; F7DB   00E0 0000 00C4 0092
        DECLE   $00BA,  $00FA,  $003C,  $00B8   ; F7DF   00BA 00FA 003C 00B8
        DECLE   $007E,  $0038,  $00D4,  $00BA   ; F7E3   007E 0038 00D4 00BA
        DECLE   $003A,  $0054,  $0044,  $0028   ; F7E7   003A 0054 0044 0028
        DECLE   $0000,  $0046,  $0092,  $00BA   ; F7EB   0000 0046 0092 00BA
        DECLE   $00BC,  $0078,  $003A,  $00FC   ; F7EF   00BC 0078 003A 00FC
        DECLE   $0038,  $0056,  $00BA,  $00B8   ; F7F3   0038 0056 00BA 00B8
        DECLE   $0054,  $0044,  $0044,  $0000   ; F7F7   0054 0044 0044 0000
        DECLE   $0000,  $0000,  $00C4,  $0092   ; F7FB   0000 0000 00C4 0092
        DECLE   $00BA,  $00FA,  $003C,  $00B8   ; F7FF   00BA 00FA 003C 00B8
        DECLE   $007E,  $0038,  $00D4,  $00BA   ; F803   007E 0038 00D4 00BA
        DECLE   $003A,  $0054,  $0044,  $0044   ; F807   003A 0054 0044 0044
        DECLE   $0000,  $0042,  $0092,  $00BA   ; F80B   0000 0042 0092 00BA
        DECLE   $00BA,  $007C,  $003A,  $00FC   ; F80F   00BA 007C 003A 00FC
        DECLE   $0038,  $0056,  $00BA,  $00B8   ; F813   0038 0056 00BA 00B8
        DECLE   $0054,  $0044,  $0044,  $0000   ; F817   0054 0044 0044 0000
        DECLE   $0000,  $0000,  $0014,  $0038   ; F81B   0000 0000 0014 0038
        DECLE   $007C,  $0070,  $007C,  $003E   ; F81F   007C 0070 007C 003E
        DECLE   $0006,  $003E,  $007C,  $0078   ; F823   0006 003E 007C 0078
        DECLE   $00E0,  $00FC,  $007E,  $001A   ; F827   00E0 00FC 007E 001A
        DECLE   $0004,  $0000,  $0000,  $0028   ; F82B   0004 0000 0000 0028
        DECLE   $0078,  $0070,  $0060,  $007C   ; F82F   0078 0070 0060 007C
        DECLE   $0034,  $000C,  $003C,  $0078   ; F833   0034 000C 003C 0078
        DECLE   $0060,  $0060,  $0073,  $007E   ; F837   0060 0060 0073 007E
        DECLE   $003C,  $0000,  $0028,  $0070   ; F83B   003C 0000 0028 0070
        DECLE   $0078,  $0060,  $007C,  $007C   ; F83F   0078 0060 007C 007C
        DECLE   $000C,  $003C,  $0078,  $00E0   ; F843   000C 003C 0078 00E0
        DECLE   $00E0,  $00FC,  $007E,  $003E   ; F847   00E0 00FC 007E 003E
        DECLE   $0003,  $0016,  $0038,  $002B   ; F84B   0003 0016 0038 002B
        DECLE   $0034,  $0038,  $003C,  $000C   ; F84F   0034 0038 003C 000C
        DECLE   $007C,  $00F8,  $00E0,  $00D8   ; F853   007C 00F8 00E0 00D8
        DECLE   $00FC,  $007E,  $0006,  $0002   ; F857   00FC 007E 0006 0002
        DECLE   $0006,  $0000,  $007E,  $0042   ; F85B   0006 0000 007E 0042
        DECLE   $007E,  $0000,  $0018,  $003C   ; F85F   007E 0000 0018 003C
        DECLE   $007E,  $007E,  $00FF,  $0000   ; F863   007E 007E 00FF 0000
        DECLE   $007E,  $0081,  $00A5,  $0081   ; F867   007E 0081 00A5 0081
        DECLE   $007E,  $0000,  $007E,  $0042   ; F86B   007E 0000 007E 0042
        DECLE   $007E,  $0000,  $007E,  $007E   ; F86F   007E 0000 007E 007E
        DECLE   $007E,  $007E,  $00FF,  $0000   ; F873   007E 007E 00FF 0000
        DECLE   $007E,  $0081,  $00A5,  $0081   ; F877   007E 0081 00A5 0081
        DECLE   $007E,  $0000,  $007E,  $0042   ; F87B   007E 0000 007E 0042
        DECLE   $007E,  $0000,  $0018,  $007E   ; F87F   007E 0000 0018 007E
        DECLE   $007E,  $007E,  $00FF,  $0000   ; F883   007E 007E 00FF 0000
        DECLE   $007E,  $0081,  $00A5,  $0081   ; F887   007E 0081 00A5 0081
        DECLE   $007E,  $0000,  $007E,  $0042   ; F88B   007E 0000 007E 0042
        DECLE   $007E,  $0000,  $007E,  $007E   ; F88F   007E 0000 007E 007E
        DECLE   $007E,  $007E,  $00FF,  $0000   ; F893   007E 007E 00FF 0000
        DECLE   $007E,  $0081,  $00A5,  $0081   ; F897   007E 0081 00A5 0081
        DECLE   $007E,  $0000,  $0000,  $0006   ; F89B   007E 0000 0000 0006
        DECLE   $00FA,  $0078,  $0034,  $003A   ; F89F   00FA 0078 0034 003A
        DECLE   $0019,  $0019,  $0009,  $0008   ; F8A3   0019 0019 0009 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; F8A7   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; F8AB   0000 0000 0000 0006
        DECLE   $00FA,  $0078,  $003C,  $001A   ; F8AF   00FA 0078 003C 001A
        DECLE   $0019,  $001D,  $000D,  $000D   ; F8B3   0019 001D 000D 000D
        DECLE   $000C,  $0004,  $0004,  $0000   ; F8B7   000C 0004 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8BB   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $00FA,  $0078   ; F8BF   0000 0006 00FA 0078
        DECLE   $003C,  $0038,  $0034,  $0034   ; F8C3   003C 0038 0034 0034
        DECLE   $0034,  $0034,  $0010,  $0010   ; F8C7   0034 0034 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0036,  $00FA   ; F8CF   0000 0000 0036 00FA
        DECLE   $0078,  $0034,  $0070,  $0068   ; F8D3   0078 0034 0070 0068
        DECLE   $0068,  $0040,  $0000,  $0000   ; F8D7   0068 0040 0000 0000
        DECLE   $0000,  $0000,  $00E8,  $006C   ; F8DB   0000 0000 00E8 006C
        DECLE   $0074,  $0030,  $0036,  $00FA   ; F8DF   0074 0030 0036 00FA
        DECLE   $0078,  $0034,  $0000,  $0000   ; F8E3   0078 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F4   ; F8EB   0000 0000 0000 00F4
        DECLE   $0070,  $0036,  $00DA,  $0078   ; F8EF   0070 0036 00DA 0078
        DECLE   $0034,  $0000,  $0000,  $0000   ; F8F3   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8FB   0000 0000 0000 0000
        DECLE   $00F6,  $003A,  $0058,  $0034   ; F8FF   00F6 003A 0058 0034
        DECLE   $0000,  $0000,  $0000,  $0000   ; F903   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F907   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F90B   0000 0000 0000 0000
        DECLE   $0006,  $00FA,  $0078,  $0034   ; F90F   0006 00FA 0078 0034
        DECLE   $0038,  $001C,  $0038,  $0000   ; F913   0038 001C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F917   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F91B   0000 0000 0000 0000
        DECLE   $003C,  $0026,  $007F,  $0050   ; F91F   003C 0026 007F 0050
        DECLE   $005E,  $0040,  $0070,  $0038   ; F923   005E 0040 0070 0038
        DECLE   $0038,  $0018,  $0038,  $0070   ; F927   0038 0018 0038 0070
        DECLE   $0070,  $0000,  $0000,  $0000   ; F92B   0070 0000 0000 0000
        DECLE   $0000,  $0078,  $004C,  $00FE   ; F92F   0000 0078 004C 00FE
        DECLE   $00A0,  $00BC,  $0080,  $00E0   ; F933   00A0 00BC 0080 00E0
        DECLE   $0070,  $0070,  $0030,  $0070   ; F937   0070 0070 0030 0070
        DECLE   $00E0,  $0000,  $0000,  $0000   ; F93B   00E0 0000 0000 0000
        DECLE   $0078,  $004C,  $00FE,  $00A0   ; F93F   0078 004C 00FE 00A0
        DECLE   $00A0,  $0090,  $00E8,  $0070   ; F943   00A0 0090 00E8 0070
        DECLE   $0070,  $0030,  $0070,  $00E0   ; F947   0070 0030 0070 00E0
        DECLE   $00E0,  $0000,  $0000,  $003C   ; F94B   00E0 0000 0000 003C
        DECLE   $0026,  $007F,  $0050,  $0050   ; F94F   0026 007F 0050 0050
        DECLE   $0048,  $0074,  $0038,  $0038   ; F953   0048 0074 0038 0038
        DECLE   $0018,  $0078,  $0070,  $00F0   ; F957   0018 0078 0070 00F0
        DECLE   $00F0,  $0000,  $0000,  $0000   ; F95B   00F0 0000 0000 0000
        DECLE   $003C,  $0026,  $007F,  $0050   ; F95F   003C 0026 007F 0050
        DECLE   $0050,  $004E,  $0070,  $0038   ; F963   0050 004E 0070 0038
        DECLE   $0038,  $0018,  $0038,  $0078   ; F967   0038 0018 0038 0078
        DECLE   $0070,  $0000,  $0000,  $0000   ; F96B   0070 0000 0000 0000
        DECLE   $0000,  $0078,  $004C,  $00FE   ; F96F   0000 0078 004C 00FE
        DECLE   $00A0,  $00BC,  $0080,  $00E0   ; F973   00A0 00BC 0080 00E0
        DECLE   $0070,  $0070,  $0030,  $0070   ; F977   0070 0070 0030 0070
        DECLE   $00E0,  $0000,  $0000,  $0000   ; F97B   00E0 0000 0000 0000
        DECLE   $0078,  $004C,  $00FE,  $00A0   ; F97F   0078 004C 00FE 00A0
        DECLE   $00BC,  $0080,  $00E0,  $0070   ; F983   00BC 0080 00E0 0070
        DECLE   $0070,  $0030,  $0070,  $00F0   ; F987   0070 0030 0070 00F0
        DECLE   $00E0,  $0000,  $0000,  $003C   ; F98B   00E0 0000 0000 003C
        DECLE   $0026,  $007F,  $0050,  $005E   ; F98F   0026 007F 0050 005E
        DECLE   $0040,  $0070,  $0038,  $0038   ; F993   0040 0070 0038 0038
        DECLE   $0018,  $0038,  $0078,  $0070   ; F997   0018 0038 0078 0070
        DECLE   $0070,  $0000,  $0000,  $0000   ; F99B   0070 0000 0000 0000
        DECLE   $0038,  $0064,  $007C,  $0054   ; F99F   0038 0064 007C 0054
        DECLE   $0068,  $007C,  $007C,  $0038   ; F9A3   0068 007C 007C 0038
        DECLE   $0010,  $0058,  $00C8,  $0088   ; F9A7   0010 0058 00C8 0088
        DECLE   $00CC,  $0000,  $0038,  $0064   ; F9AB   00CC 0000 0038 0064
        DECLE   $007C,  $0054,  $0040,  $0068   ; F9AF   007C 0054 0040 0068
        DECLE   $007C,  $007C,  $0038,  $0010   ; F9B3   007C 007C 0038 0010
        DECLE   $0030,  $0030,  $0070,  $0050   ; F9B7   0030 0030 0070 0050
        DECLE   $0058,  $0000,  $0000,  $0038   ; F9BB   0058 0000 0000 0038
        DECLE   $0064,  $007C,  $0068,  $0040   ; F9BF   0064 007C 0068 0040
        DECLE   $0040,  $0054,  $007C,  $0038   ; F9C3   0040 0054 007C 0038
        DECLE   $0020,  $0030,  $0038,  $0020   ; F9C7   0020 0030 0038 0020
        DECLE   $0030,  $0000,  $0038,  $003C   ; F9CB   0030 0000 0038 003C
        DECLE   $0068,  $0040,  $0040,  $0040   ; F9CF   0068 0040 0040 0040
        DECLE   $0040,  $0054,  $007C,  $0038   ; F9D3   0040 0054 007C 0038
        DECLE   $0060,  $0058,  $00C8,  $0088   ; F9D7   0060 0058 00C8 0088
        DECLE   $00CC,  $0000,  $0000,  $0038   ; F9DB   00CC 0000 0000 0038
        DECLE   $0064,  $007C,  $007C,  $0068   ; F9DF   0064 007C 007C 0068
        DECLE   $0054,  $007C,  $0038,  $0020   ; F9E3   0054 007C 0038 0020
        DECLE   $0030,  $0030,  $0070,  $0050   ; F9E7   0030 0030 0070 0050
        DECLE   $0058,  $0000,  $0000,  $0000   ; F9EB   0058 0000 0000 0000
        DECLE   $0038,  $007C,  $0064,  $007C   ; F9EF   0038 007C 0064 007C
        DECLE   $0054,  $0068,  $007C,  $0038   ; F9F3   0054 0068 007C 0038
        DECLE   $0018,  $0010,  $0018,  $0020   ; F9F7   0018 0010 0018 0020
        DECLE   $0030,  $0000,  $00C3,  $0046   ; F9FB   0030 0000 00C3 0046
        DECLE   $0064,  $0024,  $002C,  $0028   ; F9FF   0064 0024 002C 0028
        DECLE   $0018,  $0010,  $0076,  $0089   ; FA03   0018 0010 0076 0089
        DECLE   $00AB,  $00AB,  $0089,  $0095   ; FA07   00AB 00AB 0089 0095
        DECLE   $006A,  $0000,  $0000,  $0000   ; FA0B   006A 0000 0000 0000
        DECLE   $0024,  $0066,  $005D,  $0089   ; FA0F   0024 0066 005D 0089
        DECLE   $0018,  $0010,  $0036,  $00C9   ; FA13   0018 0010 0036 00C9
        DECLE   $00AB,  $00AB,  $0089,  $0095   ; FA17   00AB 00AB 0089 0095
        DECLE   $006A,  $0000,  $00C3,  $0046   ; FA1B   006A 0000 00C3 0046
        DECLE   $0064,  $0024,  $002C,  $0028   ; FA1F   0064 0024 002C 0028
        DECLE   $0018,  $0010,  $0076,  $00FF   ; FA23   0018 0010 0076 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0099   ; FA27   00FF 00FF 00FF 0099
        DECLE   $0066,  $0000,  $0000,  $0000   ; FA2B   0066 0000 0000 0000
        DECLE   $0024,  $0066,  $005D,  $0089   ; FA2F   0024 0066 005D 0089
        DECLE   $0018,  $0010,  $0076,  $00FF   ; FA33   0018 0010 0076 00FF

        MOVR    R5,     R1                      ; FA37   00A9
        MOVR    R5,     R3                      ; FA38   00AB
        TSTR    R1                              ; FA39   0089
        MOVR    R2,     R5                      ; FA3A   0095
        SAR     R2,     1                       ; FA3B   006A
        SWAP    R2,     1                       ; FA3C   0042
        ADDR    R0,     R7                      ; FA3D   00C7
        ADDR    R4,     R7                      ; FA3E   00E7

        DECLE   $00A5,  $00AC,  $0038,  $0038   ; FA3F   00A5 00AC 0038 0038
        DECLE   $0010,  $007E,  $0091,  $00AB   ; FA43   0010 007E 0091 00AB
        DECLE   $00AB,  $0089,  $0095,  $0062   ; FA47   00AB 0089 0095 0062
        DECLE   $001C,  $003B,  $0049,  $0016   ; FA4B   001C 003B 0049 0016
        DECLE   $0034,  $002C,  $0038,  $0078   ; FA4F   0034 002C 0038 0078
        DECLE   $0010,  $007C,  $004A,  $008A   ; FA53   0010 007C 004A 008A
        DECLE   $009E,  $004A,  $004A,  $0034   ; FA57   009E 004A 004A 0034
        DECLE   $0008,  $0000,  $0000,  $0006   ; FA5B   0008 0000 0000 0006
        DECLE   $0036                           ; FA5F   0036

        SARC    R1,     2                       ; FA60   007D
        SLL     R1,     1                       ; FA61   0049
        MOVR    R1,     R4                      ; FA62   008C

        JSRD    R4,     .EXEC.C25               ; FA63   0004 001E 0025

        SWAP    R1,     2                       ; FA66   0045
        RLC     R3,     2                       ; FA67   0057
        SWAP    R1,     2                       ; FA68   0045
        ADCR    R6                              ; FA69   002E
        NOP                                     ; FA6A   0034
        INCR    R0                              ; FA6B   0008
        ADDR    R0,     R2                      ; FA6C   00C2
        MOVR    R0,     R1                      ; FA6D   0081
        ADDR    R0,     R3                      ; FA6E   00C3
        SLR     R3,     1                       ; FA6F   0063
        SLR     R2,     2                       ; FA70   0066
        RSWD    R4                              ; FA71   003C
        RSWD    R4                              ; FA72   003C
        INCR    R4                              ; FA73   000C
        COMR    R6                              ; FA74   001E
        NEGR    R5                              ; FA75   0025
        NEGR    R5                              ; FA76   0025
        ADCR    R7                              ; FA77   002F

        NEGR    R5                              ; FA78   0025
L_FA79:
        ADCR    R2                              ; FA79   002A
        DECLE   $0010,  $000C,  $0020,  $0010   ; FA7A   0010 000C 0020 0010
        DECLE   $0030,  $0010,  $0030,  $0018   ; FA7E   0030 0010 0030 0018
        DECLE   $0038,  $007C,  $0074,  $00FE   ; FA82   0038 007C 0074 00FE
        DECLE   $00F8,  $00F2,  $007C,  $0030   ; FA86   00F8 00F2 007C 0030
        DECLE   $0028,  $001C,  $0010,  $0088   ; FA8A   0028 001C 0010 0088
        DECLE   $0048,  $0048,  $0068,  $0038   ; FA8E   0048 0048 0068 0038
        DECLE   $007C,  $007C,  $00EA,  $00EA   ; FA92   007C 007C 00EA 00EA
        DECLE   $00F6,  $0062,  $003C,  $0020   ; FA96   00F6 0062 003C 0020
        DECLE   $0028,  $001C,  $0010,  $0088   ; FA9A   0028 001C 0010 0088
        DECLE   $0048,  $0048,  $0068,  $0038   ; FA9E   0048 0048 0068 0038
        DECLE   $007C,  $007C,  $00EA,  $00EA   ; FAA2   007C 007C 00EA 00EA
        DECLE   $00F6,  $0062,  $003D,  $0023   ; FAA6   00F6 0062 003D 0023
        DECLE   $0028,  $001C,  $0020,  $0010   ; FAAA   0028 001C 0020 0010
        DECLE   $0030,  $0010,  $0030,  $0018   ; FAAE   0030 0010 0030 0018
        DECLE   $0038,  $007C,  $0078,  $00FE   ; FAB2   0038 007C 0078 00FE
        DECLE   $00F8,  $00FA,  $007C,  $0020   ; FAB6   00F8 00FA 007C 0020
        DECLE   $0028,  $001C,  $0020,  $0010   ; FABA   0028 001C 0020 0010
        DECLE   $0030,  $0010,  $0030,  $0018   ; FABE   0030 0010 0030 0018
        DECLE   $0038,  $007C,  $0074,  $00FE   ; FAC2   0038 007C 0074 00FE
        DECLE   $00F8,  $00F2,  $007C,  $0030   ; FAC6   00F8 00F2 007C 0030
        DECLE   $0028,  $001C,  $0020,  $0010   ; FACA   0028 001C 0020 0010
        DECLE   $0030,  $0010,  $0030,  $0018   ; FACE   0030 0010 0030 0018
        DECLE   $0038,  $007C,  $0074,  $00FE   ; FAD2   0038 007C 0074 00FE
        DECLE   $00E8,  $00EA,  $006C,  $0030   ; FAD6   00E8 00EA 006C 0030
        DECLE   $0020,  $0000,  $0036           ; FADA   0020 0000 0036

        SLL     R1,     1                       ; FADD   0049
        MOVR    R5,     R3                      ; FADE   00AB
        ADDR    R1,     R5                      ; FADF   00CD
        RLC     R2,     1                       ; FAE0   0052
        NEGR    R0                              ; FAE1   0020
        DECR    R0                              ; FAE2   0010
        COMR    R4                              ; FAE3   001C
        DECR    R0                              ; FAE4   0010
        DECR    R0                              ; FAE5   0010
        DECR    R0                              ; FAE6   0010
        DECR    R0                              ; FAE7   0010
        DECR    R0                              ; FAE8   0010
        SARC    R2,     2                       ; FAE9   007E
        MOVR    R3,     R1                      ; FAEA   0099
        ADDR    R5,     R7                      ; FAEB   00EF

        DECLE   $0036                           ; FAEC   0036

        SAR     R0,     2                       ; FAED   006C
        ADDR    R1,     R2                      ; FAEE   00CA
        ADDR    R7,     R6                      ; FAEF   00FE
        RRC     R0,     1                       ; FAF0   0070
        ADCR    R4                              ; FAF1   002C
        DECR    R0                              ; FAF2   0010
        DECR    R0                              ; FAF3   0010
        DECR    R0                              ; FAF4   0010
        DECR    R0                              ; FAF5   0010
        DECR    R0                              ; FAF6   0010
        DECR    R0                              ; FAF7   0010
        ADDR    R6,     R0                      ; FAF8   00F0
        MOVR    R3,     R6                      ; FAF9   009E
        SARC    R1,     1                       ; FAFA   0079
L_FAFB:
        INCR    R7                              ; FAFB   000F

        DECLE   $0036                           ; FAFC   0036
L_FAFD:
        SLL     R1,     1                       ; FAFD   0049
        MOVR    R5,     R3                      ; FAFE   00AB
        ADDR    R1,     R5                      ; FAFF   00CD
        RLC     R2,     1                       ; FB00   0052
        NEGR    R0                              ; FB01   0020
        COMR    R4                              ; FB02   001C
        COMR    R0                              ; FB03   0018
        DECR    R0                              ; FB04   0010
        DECR    R0                              ; FB05   0010
        DECR    R0                              ; FB06   0010
        DECR    R0                              ; FB07   0010
        DECR    R0                              ; FB08   0010
        SARC    R2,     2                       ; FB09   007E
        MOVR    R3,     R1                      ; FB0A   0099
        ADDR    R5,     R7                      ; FB0B   00EF

        DECLE   $006C,  $0036,  $0053,  $007F   ; FB0C   006C 0036 0053 007F
        DECLE   $000E,  $0034,  $0008,  $0008   ; FB10   000E 0034 0008 0008
        DECLE   $0008,  $0008,  $0009,  $000B   ; FB14   0008 0008 0009 000B
        DECLE   $000D,  $00FF,  $009C,  $00F0   ; FB18   000D 00FF 009C 00F0
        DECLE   $0000,  $0000                   ; FB1C   0000 0000

        INCR    R0                              ; FB1E   0008
        COMR    R4                              ; FB1F   001C
        NEGR    R2                              ; FB20   0022
        SARC    R2,     2                       ; FB21   007E
        ADDR    R6,     R3                      ; FB22   00F3
        ADDR    R5,     R5                      ; FB23   00ED
        ADDR    R3,     R7                      ; FB24   00DF

        MOVR    R3,     R5                      ; FB25   009D
        MOVR    R0,     R1                      ; FB26   0081
        MOVR    R2,     R5                      ; FB27   0095
        MOVR    R2,     R5                      ; FB28   0095
        ADDR    R0,     R5                      ; FB29   00C5
        MOVR    R5,     R4                      ; FB2A   00AC
        ADDR    R5,     R7                      ; FB2B   00EF

        DECLE   $0000                           ; FB2C   0000

        INCR    R0                              ; FB2D   0008
        COMR    R4                              ; FB2E   001C
        NEGR    R2                              ; FB2F   0022
        RSWD    R6                              ; FB30   003E
        RRC     R2,     1                       ; FB31   0072
        SLR     R3,     1                       ; FB32   0063
        ADDR    R0,     R7                      ; FB33   00C7
        ADDR    R3,     R7                      ; FB34   00DF

        ADDR    R3,     R5                      ; FB35   00DD
        MOVR    R5,     R1                      ; FB36   00A9
        MOVR    R5,     R1                      ; FB37   00A9
        MOVR    R0,     R1                      ; FB38   0081
        ADDR    R0,     R3                      ; FB39   00C3
        MOVR    R4,     R5                      ; FB3A   00A5
        ADDR    R4,     R7                      ; FB3B   00E7

        DECLE   $0000,  $0008,  $001C,  $003E   ; FB3C   0000 0008 001C 003E
        DECLE   $0062,  $00FF                   ; FB40   0062 00FF

        ADDR    R6,     R3                      ; FB42   00F3
        ADDR    R5,     R5                      ; FB43   00ED
        ADDR    R3,     R7                      ; FB44   00DF

        DECLE   $00BF,  $00A3,  $00C9,  $00D5   ; FB45   00BF 00A3 00C9 00D5
        DECLE   $0076,  $0014,  $0036,  $0000   ; FB49   0076 0014 0036 0000
        DECLE   $0008,  $001C,  $003E,  $0062   ; FB4D   0008 001C 003E 0062
        DECLE   $00FF                           ; FB51   00FF

        ADDR    R6,     R3                      ; FB52   00F3
        ADDR    R5,     R5                      ; FB53   00ED
        ADDR    R3,     R7                      ; FB54   00DF

        DECLE   $00BF,  $00A3,  $0091,  $00BD   ; FB55   00BF 00A3 0091 00BD
        DECLE   $00FF,  $001A,  $003C,  $0030   ; FB59   00FF 001A 003C 0030
        DECLE   $0074,  $00F8,  $00FA,  $00FF   ; FB5D   0074 00F8 00FA 00FF
        DECLE   $00FE,  $00F4,  $00F7,  $00F6   ; FB61   00FE 00F4 00F7 00F6
        DECLE   $00D0,  $0050,  $0028,  $0064   ; FB65   00D0 0050 0028 0064
        DECLE   $0046,  $0042,  $0076,  $0034   ; FB69   0046 0042 0076 0034
        DECLE   $0078,  $00FA,  $00FF,  $00FE   ; FB6D   0078 00FA 00FF 00FE
        DECLE   $00FC,  $00F7,  $00F6,  $00F0   ; FB71   00FC 00F7 00F6 00F0
        DECLE   $00D0,  $0050,  $0030,  $0028   ; FB75   00D0 0050 0030 0028
        DECLE   $007C,  $0008,  $0018,  $0030   ; FB79   007C 0008 0018 0030
        DECLE   $0074,  $00F8,  $00FA,  $00FF   ; FB7D   0074 00F8 00FA 00FF
        DECLE   $00FE,  $00F4,  $00F7,  $00F6   ; FB81   00FE 00F4 00F7 00F6
        DECLE   $00F8,  $00D0,  $0050,  $0030   ; FB85   00F8 00D0 0050 0030
        DECLE   $0018,  $0050,  $0076,  $0030   ; FB89   0018 0050 0076 0030
        DECLE   $0074,  $00F8,  $00FA,  $00FF   ; FB8D   0074 00F8 00FA 00FF
        DECLE   $00FE,  $00F4,  $00F7,  $00F6   ; FB91   00FE 00F4 00F7 00F6
        DECLE   $00F8,  $00D0,  $001E,  $0062   ; FB95   00F8 00D0 001E 0062
        DECLE   $0046,  $0040,  $0070,  $0014   ; FB99   0046 0040 0070 0014
        DECLE   $0029,  $001E,  $005F,  $003E   ; FB9D   0029 001E 005F 003E
        DECLE   $0037,  $0073,  $00F9,  $0021   ; FBA1   0037 0073 00F9 0021
        DECLE   $0071,  $0089,  $0001           ; FBA5   0071 0089 0001

        RRC     R1,     2                       ; FBA8   0075
        ADCR    R3                              ; FBA9   002B
        INCR    R7                              ; FBAA   000F

        CLRC                                    ; FBAB   0006
L_FBAC:
        DECR    R2                              ; FBAC   0012
        INCR    R0                              ; FBAD   0008
        RSWD    R5                              ; FBAE   003D
        RRC     R2,     2                       ; FBAF   0076
        ADDR    R7,     R2                      ; FBB0   00FA
        NEGR    R3                              ; FBB1   0023
        RRC     R3,     1                       ; FBB2   0073
        RRC     R3,     1                       ; FBB3   0073
        MOVR    R0,     R7                      ; FBB4   0087

        RRC     R2,     2                       ; FBB5   0076
        ADCR    R4                              ; FBB6   002C
        INCR    R4                              ; FBB7   000C
        COMR    R2                              ; FBB8   001A
        COMR    R5                              ; FBB9   001D
        INCR    R7                              ; FBBA   000F

        SETC                                    ; FBBB   0007
L_FBBC:
        DECR    R4                              ; FBBC   0014
        DECLE   $0029,  $001E,  $005E,  $00F6   ; FBBD   0029 001E 005E 00F6
        DECLE   $0023,  $00FB,  $0073,  $0007   ; FBC1   0023 00FB 0073 0007
        DECLE   $0007,  $006E,  $001C,  $003C   ; FBC5   0007 006E 001C 003C
        DECLE   $007A,  $003F                   ; FBC9   007A 003F

        COMR    R1                              ; FBCB   0019
        MOVR    R2,     R0                      ; FBCC   0090
        ADDR    R3,     R4                      ; FBCD   00DC
        ADDR    R3,     R0                      ; FBCE   00D8
        MOVR    R7,     R6                      ; FBCF   00BE
        MOVR    R3,     R7                      ; FBD0   009F

        DECLE   $0076,  $0074,  $00F7,  $00F0   ; FBD1   0076 0074 00F7 00F0
        DECLE   $00D8,  $00E0,  $00F0,  $0070   ; FBD5   00D8 00E0 00F0 0070
        DECLE   $0020,  $0020,  $0038,  $000C   ; FBD9   0020 0020 0038 000C
        DECLE   $005E,  $00D4,  $007F,  $003F   ; FBDD   005E 00D4 007F 003F
        DECLE   $007C,  $0078,  $00F7           ; FBE1   007C 0078 00F7

        ADDR    R6,     R0                      ; FBE4   00F0
        ADDR    R3,     R0                      ; FBE5   00D8
        ADDR    R4,     R4                      ; FBE6   00E4
        ADDR    R6,     R0                      ; FBE7   00F0
        RRC     R0,     1                       ; FBE8   0070
        GSWD    R0                              ; FBE9   0030
        NEGR    R0                              ; FBEA   0020
        RSWD    R0                              ; FBEB   0038
        SWAP    R0,     1                       ; FBEC   0040
        SLR     R0,     2                       ; FBED   0064
        SLLC    R2,     2                       ; FBEE   005E
        RSWD    R6                              ; FBEF   003E
        RSWD    R5                              ; FBF0   003D
        SARC    R3,     2                       ; FBF1   007F
        RRC     R3,     2                       ; FBF2   0077
        ADDR    R6,     R6                      ; FBF3   00F6
        ADDR    R6,     R0                      ; FBF4   00F0
        ADDR    R7,     R3                      ; FBF5   00FB
        ADDR    R5,     R4                      ; FBF6   00EC
        SLR     R0,     1                       ; FBF7   0060
        SWAP    R0,     1                       ; FBF8   0040
        ADDR    R0,     R0                      ; FBF9   00C0
        TSTR    R0                              ; FBFA   0080
        SLR     R0,     1                       ; FBFB   0060

        JSRD    R4,     L_6CDE                  ; FBFC   0004 006E 00DE
        DECLE   $00BD,  $003D,  $007F,  $0076   ; FBFF   00BD 003D 007F 0076
        DECLE   $0070,  $007B,  $007C,  $0038   ; FC03   0070 007B 007C 0038
        DECLE   $0030,  $001C,  $0000,  $0000   ; FC07   0030 001C 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0064   ; FC0B   0000 0000 0040 0064
        DECLE   $006E,  $006E,  $003D,  $003F   ; FC0F   006E 006E 003D 003F
        DECLE   $0036                           ; FC13   0036

        SARC    R0,     1                       ; FC14   0078
        SARC    R3,     1                       ; FC15   007B
        SARC    R0,     2                       ; FC16   007C
        SARC    R0,     1                       ; FC17   0078
        SARC    R0,     1                       ; FC18   0078
        RSWD    R0                              ; FC19   0038
L_FC1A:
        INCR    R4                              ; FC1A   000C
        DECLE   $0007,  $0000,  $0000,  $0000   ; FC1B   0007 0000 0000 0000

        JSRD    R4,     L_6CDE                  ; FC1F   0004 006E 00DE
        DECLE   $00BD,  $00BF                   ; FC22   00BD 00BF

        RRC     R2,     2                       ; FC24   0076
        SARC    R0,     1                       ; FC25   0078
        SARC    R1,     1                       ; FC26   0079
        SARC    R0,     2                       ; FC27   007C
        SARC    R0,     1                       ; FC28   0078
        ADCR    R4                              ; FC29   002C
        INCR    R0                              ; FC2A   0008
        RSWD    R4                              ; FC2B   003C
        SWAP    R2,     1                       ; FC2C   0042
        MOVR    R0,     R1                      ; FC2D   0081
        ADDR    R0,     R3                      ; FC2E   00C3
        SLR     R2,     2                       ; FC2F   0066
        SLR     R2,     2                       ; FC30   0066
        RLC     R2,     2                       ; FC31   0056
        MOVR    R7,     R6                      ; FC32   00BE
        ADDR    R7,     R4                      ; FC33   00FC
        MOVR    R5,     R6                      ; FC34   00AE
        ADDR    R3,     R7                      ; FC35   00DF

        MOVR    R1,     R6                      ; FC36   008E
        INCR    R4                              ; FC37   000C
        SLL     R2,     1                       ; FC38   004A
        RLC     R2,     2                       ; FC39   0056
        SLR     R3,     1                       ; FC3A   0063
        SETC                                    ; FC3B   0007
        TSTR    R0                              ; FC3C   0080
        SWAP    R1,     2                       ; FC3D   0045
        SLL     R1,     2                       ; FC3E   004D
        SLR     R2,     2                       ; FC3F   0066
        SAR     R0,     1                       ; FC40   0068
        RLC     R0,     2                       ; FC41   0054
        MOVR    R7,     R4                      ; FC42   00BC
        ADDR    R7,     R6                      ; FC43   00FE
        MOVR    R5,     R6                      ; FC44   00AE
L_FC45:
        ADDR    R3,     R7                      ; FC45   00DF

        DECLE   $008E,  $000C,  $004A,  $0056   ; FC46   008E 000C 004A 0056
        DECLE   $0063,  $0007,  $0004           ; FC4A   0063 0007 0004

        INCR    R2                              ; FC4D   000A
        SAR     R0,     1                       ; FC4E   0068
        TSTR    R4                              ; FC4F   00A4
        ADCR    R4                              ; FC50   002C
        RLC     R0,     2                       ; FC51   0054
        MOVR    R7,     R4                      ; FC52   00BC
        ADDR    R7,     R6                      ; FC53   00FE
        MOVR    R5,     R6                      ; FC54   00AE
        ADDR    R3,     R7                      ; FC55   00DF

        DECLE   $008E,  $000C,  $004A,  $0057   ; FC56   008E 000C 004A 0057
        DECLE   $0066,  $0004                   ; FC5A   0066 0004

        SWAP    R2,     1                       ; FC5C   0042
        MOVR    R1,     R4                      ; FC5D   008C
        SLL     R0,     1                       ; FC5E   0048
        NEGR    R4                              ; FC5F   0024
        ADCR    R4                              ; FC60   002C
        RLC     R0,     2                       ; FC61   0054
        MOVR    R7,     R4                      ; FC62   00BC
        ADDR    R7,     R4                      ; FC63   00FC
        MOVR    R5,     R6                      ; FC64   00AE
        ADDR    R3,     R7                      ; FC65   00DF

        DECLE   $000D,  $0048,  $00BA,  $00AC   ; FC66   000D 0048 00BA 00AC
        DECLE   $0000,  $0000,  $0064,  $0012   ; FC6A   0000 0000 0064 0012
        DECLE   $0010,  $0024,  $002C,  $0054   ; FC6E   0010 0024 002C 0054
        DECLE   $00BC,  $00FE,  $00AE,  $00DE   ; FC72   00BC 00FE 00AE 00DE
        DECLE   $000E,  $004C,  $0038,  $0010   ; FC76   000E 004C 0038 0010
        DECLE   $0030,  $0058,  $0022,  $00C1   ; FC7A   0030 0058 0022 00C1
        DECLE   $00C3,  $0042,  $00CB,  $005A   ; FC7E   00C3 0042 00CB 005A
        DECLE   $007F,  $003E,  $002A,  $005C   ; FC82   007F 003E 002A 005C
        DECLE   $0062,  $00C1,  $00BF           ; FC86   0062 00C1 00BF

        MOVR    R3,     R1                      ; FC89   0099
        SWAP    R2,     1                       ; FC8A   0042
        ADDR    R4,     R7                      ; FC8B   00E7

        DECR    R1                              ; FC8C   0011
        NEGR    R2                              ; FC8D   0022
        SLR     R3,     1                       ; FC8E   0063
        RLC     R2,     1                       ; FC8F   0052
        SLL     R3,     1                       ; FC90   004B
        SLLC    R2,     1                       ; FC91   005A
        SARC    R2,     2                       ; FC92   007E
        RLC     R2,     2                       ; FC93   0056
        RLC     R0,     2                       ; FC94   0054
        SARC    R2,     2                       ; FC95   007E
        CLRC                                    ; FC96   0006
        SWAP    R3,     1                       ; FC97   0043
        MOVR    R7,     R5                      ; FC98   00BD
        MOVR    R3,     R1                      ; FC99   0099
        SWAP    R2,     1                       ; FC9A   0042
        ADDR    R4,     R7                      ; FC9B   00E7

        DECLE   $0000,  $0004,  $0082,  $0046   ; FC9C   0000 0004 0082 0046
        DECLE   $00D2,  $005A,  $00FF           ; FCA0   00D2 005A 00FF

        RRC     R1,     2                       ; FCA3   0075
        RRC     R1,     2                       ; FCA4   0075
        SARC    R2,     2                       ; FCA5   007E
        SLR     R0,     1                       ; FCA6   0060
        SWAP    R3,     2                       ; FCA7   0047
        MOVR    R7,     R5                      ; FCA8   00BD
        MOVR    R3,     R1                      ; FCA9   0099
        SWAP    R2,     1                       ; FCAA   0042
        ADDR    R4,     R7                      ; FCAB   00E7

        DECLE   $0000,  $0042,  $0081,  $0042   ; FCAC   0000 0042 0081 0042
        DECLE   $00D3,  $005A,  $00BD,  $007E   ; FCB0   00D3 005A 00BD 007E
        DECLE   $006A,  $0036,  $00A2,  $00C0   ; FCB4   006A 0036 00A2 00C0
        DECLE   $00BF,  $0099,  $0002,  $0007   ; FCB8   00BF 0099 0002 0007
        DECLE   $0000,  $0000,  $0000,  $0083   ; FCBC   0000 0000 0000 0083
        DECLE   $0042,  $00CB,  $005C,  $007E   ; FCC0   0042 00CB 005C 007E
        DECLE   $006A,  $0036                   ; FCC4   006A 0036

        NEGR    R0                              ; FCC6   0020
        SWAP    R3,     1                       ; FCC7   0043
        SARC    R1,     2                       ; FCC8   007D
        MOVR    R3,     R1                      ; FCC9   0099
        SWAP    R2,     1                       ; FCCA   0042
        ADDR    R4,     R7                      ; FCCB   00E7

        DECLE   $0000,  $0000                   ; FCCC   0000 0000

        SLR     R1,     1                       ; FCCE   0061
        ADDR    R0,     R2                      ; FCCF   00C2
        ADDR    R1,     R3                      ; FCD0   00CB
        SLLC    R2,     1                       ; FCD1   005A
L_FCD2:
        SARC    R3,     2                       ; FCD2   007F
        DECLE   $007E,  $002E,  $007C,  $000D   ; FCD3   007E 002E 007C 000D
        DECLE   $0047,  $00BD,  $0099,  $0040   ; FCD7   0047 00BD 0099 0040
        DECLE   $00E0,  $0000,  $0000,  $0000   ; FCDB   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; FCF3   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0020   ; FD03   0000 0000 0040 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD0F   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0030   ; FD13   0000 0040 0040 0030
        DECLE   $0018,  $000A,  $0004,  $0001   ; FD17   0018 000A 0004 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD1B   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; FD1F   0000 0002 0000 0000
        DECLE   $0001,  $0000,  $0008,  $0000   ; FD23   0001 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD57   0000 0000 0000 0000
        DECLE   $0000                           ; FD5B   0000

        PSHR    R5                              ; FD5C   0275

        JSR     R5,     L_FEA1                  ; FD5D   0004 01FC 02A1

        BNC     L_FD8E                          ; FD60   0209 002C

        MVI     G_01C1, R5                      ; FD62   0285 01C1
        TSTR    R5                              ; FD64   00AD
        BEQ     L_FD8E                          ; FD65   0204 0027

        JSR     R5,     L_FE74                  ; FD67   0004 01FC 0274

        BNEQ    L_FD8E                          ; FD6A   020C 0022

        PSHR    R1                              ; FD6C   0271
L_FD6D:
        ADDI    #$0006, R1                      ; FD6D   02F9 0006
        MVII    #$0001, R2                      ; FD6F   02BA 0001
        MVO@    R2,     R1                      ; FD71   024A
        SUBI    #$0004, R1                      ; FD72   0339 0004
        MVI     G_01C2, R2                      ; FD74   0282 01C2
        CMPI    #$0001, R2                      ; FD76   037A 0001
        BGT     L_FD7B                          ; FD78   020E 0001

        INCR    R1                              ; FD7A   0009
L_FD7B:
        MVI@    R1,     R3                      ; FD7B   028B
        SWAP    R3,     1                       ; FD7C   0043
        ANDI    #$00FF, R3                      ; FD7D   03BB 00FF
        MVI     G_01C3, R1                      ; FD7F   0281 01C3
        MOVR    R2,     R4                      ; FD81   0094
        SARC    R2,     1                       ; FD82   007A
        BNC     L_FD8A                          ; FD83   0209 0005

        CMPR    R1,     R3                      ; FD85   014B
        BGT     L_FD8F                          ; FD86   020E 0007

        PULR    R0                              ; FD88   02B0
        PULR    R7                              ; FD89   02B7

L_FD8A:
        CMPR    R1,     R3                      ; FD8A   014B
        BLT     L_FD8F                          ; FD8B   0205 0002

        PULR    R0                              ; FD8D   02B0
L_FD8E:
        PULR    R7                              ; FD8E   02B7

L_FD8F:
        PULR    R1                              ; FD8F   02B1
        COMR    R4                              ; FD90   001C
        ANDI    #$0003, R4                      ; FD91   03BC 0003
        MOVR    R4,     R2                      ; FD93   00A2
        SDBD                                    ; FD94   0001
        MVI@    R5,     R3                      ; FD95   02AB
        TSTR    R3                              ; FD96   009B
        BEQ     L_FD8E                          ; FD97   0224 000A

        PULR    R5                              ; FD99   02B5
        SDBD                                    ; FD9A   0001
        CMPI    #$F7BD, R3                      ; FD9B   037B 00BD 00F7
        BEQ     L_FDA1                          ; FD9E   0204 0001
        MOVR    R3,     R7                      ; FDA0   009F

L_FDA1:
        ADDI    #$0002, R1                      ; FDA1   02F9 0002
        MVI     G_0319, R4                      ; FDA3   0284 0319
        MVO@    R4,     R1                      ; FDA5   024C
        INCR    R1                              ; FDA6   0009
        MVI     G_031A, R4                      ; FDA7   0284 031A
        MVO@    R4,     R1                      ; FDA9   024C
        SUBI    #$0003, R1                      ; FDAA   0339 0003
        MOVR    R3,     R7                      ; FDAC   009F

        AND@    R3,     R5                      ; FDAD   039D
        ADDR    R4,     R5                      ; FDAE   00E5
        TSTR    R5                              ; FDAF   00AD
        ADDR    R6,     R4                      ; FDB0   00F4
        TSTR    R5                              ; FDB1   00AD
        ADCR    R6                              ; FDB2   002E
L_FDB3:
        RLC     R1,     1                       ; FDB3   0051
        DECLE   $002E,  $0051,  $0035,  $0060   ; FDB4   002E 0051 0035 0060
        DECLE   $0001                           ; FDB8   0001

        ADD@    R6,     R6                      ; FDB9   02F6
        ADDR    R6,     R0                      ; FDBA   00F0
        TSTR    R5                              ; FDBB   00AD
        ADD@    R6,     R1                      ; FDBC   02F1

        JSR     R5,     L_5FCC                  ; FDBD   0004 015C 03CC
        JSR     R5,     L_6005                  ; FDC0   0004 0160 0005
        DECLE   $02BA,  $00FF,  $0004           ; FDC3   02BA 00FF 0004

        XORR    R7,     R4                      ; FDC6   01FC
        SUBR    R0,     R0                      ; FDC7   0100
        CLRR    R0                              ; FDC8   01C0

        JSR     R5,     L_FDB3                  ; FDC9   0004 01FC 01B3

L_FDCC:
        MOVR    R1,     R5                      ; FDCC   008D
        MVII    #$031D, R4                      ; FDCD   02BC 031D
L_FDCF:
        SDBD                                    ; FDCF   0001
        MVI@    R5,     R0                      ; FDD0   02A8
        SDBD                                    ; FDD1   0001
        ANDI    #$F7FF, R0                      ; FDD2   03B8 00FF 00F7
        MVO@    R0,     R4                      ; FDD5   0260
        SDBD                                    ; FDD6   0001
        MVI@    R5,     R0                      ; FDD7   02A8
L_FDD8:
        MVO@    R0,     R4                      ; FDD8   0260
        ADDI    #$000C, R5                      ; FDD9   02FD 000C
        ADDI    #$0006, R4                      ; FDDB   02FC 0006
        CMPI    #$0355, R4                      ; FDDD   037C 0355
        BLE     L_FDCF                          ; FDDF   0226 0011

        JSR     R5,     L_60BF                  ; FDE1   0004 0160 00BF

L_FDE4:
        PULR    R7                              ; FDE4   02B7

        PSHR    R5                              ; FDE5   0275
        DECR    R0                              ; FDE6   0010
        BMI     L_FDE4                          ; FDE7   022B 0004

        CMPI    #$0007, R0                      ; FDE9   0378 0007
        BGT     L_FDE4                          ; FDEB   022E 0008

        MVO     R0,     G_0169                  ; FDED   0240 0169
        PULR    R7                              ; FDEF   02B7

        MVII    #$0001, R2                      ; FDF0   02BA 0001
        B       L_FDF6                          ; FDF2   0200 0002

        MVII    #$0008, R2                      ; FDF4   02BA 0008
L_FDF6:
        PSHR    R5                              ; FDF6   0275
        PSHR    R0                              ; FDF7   0270
L_FDF8:
        MVI     G_0169, R0                      ; FDF8   0280 0169

        JSR     R5,     L_FDB3                  ; FDFA   0004 01FC 01B3

        MOVR    R1,     R5                      ; FDFD   008D
        ADDI    #$0004, R5                      ; FDFE   02FD 0004
        PULR    R0                              ; FE00   02B0
        SARC    R0,     1                       ; FE01   0078
        BNC     L_FE0F                          ; FE02   0209 000B
        BNEQ    L_FE07                          ; FE04   020C 0001

        NEGR    R2                              ; FE06   0022
L_FE07:
        MVII    #$0003, R3                      ; FE07   02BB 0003
        MVII    #$0068, R4                      ; FE09   02BC 0068
        ADDI    #$0002, R5                      ; FE0B   02FD 0002
        B       L_FE36                          ; FE0D   0200 0027

L_FE0F:
        MVII    #$0000, R0                      ; FE0F   02B8 0000
        BEQ     L_FE16                          ; FE11   0204 0003

L_FE13:
        MVII    #$0200, R0                      ; FE13   02B8 0200
L_FE15:
        NEGR    R2                              ; FE15   0022
L_FE16:
        MOVR    R1,     R4                      ; FE16   008C
        SDBD                                    ; FE17   0001
        MVI@    R4,     R1                      ; FE18   02A1
        SDBD                                    ; FE19   0001
        ANDI    #$FDFF, R1                      ; FE1A   03B9 00FF 00FD
        XORR    R0,     R1                      ; FE1D   01C1
        SUBI    #$0002, R4                      ; FE1E   033C 0002
        MVO@    R1,     R4                      ; FE20   0261
        SWAP    R1,     1                       ; FE21   0041
        MVO@    R1,     R4                      ; FE22   0261
        SWAP    R1,     1                       ; FE23   0041
L_FE24:
        PSHR    R1                              ; FE24   0271
        MVI     G_0169, R0                      ; FE25   0280 0169
        PSHR    R5                              ; FE27   0275

        JSR     R5,     .EXEC.76C               ; FE28   0004 0114 036C

        PULR    R5                              ; FE2B   02B5
        PULR    R0                              ; FE2C   02B0
        SDBD                                    ; FE2D   0001
        ANDI    #$F7FF, R0                      ; FE2E   03B8 00FF 00F7
        MVO@    R0,     R1                      ; FE31   0248
        MVII    #$0002, R3                      ; FE32   02BB 0002
        MVII    #$00A8, R4                      ; FE34   02BC 00A8
L_FE36:
        SDBD                                    ; FE36   0001
        MVI@    R5,     R0                      ; FE37   02A8
        SWAP    R0,     1                       ; FE38   0040
        ADDR    R2,     R0                      ; FE39   00D0
        BMI     L_FE3F                          ; FE3A   020B 0003

        CMPR    R4,     R0                      ; FE3C   0160
        BLE     L_FE40                          ; FE3D   0206 0001

L_FE3F:
        SUBR    R2,     R0                      ; FE3F   0110
L_FE40:
        SWAP    R0,     1                       ; FE40   0040
        SUBI    #$0002, R5                      ; FE41   033D 0002
        MVO@    R0,     R5                      ; FE43   0268
        SWAP    R0,     1                       ; FE44   0040
        MVO@    R0,     R5                      ; FE45   0268
        SWAP    R0,     1                       ; FE46   0040
L_FE47:
        PSHR    R0                              ; FE47   0270
        MVI     G_0169, R0                      ; FE48   0280 0169

        JSR     R5,     .EXEC.76C               ; FE4A   0004 0114 036C

        PULR    R0                              ; FE4D   02B0
        ADDR    R3,     R1                      ; FE4E   00D9
        MVO@    R0,     R1                      ; FE4F   0248
        PULR    R7                              ; FE50   02B7

        DECLE   $0239                           ; FE51   0239

        ADCR    R4                              ; FE52   002C
        MOVR    R5,     R7                      ; FE53   00AF

        ADDR    R2,     R0                      ; FE54   00D0
        RLC     R0,     1                       ; FE55   0050
L_FE56:
        RRC     R2,     2                       ; FE56   0076
        DECLE   $00AE,  $0028,  $0008,  $0001   ; FE57   00AE 0028 0008 0001
        DECLE   $0000,  $02F4,  $003C,  $02F2   ; FE5B   0000 02F4 003C 02F2
        DECLE   $0216                           ; FE5F   0216

        MOVR    R5,     R3                      ; FE60   00AB
        ADDR    R3,     R6                      ; FE61   00DE
        ADD@    R6,     R7                      ; FE62   02F7

        INCR    R0                              ; FE63   0008
        ADD@    R6,     R3                      ; FE64   02F3
L_FE65:
        RLC     R0,     1                       ; FE65   0050
        DECLE   $02F1,  $0004,  $01DC,  $01A3   ; FE66   02F1 0004 01DC 01A3

        NEGR    R4                              ; FE6A   0024
L_FE6B:
        MOVR    R5,     R7                      ; FE6B   00AF

        ADCR    R4                              ; FE6C   002C
        MOVR    R5,     R7                      ; FE6D   00AF

        DECLE   $0253,  $01C0,  $0004           ; FE6E   0253 01C0 0004

        XORR    R7,     R4                      ; FE71   01FC
        CMP@    R2,     R6                      ; FE72   0356
        PULR    R7                              ; FE73   02B7

L_FE74:
        PSHR    R5                              ; FE74   0275
        PULR    R7                              ; FE75   02B7

        PSHR    R5                              ; FE76   0275
        CLRR    R0                              ; FE77   01C0
        MVO     R0,     .UART.2                 ; FE78   0240 00E2
        MVI     G_0173, R0                      ; FE7A   0280 0173
        MVO     R0,     G_01C6                  ; FE7C   0240 01C6
        MVI     G_0162, R0                      ; FE7E   0280 0162
        ANDI    #$0001, R0                      ; FE80   03B8 0001
L_FE82:
        BNEQ    L_FF23                          ; FE82   020C 009F

        MVI     G_0162, R0                      ; FE84   0280 0162
        ANDI    #$00FE, R0                      ; FE86   03B8 00FE
        XORI    #$0001, R0                      ; FE88   03F8 0001
        MVO     R0,     G_0162                  ; FE8A   0240 0162
        MVII    #$028D, R4                      ; FE8C   02BC 028D

        JSR     R5,     L_DDD3                  ; FE8E   0004 01DC 01D3
        DECLE   $0244,  $027A,  $0260,  $01E4   ; FE91   0244 027A 0260 01E4
        DECLE   $038F                           ; FE95   038F

        BEQ     L_FC45                          ; FE96   0224 0252

        CMP     G_01B8, R0                      ; FE98   0340 01B8
        CMP@    R1,     R2                      ; FE9A   034A
        MOVR    R3,     R0                      ; FE9B   0098
        CMP@    R2,     R6                      ; FE9C   0356
L_FE9D:
        ADDR    R4,     R4                      ; FE9D   00E4
        ANDR    R7,     R4                      ; FE9E   01BC
        BEQ     L_FE9D                          ; FE9F   0224 0003

L_FEA1:
        SUB@    R3,     R6                      ; FEA1   031E
        DECLE   $0000                           ; FEA2   0000

        MVII    #$001D, R0                      ; FEA3   02B8 001D
        MVO     R0,     .UART.2                 ; FEA5   0240 00E2

        JSR     R5,     L_53B4                  ; FEA7   0004 0150 03B4

        CLRR    R0                              ; FEAA   01C0
        MVO     R0,     .UART.2                 ; FEAB   0240 00E2
        MVII    #$028D, R4                      ; FEAD   02BC 028D

        JSR     R5,     L_DDD3                  ; FEAF   0004 01DC 01D3

        XORR    R6,     R1                      ; FEB2   01F1
        TSTR    R2                              ; FEB3   0092
        MVO@    R2,     R3                      ; FEB4   025A
        XORR    R5,     R3                      ; FEB5   01EB
        COMR    R0                              ; FEB6   0018
        XOR@    R2,     R0                      ; FEB7   03D0
        BEQ     L_FE6B                          ; FEB8   0224 004E
        BPL     L_FAFB                          ; FEBA   0223 03C0

        JSR     R5,     L_53B4                  ; FEBC   0004 0150 03B4

        MVII    #$028C, R4                      ; FEBF   02BC 028C
        MVII    #$003C, R0                      ; FEC1   02B8 003C

        JSR     R5,     X_FILL_ZERO             ; FEC3   0004 0114 0338
        DECLE   $0001,  $02B8,  $0085,  $0040   ; FEC6   0001 02B8 0085 0040
        DECLE   $0001,  $02B9,  $00C8,  $0047   ; FECA   0001 02B9 00C8 0047
        DECLE   $0282,  $01C6,  $0092,  $020C   ; FECE   0282 01C6 0092 020C
        DECLE   $000F,  $0004                   ; FED2   000F 0004

        CMPR    R7,     R4                      ; FED4   017C
L_FED5:
        BC      L_FC1A                          ; FED5   0221 02BC

        MVI@    R1,     R5                      ; FED7   028D

        JSR     R5,     L_DDD3                  ; FED8   0004 01DC 01D3
        DECLE   $0224,  $0003,  $010D,  $00DE   ; FEDB   0224 0003 010D 00DE
        DECLE   $0000                           ; FEDF   0000

        B       L_FEEF                          ; FEE0   0200 000D

        DECLE   $0004,  $017C,  $0228           ; FEE2   0004 017C 0228

        MVII    #$028D, R4                      ; FEE5   02BC 028D

        JSR     R5,     L_DDD3                  ; FEE7   0004 01DC 01D3
        DECLE   $02D1,  $0113,  $010D,  $00DE   ; FEEA   02D1 0113 010D 00DE
        DECLE   $0000                           ; FEEE   0000
L_FEEF:
        MVI     G_015E, R0                      ; FEEF   0280 015E
        DECLE   $03B8,  $0008,  $022C,  $0005   ; FEF1   03B8 0008 022C 0005
        DECLE   $01C0,  $0240,  $00E2,  $0240   ; FEF5   01C0 0240 00E2 0240
        DECLE   $015E,  $0240,  $0000,  $0001   ; FEF9   015E 0240 0000 0001
        DECLE   $02B8,  $0000,  $0088,  $0001   ; FEFD   02B8 0000 0088 0001
        DECLE   $02B9,  $000C,  $008B,  $0282   ; FF01   02B9 000C 008B 0282
        DECLE   $01C6,  $0092,  $020C,  $0005   ; FF05   01C6 0092 020C 0005
        DECLE   $0004,  $017C,  $0221           ; FF09   0004 017C 0221

        B       L_FF11                          ; FF0C   0200 0003

        DECLE   $0004,  $017C,  $0228           ; FF0E   0004 017C 0228
L_FF11:
        MVI     G_015E, R0                      ; FF11   0280 015E
        ANDI    #$0008, R0                      ; FF13   03B8 0008
        BNEQ    L_FF11                          ; FF15   022C 0005

        CLRR    R0                              ; FF17   01C0
        MVO     R0,     .UART.2                 ; FF18   0240 00E2
        MVII    #$02A1, R4                      ; FF1A   02BC 02A1

        JSR     R5,     L_DDD3                  ; FF1C   0004 01DC 01D3
        DECLE   $006E,  $01A4,  $035E,  $0000   ; FF1F   006E 01A4 035E 0000
L_FF23:
        PULR    R7                              ; FF23   02B7

        DECLE   $016E,  $0003,  $039E,  $0000   ; FF24   016E 0003 039E 0000
        DECLE   $0253,  $01D1,  $009C,  $03C0   ; FF28   0253 01D1 009C 03C0
        DECLE   $0275,  $0004                   ; FF2C   0275 0004

        XORR    R7,     R4                      ; FF2E   01FC
        CMP     .BTAB.B7,R5                     ; FF2F   0345 02B7
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5028       <entry>
;;  $5092       $5033  
;;  $5096       <entry>
;;  $50B1       $50B5   $50CE   $D159  
;;  $50D0       $50AE  
;;  $514B       $5086   $514B  
;;  $514C       $50BF  
;;  $5154       $5175  
;;  $5169       $517D  
;;  $5173       $5152  
;;  $5177       $51A2   $51AA   $51D2  
;;  $5178       $515A   $515F   $5164  
;;  $519E       $518D   $5195  
;;  $51AD       $51D5  
;;  $51C9       $51DE  
;;  $51CF       $51AE  
;;  $51D8       $51C4   $51C7  
;;  $51FE       $51F0  
;;  $5204       $51FC   $51FF  
;;  $521F       $5214  
;;  $5226       $5220  
;;  $522E       $5227  
;;  $5237       $522F  
;;  $5254       $5256  
;;  $525C       $525E  
;;  $5263       $5238  
;;  $526A       $5288  
;;  $5274       $5285  
;;  $528A       $5264   $526C  
;;  $528C       $520D  
;;  $52AB       $52A7  
;;  $52B9       $50C8  
;;  $5312       $5306  
;;  $5316       $53A1   $53AB   $53AE   $53B2  
;;  $5318       $52EE  
;;  $531A       $52FA  
;;  $531C       $5380   $5383   $5387  
;;  $531E       $52FE   $5310  
;;  $5320       $5314  
;;  $5327       $52E8  
;;  $532E       $52F6  
;;  $5350       $52F2  
;;  $536B       $52D9   $5323   $5331   $5334   $5338   $5342   $5353   $5356  
;;  $536B       $535A   $5364   $536E   $5372   $5393   $5399  
;;  $536C       $52EC  
;;  $5382       $537A  
;;  $5385       $537C  
;;  $5389       $5302   $530A  
;;  $5395       $530E   $538B   $538F  
;;  $53AD       $53A3  
;;  $53B0       $53A7  
;;  $53B4       $5088   $FEA7   $FEBC  
;;  $53CA       $52DB  
;;  $53E7       $53D1   $53D7   $53DD   $53E3  
;;  $5401       $50D1   $534A   $5366   $5E6A   $61EC   $6577   $6838   $6C6B  
;;  $5401       $D813   $D822  
;;  $5403       $5137   $532B   $6B4F   $D6AA   $DCD1   $DEE3  
;;  $540A       $5405   $5BD0   $5C71   $5CA3  
;;  $541E       $5429  
;;  $5424       $5420  
;;  $5431       $543F   $544A  
;;  $544C       $542F  
;;  $5451       $544D  
;;  $545D       $5452  
;;  $5468       $5462  
;;  $546A       $545E   $5466  
;;  $5470       $5472  
;;  $547B       $546B   $5477  
;;  $5482       $547D  
;;  $5483       $548C   $54B6   $54BF   $54FE   $5515   $551B  
;;  $548E       $5487  
;;  $54AB       $5494  
;;  $54AC       $5490  
;;  $54B8       $5498  
;;  $54C1       $549C  
;;  $54D6       $54D3   $54D8  
;;  $54E4       $54C6  
;;  $54F6       $54E2   $54F8  
;;  $5500       $54A4  
;;  $550F       $54A0  
;;  $5517       $54A8  
;;  $5695       $5693  
;;  $5804       $F278  
;;  $5A2E       $5AC9   $6242   $63AA   $6CC3  
;;  $5A5C       $5A50  
;;  $5A6E       $63A6  
;;  $5A77       $5CD4  
;;  $5A89       $5A7A  
;;  $5A93       $5A96  
;;  $5A99       $5A8D  
;;  $5ABD       $5AA9  
;;  $5AC1       $5B27   $5BCB  
;;  $5AC4       $5AC7  
;;  $5ACE       $5ABF  
;;  $5AD0       $5AD2  
;;  $5AD4       $5B3B   $5B48   $5B5B   $5B6D   $5C5D  
;;  $5AFD       $5AAD   $5B02  
;;  $5B06       $5AAF  
;;  $5B0E       $5B12  
;;  $5B16       $5B08  
;;  $5B17       $5B21  
;;  $5B1A       $5B1D  
;;  $5B25       $5AB3  
;;  $5B31       $5B39  
;;  $5B3D       $5B2C  
;;  $5B3E       $5B46  
;;  $5B4A       $5B2A  
;;  $5B4C       $5B59  
;;  $5B52       $5B54  
;;  $5B57       $5B4E  
;;  $5B5D       $5B4A   $5B6B  
;;  $5B63       $5B65  
;;  $5B69       $5B5F  
;;  $5B6F       $5AB5  
;;  $5B78       $5B7B  
;;  $5B80       $5B72  
;;  $5B85       $5B8A  
;;  $5B8F       $5B70  
;;  $5B91       $5B97  
;;  $5B9B       $5B8F   $5BA2  
;;  $5BA6       $5AB9  
;;  $5BAB       $5BC0  
;;  $5BAC       $5BAA  
;;  $5BAF       $5BB8  
;;  $5BB4       $5BB1  
;;  $5BC4       $5ACC   $5AFB   $5B04   $5B14   $5B23   $5B7E   $5B8D   $5B99  
;;  $5BC4       $5BA4   $5BC2  
;;  $5BC9       $5AA7  
;;  $5BD3       $5ABB   $5D2F   $5E1D   $5E5D   $5EF8  
;;  $5BE7       $5BE1  
;;  $5BE9       $5BE5  
;;  $5BF6       $5BF2  
;;  $5C0C       $5BFB  
;;  $5C3F       $5C2A  
;;  $5C55       $5C3D   $5C58  
;;  $5C5F       $5C2E   $5C41  
;;  $5C63       $5C5A   $6D46  
;;  $5C64       $5C25  
;;  $5C6E       $5C68  
;;  $5C8C       $5C87  
;;  $5C98       $5AA3  
;;  $5CA3       $5C9E  
;;  $5D1E       $64D0   $DF2A   $DF7D  
;;  $5D2D       $5D2B  
;;  $5D31       $5D1C  
;;  $5D4A       $5D40   $5D46  
;;  $5D5D       $5D59  
;;  $5D79       $5D66  
;;  $5D83       $5D77  
;;  $5D97       $5D8F  
;;  $5DAA       $5D9F  
;;  $5DB6       $5DA8  
;;  $5DC8       $5DBF  
;;  $5DCB       $5DC6  
;;  $5DD8       $5DA1   $5DAF   $5E2B   $5E40  
;;  $5DEC       $5DDF   $5DE8  
;;  $5DEE       $5EAE   $661D   $66C6   $66CB  
;;  $5DF4       $5D79   $65A9  
;;  $5DF8       $5D68   $65AF  
;;  $5DFA       $5DF6  
;;  $5E13       $5E00   $5E28  
;;  $5E19       $5E21  
;;  $5E2A       $5D7D   $5D92   $5DD1   $DF91  
;;  $5E38       $5E3D  
;;  $5E3F       $5D71   $5D8A   $5DCF   $DF8C  
;;  $5E47       $5E3A  
;;  $5E49       $6617  
;;  $5E5A       $5AA1  
;;  $5E9C       $5E98   $6608  
;;  $5EA1       $6683   $675D  
;;  $5EA2       $5EA0  
;;  $5EBD       $5EB7  
;;  $5EC0       $5EBB   $5EC2  
;;  $5ED3       $5EC7  
;;  $5ED6       $5ED1  
;;  $5ED7       $5EDC  
;;  $5EDE       $5ECB  
;;  $5EE5       $5EE1  
;;  $5EEC       $5F03  
;;  $5EF1       $5EF5  
;;  $5F05       $5C6B   $5CF6   $5E5F  
;;  $5F07       $5BEB   $5CB8   $5D6E   $5F16  
;;  $5F0B       $5F0D  
;;  $5F18       $5F11  
;;  $5F19       $5A6A  
;;  $5F1A       $5F24  
;;  $5F1E       $5F2A  
;;  $5F26       $5F1C  
;;  $5F2C       $5AF8   $5F27  
;;  $5F37       $5F33  
;;  $5F5C       $5CD9  
;;  $5F74       $668F  
;;  $5FC3       $609E  
;;  $5FCC       $5E9D   $5FBA   $6499   $68A3   $D0F3   $DD7B   $DFB5   $FDBD  
;;  $5FEE       $5FE0   $5FE5  
;;  $5FF1       $5FFE  
;;  $6004       $F29C  
;;  $6005       $5FBD   $D0F6   $DD7E   $DFB8   $FDC0  
;;  $6012       $6014  
;;  $6019       $5DC1   $6245  
;;  $601D       $5E93   $5FC3   $60A0  
;;  $6029       $601B   $6023  
;;  $603B       $60AF  
;;  $6057       $60AB  
;;  $608B       $6079  
;;  $6095       $6089  
;;  $60B3       <entry>
;;  $60BF       $5FC0   $D145   $DD81   $DFBB   $FDE1  
;;  $60C6       $60CB  
;;  $60EB       $60E9  
;;  $60F8       $6104  
;;  $60FA       $60FF  
;;  $6116       $5D01   $6106   $624B   $64BA   $DF1B  
;;  $6118       $64D5   $659D   $6B8E   $6CBA  
;;  $612C       $63EF  
;;  $6136       $610F   $620E  
;;  $615A       $610C   $61DC  
;;  $617F       $6178   $6C0F  
;;  $6191       $6189  
;;  $6194       $618F  
;;  $61C9       $61BF  
;;  $61CD       $61C7  
;;  $620C       $620A  
;;  $620E       $6208  
;;  $623E       $5C89  
;;  $6255       $6214   $6CB2  
;;  $625B       $625F  
;;  $6267       $626D  
;;  $627C       $6278  
;;  $627E       $6280  
;;  $628A       $6286  
;;  $628C       $6291  
;;  $6294       $6248  
;;  $6298       $629A   $62A4  
;;  $62A6       $629E  
;;  $62A9       $6217   $63A2  
;;  $62B8       $62CB  
;;  $62BA       $62C4  
;;  $62C2       $62BF  
;;  $62CE       $63C8  
;;  $62DF       $62FF  
;;  $62F0       $62D4  
;;  $62F6       $62F2  
;;  $6301       $62D8   $62F8  
;;  $6315       $630C  
;;  $6316       $631D  
;;  $631A       $630A  
;;  $631F       $631A  
;;  $6323       $6311   $6316  
;;  $6327       $6313   $6318   $6321  
;;  $632B       $6325  
;;  $633C       $6251   $62DF   $6CC0  
;;  $6345       $6341  
;;  $634F       $634C  
;;  $6356       $6352  
;;  $635F       $63C4   $63D0  
;;  $6373       $6364  
;;  $6383       $63BA  
;;  $638B       $6390  
;;  $6392       $638C  
;;  $6395       $5BC6  
;;  $639C       $639E  
;;  $63A5       $62E6   $6375   $63CC  
;;  $63AE       $637B  
;;  $63BC       $6396  
;;  $63E0       $63DC  
;;  $63E2       $5A5C   $62E8  
;;  $63ED       $63E5   $6407   $641C  
;;  $63F3       $63EB  
;;  $63FC       $63F8  
;;  $6413       $640D  
;;  $64A7       $64A9  
;;  $64AF       $64B3  
;;  $64D0       $64CC  
;;  $64DB       $6500  
;;  $64E9       $64F4   $64F8   $64FC  
;;  $64EA       $6496   $64EF   $DF18  
;;  $6502       $5DC8   $649C  
;;  $650E       $6513  
;;  $65AF       $65A7  
;;  $65B3       $65AD  
;;  $6605       $65D0   $65FE  
;;  $660C       $6605  
;;  $660D       $6760  
;;  $6615       $6688  
;;  $661D       $66B5  
;;  $6628       $661B   $6644   $6767  
;;  $6629       $6624  
;;  $662C       $660F   $6648   $666D   $66A9   $66BA   $6734  
;;  $6639       $6632  
;;  $663D       $6634   $6637  
;;  $6652       $664E  
;;  $6663       $665D  
;;  $6665       $6657   $6661  
;;  $6680       $6671   $6674  
;;  $6681       $667F  
;;  $6692       $668D  
;;  $66A4       $66A5  
;;  $66A9       $66A7  
;;  $66D4       $66C4  
;;  $66D8       $66D2  
;;  $66E0       $66FF  
;;  $66E4       $66F8  
;;  $66F6       $66E9   $66EE  
;;  $6715       $66DC  
;;  $6719       $6730  
;;  $672C       $671D  
;;  $67C8       $67CA  
;;  $67E4       $6819  
;;  $67E6       $67CD   $6873  
;;  $6801       $F27C  
;;  $6810       $67E0   $6815   $6907   $6922   $693A   $6957   $6967  
;;  $6834       $6836  
;;  $683E       $6820  
;;  $6894       $D21C  
;;  $68A7       $6895  
;;  $68B1       $68C9   $68CF  
;;  $68C2       $68C7  
;;  $68CB       $68B9   $68CD  
;;  $68D1       $68B3   $68D8  
;;  $68D6       $68E8   $68EB  
;;  $68EA       $68DB  
;;  $68ED       $68D4  
;;  $6901       $6903  
;;  $6919       $691C  
;;  $692C       $6941  
;;  $692E       $693D  
;;  $6944       $68F2  
;;  $694D       $694F  
;;  $695F       $696E  
;;  $6961       $696A  
;;  $6A19       $F14C  
;;  $6A20       $6E5D   $D67B   $DD33  
;;  $6A66       $6A72  
;;  $6A75       $6A59   $6AE3  
;;  $6A7B       $6ABD  
;;  $6A87       $6A82  
;;  $6A9F       $6A98  
;;  $6AA4       $6A80  
;;  $6AAD       $6A9D   $6AA2  
;;  $6AE8       $6AF2  
;;  $6AF0       $6AED  
;;  $6B2F       $6BF4   $6BF8   $6BFE   $6C27   $6D10  
;;  $6B43       $6B41  
;;  $6B94       $6C03  
;;  $6B97       $6C4C  
;;  $6B9E       $6B94  
;;  $6BC6       $6BC2  
;;  $6BDD       $6BC6   $6BCE   $6BD9   $6BEF  
;;  $6BDF       $6BEA  
;;  $6BE9       $6BE5  
;;  $6C05       $6B97  
;;  $6C16       $5A7C   $5C4B   $63AE   $6C06   $6C9A   $6CCF   $6CDB   $6D4F  
;;  $6C23       $6C1F  
;;  $6C25       $6C1D  
;;  $6C43       $6C3F  
;;  $6C4E       $6B9A  
;;  $6CB5       $5C95  
;;  $6CCE       $6CAF   $6D77  
;;  $6CDA       $63BC   $6CB5   $6D7A  
;;  $6CDE       $FBFC   $FC1F  
;;  $6CE8       $6D14  
;;  $6CF3       $6CFA  
;;  $6CF8       $6CF4  
;;  $6CF9       $6CF7  
;;  $6D01       $6D0C  
;;  $6D0B       $6D03  
;;  $6D4F       $6D44  
;;  $6D5B       $6D58  
;;  $6D68       $6D81  
;;  $6D7E       $6D60   $6D63  
;;  $6D80       $6D66  
;;  $6D81       $6D7F  
;;  $6DA4       $6B9F   $6BFA   $6C17   $6C2C   $6C38   $6C4F  
;;  $6DAD       $6C00  
;;  $6DB8       $6C32   $6C49  
;;  $6E07       $6E05  
;;  $6E0E       $6E0C  
;;  $6E15       $6E13  
;;  $6E1C       $6E1A  
;;  $6E48       $6E4B   $6E60  
;;  $6E59       $6E54  
;;  $6E63       $6E5A  
;;  $6E72       $6E6D  
;;  $6EB0       $6E69  
;;  $6EC3       $6F4C  
;;  $6ED5       $6ED0  
;;  $6EF3       $6EED  
;;  $6F2A       $6F24  
;;  $6F45       $6F41  
;;  $6F47       $6EC7   $6ECB   $6ED3   $6ED8   $6EE1   $6EF0   $6EF8   $6F3A  
;;  $6F4E       $6EB9   $6EC0  
;;  $D007       $D005  
;;  $D009       $D007  
;;  $D013       $D015  
;;  $D01B       $D00D  
;;  $D059       $6E8C  
;;  $D0B6       $D0AE  
;;  $D0D7       $D0B4  
;;  $D0E9       $D0E4  
;;  $D107       $D11C  
;;  $D112       $D109  
;;  $D115       $D110  
;;  $D13A       $D136  
;;  $D13F       $D132  
;;  $D140       $D13E  
;;  $D145       $D126  
;;  $D14F       $D157  
;;  $D19C       $D1AB  
;;  $D1B3       $D1BD  
;;  $D2D6       $D298  
;;  $D3E6       $D3E0  
;;  $D3FE       $D405  
;;  $D407       $D400  
;;  $D415       $D40B  
;;  $D431       $D42A  
;;  $D434       $D42F  
;;  $D43D       $D421  
;;  $D444       $D43B  
;;  $D47E       $D455   $D463  
;;  $D4BA       $D4B6  
;;  $D4BD       $D4CC   $D4D4   $D4DF   $D4E3   $D4E6   $D4FB  
;;  $D4EC       $D4D0   $D4DA  
;;  $D53C       $D534  
;;  $D583       $D555   $D56F   $D573   $D577   $D57B  
;;  $D584       $D57E   $D581  
;;  $D5B9       $D642   $D678   $D67E  
;;  $D5E9       $D5D5  
;;  $D5FB       $D5E4   $D5E7  
;;  $D630       $D64C   $D653   $D65E   $D675   $D688   $D68F   $D69A   $D736  
;;  $D630       $D7E5   $D811  
;;  $D631       $D5DC  
;;  $D660       $D65B  
;;  $D69C       $D697  
;;  $D6AA       $D6A5  
;;  $D6C5       $D6BC  
;;  $D6FF       $D6F9  
;;  $D705       $D6ED  
;;  $D711       $D74E  
;;  $D73B       $D738  
;;  $D771       $D768  
;;  $D7A5       $D79F  
;;  $D7B8       $D7B3  
;;  $D7C8       $D7EF  
;;  $D7D9       $D7D6  
;;  $D9F6       $D9F4  
;;  $DAA2       $DA28  
;;  $DBFA       $DC83   $DC90  
;;  $DC08       $DC04  
;;  $DC49       $DC7F   $DC87   $DCC4   $DD4B   $DD51   $DD8E   $DDE5   $DE02  
;;  $DC4A       $DC0B  
;;  $DCD1       $DCCC  
;;  $DD1C       $DD18  
;;  $DD54       $DD4E  
;;  $DD6C       $DD68  
;;  $DD81       $DDF9  
;;  $DD84       $DDF7  
;;  $DDA7       $DDAC  
;;  $DDAE       $DDA2   $DDA8   $DDB5  
;;  $DDB0       $DDB2  
;;  $DDB8       $DDA0  
;;  $DDBE       $DDC2  
;;  $DDC4       $DDB9   $DDBF   $DDCF  
;;  $DDC6       $DDC8  
;;  $DDD3       $504C   $5062   $5BFD   $5C0C   $5CC1   $5D0D   $5D4B   $67EC  
;;  $DDD3       $6844   $687C   $D5EB   $D601   $D633   $DC0F   $DC2E   $DE81  
;;  $DDD3       $F105   $F19F   $FE8E   $FEAF   $FED8   $FEE7   $FF1C  
;;  $DDDA       $5489   $54B2   $6E99   $D6FF   $D7A6   $D7B8  
;;  $DDE4       $DDE1  
;;  $DDEA       $DDE7  
;;  $DDEE       $DDEB  
;;  $DDF4       $DDF0   $DE0D   $DE11  
;;  $DDFC       $DDDF  
;;  $DE01       $DDFE  
;;  $DE07       $DE04  
;;  $DE0B       $DE08  
;;  $DE28       $6D34   $F0BC  
;;  $DE38       $6EA5   $6EAC   $D7DF   $DE78   $F0C0  
;;  $DE43       $6E48   $D5B9   $D709   $D70D   $D7BB   $D7BF  
;;  $DE4C       $60E2   $6203   $65B3   $66A0  
;;  $DE4F       $5AEE  
;;  $DE5E       $DEC5  
;;  $DE6C       $DE68  
;;  $DE72       $DEA7  
;;  $DE77       $DE7D  
;;  $DE78       $DE76  
;;  $DE8C       $DE6F  
;;  $DEC3       $DECB  
;;  $DECB       $DE28  
;;  $DF2A       $DF26  
;;  $DF37       $DF9C  
;;  $DF85       $DFA2  
;;  $DF91       $DF8A  
;;  $DF94       $DF8F  
;;  $DFBB       $DFE4  
;;  $DFC4       $DFEB  
;;  $F056       $F05D  
;;  $F068       $F077  
;;  $F085       $F093  
;;  $F095       $F143  
;;  $F0BF       $F0BA  
;;  $F0CD       $F0CA  
;;  $F0CF       $F19B  
;;  $F0DB       $F0D5  
;;  $F1CF       $F173  
;;  $F24C       $F24C  
;;  $F260       $F260  
;;  $F577       $D720  
;;  $F589       $D725  
;;  $F59B       $D150   $D718  
;;  $F627       $D47B   $D51D  
;;  $F69D       $F69B  
;;  $F760       $6AE8  
;;  $FA79       $FA77  
;;  $FAFB       $FEBA  
;;  $FAFD       $FAFB  
;;  $FBAC       $FBAA  
;;  $FBBC       $FBBA  
;;  $FC1A       $FED5  
;;  $FC45       $FE96  
;;  $FCD2       $547F   $6B3B   $D0F0  
;;  $FD6D       $D711   $D7C3  
;;  $FD7B       $FD78  
;;  $FD8A       $FD83  
;;  $FD8E       $FD60   $FD65   $FD6A   $FD97  
;;  $FD8F       $FD86   $FD8B  
;;  $FDA1       $FD9E  
;;  $FDB3       $6A88   $D0B8   $D0BE   $D507   $DD22   $FDC9   $FDFA  
;;  $FDCC       $D3D1   $D3F0   $DF49   $DF5D  
;;  $FDCF       $FDDF  
;;  $FDD8       $D72A   $F0D7  
;;  $FDE4       $FDE7   $FDEB  
;;  $FDF6       $FDF2  
;;  $FDF8       $5C5F   $6D4A   $D758   $F1CF  
;;  $FE07       $FE04  
;;  $FE0F       $FE02  
;;  $FE13       $61B2   $6237   $6600   $689E   $6CC6  
;;  $FE15       $6BAB  
;;  $FE16       $FE11  
;;  $FE24       $603F   $61D5   $6A23   $F131  
;;  $FE36       $FE0D  
;;  $FE3F       $FE3A  
;;  $FE40       $FE3D  
;;  $FE47       $6001   $6B3E  
;;  $FE56       $6AC1   $6E63   $D63D   $DD2B  
;;  $FE65       $5D1F   $605F   $6366   $6769   $67D2   $685E   $D661   $D7F2  
;;  $FE65       $DC67   $DD40   $DEB5   $DF6D   $F0F3  
;;  $FE6B       $FEB8  
;;  $FE74       $6EBD   $6ED5   $D4F8   $FD67  
;;  $FE82       $D52B   $D55B  
;;  $FE9D       $FE9F  
;;  $FEA1       $532E   $5350   $D3DD   $D427   $D44A   $FD5D  
;;  $FED5       $DC8D  
;;  $FEEF       $FEE0  
;;  $FF11       $FF0C   $FF15  
;;  $FF23       $FE82  
;; ======================================================================== ;;
