
        ORG     $5000
.HEADER:
        BIDECLE $5D0B           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $50B4           ; 5004  Ptr: Start of game
        BIDECLE $6D9F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5093           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $005D,  $0064,  $000F,  $0000; 5020  Timer dispatch/interval
        DECLE   $0018,  $0051,  $0003,  $0000; 5024  Timer dispatch/interval
        DECLE   $00D1,  $006C,  $0001,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

.TITLE:
        DECLE   $0052                           ; 502E  Cartridge year
        STRING  "MINOTAUR"                      ; 502F  Title string
        DECLE   $0000                           ; 5037  

        DECLE   $0314,  $0331,  $0020,  $0020   ; 5038   0314 0331 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 503C   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5040   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5044   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5048   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 504C   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5050   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5054   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5058   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 505C   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5060   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5064   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5068   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 506C   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5070   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5074   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5078   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 507C   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5080   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5084   0020 0020 0020 0020
        DECLE   $0020,  $0000                   ; 5088   0020 0000

        MVII    #$02C9, R4                      ; 508A   02BC 02C9
        MVII    #$02DD, R1                      ; 508C   02B9 02DD
        MVII    #$000B, R0                      ; 508E   02B8 000B
        J       .EXEC.731                       ; 5090   0004 0314 0331

.GRAM_INIT_5093:
        DECLE   $0028           ; 5093  # of GRAM cards to init
        DECLE   $0001,  $0002   ; 5094  #00   :  Algo #1
        DECLE   $0081,  $0040   ; 5096  #01-01:  GRAM #00-00 --I-
        DECLE   $0281,  $0036   ; 5098  #02   :  Algo #1
        DECLE   $02FF,  $01CE   ; 509A  #03   :  Algo #1
        DECLE   $02FF,  $01C6   ; 509C  #04   :  Algo #1
        DECLE   $02E1,  $0066   ; 509E  #05   :  Algo #1
        DECLE   $02B9,  $0006   ; 50A0  #06   :  Algo #1
        DECLE   $0281,  $01DE   ; 50A2  #07   :  Algo #1
        DECLE   $02E1,  $006E   ; 50A4  #08   :  Algo #1
        DECLE   $02B9,  $000E   ; 50A6  #09   :  Algo #1
        DECLE   $0281,  $01D6   ; 50A8  #0A   :  Algo #1
        DECLE   $0105,  $03C0   ; 50AA  #0B-12:  GRAM #02-09 -Y--
        DECLE   $0115,  $0040   ; 50AC  #13-13:  GRAM #0A-0A -Y--
        DECLE   $0201,  $03C0   ; 50AE  #14-1B:  GRAM #00-07 X---
        DECLE   $0211,  $03C0   ; 50B0  #1C-23:  GRAM #08-0F X---
        DECLE   $0221,  $01C0   ; 50B2  #24-27:  GRAM #10-13 X---

.START:
        PSHR    R5                              ; 50B4   0275
        MVII    #$0040, R0                      ; 50B5   02B8 0040
        MVII    #$031D, R4                      ; 50B7   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 50B9   0004 0114 0338

        MVII    #$0100, R4                      ; 50BC   02BC 0100
        SDBD                                    ; 50BE   0001
        MVI@    R4,     R0                      ; 50BF   02A0
        MVO     R0,     G_034C                  ; 50C0   0240 034C
        MVI     G_035E, R1                      ; 50C2   0281 035E
        MVO     R1,     G_033C                  ; 50C4   0241 033C
        MVII    #$0006, R0                      ; 50C6   02B8 0006
        SUB     G_0103, R0                      ; 50C8   0300 0103
        MVO     R0,     G_0139                  ; 50CA   0240 0139
        BNEQ    L_50D1                          ; 50CC   020C 0003

        MVII    #$0127, R1                      ; 50CE   02B9 0127
        COMR    R1                              ; 50D0   0019
L_50D1:
        MVO     R1,     G_035C                  ; 50D1   0241 035C
        SLL     R0,     1                       ; 50D3   0048
        NEGR    R0                              ; 50D4   0020
        ADDI    #$0012, R0                      ; 50D5   02F8 0012
        MVII    #$0167, R4                      ; 50D7   02BC 0167
        MVO@    R0,     R4                      ; 50D9   0260
        MVO     R0,     G_016A                  ; 50DA   0240 016A
        SLR     R0,     1                       ; 50DC   0060
        MVO     R0,     G_017D                  ; 50DD   0240 017D
        MVO@    R0,     R4                      ; 50DF   0260
        MVO@    R0,     R4                      ; 50E0   0260
        MVO     R0,     G_017C                  ; 50E1   0240 017C
        MVII    #$0004, R0                      ; 50E3   02B8 0004
        MVO     R0,     G_0103                  ; 50E5   0240 0103
        SLR     R0,     2                       ; 50E7   0064
        MVO     R0,     G_0184                  ; 50E8   0240 0184
        MVII    #$0028, R1                      ; 50EA   02B9 0028
        MVO     R1,     G_0175                  ; 50EC   0241 0175
        MVII    #$0081, R0                      ; 50EE   02B8 0081
        MVO     R0,     G_015E                  ; 50F0   0240 015E

        JSR     R5,     L_6CD1                  ; 50F2   0004 016C 00D1

L_50F5:
        MVII    #$000C, R0                      ; 50F5   02B8 000C

        JSR     R5,     X_RAND2                 ; 50F7   0004 0114 029E

        MOVR    R0,     R1                      ; 50FA   0081
        ADDI    #$0268, R1                      ; 50FB   02F9 0268
        MVI@    R1,     R1                      ; 50FD   0289
        ANDI    #$01F8, R1                      ; 50FE   03B9 01F8
        CMPI    #$00C8, R1                      ; 5100   0379 00C8
        BEQ     L_5108                          ; 5102   0204 0004

        CMPI    #$00D8, R1                      ; 5104   0379 00D8
        BNEQ    L_50F5                          ; 5106   022C 0012

L_5108:
        MVO     R0,     G_015F                  ; 5108   0240 015F

        JSR     R5,     .EXEC.A61               ; 510A   0004 0118 0261

        RLC     R0,     1                       ; 510D   0050
        MVII    #$0080, R0                      ; 510E   02B8 0080
        MVO     R0,     G_015E                  ; 5110   0240 015E

        JSR     R5,     L_6C90                  ; 5112   0004 016C 0090
        JSR     R5,     L_58FE                  ; 5115   0004 0158 00FE

L_5118:
        PSHR    R5                              ; 5118   0275
        MVI     G_0138, R0                      ; 5119   0280 0138
        ADD     G_015E, R0                      ; 511B   02C0 015E
        BNEQ    L_5261                          ; 511D   020C 0142

        SDBD                                    ; 511F   0001
        MVII    #$6805, R1                      ; 5120   02B9 0005 0068
        MVO     R1,     G_035D                  ; 5123   0241 035D
        ADD     G_018C, R0                      ; 5125   02C0 018C
        BNEQ    L_5190                          ; 5127   020C 0067

        MVI     G_018F, R0                      ; 5129   0280 018F
        MOVR    R0,     R1                      ; 512B   0081
        SWAP    R1,     2                       ; 512C   0045
        BPL     L_5166                          ; 512D   0203 0037

        CLRR    R1                              ; 512F   01C9
        MVO     R1,     G_018F                  ; 5130   0241 018F
        MVI     G_0185, R0                      ; 5132   0280 0185
        INCR    R0                              ; 5134   0008
        MVO     R0,     G_0185                  ; 5135   0240 0185
        SARC    R0,     1                       ; 5137   0078
        BC      L_5152                          ; 5138   0201 0018

        JSR     R5,     L_6EE2                  ; 513A   0004 016C 02E2

        TSTR    R3                              ; 513D   009B
        BNEQ    L_5152                          ; 513E   020C 0012

        MVI     G_015F, R0                      ; 5140   0280 015F
        MVI     G_0183, R1                      ; 5142   0281 0183
        MOVR    R1,     R3                      ; 5144   008B
        MVII    #$0001, R2                      ; 5145   02BA 0001
        ANDI    #$0002, R1                      ; 5147   03B9 0002
        SUBR    R1,     R2                      ; 5149   010A
        ADDR    R2,     R0                      ; 514A   00D0
        MVO     R0,     G_015F                  ; 514B   0240 015F
        SUBR    R2,     R3                      ; 514D   0113
        SLL     R2,     2                       ; 514E   004E
        SUBR    R2,     R3                      ; 514F   0113
        MVO     R3,     G_0183                  ; 5150   0243 0183

L_5152:
        JSR     R5,     L_6C90                  ; 5152   0004 016C 0090
L_5155:
        JSR     R5,     L_58FD                  ; 5155   0004 0158 00FD

L_5158:
        MVI     G_0184, R5                      ; 5158   0285 0184
        MVO     R5,     G_0182                  ; 515A   0245 0182
        MVI     G_0183, R5                      ; 515C   0285 0183
        MVO     R5,     G_0181                  ; 515E   0245 0181

L_5160:
        JSR     R5,     L_5262                  ; 5160   0004 0150 0262
        JSR     R5,     L_5843                  ; 5163   0004 0158 0043

L_5166:
        BEQ     L_5261                          ; 5166   0204 00F9

        CMPI    #$0004, R0                      ; 5168   0378 0004
        BNEQ    L_5216                          ; 516A   020C 00AA

        MVI     G_012D, R3                      ; 516C   0283 012D
        ANDI    #$0003, R3                      ; 516E   03BB 0003
        BNEQ    L_5261                          ; 5170   020C 00EF

L_5172:
        MVI     G_0180, R3                      ; 5172   0283 0180
        ANDI    #$0040, R3                      ; 5174   03BB 0040
        BNEQ    L_518A                          ; 5176   020C 0012

        MVI     G_0161, R3                      ; 5178   0283 0161
        CMPI    #$00C0, R3                      ; 517A   037B 00C0
        BLE     L_518A                          ; 517C   0206 000C

        CMPI    #$00F4, R3                      ; 517E   037B 00F4
        BEQ     L_5261                          ; 5180   0204 00DF
        BGT     L_518A                          ; 5182   020E 0006

        MVI     G_0135, R3                      ; 5184   0283 0135
        ANDI    #$0002, R3                      ; 5186   03BB 0002
        BEQ     L_5261                          ; 5188   0204 00D7

L_518A:
        MVI     G_018E, R0                      ; 518A   0280 018E
        XORI    #$0001, R0                      ; 518C   03F8 0001
        MVO     R0,     G_018E                  ; 518E   0240 018E
L_5190:
        MVI     G_018C, R0                      ; 5190   0280 018C
        XORI    #$0001, R0                      ; 5192   03F8 0001
        MVO     R0,     G_018C                  ; 5194   0240 018C

        JSR     R5,     L_5265                  ; 5196   0004 0150 0265

        MVI     G_018C, R0                      ; 5199   0280 018C
        TSTR    R0                              ; 519B   0080
        BEQ     L_51B0                          ; 519C   0204 0012

        MVI     G_0184, R1                      ; 519E   0281 0184
        MVO     R1,     G_0182                  ; 51A0   0241 0182
        MVI     G_0183, R3                      ; 51A2   0283 0183
        MVO     R3,     G_0181                  ; 51A4   0243 0181
        SDBD                                    ; 51A6   0001
        ADDI    #$5212, R1                      ; 51A7   02F9 0012 0052
        ADD@    R1,     R3                      ; 51AA   02CB
        MVO     R3,     G_0183                  ; 51AB   0243 0183

        JSR     R5,     L_5843                  ; 51AD   0004 0158 0043

L_51B0:
        MVO     R0,     G_0180                  ; 51B0   0240 0180
        MVI     G_0160, R5                      ; 51B2   0285 0160
        SUBI    #$00F5, R5                      ; 51B4   033D 00F5
        BMI     L_5261                          ; 51B6   020B 00A9

        MVI     G_0183, R2                      ; 51B8   0282 0183
        MVII    #$0001, R3                      ; 51BA   02BB 0001
        MVI     G_015F, R4                      ; 51BC   0284 015F
        SUBI    #$0002, R4                      ; 51BE   033C 0002
        CMPI    #$0050, R2                      ; 51C0   037A 0050
        MVII    #$005B, R2                      ; 51C2   02BA 005B
        BEQ     L_51CB                          ; 51C4   0204 0005

        INCR    R3                              ; 51C6   000B
        MVII    #$0060, R2                      ; 51C7   02BA 0060
        ADDI    #$0004, R4                      ; 51C9   02FC 0004
L_51CB:
        MVO     R2,     G_0183                  ; 51CB   0242 0183
        MVO     R3,     G_017F                  ; 51CD   0243 017F
        MVO     R4,     G_015F                  ; 51CF   0244 015F
        MVI     G_018E, R0                      ; 51D1   0280 018E
        XORI    #$0001, R0                      ; 51D3   03F8 0001
        MVO     R0,     G_018E                  ; 51D5   0240 018E
        MVII    #$0167, R4                      ; 51D7   02BC 0167
        MVI@    R4,     R1                      ; 51D9   02A1
        MVI@    R4,     R3                      ; 51DA   02A3
        MVI@    R4,     R2                      ; 51DB   02A2
        MVI@    R4,     R0                      ; 51DC   02A0
        SUBI    #$0002, R5                      ; 51DD   033D 0002
        BMI     L_5206                          ; 51DF   020B 0025
        BEQ     L_51E7                          ; 51E1   0204 0004

        ADDR    R2,     R0                      ; 51E3   00D0
        SLR     R2,     1                       ; 51E4   0062
        B       L_51EB                          ; 51E5   0200 0004

L_51E7:
        SLL     R2,     1                       ; 51E7   004A
        SLR     R0,     1                       ; 51E8   0060
        ADDR    R0,     R2                      ; 51E9   00C2
        SLR     R2,     1                       ; 51EA   0062

L_51EB:
        JSR     R5,     X_CLAMP                 ; 51EB   0004 0114 0270
        DECLE   $0001                           ; 51EE   0001

        ADDR    R0,     R7                      ; 51EF   00C7

        CMPR    R1,     R0                      ; 51F0   0148
        BPL     L_51F4                          ; 51F1   0203 0001

        MOVR    R0,     R1                      ; 51F3   0081
L_51F4:
        MVO     R0,     G_016A                  ; 51F4   0240 016A
        MVO     R1,     G_0167                  ; 51F6   0241 0167
        MOVR    R2,     R0                      ; 51F8   0090

        JSR     R5,     X_CLAMP                 ; 51F9   0004 0114 0270
        DECLE   $0001                           ; 51FC   0001

        SLR     R3,     1                       ; 51FD   0063
        CMPR    R3,     R0                      ; 51FE   0158
        BPL     L_5202                          ; 51FF   0203 0001

        MOVR    R0,     R3                      ; 5201   0083
L_5202:
        MVO     R0,     G_0169                  ; 5202   0240 0169
        MVO     R3,     G_0168                  ; 5204   0243 0168
L_5206:
        MVII    #$0010, R0                      ; 5206   02B8 0010

        JSR     R5,     X_RAND1                 ; 5208   0004 0114 027D

        MVO     R0,     G_035C                  ; 520B   0240 035C

        JSR     R5,     L_6BCE                  ; 520D   0004 0168 03CE

        B       L_5155                          ; 5210   0220 00BC

        DECLE   $00F0,  $0001,  $0010,  $00FF   ; 5212   00F0 0001 0010 00FF
L_5216:
        MVO     R0,     G_018D                  ; 5216   0240 018D

        JSR     R5,     L_5262                  ; 5218   0004 0150 0262

        MVI     G_018D, R1                      ; 521B   0281 018D
        ADD     G_0184, R1                      ; 521D   02C1 0184
        ANDI    #$0003, R1                      ; 521F   03B9 0003
        MVO     R1,     G_0184                  ; 5221   0241 0184
        MVII    #$0005, R1                      ; 5223   02B9 0005

        JSR     R5,     L_522B                  ; 5225   0004 0150 022B
        JSR     R5,     L_5843                  ; 5228   0004 0158 0043

L_522B:
        PSHR    R5                              ; 522B   0275
        MVI     G_018E, R0                      ; 522C   0280 018E
        XORI    #$0001, R0                      ; 522E   03F8 0001
        MVO     R0,     G_018E                  ; 5230   0240 018E
        MVI     G_0139, R0                      ; 5232   0280 0139
        SLR     R0,     1                       ; 5234   0060
        SUBR    R0,     R1                      ; 5235   0101
        PSHR    R1                              ; 5236   0271

        JSR     R5,     L_526C                  ; 5237   0004 0150 026C

        MVII    #$0013, R0                      ; 523A   02B8 0013
        INCR    R7                              ; 523C   000F

L_523D:
        PSHR    R1                              ; 523D   0271
L_523E:
        PSHR    R0                              ; 523E   0270
        MVI     G_018D, R1                      ; 523F   0281 018D
        MVII    #$0214, R3                      ; 5241   02BB 0214
        ADDR    R0,     R3                      ; 5243   00C3
        MVII    #$0190, R4                      ; 5244   02BC 0190
        ADDR    R0,     R4                      ; 5246   00C4
        DECR    R1                              ; 5247   0011
        BEQ     L_524F                          ; 5248   0204 0005

        SLL     R0,     1                       ; 524A   0048
        SUBI    #$0013, R0                      ; 524B   0338 0013
        SUBR    R0,     R3                      ; 524D   0103
        SUBR    R0,     R4                      ; 524E   0104
L_524F:
        INCR    R3                              ; 524F   000B
        MVO     R3,     G_0344                  ; 5250   0243 0344
        DECR    R3                              ; 5252   0013

        JSR     R5,     L_55AE                  ; 5253   0004 0154 01AE

        PULR    R0                              ; 5256   02B0
        PULR    R1                              ; 5257   02B1
        MOVR    R1,     R2                      ; 5258   008A
        SWAP    R2,     1                       ; 5259   0042
L_525A:
        EIS                                     ; 525A   0002
        DECR    R2                              ; 525B   0012
        BNEQ    L_525A                          ; 525C   022C 0003

        DECR    R0                              ; 525E   0010
        BPL     L_523D                          ; 525F   0223 0023
L_5261:
        PULR    R7                              ; 5261   02B7

L_5262:
        CLRR    R0                              ; 5262   01C0
        MVO     R0,     G_0138                  ; 5263   0240 0138
L_5265:
        PSHR    R5                              ; 5265   0275

        JSR     R5,     L_526C                  ; 5266   0004 0150 026C
        JSR     R5,     L_55A1                  ; 5269   0004 0154 01A1

L_526C:
        MVII    #$00FF, R1                      ; 526C   02B9 00FF
L_526E:
        PSHR    R5                              ; 526E   0275
        MVII    #$0001, R0                      ; 526F   02B8 0001
L_5271:
        MVO     R0,     G_018B                  ; 5271   0240 018B
        PSHR    R1                              ; 5273   0271

        JSR     R5,     L_5659                  ; 5274   0004 0154 0259

        PULR    R1                              ; 5277   02B1
        MOVR    R1,     R0                      ; 5278   0088
        AND     G_012D, R0                      ; 5279   0380 012D
        MVO     R0,     G_012D                  ; 527B   0240 012D
        PSHR    R1                              ; 527D   0271
        MVII    #$019A, R4                      ; 527E   02BC 019A
        MVI     G_018B, R0                      ; 5280   0280 018B
        TSTR    R0                              ; 5282   0080
        BEQ     L_528F                          ; 5283   0204 000A

        SUBI    #$000A, R4                      ; 5285   033C 000A
        MVI     G_012E, R5                      ; 5287   0285 012E
        MVO     R5,     G_0186                  ; 5289   0245 0186
        MVI     G_0130, R5                      ; 528B   0285 0130
        MVO     R5,     G_0187                  ; 528D   0245 0187
L_528F:
        CLRR    R0                              ; 528F   01C0
L_5290:
        MVI     G_018E, R3                      ; 5290   0283 018E

        JSR     R5,     L_52F2                  ; 5292   0004 0150 02F2

        INCR    R0                              ; 5295   0008
        CMPI    #$0005, R0                      ; 5296   0378 0005
        BLT     L_5290                          ; 5298   0225 0009

        PULR    R1                              ; 529A   02B1
        MVI     G_018B, R0                      ; 529B   0280 018B
        DECR    R0                              ; 529D   0010
        BEQ     L_5271                          ; 529E   0224 002E
        PULR    R7                              ; 52A0   02B7

L_52A1:
        PSHR    R5                              ; 52A1   0275
        PSHR    R4                              ; 52A2   0274
        SDBD                                    ; 52A3   0001
        MVII    #$00B2, R2                      ; 52A4   02BA 00B2 0000
        DIS                                     ; 52A7   0003
        MVO     R2,     .ISRVEC.0               ; 52A8   0242 0100
        SDBD                                    ; 52AA   0001
        MVII    #$0052, R2                      ; 52AB   02BA 0052 0000
        MVO     R2,     .ISRVEC.1               ; 52AE   0242 0101
        EIS                                     ; 52B0   0002
L_52B1:
        DECR    R7                              ; 52B1   0017

        SUBI    #$0008, R6                      ; 52B2   033E 0008
        MVII    #$00BB, R2                      ; 52B4   02BA 00BB
        MVO     R2,     .ISRVEC.0               ; 52B6   0242 0100
        MVII    #$0058, R2                      ; 52B8   02BA 0058
        MVO     R2,     .ISRVEC.1               ; 52BA   0242 0101
        TSTR    R1                              ; 52BC   0089
        BEQ     L_52F0                          ; 52BD   0204 0031

        CLRR    R4                              ; 52BF   01E4
        MVO     R4,     .STIC.VIDEN             ; 52C0   0244 0020
        MVII    #$0002, R1                      ; 52C2   02B9 0002
        MVII    #$032E, R2                      ; 52C4   02BA 032E
        CLRR    R0                              ; 52C6   01C0
        MVI     G_0160, R5                      ; 52C7   0285 0160
        TSTR    R5                              ; 52C9   00AD
        BEQ     L_52DF                          ; 52CA   0204 0013

        CMPI    #$00C0, R5                      ; 52CC   037D 00C0
        BGE     L_52DF                          ; 52CE   020D 000F

        MVII    #$032E, R0                      ; 52D0   02B8 032E
        MVI     G_0161, R5                      ; 52D2   0285 0161
        TSTR    R5                              ; 52D4   00AD
        BEQ     L_52DF                          ; 52D5   0204 0008

        ADDI    #$0008, R0                      ; 52D7   02F8 0008
        CMPI    #$00C0, R5                      ; 52D9   037D 00C0
        BLT     L_52DF                          ; 52DB   0205 0002

        ADDI    #$0008, R0                      ; 52DD   02F8 0008
L_52DF:
        CMPR    R0,     R2                      ; 52DF   0142
        BEQ     L_52E4                          ; 52E0   0204 0002

        MVO@    R4,     R1                      ; 52E2   024C
        MVO@    R4,     R2                      ; 52E3   0254
L_52E4:
        INCR    R1                              ; 52E4   0009
        ADDI    #$0008, R2                      ; 52E5   02FA 0008
        CMPI    #$0356, R2                      ; 52E7   037A 0356
        BLE     L_52DF                          ; 52E9   0226 000B

        MVII    #$0038, R2                      ; 52EB   02BA 0038
L_52ED:
        DECR    R2                              ; 52ED   0012
        BPL     L_52ED                          ; 52EE   0223 0002

L_52F0:
        PULR    R4                              ; 52F0   02B4
        PULR    R7                              ; 52F1   02B7

L_52F2:
        PSHR    R5                              ; 52F2   0275
        PSHR    R0                              ; 52F3   0270
        PSHR    R4                              ; 52F4   0274
        MVI     G_018B, R1                      ; 52F5   0281 018B
        TSTR    R1                              ; 52F7   0089
        BNEQ    L_52FD                          ; 52F8   020C 0003

        SUBI    #$0004, R0                      ; 52FA   0338 0004
        NEGR    R0                              ; 52FC   0020
L_52FD:
        SLL     R0,     1                       ; 52FD   0048
        MOVR    R0,     R4                      ; 52FE   0084
        MVI     G_018C, R0                      ; 52FF   0280 018C
        DECR    R0                              ; 5301   0010
        BNEQ    L_5306                          ; 5302   020C 0002

        ADDI    #$000A, R4                      ; 5304   02FC 000A
L_5306:
        MVII    #$0009, R1                      ; 5306   02B9 0009
        MOVR    R1,     R2                      ; 5308   008A
        SDBD                                    ; 5309   0001
        MVII    #$5329, R5                      ; 530A   02BD 0029 0053
        PSHR    R5                              ; 530D   0275
        CLRR    R5                              ; 530E   01ED
        SDBD                                    ; 530F   0001
        ADDI    #$5315, R4                      ; 5310   02FC 0015 0053
        SDBD                                    ; 5313   0001
        MVI@    R4,     R7                      ; 5314   02A7

        SAR     R0,     1                       ; 5315   0068
        RLC     R0,     2                       ; 5316   0054
        MOVR    R4,     R6                      ; 5317   00A6
        RLC     R0,     2                       ; 5318   0054
        ADDR    R3,     R3                      ; 5319   00DB
        RLC     R0,     2                       ; 531A   0054
        DECR    R2                              ; 531B   0012
        RLC     R1,     2                       ; 531C   0055
        SLLC    R1,     2                       ; 531D   005D
        RLC     R1,     2                       ; 531E   0055
        RRC     R3,     1                       ; 531F   0073
        RLC     R3,     1                       ; 5320   0053
        MOVR    R5,     R7                      ; 5321   00AF

        DECLE   $0053,  $00DE,  $0053,  $0014   ; 5322   0053 00DE 0053 0014
        DECLE   $0054,  $003F                   ; 5326   0054 003F

        RLC     R0,     2                       ; 5328   0054
        MOVR    R3,     R0                      ; 5329   0098
        ANDI    #$0001, R0                      ; 532A   03B8 0001
        SLR     R3,     2                       ; 532C   0067
        XORR    R0,     R3                      ; 532D   01C3
        MVI     G_018B, R4                      ; 532E   0284 018B
        TSTR    R4                              ; 5330   00A4
        BNEQ    L_533F                          ; 5331   020C 000C

        PSHR    R2                              ; 5333   0272
        MOVR    R1,     R2                      ; 5334   008A
        PULR    R1                              ; 5335   02B1
        PSHR    R0                              ; 5336   0270
        MOVR    R5,     R0                      ; 5337   00A8
        SLR     R0,     1                       ; 5338   0060
        ADDR    R5,     R5                      ; 5339   00ED
        ADDR    R0,     R5                      ; 533A   00C5
        ANDI    #$0003, R5                      ; 533B   03BD 0003
        MOVR    R3,     R0                      ; 533D   0098
        PULR    R3                              ; 533E   02B3
L_533F:
        PULR    R4                              ; 533F   02B4
        PSHR    R5                              ; 5340   0275
        PSHR    R3                              ; 5341   0273
        MOVR    R5,     R3                      ; 5342   00AB

        JSR     R5,     L_534F                  ; 5343   0004 0150 034F

        MOVR    R1,     R2                      ; 5346   008A
        PULR    R0                              ; 5347   02B0
        PULR    R3                              ; 5348   02B3
        SLR     R3,     1                       ; 5349   0063

        JSR     R5,     L_534F                  ; 534A   0004 0150 034F

        PULR    R0                              ; 534D   02B0
        PULR    R7                              ; 534E   02B7

L_534F:
        SARC    R3,     1                       ; 534F   007B
        BNC     L_5354                          ; 5350   0209 0002

        MVII    #$0004, R0                      ; 5352   02B8 0004
L_5354:
        CMPI    #$0015, R2                      ; 5354   037A 0015
        BLT     L_5360                          ; 5356   0205 0008

        ADDI    #$0008, R0                      ; 5358   02F8 0008
        CMPI    #$001B, R2                      ; 535A   037A 001B
        BLT     L_5360                          ; 535C   0205 0002

        ADDI    #$0010, R0                      ; 535E   02F8 0010
L_5360:
        MVI     G_018B, R3                      ; 5360   0283 018B
        SWAP    R3,     1                       ; 5362   0043
        SLR     R3,     1                       ; 5363   0063
        ADDR    R3,     R0                      ; 5364   00D8
        SLR     R3,     2                       ; 5365   0067
        ADDR    R3,     R0                      ; 5366   00D8
        SLL     R2,     2                       ; 5367   004E
        SDBD                                    ; 5368   0001
        ADDI    #$5699, R2                      ; 5369   02FA 0099 0056
        MVO@    R0,     R4                      ; 536C   0260
        ADDI    #$006F, R4                      ; 536D   02FC 006F
        MVO@    R2,     R4                      ; 536F   0262
        SUBI    #$0070, R4                      ; 5370   033C 0070
        MOVR    R5,     R7                      ; 5372   00AF

        MVII    #$0013, R1                      ; 5373   02B9 0013
        MVII    #$0014, R2                      ; 5375   02BA 0014
        MVI     G_012D, R0                      ; 5377   0280 012D
        ANDI    #$0003, R0                      ; 5379   03B8 0003
        BEQ     L_5381                          ; 537B   0204 0004

        XORI    #$0001, R3                      ; 537D   03FB 0001
        B       L_5387                          ; 537F   0200 0006

L_5381:
        MVI     G_012D, R0                      ; 5381   0280 012D
        ANDI    #$000C, R0                      ; 5383   03B8 000C
        BEQ     L_538B                          ; 5385   0204 0004

L_5387:
        MVII    #$0008, R2                      ; 5387   02BA 0008
        MOVR    R2,     R1                      ; 5389   0091
        PULR    R7                              ; 538A   02B7

L_538B:
        MVI     G_012E, R0                      ; 538B   0280 012E
        ANDI    #$0003, R0                      ; 538D   03B8 0003
        BEQ     L_5395                          ; 538F   0204 0004

        MVII    #$0008, R1                      ; 5391   02B9 0008
        MOVR    R1,     R2                      ; 5393   008A
        PULR    R7                              ; 5394   02B7

L_5395:
        XORI    #$0001, R3                      ; 5395   03FB 0001
        MVI     G_0130, R0                      ; 5397   0280 0130
        ANDI    #$0003, R0                      ; 5399   03B8 0003
        BEQ     L_53A6                          ; 539B   0204 0009

        MVII    #$000C, R1                      ; 539D   02B9 000C
        MOVR    R1,     R2                      ; 539F   008A
        SARC    R0,     1                       ; 53A0   0078
        BC      L_53AE                          ; 53A1   0201 000B

        MVII    #$0019, R1                      ; 53A3   02B9 0019
        PULR    R7                              ; 53A5   02B7

L_53A6:
        MVI     G_0132, R0                      ; 53A6   0280 0132
        ANDI    #$000C, R0                      ; 53A8   03B8 000C
        BNEQ    L_53AE                          ; 53AA   020C 0002

        MVII    #$0003, R5                      ; 53AC   02BD 0003
L_53AE:
        PULR    R7                              ; 53AE   02B7

        MVII    #$0011, R1                      ; 53AF   02B9 0011
        MVII    #$0012, R2                      ; 53B1   02BA 0012
        XORI    #$0001, R3                      ; 53B3   03FB 0001
        MVI     G_012F, R0                      ; 53B5   0280 012F
        ANDI    #$000C, R0                      ; 53B7   03B8 000C
        BEQ     L_53C6                          ; 53B9   0204 000B

        MVII    #$0006, R1                      ; 53BB   02B9 0006
        MVII    #$0007, R2                      ; 53BD   02BA 0007
        ANDI    #$0004, R0                      ; 53BF   03B8 0004
        BNEQ    L_53DD                          ; 53C1   020C 001A

        MVII    #$0016, R1                      ; 53C3   02B9 0016
        PULR    R7                              ; 53C5   02B7

L_53C6:
        MVI     G_0130, R0                      ; 53C6   0280 0130
        ANDI    #$0003, R0                      ; 53C8   03B8 0003
        BEQ     L_53D5                          ; 53CA   0204 0009

        MVII    #$000C, R1                      ; 53CC   02B9 000C
        MOVR    R1,     R2                      ; 53CE   008A
        SARC    R0,     1                       ; 53CF   0078
        BC      L_53DD                          ; 53D0   0201 000B

        MVII    #$0019, R2                      ; 53D2   02BA 0019
        PULR    R7                              ; 53D4   02B7

L_53D5:
        MVI     G_0132, R0                      ; 53D5   0280 0132
        ANDI    #$000C, R0                      ; 53D7   03B8 000C
        BNEQ    L_53DD                          ; 53D9   020C 0002

        MVII    #$0003, R5                      ; 53DB   02BD 0003
L_53DD:
        PULR    R7                              ; 53DD   02B7

        MVII    #$000F, R1                      ; 53DE   02B9 000F
        MVII    #$0010, R2                      ; 53E0   02BA 0010
        XORI    #$0001, R3                      ; 53E2   03FB 0001
        MVI     G_012F, R0                      ; 53E4   0280 012F
        ANDI    #$000C, R0                      ; 53E6   03B8 000C
        BEQ     L_53F5                          ; 53E8   0204 000B

        MVII    #$0004, R1                      ; 53EA   02B9 0004
        MVII    #$0005, R2                      ; 53EC   02BA 0005
        ANDI    #$0004, R0                      ; 53EE   03B8 0004
        BNEQ    L_5413                          ; 53F0   020C 0021

        MVII    #$0015, R2                      ; 53F2   02BA 0015
        PULR    R7                              ; 53F4   02B7

L_53F5:
        MVI     G_0130, R0                      ; 53F5   0280 0130
        ANDI    #$0003, R0                      ; 53F7   03B8 0003
        BEQ     L_53FF                          ; 53F9   0204 0004

        MVII    #$000C, R1                      ; 53FB   02B9 000C
        MOVR    R1,     R2                      ; 53FD   008A
        PULR    R7                              ; 53FE   02B7

L_53FF:
        XORI    #$0001, R3                      ; 53FF   03FB 0001
        MVI     G_0132, R0                      ; 5401   0280 0132
        ANDI    #$0003, R0                      ; 5403   03B8 0003
        BEQ     L_540B                          ; 5405   0204 0004

        MVII    #$000A, R1                      ; 5407   02B9 000A
        MOVR    R1,     R2                      ; 5409   008A
        PULR    R7                              ; 540A   02B7

L_540B:
        MVI     G_0134, R0                      ; 540B   0280 0134
        ANDI    #$000C, R0                      ; 540D   03B8 000C
        BNEQ    L_5413                          ; 540F   020C 0002

        MVII    #$0003, R5                      ; 5411   02BD 0003
L_5413:
        PULR    R7                              ; 5413   02B7

        MVII    #$000E, R2                      ; 5414   02BA 000E
        MVI     G_012F, R0                      ; 5416   0280 012F
        ANDI    #$0003, R0                      ; 5418   03B8 0003
        BEQ     L_5420                          ; 541A   0204 0004

        MVII    #$000C, R1                      ; 541C   02B9 000C
        MOVR    R1,     R2                      ; 541E   008A
        PULR    R7                              ; 541F   02B7

L_5420:
        MVI     G_0131, R0                      ; 5420   0280 0131
        ANDI    #$000C, R0                      ; 5422   03B8 000C
        BEQ     L_542B                          ; 5424   0204 0005

        MVII    #$0003, R2                      ; 5426   02BA 0003
        MVII    #$0002, R1                      ; 5428   02B9 0002
        PULR    R7                              ; 542A   02B7

L_542B:
        MVI     G_0132, R0                      ; 542B   0280 0132
        ANDI    #$0003, R0                      ; 542D   03B8 0003
        BEQ     L_5435                          ; 542F   0204 0004

        MVII    #$000A, R1                      ; 5431   02B9 000A
        MOVR    R1,     R2                      ; 5433   008A
        PULR    R7                              ; 5434   02B7

L_5435:
        ADDI    #$0002, R5                      ; 5435   02FD 0002
        MVI     G_0134, R0                      ; 5437   0280 0134
        ANDI    #$000C, R0                      ; 5439   03B8 000C
        BNEQ    L_543E                          ; 543B   020C 0001

        INCR    R5                              ; 543D   000D
L_543E:
        PULR    R7                              ; 543E   02B7

        XORI    #$0001, R3                      ; 543F   03FB 0001
        MVI     G_012F, R0                      ; 5441   0280 012F
        ANDI    #$0003, R0                      ; 5443   03B8 0003
        BEQ     L_5452                          ; 5445   0204 000B

        XORI    #$0001, R3                      ; 5447   03FB 0001
        MVII    #$000C, R1                      ; 5449   02B9 000C
        MOVR    R1,     R2                      ; 544B   008A
        SARC    R0,     1                       ; 544C   0078
        BC      L_5467                          ; 544D   0201 0018

        MVII    #$0019, R1                      ; 544F   02B9 0019
        PULR    R7                              ; 5451   02B7

L_5452:
        MVI     G_0131, R0                      ; 5452   0280 0131
        ANDI    #$0003, R0                      ; 5454   03B8 0003
        BEQ     L_545C                          ; 5456   0204 0004

        MVII    #$000A, R1                      ; 5458   02B9 000A
        MOVR    R1,     R2                      ; 545A   008A
        PULR    R7                              ; 545B   02B7

L_545C:
        MVII    #$0003, R5                      ; 545C   02BD 0003
        MVI     G_0133, R0                      ; 545E   0280 0133
        ANDI    #$000C, R0                      ; 5460   03B8 000C
        BEQ     L_5467                          ; 5462   0204 0003

        DECR    R5                              ; 5464   0015
        MVII    #$0001, R2                      ; 5465   02BA 0001
