
        ORG     $5000
.HEADER:
        BIDECLE $5D30           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $507E           ; 5004  Ptr: Start of game
        BIDECLE $6DA3           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $505D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $0083           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $006B,  $0064,  $000F,  $0000; 5020  Timer dispatch/interval
        DECLE   $00DC,  $0050,  $0003,  $0000; 5024  Timer dispatch/interval
        DECLE   $00D5,  $006C,  $0001,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

.TITLE:
        DECLE   $0051                           ; 502E  Cartridge year
        STRING  "MINOTAUR"                      ; 502F  Title string
        DECLE   $0000                           ; 5037  

.TITLECODE:
        PSHR    R5                              ; 5038   0275
        MVII    #$0007, R3                      ; 5039   02BB 0007
        CMP     .PSG0.rgt_hand,R3               ; 503B   0343 01FE
        BNEQ    L_505C                          ; 503D   020C 001D

        MVII    #$023D, R4                      ; 503F   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5041   0004 0118 007B
        STRING  "    TJL  Games    "            ; 5044  
        DECLE   $0000                           ; 5056   0000

        MVII    #$001E, R0                      ; 5057   02B8 001E

        JSR     R5,     X_PLAY_CHEER1           ; 5059   0004 011C 02D5

L_505C:
        PULR    R7                              ; 505C   02B7

.GRAM_INIT_505D:
        DECLE   $0028           ; 505D  # of GRAM cards to init
        DECLE   $0001,  $0002   ; 505E  #00   :  Algo #1
        DECLE   $0081,  $0040   ; 5060  #01-01:  GRAM #00-00 --I-
        DECLE   $0281,  $0036   ; 5062  #02   :  Algo #1
        DECLE   $02FF,  $01CE   ; 5064  #03   :  Algo #1
        DECLE   $02FF,  $01C6   ; 5066  #04   :  Algo #1
        DECLE   $02E1,  $0066   ; 5068  #05   :  Algo #1
        DECLE   $02B9,  $0006   ; 506A  #06   :  Algo #1
        DECLE   $0281,  $01DE   ; 506C  #07   :  Algo #1
        DECLE   $02E1,  $006E   ; 506E  #08   :  Algo #1
        DECLE   $02B9,  $000E   ; 5070  #09   :  Algo #1
        DECLE   $0281,  $01D6   ; 5072  #0A   :  Algo #1
        DECLE   $0105,  $03C0   ; 5074  #0B-12:  GRAM #02-09 -Y--
        DECLE   $0115,  $0040   ; 5076  #13-13:  GRAM #0A-0A -Y--
        DECLE   $0201,  $03C0   ; 5078  #14-1B:  GRAM #00-07 X---
        DECLE   $0211,  $03C0   ; 507A  #1C-23:  GRAM #08-0F X---
        DECLE   $0221,  $01C0   ; 507C  #24-27:  GRAM #10-13 X---

.START:
        PSHR    R5                              ; 507E   0275
        MVII    #$0040, R0                      ; 507F   02B8 0040
        MVII    #$031D, R4                      ; 5081   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 5083   0004 0114 0338

        MVII    #$0100, R4                      ; 5086   02BC 0100
        SDBD                                    ; 5088   0001
        MVI@    R4,     R0                      ; 5089   02A0
        MVO     R0,     G_034C                  ; 508A   0240 034C
        MVI     G_035E, R0                      ; 508C   0280 035E
        MVO     R0,     G_033C                  ; 508E   0240 033C
        MVII    #$0006, R0                      ; 5090   02B8 0006
        SUB     G_0103, R0                      ; 5092   0300 0103
        MVO     R0,     G_0139                  ; 5094   0240 0139
        SLL     R0,     1                       ; 5096   0048
        NEGR    R0                              ; 5097   0020
        ADDI    #$0012, R0                      ; 5098   02F8 0012
        MVO     R0,     G_0167                  ; 509A   0240 0167
        MVO     R0,     G_016A                  ; 509C   0240 016A
        SLR     R0,     1                       ; 509E   0060
        MVO     R0,     G_017D                  ; 509F   0240 017D
        MVO     R0,     G_0169                  ; 50A1   0240 0169
        MVO     R0,     G_0165                  ; 50A3   0240 0165
        MVO     R0,     G_017C                  ; 50A5   0240 017C
        MVII    #$0004, R0                      ; 50A7   02B8 0004
        MVO     R0,     G_0103                  ; 50A9   0240 0103
        SLR     R0,     2                       ; 50AB   0064
        MVO     R0,     G_0184                  ; 50AC   0240 0184
        MVII    #$0028, R1                      ; 50AE   02B9 0028
        MVO     R1,     G_0175                  ; 50B0   0241 0175
        MVII    #$0081, R0                      ; 50B2   02B8 0081
        MVO     R0,     G_015E                  ; 50B4   0240 015E

        JSR     R5,     L_6CD5                  ; 50B6   0004 016C 00D5

L_50B9:
        MVII    #$000C, R0                      ; 50B9   02B8 000C

        JSR     R5,     X_RAND2                 ; 50BB   0004 0114 029E

        MOVR    R0,     R1                      ; 50BE   0081
        ADDI    #$0268, R1                      ; 50BF   02F9 0268
        MVI@    R1,     R1                      ; 50C1   0289
        ANDI    #$01F8, R1                      ; 50C2   03B9 01F8
        CMPI    #$00C8, R1                      ; 50C4   0379 00C8
        BEQ     L_50CC                          ; 50C6   0204 0004

        CMPI    #$00D8, R1                      ; 50C8   0379 00D8
        BNEQ    L_50B9                          ; 50CA   022C 0012

L_50CC:
        MVO     R0,     G_015F                  ; 50CC   0240 015F

        JSR     R5,     .EXEC.A61               ; 50CE   0004 0118 0261

        RLC     R0,     1                       ; 50D1   0050
        MVII    #$0080, R0                      ; 50D2   02B8 0080
        MVO     R0,     G_015E                  ; 50D4   0240 015E

        JSR     R5,     L_6C86                  ; 50D6   0004 016C 0086
        JSR     R5,     L_5914                  ; 50D9   0004 0158 0114

L_50DC:
        PSHR    R5                              ; 50DC   0275

        JSR     R5,     .EXEC.4F1               ; 50DD   0004 0114 00F1

        MVI     G_0138, R0                      ; 50E0   0280 0138
        ADD     G_015E, R0                      ; 50E2   02C0 015E
        BNEQ    L_521A                          ; 50E4   020C 0134

        SDBD                                    ; 50E6   0001
        MVII    #$6801, R1                      ; 50E7   02B9 0001 0068
        MVO     R1,     G_035D                  ; 50EA   0241 035D
        ADD     G_018C, R0                      ; 50EC   02C0 018C
        BNEQ    L_5157                          ; 50EE   020C 0067

        MVI     G_018F, R0                      ; 50F0   0280 018F
        MOVR    R0,     R1                      ; 50F2   0081
        SWAP    R1,     2                       ; 50F3   0045
        BPL     L_512D                          ; 50F4   0203 0037

        CLRR    R1                              ; 50F6   01C9
        MVO     R1,     G_018F                  ; 50F7   0241 018F
        MVI     G_0185, R0                      ; 50F9   0280 0185
        INCR    R0                              ; 50FB   0008
        MVO     R0,     G_0185                  ; 50FC   0240 0185
        SARC    R0,     1                       ; 50FE   0078
        BC      L_5119                          ; 50FF   0201 0018

        JSR     R5,     L_6FC9                  ; 5101   0004 016C 03C9

        TSTR    R3                              ; 5104   009B
        BNEQ    L_5119                          ; 5105   020C 0012

        MVI     G_015F, R0                      ; 5107   0280 015F
        MVI     G_0183, R1                      ; 5109   0281 0183
        MOVR    R1,     R3                      ; 510B   008B
        MVII    #$0001, R2                      ; 510C   02BA 0001
        ANDI    #$0002, R1                      ; 510E   03B9 0002
        SUBR    R1,     R2                      ; 5110   010A
        ADDR    R2,     R0                      ; 5111   00D0
        MVO     R0,     G_015F                  ; 5112   0240 015F
        SUBR    R2,     R3                      ; 5114   0113
        SLL     R2,     2                       ; 5115   004E
        SUBR    R2,     R3                      ; 5116   0113
        MVO     R3,     G_0183                  ; 5117   0243 0183

L_5119:
        JSR     R5,     L_6C86                  ; 5119   0004 016C 0086
L_511C:
        JSR     R5,     L_5913                  ; 511C   0004 0158 0113

L_511F:
        MVI     G_0184, R5                      ; 511F   0285 0184
        MVO     R5,     G_0182                  ; 5121   0245 0182
        MVI     G_0183, R5                      ; 5123   0285 0183
        MVO     R5,     G_0181                  ; 5125   0245 0181

L_5127:
        JSR     R5,     L_521B                  ; 5127   0004 0150 021B
        JSR     R5,     L_5857                  ; 512A   0004 0158 0057

L_512D:
        BEQ     L_521A                          ; 512D   0204 00EB

        CMPI    #$0004, R0                      ; 512F   0378 0004
        BNEQ    L_51CF                          ; 5131   020C 009C

        MVI     G_012D, R3                      ; 5133   0283 012D
        ANDI    #$0003, R3                      ; 5135   03BB 0003
        BNEQ    L_521A                          ; 5137   020C 00E1

L_5139:
        MVI     G_0180, R3                      ; 5139   0283 0180
        ANDI    #$0040, R3                      ; 513B   03BB 0040
        BNEQ    L_5151                          ; 513D   020C 0012

        MVI     G_0161, R3                      ; 513F   0283 0161
        CMPI    #$00C0, R3                      ; 5141   037B 00C0
        BLE     L_5151                          ; 5143   0206 000C

        CMPI    #$00F4, R3                      ; 5145   037B 00F4
        BEQ     L_521A                          ; 5147   0204 00D1
        BGT     L_5151                          ; 5149   020E 0006

        MVI     G_0135, R3                      ; 514B   0283 0135
        ANDI    #$0002, R3                      ; 514D   03BB 0002
        BEQ     L_521A                          ; 514F   0204 00C9

L_5151:
        MVI     G_018E, R0                      ; 5151   0280 018E
        XORI    #$0001, R0                      ; 5153   03F8 0001
        MVO     R0,     G_018E                  ; 5155   0240 018E
L_5157:
        MVI     G_018C, R0                      ; 5157   0280 018C
        XORI    #$0001, R0                      ; 5159   03F8 0001
        MVO     R0,     G_018C                  ; 515B   0240 018C

        JSR     R5,     L_521E                  ; 515D   0004 0150 021E

        MVI     G_018C, R0                      ; 5160   0280 018C
        TSTR    R0                              ; 5162   0080
        BEQ     L_5177                          ; 5163   0204 0012

        MVI     G_0184, R1                      ; 5165   0281 0184
        MVO     R1,     G_0182                  ; 5167   0241 0182
        MVI     G_0183, R3                      ; 5169   0283 0183
        MVO     R3,     G_0181                  ; 516B   0243 0181
        SDBD                                    ; 516D   0001
        ADDI    #$51CB, R1                      ; 516E   02F9 00CB 0051
        ADD@    R1,     R3                      ; 5171   02CB
        MVO     R3,     G_0183                  ; 5172   0243 0183

        JSR     R5,     L_5857                  ; 5174   0004 0158 0057

L_5177:
        MVO     R0,     G_0180                  ; 5177   0240 0180
        MVI     G_0160, R5                      ; 5179   0285 0160
        SUBI    #$00F5, R5                      ; 517B   033D 00F5
        BMI     L_521A                          ; 517D   020B 009B

        MVI     G_0183, R2                      ; 517F   0282 0183
        MVII    #$0001, R3                      ; 5181   02BB 0001
        MVI     G_015F, R4                      ; 5183   0284 015F
        SUBI    #$0002, R4                      ; 5185   033C 0002
        CMPI    #$0050, R2                      ; 5187   037A 0050
        MVII    #$005B, R2                      ; 5189   02BA 005B
        BEQ     L_5192                          ; 518B   0204 0005

        INCR    R3                              ; 518D   000B
        MVII    #$0060, R2                      ; 518E   02BA 0060
        ADDI    #$0004, R4                      ; 5190   02FC 0004
L_5192:
        MVO     R2,     G_0183                  ; 5192   0242 0183
        MVO     R3,     G_017F                  ; 5194   0243 017F
        MVO     R4,     G_015F                  ; 5196   0244 015F
        MVI     G_018E, R0                      ; 5198   0280 018E
        XORI    #$0001, R0                      ; 519A   03F8 0001
        MVO     R0,     G_018E                  ; 519C   0240 018E
        MVI     G_016A, R0                      ; 519E   0280 016A
        MVI     G_0167, R1                      ; 51A0   0281 0167
        MVI     G_0165, R2                      ; 51A2   0282 0165
        MVI     G_0169, R3                      ; 51A4   0283 0169
        SUBI    #$0002, R5                      ; 51A6   033D 0002
        BMI     L_51C6                          ; 51A8   020B 001C
        BEQ     L_51B4                          ; 51AA   0204 0008

        ADDR    R2,     R0                      ; 51AC   00D0
        SLR     R2,     1                       ; 51AD   0062
        INCR    R2                              ; 51AE   000A
        ADDR    R3,     R1                      ; 51AF   00D9
        SLR     R3,     1                       ; 51B0   0063
        INCR    R3                              ; 51B1   000B
        B       L_51BE                          ; 51B2   0200 000A

L_51B4:
        SLL     R2,     1                       ; 51B4   004A
        SLR     R0,     1                       ; 51B5   0060
        ADDR    R0,     R2                      ; 51B6   00C2
        SLR     R2,     1                       ; 51B7   0062
        INCR    R0                              ; 51B8   0008
        SLL     R3,     1                       ; 51B9   004B
        SLR     R1,     1                       ; 51BA   0061
        ADDR    R1,     R3                      ; 51BB   00CB
        SLR     R3,     1                       ; 51BC   0063
        INCR    R1                              ; 51BD   0009
L_51BE:
        MVO     R0,     G_016A                  ; 51BE   0240 016A
        MVO     R1,     G_0167                  ; 51C0   0241 0167
        MVO     R2,     G_0165                  ; 51C2   0242 0165
        MVO     R3,     G_0169                  ; 51C4   0243 0169

L_51C6:
        JSR     R5,     L_6BC4                  ; 51C6   0004 0168 03C4

        B       L_511C                          ; 51C9   0220 00AE

        DECLE   $00F0,  $0001,  $0010,  $00FF   ; 51CB   00F0 0001 0010 00FF
L_51CF:
        MVO     R0,     G_018D                  ; 51CF   0240 018D

        JSR     R5,     L_521B                  ; 51D1   0004 0150 021B

        MVI     G_018D, R1                      ; 51D4   0281 018D
        ADD     G_0184, R1                      ; 51D6   02C1 0184
        ANDI    #$0003, R1                      ; 51D8   03B9 0003
        MVO     R1,     G_0184                  ; 51DA   0241 0184
        MVII    #$0005, R1                      ; 51DC   02B9 0005

        JSR     R5,     L_51E4                  ; 51DE   0004 0150 01E4
        JSR     R5,     L_5857                  ; 51E1   0004 0158 0057

L_51E4:
        PSHR    R5                              ; 51E4   0275
        MVI     G_018E, R0                      ; 51E5   0280 018E
        XORI    #$0001, R0                      ; 51E7   03F8 0001
        MVO     R0,     G_018E                  ; 51E9   0240 018E
        MVI     G_0139, R0                      ; 51EB   0280 0139
        SLR     R0,     1                       ; 51ED   0060
        SUBR    R0,     R1                      ; 51EE   0101
        PSHR    R1                              ; 51EF   0271

        JSR     R5,     L_5225                  ; 51F0   0004 0150 0225

        MVII    #$0013, R0                      ; 51F3   02B8 0013
        INCR    R7                              ; 51F5   000F

L_51F6:
        PSHR    R1                              ; 51F6   0271
L_51F7:
        PSHR    R0                              ; 51F7   0270
        MVI     G_018D, R1                      ; 51F8   0281 018D
        MVII    #$0214, R3                      ; 51FA   02BB 0214
        ADDR    R0,     R3                      ; 51FC   00C3
        MVII    #$0190, R4                      ; 51FD   02BC 0190
        ADDR    R0,     R4                      ; 51FF   00C4
        DECR    R1                              ; 5200   0011
        BEQ     L_5208                          ; 5201   0204 0005

        SLL     R0,     1                       ; 5203   0048
        SUBI    #$0013, R0                      ; 5204   0338 0013
        SUBR    R0,     R3                      ; 5206   0103
        SUBR    R0,     R4                      ; 5207   0104
L_5208:
        INCR    R3                              ; 5208   000B
        MVO     R3,     G_0344                  ; 5209   0243 0344
        DECR    R3                              ; 520B   0013

        JSR     R5,     L_555C                  ; 520C   0004 0154 015C

        PULR    R0                              ; 520F   02B0
        PULR    R1                              ; 5210   02B1
        MOVR    R1,     R2                      ; 5211   008A
        SWAP    R2,     1                       ; 5212   0042
L_5213:
        EIS                                     ; 5213   0002
        DECR    R2                              ; 5214   0012
        BNEQ    L_5213                          ; 5215   022C 0003

        DECR    R0                              ; 5217   0010
        BPL     L_51F6                          ; 5218   0223 0023
L_521A:
        PULR    R7                              ; 521A   02B7

L_521B:
        CLRR    R0                              ; 521B   01C0
        MVO     R0,     G_0138                  ; 521C   0240 0138
L_521E:
        PSHR    R5                              ; 521E   0275

        JSR     R5,     L_5225                  ; 521F   0004 0150 0225
        JSR     R5,     L_554F                  ; 5222   0004 0154 014F

L_5225:
        MVII    #$00FF, R1                      ; 5225   02B9 00FF
L_5227:
        PSHR    R5                              ; 5227   0275
        MVII    #$0001, R0                      ; 5228   02B8 0001
L_522A:
        MVO     R0,     G_018B                  ; 522A   0240 018B
        PSHR    R1                              ; 522C   0271

        JSR     R5,     L_5608                  ; 522D   0004 0154 0208

        PULR    R1                              ; 5230   02B1
        MOVR    R1,     R0                      ; 5231   0088
        AND     G_012D, R0                      ; 5232   0380 012D
        MVO     R0,     G_012D                  ; 5234   0240 012D
        PSHR    R1                              ; 5236   0271
        MVII    #$019A, R4                      ; 5237   02BC 019A
        MVI     G_018B, R0                      ; 5239   0280 018B
        TSTR    R0                              ; 523B   0080
        BEQ     L_5248                          ; 523C   0204 000A

        SUBI    #$000A, R4                      ; 523E   033C 000A
        MVI     G_012E, R5                      ; 5240   0285 012E
        MVO     R5,     G_0186                  ; 5242   0245 0186
        MVI     G_0130, R5                      ; 5244   0285 0130
        MVO     R5,     G_0187                  ; 5246   0245 0187
L_5248:
        CLRR    R0                              ; 5248   01C0
L_5249:
        MVI     G_018E, R3                      ; 5249   0283 018E

        JSR     R5,     L_5298                  ; 524B   0004 0150 0298

        INCR    R0                              ; 524E   0008
        CMPI    #$0005, R0                      ; 524F   0378 0005
        BLT     L_5249                          ; 5251   0225 0009

        PULR    R1                              ; 5253   02B1
        MVI     G_018B, R0                      ; 5254   0280 018B
        DECR    R0                              ; 5256   0010
        BEQ     L_522A                          ; 5257   0224 002E
        PULR    R7                              ; 5259   02B7

L_525A:
        PSHR    R5                              ; 525A   0275
        PSHR    R4                              ; 525B   0274
        SDBD                                    ; 525C   0001
        MVII    #$006B, R2                      ; 525D   02BA 006B 0000
        DIS                                     ; 5260   0003
        MVO     R2,     .ISRVEC.0               ; 5261   0242 0100
        SDBD                                    ; 5263   0001
        MVII    #$0052, R2                      ; 5264   02BA 0052 0000
        MVO     R2,     .ISRVEC.1               ; 5267   0242 0101
        EIS                                     ; 5269   0002
L_526A:
        DECR    R7                              ; 526A   0017

        SUBI    #$0008, R6                      ; 526B   033E 0008
        MVII    #$00D1, R2                      ; 526D   02BA 00D1
        MVO     R2,     .ISRVEC.0               ; 526F   0242 0100
        MVII    #$0058, R2                      ; 5271   02BA 0058
        MVO     R2,     .ISRVEC.1               ; 5273   0242 0101
        TSTR    R1                              ; 5275   0089
        BEQ     L_5296                          ; 5276   0204 001E

        CLRR    R4                              ; 5278   01E4
        MVO     R4,     .STIC.VIDEN             ; 5279   0244 0020
        MVII    #$0002, R1                      ; 527B   02B9 0002
        MVII    #$032E, R2                      ; 527D   02BA 032E
        MVI     G_0160, R5                      ; 527F   0285 0160
        DECR    R5                              ; 5281   0015
        BMI     L_5288                          ; 5282   020B 0004

        CMPI    #$00C0, R5                      ; 5284   037D 00C0
        BLT     L_528A                          ; 5286   0205 0002

L_5288:
        MVO@    R4,     R1                      ; 5288   024C
        MVO@    R4,     R2                      ; 5289   0254
L_528A:
        INCR    R1                              ; 528A   0009
        ADDI    #$0008, R2                      ; 528B   02FA 0008
        CMPI    #$0356, R2                      ; 528D   037A 0356
        BLE     L_5288                          ; 528F   0226 0008

        MVII    #$0038, R2                      ; 5291   02BA 0038
L_5293:
        DECR    R2                              ; 5293   0012
        BPL     L_5293                          ; 5294   0223 0002

L_5296:
        PULR    R4                              ; 5296   02B4
        PULR    R7                              ; 5297   02B7

L_5298:
        PSHR    R5                              ; 5298   0275
        PSHR    R0                              ; 5299   0270
        PSHR    R4                              ; 529A   0274
        MVI     G_018B, R1                      ; 529B   0281 018B
        TSTR    R1                              ; 529D   0089
        BNEQ    L_52A3                          ; 529E   020C 0003

        SUBI    #$0004, R0                      ; 52A0   0338 0004
        NEGR    R0                              ; 52A2   0020
L_52A3:
        SLL     R0,     1                       ; 52A3   0048
        MOVR    R0,     R4                      ; 52A4   0084
        MVI     G_018C, R0                      ; 52A5   0280 018C
        DECR    R0                              ; 52A7   0010
        BNEQ    L_52AC                          ; 52A8   020C 0002

        ADDI    #$000A, R4                      ; 52AA   02FC 000A
L_52AC:
        MVII    #$0009, R1                      ; 52AC   02B9 0009
        MOVR    R1,     R2                      ; 52AE   008A
        SDBD                                    ; 52AF   0001
        MVII    #$52CF, R5                      ; 52B0   02BD 00CF 0052
        PSHR    R5                              ; 52B3   0275
        CLRR    R5                              ; 52B4   01ED
        SDBD                                    ; 52B5   0001
        ADDI    #$52BB, R4                      ; 52B6   02FC 00BB 0052
        SDBD                                    ; 52B9   0001
        MVI@    R4,     R7                      ; 52BA   02A7

        DECR    R2                              ; 52BB   0012
        RLC     R0,     2                       ; 52BC   0054
        RLC     R0,     1                       ; 52BD   0050
        RLC     R0,     2                       ; 52BE   0054
        MOVR    R0,     R6                      ; 52BF   0086
        RLC     R0,     2                       ; 52C0   0054
        MOVR    R7,     R6                      ; 52C1   00BE
        RLC     R0,     2                       ; 52C2   0054
        INCR    R1                              ; 52C3   0009
        RLC     R1,     2                       ; 52C4   0055
        COMR    R2                              ; 52C5   001A
        RLC     R3,     1                       ; 52C6   0053
        RLC     R3,     2                       ; 52C7   0057
        RLC     R3,     1                       ; 52C8   0053
        MOVR    R0,     R7                      ; 52C9   0087

        RLC     R3,     1                       ; 52CA   0053
        MOVR    R7,     R5                      ; 52CB   00BD
        RLC     R3,     1                       ; 52CC   0053
        ADDR    R5,     R0                      ; 52CD   00E8
        RLC     R3,     1                       ; 52CE   0053
        MOVR    R3,     R0                      ; 52CF   0098
        ANDI    #$0001, R0                      ; 52D0   03B8 0001
        SLR     R3,     2                       ; 52D2   0067
        XORR    R0,     R3                      ; 52D3   01C3
        MVI     G_018B, R4                      ; 52D4   0284 018B
        TSTR    R4                              ; 52D6   00A4
        BNEQ    L_52E5                          ; 52D7   020C 000C

        PSHR    R2                              ; 52D9   0272
        MOVR    R1,     R2                      ; 52DA   008A
        PULR    R1                              ; 52DB   02B1
        PSHR    R0                              ; 52DC   0270
        MOVR    R5,     R0                      ; 52DD   00A8
        SLR     R0,     1                       ; 52DE   0060
        ADDR    R5,     R5                      ; 52DF   00ED
        ADDR    R0,     R5                      ; 52E0   00C5
        ANDI    #$0003, R5                      ; 52E1   03BD 0003
        MOVR    R3,     R0                      ; 52E3   0098
        PULR    R3                              ; 52E4   02B3
L_52E5:
        PULR    R4                              ; 52E5   02B4
        PSHR    R5                              ; 52E6   0275
        PSHR    R3                              ; 52E7   0273
        MOVR    R5,     R3                      ; 52E8   00AB

        JSR     R5,     L_52F5                  ; 52E9   0004 0150 02F5

        MOVR    R1,     R2                      ; 52EC   008A
        PULR    R0                              ; 52ED   02B0
        PULR    R3                              ; 52EE   02B3
        SLR     R3,     1                       ; 52EF   0063

        JSR     R5,     L_52F5                  ; 52F0   0004 0150 02F5

        PULR    R0                              ; 52F3   02B0
        PULR    R7                              ; 52F4   02B7

L_52F5:
        ANDI    #$0001, R3                      ; 52F5   03BB 0001
        BEQ     L_52FB                          ; 52F7   0204 0002

        MVII    #$0004, R0                      ; 52F9   02B8 0004
L_52FB:
        CMPI    #$0015, R2                      ; 52FB   037A 0015
        BLT     L_5307                          ; 52FD   0205 0008

        ADDI    #$0008, R0                      ; 52FF   02F8 0008
        CMPI    #$001B, R2                      ; 5301   037A 001B
        BLT     L_5307                          ; 5303   0205 0002

        ADDI    #$0010, R0                      ; 5305   02F8 0010
L_5307:
        MVI     G_018B, R3                      ; 5307   0283 018B
        SWAP    R3,     1                       ; 5309   0043
        SLR     R3,     1                       ; 530A   0063
        ADDR    R3,     R0                      ; 530B   00D8
        SLR     R3,     2                       ; 530C   0067
        ADDR    R3,     R0                      ; 530D   00D8
        SLL     R2,     2                       ; 530E   004E
        SDBD                                    ; 530F   0001
        ADDI    #$571A, R2                      ; 5310   02FA 001A 0057
        MVO@    R0,     R4                      ; 5313   0260
        ADDI    #$006F, R4                      ; 5314   02FC 006F
        MVO@    R2,     R4                      ; 5316   0262
        SUBI    #$0070, R4                      ; 5317   033C 0070
        MOVR    R5,     R7                      ; 5319   00AF

        MVII    #$0013, R1                      ; 531A   02B9 0013
        MVII    #$0014, R2                      ; 531C   02BA 0014
        MVI     G_012D, R0                      ; 531E   0280 012D
        ANDI    #$0003, R0                      ; 5320   03B8 0003
        BEQ     L_5328                          ; 5322   0204 0004

        XORI    #$0001, R3                      ; 5324   03FB 0001
        B       L_532E                          ; 5326   0200 0006

L_5328:
        MVI     G_012D, R0                      ; 5328   0280 012D
        ANDI    #$000C, R0                      ; 532A   03B8 000C
        BEQ     L_5332                          ; 532C   0204 0004

L_532E:
        MVII    #$0008, R2                      ; 532E   02BA 0008
        MOVR    R2,     R1                      ; 5330   0091
        PULR    R7                              ; 5331   02B7

L_5332:
        MVI     G_012E, R0                      ; 5332   0280 012E
        ANDI    #$0003, R0                      ; 5334   03B8 0003
        BEQ     L_533C                          ; 5336   0204 0004

        MVII    #$0008, R1                      ; 5338   02B9 0008
        MOVR    R1,     R2                      ; 533A   008A
        PULR    R7                              ; 533B   02B7

L_533C:
        XORI    #$0001, R3                      ; 533C   03FB 0001
        MVI     G_0130, R0                      ; 533E   0280 0130
        ANDI    #$0003, R0                      ; 5340   03B8 0003
        BEQ     L_534E                          ; 5342   0204 000A

        MVII    #$000C, R1                      ; 5344   02B9 000C
        MOVR    R1,     R2                      ; 5346   008A
        ANDI    #$0001, R0                      ; 5347   03B8 0001
        BNEQ    L_5356                          ; 5349   020C 000B

        MVII    #$0019, R1                      ; 534B   02B9 0019
        PULR    R7                              ; 534D   02B7

L_534E:
        MVI     G_0132, R0                      ; 534E   0280 0132
        ANDI    #$000C, R0                      ; 5350   03B8 000C
        BNEQ    L_5356                          ; 5352   020C 0002

        MVII    #$0003, R5                      ; 5354   02BD 0003
L_5356:
        PULR    R7                              ; 5356   02B7

        MVII    #$0011, R1                      ; 5357   02B9 0011
        MVII    #$0012, R2                      ; 5359   02BA 0012
        XORI    #$0001, R3                      ; 535B   03FB 0001
        MVI     G_012F, R0                      ; 535D   0280 012F
        ANDI    #$000C, R0                      ; 535F   03B8 000C
        BEQ     L_536E                          ; 5361   0204 000B

        MVII    #$0006, R1                      ; 5363   02B9 0006
        MVII    #$0007, R2                      ; 5365   02BA 0007
        ANDI    #$0004, R0                      ; 5367   03B8 0004
        BNEQ    L_5386                          ; 5369   020C 001B

        MVII    #$0016, R1                      ; 536B   02B9 0016
        PULR    R7                              ; 536D   02B7

L_536E:
        MVI     G_0130, R0                      ; 536E   0280 0130
        ANDI    #$0003, R0                      ; 5370   03B8 0003
        BEQ     L_537E                          ; 5372   0204 000A

        MVII    #$000C, R1                      ; 5374   02B9 000C
        MOVR    R1,     R2                      ; 5376   008A
        ANDI    #$0001, R0                      ; 5377   03B8 0001
        BNEQ    L_5386                          ; 5379   020C 000B

        MVII    #$0019, R2                      ; 537B   02BA 0019
        PULR    R7                              ; 537D   02B7

L_537E:
        MVI     G_0132, R0                      ; 537E   0280 0132
        ANDI    #$000C, R0                      ; 5380   03B8 000C
        BNEQ    L_5386                          ; 5382   020C 0002

        MVII    #$0003, R5                      ; 5384   02BD 0003
L_5386:
        PULR    R7                              ; 5386   02B7

        MVII    #$000F, R1                      ; 5387   02B9 000F
        MVII    #$0010, R2                      ; 5389   02BA 0010
        XORI    #$0001, R3                      ; 538B   03FB 0001
        MVI     G_012F, R0                      ; 538D   0280 012F
        ANDI    #$000C, R0                      ; 538F   03B8 000C
        BEQ     L_539E                          ; 5391   0204 000B

        MVII    #$0004, R1                      ; 5393   02B9 0004
        MVII    #$0005, R2                      ; 5395   02BA 0005
        ANDI    #$0004, R0                      ; 5397   03B8 0004
        BNEQ    L_53BC                          ; 5399   020C 0021

        MVII    #$0015, R2                      ; 539B   02BA 0015
        PULR    R7                              ; 539D   02B7

L_539E:
        MVI     G_0130, R0                      ; 539E   0280 0130
        ANDI    #$0003, R0                      ; 53A0   03B8 0003
        BEQ     L_53A8                          ; 53A2   0204 0004

        MVII    #$000C, R1                      ; 53A4   02B9 000C
        MOVR    R1,     R2                      ; 53A6   008A
        PULR    R7                              ; 53A7   02B7

L_53A8:
        XORI    #$0001, R3                      ; 53A8   03FB 0001
        MVI     G_0132, R0                      ; 53AA   0280 0132
        ANDI    #$0003, R0                      ; 53AC   03B8 0003
        BEQ     L_53B4                          ; 53AE   0204 0004

        MVII    #$000A, R1                      ; 53B0   02B9 000A
        MOVR    R1,     R2                      ; 53B2   008A
        PULR    R7                              ; 53B3   02B7

L_53B4:
        MVI     G_0134, R0                      ; 53B4   0280 0134
        ANDI    #$000C, R0                      ; 53B6   03B8 000C
        BNEQ    L_53BC                          ; 53B8   020C 0002

        MVII    #$0003, R5                      ; 53BA   02BD 0003
L_53BC:
        PULR    R7                              ; 53BC   02B7

        MVII    #$000E, R2                      ; 53BD   02BA 000E
        MVI     G_012F, R0                      ; 53BF   0280 012F
        ANDI    #$0003, R0                      ; 53C1   03B8 0003
        BEQ     L_53C9                          ; 53C3   0204 0004

        MVII    #$000C, R1                      ; 53C5   02B9 000C
        MOVR    R1,     R2                      ; 53C7   008A
        PULR    R7                              ; 53C8   02B7

L_53C9:
        MVI     G_0131, R0                      ; 53C9   0280 0131
        ANDI    #$000C, R0                      ; 53CB   03B8 000C
        BEQ     L_53D4                          ; 53CD   0204 0005

        MVII    #$0003, R2                      ; 53CF   02BA 0003
        MVII    #$0002, R1                      ; 53D1   02B9 0002
        PULR    R7                              ; 53D3   02B7

L_53D4:
        MVI     G_0132, R0                      ; 53D4   0280 0132
        ANDI    #$0003, R0                      ; 53D6   03B8 0003
        BEQ     L_53DE                          ; 53D8   0204 0004

        MVII    #$000A, R1                      ; 53DA   02B9 000A
        MOVR    R1,     R2                      ; 53DC   008A
        PULR    R7                              ; 53DD   02B7

L_53DE:
        ADDI    #$0002, R5                      ; 53DE   02FD 0002
        MVI     G_0134, R0                      ; 53E0   0280 0134
        ANDI    #$000C, R0                      ; 53E2   03B8 000C
        BNEQ    L_53E7                          ; 53E4   020C 0001

        INCR    R5                              ; 53E6   000D
L_53E7:
        PULR    R7                              ; 53E7   02B7

        XORI    #$0001, R3                      ; 53E8   03FB 0001
        MVI     G_012F, R0                      ; 53EA   0280 012F
        ANDI    #$0003, R0                      ; 53EC   03B8 0003
        BEQ     L_53FC                          ; 53EE   0204 000C

        XORI    #$0001, R3                      ; 53F0   03FB 0001
        MVII    #$000C, R1                      ; 53F2   02B9 000C
        MOVR    R1,     R2                      ; 53F4   008A
        ANDI    #$0001, R0                      ; 53F5   03B8 0001
        BNEQ    L_5411                          ; 53F7   020C 0018

        MVII    #$0019, R1                      ; 53F9   02B9 0019
        PULR    R7                              ; 53FB   02B7

L_53FC:
        MVI     G_0131, R0                      ; 53FC   0280 0131
        ANDI    #$0003, R0                      ; 53FE   03B8 0003
        BEQ     L_5406                          ; 5400   0204 0004

        MVII    #$000A, R1                      ; 5402   02B9 000A
        MOVR    R1,     R2                      ; 5404   008A
        PULR    R7                              ; 5405   02B7

L_5406:
        MVII    #$0003, R5                      ; 5406   02BD 0003
        MVI     G_0133, R0                      ; 5408   0280 0133
        ANDI    #$000C, R0                      ; 540A   03B8 000C
        BEQ     L_5411                          ; 540C   0204 0003

        DECR    R5                              ; 540E   0015
        MVII    #$0001, R2                      ; 540F   02BA 0001
L_5411:
        PULR    R7                              ; 5411   02B7

        MVII    #$0014, R2                      ; 5412   02BA 0014
        MVII    #$0013, R1                      ; 5414   02B9 0013
        XORI    #$0001, R3                      ; 5416   03FB 0001
        MVI     G_012D, R0                      ; 5418   0280 012D
        ANDI    #$000C, R0                      ; 541A   03B8 000C
        BEQ     L_542A                          ; 541C   0204 000C

        MVII    #$0008, R2                      ; 541E   02BA 0008
        MOVR    R2,     R1                      ; 5420   0091
        ANDI    #$0004, R0                      ; 5421   03B8 0004
        BNEQ    L_544F                          ; 5423   020C 002A

        MVII    #$0017, R1                      ; 5425   02B9 0017
        MVII    #$0018, R2                      ; 5427   02BA 0018
        PULR    R7                              ; 5429   02B7

L_542A:
        MVI     G_012E, R0                      ; 542A   0280 012E
        ANDI    #$0003, R0                      ; 542C   03B8 0003
        BEQ     L_5434                          ; 542E   0204 0004

        MVII    #$000D, R1                      ; 5430   02B9 000D
        MOVR    R1,     R2                      ; 5432   008A
        PULR    R7                              ; 5433   02B7

L_5434:
        MVI     G_0130, R0                      ; 5434   0280 0130
        INCR    R5                              ; 5436   000D
        ANDI    #$000C, R0                      ; 5437   03B8 000C
        BEQ     L_543C                          ; 5439   0204 0001

        DECR    R5                              ; 543B   0015
