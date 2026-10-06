
        ORG     $5000
.HEADER:
        BIDECLE $53BD           ; 5000  Ptr: MOB graphic images
        BIDECLE $5088           ; 5002  Ptr: EXEC timer table
        BIDECLE $5092           ; 5004  Ptr: Start of game
        BIDECLE $53BD           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5697           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0003           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $000D,  $000F   ; 500F  Color Stack init (0, 1)
        DECLE   $000A,  $0009   ; 5011  Color Stack init (2, 3)
        DECLE   $000E           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TITLE:
        DECLE   $0052                           ; 501C  Cartridge year
        STRING  "DUNGEONS & DRAGONS"            ; 501D  Title string
        DECLE   $0000                           ; 502F  

.TITLECODE:
        PSHR    R5                              ; 5030   0275
        MVII    #$0057, R1                      ; 5031   02B9 0057
        MVO     R1,     .BTAB.9F                ; 5033   0241 029F
        MVII    #$027E, R4                      ; 5035   02BC 027E
        MVII    #$0007, R3                      ; 5037   02BB 0007
        CMP     .PSG0.rgt_hand,R3               ; 5039   0343 01FE
        BNEQ    L_503F                          ; 503B   020C 0002

        MVO     R3,     G_01D8                  ; 503D   0243 01D8

L_503F:
        JSR     R5,     X_PRINT_R5              ; 503F   0004 0118 007B
        STRING  "ADVANCED"                      ; 5042  
        DECLE   $0000                           ; 504A   0000

        MVII    #$02A6, R4                      ; 504B   02BC 02A6

        JSR     R5,     X_PRINT_R5              ; 504D   0004 0118 007B
        STRING  "cartridge"                     ; 5050  
        DECLE   $0000                           ; 5059   0000

        MVII    #$02DD, R4                      ; 505A   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 505C   0004 0118 007B
        STRING  "Copr @ 1982 TSR"               ; 505F  
        DECLE   $0000                           ; 506E   0000

        MVII    #$02B5, R4                      ; 506F   02BC 02B5

        JSR     R5,     X_PRINT_R5              ; 5071   0004 0118 007B
        STRING  "*TM of TSR HOBBIES"            ; 5074  
        DECLE   $0000                           ; 5086   0000

        PULR    R7                              ; 5087   02B7

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5088  Timer dispatch/interval
        DECLE   $00B0,  $0050,  $0001,  $0000; 508C  Timer dispatch/interval
        BIDECLE $0000           ; 5090  End of timer table

.START:
        MVI     G_0103, R0                      ; 5092   0280 0103
        SUBI    #$0003, R0                      ; 5094   0338 0003
        MVO     R0,     G_01CB                  ; 5096   0240 01CB
        MVI     G_035E, R0                      ; 5098   0280 035E
        PSHR    R0                              ; 509A   0270

        JSR     R5,     L_5286                  ; 509B   0004 0150 0286
        DECLE   $01CC,  $0082,  $0103,  $0003   ; 509E   01CC 0082 0103 0003
        DECLE   $01D2,  $0003,  $01C9,  $0003   ; 50A2   01D2 0003 01C9 0003
        DECLE   $0116,  $00AE,  $0118,  $0070   ; 50A6   0116 00AE 0118 0070
        DECLE   $01D3,  $0079,  $0000           ; 50AA   01D3 0079 0000

        J       .EXEC.08F                       ; 50AD   0004 0310 008F

L_50B0:
        PSHR    R5                              ; 50B0   0275
        MVI     G_01CC, R3                      ; 50B1   0283 01CC
        MOVR    R3,     R1                      ; 50B3   0099
        SWAP    R1,     2                       ; 50B4   0045
        BMI     L_513A                          ; 50B5   020B 0083

        DECR    R3                              ; 50B7   0013
        BMI     L_512D                          ; 50B8   020B 0073
        BNEQ    L_50CB                          ; 50BA   020C 000F

        JSR     R5,     L_6081                  ; 50BC   0004 0160 0081
        JSR     R5,     L_56B8                  ; 50BF   0004 0154 02B8
        JSR     R5,     L_5C34                  ; 50C2   0004 015C 0034
        JSR     R5,     L_5E88                  ; 50C5   0004 015C 0288
        JSR     R5,     L_572E                  ; 50C8   0004 0154 032E
L_50CB:
        JSR     R5,     L_6081                  ; 50CB   0004 0160 0081

        MVII    #$0005, R0                      ; 50CE   02B8 0005

        JSR     R5,     X_RAND1                 ; 50D0   0004 0114 027D

        TSTR    R0                              ; 50D3   0080
        BNEQ    L_50D9                          ; 50D4   020C 0003

        JSR     R5,     L_630B                  ; 50D6   0004 0160 030B

L_50D9:
        MVII    #$0011, R2                      ; 50D9   02BA 0011
        MVI     G_01CE, R3                      ; 50DB   0283 01CE
        DECR    R3                              ; 50DD   0013
        BMI     L_50ED                          ; 50DE   020B 000D
        BEQ     L_50E7                          ; 50E0   0204 0005

        CMPI    #$0009, R3                      ; 50E2   037B 0009
        BGE     L_50E7                          ; 50E4   020D 0001

        CLRR    R2                              ; 50E6   01D2
L_50E7:
        SDBD                                    ; 50E7   0001
        XORI    #$1000, R2                      ; 50E8   03FA 0000 0010
        MVO     R3,     G_032A                  ; 50EB   0243 032A
L_50ED:
        MVO     R2,     G_0325                  ; 50ED   0242 0325
        MVI     G_031F, R0                      ; 50EF   0280 031F
        MVO     R0,     G_0327                  ; 50F1   0240 0327
        MVI     G_0320, R0                      ; 50F3   0280 0320
        MVO     R0,     G_0328                  ; 50F5   0240 0328
        MVI     G_01D4, R0                      ; 50F7   0280 01D4
        XORI    #$0001, R0                      ; 50F9   03F8 0001
        BNEQ    L_5105                          ; 50FB   020C 0008

        MVI     G_031D, R1                      ; 50FD   0281 031D
        SDBD                                    ; 50FF   0001
        XORI    #$1000, R1                      ; 5100   03F9 0000 0010
        MVO     R1,     G_031D                  ; 5103   0241 031D
L_5105:
        MVO     R0,     G_01D4                  ; 5105   0240 01D4
        MVI     G_01D3, R2                      ; 5107   0282 01D3
        ADDI    #$0200, R2                      ; 5109   02FA 0200
        MVII    #$0008, R0                      ; 510B   02B8 0008
        MOVR    R7,     R4                      ; 510D   00BC
        ADDI    #$0020, R4                      ; 510E   02FC 0020
L_5110:
        PSHR    R0                              ; 5110   0270
        MVI@    R2,     R0                      ; 5111   0290
        SDBD                                    ; 5112   0001
        CMPI    #$089D, R0                      ; 5113   0378 009D 0008
        BNEQ    L_5126                          ; 5116   020C 000E

        MVO     R0,     G_015D                  ; 5118   0240 015D

        JSR     R5,     L_58EB                  ; 511A   0004 0158 00EB

        ANDI    #$0003, R1                      ; 511D   03B9 0003
        ADDR    R7,     R1                      ; 511F   00F9
        ADDI    #$0016, R1                      ; 5120   02F9 0016
        MVI@    R1,     R1                      ; 5122   0289
        SWAP    R1,     1                       ; 5123   0041
        ADDR    R1,     R0                      ; 5124   00C8
        MVO@    R0,     R2                      ; 5125   0250
L_5126:
        ADD@    R4,     R2                      ; 5126   02E2
        SUBI    #$0015, R2                      ; 5127   033A 0015
        PULR    R0                              ; 5129   02B0
        DECR    R0                              ; 512A   0010
        BPL     L_5110                          ; 512B   0223 001C
L_512D:
        PULR    R7                              ; 512D   02B7

        DECLE   $0000,  $0016,  $0016,  $0027   ; 512E   0000 0016 0016 0027
L_5132:
        DECR    R7                              ; 5132   0017

        DECLE   $0027,  $0016,  $0016,  $0036   ; 5133   0027 0016 0016 0036
        DECLE   $0004                           ; 5137   0004

        EIS                                     ; 5138   0002
        DECR    R0                              ; 5139   0010
L_513A:
        CLRR    R0                              ; 513A   01C0
        MVO     R0,     G_01DA                  ; 513B   0240 01DA
        MVO     R0,     G_01DD                  ; 513D   0240 01DD
        MVII    #$0040, R0                      ; 513F   02B8 0040
        MVII    #$031D, R4                      ; 5141   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 5143   0004 0114 0338

        SDBD                                    ; 5146   0001
        MVII    #$1906, R0                      ; 5147   02B8 0006 0019
        MVO     R0,     G_035D                  ; 514A   0240 035D
        MOVR    R3,     R0                      ; 514C   0098
        ANDI    #$0003, R0                      ; 514D   03B8 0003
        MVO     R0,     G_01CC                  ; 514F   0240 01CC
        ANDI    #$0007, R3                      ; 5151   03BB 0007
        CMPI    #$0004, R3                      ; 5153   037B 0004
        BGT     L_5182                          ; 5155   020E 002B

        CMPI    #$0002, R3                      ; 5157   037B 0002
        BGT     L_51BF                          ; 5159   020E 0064
        BEQ     L_51B3                          ; 515B   0204 0056

        MVII    #$00FF, R1                      ; 515D   02B9 00FF
        MVO     R1,     G_01CA                  ; 515F   0241 01CA
        MVII    #$0171, R4                      ; 5161   02BC 0171
        MVII    #$004C, R0                      ; 5163   02B8 004C

        JSR     R5,     X_FILL_MEM              ; 5165   0004 0114 0341

        MVII    #$01BF, R4                      ; 5168   02BC 01BF
        MVII    #$0001, R0                      ; 516A   02B8 0001
        MVO@    R0,     R4                      ; 516C   0260
        CLRR    R0                              ; 516D   01C0
        MVO@    R0,     R4                      ; 516E   0260
        MVO@    R0,     R4                      ; 516F   0260
        MVO@    R0,     R4                      ; 5170   0260
        INCR    R0                              ; 5171   0008

        JSR     R5,     X_RAND1                 ; 5172   0004 0114 027D

        INCR    R0                              ; 5175   0008
        SLL     R0,     2                       ; 5176   004C
        MVO     R0,     G_0136                  ; 5177   0240 0136
        DECR    R0                              ; 5179   0010
        MVO     R0,     G_0135                  ; 517A   0240 0135

        JSR     R5,     L_5B4E                  ; 517C   0004 0158 034E
        JSR     R5,     L_6260                  ; 517F   0004 0160 0260
L_5182:
        JSR     R5,     L_5286                  ; 5182   0004 0150 0286
        DECLE   $01BD,  $0004,  $01BE,  $002C   ; 5185   01BD 0004 01BE 002C
        DECLE   $01E2,  $0001,  $015F,  $0003   ; 5189   01E2 0001 015F 0003
        DECLE   $016F,  $0000,  $0160,  $0003   ; 518D   016F 0000 0160 0003
        DECLE   $0161,  $0007,  $01D9,  $00FF   ; 5191   0161 0007 01D9 00FF
        DECLE   $01DC,  $0004,  $01DF,  $0004   ; 5195   01DC 0004 01DF 0004
        DECLE   $01D6,  $0000,  $0000           ; 5199   01D6 0000 0000

        MVI     G_0135, R0                      ; 519C   0280 0135
        MVO     R0,     G_015E                  ; 519E   0240 015E
        MVII    #$031D, R2                      ; 51A0   02BA 031D
        SDBD                                    ; 51A2   0001
        MVII    #$6445, R1                      ; 51A3   02B9 0045 0064

        JSR     R5,     X_INIT_MOB              ; 51A6   0004 0114 02B2
        JSR     R5,     L_5EF7                  ; 51A9   0004 015C 02F7

        SDBD                                    ; 51AC   0001
        MVII    #$655B, R0                      ; 51AD   02B8 005B 0065
        MVO     R0,     G_035D                  ; 51B0   0240 035D
        PULR    R7                              ; 51B2   02B7

L_51B3:
        SDBD                                    ; 51B3   0001
        MVII    #$6563, R0                      ; 51B4   02B8 0063 0065
        MVO     R0,     G_035D                  ; 51B7   0240 035D

        JSR     R5,     X_STOP_SFX              ; 51B9   0004 011C 02B4

        CLRR    R0                              ; 51BC   01C0
        MVO     R0,     G_0146                  ; 51BD   0240 0146
L_51BF:
        CLRR    R0                              ; 51BF   01C0
        MVO     R0,     G_01DC                  ; 51C0   0240 01DC
        MVO     R0,     G_01DF                  ; 51C2   0240 01DF
        MVI     G_01CA, R1                      ; 51C4   0281 01CA
        SUBI    #$000D, R1                      ; 51C6   0339 000D
        BMI     L_51D3                          ; 51C8   020B 0009

        CMPI    #$0003, R1                      ; 51CA   0379 0003
        BGE     L_51D3                          ; 51CC   020D 0005

        ADDI    #$01CF, R1                      ; 51CE   02F9 01CF
        MVI@    R1,     R0                      ; 51D0   0288
        INCR    R0                              ; 51D1   0008
        MVO@    R0,     R1                      ; 51D2   0248
L_51D3:
        MOVR    R7,     R1                      ; 51D3   00B9
        ADDI    #$0051, R1                      ; 51D4   02F9 0051
        MVII    #$034D, R2                      ; 51D6   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 51D8   0004 0114 02B2

        MVII    #$031D, R2                      ; 51DB   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 51DD   0004 0114 02B2

        MVI@    R2,     R0                      ; 51E0   0290
        XORI    #$0040, R0                      ; 51E1   03F8 0040
        MVO@    R0,     R2                      ; 51E3   0250
        MVI     G_01D3, R1                      ; 51E4   0281 01D3
        MOVR    R1,     R3                      ; 51E6   008B
        MVII    #$0131, R4                      ; 51E7   02BC 0131
        MOVR    R4,     R5                      ; 51E9   00A5
L_51EA:
        MVI@    R4,     R0                      ; 51EA   02A0
        MVO@    R3,     R5                      ; 51EB   026B
        MOVR    R0,     R3                      ; 51EC   0083
        CMPI    #$0135, R4                      ; 51ED   037C 0135
        BLT     L_51EA                          ; 51EF   0225 0006

        JSR     R5,     L_5262                  ; 51F1   0004 0150 0262

        ADDI    #$0002, R2                      ; 51F4   02FA 0002
        MVO@    R0,     R2                      ; 51F6   0250
        ADDI    #$0200, R1                      ; 51F7   02F9 0200
        INCR    R2                              ; 51F9   000A
        MVO@    R1,     R2                      ; 51FA   0251
        ADDI    #$0002, R2                      ; 51FB   02FA 0002
        MVI     G_01D2, R0                      ; 51FD   0280 01D2
        ADDI    #$0006, R0                      ; 51FF   02F8 0006
        MVO@    R0,     R2                      ; 5201   0250
        SDBD                                    ; 5202   0001
        MVII    #$5F3E, R1                      ; 5203   02B9 003E 005F
        MVII    #$0325, R2                      ; 5206   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 5208   0004 0114 02B2
        JSR     R5,     L_6614                  ; 520B   0004 0164 0214

        MVII    #$0289, R4                      ; 520E   02BC 0289
        MOVR    R4,     R5                      ; 5210   00A5
        MVI@    R4,     R2                      ; 5211   02A2
        MVI@    R4,     R3                      ; 5212   02A3
        SDBD                                    ; 5213   0001
        MVII    #$5136, R1                      ; 5214   02B9 0036 0051
        ADD     G_01CB, R1                      ; 5217   02C1 01CB
        ADD     G_01D8, R7                      ; 5219   02C7 01D8

        MVI@    R1,     R1                      ; 521B   0289
        SWAP    R1,     1                       ; 521C   0041
        XORR    R1,     R2                      ; 521D   01CA
        MVO@    R2,     R5                      ; 521E   026A
        XORR    R1,     R3                      ; 521F   01CB
        MVO@    R3,     R5                      ; 5220   026B
        PULR    R7                              ; 5221   02B7
        J       L_58C8                          ; 5222   0004 0358 00C8

        DECLE   $0047,  $0050,  $0035,  $0052   ; 5225   0047 0050 0035 0052
        DECLE   $0000,  $0094,  $0000,  $0035   ; 5229   0000 0094 0000 0035
        DECLE   $0000,  $0000,  $0070,  $0000   ; 522D   0000 0000 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5231   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $003C,  $0052   ; 5235   0300 0000 003C 0052
        DECLE   $0003,  $0021,  $0000           ; 5239   0003 0021 0000

        MVII    #$0081, R0                      ; 523C   02B8 0081
        MVO     R0,     G_01CC                  ; 523E   0240 01CC
        MOVR    R5,     R7                      ; 5240   00AF

L_5241:
        PSHR    R5                              ; 5241   0275
        SWAP    R0,     1                       ; 5242   0040
        ANDI    #$00F8, R0                      ; 5243   03B8 00F8
        SWAP    R1,     1                       ; 5245   0041
        ANDI    #$00F8, R1                      ; 5246   03B9 00F8
        CMPI    #$00A7, R0                      ; 5248   0378 00A7
        BPL     L_525F                          ; 524A   0203 0013

        CMPI    #$0067, R1                      ; 524C   0379 0067
        BPL     L_525F                          ; 524E   0203 000F

        SLR     R0,     2                       ; 5250   0064
        SLR     R0,     1                       ; 5251   0060
        DECR    R0                              ; 5252   0010
        BMI     L_5261                          ; 5253   020B 000C

        SUBI    #$0008, R1                      ; 5255   0339 0008
        BMI     L_5261                          ; 5257   020B 0008

        SLR     R1,     1                       ; 5259   0061
        MOVR    R1,     R5                      ; 525A   008D
        SLL     R1,     2                       ; 525B   004D
        ADDR    R5,     R1                      ; 525C   00E9
        ADDR    R0,     R1                      ; 525D   00C1
        PULR    R7                              ; 525E   02B7

L_525F:
        CLRR    R1                              ; 525F   01C9
        DECR    R1                              ; 5260   0011
L_5261:
        PULR    R7                              ; 5261   02B7

L_5262:
        PSHR    R5                              ; 5262   0275
        MOVR    R1,     R0                      ; 5263   0088
        ANDI    #$01FF, R0                      ; 5264   03B8 01FF
        MVII    #$0014, R5                      ; 5266   02BD 0014
        CLRR    R1                              ; 5268   01C9
L_5269:
        INCR    R1                              ; 5269   0009
        SUBR    R5,     R0                      ; 526A   0128
        BPL     L_5269                          ; 526B   0223 0003

        ADDR    R5,     R0                      ; 526D   00E8
        SLL     R1,     2                       ; 526E   004D
        SLL     R1,     1                       ; 526F   0049
        INCR    R0                              ; 5270   0008
        SLL     R0,     2                       ; 5271   004C
        SLL     R0,     1                       ; 5272   0048
        SWAP    R0,     1                       ; 5273   0040
        SWAP    R1,     1                       ; 5274   0041
        PULR    R7                              ; 5275   02B7

L_5276:
        PSHR    R5                              ; 5276   0275
        MVII    #$032E, R2                      ; 5277   02BA 032E
L_5279:
        MVI@    R2,     R5                      ; 5279   0295
        TSTR    R5                              ; 527A   00AD
        BEQ     L_5284                          ; 527B   0204 0007

        ADDI    #$0008, R2                      ; 527D   02FA 0008
        CMPI    #$0358, R2                      ; 527F   037A 0358
        BNC     L_5279                          ; 5281   0229 0009

        CLRR    R2                              ; 5283   01D2
L_5284:
        DECR    R2                              ; 5284   0012
        PULR    R7                              ; 5285   02B7

L_5286:
        MVI@    R5,     R1                      ; 5286   02A9
        TSTR    R1                              ; 5287   0089
        BEQ     L_528E                          ; 5288   0204 0004

        MVI@    R5,     R0                      ; 528A   02A8
        MVO@    R0,     R1                      ; 528B   0248
        B       L_5286                          ; 528C   0220 0007
L_528E:
        MOVR    R5,     R7                      ; 528E   00AF

        PSHR    R5                              ; 528F   0275

        JSR     R5,     L_5944                  ; 5290   0004 0158 0144

        BMI     L_52FD                          ; 5293   020B 0068

        MVI     G_01C9, R5                      ; 5295   0285 01C9
        DECR    R5                              ; 5297   0015
        BMI     L_53B8                          ; 5298   020B 011E

        MVII    #$0326, R2                      ; 529A   02BA 0326
        MVI@    R2,     R1                      ; 529C   0291
        SDBD                                    ; 529D   0001
        CMPI    #$538E, R1                      ; 529E   0379 008E 0053
        BEQ     L_53B8                          ; 52A1   0204 0115

        DECR    R2                              ; 52A3   0012
        MVO     R5,     G_01C9                  ; 52A4   0245 01C9
        MVII    #$0001, R0                      ; 52A6   02B8 0001

        JSR     R5,     .EXEC.6D5               ; 52A8   0004 0114 02D5

        SDBD                                    ; 52AB   0001
        MVII    #$537E, R1                      ; 52AC   02B9 007E 0053

        JSR     R5,     X_INIT_MOB              ; 52AF   0004 0114 02B2
        DECLE   $0273,  $0272,  $0004,  $0160   ; 52B2   0273 0272 0004 0160
        DECLE   $0337                           ; 52B6   0337

        PULR    R2                              ; 52B7   02B2
        PULR    R3                              ; 52B8   02B3
        MVII    #$0003, R1                      ; 52B9   02B9 0003
        MVO     R1,     G_01CD                  ; 52BB   0241 01CD
        MOVR    R2,     R1                      ; 52BD   0091
        ADDI    #$0003, R2                      ; 52BE   02FA 0003
        MVII    #$00F8, R0                      ; 52C0   02B8 00F8
        SWAP    R0,     1                       ; 52C2   0040
        MVI     G_0320, R5                      ; 52C3   0285 0320
        ADDI    #$03FF, R5                      ; 52C5   02FD 03FF
        INCR    R5                              ; 52C7   000D
        ANDR    R0,     R5                      ; 52C8   0185
        MVO@    R5,     R2                      ; 52C9   0255
        DECR    R2                              ; 52CA   0012
        MVI     G_031F, R5                      ; 52CB   0285 031F
        ADDI    #$03FF, R5                      ; 52CD   02FD 03FF
        INCR    R5                              ; 52CF   000D
        ANDR    R0,     R5                      ; 52D0   0185
        MVO@    R5,     R2                      ; 52D1   0255
        MVI@    R3,     R0                      ; 52D2   0298
L_52D3:
        MOVR    R0,     R5                      ; 52D3   0085
        CMPI    #$0004, R0                      ; 52D4   0378 0004
        BNEQ    L_52D9                          ; 52D6   020C 0001

        CLRR    R0                              ; 52D8   01C0
L_52D9:
        ANDI    #$0004, R0                      ; 52D9   03B8 0004
        SWAP    R0,     1                       ; 52DB   0040
        MOVR    R5,     R2                      ; 52DC   00AA
        INCR    R2                              ; 52DD   000A
        ANDI    #$0004, R2                      ; 52DE   03BA 0004
        SWAP    R2,     1                       ; 52E0   0042
        SLR     R2,     1                       ; 52E1   0062
        XORR    R2,     R0                      ; 52E2   01D0
        MVI@    R1,     R2                      ; 52E3   028A
        SDBD                                    ; 52E4   0001
        ANDI    #$F9FF, R2                      ; 52E5   03BA 00FF 00F9
        XORR    R0,     R2                      ; 52E8   01C2
        MVO@    R2,     R1                      ; 52E9   024A
        MOVR    R5,     R0                      ; 52EA   00A8
        ANDI    #$0001, R0                      ; 52EB   03B8 0001
        BNEQ    L_52F2                          ; 52ED   020C 0003

        MOVR    R5,     R0                      ; 52EF   00A8
        ANDI    #$0002, R0                      ; 52F0   03B8 0002
L_52F2:
        ADDI    #$0005, R1                      ; 52F2   02F9 0005
        MVO@    R0,     R1                      ; 52F4   0248
        MOVR    R5,     R0                      ; 52F5   00A8
        MOVR    R5,     R3                      ; 52F6   00AB
        SUBI    #$0005, R1                      ; 52F7   0339 0005

        JSR     R5,     L_59F9                  ; 52F9   0004 0158 01F9

        PULR    R7                              ; 52FC   02B7
L_52FD:
        J       L_5844                          ; 52FD   0004 0358 0044

        PSHR    R5                              ; 5300   0275
        MVI     G_01CD, R4                      ; 5301   0284 01CD
        DECR    R4                              ; 5303   0014
        BMI     L_5308                          ; 5304   020B 0002

        MVO     R4,     G_01CD                  ; 5306   0244 01CD
L_5308:
        MOVR    R1,     R4                      ; 5308   008C
        ADDI    #$0007, R4                      ; 5309   02FC 0007
        MVI@    R4,     R5                      ; 530B   02A5
        DECR    R4                              ; 530C   0014
        DECR    R5                              ; 530D   0015
        MOVR    R5,     R0                      ; 530E   00A8
        ANDI    #$03FF, R0                      ; 530F   03B8 03FF
        BEQ     L_5396                          ; 5311   0204 0083

        MVO@    R5,     R4                      ; 5313   0265

        JSR     R5,     L_5A08                  ; 5314   0004 0158 0208

        MOVR    R0,     R4                      ; 5317   0084
        ADDI    #$0004, R0                      ; 5318   02F8 0004
        ANDI    #$0007, R0                      ; 531A   03B8 0007
        MOVR    R0,     R3                      ; 531C   0083
        SARC    R0,     1                       ; 531D   0078
        BNC     L_5322                          ; 531E   0209 0002

        CLRR    R3                              ; 5320   01DB
        DECR    R3                              ; 5321   0013
L_5322:
        PSHR    R1                              ; 5322   0271
        ADDI    #$0002, R1                      ; 5323   02F9 0002
        MVI@    R1,     R0                      ; 5325   0288
        INCR    R1                              ; 5326   0009
        MVI@    R1,     R1                      ; 5327   0289

        JSR     R5,     L_5241                  ; 5328   0004 0150 0241

        ADDI    #$0200, R1                      ; 532B   02F9 0200
        MVI@    R1,     R2                      ; 532D   028A
        PULR    R1                              ; 532E   02B1
        SLR     R2,     2                       ; 532F   0066
        SLR     R2,     1                       ; 5330   0062
        ANDI    #$003F, R2                      ; 5331   03BA 003F
        BEQ     L_534F                          ; 5333   0204 001A

        CMPI    #$0005, R2                      ; 5335   037A 0005
        BC      L_535A                          ; 5337   0201 0021

        MOVR    R4,     R0                      ; 5339   00A0

        JSR     R5,     X_POW2                  ; 533A   0004 0114 0345

        MOVR    R2,     R5                      ; 533D   0095
        SDBD                                    ; 533E   0001
        ADDI    #$53B8, R5                      ; 533F   02FD 00B8 0053
        AND@    R5,     R0                      ; 5342   03A8
        BEQ     L_534F                          ; 5343   0204 000A

        ANDI    #$0001, R2                      ; 5345   03BA 0001
        SLL     R2,     2                       ; 5347   004E
        MOVR    R4,     R3                      ; 5348   00A3
        ADDR    R2,     R3                      ; 5349   00D3
        SUBI    #$0002, R3                      ; 534A   033B 0002
        NEGR    R3                              ; 534C   0023
        ANDI    #$0007, R3                      ; 534D   03BB 0007
L_534F:
        TSTR    R3                              ; 534F   009B
        BMI     L_5396                          ; 5350   020B 0044

        MOVR    R3,     R0                      ; 5352   0098
        SDBD                                    ; 5353   0001
        MVII    #$535B, R5                      ; 5354   02BD 005B 0053
        PSHR    R5                              ; 5357   0275
        B       L_52D3                          ; 5358   0220 0086

L_535A:
        MOVR    R4,     R3                      ; 535A   00A3
        MOVR    R3,     R5                      ; 535B   009D
        ADDR    R5,     R5                      ; 535C   00ED
        SDBD                                    ; 535D   0001
        ADDI    #$64EB, R5                      ; 535E   02FD 00EB 0064
        ADDI    #$0002, R1                      ; 5361   02F9 0002
        MVI@    R5,     R0                      ; 5363   02A8
        SUBI    #$000A, R0                      ; 5364   0338 000A
        ANDI    #$00FF, R0                      ; 5366   03B8 00FF
        SWAP    R0,     1                       ; 5368   0040
        SLL     R0,     2                       ; 5369   004C
        SLL     R0,     1                       ; 536A   0048
        ADD@    R1,     R0                      ; 536B   02C8
        MVO@    R0,     R1                      ; 536C   0248
        INCR    R1                              ; 536D   0009
        MVI@    R5,     R0                      ; 536E   02A8
        SUBI    #$0006, R0                      ; 536F   0338 0006
        ANDI    #$00FF, R0                      ; 5371   03B8 00FF
        SWAP    R0,     1                       ; 5373   0040
        SLL     R0,     2                       ; 5374   004C
        SLL     R0,     1                       ; 5375   0048
        ADD@    R1,     R0                      ; 5376   02C8
        MVO@    R0,     R1                      ; 5377   0248
        ADDI    #$0003, R1                      ; 5378   02F9 0003
        MVII    #$0001, R0                      ; 537A   02B8 0001
        MVO@    R0,     R1                      ; 537C   0248
        PULR    R7                              ; 537D   02B7

        DECLE   $00BB,  $00D8,  $008E,  $0053   ; 537E   00BB 00D8 008E 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5382   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5386   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $000F,  $0000   ; 538A   0001 0000 000F 0000
        DECLE   $0395,  $0053,  $0000,  $0053   ; 538E   0395 0053 0000 0053
        DECLE   $0003,  $001E,  $0000           ; 5392   0003 001E 0000
L_5395:
        PSHR    R5                              ; 5395   0275