L_5467:
        PULR    R7                              ; 5467   02B7

        MVII    #$0014, R2                      ; 5468   02BA 0014
        MVII    #$0013, R1                      ; 546A   02B9 0013
        XORI    #$0001, R3                      ; 546C   03FB 0001
        MVI     G_012D, R0                      ; 546E   0280 012D
        ANDI    #$000C, R0                      ; 5470   03B8 000C
        BEQ     L_5480                          ; 5472   0204 000C

        MVII    #$0008, R2                      ; 5474   02BA 0008
        MOVR    R2,     R1                      ; 5476   0091
        ANDI    #$0004, R0                      ; 5477   03B8 0004
        BNEQ    L_54A5                          ; 5479   020C 002A

        MVII    #$0017, R1                      ; 547B   02B9 0017
        MVII    #$0018, R2                      ; 547D   02BA 0018
        PULR    R7                              ; 547F   02B7

L_5480:
        MVI     G_012E, R0                      ; 5480   0280 012E
        ANDI    #$0003, R0                      ; 5482   03B8 0003
        BEQ     L_548A                          ; 5484   0204 0004

        MVII    #$000D, R1                      ; 5486   02B9 000D
        MOVR    R1,     R2                      ; 5488   008A
        PULR    R7                              ; 5489   02B7

L_548A:
        MVI     G_0130, R0                      ; 548A   0280 0130
        INCR    R5                              ; 548C   000D
        ANDI    #$000C, R0                      ; 548D   03B8 000C
        BEQ     L_5492                          ; 548F   0204 0001

        DECR    R5                              ; 5491   0015
L_5492:
        XORI    #$0004, R3                      ; 5492   03FB 0004
        MVI     G_0130, R0                      ; 5494   0280 0130
        ANDI    #$0003, R0                      ; 5496   03B8 0003
        BEQ     L_549D                          ; 5498   0204 0003

        MVII    #$000B, R1                      ; 549A   02B9 000B
        PULR    R7                              ; 549C   02B7

L_549D:
        MVI     G_0132, R0                      ; 549D   0280 0132
        ANDI    #$000C, R0                      ; 549F   03B8 000C
        BNEQ    L_54A5                          ; 54A1   020C 0002

        ADDI    #$0002, R5                      ; 54A3   02FD 0002
L_54A5:
        PULR    R7                              ; 54A5   02B7

        MVII    #$0011, R1                      ; 54A6   02B9 0011
        MVII    #$0012, R2                      ; 54A8   02BA 0012
        XORI    #$0001, R3                      ; 54AA   03FB 0001
        MVI     G_012D, R0                      ; 54AC   0280 012D
        ANDI    #$000C, R0                      ; 54AE   03B8 000C
        BEQ     L_54B7                          ; 54B0   0204 0005

        MVII    #$0007, R2                      ; 54B2   02BA 0007
        MVII    #$0006, R1                      ; 54B4   02B9 0006
        PULR    R7                              ; 54B6   02B7

L_54B7:
        MVI     G_012E, R0                      ; 54B7   0280 012E
        ANDI    #$0003, R0                      ; 54B9   03B8 0003
        BEQ     L_54C1                          ; 54BB   0204 0004

        MVII    #$000D, R1                      ; 54BD   02B9 000D
        MOVR    R1,     R2                      ; 54BF   008A
        PULR    R7                              ; 54C0   02B7

L_54C1:
        XORI    #$0001, R3                      ; 54C1   03FB 0001
        MVI     G_0130, R0                      ; 54C3   0280 0130
        ANDI    #$0003, R0                      ; 54C5   03B8 0003
        BEQ     L_54D2                          ; 54C7   0204 0009

        MVII    #$000B, R1                      ; 54C9   02B9 000B
        MOVR    R1,     R2                      ; 54CB   008A
        SARC    R0,     1                       ; 54CC   0078
        BC      L_54DA                          ; 54CD   0201 000B

        MVII    #$001C, R1                      ; 54CF   02B9 001C
        PULR    R7                              ; 54D1   02B7

L_54D2:
        MVI     G_0132, R0                      ; 54D2   0280 0132
        ANDI    #$000C, R0                      ; 54D4   03B8 000C
        BNEQ    L_54DA                          ; 54D6   020C 0002

        MVII    #$0003, R5                      ; 54D8   02BD 0003
L_54DA:
        PULR    R7                              ; 54DA   02B7

        MVII    #$000F, R1                      ; 54DB   02B9 000F
        MVII    #$0010, R2                      ; 54DD   02BA 0010
        MVI     G_012D, R0                      ; 54DF   0280 012D
        ANDI    #$0003, R0                      ; 54E1   03B8 0003
        BEQ     L_54E9                          ; 54E3   0204 0004

        MVII    #$000D, R1                      ; 54E5   02B9 000D
        MOVR    R1,     R2                      ; 54E7   008A
        PULR    R7                              ; 54E8   02B7

L_54E9:
        MVI     G_012F, R0                      ; 54E9   0280 012F
        ANDI    #$000C, R0                      ; 54EB   03B8 000C
        BEQ     L_54FA                          ; 54ED   0204 000B

        MVII    #$0005, R2                      ; 54EF   02BA 0005
        MVII    #$0004, R1                      ; 54F1   02B9 0004
        ANDI    #$0004, R0                      ; 54F3   03B8 0004
        BNEQ    L_5511                          ; 54F5   020C 001A

        MVII    #$001B, R1                      ; 54F7   02B9 001B
        PULR    R7                              ; 54F9   02B7

L_54FA:
        MVI     G_0130, R0                      ; 54FA   0280 0130
        ANDI    #$0003, R0                      ; 54FC   03B8 0003
        BEQ     L_5509                          ; 54FE   0204 0009

        MVII    #$000B, R1                      ; 5500   02B9 000B
        MOVR    R1,     R2                      ; 5502   008A
        SARC    R0,     1                       ; 5503   0078
        BC      L_5511                          ; 5504   0201 000B

        MVII    #$001C, R2                      ; 5506   02BA 001C
        PULR    R7                              ; 5508   02B7

L_5509:
        MVI     G_0132, R0                      ; 5509   0280 0132
        ANDI    #$000C, R0                      ; 550B   03B8 000C
        BNEQ    L_5511                          ; 550D   020C 0002

        MVII    #$0003, R5                      ; 550F   02BD 0003
L_5511:
        PULR    R7                              ; 5511   02B7

        MVI     G_012D, R0                      ; 5512   0280 012D
        ANDI    #$0003, R0                      ; 5514   03B8 0003
        BEQ     L_551C                          ; 5516   0204 0004

        MVII    #$000D, R1                      ; 5518   02B9 000D
        MOVR    R1,     R2                      ; 551A   008A
        PULR    R7                              ; 551B   02B7

L_551C:
        INCR    R5                              ; 551C   000D
        MVI     G_012F, R0                      ; 551D   0280 012F
        ANDI    #$000C, R0                      ; 551F   03B8 000C
        BEQ     L_5528                          ; 5521   0204 0005

        DECR    R5                              ; 5523   0015
        MVII    #$0003, R2                      ; 5524   02BA 0003
        B       L_553E                          ; 5526   0200 0016

L_5528:
        MVI     G_0130, R0                      ; 5528   0280 0130
        ANDI    #$0003, R0                      ; 552A   03B8 0003
        BEQ     L_5533                          ; 552C   0204 0005

        DECR    R5                              ; 552E   0015
        MVII    #$000B, R2                      ; 552F   02BA 000B
        B       L_553E                          ; 5531   0200 000B

L_5533:
        MVI     G_0132, R0                      ; 5533   0280 0132
        ANDI    #$0003, R0                      ; 5535   03B8 0003
        BEQ     L_553E                          ; 5537   0204 0005

        DECR    R5                              ; 5539   0015
        XORI    #$0001, R3                      ; 553A   03FB 0001
        B       L_5540                          ; 553C   0200 0002

L_553E:
        XORI    #$0004, R3                      ; 553E   03FB 0004
L_5540:
        MVI     G_012F, R0                      ; 5540   0280 012F
        ANDI    #$0003, R0                      ; 5542   03B8 0003
        BEQ     L_5549                          ; 5544   0204 0003

        MVII    #$000B, R1                      ; 5546   02B9 000B
        PULR    R7                              ; 5548   02B7

L_5549:
        MVI     G_0131, R0                      ; 5549   0280 0131
        ANDI    #$000C, R0                      ; 554B   03B8 000C
        BEQ     L_5552                          ; 554D   0204 0003

        MVII    #$0002, R1                      ; 554F   02B9 0002
        PULR    R7                              ; 5551   02B7

L_5552:
        ADDI    #$0002, R5                      ; 5552   02FD 0002
        MVI     G_0132, R0                      ; 5554   0280 0132
        ANDI    #$0003, R0                      ; 5556   03B8 0003
        BEQ     L_555C                          ; 5558   0204 0002

        SUBI    #$0002, R5                      ; 555A   033D 0002
L_555C:
        PULR    R7                              ; 555C   02B7

        XORI    #$0001, R3                      ; 555D   03FB 0001
        MVI     G_012D, R0                      ; 555F   0280 012D
        ANDI    #$0003, R0                      ; 5561   03B8 0003
        BEQ     L_5571                          ; 5563   0204 000C

        XORI    #$0001, R3                      ; 5565   03FB 0001
        MVII    #$000D, R1                      ; 5567   02B9 000D
        MOVR    R1,     R2                      ; 5569   008A
        SARC    R0,     1                       ; 556A   0078
        BC      L_559F                          ; 556B   0201 0032

        MVII    #$001A, R1                      ; 556D   02B9 001A
        MOVR    R1,     R2                      ; 556F   008A
        PULR    R7                              ; 5570   02B7

L_5571:
        MVI     G_012F, R0                      ; 5571   0280 012F
        ANDI    #$0003, R0                      ; 5573   03B8 0003
        BEQ     L_5580                          ; 5575   0204 0009

        MVII    #$000B, R1                      ; 5577   02B9 000B
        MOVR    R1,     R2                      ; 5579   008A
        SARC    R0,     1                       ; 557A   0078
        BC      L_559F                          ; 557B   0201 0022

        MVII    #$001C, R1                      ; 557D   02B9 001C
        PULR    R7                              ; 557F   02B7

L_5580:
        INCR    R5                              ; 5580   000D
        MVI     G_0131, R0                      ; 5581   0280 0131
        ANDI    #$000C, R0                      ; 5583   03B8 000C
        BEQ     L_558C                          ; 5585   0204 0005

        DECR    R5                              ; 5587   0015
        MVII    #$0001, R2                      ; 5588   02BA 0001
        B       L_5593                          ; 558A   0200 0007

L_558C:
        MVI     G_0132, R0                      ; 558C   0280 0132
        ANDI    #$0003, R0                      ; 558E   03B8 0003
        BEQ     L_5593                          ; 5590   0204 0001

        DECR    R5                              ; 5592   0015
L_5593:
        ADDI    #$0002, R5                      ; 5593   02FD 0002
        MVI     G_0131, R0                      ; 5595   0280 0131
        ANDI    #$0003, R0                      ; 5597   03B8 0003
        BEQ     L_559F                          ; 5599   0204 0004

        SUBI    #$0002, R5                      ; 559B   033D 0002
        XORI    #$0004, R3                      ; 559D   03FB 0004
L_559F:
        PULR    R7                              ; 559F   02B7

        PSHR    R5                              ; 55A0   0275
L_55A1:
        MVII    #$0228, R3                      ; 55A1   02BB 0228
        MVO     R3,     G_0344                  ; 55A3   0243 0344
        MVII    #$0190, R4                      ; 55A5   02BC 0190
        MVII    #$0214, R3                      ; 55A7   02BB 0214
        MOVR    R3,     R1                      ; 55A9   0099

        JSR     R5,     L_52A1                  ; 55AA   0004 0150 02A1

        INCR    R7                              ; 55AD   000F

L_55AE:
        PSHR    R5                              ; 55AE   0275
L_55AF:
        PSHR    R3                              ; 55AF   0273
        MVI@    R4,     R2                      ; 55B0   02A2
        ADDI    #$006F, R4                      ; 55B1   02FC 006F
        MVI@    R4,     R5                      ; 55B3   02A5
        SUBI    #$0070, R4                      ; 55B4   033C 0070
        PSHR    R4                              ; 55B6   0274
        MOVR    R2,     R1                      ; 55B7   0091
        ANDI    #$0018, R1                      ; 55B8   03B9 0018
        BNEQ    L_55DE                          ; 55BA   020C 0022

        SDBD                                    ; 55BC   0001
        XORI    #$1E04, R2                      ; 55BD   03FA 0004 001E
        MVII    #$0003, R0                      ; 55C0   02B8 0003
L_55C2:
        MVI@    R5,     R1                      ; 55C2   02A9
        MOVR    R1,     R4                      ; 55C3   008C
        ANDI    #$001F, R4                      ; 55C4   03BC 001F
        XORR    R4,     R1                      ; 55C6   01E1
        ADDR    R4,     R4                      ; 55C7   00E4
        ADDR    R4,     R4                      ; 55C8   00E4
        ADDR    R4,     R4                      ; 55C9   00E4
        SLR     R1,     2                       ; 55CA   0065
        ADDR    R2,     R1                      ; 55CB   00D1
        MVO@    R1,     R3                      ; 55CC   0259
        ADDI    #$0014, R3                      ; 55CD   02FB 0014
        ADDR    R2,     R4                      ; 55CF   00D4
        MVO@    R4,     R3                      ; 55D0   025C
        ADDI    #$0014, R3                      ; 55D1   02FB 0014
        DECR    R0                              ; 55D3   0010
        BPL     L_55C2                          ; 55D4   0223 0013

L_55D6:
        PULR    R4                              ; 55D6   02B4
        PULR    R3                              ; 55D7   02B3
        INCR    R3                              ; 55D8   000B
        CMP     G_0344, R3                      ; 55D9   0343 0344
        BLT     L_55AF                          ; 55DB   0225 002D
        PULR    R7                              ; 55DD   02B7

L_55DE:
        XORR    R1,     R2                      ; 55DE   01CA
        SDBD                                    ; 55DF   0001
        MVII    #$5621, R4                      ; 55E0   02BC 0021 0056
        ANDI    #$0010, R1                      ; 55E3   03B9 0010
        BEQ     L_55E9                          ; 55E5   0204 0002

        ADDI    #$0010, R4                      ; 55E7   02FC 0010
L_55E9:
        MVII    #$0007, R0                      ; 55E9   02B8 0007
        MOVR    R2,     R1                      ; 55EB   0091
        ANDR    R0,     R2                      ; 55EC   0182
        XORR    R2,     R1                      ; 55ED   01D1
        MVO     R1,     G_0189                  ; 55EE   0241 0189
L_55F0:
        PSHR    R3                              ; 55F0   0273
        MVI@    R5,     R1                      ; 55F1   02A9
        MOVR    R1,     R3                      ; 55F2   008B
        ANDI    #$001F, R3                      ; 55F3   03BB 001F
        XORR    R3,     R1                      ; 55F5   01D9
        SLL     R3,     2                       ; 55F6   004F
        SLL     R3,     1                       ; 55F7   004B
        SLR     R1,     2                       ; 55F8   0065
        MVO     R3,     G_0188                  ; 55F9   0243 0188
        PULR    R3                              ; 55FB   02B3
L_55FC:
        PSHR    R3                              ; 55FC   0273
        ADD     G_0189, R1                      ; 55FD   02C1 0189
        SDBD                                    ; 55FF   0001
        ADD@    R4,     R1                      ; 5600   02E1
        MOVR    R1,     R3                      ; 5601   008B
        SARC    R3,     1                       ; 5602   007B
        BNC     L_5606                          ; 5603   0209 0001
        INCR    R7                              ; 5605   000F

L_5606:
        XORR    R2,     R1                      ; 5606   01D1
L_5607:
        SDBD                                    ; 5607   0001
        CMPI    #$2000, R1                      ; 5608   0379 0000 0020
        BLT     L_5611                          ; 560B   0205 0004

        MOVR    R2,     R3                      ; 560D   0093
        SWAP    R3,     1                       ; 560E   0043
        SLL     R3,     1                       ; 560F   004B
        XORR    R3,     R1                      ; 5610   01D9
L_5611:
        PULR    R3                              ; 5611   02B3
        MVO@    R1,     R3                      ; 5612   0259
        ADDI    #$0014, R3                      ; 5613   02FB 0014
        DECR    R0                              ; 5615   0010
        MOVR    R0,     R1                      ; 5616   0081
        SARC    R1,     1                       ; 5617   0079
        MVI     G_0188, R1                      ; 5618   0281 0188
        BNC     L_55FC                          ; 561A   0229 001F

        TSTR    R0                              ; 561C   0080
        BPL     L_55F0                          ; 561D   0223 002E
        B       L_55D6                          ; 561F   0220 004A

        JSRD    R4,     .EXEC.C04               ; 5621   0004 001E 0004
        DECLE   $001E,  $0001,  $0028,  $0001   ; 5624   001E 0001 0028 0001
        DECLE   $0028,  $0001,  $001E,  $0001   ; 5628   0028 0001 001E 0001
        DECLE   $001E,  $0001,  $001E,  $0001   ; 562C   001E 0001 001E 0001

        COMR    R6                              ; 5630   001E

        JSRD    R4,     .EXEC.C04               ; 5631   0004 001E 0004

        COMR    R6                              ; 5634   001E

        JSRD    R4,     .EXEC.C01               ; 5635   0004 001E 0001
        DECLE   $0028,  $0001,  $001E,  $0001   ; 5638   0028 0001 001E 0001
        DECLE   $001E,  $0001,  $001E,  $0001   ; 563C   001E 0001 001E 0001
        DECLE   $001E,  $0001                   ; 5640   001E 0001

        ADDR    R5,     R7                      ; 5642   00EF

        DECLE   $0000,  $0010,  $00F1,  $0000   ; 5643   0000 0010 00F1 0000
        DECLE   $00FF,  $0011,  $0000,  $00F0   ; 5647   00FF 0011 0000 00F0
        DECLE   $000F,  $0000,  $00FF,  $00F1   ; 564B   000F 0000 00FF 00F1
        DECLE   $0000,  $00F0,  $0011,  $0000   ; 564F   0000 00F0 0011 0000
        DECLE   $0001,  $000F,  $0000           ; 5653   0001 000F 0000

        DECR    R0                              ; 5656   0010
        ADDR    R5,     R7                      ; 5657   00EF

        DECLE   $0000                           ; 5658   0000
L_5659:
        PSHR    R5                              ; 5659   0275
        MVI     G_018B, R1                      ; 565A   0281 018B
        SLL     R1,     2                       ; 565C   004D
        MOVR    R1,     R5                      ; 565D   008D
        SLL     R1,     1                       ; 565E   0049
        ADDR    R1,     R5                      ; 565F   00CD
        MVI     G_0184, R1                      ; 5660   0281 0184
        ADDR    R1,     R5                      ; 5662   00CD
        SLL     R1,     1                       ; 5663   0049
        ADDR    R1,     R5                      ; 5664   00CD
        SDBD                                    ; 5665   0001
        ADDI    #$5641, R5                      ; 5666   02FD 0041 0056
        MVII    #$012D, R4                      ; 5669   02BC 012D
        MVII    #$0007, R3                      ; 566B   02BB 0007
        MVI     G_0183, R1                      ; 566D   0281 0183
        B       L_5679                          ; 566F   0200 0008

L_5671:
        MVI@    R5,     R2                      ; 5671   02AA
        TSTR    R2                              ; 5672   0092
        BNEQ    L_5678                          ; 5673   020C 0003

        SUBI    #$0003, R5                      ; 5675   033D 0003
        MVI@    R5,     R2                      ; 5677   02AA
L_5678:
        ADDR    R2,     R1                      ; 5678   00D1
L_5679:
        PSHR    R5                              ; 5679   0275
        PSHR    R3                              ; 567A   0273
        PSHR    R4                              ; 567B   0274

        JSR     R5,     L_581A                  ; 567C   0004 0158 001A

        MVI     G_0184, R3                      ; 567F   0283 0184
        SWAP    R0,     2                       ; 5681   0044
L_5682:
        DECR    R3                              ; 5682   0013
        BMI     L_5688                          ; 5683   020B 0003

        SLR     R0,     2                       ; 5685   0064
        B       L_5682                          ; 5686   0220 0005

L_5688:
        MVI     G_018B, R4                      ; 5688   0284 018B
        TSTR    R4                              ; 568A   00A4
        BEQ     L_5695                          ; 568B   0204 0008

        MOVR    R0,     R5                      ; 568D   0085
        ANDI    #$00CC, R0                      ; 568E   03B8 00CC
        XORR    R0,     R5                      ; 5690   01C5
        SWAP    R0,     2                       ; 5691   0044
        SLR     R0,     2                       ; 5692   0064
        SLR     R0,     2                       ; 5693   0064
        ADDR    R5,     R0                      ; 5694   00E8
L_5695:
        PULR    R4                              ; 5695   02B4
        MVO@    R0,     R4                      ; 5696   0260
        PULR    R3                              ; 5697   02B3
        PULR    R5                              ; 5698   02B5
        DECR    R3                              ; 5699   0013
        BPL     L_5671                          ; 569A   0223 002A
        PULR    R7                              ; 569C   02B7

        DECLE   $0000,  $0004,  $01A0,  $0000   ; 569D   0000 0004 01A0 0000
        DECLE   $0000,  $0061,  $002C,  $0000   ; 56A1   0000 0061 002C 0000
        DECLE   $0000,  $0081,  $002D,  $0000   ; 56A5   0000 0081 002D 0000
        DECLE   $0003,  $0021,  $0021,  $0180   ; 56A9   0003 0021 0021 0180
        DECLE   $0004,  $0021,  $0021,  $01A0   ; 56AD   0004 0021 0021 01A0
        DECLE   $0061,  $0021,  $0021,  $002C   ; 56B1   0061 0021 0021 002C
        DECLE   $0081,  $0021,  $0021,  $002D   ; 56B5   0081 0021 0021 002D
        DECLE   $0021,  $0021,  $0021,  $0021   ; 56B9   0021 0021 0021 0021
        DECLE   $0000,  $0002,  $0160,  $0000   ; 56BD   0000 0002 0160 0000
        DECLE   $0000,  $0001,  $0020,  $0000   ; 56C1   0000 0001 0020 0000
        DECLE   $0000,  $0041,  $002B,  $0000   ; 56C5   0000 0041 002B 0000
        DECLE   $0000,  $0021,  $0021,  $0000   ; 56C9   0000 0021 0021 0000
        DECLE   $0001,  $0021,  $0021,  $0020   ; 56CD   0001 0021 0021 0020
        DECLE   $0000,  $000A,  $0260,  $0000   ; 56D1   0000 000A 0260 0000
        DECLE   $0000,  $0005,  $01C0,  $0000   ; 56D5   0000 0005 01C0 0000
        DECLE   $0000,  $0006,  $01E0,  $0000   ; 56D9   0000 0006 01E0 0000
        DECLE   $0000,  $00E1,  $0030,  $0000   ; 56DD   0000 00E1 0030 0000
        DECLE   $0000,  $0101,  $0031,  $0000   ; 56E1   0000 0101 0031 0000
        DECLE   $0000,  $0121,  $0032,  $0000   ; 56E5   0000 0121 0032 0000
        DECLE   $0000,  $0141,  $0033,  $0000   ; 56E9   0000 0141 0033 0000
        DECLE   $0004,  $0006,  $0021,  $01A0   ; 56ED   0004 0006 0021 01A0
        DECLE   $0061,  $00E1,  $0021,  $002C   ; 56F1   0061 00E1 0021 002C
        DECLE   $0021,  $0121,  $0021,  $0021   ; 56F5   0021 0121 0021 0021
        DECLE   $0021,  $0141,  $0021,  $0021   ; 56F9   0021 0141 0021 0021
        DECLE   $0000,  $0001,  $0021,  $0000   ; 56FD   0000 0001 0021 0000
        DECLE   $0001,  $0041,  $0021,  $0020   ; 5701   0001 0041 0021 0020
        DECLE   $0003,  $0025,  $0021,  $0180   ; 5705   0003 0025 0021 0180
        DECLE   $0000,  $0042,  $002B,  $0000   ; 5709   0000 0042 002B 0000
L_570D:
        PSHR    R5                              ; 570D   0275
        ANDI    #$00FF, R1                      ; 570E   03B9 00FF
        MOVR    R1,     R0                      ; 5710   0088
        ANDI    #$000F, R0                      ; 5711   03B8 000F
        SLR     R1,     2                       ; 5713   0065
        SLR     R1,     2                       ; 5714   0065
        TSTR    R2                              ; 5715   0092
        BNEQ    L_571B                          ; 5716   020C 0003

        XORR    R0,     R1                      ; 5718   01C1
        XORR    R1,     R0                      ; 5719   01C8
        XORR    R0,     R1                      ; 571A   01C1
L_571B:
        CLRR    R3                              ; 571B   01DB
        SUBI    #$0006, R1                      ; 571C   0339 0006
        BGE     L_5723                          ; 571E   020D 0003

        NEGR    R1                              ; 5720   0021
        ADDI    #$0002, R3                      ; 5721   02FB 0002
L_5723:
        SUBI    #$0005, R0                      ; 5723   0338 0005
        BGT     L_572A                          ; 5725   020E 0003

        NEGR    R0                              ; 5727   0020
        INCR    R0                              ; 5728   0008
        INCR    R3                              ; 5729   000B
L_572A:
        TSTR    R2                              ; 572A   0092
        BNEQ    L_572F                          ; 572B   020C 0002

        SARC    R3,     2                       ; 572D   007F
        RLC     R3,     2                       ; 572E   0057
L_572F:
        MOVR    R1,     R4                      ; 572F   008C
        INCR    R4                              ; 5730   000C
        ADDR    R7,     R4                      ; 5731   00FC
        ADD@    R4,     R7                      ; 5732   02E7

        INCR    R3                              ; 5733   000B
        SWAP    R3,     1                       ; 5734   0043
        SWAP    R3,     1                       ; 5735   0043
        SWAP    R3,     1                       ; 5736   0043
        SWAP    R3,     1                       ; 5737   0043
        INCR    R3                              ; 5738   000B
        RSWD    R6                              ; 5739   003E
        RSWD    R6                              ; 573A   003E
        RSWD    R6                              ; 573B   003E
        RSWD    R6                              ; 573C   003E
        RSWD    R6                              ; 573D   003E
        CMPI    #$0006, R0                      ; 573E   0378 0006
        BEQ     L_5774                          ; 5740   0204 0032

        CMPI    #$0003, R0                      ; 5742   0378 0003
        BNEQ    L_5771                          ; 5744   020C 002B

        INCR    R1                              ; 5746   0009
        MVI     G_035C, R0                      ; 5747   0280 035C
        XORI    #$0030, R0                      ; 5749   03F8 0030
        MVII    #$0004, R4                      ; 574B   02BC 0004
        TSTR    R2                              ; 574D   0092
        BNEQ    L_5752                          ; 574E   020C 0002

        ADDR    R4,     R4                      ; 5750   00E4
        SWAP    R0,     1                       ; 5751   0040
L_5752:
        PSHR    R3                              ; 5752   0273

        JSR     R5,     L_578C                  ; 5753   0004 0154 038C

        ANDR    R3,     R4                      ; 5756   019C
        PULR    R3                              ; 5757   02B3
        INCR    R3                              ; 5758   000B
        ADDR    R2,     R3                      ; 5759   00D3
        DECR    R1                              ; 575A   0011
        BEQ     L_5752                          ; 575B   0224 000A

        ADDR    R3,     R1                      ; 575D   00D9
L_575E:
        SLR     R0,     1                       ; 575E   0060
        DECR    R1                              ; 575F   0011
        BPL     L_575E                          ; 5760   0223 0003

        ANDI    #$0003, R0                      ; 5762   03B8 0003
        CMPI    #$0001, R0                      ; 5764   0378 0001
        BNEQ    L_5769                          ; 5766   020C 0001

        DECR    R0                              ; 5768   0010
L_5769:
        TSTR    R4                              ; 5769   00A4
        BEQ     L_5770                          ; 576A   0204 0004

        ANDI    #$00FD, R0                      ; 576C   03B8 00FD
        XORI    #$0002, R0                      ; 576E   03F8 0002
L_5770:
        PULR    R7                              ; 5770   02B7

L_5771:
        MVII    #$0001, R0                      ; 5771   02B8 0001
        PULR    R7                              ; 5773   02B7

L_5774:
        CLRR    R0                              ; 5774   01C0
        PULR    R7                              ; 5775   02B7

        JSR     R5,     L_578C                  ; 5776   0004 0154 038C

        SETC                                    ; 5779   0007
        RLC     R3,     1                       ; 577A   0053
        XORR    R2,     R3                      ; 577B   01D3
        SLL     R3,     2                       ; 577C   004F
        ADDR    R1,     R3                      ; 577D   00CB
        SDBD                                    ; 577E   0001
        ADDI    #$5799, R3                      ; 577F   02FB 0099 0057
        MVI@    R3,     R1                      ; 5782   0299
        SLL     R1,     2                       ; 5783   004D
L_5784:
        SLR     R1,     2                       ; 5784   0065
        DECR    R0                              ; 5785   0010
        BNEQ    L_5784                          ; 5786   022C 0003

        ANDI    #$0003, R1                      ; 5788   03B9 0003
        MOVR    R1,     R0                      ; 578A   0088
        PULR    R7                              ; 578B   02B7

L_578C:
        PSHR    R5                              ; 578C   0275
        MOVR    R3,     R5                      ; 578D   009D
        MVI     G_035C, R3                      ; 578E   0283 035C
        B       L_5794                          ; 5790   0200 0002

L_5792:
        SAR     R3,     2                       ; 5792   006F
        SAR     R3,     2                       ; 5793   006F
L_5794:
        DECR    R5                              ; 5794   0015
        BPL     L_5792                          ; 5795   0223 0004

        ANDI    #$000F, R3                      ; 5797   03BB 000F
        PULR    R7                              ; 5799   02B7

        DECLE   $0000,  $018D,  $018D,  $0000   ; 579A   0000 018D 018D 0000
        DECLE   $0000,  $0145,  $0145,  $0000   ; 579E   0000 0145 0145 0000
        DECLE   $0145,  $0145,  $0145,  $0145   ; 57A2   0145 0145 0145 0145
        DECLE   $0000,  $02AA,  $02AA,  $0000   ; 57A6   0000 02AA 02AA 0000
        DECLE   $0175,  $02AA,  $029A,  $0355   ; 57AA   0175 02AA 029A 0355
        DECLE   $0044,  $0246,  $02C6,  $0044   ; 57AE   0044 0246 02C6 0044
        DECLE   $0006,  $0151,  $0115,  $0240   ; 57B2   0006 0151 0115 0240
        DECLE   $0004,  $0272,  $0236,  $0040   ; 57B6   0004 0272 0236 0040
        DECLE   $0210,  $0105,  $0111,  $0088   ; 57BA   0210 0105 0111 0088
        DECLE   $0180,  $0129,  $0114,  $0084   ; 57BE   0180 0129 0114 0084
        DECLE   $00C8,  $018D,  $0165,  $0000   ; 57C2   00C8 018D 0165 0000
        DECLE   $0001,  $0185,  $0005,  $0181   ; 57C6   0001 0185 0005 0181
        DECLE   $0104,  $0325,  $0163,  $0041   ; 57CA   0104 0325 0163 0041
        DECLE   $0041,  $01D3,  $031D,  $0104   ; 57CE   0041 01D3 031D 0104
        DECLE   $0346,  $0201,  $0102,  $0247   ; 57D2   0346 0201 0102 0247
        DECLE   $0010,  $0356,  $0257,  $0010   ; 57D6   0010 0356 0257 0010
        DECLE   $0030,  $0165,  $0304,  $0104   ; 57DA   0030 0165 0304 0104
        DECLE   $01C0,  $0366,  $0166,  $0040   ; 57DE   01C0 0366 0166 0040
        DECLE   $0000,  $0189,  $0165,  $0000   ; 57E2   0000 0189 0165 0000
        DECLE   $0000,  $01A7,  $0187,  $0000   ; 57E6   0000 01A7 0187 0000
        DECLE   $0000,  $01A5,  $0169,  $0000   ; 57EA   0000 01A5 0169 0000
        DECLE   $0000,  $0169,  $01A5,  $0000   ; 57EE   0000 0169 01A5 0000
        DECLE   $0084,  $0323,  $0313,  $0048   ; 57F2   0084 0323 0313 0048
        DECLE   $0048,  $0313,  $0313,  $0084   ; 57F6   0048 0313 0313 0084
        DECLE   $0006,  $0154,  $0100,  $0014   ; 57FA   0006 0154 0100 0014
        DECLE   $0050,  $0001,  $0066,  $0240   ; 57FE   0050 0001 0066 0240
        DECLE   $02A1,  $0221,  $0221,  $02A1   ; 5802   02A1 0221 0221 02A1
        DECLE   $0088,  $0175,  $0145,  $0145   ; 5806   0088 0175 0145 0145
        DECLE   $0010,  $0000,  $004C,  $0179   ; 580A   0010 0000 004C 0179
        DECLE   $0015,  $0014,  $0014,  $0019   ; 580E   0015 0014 0014 0019
        DECLE   $0004,  $0004,  $0025,  $0114   ; 5812   0004 0004 0025 0114
        DECLE   $0208,  $0004                   ; 5816   0208 0004

        ADDR    R2,     R5                      ; 5818   00D5
        SLR     R1,     2                       ; 5819   0065
L_581A:
        PSHR    R5                              ; 581A   0275
        PSHR    R1                              ; 581B   0271
        CLRR    R2                              ; 581C   01D2

        JSR     R5,     L_570D                  ; 581D   0004 0154 030D

        PULR    R1                              ; 5820   02B1
        PSHR    R1                              ; 5821   0271
        SLL     R0,     2                       ; 5822   004C
        PSHR    R0                              ; 5823   0270
        ADDI    #$0010, R1                      ; 5824   02F9 0010
        MVII    #$0001, R2                      ; 5826   02BA 0001

        JSR     R5,     L_570D                  ; 5828   0004 0154 030D

        XOR@    R6,     R0                      ; 582B   03F0
        SLL     R0,     2                       ; 582C   004C
        PULR    R1                              ; 582D   02B1
        PSHR    R1                              ; 582E   0271
        PSHR    R0                              ; 582F   0270
        INCR    R1                              ; 5830   0009
        CLRR    R2                              ; 5831   01D2

        JSR     R5,     L_570D                  ; 5832   0004 0154 030D

        XOR@    R6,     R0                      ; 5835   03F0
        SLL     R0,     2                       ; 5836   004C
        PULR    R1                              ; 5837   02B1
        PSHR    R1                              ; 5838   0271
        PSHR    R0                              ; 5839   0270
        MVII    #$0001, R2                      ; 583A   02BA 0001

        JSR     R5,     L_570D                  ; 583C   0004 0154 030D

        XOR@    R6,     R0                      ; 583F   03F0
        PULR    R1                              ; 5840   02B1
        PULR    R7                              ; 5841   02B7

        PSHR    R5                              ; 5842   0275
L_5843:
        MVI     G_0184, R5                      ; 5843   0285 0184
        ADDR    R5,     R5                      ; 5845   00ED
        ADDR    R5,     R5                      ; 5846   00ED
        SDBD                                    ; 5847   0001
        ADDI    #$585F, R5                      ; 5848   02FD 005F 0058
        MVII    #$0160, R4                      ; 584B   02BC 0160
        MVI     G_0183, R1                      ; 584D   0281 0183
        B       L_5854                          ; 584F   0200 0003

L_5851:
        MVI     G_0183, R1                      ; 5851   0281 0183
        ADD@    R5,     R1                      ; 5853   02E9
L_5854:
        PSHR    R5                              ; 5854   0275

        JSR     R5,     L_586F                  ; 5855   0004 0158 006F

        PULR    R5                              ; 5858   02B5
        MVO@    R3,     R4                      ; 5859   0263
        CMPI    #$0164, R4                      ; 585A   037C 0164
        BLE     L_5851                          ; 585C   0226 000C
        PULR    R7                              ; 585E   02B7

        ADDR    R6,     R0                      ; 585F   00F0
        ADDR    R4,     R0                      ; 5860   00E0
        ADDR    R6,     R1                      ; 5861   00F1
        ADDR    R5,     R7                      ; 5862   00EF

        DECLE   $0001,  $0002,  $0011,  $00F1   ; 5863   0001 0002 0011 00F1
        DECLE   $0010,  $0020,  $000F,  $0011   ; 5867   0010 0020 000F 0011
        DECLE   $00FF                           ; 586B   00FF

        ADDR    R7,     R6                      ; 586C   00FE
        ADDR    R5,     R7                      ; 586D   00EF
        INCR    R7                              ; 586E   000F

L_586F:
        PSHR    R5                              ; 586F   0275
L_5870:
        MVII    #$01A4, R5                      ; 5870   02BD 01A4
        ANDI    #$00FF, R1                      ; 5872   03B9 00FF
L_5874:
        CMP@    R5,     R1                      ; 5874   0369
        BEQ     L_589B                          ; 5875   0204 0024

        INCR    R5                              ; 5877   000D
        CMPI    #$01EA, R5                      ; 5878   037D 01EA
        BLE     L_5874                          ; 587A   0226 0007

        SDBD                                    ; 587C   0001
        MVII    #$58B1, R5                      ; 587D   02BD 00B1 0058
        MVII    #$0007, R3                      ; 5880   02BB 0007
L_5882:
        CMP@    R5,     R1                      ; 5882   0369
        BEQ     L_589D                          ; 5883   0204 0018

        DECR    R3                              ; 5885   0013
        BPL     L_5882                          ; 5886   0223 0005

        CMP@    R5,     R1                      ; 5888   0369
        BNEQ    L_5890                          ; 5889   020C 0005

        MVI     G_017F, R3                      ; 588B   0283 017F
        SARC    R3,     2                       ; 588D   007F
        BOV     L_58A4                          ; 588E   0202 0014