L_543C:
        XORI    #$0004, R3                      ; 543C   03FB 0004
        MVI     G_0130, R0                      ; 543E   0280 0130
        ANDI    #$0003, R0                      ; 5440   03B8 0003
        BEQ     L_5447                          ; 5442   0204 0003

        MVII    #$000B, R1                      ; 5444   02B9 000B
        PULR    R7                              ; 5446   02B7

L_5447:
        MVI     G_0132, R0                      ; 5447   0280 0132
        ANDI    #$000C, R0                      ; 5449   03B8 000C
        BNEQ    L_544F                          ; 544B   020C 0002

        ADDI    #$0002, R5                      ; 544D   02FD 0002
L_544F:
        PULR    R7                              ; 544F   02B7

        MVII    #$0011, R1                      ; 5450   02B9 0011
        MVII    #$0012, R2                      ; 5452   02BA 0012
        XORI    #$0001, R3                      ; 5454   03FB 0001
        MVI     G_012D, R0                      ; 5456   0280 012D
        ANDI    #$000C, R0                      ; 5458   03B8 000C
        BEQ     L_5461                          ; 545A   0204 0005

        MVII    #$0007, R2                      ; 545C   02BA 0007
        MVII    #$0006, R1                      ; 545E   02B9 0006
        PULR    R7                              ; 5460   02B7

L_5461:
        MVI     G_012E, R0                      ; 5461   0280 012E
        ANDI    #$0003, R0                      ; 5463   03B8 0003
        BEQ     L_546B                          ; 5465   0204 0004

        MVII    #$000D, R1                      ; 5467   02B9 000D
        MOVR    R1,     R2                      ; 5469   008A
        PULR    R7                              ; 546A   02B7

L_546B:
        XORI    #$0001, R3                      ; 546B   03FB 0001
        MVI     G_0130, R0                      ; 546D   0280 0130
        ANDI    #$0003, R0                      ; 546F   03B8 0003
        BEQ     L_547D                          ; 5471   0204 000A

        MVII    #$000B, R1                      ; 5473   02B9 000B
        MOVR    R1,     R2                      ; 5475   008A
        ANDI    #$0001, R0                      ; 5476   03B8 0001
        BNEQ    L_5485                          ; 5478   020C 000B

        MVII    #$001C, R1                      ; 547A   02B9 001C
        PULR    R7                              ; 547C   02B7

L_547D:
        MVI     G_0132, R0                      ; 547D   0280 0132
        ANDI    #$000C, R0                      ; 547F   03B8 000C
        BNEQ    L_5485                          ; 5481   020C 0002

        MVII    #$0003, R5                      ; 5483   02BD 0003
L_5485:
        PULR    R7                              ; 5485   02B7

        MVII    #$000F, R1                      ; 5486   02B9 000F
        MVII    #$0010, R2                      ; 5488   02BA 0010
        MVI     G_012D, R0                      ; 548A   0280 012D
        ANDI    #$0003, R0                      ; 548C   03B8 0003
        BEQ     L_5494                          ; 548E   0204 0004

        MVII    #$000D, R1                      ; 5490   02B9 000D
        MOVR    R1,     R2                      ; 5492   008A
        PULR    R7                              ; 5493   02B7

L_5494:
        MVI     G_012F, R0                      ; 5494   0280 012F
        ANDI    #$000C, R0                      ; 5496   03B8 000C
        BEQ     L_54A5                          ; 5498   0204 000B

        MVII    #$0005, R2                      ; 549A   02BA 0005
        MVII    #$0004, R1                      ; 549C   02B9 0004
        ANDI    #$0004, R0                      ; 549E   03B8 0004
        BNEQ    L_54BD                          ; 54A0   020C 001B

        MVII    #$001B, R1                      ; 54A2   02B9 001B
        PULR    R7                              ; 54A4   02B7

L_54A5:
        MVI     G_0130, R0                      ; 54A5   0280 0130
        ANDI    #$0003, R0                      ; 54A7   03B8 0003
        BEQ     L_54B5                          ; 54A9   0204 000A

        MVII    #$000B, R1                      ; 54AB   02B9 000B
        MOVR    R1,     R2                      ; 54AD   008A
        ANDI    #$0001, R0                      ; 54AE   03B8 0001
        BNEQ    L_54BD                          ; 54B0   020C 000B

        MVII    #$001C, R2                      ; 54B2   02BA 001C
        PULR    R7                              ; 54B4   02B7

L_54B5:
        MVI     G_0132, R0                      ; 54B5   0280 0132
        ANDI    #$000C, R0                      ; 54B7   03B8 000C
        BNEQ    L_54BD                          ; 54B9   020C 0002

        MVII    #$0003, R5                      ; 54BB   02BD 0003
L_54BD:
        PULR    R7                              ; 54BD   02B7

        MVI     G_012D, R0                      ; 54BE   0280 012D
        ANDI    #$0003, R0                      ; 54C0   03B8 0003
        BEQ     L_54C8                          ; 54C2   0204 0004

        MVII    #$000D, R1                      ; 54C4   02B9 000D
        MOVR    R1,     R2                      ; 54C6   008A
        PULR    R7                              ; 54C7   02B7

L_54C8:
        INCR    R5                              ; 54C8   000D
        MVI     G_012F, R0                      ; 54C9   0280 012F
        ANDI    #$000C, R0                      ; 54CB   03B8 000C
        BEQ     L_54D4                          ; 54CD   0204 0005

        DECR    R5                              ; 54CF   0015
        MVII    #$0003, R2                      ; 54D0   02BA 0003
        B       L_54EA                          ; 54D2   0200 0016

L_54D4:
        MVI     G_0130, R0                      ; 54D4   0280 0130
        ANDI    #$0003, R0                      ; 54D6   03B8 0003
        BEQ     L_54DF                          ; 54D8   0204 0005

        DECR    R5                              ; 54DA   0015
        MVII    #$000B, R2                      ; 54DB   02BA 000B
        B       L_54EA                          ; 54DD   0200 000B

L_54DF:
        MVI     G_0132, R0                      ; 54DF   0280 0132
        ANDI    #$0003, R0                      ; 54E1   03B8 0003
        BEQ     L_54EA                          ; 54E3   0204 0005

        DECR    R5                              ; 54E5   0015
        XORI    #$0001, R3                      ; 54E6   03FB 0001
        B       L_54EC                          ; 54E8   0200 0002

L_54EA:
        XORI    #$0004, R3                      ; 54EA   03FB 0004
L_54EC:
        MVI     G_012F, R0                      ; 54EC   0280 012F
        ANDI    #$0003, R0                      ; 54EE   03B8 0003
        BEQ     L_54F5                          ; 54F0   0204 0003

        MVII    #$000B, R1                      ; 54F2   02B9 000B
        PULR    R7                              ; 54F4   02B7

L_54F5:
        MVI     G_0131, R0                      ; 54F5   0280 0131
        ANDI    #$000C, R0                      ; 54F7   03B8 000C
        BEQ     L_54FE                          ; 54F9   0204 0003

        MVII    #$0002, R1                      ; 54FB   02B9 0002
        PULR    R7                              ; 54FD   02B7

L_54FE:
        ADDI    #$0002, R5                      ; 54FE   02FD 0002
        MVI     G_0132, R0                      ; 5500   0280 0132
        ANDI    #$0003, R0                      ; 5502   03B8 0003
        BEQ     L_5508                          ; 5504   0204 0002

        SUBI    #$0002, R5                      ; 5506   033D 0002
L_5508:
        PULR    R7                              ; 5508   02B7

        XORI    #$0001, R3                      ; 5509   03FB 0001
        MVI     G_012D, R0                      ; 550B   0280 012D
        ANDI    #$0003, R0                      ; 550D   03B8 0003
        BEQ     L_551E                          ; 550F   0204 000D

        XORI    #$0001, R3                      ; 5511   03FB 0001
        MVII    #$000D, R1                      ; 5513   02B9 000D
        MOVR    R1,     R2                      ; 5515   008A
        ANDI    #$0001, R0                      ; 5516   03B8 0001
        BNEQ    L_554D                          ; 5518   020C 0033

        MVII    #$001A, R1                      ; 551A   02B9 001A
        MOVR    R1,     R2                      ; 551C   008A
        PULR    R7                              ; 551D   02B7

L_551E:
        MVI     G_012F, R0                      ; 551E   0280 012F
        ANDI    #$0003, R0                      ; 5520   03B8 0003
        BEQ     L_552E                          ; 5522   0204 000A

        MVII    #$000B, R1                      ; 5524   02B9 000B
        MOVR    R1,     R2                      ; 5526   008A
        ANDI    #$0001, R0                      ; 5527   03B8 0001
        BNEQ    L_554D                          ; 5529   020C 0022

        MVII    #$001C, R1                      ; 552B   02B9 001C
        PULR    R7                              ; 552D   02B7

L_552E:
        INCR    R5                              ; 552E   000D
        MVI     G_0131, R0                      ; 552F   0280 0131
        ANDI    #$000C, R0                      ; 5531   03B8 000C
        BEQ     L_553A                          ; 5533   0204 0005

        DECR    R5                              ; 5535   0015
        MVII    #$0001, R2                      ; 5536   02BA 0001
        B       L_5541                          ; 5538   0200 0007

L_553A:
        MVI     G_0132, R0                      ; 553A   0280 0132
        ANDI    #$0003, R0                      ; 553C   03B8 0003
        BEQ     L_5541                          ; 553E   0204 0001

        DECR    R5                              ; 5540   0015
L_5541:
        ADDI    #$0002, R5                      ; 5541   02FD 0002
        MVI     G_0131, R0                      ; 5543   0280 0131
        ANDI    #$0003, R0                      ; 5545   03B8 0003
        BEQ     L_554D                          ; 5547   0204 0004

        SUBI    #$0002, R5                      ; 5549   033D 0002
        XORI    #$0004, R3                      ; 554B   03FB 0004
L_554D:
        PULR    R7                              ; 554D   02B7

        PSHR    R5                              ; 554E   0275
L_554F:
        MVII    #$0228, R3                      ; 554F   02BB 0228
        MVO     R3,     G_0344                  ; 5551   0243 0344
        MVII    #$0190, R4                      ; 5553   02BC 0190
        MVII    #$0214, R3                      ; 5555   02BB 0214
        MOVR    R3,     R1                      ; 5557   0099

        JSR     R5,     L_525A                  ; 5558   0004 0150 025A

        INCR    R7                              ; 555B   000F

L_555C:
        PSHR    R5                              ; 555C   0275
L_555D:
        PSHR    R3                              ; 555D   0273
        MVI@    R4,     R2                      ; 555E   02A2
        ADDI    #$006F, R4                      ; 555F   02FC 006F
        MVI@    R4,     R5                      ; 5561   02A5
        SUBI    #$0070, R4                      ; 5562   033C 0070
        PSHR    R4                              ; 5564   0274
        MOVR    R2,     R1                      ; 5565   0091
        ANDI    #$0018, R1                      ; 5566   03B9 0018
        BNEQ    L_558C                          ; 5568   020C 0022

        SDBD                                    ; 556A   0001
        XORI    #$1E04, R2                      ; 556B   03FA 0004 001E
        MVII    #$0003, R0                      ; 556E   02B8 0003
L_5570:
        MVI@    R5,     R1                      ; 5570   02A9
        MOVR    R1,     R4                      ; 5571   008C
        ANDI    #$001F, R4                      ; 5572   03BC 001F
        XORR    R4,     R1                      ; 5574   01E1
        ADDR    R4,     R4                      ; 5575   00E4
        ADDR    R4,     R4                      ; 5576   00E4
        ADDR    R4,     R4                      ; 5577   00E4
        SLR     R1,     2                       ; 5578   0065
        ADDR    R2,     R1                      ; 5579   00D1
        MVO@    R1,     R3                      ; 557A   0259
        ADDI    #$0014, R3                      ; 557B   02FB 0014
        ADDR    R2,     R4                      ; 557D   00D4
        MVO@    R4,     R3                      ; 557E   025C
        ADDI    #$0014, R3                      ; 557F   02FB 0014
        DECR    R0                              ; 5581   0010
        BPL     L_5570                          ; 5582   0223 0013

L_5584:
        PULR    R4                              ; 5584   02B4
        PULR    R3                              ; 5585   02B3
        INCR    R3                              ; 5586   000B
        CMP     G_0344, R3                      ; 5587   0343 0344
        BLT     L_555D                          ; 5589   0225 002D
        PULR    R7                              ; 558B   02B7

L_558C:
        XORR    R1,     R2                      ; 558C   01CA
        SDBD                                    ; 558D   0001
        MVII    #$55D0, R4                      ; 558E   02BC 00D0 0055
        ANDI    #$0010, R1                      ; 5591   03B9 0010
        BEQ     L_5597                          ; 5593   0204 0002

        ADDI    #$0010, R4                      ; 5595   02FC 0010
L_5597:
        MVII    #$0007, R0                      ; 5597   02B8 0007
        MOVR    R2,     R1                      ; 5599   0091
        ANDR    R0,     R2                      ; 559A   0182
        XORR    R2,     R1                      ; 559B   01D1
        MVO     R1,     G_0189                  ; 559C   0241 0189
L_559E:
        PSHR    R3                              ; 559E   0273
        MVI@    R5,     R1                      ; 559F   02A9
        MOVR    R1,     R3                      ; 55A0   008B
        ANDI    #$001F, R3                      ; 55A1   03BB 001F
        XORR    R3,     R1                      ; 55A3   01D9
        SLL     R3,     2                       ; 55A4   004F
        SLL     R3,     1                       ; 55A5   004B
        SLR     R1,     2                       ; 55A6   0065
        MVO     R3,     G_0188                  ; 55A7   0243 0188
        PULR    R3                              ; 55A9   02B3
L_55AA:
        PSHR    R3                              ; 55AA   0273
        ADD     G_0189, R1                      ; 55AB   02C1 0189
        SDBD                                    ; 55AD   0001
        ADD@    R4,     R1                      ; 55AE   02E1
        MOVR    R1,     R3                      ; 55AF   008B
        ANDI    #$0001, R3                      ; 55B0   03BB 0001
        BNEQ    L_55B5                          ; 55B2   020C 0001

        XORR    R2,     R1                      ; 55B4   01D1
L_55B5:
        SDBD                                    ; 55B5   0001
        CMPI    #$2000, R1                      ; 55B6   0379 0000 0020
        BLT     L_55BF                          ; 55B9   0205 0004

        MOVR    R2,     R3                      ; 55BB   0093
        SWAP    R3,     1                       ; 55BC   0043
        SLL     R3,     1                       ; 55BD   004B
        XORR    R3,     R1                      ; 55BE   01D9
L_55BF:
        PULR    R3                              ; 55BF   02B3
        MVO@    R1,     R3                      ; 55C0   0259
        ADDI    #$0014, R3                      ; 55C1   02FB 0014
        DECR    R0                              ; 55C3   0010
        MOVR    R0,     R1                      ; 55C4   0081
        ANDI    #$0001, R1                      ; 55C5   03B9 0001
        MVI     G_0188, R1                      ; 55C7   0281 0188
        BEQ     L_55AA                          ; 55C9   0224 0020

        TSTR    R0                              ; 55CB   0080
        BPL     L_559E                          ; 55CC   0223 002F
        B       L_5584                          ; 55CE   0220 004B

        JSRD    R4,     .EXEC.C04               ; 55D0   0004 001E 0004
        DECLE   $001E,  $0001,  $0028,  $0001   ; 55D3   001E 0001 0028 0001
        DECLE   $0028,  $0001,  $001E,  $0001   ; 55D7   0028 0001 001E 0001
        DECLE   $001E,  $0001,  $001E,  $0001   ; 55DB   001E 0001 001E 0001

        COMR    R6                              ; 55DF   001E

        JSRD    R4,     .EXEC.C04               ; 55E0   0004 001E 0004

        COMR    R6                              ; 55E3   001E

        JSRD    R4,     .EXEC.C01               ; 55E4   0004 001E 0001
        DECLE   $0028,  $0001,  $001E,  $0001   ; 55E7   0028 0001 001E 0001
        DECLE   $001E,  $0001,  $001E,  $0001   ; 55EB   001E 0001 001E 0001
        DECLE   $001E,  $0001                   ; 55EF   001E 0001

        ADDR    R5,     R7                      ; 55F1   00EF

        DECLE   $0000,  $0010,  $00F1,  $0000   ; 55F2   0000 0010 00F1 0000
        DECLE   $00FF,  $0011,  $0000,  $00F0   ; 55F6   00FF 0011 0000 00F0
        DECLE   $000F,  $0000,  $00FF,  $00F1   ; 55FA   000F 0000 00FF 00F1
        DECLE   $0000,  $00F0,  $0011,  $0000   ; 55FE   0000 00F0 0011 0000
        DECLE   $0001,  $000F,  $0000           ; 5602   0001 000F 0000

        DECR    R0                              ; 5605   0010
        ADDR    R5,     R7                      ; 5606   00EF

        DECLE   $0000                           ; 5607   0000
L_5608:
        PSHR    R5                              ; 5608   0275
        MVI     G_018B, R1                      ; 5609   0281 018B
        SLL     R1,     2                       ; 560B   004D
        MOVR    R1,     R5                      ; 560C   008D
        SLL     R1,     1                       ; 560D   0049
        ADDR    R1,     R5                      ; 560E   00CD
        MVI     G_0184, R1                      ; 560F   0281 0184
        ADDR    R1,     R5                      ; 5611   00CD
        SLL     R1,     1                       ; 5612   0049
        ADDR    R1,     R5                      ; 5613   00CD
        SDBD                                    ; 5614   0001
        ADDI    #$55F0, R5                      ; 5615   02FD 00F0 0055
        MVII    #$012D, R4                      ; 5618   02BC 012D
        MVII    #$0007, R3                      ; 561A   02BB 0007
        MVI     G_0183, R1                      ; 561C   0281 0183
        B       L_5628                          ; 561E   0200 0008

L_5620:
        MVI@    R5,     R2                      ; 5620   02AA
        TSTR    R2                              ; 5621   0092
        BNEQ    L_5627                          ; 5622   020C 0003

        SUBI    #$0003, R5                      ; 5624   033D 0003
        MVI@    R5,     R2                      ; 5626   02AA
L_5627:
        ADDR    R2,     R1                      ; 5627   00D1
L_5628:
        PSHR    R5                              ; 5628   0275
        PSHR    R3                              ; 5629   0273
        PSHR    R4                              ; 562A   0274

        JSR     R5,     L_564C                  ; 562B   0004 0154 024C

        MVI     G_0184, R3                      ; 562E   0283 0184
        SWAP    R0,     2                       ; 5630   0044
L_5631:
        DECR    R3                              ; 5631   0013
        BMI     L_5637                          ; 5632   020B 0003

        SLR     R0,     2                       ; 5634   0064
        B       L_5631                          ; 5635   0220 0005

L_5637:
        MVI     G_018B, R4                      ; 5637   0284 018B
        TSTR    R4                              ; 5639   00A4
        BEQ     L_5644                          ; 563A   0204 0008

        MOVR    R0,     R5                      ; 563C   0085
        ANDI    #$00CC, R0                      ; 563D   03B8 00CC
        XORR    R0,     R5                      ; 563F   01C5
        SWAP    R0,     2                       ; 5640   0044
        SLR     R0,     2                       ; 5641   0064
        SLR     R0,     2                       ; 5642   0064
        ADDR    R5,     R0                      ; 5643   00E8
L_5644:
        PULR    R4                              ; 5644   02B4
        MVO@    R0,     R4                      ; 5645   0260
        PULR    R3                              ; 5646   02B3
        PULR    R5                              ; 5647   02B5
        DECR    R3                              ; 5648   0013
        BPL     L_5620                          ; 5649   0223 002A
        PULR    R7                              ; 564B   02B7

L_564C:
        PSHR    R5                              ; 564C   0275
        ANDI    #$00FF, R1                      ; 564D   03B9 00FF
        PSHR    R1                              ; 564F   0271
        MOVR    R1,     R2                      ; 5650   008A
        CLRR    R0                              ; 5651   01C0
        ANDI    #$000F, R1                      ; 5652   03B9 000F
        BNEQ    L_5657                          ; 5654   020C 0001

        INCR    R0                              ; 5656   0008
L_5657:
        CMPI    #$000B, R1                      ; 5657   0379 000B
        BGT     L_571C                          ; 5659   020E 00C1
        BNEQ    L_565F                          ; 565B   020C 0002

        ADDI    #$0002, R0                      ; 565D   02F8 0002
L_565F:
        SLR     R2,     2                       ; 565F   0066
        SLR     R2,     2                       ; 5660   0066
        BNEQ    L_5665                          ; 5661   020C 0002

        ADDI    #$0004, R0                      ; 5663   02F8 0004
L_5665:
        CMPI    #$000B, R2                      ; 5665   037A 000B
        BGT     L_571C                          ; 5667   020E 00B3
        BNEQ    L_566D                          ; 5669   020C 0002

        ADDI    #$0008, R0                      ; 566B   02F8 0008
L_566D:
        MOVR    R0,     R3                      ; 566D   0083
        BEQ     L_56A9                          ; 566E   0204 0039

        SDBD                                    ; 5670   0001
        ADDI    #$568C, R3                      ; 5671   02FB 008C 0056
        MVI@    R3,     R0                      ; 5674   0298
        ADDI    #$000A, R3                      ; 5675   02FB 000A
        MVI@    R3,     R4                      ; 5677   029C
        TSTR    R4                              ; 5678   00A4
        BEQ     L_571C                          ; 5679   0204 00A1

        ADDI    #$000A, R3                      ; 567B   02FB 000A
        MVI@    R3,     R3                      ; 567D   029B
        PULR    R1                              ; 567E   02B1
        PSHR    R1                              ; 567F   0271
        PSHR    R0                              ; 5680   0270
        PSHR    R3                              ; 5681   0273
        ADDR    R4,     R1                      ; 5682   00E1

        JSR     R5,     L_564C                  ; 5683   0004 0154 024C

        SWAP    R0,     2                       ; 5686   0044
        SLR     R0,     2                       ; 5687   0064
        SLR     R0,     2                       ; 5688   0064
        AND@    R6,     R0                      ; 5689   03B0
        ADD@    R6,     R0                      ; 568A   02F0
        B       L_571C                          ; 568B   0200 008F

        DECLE   $0040,  $0004,  $0000,  $0001   ; 568D   0040 0004 0000 0001
        DECLE   $0041,  $0005,  $0000,  $0010   ; 5691   0041 0005 0000 0010
        DECLE   $0050,  $0014,  $0001,  $00FF   ; 5695   0050 0014 0001 00FF
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5699   0000 0010 0000 0000
        DECLE   $0000,  $00F0,  $0000,  $0000   ; 569D   0000 00F0 0000 0000
        DECLE   $000C,  $00C0,  $0000,  $0030   ; 56A1   000C 00C0 0000 0030
        DECLE   $0000,  $0000,  $0000           ; 56A5   0000 0000 0000

        DIS                                     ; 56A8   0003
L_56A9:
        DECR    R1                              ; 56A9   0011
        DECR    R2                              ; 56AA   0012
        MVII    #$0005, R5                      ; 56AB   02BD 0005
        CLRR    R3                              ; 56AD   01DB
        CMPR    R5,     R1                      ; 56AE   0169
        BLT     L_56B3                          ; 56AF   0205 0002

        SUBR    R5,     R1                      ; 56B1   0129
        INCR    R3                              ; 56B2   000B
L_56B3:
        CLRR    R4                              ; 56B3   01E4
        CMPR    R5,     R2                      ; 56B4   016A
        BLT     L_56B9                          ; 56B5   0205 0002

        SUBR    R5,     R2                      ; 56B7   012A
        INCR    R4                              ; 56B8   000C
L_56B9:
        MVI     G_0185, R5                      ; 56B9   0285 0185
        ADD     G_033C, R5                      ; 56BB   02C5 033C
        XOR     G_015F, R5                      ; 56BD   03C5 015F
        MOVR    R5,     R0                      ; 56BF   00A8
        TSTR    R3                              ; 56C0   009B
        BNEQ    L_56C4                          ; 56C1   020C 0001

        SLL     R0,     1                       ; 56C3   0048
L_56C4:
        ANDI    #$0002, R0                      ; 56C4   03B8 0002
        TSTR    R4                              ; 56C6   00A4
        BEQ     L_56CB                          ; 56C7   0204 0002

        XORI    #$0002, R0                      ; 56C9   03F8 0002
L_56CB:
        PSHR    R0                              ; 56CB   0270
        MOVR    R5,     R0                      ; 56CC   00A8
        SLR     R0,     2                       ; 56CD   0064
        TSTR    R4                              ; 56CE   00A4
        BEQ     L_56D2                          ; 56CF   0204 0001

        SLR     R0,     1                       ; 56D1   0060
L_56D2:
        ANDI    #$0001, R0                      ; 56D2   03B8 0001
        TSTR    R3                              ; 56D4   009B
        BEQ     L_56D9                          ; 56D5   0204 0002

        XORI    #$0001, R0                      ; 56D7   03F8 0001
L_56D9:
        ADD@    R6,     R0                      ; 56D9   02F0
        CMPI    #$0002, R0                      ; 56DA   0378 0002
        BLT     L_56E1                          ; 56DC   0205 0003

        NEGR    R2                              ; 56DE   0022
        ADDI    #$0004, R2                      ; 56DF   02FA 0004
L_56E1:
        PSHR    R0                              ; 56E1   0270
        ANDI    #$0001, R0                      ; 56E2   03B8 0001
        BEQ     L_56E9                          ; 56E4   0204 0003

        NEGR    R1                              ; 56E6   0021
        ADDI    #$0004, R1                      ; 56E7   02F9 0004
L_56E9:
        ADDR    R2,     R1                      ; 56E9   00D1
        SLL     R2,     2                       ; 56EA   004E
        ADDR    R2,     R1                      ; 56EB   00D1
        MOVR    R5,     R2                      ; 56EC   00AA
        ADDR    R4,     R2                      ; 56ED   00E2
        ADDR    R4,     R2                      ; 56EE   00E2
        ADDR    R4,     R2                      ; 56EF   00E2
        SUBR    R3,     R2                      ; 56F0   011A
        SLL     R3,     2                       ; 56F1   004F
        SLL     R3,     1                       ; 56F2   004B
        ADDR    R3,     R2                      ; 56F3   00DA
        MVI     G_0185, R3                      ; 56F4   0283 0185
        SLL     R3,     1                       ; 56F6   004B
        ADDR    R3,     R2                      ; 56F7   00DA
        SLL     R3,     2                       ; 56F8   004F
        ADDR    R3,     R2                      ; 56F9   00DA
        SLR     R2,     1                       ; 56FA   0062
        ANDI    #$0007, R2                      ; 56FB   03BA 0007
        ADDR    R2,     R1                      ; 56FD   00D1
        SLL     R2,     2                       ; 56FE   004E
        SLL     R2,     1                       ; 56FF   004A
        ADDR    R2,     R1                      ; 5700   00D1
        ADDR    R2,     R1                      ; 5701   00D1
        ADDR    R2,     R1                      ; 5702   00D1
        SDBD                                    ; 5703   0001
        ADDI    #$578E, R1                      ; 5704   02F9 008E 0057
        MVI@    R1,     R0                      ; 5707   0288
        PULR    R3                              ; 5708   02B3
        MOVR    R0,     R2                      ; 5709   0082
        ANDI    #$00CC, R2                      ; 570A   03BA 00CC
        XORR    R2,     R0                      ; 570C   01D0
        SWAP    R0,     2                       ; 570D   0044
        SWAP    R2,     2                       ; 570E   0046
        CMPI    #$0002, R3                      ; 570F   037B 0002
        BLT     L_5715                          ; 5711   0205 0002

        SLR     R0,     2                       ; 5713   0064
        SLR     R0,     2                       ; 5714   0064
L_5715:
        ANDI    #$0001, R3                      ; 5715   03BB 0001
        BEQ     L_571B                          ; 5717   0204 0002

        SLR     R2,     2                       ; 5719   0066
        SLR     R2,     2                       ; 571A   0066
L_571B:
        ADDR    R2,     R0                      ; 571B   00D0
L_571C:
        PULR    R1                              ; 571C   02B1
        PULR    R7                              ; 571D   02B7

        DECLE   $0000,  $0004,  $01A0,  $0000   ; 571E   0000 0004 01A0 0000
        DECLE   $0000,  $0061,  $002C,  $0000   ; 5722   0000 0061 002C 0000
        DECLE   $0000,  $0081,  $002D,  $0000   ; 5726   0000 0081 002D 0000
        DECLE   $0003,  $0021,  $0021,  $0180   ; 572A   0003 0021 0021 0180
        DECLE   $0004,  $0021,  $0021,  $01A0   ; 572E   0004 0021 0021 01A0
        DECLE   $0061,  $0021,  $0021,  $002C   ; 5732   0061 0021 0021 002C
        DECLE   $0081,  $0021,  $0021,  $002D   ; 5736   0081 0021 0021 002D
        DECLE   $0021,  $0021,  $0021,  $0021   ; 573A   0021 0021 0021 0021
        DECLE   $0000,  $0002,  $0160,  $0000   ; 573E   0000 0002 0160 0000
        DECLE   $0000,  $0001,  $0020,  $0000   ; 5742   0000 0001 0020 0000
        DECLE   $0000,  $0041,  $002B,  $0000   ; 5746   0000 0041 002B 0000
        DECLE   $0000,  $0021,  $0021,  $0000   ; 574A   0000 0021 0021 0000
        DECLE   $0001,  $0021,  $0021,  $0020   ; 574E   0001 0021 0021 0020
        DECLE   $0000,  $000A,  $0260,  $0000   ; 5752   0000 000A 0260 0000
        DECLE   $0000,  $0005,  $01C0,  $0000   ; 5756   0000 0005 01C0 0000
        DECLE   $0000,  $0006,  $01E0,  $0000   ; 575A   0000 0006 01E0 0000
        DECLE   $0000,  $00E1,  $0030,  $0000   ; 575E   0000 00E1 0030 0000
        DECLE   $0000,  $0101,  $0031,  $0000   ; 5762   0000 0101 0031 0000
        DECLE   $0000,  $0121,  $0032,  $0000   ; 5766   0000 0121 0032 0000
        DECLE   $0000,  $0141,  $0033,  $0000   ; 576A   0000 0141 0033 0000
        DECLE   $0004,  $0006,  $0021,  $01A0   ; 576E   0004 0006 0021 01A0
        DECLE   $0061,  $00E1,  $0021,  $002C   ; 5772   0061 00E1 0021 002C
        DECLE   $0021,  $0121,  $0021,  $0021   ; 5776   0021 0121 0021 0021
        DECLE   $0021,  $0141,  $0021,  $0021   ; 577A   0021 0141 0021 0021
        DECLE   $0000,  $0001,  $0021,  $0000   ; 577E   0000 0001 0021 0000
        DECLE   $0001,  $0041,  $0021,  $0020   ; 5782   0001 0041 0021 0020
        DECLE   $0003,  $0025,  $0021,  $0180   ; 5786   0003 0025 0021 0180
        DECLE   $0000,  $0042,  $002B,  $0000   ; 578A   0000 0042 002B 0000
        DECLE   $0041,  $0005,  $0046,  $0041   ; 578E   0041 0005 0046 0041
        DECLE   $0005,  $0050,  $0034,  $0044   ; 5792   0005 0050 0034 0044
        DECLE   $0060,  $0014,  $00D1,  $0033   ; 5796   0060 0014 00D1 0033
        DECLE   $0000,  $0022,  $0011,  $0041   ; 579A   0000 0022 0011 0041
        DECLE   $0007,  $0044,  $0042,  $0005   ; 579E   0007 0044 0042 0005
        DECLE   $0050,  $0014,  $0044,  $0050   ; 57A2   0050 0014 0044 0050
        DECLE   $0014,  $0051,  $0019,  $008A   ; 57A6   0014 0051 0019 008A
        DECLE   $0091,  $0015,  $0051,  $0019   ; 57AA   0091 0015 0051 0019
        DECLE   $0088,  $0091,  $0015,  $00D1   ; 57AE   0088 0091 0015 00D1
        DECLE   $0019,  $0088,  $0091,  $0011   ; 57B2   0019 0088 0091 0011
        DECLE   $0051,  $0019,  $0088,  $0091   ; 57B6   0051 0019 0088 0091
        DECLE   $0015,  $0051,  $0019,  $0088   ; 57BA   0015 0051 0019 0088
        DECLE   $0091,  $0015,  $0041,  $0009   ; 57BE   0091 0015 0041 0009
        DECLE   $0082,  $0009,  $0085,  $0050   ; 57C2   0082 0009 0085 0050
        DECLE   $0014,  $0060,  $0014,  $0054   ; 57C6   0014 0060 0014 0054
        DECLE   $00D1,  $0031,  $0002,  $0021   ; 57CA   00D1 0031 0002 0021
        DECLE   $0011,  $0041,  $0007,  $0044   ; 57CE   0011 0041 0007 0044
        DECLE   $0042,  $0005,  $0050,  $0014   ; 57D2   0042 0005 0050 0014
        DECLE   $0044,  $0050,  $0014,  $0041   ; 57D6   0044 0050 0014 0041
        DECLE   $0005,  $0046,  $0041,  $0005   ; 57DA   0005 0046 0041 0005
        DECLE   $0050,  $0018,  $00B8,  $0090   ; 57DE   0050 0018 00B8 0090
        DECLE   $0014,  $00D1,  $0029,  $0083   ; 57E2   0014 00D1 0029 0083
        DECLE   $0021,  $0011,  $0041,  $0006   ; 57E6   0021 0011 0041 0006
        DECLE   $0044,  $0042,  $0005,  $0050   ; 57EA   0044 0042 0005 0050
        DECLE   $001C,  $00C8,  $0090,  $0014   ; 57EE   001C 00C8 0090 0014
        DECLE   $0041,  $0005,  $0052,  $0001   ; 57F2   0041 0005 0052 0001
        DECLE   $0025,  $0050,  $0018,  $0085   ; 57F6   0025 0050 0018 0085
        DECLE   $0044,  $0056,  $00D1,  $0009   ; 57FA   0044 0056 00D1 0009
        DECLE   $0094,  $0040,  $0011,  $0049   ; 57FE   0094 0040 0011 0049
        DECLE   $00A0,  $0001,  $0028,  $0085   ; 5802   00A0 0001 0028 0085
        DECLE   $0054,  $0056,  $0044,  $0052   ; 5806   0054 0056 0044 0052
        DECLE   $0014,  $0041,  $0011,  $0012   ; 580A   0014 0041 0011 0012
        DECLE   $0009,  $0085,  $0044,  $0041   ; 580E   0009 0085 0044 0041
        DECLE   $0005,  $0044,  $0054,  $00C4   ; 5812   0005 0044 0054 00C4
        DECLE   $0050,  $0018,  $0090,  $0011   ; 5816   0050 0018 0090 0011
        DECLE   $0060,  $0011,  $0009,  $0081   ; 581A   0060 0011 0009 0081
        DECLE   $0005,  $0052,  $0015,  $0044   ; 581E   0005 0052 0015 0044
        DECLE   $0050,  $0014,  $0041,  $0009   ; 5822   0050 0014 0041 0009
        DECLE   $008A,  $0091,  $0025,  $0050   ; 5826   008A 0091 0025 0050
        DECLE   $0014,  $0050,  $0005,  $0056   ; 582A   0014 0050 0005 0056
        DECLE   $00D1,  $000D,  $00DD,  $00D0   ; 582E   00D1 000D 00DD 00D0
        DECLE   $0011,  $0065,  $0050,  $0005   ; 5832   0011 0065 0050 0005
        DECLE   $0041,  $0005,  $0052,  $0019   ; 5836   0041 0005 0052 0019
        DECLE   $0088,  $0090,  $0014,  $0041   ; 583A   0088 0090 0014 0041
        DECLE   $0005,  $0046,  $0041,  $0005   ; 583E   0005 0046 0041 0005
        DECLE   $0050,  $0018,  $00A4,  $0060   ; 5842   0050 0018 00A4 0060
        DECLE   $0014,  $00D1,  $0029,  $00AA   ; 5846   0014 00D1 0029 00AA
        DECLE   $0092,  $0011,  $0041,  $0006   ; 584A   0092 0011 0041 0006
        DECLE   $004A,  $0081,  $0005           ; 584E   004A 0081 0005

        RLC     R0,     1                       ; 5851   0050
        DECR    R4                              ; 5852   0014
        SWAP    R0,     2                       ; 5853   0044
        RLC     R0,     1                       ; 5854   0050
        DECR    R4                              ; 5855   0014
        PSHR    R5                              ; 5856   0275
L_5857:
        MVI     G_0184, R5                      ; 5857   0285 0184
        ADDR    R5,     R5                      ; 5859   00ED
        ADDR    R5,     R5                      ; 585A   00ED
        SDBD                                    ; 585B   0001
        ADDI    #$5873, R5                      ; 585C   02FD 0073 0058
        MVII    #$0160, R4                      ; 585F   02BC 0160
        MVI     G_0183, R1                      ; 5861   0281 0183
        B       L_5868                          ; 5863   0200 0003

L_5865:
        MVI     G_0183, R1                      ; 5865   0281 0183
        ADD@    R5,     R1                      ; 5867   02E9
