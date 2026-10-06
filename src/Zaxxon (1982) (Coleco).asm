
        ORG     $5000
.HEADER:
        BIDECLE $6100           ; 5000  Ptr: MOB graphic images
        BIDECLE $5313           ; 5002  Ptr: EXEC timer table
        BIDECLE $506A           ; 5004  Ptr: Start of game
        BIDECLE $6380           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $63C0           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $00C2           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TITLE:
        DECLE   $0020                           ; 501C  Cartridge year
        DECLE   $0000                           ; 501D  

.TITLECODE:
        PSHR    R5                              ; 501E   0275

        JSR     R5,     L_5061                  ; 501F   0004 0150 0061

        MVII    #$0216, R4                      ; 5022   02BC 0216
        MVII    #$0007, R3                      ; 5024   02BB 0007

        JSRD    R5,     X_PRINT_R5              ; 5026   0004 011A 007B
        STRING  "COLECO PRESENTS"               ; 5029  
        DECLE   $0000                           ; 5038   0000

        MVII    #$026A, R4                      ; 5039   02BC 026A
        MVII    #$0007, R3                      ; 503B   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 503D   0004 0118 007B
        STRING  "ZAXXON"                        ; 5040  
        DECLE   $0000                           ; 5046   0000

        SDBD                                    ; 5047   0001
        MVII    #$08EF, R0                      ; 5048   02B8 00EF 0008
        MVO@    R0,     R4                      ; 504B   0260
        MVII    #$02B9, R4                      ; 504C   02BC 02B9
        MVII    #$0007, R3                      ; 504E   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5050   0004 0118 007B
        STRING  "BY SEGA"                       ; 5053  
        DECLE   $0000                           ; 505A   0000

        SDBD                                    ; 505B   0001
        MVII    #$08F7, R0                      ; 505C   02B8 00F7 0008
        MVO@    R0,     R4                      ; 505F   0260
        PULR    R7                              ; 5060   02B7

L_5061:
        PSHR    R5                              ; 5061   0275
        MVII    #$00F0, R0                      ; 5062   02B8 00F0
        MVII    #$0200, R4                      ; 5064   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5066   0004 0114 0338

        PULR    R7                              ; 5069   02B7

.START:
        PSHR    R5                              ; 506A   0275

L_506B:
        JSR     R5,     .EXEC.7B3               ; 506B   0004 0114 03B3

        MVII    #$0080, R0                      ; 506E   02B8 0080
        MVII    #$015D, R4                      ; 5070   02BC 015D

        JSR     R5,     X_FILL_ZERO             ; 5072   0004 0114 0338

        MVII    #$0080, R0                      ; 5075   02B8 0080
        MVO     R0,     G_0126                  ; 5077   0240 0126
        MVO     R0,     G_0128                  ; 5079   0240 0128
        MVII    #$0200, R1                      ; 507B   02B9 0200
        MOVR    R1,     R4                      ; 507D   008C
        MVII    #$00F0, R0                      ; 507E   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 5080   0004 0114 0341

        MVII    #$0215, R4                      ; 5083   02BC 0215
        MVII    #$0207, R3                      ; 5085   02BB 0207

        JSR     R5,     X_PRINT_R5              ; 5087   0004 0118 007B
        STRING  "PLAYERS 1 OR 2?"               ; 508A  
        DECLE   $0000                           ; 5099   0000

        SDBD                                    ; 509A   0001
        MVII    #$50A1, R0                      ; 509B   02B8 00A1 0050
        MVO     R0,     G_035D                  ; 509E   0240 035D
        PULR    R7                              ; 50A0   02B7

        DECLE   $0000,  $0000,  $00AB,  $0050   ; 50A1   0000 0000 00AB 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A5   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50A9   0000 0000

        PSHR    R5                              ; 50AB   0275
        DECR    R0                              ; 50AC   0010
        BMI     L_51C3                          ; 50AD   020B 0114

        CMPI    #$0001, R0                      ; 50AF   0378 0001
        BGT     L_51C3                          ; 50B1   020E 0110

        MVO     R0,     G_018D                  ; 50B3   0240 018D
        INCR    R0                              ; 50B5   0008
        MVII    #$0001, R1                      ; 50B6   02B9 0001
        MVII    #$0207, R3                      ; 50B8   02BB 0207
        MVII    #$023F, R4                      ; 50BA   02BC 023F

        JSR     R5,     X_PRNUM_LFT             ; 50BC   0004 0118 009E

        MVII    #$0207, R3                      ; 50BF   02BB 0207
        MVII    #$0265, R4                      ; 50C1   02BC 0265

        JSRE    R5,     X_PRINT_R5              ; 50C3   0004 0119 007B
        STRING  "SKILL 1 - 4?"                  ; 50C6  
        DECLE   $0000                           ; 50D2   0000

        SDBD                                    ; 50D3   0001
        MVII    #$50DA, R0                      ; 50D4   02B8 00DA 0050
        MVO     R0,     G_035D                  ; 50D7   0240 035D
        PULR    R7                              ; 50D9   02B7

        DECLE   $0000,  $0000,  $00E4,  $0050   ; 50DA   0000 0000 00E4 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50DE   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50E2   0000 0000

        PSHR    R5                              ; 50E4   0275
        DECR    R0                              ; 50E5   0010
        BMI     L_51C3                          ; 50E6   020B 00DB

        CMPI    #$0003, R0                      ; 50E8   0378 0003
        BGT     L_51C3                          ; 50EA   020E 00D7

        MVO     R0,     G_0193                  ; 50EC   0240 0193
        MVO     R0,     G_0198                  ; 50EE   0240 0198
        INCR    R0                              ; 50F0   0008
        MVII    #$0001, R1                      ; 50F1   02B9 0001
        MVII    #$0207, R3                      ; 50F3   02BB 0207
        MVII    #$028F, R4                      ; 50F5   02BC 028F

        JSR     R5,     X_PRNUM_LFT             ; 50F7   0004 0118 009E
        JSR     R5,     .EXEC.4C3               ; 50FA   0004 0114 00C3
        JSR     R5,     L_5113                  ; 50FD   0004 0150 0113
        DECLE   $0116                           ; 5100   0116

        MOVR    R2,     R0                      ; 5101   0090
        SUBR    R2,     R7                      ; 5102   0117

        DECLE   $0010,  $0118,  $0055,  $0119   ; 5103   0010 0118 0055 0119
        DECLE   $0036,  $0190,  $0005,  $0195   ; 5107   0036 0190 0005 0195
        DECLE   $0005,  $0317,  $0000,  $0318   ; 510B   0005 0317 0000 0318
        DECLE   $0000,  $0000                   ; 510F   0000 0000
L_5111:
        MVI@    R5,     R0                      ; 5111   02A8
        MVO@    R0,     R1                      ; 5112   0248
L_5113:
        MVI@    R5,     R1                      ; 5113   02A9
        TSTR    R1                              ; 5114   0089
        BNEQ    L_5111                          ; 5115   022C 0005

        MVII    #$00FF, R0                      ; 5117   02B8 00FF

        JSR     R5,     X_RAND2                 ; 5119   0004 0114 029E

        INCR    R0                              ; 511C   0008
        MVO     R0,     G_017E                  ; 511D   0240 017E
        SDBD                                    ; 511F   0001
        MVII    #$6018, R0                      ; 5120   02B8 0018 0060
        MVO     R0,     G_035D                  ; 5123   0240 035D

        JSR     R5,     L_5061                  ; 5125   0004 0150 0061

L_5128:
        CLRR    R0                              ; 5128   01C0
        MVO     R0,     G_0184                  ; 5129   0240 0184
        MVO     R0,     G_018B                  ; 512B   0240 018B
        MVO     R0,     G_0185                  ; 512D   0240 0185

        JSR     R5,     .EXEC.7B3               ; 512F   0004 0114 03B3

        SDBD                                    ; 5132   0001
        MVII    #$0C28, R0                      ; 5133   02B8 0028 000C
        MVO     R0,     .BTAB.8C                ; 5136   0240 028C
        MVO     R0,     .BTAB.A0                ; 5138   0240 02A0
        MVO     R0,     .BTAB.B4                ; 513A   0240 02B4
        MVII    #$0002, R0                      ; 513C   02B8 0002
        SDBD                                    ; 513E   0001
        MVII    #$51C4, R1                      ; 513F   02B9 00C4 0051
        MVII    #$031D, R2                      ; 5142   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 5144   0004 0114 02B4
        JSR     R5,     L_5E00                  ; 5147   0004 015C 0200

        MVII    #$032D, R1                      ; 514A   02B9 032D
L_514C:
        PSHR    R1                              ; 514C   0271

        JSR     R5,     L_5CFA                  ; 514D   0004 015C 00FA

        PULR    R1                              ; 5150   02B1
        ADDI    #$0008, R1                      ; 5151   02F9 0008
        CMPI    #$035D, R1                      ; 5153   0379 035D
        BLT     L_514C                          ; 5155   0225 000A

        MVII    #$0048, R0                      ; 5157   02B8 0048
        MVO     R0,     G_018E                  ; 5159   0240 018E
        MVII    #$0133, R0                      ; 515B   02B8 0133
        MVO     R0,     .BTAB.E5                ; 515D   0240 02E5
        MVI     G_018A, R0                      ; 515F   0280 018A
        SARC    R0,     1                       ; 5161   0078
        BC      L_516C                          ; 5162   0201 0008

        MVII    #$0002, R0                      ; 5164   02B8 0002
        MVO     R0,     G_0192                  ; 5166   0240 0192
        MVII    #$0004, R0                      ; 5168   02B8 0004
        MVO     R0,     G_018A                  ; 516A   0240 018A
L_516C:
        CLRR    R1                              ; 516C   01C9
        MVI     G_0191, R0                      ; 516D   0280 0191
        TSTR    R0                              ; 516F   0080
        BEQ     L_517C                          ; 5170   0204 000A

        CMPI    #$0046, R0                      ; 5172   0378 0046
        BEQ     L_517C                          ; 5174   0204 0006

        CMPI    #$0048, R0                      ; 5176   0378 0048
        BEQ     L_517C                          ; 5178   0204 0002

        MVII    #$0010, R1                      ; 517A   02B9 0010
L_517C:
        MVII    #$0008, R0                      ; 517C   02B8 0008
        MVII    #$0175, R4                      ; 517E   02BC 0175
L_5180:
        MVO@    R1,     R4                      ; 5180   0261
        INCR    R1                              ; 5181   0009
        DECR    R0                              ; 5182   0010
        BNEQ    L_5180                          ; 5183   022C 0004

        MVII    #$0215, R3                      ; 5185   02BB 0215
        MVII    #$0175, R1                      ; 5187   02B9 0175

L_5189:
        JSR     R5,     L_56D2                  ; 5189   0004 0154 02D2

        CMPI    #$017D, R1                      ; 518C   0379 017D
        BLT     L_5189                          ; 518E   0225 0006

        MVI     G_018D, R1                      ; 5190   0281 018D
        TSTR    R1                              ; 5192   0089
        BEQ     L_51B9                          ; 5193   0204 0024

        MVII    #$01AF, R1                      ; 5195   02B9 01AF
        MVO     R1,     .BTAB.02                ; 5197   0241 0202
        MVII    #$0187, R1                      ; 5199   02B9 0187
        MVO     R1,     .BTAB.03                ; 519B   0241 0203
        MVII    #$008F, R0                      ; 519D   02B8 008F
        MVII    #$0205, R2                      ; 519F   02BA 0205
        MVI     G_018F, R1                      ; 51A1   0281 018F
        TSTR    R1                              ; 51A3   0089
        BEQ     L_51AA                          ; 51A4   0204 0004

        MVII    #$0097, R0                      ; 51A6   02B8 0097
        MVII    #$020D, R2                      ; 51A8   02BA 020D
L_51AA:
        MVO     R0,     .BTAB.01                ; 51AA   0240 0201
        MVII    #$0006, R0                      ; 51AC   02B8 0006
        SDBD                                    ; 51AE   0001
        MVII    #$FFF9, R1                      ; 51AF   02B9 00F9 00FF
L_51B2:
        MVI@    R2,     R3                      ; 51B2   0293
        ANDR    R1,     R3                      ; 51B3   018B
        MVO@    R3,     R2                      ; 51B4   0253
        INCR    R2                              ; 51B5   000A
        DECR    R0                              ; 51B6   0010
        BNEQ    L_51B2                          ; 51B7   022C 0006

L_51B9:
        JSR     R5,     L_5F1A                  ; 51B9   0004 015C 031A
        JSR     R5,     L_5EDE                  ; 51BC   0004 015C 02DE

        CLRR    R0                              ; 51BF   01C0

        JSR     R5,     L_5F5A                  ; 51C0   0004 015C 035A

L_51C3:
        PULR    R7                              ; 51C3   02B7

        DECLE   $004A,  $00B8,  $00E4,  $0051   ; 51C4   004A 00B8 00E4 0051
        DECLE   $0000,  $0018,  $0000,  $0038   ; 51C8   0000 0018 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51D0   0000 0000 0000 0000
        DECLE   $0068,  $00B0,  $00F3,  $0051   ; 51D4   0068 00B0 00F3 0051
        DECLE   $0000,  $0018,  $0000,  $0058   ; 51D8   0000 0018 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E4   0000 0000 0000 0000
        DECLE   $0005,  $0000,  $0008,  $0102   ; 51E8   0005 0000 0008 0102
        DECLE   $0052,  $0102,  $0152,  $0302   ; 51EC   0052 0102 0152 0302
        DECLE   $0052,  $0302,  $0152,  $0000   ; 51F0   0052 0302 0152 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; 51F4   0000 0000 0000 0005
        DECLE   $0000,  $0000                   ; 51F8   0000 0000
L_51FA:
        CMPI    #$0004, R3                      ; 51FA   037B 0004
        BNEQ    L_51C3                          ; 51FC   022C 003A

        MVII    #$033D, R3                      ; 51FE   02BB 033D
        B       L_5219                          ; 5200   0200 0017

        PSHR    R5                              ; 5202   0275
        MVI     G_018B, R5                      ; 5203   0285 018B
        TSTR    R5                              ; 5205   00AD
        BNEQ    L_51FA                          ; 5206   022C 000D

        JSR     R5,     L_5C4B                  ; 5208   0004 015C 004B

        BNEQ    L_51C3                          ; 520B   022C 0049

        CMPI    #$0007, R2                      ; 520D   037A 0007
        BEQ     L_5219                          ; 520F   0204 0008

        SLR     R2,     2                       ; 5211   0066
        SLR     R2,     1                       ; 5212   0062
        BEQ     L_51C3                          ; 5213   0224 0051

        MOVR    R2,     R0                      ; 5215   0090

        JSR     R5,     L_5F5A                  ; 5216   0004 015C 035A
L_5219:
        JSR     R5,     L_5E3B                  ; 5219   0004 015C 023B
        JSR     R5,     L_5C9C                  ; 521C   0004 015C 009C

L_521F:
        MVII    #$031D, R4                      ; 521F   02BC 031D
        SDBD                                    ; 5221   0001
        MVII    #$B0CA, R0                      ; 5222   02B8 00CA 00B0
        MVO@    R0,     R4                      ; 5225   0260
        SDBD                                    ; 5226   0001
        MVII    #$525D, R0                      ; 5227   02B8 005D 0052
        MVO@    R0,     R4                      ; 522A   0260
        MVII    #$0322, R4                      ; 522B   02BC 0322
        MVII    #$0100, R0                      ; 522D   02B8 0100
        MVO@    R0,     R4                      ; 522F   0260
        MVII    #$000F, R0                      ; 5230   02B8 000F
        MVO@    R0,     R4                      ; 5232   0260
        CLRR    R0                              ; 5233   01C0
        MVO     R0,     G_0326                  ; 5234   0240 0326
        MVO     R0,     G_032E                  ; 5236   0240 032E
        MVO     R0,     G_0336                  ; 5238   0240 0336
        MVO     R0,     G_0356                  ; 523A   0240 0356

        JSR     R5,     L_5240                  ; 523C   0004 0150 0240

        PULR    R7                              ; 523F   02B7

L_5240:
        PSHR    R5                              ; 5240   0275

        JSR     R5,     X_PLAY_SFX2             ; 5241   0004 0118 03BE
        DECLE   $0090                           ; 5244  SFX prio
        DECLE   $0079                           ; 5245  SFX data
        DECLE   $03ED                           ; 5246  SFX data
        DECLE   $021D                           ; 5247  SFX data
        DECLE   $03F5                           ; 5248  SFX data
        DECLE   $03FE                           ; 5249  SFX data
        DECLE   $0057,  $0040                   ; 524A  SFX data
        DECLE   $0003,  $03E8                   ; 524C  SFX data
        DECLE   $008F,  $0028                   ; 524E  SFX data
        DECLE   $02CF                           ; 5250  SFX end


        PSHR    R5                              ; 5251   0275

        JSR     R5,     .EXEC.7AE               ; 5252   0004 0114 03AE

        SDBD                                    ; 5255   0001
        MVII    #$5323, R1                      ; 5256   02B9 0023 0053

        JSR     R5,     .EXEC.81E               ; 5259   0004 0118 001E

        PULR    R7                              ; 525C   02B7

        DECLE   $0000,  $0000,  $0051,  $0052   ; 525D   0000 0000 0051 0052
        DECLE   $0002,  $0042,  $0000           ; 5261   0002 0042 0000
L_5264:
        PSHR    R5                              ; 5264   0275
        MVI     G_0190, R0                      ; 5265   0280 0190
        DECR    R0                              ; 5267   0010
        MVO     R0,     G_0190                  ; 5268   0240 0190
        MVI     G_018D, R0                      ; 526A   0280 018D
        TSTR    R0                              ; 526C   0080
        BEQ     L_5289                          ; 526D   0204 001A

        MVI     G_0195, R0                      ; 526F   0280 0195
        TSTR    R0                              ; 5271   0080
        BEQ     L_5289                          ; 5272   0204 0015

        MVII    #$0190, R1                      ; 5274   02B9 0190
        MVII    #$0195, R2                      ; 5276   02BA 0195
        MVII    #$0005, R0                      ; 5278   02B8 0005
L_527A:
        MVI@    R1,     R3                      ; 527A   028B
        MVI@    R2,     R4                      ; 527B   0294
        MVO@    R3,     R2                      ; 527C   0253
        MVO@    R4,     R1                      ; 527D   024C
        INCR    R1                              ; 527E   0009
        INCR    R2                              ; 527F   000A
        DECR    R0                              ; 5280   0010
        BNEQ    L_527A                          ; 5281   022C 0008

        MVI     G_018F, R0                      ; 5283   0280 018F
        XORI    #$0001, R0                      ; 5285   03F8 0001
        MVO     R0,     G_018F                  ; 5287   0240 018F
L_5289:
        MVI     G_0190, R0                      ; 5289   0280 0190
        TSTR    R0                              ; 528B   0080
        BEQ     L_52AC                          ; 528C   0204 001E

        MVI     G_0191, R0                      ; 528E   0280 0191
        CMPI    #$0046, R0                      ; 5290   0378 0046
        BEQ     L_5128                          ; 5292   0224 016B

        SDBD                                    ; 5294   0001
        MVII    #$52A6, R4                      ; 5295   02BC 00A6 0052
L_5298:
        CMP@    R4,     R0                      ; 5298   0360
        BGT     L_5298                          ; 5299   022E 0002

        SUBI    #$0002, R4                      ; 529B   033C 0002
        MVI@    R4,     R0                      ; 529D   02A0
        MVO     R0,     G_0191                  ; 529E   0240 0191
        CLRR    R0                              ; 52A0   01C0
        MVO     R0,     G_0192                  ; 52A1   0240 0192
        B       L_5128                          ; 52A3   0220 017C

        DECLE   $0000,  $0026,  $0046,  $0060   ; 52A5   0000 0026 0046 0060
        DECLE   $007C,  $0098,  $03FF           ; 52A9   007C 0098 03FF
L_52AC:
        CLRR    R0                              ; 52AC   01C0
        MVO     R0,     G_031E                  ; 52AD   0240 031E
        MVO     R0,     G_0326                  ; 52AF   0240 0326
        MVO     R0,     .BTAB.01                ; 52B1   0240 0201
        MVO     R0,     .BTAB.02                ; 52B3   0240 0202
        MVO     R0,     .BTAB.03                ; 52B5   0240 0203
        MVO     R0,     G_035D                  ; 52B7   0240 035D
        MVO     R0,     G_018F                  ; 52B9   0240 018F

        JSR     R5,     L_5EDE                  ; 52BB   0004 015C 02DE

        CLRR    R0                              ; 52BE   01C0

        JSR     R5,     L_5F5A                  ; 52BF   0004 015C 035A

        MVI     G_018D, R0                      ; 52C2   0280 018D
        TSTR    R0                              ; 52C4   0080
        BEQ     L_52CD                          ; 52C5   0204 0006

        MVO     R0,     G_018F                  ; 52C7   0240 018F
        DECR    R0                              ; 52C9   0010

        JSR     R5,     L_5F5A                  ; 52CA   0004 015C 035A

L_52CD:
        MVI     G_0185, R1                      ; 52CD   0281 0185
        MOVR    R1,     R2                      ; 52CF   008A
        BEQ     L_52DE                          ; 52D0   0204 000C

        ANDI    #$0007, R2                      ; 52D2   03BA 0007
        SDBD                                    ; 52D4   0001
        ADDI    #$538F, R2                      ; 52D5   02FA 008F 0053
        MVI@    R2,     R3                      ; 52D8   0293
        MVII    #$0185, R1                      ; 52D9   02B9 0185

        JSR     R5,     L_56D2                  ; 52DB   0004 0154 02D2

L_52DE:
        CLRR    R0                              ; 52DE   01C0
        MVO     R0,     G_0186                  ; 52DF   0240 0186
        MVO     R0,     G_0185                  ; 52E1   0240 0185
        MVII    #$0269, R4                      ; 52E3   02BC 0269
        MVII    #$0007, R3                      ; 52E5   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 52E7   0004 0118 007B
        STRING  "GAME OVER"                     ; 52EA  
        DECLE   $0000                           ; 52F3   0000

        JSR     R5,     L_5E3B                  ; 52F4   0004 015C 023B

        SDBD                                    ; 52F7   0001
        MVII    #$5301, R0                      ; 52F8   02B8 0001 0053
        MVO     R0,     G_035D                  ; 52FB   0240 035D

        JSR     R5,     L_5FE7                  ; 52FD   0004 015C 03E7

        PULR    R7                              ; 5300   02B7

        DECLE   $0000,  $0000,  $000B,  $0053   ; 5301   0000 0000 000B 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5305   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5309   0000 0000

        PSHR    R5                              ; 530B   0275
        CMPI    #$000B, R0                      ; 530C   0378 000B
        BNEQ    L_51C3                          ; 530E   022C 014C
        J       L_506B                          ; 5310   0004 0350 006B

.TIMER:
        DECLE   $0045,  $0056,  $0001,  $0000; 5313  Timer dispatch/interval
        DECLE   $00F5,  $005E,  $000C,  $0000; 5317  Timer dispatch/interval
        DECLE   $002D,  $0053,  $0001,  $0000; 531B  Timer dispatch/interval
        DECLE   $00A4,  $005F,  $0002,  $0000; 531F  Timer dispatch/interval
        DECLE   $0064,  $0052,  $0028,  $0080; 5323  Timer dispatch/interval
        DECLE   $009F,  $005A,  $0001,  $0000; 5327  Timer dispatch/interval
        BIDECLE $0000           ; 532B  End of timer table

L_532D:
        PSHR    R5                              ; 532D   0275
        MVI     G_0193, R0                      ; 532E   0280 0193
        TSTR    R0                              ; 5330   0080
        BEQ     L_51C3                          ; 5331   0224 016F

        MVI     G_0185, R1                      ; 5333   0281 0185
        MOVR    R1,     R2                      ; 5335   008A
        BEQ     L_51C3                          ; 5336   0224 0174

        ANDI    #$0007, R2                      ; 5338   03BA 0007
        PSHR    R2                              ; 533A   0272

        JSR     R5,     L_5397                  ; 533B   0004 0150 0397

        PULR    R2                              ; 533E   02B2
        PSHR    R2                              ; 533F   0272
        SDBD                                    ; 5340   0001
        ADDI    #$538F, R2                      ; 5341   02FA 008F 0053
        MVI@    R2,     R3                      ; 5344   0293
        MVII    #$0185, R1                      ; 5345   02B9 0185

        JSR     R5,     L_56D2                  ; 5347   0004 0154 02D2

        SUBI    #$0015, R3                      ; 534A   033B 0015
        MVI     G_0186, R0                      ; 534C   0280 0186
        INCR    R0                              ; 534E   0008
        MVO     R0,     G_0186                  ; 534F   0240 0186
        SDBD                                    ; 5351   0001
        MVII    #$08D6, R4                      ; 5352   02BC 00D6 0008
        PULR    R5                              ; 5355   02B5
        PSHR    R5                              ; 5356   0275
        CMPI    #$0005, R5                      ; 5357   037D 0005
        BLT     L_5363                          ; 5359   0205 0008

        CMPI    #$0007, R5                      ; 535B   037D 0007
        BEQ     L_5361                          ; 535D   0204 0002

        SUBI    #$0014, R3                      ; 535F   033B 0014
L_5361:
        ADDI    #$0008, R4                      ; 5361   02FC 0008

L_5363:
        JSR     R5,     L_5377                  ; 5363   0004 0150 0377

        ADDI    #$0008, R4                      ; 5366   02FC 0008
        ADDI    #$0002, R3                      ; 5368   02FB 0002
        PULR    R5                              ; 536A   02B5
        CMPI    #$0005, R5                      ; 536B   037D 0005
        BEQ     L_5373                          ; 536D   0204 0004

        CMPI    #$0006, R5                      ; 536F   037D 0006
        BNEQ    L_51C3                          ; 5371   022C 01AF

L_5373:
        JSR     R5,     L_5377                  ; 5373   0004 0150 0377

        PULR    R7                              ; 5376   02B7

L_5377:
        MVI     G_0186, R0                      ; 5377   0280 0186
        MVII    #$0012, R1                      ; 5379   02B9 0012
L_537B:
        INCR    R0                              ; 537B   0008
        INCR    R3                              ; 537C   000B
        ANDI    #$0003, R0                      ; 537D   03B8 0003
        BNEQ    L_538B                          ; 537F   020C 000A

        MVI@    R3,     R2                      ; 5381   029A
        TSTR    R2                              ; 5382   0092
        BEQ     L_538B                          ; 5383   0204 0006

        SDBD                                    ; 5385   0001
        ANDI    #$F600, R2                      ; 5386   03BA 0000 00F6
        ADDR    R4,     R2                      ; 5389   00E2
        MVO@    R2,     R3                      ; 538A   025A
L_538B:
        DECR    R1                              ; 538B   0011
        BNEQ    L_537B                          ; 538C   022C 0012
        MOVR    R5,     R7                      ; 538E   00AF

        DECLE   $0215,  $0229,  $023D,  $0251   ; 538F   0215 0229 023D 0251
        DECLE   $0265,  $0279                   ; 5393   0265 0279

        MVI@    R4,     R1                      ; 5395   02A1
        ADD@    R1,     R1                      ; 5396   02C9
L_5397:
        PSHR    R5                              ; 5397   0275

        JSR     R5,     X_PLAY_SFX2             ; 5398   0004 0118 03BE
        DECLE   $0051                           ; 539B  SFX prio
        DECLE   $0240,  $0080                   ; 539C  SFX data
        DECLE   $0248,  $0100                   ; 539E  SFX data
        DECLE   $01C9                           ; 53A0  SFX data
        DECLE   $0001,  $03F0                   ; 53A1  SFX data
        DECLE   $0001,  $03F2                   ; 53A3  SFX data
        DECLE   $008F,  $0010                   ; 53A5  SFX data
        DECLE   $0001,  $0010                   ; 53A7  SFX data
        DECLE   $0001,  $0012                   ; 53A9  SFX data
        DECLE   $008F,  $0010                   ; 53AB  SFX data
        DECLE   $03CF                           ; 53AD  SFX end

L_53AE:
        CMPI    #$000A, R0                      ; 53AE   0378 000A
        BNEQ    L_5445                          ; 53B0   020C 0093

        DECR    R0                              ; 53B2   0010
        MVO     R0,     G_018B                  ; 53B3   0240 018B
        MVII    #$0003, R0                      ; 53B5   02B8 0003
        SDBD                                    ; 53B7   0001
        MVII    #$5589, R1                      ; 53B8   02B9 0089 0055
        MVII    #$0345, R2                      ; 53BB   02BA 0345

        JSR     R5,     X_INIT_MOBS             ; 53BD   0004 0114 02B4

        MVII    #$00C0, R0                      ; 53C0   02B8 00C0
        MVO     R0,     G_011A                  ; 53C2   0240 011A
        MVII    #$03FF, R0                      ; 53C4   02B8 03FF
        MVO     R0,     G_0184                  ; 53C6   0240 0184
        MVII    #$0038, R0                      ; 53C8   02B8 0038

        JSR     R5,     X_RAND2                 ; 53CA   0004 0114 029E

        ADDI    #$0038, R0                      ; 53CD   02F8 0038
        SWAP    R0,     1                       ; 53CF   0040
        MVO     R0,     G_0347                  ; 53D0   0240 0347
        MVII    #$0048, R0                      ; 53D2   02B8 0048

        JSR     R5,     X_RAND2                 ; 53D4   0004 0114 029E

        ADDI    #$0030, R0                      ; 53D7   02F8 0030
        SWAP    R0,     1                       ; 53D9   0040
        ADDI    #$0018, R0                      ; 53DA   02F8 0018
        MVII    #$0014, R3                      ; 53DC   02BB 0014
        B       L_54DE                          ; 53DE   0200 00FE

L_53E0:
        MVI     G_0183, R0                      ; 53E0   0280 0183
        DECR    R0                              ; 53E2   0010
        BMI     L_5403                          ; 53E3   020B 001E

        MVO     R0,     G_0183                  ; 53E5   0240 0183
        MVI     G_0348, R1                      ; 53E7   0281 0348
        RRC     R0,     1                       ; 53E9   0070
        BNC     L_53F0                          ; 53EA   0209 0004

        ADDI    #$0100, R1                      ; 53EC   02F9 0100
        B       L_53F2                          ; 53EE   0200 0002

L_53F0:
        SUBI    #$0100, R1                      ; 53F0   0339 0100
L_53F2:
        MVO     R1,     G_0348                  ; 53F2   0241 0348
        MVI     G_0347, R1                      ; 53F4   0281 0347
        MVI     G_0187, R0                      ; 53F6   0280 0187
        TSTR    R0                              ; 53F8   0080
        BNEQ    L_53FF                          ; 53F9   020C 0004

        ADDI    #$0100, R1                      ; 53FB   02F9 0100
        B       L_5401                          ; 53FD   0200 0002

L_53FF:
        SUBI    #$0100, R1                      ; 53FF   0339 0100
L_5401:
        MVO     R1,     G_0347                  ; 5401   0241 0347
L_5403:
        MVI     G_0347, R0                      ; 5403   0280 0347
        MVO     R0,     G_033F                  ; 5405   0240 033F
        MVI     G_0348, R0                      ; 5407   0280 0348
        MVO     R0,     G_0340                  ; 5409   0240 0340
L_540B:
        MVI     G_018B, R0                      ; 540B   0280 018B
        CMPI    #$0008, R0                      ; 540D   0378 0008
        BGT     L_5441                          ; 540F   020E 0030

        MVII    #$0002, R0                      ; 5411   02B8 0002
        MVII    #$032E, R4                      ; 5413   02BC 032E
L_5415:
        MVI@    R4,     R1                      ; 5415   02A1
        DECLE   $0001,  $0379,  $0038,  $005B   ; 5416   0001 0379 0038 005B
        DECLE   $020C,  $001E,  $02A1,  $0301   ; 541A   020C 001E 02A1 0301
        DECLE   $033F,  $0203,  $0001,  $0021   ; 541E   033F 0203 0001 0021
        DECLE   $0001                           ; 5422   0001

        CMPI    #$0000, R1                      ; 5423   0379 0000
        SETC                                    ; 5425   0007
        BGT     L_543B                          ; 5426   020E 0013

        MVI@    R4,     R1                      ; 5428   02A1
        SUB     G_0340, R1                      ; 5429   0301 0340
        BPL     L_542E                          ; 542B   0203 0001

        NEGR    R1                              ; 542D   0021