L_5890:
        CMP@    R5,     R1                      ; 5890   0369
        BNEQ    L_5898                          ; 5891   020C 0005

        MVI     G_017F, R3                      ; 5893   0283 017F
        SARC    R3,     1                       ; 5895   007B
        BC      L_58A4                          ; 5896   0201 000C

L_5898:
        CLRR    R3                              ; 5898   01DB
        CLRR    R5                              ; 5899   01ED
        PULR    R7                              ; 589A   02B7

L_589B:
        MVI@    R5,     R3                      ; 589B   02AB
        PULR    R7                              ; 589C   02B7

L_589D:
        JSR     R5,     L_6EE2                  ; 589D   0004 016C 02E2

        MOVR    R1,     R3                      ; 58A0   008B
        ADDI    #$00B6, R3                      ; 58A1   02FB 00B6
        PULR    R7                              ; 58A3   02B7

L_58A4:
        MVI     G_033C, R3                      ; 58A4   0283 033C
        DECR    R5                              ; 58A6   0015
        ADD@    R5,     R3                      ; 58A7   02EB
        SLR     R3,     2                       ; 58A8   0067
        SLR     R3,     2                       ; 58A9   0067
        XOR     G_015F, R3                      ; 58AA   03C3 015F
        ANDI    #$0003, R3                      ; 58AC   03BB 0003
        ADDI    #$00F5, R3                      ; 58AE   02FB 00F5
        PULR    R7                              ; 58B0   02B7

        GSWD    R0                              ; 58B1   0030
        TSTR    R0                              ; 58B2   0080
        RSWD    R3                              ; 58B3   003B
        MOVR    R1,     R3                      ; 58B4   008B
        DIS                                     ; 58B5   0003
        INCR    R0                              ; 58B6   0008
        MOVR    R6,     R3                      ; 58B7   00B3
        MOVR    R7,     R0                      ; 58B8   00B8
        RLC     R0,     1                       ; 58B9   0050
        SAR     R3,     1                       ; 58BA   006B
        MVI     G_0102, R0                      ; 58BB   0280 0102
        DECR    R0                              ; 58BD   0010
        CMPI    #$0003, R0                      ; 58BE   0378 0003
        BEQ     L_58C4                          ; 58C0   0204 0002
        MVI     G_034C, R7                      ; 58C2   0287 034C

L_58C4:
        MVO     R0,     G_0102                  ; 58C4   0240 0102
        PSHR    R5                              ; 58C6   0275
        MVO     R0,     .STIC.VIDEN             ; 58C7   0240 0020
        MVII    #$0174, R3                      ; 58C9   02BB 0174
        SDBD                                    ; 58CB   0001
        MVII    #$3940, R4                      ; 58CC   02BC 0040 0039
L_58CF:
        SDBD                                    ; 58CF   0001
        MVII    #$5F3B, R5                      ; 58D0   02BD 003B 005F
        MVI@    R3,     R1                      ; 58D3   0299
        ADDR    R1,     R1                      ; 58D4   00C9
        BEQ     L_58E9                          ; 58D5   0204 0012

        SDBD                                    ; 58D7   0001
        ADDI    #$5A28, R1                      ; 58D8   02F9 0028 005A
        ADDI    #$0038, R5                      ; 58DB   02FD 0038
        MVI@    R1,     R1                      ; 58DD   0289
        MOVR    R1,     R2                      ; 58DE   008A
        ANDI    #$0070, R1                      ; 58DF   03B9 0070
        SLR     R1,     1                       ; 58E1   0061
        ADDR    R1,     R5                      ; 58E2   00CD
        ANDI    #$0380, R2                      ; 58E3   03BA 0380
        SLR     R2,     2                       ; 58E5   0066
        ADDR    R2,     R5                      ; 58E6   00D5
        SLR     R2,     1                       ; 58E7   0062
        ADDR    R2,     R5                      ; 58E8   00D5
L_58E9:
        MVII    #$0003, R2                      ; 58E9   02BA 0003
L_58EB:
        MVI@    R5,     R1                      ; 58EB   02A9
        COMR    R1                              ; 58EC   0019
        MVO@    R1,     R4                      ; 58ED   0261
        MVI@    R5,     R1                      ; 58EE   02A9
        COMR    R1                              ; 58EF   0019
        MVO@    R1,     R4                      ; 58F0   0261
        DECR    R2                              ; 58F1   0012
        BPL     L_58EB                          ; 58F2   0223 0008

        INCR    R3                              ; 58F4   000B
        CMPI    #$017B, R3                      ; 58F5   037B 017B
        BLE     L_58CF                          ; 58F7   0226 0029

        PULR    R5                              ; 58F9   02B5
        J       X_PLAY_NOTE                     ; 58FA   0004 0318 02BD

L_58FD:
        PSHR    R5                              ; 58FD   0275
L_58FE:
        MVII    #$01A4, R4                      ; 58FE   02BC 01A4

        JSR     R5,     L_6EE2                  ; 5900   0004 016C 02E2

        MVII    #$000C, R2                      ; 5903   02BA 000C
        TSTR    R3                              ; 5905   009B
        BEQ     L_5914                          ; 5906   0204 000C

        MVI     G_017F, R5                      ; 5908   0285 017F
        COMR    R5                              ; 590A   001D
        ANDR    R3,     R5                      ; 590B   019D
        MVO     R5,     G_017F                  ; 590C   0245 017F
        MVI     G_0185, R0                      ; 590E   0280 0185
        SARC    R0,     1                       ; 5910   0078
        BNC     L_5914                          ; 5911   0209 0001

        MOVR    R3,     R2                      ; 5913   009A
L_5914:
        MVII    #$0005, R3                      ; 5914   02BB 0005
L_5916:
        MOVR    R2,     R5                      ; 5916   0095
        MVII    #$00DD, R0                      ; 5917   02B8 00DD
        ANDI    #$0004, R5                      ; 5919   03BD 0004
        BEQ     L_5928                          ; 591B   0204 000B

        MVII    #$000A, R0                      ; 591D   02B8 000A

        JSR     R5,     X_RAND2                 ; 591F   0004 0114 029E

        INCR    R0                              ; 5922   0008
        SLL     R0,     2                       ; 5923   004C
        SLL     R0,     2                       ; 5924   004C
        ADDI    #$0003, R0                      ; 5925   02F8 0003
        ADDR    R3,     R0                      ; 5927   00D8
L_5928:
        MVO@    R0,     R4                      ; 5928   0260
        INCR    R4                              ; 5929   000C
        SLR     R2,     1                       ; 592A   0062
        SUBI    #$0005, R3                      ; 592B   033B 0005
        BEQ     L_5916                          ; 592D   0224 0018

L_592F:
        MVII    #$000A, R0                      ; 592F   02B8 000A

        JSR     R5,     X_RAND2                 ; 5931   0004 0114 029E

        INCR    R0                              ; 5934   0008
        MOVR    R0,     R2                      ; 5935   0082
        MVII    #$000A, R0                      ; 5936   02B8 000A

        JSR     R5,     X_RAND2                 ; 5938   0004 0114 029E

        INCR    R0                              ; 593B   0008
        SLL     R2,     2                       ; 593C   004E
        SLL     R2,     2                       ; 593D   004E
        ADDR    R0,     R2                      ; 593E   00C2
        CMP     G_0183, R2                      ; 593F   0342 0183
        BEQ     L_592F                          ; 5941   0224 0013

        MVII    #$01A3, R5                      ; 5943   02BD 01A3
L_5945:
        INCR    R5                              ; 5945   000D
        CMPR    R4,     R5                      ; 5946   0165
        BGE     L_594E                          ; 5947   020D 0005

        CMP@    R5,     R2                      ; 5949   036A
        BEQ     L_592F                          ; 594A   0224 001C
        B       L_5945                          ; 594C   0220 0008

L_594E:
        MVO@    R2,     R4                      ; 594E   0262
        INCR    R4                              ; 594F   000C
        CMPI    #$01EA, R4                      ; 5950   037C 01EA
        BLE     L_592F                          ; 5952   0226 0024

        SUBI    #$0002, R1                      ; 5954   0339 0002
        MVII    #$01A5, R4                      ; 5956   02BC 01A5
        SDBD                                    ; 5958   0001
        MVII    #$5A02, R3                      ; 5959   02BB 0002 005A
L_595C:
        MVI@    R3,     R0                      ; 595C   0298
        INCR    R3                              ; 595D   000B

        JSR     R5,     X_RAND2                 ; 595E   0004 0114 029E

        ADD@    R3,     R0                      ; 5961   02D8
        DECR    R3                              ; 5962   0013
        CMPI    #$0003, R0                      ; 5963   0378 0003
        BLT     L_5987                          ; 5965   0205 0020

        MVII    #$00A2, R2                      ; 5967   02BA 00A2
        CMPI    #$000E, R0                      ; 5969   0378 000E
        BLE     L_5977                          ; 596B   0206 000A

        CMPI    #$0027, R0                      ; 596D   0378 0027
        BLT     L_5987                          ; 596F   0205 0016

        SUBI    #$0048, R2                      ; 5971   033A 0048
        CMPI    #$004A, R0                      ; 5973   0378 004A
        BGT     L_5987                          ; 5975   020E 0010

L_5977:
        TSTR    R1                              ; 5977   0089
        BGT     L_5987                          ; 5978   020E 000D
        BEQ     L_5986                          ; 597A   0204 000A

        PSHR    R0                              ; 597C   0270
        MVII    #$0001, R0                      ; 597D   02B8 0001

        JSR     R5,     X_RAND1                 ; 597F   0004 0114 027D

        TSTR    R0                              ; 5982   0080
        PULR    R0                              ; 5983   02B0
        BEQ     L_5987                          ; 5984   0204 0001

L_5986:
        ADDR    R2,     R0                      ; 5986   00D0
L_5987:
        MOVR    R0,     R2                      ; 5987   0082
        SLL     R2,     1                       ; 5988   004A
        SDBD                                    ; 5989   0001
        ADDI    #$5A2B, R2                      ; 598A   02FA 002B 005A
        MVI@    R2,     R2                      ; 598D   0292
        ANDI    #$000F, R2                      ; 598E   03BA 000F
        CMP     G_0185, R2                      ; 5990   0342 0185
        BGT     L_595C                          ; 5992   022E 0037

        INCR    R0                              ; 5994   0008
        MVO@    R0,     R4                      ; 5995   0260
        INCR    R4                              ; 5996   000C
        ADDI    #$0002, R3                      ; 5997   02FB 0002
        CMPI    #$01CB, R4                      ; 5999   037C 01CB
        BLE     L_595C                          ; 599B   0226 0040

        MVII    #$0010, R0                      ; 599D   02B8 0010
        DECR    R4                              ; 599F   0014

        JSR     R5,     X_FILL_ZERO             ; 59A0   0004 0114 0338

        MVII    #$01DD, R4                      ; 59A3   02BC 01DD
L_59A5:
        MVII    #$0066, R0                      ; 59A5   02B8 0066

        JSR     R5,     X_RAND2                 ; 59A7   0004 0114 029E

        SUBI    #$0032, R0                      ; 59AA   0338 0032
        BPL     L_59B2                          ; 59AC   0203 0004

        ANDI    #$0003, R0                      ; 59AE   03B8 0003
        ADDI    #$0030, R0                      ; 59B0   02F8 0030
L_59B2:
        MOVR    R0,     R2                      ; 59B2   0082
        SLL     R2,     2                       ; 59B3   004E
        SDBD                                    ; 59B4   0001
        ADDI    #$5B9C, R2                      ; 59B5   02FA 009C 005B
        MVI@    R2,     R3                      ; 59B8   0293
        SWAP    R3,     1                       ; 59B9   0043
        ANDI    #$0003, R3                      ; 59BA   03BB 0003
        DECR    R3                              ; 59BC   0013
        TSTR    R1                              ; 59BD   0089
        BMI     L_59C3                          ; 59BE   020B 0003

        CMPR    R1,     R3                      ; 59C0   014B
        BEQ     L_59A5                          ; 59C1   0224 001D

L_59C3:
        ADDI    #$0003, R2                      ; 59C3   02FA 0003
        MVI@    R2,     R2                      ; 59C5   0292
        ANDI    #$000F, R2                      ; 59C6   03BA 000F
        CMP     G_0185, R2                      ; 59C8   0342 0185
        BGT     L_59A5                          ; 59CA   022E 0026

        MOVR    R0,     R3                      ; 59CC   0083
        INCR    R3                              ; 59CD   000B

        JSR     R5,     L_6FF3                  ; 59CE   0004 016C 03F3

        BNEQ    L_59E9                          ; 59D1   020C 0016

        PSHR    R0                              ; 59D3   0270
        PSHR    R1                              ; 59D4   0271
        PSHR    R4                              ; 59D5   0274
        DECR    R4                              ; 59D6   0014
        MVI@    R4,     R1                      ; 59D7   02A1

        JSR     R5,     L_581A                  ; 59D8   0004 0158 001A

        MOVR    R0,     R2                      ; 59DB   0082
        PULR    R4                              ; 59DC   02B4
        PULR    R1                              ; 59DD   02B1
        PULR    R0                              ; 59DE   02B0
        MVII    #$0003, R5                      ; 59DF   02BD 0003
L_59E1:
        SARC    R2,     2                       ; 59E1   007E
        BC      L_59E6                          ; 59E2   0201 0002
        BNOV    L_59A5                          ; 59E4   022A 0040

L_59E6:
        DECR    R5                              ; 59E6   0015
        BPL     L_59E1                          ; 59E7   0223 0007

L_59E9:
        ADDI    #$00C1, R0                      ; 59E9   02F8 00C1
        MVO@    R0,     R4                      ; 59EB   0260
        INCR    R4                              ; 59EC   000C
        CMPI    #$01EC, R4                      ; 59ED   037C 01EC
        BLT     L_59A5                          ; 59EF   0225 004B

        MVI     G_0139, R0                      ; 59F1   0280 0139
        SLL     R0,     2                       ; 59F3   004C
        DECR    R0                              ; 59F4   0010
        BPL     L_59F9                          ; 59F5   0203 0002

        MVII    #$0001, R0                      ; 59F7   02B8 0001
L_59F9:
        CMP     G_0185, R0                      ; 59F9   0340 0185
        BNEQ    L_5A01                          ; 59FB   020C 0004

        MVII    #$00F4, R0                      ; 59FD   02B8 00F4
        MVO     R0,     G_01DD                  ; 59FF   0240 01DD
L_5A01:
        PULR    R7                              ; 5A01   02B7

        DECLE   $0001,  $0002,  $0001,  $0002   ; 5A02   0001 0002 0001 0002
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5A06   0001 0000 0001 0001
        DECLE   $0001,  $0001,  $0024,  $0003   ; 5A0A   0001 0001 0024 0003
        DECLE   $0024,  $0003,  $0024,  $0027   ; 5A0E   0024 0003 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A12   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A16   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A1A   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0012,  $004B   ; 5A1E   0024 0027 0012 004B
        DECLE   $0012,  $004B,  $0012,  $004B   ; 5A22   0012 004B 0012 004B
        DECLE   $0012,  $004B,  $0012,  $004B   ; 5A26   0012 004B 0012 004B
        DECLE   $0003,  $0000,  $0013,  $0000   ; 5A2A   0003 0000 0013 0000
        DECLE   $0021,  $0000                   ; 5A2E   0021 0000

        MOVR    R0,     R3                      ; 5A30   0083
        NEGR    R0                              ; 5A31   0020
        MOVR    R1,     R2                      ; 5A32   008A
        SWAP    R1,     1                       ; 5A33   0041
        TSTR    R1                              ; 5A34   0089
        SLR     R3,     1                       ; 5A35   0063
        MOVR    R1,     R0                      ; 5A36   0088
        MOVR    R2,     R6                      ; 5A37   0096
        MOVR    R0,     R6                      ; 5A38   0086
        ADDR    R1,     R0                      ; 5A39   00C8
        MOVR    R0,     R7                      ; 5A3A   0087

        ADDR    R7,     R4                      ; 5A3B   00FC
        MOVR    R4,     R3                      ; 5A3C   00A3
        DECR    R0                              ; 5A3D   0010
        MOVR    R5,     R2                      ; 5A3E   00AA
        NEGR    R1                              ; 5A3F   0021
        MOVR    R5,     R1                      ; 5A40   00A9
        GSWD    R2                              ; 5A41   0032
        MOVR    R5,     R0                      ; 5A42   00A8
        RLC     R1,     2                       ; 5A43   0055
        MOVR    R4,     R6                      ; 5A44   00A6
        RRC     R3,     2                       ; 5A45   0077
        MOVR    R4,     R7                      ; 5A46   00A7

        MOVR    R3,     R1                      ; 5A47   0099
        MOVR    R2,     R3                      ; 5A48   0093
        NEGR    R0                              ; 5A49   0020
        MOVR    R3,     R2                      ; 5A4A   009A
        SWAP    R1,     1                       ; 5A4B   0041
        MOVR    R3,     R1                      ; 5A4C   0099
        SLR     R3,     1                       ; 5A4D   0063
        MOVR    R3,     R0                      ; 5A4E   0098
        MOVR    R2,     R6                      ; 5A4F   0096
        MOVR    R2,     R6                      ; 5A50   0096
        ADDR    R1,     R0                      ; 5A51   00C8
        MOVR    R2,     R7                      ; 5A52   0097

        DECLE   $00FC,  $00B3,  $00A1,  $00BA   ; 5A53   00FC 00B3 00A1 00BA
        DECLE   $00E2,  $00B9,  $0123,  $00B8   ; 5A57   00E2 00B9 0123 00B8
        DECLE   $0166,  $00B6,  $01A9,  $00B7   ; 5A5B   0166 00B6 01A9 00B7

        CLRR    R5                              ; 5A5F   01ED
        ADDR    R0,     R3                      ; 5A60   00C3
        MOVR    R4,     R2                      ; 5A61   00A2
        ADDR    R1,     R2                      ; 5A62   00CA
        ADDR    R4,     R3                      ; 5A63   00E3
        ADDR    R1,     R1                      ; 5A64   00C9
        SUBR    R4,     R4                      ; 5A65   0124
        ADDR    R1,     R0                      ; 5A66   00C8
        CMPR    R4,     R6                      ; 5A67   0166
        ADDR    R0,     R6                      ; 5A68   00C6
        ANDR    R5,     R1                      ; 5A69   01A9
        ADDR    R0,     R7                      ; 5A6A   00C7

        CLRR    R5                              ; 5A6B   01ED
        ADDR    R2,     R3                      ; 5A6C   00D3
        RLC     R0,     1                       ; 5A6D   0050
        ADDR    R3,     R2                      ; 5A6E   00DA
        TSTR    R0                              ; 5A6F   0080
        ADDR    R3,     R1                      ; 5A70   00D9
        MOVR    R6,     R1                      ; 5A71   00B1
        ADDR    R3,     R0                      ; 5A72   00D8
        ADDR    R4,     R5                      ; 5A73   00E5
        ADDR    R2,     R6                      ; 5A74   00D6
        SUBR    R2,     R7                      ; 5A75   0117
        ADDR    R2,     R7                      ; 5A76   00D7

        DECLE   $0149,  $0103,  $0000           ; 5A77   0149 0103 0000

        SUBR    R1,     R2                      ; 5A7A   010A
        DECR    R0                              ; 5A7B   0010
        SUBR    R1,     R1                      ; 5A7C   0109
        GSWD    R1                              ; 5A7D   0031
        SUBR    R1,     R0                      ; 5A7E   0108
        RLC     R0,     2                       ; 5A7F   0054
        SUBR    R0,     R6                      ; 5A80   0106
        RRC     R2,     2                       ; 5A81   0076
        SUBR    R0,     R7                      ; 5A82   0107

        MOVR    R3,     R0                      ; 5A83   0098
        SUBR    R2,     R3                      ; 5A84   0113
        SWAP    R2,     1                       ; 5A85   0042
        SUBR    R3,     R2                      ; 5A86   011A
        SLR     R3,     1                       ; 5A87   0063
        SUBR    R3,     R1                      ; 5A88   0119
        MOVR    R0,     R5                      ; 5A89   0085
        SUBR    R3,     R0                      ; 5A8A   0118
        MOVR    R5,     R1                      ; 5A8B   00A9
        SUBR    R2,     R6                      ; 5A8C   0116
        ADDR    R1,     R3                      ; 5A8D   00CB
        SUBR    R2,     R7                      ; 5A8E   0117

        XORR    R7,     R5                      ; 5A8F   01FD
        CMPR    R2,     R3                      ; 5A90   0153
        DECR    R0                              ; 5A91   0010
        CMPR    R3,     R2                      ; 5A92   015A
        GSWD    R0                              ; 5A93   0030
        CMPR    R3,     R1                      ; 5A94   0159
        RLC     R1,     1                       ; 5A95   0051
        CMPR    R3,     R0                      ; 5A96   0158
        MOVR    R0,     R4                      ; 5A97   0084
        CMPR    R2,     R6                      ; 5A98   0156
        ADDR    R0,     R7                      ; 5A99   00C7

        DECLE   $0157,  $011A,  $0123,  $0030   ; 5A9A   0157 011A 0123 0030
        DECLE   $012A,  $0050,  $0129,  $0071   ; 5A9E   012A 0050 0129 0071
        DECLE   $0128,  $00A4,  $0126,  $00F7   ; 5AA2   0128 00A4 0126 00F7
        DECLE   $0127,  $0149,  $0133,  $0050   ; 5AA6   0127 0149 0133 0050
        DECLE   $013A,  $0071,  $0139,  $0092   ; 5AAA   013A 0071 0139 0092
        DECLE   $0138,  $00C4,  $0136,  $0116   ; 5AAE   0138 00C4 0136 0116
        DECLE   $0137                           ; 5AB2   0137

        CMPR    R7,     R2                      ; 5AB3   017A
        CMPR    R0,     R3                      ; 5AB4   0143
        RRC     R1,     1                       ; 5AB5   0071
        CMPR    R1,     R2                      ; 5AB6   014A
        TSTR    R2                              ; 5AB7   0092
        CMPR    R1,     R1                      ; 5AB8   0149
        ADDR    R2,     R3                      ; 5AB9   00D3
        CMPR    R1,     R0                      ; 5ABA   0148
        CMPR    R2,     R5                      ; 5ABB   0155
        CMPR    R0,     R6                      ; 5ABC   0146
        ANDR    R5,     R1                      ; 5ABD   01A9
        CMPR    R0,     R7                      ; 5ABE   0147
        XORR    R7,     R3                      ; 5ABF   01FB
        ANDR    R0,     R3                      ; 5AC0   0183
        NEGR    R1                              ; 5AC1   0021
        ANDR    R1,     R2                      ; 5AC2   018A
        RRC     R3,     1                       ; 5AC3   0073
        ANDR    R1,     R1                      ; 5AC4   0189
        MOVR    R4,     R7                      ; 5AC5   00A7

        DECLE   $0193,  $0062,  $019A,  $0084   ; 5AC6   0193 0062 019A 0084
        DECLE   $0199,  $00DA,  $01A3,  $0095   ; 5ACA   0199 00DA 01A3 0095
        DECLE   $01AA,  $00C9,  $01A9,  $00FE   ; 5ACE   01AA 00C9 01A9 00FE
        DECLE   $01B3,  $0053,  $01BA,  $00B8   ; 5AD2   01B3 0053 01BA 00B8
        DECLE   $01B9,  $00EB,  $01C3,  $0000   ; 5AD6   01B9 00EB 01C3 0000
        DECLE   $01CA,  $0042,  $01C9,  $0095   ; 5ADA   01CA 0042 01C9 0095
        DECLE   $01D3,  $0010,  $01DA,  $0032   ; 5ADE   01D3 0010 01DA 0032
        DECLE   $01D9,  $0096,  $0208,  $0051   ; 5AE2   01D9 0096 0208 0051
        DECLE   $0206,  $023B,  $0207,  $02DD   ; 5AE6   0206 023B 0207 02DD
        DECLE   $0248,  $00A3,  $0246,  $00F5   ; 5AEA   0248 00A3 0246 00F5
        DECLE   $0247,  $0168,  $0228,  $00C4   ; 5AEE   0247 0168 0228 00C4
        DECLE   $0226,  $0199,  $0227,  $028C   ; 5AF2   0226 0199 0227 028C
        DECLE   $0238,  $01EA,  $0236,  $032E   ; 5AF6   0238 01EA 0236 032E
        DECLE   $0237,  $03CF,  $0218,  $0020   ; 5AFA   0237 03CF 0218 0020
        DECLE   $0216,  $0072,  $0217           ; 5AFE   0216 0072 0217

        CMPR    R0,     R7                      ; 5B01   0147
        MVO@    R0,     R3                      ; 5B02   0258
        DECR    R0                              ; 5B03   0010
        MVO@    R6,     R2                      ; 5B04   0256
        GSWD    R0                              ; 5B05   0030
        MVO@    R7,     R2                      ; 5B06   0257
        SUBR    R2,     R6                      ; 5B07   0116
        MVI@    R1,     R1                      ; 5B08   0289
        DECR    R1                              ; 5B09   0011
        MVI@    R1,     R4                      ; 5B0A   028C
        NEGR    R3                              ; 5B0B   0023
        MVI@    R1,     R7                      ; 5B0C   028F

        DECLE   $0035                           ; 5B0D   0035

        MVI@    R3,     R1                      ; 5B0E   0299
        SWAP    R0,     2                       ; 5B0F   0044
        MVI@    R3,     R4                      ; 5B10   029C
        RLC     R2,     2                       ; 5B11   0056
        MVI@    R3,     R7                      ; 5B12   029F

        SAR     R1,     1                       ; 5B13   0069
        MVI@    R5,     R1                      ; 5B14   02A9
        RRC     R3,     2                       ; 5B15   0077
        MVI@    R5,     R4                      ; 5B16   02AC
        TSTR    R1                              ; 5B17   0089
        MVI@    R5,     R7                      ; 5B18   02AF

        DECLE   $009B,  $02B9,  $00A0,  $02BC   ; 5B19   009B 02B9 00A0 02BC
        DECLE   $00A2,  $02BF                   ; 5B1D   00A2 02BF

        MOVR    R4,     R6                      ; 5B1F   00A6
        ADD@    R1,     R1                      ; 5B20   02C9
        MOVR    R4,     R1                      ; 5B21   00A1
        ADD@    R1,     R4                      ; 5B22   02CC
        MOVR    R4,     R3                      ; 5B23   00A3
        ADD@    R1,     R7                      ; 5B24   02CF

        DECLE   $00A8,  $02D3,  $0000,  $02DA   ; 5B25   00A8 02D3 0000 02DA
        DECLE   $0003,  $02D9,  $0007,  $0309   ; 5B29   0003 02D9 0007 0309
        DECLE   $0000                           ; 5B2D   0000

        SUB@    R1,     R0                      ; 5B2E   0308
        DECR    R0                              ; 5B2F   0010
        SUB     .STIC.VDLY,R7                   ; 5B30   0307 0031

        SUB@    R1,     R4                      ; 5B32   030C
        RLC     R0,     2                       ; 5B33   0054
        SUB     G_0076, R2                      ; 5B34   0302 0076
        SUB@    R1,     R7                      ; 5B36   030F

        MOVR    R3,     R0                      ; 5B37   0098
        SUB@    R3,     R1                      ; 5B38   0319
        SWAP    R2,     1                       ; 5B39   0042
        SUB@    R3,     R0                      ; 5B3A   0318
        SLR     R3,     1                       ; 5B3B   0063
        SUB@    R2,     R7                      ; 5B3C   0317

        MOVR    R0,     R5                      ; 5B3D   0085
        SUB@    R3,     R4                      ; 5B3E   031C
        MOVR    R5,     R1                      ; 5B3F   00A9
        SUB@    R2,     R2                      ; 5B40   0312
        ADDR    R1,     R3                      ; 5B41   00CB
        SUB@    R3,     R7                      ; 5B42   031F

        XORR    R7,     R5                      ; 5B43   01FD
        CMP@    R3,     R1                      ; 5B44   0359
        DECR    R0                              ; 5B45   0010
        CMP@    R3,     R0                      ; 5B46   0358
        GSWD    R0                              ; 5B47   0030
        CMP@    R2,     R7                      ; 5B48   0357
        RLC     R1,     1                       ; 5B49   0051
        CMP@    R3,     R4                      ; 5B4A   035C
        MOVR    R0,     R4                      ; 5B4B   0084
        CMP@    R2,     R2                      ; 5B4C   0352
        ADDR    R0,     R7                      ; 5B4D   00C7

        CMP@    R3,     R7                      ; 5B4E   035F
        SUBR    R3,     R2                      ; 5B4F   011A
        SUBI    #$0030, R1                      ; 5B50   0339 0030
        SUBI    #$0050, R0                      ; 5B52   0338 0050
        SUB@    R6,     R7                      ; 5B54   0337

        DECLE   $0071,  $033C,  $00A4,  $0332   ; 5B55   0071 033C 00A4 0332
        DECLE   $00F7,  $033F                   ; 5B59   00F7 033F

        CMPR    R1,     R1                      ; 5B5B   0149
        CMP@    R1,     R1                      ; 5B5C   0349
        RLC     R0,     1                       ; 5B5D   0050
        CMP@    R1,     R0                      ; 5B5E   0348
        RRC     R1,     1                       ; 5B5F   0071
        CMP     G_0092, R7                      ; 5B60   0347 0092
        CMP@    R1,     R4                      ; 5B62   034C
        ADDR    R0,     R4                      ; 5B63   00C4
        CMP     G_0116, R2                      ; 5B64   0342 0116
        CMP@    R1,     R7                      ; 5B66   034F
        CMPR    R7,     R2                      ; 5B67   017A
        SUB@    R5,     R1                      ; 5B68   0329
        RRC     R1,     1                       ; 5B69   0071
        SUB@    R5,     R0                      ; 5B6A   0328
        TSTR    R2                              ; 5B6B   0092
        SUB@    R4,     R7                      ; 5B6C   0327

        ADDR    R2,     R3                      ; 5B6D   00D3
        SUB@    R5,     R4                      ; 5B6E   032C
        CMPR    R2,     R5                      ; 5B6F   0155
        SUB@    R4,     R2                      ; 5B70   0322
        ANDR    R5,     R1                      ; 5B71   01A9
        SUB@    R5,     R7                      ; 5B72   032F

        DECLE   $01FB,  $0389,  $0050,  $0388   ; 5B73   01FB 0389 0050 0388
        DECLE   $00A0,  $0387,  $00F2,  $038C   ; 5B77   00A0 0387 00F2 038C
        DECLE   $0145,  $0382,  $0198,  $038F   ; 5B7B   0145 0382 0198 038F
        DECLE   $01EC,  $0399,  $0080,  $0398   ; 5B7F   01EC 0399 0080 0398
        DECLE   $0101,  $0397,  $0133,  $039C   ; 5B83   0101 0397 0133 039C
        DECLE   $01A6,  $0392,  $021A,  $039F   ; 5B87   01A6 0392 021A 039F
        DECLE   $028E,  $0040,  $00F4,  $0040   ; 5B8B   028E 0040 00F4 0040
        DECLE   $01E7,  $0040,  $032A,  $0396   ; 5B8F   01E7 0040 032A 0396
        DECLE   $0000,  $03C3,  $0000,  $03C3   ; 5B93   0000 03C3 0000 03C3
        DECLE   $0000,  $03C1,  $0000,  $03C5   ; 5B97   0000 03C1 0000 03C5
        DECLE   $0000,  $0223,  $002A,  $0009   ; 5B9B   0000 0223 002A 0009
        DECLE   $0010,  $0223,  $0052,  $001C   ; 5B9F   0010 0223 0052 001C
        DECLE   $0032,  $0223,  $007A,  $002F   ; 5BA3   0032 0223 007A 002F
        DECLE   $0055,  $0210,  $0042,  $0029   ; 5BA7   0055 0210 0042 0029
        DECLE   $00D0,  $0210,  $0072,  $0054   ; 5BAB   00D0 0210 0072 0054
        DECLE   $00F4,  $0210,  $00A2,  $007F   ; 5BAF   00F4 0210 00A2 007F
        DECLE   $0136,  $0245,  $0052,  $0029   ; 5BB3   0136 0245 0052 0029
        DECLE   $0073,  $0245,  $00F2,  $0044   ; 5BB7   0073 0245 00F2 0044
        DECLE   $00B8,  $0245,  $0192,  $0057   ; 5BBB   00B8 0245 0192 0057
        DECLE   $019B,  $0267,  $00A2,  $00A1   ; 5BBF   019B 0267 00A2 00A1
        DECLE   $0154,  $0267,  $016A,  $00F4   ; 5BC3   0154 0267 016A 00F4
        DECLE   $0259,  $0267,  $0232,  $0147   ; 5BC7   0259 0267 0232 0147
        DECLE   $02BD,  $0289,  $01E2,  $0141   ; 5BCB   02BD 0289 01E2 0141
        DECLE   $01BB,  $0289,  $025A,  $0194   ; 5BCF   01BB 0289 025A 0194
        DECLE   $01FD,  $0289,  $02D2,  $01E7   ; 5BD3   01FD 0289 02D2 01E7
        DECLE   $023F,  $0100,  $001D,  $0007   ; 5BD7   023F 0100 001D 0007
        DECLE   $0000,  $0100,  $0035,  $0008   ; 5BDB   0000 0100 0035 0008
        DECLE   $0031,  $0100,  $004D,  $001A   ; 5BDF   0031 0100 004D 001A
        DECLE   $0052,  $0101,  $001D,  $002F   ; 5BE3   0052 0101 001D 002F
        DECLE   $0000,  $0101,  $0035           ; 5BE7   0000 0101 0035

        RLC     R0,     1                       ; 5BEA   0050
        GSWD    R2                              ; 5BEB   0032
        SUBR    R0,     R1                      ; 5BEC   0101
        SLL     R1,     2                       ; 5BED   004D
        SARC    R2,     1                       ; 5BEE   007A
        RLC     R3,     1                       ; 5BEF   0053
        SUBR    R4,     R2                      ; 5BF0   0122
        NEGR    R5                              ; 5BF1   0025
L_5BF2:
        DECR    R7                              ; 5BF2   0017

        DECLE   $00C0,  $0122,  $0045,  $0020   ; 5BF3   00C0 0122 0045 0020
        DECLE   $00F1,  $0122,  $0065,  $0032   ; 5BF7   00F1 0122 0065 0032
        DECLE   $0113,  $0123,  $0025,  $003F   ; 5BFB   0113 0123 0025 003F
        DECLE   $00C1,  $0123,  $0045,  $0060   ; 5BFF   00C1 0123 0045 0060
        DECLE   $00F2,  $0123,  $0065,  $008A   ; 5C03   00F2 0123 0065 008A
        DECLE   $0114,  $0111,  $0053,  $0046   ; 5C07   0114 0111 0053 0046
        DECLE   $0181,  $0111,  $00A3,  $006B   ; 5C0B   0181 0111 00A3 006B
        DECLE   $01C4,  $0111,  $00F3,  $00A2   ; 5C0F   01C4 0111 00F3 00A2
        DECLE   $0216,  $0113,  $0053,  $0096   ; 5C13   0216 0113 0053 0096
        DECLE   $01A2,  $0113,  $00A3,  $00DB   ; 5C17   01A2 0113 00A3 00DB
        DECLE   $01E5,  $0113,  $00F3,  $0132   ; 5C1B   01E5 0113 00F3 0132
        DECLE   $0238,  $0355,  $0233,  $0107   ; 5C1F   0238 0355 0233 0107
        DECLE   $0247,  $0355,  $02AB,  $0160   ; 5C23   0247 0355 02AB 0160
        DECLE   $029C,  $0355,  $031B,  $01E2   ; 5C27   029C 0355 031B 01E2
        DECLE   $02DE,  $0357,  $0233,  $01E7   ; 5C2B   02DE 0357 0233 01E7
        DECLE   $026B,  $0357,  $02AB,  $0280   ; 5C2F   026B 0357 02AB 0280
        DECLE   $02BD,  $0357,  $031B,  $02D2   ; 5C33   02BD 0357 031B 02D2
        DECLE   $02FF,  $0211,  $002C,  $001E   ; 5C37   02FF 0211 002C 001E
        DECLE   $0020,  $0211,  $0054,  $002B   ; 5C3B   0020 0211 0054 002B
        DECLE   $0041,  $0211,  $007C,  $003A   ; 5C3F   0041 0211 007C 003A
        DECLE   $0092,  $0213,  $002C,  $0046   ; 5C43   0092 0213 002C 0046
        DECLE   $0020,  $0213,  $0054,  $006B   ; 5C47   0020 0213 0054 006B
        DECLE   $0062,  $0213                   ; 5C4B   0062 0213

        SARC    R0,     2                       ; 5C4D   007C
        TSTR    R2                              ; 5C4E   0092
        MOVR    R6,     R3                      ; 5C4F   00B3
        CMP@    R2,     R5                      ; 5C50   0355
        CMPR    R5,     R4                      ; 5C51   016C
        MOVR    R4,     R7                      ; 5C52   00A7

        SUBR    R4,     R6                      ; 5C53   0126
        CMP@    R2,     R5                      ; 5C54   0355
        BNEQ    L_5D47                          ; 5C55   020C 00F0

        CMPR    R3,     R3                      ; 5C57   015B
        CMP@    R2,     R5                      ; 5C58   0355
        MVI     G_0142, R4                      ; 5C59   0284 0142
        CMPR    R7,     R5                      ; 5C5B   017D
        B       L_5D54                          ; 5C5C   0200 00F6

        RRC     R1,     1                       ; 5C5E   0071
        MOVR    R6,     R1                      ; 5C5F   00B1
        B       L_5DA8                          ; 5C60   0200 0146

        DECLE   $0213,  $0023,  $0200,  $031E   ; 5C62   0213 0023 0200 031E
        DECLE   $031E,  $02E6,  $038A,  $0193   ; 5C66   031E 02E6 038A 0193
        DECLE   $0147,  $02BF,  $00CC,  $031B   ; 5C6A   0147 02BF 00CC 031B
        DECLE   $0003,  $0000,  $00CC,  $031B   ; 5C6E   0003 0000 00CC 031B
        DECLE   $0003,  $0000,  $00CC,  $031B   ; 5C72   0003 0000 00CC 031B
        DECLE   $0001,  $0010,  $00CC,  $031B   ; 5C76   0001 0010 00CC 031B
        DECLE   $0006,  $0010,  $0300,  $0000   ; 5C7A   0006 0010 0300 0000
        DECLE   $0083,  $005C,  $0009,  $0036   ; 5C7E   0083 005C 0009 0036
        DECLE   $0000                           ; 5C82   0000

        CLRR    R0                              ; 5C83   01C0
        MVO     R0,     G_0138                  ; 5C84   0240 0138