L_5868:
        PSHR    R5                              ; 5868   0275

        JSR     R5,     L_5883                  ; 5869   0004 0158 0083

        PULR    R5                              ; 586C   02B5
        MVO@    R3,     R4                      ; 586D   0263
        CMPI    #$0164, R4                      ; 586E   037C 0164
        BLE     L_5865                          ; 5870   0226 000C
        PULR    R7                              ; 5872   02B7

        ADDR    R6,     R0                      ; 5873   00F0
        ADDR    R4,     R0                      ; 5874   00E0
        ADDR    R6,     R1                      ; 5875   00F1
        ADDR    R5,     R7                      ; 5876   00EF

        DECLE   $0001,  $0002,  $0011,  $00F1   ; 5877   0001 0002 0011 00F1
        DECLE   $0010,  $0020,  $000F,  $0011   ; 587B   0010 0020 000F 0011
        DECLE   $00FF                           ; 587F   00FF

        ADDR    R7,     R6                      ; 5880   00FE
        ADDR    R5,     R7                      ; 5881   00EF
        INCR    R7                              ; 5882   000F

L_5883:
        PSHR    R5                              ; 5883   0275
L_5884:
        MVII    #$01A4, R5                      ; 5884   02BD 01A4
        ANDI    #$00FF, R1                      ; 5886   03B9 00FF
L_5888:
        CMP@    R5,     R1                      ; 5888   0369
        BEQ     L_58B1                          ; 5889   0204 0026

        INCR    R5                              ; 588B   000D
        CMPI    #$01EA, R5                      ; 588C   037D 01EA
        BLE     L_5888                          ; 588E   0226 0007

        SDBD                                    ; 5890   0001
        MVII    #$58C7, R5                      ; 5891   02BD 00C7 0058
        MVII    #$0007, R3                      ; 5894   02BB 0007
L_5896:
        CMP@    R5,     R1                      ; 5896   0369
        BEQ     L_58B3                          ; 5897   0204 001A

        DECR    R3                              ; 5899   0013
        BPL     L_5896                          ; 589A   0223 0005

        CMP@    R5,     R1                      ; 589C   0369
        BNEQ    L_58A5                          ; 589D   020C 0006

        MVI     G_017F, R3                      ; 589F   0283 017F
        ANDI    #$0002, R3                      ; 58A1   03BB 0002
        BNEQ    L_58BA                          ; 58A3   020C 0015

L_58A5:
        CMP@    R5,     R1                      ; 58A5   0369
        BNEQ    L_58AE                          ; 58A6   020C 0006

        MVI     G_017F, R3                      ; 58A8   0283 017F
        ANDI    #$0001, R3                      ; 58AA   03BB 0001
        BNEQ    L_58BA                          ; 58AC   020C 000C

L_58AE:
        CLRR    R3                              ; 58AE   01DB
        CLRR    R5                              ; 58AF   01ED
        PULR    R7                              ; 58B0   02B7

L_58B1:
        MVI@    R5,     R3                      ; 58B1   02AB
        PULR    R7                              ; 58B2   02B7

L_58B3:
        JSR     R5,     L_6FC9                  ; 58B3   0004 016C 03C9

        MOVR    R1,     R3                      ; 58B6   008B
        ADDI    #$00B6, R3                      ; 58B7   02FB 00B6
        PULR    R7                              ; 58B9   02B7

L_58BA:
        MVI     G_033C, R3                      ; 58BA   0283 033C
        DECR    R5                              ; 58BC   0015
        ADD@    R5,     R3                      ; 58BD   02EB
        SLR     R3,     2                       ; 58BE   0067
        SLR     R3,     2                       ; 58BF   0067
        XOR     G_015F, R3                      ; 58C0   03C3 015F
        ANDI    #$0003, R3                      ; 58C2   03BB 0003
        ADDI    #$00F5, R3                      ; 58C4   02FB 00F5
        PULR    R7                              ; 58C6   02B7

        GSWD    R0                              ; 58C7   0030
        TSTR    R0                              ; 58C8   0080
        RSWD    R3                              ; 58C9   003B
        MOVR    R1,     R3                      ; 58CA   008B
        DIS                                     ; 58CB   0003
        INCR    R0                              ; 58CC   0008
        MOVR    R6,     R3                      ; 58CD   00B3
        MOVR    R7,     R0                      ; 58CE   00B8
        RLC     R0,     1                       ; 58CF   0050
        SAR     R3,     1                       ; 58D0   006B
        MVI     G_0102, R0                      ; 58D1   0280 0102
        DECR    R0                              ; 58D3   0010
        CMPI    #$0003, R0                      ; 58D4   0378 0003
        BEQ     L_58DA                          ; 58D6   0204 0002
        MVI     G_034C, R7                      ; 58D8   0287 034C

L_58DA:
        MVO     R0,     G_0102                  ; 58DA   0240 0102
        PSHR    R5                              ; 58DC   0275
        MVO     R0,     .STIC.VIDEN             ; 58DD   0240 0020
        MVII    #$0174, R3                      ; 58DF   02BB 0174
        SDBD                                    ; 58E1   0001
        MVII    #$3940, R4                      ; 58E2   02BC 0040 0039
L_58E5:
        SDBD                                    ; 58E5   0001
        MVII    #$5F50, R5                      ; 58E6   02BD 0050 005F
        MVI@    R3,     R1                      ; 58E9   0299
        ADDR    R1,     R1                      ; 58EA   00C9
        BEQ     L_58FF                          ; 58EB   0204 0012

        SDBD                                    ; 58ED   0001
        ADDI    #$5A1C, R1                      ; 58EE   02F9 001C 005A
        ADDI    #$0038, R5                      ; 58F1   02FD 0038
        MVI@    R1,     R1                      ; 58F3   0289
        MOVR    R1,     R2                      ; 58F4   008A
        ANDI    #$0070, R1                      ; 58F5   03B9 0070
        SLR     R1,     1                       ; 58F7   0061
        ADDR    R1,     R5                      ; 58F8   00CD
        ANDI    #$0380, R2                      ; 58F9   03BA 0380
        SLR     R2,     2                       ; 58FB   0066
        ADDR    R2,     R5                      ; 58FC   00D5
        SLR     R2,     1                       ; 58FD   0062
        ADDR    R2,     R5                      ; 58FE   00D5
L_58FF:
        MVII    #$0003, R2                      ; 58FF   02BA 0003
L_5901:
        MVI@    R5,     R1                      ; 5901   02A9
        COMR    R1                              ; 5902   0019
        MVO@    R1,     R4                      ; 5903   0261
        MVI@    R5,     R1                      ; 5904   02A9
        COMR    R1                              ; 5905   0019
        MVO@    R1,     R4                      ; 5906   0261
        DECR    R2                              ; 5907   0012
        BPL     L_5901                          ; 5908   0223 0008

        INCR    R3                              ; 590A   000B
        CMPI    #$017B, R3                      ; 590B   037B 017B
        BLE     L_58E5                          ; 590D   0226 0029

        PULR    R5                              ; 590F   02B5
        J       X_PLAY_NOTE                     ; 5910   0004 0318 02BD

L_5913:
        PSHR    R5                              ; 5913   0275
L_5914:
        MVII    #$01A4, R4                      ; 5914   02BC 01A4

        JSR     R5,     L_6FC9                  ; 5916   0004 016C 03C9

        MVII    #$000C, R2                      ; 5919   02BA 000C
        TSTR    R3                              ; 591B   009B
        BEQ     L_592A                          ; 591C   0204 000C

        MVI     G_017F, R5                      ; 591E   0285 017F
        COMR    R5                              ; 5920   001D
        ANDR    R3,     R5                      ; 5921   019D
        MVO     R5,     G_017F                  ; 5922   0245 017F
        MVI     G_0185, R0                      ; 5924   0280 0185
        SARC    R0,     1                       ; 5926   0078
        BNC     L_592A                          ; 5927   0209 0001

        MOVR    R3,     R2                      ; 5929   009A
L_592A:
        MVII    #$0005, R3                      ; 592A   02BB 0005
L_592C:
        MOVR    R2,     R5                      ; 592C   0095
        MVII    #$00FF, R0                      ; 592D   02B8 00FF
        ANDI    #$0004, R5                      ; 592F   03BD 0004
        BEQ     L_593E                          ; 5931   0204 000B

        MVII    #$000A, R0                      ; 5933   02B8 000A

        JSR     R5,     X_RAND2                 ; 5935   0004 0114 029E

        INCR    R0                              ; 5938   0008
        SLL     R0,     2                       ; 5939   004C
        SLL     R0,     2                       ; 593A   004C
        ADDI    #$0003, R0                      ; 593B   02F8 0003
        ADDR    R3,     R0                      ; 593D   00D8
L_593E:
        MVO@    R0,     R4                      ; 593E   0260
        INCR    R4                              ; 593F   000C
        SLR     R2,     1                       ; 5940   0062
        SUBI    #$0005, R3                      ; 5941   033B 0005
        BEQ     L_592C                          ; 5943   0224 0018

L_5945:
        MVII    #$000A, R0                      ; 5945   02B8 000A

        JSR     R5,     X_RAND2                 ; 5947   0004 0114 029E

        INCR    R0                              ; 594A   0008
        MOVR    R0,     R2                      ; 594B   0082
        MVII    #$000A, R0                      ; 594C   02B8 000A

        JSR     R5,     X_RAND2                 ; 594E   0004 0114 029E

        INCR    R0                              ; 5951   0008
        SLL     R2,     2                       ; 5952   004E
        SLL     R2,     2                       ; 5953   004E
        ADDR    R0,     R2                      ; 5954   00C2
        CMP     G_0183, R2                      ; 5955   0342 0183
        BEQ     L_5945                          ; 5957   0224 0013

        MVII    #$01A3, R5                      ; 5959   02BD 01A3
L_595B:
        INCR    R5                              ; 595B   000D
        CMPR    R4,     R5                      ; 595C   0165
        BGE     L_5964                          ; 595D   020D 0005

        CMP@    R5,     R2                      ; 595F   036A
        BEQ     L_5945                          ; 5960   0224 001C
        B       L_595B                          ; 5962   0220 0008

L_5964:
        MVO@    R2,     R4                      ; 5964   0262
        INCR    R4                              ; 5965   000C
        CMPI    #$01EA, R4                      ; 5966   037C 01EA
        BLE     L_5945                          ; 5968   0226 0024

        SUBI    #$0002, R1                      ; 596A   0339 0002
        MVII    #$01A5, R4                      ; 596C   02BC 01A5
        SDBD                                    ; 596E   0001
        MVII    #$59F6, R3                      ; 596F   02BB 00F6 0059
L_5972:
        MVI@    R3,     R0                      ; 5972   0298
        INCR    R3                              ; 5973   000B

        JSR     R5,     X_RAND2                 ; 5974   0004 0114 029E

        ADD@    R3,     R0                      ; 5977   02D8
        DECR    R3                              ; 5978   0013
        CMPI    #$0003, R0                      ; 5979   0378 0003
        BLT     L_599D                          ; 597B   0205 0020

        MVII    #$00A2, R2                      ; 597D   02BA 00A2
        CMPI    #$000E, R0                      ; 597F   0378 000E
        BLE     L_598D                          ; 5981   0206 000A

        CMPI    #$0027, R0                      ; 5983   0378 0027
        BLT     L_599D                          ; 5985   0205 0016

        SUBI    #$0048, R2                      ; 5987   033A 0048
        CMPI    #$004A, R0                      ; 5989   0378 004A
        BGT     L_599D                          ; 598B   020E 0010

L_598D:
        TSTR    R1                              ; 598D   0089
        BGT     L_599D                          ; 598E   020E 000D
        BEQ     L_599C                          ; 5990   0204 000A

        PSHR    R0                              ; 5992   0270
        MVII    #$0001, R0                      ; 5993   02B8 0001

        JSR     R5,     X_RAND1                 ; 5995   0004 0114 027D

        TSTR    R0                              ; 5998   0080
        PULR    R0                              ; 5999   02B0
        BEQ     L_599D                          ; 599A   0204 0001

L_599C:
        ADDR    R2,     R0                      ; 599C   00D0
L_599D:
        MOVR    R0,     R2                      ; 599D   0082
        SLL     R2,     1                       ; 599E   004A
        SDBD                                    ; 599F   0001
        ADDI    #$5A1F, R2                      ; 59A0   02FA 001F 005A
        MVI@    R2,     R2                      ; 59A3   0292
        ANDI    #$000F, R2                      ; 59A4   03BA 000F
        CMP     G_0185, R2                      ; 59A6   0342 0185
        BGT     L_5972                          ; 59A8   022E 0037

        INCR    R0                              ; 59AA   0008
        MVO@    R0,     R4                      ; 59AB   0260
        INCR    R4                              ; 59AC   000C
        ADDI    #$0002, R3                      ; 59AD   02FB 0002
        CMPI    #$01CB, R4                      ; 59AF   037C 01CB
        BLE     L_5972                          ; 59B1   0226 0040

        MVII    #$0010, R0                      ; 59B3   02B8 0010
        DECR    R4                              ; 59B5   0014

        JSR     R5,     X_FILL_ZERO             ; 59B6   0004 0114 0338

        MVII    #$01DD, R4                      ; 59B9   02BC 01DD
L_59BB:
        MVII    #$0034, R0                      ; 59BB   02B8 0034

        JSR     R5,     X_RAND2                 ; 59BD   0004 0114 029E

        MOVR    R0,     R2                      ; 59C0   0082
        SLL     R2,     2                       ; 59C1   004E
        ADDR    R0,     R2                      ; 59C2   00C2
        SDBD                                    ; 59C3   0001
        ADDI    #$5B91, R2                      ; 59C4   02FA 0091 005B
        MVI@    R2,     R3                      ; 59C7   0293
        SWAP    R3,     1                       ; 59C8   0043
        ANDI    #$0003, R3                      ; 59C9   03BB 0003
        DECR    R3                              ; 59CB   0013
        TSTR    R1                              ; 59CC   0089
        BMI     L_59D2                          ; 59CD   020B 0003

        CMPR    R1,     R3                      ; 59CF   014B
        BEQ     L_59BB                          ; 59D0   0224 0016

L_59D2:
        ADDI    #$0003, R2                      ; 59D2   02FA 0003
        MVI@    R2,     R2                      ; 59D4   0292
        SLL     R2,     2                       ; 59D5   004E
        SWAP    R2,     1                       ; 59D6   0042
        ANDI    #$000F, R2                      ; 59D7   03BA 000F
        CMP     G_0185, R2                      ; 59D9   0342 0185
        BGT     L_59BB                          ; 59DB   022E 0021

        ADDI    #$00C1, R0                      ; 59DD   02F8 00C1
        MVO@    R0,     R4                      ; 59DF   0260
        INCR    R4                              ; 59E0   000C
        CMPI    #$01EC, R4                      ; 59E1   037C 01EC
        BLT     L_59BB                          ; 59E3   0225 0029

        MVI     G_0139, R0                      ; 59E5   0280 0139
        SLL     R0,     2                       ; 59E7   004C
        DECR    R0                              ; 59E8   0010
        BPL     L_59ED                          ; 59E9   0203 0002

        MVII    #$0001, R0                      ; 59EB   02B8 0001
L_59ED:
        CMP     G_0185, R0                      ; 59ED   0340 0185
        BNEQ    L_59F5                          ; 59EF   020C 0004

        MVII    #$00F4, R0                      ; 59F1   02B8 00F4
        MVO     R0,     G_01DD                  ; 59F3   0240 01DD
L_59F5:
        PULR    R7                              ; 59F5   02B7

        DECLE   $0001,  $0002,  $0001,  $0002   ; 59F6   0001 0002 0001 0002
        DECLE   $0001,  $0000,  $0001,  $0001   ; 59FA   0001 0000 0001 0001
        DECLE   $0001,  $0001,  $0024,  $0003   ; 59FE   0001 0001 0024 0003
        DECLE   $0024,  $0003,  $0024,  $0027   ; 5A02   0024 0003 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A06   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A0A   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0024,  $0027   ; 5A0E   0024 0027 0024 0027
        DECLE   $0024,  $0027,  $0012,  $004B   ; 5A12   0024 0027 0012 004B
        DECLE   $0012,  $004B,  $0012,  $004B   ; 5A16   0012 004B 0012 004B
        DECLE   $0012,  $004B,  $0012,  $004B   ; 5A1A   0012 004B 0012 004B
        DECLE   $0003,  $0000,  $0013,  $0000   ; 5A1E   0003 0000 0013 0000
        DECLE   $0021,  $0000                   ; 5A22   0021 0000

        MOVR    R0,     R3                      ; 5A24   0083
        NEGR    R0                              ; 5A25   0020
        MOVR    R1,     R2                      ; 5A26   008A
        SWAP    R1,     1                       ; 5A27   0041
        TSTR    R1                              ; 5A28   0089
        SLR     R3,     1                       ; 5A29   0063
        MOVR    R1,     R0                      ; 5A2A   0088
        MOVR    R2,     R6                      ; 5A2B   0096
        MOVR    R0,     R6                      ; 5A2C   0086
        ADDR    R1,     R0                      ; 5A2D   00C8
        MOVR    R0,     R7                      ; 5A2E   0087

        ADDR    R7,     R4                      ; 5A2F   00FC
        MOVR    R4,     R3                      ; 5A30   00A3
        DECR    R0                              ; 5A31   0010
        MOVR    R5,     R2                      ; 5A32   00AA
        NEGR    R1                              ; 5A33   0021
        MOVR    R5,     R1                      ; 5A34   00A9
        GSWD    R2                              ; 5A35   0032
        MOVR    R5,     R0                      ; 5A36   00A8
        RLC     R1,     2                       ; 5A37   0055
        MOVR    R4,     R6                      ; 5A38   00A6
        RRC     R3,     2                       ; 5A39   0077
        MOVR    R4,     R7                      ; 5A3A   00A7

        MOVR    R3,     R1                      ; 5A3B   0099
        MOVR    R2,     R3                      ; 5A3C   0093
        NEGR    R0                              ; 5A3D   0020
        MOVR    R3,     R2                      ; 5A3E   009A
        SWAP    R1,     1                       ; 5A3F   0041
        MOVR    R3,     R1                      ; 5A40   0099
        SLR     R3,     1                       ; 5A41   0063
        MOVR    R3,     R0                      ; 5A42   0098
        MOVR    R2,     R6                      ; 5A43   0096
        MOVR    R2,     R6                      ; 5A44   0096
        ADDR    R1,     R0                      ; 5A45   00C8
        MOVR    R2,     R7                      ; 5A46   0097

        DECLE   $00FC,  $00B3,  $00A1,  $00BA   ; 5A47   00FC 00B3 00A1 00BA
        DECLE   $00E2,  $00B9,  $0123,  $00B8   ; 5A4B   00E2 00B9 0123 00B8
        DECLE   $0166,  $00B6,  $01A9,  $00B7   ; 5A4F   0166 00B6 01A9 00B7

        CLRR    R5                              ; 5A53   01ED
        ADDR    R0,     R3                      ; 5A54   00C3
        MOVR    R4,     R2                      ; 5A55   00A2
        ADDR    R1,     R2                      ; 5A56   00CA
        ADDR    R4,     R3                      ; 5A57   00E3
        ADDR    R1,     R1                      ; 5A58   00C9
        SUBR    R4,     R4                      ; 5A59   0124
        ADDR    R1,     R0                      ; 5A5A   00C8
        CMPR    R4,     R6                      ; 5A5B   0166
        ADDR    R0,     R6                      ; 5A5C   00C6
        ANDR    R5,     R1                      ; 5A5D   01A9
        ADDR    R0,     R7                      ; 5A5E   00C7

        CLRR    R5                              ; 5A5F   01ED
        ADDR    R2,     R3                      ; 5A60   00D3
        RLC     R0,     1                       ; 5A61   0050
        ADDR    R3,     R2                      ; 5A62   00DA
        TSTR    R0                              ; 5A63   0080
        ADDR    R3,     R1                      ; 5A64   00D9
        MOVR    R6,     R1                      ; 5A65   00B1
        ADDR    R3,     R0                      ; 5A66   00D8
        ADDR    R4,     R5                      ; 5A67   00E5
        ADDR    R2,     R6                      ; 5A68   00D6
        SUBR    R2,     R7                      ; 5A69   0117
        ADDR    R2,     R7                      ; 5A6A   00D7

        DECLE   $0149,  $0103,  $0000           ; 5A6B   0149 0103 0000

        SUBR    R1,     R2                      ; 5A6E   010A
        DECR    R0                              ; 5A6F   0010
        SUBR    R1,     R1                      ; 5A70   0109
        GSWD    R1                              ; 5A71   0031
        SUBR    R1,     R0                      ; 5A72   0108
        RLC     R0,     2                       ; 5A73   0054
        SUBR    R0,     R6                      ; 5A74   0106
        RRC     R2,     2                       ; 5A75   0076
        SUBR    R0,     R7                      ; 5A76   0107

        MOVR    R3,     R0                      ; 5A77   0098
        SUBR    R2,     R3                      ; 5A78   0113
        SWAP    R2,     1                       ; 5A79   0042
        SUBR    R3,     R2                      ; 5A7A   011A
        SLR     R3,     1                       ; 5A7B   0063
        SUBR    R3,     R1                      ; 5A7C   0119
        MOVR    R0,     R5                      ; 5A7D   0085
        SUBR    R3,     R0                      ; 5A7E   0118
        MOVR    R5,     R1                      ; 5A7F   00A9
        SUBR    R2,     R6                      ; 5A80   0116
        ADDR    R1,     R3                      ; 5A81   00CB
        SUBR    R2,     R7                      ; 5A82   0117

        XORR    R7,     R5                      ; 5A83   01FD
        CMPR    R2,     R3                      ; 5A84   0153
        DECR    R0                              ; 5A85   0010
        CMPR    R3,     R2                      ; 5A86   015A
        GSWD    R0                              ; 5A87   0030
        CMPR    R3,     R1                      ; 5A88   0159
        RLC     R1,     1                       ; 5A89   0051
        CMPR    R3,     R0                      ; 5A8A   0158
        MOVR    R0,     R4                      ; 5A8B   0084
        CMPR    R2,     R6                      ; 5A8C   0156
        ADDR    R0,     R7                      ; 5A8D   00C7

        DECLE   $0157,  $011A,  $0123,  $0030   ; 5A8E   0157 011A 0123 0030
        DECLE   $012A,  $0050,  $0129,  $0071   ; 5A92   012A 0050 0129 0071
        DECLE   $0128,  $00A4,  $0126,  $00F7   ; 5A96   0128 00A4 0126 00F7
        DECLE   $0127,  $0149,  $0133,  $0050   ; 5A9A   0127 0149 0133 0050
        DECLE   $013A,  $0071,  $0139,  $0092   ; 5A9E   013A 0071 0139 0092
        DECLE   $0138,  $00C4,  $0136,  $0116   ; 5AA2   0138 00C4 0136 0116
        DECLE   $0137                           ; 5AA6   0137

        CMPR    R7,     R2                      ; 5AA7   017A
        CMPR    R0,     R3                      ; 5AA8   0143
        RRC     R1,     1                       ; 5AA9   0071
        CMPR    R1,     R2                      ; 5AAA   014A
        TSTR    R2                              ; 5AAB   0092
        CMPR    R1,     R1                      ; 5AAC   0149
        ADDR    R2,     R3                      ; 5AAD   00D3
        CMPR    R1,     R0                      ; 5AAE   0148
        CMPR    R2,     R5                      ; 5AAF   0155
        CMPR    R0,     R6                      ; 5AB0   0146
        ANDR    R5,     R1                      ; 5AB1   01A9
        CMPR    R0,     R7                      ; 5AB2   0147
        XORR    R7,     R3                      ; 5AB3   01FB
        ANDR    R0,     R3                      ; 5AB4   0183
        NEGR    R1                              ; 5AB5   0021
        ANDR    R1,     R2                      ; 5AB6   018A
        RRC     R3,     1                       ; 5AB7   0073
        ANDR    R1,     R1                      ; 5AB8   0189
        MOVR    R4,     R7                      ; 5AB9   00A7

        DECLE   $0193,  $0062,  $019A,  $0084   ; 5ABA   0193 0062 019A 0084
        DECLE   $0199,  $00DA,  $01A3,  $0095   ; 5ABE   0199 00DA 01A3 0095
        DECLE   $01AA,  $00C9,  $01A9,  $00FE   ; 5AC2   01AA 00C9 01A9 00FE
        DECLE   $01B3,  $0053,  $01BA,  $00B8   ; 5AC6   01B3 0053 01BA 00B8
        DECLE   $01B9,  $00EB,  $01C3,  $0000   ; 5ACA   01B9 00EB 01C3 0000
        DECLE   $01CA,  $0042,  $01C9,  $0095   ; 5ACE   01CA 0042 01C9 0095
        DECLE   $01D3,  $0010,  $01DA,  $0032   ; 5AD2   01D3 0010 01DA 0032
        DECLE   $01D9,  $0096,  $0208,  $0051   ; 5AD6   01D9 0096 0208 0051
        DECLE   $0206,  $023B,  $0207,  $02DD   ; 5ADA   0206 023B 0207 02DD
        DECLE   $0248,  $00A3,  $0246,  $00F5   ; 5ADE   0248 00A3 0246 00F5
        DECLE   $0247,  $0168,  $0228,  $00C4   ; 5AE2   0247 0168 0228 00C4
        DECLE   $0226,  $0199,  $0227,  $028C   ; 5AE6   0226 0199 0227 028C
        DECLE   $0238,  $01EA,  $0236,  $032E   ; 5AEA   0238 01EA 0236 032E
        DECLE   $0237,  $03CF,  $0218,  $0020   ; 5AEE   0237 03CF 0218 0020
        DECLE   $0216,  $0072,  $0217           ; 5AF2   0216 0072 0217

        CMPR    R0,     R7                      ; 5AF5   0147
        MVO@    R0,     R3                      ; 5AF6   0258
        DECR    R0                              ; 5AF7   0010
        MVO@    R6,     R2                      ; 5AF8   0256
        GSWD    R0                              ; 5AF9   0030
        MVO@    R7,     R2                      ; 5AFA   0257
        SUBR    R2,     R6                      ; 5AFB   0116
        MVI@    R1,     R1                      ; 5AFC   0289
        DECR    R1                              ; 5AFD   0011
        MVI@    R1,     R4                      ; 5AFE   028C
        NEGR    R3                              ; 5AFF   0023
        MVI@    R1,     R7                      ; 5B00   028F

        DECLE   $0035                           ; 5B01   0035

        MVI@    R3,     R1                      ; 5B02   0299
        SWAP    R0,     2                       ; 5B03   0044
        MVI@    R3,     R4                      ; 5B04   029C
        RLC     R2,     2                       ; 5B05   0056
        MVI@    R3,     R7                      ; 5B06   029F

        SAR     R1,     1                       ; 5B07   0069
        MVI@    R5,     R1                      ; 5B08   02A9
        RRC     R3,     2                       ; 5B09   0077
        MVI@    R5,     R4                      ; 5B0A   02AC
        TSTR    R1                              ; 5B0B   0089
        MVI@    R5,     R7                      ; 5B0C   02AF

        DECLE   $009B,  $02B9,  $00A0,  $02BC   ; 5B0D   009B 02B9 00A0 02BC
        DECLE   $00A2,  $02BF                   ; 5B11   00A2 02BF

        MOVR    R4,     R6                      ; 5B13   00A6
        ADD@    R1,     R1                      ; 5B14   02C9
        MOVR    R4,     R1                      ; 5B15   00A1
        ADD@    R1,     R4                      ; 5B16   02CC
        MOVR    R4,     R3                      ; 5B17   00A3
        ADD@    R1,     R7                      ; 5B18   02CF

        DECLE   $00A8,  $02D3,  $0000,  $02DA   ; 5B19   00A8 02D3 0000 02DA
        DECLE   $0003,  $02D9,  $0007,  $0309   ; 5B1D   0003 02D9 0007 0309
        DECLE   $0000                           ; 5B21   0000

        SUB@    R1,     R0                      ; 5B22   0308
        DECR    R0                              ; 5B23   0010
        SUB     .STIC.VDLY,R7                   ; 5B24   0307 0031

        SUB@    R1,     R4                      ; 5B26   030C
        RLC     R0,     2                       ; 5B27   0054
        SUB     G_0076, R2                      ; 5B28   0302 0076
        SUB@    R1,     R7                      ; 5B2A   030F

        MOVR    R3,     R0                      ; 5B2B   0098
        SUB@    R3,     R1                      ; 5B2C   0319
        SWAP    R2,     1                       ; 5B2D   0042
        SUB@    R3,     R0                      ; 5B2E   0318
        SLR     R3,     1                       ; 5B2F   0063
        SUB@    R2,     R7                      ; 5B30   0317

        MOVR    R0,     R5                      ; 5B31   0085
        SUB@    R3,     R4                      ; 5B32   031C
        MOVR    R5,     R1                      ; 5B33   00A9
        SUB@    R2,     R2                      ; 5B34   0312
        ADDR    R1,     R3                      ; 5B35   00CB
        SUB@    R3,     R7                      ; 5B36   031F

        XORR    R7,     R5                      ; 5B37   01FD
        CMP@    R3,     R1                      ; 5B38   0359
        DECR    R0                              ; 5B39   0010
        CMP@    R3,     R0                      ; 5B3A   0358
        GSWD    R0                              ; 5B3B   0030
        CMP@    R2,     R7                      ; 5B3C   0357
        RLC     R1,     1                       ; 5B3D   0051
        CMP@    R3,     R4                      ; 5B3E   035C
        MOVR    R0,     R4                      ; 5B3F   0084
        CMP@    R2,     R2                      ; 5B40   0352
        ADDR    R0,     R7                      ; 5B41   00C7

        CMP@    R3,     R7                      ; 5B42   035F
        SUBR    R3,     R2                      ; 5B43   011A
        SUBI    #$0030, R1                      ; 5B44   0339 0030
        SUBI    #$0050, R0                      ; 5B46   0338 0050
        SUB@    R6,     R7                      ; 5B48   0337

        DECLE   $0071,  $033C,  $00A4,  $0332   ; 5B49   0071 033C 00A4 0332
        DECLE   $00F7,  $033F                   ; 5B4D   00F7 033F

        CMPR    R1,     R1                      ; 5B4F   0149
        CMP@    R1,     R1                      ; 5B50   0349
        RLC     R0,     1                       ; 5B51   0050
        CMP@    R1,     R0                      ; 5B52   0348
        RRC     R1,     1                       ; 5B53   0071
        CMP     G_0092, R7                      ; 5B54   0347 0092
        CMP@    R1,     R4                      ; 5B56   034C
        ADDR    R0,     R4                      ; 5B57   00C4
        CMP     G_0116, R2                      ; 5B58   0342 0116
        CMP@    R1,     R7                      ; 5B5A   034F
        CMPR    R7,     R2                      ; 5B5B   017A
        SUB@    R5,     R1                      ; 5B5C   0329
        RRC     R1,     1                       ; 5B5D   0071
        SUB@    R5,     R0                      ; 5B5E   0328
        TSTR    R2                              ; 5B5F   0092
        SUB@    R4,     R7                      ; 5B60   0327

        ADDR    R2,     R3                      ; 5B61   00D3
        SUB@    R5,     R4                      ; 5B62   032C
        CMPR    R2,     R5                      ; 5B63   0155
        SUB@    R4,     R2                      ; 5B64   0322
        ANDR    R5,     R1                      ; 5B65   01A9
        SUB@    R5,     R7                      ; 5B66   032F

        DECLE   $01FB,  $0389,  $0050,  $0388   ; 5B67   01FB 0389 0050 0388
        DECLE   $00A0,  $0387,  $00F2,  $038C   ; 5B6B   00A0 0387 00F2 038C
        DECLE   $0145,  $0382,  $0198,  $038F   ; 5B6F   0145 0382 0198 038F
        DECLE   $01EC,  $0399,  $0080,  $0398   ; 5B73   01EC 0399 0080 0398
        DECLE   $0101,  $0397,  $0133,  $039C   ; 5B77   0101 0397 0133 039C
        DECLE   $01A6,  $0392,  $021A,  $039F   ; 5B7B   01A6 0392 021A 039F
        DECLE   $028E,  $0040,  $00F4,  $0040   ; 5B7F   028E 0040 00F4 0040
        DECLE   $01E7,  $0040,  $032A,  $0396   ; 5B83   01E7 0040 032A 0396
        DECLE   $0000,  $03C3,  $0000,  $03C3   ; 5B87   0000 03C3 0000 03C3
        DECLE   $0000,  $03C1,  $0000,  $03C5   ; 5B8B   0000 03C1 0000 03C5
        DECLE   $0000,  $0023,  $0251,  $0005   ; 5B8F   0000 0023 0251 0005
        DECLE   $0001,  $0000                   ; 5B93   0001 0000

        NEGR    R3                              ; 5B95   0023
        MVO@    R4,     R2                      ; 5B96   0254
        INCR    R2                              ; 5B97   000A
        DIS                                     ; 5B98   0003
        MOVR    R0,     R1                      ; 5B99   0081
        NEGR    R3                              ; 5B9A   0023
        MVO@    R7,     R2                      ; 5B9B   0257
        INCR    R7                              ; 5B9C   000F

        DECLE   $0005                           ; 5B9D   0005
L_5B9E:
        CMPR    R0,     R2                      ; 5B9E   0142
        DECLE   $0010,  $0251,  $0008,  $0005   ; 5B9F   0010 0251 0008 0005

        CLRC                                    ; 5BA3   0006
        DECR    R0                              ; 5BA4   0010
        MVO@    R4,     R2                      ; 5BA5   0254
        INCR    R6                              ; 5BA6   000E
        INCR    R2                              ; 5BA7   000A
        SUBR    R0,     R7                      ; 5BA8   0107

        DECR    R0                              ; 5BA9   0010
        MVO@    R7,     R2                      ; 5BAA   0257
        DECR    R4                              ; 5BAB   0014
        INCR    R7                              ; 5BAC   000F

        ANDR    R1,     R1                      ; 5BAD   0189
L_5BAE:
        SWAP    R1,     2                       ; 5BAE   0045
        DECLE   $0251,  $000A,  $0005,  $00C3   ; 5BAF   0251 000A 0005 00C3
        DECLE   $0045,  $0254,  $001E,  $0008   ; 5BB3   0045 0254 001E 0008
        DECLE   $0205,  $0045,  $0257,  $0032   ; 5BB7   0205 0045 0257 0032
        DECLE   $000A,  $02CC,  $0067,  $0251   ; 5BBB   000A 02CC 0067 0251
        DECLE   $0014,  $0014,  $010A,  $0067   ; 5BBF   0014 0014 010A 0067
        DECLE   $0254,  $002D,  $001E,  $0252   ; 5BC3   0254 002D 001E 0252
        DECLE   $0067,  $0257,  $0046,  $0028   ; 5BC7   0067 0257 0046 0028
        DECLE   $0355,  $0089,  $0251,  $003C   ; 5BCB   0355 0089 0251 003C
        DECLE   $0028,  $02CD,  $0089,  $0254   ; 5BCF   0028 02CD 0089 0254
        DECLE   $004B,  $0032,  $034F,  $0089   ; 5BD3   004B 0032 034F 0089
        DECLE   $0257,  $005A,  $003C,  $03D1   ; 5BD7   0257 005A 003C 03D1
        DECLE   $0000,  $01A7,  $0003,  $0000   ; 5BDB   0000 01A7 0003 0000
        DECLE   $0000,  $0000,  $01B0,  $0006   ; 5BDF   0000 0000 01B0 0006
        DECLE   $0001,  $0041,  $0000,  $01B2   ; 5BE3   0001 0041 0000 01B2
        DECLE   $0009,  $0003,  $0082,  $0001   ; 5BE7   0009 0003 0082 0001
        DECLE   $01A7,  $0003,  $0005,  $0000   ; 5BEB   01A7 0003 0005 0000
        DECLE   $0001,  $01B0,  $0006,  $000A   ; 5BEF   0001 01B0 0006 000A
        DECLE   $0081,  $0001                   ; 5BF3   0081 0001

        ANDR    R6,     R2                      ; 5BF5   01B2
        INCR    R1                              ; 5BF6   0009
        INCR    R7                              ; 5BF7   000F

        ADDR    R0,     R2                      ; 5BF8   00C2
L_5BF9:
        NEGR    R2                              ; 5BF9   0022
        DECLE   $01A7,  $0004,  $0002,  $0006   ; 5BFA   01A7 0004 0002 0006
        DECLE   $0022,  $01B0,  $0008,  $0004   ; 5BFE   0022 01B0 0008 0004
        DECLE   $0047,  $0022,  $01B2,  $000C   ; 5C02   0047 0022 01B2 000C
        DECLE   $0006,  $00C8,  $0023,  $01A7   ; 5C06   0006 00C8 0023 01A7
        DECLE   $0004                           ; 5C0A   0004

        SETC                                    ; 5C0B   0007
        SWAP    R2,     2                       ; 5C0C   0046
        NEGR    R3                              ; 5C0D   0023
        ANDR    R6,     R0                      ; 5C0E   01B0
        INCR    R0                              ; 5C0F   0008
        INCR    R4                              ; 5C10   000C
        MOVR    R0,     R7                      ; 5C11   0087

        DECLE   $0023,  $01B2,  $000C,  $0011   ; 5C12   0023 01B2 000C 0011
        DECLE   $0108,  $0011,  $0166,  $000A   ; 5C16   0108 0011 0166 000A
        DECLE   $0008,  $004C,  $0011,  $0163   ; 5C1A   0008 004C 0011 0163
        DECLE   $0014,  $000D,  $010E,  $0011   ; 5C1E   0014 000D 010E 0011
        DECLE   $0172,  $001E,  $0014,  $0190   ; 5C22   0172 001E 0014 0190
        DECLE   $0013,  $0166,  $000A,  $0012   ; 5C26   0013 0166 000A 0012
        DECLE   $008D,  $0013,  $0163,  $0014   ; 5C2A   008D 0013 0163 0014
        DECLE   $001B,  $014F,  $0013,  $0172   ; 5C2E   001B 014F 0013 0172
        DECLE   $001E,  $0026,  $0211,  $0055   ; 5C32   001E 0026 0211 0055
        DECLE   $0367,  $0046,  $0020,  $01D2   ; 5C36   0367 0046 0020 01D2
        DECLE   $0055,  $0370,  $0055,  $002C   ; 5C3A   0055 0370 0055 002C
        DECLE   $0314,  $0055,  $0372,  $0063   ; 5C3E   0314 0055 0372 0063
        DECLE   $003C,  $0396,  $0057,  $0367   ; 5C42   003C 0396 0057 0367
        DECLE   $0046,  $003C,  $02D3,  $0057   ; 5C46   0046 003C 02D3 0057
        DECLE   $0370,  $0055,  $0050,  $0355   ; 5C4A   0370 0055 0050 0355
        DECLE   $0057,  $0372,  $0063,  $005A   ; 5C4E   0057 0372 0063 005A
        DECLE   $03D7,  $0011,  $0286,  $0005   ; 5C52   03D7 0011 0286 0005
        DECLE   $0003,  $0001,  $0011,  $0283   ; 5C56   0003 0001 0011 0283
        DECLE   $000A,  $0005                   ; 5C5A   000A 0005

        SWAP    R2,     1                       ; 5C5C   0042
        DECR    R1                              ; 5C5D   0011
        MVI@    R2,     R2                      ; 5C5E   0292
        INCR    R7                              ; 5C5F   000F

        SETC                                    ; 5C60   0007