L_542E:
        SDBD                                    ; 542E   0001
        CMPI    #$0700, R1                      ; 542F   0379 0000 0007
        BGT     L_543C                          ; 5432   020E 0008

        MOVR    R4,     R1                      ; 5434   00A1
        SUBI    #$0004, R1                      ; 5435   0339 0004
        J       L_5B70                          ; 5437   0004 0358 0370

        INCR    R4                              ; 543A   000C
L_543B:
        INCR    R4                              ; 543B   000C
L_543C:
        ADDI    #$0005, R4                      ; 543C   02FC 0005
        DECR    R0                              ; 543E   0010
        BNEQ    L_5415                          ; 543F   022C 002B

L_5441:
        JSR     R5,     L_5E70                  ; 5441   0004 015C 0270

        PULR    R7                              ; 5444   02B7

L_5445:
        CMPI    #$0001, R0                      ; 5445   0378 0001
        BEQ     L_540B                          ; 5447   0224 003D

        JSR     R5,     L_54AB                  ; 5449   0004 0154 00AB

        MVI     G_0184, R0                      ; 544C   0280 0184
        DECR    R0                              ; 544E   0010
        BMI     L_5466                          ; 544F   020B 0015

        MVO     R0,     G_0184                  ; 5451   0240 0184
        BNEQ    L_53E0                          ; 5453   022C 0074

        MVII    #$033D, R2                      ; 5455   02BA 033D
        SDBD                                    ; 5457   0001
        MVII    #$548D, R1                      ; 5458   02B9 008D 0054

        JSR     R5,     X_INIT_MOB              ; 545B   0004 0114 02B2

        MVI     G_0347, R0                      ; 545E   0280 0347
        MVO     R0,     G_033F                  ; 5460   0240 033F
        MVI     G_0348, R0                      ; 5462   0280 0348
        MVO     R0,     G_0340                  ; 5464   0240 0340
L_5466:
        MVII    #$031D, R1                      ; 5466   02B9 031D

        JSR     R5,     .EXEC.777               ; 5468   0004 0114 0377

        SWAP    R2,     1                       ; 546B   0042
        ADDR    R3,     R2                      ; 546C   00DA
        MVII    #$033D, R1                      ; 546D   02B9 033D
        MVII    #$0010, R3                      ; 546F   02BB 0010

        JSR     R5,     .EXEC.9A8               ; 5471   0004 0118 01A8

        B       L_540B                          ; 5474   0220 006A

        DECLE   $004E,  $0098,  $0086,  $0054   ; 5476   004E 0098 0086 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 547A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 547E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5482   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5486   0000 0000 0000 0000
        DECLE   $0001,  $0049,  $0000,  $004E   ; 548A   0001 0049 0000 004E
        DECLE   $0018,  $009D,  $0054,  $0000   ; 548E   0018 009D 0054 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5492   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $00FF,  $0000   ; 5496   0000 00F0 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 549A   0000 0000 0000 0000
        DECLE   $0000,  $00FA,  $005C,  $0002   ; 549E   0000 00FA 005C 0002
        DECLE   $004B,  $0000,  $0000,  $0000   ; 54A2   004B 0000 0000 0000
        DECLE   $00CA,  $0054,  $0004,  $002E   ; 54A6   00CA 0054 0004 002E
        DECLE   $0000                           ; 54AA   0000
L_54AB:
        PSHR    R5                              ; 54AB   0275

        JSR     R5,     X_PLAY_SFX2             ; 54AC   0004 0118 03BE
        DECLE   $0060                           ; 54AF  SFX prio
        DECLE   $0040,  $0200                   ; 54B0  SFX data
        DECLE   $000C,  $0041                   ; 54B2  SFX data
        DECLE   $01C9                           ; 54B4  SFX data
        DECLE   $038B                           ; 54B5  SFX data
        DECLE   $008F,  $0010                   ; 54B6  SFX data
        DECLE   $03CF                           ; 54B8  SFX end

L_54B9:
        MVII    #$0003, R0                      ; 54B9   02B8 0003
        MVII    #$0346, R2                      ; 54BB   02BA 0346
L_54BD:
        MVO@    R4,     R2                      ; 54BD   0254
        ADDI    #$0004, R2                      ; 54BE   02FA 0004
        MVI@    R2,     R1                      ; 54C0   0291
        XORI    #$0001, R1                      ; 54C1   03F9 0001
        MVO@    R1,     R2                      ; 54C3   0251
        ADDI    #$0004, R2                      ; 54C4   02FA 0004
        DECR    R0                              ; 54C6   0010
        BNEQ    L_54BD                          ; 54C7   022C 000B
        MOVR    R5,     R7                      ; 54C9   00AF

        PSHR    R5                              ; 54CA   0275
        SDBD                                    ; 54CB   0001
        MVII    #$54E5, R4                      ; 54CC   02BC 00E5 0054

        JSR     R5,     L_54B9                  ; 54CF   0004 0154 00B9

        MVII    #$0058, R0                      ; 54D2   02B8 0058

        JSR     R5,     X_RAND2                 ; 54D4   0004 0114 029E

        ADDI    #$0028, R0                      ; 54D7   02F8 0028
        SWAP    R0,     1                       ; 54D9   0040
        ADDI    #$0020, R0                      ; 54DA   02F8 0020
        MVII    #$0018, R3                      ; 54DC   02BB 0018
L_54DE:
        MVII    #$0345, R1                      ; 54DE   02B9 0345
        MOVR    R0,     R2                      ; 54E0   0082

        JSR     R5,     .EXEC.9A8               ; 54E1   0004 0118 01A8

        PULR    R7                              ; 54E4   02B7

        DECLE   $0000,  $0000,  $0005,  $0055   ; 54E5   0000 0000 0005 0055
        DECLE   $0004,  $002E,  $0000           ; 54E9   0004 002E 0000
L_54EC:
        SDBD                                    ; 54EC   0001
        MVII    #$2080, R3                      ; 54ED   02BB 0080 0020
        MVII    #$0345, R2                      ; 54F0   02BA 0345
        MVII    #$0003, R0                      ; 54F2   02B8 0003
L_54F4:
        MVI@    R2,     R1                      ; 54F4   0291
        XORR    R3,     R1                      ; 54F5   01D9
        MVO@    R1,     R2                      ; 54F6   0251
        INCR    R2                              ; 54F7   000A
        MVO@    R4,     R2                      ; 54F8   0254
        ADDI    #$0004, R2                      ; 54F9   02FA 0004
        MVI@    R2,     R1                      ; 54FB   0291
        XORI    #$0001, R1                      ; 54FC   03F9 0001
        MVO@    R1,     R2                      ; 54FE   0251
        ADDI    #$0003, R2                      ; 54FF   02FA 0003
        DECR    R0                              ; 5501   0010
        BNEQ    L_54F4                          ; 5502   022C 000F
        MOVR    R5,     R7                      ; 5504   00AF

        PSHR    R5                              ; 5505   0275
        SDBD                                    ; 5506   0001
        MVII    #$551F, R4                      ; 5507   02BC 001F 0055

        JSR     R5,     L_54EC                  ; 550A   0004 0154 00EC

        MVII    #$0008, R0                      ; 550D   02B8 0008
        MVO     R0,     G_0359                  ; 550F   0240 0359
        MVII    #$0068, R0                      ; 5511   02B8 0068

        JSR     R5,     X_RAND2                 ; 5513   0004 0114 029E

        ADDI    #$0020, R0                      ; 5516   02F8 0020
        SWAP    R0,     1                       ; 5518   0040
        ADDI    #$0028, R0                      ; 5519   02F8 0028
        MVII    #$001C, R3                      ; 551B   02BB 001C
        B       L_54DE                          ; 551D   0220 0040

        DECLE   $0000,  $0000,  $0026,  $0055   ; 551F   0000 0000 0026 0055
        DECLE   $0004,  $002E,  $0000           ; 5523   0004 002E 0000

        PSHR    R5                              ; 5526   0275
        MVII    #$00C0, R0                      ; 5527   02B8 00C0
        MVO     R0,     G_0184                  ; 5529   0240 0184
        MVII    #$0008, R0                      ; 552B   02B8 0008
        MVO     R0,     G_018B                  ; 552D   0240 018B
        MVII    #$033D, R2                      ; 552F   02BA 033D
        SDBD                                    ; 5531   0001
        MVII    #$5476, R1                      ; 5532   02B9 0076 0054

        JSR     R5,     X_INIT_MOB              ; 5535   0004 0114 02B2

        SDBD                                    ; 5538   0001
        MVII    #$554D, R4                      ; 5539   02BC 004D 0055

        JSR     R5,     L_54B9                  ; 553C   0004 0154 00B9

        MVII    #$0070, R0                      ; 553F   02B8 0070

        JSR     R5,     X_RAND2                 ; 5541   0004 0114 029E

        ADDI    #$0018, R0                      ; 5544   02F8 0018
        SWAP    R0,     1                       ; 5546   0040
        ADDI    #$0030, R0                      ; 5547   02F8 0030
        MVII    #$001C, R3                      ; 5549   02BB 001C
        B       L_54DE                          ; 554B   0220 006E

        DECLE   $0000,  $0000,  $0062,  $0055   ; 554D   0000 0000 0062 0055
        DECLE   $0004,  $002E,  $0000,  $0000   ; 5551   0004 002E 0000 0000
        DECLE   $0000,  $0062,  $0055,  $0002   ; 5555   0000 0062 0055 0002
        DECLE   $0036,  $0000,  $0000,  $0000   ; 5559   0036 0000 0000 0000
        DECLE   $0062,  $0055,  $0002,  $003A   ; 555D   0062 0055 0002 003A
        DECLE   $0000                           ; 5561   0000

        PSHR    R5                              ; 5562   0275
        SDBD                                    ; 5563   0001
        MVII    #$5554, R0                      ; 5564   02B8 0054 0055
        MVO     R0,     G_0346                  ; 5567   0240 0346
        ADDI    #$0007, R0                      ; 5569   02F8 0007
        MVO     R0,     G_034E                  ; 556B   0240 034E
        MVII    #$0100, R0                      ; 556D   02B8 0100
        MVO     R0,     G_034A                  ; 556F   0240 034A
        MVO     R0,     G_0352                  ; 5571   0240 0352
        SDBD                                    ; 5573   0001
        MVII    #$7830, R2                      ; 5574   02BA 0030 0078
        MVI     G_0347, R0                      ; 5577   0280 0347
        SDBD                                    ; 5579   0001
        CMPI    #$5400, R0                      ; 557A   0378 0000 0054
        BNC     L_5583                          ; 557D   0209 0004

        SDBD                                    ; 557F   0001
        MVII    #$3030, R2                      ; 5580   02BA 0030 0030
L_5583:
        MVII    #$0004, R3                      ; 5583   02BB 0004

        JSR     R5,     .EXEC.9A8               ; 5585   0004 0118 01A8

        PULR    R7                              ; 5588   02B7

        DECLE   $004F,  $0018,  $00A4,  $0054   ; 5589   004F 0018 00A4 0054
        DECLE   $0000,  $0000,  $0000,  $0010   ; 558D   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5591   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5595   0000 0000 0000 0000
        DECLE   $005F,  $0018,  $00A4,  $0054   ; 5599   005F 0018 00A4 0054
        DECLE   $0000,  $0000,  $0000,  $0010   ; 559D   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0002,  $0000   ; 55A1   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A5   0000 0000 0000 0000
        DECLE   $0048,  $0018,  $00A4,  $0054   ; 55A9   0048 0018 00A4 0054
        DECLE   $0000,  $0000,  $0000,  $0010   ; 55AD   0000 0000 0000 0010
        DECLE   $0004,  $0000,  $0008,  $0000   ; 55B1   0004 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B5   0000 0000 0000 0000
L_55B9:
        MVI     G_017F, R0                      ; 55B9   0280 017F
        INCR    R0                              ; 55BB   0008
        MVO     R0,     G_017F                  ; 55BC   0240 017F
        ANDI    #$0001, R0                      ; 55BE   03B8 0001
        BNEQ    L_55C5                          ; 55C0   020C 0003

        JSR     R5,     L_55C8                  ; 55C2   0004 0154 01C8

L_55C5:
        J       L_583E                          ; 55C5   0004 0358 003E

L_55C8:
        PSHR    R5                              ; 55C8   0275
        MVI     G_0193, R0                      ; 55C9   0280 0193
        TSTR    R0                              ; 55CB   0080
        BEQ     L_5882                          ; 55CC   0204 02B4

        MVI     G_0356, R0                      ; 55CE   0280 0356
        TSTR    R0                              ; 55D0   0080
        BNEQ    L_5882                          ; 55D1   020C 02AF

        MVII    #$033E, R1                      ; 55D3   02B9 033E
L_55D5:
        MVI@    R1,     R0                      ; 55D5   0288
        SDBD                                    ; 55D6   0001
        SUBI    #$5924, R0                      ; 55D7   0338 0024 0059
        BEQ     L_5609                          ; 55DA   0204 002D
        BMI     L_5602                          ; 55DC   020B 0024

        CMPI    #$0028, R0                      ; 55DE   0378 0028
        BGT     L_5602                          ; 55E0   020E 0020

        MOVR    R1,     R3                      ; 55E2   008B
        SLR     R3,     2                       ; 55E3   0067
        SLR     R3,     1                       ; 55E4   0063
        ADDI    #$00FA, R3                      ; 55E5   02FB 00FA
        MVI@    R3,     R3                      ; 55E7   029B
        INCR    R1                              ; 55E8   0009
L_55E9:
        MVO     R3,     G_0180                  ; 55E9   0243 0180
        MVI     G_031F, R2                      ; 55EB   0282 031F
        SWAP    R2,     1                       ; 55ED   0042
        ANDI    #$00FF, R2                      ; 55EE   03BA 00FF
        SUBR    R3,     R2                      ; 55F0   011A
        BPL     L_55F4                          ; 55F1   0203 0001

        NEGR    R2                              ; 55F3   0022
L_55F4:
        CMPI    #$0030, R2                      ; 55F4   037A 0030
        BGT     L_5602                          ; 55F6   020E 000A

        INCR    R1                              ; 55F8   0009
        MVI@    R1,     R2                      ; 55F9   028A
        SDBD                                    ; 55FA   0001
        CMPI    #$4000, R2                      ; 55FB   037A 0000 0040
        BLT     L_5610                          ; 55FE   0205 0010

        DECR    R1                              ; 5600   0011
        DECR    R1                              ; 5601   0011
L_5602:
        ADDI    #$0008, R1                      ; 5602   02F9 0008
        CMPI    #$0356, R1                      ; 5604   0379 0356
        BLT     L_55D5                          ; 5606   0225 0032
        PULR    R7                              ; 5608   02B7

L_5609:
        INCR    R1                              ; 5609   0009
        MVI@    R1,     R3                      ; 560A   028B
        SWAP    R3,     1                       ; 560B   0043
        ANDI    #$00FF, R3                      ; 560C   03BB 00FF
        B       L_55E9                          ; 560E   0220 0026

L_5610:
        MVII    #$0355, R4                      ; 5610   02BC 0355
        SDBD                                    ; 5612   0001
        MVII    #$180A, R0                      ; 5613   02B8 000A 0018
        MVO@    R0,     R4                      ; 5616   0260
        SDBD                                    ; 5617   0001
        MVII    #$563D, R0                      ; 5618   02B8 003D 0056
        MVO@    R0,     R4                      ; 561B   0260
        DECR    R1                              ; 561C   0011
        MVI@    R1,     R2                      ; 561D   028A
        MVO@    R2,     R4                      ; 561E   0262
        INCR    R1                              ; 561F   0009
        MVI@    R1,     R0                      ; 5620   0288
        ADDI    #$03FF, R0                      ; 5621   02F8 03FF
        MVO@    R0,     R4                      ; 5623   0260
        CLRR    R0                              ; 5624   01C0
        INCR    R4                              ; 5625   000C
        MVO@    R0,     R4                      ; 5626   0260
        MVI     G_0180, R2                      ; 5627   0282 0180
        SWAP    R2,     1                       ; 5629   0042
        ADDI    #$0058, R2                      ; 562A   02FA 0058
        SLR     R1,     2                       ; 562C   0065
        SLR     R1,     1                       ; 562D   0061
        ADDI    #$0101, R1                      ; 562E   02F9 0101
        MVI@    R1,     R0                      ; 5630   0288
        MVO     R0,     G_016C                  ; 5631   0240 016C
        MVII    #$0030, R3                      ; 5633   02BB 0030
        MVII    #$0355, R1                      ; 5635   02B9 0355

        JSR     R5,     .EXEC.9A8               ; 5637   0004 0118 01A8

        J       L_5FDA                          ; 563A   0004 035C 03DA

        DECLE   $0000,  $0000,  $00FA,  $005C   ; 563D   0000 0000 00FA 005C
        DECLE   $0001,  $004F,  $0000           ; 5641   0001 004F 0000

        SETC                                    ; 5644   0007
L_5645:
        PSHR    R5                              ; 5645   0275
        MVI     G_018B, R0                      ; 5646   0280 018B
        TSTR    R0                              ; 5648   0080
        BNEQ    L_53AE                          ; 5649   022C 029C

        MVI     G_0189, R0                      ; 564B   0280 0189
        DECR    R0                              ; 564D   0010
        BPL     L_5654                          ; 564E   0203 0004

        MVII    #$0005, R0                      ; 5650   02B8 0005
        SUB     G_0193, R0                      ; 5652   0300 0193
L_5654:
        MVO     R0,     G_0189                  ; 5654   0240 0189
        CMPI    #$0001, R0                      ; 5656   0378 0001
        BEQ     L_55B9                          ; 5658   0224 00A0

        TSTR    R0                              ; 565A   0080
        BNEQ    L_583E                          ; 565B   020C 01E1

        MVII    #$0007, R0                      ; 565D   02B8 0007
        MVII    #$017B, R4                      ; 565F   02BC 017B
L_5661:
        MVI@    R4,     R1                      ; 5661   02A1
        INCR    R1                              ; 5662   0009
        MVO@    R1,     R4                      ; 5663   0261
        SUBI    #$0003, R4                      ; 5664   033C 0003
        DECR    R0                              ; 5666   0010
        BNEQ    L_5661                          ; 5667   022C 0007

        MVI     G_0193, R0                      ; 5669   0280 0193
        SLL     R0,     1                       ; 566B   0048
        SWAP    R0,     1                       ; 566C   0040
        ADD     G_0358, R0                      ; 566D   02C0 0358
        MVO     R0,     G_0358                  ; 566F   0240 0358
        MVI     G_0185, R0                      ; 5671   0280 0185
        TSTR    R0                              ; 5673   0080
        BEQ     L_567F                          ; 5674   0204 0009

        INCR    R0                              ; 5676   0008
        MOVR    R0,     R1                      ; 5677   0081
        ANDI    #$0007, R1                      ; 5678   03B9 0007
        BNEQ    L_567D                          ; 567A   020C 0001

        CLRR    R0                              ; 567C   01C0
L_567D:
        MVO     R0,     G_0185                  ; 567D   0240 0185
L_567F:
        MVI     G_0192, R0                      ; 567F   0280 0192
        TSTR    R0                              ; 5681   0080
        BEQ     L_5689                          ; 5682   0204 0005

        DECR    R0                              ; 5684   0010
        MVO     R0,     G_0192                  ; 5685   0240 0192
        B       L_56C5                          ; 5687   0200 003C

L_5689:
        MVI     G_0191, R4                      ; 5689   0284 0191
        ADDI    #$0002, R4                      ; 568B   02FC 0002
L_568D:
        MVO     R4,     G_0191                  ; 568D   0244 0191
        SDBD                                    ; 568F   0001
        ADDI    #$59FE, R4                      ; 5690   02FC 00FE 0059
        MVI@    R4,     R0                      ; 5693   02A0
        MVO     R0,     G_018A                  ; 5694   0240 018A
        SARC    R0,     1                       ; 5696   0078
        BNC     L_569D                          ; 5697   0209 0004

        MVO     R0,     G_0192                  ; 5699   0240 0192
        B       L_56C5                          ; 569B   0200 0028

L_569D:
        SARC    R0,     1                       ; 569D   0078
        BC      L_56A3                          ; 569E   0201 0003

        SARC    R0,     1                       ; 56A0   0078
        BNC     L_56B1                          ; 56A1   0209 000E

L_56A3:
        MVO     R0,     G_0192                  ; 56A3   0240 0192
        MVI@    R4,     R0                      ; 56A5   02A0
        MOVR    R0,     R1                      ; 56A6   0081
        ANDI    #$0200, R1                      ; 56A7   03B9 0200
        BEQ     L_56AD                          ; 56A9   0204 0002

        MVO     R0,     G_0185                  ; 56AB   0240 0185
L_56AD:
        MVO     R0,     G_0175                  ; 56AD   0240 0175
        B       L_56C5                          ; 56AF   0200 0014

L_56B1:
        SARC    R0,     1                       ; 56B1   0078
        BC      L_56C1                          ; 56B2   0201 000D

        MVI     G_0193, R0                      ; 56B4   0280 0193
        CMPI    #$0003, R0                      ; 56B6   0378 0003
        BEQ     L_56BD                          ; 56B8   0204 0003

        INCR    R0                              ; 56BA   0008
        MVO     R0,     G_0193                  ; 56BB   0240 0193
L_56BD:
        MVII    #$0000, R4                      ; 56BD   02BC 0000
        B       L_568D                          ; 56BF   0220 0033

L_56C1:
        MVII    #$000A, R0                      ; 56C1   02B8 000A
        MVO     R0,     G_018B                  ; 56C3   0240 018B
L_56C5:
        MVII    #$0215, R3                      ; 56C5   02BB 0215
        MVII    #$0175, R1                      ; 56C7   02B9 0175

L_56C9:
        JSR     R5,     L_56D2                  ; 56C9   0004 0154 02D2

        CMPI    #$017D, R1                      ; 56CC   0379 017D
        BLT     L_56C9                          ; 56CE   0225 0006
        B       L_5725                          ; 56D0   0200 0053

L_56D2:
        PSHR    R5                              ; 56D2   0275
        CLRR    R0                              ; 56D3   01C0
        MVI@    R1,     R5                      ; 56D4   028D
        SDBD                                    ; 56D5   0001
        MVII    #$6400, R2                      ; 56D6   02BA 0000 0064
        CMPI    #$0088, R5                      ; 56D9   037D 0088
        BLT     L_56E1                          ; 56DB   0205 0004

        SDBD                                    ; 56DD   0001
        MVII    #$67CD, R2                      ; 56DE   02BA 00CD 0067
L_56E1:
        SDBD                                    ; 56E1   0001
        ADDI    #$6876, R5                      ; 56E2   02FD 0076 0068
        MVI@    R5,     R5                      ; 56E5   02AD
        ADDR    R2,     R5                      ; 56E6   00D5
L_56E7:
        MVI@    R5,     R2                      ; 56E7   02AA
        SARC    R2,     2                       ; 56E8   007E
        BC      L_56FF                          ; 56E9   0201 0014

        SARC    R2,     1                       ; 56EB   007A
L_56EC:
        MVO@    R0,     R3                      ; 56EC   0258
        INCR    R3                              ; 56ED   000B
        DECR    R2                              ; 56EE   0012
        BNEQ    L_56EC                          ; 56EF   022C 0004
        BNOV    L_56E7                          ; 56F1   022A 000B

L_56F3:
        ADDI    #$0002, R3                      ; 56F3   02FB 0002
        CMPI    #$028D, R3                      ; 56F5   037B 028D
        BEQ     L_56E7                          ; 56F7   0224 0011

        CMPI    #$02B5, R3                      ; 56F9   037B 02B5
        BEQ     L_56E7                          ; 56FB   0224 0015

        INCR    R1                              ; 56FD   0009
        PULR    R7                              ; 56FE   02B7
L_56FF:
        BOV     L_570C                          ; 56FF   0202 000B

        SDBD                                    ; 5701   0001
        ADDI    #$6816, R2                      ; 5702   02FA 0016 0068
        MOVR    R2,     R4                      ; 5705   0094
        SDBD                                    ; 5706   0001
        MVI@    R4,     R0                      ; 5707   02A0
        MVO@    R0,     R3                      ; 5708   0258
        INCR    R3                              ; 5709   000B
        B       L_56E7                          ; 570A   0220 0024

L_570C:
        SDBD                                    ; 570C   0001
        ADDI    #$6816, R2                      ; 570D   02FA 0016 0068
        MOVR    R2,     R4                      ; 5710   0094
        SDBD                                    ; 5711   0001
        MVI@    R4,     R0                      ; 5712   02A0
        MVO@    R0,     R3                      ; 5713   0258
        INCR    R3                              ; 5714   000B
        B       L_56F3                          ; 5715   0220 0023

L_5717:
        PSHR    R5                              ; 5717   0275
        MVII    #$033E, R4                      ; 5718   02BC 033E
L_571A:
        MVI@    R4,     R0                      ; 571A   02A0
        TSTR    R0                              ; 571B   0080
        BEQ     L_5882                          ; 571C   0204 0164

        ADDI    #$0007, R4                      ; 571E   02FC 0007
        CMPI    #$034F, R4                      ; 5720   037C 034F
        BLT     L_571A                          ; 5722   0225 0009
        PULR    R7                              ; 5724   02B7

L_5725:
        MVI     G_018A, R1                      ; 5725   0281 018A
        SARC    R1,     1                       ; 5727   0079
        BC      L_5958                          ; 5728   0201 022E

        MVII    #$033E, R4                      ; 572A   02BC 033E
L_572C:
        PSHR    R4                              ; 572C   0274
        MVI@    R4,     R0                      ; 572D   02A0
        MVI@    R4,     R1                      ; 572E   02A1
        MVI@    R4,     R2                      ; 572F   02A2
        MVI@    R4,     R3                      ; 5730   02A3
        MVI@    R4,     R5                      ; 5731   02A5
        SDBD                                    ; 5732   0001
        SUBI    #$5914, R0                      ; 5733   0338 0014 0059
        BMI     L_5779                          ; 5736   020B 0041

        CMPI    #$0030, R0                      ; 5738   0378 0030
        BGT     L_5779                          ; 573A   020E 003D

        CMPI    #$0010, R0                      ; 573C   0378 0010
        BGT     L_5741                          ; 573E   020E 0001

        ADDR    R3,     R1                      ; 5740   00D9
L_5741:
        SWAP    R2,     1                       ; 5741   0042
        ADDI    #$0008, R2                      ; 5742   02FA 0008
        CMPI    #$0030, R2                      ; 5744   037A 0030
        BEQ     L_574C                          ; 5746   0204 0004
        BLT     L_574D                          ; 5748   0205 0003

        ADDI    #$0008, R2                      ; 574A   02FA 0008
L_574C:
        ADDR    R3,     R1                      ; 574C   00D9
L_574D:
        DECR    R4                              ; 574D   0014
        CMPI    #$0020, R2                      ; 574E   037A 0020
        BEQ     L_575C                          ; 5750   0204 000A

        CMPI    #$0030, R2                      ; 5752   037A 0030
        BEQ     L_576A                          ; 5754   0204 0014

        CMPI    #$0050, R2                      ; 5756   037A 0050
        BGT     L_5762                          ; 5758   020E 0008
        BNEQ    L_575D                          ; 575A   020C 0001

L_575C:
        INCR    R5                              ; 575C   000D
L_575D:
        MVO@    R5,     R4                      ; 575D   0265
        SUBI    #$0004, R4                      ; 575E   033C 0004
        B       L_5776                          ; 5760   0200 0014

L_5762:
        SUBI    #$0005, R4                      ; 5762   033C 0005
        MOVR    R4,     R1                      ; 5764   00A1

        JSR     R5,     L_5CFA                  ; 5765   0004 015C 00FA

        B       L_5779                          ; 5768   0200 000F

L_576A:
        DECR    R5                              ; 576A   0015
        MVO@    R5,     R4                      ; 576B   0265
        SUBI    #$0006, R4                      ; 576C   033C 0006
        MVI@    R4,     R3                      ; 576E   02A3
        SDBD                                    ; 576F   0001
        ADDI    #$2080, R3                      ; 5770   02FB 0080 0020
        DECR    R4                              ; 5773   0014
        MVO@    R3,     R4                      ; 5774   0263
        INCR    R4                              ; 5775   000C
L_5776:
        MVO@    R1,     R4                      ; 5776   0261
        SWAP    R2,     1                       ; 5777   0042
        MVO@    R2,     R4                      ; 5778   0262
L_5779:
        PULR    R4                              ; 5779   02B4
        ADDI    #$0008, R4                      ; 577A   02FC 0008
        CMPI    #$0357, R4                      ; 577C   037C 0357
        BLT     L_572C                          ; 577E   0225 0053

        MVI     G_018A, R1                      ; 5780   0281 018A
        SARC    R1,     2                       ; 5782   007D
        BNOV    L_583E                          ; 5783   020A 00B9

        JSR     R5,     L_5717                  ; 5785   0004 0154 0317

        BNEQ    L_583E                          ; 5788   020C 00B4

        JSR     R5,     L_5FEE                  ; 578A   0004 015C 03EE

        ANDI    #$001F, R0                      ; 578D   03B8 001F
        SARC    R0,     2                       ; 578F   007C
        BC      L_583E                          ; 5790   0201 00AC
        BNOV    L_57E8                          ; 5792   020A 0054

        CMPI    #$0001, R0                      ; 5794   0378 0001
        BEQ     L_57EE                          ; 5796   0204 0056

        CMPI    #$0003, R0                      ; 5798   0378 0003
        BNEQ    L_57E8                          ; 579A   020C 004C

        MVII    #$0006, R0                      ; 579C   02B8 0006
        B       L_57EF                          ; 579E   0200 004F

        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A8   0000 0000 0000 0000
        DECLE   $0003,  $0000,  $0000,  $0000   ; 57AC   0003 0000 0000 0000
        DECLE   $0001,  $003A,  $0060,  $0000   ; 57B0   0001 003A 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B4   0000 0000 0000 0000
        DECLE   $0001,  $003A,  $0060,  $0000   ; 57B8   0001 003A 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57BC   0000 0000 0000 0000
        DECLE   $0002,  $0076,  $00A0,  $0000   ; 57C0   0002 0076 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C4   0000 0000 0000 0000
        DECLE   $0002,  $0008,  $0028,  $0000   ; 57C8   0002 0008 0028 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D4   0000 0000 0000 0000
        DECLE   $0001,  $000E,  $0048,  $0000   ; 57D8   0001 000E 0048 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57DC   0000 0000 0000 0000
        DECLE   $0001,  $0056,  $0088,  $0000   ; 57E0   0001 0056 0088 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E4   0000 0000 0000 0000
L_57E8:
        CMPI    #$0006, R0                      ; 57E8   0378 0006
        BLT     L_57EF                          ; 57EA   0205 0003
        BEQ     L_583E                          ; 57EC   0204 0050

L_57EE:
        CLRR    R0                              ; 57EE   01C0
L_57EF:
        PSHR    R0                              ; 57EF   0270
        MOVR    R0,     R2                      ; 57F0   0082
        SLL     R2,     1                       ; 57F1   004A
        SDBD                                    ; 57F2   0001
        MVII    #$59F0, R5                      ; 57F3   02BD 00F0 0059
        ADDR    R2,     R5                      ; 57F6   00D5
        SDBD                                    ; 57F7   0001
        MVI@    R5,     R1                      ; 57F8   02A9
        SUBI    #$0002, R4                      ; 57F9   033C 0002
        MVO@    R1,     R4                      ; 57FB   0261
        SLL     R2,     2                       ; 57FC   004E
        SDBD                                    ; 57FD   0001
        ADDI    #$5914, R2                      ; 57FE   02FA 0014 0059
        MVO@    R2,     R4                      ; 5801   0262
        MOVR    R4,     R0                      ; 5802   00A0
        SLR     R0,     2                       ; 5803   0064
        SLR     R0,     1                       ; 5804   0060
        SUBI    #$0063, R0                      ; 5805   0338 0063
        ADDI    #$0007, R2                      ; 5807   02FA 0007
        MVI@    R2,     R2                      ; 5809   0292
        ANDI    #$0007, R2                      ; 580A   03BA 0007
        MVII    #$0165, R1                      ; 580C   02B9 0165
        ADDR    R0,     R1                      ; 580E   00C1
        MVII    #$015D, R3                      ; 580F   02BB 015D
        ADDR    R0,     R3                      ; 5811   00C3
