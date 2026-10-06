
        ORG     $5000
.HEADER:
        BIDECLE $6B0A           ; 5000  Ptr: MOB graphic images
        BIDECLE $50BF           ; 5002  Ptr: EXEC timer table
        BIDECLE $5156           ; 5004  Ptr: Start of game
        BIDECLE $6B0A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $50D1           ; 5008  Ptr: GRAM init sequence
        BIDECLE $50CD           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $000E,  $000A   ; 500F  Color Stack init (0, 1)
        DECLE   $000F,  $0009   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0170,  $0180,  $0190,  $01A0   ; 5014   0170 0180 0190 01A0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
        DECLE   $00DD,  $005D,  $0000,  $0000   ; 501C   00DD 005D 0000 0000
        DECLE   $0000,  $001C,  $0000,  $00DD   ; 5020   0000 001C 0000 00DD
        DECLE   $005D,  $0000,  $0000,  $0000   ; 5024   005D 0000 0000 0000
        DECLE   $001E,  $0000,  $00B3,  $005D   ; 5028   001E 0000 00B3 005D
        DECLE   $0000,  $0000,  $0000,  $0024   ; 502C   0000 0000 0000 0024
        DECLE   $0002,  $0083,  $015D,  $00B3   ; 5030   0002 0083 015D 00B3
        DECLE   $005D,  $0000,  $0000,  $0000   ; 5034   005D 0000 0000 0000
        DECLE   $0026,  $0002,  $0083,  $015D   ; 5038   0026 0002 0083 015D
        DECLE   $000E,  $005E,  $0000,  $0000   ; 503C   000E 005E 0000 0000
        DECLE   $0000,  $0020,  $0002,  $0037   ; 5040   0000 0020 0002 0037
        DECLE   $015D,  $0000,  $0000,  $0000   ; 5044   015D 0000 0000 0000
        DECLE   $0000,  $0000,  $0016,  $0002   ; 5048   0000 0000 0016 0002
        DECLE   $0037,  $015D,  $0000,  $0000   ; 504C   0037 015D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5050   0000 0000 0000 0028
        DECLE   $0002,  $0083,  $015D,  $00DD   ; 5054   0002 0083 015D 00DD
        DECLE   $005D,  $0000,  $0000,  $0000   ; 5058   005D 0000 0000 0000
        DECLE   $002A,  $0000,  $00DD,  $005D   ; 505C   002A 0000 00DD 005D
        DECLE   $0000,  $0000,  $0000,  $002C   ; 5060   0000 0000 0000 002C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5064   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0036,  $0002   ; 5068   0000 0000 0036 0002
        DECLE   $0027,  $015D,  $002A,  $005E   ; 506C   0027 015D 002A 005E
        DECLE   $0000,  $0000,  $0000,  $0036   ; 5070   0000 0000 0000 0036
        DECLE   $0002,  $0027,  $015D,  $003F   ; 5074   0002 0027 015D 003F
        DECLE   $005E,  $0000,  $0000,  $0000   ; 5078   005E 0000 0000 0000
        DECLE   $0036,  $0002,  $0027,  $015D   ; 507C   0036 0002 0027 015D
        DECLE   $0054,  $005E,  $0000,  $0000   ; 5080   0054 005E 0000 0000
        DECLE   $0000,  $0036,  $0002,  $0027   ; 5084   0000 0036 0002 0027
        DECLE   $015D,  $0054,  $005E,  $0000   ; 5088   015D 0054 005E 0000
        DECLE   $0000,  $0000,  $0036,  $0002   ; 508C   0000 0000 0036 0002
        DECLE   $005F,  $015D,  $0000,  $0000   ; 5090   005F 015D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $002E   ; 5094   0000 0000 0000 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5098   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 509C   0000 0000 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A0   0000 0000 0000 0000
        DECLE   $0000,  $0032,  $0000,  $0000   ; 50A4   0000 0032 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A8   0000 0000 0000 0000
        DECLE   $0034,  $0000,  $0000,  $0000   ; 50AC   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0015   ; 50B0   0000 0000 0000 0015
        DECLE   $0000,  $0058,  $0057,  $0000   ; 50B4   0000 0058 0057 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 50BC   0000 0000 0000
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0000; 50BF  Timer dispatch/interval
        DECLE   $0084,  $0067,  $0002,  $0000; 50C3  Timer dispatch/interval
        DECLE   $0044,  $0068,  $000D,  $0000; 50C7  Timer dispatch/interval
        BIDECLE $0000           ; 50CB  End of timer table

.TITLE:
        DECLE   $0052                           ; 50CD  Cartridge year
        DECLE   $0000                           ; 50CE  

.TITLECODE:
        B       L_50ED                          ; 50CF   0200 001C

.GRAM_INIT_50D1:
        DECLE   $001B           ; 50D1  # of GRAM cards to init
        DECLE   $0000           ; 50D2  #00   :  CART #00    ----
        DECLE   $0002           ; 50D3  #01   :  CART #01    ----
        DECLE   $0004           ; 50D4  #02   :  CART #02    ----
        DECLE   $0006           ; 50D5  #03   :  CART #03    ----
        DECLE   $0008           ; 50D6  #04   :  CART #04    ----
        DECLE   $000A           ; 50D7  #05   :  CART #05    ----
        DECLE   $000C           ; 50D8  #06   :  CART #06    ----
        DECLE   $000E           ; 50D9  #07   :  CART #07    ----
        DECLE   $0010           ; 50DA  #08   :  CART #08    ----
        DECLE   $0012           ; 50DB  #09   :  CART #09    ----
        DECLE   $0094           ; 50DC  #0A   :  CART #0A    --I-
        DECLE   $0016           ; 50DD  #0B   :  CART #0B    ----
        DECLE   $0018           ; 50DE  #0C   :  CART #0C    ----
        DECLE   $001A           ; 50DF  #0D   :  CART #0D    ----
        DECLE   $001C           ; 50E0  #0E   :  CART #0E    ----
        DECLE   $001E           ; 50E1  #0F   :  CART #0F    ----
        DECLE   $0020           ; 50E2  #10   :  CART #10    ----
        DECLE   $0022           ; 50E3  #11   :  CART #11    ----
        DECLE   $0024           ; 50E4  #12   :  CART #12    ----
        DECLE   $0026           ; 50E5  #13   :  CART #13    ----
        DECLE   $0028           ; 50E6  #14   :  CART #14    ----
        DECLE   $002A           ; 50E7  #15   :  CART #15    ----
        DECLE   $002C           ; 50E8  #16   :  CART #16    ----
        DECLE   $002E           ; 50E9  #17   :  CART #17    ----
        DECLE   $0030           ; 50EA  #18   :  CART #18    ----
        DECLE   $0032           ; 50EB  #19   :  CART #19    ----
        DECLE   $0034           ; 50EC  #1A   :  CART #1A    ----

L_50ED:
        PSHR    R5                              ; 50ED   0275
        MVII    #$000B, R0                      ; 50EE   02B8 000B
        MVO     R0,     .STIC.BORD              ; 50F0   0240 002C
        MVII    #$00F0, R0                      ; 50F2   02B8 00F0
        MVII    #$0200, R4                      ; 50F4   02BC 0200
        MVII    #$0003, R1                      ; 50F6   02B9 0003

        JSR     R5,     X_FILL_MEM              ; 50F8   0004 0114 0341

        MVII    #$0007, R3                      ; 50FB   02BB 0007
        MVII    #$0203, R4                      ; 50FD   02BC 0203

        JSR     R5,     X_PRINT_R5              ; 50FF   0004 0118 007B
        STRING  "PARKER BROTHERS"               ; 5102  
        DECLE   $0000                           ; 5111   0000

        MVII    #$021A, R4                      ; 5112   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 5114   0004 0118 007B
        STRING  "PRESENTS"                      ; 5117  
        DECLE   $0000                           ; 511F   0000

        MVII    #$0255, R4                      ; 5120   02BC 0255

        JSR     R5,     X_PRINT_R5              ; 5122   0004 0118 007B
        STRING  "GOTTLIEB"                      ; 5125  
        DECLE   $0000                           ; 512D   0000

        MVII    #$025D, R4                      ; 512E   02BC 025D
        MVII    #$003F, R0                      ; 5130   02B8 003F
        MVO@    R0,     R4                      ; 5132   0260
        MVII    #$019F, R0                      ; 5133   02B8 019F
        MVO@    R0,     R4                      ; 5135   0260
        MVII    #$0293, R4                      ; 5136   02BC 0293
        MVII    #$018F, R0                      ; 5138   02B8 018F
        MVO@    R0,     R4                      ; 513A   0260
        MVII    #$0057, R0                      ; 513B   02B8 0057
        MVO@    R0,     R4                      ; 513D   0260

        JSR     R5,     X_PRINT_R5              ; 513E   0004 0118 007B
        STRING  "BERT"                          ; 5141   0042 0045 0052 0054
        DECLE   $0000                           ; 5145   0000

        MVII    #$02E1, R4                      ; 5146   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; 5148   0004 0118 007B
        STRING  "COPR 1983"                     ; 514B  
        DECLE   $0000                           ; 5154   0000

        PULR    R7                              ; 5155   02B7

.START:
        PSHR    R5                              ; 5156   0275
        MVI     G_0103, R0                      ; 5157   0280 0103
        MVO     R0,     G_01E0                  ; 5159   0240 01E0
        MVII    #$0003, R0                      ; 515B   02B8 0003
        MVO     R0,     G_0103                  ; 515D   0240 0103
        MVII    #$00F0, R0                      ; 515F   02B8 00F0
        MVII    #$0200, R4                      ; 5161   02BC 0200
        SDBD                                    ; 5163   0001
        MVII    #$0800, R1                      ; 5164   02B9 0000 0008

        JSR     R5,     X_FILL_MEM              ; 5167   0004 0114 0341

        MVII    #$0001, R0                      ; 516A   02B8 0001
        MVO     R0,     G_0147                  ; 516C   0240 0147
        MVII    #$0008, R0                      ; 516E   02B8 0008
        MVO     R0,     G_0104                  ; 5170   0240 0104
        SDBD                                    ; 5172   0001
        MVII    #$50B5, R0                      ; 5173   02B8 00B5 0050
        MVO     R0,     G_035D                  ; 5176   0240 035D
        SDBD                                    ; 5178   0001
        MVII    #$5F28, R0                      ; 5179   02B8 0028 005F
        MVO     R0,     G_0143                  ; 517C   0240 0143
        SWAP    R0,     1                       ; 517E   0040
        MVO     R0,     G_0144                  ; 517F   0240 0144
        CLRR    R0                              ; 5181   01C0
        MVO     R0,     G_01BC                  ; 5182   0240 01BC
        MVI     G_01E0, R0                      ; 5184   0280 01E0
        CMPI    #$0005, R0                      ; 5186   0378 0005
        BNEQ    L_5197                          ; 5188   020C 000D

        MVII    #$0032, R0                      ; 518A   02B8 0032
        MVO     R0,     G_01EF                  ; 518C   0240 01EF
        MVII    #$0223, R4                      ; 518E   02BC 0223
        SDBD                                    ; 5190   0001
        MVII    #$0882, R2                      ; 5191   02BA 0082 0008

        JSR     R5,     L_51DD                  ; 5194   0004 0150 01DD

L_5197:
        CLRR    R0                              ; 5197   01C0
        MVO     R0,     G_01EF                  ; 5198   0240 01EF
        MVII    #$0214, R4                      ; 519A   02BC 0214
        SDBD                                    ; 519C   0001
        MVII    #$087A, R2                      ; 519D   02BA 007A 0008

        JSR     R5,     L_51DD                  ; 51A0   0004 0150 01DD

        MVII    #$023A, R4                      ; 51A3   02BC 023A
        SDBD                                    ; 51A5   0001
        MVII    #$088D, R0                      ; 51A6   02B8 008D 0008
        MVO@    R0,     R4                      ; 51A9   0260
        MVII    #$024E, R4                      ; 51AA   02BC 024E
        SDBD                                    ; 51AC   0001
        MVII    #$0895, R0                      ; 51AD   02B8 0095 0008
        MVO@    R0,     R4                      ; 51B0   0260
        MVII    #$023C, R4                      ; 51B1   02BC 023C
        SDBD                                    ; 51B3   0001
        MVII    #$08D6, R0                      ; 51B4   02B8 00D6 0008
        MVO@    R0,     R4                      ; 51B7   0260
        MVII    #$023F, R4                      ; 51B8   02BC 023F
        SDBD                                    ; 51BA   0001
        MVII    #$08CE, R0                      ; 51BB   02B8 00CE 0008
        MVO@    R0,     R4                      ; 51BE   0260
        MVII    #$0001, R0                      ; 51BF   02B8 0001
        MVO     R0,     G_01B4                  ; 51C1   0240 01B4
        MVII    #$0001, R0                      ; 51C3   02B8 0001
        MVII    #$018C, R4                      ; 51C5   02BC 018C
        MVO@    R0,     R4                      ; 51C7   0260
        MVII    #$0010, R3                      ; 51C8   02BB 0010
        MVO     R3,     G_015D                  ; 51CA   0243 015D
        MVO     R3,     G_015E                  ; 51CC   0243 015E
        MVO     R3,     G_018F                  ; 51CE   0243 018F
        MVO     R3,     G_0190                  ; 51D0   0243 0190

        JSR     R5,     L_5379                  ; 51D2   0004 0150 0379
        JSR     R5,     L_5E7C                  ; 51D5   0004 015C 027C

        MVII    #$0001, R0                      ; 51D8   02B8 0001
        MVO     R0,     G_01E1                  ; 51DA   0240 01E1
        PULR    R7                              ; 51DC   02B7

L_51DD:
        PSHR    R5                              ; 51DD   0275
        MVII    #$016C, R3                      ; 51DE   02BB 016C
        ADD     G_01EF, R3                      ; 51E0   02C3 01EF
        MVII    #$0001, R0                      ; 51E2   02B8 0001
        MVO@    R0,     R3                      ; 51E4   0258
        CLRR    R0                              ; 51E5   01C0
        INCR    R3                              ; 51E6   000B
        MVO@    R0,     R3                      ; 51E7   0258
        MVI     G_01EF, R0                      ; 51E8   0280 01EF
        TSTR    R0                              ; 51EA   0080
        BNEQ    L_51F1                          ; 51EB   020C 0004

        MVII    #$0002, R0                      ; 51ED   02B8 0002
        B       L_51F3                          ; 51EF   0200 0002

L_51F1:
        MVII    #$0003, R0                      ; 51F1   02B8 0003
L_51F3:
        ADDI    #$0006, R3                      ; 51F3   02FB 0006
        MVO@    R0,     R3                      ; 51F5   0258
        ADDI    #$0007, R3                      ; 51F6   02FB 0007
        MVII    #$036B, R0                      ; 51F8   02B8 036B
        MVO@    R0,     R3                      ; 51FA   0258
        INCR    R3                              ; 51FB   000B
        SWAP    R0,     1                       ; 51FC   0040
        MVO@    R0,     R3                      ; 51FD   0258
        SDBD                                    ; 51FE   0001
        MVII    #$085A, R0                      ; 51FF   02B8 005A 0008
        MVO@    R0,     R4                      ; 5202   0260
        SDBD                                    ; 5203   0001
        MVII    #$0862, R0                      ; 5204   02B8 0062 0008
        MVO@    R0,     R4                      ; 5207   0260
        SDBD                                    ; 5208   0001
        MVII    #$086A, R0                      ; 5209   02B8 006A 0008
        MVO@    R0,     R4                      ; 520C   0260
        SDBD                                    ; 520D   0001
        MVII    #$0872, R0                      ; 520E   02B8 0072 0008
        MVO@    R0,     R4                      ; 5211   0260
        MVO@    R2,     R4                      ; 5212   0262

        JSR     R5,     L_5E87                  ; 5213   0004 015C 0287
        JSR     R5,     L_5E9A                  ; 5216   0004 015C 029A

        PULR    R7                              ; 5219   02B7

L_521A:
        PSHR    R5                              ; 521A   0275
        MVII    #$0229, R4                      ; 521B   02BC 0229
        CLRR    R2                              ; 521D   01D2

        JSR     R5,     L_5256                  ; 521E   0004 0150 0256

        MVII    #$023D, R4                      ; 5221   02BC 023D
        MVII    #$0001, R2                      ; 5223   02BA 0001

        JSR     R5,     L_526C                  ; 5225   0004 0150 026C

        CLRR    R0                              ; 5228   01C0
        MVO     R0,     G_01D8                  ; 5229   0240 01D8
        MVII    #$0209, R0                      ; 522B   02B8 0209
        MVO     R0,     G_0318                  ; 522D   0240 0318
L_522F:
        MVI     G_01D8, R2                      ; 522F   0282 01D8
        MVI     G_0318, R4                      ; 5231   0284 0318

        JSR     R5,     L_5256                  ; 5233   0004 0150 0256

        MVI     G_01D8, R2                      ; 5236   0282 01D8
        INCR    R2                              ; 5238   000A
        MVO     R2,     G_01D8                  ; 5239   0242 01D8
        MVI     G_0318, R4                      ; 523B   0284 0318
        ADDI    #$0014, R4                      ; 523D   02FC 0014
        MVO     R4,     G_0318                  ; 523F   0244 0318

        JSR     R5,     L_526C                  ; 5241   0004 0150 026C

        MVI     G_0318, R4                      ; 5244   0284 0318
        ADDI    #$0013, R4                      ; 5246   02FC 0013
        MVO     R4,     G_0318                  ; 5248   0244 0318
        CMPI    #$02F3, R4                      ; 524A   037C 02F3
        BNEQ    L_522F                          ; 524C   022C 001E

        MVI     G_01CF, R0                      ; 524E   0280 01CF
        MVII    #$0229, R1                      ; 5250   02B9 0229

        JSR     R5,     L_5742                  ; 5252   0004 0154 0342

        PULR    R7                              ; 5255   02B7

L_5256:
        PSHR    R5                              ; 5256   0275
        MVII    #$01C1, R5                      ; 5257   02BD 01C1
        SDBD                                    ; 5259   0001
        MVI@    R5,     R3                      ; 525A   02AB
        MVO@    R3,     R4                      ; 525B   0263
        SDBD                                    ; 525C   0001
        MVI@    R5,     R0                      ; 525D   02A8
        SDBD                                    ; 525E   0001
        MVI@    R5,     R1                      ; 525F   02A9
L_5260:
        TSTR    R2                              ; 5260   0092
        BEQ     L_5268                          ; 5261   0204 0005

        MVO@    R0,     R4                      ; 5263   0260
        MVO@    R1,     R4                      ; 5264   0261
        DECR    R2                              ; 5265   0012
        B       L_5260                          ; 5266   0220 0007

L_5268:
        SDBD                                    ; 5268   0001
        MVI@    R5,     R0                      ; 5269   02A8
        MVO@    R0,     R4                      ; 526A   0260
        PULR    R7                              ; 526B   02B7

L_526C:
        PSHR    R5                              ; 526C   0275
        MVII    #$01C9, R5                      ; 526D   02BD 01C9
        SDBD                                    ; 526F   0001
        MVI@    R5,     R0                      ; 5270   02A8
        SDBD                                    ; 5271   0001
        MVI@    R5,     R1                      ; 5272   02A9
L_5273:
        MVO@    R0,     R4                      ; 5273   0260
        MVO@    R1,     R4                      ; 5274   0261
        DECR    R2                              ; 5275   0012
        BNEQ    L_5273                          ; 5276   022C 0004
        PULR    R7                              ; 5278   02B7

L_5279:
        PSHR    R5                              ; 5279   0275
        MVII    #$016C, R4                      ; 527A   02BC 016C
        ADD     G_01EF, R4                      ; 527C   02C4 01EF
        MVI@    R4,     R1                      ; 527E   02A1
        MVI@    R4,     R2                      ; 527F   02A2
        PSHR    R2                              ; 5280   0272
        CMPI    #$0001, R1                      ; 5281   0379 0001
        BNEQ    L_5294                          ; 5283   020C 000F

        JSR     R5,     L_5336                  ; 5285   0004 0150 0336

        TSTR    R2                              ; 5288   0092
        BNEQ    L_528E                          ; 5289   020C 0003

        JSR     R5,     L_6CE7                  ; 528B   0004 016C 00E7

L_528E:
        SDBD                                    ; 528E   0001
        MVII    #$6A82, R5                      ; 528F   02BD 0082 006A
        B       L_5326                          ; 5292   0200 0092

L_5294:
        CMPI    #$0002, R1                      ; 5294   0379 0002
        BNEQ    L_52A7                          ; 5296   020C 000F

        JSR     R5,     L_5336                  ; 5298   0004 0150 0336

        TSTR    R2                              ; 529B   0092
        BNEQ    L_52A1                          ; 529C   020C 0003

        JSR     R5,     L_6DC1                  ; 529E   0004 016C 01C1

L_52A1:
        SDBD                                    ; 52A1   0001
        MVII    #$6A8A, R5                      ; 52A2   02BD 008A 006A
        B       L_5326                          ; 52A5   0200 007F

L_52A7:
        CMPI    #$0003, R1                      ; 52A7   0379 0003
        BNEQ    L_52BA                          ; 52A9   020C 000F

        JSR     R5,     L_5336                  ; 52AB   0004 0150 0336

        TSTR    R2                              ; 52AE   0092
        BNEQ    L_52B4                          ; 52AF   020C 0003

        JSR     R5,     L_6E45                  ; 52B1   0004 016C 0245

L_52B4:
        SDBD                                    ; 52B4   0001
        MVII    #$6A82, R5                      ; 52B5   02BD 0082 006A
        B       L_5326                          ; 52B8   0200 006C

L_52BA:
        CMPI    #$0004, R1                      ; 52BA   0379 0004
        BNEQ    L_52CD                          ; 52BC   020C 000F

        JSR     R5,     L_5336                  ; 52BE   0004 0150 0336

        TSTR    R2                              ; 52C1   0092
        BNEQ    L_52C7                          ; 52C2   020C 0003

        JSR     R5,     L_6CE7                  ; 52C4   0004 016C 00E7

L_52C7:
        SDBD                                    ; 52C7   0001
        MVII    #$6A8A, R5                      ; 52C8   02BD 008A 006A
        B       L_5326                          ; 52CB   0200 0059

L_52CD:
        CMPI    #$0005, R1                      ; 52CD   0379 0005
        BNEQ    L_52E0                          ; 52CF   020C 000F

        JSR     R5,     L_5344                  ; 52D1   0004 0150 0344

        TSTR    R2                              ; 52D4   0092
        BNEQ    L_52DA                          ; 52D5   020C 0003

        JSR     R5,     L_6CE7                  ; 52D7   0004 016C 00E7

L_52DA:
        SDBD                                    ; 52DA   0001
        MVII    #$6A82, R5                      ; 52DB   02BD 0082 006A
        B       L_5326                          ; 52DE   0200 0046

L_52E0:
        CMPI    #$0006, R1                      ; 52E0   0379 0006
        BNEQ    L_52F3                          ; 52E2   020C 000F

        JSR     R5,     L_5344                  ; 52E4   0004 0150 0344

        TSTR    R2                              ; 52E7   0092
        BNEQ    L_52ED                          ; 52E8   020C 0003

        JSR     R5,     L_6DC1                  ; 52EA   0004 016C 01C1

L_52ED:
        SDBD                                    ; 52ED   0001
        MVII    #$6A8A, R5                      ; 52EE   02BD 008A 006A
        B       L_5326                          ; 52F1   0200 0033

L_52F3:
        CMPI    #$0007, R1                      ; 52F3   0379 0007
        BNEQ    L_5306                          ; 52F5   020C 000F

        JSR     R5,     L_5354                  ; 52F7   0004 0150 0354

        TSTR    R2                              ; 52FA   0092
        BNEQ    L_5300                          ; 52FB   020C 0003

        JSR     R5,     L_6E45                  ; 52FD   0004 016C 0245

L_5300:
        SDBD                                    ; 5300   0001
        MVII    #$6A82, R5                      ; 5301   02BD 0082 006A
        B       L_5326                          ; 5304   0200 0020

L_5306:
        CMPI    #$0008, R1                      ; 5306   0379 0008
        BNEQ    L_5319                          ; 5308   020C 000F

        JSR     R5,     L_5354                  ; 530A   0004 0150 0354

        TSTR    R2                              ; 530D   0092
        BNEQ    L_5313                          ; 530E   020C 0003

        JSR     R5,     L_6CE7                  ; 5310   0004 016C 00E7

L_5313:
        SDBD                                    ; 5313   0001
        MVII    #$6A8A, R5                      ; 5314   02BD 008A 006A
        B       L_5326                          ; 5317   0200 000D

L_5319:
        JSR     R5,     L_5354                  ; 5319   0004 0150 0354

        TSTR    R2                              ; 531C   0092
        BNEQ    L_5322                          ; 531D   020C 0003

        JSR     R5,     L_6E45                  ; 531F   0004 016C 0245

L_5322:
        SDBD                                    ; 5322   0001
        MVII    #$6A8A, R5                      ; 5323   02BD 008A 006A
L_5326:
        PULR    R2                              ; 5326   02B2
        CMPI    #$0002, R2                      ; 5327   037A 0002
        MVI     G_01D5, R0                      ; 5329   0280 01D5
        SUBI    #$0008, R0                      ; 532B   0338 0008
        MVO     R0,     G_01D5                  ; 532D   0240 01D5
        MVO     R0,     G_01DB                  ; 532F   0240 01DB
        SLL     R2,     1                       ; 5331   004A
        ADDR    R2,     R5                      ; 5332   00D5
        SDBD                                    ; 5333   0001
        MVI@    R5,     R4                      ; 5334   02AC
        PULR    R7                              ; 5335   02B7

L_5336:
        PSHR    R5                              ; 5336   0275
        MVII    #$0038, R0                      ; 5337   02B8 0038
        MVO     R0,     G_01D5                  ; 5339   0240 01D5
        MVO     R0,     G_01DB                  ; 533B   0240 01DB
        MVII    #$0003, R0                      ; 533D   02B8 0003
        MVO     R0,     G_01D6                  ; 533F   0240 01D6
        MVO     R0,     G_01D2                  ; 5341   0240 01D2
        PULR    R7                              ; 5343   02B7

L_5344:
        PSHR    R5                              ; 5344   0275
        MVII    #$0030, R0                      ; 5345   02B8 0030
        MVO     R0,     G_01D5                  ; 5347   0240 01D5
        MVO     R0,     G_01DB                  ; 5349   0240 01DB
        MVII    #$0003, R0                      ; 534B   02B8 0003
        MVO     R0,     G_01D6                  ; 534D   0240 01D6
        MVII    #$0006, R0                      ; 534F   02B8 0006
        MVO     R0,     G_01D2                  ; 5351   0240 01D2
        PULR    R7                              ; 5353   02B7

L_5354:
        PSHR    R5                              ; 5354   0275
        MVII    #$0028, R0                      ; 5355   02B8 0028
        MVO     R0,     G_01D5                  ; 5357   0240 01D5
        MVO     R0,     G_01DB                  ; 5359   0240 01DB
        MVII    #$0002, R0                      ; 535B   02B8 0002
        MVO     R0,     G_01D6                  ; 535D   0240 01D6
        MVII    #$0005, R0                      ; 535F   02B8 0005
        MVO     R0,     G_01D2                  ; 5361   0240 01D2
        PULR    R7                              ; 5363   02B7

L_5364:
        PSHR    R5                              ; 5364   0275

        JSR     R5,     L_5E69                  ; 5365   0004 015C 0269

        MVII    #$0165, R4                      ; 5368   02BC 0165
        ADD     G_01EF, R4                      ; 536A   02C4 01EF
        CLRR    R0                              ; 536C   01C0
        MVO@    R0,     R4                      ; 536D   0260

        JSR     R5,     L_5495                  ; 536E   0004 0154 0095
        JSR     R5,     L_5453                  ; 5371   0004 0154 0053

        MVII    #$0001, R0                      ; 5374   02B8 0001
        MVO     R0,     G_01DD                  ; 5376   0240 01DD
        PULR    R7                              ; 5378   02B7

L_5379:
        PSHR    R5                              ; 5379   0275

        JSR     R5,     L_5480                  ; 537A   0004 0154 0080
        JSR     R5,     L_54BE                  ; 537D   0004 0154 00BE
        JSR     R5,     L_54DD                  ; 5380   0004 0154 00DD

        MVII    #$016C, R4                      ; 5383   02BC 016C
        ADD     G_01EF, R4                      ; 5385   02C4 01EF
        MVI@    R4,     R1                      ; 5387   02A1
        MVI@    R4,     R2                      ; 5388   02A2

        JSR     R5,     L_546D                  ; 5389   0004 0154 006D
        JSR     R5,     L_5C1B                  ; 538C   0004 015C 001B
        JSR     R5,     L_5279                  ; 538F   0004 0150 0279

        CLRR    R0                              ; 5392   01C0
        MVII    #$01C1, R5                      ; 5393   02BD 01C1
L_5395:
        SDBD                                    ; 5395   0001
        MVI@    R4,     R1                      ; 5396   02A1
        MVO@    R1,     R5                      ; 5397   0269
        SWAP    R1,     1                       ; 5398   0041
        MVO@    R1,     R5                      ; 5399   0269
        INCR    R0                              ; 539A   0008
        CMPI    #$0006, R0                      ; 539B   0378 0006
        BNEQ    L_5395                          ; 539D   022C 0009

        MVI@    R4,     R1                      ; 539F   02A1
        MVO@    R1,     R5                      ; 53A0   0269
        MVI@    R4,     R1                      ; 53A1   02A1
        MVO@    R1,     R5                      ; 53A2   0269
        MVI@    R4,     R1                      ; 53A3   02A1
        MVO@    R1,     R5                      ; 53A4   0269
        MVII    #$016C, R4                      ; 53A5   02BC 016C
        ADD     G_01EF, R4                      ; 53A7   02C4 01EF
        MVI@    R4,     R0                      ; 53A9   02A0
        MVI@    R4,     R1                      ; 53AA   02A1
        SDBD                                    ; 53AB   0001
        MVII    #$6928, R4                      ; 53AC   02BC 0028 0069
L_53AF:
        DECR    R0                              ; 53AF   0010
        BEQ     L_53B6                          ; 53B0   0204 0004

        ADDI    #$0010, R4                      ; 53B2   02FC 0010
        B       L_53AF                          ; 53B4   0220 0006

L_53B6:
        TSTR    R1                              ; 53B6   0089
        BEQ     L_53BE                          ; 53B7   0204 0005

        ADDI    #$0004, R4                      ; 53B9   02FC 0004
        DECR    R1                              ; 53BB   0011
        B       L_53B6                          ; 53BC   0220 0007

L_53BE:
        MVI@    R4,     R0                      ; 53BE   02A0
        MVI@    R4,     R1                      ; 53BF   02A1
        MVI     G_01DD, R3                      ; 53C0   0283 01DD
        TSTR    R3                              ; 53C2   009B
        BEQ     L_53D0                          ; 53C3   0204 000B

        MVII    #$0000, R3                      ; 53C5   02BB 0000
        MVO     R3,     G_01DD                  ; 53C7   0243 01DD
        MVII    #$015D, R2                      ; 53C9   02BA 015D
        ADD     G_01EF, R2                      ; 53CB   02C2 01EF
        MVO@    R0,     R2                      ; 53CD   0250
        INCR    R2                              ; 53CE   000A
        MVO@    R1,     R2                      ; 53CF   0251
L_53D0:
        MVI@    R4,     R1                      ; 53D0   02A1
        MVO     R1,     G_01D3                  ; 53D1   0241 01D3
        MVO     R1,     G_0189                  ; 53D3   0241 0189
        MVI@    R4,     R1                      ; 53D5   02A1
        MVO     R1,     G_01D4                  ; 53D6   0241 01D4
        MVO     R1,     G_018A                  ; 53D8   0241 018A
        MVII    #$015D, R2                      ; 53DA   02BA 015D
        ADD     G_01EF, R2                      ; 53DC   02C2 01EF
        MVI@    R2,     R0                      ; 53DE   0290
        MVO     R0,     G_01D0                  ; 53DF   0240 01D0
        INCR    R2                              ; 53E1   000A
        MVI@    R2,     R0                      ; 53E2   0290
        MVO     R0,     G_01D1                  ; 53E3   0240 01D1
        CLRR    R0                              ; 53E5   01C0
        MVO     R0,     G_01AF                  ; 53E6   0240 01AF
        MVO     R0,     G_01AE                  ; 53E8   0240 01AE
        MVO     R0,     G_017C                  ; 53EA   0240 017C
        MVO     R0,     G_017D                  ; 53EC   0240 017D
        MVII    #$016C, R4                      ; 53EE   02BC 016C
        ADD     G_01EF, R4                      ; 53F0   02C4 01EF
        MVI@    R4,     R0                      ; 53F2   02A0
        SLL     R0,     1                       ; 53F3   0048
        SLL     R0,     1                       ; 53F4   0048
        SLL     R0,     1                       ; 53F5   0048
        MVI@    R4,     R1                      ; 53F6   02A1

        JSR     R5,     L_5C15                  ; 53F7   0004 015C 0015

        SDBD                                    ; 53FA   0001
        MVII    #$691B, R4                      ; 53FB   02BC 001B 0069
L_53FE:
        MVI@    R4,     R1                      ; 53FE   02A1
        DECLE   $0089,  $0204,  $0009           ; 53FF   0089 0204 0009

        CMPR    R1,     R0                      ; 5402   0148
        BNEQ    L_53FE                          ; 5403   022C 0006

        MVII    #$0001, R0                      ; 5405   02B8 0001
        MVO     R0,     G_017C                  ; 5407   0240 017C
        B       L_541A                          ; 5409   0200 000F

        DECLE   $0001                           ; 540B   0001

        MVII    #$0020, R4                      ; 540C   02BC 0020
        SAR     R1,     1                       ; 540E   0069
L_540F:
        MVI@    R4,     R1                      ; 540F   02A1
        TSTR    R1                              ; 5410   0089
        BEQ     L_541A                          ; 5411   0204 0007

        CMPR    R1,     R0                      ; 5413   0148
        BNEQ    L_540F                          ; 5414   022C 0006

        MVII    #$0001, R0                      ; 5416   02B8 0001
        MVO     R0,     G_017D                  ; 5418   0240 017D

L_541A:
        JSR     R5,     L_521A                  ; 541A   0004 0150 021A

        PULR    R7                              ; 541D   02B7

L_541E:
        PSHR    R5                              ; 541E   0275
        MVII    #$000E, R1                      ; 541F   02B9 000E
L_5421:
        MVO     R1,     G_01D8                  ; 5421   0241 01D8
L_5423:
        MVO     R1,     G_01D9                  ; 5423   0241 01D9
        MVII    #$015D, R3                      ; 5425   02BB 015D
        ADD     G_01EF, R3                      ; 5427   02C3 01EF
        ADDR    R1,     R3                      ; 5429   00CB
        MVI@    R3,     R2                      ; 542A   029A
        TSTR    R2                              ; 542B   0092
        BEQ     L_5442                          ; 542C   0204 0014

        CMPI    #$0001, R2                      ; 542E   037A 0001
        BNEQ    L_5439                          ; 5430   020C 0007

        MVI     G_01CE, R0                      ; 5432   0280 01CE

        JSR     R5,     L_55EB                  ; 5434   0004 0154 01EB

        B       L_5442                          ; 5437   0200 0009

L_5439:
        CMPI    #$0002, R2                      ; 5439   037A 0002
        BNEQ    L_5442                          ; 543B   020C 0005

        MVI     G_01CF, R0                      ; 543D   0280 01CF

        JSR     R5,     L_55EB                  ; 543F   0004 0154 01EB

L_5442:
        MVI     G_01D9, R1                      ; 5442   0281 01D9
        DECR    R1                              ; 5444   0011
        MOVR    R1,     R2                      ; 5445   008A
        ANDI    #$0007, R2                      ; 5446   03BA 0007
        BNEQ    L_5423                          ; 5448   022C 0026

        MVI     G_01D8, R1                      ; 544A   0281 01D8
        ADDI    #$0007, R1                      ; 544C   02F9 0007
        CMPI    #$0038, R1                      ; 544E   0379 0038
        BNEQ    L_5421                          ; 5450   022C 0030
        PULR    R7                              ; 5452   02B7

L_5453:
        PSHR    R5                              ; 5453   0275
        MVII    #$016D, R3                      ; 5454   02BB 016D
        ADD     G_01EF, R3                      ; 5456   02C3 01EF
        MVI@    R3,     R2                      ; 5458   029A
        INCR    R2                              ; 5459   000A
        CMPI    #$0004, R2                      ; 545A   037A 0004
        BNEQ    L_5469                          ; 545C   020C 000B

        CLRR    R2                              ; 545E   01D2
        MVO@    R2,     R3                      ; 545F   025A
        DECR    R3                              ; 5460   0013
        MVI@    R3,     R1                      ; 5461   0299
        CMPI    #$0009, R1                      ; 5462   0379 0009
        BEQ     L_5468                          ; 5464   0204 0002

        INCR    R1                              ; 5466   0009
        MVO@    R1,     R3                      ; 5467   0259
L_5468:
        PULR    R7                              ; 5468   02B7

L_5469:
        MVO@    R2,     R3                      ; 5469   025A
        DECR    R3                              ; 546A   0013
        MVI@    R3,     R1                      ; 546B   0299
        PULR    R7                              ; 546C   02B7