L_5C61:
        MOVR    R0,     R4                      ; 5C61   0084
        DECLE   $0013,  $0286,  $0005,  $0008   ; 5C62   0013 0286 0005 0008
        DECLE   $0001                           ; 5C66   0001

        DECR    R3                              ; 5C67   0013
        MVI     .STIC.Y.2,R3                    ; 5C68   0283 000A
        INCR    R5                              ; 5C6A   000D
        MOVR    R0,     R3                      ; 5C6B   0083
        DECR    R3                              ; 5C6C   0013
        MVI@    R2,     R2                      ; 5C6D   0292
        INCR    R7                              ; 5C6E   000F

        DECR    R2                              ; 5C6F   0012
L_5C70:
        ADDR    R0,     R5                      ; 5C70   00C5
        DECLE   $0055,  $0387,  $002D,  $0014   ; 5C71   0055 0387 002D 0014
        DECLE   $0189,  $0055,  $0390,  $0041   ; 5C75   0189 0055 0390 0041
        DECLE   $001E,  $02CA,  $0055,  $0392   ; 5C79   001E 02CA 0055 0392
        DECLE   $0050,  $0028,  $034B,  $0057   ; 5C7D   0050 0028 034B 0057
        DECLE   $0387                           ; 5C81   0387

        ADCR    R5                              ; 5C82   002D
        NEGR    R2                              ; 5C83   0022
        MVO@    R1,     R1                      ; 5C84   0249
        RLC     R3,     2                       ; 5C85   0057
        AND@    R2,     R0                      ; 5C86   0390
        SWAP    R1,     1                       ; 5C87   0041
        ADCR    R7                              ; 5C88   002F

        SUB@    R1,     R2                      ; 5C89   030A
L_5C8A:
        RLC     R3,     2                       ; 5C8A   0057
        DECLE   $0392,  $0050,  $003C,  $038B   ; 5C8B   0392 0050 003C 038B
        DECLE   $008A,  $0377,  $0032,  $0028   ; 5C8F   008A 0377 0032 0028
        DECLE   $03D5,  $00CC,  $0063,  $0063   ; 5C93   03D5 00CC 0063 0063
        DECLE   $0000,  $FFCD,  $00CC,  $0063   ; 5C97   0000 FFCD 00CC 0063
        DECLE   $0063,  $0000,  $FFCD,  $00CC   ; 5C9B   0063 0000 FFCD 00CC
        DECLE   $0071,  $0063,  $0000,  $FFCD   ; 5C9F   0071 0063 0000 FFCD
        DECLE   $00CC,  $0076,  $0063,  $0000   ; 5CA3   00CC 0076 0063 0000
        DECLE   $FFCD                           ; 5CA7   FFCD

        SUB     .STIC.X.0,R0                    ; 5CA8   0300 0000
        MOVR    R5,     R7                      ; 5CAA   00AF

        DECLE   $005C,  $0009,  $0034,  $0000   ; 5CAB   005C 0009 0034 0000

        CLRR    R0                              ; 5CAF   01C0
        MVO     R0,     G_0138                  ; 5CB0   0240 0138
L_5CB2:
        CLRR    R0                              ; 5CB2   01C0
        MVO@    R0,     R1                      ; 5CB3   0248
        INCR    R1                              ; 5CB4   0009
        MVO@    R0,     R1                      ; 5CB5   0248
        MOVR    R5,     R7                      ; 5CB6   00AF

L_5CB7:
        MOVR    R1,     R4                      ; 5CB7   008C
        SDBD                                    ; 5CB8   0001
        MVII    #$30D0, R2                      ; 5CB9   02BA 00D0 0030
        MVO@    R2,     R4                      ; 5CBC   0262
        SDBD                                    ; 5CBD   0001
        MVII    #$5CDC, R0                      ; 5CBE   02B8 00DC 005C
        MVO@    R0,     R4                      ; 5CC1   0260
        MVII    #$0050, R0                      ; 5CC2   02B8 0050
        SWAP    R0,     1                       ; 5CC4   0040
        MVO@    R0,     R4                      ; 5CC5   0260
        INCR    R4                              ; 5CC6   000C
        MVII    #$00F8, R0                      ; 5CC7   02B8 00F8
        MVO@    R0,     R4                      ; 5CC9   0260
        MVII    #$03F0, R0                      ; 5CCA   02B8 03F0
        MVO@    R0,     R4                      ; 5CCC   0260
        MVII    #$001E, R0                      ; 5CCD   02B8 001E
        MVO@    R0,     R4                      ; 5CCF   0260
        MVII    #$0003, R0                      ; 5CD0   02B8 0003
        MVO     R0,     G_0138                  ; 5CD2   0240 0138
        MOVR    R5,     R7                      ; 5CD4   00AF

        DECLE   $0300,  $0000,  $0000,  $0000   ; 5CD5   0300 0000 0000 0000
        DECLE   $0002,  $007A,  $0000           ; 5CD9   0002 007A 0000

        SUB     .STIC.X.0,R0                    ; 5CDC   0300 0000
        MOVR    R5,     R7                      ; 5CDE   00AF

        DECLE   $005C,  $0002,  $0046,  $0000   ; 5CDF   005C 0002 0046 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5CE3   0300 0000 0000 0000
        DECLE   $0003,  $004B,  $0000,  $0300   ; 5CE7   0003 004B 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0006   ; 5CEB   0000 0000 0000 0006
        DECLE   $0051,  $0000,  $0300,  $0000   ; 5CEF   0051 0000 0300 0000
        DECLE   $0001,  $0067,  $0006,  $0057   ; 5CF3   0001 0067 0006 0057
        DECLE   $0000,  $0300,  $0000,  $0052   ; 5CF7   0000 0300 0000 0052
        DECLE   $0067,  $0006,  $005D,  $0000   ; 5CFB   0067 0006 005D 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5CFF   0300 0000 0000 0000
        DECLE   $0006,  $0063,  $0000,  $0300   ; 5D03   0006 0063 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0006   ; 5D07   0000 0000 0000 0006
        DECLE   $0069,  $0000,  $0300,  $0000   ; 5D0B   0069 0000 0300 0000
        DECLE   $00FE,  $0066,  $0003,  $006F   ; 5D0F   00FE 0066 0003 006F
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5D13   0000 0300 0000 0000
        DECLE   $0000,  $0002,  $0075,  $0000   ; 5D17   0000 0002 0075 0000
        DECLE   $0300,  $0000,  $0053,  $0066   ; 5D1B   0300 0000 0053 0066
        DECLE   $000B,  $0000,  $0000,  $0300   ; 5D1F   000B 0000 0000 0300
        DECLE   $0000,  $0053,  $0066,  $0008   ; 5D23   0000 0053 0066 0008
        DECLE   $0014,  $0000,  $0300,  $0000   ; 5D27   0014 0000 0300 0000
        DECLE   $0053,  $0066,  $000C,  $001C   ; 5D2B   0053 0066 000C 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2F   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $000B,  $0001   ; 5D33   0000 0006 000B 0001

        DIS                                     ; 5D37   0003
        DIS                                     ; 5D38   0003
L_5D39:
        DECR    R7                              ; 5D39   0017

        DECLE   $002D,  $0047,  $0048,  $004A   ; 5D3A   002D 0047 0048 004A
        DECLE   $0024,  $0002,  $0000,  $0000   ; 5D3E   0024 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D42   0000 0000 0000 0000
        DECLE   $0001                           ; 5D46   0001

        DIS                                     ; 5D47   0003
        DIS                                     ; 5D48   0003
L_5D49:
        DECR    R7                              ; 5D49   0017

        DECLE   $002D,  $0047,  $0048,  $004A   ; 5D4A   002D 0047 0048 004A
        DECLE   $0024,  $0002,  $0000,  $0000   ; 5D4E   0024 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D52   0000 0000 0000 0000
        DECLE   $001E,  $007F,  $00FF,  $00FF   ; 5D56   001E 007F 00FF 00FF
        DECLE   $007F,  $009D,  $0089,  $0090   ; 5D5A   007F 009D 0089 0090
        DECLE   $0050,  $0008,  $0000,  $0082   ; 5D5E   0050 0008 0000 0082
        DECLE   $0082,  $0041,  $0041,  $0022   ; 5D62   0082 0041 0041 0022
        DECLE   $003E,  $007F,  $005B,  $007F   ; 5D66   003E 007F 005B 007F
        DECLE   $0036,  $0022,  $0014,  $0041   ; 5D6A   0036 0022 0014 0041
        DECLE   $0041,  $0022,  $0000,  $0000   ; 5D6E   0041 0022 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 5D76   0000 0000 0000 000C
        DECLE   $0033,  $0060,  $0060,  $007C   ; 5D7A   0033 0060 0060 007C
        DECLE   $003F                           ; 5D7E   003F

        INCR    R7                              ; 5D7F   000F

        INCR    R4                              ; 5D80   000C
L_5D81:
        RSWD    R6                              ; 5D81   003E
        DECLE   $0027                           ; 5D82   0027

        INCR    R7                              ; 5D83   000F

        DECR    R3                              ; 5D84   0013
L_5D85:
        DIS                                     ; 5D85   0003
        DECLE   $0006,  $000C,  $000C,  $000C   ; 5D86   0006 000C 000C 000C
        DECLE   $0018,  $005B,  $009C,  $009E   ; 5D8A   0018 005B 009C 009E
        DECLE   $006F,  $0007,  $0000,  $0000   ; 5D8E   006F 0007 0000 0000
        DECLE   $0001                           ; 5D92   0001

        SETC                                    ; 5D93   0007
        INCR    R7                              ; 5D94   000F

        DECLE   $001F                           ; 5D95   001F
L_5D96:
        COMR    R6                              ; 5D96   001E
        DECLE   $003E,  $003F                   ; 5D97   003E 003F

        SARC    R3,     2                       ; 5D99   007F
        SARC    R3,     2                       ; 5D9A   007F
        ADDR    R3,     R7                      ; 5D9B   00DF
        INCR    R7                              ; 5D9C   000F

        SETC                                    ; 5D9D   0007
L_5D9E:
        CLRC                                    ; 5D9E   0006
        DECLE   $000C,  $0000,  $0000,  $0001   ; 5D9F   000C 0000 0000 0001
        DECLE   $0003,  $0007,  $000C,  $0006   ; 5DA3   0003 0007 000C 0006
        DECLE   $000F,  $001B,  $001F,  $0037   ; 5DA7   000F 001B 001F 0037
        DECLE   $006F,  $005F,  $0037,  $000C   ; 5DAB   006F 005F 0037 000C
        DECLE   $0018,  $0000,  $0060,  $0050   ; 5DAF   0018 0000 0060 0050
        DECLE   $00E8,  $00D4,  $00AA,  $007E   ; 5DB3   00E8 00D4 00AA 007E
        DECLE   $007F,  $00FF,  $00FF,  $00DF   ; 5DB7   007F 00FF 00FF 00DF
        DECLE   $0099,  $00B3,  $00B2,  $005B   ; 5DBB   0099 00B3 00B2 005B
        DECLE   $0030,  $000C,  $003E,  $0027   ; 5DBF   0030 000C 003E 0027

        INCR    R7                              ; 5DC3   000F

        DECR    R3                              ; 5DC4   0013
L_5DC5:
        DIS                                     ; 5DC5   0003
        DECLE   $0006,  $0006,  $0007,  $0003   ; 5DC6   0006 0006 0007 0003
        DECLE   $0003,  $0003,  $0002,  $0006   ; 5DCA   0003 0003 0002 0006
        DECLE   $000C,  $0000,  $0003,  $0005   ; 5DCE   000C 0000 0003 0005
        DECLE   $0006,  $0003,  $0001,  $000A   ; 5DD2   0006 0003 0001 000A
        DECLE   $0015,  $0013,  $0025,  $0023   ; 5DD6   0015 0013 0025 0023
        DECLE   $0004,  $0006,  $0004,  $0008   ; 5DDA   0004 0006 0004 0008
        DECLE   $0008,  $0018,  $0003,  $0005   ; 5DDE   0008 0018 0003 0005
        DECLE   $0006,  $0003,  $0001,  $001A   ; 5DE2   0006 0003 0001 001A
        DECLE   $003D,  $003F,  $003D,  $001B   ; 5DE6   003D 003F 003D 001B
        DECLE   $0004,  $0006,  $0004,  $0008   ; 5DEA   0004 0006 0004 0008
        DECLE   $0008,  $0018,  $0003,  $0005   ; 5DEE   0008 0018 0003 0005
        DECLE   $0006,  $0003,  $0001,  $000E   ; 5DF2   0006 0003 0001 000E
        DECLE   $001F,  $001F,  $0037,  $0027   ; 5DF6   001F 001F 0037 0027
        DECLE   $0007,  $0007,  $0007,  $000F   ; 5DFA   0007 0007 0007 000F
        DECLE   $000F,  $001F,  $0003,  $0005   ; 5DFE   000F 001F 0003 0005
        DECLE   $0006,  $0003,  $0001,  $0036   ; 5E02   0006 0003 0001 0036
        DECLE   $007B,  $007F,  $007B,  $0037   ; 5E06   007B 007F 007B 0037
        DECLE   $0007,  $0007,  $0007,  $000F   ; 5E0A   0007 0007 0007 000F
        DECLE   $000F,  $001F,  $0010,  $0038   ; 5E0E   000F 001F 0010 0038
        DECLE   $0038,  $0010,  $0038,  $007C   ; 5E12   0038 0010 0038 007C
        DECLE   $00FE,  $00BA,  $00BA,  $0038   ; 5E16   00FE 00BA 00BA 0038
        DECLE   $0038,  $0028,  $0028,  $0028   ; 5E1A   0038 0028 0028 0028
        DECLE   $006C,  $0000,  $0003,  $0007   ; 5E1E   006C 0000 0003 0007
        DECLE   $0007,  $0003,  $001F,  $003F   ; 5E22   0007 0003 001F 003F

        RRC     R3,     2                       ; 5E26   0077
        ADDR    R4,     R7                      ; 5E27   00E7
        ADDR    R1,     R7                      ; 5E28   00CF

        SAR     R3,     2                       ; 5E29   006F
        INCR    R7                              ; 5E2A   000F

        INCR    R6                              ; 5E2B   000E
L_5E2C:
        INCR    R6                              ; 5E2C   000E
        INCR    R6                              ; 5E2D   000E
        CLRC                                    ; 5E2E   0006
        COMR    R6                              ; 5E2F   001E
        DECR    R0                              ; 5E30   0010
        RSWD    R0                              ; 5E31   0038
        RSWD    R0                              ; 5E32   0038
        DECR    R0                              ; 5E33   0010
        RSWD    R0                              ; 5E34   0038
        RRC     R2,     2                       ; 5E35   0076
        ADDR    R5,     R7                      ; 5E36   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5E37   00BF 00AF 0036 0038
        DECLE   $0028,  $0028,  $0028,  $006C   ; 5E3B   0028 0028 0028 006C
        DECLE   $0000,  $0003,  $0007,  $0007   ; 5E3F   0000 0003 0007 0007
        DECLE   $0003,  $003B,  $007D,  $00FE   ; 5E43   0003 003B 007D 00FE
        DECLE   $00EE,  $00FE,  $007D,  $003B   ; 5E47   00EE 00FE 007D 003B
        DECLE   $000E,  $000E,  $000E,  $0006   ; 5E4B   000E 000E 000E 0006
        DECLE   $001E,  $0010,  $0028,  $0028   ; 5E4F   001E 0010 0028 0028
        DECLE   $0010,  $0038,  $007C,  $00FE   ; 5E53   0010 0038 007C 00FE
        DECLE   $00BA,  $00BA,  $0038,  $0038   ; 5E57   00BA 00BA 0038 0038
        DECLE   $0038,  $007C,  $007C,  $00FE   ; 5E5B   0038 007C 007C 00FE
        DECLE   $0000,  $0003,  $0006,  $0004   ; 5E5F   0000 0003 0006 0004

        EIS                                     ; 5E63   0002
        INCR    R7                              ; 5E64   000F

        DECLE   $003F                           ; 5E65   003F
L_5E66:
        RRC     R3,     2                       ; 5E66   0077
        ADDR    R5,     R7                      ; 5E67   00EF
        ADDR    R1,     R7                      ; 5E68   00CF

        DECLE   $006F,  $000F,  $001F,  $001F   ; 5E69   006F 000F 001F 001F
        DECLE   $003F,  $003F                   ; 5E6D   003F 003F

        SARC    R3,     2                       ; 5E6F   007F
        DECR    R0                              ; 5E70   0010
        ADCR    R0                              ; 5E71   0028
        ADCR    R0                              ; 5E72   0028
        DECR    R0                              ; 5E73   0010
        RSWD    R0                              ; 5E74   0038
        RRC     R2,     2                       ; 5E75   0076
        ADDR    R5,     R7                      ; 5E76   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5E77   00BF 00AF 0036 0038
        DECLE   $0038,  $007C,  $007C,  $00FE   ; 5E7B   0038 007C 007C 00FE
        DECLE   $0000,  $0003,  $0006,  $0004   ; 5E7F   0000 0003 0006 0004
        DECLE   $0002,  $003B,  $007D,  $00EE   ; 5E83   0002 003B 007D 00EE
        DECLE   $00D6,  $00EE,  $007D,  $003B   ; 5E87   00D6 00EE 007D 003B
        DECLE   $000F,  $000F,  $001F,  $001F   ; 5E8B   000F 000F 001F 001F
        DECLE   $003F,  $0004,  $0003,  $0005   ; 5E8F   003F 0004 0003 0005

        SETC                                    ; 5E93   0007
        EIS                                     ; 5E94   0002
        INCR    R7                              ; 5E95   000F

        DECLE   $003F                           ; 5E96   003F
L_5E97:
        RRC     R3,     2                       ; 5E97   0077
        ADDR    R1,     R7                      ; 5E98   00CF

        SLR     R3,     2                       ; 5E99   0067
        INCR    R7                              ; 5E9A   000F
        INCR    R7                              ; 5E9B   000F

L_5E9C:
        INCR    R6                              ; 5E9C   000E
L_5E9D:
        INCR    R6                              ; 5E9D   000E
        CLRC                                    ; 5E9E   0006
        COMR    R6                              ; 5E9F   001E
        DECR    R0                              ; 5EA0   0010
        RSWD    R0                              ; 5EA1   0038
        RSWD    R0                              ; 5EA2   0038
        DECR    R0                              ; 5EA3   0010
        RSWD    R0                              ; 5EA4   0038
        RRC     R2,     2                       ; 5EA5   0076
        ADDR    R5,     R7                      ; 5EA6   00EF

        DECLE   $00BF,  $00AF,  $0036,  $0038   ; 5EA7   00BF 00AF 0036 0038
        DECLE   $0028,  $0028,  $0028,  $006C   ; 5EAB   0028 0028 0028 006C
        DECLE   $0000,  $0004,  $0003,  $0005   ; 5EAF   0000 0004 0003 0005

        SETC                                    ; 5EB3   0007
        EIS                                     ; 5EB4   0002
        RSWD    R3                              ; 5EB5   003B
        SARC    R1,     2                       ; 5EB6   007D
        ADDR    R5,     R6                      ; 5EB7   00EE
        ADDR    R5,     R6                      ; 5EB8   00EE
        SARC    R1,     2                       ; 5EB9   007D
        RSWD    R3                              ; 5EBA   003B
        INCR    R7                              ; 5EBB   000F

        INCR    R6                              ; 5EBC   000E
L_5EBD:
        INCR    R6                              ; 5EBD   000E
        DECLE   $0006,  $001E,  $00A5,  $00A5   ; 5EBE   0006 001E 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5EC2   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5EC6   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00A5,  $00A5   ; 5ECA   00FF 00A5 00A5 00A5
        DECLE   $00FF,  $00A5,  $00AA,  $00AA   ; 5ECE   00FF 00A5 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5ED2   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5ED6   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EDA   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00FF,  $00AA   ; 5EDE   00FF 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5EE2   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5EE6   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5EEA   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5EEE   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EF2   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5EF6   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5EFA   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5EFE   0000 0000 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5F02   00AA 00AA 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5F06   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5F0E   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $00AA,  $00AA   ; 5F12   00FF 00AA 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5F16   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5F1E   0000 0000 00FF 00AA
        DECLE   $00AA,  $00AA,  $00FF,  $00AA   ; 5F22   00AA 00AA 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5F2E   0000 0000 00AA 00AA
        DECLE   $00FF,  $00AA,  $0000,  $0000   ; 5F32   00FF 00AA 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00AA   ; 5F3E   0000 0000 00FF 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0036   ; 5F5E   0000 0000 001C 0036
        DECLE   $006B,  $00BF,  $00D7,  $0034   ; 5F62   006B 00BF 00D7 0034
        DECLE   $006E,  $0038,  $001C,  $0034   ; 5F66   006E 0038 001C 0034
        DECLE   $0028,  $0018,  $0010,  $0008   ; 5F6A   0028 0018 0010 0008
        DECLE   $0010,  $0000                   ; 5F6E   0010 0000

        COMR    R4                              ; 5F70   001C
        ADCR    R2                              ; 5F71   002A
        SLL     R1,     2                       ; 5F72   004D
        ADDR    R7,     R3                      ; 5F73   00FB
        MOVR    R5,     R7                      ; 5F74   00AF

        DECLE   $0056,  $007A,  $001C,  $002C   ; 5F75   0056 007A 001C 002C
        DECLE   $0014,  $0028,  $0018,  $0008   ; 5F79   0014 0028 0018 0008
        DECLE   $0010,  $0008,  $0000,  $0008   ; 5F7D   0010 0008 0000 0008
        DECLE   $0014,  $0010,  $0038,  $007C   ; 5F81   0014 0010 0038 007C
        DECLE   $007C,  $007C,  $0038,  $0000   ; 5F85   007C 007C 0038 0000
        DECLE   $00FE,  $00FE,  $00FE,  $0005   ; 5F89   00FE 00FE 00FE 0005
        DECLE   $0009,  $0012,  $000C,  $0082   ; 5F8D   0009 0012 000C 0082
        DECLE   $007C,  $0054,  $006C,  $0054   ; 5F91   007C 0054 006C 0054
        DECLE   $007C,  $007C,  $0082,  $0000   ; 5F95   007C 007C 0082 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0024,  $003C   ; 5F9D   0000 0000 0024 003C
        DECLE   $0024,  $003C,  $0024,  $003C   ; 5FA1   0024 003C 0024 003C
        DECLE   $007E,  $007E,  $003C,  $0000   ; 5FA5   007E 007E 003C 0000
        DECLE   $0042,  $0042,  $007E,  $0042   ; 5FA9   0042 0042 007E 0042
        DECLE   $007E,  $0042,  $007E,  $0042   ; 5FAD   007E 0042 007E 0042
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 5FB1   007E 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $006E   ; 5FB5   00FF 007E 003C 006E
        DECLE   $0077,  $003F,  $005F,  $00EE   ; 5FB9   0077 003F 005F 00EE
        DECLE   $00F0,  $007C,  $0038,  $0000   ; 5FBD   00F0 007C 0038 0000
        DECLE   $0010,  $0038,  $007C,  $007C   ; 5FC1   0010 0038 007C 007C
        DECLE   $00EE,  $00C6,  $0044,  $0000   ; 5FC5   00EE 00C6 0044 0000
        DECLE   $0070,  $0018,  $000C,  $002C   ; 5FC9   0070 0018 000C 002C
        DECLE   $001E,  $000E,  $0004,  $00C6   ; 5FCD   001E 000E 0004 00C6
        DECLE   $00FE,  $00FE,  $007C,  $007C   ; 5FD1   00FE 00FE 007C 007C
        DECLE   $00FE,  $007C,  $0038,  $003C   ; 5FD5   00FE 007C 0038 003C
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 5FD9   007E 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 5FDD   00FF 007E 003C 0000
        DECLE   $007C,  $007C,  $007C,  $007C   ; 5FE1   007C 007C 007C 007C
        DECLE   $0038,  $0038,  $0010,  $0008   ; 5FE5   0038 0038 0010 0008
        DECLE   $0010,  $0020,  $0020,  $0020   ; 5FE9   0010 0020 0020 0020
        DECLE   $0020,  $0010,  $0008,  $0010   ; 5FED   0020 0010 0008 0010
        DECLE   $0020,  $0040,  $007E,  $007E   ; 5FF1   0020 0040 007E 007E
        DECLE   $0040,  $0020,  $0010,  $0000   ; 5FF5   0040 0020 0010 0000
        DECLE   $0020,  $0070,  $00F8,  $006C   ; 5FF9   0020 0070 00F8 006C
        DECLE   $0026,  $0003,  $0001,  $0000   ; 5FFD   0026 0003 0001 0000
        DECLE   $0000,  $0030,  $0030,  $0008   ; 6001   0000 0030 0030 0008
        DECLE   $0004,  $0002,  $0001,  $00C0   ; 6005   0004 0002 0001 00C0
        DECLE   $00C0,  $0020,  $0010,  $0008   ; 6009   00C0 0020 0010 0008
        DECLE   $0004,  $0002,  $0001,  $0000   ; 600D   0004 0002 0001 0000
        DECLE   $0000,  $0000,  $0010,  $0008   ; 6011   0000 0000 0010 0008
        DECLE   $0005,  $0002,  $0005,  $0000   ; 6015   0005 0002 0005 0000
        DECLE   $0000,  $00FC,  $00FE,  $00BF   ; 6019   0000 00FC 00FE 00BF
        DECLE   $00FF,  $007F,  $003F,  $0000   ; 601D   00FF 007F 003F 0000
        DECLE   $001E,  $0036                   ; 6021   001E 0036

        SARC    R3,     2                       ; 6023   007F
        ADDR    R7,     R5                      ; 6024   00FD
        ADDR    R7,     R1                      ; 6025   00F9
        ADDR    R6,     R2                      ; 6026   00F2
        INCR    R4                              ; 6027   000C
        ADDR    R7,     R0                      ; 6028   00F8
        SARC    R0,     2                       ; 6029   007C
        MOVR    R7,     R6                      ; 602A   00BE
        ADDR    R3,     R7                      ; 602B   00DF

        DECLE   $00A0,  $00FF,  $007F,  $003F   ; 602C   00A0 00FF 007F 003F
        DECLE   $000C,  $000E,  $0077,  $00FB   ; 6030   000C 000E 0077 00FB
        DECLE   $00FC,  $00FC,  $00FC,  $0078   ; 6034   00FC 00FC 00FC 0078
        DECLE   $000C,  $0042,  $00A1,  $0081   ; 6038   000C 0042 00A1 0081
        DECLE   $0081,  $0042,  $003C,  $003C   ; 603C   0081 0042 003C 003C
        DECLE   $0000,  $0008,  $000C,  $0036   ; 6040   0000 0008 000C 0036
        DECLE   $007A,  $007C,  $007C,  $0038   ; 6044   007A 007C 007C 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6048   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $007E   ; 604C   0000 003C 007E 007E
        DECLE   $0030,  $0048,  $0088,  $0084   ; 6050   0030 0048 0088 0084
        DECLE   $0042,  $0021,  $0019,  $0006   ; 6054   0042 0021 0019 0006
        DECLE   $0044,  $007C,  $007C,  $0038   ; 6058   0044 007C 007C 0038
        DECLE   $0010,  $0010,  $0038,  $007C   ; 605C   0010 0010 0038 007C
        DECLE   $0010,  $0038,  $0010,  $0010   ; 6060   0010 0038 0010 0010
        DECLE   $00BA,  $00FE,  $0054,  $00FE   ; 6064   00BA 00FE 0054 00FE
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6068   0000 0000 0000 0008
        DECLE   $009D,  $007F,  $003E,  $001C   ; 606C   009D 007F 003E 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6070   0000 0000 0000 0000
        DECLE   $0010,  $0028,  $0054,  $00AA   ; 6074   0010 0028 0054 00AA
        DECLE   $0000,  $0000,  $0010,  $0038   ; 6078   0000 0000 0010 0038
        DECLE   $0010,  $0038,  $007C,  $0038   ; 607C   0010 0038 007C 0038
        DECLE   $0000,  $0000,  $0038,  $0010   ; 6080   0000 0000 0038 0010
        DECLE   $0038,  $007C,  $007C,  $0038   ; 6084   0038 007C 007C 0038
        DECLE   $0010,  $0028,  $004C,  $0072   ; 6088   0010 0028 004C 0072
        DECLE   $0074,  $003A,  $001C,  $0008   ; 608C   0074 003A 001C 0008
        DECLE   $0010,  $0028,  $0044,  $0062   ; 6090   0010 0028 0044 0062
        DECLE   $0074,  $003A,  $001C,  $0008   ; 6094   0074 003A 001C 0008
        DECLE   $0010,  $0038,  $007C,  $007E   ; 6098   0010 0038 007C 007E
        DECLE   $007C,  $003A,  $001C,  $0008   ; 609C   007C 003A 001C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60A0   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $007A,  $0024   ; 60A4   0000 0004 007A 0024
        DECLE   $0004,  $0008,  $001D,  $003E   ; 60A8   0004 0008 001D 003E
        DECLE   $007C,  $00B8,  $0010,  $0020   ; 60AC   007C 00B8 0010 0020
        DECLE   $0010,  $0038,  $006C,  $0076   ; 60B0   0010 0038 006C 0076
        DECLE   $007C,  $003A,  $001C,  $0008   ; 60B4   007C 003A 001C 0008
        DECLE   $0000,  $00C0,  $0078,  $001E   ; 60B8   0000 00C0 0078 001E
        DECLE   $0007,  $0002,  $0000,  $0000   ; 60BC   0007 0002 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0038   ; 60C0   0000 0000 0060 0038
        DECLE   $000E,  $0004,  $0000,  $0000   ; 60C4   000E 0004 0000 0000
        DECLE   $0004,  $0072,  $009A,  $003E   ; 60C8   0004 0072 009A 003E
        DECLE   $007C,  $0059,  $004E,  $0020   ; 60CC   007C 0059 004E 0020
        DECLE   $0000,  $0024,  $0052,  $001C   ; 60D0   0000 0024 0052 001C
        DECLE   $0038,  $004A,  $0024,  $0000   ; 60D4   0038 004A 0024 0000
        DECLE   $0000,  $0000,  $0010,  $0028   ; 60D8   0000 0000 0010 0028
        DECLE   $0010,  $0000,  $0000,  $0000   ; 60DC   0010 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0028   ; 60E0   0000 0010 0038 0028
        DECLE   $0038,  $0010,  $0000,  $0000   ; 60E4   0038 0010 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 60E8   0000 0000 0000

        NEGR    R0                              ; 60EB   0020
        RLC     R0,     1                       ; 60EC   0050
        MOVR    R5,     R0                      ; 60ED   00A8
        RLC     R0,     2                       ; 60EE   0054
        MOVR    R5,     R6                      ; 60EF   00AE
        ADDR    R3,     R7                      ; 60F0   00DF

        DECLE   $00E0,  $00BF,  $00FF,  $00FF   ; 60F1   00E0 00BF 00FF 00FF
        DECLE   $007F,  $003F,  $001F,  $0018   ; 60F5   007F 003F 001F 0018
        DECLE   $0024,  $005A,  $00B5,  $00BD   ; 60F9   0024 005A 00B5 00BD
        DECLE   $005A,  $0024,  $0018,  $0000   ; 60FD   005A 0024 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6101   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 6105   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $006C   ; 6109   0000 0000 0038 006C
        DECLE   $007C,  $0000,  $0000,  $0000   ; 610D   007C 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $003C   ; 6111   0000 0018 003C 003C
        DECLE   $003C,  $0000,  $0000           ; 6115   003C 0000 0000
L_6118:
        PSHR    R5                              ; 6118   0275
        MVI     G_0138, R1                      ; 6119   0281 0138
        ANDI    #$0002, R1                      ; 611B   03B9 0002
        BNEQ    L_6352                          ; 611D   020C 0233

        MVII    #$032D, R1                      ; 611F   02B9 032D
        MVII    #$0160, R4                      ; 6121   02BC 0160
L_6123:
        MVI@    R4,     R3                      ; 6123   02A3
        DECR    R3                              ; 6124   0013
        BMI     L_61B4                          ; 6125   020B 008D

        CMPI    #$00BF, R3                      ; 6127   037B 00BF
        BGT     L_61E9                          ; 6129   020E 00BE

        ADDI    #$0002, R1                      ; 612B   02F9 0002
        MOVR    R4,     R5                      ; 612D   00A5
        SUBI    #$0161, R5                      ; 612E   033D 0161
        ADDR    R5,     R5                      ; 6130   00ED
        ADD     G_018C, R5                      ; 6131   02C5 018C
        ADDR    R5,     R5                      ; 6133   00ED
        ADDR    R7,     R5                      ; 6134   00FD
        ADDI    #$00A0, R5                      ; 6135   02FD 00A0
        MVI@    R5,     R0                      ; 6137   02A8
        SWAP    R0,     1                       ; 6138   0040
        MVO@    R0,     R1                      ; 6139   0248
        INCR    R1                              ; 613A   0009
        MVI@    R5,     R0                      ; 613B   02A8
        SWAP    R0,     1                       ; 613C   0040
        MVO@    R0,     R1                      ; 613D   0248
        INCR    R1                              ; 613E   0009
        CLRR    R0                              ; 613F   01C0
        MVO@    R0,     R1                      ; 6140   0248
        INCR    R1                              ; 6141   0009
        PSHR    R3                              ; 6142   0273
        SLL     R3,     1                       ; 6143   004B
        SDBD                                    ; 6144   0001
        ADDI    #$5A1E, R3                      ; 6145   02FB 001E 005A
        MVI@    R3,     R3                      ; 6148   029B
        MOVR    R3,     R0                      ; 6149   0098
        ANDI    #$0007, R0                      ; 614A   03B8 0007
        XORR    R0,     R3                      ; 614C   01C3
        SLL     R3,     1                       ; 614D   004B
        ADDR    R3,     R0                      ; 614E   00D8
        ANDI    #$001F, R0                      ; 614F   03B8 001F
        MOVR    R3,     R2                      ; 6151   009A
        SWAP    R2,     1                       ; 6152   0042
        ANDI    #$0007, R2                      ; 6153   03BA 0007
        SLR     R3,     2                       ; 6155   0067
        SLR     R3,     2                       ; 6156   0067
        SLR     R3,     1                       ; 6157   0063
        ANDI    #$0007, R3                      ; 6158   03BB 0007
        INCR    R1                              ; 615A   0009
        CLRR    R5                              ; 615B   01ED
        MVO@    R5,     R1                      ; 615C   024D
        SDBD                                    ; 615D   0001
        ADDI    #$1000, R0                      ; 615E   02F8 0000 0010
        MVI     G_0135, R5                      ; 6161   0285 0135
        ANDI    #$0004, R5                      ; 6163   03BD 0004
        BNEQ    L_6169                          ; 6165   020C 0002

        XORI    #$0020, R0                      ; 6167   03F8 0020
L_6169:
        MOVR    R2,     R5                      ; 6169   0095
        SLL     R2,     2                       ; 616A   004E
        SLL     R2,     1                       ; 616B   004A
        SUBR    R5,     R2                      ; 616C   012A
        SDBD                                    ; 616D   0001
        ADDI    #$5CE3, R2                      ; 616E   02FA 00E3 005C
        SUBI    #$0006, R1                      ; 6171   0339 0006
        MOVR    R3,     R5                      ; 6173   009D
        PULR    R3                              ; 6174   02B3
        CMPI    #$00B4, R3                      ; 6175   037B 00B4
        BNEQ    L_617B                          ; 6177   020C 0002

        XORI    #$0040, R0                      ; 6179   03F8 0040
L_617B:
        CMPI    #$00B1, R3                      ; 617B   037B 00B1
        BLT     L_6185                          ; 617D   0205 0006

        CMPI    #$00B3, R3                      ; 617F   037B 00B3
        BGT     L_6185                          ; 6181   020E 0002

        SUBI    #$0007, R2                      ; 6183   033A 0007
L_6185:
        CMPI    #$0002, R3                      ; 6185   037B 0002
        BNEQ    L_61AC                          ; 6187   020C 0023

        ADDI    #$0003, R1                      ; 6189   02F9 0003
        MVI@    R1,     R3                      ; 618B   028B
        SDBD                                    ; 618C   0001
        SUBI    #$0400, R3                      ; 618D   033B 0000 0004
        MVO@    R3,     R1                      ; 6190   024B
        SWAP    R3,     1                       ; 6191   0043
        CMPI    #$0036, R3                      ; 6192   037B 0036
        BGT     L_6198                          ; 6194   020E 0002

        MVII    #$0001, R5                      ; 6196   02BD 0001