L_5812:
        MVO@    R2,     R1                      ; 5812   024A
        MVII    #$0038, R0                      ; 5813   02B8 0038

        JSR     R5,     X_RAND2                 ; 5815   0004 0114 029E

        ADDI    #$0038, R0                      ; 5818   02F8 0038
        MOVR    R0,     R2                      ; 581A   0082
        SWAP    R0,     1                       ; 581B   0040
        MVO@    R0,     R4                      ; 581C   0260
        MVII    #$0010, R1                      ; 581D   02B9 0010
        SWAP    R1,     1                       ; 581F   0041
        MVO@    R1,     R4                      ; 5820   0261
        SDBD                                    ; 5821   0001
        SUBI    #$5400, R0                      ; 5822   0338 0000 0054
        SDBD                                    ; 5825   0001
        MVII    #$0600, R1                      ; 5826   02B9 0000 0006
        BMI     L_582C                          ; 5829   020B 0001

        NEGR    R1                              ; 582B   0021
L_582C:
        PULR    R5                              ; 582C   02B5
        CMPI    #$0004, R5                      ; 582D   037D 0004
        BNEQ    L_5832                          ; 582F   020C 0001

        MOVR    R1,     R0                      ; 5831   0088
L_5832:
        SAR     R0,     2                       ; 5832   006C
        SAR     R0,     1                       ; 5833   0068
        MVO@    R0,     R4                      ; 5834   0260
        SUBI    #$0054, R2                      ; 5835   033A 0054
        SLL     R2,     1                       ; 5837   004A
        ADDI    #$0050, R2                      ; 5838   02FA 0050
        MVO@    R2,     R3                      ; 583A   025A
        CLRR    R0                              ; 583B   01C0
        MVO@    R0,     R4                      ; 583C   0260
        MVO@    R0,     R4                      ; 583D   0260

L_583E:
        JSR     R5,     L_5E70                  ; 583E   0004 015C 0270

        MVII    #$017C, R1                      ; 5841   02B9 017C

        JSR     R5,     L_58F2                  ; 5843   0004 0158 00F2

        BNEQ    L_59A3                          ; 5846   020C 015B

        MVII    #$017B, R1                      ; 5848   02B9 017B

        JSR     R5,     L_58F2                  ; 584A   0004 0158 00F2

        BEQ     L_5883                          ; 584D   0204 0034

        MVI     G_0165, R3                      ; 584F   0283 0165
        CMPI    #$0001, R3                      ; 5851   037B 0001
        BGT     L_585B                          ; 5853   020E 0006

        DECR    R1                              ; 5855   0011

        JSR     R5,     L_58F2                  ; 5856   0004 0158 00F2

        BEQ     L_59A3                          ; 5859   0204 0148

L_585B:
        JSR     R5,     L_5866                  ; 585B   0004 0158 0066

        BEQ     L_59A3                          ; 585E   0204 0143

        JSR     R5,     L_5E3B                  ; 5860   0004 015C 023B

        J       L_521F                          ; 5863   0004 0350 021F

L_5866:
        PSHR    R5                              ; 5866   0275
        MVI@    R2,     R0                      ; 5867   0290
        CMPI    #$0002, R0                      ; 5868   0378 0002
        BGT     L_5882                          ; 586A   020E 0016
        BEQ     L_5874                          ; 586C   0204 0006

        MVI     G_0165, R3                      ; 586E   0283 0165
        ANDI    #$0001, R3                      ; 5870   03BB 0001
        BNEQ    L_5882                          ; 5872   020C 000E

L_5874:
        MVI     G_031F, R3                      ; 5874   0283 031F
        SWAP    R3,     1                       ; 5876   0043
        ANDI    #$00FF, R3                      ; 5877   03BB 00FF
        INCR    R2                              ; 5879   000A
        CMP@    R2,     R3                      ; 587A   0353
        BLT     L_5882                          ; 587B   0205 0005

        INCR    R2                              ; 587D   000A
        CMP@    R2,     R3                      ; 587E   0353
        BGT     L_5882                          ; 587F   020E 0001

        CLRR    R3                              ; 5881   01DB
L_5882:
        PULR    R7                              ; 5882   02B7

L_5883:
        DECR    R1                              ; 5883   0011

        JSR     R5,     L_58F2                  ; 5884   0004 0158 00F2

        BNEQ    L_588F                          ; 5887   020C 0006

        CMPI    #$0175, R1                      ; 5889   0379 0175
        BNEQ    L_5883                          ; 588B   022C 0009
        B       L_59A3                          ; 588D   0200 0114

L_588F:
        JSR     R5,     L_58E5                  ; 588F   0004 0158 00E5

        MVII    #$032E, R4                      ; 5892   02BC 032E
        MVI     G_0167, R0                      ; 5894   0280 0167
L_5896:
        MVI@    R4,     R5                      ; 5896   02A5
        INCR    R4                              ; 5897   000C
        SDBD                                    ; 5898   0001
        CMPI    #$5B29, R5                      ; 5899   037D 0029 005B
        BNEQ    L_58A2                          ; 589C   020C 0004

        CMP@    R4,     R3                      ; 589E   0363
        BC      L_58C3                          ; 589F   0201 0022

        DECR    R4                              ; 58A1   0014
L_58A2:
        MVI     G_0168, R0                      ; 58A2   0280 0168
        ADDI    #$0006, R4                      ; 58A4   02FC 0006
        CMPI    #$0336, R4                      ; 58A6   037C 0336
        BEQ     L_5896                          ; 58A8   0224 0013

        MVII    #$0355, R1                      ; 58AA   02B9 0355

        JSR     R5,     L_6004                  ; 58AC   0004 0160 0004

        MVI@    R1,     R0                      ; 58AF   0288
        ANDI    #$0007, R0                      ; 58B0   03B8 0007
        CMPI    #$0007, R0                      ; 58B2   0378 0007
        BEQ     L_58BE                          ; 58B4   0204 0008

        MVI@    R1,     R0                      ; 58B6   0288
        SWAP    R0,     1                       ; 58B7   0040
        ANDI    #$0186, R0                      ; 58B8   03B8 0186
        CMPI    #$0106, R0                      ; 58BA   0378 0106
        BNEQ    L_59A3                          ; 58BC   020C 00E5

L_58BE:
        CLRR    R0                              ; 58BE   01C0
        MVO     R0,     G_0356                  ; 58BF   0240 0356
        B       L_59A3                          ; 58C1   0200 00E0

L_58C3:
        CMPI    #$0001, R0                      ; 58C3   0378 0001
        BGT     L_58D8                          ; 58C5   020E 0011

        CMPI    #$0175, R1                      ; 58C7   0379 0175
        BEQ     L_59A3                          ; 58C9   0204 00D8

        DECR    R1                              ; 58CB   0011

        JSR     R5,     L_58F2                  ; 58CC   0004 0158 00F2

        BEQ     L_59A3                          ; 58CF   0204 00D2

        JSR     R5,     L_58E5                  ; 58D1   0004 0158 00E5

        DECR    R4                              ; 58D4   0014
        CMP@    R4,     R3                      ; 58D5   0363
        BNC     L_59A3                          ; 58D6   0209 00CB

L_58D8:
        JSR     R5,     L_5866                  ; 58D8   0004 0158 0066

        BEQ     L_59A3                          ; 58DB   0204 00C6

        SUBI    #$0004, R4                      ; 58DD   033C 0004
        MOVR    R4,     R1                      ; 58DF   00A1

        JSR     R5,     L_5C61                  ; 58E0   0004 015C 0061

        B       L_59A3                          ; 58E3   0200 00BE

L_58E5:
        MOVR    R1,     R3                      ; 58E5   008B
        SUBI    #$0172, R3                      ; 58E6   033B 0172
        SLL     R3,     2                       ; 58E8   004F
        SLL     R3,     1                       ; 58E9   004B
        CMPI    #$0038, R3                      ; 58EA   037B 0038
        BNEQ    L_58F0                          ; 58EC   020C 0002

        ADDI    #$0008, R3                      ; 58EE   02FB 0008
L_58F0:
        SWAP    R3,     1                       ; 58F0   0043
        MOVR    R5,     R7                      ; 58F1   00AF

L_58F2:
        PSHR    R5                              ; 58F2   0275
        MVI     G_0193, R0                      ; 58F3   0280 0193
        TSTR    R0                              ; 58F5   0080
        BEQ     L_5909                          ; 58F6   0204 0011

        MVI     G_0185, R5                      ; 58F8   0285 0185
        TSTR    R5                              ; 58FA   00AD
        BEQ     L_5909                          ; 58FB   0204 000C

        ANDI    #$0007, R5                      ; 58FD   03BD 0007
        MOVR    R1,     R0                      ; 58FF   0088
        SUBI    #$0175, R0                      ; 5900   0338 0175
        CMPR    R0,     R5                      ; 5902   0145
        BNEQ    L_5909                          ; 5903   020C 0004

        MVII    #$0003, R0                      ; 5905   02B8 0003
        B       L_5912                          ; 5907   0200 0009

L_5909:
        MVI@    R1,     R2                      ; 5909   028A
        ANDI    #$00F8, R2                      ; 590A   03BA 00F8
        SLR     R2,     1                       ; 590C   0062
        SDBD                                    ; 590D   0001
        ADDI    #$57A0, R2                      ; 590E   02FA 00A0 0057
        MVI@    R2,     R0                      ; 5911   0290
L_5912:
        TSTR    R0                              ; 5912   0080
        PULR    R7                              ; 5913   02B7

        DECLE   $0000,  $0000,  $00FA,  $005C   ; 5914   0000 0000 00FA 005C
        DECLE   $0002,  $000A,  $0000,  $001B   ; 5918   0002 000A 0000 001B
        DECLE   $0000,  $0000,  $00FA,  $005C   ; 591C   0000 0000 00FA 005C
        DECLE   $0002,  $000E,  $0000,  $0053   ; 5920   0002 000E 0000 0053
        DECLE   $0000,  $0000                   ; 5924   0000 0000

        ADDR    R7,     R2                      ; 5926   00FA
        SLLC    R0,     2                       ; 5927   005C

        JSRD    R4,     X_RESET                 ; 5928   0004 0012 0000
        DECLE   $0023,  $0000,  $0000           ; 592B   0023 0000 0000

        ADDR    R7,     R2                      ; 592E   00FA
        SLLC    R0,     2                       ; 592F   005C

        JSRD    R4,     .EXEC.400               ; 5930   0004 0016 0000
        DECLE   $002A,  $0000,  $0000           ; 5933   002A 0000 0000

        ADDR    R7,     R2                      ; 5936   00FA
        SLLC    R0,     2                       ; 5937   005C

        JSRD    R4,     .EXEC.800               ; 5938   0004 001A 0000
        DECLE   $0023,  $0000,  $0000,  $00FA   ; 593B   0023 0000 0000 00FA
        DECLE   $005C,  $0002,  $001E,  $0000   ; 593F   005C 0002 001E 0000
        DECLE   $0010,  $0000,  $0000           ; 5943   0010 0000 0000

        ADDR    R7,     R2                      ; 5946   00FA
        SLLC    R0,     2                       ; 5947   005C

        JSRD    R4,     .EXEC.400               ; 5948   0004 0016 0000
        DECLE   $0029,  $0000,  $0000,  $00D6   ; 594B   0029 0000 0000 00D6
        DECLE   $005C,  $0002,  $001E,  $0000   ; 594F   005C 0002 001E 0000

        DECR    R4                              ; 5953   0014
        COMR    R0                              ; 5954   0018
        COMR    R4                              ; 5955   001C
        COMR    R4                              ; 5956   001C
        NEGR    R0                              ; 5957   0020
L_5958:
        MVI     G_0192, R0                      ; 5958   0280 0192
        CMPI    #$0008, R0                      ; 595A   0378 0008
        BLT     L_583E                          ; 595C   0225 011F

        JSR     R5,     L_5717                  ; 595E   0004 0154 0317

        BNEQ    L_583E                          ; 5961   022C 0124

        SUBI    #$0002, R4                      ; 5963   033C 0002
        SDBD                                    ; 5965   0001
        MVII    #$184C, R0                      ; 5966   02B8 004C 0018
        MVO@    R0,     R4                      ; 5969   0260
        SDBD                                    ; 596A   0001
        MVII    #$594C, R1                      ; 596B   02B9 004C 0059
        MVO@    R1,     R4                      ; 596E   0261
        MVII    #$0080, R0                      ; 596F   02B8 0080

        JSR     R5,     X_RAND2                 ; 5971   0004 0114 029E

        ADDI    #$0010, R0                      ; 5974   02F8 0010
        MOVR    R4,     R3                      ; 5976   00A3
        SLR     R3,     2                       ; 5977   0067
        SLR     R3,     1                       ; 5978   0063
        ADDI    #$00FA, R3                      ; 5979   02FB 00FA
        MVO@    R0,     R3                      ; 597B   0258
        ADDI    #$0008, R3                      ; 597C   02FB 0008
        MVII    #$0004, R5                      ; 597E   02BD 0004
        MVO@    R5,     R3                      ; 5980   025D
        MOVR    R0,     R2                      ; 5981   0082
        SUBI    #$0050, R0                      ; 5982   0338 0050
        SAR     R0,     1                       ; 5984   0068
        ADDI    #$0054, R0                      ; 5985   02F8 0054
        ADDR    R0,     R2                      ; 5987   00C2
        SAR     R2,     1                       ; 5988   006A
        SWAP    R2,     1                       ; 5989   0042
        ADDI    #$0038, R2                      ; 598A   02FA 0038
        SWAP    R0,     1                       ; 598C   0040
        MVO@    R0,     R4                      ; 598D   0260
        MVII    #$000A, R0                      ; 598E   02B8 000A
        SWAP    R0,     1                       ; 5990   0040
        MVO@    R0,     R4                      ; 5991   0260
        INCR    R4                              ; 5992   000C
        MVII    #$0030, R0                      ; 5993   02B8 0030
        MVO@    R0,     R4                      ; 5995   0260
        SUBI    #$0006, R4                      ; 5996   033C 0006
        MOVR    R4,     R1                      ; 5998   00A1
        SDBD                                    ; 5999   0001
        MVII    #$5954, R3                      ; 599A   02BB 0054 0059
        ADD     G_0193, R3                      ; 599D   02C3 0193
        MVI@    R3,     R3                      ; 599F   029B

        JSR     R5,     .EXEC.9A8               ; 59A0   0004 0118 01A8

L_59A3:
        CLRR    R0                              ; 59A3   01C0
        MVI     G_0327, R1                      ; 59A4   0281 0327
        SWAP    R1,     1                       ; 59A6   0041
        ANDI    #$00FF, R1                      ; 59A7   03B9 00FF
        SLR     R1,     2                       ; 59A9   0065
        SLR     R1,     1                       ; 59AA   0061
        ADDI    #$02C7, R1                      ; 59AB   02F9 02C7
        MVI@    R1,     R2                      ; 59AD   028A
        SWAP    R2,     1                       ; 59AE   0042
        ANDI    #$0036, R2                      ; 59AF   03BA 0036
        BEQ     L_59BB                          ; 59B1   0204 0008

        CMPI    #$0024, R2                      ; 59B3   037A 0024
        BEQ     L_59BB                          ; 59B5   0204 0004

        SDBD                                    ; 59B7   0001
        MVII    #$60D0, R0                      ; 59B8   02B8 00D0 0060
L_59BB:
        MVI     G_0325, R1                      ; 59BB   0281 0325
        RLC     R1,     1                       ; 59BD   0051
        RRC     R0,     1                       ; 59BE   0070
        MVO     R0,     G_0325                  ; 59BF   0240 0325
        MVII    #$033E, R1                      ; 59C1   02B9 033E
L_59C3:
        MVI@    R1,     R0                      ; 59C3   0288
        INCR    R1                              ; 59C4   0009
        MVI@    R1,     R2                      ; 59C5   028A
        SDBD                                    ; 59C6   0001
        SUBI    #$5914, R0                      ; 59C7   0338 0014 0059
        BMI     L_59E9                          ; 59CA   020B 001D

        SLR     R0,     2                       ; 59CC   0064
        SLR     R0,     1                       ; 59CD   0060
        CMPI    #$0003, R0                      ; 59CE   0378 0003
        BLT     L_59E9                          ; 59D0   0205 0017

        CMPI    #$0004, R0                      ; 59D2   0378 0004
        BEQ     L_59DE                          ; 59D4   0204 0008

        CMP     G_031F, R2                      ; 59D6   0342 031F
        BLT     L_59E6                          ; 59D8   0205 000C

        SUBI    #$0080, R2                      ; 59DA   033A 0080
        B       L_59E8                          ; 59DC   0200 000A

L_59DE:
        ADDI    #$0002, R1                      ; 59DE   02F9 0002
        MVI@    R1,     R0                      ; 59E0   0288
        SUBI    #$0002, R1                      ; 59E1   0339 0002
        ADDR    R0,     R2                      ; 59E3   00C2
        B       L_59E8                          ; 59E4   0200 0002

L_59E6:
        ADDI    #$0080, R2                      ; 59E6   02FA 0080
L_59E8:
        MVO@    R2,     R1                      ; 59E8   024A
L_59E9:
        ADDI    #$0007, R1                      ; 59E9   02F9 0007
        CMPI    #$035E, R1                      ; 59EB   0379 035E
        BLT     L_59C3                          ; 59ED   0225 002B
        PULR    R7                              ; 59EF   02B7

        DECLE   $005F,  $0098,  $005F,  $0098   ; 59F0   005F 0098 005F 0098
        DECLE   $005F,  $0098,  $005C,  $0098   ; 59F4   005F 0098 005C 0098
        DECLE   $005F,  $0098,  $005A,  $0098   ; 59F8   005F 0098 005A 0098
        DECLE   $004A,  $0098,  $0024,  $0000   ; 59FC   004A 0098 0024 0000
        DECLE   $0004                           ; 5A00   0004

        INCR    R0                              ; 5A01   0008
        DECR    R4                              ; 5A02   0014
        DECR    R0                              ; 5A03   0010

        JSR     R4,     .EXEC.804               ; 5A04   0004 0018 0004
        DECLE   $0030,  $0004,  $0038,  $0012   ; 5A07   0030 0004 0038 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A0B   0010 0002 0060 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A0F   0010 0002 0060 0012
        DECLE   $0010,  $0004                   ; 5A13   0010 0004

        RLC     R0,     1                       ; 5A15   0050

        JSR     R4,     L_5812                  ; 5A16   0004 0058 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A19   0010 0002 0060 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A1D   0010 0002 0060 0012
        DECLE   $0010,  $0004,  $0040,  $0004   ; 5A21   0010 0004 0040 0004

        SLL     R0,     1                       ; 5A25   0048
        DECR    R2                              ; 5A26   0012
        DECR    R0                              ; 5A27   0010
        EIS                                     ; 5A28   0002
        SLR     R0,     1                       ; 5A29   0060
        DECR    R2                              ; 5A2A   0012
        DECR    R0                              ; 5A2B   0010
        EIS                                     ; 5A2C   0002
        SLR     R0,     1                       ; 5A2D   0060
        DECR    R2                              ; 5A2E   0012
        DECR    R0                              ; 5A2F   0010

        JSR     R6,     .EXEC.012               ; 5A30   0004 0210 0012

        DECR    R0                              ; 5A33   0010
        EIS                                     ; 5A34   0002
        SLR     R0,     1                       ; 5A35   0060
        DECR    R2                              ; 5A36   0012
        DECR    R0                              ; 5A37   0010
        EIS                                     ; 5A38   0002
        SLR     R0,     1                       ; 5A39   0060
        DECR    R2                              ; 5A3A   0012
        DECR    R0                              ; 5A3B   0010

        JSR     R4,     .EXEC.804               ; 5A3C   0004 0018 0004
        DECLE   $0030,  $0004,  $0068,  $003C   ; 5A3F   0030 0004 0068 003C
        DECLE   $0000,  $0081,  $0000,  $003C   ; 5A43   0000 0081 0000 003C
        DECLE   $0000,  $0004                   ; 5A47   0000 0004

        INCR    R0                              ; 5A49   0008
        DECR    R4                              ; 5A4A   0014
        DECR    R0                              ; 5A4B   0010

        JSR     R4,     .EXEC.804               ; 5A4C   0004 0018 0004
        DECLE   $0030,  $0004,  $0038,  $0012   ; 5A4F   0030 0004 0038 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A53   0010 0002 0060 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A57   0010 0002 0060 0012
        DECLE   $0010,  $0004,  $0080,  $0004   ; 5A5B   0010 0004 0080 0004
        DECLE   $0288,  $0012,  $0010,  $0002   ; 5A5F   0288 0012 0010 0002
        DECLE   $0060,  $0012,  $0010,  $0002   ; 5A63   0060 0012 0010 0002
        DECLE   $0060,  $0012,  $0010,  $0004   ; 5A67   0060 0012 0010 0004

        RLC     R0,     1                       ; 5A6B   0050

        JSR     R6,     L_5812                  ; 5A6C   0004 0258 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A6F   0010 0002 0060 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A73   0010 0002 0060 0012
        DECLE   $0010,  $0004,  $0020,  $0004   ; 5A77   0010 0004 0020 0004
        DECLE   $0228,  $0012,  $0010,  $0002   ; 5A7B   0228 0012 0010 0002
        DECLE   $0060,  $0012,  $0010,  $0002   ; 5A7F   0060 0012 0010 0002
        DECLE   $0060,  $0012,  $0010,  $0004   ; 5A83   0060 0012 0010 0004
        DECLE   $0040,  $0004,  $0248,  $0012   ; 5A87   0040 0004 0248 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A8B   0010 0002 0060 0012
        DECLE   $0010,  $0002,  $0060,  $0012   ; 5A8F   0010 0002 0060 0012
        DECLE   $0010,  $0004,  $0070,  $0004   ; 5A93   0010 0004 0070 0004
        DECLE   $0278,  $0034,  $0010,  $0008   ; 5A97   0278 0034 0010 0008
        DECLE   $0000,  $0014,  $0010,  $0000   ; 5A9B   0000 0014 0010 0000
L_5A9F:
        PSHR    R5                              ; 5A9F   0275
        MVI     G_0188, R4                      ; 5AA0   0284 0188
        TSTR    R4                              ; 5AA2   00A4
        BNEQ    L_5C60                          ; 5AA3   020C 01BB

        MVI     G_018F, R0                      ; 5AA5   0280 018F
        MVII    #$01FF, R1                      ; 5AA7   02B9 01FF
        TSTR    R0                              ; 5AA9   0080
        BEQ     L_5AAD                          ; 5AAA   0204 0001

        DECR    R1                              ; 5AAC   0011
L_5AAD:
        MVI@    R1,     R0                      ; 5AAD   0288
        COMR    R0                              ; 5AAE   0018
        MVO     R0,     G_0180                  ; 5AAF   0240 0180
        ANDI    #$00E0, R0                      ; 5AB1   03B8 00E0
        CMPI    #$00A0, R0                      ; 5AB3   0378 00A0
        BEQ     L_5AC5                          ; 5AB5   0204 000E

        CMPI    #$0060, R0                      ; 5AB7   0378 0060
        BEQ     L_5AC5                          ; 5AB9   0204 000A

        CMPI    #$00C0, R0                      ; 5ABB   0378 00C0
        BEQ     L_5AC5                          ; 5ABD   0204 0006

        CLRR    R1                              ; 5ABF   01C9
        MVO     R1,     G_016D                  ; 5AC0   0241 016D
        J       L_5D1C                          ; 5AC2   0004 035C 011C

L_5AC5:
        MVI     G_016D, R0                      ; 5AC5   0280 016D
        TSTR    R0                              ; 5AC7   0080
        BNEQ    L_5D1F                          ; 5AC8   020C 0255

        INCR    R0                              ; 5ACA   0008
        MVO     R0,     G_016D                  ; 5ACB   0240 016D
        MVII    #$032E, R1                      ; 5ACD   02B9 032E
        MVI@    R1,     R0                      ; 5ACF   0288
        TSTR    R0                              ; 5AD0   0080
        BEQ     L_5AD9                          ; 5AD1   0204 0006

        MVII    #$0336, R1                      ; 5AD3   02B9 0336
        MVI@    R1,     R0                      ; 5AD5   0288
        TSTR    R0                              ; 5AD6   0080
        BNEQ    L_5D1F                          ; 5AD7   020C 0246

L_5AD9:
        JSR     R5,     .EXEC.766               ; 5AD9   0004 0114 0366

        MVII    #$0165, R2                      ; 5ADC   02BA 0165
        ADDR    R0,     R2                      ; 5ADE   00C2
        MVI     G_0165, R0                      ; 5ADF   0280 0165
        MVO@    R0,     R2                      ; 5AE1   0250
        INCR    R1                              ; 5AE2   0009
        MVI     G_031F, R2                      ; 5AE3   0282 031F
        ADDI    #$0300, R2                      ; 5AE5   02FA 0300
        MVO@    R2,     R1                      ; 5AE7   024A
        MVI     G_0320, R0                      ; 5AE8   0280 0320
        INCR    R1                              ; 5AEA   0009
        MVO@    R0,     R1                      ; 5AEB   0248
        SUBI    #$0003, R1                      ; 5AEC   0339 0003
        SWAP    R2,     1                       ; 5AEE   0042
        ANDI    #$00FF, R2                      ; 5AEF   03BA 00FF
        SUBI    #$0057, R2                      ; 5AF1   033A 0057
        SAR     R2,     1                       ; 5AF3   006A
        ADDI    #$0057, R2                      ; 5AF4   02FA 0057
        SWAP    R2,     1                       ; 5AF6   0042
        ADDI    #$000D, R2                      ; 5AF7   02FA 000D
        MVII    #$0040, R3                      ; 5AF9   02BB 0040

        JSR     R5,     .EXEC.9A8               ; 5AFB   0004 0118 01A8

        SDBD                                    ; 5AFE   0001
        MVII    #$180A, R0                      ; 5AFF   02B8 000A 0018
        MVO@    R0,     R1                      ; 5B02   0248
        INCR    R1                              ; 5B03   0009
        SDBD                                    ; 5B04   0001
        MVII    #$5B29, R0                      ; 5B05   02B8 0029 005B
        MVI     G_018A, R2                      ; 5B08   0282 018A
        CMPI    #$0008, R2                      ; 5B0A   037A 0008
        BNEQ    L_5B10                          ; 5B0C   020C 0002

        ADDI    #$000F, R0                      ; 5B0E   02F8 000F
L_5B10:
        MVO@    R0,     R1                      ; 5B10   0248

        JSR     R5,     L_5B17                  ; 5B11   0004 0158 0317

        J       L_5D1F                          ; 5B14   0004 035C 011F

L_5B17:
        PSHR    R5                              ; 5B17   0275

        JSR     R5,     X_PLAY_SFX1             ; 5B18   0004 0118 03BB
        DECLE   $00E9                           ; 5B1B  SFX data
        DECLE   $006D                           ; 5B1C  SFX data
        DECLE   $000F,  $0008                   ; 5B1D  SFX data
        DECLE   $0325                           ; 5B1F  SFX data
        DECLE   $0300,  $0070                   ; 5B20  SFX data
        DECLE   $0001,  $0060                   ; 5B22  SFX data
        DECLE   $03E2                           ; 5B24  SFX data
        DECLE   $03EA                           ; 5B25  SFX data
        DECLE   $008F,  $0010                   ; 5B26  SFX data
        DECLE   $03CF                           ; 5B28  SFX end

        DECLE   $0000,  $0000,  $00F7,  $005C   ; 5B29   0000 0000 00F7 005C
        DECLE   $0001,  $0046,  $0008,  $017A   ; 5B2D   0001 0046 0008 017A
        DECLE   $005C,  $017A,  $015C,  $037A   ; 5B31   005C 017A 015C 037A
        DECLE   $005C,  $037A,  $015C,  $0000   ; 5B35   005C 037A 015C 0000
        DECLE   $0000,  $00F7,  $005C,  $0001   ; 5B39   0000 00F7 005C 0001
        DECLE   $0046,  $0004                   ; 5B3D   0046 0004

        CMPR    R0,     R3                      ; 5B3F   0143
        CMPR    R3,     R3                      ; 5B40   015B
        CMP     G_005B, R3                      ; 5B41   0343 005B
        PSHR    R5                              ; 5B43   0275
        MVII    #$0165, R3                      ; 5B44   02BB 0165
        ADDR    R0,     R3                      ; 5B46   00C3
        MVI@    R3,     R0                      ; 5B47   0298
        CMPI    #$0002, R0                      ; 5B48   0378 0002
        BEQ     L_5B5D                          ; 5B4A   0204 0011

        CMPI    #$0001, R0                      ; 5B4C   0378 0001
        BNEQ    L_5C60                          ; 5B4E   020C 0110

        JSR     R5,     .EXEC.777               ; 5B50   0004 0114 0377

        MVI     G_0348, R2                      ; 5B53   0282 0348
        SWAP    R2,     1                       ; 5B55   0042
        ANDI    #$00FF, R2                      ; 5B56   03BA 00FF
        SUBR    R3,     R2                      ; 5B58   011A
        CMPI    #$0008, R2                      ; 5B59   037A 0008
        BC      L_5C60                          ; 5B5B   0201 0103

L_5B5D:
        JSR     R5,     L_5C61                  ; 5B5D   0004 015C 0061

        PULR    R7                              ; 5B60   02B7

L_5B61:
        JSR     R5,     L_5C61                  ; 5B61   0004 015C 0061

        MVII    #$0010, R0                      ; 5B64   02B8 0010
        MVO     R0,     G_0183                  ; 5B66   0240 0183
        MVII    #$0002, R0                      ; 5B68   02B8 0002

        JSR     R5,     X_RAND2                 ; 5B6A   0004 0114 029E

        MVO     R0,     G_0187                  ; 5B6D   0240 0187
        PULR    R7                              ; 5B6F   02B7

L_5B70:
        MVI     G_0165, R0                      ; 5B70   0280 0165
        CMPI    #$0001, R0                      ; 5B72   0378 0001
        BNEQ    L_5C60                          ; 5B74   020C 00EA

        MVI     G_018B, R5                      ; 5B76   0285 018B
        DECR    R5                              ; 5B78   0015
        BLE     L_5C60                          ; 5B79   0206 00E5

        MVO     R5,     G_018B                  ; 5B7B   0245 018B
        MVI     G_0346, R4                      ; 5B7D   0284 0346
        MVI     G_034E, R2                      ; 5B7F   0282 034E
        MVO     R4,     G_034E                  ; 5B81   0244 034E
        MVO     R2,     G_0346                  ; 5B83   0242 0346
        ADD     G_0193, R5                      ; 5B85   02C5 0193
        CMPI    #$0005, R5                      ; 5B87   037D 0005
        BGT     L_5B61                          ; 5B89   022E 0029

        MVI     G_0184, R5                      ; 5B8B   0285 0184
        TSTR    R5                              ; 5B8D   00AD
        BEQ     L_5BAA                          ; 5B8E   0204 001A

        MVII    #$0032, R0                      ; 5B90   02B8 0032

        JSR     R5,     L_5F5A                  ; 5B92   0004 015C 035A
        JSR     R5,     L_5240                  ; 5B95   0004 0150 0240

        MVII    #$0345, R3                      ; 5B98   02BB 0345

        JSR     R5,     L_5C9C                  ; 5B9A   0004 015C 009C

        SDBD                                    ; 5B9D   0001
        MVII    #$B0CE, R0                      ; 5B9E   02B8 00CE 00B0
        MVO     R0,     G_0345                  ; 5BA1   0240 0345
        MVII    #$033D, R1                      ; 5BA3   02B9 033D

        JSR     R5,     L_5CFA                  ; 5BA5   0004 015C 00FA

        B       L_5C3D                          ; 5BA8   0200 0093