L_5396:
        MVII    #$0325, R1                      ; 5396   02B9 0325

        JSR     R5,     L_5AB6                  ; 5398   0004 0158 02B6

        MVII    #$0003, R0                      ; 539B   02B8 0003

        JSR     R5,     X_RAND2                 ; 539D   0004 0114 029E

        ADDI    #$0002, R0                      ; 53A0   02F8 0002

        JSR     R5,     .EXEC.76C               ; 53A2   0004 0114 036C

        ADDI    #$0007, R1                      ; 53A5   02F9 0007
        MVI@    R1,     R0                      ; 53A7   0288
        SDBD                                    ; 53A8   0001
        ANDI    #$E000, R0                      ; 53A9   03B8 0000 00E0
        SDBD                                    ; 53AC   0001
        CMPI    #$6000, R0                      ; 53AD   0378 0000 0060
        BNEQ    L_53B8                          ; 53B0   020C 0006

        XOR@    R1,     R0                      ; 53B2   03C8
        SDBD                                    ; 53B3   0001
        XORI    #$2000, R0                      ; 53B4   03F8 0000 0020
        MVO@    R0,     R1                      ; 53B7   0248
L_53B8:
        PULR    R7                              ; 53B8   02B7

        DECLE   $0070,  $001C,  $0007,  $00C1   ; 53B9   0070 001C 0007 00C1
.GFX_LIST_53BD:
        DECLE   $0010,  $0038,  $0010,  $0010   ; 53BD  CART PIC #00
        DECLE   $00BA,  $00FE,  $0054,  $00FE   ; 53C1  
        DECLE   $00A0,  $0000,  $0028,  $0000   ; 53C5  CART PIC #01
        DECLE   $0010,  $0004,  $0020,  $0008   ; 53C9  
        DECLE   $0010,  $000C,  $0010,  $0080   ; 53CD  CART PIC #02
        DECLE   $0064,  $0083,  $0004,  $0000   ; 53D1  
        DECLE   $0042,  $007E,  $0042,  $007E   ; 53D5  CART PIC #03
        DECLE   $0042,  $007E,  $0042,  $0042   ; 53D9  
        DECLE   $0041,  $0077,  $003E,  $002A   ; 53DD  CART PIC #04
        DECLE   $001C,  $001C,  $0014,  $0008   ; 53E1  
        DECLE   $000C,  $0072,  $0072,  $0074   ; 53E5  CART PIC #05
        DECLE   $0078,  $0070,  $0070,  $0070   ; 53E9  
        DECLE   $0008,  $0010,  $0020,  $0020   ; 53ED  CART PIC #06
        DECLE   $0020,  $0020,  $0010,  $0008   ; 53F1  
        DECLE   $0010,  $0010,  $0070,  $001E   ; 53F5  CART PIC #07
        DECLE   $0010,  $00FF,  $00FE,  $007C   ; 53F9  
        DECLE   $0000,  $0004,  $000E,  $001F   ; 53FD  CART PIC #08
        DECLE   $0036,  $0064,  $00C0,  $0080   ; 5401  
        DECLE   $0000,  $0000,  $0004,  $007A   ; 5405  CART PIC #09
        DECLE   $0024,  $0000,  $0000,  $0000   ; 5409  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 540D  CART PIC #0A
        DECLE   $00A0,  $00F0,  $0050,  $00F8   ; 5411  
        DECLE   $0010,  $0038,  $0010,  $0010   ; 5415  CART PIC #0B
        DECLE   $001A,  $000E,  $0004,  $0006   ; 5419  
        DECLE   $00F7,  $00E3,  $00C1,  $0080   ; 541D  CART PIC #0C
        DECLE   $00D5,  $00C5,  $00FF,  $00FF   ; 5421  
        DECLE   $00BF,  $0017,  $00E3,  $00C1   ; 5425  CART PIC #0D
        DECLE   $00A0,  $001F,  $008D,  $00F8   ; 5429  
        DECLE   $00E7,  $00EF,  $00E7,  $00EF   ; 542D  CART PIC #0E
        DECLE   $00E7,  $00EF,  $00E7,  $00EF   ; 5431  
        DECLE   $00FF,  $00FF,  $0055,  $0000   ; 5435  CART PIC #0F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5439  
        DECLE   $00CC,  $0098,  $0081,  $00E0   ; 543D  CART PIC #10
        DECLE   $00B1,  $0013,  $0028,  $0091   ; 5441  
        DECLE   $0008,  $000D,  $0098,  $00F0   ; 5445  CART PIC #11
        DECLE   $0081,  $0004,  $0087,  $0062   ; 5449  
        DECLE   $00EF,  $00EF,  $00C7,  $00DF   ; 544D  CART PIC #12
        DECLE   $00F7,  $00C7,  $00EF,  $00EF   ; 5451  
        DECLE   $00FF,  $00FF,  $00EF,  $00D3   ; 5455  CART PIC #13
        DECLE   $00DD,  $00EE,  $00F7,  $00F7   ; 5459  
        DECLE   $00EF,  $00EF,  $00F7,  $00F7   ; 545D  CART PIC #14
        DECLE   $0097,  $006F,  $00FF,  $00FF   ; 5461  
        DECLE   $00EF,  $00F7,  $00FB,  $00FD   ; 5465  CART PIC #15
        DECLE   $00F5,  $00EB,  $00DF,  $00EF   ; 5469  
        DECLE   $000C,  $000E,  $0000,  $000C   ; 546D   000C 000E 0000 000C
        DECLE   $000C,  $000C,  $000C,  $000E   ; 5471   000C 000C 000C 000E
        DECLE   $000C,  $000C,  $000C,  $003C   ; 5475   000C 000C 000C 003C
        DECLE   $0028,  $0028,  $0008,  $000C   ; 5479   0028 0028 0008 000C
        DECLE   $0006,  $0007,  $0000,  $001C   ; 547D   0006 0007 0000 001C
        DECLE   $003C,  $002E,  $002C,  $0000   ; 5481   003C 002E 002C 0000
        DECLE   $001C,  $003F,  $0021,  $0027   ; 5485   001C 003F 0021 0027
        DECLE   $0024,  $0044,  $0040,  $0040   ; 5489   0024 0044 0040 0040
        DECLE   $000C,  $000E,  $0070,  $0058   ; 548D   000C 000E 0070 0058
        DECLE   $005F,  $0018,  $0018,  $0000   ; 5491   005F 0018 0018 0000
        DECLE   $0018,  $003F,  $0021,  $0061   ; 5495   0018 003F 0021 0061
        DECLE   $0041,  $00C0,  $0080,  $0000   ; 5499   0041 00C0 0080 0000
        DECLE   $0006,  $0007,  $0000,  $001C   ; 549D   0006 0007 0000 001C
        DECLE   $003C,  $002E,  $002C,  $0000   ; 54A1   003C 002E 002C 0000
        DECLE   $0038,  $003C,  $0024,  $00E4   ; 54A5   0038 003C 0024 00E4
        DECLE   $0084,  $0084,  $0004,  $0006   ; 54A9   0084 0084 0004 0006
        DECLE   $0000,  $0000,  $0002,  $00FF   ; 54AD   0000 0000 0002 00FF
        DECLE   $0002,  $0000,  $0000,  $0000   ; 54B1   0002 0000 0000 0000
        DECLE   $0003,  $0003,  $0004,  $0008   ; 54B5   0003 0003 0004 0008
        DECLE   $0010,  $0020,  $0040,  $0000   ; 54B9   0010 0020 0040 0000
        DECLE   $0010,  $0038,  $0010,  $0010   ; 54BD   0010 0038 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 54C1   0010 0010 0010 0010
        DECLE   $0000                           ; 54C5   0000

        SWAP    R2,     2                       ; 54C6   0046
        ADDR    R5,     R7                      ; 54C7   00EF

        DECLE   $00C6,  $0008,  $0008,  $0018   ; 54C8   00C6 0008 0008 0018
        DECLE   $001C,  $001C,  $003C,  $003C   ; 54CC   001C 001C 003C 003C
        DECLE   $003A,  $0074,  $0052,  $0090   ; 54D0   003A 0074 0052 0090
        DECLE   $0008,  $0000,  $0070,  $00FB   ; 54D4   0008 0000 0070 00FB
        DECLE   $0067,  $0008,  $0008,  $0018   ; 54D8   0067 0008 0008 0018
        DECLE   $001C,  $001C,  $003C,  $003C   ; 54DC   001C 001C 003C 003C
        DECLE   $003A,  $0074,  $0052,  $0090   ; 54E0   003A 0074 0052 0090
        DECLE   $0008,  $0000,  $001C,  $00BE   ; 54E4   0008 0000 001C 00BE
        DECLE   $0019,  $0008,  $0008,  $0018   ; 54E8   0019 0008 0008 0018
        DECLE   $001C,  $001C,  $003C,  $003C   ; 54EC   001C 001C 003C 003C
        DECLE   $003A,  $0074,  $0052,  $0090   ; 54F0   003A 0074 0052 0090
        DECLE   $0008,  $0000,  $0000,  $000C   ; 54F4   0008 0000 0000 000C
        DECLE   $001E,  $001E,  $001E,  $0000   ; 54F8   001E 001E 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54FC   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0004,  $0000   ; 5500   0000 0004 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5504   0000 0000 0000 0000
        DECLE   $0000,  $0014,  $0014,  $0000   ; 5508   0000 0014 0014 0000
        DECLE   $0000,  $0000,  $0008,  $0008   ; 550C   0000 0000 0008 0008
        DECLE   $0000,  $0014,  $0014,  $0000   ; 5510   0000 0014 0014 0000
        DECLE   $0000,  $0018,  $002C,  $0056   ; 5514   0000 0018 002C 0056
        DECLE   $00BD,  $00DB,  $006D,  $0056   ; 5518   00BD 00DB 006D 0056
        DECLE   $0038,  $003C,  $005A,  $00A5   ; 551C   0038 003C 005A 00A5
        DECLE   $00DA,  $0077,  $00DD,  $00BB   ; 5520   00DA 0077 00DD 00BB
        DECLE   $006E,  $0000,  $0000,  $0081   ; 5524   006E 0000 0000 0081
        DECLE   $00DB,  $007E,  $003C,  $0018   ; 5528   00DB 007E 003C 0018
        DECLE   $0024,  $0000,  $0000,  $0018   ; 552C   0024 0000 0000 0018
        DECLE   $003C,  $007E,  $00DB,  $00A5   ; 5530   003C 007E 00DB 00A5
        DECLE   $0000,  $0000,  $0029,  $00BA   ; 5534   0000 0000 0029 00BA
        DECLE   $005C,  $00FF,  $005C,  $00BA   ; 5538   005C 00FF 005C 00BA
        DECLE   $0029,  $0000,  $0054,  $00BA   ; 553C   0029 0000 0054 00BA
        DECLE   $005C,  $00FE,  $005C,  $00BA   ; 5540   005C 00FE 005C 00BA
        DECLE   $0054,  $0000,  $0000,  $0000   ; 5544   0054 0000 0000 0000
        DECLE   $0040,  $00F0,  $0038,  $002F   ; 5548   0040 00F0 0038 002F
        DECLE   $0058,  $0000,  $0000,  $0000   ; 554C   0058 0000 0000 0000
        DECLE   $0040,  $00F0,  $0038,  $005F   ; 5550   0040 00F0 0038 005F
        DECLE   $0084,  $0000,  $0020,  $0042   ; 5554   0084 0000 0020 0042
        DECLE   $0025,  $003C,  $005A,  $003C   ; 5558   0025 003C 005A 003C
        DECLE   $0018,  $003C,  $005A,  $001C   ; 555C   0018 003C 005A 001C
        DECLE   $003C,  $0034,  $0027,  $0020   ; 5560   003C 0034 0027 0020
        DECLE   $00E0,  $0000,  $0004,  $0042   ; 5564   00E0 0000 0004 0042
        DECLE   $00A4,  $003C,  $005A,  $003C   ; 5568   00A4 003C 005A 003C
        DECLE   $0018,  $003C,  $005A,  $0038   ; 556C   0018 003C 005A 0038
        DECLE   $003C,  $002C,  $00E4,  $0004   ; 5570   003C 002C 00E4 0004
        DECLE   $0007,  $0018,  $002C,  $001E   ; 5574   0007 0018 002C 001E
        DECLE   $0006,  $0006,  $000C,  $000C   ; 5578   0006 0006 000C 000C
        DECLE   $0018,  $0018,  $0030,  $0030   ; 557C   0018 0018 0030 0030
        DECLE   $007C,  $0062,  $00BC,  $0082   ; 5580   007C 0062 00BC 0082
        DECLE   $007C,  $0000,  $0060,  $00B0   ; 5584   007C 0000 0060 00B0
        DECLE   $0070,  $0018,  $0018,  $0018   ; 5588   0070 0018 0018 0018
        DECLE   $0030,  $0030,  $0030,  $0060   ; 558C   0030 0030 0030 0060
        DECLE   $007C,  $0062,  $00BC,  $0081   ; 5590   007C 0062 00BC 0081
        DECLE   $007E,  $0070,  $00D8,  $0038   ; 5594   007E 0070 00D8 0038
        DECLE   $004C,  $001C,  $001C,  $003C   ; 5598   004C 001C 001C 003C
        DECLE   $006E,  $00CE,  $009E,  $005E   ; 559C   006E 00CE 009E 005E
        DECLE   $001C,  $003C,  $0036,  $0033   ; 55A0   001C 003C 0036 0033
        DECLE   $0066,  $0070,  $00D8,  $00F8   ; 55A4   0066 0070 00D8 00F8
        DECLE   $000C,  $001C,  $001C,  $001E   ; 55A8   000C 001C 001C 001E
        DECLE   $006E,  $00CE,  $009E,  $005E   ; 55AC   006E 00CE 009E 005E
        DECLE   $001C,  $001C,  $001C,  $000C   ; 55B0   001C 001C 001C 000C
        DECLE   $001C,  $0060,  $00D3,  $0035   ; 55B4   001C 0060 00D3 0035
        DECLE   $005B,  $001D,  $003F,  $007D   ; 55B8   005B 001D 003F 007D
        DECLE   $005E,  $001C,  $003C,  $003C   ; 55BC   005E 001C 003C 003C
        DECLE   $0038,  $0078,  $006C,  $0066   ; 55C0   0038 0078 006C 0066
        DECLE   $00CC,  $0060,  $00D0,  $00F0   ; 55C4   00CC 0060 00D0 00F0
        DECLE   $0018,  $0014,  $0034,  $007A   ; 55C8   0018 0014 0034 007A
        DECLE   $005A,  $001C,  $003C,  $003C   ; 55CC   005A 001C 003C 003C
        DECLE   $0038,  $0038,  $0038,  $0018   ; 55D0   0038 0038 0038 0018
        DECLE   $0038,  $001C,  $0036,  $006B   ; 55D4   0038 001C 0036 006B
        DECLE   $00BF,  $00D7,  $0034,  $006E   ; 55D8   00BF 00D7 0034 006E
        DECLE   $0038,  $001C,  $0034,  $0028   ; 55DC   0038 001C 0034 0028
        DECLE   $0018,  $0010,  $0008,  $0010   ; 55E0   0018 0010 0008 0010
        DECLE   $0000                           ; 55E4   0000

        COMR    R4                              ; 55E5   001C
        ADCR    R2                              ; 55E6   002A
        SLL     R1,     2                       ; 55E7   004D
        ADDR    R7,     R3                      ; 55E8   00FB
        MOVR    R5,     R7                      ; 55E9   00AF

        DECLE   $0056,  $007A,  $001C,  $002C   ; 55EA   0056 007A 001C 002C
        DECLE   $0014,  $0028,  $0018,  $0008   ; 55EE   0014 0028 0018 0008
        DECLE   $0010,  $0008,  $0000,  $0035   ; 55F2   0010 0008 0000 0035
        DECLE   $0006,  $0005,  $0088,  $0080   ; 55F6   0006 0005 0088 0080
        DECLE   $00A8,  $0025,  $00B8,  $0015   ; 55FA   00A8 0025 00B8 0015
        DECLE   $0009,  $0009,  $0009,  $0001   ; 55FE   0009 0009 0009 0001
        DECLE   $0087,  $0001                   ; 5602   0087 0001

        INCR    R1                              ; 5604   0009
        DECR    R1                              ; 5605   0011
        INCR    R1                              ; 5606   0009
        NOP                                     ; 5607   0034
        DIS                                     ; 5608   0003
        INCR    R1                              ; 5609   0009
        DECR    R4                              ; 560A   0014
        MOVR    R0,     R7                      ; 560B   0087

        DECLE   $0001,  $0009,  $0011,  $0009   ; 560C   0001 0009 0011 0009
        DECLE   $0035,  $0006,  $0005,  $0082   ; 5610   0035 0006 0005 0082
        DECLE   $0080,  $00A2,  $0025,  $00B2   ; 5614   0080 00A2 0025 00B2
        DECLE   $0015,  $0009,  $0009,  $0009   ; 5618   0015 0009 0009 0009
        DECLE   $0088,  $0080,  $00A8,  $0009   ; 561C   0088 0080 00A8 0009
        DECLE   $0011,  $0009,  $0034,  $0004   ; 5620   0011 0009 0034 0004

        INCR    R1                              ; 5624   0009
        DECR    R4                              ; 5625   0014
        MOVR    R0,     R7                      ; 5626   0087

        DECLE   $0001,  $0009,  $0011,  $0009   ; 5627   0001 0009 0011 0009
        DECLE   $0034,  $0004                   ; 562B   0034 0004

        INCR    R1                              ; 562D   0009
        DECR    R4                              ; 562E   0014
        MOVR    R0,     R7                      ; 562F   0087
        MOVR    R0,     R7                      ; 5630   0087

        DECLE   $0009,  $0034,  $0014,  $0009   ; 5631   0009 0034 0014 0009
        DECLE   $0034,  $0004,  $0001           ; 5635   0034 0004 0001

        MOVR    R0,     R7                      ; 5638   0087
        MOVR    R0,     R7                      ; 5639   0087

        DECLE   $0009,  $0033,  $0014,  $0005   ; 563A   0009 0033 0014 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 563E   0005 0005 0005 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5642   0005 0005 0005 0005
        DECLE   $0000,  $0000,  $0000,  $0005   ; 5646   0000 0000 0000 0005
        DECLE   $0005,  $0005,  $0000,  $0000   ; 564A   0005 0005 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0005   ; 564E   0000 0000 0005 0005
        DECLE   $0005,  $0005,  $0005,  $0000   ; 5652   0005 0005 0005 0000
        DECLE   $0005,  $0005,  $0000,  $0000   ; 5656   0005 0005 0000 0000
        DECLE   $0000,  $0005,  $0005,  $0000   ; 565A   0000 0005 0005 0000
        DECLE   $0000,  $0005,  $0000,  $0000   ; 565E   0000 0005 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0021   ; 5662   0000 0000 0005 0021
        DECLE   $0000,  $0001,  $0005,  $0000   ; 5666   0000 0001 0005 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 566A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0021,  $0000   ; 566E   0000 0000 0021 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5672   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; 5676   0000 0000 0000 0005
        DECLE   $0005,  $0005,  $0011,  $0005   ; 567A   0005 0005 0011 0005
        DECLE   $0021,  $0005,  $0005,  $0005   ; 567E   0021 0005 0005 0005
        DECLE   $0001,  $0005,  $0031,  $0000   ; 5682   0001 0005 0031 0000
        DECLE   $0011,  $0005,  $0005,  $0005   ; 5686   0011 0005 0005 0005
        DECLE   $0005,  $0000,  $0001,  $0005   ; 568A   0005 0000 0001 0005
        DECLE   $0000,  $0000,  $0000,  $0000   ; 568E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5692   0000 0000 0000 0000
        DECLE   $0000                           ; 5696   0000
.GRAM_INIT_5697:
        DECLE   $0021           ; 5697  # of GRAM cards to init
        DECLE   $003F,  $0030   ; 5698  #00-00:  GROM #5F-5F ----
        DECLE   $006B,  $0030   ; 569A  #01-01:  GROM #75-75 ----
        DECLE   $0003,  $0148   ; 569C  #02-04:  GRAM #01-03 ---R
        DECLE   $0001,  $0010   ; 569E  #05-05:  GROM #00-00 ----
        DECLE   $0001,  $0380   ; 56A0  #06-0D:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 56A2  #0E-15:  CART #08-0F ----
        DECLE   $0021,  $0100   ; 56A4  #16-18:  CART #10-12 ----
        DECLE   $0031,  $0048   ; 56A6  #19-19:  GRAM #18-18 ---R
        DECLE   $0027,  $0100   ; 56A8  #1A-1C:  CART #13-15 ----
        DECLE   $0135,  $00C0   ; 56AA  #1D-1E:  GRAM #1A-1B -Y--
        DECLE   $0201,  $013A   ; 56AC  #1F   :  Algo #1
        DECLE   $02C1,  $03E2   ; 56AE  #20   :  Algo #1

        DECLE   $0001,  $0002,  $0003,  $0004   ; 56B0   0001 0002 0003 0004
        DECLE   $0004,  $0001                   ; 56B4   0004 0001

        EIS                                     ; 56B6   0002
        DIS                                     ; 56B7   0003
L_56B8:
        PSHR    R5                              ; 56B8   0275
        MVII    #$0356, R1                      ; 56B9   02B9 0356
L_56BB:
        MOVR    R1,     R5                      ; 56BB   008D
        MVI@    R5,     R4                      ; 56BC   02AC
        TSTR    R4                              ; 56BD   00A4
        BEQ     L_56DC                          ; 56BE   0204 001C

        MVI@    R5,     R3                      ; 56C0   02AB
        SWAP    R3,     1                       ; 56C1   0043
        ADD     G_01DC, R3                      ; 56C2   02C3 01DC
        ADD     G_01E3, R3                      ; 56C4   02C3 01E3
        ANDI    #$00FF, R3                      ; 56C6   03BB 00FF
        SUB     G_0116, R3                      ; 56C8   0303 0116
        BPL     L_56D8                          ; 56CA   0203 000C

        MVI@    R5,     R3                      ; 56CC   02AB
        SWAP    R3,     1                       ; 56CD   0043
        ADD     G_01DF, R3                      ; 56CE   02C3 01DF
        ADD     G_01E6, R3                      ; 56D0   02C3 01E6
        ANDI    #$00FF, R3                      ; 56D2   03BB 00FF
        SUB     G_0118, R3                      ; 56D4   0303 0118
        BMI     L_56DC                          ; 56D6   020B 0004

L_56D8:
        DECR    R1                              ; 56D8   0011

        JSR     R5,     L_5AB6                  ; 56D9   0004 0158 02B6

L_56DC:
        SUBI    #$0008, R1                      ; 56DC   0339 0008
        CMPI    #$0326, R1                      ; 56DE   0379 0326
        BGE     L_56BB                          ; 56E0   022D 0026

        MVII    #$032D, R2                      ; 56E2   02BA 032D
        SDBD                                    ; 56E4   0001
        MVII    #$1000, R3                      ; 56E5   02BB 0000 0010
L_56E8:
        MOVR    R2,     R4                      ; 56E8   0094
        MVI@    R4,     R0                      ; 56E9   02A0
        MVI@    R4,     R5                      ; 56EA   02A5
        TSTR    R5                              ; 56EB   00AD
        BEQ     L_5708                          ; 56EC   0204 001A

        ANDI    #$0008, R0                      ; 56EE   03B8 0008
        BEQ     L_5708                          ; 56F0   0204 0016

        MVI@    R4,     R0                      ; 56F2   02A0
        MVI@    R4,     R1                      ; 56F3   02A1

        JSR     R5,     L_5241                  ; 56F4   0004 0150 0241

        BMI     L_5708                          ; 56F7   020B 000F

        ADDI    #$0200, R1                      ; 56F9   02F9 0200
        MVI@    R1,     R5                      ; 56FB   028D
        MVI@    R2,     R0                      ; 56FC   0290
        COMR    R3                              ; 56FD   001B
        ANDR    R3,     R0                      ; 56FE   0198
        COMR    R3                              ; 56FF   001B
        SDBD                                    ; 5700   0001
        ANDI    #$0400, R5                      ; 5701   03BD 0000 0004
        BEQ     L_5707                          ; 5704   0204 0001

        XORR    R3,     R0                      ; 5706   01D8
L_5707:
        MVO@    R0,     R2                      ; 5707   0250
L_5708:
        ADDI    #$0008, R2                      ; 5708   02FA 0008
        CMPI    #$0355, R2                      ; 570A   037A 0355
        BLE     L_56E8                          ; 570C   0226 0025
        PULR    R7                              ; 570E   02B7

L_570F:
        PSHR    R5                              ; 570F   0275
        MOVR    R2,     R4                      ; 5710   0094
        ANDI    #$0003, R4                      ; 5711   03BC 0003
        ADDR    R4,     R4                      ; 5713   00E4
        ADDR    R4,     R4                      ; 5714   00E4
        MOVR    R0,     R5                      ; 5715   0085
        ANDI    #$0003, R5                      ; 5716   03BD 0003
        ADDR    R5,     R4                      ; 5718   00EC
        ADDR    R7,     R4                      ; 5719   00FC
        ADDI    #$0003, R4                      ; 571A   02FC 0003
        PULR    R7                              ; 571C   02B7

        DECLE   $003B,  $0027,  $000D,  $001E   ; 571D   003B 0027 000D 001E
        DECLE   $0027,  $000D,  $001E,  $003B   ; 5721   0027 000D 001E 003B
        DECLE   $000D,  $001E,  $003B,  $0027   ; 5725   000D 001E 003B 0027
        DECLE   $001E,  $003B,  $0027           ; 5729   001E 003B 0027

        INCR    R5                              ; 572C   000D
        PSHR    R5                              ; 572D   0275
L_572E:
        MVI     G_0326, R0                      ; 572E   0280 0326
        TSTR    R0                              ; 5730   0080
        BNEQ    L_5736                          ; 5731   020C 0003

        JSR     R5,     L_5778                  ; 5733   0004 0154 0378

L_5736:
        MVII    #$03F0, R5                      ; 5736   02BD 03F0
        COMR    R5                              ; 5738   001D
        AND     G_0322, R5                      ; 5739   0385 0322
        MVI     G_01D9, R0                      ; 573B   0280 01D9
        CMPI    #$00FF, R0                      ; 573D   0378 00FF
        BEQ     L_578D                          ; 573F   0204 004C

        XORI    #$03F0, R5                      ; 5741   03FD 03F0
        MVO     R5,     G_0322                  ; 5743   0245 0322
        INCR    R0                              ; 5745   0008
        ANDI    #$0004, R0                      ; 5746   03B8 0004
        SLR     R0,     1                       ; 5748   0060
        SWAP    R0,     1                       ; 5749   0040
L_574A:
        MVI     G_031D, R5                      ; 574A   0285 031D
        SDBD                                    ; 574C   0001
        ANDI    #$FDF8, R5                      ; 574D   03BD 00F8 00FD
        XORR    R0,     R5                      ; 5750   01C5
        MVI     G_016F, R3                      ; 5751   0283 016F
        SLL     R3,     2                       ; 5753   004F
        SWAP    R3,     1                       ; 5754   0043
        ANDI    #$0003, R3                      ; 5755   03BB 0003
        XORR    R3,     R5                      ; 5757   01DD
        MVO     R5,     G_031D                  ; 5758   0245 031D
        MVI     G_0326, R5                      ; 575A   0285 0326
        SDBD                                    ; 575C   0001
        CMPI    #$5F4E, R5                      ; 575D   037D 004E 005F
        BNEQ    L_5777                          ; 5760   020C 0015

L_5762:
        MVI     G_0325, R1                      ; 5762   0281 0325
        SDBD                                    ; 5764   0001
        ANDI    #$FDFF, R1                      ; 5765   03B9 00FF 00FD
        XORI    #$0200, R1                      ; 5768   03F9 0200
        XORR    R0,     R1                      ; 576A   01C1
        MVO     R1,     G_0325                  ; 576B   0241 0325
        MVII    #$0003, R2                      ; 576D   02BA 0003
        TSTR    R0                              ; 576F   0080
        BEQ     L_5774                          ; 5770   0204 0002

        MVII    #$00FD, R2                      ; 5772   02BA 00FD
L_5774:
        SWAP    R2,     1                       ; 5774   0042
        MVO     R2,     G_0329                  ; 5775   0242 0329
L_5777:
        PULR    R7                              ; 5777   02B7

L_5778:
        PSHR    R5                              ; 5778   0275
        SDBD                                    ; 5779   0001
        MVII    #$5F3E, R1                      ; 577A   02B9 003E 005F
        MVII    #$0325, R2                      ; 577D   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 577F   0004 0114 02B2

        MVII    #$0001, R0                      ; 5782   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 5784   0004 0114 02CF

        MVI     G_031D, R0                      ; 5787   0280 031D
        ANDI    #$0200, R0                      ; 5789   03B8 0200
        B       L_5762                          ; 578B   0220 002A

L_578D:
        CLRR    R5                              ; 578D   01ED
        MVO     R5,     G_0322                  ; 578E   0245 0322
        MVI     G_031D, R0                      ; 5790   0280 031D
        ANDI    #$0200, R0                      ; 5792   03B8 0200
        B       L_574A                          ; 5794   0220 004B

L_5796:
        PSHR    R5                              ; 5796   0275
        MOVR    R1,     R0                      ; 5797   0088

        JSR     R5,     L_57FE                  ; 5798   0004 0154 03FE
        JSR     R5,     L_57B5                  ; 579B   0004 0154 03B5

        BC      L_57B2                          ; 579E   0201 0012

        MOVR    R1,     R0                      ; 57A0   0088

        JSR     R5,     L_5803                  ; 57A1   0004 0158 0003
        JSR     R5,     L_57B5                  ; 57A4   0004 0154 03B5

        BC      L_57B2                          ; 57A7   0201 0009

        MOVR    R1,     R0                      ; 57A9   0088

        JSR     R5,     L_580A                  ; 57AA   0004 0158 000A
        JSR     R5,     L_57B5                  ; 57AD   0004 0154 03B5

        BNC     L_57B4                          ; 57B0   0209 0002

L_57B2:
        MOVR    R0,     R1                      ; 57B2   0081
        SETC                                    ; 57B3   0007