L_5C86:
        CLRR    R0                              ; 5C86   01C0
        MVO@    R0,     R1                      ; 5C87   0248
        INCR    R1                              ; 5C88   0009
        MVO@    R0,     R1                      ; 5C89   0248
        MOVR    R5,     R7                      ; 5C8A   00AF

L_5C8B:
        MOVR    R1,     R4                      ; 5C8B   008C
        SDBD                                    ; 5C8C   0001
        MVII    #$30D0, R2                      ; 5C8D   02BA 00D0 0030
        MVO@    R2,     R4                      ; 5C90   0262
        SDBD                                    ; 5C91   0001
        MVII    #$5CB0, R0                      ; 5C92   02B8 00B0 005C
        MVO@    R0,     R4                      ; 5C95   0260
        MVII    #$0050, R0                      ; 5C96   02B8 0050
        SWAP    R0,     1                       ; 5C98   0040
        MVO@    R0,     R4                      ; 5C99   0260
        INCR    R4                              ; 5C9A   000C
        MVII    #$00F8, R0                      ; 5C9B   02B8 00F8
        MVO@    R0,     R4                      ; 5C9D   0260
        MVII    #$03F0, R0                      ; 5C9E   02B8 03F0
        MVO@    R0,     R4                      ; 5CA0   0260
        MVII    #$001E, R0                      ; 5CA1   02B8 001E
        MVO@    R0,     R4                      ; 5CA3   0260
        MVII    #$0003, R0                      ; 5CA4   02B8 0003
        MVO     R0,     G_0138                  ; 5CA6   0240 0138
        MOVR    R5,     R7                      ; 5CA8   00AF

        DECLE   $0300,  $0000,  $0000,  $0000   ; 5CA9   0300 0000 0000 0000
        DECLE   $0002,  $007C,  $0000,  $0300   ; 5CAD   0002 007C 0000 0300
        DECLE   $0000,  $0083,  $005C,  $0002   ; 5CB1   0000 0083 005C 0002
        DECLE   $0048,  $0000,  $0300,  $0000   ; 5CB5   0048 0000 0300 0000
        DECLE   $0000,  $0000,  $0003,  $004D   ; 5CB9   0000 0000 0003 004D
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5CBD   0000 0300 0000 0000
        DECLE   $0000,  $0006,  $0053,  $0000   ; 5CC1   0000 0006 0053 0000
        DECLE   $0300,  $0000,  $0008,  $0067   ; 5CC5   0300 0000 0008 0067
        DECLE   $0006,  $0059,  $0000,  $0300   ; 5CC9   0006 0059 0000 0300
        DECLE   $0000,  $0058,  $0067,  $0006   ; 5CCD   0000 0058 0067 0006
        DECLE   $005F,  $0000,  $0300,  $0000   ; 5CD1   005F 0000 0300 0000
        DECLE   $0000,  $0000,  $0006,  $0065   ; 5CD5   0000 0000 0006 0065
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5CD9   0000 0300 0000 0000
        DECLE   $0000,  $0006,  $006B,  $0000   ; 5CDD   0000 0006 006B 0000
        DECLE   $0300,  $0000,  $0005,  $0067   ; 5CE1   0300 0000 0005 0067
        DECLE   $0003,  $0071,  $0000,  $0300   ; 5CE5   0003 0071 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5CE9   0000 0000 0000 0002
        DECLE   $0077,  $0000,  $0300,  $0000   ; 5CED   0077 0000 0300 0000
        DECLE   $0059,  $0066,  $000B,  $0002   ; 5CF1   0059 0066 000B 0002
        DECLE   $0000,  $0300,  $0000,  $0059   ; 5CF5   0000 0300 0000 0059
        DECLE   $0066,  $0008,  $0016,  $0000   ; 5CF9   0066 0008 0016 0000
        DECLE   $0300,  $0000,  $0059,  $0066   ; 5CFD   0300 0000 0059 0066
        DECLE   $000C,  $001E,  $0000,  $0300   ; 5D01   000C 001E 0000 0300
        DECLE   $0000,  $0059,  $0066,  $0001   ; 5D05   0000 0059 0066 0001
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5D09   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D0D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D11   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $000B   ; 5D1D   0000 0000 0006 000B
        DECLE   $0001                           ; 5D21   0001

        DIS                                     ; 5D22   0003
L_5D23:
        DIS                                     ; 5D23   0003
L_5D24:
        DECR    R7                              ; 5D24   0017

        DECLE   $002D,  $0047,  $0048,  $004A   ; 5D25   002D 0047 0048 004A
        DECLE   $0024,  $0002,  $0000,  $0000   ; 5D29   0024 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2D   0000 0000 0000 0000
        DECLE   $0001                           ; 5D31   0001

        DIS                                     ; 5D32   0003
        DIS                                     ; 5D33   0003
L_5D34:
        DECR    R7                              ; 5D34   0017

        DECLE   $002D,  $0047,  $0048,  $004A   ; 5D35   002D 0047 0048 004A
        DECLE   $0024,  $0002,  $0000,  $0000   ; 5D39   0024 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3D   0000 0000 0000 0000
        DECLE   $001E,  $007F,  $00FF,  $00FF   ; 5D41   001E 007F 00FF 00FF

        SARC    R3,     2                       ; 5D45   007F
        MOVR    R3,     R5                      ; 5D46   009D
L_5D47:
        TSTR    R1                              ; 5D47   0089
        DECLE   $0090,  $0050,  $0008,  $0000   ; 5D48   0090 0050 0008 0000

        MOVR    R0,     R2                      ; 5D4C   0082
        MOVR    R0,     R2                      ; 5D4D   0082
        SWAP    R1,     1                       ; 5D4E   0041
        SWAP    R1,     1                       ; 5D4F   0041
        NEGR    R2                              ; 5D50   0022
        RSWD    R6                              ; 5D51   003E
        SARC    R3,     2                       ; 5D52   007F
        SLLC    R3,     1                       ; 5D53   005B
L_5D54:
        SARC    R3,     2                       ; 5D54   007F
        DECLE   $0036,  $0022,  $0014,  $0041   ; 5D55   0036 0022 0014 0041
        DECLE   $0041,  $0022,  $0000,  $0000   ; 5D59   0041 0022 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 5D61   0000 0000 0000 000C
        DECLE   $0033,  $0060,  $0060,  $007C   ; 5D65   0033 0060 0060 007C
        DECLE   $003F                           ; 5D69   003F

        INCR    R7                              ; 5D6A   000F

        INCR    R4                              ; 5D6B   000C
L_5D6C:
        RSWD    R6                              ; 5D6C   003E
        DECLE   $0027                           ; 5D6D   0027

        INCR    R7                              ; 5D6E   000F

        DECR    R3                              ; 5D6F   0013
L_5D70:
        DIS                                     ; 5D70   0003
        DECLE   $0006,  $000C,  $000C,  $000C   ; 5D71   0006 000C 000C 000C
        DECLE   $0018,  $005B,  $009C,  $009E   ; 5D75   0018 005B 009C 009E
        DECLE   $006F,  $0007,  $0000,  $0000   ; 5D79   006F 0007 0000 0000
        DECLE   $0001                           ; 5D7D   0001

        SETC                                    ; 5D7E   0007
        INCR    R7                              ; 5D7F   000F

        DECLE   $001F                           ; 5D80   001F
L_5D81:
        COMR    R6                              ; 5D81   001E
        DECLE   $003E,  $003F                   ; 5D82   003E 003F

        SARC    R3,     2                       ; 5D84   007F
        SARC    R3,     2                       ; 5D85   007F
        ADDR    R3,     R7                      ; 5D86   00DF
        INCR    R7                              ; 5D87   000F

        SETC                                    ; 5D88   0007
L_5D89:
        CLRC                                    ; 5D89   0006
        DECLE   $000C,  $0000,  $0000,  $0001   ; 5D8A   000C 0000 0000 0001
        DECLE   $0003,  $0007,  $000C,  $0006   ; 5D8E   0003 0007 000C 0006
        DECLE   $000F,  $001B,  $001F,  $0037   ; 5D92   000F 001B 001F 0037
        DECLE   $006F,  $005F,  $0037,  $000C   ; 5D96   006F 005F 0037 000C
        DECLE   $0018,  $0000,  $0060,  $0050   ; 5D9A   0018 0000 0060 0050
        DECLE   $00E8,  $00D4,  $00AA,  $007E   ; 5D9E   00E8 00D4 00AA 007E
        DECLE   $007F,  $00FF,  $00FF           ; 5DA2   007F 00FF 00FF

        ADDR    R3,     R7                      ; 5DA5   00DF

        MOVR    R3,     R1                      ; 5DA6   0099
        MOVR    R6,     R3                      ; 5DA7   00B3
L_5DA8:
        MOVR    R6,     R2                      ; 5DA8   00B2
        DECLE   $005B,  $0030,  $000C,  $003E   ; 5DA9   005B 0030 000C 003E
        DECLE   $0027                           ; 5DAD   0027

        INCR    R7                              ; 5DAE   000F

        DECR    R3                              ; 5DAF   0013
L_5DB0:
        DIS                                     ; 5DB0   0003
        DECLE   $0006,  $0006,  $0007,  $0003   ; 5DB1   0006 0006 0007 0003
        DECLE   $0003,  $0003,  $0002,  $0006   ; 5DB5   0003 0003 0002 0006
        DECLE   $000C,  $0000,  $0003,  $0005   ; 5DB9   000C 0000 0003 0005
        DECLE   $0006,  $0003,  $0001,  $000A   ; 5DBD   0006 0003 0001 000A
        DECLE   $0015,  $0013,  $0025,  $0023   ; 5DC1   0015 0013 0025 0023
        DECLE   $0004,  $0006,  $0004,  $0008   ; 5DC5   0004 0006 0004 0008
        DECLE   $0008,  $0018,  $0003,  $0005   ; 5DC9   0008 0018 0003 0005
        DECLE   $0006,  $0003,  $0001,  $001A   ; 5DCD   0006 0003 0001 001A
        DECLE   $003D,  $003F,  $003D,  $001B   ; 5DD1   003D 003F 003D 001B
        DECLE   $0004,  $0006,  $0004,  $0008   ; 5DD5   0004 0006 0004 0008
        DECLE   $0008,  $0018,  $0003,  $0005   ; 5DD9   0008 0018 0003 0005
        DECLE   $0006,  $0003,  $0001,  $000E   ; 5DDD   0006 0003 0001 000E
        DECLE   $001F,  $001F,  $0037,  $0027   ; 5DE1   001F 001F 0037 0027
        DECLE   $0007,  $0007,  $0007,  $000F   ; 5DE5   0007 0007 0007 000F
        DECLE   $000F,  $001F,  $0003,  $0005   ; 5DE9   000F 001F 0003 0005
        DECLE   $0006,  $0003,  $0001,  $0036   ; 5DED   0006 0003 0001 0036
        DECLE   $007B,  $007F,  $007B,  $0037   ; 5DF1   007B 007F 007B 0037
        DECLE   $0007,  $0007,  $0007,  $000F   ; 5DF5   0007 0007 0007 000F
        DECLE   $000F,  $001F,  $0010,  $0038   ; 5DF9   000F 001F 0010 0038
        DECLE   $0038,  $0010,  $0038,  $007C   ; 5DFD   0038 0010 0038 007C
        DECLE   $00FE,  $00BA,  $00BA,  $0038   ; 5E01   00FE 00BA 00BA 0038
        DECLE   $0038,  $0028,  $0028,  $0028   ; 5E05   0038 0028 0028 0028
        DECLE   $006C,  $0000,  $0003,  $0007   ; 5E09   006C 0000 0003 0007
        DECLE   $0007,  $0003,  $001F,  $003F   ; 5E0D   0007 0003 001F 003F

        RRC     R3,     2                       ; 5E11   0077
        ADDR    R4,     R7                      ; 5E12   00E7
        ADDR    R1,     R7                      ; 5E13   00CF

        SAR     R3,     2                       ; 5E14   006F
        INCR    R7                              ; 5E15   000F

        INCR    R6                              ; 5E16   000E
L_5E17:
        INCR    R6                              ; 5E17   000E
        INCR    R6                              ; 5E18   000E
        CLRC                                    ; 5E19   0006
        COMR    R6                              ; 5E1A   001E
        DECR    R0                              ; 5E1B   0010
        RSWD    R0                              ; 5E1C   0038
        RSWD    R0                              ; 5E1D   0038
        DECR    R0                              ; 5E1E   0010
        RSWD    R0                              ; 5E1F   0038
        RRC     R2,     2                       ; 5E20   0076
        ADDR    R5,     R7                      ; 5E21   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5E22   00BF 00AF 0036 0038
        DECLE   $0028,  $0028,  $0028,  $006C   ; 5E26   0028 0028 0028 006C
        DECLE   $0000,  $0003,  $0007,  $0007   ; 5E2A   0000 0003 0007 0007
        DECLE   $0003,  $003B,  $007D,  $00FE   ; 5E2E   0003 003B 007D 00FE
        DECLE   $00EE,  $00FE,  $007D,  $003B   ; 5E32   00EE 00FE 007D 003B
        DECLE   $000E,  $000E,  $000E,  $0006   ; 5E36   000E 000E 000E 0006
        DECLE   $001E,  $0010,  $0028,  $0028   ; 5E3A   001E 0010 0028 0028
        DECLE   $0010,  $0038,  $007C,  $00FE   ; 5E3E   0010 0038 007C 00FE
        DECLE   $00BA,  $00BA,  $0038,  $0038   ; 5E42   00BA 00BA 0038 0038
        DECLE   $0038,  $007C,  $007C,  $00FE   ; 5E46   0038 007C 007C 00FE
        DECLE   $0000,  $0003,  $0006,  $0004   ; 5E4A   0000 0003 0006 0004

        EIS                                     ; 5E4E   0002
        INCR    R7                              ; 5E4F   000F

        DECLE   $003F                           ; 5E50   003F
L_5E51:
        RRC     R3,     2                       ; 5E51   0077
        ADDR    R5,     R7                      ; 5E52   00EF
        ADDR    R1,     R7                      ; 5E53   00CF

        DECLE   $006F,  $000F,  $001F,  $001F   ; 5E54   006F 000F 001F 001F
        DECLE   $003F,  $003F                   ; 5E58   003F 003F

        SARC    R3,     2                       ; 5E5A   007F
        DECR    R0                              ; 5E5B   0010
        ADCR    R0                              ; 5E5C   0028
        ADCR    R0                              ; 5E5D   0028
        DECR    R0                              ; 5E5E   0010
        RSWD    R0                              ; 5E5F   0038
        RRC     R2,     2                       ; 5E60   0076
        ADDR    R5,     R7                      ; 5E61   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5E62   00BF 00AF 0036 0038
        DECLE   $0038,  $007C,  $007C,  $00FE   ; 5E66   0038 007C 007C 00FE
        DECLE   $0000,  $0003,  $0006,  $0004   ; 5E6A   0000 0003 0006 0004
        DECLE   $0002,  $003B,  $007D,  $00EE   ; 5E6E   0002 003B 007D 00EE
        DECLE   $00D6,  $00EE,  $007D,  $003B   ; 5E72   00D6 00EE 007D 003B
        DECLE   $000F,  $000F,  $001F,  $001F   ; 5E76   000F 000F 001F 001F
        DECLE   $003F,  $0004,  $0003,  $0005   ; 5E7A   003F 0004 0003 0005

        SETC                                    ; 5E7E   0007
        EIS                                     ; 5E7F   0002
        INCR    R7                              ; 5E80   000F

        DECLE   $003F                           ; 5E81   003F
L_5E82:
        RRC     R3,     2                       ; 5E82   0077
        ADDR    R1,     R7                      ; 5E83   00CF

        SLR     R3,     2                       ; 5E84   0067
        INCR    R7                              ; 5E85   000F
        INCR    R7                              ; 5E86   000F

L_5E87:
        INCR    R6                              ; 5E87   000E
L_5E88:
        INCR    R6                              ; 5E88   000E
        CLRC                                    ; 5E89   0006
        COMR    R6                              ; 5E8A   001E
        DECR    R0                              ; 5E8B   0010
        RSWD    R0                              ; 5E8C   0038
        RSWD    R0                              ; 5E8D   0038
        DECR    R0                              ; 5E8E   0010
        RSWD    R0                              ; 5E8F   0038
        RRC     R2,     2                       ; 5E90   0076
        ADDR    R5,     R7                      ; 5E91   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5E92   00BF 00AF 0036 0038
        DECLE   $0028,  $0028,  $0028,  $006C   ; 5E96   0028 0028 0028 006C
        DECLE   $0000,  $0004,  $0003,  $0005   ; 5E9A   0000 0004 0003 0005

        SETC                                    ; 5E9E   0007
        EIS                                     ; 5E9F   0002
        RSWD    R3                              ; 5EA0   003B
        SARC    R1,     2                       ; 5EA1   007D
        ADDR    R5,     R6                      ; 5EA2   00EE
        ADDR    R5,     R6                      ; 5EA3   00EE
        SARC    R1,     2                       ; 5EA4   007D
        RSWD    R3                              ; 5EA5   003B
        INCR    R7                              ; 5EA6   000F

        INCR    R6                              ; 5EA7   000E
L_5EA8:
        INCR    R6                              ; 5EA8   000E
        DECLE   $0006,  $001E,  $00A5,  $00A5   ; 5EA9   0006 001E 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5EAD   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5EB1   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5EB5   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00AA,  $00AA   ; 5EB9   00FF 00A5 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EBD   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EC1   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EC5   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00FF,  $00AA   ; 5EC9   00FF 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5ECD   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5ED1   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5ED5   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5ED9   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EDD   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EE1   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5EE5   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5EE9   0000 0000 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5EED   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5EF1   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5EF9   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EFD   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5F01   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5F09   0000 0000 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5F0D   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5F19   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5F1D   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5F29   0000 0000 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0036   ; 5F49   0000 0000 001C 0036
        DECLE   $006B,  $00BF,  $00D7,  $0034   ; 5F4D   006B 00BF 00D7 0034
        DECLE   $006E,  $0038,  $001C,  $0034   ; 5F51   006E 0038 001C 0034
        DECLE   $0028,  $0018,  $0010,  $0008   ; 5F55   0028 0018 0010 0008
        DECLE   $0010,  $0000                   ; 5F59   0010 0000

        COMR    R4                              ; 5F5B   001C
        ADCR    R2                              ; 5F5C   002A
        SLL     R1,     2                       ; 5F5D   004D
        ADDR    R7,     R3                      ; 5F5E   00FB
        MOVR    R5,     R7                      ; 5F5F   00AF

        DECLE   $0056,  $007A,  $001C,  $002C   ; 5F60   0056 007A 001C 002C
        DECLE   $0014,  $0028,  $0018,  $0008   ; 5F64   0014 0028 0018 0008
        DECLE   $0010,  $0008,  $0000,  $0008   ; 5F68   0010 0008 0000 0008
        DECLE   $0014,  $0010,  $0038,  $007C   ; 5F6C   0014 0010 0038 007C
        DECLE   $007C,  $007C,  $0038,  $0000   ; 5F70   007C 007C 0038 0000
        DECLE   $00FE,  $00FE,  $00FE,  $0005   ; 5F74   00FE 00FE 00FE 0005
        DECLE   $0009,  $0012,  $000C,  $0082   ; 5F78   0009 0012 000C 0082
        DECLE   $007C,  $0054,  $006C,  $0054   ; 5F7C   007C 0054 006C 0054
        DECLE   $007C,  $007C,  $0082,  $0000   ; 5F80   007C 007C 0082 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0024,  $003C   ; 5F88   0000 0000 0024 003C
        DECLE   $0024,  $003C,  $0024,  $003C   ; 5F8C   0024 003C 0024 003C
        DECLE   $007E,  $007E,  $003C,  $0000   ; 5F90   007E 007E 003C 0000
        DECLE   $0042,  $0042,  $007E,  $0042   ; 5F94   0042 0042 007E 0042
        DECLE   $007E,  $0042,  $007E,  $0042   ; 5F98   007E 0042 007E 0042
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 5F9C   007E 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $006E   ; 5FA0   00FF 007E 003C 006E
        DECLE   $0077,  $003F,  $005F,  $00EE   ; 5FA4   0077 003F 005F 00EE
        DECLE   $00F0,  $007C,  $0038,  $0000   ; 5FA8   00F0 007C 0038 0000
        DECLE   $0010,  $0038,  $007C,  $007C   ; 5FAC   0010 0038 007C 007C
        DECLE   $00EE,  $00C6,  $0044,  $0000   ; 5FB0   00EE 00C6 0044 0000
        DECLE   $0070,  $0018,  $000C,  $002C   ; 5FB4   0070 0018 000C 002C
        DECLE   $001E,  $000E,  $0004,  $00C6   ; 5FB8   001E 000E 0004 00C6
        DECLE   $00FE,  $00FE,  $007C,  $007C   ; 5FBC   00FE 00FE 007C 007C
        DECLE   $00FE,  $007C,  $0038,  $003C   ; 5FC0   00FE 007C 0038 003C
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 5FC4   007E 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 5FC8   00FF 007E 003C 0000
        DECLE   $007C,  $007C,  $007C,  $007C   ; 5FCC   007C 007C 007C 007C
        DECLE   $0038,  $0038,  $0010,  $0008   ; 5FD0   0038 0038 0010 0008
        DECLE   $0010,  $0020,  $0020,  $0020   ; 5FD4   0010 0020 0020 0020
        DECLE   $0020,  $0010,  $0008,  $0010   ; 5FD8   0020 0010 0008 0010
        DECLE   $0020,  $0040,  $007E,  $007E   ; 5FDC   0020 0040 007E 007E
        DECLE   $0040,  $0020,  $0010,  $0000   ; 5FE0   0040 0020 0010 0000
        DECLE   $0020,  $0070,  $00F8,  $006C   ; 5FE4   0020 0070 00F8 006C
        DECLE   $0026,  $0003,  $0001,  $0000   ; 5FE8   0026 0003 0001 0000
        DECLE   $0000,  $0030,  $0030,  $0008   ; 5FEC   0000 0030 0030 0008
        DECLE   $0004,  $0002,  $0001,  $00C0   ; 5FF0   0004 0002 0001 00C0
        DECLE   $00C0,  $0020,  $0010,  $0008   ; 5FF4   00C0 0020 0010 0008
        DECLE   $0004,  $0002,  $0001,  $0000   ; 5FF8   0004 0002 0001 0000
        DECLE   $0000,  $0000,  $0010,  $0008   ; 5FFC   0000 0000 0010 0008
        DECLE   $0005,  $0002,  $0005,  $0000   ; 6000   0005 0002 0005 0000
        DECLE   $0000,  $00FC,  $00FE,  $00BF   ; 6004   0000 00FC 00FE 00BF
        DECLE   $00FF,  $007F,  $003F,  $0000   ; 6008   00FF 007F 003F 0000
        DECLE   $001E,  $0036                   ; 600C   001E 0036

        SARC    R3,     2                       ; 600E   007F
        ADDR    R7,     R5                      ; 600F   00FD
        ADDR    R7,     R1                      ; 6010   00F9
        ADDR    R6,     R2                      ; 6011   00F2
        INCR    R4                              ; 6012   000C
        ADDR    R7,     R0                      ; 6013   00F8
        SARC    R0,     2                       ; 6014   007C
        MOVR    R7,     R6                      ; 6015   00BE
        ADDR    R3,     R7                      ; 6016   00DF

        DECLE   $00A0,  $00FF,  $007F,  $003F   ; 6017   00A0 00FF 007F 003F
        DECLE   $000C,  $000E,  $0077,  $00FB   ; 601B   000C 000E 0077 00FB
        DECLE   $00FC,  $00FC,  $00FC,  $0078   ; 601F   00FC 00FC 00FC 0078
        DECLE   $000C,  $0042,  $00A1,  $0081   ; 6023   000C 0042 00A1 0081
        DECLE   $0081,  $0042,  $003C,  $003C   ; 6027   0081 0042 003C 003C
        DECLE   $0000,  $0008,  $000C,  $0036   ; 602B   0000 0008 000C 0036
        DECLE   $007A,  $007C,  $007C,  $0038   ; 602F   007A 007C 007C 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6033   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $007E   ; 6037   0000 003C 007E 007E
        DECLE   $0030,  $0048,  $0088,  $0084   ; 603B   0030 0048 0088 0084
        DECLE   $0042,  $0021,  $0019,  $0006   ; 603F   0042 0021 0019 0006
        DECLE   $0044,  $007C,  $007C,  $0038   ; 6043   0044 007C 007C 0038
        DECLE   $0010,  $0010,  $0038,  $007C   ; 6047   0010 0010 0038 007C
        DECLE   $0010,  $0038,  $0010,  $0010   ; 604B   0010 0038 0010 0010
        DECLE   $00BA,  $00FE,  $0054,  $00FE   ; 604F   00BA 00FE 0054 00FE
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6053   0000 0000 0000 0008
        DECLE   $009D,  $007F,  $003E,  $001C   ; 6057   009D 007F 003E 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 605B   0000 0000 0000 0000
        DECLE   $0010,  $0028,  $0054,  $00AA   ; 605F   0010 0028 0054 00AA
        DECLE   $0000,  $0000,  $0010,  $0038   ; 6063   0000 0000 0010 0038
        DECLE   $0010,  $0038,  $007C,  $0038   ; 6067   0010 0038 007C 0038
        DECLE   $0000,  $0000,  $0038,  $0010   ; 606B   0000 0000 0038 0010
        DECLE   $0038,  $007C,  $007C,  $0038   ; 606F   0038 007C 007C 0038
        DECLE   $0010,  $0028,  $004C,  $0072   ; 6073   0010 0028 004C 0072
        DECLE   $0074,  $003A,  $001C,  $0008   ; 6077   0074 003A 001C 0008
        DECLE   $0010,  $0028,  $0044,  $0062   ; 607B   0010 0028 0044 0062
        DECLE   $0074,  $003A,  $001C,  $0008   ; 607F   0074 003A 001C 0008
        DECLE   $0010,  $0038,  $007C,  $007E   ; 6083   0010 0038 007C 007E
        DECLE   $007C,  $003A,  $001C,  $0008   ; 6087   007C 003A 001C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 608B   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $007A,  $0024   ; 608F   0000 0004 007A 0024
        DECLE   $0004,  $0008,  $001D,  $003E   ; 6093   0004 0008 001D 003E
        DECLE   $007C,  $00B8,  $0010,  $0020   ; 6097   007C 00B8 0010 0020
        DECLE   $0010,  $0038,  $006C,  $0076   ; 609B   0010 0038 006C 0076
        DECLE   $007C,  $003A,  $001C,  $0008   ; 609F   007C 003A 001C 0008
        DECLE   $0000,  $00C0,  $0078,  $001E   ; 60A3   0000 00C0 0078 001E
        DECLE   $0007,  $0002,  $0000,  $0000   ; 60A7   0007 0002 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0038   ; 60AB   0000 0000 0060 0038
        DECLE   $000E,  $0004,  $0000,  $0000   ; 60AF   000E 0004 0000 0000
        DECLE   $0004,  $0072,  $009A,  $003E   ; 60B3   0004 0072 009A 003E
        DECLE   $007C,  $0059,  $004E,  $0020   ; 60B7   007C 0059 004E 0020
        DECLE   $0000,  $0024,  $0052,  $001C   ; 60BB   0000 0024 0052 001C
        DECLE   $0038,  $004A,  $0024,  $0000   ; 60BF   0038 004A 0024 0000
        DECLE   $0000,  $0000,  $0010,  $0028   ; 60C3   0000 0000 0010 0028
        DECLE   $0010,  $0000,  $0000,  $0000   ; 60C7   0010 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0028   ; 60CB   0000 0010 0038 0028
        DECLE   $0038,  $0010,  $0000,  $0000   ; 60CF   0038 0010 0000 0000

        NEGR    R0                              ; 60D3   0020
        RLC     R0,     1                       ; 60D4   0050
        MOVR    R5,     R0                      ; 60D5   00A8
        RLC     R0,     2                       ; 60D6   0054
        MOVR    R5,     R6                      ; 60D7   00AE
        ADDR    R3,     R7                      ; 60D8   00DF

        DECLE   $00E0,  $00BF,  $00FF,  $007F   ; 60D9   00E0 00BF 00FF 007F
        DECLE   $003F,  $001F,  $0000,  $0000   ; 60DD   003F 001F 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; 60E1   0000 0000 0018 0024
        DECLE   $005A,  $00B5,  $00BD,  $005A   ; 60E5   005A 00B5 00BD 005A
        DECLE   $0024,  $0018,  $0000,  $0000   ; 60E9   0024 0018 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 60ED   0000 0000 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60F1   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $006C,  $007C   ; 60F5   0000 0038 006C 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60F9   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $003C,  $003C   ; 60FD   0018 003C 003C 003C
        DECLE   $0000,  $0000                   ; 6101   0000 0000
L_6103:
        PSHR    R5                              ; 6103   0275
        MVI     G_0138, R1                      ; 6104   0281 0138
        SARC    R1,     2                       ; 6106   007D
        BOV     L_6345                          ; 6107   0202 023C

        MVII    #$032D, R1                      ; 6109   02B9 032D
        MVII    #$0161, R4                      ; 610B   02BC 0161
L_610D:
        MVI@    R4,     R3                      ; 610D   02A3
        DECR    R3                              ; 610E   0013
        BMI     L_619E                          ; 610F   020B 008D

        CMPI    #$00BF, R3                      ; 6111   037B 00BF
        BGT     L_61DE                          ; 6113   020E 00C9

        ADDI    #$0002, R1                      ; 6115   02F9 0002
        MOVR    R4,     R5                      ; 6117   00A5
        SUBI    #$0161, R5                      ; 6118   033D 0161
        ADDR    R5,     R5                      ; 611A   00ED
        ADD     G_018C, R5                      ; 611B   02C5 018C
        ADDR    R5,     R5                      ; 611D   00ED
        ADDR    R7,     R5                      ; 611E   00FD
        ADDI    #$00A6, R5                      ; 611F   02FD 00A6
        MVI@    R5,     R0                      ; 6121   02A8
        SWAP    R0,     1                       ; 6122   0040
        MVO@    R0,     R1                      ; 6123   0248
        INCR    R1                              ; 6124   0009
        MVI@    R5,     R0                      ; 6125   02A8
        SWAP    R0,     1                       ; 6126   0040
        MVO@    R0,     R1                      ; 6127   0248
        INCR    R1                              ; 6128   0009
        CLRR    R0                              ; 6129   01C0
        MVO@    R0,     R1                      ; 612A   0248
        INCR    R1                              ; 612B   0009
        PSHR    R3                              ; 612C   0273
        SLL     R3,     1                       ; 612D   004B
        SDBD                                    ; 612E   0001
        ADDI    #$5A2A, R3                      ; 612F   02FB 002A 005A
        MVI@    R3,     R3                      ; 6132   029B
        MOVR    R3,     R0                      ; 6133   0098
        ANDI    #$0007, R0                      ; 6134   03B8 0007
        XORR    R0,     R3                      ; 6136   01C3
        SLL     R3,     1                       ; 6137   004B
        ADDR    R3,     R0                      ; 6138   00D8
        ANDI    #$001F, R0                      ; 6139   03B8 001F
        MOVR    R3,     R2                      ; 613B   009A
        SWAP    R2,     1                       ; 613C   0042
        ANDI    #$0007, R2                      ; 613D   03BA 0007
        SLR     R3,     2                       ; 613F   0067
        SLR     R3,     2                       ; 6140   0067
        SLR     R3,     1                       ; 6141   0063
        ANDI    #$0007, R3                      ; 6142   03BB 0007
        INCR    R1                              ; 6144   0009
        CLRR    R5                              ; 6145   01ED
        MVO@    R5,     R1                      ; 6146   024D
        SDBD                                    ; 6147   0001
        ADDI    #$1000, R0                      ; 6148   02F8 0000 0010
        MVI     G_0135, R5                      ; 614B   0285 0135
        ANDI    #$0004, R5                      ; 614D   03BD 0004
        BNEQ    L_6153                          ; 614F   020C 0002

        XORI    #$0020, R0                      ; 6151   03F8 0020
L_6153:
        MOVR    R2,     R5                      ; 6153   0095
        SLL     R2,     2                       ; 6154   004E
        SLL     R2,     1                       ; 6155   004A
        SUBR    R5,     R2                      ; 6156   012A
        SDBD                                    ; 6157   0001
        ADDI    #$5CB7, R2                      ; 6158   02FA 00B7 005C
        SUBI    #$0006, R1                      ; 615B   0339 0006
        MOVR    R3,     R5                      ; 615D   009D
        PULR    R3                              ; 615E   02B3
        CMPI    #$00B4, R3                      ; 615F   037B 00B4
        BNEQ    L_6165                          ; 6161   020C 0002

        XORI    #$0040, R0                      ; 6163   03F8 0040
L_6165:
        CMPI    #$00B1, R3                      ; 6165   037B 00B1
        BLT     L_616F                          ; 6167   0205 0006

        CMPI    #$00B3, R3                      ; 6169   037B 00B3
        BGT     L_616F                          ; 616B   020E 0002

        SUBI    #$0007, R2                      ; 616D   033A 0007
L_616F:
        CMPI    #$0002, R3                      ; 616F   037B 0002
        BNEQ    L_6196                          ; 6171   020C 0023

        ADDI    #$0003, R1                      ; 6173   02F9 0003
        MVI@    R1,     R3                      ; 6175   028B
        SDBD                                    ; 6176   0001
        SUBI    #$0400, R3                      ; 6177   033B 0000 0004
        MVO@    R3,     R1                      ; 617A   024B
        SWAP    R3,     1                       ; 617B   0043
        CMPI    #$0036, R3                      ; 617C   037B 0036
        BGT     L_6182                          ; 617E   020E 0002

        MVII    #$0001, R5                      ; 6180   02BD 0001
L_6182:
        XORI    #$0040, R0                      ; 6182   03F8 0040
        CMPI    #$0050, R3                      ; 6184   037B 0050
        BLT     L_6194                          ; 6186   0205 000C

        SDBD                                    ; 6188   0001
        XORI    #$2080, R0                      ; 6189   03F8 0080 0020
        DECR    R1                              ; 618C   0011
        MVI@    R1,     R3                      ; 618D   028B
        SDBD                                    ; 618E   0001
        SUBI    #$0400, R3                      ; 618F   033B 0000 0004
        MVO@    R3,     R1                      ; 6192   024B
        INCR    R1                              ; 6193   0009
L_6194:
        SUBI    #$0003, R1                      ; 6194   0339 0003
L_6196:
        MVO@    R0,     R1                      ; 6196   0248
        INCR    R1                              ; 6197   0009
        MVO@    R2,     R1                      ; 6198   024A
        ADDI    #$0004, R1                      ; 6199   02F9 0004
        MVO@    R5,     R1                      ; 619B   024D
        ADDI    #$0003, R1                      ; 619C   02F9 0003
L_619E:
        CMPI    #$0355, R1                      ; 619E   0379 0355
        BGT     L_61C3                          ; 61A0   020E 0021

        SUBI    #$0161, R4                      ; 61A2   033C 0161
        ADDR    R7,     R4                      ; 61A4   00FC
        ADDI    #$0034, R4                      ; 61A5   02FC 0034
        MVI@    R4,     R4                      ; 61A7   02A4
        CMPI    #$0164, R4                      ; 61A8   037C 0164
        BLE     L_610D                          ; 61AA   0226 009E

        SDBD                                    ; 61AC   0001
        MVII    #$5C7C, R2                      ; 61AD   02BA 007C 005C
        MVII    #$0060, R3                      ; 61B0   02BB 0060
L_61B2:
        MVII    #$0008, R0                      ; 61B2   02B8 0008
        MVO@    R3,     R1                      ; 61B4   024B
        INCR    R1                              ; 61B5   0009
        MVO@    R2,     R1                      ; 61B6   024A
        ADDI    #$0004, R1                      ; 61B7   02F9 0004
        MVO@    R0,     R1                      ; 61B9   0248
        INCR    R1                              ; 61BA   0009
        CLRR    R0                              ; 61BB   01C0
        MVO@    R0,     R1                      ; 61BC   0248
        ADDI    #$0002, R1                      ; 61BD   02F9 0002
        CMPI    #$0355, R1                      ; 61BF   0379 0355
        BLE     L_61B2                          ; 61C1   0226 0010