L_5BAA:
        MVII    #$000A, R0                      ; 5BAA   02B8 000A

        JSR     R5,     L_5F5A                  ; 5BAC   0004 015C 035A

        MVII    #$0001, R0                      ; 5BAF   02B8 0001
        MVO     R0,     G_018B                  ; 5BB1   0240 018B
        MVII    #$0345, R1                      ; 5BB3   02B9 0345

        JSR     R5,     .EXEC.777               ; 5BB5   0004 0114 0377

        MOVR    R2,     R3                      ; 5BB8   0093
        SUBI    #$0050, R2                      ; 5BB9   033A 0050
        SAR     R2,     1                       ; 5BBB   006A
        ADDI    #$0054, R2                      ; 5BBC   02FA 0054
        MVO     R2,     G_0182                  ; 5BBE   0242 0182
        ADDR    R3,     R2                      ; 5BC0   00DA
        SLR     R2,     1                       ; 5BC1   0062
        SWAP    R2,     1                       ; 5BC2   0042
        ADDI    #$0018, R2                      ; 5BC3   02FA 0018
        MVII    #$0008, R3                      ; 5BC5   02BB 0008

        JSR     R5,     .EXEC.9A8               ; 5BC7   0004 0118 01A8

        SDBD                                    ; 5BCA   0001
        MVII    #$5BEA, R0                      ; 5BCB   02B8 00EA 005B
        MVO     R0,     G_0346                  ; 5BCE   0240 0346
        SDBD                                    ; 5BD0   0001
        MVII    #$5BF1, R0                      ; 5BD1   02B8 00F1 005B
        MVO     R0,     G_034E                  ; 5BD4   0240 034E
        SDBD                                    ; 5BD6   0001
        MVII    #$5BF8, R0                      ; 5BD7   02B8 00F8 005B
        MVO     R0,     G_0356                  ; 5BDA   0240 0356
        MVII    #$0031, R0                      ; 5BDC   02B8 0031
        MVO     R0,     G_034A                  ; 5BDE   0240 034A
        MVO     R0,     G_0352                  ; 5BE0   0240 0352
        MVO     R0,     G_035A                  ; 5BE2   0240 035A
        MVII    #$033D, R3                      ; 5BE4   02BB 033D

        JSR     R5,     L_5C9C                  ; 5BE6   0004 015C 009C

        PULR    R7                              ; 5BE9   02B7

        DECLE   $0000,  $0000,  $00FF,  $005B   ; 5BEA   0000 0000 00FF 005B
        DECLE   $0002,  $002E,  $0000,  $0000   ; 5BEE   0002 002E 0000 0000
        DECLE   $0000,  $00FF,  $005B,  $0002   ; 5BF2   0000 00FF 005B 0002
        DECLE   $0032,  $0000,  $0000,  $0000   ; 5BF6   0032 0000 0000 0000
        DECLE   $00FF,  $005B,  $0002,  $003E   ; 5BFA   00FF 005B 0002 003E
        DECLE   $0000                           ; 5BFE   0000

        PSHR    R5                              ; 5BFF   0275
        MVI     G_0182, R2                      ; 5C00   0282 0182
        SWAP    R2,     1                       ; 5C02   0042
        ADDI    #$0008, R2                      ; 5C03   02FA 0008
        MVII    #$0008, R3                      ; 5C05   02BB 0008

        JSR     R5,     .EXEC.9A8               ; 5C07   0004 0118 01A8

        SDBD                                    ; 5C0A   0001
        MVII    #$5C22, R4                      ; 5C0B   02BC 0022 005C

        JSR     R5,     L_54EC                  ; 5C0E   0004 0154 00EC

        SDBD                                    ; 5C11   0001
        MVII    #$5C29, R0                      ; 5C12   02B8 0029 005C
        MVO     R0,     G_034E                  ; 5C15   0240 034E
        SDBD                                    ; 5C17   0001
        MVII    #$5C30, R0                      ; 5C18   02B8 0030 005C
        MVO     R0,     G_0356                  ; 5C1B   0240 0356
        MVII    #$0004, R0                      ; 5C1D   02B8 0004
        MVO     R0,     G_0359                  ; 5C1F   0240 0359
        PULR    R7                              ; 5C21   02B7

        DECLE   $0000,  $0000,  $0037,  $005C   ; 5C22   0000 0000 0037 005C
        DECLE   $0002,  $002E,  $0000,  $0000   ; 5C26   0002 002E 0000 0000
        DECLE   $0000,  $0037,  $005C,  $0002   ; 5C2A   0000 0037 005C 0002
        DECLE   $0032,  $0000,  $0000,  $0000   ; 5C2E   0032 0000 0000 0000
        DECLE   $0037,  $005C,  $0002,  $003E   ; 5C32   0037 005C 0002 003E
        DECLE   $0000                           ; 5C36   0000

        PSHR    R5                              ; 5C37   0275
        MVII    #$0345, R1                      ; 5C38   02B9 0345

        JSR     R5,     L_5CFA                  ; 5C3A   0004 015C 00FA

L_5C3D:
        MVII    #$034D, R1                      ; 5C3D   02B9 034D

        JSR     R5,     L_5CFA                  ; 5C3F   0004 015C 00FA

        MVII    #$0355, R1                      ; 5C42   02B9 0355

        JSR     R5,     L_5CFA                  ; 5C44   0004 015C 00FA

        CLRR    R0                              ; 5C47   01C0
        MVO     R0,     G_018B                  ; 5C48   0240 018B
        PULR    R7                              ; 5C4A   02B7

L_5C4B:
        PSHR    R5                              ; 5C4B   0275
        MVII    #$0165, R4                      ; 5C4C   02BC 0165
        MOVR    R4,     R5                      ; 5C4E   00A5
        ADDR    R0,     R4                      ; 5C4F   00C4
        ADDR    R3,     R5                      ; 5C50   00DD
        SLL     R3,     2                       ; 5C51   004F
        SLL     R3,     1                       ; 5C52   004B
        ADDI    #$031E, R3                      ; 5C53   02FB 031E
        MVI@    R3,     R2                      ; 5C55   029A
        DECR    R3                              ; 5C56   0013
        ADDI    #$0007, R2                      ; 5C57   02FA 0007
        MVI@    R2,     R2                      ; 5C59   0292
        MVI@    R5,     R0                      ; 5C5A   02A8
        CMPI    #$0004, R0                      ; 5C5B   0378 0004
        BEQ     L_5C60                          ; 5C5D   0204 0001

        CMP@    R4,     R0                      ; 5C5F   0360
L_5C60:
        PULR    R7                              ; 5C60   02B7

L_5C61:
        SDBD                                    ; 5C61   0001
        MVII    #$904A, R0                      ; 5C62   02B8 004A 0090
        MVO@    R0,     R1                      ; 5C65   0248
        SDBD                                    ; 5C66   0001
        MVII    #$5C72, R0                      ; 5C67   02B8 0072 005C
        INCR    R1                              ; 5C6A   0009
        MVO@    R0,     R1                      ; 5C6B   0248
        ADDI    #$0005, R1                      ; 5C6C   02F9 0005
        MVII    #$0008, R0                      ; 5C6E   02B8 0008
        MVO@    R0,     R1                      ; 5C70   0248
        MOVR    R5,     R7                      ; 5C71   00AF

        DECLE   $0000,  $0000,  $00FA,  $005C   ; 5C72   0000 0000 00FA 005C
        DECLE   $0001,  $0042,  $0000,  $0000   ; 5C76   0001 0042 0000 0000

        PSHR    R5                              ; 5C7A   0275

        JSR     R5,     L_5C4B                  ; 5C7B   0004 015C 004B

        BNEQ    L_5C60                          ; 5C7E   022C 001F

        INCR    R1                              ; 5C80   0009
        CLRR    R0                              ; 5C81   01C0
        MVO@    R0,     R1                      ; 5C82   0248
        SLR     R2,     2                       ; 5C83   0066
        SLR     R2,     1                       ; 5C84   0062
        BEQ     L_5C99                          ; 5C85   0204 0012

        PSHR    R2                              ; 5C87   0272

        JSR     R5,     L_5C9C                  ; 5C88   0004 015C 009C

        PULR    R0                              ; 5C8B   02B0
        PSHR    R0                              ; 5C8C   0270

        JSR     R5,     L_5F5A                  ; 5C8D   0004 015C 035A

        PULR    R0                              ; 5C90   02B0
        CMPI    #$0003, R0                      ; 5C91   0378 0003
        BNEQ    L_5C60                          ; 5C93   022C 0034

        JSR     R5,     L_5F0C                  ; 5C95   0004 015C 030C

        PULR    R7                              ; 5C98   02B7

L_5C99:
        INCR    R3                              ; 5C99   000B
        MVO@    R0,     R3                      ; 5C9A   0258
        PULR    R7                              ; 5C9B   02B7

L_5C9C:
        PSHR    R5                              ; 5C9C   0275
        SDBD                                    ; 5C9D   0001
        MVII    #$619C, R0                      ; 5C9E   02B8 009C 0061
        MOVR    R3,     R4                      ; 5CA1   009C
        ADDI    #$0003, R3                      ; 5CA2   02FB 0003
        MVI@    R3,     R2                      ; 5CA4   029A
        SWAP    R2,     1                       ; 5CA5   0042
        ANDI    #$00FF, R2                      ; 5CA6   03BA 00FF
        CMPI    #$0037, R2                      ; 5CA8   037A 0037
        BGT     L_5CB0                          ; 5CAA   020E 0004

        SDBD                                    ; 5CAC   0001
        MVII    #$209C, R0                      ; 5CAD   02B8 009C 0020
L_5CB0:
        MVI@    R4,     R1                      ; 5CB0   02A1
        DECR    R4                              ; 5CB1   0014
        RLC     R1,     1                       ; 5CB2   0051
        RRC     R0,     1                       ; 5CB3   0070
        MVO@    R0,     R4                      ; 5CB4   0260
        SDBD                                    ; 5CB5   0001
        MVII    #$5CCE, R0                      ; 5CB6   02B8 00CE 005C
        MVO@    R0,     R4                      ; 5CB9   0260
        ADDI    #$0003, R4                      ; 5CBA   02FC 0003
        MVII    #$0100, R0                      ; 5CBC   02B8 0100
        MVO@    R0,     R4                      ; 5CBE   0260
        MVII    #$0008, R0                      ; 5CBF   02B8 0008
        MVO@    R0,     R4                      ; 5CC1   0260
        MOVR    R4,     R1                      ; 5CC2   00A1
        SLR     R1,     2                       ; 5CC3   0065
        SLR     R1,     1                       ; 5CC4   0061
        ADDI    #$0101, R1                      ; 5CC5   02F9 0101
        MVII    #$0007, R0                      ; 5CC7   02B8 0007
        MVO@    R0,     R1                      ; 5CC9   0248

        JSR     R5,     L_5FCC                  ; 5CCA   0004 015C 03CC

        PULR    R7                              ; 5CCD   02B7

        DECLE   $0000,  $0000,  $00FA,  $005C   ; 5CCE   0000 0000 00FA 005C
        DECLE   $0002,  $0042,  $0000,  $0000   ; 5CD2   0002 0042 0000 0000

        PSHR    R5                              ; 5CD6   0275
        MVI@    R1,     R2                      ; 5CD7   028A
        SDBD                                    ; 5CD8   0001
        XORI    #$2080, R2                      ; 5CD9   03FA 0080 0020
        MVO@    R2,     R1                      ; 5CDC   024A
        INCR    R1                              ; 5CDD   0009
        SDBD                                    ; 5CDE   0001
        MVII    #$593C, R2                      ; 5CDF   02BA 003C 0059
        MVO@    R2,     R1                      ; 5CE2   024A
        ADDI    #$0004, R1                      ; 5CE3   02F9 0004
        MVII    #$0080, R2                      ; 5CE5   02BA 0080
        MVO@    R2,     R1                      ; 5CE7   024A
        MVII    #$0020, R3                      ; 5CE8   02BB 0020
        SUBI    #$0005, R1                      ; 5CEA   0339 0005
        MVII    #$015D, R2                      ; 5CEC   02BA 015D
        ADDR    R0,     R2                      ; 5CEE   00C2
        MVI@    R2,     R2                      ; 5CEF   0292
        SWAP    R2,     1                       ; 5CF0   0042
        ADDI    #$0052, R2                      ; 5CF1   02FA 0052

        JSR     R5,     .EXEC.9A8               ; 5CF3   0004 0118 01A8

        PULR    R7                              ; 5CF6   02B7
        J       .EXEC.7AE                       ; 5CF7   0004 0314 03AE

L_5CFA:
        PSHR    R5                              ; 5CFA   0275
        MOVR    R1,     R2                      ; 5CFB   008A
        SDBD                                    ; 5CFC   0001
        MVII    #$5D04, R1                      ; 5CFD   02B9 0004 005D

        JSR     R5,     X_INIT_MOB              ; 5D00   0004 0114 02B2

        PULR    R7                              ; 5D03   02B7

        DECLE   $0048,  $0000,  $0014,  $005D   ; 5D04   0048 0000 0014 005D
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D08   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0C   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $00FF,  $00FF   ; 5D10   0002 0000 00FF 00FF
        DECLE   $0000,  $0000,  $00F7,  $005C   ; 5D14   0000 0000 00F7 005C
        DECLE   $0001,  $0047,  $0000,  $0000   ; 5D18   0001 0047 0000 0000
L_5D1C:
        TSTR    R0                              ; 5D1C   0080
        BNEQ    L_5D33                          ; 5D1D   020C 0014

L_5D1F:
        MVI     G_0180, R0                      ; 5D1F   0280 0180
        DECLE   $03B8,  $001F,  $0204,  $000F   ; 5D21   03B8 001F 0204 000F
        DECLE   $0001                           ; 5D25   0001

        MVII    #$006E, R4                      ; 5D26   02BC 006E
        SLLC    R1,     2                       ; 5D28   005D
        MVII    #$0010, R1                      ; 5D29   02B9 0010
L_5D2B:
        CMP@    R4,     R0                      ; 5D2B   0360
        BEQ     L_5D3B                          ; 5D2C   0204 000D

        ADDI    #$0005, R4                      ; 5D2E   02FC 0005
        DECR    R1                              ; 5D30   0011
        BNEQ    L_5D2B                          ; 5D31   022C 0007

L_5D33:
        CLRR    R0                              ; 5D33   01C0
        MVO     R0,     G_0322                  ; 5D34   0240 0322
        MVO     R0,     G_032A                  ; 5D36   0240 032A
        J       L_5DCE                          ; 5D38   0004 035C 01CE

L_5D3B:
        MVI@    R4,     R2                      ; 5D3B   02A2
        MVO     R2,     G_0322                  ; 5D3C   0242 0322
        MVO     R2,     G_032A                  ; 5D3E   0242 032A
        SDBD                                    ; 5D40   0001
        MVI@    R4,     R0                      ; 5D41   02A0
        ADD     G_031F, R0                      ; 5D42   02C0 031F
        MOVR    R0,     R1                      ; 5D44   0081
        SWAP    R1,     1                       ; 5D45   0041
        ANDI    #$00FF, R1                      ; 5D46   03B9 00FF
        CMPI    #$0010, R1                      ; 5D48   0379 0010
        BLT     L_5D54                          ; 5D4A   0205 0008

        CMPI    #$0090, R1                      ; 5D4C   0379 0090
        BGT     L_5D54                          ; 5D4E   020E 0004

        MVO     R0,     G_031F                  ; 5D50   0240 031F
        MVO     R0,     G_0327                  ; 5D52   0240 0327
L_5D54:
        MVI     G_018A, R1                      ; 5D54   0281 018A
        SARC    R1,     1                       ; 5D56   0079
        BC      L_5ECD                          ; 5D57   0201 0174

        SDBD                                    ; 5D59   0001
        MVI@    R4,     R0                      ; 5D5A   02A0
        ADD     G_0320, R0                      ; 5D5B   02C0 0320
        MOVR    R0,     R1                      ; 5D5D   0081
        SWAP    R1,     1                       ; 5D5E   0041
        ANDI    #$00FF, R1                      ; 5D5F   03B9 00FF
        CMPI    #$0036, R1                      ; 5D61   0379 0036
        BLT     L_5DCE                          ; 5D63   0205 0069

        CMPI    #$0055, R1                      ; 5D65   0379 0055
        BGT     L_5DCE                          ; 5D67   020E 0065

        MVO     R0,     G_0320                  ; 5D69   0240 0320
        J       L_5DCE                          ; 5D6B   0004 035C 01CE

        DECLE   $0002,  $0001,  $004D,  $0003   ; 5D6E   0002 0001 004D 0003
        DECLE   $0000,  $0000,  $0006,  $0001   ; 5D72   0000 0000 0006 0001
        DECLE   $000E,  $0003,  $00C4,  $0000   ; 5D76   000E 0003 00C4 0000
        DECLE   $0016,  $0001,  $0055,  $0002   ; 5D7A   0016 0001 0055 0002
        DECLE   $006A,  $0001,  $0014,  $0004   ; 5D7E   006A 0001 0014 0004
        DECLE   $0044,  $0001,  $00DA,  $0001   ; 5D82   0044 0001 00DA 0001
        DECLE   $0004,  $0004,  $0000,  $0000   ; 5D86   0004 0004 0000 0000
        DECLE   $0000,  $0002,  $000C,  $0004   ; 5D8A   0000 0002 000C 0004
        DECLE   $00BC,  $00FE,  $00DA,  $0001   ; 5D8E   00BC 00FE 00DA 0001
        DECLE   $001C,  $0002,  $00AB,  $00FD   ; 5D92   001C 0002 00AB 00FD
        DECLE   $006A,  $0001,  $0018,  $0002   ; 5D96   006A 0001 0018 0002
        DECLE   $00F2,  $00FC,  $00C4,  $0000   ; 5D9A   00F2 00FC 00C4 0000
        DECLE   $0008,  $0002,  $00B3,  $00FC   ; 5D9E   0008 0002 00B3 00FC
        DECLE   $0000,  $0000,  $0009,  $0002   ; 5DA2   0000 0000 0009 0002
        DECLE   $00F2,  $00FC,  $003C,  $00FF   ; 5DA6   00F2 00FC 003C 00FF
        DECLE   $0019,  $0002,  $00AB,  $00FD   ; 5DAA   0019 0002 00AB 00FD
        DECLE   $0096,  $00FE,  $0011,  $0003   ; 5DAE   0096 00FE 0011 0003
        DECLE   $00BC,  $00FE,  $0026,  $00FE   ; 5DB2   00BC 00FE 0026 00FE
        DECLE   $0001,  $0003,  $0000,  $0000   ; 5DB6   0001 0003 0000 0000
        DECLE   $0000,  $00FE,  $0003,  $0003   ; 5DBA   0000 00FE 0003 0003
        DECLE   $0044,  $0001,  $0026,  $00FE   ; 5DBE   0044 0001 0026 00FE
        DECLE   $0013,  $0001,  $0055,  $0002   ; 5DC2   0013 0001 0055 0002
        DECLE   $0096,  $00FE,  $0012,  $0001   ; 5DC6   0096 00FE 0012 0001
        DECLE   $000E,  $0003,  $003C,  $00FF   ; 5DCA   000E 0003 003C 00FF
L_5DCE:
        MVI     G_018F, R0                      ; 5DCE   0280 018F
        MVII    #$01FF, R1                      ; 5DD0   02B9 01FF
        TSTR    R0                              ; 5DD2   0080
        BEQ     L_5DD6                          ; 5DD3   0204 0001

        DECR    R1                              ; 5DD5   0011
L_5DD6:
        MVI@    R1,     R0                      ; 5DD6   0288
        COMR    R0                              ; 5DD7   0018
        ANDI    #$00FF, R0                      ; 5DD8   03B8 00FF
        CMPI    #$0088, R0                      ; 5DDA   0378 0088
        BNEQ    L_5DFC                          ; 5DDC   020C 001E

        MVI     G_017D, R0                      ; 5DDE   0280 017D
        INCR    R0                              ; 5DE0   0008
        CMPI    #$0002, R0                      ; 5DE1   0378 0002
        BGT     L_5DE8                          ; 5DE3   020E 0003

        MVO     R0,     G_017D                  ; 5DE5   0240 017D
        PULR    R7                              ; 5DE7   02B7

L_5DE8:
        JSR     R5,     L_5FE7                  ; 5DE8   0004 015C 03E7

        MVI     G_018F, R0                      ; 5DEB   0280 018F
        MVII    #$01FF, R1                      ; 5DED   02B9 01FF
        TSTR    R0                              ; 5DEF   0080
        BEQ     L_5DF3                          ; 5DF0   0204 0001

        DECR    R1                              ; 5DF2   0011
L_5DF3:
        MVI@    R1,     R0                      ; 5DF3   0288
        COMR    R0                              ; 5DF4   0018
        ANDI    #$00FF, R0                      ; 5DF5   03B8 00FF
        CMPI    #$0028, R0                      ; 5DF7   0378 0028
        BNEQ    L_5DF3                          ; 5DF9   022C 0007
        PULR    R7                              ; 5DFB   02B7

L_5DFC:
        CLRR    R0                              ; 5DFC   01C0
        MVO     R0,     G_017D                  ; 5DFD   0240 017D
        PULR    R7                              ; 5DFF   02B7

L_5E00:
        PSHR    R5                              ; 5E00   0275
        CLRR    R0                              ; 5E01   01C0
        MVO     R0,     G_0188                  ; 5E02   0240 0188
        MVO     R0,     G_0126                  ; 5E04   0240 0126
        MVO     R0,     G_0128                  ; 5E06   0240 0128
        PULR    R7                              ; 5E08   02B7

        MVI     G_018A, R0                      ; 5E09   0280 018A
        ANDI    #$0003, R0                      ; 5E0B   03B8 0003
        CMPI    #$0002, R0                      ; 5E0D   0378 0002
        BEQ     L_5E1D                          ; 5E0F   0204 000C

        MVII    #$0004, R0                      ; 5E11   02B8 0004
        MVII    #$033D, R3                      ; 5E13   02BB 033D
L_5E15:
        MVI@    R3,     R2                      ; 5E15   029A
        ANDR    R1,     R2                      ; 5E16   018A
        MVO@    R2,     R3                      ; 5E17   025A
        ADDI    #$0008, R3                      ; 5E18   02FB 0008
        DECR    R0                              ; 5E1A   0010
        BNEQ    L_5E15                          ; 5E1B   022C 0007

L_5E1D:
        MVII    #$0333, R1                      ; 5E1D   02B9 0333
        MVII    #$019A, R4                      ; 5E1F   02BC 019A
        MVII    #$0006, R2                      ; 5E21   02BA 0006
L_5E23:
        MVI@    R4,     R0                      ; 5E23   02A0
        MVO@    R0,     R1                      ; 5E24   0248
        ADDI    #$0008, R1                      ; 5E25   02F9 0008
        DECR    R2                              ; 5E27   0012
        BNEQ    L_5E23                          ; 5E28   022C 0006

        MVII    #$0342, R1                      ; 5E2A   02B9 0342
        MVII    #$01A0, R4                      ; 5E2C   02BC 01A0
        MVII    #$0003, R2                      ; 5E2E   02BA 0003
L_5E30:
        MVI@    R4,     R0                      ; 5E30   02A0
        SWAP    R0,     1                       ; 5E31   0040
        ADD@    R4,     R0                      ; 5E32   02E0
        SWAP    R0,     1                       ; 5E33   0040
        MVO@    R0,     R1                      ; 5E34   0248
        ADDI    #$0008, R1                      ; 5E35   02F9 0008
        DECR    R2                              ; 5E37   0012
        BNEQ    L_5E30                          ; 5E38   022C 0009
        PULR    R7                              ; 5E3A   02B7

L_5E3B:
        PSHR    R5                              ; 5E3B   0275
        MVII    #$0080, R0                      ; 5E3C   02B8 0080
        MVO     R0,     G_0126                  ; 5E3E   0240 0126
        MVO     R0,     G_0128                  ; 5E40   0240 0128
        MVII    #$019A, R4                      ; 5E42   02BC 019A
        MVII    #$032D, R1                      ; 5E44   02B9 032D
        MVII    #$0006, R2                      ; 5E46   02BA 0006
L_5E48:
        MVI@    R1,     R0                      ; 5E48   0288
        SLL     R0,     1                       ; 5E49   0048
        SETC                                    ; 5E4A   0007
        RRC     R0,     1                       ; 5E4B   0070
        MVO@    R0,     R1                      ; 5E4C   0248
        ADDI    #$0006, R1                      ; 5E4D   02F9 0006
        MVI@    R1,     R0                      ; 5E4F   0288
        MVO@    R0,     R4                      ; 5E50   0260
        CLRR    R0                              ; 5E51   01C0
        MVO@    R0,     R1                      ; 5E52   0248
        ADDI    #$0002, R1                      ; 5E53   02F9 0002
        DECR    R2                              ; 5E55   0012
        BNEQ    L_5E48                          ; 5E56   022C 000F

        MVII    #$0342, R1                      ; 5E58   02B9 0342
        MVII    #$01A0, R4                      ; 5E5A   02BC 01A0
        MVII    #$0004, R2                      ; 5E5C   02BA 0004
L_5E5E:
        MVI@    R1,     R0                      ; 5E5E   0288
        MVO@    R0,     R4                      ; 5E5F   0260
        SWAP    R0,     1                       ; 5E60   0040
        MVO@    R0,     R4                      ; 5E61   0260
        SWAP    R0,     1                       ; 5E62   0040
        ANDI    #$000F, R0                      ; 5E63   03B8 000F
        MVO@    R0,     R1                      ; 5E65   0248
        ADDI    #$0008, R1                      ; 5E66   02F9 0008
        DECR    R2                              ; 5E68   0012
        BNEQ    L_5E5E                          ; 5E69   022C 000C

        MVII    #$0001, R0                      ; 5E6B   02B8 0001
        MVO     R0,     G_0188                  ; 5E6D   0240 0188
        PULR    R7                              ; 5E6F   02B7

L_5E70:
        PSHR    R5                              ; 5E70   0275
        MVII    #$028B, R2                      ; 5E71   02BA 028B
        MVII    #$0278, R3                      ; 5E73   02BB 0278
        MVI     G_0320, R1                      ; 5E75   0281 0320
        MVI     G_018A, R0                      ; 5E77   0280 018A
        SARC    R0,     1                       ; 5E79   0078
        BNC     L_5E88                          ; 5E7A   0209 000C

        MVII    #$0060, R0                      ; 5E7C   02B8 0060
        SDBD                                    ; 5E7E   0001
        CMPI    #$4680, R1                      ; 5E7F   0379 0080 0046
        BLT     L_5E85                          ; 5E82   0205 0001

        NEGR    R0                              ; 5E84   0020
L_5E85:
        ADDR    R0,     R1                      ; 5E85   00C1
        MVO     R1,     G_0320                  ; 5E86   0241 0320
L_5E88:
        SWAP    R1,     1                       ; 5E88   0041
        ANDI    #$00FF, R1                      ; 5E89   03B9 00FF
        SUBI    #$0036, R1                      ; 5E8B   0339 0036
        BMI     L_5ECD                          ; 5E8D   020B 003E

        PSHR    R1                              ; 5E8F   0271
        SLR     R1,     1                       ; 5E90   0061
        MOVR    R1,     R0                      ; 5E91   0088
        SLR     R0,     2                       ; 5E92   0064
        MVO     R0,     G_0165                  ; 5E93   0240 0165
        SDBD                                    ; 5E95   0001
        MVII    #$5EDA, R5                      ; 5E96   02BD 00DA 005E
        ADDR    R0,     R5                      ; 5E99   00C5
        MVI@    R5,     R0                      ; 5E9A   02A8
        SWAP    R0,     1                       ; 5E9B   0040
        CLRR    R5                              ; 5E9C   01ED
L_5E9D:
        SUBI    #$0004, R1                      ; 5E9D   0339 0004
        BMI     L_5EA9                          ; 5E9F   020B 0008

        MVO@    R5,     R2                      ; 5EA1   0255
        MVO@    R5,     R3                      ; 5EA2   025D
        ADDI    #$0014, R2                      ; 5EA3   02FA 0014
        ADDI    #$0014, R3                      ; 5EA5   02FB 0014
        B       L_5E9D                          ; 5EA7   0220 000B

L_5EA9:
        SDBD                                    ; 5EA9   0001
        MVII    #$5EDA, R4                      ; 5EAA   02BC 00DA 005E
        ADDR    R1,     R4                      ; 5EAD   00CC
        MVI@    R4,     R1                      ; 5EAE   02A1
        ADDR    R0,     R1                      ; 5EAF   00C1
        MVO@    R1,     R2                      ; 5EB0   0251
        MVO@    R1,     R3                      ; 5EB1   0259
        ADDI    #$0130, R0                      ; 5EB2   02F8 0130
L_5EB4:
        ADDI    #$0014, R2                      ; 5EB4   02FA 0014
        ADDI    #$0014, R3                      ; 5EB6   02FB 0014
        MVO@    R0,     R2                      ; 5EB8   0250
        MVO@    R0,     R3                      ; 5EB9   0258
        CMPI    #$02C8, R3                      ; 5EBA   037B 02C8
        BLT     L_5EB4                          ; 5EBC   0225 0009

        JSR     R5,     L_5ECE                  ; 5EBE   0004 015C 02CE

        PULR    R0                              ; 5EC1   02B0
        MVI     G_0146, R1                      ; 5EC2   0281 0146
        CMPI    #$0040, R1                      ; 5EC4   0379 0040
        BGT     L_5ECD                          ; 5EC6   020E 0005

        SLL     R0,     1                       ; 5EC8   0048
        ADDI    #$0010, R0                      ; 5EC9   02F8 0010
        MVO     R0,     G_0155                  ; 5ECB   0240 0155
L_5ECD:
        PULR    R7                              ; 5ECD   02B7

L_5ECE:
        PSHR    R5                              ; 5ECE   0275

        JSR     R5,     X_PLAY_SFX2             ; 5ECF   0004 0118 03BE
        DECLE   $0040                           ; 5ED2  SFX prio
        DECLE   $01F9                           ; 5ED3  SFX data
        DECLE   $0295                           ; 5ED4  SFX data
        DECLE   $03CF                           ; 5ED5  SFX end


        SUBR    R6,     R0                      ; 5ED6   0130
        SUBR    R5,     R0                      ; 5ED7   0128
        SUBR    R4,     R0                      ; 5ED8   0120
        SUBR    R3,     R0                      ; 5ED9   0118
        COMR    R4                              ; 5EDA   001C
        INCR    R4                              ; 5EDB   000C
        RSWD    R0                              ; 5EDC   0038
        RSWD    R6                              ; 5EDD   003E
L_5EDE:
        PSHR    R5                              ; 5EDE   0275
        MVII    #$0005, R0                      ; 5EDF   02B8 0005
        MVII    #$02DE, R4                      ; 5EE1   02BC 02DE

        JSR     R5,     X_FILL_ZERO             ; 5EE3   0004 0114 0338

        MVI     G_0190, R0                      ; 5EE6   0280 0190
        DECR    R0                              ; 5EE8   0010
        BLE     L_5ECD                          ; 5EE9   0226 001D

        SDBD                                    ; 5EEB   0001
        MVII    #$08C6, R1                      ; 5EEC   02B9 00C6 0008
        MVII    #$02DE, R4                      ; 5EEF   02BC 02DE

        JSR     R5,     X_FILL_MEM              ; 5EF1   0004 0114 0341

        PULR    R7                              ; 5EF4   02B7

L_5EF5:
        PSHR    R5                              ; 5EF5   0275
        MVI     G_018A, R0                      ; 5EF6   0280 018A
        SARC    R0,     1                       ; 5EF8   0078
        BC      L_5ECD                          ; 5EF9   0221 002D

        MVI     G_018E, R1                      ; 5EFB   0281 018E
        DECR    R1                              ; 5EFD   0011
        MVO     R1,     G_018E                  ; 5EFE   0241 018E
        BPL     L_5F1B                          ; 5F00   0203 0019

        MVII    #$0080, R0                      ; 5F02   02B8 0080
        MVO     R0,     G_0128                  ; 5F04   0240 0128

        JSR     R5,     L_5E3B                  ; 5F06   0004 015C 023B

        J       L_521F                          ; 5F09   0004 0350 021F

L_5F0C:
        PSHR    R5                              ; 5F0C   0275
        MVI     G_018E, R1                      ; 5F0D   0281 018E
        ADDI    #$000C, R1                      ; 5F0F   02F9 000C
        CMPI    #$0048, R1                      ; 5F11   0379 0048
        BLE     L_5F17                          ; 5F13   0206 0002

        MVII    #$0048, R1                      ; 5F15   02B9 0048