L_6198:
        XORI    #$0040, R0                      ; 6198   03F8 0040
        CMPI    #$0050, R3                      ; 619A   037B 0050
        BLT     L_61AA                          ; 619C   0205 000C

        SDBD                                    ; 619E   0001
        XORI    #$2080, R0                      ; 619F   03F8 0080 0020
        DECR    R1                              ; 61A2   0011
        MVI@    R1,     R3                      ; 61A3   028B
        SDBD                                    ; 61A4   0001
        SUBI    #$0400, R3                      ; 61A5   033B 0000 0004
        MVO@    R3,     R1                      ; 61A8   024B
        INCR    R1                              ; 61A9   0009
L_61AA:
        SUBI    #$0003, R1                      ; 61AA   0339 0003
L_61AC:
        MVO@    R0,     R1                      ; 61AC   0248
        INCR    R1                              ; 61AD   0009
        MVO@    R2,     R1                      ; 61AE   024A
        ADDI    #$0004, R1                      ; 61AF   02F9 0004
        MVO@    R5,     R1                      ; 61B1   024D
        ADDI    #$0003, R1                      ; 61B2   02F9 0003
L_61B4:
        CMPI    #$0355, R1                      ; 61B4   0379 0355
        BGT     L_61D3                          ; 61B6   020E 001B

        CMPI    #$0164, R4                      ; 61B8   037C 0164
        BLE     L_6123                          ; 61BA   0226 0098

        SDBD                                    ; 61BC   0001
        MVII    #$5CA8, R2                      ; 61BD   02BA 00A8 005C
        MVII    #$0060, R3                      ; 61C0   02BB 0060
L_61C2:
        MVII    #$0008, R0                      ; 61C2   02B8 0008
        MVO@    R3,     R1                      ; 61C4   024B
        INCR    R1                              ; 61C5   0009
        MVO@    R2,     R1                      ; 61C6   024A
        ADDI    #$0004, R1                      ; 61C7   02F9 0004
        MVO@    R0,     R1                      ; 61C9   0248
        INCR    R1                              ; 61CA   0009
        CLRR    R0                              ; 61CB   01C0
        MVO@    R0,     R1                      ; 61CC   0248
        ADDI    #$0002, R1                      ; 61CD   02F9 0002
        CMPI    #$0355, R1                      ; 61CF   0379 0355
        BLE     L_61C2                          ; 61D1   0226 0010
L_61D3:
        B       L_6353                          ; 61D3   0200 017E

        DECLE   $0054,  $0054,  $0054,  $004A   ; 61D5   0054 0054 0054 004A
        DECLE   $0054,  $0040,  $0054,  $003A   ; 61D9   0054 0040 0054 003A
        DECLE   $0054,  $0036,  $0000           ; 61DD   0054 0036 0000

        NOP                                     ; 61E0   0034
        MOVR    R3,     R0                      ; 61E1   0098
        SWAP    R0,     1                       ; 61E2   0040
        MOVR    R0,     R4                      ; 61E3   0084
        RSWD    R2                              ; 61E4   003A
        DECR    R0                              ; 61E5   0010
        SWAP    R0,     1                       ; 61E6   0040
        NEGR    R4                              ; 61E7   0024
        RSWD    R2                              ; 61E8   003A
L_61E9:
        SUBI    #$00C0, R3                      ; 61E9   033B 00C0
        CMPI    #$0033, R3                      ; 61EB   037B 0033
        BEQ     L_61F5                          ; 61ED   0204 0006

        MVI     G_0135, R5                      ; 61EF   0285 0135
        ANDI    #$0002, R5                      ; 61F1   03BD 0002
        BNEQ    L_61B4                          ; 61F3   022C 0040

L_61F5:
        MOVR    R4,     R5                      ; 61F5   00A5
        SUBI    #$0161, R5                      ; 61F6   033D 0161
        ADDR    R5,     R5                      ; 61F8   00ED
        ADD     G_018C, R5                      ; 61F9   02C5 018C
        BEQ     L_61B4                          ; 61FB   0224 0048

        DECR    R5                              ; 61FD   0015
        ADDR    R5,     R5                      ; 61FE   00ED
        ADDR    R5,     R5                      ; 61FF   00ED
        MOVR    R3,     R2                      ; 6200   009A
        SLL     R2,     2                       ; 6201   004E
        ADDR    R2,     R3                      ; 6202   00D3
        SDBD                                    ; 6203   0001
        ADDI    #$5B91, R3                      ; 6204   02FB 0091 005B
        MVI@    R3,     R0                      ; 6207   0298
        ANDI    #$001F, R0                      ; 6208   03B8 001F
        SDBD                                    ; 620A   0001
        ADDI    #$1040, R0                      ; 620B   02F8 0040 0010
        MVI@    R3,     R2                      ; 620E   029A
        ANDI    #$00E0, R2                      ; 620F   03BA 00E0
        ADDR    R2,     R5                      ; 6211   00D5
        SLR     R2,     2                       ; 6212   0066
        SLR     R2,     1                       ; 6213   0062
        ADDR    R2,     R5                      ; 6214   00D5
        SDBD                                    ; 6215   0001
        ADDI    #$6270, R5                      ; 6216   02FD 0070 0062
        DECR    R3                              ; 6219   0013
        SLR     R2,     1                       ; 621A   0062
        PSHR    R5                              ; 621B   0275
        MOVR    R2,     R5                      ; 621C   0095
        SDBD                                    ; 621D   0001
        ADDI    #$62AC, R5                      ; 621E   02FD 00AC 0062
        SDBD                                    ; 6221   0001
        MVI@    R5,     R2                      ; 6222   02AA
        PSHR    R0                              ; 6223   0270
        CLRR    R0                              ; 6224   01C0
        MVI     G_0135, R5                      ; 6225   0285 0135
        ANDI    #$0004, R5                      ; 6227   03BD 0004
        BNEQ    L_624F                          ; 6229   020C 0024

        MOVR    R4,     R5                      ; 622B   00A5
        SUBI    #$0162, R5                      ; 622C   033D 0162
        BMI     L_624F                          ; 622E   020B 001F

        ADDR    R5,     R5                      ; 6230   00ED
        ADD     G_018C, R5                      ; 6231   02C5 018C
        ADDR    R5,     R5                      ; 6233   00ED
        ADDR    R5,     R7                      ; 6234   00EF
        B       L_6266                          ; 6235   0200 002F
        B       L_625C                          ; 6237   0200 0023
        B       L_6260                          ; 6239   0200 0025
        B       L_624D                          ; 623B   0200 0010
        B       L_6256                          ; 623D   0200 0017
        B       L_6252                          ; 623F   0200 0011
        B       L_6247                          ; 6241   0200 0004

        MVI     G_0187, R0                      ; 6243   0280 0187
        B       L_6249                          ; 6245   0200 0002

L_6247:
        MVI     G_0186, R0                      ; 6247   0280 0186
L_6249:
        ANDI    #$00C3, R0                      ; 6249   03B8 00C3
L_624B:
        BEQ     L_624F                          ; 624B   0204 0002

L_624D:
        MVII    #$0020, R0                      ; 624D   02B8 0020
L_624F:
        XOR@    R6,     R0                      ; 624F   03F0
        B       L_626C                          ; 6250   0200 001A

L_6252:
        MVI     G_0130, R0                      ; 6252   0280 0130
        B       L_6258                          ; 6254   0200 0002

L_6256:
        MVI     G_012E, R0                      ; 6256   0280 012E
L_6258:
        ANDI    #$00C3, R0                      ; 6258   03B8 00C3
        B       L_624B                          ; 625A   0220 0010

L_625C:
        MVI     G_012F, R0                      ; 625C   0280 012F
        B       L_6268                          ; 625E   0200 0008

L_6260:
        MVI     G_012F, R0                      ; 6260   0280 012F
        ANDI    #$0003, R0                      ; 6262   03B8 0003
        BNEQ    L_624D                          ; 6264   022C 0018

L_6266:
        MVI     G_012D, R0                      ; 6266   0280 012D
L_6268:
        ANDI    #$0003, R0                      ; 6268   03B8 0003
        B       L_624B                          ; 626A   0220 0020

L_626C:
        PULR    R5                              ; 626C   02B5
        CMPI    #$0355, R1                      ; 626D   0379 0355
        BGE     L_61B4                          ; 626F   022D 00BC

        PSHR    R4                              ; 6271   0274
        MOVR    R1,     R4                      ; 6272   008C
        ADDI    #$0008, R4                      ; 6273   02FC 0008
        PSHR    R0                              ; 6275   0270
        MVI@    R5,     R0                      ; 6276   02A8
        SWAP    R0,     1                       ; 6277   0040
        SLR     R0,     1                       ; 6278   0060
        ADD@    R6,     R0                      ; 6279   02F0
        MVO@    R0,     R1                      ; 627A   0248
        INCR    R1                              ; 627B   0009
        XORI    #$0200, R0                      ; 627C   03F8 0200
        MVO@    R0,     R4                      ; 627E   0260
        MVO@    R2,     R1                      ; 627F   024A
        INCR    R1                              ; 6280   0009
        MVO@    R2,     R4                      ; 6281   0262
        MVI@    R3,     R3                      ; 6282   029B
        MOVR    R3,     R2                      ; 6283   009A
        ANDI    #$000F, R3                      ; 6284   03BB 000F
        SLR     R2,     2                       ; 6286   0066
        SLR     R2,     2                       ; 6287   0066
        ANDI    #$000F, R2                      ; 6288   03BA 000F
        MVI@    R5,     R0                      ; 628A   02A8
        SWAP    R0,     1                       ; 628B   0040
        MVO@    R0,     R1                      ; 628C   0248
        INCR    R1                              ; 628D   0009
        MVI@    R5,     R0                      ; 628E   02A8
        SWAP    R0,     1                       ; 628F   0040
        MVO@    R0,     R4                      ; 6290   0260
        BNEQ    L_6297                          ; 6291   020C 0004

        SUBI    #$0008, R4                      ; 6293   033C 0008
        DECR    R3                              ; 6295   0013
        MOVR    R3,     R2                      ; 6296   009A
L_6297:
        MVI@    R5,     R0                      ; 6297   02A8
        SWAP    R0,     1                       ; 6298   0040
        MVO@    R0,     R4                      ; 6299   0260
        MVO@    R0,     R1                      ; 629A   0248
        INCR    R1                              ; 629B   0009
        CLRR    R0                              ; 629C   01C0
        MVO@    R0,     R4                      ; 629D   0260
        MVO@    R0,     R1                      ; 629E   0248
        INCR    R1                              ; 629F   0009
        MVO@    R3,     R4                      ; 62A0   0263
        MVO@    R2,     R1                      ; 62A1   024A
        INCR    R1                              ; 62A2   0009
        MVI@    R1,     R0                      ; 62A3   0288
        TSTR    R0                              ; 62A4   0080
        BNEQ    L_62A9                          ; 62A5   020C 0002

        MVII    #$001E, R0                      ; 62A7   02B8 001E
L_62A9:
        MVO@    R0,     R4                      ; 62A9   0260
        MVO@    R0,     R1                      ; 62AA   0248
        INCR    R4                              ; 62AB   000C
        MOVR    R4,     R1                      ; 62AC   00A1
        PULR    R4                              ; 62AD   02B4
        B       L_61B4                          ; 62AE   0220 00FB

        DECLE   $001B,  $005D,  $0029,  $005D   ; 62B0   001B 005D 0029 005D
        DECLE   $0029,  $005D,  $0022,  $005D   ; 62B4   0029 005D 0022 005D
        DECLE   $0041,  $0048,  $0058,  $003E   ; 62B8   0041 0048 0058 003E
        DECLE   $0041,  $0048,  $0058,  $0034   ; 62BC   0041 0048 0058 0034
        DECLE   $0000,  $0050,  $0058,  $0036   ; 62C0   0000 0050 0058 0036
        DECLE   $0000,  $0050,  $0058,  $0032   ; 62C4   0000 0050 0058 0032
        DECLE   $0000,  $0000,  $0000,  $0032   ; 62C8   0000 0000 0000 0032
        DECLE   $0041,  $008C,  $009C,  $0034   ; 62CC   0041 008C 009C 0034
        DECLE   $0000,  $0080,  $0088,  $0036   ; 62D0   0000 0080 0088 0036

        SWAP    R1,     1                       ; 62D4   0041

        JSR     R4,     .EXEC.434               ; 62D5   0004 0014 0034
        DECLE   $0000,  $0020,  $0028,  $0036   ; 62D8   0000 0020 0028 0036
        DECLE   $0002,  $0050,  $0058,  $002E   ; 62DC   0002 0050 0058 002E
        DECLE   $0002,  $0050,  $0058,  $0025   ; 62E0   0002 0050 0058 0025
        DECLE   $0001,  $0054,  $0000,  $002E   ; 62E4   0001 0054 0000 002E
        DECLE   $0001,  $0054,  $0000,  $002C   ; 62E8   0001 0054 0000 002C
        DECLE   $0001,  $0000,  $0000,  $002C   ; 62EC   0001 0000 0000 002C
        DECLE   $0002,  $0094,  $009C,  $0025   ; 62F0   0002 0094 009C 0025
        DECLE   $0001,  $0084,  $0000,  $002E   ; 62F4   0001 0084 0000 002E
        DECLE   $0002,  $000C,  $0014,  $0025   ; 62F8   0002 000C 0014 0025
        DECLE   $0001,  $001C,  $0000,  $002E   ; 62FC   0001 001C 0000 002E
        DECLE   $0001,  $0050,  $0057,  $003E   ; 6300   0001 0050 0057 003E
        DECLE   $0001,  $0050,  $0057,  $0034   ; 6304   0001 0050 0057 0034
        DECLE   $0000,  $0054,  $0000,  $0036   ; 6308   0000 0054 0000 0036
        DECLE   $0000,  $0054,  $0000,  $0032   ; 630C   0000 0054 0000 0032
        DECLE   $0000,  $0000,  $0000,  $0032   ; 6310   0000 0000 0000 0032
        DECLE   $0001,  $0094,  $009B,  $0034   ; 6314   0001 0094 009B 0034
        DECLE   $0000,  $0084,  $0000,  $0036   ; 6318   0000 0084 0000 0036
        DECLE   $0001,  $000C,  $0013,  $0034   ; 631C   0001 000C 0013 0034
        DECLE   $0000,  $001C,  $0000,  $0036   ; 6320   0000 001C 0000 0036
        DECLE   $0001,  $0050,  $0057,  $003E   ; 6324   0001 0050 0057 003E
        DECLE   $0001,  $0050,  $0057,  $0034   ; 6328   0001 0050 0057 0034
        DECLE   $0000,  $0051,  $0057,  $0036   ; 632C   0000 0051 0057 0036
        DECLE   $0000,  $0051,  $0057,  $0032   ; 6330   0000 0051 0057 0032
        DECLE   $0000,  $0000,  $0000,  $0032   ; 6334   0000 0000 0000 0032
        DECLE   $0001,  $0094,  $009B,  $0034   ; 6338   0001 0094 009B 0034
        DECLE   $0000                           ; 633C   0000

        MOVR    R0,     R1                      ; 633D   0081
        MOVR    R0,     R7                      ; 633E   0087

        DECLE   $0036,  $0001,  $000C,  $0013   ; 633F   0036 0001 000C 0013
        DECLE   $0034,  $0000,  $0021,  $0027   ; 6343   0034 0000 0021 0027
        DECLE   $0036                           ; 6347   0036
L_6348:
        DECR    R1                              ; 6348   0011
L_6349:
        SLL     R1,     1                       ; 6349   0049
        SDBD                                    ; 634A   0001
        ADDI    #$5A1F, R1                      ; 634B   02F9 001F 005A
        MVI@    R1,     R2                      ; 634E   028A
        SLR     R2,     2                       ; 634F   0066
        SLR     R2,     2                       ; 6350   0066
        MOVR    R5,     R7                      ; 6351   00AF

L_6352:
        PSHR    R5                              ; 6352   0275
L_6353:
        CLRR    R2                              ; 6353   01D2
        MVI     G_0175, R1                      ; 6354   0281 0175
        CMPI    #$0082, R1                      ; 6356   0379 0082
        BLT     L_6364                          ; 6358   0205 000A

        CMPI    #$00A5, R1                      ; 635A   0379 00A5
        BGT     L_6364                          ; 635C   020E 0006

        JSR     R5,     L_6348                  ; 635E   0004 0160 0348

        SLL     R2,     1                       ; 6361   004A
        ADDI    #$0003, R2                      ; 6362   02FA 0003
L_6364:
        PSHR    R2                              ; 6364   0272
        CLRR    R2                              ; 6365   01D2
        MVI     G_0175, R1                      ; 6366   0281 0175
        CMPI    #$0028, R1                      ; 6368   0379 0028
        BLT     L_6378                          ; 636A   0205 000C

        CMPI    #$004B, R1                      ; 636C   0379 004B
        BGT     L_6378                          ; 636E   020E 0008

        JSR     R5,     L_6348                  ; 6370   0004 0160 0348

        MOVR    R2,     R3                      ; 6373   0093
        ADDR    R3,     R2                      ; 6374   00DA
        ADDR    R3,     R2                      ; 6375   00DA
        ADDI    #$0006, R2                      ; 6376   02FA 0006
L_6378:
        PSHR    R2                              ; 6378   0272
        CLRR    R0                              ; 6379   01C0
        MVI     G_0174, R1                      ; 637A   0281 0174
        CMPI    #$001C, R1                      ; 637C   0379 001C
        BLT     L_6388                          ; 637E   0205 0008

        CMPI    #$0027, R1                      ; 6380   0379 0027
        BGT     L_6388                          ; 6382   020E 0004

        JSR     R5,     L_6348                  ; 6384   0004 0160 0348

        MOVR    R2,     R0                      ; 6387   0090
L_6388:
        MVII    #$016B, R4                      ; 6388   02BC 016B
L_638A:
        MVI@    R4,     R1                      ; 638A   02A1
        DECR    R1                              ; 638B   0011
        BMI     L_6392                          ; 638C   020B 0004

        JSR     R5,     L_6349                  ; 638E   0004 0160 0349

        ADDR    R2,     R0                      ; 6391   00D0
L_6392:
        CMPI    #$016E, R4                      ; 6392   037C 016E
        BLE     L_638A                          ; 6394   0226 000B

        CLRR    R2                              ; 6396   01D2
        MVI     G_016F, R1                      ; 6397   0281 016F
        TSTR    R1                              ; 6399   0089
        BEQ     L_639F                          ; 639A   0204 0003

        JSR     R5,     L_6349                  ; 639C   0004 0160 0349

L_639F:
        MOVR    R0,     R1                      ; 639F   0081
        MOVR    R2,     R3                      ; 63A0   0093
        SLR     R1,     1                       ; 63A1   0061
        SLR     R1,     2                       ; 63A2   0065
        ADDR    R1,     R2                      ; 63A3   00CA
        SLR     R3,     1                       ; 63A4   0063
        ADDR    R3,     R0                      ; 63A5   00D8
        MVO     R0,     G_0171                  ; 63A6   0240 0171
        MVO     R2,     G_0173                  ; 63A8   0242 0173
        MVII    #$02C2, R4                      ; 63AA   02BC 02C2
        MVII    #$0006, R3                      ; 63AC   02BB 0006
        MOVR    R3,     R2                      ; 63AE   009A
        MVI     G_0184, R1                      ; 63AF   0281 0184
        ADDR    R7,     R1                      ; 63B1   00F9
        ADDI    #$00AC, R1                      ; 63B2   02F9 00AC
        ADD@    R1,     R2                      ; 63B4   02CA
        MVO     R2,     .BTAB.CA                ; 63B5   0242 02CA
        MVI     G_0167, R0                      ; 63B7   0280 0167
        MVII    #$0003, R1                      ; 63B9   02B9 0003
        MVI     G_017E, R5                      ; 63BB   0285 017E
        SUBI    #$0078, R5                      ; 63BD   033D 0078
        BMI     L_63C9                          ; 63BF   020B 0008

        CMPI    #$0003, R5                      ; 63C1   037D 0003
        BGE     L_63C9                          ; 63C3   020D 0004

        INCR    R3                              ; 63C5   000B
        ADDR    R5,     R7                      ; 63C6   00EF

        SLR     R3,     1                       ; 63C7   0063
        SLR     R3,     1                       ; 63C8   0063

L_63C9:
        JSR     R5,     X_PRNUM_RGT             ; 63C9   0004 0118 00C5

        MVII    #$0006, R3                      ; 63CC   02BB 0006
        MVII    #$02D6, R4                      ; 63CE   02BC 02D6
        MVI     G_0171, R0                      ; 63D0   0280 0171

        JSR     R5,     X_PRNUM_RGT             ; 63D2   0004 0118 00C5

        MVII    #$007E, R2                      ; 63D5   02BA 007E
        MVII    #$02C5, R4                      ; 63D7   02BC 02C5
        MVO@    R2,     R4                      ; 63D9   0262
        MVI     G_0169, R0                      ; 63DA   0280 0169
        DECR    R1                              ; 63DC   0011
        MVI     G_017E, R5                      ; 63DD   0285 017E
        SUBI    #$007B, R5                      ; 63DF   033D 007B
        BMI     L_63E7                          ; 63E1   020B 0004

        INCR    R3                              ; 63E3   000B
        ADDR    R5,     R7                      ; 63E4   00EF

        SLR     R3,     1                       ; 63E5   0063
        SLR     R3,     1                       ; 63E6   0063

L_63E7:
        JSR     R5,     X_PRNUM_RGT             ; 63E7   0004 0118 00C5

        MVII    #$0006, R3                      ; 63EA   02BB 0006
        MVII    #$02D9, R4                      ; 63EC   02BC 02D9
        MVO@    R2,     R4                      ; 63EE   0262
        MVI     G_0173, R0                      ; 63EF   0280 0173

        JSR     R5,     X_PRNUM_RGT             ; 63F1   0004 0118 00C5

        MVII    #$02EB, R4                      ; 63F4   02BC 02EB
        PULR    R0                              ; 63F6   02B0

        JSR     R5,     X_PRNUM_RGT             ; 63F7   0004 0118 00C5

        MVII    #$02ED, R4                      ; 63FA   02BC 02ED
        MVO@    R2,     R4                      ; 63FC   0262
        PULR    R0                              ; 63FD   02B0

        JSR     R5,     X_PRNUM_RGT             ; 63FE   0004 0118 00C5

        MVII    #$02E4, R4                      ; 6401   02BC 02E4
        MVI     G_0185, R0                      ; 6403   0280 0185
        INCR    R0                              ; 6405   0008
        MVI     G_0180, R2                      ; 6406   0282 0180
        ANDI    #$00BF, R2                      ; 6408   03BA 00BF
        BEQ     L_641A                          ; 640A   0204 000E

        MVI     G_0166, R0                      ; 640C   0280 0166
        MVII    #$0005, R3                      ; 640E   02BB 0005
        MVI     G_0168, R2                      ; 6410   0282 0168
        SLL     R2,     1                       ; 6412   004A
        CMPR    R0,     R2                      ; 6413   0142
        BGE     L_641A                          ; 6414   020D 0004

        MVI     G_0168, R0                      ; 6416   0280 0168
        MVII    #$0001, R3                      ; 6418   02BB 0001
L_641A:
        INCR    R1                              ; 641A   0009

        JSR     R5,     X_PRNUM_RGT             ; 641B   0004 0118 00C5

        MVI     G_018A, R0                      ; 641E   0280 018A
        XORI    #$0001, R0                      ; 6420   03F8 0001
        MVO     R0,     G_018A                  ; 6422   0240 018A
        SDBD                                    ; 6424   0001
        MVII    #$0940, R1                      ; 6425   02B9 0040 0009
        MVII    #$0174, R4                      ; 6428   02BC 0174
        SDBD                                    ; 642A   0001
        MVII    #$6462, R5                      ; 642B   02BD 0062 0064
L_642E:
        MOVR    R1,     R2                      ; 642E   008A
        MVI@    R4,     R3                      ; 642F   02A3
        SLL     R3,     1                       ; 6430   004B
        BEQ     L_6455                          ; 6431   0204 0022

        CMPI    #$0176, R4                      ; 6433   037C 0176
        BGT     L_6445                          ; 6435   020E 000E

        MVI     G_0180, R0                      ; 6437   0280 0180
        ANDI    #$00BF, R0                      ; 6439   03B8 00BF
        BEQ     L_6445                          ; 643B   0204 0008

        SWAP    R0,     2                       ; 643D   0044
        BMI     L_6445                          ; 643E   020B 0005

        MVI     G_018A, R0                      ; 6440   0280 018A
        TSTR    R0                              ; 6442   0080
        BEQ     L_6455                          ; 6443   0204 0010

L_6445:
        SDBD                                    ; 6445   0001
        ADDI    #$5A1C, R3                      ; 6446   02FB 001C 005A
        MVI@    R3,     R3                      ; 6449   029B
        ANDI    #$000F, R3                      ; 644A   03BB 000F
        MOVR    R3,     R2                      ; 644C   009A
        ANDI    #$0004, R2                      ; 644D   03BA 0004
        XORR    R2,     R3                      ; 644F   01D3
        SLL     R2,     2                       ; 6450   004E
        ADDR    R3,     R2                      ; 6451   00DA
        SWAP    R2,     1                       ; 6452   0042
        SLL     R2,     1                       ; 6453   004A
        ADDR    R1,     R2                      ; 6454   00CA
L_6455:
        MVI@    R5,     R3                      ; 6455   02AB
        MVO@    R2,     R3                      ; 6456   025A
        ADDI    #$0008, R1                      ; 6457   02F9 0008
        CMPI    #$017B, R4                      ; 6459   037C 017B
        BLE     L_642E                          ; 645B   0226 002E
        PULR    R7                              ; 645D   02B7

        CMPR    R6,     R0                      ; 645E   0170
        SUBR    R5,     R0                      ; 645F   0128
        ANDR    R3,     R0                      ; 6460   0198
        ANDR    R7,     R0                      ; 6461   01B8
        ADD@    R4,     R3                      ; 6462   02E3
        ADD@    R5,     R0                      ; 6463   02E8
        ADD@    R1,     R4                      ; 6464   02CC
        ADD@    R3,     R7                      ; 6465   02DF

        ADD@    R3,     R5                      ; 6466   02DD
        ADD@    R1,     R0                      ; 6467   02C8
        PULR    R5                              ; 6468   02B5
        PULR    R7                              ; 6469   02B7

        DECLE   $146A                           ; 646A   146A
L_646B:
        PSHR    R5                              ; 646B   0275
        MVI     G_0180, R0                      ; 646C   0280 0180
        ADD     G_015E, R0                      ; 646E   02C0 015E
        ADD     G_0138, R0                      ; 6470   02C0 0138
        ADD     G_018C, R0                      ; 6472   02C0 018C
        BNEQ    L_64C9                          ; 6474   020C 0053

        MVI     G_0161, R3                      ; 6476   0283 0161
        CMPI    #$00F4, R3                      ; 6478   037B 00F4
        BEQ     L_6482                          ; 647A   0204 0006

        MVI     G_0135, R0                      ; 647C   0280 0135
        ANDI    #$0002, R0                      ; 647E   03B8 0002
        BNEQ    L_64C9                          ; 6480   020C 0047

L_6482:
        MVI     G_012D, R1                      ; 6482   0281 012D
        SUBI    #$00C0, R3                      ; 6484   033B 00C0
        BLE     L_6491                          ; 6486   0206 0009

        CMPI    #$0035, R3                      ; 6488   037B 0035
        BGE     L_6491                          ; 648A   020D 0005

        MOVR    R1,     R2                      ; 648C   008A
        ANDI    #$0003, R2                      ; 648D   03BA 0003
        BEQ     L_64B9                          ; 648F   0204 0028

L_6491:
        MVII    #$0003, R0                      ; 6491   02B8 0003

        JSR     R5,     X_RAND1                 ; 6493   0004 0114 027D

        TSTR    R0                              ; 6496   0080
        BNEQ    L_64C9                          ; 6497   020C 0030

        ANDI    #$000C, R1                      ; 6499   03B9 000C
        BNEQ    L_64A8                          ; 649B   020C 000B

        MVII    #$0001, R0                      ; 649D   02B8 0001

        JSR     R5,     L_64CA                  ; 649F   0004 0164 00CA

        BLE     L_64A8                          ; 64A2   0206 0004

        CMPI    #$0035, R3                      ; 64A4   037B 0035
        BLT     L_64B9                          ; 64A6   0205 0011

L_64A8:
        MVI     G_012D, R1                      ; 64A8   0281 012D
        ANDI    #$00C0, R1                      ; 64AA   03B9 00C0
        BNEQ    L_64C9                          ; 64AC   020C 001B

        MVII    #$0003, R0                      ; 64AE   02B8 0003

        JSR     R5,     L_64CA                  ; 64B0   0004 0164 00CA

        BLE     L_64C9                          ; 64B3   0206 0014

        CMPI    #$0035, R3                      ; 64B5   037B 0035
        BGE     L_64C9                          ; 64B7   020D 0010

L_64B9:
        MVO     R0,     G_018F                  ; 64B9   0240 018F
        MVO     R3,     G_0180                  ; 64BB   0243 0180

        JSR     R5,     L_64E0                  ; 64BD   0004 0164 00E0
        JSR     R5,     L_6BE7                  ; 64C0   0004 0168 03E7
        JSR     R5,     L_50DC                  ; 64C3   0004 0150 00DC

        CLRR    R0                              ; 64C6   01C0
        MVO     R0,     G_018F                  ; 64C7   0240 018F
L_64C9:
        PULR    R7                              ; 64C9   02B7

L_64CA:
        PSHR    R5                              ; 64CA   0275
        MOVR    R0,     R1                      ; 64CB   0081
        NEGR    R1                              ; 64CC   0021
        ADDI    #$0002, R1                      ; 64CD   02F9 0002
        ADD     G_0184, R1                      ; 64CF   02C1 0184
        ANDI    #$0003, R1                      ; 64D1   03B9 0003
        SDBD                                    ; 64D3   0001
        ADDI    #$51CB, R1                      ; 64D4   02F9 00CB 0051
        MVI@    R1,     R1                      ; 64D7   0289
        ADD     G_0183, R1                      ; 64D8   02C1 0183

        JSR     R5,     L_5883                  ; 64DA   0004 0158 0083

        SUBI    #$00C0, R3                      ; 64DD   033B 00C0
        PULR    R7                              ; 64DF   02B7

L_64E0:
        PSHR    R5                              ; 64E0   0275
        PSHR    R1                              ; 64E1   0271
        MOVR    R3,     R2                      ; 64E2   009A
        SLL     R3,     2                       ; 64E3   004F
        ADDR    R2,     R3                      ; 64E4   00D3
        SDBD                                    ; 64E5   0001
        ADDI    #$5B8D, R3                      ; 64E6   02FB 008D 005B
        MVI@    R3,     R2                      ; 64E9   029A
        MOVR    R2,     R0                      ; 64EA   0090
        SLR     R0,     1                       ; 64EB   0060

        JSR     R5,     X_RAND2                 ; 64EC   0004 0114 029E

        ADDR    R0,     R2                      ; 64EF   00C2
        SLL     R2,     1                       ; 64F0   004A
        ADD     G_0185, R2                      ; 64F1   02C2 0185
        SLR     R2,     1                       ; 64F3   0062
        CMPI    #$00FF, R2                      ; 64F4   037A 00FF
        BLE     L_64FA                          ; 64F6   0206 0002

        MVII    #$00FF, R2                      ; 64F8   02BA 00FF
L_64FA:
        MOVR    R2,     R0                      ; 64FA   0090
        SLR     R0,     2                       ; 64FB   0064
        MVI     G_0139, R5                      ; 64FC   0285 0139
L_64FE:
        INCR    R5                              ; 64FE   000D
        CMPI    #$0003, R5                      ; 64FF   037D 0003
        BGT     L_6506                          ; 6501   020E 0003

        SUBR    R0,     R2                      ; 6503   0102
        B       L_64FE                          ; 6504   0220 0007

L_6506:
        MVO     R2,     G_0166                  ; 6506   0242 0166
        SLR     R2,     1                       ; 6508   0062
        INCR    R2                              ; 6509   000A
        MVO     R2,     G_0168                  ; 650A   0242 0168
        INCR    R3                              ; 650C   000B
        MVI@    R3,     R3                      ; 650D   029B
        MOVR    R3,     R0                      ; 650E   0098
        SLR     R0,     2                       ; 650F   0064
        MVI     G_0139, R5                      ; 6510   0285 0139
L_6512:
        INCR    R5                              ; 6512   000D
        CMPI    #$0003, R5                      ; 6513   037D 0003
        BGT     L_651A                          ; 6515   020E 0003

        SUBR    R0,     R3                      ; 6517   0103
        B       L_6512                          ; 6518   0220 0007

L_651A:
        MVO     R3,     G_0170                  ; 651A   0243 0170
        SLR     R3,     1                       ; 651C   0063
        MVO     R3,     G_0172                  ; 651D   0243 0172
        PULR    R1                              ; 651F   02B1
        PULR    R7                              ; 6520   02B7

L_6521:
        MVI     G_0161, R3                      ; 6521   0283 0161
        SUBI    #$00C0, R3                      ; 6523   033B 00C0
        BLE     L_6618                          ; 6525   0206 00F1

        CMPI    #$0035, R3                      ; 6527   037B 0035
        BGE     L_6618                          ; 6529   020D 00ED

        MVI     G_012D, R0                      ; 652B   0280 012D
        ANDI    #$0003, R0                      ; 652D   03B8 0003
        ADD     G_031E, R0                      ; 652F   02C0 031E
        BNEQ    L_6618                          ; 6531   020C 00E5

        CMPI    #$0034, R3                      ; 6533   037B 0034
        BEQ     L_653D                          ; 6535   0204 0006

        MVI     G_0135, R0                      ; 6537   0280 0135
        ANDI    #$0002, R0                      ; 6539   03B8 0002
        BNEQ    L_6618                          ; 653B   020C 00DB

L_653D:
        MVI     G_0180, R1                      ; 653D   0281 0180
        ANDI    #$00BF, R1                      ; 653F   03B9 00BF
        BNEQ    L_6549                          ; 6541   020C 0006

        MOVR    R3,     R1                      ; 6543   0099
        ADDI    #$0080, R1                      ; 6544   02F9 0080

        JSR     R5,     L_64E0                  ; 6546   0004 0164 00E0

L_6549:
        SWAP    R1,     2                       ; 6549   0045
        BPL     L_6618                          ; 654A   0203 00CC

        XORI    #$0080, R1                      ; 654C   03F9 0080
        MVI     G_0175, R2                      ; 654E   0282 0175
        DECR    R2                              ; 6550   0012
        CMPI    #$0027, R2                      ; 6551   037A 0027
        BLT     L_6618                          ; 6553   0205 00C3

        CMPI    #$005C, R2                      ; 6555   037A 005C
        BLE     L_6561                          ; 6557   0206 0008

        CMPI    #$0081, R2                      ; 6559   037A 0081
        BLT     L_6618                          ; 655B   0205 00BB

        CMPI    #$00A4, R2                      ; 655D   037A 00A4
        BGT     L_6618                          ; 655F   020E 00B7

L_6561:
        MVII    #$016A, R3                      ; 6561   02BB 016A
        MVII    #$0001, R0                      ; 6563   02B8 0001
        CMPI    #$0081, R2                      ; 6565   037A 0081
        BLT     L_656C                          ; 6567   0205 0003

        INCR    R0                              ; 6569   0008
        MVII    #$0165, R3                      ; 656A   02BB 0165

L_656C:
        JSR     R5,     L_661B                  ; 656C   0004 0164 021B

        MVO     R1,     G_0180                  ; 656F   0241 0180
        MVO     R2,     G_0136                  ; 6571   0242 0136
        CLRR    R0                              ; 6573   01C0
        CMPI    #$0032, R2                      ; 6574   037A 0032
        BGT     L_6585                          ; 6576   020E 000D

        MVI     G_017C, R1                      ; 6578   0281 017C
        DECR    R1                              ; 657A   0011
        BMI     L_6618                          ; 657B   020B 009B

        MVO     R1,     G_017C                  ; 657D   0241 017C
        CMPI    #$0032, R2                      ; 657F   037A 0032
        BEQ     L_6591                          ; 6581   0204 000E
        B       L_658F                          ; 6583   0200 000A

L_6585:
        CMPI    #$0081, R2                      ; 6585   037A 0081
        BLT     L_6593                          ; 6587   0205 000A

        CMPI    #$008C, R2                      ; 6589   037A 008C
        BGT     L_6593                          ; 658B   020E 0006
        BEQ     L_6591                          ; 658D   0204 0002

L_658F:
        ADDI    #$0003, R0                      ; 658F   02F8 0003
L_6591:
        ADDI    #$0003, R0                      ; 6591   02F8 0003

L_6593:
        JSR     R5,     X_RAND1                 ; 6593   0004 0114 027D

        TSTR    R0                              ; 6596   0080
        BNEQ    L_659B                          ; 6597   020C 0002

        MVO     R0,     G_0175                  ; 6599   0240 0175