L_61C3:
        B       L_6346                          ; 61C3   0200 0181

        DECLE   $0054,  $0054,  $0054,  $004A   ; 61C5   0054 0054 0054 004A
        DECLE   $0054,  $0040,  $0054,  $003A   ; 61C9   0054 0040 0054 003A
        DECLE   $0054,  $0036,  $0000           ; 61CD   0054 0036 0000

        NOP                                     ; 61D0   0034
        MOVR    R3,     R0                      ; 61D1   0098
        SWAP    R0,     1                       ; 61D2   0040
        MOVR    R0,     R4                      ; 61D3   0084
        RSWD    R2                              ; 61D4   003A
        DECR    R0                              ; 61D5   0010
        SWAP    R0,     1                       ; 61D6   0040
        NEGR    R4                              ; 61D7   0024
        RSWD    R2                              ; 61D8   003A
        CMPR    R4,     R2                      ; 61D9   0162
        CMPR    R4,     R0                      ; 61DA   0160
        CMPR    R4,     R3                      ; 61DB   0163
        CMPR    R4,     R4                      ; 61DC   0164
        CMPR    R4,     R5                      ; 61DD   0165
L_61DE:
        SUBI    #$00C0, R3                      ; 61DE   033B 00C0
        CMPI    #$0033, R3                      ; 61E0   037B 0033
        BGE     L_61EA                          ; 61E2   020D 0006

        MVI     G_0135, R5                      ; 61E4   0285 0135
        ANDI    #$0002, R5                      ; 61E6   03BD 0002
        BNEQ    L_619E                          ; 61E8   022C 004B

L_61EA:
        MOVR    R4,     R5                      ; 61EA   00A5
        SUBI    #$0161, R5                      ; 61EB   033D 0161
        ADDR    R5,     R5                      ; 61ED   00ED
        ADD     G_018C, R5                      ; 61EE   02C5 018C
        BEQ     L_619E                          ; 61F0   0224 0053

        ADDR    R5,     R5                      ; 61F2   00ED
        SLL     R3,     2                       ; 61F3   004F
        SDBD                                    ; 61F4   0001
        ADDI    #$5B9F, R3                      ; 61F5   02FB 009F 005B
        MVI@    R3,     R0                      ; 61F8   0298
        ANDI    #$0010, R0                      ; 61F9   03B8 0010
        DECR    R3                              ; 61FB   0013
        MVI@    R3,     R2                      ; 61FC   029A
        ANDI    #$0007, R2                      ; 61FD   03BA 0007
        XORR    R2,     R0                      ; 61FF   01D0
        SDBD                                    ; 6200   0001
        ADDI    #$1040, R0                      ; 6201   02F8 0040 0010
        DECR    R3                              ; 6204   0013
        MVI@    R3,     R2                      ; 6205   029A
        ANDI    #$0007, R2                      ; 6206   03BA 0007
        SLL     R2,     1                       ; 6208   004A
        ADDR    R2,     R5                      ; 6209   00D5
        SLL     R2,     2                       ; 620A   004E
        SLL     R2,     1                       ; 620B   004A
        ADDR    R2,     R5                      ; 620C   00D5
        SDBD                                    ; 620D   0001
        ADDI    #$62BB, R5                      ; 620E   02FD 00BB 0062
        PSHR    R5                              ; 6211   0275
        SLR     R2,     2                       ; 6212   0066
        SLR     R2,     1                       ; 6213   0062
        MOVR    R2,     R5                      ; 6214   0095
        SDBD                                    ; 6215   0001
        ADDI    #$62D3, R5                      ; 6216   02FD 00D3 0062
        SDBD                                    ; 6219   0001
        MVI@    R5,     R2                      ; 621A   02AA
        PSHR    R0                              ; 621B   0270
        CLRR    R0                              ; 621C   01C0
        MVI     G_0135, R5                      ; 621D   0285 0135
        ANDI    #$0004, R5                      ; 621F   03BD 0004
        BNEQ    L_6242                          ; 6221   020C 001F

        MOVR    R4,     R5                      ; 6223   00A5
        SUBI    #$0162, R5                      ; 6224   033D 0162
        BMI     L_6242                          ; 6226   020B 001A

        ADDR    R5,     R5                      ; 6228   00ED
        ADD     G_018C, R5                      ; 6229   02C5 018C
        INCR    R5                              ; 622B   000D
        ADDR    R7,     R5                      ; 622C   00FD
        ADD@    R5,     R7                      ; 622D   02EF

        ADCR    R3                              ; 622E   002B
        NEGR    R1                              ; 622F   0021
        NEGR    R5                              ; 6230   0025
        DECR    R2                              ; 6231   0012
        COMR    R3                              ; 6232   001B
L_6233:
        DECR    R7                              ; 6233   0017

        INCR    R4                              ; 6234   000C
        INCR    R0                              ; 6235   0008
        MVI     G_0187, R0                      ; 6236   0280 0187
        B       L_623C                          ; 6238   0200 0002

        MVI     G_0186, R0                      ; 623A   0280 0186
L_623C:
        ANDI    #$00C3, R0                      ; 623C   03B8 00C3
L_623E:
        BEQ     L_6242                          ; 623E   0204 0002

L_6240:
        MVII    #$0020, R0                      ; 6240   02B8 0020
L_6242:
        XOR@    R6,     R0                      ; 6242   03F0
        B       L_626A                          ; 6243   0200 0025

        MVI     G_0130, R0                      ; 6245   0280 0130
        B       L_624B                          ; 6247   0200 0002

        MVI     G_012E, R0                      ; 6249   0280 012E
L_624B:
        ANDI    #$00C3, R0                      ; 624B   03B8 00C3
        B       L_623E                          ; 624D   0220 0010

        MVI     G_012F, R0                      ; 624F   0280 012F
        B       L_6266                          ; 6251   0200 0013

        MVI     G_012F, R0                      ; 6253   0280 012F
        ANDI    #$0003, R0                      ; 6255   03B8 0003
        BNEQ    L_6240                          ; 6257   022C 0018

        MVI     G_012D, R0                      ; 6259   0280 012D
        MVI@    R3,     R5                      ; 625B   029D
        ANDI    #$0007, R5                      ; 625C   03BD 0007
        CMPI    #$0006, R5                      ; 625E   037D 0006
        BNEQ    L_6266                          ; 6260   020C 0004

        ANDI    #$0002, R0                      ; 6262   03B8 0002
        XORI    #$0002, R0                      ; 6264   03F8 0002
L_6266:
        ANDI    #$0003, R0                      ; 6266   03B8 0003
        B       L_623E                          ; 6268   0220 002B

L_626A:
        PULR    R5                              ; 626A   02B5
        CMPI    #$0355, R1                      ; 626B   0379 0355
        BGE     L_619E                          ; 626D   022D 00D0

        PSHR    R4                              ; 626F   0274
        MOVR    R1,     R4                      ; 6270   008C
        ADDI    #$0008, R4                      ; 6271   02FC 0008
        PSHR    R0                              ; 6273   0270
        MVI@    R5,     R0                      ; 6274   02A8
        ANDI    #$0007, R0                      ; 6275   03B8 0007
        SARC    R0,     1                       ; 6277   0078
        BNC     L_627C                          ; 6278   0209 0002

        XORI    #$0040, R0                      ; 627A   03F8 0040
L_627C:
        SWAP    R0,     1                       ; 627C   0040
        SLR     R0,     1                       ; 627D   0060
        ADD@    R6,     R0                      ; 627E   02F0
        MVO@    R0,     R1                      ; 627F   0248
        INCR    R1                              ; 6280   0009
        XORI    #$0200, R0                      ; 6281   03F8 0200
        MVO@    R0,     R4                      ; 6283   0260
        MVO@    R2,     R1                      ; 6284   024A
        INCR    R1                              ; 6285   0009
        MVO@    R2,     R4                      ; 6286   0262
        DECR    R3                              ; 6287   0013
        MVI@    R3,     R3                      ; 6288   029B
        MOVR    R3,     R2                      ; 6289   009A
        ANDI    #$000F, R3                      ; 628A   03BB 000F
        SLR     R2,     2                       ; 628C   0066
        SLR     R2,     2                       ; 628D   0066
        ANDI    #$000F, R2                      ; 628E   03BA 000F
        DECR    R5                              ; 6290   0015
        MVI@    R5,     R0                      ; 6291   02A8
        SAR     R0,     2                       ; 6292   006C
        SAR     R0,     1                       ; 6293   0068
        SARC    R0,     1                       ; 6294   0078
        SLL     R0,     1                       ; 6295   0048
        RLC     R0,     1                       ; 6296   0050
        SWAP    R0,     1                       ; 6297   0040
        MVO@    R0,     R1                      ; 6298   0248
        INCR    R1                              ; 6299   0009
        PSHR    R0                              ; 629A   0270
        MVI@    R5,     R0                      ; 629B   02A8
        ANDI    #$001F, R0                      ; 629C   03B8 001F
        SWAP    R0,     1                       ; 629E   0040
        BNEQ    L_62A9                          ; 629F   020C 0008

        MVO@    R0,     R4                      ; 62A1   0260
        PULR    R0                              ; 62A2   02B0
        SUBI    #$0008, R4                      ; 62A3   033C 0008
        DECR    R3                              ; 62A5   0013
        MOVR    R3,     R2                      ; 62A6   009A
        B       L_62AB                          ; 62A7   0200 0002

L_62A9:
        ADD@    R6,     R0                      ; 62A9   02F0
        MVO@    R0,     R4                      ; 62AA   0260
L_62AB:
        DECR    R5                              ; 62AB   0015
        MVI@    R5,     R0                      ; 62AC   02A8
        ANDI    #$03E0, R0                      ; 62AD   03B8 03E0
        SLL     R0,     2                       ; 62AF   004C
        SLL     R0,     2                       ; 62B0   004C
        MVO@    R0,     R4                      ; 62B1   0260
        MVO@    R0,     R1                      ; 62B2   0248
        INCR    R1                              ; 62B3   0009
        CLRR    R0                              ; 62B4   01C0
        MVO@    R0,     R4                      ; 62B5   0260
        MVO@    R0,     R1                      ; 62B6   0248
        INCR    R1                              ; 62B7   0009
        MVO@    R3,     R4                      ; 62B8   0263
        MOVR    R1,     R3                      ; 62B9   008B
        MVI@    R3,     R5                      ; 62BA   029D
        MVO@    R2,     R1                      ; 62BB   024A
        INCR    R1                              ; 62BC   0009
        MVI@    R1,     R0                      ; 62BD   0288
        TSTR    R0                              ; 62BE   0080
        BNEQ    L_62C3                          ; 62BF   020C 0002

        MVII    #$001E, R0                      ; 62C1   02B8 001E
L_62C3:
        MVO@    R0,     R4                      ; 62C3   0260
        MVO@    R0,     R1                      ; 62C4   0248
        INCR    R4                              ; 62C5   000C
        PSHR    R4                              ; 62C6   0274
        CMPI    #$033D, R4                      ; 62C7   037C 033D
        BNEQ    L_62D3                          ; 62C9   020C 0008

        CMP@    R3,     R5                      ; 62CB   035D
        BEQ     L_62D3                          ; 62CC   0204 0005

        MVII    #$0002, R0                      ; 62CE   02B8 0002

        JSR     R5,     .EXEC.41C               ; 62D0   0004 0114 001C

L_62D3:
        PULR    R1                              ; 62D3   02B1
        PULR    R4                              ; 62D4   02B4
        B       L_619E                          ; 62D5   0220 0138
        ADDR    R5,     R7                      ; 62D7   00EF

        SLLC    R0,     2                       ; 62D8   005C
        ADDR    R7,     R5                      ; 62D9   00FD
        SLLC    R0,     2                       ; 62DA   005C
        ADDR    R7,     R5                      ; 62DB   00FD
        SLLC    R0,     2                       ; 62DC   005C
        ADDR    R6,     R6                      ; 62DD   00F6
        SLLC    R0,     2                       ; 62DE   005C

        JSRE    R4,     L_5D23                  ; 62DF   0004 005D 0123
        DECLE   $03F0,  $0123,  $0350,  $0140   ; 62E2   03F0 0123 0350 0140
        DECLE   $0368,  $0140,  $0328,  $0000   ; 62E6   0368 0140 0328 0000
        DECLE   $0320,  $0233                   ; 62EA   0320 0233

        CMP@    R2,     R0                      ; 62EC   0350
        B       L_6657                          ; 62ED   0200 0368

        DECLE   $0013,  $0350,  $0080,  $0368   ; 62EF   0013 0350 0080 0368
        DECLE   $0144,  $02E8,  $0144,  $0248   ; 62F3   0144 02E8 0144 0248
        DECLE   $0152,  $02E0,  $0152,  $02C0   ; 62F7   0152 02E0 0152 02C0
        DECLE   $0002,  $02C0,  $0254,  $0248   ; 62FB   0002 02C0 0254 0248
        DECLE   $0212,  $02E0,  $0034,  $0248   ; 62FF   0212 02E0 0034 0248
        DECLE   $0072,  $02E0,  $0142,  $03E7   ; 6303   0072 02E0 0142 03E7
        DECLE   $0142,  $0347,  $0150,  $0360   ; 6307   0142 0347 0150 0360
        DECLE   $0150,  $0320,  $0000,  $0320   ; 630B   0150 0320 0000 0320
        DECLE   $0252,  $0347,  $0210,  $0360   ; 630F   0252 0347 0210 0360
        DECLE   $0032,  $0347,  $0070,  $0360   ; 6313   0032 0347 0070 0360
        DECLE   $0142,  $03E7,  $0142,  $0347   ; 6317   0142 03E7 0142 0347
        DECLE   $0148,  $0366,  $0148,  $0326   ; 631B   0148 0366 0148 0326
        DECLE   $0000,  $0320,  $0252,  $0347   ; 631F   0000 0320 0252 0347
        DECLE   $0208,  $0366,  $0032,  $0347   ; 6323   0208 0366 0032 0347
        DECLE   $0088,  $0366,  $0000,  $0000   ; 6327   0088 0366 0000 0000
        DECLE   $0127,  $0210,  $0000,  $0000   ; 632B   0127 0210 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 632F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6333   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6337   0000 0000 0000 0000
L_633B:
        DECR    R1                              ; 633B   0011
L_633C:
        SLL     R1,     1                       ; 633C   0049
        SDBD                                    ; 633D   0001
        ADDI    #$5A2B, R1                      ; 633E   02F9 002B 005A
        MVI@    R1,     R2                      ; 6341   028A
        SLR     R2,     2                       ; 6342   0066
        SLR     R2,     2                       ; 6343   0066
        MOVR    R5,     R7                      ; 6344   00AF

L_6345:
        PSHR    R5                              ; 6345   0275
L_6346:
        CLRR    R2                              ; 6346   01D2
        MVI     G_0175, R1                      ; 6347   0281 0175
        CMPI    #$0082, R1                      ; 6349   0379 0082
        BLT     L_6357                          ; 634B   0205 000A

        CMPI    #$00A5, R1                      ; 634D   0379 00A5
        BGT     L_6357                          ; 634F   020E 0006

        JSR     R5,     L_633B                  ; 6351   0004 0160 033B

        SLL     R2,     1                       ; 6354   004A
        ADDI    #$0003, R2                      ; 6355   02FA 0003
L_6357:
        PSHR    R2                              ; 6357   0272
        CLRR    R2                              ; 6358   01D2
        MVI     G_0175, R1                      ; 6359   0281 0175
        CMPI    #$0028, R1                      ; 635B   0379 0028
        BLT     L_636B                          ; 635D   0205 000C

        CMPI    #$004B, R1                      ; 635F   0379 004B
        BGT     L_636B                          ; 6361   020E 0008

        JSR     R5,     L_633B                  ; 6363   0004 0160 033B

        MOVR    R2,     R3                      ; 6366   0093
        ADDR    R3,     R2                      ; 6367   00DA
        ADDR    R3,     R2                      ; 6368   00DA
        ADDI    #$0006, R2                      ; 6369   02FA 0006
L_636B:
        PSHR    R2                              ; 636B   0272
        CLRR    R0                              ; 636C   01C0
        MVI     G_0174, R1                      ; 636D   0281 0174
        CMPI    #$001C, R1                      ; 636F   0379 001C
        BLT     L_637B                          ; 6371   0205 0008

        CMPI    #$0027, R1                      ; 6373   0379 0027
        BGT     L_637B                          ; 6375   020E 0004

        JSR     R5,     L_633B                  ; 6377   0004 0160 033B

        MOVR    R2,     R0                      ; 637A   0090
L_637B:
        MVII    #$016B, R4                      ; 637B   02BC 016B
L_637D:
        MVI@    R4,     R1                      ; 637D   02A1
        DECR    R1                              ; 637E   0011
        BMI     L_6385                          ; 637F   020B 0004

        JSR     R5,     L_633C                  ; 6381   0004 0160 033C

        ADDR    R2,     R0                      ; 6384   00D0
L_6385:
        CMPI    #$016E, R4                      ; 6385   037C 016E
        BLE     L_637D                          ; 6387   0226 000B

        CLRR    R2                              ; 6389   01D2
        MVI     G_016F, R1                      ; 638A   0281 016F
        TSTR    R1                              ; 638C   0089
        BEQ     L_6392                          ; 638D   0204 0003

        JSR     R5,     L_633C                  ; 638F   0004 0160 033C

L_6392:
        MOVR    R0,     R1                      ; 6392   0081
        MOVR    R2,     R3                      ; 6393   0093
        SLR     R1,     1                       ; 6394   0061
        SLR     R1,     2                       ; 6395   0065
        ADDR    R1,     R2                      ; 6396   00CA
        SLR     R3,     1                       ; 6397   0063
        ADDR    R3,     R0                      ; 6398   00D8
        MVO     R0,     G_0172                  ; 6399   0240 0172
        MVO     R2,     G_0173                  ; 639B   0242 0173
        MVII    #$02C2, R4                      ; 639D   02BC 02C2
        MVII    #$0006, R3                      ; 639F   02BB 0006
        MOVR    R3,     R2                      ; 63A1   009A
        MVI     G_0184, R1                      ; 63A2   0281 0184
        ADDR    R7,     R1                      ; 63A4   00F9
        ADDI    #$00AC, R1                      ; 63A5   02F9 00AC
        ADD@    R1,     R2                      ; 63A7   02CA
        MVO     R2,     .BTAB.CA                ; 63A8   0242 02CA
        MVI     G_0167, R0                      ; 63AA   0280 0167
        MVII    #$0003, R1                      ; 63AC   02B9 0003
        MVI     G_017E, R5                      ; 63AE   0285 017E
        SUBI    #$0078, R5                      ; 63B0   033D 0078
        BMI     L_63BC                          ; 63B2   020B 0008

        CMPI    #$0003, R5                      ; 63B4   037D 0003
        BGE     L_63BC                          ; 63B6   020D 0004

        INCR    R3                              ; 63B8   000B
        ADDR    R5,     R7                      ; 63B9   00EF

        SLR     R3,     1                       ; 63BA   0063
        SLR     R3,     1                       ; 63BB   0063

L_63BC:
        JSR     R5,     X_PRNUM_RGT             ; 63BC   0004 0118 00C5

        MVII    #$0006, R3                      ; 63BF   02BB 0006
        MVII    #$02D6, R4                      ; 63C1   02BC 02D6
        MVI     G_0172, R0                      ; 63C3   0280 0172

        JSR     R5,     X_PRNUM_RGT             ; 63C5   0004 0118 00C5

        MVII    #$007E, R2                      ; 63C8   02BA 007E
        MVII    #$02C5, R4                      ; 63CA   02BC 02C5
        MVO@    R2,     R4                      ; 63CC   0262
        MVI     G_0168, R0                      ; 63CD   0280 0168
        DECR    R1                              ; 63CF   0011
        MVI     G_017E, R5                      ; 63D0   0285 017E
        SUBI    #$007B, R5                      ; 63D2   033D 007B
        BMI     L_63DA                          ; 63D4   020B 0004

        INCR    R3                              ; 63D6   000B
        ADDR    R5,     R7                      ; 63D7   00EF

        SLR     R3,     1                       ; 63D8   0063
        SLR     R3,     1                       ; 63D9   0063

L_63DA:
        JSR     R5,     X_PRNUM_RGT             ; 63DA   0004 0118 00C5

        MVII    #$0006, R3                      ; 63DD   02BB 0006
        MVII    #$02D9, R4                      ; 63DF   02BC 02D9
        MVO@    R2,     R4                      ; 63E1   0262
        MVI     G_0173, R0                      ; 63E2   0280 0173

        JSR     R5,     X_PRNUM_RGT             ; 63E4   0004 0118 00C5

        MVII    #$02EB, R4                      ; 63E7   02BC 02EB
        PULR    R0                              ; 63E9   02B0

        JSR     R5,     X_PRNUM_RGT             ; 63EA   0004 0118 00C5

        MVII    #$02ED, R4                      ; 63ED   02BC 02ED
        MVO@    R2,     R4                      ; 63EF   0262
        PULR    R0                              ; 63F0   02B0

        JSR     R5,     X_PRNUM_RGT             ; 63F1   0004 0118 00C5

        MVII    #$02E4, R4                      ; 63F4   02BC 02E4
        MVI     G_0185, R0                      ; 63F6   0280 0185
        INCR    R0                              ; 63F8   0008
        MVI     G_0180, R2                      ; 63F9   0282 0180
        ANDI    #$00BF, R2                      ; 63FB   03BA 00BF
        BEQ     L_640D                          ; 63FD   0204 000E

        MVI     G_0165, R0                      ; 63FF   0280 0165
        MVII    #$0005, R3                      ; 6401   02BB 0005
        MVI     G_0166, R2                      ; 6403   0282 0166
        SLL     R2,     1                       ; 6405   004A
        CMPR    R0,     R2                      ; 6406   0142
        BGE     L_640D                          ; 6407   020D 0004

        MVI     G_0166, R0                      ; 6409   0280 0166
        MVII    #$0001, R3                      ; 640B   02BB 0001
L_640D:
        INCR    R1                              ; 640D   0009

        JSR     R5,     X_PRNUM_RGT             ; 640E   0004 0118 00C5

        MVI     G_018A, R0                      ; 6411   0280 018A
        XORI    #$0001, R0                      ; 6413   03F8 0001
        MVO     R0,     G_018A                  ; 6415   0240 018A
        SDBD                                    ; 6417   0001
        MVII    #$0940, R1                      ; 6418   02B9 0040 0009
        MVII    #$0174, R4                      ; 641B   02BC 0174
        SDBD                                    ; 641D   0001
        MVII    #$6455, R5                      ; 641E   02BD 0055 0064
L_6421:
        MOVR    R1,     R2                      ; 6421   008A
        MVI@    R4,     R3                      ; 6422   02A3
        SLL     R3,     1                       ; 6423   004B
        BEQ     L_6448                          ; 6424   0204 0022

        CMPI    #$0176, R4                      ; 6426   037C 0176
        BGT     L_6438                          ; 6428   020E 000E

        MVI     G_0180, R0                      ; 642A   0280 0180
        ANDI    #$00BF, R0                      ; 642C   03B8 00BF
        BEQ     L_6438                          ; 642E   0204 0008

        SWAP    R0,     2                       ; 6430   0044
        BMI     L_6438                          ; 6431   020B 0005

        MVI     G_018A, R0                      ; 6433   0280 018A
        TSTR    R0                              ; 6435   0080
        BEQ     L_6448                          ; 6436   0204 0010

L_6438:
        SDBD                                    ; 6438   0001
        ADDI    #$5A28, R3                      ; 6439   02FB 0028 005A
        MVI@    R3,     R3                      ; 643C   029B
        ANDI    #$000F, R3                      ; 643D   03BB 000F
        MOVR    R3,     R2                      ; 643F   009A
        ANDI    #$0004, R2                      ; 6440   03BA 0004
        XORR    R2,     R3                      ; 6442   01D3
        SLL     R2,     2                       ; 6443   004E
        ADDR    R3,     R2                      ; 6444   00DA
        SWAP    R2,     1                       ; 6445   0042
        SLL     R2,     1                       ; 6446   004A
        ADDR    R1,     R2                      ; 6447   00CA
L_6448:
        MVI@    R5,     R3                      ; 6448   02AB
        MVO@    R2,     R3                      ; 6449   025A
        ADDI    #$0008, R1                      ; 644A   02F9 0008
        CMPI    #$017B, R4                      ; 644C   037C 017B
        BLE     L_6421                          ; 644E   0226 002E
        PULR    R7                              ; 6450   02B7

        CMPR    R6,     R0                      ; 6451   0170
        SUBR    R5,     R0                      ; 6452   0128
        ANDR    R3,     R0                      ; 6453   0198
        ANDR    R7,     R0                      ; 6454   01B8
        ADD@    R4,     R3                      ; 6455   02E3
        ADD@    R5,     R0                      ; 6456   02E8
        ADD@    R1,     R4                      ; 6457   02CC
        ADD@    R3,     R7                      ; 6458   02DF

        ADD@    R3,     R5                      ; 6459   02DD
        ADD@    R1,     R0                      ; 645A   02C8
        PULR    R5                              ; 645B   02B5
        PULR    R7                              ; 645C   02B7

L_645D:
        PSHR    R5                              ; 645D   0275
        MVI     G_0180, R0                      ; 645E   0280 0180
        ADD     G_015E, R0                      ; 6460   02C0 015E
        ADD     G_0138, R0                      ; 6462   02C0 0138
        ADD     G_018C, R0                      ; 6464   02C0 018C
        BNEQ    L_64BF                          ; 6466   020C 0057

        MVI     G_0161, R3                      ; 6468   0283 0161
        CMPI    #$00F4, R3                      ; 646A   037B 00F4
        BEQ     L_6474                          ; 646C   0204 0006

        MVI     G_0135, R0                      ; 646E   0280 0135
        ANDI    #$0002, R0                      ; 6470   03B8 0002
        BNEQ    L_64BF                          ; 6472   020C 004B

L_6474:
        MVI     G_012D, R1                      ; 6474   0281 012D
        SUBI    #$00C0, R3                      ; 6476   033B 00C0
        BLE     L_6487                          ; 6478   0206 000D

        CMPI    #$0034, R3                      ; 647A   037B 0034
        BEQ     L_6482                          ; 647C   0204 0004

        CMPI    #$0031, R3                      ; 647E   037B 0031
        BGE     L_6487                          ; 6480   020D 0005

L_6482:
        MOVR    R1,     R2                      ; 6482   008A
        ANDI    #$0003, R2                      ; 6483   03BA 0003
        BEQ     L_64AF                          ; 6485   0204 0028

L_6487:
        MVII    #$0003, R0                      ; 6487   02B8 0003

        JSR     R5,     X_RAND1                 ; 6489   0004 0114 027D

        TSTR    R0                              ; 648C   0080
        BNEQ    L_64BF                          ; 648D   020C 0030

        ANDI    #$000C, R1                      ; 648F   03B9 000C
        BNEQ    L_649E                          ; 6491   020C 000B

        MVII    #$0001, R0                      ; 6493   02B8 0001

        JSR     R5,     L_64C0                  ; 6495   0004 0164 00C0

        BLE     L_649E                          ; 6498   0206 0004

        CMPI    #$0031, R3                      ; 649A   037B 0031
        BLT     L_64AF                          ; 649C   0205 0011

L_649E:
        MVI     G_012D, R1                      ; 649E   0281 012D
        ANDI    #$00C0, R1                      ; 64A0   03B9 00C0
        BNEQ    L_64BF                          ; 64A2   020C 001B

        MVII    #$0003, R0                      ; 64A4   02B8 0003

        JSR     R5,     L_64C0                  ; 64A6   0004 0164 00C0

        BLE     L_64BF                          ; 64A9   0206 0014

        CMPI    #$0031, R3                      ; 64AB   037B 0031
        BGE     L_64BF                          ; 64AD   020D 0010

L_64AF:
        MVO     R0,     G_018F                  ; 64AF   0240 018F
        MVO     R3,     G_0180                  ; 64B1   0243 0180

        JSR     R5,     L_64D6                  ; 64B3   0004 0164 00D6
        JSR     R5,     L_6BF1                  ; 64B6   0004 0168 03F1
        JSR     R5,     L_5118                  ; 64B9   0004 0150 0118

        CLRR    R0                              ; 64BC   01C0
        MVO     R0,     G_018F                  ; 64BD   0240 018F
L_64BF:
        PULR    R7                              ; 64BF   02B7

L_64C0:
        PSHR    R5                              ; 64C0   0275
        MOVR    R0,     R1                      ; 64C1   0081
        NEGR    R1                              ; 64C2   0021
        ADDI    #$0002, R1                      ; 64C3   02F9 0002
        ADD     G_0184, R1                      ; 64C5   02C1 0184
        ANDI    #$0003, R1                      ; 64C7   03B9 0003
        SDBD                                    ; 64C9   0001
        ADDI    #$5212, R1                      ; 64CA   02F9 0012 0052
        MVI@    R1,     R1                      ; 64CD   0289
        ADD     G_0183, R1                      ; 64CE   02C1 0183

        JSR     R5,     L_586F                  ; 64D0   0004 0158 006F

        SUBI    #$00C0, R3                      ; 64D3   033B 00C0
        PULR    R7                              ; 64D5   02B7

L_64D6:
        PSHR    R5                              ; 64D6   0275
        PSHR    R1                              ; 64D7   0271
        SLL     R3,     2                       ; 64D8   004F
        SDBD                                    ; 64D9   0001
        ADDI    #$5B99, R3                      ; 64DA   02FB 0099 005B
        MVI@    R3,     R2                      ; 64DD   029A
        SLR     R2,     2                       ; 64DE   0066
        SLR     R2,     1                       ; 64DF   0062
        MOVR    R2,     R0                      ; 64E0   0090
        SLR     R0,     1                       ; 64E1   0060

        JSR     R5,     X_RAND2                 ; 64E2   0004 0114 029E

        ADDR    R2,     R0                      ; 64E5   00D0
        SLL     R0,     1                       ; 64E6   0048
        ADD     G_0185, R0                      ; 64E7   02C0 0185
        SLR     R0,     1                       ; 64E9   0060

        JSR     R5,     .EXEC.673               ; 64EA   0004 0114 0273
        DECLE   $00FF                           ; 64ED   00FF

        MOVR    R0,     R2                      ; 64EE   0082
        SLR     R0,     2                       ; 64EF   0064
        MVI     G_0139, R5                      ; 64F0   0285 0139
L_64F2:
        INCR    R5                              ; 64F2   000D
        CMPI    #$0003, R5                      ; 64F3   037D 0003
        BGT     L_64FA                          ; 64F5   020E 0003

        SUBR    R0,     R2                      ; 64F7   0102
        B       L_64F2                          ; 64F8   0220 0007

L_64FA:
        MVO     R2,     G_0165                  ; 64FA   0242 0165
        SLR     R2,     1                       ; 64FC   0062
        INCR    R2                              ; 64FD   000A
        MVO     R2,     G_0166                  ; 64FE   0242 0166
        INCR    R3                              ; 6500   000B
        MVI@    R3,     R3                      ; 6501   029B
        SLR     R3,     2                       ; 6502   0067
        SLR     R3,     2                       ; 6503   0067
        MOVR    R3,     R0                      ; 6504   0098
        SLR     R0,     2                       ; 6505   0064
        MVI     G_0139, R5                      ; 6506   0285 0139
L_6508:
        INCR    R5                              ; 6508   000D
        CMPI    #$0003, R5                      ; 6509   037D 0003
        BGT     L_6510                          ; 650B   020E 0003

        SUBR    R0,     R3                      ; 650D   0103
        B       L_6508                          ; 650E   0220 0007

L_6510:
        MVO     R3,     G_0170                  ; 6510   0243 0170
        SLR     R3,     1                       ; 6512   0063
        MVO     R3,     G_0171                  ; 6513   0243 0171
        PULR    R1                              ; 6515   02B1
        PULR    R7                              ; 6516   02B7

L_6517:
        MVI     G_0161, R3                      ; 6517   0283 0161
        SUBI    #$00C0, R3                      ; 6519   033B 00C0
        BLE     L_6616                          ; 651B   0206 00F9

        CMPI    #$0035, R3                      ; 651D   037B 0035
        BGE     L_6616                          ; 651F   020D 00F5

        MVI     G_012D, R0                      ; 6521   0280 012D
        ANDI    #$0003, R0                      ; 6523   03B8 0003

        JSR     R5,     L_6FF3                  ; 6525   0004 016C 03F3

        BNEQ    L_652E                          ; 6528   020C 0004

        ANDI    #$0002, R0                      ; 652A   03B8 0002
        XORI    #$0002, R0                      ; 652C   03F8 0002
L_652E:
        ADD     G_031E, R0                      ; 652E   02C0 031E
        BNEQ    L_6616                          ; 6530   020C 00E4

        CMPI    #$0034, R3                      ; 6532   037B 0034
        BEQ     L_653C                          ; 6534   0204 0006

        MVI     G_0135, R0                      ; 6536   0280 0135
        ANDI    #$0002, R0                      ; 6538   03B8 0002
        BNEQ    L_6616                          ; 653A   020C 00DA

L_653C:
        MVI     G_0180, R1                      ; 653C   0281 0180
        ANDI    #$00BF, R1                      ; 653E   03B9 00BF
        BNEQ    L_6548                          ; 6540   020C 0006

        MOVR    R3,     R1                      ; 6542   0099
        ADDI    #$0080, R1                      ; 6543   02F9 0080

        JSR     R5,     L_64D6                  ; 6545   0004 0164 00D6

L_6548:
        SWAP    R1,     2                       ; 6548   0045
        BPL     L_6616                          ; 6549   0203 00CB

        XORI    #$0080, R1                      ; 654B   03F9 0080
        MVI     G_0175, R2                      ; 654D   0282 0175
        DECR    R2                              ; 654F   0012
        CMPI    #$0027, R2                      ; 6550   037A 0027
        BLT     L_6616                          ; 6552   0205 00C2

        CMPI    #$005C, R2                      ; 6554   037A 005C
        BLE     L_6560                          ; 6556   0206 0008

        CMPI    #$0081, R2                      ; 6558   037A 0081
        BLT     L_6616                          ; 655A   0205 00BA

        CMPI    #$00A4, R2                      ; 655C   037A 00A4
        BGT     L_6616                          ; 655E   020E 00B6

L_6560:
        MVII    #$016A, R3                      ; 6560   02BB 016A
        MVII    #$0001, R0                      ; 6562   02B8 0001
        CMPI    #$0081, R2                      ; 6564   037A 0081
        BLT     L_656B                          ; 6566   0205 0003

        INCR    R0                              ; 6568   0008
        MVII    #$0169, R3                      ; 6569   02BB 0169

L_656B:
        JSR     R5,     L_661A                  ; 656B   0004 0164 021A

        MVO     R1,     G_0180                  ; 656E   0241 0180
        MVO     R2,     G_0136                  ; 6570   0242 0136
        CLRR    R0                              ; 6572   01C0
        CMPI    #$0032, R2                      ; 6573   037A 0032
        BGT     L_6584                          ; 6575   020E 000D

        MVI     G_017C, R1                      ; 6577   0281 017C
        DECR    R1                              ; 6579   0011
        BMI     L_6616                          ; 657A   020B 009A

        MVO     R1,     G_017C                  ; 657C   0241 017C
        CMPI    #$0032, R2                      ; 657E   037A 0032
        BEQ     L_6590                          ; 6580   0204 000E
        B       L_658E                          ; 6582   0200 000A

L_6584:
        CMPI    #$0081, R2                      ; 6584   037A 0081
        BLT     L_6592                          ; 6586   0205 000A

        CMPI    #$008C, R2                      ; 6588   037A 008C
        BGT     L_6592                          ; 658A   020E 0006
        BEQ     L_6590                          ; 658C   0204 0002

L_658E:
        ADDI    #$0003, R0                      ; 658E   02F8 0003
L_6590:
        ADDI    #$0003, R0                      ; 6590   02F8 0003

L_6592:
        JSR     R5,     X_RAND1                 ; 6592   0004 0114 027D

        TSTR    R0                              ; 6595   0080
        BNEQ    L_659A                          ; 6596   020C 0002

        MVO     R0,     G_0175                  ; 6598   0240 0175
L_659A:
        PSHR    R2                              ; 659A   0272
        SLL     R2,     1                       ; 659B   004A
        SDBD                                    ; 659C   0001
        ADDI    #$5A2A, R2                      ; 659D   02FA 002A 005A
        MVI@    R2,     R1                      ; 65A0   0291
        MOVR    R1,     R0                      ; 65A1   0088
        ANDI    #$0007, R0                      ; 65A2   03B8 0007
        XORR    R0,     R1                      ; 65A4   01C1
        SLL     R1,     1                       ; 65A5   0049
        ADDR    R1,     R0                      ; 65A6   00C8
        ANDI    #$001F, R0                      ; 65A7   03B8 001F
        SDBD                                    ; 65A9   0001
        XORI    #$1000, R0                      ; 65AA   03F8 0000 0010
        SLR     R1,     2                       ; 65AD   0065
        SLR     R1,     2                       ; 65AE   0065
        SLR     R1,     1                       ; 65AF   0061
        ANDI    #$0007, R1                      ; 65B0   03B9 0007
        PULR    R2                              ; 65B2   02B2
        CMPI    #$004B, R2                      ; 65B3   037A 004B
        BLT     L_65BB                          ; 65B5   0205 0004

        CMPI    #$005C, R2                      ; 65B7   037A 005C
        BLE     L_65C5                          ; 65B9   0206 000A

L_65BB:
        CMPI    #$0001, R1                      ; 65BB   0379 0001
        BGT     L_65C5                          ; 65BD   020E 0006

        MVII    #$0003, R1                      ; 65BF   02B9 0003
        SDBD                                    ; 65C1   0001
        MVII    #$1003, R0                      ; 65C2   02B8 0003 0010