L_57B4:
        PULR    R7                              ; 57B4   02B7

L_57B5:
        PSHR    R5                              ; 57B5   0275
        PSHR    R1                              ; 57B6   0271
        PSHR    R4                              ; 57B7   0274
        MOVR    R0,     R1                      ; 57B8   0081

        JSR     R5,     L_5812                  ; 57B9   0004 0158 0012

        ADDR    R2,     R1                      ; 57BC   00D1
        MVI@    R1,     R1                      ; 57BD   0289
        ANDI    #$00F8, R1                      ; 57BE   03B9 00F8
        CMPI    #$0028, R1                      ; 57C0   0379 0028
        BNC     L_57F0                          ; 57C2   0209 002C

        MOVR    R0,     R1                      ; 57C4   0081
        SARC    R1,     1                       ; 57C5   0079
        BNC     L_57F2                          ; 57C6   0209 002A

        SLL     R1,     1                       ; 57C8   0049
        ADDR    R7,     R1                      ; 57C9   00F9
        ADDI    #$002C, R1                      ; 57CA   02F9 002C
        MOVR    R1,     R4                      ; 57CC   008C
        MOVR    R0,     R1                      ; 57CD   0081
        INCR    R1                              ; 57CE   0009

        JSR     R5,     L_5812                  ; 57CF   0004 0158 0012

        ADDR    R2,     R1                      ; 57D2   00D1
        MVI@    R1,     R1                      ; 57D3   0289
        ANDI    #$00F8, R1                      ; 57D4   03B9 00F8
        CMPI    #$0028, R1                      ; 57D6   0379 0028
        BC      L_57DF                          ; 57D8   0201 0005

        CMP@    R4,     R1                      ; 57DA   0361
        BEQ     L_57E0                          ; 57DB   0204 0003
        B       L_57F0                          ; 57DD   0200 0011

L_57DF:
        INCR    R4                              ; 57DF   000C
L_57E0:
        MOVR    R0,     R1                      ; 57E0   0081
        DECR    R1                              ; 57E1   0011

        JSR     R5,     L_5812                  ; 57E2   0004 0158 0012

        ADDR    R2,     R1                      ; 57E5   00D1
        MVI@    R1,     R1                      ; 57E6   0289
        ANDI    #$00F8, R1                      ; 57E7   03B9 00F8
        CMPI    #$0028, R1                      ; 57E9   0379 0028
        BC      L_57F2                          ; 57EB   0201 0005

        CMP@    R4,     R1                      ; 57ED   0361
        BEQ     L_57F2                          ; 57EE   0204 0002

L_57F0:
        CLRC                                    ; 57F0   0006
        INCR    R7                              ; 57F1   000F

L_57F2:
        SETC                                    ; 57F2   0007
L_57F3:
        PULR    R4                              ; 57F3   02B4
        PULR    R1                              ; 57F4   02B1
        PULR    R7                              ; 57F5   02B7

        DECR    R0                              ; 57F6   0010
        NEGR    R0                              ; 57F7   0020
        INCR    R0                              ; 57F8   0008
        COMR    R0                              ; 57F9   0018
        NEGR    R0                              ; 57FA   0020
        DECR    R0                              ; 57FB   0010
        COMR    R0                              ; 57FC   0018
        INCR    R0                              ; 57FD   0008
L_57FE:
        INCR    R0                              ; 57FE   0008
        ANDI    #$000F, R0                      ; 57FF   03B8 000F
        SLR     R0,     1                       ; 5801   0060
        MOVR    R5,     R7                      ; 5802   00AF

L_5803:
        SARC    R0,     1                       ; 5803   0078
        BC      L_5809                          ; 5804   0201 0003

        INCR    R0                              ; 5806   0008
        ANDI    #$0007, R0                      ; 5807   03B8 0007
L_5809:
        MOVR    R5,     R7                      ; 5809   00AF

L_580A:
        SARC    R0,     2                       ; 580A   007C
        BOV     L_5810                          ; 580B   0202 0003

        INCR    R0                              ; 580D   0008
        ANDI    #$0003, R0                      ; 580E   03B8 0003
L_5810:
        SLL     R0,     1                       ; 5810   0048
        MOVR    R5,     R7                      ; 5811   00AF

L_5812:
        PSHR    R5                              ; 5812   0275
        PSHR    R0                              ; 5813   0270
        ANDI    #$0007, R1                      ; 5814   03B9 0007
        ADDR    R7,     R1                      ; 5816   00F9
        ADDI    #$0009, R1                      ; 5817   02F9 0009
        MVI@    R1,     R0                      ; 5819   0288

        JSR     R5,     X_EXT_SIGN_LO           ; 581A   0004 0114 0268

        MOVR    R0,     R1                      ; 581D   0081
        PULR    R0                              ; 581E   02B0
        PULR    R7                              ; 581F   02B7

        DECLE   $0001,  $03ED,  $03EC,  $03EB   ; 5820   0001 03ED 03EC 03EB
        DECLE   $03FF                           ; 5824   03FF

        DECR    R3                              ; 5825   0013
        DECR    R4                              ; 5826   0014
        DECR    R5                              ; 5827   0015
L_5828:
        PSHR    R5                              ; 5828   0275
        PSHR    R0                              ; 5829   0270
        MOVR    R1,     R5                      ; 582A   008D
        MOVR    R2,     R0                      ; 582B   0090
        ANDI    #$0040, R0                      ; 582C   03B8 0040
        SLR     R0,     1                       ; 582E   0060
        SLL     R1,     1                       ; 582F   0049
        ANDR    R1,     R0                      ; 5830   0188
        ANDI    #$0020, R0                      ; 5831   03B8 0020
        SLR     R1,     1                       ; 5833   0061
        XORR    R0,     R1                      ; 5834   01C1
        MOVR    R1,     R0                      ; 5835   0088
        ANDI    #$0030, R1                      ; 5836   03B9 0030
        ADDR    R2,     R1                      ; 5838   00D1
        ANDI    #$0030, R1                      ; 5839   03B9 0030
        XORR    R2,     R0                      ; 583B   01D0
        ANDI    #$0040, R0                      ; 583C   03B8 0040
        XORR    R0,     R1                      ; 583E   01C1
        ANDI    #$008F, R5                      ; 583F   03BD 008F
        XORR    R5,     R1                      ; 5841   01E9
        PULR    R0                              ; 5842   02B0
        PULR    R7                              ; 5843   02B7

L_5844:
        TSTR    R5                              ; 5844   00AD
        BEQ     L_585B                          ; 5845   0204 0014

        CMPI    #$000A, R5                      ; 5847   037D 000A
        BLT     L_585A                          ; 5849   0205 000F
        BEQ     L_5864                          ; 584B   0204 0017

        MVII    #$0282, R1                      ; 584D   02B9 0282
        MVI@    R1,     R0                      ; 584F   0288
        ANDI    #$01F8, R0                      ; 5850   03B8 01F8
        CMPI    #$0048, R0                      ; 5852   0378 0048
        BNEQ    L_585A                          ; 5854   020C 0004

        MVII    #$0082, R0                      ; 5856   02B8 0082
        MVO     R0,     G_01CC                  ; 5858   0240 01CC
L_585A:
        PULR    R7                              ; 585A   02B7

L_585B:
        MVI     G_01C9, R0                      ; 585B   0280 01C9
        TSTR    R0                              ; 585D   0080
        BEQ     L_5863                          ; 585E   0204 0003

        JSR     R5,     L_6273                  ; 5860   0004 0160 0273

L_5863:
        PULR    R7                              ; 5863   02B7

L_5864:
        MVII    #$0282, R1                      ; 5864   02B9 0282
        MVI@    R1,     R0                      ; 5866   0288
        SLR     R0,     2                       ; 5867   0064
        SLR     R0,     1                       ; 5868   0060
        ANDI    #$003F, R0                      ; 5869   03B8 003F
        CMPI    #$000B, R0                      ; 586B   0378 000B
        BNC     L_585A                          ; 586D   0229 0014

        CMPI    #$000B, R0                      ; 586F   0378 000B
        BNEQ    L_587F                          ; 5871   020C 000C

        MVI     G_01C9, R5                      ; 5873   0285 01C9
        ADDI    #$0005, R5                      ; 5875   02FD 0005
        ADD     G_01CB, R5                      ; 5877   02C5 01CB
        ADD     G_01CB, R5                      ; 5879   02C5 01CB
        MVO     R5,     G_01C9                  ; 587B   0245 01C9
        B       L_588A                          ; 587D   0200 000B

L_587F:
        MVI     G_01CA, R2                      ; 587F   0282 01CA
        ADDR    R0,     R2                      ; 5881   00C2
        CMPI    #$0021, R2                      ; 5882   037A 0021
        BEQ     L_58C0                          ; 5884   0204 003A

        MVO     R0,     G_01CA                  ; 5886   0240 01CA
        INCR    R7                              ; 5888   000F

        PSHR    R5                              ; 5889   0275
L_588A:
        MVI@    R1,     R2                      ; 588A   028A
        SDBD                                    ; 588B   0001
        ANDI    #$FE07, R2                      ; 588C   03BA 0007 00FE
        XORI    #$0028, R2                      ; 588F   03FA 0028
        MVO@    R2,     R1                      ; 5891   024A
        SUBI    #$0006, R0                      ; 5892   0338 0006
        BMI     L_58EA                          ; 5894   020B 0054

        MOVR    R0,     R4                      ; 5896   0084

        JSR     R5,     L_5E0F                  ; 5897   0004 015C 020F

        SLL     R1,     2                       ; 589A   004D
        SLL     R1,     2                       ; 589B   004D
        XORR    R3,     R1                      ; 589C   01D9
        MVII    #$0174, R3                      ; 589D   02BB 0174
L_589F:
        CMP@    R3,     R4                      ; 589F   035C
        BNEQ    L_58AE                          ; 58A0   020C 000C

        MOVR    R3,     R5                      ; 58A2   009D
        SUBI    #$0003, R5                      ; 58A3   033D 0003
        CMP@    R5,     R1                      ; 58A5   0369
        BNEQ    L_58AE                          ; 58A6   020C 0006

        CMP@    R5,     R0                      ; 58A8   0368
        BNEQ    L_58AE                          ; 58A9   020C 0003

        CMP@    R5,     R2                      ; 58AB   036A
        BEQ     L_58B2                          ; 58AC   0204 0004

L_58AE:
        ADDI    #$0004, R3                      ; 58AE   02FB 0004
        B       L_589F                          ; 58B0   0220 0012

L_58B2:
        MOVR    R3,     R4                      ; 58B2   009C
        PULR    R5                              ; 58B3   02B5
L_58B4:
        INCR    R4                              ; 58B4   000C
        MVI     G_0170, R0                      ; 58B5   0280 0170
        DECR    R0                              ; 58B7   0010
        MVO     R0,     G_0170                  ; 58B8   0240 0170
        MVII    #$00FF, R0                      ; 58BA   02B8 00FF
        SUBI    #$0004, R4                      ; 58BC   033C 0004
        MVO@    R0,     R4                      ; 58BE   0260
        MOVR    R5,     R7                      ; 58BF   00AF

L_58C0:
        MVI@    R1,     R0                      ; 58C0   0288
        SDBD                                    ; 58C1   0001
        ANDI    #$FE07, R0                      ; 58C2   03B8 0007 00FE
        ADDI    #$0030, R0                      ; 58C5   02F8 0030
        MVO@    R0,     R1                      ; 58C7   0248

L_58C8:
        JSR     R5,     L_6325                  ; 58C8   0004 0160 0325

        MVII    #$0001, R1                      ; 58CB   02B9 0001
        INCR    R7                              ; 58CD   000F

L_58CE:
        CLRR    R1                              ; 58CE   01C9
L_58CF:
        MVO     R1,     G_01CE                  ; 58CF   0241 01CE
        CLRR    R0                              ; 58D1   01C0
        MVO     R0,     G_01CC                  ; 58D2   0240 01CC
        SDBD                                    ; 58D4   0001
        MVII    #$1906, R0                      ; 58D5   02B8 0006 0019
        MVO     R0,     G_035D                  ; 58D8   0240 035D
        ADD     G_01D8, R7                      ; 58DA   02C7 01D8

        JSR     R5,     .EXEC.7B3               ; 58DC   0004 0114 03B3
        JSR     R5,     .EXEC.A61               ; 58DF   0004 0118 0261

        ADCR    R0                              ; 58E2   0028
        MVII    #$0083, R0                      ; 58E3   02B8 0083
        MVO     R0,     G_01CC                  ; 58E5   0240 01CC
        CLRR    R0                              ; 58E7   01C0
        MVO     R0,     G_01D8                  ; 58E8   0240 01D8
L_58EA:
        PULR    R7                              ; 58EA   02B7

L_58EB:
        PSHR    R5                              ; 58EB   0275
        PSHR    R0                              ; 58EC   0270
        PSHR    R2                              ; 58ED   0272
        ANDI    #$00FF, R0                      ; 58EE   03B8 00FF
        ANDI    #$00FF, R2                      ; 58F0   03BA 00FF
        PSHR    R2                              ; 58F2   0272
        MVII    #$00B3, R1                      ; 58F3   02B9 00B3

        JSR     R5,     X_MPY                   ; 58F5   0004 011C 01DC

        PULR    R0                              ; 58F8   02B0
        MVII    #$006D, R1                      ; 58F9   02B9 006D
        SDBD                                    ; 58FB   0001
        MVII    #$5904, R5                      ; 58FC   02BD 0004 0059
        PSHR    R3                              ; 58FF   0273
        CLRR    R3                              ; 5900   01DB
        J       .EXEC.DDF                       ; 5901   0004 031C 01DF

        ADD     G_02F1, R2                      ; 5904   02C2 02F1
        ADD     G_015D, R2                      ; 5906   02C2 015D
        MOVR    R2,     R1                      ; 5908   0091
        SDBD                                    ; 5909   0001
        MVII    #$9E33, R2                      ; 590A   02BA 0033 009E

        JSR     R5,     X_DIV                   ; 590D   0004 011C 01FB

        PULR    R2                              ; 5910   02B2
        PULR    R0                              ; 5911   02B0
        PULR    R7                              ; 5912   02B7

L_5913:
        PSHR    R5                              ; 5913   0275
        MOVR    R3,     R1                      ; 5914   0099
        MOVR    R2,     R5                      ; 5915   0095
        ANDI    #$0010, R5                      ; 5916   03BD 0010
        BEQ     L_591F                          ; 5918   0204 0005

        SDBD                                    ; 591A   0001
        ADDI    #$593B, R1                      ; 591B   02F9 003B 0059
        MVI@    R1,     R1                      ; 591E   0289
L_591F:
        MOVR    R2,     R5                      ; 591F   0095
        ANDI    #$0020, R5                      ; 5920   03BD 0020
        BEQ     L_5927                          ; 5922   0204 0003

        NEGR    R1                              ; 5924   0021
        ADDI    #$0008, R1                      ; 5925   02F9 0008
L_5927:
        MOVR    R2,     R5                      ; 5927   0095
        ANDI    #$0040, R5                      ; 5928   03BD 0040
        BEQ     L_5931                          ; 592A   0204 0005

        SDBD                                    ; 592C   0001
        ADDI    #$5932, R1                      ; 592D   02F9 0032 0059
        MVI@    R1,     R1                      ; 5930   0289
L_5931:
        PULR    R7                              ; 5931   02B7

        DECLE   $0002,  $0001,  $0000,  $0005   ; 5932   0002 0001 0000 0005
        DECLE   $0004,  $0003,  $0008,  $0007   ; 5936   0004 0003 0008 0007
        DECLE   $0006,  $0006,  $0003,  $0000   ; 593A   0006 0006 0003 0000
        DECLE   $0007,  $0004,  $0001,  $0008   ; 593E   0007 0004 0001 0008
        DECLE   $0005                           ; 5942   0005

        EIS                                     ; 5943   0002
L_5944:
        PSHR    R5                              ; 5944   0275
        MOVR    R0,     R3                      ; 5945   0083
        MOVR    R0,     R5                      ; 5946   0085
        SDBD                                    ; 5947   0001
        ADDI    #$5950, R3                      ; 5948   02FB 0050 0059
        MVI@    R3,     R0                      ; 594B   0298
        SWAP    R0,     1                       ; 594C   0040
        J       .EXEC.66A                       ; 594D   0004 0314 026A

        DECLE   $03FF,  $0003,  $0002,  $0001   ; 5950   03FF 0003 0002 0001
        DECLE   $0004,  $03FF,  $0000,  $0005   ; 5954   0004 03FF 0000 0005
        DECLE   $0006,  $0007,  $03FF,  $03FF   ; 5958   0006 0007 03FF 03FF

        PSHR    R5                              ; 595C   0275
        ADDI    #$0007, R1                      ; 595D   02F9 0007
        MVI@    R1,     R5                      ; 595F   028D
        ANDI    #$03FF, R5                      ; 5960   03BD 03FF
        ADDI    #$0003, R5                      ; 5962   02FD 0003
        MVI@    R5,     R5                      ; 5964   02AD
        ANDI    #$001F, R5                      ; 5965   03BD 001F
        SDBD                                    ; 5967   0001
        ADDI    #$5975, R5                      ; 5968   02FD 0075 0059
        MVI@    R5,     R0                      ; 596B   02A8
        DECR    R0                              ; 596C   0010
        BMI     L_5974                          ; 596D   020B 0005
        BEQ     L_5975                          ; 596F   0204 0004

        JSR     R5,     L_6470                  ; 5971   0004 0164 0070

L_5974:
        PULR    R7                              ; 5974   02B7

L_5975:
        MVI     G_01D7, R1                      ; 5975   0281 01D7
        INCR    R1                              ; 5977   0009
        ANDI    #$0003, R1                      ; 5978   03B9 0003
        MVO     R1,     G_01D7                  ; 597A   0241 01D7
        BNEQ    L_5974                          ; 597C   022C 0009

        MVI     G_01C9, R1                      ; 597E   0281 01C9
        DECR    R1                              ; 5980   0011
        BMI     L_5974                          ; 5981   022B 000E

        MVO     R1,     G_01C9                  ; 5983   0241 01C9
        INCR    R0                              ; 5985   0008

        JSR     R5,     L_6274                  ; 5986   0004 0160 0274
        DECLE   $0031,  $0000,  $0001           ; 5989   0031 0000 0001

        SETC                                    ; 598C   0007
        INCR    R2                              ; 598D   000A
        INCR    R4                              ; 598E   000C
        DECR    R1                              ; 598F   0011
        DECR    R1                              ; 5990   0011
L_5991:
        PSHR    R5                              ; 5991   0275
        MOVR    R1,     R4                      ; 5992   008C
        MVI@    R4,     R0                      ; 5993   02A0
        TSTR    R0                              ; 5994   0080
        BMI     L_59A5                          ; 5995   020B 000E

        INCR    R4                              ; 5997   000C
        MVI@    R4,     R0                      ; 5998   02A0
        SUB     G_031F, R0                      ; 5999   0300 031F
        MVI@    R4,     R1                      ; 599B   02A1
        SUB     G_0320, R1                      ; 599C   0301 0320
        SAR     R0,     2                       ; 599E   006C
        SAR     R1,     2                       ; 599F   006D

        JSR     R5,     .EXEC.A2F               ; 59A0   0004 0118 022F

        ADDI    #$0008, R1                      ; 59A3   02F9 0008
L_59A5:
        PULR    R7                              ; 59A5   02B7

        PSHR    R5                              ; 59A6   0275
L_59A7:
        ANDI    #$000F, R1                      ; 59A7   03B9 000F
        PSHR    R1                              ; 59A9   0271
        SUBI    #$0002, R4                      ; 59AA   033C 0002
        MVI@    R4,     R0                      ; 59AC   02A0
        MVI@    R4,     R1                      ; 59AD   02A1

        JSR     R5,     L_5241                  ; 59AE   0004 0150 0241

        BMI     L_59E8                          ; 59B1   020B 0035

        MOVR    R1,     R2                      ; 59B3   008A
        ADDI    #$0200, R2                      ; 59B4   02FA 0200
        PULR    R1                              ; 59B6   02B1

        JSR     R5,     L_5796                  ; 59B7   0004 0154 0396

        BNC     L_59E9                          ; 59BA   0209 002D

        SUBI    #$0002, R4                      ; 59BC   033C 0002
        MOVR    R1,     R5                      ; 59BE   008D
        SLL     R1,     1                       ; 59BF   0049
        SDBD                                    ; 59C0   0001
        ADDI    #$64EB, R1                      ; 59C1   02F9 00EB 0064
        MVI@    R1,     R0                      ; 59C4   0288
        SUBI    #$000A, R0                      ; 59C5   0338 000A
        SLL     R0,     2                       ; 59C7   004C
        SLL     R0,     1                       ; 59C8   0048
        SWAP    R0,     1                       ; 59C9   0040
        ADD@    R4,     R0                      ; 59CA   02E0
        INCR    R1                              ; 59CB   0009
        MVI@    R1,     R2                      ; 59CC   028A
        SUBI    #$0006, R2                      ; 59CD   033A 0006
        SLL     R2,     2                       ; 59CF   004E
        SLL     R2,     1                       ; 59D0   004A
        MVI@    R4,     R1                      ; 59D1   02A1
        SWAP    R1,     1                       ; 59D2   0041
        ADDR    R1,     R2                      ; 59D3   00CA
        MVII    #$00FF, R1                      ; 59D4   02B9 00FF
        ANDR    R1,     R2                      ; 59D6   018A
        COMR    R1                              ; 59D7   0019
        ANDR    R1,     R0                      ; 59D8   0188
        XORR    R0,     R2                      ; 59D9   01C2
        MOVR    R4,     R1                      ; 59DA   00A1
        SUBI    #$0004, R1                      ; 59DB   0339 0004
        MOVR    R5,     R0                      ; 59DD   00A8

        JSR     R5,     L_59F9                  ; 59DE   0004 0158 01F9
        JSR     R5,     .EXEC.9A1               ; 59E1   0004 0118 01A1

        MVII    #$0040, R0                      ; 59E4   02B8 0040
        B       L_59EE                          ; 59E6   0200 0006

L_59E8:
        PULR    R5                              ; 59E8   02B5
L_59E9:
        MOVR    R4,     R1                      ; 59E9   00A1
        SUBI    #$0004, R1                      ; 59EA   0339 0004
        MVII    #$0020, R0                      ; 59EC   02B8 0020
L_59EE:
        SWAP    R0,     1                       ; 59EE   0040
        ADDI    #$0007, R1                      ; 59EF   02F9 0007
        MVI@    R1,     R5                      ; 59F1   028D
        SDBD                                    ; 59F2   0001
        ANDI    #$1FFF, R5                      ; 59F3   03BD 00FF 001F
        XORR    R0,     R5                      ; 59F6   01C5
        MVO@    R5,     R1                      ; 59F7   024D
        PULR    R7                              ; 59F8   02B7

L_59F9:
        PSHR    R5                              ; 59F9   0275
        ADDI    #$0007, R1                      ; 59FA   02F9 0007
        SWAP    R0,     1                       ; 59FC   0040
        SLL     R0,     2                       ; 59FD   004C
        MVI@    R1,     R5                      ; 59FE   028D
        SDBD                                    ; 59FF   0001
        ANDI    #$E3FF, R5                      ; 5A00   03BD 00FF 00E3
        XORR    R0,     R5                      ; 5A03   01C5
        MVO@    R5,     R1                      ; 5A04   024D
        SUBI    #$0007, R1                      ; 5A05   0339 0007
        PULR    R7                              ; 5A07   02B7

L_5A08:
        ADDI    #$0007, R1                      ; 5A08   02F9 0007
        MVI@    R1,     R0                      ; 5A0A   0288
        SWAP    R0,     1                       ; 5A0B   0040
        SLR     R0,     2                       ; 5A0C   0064
        ANDI    #$0007, R0                      ; 5A0D   03B8 0007
        SUBI    #$0007, R1                      ; 5A0F   0339 0007
        MOVR    R5,     R7                      ; 5A11   00AF

L_5A12:
        PSHR    R5                              ; 5A12   0275
        MVII    #$0004, R0                      ; 5A13   02B8 0004
        SWAP    R0,     1                       ; 5A15   0040
        SDBD                                    ; 5A16   0001
        MVII    #$F800, R2                      ; 5A17   02BA 0000 00F8
        MOVR    R1,     R4                      ; 5A1A   008C
        ADDI    #$0002, R4                      ; 5A1B   02FC 0002
        MOVR    R4,     R5                      ; 5A1D   00A5
        MVI@    R4,     R3                      ; 5A1E   02A3
        ADDR    R0,     R3                      ; 5A1F   00C3
        ANDR    R2,     R3                      ; 5A20   0193
        MVO@    R3,     R5                      ; 5A21   026B
        MVI@    R4,     R3                      ; 5A22   02A3
        ADDR    R0,     R3                      ; 5A23   00C3
        ANDR    R2,     R3                      ; 5A24   0193
        MVO@    R3,     R5                      ; 5A25   026B
        CLRR    R4                              ; 5A26   01E4
        MVO@    R4,     R5                      ; 5A27   026C
        PULR    R7                              ; 5A28   02B7

L_5A29:
        ADDI    #$0007, R1                      ; 5A29   02F9 0007
        MVI@    R1,     R0                      ; 5A2B   0288
        MOVR    R0,     R2                      ; 5A2C   0082
        ANDI    #$03FF, R2                      ; 5A2D   03BA 03FF
        SWAP    R0,     1                       ; 5A2F   0040
        PSHR    R5                              ; 5A30   0275
        PSHR    R3                              ; 5A31   0273
        MVII    #$0009, R5                      ; 5A32   02BD 0009
        PSHR    R0                              ; 5A34   0270
        ADDI    #$0008, R0                      ; 5A35   02F8 0008
        ANDI    #$001C, R0                      ; 5A37   03B8 001C
        CMPI    #$0010, R0                      ; 5A39   0378 0010
        BNC     L_5A3E                          ; 5A3B   0209 0001

        NEGR    R3                              ; 5A3D   0023
L_5A3E:
        ANDI    #$000C, R0                      ; 5A3E   03B8 000C
        BNEQ    L_5A43                          ; 5A40   020C 0001

        CLRR    R3                              ; 5A42   01DB
L_5A43:
        MVI@    R2,     R0                      ; 5A43   0290
        MOVR    R0,     R4                      ; 5A44   0084
        INCR    R2                              ; 5A45   000A
        SLR     R0,     2                       ; 5A46   0064
        SLR     R0,     2                       ; 5A47   0064
        ADDR    R3,     R0                      ; 5A48   00D8
        BPL     L_5A53                          ; 5A49   0203 0008

        ADDR    R5,     R0                      ; 5A4B   00E8
        MVI@    R2,     R3                      ; 5A4C   0293
        DECR    R3                              ; 5A4D   0013
L_5A4E:
        AND     G_0135, R3                      ; 5A4E   0383 0135
        MVO@    R3,     R2                      ; 5A50   0253
        B       L_5A5B                          ; 5A51   0200 0008

L_5A53:
        CMPR    R5,     R0                      ; 5A53   0168
        BLT     L_5A5B                          ; 5A54   0205 0005

        SUBR    R5,     R0                      ; 5A56   0128
        MVI@    R2,     R3                      ; 5A57   0293
        INCR    R3                              ; 5A58   000B
        B       L_5A4E                          ; 5A59   0220 000C

L_5A5B:
        SLL     R0,     2                       ; 5A5B   004C
        SLL     R0,     2                       ; 5A5C   004C
        INCR    R2                              ; 5A5D   000A
        PULR    R3                              ; 5A5E   02B3
        PULR    R5                              ; 5A5F   02B5
        PSHR    R0                              ; 5A60   0270
        MOVR    R5,     R0                      ; 5A61   00A8
        MVII    #$0009, R5                      ; 5A62   02BD 0009
        ANDI    #$000F, R4                      ; 5A64   03BC 000F
        ANDI    #$001C, R3                      ; 5A66   03BB 001C
        CMPI    #$0010, R3                      ; 5A68   037B 0010
        BC      L_5A6D                          ; 5A6A   0201 0001

        NEGR    R0                              ; 5A6C   0020
L_5A6D:
        ANDI    #$000C, R3                      ; 5A6D   03BB 000C
        BNEQ    L_5A72                          ; 5A6F   020C 0001

        CLRR    R0                              ; 5A71   01C0
L_5A72:
        ADDR    R4,     R0                      ; 5A72   00E0
        BPL     L_5A7D                          ; 5A73   0203 0008

        ADDR    R5,     R0                      ; 5A75   00E8
        MVI@    R2,     R3                      ; 5A76   0293
        DECR    R3                              ; 5A77   0013
L_5A78:
        ANDI    #$0003, R3                      ; 5A78   03BB 0003
        MVO@    R3,     R2                      ; 5A7A   0253
        B       L_5A85                          ; 5A7B   0200 0008

L_5A7D:
        CMPR    R5,     R0                      ; 5A7D   0168
        BLT     L_5A85                          ; 5A7E   0205 0005

        SUBR    R5,     R0                      ; 5A80   0128
        MVI@    R2,     R3                      ; 5A81   0293
        INCR    R3                              ; 5A82   000B
        B       L_5A78                          ; 5A83   0220 000C

L_5A85:
        XOR@    R6,     R0                      ; 5A85   03F0
        SUBI    #$0002, R2                      ; 5A86   033A 0002
        MVO@    R0,     R2                      ; 5A88   0250
        PULR    R7                              ; 5A89   02B7