L_546D:
        PSHR    R5                              ; 546D   0275
        SLL     R1,     1                       ; 546E   0049
        MVII    #$023B, R4                      ; 546F   02BC 023B
        SLL     R1,     1                       ; 5471   0049
        SLL     R1,     1                       ; 5472   0049
        ADDI    #$0087, R1                      ; 5473   02F9 0087
        MVO@    R1,     R4                      ; 5475   0261
        INCR    R2                              ; 5476   000A
        SLL     R2,     1                       ; 5477   004A
        MVII    #$024F, R4                      ; 5478   02BC 024F
        SLL     R2,     1                       ; 547A   004A
        SLL     R2,     1                       ; 547B   004A
        ADDI    #$0087, R2                      ; 547C   02FA 0087
        MVO@    R2,     R4                      ; 547E   0262
        PULR    R7                              ; 547F   02B7

L_5480:
        PSHR    R5                              ; 5480   0275
        SDBD                                    ; 5481   0001
        MVII    #$6A28, R4                      ; 5482   02BC 0028 006A
        SDBD                                    ; 5485   0001
        MVII    #$0800, R0                      ; 5486   02B8 0000 0008
L_5489:
        MVI@    R4,     R5                      ; 5489   02A5
        MVO@    R0,     R5                      ; 548A   0268
        MVO@    R0,     R5                      ; 548B   0268
        ADDI    #$0012, R5                      ; 548C   02FD 0012
        MVO@    R0,     R5                      ; 548E   0268
        MVO@    R0,     R5                      ; 548F   0268
        CMPI    #$02DA, R5                      ; 5490   037D 02DA
        BNEQ    L_5489                          ; 5492   022C 000A
        PULR    R7                              ; 5494   02B7

L_5495:
        PSHR    R5                              ; 5495   0275
        MVII    #$0166, R4                      ; 5496   02BC 0166
        ADD     G_01EF, R4                      ; 5498   02C4 01EF
        CLRR    R0                              ; 549A   01C0
        CLRR    R1                              ; 549B   01C9
L_549C:
        MVO@    R1,     R4                      ; 549C   0261
        INCR    R0                              ; 549D   0008
        CMPI    #$0006, R0                      ; 549E   0378 0006
        BNEQ    L_549C                          ; 54A0   022C 0005

        ADDI    #$0002, R4                      ; 54A2   02FC 0002
        CLRR    R0                              ; 54A4   01C0
L_54A5:
        MVO@    R1,     R4                      ; 54A5   0261
        INCR    R0                              ; 54A6   0008
        CMPI    #$0005, R0                      ; 54A7   0378 0005
        BNEQ    L_54A5                          ; 54A9   022C 0005

        ADDI    #$0003, R4                      ; 54AB   02FC 0003
        MVO@    R1,     R4                      ; 54AD   0261
        MVO@    R1,     R4                      ; 54AE   0261
        MVO@    R1,     R4                      ; 54AF   0261
        MVO@    R1,     R4                      ; 54B0   0261
        ADDI    #$0004, R4                      ; 54B1   02FC 0004
        MVO@    R1,     R4                      ; 54B3   0261
        MVO@    R1,     R4                      ; 54B4   0261
        MVO@    R1,     R4                      ; 54B5   0261
        ADDI    #$0005, R4                      ; 54B6   02FC 0005
        MVO@    R1,     R4                      ; 54B8   0261
        MVO@    R1,     R4                      ; 54B9   0261
        ADDI    #$0006, R4                      ; 54BA   02FC 0006
        MVO@    R1,     R4                      ; 54BC   0261
        PULR    R7                              ; 54BD   02B7

L_54BE:
        PSHR    R5                              ; 54BE   0275
        CLRR    R1                              ; 54BF   01C9
        MVII    #$032E, R3                      ; 54C0   02BB 032E
        B       L_54C9                          ; 54C2   0200 0005

L_54C4:
        PSHR    R5                              ; 54C4   0275
        MVII    #$0001, R1                      ; 54C5   02B9 0001
        MVII    #$0336, R3                      ; 54C7   02BB 0336
L_54C9:
        CLRR    R0                              ; 54C9   01C0
        MVO@    R0,     R3                      ; 54CA   0258
        ADDI    #$0005, R3                      ; 54CB   02FB 0005
        SDBD                                    ; 54CD   0001
        MVII    #$FFFF, R0                      ; 54CE   02B8 00FF 00FF
        MVO@    R0,     R3                      ; 54D1   0258
        ADDI    #$0003, R3                      ; 54D2   02FB 0003
        INCR    R1                              ; 54D4   0009
        CMPI    #$0006, R1                      ; 54D5   0379 0006
        BNEQ    L_54C9                          ; 54D7   022C 000F

        CLRR    R0                              ; 54D9   01C0
        MVO     R0,     G_01AE                  ; 54DA   0240 01AE
        PULR    R7                              ; 54DC   02B7

L_54DD:
        PSHR    R5                              ; 54DD   0275
        MVII    #$01E2, R4                      ; 54DE   02BC 01E2
        MVII    #$01EE, R3                      ; 54E0   02BB 01EE
        CLRR    R0                              ; 54E2   01C0
L_54E3:
        MVO@    R0,     R4                      ; 54E3   0260
        CMPR    R3,     R4                      ; 54E4   015C
        BNEQ    L_54E3                          ; 54E5   022C 0003
        PULR    R7                              ; 54E7   02B7

L_54E8:
        PSHR    R5                              ; 54E8   0275

        JSR     R5,     L_6F7C                  ; 54E9   0004 016C 037C

        MVII    #$0001, R0                      ; 54EC   02B8 0001
        MVO     R0,     G_0147                  ; 54EE   0240 0147
        PULR    R7                              ; 54F0   02B7

L_54F1:
        PSHR    R5                              ; 54F1   0275
        MVII    #$0173, R3                      ; 54F2   02BB 0173
        ADD     G_01EF, R3                      ; 54F4   02C3 01EF
        MVI@    R3,     R0                      ; 54F6   0298
        DECR    R0                              ; 54F7   0010
        MVO@    R0,     R3                      ; 54F8   0258

        JSR     R5,     L_5C1B                  ; 54F9   0004 015C 001B

        MVII    #$0161, R3                      ; 54FC   02BB 0161
        ADD     G_01EF, R3                      ; 54FE   02C3 01EF
        MVI@    R3,     R1                      ; 5500   0299
        SUBI    #$0002, R3                      ; 5501   033B 0002
        MVO@    R1,     R3                      ; 5503   0259
        ADDI    #$0015, R3                      ; 5504   02FB 0015
        MVI@    R3,     R1                      ; 5506   0299
        SUBI    #$0014, R3                      ; 5507   033B 0014
        MVO@    R1,     R3                      ; 5509   0259
        MVII    #$003F, R4                      ; 550A   02BC 003F

        JSR     R5,     L_55E3                  ; 550C   0004 0154 01E3

        MVII    #$031F, R4                      ; 550F   02BC 031F
        MVO@    R2,     R4                      ; 5511   0262
        MVO@    R3,     R4                      ; 5512   0263
        MVII    #$0327, R4                      ; 5513   02BC 0327
        MVO@    R2,     R4                      ; 5515   0262
        MVO@    R3,     R4                      ; 5516   0263
        MVII    #$0325, R3                      ; 5517   02BB 0325
        MVI@    R3,     R1                      ; 5519   0299
        SDBD                                    ; 551A   0001
        MVII    #$0800, R0                      ; 551B   02B8 0000 0008

        JSR     R5,     L_5C15                  ; 551E   0004 015C 0015

        MVO@    R0,     R3                      ; 5521   0258

        JSR     R5,     L_54BE                  ; 5522   0004 0154 00BE
        JSR     R5,     L_54DD                  ; 5525   0004 0154 00DD

        CLRR    R0                              ; 5528   01C0
        MVO     R0,     G_01BC                  ; 5529   0240 01BC
        CLRR    R0                              ; 552B   01C0
        MVO     R0,     G_0184                  ; 552C   0240 0184

        JSR     R5,     L_5532                  ; 552E   0004 0154 0132

        PULR    R7                              ; 5531   02B7

L_5532:
        PSHR    R5                              ; 5532   0275
        SDBD                                    ; 5533   0001
        MVII    #$1000, R0                      ; 5534   02B8 0000 0010
        MVI     G_031D, R1                      ; 5537   0281 031D

        JSR     R5,     L_5C15                  ; 5539   0004 015C 0015

        MVO     R0,     G_031D                  ; 553C   0240 031D
        SDBD                                    ; 553E   0001
        MVII    #$1000, R0                      ; 553F   02B8 0000 0010
        MVI     G_0325, R1                      ; 5542   0281 0325

        JSR     R5,     L_5C15                  ; 5544   0004 015C 0015

        MVO     R0,     G_0325                  ; 5547   0240 0325
        PULR    R7                              ; 5549   02B7

L_554A:
        PSHR    R5                              ; 554A   0275

        JSR     R5,     L_55CD                  ; 554B   0004 0154 01CD

        TSTR    R1                              ; 554E   0089
        BEQ     L_5577                          ; 554F   0204 0026

        TSTR    R2                              ; 5551   0092
        BEQ     L_5564                          ; 5552   0204 0010

        CLRR    R0                              ; 5554   01C0
        MVO     R0,     G_01EF                  ; 5555   0240 01EF

        JSR     R5,     L_55CD                  ; 5557   0004 0154 01CD

        TSTR    R1                              ; 555A   0089
        BNEQ    L_5574                          ; 555B   020C 0017

        MVII    #$0032, R0                      ; 555D   02B8 0032
        MVO     R0,     G_01EF                  ; 555F   0240 01EF
        MVII    #$0001, R0                      ; 5561   02B8 0001
        PULR    R7                              ; 5563   02B7

L_5564:
        MVII    #$0032, R0                      ; 5564   02B8 0032
        MVO     R0,     G_01EF                  ; 5566   0240 01EF

        JSR     R5,     L_55CD                  ; 5568   0004 0154 01CD

        TSTR    R1                              ; 556B   0089
        BNEQ    L_5574                          ; 556C   020C 0006

        CLRR    R0                              ; 556E   01C0
        MVO     R0,     G_01EF                  ; 556F   0240 01EF
        MVII    #$0001, R0                      ; 5571   02B8 0001
        PULR    R7                              ; 5573   02B7

L_5574:
        MVII    #$0002, R0                      ; 5574   02B8 0002
        PULR    R7                              ; 5576   02B7

L_5577:
        TSTR    R2                              ; 5577   0092
        BEQ     L_558B                          ; 5578   0204 0011

        CLRR    R0                              ; 557A   01C0

        JSR     R5,     L_5E69                  ; 557B   0004 015C 0269
        JSR     R5,     L_54BE                  ; 557E   0004 0154 00BE

        MVII    #$0097, R2                      ; 5581   02BA 0097

        JSR     R5,     L_55A7                  ; 5583   0004 0154 01A7

        CLRR    R0                              ; 5586   01C0
        MVO     R0,     G_01EF                  ; 5587   0240 01EF
        B       L_559A                          ; 5589   0200 000F

L_558B:
        JSR     R5,     L_5E69                  ; 558B   0004 015C 0269
        JSR     R5,     L_54BE                  ; 558E   0004 0154 00BE

        MVII    #$008F, R2                      ; 5591   02BA 008F

        JSR     R5,     L_55A7                  ; 5593   0004 0154 01A7

        MVII    #$0032, R0                      ; 5596   02B8 0032
        MVO     R0,     G_01EF                  ; 5598   0240 01EF

L_559A:
        JSR     R5,     L_55CD                  ; 559A   0004 0154 01CD

        TSTR    R1                              ; 559D   0089
        BNEQ    L_55A4                          ; 559E   020C 0004

        CLRR    R0                              ; 55A0   01C0
        MVO     R0,     G_01E1                  ; 55A1   0240 01E1
        PULR    R7                              ; 55A3   02B7

L_55A4:
        MVII    #$0002, R0                      ; 55A4   02B8 0002
        PULR    R7                              ; 55A6   02B7

L_55A7:
        PSHR    R5                              ; 55A7   0275
        MVII    #$0007, R3                      ; 55A8   02BB 0007
        MVII    #$02BA, R4                      ; 55AA   02BC 02BA

        JSR     R5,     X_PRINT_R5              ; 55AC   0004 0118 007B
        STRING  "PLAYER "                       ; 55AF  
        DECLE   $0000                           ; 55B6   0000

        MVII    #$02C1, R4                      ; 55B7   02BC 02C1
        MVO@    R2,     R4                      ; 55B9   0262
        MVII    #$0007, R3                      ; 55BA   02BB 0007
        MVII    #$02CD, R4                      ; 55BC   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 55BE   0004 0118 007B
        STRING  "GAME  OVER"                    ; 55C1  
        DECLE   $0000                           ; 55CB   0000

        PULR    R7                              ; 55CC   02B7

L_55CD:
        PSHR    R5                              ; 55CD   0275
        MVII    #$0173, R3                      ; 55CE   02BB 0173
        MVI     G_01EF, R2                      ; 55D0   0282 01EF
        ADDR    R2,     R3                      ; 55D2   00D3
        MVI@    R3,     R1                      ; 55D3   0299
        PULR    R7                              ; 55D4   02B7

L_55D5:
        PSHR    R5                              ; 55D5   0275
        PSHR    R0                              ; 55D6   0270
        MVI@    R1,     R2                      ; 55D7   028A
        SDBD                                    ; 55D8   0001
        ANDI    #$FFF8, R2                      ; 55D9   03BA 00F8 00FF
        MOVR    R0,     R5                      ; 55DC   0085
        COMR    R0                              ; 55DD   0018
        ANDR    R2,     R0                      ; 55DE   0190
        XORR    R5,     R0                      ; 55DF   01E8
        MVO@    R0,     R1                      ; 55E0   0248
        PULR    R0                              ; 55E1   02B0
        PULR    R7                              ; 55E2   02B7

L_55E3:
        PSHR    R5                              ; 55E3   0275
        MVII    #$015F, R3                      ; 55E4   02BB 015F
        ADD     G_01EF, R3                      ; 55E6   02C3 01EF
        MVI@    R3,     R1                      ; 55E8   0299
        B       L_55F1                          ; 55E9   0200 0006

L_55EB:
        PSHR    R5                              ; 55EB   0275
        B       L_55F1                          ; 55EC   0200 0003

L_55EE:
        PSHR    R5                              ; 55EE   0275
        MVI     G_01E4, R1                      ; 55EF   0281 01E4
L_55F1:
        CMPI    #$0009, R1                      ; 55F1   0379 0009
        BNEQ    L_5601                          ; 55F3   020C 000C

        MVII    #$0209, R1                      ; 55F5   02B9 0209
        SDBD                                    ; 55F7   0001
        MVII    #$5400, R2                      ; 55F8   02BA 0000 0054
        SDBD                                    ; 55FB   0001
        MVII    #$0A00, R3                      ; 55FC   02BB 0000 000A
        B       L_5743                          ; 55FF   0200 0142

L_5601:
        CMPI    #$000A, R1                      ; 5601   0379 000A
        BNEQ    L_5611                          ; 5603   020C 000C

        MVII    #$0230, R1                      ; 5605   02B9 0230
        SDBD                                    ; 5607   0001
        MVII    #$4C00, R2                      ; 5608   02BA 0000 004C
        SDBD                                    ; 560B   0001
        MVII    #$1A00, R3                      ; 560C   02BB 0000 001A
        B       L_5743                          ; 560F   0200 0132

L_5611:
        CMPI    #$000B, R1                      ; 5611   0379 000B
        BNEQ    L_5621                          ; 5613   020C 000C

        MVII    #$0257, R1                      ; 5615   02B9 0257
        SDBD                                    ; 5617   0001
        MVII    #$4400, R2                      ; 5618   02BA 0000 0044
        SDBD                                    ; 561B   0001
        MVII    #$2A00, R3                      ; 561C   02BB 0000 002A
        B       L_5743                          ; 561F   0200 0122

L_5621:
        CMPI    #$000C, R1                      ; 5621   0379 000C
        BNEQ    L_5631                          ; 5623   020C 000C

        MVII    #$027E, R1                      ; 5625   02B9 027E
        SDBD                                    ; 5627   0001
        MVII    #$3C00, R2                      ; 5628   02BA 0000 003C
        SDBD                                    ; 562B   0001
        MVII    #$3A00, R3                      ; 562C   02BB 0000 003A
        B       L_5743                          ; 562F   0200 0112

L_5631:
        CMPI    #$000D, R1                      ; 5631   0379 000D
        BNEQ    L_5641                          ; 5633   020C 000C

        MVII    #$02A5, R1                      ; 5635   02B9 02A5
        SDBD                                    ; 5637   0001
        MVII    #$3400, R2                      ; 5638   02BA 0000 0034
        SDBD                                    ; 563B   0001
        MVII    #$4A00, R3                      ; 563C   02BB 0000 004A
        B       L_5743                          ; 563F   0200 0102

L_5641:
        CMPI    #$000E, R1                      ; 5641   0379 000E
        BNEQ    L_5651                          ; 5643   020C 000C

        MVII    #$02CC, R1                      ; 5645   02B9 02CC
        SDBD                                    ; 5647   0001
        MVII    #$2C00, R2                      ; 5648   02BA 0000 002C
        SDBD                                    ; 564B   0001
        MVII    #$5A00, R3                      ; 564C   02BB 0000 005A
        B       L_5743                          ; 564F   0200 00F2

L_5651:
        CMPI    #$0011, R1                      ; 5651   0379 0011
        BNEQ    L_5661                          ; 5653   020C 000C

        MVII    #$0232, R1                      ; 5655   02B9 0232
        SDBD                                    ; 5657   0001
        MVII    #$5C00, R2                      ; 5658   02BA 0000 005C
        SDBD                                    ; 565B   0001
        MVII    #$1A00, R3                      ; 565C   02BB 0000 001A
        B       L_5743                          ; 565F   0200 00E2

L_5661:
        CMPI    #$0012, R1                      ; 5661   0379 0012
        BNEQ    L_5671                          ; 5663   020C 000C

        MVII    #$0259, R1                      ; 5665   02B9 0259
        SDBD                                    ; 5667   0001
        MVII    #$5400, R2                      ; 5668   02BA 0000 0054
        SDBD                                    ; 566B   0001
        MVII    #$2A00, R3                      ; 566C   02BB 0000 002A
        B       L_5743                          ; 566F   0200 00D2

L_5671:
        CMPI    #$0013, R1                      ; 5671   0379 0013
        BNEQ    L_5681                          ; 5673   020C 000C

        MVII    #$0280, R1                      ; 5675   02B9 0280
        SDBD                                    ; 5677   0001
        MVII    #$4C00, R2                      ; 5678   02BA 0000 004C
        SDBD                                    ; 567B   0001
        MVII    #$3A00, R3                      ; 567C   02BB 0000 003A
        B       L_5743                          ; 567F   0200 00C2

L_5681:
        CMPI    #$0014, R1                      ; 5681   0379 0014
        BNEQ    L_5691                          ; 5683   020C 000C

        MVII    #$02A7, R1                      ; 5685   02B9 02A7
        SDBD                                    ; 5687   0001
        MVII    #$4400, R2                      ; 5688   02BA 0000 0044
        SDBD                                    ; 568B   0001
        MVII    #$4A00, R3                      ; 568C   02BB 0000 004A
        B       L_5743                          ; 568F   0200 00B2

L_5691:
        CMPI    #$0015, R1                      ; 5691   0379 0015
        BNEQ    L_56A1                          ; 5693   020C 000C

        MVII    #$02CE, R1                      ; 5695   02B9 02CE
        SDBD                                    ; 5697   0001
        MVII    #$3C00, R2                      ; 5698   02BA 0000 003C
        SDBD                                    ; 569B   0001
        MVII    #$5A00, R3                      ; 569C   02BB 0000 005A
        B       L_5743                          ; 569F   0200 00A2

L_56A1:
        CMPI    #$0019, R1                      ; 56A1   0379 0019
        BNEQ    L_56B1                          ; 56A3   020C 000C

        MVII    #$025B, R1                      ; 56A5   02B9 025B
        SDBD                                    ; 56A7   0001
        MVII    #$6400, R2                      ; 56A8   02BA 0000 0064
        SDBD                                    ; 56AB   0001
        MVII    #$2A00, R3                      ; 56AC   02BB 0000 002A
        B       L_5743                          ; 56AF   0200 0092

L_56B1:
        CMPI    #$001A, R1                      ; 56B1   0379 001A
        BNEQ    L_56C1                          ; 56B3   020C 000C

        MVII    #$0282, R1                      ; 56B5   02B9 0282
        SDBD                                    ; 56B7   0001
        MVII    #$5C00, R2                      ; 56B8   02BA 0000 005C
        SDBD                                    ; 56BB   0001
        MVII    #$3A00, R3                      ; 56BC   02BB 0000 003A
        B       L_5743                          ; 56BF   0200 0082

L_56C1:
        CMPI    #$001B, R1                      ; 56C1   0379 001B
        BNEQ    L_56D1                          ; 56C3   020C 000C

        MVII    #$02A9, R1                      ; 56C5   02B9 02A9
        SDBD                                    ; 56C7   0001
        MVII    #$5400, R2                      ; 56C8   02BA 0000 0054
        SDBD                                    ; 56CB   0001
        MVII    #$4A00, R3                      ; 56CC   02BB 0000 004A
        B       L_5743                          ; 56CF   0200 0072

L_56D1:
        CMPI    #$001C, R1                      ; 56D1   0379 001C
        BNEQ    L_56E1                          ; 56D3   020C 000C

        MVII    #$02D0, R1                      ; 56D5   02B9 02D0
        SDBD                                    ; 56D7   0001
        MVII    #$4C00, R2                      ; 56D8   02BA 0000 004C
        SDBD                                    ; 56DB   0001
        MVII    #$5A00, R3                      ; 56DC   02BB 0000 005A
        B       L_5743                          ; 56DF   0200 0062

L_56E1:
        CMPI    #$0021, R1                      ; 56E1   0379 0021
        BNEQ    L_56F1                          ; 56E3   020C 000C

        MVII    #$0284, R1                      ; 56E5   02B9 0284
        SDBD                                    ; 56E7   0001
        MVII    #$6C00, R2                      ; 56E8   02BA 0000 006C
        SDBD                                    ; 56EB   0001
        MVII    #$3A00, R3                      ; 56EC   02BB 0000 003A
        B       L_5743                          ; 56EF   0200 0052

L_56F1:
        CMPI    #$0022, R1                      ; 56F1   0379 0022
        BNEQ    L_5701                          ; 56F3   020C 000C

        MVII    #$02AB, R1                      ; 56F5   02B9 02AB
        SDBD                                    ; 56F7   0001
        MVII    #$6400, R2                      ; 56F8   02BA 0000 0064
        SDBD                                    ; 56FB   0001
        MVII    #$4A00, R3                      ; 56FC   02BB 0000 004A
        B       L_5743                          ; 56FF   0200 0042

L_5701:
        CMPI    #$0023, R1                      ; 5701   0379 0023
        BNEQ    L_5711                          ; 5703   020C 000C

        MVII    #$02D2, R1                      ; 5705   02B9 02D2
        SDBD                                    ; 5707   0001
        MVII    #$5C00, R2                      ; 5708   02BA 0000 005C
        SDBD                                    ; 570B   0001
        MVII    #$5A00, R3                      ; 570C   02BB 0000 005A
        B       L_5743                          ; 570F   0200 0032

L_5711:
        CMPI    #$0029, R1                      ; 5711   0379 0029
        BNEQ    L_5721                          ; 5713   020C 000C

        MVII    #$02AD, R1                      ; 5715   02B9 02AD
        SDBD                                    ; 5717   0001
        MVII    #$7400, R2                      ; 5718   02BA 0000 0074
        SDBD                                    ; 571B   0001
        MVII    #$4A00, R3                      ; 571C   02BB 0000 004A
        B       L_5743                          ; 571F   0200 0022

L_5721:
        CMPI    #$002A, R1                      ; 5721   0379 002A
        BNEQ    L_5731                          ; 5723   020C 000C

        MVII    #$02D4, R1                      ; 5725   02B9 02D4
        SDBD                                    ; 5727   0001
        MVII    #$6C00, R2                      ; 5728   02BA 0000 006C
        SDBD                                    ; 572B   0001
        MVII    #$5A00, R3                      ; 572C   02BB 0000 005A
        B       L_5743                          ; 572F   0200 0012

L_5731:
        CMPI    #$0031, R1                      ; 5731   0379 0031
        BNEQ    L_5741                          ; 5733   020C 000C

        MVII    #$02D6, R1                      ; 5735   02B9 02D6
        SDBD                                    ; 5737   0001
        MVII    #$7C00, R2                      ; 5738   02BA 0000 007C
        SDBD                                    ; 573B   0001
        MVII    #$5A00, R3                      ; 573C   02BB 0000 005A
        B       L_5743                          ; 573F   0200 0002
L_5741:
        PULR    R7                              ; 5741   02B7

L_5742:
        PSHR    R5                              ; 5742   0275
L_5743:
        CMPI    #$003F, R4                      ; 5743   037C 003F
        BEQ     L_5757                          ; 5745   0204 0010

        JSR     R5,     L_55D5                  ; 5747   0004 0154 01D5

        INCR    R1                              ; 574A   0009

        JSR     R5,     L_55D5                  ; 574B   0004 0154 01D5

        ADDI    #$0013, R1                      ; 574E   02F9 0013

        JSR     R5,     L_55D5                  ; 5750   0004 0154 01D5

        INCR    R1                              ; 5753   0009

        JSR     R5,     L_55D5                  ; 5754   0004 0154 01D5

L_5757:
        PULR    R7                              ; 5757   02B7

        PSHR    R5                              ; 5758   0275
        MVI     G_01EF, R2                      ; 5759   0282 01EF
        TSTR    R2                              ; 575B   0092
        BNEQ    L_5762                          ; 575C   020C 0004

        TSTR    R1                              ; 575E   0089
        BEQ     L_5767                          ; 575F   0204 0006
        PULR    R7                              ; 5761   02B7

L_5762:
        CMPI    #$0001, R1                      ; 5762   0379 0001
        BEQ     L_5767                          ; 5764   0204 0001
        PULR    R7                              ; 5766   02B7

L_5767:
        MVO     R0,     G_01BD                  ; 5767   0240 01BD
        MVI     G_01BC, R3                      ; 5769   0283 01BC
        TSTR    R3                              ; 576B   009B
        BEQ     L_576F                          ; 576C   0204 0001
        PULR    R7                              ; 576E   02B7

L_576F:
        MVII    #$0001, R3                      ; 576F   02BB 0001
        MVO     R3,     G_01BC                  ; 5771   0243 01BC
        B       L_5776                          ; 5773   0200 0001

L_5775:
        PSHR    R5                              ; 5775   0275
L_5776:
        SDBD                                    ; 5776   0001
        CMPI    #$FFFF, R0                      ; 5777   0378 00FF 00FF
        BEQ     L_57AF                          ; 577A   0204 0033

        TSTR    R0                              ; 577C   0080
        BEQ     L_57AF                          ; 577D   0204 0030

        CMPI    #$0001, R0                      ; 577F   0378 0001
        BEQ     L_57B3                          ; 5781   0204 0030

        CMPI    #$0002, R0                      ; 5783   0378 0002
        BEQ     L_57B3                          ; 5785   0204 002C

        CMPI    #$0003, R0                      ; 5787   0378 0003
        BEQ     L_57B3                          ; 5789   0204 0028

        CMPI    #$0005, R0                      ; 578B   0378 0005
        BEQ     L_57EF                          ; 578D   0204 0060

        CMPI    #$0006, R0                      ; 578F   0378 0006
        BEQ     L_57EF                          ; 5791   0204 005C

        CMPI    #$0007, R0                      ; 5793   0378 0007
        BEQ     L_57EF                          ; 5795   0204 0058

        CMPI    #$0009, R0                      ; 5797   0378 0009
        BEQ     L_5867                          ; 5799   0204 00CC

        CMPI    #$000A, R0                      ; 579B   0378 000A
        BEQ     L_5867                          ; 579D   0204 00C8

        CMPI    #$000B, R0                      ; 579F   0378 000B
        BEQ     L_5867                          ; 57A1   0204 00C4

        CMPI    #$000D, R0                      ; 57A3   0378 000D
        BEQ     L_582B                          ; 57A5   0204 0084

        CMPI    #$000E, R0                      ; 57A7   0378 000E
        BEQ     L_582B                          ; 57A9   0204 0080

        CMPI    #$000F, R0                      ; 57AB   0378 000F
        BEQ     L_582B                          ; 57AD   0204 007C

L_57AF:
        CLRR    R0                              ; 57AF   01C0
        MVO     R0,     G_01BC                  ; 57B0   0240 01BC
        PULR    R7                              ; 57B2   02B7

L_57B3:
        JSR     R5,     L_58A3                  ; 57B3   0004 0158 00A3

        SUBI    #$0001, R1                      ; 57B6   0339 0001
        SUBI    #$0001, R2                      ; 57B8   033A 0001
        MVO@    R1,     R4                      ; 57BA   0261
        MVO@    R2,     R4                      ; 57BB   0262

        JSR     R5,     L_58C1                  ; 57BC   0004 0158 00C1

        SDBD                                    ; 57BF   0001
        MVII    #$5057, R1                      ; 57C0   02B9 0057 0050
        MVO     R1,     G_031E                  ; 57C3   0241 031E
        SDBD                                    ; 57C5   0001
        MVII    #$505E, R1                      ; 57C6   02B9 005E 0050
        MVO     R1,     G_0326                  ; 57C9   0241 0326
        SDBD                                    ; 57CB   0001
        MVII    #$9A52, R1                      ; 57CC   02B9 0052 009A
        MVO     R1,     G_031D                  ; 57CF   0241 031D
        SDBD                                    ; 57D1   0001
        MVII    #$9A40, R1                      ; 57D2   02B9 0040 009A
        MVO     R1,     G_0325                  ; 57D5   0241 0325
        MVI     G_01BE, R0                      ; 57D7   0280 01BE
        CMPI    #$0001, R0                      ; 57D9   0378 0001
        BNEQ    L_57E4                          ; 57DB   020C 0007

        SDBD                                    ; 57DD   0001
        MVII    #$6A44, R0                      ; 57DE   02B8 0044 006A

        JSR     R5,     L_5C02                  ; 57E1   0004 015C 0002

L_57E4:
        MVII    #$0324, R4                      ; 57E4   02BC 0324

        JSR     R5,     L_5EC6                  ; 57E6   0004 015C 02C6

        MVII    #$032C, R4                      ; 57E9   02BC 032C

        JSR     R5,     L_5EC6                  ; 57EB   0004 015C 02C6

        PULR    R7                              ; 57EE   02B7

L_57EF:
        JSR     R5,     L_58A3                  ; 57EF   0004 0158 00A3

        SUBI    #$0008, R1                      ; 57F2   0339 0008
        SUBI    #$0001, R2                      ; 57F4   033A 0001
        MVO@    R1,     R4                      ; 57F6   0261
        MVO@    R2,     R4                      ; 57F7   0262

        JSR     R5,     L_58C1                  ; 57F8   0004 0158 00C1

        SDBD                                    ; 57FB   0001
        MVII    #$5057, R1                      ; 57FC   02B9 0057 0050
        MVO     R1,     G_031E                  ; 57FF   0241 031E
        SDBD                                    ; 5801   0001
        MVII    #$505E, R1                      ; 5802   02B9 005E 0050
        MVO     R1,     G_0326                  ; 5805   0241 0326
        SDBD                                    ; 5807   0001
        MVII    #$9852, R1                      ; 5808   02B9 0052 0098
        MVO     R1,     G_031D                  ; 580B   0241 031D
        SDBD                                    ; 580D   0001
        MVII    #$9840, R1                      ; 580E   02B9 0040 0098
        MVO     R1,     G_0325                  ; 5811   0241 0325
        MVI     G_01BE, R0                      ; 5813   0280 01BE
        CMPI    #$0001, R0                      ; 5815   0378 0001
        BNEQ    L_5820                          ; 5817   020C 0007

        SDBD                                    ; 5819   0001
        MVII    #$6A4D, R0                      ; 581A   02B8 004D 006A

        JSR     R5,     L_5C02                  ; 581D   0004 015C 0002

L_5820:
        MVII    #$0324, R4                      ; 5820   02BC 0324

        JSR     R5,     L_5EC6                  ; 5822   0004 015C 02C6

        MVII    #$032C, R4                      ; 5825   02BC 032C

        JSR     R5,     L_5EC6                  ; 5827   0004 015C 02C6

        PULR    R7                              ; 582A   02B7

L_582B:
        JSR     R5,     L_58A3                  ; 582B   0004 0158 00A3

        ADDI    #$0008, R1                      ; 582E   02F9 0008
        ADDI    #$0001, R2                      ; 5830   02FA 0001
        MVO@    R1,     R4                      ; 5832   0261
        MVO@    R2,     R4                      ; 5833   0262

        JSR     R5,     L_58C1                  ; 5834   0004 0158 00C1

        SDBD                                    ; 5837   0001
        MVII    #$501C, R1                      ; 5838   02B9 001C 0050
        MVO     R1,     G_031E                  ; 583B   0241 031E
        SDBD                                    ; 583D   0001
        MVII    #$5023, R1                      ; 583E   02B9 0023 0050
        MVO     R1,     G_0326                  ; 5841   0241 0326
        SDBD                                    ; 5843   0001
        MVII    #$9A52, R1                      ; 5844   02B9 0052 009A
        MVO     R1,     G_031D                  ; 5847   0241 031D
        SDBD                                    ; 5849   0001
        MVII    #$9A40, R1                      ; 584A   02B9 0040 009A
        MVO     R1,     G_0325                  ; 584D   0241 0325
        MVI     G_01BE, R0                      ; 584F   0280 01BE
        CMPI    #$0001, R0                      ; 5851   0378 0001
        BNEQ    L_585C                          ; 5853   020C 0007

        SDBD                                    ; 5855   0001
        MVII    #$6A3B, R0                      ; 5856   02B8 003B 006A

        JSR     R5,     L_5C02                  ; 5859   0004 015C 0002

L_585C:
        MVII    #$0324, R4                      ; 585C   02BC 0324

        JSR     R5,     L_5EC6                  ; 585E   0004 015C 02C6

        MVII    #$032C, R4                      ; 5861   02BC 032C

        JSR     R5,     L_5EC6                  ; 5863   0004 015C 02C6

        PULR    R7                              ; 5866   02B7

L_5867:
        JSR     R5,     L_58A3                  ; 5867   0004 0158 00A3

        ADDI    #$0001, R1                      ; 586A   02F9 0001
        ADDI    #$0001, R2                      ; 586C   02FA 0001
        MVO@    R1,     R4                      ; 586E   0261
        MVO@    R2,     R4                      ; 586F   0262

        JSR     R5,     L_58C1                  ; 5870   0004 0158 00C1

        SDBD                                    ; 5873   0001
        MVII    #$501C, R1                      ; 5874   02B9 001C 0050
        MVO     R1,     G_031E                  ; 5877   0241 031E
        SDBD                                    ; 5879   0001
        MVII    #$5023, R1                      ; 587A   02B9 0023 0050
        MVO     R1,     G_0326                  ; 587D   0241 0326
        SDBD                                    ; 587F   0001
        MVII    #$9852, R1                      ; 5880   02B9 0052 0098
        MVO     R1,     G_031D                  ; 5883   0241 031D
        SDBD                                    ; 5885   0001
        MVII    #$9840, R1                      ; 5886   02B9 0040 0098
        MVO     R1,     G_0325                  ; 5889   0241 0325
        MVI     G_01BE, R0                      ; 588B   0280 01BE
        CMPI    #$0001, R0                      ; 588D   0378 0001
        BNEQ    L_5898                          ; 588F   020C 0007

        SDBD                                    ; 5891   0001
        MVII    #$6A32, R0                      ; 5892   02B8 0032 006A

        JSR     R5,     L_5C02                  ; 5895   0004 015C 0002

L_5898:
        MVII    #$0324, R4                      ; 5898   02BC 0324

        JSR     R5,     L_5EC6                  ; 589A   0004 015C 02C6

        MVII    #$032C, R4                      ; 589D   02BC 032C

        JSR     R5,     L_5EC6                  ; 589F   0004 015C 02C6

        PULR    R7                              ; 58A2   02B7

L_58A3:
        PSHR    R5                              ; 58A3   0275
        SDBD                                    ; 58A4   0001
        MVII    #$015D, R4                      ; 58A5   02BC 005D 0001
        MVI     G_01EF, R1                      ; 58A8   0281 01EF
        ADDR    R1,     R4                      ; 58AA   00CC
        ADDI    #$0002, R4                      ; 58AB   02FC 0002
        MVI@    R4,     R1                      ; 58AD   02A1
        MVI@    R4,     R2                      ; 58AE   02A2
        MVO@    R1,     R4                      ; 58AF   0261
        ADDI    #$0012, R4                      ; 58B0   02FC 0012
        MVO@    R2,     R4                      ; 58B2   0262
        SUBI    #$0016, R4                      ; 58B3   033C 0016
        PULR    R7                              ; 58B5   02B7

L_58B6:
        PSHR    R5                              ; 58B6   0275
        PSHR    R1                              ; 58B7   0271
        MOVR    R1,     R5                      ; 58B8   008D
L_58B9:
        SDBD                                    ; 58B9   0001
        MVI@    R4,     R1                      ; 58BA   02A1
        MVO@    R1,     R5                      ; 58BB   0269
        DECR    R0                              ; 58BC   0010
        BNEQ    L_58B9                          ; 58BD   022C 0005

        PULR    R1                              ; 58BF   02B1
        PULR    R7                              ; 58C0   02B7