L_5F17:
        MVO     R1,     G_018E                  ; 5F17   0241 018E
        INCR    R7                              ; 5F19   000F

L_5F1A:
        PSHR    R5                              ; 5F1A   0275
L_5F1B:
        MVII    #$02E6, R3                      ; 5F1B   02BB 02E6
        SDBD                                    ; 5F1D   0001
        MVII    #$0818, R2                      ; 5F1E   02BA 0018 0008
        MVII    #$0004, R0                      ; 5F21   02B8 0004
        MVI     G_018E, R1                      ; 5F23   0281 018E
        CLRC                                    ; 5F25   0006
        RRC     R1,     1                       ; 5F26   0071
        BC      L_5F2F                          ; 5F27   0201 0006

        CMPI    #$000A, R1                      ; 5F29   0379 000A
        BGT     L_5F2F                          ; 5F2B   020E 0002

        MVII    #$0002, R0                      ; 5F2D   02B8 0002
L_5F2F:
        ADDR    R0,     R2                      ; 5F2F   00C2
L_5F30:
        SUBI    #$0004, R1                      ; 5F30   0339 0004
        BMI     L_5F38                          ; 5F32   020B 0004

        MVO@    R2,     R3                      ; 5F34   025A
        INCR    R3                              ; 5F35   000B
        B       L_5F30                          ; 5F36   0220 0007

L_5F38:
        SLL     R1,     1                       ; 5F38   0049
        SDBD                                    ; 5F39   0001
        MVII    #$5F5A, R4                      ; 5F3A   02BC 005A 005F
        ADDR    R1,     R4                      ; 5F3D   00CC
        SDBD                                    ; 5F3E   0001
        MVI@    R4,     R1                      ; 5F3F   02A1
        ADDR    R0,     R1                      ; 5F40   00C1
        MVO@    R1,     R3                      ; 5F41   0259
        CMPI    #$0002, R0                      ; 5F42   0378 0002
        BNEQ    L_5ECD                          ; 5F44   022C 0078

        MVII    #$0008, R0                      ; 5F46   02B8 0008

        JSR     R5,     X_PLAY_SFX2             ; 5F48   0004 0118 03BE
        DECLE   $0058                           ; 5F4B  SFX prio
        DECLE   $02C8,  $0060                   ; 5F4C  SFX data
        DECLE   $01D9                           ; 5F4E  SFX data
        DECLE   $00C3,  $03F8                   ; 5F4F  SFX data
        DECLE   $03CF                           ; 5F51  SFX end

        DECLE   $0000,  $0000                   ; 5F52   0000 0000

        SLR     R0,     1                       ; 5F54   0060
        INCR    R0                              ; 5F55   0008
        MOVR    R4,     R0                      ; 5F56   00A0
        INCR    R0                              ; 5F57   0008
        GSWD    R0                              ; 5F58   0030
        INCR    R0                              ; 5F59   0008
L_5F5A:
        PSHR    R5                              ; 5F5A   0275
        PSHR    R3                              ; 5F5B   0273
        MVI     G_018F, R1                      ; 5F5C   0281 018F
        TSTR    R1                              ; 5F5E   0089
        BNEQ    L_5F70                          ; 5F5F   020C 000F

        MVII    #$0211, R4                      ; 5F61   02BC 0211
        ADD     G_0317, R0                      ; 5F63   02C0 0317
        SDBD                                    ; 5F65   0001
        CMPI    #$2710, R0                      ; 5F66   0378 0010 0027
        BLT     L_5F6C                          ; 5F69   0205 0001

        CLRR    R0                              ; 5F6B   01C0
L_5F6C:
        MVO     R0,     G_0317                  ; 5F6C   0240 0317
        B       L_5F7D                          ; 5F6E   0200 000D

L_5F70:
        MVII    #$0209, R4                      ; 5F70   02BC 0209
        ADD     G_0318, R0                      ; 5F72   02C0 0318
        SDBD                                    ; 5F74   0001
        CMPI    #$2710, R0                      ; 5F75   0378 0010 0027
        BLT     L_5F7B                          ; 5F78   0205 0001

        CLRR    R0                              ; 5F7A   01C0
L_5F7B:
        MVO     R0,     G_0318                  ; 5F7B   0240 0318
L_5F7D:
        MVII    #$0087, R1                      ; 5F7D   02B9 0087
        MVO@    R1,     R4                      ; 5F7F   0261
        MVO@    R1,     R4                      ; 5F80   0261
        SUBI    #$0006, R4                      ; 5F81   033C 0006
        CMPI    #$0064, R0                      ; 5F83   0378 0064
        BLT     L_5F9B                          ; 5F85   0205 0014

        MVI     G_0194, R1                      ; 5F87   0281 0194
        TSTR    R1                              ; 5F89   0089
        BNEQ    L_5F9B                          ; 5F8A   020C 000F

        INCR    R1                              ; 5F8C   0009
        MVO     R1,     G_0194                  ; 5F8D   0241 0194
        MVI     G_0190, R1                      ; 5F8F   0281 0190
        INCR    R1                              ; 5F91   0009
        MVO     R1,     G_0190                  ; 5F92   0241 0190
        PSHR    R0                              ; 5F94   0270
        PSHR    R4                              ; 5F95   0274

        JSR     R5,     L_5EDE                  ; 5F96   0004 015C 02DE

        PULR    R4                              ; 5F99   02B4
        PULR    R0                              ; 5F9A   02B0
L_5F9B:
        MVII    #$0004, R1                      ; 5F9B   02B9 0004
        MVII    #$0007, R3                      ; 5F9D   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5F9F   0004 0118 00C5

        PULR    R3                              ; 5FA2   02B3
        PULR    R7                              ; 5FA3   02B7

L_5FA4:
        MVII    #$033E, R1                      ; 5FA4   02B9 033E
L_5FA6:
        MVI@    R1,     R2                      ; 5FA6   028A
        TSTR    R2                              ; 5FA7   0092
        BEQ     L_5FC5                          ; 5FA8   0204 001B

        MOVR    R1,     R3                      ; 5FAA   008B
        ADDI    #$0002, R3                      ; 5FAB   02FB 0002
        MVI@    R3,     R3                      ; 5FAD   029B
        SWAP    R3,     1                       ; 5FAE   0043
        CMPI    #$0058, R3                      ; 5FAF   037B 0058
        BEQ     L_5FC5                          ; 5FB1   0204 0012

        SDBD                                    ; 5FB3   0001
        SUBI    #$5924, R2                      ; 5FB4   033A 0024 0059
        BLT     L_5FC5                          ; 5FB7   0205 000C

        CMPI    #$0010, R2                      ; 5FB9   037A 0010
        BGT     L_5FC5                          ; 5FBB   020E 0008

        ADDI    #$0004, R1                      ; 5FBD   02F9 0004
        MVI@    R1,     R2                      ; 5FBF   028A
        XORI    #$0008, R2                      ; 5FC0   03FA 0008
        MVO@    R2,     R1                      ; 5FC2   024A
        SUBI    #$0004, R1                      ; 5FC3   0339 0004
L_5FC5:
        ADDI    #$0008, R1                      ; 5FC5   02F9 0008
        CMPI    #$0356, R1                      ; 5FC7   0379 0356
        BLT     L_5FA6                          ; 5FC9   0225 0024
        MOVR    R5,     R7                      ; 5FCB   00AF

L_5FCC:
        JSR     R5,     X_PLAY_SFX2             ; 5FCC   0004 0118 03BE
        DECLE   $0088                           ; 5FCF  SFX prio
        DECLE   $0079                           ; 5FD0  SFX data
        DECLE   $03ED                           ; 5FD1  SFX data
        DECLE   $021D                           ; 5FD2  SFX data
        DECLE   $0345                           ; 5FD3  SFX data
        DECLE   $0365                           ; 5FD4  SFX data
        DECLE   $03E2                           ; 5FD5  SFX data
        DECLE   $03EA                           ; 5FD6  SFX data
        DECLE   $00C3,  $03F8                   ; 5FD7  SFX data
        DECLE   $03CF                           ; 5FD9  SFX end

L_5FDA:
        JSR     R5,     X_PLAY_SFX2             ; 5FDA   0004 0118 03BE
        DECLE   $0080                           ; 5FDD  SFX prio
        DECLE   $01E9                           ; 5FDE  SFX data
        DECLE   $0300,  $0040                   ; 5FDF  SFX data
        DECLE   $0001,  $0060                   ; 5FE1  SFX data
        DECLE   $03E2                           ; 5FE3  SFX data
        DECLE   $008F,  $0008                   ; 5FE4  SFX data
        DECLE   $03CF                           ; 5FE6  SFX end

L_5FE7:
        PSHR    R5                              ; 5FE7   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FE8   0004 0118 03BE
        DECLE   $00E0                           ; 5FEB  SFX prio
        DECLE   $03F9                           ; 5FEC  SFX data
        DECLE   $02CF                           ; 5FED  SFX end

L_5FEE:
        MVI     G_017E, R0                      ; 5FEE   0280 017E
        MOVR    R0,     R1                      ; 5FF0   0081
        MOVR    R0,     R2                      ; 5FF1   0082
        SWAP    R1,     1                       ; 5FF2   0041
        TSTR    R1                              ; 5FF3   0089
        BPL     L_5FF7                          ; 5FF4   0203 0001

        INCR    R2                              ; 5FF6   000A
L_5FF7:
        SLL     R1,     1                       ; 5FF7   0049
        BPL     L_5FFB                          ; 5FF8   0203 0001

        INCR    R2                              ; 5FFA   000A
L_5FFB:
        SLL     R1,     1                       ; 5FFB   0049
        BPL     L_5FFF                          ; 5FFC   0203 0001

        INCR    R2                              ; 5FFE   000A
L_5FFF:
        RRC     R2,     1                       ; 5FFF   0072
        RLC     R0,     1                       ; 6000   0050
        MVO     R0,     G_017E                  ; 6001   0240 017E
        MOVR    R5,     R7                      ; 6003   00AF

L_6004:
        PSHR    R5                              ; 6004   0275

        JSR     R5,     .EXEC.777               ; 6005   0004 0114 0377

        ADDI    #$0005, R2                      ; 6008   02FA 0005
        ADDI    #$0003, R3                      ; 600A   02FB 0003
        MVII    #$01EB, R1                      ; 600C   02B9 01EB
        SLR     R2,     2                       ; 600E   0066
        SLR     R2,     1                       ; 600F   0062
        ADDR    R2,     R1                      ; 6010   00D1
        ANDI    #$00F8, R3                      ; 6011   03BB 00F8
        ADDR    R3,     R1                      ; 6013   00D9
        ADDR    R3,     R1                      ; 6014   00D9
        SLR     R3,     1                       ; 6015   0063
        ADDR    R3,     R1                      ; 6016   00D9
        PULR    R7                              ; 6017   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6018   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 601C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $03FF   ; 6020   0000 0000 0000 03FF
        DECLE   $0000,  $03FB,  $0000,  $03FF   ; 6024   0000 03FB 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6028   0000 03FF 0000 03FF
        DECLE   $0000,  $03BF,  $0000,  $03FF   ; 602C   0000 03BF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6030   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6034   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6038   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 603C   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6040   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6044   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6048   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 604C   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6050   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0001,  $03FF   ; 6054   0000 03FF 0001 03FF
        DECLE   $0000,  $03FF,  $0040,  $03FF   ; 6058   0000 03FF 0040 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 605C   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03BF   ; 6060   0000 03FF 0000 03BF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6064   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6068   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 606C   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6070   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6074   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6078   0000 03FF 0000 03FF
        DECLE   $0000,  $03BF,  $0000,  $03FF   ; 607C   0000 03BF 0000 03FF
        DECLE   $0000,  $03FF,  $0080,  $03FF   ; 6080   0000 03FF 0080 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6084   0000 03FF 0000 03FF
        DECLE   $0000,  $03FE,  $0000,  $037F   ; 6088   0000 03FE 0000 037F
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 608C   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0020,  $03FF   ; 6090   0000 03FF 0020 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6094   0000 03FF 0000 03FF
        DECLE   $0000,  $02FF,  $0000,  $03FF   ; 6098   0000 02FF 0000 03FF
        DECLE   $0000,  $03BF,  $0000,  $03FF   ; 609C   0000 03BF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60A0   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60A4   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60A8   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60AC   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60B0   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60B4   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60B8   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60BC   0000 03FF 0000 03FF
        DECLE   $0000,  $03FE,  $0000,  $03FF   ; 60C0   0000 03FE 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60C4   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60C8   0000 03FF 0000 03FF
        DECLE   $0000,  $037F,  $0000,  $03FF   ; 60CC   0000 037F 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60D0   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60D4   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60D8   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60DC   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60E0   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60E4   0000 03FF 0000 03FF
        DECLE   $0002,  $03FF,  $0000,  $03FF   ; 60E8   0002 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60EC   0000 03FF 0000 03FF
        DECLE   $0000,  $03FE,  $0000,  $03FF   ; 60F0   0000 03FE 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60F4   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 60F8   0000 03FF 0000 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FD   ; 60FC   0000 03FF 0000 03FD
        DECLE   $0000,  $0000,  $0008,  $0008   ; 6100   0000 0000 0008 0008
        DECLE   $001C,  $001C,  $007F,  $007F   ; 6104   001C 001C 007F 007F
        DECLE   $0008,  $0008,  $001C,  $001C   ; 6108   0008 0008 001C 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 610C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0068,  $0068   ; 6110   0000 0000 0068 0068
        DECLE   $0038,  $0038,  $001C,  $001C   ; 6114   0038 0038 001C 001C
        DECLE   $000E,  $000E,  $000B,  $000B   ; 6118   000E 000E 000B 000B
        DECLE   $001C,  $001C,  $0000,  $0000   ; 611C   001C 001C 0000 0000
        DECLE   $0000,  $0000,  $000B,  $000B   ; 6120   0000 0000 000B 000B
        DECLE   $000E,  $000E,  $001C,  $001C   ; 6124   000E 000E 001C 001C
        DECLE   $0038,  $0038,  $0068,  $0068   ; 6128   0038 0038 0068 0068
        DECLE   $001C,  $001C,  $0000,  $0000   ; 612C   001C 001C 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0008   ; 6130   0000 0000 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 6134   0008 0008 0008 0008
        DECLE   $007F,  $007F,  $0008,  $0008   ; 6138   007F 007F 0008 0008
        DECLE   $001C,  $001C,  $0000,  $0000   ; 613C   001C 001C 0000 0000
        DECLE   $0008,  $0008,  $0008,  $0008   ; 6140   0008 0008 0008 0008
        DECLE   $001C,  $001C,  $003E,  $003E   ; 6144   001C 001C 003E 003E
        DECLE   $007F,  $007F,  $0008,  $0008   ; 6148   007F 007F 0008 0008
        DECLE   $001C,  $001C,  $0000,  $0000   ; 614C   001C 001C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6150   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $0042,  $0042   ; 6154   003C 003C 0042 0042
        DECLE   $007E,  $007E,  $007E,  $007E   ; 6158   007E 007E 007E 007E
        DECLE   $003C,  $003C,  $0000,  $0000   ; 615C   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 6160   0000 0000 007E 007E
        DECLE   $0081,  $0081,  $00FF,  $00FF   ; 6164   0081 0081 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6168   00FF 00FF 00FF 00FF
        DECLE   $007E,  $007E,  $0000,  $0000   ; 616C   007E 007E 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 6170   0000 0000 0004 0004
        DECLE   $004C,  $004C,  $0038,  $0038   ; 6174   004C 004C 0038 0038
        DECLE   $0034,  $0034,  $006C,  $006C   ; 6178   0034 0034 006C 006C
        DECLE   $000C,  $000C,  $001E,  $001E   ; 617C   000C 000C 001E 001E
        DECLE   $0004,  $0004,  $008C,  $008C   ; 6180   0004 0004 008C 008C
        DECLE   $005C,  $005C,  $0038,  $0038   ; 6184   005C 005C 0038 0038
        DECLE   $0074,  $0074,  $00EC,  $00EC   ; 6188   0074 0074 00EC 00EC
        DECLE   $000C,  $000C,  $003F,  $003F   ; 618C   000C 000C 003F 003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6190   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $003C,  $003C   ; 6194   0018 0018 003C 003C
        DECLE   $0042,  $0042,  $007E,  $007E   ; 6198   0042 0042 007E 007E
        DECLE   $0024,  $0024,  $0066,  $0066   ; 619C   0024 0024 0066 0066
        DECLE   $0000,  $0000,  $003C,  $003C   ; 61A0   0000 0000 003C 003C
        DECLE   $007E,  $007E,  $0081,  $0081   ; 61A4   007E 007E 0081 0081
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 61A8   00FF 00FF 00FF 00FF

        NEGR    R4                              ; 61AC   0024
        NEGR    R4                              ; 61AD   0024
        ADDR    R4,     R7                      ; 61AE   00E7
        ADDR    R4,     R7                      ; 61AF   00E7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 61B0   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; 61B4   0018 0018 0024 0024
        DECLE   $007E,  $007E,  $0024,  $0024   ; 61B8   007E 007E 0024 0024
        DECLE   $0018,  $0018,  $0000,  $0000   ; 61BC   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61C0   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $0042,  $0042   ; 61C4   003C 003C 0042 0042
        DECLE   $00FF,  $00FF,  $0042,  $0042   ; 61C8   00FF 00FF 0042 0042
        DECLE   $003C,  $003C,  $0000,  $0000   ; 61CC   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61D0   0000 0000 0000 0000
        DECLE   $0038,  $0038,  $0010,  $0010   ; 61D4   0038 0038 0010 0010
        DECLE   $003C,  $003C,  $0042,  $0042   ; 61D8   003C 003C 0042 0042
        DECLE   $003C,  $003C,  $0000,  $0000   ; 61DC   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0081   ; 61E0   0000 0000 0081 0081
        DECLE   $007E,  $007E,  $0018,  $0018   ; 61E4   007E 007E 0018 0018
        DECLE   $007E,  $007E,  $00C3,  $00C3   ; 61E8   007E 007E 00C3 00C3
        DECLE   $007E,  $007E,  $0000,  $0000   ; 61EC   007E 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61F0   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; 61F4   0000 0018 003C 0024
        DECLE   $003C,  $0042,  $0000,  $0000   ; 61F8   003C 0042 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6200   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; 6204   0000 0018 003C 0024
        DECLE   $003C,  $0066,  $00C3,  $0000   ; 6208   003C 0066 00C3 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 620C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6210   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6214   0000 0000 0018 0018
        DECLE   $007E,  $007E,  $007E,  $007E   ; 6218   007E 007E 007E 007E
        DECLE   $0024,  $0024,  $0066,  $0066   ; 621C   0024 0024 0066 0066
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6220   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $00FF,  $00FF   ; 6224   003C 003C 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6228   00FF 00FF 00FF 00FF

        NEGR    R4                              ; 622C   0024
        NEGR    R4                              ; 622D   0024
        ADDR    R4,     R7                      ; 622E   00E7
        ADDR    R4,     R7                      ; 622F   00E7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6230   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $003C,  $003C   ; 6234   0018 0018 003C 003C
        DECLE   $0042,  $0042,  $003C,  $003C   ; 6238   0042 0042 003C 003C
        DECLE   $0018,  $0018,  $0000,  $0000   ; 623C   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6240   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $007E,  $007E   ; 6244   003C 003C 007E 007E
        DECLE   $0081,  $0081,  $007E,  $007E   ; 6248   0081 0081 007E 007E
        DECLE   $003C,  $003C,  $0000,  $0000   ; 624C   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6250   0000 0000 0000 0000
        DECLE   $001C,  $001C,  $0008,  $0008   ; 6254   001C 001C 0008 0008
        DECLE   $003C,  $003C,  $0042,  $0042   ; 6258   003C 003C 0042 0042
        DECLE   $003C,  $003C,  $0000,  $0000   ; 625C   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6260   0000 0000 0018 0018
        DECLE   $007E,  $007E,  $0018,  $0018   ; 6264   007E 007E 0018 0018
        DECLE   $007E,  $007E,  $00C3,  $00C3   ; 6268   007E 007E 00C3 00C3
        DECLE   $007E,  $007E,  $0000,  $0000   ; 626C   007E 007E 0000 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 6270   0000 0000 003C 003C
        DECLE   $0024,  $0024,  $0042,  $0042   ; 6274   0024 0024 0042 0042
        DECLE   $0042,  $0042,  $0000,  $0000   ; 6278   0042 0042 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 627C   0000 0000 007E 007E
        DECLE   $003C,  $003C,  $00A5,  $00A5   ; 6280   003C 003C 00A5 00A5
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6284   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0000,  $0000   ; 6288   0081 0081 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 628C   0000 0000 007E 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6290   0000 0000 0000 0000
        DECLE   $0042,  $0042,  $003C,  $003C   ; 6294   0042 0042 003C 003C
        DECLE   $0018,  $0018,  $007E,  $007E   ; 6298   0018 0018 007E 007E
        DECLE   $0024,  $0024,  $0000,  $0000   ; 629C   0024 0024 0000 0000
        DECLE   $0000,  $0000,  $0042,  $0042   ; 62A0   0000 0000 0042 0042
        DECLE   $007E,  $007E,  $005A,  $005A   ; 62A4   007E 007E 005A 005A
        DECLE   $007E,  $007E,  $00BD,  $00BD   ; 62A8   007E 007E 00BD 00BD
        DECLE   $0024,  $0024,  $0000,  $0000   ; 62AC   0024 0024 0000 0000
        DECLE   $003C,  $003C,  $00A6,  $00A6   ; 62B0   003C 003C 00A6 00A6
        DECLE   $0081,  $0081,  $0080,  $0080   ; 62B4   0081 0081 0080 0080
        DECLE   $0080,  $0080,  $0000,  $0000   ; 62B8   0080 0080 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 62BC   0000 0000 007E 007E
        DECLE   $003C,  $003C,  $0065,  $0065   ; 62C0   003C 003C 0065 0065
        DECLE   $0081,  $0081,  $0001,  $0001   ; 62C4   0081 0081 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 62C8   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 62CC   0000 0000 007E 007E
        DECLE   $0000,  $0000,  $0041,  $0041   ; 62D0   0000 0000 0041 0041
        DECLE   $007E,  $007E,  $005A,  $005A   ; 62D4   007E 007E 005A 005A
        DECLE   $007C,  $007C,  $00BC,  $00BC   ; 62D8   007C 007C 00BC 00BC
        DECLE   $0024,  $0024,  $0000,  $0000   ; 62DC   0024 0024 0000 0000
        DECLE   $0000,  $0000,  $0082,  $0082   ; 62E0   0000 0000 0082 0082
        DECLE   $007E,  $007E,  $005A,  $005A   ; 62E4   007E 007E 005A 005A
        DECLE   $003E,  $003E,  $003D,  $003D   ; 62E8   003E 003E 003D 003D
        DECLE   $0024,  $0024,  $0000,  $0000   ; 62EC   0024 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 62F8   0000 0000 007E 007E
        DECLE   $003C,  $003C,  $0000,  $0000   ; 62FC   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6300   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6304   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6308   0000 0000 00FF 00FF
        DECLE   $003C,  $003C,  $0000,  $0000   ; 630C   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0052,  $0052   ; 6310   0000 0000 0052 0052
        DECLE   $0024,  $0024,  $005A,  $005A   ; 6314   0024 0024 005A 005A
        DECLE   $0028,  $0028,  $0044,  $0044   ; 6318   0028 0028 0044 0044
        DECLE   $0010,  $0010,  $0000,  $0000   ; 631C   0010 0010 0000 0000
        DECLE   $0049,  $0049,  $00AA,  $00AA   ; 6320   0049 0049 00AA 00AA
        DECLE   $0054,  $0054,  $002B,  $002B   ; 6324   0054 0054 002B 002B
        DECLE   $00DC,  $00DC,  $0036,  $0036   ; 6328   00DC 00DC 0036 0036
        DECLE   $004D,  $004D,  $0088,  $0088   ; 632C   004D 004D 0088 0088
        DECLE   $0000,  $0002,  $0002,  $0002   ; 6330   0000 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0000   ; 6334   0002 0002 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6338   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 633C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6340   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6344   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6348   0000 0000 0000 0000
        DECLE   $0000                           ; 634C   0000

        SARC    R3,     2                       ; 634D   007F
        RSWD    R6                              ; 634E   003E
        COMR    R4                              ; 634F   001C
        COMR    R4                              ; 6350   001C
        COMR    R4                              ; 6351   001C
        COMR    R4                              ; 6352   001C
        COMR    R4                              ; 6353   001C
        COMR    R4                              ; 6354   001C
        COMR    R4                              ; 6355   001C
        COMR    R4                              ; 6356   001C
        INCR    R0                              ; 6357   0008
        INCR    R0                              ; 6358   0008
        DECR    R2                              ; 6359   0012

        JSR     R4,     .EXEC.018               ; 635A   0004 0010 0018
        DECLE   $007F,  $003E,  $001C,  $001C   ; 635D   007F 003E 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 6361   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $0008,  $0008   ; 6365   001C 001C 0008 0008
        DECLE   $0024,  $0010,  $0004,  $000C   ; 6369   0024 0010 0004 000C
        DECLE   $007F,  $003E,  $001C,  $001C   ; 636D   007F 003E 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 6371   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $0008,  $0008   ; 6375   001C 001C 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 6379   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008           ; 637D   0008 0008 0008