L_5A8A:
        DECR    R7                              ; 5A8A   0017

        DECLE   $0020,  $001B,  $0022,  $0008   ; 5A8B   0020 001B 0022 0008
        DECLE   $0024,  $0008,  $0066,  $0049   ; 5A8F   0024 0008 0066 0049
        DECLE   $0064,  $004A,  $0066,  $005F   ; 5A93   0064 004A 0066 005F
        DECLE   $0068,  $005F,  $006A,  $0003   ; 5A97   0068 005F 006A 0003
        DECLE   $0007,  $0005,  $0009,  $000A   ; 5A9B   0007 0005 0009 000A
        DECLE   $000C,  $000E,  $000E,  $0037   ; 5A9F   000C 000E 000E 0037

        SLLC    R3,     1                       ; 5AA3   005B
        MOVR    R7,     R3                      ; 5AA4   00BB
        SLLC    R2,     1                       ; 5AA5   005A
        ADDR    R0,     R7                      ; 5AA6   00C7

        DECLE   $005A,  $02B6,  $005A,  $0036   ; 5AA7   005A 02B6 005A 0036
        DECLE   $0064,  $0001,  $002B,  $0004   ; 5AAB   0064 0001 002B 0004
        DECLE   $005C,  $0059                   ; 5AAF   005C 0059

        ADDR    R6,     R0                      ; 5AB1   00F0
        CMPR    R3,     R2                      ; 5AB2   015A
L_5AB3:
        MVII    #$0325, R1                      ; 5AB3   02B9 0325
        PULR    R5                              ; 5AB5   02B5
L_5AB6:
        CLRR    R0                              ; 5AB6   01C0
        MVO@    R0,     R1                      ; 5AB7   0248
        INCR    R1                              ; 5AB8   0009
        MVO@    R0,     R1                      ; 5AB9   0248
        MOVR    R5,     R7                      ; 5ABA   00AF

        PSHR    R5                              ; 5ABB   0275

        JSR     R5,     L_5A12                  ; 5ABC   0004 0158 0212

        MVII    #$0001, R3                      ; 5ABF   02BB 0001

        JSR     R5,     L_5A29                  ; 5AC1   0004 0158 0229

        SUBI    #$0007, R1                      ; 5AC4   0339 0007
        INCR    R7                              ; 5AC6   000F

        PSHR    R5                              ; 5AC7   0275
L_5AC8:
        MOVR    R1,     R3                      ; 5AC8   008B
        ADDI    #$0007, R3                      ; 5AC9   02FB 0007
        MVI@    R3,     R3                      ; 5ACB   029B
        ANDI    #$03FF, R3                      ; 5ACC   03BB 03FF
        ADDI    #$0003, R3                      ; 5ACE   02FB 0003
        MVI@    R3,     R3                      ; 5AD0   029B
        ANDI    #$001F, R3                      ; 5AD1   03BB 001F
        SDBD                                    ; 5AD3   0001
        ADDI    #$5A86, R3                      ; 5AD4   02FB 0086 005A
        MVI@    R3,     R5                      ; 5AD7   029D
        CLRR    R3                              ; 5AD8   01DB
        MVI     G_01CB, R0                      ; 5AD9   0280 01CB
        ADDR    R0,     R7                      ; 5ADB   00C7

        ADDR    R5,     R3                      ; 5ADC   00EB
        ADDR    R5,     R3                      ; 5ADD   00EB
        ADDR    R5,     R3                      ; 5ADE   00EB
        ADDR    R5,     R3                      ; 5ADF   00EB
        PSHR    R3                              ; 5AE0   0273
        MOVR    R1,     R5                      ; 5AE1   008D
        ADDI    #$0006, R5                      ; 5AE2   02FD 0006
        MVII    #$000C, R0                      ; 5AE4   02B8 000C
        MVO@    R0,     R5                      ; 5AE6   0268

        JSR     R5,     L_5991                  ; 5AE7   0004 0158 0191

        PULR    R3                              ; 5AEA   02B3
        BMI     L_5B4D                          ; 5AEB   020B 0060

        JSR     R5,     L_59A7                  ; 5AED   0004 0158 01A7

        PSHR    R5                              ; 5AF0   0275
        MVI     G_0326, R2                      ; 5AF1   0282 0326
        SDBD                                    ; 5AF3   0001
        CMPI    #$538E, R2                      ; 5AF4   037A 008E 0053
        BNEQ    L_5B4D                          ; 5AF7   020C 0054

        ADDI    #$0007, R1                      ; 5AF9   02F9 0007
        MVI@    R1,     R2                      ; 5AFB   028A
        MOVR    R2,     R5                      ; 5AFC   0095
        ANDI    #$03FF, R2                      ; 5AFD   03BA 03FF
        XORR    R2,     R5                      ; 5AFF   01D5
        SDBD                                    ; 5B00   0001
        CMPI    #$6000, R5                      ; 5B01   037D 0000 0060
        BLT     L_5B0A                          ; 5B04   0205 0004

        SDBD                                    ; 5B06   0001
        XORI    #$4000, R5                      ; 5B07   03FD 0000 0040
L_5B0A:
        XORR    R2,     R5                      ; 5B0A   01D5
        MVO@    R5,     R1                      ; 5B0B   024D
        SUBI    #$0007, R1                      ; 5B0C   0339 0007
        ADDI    #$0003, R2                      ; 5B0E   02FA 0003
        MVI@    R2,     R0                      ; 5B10   0290
        MOVR    R0,     R4                      ; 5B11   0084
        ANDI    #$001F, R4                      ; 5B12   03BC 001F
        CMPI    #$0014, R4                      ; 5B14   037C 0014
        BEQ     L_5AB3                          ; 5B16   0224 0064

        SUBI    #$0020, R0                      ; 5B18   0338 0020
        MVO@    R0,     R2                      ; 5B1A   0250
        SWAP    R0,     2                       ; 5B1B   0044
        BPL     L_5B25                          ; 5B1C   0203 0007

        MOVR    R2,     R4                      ; 5B1E   0094

        JSR     R5,     L_5E44                  ; 5B1F   0004 015C 0244
        JSR     R5,     L_58B4                  ; 5B22   0004 0158 00B4
L_5B25:
        JSR     R5,     L_6345                  ; 5B25   0004 0160 0345
        JSR     R5,     L_5396                  ; 5B28   0004 0150 0396
        DECLE   $0000,  $0000,  $0004,  $0000   ; 5B2B   0000 0000 0004 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 5B2F   0000 0002 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5B33   0001 0001 0001 0001

        PSHR    R5                              ; 5B37   0275
        MOVR    R1,     R4                      ; 5B38   008C
        MVI@    R1,     R0                      ; 5B39   0288
        SDBD                                    ; 5B3A   0001
        ANDI    #$1000, R0                      ; 5B3B   03B8 0000 0010
        BEQ     L_5B48                          ; 5B3E   0204 0008

        ADDI    #$0007, R1                      ; 5B40   02F9 0007
        MVI@    R1,     R2                      ; 5B42   028A
        SDBD                                    ; 5B43   0001
        XORI    #$4000, R2                      ; 5B44   03FA 0000 0040
        MVO@    R2,     R1                      ; 5B47   024A
L_5B48:
        MVII    #$0002, R0                      ; 5B48   02B8 0002
        ADDI    #$0006, R4                      ; 5B4A   02FC 0006
        MVO@    R0,     R4                      ; 5B4C   0260
L_5B4D:
        PULR    R7                              ; 5B4D   02B7

L_5B4E:
        PSHR    R5                              ; 5B4E   0275
        MVII    #$000D, R3                      ; 5B4F   02BB 000D
        MVO     R3,     G_0170                  ; 5B51   0243 0170
        MVII    #$000A, R5                      ; 5B53   02BD 000A
        MOVR    R7,     R3                      ; 5B55   00BB
        ADDI    #$00C5, R3                      ; 5B56   02FB 00C5
        MVII    #$0171, R1                      ; 5B58   02B9 0171
L_5B5A:
        PSHR    R5                              ; 5B5A   0275
        PSHR    R3                              ; 5B5B   0273
L_5B5C:
        MVII    #$0002, R0                      ; 5B5C   02B8 0002

        JSR     R5,     X_RAND1                 ; 5B5E   0004 0114 027D

        MOVR    R0,     R2                      ; 5B61   0082
        MVI     G_0136, R0                      ; 5B62   0280 0136

        JSR     R5,     X_RAND2                 ; 5B64   0004 0114 029E

        TSTR    R0                              ; 5B67   0080
        BNEQ    L_5B6D                          ; 5B68   020C 0003

        TSTR    R2                              ; 5B6A   0092
        BEQ     L_5B5C                          ; 5B6B   0224 0010

L_5B6D:
        MOVR    R1,     R4                      ; 5B6D   008C
        MVII    #$0044, R1                      ; 5B6E   02B9 0044
        MVO@    R1,     R4                      ; 5B70   0261
        MVO@    R0,     R4                      ; 5B71   0260
        MVO@    R2,     R4                      ; 5B72   0262
        MOVR    R4,     R1                      ; 5B73   00A1
        MVII    #$0172, R4                      ; 5B74   02BC 0172
        SUBI    #$0003, R1                      ; 5B76   0339 0003
L_5B78:
        MOVR    R4,     R3                      ; 5B78   00A3
        CMPR    R1,     R4                      ; 5B79   014C
        BGT     L_5B87                          ; 5B7A   020E 000B

        CMP@    R4,     R0                      ; 5B7C   0360
        BNEQ    L_5B82                          ; 5B7D   020C 0003

        CMP@    R4,     R2                      ; 5B7F   0362
        BEQ     L_5B5C                          ; 5B80   0224 0025

L_5B82:
        ADDI    #$0004, R3                      ; 5B82   02FB 0004
        MOVR    R3,     R4                      ; 5B84   009C
        B       L_5B78                          ; 5B85   0220 000E

L_5B87:
        ADDI    #$0002, R4                      ; 5B87   02FC 0002
        PULR    R3                              ; 5B89   02B3
        PULR    R5                              ; 5B8A   02B5
        PSHR    R5                              ; 5B8B   0275
        MVI@    R3,     R1                      ; 5B8C   0299
        PSHR    R0                              ; 5B8D   0270
        MVII    #$0003, R0                      ; 5B8E   02B8 0003
        CMPI    #$0003, R5                      ; 5B90   037D 0003
        BLT     L_5B9F                          ; 5B92   0205 000B

        CMPI    #$0008, R5                      ; 5B94   037D 0008
        BLT     L_5B9B                          ; 5B96   0205 0003
        BGT     L_5B9F                          ; 5B98   020E 0005

        DECR    R0                              ; 5B9A   0010

L_5B9B:
        JSR     R5,     X_RAND2                 ; 5B9B   0004 0114 029E

        ADDR    R0,     R1                      ; 5B9E   00C1
L_5B9F:
        PULR    R0                              ; 5B9F   02B0
        MVO@    R1,     R4                      ; 5BA0   0261

        JSR     R5,     L_5BD9                  ; 5BA1   0004 0158 03D9

        MOVR    R4,     R1                      ; 5BA4   00A1
        PULR    R5                              ; 5BA5   02B5
        CMPI    #$0003, R5                      ; 5BA6   037D 0003
        BGT     L_5BB2                          ; 5BA8   020E 0008
        BLT     L_5BB0                          ; 5BAA   0205 0004

        ADD     G_01D5, R3                      ; 5BAC   02C3 01D5
        B       L_5BB2                          ; 5BAE   0200 0002

L_5BB0:
        ADDI    #$0004, R3                      ; 5BB0   02FB 0004
L_5BB2:
        INCR    R3                              ; 5BB2   000B
        DECR    R5                              ; 5BB3   0015
        BPL     L_5B5A                          ; 5BB4   0223 005B

        MOVR    R1,     R4                      ; 5BB6   008C
        MVII    #$0044, R1                      ; 5BB7   02B9 0044
        MOVR    R7,     R3                      ; 5BB9   00BB
        ADDI    #$0075, R3                      ; 5BBA   02FB 0075
        ADD     G_01D5, R3                      ; 5BBC   02C3 01D5
        MVO@    R1,     R4                      ; 5BBE   0261
        MVI     G_0192, R0                      ; 5BBF   0280 0192
        MVO@    R0,     R4                      ; 5BC1   0260
        MVI     G_0193, R2                      ; 5BC2   0282 0193
        MVO@    R2,     R4                      ; 5BC4   0262
        MVI@    R3,     R1                      ; 5BC5   0299
        MVO@    R1,     R4                      ; 5BC6   0261

        JSR     R5,     L_5BD9                  ; 5BC7   0004 0158 03D9

        MVII    #$0044, R1                      ; 5BCA   02B9 0044
        MVO@    R1,     R4                      ; 5BCC   0261
        MVI     G_0196, R0                      ; 5BCD   0280 0196
        MVO@    R0,     R4                      ; 5BCF   0260
        MVI     G_0197, R2                      ; 5BD0   0282 0197
        MVO@    R2,     R4                      ; 5BD2   0262
        MVI@    R3,     R1                      ; 5BD3   0299
        MVO@    R1,     R4                      ; 5BD4   0261

        JSR     R5,     L_5BD9                  ; 5BD5   0004 0158 03D9

        PULR    R7                              ; 5BD8   02B7

L_5BD9:
        PSHR    R5                              ; 5BD9   0275
        PSHR    R3                              ; 5BDA   0273
        ANDI    #$001F, R1                      ; 5BDB   03B9 001F
        SUBI    #$0017, R1                      ; 5BDD   0339 0017
        BMI     L_5C11                          ; 5BDF   020B 0030

        DECR    R1                              ; 5BE1   0011
        BGT     L_5C11                          ; 5BE2   020E 002D

        MOVR    R1,     R3                      ; 5BE4   008B
        ADDI    #$0002, R3                      ; 5BE5   02FB 0002
        PSHR    R4                              ; 5BE7   0274

        JSR     R5,     L_570F                  ; 5BE8   0004 0154 030F

        MVI@    R4,     R1                      ; 5BEB   02A1
        ANDI    #$000F, R1                      ; 5BEC   03B9 000F
        PULR    R4                              ; 5BEE   02B4
        MOVR    R7,     R5                      ; 5BEF   00BD
        ADDI    #$0023, R5                      ; 5BF0   02FD 0023
L_5BF2:
        PSHR    R0                              ; 5BF2   0270
        PSHR    R2                              ; 5BF3   0272
        ADD@    R5,     R0                      ; 5BF4   02E8
        DECR    R0                              ; 5BF5   0010
        AND     G_0135, R0                      ; 5BF6   0380 0135
        ADD@    R5,     R2                      ; 5BF8   02EA
        DECR    R2                              ; 5BF9   0012
        ANDI    #$0003, R2                      ; 5BFA   03BA 0003
        SARC    R1,     1                       ; 5BFC   0079
        BNC     L_5C0C                          ; 5BFD   0209 000D

        PSHR    R3                              ; 5BFF   0273
        MVII    #$0045, R3                      ; 5C00   02BB 0045
        MVO@    R3,     R4                      ; 5C02   0263
        MVO@    R0,     R4                      ; 5C03   0260
        MVO@    R2,     R4                      ; 5C04   0262
        MVI     G_0170, R3                      ; 5C05   0283 0170
        INCR    R3                              ; 5C07   000B
        MVO     R3,     G_0170                  ; 5C08   0243 0170
        PULR    R3                              ; 5C0A   02B3
        MVO@    R3,     R4                      ; 5C0B   0263
L_5C0C:
        PULR    R2                              ; 5C0C   02B2
        PULR    R0                              ; 5C0D   02B0
        TSTR    R1                              ; 5C0E   0089
        BNEQ    L_5BF2                          ; 5C0F   022C 001E

L_5C11:
        PULR    R3                              ; 5C11   02B3
        PULR    R7                              ; 5C12   02B7

        DECLE   $0002,  $0001,  $0001,  $0000   ; 5C13   0002 0001 0001 0000
        DECLE   $0000,  $0001,  $0001,  $0002   ; 5C17   0000 0001 0001 0002
        DECLE   $0004,  $0005,  $0004,  $0014   ; 5C1B   0004 0005 0004 0014
        DECLE   $0014,  $0014,  $0014,  $0014   ; 5C1F   0014 0014 0014 0014
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5C23   0003 0003 0003 0003
        DECLE   $000A,  $0005                   ; 5C27   000A 0005

        SETC                                    ; 5C29   0007
        INCR    R0                              ; 5C2A   0008
        INCR    R1                              ; 5C2B   0009
        INCR    R3                              ; 5C2C   000B
        RSWD    R1                              ; 5C2D   0039
        RSWD    R2                              ; 5C2E   003A
L_5C2F:
        DECR    R7                              ; 5C2F   0017

        RSWD    R0                              ; 5C30   0038
        RSWD    R1                              ; 5C31   0039
        RSWD    R2                              ; 5C32   003A
        SLLC    R3,     1                       ; 5C33   005B
L_5C34:
        PSHR    R5                              ; 5C34   0275
        MVI     G_01E2, R5                      ; 5C35   0285 01E2
        ANDI    #$001E, R5                      ; 5C37   03BD 001E
        BNEQ    L_5C83                          ; 5C39   020C 0048

        MVII    #$011F, R1                      ; 5C3B   02B9 011F
        MVI@    R1,     R0                      ; 5C3D   0288
        ANDI    #$00C0, R0                      ; 5C3E   03B8 00C0
        BEQ     L_5C48                          ; 5C40   0204 0006

        INCR    R1                              ; 5C42   0009
        MVI@    R1,     R0                      ; 5C43   0288
        ANDI    #$00C0, R0                      ; 5C44   03B8 00C0
        BNEQ    L_5C83                          ; 5C46   020C 003B

L_5C48:
        PSHR    R1                              ; 5C48   0271
        MVI@    R1,     R1                      ; 5C49   0289
        MVII    #$0282, R2                      ; 5C4A   02BA 0282

        JSR     R5,     L_5796                  ; 5C4C   0004 0154 0396

        BNC     L_5C98                          ; 5C4F   0209 0047

        MVI     G_01D9, R5                      ; 5C51   0285 01D9
        CMPI    #$00FF, R5                      ; 5C53   037D 00FF
        BEQ     L_5C58                          ; 5C55   0204 0001

        CMPR    R1,     R5                      ; 5C57   014D
L_5C58:
        MVO     R1,     G_01D9                  ; 5C58   0241 01D9
        BNEQ    L_5C98                          ; 5C5A   020C 003C

        JSR     R5,     L_64A9                  ; 5C5C   0004 0164 00A9

        PULR    R2                              ; 5C5F   02B2
        SDBD                                    ; 5C60   0001
        ADDI    #$0002, R2                      ; 5C61   02FA 0002 0000
        MVII    #$0010, R0                      ; 5C64   02B8 0010
        MVI@    R2,     R4                      ; 5C66   0294
        TSTR    R4                              ; 5C67   00A4
        BEQ     L_5C6C                          ; 5C68   0204 0002

        MVII    #$0017, R0                      ; 5C6A   02B8 0017
L_5C6C:
        SLL     R1,     1                       ; 5C6C   0049
        ADDI    #$0008, R1                      ; 5C6D   02F9 0008

        JSR     R5,     .EXEC.629               ; 5C6F   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5C72   0004 0114 0357

        MVO     R0,     G_01DA                  ; 5C75   0240 01DA
        MVO     R1,     G_01DD                  ; 5C77   0241 01DD
        MVII    #$0002, R0                      ; 5C79   02B8 0002
        MVO     R0,     G_0323                  ; 5C7B   0240 0323
        CLRR    R0                              ; 5C7D   01C0
        MVO     R0,     G_01D6                  ; 5C7E   0240 01D6

        JSR     R5,     L_5C90                  ; 5C80   0004 015C 0090

L_5C83:
        PULR    R7                              ; 5C83   02B7

        PSHR    R5                              ; 5C84   0275
        TSTR    R0                              ; 5C85   0080
        BPL     L_5C83                          ; 5C86   0223 0004

        MVI     G_0323, R1                      ; 5C88   0281 0323
        TSTR    R1                              ; 5C8A   0089
        BEQ     L_5C9B                          ; 5C8B   0204 000E

        MVO     R1,     G_01D6                  ; 5C8D   0241 01D6
        PULR    R7                              ; 5C8F   02B7

L_5C90:
        MVII    #$001E, R0                      ; 5C90   02B8 001E
        COMR    R0                              ; 5C92   0018
        AND     G_01E2, R0                      ; 5C93   0380 01E2
        MVO     R0,     G_01E2                  ; 5C95   0240 01E2
        MOVR    R5,     R7                      ; 5C97   00AF

L_5C98:
        PULR    R0                              ; 5C98   02B0
        INCR    R7                              ; 5C99   000F

L_5C9A:
        PSHR    R5                              ; 5C9A   0275
L_5C9B:
        CLRR    R0                              ; 5C9B   01C0
        MVI     G_01DA, R2                      ; 5C9C   0282 01DA
        SWAP    R2,     2                       ; 5C9E   0046
        BEQ     L_5CA3                          ; 5C9F   0204 0002

        MVII    #$0004, R0                      ; 5CA1   02B8 0004
L_5CA3:
        BPL     L_5CA6                          ; 5CA3   0203 0001

        SLR     R0,     1                       ; 5CA5   0060
L_5CA6:
        CLRR    R1                              ; 5CA6   01C9
        MVI     G_01DD, R2                      ; 5CA7   0282 01DD
        SWAP    R2,     2                       ; 5CA9   0046
        BEQ     L_5CAE                          ; 5CAA   0204 0002

        MVII    #$0010, R1                      ; 5CAC   02B9 0010
L_5CAE:
        BPL     L_5CB1                          ; 5CAE   0203 0001

        SLR     R1,     1                       ; 5CB0   0061
L_5CB1:
        XORR    R0,     R1                      ; 5CB1   01C1
        MOVR    R1,     R0                      ; 5CB2   0088
        COMR    R0                              ; 5CB3   0018
        AND     G_01E2, R0                      ; 5CB4   0380 01E2
        XORR    R1,     R0                      ; 5CB6   01C8
        MVO     R0,     G_01E2                  ; 5CB7   0240 01E2
        CLRR    R0                              ; 5CB9   01C0
        MVO     R0,     G_01D6                  ; 5CBA   0240 01D6
        PULR    R7                              ; 5CBC   02B7

        MVI     G_01D6, R0                      ; 5CBD   0280 01D6
        TSTR    R0                              ; 5CBF   0080
        BNEQ    L_5C9A                          ; 5CC0   022C 0027
        MOVR    R5,     R7                      ; 5CC2   00AF

L_5CC3:
        PSHR    R5                              ; 5CC3   0275
L_5CC4:
        MVII    #$0009, R5                      ; 5CC4   02BD 0009
        CLRR    R4                              ; 5CC6   01E4
        MVI     G_016A, R0                      ; 5CC7   0280 016A
        CMPI    #$0001, R0                      ; 5CC9   0378 0001
        BEQ     L_5CE4                          ; 5CCB   0204 0017

        MVO     R4,     G_0166                  ; 5CCD   0244 0166
        MVI     G_0164, R1                      ; 5CCF   0281 0164
        MVO     R1,     G_0168                  ; 5CD1   0241 0168
        MVI     G_0165, R1                      ; 5CD3   0281 0165
        MVII    #$0001, R2                      ; 5CD5   02BA 0001
        ADDI    #$0002, R1                      ; 5CD7   02F9 0002
        CMPR    R5,     R1                      ; 5CD9   0169
        BLT     L_5CDE                          ; 5CDA   0205 0002

        INCR    R2                              ; 5CDC   000A
        SUBR    R5,     R1                      ; 5CDD   0129
L_5CDE:
        MVO     R1,     G_0169                  ; 5CDE   0241 0169
        MVO     R2,     G_0167                  ; 5CE0   0242 0167
        B       L_5CF9                          ; 5CE2   0200 0015

L_5CE4:
        MVO     R4,     G_0167                  ; 5CE4   0244 0167
        MVI     G_0165, R1                      ; 5CE6   0281 0165
        MVO     R1,     G_0169                  ; 5CE8   0241 0169
        MVI     G_0164, R1                      ; 5CEA   0281 0164
        MVII    #$0002, R2                      ; 5CEC   02BA 0002
        ADDI    #$0001, R1                      ; 5CEE   02F9 0001
        CMPR    R5,     R1                      ; 5CF0   0169
        BLT     L_5CF5                          ; 5CF1   0205 0002

        INCR    R2                              ; 5CF3   000A
        SUBR    R5,     R1                      ; 5CF4   0129
L_5CF5:
        MVO     R1,     G_0168                  ; 5CF5   0241 0168
        MVO     R2,     G_0166                  ; 5CF7   0242 0166
L_5CF9:
        MVII    #$016E, R4                      ; 5CF9   02BC 016E
        MVI     G_0170, R3                      ; 5CFB   0283 0170
        DECR    R3                              ; 5CFD   0013
        BMI     L_5D80                          ; 5CFE   020B 0080

L_5D00:
        ADDI    #$0003, R4                      ; 5D00   02FC 0003
L_5D02:
        MVI@    R4,     R1                      ; 5D02   02A1
        CMPI    #$00FF, R1                      ; 5D03   0379 00FF
        BEQ     L_5D00                          ; 5D05   0224 0006

        MOVR    R1,     R2                      ; 5D07   008A
        SLR     R1,     2                       ; 5D08   0065
        SLR     R1,     2                       ; 5D09   0065
        ANDI    #$000F, R2                      ; 5D0A   03BA 000F
        MVI@    R4,     R0                      ; 5D0C   02A0
        SUB     G_0162, R0                      ; 5D0D   0300 0162
        BNEQ    L_5D1F                          ; 5D0F   020C 000E

        CMP     G_0164, R1                      ; 5D11   0341 0164
        BLT     L_5D7B                          ; 5D13   0205 0066

        ADD     G_0166, R0                      ; 5D15   02C0 0166
        BNEQ    L_5D2D                          ; 5D17   020C 0014

        CMP     G_0168, R1                      ; 5D19   0341 0168
        BGT     L_5D7B                          ; 5D1B   020E 005E
        B       L_5D2D                          ; 5D1D   0200 000E
L_5D1F:
        BPL     L_5D23                          ; 5D1F   0203 0002

        ADD     G_0136, R0                      ; 5D21   02C0 0136
L_5D23:
        CMP     G_0166, R0                      ; 5D23   0340 0166
        BLT     L_5D2D                          ; 5D25   0205 0006
        BGT     L_5D7B                          ; 5D27   020E 0052

        CMP     G_0168, R1                      ; 5D29   0341 0168
        BGT     L_5D7B                          ; 5D2B   020E 004E

L_5D2D:
        MVI@    R4,     R0                      ; 5D2D   02A0
        SUB     G_0163, R0                      ; 5D2E   0300 0163
        BNEQ    L_5D40                          ; 5D30   020C 000E

        CMP     G_0165, R2                      ; 5D32   0342 0165
        BLT     L_5D7C                          ; 5D34   0205 0046

        ADD     G_0167, R0                      ; 5D36   02C0 0167
        BNEQ    L_5D4E                          ; 5D38   020C 0014

        CMP     G_0169, R2                      ; 5D3A   0342 0169
        BGT     L_5D7C                          ; 5D3C   020E 003E
        B       L_5D4E                          ; 5D3E   0200 000E
L_5D40:
        BPL     L_5D44                          ; 5D40   0203 0002

        ADDI    #$0004, R0                      ; 5D42   02F8 0004
L_5D44:
        CMP     G_0167, R0                      ; 5D44   0340 0167
        BLT     L_5D4E                          ; 5D46   0205 0006
        BGT     L_5D7C                          ; 5D48   020E 0032

        CMP     G_0169, R2                      ; 5D4A   0342 0169
        BGT     L_5D7C                          ; 5D4C   020E 002E

L_5D4E:
        SUBI    #$0002, R4                      ; 5D4E   033C 0002
        MVI@    R4,     R5                      ; 5D50   02A5
        SUB     G_015E, R5                      ; 5D51   0305 015E
        BPL     L_5D57                          ; 5D53   0203 0002

        ADD     G_0136, R5                      ; 5D55   02C5 0136
L_5D57:
        PSHR    R5                              ; 5D57   0275
        ADDR    R5,     R5                      ; 5D58   00ED
        ADDR    R5,     R5                      ; 5D59   00ED
        ADDR    R5,     R5                      ; 5D5A   00ED
        ADD@    R6,     R5                      ; 5D5B   02F5
        ADDR    R5,     R1                      ; 5D5C   00E9
        SUB     G_0160, R1                      ; 5D5D   0301 0160
        MVI@    R4,     R5                      ; 5D5F   02A5
        SUB     G_015F, R5                      ; 5D60   0305 015F
        BPL     L_5D66                          ; 5D62   0203 0002

        ADDI    #$0004, R5                      ; 5D64   02FD 0004
L_5D66:
        PSHR    R5                              ; 5D66   0275
        ADDR    R5,     R5                      ; 5D67   00ED
        ADDR    R5,     R5                      ; 5D68   00ED
        ADDR    R5,     R5                      ; 5D69   00ED
        ADD@    R6,     R5                      ; 5D6A   02F5
        ADDR    R5,     R2                      ; 5D6B   00EA
        SUB     G_0161, R2                      ; 5D6C   0302 0161
        SLL     R2,     2                       ; 5D6E   004E
        PSHR    R2                              ; 5D6F   0272
        SLL     R2,     2                       ; 5D70   004E
        ADD@    R6,     R2                      ; 5D71   02F2
        ADDR    R2,     R1                      ; 5D72   00D1
        MVI@    R4,     R0                      ; 5D73   02A0
        ANDI    #$001F, R0                      ; 5D74   03B8 001F

        JSR     R5,     L_5D81                  ; 5D76   0004 015C 0181

        B       L_5D7D                          ; 5D79   0200 0002

L_5D7B:
        INCR    R4                              ; 5D7B   000C
L_5D7C:
        INCR    R4                              ; 5D7C   000C
L_5D7D:
        DECR    R3                              ; 5D7D   0013
        BPL     L_5D02                          ; 5D7E   0223 007D
L_5D80:
        PULR    R7                              ; 5D80   02B7

L_5D81:
        PSHR    R5                              ; 5D81   0275
        ADDI    #$0200, R1                      ; 5D82   02F9 0200
        ANDI    #$001F, R0                      ; 5D84   03B8 001F
        CMPI    #$0014, R0                      ; 5D86   0378 0014
        BC      L_5DAC                          ; 5D88   0201 0022

        MVI@    R1,     R5                      ; 5D8A   028D
        SDBD                                    ; 5D8B   0001
        ANDI    #$3600, R5                      ; 5D8C   03BD 0000 0036
        SDBD                                    ; 5D8F   0001
        CMPI    #$2400, R5                      ; 5D90   037D 0000 0024
        MVII    #$0004, R5                      ; 5D93   02BD 0004
        BNEQ    L_5D9D                          ; 5D95   020C 0006

        MOVR    R0,     R5                      ; 5D97   0085
        SDBD                                    ; 5D98   0001
        ADDI    #$5B2A, R5                      ; 5D99   02FD 002A 005B
        MVI@    R5,     R5                      ; 5D9C   02AD