L_58C1:
        PSHR    R5                              ; 58C1   0275
        CMPI    #$0007, R2                      ; 58C2   037A 0007
        BNEQ    L_58D0                          ; 58C4   020C 000A

        MVII    #$0001, R0                      ; 58C6   02B8 0001

        JSR     R5,     L_6D87                  ; 58C8   0004 016C 0187

        MVII    #$0001, R0                      ; 58CB   02B8 0001
        MVO     R0,     G_01BE                  ; 58CD   0240 01BE
        PULR    R7                              ; 58CF   02B7

L_58D0:
        MOVR    R1,     R2                      ; 58D0   008A
        ANDI    #$00F8, R1                      ; 58D1   03B9 00F8
        BNEQ    L_5908                          ; 58D3   020C 0033

        CLRR    R0                              ; 58D5   01C0
        MOVR    R2,     R1                      ; 58D6   0091

        JSR     R5,     L_5BEE                  ; 58D7   0004 0158 03EE

        CMPI    #$0001, R0                      ; 58DA   0378 0001
        BEQ     L_58F9                          ; 58DC   0204 001B

        MVII    #$0001, R0                      ; 58DE   02B8 0001

        JSR     R5,     L_6D87                  ; 58E0   0004 016C 0187

        MVII    #$0003, R0                      ; 58E3   02B8 0003
        MVO     R0,     G_01BE                  ; 58E5   0240 01BE
        SDBD                                    ; 58E7   0001
        MVII    #$68E4, R0                      ; 58E8   02B8 00E4 0068

        JSR     R5,     L_5C02                  ; 58EB   0004 015C 0002
        JSR     R5,     L_54BE                  ; 58EE   0004 0154 00BE

        MVII    #$0001, R0                      ; 58F1   02B8 0001
        MVO     R0,     G_0184                  ; 58F3   0240 0184
        CLRR    R0                              ; 58F5   01C0
        MVO     R0,     G_0188                  ; 58F6   0240 0188
        PULR    R7                              ; 58F8   02B7

L_58F9:
        SDBD                                    ; 58F9   0001
        MVII    #$68E4, R0                      ; 58FA   02B8 00E4 0068

        JSR     R5,     L_5C02                  ; 58FD   0004 015C 0002

        MVII    #$0002, R0                      ; 5900   02B8 0002
        MVO     R0,     G_01BE                  ; 5902   0240 01BE
        CLRR    R0                              ; 5904   01C0
        MVO     R0,     G_01B7                  ; 5905   0240 01B7
        PULR    R7                              ; 5907   02B7

L_5908:
        MOVR    R2,     R1                      ; 5908   0091
        ANDI    #$0007, R1                      ; 5909   03B9 0007
        BNEQ    L_5944                          ; 590B   020C 0037

        MOVR    R2,     R1                      ; 590D   0091
        SLR     R1,     1                       ; 590E   0061
        SLR     R1,     1                       ; 590F   0061
        MVII    #$0001, R0                      ; 5910   02B8 0001
        SLR     R1,     1                       ; 5912   0061

        JSR     R5,     L_5BEE                  ; 5913   0004 0158 03EE

        CMPI    #$0001, R0                      ; 5916   0378 0001
        BEQ     L_5935                          ; 5918   0204 001B

        MVII    #$0001, R0                      ; 591A   02B8 0001

        JSR     R5,     L_6D87                  ; 591C   0004 016C 0187

        MVII    #$0003, R0                      ; 591F   02B8 0003
        MVO     R0,     G_01BE                  ; 5921   0240 01BE
        SDBD                                    ; 5923   0001
        MVII    #$68EB, R0                      ; 5924   02B8 00EB 0068

        JSR     R5,     L_5C02                  ; 5927   0004 015C 0002
        JSR     R5,     L_54BE                  ; 592A   0004 0154 00BE

        MVII    #$0001, R0                      ; 592D   02B8 0001
        MVO     R0,     G_0184                  ; 592F   0240 0184
        CLRR    R0                              ; 5931   01C0
        MVO     R0,     G_0188                  ; 5932   0240 0188
        PULR    R7                              ; 5934   02B7

L_5935:
        SDBD                                    ; 5935   0001
        MVII    #$68EB, R0                      ; 5936   02B8 00EB 0068

        JSR     R5,     L_5C02                  ; 5939   0004 015C 0002

        MVII    #$0002, R0                      ; 593C   02B8 0002
        MVO     R0,     G_01BE                  ; 593E   0240 01BE
        CLRR    R0                              ; 5940   01C0
        MVO     R0,     G_01B7                  ; 5941   0240 01B7
        PULR    R7                              ; 5943   02B7

L_5944:
        MVII    #$0001, R0                      ; 5944   02B8 0001
        MVO     R0,     G_01BE                  ; 5946   0240 01BE
        PULR    R7                              ; 5948   02B7

L_5949:
        PSHR    R5                              ; 5949   0275
        MVI     G_0184, R0                      ; 594A   0280 0184
        CMPI    #$0001, R0                      ; 594C   0378 0001
        BNEQ    L_5951                          ; 594E   020C 0001
        PULR    R7                              ; 5950   02B7

L_5951:
        MVI     G_01DB, R0                      ; 5951   0280 01DB
        DECR    R0                              ; 5953   0010
        MVO     R0,     G_01DB                  ; 5954   0240 01DB
        TSTR    R0                              ; 5956   0080
        BNEQ    L_5A69                          ; 5957   020C 0110

        MVII    #$0002, R0                      ; 5959   02B8 0002

        JSR     R5,     X_RAND1                 ; 595B   0004 0114 027D

        MVI     G_01D5, R1                      ; 595E   0281 01D5
        ADDR    R0,     R1                      ; 5960   00C1
        MVO     R1,     G_01DB                  ; 5961   0241 01DB
        MVI     G_01AF, R0                      ; 5963   0280 01AF
        INCR    R0                              ; 5965   0008
        MVO     R0,     G_01AF                  ; 5966   0240 01AF
        MVI     G_01AE, R0                      ; 5968   0280 01AE
        INCR    R0                              ; 596A   0008
        MVO     R0,     G_01AE                  ; 596B   0240 01AE
        MVI     G_01D2, R2                      ; 596D   0282 01D2
        CMPR    R2,     R0                      ; 596F   0150
        BLT     L_5998                          ; 5970   0205 0026

        MVI     G_01E3, R0                      ; 5972   0280 01E3
        TSTR    R0                              ; 5974   0080
        BNEQ    L_5998                          ; 5975   020C 0021

        MVII    #$0008, R0                      ; 5977   02B8 0008
        MVII    #$032D, R1                      ; 5979   02B9 032D
        SDBD                                    ; 597B   0001
        MVII    #$69D8, R4                      ; 597C   02BC 00D8 0069

        JSR     R5,     L_58B6                  ; 597F   0004 0158 00B6

        MVII    #$032D, R4                      ; 5982   02BC 032D
        SDBD                                    ; 5984   0001
        MVII    #$9857, R0                      ; 5985   02B8 0057 0098
        MVO@    R0,     R4                      ; 5988   0260
        SDBD                                    ; 5989   0001
        MVII    #$5065, R0                      ; 598A   02B8 0065 0050
        MVO@    R0,     R4                      ; 598D   0260
        MVII    #$01E2, R3                      ; 598E   02BB 01E2

        JSR     R5,     L_5A6A                  ; 5990   0004 0158 026A

        MVII    #$0001, R0                      ; 5993   02B8 0001
        MVO     R0,     G_01DF                  ; 5995   0240 01DF
        PULR    R7                              ; 5997   02B7

L_5998:
        MVI     G_01AF, R1                      ; 5998   0281 01AF
        MVI     G_018A, R0                      ; 599A   0280 018A
        CMPR    R0,     R1                      ; 599C   0141
        BLT     L_59C6                          ; 599D   0205 0027

        MVI     G_01ED, R1                      ; 599F   0281 01ED
        TSTR    R1                              ; 59A1   0089
        BNEQ    L_59C6                          ; 59A2   020C 0022

        MVI     G_01D4, R1                      ; 59A4   0281 01D4
        ADDR    R1,     R0                      ; 59A6   00C8
        MVO     R0,     G_018A                  ; 59A7   0240 018A
        MVII    #$0008, R0                      ; 59A9   02B8 0008
        MVII    #$0355, R1                      ; 59AB   02B9 0355
        SDBD                                    ; 59AD   0001
        MVII    #$69D8, R4                      ; 59AE   02BC 00D8 0069

        JSR     R5,     L_58B6                  ; 59B1   0004 0158 00B6

        MVII    #$0355, R4                      ; 59B4   02BC 0355
        SDBD                                    ; 59B6   0001
        MVII    #$9844, R0                      ; 59B7   02B8 0044 0098
        MVO@    R0,     R4                      ; 59BA   0260
        SDBD                                    ; 59BB   0001
        MVII    #$5089, R0                      ; 59BC   02B8 0089 0050
        MVO@    R0,     R4                      ; 59BF   0260
        MVII    #$01EC, R3                      ; 59C0   02BB 01EC

        JSR     R5,     L_5A6A                  ; 59C2   0004 0158 026A

        PULR    R7                              ; 59C5   02B7

L_59C6:
        MVI     G_01AF, R1                      ; 59C6   0281 01AF
        MVI     G_0189, R0                      ; 59C8   0280 0189
        CMPR    R0,     R1                      ; 59CA   0141
        BLT     L_59F5                          ; 59CB   0205 0028

        MVI     G_01E5, R1                      ; 59CD   0281 01E5
        TSTR    R1                              ; 59CF   0089
        BNEQ    L_59F5                          ; 59D0   020C 0023

        MVI     G_01D3, R1                      ; 59D2   0281 01D3
        ADDR    R1,     R0                      ; 59D4   00C8
        MVO     R0,     G_0189                  ; 59D5   0240 0189
        MVII    #$0010, R0                      ; 59D7   02B8 0010
        MVII    #$0335, R1                      ; 59D9   02B9 0335
        SDBD                                    ; 59DB   0001
        MVII    #$6A08, R4                      ; 59DC   02BC 0008 006A

        JSR     R5,     L_58B6                  ; 59DF   0004 0158 00B6

        MVII    #$0008, R0                      ; 59E2   02B8 0008
        MVO     R0,     G_01E7                  ; 59E4   0240 01E7
        MVII    #$0337, R4                      ; 59E6   02BC 0337
        MVII    #$01E4, R3                      ; 59E8   02BB 01E4

        JSR     R5,     L_5A6A                  ; 59EA   0004 0158 026A

        MVI     G_0337, R0                      ; 59ED   0280 0337
        MVO     R0,     G_033F                  ; 59EF   0240 033F

        JSR     R5,     L_6F35                  ; 59F1   0004 016C 0335

        PULR    R7                              ; 59F4   02B7

L_59F5:
        MVI     G_017C, R0                      ; 59F5   0280 017C
        TSTR    R0                              ; 59F7   0080
        BNEQ    L_5A33                          ; 59F8   020C 0039

        MVI     G_01E9, R0                      ; 59FA   0280 01E9
        TSTR    R0                              ; 59FC   0080
        BNEQ    L_5A17                          ; 59FD   020C 0018

        MVII    #$0008, R0                      ; 59FF   02B8 0008
        MVII    #$0345, R1                      ; 5A01   02B9 0345
        SDBD                                    ; 5A03   0001
        MVII    #$69D8, R4                      ; 5A04   02BC 00D8 0069

        JSR     R5,     L_58B6                  ; 5A07   0004 0158 00B6

        MVII    #$0346, R4                      ; 5A0A   02BC 0346
        SDBD                                    ; 5A0C   0001
        MVII    #$506E, R0                      ; 5A0D   02B8 006E 0050
        MVO@    R0,     R4                      ; 5A10   0260
        MVII    #$01E8, R3                      ; 5A11   02BB 01E8

        JSR     R5,     L_5A6A                  ; 5A13   0004 0158 026A

        PULR    R7                              ; 5A16   02B7

L_5A17:
        MVI     G_01EB, R0                      ; 5A17   0280 01EB
        TSTR    R0                              ; 5A19   0080
        BNEQ    L_5A33                          ; 5A1A   020C 0017

        MVII    #$0008, R0                      ; 5A1C   02B8 0008
        MVII    #$034D, R1                      ; 5A1E   02B9 034D
        SDBD                                    ; 5A20   0001
        MVII    #$69D8, R4                      ; 5A21   02BC 00D8 0069

        JSR     R5,     L_58B6                  ; 5A24   0004 0158 00B6

        MVII    #$034E, R4                      ; 5A27   02BC 034E
        SDBD                                    ; 5A29   0001
        MVII    #$5077, R0                      ; 5A2A   02B8 0077 0050
        MVO@    R0,     R4                      ; 5A2D   0260
        MVII    #$01EA, R3                      ; 5A2E   02BB 01EA

        JSR     R5,     L_5A6A                  ; 5A30   0004 0158 026A

L_5A33:
        MVI     G_017D, R0                      ; 5A33   0280 017D
        TSTR    R0                              ; 5A35   0080
        BNEQ    L_5A64                          ; 5A36   020C 002C

        MVI     G_01ED, R0                      ; 5A38   0280 01ED
        TSTR    R0                              ; 5A3A   0080
        BNEQ    L_5A45                          ; 5A3B   020C 0008

        MVII    #$0355, R1                      ; 5A3D   02B9 0355
        MVII    #$01EC, R3                      ; 5A3F   02BB 01EC

        JSR     R5,     L_5B27                  ; 5A41   0004 0158 0327

        PULR    R7                              ; 5A44   02B7

L_5A45:
        MVI     G_017C, R0                      ; 5A45   0280 017C
        TSTR    R0                              ; 5A47   0080
        BEQ     L_5A69                          ; 5A48   0204 001F

        MVI     G_01E9, R0                      ; 5A4A   0280 01E9
        TSTR    R0                              ; 5A4C   0080
        BNEQ    L_5A57                          ; 5A4D   020C 0008

        MVII    #$0345, R1                      ; 5A4F   02B9 0345
        MVII    #$01E8, R3                      ; 5A51   02BB 01E8

        JSR     R5,     L_5B27                  ; 5A53   0004 0158 0327

        PULR    R7                              ; 5A56   02B7

L_5A57:
        MVI     G_01EB, R0                      ; 5A57   0280 01EB
        TSTR    R0                              ; 5A59   0080
        BNEQ    L_5A64                          ; 5A5A   020C 0008

        MVII    #$034D, R1                      ; 5A5C   02B9 034D
        MVII    #$01EA, R3                      ; 5A5E   02BB 01EA

        JSR     R5,     L_5B27                  ; 5A60   0004 0158 0327

        PULR    R7                              ; 5A63   02B7

L_5A64:
        MVI     G_01AE, R0                      ; 5A64   0280 01AE
        DECR    R0                              ; 5A66   0010
        MVO     R0,     G_01AE                  ; 5A67   0240 01AE
L_5A69:
        PULR    R7                              ; 5A69   02B7

L_5A6A:
        PSHR    R5                              ; 5A6A   0275
        MVII    #$0001, R0                      ; 5A6B   02B8 0001

        JSR     R5,     X_RAND1                 ; 5A6D   0004 0114 027D

        CMPI    #$0001, R0                      ; 5A70   0378 0001
        BNEQ    L_5A7E                          ; 5A72   020C 000A

        MVII    #$0011, R2                      ; 5A74   02BA 0011
        MVO@    R2,     R3                      ; 5A76   025A
        SDBD                                    ; 5A77   0001
        MVII    #$5C00, R2                      ; 5A78   02BA 0000 005C
        MVO@    R2,     R4                      ; 5A7B   0262
        B       L_5A86                          ; 5A7C   0200 0008

L_5A7E:
        MVII    #$000A, R2                      ; 5A7E   02BA 000A
        MVO@    R2,     R3                      ; 5A80   025A
        SDBD                                    ; 5A81   0001
        MVII    #$4C00, R2                      ; 5A82   02BA 0000 004C
        MVO@    R2,     R4                      ; 5A85   0262
L_5A86:
        ADDI    #$0003, R4                      ; 5A86   02FC 0003
        MVI     G_01D6, R0                      ; 5A88   0280 01D6
        MVO@    R0,     R4                      ; 5A8A   0260
        SDBD                                    ; 5A8B   0001
        MVII    #$68F9, R0                      ; 5A8C   02B8 00F9 0068
        MVO@    R0,     R4                      ; 5A8F   0260
        INCR    R3                              ; 5A90   000B
        MVII    #$0001, R0                      ; 5A91   02B8 0001
        MVO@    R0,     R3                      ; 5A93   0258
        PULR    R7                              ; 5A94   02B7

L_5A95:
        PSHR    R5                              ; 5A95   0275
        PSHR    R4                              ; 5A96   0274
        PSHR    R3                              ; 5A97   0273
        MVI     G_01D6, R0                      ; 5A98   0280 01D6
        MVO@    R0,     R4                      ; 5A9A   0260

        JSR     R5,     L_5EC6                  ; 5A9B   0004 015C 02C6

        PULR    R3                              ; 5A9E   02B3
        PULR    R4                              ; 5A9F   02B4
        SDBD                                    ; 5AA0   0001
        CMPI    #$FFFF, R0                      ; 5AA1   0378 00FF 00FF
        BNEQ    L_5AB2                          ; 5AA4   020C 000C

        MVI     G_01D6, R0                      ; 5AA6   0280 01D6
        ADDI    #$0003, R0                      ; 5AA8   02F8 0003
        MVO@    R0,     R4                      ; 5AAA   0260
        MVII    #$0002, R0                      ; 5AAB   02B8 0002
        INCR    R3                              ; 5AAD   000B
        MVO@    R0,     R3                      ; 5AAE   0258

        JSR     R5,     L_6F0D                  ; 5AAF   0004 016C 030D

L_5AB2:
        PULR    R7                              ; 5AB2   02B7

L_5AB3:
        PSHR    R5                              ; 5AB3   0275
        MVII    #$0001, R0                      ; 5AB4   02B8 0001
        INCR    R3                              ; 5AB6   000B
        MVO@    R0,     R3                      ; 5AB7   0258
        DECR    R3                              ; 5AB8   0013
        MVI     G_01D6, R0                      ; 5AB9   0280 01D6
        MVO@    R0,     R4                      ; 5ABB   0260
        MVII    #$0001, R0                      ; 5ABC   02B8 0001

        JSR     R5,     X_RAND1                 ; 5ABE   0004 0114 027D

        CMPI    #$0001, R0                      ; 5AC1   0378 0001
        BNEQ    L_5ACB                          ; 5AC3   020C 0006

        MVI@    R3,     R1                      ; 5AC5   0299
        ADDI    #$0008, R1                      ; 5AC6   02F9 0008
        MVO@    R1,     R3                      ; 5AC8   0259
        B       L_5ACF                          ; 5AC9   0200 0004

L_5ACB:
        MVI@    R3,     R1                      ; 5ACB   0299
        ADDI    #$0001, R1                      ; 5ACC   02F9 0001
        MVO@    R1,     R3                      ; 5ACE   0259
L_5ACF:
        MVII    #$016C, R5                      ; 5ACF   02BD 016C
        ADD     G_01EF, R5                      ; 5AD1   02C5 01EF
        MVI@    R5,     R2                      ; 5AD3   02AA
        CMPI    #$0007, R2                      ; 5AD4   037A 0007
        BGE     L_5AEB                          ; 5AD6   020D 0013

        CMPI    #$000E, R1                      ; 5AD8   0379 000E
        BNEQ    L_5AE3                          ; 5ADA   020C 0007

        MVII    #$0015, R1                      ; 5ADC   02B9 0015
        MVO@    R1,     R3                      ; 5ADE   0259
        MVII    #$0001, R0                      ; 5ADF   02B8 0001
        B       L_5AEB                          ; 5AE1   0200 0008

L_5AE3:
        CMPI    #$0031, R1                      ; 5AE3   0379 0031
        BNEQ    L_5AEB                          ; 5AE5   020C 0004

        MVII    #$002A, R1                      ; 5AE7   02B9 002A
        MVO@    R1,     R3                      ; 5AE9   0259
        CLRR    R0                              ; 5AEA   01C0
L_5AEB:
        CMPI    #$0001, R0                      ; 5AEB   0378 0001
        BNEQ    L_5B0B                          ; 5AED   020C 001C

        SDBD                                    ; 5AEF   0001
        MVII    #$6A3B, R0                      ; 5AF0   02B8 003B 006A
        MVO@    R0,     R4                      ; 5AF3   0260
        CMPI    #$01E4, R3                      ; 5AF4   037B 01E4
        BNEQ    L_5B0A                          ; 5AF6   020C 0012

        MVI     G_01E7, R0                      ; 5AF8   0280 01E7
        CMPI    #$0008, R0                      ; 5AFA   0378 0008
        BNEQ    L_5B0A                          ; 5AFC   020C 000C

        SDBD                                    ; 5AFE   0001
        MVII    #$9A45, R0                      ; 5AFF   02B8 0045 009A
        MVO     R0,     G_0335                  ; 5B02   0240 0335
        SDBD                                    ; 5B04   0001
        MVII    #$9240, R0                      ; 5B05   02B8 0040 0092
        MVO     R0,     G_033D                  ; 5B08   0240 033D
L_5B0A:
        PULR    R7                              ; 5B0A   02B7

L_5B0B:
        SDBD                                    ; 5B0B   0001
        MVII    #$6A32, R0                      ; 5B0C   02B8 0032 006A
        MVO@    R0,     R4                      ; 5B0F   0260
        CMPI    #$01E4, R3                      ; 5B10   037B 01E4
        BNEQ    L_5B26                          ; 5B12   020C 0012

        MVI     G_01E7, R0                      ; 5B14   0280 01E7
        CMPI    #$0008, R0                      ; 5B16   0378 0008
        BNEQ    L_5B26                          ; 5B18   020C 000C

        SDBD                                    ; 5B1A   0001
        MVII    #$9845, R0                      ; 5B1B   02B8 0045 0098
        MVO     R0,     G_0335                  ; 5B1E   0240 0335
        SDBD                                    ; 5B20   0001
        MVII    #$9040, R0                      ; 5B21   02B8 0040 0090
        MVO     R0,     G_033D                  ; 5B24   0240 033D
L_5B26:
        PULR    R7                              ; 5B26   02B7

L_5B27:
        PSHR    R5                              ; 5B27   0275
        MVII    #$0008, R0                      ; 5B28   02B8 0008
        SDBD                                    ; 5B2A   0001
        MVII    #$69E8, R4                      ; 5B2B   02BC 00E8 0069

        JSR     R5,     L_58B6                  ; 5B2E   0004 0158 00B6

        MOVR    R1,     R4                      ; 5B31   008C
        MVII    #$0001, R0                      ; 5B32   02B8 0001

        JSR     R5,     X_RAND1                 ; 5B34   0004 0114 027D

        CMPI    #$0001, R0                      ; 5B37   0378 0001
        BEQ     L_5B55                          ; 5B39   0204 001A

        MVII    #$0031, R0                      ; 5B3B   02B8 0031
        MVO@    R0,     R3                      ; 5B3D   0258
        INCR    R3                              ; 5B3E   000B
        MVII    #$0012, R0                      ; 5B3F   02B8 0012
        MVO@    R0,     R3                      ; 5B41   0258
        SDBD                                    ; 5B42   0001
        MVII    #$9854, R0                      ; 5B43   02B8 0054 0098
        MVO@    R0,     R4                      ; 5B46   0260
        INCR    R4                              ; 5B47   000C
        SDBD                                    ; 5B48   0001
        MVII    #$8400, R0                      ; 5B49   02B8 0000 0084
        MVO@    R0,     R4                      ; 5B4C   0260
L_5B4D:
        ADDI    #$0003, R4                      ; 5B4D   02FC 0003
        MVI     G_01D6, R0                      ; 5B4F   0280 01D6
        ADDI    #$0002, R0                      ; 5B51   02F8 0002
        MVO@    R0,     R4                      ; 5B53   0260
        PULR    R7                              ; 5B54   02B7

L_5B55:
        MVII    #$000E, R0                      ; 5B55   02B8 000E
        MVO@    R0,     R3                      ; 5B57   0258
        INCR    R3                              ; 5B58   000B
        MVII    #$0011, R0                      ; 5B59   02B8 0011
        MVO@    R0,     R3                      ; 5B5B   0258
        SDBD                                    ; 5B5C   0001
        MVII    #$9A54, R0                      ; 5B5D   02B8 0054 009A
        MVO@    R0,     R4                      ; 5B60   0260
        INCR    R4                              ; 5B61   000C
        SDBD                                    ; 5B62   0001
        MVII    #$2400, R0                      ; 5B63   02B8 0000 0024
        MVO@    R0,     R4                      ; 5B66   0260
        B       L_5B4D                          ; 5B67   0220 001B

L_5B69:
        PSHR    R5                              ; 5B69   0275
        PSHR    R4                              ; 5B6A   0274
        MVI     G_01D6, R0                      ; 5B6B   0280 01D6
        MVO@    R0,     R4                      ; 5B6D   0260

        JSR     R5,     L_5EC6                  ; 5B6E   0004 015C 02C6

        PULR    R4                              ; 5B71   02B4
        SDBD                                    ; 5B72   0001
        CMPI    #$FFFF, R0                      ; 5B73   0378 00FF 00FF
        BNEQ    L_5B8F                          ; 5B76   020C 0017

        MVI     G_01D6, R0                      ; 5B78   0280 01D6
        ADDI    #$0005, R0                      ; 5B7A   02F8 0005
        MVO@    R0,     R4                      ; 5B7C   0260
        MVI@    R3,     R0                      ; 5B7D   0298
        CMPI    #$0019, R0                      ; 5B7E   0378 0019
        BNEQ    L_5B87                          ; 5B80   020C 0005

        MVII    #$0011, R0                      ; 5B82   02B8 0011
        MVO@    R0,     R3                      ; 5B84   0258
        B       L_5B8A                          ; 5B85   0200 0003

L_5B87:
        MVII    #$0012, R0                      ; 5B87   02B8 0012
        MVO@    R0,     R3                      ; 5B89   0258
L_5B8A:
        MVII    #$0002, R0                      ; 5B8A   02B8 0002

        JSR     R5,     L_6F82                  ; 5B8C   0004 016C 0382

L_5B8F:
        PULR    R7                              ; 5B8F   02B7

L_5B90:
        PSHR    R5                              ; 5B90   0275
        MVI     G_01D6, R0                      ; 5B91   0280 01D6
        ADDI    #$0003, R0                      ; 5B93   02F8 0003
        MVO@    R0,     R4                      ; 5B95   0260
        MVI@    R3,     R0                      ; 5B96   0298
        MOVR    R0,     R1                      ; 5B97   0081
        ANDI    #$0007, R0                      ; 5B98   03B8 0007
        BEQ     L_5BE0                          ; 5B9A   0204 0044

        ANDI    #$0038, R1                      ; 5B9C   03B9 0038
        BEQ     L_5BE0                          ; 5B9E   0204 0040

        MVII    #$0001, R0                      ; 5BA0   02B8 0001

        JSR     R5,     X_RAND1                 ; 5BA2   0004 0114 027D

        INCR    R3                              ; 5BA5   000B
        MVI@    R3,     R1                      ; 5BA6   0299
        CMPI    #$0011, R1                      ; 5BA7   0379 0011
        BEQ     L_5BC6                          ; 5BA9   0204 001B

        MVII    #$001A, R1                      ; 5BAB   02B9 001A
        MVO@    R1,     R3                      ; 5BAD   0259
        DECR    R3                              ; 5BAE   0013
        TSTR    R0                              ; 5BAF   0080
        BEQ     L_5BBC                          ; 5BB0   0204 000A

        SDBD                                    ; 5BB2   0001
        MVII    #$6A77, R0                      ; 5BB3   02B8 0077 006A
        MVO@    R0,     R4                      ; 5BB6   0260
        MVI@    R3,     R1                      ; 5BB7   0299
        SUBI    #$0007, R1                      ; 5BB8   0339 0007
        MVO@    R1,     R3                      ; 5BBA   0259
        PULR    R7                              ; 5BBB   02B7

L_5BBC:
        SDBD                                    ; 5BBC   0001
        MVII    #$6A61, R0                      ; 5BBD   02B8 0061 006A
        MVO@    R0,     R4                      ; 5BC0   0260
        MVI@    R3,     R1                      ; 5BC1   0299
        SUBI    #$0008, R1                      ; 5BC2   0339 0008
        MVO@    R1,     R3                      ; 5BC4   0259
        PULR    R7                              ; 5BC5   02B7

L_5BC6:
        MVII    #$0019, R1                      ; 5BC6   02B9 0019
        MVO@    R1,     R3                      ; 5BC8   0259
        DECR    R3                              ; 5BC9   0013
        TSTR    R0                              ; 5BCA   0080
        BEQ     L_5BD7                          ; 5BCB   0204 000A

        SDBD                                    ; 5BCD   0001
        MVII    #$6A6C, R0                      ; 5BCE   02B8 006C 006A
        MVO@    R0,     R4                      ; 5BD1   0260
        MVI@    R3,     R1                      ; 5BD2   0299
        ADDI    #$0007, R1                      ; 5BD3   02F9 0007
        MVO@    R1,     R3                      ; 5BD5   0259
        PULR    R7                              ; 5BD6   02B7

L_5BD7:
        SDBD                                    ; 5BD7   0001
        MVII    #$6A56, R0                      ; 5BD8   02B8 0056 006A
        MVO@    R0,     R4                      ; 5BDB   0260
        MVI@    R3,     R1                      ; 5BDC   0299
        DECR    R1                              ; 5BDD   0011
        MVO@    R1,     R3                      ; 5BDE   0259
        PULR    R7                              ; 5BDF   02B7

L_5BE0:
        CLRR    R0                              ; 5BE0   01C0
        MVO@    R0,     R3                      ; 5BE1   0258
        INCR    R3                              ; 5BE2   000B
        MVO@    R0,     R3                      ; 5BE3   0258
        SDBD                                    ; 5BE4   0001
        MVII    #$FFFF, R0                      ; 5BE5   02B8 00FF 00FF
        MVO@    R0,     R4                      ; 5BE8   0260
        SUBI    #$0006, R4                      ; 5BE9   033C 0006
        CLRR    R0                              ; 5BEB   01C0
        MVO@    R0,     R4                      ; 5BEC   0260
        PULR    R7                              ; 5BED   02B7

L_5BEE:
        PSHR    R5                              ; 5BEE   0275
        MVII    #$015D, R4                      ; 5BEF   02BC 015D
        MVI     G_01EF, R3                      ; 5BF1   0283 01EF
        ADDR    R3,     R4                      ; 5BF3   00DC
        ADDR    R0,     R4                      ; 5BF4   00C4
        MVI@    R4,     R3                      ; 5BF5   02A3
        MOVR    R1,     R0                      ; 5BF6   0088

        JSR     R5,     X_POW2                  ; 5BF7   0004 0114 0345

        ANDR    R0,     R3                      ; 5BFA   0183
        BEQ     L_5C00                          ; 5BFB   0204 0003

        MVII    #$0001, R0                      ; 5BFD   02B8 0001
        PULR    R7                              ; 5BFF   02B7

L_5C00:
        CLRR    R0                              ; 5C00   01C0
        PULR    R7                              ; 5C01   02B7

L_5C02:
        PSHR    R5                              ; 5C02   0275
        SDBD                                    ; 5C03   0001
        MVII    #$0324, R4                      ; 5C04   02BC 0024 0003
        MVO@    R0,     R4                      ; 5C07   0260
        SDBD                                    ; 5C08   0001
        MVII    #$032C, R4                      ; 5C09   02BC 002C 0003
        MVO@    R0,     R4                      ; 5C0C   0260
        SDBD                                    ; 5C0D   0001
        MVII    #$018B, R4                      ; 5C0E   02BC 008B 0001
        MVI     G_01D6, R0                      ; 5C11   0280 01D6
        MVO@    R0,     R4                      ; 5C13   0260
        PULR    R7                              ; 5C14   02B7

L_5C15:
        PSHR    R5                              ; 5C15   0275
        MOVR    R0,     R2                      ; 5C16   0082
        COMR    R0                              ; 5C17   0018
        ANDR    R1,     R0                      ; 5C18   0188
        XORR    R2,     R0                      ; 5C19   01D0
        PULR    R7                              ; 5C1A   02B7

L_5C1B:
        PSHR    R5                              ; 5C1B   0275
        SDBD                                    ; 5C1C   0001
        MVII    #$0800, R0                      ; 5C1D   02B8 0000 0008
        MVII    #$0251, R4                      ; 5C20   02BC 0251
        CLRR    R1                              ; 5C22   01C9
L_5C23:
        ADDI    #$0013, R4                      ; 5C23   02FC 0013
        MVO@    R0,     R4                      ; 5C25   0260
        INCR    R1                              ; 5C26   0009
        CMPI    #$0006, R1                      ; 5C27   0379 0006
        BNEQ    L_5C23                          ; 5C29   022C 0007

        MVII    #$0173, R3                      ; 5C2B   02BB 0173
        ADD     G_01EF, R3                      ; 5C2D   02C3 01EF
        MVI@    R3,     R2                      ; 5C2F   029A
        MVII    #$0251, R4                      ; 5C30   02BC 0251
        TSTR    R2                              ; 5C32   0092
        BEQ     L_5C41                          ; 5C33   0204 000C

        CLRR    R1                              ; 5C35   01C9
        SDBD                                    ; 5C36   0001
        MVII    #$1C50, R0                      ; 5C37   02B8 0050 001C
L_5C3A:
        ADDI    #$0013, R4                      ; 5C3A   02FC 0013
        MVO@    R0,     R4                      ; 5C3C   0260
        INCR    R1                              ; 5C3D   0009
        CMPR    R1,     R2                      ; 5C3E   014A
        BNEQ    L_5C3A                          ; 5C3F   022C 0006
L_5C41:
        PULR    R7                              ; 5C41   02B7

L_5C42:
        PSHR    R5                              ; 5C42   0275
        CLRR    R2                              ; 5C43   01D2
        MVII    #$0162, R5                      ; 5C44   02BD 0162
        MVI     G_01EF, R1                      ; 5C46   0281 01EF
        ADDR    R1,     R5                      ; 5C48   00CD
        SDBD                                    ; 5C49   0001
        MVI@    R5,     R1                      ; 5C4A   02A9
        ADDR    R0,     R1                      ; 5C4B   00C1
        SDBD                                    ; 5C4C   0001
        CMPI    #$2710, R1                      ; 5C4D   0379 0010 0027
        BLT     L_5C5E                          ; 5C50   0205 000C

        MVII    #$0053, R2                      ; 5C52   02BA 0053
        MVI@    R5,     R0                      ; 5C54   02A8
        INCR    R0                              ; 5C55   0008
        DECR    R5                              ; 5C56   0015
        PSHR    R5                              ; 5C57   0275
        MVO@    R0,     R5                      ; 5C58   0268
        SDBD                                    ; 5C59   0001
        SUBI    #$2710, R1                      ; 5C5A   0339 0010 0027
        PULR    R5                              ; 5C5D   02B5
L_5C5E:
        DECR    R5                              ; 5C5E   0015
        DECR    R5                              ; 5C5F   0015
        MVO@    R1,     R5                      ; 5C60   0269
        SWAP    R1,     1                       ; 5C61   0041
        MVO@    R1,     R5                      ; 5C62   0269
        CMPI    #$0053, R2                      ; 5C63   037A 0053
        BNEQ    L_5C78                          ; 5C65   020C 0011

        MVII    #$0173, R3                      ; 5C67   02BB 0173
        ADD     G_01EF, R3                      ; 5C69   02C3 01EF
        MVI@    R3,     R1                      ; 5C6B   0299
        CMPI    #$0006, R1                      ; 5C6C   0379 0006
        BEQ     L_5C78                          ; 5C6E   0204 0008

        INCR    R1                              ; 5C70   0009
        MVO@    R1,     R3                      ; 5C71   0259

        JSR     R5,     L_5C1B                  ; 5C72   0004 015C 001B
        JSR     R5,     L_6FA4                  ; 5C75   0004 016C 03A4

L_5C78:
        PULR    R7                              ; 5C78   02B7

L_5C79:
        PSHR    R5                              ; 5C79   0275
        MVII    #$0162, R5                      ; 5C7A   02BD 0162
        MVI     G_01EF, R1                      ; 5C7C   0281 01EF
        ADDR    R1,     R5                      ; 5C7E   00CD
        SDBD                                    ; 5C7F   0001
        MVI@    R5,     R0                      ; 5C80   02A8
        PSHR    R5                              ; 5C81   0275
        MVI     G_01EF, R1                      ; 5C82   0281 01EF
        TSTR    R1                              ; 5C84   0089
        BEQ     L_5C8B                          ; 5C85   0204 0004

        MVII    #$0210, R4                      ; 5C87   02BC 0210
        B       L_5C8D                          ; 5C89   0200 0002

L_5C8B:
        MVII    #$0202, R4                      ; 5C8B   02BC 0202
L_5C8D:
        MVII    #$0007, R3                      ; 5C8D   02BB 0007
        MVII    #$0004, R1                      ; 5C8F   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 5C91   0004 0118 00AD

        PULR    R5                              ; 5C94   02B5
        MVI@    R5,     R0                      ; 5C95   02A8
        MVI     G_01EF, R1                      ; 5C96   0281 01EF
        TSTR    R1                              ; 5C98   0089
        BEQ     L_5C9F                          ; 5C99   0204 0004

        MVII    #$020E, R4                      ; 5C9B   02BC 020E
        B       L_5CA1                          ; 5C9D   0200 0002