L_659B:
        PSHR    R2                              ; 659B   0272
        SLL     R2,     1                       ; 659C   004A
        SDBD                                    ; 659D   0001
        ADDI    #$5A1E, R2                      ; 659E   02FA 001E 005A
        MVI@    R2,     R1                      ; 65A1   0291
        MOVR    R1,     R0                      ; 65A2   0088
        ANDI    #$0007, R0                      ; 65A3   03B8 0007
        XORR    R0,     R1                      ; 65A5   01C1
        SLL     R1,     1                       ; 65A6   0049
        ADDR    R1,     R0                      ; 65A7   00C8
        ANDI    #$001F, R0                      ; 65A8   03B8 001F
        SDBD                                    ; 65AA   0001
        XORI    #$1000, R0                      ; 65AB   03F8 0000 0010
        SLR     R1,     2                       ; 65AE   0065
        SLR     R1,     2                       ; 65AF   0065
        SLR     R1,     1                       ; 65B0   0061
        ANDI    #$0007, R1                      ; 65B1   03B9 0007
        PULR    R2                              ; 65B3   02B2
        CMPI    #$004B, R2                      ; 65B4   037A 004B
        BLT     L_65BC                          ; 65B6   0205 0004

        CMPI    #$005C, R2                      ; 65B8   037A 005C
        BLE     L_65C6                          ; 65BA   0206 000A

L_65BC:
        CMPI    #$0001, R1                      ; 65BC   0379 0001
        BGT     L_65C6                          ; 65BE   020E 0006

        MVII    #$0003, R1                      ; 65C0   02B9 0003
        SDBD                                    ; 65C2   0001
        MVII    #$1003, R0                      ; 65C3   02B8 0003 0010
L_65C6:
        MVII    #$031D, R4                      ; 65C6   02BC 031D
        SDBD                                    ; 65C8   0001
        MVII    #$5CF1, R3                      ; 65C9   02BB 00F1 005C
        CMPI    #$004A, R2                      ; 65CC   037A 004A
        BLE     L_65E4                          ; 65CE   0206 0014

        SDBD                                    ; 65D0   0001
        MVII    #$5CF8, R3                      ; 65D1   02BB 00F8 005C
        CMPI    #$0081, R2                      ; 65D4   037A 0081
        BLT     L_65E4                          ; 65D6   0205 000C

        SDBD                                    ; 65D8   0001
        MVII    #$5D0D, R3                      ; 65D9   02BB 000D 005D
        CMPI    #$0003, R1                      ; 65DC   0379 0003
        BGT     L_65E4                          ; 65DE   020E 0004

        SDBD                                    ; 65E0   0001
        XORI    #$2000, R0                      ; 65E1   03F8 0000 0020
L_65E4:
        MVO@    R0,     R4                      ; 65E4   0260
        MVO@    R3,     R4                      ; 65E5   0263
        MVII    #$0078, R0                      ; 65E6   02B8 0078
        SWAP    R0,     1                       ; 65E8   0040
        MVO@    R0,     R4                      ; 65E9   0260
        MVII    #$004C, R0                      ; 65EA   02B8 004C
        SWAP    R0,     1                       ; 65EC   0040
        MVO@    R0,     R4                      ; 65ED   0260
        INCR    R4                              ; 65EE   000C
        MVO@    R1,     R4                      ; 65EF   0261
        PSHR    R1                              ; 65F0   0271
        PSHR    R2                              ; 65F1   0272
        MVI     G_0338, R2                      ; 65F2   0282 0338
        SWAP    R2,     1                       ; 65F4   0042
        SDBD                                    ; 65F5   0001
        ADDI    #$5808, R2                      ; 65F6   02FA 0008 0058
        MVII    #$0032, R3                      ; 65F9   02BB 0032
        MVII    #$031D, R1                      ; 65FB   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 65FD   0004 0118 01A1

L_6600:
        PULR    R2                              ; 6600   02B2
        PULR    R1                              ; 6601   02B1
        CMPI    #$0081, R2                      ; 6602   037A 0081
        BLT     L_6617                          ; 6604   0205 0011

        SDBD                                    ; 6606   0001
        MVII    #$6C9E, R4                      ; 6607   02BC 009E 006C
        CMPI    #$0004, R1                      ; 660A   0379 0004
        BGE     L_6612                          ; 660C   020D 0004

        SDBD                                    ; 660E   0001
        MVII    #$6CB1, R4                      ; 660F   02BC 00B1 006C
L_6612:
        SDBD                                    ; 6612   0001
        MVII    #$6617, R5                      ; 6613   02BD 0017 0066
        MOVR    R4,     R7                      ; 6616   00A7
L_6617:
        PULR    R7                              ; 6617   02B7

L_6618:
        JSR     R5,     L_6CC8                  ; 6618   0004 016C 00C8

L_661B:
        PSHR    R5                              ; 661B   0275
        MVI     G_017E, R5                      ; 661C   0285 017E
        PSHR    R1                              ; 661E   0271
        MVII    #$0019, R1                      ; 661F   02B9 0019
        CMPI    #$0165, R3                      ; 6621   037B 0165
        BEQ     L_6636                          ; 6623   0204 0011

        SLL     R1,     1                       ; 6625   0049
        SUBI    #$0078, R5                      ; 6626   033D 0078
        BMI     L_6640                          ; 6628   020B 0016

        CMPI    #$0003, R5                      ; 662A   037D 0003
        BGE     L_6640                          ; 662C   020D 0012

        DECR    R0                              ; 662E   0010
L_662F:
        ADDI    #$0032, R1                      ; 662F   02F9 0032
        DECR    R5                              ; 6631   0015
        BPL     L_662F                          ; 6632   0223 0004
        B       L_6640                          ; 6634   0200 000A

L_6636:
        SUBI    #$007B, R5                      ; 6636   033D 007B
        BMI     L_6640                          ; 6638   020B 0006

        DECR    R0                              ; 663A   0010
L_663B:
        ADDI    #$0019, R1                      ; 663B   02F9 0019
        DECR    R5                              ; 663D   0015
        BPL     L_663B                          ; 663E   0223 0004

L_6640:
        CMP@    R3,     R1                      ; 6640   0359
        BLE     L_6651                          ; 6641   0206 000E

        SLR     R1,     1                       ; 6643   0061
        CMP@    R3,     R1                      ; 6644   0359
        BGE     L_6648                          ; 6645   020D 0001

        INCR    R0                              ; 6647   0008

L_6648:
        JSR     R5,     X_RAND1                 ; 6648   0004 0114 027D

        TSTR    R0                              ; 664B   0080
        BNEQ    L_6651                          ; 664C   020C 0003

        MVI@    R3,     R0                      ; 664E   0298
        INCR    R0                              ; 664F   0008
        MVO@    R0,     R3                      ; 6650   0258
L_6651:
        PULR    R1                              ; 6651   02B1
        PULR    R7                              ; 6652   02B7

        PSHR    R5                              ; 6653   0275
        CMPI    #$0335, R1                      ; 6654   0379 0335
        BNEQ    L_6617                          ; 6656   022C 0040

        MVI     G_0180, R0                      ; 6658   0280 0180
        ANDI    #$00BF, R0                      ; 665A   03B8 00BF
        BEQ     L_6617                          ; 665C   0224 0046

        SWAP    R0,     2                       ; 665E   0044
        BMI     L_6617                          ; 665F   022B 0049

        MVI     G_0326, R1                      ; 6661   0281 0326
        TSTR    R1                              ; 6663   0089
        BNEQ    L_6617                          ; 6664   022C 004E

        XORI    #$0080, R0                      ; 6666   03F8 0080
        MVO     R0,     G_0180                  ; 6668   0240 0180
        MVI     G_031E, R3                      ; 666A   0283 031E
        SDBD                                    ; 666C   0001
        CMPI    #$5CF8, R3                      ; 666D   037B 00F8 005C
        BEQ     L_6617                          ; 6670   0224 005A

        MVI     G_0161, R3                      ; 6672   0283 0161
        SUBI    #$00C1, R3                      ; 6674   033B 00C1
        MOVR    R3,     R2                      ; 6676   009A
        SLL     R3,     2                       ; 6677   004F
        ADDR    R2,     R3                      ; 6678   00D3
        SDBD                                    ; 6679   0001
        ADDI    #$5B94, R3                      ; 667A   02FB 0094 005B
        MVI@    R3,     R2                      ; 667D   029A
        ANDI    #$003F, R2                      ; 667E   03BA 003F
        ADDI    #$0033, R2                      ; 6680   02FA 0033
        SUBI    #$0003, R3                      ; 6682   033B 0003
        MVI@    R3,     R0                      ; 6684   0298
        SWAP    R0,     1                       ; 6685   0040
        ANDI    #$0003, R0                      ; 6686   03B8 0003
        SUBI    #$0002, R0                      ; 6688   0338 0002
        BMI     L_66A3                          ; 668A   020B 0017
        BEQ     L_66A1                          ; 668C   0204 0013

        CMP     G_0139, R0                      ; 668E   0340 0139
        BGE     L_669B                          ; 6690   020D 0009

        MVI     G_0167, R0                      ; 6692   0280 0167
        SLR     R0,     1                       ; 6694   0060
        CMP     G_0169, R0                      ; 6695   0340 0169
        BLE     L_66A3                          ; 6697   0206 000A
        B       L_66A1                          ; 6699   0200 0006

L_669B:
        JSR     R5,     X_RAND1                 ; 669B   0004 0114 027D

        TSTR    R0                              ; 669E   0080
        BNEQ    L_66A3                          ; 669F   020C 0002

L_66A1:
        ADDI    #$005A, R2                      ; 66A1   02FA 005A
L_66A3:
        MVO     R2,     G_0137                  ; 66A3   0242 0137
        MVI@    R3,     R3                      ; 66A5   029B
        SLR     R3,     2                       ; 66A6   0067
        SLR     R3,     2                       ; 66A7   0067
        ANDI    #$000E, R3                      ; 66A8   03BB 000E
        MOVR    R3,     R5                      ; 66AA   009D
        SDBD                                    ; 66AB   0001
        ADDI    #$66F2, R5                      ; 66AC   02FD 00F2 0066
        MOVR    R2,     R1                      ; 66AF   0091
        SLL     R1,     1                       ; 66B0   0049
        SDBD                                    ; 66B1   0001
        ADDI    #$5A1E, R1                      ; 66B2   02F9 001E 005A
        MVI@    R1,     R1                      ; 66B5   0289
        MOVR    R1,     R3                      ; 66B6   008B
        ANDI    #$0007, R1                      ; 66B7   03B9 0007
        XORR    R1,     R3                      ; 66B9   01CB
        SLL     R3,     1                       ; 66BA   004B
        ADDR    R3,     R1                      ; 66BB   00D9
        ANDI    #$001F, R1                      ; 66BC   03B9 001F
        SDBD                                    ; 66BE   0001
        XORI    #$1600, R1                      ; 66BF   03F9 0000 0016
        SLR     R3,     2                       ; 66C2   0067
        SLR     R3,     2                       ; 66C3   0067
        SLR     R3,     1                       ; 66C4   0063
        ANDI    #$0007, R3                      ; 66C5   03BB 0007
        MVII    #$0325, R4                      ; 66C7   02BC 0325
        SDBD                                    ; 66C9   0001
        MVII    #$5CF1, R0                      ; 66CA   02B8 00F1 005C
        CMPI    #$008D, R2                      ; 66CD   037A 008D
        BLT     L_66DD                          ; 66CF   0205 000C

        SDBD                                    ; 66D1   0001
        MVII    #$5D0D, R0                      ; 66D2   02B8 000D 005D
        CMPI    #$0003, R3                      ; 66D5   037B 0003
        BGT     L_66DD                          ; 66D7   020E 0004

        SDBD                                    ; 66D9   0001
        XORI    #$2000, R1                      ; 66DA   03F9 0000 0020
L_66DD:
        MVO@    R1,     R4                      ; 66DD   0261
        MVO@    R0,     R4                      ; 66DE   0260
        MVI@    R5,     R1                      ; 66DF   02A9
        SWAP    R1,     1                       ; 66E0   0041
        MVO@    R1,     R4                      ; 66E1   0261
        MVI@    R5,     R1                      ; 66E2   02A9
        SWAP    R1,     1                       ; 66E3   0041
        MVO@    R1,     R4                      ; 66E4   0261
        INCR    R4                              ; 66E5   000C
        MVO@    R3,     R4                      ; 66E6   0263
        PSHR    R3                              ; 66E7   0273
        PSHR    R2                              ; 66E8   0272
        SDBD                                    ; 66E9   0001
        MVII    #$784C, R2                      ; 66EA   02BA 004C 0078
        MVII    #$0032, R3                      ; 66ED   02BB 0032
        MVII    #$0325, R1                      ; 66EF   02B9 0325

        JSR     R5,     .EXEC.9A1               ; 66F1   0004 0118 01A1

        B       L_6600                          ; 66F4   0220 00F5

        DECLE   $0060,  $0038,  $0050,  $0022   ; 66F6   0060 0038 0050 0022
        DECLE   $0050,  $0037                   ; 66FA   0050 0037

        RLC     R2,     1                       ; 66FC   0052
        RSWD    R0                              ; 66FD   0038
        MVII    #$0002, R4                      ; 66FE   02BC 0002
        INCR    R7                              ; 6700   000F

        CLRR    R4                              ; 6701   01E4
L_6702:
        PSHR    R5                              ; 6702   0275
        PSHR    R1                              ; 6703   0271
        MOVR    R0,     R1                      ; 6704   0081
        ADDI    #$0136, R1                      ; 6705   02F9 0136
        MVI@    R1,     R1                      ; 6707   0289

        JSR     R5,     L_6349                  ; 6708   0004 0160 0349

        MOVR    R2,     R3                      ; 670B   0093
        SLL     R2,     2                       ; 670C   004E
        TSTR    R0                              ; 670D   0080
        BEQ     L_6715                          ; 670E   0204 0005
        ADD     G_0139, R7                      ; 6710   02C7 0139

        SUBR    R3,     R2                      ; 6712   011A
        SUBR    R3,     R2                      ; 6713   011A
        SUBR    R3,     R2                      ; 6714   011A
L_6715:
        ADDI    #$0006, R2                      ; 6715   02FA 0006
        ADDR    R4,     R7                      ; 6717   00E7

        SLL     R2,     1                       ; 6718   004A
        NOP                                     ; 6719   0034
        MOVR    R0,     R3                      ; 671A   0083
        ADDI    #$0166, R3                      ; 671B   02FB 0166
        ADDR    R4,     R3                      ; 671D   00E3
        MOVR    R0,     R1                      ; 671E   0081
        ADDI    #$0170, R1                      ; 671F   02F9 0170
        ADDR    R4,     R1                      ; 6721   00E1
        MVI@    R1,     R1                      ; 6722   0289
        SLL     R1,     1                       ; 6723   0049
        ADD@    R3,     R1                      ; 6724   02D9
        PSHR    R3                              ; 6725   0273
        MOVR    R0,     R3                      ; 6726   0083
        XORI    #$0001, R3                      ; 6727   03FB 0001
        ADDI    #$0166, R3                      ; 6729   02FB 0166
        ADDR    R4,     R3                      ; 672B   00E3
        ADD@    R3,     R2                      ; 672C   02DA
        MOVR    R1,     R3                      ; 672D   008B
        SUBR    R2,     R3                      ; 672E   0113
        BMI     L_6732                          ; 672F   020B 0001

        CLRR    R3                              ; 6731   01DB
L_6732:
        MOVR    R1,     R0                      ; 6732   0088
        INCR    R0                              ; 6733   0008

        JSR     R5,     X_RAND2                 ; 6734   0004 0114 029E

        MOVR    R0,     R1                      ; 6737   0081
        MOVR    R2,     R0                      ; 6738   0090

        JSR     R5,     X_RAND2                 ; 6739   0004 0114 029E

        INCR    R0                              ; 673C   0008
        SUBR    R0,     R1                      ; 673D   0101
        BMI     L_6741                          ; 673E   020B 0001

        CLRR    R1                              ; 6740   01C9
L_6741:
        ADDR    R3,     R1                      ; 6741   00D9
        SAR     R1,     2                       ; 6742   006D
        SAR     R1,     1                       ; 6743   0069
        PULR    R3                              ; 6744   02B3
        ADD@    R3,     R1                      ; 6745   02D9
        BPL     L_6749                          ; 6746   0203 0001

        CLRR    R1                              ; 6748   01C9
L_6749:
        MVO@    R1,     R3                      ; 6749   0259
        PULR    R1                              ; 674A   02B1
L_674B:
        CLRR    R0                              ; 674B   01C0
        MVO@    R0,     R1                      ; 674C   0248
        INCR    R1                              ; 674D   0009
        MVO@    R0,     R1                      ; 674E   0248

        JSR     R5,     L_6C74                  ; 674F   0004 016C 0074

        PSHR    R5                              ; 6752   0275
        MVII    #$0040, R0                      ; 6753   02B8 0040
        MVO     R0,     G_0180                  ; 6755   0240 0180
        B       L_674B                          ; 6757   0220 000D

        PSHR    R5                              ; 6759   0275
L_675A:
        MVI     G_0167, R0                      ; 675A   0280 0167
        TSTR    R0                              ; 675C   0080
        BEQ     L_6764                          ; 675D   0204 0005

        MVI     G_0169, R0                      ; 675F   0280 0169
        TSTR    R0                              ; 6761   0080
        BNEQ    L_67A3                          ; 6762   020C 003F

L_6764:
        SDBD                                    ; 6764   0001
        MVII    #$1906, R1                      ; 6765   02B9 0006 0019
        MVO     R1,     G_035D                  ; 6768   0241 035D
        MVO     R0,     G_0180                  ; 676A   0240 0180
        MVO     R0,     G_017E                  ; 676C   0240 017E
        MVI     G_016A, R0                      ; 676E   0280 016A
        SUBI    #$0005, R0                      ; 6770   0338 0005
        CMPI    #$000A, R0                      ; 6772   0378 000A
        BLE     L_67EF                          ; 6774   0206 0079

        MVO     R0,     G_016A                  ; 6776   0240 016A
        MVI     G_0165, R1                      ; 6778   0281 0165
        SUBI    #$0003, R1                      ; 677A   0339 0003
        CMPI    #$0005, R1                      ; 677C   0379 0005
        BLE     L_67EF                          ; 677E   0206 006F

        MVO     R1,     G_0169                  ; 6780   0241 0169
        MVO     R1,     G_0165                  ; 6782   0241 0165
        MVO     R0,     G_0167                  ; 6784   0240 0167
        MVII    #$0006, R0                      ; 6786   02B8 0006
        MVII    #$0176, R4                      ; 6788   02BC 0176

        JSR     R5,     X_FILL_ZERO             ; 678A   0004 0114 0338
        JSR     R5,     L_6C3E                  ; 678D   0004 016C 003E

        MVII    #$0003, R0                      ; 6790   02B8 0003
        MVO     R0,     G_0138                  ; 6792   0240 0138

        JSR     R5,     .EXEC.A61               ; 6794   0004 0118 0261

        COMR    R6                              ; 6797   001E
        CLRR    R0                              ; 6798   01C0
        MVO     R0,     G_0354                  ; 6799   0240 0354
        MVO     R0,     G_0183                  ; 679B   0240 0183
        INCR    R0                              ; 679D   0008
        MVO     R0,     G_0184                  ; 679E   0240 0184
        J       L_511F                          ; 67A0   0004 0350 011F

L_67A3:
        MVI     G_0334, R1                      ; 67A3   0281 0334
        DECR    R1                              ; 67A5   0011
        BMI     L_67B1                          ; 67A6   020B 0009

        MVO     R1,     G_0334                  ; 67A8   0241 0334
        BNEQ    L_67B1                          ; 67AA   020C 0005

        MVO     R1,     G_0135                  ; 67AC   0241 0135

        JSR     R5,     L_6BD7                  ; 67AE   0004 0168 03D7

L_67B1:
        MVI     G_0166, R1                      ; 67B1   0281 0166
        TSTR    R1                              ; 67B3   0089
        BEQ     L_67BB                          ; 67B4   0204 0005

        MVI     G_0168, R1                      ; 67B6   0281 0168
        TSTR    R1                              ; 67B8   0089
        BNEQ    L_67EE                          ; 67B9   020C 0033

L_67BB:
        ADD     G_0180, R1                      ; 67BB   02C1 0180
        BEQ     L_67EE                          ; 67BD   0204 002F

        MVI     G_0184, R1                      ; 67BF   0281 0184
        SDBD                                    ; 67C1   0001
        ADDI    #$51CB, R1                      ; 67C2   02F9 00CB 0051
        MVI@    R1,     R1                      ; 67C5   0289
        ADD     G_0183, R1                      ; 67C6   02C1 0183

        JSR     R5,     L_5883                  ; 67C8   0004 0158 0083

        DECR    R5                              ; 67CB   0015
        CLRR    R1                              ; 67CC   01C9
        CMPI    #$00F4, R3                      ; 67CD   037B 00F4
        BNEQ    L_67D3                          ; 67CF   020C 0002

        MVII    #$00B5, R1                      ; 67D1   02B9 00B5
L_67D3:
        MVO@    R1,     R5                      ; 67D3   0269
        MVO     R1,     G_0161                  ; 67D4   0241 0161
        CLRR    R1                              ; 67D6   01C9
        MVO     R1,     G_0180                  ; 67D7   0241 0180
        MVII    #$032D, R1                      ; 67D9   02B9 032D
        MVI     G_0160, R0                      ; 67DB   0280 0160
        DECR    R0                              ; 67DD   0010
        BMI     L_67E6                          ; 67DE   020B 0006

        CMPI    #$00C0, R0                      ; 67E0   0378 00C0
        BGE     L_67E6                          ; 67E2   020D 0002

        MVII    #$0335, R1                      ; 67E4   02B9 0335

L_67E6:
        JSR     R5,     L_5CB7                  ; 67E6   0004 015C 00B7

        ADDI    #$0008, R1                      ; 67E9   02F9 0008

        JSR     R5,     L_5CB2                  ; 67EB   0004 015C 00B2

L_67EE:
        PULR    R7                              ; 67EE   02B7

L_67EF:
        JSR     R5,     L_6C27                  ; 67EF   0004 016C 0027

        MVII    #$0084, R0                      ; 67F2   02B8 0084
        MVO     R0,     G_015E                  ; 67F4   0240 015E
L_67F6:
        SDBD                                    ; 67F6   0001
        MVII    #$1906, R0                      ; 67F7   02B8 0006 0019
        MVO     R0,     G_035D                  ; 67FA   0240 035D

        JSR     R5,     .EXEC.A61               ; 67FC   0004 0118 0261
        DECLE   $0001                           ; 67FF   0001

        PULR    R7                              ; 6800   02B7

        TSTR    R0                              ; 6801   0080
        SAR     R3,     1                       ; 6802   006B
        INCR    R3                              ; 6803   000B
        SAR     R0,     1                       ; 6804   0068
        MOVR    R5,     R2                      ; 6805   00AA
        SAR     R3,     1                       ; 6806   006B
        TSTR    R3                              ; 6807   009B
        SAR     R3,     1                       ; 6808   006B
        MOVR    R3,     R7                      ; 6809   009F

        SAR     R3,     1                       ; 680A   006B
        PSHR    R5                              ; 680B   0275
        MVI     G_0138, R2                      ; 680C   0282 0138
        ADD     G_018C, R2                      ; 680E   02C2 018C
        ADD     G_015E, R2                      ; 6810   02C2 015E
        ADD     G_018F, R2                      ; 6812   02C2 018F
        BNEQ    L_684F                          ; 6814   020C 0039

        SLL     R0,     1                       ; 6816   0048
        ADDR    R0,     R7                      ; 6817   00C7
        B       L_6893                          ; 6818   0200 0079
        B       L_6AB4                          ; 681A   0200 0298
        B       L_6848                          ; 681C   0200 002A
        B       L_6850                          ; 681E   0200 0030
        B       L_6B01                          ; 6820   0200 02DF
        B       L_68E5                          ; 6822   0200 00C1
        B       L_685E                          ; 6824   0200 0038
        B       L_6AB1                          ; 6826   0200 0289
        B       L_6866                          ; 6828   0200 003C
        B       L_68BC                          ; 682A   0200 0090

        ADDI    #$0004, R0                      ; 682C   02F8 0004
        MVI     G_0180, R1                      ; 682E   0281 0180
        ANDI    #$00BF, R1                      ; 6830   03B9 00BF
        BNEQ    L_686A                          ; 6832   020C 0036

        SUBI    #$0015, R0                      ; 6834   0338 0015

        JSR     R5,     L_68CF                  ; 6836   0004 0168 00CF

        MVII    #$0001, R1                      ; 6839   02B9 0001
        MVO     R1,     G_0138                  ; 683B   0241 0138

        JSR     R5,     .EXEC.A61               ; 683D   0004 0118 0261
        DECLE   $000F                           ; 6840   000F

        MVI     G_018D, R0                      ; 6841   0280 018D
        XORI    #$0002, R0                      ; 6843   03F8 0002

        JSR     R5,     L_68D0                  ; 6845   0004 0168 00D0

L_6848:
        MVII    #$0174, R4                      ; 6848   02BC 0174
        MOVR    R4,     R5                      ; 684A   00A5
        MVI@    R4,     R2                      ; 684B   02A2
        MVI@    R4,     R1                      ; 684C   02A1
        MVO@    R1,     R5                      ; 684D   0269
        MVO@    R2,     R5                      ; 684E   026A
L_684F:
        PULR    R7                              ; 684F   02B7

L_6850:
        MVII    #$0176, R4                      ; 6850   02BC 0176
        MOVR    R4,     R5                      ; 6852   00A5
        MVII    #$0005, R0                      ; 6853   02B8 0005
        MVI     G_017B, R2                      ; 6855   0282 017B
L_6857:
        MVI@    R4,     R1                      ; 6857   02A1
        MVO@    R2,     R5                      ; 6858   026A
        MOVR    R1,     R2                      ; 6859   008A
        DECR    R0                              ; 685A   0010
        BPL     L_6857                          ; 685B   0223 0005
        PULR    R7                              ; 685D   02B7

L_685E:
        MVII    #$0175, R4                      ; 685E   02BC 0175
        MOVR    R4,     R5                      ; 6860   00A5
        MVI@    R4,     R1                      ; 6861   02A1
        MVI@    R4,     R2                      ; 6862   02A2
        MVO@    R2,     R5                      ; 6863   026A
        MVO@    R1,     R5                      ; 6864   0269
L_6865:
        PULR    R7                              ; 6865   02B7

L_6866:
        MVI     G_0180, R1                      ; 6866   0281 0180
        ANDI    #$00BF, R1                      ; 6868   03B9 00BF
L_686A:
        BNEQ    L_6B7D                          ; 686A   020C 0311

        MVI     G_016A, R3                      ; 686C   0283 016A
        MVI     G_0167, R2                      ; 686E   0282 0167
        MVI     G_0165, R4                      ; 6870   0284 0165
        MVI     G_0169, R5                      ; 6872   0285 0169
        CMPR    R3,     R2                      ; 6874   015A
        BLT     L_687A                          ; 6875   0205 0003

        CMPR    R4,     R5                      ; 6877   0165
        BGE     L_684F                          ; 6878   022D 002A

L_687A:
        MVI     G_017D, R1                      ; 687A   0281 017D
        DECR    R1                              ; 687C   0011
        BMI     L_684F                          ; 687D   022B 002F

        ADDI    #$0005, R2                      ; 687F   02FA 0005
        MVO     R1,     G_017D                  ; 6881   0241 017D
        CMPR    R3,     R2                      ; 6883   015A
        BLE     L_6887                          ; 6884   0206 0001

        MOVR    R3,     R2                      ; 6886   009A
L_6887:
        MVO     R2,     G_0167                  ; 6887   0242 0167
        ADDI    #$0002, R5                      ; 6889   02FD 0002
        CMPR    R4,     R5                      ; 688B   0165
        BLE     L_688F                          ; 688C   0206 0001

        MOVR    R4,     R5                      ; 688E   00A5
L_688F:
        MVO     R5,     G_0169                  ; 688F   0245 0169
        B       L_6866                          ; 6891   0220 002C

L_6893:
        MVI     G_0180, R1                      ; 6893   0281 0180
        ANDI    #$007F, R1                      ; 6895   03B9 007F
        BEQ     L_689F                          ; 6897   0204 0006

        MVO     R1,     G_0180                  ; 6899   0241 0180

        JSR     R5,     .EXEC.A61               ; 689B   0004 0118 0261

        ADCR    R0                              ; 689E   0028
L_689F:
        CLRR    R0                              ; 689F   01C0
        MVO     R0,     G_0180                  ; 68A0   0240 0180
        MVI     G_0181, R1                      ; 68A2   0281 0181
        CMP     G_0183, R1                      ; 68A4   0341 0183
        BEQ     L_6865                          ; 68A6   0224 0042

        MVO     R1,     G_0183                  ; 68A8   0241 0183
        MVI     G_0182, R1                      ; 68AA   0281 0182
        MOVR    R1,     R2                      ; 68AC   008A
        XOR     G_0184, R2                      ; 68AD   03C2 0184
        ANDI    #$0001, R2                      ; 68AF   03BA 0001
        XORI    #$0001, R2                      ; 68B1   03FA 0001
        XOR     G_018E, R2                      ; 68B3   03C2 018E
        MVO     R2,     G_018E                  ; 68B5   0242 018E
        MVO     R1,     G_0184                  ; 68B7   0241 0184
        J       L_5127                          ; 68B9   0004 0350 0127

L_68BC:
        MVI     G_0180, R1                      ; 68BC   0281 0180
        ANDI    #$00BF, R1                      ; 68BE   03B9 00BF
        BNEQ    L_6B7D                          ; 68C0   020C 02BB

        MVI     G_0160, R1                      ; 68C2   0281 0160
        CMPI    #$0003, R1                      ; 68C4   0379 0003
        BNEQ    L_6B7D                          ; 68C6   020C 02B5

        MVII    #$0080, R1                      ; 68C8   02B9 0080
        CLRR    R5                              ; 68CA   01ED
        MVO     R5,     G_017F                  ; 68CB   0245 017F
        B       L_6B94                          ; 68CD   0200 02C5

L_68CF:
        PSHR    R5                              ; 68CF   0275
L_68D0:
        MVO     R0,     G_018D                  ; 68D0   0240 018D

        JSR     R5,     L_521B                  ; 68D2   0004 0150 021B

        MVI     G_018D, R1                      ; 68D5   0281 018D
        ADD     G_0184, R1                      ; 68D7   02C1 0184
        ANDI    #$0003, R1                      ; 68D9   03B9 0003
        MVO     R1,     G_0184                  ; 68DB   0241 0184
        MVII    #$0002, R1                      ; 68DD   02B9 0002

        JSR     R5,     L_51E4                  ; 68DF   0004 0150 01E4
        JSR     R5,     L_5857                  ; 68E2   0004 0158 0057

L_68E5:
        MVI     G_0175, R1                      ; 68E5   0281 0175
        DECR    R1                              ; 68E7   0011
        BMI     L_6B7D                          ; 68E8   020B 0293

        MOVR    R1,     R3                      ; 68EA   008B

        JSR     R5,     L_6349                  ; 68EB   0004 0160 0349

        CMPI    #$001A, R3                      ; 68EE   037B 001A
        BLE     L_6AA2                          ; 68F0   0206 01B0

        CMPI    #$006F, R3                      ; 68F2   037B 006F
        BLT     L_6B7D                          ; 68F4   0205 0287

        CMPI    #$00A5, R3                      ; 68F6   037B 00A5
        BGE     L_6918                          ; 68F8   020D 001E

        CMPI    #$0080, R3                      ; 68FA   037B 0080
        BGT     L_6B7D                          ; 68FC   020E 027F

        SLL     R2,     1                       ; 68FE   004A
        ADDR    R2,     R7                      ; 68FF   00D7
        B       L_69ED                          ; 6900   0200 00EB
        B       L_69D8                          ; 6902   0200 00D4
        B       L_69BE                          ; 6904   0200 00B8
        B       L_69BA                          ; 6906   0200 00B2
        B       L_69AA                          ; 6908   0200 00A0
        B       L_699E                          ; 690A   0200 0092
        B       L_698E                          ; 690C   0200 0080
        B       L_6972                          ; 690E   0200 0062
        B       L_695F                          ; 6910   0200 004D
        B       L_6925                          ; 6912   0200 0011

        MVO     R3,     G_017E                  ; 6914   0243 017E
        B       L_69E9                          ; 6916   0200 00D1

L_6918:
        MOVR    R2,     R4                      ; 6918   0094
        MVI     G_016F, R1                      ; 6919   0281 016F

        JSR     R5,     L_6349                  ; 691B   0004 0160 0349

        CMPR    R4,     R2                      ; 691E   0162
        BGE     L_6923                          ; 691F   020D 0002

        MVO     R3,     G_016F                  ; 6921   0243 016F
L_6923:
        B       L_69E9                          ; 6923   0200 00C4

L_6925:
        MVI     G_0180, R0                      ; 6925   0280 0180
        ANDI    #$00BF, R0                      ; 6927   03B8 00BF
        BNEQ    L_6B7D                          ; 6929   020C 0252

        MVII    #$0006, R2                      ; 692B   02BA 0006
        MVI     G_0160, R1                      ; 692D   0281 0160
        DECR    R1                              ; 692F   0011
        BMI     L_6B7D                          ; 6930   020B 024B

        CMPI    #$0003, R1                      ; 6932   0379 0003
        BLT     L_6AA1                          ; 6934   0205 016B

        CMPI    #$004A, R1                      ; 6936   0379 004A
        BLE     L_6944                          ; 6938   0206 000A

        CMPI    #$005D, R1                      ; 693A   0379 005D
        BLT     L_6AA1                          ; 693C   0205 0163

        CMPI    #$006E, R1                      ; 693E   0379 006E
        BGT     L_6AA1                          ; 6940   020E 015F

        MVII    #$0003, R2                      ; 6942   02BA 0003
L_6944:
        PSHR    R2                              ; 6944   0272

        JSR     R5,     X_DIV                   ; 6945   0004 011C 01FB

        PULR    R2                              ; 6948   02B2
        CMPI    #$0002, R1                      ; 6949   0379 0002
        BEQ     L_6AA1                          ; 694B   0204 0154

        CMPI    #$0002, R1                      ; 694D   0379 0002
        BLT     L_6952                          ; 694F   0205 0001

        INCR    R0                              ; 6951   0008
L_6952:
        MOVR    R2,     R1                      ; 6952   0091

        JSR     R5,     X_MPY                   ; 6953   0004 011C 01DC

        ADDI    #$0003, R2                      ; 6956   02FA 0003
        MVO     R2,     G_0160                  ; 6958   0242 0160

        JSR     R5,     L_6BC4                  ; 695A   0004 0168 03C4

        B       L_6A4D                          ; 695D   0200 00EE

L_695F:
        MVI     G_0135, R0                      ; 695F   0280 0135
        ANDI    #$00FB, R0                      ; 6961   03B8 00FB
        XORI    #$0004, R0                      ; 6963   03F8 0004
        MVO     R0,     G_0135                  ; 6965   0240 0135
        MVII    #$000E, R0                      ; 6967   02B8 000E

        JSR     R5,     X_RAND1                 ; 6969   0004 0114 027D

        INCR    R0                              ; 696C   0008
        MVO     R0,     G_0334                  ; 696D   0240 0334

        JSR     R5,     L_6BC5                  ; 696F   0004 0168 03C5
L_6972:
        JSR     R5,     L_6BC4                  ; 6972   0004 0168 03C4

        MVI     G_0184, R1                      ; 6975   0281 0184
        SDBD                                    ; 6977   0001
        ADDI    #$51CB, R1                      ; 6978   02F9 00CB 0051
        MVI     G_0183, R3                      ; 697B   0283 0183
        ADD@    R1,     R3                      ; 697D   02CB
        MOVR    R3,     R1                      ; 697E   0099
        ANDI    #$000F, R1                      ; 697F   03B9 000F
        CMPI    #$000B, R1                      ; 6981   0379 000B
        BGT     L_6B7D                          ; 6983   020E 01F8

        ANDI    #$00F0, R3                      ; 6985   03BB 00F0
        CMPI    #$00B0, R3                      ; 6987   037B 00B0
        BGT     L_6B7D                          ; 6989   020E 01F2
        J       L_5139                          ; 698B   0004 0350 0139

L_698E:
        MVI     G_0165, R0                      ; 698E   0280 0165
        SLL     R0,     1                       ; 6990   0048
        MVI     G_016A, R1                      ; 6991   0281 016A
        SLR     R1,     1                       ; 6993   0061
        MVO     R0,     G_0167                  ; 6994   0240 0167
        MVO     R0,     G_016A                  ; 6996   0240 016A
L_6998:
        MVO     R1,     G_0169                  ; 6998   0241 0169
        MVO     R1,     G_0165                  ; 699A   0241 0165
        B       L_69E0                          ; 699C   0200 0042

L_699E:
        MVI     G_0165, R1                      ; 699E   0281 0165
        ADDI    #$000A, R1                      ; 69A0   02F9 000A
        CMPI    #$0063, R1                      ; 69A2   0379 0063
        BLE     L_69A8                          ; 69A4   0206 0002

        MVII    #$0063, R1                      ; 69A6   02B9 0063
L_69A8:
        B       L_6998                          ; 69A8   0220 0011

L_69AA:
        MVI     G_016A, R0                      ; 69AA   0280 016A
        ADDI    #$000A, R0                      ; 69AC   02F8 000A
        CMPI    #$00C7, R0                      ; 69AE   0378 00C7
        BLE     L_69B4                          ; 69B0   0206 0002

        MVII    #$00C7, R0                      ; 69B2   02B8 00C7
L_69B4:
        MVO     R0,     G_0167                  ; 69B4   0240 0167
        MVO     R0,     G_016A                  ; 69B6   0240 016A
        B       L_69E0                          ; 69B8   0200 0026

L_69BA:
        MVII    #$0002, R2                      ; 69BA   02BA 0002
        B       L_69C0                          ; 69BC   0200 0002

L_69BE:
        MVII    #$0001, R2                      ; 69BE   02BA 0001