.GFX_LIST_6380:
        DECLE   $0000,  $0000,  $0008,  $001C   ; 6380  CART PIC #00
        DECLE   $007F,  $0008,  $001C,  $0000   ; 6384  
        DECLE   $0008,  $0041,  $0008,  $00A5   ; 6388  CART PIC #01
        DECLE   $0000,  $0048,  $0002,  $0010   ; 638C  
        DECLE   $0088,  $0088,  $00AA,  $0022   ; 6390  CART PIC #02
        DECLE   $00AA,  $0088,  $00AA,  $0022   ; 6394  
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6398  CART PIC #03
        DECLE   $00CC,  $00CC,  $000C,  $000C   ; 639C  
        DECLE   $00CC,  $00CC,  $00C0,  $00C0   ; 63A0  CART PIC #04
        DECLE   $00CC,  $00CC,  $000C,  $000C   ; 63A4  
        DECLE   $00F1,  $005B,  $0055,  $0051   ; 63A8  CART PIC #05
        DECLE   $0051,  $0000,  $0000,  $0000   ; 63AC  
        DECLE   $007C,  $00B2,  $00AA,  $00B2   ; 63B0  CART PIC #06
        DECLE   $00AA,  $007C,  $0000,  $0000   ; 63B4  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63B8  CART PIC #07
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63BC  
.GRAM_INIT_63C0:
        DECLE   $0027           ; 63C0  # of GRAM cards to init
        DECLE   $006D,  $00B0   ; 63C1  #00-01:  GROM #76-77 ----
        DECLE   $0021,  $00F0   ; 63C3  #02-03:  GROM #10-11 ----
        DECLE   $0049,  $00D0   ; 63C5  #04-05:  GROM #24-25 ----
        DECLE   $00EF,  $0004   ; 63C7  #06   :  4x4 tile
        DECLE   $01DD,  $0004   ; 63C9  #07   :  4x4 tile
        DECLE   $0009,  $00D0   ; 63CB  #08-09:  GROM #04-05 ----
        DECLE   $0001,  $00D0   ; 63CD  #0A-0B:  GROM #00-01 ----
        DECLE   $0023,  $0004   ; 63CF  #0C   :  4x4 tile
        DECLE   $0219,  $0040   ; 63D1  #0D-0D:  GRAM #0C-0C X---
        DECLE   $0279,  $0319   ; 63D3  #0E   :  Algo #2
        DECLE   $021D,  $0040   ; 63D5  #0F-0F:  GRAM #0E-0E X---
        DECLE   $0301,  $00BB   ; 63D7  #10   :  Algo #2
        DECLE   $0221,  $0040   ; 63D9  #11-11:  GRAM #10-10 X---
        DECLE   $0089,  $00F0   ; 63DB  #12-13:  GROM #04-05 --I-
        DECLE   $000D,  $00F0   ; 63DD  #14-15:  GROM #06-07 ----
        DECLE   $03E7,  $03FC   ; 63DF  #16   :  4x4 tile
        DECLE   $0267,  $03CC   ; 63E1  #17   :  4x4 tile
        DECLE   $0001,  $0380   ; 63E3  #18-1F:  CART #00-07 ----
        DECLE   $003D,  $00B0   ; 63E5  #20-21:  GROM #5E-5F ----
        DECLE   $00AB,  $0040   ; 63E7  #22-22:  GRAM #15-15 --I-
        DECLE   $03F3,  $03FC   ; 63E9  #23   :  4x4 tile
        DECLE   $0333,  $03FC   ; 63EB  #24   :  4x4 tile
        DECLE   $0333,  $03E4   ; 63ED  #25   :  4x4 tile
        DECLE   $0333,  $0264   ; 63EF  #26   :  4x4 tile

        DECLE   $0000,  $0000,  $03FF,  $0000   ; 63F1   0000 0000 03FF 0000
        DECLE   $03FF,  $0001,  $03FE,  $0001   ; 63F5   03FF 0001 03FE 0001
        DECLE   $03FE,  $0000,  $03FF,  $0000   ; 63F9   03FE 0000 03FF 0000
        DECLE   $03FF,  $010D,  $03FE,  $0092   ; 63FD   03FF 010D 03FE 0092
        DECLE   $0092,  $0092,  $0092,  $0092   ; 6401   0092 0092 0092 0092
        DECLE   $0092,  $0092,  $0092,  $0092   ; 6405   0092 0092 0092 0092
        DECLE   $0092,  $0028,  $0029,  $0038   ; 6409   0092 0028 0029 0038
        DECLE   $0001,  $0022,  $0020,  $0029   ; 640D   0001 0022 0020 0029
        DECLE   $0048,  $0001,  $001A,  $0018   ; 6411   0048 0001 001A 0018
        DECLE   $0029,  $0058,  $0001,  $0012   ; 6415   0029 0058 0001 0012
        DECLE   $0010,  $0029,  $0068,  $0001   ; 6419   0010 0029 0068 0001
        DECLE   $000A,  $0008,  $0029,  $0078   ; 641D   000A 0008 0029 0078
        DECLE   $0003,  $0029,  $008A,  $0029   ; 6421   0003 0029 008A 0029
        DECLE   $008A,  $0029,  $008A,  $0029   ; 6425   008A 0029 008A 0029
        DECLE   $008A,  $0029,  $008A,  $0020   ; 6429   008A 0029 008A 0020
        DECLE   $0041,  $0009,  $0038,  $0049   ; 642D   0041 0009 0038 0049
        DECLE   $0001,  $001A,  $0018,  $0041   ; 6431   0001 001A 0018 0041
        DECLE   $0009,  $0048,  $0049,  $0001   ; 6435   0009 0048 0049 0001
        DECLE   $0012,  $0010,  $0041,  $0009   ; 6439   0012 0010 0041 0009
        DECLE   $0058,  $0049,  $0001,  $000A   ; 643D   0058 0049 0001 000A
        DECLE   $0008,  $0041,  $0009,  $0068   ; 6441   0008 0041 0009 0068
        DECLE   $0049,  $0003,  $0041,  $0009   ; 6445   0049 0003 0041 0009
        DECLE   $0078,  $004B,  $0009,  $008A   ; 6449   0078 004B 0009 008A
        DECLE   $0009,  $008A,  $0009,  $008A   ; 644D   0009 008A 0009 008A
        DECLE   $0009,  $008A,  $0009,  $008A   ; 6451   0009 008A 0009 008A
        DECLE   $0020,  $0019,  $0048,  $0001   ; 6455   0020 0019 0048 0001
        DECLE   $001A,  $0018,  $0019,  $0058   ; 6459   001A 0018 0019 0058
        DECLE   $0001,  $0012,  $0010,  $0019   ; 645D   0001 0012 0010 0019
        DECLE   $0068,  $0001,  $000A,  $0008   ; 6461   0068 0001 000A 0008
        DECLE   $0019,  $0078,  $0003,  $0019   ; 6465   0019 0078 0003 0019
        DECLE   $008A,  $0019,  $008A,  $0019   ; 6469   008A 0019 008A 0019
        DECLE   $008A,  $0019,  $008A,  $0019   ; 646D   008A 0019 008A 0019
        DECLE   $008A,  $0019,  $008A,  $0020   ; 6471   008A 0019 008A 0020
        DECLE   $0019,  $0018,  $0051,  $0059   ; 6475   0019 0018 0051 0059
        DECLE   $0019,  $0018,  $0001,  $001A   ; 6479   0019 0018 0001 001A
        DECLE   $0018,  $0019,  $0020,  $0061   ; 647D   0018 0019 0020 0061
        DECLE   $0008,  $0019,  $0020,  $0001   ; 6481   0008 0019 0020 0001
        DECLE   $0012,  $0010,  $0019,  $0020   ; 6485   0012 0010 0019 0020
        DECLE   $0051,  $0061,  $0008,  $0059   ; 6489   0051 0061 0008 0059
        DECLE   $0019,  $0020,  $0001,  $000A   ; 648D   0019 0020 0001 000A
        DECLE   $0008,  $0019,  $0028,  $0061   ; 6491   0008 0019 0028 0061
        DECLE   $0018,  $0019,  $0028,  $0003   ; 6495   0018 0019 0028 0003
        DECLE   $0019,  $0028,  $0051,  $0061   ; 6499   0019 0028 0051 0061
        DECLE   $0018,  $0059,  $0019,  $002A   ; 649D   0018 0059 0019 002A
        DECLE   $0019,  $0028,  $0021,  $0028   ; 64A1   0019 0028 0021 0028
        DECLE   $0019,  $002A,  $0019,  $008A   ; 64A5   0019 002A 0019 008A
        DECLE   $0019,  $0020,  $0069,  $0021   ; 64A9   0019 0020 0069 0021
        DECLE   $0028,  $0071,  $0019,  $0022   ; 64AD   0028 0071 0019 0022
        DECLE   $0019,  $008A,  $0019,  $0020   ; 64B1   0019 008A 0019 0020
        DECLE   $0021,  $0038,  $0019,  $0022   ; 64B5   0021 0038 0019 0022
        DECLE   $0018,  $0081,  $0039,  $0079   ; 64B9   0018 0081 0039 0079
        DECLE   $0010,  $00A1,  $00A9,  $0079   ; 64BD   0010 00A1 00A9 0079
        DECLE   $0010,  $0039,  $0089,  $0001   ; 64C1   0010 0039 0089 0001
        DECLE   $0012,  $0010,  $0081,  $0039   ; 64C5   0012 0010 0081 0039
        DECLE   $0079,  $0010,  $0091,  $0009   ; 64C9   0079 0010 0091 0009
        DECLE   $0008,  $0099,  $0079,  $0010   ; 64CD   0008 0099 0079 0010
        DECLE   $0039,  $0089,  $0001,  $000A   ; 64D1   0039 0089 0001 000A
        DECLE   $0008,  $0081,  $0039,  $0079   ; 64D5   0008 0081 0039 0079
        DECLE   $0018,  $00A1,  $0009,  $0008   ; 64D9   0018 00A1 0009 0008
        DECLE   $00A9,  $0079,  $0018,  $0039   ; 64DD   00A9 0079 0018 0039
        DECLE   $0089,  $0003,  $0081,  $0039   ; 64E1   0089 0003 0081 0039
        DECLE   $0079,  $0018,  $0091,  $0009   ; 64E5   0079 0018 0091 0009
        DECLE   $0018,  $0099,  $0079,  $0018   ; 64E9   0018 0099 0079 0018
        DECLE   $0039,  $008B,  $0039,  $0079   ; 64ED   0039 008B 0039 0079
        DECLE   $0020,  $00A1,  $0009,  $0018   ; 64F1   0020 00A1 0009 0018
        DECLE   $00A9,  $0079,  $0020,  $003B   ; 64F5   00A9 0079 0020 003B
        DECLE   $0009,  $008A,  $0021,  $0028   ; 64F9   0009 008A 0021 0028
        DECLE   $0009,  $0028,  $0021,  $002A   ; 64FD   0009 0028 0021 002A
        DECLE   $0009,  $008A,  $0021,  $0020   ; 6501   0009 008A 0021 0020
        DECLE   $00B1,  $0009,  $0028,  $00B9   ; 6505   00B1 0009 0028 00B9
        DECLE   $0021,  $0022,  $0009,  $008A   ; 6509   0021 0022 0009 008A
        DECLE   $0018,  $0019,  $0020,  $0051   ; 650D   0018 0019 0020 0051
        DECLE   $0059,  $0019,  $0020,  $0001   ; 6511   0059 0019 0020 0001
        DECLE   $0012,  $0010,  $0019,  $0028   ; 6515   0012 0010 0019 0028
        DECLE   $0061,  $0008,  $0019,  $0028   ; 6519   0061 0008 0019 0028
        DECLE   $0001,  $000A,  $0008,  $0019   ; 651D   0001 000A 0008 0019
        DECLE   $0028,  $0051,  $0061,  $0008   ; 6521   0028 0051 0061 0008
        DECLE   $0059,  $0019,  $0028,  $0003   ; 6525   0059 0019 0028 0003
        DECLE   $0019,  $0030,  $0061,  $0018   ; 6529   0019 0030 0061 0018
        DECLE   $0019,  $0032,  $0019,  $0028   ; 652D   0019 0032 0019 0028
        DECLE   $0051,  $0061,  $0018,  $0059   ; 6531   0051 0061 0018 0059
        DECLE   $0019,  $002A,  $0019,  $0028   ; 6535   0019 002A 0019 0028
        DECLE   $0021,  $0028,  $0019,  $002A   ; 6539   0021 0028 0019 002A
        DECLE   $0019,  $008A,  $0019,  $0020   ; 653D   0019 008A 0019 0020
        DECLE   $0069,  $0021,  $0028,  $0071   ; 6541   0069 0021 0028 0071
        DECLE   $0019,  $0022,  $0019,  $008A   ; 6545   0019 0022 0019 008A
        DECLE   $0019,  $0020,  $0021,  $0038   ; 6549   0019 0020 0021 0038
        DECLE   $0019,  $0022,  $0010,  $0081   ; 654D   0019 0022 0010 0081
        DECLE   $0039,  $0008,  $0079,  $0010   ; 6551   0039 0008 0079 0010
        DECLE   $00A1,  $00A9,  $0079,  $0010   ; 6555   00A1 00A9 0079 0010
        DECLE   $0039,  $0008,  $0089,  $0001   ; 6559   0039 0008 0089 0001
        DECLE   $000A,  $0008,  $0081,  $0039   ; 655D   000A 0008 0081 0039
        DECLE   $0008,  $0079,  $0010,  $0091   ; 6561   0008 0079 0010 0091
        DECLE   $0009,  $0008,  $0099,  $0079   ; 6565   0009 0008 0099 0079
        DECLE   $0010,  $0039,  $0008,  $0089   ; 6569   0010 0039 0008 0089
        DECLE   $0003,  $0081,  $0039,  $0008   ; 656D   0003 0081 0039 0008
        DECLE   $0079,  $0018,  $00A1,  $0009   ; 6571   0079 0018 00A1 0009
        DECLE   $0008,  $00A9,  $0079,  $0018   ; 6575   0008 00A9 0079 0018
        DECLE   $0039,  $0008,  $008B,  $0039   ; 6579   0039 0008 008B 0039
        DECLE   $0008,  $0079,  $0018,  $0091   ; 657D   0008 0079 0018 0091
        DECLE   $0009,  $0018,  $0099,  $0079   ; 6581   0009 0018 0099 0079
        DECLE   $0018,  $0039,  $000A,  $0039   ; 6585   0018 0039 000A 0039
        DECLE   $0079,  $0020,  $00A1,  $0009   ; 6589   0079 0020 00A1 0009
        DECLE   $0018,  $00A9,  $0079,  $0020   ; 658D   0018 00A9 0079 0020
        DECLE   $003B,  $0009,  $008A,  $0021   ; 6591   003B 0009 008A 0021
        DECLE   $0028,  $0009,  $0028,  $0021   ; 6595   0028 0009 0028 0021
        DECLE   $002A,  $0009,  $008A,  $0021   ; 6599   002A 0009 008A 0021
        DECLE   $0020,  $00B1,  $0009,  $0028   ; 659D   0020 00B1 0009 0028
        DECLE   $00B9,  $0021,  $0022,  $0009   ; 65A1   00B9 0021 0022 0009
        DECLE   $008A,  $0020,  $0019,  $0028   ; 65A5   008A 0020 0019 0028
        DECLE   $0009,  $0010,  $0049,  $0001   ; 65A9   0009 0010 0049 0001
        DECLE   $001A,  $0018,  $0019,  $0030   ; 65AD   001A 0018 0019 0030
        DECLE   $0101,  $0009,  $0010,  $0049   ; 65B1   0101 0009 0010 0049
        DECLE   $0001,  $0012,  $0010,  $0019   ; 65B5   0001 0012 0010 0019
        DECLE   $0040,  $0009,  $0018,  $0049   ; 65B9   0040 0009 0018 0049
        DECLE   $0001,  $000A,  $0008,  $0019   ; 65BD   0001 000A 0008 0019
        DECLE   $0048,  $0101,  $0009,  $0018   ; 65C1   0048 0101 0009 0018
        DECLE   $0049,  $0003,  $0019,  $0058   ; 65C5   0049 0003 0019 0058
        DECLE   $0009,  $0020,  $004B,  $0019   ; 65C9   0009 0020 004B 0019
        DECLE   $0058,  $0101,  $0009,  $0022   ; 65CD   0058 0101 0009 0022
        DECLE   $0019,  $0058,  $0101,  $0009   ; 65D1   0019 0058 0101 0009
        DECLE   $0022,  $0019,  $0060,  $0009   ; 65D5   0022 0019 0060 0009
        DECLE   $0022,  $0019,  $0060,  $0009   ; 65D9   0022 0019 0060 0009
        DECLE   $0022,  $0019,  $0060,  $0101   ; 65DD   0022 0019 0060 0101
        DECLE   $0009,  $001A,  $0018,  $0081   ; 65E1   0009 001A 0018 0081
        DECLE   $0039,  $0079,  $0020,  $0111   ; 65E5   0039 0079 0020 0111
        DECLE   $0009,  $0008,  $0049,  $0001   ; 65E9   0009 0008 0049 0001
        DECLE   $001A,  $0010,  $0081,  $0039   ; 65ED   001A 0010 0081 0039
        DECLE   $0079,  $0028,  $0129,  $0009   ; 65F1   0079 0028 0129 0009
        DECLE   $0010,  $0049,  $0001,  $0012   ; 65F5   0010 0049 0001 0012
        DECLE   $0008,  $0081,  $0039,  $0079   ; 65F9   0008 0081 0039 0079
        DECLE   $0038,  $0111,  $0009,  $0010   ; 65FD   0038 0111 0009 0010
        DECLE   $0049,  $0001,  $000A,  $0081   ; 6601   0049 0001 000A 0081
        DECLE   $0039,  $0079,  $0040,  $0129   ; 6605   0039 0079 0040 0129
        DECLE   $0009,  $0018,  $0049,  $0003   ; 6609   0009 0018 0049 0003
        DECLE   $0039,  $0079,  $0050,  $0111   ; 660D   0039 0079 0050 0111
        DECLE   $0009,  $0018,  $004B,  $0009   ; 6611   0009 0018 004B 0009
        DECLE   $008A,  $0021,  $0058,  $0141   ; 6615   008A 0021 0058 0141
        DECLE   $0009,  $0022,  $0009,  $008A   ; 6619   0009 0022 0009 008A
        DECLE   $0021,  $0060,  $0131,  $0009   ; 661D   0021 0060 0131 0009
        DECLE   $001A,  $0009,  $008A,  $0020   ; 6621   001A 0009 008A 0020
        DECLE   $0041,  $0009,  $0010,  $0019   ; 6625   0041 0009 0010 0019
        DECLE   $0028,  $0001,  $001A,  $0018   ; 6629   0028 0001 001A 0018
        DECLE   $0041,  $0009,  $0010,  $0109   ; 662D   0041 0009 0010 0109
        DECLE   $0019,  $0030,  $0001,  $0012   ; 6631   0019 0030 0001 0012
        DECLE   $0010,  $0041,  $0009,  $0018   ; 6635   0010 0041 0009 0018
        DECLE   $0019,  $0040,  $0001           ; 6639   0019 0040 0001

        INCR    R2                              ; 663C   000A
        INCR    R0                              ; 663D   0008
        SWAP    R1,     1                       ; 663E   0041
        INCR    R1                              ; 663F   0009
        COMR    R0                              ; 6640   0018
        SUBR    R1,     R1                      ; 6641   0109
        COMR    R1                              ; 6642   0019
        SLL     R0,     1                       ; 6643   0048
        DIS                                     ; 6644   0003
        SWAP    R1,     1                       ; 6645   0041
        INCR    R1                              ; 6646   0009
        NEGR    R0                              ; 6647   0020
        COMR    R1                              ; 6648   0019
        SLLC    R2,     1                       ; 6649   005A
        INCR    R1                              ; 664A   0009
        NEGR    R0                              ; 664B   0020
        SUBR    R1,     R1                      ; 664C   0109
        COMR    R1                              ; 664D   0019
        SLLC    R2,     1                       ; 664E   005A
        INCR    R1                              ; 664F   0009
        NEGR    R0                              ; 6650   0020
        SUBR    R1,     R1                      ; 6651   0109
        COMR    R1                              ; 6652   0019
        SLLC    R2,     1                       ; 6653   005A
        INCR    R1                              ; 6654   0009
        NEGR    R0                              ; 6655   0020
        COMR    R1                              ; 6656   0019
        SLR     R2,     1                       ; 6657   0062
        INCR    R1                              ; 6658   0009
        NEGR    R0                              ; 6659   0020
        COMR    R1                              ; 665A   0019
        SLR     R2,     1                       ; 665B   0062
        INCR    R1                              ; 665C   0009
        COMR    R0                              ; 665D   0018
        SUBR    R1,     R1                      ; 665E   0109
        COMR    R1                              ; 665F   0019
        SLR     R2,     1                       ; 6660   0062
        NEGR    R0                              ; 6661   0020
        SWAP    R1,     1                       ; 6662   0041
L_6663:
        INCR    R1                              ; 6663   0009
        DECLE   $0008,  $0119,  $0079,  $0020   ; 6664   0008 0119 0079 0020
        DECLE   $0039,  $0089,  $0001,  $0012   ; 6668   0039 0089 0001 0012
        DECLE   $0018,  $0041,  $0009,  $0010   ; 666C   0018 0041 0009 0010
        DECLE   $0121,  $0079,  $0028,  $0039   ; 6670   0121 0079 0028 0039
        DECLE   $0089,  $0001,  $000A,  $0010   ; 6674   0089 0001 000A 0010
        DECLE   $0041,  $0009,  $0010,  $0119   ; 6678   0041 0009 0010 0119
        DECLE   $0079,  $0038,  $0039,  $0089   ; 667C   0079 0038 0039 0089
        DECLE   $0003,  $0008,  $0041,  $0009   ; 6680   0003 0008 0041 0009
        DECLE   $0018,  $0121,  $0079,  $0040   ; 6684   0018 0121 0079 0040
        DECLE   $0039,  $008B,  $0041,  $0009   ; 6688   0039 008B 0041 0009
        DECLE   $0018,  $0119,  $0079,  $0050   ; 668C   0018 0119 0079 0050
        DECLE   $003B,  $0009,  $008A,  $0009   ; 6690   003B 0009 008A 0009
        DECLE   $0020,  $0149,  $0021,  $005A   ; 6694   0020 0149 0021 005A
        DECLE   $0009,  $008A,  $0009,  $0018   ; 6698   0009 008A 0009 0018
        DECLE   $0139,  $0021,  $0062,  $0009   ; 669C   0139 0021 0062 0009
        DECLE   $008A,  $0020,  $00E1,  $0029   ; 66A0   008A 0020 00E1 0029
        DECLE   $0038,  $00E9,  $0001,  $001A   ; 66A4   0038 00E9 0001 001A
        DECLE   $0018,  $00E1,  $0029,  $0048   ; 66A8   0018 00E1 0029 0048
        DECLE   $00E9,  $0001,  $0012,  $0010   ; 66AC   00E9 0001 0012 0010
        DECLE   $00E1,  $0029,  $0058,  $00E9   ; 66B0   00E1 0029 0058 00E9
        DECLE   $0001,  $000A,  $0008,  $00E1   ; 66B4   0001 000A 0008 00E1
        DECLE   $0029,  $0068,  $00E9,  $0003   ; 66B8   0029 0068 00E9 0003
        DECLE   $00E1,  $0029,  $0078,  $00EB   ; 66BC   00E1 0029 0078 00EB
        DECLE   $0029,  $008A,  $0029,  $008A   ; 66C0   0029 008A 0029 008A
        DECLE   $0029,  $008A,  $0029,  $008A   ; 66C4   0029 008A 0029 008A
        DECLE   $0029,  $008A,  $0010,  $0081   ; 66C8   0029 008A 0010 0081
        DECLE   $0039,  $0020,  $00D1,  $00D9   ; 66CC   0039 0020 00D1 00D9
        DECLE   $0039,  $0020,  $0089,  $0001   ; 66D0   0039 0020 0089 0001
        DECLE   $000A,  $0008,  $0081,  $0039   ; 66D4   000A 0008 0081 0039
        DECLE   $0020,  $00C1,  $0001,  $0008   ; 66D8   0020 00C1 0001 0008
        DECLE   $00C9,  $0039,  $0020,  $0089   ; 66DC   00C9 0039 0020 0089
        DECLE   $0003,  $0081,  $0039,  $0028   ; 66E0   0003 0081 0039 0028
        DECLE   $00D1,  $0001,  $0008,  $00D9   ; 66E4   00D1 0001 0008 00D9
        DECLE   $0039,  $0028,  $008B,  $0039   ; 66E8   0039 0028 008B 0039
        DECLE   $0028,  $00C1,  $0001,  $0018   ; 66EC   0028 00C1 0001 0018
        DECLE   $00C9,  $0039,  $002A,  $0039   ; 66F0   00C9 0039 002A 0039
        DECLE   $0028,  $00D1,  $0001,  $0018   ; 66F4   0028 00D1 0001 0018
        DECLE   $00D9,  $0039,  $002A,  $0092   ; 66F8   00D9 0039 002A 0092
        DECLE   $0021,  $0028,  $0001,  $0028   ; 66FC   0021 0028 0001 0028
        DECLE   $0021,  $002A,  $0092,  $0021   ; 6700   0021 002A 0092 0021
        DECLE   $0020,  $00F1,  $0001,  $0028   ; 6704   0020 00F1 0001 0028
        DECLE   $00F9,  $0021,  $0022,  $0092   ; 6708   00F9 0021 0022 0092
        DECLE   $0020,  $0019,  $0010,  $0061   ; 670C   0020 0019 0010 0061
        DECLE   $0008,  $0019,  $0020,  $0001   ; 6710   0008 0019 0020 0001
        DECLE   $001A,  $0018,  $0019,  $0010   ; 6714   001A 0018 0019 0010
        DECLE   $0061,  $0010,  $0019,  $0028   ; 6718   0061 0010 0019 0028
        DECLE   $0001,  $0012,  $0010,  $0019   ; 671C   0001 0012 0010 0019
        DECLE   $0010,  $0061,  $0018,  $0019   ; 6720   0010 0061 0018 0019
        DECLE   $0030,  $0001,  $000A,  $0008   ; 6724   0030 0001 000A 0008
        DECLE   $0019,  $0010,  $0061,  $0020   ; 6728   0019 0010 0061 0020
        DECLE   $0019,  $0038,  $0003,  $0019   ; 672C   0019 0038 0003 0019
        DECLE   $0010,  $0061,  $0028,  $0019   ; 6730   0010 0061 0028 0019
        DECLE   $0042,  $0019,  $0008,  $0021   ; 6734   0042 0019 0008 0021
        DECLE   $0030,  $0019,  $0042,  $0019   ; 6738   0030 0019 0042 0019
        DECLE   $008A,  $0019,  $0021,  $0038   ; 673C   008A 0019 0021 0038
        DECLE   $0019,  $0042,  $0019,  $008A   ; 6740   0019 0042 0019 008A
        DECLE   $0021,  $0040,  $0019,  $0042   ; 6744   0021 0040 0019 0042
        DECLE   $0018,  $0081,  $0039,  $0079   ; 6748   0018 0081 0039 0079
        DECLE   $00A1,  $0009,  $0008,  $0079   ; 674C   00A1 0009 0008 0079
        DECLE   $0018,  $0039,  $0089,  $0001   ; 6750   0018 0039 0089 0001
        DECLE   $0012,  $0010,  $0081,  $0039   ; 6754   0012 0010 0081 0039
        DECLE   $0079,  $00A1,  $0009,  $0010   ; 6758   0079 00A1 0009 0010
        DECLE   $0079,  $0020,  $0039,  $0089   ; 675C   0079 0020 0039 0089
        DECLE   $0001,  $000A,  $0008,  $0081   ; 6760   0001 000A 0008 0081
        DECLE   $0039,  $0079,  $00A1,  $0009   ; 6764   0039 0079 00A1 0009
        DECLE   $0018,  $0079,  $0028,  $0039   ; 6768   0018 0079 0028 0039
        DECLE   $0089,  $0003,  $0081,  $0039   ; 676C   0089 0003 0081 0039
        DECLE   $0079,  $00A1,  $0009,  $0020   ; 6770   0079 00A1 0009 0020
        DECLE   $0079,  $0030,  $0039,  $008B   ; 6774   0079 0030 0039 008B
        DECLE   $0039,  $0079,  $00A1,  $0009   ; 6778   0039 0079 00A1 0009
        DECLE   $0028,  $0079,  $0038,  $003B   ; 677C   0028 0079 0038 003B
        DECLE   $0009,  $008A,  $0021,  $0008   ; 6780   0009 008A 0021 0008
        DECLE   $0009,  $0030,  $0021,  $0042   ; 6784   0009 0030 0021 0042
        DECLE   $0009,  $008A,  $0021,  $0009   ; 6788   0009 008A 0021 0009
        DECLE   $0038,  $0021,  $0042,  $0009   ; 678C   0038 0021 0042 0009
        DECLE   $008A,  $0020,  $0019,  $0020   ; 6790   008A 0020 0019 0020
        DECLE   $0061,  $0008,  $0019,  $0010   ; 6794   0061 0008 0019 0010
        DECLE   $0001,  $001A,  $0018,  $0019   ; 6798   0001 001A 0018 0019
        DECLE   $0028,  $0061,  $0010,  $0019   ; 679C   0028 0061 0010 0019
        DECLE   $0010,  $0001,  $0012,  $0010   ; 67A0   0010 0001 0012 0010
        DECLE   $0019,  $0030,  $0061,  $0018   ; 67A4   0019 0030 0061 0018
        DECLE   $0019,  $0010,  $0001,  $000A   ; 67A8   0019 0010 0001 000A
        DECLE   $0008,  $0019,  $0038,  $0061   ; 67AC   0008 0019 0038 0061
        DECLE   $0020,  $0019,  $0010,  $0003   ; 67B0   0020 0019 0010 0003
        DECLE   $0019,  $0040,  $0061,  $0028   ; 67B4   0019 0040 0061 0028
        DECLE   $0019,  $0012,  $0019,  $0040   ; 67B8   0019 0012 0019 0040
        DECLE   $0021,  $0030,  $0019,  $000A   ; 67BC   0021 0030 0019 000A
        DECLE   $0019,  $008A,  $0019,  $0040   ; 67C0   0019 008A 0019 0040
        DECLE   $0021,  $0038,  $001B,  $0019   ; 67C4   0021 0038 001B 0019
        DECLE   $008A,  $0019,  $0040,  $0021   ; 67C8   008A 0019 0040 0021
        DECLE   $0042,  $0018,  $0081,  $0039   ; 67CC   0042 0018 0081 0039
        DECLE   $0079,  $0018,  $0009,  $0008   ; 67D0   0079 0018 0009 0008
        DECLE   $00A9,  $0079,  $0039,  $0089   ; 67D4   00A9 0079 0039 0089
        DECLE   $0001,  $0012,  $0010,  $0081   ; 67D8   0001 0012 0010 0081
        DECLE   $0039,  $0079,  $0020,  $0009   ; 67DC   0039 0079 0020 0009
        DECLE   $0010,  $00A9,  $0079,  $0039   ; 67E0   0010 00A9 0079 0039
        DECLE   $0089,  $0001,  $000A,  $0008   ; 67E4   0089 0001 000A 0008
        DECLE   $0081,  $0039,  $0079,  $0028   ; 67E8   0081 0039 0079 0028
        DECLE   $0009,  $0018,  $00A9,  $0079   ; 67EC   0009 0018 00A9 0079
        DECLE   $0039,  $0089,  $0003,  $0081   ; 67F0   0039 0089 0003 0081
        DECLE   $0039,  $0079,  $0030,  $0009   ; 67F4   0039 0079 0030 0009
        DECLE   $0020,  $00A9,  $0079,  $0039   ; 67F8   0020 00A9 0079 0039
        DECLE   $008B,  $0039,  $0079,  $0038   ; 67FC   008B 0039 0079 0038
        DECLE   $0009,  $0028,  $00A9,  $0079   ; 6800   0009 0028 00A9 0079
        DECLE   $003B,  $0009,  $008A,  $0021   ; 6804   003B 0009 008A 0021
        DECLE   $0040,  $0009,  $0030,  $0021   ; 6808   0040 0009 0030 0021
        DECLE   $000A,  $0009,  $008A,  $0021   ; 680C   000A 0009 008A 0021
        DECLE   $0040,  $0009,  $0038,  $0023   ; 6810   0040 0009 0038 0023
        DECLE   $0009,  $008A,  $0000,  $0000   ; 6814   0009 008A 0000 0000
        DECLE   $0000,  $0012,  $0000,  $0004   ; 6818   0000 0012 0000 0004
        DECLE   $000E,  $0009,  $0000,  $0026   ; 681C   000E 0009 0000 0026
        DECLE   $0000,  $0002,  $0000,  $0000   ; 6820   0000 0002 0000 0000
        DECLE   $001F,  $0008,  $0008,  $001A   ; 6824   001F 0008 0008 001A
        DECLE   $0000,  $001A,  $009E,  $002E   ; 6828   0000 001A 009E 002E
        DECLE   $0096,  $002E,  $001E,  $002E   ; 682C   0096 002E 001E 002E
        DECLE   $002E,  $002E,  $0026,  $002E   ; 6830   002E 002E 0026 002E
        DECLE   $001F                           ; 6834   001F

        COMR    R2                              ; 6835   001A
        MOVR    R0,     R7                      ; 6836   0087

        INCR    R0                              ; 6837   0008
        MOVR    R1,     R7                      ; 6838   008F

        DECLE   $0008,  $0037,  $001A,  $003F   ; 6839   0008 0037 001A 003F
        DECLE   $001A,  $0067,  $001A,  $006F   ; 683D   001A 0067 001A 006F
        DECLE   $001A,  $002F,  $001A,  $0027   ; 6841   001A 002F 001A 0027
        DECLE   $001A,  $0037,  $0008,  $003F   ; 6845   001A 0037 0008 003F
        DECLE   $0008,  $0067,  $0008,  $006F   ; 6849   0008 0067 0008 006F
        DECLE   $0008,  $0008,  $000A,  $0000   ; 684D   0008 0008 000A 0000
        DECLE   $000A,  $002F,  $0008,  $0027   ; 6851   000A 002F 0008 0027

        INCR    R0                              ; 6855   0008
        ADCR    R6                              ; 6856   002E
        COMR    R2                              ; 6857   001A
        NEGR    R6                              ; 6858   0026
        COMR    R2                              ; 6859   001A
        RRC     R3,     2                       ; 685A   0077
        COMR    R2                              ; 685B   001A
        SARC    R3,     2                       ; 685C   007F
        COMR    R2                              ; 685D   001A
        MOVR    R0,     R7                      ; 685E   0087

        COMR    R2                              ; 685F   001A
        MOVR    R1,     R7                      ; 6860   008F

        DECLE   $001A,  $004F,  $001A,  $0047   ; 6861   001A 004F 001A 0047
        DECLE   $001A,  $005F,  $001A,  $0057   ; 6865   001A 005F 001A 0057
        DECLE   $001A,  $0000,  $0000,  $0000   ; 6869   001A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6871   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 6875   0000 0000 0001 0002
        DECLE   $0003,  $0004,  $0005           ; 6879   0003 0004 0005

        SETC                                    ; 687C   0007
        INCR    R1                              ; 687D   0009
        INCR    R2                              ; 687E   000A
        INCR    R7                              ; 687F   000F

        DECR    R4                              ; 6880   0014
L_6881:
        COMR    R1                              ; 6881   0019
        COMR    R6                              ; 6882   001E
        NEGR    R2                              ; 6883   0022
        NEGR    R6                              ; 6884   0026
        ADCR    R2                              ; 6885   002A
        ADCR    R4                              ; 6886   002C
        GSWD    R3                              ; 6887   0033
        RSWD    R2                              ; 6888   003A
        SWAP    R1,     1                       ; 6889   0041
        SWAP    R3,     2                       ; 688A   0047
        SLL     R3,     1                       ; 688B   004B
        SLL     R3,     2                       ; 688C   004F
        RLC     R3,     1                       ; 688D   0053
        RLC     R1,     2                       ; 688E   0055
        SLLC    R2,     1                       ; 688F   005A
        SLLC    R3,     2                       ; 6890   005F
        SLR     R0,     2                       ; 6891   0064
        SAR     R0,     1                       ; 6892   0068
        SAR     R2,     1                       ; 6893   006A
        SAR     R2,     2                       ; 6894   006E
        RRC     R2,     1                       ; 6895   0072
        RRC     R0,     2                       ; 6896   0074
        SARC    R1,     2                       ; 6897   007D
        MOVR    R0,     R6                      ; 6898   0086
        MOVR    R2,     R1                      ; 6899   0091
        MOVR    R3,     R1                      ; 689A   0099
        MOVR    R4,     R1                      ; 689B   00A1
        MOVR    R5,     R1                      ; 689C   00A9
        MOVR    R6,     R3                      ; 689D   00B3
        MOVR    R7,     R1                      ; 689E   00B9
        ADDR    R0,     R6                      ; 689F   00C6
        ADDR    R2,     R5                      ; 68A0   00D5
        ADDR    R4,     R3                      ; 68A1   00E3
        ADDR    R5,     R7                      ; 68A2   00EF

        ADDR    R7,     R1                      ; 68A3   00F9
        SUBR    R0,     R1                      ; 68A4   0101
        SUBR    R1,     R3                      ; 68A5   010B
        SUBR    R1,     R5                      ; 68A6   010D
        SUBR    R2,     R6                      ; 68A7   0116
        SUBR    R3,     R7                      ; 68A8   011F

        SUBR    R5,     R1                      ; 68A9   0129
        SUBR    R5,     R7                      ; 68AA   012F

        DECLE   $0137,  $013F,  $0149,  $014F   ; 68AB   0137 013F 0149 014F
        DECLE   $015E,  $016E,  $017C,  $0188   ; 68AF   015E 016E 017C 0188
        DECLE   $0192,  $019A,  $01A4,  $01A6   ; 68B3   0192 019A 01A4 01A6
        DECLE   $01AE,  $01B7,  $01BF,  $01C7   ; 68B7   01AE 01B7 01BF 01C7
        DECLE   $01CC,  $01D6,  $01DE,  $01E3   ; 68BB   01CC 01D6 01DE 01E3
        DECLE   $01EE,  $01F9,  $0204,  $020D   ; 68BF   01EE 01F9 0204 020D
        DECLE   $0214,  $021B,  $0222,  $0224   ; 68C3   0214 021B 0222 0224
        DECLE   $022C,  $0235,  $023D           ; 68C7   022C 0235 023D

        MVO     R5,     .BTAB.4A                ; 68CA   0245 024A
        MVO@    R4,     R2                      ; 68CC   0254
        MVO@    R4,     R3                      ; 68CD   025C
        MVO@    R1,     R4                      ; 68CE   0261
        MVO@    R4,     R5                      ; 68CF   026C
        PSHR    R7                              ; 68D0   0277
        MVI     .BTAB.8A,R1                     ; 68D1   0281 028A
        MVI@    R2,     R1                      ; 68D3   0291
        MVI@    R3,     R0                      ; 68D4   0298
        MVI@    R3,     R7                      ; 68D5   029F

        MVI@    R4,     R1                      ; 68D6   02A1
        MVI@    R5,     R0                      ; 68D7   02A8
        MVI@    R5,     R7                      ; 68D8   02AF

        PULR    R6                              ; 68D9   02B6
        MVII    #$02C0, R4                      ; 68DA   02BC 02C0
        ADD     .BTAB.C8,R4                     ; 68DC   02C4 02C8
        ADD@    R1,     R2                      ; 68DE   02CA
        ADD@    R2,     R5                      ; 68DF   02D5
        ADD@    R4,     R1                      ; 68E0   02E1
        ADD@    R5,     R3                      ; 68E1   02EB
        ADD@    R6,     R3                      ; 68E2   02F3
        ADDI    #$0302, R3                      ; 68E3   02FB 0302
        SUB@    R1,     R3                      ; 68E5   030B
        SUB@    R1,     R4                      ; 68E6   030C
        SUB@    R2,     R5                      ; 68E7   0315
        SUB@    R3,     R6                      ; 68E8   031E
        SUB@    R4,     R7                      ; 68E9   0327
        SUB@    R5,     R7                      ; 68EA   032F

        DECLE   $0335,  $033D,  $0344,  $0348   ; 68EB   0335 033D 0344 0348
        DECLE   $0355,  $0362,  $036E,  $0378   ; 68EF   0355 0362 036E 0378
        DECLE   $0380,  $0388,  $038F,  $0391   ; 68F3   0380 0388 038F 0391
        DECLE   $039A,  $03A3,  $03AC,  $03B4   ; 68F7   039A 03A3 03AC 03B4
        DECLE   $03BA,  $03C2,  $03C9,  $0000   ; 68FB   03BA 03C2 03C9 0000
        DECLE   $000D,  $001A,  $0026,  $0030   ; 68FF   000D 001A 0026 0030
        DECLE   $0038,  $0040,  $0047,  $0000   ; 6903   0038 0040 0047 0000
        DECLE   $03D7,  $034A,  $03FF,  $03B8   ; 6907   03D7 034A 03FF 03B8
        DECLE   $03FF,  $03A7,  $03FF,  $03F9   ; 690B   03FF 03A7 03FF 03F9
        DECLE   $03FF,  $03FF,  $0034,  $03FF   ; 690F   03FF 03FF 0034 03FF
        DECLE   $0012,  $03FF,  $0000,  $03FF   ; 6913   0012 03FF 0000 03FF
        DECLE   $0114,  $0082,  $03FF,  $0300   ; 6917   0114 0082 03FF 0300
        DECLE   $03FF,  $0010,  $03FF,  $0040   ; 691B   03FF 0010 03FF 0040
        DECLE   $03FF,  $03FF                   ; 691F   03FF 03FF