L_5D9D:
        SLL     R0,     2                       ; 5D9D   004C
        SLL     R0,     1                       ; 5D9E   0048
        ADDR    R5,     R0                      ; 5D9F   00E8
        MVI@    R1,     R5                      ; 5DA0   028D
        SDBD                                    ; 5DA1   0001
        ANDI    #$B600, R5                      ; 5DA2   03BD 0000 00B6
        ADDR    R0,     R5                      ; 5DA5   00C5
        SDBD                                    ; 5DA6   0001
        ADDI    #$0830, R5                      ; 5DA7   02FD 0030 0008
        MVO@    R5,     R1                      ; 5DAA   024D
        PULR    R7                              ; 5DAB   02B7

L_5DAC:
        JSR     R5,     L_5276                  ; 5DAC   0004 0150 0276

        BMI     L_5DDD                          ; 5DAF   020B 002C

        PSHR    R4                              ; 5DB1   0274
        MOVR    R2,     R5                      ; 5DB2   0095
        MOVR    R0,     R4                      ; 5DB3   0084
        ADDR    R4,     R4                      ; 5DB4   00E4
        SDBD                                    ; 5DB5   0001
        ADDI    #$5A62, R4                      ; 5DB6   02FC 0062 005A
        SDBD                                    ; 5DB9   0001
        MVII    #$5800, R0                      ; 5DBA   02B8 0000 0058
        XOR@    R4,     R0                      ; 5DBD   03E0
        MVO@    R0,     R5                      ; 5DBE   0268
        SDBD                                    ; 5DBF   0001
        MVII    #$5AA8, R0                      ; 5DC0   02B8 00A8 005A
        MVO@    R0,     R5                      ; 5DC3   0268
        PSHR    R5                              ; 5DC4   0275

        JSR     R5,     L_5262                  ; 5DC5   0004 0150 0262

        PULR    R5                              ; 5DC8   02B5
        MVO@    R0,     R5                      ; 5DC9   0268
        MVO@    R1,     R5                      ; 5DCA   0269
        CLRR    R0                              ; 5DCB   01C0
        MVO@    R0,     R5                      ; 5DCC   0268
        MVI@    R4,     R1                      ; 5DCD   02A1
        MOVR    R1,     R0                      ; 5DCE   0088
        ANDI    #$000F, R0                      ; 5DCF   03B8 000F
        XORR    R0,     R1                      ; 5DD1   01C1
        SWAP    R1,     1                       ; 5DD2   0041
        MVO@    R0,     R5                      ; 5DD3   0268
        MVII    #$0003, R0                      ; 5DD4   02B8 0003
        MVO@    R0,     R5                      ; 5DD6   0268
        PULR    R4                              ; 5DD7   02B4
        MOVR    R4,     R0                      ; 5DD8   00A0
        SUBI    #$0004, R0                      ; 5DD9   0338 0004
        XORR    R0,     R1                      ; 5DDB   01C1
        MVO@    R1,     R5                      ; 5DDC   0269
L_5DDD:
        PULR    R7                              ; 5DDD   02B7

        PSHR    R5                              ; 5DDE   0275
        PSHR    R4                              ; 5DDF   0274
        MVII    #$015E, R4                      ; 5DE0   02BC 015E
        MVII    #$0162, R1                      ; 5DE2   02B9 0162
        SDBD                                    ; 5DE4   0001
        MVII    #$0004, R0                      ; 5DE5   02B8 0004 0000

        JSR     R5,     .EXEC.730               ; 5DE8   0004 0114 0330

        MVII    #$0009, R5                      ; 5DEB   02BD 0009
        MVI     G_0164, R1                      ; 5DED   0281 0164
        MVII    #$0002, R4                      ; 5DEF   02BC 0002
        ADDI    #$0001, R1                      ; 5DF1   02F9 0001
        CMPR    R5,     R1                      ; 5DF3   0169
        BLT     L_5DF8                          ; 5DF4   0205 0002

        INCR    R4                              ; 5DF6   000C
        SUBR    R5,     R1                      ; 5DF7   0129
L_5DF8:
        MVO     R1,     G_0168                  ; 5DF8   0241 0168
        MVO     R4,     G_0166                  ; 5DFA   0244 0166
        MVI     G_0165, R1                      ; 5DFC   0281 0165
        MVII    #$0001, R4                      ; 5DFE   02BC 0001
        ADDI    #$0002, R1                      ; 5E00   02F9 0002
        CMPR    R5,     R1                      ; 5E02   0169
        BLT     L_5E07                          ; 5E03   0205 0002

        INCR    R4                              ; 5E05   000C
        SUBR    R5,     R1                      ; 5E06   0129
L_5E07:
        MVO     R1,     G_0169                  ; 5E07   0241 0169
        MVO     R4,     G_0167                  ; 5E09   0244 0167
        PULR    R4                              ; 5E0B   02B4
        CLRR    R3                              ; 5E0C   01DB
        B       L_5D02                          ; 5E0D   0220 010C

L_5E0F:
        PSHR    R5                              ; 5E0F   0275
        PSHR    R4                              ; 5E10   0274
        MVII    #$0014, R5                      ; 5E11   02BD 0014
        MVII    #$0009, R4                      ; 5E13   02BC 0009
        MVI     G_0161, R3                      ; 5E15   0283 0161
        MVI     G_015F, R2                      ; 5E17   0282 015F
        ANDI    #$01FF, R1                      ; 5E19   03B9 01FF
        CMPI    #$00B4, R1                      ; 5E1B   0379 00B4
        BNC     L_5E22                          ; 5E1D   0209 0003

        SUBI    #$00B4, R1                      ; 5E1F   0339 00B4
        INCR    R2                              ; 5E21   000A
L_5E22:
        SUBR    R5,     R1                      ; 5E22   0129
        BLT     L_5E2D                          ; 5E23   0205 0008

        INCR    R3                              ; 5E25   000B
        CMPR    R4,     R3                      ; 5E26   0163
        BLT     L_5E22                          ; 5E27   0225 0006

        SUBR    R4,     R3                      ; 5E29   0123
        INCR    R2                              ; 5E2A   000A
        B       L_5E22                          ; 5E2B   0220 000A

L_5E2D:
        ANDI    #$0003, R2                      ; 5E2D   03BA 0003
        ADDR    R5,     R1                      ; 5E2F   00E9
        MVI     G_015E, R0                      ; 5E30   0280 015E
L_5E32:
        SUBR    R4,     R1                      ; 5E32   0121
        BLT     L_5E38                          ; 5E33   0205 0003

        INCR    R0                              ; 5E35   0008
        B       L_5E32                          ; 5E36   0220 0005

L_5E38:
        ADDR    R4,     R1                      ; 5E38   00E1
        ADD     G_0160, R1                      ; 5E39   02C1 0160
        CMPR    R4,     R1                      ; 5E3B   0161
        BLT     L_5E40                          ; 5E3C   0205 0002

        SUBR    R4,     R1                      ; 5E3E   0121
        INCR    R0                              ; 5E3F   0008
L_5E40:
        AND     G_0135, R0                      ; 5E40   0380 0135
        PULR    R4                              ; 5E42   02B4
        PULR    R7                              ; 5E43   02B7

L_5E44:
        PSHR    R5                              ; 5E44   0275
        MOVR    R1,     R2                      ; 5E45   008A
        ADDI    #$0002, R1                      ; 5E46   02F9 0002
        MVI@    R1,     R3                      ; 5E48   028B
        INCR    R1                              ; 5E49   0009
        MVI@    R1,     R0                      ; 5E4A   0288
        PSHR    R0                              ; 5E4B   0270
        MOVR    R7,     R1                      ; 5E4C   00B9
        ADDI    #$000C, R1                      ; 5E4D   02F9 000C

        JSR     R5,     X_INIT_MOB              ; 5E4F   0004 0114 02B2

        ADDI    #$0002, R2                      ; 5E52   02FA 0002
        MVO@    R3,     R2                      ; 5E54   0253
        INCR    R2                              ; 5E55   000A
        PULR    R0                              ; 5E56   02B0
        MVO@    R0,     R2                      ; 5E57   0250
        PULR    R7                              ; 5E58   02B7

        DECLE   $0050,  $0050,  $0069,  $005E   ; 5E59   0050 0050 0069 005E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5D   0000 0000 0000 0000
        DECLE   $00F8,  $0000,  $00F0,  $0003   ; 5E61   00F8 0000 00F0 0003
        DECLE   $0028,  $0000,  $0000,  $0000   ; 5E65   0028 0000 0000 0000
        DECLE   $0270,  $005E,  $0070,  $005E   ; 5E69   0270 005E 0070 005E
        DECLE   $0002,  $0043,  $0000           ; 5E6D   0002 0043 0000

        PSHR    R5                              ; 5E70   0275
        CLRR    R2                              ; 5E71   01D2
        MVO@    R2,     R1                      ; 5E72   024A
        INCR    R1                              ; 5E73   0009
        MVO@    R2,     R1                      ; 5E74   024A
        CMPI    #$031E, R1                      ; 5E75   0379 031E
        BNEQ    L_5E87                          ; 5E77   020C 000E

        MVII    #$0085, R0                      ; 5E79   02B8 0085
        MVI     G_01D2, R2                      ; 5E7B   0282 01D2
        DECR    R2                              ; 5E7D   0012
        MVO     R2,     G_01D2                  ; 5E7E   0242 01D2
        BNEQ    L_5E85                          ; 5E80   020C 0003
        J       L_58CE                          ; 5E82   0004 0358 00CE

L_5E85:
        MVO     R0,     G_01CC                  ; 5E85   0240 01CC
L_5E87:
        PULR    R7                              ; 5E87   02B7

L_5E88:
        PSHR    R5                              ; 5E88   0275
        MVII    #$032D, R1                      ; 5E89   02B9 032D
L_5E8B:
        MOVR    R1,     R4                      ; 5E8B   008C
        MVI@    R4,     R0                      ; 5E8C   02A0
        SDBD                                    ; 5E8D   0001
        ANDI    #$FDFF, R0                      ; 5E8E   03B8 00FF 00FD
        MVI@    R4,     R2                      ; 5E91   02A2
        TSTR    R2                              ; 5E92   0092
        BEQ     L_5ED0                          ; 5E93   0204 003B

        ADDI    #$0002, R4                      ; 5E95   02FC 0002
        MVI@    R4,     R2                      ; 5E97   02A2
        TSTR    R2                              ; 5E98   0092
        BMI     L_5E9D                          ; 5E99   020B 0002

        XORI    #$0200, R0                      ; 5E9B   03F8 0200
L_5E9D:
        MVO@    R0,     R1                      ; 5E9D   0248
        MVI@    R4,     R0                      ; 5E9E   02A0
        XORI    #$0001, R0                      ; 5E9F   03F8 0001
        DECR    R4                              ; 5EA1   0014
        MVO@    R0,     R4                      ; 5EA2   0260
        INCR    R4                              ; 5EA3   000C
        MVI@    R4,     R4                      ; 5EA4   02A4
        MOVR    R4,     R5                      ; 5EA5   00A5
        ANDI    #$03FF, R4                      ; 5EA6   03BC 03FF
        BEQ     L_5ED0                          ; 5EA8   0204 0026

        ADDI    #$0003, R4                      ; 5EAA   02FC 0003
        MVI@    R4,     R4                      ; 5EAC   02A4
        ANDI    #$001F, R4                      ; 5EAD   03BC 001F
        SUBI    #$0014, R4                      ; 5EAF   033C 0014
        ADDR    R4,     R4                      ; 5EB1   00E4
        ADDR    R7,     R4                      ; 5EB2   00FC
        ADDI    #$0024, R4                      ; 5EB3   02FC 0024
        SDBD                                    ; 5EB5   0001
        ANDI    #$E000, R5                      ; 5EB6   03BD 0000 00E0
        SDBD                                    ; 5EB9   0001
        CMPI    #$6000, R5                      ; 5EBA   037D 0000 0060
        BNEQ    L_5EC9                          ; 5EBD   020C 000A

        MVII    #$0014, R0                      ; 5EBF   02B8 0014

        JSR     R5,     X_RAND2                 ; 5EC1   0004 0114 029E

        TSTR    R0                              ; 5EC4   0080
        BNEQ    L_5ED0                          ; 5EC5   020C 0009

        ADDI    #$0010, R4                      ; 5EC7   02FC 0010
L_5EC9:
        PSHR    R1                              ; 5EC9   0271
        MOVR    R7,     R5                      ; 5ECA   00BD
        ADDI    #$0004, R5                      ; 5ECB   02FD 0004
        SDBD                                    ; 5ECD   0001
        MVI@    R4,     R7                      ; 5ECE   02A7

        PULR    R1                              ; 5ECF   02B1
L_5ED0:
        ADDI    #$0008, R1                      ; 5ED0   02F9 0008
        CMPI    #$0355, R1                      ; 5ED2   0379 0355
        BLE     L_5E8B                          ; 5ED4   0226 004A
        PULR    R7                              ; 5ED6   02B7
        ADDR    R1,     R7                      ; 5ED7   00CF

        SLLC    R2,     2                       ; 5ED8   005E
        MOVR    R4,     R3                      ; 5ED9   00A3
        SLR     R2,     1                       ; 5EDA   0062
        ADDR    R1,     R7                      ; 5EDB   00CF

        SLLC    R2,     2                       ; 5EDC   005E
        MOVR    R2,     R1                      ; 5EDD   0091
        SLR     R2,     1                       ; 5EDE   0062
        ADDR    R1,     R7                      ; 5EDF   00CF

        SLLC    R2,     2                       ; 5EE0   005E
        ADDR    R4,     R4                      ; 5EE1   00E4
        SLR     R2,     1                       ; 5EE2   0062
        MOVR    R6,     R4                      ; 5EE3   00B4
        SLR     R2,     1                       ; 5EE4   0062
        MOVR    R6,     R4                      ; 5EE5   00B4
        SLR     R2,     1                       ; 5EE6   0062
        ADDR    R1,     R7                      ; 5EE7   00CF

        SLLC    R2,     2                       ; 5EE8   005E
        ADDR    R1,     R7                      ; 5EE9   00CF

        SLLC    R2,     2                       ; 5EEA   005E
        ADDR    R1,     R7                      ; 5EEB   00CF

        SLLC    R2,     2                       ; 5EEC   005E
        ADDR    R1,     R7                      ; 5EED   00CF

        SLLC    R2,     2                       ; 5EEE   005E
        ADDR    R1,     R7                      ; 5EEF   00CF

        DECLE   $005E,  $00F7                   ; 5EF0   005E 00F7

        SLR     R2,     1                       ; 5EF2   0062
        INCR    R3                              ; 5EF3   000B
        SLR     R3,     1                       ; 5EF4   0063
        INCR    R3                              ; 5EF5   000B
        SLR     R3,     1                       ; 5EF6   0063
L_5EF7:
        PSHR    R5                              ; 5EF7   0275
        MVII    #$0007, R1                      ; 5EF8   02B9 0007
        CLRR    R4                              ; 5EFA   01E4
        MVII    #$0003, R5                      ; 5EFB   02BD 0003
L_5EFD:
        SDBD                                    ; 5EFD   0001
        MVII    #$5F21, R0                      ; 5EFE   02B8 0021 005F
        PSHR    R0                              ; 5F01   0270
        MVO     R4,     G_01C6                  ; 5F02   0244 01C6
        MVO     R4,     G_01C4                  ; 5F04   0244 01C4
        MVII    #$0001, R3                      ; 5F06   02BB 0001
        MVO     R3,     G_01C7                  ; 5F08   0243 01C7
        MVO     R5,     G_0167                  ; 5F0A   0245 0167
        MVO     R5,     G_01C5                  ; 5F0C   0245 01C5
        MVII    #$0014, R0                      ; 5F0E   02B8 0014
        MVO     R0,     G_01C8                  ; 5F10   0240 01C8
        MVO     R1,     G_01C3                  ; 5F12   0241 01C3
        MVO     R1,     G_0165                  ; 5F14   0241 0165
        MVI     G_0135, R0                      ; 5F16   0280 0135
        MVO     R0,     G_0166                  ; 5F18   0240 0166
        MVII    #$0003, R2                      ; 5F1A   02BA 0003
        MVO     R2,     G_0164                  ; 5F1C   0242 0164
        J       L_6003                          ; 5F1E   0004 0360 0003

        JSR     R5,     L_5CC3                  ; 5F21   0004 015C 00C3

        MVI     G_01C3, R1                      ; 5F24   0281 01C3
        INCR    R1                              ; 5F26   0009
        CMPI    #$0009, R1                      ; 5F27   0379 0009
        BLT     L_5F33                          ; 5F29   0205 0008

        CLRR    R1                              ; 5F2B   01C9
        MVI     G_01C5, R5                      ; 5F2C   0285 01C5
        INCR    R5                              ; 5F2E   000D
        ANDI    #$0003, R5                      ; 5F2F   03BD 0003
        MVO     R5,     G_01C5                  ; 5F31   0245 01C5
L_5F33:
        MVI     G_01C5, R5                      ; 5F33   0285 01C5
        MVI     G_01C4, R4                      ; 5F35   0284 01C4
        ADDI    #$0014, R4                      ; 5F37   02FC 0014
        CMPI    #$00F0, R4                      ; 5F39   037C 00F0
        BLT     L_5EFD                          ; 5F3B   0225 003F
        PULR    R7                              ; 5F3D   02B7

        DECLE   $0020,  $0018,  $004E,  $005F   ; 5F3E   0020 0018 004E 005F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0000   ; 5F46   0000 0000 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4E   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000           ; 5F52   0010 0000 0000
L_5F55:
        PSHR    R5                              ; 5F55   0275
        MVII    #$0009, R3                      ; 5F56   02BB 0009
        INCR    R2                              ; 5F58   000A
        ADDR    R7,     R2                      ; 5F59   00FA
        ADD@    R2,     R7                      ; 5F5A   02D7

        DECLE   $0004                           ; 5F5B   0004

        ADCR    R0                              ; 5F5C   0028
        RLC     R3,     2                       ; 5F5D   0057
        SARC    R3,     1                       ; 5F5E   007B
        MVI     G_0160, R1                      ; 5F5F   0281 0160
        INCR    R1                              ; 5F61   0009
        CMPR    R3,     R1                      ; 5F62   0159
        BLT     L_5F6D                          ; 5F63   0205 0008

        CLRR    R1                              ; 5F65   01C9
        MVI     G_015E, R0                      ; 5F66   0280 015E
        INCR    R0                              ; 5F68   0008
        AND     G_0135, R0                      ; 5F69   0380 0135
        MVO     R0,     G_015E                  ; 5F6B   0240 015E
L_5F6D:
        MVO     R1,     G_0160                  ; 5F6D   0241 0160
        INCR    R1                              ; 5F6F   0009
        MVII    #$0001, R0                      ; 5F70   02B8 0001
L_5F72:
        INCR    R0                              ; 5F72   0008
        SUBR    R3,     R1                      ; 5F73   0119
        BGE     L_5F72                          ; 5F74   022D 0003

        ADDR    R3,     R1                      ; 5F76   00D9
        ADD     G_015E, R0                      ; 5F77   02C0 015E
        AND     G_0135, R0                      ; 5F79   0380 0135
        MVO     R0,     G_0166                  ; 5F7B   0240 0166
        MVII    #$0013, R0                      ; 5F7D   02B8 0013
        MVO     R0,     G_01C6                  ; 5F7F   0240 01C6
        B       L_5F9A                          ; 5F81   0200 0017

        MVI     G_0160, R1                      ; 5F83   0281 0160
        DECR    R1                              ; 5F85   0011
        BPL     L_5F91                          ; 5F86   0203 0009

        MVII    #$0008, R1                      ; 5F88   02B9 0008
        MVI     G_015E, R0                      ; 5F8A   0280 015E
        DECR    R0                              ; 5F8C   0010
        AND     G_0135, R0                      ; 5F8D   0380 0135
        MVO     R0,     G_015E                  ; 5F8F   0240 015E
L_5F91:
        MVO     R1,     G_0160                  ; 5F91   0241 0160
        MVI     G_015E, R0                      ; 5F93   0280 015E
        MVO     R0,     G_0166                  ; 5F95   0240 0166
        CLRR    R0                              ; 5F97   01C0
        MVO     R0,     G_01C6                  ; 5F98   0240 01C6
L_5F9A:
        MVI     G_015F, R0                      ; 5F9A   0280 015F
        MVO     R0,     G_0167                  ; 5F9C   0240 0167
        MVII    #$0014, R0                      ; 5F9E   02B8 0014
        MVO     R0,     G_01C7                  ; 5FA0   0240 01C7
        MVII    #$000C, R0                      ; 5FA2   02B8 000C
        MVO     R0,     G_01C8                  ; 5FA4   0240 01C8
        MVI     G_0161, R2                      ; 5FA6   0282 0161
        MVII    #$0003, R3                      ; 5FA8   02BB 0003
        MVO     R1,     G_0164                  ; 5FAA   0241 0164
        MVI     G_0161, R0                      ; 5FAC   0280 0161
        MVO     R0,     G_0165                  ; 5FAE   0240 0165
        B       L_6003                          ; 5FB0   0200 0051

        MVI     G_0161, R1                      ; 5FB2   0281 0161
        INCR    R1                              ; 5FB4   0009
        CMPR    R3,     R1                      ; 5FB5   0159
        BLT     L_5FC0                          ; 5FB6   0205 0008

        CLRR    R1                              ; 5FB8   01C9
        MVI     G_015F, R0                      ; 5FB9   0280 015F
        INCR    R0                              ; 5FBB   0008
        ANDI    #$0003, R0                      ; 5FBC   03B8 0003
        MVO     R0,     G_015F                  ; 5FBE   0240 015F
L_5FC0:
        MVO     R1,     G_0161                  ; 5FC0   0241 0161
        ADDI    #$0002, R1                      ; 5FC2   02F9 0002
        CLRR    R0                              ; 5FC4   01C0
L_5FC5:
        INCR    R0                              ; 5FC5   0008
        SUBR    R3,     R1                      ; 5FC6   0119
        BGE     L_5FC5                          ; 5FC7   022D 0003

        ADDR    R3,     R1                      ; 5FC9   00D9
        ADD     G_015F, R0                      ; 5FCA   02C0 015F
        ANDI    #$0003, R0                      ; 5FCC   03B8 0003
        MVO     R0,     G_0167                  ; 5FCE   0240 0167
        MVII    #$00DC, R0                      ; 5FD0   02B8 00DC
        MVO     R0,     G_01C6                  ; 5FD2   0240 01C6
        B       L_5FED                          ; 5FD4   0200 0017

        MVI     G_0161, R1                      ; 5FD6   0281 0161
        DECR    R1                              ; 5FD8   0011
        BPL     L_5FE4                          ; 5FD9   0203 0009

        MVII    #$0008, R1                      ; 5FDB   02B9 0008
        MVI     G_015F, R0                      ; 5FDD   0280 015F
        DECR    R0                              ; 5FDF   0010
        ANDI    #$0003, R0                      ; 5FE0   03B8 0003
        MVO     R0,     G_015F                  ; 5FE2   0240 015F
L_5FE4:
        MVO     R1,     G_0161                  ; 5FE4   0241 0161
        MVI     G_015F, R0                      ; 5FE6   0280 015F
        MVO     R0,     G_0167                  ; 5FE8   0240 0167
        CLRR    R0                              ; 5FEA   01C0
        MVO     R0,     G_01C6                  ; 5FEB   0240 01C6
L_5FED:
        MVI     G_015E, R0                      ; 5FED   0280 015E
        MVO     R0,     G_0166                  ; 5FEF   0240 0166
        MVII    #$0001, R0                      ; 5FF1   02B8 0001
        MVO     R0,     G_01C7                  ; 5FF3   0240 01C7
        MVII    #$0014, R0                      ; 5FF5   02B8 0014
        MVO     R0,     G_01C8                  ; 5FF7   0240 01C8
        MVI     G_0160, R2                      ; 5FF9   0282 0160
        MVII    #$0001, R3                      ; 5FFB   02BB 0001
        MVO     R1,     G_0165                  ; 5FFD   0241 0165
        MVI     G_0160, R0                      ; 5FFF   0280 0160
        MVO     R0,     G_0164                  ; 6001   0240 0164
L_6003:
        MVI     G_0166, R0                      ; 6003   0280 0166
        MVO     R0,     G_0162                  ; 6005   0240 0162
        MVI     G_0167, R0                      ; 6007   0280 0167
        MVO     R0,     G_0163                  ; 6009   0240 0163
        MVO     R3,     G_016A                  ; 600B   0243 016A
        MVII    #$0003, R5                      ; 600D   02BD 0003
        CLRR    R0                              ; 600F   01C0
L_6010:
        INCR    R0                              ; 6010   0008
        SUBR    R5,     R1                      ; 6011   0129
        BGE     L_6010                          ; 6012   022D 0003

        DECR    R0                              ; 6014   0010
        ADDR    R5,     R1                      ; 6015   00E9
        CMPI    #$0001, R3                      ; 6016   037B 0001
        BNEQ    L_6020                          ; 6018   020C 0006

        PSHR    R0                              ; 601A   0270
        SLL     R0,     1                       ; 601B   0048
        ADD@    R6,     R0                      ; 601C   02F0
        PSHR    R1                              ; 601D   0271
        SLL     R1,     1                       ; 601E   0049
        ADD@    R6,     R1                      ; 601F   02F1
L_6020:
        SLL     R3,     1                       ; 6020   004B
        ADDR    R3,     R0                      ; 6021   00D8
        ADDR    R3,     R1                      ; 6022   00D9
        MVO     R0,     G_0168                  ; 6023   0240 0168
        MVO     R1,     G_0169                  ; 6025   0241 0169
        MVII    #$0003, R5                      ; 6027   02BD 0003
        CLRR    R0                              ; 6029   01C0
L_602A:
        INCR    R0                              ; 602A   0008
        SUBR    R5,     R2                      ; 602B   012A
        BGE     L_602A                          ; 602C   022D 0003

        DECR    R0                              ; 602E   0010
        ADDR    R5,     R2                      ; 602F   00EA

        JSR     R5,     L_63F0                  ; 6030   0004 0160 03F0

        MVII    #$016B, R3                      ; 6033   02BB 016B
L_6035:
        TSTR    R0                              ; 6035   0080
        BEQ     L_603E                          ; 6036   0204 0006

        JSR     R5,     L_6256                  ; 6038   0004 0160 0256

        DECR    R0                              ; 603B   0010
        B       L_6035                          ; 603C   0220 0008

L_603E:
        SDBD                                    ; 603E   0001
        MVII    #$604B, R0                      ; 603F   02B8 004B 0060
        PSHR    R0                              ; 6042   0270
        PSHR    R0                              ; 6043   0270
        NOP                                     ; 6044   0034
        PSHR    R2                              ; 6045   0272
        PSHR    R3                              ; 6046   0273
        PSHR    R4                              ; 6047   0274
        J       L_63B5                          ; 6048   0004 0360 03B5

        MVII    #$016D, R3                      ; 604B   02BB 016D
L_604D:
        TSTR    R2                              ; 604D   0092
        BEQ     L_6056                          ; 604E   0204 0006

        JSR     R5,     L_6256                  ; 6050   0004 0160 0256

        DECR    R2                              ; 6053   0012
        B       L_604D                          ; 6054   0220 0008

L_6056:
        SDBD                                    ; 6056   0001
        MVII    #$605F, R0                      ; 6057   02B8 005F 0060
        PSHR    R0                              ; 605A   0270
        PSHR    R3                              ; 605B   0273
        J       L_638C                          ; 605C   0004 0360 038C

        MVI     G_01C8, R2                      ; 605F   0282 01C8
        MVI     G_01C7, R4                      ; 6061   0284 01C7
        MVI     G_01C6, R3                      ; 6063   0283 01C6
        ADDI    #$0200, R3                      ; 6065   02FB 0200
L_6067:
        SLL     R1,     2                       ; 6067   004D
        SLL     R1,     1                       ; 6068   0049
        MVI     G_01BE, R0                      ; 6069   0280 01BE
        SWAP    R0,     1                       ; 606B   0040
        XORR    R0,     R1                      ; 606C   01C1
        XOR     G_01BD, R1                      ; 606D   03C1 01BD
        MVO@    R1,     R3                      ; 606F   0259
        DECR    R2                              ; 6070   0012
        BEQ     L_6079                          ; 6071   0204 0006

        JSR     R5,     L_637E                  ; 6073   0004 0160 037E

        ADDR    R4,     R3                      ; 6076   00E3
        B       L_6067                          ; 6077   0220 0011
L_6079:
        PULR    R7                              ; 6079   02B7

L_607A:
        PSHR    R5                              ; 607A   0275

        JSR     R5,     L_5F55                  ; 607B   0004 015C 0355
        JSR     R5,     L_5CC4                  ; 607E   0004 015C 00C4

L_6081:
        PSHR    R5                              ; 6081   0275
        MVII    #$01DA, R4                      ; 6082   02BC 01DA
        MVII    #$01E3, R5                      ; 6084   02BD 01E3
L_6086:
        MVI@    R4,     R0                      ; 6086   02A0
        SWAP    R0,     1                       ; 6087   0040
        SAR     R0,     2                       ; 6088   006C
        SAR     R0,     2                       ; 6089   006C
        MVI     G_01E2, R3                      ; 608A   0283 01E2
        ANDI    #$0001, R3                      ; 608C   03BB 0001
        BNEQ    L_6091                          ; 608E   020C 0001

        SAR     R0,     1                       ; 6090   0068
L_6091:
        MVI     G_01E2, R3                      ; 6091   0283 01E2
        MVII    #$0004, R1                      ; 6093   02B9 0004
        CMPI    #$01DE, R4                      ; 6095   037C 01DE
        BNEQ    L_609A                          ; 6097   020C 0001

        SLL     R1,     2                       ; 6099   004D