L_69C0:
        MOVR    R2,     R3                      ; 69C0   0093
        COMR    R3                              ; 69C1   001B
        MVI     G_0180, R0                      ; 69C2   0280 0180
        ANDI    #$00BF, R0                      ; 69C4   03B8 00BF
        BNEQ    L_6B7D                          ; 69C6   020C 01B5

        MVI     G_0135, R0                      ; 69C8   0280 0135
        ANDR    R3,     R0                      ; 69CA   0198
        ADDR    R2,     R0                      ; 69CB   00D0
        MVO     R0,     G_0135                  ; 69CC   0240 0135
        MVII    #$000E, R0                      ; 69CE   02B8 000E

        JSR     R5,     X_RAND1                 ; 69D0   0004 0114 027D

        INCR    R0                              ; 69D3   0008
        MVO     R0,     G_0334                  ; 69D4   0240 0334
        B       L_69E0                          ; 69D6   0200 0008

L_69D8:
        MVI     G_016A, R1                      ; 69D8   0281 016A
        MVO     R1,     G_0167                  ; 69DA   0241 0167
        MVI     G_0165, R1                      ; 69DC   0281 0165
        MVO     R1,     G_0169                  ; 69DE   0241 0169

L_69E0:
        JSR     R5,     L_6BC4                  ; 69E0   0004 0168 03C4

        MVI     G_0180, R0                      ; 69E3   0280 0180
        ANDI    #$007F, R0                      ; 69E5   03B8 007F
        MVO     R0,     G_0180                  ; 69E7   0240 0180
L_69E9:
        CLRR    R1                              ; 69E9   01C9
        MVO     R1,     G_0175                  ; 69EA   0241 0175
        PULR    R7                              ; 69EC   02B7

L_69ED:
        MVI     G_0180, R2                      ; 69ED   0282 0180
        ANDI    #$00BF, R2                      ; 69EF   03BA 00BF
        BNEQ    L_6B7D                          ; 69F1   020C 018A

        DECR    R1                              ; 69F3   0011
        MVI@    R1,     R2                      ; 69F4   028A
        ANDI    #$0003, R2                      ; 69F5   03BA 0003
        MVI     G_0160, R1                      ; 69F7   0281 0160
        DECR    R1                              ; 69F9   0011
        BMI     L_6AA1                          ; 69FA   020B 00A5

        CMPI    #$004B, R1                      ; 69FC   0379 004B
        BLT     L_6AA1                          ; 69FE   0205 00A1

        CMPI    #$0053, R1                      ; 6A00   0379 0053
        BGT     L_6AA1                          ; 6A02   020E 009D

        MVI     G_032D, R3                      ; 6A04   0283 032D
        ANDI    #$0003, R3                      ; 6A06   03BB 0003
        CMPR    R3,     R2                      ; 6A08   015A
        BGT     L_6AA1                          ; 6A09   020E 0096

L_6A0B:
        MVII    #$0027, R0                      ; 6A0B   02B8 0027

        JSR     R5,     X_RAND2                 ; 6A0D   0004 0114 029E

        ADDI    #$005D, R0                      ; 6A10   02F8 005D
        CMPI    #$0080, R0                      ; 6A12   0378 0080
        BLE     L_6A18                          ; 6A14   0206 0002

        ADDI    #$0030, R0                      ; 6A16   02F8 0030
L_6A18:
        MOVR    R0,     R2                      ; 6A18   0082
        CMPI    #$007E, R2                      ; 6A19   037A 007E
        BGE     L_6A2A                          ; 6A1B   020D 000D

        CMPI    #$006F, R2                      ; 6A1D   037A 006F
        BLT     L_6A2A                          ; 6A1F   0205 0009

        MVII    #$0001, R0                      ; 6A21   02B8 0001

        JSR     R5,     X_RAND1                 ; 6A23   0004 0114 027D

        TSTR    R0                              ; 6A26   0080
        BEQ     L_6A0B                          ; 6A27   0224 001D

        MOVR    R2,     R0                      ; 6A29   0090
L_6A2A:
        MOVR    R1,     R3                      ; 6A2A   008B
        SLL     R2,     1                       ; 6A2B   004A
        SLL     R3,     1                       ; 6A2C   004B
        SDBD                                    ; 6A2D   0001
        ADDI    #$5A1F, R2                      ; 6A2E   02FA 001F 005A
        SDBD                                    ; 6A31   0001
        ADDI    #$5A1F, R3                      ; 6A32   02FB 001F 005A
        MVI@    R2,     R2                      ; 6A35   0292
        ANDI    #$000F, R2                      ; 6A36   03BA 000F
        MVI@    R3,     R3                      ; 6A38   029B
        SLR     R3,     2                       ; 6A39   0067
        SLR     R3,     2                       ; 6A3A   0067
        MVI     G_0135, R5                      ; 6A3B   0285 0135
        ANDI    #$0001, R5                      ; 6A3D   03BD 0001
        BEQ     L_6A43                          ; 6A3F   0204 0002

        ADDI    #$0007, R3                      ; 6A41   02FB 0007
L_6A43:
        CMPR    R2,     R3                      ; 6A43   0153
        BLT     L_6A0B                          ; 6A44   0225 003A

        INCR    R0                              ; 6A46   0008
        CMP     G_0175, R0                      ; 6A47   0340 0175
        BEQ     L_6A0B                          ; 6A49   0224 003F

        MVO     R0,     G_0160                  ; 6A4B   0240 0160
L_6A4D:
        MVI     G_0183, R1                      ; 6A4D   0281 0183

        JSR     R5,     L_5883                  ; 6A4F   0004 0158 0083

        DECR    R5                              ; 6A52   0015
        BPL     L_6A64                          ; 6A53   0203 000F

        MVII    #$01A5, R5                      ; 6A55   02BD 01A5
L_6A57:
        MVI@    R5,     R3                      ; 6A57   02AB
        TSTR    R3                              ; 6A58   009B
        BEQ     L_6A61                          ; 6A59   0204 0006

        INCR    R5                              ; 6A5B   000D
        CMPI    #$01DB, R5                      ; 6A5C   037D 01DB
        BLE     L_6A57                          ; 6A5E   0226 0008
        PULR    R7                              ; 6A60   02B7

L_6A61:
        SUBI    #$0002, R5                      ; 6A61   033D 0002
        MVO@    R1,     R5                      ; 6A63   0269
L_6A64:
        MVI     G_0160, R2                      ; 6A64   0282 0160
        MVO@    R2,     R5                      ; 6A66   026A
        CMPI    #$00B2, R2                      ; 6A67   037A 00B2
        BLT     L_6AA1                          ; 6A69   0205 0036

        CLRR    R0                              ; 6A6B   01C0
        DECR    R5                              ; 6A6C   0015
        MVO@    R0,     R5                      ; 6A6D   0268
        SLL     R2,     1                       ; 6A6E   004A
        SDBD                                    ; 6A6F   0001
        ADDI    #$5A1D, R2                      ; 6A70   02FA 001D 005A
        MVI@    R2,     R0                      ; 6A73   0290
        SLR     R0,     2                       ; 6A74   0064
        SLR     R0,     2                       ; 6A75   0064
        MOVR    R0,     R1                      ; 6A76   0081
        SLR     R1,     1                       ; 6A77   0061

        JSR     R5,     X_RAND2                 ; 6A78   0004 0114 029E

        INCR    R0                              ; 6A7B   0008
        ADDR    R1,     R0                      ; 6A7C   00C8
        NEGR    R0                              ; 6A7D   0020
        ADD     G_0167, R0                      ; 6A7E   02C0 0167
        BPL     L_6A83                          ; 6A80   0203 0001

        CLRR    R0                              ; 6A82   01C0
L_6A83:
        MVO     R0,     G_0166                  ; 6A83   0240 0166
        MVII    #$0001, R0                      ; 6A85   02B8 0001
        MVO     R0,     G_0138                  ; 6A87   0240 0138

        JSR     R5,     L_6C5F                  ; 6A89   0004 016C 005F
        JSR     R5,     .EXEC.A61               ; 6A8C   0004 0118 0261

        DECR    R3                              ; 6A8F   0013
        MVI     G_0166, R0                      ; 6A90   0280 0166
        MVO     R0,     G_0167                  ; 6A92   0240 0167
        CLRR    R0                              ; 6A94   01C0
        MVO     R0,     G_0160                  ; 6A95   0240 0160
        MVII    #$032D, R1                      ; 6A97   02B9 032D
        MVII    #$0048, R0                      ; 6A99   02B8 0048
        SWAP    R0,     1                       ; 6A9B   0040
        MVO     R0,     G_0330                  ; 6A9C   0240 0330

        JSR     R5,     L_5CB7                  ; 6A9E   0004 015C 00B7

L_6AA1:
        PULR    R7                              ; 6AA1   02B7

L_6AA2:
        DECR    R1                              ; 6AA2   0011
        MVI@    R1,     R2                      ; 6AA3   028A
        SLR     R2,     2                       ; 6AA4   0066
        SLR     R2,     2                       ; 6AA5   0066
        ANDI    #$0007, R2                      ; 6AA6   03BA 0007
        ADDI    #$016B, R2                      ; 6AA8   02FA 016B
        INCR    R3                              ; 6AAA   000B
        CMP@    R2,     R3                      ; 6AAB   0353
        BLE     L_6AAF                          ; 6AAC   0206 0001

        MVO@    R3,     R2                      ; 6AAE   0253
L_6AAF:
        B       L_69E9                          ; 6AAF   0220 00C7
L_6AB1:
        J       L_6521                          ; 6AB1   0004 0364 0121

L_6AB4:
        MVI     G_0160, R1                      ; 6AB4   0281 0160
        DECR    R1                              ; 6AB6   0011
        BMI     L_6AEC                          ; 6AB7   020B 0033

        CMPI    #$0002, R1                      ; 6AB9   0379 0002
        BEQ     L_6B7D                          ; 6ABB   0204 00C0
        BGT     L_6AD2                          ; 6ABD   020E 0013

        ADDI    #$017C, R1                      ; 6ABF   02F9 017C
        MVI@    R1,     R0                      ; 6AC1   0288
        ADDI    #$0009, R0                      ; 6AC2   02F8 0009
        SUB     G_0139, R0                      ; 6AC4   0300 0139
        CMPI    #$0063, R0                      ; 6AC6   0378 0063
        BLE     L_6ACC                          ; 6AC8   0206 0002

        MVII    #$0063, R0                      ; 6ACA   02B8 0063
L_6ACC:
        MVO@    R0,     R1                      ; 6ACC   0248
        CLRR    R0                              ; 6ACD   01C0
        MVO     R0,     G_0160                  ; 6ACE   0240 0160
        B       L_6A4D                          ; 6AD0   0220 0084

L_6AD2:
        CMPI    #$005D, R1                      ; 6AD2   0379 005D
        BLT     L_6AEC                          ; 6AD4   0205 0016

        CMPI    #$006F, R1                      ; 6AD6   0379 006F
        BLT     L_6AF5                          ; 6AD8   0205 001B

        CMPI    #$00B0, R1                      ; 6ADA   0379 00B0
        BLE     L_6AEC                          ; 6ADC   0206 000E

        CMPI    #$00B4, R1                      ; 6ADE   0379 00B4
        BNEQ    L_6B7D                          ; 6AE0   020C 009B

        JSR     R5,     L_6C4E                  ; 6AE2   0004 016C 004E

        MVII    #$0083, R0                      ; 6AE5   02B8 0083
        MVO     R0,     G_015E                  ; 6AE7   0240 015E
        J       L_67F6                          ; 6AE9   0004 0364 03F6

L_6AEC:
        INCR    R1                              ; 6AEC   0009
        MVI     G_0175, R2                      ; 6AED   0282 0175
        MVO     R2,     G_0160                  ; 6AEF   0242 0160
        MVO     R1,     G_0175                  ; 6AF1   0241 0175
        B       L_6A4D                          ; 6AF3   0220 00A7

L_6AF5:
        JSR     R5,     L_6349                  ; 6AF5   0004 0160 0349

        ADD     G_0354, R2                      ; 6AF8   02C2 0354
        MVO     R2,     G_0354                  ; 6AFA   0242 0354
        CLRR    R0                              ; 6AFC   01C0
        MVO     R0,     G_0160                  ; 6AFD   0240 0160
        B       L_6A4D                          ; 6AFF   0220 00B3

L_6B01:
        MVI     G_0180, R1                      ; 6B01   0281 0180
        ANDI    #$00BF, R1                      ; 6B03   03B9 00BF
        BNEQ    L_6B7D                          ; 6B05   020C 0076

        MVI     G_0160, R1                      ; 6B07   0281 0160
        DECR    R1                              ; 6B09   0011
        BMI     L_6B14                          ; 6B0A   020B 0008

        CMPI    #$0054, R1                      ; 6B0C   0379 0054
        BLT     L_6B14                          ; 6B0E   0205 0004

        CMPI    #$005C, R1                      ; 6B10   0379 005C
        BLE     L_6A0B                          ; 6B12   0226 0108

L_6B14:
        MVI     G_012D, R0                      ; 6B14   0280 012D
        MOVR    R0,     R1                      ; 6B16   0081
        ANDI    #$0002, R1                      ; 6B17   03B9 0002
        BEQ     L_6AA1                          ; 6B19   0224 0079

        SDBD                                    ; 6B1B   0001
        MVII    #$3140, R1                      ; 6B1C   02B9 0040 0031
        ANDI    #$0001, R0                      ; 6B1F   03B8 0001
        BNEQ    L_6B25                          ; 6B21   020C 0002

        XORI    #$0011, R0                      ; 6B23   03F8 0011
L_6B25:
        MVII    #$031D, R4                      ; 6B25   02BC 031D
        MVII    #$0048, R2                      ; 6B27   02BA 0048
L_6B29:
        MVO@    R1,     R4                      ; 6B29   0261
        INCR    R4                              ; 6B2A   000C
        MOVR    R2,     R3                      ; 6B2B   0093
        SWAP    R3,     1                       ; 6B2C   0043
        MVO@    R3,     R4                      ; 6B2D   0263
        MVII    #$0025, R3                      ; 6B2E   02BB 0025
        SWAP    R3,     1                       ; 6B30   0043
        MVO@    R3,     R4                      ; 6B31   0263
        CLRR    R3                              ; 6B32   01DB
        MVO@    R3,     R4                      ; 6B33   0263
        MVII    #$01F0, R3                      ; 6B34   02BB 01F0
        MVO@    R3,     R4                      ; 6B36   0263
        MVII    #$0016, R3                      ; 6B37   02BB 0016
        MVO@    R3,     R4                      ; 6B39   0263
        INCR    R4                              ; 6B3A   000C
        ADDI    #$0010, R2                      ; 6B3B   02FA 0010
        XORI    #$0200, R1                      ; 6B3D   03F9 0200
        CMPI    #$0325, R4                      ; 6B3F   037C 0325
        BEQ     L_6B29                          ; 6B41   0224 0019

        SDBD                                    ; 6B43   0001
        MVII    #$5CA8, R1                      ; 6B44   02B9 00A8 005C
        DIS                                     ; 6B47   0003
        MVO     R1,     G_031E                  ; 6B48   0241 031E
        MVO     R1,     G_0326                  ; 6B4A   0241 0326
        EIS                                     ; 6B4C   0002
        CLRR    R0                              ; 6B4D   01C0

        JSR     R5,     .EXEC.41C               ; 6B4E   0004 0114 001C

        MVII    #$0003, R0                      ; 6B51   02B8 0003
        MVO     R0,     G_0102                  ; 6B53   0240 0102
        SLR     R0,     1                       ; 6B55   0060
        MVO     R0,     G_0138                  ; 6B56   0240 0138
        MVII    #$00FC, R1                      ; 6B58   02B9 00FC

        JSR     R5,     L_5227                  ; 6B5A   0004 0150 0227

        MVII    #$0198, R4                      ; 6B5D   02BC 0198
        MVII    #$021C, R3                      ; 6B5F   02BB 021C
        MVII    #$0220, R2                      ; 6B61   02BA 0220
        MVO     R2,     G_0344                  ; 6B63   0242 0344

        JSR     R5,     L_555C                  ; 6B65   0004 0154 015C

        SDBD                                    ; 6B68   0001
        MVII    #$1E0C, R1                      ; 6B69   02B9 000C 001E
        XOR     G_018E, R1                      ; 6B6C   03C1 018E
        MVII    #$0230, R4                      ; 6B6E   02BC 0230
L_6B70:
        MVO@    R1,     R4                      ; 6B70   0261
        MVO@    R1,     R4                      ; 6B71   0261
        MVO@    R1,     R4                      ; 6B72   0261
        MVO@    R1,     R4                      ; 6B73   0261
        ADDI    #$0010, R4                      ; 6B74   02FC 0010
        ADDI    #$0050, R1                      ; 6B76   02F9 0050
        CMPI    #$0244, R4                      ; 6B78   037C 0244
        BEQ     L_6B70                          ; 6B7A   0224 000B
        PULR    R7                              ; 6B7C   02B7

L_6B7D:
        JSR     R5,     L_6CC8                  ; 6B7D   0004 016C 00C8

        PSHR    R5                              ; 6B80   0275
        MVI     G_0180, R1                      ; 6B81   0281 0180
        ANDI    #$00BF, R1                      ; 6B83   03B9 00BF
        BNEQ    L_6B7D                          ; 6B85   022C 0009

        TSTR    R0                              ; 6B87   0080
        BMI     L_6B94                          ; 6B88   020B 000A

        INCR    R0                              ; 6B8A   0008
        ANDI    #$000F, R0                      ; 6B8B   03B8 000F
        SLR     R0,     2                       ; 6B8D   0064
        SDBD                                    ; 6B8E   0001
        MVII    #$6B97, R1                      ; 6B8F   02B9 0097 006B
        ADDR    R0,     R1                      ; 6B92   00C1
        MVI@    R1,     R1                      ; 6B93   0289
L_6B94:
        MVO     R1,     G_018F                  ; 6B94   0241 018F
        PULR    R7                              ; 6B96   02B7

        DECLE   $0001,  $0004,  $0003,  $0000   ; 6B97   0001 0004 0003 0000

        MVI     G_017D, R1                      ; 6B9B   0281 017D
        B       L_6BA1                          ; 6B9D   0200 0002

        MVI     G_017C, R1                      ; 6B9F   0281 017C
L_6BA1:
        DECR    R0                              ; 6BA1   0010
        BMI     L_6BC3                          ; 6BA2   020B 001F

        MOVR    R1,     R0                      ; 6BA4   0088
        BEQ     L_6BC3                          ; 6BA5   0204 001C
        J       L_6C16                          ; 6BA7   0004 036C 0016

        MVII    #$0081, R1                      ; 6BAA   02B9 0081
        TSTR    R0                              ; 6BAC   0080
        BEQ     L_6BB6                          ; 6BAD   0204 0007
        BPL     L_6BB7                          ; 6BAF   0203 0006

        DECR    R1                              ; 6BB1   0011
        ADD     G_015E, R0                      ; 6BB2   02C0 015E
        BPL     L_6BC1                          ; 6BB4   0203 000B
L_6BB6:
        MOVR    R5,     R7                      ; 6BB6   00AF

L_6BB7:
        MVI     G_0138, R2                      ; 6BB7   0282 0138
        ADD     G_018C, R2                      ; 6BB9   02C2 018C
        ADD     G_0180, R2                      ; 6BBB   02C2 0180
        ANDI    #$00BF, R2                      ; 6BBD   03BA 00BF
        BNEQ    L_6BB6                          ; 6BBF   022C 000A

L_6BC1:
        MVO     R1,     G_015E                  ; 6BC1   0241 015E
L_6BC3:
        MOVR    R5,     R7                      ; 6BC3   00AF

L_6BC4:
        PSHR    R5                              ; 6BC4   0275

L_6BC5:
        JSR     R5,     X_PLAY_SFX2             ; 6BC5   0004 0118 03BE
        DECLE   $0082                           ; 6BC8  SFX prio
        DECLE   $0079                           ; 6BC9  SFX data
        DECLE   $03ED                           ; 6BCA  SFX data
        DECLE   $000F,  $FFFD                   ; 6BCB  SFX data
        DECLE   $02F5                           ; 6BCD  SFX data
        DECLE   $002E                           ; 6BCE  SFX data
        DECLE   $03EB                           ; 6BCF  SFX data
        DECLE   $FFFE                           ; 6BD0  SFX data
        DECLE   $03EB                           ; 6BD1  SFX data
        DECLE   $000F,  $0000                   ; 6BD2  SFX data
        DECLE   $008F,  $003F                   ; 6BD4  SFX data
        DECLE   $02CF                           ; 6BD6  SFX end

L_6BD7:
        PSHR    R5                              ; 6BD7   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BD8   0004 0118 03BE
        DECLE   $0082                           ; 6BDB  SFX prio
        DECLE   $0079                           ; 6BDC  SFX data
        DECLE   $03ED                           ; 6BDD  SFX data
        DECLE   $000F,  $FFFD                   ; 6BDE  SFX data
        DECLE   $0275                           ; 6BE0  SFX data
        DECLE   $002E                           ; 6BE1  SFX data
        DECLE   $03EB                           ; 6BE2  SFX data
        DECLE   $FFDE                           ; 6BE3  SFX data
        DECLE   $008F,  $0017                   ; 6BE4  SFX data
        DECLE   $02CF                           ; 6BE6  SFX end

L_6BE7:
        PSHR    R5                              ; 6BE7   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BE8   0004 0118 03BE
        DECLE   $009E                           ; 6BEB  SFX prio
        DECLE   $0389                           ; 6BEC  SFX data
        DECLE   $0180,  $02C0                   ; 6BED  SFX data
        DECLE   $0188,  $02F0                   ; 6BEF  SFX data
        DECLE   $0184,  $0320                   ; 6BF1  SFX data
        DECLE   $01DB                           ; 6BF3  SFX data
        DECLE   $0001,  $FFD3                   ; 6BF4  SFX data
        DECLE   $003E                           ; 6BF6  SFX data
        DECLE   $025D                           ; 6BF7  SFX data
        DECLE   $004F,  $000C                   ; 6BF8  SFX data
        DECLE   $0077,  $0010,  $006C           ; 6BFA  SFX data
        DECLE   $002B                           ; 6BFD  SFX data
        DECLE   $0389                           ; 6BFE  SFX data
        DECLE   $0023,  $FFE4                   ; 6BFF  SFX data
        DECLE   $0003,  $0006                   ; 6C01  SFX data
        DECLE   $02CF                           ; 6C03  SFX end

        DECLE   $0003,  $0012,  $FFCE,  $00DD   ; 6C04   0003 0012 FFCE 00DD
        DECLE   $0003,  $FFB8,  $000E,  $0001   ; 6C08   0003 FFB8 000E 0001
        DECLE   $0023,  $017B,  $0003,  $FFA0   ; 6C0C   0023 017B 0003 FFA0
UC_6C10:
        MVII    #$003F, R0                      ; 6C10  SLIB UCALL target
        ADDI    #$0008, R3                      ; 6C12   02FB 0008
        MVO@    R0,     R3                      ; 6C14   0258
        PULR    R7                              ; 6C15   02B7

L_6C16:
        PSHR    R5                              ; 6C16   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C17   0004 0118 03BE
        DECLE   $0081                           ; 6C1A  SFX prio
        DECLE   $03F9,  $000C,  $0060,  $0000   ; 6C1B   03F9 000C 0060 0000
        DECLE   $0060,  $006B,  $03E9,  $00B7   ; 6C1F   0060 006B 03E9 00B7
        DECLE   $000B,  $00C3,  $FFF4           ; 6C23   000B 00C3 FFF4

        ADD@    R1,     R7                      ; 6C26   02CF

L_6C27:
        PSHR    R5                              ; 6C27   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C28   0004 0118 03BE
        DECLE   $00A0                           ; 6C2B  SFX prio

        XOR@    R1,     R1                      ; 6C2C   03C9
        B       L_6CBF                          ; 6C2D   0200 0090

        DECLE   $0208,  $0092,  $0001,  $001B   ; 6C2F   0208 0092 0001 001B
        DECLE   $003E,  $00EB,  $0001,  $FFFF   ; 6C33   003E 00EB 0001 FFFF
        DECLE   $004E,  $02AB,  $0001,  $0013   ; 6C37   004E 02AB 0001 0013
        DECLE   $FF8E                           ; 6C3B   FF8E

        MVI@    R5,     R3                      ; 6C3C   02AB
        ADD@    R1,     R7                      ; 6C3D   02CF

L_6C3E:
        PSHR    R5                              ; 6C3E   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C3F   0004 0118 03BE
        DECLE   $00A0                           ; 6C42  SFX prio
        DECLE   $0389,  $0070,  $0300,  $0078   ; 6C43   0389 0070 0300 0078
        DECLE   $0320,  $0074,  $0340,  $03FC   ; 6C47   0320 0074 0340 03FC
        DECLE   $03FF,  $000B,  $03CF           ; 6C4B   03FF 000B 03CF
L_6C4E:
        PSHR    R5                              ; 6C4E   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C4F   0004 0118 03BE
        DECLE   $00A0                           ; 6C52  SFX prio

        SUB@    R5,     R7                      ; 6C53   032F

        DECLE   $0389,  $0050,  $00C0,  $0058   ; 6C54   0389 0050 00C0 0058
        DECLE   $00CD,  $0054,  $00D8,  $03FC   ; 6C58   00CD 0054 00D8 03FC
        DECLE   $03FF,  $000B,  $03CF           ; 6C5C   03FF 000B 03CF
L_6C5F:
        PSHR    R5                              ; 6C5F   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C60   0004 0118 03BE
        DECLE   $0084                           ; 6C63  SFX prio

        CMPI    #$0305, R1                      ; 6C64   0379 0305
        SAR     R1,     2                       ; 6C66   006D
        MOVR    R1,     R7                      ; 6C67   008F

        DECLE   $0047,  $0079,  $03F5,  $FFFE   ; 6C68   0047 0079 03F5 FFFE
        DECLE   $004F,  $0030,  $038D,  $0007   ; 6C6C   004F 0030 038D 0007
        DECLE   $0043,  $FFF0                   ; 6C70   0043 FFF0

        ADD@    R1,     R7                      ; 6C72   02CF

        PSHR    R5                              ; 6C73   0275

L_6C74:
        JSR     R5,     X_PLAY_SFX2             ; 6C74   0004 0118 03BE
        DECLE   $0083                           ; 6C77  SFX prio
        DECLE   $00AB,  $02A9,  $0060,  $0000   ; 6C78   00AB 02A9 0060 0000
        DECLE   $0064,  $0000                   ; 6C7C   0064 0000

        COMR    R4                              ; 6C7E   001C
        B       L_6F2E                          ; 6C7F   0200 02AD

        DECLE   $02A5,  $FFCA                   ; 6C81   02A5 FFCA

        INCR    R3                              ; 6C83   000B
        XOR@    R5,     R3                      ; 6C84   03EB
        ADD@    R1,     R7                      ; 6C85   02CF

L_6C86:
        PSHR    R5                              ; 6C86   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C87   0004 0118 03BE
        DECLE   $0084                           ; 6C8A  SFX prio
        DECLE   $0309,  $0290,  $0000           ; 6C8B   0309 0290 0000

        MVI@    R3,     R0                      ; 6C8E   0298
        DECR    R0                              ; 6C8F   0010
        MVI@    R2,     R4                      ; 6C90   0294
        NEGR    R0                              ; 6C91   0020
        DECR    R1                              ; 6C92   0011
        SWAP    R3,     1                       ; 6C93   0043
        SLL     R1,     2                       ; 6C94   004D
        INCR    R7                              ; 6C95   000F

        EIS                                     ; 6C96   0002
L_6C97:
        SLL     R2,     2                       ; 6C97   004E
        DECLE   $01AB,  $FFCE                   ; 6C98   01AB FFCE

        DECR    R1                              ; 6C9A   0011
        SLR     R3,     1                       ; 6C9B   0063
        MVO@    R3,     R5                      ; 6C9C   026B
        ADD@    R1,     R7                      ; 6C9D   02CF

        PSHR    R5                              ; 6C9E   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C9F   0004 0118 03BE
        DECLE   $0085                           ; 6CA2  SFX prio
        DECLE   $0009,  $03ED,  $02D0,  $0000   ; 6CA3   0009 03ED 02D0 0000

        ADD@    R3,     R0                      ; 6CA7   02D8
        B       L_6F8E                          ; 6CA8   0200 02E4

        DECLE   $0000,  $004E,  $01EB,  $FFFE   ; 6CAA   0000 004E 01EB FFFE

        MOVR    R1,     R7                      ; 6CAE   008F

L_6CAF:
        SLL     R3,     2                       ; 6CAF   004F
        ADD@    R1,     R7                      ; 6CB0   02CF

        PSHR    R5                              ; 6CB1   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CB2   0004 0118 03BE
        DECLE   $0085                           ; 6CB5  SFX prio
        DECLE   $0079,  $038D,  $03F5,  $FFFE   ; 6CB6   0079 038D 03F5 FFFE

        MOVR    R2,     R7                      ; 6CBA   0097

        DECLE   $0041,  $03AD,  $03B5,  $FFFE   ; 6CBB   0041 03AD 03B5 FFFE
L_6CBF:
        RLC     R3,     2                       ; 6CBF   0057
        DECLE   $0045,  $03ED,  $0335,  $FFFE   ; 6CC0   0045 03ED 0335 FFFE

        MOVR    R1,     R7                      ; 6CC4   008F
L_6CC5:
        DECR    R7                              ; 6CC5   0017
        ADD@    R1,     R7                      ; 6CC6   02CF

        PSHR    R5                              ; 6CC7   0275

L_6CC8:
        JSR     R5,     X_PLAY_SFX2             ; 6CC8   0004 0118 03BE
        DECLE   $0081                           ; 6CCB  SFX prio
        DECLE   $03F9,  $0050,  $0000,  $000C   ; 6CCC   03F9 0050 0000 000C
        DECLE   $0040,  $020B,  $008F           ; 6CD0   0040 020B 008F

        DECR    R1                              ; 6CD3   0011
        ADD@    R1,     R7                      ; 6CD4   02CF

L_6CD5:
        PSHR    R5                              ; 6CD5   0275
        MVI     G_015E, R0                      ; 6CD6   0280 015E
        MOVR    R0,     R1                      ; 6CD8   0081
        BNEQ    L_6CE1                          ; 6CD9   020C 0006

        JSR     R5,     L_6118                  ; 6CDB   0004 0160 0118
        JSR     R5,     L_675A                  ; 6CDE   0004 0164 035A

L_6CE1:
        SWAP    R0,     2                       ; 6CE1   0044
        BMI     L_6D3F                          ; 6CE2   020B 005B

        CMPI    #$0004, R1                      ; 6CE4   0379 0004
        BNEQ    L_6CF4                          ; 6CE6   020C 000C

        MVI     G_031D, R0                      ; 6CE8   0280 031D
        SDBD                                    ; 6CEA   0001
        ANDI    #$FFDF, R0                      ; 6CEB   03B8 00DF 00FF
        MVO     R0,     G_031D                  ; 6CEE   0240 031D
        MVII    #$0002, R0                      ; 6CF0   02B8 0002
        MVO     R0,     G_0322                  ; 6CF2   0240 0322
L_6CF4:
        MVI     G_031D, R1                      ; 6CF4   0281 031D
        SDBD                                    ; 6CF6   0001
        XORI    #$1000, R1                      ; 6CF7   03F9 0000 0010
        MVO     R1,     G_031D                  ; 6CFA   0241 031D
        MVI     G_0354, R0                      ; 6CFC   0280 0354
        TSTR    R0                              ; 6CFE   0080
        BEQ     L_6D0F                          ; 6CFF   0204 000E

        MVII    #$0004, R1                      ; 6D01   02B9 0004
        MVII    #$02AE, R4                      ; 6D03   02BC 02AE
        MVII    #$0006, R3                      ; 6D05   02BB 0006
        SWAP    R3,     1                       ; 6D07   0043

        JSR     R5,     X_PRNUM_RGT             ; 6D08   0004 0118 00C5

        ADDI    #$0080, R3                      ; 6D0B   02FB 0080
        MVO     R3,     .BTAB.B2                ; 6D0D   0243 02B2
L_6D0F:
        MVI     G_015F, R1                      ; 6D0F   0281 015F
        SLL     R1,     2                       ; 6D11   004D
        SLL     R1,     1                       ; 6D12   0049
        ADDI    #$0025, R1                      ; 6D13   02F9 0025
        MVI     G_0183, R2                      ; 6D15   0282 0183
        ANDI    #$000F, R2                      ; 6D17   03BA 000F
        ADDR    R2,     R1                      ; 6D19   00D1
        SLR     R2,     2                       ; 6D1A   0066
        ADDR    R2,     R1                      ; 6D1B   00D1
        SWAP    R1,     1                       ; 6D1C   0041
        MVO     R1,     G_031F                  ; 6D1D   0241 031F
        MVI     G_0185, R2                      ; 6D1F   0282 0185
        MVI     G_0139, R3                      ; 6D21   0283 0139
        SLL     R3,     2                       ; 6D23   004F
        BNEQ    L_6D28                          ; 6D24   020C 0002

        MVII    #$0002, R3                      ; 6D26   02BB 0002
L_6D28:
        CMPR    R2,     R3                      ; 6D28   0153
        BLE     L_6D31                          ; 6D29   0206 0006

        SLL     R2,     2                       ; 6D2B   004E
        ADDI    #$0030, R2                      ; 6D2C   02FA 0030
        SWAP    R2,     1                       ; 6D2E   0042
        MVO     R2,     G_0320                  ; 6D2F   0242 0320
L_6D31:
        MVI     G_015E, R0                      ; 6D31   0280 015E
        CMPI    #$0003, R0                      ; 6D33   0378 0003
        BNEQ    L_6D3B                          ; 6D35   020C 0004

        MVO     R1,     G_0327                  ; 6D37   0241 0327
        MVO     R2,     G_0328                  ; 6D39   0242 0328

L_6D3B:
        JSR     R5,     L_6352                  ; 6D3B   0004 0160 0352

        PULR    R7                              ; 6D3E   02B7

L_6D3F:
        CLRR    R1                              ; 6D3F   01C9
        ANDI    #$0007, R0                      ; 6D40   03B8 0007
        MVO     R0,     G_015E                  ; 6D42   0240 015E
        BEQ     L_6D59                          ; 6D44   0204 0013

        JSR     R5,     L_525A                  ; 6D46   0004 0150 025A

        SDBD                                    ; 6D49   0001
        MVII    #$6DFB, R5                      ; 6D4A   02BD 00FB 006D

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6D4D   0004 001E 0335

        MVII    #$0006, R1                      ; 6D50   02B9 0006
        SWAP    R1,     1                       ; 6D52   0041

        JSR     R5,     L_6D73                  ; 6D53   0004 016C 0173
        JSR     R5,     L_6EF5                  ; 6D56   0004 016C 02F5
L_6D59:
        JSR     R5,     L_525A                  ; 6D59   0004 0150 025A

        SDBD                                    ; 6D5C   0001
        MVII    #$505D, R5                      ; 6D5D   02BD 005D 0050

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6D60   0004 001E 0335

        MVII    #$0016, R1                      ; 6D63   02B9 0016
        SWAP    R1,     1                       ; 6D65   0041
        MVII    #$00A0, R0                      ; 6D66   02B8 00A0
        MVII    #$0214, R4                      ; 6D68   02BC 0214

        JSR     R5,     X_FILL_MEM              ; 6D6A   0004 0114 0341
        JSR     R5,     L_6D73                  ; 6D6D   0004 016C 0173

        J       L_5127                          ; 6D70   0004 0350 0127

L_6D73:
        PSHR    R5                              ; 6D73   0275
        MVII    #$003C, R0                      ; 6D74   02B8 003C
        MVII    #$02B4, R4                      ; 6D76   02BC 02B4

        JSR     R5,     X_FILL_ZERO             ; 6D78   0004 0114 0338

        MVII    #$02BB, R4                      ; 6D7B   02BC 02BB
        MVII    #$0006, R0                      ; 6D7D   02B8 0006

        JSR     R5,     X_FILL_MEM              ; 6D7F   0004 0114 0341

        ADDI    #$000E, R4                      ; 6D82   02FC 000E
        MOVR    R1,     R2                      ; 6D84   008A
        SDBD                                    ; 6D85   0001
        XORI    #$08C0, R2                      ; 6D86   03FA 00C0 0008
        MVO@    R2,     R4                      ; 6D89   0262
        SUBI    #$0008, R2                      ; 6D8A   033A 0008
        MVO@    R2,     R4                      ; 6D8C   0262
        MVO     R2,     .BTAB.BA                ; 6D8D   0242 02BA
        MVO@    R1,     R4                      ; 6D8F   0261
        MVO@    R1,     R4                      ; 6D90   0261
        SUBI    #$00A0, R2                      ; 6D91   033A 00A0
        MVO@    R2,     R4                      ; 6D93   0262
        MVO     R2,     .BTAB.C1                ; 6D94   0242 02C1
        ADDI    #$0008, R2                      ; 6D96   02FA 0008
        MVO@    R2,     R4                      ; 6D98   0262
        CLRR    R4                              ; 6D99   01E4
        CLRR    R2                              ; 6D9A   01D2
L_6D9B:
        MVO@    R2,     R4                      ; 6D9B   0262
        CMPI    #$0008, R4                      ; 6D9C   037C 0008
        BLT     L_6D9B                          ; 6D9E   0225 0004

        JSR     R5,     .EXEC.7B4               ; 6DA0   0004 0114 03B4
.GFX_LIST_6DA3:
        DECLE   $0001,  $0001                   ; 6DA3   0001 0001

        DIS                                     ; 6DA5   0003
        SETC                                    ; 6DA6   0007
        INCR    R7                              ; 6DA7   000F

        SETC                                    ; 6DA8   0007