L_5C9F:
        MVII    #$0200, R4                      ; 5C9F   02BC 0200
L_5CA1:
        MVII    #$0007, R3                      ; 5CA1   02BB 0007
        MVII    #$0002, R1                      ; 5CA3   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 5CA5   0004 0118 00AD

        MVII    #$0005, R3                      ; 5CA8   02BB 0005
        SDBD                                    ; 5CAA   0001
        MVII    #$0800, R2                      ; 5CAB   02BA 0000 0008
        MVI     G_01EF, R0                      ; 5CAE   0280 01EF
        TSTR    R0                              ; 5CB0   0080
        BNEQ    L_5CB7                          ; 5CB1   020C 0004

        MVII    #$0200, R3                      ; 5CB3   02BB 0200
        B       L_5CB9                          ; 5CB5   0200 0002

L_5CB7:
        MVII    #$020E, R3                      ; 5CB7   02BB 020E
L_5CB9:
        MVI@    R3,     R1                      ; 5CB9   0299
        ANDI    #$00F8, R1                      ; 5CBA   03B9 00F8
        CMPI    #$0080, R1                      ; 5CBC   0379 0080
        BNEQ    L_5CC5                          ; 5CBE   020C 0005

        MVO@    R2,     R3                      ; 5CC0   025A
        INCR    R3                              ; 5CC1   000B
        DECR    R5                              ; 5CC2   0015
        BNEQ    L_5CB9                          ; 5CC3   022C 000B
L_5CC5:
        PULR    R7                              ; 5CC5   02B7

L_5CC6:
        PSHR    R5                              ; 5CC6   0275
        MVII    #$02E1, R4                      ; 5CC7   02BC 02E1
        MVII    #$0117, R0                      ; 5CC9   02B8 0117
        MVO@    R0,     R4                      ; 5CCB   0260
        MVII    #$017F, R0                      ; 5CCC   02B8 017F
        MVO@    R0,     R4                      ; 5CCE   0260
        MVII    #$0177, R0                      ; 5CCF   02B8 0177
        MVO@    R0,     R4                      ; 5CD1   0260
        MVII    #$01AF, R0                      ; 5CD2   02B8 01AF
        MVO@    R0,     R4                      ; 5CD4   0260
        MVII    #$019F, R0                      ; 5CD5   02B8 019F
        MVO@    R0,     R4                      ; 5CD7   0260
        CLRR    R0                              ; 5CD8   01C0
        MVO@    R0,     R4                      ; 5CD9   0260
        MVII    #$017A, R4                      ; 5CDA   02BC 017A
        ADD     G_01EF, R4                      ; 5CDC   02C4 01EF
        PSHR    R4                              ; 5CDE   0274
        SDBD                                    ; 5CDF   0001
        MVI@    R4,     R0                      ; 5CE0   02A0
        SDBD                                    ; 5CE1   0001
        CMPI    #$1388, R0                      ; 5CE2   0378 0088 0013
        BNEQ    L_5CEA                          ; 5CE5   020C 0003

        PULR    R4                              ; 5CE7   02B4
        B       L_5CF1                          ; 5CE8   0200 0007

L_5CEA:
        ADDI    #$007D, R0                      ; 5CEA   02F8 007D
        PULR    R4                              ; 5CEC   02B4
        MVO@    R0,     R4                      ; 5CED   0260
        SWAP    R0,     1                       ; 5CEE   0040
        MVO@    R0,     R4                      ; 5CEF   0260
        SWAP    R0,     1                       ; 5CF0   0040
L_5CF1:
        PSHR    R0                              ; 5CF1   0270
        MVII    #$02E7, R4                      ; 5CF2   02BC 02E7
        MVII    #$0007, R3                      ; 5CF4   02BB 0007
        MVII    #$0004, R1                      ; 5CF6   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 5CF8   0004 0118 00AD

        PULR    R0                              ; 5CFB   02B0

        JSR     R5,     L_5C42                  ; 5CFC   0004 015C 0042
        JSR     R5,     L_5C79                  ; 5CFF   0004 015C 0079

        PULR    R7                              ; 5D02   02B7

L_5D03:
        PSHR    R5                              ; 5D03   0275
        CLRR    R2                              ; 5D04   01D2
        MVII    #$015D, R3                      ; 5D05   02BB 015D
        ADD     G_01EF, R3                      ; 5D07   02C3 01EF
        MVI@    R3,     R1                      ; 5D09   0299
        MVO@    R2,     R3                      ; 5D0A   025A
        SWAP    R1,     1                       ; 5D0B   0041
        INCR    R3                              ; 5D0C   000B
        MVI@    R3,     R0                      ; 5D0D   0298
        MVO@    R2,     R3                      ; 5D0E   025A

        JSR     R5,     L_5C15                  ; 5D0F   0004 015C 0015

        MVII    #$0010, R1                      ; 5D12   02B9 0010
L_5D14:
        RLC     R0,     1                       ; 5D14   0050
        PSHR    R0                              ; 5D15   0270
        PSHR    R1                              ; 5D16   0271
        BNC     L_5D1E                          ; 5D17   0209 0005

        MVII    #$0032, R0                      ; 5D19   02B8 0032

        JSR     R5,     L_5C42                  ; 5D1B   0004 015C 0042

L_5D1E:
        PULR    R1                              ; 5D1E   02B1
        PULR    R0                              ; 5D1F   02B0
        DECR    R1                              ; 5D20   0011
        BNEQ    L_5D14                          ; 5D21   022C 000E

        JSR     R5,     L_5C79                  ; 5D23   0004 015C 0079

        PULR    R7                              ; 5D26   02B7

        PSHR    R5                              ; 5D27   0275
        MVI     G_01E1, R0                      ; 5D28   0280 01E1
        CMPI    #$0005, R0                      ; 5D2A   0378 0005
        BEQ     L_5DB2                          ; 5D2C   0204 0084

        CMPI    #$0004, R0                      ; 5D2E   0378 0004
        BEQ     L_5DB2                          ; 5D30   0204 0080

        JSR     R5,     L_6F22                  ; 5D32   0004 016C 0322

        B       L_5D93                          ; 5D35   0200 005C

        PSHR    R5                              ; 5D37   0275
        MVI     G_01E1, R0                      ; 5D38   0280 01E1
        CMPI    #$0005, R0                      ; 5D3A   0378 0005
        BEQ     L_5DB2                          ; 5D3C   0204 0074

        CMPI    #$0004, R0                      ; 5D3E   0378 0004
        BEQ     L_5DB2                          ; 5D40   0204 0070

        JSR     R5,     L_54E8                  ; 5D42   0004 0154 00E8

        SDBD                                    ; 5D45   0001
        MVII    #$FFFF, R0                      ; 5D46   02B8 00FF 00FF
        MVO     R0,     G_033B                  ; 5D49   0240 033B
        MVO     R0,     G_0343                  ; 5D4B   0240 0343
        CLRR    R0                              ; 5D4D   01C0
        MVO     R0,     G_0336                  ; 5D4E   0240 0336
        MVO     R0,     G_033E                  ; 5D50   0240 033E
        MVO     R0,     G_01E5                  ; 5D52   0240 01E5
        MVO     R0,     G_01E7                  ; 5D54   0240 01E7
        MVII    #$012C, R0                      ; 5D56   02B8 012C

        JSR     R5,     L_5C42                  ; 5D58   0004 015C 0042
        JSR     R5,     L_5C79                  ; 5D5B   0004 015C 0079

        PULR    R7                              ; 5D5E   02B7

        PSHR    R5                              ; 5D5F   0275
        MVI     G_01E1, R0                      ; 5D60   0280 01E1
        CMPI    #$0005, R0                      ; 5D62   0378 0005
        BEQ     L_5DB2                          ; 5D64   0204 004C

        MVII    #$0356, R4                      ; 5D66   02BC 0356
        CLRR    R0                              ; 5D68   01C0
        MVO     R0,     G_01ED                  ; 5D69   0240 01ED
        MVO@    R0,     R4                      ; 5D6B   0260
        MVII    #$0007, R0                      ; 5D6C   02B8 0007

        JSR     R5,     L_6F4B                  ; 5D6E   0004 016C 034B

        MVII    #$0064, R0                      ; 5D71   02B8 0064

        JSR     R5,     L_5C42                  ; 5D73   0004 015C 0042
        JSR     R5,     L_5C79                  ; 5D76   0004 015C 0079

        MVII    #$0004, R0                      ; 5D79   02B8 0004
        MVO     R0,     G_01E1                  ; 5D7B   0240 01E1
        MVII    #$0050, R0                      ; 5D7D   02B8 0050
        MVII    #$018C, R4                      ; 5D7F   02BC 018C
        MVO@    R0,     R4                      ; 5D81   0260
        PULR    R7                              ; 5D82   02B7

        PSHR    R5                              ; 5D83   0275
        MVI     G_01E1, R0                      ; 5D84   0280 01E1
        CMPI    #$0005, R0                      ; 5D86   0378 0005
        BEQ     L_5DB2                          ; 5D88   0204 0028

        CMPI    #$0004, R0                      ; 5D8A   0378 0004
        BEQ     L_5DB2                          ; 5D8C   0204 0024

        JSR     R5,     L_6EC4                  ; 5D8E   0004 016C 02C4

        B       L_5D93                          ; 5D91   0200 0000

L_5D93:
        MVII    #$0005, R0                      ; 5D93   02B8 0005
        MVO     R0,     G_01E1                  ; 5D95   0240 01E1
        MVII    #$0001, R0                      ; 5D97   02B8 0001
        MVO     R0,     G_01BC                  ; 5D99   0240 01BC
        CLRR    R0                              ; 5D9B   01C0
        MVO     R0,     G_0188                  ; 5D9C   0240 0188
        MVII    #$0325, R3                      ; 5D9E   02BB 0325
        MVI@    R3,     R0                      ; 5DA0   0298
        SDBD                                    ; 5DA1   0001
        ANDI    #$F7FF, R0                      ; 5DA2   03B8 00FF 00F7
        MVO@    R0,     R3                      ; 5DA5   0258
        MVII    #$018B, R3                      ; 5DA6   02BB 018B
        SDBD                                    ; 5DA8   0001
        MVII    #$FFFF, R0                      ; 5DA9   02B8 00FF 00FF
        MVO@    R0,     R3                      ; 5DAC   0258
        MVII    #$0010, R0                      ; 5DAD   02B8 0010
        MVII    #$018C, R4                      ; 5DAF   02BC 018C
        MVO@    R0,     R4                      ; 5DB1   0260
L_5DB2:
        PULR    R7                              ; 5DB2   02B7

        PSHR    R5                              ; 5DB3   0275
        MVI     G_01E3, R0                      ; 5DB4   0280 01E3
        CMPI    #$000A, R0                      ; 5DB6   0378 000A
        BEQ     L_5DBB                          ; 5DB8   0204 0001
        PULR    R7                              ; 5DBA   02B7

L_5DBB:
        JSR     R5,     L_54DD                  ; 5DBB   0004 0154 00DD

        MVI     G_01D5, R0                      ; 5DBE   0280 01D5
        MVO     R0,     G_01DB                  ; 5DC0   0240 01DB
        MVII    #$01F4, R0                      ; 5DC2   02B8 01F4

        JSR     R5,     L_5C42                  ; 5DC4   0004 015C 0042
        JSR     R5,     L_5C79                  ; 5DC7   0004 015C 0079

        SDBD                                    ; 5DCA   0001
        MVII    #$032E, R4                      ; 5DCB   02BC 002E 0003
        CLRR    R0                              ; 5DCE   01C0
        MVO@    R0,     R4                      ; 5DCF   0260
        SDBD                                    ; 5DD0   0001
        MVII    #$FFFF, R0                      ; 5DD1   02B8 00FF 00FF
        MVII    #$0333, R4                      ; 5DD4   02BC 0333
        MVO@    R0,     R4                      ; 5DD6   0260
        CLRR    R0                              ; 5DD7   01C0
        MVO     R0,     G_01E3                  ; 5DD8   0240 01E3
        MVO     R0,     G_01AE                  ; 5DDA   0240 01AE
        PULR    R7                              ; 5DDC   02B7

        PSHR    R5                              ; 5DDD   0275
        MVI     G_01BE, R0                      ; 5DDE   0280 01BE
        CMPI    #$0007, R0                      ; 5DE0   0378 0007
        BEQ     L_5E02                          ; 5DE2   0204 001E

        CMPI    #$0003, R0                      ; 5DE4   0378 0003
        BNEQ    L_5DE9                          ; 5DE6   020C 0001
        PULR    R7                              ; 5DE8   02B7

L_5DE9:
        SDBD                                    ; 5DE9   0001
        MVII    #$0160, R4                      ; 5DEA   02BC 0060 0001
        ADD     G_01EF, R4                      ; 5DED   02C4 01EF
        MVI@    R4,     R1                      ; 5DEF   02A1
        TSTR    R1                              ; 5DF0   0089
        BEQ     L_5E0D                          ; 5DF1   0204 001A

        JSR     R5,     L_5E69                  ; 5DF3   0004 015C 0269
        JSR     R5,     L_54BE                  ; 5DF6   0004 0154 00BE

        MVII    #$0001, R0                      ; 5DF9   02B8 0001
        MVO     R0,     G_0184                  ; 5DFB   0240 0184
        MVII    #$0009, R0                      ; 5DFD   02B8 0009
        MVO     R0,     G_01E1                  ; 5DFF   0240 01E1
        PULR    R7                              ; 5E01   02B7

L_5E02:
        MVII    #$0005, R0                      ; 5E02   02B8 0005
        MVO     R0,     G_01BE                  ; 5E04   0240 01BE

        JSR     R5,     L_5E69                  ; 5E06   0004 015C 0269

        MVII    #$0018, R0                      ; 5E09   02B8 0018
        MVO     R0,     G_018B                  ; 5E0B   0240 018B
L_5E0D:
        PULR    R7                              ; 5E0D   02B7

        PSHR    R5                              ; 5E0E   0275
        MVII    #$01E4, R3                      ; 5E0F   02BB 01E4
        MVI@    R3,     R1                      ; 5E11   0299
        CMPI    #$000A, R1                      ; 5E12   0379 000A
        BEQ     L_5E29                          ; 5E14   0204 0013

        CMPI    #$0011, R1                      ; 5E16   0379 0011
        BEQ     L_5E29                          ; 5E18   0204 000F

        CLRR    R0                              ; 5E1A   01C0
        MVO     R0,     G_0336                  ; 5E1B   0240 0336
        MVO     R0,     G_01E5                  ; 5E1D   0240 01E5
        MVO     R0,     G_033E                  ; 5E1F   0240 033E
        MVO     R0,     G_01E7                  ; 5E21   0240 01E7
        DECR    R0                              ; 5E23   0010
        MVO     R0,     G_033B                  ; 5E24   0240 033B

        JSR     R5,     L_54E8                  ; 5E26   0004 0154 00E8

L_5E29:
        PULR    R7                              ; 5E29   02B7

        PSHR    R5                              ; 5E2A   0275
        MVII    #$01E8, R3                      ; 5E2B   02BB 01E8
        MVI@    R3,     R1                      ; 5E2D   0299
        CMPI    #$000A, R1                      ; 5E2E   0379 000A
        BEQ     L_5E3E                          ; 5E30   0204 000C

        CMPI    #$0011, R1                      ; 5E32   0379 0011
        BEQ     L_5E3E                          ; 5E34   0204 0008

        CLRR    R0                              ; 5E36   01C0
        MVO     R0,     G_0346                  ; 5E37   0240 0346
        MVO     R0,     G_01E9                  ; 5E39   0240 01E9
        DECR    R0                              ; 5E3B   0010
        MVO     R0,     G_034B                  ; 5E3C   0240 034B
L_5E3E:
        PULR    R7                              ; 5E3E   02B7

        PSHR    R5                              ; 5E3F   0275
        MVII    #$01EA, R3                      ; 5E40   02BB 01EA
        MVI@    R3,     R1                      ; 5E42   0299
        CMPI    #$000A, R1                      ; 5E43   0379 000A
        BEQ     L_5E53                          ; 5E45   0204 000C

        CMPI    #$0011, R1                      ; 5E47   0379 0011
        BEQ     L_5E53                          ; 5E49   0204 0008

        CLRR    R0                              ; 5E4B   01C0
        MVO     R0,     G_034E                  ; 5E4C   0240 034E
        MVO     R0,     G_01EB                  ; 5E4E   0240 01EB
        DECR    R0                              ; 5E50   0010
        MVO     R0,     G_0353                  ; 5E51   0240 0353
L_5E53:
        PULR    R7                              ; 5E53   02B7

        PSHR    R5                              ; 5E54   0275
        MVII    #$01EC, R3                      ; 5E55   02BB 01EC
        MVI@    R3,     R1                      ; 5E57   0299
        CMPI    #$000A, R1                      ; 5E58   0379 000A
        BEQ     L_5E68                          ; 5E5A   0204 000C

        CMPI    #$0011, R1                      ; 5E5C   0379 0011
        BEQ     L_5E68                          ; 5E5E   0204 0008

        CLRR    R0                              ; 5E60   01C0
        MVO     R0,     G_0356                  ; 5E61   0240 0356
        MVO     R0,     G_01ED                  ; 5E63   0240 01ED
        DECR    R0                              ; 5E65   0010
        MVO     R0,     G_035B                  ; 5E66   0240 035B
L_5E68:
        PULR    R7                              ; 5E68   02B7

L_5E69:
        PSHR    R5                              ; 5E69   0275
        SDBD                                    ; 5E6A   0001
        MVII    #$031E, R4                      ; 5E6B   02BC 001E 0003
        CLRR    R0                              ; 5E6E   01C0
        MVO     R0,     G_018B                  ; 5E6F   0240 018B
        MVO@    R0,     R4                      ; 5E71   0260
        MVII    #$0326, R4                      ; 5E72   02BC 0326
        MVO@    R0,     R4                      ; 5E74   0260
        MVII    #$0001, R0                      ; 5E75   02B8 0001
        MVO     R0,     G_01BC                  ; 5E77   0240 01BC
        MVO     R0,     G_0184                  ; 5E79   0240 0184
        PULR    R7                              ; 5E7B   02B7

L_5E7C:
        PSHR    R5                              ; 5E7C   0275

        JSR     R5,     L_5E87                  ; 5E7D   0004 015C 0287
        JSR     R5,     L_5E9A                  ; 5E80   0004 015C 029A
        JSR     R5,     L_5EB1                  ; 5E83   0004 015C 02B1

        PULR    R7                              ; 5E86   02B7

L_5E87:
        PSHR    R5                              ; 5E87   0275
        MVII    #$0010, R0                      ; 5E88   02B8 0010
        SDBD                                    ; 5E8A   0001
        MVII    #$031D, R1                      ; 5E8B   02B9 001D 0003
        SDBD                                    ; 5E8E   0001
        MVII    #$69B8, R4                      ; 5E8F   02BC 00B8 0069

        JSR     R5,     L_58B6                  ; 5E92   0004 0158 00B6

        MVII    #$0001, R0                      ; 5E95   02B8 0001
        MVO     R0,     G_01BE                  ; 5E97   0240 01BE
        PULR    R7                              ; 5E99   02B7

L_5E9A:
        PSHR    R5                              ; 5E9A   0275
        MVII    #$015D, R4                      ; 5E9B   02BC 015D
        MVI     G_01EF, R1                      ; 5E9D   0281 01EF
        ADDR    R1,     R4                      ; 5E9F   00CC
        ADDI    #$0002, R4                      ; 5EA0   02FC 0002
        MVII    #$0009, R0                      ; 5EA2   02B8 0009
        MVO@    R0,     R4                      ; 5EA4   0260
        MVII    #$0001, R0                      ; 5EA5   02B8 0001
        MVO@    R0,     R4                      ; 5EA7   0260
        MVII    #$0009, R0                      ; 5EA8   02B8 0009
        MVO@    R0,     R4                      ; 5EAA   0260
        ADDI    #$0012, R4                      ; 5EAB   02FC 0012
        MVII    #$0001, R0                      ; 5EAD   02B8 0001
        MVO@    R0,     R4                      ; 5EAF   0260
        PULR    R7                              ; 5EB0   02B7

L_5EB1:
        PSHR    R5                              ; 5EB1   0275
        CLRR    R0                              ; 5EB2   01C0
        MVO     R0,     G_0184                  ; 5EB3   0240 0184
        SDBD                                    ; 5EB5   0001
        MVII    #$FFFF, R0                      ; 5EB6   02B8 00FF 00FF
        MVO     R0,     G_018B                  ; 5EB9   0240 018B
        CMPI    #$0053, R3                      ; 5EBB   037B 0053
        BEQ     L_5EC2                          ; 5EBD   0204 0003

        CLRR    R0                              ; 5EBF   01C0
        MVO     R0,     G_01BC                  ; 5EC0   0240 01BC

L_5EC2:
        JSR     R5,     L_5532                  ; 5EC2   0004 0154 0132

        PULR    R7                              ; 5EC5   02B7

L_5EC6:
        PSHR    R5                              ; 5EC6   0275
        MVI@    R4,     R5                      ; 5EC7   02A5
        MVI@    R5,     R1                      ; 5EC8   02A9
        CMPI    #$03F7, R1                      ; 5EC9   0379 03F7
        BEQ     L_5EEB                          ; 5ECB   0204 001E

        SLL     R1,     1                       ; 5ECD   0049
        SLL     R1,     1                       ; 5ECE   0049
        SLL     R1,     1                       ; 5ECF   0049
        NOP                                     ; 5ED0   0034
        SLL     R1,     1                       ; 5ED1   0049
        SLL     R1,     1                       ; 5ED2   0049
        SLL     R1,     1                       ; 5ED3   0049
        SUBI    #$0006, R4                      ; 5ED4   033C 0006
        MVI@    R4,     R2                      ; 5ED6   02A2
        ADDR    R1,     R2                      ; 5ED7   00CA
        DECR    R4                              ; 5ED8   0014
        MVO@    R2,     R4                      ; 5ED9   0262
        MVI@    R4,     R2                      ; 5EDA   02A2
        MVI@    R5,     R1                      ; 5EDB   02A9
        SLL     R1,     1                       ; 5EDC   0049
        SLL     R1,     1                       ; 5EDD   0049
        SLL     R1,     1                       ; 5EDE   0049
        NOP                                     ; 5EDF   0034
        SLL     R1,     1                       ; 5EE0   0049
        SLL     R1,     1                       ; 5EE1   0049
        SLL     R1,     1                       ; 5EE2   0049
        ADDR    R1,     R2                      ; 5EE3   00CA
        DECR    R4                              ; 5EE4   0014
        MVO@    R2,     R4                      ; 5EE5   0262
        ADDI    #$0003, R4                      ; 5EE6   02FC 0003
        MOVR    R5,     R0                      ; 5EE8   00A8
        MVO@    R0,     R4                      ; 5EE9   0260
        PULR    R7                              ; 5EEA   02B7

L_5EEB:
        SDBD                                    ; 5EEB   0001
        MVII    #$FFFF, R0                      ; 5EEC   02B8 00FF 00FF
        PULR    R7                              ; 5EEF   02B7

L_5EF0:
        PSHR    R5                              ; 5EF0   0275
        MVI     G_0181, R1                      ; 5EF1   0281 0181
        DECR    R1                              ; 5EF3   0011
        TSTR    R1                              ; 5EF4   0089
        BNEQ    L_5F03                          ; 5EF5   020C 000C

        MVII    #$0005, R0                      ; 5EF7   02B8 0005
        MVO     R0,     G_01BE                  ; 5EF9   0240 01BE
        SDBD                                    ; 5EFB   0001
        MVII    #$FFFF, R0                      ; 5EFC   02B8 00FF 00FF
        MVII    #$018B, R4                      ; 5EFF   02BC 018B
        MVO@    R0,     R4                      ; 5F01   0260
        PULR    R7                              ; 5F02   02B7

L_5F03:
        MVO     R1,     G_0181                  ; 5F03   0241 0181
        MVI     G_0182, R3                      ; 5F05   0283 0182
        MVII    #$031F, R4                      ; 5F07   02BC 031F

        JSR     R5,     L_5F12                  ; 5F09   0004 015C 0312

        MVII    #$0327, R4                      ; 5F0C   02BC 0327

        JSR     R5,     L_5F12                  ; 5F0E   0004 015C 0312

        PULR    R7                              ; 5F11   02B7

L_5F12:
        PSHR    R5                              ; 5F12   0275
        MVI@    R4,     R1                      ; 5F13   02A1
        MVI@    R4,     R2                      ; 5F14   02A2
        SUBI    #$0002, R4                      ; 5F15   033C 0002
        CMPI    #$0001, R3                      ; 5F17   037B 0001
        BEQ     L_5F1F                          ; 5F19   0204 0004

        ADDI    #$0200, R1                      ; 5F1B   02F9 0200
        B       L_5F21                          ; 5F1D   0200 0002

L_5F1F:
        SUBI    #$0200, R1                      ; 5F1F   0339 0200
L_5F21:
        MVO@    R1,     R4                      ; 5F21   0261
        SDBD                                    ; 5F22   0001
        SUBI    #$0400, R2                      ; 5F23   033A 0000 0004
        MVO@    R2,     R4                      ; 5F26   0262
        PULR    R7                              ; 5F27   02B7

        MVII    #$018C, R4                      ; 5F28   02BC 018C
        MVI@    R4,     R0                      ; 5F2A   02A0
        DECR    R0                              ; 5F2B   0010
        DECR    R4                              ; 5F2C   0014
        MVO@    R0,     R4                      ; 5F2D   0260
        TSTR    R0                              ; 5F2E   0080
        BEQ     L_5F38                          ; 5F2F   0204 0007

        MVI     G_01E1, R0                      ; 5F31   0280 01E1
        CMPI    #$0004, R0                      ; 5F33   0378 0004
        BEQ     L_6047                          ; 5F35   0204 0110
        PULR    R7                              ; 5F37   02B7

L_5F38:
        MVII    #$0001, R0                      ; 5F38   02B8 0001
        DECR    R4                              ; 5F3A   0014
        MVO@    R0,     R4                      ; 5F3B   0260
        MVI     G_01E1, R0                      ; 5F3C   0280 01E1
        TSTR    R0                              ; 5F3E   0080
        BNEQ    L_5F42                          ; 5F3F   020C 0001
        PULR    R7                              ; 5F41   02B7

L_5F42:
        CMPI    #$0001, R0                      ; 5F42   0378 0001
        BNEQ    L_5F48                          ; 5F44   020C 0002
        B       L_6047                          ; 5F46   0200 00FF

L_5F48:
        CMPI    #$0002, R0                      ; 5F48   0378 0002
        BNEQ    L_5F75                          ; 5F4A   020C 0029

        MVI     G_01BF, R1                      ; 5F4C   0281 01BF
        DECR    R1                              ; 5F4E   0011
        MVO     R1,     G_01BF                  ; 5F4F   0241 01BF
        RSWD    R1                              ; 5F51   0039
        BEQ     L_5F68                          ; 5F52   0204 0014

        MVII    #$0002, R0                      ; 5F54   02B8 0002
        DECR    R4                              ; 5F56   0014
        MVO@    R0,     R4                      ; 5F57   0260
        ANDI    #$0001, R1                      ; 5F58   03B9 0001
        BEQ     L_5F62                          ; 5F5A   0204 0006

        MVI     G_01CD, R0                      ; 5F5C   0280 01CD

        JSR     R5,     L_68C7                  ; 5F5E   0004 0168 00C7

        PULR    R7                              ; 5F61   02B7

L_5F62:
        MVI     G_01CF, R0                      ; 5F62   0280 01CF

        JSR     R5,     L_68C7                  ; 5F64   0004 0168 00C7

        PULR    R7                              ; 5F67   02B7

L_5F68:
        JSR     R5,     L_5CC6                  ; 5F68   0004 015C 00C6

        MVII    #$0018, R0                      ; 5F6B   02B8 0018
        MVII    #$018C, R3                      ; 5F6D   02BB 018C
        MVO@    R0,     R3                      ; 5F6F   0258
        MVII    #$0015, R0                      ; 5F70   02B8 0015
        MVO     R0,     G_01E1                  ; 5F72   0240 01E1
        PULR    R7                              ; 5F74   02B7

L_5F75:
        CMPI    #$0015, R0                      ; 5F75   0378 0015
        BNEQ    L_5F88                          ; 5F77   020C 000F

        JSR     R5,     L_5D03                  ; 5F79   0004 015C 0103
        JSR     R5,     L_5480                  ; 5F7C   0004 0154 0080

        MVII    #$0018, R0                      ; 5F7F   02B8 0018
        MVO     R0,     G_018C                  ; 5F81   0240 018C
        MVII    #$0003, R0                      ; 5F83   02B8 0003
        MVO     R0,     G_01E1                  ; 5F85   0240 01E1
        PULR    R7                              ; 5F87   02B7

L_5F88:
        CMPI    #$0003, R0                      ; 5F88   0378 0003
        BNEQ    L_5FA0                          ; 5F8A   020C 0014

        JSR     R5,     L_54BE                  ; 5F8C   0004 0154 00BE
        JSR     R5,     L_54DD                  ; 5F8F   0004 0154 00DD
        JSR     R5,     L_5364                  ; 5F92   0004 0150 0364
        JSR     R5,     L_5379                  ; 5F95   0004 0150 0379
        JSR     R5,     L_5E7C                  ; 5F98   0004 015C 027C

        MVII    #$0001, R0                      ; 5F9B   02B8 0001
        MVO     R0,     G_01E1                  ; 5F9D   0240 01E1
        PULR    R7                              ; 5F9F   02B7

L_5FA0:
        CMPI    #$0004, R0                      ; 5FA0   0378 0004
        BNEQ    L_5FAA                          ; 5FA2   020C 0006

        MVII    #$0001, R0                      ; 5FA4   02B8 0001
        MVO     R0,     G_01E1                  ; 5FA6   0240 01E1
        B       L_6047                          ; 5FA8   0200 009D

L_5FAA:
        CMPI    #$0005, R0                      ; 5FAA   0378 0005
        BNEQ    L_5FC2                          ; 5FAC   020C 0014

        MVII    #$0008, R0                      ; 5FAE   02B8 0008
        DECR    R4                              ; 5FB0   0014
        MVO@    R0,     R4                      ; 5FB1   0260

        JSR     R5,     L_54BE                  ; 5FB2   0004 0154 00BE
        JSR     R5,     L_686B                  ; 5FB5   0004 0168 006B

        MVII    #$0009, R0                      ; 5FB8   02B8 0009

        JSR     R5,     L_6F82                  ; 5FBA   0004 016C 0382

        MVII    #$0006, R0                      ; 5FBD   02B8 0006
        MVO     R0,     G_01E1                  ; 5FBF   0240 01E1
        PULR    R7                              ; 5FC1   02B7

L_5FC2:
        CMPI    #$0006, R0                      ; 5FC2   0378 0006
        BNEQ    L_5FDF                          ; 5FC4   020C 0019

        JSR     R5,     L_554A                  ; 5FC6   0004 0154 014A

        MVII    #$0040, R1                      ; 5FC9   02B9 0040
        MVO     R1,     G_018C                  ; 5FCB   0241 018C
        CMPI    #$0001, R0                      ; 5FCD   0378 0001
        BNEQ    L_5FD6                          ; 5FCF   020C 0005

        MVII    #$0007, R0                      ; 5FD1   02B8 0007
        MVO     R0,     G_01E1                  ; 5FD3   0240 01E1
        PULR    R7                              ; 5FD5   02B7

L_5FD6:
        CMPI    #$0002, R0                      ; 5FD6   0378 0002
        BNEQ    L_5FDE                          ; 5FD8   020C 0004

        MVII    #$0008, R0                      ; 5FDA   02B8 0008
        MVO     R0,     G_01E1                  ; 5FDC   0240 01E1
L_5FDE:
        PULR    R7                              ; 5FDE   02B7

L_5FDF:
        CMPI    #$0007, R0                      ; 5FDF   0378 0007
        BNEQ    L_5FEB                          ; 5FE1   020C 0008

        JSR     R5,     L_54F1                  ; 5FE3   0004 0154 00F1

        MVII    #$0001, R0                      ; 5FE6   02B8 0001
        MVO     R0,     G_01E1                  ; 5FE8   0240 01E1
        PULR    R7                              ; 5FEA   02B7

L_5FEB:
        CMPI    #$0008, R0                      ; 5FEB   0378 0008
        BNEQ    L_600A                          ; 5FED   020C 001B

        JSR     R5,     L_5E87                  ; 5FEF   0004 015C 0287

        MVII    #$015D, R4                      ; 5FF2   02BC 015D
        ADD     G_01EF, R4                      ; 5FF4   02C4 01EF
        MVI@    R4,     R1                      ; 5FF6   02A1
        MVO     R1,     G_01D0                  ; 5FF7   0241 01D0
        MVI@    R4,     R1                      ; 5FF9   02A1
        MVO     R1,     G_01D1                  ; 5FFA   0241 01D1

        JSR     R5,     L_5379                  ; 5FFC   0004 0150 0379
        JSR     R5,     L_541E                  ; 5FFF   0004 0154 001E
        JSR     R5,     L_54F1                  ; 6002   0004 0154 00F1

        MVII    #$0001, R0                      ; 6005   02B8 0001
        MVO     R0,     G_01E1                  ; 6007   0240 01E1
        PULR    R7                              ; 6009   02B7

L_600A:
        CMPI    #$0009, R0                      ; 600A   0378 0009
        BNEQ    L_6021                          ; 600C   020C 0013

        JSR     R5,     L_5E87                  ; 600E   0004 015C 0287
        JSR     R5,     L_5E9A                  ; 6011   0004 015C 029A

        MVI     G_01D5, R1                      ; 6014   0281 01D5
        MVO     R1,     G_01DB                  ; 6016   0241 01DB
        MVII    #$0008, R0                      ; 6018   02B8 0008
        MVO     R0,     G_018C                  ; 601A   0240 018C
        MVII    #$0006, R0                      ; 601C   02B8 0006
        MVO     R0,     G_01E1                  ; 601E   0240 01E1
        PULR    R7                              ; 6020   02B7

L_6021:
        CMPI    #$000A, R0                      ; 6021   0378 000A
        BNEQ    L_6042                          ; 6023   020C 001D

        JSR     R5,     L_554A                  ; 6025   0004 0154 014A

        CMPI    #$0001, R0                      ; 6028   0378 0001
        BEQ     L_602D                          ; 602A   0204 0001
        PULR    R7                              ; 602C   02B7

L_602D:
        MVII    #$0173, R3                      ; 602D   02BB 0173
        ADD     G_01EF, R3                      ; 602F   02C3 01EF
        MVI@    R3,     R0                      ; 6031   0298
        DECR    R0                              ; 6032   0010
        MVO@    R0,     R3                      ; 6033   0258

        JSR     R5,     L_5C1B                  ; 6034   0004 015C 001B
        JSR     R5,     L_54DD                  ; 6037   0004 0154 00DD
        JSR     R5,     L_5E7C                  ; 603A   0004 015C 027C

        MVII    #$0001, R0                      ; 603D   02B8 0001
        MVO     R0,     G_01E1                  ; 603F   0240 01E1
        PULR    R7                              ; 6041   02B7

L_6042:
        MVII    #$0001, R0                      ; 6042   02B8 0001
        MVO     R0,     G_01E1                  ; 6044   0240 01E1
        PULR    R7                              ; 6046   02B7

L_6047:
        SDBD                                    ; 6047   0001
        MVII    #$018B, R4                      ; 6048   02BC 008B 0001
        MVI@    R4,     R0                      ; 604B   02A0
        CMPI    #$00FF, R0                      ; 604C   0378 00FF
        BEQ     L_61E0                          ; 604E   0204 0190

        DECR    R4                              ; 6050   0014
        DECR    R0                              ; 6051   0010
        MVO@    R0,     R4                      ; 6052   0260
        TSTR    R0                              ; 6053   0080
        BNEQ    L_61E0                          ; 6054   020C 018A

        MVI     G_01BE, R1                      ; 6056   0281 01BE
        CMPI    #$0005, R1                      ; 6058   0379 0005
        BEQ     L_61CC                          ; 605A   0204 0170

        MVI     G_01D6, R0                      ; 605C   0280 01D6
        DECR    R4                              ; 605E   0014
        MVO@    R0,     R4                      ; 605F   0260
        CMPI    #$0007, R1                      ; 6060   0379 0007
        BNEQ    L_6069                          ; 6062   020C 0005

        JSR     R5,     L_5EF0                  ; 6064   0004 015C 02F0

        B       L_61E0                          ; 6067   0200 0177

L_6069:
        MVII    #$0324, R4                      ; 6069   02BC 0324

        JSR     R5,     L_5EC6                  ; 606B   0004 015C 02C6

        MVII    #$032C, R4                      ; 606E   02BC 032C

        JSR     R5,     L_5EC6                  ; 6070   0004 015C 02C6

        SDBD                                    ; 6073   0001
        CMPI    #$FFFF, R0                      ; 6074   0378 00FF 00FF
        BNEQ    L_61E0                          ; 6077   020C 0167

        MVO     R0,     G_018B                  ; 6079   0240 018B
        MVI     G_01BE, R0                      ; 607B   0280 01BE
        CMPI    #$0001, R0                      ; 607D   0378 0001
        BEQ     L_60A2                          ; 607F   0204 0021

        CMPI    #$0002, R0                      ; 6081   0378 0002
        BEQ     L_60CB                          ; 6083   0204 0046

        CMPI    #$0003, R0                      ; 6085   0378 0003
        BEQ     L_61A2                          ; 6087   0204 0119

        CMPI    #$0004, R0                      ; 6089   0378 0004
        BEQ     L_61C7                          ; 608B   0204 013A

        CMPI    #$0005, R0                      ; 608D   0378 0005
        BEQ     L_61CC                          ; 608F   0204 013B

        CMPI    #$0006, R0                      ; 6091   0378 0006
        BEQ     L_61DE                          ; 6093   0204 0149

        CMPI    #$0009, R0                      ; 6095   0378 0009
        BEQ     L_609B                          ; 6097   0204 0002
        B       L_61E0                          ; 6099   0200 0145