L_609A:
        TSTR    R0                              ; 609A   0080
        BPL     L_609E                          ; 609B   0203 0001

        SAR     R1,     1                       ; 609D   0069
L_609E:
        ANDR    R1,     R3                      ; 609E   018B
        BEQ     L_60C1                          ; 609F   0204 0020

        MVII    #$0004, R3                      ; 60A1   02BB 0004
        SWAP    R3,     1                       ; 60A3   0043
        SDBD                                    ; 60A4   0001
        SUB@    R4,     R3                      ; 60A5   0323
        MOVR    R3,     R2                      ; 60A6   009A
        SUBR    R0,     R2                      ; 60A7   0102
        SUBI    #$0002, R4                      ; 60A8   033C 0002
        TSTR    R0                              ; 60AA   0080
        BPL     L_60AE                          ; 60AB   0203 0001

        NEGR    R2                              ; 60AD   0022
L_60AE:
        TSTR    R2                              ; 60AE   0092
        BGT     L_60C1                          ; 60AF   020E 0010

        MOVR    R3,     R2                      ; 60B1   009A
        XORR    R0,     R2                      ; 60B2   01C2
        BMI     L_60C1                          ; 60B3   020B 000C

        MOVR    R3,     R0                      ; 60B5   0098
        DECR    R4                              ; 60B6   0014
        CLRR    R2                              ; 60B7   01D2
        MVO@    R2,     R4                      ; 60B8   0262
        COMR    R1                              ; 60B9   0019
        AND     G_01E2, R1                      ; 60BA   0381 01E2
        MVO     R1,     G_01E2                  ; 60BC   0241 01E2
        DECR    R2                              ; 60BE   0012
        MVO     R2,     G_01D9                  ; 60BF   0242 01D9
L_60C1:
        MOVR    R4,     R3                      ; 60C1   00A3
        SDBD                                    ; 60C2   0001
        ADD@    R4,     R0                      ; 60C3   02E0
        MVO@    R0,     R3                      ; 60C4   0258
        SWAP    R0,     1                       ; 60C5   0040
        MOVR    R0,     R2                      ; 60C6   0082
        INCR    R3                              ; 60C7   000B
        SUB@    R3,     R0                      ; 60C8   0318
        MOVR    R2,     R1                      ; 60C9   0091
        ANDI    #$0007, R1                      ; 60CA   03B9 0007
        MVO@    R1,     R3                      ; 60CC   0259
        XORR    R1,     R2                      ; 60CD   01CA
        MVO@    R2,     R5                      ; 60CE   026A
        INCR    R5                              ; 60CF   000D
        MVO@    R2,     R5                      ; 60D0   026A
        ADDI    #$0003, R5                      ; 60D1   02FD 0003
        SUBR    R0,     R2                      ; 60D3   0102
        MVO@    R2,     R5                      ; 60D4   026A
        INCR    R5                              ; 60D5   000D
        MVO@    R2,     R5                      ; 60D6   026A
        SUBI    #$0006, R5                      ; 60D7   033D 0006
        CMPI    #$01E9, R5                      ; 60D9   037D 01E9
        BNEQ    L_6086                          ; 60DB   022C 0056

        MVII    #$0003, R5                      ; 60DD   02BD 0003
        MVO     R5,     G_01EF                  ; 60DF   0245 01EF
        MVII    #$0100, R5                      ; 60E1   02BD 0100
        MVI@    R5,     R0                      ; 60E3   02A8
        MVO@    R0,     R4                      ; 60E4   0260
        MVI@    R5,     R0                      ; 60E5   02A8
        MVO@    R0,     R4                      ; 60E6   0260
        MVII    #$000E, R0                      ; 60E7   02B8 000E
        MVII    #$0061, R1                      ; 60E9   02B9 0061
        MVO     R0,     .ISRVEC.0               ; 60EB   0240 0100
        MVO     R1,     .ISRVEC.1               ; 60ED   0241 0101
L_60EF:
        EIS                                     ; 60EF   0002
        MVI     G_01EF, R2                      ; 60F0   0282 01EF
        SARC    R2,     2                       ; 60F2   007E
        BNC     L_6108                          ; 60F3   0209 0013
        BOV     L_60EF                          ; 60F5   0222 0007

        JSR     R5,     L_607A                  ; 60F7   0004 0160 007A

        MVII    #$0003, R2                      ; 60FA   02BA 0003
        MVO     R2,     G_01EF                  ; 60FC   0242 01EF
        MVII    #$0042, R0                      ; 60FE   02B8 0042
        MVII    #$0061, R1                      ; 6100   02B9 0061
        MVO     R0,     .ISRVEC.0               ; 6102   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6104   0241 0101
        B       L_60EF                          ; 6106   0220 0018
L_6108:
        BNOV    L_610D                          ; 6108   020A 0003

        JSR     R5,     L_607A                  ; 610A   0004 0160 007A

L_610D:
        PULR    R7                              ; 610D   02B7

        PSHR    R5                              ; 610E   0275
        MVI     G_01E3, R4                      ; 610F   0284 01E3
        TSTR    R4                              ; 6111   00A4
        BEQ     L_6119                          ; 6112   0204 0005

        MVI     G_01E6, R4                      ; 6114   0284 01E6
        TSTR    R4                              ; 6116   00A4
        BNEQ    L_6137                          ; 6117   020C 001E

L_6119:
        JSR     R5,     L_6205                  ; 6119   0004 0160 0205

        MVI     G_01DC, R0                      ; 611C   0280 01DC
        MVO     R0,     .STIC.HDLY              ; 611E   0240 0030
        MVI     G_01DF, R0                      ; 6120   0280 01DF
        MVO     R0,     .STIC.VDLY              ; 6122   0240 0031

        JSR     R5,     L_6168                  ; 6124   0004 0160 0168

        CLRR    R2                              ; 6127   01D2
        SUBI    #$0008, R2                      ; 6128   033A 0008

        JSR     R5,     L_6174                  ; 612A   0004 0160 0174
        JSR     R5,     L_61A7                  ; 612D   0004 0160 01A7

        TSTR    R2                              ; 6130   0092
        BMI     L_614C                          ; 6131   020B 0019

        MVII    #$0002, R0                      ; 6133   02B8 0002
        B       L_614C                          ; 6135   0200 0015

L_6137:
        NEGR    R4                              ; 6137   0024

        JSR     R5,     L_6154                  ; 6138   0004 0160 0154
        JSR     R5,     L_6174                  ; 613B   0004 0160 0174

        MVII    #$0001, R0                      ; 613E   02B8 0001
        B       L_614C                          ; 6140   0200 000A

        PSHR    R5                              ; 6142   0275
        MOVR    R6,     R4                      ; 6143   00B4

        JSR     R5,     L_6154                  ; 6144   0004 0160 0154
        JSR     R5,     L_61A7                  ; 6147   0004 0160 01A7

        MVII    #$0002, R0                      ; 614A   02B8 0002
L_614C:
        SLL     R2,     2                       ; 614C   004E
        XORR    R0,     R2                      ; 614D   01C2
        MVO     R2,     G_01EF                  ; 614E   0242 01EF

        JSR     R5,     X_PLAY_NOTE             ; 6150   0004 0118 02BD

        PULR    R7                              ; 6153   02B7

L_6154:
        PSHR    R5                              ; 6154   0275
        PSHR    R4                              ; 6155   0274

        JSR     R5,     L_6205                  ; 6156   0004 0160 0205

        PULR    R4                              ; 6159   02B4
        TSTR    R4                              ; 615A   00A4
        BGT     L_6161                          ; 615B   020E 0004

        MVI     G_01DC, R0                      ; 615D   0280 01DC
        MVO     R0,     .STIC.HDLY              ; 615F   0240 0030
L_6161:
        BMI     L_6167                          ; 6161   020B 0004

        MVI     G_01DF, R0                      ; 6163   0280 01DF
        MVO     R0,     .STIC.VDLY              ; 6165   0240 0031
L_6167:
        INCR    R7                              ; 6167   000F

L_6168:
        PSHR    R5                              ; 6168   0275
L_6169:
        MVO     R0,     .STIC.VIDEN             ; 6169   0240 0020
        MVI     G_01E0, R0                      ; 616B   0280 01E0
        MVI     G_01E1, R1                      ; 616D   0281 01E1
        MVO     R0,     .ISRVEC.0               ; 616F   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6171   0241 0101
        PULR    R7                              ; 6173   02B7

L_6174:
        PSHR    R5                              ; 6174   0275
        MVI     G_01E3, R0                      ; 6175   0280 01E3
        SWAP    R0,     2                       ; 6177   0044
        BEQ     L_61A6                          ; 6178   0204 002C
        BPL     L_6190                          ; 617A   0203 0014

        MVII    #$0200, R5                      ; 617C   02BD 0200
        MVII    #$0201, R4                      ; 617E   02BC 0201
        CLRR    R2                              ; 6180   01D2
L_6181:
        MVII    #$0013, R3                      ; 6181   02BB 0013
L_6183:
        MVI@    R4,     R0                      ; 6183   02A0
        MVO@    R0,     R5                      ; 6184   0268
        DECR    R3                              ; 6185   0013
        BNEQ    L_6183                          ; 6186   022C 0004

        MVO@    R2,     R5                      ; 6188   026A
        INCR    R4                              ; 6189   000C
        CMPI    #$02E6, R4                      ; 618A   037C 02E6
        BLT     L_6181                          ; 618C   0225 000C
        B       L_61A6                          ; 618E   0200 0016

L_6190:
        MVII    #$0212, R5                      ; 6190   02BD 0212
        MVII    #$0003, R1                      ; 6192   02B9 0003
        CLRR    R2                              ; 6194   01D2
L_6195:
        MVII    #$0013, R3                      ; 6195   02BB 0013
L_6197:
        MVI@    R5,     R0                      ; 6197   02A8
        MVO@    R0,     R5                      ; 6198   0268
        SUBR    R1,     R5                      ; 6199   010D
        DECR    R3                              ; 619A   0013
        BNEQ    L_6197                          ; 619B   022C 0005

        INCR    R5                              ; 619D   000D
        MVO@    R2,     R5                      ; 619E   026A
        ADDI    #$0025, R5                      ; 619F   02FD 0025
        CMPI    #$02F0, R5                      ; 61A1   037D 02F0
        BLT     L_6195                          ; 61A3   0225 000F

        INCR    R2                              ; 61A5   000A
L_61A6:
        PULR    R7                              ; 61A6   02B7

L_61A7:
        PSHR    R5                              ; 61A7   0275
        MVI     G_01E6, R0                      ; 61A8   0280 01E6
        SWAP    R0,     2                       ; 61AA   0044
        BEQ     L_6204                          ; 61AB   0204 0057
        BMI     L_61F8                          ; 61AD   020B 0049

        MVII    #$02DC, R5                      ; 61AF   02BD 02DC
        MVII    #$0214, R4                      ; 61B1   02BC 0214
        MVII    #$0200, R2                      ; 61B3   02BA 0200
        MVII    #$0014, R1                      ; 61B5   02B9 0014
        MVII    #$000A, R0                      ; 61B7   02B8 000A
L_61B9:
        PSHR    R0                              ; 61B9   0270
        MVII    #$0004, R3                      ; 61BA   02BB 0004
L_61BC:
        MVI@    R4,     R0                      ; 61BC   02A0
        MVO@    R0,     R5                      ; 61BD   0268
        MVI@    R4,     R0                      ; 61BE   02A0
        MVO@    R0,     R5                      ; 61BF   0268
        MVI@    R4,     R0                      ; 61C0   02A0
        MVO@    R0,     R5                      ; 61C1   0268
        MVI@    R4,     R0                      ; 61C2   02A0
        MVO@    R0,     R5                      ; 61C3   0268
        MVI@    R4,     R0                      ; 61C4   02A0
        MVO@    R0,     R5                      ; 61C5   0268
        DECR    R3                              ; 61C6   0013
        BNEQ    L_61BC                          ; 61C7   022C 000C

        SUBR    R1,     R4                      ; 61C9   010C
        SUBR    R1,     R5                      ; 61CA   010D
        XORR    R2,     R5                      ; 61CB   01D5
        XORR    R5,     R2                      ; 61CC   01EA
        XORR    R2,     R5                      ; 61CD   01D5
        MVII    #$0004, R3                      ; 61CE   02BB 0004
L_61D0:
        MVI@    R5,     R0                      ; 61D0   02A8
        MVO@    R0,     R4                      ; 61D1   0260
        MVI@    R5,     R0                      ; 61D2   02A8
        MVO@    R0,     R4                      ; 61D3   0260
        MVI@    R5,     R0                      ; 61D4   02A8
        MVO@    R0,     R4                      ; 61D5   0260
        MVI@    R5,     R0                      ; 61D6   02A8
        MVO@    R0,     R4                      ; 61D7   0260
        MVI@    R5,     R0                      ; 61D8   02A8
        MVO@    R0,     R4                      ; 61D9   0260
        DECR    R3                              ; 61DA   0013
        BNEQ    L_61D0                          ; 61DB   022C 000C

        SUBR    R1,     R5                      ; 61DD   010D
        PULR    R0                              ; 61DE   02B0
        DECR    R0                              ; 61DF   0010
        BNEQ    L_61B9                          ; 61E0   022C 0028

        XORR    R2,     R5                      ; 61E2   01D5
        XORR    R5,     R2                      ; 61E3   01EA
        XORR    R2,     R5                      ; 61E4   01D5
        MVII    #$0004, R3                      ; 61E5   02BB 0004
L_61E7:
        MVI@    R5,     R0                      ; 61E7   02A8
        MVO@    R0,     R4                      ; 61E8   0260
        MVI@    R5,     R0                      ; 61E9   02A8
        MVO@    R0,     R4                      ; 61EA   0260
        MVI@    R5,     R0                      ; 61EB   02A8
        MVO@    R0,     R4                      ; 61EC   0260
        MVI@    R5,     R0                      ; 61ED   02A8
        MVO@    R0,     R4                      ; 61EE   0260
        MVI@    R5,     R0                      ; 61EF   02A8
        MVO@    R0,     R4                      ; 61F0   0260
        DECR    R3                              ; 61F1   0013
        BNEQ    L_61E7                          ; 61F2   022C 000C

        MVII    #$0003, R2                      ; 61F4   02BA 0003
        B       L_6204                          ; 61F6   0200 000C

L_61F8:
        MVII    #$0200, R5                      ; 61F8   02BD 0200
        MVII    #$0214, R4                      ; 61FA   02BC 0214
L_61FC:
        MVI@    R4,     R0                      ; 61FC   02A0
        MVO@    R0,     R5                      ; 61FD   0268
        CMPI    #$02DC, R5                      ; 61FE   037D 02DC
        BNEQ    L_61FC                          ; 6200   022C 0005

        MVII    #$0002, R2                      ; 6202   02BA 0002
L_6204:
        PULR    R7                              ; 6204   02B7

L_6205:
        PSHR    R5                              ; 6205   0275
        MVII    #$031D, R2                      ; 6206   02BA 031D
        CLRR    R3                              ; 6208   01DB
L_6209:
        MVII    #$01E9, R5                      ; 6209   02BD 01E9
        MVI@    R2,     R0                      ; 620B   0290
        ADDI    #$0002, R2                      ; 620C   02FA 0002
        SLL     R0,     1                       ; 620E   0048
        BPL     L_6213                          ; 620F   0203 0002

        MVII    #$01E3, R5                      ; 6211   02BD 01E3
L_6213:
        TSTR    R4                              ; 6213   00A4
        BLE     L_621A                          ; 6214   0206 0004

        ADDI    #$0003, R5                      ; 6216   02FD 0003
        B       L_6228                          ; 6218   0200 000E

L_621A:
        MVI@    R3,     R0                      ; 621A   0298
        MOVR    R0,     R1                      ; 621B   0081
        ANDI    #$00FF, R1                      ; 621C   03B9 00FF
        XORR    R1,     R0                      ; 621E   01C8
        ADD@    R5,     R1                      ; 621F   02E9
        ANDI    #$00FF, R1                      ; 6220   03B9 00FF
        XORR    R1,     R0                      ; 6222   01C8
        MVO@    R0,     R3                      ; 6223   0258
        MVI@    R2,     R0                      ; 6224   0290
        SDBD                                    ; 6225   0001
        ADD@    R5,     R0                      ; 6226   02E8
        MVO@    R0,     R2                      ; 6227   0250
L_6228:
        INCR    R2                              ; 6228   000A
        TSTR    R4                              ; 6229   00A4
        BMI     L_623E                          ; 622A   020B 0012

        XORI    #$0008, R3                      ; 622C   03FB 0008
        MVI@    R3,     R0                      ; 622E   0298
        MOVR    R0,     R1                      ; 622F   0081
        ANDI    #$007F, R1                      ; 6230   03B9 007F
        XORR    R1,     R0                      ; 6232   01C8
        ADD@    R5,     R1                      ; 6233   02E9
        ANDI    #$007F, R1                      ; 6234   03B9 007F
        XORR    R1,     R0                      ; 6236   01C8
        MVO@    R0,     R3                      ; 6237   0258
        XORI    #$0008, R3                      ; 6238   03FB 0008
        MVI@    R2,     R0                      ; 623A   0290
        SDBD                                    ; 623B   0001
        ADD@    R5,     R0                      ; 623C   02E8
        MVO@    R0,     R2                      ; 623D   0250
L_623E:
        ADDI    #$0005, R2                      ; 623E   02FA 0005
        INCR    R3                              ; 6240   000B
        CMPI    #$0008, R3                      ; 6241   037B 0008
        BNEQ    L_6209                          ; 6243   022C 003B
        PULR    R7                              ; 6245   02B7

L_6246:
        PSHR    R5                              ; 6246   0275
        PSHR    R4                              ; 6247   0274

        JSR     R5,     L_58EB                  ; 6248   0004 0158 00EB

        ANDI    #$0007, R1                      ; 624B   03B9 0007

        JSR     R5,     L_570F                  ; 624D   0004 0154 030F

        MVI@    R4,     R5                      ; 6250   02A5
        ANDI    #$00F0, R5                      ; 6251   03BD 00F0
        ADDR    R5,     R1                      ; 6253   00E9
        PULR    R4                              ; 6254   02B4
        PULR    R7                              ; 6255   02B7

L_6256:
        PSHR    R5                              ; 6256   0275
        MVII    #$00FF, R1                      ; 6257   02B9 00FF
        MVI@    R3,     R5                      ; 6259   029D
        MVO@    R1,     R3                      ; 625A   0259
        INCR    R3                              ; 625B   000B
        MVI@    R3,     R1                      ; 625C   0299
        MVO@    R5,     R3                      ; 625D   025D
        DECR    R3                              ; 625E   0013
        PULR    R7                              ; 625F   02B7

L_6260:
        PSHR    R5                              ; 6260   0275

        JSR     R5,     X_PLAY_SFX2             ; 6261   0004 0118 03BE
        DECLE   $0092                           ; 6264  SFX prio
        DECLE   $0079                           ; 6265  SFX data
        DECLE   $03ED                           ; 6266  SFX data
        DECLE   $000F,  $03FD                   ; 6267  SFX data
        DECLE   $02F5                           ; 6269  SFX data
        DECLE   $002E                           ; 626A  SFX data
        DECLE   $03EB                           ; 626B  SFX data
        DECLE   $03FE                           ; 626C  SFX data
        DECLE   $03EB                           ; 626D  SFX data
        DECLE   $000F,  $0000                   ; 626E  SFX data
        DECLE   $008F,  $003F                   ; 6270  SFX data
        DECLE   $02CF                           ; 6272  SFX end

L_6273:
        PSHR    R5                              ; 6273   0275

L_6274:
        JSR     R5,     X_PLAY_SFX2             ; 6274   0004 0118 03BE
        DECLE   $007D                           ; 6277  SFX prio
        DECLE   $03F9                           ; 6278  SFX data
        DECLE   $000C,  $0060                   ; 6279  SFX data
        DECLE   $0000,  $0060                   ; 627B  SFX data
        DECLE   $006B                           ; 627D  SFX data
        DECLE   $03E9                           ; 627E  SFX data
        DECLE   $00B7                           ; 627F  SFX data
        DECLE   $000B                           ; 6280  SFX data
        DECLE   $00C3,  $03F4                   ; 6281  SFX data
        DECLE   $02CF                           ; 6283  SFX end

L_6284:
        PSHR    R5                              ; 6284   0275

        JSR     R5,     X_PLAY_SFX1             ; 6285   0004 0118 03BB
        DECLE   $03F9                           ; 6288  SFX data
        DECLE   $0050,  $0000                   ; 6289  SFX data
        DECLE   $000C,  $0040                   ; 628B  SFX data
        DECLE   $020B                           ; 628D  SFX data
        DECLE   $008F,  $0011                   ; 628E  SFX data
        DECLE   $02CF                           ; 6290  SFX end


        PSHR    R5                              ; 6291   0275

        JSR     R5,     X_PLAY_SFX2             ; 6292   0004 0118 03BE
        DECLE   $0069                           ; 6295  SFX prio
        DECLE   $0389                           ; 6296  SFX data
        DECLE   $0380,  $0018                   ; 6297  SFX data
        DECLE   $0388,  $0019                   ; 6299  SFX data
        DECLE   $0384,  $001A                   ; 629B  SFX data
        DECLE   $0011,  $03FF                   ; 629D  SFX data
        DECLE   $03FE                           ; 629F  SFX data
        DECLE   $00D7,  $0080                   ; 62A0  SFX data
        DECLE   $02CF                           ; 62A2  SFX end


        PSHR    R5                              ; 62A3   0275

        JSR     R5,     X_PLAY_SFX2             ; 62A4   0004 0118 03BE
        DECLE   $0067                           ; 62A7  SFX prio
        DECLE   $0379                           ; 62A8  SFX data
        DECLE   $01CD                           ; 62A9  SFX data
        DECLE   $000F,  $03FE                   ; 62AA  SFX data
        DECLE   $01C5                           ; 62AC  SFX data
        DECLE   $0042                           ; 62AD  SFX data
        DECLE   $01AB                           ; 62AE  SFX data
        DECLE   $03A2                           ; 62AF  SFX data
        DECLE   $000F,  $0004                   ; 62B0  SFX data
        DECLE   $01EB                           ; 62B2  SFX data
        DECLE   $02CF                           ; 62B3  SFX end


        PSHR    R5                              ; 62B4   0275

        JSR     R5,     X_PLAY_SFX2             ; 62B5   0004 0118 03BE
        DECLE   $006F                           ; 62B8  SFX prio
        DECLE   $0319                           ; 62B9  SFX data
        DECLE   $030D                           ; 62BA  SFX data
        DECLE   $0248,  $02F0                   ; 62BB  SFX data
        DECLE   $0244,  $0320                   ; 62BD  SFX data
        DECLE   $00C5                           ; 62BF  SFX data
        DECLE   $01DB                           ; 62C0  SFX data
        DECLE   $0001,  $0033                   ; 62C1  SFX data
        DECLE   $004E                           ; 62C3  SFX data
        DECLE   $031D                           ; 62C4  SFX data
        DECLE   $0077,  $00F1,  $0062           ; 62C5  SFX data
        DECLE   $002B                           ; 62C8  SFX data
        DECLE   $0319                           ; 62C9  SFX data
        DECLE   $0023,  $03E4                   ; 62CA  SFX data
        DECLE   $000F,  $03FD                   ; 62CC  SFX data
        DECLE   $03FE                           ; 62CE  SFX data
        DECLE   $0012                           ; 62CF  SFX data
        DECLE   $0001,  $0043                   ; 62D0  SFX data
        DECLE   $017B                           ; 62D2  SFX data
        DECLE   $0053,  $00A4                   ; 62D3  SFX data
        DECLE   $0077,  $00F1,  $0062           ; 62D5  SFX data
        DECLE   $002B                           ; 62D8  SFX data
        DECLE   $0319                           ; 62D9  SFX data
        DECLE   $0023,  $03E4                   ; 62DA  SFX data
        DECLE   $0379                           ; 62DC  SFX data
        DECLE   $000E                           ; 62DD  SFX data
        DECLE   $0117,  $0000                   ; 62DE  SFX data
        DECLE   $03E2                           ; 62E0  SFX data
        DECLE   $00D7,  $00C0                   ; 62E1  SFX data
        DECLE   $02CF                           ; 62E3  SFX end


        PSHR    R5                              ; 62E4   0275

        JSR     R5,     X_PLAY_SFX2             ; 62E5   0004 0118 03BE
        DECLE   $006B                           ; 62E8  SFX prio
        DECLE   $018D                           ; 62E9  SFX data
        DECLE   $000F,  $03FD                   ; 62EA  SFX data
        DECLE   $0185                           ; 62EC  SFX data
        DECLE   $0072                           ; 62ED  SFX data
        DECLE   $029D                           ; 62EE  SFX data
        DECLE   $0003,  $0392                   ; 62EF  SFX data
UC_62F1:
        MVII    #$0037, R0                      ; 62F1  SLIB UCALL target
        ADDI    #$0008, R3                      ; 62F3   02FB 0008
        MVO@    R0,     R3                      ; 62F5   0258
        PULR    R7                              ; 62F6   02B7

        PSHR    R5                              ; 62F7   0275

        JSR     R5,     X_PLAY_SFX2             ; 62F8   0004 0118 03BE
        DECLE   $0065                           ; 62FB  SFX prio

        SARC    R1,     1                       ; 62FC   0079
        XOR@    R5,     R5                      ; 62FD   03ED
        INCR    R7                              ; 62FE   000F

        DECLE   $03EF                           ; 62FF   03EF
L_6300:
        CMPR    R6,     R5                      ; 6300   0175
        RSWD    R6                              ; 6301   003E
        CMP@    R5,     R3                      ; 6302   036B
        INCR    R7                              ; 6303   000F

        CLRC                                    ; 6304   0006
L_6305:
        XOR@    R1,     R6                      ; 6305   03CE
        ANDR    R5,     R3                      ; 6306   01AB
        SUB@    R1,     R5                      ; 6307   030D
        PSHR    R5                              ; 6308   0275
        ADCR    R3                              ; 6309   002B
        ADD@    R1,     R7                      ; 630A   02CF

L_630B:
        PSHR    R5                              ; 630B   0275

        JSR     R5,     X_PLAY_SFX2             ; 630C   0004 0118 03BE
        DECLE   $0065                           ; 630F  SFX prio
        DECLE   $03E9,  $015D,  $0260,  $0000   ; 6310   03E9 015D 0260 0000
        DECLE   $0012,  $031D,  $0077,  $00F1   ; 6314   0012 031D 0077 00F1
        DECLE   $0062,  $002B,  $03E9,  $0023   ; 6318   0062 002B 03E9 0023
        DECLE   $03E4,  $0001                   ; 631C   03E4 0001

        SWAP    R0,     1                       ; 631E   0040
        XOR@    R6,     R2                      ; 631F   03F2
        MOVR    R6,     R3                      ; 6320   00B3
        CMPR    R0,     R0                      ; 6321   0140
        DIS                                     ; 6322   0003
        XOR@    R1,     R2                      ; 6323   03CA
        ADD@    R1,     R7                      ; 6324   02CF

L_6325:
        PSHR    R5                              ; 6325   0275

        JSR     R5,     X_PLAY_SFX2             ; 6326   0004 0118 03BE
        DECLE   $00FF                           ; 6329  SFX prio

        AND@    R1,     R1                      ; 632A   0389
        SLLC    R1,     2                       ; 632B   005D
        SLR     R0,     1                       ; 632C   0060
        B       L_6397                          ; 632D   0200 0068

        DECLE   $0208,  $0064,  $0210           ; 632F   0208 0064 0210

        XORI    #$03FF, R4                      ; 6332   03FC 03FF
        INCR    R3                              ; 6334   000B
        SUBR    R0,     R3                      ; 6335   0103
        XORI    #$0275, R2                      ; 6336   03FA 0275

        JSR     R5,     X_PLAY_SFX2             ; 6338   0004 0118 03BE
        DECLE   $0092                           ; 633B  SFX prio
        DECLE   $03E9,  $0340,  $0080,  $0001   ; 633C   03E9 0340 0080 0001

        SWAP    R0,     1                       ; 6340   0040
        XOR@    R4,     R2                      ; 6341   03E2
        MOVR    R1,     R7                      ; 6342   008F
L_6343:
        DECR    R7                              ; 6343   0017
        ADD@    R1,     R7                      ; 6344   02CF

L_6345:
        PSHR    R5                              ; 6345   0275

        JSR     R5,     X_PLAY_SFX2             ; 6346   0004 0118 03BE
        DECLE   $0092                           ; 6349  SFX prio
        DECLE   $0319,  $0248,  $0100,  $0244   ; 634A   0319 0248 0100 0244
        DECLE   $0100,  $0001,  $03C3,  $004E   ; 634E   0100 0001 03C3 004E
        DECLE   $015D,  $039D,  $0077,  $00F1   ; 6352   015D 039D 0077 00F1
        DECLE   $0062,  $002B,  $0319,  $0023   ; 6356   0062 002B 0319 0023
        DECLE   $03E4,  $000F,  $03FD,  $03FE   ; 635A   03E4 000F 03FD 03FE
        DECLE   $0001                           ; 635E   0001

        NEGR    R3                              ; 635F   0023
        DIS                                     ; 6360   0003
        XOR     .BTAB.CF,R6                     ; 6361   03C6 02CF
        PSHR    R5                              ; 6363   0275

L_6364:
        JSR     R5,     X_PLAY_SFX2             ; 6364   0004 0118 03BE
        DECLE   $0092                           ; 6367  SFX prio
        DECLE   $03C9,  $0040,  $0140,  $0048   ; 6368   03C9 0040 0140 0048
        DECLE   $0090,  $0001,  $03C0,  $0001   ; 636C   0090 0001 03C0 0001
        DECLE   $0012,  $000C,  $0074,  $020B   ; 6370   0012 000C 0074 020B
        DECLE   $012B,  $0001,  $0060,  $0001   ; 6374   012B 0001 0060 0001

        INCR    R6                              ; 6378   000E
        CMPR    R5,     R3                      ; 6379   016B
        INCR    R4                              ; 637A   000C
        MOVR    R4,     R0                      ; 637B   00A0
        CMPR    R5,     R3                      ; 637C   016B
        ADD@    R1,     R7                      ; 637D   02CF