L_6DA9:
        SAR     R3,     2                       ; 6DA9   006F
        DECLE   $00FF,  $000C,  $0018,  $0030   ; 6DAA   00FF 000C 0018 0030
        DECLE   $0030,  $0030,  $0030,  $0018   ; 6DAE   0030 0030 0030 0018
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6DB2   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB6   0000 0000 0000 0000
        DECLE   $00AA,  $003F,  $0037,  $0037   ; 6DBA   00AA 003F 0037 0037
        DECLE   $003F,  $003E,  $007E,  $007F   ; 6DBE   003F 003E 007E 007F
        DECLE   $00FF,  $001F,  $001B,  $001B   ; 6DC2   00FF 001F 001B 001B
        DECLE   $001F,  $001E,  $001E,  $001F   ; 6DC6   001F 001E 001E 001F
        DECLE   $001F,  $00D5,  $00FF,  $00FF   ; 6DCA   001F 00D5 00FF 00FF
        DECLE   $0055,  $003F,  $001B,  $001B   ; 6DCE   0055 003F 001B 001B
        DECLE   $001F,  $00FF                   ; 6DD2   001F 00FF

        ADDR    R3,     R7                      ; 6DD4   00DF
        ADDR    R3,     R7                      ; 6DD5   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6DD6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F7                   ; 6DDA   00FF 00F7

        TSTR    R0                              ; 6DDC   0080
        TSTR    R0                              ; 6DDD   0080
        ADDR    R5,     R7                      ; 6DDE   00EF

        DECLE   $00F7,  $0080,  $0080,  $00FF   ; 6DDF   00F7 0080 0080 00FF
        DECLE   $00DF,  $0001,  $0001,  $00F7   ; 6DE3   00DF 0001 0001 00F7
        DECLE   $00EF,  $0001,  $0001,  $00FF   ; 6DE7   00EF 0001 0001 00FF
        DECLE   $00F7                           ; 6DEB   00F7

        TSTR    R0                              ; 6DEC   0080
        TSTR    R0                              ; 6DED   0080
        ADDR    R5,     R7                      ; 6DEE   00EF

        DECLE   $00F7                           ; 6DEF   00F7

        TSTR    R0                              ; 6DF0   0080
        TSTR    R0                              ; 6DF1   0080
        ADDR    R5,     R7                      ; 6DF2   00EF
        ADDR    R3,     R7                      ; 6DF3   00DF

        DECLE   $0001,  $0001,  $00F7,  $00EF   ; 6DF4   0001 0001 00F7 00EF
        DECLE   $0001,  $0001,  $00EF,  $001D   ; 6DF8   0001 0001 00EF 001D
        DECLE   $0001,  $0002,  $0000,  $0203   ; 6DFC   0001 0002 0000 0203
        DECLE   $0040,  $0007,  $00C0,  $0081   ; 6E00   0040 0007 00C0 0081
        DECLE   $0040,  $0003,  $00C0,  $0002   ; 6E04   0040 0003 00C0 0002
        DECLE   $0001,  $02A2,  $0313,  $0040   ; 6E08   0001 02A2 0313 0040
        DECLE   $0001,  $0040,  $0001,  $0040   ; 6E0C   0001 0040 0001 0040
        DECLE   $0085,  $0200,  $021D           ; 6E10   0085 0200 021D

        CMPR    R0,     R0                      ; 6E13   0140
        SUB@    R4,     R3                      ; 6E14   0323
        SWAP    R0,     1                       ; 6E15   0040
        ADCR    R5                              ; 6E16   002D
        CMPR    R0,     R0                      ; 6E17   0140
        INCR    R7                              ; 6E18   000F

        ANDR    R0,     R0                      ; 6E19   0180
L_6E1A:
        CMPR    R5,     R2                      ; 6E1A   016A
        CMPR    R5,     R1                      ; 6E1B   0169
        CMPR    R5,     R3                      ; 6E1C   016B
        CMPR    R5,     R1                      ; 6E1D   0169
        CMPR    R5,     R3                      ; 6E1E   016B
        CMPR    R5,     R2                      ; 6E1F   016A
        SUBR    R5,     R3                      ; 6E20   012B
        CMPR    R5,     R3                      ; 6E21   016B
        CMPR    R5,     R2                      ; 6E22   016A
        CMPR    R5,     R0                      ; 6E23   0168
        CMPR    R5,     R3                      ; 6E24   016B
        CMPR    R5,     R3                      ; 6E25   016B
        MVI@    R2,     R0                      ; 6E26   0290
        ANDR    R5,     R5                      ; 6E27   01AD
        ANDR    R5,     R5                      ; 6E28   01AD
        ANDR    R5,     R5                      ; 6E29   01AD
        ANDR    R5,     R5                      ; 6E2A   01AD
        MVI@    R2,     R0                      ; 6E2B   0290
        CMPR    R5,     R3                      ; 6E2C   016B
        CMPR    R5,     R3                      ; 6E2D   016B
        SUBR    R5,     R3                      ; 6E2E   012B
        CMPR    R5,     R3                      ; 6E2F   016B
        MVI@    R5,     R7                      ; 6E30   02AF

        DECLE   $0235                           ; 6E31   0235

        ANDR    R2,     R5                      ; 6E32   0195
        PULR    R1                              ; 6E33   02B1
        BNEQ    L_6BC4                          ; 6E34   022C 0271

        CMPR    R5,     R3                      ; 6E36   016B
        CMPR    R5,     R1                      ; 6E37   0169
        CMPR    R5,     R3                      ; 6E38   016B
        SUBR    R5,     R3                      ; 6E39   012B
        BGT     L_6CAF                          ; 6E3A   022E 018C

        ANDR    R2,     R1                      ; 6E3C   0191
        ANDR    R2,     R1                      ; 6E3D   0191
        PULR    R1                              ; 6E3E   02B1
        MVO@    R4,     R1                      ; 6E3F   024C
        CMPR    R5,     R3                      ; 6E40   016B
        CMPR    R5,     R3                      ; 6E41   016B
        CMPR    R5,     R1                      ; 6E42   0169
        ADDR    R1,     R3                      ; 6E43   00CB
        MOVR    R4,     R5                      ; 6E44   00A5
        MOVR    R4,     R5                      ; 6E45   00A5
        MOVR    R4,     R5                      ; 6E46   00A5
        MOVR    R4,     R5                      ; 6E47   00A5
        MOVR    R4,     R5                      ; 6E48   00A5
        MOVR    R4,     R5                      ; 6E49   00A5
        SUBR    R4,     R7                      ; 6E4A   0127

        DECLE   $016B,  $0060,  $00A4,  $00A5   ; 6E4B   016B 0060 00A4 00A5
        DECLE   $00A5,  $00A5,  $00A5,  $00A5   ; 6E4F   00A5 00A5 00A5 00A5
        DECLE   $00A5,  $0305,  $0017,  $0005   ; 6E53   00A5 0305 0017 0005

        ADCR    R7                              ; 6E57   002F

        SLL     R3,     1                       ; 6E58   004B
L_6E59:
        SAR     R3,     2                       ; 6E59   006F
        MOVR    R0,     R7                      ; 6E5A   0087

        DECLE   $00AA,  $00C5,  $00EA,  $011C   ; 6E5B   00AA 00C5 00EA 011C
        DECLE   $0148,  $0184,  $01C5,  $01EA   ; 6E5F   0148 0184 01C5 01EA
        DECLE   $0244,  $0288,  $0305,  $032A   ; 6E63   0244 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6E67   03CC 0000 0000 0005
        DECLE   $002B,  $004E,  $0078,  $00A8   ; 6E6B   002B 004E 0078 00A8
        DECLE   $00C4,  $00FD,  $011E,  $0148   ; 6E6F   00C4 00FD 011E 0148
        DECLE   $0185,  $01AB,  $01C7,  $01EA   ; 6E73   0185 01AB 01C7 01EA
        DECLE   $0244,  $0288,  $0305,  $032A   ; 6E77   0244 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6E7B   03CC 0000 0000 0005
        DECLE   $002B,  $004E,  $0079,  $009E   ; 6E7F   002B 004E 0079 009E
        DECLE   $00C4,  $00F5,  $011A,  $0148   ; 6E83   00C4 00F5 011A 0148
        DECLE   $0184,  $01BC,  $01E8,  $0245   ; 6E87   0184 01BC 01E8 0245
        DECLE   $026F,  $028A,  $0305,  $032A   ; 6E8B   026F 028A 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0005   ; 6E8F   03CC 0000 0000 0005

        ADCR    R3                              ; 6E93   002B
        SWAP    R3,     2                       ; 6E94   0047
        SAR     R3,     1                       ; 6E95   006B
        MOVR    R0,     R7                      ; 6E96   0087

        DECLE   $00AA,  $00C4,  $010C,  $0148   ; 6E97   00AA 00C4 010C 0148
        DECLE   $0185,  $01AB,  $01C7,  $01EA   ; 6E9B   0185 01AB 01C7 01EA
        DECLE   $0244,  $0288,  $0305,  $032A   ; 6E9F   0244 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000           ; 6EA3   03CC 0000 0000

        COMR    R4                              ; 6EA6   001C
        SLL     R1,     1                       ; 6EA7   0049
        SAR     R3,     2                       ; 6EA8   006F
        MOVR    R0,     R7                      ; 6EA9   0087

        DECLE   $00AA,  $00C5,  $00EE,  $011C   ; 6EAA   00AA 00C5 00EE 011C
        DECLE   $0148,  $0185,  $01AB,  $01C7   ; 6EAE   0148 0185 01AB 01C7
        DECLE   $01EA,  $0244,  $0288,  $0305   ; 6EB2   01EA 0244 0288 0305
        DECLE   $032A,  $03CC,  $0000,  $0000   ; 6EB6   032A 03CC 0000 0000
        DECLE   $0004                           ; 6EBA   0004

        RSWD    R4                              ; 6EBB   003C
        SAR     R1,     2                       ; 6EBC   006D
        MOVR    R1,     R7                      ; 6EBD   008F

        MOVR    R5,     R2                      ; 6EBE   00AA
        ADDR    R0,     R5                      ; 6EBF   00C5
        ADDR    R5,     R7                      ; 6EC0   00EF
        SUBR    R1,     R7                      ; 6EC1   010F
        SUBR    R5,     R7                      ; 6EC2   012F

        DECLE   $014A,  $0185,  $01AB,  $01C7   ; 6EC3   014A 0185 01AB 01C7
        DECLE   $01EA,  $0244,  $0288,  $0305   ; 6EC7   01EA 0244 0288 0305
        DECLE   $032A,  $03CC,  $0000           ; 6ECB   032A 03CC 0000

        DECR    R5                              ; 6ECE   0015
        RSWD    R6                              ; 6ECF   003E
        SLR     R1,     2                       ; 6ED0   0065
        MOVR    R1,     R7                      ; 6ED1   008F

        DECLE   $00AA,  $00D5,  $00FE,  $0125   ; 6ED2   00AA 00D5 00FE 0125
        DECLE   $014A,  $0195,  $01BA,  $01E8   ; 6ED6   014A 0195 01BA 01E8
        DECLE   $025C,  $0288,  $0305,  $032A   ; 6EDA   025C 0288 0305 032A
        DECLE   $03CC,  $0000,  $0000,  $0000   ; 6EDE   03CC 0000 0000 0000
        DECLE   $0005                           ; 6EE2   0005

        ADCR    R3                              ; 6EE3   002B
        SLL     R2,     2                       ; 6EE4   004E
        SARC    R1,     2                       ; 6EE5   007D
        MOVR    R3,     R2                      ; 6EE6   009A
        ADDR    R0,     R4                      ; 6EE7   00C4
        ADDR    R6,     R5                      ; 6EE8   00F5
        SUBR    R3,     R7                      ; 6EE9   011F

        DECLE   $013A,  $0184,  $01B5,  $01DA   ; 6EEA   013A 0184 01B5 01DA
        DECLE   $0244,  $027C,  $0305,  $032A   ; 6EEE   0244 027C 0305 032A
        DECLE   $03CC,  $0000                   ; 6EF2   03CC 0000

        PSHR    R5                              ; 6EF4   0275
L_6EF5:
        SDBD                                    ; 6EF5   0001
        MVII    #$6E1A, R5                      ; 6EF6   02BD 001A 006E
        MVII    #$0214, R4                      ; 6EF9   02BC 0214
L_6EFB:
        MVI@    R5,     R0                      ; 6EFB   02A8
        MOVR    R0,     R1                      ; 6EFC   0081
        ANDI    #$001F, R0                      ; 6EFD   03B8 001F
        XORR    R0,     R1                      ; 6EFF   01C1
        SLR     R1,     2                       ; 6F00   0065
        SLL     R0,     2                       ; 6F01   004C
        SLL     R0,     1                       ; 6F02   0048
        MVII    #$0001, R2                      ; 6F03   02BA 0001
L_6F05:
        SDBD                                    ; 6F05   0001
        MVII    #$0A03, R3                      ; 6F06   02BB 0003 000A
        CMPI    #$00B0, R0                      ; 6F09   0378 00B0
        BGE     L_6F3C                          ; 6F0B   020D 002F

        CMPI    #$0028, R0                      ; 6F0D   0378 0028
        BLE     L_6F3C                          ; 6F0F   0206 002B

        SDBD                                    ; 6F11   0001
        MVII    #$0803, R3                      ; 6F12   02BB 0003 0008
        PSHR    R3                              ; 6F15   0273
        MVI     G_015E, R3                      ; 6F16   0283 015E
        CMPI    #$0003, R3                      ; 6F18   037B 0003
        PULR    R3                              ; 6F1A   02B3
        BNEQ    L_6F21                          ; 6F1B   020C 0004

        SDBD                                    ; 6F1D   0001
        MVII    #$2C03, R3                      ; 6F1E   02BB 0003 002C
L_6F21:
        CMPI    #$0038, R0                      ; 6F21   0378 0038
        BLE     L_6F3C                          ; 6F23   0206 0017

        ADDI    #$0003, R3                      ; 6F25   02FB 0003
        CMPI    #$0058, R0                      ; 6F27   0378 0058
        BLE     L_6F3C                          ; 6F29   0206 0011

        MVI     G_0139, R3                      ; 6F2B   0283 0139
        ADDR    R7,     R3                      ; 6F2D   00FB
L_6F2E:
        ADDI    #$0093, R3                      ; 6F2E   02FB 0093
        MVI@    R3,     R3                      ; 6F30   029B
        SWAP    R3,     1                       ; 6F31   0043
        PSHR    R0                              ; 6F32   0270
        MVI     G_015E, R0                      ; 6F33   0280 015E
        CMPI    #$0003, R0                      ; 6F35   0378 0003
        BNEQ    L_6F3B                          ; 6F37   020C 0002

        XORI    #$0006, R3                      ; 6F39   03FB 0006
L_6F3B:
        PULR    R0                              ; 6F3B   02B0
L_6F3C:
        XORR    R0,     R3                      ; 6F3C   01C3
        MVO@    R3,     R4                      ; 6F3D   0263
        MOVR    R1,     R0                      ; 6F3E   0088
        DECR    R2                              ; 6F3F   0012
        BEQ     L_6F05                          ; 6F40   0224 003C

        CMPI    #$028C, R4                      ; 6F42   037C 028C
        BLT     L_6EFB                          ; 6F44   0225 004A

        MVII    #$0027, R0                      ; 6F46   02B8 0027
        SDBD                                    ; 6F48   0001
        MVII    #$0A0B, R1                      ; 6F49   02B9 000B 000A
        MVO@    R1,     R4                      ; 6F4C   0261
        ADDI    #$0020, R1                      ; 6F4D   02F9 0020

        JSR     R5,     X_FILL_MEM              ; 6F4F   0004 0114 0341

        SUBI    #$0018, R1                      ; 6F52   0339 0018
        MVO     R1,     .BTAB.9F                ; 6F54   0241 029F
        CLRR    R2                              ; 6F56   01D2

L_6F57:
        JSR     R5,     L_6FD9                  ; 6F57   0004 016C 03D9

        ANDI    #$000F, R3                      ; 6F5A   03BB 000F
        BEQ     L_6F8D                          ; 6F5C   0204 002F

        ADDR    R7,     R1                      ; 6F5E   00F9
        ADDI    #$005E, R1                      ; 6F5F   02F9 005E
        MVI@    R1,     R1                      ; 6F61   0289
        SWAP    R1,     1                       ; 6F62   0041
        ADDI    #$0003, R1                      ; 6F63   02F9 0003
        MOVR    R2,     R0                      ; 6F65   0090
        MOVR    R2,     R4                      ; 6F66   0094
        ADDI    #$0268, R4                      ; 6F67   02FC 0268
L_6F69:
        SUBI    #$000B, R0                      ; 6F69   0338 000B
        BMI     L_6F71                          ; 6F6B   020B 0004

        ADDI    #$0009, R4                      ; 6F6D   02FC 0009
        B       L_6F69                          ; 6F6F   0220 0007

L_6F71:
        PSHR    R1                              ; 6F71   0271
        MVI     G_0139, R1                      ; 6F72   0281 0139
        ADDR    R7,     R1                      ; 6F74   00F9
        ADDI    #$0050, R1                      ; 6F75   02F9 0050
        SUB@    R1,     R4                      ; 6F77   030C
        PULR    R1                              ; 6F78   02B1
        CMPI    #$0268, R4                      ; 6F79   037C 0268
        BLT     L_6F8D                          ; 6F7B   0205 0010

        ADDI    #$00C8, R1                      ; 6F7D   02F9 00C8
        MOVR    R3,     R0                      ; 6F7F   0098
        SLL     R0,     1                       ; 6F80   0048
        ANDI    #$0010, R0                      ; 6F81   03B8 0010
        ADDR    R1,     R0                      ; 6F83   00C8
        MVO@    R0,     R4                      ; 6F84   0260
        ADDI    #$0008, R1                      ; 6F85   02F9 0008
        SLL     R3,     2                       ; 6F87   004F
        ANDI    #$0010, R3                      ; 6F88   03BB 0010
        ADDR    R3,     R1                      ; 6F8A   00D9
        MVO@    R1,     R4                      ; 6F8B   0261
        INCR    R2                              ; 6F8C   000A
L_6F8D:
        INCR    R2                              ; 6F8D   000A
L_6F8E:
        CMPI    #$003C, R2                      ; 6F8E   037A 003C
        BLE     L_6F57                          ; 6F90   0226 003A

        SDBD                                    ; 6F92   0001
        MVII    #$5CD5, R2                      ; 6F93   02BA 00D5 005C
        SDBD                                    ; 6F96   0001
        MVII    #$1027, R1                      ; 6F97   02B9 0027 0010
        MVII    #$031D, R4                      ; 6F9A   02BC 031D
        MVO@    R1,     R4                      ; 6F9C   0261
        MVO@    R2,     R4                      ; 6F9D   0262
        CLRR    R0                              ; 6F9E   01C0
        MVO@    R0,     R4                      ; 6F9F   0260
        MVO@    R0,     R4                      ; 6FA0   0260
        MVO@    R0,     R4                      ; 6FA1   0260
        MVO@    R0,     R4                      ; 6FA2   0260
        ADDI    #$0002, R4                      ; 6FA3   02FC 0002
        XORI    #$0021, R1                      ; 6FA5   03F9 0021
        MVO@    R1,     R4                      ; 6FA7   0261
        MVO@    R2,     R4                      ; 6FA8   0262
        MVII    #$0054, R3                      ; 6FA9   02BB 0054
        SWAP    R3,     1                       ; 6FAB   0043
        MVO@    R3,     R4                      ; 6FAC   0263
        MVI     G_0139, R3                      ; 6FAD   0283 0139
        SLL     R3,     2                       ; 6FAF   004F
        BNEQ    L_6FB4                          ; 6FB0   020C 0002

        MVII    #$0002, R3                      ; 6FB2   02BB 0002
L_6FB4:
        SLL     R3,     2                       ; 6FB4   004F
        ADDI    #$002C, R3                      ; 6FB5   02FB 002C
        SWAP    R3,     1                       ; 6FB7   0043
        MVO@    R3,     R4                      ; 6FB8   0263
        MVO@    R0,     R4                      ; 6FB9   0260
        INCR    R0                              ; 6FBA   0008
        MVO@    R0,     R4                      ; 6FBB   0260
        PULR    R7                              ; 6FBC   02B7

        DECLE   $001E,  $001E,  $000A,  $0028   ; 6FBD   001E 001E 000A 0028
        DECLE   $001A,  $000A,  $0028,  $001E   ; 6FC1   001A 000A 0028 001E
        DECLE   $0064,  $0050,  $0028,  $0000   ; 6FC5   0064 0050 0028 0000
L_6FC9:
        MVI     G_0185, R1                      ; 6FC9   0281 0185
        SLR     R1,     1                       ; 6FCB   0061
        MOVR    R1,     R2                      ; 6FCC   008A
        SLL     R1,     1                       ; 6FCD   0049
        ADDR    R1,     R2                      ; 6FCE   00CA
        SLL     R1,     2                       ; 6FCF   004D
        ADDR    R1,     R2                      ; 6FD0   00CA
        ADD     G_015F, R2                      ; 6FD1   02C2 015F
        MVI     G_0139, R1                      ; 6FD3   0281 0139
        ADDR    R7,     R1                      ; 6FD5   00F9
        ADDI    #$0026, R1                      ; 6FD6   02F9 0026
        ADD@    R1,     R2                      ; 6FD8   02CA
L_6FD9:
        PSHR    R5                              ; 6FD9   0275
        CLRR    R3                              ; 6FDA   01DB
        CMPI    #$003D, R2                      ; 6FDB   037A 003D
        BGE     L_6FF3                          ; 6FDD   020D 0014

        MVI     G_033C, R5                      ; 6FDF   0285 033C
        ANDI    #$001C, R5                      ; 6FE1   03BD 001C
        MOVR    R5,     R1                      ; 6FE3   00A9
        SLL     R1,     2                       ; 6FE4   004D
        ADDR    R1,     R5                      ; 6FE5   00CD
        SDBD                                    ; 6FE6   0001
        ADDI    #$6E56, R5                      ; 6FE7   02FD 0056 006E
L_6FEA:
        MVI@    R5,     R3                      ; 6FEA   02AB
        MOVR    R3,     R1                      ; 6FEB   0099
        BEQ     L_6FF3                          ; 6FEC   0204 0005

        SLR     R1,     2                       ; 6FEE   0065
        SLR     R1,     2                       ; 6FEF   0065
        CMPR    R1,     R2                      ; 6FF0   014A
        BNEQ    L_6FEA                          ; 6FF1   022C 0008

L_6FF3:
        MVI     G_033C, R1                      ; 6FF3   0281 033C
        XORR    R2,     R1                      ; 6FF5   01D1
        ADD     G_033C, R1                      ; 6FF6   02C1 033C
        SLR     R1,     2                       ; 6FF8   0065
        ANDI    #$0003, R1                      ; 6FF9   03B9 0003
        PULR    R7                              ; 6FFB   02B7

        DECLE   $0037                           ; 6FFC   0037

        ADCR    R4                              ; 6FFD   002C
        DECR    R6                              ; 6FFE   0016
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5038       <entry>
;;  $505C       $503D  
;;  $507E       <entry>
;;  $50B9       $50CA  
;;  $50CC       $50C6  
;;  $50DC       <entry> $64C3  
;;  $5119       $50FF   $5105  
;;  $511C       $51C9  
;;  $511F       $67A0  
;;  $5127       $68B9   $6D70  
;;  $512D       $50F4  
;;  $5139       $698B  
;;  $5151       $513D   $5143   $5149  
;;  $5157       $50EE  
;;  $5177       $5163  
;;  $5192       $518B  
;;  $51B4       $51AA  
;;  $51BE       $51B2  
;;  $51C6       $51A8  
;;  $51CF       $5131  
;;  $51E4       $51DE   $68DF  
;;  $51F6       $5218  
;;  $51F7       $51F5  
;;  $5208       $5201  
;;  $5213       $5215  
;;  $521A       $50E4   $512D   $5137   $5147   $514F   $517D  
;;  $521B       $5127   $51D1   $68D2  
;;  $521E       $515D  
;;  $5225       $51F0   $521F  
;;  $5227       $6B5A  
;;  $522A       $5257  
;;  $5248       $523C  
;;  $5249       $5251  
;;  $525A       $5558   $6D46   $6D59  
;;  $526A       $526A  
;;  $5288       $5282   $528F  
;;  $528A       $5286  
;;  $5293       $5294  
;;  $5296       $5276  
;;  $5298       $524B  
;;  $52A3       $529E  
;;  $52AC       $52A8  
;;  $52E5       $52D7  
;;  $52F5       $52E9   $52F0  
;;  $52FB       $52F7  
;;  $5307       $52FD   $5303  
;;  $5328       $5322  
;;  $532E       $5326  
;;  $5332       $532C  
;;  $533C       $5336  
;;  $534E       $5342  
;;  $5356       $5349   $5352  
;;  $536E       $5361  
;;  $537E       $5372  
;;  $5386       $5369   $5379   $5382  
;;  $539E       $5391  
;;  $53A8       $53A2  
;;  $53B4       $53AE  
;;  $53BC       $5399   $53B8  
;;  $53C9       $53C3  
;;  $53D4       $53CD  
;;  $53DE       $53D8  
;;  $53E7       $53E4  
;;  $53FC       $53EE  
;;  $5406       $5400  
;;  $5411       $53F7   $540C  
;;  $542A       $541C  
;;  $5434       $542E  
;;  $543C       $5439  
;;  $5447       $5442  
;;  $544F       $5423   $544B  
;;  $5461       $545A  
;;  $546B       $5465  
;;  $547D       $5471  
;;  $5485       $5478   $5481  
;;  $5494       $548E  
;;  $54A5       $5498  
;;  $54B5       $54A9  
;;  $54BD       $54A0   $54B0   $54B9  
;;  $54C8       $54C2  
;;  $54D4       $54CD  
;;  $54DF       $54D8  
;;  $54EA       $54D2   $54DD   $54E3  
;;  $54EC       $54E8  
;;  $54F5       $54F0  
;;  $54FE       $54F9  
;;  $5508       $5504  
;;  $551E       $550F  
;;  $552E       $5522  
;;  $553A       $5533  
;;  $5541       $5538   $553E  
;;  $554D       $5518   $5529   $5547  
;;  $554F       $5222  
;;  $555C       $520C   $6B65  
;;  $555D       $555B   $5589  
;;  $5570       $5582  
;;  $5584       $55CE  
;;  $558C       $5568  
;;  $5597       $5593  
;;  $559E       $55CC  
;;  $55AA       $55C9  
;;  $55B5       $55B2  
;;  $55BF       $55B9  
;;  $5608       $522D  
;;  $5620       $5649  
;;  $5627       $5622  
;;  $5628       $561E  
;;  $5631       $5635  
;;  $5637       $5632  
;;  $5644       $563A  
;;  $564C       $562B   $5683  
;;  $5657       $5654  
;;  $565F       $565B  
;;  $5665       $5661  
;;  $566D       $5669  
;;  $56A9       $566E  
;;  $56B3       $56AF  
;;  $56B9       $56B5  
;;  $56C4       $56C1  
;;  $56CB       $56C7  
;;  $56D2       $56CF  
;;  $56D9       $56D5  
;;  $56E1       $56DC  
;;  $56E9       $56E4  
;;  $5715       $5711  
;;  $571B       $5717  
;;  $571C       $5659   $5667   $5679   $568B  
;;  $5857       $512A   $5174   $51E1   $68E2  
;;  $5865       $5870  
;;  $5868       $5863  
;;  $5883       $5869   $64DA   $67C8   $6A4F  
;;  $5884       $5882  
;;  $5888       $588E  
;;  $5896       $589A  
;;  $58A5       $589D  
;;  $58AE       $58A6  
;;  $58B1       $5889  
;;  $58B3       $5897  
;;  $58BA       $58A3   $58AC  
;;  $58DA       $58D6  
;;  $58E5       $590D  
;;  $58FF       $58EB  
;;  $5901       $5908  
;;  $5913       $511C  
;;  $5914       $50D9  
;;  $592A       $591C   $5927  
;;  $592C       $5943  
;;  $593E       $5931  
;;  $5945       $5957   $5960   $5968  
;;  $595B       $5962  
;;  $5964       $595D  
;;  $5972       $59A8   $59B1  
;;  $598D       $5981  
;;  $599C       $5990  
;;  $599D       $597B   $5985   $598B   $598E   $599A  
;;  $59BB       $59D0   $59DB   $59E3  
;;  $59D2       $59CD  
;;  $59ED       $59E9  
;;  $59F5       $59EF  
;;  $5B9E       $5B9C  
;;  $5BAE       $5BAC  
;;  $5BF9       $5BF7  
;;  $5C61       $5C5F  
;;  $5C70       $5C6E  
;;  $5C8A       $5C88  
;;  $5CB2       $67EB  
;;  $5CB7       $67E6   $6A9E  
;;  $5D39       $5D39  
;;  $5D49       $5D49  
;;  $5D81       $5D7F  
;;  $5D85       $5D83  
;;  $5D96       $5D94  
;;  $5D9E       $5D9C  
;;  $5DC5       $5DC3  
;;  $5E2C       $5E2A  
;;  $5E66       $5E64  
;;  $5E97       $5E95  
;;  $5E9C       $5E9A  
;;  $5E9D       $5E9B  
;;  $5EBD       $5EBB  
;;  $6118       $6CDB  
;;  $6123       $61BA  
;;  $6169       $6165  
;;  $617B       $6177  
;;  $6185       $617D   $6181  
;;  $6198       $6194  
;;  $61AA       $619C  
;;  $61AC       $6187  
;;  $61B4       $6125   $61F3   $61FB   $626F   $62AE  
;;  $61C2       $61D1  
;;  $61D3       $61B6  
;;  $61E9       $6129  
;;  $61F5       $61ED  
;;  $6247       $6241  
;;  $6249       $6245  
;;  $624B       $625A   $626A  
;;  $624D       $623B   $6264  
;;  $624F       $6229   $622E   $624B  
;;  $6252       $623F  
;;  $6256       $623D  
;;  $6258       $6254  
;;  $625C       $6237  
;;  $6260       $6239  
;;  $6266       $6235  
;;  $6268       $625E  
;;  $626C       $6250  
;;  $6297       $6291  
;;  $62A9       $62A5  
;;  $6348       $635E   $6370   $6384  
;;  $6349       $638E   $639C   $6708   $68EB   $691B   $6AF5  
;;  $6352       $611D   $6D3B  
;;  $6353       $61D3  
;;  $6364       $6358   $635C  
;;  $6378       $636A   $636E  
;;  $6388       $637E   $6382  
;;  $638A       $6394  
;;  $6392       $638C  
;;  $639F       $639A  
;;  $63C9       $63BF   $63C3  
;;  $63E7       $63E1  
;;  $641A       $640A   $6414  
;;  $642E       $645B  
;;  $6445       $6435   $643B   $643E  
;;  $6455       $6431   $6443  
;;  $646B       <entry>
;;  $6482       $647A  
;;  $6491       $6486   $648A  
;;  $64A8       $649B   $64A2  
;;  $64B9       $648F   $64A6  
;;  $64C9       $6474   $6480   $6497   $64AC   $64B3   $64B7  
;;  $64CA       $649F   $64B0  
;;  $64E0       $64BD   $6546  
;;  $64FA       $64F6  
;;  $64FE       $6504  
;;  $6506       $6501  
;;  $6512       $6518  
;;  $651A       $6515  
;;  $6521       $6AB1  
;;  $653D       $6535  
;;  $6549       $6541  
;;  $6561       $6557  
;;  $656C       $6567  
;;  $6585       $6576  
;;  $658F       $6583  
;;  $6591       $6581   $658D  
;;  $6593       $6587   $658B  
;;  $659B       $6597  
;;  $65BC       $65B6  
;;  $65C6       $65BA   $65BE  
;;  $65E4       $65CE   $65D6   $65DE  
;;  $6600       $66F4  
;;  $6612       $660C  
;;  $6617       $6604   $6656   $665C   $665F   $6664   $6670  
;;  $6618       $6525   $6529   $6531   $653B   $654A   $6553   $655B   $655F  
;;  $6618       $657B  
;;  $661B       $656C  
;;  $662F       $6632  
;;  $6636       $6623  
;;  $663B       $663E  
;;  $6640       $6628   $662C   $6634   $6638  
;;  $6648       $6645  
;;  $6651       $6641   $664C  
;;  $669B       $6690  
;;  $66A1       $668C   $6699  
;;  $66A3       $668A   $6697   $669F  
;;  $66DD       $66CF   $66D7  
;;  $6702       $6700  
;;  $6715       $670E  
;;  $6732       $672F  
;;  $6741       $673E  
;;  $6749       $6746  
;;  $674B       $6757  
;;  $675A       $6CDE  
;;  $6764       $675D  
;;  $67A3       $6762  
;;  $67B1       $67A6   $67AA  
;;  $67BB       $67B4  
;;  $67D3       $67CF  
;;  $67E6       $67DE   $67E2  
;;  $67EE       $67B9   $67BD  
;;  $67EF       $6774   $677E  
;;  $67F6       $6AE9  
;;  $6848       $681C  
;;  $684F       $6814   $6878   $687D  
;;  $6850       $681E  
;;  $6857       $685B  
;;  $685E       $6824  
;;  $6865       $68A6  
;;  $6866       $6828   $6891  
;;  $686A       $6832  
;;  $687A       $6875  
;;  $6887       $6884  
;;  $688F       $688C  
;;  $6893       $6818  
;;  $689F       $6897  
;;  $68BC       $682A  
;;  $68CF       $6836  
;;  $68D0       $6845  
;;  $68E5       $6822  
;;  $6918       $68F8  
;;  $6923       $691F  
;;  $6925       $6912  
;;  $6944       $6938  
;;  $6952       $694F  
;;  $695F       $6910  
;;  $6972       $690E  
;;  $698E       $690C  
;;  $6998       $69A8  
;;  $699E       $690A  
;;  $69A8       $69A4  
;;  $69AA       $6908  
;;  $69B4       $69B0  
;;  $69BA       $6906  
;;  $69BE       $6904  
;;  $69C0       $69BC  
;;  $69D8       $6902  
;;  $69E0       $699C   $69B8   $69D6  
;;  $69E9       $6916   $6923   $6AAF  
;;  $69ED       $6900  
;;  $6A0B       $6A27   $6A44   $6A49   $6B12  
;;  $6A18       $6A14  
;;  $6A2A       $6A1B   $6A1F  
;;  $6A43       $6A3F  
;;  $6A4D       $695D   $6AD0   $6AF3   $6AFF  
;;  $6A57       $6A5E  
;;  $6A61       $6A59  
;;  $6A64       $6A53  
;;  $6A83       $6A80  
;;  $6AA1       $6934   $693C   $6940   $694B   $69FA   $69FE   $6A02   $6A09  
;;  $6AA1       $6A69   $6B19  
;;  $6AA2       $68F0  
;;  $6AAF       $6AAC  
;;  $6AB1       $6826  
;;  $6AB4       $681A  
;;  $6ACC       $6AC8  
;;  $6AD2       $6ABD  
;;  $6AEC       $6AB7   $6AD4   $6ADC  
;;  $6AF5       $6AD8  
;;  $6B01       $6820  
;;  $6B14       $6B0A   $6B0E  
;;  $6B25       $6B21  
;;  $6B29       $6B41  
;;  $6B70       $6B7A  
;;  $6B7D       $686A   $68C0   $68C6   $68E8   $68F4   $68FC   $6929   $6930  
;;  $6B7D       $6983   $6989   $69C6   $69F1   $6ABB   $6AE0   $6B05   $6B85  
;;  $6B94       $68CD   $6B88  
;;  $6BA1       $6B9D  
;;  $6BB6       $6BAD   $6BBF  
;;  $6BB7       $6BAF  
;;  $6BC1       $6BB4  
;;  $6BC3       $6BA2   $6BA5  
;;  $6BC4       $51C6   $695A   $6972   $69E0   $6E34  
;;  $6BC5       $696F  
;;  $6BD7       $67AE  
;;  $6BE7       $64C0  
;;  $6C10       <entry>
;;  $6C16       $6BA7  
;;  $6C27       $67EF  
;;  $6C3E       $678D  
;;  $6C4E       $6AE2  
;;  $6C5F       $6A89  
;;  $6C74       $674F  
;;  $6C86       $50D6   $5119  
;;  $6C97       $6C95  
;;  $6CAF       $6E3A  
;;  $6CBF       $6C2D  
;;  $6CC5       $6CC5  
;;  $6CC8       $6618   $6B7D  
;;  $6CD5       <entry> $50B6  
;;  $6CE1       $6CD9  
;;  $6CF4       $6CE6  
;;  $6D0F       $6CFF  
;;  $6D28       $6D24  
;;  $6D31       $6D29  
;;  $6D3B       $6D35  
;;  $6D3F       $6CE2  
;;  $6D59       $6D44  
;;  $6D73       $6D53   $6D6D  
;;  $6D9B       $6D9E  
;;  $6DA9       $6DA7  
;;  $6E1A       $6E18  
;;  $6E59       $6E57  
;;  $6EF5       $6D56  
;;  $6EFB       $6F44  
;;  $6F05       $6F40  
;;  $6F21       $6F1B  
;;  $6F2E       $6C7F  
;;  $6F3B       $6F37  
;;  $6F3C       $6F0B   $6F0F   $6F23   $6F29  
;;  $6F57       $6F90  
;;  $6F69       $6F6F  
;;  $6F71       $6F6B  
;;  $6F8D       $6F5C   $6F7B  
;;  $6F8E       $6CA8  
;;  $6FB4       $6FB0  
;;  $6FC9       $5101   $58B3   $5916  
;;  $6FD9       $6F57  
;;  $6FEA       $6FF1  
;;  $6FF3       $6FDD   $6FEC  
;; ======================================================================== ;;