L_609B:
        JSR     R5,     L_5E7C                  ; 609B   0004 015C 027C
        JSR     R5,     L_54DD                  ; 609E   0004 0154 00DD

        PULR    R7                              ; 60A1   02B7

L_60A2:
        JSR     R5,     L_6CCC                  ; 60A2   0004 016C 00CC

        MVII    #$015F, R3                      ; 60A5   02BB 015F
        ADD     G_01EF, R3                      ; 60A7   02C3 01EF
        MVI@    R3,     R1                      ; 60A9   0299
        ADDI    #$0002, R3                      ; 60AA   02FB 0002
        MVO@    R1,     R3                      ; 60AC   0259
        DECR    R3                              ; 60AD   0013
        MVI@    R3,     R2                      ; 60AE   029A
        ADDI    #$0014, R3                      ; 60AF   02FB 0014
        MVO@    R2,     R3                      ; 60B1   025A
        CLRR    R0                              ; 60B2   01C0

        JSR     R5,     L_64A7                  ; 60B3   0004 0164 00A7
        JSR     R5,     L_647F                  ; 60B6   0004 0164 007F

        MVI     G_01BD, R0                      ; 60B9   0280 01BD
        SDBD                                    ; 60BB   0001
        CMPI    #$FFFF, R0                      ; 60BC   0378 00FF 00FF
        BEQ     L_60C6                          ; 60BF   0204 0005

        JSR     R5,     L_5775                  ; 60C1   0004 0154 0375

        B       L_61E0                          ; 60C4   0200 011A

L_60C6:
        CLRR    R0                              ; 60C6   01C0
        MVO     R0,     G_01BC                  ; 60C7   0240 01BC
        B       L_61E0                          ; 60C9   0200 0115

L_60CB:
        MVII    #$0007, R0                      ; 60CB   02B8 0007
        MVO     R0,     G_01BE                  ; 60CD   0240 01BE
        MVII    #$015F, R4                      ; 60CF   02BC 015F
        ADD     G_01EF, R4                      ; 60D1   02C4 01EF
        MVI@    R4,     R1                      ; 60D3   02A1
        MOVR    R1,     R3                      ; 60D4   008B
        ANDI    #$00F8, R1                      ; 60D5   03B9 00F8
        BNEQ    L_60DE                          ; 60D7   020C 0005

        CLRR    R0                              ; 60D9   01C0
        MVO     R0,     G_0182                  ; 60DA   0240 0182
        B       L_60E5                          ; 60DC   0200 0007

L_60DE:
        MVII    #$0001, R1                      ; 60DE   02B9 0001
        MVO     R1,     G_0182                  ; 60E0   0241 0182
        SLR     R3,     1                       ; 60E2   0063
        SLR     R3,     1                       ; 60E3   0063
        SLR     R3,     1                       ; 60E4   0063
L_60E5:
        MVII    #$015D, R4                      ; 60E5   02BC 015D
        MVI     G_01EF, R0                      ; 60E7   0280 01EF
        ADDR    R0,     R4                      ; 60E9   00C4
        ADDR    R1,     R4                      ; 60EA   00CC
        MVI@    R4,     R2                      ; 60EB   02A2
        DECR    R4                              ; 60EC   0014
        MOVR    R3,     R0                      ; 60ED   0098

        JSR     R5,     X_POW2                  ; 60EE   0004 0114 0345

        COMR    R0                              ; 60F1   0018
        ANDR    R0,     R2                      ; 60F2   0182
        MVO@    R2,     R4                      ; 60F3   0262
        MVII    #$01D0, R4                      ; 60F4   02BC 01D0
        ADDR    R1,     R4                      ; 60F6   00CC
        MVO@    R2,     R4                      ; 60F7   0262
        CMPI    #$0001, R3                      ; 60F8   037B 0001
        BNEQ    L_6114                          ; 60FA   020C 0018

        CMPI    #$0001, R1                      ; 60FC   0379 0001
        BEQ     L_610A                          ; 60FE   0204 000A

        MVII    #$0207, R4                      ; 6100   02BC 0207
        SDBD                                    ; 6102   0001
        MVII    #$0800, R1                      ; 6103   02B9 0000 0008
        MVO@    R1,     R4                      ; 6106   0261
        MVO@    R1,     R4                      ; 6107   0261
        B       L_612B                          ; 6108   0200 0021

L_610A:
        MVII    #$020B, R4                      ; 610A   02BC 020B
        SDBD                                    ; 610C   0001
        MVII    #$0800, R1                      ; 610D   02B9 0000 0008
        MVO@    R1,     R4                      ; 6110   0261
        MVO@    R1,     R4                      ; 6111   0261
        B       L_612B                          ; 6112   0200 0017

L_6114:
        SDBD                                    ; 6114   0001
        MVII    #$6A26, R4                      ; 6115   02BC 0026 006A
        CMPI    #$0001, R1                      ; 6118   0379 0001
        BNEQ    L_611E                          ; 611A   020C 0002

        ADDI    #$0005, R4                      ; 611C   02FC 0005
L_611E:
        ADDR    R3,     R4                      ; 611E   00DC
        MVI@    R4,     R1                      ; 611F   02A1
        MOVR    R1,     R4                      ; 6120   008C
        SDBD                                    ; 6121   0001
        MVII    #$0800, R1                      ; 6122   02B9 0000 0008
        MVO@    R1,     R4                      ; 6125   0261
        MVO@    R1,     R4                      ; 6126   0261
        ADDI    #$0012, R4                      ; 6127   02FC 0012
        MVO@    R1,     R4                      ; 6129   0261
        MVO@    R1,     R4                      ; 612A   0261
L_612B:
        MVII    #$015F, R4                      ; 612B   02BC 015F
        MVI     G_01EF, R1                      ; 612D   0281 01EF
        ADDR    R1,     R4                      ; 612F   00CC
        CMPI    #$0006, R3                      ; 6130   037B 0006
        BNEQ    L_613F                          ; 6132   020C 000B

        MVII    #$0016, R1                      ; 6134   02B9 0016
        MVO     R1,     G_0181                  ; 6136   0241 0181
        MVII    #$0019, R0                      ; 6138   02B8 0019

        JSR     R5,     L_6DA1                  ; 613A   0004 016C 01A1

        B       L_6183                          ; 613D   0200 0044

L_613F:
        CMPI    #$0005, R3                      ; 613F   037B 0005
        BNEQ    L_614E                          ; 6141   020C 000B

        MVII    #$0012, R1                      ; 6143   02B9 0012
        MVO     R1,     G_0181                  ; 6145   0241 0181
        MVII    #$0014, R0                      ; 6147   02B8 0014

        JSR     R5,     L_6DA1                  ; 6149   0004 016C 01A1

        B       L_6183                          ; 614C   0200 0035

L_614E:
        CMPI    #$0004, R3                      ; 614E   037B 0004
        BNEQ    L_615D                          ; 6150   020C 000B

        MVII    #$000E, R1                      ; 6152   02B9 000E
        MVO     R1,     G_0181                  ; 6154   0241 0181
        MVII    #$000F, R0                      ; 6156   02B8 000F

        JSR     R5,     L_6DA1                  ; 6158   0004 016C 01A1

        B       L_6183                          ; 615B   0200 0026

L_615D:
        CMPI    #$0003, R3                      ; 615D   037B 0003
        BNEQ    L_616C                          ; 615F   020C 000B

        MVII    #$000A, R1                      ; 6161   02B9 000A
        MVO     R1,     G_0181                  ; 6163   0241 0181
        MVII    #$000A, R0                      ; 6165   02B8 000A

        JSR     R5,     L_6DA1                  ; 6167   0004 016C 01A1

        B       L_6183                          ; 616A   0200 0017

L_616C:
        CMPI    #$0002, R3                      ; 616C   037B 0002
        BNEQ    L_617B                          ; 616E   020C 000B

        MVII    #$0006, R1                      ; 6170   02B9 0006
        MVO     R1,     G_0181                  ; 6172   0241 0181
        MVII    #$0005, R0                      ; 6174   02B8 0005

        JSR     R5,     L_6DA1                  ; 6176   0004 016C 01A1

        B       L_6183                          ; 6179   0200 0008

L_617B:
        MVII    #$0002, R1                      ; 617B   02B9 0002
        MVO@    R1,     R4                      ; 617D   0261
        MVII    #$0002, R0                      ; 617E   02B8 0002

        JSR     R5,     L_6DA1                  ; 6180   0004 016C 01A1

L_6183:
        MVII    #$0325, R4                      ; 6183   02BC 0325
        SDBD                                    ; 6185   0001
        MVII    #$B087, R1                      ; 6186   02B9 0087 00B0
        MVO@    R1,     R4                      ; 6189   0261
        SDBD                                    ; 618A   0001
        MVII    #$50AE, R1                      ; 618B   02B9 00AE 0050
        MVO@    R1,     R4                      ; 618E   0261
        MVII    #$031F, R5                      ; 618F   02BD 031F
        MVI@    R5,     R1                      ; 6191   02A9
        SDBD                                    ; 6192   0001
        SUBI    #$0400, R1                      ; 6193   0339 0000 0004
        MVO@    R1,     R4                      ; 6196   0261
        MVI@    R5,     R1                      ; 6197   02A9
        ADDI    #$0300, R1                      ; 6198   02F9 0300
        MVO@    R1,     R4                      ; 619A   0261
        MVII    #$018B, R4                      ; 619B   02BC 018B
        MVI     G_01D6, R0                      ; 619D   0280 01D6
        MVO@    R0,     R4                      ; 619F   0260
        B       L_61E0                          ; 61A0   0200 003E

L_61A2:
        MVII    #$0004, R0                      ; 61A2   02B8 0004
        MVO     R0,     G_01BE                  ; 61A4   0240 01BE
        MVII    #$0002, R0                      ; 61A6   02B8 0002
        MVO     R0,     G_018C                  ; 61A8   0240 018C
        SDBD                                    ; 61AA   0001
        MVII    #$68F2, R0                      ; 61AB   02B8 00F2 0068

        JSR     R5,     L_5C02                  ; 61AE   0004 015C 0002

        MVII    #$0020, R0                      ; 61B1   02B8 0020
        MVII    #$031D, R4                      ; 61B3   02BC 031D
        MVI@    R4,     R1                      ; 61B5   02A1

        JSR     R5,     L_5C15                  ; 61B6   0004 015C 0015

        DECR    R4                              ; 61B9   0014
        MVO@    R0,     R4                      ; 61BA   0260
        MVII    #$0324, R4                      ; 61BB   02BC 0324

        JSR     R5,     L_5EC6                  ; 61BD   0004 015C 02C6

        MVII    #$032C, R4                      ; 61C0   02BC 032C

        JSR     R5,     L_5EC6                  ; 61C2   0004 015C 02C6

        B       L_61E0                          ; 61C5   0200 0019

L_61C7:
        MVII    #$0009, R0                      ; 61C7   02B8 0009
        MVO     R0,     G_01E1                  ; 61C9   0240 01E1
        PULR    R7                              ; 61CB   02B7

L_61CC:
        MVII    #$0053, R3                      ; 61CC   02BB 0053

        JSR     R5,     L_5E7C                  ; 61CE   0004 015C 027C
        JSR     R5,     L_6CCC                  ; 61D1   0004 016C 00CC

        CLRR    R0                              ; 61D4   01C0

        JSR     R5,     L_64A7                  ; 61D5   0004 0164 00A7
        JSR     R5,     L_647F                  ; 61D8   0004 0164 007F

        CLRR    R0                              ; 61DB   01C0
        MVO     R0,     G_01BC                  ; 61DC   0240 01BC
L_61DE:
        B       L_61E0                          ; 61DE   0200 0000

L_61E0:
        MVI     G_01E1, R0                      ; 61E0   0280 01E1
        CMPI    #$0004, R0                      ; 61E2   0378 0004
        BNEQ    L_61E7                          ; 61E4   020C 0001
        PULR    R7                              ; 61E6   02B7

L_61E7:
        JSR     R5,     L_5949                  ; 61E7   0004 0158 0149

        MVII    #$0333, R4                      ; 61EA   02BC 0333
        MVI@    R4,     R0                      ; 61EC   02A0
        RSWD    R0                              ; 61ED   0038
        BMI     L_6363                          ; 61EE   020B 0173

        DECR    R4                              ; 61F0   0014
        DECR    R0                              ; 61F1   0010
        MVO@    R0,     R4                      ; 61F2   0260
        RSWD    R0                              ; 61F3   0038
        BNEQ    L_6363                          ; 61F4   020C 016D

        MVI     G_01D6, R0                      ; 61F6   0280 01D6
        MVII    #$0333, R4                      ; 61F8   02BC 0333
        MVO@    R0,     R4                      ; 61FA   0260
        MVI     G_01E3, R0                      ; 61FB   0280 01E3
        TSTR    R0                              ; 61FD   0080
        BNEQ    L_6202                          ; 61FE   020C 0002
        B       L_6363                          ; 6200   0200 0161

L_6202:
        CMPI    #$0001, R0                      ; 6202   0378 0001
        BNEQ    L_620F                          ; 6204   020C 0009

        MVII    #$01E2, R3                      ; 6206   02BB 01E2
        MVII    #$0333, R4                      ; 6208   02BC 0333

        JSR     R5,     L_5A95                  ; 620A   0004 0158 0295

        B       L_6363                          ; 620D   0200 0154

L_620F:
        CMPI    #$0002, R0                      ; 620F   0378 0002
        BNEQ    L_6230                          ; 6211   020C 001D

        MVI     G_01DF, R0                      ; 6213   0280 01DF
        INCR    R0                              ; 6215   0008
        MVO     R0,     G_01DF                  ; 6216   0240 01DF
        CMPI    #$0006, R0                      ; 6218   0378 0006
        BNEQ    L_6227                          ; 621A   020C 000B

        MVII    #$0018, R0                      ; 621C   02B8 0018
        MVII    #$0333, R4                      ; 621E   02BC 0333
        MVO@    R0,     R4                      ; 6220   0260
        MVII    #$0006, R0                      ; 6221   02B8 0006
        MVO     R0,     G_01E3                  ; 6223   0240 01E3
        B       L_6363                          ; 6225   0200 013C

L_6227:
        MVII    #$01E2, R3                      ; 6227   02BB 01E2
        MVII    #$0333, R4                      ; 6229   02BC 0333

        JSR     R5,     L_5AB3                  ; 622B   0004 0158 02B3

        B       L_6363                          ; 622E   0200 0133

L_6230:
        CMPI    #$0006, R0                      ; 6230   0378 0006
        BNEQ    L_62CD                          ; 6232   020C 0099

        MVII    #$0008, R0                      ; 6234   02B8 0008
        MVII    #$032D, R1                      ; 6236   02B9 032D
        SDBD                                    ; 6238   0001
        MVII    #$69F8, R4                      ; 6239   02BC 00F8 0069

        JSR     R5,     L_58B6                  ; 623C   0004 0158 00B6

        MVII    #$032F, R4                      ; 623F   02BC 032F
        MVI     G_01E2, R0                      ; 6241   0280 01E2
        SDBD                                    ; 6243   0001
        MVII    #$2C00, R1                      ; 6244   02B9 0000 002C
        MVII    #$000E, R2                      ; 6247   02BA 000E
L_6249:
        CMPR    R2,     R0                      ; 6249   0150
        BEQ     L_6254                          ; 624A   0204 0008

        SDBD                                    ; 624C   0001
        ADDI    #$1000, R1                      ; 624D   02F9 0000 0010
        ADDI    #$0007, R2                      ; 6250   02FA 0007
        B       L_6249                          ; 6252   0220 000A

L_6254:
        MVO@    R1,     R4                      ; 6254   0261

L_6255:
        JSR     R5,     L_66B5                  ; 6255   0004 0164 02B5

        MVI     G_01E2, R0                      ; 6258   0280 01E2
        MOVR    R0,     R1                      ; 625A   0081
        ANDI    #$0007, R0                      ; 625B   03B8 0007
        ANDI    #$0038, R1                      ; 625D   03B9 0038
        TSTR    R0                              ; 625F   0080
        BNEQ    L_62A3                          ; 6260   020C 0041

        MVI     G_01B7, R0                      ; 6262   0280 01B7
        CMPI    #$0003, R0                      ; 6264   0378 0003
        BLT     L_6288                          ; 6266   0205 0020

        MVI     G_01E2, R0                      ; 6268   0280 01E2
        INCR    R0                              ; 626A   0008
        MVO     R0,     G_01E2                  ; 626B   0240 01E2
L_626D:
        MVI     G_01DF, R0                      ; 626D   0280 01DF
        INCR    R0                              ; 626F   0008
        MVO     R0,     G_01DF                  ; 6270   0240 01DF
        MVII    #$0009, R0                      ; 6272   02B8 0009
        MVII    #$015F, R4                      ; 6274   02BC 015F
        ADD     G_01EF, R4                      ; 6276   02C4 01EF
        MVO@    R0,     R4                      ; 6278   0260
        MVII    #$0001, R0                      ; 6279   02B8 0001
        MVO@    R0,     R4                      ; 627B   0260
        J       L_6255                          ; 627C   0004 0360 0255

L_627F:
        MVI     G_01E2, R0                      ; 627F   0280 01E2
        ADDI    #$0008, R0                      ; 6281   02F8 0008
        MVO     R0,     G_01E2                  ; 6283   0240 01E2
        J       L_626D                          ; 6285   0004 0360 026D

L_6288:
        MVII    #$0001, R0                      ; 6288   02B8 0001
        MVO     R0,     G_0184                  ; 628A   0240 0184

        JSR     R5,     L_54C4                  ; 628C   0004 0154 00C4

        MVII    #$0334, R4                      ; 628F   02BC 0334
        SDBD                                    ; 6291   0001
        MVII    #$68EB, R0                      ; 6292   02B8 00EB 0068
        MVO@    R0,     R4                      ; 6295   0260
        MVII    #$0009, R0                      ; 6296   02B8 0009
        MVO     R0,     G_01E3                  ; 6298   0240 01E3
        MVII    #$032E, R4                      ; 629A   02BC 032E
        SDBD                                    ; 629C   0001
        MVII    #$5033, R0                      ; 629D   02B8 0033 0050
        MVO@    R0,     R4                      ; 62A0   0260
        B       L_6363                          ; 62A1   0200 00C0

L_62A3:
        TSTR    R1                              ; 62A3   0089
        BNEQ    L_62C7                          ; 62A4   020C 0021

        MVI     G_01B7, R0                      ; 62A6   0280 01B7
        CMPI    #$0002, R0                      ; 62A8   0378 0002
        BGT     L_627F                          ; 62AA   022E 002C

        MVII    #$0001, R0                      ; 62AC   02B8 0001
        MVO     R0,     G_0184                  ; 62AE   0240 0184

        JSR     R5,     L_54C4                  ; 62B0   0004 0154 00C4

        MVII    #$0334, R4                      ; 62B3   02BC 0334
        SDBD                                    ; 62B5   0001
        MVII    #$68E4, R0                      ; 62B6   02B8 00E4 0068
        MVO@    R0,     R4                      ; 62B9   0260
        MVII    #$0009, R0                      ; 62BA   02B8 0009
        MVO     R0,     G_01E3                  ; 62BC   0240 01E3
        MVII    #$032E, R4                      ; 62BE   02BC 032E
        SDBD                                    ; 62C0   0001
        MVII    #$5033, R0                      ; 62C1   02B8 0033 0050
        MVO@    R0,     R4                      ; 62C4   0260
        B       L_6363                          ; 62C5   0200 009C

L_62C7:
        MVII    #$0007, R0                      ; 62C7   02B8 0007
        MVO     R0,     G_01E3                  ; 62C9   0240 01E3
        B       L_6363                          ; 62CB   0200 0096

L_62CD:
        CMPI    #$0007, R0                      ; 62CD   0378 0007
        BNEQ    L_62E5                          ; 62CF   020C 0014

        MVII    #$032E, R4                      ; 62D1   02BC 032E
        SDBD                                    ; 62D3   0001
        MVII    #$5033, R0                      ; 62D4   02B8 0033 0050
        MVO@    R0,     R4                      ; 62D7   0260
        MVII    #$0333, R4                      ; 62D8   02BC 0333
        MVI     G_01D6, R0                      ; 62DA   0280 01D6
        ADDI    #$0003, R0                      ; 62DC   02F8 0003
        MVO@    R0,     R4                      ; 62DE   0260
        MVII    #$0008, R0                      ; 62DF   02B8 0008
        MVO     R0,     G_01E3                  ; 62E1   0240 01E3
        B       L_6363                          ; 62E3   0200 007E

L_62E5:
        CMPI    #$0008, R0                      ; 62E5   0378 0008
        BNEQ    L_6303                          ; 62E7   020C 001A

        MVII    #$0334, R4                      ; 62E9   02BC 0334

        JSR     R5,     L_5EC6                  ; 62EB   0004 015C 02C6

        SDBD                                    ; 62EE   0001
        CMPI    #$FFFF, R0                      ; 62EF   0378 00FF 00FF
        BNEQ    L_6363                          ; 62F2   020C 006F

        MVII    #$000C, R0                      ; 62F4   02B8 000C
        MVO     R0,     G_01E3                  ; 62F6   0240 01E3
        MVII    #$0333, R4                      ; 62F8   02BC 0333
        MVII    #$0001, R0                      ; 62FA   02B8 0001
        MVO@    R0,     R4                      ; 62FC   0260

        JSR     R5,     L_6E93                  ; 62FD   0004 016C 0293

        J       L_6363                          ; 6300   0004 0360 0363

L_6303:
        CMPI    #$000C, R0                      ; 6303   0378 000C
        BNEQ    L_6310                          ; 6305   020C 0009

        MVII    #$032E, R4                      ; 6307   02BC 032E
        SDBD                                    ; 6309   0001
        MVII    #$502A, R0                      ; 630A   02B8 002A 0050
        MVO@    R0,     R4                      ; 630D   0260
        B       L_6255                          ; 630E   0220 00BA

L_6310:
        CMPI    #$0009, R0                      ; 6310   0378 0009
        BNEQ    L_6333                          ; 6312   020C 001F

        MVII    #$0334, R4                      ; 6314   02BC 0334

        JSR     R5,     L_5EC6                  ; 6316   0004 015C 02C6

        SDBD                                    ; 6319   0001
        CMPI    #$FFFF, R0                      ; 631A   0378 00FF 00FF
        BNEQ    L_6331                          ; 631D   020C 0012

        CLRR    R0                              ; 631F   01C0

        JSR     R5,     L_6D87                  ; 6320   0004 016C 0187

        MVII    #$0333, R4                      ; 6323   02BC 0333
        MVI     G_01D6, R0                      ; 6325   0280 01D6
        MVO@    R0,     R4                      ; 6327   0260
        SDBD                                    ; 6328   0001
        MVII    #$68F2, R0                      ; 6329   02B8 00F2 0068
        MVO@    R0,     R4                      ; 632C   0260
        MVII    #$000A, R0                      ; 632D   02B8 000A
        MVO     R0,     G_01E3                  ; 632F   0240 01E3
L_6331:
        B       L_6363                          ; 6331   0200 0030

L_6333:
        CMPI    #$000A, R0                      ; 6333   0378 000A
        BNEQ    L_635E                          ; 6335   020C 0027

        MVII    #$0334, R4                      ; 6337   02BC 0334

        JSR     R5,     L_5EC6                  ; 6339   0004 015C 02C6

        SDBD                                    ; 633C   0001
        CMPI    #$FFFF, R0                      ; 633D   0378 00FF 00FF
        BNEQ    L_6363                          ; 6340   020C 0021

        JSR     R5,     L_54DD                  ; 6342   0004 0154 00DD

        MVI     G_01D5, R0                      ; 6345   0280 01D5
        MVO     R0,     G_01DB                  ; 6347   0240 01DB
        MVII    #$01F4, R0                      ; 6349   02B8 01F4

        JSR     R5,     L_5C42                  ; 634B   0004 015C 0042
        JSR     R5,     L_5C79                  ; 634E   0004 015C 0079

        SDBD                                    ; 6351   0001
        MVII    #$032E, R4                      ; 6352   02BC 002E 0003
        CLRR    R0                              ; 6355   01C0
        MVO@    R0,     R4                      ; 6356   0260
        SDBD                                    ; 6357   0001
        MVII    #$FFFF, R0                      ; 6358   02B8 00FF 00FF
        MVII    #$0333, R4                      ; 635B   02BC 0333
        MVO@    R0,     R4                      ; 635D   0260
L_635E:
        CLRR    R0                              ; 635E   01C0
        MVO     R0,     G_01E3                  ; 635F   0240 01E3
        B       L_6363                          ; 6361   0200 0000

L_6363:
        MVII    #$033B, R3                      ; 6363   02BB 033B
        MVI@    R3,     R0                      ; 6365   0298
        RSWD    R0                              ; 6366   0038
        BMI     L_63A9                          ; 6367   020B 0040

        DECR    R0                              ; 6369   0010
        MVO@    R0,     R3                      ; 636A   0258
        RSWD    R0                              ; 636B   0038
        BEQ     L_6370                          ; 636C   0204 0002
        B       L_63A9                          ; 636E   0200 0039

L_6370:
        MVI     G_01E5, R0                      ; 6370   0280 01E5
        CMPI    #$0001, R0                      ; 6372   0378 0001
        BNEQ    L_6387                          ; 6374   020C 0011

        MVII    #$01E4, R3                      ; 6376   02BB 01E4
        MVII    #$033B, R4                      ; 6378   02BC 033B

        JSR     R5,     L_5A95                  ; 637A   0004 0158 0295

        MVI     G_0337, R1                      ; 637D   0281 0337
        MVO     R1,     G_033F                  ; 637F   0241 033F
        MVI     G_0338, R1                      ; 6381   0281 0338
        MVO     R1,     G_0340                  ; 6383   0241 0340
        B       L_63A9                          ; 6385   0200 0022

L_6387:
        CMPI    #$0002, R0                      ; 6387   0378 0002
        BNEQ    L_63A4                          ; 6389   020C 0019

        MVI     G_01E7, R0                      ; 638B   0280 01E7
        CMPI    #$0008, R0                      ; 638D   0378 0008
        BNEQ    L_639B                          ; 638F   020C 000A

        SDBD                                    ; 6391   0001
        MVII    #$FFFF, R0                      ; 6392   02B8 00FF 00FF

        JSR     R5,     L_64A7                  ; 6395   0004 0164 00A7
        JSR     R5,     L_647F                  ; 6398   0004 0164 007F

L_639B:
        MVII    #$01E4, R3                      ; 639B   02BB 01E4
        MVII    #$033B, R4                      ; 639D   02BC 033B

        JSR     R5,     L_5AB3                  ; 639F   0004 0158 02B3

        B       L_63A9                          ; 63A2   0200 0005

L_63A4:
        CLRR    R0                              ; 63A4   01C0
        MVO     R0,     G_01E5                  ; 63A5   0240 01E5
        B       L_63A9                          ; 63A7   0200 0000

L_63A9:
        MVII    #$034B, R4                      ; 63A9   02BC 034B
        MVI@    R4,     R0                      ; 63AB   02A0
        RSWD    R0                              ; 63AC   0038
        BMI     L_63F0                          ; 63AD   020B 0041

        DECR    R4                              ; 63AF   0014
        DECR    R0                              ; 63B0   0010
        MVO@    R0,     R4                      ; 63B1   0260
        RSWD    R0                              ; 63B2   0038
        BNEQ    L_63F0                          ; 63B3   020C 003B

        MVI     G_01E9, R0                      ; 63B5   0280 01E9
        CMPI    #$0001, R0                      ; 63B7   0378 0001
        BNEQ    L_63C4                          ; 63B9   020C 0009

        MVII    #$01E8, R3                      ; 63BB   02BB 01E8
        MVII    #$034B, R4                      ; 63BD   02BC 034B

        JSR     R5,     L_5A95                  ; 63BF   0004 0158 0295

        B       L_63F0                          ; 63C2   0200 002C

L_63C4:
        CMPI    #$0002, R0                      ; 63C4   0378 0002
        BNEQ    L_63D1                          ; 63C6   020C 0009

        MVII    #$01E8, R3                      ; 63C8   02BB 01E8
        MVII    #$034B, R4                      ; 63CA   02BC 034B

        JSR     R5,     L_5AB3                  ; 63CC   0004 0158 02B3

        B       L_63F0                          ; 63CF   0200 001F

L_63D1:
        CMPI    #$0018, R0                      ; 63D1   0378 0018
        BGT     L_63DE                          ; 63D3   020E 0009

        CMPI    #$0010, R0                      ; 63D5   0378 0010
        BGT     L_63E7                          ; 63D7   020E 000E

        CLRR    R0                              ; 63D9   01C0
        MVO     R0,     G_01E9                  ; 63DA   0240 01E9
        B       L_63F0                          ; 63DC   0200 0012

L_63DE:
        MVII    #$01E9, R3                      ; 63DE   02BB 01E9
        MVII    #$034B, R4                      ; 63E0   02BC 034B

        JSR     R5,     L_5B69                  ; 63E2   0004 0158 0369

        B       L_63F0                          ; 63E5   0200 0009

L_63E7:
        MVII    #$01E8, R3                      ; 63E7   02BB 01E8
        MVII    #$034B, R4                      ; 63E9   02BC 034B

        JSR     R5,     L_5B90                  ; 63EB   0004 0158 0390

        B       L_63F0                          ; 63EE   0200 0000

L_63F0:
        MVII    #$0353, R4                      ; 63F0   02BC 0353
        MVI@    R4,     R0                      ; 63F2   02A0
        RSWD    R0                              ; 63F3   0038
        BMI     L_6437                          ; 63F4   020B 0041

        DECR    R4                              ; 63F6   0014
        DECR    R0                              ; 63F7   0010
        MVO@    R0,     R4                      ; 63F8   0260
        RSWD    R0                              ; 63F9   0038
        BNEQ    L_6437                          ; 63FA   020C 003B

        MVI     G_01EB, R0                      ; 63FC   0280 01EB
        CMPI    #$0001, R0                      ; 63FE   0378 0001
        BNEQ    L_640B                          ; 6400   020C 0009

        MVII    #$01EA, R3                      ; 6402   02BB 01EA
        MVII    #$0353, R4                      ; 6404   02BC 0353

        JSR     R5,     L_5A95                  ; 6406   0004 0158 0295

        B       L_6437                          ; 6409   0200 002C

L_640B:
        CMPI    #$0002, R0                      ; 640B   0378 0002
        BNEQ    L_6418                          ; 640D   020C 0009

        MVII    #$01EA, R3                      ; 640F   02BB 01EA
        MVII    #$0353, R4                      ; 6411   02BC 0353

        JSR     R5,     L_5AB3                  ; 6413   0004 0158 02B3

        B       L_6437                          ; 6416   0200 001F

L_6418:
        CMPI    #$0018, R0                      ; 6418   0378 0018
        BGT     L_6425                          ; 641A   020E 0009

        CMPI    #$0010, R0                      ; 641C   0378 0010
        BGT     L_642E                          ; 641E   020E 000E

        CLRR    R0                              ; 6420   01C0
        MVO     R0,     G_01EB                  ; 6421   0240 01EB
        B       L_6437                          ; 6423   0200 0012

L_6425:
        MVII    #$01EB, R3                      ; 6425   02BB 01EB
        MVII    #$0353, R4                      ; 6427   02BC 0353

        JSR     R5,     L_5B69                  ; 6429   0004 0158 0369

        B       L_6437                          ; 642C   0200 0009

L_642E:
        MVII    #$01EA, R3                      ; 642E   02BB 01EA
        MVII    #$0353, R4                      ; 6430   02BC 0353

        JSR     R5,     L_5B90                  ; 6432   0004 0158 0390

        B       L_6437                          ; 6435   0200 0000

L_6437:
        MVII    #$035B, R4                      ; 6437   02BC 035B
        MVI@    R4,     R0                      ; 6439   02A0
        RSWD    R0                              ; 643A   0038
        BMI     L_647D                          ; 643B   020B 0040

        DECR    R4                              ; 643D   0014
        DECR    R0                              ; 643E   0010
        MVO@    R0,     R4                      ; 643F   0260
        RSWD    R0                              ; 6440   0038
        BNEQ    L_647D                          ; 6441   020C 003A

        MVI     G_01ED, R0                      ; 6443   0280 01ED
        CMPI    #$0001, R0                      ; 6445   0378 0001
        BNEQ    L_6452                          ; 6447   020C 0009

        MVII    #$01EC, R3                      ; 6449   02BB 01EC
        MVII    #$035B, R4                      ; 644B   02BC 035B

        JSR     R5,     L_5A95                  ; 644D   0004 0158 0295

        B       L_647D                          ; 6450   0200 002B

L_6452:
        CMPI    #$0002, R0                      ; 6452   0378 0002
        BNEQ    L_645F                          ; 6454   020C 0009

        MVII    #$01EC, R3                      ; 6456   02BB 01EC
        MVII    #$035B, R4                      ; 6458   02BC 035B

        JSR     R5,     L_5AB3                  ; 645A   0004 0158 02B3

        B       L_647D                          ; 645D   0200 001E

L_645F:
        CMPI    #$0018, R0                      ; 645F   0378 0018
        BGT     L_646D                          ; 6461   020E 000A

        CMPI    #$0010, R0                      ; 6463   0378 0010
        BGT     L_6475                          ; 6465   020E 000E

        CLRR    R0                              ; 6467   01C0
        MVO     R0,     G_01ED                  ; 6468   0240 01ED
        J       L_647D                          ; 646A   0004 0364 007D

L_646D:
        MVII    #$01ED, R3                      ; 646D   02BB 01ED
        MVII    #$035B, R4                      ; 646F   02BC 035B

        JSR     R5,     L_5B69                  ; 6471   0004 0158 0369

        PULR    R7                              ; 6474   02B7

L_6475:
        MVII    #$01EC, R3                      ; 6475   02BB 01EC
        MVII    #$035B, R4                      ; 6477   02BC 035B

        JSR     R5,     L_5B90                  ; 6479   0004 0158 0390

        PULR    R7                              ; 647C   02B7
L_647D:
        PULR    R7                              ; 647D   02B7
        PULR    R7                              ; 647E   02B7

L_647F:
        PSHR    R5                              ; 647F   0275
        MVII    #$0165, R4                      ; 6480   02BC 0165
        ADD     G_01EF, R4                      ; 6482   02C4 01EF
        MVI@    R4,     R2                      ; 6484   02A2
        CMPI    #$0015, R2                      ; 6485   037A 0015
        BNEQ    L_64A6                          ; 6487   020C 001D

        MVI     G_0325, R0                      ; 6489   0280 0325
        SDBD                                    ; 648B   0001
        ANDI    #$F7FF, R0                      ; 648C   03B8 00FF 00F7
        MVO     R0,     G_0325                  ; 648F   0240 0325
        MVII    #$0001, R0                      ; 6491   02B8 0001
        MVO     R0,     G_01BC                  ; 6493   0240 01BC
        MVII    #$0002, R0                      ; 6495   02B8 0002
        MVO     R0,     G_01E1                  ; 6497   0240 01E1
        MVII    #$0002, R0                      ; 6499   02B8 0002
        MVII    #$018C, R4                      ; 649B   02BC 018C
        MVO@    R0,     R4                      ; 649D   0260
        MVII    #$001E, R0                      ; 649E   02B8 001E
        MVO     R0,     G_01BF                  ; 64A0   0240 01BF

        JSR     R5,     L_6D36                  ; 64A2   0004 016C 0136

        PULR    R5                              ; 64A5   02B5
L_64A6:
        PULR    R7                              ; 64A6   02B7

L_64A7:
        PSHR    R5                              ; 64A7   0275
        SDBD                                    ; 64A8   0001
        CMPI    #$FFFF, R0                      ; 64A9   0378 00FF 00FF
        BEQ     L_64B5                          ; 64AC   0204 0007

        MVII    #$015F, R4                      ; 64AE   02BC 015F
        ADD     G_01EF, R4                      ; 64B0   02C4 01EF
        MVI@    R4,     R3                      ; 64B2   02A3
        B       L_64B7                          ; 64B3   0200 0002

L_64B5:
        MVI     G_01E4, R3                      ; 64B5   0283 01E4
L_64B7:
        MVII    #$016C, R4                      ; 64B7   02BC 016C
        ADD     G_01EF, R4                      ; 64B9   02C4 01EF
        MVI@    R4,     R1                      ; 64BB   02A1
        CMPI    #$0001, R1                      ; 64BC   0379 0001
        BNEQ    L_64C4                          ; 64BE   020C 0004

        JSR     R5,     L_64E0                  ; 64C0   0004 0164 00E0

        PULR    R7                              ; 64C3   02B7

L_64C4:
        CMPI    #$0002, R1                      ; 64C4   0379 0002
        BNEQ    L_64CC                          ; 64C6   020C 0004

        JSR     R5,     L_651F                  ; 64C8   0004 0164 011F

        PULR    R7                              ; 64CB   02B7