L_637E:
        PSHR    R5                              ; 637E   0275
        PSHR    R3                              ; 637F   0273
        MVII    #$016D, R3                      ; 6380   02BB 016D

        JSR     R5,     L_6256                  ; 6382   0004 0160 0256

        CMPI    #$00FF, R1                      ; 6385   0379 00FF
        BNEQ    L_638C                          ; 6387   020C 0003

        JSR     R5,     L_63A2                  ; 6389   0004 0160 03A2

L_638C:
        MOVR    R1,     R3                      ; 638C   008B
        ANDI    #$000F, R1                      ; 638D   03B9 000F
        CMPI    #$0005, R1                      ; 638F   0379 0005
        BEQ     L_63A0                          ; 6391   0204 000D

        CMPI    #$0000, R1                      ; 6393   0379 0000
        BEQ     L_63A0                          ; 6395   0204 0009

L_6397:
        ANDI    #$0070, R3                      ; 6397   03BB 0070
        SLR     R3,     2                       ; 6399   0067
        SLR     R3,     2                       ; 639A   0067
        SDBD                                    ; 639B   0001
        ADDI    #$56B0, R3                      ; 639C   02FB 00B0 0056
        MVI@    R3,     R1                      ; 639F   0299
L_63A0:
        PULR    R3                              ; 63A0   02B3
        PULR    R7                              ; 63A1   02B7

L_63A2:
        PSHR    R5                              ; 63A2   0275
        PSHR    R3                              ; 63A3   0273
        MVII    #$016B, R3                      ; 63A4   02BB 016B

        JSR     R5,     L_6256                  ; 63A6   0004 0160 0256

        CMPI    #$00FF, R1                      ; 63A9   0379 00FF
        BNEQ    L_63B0                          ; 63AB   020C 0003

        JSR     R5,     L_63F0                  ; 63AD   0004 0160 03F0

L_63B0:
        PULR    R3                              ; 63B0   02B3
        PSHR    R0                              ; 63B1   0270
        PSHR    R2                              ; 63B2   0272
        PSHR    R3                              ; 63B3   0273
        PSHR    R4                              ; 63B4   0274
L_63B5:
        MVI     G_01BE, R2                      ; 63B5   0282 01BE
        ANDI    #$007F, R2                      ; 63B7   03BA 007F
        MOVR    R1,     R3                      ; 63B9   008B
        ANDI    #$0080, R3                      ; 63BA   03BB 0080
        BEQ     L_63C0                          ; 63BC   0204 0002

        XORI    #$0080, R2                      ; 63BE   03FA 0080
L_63C0:
        MVO     R2,     G_01BE                  ; 63C0   0242 01BE
        MVII    #$016D, R4                      ; 63C2   02BC 016D
        MVI     G_0169, R3                      ; 63C4   0283 0169
        MOVR    R1,     R2                      ; 63C6   008A
        ANDI    #$000F, R1                      ; 63C7   03B9 000F
        PSHR    R1                              ; 63C9   0271
        SLL     R1,     2                       ; 63CA   004D
        SLL     R1,     1                       ; 63CB   0049
        ADD@    R6,     R1                      ; 63CC   02F1
        SDBD                                    ; 63CD   0001
        ADDI    #$563D, R1                      ; 63CE   02F9 003D 0056
        MOVR    R1,     R0                      ; 63D1   0088

L_63D2:
        JSR     R5,     L_63E6                  ; 63D2   0004 0160 03E6

        MVO@    R1,     R4                      ; 63D5   0261
        SUB     G_016A, R3                      ; 63D6   0303 016A

        JSR     R5,     L_63E6                  ; 63D8   0004 0160 03E6

        MVO@    R1,     R4                      ; 63DB   0261
        SUB     G_016A, R3                      ; 63DC   0303 016A

        JSR     R5,     L_63E6                  ; 63DE   0004 0160 03E6

        PULR    R4                              ; 63E1   02B4
        PULR    R3                              ; 63E2   02B3
        PULR    R2                              ; 63E3   02B2
        PULR    R0                              ; 63E4   02B0
        PULR    R7                              ; 63E5   02B7

L_63E6:
        PSHR    R5                              ; 63E6   0275

        JSR     R5,     L_5913                  ; 63E7   0004 0158 0113

        ADDR    R0,     R1                      ; 63EA   00C1
        MVI@    R1,     R1                      ; 63EB   0289

        JSR     R5,     L_5828                  ; 63EC   0004 0158 0028

        PULR    R7                              ; 63EF   02B7

L_63F0:
        PSHR    R5                              ; 63F0   0275
        PSHR    R0                              ; 63F1   0270
        NOP                                     ; 63F2   0034
        PSHR    R2                              ; 63F3   0272
        PSHR    R3                              ; 63F4   0273
        PSHR    R4                              ; 63F5   0274
        MVI     G_0166, R0                      ; 63F6   0280 0166
        MVI     G_0167, R1                      ; 63F8   0281 0167
        MVII    #$0028, R2                      ; 63FA   02BA 0028

        JSR     R5,     L_648E                  ; 63FC   0004 0164 008E
        JSR     R5,     L_6492                  ; 63FF   0004 0164 0092
        JSR     R5,     L_649D                  ; 6402   0004 0164 009D

        BEQ     L_6409                          ; 6405   0204 0002

        MVII    #$002C, R2                      ; 6407   02BA 002C
L_6409:
        MVO     R2,     G_01BE                  ; 6409   0242 01BE
        MVI     G_0166, R0                      ; 640B   0280 0166
        MVI     G_0167, R2                      ; 640D   0282 0167

        JSR     R5,     L_6246                  ; 640F   0004 0160 0246

        MVI     G_016A, R5                      ; 6412   0285 016A
        CMPI    #$0003, R5                      ; 6414   037D 0003
        BEQ     L_641F                          ; 6416   0204 0007

        INCR    R0                              ; 6418   0008
        AND     G_0135, R0                      ; 6419   0380 0135
        MVO     R0,     G_0166                  ; 641B   0240 0166
        B       L_6424                          ; 641D   0200 0005

L_641F:
        INCR    R2                              ; 641F   000A
        ANDI    #$0003, R2                      ; 6420   03BA 0003
        MVO     R2,     G_0167                  ; 6422   0242 0167
L_6424:
        MVII    #$016B, R4                      ; 6424   02BC 016B
        MVI     G_0168, R3                      ; 6426   0283 0168
        MOVR    R1,     R2                      ; 6428   008A
        ANDI    #$000F, R1                      ; 6429   03B9 000F
        PSHR    R1                              ; 642B   0271
        SLL     R1,     2                       ; 642C   004D
        SLL     R1,     1                       ; 642D   0049
        ADD@    R6,     R1                      ; 642E   02F1
        SDBD                                    ; 642F   0001
        ADDI    #$55F5, R1                      ; 6430   02F9 00F5 0055
        MOVR    R1,     R0                      ; 6433   0088
        B       L_63D2                          ; 6434   0220 0063

        ADDI    #$0007, R1                      ; 6436   02F9 0007
        MVI@    R1,     R2                      ; 6438   028A
        SWAP    R2,     1                       ; 6439   0042
        SLR     R2,     2                       ; 643A   0066
        SLR     R2,     2                       ; 643B   0066
        ANDI    #$000E, R2                      ; 643C   03BA 000E
        SUBI    #$0006, R1                      ; 643E   0339 0006
        MVI@    R1,     R4                      ; 6440   028C
        DECR    R1                              ; 6441   0011
        SUBR    R2,     R4                      ; 6442   0114
        SDBD                                    ; 6443   0001
        MVI@    R4,     R7                      ; 6444   02A7

        DECLE   $0040,  $0018,  $0053,  $0064   ; 6445   0040 0018 0053 0064
        DECLE   $0000,  $0058,  $0000,  $0038   ; 6449   0000 0058 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 644D   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6451   0000 0000

        B       L_6455                          ; 6453   0200 0000

L_6455:
        MOVR    R7,     R5                      ; 6455   00BD
        SLLC    R0,     2                       ; 6456   005C

        JSRD    R4,     .EXEC.402               ; 6457   0004 0016 0002

        SLLC    R0,     2                       ; 645A   005C
        CMPR    R4,     R4                      ; 645B   0164
        PSHR    R5                              ; 645C   0275
        MVI     G_0326, R0                      ; 645D   0280 0326
        SDBD                                    ; 645F   0001
        CMPI    #$538E, R0                      ; 6460   0378 008E 0053
        BNEQ    L_648D                          ; 6463   020C 0028

        MVI     G_01CD, R5                      ; 6465   0285 01CD
        TSTR    R5                              ; 6467   00AD
        BNEQ    L_648D                          ; 6468   020C 0023

        JSR     R5,     L_5395                  ; 646A   0004 0150 0395

        MVII    #$0050, R0                      ; 646D   02B8 0050
        INCR    R7                              ; 646F   000F

L_6470:
        PSHR    R5                              ; 6470   0275
L_6471:
        MVI     G_016F, R1                      ; 6471   0281 016F
        ADDR    R0,     R1                      ; 6473   00C1
        CMPI    #$009F, R1                      ; 6474   0379 009F
        BGT     L_647D                          ; 6476   020E 0005

        MVO     R1,     G_016F                  ; 6478   0241 016F

        JSR     R5,     L_6364                  ; 647A   0004 0160 0364

L_647D:
        CLRR    R1                              ; 647D   01C9
        MVO     R1,     G_01CC                  ; 647E   0241 01CC
        MVO     R1,     G_0326                  ; 6480   0241 0326
        SDBD                                    ; 6482   0001
        MVII    #$1906, R0                      ; 6483   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6486   0240 035D
        MVII    #$031D, R1                      ; 6488   02B9 031D

        JSR     R5,     L_5E44                  ; 648A   0004 015C 0244

L_648D:
        PULR    R7                              ; 648D   02B7

L_648E:
        SLL     R1,     2                       ; 648E   004D
        SLL     R1,     1                       ; 648F   0049
        ADDR    R1,     R0                      ; 6490   00C8
        MOVR    R5,     R7                      ; 6491   00AF

L_6492:
        PSHR    R5                              ; 6492   0275
        MOVR    R0,     R1                      ; 6493   0081
        SLR     R1,     2                       ; 6494   0065
        SLR     R1,     1                       ; 6495   0061
        ADDI    #$01BF, R1                      ; 6496   02F9 01BF
        ANDI    #$0007, R0                      ; 6498   03B8 0007
        J       .EXEC.746                       ; 649A   0004 0314 0346

L_649D:
        PSHR    R5                              ; 649D   0275
        MVI@    R1,     R5                      ; 649E   028D
        ANDR    R0,     R5                      ; 649F   0185
        PULR    R7                              ; 64A0   02B7

L_64A1:
        PSHR    R5                              ; 64A1   0275
        MVI@    R1,     R5                      ; 64A2   028D
        COMR    R0                              ; 64A3   0018
        ANDR    R0,     R5                      ; 64A4   0185
        XORR    R0,     R5                      ; 64A5   01C5
        COMR    R5                              ; 64A6   001D
        MVO@    R5,     R1                      ; 64A7   024D
        PULR    R7                              ; 64A8   02B7

L_64A9:
        PSHR    R5                              ; 64A9   0275
        PSHR    R1                              ; 64AA   0271
        MOVR    R1,     R4                      ; 64AB   008C

        JSR     R5,     L_5812                  ; 64AC   0004 0158 0012

        ADDR    R2,     R1                      ; 64AF   00D1
        PSHR    R2                              ; 64B0   0272
        PSHR    R1                              ; 64B1   0271
        MVI@    R1,     R1                      ; 64B2   0289
        SDBD                                    ; 64B3   0001
        ANDI    #$8000, R1                      ; 64B4   03B9 0000 0080
        BEQ     L_64E4                          ; 64B7   0204 002B

        PULR    R1                              ; 64B9   02B1
        PSHR    R1                              ; 64BA   0271

        JSR     R5,     L_5E0F                  ; 64BB   0004 015C 020F

        MOVR    R1,     R5                      ; 64BE   008D
        MOVR    R2,     R1                      ; 64BF   0091
        MOVR    R5,     R2                      ; 64C0   00AA

        JSR     R5,     L_648E                  ; 64C1   0004 0164 008E
        JSR     R5,     L_6492                  ; 64C4   0004 0164 0092
        JSR     R5,     L_64A1                  ; 64C7   0004 0164 00A1

        MOVR    R3,     R1                      ; 64CA   0099
        SLL     R1,     2                       ; 64CB   004D
        PSHR    R1                              ; 64CC   0271
        SLL     R1,     2                       ; 64CD   004D
        ADD@    R6,     R1                      ; 64CE   02F1
        ADDR    R2,     R1                      ; 64CF   00D1
        NEGR    R1                              ; 64D0   0021
        ADD@    R6,     R1                      ; 64D1   02F1
        MVII    #$0009, R2                      ; 64D2   02BA 0009
L_64D4:
        MVII    #$0009, R3                      ; 64D4   02BB 0009

L_64D6:
        JSR     R5,     L_652A                  ; 64D6   0004 0164 012A

        INCR    R1                              ; 64D9   0009
        DECR    R3                              ; 64DA   0013
        BNEQ    L_64D6                          ; 64DB   022C 0006

        ADDI    #$000B, R1                      ; 64DD   02F9 000B
        DECR    R2                              ; 64DF   0012
        BNEQ    L_64D4                          ; 64E0   022C 000D
        B       L_64E5                          ; 64E2   0200 0001

L_64E4:
        PULR    R5                              ; 64E4   02B5
L_64E5:
        PULR    R2                              ; 64E5   02B2
        PULR    R1                              ; 64E6   02B1

        JSR     R5,     L_64FB                  ; 64E7   0004 0164 00FB

        PULR    R7                              ; 64EA   02B7

        DECLE   $000B,  $0006,  $000B,  $0005   ; 64EB   000B 0006 000B 0005
        DECLE   $000A,  $0005,  $0009,  $0005   ; 64EF   000A 0005 0009 0005

        INCR    R1                              ; 64F3   0009
        CLRC                                    ; 64F4   0006
        INCR    R1                              ; 64F5   0009
        SETC                                    ; 64F6   0007
        INCR    R2                              ; 64F7   000A
        SETC                                    ; 64F8   0007
        INCR    R3                              ; 64F9   000B
        SETC                                    ; 64FA   0007
L_64FB:
        PSHR    R5                              ; 64FB   0275
        DECR    R1                              ; 64FC   0011

        JSR     R5,     L_651F                  ; 64FD   0004 0164 011F

        INCR    R1                              ; 6500   0009

        JSR     R5,     L_651F                  ; 6501   0004 0164 011F

        INCR    R1                              ; 6504   0009

        JSR     R5,     L_651F                  ; 6505   0004 0164 011F

        DECR    R1                              ; 6508   0011
        PSHR    R2                              ; 6509   0272
        PSHR    R1                              ; 650A   0271

        JSR     R5,     L_5812                  ; 650B   0004 0158 0012

        ADDR    R1,     R2                      ; 650E   00CA
        PULR    R1                              ; 650F   02B1
        DECR    R1                              ; 6510   0011

        JSR     R5,     L_651F                  ; 6511   0004 0164 011F

        INCR    R1                              ; 6514   0009

        JSR     R5,     L_651F                  ; 6515   0004 0164 011F

        INCR    R1                              ; 6518   0009

        JSR     R5,     L_651F                  ; 6519   0004 0164 011F

        DECR    R1                              ; 651C   0011
        PULR    R2                              ; 651D   02B2
        PULR    R7                              ; 651E   02B7

L_651F:
        PSHR    R5                              ; 651F   0275
        PSHR    R1                              ; 6520   0271

        JSR     R5,     L_5812                  ; 6521   0004 0158 0012

        ADDR    R2,     R1                      ; 6524   00D1

        JSR     R5,     L_652A                  ; 6525   0004 0164 012A

        PULR    R1                              ; 6528   02B1
        PULR    R7                              ; 6529   02B7

L_652A:
        PSHR    R5                              ; 652A   0275
        CMPI    #$0200, R1                      ; 652B   0379 0200
        BNC     L_6544                          ; 652D   0209 0015

        CMPI    #$02F0, R1                      ; 652F   0379 02F0
        BC      L_6544                          ; 6531   0201 0011

        MVI@    R1,     R5                      ; 6533   028D
        ANDI    #$01F8, R5                      ; 6534   03BD 01F8
        CMPI    #$0030, R5                      ; 6536   037D 0030
        MVI@    R1,     R5                      ; 6538   028D
        BC      L_6545                          ; 6539   0201 000A

        SDBD                                    ; 653B   0001
        ANDI    #$C9F8, R5                      ; 653C   03BD 00F8 00C9
        SDBD                                    ; 653F   0001
        XORI    #$2404, R5                      ; 6540   03FD 0004 0024
        MVO@    R5,     R1                      ; 6543   024D
L_6544:
        PULR    R7                              ; 6544   02B7

L_6545:
        PSHR    R2                              ; 6545   0272
        SDBD                                    ; 6546   0001
        ANDI    #$C9F8, R5                      ; 6547   03BD 00F8 00C9
        MOVR    R5,     R2                      ; 654A   00AA
        ANDI    #$01F8, R2                      ; 654B   03BA 01F8
        SLR     R2,     2                       ; 654D   0066
        SLR     R2,     1                       ; 654E   0062
        SDBD                                    ; 654F   0001
        ADDI    #$5B24, R2                      ; 6550   02FA 0024 005B
        XOR@    R2,     R5                      ; 6553   03D5
        SDBD                                    ; 6554   0001
        XORI    #$2400, R5                      ; 6555   03FD 0000 0024
        MVO@    R5,     R1                      ; 6558   024D
        PULR    R2                              ; 6559   02B2
        PULR    R7                              ; 655A   02B7

        MOVR    R0,     R4                      ; 655B   0084
        SLLC    R0,     2                       ; 655C   005C
        MOVR    R1,     R7                      ; 655D   008F

        DECLE   $0052,  $0000,  $0000,  $0000   ; 655E   0052 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $006D   ; 6562   0000 0000 0000 006D
        DECLE   $0065,  $0000,  $0000,  $0000   ; 6566   0065 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 656A   0000 0000 0000

        PSHR    R5                              ; 656D   0275

        JSR     R5,     L_5944                  ; 656E   0004 0158 0144

        BMI     L_660A                          ; 6571   020B 0097

        MOVR    R0,     R1                      ; 6573   0081

        JSR     R5,     L_5812                  ; 6574   0004 0158 0012

        ADD     G_01D3, R1                      ; 6577   02C1 01D3
        MOVR    R1,     R3                      ; 6579   008B
        MVII    #$0131, R5                      ; 657A   02BD 0131
        CMP@    R5,     R1                      ; 657C   0369
        BEQ     L_65F8                          ; 657D   0204 0079

        CMP@    R5,     R1                      ; 657F   0369
        BEQ     L_65F8                          ; 6580   0204 0076

        CMP@    R5,     R1                      ; 6582   0369
        BEQ     L_65F8                          ; 6583   0204 0073

        CMP@    R5,     R1                      ; 6585   0369
        BEQ     L_65F8                          ; 6586   0204 0070

        MVII    #$0014, R2                      ; 6588   02BA 0014

        JSR     R5,     X_DIV                   ; 658A   0004 011C 01FB

        TSTR    R0                              ; 658D   0080
        BEQ     L_6610                          ; 658E   0204 0080

        TSTR    R1                              ; 6590   0089
        BEQ     L_6610                          ; 6591   0204 007D

        CMPI    #$00EF, R3                      ; 6593   037B 00EF
        BGT     L_6610                          ; 6595   020E 0079

        ADDI    #$0200, R3                      ; 6597   02FB 0200
        MVI@    R3,     R0                      ; 6599   0298
        MOVR    R0,     R1                      ; 659A   0081
        ANDI    #$01F8, R0                      ; 659B   03B8 01F8
        SWAP    R1,     1                       ; 659D   0041
        ANDI    #$0036, R1                      ; 659E   03B9 0036
        CMPI    #$0098, R0                      ; 65A0   0378 0098
        BLT     L_65F8                          ; 65A2   0205 0054
        BEQ     L_65C8                          ; 65A4   0204 0022

        CMPI    #$00A8, R0                      ; 65A6   0378 00A8
        BLE     L_6610                          ; 65A8   0206 0066

        MVII    #$01D0, R2                      ; 65AA   02BA 01D0
        CMPI    #$00B8, R0                      ; 65AC   0378 00B8
        BLE     L_65BF                          ; 65AE   0206 000F

        INCR    R2                              ; 65B0   000A
        CMPI    #$00C8, R0                      ; 65B1   0378 00C8
        BLE     L_65BF                          ; 65B3   0206 000A

        MVII    #$01CF, R2                      ; 65B5   02BA 01CF
        CMPI    #$00F0, R0                      ; 65B7   0378 00F0
        BLE     L_65BF                          ; 65B9   0206 0004

        MVII    #$0004, R2                      ; 65BB   02BA 0004
        B       L_65DE                          ; 65BD   0200 001F

L_65BF:
        MVI@    R2,     R1                      ; 65BF   0291
        DECR    R1                              ; 65C0   0011
        BMI     L_6610                          ; 65C1   020B 004D

        MOVR    R2,     R5                      ; 65C3   0095
        SUBI    #$01C7, R5                      ; 65C4   033D 01C7
        B       L_65F9                          ; 65C6   0200 0031

L_65C8:
        CMPI    #$0016, R1                      ; 65C8   0379 0016
        BEQ     L_6610                          ; 65CA   0204 0044

        CLRR    R2                              ; 65CC   01D2
        MVO     R2,     G_0326                  ; 65CD   0242 0326
        CMPI    #$0010, R1                      ; 65CF   0379 0010
        BEQ     L_65DE                          ; 65D1   0204 000B

        INCR    R2                              ; 65D3   000A
        CMPI    #$0002, R1                      ; 65D4   0379 0002
        BEQ     L_65DE                          ; 65D6   0204 0006

        INCR    R2                              ; 65D8   000A
        CMPI    #$0004, R1                      ; 65D9   0379 0004
        BEQ     L_65DE                          ; 65DB   0204 0001

        INCR    R2                              ; 65DD   000A
L_65DE:
        MVO     R2,     G_01D5                  ; 65DE   0242 01D5
        CLRR    R2                              ; 65E0   01D2
        MVO     R2,     G_01CC                  ; 65E1   0242 01CC
        MVI     G_031D, R2                      ; 65E3   0282 031D
        MVII    #$0010, R1                      ; 65E5   02B9 0010
        SWAP    R1,     1                       ; 65E7   0041
        MOVR    R1,     R5                      ; 65E8   008D
        COMR    R5                              ; 65E9   001D
        ANDR    R5,     R2                      ; 65EA   01AA
        ADDR    R1,     R2                      ; 65EB   00CA
        MVO     R2,     G_031D                  ; 65EC   0242 031D
        MVII    #$001E, R2                      ; 65EE   02BA 001E
        MVO     R2,     G_0323                  ; 65F0   0242 0323
        SDBD                                    ; 65F2   0001
        MVII    #$1906, R2                      ; 65F3   02BA 0006 0019
        MVO     R2,     G_035D                  ; 65F6   0242 035D
L_65F8:
        CLRR    R5                              ; 65F8   01ED
L_65F9:
        MVO     R5,     G_01CE                  ; 65F9   0245 01CE
        MOVR    R3,     R1                      ; 65FB   0099
        MVO     R3,     G_01D3                  ; 65FC   0243 01D3
        MVO     R3,     G_015D                  ; 65FE   0243 015D

        JSR     R5,     L_5262                  ; 6600   0004 0150 0262

        MVO     R0,     G_031F                  ; 6603   0240 031F
        ADDI    #$0200, R1                      ; 6605   02F9 0200
        MVO     R1,     G_0320                  ; 6607   0241 0320
L_6609:
        PULR    R7                              ; 6609   02B7

L_660A:
        TSTR    R5                              ; 660A   00AD
        BNEQ    L_6609                          ; 660B   022C 0003
        J       L_585B                          ; 660D   0004 0358 005B

L_6610:
        JSR     R5,     L_6284                  ; 6610   0004 0160 0284

        PULR    R7                              ; 6613   02B7

L_6614:
        PSHR    R5                              ; 6614   0275
        MVII    #$00F0, R0                      ; 6615   02B8 00F0
        SDBD                                    ; 6617   0001
        MVII    #$0805, R1                      ; 6618   02B9 0005 0008
        MVII    #$0200, R4                      ; 661B   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 661D   0004 0114 0341

        SDBD                                    ; 6620   0001
        MVII    #$08FD, R0                      ; 6621   02B8 00FD 0008
        MVO     R0,     .BTAB.89                ; 6624   0240 0289
        ADDI    #$0008, R0                      ; 6626   02F8 0008
        MVO     R0,     .BTAB.8A                ; 6628   0240 028A
        SUBI    #$0070, R0                      ; 662A   0338 0070
        MVO     R0,     .BTAB.79                ; 662C   0240 0279

        JSR     R4,     L_67A1                  ; 662E   0004 0064 03A1
        DECLE   $0085,  $0067,  $00B5,  $0068   ; 6631   0085 0067 00B5 0068
        DECLE   $0000,  $00FC,  $0100,  $0038   ; 6635   0000 00FC 0100 0038
        DECLE   $0380,  $0001,  $03E0,  $0009   ; 6639   0380 0001 03E0 0009
        DECLE   $00F0,  $003C,  $0040,  $001C   ; 663D   00F0 003C 0040 001C
        DECLE   $0000,  $003C,  $0000,  $0048   ; 6641   0000 003C 0000 0048
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6645   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $02E0   ; 6649   0000 0000 0000 02E0
        DECLE   $0000,  $0240,  $0000,  $0300   ; 664D   0000 0240 0000 0300
        DECLE   $0300,  $0200                   ; 6651   0300 0200

        XOR     .STIC.X.7,R0                    ; 6653   03C0 0007
        XOR@    R5,     R0                      ; 6655   03E8
        INCR    R7                              ; 6656   000F

        AND@    R2,     R0                      ; 6657   0390
L_6658:
        SLL     R3,     2                       ; 6658   004F
        DECLE   $0280,  $0027,  $0000,  $0013   ; 6659   0280 0027 0000 0013
        DECLE   $0000,  $0300,  $0200,  $0380   ; 665D   0000 0300 0200 0380
        DECLE   $0000,  $0380,  $0000,  $03C0   ; 6661   0000 0380 0000 03C0
        DECLE   $0080,  $01F0,  $0080,  $00E3   ; 6665   0080 01F0 0080 00E3
        DECLE   $0320,  $0007,  $0000,  $0001   ; 6669   0320 0007 0000 0001
        DECLE   $0200,  $0041,  $0000,  $0023   ; 666D   0200 0041 0000 0023
        DECLE   $0000                           ; 6671   0000

        SETC                                    ; 6672   0007
        B       L_667C                          ; 6673   0200 0007

        DECLE   $0300,  $0003,  $0380,  $001F   ; 6675   0300 0003 0380 001F
        DECLE   $0300,  $0007,  $0000           ; 6679   0300 0007 0000
L_667C:
        DIS                                     ; 667C   0003
        DECLE   $0000,  $0000,  $0000,  $000E   ; 667D   0000 0000 0000 000E
        DECLE   $0000,  $0011,  $0000,  $0000   ; 6681   0000 0011 0000 0000

        B       L_6687                          ; 6685   0200 0000

L_6687:
        SUB     .STIC.X.1,R0                    ; 6687   0300 0001
        SUB     .STIC.X.3,R0                    ; 6689   0300 0003
        AND@    R3,     R0                      ; 668B   0398
        SETC                                    ; 668C   0007
        MVI     G_02F1, R1                      ; 668D   0281 02F1
        ANDI    #$0003, R1                      ; 668F   03B9 0003
        INCR    R1                              ; 6691   0009
        ADDR    R7,     R1                      ; 6692   00F9
        ADD@    R1,     R7                      ; 6693   02CF

        DECLE   $0004                           ; 6694   0004

        NEGR    R3                              ; 6695   0023
        SWAP    R0,     2                       ; 6696   0044
        SAR     R3,     1                       ; 6697   006B

        JSR     R4,     L_67D8                  ; 6698   0004 0064 03D8
        DECLE   $0001,  $02D0,  $0001,  $02D1   ; 669B   0001 02D0 0001 02D1
        DECLE   $0003,  $0282,  $02BC,  $02E5   ; 669F   0003 0282 02BC 02E5
        DECLE   $0003,  $026E,  $0295,  $02A8   ; 66A3   0003 026E 0295 02A8
        DECLE   $0003,  $026F,  $0296,  $02A9   ; 66A7   0003 026F 0296 02A9
        DECLE   $0003,  $0217,  $023F,  $0253   ; 66AB   0003 0217 023F 0253
        DECLE   $0001                           ; 66AF   0001

        ADD     .STIC.X.1,R7                    ; 66B0   02C7 0001