L_65C5:
        MVII    #$031D, R4                      ; 65C5   02BC 031D
        SDBD                                    ; 65C7   0001
        MVII    #$5CC5, R3                      ; 65C8   02BB 00C5 005C
        CMPI    #$004A, R2                      ; 65CB   037A 004A
        BLE     L_65E3                          ; 65CD   0206 0014

        SDBD                                    ; 65CF   0001
        MVII    #$5CCC, R3                      ; 65D0   02BB 00CC 005C
        CMPI    #$0081, R2                      ; 65D3   037A 0081
        BLT     L_65E3                          ; 65D5   0205 000C

        SDBD                                    ; 65D7   0001
        MVII    #$5CE1, R3                      ; 65D8   02BB 00E1 005C
        CMPI    #$0003, R1                      ; 65DB   0379 0003
        BGT     L_65E3                          ; 65DD   020E 0004

        SDBD                                    ; 65DF   0001
        XORI    #$2000, R0                      ; 65E0   03F8 0000 0020
L_65E3:
        MVO@    R0,     R4                      ; 65E3   0260
        MVO@    R3,     R4                      ; 65E4   0263
        MVII    #$0078, R0                      ; 65E5   02B8 0078
        SWAP    R0,     1                       ; 65E7   0040
        MVO@    R0,     R4                      ; 65E8   0260
        MVII    #$004C, R0                      ; 65E9   02B8 004C
        SWAP    R0,     1                       ; 65EB   0040
        MVO@    R0,     R4                      ; 65EC   0260
        INCR    R4                              ; 65ED   000C
        MVO@    R1,     R4                      ; 65EE   0261
        PSHR    R1                              ; 65EF   0271
        PSHR    R2                              ; 65F0   0272
        MVI     G_0338, R2                      ; 65F1   0282 0338
        SWAP    R2,     1                       ; 65F3   0042
        SDBD                                    ; 65F4   0001
        ADDI    #$5808, R2                      ; 65F5   02FA 0008 0058
        MVII    #$0032, R3                      ; 65F8   02BB 0032
        MVII    #$031D, R1                      ; 65FA   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 65FC   0004 0118 01A1

L_65FF:
        PULR    R2                              ; 65FF   02B2
        PULR    R1                              ; 6600   02B1
        CMPI    #$0081, R2                      ; 6601   037A 0081
        BLT     L_64BF                          ; 6603   0225 0145

        SDBD                                    ; 6605   0001
        MVII    #$6CA8, R4                      ; 6606   02BC 00A8 006C
        CMPI    #$0004, R1                      ; 6609   0379 0004
        BGE     L_6611                          ; 660B   020D 0004

        SDBD                                    ; 660D   0001
        MVII    #$6CBB, R4                      ; 660E   02BC 00BB 006C
L_6611:
        SDBD                                    ; 6611   0001
        MVII    #$64BF, R5                      ; 6612   02BD 00BF 0064
        MOVR    R4,     R7                      ; 6615   00A7

L_6616:
        JSR     R5,     X_PLAY_RAZZ2            ; 6616   0004 011C 02BD

        PULR    R7                              ; 6619   02B7

L_661A:
        PSHR    R5                              ; 661A   0275
        PSHR    R1                              ; 661B   0271
        MVI     G_0183, R5                      ; 661C   0285 0183
        CMP     G_01EC, R5                      ; 661E   0345 01EC
        BEQ     L_6657                          ; 6620   0204 0035

        MVI     G_017E, R5                      ; 6622   0285 017E
        MVII    #$0019, R1                      ; 6624   02B9 0019
        CMPI    #$0169, R3                      ; 6626   037B 0169
        BEQ     L_663B                          ; 6628   0204 0011

        SLL     R1,     1                       ; 662A   0049
        SUBI    #$0078, R5                      ; 662B   033D 0078
        BMI     L_6645                          ; 662D   020B 0016

        CMPI    #$0003, R5                      ; 662F   037D 0003
        BGE     L_6645                          ; 6631   020D 0012

        DECR    R0                              ; 6633   0010
L_6634:
        ADDI    #$0032, R1                      ; 6634   02F9 0032
        DECR    R5                              ; 6636   0015
        BPL     L_6634                          ; 6637   0223 0004
        B       L_6645                          ; 6639   0200 000A

L_663B:
        SUBI    #$007B, R5                      ; 663B   033D 007B
        BMI     L_6645                          ; 663D   020B 0006

        DECR    R0                              ; 663F   0010
L_6640:
        ADDI    #$0019, R1                      ; 6640   02F9 0019
        DECR    R5                              ; 6642   0015
        BPL     L_6640                          ; 6643   0223 0004

L_6645:
        DECR    R1                              ; 6645   0011
        CMP@    R3,     R1                      ; 6646   0359
        BLE     L_6657                          ; 6647   0206 000E

        SLR     R1,     1                       ; 6649   0061
        CMP@    R3,     R1                      ; 664A   0359
        BGE     L_664E                          ; 664B   020D 0001

        INCR    R0                              ; 664D   0008

L_664E:
        JSR     R5,     X_RAND1                 ; 664E   0004 0114 027D

        TSTR    R0                              ; 6651   0080
        BNEQ    L_6657                          ; 6652   020C 0003

        MVI@    R3,     R0                      ; 6654   0298
        INCR    R0                              ; 6655   0008
        MVO@    R0,     R3                      ; 6656   0258
L_6657:
        PULR    R1                              ; 6657   02B1
        PULR    R7                              ; 6658   02B7

        PSHR    R5                              ; 6659   0275
        CMPI    #$0335, R1                      ; 665A   0379 0335
        BNEQ    L_64BF                          ; 665C   022C 019E

        MVI     G_0180, R0                      ; 665E   0280 0180
        ANDI    #$00BF, R0                      ; 6660   03B8 00BF
        BEQ     L_64BF                          ; 6662   0224 01A4

        SWAP    R0,     2                       ; 6664   0044
        BMI     L_64BF                          ; 6665   022B 01A7

        MVI     G_0326, R1                      ; 6667   0281 0326
        TSTR    R1                              ; 6669   0089
        BNEQ    L_64BF                          ; 666A   022C 01AC

        XORI    #$0080, R0                      ; 666C   03F8 0080
        MVO     R0,     G_0180                  ; 666E   0240 0180
        MVI     G_031E, R3                      ; 6670   0283 031E
        SDBD                                    ; 6672   0001
        CMPI    #$5CCC, R3                      ; 6673   037B 00CC 005C
        BEQ     L_64BF                          ; 6676   0224 01B8

        MVI     G_0161, R3                      ; 6678   0283 0161
        SUBI    #$00C1, R3                      ; 667A   033B 00C1
        SLL     R3,     2                       ; 667C   004F
        SDBD                                    ; 667D   0001
        ADDI    #$5B9F, R3                      ; 667E   02FB 009F 005B
        MVI@    R3,     R2                      ; 6681   029A
        SLR     R2,     2                       ; 6682   0066
        SLR     R2,     2                       ; 6683   0066
        SLR     R2,     1                       ; 6684   0062
        ADDI    #$0033, R2                      ; 6685   02FA 0033
        SUBI    #$0003, R3                      ; 6687   033B 0003
        MVI@    R3,     R0                      ; 6689   0298
        SWAP    R0,     1                       ; 668A   0040
        ANDI    #$0003, R0                      ; 668B   03B8 0003
        SUBI    #$0002, R0                      ; 668D   0338 0002
        BMI     L_66A8                          ; 668F   020B 0017
        BEQ     L_66A6                          ; 6691   0204 0013

        CMP     G_0139, R0                      ; 6693   0340 0139
        BGE     L_66A0                          ; 6695   020D 0009

        MVI     G_0167, R0                      ; 6697   0280 0167
        SLR     R0,     1                       ; 6699   0060
        CMP     G_0168, R0                      ; 669A   0340 0168
        BLE     L_66A8                          ; 669C   0206 000A
        B       L_66A6                          ; 669E   0200 0006

L_66A0:
        JSR     R5,     X_RAND1                 ; 66A0   0004 0114 027D

        TSTR    R0                              ; 66A3   0080
        BNEQ    L_66A8                          ; 66A4   020C 0002

L_66A6:
        ADDI    #$005A, R2                      ; 66A6   02FA 005A
L_66A8:
        MVO     R2,     G_0137                  ; 66A8   0242 0137
        INCR    R3                              ; 66AA   000B
        MVI@    R3,     R3                      ; 66AB   029B
        ANDI    #$0007, R3                      ; 66AC   03BB 0007
        SLL     R3,     1                       ; 66AE   004B
        MOVR    R3,     R5                      ; 66AF   009D
        SDBD                                    ; 66B0   0001
        ADDI    #$66F7, R5                      ; 66B1   02FD 00F7 0066
        MOVR    R2,     R1                      ; 66B4   0091
        SLL     R1,     1                       ; 66B5   0049
        SDBD                                    ; 66B6   0001
        ADDI    #$5A2A, R1                      ; 66B7   02F9 002A 005A
        MVI@    R1,     R1                      ; 66BA   0289
        MOVR    R1,     R3                      ; 66BB   008B
        ANDI    #$0007, R1                      ; 66BC   03B9 0007
        XORR    R1,     R3                      ; 66BE   01CB
        SLL     R3,     1                       ; 66BF   004B
        ADDR    R3,     R1                      ; 66C0   00D9
        ANDI    #$001F, R1                      ; 66C1   03B9 001F
        SDBD                                    ; 66C3   0001
        XORI    #$1600, R1                      ; 66C4   03F9 0000 0016
        SLR     R3,     2                       ; 66C7   0067
        SLR     R3,     2                       ; 66C8   0067
        SLR     R3,     1                       ; 66C9   0063
        ANDI    #$0007, R3                      ; 66CA   03BB 0007
        MVII    #$0325, R4                      ; 66CC   02BC 0325
        SDBD                                    ; 66CE   0001
        MVII    #$5CC5, R0                      ; 66CF   02B8 00C5 005C
        CMPI    #$008D, R2                      ; 66D2   037A 008D
        BLT     L_66E2                          ; 66D4   0205 000C

        SDBD                                    ; 66D6   0001
        MVII    #$5CE1, R0                      ; 66D7   02B8 00E1 005C
        CMPI    #$0003, R3                      ; 66DA   037B 0003
        BGT     L_66E2                          ; 66DC   020E 0004

        SDBD                                    ; 66DE   0001
        XORI    #$2000, R1                      ; 66DF   03F9 0000 0020
L_66E2:
        MVO@    R1,     R4                      ; 66E2   0261
        MVO@    R0,     R4                      ; 66E3   0260
        MVI@    R5,     R1                      ; 66E4   02A9
        SWAP    R1,     1                       ; 66E5   0041
        MVO@    R1,     R4                      ; 66E6   0261
        MVI@    R5,     R1                      ; 66E7   02A9
        SWAP    R1,     1                       ; 66E8   0041
        MVO@    R1,     R4                      ; 66E9   0261
        INCR    R4                              ; 66EA   000C
        MVO@    R3,     R4                      ; 66EB   0263
        PSHR    R3                              ; 66EC   0273
        PSHR    R2                              ; 66ED   0272
        SDBD                                    ; 66EE   0001
        MVII    #$784C, R2                      ; 66EF   02BA 004C 0078
        MVII    #$0032, R3                      ; 66F2   02BB 0032
        MVII    #$0325, R1                      ; 66F4   02B9 0325

        JSR     R5,     .EXEC.9A1               ; 66F6   0004 0118 01A1

        B       L_65FF                          ; 66F9   0220 00FB

        DECLE   $0060,  $0038,  $0050,  $0022   ; 66FB   0060 0038 0050 0022
        DECLE   $0050,  $0037                   ; 66FF   0050 0037

        RLC     R2,     1                       ; 6701   0052
        RSWD    R0                              ; 6702   0038
        RLC     R0,     1                       ; 6703   0050
        ADCR    R0                              ; 6704   0028
        MVII    #$0001, R4                      ; 6705   02BC 0001
        INCR    R7                              ; 6707   000F

        CLRR    R4                              ; 6708   01E4
L_6709:
        PSHR    R5                              ; 6709   0275
        PSHR    R1                              ; 670A   0271
        MOVR    R0,     R1                      ; 670B   0081
        ADDI    #$0136, R1                      ; 670C   02F9 0136
        MVI@    R1,     R1                      ; 670E   0289

        JSR     R5,     L_633C                  ; 670F   0004 0160 033C

        MOVR    R2,     R3                      ; 6712   0093
        SLL     R2,     2                       ; 6713   004E
        SLL     R0,     1                       ; 6714   0048
        BEQ     L_671C                          ; 6715   0204 0005
        ADD     G_0139, R7                      ; 6717   02C7 0139

        SUBR    R3,     R2                      ; 6719   011A
        SUBR    R3,     R2                      ; 671A   011A
        SUBR    R3,     R2                      ; 671B   011A
L_671C:
        ADDI    #$0006, R2                      ; 671C   02FA 0006
        ADDR    R4,     R7                      ; 671E   00E7

        SLL     R2,     1                       ; 671F   004A
        MOVR    R0,     R3                      ; 6720   0083
        ADDI    #$0165, R3                      ; 6721   02FB 0165
        ADDR    R4,     R3                      ; 6723   00E3
        MOVR    R0,     R1                      ; 6724   0081
        ADDI    #$0170, R1                      ; 6725   02F9 0170
        ADDR    R4,     R1                      ; 6727   00E1
        MVI@    R1,     R1                      ; 6728   0289
        SLL     R1,     1                       ; 6729   0049
        ADD@    R3,     R1                      ; 672A   02D9
        PSHR    R3                              ; 672B   0273
        MOVR    R0,     R3                      ; 672C   0083
        XORI    #$0002, R3                      ; 672D   03FB 0002
        ADDI    #$0165, R3                      ; 672F   02FB 0165
        ADDR    R4,     R3                      ; 6731   00E3
        ADD@    R3,     R2                      ; 6732   02DA
        MOVR    R1,     R3                      ; 6733   008B
        SUBR    R2,     R3                      ; 6734   0113
        BMI     L_6738                          ; 6735   020B 0001

        CLRR    R3                              ; 6737   01DB
L_6738:
        MOVR    R1,     R0                      ; 6738   0088
        INCR    R0                              ; 6739   0008

        JSR     R5,     X_RAND2                 ; 673A   0004 0114 029E

        MOVR    R0,     R1                      ; 673D   0081
        MOVR    R2,     R0                      ; 673E   0090

        JSR     R5,     X_RAND2                 ; 673F   0004 0114 029E

        INCR    R0                              ; 6742   0008
        SUBR    R0,     R1                      ; 6743   0101
        BMI     L_6747                          ; 6744   020B 0001

        CLRR    R1                              ; 6746   01C9
L_6747:
        ADDR    R3,     R1                      ; 6747   00D9
        SAR     R1,     2                       ; 6748   006D
        SAR     R1,     1                       ; 6749   0069
        PULR    R3                              ; 674A   02B3
        ADD@    R3,     R1                      ; 674B   02D9
        BPL     L_674F                          ; 674C   0203 0001

        CLRR    R1                              ; 674E   01C9
L_674F:
        MVO@    R1,     R3                      ; 674F   0259
        PULR    R1                              ; 6750   02B1
L_6751:
        CLRR    R0                              ; 6751   01C0
        MVO@    R0,     R1                      ; 6752   0248
        INCR    R1                              ; 6753   0009
        MVO@    R0,     R1                      ; 6754   0248

        JSR     R5,     L_6C7E                  ; 6755   0004 016C 007E

        PSHR    R5                              ; 6758   0275
        MVII    #$0040, R0                      ; 6759   02B8 0040
        MVO     R0,     G_0180                  ; 675B   0240 0180
        B       L_6751                          ; 675D   0220 000D

        PSHR    R5                              ; 675F   0275
L_6760:
        MVI     G_0167, R0                      ; 6760   0280 0167
        TSTR    R0                              ; 6762   0080
        BEQ     L_676A                          ; 6763   0204 0005

        MVI     G_0168, R0                      ; 6765   0280 0168
        TSTR    R0                              ; 6767   0080
        BNEQ    L_67A7                          ; 6768   020C 003D

L_676A:
        SDBD                                    ; 676A   0001
        MVII    #$1906, R1                      ; 676B   02B9 0006 0019
        MVO     R1,     G_035D                  ; 676E   0241 035D
        MVO     R0,     G_0180                  ; 6770   0240 0180
        MVO     R0,     G_017E                  ; 6772   0240 017E
        MVI     G_016A, R0                      ; 6774   0280 016A
        SUBI    #$0005, R0                      ; 6776   0338 0005
        CMPI    #$000A, R0                      ; 6778   0378 000A
        BLE     L_67F3                          ; 677A   0206 0077

        MVI     G_0169, R1                      ; 677C   0281 0169
        SUBI    #$0003, R1                      ; 677E   0339 0003
        CMPI    #$0005, R1                      ; 6780   0379 0005
        BLE     L_67F3                          ; 6782   0206 006F

        MVII    #$0167, R4                      ; 6784   02BC 0167
        MVO@    R0,     R4                      ; 6786   0260
        MVO@    R1,     R4                      ; 6787   0261
        MVO@    R1,     R4                      ; 6788   0261
        MVO@    R0,     R4                      ; 6789   0260
        MVII    #$0006, R0                      ; 678A   02B8 0006
        MVII    #$0176, R4                      ; 678C   02BC 0176

        JSR     R5,     X_FILL_ZERO             ; 678E   0004 0114 0338
        JSR     R5,     L_6C48                  ; 6791   0004 016C 0048

        MVII    #$0003, R0                      ; 6794   02B8 0003
        MVO     R0,     G_0138                  ; 6796   0240 0138

        JSR     R5,     .EXEC.A61               ; 6798   0004 0118 0261

        COMR    R6                              ; 679B   001E
        CLRR    R0                              ; 679C   01C0
        MVO     R0,     G_0354                  ; 679D   0240 0354
        MVO     R0,     G_0183                  ; 679F   0240 0183
        INCR    R0                              ; 67A1   0008
        MVO     R0,     G_0184                  ; 67A2   0240 0184
        J       L_5158                          ; 67A4   0004 0350 0158

L_67A7:
        MVI     G_0334, R1                      ; 67A7   0281 0334
        DECR    R1                              ; 67A9   0011
        BMI     L_67B5                          ; 67AA   020B 0009

        MVO     R1,     G_0334                  ; 67AC   0241 0334
        BNEQ    L_67B5                          ; 67AE   020C 0005

        MVO     R1,     G_0135                  ; 67B0   0241 0135

        JSR     R5,     L_6BE1                  ; 67B2   0004 0168 03E1

L_67B5:
        MVI     G_0165, R1                      ; 67B5   0281 0165
        TSTR    R1                              ; 67B7   0089
        BEQ     L_67BF                          ; 67B8   0204 0005

        MVI     G_0166, R1                      ; 67BA   0281 0166
        TSTR    R1                              ; 67BC   0089
        BNEQ    L_67F2                          ; 67BD   020C 0033

L_67BF:
        ADD     G_0180, R1                      ; 67BF   02C1 0180
        BEQ     L_67F2                          ; 67C1   0204 002F

        MVI     G_0184, R1                      ; 67C3   0281 0184
        SDBD                                    ; 67C5   0001
        ADDI    #$5212, R1                      ; 67C6   02F9 0012 0052
        MVI@    R1,     R1                      ; 67C9   0289
        ADD     G_0183, R1                      ; 67CA   02C1 0183

        JSR     R5,     L_586F                  ; 67CC   0004 0158 006F

        MOVR    R5,     R4                      ; 67CF   00AC
        DECR    R4                              ; 67D0   0014
        CLRR    R1                              ; 67D1   01C9
        CMPI    #$00F4, R3                      ; 67D2   037B 00F4
        BNEQ    L_67D8                          ; 67D4   020C 0002

        MVII    #$00B5, R1                      ; 67D6   02B9 00B5
L_67D8:
        SUBI    #$00C0, R3                      ; 67D8   033B 00C0

        JSR     R5,     L_6FF3                  ; 67DA   0004 016C 03F3

        BNEQ    L_67E2                          ; 67DD   020C 0003

        MOVR    R3,     R1                      ; 67DF   0099
        ADDI    #$0045, R1                      ; 67E0   02F9 0045
L_67E2:
        MVO@    R1,     R4                      ; 67E2   0261
        MVO     R1,     G_0161                  ; 67E3   0241 0161
        CLRR    R1                              ; 67E5   01C9
        MVO     R1,     G_0180                  ; 67E6   0241 0180
        MVII    #$032D, R1                      ; 67E8   02B9 032D

        JSR     R5,     L_5C8B                  ; 67EA   0004 015C 008B

        ADDI    #$0008, R1                      ; 67ED   02F9 0008

        JSR     R5,     L_5C86                  ; 67EF   0004 015C 0086

L_67F2:
        PULR    R7                              ; 67F2   02B7

L_67F3:
        JSR     R5,     L_6C31                  ; 67F3   0004 016C 0031

        MVII    #$0084, R0                      ; 67F6   02B8 0084
        MVO     R0,     G_015E                  ; 67F8   0240 015E
L_67FA:
        SDBD                                    ; 67FA   0001
        MVII    #$1906, R0                      ; 67FB   02B8 0006 0019
        MVO     R0,     G_035D                  ; 67FE   0240 035D

        JSR     R5,     .EXEC.A61               ; 6800   0004 0118 0261
        DECLE   $0001                           ; 6803   0001

        PULR    R7                              ; 6804   02B7

        MOVR    R1,     R2                      ; 6805   008A
        SAR     R3,     1                       ; 6806   006B
        INCR    R7                              ; 6807   000F

        SAR     R0,     1                       ; 6808   0068
L_6809:
        MOVR    R6,     R4                      ; 6809   00B4
        SAR     R3,     1                       ; 680A   006B
        MOVR    R4,     R5                      ; 680B   00A5
        SAR     R3,     1                       ; 680C   006B
        MOVR    R5,     R1                      ; 680D   00A9
        SAR     R3,     1                       ; 680E   006B
        PSHR    R5                              ; 680F   0275
        MVI     G_0138, R2                      ; 6810   0282 0138
        ADD     G_018C, R2                      ; 6812   02C2 018C
        ADD     G_015E, R2                      ; 6814   02C2 015E
        ADD     G_018F, R2                      ; 6816   02C2 018F
        BNEQ    L_684C                          ; 6818   020C 0032

        MOVR    R0,     R5                      ; 681A   0085
        INCR    R5                              ; 681B   000D
        ADDR    R7,     R5                      ; 681C   00FD
        ADD@    R5,     R7                      ; 681D   02EF

        DECLE   $006E,  $028B,  $0027           ; 681E   006E 028B 0027

        ADCR    R7                              ; 6821   002F

        ADD@    R3,     R0                      ; 6822   02D8
L_6823:
        ADDR    R1,     R7                      ; 6823   00CF

        RSWD    R5                              ; 6824   003D
        MVI@    R1,     R0                      ; 6825   0288
        SWAP    R1,     1                       ; 6826   0041
        MOVR    R3,     R7                      ; 6827   009F

        INCR    R4                              ; 6828   000C
        INCR    R4                              ; 6829   000C
        MVI     G_0180, R1                      ; 682A   0281 0180
        ANDI    #$00BF, R1                      ; 682C   03B9 00BF
        BNEQ    L_6863                          ; 682E   020C 0033

        SLL     R0,     1                       ; 6830   0048
        XORI    #$0017, R0                      ; 6831   03F8 0017

        JSR     R5,     L_68D7                  ; 6833   0004 0168 00D7

        MVII    #$0001, R1                      ; 6836   02B9 0001
        MVO     R1,     G_0138                  ; 6838   0241 0138

        JSR     R5,     .EXEC.A61               ; 683A   0004 0118 0261
        DECLE   $000F                           ; 683D   000F

        MVI     G_018D, R0                      ; 683E   0280 018D
        XORI    #$0002, R0                      ; 6840   03F8 0002

        JSR     R5,     L_68D8                  ; 6842   0004 0168 00D8

        MVII    #$0174, R4                      ; 6845   02BC 0174
L_6847:
        MOVR    R4,     R5                      ; 6847   00A5
        MVI@    R4,     R2                      ; 6848   02A2
        MVI@    R4,     R1                      ; 6849   02A1
        MVO@    R1,     R5                      ; 684A   0269
        MVO@    R2,     R5                      ; 684B   026A
L_684C:
        PULR    R7                              ; 684C   02B7

        MVII    #$0176, R4                      ; 684D   02BC 0176
        MOVR    R4,     R5                      ; 684F   00A5
        MVII    #$0005, R0                      ; 6850   02B8 0005
        MVI     G_017B, R2                      ; 6852   0282 017B
L_6854:
        MVI@    R4,     R1                      ; 6854   02A1
        MVO@    R2,     R5                      ; 6855   026A
        MOVR    R1,     R2                      ; 6856   008A
        DECR    R0                              ; 6857   0010
        BPL     L_6854                          ; 6858   0223 0005
L_685A:
        PULR    R7                              ; 685A   02B7

        MVII    #$0175, R4                      ; 685B   02BC 0175
        B       L_6847                          ; 685D   0220 0017

L_685F:
        MVI     G_0180, R1                      ; 685F   0281 0180
        ANDI    #$00BF, R1                      ; 6861   03B9 00BF
L_6863:
        BNEQ    L_6B86                          ; 6863   020C 0321

        MVI     G_016A, R3                      ; 6865   0283 016A
        MVI     G_0167, R2                      ; 6867   0282 0167
        MVI     G_0169, R4                      ; 6869   0284 0169
        MVI     G_0168, R5                      ; 686B   0285 0168
        CMPR    R3,     R2                      ; 686D   015A
        BLT     L_6873                          ; 686E   0205 0003

        CMPR    R4,     R5                      ; 6870   0165
        BGE     L_684C                          ; 6871   022D 0026

L_6873:
        MVI     G_017D, R1                      ; 6873   0281 017D
        DECR    R1                              ; 6875   0011
        BMI     L_684C                          ; 6876   022B 002B

        ADDI    #$0005, R2                      ; 6878   02FA 0005
        MVO     R1,     G_017D                  ; 687A   0241 017D
        CMPR    R3,     R2                      ; 687C   015A
        BLE     L_6880                          ; 687D   0206 0001

        MOVR    R3,     R2                      ; 687F   009A
L_6880:
        MVO     R2,     G_0167                  ; 6880   0242 0167
        ADDI    #$0002, R5                      ; 6882   02FD 0002
        CMPR    R4,     R5                      ; 6884   0165
        BLE     L_6888                          ; 6885   0206 0001

        MOVR    R4,     R5                      ; 6887   00A5
L_6888:
        MVO     R5,     G_0168                  ; 6888   0245 0168
        B       L_685F                          ; 688A   0220 002C

        MVI     G_0180, R1                      ; 688C   0281 0180
        ANDI    #$007F, R1                      ; 688E   03B9 007F
        BEQ     L_68A0                          ; 6890   0204 000E

        CMPI    #$0040, R1                      ; 6892   0379 0040
        BGE     L_68A0                          ; 6894   020D 000A

        MVI     G_0183, R0                      ; 6896   0280 0183
        MVO     R0,     G_01EC                  ; 6898   0240 01EC
        MVO     R1,     G_0180                  ; 689A   0241 0180

        JSR     R5,     .EXEC.A61               ; 689C   0004 0118 0261

        ADCR    R0                              ; 689F   0028
L_68A0:
        CLRR    R0                              ; 68A0   01C0
        MVO     R0,     G_0180                  ; 68A1   0240 0180
        MVI     G_0181, R1                      ; 68A3   0281 0181
        CMP     G_0183, R1                      ; 68A5   0341 0183
        BEQ     L_685A                          ; 68A7   0224 004E

        MVO     R1,     G_0183                  ; 68A9   0241 0183
        MVI     G_0182, R1                      ; 68AB   0281 0182
        MOVR    R1,     R2                      ; 68AD   008A
        XOR     G_0184, R2                      ; 68AE   03C2 0184
        ANDI    #$0001, R2                      ; 68B0   03BA 0001
        XORI    #$0001, R2                      ; 68B2   03FA 0001
        XOR     G_018E, R2                      ; 68B4   03C2 018E
        MVO     R2,     G_018E                  ; 68B6   0242 018E
        MVO     R1,     G_0184                  ; 68B8   0241 0184
        J       L_5160                          ; 68BA   0004 0350 0160

        MVI     G_0180, R1                      ; 68BD   0281 0180
        ANDI    #$00BF, R1                      ; 68BF   03B9 00BF
        BNEQ    L_6B86                          ; 68C1   020C 02C3

        MVI     G_0160, R1                      ; 68C3   0281 0160
        CMPI    #$0003, R1                      ; 68C5   0379 0003
        BNEQ    L_6B86                          ; 68C7   020C 02BD

        MVII    #$0080, R1                      ; 68C9   02B9 0080
        MVII    #$0010, R0                      ; 68CB   02B8 0010

        JSR     R5,     X_RAND1                 ; 68CD   0004 0114 027D

        MVO     R0,     G_035C                  ; 68D0   0240 035C
        CLRR    R5                              ; 68D2   01ED
        MVO     R5,     G_017F                  ; 68D3   0245 017F
        B       L_6B9E                          ; 68D5   0200 02C7

L_68D7:
        PSHR    R5                              ; 68D7   0275
L_68D8:
        MVO     R0,     G_018D                  ; 68D8   0240 018D

        JSR     R5,     L_5262                  ; 68DA   0004 0150 0262

        MVI     G_018D, R1                      ; 68DD   0281 018D
        ADD     G_0184, R1                      ; 68DF   02C1 0184
        ANDI    #$0003, R1                      ; 68E1   03B9 0003
        MVO     R1,     G_0184                  ; 68E3   0241 0184
        MVII    #$0002, R1                      ; 68E5   02B9 0002

        JSR     R5,     L_522B                  ; 68E7   0004 0150 022B
        JSR     R5,     L_5843                  ; 68EA   0004 0158 0043

        MVI     G_0175, R1                      ; 68ED   0281 0175
        DECR    R1                              ; 68EF   0011
        BMI     L_6B86                          ; 68F0   020B 0294

        MOVR    R1,     R3                      ; 68F2   008B

        JSR     R5,     L_633C                  ; 68F3   0004 0160 033C

        CMPI    #$001A, R3                      ; 68F6   037B 001A
        BLE     L_6A97                          ; 68F8   0206 019D

        CMPI    #$006F, R3                      ; 68FA   037B 006F
        BLT     L_6B86                          ; 68FC   0205 0288

        CMPI    #$00A5, R3                      ; 68FE   037B 00A5
        BGE     L_6918                          ; 6900   020D 0016

        CMPI    #$0080, R3                      ; 6902   037B 0080
        BGT     L_6B86                          ; 6904   020E 0280

        INCR    R2                              ; 6906   000A
        ADDR    R7,     R2                      ; 6907   00FA
        ADD@    R2,     R7                      ; 6908   02D7

        ADDR    R4,     R0                      ; 6909   00E0
        ADDR    R1,     R3                      ; 690A   00CB
        MOVR    R6,     R1                      ; 690B   00B1
        TSTR    R5                              ; 690C   00AD
        MOVR    R3,     R7                      ; 690D   009F

        MOVR    R2,     R5                      ; 690E   0095
        MOVR    R0,     R5                      ; 690F   0085
        SAR     R1,     1                       ; 6910   0069
        RLC     R2,     2                       ; 6911   0056
        COMR    R4                              ; 6912   001C
        INCR    R3                              ; 6913   000B
        MVO     R3,     G_017E                  ; 6914   0243 017E
        B       L_69E5                          ; 6916   0200 00CD

L_6918:
        MOVR    R2,     R4                      ; 6918   0094
        MVI     G_016F, R1                      ; 6919   0281 016F

        JSR     R5,     L_633C                  ; 691B   0004 0160 033C

        CMPR    R4,     R2                      ; 691E   0162
        BGE     L_6923                          ; 691F   020D 0002

        MVO     R3,     G_016F                  ; 6921   0243 016F
L_6923:
        B       L_69E5                          ; 6923   0200 00C0

        MVI     G_0180, R0                      ; 6925   0280 0180
        ANDI    #$00BF, R0                      ; 6927   03B8 00BF
        BNEQ    L_6B86                          ; 6929   020C 025B

        MVII    #$0006, R2                      ; 692B   02BA 0006
        MVI     G_0160, R1                      ; 692D   0281 0160
        DECR    R1                              ; 692F   0011
        BMI     L_6B86                          ; 6930   020B 0254

        CMPI    #$0003, R1                      ; 6932   0379 0003
        BLT     L_6A96                          ; 6934   0205 0160

        CMPI    #$004A, R1                      ; 6936   0379 004A
        BLE     L_6944                          ; 6938   0206 000A

        CMPI    #$005D, R1                      ; 693A   0379 005D
        BLT     L_6A96                          ; 693C   0205 0158

        CMPI    #$006E, R1                      ; 693E   0379 006E
        BGT     L_6A96                          ; 6940   020E 0154

        MVII    #$0003, R2                      ; 6942   02BA 0003
L_6944:
        PSHR    R2                              ; 6944   0272

        JSR     R5,     X_DIV                   ; 6945   0004 011C 01FB

        PULR    R2                              ; 6948   02B2
        CMPI    #$0002, R1                      ; 6949   0379 0002
        BEQ     L_6A96                          ; 694B   0204 0149

        CMPI    #$0002, R1                      ; 694D   0379 0002
        BLT     L_6952                          ; 694F   0205 0001

        INCR    R0                              ; 6951   0008
L_6952:
        MOVR    R2,     R1                      ; 6952   0091

        JSR     R5,     X_MPY                   ; 6953   0004 011C 01DC

        ADDI    #$0003, R2                      ; 6956   02FA 0003
        MVO     R2,     G_0160                  ; 6958   0242 0160

        JSR     R5,     L_6BCE                  ; 695A   0004 0168 03CE

        B       L_6A42                          ; 695D   0200 00E3

        MVI     G_0135, R0                      ; 695F   0280 0135
        ANDI    #$00FB, R0                      ; 6961   03B8 00FB
        XORI    #$0004, R0                      ; 6963   03F8 0004
        MVO     R0,     G_0135                  ; 6965   0240 0135
        MVII    #$000E, R0                      ; 6967   02B8 000E

        JSR     R5,     X_RAND1                 ; 6969   0004 0114 027D

        INCR    R0                              ; 696C   0008
        MVO     R0,     G_0334                  ; 696D   0240 0334

        JSR     R5,     L_6BCF                  ; 696F   0004 0168 03CF
        JSR     R5,     L_6BCE                  ; 6972   0004 0168 03CE

        MVI     G_0184, R1                      ; 6975   0281 0184
        SDBD                                    ; 6977   0001
        ADDI    #$5212, R1                      ; 6978   02F9 0012 0052
        MVI     G_0183, R3                      ; 697B   0283 0183
        ADD@    R1,     R3                      ; 697D   02CB
        MOVR    R3,     R1                      ; 697E   0099
        ANDI    #$000F, R1                      ; 697F   03B9 000F
        CMPI    #$000B, R1                      ; 6981   0379 000B
        BGT     L_6B86                          ; 6983   020E 0201

        ANDI    #$00F0, R3                      ; 6985   03BB 00F0
        CMPI    #$00B0, R3                      ; 6987   037B 00B0
        BGT     L_6B86                          ; 6989   020E 01FB
        J       L_5172                          ; 698B   0004 0350 0172

        MVI     G_0169, R1                      ; 698E   0281 0169
        SLL     R1,     1                       ; 6990   0049
        MVI     G_016A, R0                      ; 6991   0280 016A
        SLR     R0,     1                       ; 6993   0060
        MVO     R1,     G_0167                  ; 6994   0241 0167
        MVO     R1,     G_016A                  ; 6996   0241 016A
L_6998:
        MVO     R0,     G_0168                  ; 6998   0240 0168
        MVO     R0,     G_0169                  ; 699A   0240 0169
        B       L_69DC                          ; 699C   0200 003E

        MVI     G_0169, R0                      ; 699E   0280 0169
        ADDI    #$000A, R0                      ; 69A0   02F8 000A

        JSR     R5,     .EXEC.673               ; 69A2   0004 0114 0273

        SLR     R3,     1                       ; 69A5   0063
        B       L_6998                          ; 69A6   0220 000F

        MVI     G_016A, R0                      ; 69A8   0280 016A
        ADDI    #$000A, R0                      ; 69AA   02F8 000A

        JSR     R5,     .EXEC.673               ; 69AC   0004 0114 0273

        ADDR    R0,     R7                      ; 69AF   00C7

        MVO     R0,     G_0167                  ; 69B0   0240 0167
        MVO     R0,     G_016A                  ; 69B2   0240 016A
        B       L_69DC                          ; 69B4   0200 0026

        MVII    #$0002, R2                      ; 69B6   02BA 0002
        B       L_69BC                          ; 69B8   0200 0002

        MVII    #$0001, R2                      ; 69BA   02BA 0001
L_69BC:
        MOVR    R2,     R3                      ; 69BC   0093
        COMR    R3                              ; 69BD   001B
        MVI     G_0180, R0                      ; 69BE   0280 0180
        ANDI    #$00BF, R0                      ; 69C0   03B8 00BF
        BNEQ    L_6B86                          ; 69C2   020C 01C2

        MVI     G_0135, R0                      ; 69C4   0280 0135
        ANDR    R3,     R0                      ; 69C6   0198
        ADDR    R2,     R0                      ; 69C7   00D0
        MVO     R0,     G_0135                  ; 69C8   0240 0135
        MVII    #$000E, R0                      ; 69CA   02B8 000E

        JSR     R5,     X_RAND1                 ; 69CC   0004 0114 027D

        INCR    R0                              ; 69CF   0008
        MVO     R0,     G_0334                  ; 69D0   0240 0334
        B       L_69DC                          ; 69D2   0200 0008

        MVI     G_016A, R1                      ; 69D4   0281 016A
        MVO     R1,     G_0167                  ; 69D6   0241 0167
        MVI     G_0169, R1                      ; 69D8   0281 0169
        MVO     R1,     G_0168                  ; 69DA   0241 0168