L_64CC:
        CMPI    #$0003, R1                      ; 64CC   0379 0003
        BNEQ    L_64D4                          ; 64CE   020C 0004

        JSR     R5,     L_657C                  ; 64D0   0004 0164 017C

        PULR    R7                              ; 64D3   02B7

L_64D4:
        CMPI    #$0004, R1                      ; 64D4   0379 0004
        BNEQ    L_64DC                          ; 64D6   020C 0004

        JSR     R5,     L_65C9                  ; 64D8   0004 0164 01C9

        PULR    R7                              ; 64DB   02B7

L_64DC:
        JSR     R5,     L_6637                  ; 64DC   0004 0164 0237

        PULR    R7                              ; 64DF   02B7

L_64E0:
        PSHR    R5                              ; 64E0   0275
        MVII    #$015D, R2                      ; 64E1   02BA 015D
        ADD     G_01EF, R2                      ; 64E3   02C2 01EF
        ADDR    R3,     R2                      ; 64E5   00DA
        MVI@    R2,     R3                      ; 64E6   0293
        SDBD                                    ; 64E7   0001
        CMPI    #$FFFF, R0                      ; 64E8   0378 00FF 00FF
        BNEQ    L_6501                          ; 64EB   020C 0014

        TSTR    R3                              ; 64ED   009B
        BEQ     L_64FB                          ; 64EE   0204 000B

        CLRR    R3                              ; 64F0   01DB
        MVO@    R3,     R2                      ; 64F1   0253
        SDBD                                    ; 64F2   0001
        MVII    #$0165, R3                      ; 64F3   02BB 0065 0001
        ADD     G_01EF, R3                      ; 64F6   02C3 01EF
        MVI@    R3,     R5                      ; 64F8   029D
        DECR    R5                              ; 64F9   0015
        MVO@    R5,     R3                      ; 64FA   025D
L_64FB:
        MVI     G_01CE, R0                      ; 64FB   0280 01CE

        JSR     R5,     L_55EE                  ; 64FD   0004 0154 01EE

        PULR    R7                              ; 6500   02B7

L_6501:
        CMPI    #$0002, R3                      ; 6501   037B 0002
        BEQ     L_651E                          ; 6503   0204 0019

        MVII    #$0002, R3                      ; 6505   02BB 0002
        MVO@    R3,     R2                      ; 6507   0253
        SDBD                                    ; 6508   0001
        MVII    #$0165, R3                      ; 6509   02BB 0065 0001
        ADD     G_01EF, R3                      ; 650C   02C3 01EF
        MVI@    R3,     R5                      ; 650E   029D
        INCR    R5                              ; 650F   000D
        MVO@    R5,     R3                      ; 6510   025D
        MVI     G_01CF, R0                      ; 6511   0280 01CF

        JSR     R5,     L_55E3                  ; 6513   0004 0154 01E3

        MVII    #$0019, R0                      ; 6516   02B8 0019

        JSR     R5,     L_5C42                  ; 6518   0004 015C 0042
        JSR     R5,     L_5C79                  ; 651B   0004 015C 0079

L_651E:
        PULR    R7                              ; 651E   02B7

L_651F:
        PSHR    R5                              ; 651F   0275
        MVII    #$015D, R2                      ; 6520   02BA 015D
        ADD     G_01EF, R2                      ; 6522   02C2 01EF
        ADDR    R3,     R2                      ; 6524   00DA
        MVI@    R2,     R3                      ; 6525   0293
        SDBD                                    ; 6526   0001
        CMPI    #$FFFF, R0                      ; 6527   0378 00FF 00FF
        BNEQ    L_654E                          ; 652A   020C 0022

        TSTR    R3                              ; 652C   009B
        BNEQ    L_6530                          ; 652D   020C 0001
        PULR    R7                              ; 652F   02B7

L_6530:
        CMPI    #$0001, R3                      ; 6530   037B 0001
        BNEQ    L_653C                          ; 6532   020C 0008

        CLRR    R3                              ; 6534   01DB
        MVO@    R3,     R2                      ; 6535   0253
        MVI     G_01CD, R0                      ; 6536   0280 01CD

        JSR     R5,     L_55EE                  ; 6538   0004 0154 01EE

        PULR    R7                              ; 653B   02B7

L_653C:
        MVII    #$0001, R3                      ; 653C   02BB 0001
        MVO@    R3,     R2                      ; 653E   0253
        SDBD                                    ; 653F   0001
        MVII    #$0165, R3                      ; 6540   02BB 0065 0001
        ADD     G_01EF, R3                      ; 6543   02C3 01EF
        MVI@    R3,     R5                      ; 6545   029D
        DECR    R5                              ; 6546   0015
        MVO@    R5,     R3                      ; 6547   025D
        MVI     G_01CE, R0                      ; 6548   0280 01CE

        JSR     R5,     L_55EE                  ; 654A   0004 0154 01EE

        PULR    R7                              ; 654D   02B7

L_654E:
        TSTR    R3                              ; 654E   009B
        BNEQ    L_655E                          ; 654F   020C 000D

        MVII    #$0001, R3                      ; 6551   02BB 0001
        MVO@    R3,     R2                      ; 6553   0253
        MVI     G_01CE, R0                      ; 6554   0280 01CE

        JSR     R5,     L_55E3                  ; 6556   0004 0154 01E3

        MVII    #$000F, R0                      ; 6559   02B8 000F
        J       L_6575                          ; 655B   0004 0364 0175

L_655E:
        CMPI    #$0001, R3                      ; 655E   037B 0001
        BNEQ    L_657B                          ; 6560   020C 0019

        MVII    #$0002, R3                      ; 6562   02BB 0002
        MVO@    R3,     R2                      ; 6564   0253
        SDBD                                    ; 6565   0001
        MVII    #$0165, R3                      ; 6566   02BB 0065 0001
        ADD     G_01EF, R3                      ; 6569   02C3 01EF
        MVI@    R3,     R5                      ; 656B   029D
        INCR    R5                              ; 656C   000D
        MVO@    R5,     R3                      ; 656D   025D
        MVI     G_01CF, R0                      ; 656E   0280 01CF

        JSR     R5,     L_55E3                  ; 6570   0004 0154 01E3

        MVII    #$0019, R0                      ; 6573   02B8 0019

L_6575:
        JSR     R5,     L_5C42                  ; 6575   0004 015C 0042
        JSR     R5,     L_5C79                  ; 6578   0004 015C 0079

L_657B:
        PULR    R7                              ; 657B   02B7

L_657C:
        PSHR    R5                              ; 657C   0275
        MVII    #$015D, R2                      ; 657D   02BA 015D
        ADD     G_01EF, R2                      ; 657F   02C2 01EF
        ADDR    R3,     R2                      ; 6581   00DA
        MVI@    R2,     R3                      ; 6582   0293
        TSTR    R3                              ; 6583   009B
        BNEQ    L_65AC                          ; 6584   020C 0026

        MVII    #$0002, R3                      ; 6586   02BB 0002
        MVO@    R3,     R2                      ; 6588   0253
        SDBD                                    ; 6589   0001
        MVII    #$0165, R3                      ; 658A   02BB 0065 0001
        ADD     G_01EF, R3                      ; 658D   02C3 01EF
        MVI@    R3,     R5                      ; 658F   029D
        INCR    R5                              ; 6590   000D
        MVO@    R5,     R3                      ; 6591   025D
        SDBD                                    ; 6592   0001
        CMPI    #$FFFF, R0                      ; 6593   0378 00FF 00FF
        BEQ     L_65A6                          ; 6596   0204 000E

        MVI     G_01CF, R0                      ; 6598   0280 01CF

        JSR     R5,     L_55E3                  ; 659A   0004 0154 01E3

        MVII    #$0019, R0                      ; 659D   02B8 0019

        JSR     R5,     L_5C42                  ; 659F   0004 015C 0042
        JSR     R5,     L_5C79                  ; 65A2   0004 015C 0079

        PULR    R7                              ; 65A5   02B7

L_65A6:
        MVI     G_01CF, R0                      ; 65A6   0280 01CF

        JSR     R5,     L_55EE                  ; 65A8   0004 0154 01EE

        PULR    R7                              ; 65AB   02B7

L_65AC:
        CLRR    R3                              ; 65AC   01DB
        MVO@    R3,     R2                      ; 65AD   0253
        SDBD                                    ; 65AE   0001
        MVII    #$0165, R3                      ; 65AF   02BB 0065 0001
        ADD     G_01EF, R3                      ; 65B2   02C3 01EF
        MVI@    R3,     R5                      ; 65B4   029D
        DECR    R5                              ; 65B5   0015
        MVO@    R5,     R3                      ; 65B6   025D
        SDBD                                    ; 65B7   0001
        CMPI    #$FFFF, R0                      ; 65B8   0378 00FF 00FF
        BEQ     L_65C3                          ; 65BB   0204 0006

        MVI     G_01CD, R0                      ; 65BD   0280 01CD

        JSR     R5,     L_55E3                  ; 65BF   0004 0154 01E3

        PULR    R7                              ; 65C2   02B7

L_65C3:
        MVI     G_01CD, R0                      ; 65C3   0280 01CD

        JSR     R5,     L_55EE                  ; 65C5   0004 0154 01EE

        PULR    R7                              ; 65C8   02B7

L_65C9:
        PSHR    R5                              ; 65C9   0275
        MVII    #$015D, R2                      ; 65CA   02BA 015D
        ADD     G_01EF, R2                      ; 65CC   02C2 01EF
        ADDR    R3,     R2                      ; 65CE   00DA
        MVI@    R2,     R3                      ; 65CF   0293
        SDBD                                    ; 65D0   0001
        CMPI    #$FFFF, R0                      ; 65D1   0378 00FF 00FF
        BNEQ    L_65F8                          ; 65D4   020C 0022

        TSTR    R3                              ; 65D6   009B
        BNEQ    L_65DA                          ; 65D7   020C 0001
        PULR    R7                              ; 65D9   02B7

L_65DA:
        CMPI    #$0001, R3                      ; 65DA   037B 0001
        BNEQ    L_65E6                          ; 65DC   020C 0008

        CLRR    R3                              ; 65DE   01DB
        MVO@    R3,     R2                      ; 65DF   0253
        MVI     G_01CD, R0                      ; 65E0   0280 01CD

        JSR     R5,     L_55EE                  ; 65E2   0004 0154 01EE

        PULR    R7                              ; 65E5   02B7

L_65E6:
        MVII    #$0001, R3                      ; 65E6   02BB 0001
        MVO@    R3,     R2                      ; 65E8   0253
        SDBD                                    ; 65E9   0001
        MVII    #$0165, R3                      ; 65EA   02BB 0065 0001
        ADD     G_01EF, R3                      ; 65ED   02C3 01EF
        MVI@    R3,     R5                      ; 65EF   029D
        DECR    R5                              ; 65F0   0015
        MVO@    R5,     R3                      ; 65F1   025D
        MVI     G_01CE, R0                      ; 65F2   0280 01CE

        JSR     R5,     L_55EE                  ; 65F4   0004 0154 01EE

        PULR    R7                              ; 65F7   02B7

L_65F8:
        TSTR    R3                              ; 65F8   009B
        BNEQ    L_6607                          ; 65F9   020C 000C

        MVII    #$0001, R3                      ; 65FB   02BB 0001
        MVO@    R3,     R2                      ; 65FD   0253
        MVI     G_01CE, R0                      ; 65FE   0280 01CE

        JSR     R5,     L_55E3                  ; 6600   0004 0154 01E3

        MVII    #$000F, R0                      ; 6603   02B8 000F
        B       L_661E                          ; 6605   0200 0017

L_6607:
        CMPI    #$0001, R3                      ; 6607   037B 0001
        BNEQ    L_6625                          ; 6609   020C 001A

        MVII    #$0002, R3                      ; 660B   02BB 0002
        MVO@    R3,     R2                      ; 660D   0253
        SDBD                                    ; 660E   0001
        MVII    #$0165, R3                      ; 660F   02BB 0065 0001
        ADD     G_01EF, R3                      ; 6612   02C3 01EF
        MVI@    R3,     R5                      ; 6614   029D
        INCR    R5                              ; 6615   000D
        MVO@    R5,     R3                      ; 6616   025D
        MVI     G_01CF, R0                      ; 6617   0280 01CF

        JSR     R5,     L_55E3                  ; 6619   0004 0154 01E3

        MVII    #$0019, R0                      ; 661C   02B8 0019

L_661E:
        JSR     R5,     L_5C42                  ; 661E   0004 015C 0042
        JSR     R5,     L_5C79                  ; 6621   0004 015C 0079

        PULR    R7                              ; 6624   02B7

L_6625:
        MVII    #$0001, R3                      ; 6625   02BB 0001
        MVO@    R3,     R2                      ; 6627   0253
        SDBD                                    ; 6628   0001
        MVII    #$0165, R3                      ; 6629   02BB 0065 0001
        ADD     G_01EF, R3                      ; 662C   02C3 01EF
        MVI@    R3,     R5                      ; 662E   029D
        DECR    R5                              ; 662F   0015
        MVO@    R5,     R3                      ; 6630   025D
        MVI     G_01CE, R0                      ; 6631   0280 01CE

        JSR     R5,     L_55E3                  ; 6633   0004 0154 01E3

        PULR    R7                              ; 6636   02B7

L_6637:
        PSHR    R5                              ; 6637   0275
        MVII    #$015D, R2                      ; 6638   02BA 015D
        ADD     G_01EF, R2                      ; 663A   02C2 01EF
        ADDR    R3,     R2                      ; 663C   00DA
        MVI@    R2,     R3                      ; 663D   0293
        SDBD                                    ; 663E   0001
        CMPI    #$FFFF, R0                      ; 663F   0378 00FF 00FF
        BNEQ    L_6677                          ; 6642   020C 0033

        TSTR    R3                              ; 6644   009B
        BNEQ    L_6650                          ; 6645   020C 0009

        MVII    #$0001, R3                      ; 6647   02BB 0001
        MVO@    R3,     R2                      ; 6649   0253
        MVI     G_01CE, R0                      ; 664A   0280 01CE

        JSR     R5,     L_55EE                  ; 664C   0004 0154 01EE

        PULR    R7                              ; 664F   02B7

L_6650:
        CMPI    #$0001, R3                      ; 6650   037B 0001
        BNEQ    L_6666                          ; 6652   020C 0012

        MVII    #$0002, R3                      ; 6654   02BB 0002
        MVO@    R3,     R2                      ; 6656   0253
        SDBD                                    ; 6657   0001
        MVII    #$0165, R3                      ; 6658   02BB 0065 0001
        ADD     G_01EF, R3                      ; 665B   02C3 01EF
        MVI@    R3,     R5                      ; 665D   029D
        INCR    R5                              ; 665E   000D
        MVO@    R5,     R3                      ; 665F   025D
        MVI     G_01CF, R0                      ; 6660   0280 01CF

        JSR     R5,     L_55EE                  ; 6662   0004 0154 01EE

        PULR    R7                              ; 6665   02B7

L_6666:
        CLRR    R3                              ; 6666   01DB
        MVO@    R3,     R2                      ; 6667   0253
        SDBD                                    ; 6668   0001
        MVII    #$0165, R3                      ; 6669   02BB 0065 0001
        ADD     G_01EF, R3                      ; 666C   02C3 01EF
        MVI@    R3,     R5                      ; 666E   029D
        DECR    R5                              ; 666F   0015
        MVO@    R5,     R3                      ; 6670   025D
        MVI     G_01CD, R0                      ; 6671   0280 01CD

        JSR     R5,     L_55EE                  ; 6673   0004 0154 01EE

        PULR    R7                              ; 6676   02B7

L_6677:
        TSTR    R3                              ; 6677   009B
        BNEQ    L_6686                          ; 6678   020C 000C

        MVII    #$0001, R3                      ; 667A   02BB 0001
        MVO@    R3,     R2                      ; 667C   0253
        MVI     G_01CE, R0                      ; 667D   0280 01CE

        JSR     R5,     L_55E3                  ; 667F   0004 0154 01E3

        MVII    #$000F, R0                      ; 6682   02B8 000F
        B       L_669D                          ; 6684   0200 0017

L_6686:
        CMPI    #$0001, R3                      ; 6686   037B 0001
        BNEQ    L_66A4                          ; 6688   020C 001A

        MVII    #$0002, R3                      ; 668A   02BB 0002
        MVO@    R3,     R2                      ; 668C   0253
        SDBD                                    ; 668D   0001
        MVII    #$0165, R3                      ; 668E   02BB 0065 0001
        ADD     G_01EF, R3                      ; 6691   02C3 01EF
        MVI@    R3,     R5                      ; 6693   029D
        INCR    R5                              ; 6694   000D
        MVO@    R5,     R3                      ; 6695   025D
        MVI     G_01CF, R0                      ; 6696   0280 01CF

        JSR     R5,     L_55E3                  ; 6698   0004 0154 01E3

        MVII    #$0019, R0                      ; 669B   02B8 0019

L_669D:
        JSR     R5,     L_5C42                  ; 669D   0004 015C 0042
        JSR     R5,     L_5C79                  ; 66A0   0004 015C 0079

        PULR    R7                              ; 66A3   02B7

L_66A4:
        CLRR    R3                              ; 66A4   01DB
        MVO@    R3,     R2                      ; 66A5   0253
        SDBD                                    ; 66A6   0001
        MVII    #$0165, R3                      ; 66A7   02BB 0065 0001
        ADD     G_01EF, R3                      ; 66AA   02C3 01EF
        MVI@    R3,     R5                      ; 66AC   029D
        DECR    R5                              ; 66AD   0015
        MVO@    R5,     R3                      ; 66AE   025D
        MVI     G_01CD, R0                      ; 66AF   0280 01CD

        JSR     R5,     L_55E3                  ; 66B1   0004 0154 01E3

        PULR    R7                              ; 66B4   02B7

L_66B5:
        PSHR    R5                              ; 66B5   0275
        MVI     G_01B7, R0                      ; 66B6   0280 01B7
        INCR    R0                              ; 66B8   0008
        MVO     R0,     G_01B7                  ; 66B9   0240 01B7
        MVII    #$015F, R4                      ; 66BB   02BC 015F
        ADD     G_01EF, R4                      ; 66BD   02C4 01EF
        MVI@    R4,     R0                      ; 66BF   02A0
        MVI@    R4,     R2                      ; 66C0   02A2
        MOVR    R0,     R1                      ; 66C1   0081
        ANDI    #$0007, R0                      ; 66C2   03B8 0007
        ANDI    #$0038, R1                      ; 66C4   03B9 0038
        MVI     G_01E2, R3                      ; 66C6   0283 01E2
        MOVR    R3,     R4                      ; 66C8   009C
        ANDI    #$0007, R3                      ; 66C9   03BB 0007
        ANDI    #$0038, R4                      ; 66CB   03BC 0038
        MVI     G_01DF, R5                      ; 66CD   0285 01DF
        TSTR    R0                              ; 66CF   0080
        BNEQ    L_66DE                          ; 66D0   020C 000C

        CMPI    #$0001, R3                      ; 66D2   037B 0001
        BNEQ    L_66ED                          ; 66D4   020C 0017

        CMPR    R1,     R4                      ; 66D6   014C
        BEQ     L_6712                          ; 66D7   0204 0039

        CMPR    R1,     R4                      ; 66D9   014C
        BGT     L_672E                          ; 66DA   020E 0052
        B       L_6767                          ; 66DC   0200 0089

L_66DE:
        TSTR    R1                              ; 66DE   0089
        BNEQ    L_66ED                          ; 66DF   020C 000C

        CMPI    #$0008, R4                      ; 66E1   037C 0008
        BNEQ    L_66ED                          ; 66E3   020C 0008

        CMPR    R0,     R3                      ; 66E5   0143
        BEQ     L_672E                          ; 66E6   0204 0046

        CMPR    R0,     R3                      ; 66E8   0143
        BGT     L_6712                          ; 66E9   020E 0027
        B       L_674B                          ; 66EB   0200 005E

L_66ED:
        CMPR    R0,     R3                      ; 66ED   0143
        BNEQ    L_66F5                          ; 66EE   020C 0005

        CMPR    R2,     R5                      ; 66F0   0155
        BGT     L_672E                          ; 66F1   020E 003B
        B       L_6767                          ; 66F3   0200 0072

L_66F5:
        CMPR    R1,     R4                      ; 66F5   014C
        BNEQ    L_66FD                          ; 66F6   020C 0005

        CMPR    R2,     R5                      ; 66F8   0155
        BGT     L_6712                          ; 66F9   020E 0017
        B       L_674B                          ; 66FB   0200 004E

L_66FD:
        CMPR    R5,     R2                      ; 66FD   016A
        BNEQ    L_6705                          ; 66FE   020C 0005

        CMPR    R0,     R3                      ; 6700   0143
        BGT     L_6712                          ; 6701   020E 000F
        B       L_672E                          ; 6703   0200 0029

L_6705:
        CMPR    R2,     R5                      ; 6705   0155
        BLT     L_670D                          ; 6706   0205 0005

        CMPR    R0,     R3                      ; 6708   0143
        BGT     L_6712                          ; 6709   020E 0007
        B       L_672E                          ; 670B   0200 0021

L_670D:
        CMPR    R0,     R3                      ; 670D   0143
        BGT     L_6767                          ; 670E   020E 0057
        B       L_674B                          ; 6710   0200 0039

L_6712:
        MVII    #$032D, R4                      ; 6712   02BC 032D
        SDBD                                    ; 6714   0001
        MVII    #$98D4, R0                      ; 6715   02B8 00D4 0098
        MVO@    R0,     R4                      ; 6718   0260
        ADDI    #$0005, R4                      ; 6719   02FC 0005
        MVI     G_01D6, R0                      ; 671B   0280 01D6
        MVO@    R0,     R4                      ; 671D   0260
        SDBD                                    ; 671E   0001
        MVII    #$6A44, R0                      ; 671F   02B8 0044 006A
        MVO@    R0,     R4                      ; 6722   0260
        MVI     G_01E2, R0                      ; 6723   0280 01E2
        DECR    R0                              ; 6725   0010
        MVO     R0,     G_01E2                  ; 6726   0240 01E2
        MVI     G_01DF, R0                      ; 6728   0280 01DF
        DECR    R0                              ; 672A   0010
        MVO     R0,     G_01DF                  ; 672B   0240 01DF
        PULR    R7                              ; 672D   02B7

L_672E:
        MVII    #$032D, R4                      ; 672E   02BC 032D
        SDBD                                    ; 6730   0001
        MVII    #$9AD4, R0                      ; 6731   02B8 00D4 009A
        MVO@    R0,     R4                      ; 6734   0260
        ADDI    #$0005, R4                      ; 6735   02FC 0005
        MVI     G_01D6, R0                      ; 6737   0280 01D6
        MVO@    R0,     R4                      ; 6739   0260
        SDBD                                    ; 673A   0001
        MVII    #$6A4D, R0                      ; 673B   02B8 004D 006A
        MVO@    R0,     R4                      ; 673E   0260
        MVI     G_01E2, R0                      ; 673F   0280 01E2
        SUBI    #$0008, R0                      ; 6741   0338 0008
        MVO     R0,     G_01E2                  ; 6743   0240 01E2
        MVI     G_01DF, R0                      ; 6745   0280 01DF
        DECR    R0                              ; 6747   0010
        MVO     R0,     G_01DF                  ; 6748   0240 01DF
        PULR    R7                              ; 674A   02B7

L_674B:
        MVII    #$032D, R4                      ; 674B   02BC 032D
        SDBD                                    ; 674D   0001
        MVII    #$9AD4, R0                      ; 674E   02B8 00D4 009A
        MVO@    R0,     R4                      ; 6751   0260
        ADDI    #$0005, R4                      ; 6752   02FC 0005
        MVI     G_01D6, R0                      ; 6754   0280 01D6
        MVO@    R0,     R4                      ; 6756   0260
        SDBD                                    ; 6757   0001
        MVII    #$6A32, R0                      ; 6758   02B8 0032 006A
        MVO@    R0,     R4                      ; 675B   0260
        MVI     G_01E2, R0                      ; 675C   0280 01E2
        INCR    R0                              ; 675E   0008
        MVO     R0,     G_01E2                  ; 675F   0240 01E2
        MVI     G_01DF, R0                      ; 6761   0280 01DF
        INCR    R0                              ; 6763   0008
        MVO     R0,     G_01DF                  ; 6764   0240 01DF
        PULR    R7                              ; 6766   02B7

L_6767:
        MVII    #$032D, R4                      ; 6767   02BC 032D
        SDBD                                    ; 6769   0001
        MVII    #$98D4, R0                      ; 676A   02B8 00D4 0098
        MVO@    R0,     R4                      ; 676D   0260
        ADDI    #$0005, R4                      ; 676E   02FC 0005
        MVI     G_01D6, R0                      ; 6770   0280 01D6
        MVO@    R0,     R4                      ; 6772   0260
        SDBD                                    ; 6773   0001
        MVII    #$6A3B, R0                      ; 6774   02B8 003B 006A
        MVO@    R0,     R4                      ; 6777   0260
        MVI     G_01E2, R0                      ; 6778   0280 01E2
        ADDI    #$0008, R0                      ; 677A   02F8 0008
        MVO     R0,     G_01E2                  ; 677C   0240 01E2
        MVI     G_01DF, R0                      ; 677E   0280 01DF
        INCR    R0                              ; 6780   0008
        MVO     R0,     G_01DF                  ; 6781   0240 01DF
        PULR    R7                              ; 6783   02B7

L_6784:
        PSHR    R5                              ; 6784   0275
        CLRR    R2                              ; 6785   01D2
        MVO     R2,     G_01BB                  ; 6786   0242 01BB
        CLRR    R2                              ; 6788   01D2
        MVO     R2,     G_01BA                  ; 6789   0242 01BA
L_678B:
        MVI     G_01BB, R0                      ; 678B   0280 01BB

        JSR     R5,     X_POW2                  ; 678D   0004 0114 0345

        MVII    #$01D0, R4                      ; 6790   02BC 01D0
        ADD     G_01D7, R4                      ; 6792   02C4 01D7
        MVI@    R4,     R1                      ; 6794   02A1
        ANDR    R1,     R0                      ; 6795   0188
        BEQ     L_67A8                          ; 6796   0204 0010

        SDBD                                    ; 6798   0001
        MVII    #$6A26, R4                      ; 6799   02BC 0026 006A
        MVI     G_01BA, R3                      ; 679C   0283 01BA
        MVI     G_01BB, R2                      ; 679E   0282 01BB
        ADDR    R2,     R4                      ; 67A0   00D4
        ADDR    R3,     R4                      ; 67A1   00DC
        MVI@    R4,     R1                      ; 67A2   02A1
        MOVR    R1,     R4                      ; 67A3   008C
        CLRR    R3                              ; 67A4   01DB

        JSR     R5,     L_67D9                  ; 67A5   0004 0164 03D9

L_67A8:
        MVI     G_01BB, R2                      ; 67A8   0282 01BB
        INCR    R2                              ; 67AA   000A
        MVO     R2,     G_01BB                  ; 67AB   0242 01BB
        CMPI    #$0007, R2                      ; 67AD   037A 0007
        BNEQ    L_678B                          ; 67AF   022C 0025

        MVI     G_01BA, R0                      ; 67B1   0280 01BA
        TSTR    R0                              ; 67B3   0080
        BEQ     L_67C9                          ; 67B4   0204 0013

        MVI     G_01D7, R0                      ; 67B6   0280 01D7
        DECR    R0                              ; 67B8   0010
        MVO     R0,     G_01D7                  ; 67B9   0240 01D7
        MVI     G_01B5, R0                      ; 67BB   0280 01B5
        CMPI    #$0003, R0                      ; 67BD   0378 0003
        BEQ     L_67C5                          ; 67BF   0204 0004

        INCR    R0                              ; 67C1   0008
        MVO     R0,     G_01B5                  ; 67C2   0240 01B5
        PULR    R7                              ; 67C4   02B7

L_67C5:
        CLRR    R0                              ; 67C5   01C0
        MVO     R0,     G_01B5                  ; 67C6   0240 01B5
        PULR    R7                              ; 67C8   02B7

L_67C9:
        MVI     G_01D7, R1                      ; 67C9   0281 01D7
        INCR    R1                              ; 67CB   0009
        MVO     R1,     G_01D7                  ; 67CC   0241 01D7
        MVII    #$0005, R1                      ; 67CE   02B9 0005
        MVO     R1,     G_01BA                  ; 67D0   0241 01BA
        MVII    #$0002, R0                      ; 67D2   02B8 0002
        MVO     R0,     G_01BB                  ; 67D4   0240 01BB
        J       L_678B                          ; 67D6   0004 0364 038B

L_67D9:
        PSHR    R5                              ; 67D9   0275
        MVI     G_01B5, R0                      ; 67DA   0280 01B5
        CMPI    #$0001, R0                      ; 67DC   0378 0001
        BNEQ    L_67F7                          ; 67DE   020C 0017

        SDBD                                    ; 67E0   0001
        MVII    #$0835, R0                      ; 67E1   02B8 0035 0008
        MVO@    R0,     R4                      ; 67E4   0260
L_67E5:
        SDBD                                    ; 67E5   0001
        MVII    #$083E, R0                      ; 67E6   02B8 003E 0008
        MVO@    R0,     R4                      ; 67E9   0260
        ADDI    #$0012, R4                      ; 67EA   02FC 0012
        SDBD                                    ; 67EC   0001
        MVII    #$0841, R0                      ; 67ED   02B8 0041 0008
        MVO@    R0,     R4                      ; 67F0   0260
        SDBD                                    ; 67F1   0001
        MVII    #$084A, R0                      ; 67F2   02B8 004A 0008
        MVO@    R0,     R4                      ; 67F5   0260
        PULR    R7                              ; 67F6   02B7

L_67F7:
        CMPI    #$0002, R0                      ; 67F7   0378 0002
        BNEQ    L_6812                          ; 67F9   020C 0017

        SDBD                                    ; 67FB   0001
        MVII    #$0836, R0                      ; 67FC   02B8 0036 0008
        MVO@    R0,     R4                      ; 67FF   0260
        SDBD                                    ; 6800   0001
        MVII    #$083A, R0                      ; 6801   02B8 003A 0008
        MVO@    R0,     R4                      ; 6804   0260
        ADDI    #$0012, R4                      ; 6805   02FC 0012
        SDBD                                    ; 6807   0001
        MVII    #$0845, R0                      ; 6808   02B8 0045 0008
        MVO@    R0,     R4                      ; 680B   0260
        SDBD                                    ; 680C   0001
        MVII    #$0849, R0                      ; 680D   02B8 0049 0008
        MVO@    R0,     R4                      ; 6810   0260
        PULR    R7                              ; 6811   02B7

L_6812:
        CMPI    #$0003, R0                      ; 6812   0378 0003
        BNEQ    L_682D                          ; 6814   020C 0017

        SDBD                                    ; 6816   0001
        MVII    #$0832, R0                      ; 6817   02B8 0032 0008
        MVO@    R0,     R4                      ; 681A   0260
        SDBD                                    ; 681B   0001
        MVII    #$0839, R0                      ; 681C   02B8 0039 0008
        MVO@    R0,     R4                      ; 681F   0260
        ADDI    #$0012, R4                      ; 6820   02FC 0012
        SDBD                                    ; 6822   0001
        MVII    #$0846, R0                      ; 6823   02B8 0046 0008
        MVO@    R0,     R4                      ; 6826   0260
        SDBD                                    ; 6827   0001
        MVII    #$084D, R0                      ; 6828   02B8 004D 0008
        MVO@    R0,     R4                      ; 682B   0260
        PULR    R7                              ; 682C   02B7

L_682D:
        SDBD                                    ; 682D   0001
        MVII    #$0831, R0                      ; 682E   02B8 0031 0008
        MVO@    R0,     R4                      ; 6831   0260
        SDBD                                    ; 6832   0001
        MVII    #$083D, R0                      ; 6833   02B8 003D 0008
        MVO@    R0,     R4                      ; 6836   0260
        ADDI    #$0012, R4                      ; 6837   02FC 0012
        SDBD                                    ; 6839   0001
        MVII    #$0842, R0                      ; 683A   02B8 0042 0008
        MVO@    R0,     R4                      ; 683D   0260
        SDBD                                    ; 683E   0001
        MVII    #$084E, R0                      ; 683F   02B8 004E 0008
        MVO@    R0,     R4                      ; 6842   0260
        PULR    R7                              ; 6843   02B7

L_6844:
        PSHR    R5                              ; 6844   0275
        MVI     G_01B4, R0                      ; 6845   0280 01B4
        CMPI    #$0001, R0                      ; 6847   0378 0001
        BEQ     L_685B                          ; 6849   0204 0010

        INCR    R0                              ; 684B   0008
        MVO     R0,     G_01B4                  ; 684C   0240 01B4
        SDBD                                    ; 684E   0001
        MVII    #$08D6, R0                      ; 684F   02B8 00D6 0008
        MVO     R0,     .BTAB.3C                ; 6852   0240 023C
        SDBD                                    ; 6854   0001
        MVII    #$08CE, R0                      ; 6855   02B8 00CE 0008
        MVO     R0,     .BTAB.3F                ; 6858   0240 023F
        PULR    R7                              ; 685A   02B7

L_685B:
        DECR    R0                              ; 685B   0010
        MVO     R0,     G_01B4                  ; 685C   0240 01B4
        SDBD                                    ; 685E   0001
        MVII    #$08D0, R0                      ; 685F   02B8 00D0 0008
        MVO     R0,     .BTAB.3C                ; 6862   0240 023C
        SDBD                                    ; 6864   0001
        MVII    #$08C8, R0                      ; 6865   02B8 00C8 0008
        MVO     R0,     .BTAB.3F                ; 6868   0240 023F
        PULR    R7                              ; 686A   02B7

L_686B:
        PSHR    R5                              ; 686B   0275
        CLRR    R0                              ; 686C   01C0
        MVO     R0,     G_0342                  ; 686D   0240 0342
        MVO     R0,     G_034A                  ; 686F   0240 034A
        MVO     R0,     G_0352                  ; 6871   0240 0352
        MVO     R0,     G_035A                  ; 6873   0240 035A
        MVI     G_031F, R1                      ; 6875   0281 031F
        SDBD                                    ; 6877   0001
        SUBI    #$0400, R1                      ; 6878   0339 0000 0004
        MVO     R1,     G_033F                  ; 687B   0241 033F
        MVO     R1,     G_034F                  ; 687D   0241 034F
        SDBD                                    ; 687F   0001
        ADDI    #$0800, R1                      ; 6880   02F9 0000 0008
        MVO     R1,     G_0347                  ; 6883   0241 0347
        MVO     R1,     G_0357                  ; 6885   0241 0357
        MVII    #$0320, R4                      ; 6887   02BC 0320
        MVI@    R4,     R1                      ; 6889   02A1
        SDBD                                    ; 688A   0001
        SUBI    #$0900, R1                      ; 688B   0339 0000 0009
        MVO     R1,     G_0340                  ; 688E   0241 0340
        MVO     R1,     G_0348                  ; 6890   0241 0348
        MVO     R1,     G_0350                  ; 6892   0241 0350
        MVO     R1,     G_0358                  ; 6894   0241 0358
        SDBD                                    ; 6896   0001
        MVII    #$9040, R0                      ; 6897   02B8 0040 0090
        MVO     R0,     G_033D                  ; 689A   0240 033D
        SDBD                                    ; 689C   0001
        MVII    #$5092, R0                      ; 689D   02B8 0092 0050
        MVO     R0,     G_033E                  ; 68A0   0240 033E
        SDBD                                    ; 68A2   0001
        MVII    #$9040, R0                      ; 68A3   02B8 0040 0090
        MVO     R0,     G_0345                  ; 68A6   0240 0345
        SDBD                                    ; 68A8   0001
        MVII    #$5099, R0                      ; 68A9   02B8 0099 0050
        MVO     R0,     G_0346                  ; 68AC   0240 0346
        SDBD                                    ; 68AE   0001
        MVII    #$9047, R0                      ; 68AF   02B8 0047 0090
        MVO     R0,     G_034D                  ; 68B2   0240 034D
        SDBD                                    ; 68B4   0001
        MVII    #$50A0, R0                      ; 68B5   02B8 00A0 0050
        MVO     R0,     G_034E                  ; 68B8   0240 034E
        SDBD                                    ; 68BA   0001
        MVII    #$9047, R0                      ; 68BB   02B8 0047 0090
        MVO     R0,     G_0355                  ; 68BE   0240 0355
        SDBD                                    ; 68C0   0001
        MVII    #$50A7, R0                      ; 68C1   02B8 00A7 0050
        MVO     R0,     G_0356                  ; 68C4   0240 0356
        PULR    R7                              ; 68C6   02B7

L_68C7:
        PSHR    R5                              ; 68C7   0275
        SDBD                                    ; 68C8   0001
        MVII    #$6904, R4                      ; 68C9   02BC 0004 0069
L_68CC:
        MVI@    R4,     R1                      ; 68CC   02A1
        CMPI    #$03FF, R1                      ; 68CD   0379 03FF
        BEQ     L_68E3                          ; 68CF   0204 0012

        JSR     R5,     L_55D5                  ; 68D1   0004 0154 01D5

        INCR    R1                              ; 68D4   0009

        JSR     R5,     L_55D5                  ; 68D5   0004 0154 01D5

        ADDI    #$0013, R1                      ; 68D8   02F9 0013

        JSR     R5,     L_55D5                  ; 68DA   0004 0154 01D5

        INCR    R1                              ; 68DD   0009

        JSR     R5,     L_55D5                  ; 68DE   0004 0154 01D5

        B       L_68CC                          ; 68E1   0220 0016