L_66B2:
        BMI     L_66B2                          ; 66B2   022B 0001

        ADD     .BTAB.00,R6                     ; 66B4   02C6 0200
        SAR     R2,     2                       ; 66B6   006E

        JSR     R4,     L_67D8                  ; 66B7   0004 0064 03D8
        DECLE   $0003,  $02B8,  $02CD,  $02E2   ; 66BA   0003 02B8 02CD 02E2
        DECLE   $0003,  $02B9,  $02CE,  $02E3   ; 66BE   0003 02B9 02CE 02E3
        DECLE   $0003,  $0226,  $0260,  $02A4   ; 66C2   0003 0226 0260 02A4
        DECLE   $0002,  $0239,  $024C,  $0002   ; 66C6   0002 0239 024C 0002
        DECLE   $023A,  $024D,  $0002,  $0222   ; 66CA   023A 024D 0002 0222
        DECLE   $0236,  $0002,  $02B3,  $02B2   ; 66CE   0236 0002 02B3 02B2
        DECLE   $0001,  $024A,  $0001           ; 66D2   0001 024A 0001

        PULR    R1                              ; 66D5   02B1
        B       L_6725                          ; 66D6   0200 004D

        JSR     R4,     L_67D8                  ; 66D8   0004 0064 03D8
        DECLE   $0002,  $027F,  $02A8,  $0002   ; 66DB   0002 027F 02A8 0002
        DECLE   $0280,  $02A9,  $0005,  $0268   ; 66DF   0280 02A9 0005 0268
        DECLE   $0241,  $026B,  $0294,  $02E3   ; 66E3   0241 026B 0294 02E3
        DECLE   $0005,  $021A,  $022D,  $0254   ; 66E7   0005 021A 022D 0254
        DECLE   $02BC,  $02CF,  $0005,  $021B   ; 66EB   02BC 02CF 0005 021B
        DECLE   $022E,  $0255,  $02BD,  $02D0   ; 66EF   022E 0255 02BD 02D0
        DECLE   $0002,  $021E,  $0246,  $0002   ; 66F3   0002 021E 0246 0002
        DECLE   $02B2,  $02B3,  $0001,  $0232   ; 66F7   02B2 02B3 0001 0232
        DECLE   $0001                           ; 66FB   0001

        PULR    R1                              ; 66FC   02B1
        B       L_6725                          ; 66FD   0200 0026

        JSR     R4,     L_67D8                  ; 66FF   0004 0064 03D8
        DECLE   $0006,  $022C,  $0241,  $0256   ; 6702   0006 022C 0241 0256
        DECLE   $0284,  $02AD,  $02D6,  $0006   ; 6706   0284 02AD 02D6 0006
        DECLE   $022D,  $0242                   ; 670A   022D 0242

        MVO@    R7,     R2                      ; 670C   0257
        MVI     .BTAB.AE,R5                     ; 670D   0285 02AE
        ADD@    R2,     R7                      ; 670F   02D7

        DECLE   $0006,  $0218,  $026B,  $0292   ; 6710   0006 0218 026B 0292
        DECLE   $0299,  $02C2,  $02EB,  $0001   ; 6714   0299 02C2 02EB 0001
        DECLE   $027E,  $0001,  $027F,  $0000   ; 6718   027E 0001 027F 0000
        DECLE   $0002,  $02C6,  $02C7,  $0001   ; 671C   0002 02C6 02C7 0001
        DECLE   $024A,  $0001,  $02C5,  $0200   ; 6720   024A 0001 02C5 0200
        DECLE   $0000                           ; 6724   0000
L_6725:
        JSR     R4,     L_67A1                  ; 6725   0004 0064 03A1
        DECLE   $0089,  $0067,  $009D,  $0008   ; 6728   0089 0067 009D 0008
        DECLE   $0100,  $0000,  $03C0,  $0043   ; 672C   0100 0000 03C0 0043
        DECLE   $00F0,  $01F6,  $0070,  $00FC   ; 6730   00F0 01F6 0070 00FC
        DECLE   $0318,  $0044,  $03B0,  $0060   ; 6734   0318 0044 03B0 0060
        DECLE   $00E0,  $0076,  $0070,  $00FC   ; 6738   00E0 0076 0070 00FC
        DECLE   $0038,  $0098,  $002C,  $0018   ; 673C   0038 0098 002C 0018
        DECLE   $0018,  $0030,  $0300,  $000C   ; 6740   0018 0030 0300 000C
        DECLE   $0180,  $0006,  $00C0,  $000B   ; 6744   0180 0006 00C0 000B
        DECLE   $0060,  $0039,  $0030,  $0078   ; 6748   0060 0039 0030 0078
        DECLE   $0018,  $0070,  $0018,  $0070   ; 674C   0018 0070 0018 0070
        DECLE   $00C8,  $0070,  $004C,  $0030   ; 6750   00C8 0070 004C 0030
        DECLE   $0204,  $0019,  $0336,  $000C   ; 6754   0204 0019 0336 000C
        DECLE   $003C,  $0000                   ; 6758   003C 0000

        ANDR    R3,     R4                      ; 675A   019C
        COMR    R0                              ; 675B   0018
        CMPR    R3,     R0                      ; 675C   0158
        INCR    R4                              ; 675D   000C
        AND@    R1,     R0                      ; 675E   0388
        INCR    R7                              ; 675F   000F

        CMP@    R5,     R0                      ; 6760   0368
L_6761:
        COMR    R4                              ; 6761   001C
        MVO@    R0,     R2                      ; 6762   0250
        RSWD    R4                              ; 6763   003C
        ADDR    R4,     R0                      ; 6764   00E0
        SARC    R0,     1                       ; 6765   0078
        ADDR    R6,     R0                      ; 6766   00F0
        RRC     R0,     1                       ; 6767   0070
L_6768:
        SARC    R0,     1                       ; 6768   0078
        SLR     R0,     1                       ; 6769   0060
        SLLC    R0,     1                       ; 676A   0058
        CLRR    R0                              ; 676B   01C0
        RSWD    R4                              ; 676C   003C
        TSTR    R0                              ; 676D   0080
        INCR    R4                              ; 676E   000C
        B       L_6768                          ; 676F   0220 0008

        DECLE   $03F0,  $0018,  $01C0,  $0030   ; 6771   03F0 0018 01C0 0030
        DECLE   $023E,  $0060,  $001F,  $0320   ; 6775   023E 0060 001F 0320
        DECLE   $0013,  $0080,  $0037,  $00E0   ; 6779   0013 0080 0037 00E0
        DECLE   $0066,  $0070,  $004A,  $0038   ; 677D   0066 0070 004A 0038
        DECLE   $0000,  $0018,  $0000           ; 6781   0000 0018 0000

        PULR    R7                              ; 6784   02B7

        MVO@    R0,     R2                      ; 6785   0250
        XORI    #$0008, R0                      ; 6786   03F8 0008
        PULR    R7                              ; 6788   02B7

        MVO     R0,     G_015D                  ; 6789   0240 015D
        MOVR    R0,     R4                      ; 678B   0084

        JSR     R5,     L_58EB                  ; 678C   0004 0158 00EB

        ANDI    #$000F, R1                      ; 678F   03B9 000F
        CMPI    #$0004, R1                      ; 6791   0379 0004
        BLT     L_679F                          ; 6793   0205 000A

        MVI@    R2,     R1                      ; 6795   0291
        SWAP    R1,     1                       ; 6796   0041
        ANDI    #$0040, R1                      ; 6797   03B9 0040
        BNEQ    L_679F                          ; 6799   020C 0004

        SDBD                                    ; 679B   0001
        ADDI    #$1600, R4                      ; 679C   02FC 0000 0016
L_679F:
        MVO@    R4,     R2                      ; 679F   0254
        PULR    R7                              ; 67A0   02B7

L_67A1:
        ADDI    #$005C, R4                      ; 67A1   02FC 005C
        PSHR    R4                              ; 67A3   0274
        SUBI    #$005C, R4                      ; 67A4   033C 005C
        MVI@    R4,     R0                      ; 67A6   02A0
        MVO     R0,     G_01C3                  ; 67A7   0240 01C3
        MVI@    R4,     R0                      ; 67A9   02A0
        MVO     R0,     G_01C4                  ; 67AA   0240 01C4
        SDBD                                    ; 67AC   0001
        MVI@    R4,     R0                      ; 67AD   02A0
        MVII    #$0016, R1                      ; 67AE   02B9 0016
        MVI     G_02F1, R2                      ; 67B0   0282 02F1
        ANDI    #$0003, R2                      ; 67B2   03BA 0003
L_67B4:
        BEQ     L_67BA                          ; 67B4   0204 0004

        ADDR    R1,     R4                      ; 67B6   00CC
        DECR    R2                              ; 67B7   0012
        B       L_67B4                          ; 67B8   0220 0005

L_67BA:
        MVII    #$0214, R2                      ; 67BA   02BA 0214
L_67BC:
        MVII    #$000A, R5                      ; 67BC   02BD 000A
        MVI@    R4,     R3                      ; 67BE   02A3
L_67BF:
        SARC    R3,     1                       ; 67BF   007B
        BNC     L_67D0                          ; 67C0   0209 000E

        PSHR    R1                              ; 67C2   0271
        PSHR    R4                              ; 67C3   0274
        PSHR    R5                              ; 67C4   0275
        MOVR    R7,     R5                      ; 67C5   00BD
        ADDI    #$0007, R5                      ; 67C6   02FD 0007
        PSHR    R5                              ; 67C8   0275
        MVII    #$01C3, R4                      ; 67C9   02BC 01C3
        SDBD                                    ; 67CB   0001
        MVI@    R4,     R7                      ; 67CC   02A7

        PULR    R5                              ; 67CD   02B5
        PULR    R4                              ; 67CE   02B4
        PULR    R1                              ; 67CF   02B1
L_67D0:
        INCR    R2                              ; 67D0   000A
        DECR    R5                              ; 67D1   0015
        BNEQ    L_67BF                          ; 67D2   022C 0014

        DECR    R1                              ; 67D4   0011
        BNEQ    L_67BC                          ; 67D5   022C 001A
        PULR    R7                              ; 67D7   02B7

L_67D8:
        MOVR    R7,     R5                      ; 67D8   00BD
        ADDI    #$0015, R5                      ; 67D9   02FD 0015
        SDBD                                    ; 67DB   0001
        MVII    #$0009, R3                      ; 67DC   02BB 0009 0000
L_67DF:
        SDBD                                    ; 67DF   0001
        MVI@    R5,     R0                      ; 67E0   02A8
        MVI@    R4,     R2                      ; 67E1   02A2
        TSTR    R2                              ; 67E2   0092
        BEQ     L_67EA                          ; 67E3   0204 0005

L_67E5:
        MVI@    R4,     R1                      ; 67E5   02A1
        MVO@    R0,     R1                      ; 67E6   0248
        DECR    R2                              ; 67E7   0012
        BNEQ    L_67E5                          ; 67E8   022C 0004

L_67EA:
        DECR    R3                              ; 67EA   0013
        BNEQ    L_67DF                          ; 67EB   022C 000D
        MOVR    R4,     R7                      ; 67ED   00A7

        ADDR    R5,     R5                      ; 67EE   00ED
        COMR    R2                              ; 67EF   001A
        ADDR    R6,     R5                      ; 67F0   00F5
        COMR    R2                              ; 67F1   001A
        ADDR    R4,     R5                      ; 67F2   00E5
        COMR    R2                              ; 67F3   001A
        ADDR    R2,     R5                      ; 67F4   00D5
        COMR    R2                              ; 67F5   001A
        ADDR    R3,     R5                      ; 67F6   00DD
        COMR    R2                              ; 67F7   001A
        MOVR    R4,     R5                      ; 67F8   00A5
        INCR    R0                              ; 67F9   0008
        TSTR    R5                              ; 67FA   00AD
        INCR    R0                              ; 67FB   0008
        ADDR    R0,     R5                      ; 67FC   00C5
        INCR    R0                              ; 67FD   0008
        ADDR    R1,     R5                      ; 67FE   00CD
        INCR    R0                              ; 67FF   0008
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6800   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6804   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6808   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 680C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6810   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6814   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6818   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 681C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6820   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6824   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6828   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 682C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6830   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6834   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6838   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 683C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6840   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6844   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6848   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 684C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6850   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6854   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6858   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 685C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6860   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6864   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6868   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 686C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6870   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6874   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6878   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 687C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6880   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6884   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6888   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 688C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6890   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6894   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6898   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 689C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68A0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68A4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68A8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68AC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68B0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68B4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68B8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68BC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68C0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68C4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68C8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68CC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68D0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68D4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 68D8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68DC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68E0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68E4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68E8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68EC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68F0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68F4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 68F8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68FC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6900   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6904   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6908   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 690C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6910   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6914   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6918   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 691C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6920   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6924   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6928   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 692C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6930   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6934   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6938   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 693C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6940   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6944   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6948   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 694C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6950   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6954   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6958   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 695C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6960   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6964   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6968   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 696C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6970   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6974   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6978   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 697C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6980   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6984   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6988   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 698C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6990   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6994   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6998   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 699C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69A0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69A4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 69A8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69AC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69B0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69B4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 69B8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69BC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69C0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69C4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 69C8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69CC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69D0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69D4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 69D8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69DC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69E0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69E4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 69E8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69EC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69F0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69F4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 69F8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69FC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A08   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A18   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A28   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6A38   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A40   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A44   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A48   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A4C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A50   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A54   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6A58   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A5C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A60   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A64   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6A68   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A6C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A70   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A74   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6A78   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A7C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A80   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A84   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A88   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A8C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A90   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A94   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6A98   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A9C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AA0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AA4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6AA8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AAC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AB0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AB4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6AB8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ABC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AC8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ACC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AD0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AD4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6AD8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ADC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6AE8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6AF8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AFC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B08   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B18   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B28   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B38   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B40   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B44   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B48   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FF7F,  $FF7F   ; 6B4C   FFFF FFFF FF7F FF7F
        DECLE   $FFFF,  $FF7F,  $FF7F,  $FF7F   ; 6B50   FFFF FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B54   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6B58   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B5C   FF7F FF7F FF7F FF7F
        DECLE   $FFFF,  $FF7F,  $FF7F,  $FF7F   ; 6B60   FFFF FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B64   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6B68   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B6C   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B70   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B74   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6B78   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B7C   FF7F FF7F FF7F FF7F
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B80   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B84   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6B88   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B8C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B90   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFBF,  $FFBF,  $FFBF   ; 6B94   FFFF FFBF FFBF FFBF
        DECLE   $FFFF,  $FFBF,  $FFBB,  $FFBB   ; 6B98   FFFF FFBF FFBB FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6B9C   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BA0   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BA4   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBB,  $FFBB   ; 6BA8   FFBF FFBF FFBB FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BAC   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BB0   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BB4   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBB,  $FFBB   ; 6BB8   FFBF FFBF FFBB FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BBC   FFBF FFBF FFBF FFBF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6BC8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BCC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BD0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BD4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6BD8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BDC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6BE8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6BF8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BFC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C08   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C18   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C28   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C38   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C40   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C44   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C48   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C4C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C50   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C54   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6C58   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C5C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C60   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C64   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6C68   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C6C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C70   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C74   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C78   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C7C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C80   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C84   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C88   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C8C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C90   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C94   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C98   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C9C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CA0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CA4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CA8   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CAC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CB0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CB4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CB8   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CBC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CC8   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CCC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CD0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CD4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6CD8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CDC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6CE8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6CF8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CFC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D08   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D18   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D28   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D38   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D40   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D44   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D48   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D4C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D50   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D54   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D58   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D5C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D60   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D64   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D68   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D6C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D70   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D74   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D78   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D7C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D80   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D84   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D88   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D8C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D90   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D94   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6D98   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D9C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DA0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DA4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DA8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DAC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DB0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DB4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DB8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DBC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DC8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DCC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DD0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DD4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DD8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DDC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DE8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6DF8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DFC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E08   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E18   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E28   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E38   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E40   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E44   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E48   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E4C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E50   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E54   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFDF,  $FFDB,  $FFDB   ; 6E58   FFFF FFDF FFDB FFDB
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6E5C   FFDF FFDF FFDF FFDF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E60   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E64   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E68   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E6C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E70   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E74   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6E78   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E7C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E80   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E84   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E88   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E8C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E90   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E94   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6E98   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E9C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EA0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EA4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EA8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EAC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EB0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EB4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EB8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EBC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EC8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ECC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFDF,  $FFDF   ; 6ED0   FFFF FFFF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6ED4   FFDF FFDF FFDF FFDF
        DECLE   $FFFF,  $FFDF,  $FFDF,  $FFDB   ; 6ED8   FFFF FFDF FFDF FFDB
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6EDC   FFDF FFDF FFDF FFDF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EE8   FFFF FFFF FFFF FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6EF8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EFC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F00   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F04   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6F08   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F0C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F10   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F14   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6F18   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F1C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F20   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F24   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6F28   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F2C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F30   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F34   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6F38   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F3C   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FF7F,  $FF7F,  $FF7F   ; 6F40   FFFF FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F44   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6F48   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F4C   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF5F,  $FF5F,  $FF5F   ; 6F50   FF7F FF5F FF5F FF5F
        DECLE   $FF5F,  $FF5F,  $FF5F,  $FF5F   ; 6F54   FF5F FF5F FF5F FF5F
        DECLE   $FF5F,  $FF5F,  $FF5B,  $FF5B   ; 6F58   FF5F FF5F FF5B FF5B
        DECLE   $FF5F,  $FF5F,  $FF5F,  $FF5F   ; 6F5C   FF5F FF5F FF5F FF5F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F60   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F64   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6F68   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F6C   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F70   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F74   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7B,  $FF7B   ; 6F78   FF7F FF7F FF7B FF7B
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F7C   FF7F FF7F FF7F FF7F
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F80   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F84   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBB,  $FFBF   ; 6F88   FFBF FFBF FFBB FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F8C   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F90   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F94   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FF9B,  $FF9B   ; 6F98   FFBF FFBF FF9B FF9B
        DECLE   $FF9F,  $FF9F,  $FF9F,  $FF9F   ; 6F9C   FF9F FF9F FF9F FF9F
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FA0   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FA4   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBB,  $FFBB   ; 6FA8   FFBF FFBF FFBB FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FAC   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FB0   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FB4   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBB,  $FFBB   ; 6FB8   FFBF FFBF FFBB FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FBC   FFBF FFBF FFBF FFBF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FC0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FC4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6FC8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FCC   FFFF FFFF FFFF FFFF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6FD0   FFDF FFDF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6FD4   FFDF FFDF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDB,  $FFDB   ; 6FD8   FFDF FFDF FFDB FFDB
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6FDC   FFDF FFDF FFDF FFDF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FE0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FE4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6FE8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FEC   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FF0   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FF4   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFB,  $FFFB   ; 6FF8   FFFF FFFF FFFB FFFB
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FFC   FFFF FFFF FFFF FFFF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5030       <entry>
;;  $503F       $503B  
;;  $5092       <entry>
;;  $50B0       <entry>
;;  $50CB       $50BA  
;;  $50D9       $50D4  
;;  $50E7       $50E0   $50E4  
;;  $50ED       $50DE  
;;  $5105       $50FB  
;;  $5110       $512B  
;;  $5126       $5116  
;;  $512D       $50B8  
;;  $5132       $5132  
;;  $513A       $50B5  
;;  $5182       $5155  
;;  $51B3       $515B  
;;  $51BF       $5159  
;;  $51D3       $51C8   $51CC  
;;  $51EA       $51EF  
;;  $5241       $5328   $56F4   $59AE  
;;  $525F       $524A   $524E  
;;  $5261       $5253   $5257  
;;  $5262       $51F1   $5DC5   $6600  
;;  $5269       $526B  
;;  $5276       $5DAC  
;;  $5279       $5281  
;;  $5284       $527B  
;;  $5286       $509B   $5182   $528C  
;;  $528E       $5288  
;;  $52D3       $5358  
;;  $52D9       $52D6  
;;  $52F2       $52ED  
;;  $52FD       $5293  
;;  $5308       $5304  
;;  $5322       $531E  
;;  $534F       $5333   $5343  
;;  $535A       $5337  
;;  $5395       $646A  
;;  $5396       $5311   $5350   $5B28  
;;  $53B8       $5298   $52A1   $53B0  
;;  $56B8       $50BF  
;;  $56BB       $56E0  
;;  $56D8       $56CA  
;;  $56DC       $56BE   $56D6  
;;  $56E8       $570C  
;;  $5707       $5704  
;;  $5708       $56EC   $56F0   $56F7  
;;  $570F       $5BE8   $624D  
;;  $572E       $50C8  
;;  $5736       $5731  
;;  $574A       $5794  
;;  $5762       $578B  
;;  $5774       $5770  
;;  $5777       $5760  
;;  $5778       $5733  
;;  $578D       $573F  
;;  $5796       $59B7   $5C4C  
;;  $57B2       $579E   $57A7  
;;  $57B4       $57B0  
;;  $57B5       $579B   $57A4   $57AD  
;;  $57DF       $57D8  
;;  $57E0       $57DB  
;;  $57F0       $57C2   $57DD  
;;  $57F2       $57C6   $57EB   $57EE  
;;  $57F3       $57F1  
;;  $57FE       $5798  
;;  $5803       $57A1  
;;  $5809       $5804  
;;  $580A       $57AA  
;;  $5810       $580B  
;;  $5812       $57B9   $57CF   $57E2   $64AC   $650B   $6521   $6574  
;;  $5828       $63EC  
;;  $5844       $52FD  
;;  $585A       $5849   $5854   $586D  
;;  $585B       $5845   $660D  
;;  $5863       $585E  
;;  $5864       $584B  
;;  $587F       $5871  
;;  $588A       $587D   $5888  
;;  $589F       $58B0  
;;  $58AE       $58A0   $58A6   $58A9  
;;  $58B2       $58AC  
;;  $58B4       $5B22  
;;  $58C0       $5884  
;;  $58C8       $5222  
;;  $58CE       $5E82  
;;  $58CF       $58CD  
;;  $58EA       $5894  
;;  $58EB       $511A   $6248   $678C  
;;  $5913       $63E7  
;;  $591F       $5918  
;;  $5927       $5922  
;;  $5931       $592A  
;;  $5944       $5290   $656E  
;;  $5974       $596D   $597C   $5981  
;;  $5975       $596F  
;;  $5991       $5AE7  
;;  $59A5       $5995  
;;  $59A7       $5AED  
;;  $59E8       $59B1  
;;  $59E9       $59BA  
;;  $59EE       $59E6  
;;  $59F9       $52F9   $59DE  
;;  $5A08       $5314  
;;  $5A12       $5ABC  
;;  $5A29       $5AC1  
;;  $5A3E       $5A3B  
;;  $5A43       $5A40  
;;  $5A4E       $5A59  
;;  $5A53       $5A49  
;;  $5A5B       $5A51   $5A54  
;;  $5A6D       $5A6A  
;;  $5A72       $5A6F  
;;  $5A78       $5A83  
;;  $5A7D       $5A73  
;;  $5A85       $5A7B   $5A7E  
;;  $5A8A       $5A8A  
;;  $5AB3       $5B16  
;;  $5AB6       $5398   $56D9  
;;  $5AC8       $5AC6  
;;  $5B0A       $5B04  
;;  $5B25       $5B1C  
;;  $5B48       $5B3E  
;;  $5B4D       $5AEB   $5AF7  
;;  $5B4E       $517C  
;;  $5B5A       $5BB4  
;;  $5B5C       $5B6B   $5B80  
;;  $5B6D       $5B68  
;;  $5B78       $5B85  
;;  $5B82       $5B7D  
;;  $5B87       $5B7A  
;;  $5B9B       $5B96  
;;  $5B9F       $5B92   $5B98  
;;  $5BB0       $5BAA  
;;  $5BB2       $5BA8   $5BAE  
;;  $5BD9       $5BA1   $5BC7   $5BD5  
;;  $5BF2       $5C0F  
;;  $5C0C       $5BFD  
;;  $5C11       $5BDF   $5BE2  
;;  $5C2F       $5C2F  
;;  $5C34       $50C2  
;;  $5C48       $5C40  
;;  $5C58       $5C55  
;;  $5C6C       $5C68  
;;  $5C83       $5C39   $5C46   $5C86  
;;  $5C90       $5C80  
;;  $5C98       $5C4F   $5C5A  
;;  $5C9A       $5CC0  
;;  $5C9B       $5C8B   $5C99  
;;  $5CA3       $5C9F  
;;  $5CA6       $5CA3  
;;  $5CAE       $5CAA  
;;  $5CB1       $5CAE  
;;  $5CC3       $5F21  
;;  $5CC4       $607E  
;;  $5CDE       $5CDA  
;;  $5CE4       $5CCB  
;;  $5CF5       $5CF1  
;;  $5CF9       $5CE2  
;;  $5D00       $5D05  
;;  $5D02       $5D7E   $5E0D  
;;  $5D1F       $5D0F  
;;  $5D23       $5D1F  
;;  $5D2D       $5D17   $5D1D   $5D25  
;;  $5D40       $5D30  
;;  $5D44       $5D40  
;;  $5D4E       $5D38   $5D3E   $5D46  
;;  $5D57       $5D53  
;;  $5D66       $5D62  
;;  $5D7B       $5D13   $5D1B   $5D27   $5D2B  
;;  $5D7C       $5D34   $5D3C   $5D48   $5D4C  
;;  $5D7D       $5D79  
;;  $5D80       $5CFE  
;;  $5D81       $5D76  
;;  $5D9D       $5D95  
;;  $5DAC       $5D88  
;;  $5DDD       $5DAF  
;;  $5DF8       $5DF4  
;;  $5E07       $5E03  
;;  $5E0F       $5897   $64BB  
;;  $5E22       $5E1D   $5E27   $5E2B  
;;  $5E2D       $5E23  
;;  $5E32       $5E36  
;;  $5E38       $5E33  
;;  $5E40       $5E3C  
;;  $5E44       $5B1F   $648A  
;;  $5E85       $5E80  
;;  $5E87       $5E77  
;;  $5E88       $50C5  
;;  $5E8B       $5ED4  
;;  $5E9D       $5E99  
;;  $5EC9       $5EBD  
;;  $5ED0       $5E93   $5EA8   $5EC5  
;;  $5EF7       $51A9  
;;  $5EFD       $5F3B  
;;  $5F33       $5F29  
;;  $5F55       $607B  
;;  $5F6D       $5F63  
;;  $5F72       $5F74  
;;  $5F91       $5F86  
;;  $5F9A       $5F81  
;;  $5FC0       $5FB6  
;;  $5FC5       $5FC7  
;;  $5FE4       $5FD9  
;;  $5FED       $5FD4  
;;  $6003       $5F1E   $5FB0  
;;  $6010       $6012  
;;  $6020       $6018  
;;  $602A       $602C  
;;  $6035       $603C  
;;  $603E       $6036  
;;  $604D       $6054  
;;  $6056       $604E  
;;  $6067       $6077  
;;  $6079       $6071  
;;  $607A       $60F7   $610A  
;;  $6081       $50BC   $50CB  
;;  $6086       $60DB  
;;  $6091       $608E  
;;  $609A       $6097  
;;  $609E       $609B  
;;  $60AE       $60AB  
;;  $60C1       $609F   $60AF   $60B3  
;;  $60EF       $60F5   $6106  
;;  $6108       $60F3  
;;  $610D       $6108  
;;  $6119       $6112  
;;  $6137       $6117  
;;  $614C       $6131   $6135   $6140  
;;  $6154       $6138   $6144  
;;  $6161       $615B  
;;  $6167       $6161  
;;  $6168       $6124  
;;  $6169       $6167  
;;  $6174       $612A   $613B  
;;  $6181       $618C  
;;  $6183       $6186  
;;  $6190       $617A  
;;  $6195       $61A3  
;;  $6197       $619B  
;;  $61A6       $6178   $618E  
;;  $61A7       $612D   $6147  
;;  $61B9       $61E0  
;;  $61BC       $61C7  
;;  $61D0       $61DB  
;;  $61E7       $61F2  
;;  $61F8       $61AD  
;;  $61FC       $6200  
;;  $6204       $61AB   $61F6  
;;  $6205       $6119   $6156  
;;  $6209       $6243  
;;  $6213       $620F  
;;  $621A       $6214  
;;  $6228       $6218  
;;  $623E       $622A  
;;  $6246       $640F  
;;  $6256       $6038   $6050   $6382   $63A6  
;;  $6260       $517F  
;;  $6273       $5860  
;;  $6274       $5986  
;;  $6284       $6610  
;;  $62F1       <entry>
;;  $6300       $62FE  
;;  $6305       $6303  
;;  $630B       $50D6  
;;  $6325       $58C8  
;;  $6343       $6343  
;;  $6345       $5B25  
;;  $6364       $647A  
;;  $637E       $6073  
;;  $638C       $605C   $6387  
;;  $6397       $632D  
;;  $63A0       $6391   $6395  
;;  $63A2       $6389  
;;  $63B0       $63AB  
;;  $63B5       $6048  
;;  $63C0       $63BC  
;;  $63D2       $6434  
;;  $63E6       $63D2   $63D8   $63DE  
;;  $63F0       $6030   $63AD  
;;  $6409       $6405  
;;  $641F       $6416  
;;  $6424       $641D  
;;  $6455       $6453  
;;  $6470       $5971  
;;  $6471       $646F  
;;  $647D       $6476  
;;  $648D       $6463   $6468  
;;  $648E       $63FC   $64C1  
;;  $6492       $63FF   $64C4  
;;  $649D       $6402  
;;  $64A1       $64C7  
;;  $64A9       $5C5C  
;;  $64D4       $64E0  
;;  $64D6       $64DB  
;;  $64E4       $64B7  
;;  $64E5       $64E2  
;;  $64FB       $64E7  
;;  $651F       $64FD   $6501   $6505   $6511   $6515   $6519  
;;  $652A       $64D6   $6525  
;;  $6544       $652D   $6531  
;;  $6545       $6539  
;;  $65BF       $65AE   $65B3   $65B9  
;;  $65C8       $65A4  
;;  $65DE       $65BD   $65D1   $65D6   $65DB  
;;  $65F8       $657D   $6580   $6583   $6586   $65A2  
;;  $65F9       $65C6  
;;  $6609       $660B  
;;  $660A       $6571  
;;  $6610       $658E   $6591   $6595   $65A8   $65C1   $65CA  
;;  $6614       $520B  
;;  $6658       $6656  
;;  $667C       $6673  
;;  $6687       $6685  
;;  $66B2       $66B2  
;;  $6725       $66D6   $66FD  
;;  $6761       $675F  
;;  $6768       $676F  
;;  $679F       $6793   $6799  
;;  $67A1       $662E   $6725  
;;  $67B4       $67B8  
;;  $67BA       $67B4  
;;  $67BC       $67D5  
;;  $67BF       $67D2  
;;  $67D0       $67C0  
;;  $67D8       $6698   $66B7   $66D8   $66FF  
;;  $67DF       $67EB  
;;  $67E5       $67E8  
;;  $67EA       $67E3  
;; ======================================================================== ;;