L_6921:
        DECR    R7                              ; 6921   0017

        DECLE   $03FF,  $008B,  $03FF,  $0107   ; 6922   03FF 008B 03FF 0107
        DECLE   $03FF,  $00AC,  $0006,  $03FF   ; 6926   03FF 00AC 0006 03FF
        DECLE   $0000,  $03FF,  $0200,  $03FF   ; 692A   0000 03FF 0200 03FF
        DECLE   $0000,  $03FF,  $03FF,  $013F   ; 692E   0000 03FF 03FF 013F
        DECLE   $03FF,  $03F7,  $03FF,  $03DF   ; 6932   03FF 03F7 03FF 03DF
        DECLE   $03FF,  $03DF,  $01EF,  $03FF   ; 6936   03FF 03DF 01EF 03FF
        DECLE   $039F,  $03FF,  $03AF,  $03FF   ; 693A   039F 03FF 03AF 03FF
        DECLE   $03CA,  $03FF,  $03FF,  $01FE   ; 693E   03CA 03FF 03FF 01FE
        DECLE   $03FF,  $03FB,  $03FF,  $03FF   ; 6942   03FF 03FB 03FF 03FF
        DECLE   $03FF,  $03FB,  $033D,  $03FF   ; 6946   03FF 03FB 033D 03FF
        DECLE   $0377,  $03FF,  $02BF,  $03FF   ; 694A   0377 03FF 02BF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $0052   ; 694E   03FF 03FF 03FF 0052
        DECLE   $03FF,  $0060,  $03FF,  $02A0   ; 6952   03FF 0060 03FF 02A0
        DECLE   $03FF,  $003A,  $0202,  $03FF   ; 6956   03FF 003A 0202 03FF
        DECLE   $0084,  $03FF,  $0020,  $03FF   ; 695A   0084 03FF 0020 03FF
        DECLE   $0028,  $03FF,  $03FF,  $01A4   ; 695E   0028 03FF 03FF 01A4
        DECLE   $03FF,  $00B1,  $03FF,  $0160   ; 6962   03FF 00B1 03FF 0160
        DECLE   $03FF,  $0002,  $0000,  $03FF   ; 6966   03FF 0002 0000 03FF
        DECLE   $0248,  $03FF,  $0010,  $03FF   ; 696A   0248 03FF 0010 03FF
        DECLE   $0050,  $03FF,  $03FF,  $03FF   ; 696E   0050 03FF 03FF 03FF
        DECLE   $03FF,  $03BD,  $03FF,  $03FF   ; 6972   03FF 03BD 03FF 03FF
        DECLE   $03FF,  $037E,  $03FF,  $03FF   ; 6976   03FF 037E 03FF 03FF
        DECLE   $03FE,  $03FF,  $03D7,  $03FF   ; 697A   03FE 03FF 03D7 03FF
        DECLE   $036F,  $03FF,  $03FF,  $03FF   ; 697E   036F 03FF 03FF 03FF
        DECLE   $03FF,  $03FE,  $03FF,  $03FF   ; 6982   03FF 03FE 03FF 03FF
        DECLE   $03FF,  $03F4,  $0313,  $03FF   ; 6986   03FF 03F4 0313 03FF
        DECLE   $033B,  $03FF,  $03F4,  $03FF   ; 698A   033B 03FF 03F4 03FF
        DECLE   $03D5,  $03FF,  $03FF,  $000E   ; 698E   03D5 03FF 03FF 000E
        DECLE   $03FF,  $0030,  $03FF,  $03DD   ; 6992   03FF 0030 03FF 03DD
        DECLE   $03FF,  $016D,  $0001,  $03FF   ; 6996   03FF 016D 0001 03FF
L_699A:
        DECR    R0                              ; 699A   0010
        DECLE   $03FF,  $0028,  $03FF,  $0100   ; 699B   03FF 0028 03FF 0100
        DECLE   $03FF,  $03FF,  $00AD,  $03FF   ; 699F   03FF 03FF 00AD 03FF
        DECLE   $0058,  $03FF,  $0080,  $03FF   ; 69A3   0058 03FF 0080 03FF
        DECLE   $0086,  $00A4,  $03FF,  $0180   ; 69A7   0086 00A4 03FF 0180
        DECLE   $03FF,  $0288,  $03FF,  $0090   ; 69AB   03FF 0288 03FF 0090
        DECLE   $03FF,  $03FF,  $03F7,  $03FF   ; 69AF   03FF 03FF 03F7 03FF
        DECLE   $037F,  $03FF,  $03FE,  $03FF   ; 69B3   037F 03FF 03FE 03FF
        DECLE   $03FF,  $0337,  $03FF,  $03E2   ; 69B7   03FF 0337 03FF 03E2
        DECLE   $03FF,  $01DA,  $03FF,  $03F9   ; 69BB   03FF 01DA 03FF 03F9
        DECLE   $03FF,  $03FF,  $024F,  $03FF   ; 69BF   03FF 03FF 024F 03FF
        DECLE   $02EF,  $03FF,  $03EF,  $03FF   ; 69C3   02EF 03FF 03EF 03FF
        DECLE   $03FB,  $036F,  $03FF,  $031F   ; 69C7   03FB 036F 03FF 031F
        DECLE   $03FF,  $02FE,  $03FF,  $035F   ; 69CB   03FF 02FE 03FF 035F
        DECLE   $03FF,  $03FF,  $01E0,  $03FF   ; 69CF   03FF 03FF 01E0 03FF
        DECLE   $0026,  $03FF,  $02C8,  $03FF   ; 69D3   0026 03FF 02C8 03FF
        DECLE   $004B,  $000C,  $03FF,  $0001   ; 69D7   004B 000C 03FF 0001
        DECLE   $03FF,  $0050,  $03FF,  $0000   ; 69DB   03FF 0050 03FF 0000
        DECLE   $03FF,  $03FF,  $00B8,  $03FF   ; 69DF   03FF 03FF 00B8 03FF
        DECLE   $001A,  $03FF,  $002A,  $03FF   ; 69E3   001A 03FF 002A 03FF
        DECLE   $0342,  $0208,  $03FF,  $00AD   ; 69E7   0342 0208 03FF 00AD
        DECLE   $03FF,  $0006,  $03FF,  $0108   ; 69EB   03FF 0006 03FF 0108
        DECLE   $03FF,  $03FF,  $03D7,  $03FF   ; 69EF   03FF 03FF 03D7 03FF
        DECLE   $03EF,  $03FF,  $03FC,  $03FF   ; 69F3   03EF 03FF 03FC 03FF
        DECLE   $03FD,  $02BE,  $03FF,  $02DF   ; 69F7   03FD 02BE 03FF 02DF
        DECLE   $03FF,  $032E,  $03FF,  $03F8   ; 69FB   03FF 032E 03FF 03F8
        DECLE   $03FF,  $03FF,  $03BE,  $03FF   ; 69FF   03FF 03FF 03BE 03FF
        DECLE   $03FF,  $03FF,  $03EF,  $03FF   ; 6A03   03FF 03FF 03EF 03FF
        DECLE   $03FE,  $037D,  $03FF,  $03FC   ; 6A07   03FE 037D 03FF 03FC
        DECLE   $03FF,  $03BB,  $03FF,  $0367   ; 6A0B   03FF 03BB 03FF 0367
        DECLE   $03FF,  $03FF,  $012A,  $03FF   ; 6A0F   03FF 03FF 012A 03FF
        DECLE   $00F0,  $03FF,  $0111,  $03FF   ; 6A13   00F0 03FF 0111 03FF
        DECLE   $000E,  $0040,  $03FF,  $0046   ; 6A17   000E 0040 03FF 0046
        DECLE   $03FF,  $0000,  $03FF,  $0380   ; 6A1B   03FF 0000 03FF 0380
        DECLE   $03FF,  $03FF,  $00D0,  $03FF   ; 6A1F   03FF 03FF 00D0 03FF
        DECLE   $0322,  $03FF,  $0099,  $03FF   ; 6A23   0322 03FF 0099 03FF
        DECLE   $00C1,  $0000,  $03FF,  $0090   ; 6A27   00C1 0000 03FF 0090
        DECLE   $03FF,  $0100,  $03FF,  $0005   ; 6A2B   03FF 0100 03FF 0005
        DECLE   $03FF,  $03FF,  $039F,  $03FF   ; 6A2F   03FF 03FF 039F 03FF
        DECLE   $03FF,  $03FF,  $03FE,  $03FF   ; 6A33   03FF 03FF 03FE 03FF
        DECLE   $03FE,  $03BE,  $03FF,  $03FF   ; 6A37   03FE 03BE 03FF 03FF
        DECLE   $03FF,  $01E5,  $03FF,  $03E7   ; 6A3B   03FF 01E5 03FF 03E7
        DECLE   $03FF,  $03FF,  $03DF,  $03FF   ; 6A3F   03FF 03FF 03DF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A43   03FF 03FF 03FF 03FF
        DECLE   $01FF,  $036B,  $03FF,  $039D   ; 6A47   01FF 036B 03FF 039D
        DECLE   $03FF,  $03F9,  $03FF,  $0173   ; 6A4B   03FF 03F9 03FF 0173
        DECLE   $03FF,  $03FF,  $000A,  $03FF   ; 6A4F   03FF 03FF 000A 03FF
        DECLE   $00D8,  $03FF,  $0059,  $03FF   ; 6A53   00D8 03FF 0059 03FF
        DECLE   $0058,  $0000,  $03FF,  $0000   ; 6A57   0058 0000 03FF 0000
        DECLE   $03FF,  $0020,  $03FF,  $0011   ; 6A5B   03FF 0020 03FF 0011
        DECLE   $03FF,  $03F7                   ; 6A5F   03FF 03F7

        BLE     L_6663                          ; 6A61   0226 03FF