L_68E3:
        PULR    R7                              ; 68E3   02B7

        DECLE   $03F0,  $03E8,  $03F0,  $03F4   ; 68E4   03F0 03E8 03F0 03F4
        DECLE   $03E0,  $0008,  $03F7,  $0010   ; 68E8   03E0 0008 03F7 0010
        DECLE   $03E8,  $0010,  $03F4,  $0020   ; 68EC   03E8 0010 03F4 0020
        DECLE   $0008,  $03F7,  $0000,  $0020   ; 68F0   0008 03F7 0000 0020
        DECLE   $0000,  $0020,  $0000,  $0020   ; 68F4   0000 0020 0000 0020
        DECLE   $03F7,  $0000,  $0010,  $0000   ; 68F8   03F7 0000 0010 0000
        DECLE   $0010,  $0000,  $0010,  $0000   ; 68FC   0010 0000 0010 0000
        DECLE   $0010,  $0000,  $0010,  $03F7   ; 6900   0010 0000 0010 03F7
        DECLE   $0209,  $0230,  $0232,  $0257   ; 6904   0209 0230 0232 0257
        DECLE   $0259,  $025B,  $027E           ; 6908   0259 025B 027E

        MVI     .BTAB.82,R0                     ; 690B   0280 0282
        MVI     .BTAB.A5,R4                     ; 690D   0284 02A5
        MVI@    R4,     R7                      ; 690F   02A7

        DECLE   $02A9,  $02AB,  $02AD,  $02CC   ; 6910   02A9 02AB 02AD 02CC
        DECLE   $02CE,  $02D0,  $02D2,  $02D4   ; 6914   02CE 02D0 02D2 02D4
        DECLE   $02D6,  $0229,  $03FF,  $000A   ; 6918   02D6 0229 03FF 000A
        DECLE   $0010,  $0011,  $0019,  $0000   ; 691C   0010 0011 0019 0000
        DECLE   $0008,  $0009,  $000B,  $0012   ; 6920   0008 0009 000B 0012
        DECLE   $0018,  $0020,  $0022,  $0000   ; 6924   0018 0020 0022 0000
        DECLE   $0010,  $0010,  $03FF,  $03FF   ; 6928   0010 0010 03FF 03FF
        DECLE   $0020,  $0040,  $03FF,  $03FF   ; 692C   0020 0040 03FF 03FF
        DECLE   $0008,  $0020,  $03FF,  $03FF   ; 6930   0008 0020 03FF 03FF
        DECLE   $0008,  $0040,  $0005,  $0007   ; 6934   0008 0040 0005 0007
        DECLE   $0008,  $0014,  $0006,  $0009   ; 6938   0008 0014 0006 0009
        DECLE   $0020,  $0028,  $0006,  $0008   ; 693C   0020 0028 0006 0008
        DECLE   $0008,  $0020,  $0005           ; 6940   0008 0020 0005

        SETC                                    ; 6943   0007

        JSR     R4,     X_RET_R5                ; 6944   0004 0010 0003
        DECLE   $0006,  $0028,  $0018,  $0006   ; 6947   0006 0028 0018 0006
        DECLE   $0007,  $0018,  $0030,  $0006   ; 694B   0007 0018 0030 0006
        DECLE   $0007,  $0028,  $0020,  $0005   ; 694F   0007 0028 0020 0005
        DECLE   $0008,  $0000,  $0054,  $0004   ; 6953   0008 0000 0054 0004
        DECLE   $0006,  $0054,  $0060,  $0006   ; 6957   0006 0054 0060 0006
        DECLE   $0009,  $0030,  $0064,  $0004   ; 695B   0009 0030 0064 0004
        DECLE   $0007,  $0028,  $002C,  $0003   ; 695F   0007 0028 002C 0003
        DECLE   $0005,  $0014,  $0050,  $0004   ; 6963   0005 0014 0050 0004
        DECLE   $0007,  $0028,  $0058,  $0009   ; 6967   0007 0028 0058 0009
        DECLE   $000A,  $0028,  $0058,  $0008   ; 696B   000A 0028 0058 0008
        DECLE   $000B,  $0028,  $0058,  $0007   ; 696F   000B 0028 0058 0007
        DECLE   $000B,  $0028,  $0058,  $0007   ; 6973   000B 0028 0058 0007
        DECLE   $000C,  $0028,  $0058,  $0007   ; 6977   000C 0028 0058 0007
        DECLE   $000A,  $0028,  $0058,  $0008   ; 697B   000A 0028 0058 0008
        DECLE   $000B,  $0028,  $0058,  $0008   ; 697F   000B 0028 0058 0008
        DECLE   $0009,  $0028,  $0058,  $0007   ; 6983   0009 0028 0058 0007
        DECLE   $0006,  $0028,  $0058,  $0007   ; 6987   0006 0028 0058 0007
        DECLE   $000A,  $0028,  $0058,  $0007   ; 698B   000A 0028 0058 0007
        DECLE   $000B,  $0028,  $0058,  $0006   ; 698F   000B 0028 0058 0006
        DECLE   $0009,  $0028,  $0058,  $0006   ; 6993   0009 0028 0058 0006
        DECLE   $0007,  $0028,  $0058,  $0007   ; 6997   0007 0028 0058 0007
        DECLE   $000A,  $0028,  $0058,  $0006   ; 699B   000A 0028 0058 0006
        DECLE   $000B,  $0028,  $0058,  $0006   ; 699F   000B 0028 0058 0006
        DECLE   $0009,  $0028,  $0058,  $0006   ; 69A3   0009 0028 0058 0006
        DECLE   $0008,  $0028,  $0058,  $0006   ; 69A7   0008 0028 0058 0006
        DECLE   $0008,  $0028,  $0058,  $0006   ; 69AB   0008 0028 0058 0006
        DECLE   $0007,  $0028,  $0058,  $0006   ; 69AF   0007 0028 0058 0006
        DECLE   $0008,  $0028,  $0058,  $0005   ; 69B3   0008 0028 0058 0005
        DECLE   $0007,  $0052,  $0088,  $001C   ; 69B7   0007 0052 0088 001C
        DECLE   $0050,  $0000,  $0054,  $0000   ; 69BB   0050 0000 0054 0000
        DECLE   $000A,  $0000,  $0000,  $0000   ; 69BF   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C3   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0088,  $0023   ; 69C7   0000 0040 0088 0023
        DECLE   $0050,  $0000,  $0054,  $0000   ; 69CB   0050 0000 0054 0000
        DECLE   $000A,  $0000,  $0000,  $0000   ; 69CF   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D3   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0098,  $0000   ; 69D7   0000 0042 0098 0000
        DECLE   $0000,  $0000,  $004C,  $0000   ; 69DB   0000 0000 004C 0000
        DECLE   $0006,  $0000,  $0000,  $0000   ; 69DF   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E3   0000 0000 0000 0000
        DECLE   $0000,  $0054,  $0090,  $004E   ; 69E7   0000 0054 0090 004E
        DECLE   $0050,  $0000,  $0000,  $0000   ; 69EB   0050 0000 0000 0000
        DECLE   $0064,  $0000,  $0000,  $0000   ; 69EF   0064 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $002A   ; 69F7   0000 0000 0000 002A
        DECLE   $0050,  $0000,  $0000,  $0000   ; 69FB   0050 0000 0000 0000
        DECLE   $0052,  $0000,  $0000,  $0000   ; 69FF   0052 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A03   0000 0000 0000 0000
        DECLE   $0000,  $0045,  $0098,  $003C   ; 6A07   0000 0045 0098 003C
        DECLE   $0050,  $0000,  $0000,  $0000   ; 6A0B   0050 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $0000   ; 6A0F   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A13   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0090,  $0045   ; 6A17   0000 0040 0090 0045
        DECLE   $0050,  $0000,  $0000,  $0000   ; 6A1B   0050 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $0000   ; 6A1F   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A23   0000 0000 0000 0000
        DECLE   $0000,  $021A                   ; 6A27   0000 021A

        MVO     R1,     .BTAB.68                ; 6A29   0241 0268
        MVI@    R1,     R7                      ; 6A2B   028F

        PULR    R6                              ; 6A2C   02B6
        B       L_67E5                          ; 6A2D   0220 0249

        DECLE   $0272,  $029B,  $02C4,  $03F8   ; 6A2F   0272 029B 02C4 03F8
        DECLE   $03F8,  $03F0,  $0008,  $03F8   ; 6A33   03F8 03F0 0008 03F8
        DECLE   $0020,  $0000,  $0020,  $03F7   ; 6A37   0020 0000 0020 03F7
        DECLE   $0008,  $03F8,  $0010,  $0008   ; 6A3B   0008 03F8 0010 0008
        DECLE   $0008,  $0020,  $0000,  $0020   ; 6A3F   0008 0020 0000 0020
        DECLE   $03F7,  $0000,  $03D8,  $0008   ; 6A43   03F7 0000 03D8 0008
        DECLE   $03E8,  $0010,  $03F8,  $0008   ; 6A47   03E8 0010 03F8 0008
        DECLE   $0008,  $03F7,  $0000,  $03D8   ; 6A4B   0008 03F7 0000 03D8
        DECLE   $03F8,  $03E8,  $03F0,  $03F8   ; 6A4F   03F8 03E8 03F0 03F8
        DECLE   $03F8,  $0008,  $03F7,  $03F0   ; 6A53   03F8 0008 03F7 03F0
        DECLE   $03F0,  $0008,  $03F8,  $0008   ; 6A57   03F0 0008 03F8 0008
        DECLE   $03F8,  $0010,  $03F0,  $0010   ; 6A5B   03F8 0010 03F0 0010
        DECLE   $03F0,  $03F7,  $0010,  $03F0   ; 6A5F   03F0 03F7 0010 03F0
        DECLE   $03F8,  $03F8,  $03F8,  $03F8   ; 6A63   03F8 03F8 03F8 03F8
        DECLE   $03F0,  $03F0,  $03F0,  $03F0   ; 6A67   03F0 03F0 03F0 03F0
        DECLE   $03F7,  $0010,  $0020,  $0010   ; 6A6B   03F7 0010 0020 0010
        DECLE   $0000,  $0008,  $0000,  $0008   ; 6A6F   0000 0008 0000 0008
        DECLE   $03F0,  $0010,  $03F0,  $03F7   ; 6A73   03F0 0010 03F0 03F7
        DECLE   $03F0,  $0020,  $03F0,  $0000   ; 6A77   03F0 0020 03F0 0000
        DECLE   $03F8,  $0000,  $03F8,  $03F0   ; 6A7B   03F8 0000 03F8 03F0
        DECLE   $03F0,  $03F0,  $03F7,  $0092   ; 6A7F   03F0 03F0 03F7 0092
        DECLE   $006A,  $00A1,  $006A,  $00B0   ; 6A83   006A 00A1 006A 00B0
        DECLE   $006A,  $00BF,  $006A,  $00CE   ; 6A87   006A 00BF 006A 00CE
        DECLE   $006A,  $00DD,  $006A,  $00FB   ; 6A8B   006A 00DD 006A 00FB
        DECLE   $006A,  $00EC,  $006A,  $000F   ; 6A8F   006A 00EC 006A 000F
        DECLE   $0008,  $0027,  $003A,  $000F   ; 6A93   0008 0027 003A 000F
        DECLE   $000A,  $0027                   ; 6A97   000A 0027

        INCR    R0                              ; 6A99   0008
L_6A9A:
        DECR    R7                              ; 6A9A   0017

        DECLE   $003A,  $001F,  $000A,  $0007   ; 6A9B   003A 001F 000A 0007
        DECLE   $0005,  $0006,  $000F,  $0008   ; 6A9F   0005 0006 000F 0008
        DECLE   $0027,  $000E,  $000F,  $001E   ; 6AA3   0027 000E 000F 001E
        DECLE   $0027                           ; 6AA7   0027

        INCR    R0                              ; 6AA8   0008
L_6AA9:
        DECR    R7                              ; 6AA9   0017

        DECLE   $000E,  $001F,  $001E,  $0007   ; 6AAA   000E 001F 001E 0007
        DECLE   $0001,  $0006,  $0009,  $0008   ; 6AAE   0001 0006 0009 0008
        DECLE   $0021,  $0018,  $0009,  $002E   ; 6AB2   0021 0018 0009 002E
        DECLE   $0021,  $0008,  $0011,  $0018   ; 6AB6   0021 0008 0011 0018
        DECLE   $0019,  $002E,  $0001,  $0006   ; 6ABA   0019 002E 0001 0006
        DECLE   $0003,  $000B,  $0008,  $0023   ; 6ABE   0003 000B 0008 0023
        DECLE   $002C,  $000B,  $003C,  $0023   ; 6AC2   002C 000B 003C 0023
        DECLE   $0008,  $0013,  $002C,  $001B   ; 6AC6   0008 0013 002C 001B
        DECLE   $003C,  $0003,  $0001,  $0007   ; 6ACA   003C 0003 0001 0007
        DECLE   $000E,  $0008,  $0026,  $001A   ; 6ACE   000E 0008 0026 001A
        DECLE   $000E,  $001E,  $0026,  $0008   ; 6AD2   000E 001E 0026 0008
        DECLE   $0016,  $001A,  $001E,  $001E   ; 6AD6   0016 001A 001E 001E
        DECLE   $0006,  $0007,  $0001,  $000F   ; 6ADA   0006 0007 0001 000F
        DECLE   $0008,  $0027,  $003A,  $000F   ; 6ADE   0008 0027 003A 000F
        DECLE   $0018,  $0027                   ; 6AE2   0018 0027

        INCR    R0                              ; 6AE4   0008
L_6AE5:
        DECR    R7                              ; 6AE5   0017

        DECLE   $003A,  $001F,  $0018,  $0007   ; 6AE6   003A 001F 0018 0007
        DECLE   $0006,  $0001,  $000F,  $0008   ; 6AEA   0006 0001 000F 0008
        DECLE   $0027,  $0008,  $000F,  $0008   ; 6AEE   0027 0008 000F 0008
        DECLE   $0027                           ; 6AF2   0027

        INCR    R0                              ; 6AF3   0008
L_6AF4:
        DECR    R7                              ; 6AF4   0017

        DECLE   $0008,  $001F,  $0008,  $0007   ; 6AF5   0008 001F 0008 0007
        DECLE   $0001,  $0006,  $000F,  $0008   ; 6AF9   0001 0006 000F 0008
        DECLE   $0027,  $0018,  $000F,  $000E   ; 6AFD   0027 0018 000F 000E
        DECLE   $0027                           ; 6B01   0027

        INCR    R0                              ; 6B02   0008
L_6B03:
        DECR    R7                              ; 6B03   0017

        DECLE   $0018,  $001F,  $000E,  $0007   ; 6B04   0018 001F 000E 0007
        DECLE   $0006,  $0001                   ; 6B08   0006 0001
.GFX_LIST_6B0A:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0A  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B12  CART PIC #01
        DECLE   $0001,  $0007,  $001F,  $007F   ; 6B16  
        DECLE   $00FF,  $007F,  $001F,  $0007   ; 6B1A  CART PIC #02
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6B1E  
        DECLE   $00FF,  $00FE,  $00F8,  $00E0   ; 6B22  CART PIC #03
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6B26  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2A  CART PIC #04
        DECLE   $0080,  $00E0,  $00F8,  $00FE   ; 6B2E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B32  CART PIC #05
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B36  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3A  CART PIC #06
        DECLE   $0000,  $000F,  $003F,  $007F   ; 6B3E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B42  CART PIC #07
        DECLE   $0000,  $00F0,  $00FC,  $00FE   ; 6B46  
        DECLE   $007F,  $003F,  $000F,  $0000   ; 6B4A  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4E  
        DECLE   $00FE,  $00FC,  $00F0,  $0000   ; 6B52  CART PIC #09
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B56  
        DECLE   $0000,  $0078,  $00F4,  $00FF   ; 6B5A  CART PIC #0A
        DECLE   $007C,  $0028,  $002C,  $0030   ; 6B5E  
        DECLE   $0000,  $0000,  $0000,  $00E4   ; 6B62  CART PIC #0B
        DECLE   $0094,  $00E4,  $0084,  $0087   ; 6B66  
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6B6A  CART PIC #0C
        DECLE   $0022,  $003E,  $0022,  $00A2   ; 6B6E  
        DECLE   $0000,  $0000,  $0000,  $008B   ; 6B72  CART PIC #0D
        DECLE   $0052,  $0023,  $0022,  $0023   ; 6B76  
        DECLE   $0000,  $0000,  $0000,  $00DE   ; 6B7A  CART PIC #0E
        DECLE   $0011,  $009E,  $0014,  $00D2   ; 6B7E  
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6B82  CART PIC #0F
        DECLE   $0018,  $0008,  $0008,  $001C   ; 6B86  
        DECLE   $0000,  $0000,  $0000,  $000C   ; 6B8A  CART PIC #10
        DECLE   $0012,  $0004,  $0008,  $001E   ; 6B8E  
        DECLE   $0000,  $0000,  $0080,  $0082   ; 6B92  CART PIC #11
        DECLE   $0080,  $0082,  $00F8,  $0000   ; 6B96  
        DECLE   $0000,  $0000,  $00F0,  $008A   ; 6B9A  CART PIC #12
        DECLE   $00F0,  $00A2,  $0090,  $0000   ; 6B9E  
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6BA2  CART PIC #13
        DECLE   $0012,  $001E,  $0002,  $0002   ; 6BA6  
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6BAA  CART PIC #14
        DECLE   $0000,  $0008,  $00E0,  $0000   ; 6BAE  
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 6BB2  CART PIC #15
        DECLE   $007E,  $003C,  $0000,  $0000   ; 6BB6  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBA  CART PIC #16
        DECLE   $0000,  $0000,  $00FE,  $00D8   ; 6BBE  
        DECLE   $0050,  $0000,  $0020,  $0000   ; 6BC2  CART PIC #17
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC6  
        DECLE   $0000,  $0078,  $0025,  $0024   ; 6BCA  CART PIC #18
        DECLE   $0025,  $0078,  $0000,  $0000   ; 6BCE  
        DECLE   $0010,  $0020,  $007F,  $0020   ; 6BD2  CART PIC #19
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6BD6  
        DECLE   $0008,  $0004,  $00FE,  $0004   ; 6BDA  CART PIC #1A
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6BDE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE6   0000 0000 0000 0000
        DECLE   $001C,  $003E,  $007F,  $007F   ; 6BEA   001C 003E 007F 007F
        DECLE   $006B,  $006B,  $007F,  $007F   ; 6BEE   006B 006B 007F 007F
        DECLE   $003E,  $007E,  $00FC,  $007C   ; 6BF2   003E 007E 00FC 007C
        DECLE   $0074,  $0014,  $0014,  $0028   ; 6BF6   0074 0014 0014 0028
        DECLE   $0000,  $0000,  $0014,  $0014   ; 6BFA   0000 0000 0014 0014
        DECLE   $0014,  $0014,  $0000,  $0000   ; 6BFE   0014 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6C02   0000 0000 0000 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6C06   0080 0000 0000 0000
        DECLE   $0010,  $002A,  $0034,  $003C   ; 6C0A   0010 002A 0034 003C
        DECLE   $007E,  $007E,  $0001,  $0027   ; 6C0E   007E 007E 0001 0027
        DECLE   $00AF,  $00FF,  $00DE,  $007C   ; 6C12   00AF 00FF 00DE 007C
        DECLE   $0028,  $0028,  $0048,  $0010   ; 6C16   0028 0028 0048 0010
        DECLE   $0000,  $0000,  $00FE,  $00D8   ; 6C1A   0000 0000 00FE 00D8
        DECLE   $0050,  $0000,  $0020,  $0000   ; 6C1E   0050 0000 0020 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; 6C22   0018 003C 007E 007E
        DECLE   $007E,  $007E,  $003C,  $0018   ; 6C26   007E 007E 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2E   0000 0000 0000 0000
        DECLE   $001E,  $0035,  $007F,  $00EA   ; 6C32   001E 0035 007F 00EA
        DECLE   $00C0,  $00FE,  $00C0,  $00FC   ; 6C36   00C0 00FE 00C0 00FC
        DECLE   $0000,  $0000,  $001E,  $0035   ; 6C3A   0000 0000 001E 0035
        DECLE   $007F,  $00EA,  $00E0,  $00FE   ; 6C3E   007F 00EA 00E0 00FE
        DECLE   $00F3,  $00DE,  $00C0,  $00FE   ; 6C42   00F3 00DE 00C0 00FE
        DECLE   $00DB,  $00CE,  $00C0,  $007C   ; 6C46   00DB 00CE 00C0 007C
        DECLE   $001C,  $0020,  $0030,  $0078   ; 6C4A   001C 0020 0030 0078
        DECLE   $00FC,  $00BD,  $007E,  $00FF   ; 6C4E   00FC 00BD 007E 00FF
        DECLE   $00B7,  $0035,  $0036,  $0014   ; 6C52   00B7 0035 0036 0014
        DECLE   $0004,  $0004,  $0000,  $0000   ; 6C56   0004 0004 0000 0000
        DECLE   $001C,  $003E,  $00BF           ; 6C5A   001C 003E 00BF

        ADDR    R5,     R7                      ; 6C5D   00EF
        ADDR    R5,     R7                      ; 6C5E   00EF

        DECLE   $00FF,  $007F,  $003F,  $003F   ; 6C5F   00FF 007F 003F 003F
        DECLE   $003E,  $001E,  $001C,  $0014   ; 6C63   003E 001E 001C 0014
        DECLE   $0014,  $003C,  $0014,  $0000   ; 6C67   0014 003C 0014 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 6C6B   0000 0000 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C77   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0004,  $0034   ; 6C7B   0000 0004 0004 0034
        DECLE   $0055,  $0014,  $0014,  $0024   ; 6C7F   0055 0014 0014 0024
        DECLE   $0024,  $0005,  $0024,  $0020   ; 6C83   0024 0005 0024 0020
        DECLE   $0004,  $0004,  $0000,  $0000   ; 6C87   0004 0004 0000 0000
        DECLE   $0000,  $00A0,  $00B0,  $00E6   ; 6C8B   0000 00A0 00B0 00E6
        DECLE   $00AA,  $00A2,  $00A2,  $00B4   ; 6C8F   00AA 00A2 00A2 00B4
        DECLE   $00E4,  $00A0,  $00A4,  $00A4   ; 6C93   00E4 00A0 00A4 00A4
        DECLE   $0000,  $0000,  $0000,  $000F   ; 6C97   0000 0000 0000 000F
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 6C9B   001F 003F 007F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C9F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6CA3   00FF 00FF 00FF 007F
        DECLE   $003F,  $001F                   ; 6CA7   003F 001F

        INCR    R7                              ; 6CA9   000F

        ADDR    R6,     R0                      ; 6CAA   00F0
L_6CAB:
        ADDR    R7,     R0                      ; 6CAB   00F8
        DECLE   $00FC,  $00FE,  $00FF,  $00FF   ; 6CAC   00FC 00FE 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6CB0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 6CB4   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00F0,  $0000,  $0000   ; 6CB8   00F8 00F0 0000 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; 6CBC   0018 003C 007E 007E
        DECLE   $00FB,  $00FD,  $00FD,  $00FD   ; 6CC0   00FB 00FD 00FD 00FD
        DECLE   $00FD,  $00FD,  $007A,  $0066   ; 6CC4   00FD 00FD 007A 0066
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6CC8   003C 0018 0000 0000
L_6CCC:
        PSHR    R5                              ; 6CCC   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6CCD   0004 0119 03BE
        DECLE   $006E                           ; 6CD0  SFX prio
        DECLE   $02C0,  $01FA                   ; 6CD1  SFX data
        DECLE   $0348,  $01EF                   ; 6CD3  SFX data
        DECLE   $0204,  $0171                   ; 6CD5  SFX data
        DECLE   $00CD                           ; 6CD7  SFX data
        DECLE   $0189                           ; 6CD8  SFX data
        DECLE   $006B                           ; 6CD9  SFX data
        DECLE   $0280,  $0197                   ; 6CDA  SFX data
        DECLE   $0165                           ; 6CDC  SFX data
        DECLE   $006B                           ; 6CDD  SFX data
        DECLE   $0200,  $0141                   ; 6CDE  SFX data
        DECLE   $0208,  $020B                   ; 6CE0  SFX data
        DECLE   $0155                           ; 6CE2  SFX data
        DECLE   $006B                           ; 6CE3  SFX data
        DECLE   $0175                           ; 6CE4  SFX data
        DECLE   $006B                           ; 6CE5  SFX data
        DECLE   $02CF                           ; 6CE6  SFX end

L_6CE7:
        PSHR    R5                              ; 6CE7   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6CE8   0004 0119 03BE
        DECLE   $008C                           ; 6CEB  SFX prio
        DECLE   $0340,  $0356                   ; 6CEC  SFX data
        DECLE   $0344,  $01AB                   ; 6CEE  SFX data
        DECLE   $03A9                           ; 6CF0  SFX data
        DECLE   $01EB                           ; 6CF1  SFX data
        DECLE   $013D                           ; 6CF2  SFX data
        DECLE   $0340,  $02A6                   ; 6CF3  SFX data
        DECLE   $0344,  $0153                   ; 6CF5  SFX data
        DECLE   $01EB                           ; 6CF7  SFX data
        DECLE   $0340,  $023B                   ; 6CF8  SFX data
        DECLE   $0344,  $011D                   ; 6CFA  SFX data
        DECLE   $01EB                           ; 6CFC  SFX data
        DECLE   $0340,  $01AB                   ; 6CFD  SFX data
        DECLE   $0344,  $00D6                   ; 6CFF  SFX data
        DECLE   $0103,  $03C1                   ; 6D01  SFX data
        DECLE   $0340,  $027F                   ; 6D03  SFX data
        DECLE   $0348,  $010E                   ; 6D05  SFX data
        DECLE   $0344,  $00BF                   ; 6D07  SFX data
        DECLE   $0389                           ; 6D09  SFX data
        DECLE   $01EB                           ; 6D0A  SFX data
        DECLE   $01EB                           ; 6D0B  SFX data
        DECLE   $0344,  $00D6                   ; 6D0C  SFX data
        DECLE   $01EB                           ; 6D0E  SFX data
        DECLE   $0344,  $00BF                   ; 6D0F  SFX data
        DECLE   $01EB                           ; 6D11  SFX data
        DECLE   $0340,  $0356                   ; 6D12  SFX data
        DECLE   $0348,  $011D                   ; 6D14  SFX data
        DECLE   $0344,  $00AA                   ; 6D16  SFX data
        DECLE   $016B                           ; 6D18  SFX data
        DECLE   $0348,  $0153                   ; 6D19  SFX data
        DECLE   $0344,  $00D6                   ; 6D1B  SFX data
        DECLE   $006B                           ; 6D1D  SFX data
        DECLE   $006B                           ; 6D1E  SFX data
        DECLE   $0348,  $011D                   ; 6D1F  SFX data
        DECLE   $0344,  $00AA                   ; 6D21  SFX data
        DECLE   $006B                           ; 6D23  SFX data
        DECLE   $00EB                           ; 6D24  SFX data
        DECLE   $0348,  $00AA                   ; 6D25  SFX data
        DECLE   $0344,  $008F                   ; 6D27  SFX data
        DECLE   $016B                           ; 6D29  SFX data
        DECLE   $0344,  $011D                   ; 6D2A  SFX data
        DECLE   $006B                           ; 6D2C  SFX data
        DECLE   $006B                           ; 6D2D  SFX data
        DECLE   $0344,  $008F                   ; 6D2E  SFX data
        DECLE   $006B                           ; 6D30  SFX data
        DECLE   $00EB                           ; 6D31  SFX data
        DECLE   $0344,  $006B                   ; 6D32  SFX data
        DECLE   $01EB                           ; 6D34  SFX data
        DECLE   $02CF                           ; 6D35  SFX end

L_6D36:
        PSHR    R5                              ; 6D36   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6D37   0004 0119 03BE
        DECLE   $0090                           ; 6D3A  SFX prio
        DECLE   $002F                           ; 6D3B  SFX data
        DECLE   $03C9                           ; 6D3C  SFX data
        DECLE   $013D                           ; 6D3D  SFX data
        DECLE   $0340,  $0153                   ; 6D3E  SFX data
        DECLE   $0348,  $02A6                   ; 6D40  SFX data
        DECLE   $016B                           ; 6D42  SFX data
        DECLE   $0340,  $017C                   ; 6D43  SFX data
        DECLE   $0348,  $02F9                   ; 6D45  SFX data
        DECLE   $00C3,  $03D5                   ; 6D47  SFX data
        DECLE   $02EB                           ; 6D49  SFX data
        DECLE   $0340,  $0194                   ; 6D4A  SFX data
        DECLE   $0348,  $0325                   ; 6D4C  SFX data
        DECLE   $016B                           ; 6D4E  SFX data
        DECLE   $0340,  $017C                   ; 6D4F  SFX data
        DECLE   $0348,  $02F9                   ; 6D51  SFX data
        DECLE   $016B                           ; 6D53  SFX data
        DECLE   $013D                           ; 6D54  SFX data
        DECLE   $0340,  $012E                   ; 6D55  SFX data
        DECLE   $0348,  $025D                   ; 6D57  SFX data
        DECLE   $016B                           ; 6D59  SFX data
        DECLE   $0340,  $0153                   ; 6D5A  SFX data
        DECLE   $0348,  $02A6                   ; 6D5C  SFX data
        DECLE   $00C3,  $03D5                   ; 6D5E  SFX data
        DECLE   $008F,  $0011                   ; 6D60  SFX data
        DECLE   $0340,  $0168                   ; 6D62  SFX data
        DECLE   $0348,  $02CD                   ; 6D64  SFX data
        DECLE   $016B                           ; 6D66  SFX data
        DECLE   $013D                           ; 6D67  SFX data
        DECLE   $0340,  $0153                   ; 6D68  SFX data
        DECLE   $0348,  $02A6                   ; 6D6A  SFX data
        DECLE   $016B                           ; 6D6C  SFX data
        DECLE   $0340,  $011D                   ; 6D6D  SFX data
        DECLE   $0348,  $023B                   ; 6D6F  SFX data
        DECLE   $00C3,  $03D5                   ; 6D71  SFX data
        DECLE   $0340,  $00E2                   ; 6D73  SFX data
        DECLE   $0348,  $01C5                   ; 6D75  SFX data
        DECLE   $02AB                           ; 6D77  SFX data
        DECLE   $0035                           ; 6D78  SFX data
        DECLE   $002B                           ; 6D79  SFX data
        DECLE   $0345                           ; 6D7A  SFX data
        DECLE   $0365                           ; 6D7B  SFX data
        DECLE   $02EB                           ; 6D7C  SFX data
        DECLE   $0344,  $004B                   ; 6D7D  SFX data
        DECLE   $0001,  $0011                   ; 6D7F  SFX data
        DECLE   $03B9                           ; 6D81  SFX data
        DECLE   $03EB                           ; 6D82  SFX data
        DECLE   $0001,  $03F1                   ; 6D83  SFX data
        DECLE   $03EB                           ; 6D85  SFX data
        DECLE   $02CF                           ; 6D86  SFX end

L_6D87:
        PSHR    R5                              ; 6D87   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6D88   0004 0119 03BE
        DECLE   $008E                           ; 6D8B  SFX prio
        DECLE   $002F                           ; 6D8C  SFX data
        DECLE   $03C0,  $009E                   ; 6D8D  SFX data
        DECLE   $03C8,  $013C                   ; 6D8F  SFX data
        DECLE   $0003,  $0008                   ; 6D91  SFX data
        DECLE   $03C8,  $004F                   ; 6D93  SFX data
        DECLE   $0001,  $0008                   ; 6D95  SFX data
        DECLE   $0001,  $000A                   ; 6D97  SFX data
        DECLE   $03C9                           ; 6D99  SFX data
        DECLE   $008F,  $0013                   ; 6D9A  SFX data
        DECLE   $03F2                           ; 6D9C  SFX data
        DECLE   $03FA                           ; 6D9D  SFX data
        DECLE   $008F,  $0063                   ; 6D9E  SFX data
        DECLE   $02CF                           ; 6DA0  SFX end

L_6DA1:
        PSHR    R5                              ; 6DA1   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6DA2   0004 0119 03BE
        DECLE   $0072                           ; 6DA5  SFX prio
        DECLE   $002F                           ; 6DA6  SFX data
        DECLE   $03C9                           ; 6DA7  SFX data
        DECLE   $0280,  $02A6                   ; 6DA8  SFX data
        DECLE   $0082                           ; 6DAA  SFX data
        DECLE   $0001,  $0358                   ; 6DAB  SFX data
        DECLE   $0025                           ; 6DAD  SFX data
        DECLE   $006B                           ; 6DAE  SFX data
        DECLE   $0148,  $00B7                   ; 6DAF  SFX data
        DECLE   $0001,  $03D2                   ; 6DB1  SFX data
        DECLE   $006B                           ; 6DB3  SFX data
        DECLE   $0305                           ; 6DB4  SFX data
        DECLE   $0382                           ; 6DB5  SFX data
        DECLE   $002B                           ; 6DB6  SFX data
        DECLE   $0025                           ; 6DB7  SFX data
        DECLE   $00AB                           ; 6DB8  SFX data
        DECLE   $0200,  $03C4                   ; 6DB9  SFX data
        DECLE   $002B                           ; 6DBB  SFX data
        DECLE   $0148,  $01B5                   ; 6DBC  SFX data
        DECLE   $0023,  $03A0                   ; 6DBE  SFX data
        DECLE   $02CF                           ; 6DC0  SFX end

L_6DC1:
        PSHR    R5                              ; 6DC1   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6DC2   0004 0119 03BE
        DECLE   $008C                           ; 6DC5  SFX prio
        DECLE   $0340,  $01FC                   ; 6DC6  SFX data
        DECLE   $03E9                           ; 6DC8  SFX data
        DECLE   $01AB                           ; 6DC9  SFX data
        DECLE   $0348,  $0153                   ; 6DCA  SFX data
        DECLE   $03C9                           ; 6DCC  SFX data
        DECLE   $01AB                           ; 6DCD  SFX data
        DECLE   $0348,  $00FE                   ; 6DCE  SFX data
        DECLE   $01AB                           ; 6DD0  SFX data
        DECLE   $0348,  $00D6                   ; 6DD1  SFX data
        DECLE   $0348,  $00E2                   ; 6DD3  SFX data
        DECLE   $01AB                           ; 6DD5  SFX data
        DECLE   $0348,  $0153                   ; 6DD6  SFX data
        DECLE   $01AB                           ; 6DD8  SFX data
        DECLE   $0340,  $021A                   ; 6DD9  SFX data
        DECLE   $0348,  $01E2                   ; 6DDB  SFX data
        DECLE   $01AB                           ; 6DDD  SFX data
        DECLE   $0348,  $00BF                   ; 6DDE  SFX data
        DECLE   $01AB                           ; 6DE0  SFX data
        DECLE   $03C0,  $01FC                   ; 6DE1  SFX data
        DECLE   $0348,  $00D6                   ; 6DE3  SFX data
        DECLE   $01AB                           ; 6DE5  SFX data
        DECLE   $0340,  $02A6                   ; 6DE6  SFX data
        DECLE   $03E9                           ; 6DE8  SFX data
        DECLE   $01AB                           ; 6DE9  SFX data
        DECLE   $0340,  $01FC                   ; 6DEA  SFX data
        DECLE   $03C8,  $00AA                   ; 6DEC  SFX data
        DECLE   $03C9                           ; 6DEE  SFX data
        DECLE   $01AB                           ; 6DEF  SFX data
        DECLE   $0340,  $01AB                   ; 6DF0  SFX data
        DECLE   $03E9                           ; 6DF2  SFX data
        DECLE   $01AB                           ; 6DF3  SFX data
        DECLE   $0340,  $01C5                   ; 6DF4  SFX data
        DECLE   $0348,  $010E                   ; 6DF6  SFX data
        DECLE   $03C9                           ; 6DF8  SFX data
        DECLE   $01AB                           ; 6DF9  SFX data
        DECLE   $0340,  $02A6                   ; 6DFA  SFX data
        DECLE   $03E9                           ; 6DFC  SFX data
        DECLE   $01AB                           ; 6DFD  SFX data
        DECLE   $03C0,  $01C5                   ; 6DFE  SFX data
        DECLE   $0348,  $00AA                   ; 6E00  SFX data
        DECLE   $03C9                           ; 6E02  SFX data
        DECLE   $01AB                           ; 6E03  SFX data
        DECLE   $0340,  $017C                   ; 6E04  SFX data
        DECLE   $03E9                           ; 6E06  SFX data
        DECLE   $01AB                           ; 6E07  SFX data
        DECLE   $0340,  $01AB                   ; 6E08  SFX data
        DECLE   $0348,  $00FE                   ; 6E0A  SFX data
        DECLE   $03C9                           ; 6E0C  SFX data
        DECLE   $01AB                           ; 6E0D  SFX data
        DECLE   $0340,  $027F                   ; 6E0E  SFX data
        DECLE   $0025                           ; 6E10  SFX data
        DECLE   $01AB                           ; 6E11  SFX data
        DECLE   $0340,  $01FC                   ; 6E12  SFX data
        DECLE   $0365                           ; 6E14  SFX data
        DECLE   $01AB                           ; 6E15  SFX data
        DECLE   $0348,  $00D6                   ; 6E16  SFX data
        DECLE   $03D9                           ; 6E18  SFX data
        DECLE   $01AB                           ; 6E19  SFX data
        DECLE   $0340,  $021A                   ; 6E1A  SFX data
        DECLE   $03C8,  $00E2                   ; 6E1C  SFX data
        DECLE   $03C9                           ; 6E1E  SFX data
        DECLE   $01AB                           ; 6E1F  SFX data
        DECLE   $0340,  $027F                   ; 6E20  SFX data
        DECLE   $0025                           ; 6E22  SFX data
        DECLE   $01AB                           ; 6E23  SFX data
        DECLE   $0340,  $02A6                   ; 6E24  SFX data
        DECLE   $0365                           ; 6E26  SFX data
        DECLE   $01AB                           ; 6E27  SFX data
        DECLE   $0348,  $00BF                   ; 6E28  SFX data
        DECLE   $03D9                           ; 6E2A  SFX data
        DECLE   $01AB                           ; 6E2B  SFX data
        DECLE   $0340,  $01FC                   ; 6E2C  SFX data
        DECLE   $0348,  $00D6                   ; 6E2E  SFX data
        DECLE   $03C9                           ; 6E30  SFX data
        DECLE   $01AB                           ; 6E31  SFX data
        DECLE   $0348,  $02A6                   ; 6E32  SFX data
        DECLE   $0005                           ; 6E34  SFX data
        DECLE   $01AB                           ; 6E35  SFX data
        DECLE   $0348,  $00FE                   ; 6E36  SFX data
        DECLE   $0345                           ; 6E38  SFX data
        DECLE   $01AB                           ; 6E39  SFX data
        DECLE   $0344,  $01AB                   ; 6E3A  SFX data
        DECLE   $03B9                           ; 6E3C  SFX data
        DECLE   $01AB                           ; 6E3D  SFX data
        DECLE   $0345                           ; 6E3E  SFX data
        DECLE   $0365                           ; 6E3F  SFX data
        DECLE   $0344,  $007F                   ; 6E40  SFX data
        DECLE   $0389                           ; 6E42  SFX data
        DECLE   $01AB                           ; 6E43  SFX data
        DECLE   $02CF                           ; 6E44  SFX end