L_69DC:
        JSR     R5,     L_6BCE                  ; 69DC   0004 0168 03CE

        MVI     G_0180, R0                      ; 69DF   0280 0180
        ANDI    #$007F, R0                      ; 69E1   03B8 007F
        MVO     R0,     G_0180                  ; 69E3   0240 0180
L_69E5:
        CLRR    R1                              ; 69E5   01C9
        MVO     R1,     G_0175                  ; 69E6   0241 0175
        PULR    R7                              ; 69E8   02B7

        MVI     G_0180, R2                      ; 69E9   0282 0180
        ANDI    #$00BF, R2                      ; 69EB   03BA 00BF
        BNEQ    L_6B86                          ; 69ED   020C 0197

        DECR    R1                              ; 69EF   0011
        MVI@    R1,     R3                      ; 69F0   028B
        ANDI    #$0003, R3                      ; 69F1   03BB 0003
        MVI     G_0160, R1                      ; 69F3   0281 0160
        DECR    R1                              ; 69F5   0011
        BMI     L_6A96                          ; 69F6   020B 009E

        CMPI    #$004B, R1                      ; 69F8   0379 004B
        BLT     L_6A96                          ; 69FA   0205 009A

        CMPI    #$0053, R1                      ; 69FC   0379 0053
        BGT     L_6A96                          ; 69FE   020E 0096

        JSR     R5,     L_633C                  ; 6A00   0004 0160 033C

        DECR    R1                              ; 6A03   0011
        MVI@    R1,     R1                      ; 6A04   0289
        ANDI    #$0003, R1                      ; 6A05   03B9 0003
        CMPR    R1,     R3                      ; 6A07   014B
        BGT     L_6A96                          ; 6A08   020E 008C

        MOVR    R2,     R3                      ; 6A0A   0093
L_6A0B:
        MVII    #$0027, R0                      ; 6A0B   02B8 0027

        JSR     R5,     X_RAND2                 ; 6A0D   0004 0114 029E

        ADDI    #$005D, R0                      ; 6A10   02F8 005D
        CMPI    #$0080, R0                      ; 6A12   0378 0080
        BLE     L_6A18                          ; 6A14   0206 0002

        ADDI    #$0030, R0                      ; 6A16   02F8 0030
L_6A18:
        MOVR    R0,     R1                      ; 6A18   0081
        CMPI    #$007E, R1                      ; 6A19   0379 007E
        BGE     L_6A2A                          ; 6A1B   020D 000D

        CMPI    #$006F, R1                      ; 6A1D   0379 006F
        BLT     L_6A2A                          ; 6A1F   0205 0009

        MVII    #$0001, R0                      ; 6A21   02B8 0001

        JSR     R5,     X_RAND1                 ; 6A23   0004 0114 027D

        TSTR    R0                              ; 6A26   0080
        BEQ     L_6A0B                          ; 6A27   0224 001D

        MOVR    R1,     R0                      ; 6A29   0088

L_6A2A:
        JSR     R5,     L_633C                  ; 6A2A   0004 0160 033C

        MVI@    R1,     R2                      ; 6A2D   028A
        ANDI    #$000F, R2                      ; 6A2E   03BA 000F
        MVI     G_0135, R5                      ; 6A30   0285 0135
        ANDI    #$0001, R5                      ; 6A32   03BD 0001
        BEQ     L_6A38                          ; 6A34   0204 0002

        SUBI    #$0007, R2                      ; 6A36   033A 0007
L_6A38:
        CMPR    R2,     R3                      ; 6A38   0153
        BLT     L_6A0B                          ; 6A39   0225 002F

        INCR    R0                              ; 6A3B   0008
        CMP     G_0175, R0                      ; 6A3C   0340 0175
        BEQ     L_6A0B                          ; 6A3E   0224 0034

        MVO     R0,     G_0160                  ; 6A40   0240 0160
L_6A42:
        MVI     G_0183, R1                      ; 6A42   0281 0183

        JSR     R5,     L_586F                  ; 6A44   0004 0158 006F

        DECR    R5                              ; 6A47   0015
        BPL     L_6A59                          ; 6A48   0203 000F

        MVII    #$01A5, R5                      ; 6A4A   02BD 01A5
L_6A4C:
        MVI@    R5,     R3                      ; 6A4C   02AB
        TSTR    R3                              ; 6A4D   009B
        BEQ     L_6A56                          ; 6A4E   0204 0006

        INCR    R5                              ; 6A50   000D
        CMPI    #$01DB, R5                      ; 6A51   037D 01DB
        BLE     L_6A4C                          ; 6A53   0226 0008
        PULR    R7                              ; 6A55   02B7

L_6A56:
        SUBI    #$0002, R5                      ; 6A56   033D 0002
        MVO@    R1,     R5                      ; 6A58   0269
L_6A59:
        MVI     G_0160, R2                      ; 6A59   0282 0160
        MVO@    R2,     R5                      ; 6A5B   026A
        CMPI    #$00B2, R2                      ; 6A5C   037A 00B2
        BLT     L_6A96                          ; 6A5E   0205 0036

        CLRR    R0                              ; 6A60   01C0
        DECR    R5                              ; 6A61   0015
        MVO@    R0,     R5                      ; 6A62   0268
        SLL     R2,     1                       ; 6A63   004A
        SDBD                                    ; 6A64   0001
        ADDI    #$5A29, R2                      ; 6A65   02FA 0029 005A
        MVI@    R2,     R0                      ; 6A68   0290
        SLR     R0,     2                       ; 6A69   0064
        SLR     R0,     2                       ; 6A6A   0064
        MOVR    R0,     R1                      ; 6A6B   0081
        SLR     R1,     1                       ; 6A6C   0061

        JSR     R5,     X_RAND2                 ; 6A6D   0004 0114 029E

        INCR    R0                              ; 6A70   0008
        ADDR    R1,     R0                      ; 6A71   00C8
        NEGR    R0                              ; 6A72   0020
        ADD     G_0167, R0                      ; 6A73   02C0 0167
        BPL     L_6A78                          ; 6A75   0203 0001

        CLRR    R0                              ; 6A77   01C0
L_6A78:
        MVO     R0,     G_0165                  ; 6A78   0240 0165
        MVII    #$0001, R0                      ; 6A7A   02B8 0001
        MVO     R0,     G_0138                  ; 6A7C   0240 0138

        JSR     R5,     L_6C69                  ; 6A7E   0004 016C 0069
        JSR     R5,     .EXEC.A61               ; 6A81   0004 0118 0261

        DECR    R3                              ; 6A84   0013
        MVI     G_0165, R0                      ; 6A85   0280 0165
        MVO     R0,     G_0167                  ; 6A87   0240 0167
        CLRR    R0                              ; 6A89   01C0
        MVO     R0,     G_0160                  ; 6A8A   0240 0160
        MVII    #$032D, R1                      ; 6A8C   02B9 032D
        MVII    #$0048, R0                      ; 6A8E   02B8 0048
        SWAP    R0,     1                       ; 6A90   0040
        MVO     R0,     G_0330                  ; 6A91   0240 0330

        JSR     R5,     L_5C8B                  ; 6A93   0004 015C 008B

L_6A96:
        PULR    R7                              ; 6A96   02B7

L_6A97:
        DECR    R1                              ; 6A97   0011
        MVI@    R1,     R2                      ; 6A98   028A
        SLR     R2,     2                       ; 6A99   0066
        SLR     R2,     2                       ; 6A9A   0066
        ANDI    #$0007, R2                      ; 6A9B   03BA 0007
        ADDI    #$016B, R2                      ; 6A9D   02FA 016B
        INCR    R3                              ; 6A9F   000B
        CMP@    R2,     R3                      ; 6AA0   0353
        BLE     L_6AA4                          ; 6AA1   0206 0001

        MVO@    R3,     R2                      ; 6AA3   0253
L_6AA4:
        B       L_69E5                          ; 6AA4   0220 00C0
        J       L_6517                          ; 6AA6   0004 0364 0117

        MVI     G_0160, R1                      ; 6AA9   0281 0160
        DECR    R1                              ; 6AAB   0011
        BMI     L_6AE1                          ; 6AAC   020B 0033

        CMPI    #$0002, R1                      ; 6AAE   0379 0002
        BEQ     L_6B86                          ; 6AB0   0204 00D4
        BGT     L_6AC7                          ; 6AB2   020E 0013

        ADDI    #$017C, R1                      ; 6AB4   02F9 017C
        MVI@    R1,     R0                      ; 6AB6   0288
        ADDI    #$0009, R0                      ; 6AB7   02F8 0009
        SUB     G_0139, R0                      ; 6AB9   0300 0139
        CMPI    #$0063, R0                      ; 6ABB   0378 0063
        BLE     L_6AC1                          ; 6ABD   0206 0002

        MVII    #$0063, R0                      ; 6ABF   02B8 0063
L_6AC1:
        MVO@    R0,     R1                      ; 6AC1   0248
        CLRR    R0                              ; 6AC2   01C0
        MVO     R0,     G_0160                  ; 6AC3   0240 0160
        B       L_6A42                          ; 6AC5   0220 0084

L_6AC7:
        CMPI    #$005D, R1                      ; 6AC7   0379 005D
        BLT     L_6AE1                          ; 6AC9   0205 0016

        CMPI    #$006F, R1                      ; 6ACB   0379 006F
        BLT     L_6AEA                          ; 6ACD   0205 001B

        CMPI    #$00B0, R1                      ; 6ACF   0379 00B0
        BLE     L_6AE1                          ; 6AD1   0206 000E

        CMPI    #$00B4, R1                      ; 6AD3   0379 00B4
        BNEQ    L_6B86                          ; 6AD5   020C 00AF

        JSR     R5,     L_6C58                  ; 6AD7   0004 016C 0058

        MVII    #$0083, R0                      ; 6ADA   02B8 0083
        MVO     R0,     G_015E                  ; 6ADC   0240 015E
        J       L_67FA                          ; 6ADE   0004 0364 03FA

L_6AE1:
        INCR    R1                              ; 6AE1   0009
        MVI     G_0175, R2                      ; 6AE2   0282 0175
        MVO     R2,     G_0160                  ; 6AE4   0242 0160
        MVO     R1,     G_0175                  ; 6AE6   0241 0175
        B       L_6A42                          ; 6AE8   0220 00A7

L_6AEA:
        JSR     R5,     L_633C                  ; 6AEA   0004 0160 033C

        ADD     G_0354, R2                      ; 6AED   02C2 0354
        MVO     R2,     G_0354                  ; 6AEF   0242 0354
        CLRR    R0                              ; 6AF1   01C0
        MVO     R0,     G_0160                  ; 6AF2   0240 0160
        B       L_6A42                          ; 6AF4   0220 00B3

        MVI     G_0180, R1                      ; 6AF6   0281 0180
        ANDI    #$00BF, R1                      ; 6AF8   03B9 00BF
        BNEQ    L_6B86                          ; 6AFA   020C 008A

        MVI     G_0160, R1                      ; 6AFC   0281 0160
        DECR    R1                              ; 6AFE   0011
        BMI     L_6B0F                          ; 6AFF   020B 000E

        CMPI    #$0054, R1                      ; 6B01   0379 0054
        BLT     L_6B0F                          ; 6B03   0205 000A

        CMPI    #$005C, R1                      ; 6B05   0379 005C
        BGT     L_6B0F                          ; 6B07   020E 0006

        JSR     R5,     L_633C                  ; 6B09   0004 0160 033C

        MOVR    R2,     R3                      ; 6B0C   0093
        B       L_6A0B                          ; 6B0D   0220 0103

L_6B0F:
        MVI     G_0135, R3                      ; 6B0F   0283 0135
        SARC    R3,     2                       ; 6B11   007F
        BOV     L_6B1D                          ; 6B12   0202 0009

        MVI     G_0161, R3                      ; 6B14   0283 0161
        SUBI    #$00C0, R3                      ; 6B16   033B 00C0

        JSR     R5,     L_6FF3                  ; 6B18   0004 016C 03F3

        BEQ     L_6A96                          ; 6B1B   0224 0086

L_6B1D:
        MVI     G_012D, R0                      ; 6B1D   0280 012D
        MOVR    R0,     R1                      ; 6B1F   0081
        ANDI    #$0002, R1                      ; 6B20   03B9 0002
        BEQ     L_6A96                          ; 6B22   0224 008D

        SDBD                                    ; 6B24   0001
        MVII    #$3140, R1                      ; 6B25   02B9 0040 0031
        ANDI    #$0001, R0                      ; 6B28   03B8 0001
        BNEQ    L_6B2E                          ; 6B2A   020C 0002

        XORI    #$0011, R1                      ; 6B2C   03F9 0011
L_6B2E:
        MVII    #$031D, R4                      ; 6B2E   02BC 031D
        MVII    #$0048, R2                      ; 6B30   02BA 0048
L_6B32:
        MVO@    R1,     R4                      ; 6B32   0261
        INCR    R4                              ; 6B33   000C
        MOVR    R2,     R3                      ; 6B34   0093
        SWAP    R3,     1                       ; 6B35   0043
        MVO@    R3,     R4                      ; 6B36   0263
        MVII    #$0025, R3                      ; 6B37   02BB 0025
        SWAP    R3,     1                       ; 6B39   0043
        MVO@    R3,     R4                      ; 6B3A   0263
        CLRR    R3                              ; 6B3B   01DB
        MVO@    R3,     R4                      ; 6B3C   0263
        MVII    #$01F0, R3                      ; 6B3D   02BB 01F0
        MVO@    R3,     R4                      ; 6B3F   0263
        MVII    #$0016, R3                      ; 6B40   02BB 0016
        MVO@    R3,     R4                      ; 6B42   0263
        INCR    R4                              ; 6B43   000C
        ADDI    #$0010, R2                      ; 6B44   02FA 0010
        XORI    #$0200, R1                      ; 6B46   03F9 0200
        CMPI    #$0325, R4                      ; 6B48   037C 0325
        BEQ     L_6B32                          ; 6B4A   0224 0019

        SDBD                                    ; 6B4C   0001
        MVII    #$5C7C, R1                      ; 6B4D   02B9 007C 005C
        DIS                                     ; 6B50   0003
        MVO     R1,     G_031E                  ; 6B51   0241 031E
        MVO     R1,     G_0326                  ; 6B53   0241 0326
        EIS                                     ; 6B55   0002
        CLRR    R0                              ; 6B56   01C0

        JSR     R5,     .EXEC.41C               ; 6B57   0004 0114 001C

        MVII    #$0003, R0                      ; 6B5A   02B8 0003
        MVO     R0,     G_0102                  ; 6B5C   0240 0102
        SLR     R0,     1                       ; 6B5E   0060
        MVO     R0,     G_0138                  ; 6B5F   0240 0138
        MVII    #$00FC, R1                      ; 6B61   02B9 00FC

        JSR     R5,     L_526E                  ; 6B63   0004 0150 026E

        MVII    #$0198, R4                      ; 6B66   02BC 0198
        MVII    #$021C, R3                      ; 6B68   02BB 021C
        MVII    #$0220, R2                      ; 6B6A   02BA 0220
        MVO     R2,     G_0344                  ; 6B6C   0242 0344

        JSR     R5,     L_55AE                  ; 6B6E   0004 0154 01AE

        SDBD                                    ; 6B71   0001
        MVII    #$1E0C, R1                      ; 6B72   02B9 000C 001E
        XOR     G_018E, R1                      ; 6B75   03C1 018E
        MVII    #$0230, R4                      ; 6B77   02BC 0230
L_6B79:
        MVO@    R1,     R4                      ; 6B79   0261
        MVO@    R1,     R4                      ; 6B7A   0261
        MVO@    R1,     R4                      ; 6B7B   0261
        MVO@    R1,     R4                      ; 6B7C   0261
        ADDI    #$0010, R4                      ; 6B7D   02FC 0010
        ADDI    #$0050, R1                      ; 6B7F   02F9 0050
        CMPI    #$0244, R4                      ; 6B81   037C 0244
        BEQ     L_6B79                          ; 6B83   0224 000B
        PULR    R7                              ; 6B85   02B7

L_6B86:
        JSR     R5,     X_PLAY_RAZZ2            ; 6B86   0004 011C 02BD

        PULR    R7                              ; 6B89   02B7

        PSHR    R5                              ; 6B8A   0275
        MVI     G_0180, R1                      ; 6B8B   0281 0180
        ANDI    #$00BF, R1                      ; 6B8D   03B9 00BF
        BNEQ    L_6B86                          ; 6B8F   022C 000A

        TSTR    R0                              ; 6B91   0080
        BMI     L_6B9E                          ; 6B92   020B 000A

        INCR    R0                              ; 6B94   0008
        ANDI    #$000F, R0                      ; 6B95   03B8 000F
        SLR     R0,     2                       ; 6B97   0064
        SDBD                                    ; 6B98   0001
        MVII    #$6BA1, R1                      ; 6B99   02B9 00A1 006B
        ADDR    R0,     R1                      ; 6B9C   00C1
        MVI@    R1,     R1                      ; 6B9D   0289
L_6B9E:
        MVO     R1,     G_018F                  ; 6B9E   0241 018F
        PULR    R7                              ; 6BA0   02B7

        DECLE   $0001,  $0004,  $0003,  $0000   ; 6BA1   0001 0004 0003 0000

        MVI     G_017D, R1                      ; 6BA5   0281 017D
        B       L_6BAB                          ; 6BA7   0200 0002

        MVI     G_017C, R1                      ; 6BA9   0281 017C
L_6BAB:
        DECR    R0                              ; 6BAB   0010
        BMI     L_6BCD                          ; 6BAC   020B 001F

        MOVR    R1,     R0                      ; 6BAE   0088
        BEQ     L_6BCD                          ; 6BAF   0204 001C
        J       L_6C20                          ; 6BB1   0004 036C 0020

        MVII    #$0081, R1                      ; 6BB4   02B9 0081
        TSTR    R0                              ; 6BB6   0080
        BEQ     L_6BC0                          ; 6BB7   0204 0007
        BPL     L_6BC1                          ; 6BB9   0203 0006

        DECR    R1                              ; 6BBB   0011
        ADD     G_015E, R0                      ; 6BBC   02C0 015E
        BPL     L_6BCB                          ; 6BBE   0203 000B
L_6BC0:
        MOVR    R5,     R7                      ; 6BC0   00AF

L_6BC1:
        MVI     G_0138, R2                      ; 6BC1   0282 0138
        ADD     G_018C, R2                      ; 6BC3   02C2 018C
        ADD     G_0180, R2                      ; 6BC5   02C2 0180
        ANDI    #$00BF, R2                      ; 6BC7   03BA 00BF
        BNEQ    L_6BC0                          ; 6BC9   022C 000A

L_6BCB:
        MVO     R1,     G_015E                  ; 6BCB   0241 015E
L_6BCD:
        MOVR    R5,     R7                      ; 6BCD   00AF

L_6BCE:
        PSHR    R5                              ; 6BCE   0275

L_6BCF:
        JSR     R5,     X_PLAY_SFX2             ; 6BCF   0004 0118 03BE
        DECLE   $0082                           ; 6BD2  SFX prio
        DECLE   $0079                           ; 6BD3  SFX data
        DECLE   $03ED                           ; 6BD4  SFX data
        DECLE   $000F,  $03FD                   ; 6BD5  SFX data
        DECLE   $02F5                           ; 6BD7  SFX data
        DECLE   $002E                           ; 6BD8  SFX data
        DECLE   $03EB                           ; 6BD9  SFX data
        DECLE   $03FE                           ; 6BDA  SFX data
        DECLE   $03EB                           ; 6BDB  SFX data
        DECLE   $000F,  $0000                   ; 6BDC  SFX data
        DECLE   $008F,  $003F                   ; 6BDE  SFX data
        DECLE   $02CF                           ; 6BE0  SFX end

L_6BE1:
        PSHR    R5                              ; 6BE1   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BE2   0004 0118 03BE
        DECLE   $0082                           ; 6BE5  SFX prio
        DECLE   $0079                           ; 6BE6  SFX data
        DECLE   $03ED                           ; 6BE7  SFX data
        DECLE   $000F,  $03FD                   ; 6BE8  SFX data
        DECLE   $0275                           ; 6BEA  SFX data
        DECLE   $002E                           ; 6BEB  SFX data
        DECLE   $03EB                           ; 6BEC  SFX data
        DECLE   $03DE                           ; 6BED  SFX data
        DECLE   $008F,  $0017                   ; 6BEE  SFX data
        DECLE   $02CF                           ; 6BF0  SFX end

L_6BF1:
        PSHR    R5                              ; 6BF1   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BF2   0004 0118 03BE
        DECLE   $009E                           ; 6BF5  SFX prio
        DECLE   $0389                           ; 6BF6  SFX data
        DECLE   $0180,  $02C0                   ; 6BF7  SFX data
        DECLE   $0188,  $02F0                   ; 6BF9  SFX data
        DECLE   $0184,  $0320                   ; 6BFB  SFX data
        DECLE   $01DB                           ; 6BFD  SFX data
        DECLE   $0001,  $03D3                   ; 6BFE  SFX data
        DECLE   $003E                           ; 6C00  SFX data
        DECLE   $025D                           ; 6C01  SFX data
        DECLE   $004F,  $000C                   ; 6C02  SFX data
        DECLE   $0077,  $001A,  $006C           ; 6C04  SFX data
        DECLE   $002B                           ; 6C07  SFX data
        DECLE   $0389                           ; 6C08  SFX data
        DECLE   $0023,  $03E4                   ; 6C09  SFX data
        DECLE   $0003,  $0006                   ; 6C0B  SFX data
        DECLE   $02CF                           ; 6C0D  SFX end

        DECLE   $0003,  $0012,  $03CE,  $00DD   ; 6C0E   0003 0012 03CE 00DD
        DECLE   $0003,  $03B8,  $000E,  $0001   ; 6C12   0003 03B8 000E 0001

        NEGR    R3                              ; 6C16   0023
        CMPR    R7,     R3                      ; 6C17   017B
        DIS                                     ; 6C18   0003
        AND@    R4,     R0                      ; 6C19   03A0
UC_6C1A:
        MVII    #$003F, R0                      ; 6C1A  SLIB UCALL target
        ADDI    #$0008, R3                      ; 6C1C   02FB 0008
        MVO@    R0,     R3                      ; 6C1E   0258
        PULR    R7                              ; 6C1F   02B7

L_6C20:
        PSHR    R5                              ; 6C20   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C21   0004 0118 03BE
        DECLE   $0081                           ; 6C24  SFX prio
        DECLE   $03F9,  $000C,  $0060,  $0000   ; 6C25   03F9 000C 0060 0000
        DECLE   $0060,  $006B,  $03E9,  $00B7   ; 6C29   0060 006B 03E9 00B7

        INCR    R3                              ; 6C2D   000B
        ADDR    R0,     R3                      ; 6C2E   00C3
        XOR@    R6,     R4                      ; 6C2F   03F4
        ADD@    R1,     R7                      ; 6C30   02CF

L_6C31:
        PSHR    R5                              ; 6C31   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C32   0004 0118 03BE
        DECLE   $00A0                           ; 6C35  SFX prio
        DECLE   $03C9,  $0200,  $0090,  $0208   ; 6C36   03C9 0200 0090 0208
        DECLE   $0092,  $0001,  $001B,  $003E   ; 6C3A   0092 0001 001B 003E
        DECLE   $00EB,  $0001,  $03FF,  $004E   ; 6C3E   00EB 0001 03FF 004E
        DECLE   $02AB,  $0001                   ; 6C42   02AB 0001

        DECR    R3                              ; 6C44   0013
        AND@    R1,     R6                      ; 6C45   038E
        MVI@    R5,     R3                      ; 6C46   02AB
        ADD@    R1,     R7                      ; 6C47   02CF

L_6C48:
        PSHR    R5                              ; 6C48   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C49   0004 0118 03BE
        DECLE   $00A0                           ; 6C4C  SFX prio
        DECLE   $0389,  $0070,  $0300,  $0078   ; 6C4D   0389 0070 0300 0078
        DECLE   $0320,  $0074,  $0340,  $03FC   ; 6C51   0320 0074 0340 03FC
        DECLE   $03FF,  $000B,  $03CF           ; 6C55   03FF 000B 03CF
L_6C58:
        PSHR    R5                              ; 6C58   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C59   0004 0118 03BE
        DECLE   $00A0                           ; 6C5C  SFX prio

        SUB@    R5,     R7                      ; 6C5D   032F

        DECLE   $0389,  $0050,  $00C0,  $0058   ; 6C5E   0389 0050 00C0 0058
        DECLE   $00CD,  $0054,  $00D8,  $03FC   ; 6C62   00CD 0054 00D8 03FC
        DECLE   $03FF,  $000B,  $03CF           ; 6C66   03FF 000B 03CF
L_6C69:
        PSHR    R5                              ; 6C69   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C6A   0004 0118 03BE
        DECLE   $0084                           ; 6C6D  SFX prio

        CMPI    #$0305, R1                      ; 6C6E   0379 0305
        SAR     R1,     2                       ; 6C70   006D
        MOVR    R1,     R7                      ; 6C71   008F

        SWAP    R3,     2                       ; 6C72   0047
        SARC    R1,     1                       ; 6C73   0079
        XOR@    R6,     R5                      ; 6C74   03F5
        XORI    #$004F, R6                      ; 6C75   03FE 004F
        GSWD    R0                              ; 6C77   0030
        AND@    R1,     R5                      ; 6C78   038D
        SETC                                    ; 6C79   0007
        SWAP    R3,     1                       ; 6C7A   0043
        XOR@    R6,     R0                      ; 6C7B   03F0
        ADD@    R1,     R7                      ; 6C7C   02CF

        PSHR    R5                              ; 6C7D   0275

L_6C7E:
        JSR     R5,     X_PLAY_SFX2             ; 6C7E   0004 0118 03BE
        DECLE   $0083                           ; 6C81  SFX prio
        DECLE   $00AB,  $02A9,  $0060,  $0000   ; 6C82   00AB 02A9 0060 0000
        DECLE   $0064,  $0000                   ; 6C86   0064 0000

        COMR    R4                              ; 6C88   001C
        B       L_6F38                          ; 6C89   0200 02AD

        MVI@    R4,     R5                      ; 6C8B   02A5
        XOR@    R1,     R2                      ; 6C8C   03CA
        INCR    R3                              ; 6C8D   000B
        XOR@    R5,     R3                      ; 6C8E   03EB
        ADD@    R1,     R7                      ; 6C8F   02CF

L_6C90:
        PSHR    R5                              ; 6C90   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C91   0004 0118 03BE
        DECLE   $0084                           ; 6C94  SFX prio
        DECLE   $0309,  $0290,  $0000           ; 6C95   0309 0290 0000

        MVI@    R3,     R0                      ; 6C98   0298
        DECR    R0                              ; 6C99   0010
        MVI@    R2,     R4                      ; 6C9A   0294
        NEGR    R0                              ; 6C9B   0020
        DECR    R1                              ; 6C9C   0011
        SWAP    R3,     1                       ; 6C9D   0043
        SLL     R1,     2                       ; 6C9E   004D
        INCR    R7                              ; 6C9F   000F

        EIS                                     ; 6CA0   0002
L_6CA1:
        SLL     R2,     2                       ; 6CA1   004E
        ANDR    R5,     R3                      ; 6CA2   01AB
        XOR@    R1,     R6                      ; 6CA3   03CE
        DECR    R1                              ; 6CA4   0011
        SLR     R3,     1                       ; 6CA5   0063
        MVO@    R3,     R5                      ; 6CA6   026B
        ADD@    R1,     R7                      ; 6CA7   02CF

        PSHR    R5                              ; 6CA8   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CA9   0004 0118 03BE
        DECLE   $0085                           ; 6CAC  SFX prio
        DECLE   $0009,  $03ED,  $02D0,  $0000   ; 6CAD   0009 03ED 02D0 0000

        ADD@    R3,     R0                      ; 6CB1   02D8
        B       L_6F98                          ; 6CB2   0200 02E4

        DECLE   $0000                           ; 6CB4   0000

        SLL     R2,     2                       ; 6CB5   004E
        XORR    R5,     R3                      ; 6CB6   01EB
        XORI    #$008F, R6                      ; 6CB7   03FE 008F
        SLL     R3,     2                       ; 6CB9   004F
        ADD@    R1,     R7                      ; 6CBA   02CF

        PSHR    R5                              ; 6CBB   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CBC   0004 0118 03BE
        DECLE   $0085                           ; 6CBF  SFX prio

        SARC    R1,     1                       ; 6CC0   0079
        AND@    R1,     R5                      ; 6CC1   038D
        XOR@    R6,     R5                      ; 6CC2   03F5
L_6CC3:
        XORI    #$0097, R6                      ; 6CC3   03FE 0097
        SWAP    R1,     1                       ; 6CC5   0041
        AND@    R5,     R5                      ; 6CC6   03AD
        AND@    R6,     R5                      ; 6CC7   03B5
        XORI    #$0057, R6                      ; 6CC8   03FE 0057
        SWAP    R1,     2                       ; 6CCA   0045
        XOR@    R5,     R5                      ; 6CCB   03ED
        SUB@    R6,     R5                      ; 6CCC   0335
        XORI    #$008F, R6                      ; 6CCD   03FE 008F
L_6CCF:
        DECR    R7                              ; 6CCF   0017
        ADD@    R1,     R7                      ; 6CD0   02CF

L_6CD1:
        PSHR    R5                              ; 6CD1   0275
        MVI     G_015E, R0                      ; 6CD2   0280 015E
        MOVR    R0,     R1                      ; 6CD4   0081
        BNEQ    L_6CDD                          ; 6CD5   020C 0006

        JSR     R5,     L_6103                  ; 6CD7   0004 0160 0103
        JSR     R5,     L_6760                  ; 6CDA   0004 0164 0360

L_6CDD:
        SWAP    R0,     2                       ; 6CDD   0044
        BMI     L_6D3B                          ; 6CDE   020B 005B

        CMPI    #$0004, R1                      ; 6CE0   0379 0004
        BNEQ    L_6CF0                          ; 6CE2   020C 000C

        MVI     G_031D, R0                      ; 6CE4   0280 031D
        SDBD                                    ; 6CE6   0001
        ANDI    #$FFDF, R0                      ; 6CE7   03B8 00DF 00FF
        MVO     R0,     G_031D                  ; 6CEA   0240 031D
        MVII    #$0002, R0                      ; 6CEC   02B8 0002
        MVO     R0,     G_0322                  ; 6CEE   0240 0322
L_6CF0:
        MVI     G_031D, R1                      ; 6CF0   0281 031D
        SDBD                                    ; 6CF2   0001
        XORI    #$1000, R1                      ; 6CF3   03F9 0000 0010
        MVO     R1,     G_031D                  ; 6CF6   0241 031D
        MVI     G_0354, R0                      ; 6CF8   0280 0354
        TSTR    R0                              ; 6CFA   0080
        BEQ     L_6D0B                          ; 6CFB   0204 000E

        MVII    #$0004, R1                      ; 6CFD   02B9 0004
        MVII    #$02AE, R4                      ; 6CFF   02BC 02AE
        MVII    #$0006, R3                      ; 6D01   02BB 0006
        SWAP    R3,     1                       ; 6D03   0043

        JSR     R5,     X_PRNUM_RGT             ; 6D04   0004 0118 00C5

        ADDI    #$0080, R3                      ; 6D07   02FB 0080
        MVO     R3,     .BTAB.B2                ; 6D09   0243 02B2
L_6D0B:
        MVI     G_015F, R1                      ; 6D0B   0281 015F
        SLL     R1,     2                       ; 6D0D   004D
        SLL     R1,     1                       ; 6D0E   0049
        ADDI    #$0025, R1                      ; 6D0F   02F9 0025
        MVI     G_0183, R2                      ; 6D11   0282 0183
        ANDI    #$000F, R2                      ; 6D13   03BA 000F
        ADDR    R2,     R1                      ; 6D15   00D1
        SLR     R2,     2                       ; 6D16   0066
        ADDR    R2,     R1                      ; 6D17   00D1
        SWAP    R1,     1                       ; 6D18   0041
        MVO     R1,     G_031F                  ; 6D19   0241 031F
        MVI     G_0185, R2                      ; 6D1B   0282 0185
        MVI     G_0139, R3                      ; 6D1D   0283 0139
        SLL     R3,     2                       ; 6D1F   004F
        BNEQ    L_6D24                          ; 6D20   020C 0002

        MVII    #$0002, R3                      ; 6D22   02BB 0002
L_6D24:
        CMPR    R2,     R3                      ; 6D24   0153
        BLE     L_6D2D                          ; 6D25   0206 0006

        SLL     R2,     2                       ; 6D27   004E
        ADDI    #$0030, R2                      ; 6D28   02FA 0030
        SWAP    R2,     1                       ; 6D2A   0042
        MVO     R2,     G_0320                  ; 6D2B   0242 0320
L_6D2D:
        MVI     G_015E, R0                      ; 6D2D   0280 015E
        CMPI    #$0003, R0                      ; 6D2F   0378 0003
        BNEQ    L_6D37                          ; 6D31   020C 0004

        MVO     R1,     G_0327                  ; 6D33   0241 0327
        MVO     R2,     G_0328                  ; 6D35   0242 0328

L_6D37:
        JSR     R5,     L_6345                  ; 6D37   0004 0160 0345

        PULR    R7                              ; 6D3A   02B7

L_6D3B:
        CLRR    R1                              ; 6D3B   01C9
        ANDI    #$0007, R0                      ; 6D3C   03B8 0007
        MVO     R0,     G_015E                  ; 6D3E   0240 015E
        BEQ     L_6D55                          ; 6D40   0204 0013

        JSR     R5,     L_52A1                  ; 6D42   0004 0150 02A1

        SDBD                                    ; 6D45   0001
        MVII    #$6DF7, R5                      ; 6D46   02BD 00F7 006D

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6D49   0004 001E 0335

        MVII    #$0006, R1                      ; 6D4C   02B9 0006
        SWAP    R1,     1                       ; 6D4E   0041

        JSR     R5,     L_6D6F                  ; 6D4F   0004 016C 016F
        JSR     R5,     L_6E17                  ; 6D52   0004 016C 0217
L_6D55:
        JSR     R5,     L_52A1                  ; 6D55   0004 0150 02A1

        SDBD                                    ; 6D58   0001
        MVII    #$5093, R5                      ; 6D59   02BD 0093 0050

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6D5C   0004 001E 0335

        MVII    #$0016, R1                      ; 6D5F   02B9 0016
        SWAP    R1,     1                       ; 6D61   0041
        MVII    #$00A0, R0                      ; 6D62   02B8 00A0
        MVII    #$0214, R4                      ; 6D64   02BC 0214

        JSR     R5,     X_FILL_MEM              ; 6D66   0004 0114 0341
        JSR     R5,     L_6D6F                  ; 6D69   0004 016C 016F

        J       L_5160                          ; 6D6C   0004 0350 0160

L_6D6F:
        PSHR    R5                              ; 6D6F   0275
        MVII    #$003C, R0                      ; 6D70   02B8 003C
        MVII    #$02B4, R4                      ; 6D72   02BC 02B4

        JSR     R5,     X_FILL_ZERO             ; 6D74   0004 0114 0338

        MVII    #$02BB, R4                      ; 6D77   02BC 02BB
        MVII    #$0006, R0                      ; 6D79   02B8 0006

        JSR     R5,     X_FILL_MEM              ; 6D7B   0004 0114 0341

        ADDI    #$000E, R4                      ; 6D7E   02FC 000E
        MOVR    R1,     R2                      ; 6D80   008A
        SDBD                                    ; 6D81   0001
        XORI    #$08C0, R2                      ; 6D82   03FA 00C0 0008
        MVO@    R2,     R4                      ; 6D85   0262
        SUBI    #$0008, R2                      ; 6D86   033A 0008
        MVO@    R2,     R4                      ; 6D88   0262
        MVO     R2,     .BTAB.BA                ; 6D89   0242 02BA
        MVO@    R1,     R4                      ; 6D8B   0261
        MVO@    R1,     R4                      ; 6D8C   0261
        SUBI    #$00A0, R2                      ; 6D8D   033A 00A0
        MVO@    R2,     R4                      ; 6D8F   0262
        MVO     R2,     .BTAB.C1                ; 6D90   0242 02C1
        ADDI    #$0008, R2                      ; 6D92   02FA 0008
        MVO@    R2,     R4                      ; 6D94   0262
        CLRR    R4                              ; 6D95   01E4
        CLRR    R2                              ; 6D96   01D2
L_6D97:
        MVO@    R2,     R4                      ; 6D97   0262
        CMPI    #$0008, R4                      ; 6D98   037C 0008
        BLT     L_6D97                          ; 6D9A   0225 0004

        JSR     R5,     .EXEC.7B4               ; 6D9C   0004 0114 03B4
.GFX_LIST_6D9F:
        DECLE   $0001,  $0001                   ; 6D9F   0001 0001

        DIS                                     ; 6DA1   0003
        SETC                                    ; 6DA2   0007
        INCR    R7                              ; 6DA3   000F

        SETC                                    ; 6DA4   0007
L_6DA5:
        SAR     R3,     2                       ; 6DA5   006F
        DECLE   $00FF                           ; 6DA6   00FF

        INCR    R4                              ; 6DA7   000C
        COMR    R0                              ; 6DA8   0018
        GSWD    R0                              ; 6DA9   0030
        GSWD    R0                              ; 6DAA   0030
        GSWD    R0                              ; 6DAB   0030
        GSWD    R0                              ; 6DAC   0030
        COMR    R0                              ; 6DAD   0018