L_6A63:
        SUBI    #$03FF, R0                      ; 6A63   0338 03FF
        DECLE   $0321,  $03FF,  $0087,  $0080   ; 6A65   0321 03FF 0087 0080
        DECLE   $03FF,  $0000,  $03FF,  $0001   ; 6A69   03FF 0000 03FF 0001
        DECLE   $03FF,  $0004,  $03FF,  $03FF   ; 6A6D   03FF 0004 03FF 03FF
        DECLE   $03F7,  $03FF,  $03FD,  $03FF   ; 6A71   03F7 03FF 03FD 03FF
        DECLE   $037B,  $03FF,  $03FB,  $01F8   ; 6A75   037B 03FF 03FB 01F8
        DECLE   $03FF,  $03C6,  $03FF,  $03FC   ; 6A79   03FF 03C6 03FF 03FC
        DECLE   $03FF,  $0376,  $03FF,  $03FF   ; 6A7D   03FF 0376 03FF 03FF
        DECLE   $037C,  $03FF,  $03F7,  $03FF   ; 6A81   037C 03FF 03F7 03FF
        DECLE   $039F,  $03FF,  $03FF,  $034E   ; 6A85   039F 03FF 03FF 034E
        DECLE   $03FF,  $03F6,  $03FF,  $037E   ; 6A89   03FF 03F6 03FF 037E
        DECLE   $03FF,  $0377,  $03FF,  $03FF   ; 6A8D   03FF 0377 03FF 03FF
        DECLE   $026E,  $03FF,  $0220,  $03FF   ; 6A91   026E 03FF 0220 03FF
        DECLE   $0006,  $03FF,  $0321,  $0188   ; 6A95   0006 03FF 0321 0188
        DECLE   $03FF,  $0048,  $03FF,  $0050   ; 6A99   03FF 0048 03FF 0050
        DECLE   $03FF,  $0034,  $03FF,  $03FF   ; 6A9D   03FF 0034 03FF 03FF
        DECLE   $01BA,  $03FF,  $035E,  $03FF   ; 6AA1   01BA 03FF 035E 03FF
        DECLE   $02E5,  $03FF,  $0012,  $0100   ; 6AA5   02E5 03FF 0012 0100
        DECLE   $03FF,  $0009,  $03FF,  $0101   ; 6AA9   03FF 0009 03FF 0101
        DECLE   $03FF,  $0100,  $03FF,  $03FF   ; 6AAD   03FF 0100 03FF 03FF
        DECLE   $03EE,  $03FF,  $03DF,  $03FF   ; 6AB1   03EE 03FF 03DF 03FF
        DECLE   $03ED,  $03FF,  $03DD,  $0375   ; 6AB5   03ED 03FF 03DD 0375
        DECLE   $03FF,  $0337,  $03FF,  $03D4   ; 6AB9   03FF 0337 03FF 03D4
        DECLE   $03FF,  $037F,  $03FF,  $03FF   ; 6ABD   03FF 037F 03FF 03FF
        DECLE   $033F,  $03FF,  $03FF,  $03FF   ; 6AC1   033F 03FF 03FF 03FF
        DECLE   $03DF,  $03FF,  $037F,  $03FE   ; 6AC5   03DF 03FF 037F 03FE
        DECLE   $03FF,  $03FA,  $03FF,  $03FF   ; 6AC9   03FF 03FA 03FF 03FF
        DECLE   $03FF,  $0367,  $03FF,  $03FF   ; 6ACD   03FF 0367 03FF 03FF
        DECLE   $0284,  $03FF,  $002C,  $03FF   ; 6AD1   0284 03FF 002C 03FF
        DECLE   $0260,  $03FF,  $000B,  $0026   ; 6AD5   0260 03FF 000B 0026
        DECLE   $03FF,  $0000,  $03FF,  $0026   ; 6AD9   03FF 0000 03FF 0026
        DECLE   $03FF,  $0020,  $03FF,  $03FF   ; 6ADD   03FF 0020 03FF 03FF

        MVI     G_03FF, R1                      ; 6AE1   0281 03FF
        MOVR    R1,     R7                      ; 6AE3   008F

        DECLE   $03FF,  $0275,  $03FF,  $0110   ; 6AE4   03FF 0275 03FF 0110
        DECLE   $0100,  $03FF,  $0010,  $03FF   ; 6AE8   0100 03FF 0010 03FF
        DECLE   $0030,  $03FF,  $0260,  $03FF   ; 6AEC   0030 03FF 0260 03FF
        DECLE   $03FF,  $03FE,  $03FF,  $033F   ; 6AF0   03FF 03FE 03FF 033F
        DECLE   $03FF,  $037B,  $03FF,  $02FB   ; 6AF4   03FF 037B 03FF 02FB
        DECLE   $03EA,  $03FF,  $037F,  $03FF   ; 6AF8   03EA 03FF 037F 03FF
        DECLE   $03FF,  $03FF,  $03E5,  $03FF   ; 6AFC   03FF 03FF 03E5 03FF
        DECLE   $03FF,  $03DF,  $03FF,  $033D   ; 6B00   03FF 03DF 03FF 033D
        DECLE   $03FF,  $03FE,  $03FF,  $03FF   ; 6B04   03FF 03FE 03FF 03FF
        DECLE   $035C,  $03FF,  $03FF,  $03FF   ; 6B08   035C 03FF 03FF 03FF
        DECLE   $019E,  $03FF,  $034A,  $03FF   ; 6B0C   019E 03FF 034A 03FF
        DECLE   $03FF,  $0122,  $03FF,  $0000   ; 6B10   03FF 0122 03FF 0000
        DECLE   $03FF,  $0202,  $03FF,  $03D1   ; 6B14   03FF 0202 03FF 03D1
        DECLE   $0020,  $03FF,  $0052,  $03FF   ; 6B18   0020 03FF 0052 03FF
        DECLE   $0100,  $03FF,  $0205,  $03FF   ; 6B1C   0100 03FF 0205 03FF
        DECLE   $03FF,  $0320,  $03FF,  $03A7   ; 6B20   03FF 0320 03FF 03A7
        DECLE   $03FF,  $0364,  $03FF,  $0214   ; 6B24   03FF 0364 03FF 0214
        DECLE   $0084,  $03FF,  $0140,  $03FF   ; 6B28   0084 03FF 0140 03FF
        DECLE   $0018,  $03FF,  $0110,  $03FF   ; 6B2C   0018 03FF 0110 03FF
        DECLE   $03FF,  $037F,  $03FF,  $03FD   ; 6B30   03FF 037F 03FF 03FD
        DECLE   $03FF,  $03D5,  $03FF,  $03FF   ; 6B34   03FF 03D5 03FF 03FF
        DECLE   $0117,  $03FF,  $0365,  $03FF   ; 6B38   0117 03FF 0365 03FF
        DECLE   $01AE,  $03FF,  $03A8,  $03FF   ; 6B3C   01AE 03FF 03A8 03FF
        DECLE   $03FF,  $039A,  $03FF,  $03FA   ; 6B40   03FF 039A 03FF 03FA
        DECLE   $03FF,  $03EF,  $03FF,  $03FF   ; 6B44   03FF 03EF 03FF 03FF
        DECLE   $03C7,  $03FF,  $03B6,  $03FF   ; 6B48   03C7 03FF 03B6 03FF
        DECLE   $02EE,  $03FF,  $0366,  $03FF   ; 6B4C   02EE 03FF 0366 03FF
        DECLE   $03FF,  $0082,  $03FF,  $00D0   ; 6B50   03FF 0082 03FF 00D0
        DECLE   $03FF,  $0122,  $03FF,  $02D6   ; 6B54   03FF 0122 03FF 02D6
        DECLE   $0182,  $03FF,  $0208,  $03FF   ; 6B58   0182 03FF 0208 03FF
        DECLE   $0070,  $03FF,  $000A,  $03FF   ; 6B5C   0070 03FF 000A 03FF
        DECLE   $03FF,  $006E,  $03FF,  $014F   ; 6B60   03FF 006E 03FF 014F
        DECLE   $03FF,  $01A9,  $03FF,  $0228   ; 6B64   03FF 01A9 03FF 0228
        DECLE   $0010,  $03FF,  $0068,  $03FF   ; 6B68   0010 03FF 0068 03FF
        DECLE   $000A,  $03FF,  $0011,  $03FF   ; 6B6C   000A 03FF 0011 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03AF   ; 6B70   03FF 03FF 03FF 03AF
        DECLE   $03FF,  $02FF,  $03FF,  $03DF   ; 6B74   03FF 02FF 03FF 03DF
        DECLE   $0314,  $03FF,  $03CA,  $03FF   ; 6B78   0314 03FF 03CA 03FF
        DECLE   $0373,  $03FF,  $03BF,  $03FF   ; 6B7C   0373 03FF 03BF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $037D   ; 6B80   03FF 03FF 03FF 037D
        DECLE   $03FF,  $03B7,  $03FF,  $03FB   ; 6B84   03FF 03B7 03FF 03FB
        DECLE   $03BC,  $03FF,  $03F5,  $03FF   ; 6B88   03BC 03FF 03F5 03FF
        DECLE   $037F,  $03FF,  $027F,  $03FF   ; 6B8C   037F 03FF 027F 03FF
        DECLE   $03FF,  $023E,  $03FF,  $0213   ; 6B90   03FF 023E 03FF 0213
        DECLE   $03FF,  $03A3,  $03FF,  $02DB   ; 6B94   03FF 03A3 03FF 02DB
        DECLE   $0080,  $03FF,  $0304,  $03FF   ; 6B98   0080 03FF 0304 03FF
        DECLE   $0084,  $03FF,  $0110,  $03FF   ; 6B9C   0084 03FF 0110 03FF
        DECLE   $03FF,  $0014,  $03FF,  $0104   ; 6BA0   03FF 0014 03FF 0104
        DECLE   $03FF,  $0085,  $03FF,  $0049   ; 6BA4   03FF 0085 03FF 0049
        DECLE   $0008,  $03FF,  $0018,  $03FF   ; 6BA8   0008 03FF 0018 03FF
        DECLE   $00D0,  $03FF,  $0221,  $03FF   ; 6BAC   00D0 03FF 0221 03FF
        DECLE   $03FF,  $03DF,  $03FF,  $03FD   ; 6BB0   03FF 03DF 03FF 03FD
        DECLE   $03FF,  $037F,  $03FF,  $03FD   ; 6BB4   03FF 037F 03FF 03FD
        DECLE   $03B7,  $03FF,  $03FF,  $03FF   ; 6BB8   03B7 03FF 03FF 03FF
        DECLE   $03FD,  $03FF,  $03C3,  $03FF   ; 6BBC   03FD 03FF 03C3 03FF
        DECLE   $03FF,  $03F7,  $03FF,  $03FA   ; 6BC0   03FF 03F7 03FF 03FA
        DECLE   $03FF,  $037F,  $03FF,  $03E7   ; 6BC4   03FF 037F 03FF 03E7
        DECLE   $030D,  $03FF,  $03CE,  $03FF   ; 6BC8   030D 03FF 03CE 03FF
        DECLE   $0371,  $03FF,  $03F7,  $03FF   ; 6BCC   0371 03FF 03F7 03FF
        DECLE   $03FF,  $0264,  $03FF,  $0040   ; 6BD0   03FF 0264 03FF 0040
        DECLE   $03FF,  $002C,  $03FF,  $0230   ; 6BD4   03FF 002C 03FF 0230
        DECLE   $0081,  $03FF,  $0000,  $03FF   ; 6BD8   0081 03FF 0000 03FF
        DECLE   $0108,  $03FF,  $0002,  $03FF   ; 6BDC   0108 03FF 0002 03FF
        DECLE   $03FF,  $012B,  $03FF,  $025B   ; 6BE0   03FF 012B 03FF 025B
        DECLE   $03FF,  $02EC,  $03FF,  $0101   ; 6BE4   03FF 02EC 03FF 0101
        DECLE   $0000,  $03FF,  $0008,  $03FF   ; 6BE8   0000 03FF 0008 03FF
        DECLE   $0008,  $03FF,  $0000,  $03FF   ; 6BEC   0008 03FF 0000 03FF
        DECLE   $03FF,  $037F,  $03FF,  $037F   ; 6BF0   03FF 037F 03FF 037F
        DECLE   $03FF,  $03DB,  $03FF,  $03F5   ; 6BF4   03FF 03DB 03FF 03F5
        DECLE   $032E,  $03FF,  $0174,  $03FF   ; 6BF8   032E 03FF 0174 03FF
        DECLE   $032D,  $03FF,  $03EE,  $03FF   ; 6BFC   032D 03FF 03EE 03FF
        DECLE   $03FF,  $03FD,  $03FF,  $037F   ; 6C00   03FF 03FD 03FF 037F
        DECLE   $03FF,  $03F9,  $03FF,  $03F5   ; 6C04   03FF 03F9 03FF 03F5
        DECLE   $03C2,  $03FF,  $03B9,  $03FF   ; 6C08   03C2 03FF 03B9 03FF
        DECLE   $036B,  $03FF,  $0357,  $03FF   ; 6C0C   036B 03FF 0357 03FF
        DECLE   $03FF,  $0176,  $03FF,  $0302   ; 6C10   03FF 0176 03FF 0302
        DECLE   $03FF,  $0086,  $03FF,  $00C4   ; 6C14   03FF 0086 03FF 00C4
        DECLE   $0304,  $03FF,  $01A0,  $03FF   ; 6C18   0304 03FF 01A0 03FF
        DECLE   $021A,  $03FF,  $0200,  $03FF   ; 6C1C   021A 03FF 0200 03FF
        DECLE   $03FF,  $03B6,  $03FF,  $01D8   ; 6C20   03FF 03B6 03FF 01D8
        DECLE   $03FF,  $01B8,  $03FF,  $03D3   ; 6C24   03FF 01B8 03FF 03D3
        DECLE   $0020,  $03FF,  $0114,  $03FF   ; 6C28   0020 03FF 0114 03FF
        DECLE   $000B,  $03FF,  $0008,  $03FF   ; 6C2C   000B 03FF 0008 03FF
        DECLE   $03FF,  $03F2,  $03FF,  $037B   ; 6C30   03FF 03F2 03FF 037B
        DECLE   $03FF,  $03E7,  $03FF,  $03F7   ; 6C34   03FF 03E7 03FF 03F7
        DECLE   $03F9,  $03FF,  $03EF,  $03FF   ; 6C38   03F9 03FF 03EF 03FF
        DECLE   $01CF,  $03FF,  $031D,  $03FF   ; 6C3C   01CF 03FF 031D 03FF
        DECLE   $03FF,  $037F,  $03FF,  $03FD   ; 6C40   03FF 037F 03FF 03FD
        DECLE   $03FF,  $037F,  $03FF,  $03FF   ; 6C44   03FF 037F 03FF 03FF
        DECLE   $01E7,  $03FF,  $036E,  $03FF   ; 6C48   01E7 03FF 036E 03FF
        DECLE   $03DA,  $03FF,  $034B,  $03FF   ; 6C4C   03DA 03FF 034B 03FF
        DECLE   $03FF,  $01D6,  $03FF,  $03A7   ; 6C50   03FF 01D6 03FF 03A7
        DECLE   $03FF,  $0336,  $03FF,  $003E   ; 6C54   03FF 0336 03FF 003E
        DECLE   $0000,  $03FF,  $00C2,  $03FF   ; 6C58   0000 03FF 00C2 03FF
        DECLE   $0288,  $03FF,  $0002,  $03FF   ; 6C5C   0288 03FF 0002 03FF
        DECLE   $03FF,  $0048,  $03FF,  $01C9   ; 6C60   03FF 0048 03FF 01C9
        DECLE   $03FF,  $02BB,  $03FF,  $00D4   ; 6C64   03FF 02BB 03FF 00D4
        DECLE   $0046,  $03FF,  $0004,  $03FF   ; 6C68   0046 03FF 0004 03FF
        DECLE   $0000,  $03FF,  $0002,  $03FF   ; 6C6C   0000 03FF 0002 03FF
        DECLE   $03FF,  $01FD,  $03FF,  $03F3   ; 6C70   03FF 01FD 03FF 03F3
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C74   03FF 03FF 03FF 03FF
        DECLE   $03D6,  $03FF,  $03F2,  $03FF   ; 6C78   03D6 03FF 03F2 03FF
        DECLE   $03BF,  $03FF,  $03C9,  $03FF   ; 6C7C   03BF 03FF 03C9 03FF
        DECLE   $03FF,  $037F,  $03FF,  $03FF   ; 6C80   03FF 037F 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C84   03FF 03FF 03FF 03FF
        DECLE   $03FA,  $03FF,  $033C,  $03FF   ; 6C88   03FA 03FF 033C 03FF
        DECLE   $01DB,  $03FF,  $03FD,  $03FF   ; 6C8C   01DB 03FF 03FD 03FF
        DECLE   $03FF,  $009C,  $03FF,  $01B3   ; 6C90   03FF 009C 03FF 01B3
        DECLE   $03FF,  $00FE,  $03FF,  $02C3   ; 6C94   03FF 00FE 03FF 02C3
        DECLE   $0010,  $03FF,  $0068,  $03FF   ; 6C98   0010 03FF 0068 03FF
        DECLE   $0058,  $03FF,  $0080,  $03FF   ; 6C9C   0058 03FF 0080 03FF
        DECLE   $03FF,  $005B,  $03FF,  $014B   ; 6CA0   03FF 005B 03FF 014B
        DECLE   $03FF,  $038C,  $03FF,  $016D   ; 6CA4   03FF 038C 03FF 016D
        DECLE   $0051,  $03FF,  $0224,  $03FF   ; 6CA8   0051 03FF 0224 03FF
        DECLE   $0101,  $03FF,  $02EA,  $03FF   ; 6CAC   0101 03FF 02EA 03FF
        DECLE   $03FF,  $03DA,  $03FF,  $03FF   ; 6CB0   03FF 03DA 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $032E   ; 6CB4   03FF 03FF 03FF 032E
        DECLE   $0350,  $03FF,  $0372,  $03FF   ; 6CB8   0350 03FF 0372 03FF
        DECLE   $03FA,  $03FF,  $035F,  $03FF   ; 6CBC   03FA 03FF 035F 03FF
        DECLE   $03FF,  $03DF,  $03FF,  $03FA   ; 6CC0   03FF 03DF 03FF 03FA
        DECLE   $03FF,  $037F,  $03FF,  $035F   ; 6CC4   03FF 037F 03FF 035F
        DECLE   $0385,  $03FF,  $03EA,  $03FF   ; 6CC8   0385 03FF 03EA 03FF
        DECLE   $03CC,  $03FF,  $034A,  $03FF   ; 6CCC   03CC 03FF 034A 03FF
        DECLE   $03FF,  $0153,  $03FF,  $03D1   ; 6CD0   03FF 0153 03FF 03D1
        DECLE   $03FF,  $01FF,  $03FF,  $00B7   ; 6CD4   03FF 01FF 03FF 00B7
        DECLE   $0060,  $03FF,  $0165,  $03FF   ; 6CD8   0060 03FF 0165 03FF
        DECLE   $0020,  $03FF,  $0235,  $03FF   ; 6CDC   0020 03FF 0235 03FF
        DECLE   $03FF,  $00DE,  $03FF,  $018A   ; 6CE0   03FF 00DE 03FF 018A
        DECLE   $03FF,  $006B,  $03FF,  $02FA   ; 6CE4   03FF 006B 03FF 02FA
        DECLE   $0071,  $03FF,  $0020,  $03FF   ; 6CE8   0071 03FF 0020 03FF
        DECLE   $024C,  $03FF,  $008F,  $03FF   ; 6CEC   024C 03FF 008F 03FF
        DECLE   $03FF,  $03ED,  $03FF,  $03FB   ; 6CF0   03FF 03ED 03FF 03FB
        DECLE   $03FF,  $03FD,  $03FF,  $03BF   ; 6CF4   03FF 03FD 03FF 03BF
        DECLE   $03FF,  $03FF,  $03B3,  $03FF   ; 6CF8   03FF 03FF 03B3 03FF
        DECLE   $03FF,  $03FF,  $035E,  $03FF   ; 6CFC   03FF 03FF 035E 03FF
        DECLE   $03FF,  $02E6,  $03FF,  $03FF   ; 6D00   03FF 02E6 03FF 03FF
        DECLE   $03FF,  $03BF,  $03FF,  $03DF   ; 6D04   03FF 03BF 03FF 03DF
        DECLE   $03E0,  $03FF,  $0377,  $03FF   ; 6D08   03E0 03FF 0377 03FF
        DECLE   $03ED,  $03FF,  $035F,  $03FF   ; 6D0C   03ED 03FF 035F 03FF
        DECLE   $03FF,  $00BE,  $03FF,  $03DE   ; 6D10   03FF 00BE 03FF 03DE
        DECLE   $03FF,  $02C4,  $03FF,  $003D   ; 6D14   03FF 02C4 03FF 003D
        DECLE   $0081,  $03FF,  $02D1,  $03FF   ; 6D18   0081 03FF 02D1 03FF
        DECLE   $0182,  $03FF,  $0090,  $03FF   ; 6D1C   0182 03FF 0090 03FF
        DECLE   $03FF,  $0047,  $03FF,  $00FF   ; 6D20   03FF 0047 03FF 00FF
        DECLE   $03FF,  $009F,  $03FF,  $003B   ; 6D24   03FF 009F 03FF 003B
        DECLE   $0240,  $03FF,  $0050,  $03FF   ; 6D28   0240 03FF 0050 03FF
        DECLE   $0190,  $03FF,  $004E,  $03FF   ; 6D2C   0190 03FF 004E 03FF
        DECLE   $03FF,  $031F,  $03FF,  $03EF   ; 6D30   03FF 031F 03FF 03EF
        DECLE   $03FF,  $03FD,  $03FF,  $03FF   ; 6D34   03FF 03FD 03FF 03FF
        DECLE   $03E0,  $03FF,  $0394,  $03FF   ; 6D38   03E0 03FF 0394 03FF
        DECLE   $03FA,  $03FF,  $03F4,  $03FF   ; 6D3C   03FA 03FF 03F4 03FF
        DECLE   $03FF,  $039E,  $03FF,  $03FF   ; 6D40   03FF 039E 03FF 03FF
        DECLE   $03FF,  $03DF,  $03FF,  $033B   ; 6D44   03FF 03DF 03FF 033B
        DECLE   $01B7,  $03FF,  $030E,  $03FF   ; 6D48   01B7 03FF 030E 03FF
        DECLE   $03DF,  $03FF,  $0307,  $03FF   ; 6D4C   03DF 03FF 0307 03FF
        DECLE   $03FF,  $023D,  $03FF,  $003D   ; 6D50   03FF 023D 03FF 003D
        DECLE   $03FF,  $00EF,  $03FF,  $0070   ; 6D54   03FF 00EF 03FF 0070
        DECLE   $0168,  $03FF,  $0044,  $03FF   ; 6D58   0168 03FF 0044 03FF
        DECLE   $0004,  $03FF,  $0001,  $03FF   ; 6D5C   0004 03FF 0001 03FF
        DECLE   $03FF,  $0210,  $03FF,  $02AF   ; 6D60   03FF 0210 03FF 02AF
        DECLE   $03FF,  $0075,  $03FF,  $0279   ; 6D64   03FF 0075 03FF 0279
        DECLE   $0080,  $03FF,  $0180,  $03FF   ; 6D68   0080 03FF 0180 03FF
        DECLE   $0270,  $03FF,  $00CB,  $03FF   ; 6D6C   0270 03FF 00CB 03FF
        DECLE   $03FF,  $03DE,  $03FF,  $03DF   ; 6D70   03FF 03DE 03FF 03DF
        DECLE   $03FF,  $036F,  $03FF,  $03FF   ; 6D74   03FF 036F 03FF 03FF
        DECLE   $0319,  $03FF,  $01F7,  $03FF   ; 6D78   0319 03FF 01F7 03FF
        DECLE   $034C,  $03FF,  $03ED,  $03FF   ; 6D7C   034C 03FF 03ED 03FF
        DECLE   $03FF,  $0197,  $03FF           ; 6D80   03FF 0197 03FF

        XORI    #$03FF, R6                      ; 6D83   03FE 03FF
        SUB@    R6,     R7                      ; 6D85   0337

        DECLE   $03FF,  $03BF,  $03AE,  $03FF   ; 6D86   03FF 03BF 03AE 03FF
        DECLE   $03EA,  $03FF,  $03E2,  $03FF   ; 6D8A   03EA 03FF 03E2 03FF
        DECLE   $03A6,  $03FF,  $03FF,  $0193   ; 6D8E   03A6 03FF 03FF 0193
        DECLE   $03FF,  $0045,  $03FF,  $020B   ; 6D92   03FF 0045 03FF 020B
        DECLE   $03FF                           ; 6D96   03FF

        ADD@    R3,     R7                      ; 6D97   02DF
        B       L_699A                          ; 6D98   0220 03FF

        DECLE   $0320,  $03FF,  $0108,  $03FF   ; 6D9A   0320 03FF 0108 03FF
        DECLE   $0008,  $03FF,  $03FF,  $02BF   ; 6D9E   0008 03FF 03FF 02BF
        DECLE   $03FF,  $014B,  $03FF,  $015E   ; 6DA2   03FF 014B 03FF 015E
        DECLE   $03FF,  $00CE,  $0010,  $03FF   ; 6DA6   03FF 00CE 0010 03FF
        DECLE   $0361,  $03FF,  $004E,  $03FF   ; 6DAA   0361 03FF 004E 03FF
        DECLE   $0004,  $03FF,  $03FF,  $02FF   ; 6DAE   0004 03FF 03FF 02FF
        DECLE   $03FF,  $039C,  $03FF,  $03A9   ; 6DB2   03FF 039C 03FF 03A9
        DECLE   $03FF,  $03BB,  $03DB,  $03FF   ; 6DB6   03FF 03BB 03DB 03FF
        DECLE   $0376,  $03FF,  $034A,  $03FF   ; 6DBA   0376 03FF 034A 03FF
        DECLE   $01FE,  $03FF,  $03FF,  $02FF   ; 6DBE   01FE 03FF 03FF 02FF
        DECLE   $03FF,  $03DF,  $03FF,  $03EB   ; 6DC2   03FF 03DF 03FF 03EB
        DECLE   $03FF,  $03AF,  $03CF,  $03FF   ; 6DC6   03FF 03AF 03CF 03FF
        DECLE   $0333,  $03FF,  $023A,  $03FF   ; 6DCA   0333 03FF 023A 03FF
        DECLE   $038E,  $03FF,  $03FF,  $0077   ; 6DCE   038E 03FF 03FF 0077
        DECLE   $03FF,  $00B7,  $03FF,  $037A   ; 6DD2   03FF 00B7 03FF 037A
        DECLE   $03FF,  $009B,  $0004,  $03FF   ; 6DD6   03FF 009B 0004 03FF
        DECLE   $00AC,  $03FF,  $0010,  $03FF   ; 6DDA   00AC 03FF 0010 03FF
        DECLE   $0202,  $03FF,  $03FF,  $003B   ; 6DDE   0202 03FF 03FF 003B
        DECLE   $03FF,  $00BC,  $03FF,  $027B   ; 6DE2   03FF 00BC 03FF 027B
        DECLE   $03FF,  $02AA,  $0030,  $03FF   ; 6DE6   03FF 02AA 0030 03FF
        DECLE   $0005,  $03FF,  $0200,  $03FF   ; 6DEA   0005 03FF 0200 03FF
        DECLE   $0320,  $03FF,  $03FF,  $03BF   ; 6DEE   0320 03FF 03FF 03BF
        DECLE   $03FF,  $03BE,  $03FF,  $03BA   ; 6DF2   03FF 03BE 03FF 03BA
        DECLE   $03FF,  $03DD,  $027F,  $03FF   ; 6DF6   03FF 03DD 027F 03FF
        DECLE   $03B1,  $03FF,  $0377,  $03FF   ; 6DFA   03B1 03FF 0377 03FF
        DECLE   $03F5,  $03FF,  $03FF,  $037F   ; 6DFE   03F5 03FF 03FF 037F
        DECLE   $03FF,  $01B7,  $03FF,  $03BA   ; 6E02   03FF 01B7 03FF 03BA
        DECLE   $03FF,  $03FB,  $0353,  $03FF   ; 6E06   03FF 03FB 0353 03FF
        DECLE   $03F2,  $03FF,  $01AA,  $03FF   ; 6E0A   03F2 03FF 01AA 03FF
        DECLE   $03DD,  $03FF,  $03FF,  $037D   ; 6E0E   03DD 03FF 03FF 037D
        DECLE   $03FF,  $02A5,  $03FF,  $0034   ; 6E12   03FF 02A5 03FF 0034
        DECLE   $03FF,  $0073,  $0080,  $03FF   ; 6E16   03FF 0073 0080 03FF
        DECLE   $0050,  $03FF,  $0038,  $03FF   ; 6E1A   0050 03FF 0038 03FF
        DECLE   $0200,  $03FF,  $03FF,  $026F   ; 6E1E   0200 03FF 03FF 026F
        DECLE   $03FF,  $009E,  $03FF,  $009D   ; 6E22   03FF 009E 03FF 009D
        DECLE   $03FF,  $007F,  $0105,  $03FF   ; 6E26   03FF 007F 0105 03FF
        DECLE   $0248,  $03FF,  $0208,  $03FF   ; 6E2A   0248 03FF 0208 03FF
        DECLE   $00AA,  $03FF,  $03FF,  $03BF   ; 6E2E   00AA 03FF 03FF 03BF
        DECLE   $03FF,  $039E,  $03FF,  $03FE   ; 6E32   03FF 039E 03FF 03FE
        DECLE   $03FF,  $03BB,  $0372,  $03FF   ; 6E36   03FF 03BB 0372 03FF
        DECLE   $0372,  $03FF,  $038E,  $03FF   ; 6E3A   0372 03FF 038E 03FF
        DECLE   $0373,  $03FF,  $03FF,  $03F5   ; 6E3E   0373 03FF 03FF 03F5
        DECLE   $03FF,  $03DF,  $03FF,  $03DF   ; 6E42   03FF 03DF 03FF 03DF
        DECLE   $03FF,  $03FB,  $0332,  $03FF   ; 6E46   03FF 03FB 0332 03FF
        DECLE   $0388,  $03FF,  $03D3,  $03FF   ; 6E4A   0388 03FF 03D3 03FF
        DECLE   $037B,  $03FF,  $03FF,  $00F7   ; 6E4E   037B 03FF 03FF 00F7
        DECLE   $03FF,  $00BB,  $03FF,  $03BD   ; 6E52   03FF 00BB 03FF 03BD
        DECLE   $03FF,  $00B8,  $0144,  $03FF   ; 6E56   03FF 00B8 0144 03FF
        DECLE   $0001,  $03FF,  $0280,  $03FF   ; 6E5A   0001 03FF 0280 03FF
        DECLE   $0006,  $03FF,  $03FF           ; 6E5E   0006 03FF 03FF

        BGE     L_6A63                          ; 6E61   022D 03FF
        SUBR    R5,     R7                      ; 6E63   012F

        DECLE   $03FF,  $00FE,  $03FF,  $0075   ; 6E64   03FF 00FE 03FF 0075
        DECLE   $0128,  $03FF,  $0020,  $03FF   ; 6E68   0128 03FF 0020 03FF
        DECLE   $0080,  $03FF,  $0000,  $03FF   ; 6E6C   0080 03FF 0000 03FF
        DECLE   $03FF,  $03FE,  $03FF,  $03F5   ; 6E70   03FF 03FE 03FF 03F5
        DECLE   $03FF,  $03BF,  $03FF,  $037D   ; 6E74   03FF 03BF 03FF 037D
        DECLE   $0366,  $03FF,  $02F4,  $03FF   ; 6E78   0366 03FF 02F4 03FF
        DECLE   $03CC,  $03FF,  $03A7,  $03FF   ; 6E7C   03CC 03FF 03A7 03FF
        DECLE   $03FF,  $01FF,  $03FF,  $03FB   ; 6E80   03FF 01FF 03FF 03FB
        DECLE   $03FF,  $036D,  $03FF           ; 6E84   03FF 036D 03FF

        XOR@    R6,     R3                      ; 6E87   03F3
        SUB     G_03FF, R7                      ; 6E88   0307 03FF

        DECLE   $0302,  $03FF,  $03AF,  $03FF   ; 6E8A   0302 03FF 03AF 03FF
        DECLE   $0393,  $03FF,  $03FF,  $01FF   ; 6E8E   0393 03FF 03FF 01FF
        DECLE   $03FF,  $00F5,  $03FF,  $0011   ; 6E92   03FF 00F5 03FF 0011
        DECLE   $03FF,  $0154,  $0200,  $03FF   ; 6E96   03FF 0154 0200 03FF
        DECLE   $0080,  $03FF,  $0000,  $03FF   ; 6E9A   0080 03FF 0000 03FF
        DECLE   $0144,  $03FF,  $03FF,  $007E   ; 6E9E   0144 03FF 03FF 007E
        DECLE   $03FF,  $01BD,  $03FF,  $027C   ; 6EA2   03FF 01BD 03FF 027C
        DECLE   $03FF,  $026C,  $01C0,  $03FF   ; 6EA6   03FF 026C 01C0 03FF
        DECLE   $0010,  $03FF,  $0204,  $03FF   ; 6EAA   0010 03FF 0204 03FF
        DECLE   $0000,  $03FF,  $03FF,  $03A7   ; 6EAE   0000 03FF 03FF 03A7
        DECLE   $03FF,  $02FF,  $03FF,  $03FF   ; 6EB2   03FF 02FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FC,  $03FF   ; 6EB6   03FF 03FF 03FC 03FF
        DECLE   $036E,  $03FF,  $03AA,  $03FF   ; 6EBA   036E 03FF 03AA 03FF
        DECLE   $0211,  $03FF,  $03FF,  $03FF   ; 6EBE   0211 03FF 03FF 03FF
        DECLE   $03FF,  $03FD,  $03FF,  $037F   ; 6EC2   03FF 03FD 03FF 037F
        DECLE   $03FF,  $0318,  $038B,  $03FF   ; 6EC6   03FF 0318 038B 03FF
        DECLE   $03BD,  $03FF,  $02EA,  $03FF   ; 6ECA   03BD 03FF 02EA 03FF
        DECLE   $03A6,  $03FF,  $03FF,  $001E   ; 6ECE   03A6 03FF 03FF 001E
        DECLE   $03FF,  $0059,  $03FF,  $016E   ; 6ED2   03FF 0059 03FF 016E
        DECLE   $03FF,  $0163,  $0002,  $03FF   ; 6ED6   03FF 0163 0002 03FF
        DECLE   $0008,  $03FF,  $0220,  $03FF   ; 6EDA   0008 03FF 0220 03FF
        DECLE   $0082,  $03FF,  $03FF,  $0231   ; 6EDE   0082 03FF 03FF 0231
        DECLE   $03FF,  $02B1,  $03FF,  $0077   ; 6EE2   03FF 02B1 03FF 0077
        DECLE   $03FF,  $02EB,  $0042,  $03FF   ; 6EE6   03FF 02EB 0042 03FF
        DECLE   $0280,  $03FF,  $0105,  $03FF   ; 6EEA   0280 03FF 0105 03FF
        DECLE   $0202,  $03FF,  $03FF,  $03EF   ; 6EEE   0202 03FF 03FF 03EF
        DECLE   $03FF,  $032F,  $03FF,  $037F   ; 6EF2   03FF 032F 03FF 037F
        DECLE   $03FF,  $03FB,  $0319,  $03FF   ; 6EF6   03FF 03FB 0319 03FF
        DECLE   $03BC,  $03FF,  $0372,  $03FF   ; 6EFA   03BC 03FF 0372 03FF
        DECLE   $03F7,  $03FF,  $03FF,  $03F7   ; 6EFE   03F7 03FF 03FF 03F7
        DECLE   $03FF,  $037F,  $03FF,  $03E7   ; 6F02   03FF 037F 03FF 03E7
        DECLE   $03FF,  $037F,  $03F0,  $03FF   ; 6F06   03FF 037F 03F0 03FF
        DECLE   $037F,  $03FF,  $03FB,  $03FF   ; 6F0A   037F 03FF 03FB 03FF
        DECLE   $03E0,  $03FF,  $03FF,  $00B6   ; 6F0E   03E0 03FF 03FF 00B6
        DECLE   $03FF,  $03FF,  $03FF,  $003F   ; 6F12   03FF 03FF 03FF 003F
        DECLE   $03FF,  $006F,  $0000,  $03FF   ; 6F16   03FF 006F 0000 03FF
        DECLE   $0200,  $03FF,  $0090,  $03FF   ; 6F1A   0200 03FF 0090 03FF
        DECLE   $0080,  $03FF,  $00F0,  $00B0   ; 6F1E   0080 03FF 00F0 00B0
        DECLE   $00F0,  $00C0,  $00F0,  $0060   ; 6F22   00F0 00C0 00F0 0060
        DECLE   $00F0,  $00C0,  $0004,  $03FF   ; 6F26   00F0 00C0 0004 03FF
        DECLE   $0011,  $03FF,  $0010,  $03FF   ; 6F2A   0011 03FF 0010 03FF
        DECLE   $03CC,  $03FF,  $03FF,  $03DD   ; 6F2E   03CC 03FF 03FF 03DD
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F32   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FD,  $039A,  $03FF   ; 6F36   03FF 03FD 039A 03FF
        DECLE   $005C,  $03FF,  $03F9,  $03FF   ; 6F3A   005C 03FF 03F9 03FF
        DECLE   $03F4,  $03FF,  $03FD,  $00B6   ; 6F3E   03F4 03FF 03FD 00B6
        DECLE   $03FF,  $027E,  $03F7,  $00FE   ; 6F42   03FF 027E 03F7 00FE
        DECLE   $00FF,  $003C,  $03AE,  $03FF   ; 6F46   00FF 003C 03AE 03FF
        DECLE   $039C,  $03FF,  $03FF,  $03FF   ; 6F4A   039C 03FF 03FF 03FF
        DECLE   $036A,  $03FF,  $01F0,  $0060   ; 6F4E   036A 03FF 01F0 0060
        DECLE   $00F0,  $0090,  $00F0,  $00E0   ; 6F52   00F0 0090 00F0 00E0
        DECLE   $00F0,  $0000,  $0000,  $03FF   ; 6F56   00F0 0000 0000 03FF
        DECLE   $0240,  $03FF,  $0000,  $03FF   ; 6F5A   0240 03FF 0000 03FF
        DECLE   $03E9,  $03FF,  $00F0,  $0050   ; 6F5E   03E9 03FF 00F0 0050
        DECLE   $00F0,  $0060,  $00F0,  $00E0   ; 6F62   00F0 0060 00F0 00E0
        DECLE   $00F0,  $0090,  $0020,  $03FF   ; 6F66   00F0 0090 0020 03FF
        DECLE   $0120,  $03FF,  $0286,  $03FF   ; 6F6A   0120 03FF 0286 03FF
        DECLE   $0060,  $03FF,  $03FF,  $01FE   ; 6F6E   0060 03FF 03FF 01FE
        DECLE   $03F7,  $00F7,  $03FF,  $00FB   ; 6F72   03F7 00F7 03FF 00FB
        DECLE   $03FF,  $00BF,  $0389,  $03FF   ; 6F76   03FF 00BF 0389 03FF
        DECLE   $0388,  $03FF,  $017F,  $03FF   ; 6F7A   0388 03FF 017F 03FF
        DECLE   $0379,  $03FF,  $03FF,  $00A7   ; 6F7E   0379 03FF 03FF 00A7
        DECLE   $03FF                           ; 6F82   03FF

        ADDI    #$03FF, R5                      ; 6F83   02FD 03FF
        MVI@    R3,     R7                      ; 6F85   029F

        XOR@    R6,     R5                      ; 6F86   03F5
        ADD@    R4,     R7                      ; 6F87   02E7

        DECLE   $0355,  $03FF,  $03CE,  $03FF   ; 6F88   0355 03FF 03CE 03FF
        DECLE   $03DF,  $03FF,  $039A,  $03FF   ; 6F8C   03DF 03FF 039A 03FF
        DECLE   $00F0,  $00E0,  $02F0,  $0060   ; 6F90   00F0 00E0 02F0 0060
        DECLE   $01F0,  $0040,  $00F0,  $0020   ; 6F94   01F0 0040 00F0 0020
        DECLE   $0104,  $03FF,  $0098,  $03FF   ; 6F98   0104 03FF 0098 03FF
        DECLE   $0028,  $03FF,  $0280,  $03FF   ; 6F9C   0028 03FF 0280 03FF
        DECLE   $02F0,  $0040,  $02F0,  $0080   ; 6FA0   02F0 0040 02F0 0080
        DECLE   $00F0,  $00D0,  $00F0,  $00C0   ; 6FA4   00F0 00D0 00F0 00C0
        DECLE   $0144,  $03FF,  $0080,  $03FF   ; 6FA8   0144 03FF 0080 03FF
        DECLE   $0000,  $03FF,  $0000,  $03FF   ; 6FAC   0000 03FF 0000 03FF
        DECLE   $03FF,  $0279,  $03F2,  $01BD   ; 6FB0   03FF 0279 03F2 01BD
        DECLE   $03FA,  $00FF,  $03FA,  $0076   ; 6FB4   03FA 00FF 03FA 0076
        DECLE   $03FC,  $03FF,  $038A,  $03FF   ; 6FB8   03FC 03FF 038A 03FF
        DECLE   $022B,  $03FF,  $030B,  $03FF   ; 6FBC   022B 03FF 030B 03FF
        DECLE   $03FF,  $02DA,  $03FF,  $02F4   ; 6FC0   03FF 02DA 03FF 02F4
        DECLE   $03FD,  $00C5,  $03FF,  $0076   ; 6FC4   03FD 00C5 03FF 0076
        DECLE   $025A,  $03FF,  $03C9,  $03FF   ; 6FC8   025A 03FF 03C9 03FF
        DECLE   $016D,  $03FF,  $02F4,  $03FF   ; 6FCC   016D 03FF 02F4 03FF
        DECLE   $00F0,  $00D0,  $00F0,  $0000   ; 6FD0   00F0 00D0 00F0 0000
        DECLE   $00F0,  $00E0,  $00F0,  $00B0   ; 6FD4   00F0 00E0 00F0 00B0
        DECLE   $0000,  $03FF,  $0184,  $03FF   ; 6FD8   0000 03FF 0184 03FF
        DECLE   $0064,  $03FF,  $0018,  $03FF   ; 6FDC   0064 03FF 0018 03FF
        DECLE   $00F0,  $0050,  $00F0,  $0040   ; 6FE0   00F0 0050 00F0 0040
        DECLE   $00F0,  $00F0,  $00F0,  $0040   ; 6FE4   00F0 00F0 00F0 0040
        DECLE   $02A0,  $03FF,  $01A0,  $03FF   ; 6FE8   02A0 03FF 01A0 03FF
        DECLE   $0125,  $03FF,  $0000,  $03FF   ; 6FEC   0125 03FF 0000 03FF
        DECLE   $03F7,  $00F7,  $03FB,  $00B3   ; 6FF0   03F7 00F7 03FB 00B3
        DECLE   $03FF,  $00FD,  $03FF,  $00F3   ; 6FF4   03FF 00FD 03FF 00F3
        DECLE   $0347,  $03FF,  $0382,  $03FF   ; 6FF8   0347 03FF 0382 03FF
        DECLE   $036E,  $03FF                   ; 6FFC   036E 03FF

        CMPR    R6,     R7                      ; 6FFE   0177
        DECLE   $03FF                           ; 6FFF   03FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $501E       <entry>
;;  $5061       $501F   $5125  
;;  $506A       <entry>
;;  $506B       $5310  
;;  $5111       $5115  
;;  $5113       $50FD  
;;  $5128       $5292   $52A3  
;;  $514C       $5155  
;;  $516C       $5162  
;;  $517C       $5170   $5174   $5178  
;;  $5180       $5183  
;;  $5189       $518E  
;;  $51AA       $51A4  
;;  $51B2       $51B7  
;;  $51B9       $5193  
;;  $51C3       $50AD   $50B1   $50E6   $50EA   $51FC   $520B   $5213   $530E  
;;  $51C3       $5331   $5336   $5371  
;;  $51FA       $5206  
;;  $5219       $5200   $520F  
;;  $521F       $5863   $5F09  
;;  $5240       $523C   $5B95  
;;  $5264       <entry>
;;  $527A       $5281  
;;  $5289       $526D   $5272  
;;  $5298       $5299  
;;  $52AC       $528C  
;;  $52CD       $52C5  
;;  $52DE       $52D0  
;;  $532D       <entry>
;;  $5361       $535D  
;;  $5363       $5359  
;;  $5373       $536D  
;;  $5377       $5363   $5373  
;;  $537B       $538C  
;;  $538B       $537F   $5383  
;;  $5397       $533B  
;;  $53AE       $5649  
;;  $53E0       $5453  
;;  $53F0       $53EA  
;;  $53F2       $53EE  
;;  $53FF       $53F9  
;;  $5401       $53FD  
;;  $5403       $53E3  
;;  $540B       $5447   $5474  
;;  $5415       $543F  
;;  $542E       $542B  
;;  $543B       $5426  
;;  $543C       $5432  
;;  $5441       $540F  
;;  $5445       $53B0  
;;  $5466       $544F  
;;  $54AB       $5449  
;;  $54B9       $54CF   $553C  
;;  $54BD       $54C7  
;;  $54DE       $53DE   $551D   $554B  
;;  $54EC       $550A   $5C0E  
;;  $54F4       $5502  
;;  $5583       $557D  
;;  $55B9       $5658  
;;  $55C5       $55C0  
;;  $55C8       $55C2  
;;  $55D5       $5606  
;;  $55E9       $560E  
;;  $55F4       $55F1  
;;  $5602       $55DC   $55E0   $55F6  
;;  $5609       $55DA  
;;  $5610       $55FE  
;;  $5645       <entry>
;;  $5654       $564E  
;;  $5661       $5667  
;;  $567D       $567A  
;;  $567F       $5674  
;;  $5689       $5682  
;;  $568D       $56BF  
;;  $569D       $5697  
;;  $56A3       $569E  
;;  $56AD       $56A9  
;;  $56B1       $56A1  
;;  $56BD       $56B8  
;;  $56C1       $56B2  
;;  $56C5       $5687   $569B   $56AF  
;;  $56C9       $56CE  
;;  $56D2       $5189   $52DB   $5347   $56C9  
;;  $56E1       $56DB  
;;  $56E7       $56F1   $56F7   $56FB   $570A  
;;  $56EC       $56EF  
;;  $56F3       $5715  
;;  $56FF       $56E9  
;;  $570C       $56FF  
;;  $5717       $5785   $595E  
;;  $571A       $5722  
;;  $5725       $56D0  
;;  $572C       $577E  
;;  $5741       $573E  
;;  $574C       $5746  
;;  $574D       $5748  
;;  $575C       $5750  
;;  $575D       $575A  
;;  $5762       $5758  
;;  $576A       $5754  
;;  $5776       $5760  
;;  $5779       $5736   $573A   $5768  
;;  $57E8       $5792   $579A  
;;  $57EE       $5796  
;;  $57EF       $579E   $57EA  
;;  $5812       $5A16   $5A6C  
;;  $582C       $5829  
;;  $5832       $582F  
;;  $583E       $55C5   $565B   $5783   $5788   $5790   $57EC   $595C   $5961  
;;  $585B       $5853  
;;  $5866       $585B   $58D8  
;;  $5874       $586C  
;;  $5882       $55CC   $55D1   $571C   $586A   $5872   $587B   $587F  
;;  $5883       $584D   $588B  
;;  $588F       $5887  
;;  $5896       $58A8  
;;  $58A2       $589C  
;;  $58BE       $58B4  
;;  $58C3       $589F  
;;  $58D8       $58C5  
;;  $58E5       $588F   $58D1  
;;  $58F0       $58EC  
;;  $58F2       $5843   $584A   $5856   $5884   $58CC  
;;  $5909       $58F6   $58FB   $5903  
;;  $5912       $5907  
;;  $5958       $5728  
;;  $59A3       $5846   $5859   $585E   $588D   $58BC   $58C1   $58C9   $58CF  
;;  $59A3       $58D6   $58DB   $58E3  
;;  $59BB       $59B1   $59B5  
;;  $59C3       $59ED  
;;  $59DE       $59D4  
;;  $59E6       $59D8  
;;  $59E8       $59DC   $59E4  
;;  $59E9       $59CA   $59D0  
;;  $5A9F       <entry>
;;  $5AAD       $5AAA  
;;  $5AC5       $5AB5   $5AB9   $5ABD  
;;  $5AD9       $5AD1  
;;  $5B10       $5B0C  
;;  $5B17       $5B11  
;;  $5B5D       $5B4A  
;;  $5B61       $5B89  
;;  $5B70       $5437  
;;  $5BAA       $5B8E  
;;  $5C3D       $5BA8  
;;  $5C4B       $5208   $5C7B  
;;  $5C60       $5AA3   $5B4E   $5B5B   $5B74   $5B79   $5C5D   $5C7E   $5C93  
;;  $5C61       $58E0   $5B5D   $5B61  
;;  $5C99       $5C85  
;;  $5C9C       $521C   $5B9A   $5BE6   $5C88  
;;  $5CB0       $5CAA  
;;  $5CFA       $514D   $5765   $5BA5   $5C3A   $5C3F   $5C44  
;;  $5D1C       $5AC2  
;;  $5D1F       $5AC8   $5AD7   $5B14  
;;  $5D2B       $5D31  
;;  $5D33       $5D1D  
;;  $5D3B       $5D2C  
;;  $5D54       $5D4A   $5D4E  
;;  $5DCE       $5D38   $5D63   $5D67   $5D6B  
;;  $5DD6       $5DD3  
;;  $5DE8       $5DE3  
;;  $5DF3       $5DF0   $5DF9  
;;  $5DFC       $5DDC  
;;  $5E00       $5147  
;;  $5E15       $5E1B  
;;  $5E1D       $5E0F  
;;  $5E23       $5E28  
;;  $5E30       $5E38  
;;  $5E3B       $5219   $52F4   $5860   $5F06  
;;  $5E48       $5E56  
;;  $5E5E       $5E69  
;;  $5E70       $5441   $583E  
;;  $5E85       $5E82  
;;  $5E88       $5E7A  
;;  $5E9D       $5EA7  
;;  $5EA9       $5E9F  
;;  $5EB4       $5EBC  
;;  $5ECD       $5D57   $5E8D   $5EC6   $5EE9   $5EF9   $5F44  
;;  $5ECE       $5EBE  
;;  $5EDE       $51BC   $52BB   $5F96  
;;  $5EF5       <entry>
;;  $5F0C       $5C95  
;;  $5F17       $5F13  
;;  $5F1A       $51B9  
;;  $5F1B       $5F00   $5F19  
;;  $5F2F       $5F27   $5F2B  
;;  $5F30       $5F36  
;;  $5F38       $5F32  
;;  $5F5A       $51C0   $5216   $52BF   $52CA   $5B92   $5BAC   $5C8D  
;;  $5F6C       $5F69  
;;  $5F70       $5F5F  
;;  $5F7B       $5F78  
;;  $5F7D       $5F6E  
;;  $5F9B       $5F85   $5F8A  
;;  $5FA4       <entry>
;;  $5FA6       $5FC9  
;;  $5FC5       $5FA8   $5FB1   $5FB7   $5FBB  
;;  $5FCC       $5CCA  
;;  $5FDA       $563A  
;;  $5FE7       $52FD   $5DE8  
;;  $5FEE       $578A  
;;  $5FF7       $5FF4  
;;  $5FFB       $5FF8  
;;  $5FFF       $5FFC  
;;  $6004       $58AC  
;;  $6663       $6A61  
;;  $6881       $687F  
;;  $6921       $6921  
;;  $699A       $6D98  
;;  $6A63       $6E61  
;; ======================================================================== ;;