L_6E45:
        PSHR    R5                              ; 6E45   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6E46   0004 0119 03BE
        DECLE   $008C                           ; 6E49  SFX prio
        DECLE   $013D                           ; 6E4A  SFX data
        DECLE   $0340,  $0356                   ; 6E4B  SFX data
        DECLE   $0348,  $01AB                   ; 6E4D  SFX data
        DECLE   $0344,  $00D6                   ; 6E4F  SFX data
        DECLE   $0389                           ; 6E51  SFX data
        DECLE   $01AB                           ; 6E52  SFX data
        DECLE   $0035                           ; 6E53  SFX data
        DECLE   $002B                           ; 6E54  SFX data
        DECLE   $0340,  $023B                   ; 6E55  SFX data
        DECLE   $0344,  $008F                   ; 6E57  SFX data
        DECLE   $03A9                           ; 6E59  SFX data
        DECLE   $01AB                           ; 6E5A  SFX data
        DECLE   $0035                           ; 6E5B  SFX data
        DECLE   $002B                           ; 6E5C  SFX data
        DECLE   $0375                           ; 6E5D  SFX data
        DECLE   $0344,  $00BF                   ; 6E5E  SFX data
        DECLE   $03A9                           ; 6E60  SFX data
        DECLE   $01EB                           ; 6E61  SFX data
        DECLE   $0340,  $017C                   ; 6E62  SFX data
        DECLE   $0348,  $00E2                   ; 6E64  SFX data
        DECLE   $0344,  $00AA                   ; 6E66  SFX data
        DECLE   $0389                           ; 6E68  SFX data
        DECLE   $01AB                           ; 6E69  SFX data
        DECLE   $03F9                           ; 6E6A  SFX data
        DECLE   $0023,  $0379                   ; 6E6B  SFX data
        DECLE   $0340,  $0356                   ; 6E6D  SFX data
        DECLE   $0348,  $01AB                   ; 6E6F  SFX data
        DECLE   $0344,  $00D6                   ; 6E71  SFX data
        DECLE   $0389                           ; 6E73  SFX data
        DECLE   $008F,  $001D                   ; 6E74  SFX data
        DECLE   $0035                           ; 6E76  SFX data
        DECLE   $006B                           ; 6E77  SFX data
        DECLE   $0345                           ; 6E78  SFX data
        DECLE   $0348,  $00AA                   ; 6E79  SFX data
        DECLE   $0344,  $006B                   ; 6E7B  SFX data
        DECLE   $0389                           ; 6E7D  SFX data
        DECLE   $008F,  $0015                   ; 6E7E  SFX data
        DECLE   $03F9                           ; 6E80  SFX data
        DECLE   $006B                           ; 6E81  SFX data
        DECLE   $0340,  $02A6                   ; 6E82  SFX data
        DECLE   $0348,  $0153                   ; 6E84  SFX data
        DECLE   $0344,  $00D6                   ; 6E86  SFX data
        DECLE   $0389                           ; 6E88  SFX data
        DECLE   $01AB                           ; 6E89  SFX data
        DECLE   $0035                           ; 6E8A  SFX data
        DECLE   $002B                           ; 6E8B  SFX data
        DECLE   $0375                           ; 6E8C  SFX data
        DECLE   $0340,  $023B                   ; 6E8D  SFX data
        DECLE   $008F,  $001F                   ; 6E8F  SFX data
        DECLE   $03EB                           ; 6E91  SFX data
        DECLE   $02CF                           ; 6E92  SFX end

L_6E93:
        PSHR    R5                              ; 6E93   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6E94   0004 0119 03BE
        DECLE   $0070                           ; 6E97  SFX prio
        DECLE   $02C0,  $01CA                   ; 6E98  SFX data
        DECLE   $02C8,  $008E                   ; 6E9A  SFX data
        DECLE   $0284,  $0054                   ; 6E9C  SFX data
        DECLE   $0389                           ; 6E9E  SFX data
        DECLE   $006B                           ; 6E9F  SFX data
        DECLE   $02C0,  $004F                   ; 6EA0  SFX data
        DECLE   $0288,  $0087                   ; 6EA2  SFX data
        DECLE   $0304,  $0053                   ; 6EA4  SFX data
        DECLE   $006B                           ; 6EA6  SFX data
        DECLE   $02C0,  $004C                   ; 6EA7  SFX data
        DECLE   $0288,  $00B4                   ; 6EA9  SFX data
        DECLE   $0304,  $005D                   ; 6EAB  SFX data
        DECLE   $006B                           ; 6EAD  SFX data
        DECLE   $02C0,  $0057                   ; 6EAE  SFX data
        DECLE   $02C8,  $00AB                   ; 6EB0  SFX data
        DECLE   $0344,  $0053                   ; 6EB2  SFX data
        DECLE   $006B                           ; 6EB4  SFX data
        DECLE   $02C0,  $004F                   ; 6EB5  SFX data
        DECLE   $0208,  $00A4                   ; 6EB7  SFX data
        DECLE   $0204,  $0049                   ; 6EB9  SFX data
        DECLE   $006B                           ; 6EBB  SFX data
        DECLE   $0240,  $001E                   ; 6EBC  SFX data
        DECLE   $0248,  $0057                   ; 6EBE  SFX data
        DECLE   $0204,  $001D                   ; 6EC0  SFX data
        DECLE   $006B                           ; 6EC2  SFX data
        DECLE   $02CF                           ; 6EC3  SFX end

L_6EC4:
        PSHR    R5                              ; 6EC4   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6EC5   0004 0119 03BE
        DECLE   $0096                           ; 6EC8  SFX prio
        DECLE   $002F                           ; 6EC9  SFX data
        DECLE   $0240,  $01BF                   ; 6ECA  SFX data
        DECLE   $0288,  $00AC                   ; 6ECC  SFX data
        DECLE   $0104,  $0015                   ; 6ECE  SFX data
        DECLE   $03C1,  $03F0                   ; 6ED0  SFX data
        DECLE   $03C1,  $03DD                   ; 6ED2  SFX data
        DECLE   $01F6                           ; 6ED4  SFX data
        DECLE   $038D                           ; 6ED5  SFX data
        DECLE   $0009                           ; 6ED6  SFX data
        DECLE   $00AB                           ; 6ED7  SFX data
        DECLE   $03C1,  $0169                   ; 6ED8  SFX data
        DECLE   $0215                           ; 6EDA  SFX data
        DECLE   $012B                           ; 6EDB  SFX data
        DECLE   $020D                           ; 6EDC  SFX data
        DECLE   $0382                           ; 6EDD  SFX data
        DECLE   $0386                           ; 6EDE  SFX data
        DECLE   $03C1,  $0010                   ; 6EDF  SFX data
        DECLE   $0025                           ; 6EE1  SFX data
        DECLE   $016B                           ; 6EE2  SFX data
        DECLE   $0240,  $03BC                   ; 6EE3  SFX data
        DECLE   $0344,  $0028                   ; 6EE5  SFX data
        DECLE   $03C1,  $0013                   ; 6EE7  SFX data
        DECLE   $02CD                           ; 6EE9  SFX data
        DECLE   $016B                           ; 6EEA  SFX data
        DECLE   $0288,  $00AD                   ; 6EEB  SFX data
        DECLE   $026D                           ; 6EED  SFX data
        DECLE   $006B                           ; 6EEE  SFX data
        DECLE   $0204,  $004C                   ; 6EEF  SFX data
        DECLE   $0386                           ; 6EF1  SFX data
        DECLE   $002B                           ; 6EF2  SFX data
        DECLE   $03AD                           ; 6EF3  SFX data
        DECLE   $00AB                           ; 6EF4  SFX data
        DECLE   $02D5                           ; 6EF5  SFX data
        DECLE   $0386                           ; 6EF6  SFX data
        DECLE   $0001,  $0011                   ; 6EF7  SFX data
        DECLE   $002B                           ; 6EF9  SFX data
        DECLE   $0005                           ; 6EFA  SFX data
        DECLE   $0029                           ; 6EFB  SFX data
        DECLE   $02E5                           ; 6EFC  SFX data
        DECLE   $020D                           ; 6EFD  SFX data
        DECLE   $002B                           ; 6EFE  SFX data
        DECLE   $0240,  $023E                   ; 6EFF  SFX data
        DECLE   $03C2                           ; 6F01  SFX data
        DECLE   $006B                           ; 6F02  SFX data
        DECLE   $0284,  $0055                   ; 6F03  SFX data
        DECLE   $0386                           ; 6F05  SFX data
        DECLE   $032D                           ; 6F06  SFX data
        DECLE   $00EB                           ; 6F07  SFX data
        DECLE   $0204,  $001D                   ; 6F08  SFX data
        DECLE   $00EB                           ; 6F0A  SFX data
        DECLE   $026D                           ; 6F0B  SFX data
        DECLE   $02CF                           ; 6F0C  SFX end

L_6F0D:
        PSHR    R5                              ; 6F0D   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F0E   0004 0119 03BE
        DECLE   $006C                           ; 6F11  SFX prio
        DECLE   $02C0,  $00AA                   ; 6F12  SFX data
        DECLE   $0348,  $021A                   ; 6F14  SFX data
        DECLE   $0244,  $0395                   ; 6F16  SFX data
        DECLE   $02CD                           ; 6F18  SFX data
        DECLE   $0309                           ; 6F19  SFX data
        DECLE   $006B                           ; 6F1A  SFX data
        DECLE   $0140,  $00AD                   ; 6F1B  SFX data
        DECLE   $0195                           ; 6F1D  SFX data
        DECLE   $002B                           ; 6F1E  SFX data
        DECLE   $0265                           ; 6F1F  SFX data
        DECLE   $006B                           ; 6F20  SFX data
        DECLE   $02CF                           ; 6F21  SFX end

L_6F22:
        PSHR    R5                              ; 6F22   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F23   0004 0119 03BE
        DECLE   $0094                           ; 6F26  SFX prio
        DECLE   $002F                           ; 6F27  SFX data
        DECLE   $03C0,  $00A2                   ; 6F28  SFX data
        DECLE   $0208,  $0053                   ; 6F2A  SFX data
        DECLE   $0084,  $0029                   ; 6F2C  SFX data
        DECLE   $03ED                           ; 6F2E  SFX data
        DECLE   $0189                           ; 6F2F  SFX data
        DECLE   $006B                           ; 6F30  SFX data
        DECLE   $03A8,  $00BD                   ; 6F31  SFX data
        DECLE   $002B                           ; 6F33  SFX data
        DECLE   $02CF                           ; 6F34  SFX end

L_6F35:
        PSHR    R5                              ; 6F35   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F36   0004 0119 03BE
        DECLE   $0078                           ; 6F39  SFX prio
        DECLE   $022F                           ; 6F3A  SFX data
        DECLE   $0013,  $002C                   ; 6F3B  SFX data
        DECLE   $03E9                           ; 6F3D  SFX data
        DECLE   $0340,  $0035                   ; 6F3E  SFX data
        DECLE   $031B                           ; 6F40  SFX data
        DECLE   $0001,  $03F4                   ; 6F41  SFX data
        DECLE   $00EB                           ; 6F43  SFX data
        DECLE   $0001,  $0030                   ; 6F44  SFX data
        DECLE   $0023,  $03E0                   ; 6F46  SFX data
        DECLE   $0003,  $03C4                   ; 6F48  SFX data
        DECLE   $02CF                           ; 6F4A  SFX end

L_6F4B:
        PSHR    R5                              ; 6F4B   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F4C   0004 0119 03BE
        DECLE   $0082                           ; 6F4F  SFX prio
        DECLE   $002F                           ; 6F50  SFX data
        DECLE   $03E9                           ; 6F51  SFX data
        DECLE   $019D                           ; 6F52  SFX data
        DECLE   $0340,  $00A0                   ; 6F53  SFX data
        DECLE   $01AB                           ; 6F55  SFX data
        DECLE   $0340,  $00CA                   ; 6F56  SFX data
        DECLE   $01AB                           ; 6F58  SFX data
        DECLE   $0340,  $0087                   ; 6F59  SFX data
        DECLE   $01AB                           ; 6F5B  SFX data
        DECLE   $0340,  $00B4                   ; 6F5C  SFX data
        DECLE   $01AB                           ; 6F5E  SFX data
        DECLE   $0340,  $0078                   ; 6F5F  SFX data
        DECLE   $01AB                           ; 6F61  SFX data
        DECLE   $0340,  $0097                   ; 6F62  SFX data
        DECLE   $01AB                           ; 6F64  SFX data
        DECLE   $0340,  $00E2                   ; 6F65  SFX data
        DECLE   $00E3,  $03A8                   ; 6F67  SFX data
        DECLE   $0340,  $00CA                   ; 6F69  SFX data
        DECLE   $01AB                           ; 6F6B  SFX data
        DECLE   $0340,  $0087                   ; 6F6C  SFX data
        DECLE   $01AB                           ; 6F6E  SFX data
        DECLE   $0340,  $00A0                   ; 6F6F  SFX data
        DECLE   $00AB                           ; 6F71  SFX data
        DECLE   $0340,  $0065                   ; 6F72  SFX data
        DECLE   $022F                           ; 6F74  SFX data
        DECLE   $03D1,  $0020                   ; 6F75  SFX data
        DECLE   $03D2                           ; 6F77  SFX data
        DECLE   $008F,  $0013                   ; 6F78  SFX data
        DECLE   $002F                           ; 6F7A  SFX data
        DECLE   $02CF                           ; 6F7B  SFX end

L_6F7C:
        PSHR    R5                              ; 6F7C   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F7D   0004 0119 03BE
        DECLE   $00B4                           ; 6F80  SFX prio
        DECLE   $02CF                           ; 6F81  SFX end

L_6F82:
        PSHR    R5                              ; 6F82   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6F83   0004 0119 03BE
        DECLE   $006C                           ; 6F86  SFX prio
        DECLE   $002F                           ; 6F87  SFX data
        DECLE   $01C9                           ; 6F88  SFX data
        DECLE   $016D                           ; 6F89  SFX data
        DECLE   $002B                           ; 6F8A  SFX data
        DECLE   $01C0,  $00AF                   ; 6F8B  SFX data
        DECLE   $01C8,  $02BB                   ; 6F8D  SFX data
        DECLE   $0104,  $0033                   ; 6F8F  SFX data
        DECLE   $025B                           ; 6F91  SFX data
        DECLE   $00CE                           ; 6F92  SFX data
        DECLE   $03C1,  $0273                   ; 6F93  SFX data
        DECLE   $0017,  $0005                   ; 6F95  SFX data
        DECLE   $0001,  $0003                   ; 6F97  SFX data
        DECLE   $000E                           ; 6F99  SFX data
        DECLE   $0017,  $000A                   ; 6F9A  SFX data
        DECLE   $03C1,  $0193                   ; 6F9C  SFX data
        DECLE   $0017,  $0005                   ; 6F9E  SFX data
        DECLE   $0035                           ; 6FA0  SFX data
        DECLE   $0023,  $0398                   ; 6FA1  SFX data
        DECLE   $02CF                           ; 6FA3  SFX end

L_6FA4:
        PSHR    R5                              ; 6FA4   0275

        JSRE    R5,     X_PLAY_SFX2             ; 6FA5   0004 0119 03BE
        DECLE   $0082                           ; 6FA8  SFX prio
        DECLE   $002F                           ; 6FA9  SFX data
        DECLE   $03C0,  $023E                   ; 6FAA  SFX data
        DECLE   $03E9                           ; 6FAC  SFX data
        DECLE   $002B                           ; 6FAD  SFX data
        DECLE   $0248,  $00C3                   ; 6FAE  SFX data
        DECLE   $0204,  $007C                   ; 6FB0  SFX data
        DECLE   $0389                           ; 6FB2  SFX data
        DECLE   $012B                           ; 6FB3  SFX data
        DECLE   $0208,  $00AA                   ; 6FB4  SFX data
        DECLE   $0204,  $0056                   ; 6FB6  SFX data
        DECLE   $002B                           ; 6FB8  SFX data
        DECLE   $0310,  $0075                   ; 6FB9  SFX data
        DECLE   $002B                           ; 6FBB  SFX data
        DECLE   $0265                           ; 6FBC  SFX data
        DECLE   $03C9                           ; 6FBD  SFX data
        DECLE   $006B                           ; 6FBE  SFX data
        DECLE   $0235                           ; 6FBF  SFX data
        DECLE   $00AB                           ; 6FC0  SFX data
        DECLE   $03C0,  $023E                   ; 6FC1  SFX data
        DECLE   $0248,  $00C3                   ; 6FC3  SFX data
        DECLE   $00AB                           ; 6FC5  SFX data
        DECLE   $0204,  $007C                   ; 6FC6  SFX data
        DECLE   $0389                           ; 6FC8  SFX data
        DECLE   $00AB                           ; 6FC9  SFX data
        DECLE   $0305                           ; 6FCA  SFX data
        DECLE   $0248,  $0060                   ; 6FCB  SFX data
        DECLE   $0204,  $0056                   ; 6FCD  SFX data
        DECLE   $002B                           ; 6FCF  SFX data
        DECLE   $0300,  $0128                   ; 6FD0  SFX data
        DECLE   $006B                           ; 6FD2  SFX data
        DECLE   $0200,  $003B                   ; 6FD3  SFX data
        DECLE   $0208,  $0017                   ; 6FD5  SFX data
        DECLE   $0204,  $0013                   ; 6FD7  SFX data
        DECLE   $00AB                           ; 6FD9  SFX data
        DECLE   $0300,  $0094                   ; 6FDA  SFX data
        DECLE   $02C8,  $001E                   ; 6FDC  SFX data
        DECLE   $002B                           ; 6FDE  SFX data
        DECLE   $03C5                           ; 6FDF  SFX data
        DECLE   $0382                           ; 6FE0  SFX data
        DECLE   $0204,  $0010                   ; 6FE1  SFX data
        DECLE   $00AB                           ; 6FE3  SFX data
        DECLE   $03C0,  $004A                   ; 6FE4  SFX data
        DECLE   $0208,  $0019                   ; 6FE6  SFX data
        DECLE   $0284,  $0017                   ; 6FE8  SFX data
        DECLE   $0382                           ; 6FEA  SFX data
        DECLE   $016B                           ; 6FEB  SFX data
        DECLE   $03C0,  $0025                   ; 6FEC  SFX data
        DECLE   $0208,  $0014                   ; 6FEE  SFX data
        DECLE   $0204,  $0011                   ; 6FF0  SFX data
        DECLE   $012B                           ; 6FF2  SFX data
        DECLE   $0304,  $0013                   ; 6FF3  SFX data
        DECLE   $0086                           ; 6FF5  SFX data
        DECLE   $03A9                           ; 6FF6  SFX data
        DECLE   $006B                           ; 6FF7  SFX data
        DECLE   $0280,  $002A                   ; 6FF8  SFX data
        DECLE   $0386                           ; 6FFA  SFX data
        DECLE   $00AB                           ; 6FFB  SFX data
        DECLE   $02C0,  $0018                   ; 6FFC  SFX data
        DECLE   $006B                           ; 6FFE  SFX data
        DECLE   $02CF                           ; 6FFF  SFX end

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $50CF       <entry>
;;  $50ED       $50CF  
;;  $5156       <entry>
;;  $5197       $5188  
;;  $51DD       $5194   $51A0  
;;  $51F1       $51EB  
;;  $51F3       $51EF  
;;  $521A       $541A  
;;  $522F       $524C  
;;  $5256       $521E   $5233  
;;  $5260       $5266  
;;  $5268       $5261  
;;  $526C       $5225   $5241  
;;  $5273       $5276  
;;  $5279       $538F  
;;  $528E       $5289  
;;  $5294       $5283  
;;  $52A1       $529C  
;;  $52A7       $5296  
;;  $52B4       $52AF  
;;  $52BA       $52A9  
;;  $52C7       $52C2  
;;  $52CD       $52BC  
;;  $52DA       $52D5  
;;  $52E0       $52CF  
;;  $52ED       $52E8  
;;  $52F3       $52E2  
;;  $5300       $52FB  
;;  $5306       $52F5  
;;  $5313       $530E  
;;  $5319       $5308  
;;  $5322       $531D  
;;  $5326       $5292   $52A5   $52B8   $52CB   $52DE   $52F1   $5304   $5317  
;;  $5336       $5285   $5298   $52AB   $52BE  
;;  $5344       $52D1   $52E4  
;;  $5354       $52F7   $530A   $5319  
;;  $5364       $5F92  
;;  $5379       $51D2   $5F95   $5FFC  
;;  $5395       $539D  
;;  $53AF       $53B4  
;;  $53B6       $53B0   $53BC  
;;  $53BE       $53B7  
;;  $53D0       $53C3  
;;  $53FE       $5403  
;;  $540F       $5414  
;;  $541A       $5409   $5411  
;;  $541E       $5FFF  
;;  $5421       $5450  
;;  $5423       $5448  
;;  $5439       $5430  
;;  $5442       $542C   $5437   $543B  
;;  $5453       $5371  
;;  $5468       $5464  
;;  $5469       $545C  
;;  $546D       $5389  
;;  $5480       $537A   $5F7C  
;;  $5489       $5492  
;;  $5495       $536E  
;;  $549C       $54A0  
;;  $54A5       $54A9  
;;  $54BE       $537D   $5522   $557E   $558E   $58EE   $592A   $5DF6   $5F8C  
;;  $54BE       $5FB2  
;;  $54C4       $628C   $62B0  
;;  $54C9       $54C2   $54D7  
;;  $54DD       $5380   $5525   $5DBB   $5F8F   $6037   $609E   $6342  
;;  $54E3       $54E5  
;;  $54E8       $5D42   $5E26  
;;  $54F1       $5FE3   $6002  
;;  $5532       $552E   $5EC2  
;;  $554A       $5FC6   $6025  
;;  $5564       $5552  
;;  $5574       $555B   $556C  
;;  $5577       $554F  
;;  $558B       $5578  
;;  $559A       $5589  
;;  $55A4       $559E  
;;  $55A7       $5583   $5593  
;;  $55CD       $554B   $5557   $5568   $559A  
;;  $55D5       $5747   $574B   $5750   $5754   $68D1   $68D5   $68DA   $68DE  
;;  $55E3       $550C   $6513   $6556   $6570   $659A   $65BF   $6600   $6619  
;;  $55E3       $6633   $667F   $6698   $66B1  
;;  $55EB       $5434   $543F  
;;  $55EE       $64FD   $6538   $654A   $65A8   $65C5   $65E2   $65F4   $664C  
;;  $55EE       $6662   $6673  
;;  $55F1       $55E9   $55EC  
;;  $5601       $55F3  
;;  $5611       $5603  
;;  $5621       $5613  
;;  $5631       $5623  
;;  $5641       $5633  
;;  $5651       $5643  
;;  $5661       $5653  
;;  $5671       $5663  
;;  $5681       $5673  
;;  $5691       $5683  
;;  $56A1       $5693  
;;  $56B1       $56A3  
;;  $56C1       $56B3  
;;  $56D1       $56C3  
;;  $56E1       $56D3  
;;  $56F1       $56E3  
;;  $5701       $56F3  
;;  $5711       $5703  
;;  $5721       $5713  
;;  $5731       $5723  
;;  $5741       $5733  
;;  $5742       $5252  
;;  $5743       $55FF   $560F   $561F   $562F   $563F   $564F   $565F   $566F  
;;  $5743       $567F   $568F   $569F   $56AF   $56BF   $56CF   $56DF   $56EF  
;;  $5743       $56FF   $570F   $571F   $572F   $573F  
;;  $5757       $5745  
;;  $5762       $575C  
;;  $5767       $575F   $5764  
;;  $576F       $576C  
;;  $5775       $60C1  
;;  $5776       $5773  
;;  $57AF       $577A   $577D  
;;  $57B3       $5781   $5785   $5789  
;;  $57E4       $57DB  
;;  $57EF       $578D   $5791   $5795  
;;  $5820       $5817  
;;  $582B       $57A5   $57A9   $57AD  
;;  $585C       $5853  
;;  $5867       $5799   $579D   $57A1  
;;  $5898       $588F  
;;  $58A3       $57B3   $57EF   $582B   $5867  
;;  $58B6       $597F   $59B1   $59DF   $5A07   $5A24   $5B2E   $5E92   $623C  
;;  $58B9       $58BD  
;;  $58C1       $57BC   $57F8   $5834   $5870  
;;  $58D0       $58C4  
;;  $58F9       $58DC  
;;  $5908       $58D3  
;;  $5935       $5918  
;;  $5944       $590B  
;;  $5949       $61E7  
;;  $5951       $594E  
;;  $5998       $5970   $5975  
;;  $59C6       $599D   $59A2  
;;  $59F5       $59CB   $59D0  
;;  $5A17       $59FD  
;;  $5A33       $59F8   $5A1A  
;;  $5A45       $5A3B  
;;  $5A57       $5A4D  
;;  $5A64       $5A36   $5A5A  
;;  $5A69       $5957   $5A48  
;;  $5A6A       $5990   $59C2   $59EA   $5A13   $5A30  
;;  $5A7E       $5A72  
;;  $5A86       $5A7C  
;;  $5A95       $620A   $637A   $63BF   $6406   $644D  
;;  $5AB2       $5AA4  
;;  $5AB3       $622B   $639F   $63CC   $6413   $645A  
;;  $5ACB       $5AC3  
;;  $5ACF       $5AC9  
;;  $5AE3       $5ADA  
;;  $5AEB       $5AD6   $5AE1   $5AE5  
;;  $5B0A       $5AF6   $5AFC  
;;  $5B0B       $5AED  
;;  $5B26       $5B12   $5B18  
;;  $5B27       $5A41   $5A53   $5A60  
;;  $5B4D       $5B67  
;;  $5B55       $5B39  
;;  $5B69       $63E2   $6429   $6471  
;;  $5B87       $5B80  
;;  $5B8A       $5B85  
;;  $5B8F       $5B76  
;;  $5B90       $63EB   $6432   $6479  
;;  $5BBC       $5BB0  
;;  $5BC6       $5BA9  
;;  $5BD7       $5BCB  
;;  $5BE0       $5B9A   $5B9E  
;;  $5BEE       $58D7   $5913  
;;  $5C00       $5BFB  
;;  $5C02       $57E1   $581D   $5859   $5895   $58EB   $58FD   $5927   $5939  
;;  $5C02       $61AE  
;;  $5C15       $53F7   $551E   $5539   $5544   $5D0F   $61B6  
;;  $5C1B       $538C   $54F9   $5C72   $6034  
;;  $5C23       $5C29  
;;  $5C3A       $5C3F  
;;  $5C41       $5C33  
;;  $5C42       $5CFC   $5D1B   $5D58   $5D73   $5DC4   $634B   $6518   $6575  
;;  $5C42       $659F   $661E   $669D  
;;  $5C5E       $5C50  
;;  $5C78       $5C65   $5C6E  
;;  $5C79       $5CFF   $5D23   $5D5B   $5D76   $5DC7   $634E   $651B   $6578  
;;  $5C79       $65A2   $6621   $66A0  
;;  $5C8B       $5C85  
;;  $5C8D       $5C89  
;;  $5C9F       $5C99  
;;  $5CA1       $5C9D  
;;  $5CB7       $5CB1  
;;  $5CB9       $5CB5   $5CC3  
;;  $5CC5       $5CBE  
;;  $5CC6       $5F68  
;;  $5CEA       $5CE5  
;;  $5CF1       $5CE8  
;;  $5D03       $5F79  
;;  $5D14       $5D21  
;;  $5D1E       $5D17  
;;  $5D93       $5D35   $5D91  
;;  $5DB2       $5D2C   $5D30   $5D3C   $5D40   $5D64   $5D88   $5D8C  
;;  $5DBB       $5DB8  
;;  $5DE9       $5DE6  
;;  $5E02       $5DE2  
;;  $5E0D       $5DF1  
;;  $5E29       $5E14   $5E18  
;;  $5E3E       $5E30   $5E34  
;;  $5E53       $5E45   $5E49  
;;  $5E68       $5E5A   $5E5E  
;;  $5E69       $5365   $557B   $558B   $5DF3   $5E06  
;;  $5E7C       $51D5   $5F98   $603A   $609B   $61CE  
;;  $5E87       $5213   $5E7D   $5FEF   $600E  
;;  $5E9A       $5216   $5E80   $6011  
;;  $5EB1       $5E83  
;;  $5EC2       $5EBD  
;;  $5EC6       $57E6   $57EB   $5822   $5827   $585E   $5863   $589A   $589F  
;;  $5EC6       $5A9B   $5B6E   $606B   $6070   $61BD   $61C2   $62EB   $6316  
;;  $5EC6       $6339  
;;  $5EEB       $5ECB  
;;  $5EF0       $6064  
;;  $5F03       $5EF5  
;;  $5F12       $5F09   $5F0E  
;;  $5F1F       $5F19  
;;  $5F21       $5F1D  
;;  $5F38       $5F2F  
;;  $5F42       $5F3F  
;;  $5F48       $5F44  
;;  $5F62       $5F5A  
;;  $5F68       $5F52  
;;  $5F75       $5F4A  
;;  $5F88       $5F77  
;;  $5FA0       $5F8A  
;;  $5FAA       $5FA2  
;;  $5FC2       $5FAC  
;;  $5FD6       $5FCF  
;;  $5FDE       $5FD8  
;;  $5FDF       $5FC4  
;;  $5FEB       $5FE1  
;;  $600A       $5FED  
;;  $6021       $600C  
;;  $602D       $602A  
;;  $6042       $6023  
;;  $6047       $5F35   $5F46   $5FA8  
;;  $6069       $6062  
;;  $609B       $6097  
;;  $60A2       $607F  
;;  $60C6       $60BF  
;;  $60CB       $6083  
;;  $60DE       $60D7  
;;  $60E5       $60DC  
;;  $610A       $60FE  
;;  $6114       $60FA  
;;  $611E       $611A  
;;  $612B       $6108   $6112  
;;  $613F       $6132  
;;  $614E       $6141  
;;  $615D       $6150  
;;  $616C       $615F  
;;  $617B       $616E  
;;  $6183       $613D   $614C   $615B   $616A   $6179  
;;  $61A2       $6087  
;;  $61C7       $608B  
;;  $61CC       $605A   $608F  
;;  $61DE       $6093  
;;  $61E0       $604E   $6054   $6067   $6077   $6099   $60C4   $60C9   $61A0  
;;  $61E0       $61C5   $61DE  
;;  $61E7       $61E4  
;;  $6202       $61FE  
;;  $620F       $6204  
;;  $6227       $621A  
;;  $6230       $6211  
;;  $6249       $6252  
;;  $6254       $624A  
;;  $6255       $627C   $630E  
;;  $626D       $6285  
;;  $627F       $62AA  
;;  $6288       $6266  
;;  $62A3       $6260  
;;  $62C7       $62A4  
;;  $62CD       $6232  
;;  $62E5       $62CF  
;;  $6303       $62E7  
;;  $6310       $6305  
;;  $6331       $631D  
;;  $6333       $6312  
;;  $635E       $6335  
;;  $6363       $61EE   $61F4   $6200   $620D   $6225   $622E   $62A1   $62C5  
;;  $6363       $62CB   $62E3   $62F2   $6300   $6331   $6340   $6361  
;;  $6370       $636C  
;;  $6387       $6374  
;;  $639B       $638F  
;;  $63A4       $6389  
;;  $63A9       $6367   $636E   $6385   $63A2   $63A7  
;;  $63C4       $63B9  
;;  $63D1       $63C6  
;;  $63DE       $63D3  
;;  $63E7       $63D7  
;;  $63F0       $63AD   $63B3   $63C2   $63CF   $63DC   $63E5   $63EE  
;;  $640B       $6400  
;;  $6418       $640D  
;;  $6425       $641A  
;;  $642E       $641E  
;;  $6437       $63F4   $63FA   $6409   $6416   $6423   $642C   $6435  
;;  $6452       $6447  
;;  $645F       $6454  
;;  $646D       $6461  
;;  $6475       $6465  
;;  $647D       $643B   $6441   $6450   $645D   $646A  
;;  $647F       $60B6   $61D8   $6398  
;;  $64A6       $6487  
;;  $64A7       $60B3   $61D5   $6395  
;;  $64B5       $64AC  
;;  $64B7       $64B3  
;;  $64C4       $64BE  
;;  $64CC       $64C6  
;;  $64D4       $64CE  
;;  $64DC       $64D6  
;;  $64E0       $64C0  
;;  $64FB       $64EE  
;;  $6501       $64EB  
;;  $651E       $6503  
;;  $651F       $64C8  
;;  $6530       $652D  
;;  $653C       $6532  
;;  $654E       $652A  
;;  $655E       $654F  
;;  $6575       $655B  
;;  $657B       $6560  
;;  $657C       $64D0  
;;  $65A6       $6596  
;;  $65AC       $6584  
;;  $65C3       $65BB  
;;  $65C9       $64D8  
;;  $65DA       $65D7  
;;  $65E6       $65DC  
;;  $65F8       $65D4  
;;  $6607       $65F9  
;;  $661E       $6605  
;;  $6625       $6609  
;;  $6637       $64DC  
;;  $6650       $6645  
;;  $6666       $6652  
;;  $6677       $6642  
;;  $6686       $6678  
;;  $669D       $6684  
;;  $66A4       $6688  
;;  $66B5       $6255  
;;  $66DE       $66D0  
;;  $66ED       $66D4   $66DF   $66E3  
;;  $66F5       $66EE  
;;  $66FD       $66F6  
;;  $6705       $66FE  
;;  $670D       $6706  
;;  $6712       $66D7   $66E9   $66F9   $6701   $6709  
;;  $672E       $66DA   $66E6   $66F1   $6703   $670B  
;;  $674B       $66EB   $66FB   $6710  
;;  $6767       $66DC   $66F3   $670E  
;;  $6784       <entry>
;;  $678B       $67AF   $67D6  
;;  $67A8       $6796  
;;  $67C5       $67BF  
;;  $67C9       $67B4  
;;  $67D9       $67A5  
;;  $67E5       $6A2D  
;;  $67F7       $67DE  
;;  $6812       $67F9  
;;  $682D       $6814  
;;  $6844       <entry>
;;  $685B       $6849  
;;  $686B       $5FB5  
;;  $68C7       $5F5E   $5F64  
;;  $68CC       $68E1  
;;  $68E3       $68CF  
;;  $6A9A       $6A9A  
;;  $6AA9       $6AA9  
;;  $6AE5       $6AE5  
;;  $6AF4       $6AF4  
;;  $6B03       $6B03  
;;  $6CAB       $6CA9  
;;  $6CCC       $60A2   $61D1  
;;  $6CE7       $528B   $52C4   $52D7   $5310  
;;  $6D36       $64A2  
;;  $6D87       $58C8   $58E0   $591C   $6320  
;;  $6DA1       $613A   $6149   $6158   $6167   $6176   $6180  
;;  $6DC1       $529E   $52EA  
;;  $6E45       $52B1   $52FD   $531F  
;;  $6E93       $62FD  
;;  $6EC4       $5D8E  
;;  $6F0D       $5AAF  
;;  $6F22       $5D32  
;;  $6F35       $59F1  
;;  $6F4B       $5D6E  
;;  $6F7C       $54E9  
;;  $6F82       $5B8C   $5FBA  
;;  $6FA4       $5C75  
;; ======================================================================== ;;