L_6DAE:
        INCR    R4                              ; 6DAE   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00AA   ; 6DB3   0000 0000 0000 00AA
        DECLE   $003F,  $0037,  $0037,  $003F   ; 6DB7   003F 0037 0037 003F
        DECLE   $003E,  $007E,  $007F,  $00FF   ; 6DBB   003E 007E 007F 00FF
        DECLE   $001F,  $001B,  $001B,  $001F   ; 6DBF   001F 001B 001B 001F
        DECLE   $001E,  $001E,  $001F,  $001F   ; 6DC3   001E 001E 001F 001F
        DECLE   $00D5,  $00FF,  $00FF,  $0055   ; 6DC7   00D5 00FF 00FF 0055
        DECLE   $003F,  $001B,  $001B,  $001F   ; 6DCB   003F 001B 001B 001F
        DECLE   $00FF                           ; 6DCF   00FF

        ADDR    R3,     R7                      ; 6DD0   00DF
        ADDR    R3,     R7                      ; 6DD1   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6DD2   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F7                   ; 6DD6   00FF 00F7

        TSTR    R0                              ; 6DD8   0080
        TSTR    R0                              ; 6DD9   0080
        ADDR    R5,     R7                      ; 6DDA   00EF

        DECLE   $00F7,  $0080,  $0080,  $00FF   ; 6DDB   00F7 0080 0080 00FF
        DECLE   $00DF,  $0001,  $0001,  $00F7   ; 6DDF   00DF 0001 0001 00F7
        DECLE   $00EF,  $0001,  $0001,  $00FF   ; 6DE3   00EF 0001 0001 00FF
        DECLE   $00F7                           ; 6DE7   00F7

        TSTR    R0                              ; 6DE8   0080
        TSTR    R0                              ; 6DE9   0080
        ADDR    R5,     R7                      ; 6DEA   00EF

        DECLE   $00F7                           ; 6DEB   00F7

        TSTR    R0                              ; 6DEC   0080
        TSTR    R0                              ; 6DED   0080
        ADDR    R5,     R7                      ; 6DEE   00EF
        ADDR    R3,     R7                      ; 6DEF   00DF

        DECLE   $0001,  $0001,  $00F7,  $00EF   ; 6DF0   0001 0001 00F7 00EF
        DECLE   $0001,  $0001,  $00EF,  $001D   ; 6DF4   0001 0001 00EF 001D
        DECLE   $0001,  $0002,  $0000,  $0203   ; 6DF8   0001 0002 0000 0203
        DECLE   $0040,  $0007,  $00C0,  $0081   ; 6DFC   0040 0007 00C0 0081
        DECLE   $0040,  $0003,  $00C0,  $0002   ; 6E00   0040 0003 00C0 0002
        DECLE   $0001,  $02A2,  $0313,  $0040   ; 6E04   0001 02A2 0313 0040
        DECLE   $0001,  $0040,  $0001,  $0040   ; 6E08   0001 0040 0001 0040
        DECLE   $0085,  $0200,  $021D           ; 6E0C   0085 0200 021D

        CMPR    R0,     R0                      ; 6E0F   0140
        SUB@    R4,     R3                      ; 6E10   0323
        SWAP    R0,     1                       ; 6E11   0040
        ADCR    R5                              ; 6E12   002D
        CMPR    R0,     R0                      ; 6E13   0140
        INCR    R7                              ; 6E14   000F

        ANDR    R0,     R0                      ; 6E15   0180
L_6E16:
        PSHR    R5                              ; 6E16   0275
L_6E17:
        MOVR    R7,     R5                      ; 6E17   00BD
        ADDI    #$0101, R5                      ; 6E18   02FD 0101
        MVII    #$0214, R4                      ; 6E1A   02BC 0214
L_6E1C:
        MVI@    R5,     R0                      ; 6E1C   02A8
        MOVR    R0,     R1                      ; 6E1D   0081
        ANDI    #$001F, R0                      ; 6E1E   03B8 001F
        XORR    R0,     R1                      ; 6E20   01C1
        SLR     R1,     2                       ; 6E21   0065
        SLL     R0,     2                       ; 6E22   004C
        SLL     R0,     1                       ; 6E23   0048
        MVII    #$0001, R2                      ; 6E24   02BA 0001
L_6E26:
        SDBD                                    ; 6E26   0001
        MVII    #$0A03, R3                      ; 6E27   02BB 0003 000A
        CMPI    #$00B0, R0                      ; 6E2A   0378 00B0
        BGE     L_6E59                          ; 6E2C   020D 002B

        CMPI    #$0028, R0                      ; 6E2E   0378 0028
        BLE     L_6E59                          ; 6E30   0206 0027

        SDBD                                    ; 6E32   0001
        MVII    #$0803, R3                      ; 6E33   02BB 0003 0008
        PSHR    R3                              ; 6E36   0273
        MVI     G_015E, R3                      ; 6E37   0283 015E
        CMPI    #$0003, R3                      ; 6E39   037B 0003
        PULR    R3                              ; 6E3B   02B3
        BNEQ    L_6E42                          ; 6E3C   020C 0004

        SDBD                                    ; 6E3E   0001
        MVII    #$2C03, R3                      ; 6E3F   02BB 0003 002C
L_6E42:
        CMPI    #$0038, R0                      ; 6E42   0378 0038
        BLE     L_6E59                          ; 6E44   0206 0013

        ADDI    #$0003, R3                      ; 6E46   02FB 0003
        CMPI    #$0058, R0                      ; 6E48   0378 0058
        BLE     L_6E59                          ; 6E4A   0206 000D

        MVII    #$001E, R3                      ; 6E4C   02BB 001E
        SWAP    R3,     1                       ; 6E4E   0043
        PSHR    R0                              ; 6E4F   0270
        MVI     G_015E, R0                      ; 6E50   0280 015E
        CMPI    #$0003, R0                      ; 6E52   0378 0003
        BNEQ    L_6E58                          ; 6E54   020C 0002

        XORI    #$0006, R3                      ; 6E56   03FB 0006
L_6E58:
        PULR    R0                              ; 6E58   02B0
L_6E59:
        XORR    R0,     R3                      ; 6E59   01C3
        MVO@    R3,     R4                      ; 6E5A   0263
        MOVR    R1,     R0                      ; 6E5B   0088
        DECR    R2                              ; 6E5C   0012
        BEQ     L_6E26                          ; 6E5D   0224 0038

        CMPI    #$028C, R4                      ; 6E5F   037C 028C
        BLT     L_6E1C                          ; 6E61   0225 0046

        MVII    #$0027, R0                      ; 6E63   02B8 0027
        SDBD                                    ; 6E65   0001
        MVII    #$0A0B, R1                      ; 6E66   02B9 000B 000A
        MVO@    R1,     R4                      ; 6E69   0261
        ADDI    #$0020, R1                      ; 6E6A   02F9 0020

        JSR     R5,     X_FILL_MEM              ; 6E6C   0004 0114 0341

        SUBI    #$0018, R1                      ; 6E6F   0339 0018
        MVO     R1,     .BTAB.9F                ; 6E71   0241 029F
        CLRR    R2                              ; 6E73   01D2

L_6E74:
        JSR     R5,     L_6EF2                  ; 6E74   0004 016C 02F2

        ANDI    #$000F, R3                      ; 6E77   03BB 000F
        BEQ     L_6EAA                          ; 6E79   0204 002F

        ADDR    R7,     R1                      ; 6E7B   00F9
        ADDI    #$005E, R1                      ; 6E7C   02F9 005E
        MVI@    R1,     R1                      ; 6E7E   0289
        SWAP    R1,     1                       ; 6E7F   0041
        ADDI    #$0003, R1                      ; 6E80   02F9 0003
        MOVR    R2,     R0                      ; 6E82   0090
        MOVR    R2,     R4                      ; 6E83   0094
        ADDI    #$0268, R4                      ; 6E84   02FC 0268
L_6E86:
        SUBI    #$000B, R0                      ; 6E86   0338 000B
        BMI     L_6E8E                          ; 6E88   020B 0004

        ADDI    #$0009, R4                      ; 6E8A   02FC 0009
        B       L_6E86                          ; 6E8C   0220 0007

L_6E8E:
        PSHR    R1                              ; 6E8E   0271
        MVI     G_0139, R1                      ; 6E8F   0281 0139
        ADDR    R7,     R1                      ; 6E91   00F9
        ADDI    #$004C, R1                      ; 6E92   02F9 004C
        SUB@    R1,     R4                      ; 6E94   030C
        PULR    R1                              ; 6E95   02B1
        CMPI    #$0268, R4                      ; 6E96   037C 0268
        BLT     L_6EAA                          ; 6E98   0205 0010

        ADDI    #$00C8, R1                      ; 6E9A   02F9 00C8
        MOVR    R3,     R0                      ; 6E9C   0098
        SLL     R0,     1                       ; 6E9D   0048
        ANDI    #$0010, R0                      ; 6E9E   03B8 0010
        ADDR    R1,     R0                      ; 6EA0   00C8
        MVO@    R0,     R4                      ; 6EA1   0260
        ADDI    #$0008, R1                      ; 6EA2   02F9 0008
        SLL     R3,     2                       ; 6EA4   004F
        ANDI    #$0010, R3                      ; 6EA5   03BB 0010
        ADDR    R3,     R1                      ; 6EA7   00D9
        MVO@    R1,     R4                      ; 6EA8   0261
        INCR    R2                              ; 6EA9   000A
L_6EAA:
        INCR    R2                              ; 6EAA   000A
        CMPI    #$003C, R2                      ; 6EAB   037A 003C
        BLE     L_6E74                          ; 6EAD   0226 003A

        SDBD                                    ; 6EAF   0001
        MVII    #$5CA9, R2                      ; 6EB0   02BA 00A9 005C
        SDBD                                    ; 6EB3   0001
        MVII    #$1027, R1                      ; 6EB4   02B9 0027 0010
        MVII    #$031D, R4                      ; 6EB7   02BC 031D
        MVO@    R1,     R4                      ; 6EB9   0261
        MVO@    R2,     R4                      ; 6EBA   0262
        CLRR    R0                              ; 6EBB   01C0
        MVO@    R0,     R4                      ; 6EBC   0260
        MVO@    R0,     R4                      ; 6EBD   0260
        MVO@    R0,     R4                      ; 6EBE   0260
        MVO@    R0,     R4                      ; 6EBF   0260
        ADDI    #$0002, R4                      ; 6EC0   02FC 0002
        XORI    #$0021, R1                      ; 6EC2   03F9 0021
        MVO@    R1,     R4                      ; 6EC4   0261
        MVO@    R2,     R4                      ; 6EC5   0262
        MVII    #$0054, R3                      ; 6EC6   02BB 0054
        SWAP    R3,     1                       ; 6EC8   0043
        MVO@    R3,     R4                      ; 6EC9   0263
        MVI     G_0139, R3                      ; 6ECA   0283 0139
        SLL     R3,     2                       ; 6ECC   004F
        BNEQ    L_6ED1                          ; 6ECD   020C 0002

        MVII    #$0002, R3                      ; 6ECF   02BB 0002
L_6ED1:
        SLL     R3,     2                       ; 6ED1   004F
        ADDI    #$002C, R3                      ; 6ED2   02FB 002C
        SWAP    R3,     1                       ; 6ED4   0043
        MVO@    R3,     R4                      ; 6ED5   0263
        MVO@    R0,     R4                      ; 6ED6   0260
        INCR    R0                              ; 6ED7   0008
        MVO@    R0,     R4                      ; 6ED8   0260
        PULR    R7                              ; 6ED9   02B7

        DECLE   $001E,  $001E,  $000A,  $0028   ; 6EDA   001E 001E 000A 0028
        DECLE   $0064,  $0050,  $0028,  $0000   ; 6EDE   0064 0050 0028 0000
L_6EE2:
        MVI     G_0185, R1                      ; 6EE2   0281 0185
        SLR     R1,     1                       ; 6EE4   0061
        MOVR    R1,     R2                      ; 6EE5   008A
        SLL     R1,     1                       ; 6EE6   0049
        ADDR    R1,     R2                      ; 6EE7   00CA
        SLL     R1,     2                       ; 6EE8   004D
        ADDR    R1,     R2                      ; 6EE9   00CA
        ADD     G_015F, R2                      ; 6EEA   02C2 015F
        MVI     G_0139, R1                      ; 6EEC   0281 0139
        ADDR    R7,     R1                      ; 6EEE   00F9
        ADDI    #$0026, R1                      ; 6EEF   02F9 0026
        ADD@    R1,     R2                      ; 6EF1   02CA
L_6EF2:
        PSHR    R5                              ; 6EF2   0275
        CLRR    R3                              ; 6EF3   01DB
        CMPI    #$003D, R2                      ; 6EF4   037A 003D
        BGE     L_6F0C                          ; 6EF6   020D 0014

        MVI     G_033C, R5                      ; 6EF8   0285 033C
        ANDI    #$001C, R5                      ; 6EFA   03BD 001C
        MOVR    R5,     R1                      ; 6EFC   00A9
        SLL     R1,     2                       ; 6EFD   004D
        ADDR    R1,     R5                      ; 6EFE   00CD
        SDBD                                    ; 6EFF   0001
        ADDI    #$6F55, R5                      ; 6F00   02FD 0055 006F
L_6F03:
        MVI@    R5,     R3                      ; 6F03   02AB
        MOVR    R3,     R1                      ; 6F04   0099
        BEQ     L_6F0C                          ; 6F05   0204 0005

        SLR     R1,     2                       ; 6F07   0065
        SLR     R1,     2                       ; 6F08   0065
        CMPR    R1,     R2                      ; 6F09   014A
        BNEQ    L_6F03                          ; 6F0A   022C 0008

L_6F0C:
        MVI     G_033C, R1                      ; 6F0C   0281 033C
        XORR    R2,     R1                      ; 6F0E   01D1
        ADD     G_033C, R1                      ; 6F0F   02C1 033C
        SLR     R1,     2                       ; 6F11   0065
        ANDI    #$0003, R1                      ; 6F12   03B9 0003
        PULR    R7                              ; 6F14   02B7

        DECLE   $0037,  $002C,  $0016,  $0000   ; 6F15   0037 002C 0016 0000

        CMPR    R5,     R2                      ; 6F19   016A
        CMPR    R5,     R1                      ; 6F1A   0169
        CMPR    R5,     R3                      ; 6F1B   016B
        CMPR    R5,     R1                      ; 6F1C   0169
        CMPR    R5,     R3                      ; 6F1D   016B
        CMPR    R5,     R2                      ; 6F1E   016A
        SUBR    R5,     R3                      ; 6F1F   012B
        CMPR    R5,     R3                      ; 6F20   016B
        CMPR    R5,     R2                      ; 6F21   016A
        CMPR    R5,     R0                      ; 6F22   0168
        CMPR    R5,     R3                      ; 6F23   016B
        CMPR    R5,     R3                      ; 6F24   016B
        MVI@    R2,     R0                      ; 6F25   0290
        ANDR    R5,     R5                      ; 6F26   01AD
        ANDR    R5,     R5                      ; 6F27   01AD
        ANDR    R5,     R5                      ; 6F28   01AD
        ANDR    R5,     R5                      ; 6F29   01AD
        MVI@    R2,     R0                      ; 6F2A   0290
        CMPR    R5,     R3                      ; 6F2B   016B
        CMPR    R5,     R3                      ; 6F2C   016B
        SUBR    R5,     R3                      ; 6F2D   012B
        CMPR    R5,     R3                      ; 6F2E   016B
        MVI@    R5,     R7                      ; 6F2F   02AF

        DECLE   $0235                           ; 6F30   0235

        ANDR    R2,     R5                      ; 6F31   0195
        PULR    R1                              ; 6F32   02B1
        BNEQ    L_6CC3                          ; 6F33   022C 0271

        CMPR    R5,     R3                      ; 6F35   016B
        CMPR    R5,     R1                      ; 6F36   0169
        CMPR    R5,     R3                      ; 6F37   016B
L_6F38:
        SUBR    R5,     R3                      ; 6F38   012B
        BGT     L_6DAE                          ; 6F39   022E 018C

        ANDR    R2,     R1                      ; 6F3B   0191
        ANDR    R2,     R1                      ; 6F3C   0191
        PULR    R1                              ; 6F3D   02B1
        MVO@    R4,     R1                      ; 6F3E   024C
        CMPR    R5,     R3                      ; 6F3F   016B
        CMPR    R5,     R3                      ; 6F40   016B
        CMPR    R5,     R1                      ; 6F41   0169
        ADDR    R1,     R3                      ; 6F42   00CB
        MOVR    R4,     R5                      ; 6F43   00A5
        MOVR    R4,     R5                      ; 6F44   00A5
        MOVR    R4,     R5                      ; 6F45   00A5
        MOVR    R4,     R5                      ; 6F46   00A5
        MOVR    R4,     R5                      ; 6F47   00A5
        MOVR    R4,     R5                      ; 6F48   00A5
        SUBR    R4,     R7                      ; 6F49   0127

        DECLE   $016B,  $0060,  $00A4,  $00A5   ; 6F4A   016B 0060 00A4 00A5
        DECLE   $00A5,  $00A5,  $00A5,  $00A5   ; 6F4E   00A5 00A5 00A5 00A5
        DECLE   $00A5,  $0305,  $0017,  $0005   ; 6F52   00A5 0305 0017 0005

        ADCR    R7                              ; 6F56   002F

        SLL     R3,     1                       ; 6F57   004B
L_6F58:
        SAR     R3,     2                       ; 6F58   006F
        MOVR    R0,     R7                      ; 6F59   0087

        DECLE   $00AA,  $00C5,  $00EA,  $011C   ; 6F5A   00AA 00C5 00EA 011C
        DECLE   $0148,  $0184,  $01C5,  $01EA   ; 6F5E   0148 0184 01C5 01EA
        DECLE   $0244,  $0288,  $0305,  $032A   ; 6F62   0244 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6F66   03CC 0000 0000 0005
        DECLE   $002B,  $004E,  $0078,  $00A8   ; 6F6A   002B 004E 0078 00A8
        DECLE   $00C4,  $00FD,  $011E,  $0148   ; 6F6E   00C4 00FD 011E 0148
        DECLE   $0185,  $01AB,  $01C7,  $01EA   ; 6F72   0185 01AB 01C7 01EA
        DECLE   $0244,  $0288,  $0305,  $032A   ; 6F76   0244 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6F7A   03CC 0000 0000 0005
        DECLE   $002B,  $004E,  $0079,  $009E   ; 6F7E   002B 004E 0079 009E
        DECLE   $00C4,  $00F5,  $011A,  $0148   ; 6F82   00C4 00F5 011A 0148
        DECLE   $0184,  $01BC,  $01E8,  $0245   ; 6F86   0184 01BC 01E8 0245
        DECLE   $026F,  $028A,  $0305,  $032A   ; 6F8A   026F 028A 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6F8E   03CC 0000 0000 0005

        ADCR    R3                              ; 6F92   002B
        SWAP    R3,     2                       ; 6F93   0047
        SAR     R3,     1                       ; 6F94   006B
        MOVR    R0,     R7                      ; 6F95   0087

        MOVR    R5,     R2                      ; 6F96   00AA
        ADDR    R0,     R4                      ; 6F97   00C4
L_6F98:
        SUBR    R1,     R4                      ; 6F98   010C
        DECLE   $0148,  $0185,  $01AB,  $01C7   ; 6F99   0148 0185 01AB 01C7
        DECLE   $01EA,  $0244,  $0288,  $0305   ; 6F9D   01EA 0244 0288 0305
        DECLE   $032A,  $03CC,  $0000,  $0000   ; 6FA1   032A 03CC 0000 0000

        COMR    R4                              ; 6FA5   001C
        SLL     R1,     1                       ; 6FA6   0049
        SAR     R3,     2                       ; 6FA7   006F
        MOVR    R0,     R7                      ; 6FA8   0087

        DECLE   $00AA,  $00C5,  $00EE,  $011C   ; 6FA9   00AA 00C5 00EE 011C
        DECLE   $0148,  $0185,  $01AB,  $01C7   ; 6FAD   0148 0185 01AB 01C7
        DECLE   $01EA,  $0244,  $0288,  $0305   ; 6FB1   01EA 0244 0288 0305
        DECLE   $032A,  $03CC,  $0000,  $0000   ; 6FB5   032A 03CC 0000 0000
        DECLE   $0004                           ; 6FB9   0004

        RSWD    R4                              ; 6FBA   003C
        SAR     R1,     2                       ; 6FBB   006D
        MOVR    R1,     R7                      ; 6FBC   008F

        MOVR    R5,     R2                      ; 6FBD   00AA
        ADDR    R0,     R5                      ; 6FBE   00C5
        ADDR    R5,     R7                      ; 6FBF   00EF
        SUBR    R1,     R7                      ; 6FC0   010F
        SUBR    R5,     R7                      ; 6FC1   012F

        DECLE   $014A,  $0185,  $01AB,  $01C7   ; 6FC2   014A 0185 01AB 01C7
        DECLE   $01EA,  $0244,  $0288,  $0305   ; 6FC6   01EA 0244 0288 0305
        DECLE   $032A,  $03CC,  $0000           ; 6FCA   032A 03CC 0000

        DECR    R5                              ; 6FCD   0015
        RSWD    R6                              ; 6FCE   003E
        SLR     R1,     2                       ; 6FCF   0065
        MOVR    R1,     R7                      ; 6FD0   008F

        DECLE   $00AA,  $00D5,  $00FE,  $0125   ; 6FD1   00AA 00D5 00FE 0125
        DECLE   $014A,  $0195,  $01BA,  $01E8   ; 6FD5   014A 0195 01BA 01E8
        DECLE   $025C,  $0288,  $0305,  $032A   ; 6FD9   025C 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0000   ; 6FDD   03CC 0000 0000 0000
        DECLE   $0005                           ; 6FE1   0005

        ADCR    R3                              ; 6FE2   002B
        SLL     R2,     2                       ; 6FE3   004E
        SARC    R1,     2                       ; 6FE4   007D
        MOVR    R3,     R2                      ; 6FE5   009A
        ADDR    R0,     R4                      ; 6FE6   00C4
        ADDR    R6,     R5                      ; 6FE7   00F5
        SUBR    R3,     R7                      ; 6FE8   011F

        DECLE   $013A,  $0184,  $01B5,  $01DA   ; 6FE9   013A 0184 01B5 01DA
        DECLE   $0244,  $027C,  $0305,  $032A   ; 6FED   0244 027C 0305 032A
        DECLE   $03CC,  $0000                   ; 6FF1   03CC 0000
L_6FF3:
        PSHR    R5                              ; 6FF3   0275
        PSHR    R0                              ; 6FF4   0270
        MOVR    R3,     R0                      ; 6FF5   0098

        JSR     R5,     X_CLAMP                 ; 6FF6   0004 0114 0270

        GSWD    R1                              ; 6FF9   0031
        GSWD    R3                              ; 6FFA   0033
        CMPR    R0,     R3                      ; 6FFB   0143
        PULR    R0                              ; 6FFC   02B0
        PULR    R7                              ; 6FFD   02B7

        DECLE   $03FF,  $03FF                   ; 6FFE   03FF 03FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $50B4       <entry>
;;  $50D1       $50CC  
;;  $50F5       $5106  
;;  $5108       $5102  
;;  $5118       <entry> $64B9  
;;  $5152       $5138   $513E  
;;  $5155       $5210  
;;  $5158       $67A4  
;;  $5160       $68BA   $6D6C  
;;  $5166       $512D  
;;  $5172       $698B  
;;  $518A       $5176   $517C   $5182  
;;  $5190       $5127  
;;  $51B0       $519C  
;;  $51CB       $51C4  
;;  $51E7       $51E1  
;;  $51EB       $51E5  
;;  $51F4       $51F1  
;;  $5202       $51FF  
;;  $5206       $51DF  
;;  $5216       $516A  
;;  $522B       $5225   $68E7  
;;  $523D       $525F  
;;  $523E       $523C  
;;  $524F       $5248  
;;  $525A       $525C  
;;  $5261       $511D   $5166   $5170   $5180   $5188   $51B6  
;;  $5262       $5160   $5218   $68DA  
;;  $5265       $5196  
;;  $526C       $5237   $5266  
;;  $526E       $6B63  
;;  $5271       $529E  
;;  $528F       $5283  
;;  $5290       $5298  
;;  $52A1       $55AA   $6D42   $6D55  
;;  $52B1       $52B1  
;;  $52DF       $52CA   $52CE   $52D5   $52DB   $52E9  
;;  $52E4       $52E0  
;;  $52ED       $52EE  
;;  $52F0       $52BD  
;;  $52F2       $5292  
;;  $52FD       $52F8  
;;  $5306       $5302  
;;  $533F       $5331  
;;  $534F       $5343   $534A  
;;  $5354       $5350  
;;  $5360       $5356   $535C  
;;  $5381       $537B  
;;  $5387       $537F  
;;  $538B       $5385  
;;  $5395       $538F  
;;  $53A6       $539B  
;;  $53AE       $53A1   $53AA  
;;  $53C6       $53B9  
;;  $53D5       $53CA  
;;  $53DD       $53C1   $53D0   $53D9  
;;  $53F5       $53E8  
;;  $53FF       $53F9  
;;  $540B       $5405  
;;  $5413       $53F0   $540F  
;;  $5420       $541A  
;;  $542B       $5424  
;;  $5435       $542F  
;;  $543E       $543B  
;;  $5452       $5445  
;;  $545C       $5456  
;;  $5467       $544D   $5462  
;;  $5480       $5472  
;;  $548A       $5484  
;;  $5492       $548F  
;;  $549D       $5498  
;;  $54A5       $5479   $54A1  
;;  $54B7       $54B0  
;;  $54C1       $54BB  
;;  $54D2       $54C7  
;;  $54DA       $54CD   $54D6  
;;  $54E9       $54E3  
;;  $54FA       $54ED  
;;  $5509       $54FE  
;;  $5511       $54F5   $5504   $550D  
;;  $551C       $5516  
;;  $5528       $5521  
;;  $5533       $552C  
;;  $553E       $5526   $5531   $5537  
;;  $5540       $553C  
;;  $5549       $5544  
;;  $5552       $554D  
;;  $555C       $5558  
;;  $5571       $5563  
;;  $5580       $5575  
;;  $558C       $5585  
;;  $5593       $558A   $5590  
;;  $559F       $556B   $557B   $5599  
;;  $55A1       $5269  
;;  $55AE       $5253   $6B6E  
;;  $55AF       $55AD   $55DB  
;;  $55C2       $55D4  
;;  $55D6       $561F  
;;  $55DE       $55BA  
;;  $55E9       $55E5  
;;  $55F0       $561D  
;;  $55FC       $561A  
;;  $5606       $5603  
;;  $5607       $5605  
;;  $5611       $560B  
;;  $5659       $5274  
;;  $5671       $569A  
;;  $5678       $5673  
;;  $5679       $566F  
;;  $5682       $5686  
;;  $5688       $5683  
;;  $5695       $568B  
;;  $570D       $581D   $5828   $5832   $583C  
;;  $571B       $5716  
;;  $5723       $571E  
;;  $572A       $5725  
;;  $572F       $572B  
;;  $5752       $574E   $575B  
;;  $575E       $5760  
;;  $5769       $5766  
;;  $5770       $576A  
;;  $5771       $5744  
;;  $5774       $5740  
;;  $5784       $5786  
;;  $578C       $5753   $5776  
;;  $5792       $5795  
;;  $5794       $5790  
;;  $581A       $567C   $59D8  
;;  $5843       $5163   $51AD   $5228   $68EA  
;;  $5851       $585C  
;;  $5854       $584F  
;;  $586F       $5855   $64D0   $67CC   $6A44  
;;  $5870       $586E  
;;  $5874       $587A  
;;  $5882       $5886  
;;  $5890       $5889  
;;  $5898       $5891  
;;  $589B       $5875  
;;  $589D       $5883  
;;  $58A4       $588E   $5896  
;;  $58C4       $58C0  
;;  $58CF       $58F7  
;;  $58E9       $58D5  
;;  $58EB       $58F2  
;;  $58FD       $5155  
;;  $58FE       $5115  
;;  $5914       $5906   $5911  
;;  $5916       $592D  
;;  $5928       $591B  
;;  $592F       $5941   $594A   $5952  
;;  $5945       $594C  
;;  $594E       $5947  
;;  $595C       $5992   $599B  
;;  $5977       $596B  
;;  $5986       $597A  
;;  $5987       $5965   $596F   $5975   $5978   $5984  
;;  $59A5       $59C1   $59CA   $59E4   $59EF  
;;  $59B2       $59AC  
;;  $59C3       $59BE  
;;  $59E1       $59E7  
;;  $59E6       $59E2  
;;  $59E9       $59D1  
;;  $59F9       $59F5  
;;  $5A01       $59FB  
;;  $5BF2       $5BF2  
;;  $5C86       $67EF  
;;  $5C8B       $67EA   $6A93  
;;  $5D23       $62DF  
;;  $5D24       $5D24  
;;  $5D34       $5D34  
;;  $5D47       $5C55  
;;  $5D54       $5C5C  
;;  $5D6C       $5D6A  
;;  $5D70       $5D6E  
;;  $5D81       $5D7F  
;;  $5D89       $5D87  
;;  $5DA8       $5C60  
;;  $5DB0       $5DAE  
;;  $5E17       $5E15  
;;  $5E51       $5E4F  
;;  $5E82       $5E80  
;;  $5E87       $5E85  
;;  $5E88       $5E86  
;;  $5EA8       $5EA6  
;;  $6103       $6CD7  
;;  $610D       $61AA  
;;  $6153       $614F  
;;  $6165       $6161  
;;  $616F       $6167   $616B  
;;  $6182       $617E  
;;  $6194       $6186  
;;  $6196       $6171  
;;  $619E       $610F   $61E8   $61F0   $626D   $62D5  
;;  $61B2       $61C1  
;;  $61C3       $61A0  
;;  $61DE       $6113  
;;  $61EA       $61E2  
;;  $6233       $6233  
;;  $623C       $6238  
;;  $623E       $624D   $6268  
;;  $6240       $6257  
;;  $6242       $6221   $6226   $623E  
;;  $624B       $6247  
;;  $6266       $6251   $6260  
;;  $626A       $6243  
;;  $627C       $6278  
;;  $62A9       $629F  
;;  $62AB       $62A7  
;;  $62C3       $62BF  
;;  $62D3       $62C9   $62CC  
;;  $633B       $6351   $6363   $6377  
;;  $633C       $6381   $638F   $670F   $68F3   $691B   $6A00   $6A2A   $6AEA  
;;  $633C       $6B09  
;;  $6345       $6107   $6D37  
;;  $6346       $61C3  
;;  $6357       $634B   $634F  
;;  $636B       $635D   $6361  
;;  $637B       $6371   $6375  
;;  $637D       $6387  
;;  $6385       $637F  
;;  $6392       $638D  
;;  $63BC       $63B2   $63B6  
;;  $63DA       $63D4  
;;  $640D       $63FD   $6407  
;;  $6421       $644E  
;;  $6438       $6428   $642E   $6431  
;;  $6448       $6424   $6436  
;;  $645D       <entry>
;;  $6474       $646C  
;;  $6482       $647C  
;;  $6487       $6478   $6480  
;;  $649E       $6491   $6498  
;;  $64AF       $6485   $649C  
;;  $64BF       $6466   $6472   $648D   $64A2   $64A9   $64AD   $6603   $665C  
;;  $64BF       $6662   $6665   $666A   $6676  
;;  $64C0       $6495   $64A6  
;;  $64D6       $64B3   $6545  
;;  $64F2       $64F8  
;;  $64FA       $64F5  
;;  $6508       $650E  
;;  $6510       $650B  
;;  $6517       $6AA6  
;;  $652E       $6528  
;;  $653C       $6534  
;;  $6548       $6540  
;;  $6560       $6556  
;;  $656B       $6566  
;;  $6584       $6575  
;;  $658E       $6582  
;;  $6590       $6580   $658C  
;;  $6592       $6586   $658A  
;;  $659A       $6596  
;;  $65BB       $65B5  
;;  $65C5       $65B9   $65BD  
;;  $65E3       $65CD   $65D5   $65DD  
;;  $65FF       $66F9  
;;  $6611       $660B  
;;  $6616       $651B   $651F   $6530   $653A   $6549   $6552   $655A   $655E  
;;  $6616       $657A  
;;  $661A       $656B  
;;  $6634       $6637  
;;  $663B       $6628  
;;  $6640       $6643  
;;  $6645       $662D   $6631   $6639   $663D  
;;  $664E       $664B  
;;  $6657       $62ED   $6620   $6647   $6652  
;;  $66A0       $6695  
;;  $66A6       $6691   $669E  
;;  $66A8       $668F   $669C   $66A4  
;;  $66E2       $66D4   $66DC  
;;  $6709       $6707  
;;  $671C       $6715  
;;  $6738       $6735  
;;  $6747       $6744  
;;  $674F       $674C  
;;  $6751       $675D  
;;  $6760       $6CDA  
;;  $676A       $6763  
;;  $67A7       $6768  
;;  $67B5       $67AA   $67AE  
;;  $67BF       $67B8  
;;  $67D8       $67D4  
;;  $67E2       $67DD  
;;  $67F2       $67BD   $67C1  
;;  $67F3       $677A   $6782  
;;  $67FA       $6ADE  
;;  $6809       $6807  
;;  $6823       $6821  
;;  $6847       $685D  
;;  $684C       $6818   $6871   $6876  
;;  $6854       $6858  
;;  $685A       $68A7  
;;  $685F       $688A  
;;  $6863       $682E  
;;  $6873       $686E  
;;  $6880       $687D  
;;  $6888       $6885  
;;  $68A0       $6890   $6894  
;;  $68D7       $6833  
;;  $68D8       $6842  
;;  $6918       $6900  
;;  $6923       $691F  
;;  $6944       $6938  
;;  $6952       $694F  
;;  $6998       $69A6  
;;  $69BC       $69B8  
;;  $69DC       $699C   $69B4   $69D2  
;;  $69E5       $6916   $6923   $6AA4  
;;  $6A0B       $6A27   $6A39   $6A3E   $6B0D  
;;  $6A18       $6A14  
;;  $6A2A       $6A1B   $6A1F  
;;  $6A38       $6A34  
;;  $6A42       $695D   $6AC5   $6AE8   $6AF4  
;;  $6A4C       $6A53  
;;  $6A56       $6A4E  
;;  $6A59       $6A48  
;;  $6A78       $6A75  
;;  $6A96       $6934   $693C   $6940   $694B   $69F6   $69FA   $69FE   $6A08  
;;  $6A96       $6A5E   $6B1B   $6B22  
;;  $6A97       $68F8  
;;  $6AA4       $6AA1  
;;  $6AC1       $6ABD  
;;  $6AC7       $6AB2  
;;  $6AE1       $6AAC   $6AC9   $6AD1  
;;  $6AEA       $6ACD  
;;  $6B0F       $6AFF   $6B03   $6B07  
;;  $6B1D       $6B12  
;;  $6B2E       $6B2A  
;;  $6B32       $6B4A  
;;  $6B79       $6B83  
;;  $6B86       $6863   $68C1   $68C7   $68F0   $68FC   $6904   $6929   $6930  
;;  $6B86       $6983   $6989   $69C2   $69ED   $6AB0   $6AD5   $6AFA   $6B8F  
;;  $6B9E       $68D5   $6B92  
;;  $6BAB       $6BA7  
;;  $6BC0       $6BB7   $6BC9  
;;  $6BC1       $6BB9  
;;  $6BCB       $6BBE  
;;  $6BCD       $6BAC   $6BAF  
;;  $6BCE       $520D   $695A   $6972   $69DC  
;;  $6BCF       $696F  
;;  $6BE1       $67B2  
;;  $6BF1       $64B6  
;;  $6C1A       <entry>
;;  $6C20       $6BB1  
;;  $6C31       $67F3  
;;  $6C48       $6791  
;;  $6C58       $6AD7  
;;  $6C69       $6A7E  
;;  $6C7E       $6755  
;;  $6C90       $5112   $5152  
;;  $6CA1       $6C9F  
;;  $6CC3       $6F33  
;;  $6CCF       $6CCF  
;;  $6CD1       <entry> $50F2  
;;  $6CDD       $6CD5  
;;  $6CF0       $6CE2  
;;  $6D0B       $6CFB  
;;  $6D24       $6D20  
;;  $6D2D       $6D25  
;;  $6D37       $6D31  
;;  $6D3B       $6CDE  
;;  $6D55       $6D40  
;;  $6D6F       $6D4F   $6D69  
;;  $6D97       $6D9A  
;;  $6DA5       $6DA3  
;;  $6DAE       $6F39  
;;  $6E16       $6E14  
;;  $6E17       $6D52  
;;  $6E1C       $6E61  
;;  $6E26       $6E5D  
;;  $6E42       $6E3C  
;;  $6E58       $6E54  
;;  $6E59       $6E2C   $6E30   $6E44   $6E4A  
;;  $6E74       $6EAD  
;;  $6E86       $6E8C  
;;  $6E8E       $6E88  
;;  $6EAA       $6E79   $6E98  
;;  $6ED1       $6ECD  
;;  $6EE2       $513A   $589D   $5900  
;;  $6EF2       $6E74  
;;  $6F03       $6F0A  
;;  $6F0C       $6EF6   $6F05  
;;  $6F38       $6C89  
;;  $6F58       $6F56  
;;  $6F98       $6CB2  
;;  $6FF3       $59CE   $6525   $67DA   $6B18  
;; ======================================================================== ;;
