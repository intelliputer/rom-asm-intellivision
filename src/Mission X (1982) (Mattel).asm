
        ORG     $5000
.HEADER:
        BIDECLE $58BC           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5109           ; 5004  Ptr: Start of game
        BIDECLE $5694           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5686           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5038           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0013,  $0063,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00D3,  $005B,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0065,  $005E,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $0094,  $0060,  $0006,  $0000; 5028  Timer dispatch/interval
        DECLE   $00E5,  $0061,  $0001,  $0000; 502C  Timer dispatch/interval
        BIDECLE $5D00           ; 5030  End of timer table

        DECLE   $0090,  $0001,  $0000,  $0000   ; 5032   0090 0001 0000 0000
        DECLE   $0000,  $0000                   ; 5036   0000 0000
.TITLE:
        DECLE   $0052                           ; 5038  Cartridge year
        STRING  "MISSION  X"                    ; 5039  Title string
        DECLE   $0000                           ; 5043  

.TITLECODE:
        PSHR    R5                              ; 5044   0275
        MVI     .BTAB.25,R0                     ; 5045   0280 0225
        ADDI    #$0007, R0                      ; 5047   02F8 0007
        MVO     R0,     .BTAB.25                ; 5049   0240 0225
        MVII    #$0007, R3                      ; 504B   02BB 0007
        MVII    #$02C8, R4                      ; 504D   02BC 02C8

        JSR     R5,     X_PRINT_R5              ; 504F   0004 0118 007B
        STRING  "     1982 Mattel    "          ; 5052  
        STRING  "    1982 Data East "           ; 5066  
        DECLE   $0000                           ; 5079   0000

        SDBD                                    ; 507A   0001
        MVII    #$0987, R0                      ; 507B   02B8 0087 0009
        MVO     R0,     .BTAB.CC                ; 507E   0240 02CC
        MVO     R0,     .BTAB.DF                ; 5080   0240 02DF
        SDBD                                    ; 5082   0001
        MVII    #$50FA, R0                      ; 5083   02B8 00FA 0050
        MVO     R0,     .ISRVEC.0               ; 5086   0240 0100
        SWAP    R0,     1                       ; 5088   0040
        MVO     R0,     .ISRVEC.1               ; 5089   0240 0101
        MVII    #$023C, R4                      ; 508B   02BC 023C
        MVII    #$0028, R3                      ; 508D   02BB 0028
L_508F:
        MVI@    R4,     R0                      ; 508F   02A0
        TSTR    R0                              ; 5090   0080
        BEQ     L_5097                          ; 5091   0204 0004

        DECR    R4                              ; 5093   0014
        SUBI    #$0003, R0                      ; 5094   0338 0003
        MVO@    R0,     R4                      ; 5096   0260
L_5097:
        DECR    R3                              ; 5097   0013
        BNEQ    L_508F                          ; 5098   022C 000A

        MVII    #$02C8, R4                      ; 509A   02BC 02C8
        MVII    #$0028, R3                      ; 509C   02BB 0028
L_509E:
        MVI@    R4,     R0                      ; 509E   02A0
        TSTR    R0                              ; 509F   0080
        BEQ     L_50A6                          ; 50A0   0204 0004

        DECR    R4                              ; 50A2   0014
        SUBI    #$0003, R0                      ; 50A3   0338 0003
        MVO@    R0,     R4                      ; 50A5   0260
L_50A6:
        DECR    R3                              ; 50A6   0013
        BNEQ    L_509E                          ; 50A7   022C 000A

        MVI     .PSG0.rgt_hand,R0               ; 50A9   0280 01FE
        ANDI    #$03FF, R0                      ; 50AB   03B8 03FF
        CMPI    #$00DD, R0                      ; 50AD   0378 00DD
        BNEQ    L_50F9                          ; 50AF   020C 0048

        MVI     .PSG0.lft_hand,R0               ; 50B1   0280 01FF
        ANDI    #$03FF, R0                      ; 50B3   03B8 03FF
        CMPI    #$00DB, R0                      ; 50B5   0378 00DB
        BNEQ    L_50F9                          ; 50B7   020C 0040

        MVII    #$0050, R0                      ; 50B9   02B8 0050
        MVII    #$0214, R1                      ; 50BB   02B9 0214
        MVII    #$023C, R4                      ; 50BD   02BC 023C

        JSR     R5,     .EXEC.730               ; 50BF   0004 0114 0330

        MVII    #$0014, R0                      ; 50C2   02B8 0014
        MVII    #$0250, R1                      ; 50C4   02B9 0250
        MVII    #$028C, R4                      ; 50C6   02BC 028C

        JSR     R5,     .EXEC.730               ; 50C8   0004 0114 0330

        MVII    #$0001, R3                      ; 50CB   02BB 0001
        MVII    #$0279, R4                      ; 50CD   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 50CF   0004 0118 007B
        STRING  "PROGRAMMED BY:      "          ; 50D2  
        STRING  "    JOHN TOMLINSON"            ; 50E6  
        DECLE   $0000                           ; 50F8   0000
L_50F9:
        PULR    R7                              ; 50F9   02B7

        PSHR    R5                              ; 50FA   0275
        CLRR    R0                              ; 50FB   01C0
        MVO     R0,     .STIC.CS.0              ; 50FC   0240 0028
        MVO     R0,     .STIC.BORD              ; 50FE   0240 002C

        JSR     R5,     X_DEF_ISR               ; 5100   0004 0110 0126
        JSR     R5,     L_5651                  ; 5103   0004 0154 0251

        PULR    R7                              ; 5106   02B7

        MVII    #$003F, R0                      ; 5107   02B8 003F
.START:
        MVII    #$003F, R0                      ; 5109   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 510B   0240 01F8
        MVO     R0,     G_018F                  ; 510D   0240 018F
        SDBD                                    ; 510F   0001
        MVII    #$5030, R1                      ; 5110   02B9 0030 0050

        JSR     R5,     .EXEC.81E               ; 5113   0004 0118 001E

        MVII    #$031D, R4                      ; 5116   02BC 031D
        MVII    #$0040, R3                      ; 5118   02BB 0040
        CLRR    R0                              ; 511A   01C0
L_511B:
        MVO@    R0,     R4                      ; 511B   0260
        DECR    R3                              ; 511C   0013
        BNEQ    L_511B                          ; 511D   022C 0003

        MVII    #$0045, R0                      ; 511F   02B8 0045
        MVO     R0,     G_0181                  ; 5121   0240 0181
        MVII    #$0002, R0                      ; 5123   02B8 0002
        MVO     R0,     G_0115                  ; 5125   0240 0115
        SDBD                                    ; 5127   0001
        MVII    #$5ADB, R1                      ; 5128   02B9 00DB 005A
        MVO     R5,     G_0316                  ; 512B   0245 0316
        MVII    #$031D, R2                      ; 512D   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 512F   0004 0114 02B4

        MVII    #$0001, R0                      ; 5132   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 5134   0004 0114 02CF

        SDBD                                    ; 5137   0001
        MVII    #$557A, R0                      ; 5138   02B8 007A 0055
        MVO     R0,     G_035D                  ; 513B   0240 035D
        MVII    #$00F0, R0                      ; 513D   02B8 00F0
        SDBD                                    ; 513F   0001
        MVII    #$0A0D, R1                      ; 5140   02B9 000D 000A
        MVII    #$0200, R4                      ; 5143   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5145   0004 0114 0341
        DECLE   $0002,  $0001                   ; 5148   0002 0001

        MVII    #$0004, R2                      ; 514A   02BA 0004
        ADCR    R2                              ; 514C   002A
        MVII    #$00FA, R3                      ; 514D   02BB 00FA
L_514F:
        MVII    #$0002, R0                      ; 514F   02B8 0002

        JSR     R5,     X_RAND1                 ; 5151   0004 0114 027D

        ADDI    #$0002, R0                      ; 5154   02F8 0002
        SLL     R0,     2                       ; 5156   004C
        SLL     R0,     1                       ; 5157   0048
        MOVR    R0,     R1                      ; 5158   0081
        XORR    R2,     R1                      ; 5159   01D1
        MVII    #$00F0, R0                      ; 515A   02B8 00F0

        JSR     R5,     X_RAND2                 ; 515C   0004 0114 029E

        ADDI    #$0200, R0                      ; 515F   02F8 0200
        MOVR    R0,     R4                      ; 5161   0084
        MVO@    R1,     R4                      ; 5162   0261
        DECR    R3                              ; 5163   0013
        BNEQ    L_514F                          ; 5164   022C 0016

        SDBD                                    ; 5166   0001
        MVII    #$1000, R0                      ; 5167   02B8 0000 0010
        SDBD                                    ; 516A   0001
        MVII    #$196E, R1                      ; 516B   02B9 006E 0019
        MVII    #$000C, R3                      ; 516E   02BB 000C
        MVII    #$0209, R4                      ; 5170   02BC 0209
L_5172:
        MVO@    R0,     R4                      ; 5172   0260
        MVO@    R1,     R4                      ; 5173   0261
        ADDI    #$0012, R4                      ; 5174   02FC 0012
        DECR    R3                              ; 5176   0013
        BNEQ    L_5172                          ; 5177   022C 0006

        MVII    #$0005, R0                      ; 5179   02B8 0005
        MVO     R0,     G_015D                  ; 517B   0240 015D
        MVII    #$0003, R0                      ; 517D   02B8 0003
        MVO     R0,     G_016F                  ; 517F   0240 016F
        MVII    #$003F, R0                      ; 5181   02B8 003F
        MVO     R0,     G_0185                  ; 5183   0240 0185
        CLRR    R0                              ; 5185   01C0
        MVO     R0,     G_0317                  ; 5186   0240 0317
        MVO     R0,     G_0318                  ; 5188   0240 0318
        MVII    #$001C, R0                      ; 518A   02B8 001C
        MVO     R0,     G_016C                  ; 518C   0240 016C
        MVII    #$0010, R0                      ; 518E   02B8 0010
        MVO     R0,     G_0182                  ; 5190   0240 0182
        CLRR    R2                              ; 5192   01D2
        MVII    #$0005, R0                      ; 5193   02B8 0005

        JSR     R5,     L_5306                  ; 5195   0004 0150 0306
        DECLE   $0004,  $0168,  $01C7           ; 5198   0004 0168 01C7

        J       L_5667                          ; 519B   0004 0354 0267

        PSHR    R5                              ; 519E   0275
        MVI     G_0173, R0                      ; 519F   0280 0173
        TSTR    R0                              ; 51A1   0080
        BEQ     L_51AC                          ; 51A2   0204 0008

        INCR    R0                              ; 51A4   0008
        CMPI    #$0002, R0                      ; 51A5   0378 0002
        BEQ     L_51AA                          ; 51A7   0204 0001

        CLRR    R0                              ; 51A9   01C0
L_51AA:
        MVO     R0,     G_0173                  ; 51AA   0240 0173
L_51AC:
        MVI     G_016F, R0                      ; 51AC   0280 016F
        CMPI    #$0014, R0                      ; 51AE   0378 0014
        BPL     L_51E7                          ; 51B0   0203 0035

        MVII    #$02AA, R4                      ; 51B2   02BC 02AA
        MVI@    R4,     R0                      ; 51B4   02A0
        ANDI    #$01F8, R0                      ; 51B5   03B8 01F8
        CMPI    #$0168, R0                      ; 51B7   0378 0168
        BNEQ    L_51E7                          ; 51B9   020C 002C

        MVI     G_0322, R0                      ; 51BB   0280 0322
        TSTR    R0                              ; 51BD   0080
        BNEQ    L_51E7                          ; 51BE   020C 0027

        MVI     G_031F, R0                      ; 51C0   0280 031F
        SWAP    R0,     1                       ; 51C2   0040
        ANDI    #$00FF, R0                      ; 51C3   03B8 00FF
        SUBI    #$004B, R0                      ; 51C5   0338 004B
        BMI     L_51E7                          ; 51C7   020B 001E

        CMPI    #$000C, R0                      ; 51C9   0378 000C
        BPL     L_51E7                          ; 51CB   0203 001A

        MVI     G_031E, R0                      ; 51CD   0280 031E
        TSTR    R0                              ; 51CF   0080
        BEQ     L_51E7                          ; 51D0   0204 0015

        SDBD                                    ; 51D2   0001
        MVII    #$6088, R4                      ; 51D3   02BC 0088 0060

        JSR     R5,     L_6011                  ; 51D6   0004 0160 0011
        DECLE   $0280,  $0178,  $0040,  $02C0   ; 51D9   0280 0178 0040 02C0
        DECLE   $0179,  $0010,  $0240,  $0179   ; 51DD   0179 0010 0240 0179
        DECLE   $0040,  $0240,  $0178,  $0004   ; 51E1   0040 0240 0178 0004
        DECLE   $0160,  $0298                   ; 51E5   0160 0298
L_51E7:
        MVI     G_016C, R0                      ; 51E7   0280 016C
        SWAP    R0,     2                       ; 51E9   0044
        BMI     L_51FC                          ; 51EA   020B 0010
        BNEQ    L_52AA                          ; 51EC   020C 00BC

        DECR    R0                              ; 51EE   0010
        MVO     R0,     G_016C                  ; 51EF   0240 016C
        SDBD                                    ; 51F1   0001
        MVII    #$5028, R1                      ; 51F2   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 51F5   0004 0118 0038

        MVII    #$0014, R0                      ; 51F8   02B8 0014
        MVO     R0,     G_016B                  ; 51FA   0240 016B
L_51FC:
        MVI     G_016B, R0                      ; 51FC   0280 016B
        DECR    R0                              ; 51FE   0010
        MVO     R0,     G_016B                  ; 51FF   0240 016B
        BPL     L_5274                          ; 5201   0203 0071

        MVI     G_016D, R0                      ; 5203   0280 016D
        SLL     R0,     1                       ; 5205   0048
        ADD     G_016D, R0                      ; 5206   02C0 016D
        SUBI    #$0009, R0                      ; 5208   0338 0009
        BPL     L_520D                          ; 520A   0203 0001

        CLRR    R0                              ; 520C   01C0
L_520D:
        ADDI    #$0010, R0                      ; 520D   02F8 0010
        CMPI    #$003F, R0                      ; 520F   0378 003F
        BLE     L_5215                          ; 5211   0206 0002

        MVII    #$003F, R0                      ; 5213   02B8 003F
L_5215:
        MVO     R0,     G_0182                  ; 5215   0240 0182
        MVI     G_016D, R0                      ; 5217   0280 016D
        INCR    R0                              ; 5219   0008
        MVO     R0,     G_016D                  ; 521A   0240 016D
        MOVR    R0,     R1                      ; 521C   0081
        ADD     G_0316, R1                      ; 521D   02C1 0316
        MVO     R1,     G_0316                  ; 521F   0241 0316
        SLL     R0,     1                       ; 5221   0048
        ADD     G_016D, R0                      ; 5222   02C0 016D
        SDBD                                    ; 5224   0001
        MVII    #$66D3, R4                      ; 5225   02BC 00D3 0066
        ADDR    R0,     R4                      ; 5228   00C4
        SDBD                                    ; 5229   0001
        MVI@    R4,     R0                      ; 522A   02A0
        MVO     R0,     G_0317                  ; 522B   0240 0317
        MVI@    R4,     R0                      ; 522D   02A0
        TSTR    R0                              ; 522E   0080
        BNEQ    L_5234                          ; 522F   020C 0003

        CLRR    R0                              ; 5231   01C0
        MVO     R0,     G_016D                  ; 5232   0240 016D
L_5234:
        MVO     R0,     G_016C                  ; 5234   0240 016C
        SDBD                                    ; 5236   0001
        MVII    #$5028, R1                      ; 5237   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 523A   0004 0118 0044

        MVII    #$0006, R1                      ; 523D   02B9 0006
        MVO     R1,     G_0183                  ; 523F   0241 0183

        JSR     R5,     L_54D2                  ; 5241   0004 0154 00D2

        MVI     G_015D, R0                      ; 5244   0280 015D
        MVI     G_0317, R2                      ; 5246   0282 0317

        JSR     R5,     L_5306                  ; 5248   0004 0150 0306

        MVI     G_016E, R0                      ; 524B   0280 016E
        TSTR    R0                              ; 524D   0080
        BEQ     L_525E                          ; 524E   0204 000E

        CLRR    R0                              ; 5250   01C0
        MVO     R0,     G_016E                  ; 5251   0240 016E
        SDBD                                    ; 5253   0001
        MVII    #$561B, R0                      ; 5254   02B8 001B 0056
        MVO     R0,     .ISRVEC.0               ; 5257   0240 0100
        SWAP    R0,     1                       ; 5259   0040
        MVO     R0,     .ISRVEC.1               ; 525A   0240 0101
        B       L_52AA                          ; 525C   0200 004C

L_525E:
        MVI     G_016D, R0                      ; 525E   0280 016D
        ADDI    #$0002, R0                      ; 5260   02F8 0002
        ANDI    #$0003, R0                      ; 5262   03B8 0003
        BNEQ    L_52AA                          ; 5264   020C 0044

        INCR    R0                              ; 5266   0008
        MVO     R0,     G_016E                  ; 5267   0240 016E
        SDBD                                    ; 5269   0001
        MVII    #$561B, R0                      ; 526A   02B8 001B 0056
        MVO     R0,     .ISRVEC.0               ; 526D   0240 0100
        SWAP    R0,     1                       ; 526F   0040
        MVO     R0,     .ISRVEC.1               ; 5270   0240 0101
        B       L_52AA                          ; 5272   0200 0036

L_5274:
        MVII    #$0014, R0                      ; 5274   02B8 0014
        DECLE   $0001,  $02B9,  $0065,  $000B   ; 5276   0001 02B9 0065 000B
        DECLE   $02BC,  $0200,  $0261,  $0010   ; 527A   02BC 0200 0261 0010
        DECLE   $022C,  $0003,  $02BB,  $000F   ; 527E   022C 0003 02BB 000F
        DECLE   $0001                           ; 5282   0001

        MVII    #$0004, R2                      ; 5283   02BA 0004
        ADCR    R2                              ; 5285   002A
L_5286:
        MVII    #$0002, R0                      ; 5286   02B8 0002

        JSR     R5,     X_RAND1                 ; 5288   0004 0114 027D

        ADDI    #$0002, R0                      ; 528B   02F8 0002
        SLL     R0,     2                       ; 528D   004C
        SLL     R0,     1                       ; 528E   0048
        MOVR    R0,     R1                      ; 528F   0081
        XORR    R2,     R1                      ; 5290   01D1
        MVII    #$0014, R0                      ; 5291   02B8 0014

        JSR     R5,     X_RAND2                 ; 5293   0004 0114 029E

        ADDI    #$0200, R0                      ; 5296   02F8 0200
        MOVR    R0,     R4                      ; 5298   0084
        MVO@    R1,     R4                      ; 5299   0261
        DECR    R3                              ; 529A   0013
        BNEQ    L_5286                          ; 529B   022C 0016

        SDBD                                    ; 529D   0001
        MVII    #$1000, R0                      ; 529E   02B8 0000 0010
        MVII    #$0209, R4                      ; 52A1   02BC 0209
        MVO@    R0,     R4                      ; 52A3   0260
        SDBD                                    ; 52A4   0001
        MVII    #$196E, R0                      ; 52A5   02B8 006E 0019
        MVO@    R0,     R4                      ; 52A8   0260
        PULR    R7                              ; 52A9   02B7

L_52AA:
        MVII    #$0004, R2                      ; 52AA   02BA 0004
        MVII    #$0200, R4                      ; 52AC   02BC 0200
        MVI     G_016E, R0                      ; 52AE   0280 016E
        SDBD                                    ; 52B0   0001
        MVII    #$0A05, R1                      ; 52B1   02B9 0005 000A
        TSTR    R0                              ; 52B4   0080
        BEQ     L_52BB                          ; 52B5   0204 0004

        SDBD                                    ; 52B7   0001
        MVII    #$0804, R1                      ; 52B8   02B9 0004 0008

L_52BB:
        JSR     R5,     L_53AF                  ; 52BB   0004 0150 03AF

        MVI     G_015D, R0                      ; 52BE   0280 015D
        SARC    R0,     1                       ; 52C0   0078
        BNC     L_52CD                          ; 52C1   0209 000A

        MVI@    R3,     R0                      ; 52C3   0298
        INCR    R3                              ; 52C4   000B
        ANDI    #$001F, R0                      ; 52C5   03B8 001F
        SLL     R0,     2                       ; 52C7   004C
        SLL     R0,     1                       ; 52C8   0048

        JSR     R5,     L_55DF                  ; 52C9   0004 0154 01DF

        MVO@    R0,     R4                      ; 52CC   0260

L_52CD:
        JSR     R5,     L_53DF                  ; 52CD   0004 0150 03DF
        JSR     R5,     L_53DF                  ; 52D0   0004 0150 03DF

        MVI     G_015D, R0                      ; 52D3   0280 015D
        SARC    R0,     1                       ; 52D5   0078
        BC      L_52E0                          ; 52D6   0201 0008

        MVI@    R3,     R0                      ; 52D8   0298
        ANDI    #$03E0, R0                      ; 52D9   03B8 03E0
        SLR     R0,     2                       ; 52DB   0064

        JSR     R5,     L_55DF                  ; 52DC   0004 0154 01DF

        MVO@    R0,     R4                      ; 52DF   0260
L_52E0:
        DECR    R2                              ; 52E0   0012
        BNEQ    L_52BB                          ; 52E1   022C 0027

        JSR     R5,     L_5344                  ; 52E3   0004 0150 0344
        JSR     R5,     L_53F3                  ; 52E6   0004 0150 03F3

        PULR    R5                              ; 52E9   02B5
        MVI     G_0318, R3                      ; 52EA   0283 0318
        SUBI    #$0004, R3                      ; 52EC   033B 0004
        MVI     G_015D, R0                      ; 52EE   0280 015D
        SLR     R0,     1                       ; 52F0   0060
        BNEQ    L_5332                          ; 52F1   020C 003F

        ADDI    #$0004, R3                      ; 52F3   02FB 0004
        MVII    #$0005, R0                      ; 52F5   02B8 0005
        MOVR    R3,     R2                      ; 52F7   009A
        ANDI    #$000F, R2                      ; 52F8   03BA 000F
        BNEQ    L_5332                          ; 52FA   020C 0036

        MVI     G_016C, R1                      ; 52FC   0281 016C
        DECR    R1                              ; 52FE   0011
        MVO     R1,     G_016C                  ; 52FF   0241 016C
        MVI     G_0317, R2                      ; 5301   0282 0317
        INCR    R2                              ; 5303   000A
        MVO     R2,     G_0317                  ; 5304   0242 0317
L_5306:
        SDBD                                    ; 5306   0001
        MVII    #$65D3, R1                      ; 5307   02B9 00D3 0065
        SARC    R2,     1                       ; 530A   007A
        BC      L_5314                          ; 530B   0201 0007

        ADDR    R2,     R1                      ; 530D   00D1
        MVI@    R1,     R2                      ; 530E   028A
        ANDI    #$03E0, R2                      ; 530F   03BA 03E0
        SLR     R2,     1                       ; 5311   0062
        B       L_531A                          ; 5312   0200 0006

L_5314:
        ADDR    R2,     R1                      ; 5314   00D1
        MVI@    R1,     R2                      ; 5315   028A
        ANDI    #$001F, R2                      ; 5316   03BA 001F
        SLL     R2,     2                       ; 5318   004E
        SLL     R2,     2                       ; 5319   004E
L_531A:
        MOVR    R2,     R3                      ; 531A   0093
        SDBD                                    ; 531B   0001
        MVII    #$5337, R2                      ; 531C   02BA 0037 0053
        MVO     R2,     .ISRVEC.0               ; 531F   0242 0100
        SWAP    R2,     1                       ; 5321   0042
        MVO     R2,     .ISRVEC.1               ; 5322   0242 0101
        MOVR    R3,     R2                      ; 5324   009A
        SLR     R2,     2                       ; 5325   0066
        SLR     R2,     2                       ; 5326   0066
        DECR    R2                              ; 5327   0012
        BGT     L_532E                          ; 5328   020E 0004

        MVII    #$00FF, R2                      ; 532A   02BA 00FF
        B       L_5330                          ; 532C   0200 0002

L_532E:
        MVII    #$0080, R2                      ; 532E   02BA 0080
L_5330:
        MVO     R2,     G_016A                  ; 5330   0242 016A
L_5332:
        MVO     R0,     G_015D                  ; 5332   0240 015D
        MVO     R3,     G_0318                  ; 5334   0243 0318
        MOVR    R5,     R7                      ; 5336   00AF

        PSHR    R5                              ; 5337   0275

        JSR     R5,     L_565C                  ; 5338   0004 0154 025C
        JSR     R5,     L_5651                  ; 533B   0004 0154 0251

        MVI     G_0318, R2                      ; 533E   0282 0318

        JSR     R5,     L_545D                  ; 5340   0004 0154 005D

        PULR    R7                              ; 5343   02B7

L_5344:
        PSHR    R5                              ; 5344   0275
        MVII    #$0008, R0                      ; 5345   02B8 0008

        JSR     R5,     X_RAND1                 ; 5347   0004 0114 027D

        CMP     G_016A, R0                      ; 534A   0340 016A
        BPL     L_53AE                          ; 534C   0203 0060

L_534E:
        MVII    #$0013, R0                      ; 534E   02B8 0013

        JSR     R5,     X_RAND2                 ; 5350   0004 0114 029E

        ADDI    #$0201, R0                      ; 5353   02F8 0201
        MOVR    R0,     R3                      ; 5355   0083
        MVI@    R3,     R0                      ; 5356   0298
        SLR     R0,     2                       ; 5357   0064
        SLR     R0,     1                       ; 5358   0060
        ANDI    #$003F, R0                      ; 5359   03B8 003F
        DECR    R0                              ; 535B   0010
        BMI     L_53A6                          ; 535C   020B 0048

        SUBI    #$0005, R0                      ; 535E   0338 0005
        BPL     L_53A6                          ; 5360   0203 0044

        MVII    #$0002, R0                      ; 5362   02B8 0002

        JSR     R5,     X_RAND1                 ; 5364   0004 0114 027D

        TSTR    R0                              ; 5367   0080
        BEQ     L_537B                          ; 5368   0204 0011

        MVI     G_016E, R0                      ; 536A   0280 016E
        TSTR    R0                              ; 536C   0080
        BNEQ    L_5375                          ; 536D   020C 0006

        SDBD                                    ; 536F   0001
        MVII    #$2F05, R0                      ; 5370   02B8 0005 002F
        B       L_53A3                          ; 5373   0200 002E

L_5375:
        SDBD                                    ; 5375   0001
        MVII    #$1900, R0                      ; 5376   02B8 0000 0019
        B       L_53A3                          ; 5379   0200 0028

L_537B:
        MVII    #$0002, R0                      ; 537B   02B8 0002

        JSR     R5,     X_RAND1                 ; 537D   0004 0114 027D

        TSTR    R0                              ; 5380   0080
        BNEQ    L_5394                          ; 5381   020C 0011

        MVI     G_016E, R0                      ; 5383   0280 016E
        TSTR    R0                              ; 5385   0080
        BNEQ    L_538E                          ; 5386   020C 0006

        SDBD                                    ; 5388   0001
        MVII    #$0F5C, R0                      ; 5389   02B8 005C 000F
        B       L_53A3                          ; 538C   0200 0015

L_538E:
        SDBD                                    ; 538E   0001
        MVII    #$0F58, R0                      ; 538F   02B8 0058 000F
        B       L_53A3                          ; 5392   0200 000F

L_5394:
        MVI     G_016E, R0                      ; 5394   0280 016E
        TSTR    R0                              ; 5396   0080
        BNEQ    L_539F                          ; 5397   020C 0006

        SDBD                                    ; 5399   0001
        MVII    #$090E, R0                      ; 539A   02B8 000E 0009
        B       L_53A3                          ; 539D   0200 0004

L_539F:
        SDBD                                    ; 539F   0001
        MVII    #$090B, R0                      ; 53A0   02B8 000B 0009
L_53A3:
        MVO@    R0,     R3                      ; 53A3   0258
        B       L_53AE                          ; 53A4   0200 0008

L_53A6:
        MVII    #$0002, R0                      ; 53A6   02B8 0002

        JSR     R5,     X_RAND1                 ; 53A8   0004 0114 027D

        TSTR    R0                              ; 53AB   0080
        BNEQ    L_534E                          ; 53AC   022C 005F
L_53AE:
        PULR    R7                              ; 53AE   02B7

L_53AF:
        SDBD                                    ; 53AF   0001
        MVII    #$64D3, R3                      ; 53B0   02BB 00D3 0064
        MVI     G_0318, R0                      ; 53B3   0280 0318
        SARC    R0,     1                       ; 53B5   0078
        BC      L_53C0                          ; 53B6   0201 0008

        ADDR    R0,     R3                      ; 53B8   00C3
        MVI@    R3,     R0                      ; 53B9   0298
        ANDI    #$001F, R0                      ; 53BA   03B8 001F
        SLL     R0,     2                       ; 53BC   004C
        SLL     R0,     1                       ; 53BD   0048
        B       L_53C5                          ; 53BE   0200 0005

L_53C0:
        ADDR    R0,     R3                      ; 53C0   00C3
        MVI@    R3,     R0                      ; 53C1   0298
        ANDI    #$03E0, R0                      ; 53C2   03B8 03E0
        SLR     R0,     2                       ; 53C4   0064
L_53C5:
        MVI     G_015D, R3                      ; 53C5   0283 015D
        SLR     R3,     1                       ; 53C7   0063
        INCR    R3                              ; 53C8   000B
        INCR    R3                              ; 53C9   000B
        ADDR    R7,     R3                      ; 53CA   00FB
        ADD@    R3,     R7                      ; 53CB   02DF

        DECLE   $0008,  $0004                   ; 53CC   0008 0004

        CLRC                                    ; 53CE   0006
        INCR    R0                              ; 53CF   0008
        ADDI    #$0002, R0                      ; 53D0   02F8 0002
        ADDI    #$0003, R0                      ; 53D2   02F8 0003
        SDBD                                    ; 53D4   0001
        MVII    #$63D3, R3                      ; 53D5   02BB 00D3 0063
        ADDR    R0,     R3                      ; 53D8   00C3
        MVI     G_0318, R0                      ; 53D9   0280 0318
        INCR    R0                              ; 53DB   0008
        MVO     R0,     G_0318                  ; 53DC   0240 0318
        MOVR    R5,     R7                      ; 53DE   00AF

L_53DF:
        PSHR    R5                              ; 53DF   0275
        MVI@    R3,     R0                      ; 53E0   0298
        ANDI    #$03E0, R0                      ; 53E1   03B8 03E0
        SLR     R0,     2                       ; 53E3   0064

        JSR     R5,     L_55DF                  ; 53E4   0004 0154 01DF

        MVO@    R0,     R4                      ; 53E7   0260
        MVI@    R3,     R0                      ; 53E8   0298
        ANDI    #$001F, R0                      ; 53E9   03B8 001F
        SLL     R0,     2                       ; 53EB   004C
        SLL     R0,     1                       ; 53EC   0048

        JSR     R5,     L_55DF                  ; 53ED   0004 0154 01DF

        MVO@    R0,     R4                      ; 53F0   0260
        INCR    R3                              ; 53F1   000B
        PULR    R7                              ; 53F2   02B7

L_53F3:
        PSHR    R5                              ; 53F3   0275
        MVII    #$015E, R4                      ; 53F4   02BC 015E
L_53F6:
        CMPI    #$016A, R4                      ; 53F6   037C 016A
        BEQ     L_545C                          ; 53F8   0204 0062

        MVI@    R4,     R1                      ; 53FA   02A1
        MVI@    R4,     R2                      ; 53FB   02A2
        TSTR    R2                              ; 53FC   0092
        BEQ     L_53F6                          ; 53FD   0224 0008

        SUBI    #$0002, R4                      ; 53FF   033C 0002
        DECR    R1                              ; 5401   0011
        MVO@    R1,     R4                      ; 5402   0261
        INCR    R4                              ; 5403   000C
        SWAP    R1,     1                       ; 5404   0041
        TSTR    R1                              ; 5405   0089
        BGT     L_53F6                          ; 5406   022E 0011

        SAR     R1,     2                       ; 5408   006D
        SAR     R1,     2                       ; 5409   006D
        NOP                                     ; 540A   0034
        SAR     R1,     2                       ; 540B   006D
        SAR     R1,     2                       ; 540C   006D
        MOVR    R2,     R3                      ; 540D   0093
        ANDI    #$0003, R3                      ; 540E   03BB 0003
        SLR     R2,     2                       ; 5410   0066
        ADDI    #$0200, R2                      ; 5411   02FA 0200
        MVI     G_016E, R0                      ; 5413   0280 016E
        TSTR    R0                              ; 5415   0080
        BNEQ    L_541E                          ; 5416   020C 0006

        SDBD                                    ; 5418   0001
        MVII    #$1E01, R0                      ; 5419   02B8 0001 001E
        B       L_5422                          ; 541C   0200 0004

L_541E:
        SDBD                                    ; 541E   0001
        MVII    #$1E00, R0                      ; 541F   02B8 0000 001E
L_5422:
        INCR    R3                              ; 5422   000B
        ADDR    R7,     R3                      ; 5423   00FB
        ADD@    R3,     R7                      ; 5424   02DF

        DECLE   $001A,  $0004                   ; 5425   001A 0004

        INCR    R5                              ; 5427   000D
        INCR    R5                              ; 5428   000D
        NEGR    R1                              ; 5429   0021
        ADDI    #$0025, R1                      ; 542A   02F9 0025
        CMPI    #$0026, R1                      ; 542C   0379 0026
        BGT     L_5457                          ; 542E   020E 0027
        B       L_5439                          ; 5430   0200 0007

        NEGR    R1                              ; 5432   0021
        ADDI    #$0022, R1                      ; 5433   02F9 0022
        CMPI    #$0025, R1                      ; 5435   0379 0025
        BEQ     L_5457                          ; 5437   0204 001E

L_5439:
        SLL     R1,     2                       ; 5439   004D
        SLL     R1,     1                       ; 543A   0049
        XORR    R1,     R0                      ; 543B   01C8
        MVO@    R0,     R2                      ; 543C   0250
        B       L_53F6                          ; 543D   0220 0048

        NEGR    R1                              ; 543F   0021
        CMPI    #$0001, R1                      ; 5440   0379 0001
        BEQ     L_544B                          ; 5442   0204 0007
        BPL     L_5454                          ; 5444   0203 000E

        XORI    #$0138, R0                      ; 5446   03F8 0138
        MVO@    R0,     R2                      ; 5448   0250
        B       L_53F6                          ; 5449   0220 0054

L_544B:
        XORI    #$0148, R0                      ; 544B   03F8 0148
        MVO@    R0,     R2                      ; 544D   0250
        DECR    R2                              ; 544E   0012
        SUBI    #$0008, R0                      ; 544F   0338 0008
        MVO@    R0,     R2                      ; 5451   0250
        B       L_53F6                          ; 5452   0220 005D

L_5454:
        XORI    #$0150, R0                      ; 5454   03F8 0150
        MVO@    R0,     R2                      ; 5456   0250
L_5457:
        CLRR    R1                              ; 5457   01C9
        DECR    R4                              ; 5458   0014
        MVO@    R1,     R4                      ; 5459   0261
        B       L_53F6                          ; 545A   0220 0065
L_545C:
        PULR    R7                              ; 545C   02B7

L_545D:
        PSHR    R5                              ; 545D   0275
        MVI     G_0318, R2                      ; 545E   0282 0318
        TSTR    R2                              ; 5460   0092
        BNEQ    L_54C6                          ; 5461   020C 0063

        MVII    #$015E, R4                      ; 5463   02BC 015E
        MVII    #$0009, R1                      ; 5465   02B9 0009
        MVI     G_0316, R2                      ; 5467   0282 0316
        SLL     R2,     2                       ; 5469   004E
        SLLC    R2,     2                       ; 546A   005E
        XOR     G_0316, R2                      ; 546B   03C2 0316
        RLC     R2,     1                       ; 546D   0052
        MVO     R2,     G_0316                  ; 546E   0242 0316
        ANDI    #$0003, R2                      ; 5470   03BA 0003
        INCR    R2                              ; 5472   000A
L_5473:
        DECR    R1                              ; 5473   0011
        BEQ     L_54CF                          ; 5474   0204 0059

        MVI     G_0316, R0                      ; 5476   0280 0316
        SLL     R0,     2                       ; 5478   004C
        SLLC    R0,     2                       ; 5479   005C
        XOR     G_0316, R0                      ; 547A   03C0 0316
        RLC     R0,     1                       ; 547C   0050
        MVO     R0,     G_0316                  ; 547D   0240 0316
        ANDI    #$000F, R0                      ; 547F   03B8 000F
L_5481:
        SLR     R0,     1                       ; 5481   0060
        CMPR    R0,     R1                      ; 5482   0141
        BMI     L_5481                          ; 5483   022B 0003

        CMPR    R0,     R2                      ; 5485   0142
        BPL     L_5473                          ; 5486   0223 0014

        MVII    #$0009, R5                      ; 5488   02BD 0009
        MVI     G_0316, R0                      ; 548A   0280 0316
        SLL     R0,     2                       ; 548C   004C
        SLLC    R0,     2                       ; 548D   005C
        XOR     G_0316, R0                      ; 548E   03C0 0316
        RLC     R0,     1                       ; 5490   0050
        MVO     R0,     G_0316                  ; 5491   0240 0316
        ANDI    #$001F, R0                      ; 5493   03B8 001F
L_5495:
        SLR     R0,     1                       ; 5495   0060
        CMPR    R0,     R5                      ; 5496   0145
        BMI     L_5495                          ; 5497   022B 0003

        INCR    R0                              ; 5499   0008
        PSHR    R1                              ; 549A   0271
        NEGR    R1                              ; 549B   0021
        ADDI    #$0009, R1                      ; 549C   02F9 0009
        SLL     R1,     1                       ; 549E   0049
        MVO@    R0,     R4                      ; 549F   0260
L_54A0:
        MVI     G_0316, R0                      ; 54A0   0280 0316
        SLL     R0,     2                       ; 54A2   004C
        SLLC    R0,     2                       ; 54A3   005C
        XOR     G_0316, R0                      ; 54A4   03C0 0316
        RLC     R0,     1                       ; 54A6   0050
        MVO     R0,     G_0316                  ; 54A7   0240 0316
        ANDI    #$0003, R0                      ; 54A9   03B8 0003
        BNEQ    L_54BD                          ; 54AB   020C 0010

        MVI     G_016D, R0                      ; 54AD   0280 016D
        TSTR    R0                              ; 54AF   0080
        BEQ     L_54A0                          ; 54B0   0224 0011

        MVI     G_0316, R0                      ; 54B2   0280 0316
        SLL     R0,     2                       ; 54B4   004C
        SLLC    R0,     2                       ; 54B5   005C
        XOR     G_0316, R0                      ; 54B6   03C0 0316
        RLC     R0,     1                       ; 54B8   0050
        MVO     R0,     G_0316                  ; 54B9   0240 0316
        ANDI    #$0003, R0                      ; 54BB   03B8 0003
L_54BD:
        SLL     R1,     2                       ; 54BD   004D
        XORR    R1,     R0                      ; 54BE   01C8
        MVO@    R0,     R4                      ; 54BF   0260
        PULR    R1                              ; 54C0   02B1
        DECR    R2                              ; 54C1   0012
        BMI     L_54CF                          ; 54C2   020B 000B
        B       L_5473                          ; 54C4   0220 0052

L_54C6:
        MVII    #$015E, R4                      ; 54C6   02BC 015E
        MVII    #$000C, R2                      ; 54C8   02BA 000C
        CLRR    R0                              ; 54CA   01C0
L_54CB:
        MVO@    R0,     R4                      ; 54CB   0260
        DECR    R2                              ; 54CC   0012
        BNEQ    L_54CB                          ; 54CD   022C 0003

L_54CF:
        MVII    #$0005, R0                      ; 54CF   02B8 0005
        PULR    R7                              ; 54D1   02B7

L_54D2:
        PSHR    R5                              ; 54D2   0275
        SDBD                                    ; 54D3   0001
        MVII    #$09F8, R2                      ; 54D4   02BA 00F8 0009
        MVII    #$0200, R4                      ; 54D7   02BC 0200
        MVII    #$00B4, R3                      ; 54D9   02BB 00B4
        MVII    #$0198, R1                      ; 54DB   02B9 0198
L_54DD:
        MVI@    R4,     R0                      ; 54DD   02A0
        ANDR    R2,     R0                      ; 54DE   0190
        CMPR    R1,     R0                      ; 54DF   0148
        BEQ     L_5579                          ; 54E0   0204 0097

        DECR    R3                              ; 54E2   0013
        BNEQ    L_54DD                          ; 54E3   022C 0007

        MVII    #$0006, R3                      ; 54E5   02BB 0006
        MVI     G_016E, R0                      ; 54E7   0280 016E
        TSTR    R0                              ; 54E9   0080
        BNEQ    L_54FA                          ; 54EA   020C 000E

        MVI     .BTAB.28,R0                     ; 54EC   0280 0228
        ANDI    #$01F8, R0                      ; 54EE   03B8 01F8
        BNEQ    L_54F6                          ; 54F0   020C 0004

        MVII    #$0206, R3                      ; 54F2   02BB 0206
        B       L_54FA                          ; 54F4   0200 0004

L_54F6:
        SDBD                                    ; 54F6   0001
        MVII    #$2206, R3                      ; 54F7   02BB 0006 0022
L_54FA:
        MVII    #$022A, R4                      ; 54FA   02BC 022A

        JSR     R5,     X_PRINT_R5              ; 54FC   0004 0118 007B
        STRING  "SCORE: "                       ; 54FF  
        DECLE   $0000                           ; 5506   0000

        MVII    #$0004, R1                      ; 5507   02B9 0004
        MVI     G_0176, R0                      ; 5509   0280 0176
        SWAP    R0,     1                       ; 550B   0040
        ADD     G_0177, R0                      ; 550C   02C0 0177
        ADDI    #$0002, R4                      ; 550E   02FC 0002

        JSR     R5,     X_PRNUM_RGT             ; 5510   0004 0118 00C5

        ADDI    #$0004, R4                      ; 5513   02FC 0004
        MVI     G_0174, R0                      ; 5515   0280 0174
        SWAP    R0,     1                       ; 5517   0040
        ADD     G_0175, R0                      ; 5518   02C0 0175
        MVII    #$0004, R1                      ; 551A   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 551C   0004 0118 00AD

        SDBD                                    ; 551F   0001
        MVII    #$0973, R0                      ; 5520   02B8 0073 0009
        MVI     G_016E, R1                      ; 5523   0281 016E
        TSTR    R1                              ; 5525   0089
        BNEQ    L_5536                          ; 5526   020C 000E

        SDBD                                    ; 5528   0001
        MVII    #$2B70, R0                      ; 5529   02B8 0070 002B
        MVI     .BTAB.3C,R1                     ; 552C   0281 023C
        ANDI    #$01F8, R1                      ; 552E   03B9 01F8
        BNEQ    L_5536                          ; 5530   020C 0004

        SDBD                                    ; 5532   0001
        MVII    #$0B70, R0                      ; 5533   02B8 0070 000B
L_5536:
        MVI     G_016F, R1                      ; 5536   0281 016F
        TSTR    R1                              ; 5538   0089
        BEQ     L_5557                          ; 5539   0204 001C

        CMPI    #$0014, R1                      ; 553B   0379 0014
        BPL     L_5557                          ; 553D   0203 0018

        CLRR    R1                              ; 553F   01C9
        MVII    #$023F, R4                      ; 5540   02BC 023F
L_5542:
        MVO@    R0,     R4                      ; 5542   0260
        ADDI    #$0008, R0                      ; 5543   02F8 0008
        MVO@    R0,     R4                      ; 5545   0260
        SUBI    #$0008, R0                      ; 5546   0338 0008
        INCR    R1                              ; 5548   0009
        CMPI    #$0003, R1                      ; 5549   0379 0003
        BNEQ    L_554F                          ; 554B   020C 0002

        ADDI    #$0002, R4                      ; 554D   02FC 0002
L_554F:
        CMPI    #$0007, R1                      ; 554F   0379 0007
        BEQ     L_5557                          ; 5551   0204 0004

        CMP     G_016F, R1                      ; 5553   0341 016F
        BNEQ    L_5542                          ; 5555   022C 0014

L_5557:
        MVII    #$0252, R4                      ; 5557   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 5559   0004 0118 007B
        STRING  "HITS : "                       ; 555C  
        DECLE   $0000                           ; 5563   0000

        MVII    #$0003, R1                      ; 5564   02B9 0003
        MVI     G_017A, R0                      ; 5566   0280 017A
        ADDI    #$0002, R4                      ; 5568   02FC 0002

        JSR     R5,     X_PRNUM_RGT             ; 556A   0004 0118 00C5

        MVII    #$0004, R1                      ; 556D   02B9 0004
        MVI     G_0178, R0                      ; 556F   0280 0178
        SWAP    R0,     1                       ; 5571   0040
        ADD     G_0179, R0                      ; 5572   02C0 0179
        ADDI    #$0003, R4                      ; 5574   02FC 0003

        JSR     R5,     X_PRNUM_ZRO             ; 5576   0004 0118 00AD

L_5579:
        PULR    R7                              ; 5579   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 557A   0000 0000 0000 0000
        DECLE   $001C,  $005E,  $00F4,  $005E   ; 557E   001C 005E 00F4 005E
        DECLE   $00F4,  $005E,  $0005,  $0008   ; 5582   00F4 005E 0005 0008
        DECLE   $0003,  $001E,  $0003,  $001E   ; 5586   0003 001E 0003 001E
        DECLE   $0007,  $0018,  $0006,  $001C   ; 558A   0007 0018 0006 001C
        DECLE   $0002,  $000A,  $0000,  $001E   ; 558E   0002 000A 0000 001E
        DECLE   $0003,  $0008,  $0003,  $0008   ; 5592   0003 0008 0003 0008
        DECLE   $0003,  $0008,  $0006,  $0008   ; 5596   0003 0008 0006 0008
        DECLE   $0002,  $0008,  $0043,  $004F   ; 559A   0002 0008 0043 004F
        DECLE   $0050,  $0059,  $0052,  $0049   ; 559E   0050 0059 0052 0049
        DECLE   $0047,  $0048,  $0054,  $0020   ; 55A2   0047 0048 0054 0020
        DECLE   $0031,  $0039,  $0038,  $0032   ; 55A6   0031 0039 0038 0032
        DECLE   $0020,  $0042,  $0059,  $0020   ; 55AA   0020 0042 0059 0020
        DECLE   $004D,  $0041,  $0054,  $0054   ; 55AE   004D 0041 0054 0054
        DECLE   $0045,  $004C,  $002C,  $0020   ; 55B2   0045 004C 002C 0020
        DECLE   $0043,  $004F,  $0050,  $0059   ; 55B6   0043 004F 0050 0059
        DECLE   $0052,  $0049,  $0047,  $0048   ; 55BA   0052 0049 0047 0048
        DECLE   $0054,  $0020,  $0031,  $0039   ; 55BE   0054 0020 0031 0039
        DECLE   $0038,  $0032,  $0020,  $0042   ; 55C2   0038 0032 0020 0042
        DECLE   $0059,  $0020,  $0044,  $0041   ; 55C6   0059 0020 0044 0041
        DECLE   $0054,  $0041,  $0020,  $0045   ; 55CA   0054 0041 0020 0045
        DECLE   $0041,  $0053,  $0054,  $0020   ; 55CE   0041 0053 0054 0020
        DECLE   $0043,  $004F,  $0052,  $0050   ; 55D2   0043 004F 0052 0050
        DECLE   $002E,  $0020,  $0028,  $0044   ; 55D6   002E 0020 0028 0044
        DECLE   $0045,  $0043,  $004F,  $0029   ; 55DA   0045 0043 004F 0029
        DECLE   $0000                           ; 55DE   0000
L_55DF:
        PSHR    R5                              ; 55DF   0275
        PSHR    R0                              ; 55E0   0270
        SLR     R0,     2                       ; 55E1   0064
        SLR     R0,     1                       ; 55E2   0060
        DECR    R0                              ; 55E3   0010
        BLE     L_5618                          ; 55E4   0206 0032

        SUBI    #$0004, R0                      ; 55E6   0338 0004
        BGT     L_55FD                          ; 55E8   020E 0013

        MVI     G_016E, R5                      ; 55EA   0285 016E
        TSTR    R5                              ; 55EC   00AD
        BNEQ    L_55F5                          ; 55ED   020C 0006

        SDBD                                    ; 55EF   0001
        MVII    #$2A04, R5                      ; 55F0   02BD 0004 002A
        B       L_55F9                          ; 55F3   0200 0004

L_55F5:
        SDBD                                    ; 55F5   0001
        MVII    #$0804, R5                      ; 55F6   02BD 0004 0008
L_55F9:
        PULR    R0                              ; 55F9   02B0
        XORR    R5,     R0                      ; 55FA   01E8
        B       L_561A                          ; 55FB   0200 001D

L_55FD:
        SUBI    #$0015, R0                      ; 55FD   0338 0015
        BMI     L_5618                          ; 55FF   020B 0017

        SLL     R0,     1                       ; 5601   0048
        MVI     G_016E, R5                      ; 5602   0285 016E
        TSTR    R5                              ; 5604   00AD
        BNEQ    L_560D                          ; 5605   020C 0006

        SDBD                                    ; 5607   0001
        MVII    #$5584, R5                      ; 5608   02BD 0084 0055
        B       L_5611                          ; 560B   0200 0004

L_560D:
        SDBD                                    ; 560D   0001
        MVII    #$5590, R5                      ; 560E   02BD 0090 0055
L_5611:
        ADDR    R0,     R5                      ; 5611   00C5
        SDBD                                    ; 5612   0001
        MVI@    R5,     R0                      ; 5613   02A8
        PULR    R5                              ; 5614   02B5
        XORR    R5,     R0                      ; 5615   01E8
        B       L_561A                          ; 5616   0200 0002

L_5618:
        PULR    R0                              ; 5618   02B0
        XORR    R1,     R0                      ; 5619   01C8
L_561A:
        PULR    R7                              ; 561A   02B7

        PSHR    R5                              ; 561B   0275
        SDBD                                    ; 561C   0001
        MVII    #$3808, R4                      ; 561D   02BC 0008 0038
        MVII    #$0008, R3                      ; 5620   02BB 0008
        MVI     G_016E, R0                      ; 5622   0280 016E
        TSTR    R0                              ; 5624   0080
        BEQ     L_5632                          ; 5625   0204 000B

        CLRR    R0                              ; 5627   01C0
L_5628:
        MVO@    R0,     R4                      ; 5628   0260
        DECR    R3                              ; 5629   0013
        BNEQ    L_5628                          ; 562A   022C 0003

        SDBD                                    ; 562C   0001
        MVII    #$581C, R5                      ; 562D   02BD 001C 0058
        B       L_563F                          ; 5630   0200 000D

L_5632:
        SDBD                                    ; 5632   0001
        MVII    #$569C, R5                      ; 5633   02BD 009C 0056
L_5636:
        MVI@    R5,     R0                      ; 5636   02A8
        MVO@    R0,     R4                      ; 5637   0260
        DECR    R3                              ; 5638   0013
        BNEQ    L_5636                          ; 5639   022C 0004

        SDBD                                    ; 563B   0001
        MVII    #$56C4, R5                      ; 563C   02BD 00C4 0056
L_563F:
        ADDI    #$0020, R4                      ; 563F   02FC 0020
        MVII    #$00A0, R3                      ; 5641   02BB 00A0
L_5643:
        MVI@    R5,     R0                      ; 5643   02A8
        MVO@    R0,     R4                      ; 5644   0260
        DECR    R3                              ; 5645   0013
        BNEQ    L_5643                          ; 5646   022C 0004

        MVO     R0,     .STIC.VIDEN             ; 5648   0240 0020

        JSR     R5,     X_PLAY_NOTE             ; 564A   0004 0118 02BD
        JSR     R5,     L_5651                  ; 564D   0004 0154 0251

        PULR    R7                              ; 5650   02B7

L_5651:
        PSHR    R5                              ; 5651   0275
        SDBD                                    ; 5652   0001
        MVII    #$565C, R3                      ; 5653   02BB 005C 0056
        MVO     R3,     .ISRVEC.0               ; 5656   0243 0100
        SWAP    R3,     1                       ; 5658   0043
        MVO     R3,     .ISRVEC.1               ; 5659   0243 0101
        PULR    R7                              ; 565B   02B7

L_565C:
        PSHR    R5                              ; 565C   0275
        MOVR    R7,     R5                      ; 565D   00BD
        ADDI    #$0005, R5                      ; 565E   02FD 0005
        J       X_DEF_ISR                       ; 5660   0004 0310 0126

        DECLE   $0004,  $0168,  $015F           ; 5663   0004 0168 015F

        PULR    R7                              ; 5666   02B7

L_5667:
        EIS                                     ; 5667   0002
        MVI     G_0102, R0                      ; 5668   0280 0102
        DECR    R0                              ; 566A   0010
        BPL     L_5667                          ; 566B   0223 0005

        MVI     G_0103, R1                      ; 566D   0281 0103
        MVO     R1,     G_0102                  ; 566F   0241 0102
        NEGR    R0                              ; 5671   0020

        JSR     R5,     X_RAND1                 ; 5672   0004 0114 027D
        JSR     R5,     .EXEC.1FA               ; 5675   0004 0110 01FA
        JSR     R5,     .EXEC.7D5               ; 5678   0004 0114 03D5
        JSR     R5,     .EXEC.4F1               ; 567B   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 567E   0004 0118 02AD
        DECLE   $0004,  $0168,  $0189           ; 5681   0004 0168 0189

        B       L_5667                          ; 5684   0220 001E

.GRAM_INIT_5686:
        DECLE   $0031           ; 5686  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5687  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5689  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 568B  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 568D  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 568F  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 5691  #28-2F:  CART #28-2F ----
        DECLE   $0060           ; 5693  #30   :  CART #30    ----

.GFX_LIST_5694:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5694  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5698  
        DECLE   $00DE,  $00FB,  $005F,  $00F6   ; 569C  CART PIC #01
        DECLE   $00DD,  $0077,  $00EE,  $00BB   ; 56A0  
        DECLE   $000A,  $0052,  $002D,  $00DA   ; 56A4  CART PIC #02
        DECLE   $007D,  $00BA,  $00CC,  $0025   ; 56A8  
        DECLE   $0052,  $008A,  $007F,  $007C   ; 56AC  CART PIC #03
        DECLE   $00BD,  $006A,  $00BC,  $004A   ; 56B0  
        DECLE   $0010,  $0024,  $009A,  $007C   ; 56B4  CART PIC #04
        DECLE   $002E,  $0058,  $0024,  $0000   ; 56B8  
        DECLE   $0008,  $001C,  $001C,  $003E   ; 56BC  CART PIC #05
        DECLE   $003E,  $003E,  $0008,  $0008   ; 56C0  
        DECLE   $0001,  $0007,  $001F,  $003F   ; 56C4  CART PIC #06
        DECLE   $003F,  $007F,  $007F,  $00FF   ; 56C8  
        DECLE   $0000,  $0001,  $0003,  $0003   ; 56CC  CART PIC #07
        DECLE   $0007,  $000F,  $003F,  $007F   ; 56D0  
        DECLE   $0000,  $0000,  $0000,  $0001   ; 56D4  CART PIC #08
        DECLE   $0003,  $0007,  $001F,  $003F   ; 56D8  
        DECLE   $0080,  $00C0,  $00C0,  $00E0   ; 56DC  CART PIC #09
        DECLE   $00E0,  $00F0,  $00FC,  $00FF   ; 56E0  
        DECLE   $0000,  $0080,  $00E0,  $00F0   ; 56E4  CART PIC #0A
        DECLE   $00F8,  $00FC,  $00FC,  $00FE   ; 56E8  
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 56EC  CART PIC #0B
        DECLE   $00E0,  $00F0,  $00F8,  $00FC   ; 56F0  
        DECLE   $00FF,  $007F,  $007F,  $003F   ; 56F4  CART PIC #0C
        DECLE   $000F,  $0003,  $0003,  $0001   ; 56F8  
        DECLE   $007F,  $003F,  $000F,  $0007   ; 56FC  CART PIC #0D
        DECLE   $0007,  $0003,  $0001,  $0000   ; 5700  
        DECLE   $003F,  $001F,  $0007,  $0003   ; 5704  CART PIC #0E
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5708  
        DECLE   $00FF,  $00FC,  $00F8,  $00F8   ; 570C  CART PIC #0F
        DECLE   $00F0,  $00F0,  $00E0,  $0080   ; 5710  
        DECLE   $00FE,  $00FC,  $00FC,  $00F8   ; 5714  CART PIC #10
        DECLE   $00D8,  $00C0,  $0080,  $0000   ; 5718  
        DECLE   $00FC,  $00F0,  $00C0,  $0080   ; 571C  CART PIC #11
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5720  
        DECLE   $0030,  $00F9,  $00FF,  $00FF   ; 5724  CART PIC #12
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5728  
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 572C  CART PIC #13
        DECLE   $00FC,  $00FE,  $00FF,  $00FE   ; 5730  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5734  CART PIC #14
        DECLE   $00FF,  $00F3,  $0081,  $0000   ; 5738  
        DECLE   $007F,  $003F,  $003F,  $003F   ; 573C  CART PIC #15
        DECLE   $007F,  $00FF,  $00FF,  $007F   ; 5740  
        DECLE   $0000,  $0006,  $0007,  $008F   ; 5744  CART PIC #16
        DECLE   $00CF,  $00FF,  $00FF,  $00FF   ; 5748  
        DECLE   $00FC,  $00F8,  $00F8,  $00F8   ; 574C  CART PIC #17
        DECLE   $00FE,  $00FE,  $00FE,  $00FC   ; 5750  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5754  CART PIC #18
        DECLE   $00F3,  $0043,  $0000,  $0000   ; 5758  
        DECLE   $001F,  $003F,  $001F,  $003F   ; 575C  CART PIC #19
        DECLE   $007F,  $007F,  $003F,  $003F   ; 5760  
        DECLE   $0000,  $00BD,  $0000,  $00BD   ; 5764  CART PIC #1A
        DECLE   $0000,  $00BD,  $0000,  $00BD   ; 5768  
        DECLE   $005A,  $0042,  $0042,  $0042   ; 576C  CART PIC #1B
        DECLE   $005A,  $0042,  $0066,  $003C   ; 5770  
        DECLE   $0066,  $007E,  $0000,  $007E   ; 5774  CART PIC #1C
        DECLE   $007E,  $0000,  $007E,  $007E   ; 5778  
        DECLE   $0000,  $0089,  $0008,  $0081   ; 577C  CART PIC #1D
        DECLE   $0000,  $0089,  $0008,  $0081   ; 5780  
        DECLE   $003C,  $00BD,  $00BD,  $003C   ; 5784  CART PIC #1E
        DECLE   $0000,  $00BD,  $0081,  $0024   ; 5788  
        DECLE   $0000,  $0000,  $001C,  $0022   ; 578C  CART PIC #1F
        DECLE   $0055,  $00FF,  $0041,  $0000   ; 5790  
        DECLE   $00C3,  $00A5,  $00A5,  $0099   ; 5794  CART PIC #20
        DECLE   $00C3,  $00DB,  $00DB,  $00DB   ; 5798  
        DECLE   $00C3,  $003C,  $00C3,  $0024   ; 579C  CART PIC #21
        DECLE   $00DB,  $0018,  $00DB,  $0018   ; 57A0  
        DECLE   $0018,  $0018,  $0000,  $007E   ; 57A4  CART PIC #22
        DECLE   $0024,  $0081,  $00C3,  $00E7   ; 57A8  
        DECLE   $0000,  $003C,  $003C,  $003C   ; 57AC  CART PIC #23
        DECLE   $0000,  $007E,  $0024,  $0000   ; 57B0  
        DECLE   $0081,  $0024,  $007E,  $0000   ; 57B4  CART PIC #24
        DECLE   $0000,  $007E,  $0024,  $0000   ; 57B8  
        DECLE   $0018,  $0018,  $0000,  $007E   ; 57BC  CART PIC #25
        DECLE   $0024,  $0081,  $00C3,  $00E7   ; 57C0  
        DECLE   $0081,  $0024,  $007E,  $0000   ; 57C4  CART PIC #26
        DECLE   $0000,  $007E,  $0024,  $0000   ; 57C8  
        DECLE   $0080,  $0088,  $0088,  $0080   ; 57CC  CART PIC #27
        DECLE   $0080,  $0088,  $0088,  $00C1   ; 57D0  
        DECLE   $00FE,  $00FC,  $00FD,  $00FD   ; 57D4  CART PIC #28
        DECLE   $00FC,  $00FE,  $00FF,  $00FF   ; 57D8  
        DECLE   $0080,  $0008,  $0088,  $0080   ; 57DC  CART PIC #29
        DECLE   $0000,  $0088,  $0008,  $0080   ; 57E0  
        DECLE   $00C1,  $0088,  $0088,  $0080   ; 57E4  CART PIC #2A
        DECLE   $0080,  $0088,  $0088,  $0000   ; 57E8  
        DECLE   $00C3,  $0042,  $0042,  $00C3   ; 57EC  CART PIC #2B
        DECLE   $00FF,  $0042,  $007E,  $00DB   ; 57F0  
        DECLE   $00DE,  $00FB,  $005F,  $00F6   ; 57F4  CART PIC #2C
        DECLE   $00DD,  $0077,  $00EE,  $00BB   ; 57F8  
        DECLE   $0000,  $0000,  $0080,  $0080   ; 57FC  CART PIC #2D
        DECLE   $0080,  $0080,  $0000,  $0000   ; 5800  
        DECLE   $0001,  $0032,  $007F,  $0033   ; 5804  CART PIC #2E
        DECLE   $0002,  $0002,  $0007,  $0002   ; 5808  
        DECLE   $0080,  $004C,  $00FE,  $00CC   ; 580C  CART PIC #2F
        DECLE   $0040,  $0040,  $00E0,  $0040   ; 5810  
        DECLE   $003C,  $0042,  $0099,  $00A1   ; 5814  CART PIC #30
        DECLE   $00A1,  $0099,  $0042,  $003C   ; 5818  
        DECLE   $0001,  $0004,  $0009,  $0010   ; 581C   0001 0004 0009 0010
        DECLE   $0042,  $0008,  $0045,  $0090   ; 5820   0042 0008 0045 0090
        DECLE   $0000,  $0000,  $0002,  $0004   ; 5824   0000 0000 0002 0004
        DECLE   $0000,  $0015,  $0020,  $0004   ; 5828   0000 0015 0020 0004
        DECLE   $0000,  $0000,  $0000,  $0002   ; 582C   0000 0000 0000 0002
        DECLE   $0009,  $0000,  $0022,  $0014   ; 5830   0009 0000 0022 0014
        DECLE   $0080,  $0020,  $0010,  $0040   ; 5834   0080 0020 0010 0040
        DECLE   $0092,  $0004,  $0050,  $0025   ; 5838   0092 0004 0050 0025
        DECLE   $0000,  $0080,  $0000,  $0028   ; 583C   0000 0080 0000 0028
        DECLE   $0040,  $0010,  $0084,  $0022   ; 5840   0040 0010 0084 0022
        DECLE   $0000,  $0000,  $0080,  $0000   ; 5844   0000 0000 0080 0000
        DECLE   $0040,  $0000,  $0010,  $0044   ; 5848   0040 0000 0010 0044
        DECLE   $0088,  $0015,  $0080,  $0052   ; 584C   0088 0015 0080 0052
        DECLE   $0009,  $0020,  $0004,  $0001   ; 5850   0009 0020 0004 0001
        DECLE   $0051,  $0000,  $0012,  $0004   ; 5854   0051 0000 0012 0004
        DECLE   $0001,  $0000,  $0001,  $0000   ; 5858   0001 0000 0001 0000
        DECLE   $0021,  $000A,  $0000,  $0005   ; 585C   0021 000A 0000 0005
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5860   0000 0001 0000 0000

        SLL     R0,     1                       ; 5864   0048

        JSR     R4,     .EXEC.0A0               ; 5865   0004 0010 00A0
        DECLE   $0010,  $0040,  $0000,  $0000   ; 5868   0010 0040 0000 0000
        DECLE   $0042,  $0088,  $0010,  $0040   ; 586C   0042 0088 0010 0040
        DECLE   $0000,  $0040,  $0000,  $0000   ; 5870   0000 0040 0000 0000
        DECLE   $0008,  $0094,  $0020,  $0000   ; 5874   0008 0094 0020 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5878   0040 0000 0000 0000
        DECLE   $0000,  $0001,  $0044,  $0002   ; 587C   0000 0001 0044 0002
        DECLE   $0044,  $0090,  $0002,  $0020   ; 5880   0044 0090 0002 0020
        DECLE   $0002,  $0044,  $0010,  $0084   ; 5884   0002 0044 0010 0084
        DECLE   $0001,  $00A4,  $0009,  $0040   ; 5888   0001 00A4 0009 0040
        DECLE   $0048,  $0002,  $00A0,  $0004   ; 588C   0048 0002 00A0 0004
        DECLE   $0020,  $0048,  $0001,  $0004   ; 5890   0020 0048 0001 0004
        DECLE   $0022,  $0048,  $0000,  $0028   ; 5894   0022 0048 0000 0028
        DECLE   $0001,  $0040,  $0014,  $0001   ; 5898   0001 0040 0014 0001
        DECLE   $0000,  $0000,  $0022,  $0048   ; 589C   0000 0000 0022 0048
        DECLE   $0001,  $0084,  $0012,  $0048   ; 58A0   0001 0084 0012 0048
        DECLE   $0028,  $0084,  $0040,  $0028   ; 58A4   0028 0084 0040 0028
        DECLE   $0000,  $00A4,  $0008,  $0020   ; 58A8   0000 00A4 0008 0020
        DECLE   $0048,  $0011,  $0082,  $0008   ; 58AC   0048 0011 0082 0008
        DECLE   $0050,  $0002,  $0004,  $0000   ; 58B0   0050 0002 0004 0000
        DECLE   $0001,  $0004,  $0021,  $0000   ; 58B4   0001 0004 0021 0000
        DECLE   $0012,  $0000,  $0025,  $0010   ; 58B8   0012 0000 0025 0010
        DECLE   $0001                           ; 58BC   0001

        DIS                                     ; 58BD   0003
        INCR    R2                              ; 58BE   000A
        INCR    R7                              ; 58BF   000F

        INCR    R3                              ; 58C0   000B
L_58C1:
        INCR    R2                              ; 58C1   000A
        DECLE   $0002,  $0002,  $0007,  $0002   ; 58C2   0002 0002 0007 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 58CA   0000 0000 0001 0003
        DECLE   $000A,  $001F,  $000A,  $000B   ; 58CE   000A 001F 000A 000B
        DECLE   $0002,  $0002,  $0002,  $0007   ; 58D2   0002 0002 0002 0007
        DECLE   $0002,  $0000,  $0000,  $0000   ; 58D6   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 58DA   0000 0000 0001 0003
        DECLE   $001A,  $003F,  $001A,  $001B   ; 58DE   001A 003F 001A 001B
        DECLE   $0002,  $0002,  $0002,  $0007   ; 58E2   0002 0002 0002 0007
        DECLE   $0002,  $0000,  $0000,  $0000   ; 58E6   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 58EA   0000 0000 0001 0003
        DECLE   $001A,  $003F,  $003E,  $001B   ; 58EE   001A 003F 003E 001B
        DECLE   $001A,  $0002,  $0002,  $0002   ; 58F2   001A 0002 0002 0002
        DECLE   $0007,  $0002,  $0000,  $0000   ; 58F6   0007 0002 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 58FA   0000 0000 0001 0003
        DECLE   $001A,  $003F,  $003F,  $001A   ; 58FE   001A 003F 003F 001A
        DECLE   $001B,  $0002,  $0002,  $0002   ; 5902   001B 0002 0002 0002
        DECLE   $0002,  $0007,  $0002,  $0000   ; 5906   0002 0007 0002 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 590A   0000 0000 0001 0003
        DECLE   $0032,  $007F,  $007F,  $0036   ; 590E   0032 007F 007F 0036
        DECLE   $0037,  $0005,  $0004,  $0004   ; 5912   0037 0005 0004 0004
        DECLE   $0004,  $0004,  $000F,  $0004   ; 5916   0004 0004 000F 0004
        DECLE   $0000,  $0000,  $0001,  $0003   ; 591A   0000 0000 0001 0003
        DECLE   $0072,  $00FF,  $00FF,  $0076   ; 591E   0072 00FF 00FF 0076
        DECLE   $0076,  $0007,  $0005,  $0004   ; 5922   0076 0007 0005 0004
        DECLE   $0004,  $0004,  $0004,  $000F   ; 5926   0004 0004 0004 000F
        DECLE   $0004,  $0000,  $0001,  $0023   ; 592A   0004 0000 0001 0023
        DECLE   $0072,  $00FE,  $00FF,  $0076   ; 592E   0072 00FE 00FF 0076
        DECLE   $0076,  $0027,  $0005,  $0004   ; 5932   0076 0027 0005 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; 5936   0004 0004 0004 0004
        DECLE   $000F,  $0004,  $0081,  $0081   ; 593A   000F 0004 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 593E   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0010,  $0038   ; 5942   0081 0081 0010 0038
        DECLE   $0038,  $0010,  $0028,  $0000   ; 5946   0038 0010 0028 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5952   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0010,  $0028   ; 5956   0038 0038 0010 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5962   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0038,  $0010   ; 5966   0038 0038 0038 0010
        DECLE   $0028,  $0000,  $0000,  $0000   ; 596A   0028 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5972   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5976   0038 0038 0038 0038
        DECLE   $0010,  $0038,  $0028,  $0000   ; 597A   0010 0038 0028 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5982   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5986   0038 0038 0038 0038
        DECLE   $0038,  $0010,  $0038,  $0028   ; 598A   0038 0010 0038 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 598E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5992   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5996   0038 0038 0038 0038
        DECLE   $0038,  $0038,  $0010,  $0038   ; 599A   0038 0038 0010 0038
        DECLE   $0028,  $0000,  $0000,  $0000   ; 599E   0028 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 59A2   0000 0000 0018 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 59A6   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $003C   ; 59AA   003C 003C 0018 003C
        DECLE   $0024,  $0000,  $0000,  $0000   ; 59AE   0024 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 59B2   0000 0000 0018 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 59B6   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $0018   ; 59BA   003C 003C 0018 0018
        DECLE   $003C,  $0024,  $0000,  $0000   ; 59BE   003C 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C6   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $0018,  $0000   ; 59CA   0018 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0028   ; 59D6   0000 0000 0010 0028
        DECLE   $001C,  $003E,  $001C,  $000A   ; 59DA   001C 003E 001C 000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E2   0000 0000 0000 0000
        DECLE   $0010,  $0020,  $001A,  $005C   ; 59E6   0010 0020 001A 005C
        DECLE   $003E,  $003E,  $001C,  $002D   ; 59EA   003E 003E 001C 002D
        DECLE   $0056,  $0004,  $0000,  $0000   ; 59EE   0056 0004 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0024   ; 59F2   0000 0000 0008 0024
        DECLE   $005A,  $0030,  $001D,  $007C   ; 59F6   005A 0030 001D 007C
        DECLE   $0026,  $0037,  $00BE,  $00BD   ; 59FA   0026 0037 00BE 00BD
        DECLE   $0012,  $0004,  $0033,  $001A   ; 59FE   0012 0004 0033 001A
        DECLE   $0000,  $0000,  $000C,  $0020   ; 5A02   0000 0000 000C 0020
        DECLE   $007A,  $0036,  $004C,  $006E   ; 5A06   007A 0036 004C 006E
        DECLE   $00C3,  $0053,  $00A6,  $00EC   ; 5A0A   00C3 0053 00A6 00EC
        DECLE   $007F,  $0054,  $0033,  $003A   ; 5A0E   007F 0054 0033 003A
        DECLE   $0000,  $0020,  $000C,  $0030   ; 5A12   0000 0020 000C 0030
        DECLE   $004A,  $0035,  $0044,  $00A3   ; 5A16   004A 0035 0044 00A3
        DECLE   $0055,  $0042,  $00AB,  $00C1   ; 5A1A   0055 0042 00AB 00C1
        DECLE   $0056,  $00C4,  $0033,  $002A   ; 5A1E   0056 00C4 0033 002A
        DECLE   $0018,  $0040,  $0000,  $0000   ; 5A22   0018 0040 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0038   ; 5A26   0000 0010 0010 0038
        DECLE   $00EE,  $0038,  $0010,  $0010   ; 5A2A   00EE 0038 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A32   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0038   ; 5A36   0000 0010 0010 0038
        DECLE   $00FE,  $0028,  $0038,  $0010   ; 5A3A   00FE 0028 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A42   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $00FE   ; 5A46   0000 0010 0010 00FE
        DECLE   $0038,  $0038,  $0028,  $0010   ; 5A4A   0038 0038 0028 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A52   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $00EE,  $007C   ; 5A56   0010 0010 00EE 007C
        DECLE   $0038,  $0038,  $0038,  $0000   ; 5A5A   0038 0038 0038 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5A5E   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A62   0000 0000 0000 0000
        DECLE   $0010,  $00EE,  $006C,  $0038   ; 5A66   0010 00EE 006C 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5A6A   0038 0038 0038 0038
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5A6E   0000 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5A72   0000 0000 0000 0010
        DECLE   $00EE,  $006C,  $006C,  $0038   ; 5A76   00EE 006C 006C 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5A7A   0038 0038 0038 0038
        DECLE   $0038,  $0000,  $0010,  $0010   ; 5A7E   0038 0000 0010 0010
        DECLE   $0000,  $0000,  $0010,  $00FE   ; 5A82   0000 0000 0010 00FE
        DECLE   $00EE,  $006C,  $0038,  $006C   ; 5A86   00EE 006C 0038 006C
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5A8A   0038 0038 0038 0038
        DECLE   $0038,  $0038,  $0000,  $0010   ; 5A8E   0038 0038 0000 0010
        DECLE   $0010,  $0000,  $00D6,  $00EE   ; 5A92   0010 0000 00D6 00EE
        DECLE   $006C,  $0038,  $0038,  $006C   ; 5A96   006C 0038 0038 006C
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5A9A   0038 0038 0038 0038
        DECLE   $0038,  $0038,  $0038,  $0000   ; 5A9E   0038 0038 0038 0000
        DECLE   $0010,  $0010,  $0043,  $004F   ; 5AA2   0010 0010 0043 004F
        DECLE   $0050,  $0059,  $0052,  $0049   ; 5AA6   0050 0059 0052 0049
        DECLE   $0047,  $0048,  $0054,  $0020   ; 5AAA   0047 0048 0054 0020
        DECLE   $0031,  $0039,  $0038,  $0032   ; 5AAE   0031 0039 0038 0032
        DECLE   $0020,  $004D,  $0041,  $0054   ; 5AB2   0020 004D 0041 0054
        DECLE   $0054,  $0045,  $004C,  $002C   ; 5AB6   0054 0045 004C 002C
        DECLE   $0020,  $0043,  $004F,  $0050   ; 5ABA   0020 0043 004F 0050
        DECLE   $0059,  $0052,  $0049,  $0047   ; 5ABE   0059 0052 0049 0047
        DECLE   $0048,  $0054,  $0020,  $0031   ; 5AC2   0048 0054 0020 0031
        DECLE   $0039,  $0038,  $0032,  $0020   ; 5AC6   0039 0038 0032 0020
        DECLE   $0044,  $0041,  $0054,  $0041   ; 5ACA   0044 0041 0054 0041
        DECLE   $0020,  $0045,  $0041,  $0053   ; 5ACE   0020 0045 0041 0053
        DECLE   $0054,  $0020,  $0043,  $004F   ; 5AD2   0054 0020 0043 004F
        DECLE   $0052,  $0050,  $002E,  $0020   ; 5AD6   0052 0050 002E 0020
        DECLE   $0000,  $0040,  $0018,  $004B   ; 5ADA   0000 0040 0018 004B
        DECLE   $005B,  $0000,  $0050,  $0000   ; 5ADE   005B 0000 0050 0000
        DECLE   $0050,  $0000,  $0000,  $0000   ; 5AE2   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE6   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $001A,  $0052   ; 5AEA   0000 0040 001A 0052
        DECLE   $005B,  $0000,  $0058,  $0000   ; 5AEE   005B 0000 0058 0000
        DECLE   $0050,  $0000,  $0008,  $0000   ; 5AF2   0050 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF6   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0010,  $0059   ; 5AFA   0000 0040 0010 0059
        DECLE   $005B,  $0000,  $0050,  $0000   ; 5AFE   005B 0000 0050 0000
        DECLE   $004B,  $03D8,  $0000,  $0000   ; 5B02   004B 03D8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B06   0000 0000 0000 0000
        DECLE   $0000,  $0086,  $0018,  $0060   ; 5B0A   0000 0086 0018 0060
        DECLE   $005B,  $0000,  $0048,  $0000   ; 5B0E   005B 0000 0048 0000
        DECLE   $0048,  $0381,  $0000,  $0000   ; 5B12   0048 0381 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B16   0000 0000 0000 0000
        DECLE   $0000,  $0086,  $0018,  $006B   ; 5B1A   0000 0086 0018 006B
        DECLE   $005B,  $0000,  $0000,  $0000   ; 5B1E   005B 0000 0000 0000
        DECLE   $0000,  $007F,  $0000,  $0000   ; 5B22   0000 007F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B26   0000 0000 0000 0000
        DECLE   $0000,  $0086,  $0018,  $006B   ; 5B2A   0000 0086 0018 006B
        DECLE   $005B,  $0000,  $0000,  $0000   ; 5B2E   005B 0000 0000 0000
        DECLE   $0000,  $0063,  $0000,  $0000   ; 5B32   0000 0063 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B36   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0018,  $00B5   ; 5B3A   0000 0042 0018 00B5
        DECLE   $0061,  $0000,  $0050,  $0000   ; 5B3E   0061 0000 0050 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B46   0000 0000 0000 0000
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5B4A   0000 0300 0000 0000
        DECLE   $0010,  $0008,  $0000,  $0000   ; 5B4E   0010 0008 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0010   ; 5B52   0200 0000 0000 0010
        DECLE   $0008,  $0000,  $0000,  $0200   ; 5B56   0008 0000 0000 0200
        DECLE   $0000,  $0000,  $0010,  $0008   ; 5B5A   0000 0000 0010 0008
        DECLE   $0011,  $0000,  $019C,  $005F   ; 5B5E   0011 0000 019C 005F
        DECLE   $0000,  $0000,  $0001,  $0010   ; 5B62   0000 0000 0001 0010
        DECLE   $0004,  $013B,  $005F,  $013B   ; 5B66   0004 013B 005F 013B
        DECLE   $015F,  $017B,  $005C,  $00B7   ; 5B6A   015F 017B 005C 00B7
        DECLE   $005C,  $0001,  $0010,  $0004   ; 5B6E   005C 0001 0010 0004

        NEGR    R4                              ; 5B72   0024
        SLLC    R1,     2                       ; 5B73   005D
        NEGR    R4                              ; 5B74   0024
        CMPR    R3,     R5                      ; 5B75   015D
L_5B76:
        PSHR    R5                              ; 5B76   0275
        SDBD                                    ; 5B77   0001
        MVII    #$5BF4, R4                      ; 5B78   02BC 00F4 005B
        MVI     .PSG0.rgt_hand,R0               ; 5B7B   0280 01FE
        MVI     .PSG0.lft_hand,R1               ; 5B7D   0281 01FF
        CLRR    R3                              ; 5B7F   01DB
        DECR    R3                              ; 5B80   0013
        ANDI    #$001F, R0                      ; 5B81   03B8 001F
        ANDI    #$001F, R1                      ; 5B83   03B9 001F
L_5B85:
        INCR    R3                              ; 5B85   000B
        MVI@    R4,     R2                      ; 5B86   02A2
        XORR    R0,     R2                      ; 5B87   01C2
        BEQ     L_5B97                          ; 5B88   0204 000D

        XORR    R0,     R2                      ; 5B8A   01C2
        XORR    R1,     R2                      ; 5B8B   01CA
        BEQ     L_5B97                          ; 5B8C   0204 0009

        CMPI    #$000F, R3                      ; 5B8E   037B 000F
        BMI     L_5B85                          ; 5B90   022B 000C

        CLRR    R0                              ; 5B92   01C0
        MVO     R0,     G_01A9                  ; 5B93   0240 01A9
        B       L_5BCF                          ; 5B95   0200 0038

L_5B97:
        CLRR    R1                              ; 5B97   01C9
        CLRR    R2                              ; 5B98   01D2
        INCR    R3                              ; 5B99   000B
        ADDR    R7,     R3                      ; 5B9A   00FB
        ADD@    R3,     R7                      ; 5B9B   02DF

        DECR    R0                              ; 5B9C   0010
        DECR    R0                              ; 5B9D   0010
        DECR    R1                              ; 5B9E   0011
        DECR    R3                              ; 5B9F   0013
        DECR    R3                              ; 5BA0   0013
        DECR    R3                              ; 5BA1   0013
        DECR    R5                              ; 5BA2   0015
        DECR    R6                              ; 5BA3   0016
        DECR    R6                              ; 5BA4   0016
        DECR    R6                              ; 5BA5   0016
L_5BA6:
        DECR    R7                              ; 5BA6   0017

        COMR    R1                              ; 5BA7   0019
        COMR    R1                              ; 5BA8   0019
        COMR    R1                              ; 5BA9   0019
        COMR    R3                              ; 5BAA   001B
        DECR    R0                              ; 5BAB   0010
        INCR    R1                              ; 5BAC   0009
        ADD     G_0171, R2                      ; 5BAD   02C2 0171
        ADD     G_0171, R2                      ; 5BAF   02C2 0171
        DECR    R1                              ; 5BB1   0011
        DECR    R1                              ; 5BB2   0011
        SUB     G_0171, R2                      ; 5BB3   0302 0171
        SUB     G_0171, R2                      ; 5BB5   0302 0171
        INCR    R1                              ; 5BB7   0009
        ADD     G_0171, R2                      ; 5BB8   02C2 0171
        MOVR    R1,     R3                      ; 5BBA   008B
        NEGR    R3                              ; 5BBB   0023
        SLL     R3,     2                       ; 5BBC   004F
        SLL     R3,     1                       ; 5BBD   004B
        ADD     G_0170, R1                      ; 5BBE   02C1 0170
        BMI     L_5BC6                          ; 5BC0   020B 0004

        MVO     R1,     G_0170                  ; 5BC2   0241 0170
        B       L_5BC7                          ; 5BC4   0200 0001

L_5BC6:
        CLRR    R3                              ; 5BC6   01DB
L_5BC7:
        MVO     R3,     G_01A9                  ; 5BC7   0243 01A9
        ANDI    #$00FF, R2                      ; 5BC9   03BA 00FF
        SWAP    R2,     1                       ; 5BCB   0042
        MVO     R2,     G_0321                  ; 5BCC   0242 0321
        PULR    R7                              ; 5BCE   02B7

L_5BCF:
        CLRR    R0                              ; 5BCF   01C0
        MVO     R0,     G_0321                  ; 5BD0   0240 0321
        PULR    R7                              ; 5BD2   02B7

L_5BD3:
        PSHR    R5                              ; 5BD3   0275

        JSR     R5,     L_5B76                  ; 5BD4   0004 0158 0376

        MVI     G_0170, R0                      ; 5BD7   0280 0170
        CMPI    #$0020, R0                      ; 5BD9   0378 0020
        BMI     L_5BE4                          ; 5BDB   020B 0007

        DECR    R0                              ; 5BDD   0010
        MVO     R0,     G_0170                  ; 5BDE   0240 0170
        CLRR    R0                              ; 5BE0   01C0
        MVO     R0,     G_01A9                  ; 5BE1   0240 01A9
        PULR    R7                              ; 5BE3   02B7

L_5BE4:
        MOVR    R0,     R2                      ; 5BE4   0082
        NEGR    R2                              ; 5BE5   0022
        ADDI    #$003F, R2                      ; 5BE6   02FA 003F
        MVO     R2,     G_0185                  ; 5BE8   0242 0185
        MVO     R2,     G_0171                  ; 5BEA   0242 0171
        ANDI    #$001C, R0                      ; 5BEC   03B8 001C
        SLR     R0,     2                       ; 5BEE   0064
        MVO     R0,     G_0322                  ; 5BEF   0240 0322
        MVO     R0,     G_032A                  ; 5BF1   0240 032A
        PULR    R7                              ; 5BF3   02B7

        COMR    R5                              ; 5BF4   001D
        COMR    R1                              ; 5BF5   0019
        INCR    R1                              ; 5BF6   0009
        INCR    R3                              ; 5BF7   000B
        COMR    R3                              ; 5BF8   001B
        DECR    R3                              ; 5BF9   0013
        DIS                                     ; 5BFA   0003
        SETC                                    ; 5BFB   0007
L_5BFC:
        DECR    R7                              ; 5BFC   0017

        DECR    R6                              ; 5BFD   0016
        CLRC                                    ; 5BFE   0006
        INCR    R6                              ; 5BFF   000E
        COMR    R6                              ; 5C00   001E
        COMR    R4                              ; 5C01   001C
        INCR    R4                              ; 5C02   000C
        INCR    R5                              ; 5C03   000D
L_5C04:
        PSHR    R5                              ; 5C04   0275
        MVII    #$000F, R0                      ; 5C05   02B8 000F
        MVII    #$031D, R4                      ; 5C07   02BC 031D
        MVII    #$033D, R1                      ; 5C09   02B9 033D

        JSR     R5,     .EXEC.730               ; 5C0B   0004 0114 0330

        MVO     R0,     G_017E                  ; 5C0E   0240 017E
        MVO     R0,     G_017F                  ; 5C10   0240 017F
        MVO     R0,     G_0180                  ; 5C12   0240 0180
        MVO     R0,     G_0340                  ; 5C14   0240 0340
        MVO     R0,     G_0348                  ; 5C16   0240 0348
        SDBD                                    ; 5C18   0001
        MVII    #$5C70, R0                      ; 5C19   02B8 0070 005C
        MVO     R0,     G_033E                  ; 5C1C   0240 033E
        MVO     R0,     G_0346                  ; 5C1E   0240 0346
        MVII    #$0004, R0                      ; 5C20   02B8 0004
        SWAP    R0,     1                       ; 5C22   0040
        MOVR    R0,     R1                      ; 5C23   0081
        XOR     G_033D, R0                      ; 5C24   03C0 033D
        XOR     G_0345, R1                      ; 5C26   03C1 0345
        MVO     R0,     G_033D                  ; 5C28   0240 033D
        MVO     R1,     G_0345                  ; 5C2A   0241 0345
        MVII    #$0005, R0                      ; 5C2C   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 5C2E   0004 0114 02CF

        MVII    #$0040, R0                      ; 5C31   02B8 0040
        MVO     R0,     G_0341                  ; 5C33   0240 0341
        MVII    #$0028, R0                      ; 5C35   02B8 0028
        MVO     R0,     G_0181                  ; 5C37   0240 0181
        MVII    #$0006, R0                      ; 5C39   02B8 0006
        MVO     R0,     G_0343                  ; 5C3B   0240 0343
        MVI     G_016D, R0                      ; 5C3D   0280 016D
        CMPI    #$0005, R0                      ; 5C3F   0378 0005
        BLE     L_5C4B                          ; 5C41   0206 0008

        MVII    #$0004, R0                      ; 5C43   02B8 0004

        JSR     R5,     X_RAND2                 ; 5C45   0004 0114 029E

        TSTR    R0                              ; 5C48   0080
        BEQ     L_5C66                          ; 5C49   0204 001B

L_5C4B:
        MVII    #$0088, R0                      ; 5C4B   02B8 0088

        JSR     R5,     X_RAND2                 ; 5C4D   0004 0114 029E

        ADDI    #$000C, R0                      ; 5C50   02F8 000C
        SWAP    R0,     1                       ; 5C52   0040
        MVO     R0,     G_033F                  ; 5C53   0240 033F
        MVO     R0,     G_0347                  ; 5C55   0240 0347
        MVI     G_031F, R2                      ; 5C57   0282 031F
        SWAP    R2,     1                       ; 5C59   0042
        ANDI    #$00FF, R2                      ; 5C5A   03BA 00FF
        SWAP    R2,     1                       ; 5C5C   0042
        XORI    #$004B, R2                      ; 5C5D   03FA 004B
        MVII    #$0020, R3                      ; 5C5F   02BB 0020
        MVII    #$033D, R1                      ; 5C61   02B9 033D

        JSR     R5,     .EXEC.9A3               ; 5C63   0004 0118 01A3

L_5C66:
        MVII    #$034D, R1                      ; 5C66   02B9 034D

        JSR     R5,     L_5C7B                  ; 5C68   0004 015C 007B

        MVII    #$0008, R0                      ; 5C6B   02B8 0008
        MVO     R0,     G_0353                  ; 5C6D   0240 0353
        PULR    R7                              ; 5C6F   02B7

        DECLE   $01BE,  $005C,  $00DD,  $005C   ; 5C70   01BE 005C 00DD 005C
        DECLE   $0008,  $0000,  $0004           ; 5C74   0008 0000 0004

        NEGR    R2                              ; 5C77   0022
        SLLC    R1,     2                       ; 5C78   005D
        NEGR    R2                              ; 5C79   0022
        CMPR    R3,     R5                      ; 5C7A   015D
L_5C7B:
        PSHR    R5                              ; 5C7B   0275
        MVI     G_0181, R0                      ; 5C7C   0280 0181
        CMPI    #$0028, R0                      ; 5C7E   0378 0028
        BNEQ    L_5CB6                          ; 5C80   020C 0034

        MVI     G_033D, R0                      ; 5C82   0280 033D
        ANDI    #$0017, R0                      ; 5C84   03B8 0017
        CMPI    #$0002, R0                      ; 5C86   0378 0002
        BEQ     L_5CB6                          ; 5C88   0204 002C

        MOVR    R1,     R2                      ; 5C8A   008A
        MVI     G_0340, R0                      ; 5C8B   0280 0340
        SWAP    R0,     1                       ; 5C8D   0040
        ANDI    #$00FF, R0                      ; 5C8E   03B8 00FF
        CMPI    #$0050, R0                      ; 5C90   0378 0050
        BMI     L_5C98                          ; 5C92   020B 0004

        JSR     R5,     .EXEC.7AE               ; 5C94   0004 0114 03AE

        PULR    R7                              ; 5C97   02B7

L_5C98:
        SDBD                                    ; 5C98   0001
        MVII    #$5B1B, R1                      ; 5C99   02B9 001B 005B

        JSR     R5,     X_INIT_MOB              ; 5C9C   0004 0114 02B2
        DECLE   $0280,  $033F,  $0040,  $03B8   ; 5C9F   0280 033F 0040 03B8
        DECLE   $00FF,  $02F8,  $0004,  $0040   ; 5CA3   00FF 02F8 0004 0040
        DECLE   $02FA,  $0002,  $0250,  $0280   ; 5CA7   02FA 0002 0250 0280
        DECLE   $0340,  $000A,  $0250,  $0280   ; 5CAB   0340 000A 0250 0280
        DECLE   $0342,  $02FA,  $0004,  $0250   ; 5CAF   0342 02FA 0004 0250
        DECLE   $0004,  $0160,  $0255           ; 5CB3   0004 0160 0255
L_5CB6:
        PULR    R7                              ; 5CB6   02B7

        PSHR    R5                              ; 5CB7   0275
        MVII    #$0355, R1                      ; 5CB8   02B9 0355

        JSR     R5,     L_5C7B                  ; 5CBA   0004 015C 007B

        PULR    R7                              ; 5CBD   02B7

        PSHR    R5                              ; 5CBE   0275
        MVII    #$0005, R0                      ; 5CBF   02B8 0005

        JSR     R5,     .EXEC.6D5               ; 5CC1   0004 0114 02D5

        MVII    #$033D, R4                      ; 5CC4   02BC 033D
        MVII    #$000F, R1                      ; 5CC6   02B9 000F
        CLRR    R0                              ; 5CC8   01C0
L_5CC9:
        MVO@    R0,     R4                      ; 5CC9   0260
        DECR    R1                              ; 5CCA   0011
        BNEQ    L_5CC9                          ; 5CCB   022C 0003

        MVII    #$0006, R0                      ; 5CCD   02B8 0006

        JSR     R5,     X_RAND2                 ; 5CCF   0004 0114 029E

        TSTR    R0                              ; 5CD2   0080
        BEQ     L_5CDA                          ; 5CD3   0204 0005

        JSR     R5,     L_5C04                  ; 5CD5   0004 015C 0004

        MVII    #$0028, R0                      ; 5CD8   02B8 0028
L_5CDA:
        MVO     R0,     G_0181                  ; 5CDA   0240 0181
        PULR    R7                              ; 5CDC   02B7

        MVI     G_0181, R2                      ; 5CDD   0282 0181
        CMPI    #$0028, R2                      ; 5CDF   037A 0028
        BNEQ    L_5CFF                          ; 5CE1   020C 001C

        MVI     G_0340, R2                      ; 5CE3   0282 0340
        SWAP    R2,     1                       ; 5CE5   0042
        ANDI    #$00FF, R2                      ; 5CE6   03BA 00FF
        CMPI    #$0040, R2                      ; 5CE8   037A 0040
        BPL     L_5CFF                          ; 5CEA   0203 0013

        MVII    #$0009, R2                      ; 5CEC   02BA 0009
        MVO     R2,     G_0343                  ; 5CEE   0242 0343
        MVI     G_0342, R2                      ; 5CF0   0282 0342
        CMP     G_0322, R2                      ; 5CF2   0342 0322
        BEQ     L_5CFF                          ; 5CF4   0204 0009
        BMI     L_5CFA                          ; 5CF6   020B 0002

        SUBI    #$0002, R2                      ; 5CF8   033A 0002
L_5CFA:
        INCR    R2                              ; 5CFA   000A
        MVO     R2,     G_0342                  ; 5CFB   0242 0342
        MVO     R2,     G_034A                  ; 5CFD   0242 034A
L_5CFF:
        MOVR    R5,     R7                      ; 5CFF   00AF

        PSHR    R5                              ; 5D00   0275
        MVI     G_0181, R0                      ; 5D01   0280 0181
        CMPI    #$0028, R0                      ; 5D03   0378 0028
        BEQ     L_5D21                          ; 5D05   0204 001A

        CMPI    #$0045, R0                      ; 5D07   0378 0045
        BEQ     L_5D1E                          ; 5D09   0204 0013

        MVI     G_016D, R0                      ; 5D0B   0280 016D
        TSTR    R0                              ; 5D0D   0080
        BEQ     L_5D21                          ; 5D0E   0204 0011

        ADDI    #$0002, R0                      ; 5D10   02F8 0002
        CMPI    #$0007, R0                      ; 5D12   0378 0007
        BMI     L_5D18                          ; 5D14   020B 0002

        MVII    #$0007, R0                      ; 5D16   02B8 0007

L_5D18:
        JSR     R5,     X_RAND2                 ; 5D18   0004 0114 029E

        DECR    R0                              ; 5D1B   0010
        BLE     L_5D21                          ; 5D1C   0206 0003

L_5D1E:
        JSR     R5,     L_5C04                  ; 5D1E   0004 015C 0004

L_5D21:
        PULR    R7                              ; 5D21   02B7

L_5D22:
        SUBI    #$0002, R1                      ; 5D22   0339 0002
        DECLE   $0275,  $0280,  $0322,  $02F9   ; 5D24   0275 0280 0322 02F9
        DECLE   $0007,  $0348,  $020C,  $003D   ; 5D28   0007 0348 020C 003D
        DECLE   $0004,  $0160,  $02D2           ; 5D2C   0004 0160 02D2

        JSR     R5,     .EXEC.7B3               ; 5D2F   0004 0114 03B3

        CLRR    R0                              ; 5D32   01C0
        MVO     R0,     G_0173                  ; 5D33   0240 0173
        MVII    #$0005, R3                      ; 5D35   02BB 0005
        MVII    #$017C, R4                      ; 5D37   02BC 017C
L_5D39:
        MVO@    R0,     R4                      ; 5D39   0260
        DECR    R3                              ; 5D3A   0013
        BNEQ    L_5D39                          ; 5D3B   022C 0003

        INCR    R0                              ; 5D3D   0008
        MVO@    R0,     R4                      ; 5D3E   0260
        SDBD                                    ; 5D3F   0001
        MVII    #$5020, R1                      ; 5D40   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 5D43   0004 0118 0038

        ADDI    #$0010, R1                      ; 5D46   02F9 0010

        JSR     R5,     X_TIMER_STOP            ; 5D48   0004 0118 0038
        DECLE   $0001,  $02B8,  $0006,  $0019   ; 5D4B   0001 02B8 0006 0019
        DECLE   $0240,  $035D,  $02BC,  $031D   ; 5D4F   0240 035D 02BC 031D
        DECLE   $02BA,  $0355,  $0004,  $0160   ; 5D53   02BA 0355 0004 0160
        DECLE   $02FC,  $0073,  $00C2,  $0030   ; 5D57   02FC 0073 00C2 0030
        DECLE   $006A,  $005D,  $0010,  $0000   ; 5D5B   006A 005D 0010 0000
        DECLE   $00F0,  $0003,  $0028,  $0000   ; 5D5F   00F0 0003 0028 0000

        JSR     R5,     L_54D2                  ; 5D63   0004 0154 00D2
        JSR     R5,     L_6210                  ; 5D66   0004 0160 0210

        PULR    R7                              ; 5D69   02B7

        DECLE   $0100,  $0000,  $0071,  $005D   ; 5D6A   0100 0000 0071 005D
        DECLE   $0006,  $0021,  $0000           ; 5D6E   0006 0021 0000

        PSHR    R5                              ; 5D71   0275

        JSR     R5,     .EXEC.7AE               ; 5D72   0004 0114 03AE

        MVI     G_016F, R0                      ; 5D75   0280 016F
        DECR    R0                              ; 5D77   0010
        MVO     R0,     G_016F                  ; 5D78   0240 016F
        BPL     L_5D8D                          ; 5D7A   0203 0011

        MVI     G_0170, R0                      ; 5D7C   0280 0170
        NEGR    R0                              ; 5D7E   0020
        ADDI    #$003F, R0                      ; 5D7F   02F8 003F
        MVO     R0,     G_0185                  ; 5D81   0240 0185
        SDBD                                    ; 5D83   0001
        MVII    #$5DB0, R0                      ; 5D84   02B8 00B0 005D
        MVO     R0,     G_035D                  ; 5D87   0240 035D

        JSR     R5,     L_5DBA                  ; 5D89   0004 015C 01BA

        PULR    R7                              ; 5D8C   02B7

L_5D8D:
        CLRR    R0                              ; 5D8D   01C0
        MVO     R0,     G_0181                  ; 5D8E   0240 0181
        SDBD                                    ; 5D90   0001
        MVII    #$5020, R1                      ; 5D91   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 5D94   0004 0118 0044

        ADDI    #$0010, R1                      ; 5D97   02F9 0010

        JSR     R5,     X_TIMER_START           ; 5D99   0004 0118 0044
        DECLE   $0001,  $02B8,  $007A,  $0055   ; 5D9C   0001 02B8 007A 0055
        DECLE   $0240,  $035D,  $0001,  $02B8   ; 5DA0   0240 035D 0001 02B8
        DECLE   $004B,  $005B,  $0240,  $031E   ; 5DA4   004B 005B 0240 031E
        DECLE   $02F8,  $0007,  $0240,  $0326   ; 5DA8   02F8 0007 0240 0326
        DECLE   $0004,  $0168,  $01C7           ; 5DAC   0004 0168 01C7

        PULR    R7                              ; 5DAF   02B7

        DECLE   $0000,  $0000                   ; 5DB0   0000 0000

        ADDR    R6,     R4                      ; 5DB2   00F4
        SLLC    R1,     2                       ; 5DB3   005D
        MOVR    R7,     R2                      ; 5DB4   00BA
        SLLC    R1,     2                       ; 5DB5   005D
        MOVR    R7,     R2                      ; 5DB6   00BA
        SLLC    R1,     2                       ; 5DB7   005D
        MOVR    R7,     R2                      ; 5DB8   00BA
        SLLC    R1,     2                       ; 5DB9   005D
L_5DBA:
        PSHR    R5                              ; 5DBA   0275
        MVII    #$013E, R2                      ; 5DBB   02BA 013E
        MVII    #$01FF, R1                      ; 5DBD   02B9 01FF
        MVII    #$00F0, R3                      ; 5DBF   02BB 00F0
        MVII    #$0200, R4                      ; 5DC1   02BC 0200
L_5DC3:
        MOVR    R1,     R0                      ; 5DC3   0088
        AND@    R4,     R0                      ; 5DC4   03A0
        CMPR    R0,     R2                      ; 5DC5   0142
        BEQ     L_5DF3                          ; 5DC6   0204 002B

        DECR    R3                              ; 5DC8   0013
        BNEQ    L_5DC3                          ; 5DC9   022C 0007

        MVII    #$0006, R3                      ; 5DCB   02BB 0006
        MVI     G_016E, R0                      ; 5DCD   0280 016E
        TSTR    R0                              ; 5DCF   0080
        BNEQ    L_5DE0                          ; 5DD0   020C 000E

        MVI     .BTAB.28,R0                     ; 5DD2   0280 0228
        ANDI    #$01F8, R0                      ; 5DD4   03B8 01F8
        BNEQ    L_5DDC                          ; 5DD6   020C 0004

        MVII    #$0206, R3                      ; 5DD8   02BB 0206
        B       L_5DE0                          ; 5DDA   0200 0004

L_5DDC:
        SDBD                                    ; 5DDC   0001
        MVII    #$2206, R3                      ; 5DDD   02BB 0006 0022
L_5DE0:
        MVII    #$0219, R4                      ; 5DE0   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 5DE2   0004 0118 007B
        STRING  "GAME  OVER"                    ; 5DE5  
        DECLE   $0000                           ; 5DEF   0000

        JSR     R5,     L_54D2                  ; 5DF0   0004 0154 00D2

L_5DF3:
        PULR    R7                              ; 5DF3   02B7

        MVII    #$015D, R4                      ; 5DF4   02BC 015D
        MVII    #$0092, R3                      ; 5DF6   02BB 0092
        CLRR    R0                              ; 5DF8   01C0
L_5DF9:
        MVO@    R0,     R4                      ; 5DF9   0260
        DECR    R3                              ; 5DFA   0013
        BNEQ    L_5DF9                          ; 5DFB   022C 0003

        SDBD                                    ; 5DFD   0001
        MVII    #$5020, R1                      ; 5DFE   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 5E01   0004 0118 0044

        ADDI    #$0008, R1                      ; 5E04   02F9 0008

        JSR     R5,     X_TIMER_START           ; 5E06   0004 0118 0044

        ADDI    #$0008, R1                      ; 5E09   02F9 0008

        JSR     R5,     X_TIMER_START           ; 5E0B   0004 0118 0044

        SDBD                                    ; 5E0E   0001
        MVII    #$561B, R0                      ; 5E0F   02B8 001B 0056
        MVO     R0,     .ISRVEC.0               ; 5E12   0240 0100
        SWAP    R0,     1                       ; 5E14   0040
        MVO     R0,     .ISRVEC.1               ; 5E15   0240 0101
        MVII    #$02F1, R6                      ; 5E17   02BE 02F1
        J       .START                          ; 5E19   0004 0350 0109

        PSHR    R5                              ; 5E1C   0275
        DECR    R0                              ; 5E1D   0010
        BMI     L_5E64                          ; 5E1E   020B 0044

        MVI     G_0181, R0                      ; 5E20   0280 0181
        CMPI    #$0045, R0                      ; 5E22   0378 0045
        BNEQ    L_5E29                          ; 5E24   020C 0003

        CLRR    R0                              ; 5E26   01C0
        MVO     R0,     G_0181                  ; 5E27   0240 0181
L_5E29:
        CLRR    R2                              ; 5E29   01D2
        MVI     G_017D, R0                      ; 5E2A   0280 017D
        SARC    R0,     1                       ; 5E2C   0078
        BC      L_5E38                          ; 5E2D   0201 0009

        MVI     G_017C, R0                      ; 5E2F   0280 017C
        SARC    R0,     1                       ; 5E31   0078
        BC      L_5E38                          ; 5E32   0201 0004

        MVII    #$0001, R3                      ; 5E34   02BB 0001
        B       L_5E46                          ; 5E36   0200 000E

L_5E38:
        MVI     G_017D, R0                      ; 5E38   0280 017D
        SARC    R0,     2                       ; 5E3A   007C
        BOV     L_5E64                          ; 5E3B   0202 0027

        MVI     G_017C, R0                      ; 5E3D   0280 017C
        SARC    R0,     2                       ; 5E3F   007C
        BOV     L_5E64                          ; 5E40   0202 0022

        MVII    #$0002, R3                      ; 5E42   02BB 0002
        ADDI    #$0008, R2                      ; 5E44   02FA 0008
L_5E46:
        ADDI    #$032D, R2                      ; 5E46   02FA 032D
        SDBD                                    ; 5E48   0001
        MVII    #$5AFB, R1                      ; 5E49   02B9 00FB 005A

        JSR     R5,     X_INIT_MOB              ; 5E4C   0004 0114 02B2
        DECLE   $03C3,  $017C,  $0243,  $017C   ; 5E4F   03C3 017C 0243 017C
        DECLE   $0280,  $031F,  $0040,  $02F8   ; 5E53   0280 031F 0040 02F8
        DECLE   $0004,  $0040,  $02FA,  $0002   ; 5E57   0004 0040 02FA 0002
        DECLE   $0250,  $02FA,  $0003,  $0280   ; 5E5B   0250 02FA 0003 0280
        DECLE   $0322,  $0250,  $0004,  $0160   ; 5E5F   0322 0250 0004 0160
        DECLE   $0234                           ; 5E63   0234
L_5E64:
        PULR    R7                              ; 5E64   02B7

L_5E65:
        PSHR    R5                              ; 5E65   0275
        MVI     G_017C, R2                      ; 5E66   0282 017C
        SDBD                                    ; 5E68   0001
        MVII    #$5EC5, R3                      ; 5E69   02BB 00C5 005E
        CLRR    R4                              ; 5E6C   01E4
        MVI     G_017D, R0                      ; 5E6D   0280 017D
        SARC    R0,     1                       ; 5E6F   0078
        BC      L_5E99                          ; 5E70   0201 0027

        TSTR    R2                              ; 5E72   0092
        BEQ     L_5EC5                          ; 5E73   0204 0050

        SARC    R2,     1                       ; 5E75   007A
        BNC     L_5EA3                          ; 5E76   0209 002B

        MVI     G_0331, R0                      ; 5E78   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 5E7A   0004 0114 0357

        TSTR    R1                              ; 5E7D   0089
        BPL     L_5E89                          ; 5E7E   0203 0009

        ADDI    #$000A, R1                      ; 5E80   02F9 000A

        JSR     R5,     X_PACK_BYTES            ; 5E82   0004 0114 034F

        MVO     R0,     G_0331                  ; 5E85   0240 0331
        B       L_5E99                          ; 5E87   0200 0010

L_5E89:
        SDBD                                    ; 5E89   0001
        MVII    #$5E99, R3                      ; 5E8A   02BB 0099 005E
        MVI     G_0332, R0                      ; 5E8D   0280 0332
        TSTR    R0                              ; 5E8F   0080
        BEQ     L_5EC8                          ; 5E90   0204 0036

        CMPI    #$0010, R0                      ; 5E92   0378 0010
        BPL     L_5E99                          ; 5E94   0203 0003

        DECR    R0                              ; 5E96   0010
        MVO     R0,     G_0332                  ; 5E97   0240 0332
L_5E99:
        CLRR    R4                              ; 5E99   01E4
        SDBD                                    ; 5E9A   0001
        MVII    #$5EC5, R3                      ; 5E9B   02BB 00C5 005E
        MVI     G_017C, R2                      ; 5E9E   0282 017C
        SARC    R2,     2                       ; 5EA0   007E
        BNOV    L_5EC5                          ; 5EA1   020A 0022

L_5EA3:
        MVI     G_017D, R0                      ; 5EA3   0280 017D
        SARC    R0,     2                       ; 5EA5   007C
        BOV     L_5EC5                          ; 5EA6   0202 001D

        MVI     G_0339, R0                      ; 5EA8   0280 0339

        JSR     R5,     X_UNPK_BYTES            ; 5EAA   0004 0114 0357

        TSTR    R1                              ; 5EAD   0089
        BEQ     L_5EB9                          ; 5EAE   0204 0009

        ADDI    #$000A, R1                      ; 5EB0   02F9 000A

        JSR     R5,     X_PACK_BYTES            ; 5EB2   0004 0114 034F

        MVO     R0,     G_0339                  ; 5EB5   0240 0339
        B       L_5EC5                          ; 5EB7   0200 000C

L_5EB9:
        MVI     G_033A, R0                      ; 5EB9   0280 033A
        TSTR    R0                              ; 5EBB   0080
        BEQ     L_5EC6                          ; 5EBC   0204 0008

        CMPI    #$0010, R0                      ; 5EBE   0378 0010
        BPL     L_5EC5                          ; 5EC0   0203 0003

        DECR    R0                              ; 5EC2   0010
        MVO     R0,     G_033A                  ; 5EC3   0240 033A
L_5EC5:
        PULR    R7                              ; 5EC5   02B7

L_5EC6:
        ADDI    #$0008, R4                      ; 5EC6   02FC 0008
L_5EC8:
        ADDI    #$032D, R4                      ; 5EC8   02FC 032D
        PSHR    R3                              ; 5ECA   0273
        PSHR    R4                              ; 5ECB   0274

        JSR     R5,     L_5FA6                  ; 5ECC   0004 015C 03A6

        PULR    R4                              ; 5ECF   02B4
        SDBD                                    ; 5ED0   0001
        MVII    #$5046, R0                      ; 5ED1   02B8 0046 0050
        MVO@    R0,     R4                      ; 5ED4   0260
        SDBD                                    ; 5ED5   0001
        MVII    #$5EE3, R0                      ; 5ED6   02B8 00E3 005E
        MVO@    R0,     R4                      ; 5ED9   0260
        ADDI    #$0003, R4                      ; 5EDA   02FC 0003
        MVII    #$03F0, R0                      ; 5EDC   02B8 03F0
        MVO@    R0,     R4                      ; 5EDE   0260
        MVII    #$000A, R0                      ; 5EDF   02B8 000A
        MVO@    R0,     R4                      ; 5EE1   0260
        PULR    R7                              ; 5EE2   02B7
        B       L_5EE5                          ; 5EE3   0200 0000

L_5EE5:
        ADDR    R5,     R2                      ; 5EE5   00EA
        DECLE   $005E,  $0006,  $0021,  $0000   ; 5EE6   005E 0006 0021 0000

        PSHR    R5                              ; 5EEA   0275
        DECR    R0                              ; 5EEB   0010
        XOR     G_017C, R0                      ; 5EEC   03C0 017C
        MVO     R0,     G_017C                  ; 5EEE   0240 017C

        JSR     R5,     .EXEC.7AE               ; 5EF0   0004 0114 03AE

        PULR    R7                              ; 5EF3   02B7

        PSHR    R5                              ; 5EF4   0275
        DECR    R0                              ; 5EF5   0010
        BMI     L_5F3A                          ; 5EF6   020B 0042

        MVI     G_017C, R0                      ; 5EF8   0280 017C
        SARC    R0,     1                       ; 5EFA   0078
        BC      L_5F08                          ; 5EFB   0201 000B

        MVI     G_017D, R0                      ; 5EFD   0280 017D
        SARC    R0,     1                       ; 5EFF   0078
        BC      L_5F08                          ; 5F00   0201 0006

        MVII    #$032D, R2                      ; 5F02   02BA 032D
        MVII    #$0001, R0                      ; 5F04   02B8 0001
        B       L_5F16                          ; 5F06   0200 000E

L_5F08:
        MVI     G_017C, R0                      ; 5F08   0280 017C
        SARC    R0,     2                       ; 5F0A   007C
        BOV     L_5F3A                          ; 5F0B   0202 002D

        MVI     G_017D, R0                      ; 5F0D   0280 017D
        SARC    R0,     2                       ; 5F0F   007C
        BOV     L_5F3A                          ; 5F10   0202 0028

        MVII    #$0335, R2                      ; 5F12   02BA 0335
        MVII    #$0002, R0                      ; 5F14   02B8 0002
L_5F16:
        XOR     G_017D, R0                      ; 5F16   03C0 017D
        MVO     R0,     G_017D                  ; 5F18   0240 017D
        SDBD                                    ; 5F1A   0001
        MVII    #$5B0B, R1                      ; 5F1B   02B9 000B 005B

        JSR     R5,     X_INIT_MOB              ; 5F1E   0004 0114 02B2
        DECLE   $0280,  $031F,  $0040,  $02F8   ; 5F21   0280 031F 0040 02F8
        DECLE   $0004,  $0040,  $02FA,  $0002   ; 5F25   0004 0040 02FA 0002
        DECLE   $0250,  $0280,  $0320,  $0040   ; 5F29   0250 0280 0320 0040
        DECLE   $0338,  $0008,  $0040,  $000A   ; 5F2D   0338 0008 0040 000A
        DECLE   $0250,  $0280,  $0322,  $02FA   ; 5F31   0250 0280 0322 02FA
        DECLE   $0004,  $0250,  $0004,  $0160   ; 5F35   0004 0250 0004 0160
        DECLE   $0255                           ; 5F39   0255
L_5F3A:
        PULR    R7                              ; 5F3A   02B7

        PSHR    R5                              ; 5F3B   0275
        MVI     G_0181, R2                      ; 5F3C   0282 0181
        CMPI    #$0028, R2                      ; 5F3E   037A 0028
        BNEQ    L_5F7D                          ; 5F40   020C 003B

        MOVR    R1,     R2                      ; 5F42   008A
        ADDI    #$0007, R2                      ; 5F43   02FA 0007
        MVI@    R2,     R2                      ; 5F45   0292
        CMP     G_0342, R2                      ; 5F46   0342 0342
        BNEQ    L_5F7D                          ; 5F48   020C 0033

        JSR     R5,     L_5F9C                  ; 5F4A   0004 015C 039C

        SDBD                                    ; 5F4D   0001
        MVII    #$608E, R4                      ; 5F4E   02BC 008E 0060

        JSR     R5,     L_6011                  ; 5F51   0004 0160 0011
        DECLE   $02BA,  $033D,  $0242,  $017B   ; 5F54   02BA 033D 0242 017B
        DECLE   $0004,  $0160,  $0304,  $0063   ; 5F58   0004 0160 0304 0063

        ADDR    R0,     R2                      ; 5F5C   00C2
        RRC     R0,     1                       ; 5F5D   0070
        SARC    R2,     2                       ; 5F5E   007E
        SLLC    R3,     2                       ; 5F5F   005F
        ADDR    R6,     R0                      ; 5F60   00F0
        DIS                                     ; 5F61   0003
        INCR    R7                              ; 5F62   000F

        DECLE   $0000                           ; 5F63   0000
L_5F64:
        MVII    #$0005, R0                      ; 5F64   02B8 0005

        JSR     R5,     .EXEC.6D5               ; 5F66   0004 0114 02D5

        MVII    #$0345, R1                      ; 5F69   02B9 0345

        JSR     R5,     .EXEC.7AE               ; 5F6B   0004 0114 03AE

        MVI     G_0341, R0                      ; 5F6E   0280 0341

        JSR     R5,     X_UNPK_BYTES            ; 5F70   0004 0114 0357

        SAR     R0,     1                       ; 5F73   0068
        SAR     R1,     1                       ; 5F74   0069

        JSR     R5,     X_PACK_BYTES            ; 5F75   0004 0114 034F

        MVO     R0,     G_0341                  ; 5F78   0240 0341

        JSR     R5,     L_6210                  ; 5F7A   0004 0160 0210

L_5F7D:
        PULR    R7                              ; 5F7D   02B7

        DECLE   $0100,  $0000,  $0085,  $005F   ; 5F7E   0100 0000 0085 005F
        DECLE   $0006,  $0021,  $0000           ; 5F82   0006 0021 0000

        PSHR    R5                              ; 5F85   0275
        MVII    #$033D, R1                      ; 5F86   02B9 033D

        JSR     R5,     .EXEC.7AE               ; 5F88   0004 0114 03AE

        CLRR    R0                              ; 5F8B   01C0
        MVO     R0,     G_017B                  ; 5F8C   0240 017B
        MVII    #$0006, R0                      ; 5F8E   02B8 0006

        JSR     R5,     X_RAND2                 ; 5F90   0004 0114 029E

        MVO     R0,     G_0181                  ; 5F93   0240 0181
        TSTR    R0                              ; 5F95   0080
        BEQ     L_5F9B                          ; 5F96   0204 0003

        JSR     R5,     L_5C04                  ; 5F98   0004 015C 0004

L_5F9B:
        PULR    R7                              ; 5F9B   02B7

L_5F9C:
        PSHR    R5                              ; 5F9C   0275
        DECR    R0                              ; 5F9D   0010
        XOR     G_017D, R0                      ; 5F9E   03C0 017D
        MVO     R0,     G_017D                  ; 5FA0   0240 017D

        JSR     R5,     .EXEC.7AE               ; 5FA2   0004 0114 03AE

        PULR    R7                              ; 5FA5   02B7

L_5FA6:
        PSHR    R5                              ; 5FA6   0275
        PSHR    R4                              ; 5FA7   0274
        PSHR    R3                              ; 5FA8   0273
        PSHR    R2                              ; 5FA9   0272

        JSR     R5,     L_6210                  ; 5FAA   0004 0160 0210

        PULR    R2                              ; 5FAD   02B2
        PULR    R3                              ; 5FAE   02B3
        PULR    R4                              ; 5FAF   02B4
        PULR    R5                              ; 5FB0   02B5
        ADDI    #$0002, R4                      ; 5FB1   02FC 0002
        MVI@    R4,     R1                      ; 5FB3   02A1
        MVI@    R4,     R0                      ; 5FB4   02A0
        SWAP    R1,     1                       ; 5FB5   0041
        ANDI    #$00FF, R1                      ; 5FB6   03B9 00FF
        SUBI    #$0005, R1                      ; 5FB8   0339 0005
        SLR     R1,     2                       ; 5FBA   0065
        SLR     R1,     1                       ; 5FBB   0061
        NOP                                     ; 5FBC   0034
        SWAP    R0,     1                       ; 5FBD   0040
        ANDI    #$00FF, R0                      ; 5FBE   03B8 00FF
        SUBI    #$0005, R0                      ; 5FC0   0338 0005
        SLR     R0,     2                       ; 5FC2   0064
        SLR     R0,     1                       ; 5FC3   0060
L_5FC4:
        ADDI    #$0014, R1                      ; 5FC4   02F9 0014
        DECR    R0                              ; 5FC6   0010
        BNEQ    L_5FC4                          ; 5FC7   022C 0004

        ADDI    #$0200, R1                      ; 5FC9   02F9 0200
        MVI@    R1,     R0                      ; 5FCB   0288
        SLR     R0,     2                       ; 5FCC   0064
        SLR     R0,     1                       ; 5FCD   0060
        ANDI    #$013F, R0                      ; 5FCE   03B8 013F
        XORI    #$0100, R0                      ; 5FD0   03F8 0100
        CMPI    #$002C, R0                      ; 5FD2   0378 002C
        BMI     L_5FF8                          ; 5FD4   020B 0022

        SUBI    #$002C, R0                      ; 5FD6   0338 002C
        BEQ     L_5FF8                          ; 5FD8   0204 001E

        MVII    #$031D, R1                      ; 5FDA   02B9 031D
        MVI     G_0322, R0                      ; 5FDC   0280 0322
        DECR    R0                              ; 5FDE   0010
        BLE     L_5FF2                          ; 5FDF   0206 0011

        MVI     G_0174, R0                      ; 5FE1   0280 0174
        SWAP    R0,     1                       ; 5FE3   0040
        ADD     G_0175, R0                      ; 5FE4   02C0 0175
        SUBI    #$03E8, R0                      ; 5FE6   0338 03E8
        BPL     L_5FEB                          ; 5FE8   0203 0001

        CLRR    R0                              ; 5FEA   01C0
L_5FEB:
        MVO     R0,     G_0175                  ; 5FEB   0240 0175
        SWAP    R0,     1                       ; 5FED   0040
        MVO     R0,     G_0174                  ; 5FEE   0240 0174
        B       L_6080                          ; 5FF0   0200 008E

L_5FF2:
        PULR    R4                              ; 5FF2   02B4
        PULR    R4                              ; 5FF3   02B4
        PULR    R5                              ; 5FF4   02B5
        J       L_5D22                          ; 5FF5   0004 035C 0122

L_5FF8:
        SUBI    #$001A, R0                      ; 5FF8   0338 001A
        BMI     L_6080                          ; 5FFA   020B 0084

        CMPI    #$0005, R0                      ; 5FFC   0378 0005
        BNEQ    L_600C                          ; 5FFE   020C 000C

        MVI     G_0173, R4                      ; 6000   0284 0173
        TSTR    R4                              ; 6002   00A4
        BNEQ    L_600A                          ; 6003   020C 0005

        INCR    R4                              ; 6005   000C
        MVO     R4,     G_0173                  ; 6006   0244 0173
        B       L_600C                          ; 6008   0200 0002

L_600A:
        ADDI    #$000D, R0                      ; 600A   02F8 000D
L_600C:
        SDBD                                    ; 600C   0001
        MVII    #$6081, R4                      ; 600D   02BC 0081 0060
        ADDR    R0,     R4                      ; 6010   00C4
L_6011:
        MVI     G_0174, R3                      ; 6011   0283 0174
        SWAP    R3,     1                       ; 6013   0043
        ADD     G_0175, R3                      ; 6014   02C3 0175
        ADD@    R4,     R3                      ; 6016   02E3
        SDBD                                    ; 6017   0001
        MVII    #$2710, R4                      ; 6018   02BC 0010 0027
        CMPR    R4,     R3                      ; 601B   0163
        BMI     L_6059                          ; 601C   020B 003B

        SUBR    R4,     R3                      ; 601E   0123
        MVI     G_0176, R0                      ; 601F   0280 0176
        SWAP    R0,     1                       ; 6021   0040
        ADD     G_0177, R0                      ; 6022   02C0 0177
        INCR    R0                              ; 6024   0008
        CMPR    R4,     R0                      ; 6025   0160
        BMI     L_6030                          ; 6026   020B 0008

        CLRR    R0                              ; 6028   01C0
        CLRR    R3                              ; 6029   01DB
        MVO     R0,     G_0176                  ; 602A   0240 0176
        MVO     R0,     G_0177                  ; 602C   0240 0177
        B       L_6059                          ; 602E   0200 0029

L_6030:
        MVO     R0,     G_0177                  ; 6030   0240 0177
        DECLE   $0040,  $0240,  $0176,  $0280   ; 6032   0040 0240 0176 0280
        DECLE   $0177,  $0040,  $0078,  $0229   ; 6036   0177 0040 0078 0229
        DECLE   $0002,  $0080,  $020C,  $001B   ; 603A   0002 0080 020C 001B
        DECLE   $0284,  $016F,  $000C,  $0244   ; 603E   0284 016F 000C 0244
        DECLE   $016F,  $0270,  $0275,  $0004   ; 6042   016F 0270 0275 0004
        DECLE   $0160,  $02B3                   ; 6046   0160 02B3

        PULR    R5                              ; 6048   02B5
        PULR    R0                              ; 6049   02B0
        MVI     G_0103, R0                      ; 604A   0280 0103
        CMPI    #$0003, R0                      ; 604C   0378 0003
        BEQ     L_6059                          ; 604E   0204 0009

        MVI     G_0177, R4                      ; 6050   0284 0177
        CMPI    #$0004, R4                      ; 6052   037C 0004
        BMI     L_6059                          ; 6054   020B 0003

        DECR    R0                              ; 6056   0010
        MVO     R0,     G_0103                  ; 6057   0240 0103
L_6059:
        MVO     R3,     G_0175                  ; 6059   0243 0175
        SWAP    R3,     1                       ; 605B   0043
        MVO     R3,     G_0174                  ; 605C   0243 0174
        SDBD                                    ; 605E   0001
        MVII    #$270F, R0                      ; 605F   02B8 000F 0027
        MVI     G_0178, R3                      ; 6062   0283 0178
        SWAP    R3,     1                       ; 6064   0043
        ADD     G_0179, R3                      ; 6065   02C3 0179
        INCR    R3                              ; 6067   000B
        CMPR    R3,     R0                      ; 6068   0158
        BPL     L_6071                          ; 6069   0203 0006

        MVI     G_017A, R3                      ; 606B   0283 017A
        INCR    R3                              ; 606D   000B
        MVO     R3,     G_017A                  ; 606E   0243 017A
        CLRR    R3                              ; 6070   01DB
L_6071:
        MVO     R3,     G_0179                  ; 6071   0243 0179
        SWAP    R3,     1                       ; 6073   0043
        MVO     R3,     G_0178                  ; 6074   0243 0178
        TSTR    R1                              ; 6076   0089
        BEQ     L_6080                          ; 6077   0204 0007

        MVI@    R1,     R3                      ; 6079   028B
        ANDI    #$01F0, R3                      ; 607A   03BB 01F0
        XOR@    R1,     R3                      ; 607C   03CB
        ADDI    #$0010, R3                      ; 607D   02FB 0010
        MVO@    R3,     R1                      ; 607F   024B
L_6080:
        MOVR    R5,     R7                      ; 6080   00AF

        DECR    R4                              ; 6081   0014
        SUBR    R5,     R4                      ; 6082   012C
        SLR     R0,     2                       ; 6083   0064
        INCR    R2                              ; 6084   000A
        MOVR    R2,     R6                      ; 6085   0096
        MOVR    R2,     R6                      ; 6086   0096
        GSWD    R2                              ; 6087   0032
        RLC     R0,     1                       ; 6088   0050
        ADDR    R1,     R0                      ; 6089   00C8
        ADDR    R1,     R0                      ; 608A   00C8
        ADDR    R1,     R0                      ; 608B   00C8
        SLR     R0,     2                       ; 608C   0064
        SLR     R0,     2                       ; 608D   0064
        XORR    R6,     R4                      ; 608E   01F4
        XORR    R6,     R4                      ; 608F   01F4
        XORR    R6,     R4                      ; 6090   01F4
        XORR    R6,     R4                      ; 6091   01F4
        MOVR    R2,     R6                      ; 6092   0096
        MVI@    R1,     R2                      ; 6093   028A
L_6094:
        PSHR    R5                              ; 6094   0275
        MVI     G_0183, R0                      ; 6095   0280 0183
        TSTR    R0                              ; 6097   0080
        BEQ     L_609F                          ; 6098   0204 0005

        DECR    R0                              ; 609A   0010
        MVO     R0,     G_0183                  ; 609B   0240 0183
        B       L_6154                          ; 609D   0200 00B5

L_609F:
        MVI     G_031D, R0                      ; 609F   0280 031D
        MVI     G_0325, R1                      ; 60A1   0281 0325
        ANDI    #$0017, R0                      ; 60A3   03B8 0017
        ANDI    #$0017, R1                      ; 60A5   03B9 0017
        XOR     G_031D, R0                      ; 60A7   03C0 031D
        XOR     G_0325, R1                      ; 60A9   03C1 0325
        MVI     G_016E, R2                      ; 60AB   0282 016E
        TSTR    R2                              ; 60AD   0092
        BEQ     L_60B4                          ; 60AE   0204 0004

        XORI    #$0013, R0                      ; 60B0   03F8 0013
        XORI    #$0013, R1                      ; 60B2   03F9 0013
L_60B4:
        MVO     R0,     G_031D                  ; 60B4   0240 031D
        MVO     R1,     G_0325                  ; 60B6   0241 0325
        MVI     G_0181, R2                      ; 60B8   0282 0181
        TSTR    R2                              ; 60BA   0092
        BNEQ    L_6154                          ; 60BB   020C 0097

        MVII    #$033D, R2                      ; 60BD   02BA 033D
        MVII    #$017E, R4                      ; 60BF   02BC 017E
        MVI@    R4,     R1                      ; 60C1   02A1
        TSTR    R1                              ; 60C2   0089
        BEQ     L_60D1                          ; 60C3   0204 000C

        MVII    #$0345, R2                      ; 60C5   02BA 0345
        MVI@    R4,     R1                      ; 60C7   02A1
        TSTR    R1                              ; 60C8   0089
        BEQ     L_60D1                          ; 60C9   0204 0006

        MVII    #$034D, R2                      ; 60CB   02BA 034D
        MVI@    R4,     R1                      ; 60CD   02A1
        TSTR    R1                              ; 60CE   0089
        BNEQ    L_6154                          ; 60CF   020C 0083

L_60D1:
        DECR    R4                              ; 60D1   0014
        MVO@    R2,     R4                      ; 60D2   0262
        MVII    #$0200, R4                      ; 60D3   02BC 0200
        MVII    #$0050, R3                      ; 60D5   02BB 0050
L_60D7:
        MVI@    R4,     R0                      ; 60D7   02A0
        ANDI    #$01F8, R0                      ; 60D8   03B8 01F8
        CMPI    #$0100, R0                      ; 60DA   0378 0100
        BPL     L_60EB                          ; 60DC   0203 000D

        DECR    R3                              ; 60DE   0013
        BNEQ    L_60D7                          ; 60DF   022C 0009

        SUBI    #$033D, R2                      ; 60E1   033A 033D
        SLR     R2,     2                       ; 60E3   0066
        SLR     R2,     1                       ; 60E4   0062
        ADDI    #$017E, R2                      ; 60E5   02FA 017E
        CLRR    R0                              ; 60E7   01C0
        MVO@    R0,     R2                      ; 60E8   0250
        B       L_6154                          ; 60E9   0200 0069

L_60EB:
        CMPI    #$0158, R0                      ; 60EB   0378 0158
        DECLE   $0223,  $0010,  $0004,  $0160   ; 60ED   0223 0010 0004 0160
        DECLE   $027B                           ; 60F1   027B

        SUBI    #$0200, R4                      ; 60F2   033C 0200
        CLRR    R0                              ; 60F4   01C0
        MOVR    R4,     R3                      ; 60F5   00A3
L_60F6:
        ADDI    #$0008, R0                      ; 60F6   02F8 0008
        CMPI    #$0014, R3                      ; 60F8   037B 0014
        BMI     L_6100                          ; 60FA   020B 0004

        SUBI    #$0014, R3                      ; 60FC   033B 0014
        B       L_60F6                          ; 60FE   0220 0009

L_6100:
        ADDI    #$0006, R0                      ; 6100   02F8 0006
        SLL     R3,     2                       ; 6102   004F
        SLL     R3,     1                       ; 6103   004B
        PSHR    R0                              ; 6104   0270
        SDBD                                    ; 6105   0001
        MVII    #$61A5, R1                      ; 6106   02B9 00A5 0061
        MVI     G_016E, R0                      ; 6109   0280 016E
        TSTR    R0                              ; 610B   0080
        BEQ     L_6112                          ; 610C   0204 0004

        SDBD                                    ; 610E   0001
        MVII    #$5B3B, R1                      ; 610F   02B9 003B 005B

L_6112:
        JSR     R5,     X_INIT_MOB              ; 6112   0004 0114 02B2

        PULR    R0                              ; 6115   02B0
        SWAP    R0,     1                       ; 6116   0040
        SWAP    R3,     1                       ; 6117   0043
        MOVR    R2,     R4                      ; 6118   0094
        ADDI    #$0002, R4                      ; 6119   02FC 0002
        MVO@    R3,     R4                      ; 611B   0263
        MVO@    R0,     R4                      ; 611C   0260
        MVII    #$0004, R0                      ; 611D   02B8 0004

        JSR     R5,     X_RAND1                 ; 611F   0004 0114 027D

        SUBI    #$0004, R0                      ; 6122   0338 0004
        MOVR    R2,     R1                      ; 6124   0091
        MVI     G_031F, R2                      ; 6125   0282 031F
        SWAP    R2,     1                       ; 6127   0042
        ANDI    #$00FF, R2                      ; 6128   03BA 00FF
        ADDR    R0,     R2                      ; 612A   00C2
        SWAP    R2,     1                       ; 612B   0042
        XORI    #$0048, R2                      ; 612C   03FA 0048
        MVI     G_0182, R3                      ; 612E   0283 0182

        JSR     R5,     .EXEC.9A1               ; 6130   0004 0118 01A1

        MOVR    R1,     R3                      ; 6133   008B
        ADDI    #$0006, R3                      ; 6134   02FB 0006
        MVI@    R3,     R2                      ; 6136   029A
        ADDI    #$0005, R2                      ; 6137   02FA 0005
        MVO@    R2,     R3                      ; 6139   025A
        MVI     G_0322, R1                      ; 613A   0281 0322
        TSTR    R1                              ; 613C   0089
        BEQ     L_6154                          ; 613D   0204 0015

        SDBD                                    ; 613F   0001
        MVII    #$6155, R4                      ; 6140   02BC 0055 0061
        MVI     G_016D, R0                      ; 6143   0280 016D
        SLL     R0,     2                       ; 6145   004C
        SLL     R0,     1                       ; 6146   0048
        XORR    R1,     R0                      ; 6147   01C8
        MVII    #$0037, R1                      ; 6148   02B9 0037
        CMPR    R0,     R1                      ; 614A   0141
        BPL     L_614E                          ; 614B   0203 0001

        MOVR    R1,     R0                      ; 614D   0088
L_614E:
        ADDR    R0,     R4                      ; 614E   00C4
        MVI@    R4,     R0                      ; 614F   02A0
        SLL     R0,     2                       ; 6150   004C
        SLL     R0,     2                       ; 6151   004C
        DECR    R3                              ; 6152   0013
        MVO@    R0,     R3                      ; 6153   0258
L_6154:
        PULR    R7                              ; 6154   02B7

        DECLE   $0000,  $0004,  $0007,  $000A   ; 6155   0000 0004 0007 000A
        DECLE   $000D,  $0011,  $0015,  $0019   ; 6159   000D 0011 0015 0019
        DECLE   $0000,  $0008,  $000C,  $0010   ; 615D   0000 0008 000C 0010
        DECLE   $0014,  $0018,  $001C,  $001F   ; 6161   0014 0018 001C 001F
        DECLE   $0000                           ; 6165   0000

        INCR    R1                              ; 6166   0009
        INCR    R6                              ; 6167   000E
        DECR    R3                              ; 6168   0013
L_6169:
        DECR    R7                              ; 6169   0017

        DECLE   $001C,  $0020,  $0024,  $0000   ; 616A   001C 0020 0024 0000

        INCR    R2                              ; 616E   000A
        INCR    R7                              ; 616F   000F

        DECR    R4                              ; 6170   0014
L_6171:
        COMR    R1                              ; 6171   0019
        DECLE   $001E,  $0023,  $0029,  $0000   ; 6172   001E 0023 0029 0000
        DECLE   $000C,  $0011,  $0016,  $001C   ; 6176   000C 0011 0016 001C
        DECLE   $0022,  $0029,  $002F,  $0000   ; 617A   0022 0029 002F 0000
L_617E:
        DECR    R7                              ; 617E   0017

        DECLE   $0021,  $002B,  $0030,  $0035   ; 617F   0021 002B 0030 0035
        DECLE   $003A,  $003F,  $0000,  $003F   ; 6183   003A 003F 0000 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6187   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $0000,  $003F   ; 618B   003F 003F 0000 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 618F   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $0000,  $003F   ; 6193   003F 003F 0000 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6197   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $0000,  $003F   ; 619B   003F 003F 0000 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 619F   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $0040,  $0018   ; 61A3   003F 003F 0040 0018
        DECLE   $00B5,  $0061,  $0000,  $0050   ; 61A7   00B5 0061 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0100,  $0000   ; 61B3   0000 0000 0100 0000
        DECLE   $00C0,  $0061,  $0008,  $002D   ; 61B7   00C0 0061 0008 002D
        DECLE   $0004,  $0022,  $005D,  $0022   ; 61BB   0004 0022 005D 0022
        DECLE   $015D,  $0275,  $008A,  $0004   ; 61BF   015D 0275 008A 0004
        DECLE   $0160,  $0304,  $0063,  $00D0   ; 61C3   0160 0304 0063 00D0
        DECLE   $0030,  $00D2,  $0061,  $00F0   ; 61C7   0030 00D2 0061 00F0
        DECLE   $0003,  $0010,  $0000,  $0004   ; 61CB   0003 0010 0000 0004
        DECLE   $0160,  $02D8,  $02B7,  $02D9   ; 61CF   0160 02D8 02B7 02D9
        DECLE   $0061,  $00D9,  $0061,  $0003   ; 61D3   0061 00D9 0061 0003
        DECLE   $0027,  $0000                   ; 61D7   0027 0000

        PSHR    R5                              ; 61D9   0275
        MVII    #$017E, R3                      ; 61DA   02BB 017E
        SUBI    #$0004, R0                      ; 61DC   0338 0004
        ADDR    R0,     R3                      ; 61DE   00C3
        CLRR    R0                              ; 61DF   01C0
        MVO@    R0,     R3                      ; 61E0   0258

        JSR     R5,     .EXEC.7AE               ; 61E1   0004 0114 03AE

        PULR    R7                              ; 61E4   02B7

L_61E5:
        PSHR    R5                              ; 61E5   0275
        MVII    #$017E, R4                      ; 61E6   02BC 017E
        MVII    #$0003, R3                      ; 61E8   02BB 0003
L_61EA:
        MVI@    R4,     R2                      ; 61EA   02A2
        TSTR    R2                              ; 61EB   0092
        BEQ     L_620C                          ; 61EC   0204 001E

        MOVR    R3,     R2                      ; 61EE   009A
        NEGR    R2                              ; 61EF   0022
        ADDI    #$0003, R2                      ; 61F0   02FA 0003
        SLL     R2,     2                       ; 61F2   004E
        SLL     R2,     1                       ; 61F3   004A
        ADDI    #$0342, R2                      ; 61F4   02FA 0342
        MVI@    R2,     R0                      ; 61F6   0290
        MOVR    R0,     R1                      ; 61F7   0081
        ANDI    #$000F, R0                      ; 61F8   03B8 000F
        XORR    R0,     R1                      ; 61FA   01C1
        BEQ     L_620C                          ; 61FB   0204 000F

        CMP     G_0322, R0                      ; 61FD   0340 0322
        BMI     L_620C                          ; 61FF   020B 000B

        MOVR    R2,     R1                      ; 6201   0091
        SUBI    #$0005, R1                      ; 6202   0339 0005
        MVI@    R1,     R1                      ; 6204   0289
        ANDI    #$0017, R1                      ; 6205   03B9 0017
        CMPI    #$0010, R1                      ; 6207   0379 0010
        BEQ     L_620C                          ; 6209   0204 0001

        MVO@    R0,     R2                      ; 620B   0250
L_620C:
        DECR    R3                              ; 620C   0013
        BNEQ    L_61EA                          ; 620D   022C 0024
        PULR    R7                              ; 620F   02B7

L_6210:
        PSHR    R5                              ; 6210   0275

        JSR     R5,     X_PLAY_SFX2             ; 6211   0004 0118 03BE
        DECLE   $0016                           ; 6214  SFX prio
        DECLE   $002F                           ; 6215  SFX data
        DECLE   $00F9                           ; 6216  SFX data
        DECLE   $0008,  $0000                   ; 6217  SFX data
        DECLE   $0004,  $0000                   ; 6219  SFX data
        DECLE   $03ED                           ; 621B  SFX data
        DECLE   $03E5                           ; 621C  SFX data
        DECLE   $03D5                           ; 621D  SFX data
        DECLE   $02EB                           ; 621E  SFX data
        DECLE   $01CF                           ; 621F  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6220   0004 0118 03BE
        DECLE   $0014                           ; 6223  SFX prio
        DECLE   $00F9                           ; 6224  SFX data
        DECLE   $03FA                           ; 6225  SFX data
        DECLE   $03F6                           ; 6226  SFX data
        DECLE   $008F,  $0040                   ; 6227  SFX data
        DECLE   $01CF                           ; 6229  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 622A   0004 0118 03BE
        DECLE   $0002                           ; 622D  SFX prio
        DECLE   $005D                           ; 622E  SFX data
        DECLE   $0025                           ; 622F  SFX data
        DECLE   $0015                           ; 6230  SFX data
        DECLE   $03E9                           ; 6231  SFX data
        DECLE   $03E3,  $03FA                   ; 6232  SFX data
        DECLE   $0275                           ; 6234  SFX data
        DECLE   $0004,  $0118                   ; 6235  SFX data
        DECLE   $03BE                           ; 6237  SFX data
        DECLE   $0014,  $002F                   ; 6238  SFX data
        DECLE   $03D9                           ; 623A  SFX data
        DECLE   $0288,  $0010                   ; 623B  SFX data
        DECLE   $0041,  $000E                   ; 623D  SFX data
        DECLE   $001A                           ; 623F  SFX data
        DECLE   $008F,  $0036                   ; 6240  SFX data
        DECLE   $03FA                           ; 6242  SFX data
        DECLE   $0041,  $001A                   ; 6243  SFX data
        DECLE   $008F,  $0018                   ; 6245  SFX data
        DECLE   $0051,  $0012                   ; 6247  SFX data
        DECLE   $008F,  $0063                   ; 6249  SFX data
        DECLE   $01CF                           ; 624B  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 624C   0004 0118 03BE
        DECLE   $0002                           ; 624F  SFX prio
        DECLE   $005D                           ; 6250  SFX data
        DECLE   $0025                           ; 6251  SFX data
        DECLE   $03E9                           ; 6252  SFX data
        DECLE   $03E3,  $03FA                   ; 6253  SFX data
        DECLE   $0275                           ; 6255  SFX data
        DECLE   $0004,  $0118                   ; 6256  SFX data
        DECLE   $03BE                           ; 6258  SFX data
        DECLE   $0014,  $002F                   ; 6259  SFX data
        DECLE   $00F9                           ; 625B  SFX data
        DECLE   $03ED                           ; 625C  SFX data
        DECLE   $03A5                           ; 625D  SFX data
        DECLE   $0395                           ; 625E  SFX data
        DECLE   $006B                           ; 625F  SFX data
        DECLE   $020D                           ; 6260  SFX data
        DECLE   $000C,  $03E8                   ; 6261  SFX data
        DECLE   $000B                           ; 6263  SFX data
        DECLE   $0337                           ; 6264  SFX data
        DECLE   $01AB                           ; 6265  SFX data
        DECLE   $03ED                           ; 6266  SFX data
        DECLE   $03A5                           ; 6267  SFX data
        DECLE   $0395                           ; 6268  SFX data
        DECLE   $006B                           ; 6269  SFX data
        DECLE   $020D                           ; 626A  SFX data
        DECLE   $000C,  $03E8                   ; 626B  SFX data
        DECLE   $000B                           ; 626D  SFX data
        DECLE   $0337                           ; 626E  SFX data
        DECLE   $01AB                           ; 626F  SFX data
        DECLE   $01CF                           ; 6270  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6271   0004 0118 03BE
        DECLE   $0002                           ; 6274  SFX prio
        DECLE   $005D                           ; 6275  SFX data
        DECLE   $0025                           ; 6276  SFX data
        DECLE   $0015                           ; 6277  SFX data
        DECLE   $03E9                           ; 6278  SFX data
        DECLE   $03E3,  $03FA                   ; 6279  SFX data
        DECLE   $0275                           ; 627B  SFX data
        DECLE   $0004,  $0114                   ; 627C  SFX data
        DECLE   $03C1,  $0004                   ; 627E  SFX data
        DECLE   $0118,  $03BE                   ; 6280  SFX data
        DECLE   $0012                           ; 6282  SFX data
        DECLE   $002F                           ; 6283  SFX data
        DECLE   $00F9                           ; 6284  SFX data
        DECLE   $03CD                           ; 6285  SFX data
        DECLE   $0325                           ; 6286  SFX data
        DECLE   $0315                           ; 6287  SFX data
        DECLE   $012B                           ; 6288  SFX data
        DECLE   $03DA                           ; 6289  SFX data
        DECLE   $03D6                           ; 628A  SFX data
        DECLE   $008F,  $0011                   ; 628B  SFX data
        DECLE   $01CF                           ; 628D  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 628E   0004 0118 03BE
        DECLE   $0002                           ; 6291  SFX prio
        DECLE   $005D                           ; 6292  SFX data
        DECLE   $0015                           ; 6293  SFX data
        DECLE   $0025                           ; 6294  SFX data
        DECLE   $03E9                           ; 6295  SFX data
        DECLE   $03E3,  $03FA                   ; 6296  SFX data
        DECLE   $0275                           ; 6298  SFX data
        DECLE   $0004,  $0118                   ; 6299  SFX data
        DECLE   $03BE                           ; 629B  SFX data
        DECLE   $0010,  $0399                   ; 629C  SFX data
        DECLE   $0348,  $0046                   ; 629E  SFX data
        DECLE   $0344,  $0037                   ; 62A0  SFX data
        DECLE   $0051,  $0002                   ; 62A2  SFX data
        DECLE   $0051,  $0001                   ; 62A4  SFX data
        DECLE   $008F,  $0013                   ; 62A6  SFX data
        DECLE   $01CF                           ; 62A8  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 62A9   0004 0118 03BE
        DECLE   $0002                           ; 62AC  SFX prio
        DECLE   $005D                           ; 62AD  SFX data
        DECLE   $0025                           ; 62AE  SFX data
        DECLE   $0015                           ; 62AF  SFX data
        DECLE   $03E9                           ; 62B0  SFX data
        DECLE   $03E3,  $03FA                   ; 62B1  SFX data
        DECLE   $0275                           ; 62B3  SFX data
        DECLE   $0004,  $0114                   ; 62B4  SFX data
        DECLE   $03C1,  $0004                   ; 62B6  SFX data
        DECLE   $0118,  $03BE                   ; 62B8  SFX data
        DECLE   $0018,  $002F                   ; 62BA  SFX data
        DECLE   $0399                           ; 62BC  SFX data
        DECLE   $0348,  $0010                   ; 62BD  SFX data
        DECLE   $0344,  $005F                   ; 62BF  SFX data
        DECLE   $0081,  $0002                   ; 62C1  SFX data
        DECLE   $0051,  $0001                   ; 62C3  SFX data
        DECLE   $008F,  $0045                   ; 62C5  SFX data
        DECLE   $01CF                           ; 62C7  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 62C8   0004 0118 03BE
        DECLE   $0002                           ; 62CB  SFX prio
        DECLE   $0025                           ; 62CC  SFX data
        DECLE   $0015                           ; 62CD  SFX data
        DECLE   $005D                           ; 62CE  SFX data
        DECLE   $03E9                           ; 62CF  SFX data
        DECLE   $03E3,  $03FA                   ; 62D0  SFX data
        DECLE   $0275                           ; 62D2  SFX data
        DECLE   $02B9                           ; 62D3  SFX data
        DECLE   $0001,  $0241                   ; 62D4  SFX data
        DECLE   $019A                           ; 62D6  SFX data
        DECLE   $02B7                           ; 62D7  SFX data
        DECLE   $0275                           ; 62D8  SFX data
        DECLE   $0004,  $0118                   ; 62D9  SFX data
        DECLE   $03BE                           ; 62DB  SFX data
        DECLE   $000E                           ; 62DC  SFX data
        DECLE   $002F                           ; 62DD  SFX data
        DECLE   $00F9                           ; 62DE  SFX data
        DECLE   $0008,  $0000                   ; 62DF  SFX data
        DECLE   $0004,  $0000                   ; 62E1  SFX data
        DECLE   $03ED                           ; 62E3  SFX data
        DECLE   $0325                           ; 62E4  SFX data
        DECLE   $0315                           ; 62E5  SFX data
        DECLE   $02EB                           ; 62E6  SFX data
        DECLE   $01CF                           ; 62E7  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 62E8   0004 0118 03BE
        DECLE   $000E                           ; 62EB  SFX prio
        DECLE   $00F9                           ; 62EC  SFX data
        DECLE   $03EA                           ; 62ED  SFX data
        DECLE   $03E6                           ; 62EE  SFX data
        DECLE   $008F,  $001D                   ; 62EF  SFX data
        DECLE   $01CF                           ; 62F1  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 62F2   0004 0118 03BE
        DECLE   $0002                           ; 62F5  SFX prio
        DECLE   $005D                           ; 62F6  SFX data
        DECLE   $0025                           ; 62F7  SFX data
        DECLE   $0015                           ; 62F8  SFX data
        DECLE   $03E9                           ; 62F9  SFX data
        DECLE   $03E3,  $03FA                   ; 62FA  SFX data
        DECLE   $0275                           ; 62FC  SFX data
        DECLE   $02B8,  $0008                   ; 62FD  SFX data
        DECLE   $0091,  $0004                   ; 62FF  SFX data
        DECLE   $0114,  $0330                   ; 6301  SFX data
        DECLE   $02B5                           ; 6303  SFX data
        DECLE   $02A9                           ; 6304  SFX data
        DECLE   $0079                           ; 6305  SFX data
        DECLE   $0201,  $0002                   ; 6306  SFX data
        DECLE   $0204,  $0008                   ; 6308  SFX data
        DECLE   $0209                           ; 630A  SFX data
        DECLE   $0003,  $0001                   ; 630B  SFX data
        DECLE   $02A8,  $0250                   ; 630D  SFX data
        DECLE   $000A                           ; 630F  SFX data
        DECLE   $0220,  $000C                   ; 6310  SFX data
        DECLE   $00AF                           ; 6312  Unknown
        DECLE   $0275                           ; 6313  SFX data
        DECLE   $02BC,  $0185                   ; 6314  SFX data
        DECLE   $02A0,  $0040                   ; 6316  SFX data
        DECLE   $006C,  $006C                   ; 6318  SFX data
        DECLE   $0068,  $00A3                   ; 631A  SFX data
        DECLE   $0001,  $02E0                   ; 631C  SFX data
        DECLE   $0258,  $0040                   ; 631E  SFX data
        DECLE   $0082                           ; 6320  SFX data
        DECLE   $000B                           ; 6321  SFX data
        DECLE   $0318,  $0091                   ; 6322  SFX data
        DECLE   $03B9                           ; 6324  SFX data
        DECLE   $0007                           ; 6325  SFX data
        DECLE   $0259                           ; 6326  SFX data
        DECLE   $01CA                           ; 6327  SFX data
        DECLE   $02BD                           ; 6328  SFX data
        DECLE   $018B                           ; 6329  SFX data
        DECLE   $026A                           ; 632A  SFX data
        DECLE   $0102                           ; 632B  SFX data
        DECLE   $000D                           ; 632C  SFX data
        DECLE   $026A                           ; 632D  SFX data
        DECLE   $02BB                           ; 632E  SFX data
        DECLE   $0003,  $026B                   ; 632F  SFX data
        DECLE   $02BD                           ; 6331  SFX data
        DECLE   $0100,  $02A8                   ; 6332  SFX data
        DECLE   $0260,  $02A8                   ; 6334  SFX data
        DECLE   $0260,  $02B8                   ; 6336  SFX data
        DECLE   $004B                           ; 6338  SFX data
        DECLE   $02B9                           ; 6339  SFX data
        DECLE   $0063,  $0240                   ; 633A  SFX data
        DECLE   $0100,  $0241                   ; 633C  SFX data
        DECLE   $0101,  $0002                   ; 633E  SFX data
        DECLE   $0282                           ; 6340  SFX data
        DECLE   $018E                           ; 6341  SFX data
        DECLE   $007E                           ; 6342  SFX data
        DECLE   $0221,  $0005                   ; 6343  SFX data
        DECLE   $020A                           ; 6345  SFX data
        DECLE   $0003,  $0004                   ; 6346  SFX data
        DECLE   $0150,  $019E                   ; 6348  SFX data
        DECLE   $02B7                           ; 634A  SFX data
        DECLE   $0275                           ; 634B  SFX data
        DECLE   $02BA                           ; 634C  SFX data
        DECLE   $031D                           ; 634D  SFX data
        DECLE   $02BB                           ; 634E  SFX data
        DECLE   $0008,  $02BD                   ; 634F  SFX data
        DECLE   $018A                           ; 6351  SFX data
        DECLE   $0290,  $0048                   ; 6352  SFX data
        DECLE   $020B                           ; 6354  SFX data
        DECLE   $0002                           ; 6355  SFX data
        DECLE   $02BD                           ; 6356  SFX data
        DECLE   $018C,  $02FA                   ; 6357  SFX data
        DECLE   $0003,  $0290                   ; 6359  SFX data
        DECLE   $0001,  $02E8                   ; 635B  SFX data
        DECLE   $0250,  $0298                   ; 635D  SFX data
        DECLE   $0081,  $03B9                   ; 635F  SFX data
        DECLE   $007F                           ; 6361  Unknown
        DECLE   $01C8,  $0015                   ; 6362  SFX data
        DECLE   $02E9                           ; 6364  SFX data
        DECLE   $03B9                           ; 6365  SFX data
        DECLE   $007F                           ; 6366  Unknown
        DECLE   $01C8,  $0258                   ; 6367  SFX data
        DECLE   $02FA                           ; 6369  SFX data
        DECLE   $0005                           ; 636A  SFX data
        DECLE   $000B                           ; 636B  SFX data
        DECLE   $037B                           ; 636C  SFX data
        DECLE   $0010,  $022C                   ; 636D  SFX data
        DECLE   $001F                           ; 636F  Unknown
        DECLE   $0280,  $0187                   ; 6370  SFX data
        DECLE   $0240,  $0031                   ; 6372  SFX data
        DECLE   $0240,  $0020                   ; 6374  SFX data
        DECLE   $0280,  $0188                   ; 6376  SFX data
        DECLE   $0281,  $0189                   ; 6378  SFX data
        DECLE   $0240,  $0100                   ; 637A  SFX data
        DECLE   $0241,  $0101                   ; 637C  SFX data
        DECLE   $01D2                           ; 637E  SFX data
        DECLE   $0280,  $018B                   ; 637F  SFX data
        DECLE   $0044,  $0204                   ; 6381  SFX data
        DECLE   $0047                           ; 6383  SFX data
        DECLE   $02BD                           ; 6384  SFX data
        DECLE   $02DC,  $02BC                   ; 6385  SFX data
        DECLE   $0214,  $02BA                   ; 6387  SFX data
        DECLE   $0200,  $02B9                   ; 6389  SFX data
        DECLE   $0014,  $02B8                   ; 638B  SFX data
        DECLE   $000A                           ; 638D  SFX data
        DECLE   $0270,  $02BB                   ; 638E  SFX data
        DECLE   $0004,  $02A0                   ; 6390  SFX data
        DECLE   $0268,  $02A0                   ; 6392  SFX data
        DECLE   $0268,  $02A0                   ; 6394  SFX data
        DECLE   $0268,  $02A0                   ; 6396  SFX data
        DECLE   $0268,  $02A0                   ; 6398  SFX data
        DECLE   $0268,  $0013                   ; 639A  SFX data
        DECLE   $022C,  $000C                   ; 639C  SFX data
        DECLE   $010C,  $010D                   ; 639E  SFX data
        DECLE   $01D5                           ; 63A0  SFX data
        DECLE   $01EA                           ; 63A1  SFX data
        DECLE   $01D5                           ; 63A2  SFX data
        DECLE   $02BB                           ; 63A3  SFX data
        DECLE   $0004,  $02A8                   ; 63A4  SFX data
        DECLE   $0260,  $02A8                   ; 63A6  SFX data
        DECLE   $0260,  $02A8                   ; 63A8  SFX data
        DECLE   $0260,  $02A8                   ; 63AA  SFX data
        DECLE   $0260,  $02A8                   ; 63AC  SFX data
        DECLE   $0260,  $0013                   ; 63AE  SFX data
        DECLE   $022C,  $000C                   ; 63B0  SFX data
        DECLE   $010D                           ; 63B2  SFX data
        DECLE   $02B0,  $0010                   ; 63B3  SFX data
        DECLE   $022C,  $0028                   ; 63B5  SFX data
        DECLE   $01D5                           ; 63B7  SFX data
        DECLE   $01EA                           ; 63B8  SFX data
        DECLE   $01D5                           ; 63B9  SFX data
        DECLE   $02BB                           ; 63BA  SFX data
        DECLE   $0004,  $02A8                   ; 63BB  SFX data
        DECLE   $0260,  $02A8                   ; 63BD  SFX data
        DECLE   $0260,  $02A8                   ; 63BF  SFX data
        DECLE   $0260,  $02A8                   ; 63C1  SFX data
        DECLE   $0260,  $02A8                   ; 63C3  SFX data
        DECLE   $0260,  $0013                   ; 63C5  SFX data
        DECLE   $022C,  $000C                   ; 63C7  SFX data
        DECLE   $02B8,  $0002                   ; 63C9  SFX data
        DECLE   $004E                           ; 63CB  SFX data
        DECLE   $01C2                           ; 63CC  SFX data
        DECLE   $0242                           ; 63CD  SFX data
        DECLE   $018E                           ; 63CE  SFX data
        DECLE   $0004,  $0118                   ; 63CF  SFX data
        DECLE   $02BD                           ; 63D1  SFX data
        DECLE   $02B7                           ; 63D2  SFX data
        DECLE   $0000,  $0000                   ; 63D3  SFX data
        DECLE   $0000,  $0000                   ; 63D5  SFX data
        DECLE   $0000,  $0000                   ; 63D7  SFX data
        DECLE   $0000,  $0000                   ; 63D9  SFX data
        DECLE   $0001,  $0021                   ; 63DB  SFX data
        DECLE   $0021,  $0021                   ; 63DD  SFX data
        DECLE   $0021,  $0021                   ; 63DF  SFX data
        DECLE   $0021,  $0021                   ; 63E1  SFX data
        DECLE   $0007                           ; 63E3  SFX data
        DECLE   $0241,  $0061                   ; 63E4  SFX data
        DECLE   $0000,  $00D2                   ; 63E6  SFX data
        DECLE   $0020,  $0000                   ; 63E8  SFX data
        DECLE   $0007                           ; 63EA  SFX data
        DECLE   $0005                           ; 63EB  SFX data
        DECLE   $00A1,  $02CA                   ; 63EC  SFX data
        DECLE   $0032                           ; 63EE  SFX data
        DECLE   $0140,  $0009                   ; 63EF  SFX data
        DECLE   $0000,  $0000                   ; 63F1  SFX data
        DECLE   $0000,  $0000                   ; 63F3  SFX data
        DECLE   $000C,  $0000                   ; 63F5  SFX data
        DECLE   $01B4,  $002D                   ; 63F7  SFX data
        DECLE   $0281,  $0041                   ; 63F9  SFX data
        DECLE   $0011,  $0000                   ; 63FB  SFX data
        DECLE   $0000,  $0034                   ; 63FD  SFX data
        DECLE   $0200,  $0002                   ; 63FF  SFX data
        DECLE   $0021,  $0290                   ; 6401  SFX data
        DECLE   $0001,  $0120                   ; 6403  SFX data
        DECLE   $0000,  $0260                   ; 6405  SFX data
        DECLE   $0000,  $000A                   ; 6407  SFX data
        DECLE   $0000,  $0000                   ; 6409  SFX data
        DECLE   $0000,  $0000                   ; 640B  SFX data
        DECLE   $0321,  $0000                   ; 640D  SFX data
        DECLE   $0007                           ; 640F  SFX data
        DECLE   $0020,  $0000                   ; 6410  SFX data
        DECLE   $0007                           ; 6412  SFX data
        DECLE   $0010,  $0000                   ; 6413  SFX data
        DECLE   $0000,  $02E0                   ; 6415  SFX data
        DECLE   $0000,  $0001                   ; 6417  SFX data
        DECLE   $0200,  $0000                   ; 6419  SFX data
        DECLE   $0000,  $0000                   ; 641B  SFX data
        DECLE   $000D                           ; 641D  SFX data
        DECLE   $0000,  $000D                   ; 641E  SFX data
        DECLE   $0020,  $0000                   ; 6420  SFX data
        DECLE   $0321,  $0001                   ; 6422  SFX data
        DECLE   $0021,  $0249                   ; 6424  SFX data
        DECLE   $0021,  $0260                   ; 6426  SFX data
        DECLE   $0001,  $002A                   ; 6428  SFX data
        DECLE   $0000,  $0000                   ; 642A  SFX data
        DECLE   $0000,  $0321                   ; 642C  SFX data
        DECLE   $000D                           ; 642E  SFX data
        DECLE   $0281,  $002C                   ; 642F  SFX data
        DECLE   $0021,  $0061                   ; 6431  SFX data
        DECLE   $0001,  $0030                   ; 6433  SFX data
        DECLE   $0000,  $0021                   ; 6435  SFX data
        DECLE   $002F                           ; 6437  SFX data
        DECLE   $0001,  $0021                   ; 6438  SFX data
        DECLE   $0030,  $0006                   ; 643A  SFX data
        DECLE   $0021,  $0021                   ; 643C  SFX data
        DECLE   $0007                           ; 643E  SFX data
        DECLE   $0023,  $0020                   ; 643F  SFX data
        DECLE   $0008,  $0021                   ; 6441  SFX data
        DECLE   $0011,  $0000                   ; 6443  SFX data
        DECLE   $02A1,  $02E0                   ; 6445  SFX data
        DECLE   $0015                           ; 6447  SFX data
        DECLE   $002B                           ; 6448  SFX data
        DECLE   $0000,  $02A1                   ; 6449  SFX data
        DECLE   $0001,  $0120                   ; 644B  SFX data
        DECLE   $000D                           ; 644D  SFX data
        DECLE   $0260,  $0000                   ; 644E  SFX data
        DECLE   $0321,  $0200                   ; 6450  SFX data
        DECLE   $0008,  $0010                   ; 6452  SFX data
        DECLE   $0000,  $00E1                   ; 6454  SFX data
        DECLE   $02E0,  $0000                   ; 6456  SFX data
        DECLE   $00EB                           ; 6458  SFX data
        DECLE   $0000,  $01B4                   ; 6459  SFX data
        DECLE   $0001,  $0260                   ; 645B  SFX data
        DECLE   $000C,  $0033                   ; 645D  SFX data
        DECLE   $03FF                           ; 645F  Unknown
        DECLE   $02A1,  $0260                   ; 6460  SFX data
        DECLE   $0007                           ; 6462  SFX data
        DECLE   $0006                           ; 6463  SFX data
        DECLE   $0021,  $0061                   ; 6464  SFX data
        DECLE   $0015                           ; 6466  SFX data
        DECLE   $0061,  $002D                   ; 6467  SFX data
        DECLE   $0021,  $0023                   ; 6469  SFX data
        DECLE   $0001,  $0021                   ; 646B  SFX data
        DECLE   $004A                           ; 646D  SFX data
        DECLE   $0025                           ; 646E  SFX data
        DECLE   $0037                           ; 646F  SFX data
        DECLE   $0001,  $0021                   ; 6470  SFX data
        DECLE   $0030,  $000F                   ; 6472  SFX data
        DECLE   $0000,  $000D                   ; 6474  SFX data
        DECLE   $0034,  $0314                   ; 6476  SFX data
        DECLE   $0021,  $0081                   ; 6478  SFX data
        DECLE   $0021,  $0001                   ; 647A  SFX data
        DECLE   $0081,  $0081                   ; 647C  SFX data
        DECLE   $0029                           ; 647E  SFX data
        DECLE   $00F2                           ; 647F  SFX data
        DECLE   $002A                           ; 6480  SFX data
        DECLE   $0000,  $0007                   ; 6481  SFX data
        DECLE   $0001,  $0022                   ; 6483  SFX data
        DECLE   $0041,  $0022                   ; 6485  SFX data
        DECLE   $0022                           ; 6487  SFX data
        DECLE   $0021,  $0022                   ; 6488  SFX data
        DECLE   $0022                           ; 648A  SFX data
        DECLE   $0003,  $0021                   ; 648B  SFX data
        DECLE   $0061,  $0023                   ; 648D  SFX data
        DECLE   $0063,  $0063                   ; 648F  SFX data
        DECLE   $0063,  $0023                   ; 6491  SFX data
        DECLE   $0001,  $0084                   ; 6493  SFX data
        DECLE   $0084,  $0081                   ; 6495  SFX data
        DECLE   $0084,  $0084                   ; 6497  SFX data
        DECLE   $0024,  $0084                   ; 6499  SFX data
        DECLE   $0005                           ; 649B  SFX data
        DECLE   $00A5                           ; 649C  SFX data
        DECLE   $00A5                           ; 649D  SFX data
        DECLE   $00A5                           ; 649E  SFX data
        DECLE   $00A5                           ; 649F  SFX data
        DECLE   $00A5                           ; 64A0  SFX data
        DECLE   $00A5                           ; 64A1  SFX data
        DECLE   $00A5                           ; 64A2  SFX data
        DECLE   $0003,  $0044                   ; 64A3  SFX data
        DECLE   $0041,  $0061                   ; 64A5  SFX data
        DECLE   $0021,  $0064                   ; 64A7  SFX data
        DECLE   $00A3,  $0085                   ; 64A9  SFX data
        DECLE   $0001,  $0043                   ; 64AB  SFX data
        DECLE   $0085                           ; 64AD  SFX data
        DECLE   $0064,  $0045                   ; 64AE  SFX data
        DECLE   $0022                           ; 64B0  SFX data
        DECLE   $0081,  $00A3                   ; 64B1  SFX data
        DECLE   $0001,  $0341                   ; 64B3  SFX data
        DECLE   $03A1,  $003A                   ; 64B5  SFX data
        DECLE   $003D                           ; 64B7  SFX data
        DECLE   $0021,  $0341                   ; 64B8  SFX data
        DECLE   $03A1,  $0001                   ; 64BA  SFX data
        DECLE   $0361,  $03A1                   ; 64BC  SFX data
        DECLE   $003C,  $003D                   ; 64BE  SFX data
        DECLE   $0021,  $0381                   ; 64C0  SFX data
        DECLE   $03A1,  $0001                   ; 64C2  SFX data
        DECLE   $0381,  $03A1                   ; 64C4  SFX data
        DECLE   $003C,  $003D                   ; 64C6  SFX data
        DECLE   $0021,  $0381                   ; 64C8  SFX data
        DECLE   $03A1,  $0001                   ; 64CA  SFX data
        DECLE   $0341,  $03A1                   ; 64CC  SFX data
        DECLE   $003A                           ; 64CE  SFX data
        DECLE   $003E                           ; 64CF  SFX data
        DECLE   $0021,  $0341                   ; 64D0  SFX data
        DECLE   $03A1,  $0000                   ; 64D2  SFX data
        DECLE   $0000,  $0000                   ; 64D4  SFX data
        DECLE   $0000,  $0000                   ; 64D6  SFX data
        DECLE   $0000,  $0000                   ; 64D8  SFX data
        DECLE   $0000,  $0000                   ; 64DA  SFX data
        DECLE   $0000,  $0080                   ; 64DC  SFX data
        DECLE   $0114,  $0040                   ; 64DE  SFX data
        DECLE   $00D5                           ; 64E0  SFX data
        DECLE   $0000,  $0000                   ; 64E1  SFX data
        DECLE   $0080,  $00B4                   ; 64E3  SFX data
        DECLE   $01A0,  $02DA                   ; 64E5  SFX data
        DECLE   $0165                           ; 64E7  SFX data
        DECLE   $0356                           ; 64E8  SFX data
        DECLE   $02D7,  $02DA                   ; 64E9  SFX data
        DECLE   $0000,  $0000                   ; 64EB  SFX data
        DECLE   $0000,  $0000                   ; 64ED  SFX data
        DECLE   $0008,  $0289                   ; 64EF  SFX data
        DECLE   $000C,  $030B                   ; 64F1  SFX data
        DECLE   $0116                           ; 64F3  SFX data
        DECLE   $02F2                           ; 64F4  SFX data
        DECLE   $01F7                           ; 64F5  Unknown
        DECLE   $02F7                           ; 64F6  Unknown
        DECLE   $0197,  $02ED                   ; 64F7  SFX data
        DECLE   $0377,  $0370,  $0158           ; 64F9  SFX data
        DECLE   $030B                           ; 64FC  SFX data
        DECLE   $0238,  $0318                   ; 64FD  SFX data
        DECLE   $01F7                           ; 64FF  Unknown
        DECLE   $0317,  $00D8                   ; 6500  SFX data
        DECLE   $02F2                           ; 6502  SFX data
        DECLE   $035B                           ; 6503  SFX data
        DECLE   $0370,  $015A                   ; 6504  SFX data
        DECLE   $030B                           ; 6506  SFX data
        DECLE   $023B                           ; 6507  SFX data
        DECLE   $0316                           ; 6508  SFX data
        DECLE   $019A                           ; 6509  SFX data
        DECLE   $030D                           ; 650A  SFX data
        DECLE   $0278,  $0347                   ; 650B  SFX data
        DECLE   $0358,  $01A8                   ; 650D  SFX data
        DECLE   $035A                           ; 650F  SFX data
        DECLE   $0166                           ; 6510  SFX data
        DECLE   $027A                           ; 6511  SFX data
        DECLE   $0369                           ; 6512  SFX data
        DECLE   $02FF                           ; 6513  Unknown
        DECLE   $02FA                           ; 6514  SFX data
        DECLE   $031C,  $0318                   ; 6515  SFX data
        DECLE   $031F                           ; 6517  Unknown
        DECLE   $0318,  $031F                   ; 6518  SFX data
        DECLE   $031A                           ; 651A  SFX data
        DECLE   $031C,  $0317                   ; 651B  SFX data
        DECLE   $02FD                           ; 651D  SFX data
        DECLE   $031A                           ; 651E  SFX data
        DECLE   $031E                           ; 651F  SFX data
        DECLE   $02F8,  $02FF                   ; 6520  SFX data
        DECLE   $02F8,  $031C                   ; 6522  SFX data
        DECLE   $031A                           ; 6524  SFX data
        DECLE   $031C,  $037A                   ; 6525  SFX data
        DECLE   $035C,  $031A                   ; 6527  SFX data
        DECLE   $031F                           ; 6529  Unknown
        DECLE   $031A                           ; 652A  SFX data
        DECLE   $011A                           ; 652B  SFX data
        DECLE   $02CD                           ; 652C  SFX data
        DECLE   $01F7                           ; 652D  Unknown
        DECLE   $036E                           ; 652E  SFX data
        DECLE   $00D8,  $036B                   ; 652F  SFX data
        DECLE   $0013,  $0352                   ; 6531  SFX data
        DECLE   $007B                           ; 6533  SFX data
        DECLE   $0347                           ; 6534  SFX data
        DECLE   $0013,  $01A0                   ; 6535  SFX data
        DECLE   $0013,  $0160                   ; 6537  SFX data
        DECLE   $00B7                           ; 6539  SFX data
        DECLE   $02E9                           ; 653A  SFX data
        DECLE   $0276                           ; 653B  SFX data
        DECLE   $02C7                           ; 653C  SFX data
        DECLE   $0357,  $01A8                   ; 653D  SFX data
        DECLE   $02FA                           ; 653F  SFX data
        DECLE   $0166                           ; 6540  SFX data
        DECLE   $007B                           ; 6541  SFX data
        DECLE   $0364,  $011A                   ; 6542  SFX data
        DECLE   $02ED                           ; 6544  SFX data
        DECLE   $023A                           ; 6545  SFX data
        DECLE   $036E                           ; 6546  SFX data
        DECLE   $00D7,  $0327                   ; 6547  SFX data
        DECLE   $0013,  $02E4                   ; 6549  SFX data
        DECLE   $012A                           ; 654B  SFX data
        DECLE   $0318,  $00EC                   ; 654C  SFX data
        DECLE   $0358,  $00B8                   ; 654E  SFX data
        DECLE   $030D                           ; 6550  SFX data
        DECLE   $0318,  $030E                   ; 6551  SFX data
        DECLE   $02D7,  $0376                   ; 6553  SFX data
        DECLE   $02B6                           ; 6555  SFX data
        DECLE   $02F6                           ; 6556  SFX data
        DECLE   $0003,  $014D                   ; 6557  SFX data
        DECLE   $0000,  $00C7                   ; 6559  SFX data
        DECLE   $0013,  $034D                   ; 655B  SFX data
        DECLE   $0003,  $02A7                   ; 655D  SFX data
        DECLE   $0000,  $0000                   ; 655F  SFX data
        DECLE   $0000,  $0000                   ; 6561  SFX data
        DECLE   $02B8,  $0335                   ; 6563  SFX data
        DECLE   $0013,  $0240                   ; 6565  SFX data
        DECLE   $00B9                           ; 6567  SFX data
        DECLE   $0329                           ; 6568  SFX data
        DECLE   $033B                           ; 6569  SFX data
        DECLE   $030E                           ; 656A  SFX data
        DECLE   $000A                           ; 656B  SFX data
        DECLE   $02E2                           ; 656C  SFX data
        DECLE   $0006                           ; 656D  SFX data
        DECLE   $0240,  $0005                   ; 656E  SFX data
        DECLE   $02E4,  $0297                   ; 6570  SFX data
        DECLE   $0357,  $027F                   ; 6572  SFX data
        DECLE   $0347                           ; 6574  SFX data
        DECLE   $035D                           ; 6575  SFX data
        DECLE   $0248,  $035E                   ; 6576  SFX data
        DECLE   $0246                           ; 6578  SFX data
        DECLE   $027E                           ; 6579  SFX data
        DECLE   $0349                           ; 657A  SFX data
        DECLE   $015C,  $02CB                   ; 657B  SFX data
        DECLE   $019F                           ; 657D  Unknown
        DECLE   $02ED                           ; 657E  SFX data
        DECLE   $015C,  $02CB                   ; 657F  SFX data
        DECLE   $019F                           ; 6581  Unknown
        DECLE   $02ED                           ; 6582  SFX data
        DECLE   $015C,  $030B                   ; 6583  SFX data
        DECLE   $023D                           ; 6585  SFX data
        DECLE   $0358,  $019E                   ; 6586  SFX data
        DECLE   $0302                           ; 6588  SFX data
        DECLE   $027C,  $0369                   ; 6589  SFX data
        DECLE   $027C,  $0347                   ; 658B  SFX data
        DECLE   $015C,  $01A0                   ; 658D  SFX data
        DECLE   $019C,  $0160                   ; 658F  SFX data
        DECLE   $027F                           ; 6591  Unknown
        DECLE   $0369                           ; 6592  SFX data
        DECLE   $00BF                           ; 6593  Unknown
        DECLE   $036D                           ; 6594  SFX data
        DECLE   $027F                           ; 6595  Unknown
        DECLE   $02C7                           ; 6596  SFX data
        DECLE   $027F                           ; 6597  Unknown
        DECLE   $0240,  $027F                   ; 6598  SFX data
        DECLE   $02E9                           ; 659A  SFX data
        DECLE   $015C,  $0307                   ; 659B  SFX data
        DECLE   $019C,  $01A0                   ; 659D  SFX data
        DECLE   $015D                           ; 659F  SFX data
        DECLE   $0160,  $00DC                   ; 65A0  SFX data
        DECLE   $0304,  $027C                   ; 65A2  SFX data
        DECLE   $0367                           ; 65A4  SFX data
        DECLE   $015C,  $01A0                   ; 65A5  SFX data
        DECLE   $019C,  $0160                   ; 65A7  SFX data
        DECLE   $033C,  $0334                   ; 65A9  SFX data
        DECLE   $033C,  $0335                   ; 65AB  SFX data
        DECLE   $027C,  $01A0                   ; 65AD  SFX data
        DECLE   $015F                           ; 65AF  Unknown
        DECLE   $0160,  $019F                   ; 65B0  SFX data
        DECLE   $0329                           ; 65B2  SFX data
        DECLE   $0005                           ; 65B3  SFX data
        DECLE   $0000,  $012A                   ; 65B4  SFX data
        DECLE   $0128,  $00EC                   ; 65B6  SFX data
        DECLE   $0166                           ; 65B8  SFX data
        DECLE   $00B8,  $0309                   ; 65B9  SFX data
        DECLE   $0158,  $030B                   ; 65BB  SFX data
        DECLE   $019A                           ; 65BD  SFX data
        DECLE   $030D                           ; 65BE  SFX data
        DECLE   $0278,  $0067                   ; 65BF  SFX data
        DECLE   $0062                           ; 65C1  SFX data
        DECLE   $0000,  $0000                   ; 65C2  SFX data
        DECLE   $0000,  $0080                   ; 65C4  SFX data
        DECLE   $00B4,  $0314                   ; 65C6  SFX data
        DECLE   $031A                           ; 65C8  SFX data
        DECLE   $0318,  $0317                   ; 65C9  SFX data
        DECLE   $0359                           ; 65CB  SFX data
        DECLE   $0379                           ; 65CC  SFX data
        DECLE   $033B                           ; 65CD  SFX data
        DECLE   $0335                           ; 65CE  SFX data
        DECLE   $014D                           ; 65CF  SFX data
        DECLE   $0040,  $00C7                   ; 65D0  SFX data
        DECLE   $0000,  $03E0                   ; 65D2  SFX data
        DECLE   $0000,  $0000                   ; 65D4  SFX data
        DECLE   $0020,  $0000                   ; 65D6  SFX data
        DECLE   $006E                           ; 65D8  SFX data
        DECLE   $0164,  $00AF                   ; 65D9  SFX data
        DECLE   $0187                           ; 65DB  SFX data
        DECLE   $01B1,  $0002                   ; 65DC  SFX data
        DECLE   $0200,  $0001                   ; 65DE  SFX data
        DECLE   $0002                           ; 65E0  SFX data
        DECLE   $0200,  $0000                   ; 65E1  SFX data
        DECLE   $0385                           ; 65E3  SFX data
        DECLE   $01CB                           ; 65E4  SFX data
        DECLE   $01EC,  $034A                   ; 65E5  SFX data
        DECLE   $010A                           ; 65E7  SFX data
        DECLE   $03E0,  $0001                   ; 65E8  SFX data
        DECLE   $001E                           ; 65EA  SFX data
        DECLE   $03E0,  $0002                   ; 65EB  SFX data
        DECLE   $0201,  $0003                   ; 65ED  SFX data
        DECLE   $0316                           ; 65EF  SFX data
        DECLE   $02F9                           ; 65F0  SFX data
        DECLE   $0314,  $02FA                   ; 65F1  SFX data
        DECLE   $0128,  $03E0                   ; 65F3  SFX data
        DECLE   $001C,  $00B3                   ; 65F5  SFX data
        DECLE   $03E0,  $0020                   ; 65F7  SFX data
        DECLE   $0000,  $0064                   ; 65F9  SFX data
        DECLE   $00ED                           ; 65FB  SFX data
        DECLE   $01D1,  $0000                   ; 65FC  SFX data
        DECLE   $004A                           ; 65FE  SFX data
        DECLE   $015B                           ; 65FF  SFX data
        DECLE   $02BD                           ; 6600  SFX data
        DECLE   $001E                           ; 6601  SFX data
        DECLE   $0379                           ; 6602  SFX data
        DECLE   $0316                           ; 6603  SFX data
        DECLE   $02B5                           ; 6604  SFX data
        DECLE   $0299                           ; 6605  SFX data
        DECLE   $0316                           ; 6606  SFX data
        DECLE   $02F5                           ; 6607  SFX data
        DECLE   $03A0,  $0001                   ; 6608  SFX data
        DECLE   $001E                           ; 660A  SFX data
        DECLE   $03E0,  $0073                   ; 660B  SFX data
        DECLE   $0200,  $0000                   ; 660D  SFX data
        DECLE   $001E                           ; 660F  SFX data
        DECLE   $0376                           ; 6610  SFX data
        DECLE   $02B4,  $02F6                   ; 6611  SFX data
        DECLE   $00E6                           ; 6613  SFX data
        DECLE   $01B1,  $0020                   ; 6614  SFX data
        DECLE   $0002                           ; 6616  SFX data
        DECLE   $0200,  $001C                   ; 6617  SFX data
        DECLE   $02B5                           ; 6619  SFX data
        DECLE   $02D7,  $035F                   ; 661A  SFX data
        DECLE   $0000,  $001E                   ; 661C  SFX data
        DECLE   $03E0,  $0003                   ; 661E  SFX data
        DECLE   $0164,  $00C7                   ; 6620  SFX data
        DECLE   $00A4,  $03A0                   ; 6622  SFX data
        DECLE   $0000,  $0000                   ; 6624  SFX data
        DECLE   $0002                           ; 6626  SFX data
        DECLE   $014A                           ; 6627  SFX data
        DECLE   $0128,  $036C                   ; 6628  SFX data
        DECLE   $03A0,  $001E                   ; 662A  SFX data
        DECLE   $0200,  $006B                   ; 662C  SFX data
        DECLE   $026A                           ; 662E  SFX data
        DECLE   $0148,  $0149                   ; 662F  SFX data
        DECLE   $0149                           ; 6631  SFX data
        DECLE   $024D                           ; 6632  SFX data
        DECLE   $01D3,  $024D                   ; 6633  SFX data
        DECLE   $0220,  $006E                   ; 6635  SFX data
        DECLE   $01E5                           ; 6637  SFX data
        DECLE   $016E                           ; 6638  SFX data
        DECLE   $01E7                           ; 6639  SFX data
        DECLE   $018D                           ; 663A  SFX data
        DECLE   $0272                           ; 663B  SFX data
        DECLE   $01AB                           ; 663C  SFX data
        DECLE   $0085                           ; 663D  SFX data
        DECLE   $0220,  $0002                   ; 663E  SFX data
        DECLE   $03E0,  $0000                   ; 6640  SFX data
        DECLE   $0000,  $0000                   ; 6642  SFX data
        DECLE   $0000,  $0000                   ; 6644  SFX data
        DECLE   $0000,  $0000                   ; 6646  SFX data
        DECLE   $0000,  $0000                   ; 6648  SFX data
        DECLE   $0000,  $0000                   ; 664A  SFX data
        DECLE   $0000,  $0000                   ; 664C  SFX data
        DECLE   $0000,  $0000                   ; 664E  SFX data
        DECLE   $0000,  $0000                   ; 6650  SFX data
        DECLE   $0000,  $0000                   ; 6652  SFX data
        DECLE   $0000,  $0000                   ; 6654  SFX data
        DECLE   $0000,  $0000                   ; 6656  SFX data
        DECLE   $0000,  $0000                   ; 6658  SFX data
        DECLE   $0000,  $0000                   ; 665A  SFX data
        DECLE   $0000,  $0000                   ; 665C  SFX data
        DECLE   $0000,  $0000                   ; 665E  SFX data
        DECLE   $0000,  $0000                   ; 6660  SFX data
        DECLE   $0000,  $0000                   ; 6662  SFX data
        DECLE   $0000,  $0000                   ; 6664  SFX data
        DECLE   $0000,  $0000                   ; 6666  SFX data
        DECLE   $0000,  $0000                   ; 6668  SFX data
        DECLE   $0000,  $0000                   ; 666A  SFX data
        DECLE   $0000,  $0000                   ; 666C  SFX data
        DECLE   $0000,  $0000                   ; 666E  SFX data
        DECLE   $0000,  $0000                   ; 6670  SFX data
        DECLE   $0000,  $0000                   ; 6672  SFX data
        DECLE   $0000,  $0000                   ; 6674  SFX data
        DECLE   $0000,  $0000                   ; 6676  SFX data
        DECLE   $0000,  $0000                   ; 6678  SFX data
        DECLE   $0000,  $0000                   ; 667A  SFX data
        DECLE   $0000,  $0000                   ; 667C  SFX data
        DECLE   $0000,  $0000                   ; 667E  SFX data
        DECLE   $0000,  $0000                   ; 6680  SFX data
        DECLE   $0000,  $0000                   ; 6682  SFX data
        DECLE   $0000,  $0000                   ; 6684  SFX data
        DECLE   $0000,  $0000                   ; 6686  SFX data
        DECLE   $0000,  $0000                   ; 6688  SFX data
        DECLE   $0000,  $0000                   ; 668A  SFX data
        DECLE   $0000,  $0000                   ; 668C  SFX data
        DECLE   $0000,  $0000                   ; 668E  SFX data
        DECLE   $0000,  $0000                   ; 6690  SFX data
        DECLE   $0000,  $0000                   ; 6692  SFX data
        DECLE   $0000,  $0000                   ; 6694  SFX data
        DECLE   $0000,  $0000                   ; 6696  SFX data
        DECLE   $0000,  $0000                   ; 6698  SFX data
        DECLE   $0000,  $0000                   ; 669A  SFX data
        DECLE   $0000,  $0000                   ; 669C  SFX data
        DECLE   $0000,  $0000                   ; 669E  SFX data
        DECLE   $0000,  $0000                   ; 66A0  SFX data
        DECLE   $0000,  $0000                   ; 66A2  SFX data
        DECLE   $0000,  $0000                   ; 66A4  SFX data
        DECLE   $0000,  $0000                   ; 66A6  SFX data
        DECLE   $0000,  $0000                   ; 66A8  SFX data
        DECLE   $0000,  $0000                   ; 66AA  SFX data
        DECLE   $0000,  $0000                   ; 66AC  SFX data
        DECLE   $0000,  $0000                   ; 66AE  SFX data
        DECLE   $0000,  $0000                   ; 66B0  SFX data
        DECLE   $0000,  $0000                   ; 66B2  SFX data
        DECLE   $0000,  $0000                   ; 66B4  SFX data
        DECLE   $0000,  $0000                   ; 66B6  SFX data
        DECLE   $0000,  $0000                   ; 66B8  SFX data
        DECLE   $0000,  $0000                   ; 66BA  SFX data
        DECLE   $0000,  $0000                   ; 66BC  SFX data
        DECLE   $0000,  $0000                   ; 66BE  SFX data
        DECLE   $0000,  $0000                   ; 66C0  SFX data
        DECLE   $0000,  $0000                   ; 66C2  SFX data
        DECLE   $0000,  $0000                   ; 66C4  SFX data
        DECLE   $0000,  $0000                   ; 66C6  SFX data
        DECLE   $0000,  $0000                   ; 66C8  SFX data
        DECLE   $0000,  $0000                   ; 66CA  SFX data
        DECLE   $0000,  $0000                   ; 66CC  SFX data
        DECLE   $0000,  $0000                   ; 66CE  SFX data
        DECLE   $0000,  $0000                   ; 66D0  SFX data
        DECLE   $001E                           ; 66D2  SFX data
        DECLE   $0000,  $0000                   ; 66D3  SFX data
        DECLE   $001C,  $001C                   ; 66D5  SFX data
        DECLE   $0000,  $0018                   ; 66D7  SFX data
        DECLE   $0034,  $0000                   ; 66D9  SFX data
        DECLE   $002A                           ; 66DB  SFX data
        DECLE   $005E                           ; 66DC  SFX data
        DECLE   $0000,  $001C                   ; 66DD  SFX data
        DECLE   $007A                           ; 66DF  SFX data
        DECLE   $0000,  $001C                   ; 66E0  SFX data
        DECLE   $0096                           ; 66E2  SFX data
        DECLE   $0000,  $001C                   ; 66E3  SFX data
        DECLE   $00B2                           ; 66E5  SFX data
        DECLE   $0000,  $0028                   ; 66E6  SFX data
        DECLE   $002A                           ; 66E8  SFX data
        DECLE   $0000,  $0018                   ; 66E9  SFX data
        DECLE   $0016                           ; 66EB  SFX data
        DECLE   $0000,  $0014                   ; 66EC  SFX data
        DECLE   $0070,  $0000                   ; 66EE  SFX data
        DECLE   $0018,  $00A8                   ; 66F0  SFX data
        DECLE   $0000,  $001A                   ; 66F2  SFX data
        DECLE   $0042                           ; 66F4  SFX data
        DECLE   $0000,  $001C                   ; 66F5  SFX data
        DECLE   $00DA                           ; 66F7  SFX data
        DECLE   $0000,  $0126                   ; 66F8  SFX data
        DECLE   $002A                           ; 66FA  SFX data
        DECLE   $0000,  $0018                   ; 66FB  SFX data
        DECLE   $005E                           ; 66FD  SFX data
        DECLE   $0000,  $0016                   ; 66FE  SFX data
        DECLE   $00C2                           ; 6700  SFX data
        DECLE   $0000,  $0018                   ; 6701  SFX data
        DECLE   $0000,  $0000                   ; 6703  SFX data
        DECLE   $001C,  $0096                   ; 6705  SFX data
        DECLE   $0000,  $001C                   ; 6707  SFX data
        DECLE   $007A                           ; 6709  SFX data
        DECLE   $0000,  $001C                   ; 670A  SFX data
        DECLE   $0048,  $0000                   ; 670C  SFX data
        DECLE   $0028,  $001C                   ; 670E  SFX data
        DECLE   $0000,  $0014                   ; 6710  SFX data
        DECLE   $0000,  $0000                   ; 6712  SFX data
        DECLE   $0016                           ; 6714  SFX data
        DECLE   $00A8,  $0000                   ; 6715  SFX data
        DECLE   $001A                           ; 6717  SFX data
        DECLE   $0096                           ; 6718  SFX data
        DECLE   $0000,  $001C                   ; 6719  SFX data
        DECLE   $0070,  $0000                   ; 671B  SFX data
        DECLE   $0018,  $0000                   ; 671D  SFX data
        DECLE   $0000,  $001C                   ; 671F  SFX data
        DECLE   $001C,  $0000                   ; 6721  SFX data
        DECLE   $0018,  $0034                   ; 6723  SFX data
        DECLE   $0000,  $002A                   ; 6725  SFX data
        DECLE   $005E                           ; 6727  SFX data
        DECLE   $0000,  $001C                   ; 6728  SFX data
        DECLE   $007A                           ; 672A  SFX data
        DECLE   $0000,  $001C                   ; 672B  SFX data
        DECLE   $0096                           ; 672D  SFX data
        DECLE   $0000,  $001C                   ; 672E  SFX data
        DECLE   $00B2                           ; 6730  SFX data
        DECLE   $0000,  $0028                   ; 6731  SFX data
        DECLE   $002A                           ; 6733  SFX data
        DECLE   $0000,  $0018                   ; 6734  SFX data
        DECLE   $0016                           ; 6736  SFX data
        DECLE   $0000,  $0014                   ; 6737  SFX data
        DECLE   $0070,  $0000                   ; 6739  SFX data
        DECLE   $0018,  $00A8                   ; 673B  SFX data
        DECLE   $0000,  $001A                   ; 673D  SFX data
        DECLE   $0042                           ; 673F  SFX data
        DECLE   $0000,  $001C                   ; 6740  SFX data
        DECLE   $00DA                           ; 6742  SFX data
        DECLE   $0000,  $0126                   ; 6743  SFX data
        DECLE   $002A                           ; 6745  SFX data
        DECLE   $0000,  $0018                   ; 6746  SFX data
        DECLE   $005E                           ; 6748  SFX data
        DECLE   $0000,  $0016                   ; 6749  SFX data
        DECLE   $00C2                           ; 674B  SFX data
        DECLE   $0000,  $0018                   ; 674C  SFX data
        DECLE   $0000,  $0000                   ; 674E  SFX data
        DECLE   $001C,  $0096                   ; 6750  SFX data
        DECLE   $0000,  $001C                   ; 6752  SFX data
        DECLE   $007A                           ; 6754  SFX data
        DECLE   $0000,  $001C                   ; 6755  SFX data
        DECLE   $0048,  $0000                   ; 6757  SFX data
        DECLE   $0028,  $001C                   ; 6759  SFX data
        DECLE   $0000,  $0014                   ; 675B  SFX data
        DECLE   $0000,  $0000                   ; 675D  SFX data
        DECLE   $0016                           ; 675F  SFX data
        DECLE   $00A8,  $0000                   ; 6760  SFX data
        DECLE   $001A                           ; 6762  SFX data
        DECLE   $0096                           ; 6763  SFX data
        DECLE   $0000,  $001C                   ; 6764  SFX data
        DECLE   $0070,  $0000                   ; 6766  SFX data
        DECLE   $0018,  $0000                   ; 6768  SFX data
        DECLE   $0000,  $001C                   ; 676A  SFX data
        DECLE   $001C,  $0000                   ; 676C  SFX data
        DECLE   $0018,  $0034                   ; 676E  SFX data
        DECLE   $0000,  $002A                   ; 6770  SFX data
        DECLE   $005E                           ; 6772  SFX data
        DECLE   $0000,  $001C                   ; 6773  SFX data
        DECLE   $007A                           ; 6775  SFX data
        DECLE   $0000,  $001C                   ; 6776  SFX data
        DECLE   $0096                           ; 6778  SFX data
        DECLE   $0000,  $001C                   ; 6779  SFX data
        DECLE   $00B2                           ; 677B  SFX data
        DECLE   $0000,  $0028                   ; 677C  SFX data
        DECLE   $002A                           ; 677E  SFX data
        DECLE   $0000,  $0018                   ; 677F  SFX data
        DECLE   $0016                           ; 6781  SFX data
        DECLE   $0000,  $0014                   ; 6782  SFX data
        DECLE   $0070,  $0000                   ; 6784  SFX data
        DECLE   $0018,  $00A8                   ; 6786  SFX data
        DECLE   $0000,  $001A                   ; 6788  SFX data
        DECLE   $0042                           ; 678A  SFX data
        DECLE   $0000,  $001C                   ; 678B  SFX data
        DECLE   $00DA                           ; 678D  SFX data
        DECLE   $0000,  $0126                   ; 678E  SFX data
        DECLE   $002A                           ; 6790  SFX data
        DECLE   $0000,  $0018                   ; 6791  SFX data
        DECLE   $005E                           ; 6793  SFX data
        DECLE   $0000,  $0016                   ; 6794  SFX data
        DECLE   $00C2                           ; 6796  SFX data
        DECLE   $0000,  $0018                   ; 6797  SFX data
        DECLE   $0000,  $0000                   ; 6799  SFX data
        DECLE   $001C,  $0096                   ; 679B  SFX data
        DECLE   $0000,  $001C                   ; 679D  SFX data
        DECLE   $007A                           ; 679F  SFX data
        DECLE   $0000,  $001C                   ; 67A0  SFX data
        DECLE   $0048,  $0000                   ; 67A2  SFX data
        DECLE   $0028,  $001C                   ; 67A4  SFX data
        DECLE   $0000,  $0014                   ; 67A6  SFX data
        DECLE   $0000,  $0000                   ; 67A8  SFX data
        DECLE   $0016                           ; 67AA  SFX data
        DECLE   $00A8,  $0000                   ; 67AB  SFX data
        DECLE   $001A                           ; 67AD  SFX data
        DECLE   $0096                           ; 67AE  SFX data
        DECLE   $0000,  $001C                   ; 67AF  SFX data
        DECLE   $0070,  $0000                   ; 67B1  SFX data
        DECLE   $0018,  $0000                   ; 67B3  SFX data
        DECLE   $0000,  $001C                   ; 67B5  SFX data
        DECLE   $001C,  $0000                   ; 67B7  SFX data
        DECLE   $0018,  $0034                   ; 67B9  SFX data
        DECLE   $0000,  $002A                   ; 67BB  SFX data
        DECLE   $005E                           ; 67BD  SFX data
        DECLE   $0000,  $001C                   ; 67BE  SFX data
        DECLE   $007A                           ; 67C0  SFX data
        DECLE   $0000,  $001C                   ; 67C1  SFX data
        DECLE   $0096                           ; 67C3  SFX data
        DECLE   $0000,  $001C                   ; 67C4  SFX data
        DECLE   $00B2                           ; 67C6  SFX data
        DECLE   $0000,  $0028                   ; 67C7  SFX data
        DECLE   $002A                           ; 67C9  SFX data
        DECLE   $0000,  $0018                   ; 67CA  SFX data
        DECLE   $0016                           ; 67CC  SFX data
        DECLE   $0000,  $0014                   ; 67CD  SFX data
        DECLE   $0070,  $0000                   ; 67CF  SFX data
        DECLE   $0018,  $00A8                   ; 67D1  SFX data
        DECLE   $0000,  $001A                   ; 67D3  SFX data
        DECLE   $0042                           ; 67D5  SFX data
        DECLE   $0000,  $001C                   ; 67D6  SFX data
        DECLE   $00DA                           ; 67D8  SFX data
        DECLE   $0000,  $0126                   ; 67D9  SFX data
        DECLE   $002A                           ; 67DB  SFX data
        DECLE   $0000,  $0018                   ; 67DC  SFX data
        DECLE   $005E                           ; 67DE  SFX data
        DECLE   $0000,  $0016                   ; 67DF  SFX data
        DECLE   $00C2                           ; 67E1  SFX data
        DECLE   $0000,  $0018                   ; 67E2  SFX data
        DECLE   $0000,  $0000                   ; 67E4  SFX data
        DECLE   $001C,  $0096                   ; 67E6  SFX data
        DECLE   $0000,  $001C                   ; 67E8  SFX data
        DECLE   $007A                           ; 67EA  SFX data
        DECLE   $0000,  $001C                   ; 67EB  SFX data
        DECLE   $0048,  $0000                   ; 67ED  SFX data
        DECLE   $0028,  $001C                   ; 67EF  SFX data
        DECLE   $0000,  $0014                   ; 67F1  SFX data
        DECLE   $0000,  $0000                   ; 67F3  SFX data
        DECLE   $0016                           ; 67F5  SFX data
        DECLE   $00A8,  $0000                   ; 67F6  SFX data
        DECLE   $001A                           ; 67F8  SFX data
        DECLE   $0096                           ; 67F9  SFX data
        DECLE   $0000,  $001C                   ; 67FA  SFX data
        DECLE   $0070,  $0000                   ; 67FC  SFX data
        DECLE   $0018,  $00DA                   ; 67FE  SFX data
        DECLE   $0000,  $0126                   ; 6800  SFX data
        DECLE   $0000,  $0000                   ; 6802  SFX data
        DECLE   $0200,  $005A                   ; 6804  SFX data
        DECLE   $0034,  $0000                   ; 6806  SFX data
        DECLE   $0043,  $004F                   ; 6808  SFX data
        DECLE   $0050,  $0059                   ; 680A  SFX data
        DECLE   $0052                           ; 680C  SFX data
        DECLE   $0049                           ; 680D  SFX data
        DECLE   $0047                           ; 680E  SFX data
        DECLE   $0048,  $0054                   ; 680F  SFX data
        DECLE   $0020,  $0031                   ; 6811  SFX data
        DECLE   $0039                           ; 6813  SFX data
        DECLE   $0038,  $0032                   ; 6814  SFX data
        DECLE   $0020,  $004D                   ; 6816  SFX data
        DECLE   $0041,  $0054                   ; 6818  SFX data
        DECLE   $0054,  $0045                   ; 681A  SFX data
        DECLE   $004C,  $002C                   ; 681C  SFX data
        DECLE   $0020,  $0043                   ; 681E  SFX data
        DECLE   $004F,  $0050                   ; 6820  SFX data
        DECLE   $0059                           ; 6822  SFX data
        DECLE   $0052                           ; 6823  SFX data
        DECLE   $0049                           ; 6824  SFX data
        DECLE   $0047                           ; 6825  SFX data
        DECLE   $0048,  $0054                   ; 6826  SFX data
        DECLE   $0020,  $0031                   ; 6828  SFX data
        DECLE   $0039                           ; 682A  SFX data
        DECLE   $0038,  $0032                   ; 682B  SFX data
        DECLE   $0020,  $0044                   ; 682D  SFX data
        DECLE   $0041,  $0054                   ; 682F  SFX data
        DECLE   $0041,  $0020                   ; 6831  SFX data
        DECLE   $0045                           ; 6833  SFX data
        DECLE   $0041,  $0053                   ; 6834  SFX data
        DECLE   $0054,  $0020                   ; 6836  SFX data
        DECLE   $0043,  $004F                   ; 6838  SFX data
        DECLE   $0052                           ; 683A  SFX data
        DECLE   $0050,  $004F                   ; 683B  SFX data
        DECLE   $0052                           ; 683D  SFX data
        DECLE   $0041,  $0054                   ; 683E  SFX data
        DECLE   $0049                           ; 6840  SFX data
        DECLE   $004F,  $004E                   ; 6841  SFX data
        DECLE   $0020,  $0000                   ; 6843  SFX data
        DECLE   $0275                           ; 6845  SFX data
        DECLE   $02B9                           ; 6846  SFX data
        DECLE   $01F8,  $028A                   ; 6847  SFX data
        DECLE   $02BB                           ; 6849  SFX data
        DECLE   $0009                           ; 684A  SFX data
        DECLE   $0098,  $01D3                   ; 684B  SFX data
        DECLE   $0190,  $01C3                   ; 684D  SFX data
        DECLE   $0383,  $01BB                   ; 684F  SFX data
        DECLE   $024B                           ; 6851  SFX data
        DECLE   $0282                           ; 6852  SFX data
        DECLE   $01BB                           ; 6853  SFX data
        DECLE   $0242                           ; 6854  SFX data
        DECLE   $018F,  $02B7                   ; 6855  SFX data
        DECLE   $0275                           ; 6857  SFX data
        DECLE   $02BA                           ; 6858  SFX data
        DECLE   $019D                           ; 6859  SFX data
        DECLE   $0293,  $037B                   ; 685A  SFX data
        DECLE   $007F                           ; 685C  Unknown
        DECLE   $0206                           ; 685D  SFX data
        DECLE   $0004,  $0001                   ; 685E  SFX data
        DECLE   $03FB                           ; 6860  SFX data
        DECLE   $0000,  $00FF                   ; 6861  SFX data
        DECLE   $02BA                           ; 6863  SFX data
        DECLE   $01A0,  $0291                   ; 6864  SFX data
        DECLE   $0379                           ; 6866  SFX data
        DECLE   $007F                           ; 6867  Unknown
        DECLE   $0206                           ; 6868  SFX data
        DECLE   $0004,  $0001                   ; 6869  SFX data
        DECLE   $03F9                           ; 686B  SFX data
        DECLE   $0000,  $00FF                   ; 686C  SFX data
        DECLE   $00D9                           ; 686E  SFX data
        DECLE   $03B9                           ; 686F  SFX data
        DECLE   $007F                           ; 6870  Unknown
        DECLE   $0241,  $01A0                   ; 6871  SFX data
        DECLE   $0065                           ; 6873  SFX data
        DECLE   $0061,  $0241                   ; 6874  SFX data
        DECLE   $01FB                           ; 6876  SFX data
        DECLE   $02B7                           ; 6877  SFX data
        DECLE   $0275                           ; 6878  SFX data
        DECLE   $02BA                           ; 6879  SFX data
        DECLE   $01BD                           ; 687A  SFX data
        DECLE   $0293,  $037B                   ; 687B  SFX data
        DECLE   $007F                           ; 687D  Unknown
        DECLE   $0206                           ; 687E  SFX data
        DECLE   $0004,  $0001                   ; 687F  SFX data
        DECLE   $03FB                           ; 6881  SFX data
        DECLE   $0000,  $00FF                   ; 6882  SFX data
        DECLE   $02BA                           ; 6884  SFX data
        DECLE   $01BC,  $0291                   ; 6885  SFX data
        DECLE   $0379                           ; 6887  SFX data
        DECLE   $007F                           ; 6888  Unknown
        DECLE   $0206                           ; 6889  SFX data
        DECLE   $0004,  $0001                   ; 688A  SFX data
        DECLE   $03F9                           ; 688C  SFX data
        DECLE   $0000,  $00FF                   ; 688D  SFX data
        DECLE   $00D9                           ; 688F  SFX data
        DECLE   $03B9                           ; 6890  SFX data
        DECLE   $007F                           ; 6891  Unknown
        DECLE   $0241,  $01BC                   ; 6892  SFX data
        DECLE   $0065                           ; 6894  SFX data
        DECLE   $0241,  $01F9                   ; 6895  SFX data
        DECLE   $02B7                           ; 6897  SFX data
        DECLE   $0281,  $0197                   ; 6898  SFX data
        DECLE   $0011,  $0204                   ; 689A  SFX data
        DECLE   $000B                           ; 689C  SFX data
        DECLE   $0241,  $0197                   ; 689D  SFX data
        DECLE   $0242                           ; 689F  SFX data
        DECLE   $01B5                           ; 68A0  SFX data
        DECLE   $0042                           ; 68A1  SFX data
        DECLE   $0242                           ; 68A2  SFX data
        DECLE   $01B6                           ; 68A3  SFX data
        DECLE   $02B7                           ; 68A4  SFX data
        DECLE   $00A2                           ; 68A5  SFX data
        DECLE   $0220,  $0008                   ; 68A6  SFX data
        DECLE   $0281,  $0194                   ; 68A8  SFX data
        DECLE   $0241,  $0197                   ; 68AA  SFX data
        DECLE   $0281,  $01A3                   ; 68AC  SFX data
        DECLE   $0011,  $020B                   ; 68AE  SFX data
        DECLE   $0007                           ; 68B0  SFX data
        DECLE   $0224,  $000D                   ; 68B1  SFX data
        DECLE   $0241,  $01A3                   ; 68B3  SFX data
        DECLE   $009A                           ; 68B5  SFX data
        DECLE   $0220,  $0018                   ; 68B6  SFX data
        DECLE   $01C9                           ; 68B8  SFX data
        DECLE   $0220,  $0007                   ; 68B9  SFX data
        DECLE   $0275                           ; 68BB  SFX data
        DECLE   $02BC,  $01F0                   ; 68BC  SFX data
        DECLE   $0091,  $0242                   ; 68BE  SFX data
        DECLE   $01AF                           ; 68C0  Unknown
        DECLE   $03BA                           ; 68C1  SFX data
        DECLE   $00FF                           ; 68C2  Unknown
        DECLE   $0262                           ; 68C3  SFX data
        DECLE   $0041,  $02FC                   ; 68C4  SFX data
        DECLE   $0003,  $0261                   ; 68C6  SFX data
        DECLE   $0241,  $01B0                   ; 68C8  SFX data
        DECLE   $02B7                           ; 68CA  SFX data
        DECLE   $0275                           ; 68CB  SFX data
        DECLE   $0242                           ; 68CC  SFX data
        DECLE   $01A9                           ; 68CD  SFX data
        DECLE   $0240,  $01AC                   ; 68CE  SFX data
        DECLE   $02B7                           ; 68D0  SFX data
        DECLE   $0275                           ; 68D1  SFX data
        DECLE   $02BC,  $01A9                   ; 68D2  SFX data
        DECLE   $02A2                           ; 68D4  SFX data
        DECLE   $037A                           ; 68D5  SFX data
        DECLE   $007F                           ; 68D6  Unknown
        DECLE   $0206                           ; 68D7  SFX data
        DECLE   $0004,  $0001                   ; 68D8  SFX data
        DECLE   $03FA                           ; 68DA  SFX data
        DECLE   $0000,  $00FF                   ; 68DB  SFX data
        DECLE   $02A3,  $037B                   ; 68DD  SFX data
        DECLE   $007F                           ; 68DF  Unknown
        DECLE   $0206                           ; 68E0  SFX data
        DECLE   $0004,  $0001                   ; 68E1  SFX data
        DECLE   $03FB                           ; 68E3  SFX data
        DECLE   $0000,  $00FF                   ; 68E4  SFX data
        DECLE   $00DA                           ; 68E6  SFX data
        DECLE   $0023,  $0014                   ; 68E7  SFX data
        DECLE   $0263,  $02BC                   ; 68E9  SFX data
        DECLE   $01AF                           ; 68EB  Unknown
        DECLE   $0001,  $02A3                   ; 68EC  SFX data
        DECLE   $00D3,  $0001                   ; 68EE  SFX data
        DECLE   $03BB                           ; 68F0  SFX data
        DECLE   $00FF                           ; 68F1  Unknown
        DECLE   $000F,  $009A                   ; 68F2  SFX data
        DECLE   $03BA                           ; 68F4  SFX data
        DECLE   $00FF                           ; 68F5  Unknown
        DECLE   $0242                           ; 68F6  SFX data
        DECLE   $01AF                           ; 68F7  Unknown
        DECLE   $0242                           ; 68F8  SFX data
        DECLE   $01F0,  $0043                   ; 68F9  SFX data
        DECLE   $03BB                           ; 68FB  SFX data
        DECLE   $000F,  $0243                   ; 68FC  SFX data
        DECLE   $01B0,  $0243                   ; 68FE  SFX data
        DECLE   $01F4,  $02B7                   ; 6900  SFX data
        DECLE   $02A9                           ; 6902  SFX data
        DECLE   $0275                           ; 6903  SFX data
        DECLE   $0271,  $03B9                   ; 6904  SFX data
        DECLE   $000F,  $02B2                   ; 6906  SFX data
        DECLE   $0272                           ; 6908  SFX data
        DECLE   $0066                           ; 6909  SFX data
        DECLE   $0066                           ; 690A  SFX data
        DECLE   $0062                           ; 690B  SFX data
        DECLE   $03BA                           ; 690C  SFX data
        DECLE   $0007                           ; 690D  SFX data
        DECLE   $0076                           ; 690E  SFX data
        DECLE   $0209                           ; 690F  SFX data
        DECLE   $0004,  $0341                   ; 6910  SFX data
        DECLE   $0191,  $0205                   ; 6912  SFX data
        DECLE   $0047                           ; 6914  SFX data
        DECLE   $020A                           ; 6915  SFX data
        DECLE   $0004,  $0341                   ; 6916  SFX data
        DECLE   $0192                           ; 6918  SFX data
        DECLE   $0205                           ; 6919  SFX data
        DECLE   $0041,  $03BA                   ; 691A  SFX data
        DECLE   $0001,  $0204                   ; 691C  SFX data
        DECLE   $0004,  $0341                   ; 691E  SFX data
        DECLE   $0193,  $0205                   ; 6920  SFX data
        DECLE   $0039                           ; 6922  SFX data
        DECLE   $02BB                           ; 6923  SFX data
        DECLE   $0191,  $0209                   ; 6924  SFX data
        DECLE   $0001,  $0259                   ; 6926  SFX data
        DECLE   $000B                           ; 6928  SFX data
        DECLE   $020A                           ; 6929  SFX data
        DECLE   $0001,  $0259                   ; 692A  SFX data
        DECLE   $000B                           ; 692C  SFX data
        DECLE   $0092                           ; 692D  SFX data
        DECLE   $0204,  $0001                   ; 692E  SFX data
        DECLE   $0259                           ; 6930  SFX data
        DECLE   $037B                           ; 6931  SFX data
        DECLE   $0193,  $020C                   ; 6932  SFX data
        DECLE   $0009                           ; 6934  SFX data
        DECLE   $02BB                           ; 6935  SFX data
        DECLE   $0194,  $02B1                   ; 6936  SFX data
        DECLE   $0065                           ; 6938  SFX data
        DECLE   $0065                           ; 6939  SFX data
        DECLE   $0065                           ; 693A  SFX data
        DECLE   $0061,  $0220                   ; 693B  SFX data
        DECLE   $0018,  $02BC                   ; 693D  SFX data
        DECLE   $01B5                           ; 693F  SFX data
        DECLE   $01DB                           ; 6940  SFX data
        DECLE   $02B1,  $0209                   ; 6941  SFX data
        DECLE   $0005                           ; 6943  SFX data
        DECLE   $0261,  $0041                   ; 6944  SFX data
        DECLE   $0261,  $0200                   ; 6946  SFX data
        DECLE   $000A                           ; 6948  SFX data
        DECLE   $02FC,  $0002                   ; 6949  SFX data
        DECLE   $000B                           ; 694B  SFX data
        DECLE   $0222                           ; 694C  SFX data
        DECLE   $0009                           ; 694D  SFX data
        DECLE   $02FC,  $0002                   ; 694E  SFX data
        DECLE   $000B                           ; 6950  SFX data
        DECLE   $0220,  $000E                   ; 6951  SFX data
        DECLE   $02B9                           ; 6953  SFX data
        DECLE   $0194,  $02BA                   ; 6954  SFX data
        DECLE   $0197,  $00D9                   ; 6956  SFX data
        DECLE   $00DA                           ; 6958  SFX data
        DECLE   $028B                           ; 6959  SFX data
        DECLE   $0253,  $02B7                   ; 695A  SFX data
        DECLE   $02B1,  $02B1                   ; 695C  SFX data
        DECLE   $02B7                           ; 695E  SFX data
        DECLE   $0275                           ; 695F  SFX data
        DECLE   $0281,  $0102                   ; 6960  SFX data
        DECLE   $0379                           ; 6962  SFX data
        DECLE   $0081,  $0204                   ; 6963  SFX data
        DECLE   $0022                           ; 6965  SFX data
        DECLE   $0281,  $018F                   ; 6966  SFX data
        DECLE   $02BA                           ; 6968  SFX data
        DECLE   $01F8,  $0293                   ; 6969  SFX data
        DECLE   $018B                           ; 696B  SFX data
        DECLE   $0253,  $02BC                   ; 696C  SFX data
        DECLE   $01B5                           ; 696E  SFX data
        DECLE   $037C,  $01B9                   ; 696F  SFX data
        DECLE   $020E                           ; 6971  SFX data
        DECLE   $0015                           ; 6972  SFX data
        DECLE   $0001,  $02A1                   ; 6973  SFX data
        DECLE   $0089                           ; 6975  SFX data
        DECLE   $0224,  $0008                   ; 6976  SFX data
        DECLE   $0274,  $00A0                   ; 6978  SFX data
        DECLE   $0338,  $01B7                   ; 697A  SFX data
        DECLE   $0060,  $0240                   ; 697C  SFX data
        DECLE   $0190,  $0001                   ; 697E  SFX data
        DECLE   $02BD                           ; 6980  SFX data
        DECLE   $0085                           ; 6981  SFX data
        DECLE   $0069                           ; 6982  SFX data
        DECLE   $0275                           ; 6983  SFX data
        DECLE   $008F,  $02B4                   ; 6984  SFX data
        DECLE   $0220,  $0018                   ; 6986  SFX data
        DECLE   $02B7                           ; 6988  SFX data
        DECLE   $0275                           ; 6989  SFX data
        DECLE   $02BC,  $019A                   ; 698A  SFX data
        DECLE   $037C,  $019C                   ; 698C  SFX data
        DECLE   $022E                           ; 698E  SFX data
        DECLE   $0007                           ; 698F  SFX data
        DECLE   $02A0,  $0080                   ; 6990  SFX data
        DECLE   $0224,  $0007                   ; 6992  SFX data
        DECLE   $0274,  $0004                   ; 6994  SFX data
        DECLE   $0168,  $019B                   ; 6996  SFX data
        DECLE   $02B4,  $0220                   ; 6998  SFX data
        DECLE   $000E                           ; 699A  SFX data
        DECLE   $0275                           ; 699B  SFX data
        DECLE   $01C0,  $02BA                   ; 699C  SFX data
        DECLE   $0191,  $0014                   ; 699E  SFX data
        DECLE   $033C,  $019A                   ; 69A0  SFX data
        DECLE   $00D4,  $02B9                   ; 69A2  SFX data
        DECLE   $000A                           ; 69A4  SFX data
        DECLE   $0260,  $02FC                   ; 69A5  SFX data
        DECLE   $0002                           ; 69A7  SFX data
        DECLE   $0011,  $022C                   ; 69A8  SFX data
        DECLE   $0005                           ; 69AA  SFX data
        DECLE   $02B9                           ; 69AB  SFX data
        DECLE   $0002                           ; 69AC  SFX data
        DECLE   $0260,  $0260                   ; 69AD  SFX data
        DECLE   $02FC,  $0004                   ; 69AF  SFX data
        DECLE   $0011,  $022C                   ; 69B1  SFX data
        DECLE   $0006                           ; 69B3  SFX data
        DECLE   $01C9                           ; 69B4  SFX data
        DECLE   $0241,  $01FB                   ; 69B5  SFX data
        DECLE   $02B9                           ; 69B7  SFX data
        DECLE   $003F                           ; 69B8  Unknown
        DECLE   $0241,  $018F                   ; 69B9  SFX data
        DECLE   $02BB                           ; 69BB  SFX data
        DECLE   $01F8,  $0299                   ; 69BC  SFX data
        DECLE   $02BA                           ; 69BE  SFX data
        DECLE   $0009                           ; 69BF  SFX data
        DECLE   $0093,  $0191                   ; 69C0  SFX data
        DECLE   $01D9                           ; 69C2  SFX data
        DECLE   $01D1,  $0241                   ; 69C3  SFX data
        DECLE   $01F8,  $02B7                   ; 69C5  SFX data
        DECLE   $0275                           ; 69C7  SFX data
        DECLE   $0004,  $0168                   ; 69C8  SFX data
        DECLE   $0102                           ; 69CA  SFX data
        DECLE   $011A                           ; 69CB  SFX data
        DECLE   $02B9                           ; 69CC  SFX data
        DECLE   $003E                           ; 69CD  SFX data
        DECLE   $0241,  $01BB                   ; 69CE  SFX data
        DECLE   $0004,  $0168                   ; 69D0  SFX data
        DECLE   $0045                           ; 69D2  SFX data
        DECLE   $0001,  $02BA                   ; 69D3  SFX data
        DECLE   $00F0,  $000A                   ; 69D5  SFX data
        DECLE   $0004,  $0168                   ; 69D7  SFX data
        DECLE   $00BB                           ; 69D9  SFX data
        DECLE   $02B9                           ; 69DA  SFX data
        DECLE   $000D                           ; 69DB  SFX data
        DECLE   $0241,  $01FB                   ; 69DC  SFX data
        DECLE   $004D                           ; 69DE  SFX data
        DECLE   $0049                           ; 69DF  SFX data
        DECLE   $0241,  $01A0                   ; 69E0  SFX data
        DECLE   $02BA                           ; 69E2  SFX data
        DECLE   $0000,  $02B8                   ; 69E3  SFX data
        DECLE   $0000,  $0004                   ; 69E5  SFX data
        DECLE   $0168,  $00CB                   ; 69E7  SFX data
        DECLE   $02B9                           ; 69E9  SFX data
        DECLE   $0000,  $0241                   ; 69EA  SFX data
        DECLE   $019D                           ; 69EC  SFX data
        DECLE   $02B9                           ; 69ED  SFX data
        DECLE   $0000,  $0241                   ; 69EE  SFX data
        DECLE   $01A3,  $0004                   ; 69F0  SFX data
        DECLE   $0168,  $00D1                   ; 69F2  SFX data
        DECLE   $0004,  $0168                   ; 69F4  SFX data
        DECLE   $0057,  $0001                   ; 69F6  SFX data
        DECLE   $02BB                           ; 69F8  SFX data
        DECLE   $00ED                           ; 69F9  SFX data
        DECLE   $0069                           ; 69FA  SFX data
        DECLE   $0001,  $02BC                   ; 69FB  SFX data
        DECLE   $00ED                           ; 69FD  SFX data
        DECLE   $0069                           ; 69FE  SFX data
        DECLE   $0001,  $02BA                   ; 69FF  SFX data
        DECLE   $00F7                           ; 6A01  Unknown
        DECLE   $0069                           ; 6A02  SFX data
        DECLE   $0220,  $016C                   ; 6A03  SFX data
        DECLE   $0000,  $0000                   ; 6A05  SFX data
        DECLE   $0000,  $0000                   ; 6A07  SFX data
        DECLE   $0000,  $0000                   ; 6A09  SFX data
        DECLE   $0000,  $0000                   ; 6A0B  SFX data
        DECLE   $0000,  $0000                   ; 6A0D  SFX data
        DECLE   $0000,  $0000                   ; 6A0F  SFX data
        DECLE   $0000,  $0000                   ; 6A11  SFX data
        DECLE   $0000,  $0000                   ; 6A13  SFX data
        DECLE   $0000,  $0000                   ; 6A15  SFX data
        DECLE   $0000,  $0000                   ; 6A17  SFX data
        DECLE   $0000,  $0000                   ; 6A19  SFX data
        DECLE   $0000,  $0000                   ; 6A1B  SFX data
        DECLE   $0000,  $0000                   ; 6A1D  SFX data
        DECLE   $0000,  $0043                   ; 6A1F  SFX data
        DECLE   $004F,  $0050                   ; 6A21  SFX data
        DECLE   $0059                           ; 6A23  SFX data
        DECLE   $0052                           ; 6A24  SFX data
        DECLE   $0049                           ; 6A25  SFX data
        DECLE   $0047                           ; 6A26  SFX data
        DECLE   $0048,  $0054                   ; 6A27  SFX data
        DECLE   $0020,  $0031                   ; 6A29  SFX data
        DECLE   $0039                           ; 6A2B  SFX data
        DECLE   $0038,  $0032                   ; 6A2C  SFX data
        DECLE   $0020,  $004D                   ; 6A2E  SFX data
        DECLE   $0041,  $0054                   ; 6A30  SFX data
        DECLE   $0054,  $0045                   ; 6A32  SFX data
        DECLE   $004C,  $002C                   ; 6A34  SFX data
        DECLE   $0020,  $0043                   ; 6A36  SFX data
        DECLE   $004F,  $0050                   ; 6A38  SFX data
        DECLE   $0059                           ; 6A3A  SFX data
        DECLE   $0052                           ; 6A3B  SFX data
        DECLE   $0049                           ; 6A3C  SFX data
        DECLE   $0047                           ; 6A3D  SFX data
        DECLE   $0048,  $0054                   ; 6A3E  SFX data
        DECLE   $0020,  $0031                   ; 6A40  SFX data
        DECLE   $0039                           ; 6A42  SFX data
        DECLE   $0038,  $0032                   ; 6A43  SFX data
        DECLE   $0020,  $0044                   ; 6A45  SFX data
        DECLE   $0041,  $0054                   ; 6A47  SFX data
        DECLE   $0041,  $0020                   ; 6A49  SFX data
        DECLE   $0045                           ; 6A4B  SFX data
        DECLE   $0041,  $0053                   ; 6A4C  SFX data
        DECLE   $0054,  $0020                   ; 6A4E  SFX data
        DECLE   $0043,  $004F                   ; 6A50  SFX data
        DECLE   $0052                           ; 6A52  SFX data
        DECLE   $0050,  $004F                   ; 6A53  SFX data
        DECLE   $0052                           ; 6A55  SFX data
        DECLE   $0041,  $0054                   ; 6A56  SFX data
        DECLE   $0049                           ; 6A58  SFX data
        DECLE   $004F,  $004E                   ; 6A59  SFX data
        DECLE   $0020,  $0000                   ; 6A5B  SFX data
        DECLE   $0000,  $0000                   ; 6A5D  SFX data
        DECLE   $0000,  $0000                   ; 6A5F  SFX data
        DECLE   $0000,  $0000                   ; 6A61  SFX data
        DECLE   $0000,  $0000                   ; 6A63  SFX data
        DECLE   $0000,  $0000                   ; 6A65  SFX data
        DECLE   $0000,  $0000                   ; 6A67  SFX data
        DECLE   $0000,  $0000                   ; 6A69  SFX data
        DECLE   $0000,  $0000                   ; 6A6B  SFX data
        DECLE   $0000,  $0000                   ; 6A6D  SFX data
        DECLE   $0000,  $0000                   ; 6A6F  SFX data
        DECLE   $0000,  $0020                   ; 6A71  SFX data
        DECLE   $0020,  $0020                   ; 6A73  SFX data
        DECLE   $0020,  $0020                   ; 6A75  SFX data
        DECLE   $0020,  $0050                   ; 6A77  SFX data
        DECLE   $0052                           ; 6A79  SFX data
        DECLE   $004F,  $0047                   ; 6A7A  SFX data
        DECLE   $0052                           ; 6A7C  SFX data
        DECLE   $0041,  $004D                   ; 6A7D  SFX data
        DECLE   $004D                           ; 6A7F  SFX data
        DECLE   $0045                           ; 6A80  SFX data
        DECLE   $0044,  $0020                   ; 6A81  SFX data
        DECLE   $0042                           ; 6A83  SFX data
        DECLE   $0059                           ; 6A84  SFX data
        DECLE   $0020,  $004A                   ; 6A85  SFX data
        DECLE   $004F,  $0048                   ; 6A87  SFX data
        DECLE   $004E                           ; 6A89  SFX data
        DECLE   $0020,  $0054                   ; 6A8A  SFX data
        DECLE   $004F,  $004D                   ; 6A8C  SFX data
        DECLE   $004C,  $0049                   ; 6A8E  SFX data
        DECLE   $004E                           ; 6A90  SFX data
        DECLE   $0053,  $004F                   ; 6A91  SFX data
        DECLE   $004E                           ; 6A93  SFX data
        DECLE   $0020,  $0020                   ; 6A94  SFX data
        DECLE   $0020,  $0020                   ; 6A96  SFX data
        DECLE   $0020,  $0020                   ; 6A98  SFX data
        DECLE   $0020,  $0000                   ; 6A9A  SFX data
        DECLE   $0020,  $0020                   ; 6A9C  SFX data
        DECLE   $0020,  $0020                   ; 6A9E  SFX data
        DECLE   $0020,  $0020                   ; 6AA0  SFX data
        DECLE   $0050,  $0052                   ; 6AA2  SFX data
        DECLE   $004F,  $0047                   ; 6AA4  SFX data
        DECLE   $0052                           ; 6AA6  SFX data
        DECLE   $0041,  $004D                   ; 6AA7  SFX data
        DECLE   $004D                           ; 6AA9  SFX data
        DECLE   $0045                           ; 6AAA  SFX data
        DECLE   $0044,  $0020                   ; 6AAB  SFX data
        DECLE   $0042                           ; 6AAD  SFX data
        DECLE   $0059                           ; 6AAE  SFX data
        DECLE   $0020,  $004A                   ; 6AAF  SFX data
        DECLE   $004F,  $0048                   ; 6AB1  SFX data
        DECLE   $004E                           ; 6AB3  SFX data
        DECLE   $0020,  $0054                   ; 6AB4  SFX data
        DECLE   $004F,  $004D                   ; 6AB6  SFX data
        DECLE   $004C,  $0049                   ; 6AB8  SFX data
        DECLE   $004E                           ; 6ABA  SFX data
        DECLE   $0053,  $004F                   ; 6ABB  SFX data
        DECLE   $004E                           ; 6ABD  SFX data
        DECLE   $0020,  $0020                   ; 6ABE  SFX data
        DECLE   $0020,  $0020                   ; 6AC0  SFX data
        DECLE   $0020,  $0020                   ; 6AC2  SFX data
        DECLE   $0020,  $0000                   ; 6AC4  SFX data
        DECLE   $0020,  $0020                   ; 6AC6  SFX data
        DECLE   $0020,  $0020                   ; 6AC8  SFX data
        DECLE   $0020,  $0020                   ; 6ACA  SFX data
        DECLE   $0050,  $0052                   ; 6ACC  SFX data
        DECLE   $004F,  $0047                   ; 6ACE  SFX data
        DECLE   $0052                           ; 6AD0  SFX data
        DECLE   $0041,  $004D                   ; 6AD1  SFX data
        DECLE   $004D                           ; 6AD3  SFX data
        DECLE   $0045                           ; 6AD4  SFX data
        DECLE   $0044,  $0020                   ; 6AD5  SFX data
        DECLE   $0042                           ; 6AD7  SFX data
        DECLE   $0059                           ; 6AD8  SFX data
        DECLE   $0020,  $004A                   ; 6AD9  SFX data
        DECLE   $004F,  $0048                   ; 6ADB  SFX data
        DECLE   $004E                           ; 6ADD  SFX data
        DECLE   $0020,  $0054                   ; 6ADE  SFX data
        DECLE   $004F,  $004D                   ; 6AE0  SFX data
        DECLE   $004C,  $0049                   ; 6AE2  SFX data
        DECLE   $004E                           ; 6AE4  SFX data
        DECLE   $0053,  $004F                   ; 6AE5  SFX data
        DECLE   $004E                           ; 6AE7  SFX data
        DECLE   $0020,  $0020                   ; 6AE8  SFX data
        DECLE   $0020,  $0020                   ; 6AEA  SFX data
        DECLE   $0020,  $0020                   ; 6AEC  SFX data
        DECLE   $0020,  $0000                   ; 6AEE  SFX data
        DECLE   $0020,  $0020                   ; 6AF0  SFX data
        DECLE   $0020,  $0020                   ; 6AF2  SFX data
        DECLE   $0020,  $0020                   ; 6AF4  SFX data
        DECLE   $0050,  $0052                   ; 6AF6  SFX data
        DECLE   $004F,  $0047                   ; 6AF8  SFX data
        DECLE   $0052                           ; 6AFA  SFX data
        DECLE   $0041,  $004D                   ; 6AFB  SFX data
        DECLE   $004D                           ; 6AFD  SFX data
        DECLE   $0045                           ; 6AFE  SFX data
        DECLE   $0044,  $0020                   ; 6AFF  SFX data
        DECLE   $0042                           ; 6B01  SFX data
        DECLE   $0059                           ; 6B02  SFX data
        DECLE   $0020,  $004A                   ; 6B03  SFX data
        DECLE   $004F,  $0048                   ; 6B05  SFX data
        DECLE   $004E                           ; 6B07  SFX data
        DECLE   $0020,  $0054                   ; 6B08  SFX data
        DECLE   $004F,  $004D                   ; 6B0A  SFX data
        DECLE   $004C,  $0049                   ; 6B0C  SFX data
        DECLE   $004E                           ; 6B0E  SFX data
        DECLE   $0053,  $004F                   ; 6B0F  SFX data
        DECLE   $004E                           ; 6B11  SFX data
        DECLE   $0020,  $0020                   ; 6B12  SFX data
        DECLE   $0020,  $0020                   ; 6B14  SFX data
        DECLE   $0020,  $0020                   ; 6B16  SFX data
        DECLE   $0020,  $0000                   ; 6B18  SFX data
        DECLE   $0020,  $0020                   ; 6B1A  SFX data
        DECLE   $0020,  $0020                   ; 6B1C  SFX data
        DECLE   $0020,  $0020                   ; 6B1E  SFX data
        DECLE   $0050,  $0052                   ; 6B20  SFX data
        DECLE   $004F,  $0047                   ; 6B22  SFX data
        DECLE   $0052                           ; 6B24  SFX data
        DECLE   $0041,  $004D                   ; 6B25  SFX data
        DECLE   $004D                           ; 6B27  SFX data
        DECLE   $0045                           ; 6B28  SFX data
        DECLE   $0044,  $0020                   ; 6B29  SFX data
        DECLE   $0042                           ; 6B2B  SFX data
        DECLE   $0059                           ; 6B2C  SFX data
        DECLE   $0020,  $004A                   ; 6B2D  SFX data
        DECLE   $004F,  $0048                   ; 6B2F  SFX data
        DECLE   $004E                           ; 6B31  SFX data
        DECLE   $0020,  $0054                   ; 6B32  SFX data
        DECLE   $004F,  $004D                   ; 6B34  SFX data
        DECLE   $004C,  $0049                   ; 6B36  SFX data
        DECLE   $004E                           ; 6B38  SFX data
        DECLE   $0053,  $004F                   ; 6B39  SFX data
        DECLE   $004E                           ; 6B3B  SFX data
        DECLE   $0020,  $0020                   ; 6B3C  SFX data
        DECLE   $0020,  $0020                   ; 6B3E  SFX data
        DECLE   $0020,  $0020                   ; 6B40  SFX data
        DECLE   $0020,  $0000                   ; 6B42  SFX data
        DECLE   $0020,  $0020                   ; 6B44  SFX data
        DECLE   $0020,  $0020                   ; 6B46  SFX data
        DECLE   $0020,  $0020                   ; 6B48  SFX data
        DECLE   $0050,  $0052                   ; 6B4A  SFX data
        DECLE   $004F,  $0047                   ; 6B4C  SFX data
        DECLE   $0052                           ; 6B4E  SFX data
        DECLE   $0041,  $004D                   ; 6B4F  SFX data
        DECLE   $004D                           ; 6B51  SFX data
        DECLE   $0045                           ; 6B52  SFX data
        DECLE   $0044,  $0020                   ; 6B53  SFX data
        DECLE   $0042                           ; 6B55  SFX data
        DECLE   $0059                           ; 6B56  SFX data
        DECLE   $0020,  $004A                   ; 6B57  SFX data
        DECLE   $004F,  $0048                   ; 6B59  SFX data
        DECLE   $004E                           ; 6B5B  SFX data
        DECLE   $0020,  $0054                   ; 6B5C  SFX data
        DECLE   $004F,  $004D                   ; 6B5E  SFX data
        DECLE   $004C,  $0049                   ; 6B60  SFX data
        DECLE   $004E                           ; 6B62  SFX data
        DECLE   $0053,  $004F                   ; 6B63  SFX data
        DECLE   $004E                           ; 6B65  SFX data
        DECLE   $0020,  $0020                   ; 6B66  SFX data
        DECLE   $0020,  $0020                   ; 6B68  SFX data
        DECLE   $0020,  $0020                   ; 6B6A  SFX data
        DECLE   $0020,  $0000                   ; 6B6C  SFX data
        DECLE   $0020,  $0020                   ; 6B6E  SFX data
        DECLE   $0020,  $0020                   ; 6B70  SFX data
        DECLE   $0020,  $0020                   ; 6B72  SFX data
        DECLE   $0050,  $0052                   ; 6B74  SFX data
        DECLE   $004F,  $0047                   ; 6B76  SFX data
        DECLE   $0052                           ; 6B78  SFX data
        DECLE   $0041,  $004D                   ; 6B79  SFX data
        DECLE   $004D                           ; 6B7B  SFX data
        DECLE   $0045                           ; 6B7C  SFX data
        DECLE   $0044,  $0020                   ; 6B7D  SFX data
        DECLE   $0042                           ; 6B7F  SFX data
        DECLE   $0059                           ; 6B80  SFX data
        DECLE   $0020,  $004A                   ; 6B81  SFX data
        DECLE   $004F,  $0048                   ; 6B83  SFX data
        DECLE   $004E                           ; 6B85  SFX data
        DECLE   $0020,  $0054                   ; 6B86  SFX data
        DECLE   $004F,  $004D                   ; 6B88  SFX data
        DECLE   $004C,  $0049                   ; 6B8A  SFX data
        DECLE   $004E                           ; 6B8C  SFX data
        DECLE   $0053,  $004F                   ; 6B8D  SFX data
        DECLE   $004E                           ; 6B8F  SFX data
        DECLE   $0020,  $0020                   ; 6B90  SFX data
        DECLE   $0020,  $0020                   ; 6B92  SFX data
        DECLE   $0020,  $0020                   ; 6B94  SFX data
        DECLE   $0020,  $0000                   ; 6B96  SFX data
        DECLE   $0020,  $0020                   ; 6B98  SFX data
        DECLE   $0020,  $0020                   ; 6B9A  SFX data
        DECLE   $0020,  $0020                   ; 6B9C  SFX data
        DECLE   $0050,  $0052                   ; 6B9E  SFX data
        DECLE   $004F,  $0047                   ; 6BA0  SFX data
        DECLE   $0052                           ; 6BA2  SFX data
        DECLE   $0041,  $004D                   ; 6BA3  SFX data
        DECLE   $004D                           ; 6BA5  SFX data
        DECLE   $0045                           ; 6BA6  SFX data
        DECLE   $0044,  $0020                   ; 6BA7  SFX data
        DECLE   $0042                           ; 6BA9  SFX data
        DECLE   $0059                           ; 6BAA  SFX data
        DECLE   $0020,  $004A                   ; 6BAB  SFX data
        DECLE   $004F,  $0048                   ; 6BAD  SFX data
        DECLE   $004E                           ; 6BAF  SFX data
        DECLE   $0020,  $0054                   ; 6BB0  SFX data
        DECLE   $004F,  $004D                   ; 6BB2  SFX data
        DECLE   $004C,  $0049                   ; 6BB4  SFX data
        DECLE   $004E                           ; 6BB6  SFX data
        DECLE   $0053,  $004F                   ; 6BB7  SFX data
        DECLE   $004E                           ; 6BB9  SFX data
        DECLE   $0020,  $0020                   ; 6BBA  SFX data
        DECLE   $0020,  $0020                   ; 6BBC  SFX data
        DECLE   $0020,  $0020                   ; 6BBE  SFX data
        DECLE   $0020,  $0000                   ; 6BC0  SFX data
        DECLE   $0020,  $0020                   ; 6BC2  SFX data
        DECLE   $0020,  $0020                   ; 6BC4  SFX data
        DECLE   $0020,  $0020                   ; 6BC6  SFX data
        DECLE   $0050,  $0052                   ; 6BC8  SFX data
        DECLE   $004F,  $0047                   ; 6BCA  SFX data
        DECLE   $0052                           ; 6BCC  SFX data
        DECLE   $0041,  $004D                   ; 6BCD  SFX data
        DECLE   $004D                           ; 6BCF  SFX data
        DECLE   $0045                           ; 6BD0  SFX data
        DECLE   $0044,  $0020                   ; 6BD1  SFX data
        DECLE   $0042                           ; 6BD3  SFX data
        DECLE   $0059                           ; 6BD4  SFX data
        DECLE   $0020,  $004A                   ; 6BD5  SFX data
        DECLE   $004F,  $0048                   ; 6BD7  SFX data
        DECLE   $004E                           ; 6BD9  SFX data
        DECLE   $0020,  $0054                   ; 6BDA  SFX data
        DECLE   $004F,  $004D                   ; 6BDC  SFX data
        DECLE   $004C,  $0049                   ; 6BDE  SFX data
        DECLE   $004E                           ; 6BE0  SFX data
        DECLE   $0053,  $004F                   ; 6BE1  SFX data
        DECLE   $004E                           ; 6BE3  SFX data
        DECLE   $0020,  $0020                   ; 6BE4  SFX data
        DECLE   $0020,  $0020                   ; 6BE6  SFX data
        DECLE   $0020,  $0020                   ; 6BE8  SFX data
        DECLE   $0020,  $0000                   ; 6BEA  SFX data
        DECLE   $0020,  $0020                   ; 6BEC  SFX data
        DECLE   $0020,  $0020                   ; 6BEE  SFX data
        DECLE   $0020,  $0020                   ; 6BF0  SFX data
        DECLE   $0050,  $0052                   ; 6BF2  SFX data
        DECLE   $004F,  $0047                   ; 6BF4  SFX data
        DECLE   $0052                           ; 6BF6  SFX data
        DECLE   $0041,  $004D                   ; 6BF7  SFX data
        DECLE   $004D                           ; 6BF9  SFX data
        DECLE   $0045                           ; 6BFA  SFX data
        DECLE   $0044,  $0020                   ; 6BFB  SFX data
        DECLE   $0042                           ; 6BFD  SFX data
        DECLE   $0059                           ; 6BFE  SFX data
        DECLE   $0020,  $004A                   ; 6BFF  SFX data
        DECLE   $004F,  $0048                   ; 6C01  SFX data
        DECLE   $004E                           ; 6C03  SFX data
        DECLE   $0020,  $0054                   ; 6C04  SFX data
        DECLE   $004F,  $004D                   ; 6C06  SFX data
        DECLE   $004C,  $0049                   ; 6C08  SFX data
        DECLE   $004E                           ; 6C0A  SFX data
        DECLE   $0053,  $004F                   ; 6C0B  SFX data
        DECLE   $004E                           ; 6C0D  SFX data
        DECLE   $0020,  $0020                   ; 6C0E  SFX data
        DECLE   $0020,  $0020                   ; 6C10  SFX data
        DECLE   $0020,  $0020                   ; 6C12  SFX data
        DECLE   $0020,  $0000                   ; 6C14  SFX data
        DECLE   $0020,  $0020                   ; 6C16  SFX data
        DECLE   $0020,  $0020                   ; 6C18  SFX data
        DECLE   $0020,  $0020                   ; 6C1A  SFX data
        DECLE   $0050,  $0052                   ; 6C1C  SFX data
        DECLE   $004F,  $0047                   ; 6C1E  SFX data
        DECLE   $0052                           ; 6C20  SFX data
        DECLE   $0041,  $004D                   ; 6C21  SFX data
        DECLE   $004D                           ; 6C23  SFX data
        DECLE   $0045                           ; 6C24  SFX data
        DECLE   $0044,  $0020                   ; 6C25  SFX data
        DECLE   $0042                           ; 6C27  SFX data
        DECLE   $0059                           ; 6C28  SFX data
        DECLE   $0020,  $004A                   ; 6C29  SFX data
        DECLE   $004F,  $0048                   ; 6C2B  SFX data
        DECLE   $004E                           ; 6C2D  SFX data
        DECLE   $0020,  $0054                   ; 6C2E  SFX data
        DECLE   $004F,  $004D                   ; 6C30  SFX data
        DECLE   $004C,  $0049                   ; 6C32  SFX data
        DECLE   $004E                           ; 6C34  SFX data
        DECLE   $0053,  $004F                   ; 6C35  SFX data
        DECLE   $004E                           ; 6C37  SFX data
        DECLE   $0020,  $0020                   ; 6C38  SFX data
        DECLE   $0020,  $0020                   ; 6C3A  SFX data
        DECLE   $0020,  $0020                   ; 6C3C  SFX data
        DECLE   $0020,  $0000                   ; 6C3E  SFX data
        DECLE   $0020,  $0020                   ; 6C40  SFX data
        DECLE   $0020,  $0020                   ; 6C42  SFX data
        DECLE   $0020,  $0020                   ; 6C44  SFX data
        DECLE   $0050,  $0052                   ; 6C46  SFX data
        DECLE   $004F,  $0047                   ; 6C48  SFX data
        DECLE   $0052                           ; 6C4A  SFX data
        DECLE   $0041,  $004D                   ; 6C4B  SFX data
        DECLE   $004D                           ; 6C4D  SFX data
        DECLE   $0045                           ; 6C4E  SFX data
        DECLE   $0044,  $0020                   ; 6C4F  SFX data
        DECLE   $0042                           ; 6C51  SFX data
        DECLE   $0059                           ; 6C52  SFX data
        DECLE   $0020,  $004A                   ; 6C53  SFX data
        DECLE   $004F,  $0048                   ; 6C55  SFX data
        DECLE   $004E                           ; 6C57  SFX data
        DECLE   $0020,  $0054                   ; 6C58  SFX data
        DECLE   $004F,  $004D                   ; 6C5A  SFX data
        DECLE   $004C,  $0049                   ; 6C5C  SFX data
        DECLE   $004E                           ; 6C5E  SFX data
        DECLE   $0053,  $004F                   ; 6C5F  SFX data
        DECLE   $004E                           ; 6C61  SFX data
        DECLE   $0020,  $0020                   ; 6C62  SFX data
        DECLE   $0020,  $0020                   ; 6C64  SFX data
        DECLE   $0020,  $0020                   ; 6C66  SFX data
        DECLE   $0020,  $0000                   ; 6C68  SFX data
        DECLE   $0020,  $0020                   ; 6C6A  SFX data
        DECLE   $0020,  $0020                   ; 6C6C  SFX data
        DECLE   $0020,  $0020                   ; 6C6E  SFX data
        DECLE   $0050,  $0052                   ; 6C70  SFX data
        DECLE   $004F,  $0047                   ; 6C72  SFX data
        DECLE   $0052                           ; 6C74  SFX data
        DECLE   $0041,  $004D                   ; 6C75  SFX data
        DECLE   $004D                           ; 6C77  SFX data
        DECLE   $0045                           ; 6C78  SFX data
        DECLE   $0044,  $0020                   ; 6C79  SFX data
        DECLE   $0042                           ; 6C7B  SFX data
        DECLE   $0059                           ; 6C7C  SFX data
        DECLE   $0020,  $004A                   ; 6C7D  SFX data
        DECLE   $004F,  $0048                   ; 6C7F  SFX data
        DECLE   $004E                           ; 6C81  SFX data
        DECLE   $0020,  $0054                   ; 6C82  SFX data
        DECLE   $004F,  $004D                   ; 6C84  SFX data
        DECLE   $004C,  $0049                   ; 6C86  SFX data
        DECLE   $004E                           ; 6C88  SFX data
        DECLE   $0053,  $004F                   ; 6C89  SFX data
        DECLE   $004E                           ; 6C8B  SFX data
        DECLE   $0020,  $0020                   ; 6C8C  SFX data
        DECLE   $0020,  $0020                   ; 6C8E  SFX data
        DECLE   $0020,  $0020                   ; 6C90  SFX data
        DECLE   $0020,  $0000                   ; 6C92  SFX data
        DECLE   $0020,  $0020                   ; 6C94  SFX data
        DECLE   $0020,  $0020                   ; 6C96  SFX data
        DECLE   $0020,  $0020                   ; 6C98  SFX data
        DECLE   $0050,  $0052                   ; 6C9A  SFX data
        DECLE   $004F,  $0047                   ; 6C9C  SFX data
        DECLE   $0052                           ; 6C9E  SFX data
        DECLE   $0041,  $004D                   ; 6C9F  SFX data
        DECLE   $004D                           ; 6CA1  SFX data
        DECLE   $0045                           ; 6CA2  SFX data
        DECLE   $0044,  $0020                   ; 6CA3  SFX data
        DECLE   $0042                           ; 6CA5  SFX data
        DECLE   $0059                           ; 6CA6  SFX data
        DECLE   $0020,  $004A                   ; 6CA7  SFX data
        DECLE   $004F,  $0048                   ; 6CA9  SFX data
        DECLE   $004E                           ; 6CAB  SFX data
        DECLE   $0020,  $0054                   ; 6CAC  SFX data
        DECLE   $004F,  $004D                   ; 6CAE  SFX data
        DECLE   $004C,  $0049                   ; 6CB0  SFX data
        DECLE   $004E                           ; 6CB2  SFX data
        DECLE   $0053,  $004F                   ; 6CB3  SFX data
        DECLE   $004E                           ; 6CB5  SFX data
        DECLE   $0020,  $0020                   ; 6CB6  SFX data
        DECLE   $0020,  $0020                   ; 6CB8  SFX data
        DECLE   $0020,  $0020                   ; 6CBA  SFX data
        DECLE   $0020,  $0000                   ; 6CBC  SFX data
        DECLE   $0020,  $0020                   ; 6CBE  SFX data
        DECLE   $0020,  $0020                   ; 6CC0  SFX data
        DECLE   $0020,  $0020                   ; 6CC2  SFX data
        DECLE   $0050,  $0052                   ; 6CC4  SFX data
        DECLE   $004F,  $0047                   ; 6CC6  SFX data
        DECLE   $0052                           ; 6CC8  SFX data
        DECLE   $0041,  $004D                   ; 6CC9  SFX data
        DECLE   $004D                           ; 6CCB  SFX data
        DECLE   $0045                           ; 6CCC  SFX data
        DECLE   $0044,  $0020                   ; 6CCD  SFX data
        DECLE   $0042                           ; 6CCF  SFX data
        DECLE   $0059                           ; 6CD0  SFX data
        DECLE   $0020,  $004A                   ; 6CD1  SFX data
        DECLE   $004F,  $0048                   ; 6CD3  SFX data
        DECLE   $004E                           ; 6CD5  SFX data
        DECLE   $0020,  $0054                   ; 6CD6  SFX data
        DECLE   $004F,  $004D                   ; 6CD8  SFX data
        DECLE   $004C,  $0049                   ; 6CDA  SFX data
        DECLE   $004E                           ; 6CDC  SFX data
        DECLE   $0053,  $004F                   ; 6CDD  SFX data
        DECLE   $004E                           ; 6CDF  SFX data
        DECLE   $0020,  $0020                   ; 6CE0  SFX data
        DECLE   $0020,  $0020                   ; 6CE2  SFX data
        DECLE   $0020,  $0020                   ; 6CE4  SFX data
        DECLE   $0020,  $0000                   ; 6CE6  SFX data
        DECLE   $0020,  $0020                   ; 6CE8  SFX data
        DECLE   $0020,  $0020                   ; 6CEA  SFX data
        DECLE   $0020,  $0020                   ; 6CEC  SFX data
        DECLE   $0050,  $0052                   ; 6CEE  SFX data
        DECLE   $004F,  $0047                   ; 6CF0  SFX data
        DECLE   $0052                           ; 6CF2  SFX data
        DECLE   $0041,  $004D                   ; 6CF3  SFX data
        DECLE   $004D                           ; 6CF5  SFX data
        DECLE   $0045                           ; 6CF6  SFX data
        DECLE   $0044,  $0020                   ; 6CF7  SFX data
        DECLE   $0042                           ; 6CF9  SFX data
        DECLE   $0059                           ; 6CFA  SFX data
        DECLE   $0020,  $004A                   ; 6CFB  SFX data
        DECLE   $004F,  $0048                   ; 6CFD  SFX data
        DECLE   $004E                           ; 6CFF  SFX data
        DECLE   $0020,  $0054                   ; 6D00  SFX data
        DECLE   $004F,  $004D                   ; 6D02  SFX data
        DECLE   $004C,  $0049                   ; 6D04  SFX data
        DECLE   $004E                           ; 6D06  SFX data
        DECLE   $0053,  $004F                   ; 6D07  SFX data
        DECLE   $004E                           ; 6D09  SFX data
        DECLE   $0020,  $0020                   ; 6D0A  SFX data
        DECLE   $0020,  $0020                   ; 6D0C  SFX data
        DECLE   $0020,  $0020                   ; 6D0E  SFX data
        DECLE   $0020,  $0000                   ; 6D10  SFX data
        DECLE   $0020,  $0020                   ; 6D12  SFX data
        DECLE   $0020,  $0020                   ; 6D14  SFX data
        DECLE   $0020,  $0020                   ; 6D16  SFX data
        DECLE   $0050,  $0052                   ; 6D18  SFX data
        DECLE   $004F,  $0047                   ; 6D1A  SFX data
        DECLE   $0052                           ; 6D1C  SFX data
        DECLE   $0041,  $004D                   ; 6D1D  SFX data
        DECLE   $004D                           ; 6D1F  SFX data
        DECLE   $0045                           ; 6D20  SFX data
        DECLE   $0044,  $0020                   ; 6D21  SFX data
        DECLE   $0042                           ; 6D23  SFX data
        DECLE   $0059                           ; 6D24  SFX data
        DECLE   $0020,  $004A                   ; 6D25  SFX data
        DECLE   $004F,  $0048                   ; 6D27  SFX data
        DECLE   $004E                           ; 6D29  SFX data
        DECLE   $0020,  $0054                   ; 6D2A  SFX data
        DECLE   $004F,  $004D                   ; 6D2C  SFX data
        DECLE   $004C,  $0049                   ; 6D2E  SFX data
        DECLE   $004E                           ; 6D30  SFX data
        DECLE   $0053,  $004F                   ; 6D31  SFX data
        DECLE   $004E                           ; 6D33  SFX data
        DECLE   $0020,  $0020                   ; 6D34  SFX data
        DECLE   $0020,  $0020                   ; 6D36  SFX data
        DECLE   $0020,  $0020                   ; 6D38  SFX data
        DECLE   $0020,  $0000                   ; 6D3A  SFX data
        DECLE   $0020,  $0020                   ; 6D3C  SFX data
        DECLE   $0020,  $0020                   ; 6D3E  SFX data
        DECLE   $0020,  $0020                   ; 6D40  SFX data
        DECLE   $0050,  $0052                   ; 6D42  SFX data
        DECLE   $004F,  $0047                   ; 6D44  SFX data
        DECLE   $0052                           ; 6D46  SFX data
        DECLE   $0041,  $004D                   ; 6D47  SFX data
        DECLE   $004D                           ; 6D49  SFX data
        DECLE   $0045                           ; 6D4A  SFX data
        DECLE   $0044,  $0020                   ; 6D4B  SFX data
        DECLE   $0042                           ; 6D4D  SFX data
        DECLE   $0059                           ; 6D4E  SFX data
        DECLE   $0020,  $004A                   ; 6D4F  SFX data
        DECLE   $004F,  $0048                   ; 6D51  SFX data
        DECLE   $004E                           ; 6D53  SFX data
        DECLE   $0020,  $0054                   ; 6D54  SFX data
        DECLE   $004F,  $004D                   ; 6D56  SFX data
        DECLE   $004C,  $0049                   ; 6D58  SFX data
        DECLE   $004E                           ; 6D5A  SFX data
        DECLE   $0053,  $004F                   ; 6D5B  SFX data
        DECLE   $004E                           ; 6D5D  SFX data
        DECLE   $0020,  $0020                   ; 6D5E  SFX data
        DECLE   $0020,  $0020                   ; 6D60  SFX data
        DECLE   $0020,  $0020                   ; 6D62  SFX data
        DECLE   $0020,  $0000                   ; 6D64  SFX data
        DECLE   $0020,  $0020                   ; 6D66  SFX data
        DECLE   $0020,  $0020                   ; 6D68  SFX data
        DECLE   $0020,  $0020                   ; 6D6A  SFX data
        DECLE   $0050,  $0052                   ; 6D6C  SFX data
        DECLE   $004F,  $0047                   ; 6D6E  SFX data
        DECLE   $0052                           ; 6D70  SFX data
        DECLE   $0041,  $004D                   ; 6D71  SFX data
        DECLE   $004D                           ; 6D73  SFX data
        DECLE   $0045                           ; 6D74  SFX data
        DECLE   $0044,  $0020                   ; 6D75  SFX data
        DECLE   $0042                           ; 6D77  SFX data
        DECLE   $0059                           ; 6D78  SFX data
        DECLE   $0020,  $004A                   ; 6D79  SFX data
        DECLE   $004F,  $0048                   ; 6D7B  SFX data
        DECLE   $004E                           ; 6D7D  SFX data
        DECLE   $0020,  $0054                   ; 6D7E  SFX data
        DECLE   $004F,  $004D                   ; 6D80  SFX data
        DECLE   $004C,  $0049                   ; 6D82  SFX data
        DECLE   $004E                           ; 6D84  SFX data
        DECLE   $0053,  $004F                   ; 6D85  SFX data
        DECLE   $004E                           ; 6D87  SFX data
        DECLE   $0020,  $0020                   ; 6D88  SFX data
        DECLE   $0020,  $0020                   ; 6D8A  SFX data
        DECLE   $0020,  $0020                   ; 6D8C  SFX data
        DECLE   $0020,  $0000                   ; 6D8E  SFX data
        DECLE   $0020,  $0020                   ; 6D90  SFX data
        DECLE   $0020,  $0020                   ; 6D92  SFX data
        DECLE   $0020,  $0020                   ; 6D94  SFX data
        DECLE   $0050,  $0052                   ; 6D96  SFX data
        DECLE   $004F,  $0047                   ; 6D98  SFX data
        DECLE   $0052                           ; 6D9A  SFX data
        DECLE   $0041,  $004D                   ; 6D9B  SFX data
        DECLE   $004D                           ; 6D9D  SFX data
        DECLE   $0045                           ; 6D9E  SFX data
        DECLE   $0044,  $0020                   ; 6D9F  SFX data
        DECLE   $0042                           ; 6DA1  SFX data
        DECLE   $0059                           ; 6DA2  SFX data
        DECLE   $0020,  $004A                   ; 6DA3  SFX data
        DECLE   $004F,  $0048                   ; 6DA5  SFX data
        DECLE   $004E                           ; 6DA7  SFX data
        DECLE   $0020,  $0054                   ; 6DA8  SFX data
        DECLE   $004F,  $004D                   ; 6DAA  SFX data
        DECLE   $004C,  $0049                   ; 6DAC  SFX data
        DECLE   $004E                           ; 6DAE  SFX data
        DECLE   $0053,  $004F                   ; 6DAF  SFX data
        DECLE   $004E                           ; 6DB1  SFX data
        DECLE   $0020,  $0020                   ; 6DB2  SFX data
        DECLE   $0020,  $0020                   ; 6DB4  SFX data
        DECLE   $0020,  $0020                   ; 6DB6  SFX data
        DECLE   $0020,  $0000                   ; 6DB8  SFX data
        DECLE   $0020,  $0020                   ; 6DBA  SFX data
        DECLE   $0020,  $0020                   ; 6DBC  SFX data
        DECLE   $0020,  $0020                   ; 6DBE  SFX data
        DECLE   $0050,  $0052                   ; 6DC0  SFX data
        DECLE   $004F,  $0047                   ; 6DC2  SFX data
        DECLE   $0052                           ; 6DC4  SFX data
        DECLE   $0041,  $004D                   ; 6DC5  SFX data
        DECLE   $004D                           ; 6DC7  SFX data
        DECLE   $0045                           ; 6DC8  SFX data
        DECLE   $0044,  $0020                   ; 6DC9  SFX data
        DECLE   $0042                           ; 6DCB  SFX data
        DECLE   $0059                           ; 6DCC  SFX data
        DECLE   $0020,  $004A                   ; 6DCD  SFX data
        DECLE   $004F,  $0048                   ; 6DCF  SFX data
        DECLE   $004E                           ; 6DD1  SFX data
        DECLE   $0020,  $0054                   ; 6DD2  SFX data
        DECLE   $004F,  $004D                   ; 6DD4  SFX data
        DECLE   $004C,  $0049                   ; 6DD6  SFX data
        DECLE   $004E                           ; 6DD8  SFX data
        DECLE   $0053,  $004F                   ; 6DD9  SFX data
        DECLE   $004E                           ; 6DDB  SFX data
        DECLE   $0020,  $0020                   ; 6DDC  SFX data
        DECLE   $0020,  $0020                   ; 6DDE  SFX data
        DECLE   $0020,  $0020                   ; 6DE0  SFX data
        DECLE   $0020,  $0000                   ; 6DE2  SFX data
        DECLE   $0020,  $0020                   ; 6DE4  SFX data
        DECLE   $0020,  $0020                   ; 6DE6  SFX data
        DECLE   $0020,  $0020                   ; 6DE8  SFX data
        DECLE   $0050,  $0052                   ; 6DEA  SFX data
        DECLE   $004F,  $0047                   ; 6DEC  SFX data
        DECLE   $0052                           ; 6DEE  SFX data
        DECLE   $0041,  $004D                   ; 6DEF  SFX data
        DECLE   $004D                           ; 6DF1  SFX data
        DECLE   $0045                           ; 6DF2  SFX data
        DECLE   $0044,  $0020                   ; 6DF3  SFX data
        DECLE   $0042                           ; 6DF5  SFX data
        DECLE   $0059                           ; 6DF6  SFX data
        DECLE   $0020,  $004A                   ; 6DF7  SFX data
        DECLE   $004F,  $0048                   ; 6DF9  SFX data
        DECLE   $004E                           ; 6DFB  SFX data
        DECLE   $0020,  $0054                   ; 6DFC  SFX data
        DECLE   $004F,  $004D                   ; 6DFE  SFX data
        DECLE   $004C,  $0049                   ; 6E00  SFX data
        DECLE   $004E                           ; 6E02  SFX data
        DECLE   $0053,  $004F                   ; 6E03  SFX data
        DECLE   $004E                           ; 6E05  SFX data
        DECLE   $0020,  $0020                   ; 6E06  SFX data
        DECLE   $0020,  $0020                   ; 6E08  SFX data
        DECLE   $0020,  $0020                   ; 6E0A  SFX data
        DECLE   $0020,  $0000                   ; 6E0C  SFX data
        DECLE   $0020,  $0020                   ; 6E0E  SFX data
        DECLE   $0020,  $0020                   ; 6E10  SFX data
        DECLE   $0020,  $0020                   ; 6E12  SFX data
        DECLE   $0050,  $0052                   ; 6E14  SFX data
        DECLE   $004F,  $0047                   ; 6E16  SFX data
        DECLE   $0052                           ; 6E18  SFX data
        DECLE   $0041,  $004D                   ; 6E19  SFX data
        DECLE   $004D                           ; 6E1B  SFX data
        DECLE   $0045                           ; 6E1C  SFX data
        DECLE   $0044,  $0020                   ; 6E1D  SFX data
        DECLE   $0042                           ; 6E1F  SFX data
        DECLE   $0059                           ; 6E20  SFX data
        DECLE   $0020,  $004A                   ; 6E21  SFX data
        DECLE   $004F,  $0048                   ; 6E23  SFX data
        DECLE   $004E                           ; 6E25  SFX data
        DECLE   $0020,  $0054                   ; 6E26  SFX data
        DECLE   $004F,  $004D                   ; 6E28  SFX data
        DECLE   $004C,  $0049                   ; 6E2A  SFX data
        DECLE   $004E                           ; 6E2C  SFX data
        DECLE   $0053,  $004F                   ; 6E2D  SFX data
        DECLE   $004E                           ; 6E2F  SFX data
        DECLE   $0020,  $0020                   ; 6E30  SFX data
        DECLE   $0020,  $0020                   ; 6E32  SFX data
        DECLE   $0020,  $0020                   ; 6E34  SFX data
        DECLE   $0020,  $0000                   ; 6E36  SFX data
        DECLE   $0020,  $0020                   ; 6E38  SFX data
        DECLE   $0020,  $0020                   ; 6E3A  SFX data
        DECLE   $0020,  $0020                   ; 6E3C  SFX data
        DECLE   $0050,  $0052                   ; 6E3E  SFX data
        DECLE   $004F,  $0047                   ; 6E40  SFX data
        DECLE   $0052                           ; 6E42  SFX data
        DECLE   $0041,  $004D                   ; 6E43  SFX data
        DECLE   $004D                           ; 6E45  SFX data
        DECLE   $0045                           ; 6E46  SFX data
        DECLE   $0044,  $0020                   ; 6E47  SFX data
        DECLE   $0042                           ; 6E49  SFX data
        DECLE   $0059                           ; 6E4A  SFX data
        DECLE   $0020,  $004A                   ; 6E4B  SFX data
        DECLE   $004F,  $0048                   ; 6E4D  SFX data
        DECLE   $004E                           ; 6E4F  SFX data
        DECLE   $0020,  $0054                   ; 6E50  SFX data
        DECLE   $004F,  $004D                   ; 6E52  SFX data
        DECLE   $004C,  $0049                   ; 6E54  SFX data
        DECLE   $004E                           ; 6E56  SFX data
        DECLE   $0053,  $004F                   ; 6E57  SFX data
        DECLE   $004E                           ; 6E59  SFX data
        DECLE   $0020,  $0020                   ; 6E5A  SFX data
        DECLE   $0020,  $0020                   ; 6E5C  SFX data
        DECLE   $0020,  $0020                   ; 6E5E  SFX data
        DECLE   $0020,  $0000                   ; 6E60  SFX data
        DECLE   $0020,  $0020                   ; 6E62  SFX data
        DECLE   $0020,  $0020                   ; 6E64  SFX data
        DECLE   $0020,  $0020                   ; 6E66  SFX data
        DECLE   $0050,  $0052                   ; 6E68  SFX data
        DECLE   $004F,  $0047                   ; 6E6A  SFX data
        DECLE   $0052                           ; 6E6C  SFX data
        DECLE   $0041,  $004D                   ; 6E6D  SFX data
        DECLE   $004D                           ; 6E6F  SFX data
        DECLE   $0045                           ; 6E70  SFX data
        DECLE   $0044,  $0020                   ; 6E71  SFX data
        DECLE   $0042                           ; 6E73  SFX data
        DECLE   $0059                           ; 6E74  SFX data
        DECLE   $0020,  $004A                   ; 6E75  SFX data
        DECLE   $004F,  $0048                   ; 6E77  SFX data
        DECLE   $004E                           ; 6E79  SFX data
        DECLE   $0020,  $0054                   ; 6E7A  SFX data
        DECLE   $004F,  $004D                   ; 6E7C  SFX data
        DECLE   $004C,  $0049                   ; 6E7E  SFX data
        DECLE   $004E                           ; 6E80  SFX data
        DECLE   $0053,  $004F                   ; 6E81  SFX data
        DECLE   $004E                           ; 6E83  SFX data
        DECLE   $0020,  $0020                   ; 6E84  SFX data
        DECLE   $0020,  $0020                   ; 6E86  SFX data
        DECLE   $0020,  $0020                   ; 6E88  SFX data
        DECLE   $0020,  $0000                   ; 6E8A  SFX data
        DECLE   $0020,  $0020                   ; 6E8C  SFX data
        DECLE   $0020,  $0020                   ; 6E8E  SFX data
        DECLE   $0020,  $0020                   ; 6E90  SFX data
        DECLE   $0050,  $0052                   ; 6E92  SFX data
        DECLE   $004F,  $0047                   ; 6E94  SFX data
        DECLE   $0052                           ; 6E96  SFX data
        DECLE   $0041,  $004D                   ; 6E97  SFX data
        DECLE   $004D                           ; 6E99  SFX data
        DECLE   $0045                           ; 6E9A  SFX data
        DECLE   $0044,  $0020                   ; 6E9B  SFX data
        DECLE   $0042                           ; 6E9D  SFX data
        DECLE   $0059                           ; 6E9E  SFX data
        DECLE   $0020,  $004A                   ; 6E9F  SFX data
        DECLE   $004F,  $0048                   ; 6EA1  SFX data
        DECLE   $004E                           ; 6EA3  SFX data
        DECLE   $0020,  $0054                   ; 6EA4  SFX data
        DECLE   $004F,  $004D                   ; 6EA6  SFX data
        DECLE   $004C,  $0049                   ; 6EA8  SFX data
        DECLE   $004E                           ; 6EAA  SFX data
        DECLE   $0053,  $004F                   ; 6EAB  SFX data
        DECLE   $004E                           ; 6EAD  SFX data
        DECLE   $0020,  $0020                   ; 6EAE  SFX data
        DECLE   $0020,  $0020                   ; 6EB0  SFX data
        DECLE   $0020,  $0020                   ; 6EB2  SFX data
        DECLE   $0020,  $0000                   ; 6EB4  SFX data
        DECLE   $0020,  $0020                   ; 6EB6  SFX data
        DECLE   $0020,  $0020                   ; 6EB8  SFX data
        DECLE   $0020,  $0020                   ; 6EBA  SFX data
        DECLE   $0050,  $0052                   ; 6EBC  SFX data
        DECLE   $004F,  $0047                   ; 6EBE  SFX data
        DECLE   $0052                           ; 6EC0  SFX data
        DECLE   $0041,  $004D                   ; 6EC1  SFX data
        DECLE   $004D                           ; 6EC3  SFX data
        DECLE   $0045                           ; 6EC4  SFX data
        DECLE   $0044,  $0020                   ; 6EC5  SFX data
        DECLE   $0042                           ; 6EC7  SFX data
        DECLE   $0059                           ; 6EC8  SFX data
        DECLE   $0020,  $004A                   ; 6EC9  SFX data
        DECLE   $004F,  $0048                   ; 6ECB  SFX data
        DECLE   $004E                           ; 6ECD  SFX data
        DECLE   $0020,  $0054                   ; 6ECE  SFX data
        DECLE   $004F,  $004D                   ; 6ED0  SFX data
        DECLE   $004C,  $0049                   ; 6ED2  SFX data
        DECLE   $004E                           ; 6ED4  SFX data
        DECLE   $0053,  $004F                   ; 6ED5  SFX data
        DECLE   $004E                           ; 6ED7  SFX data
        DECLE   $0020,  $0020                   ; 6ED8  SFX data
        DECLE   $0020,  $0020                   ; 6EDA  SFX data
        DECLE   $0020,  $0020                   ; 6EDC  SFX data
        DECLE   $0020,  $0000                   ; 6EDE  SFX data
        DECLE   $0020,  $0020                   ; 6EE0  SFX data
        DECLE   $0020,  $0020                   ; 6EE2  SFX data
        DECLE   $0020,  $0020                   ; 6EE4  SFX data
        DECLE   $0050,  $0052                   ; 6EE6  SFX data
        DECLE   $004F,  $0047                   ; 6EE8  SFX data
        DECLE   $0052                           ; 6EEA  SFX data
        DECLE   $0041,  $004D                   ; 6EEB  SFX data
        DECLE   $004D                           ; 6EED  SFX data
        DECLE   $0045                           ; 6EEE  SFX data
        DECLE   $0044,  $0020                   ; 6EEF  SFX data
        DECLE   $0042                           ; 6EF1  SFX data
        DECLE   $0059                           ; 6EF2  SFX data
        DECLE   $0020,  $004A                   ; 6EF3  SFX data
        DECLE   $004F,  $0048                   ; 6EF5  SFX data
        DECLE   $004E                           ; 6EF7  SFX data
        DECLE   $0020,  $0054                   ; 6EF8  SFX data
        DECLE   $004F,  $004D                   ; 6EFA  SFX data
        DECLE   $004C,  $0049                   ; 6EFC  SFX data
        DECLE   $004E                           ; 6EFE  SFX data
        DECLE   $0053,  $004F                   ; 6EFF  SFX data
        DECLE   $004E                           ; 6F01  SFX data
        DECLE   $0020,  $0020                   ; 6F02  SFX data
        DECLE   $0020,  $0020                   ; 6F04  SFX data
        DECLE   $0020,  $0020                   ; 6F06  SFX data
        DECLE   $0020,  $0000                   ; 6F08  SFX data
        DECLE   $0020,  $0020                   ; 6F0A  SFX data
        DECLE   $0020,  $0020                   ; 6F0C  SFX data
        DECLE   $0020,  $0020                   ; 6F0E  SFX data
        DECLE   $0050,  $0052                   ; 6F10  SFX data
        DECLE   $004F,  $0047                   ; 6F12  SFX data
        DECLE   $0052                           ; 6F14  SFX data
        DECLE   $0041,  $004D                   ; 6F15  SFX data
        DECLE   $004D                           ; 6F17  SFX data
        DECLE   $0045                           ; 6F18  SFX data
        DECLE   $0044,  $0020                   ; 6F19  SFX data
        DECLE   $0042                           ; 6F1B  SFX data
        DECLE   $0059                           ; 6F1C  SFX data
        DECLE   $0020,  $004A                   ; 6F1D  SFX data
        DECLE   $004F,  $0048                   ; 6F1F  SFX data
        DECLE   $004E                           ; 6F21  SFX data
        DECLE   $0020,  $0054                   ; 6F22  SFX data
        DECLE   $004F,  $004D                   ; 6F24  SFX data
        DECLE   $004C,  $0049                   ; 6F26  SFX data
        DECLE   $004E                           ; 6F28  SFX data
        DECLE   $0053,  $004F                   ; 6F29  SFX data
        DECLE   $004E                           ; 6F2B  SFX data
        DECLE   $0020,  $0020                   ; 6F2C  SFX data
        DECLE   $0020,  $0020                   ; 6F2E  SFX data
        DECLE   $0020,  $0020                   ; 6F30  SFX data
        DECLE   $0020,  $0000                   ; 6F32  SFX data
        DECLE   $0020,  $0020                   ; 6F34  SFX data
        DECLE   $0020,  $0020                   ; 6F36  SFX data
        DECLE   $0020,  $0020                   ; 6F38  SFX data
        DECLE   $0050,  $0052                   ; 6F3A  SFX data
        DECLE   $004F,  $0047                   ; 6F3C  SFX data
        DECLE   $0052                           ; 6F3E  SFX data
        DECLE   $0041,  $004D                   ; 6F3F  SFX data
        DECLE   $004D                           ; 6F41  SFX data
        DECLE   $0045                           ; 6F42  SFX data
        DECLE   $0044,  $0020                   ; 6F43  SFX data
        DECLE   $0042                           ; 6F45  SFX data
        DECLE   $0059                           ; 6F46  SFX data
        DECLE   $0020,  $004A                   ; 6F47  SFX data
        DECLE   $004F,  $0048                   ; 6F49  SFX data
        DECLE   $004E                           ; 6F4B  SFX data
        DECLE   $0020,  $0054                   ; 6F4C  SFX data
        DECLE   $004F,  $004D                   ; 6F4E  SFX data
        DECLE   $004C,  $0049                   ; 6F50  SFX data
        DECLE   $004E                           ; 6F52  SFX data
        DECLE   $0053,  $004F                   ; 6F53  SFX data
        DECLE   $004E                           ; 6F55  SFX data
        DECLE   $0020,  $0020                   ; 6F56  SFX data
        DECLE   $0020,  $0020                   ; 6F58  SFX data
        DECLE   $0020,  $0020                   ; 6F5A  SFX data
        DECLE   $0020,  $0000                   ; 6F5C  SFX data
        DECLE   $0020,  $0020                   ; 6F5E  SFX data
        DECLE   $0020,  $0020                   ; 6F60  SFX data
        DECLE   $0020,  $0020                   ; 6F62  SFX data
        DECLE   $0050,  $0052                   ; 6F64  SFX data
        DECLE   $004F,  $0047                   ; 6F66  SFX data
        DECLE   $0052                           ; 6F68  SFX data
        DECLE   $0041,  $004D                   ; 6F69  SFX data
        DECLE   $004D                           ; 6F6B  SFX data
        DECLE   $0045                           ; 6F6C  SFX data
        DECLE   $0044,  $0020                   ; 6F6D  SFX data
        DECLE   $0042                           ; 6F6F  SFX data
        DECLE   $0059                           ; 6F70  SFX data
        DECLE   $0020,  $004A                   ; 6F71  SFX data
        DECLE   $004F,  $0048                   ; 6F73  SFX data
        DECLE   $004E                           ; 6F75  SFX data
        DECLE   $0020,  $0054                   ; 6F76  SFX data
        DECLE   $004F,  $004D                   ; 6F78  SFX data
        DECLE   $004C,  $0049                   ; 6F7A  SFX data
        DECLE   $004E                           ; 6F7C  SFX data
        DECLE   $0053,  $004F                   ; 6F7D  SFX data
        DECLE   $004E                           ; 6F7F  SFX data
        DECLE   $0020,  $0020                   ; 6F80  SFX data
        DECLE   $0020,  $0020                   ; 6F82  SFX data
        DECLE   $0020,  $0020                   ; 6F84  SFX data
        DECLE   $0020,  $0000                   ; 6F86  SFX data
        DECLE   $0020,  $0020                   ; 6F88  SFX data
        DECLE   $0020,  $0020                   ; 6F8A  SFX data
        DECLE   $0020,  $0020                   ; 6F8C  SFX data
        DECLE   $0050,  $0052                   ; 6F8E  SFX data
        DECLE   $004F,  $0047                   ; 6F90  SFX data
        DECLE   $0052                           ; 6F92  SFX data
        DECLE   $0041,  $004D                   ; 6F93  SFX data
        DECLE   $004D                           ; 6F95  SFX data
        DECLE   $0045                           ; 6F96  SFX data
        DECLE   $0044,  $0020                   ; 6F97  SFX data
        DECLE   $0042                           ; 6F99  SFX data
        DECLE   $0059                           ; 6F9A  SFX data
        DECLE   $0020,  $004A                   ; 6F9B  SFX data
        DECLE   $004F,  $0048                   ; 6F9D  SFX data
        DECLE   $004E                           ; 6F9F  SFX data
        DECLE   $0020,  $0054                   ; 6FA0  SFX data
        DECLE   $004F,  $004D                   ; 6FA2  SFX data
        DECLE   $004C,  $0049                   ; 6FA4  SFX data
        DECLE   $004E                           ; 6FA6  SFX data
        DECLE   $0053,  $004F                   ; 6FA7  SFX data
        DECLE   $004E                           ; 6FA9  SFX data
        DECLE   $0020,  $0020                   ; 6FAA  SFX data
        DECLE   $0020,  $0020                   ; 6FAC  SFX data
        DECLE   $0020,  $0020                   ; 6FAE  SFX data
        DECLE   $0020,  $0000                   ; 6FB0  SFX data
        DECLE   $0000,  $0000                   ; 6FB2  SFX data
        DECLE   $0000,  $0000                   ; 6FB4  SFX data
        DECLE   $0000,  $0000                   ; 6FB6  SFX data
        DECLE   $0000,  $0000                   ; 6FB8  SFX data
        DECLE   $0000,  $0000                   ; 6FBA  SFX data
        DECLE   $0000,  $0000                   ; 6FBC  SFX data
        DECLE   $0000,  $0000                   ; 6FBE  SFX data
        DECLE   $0000,  $0000                   ; 6FC0  SFX data
        DECLE   $0000,  $0000                   ; 6FC2  SFX data
        DECLE   $0000,  $0000                   ; 6FC4  SFX data
        DECLE   $0000,  $0000                   ; 6FC6  SFX data
        DECLE   $0000,  $0000                   ; 6FC8  SFX data
        DECLE   $0000,  $0000                   ; 6FCA  SFX data
        DECLE   $0000,  $0000                   ; 6FCC  SFX data
        DECLE   $0000,  $0000                   ; 6FCE  SFX data
        DECLE   $0000,  $0000                   ; 6FD0  SFX data
        DECLE   $0000,  $0000                   ; 6FD2  SFX data
        DECLE   $0000,  $0000                   ; 6FD4  SFX data
        DECLE   $0000,  $0000                   ; 6FD6  SFX data
        DECLE   $0000,  $0000                   ; 6FD8  SFX data
        DECLE   $0000,  $0000                   ; 6FDA  SFX data
        DECLE   $0000,  $0000                   ; 6FDC  SFX data
        DECLE   $0000,  $0000                   ; 6FDE  SFX data
        DECLE   $0000,  $0000                   ; 6FE0  SFX data
        DECLE   $0000,  $0000                   ; 6FE2  SFX data
        DECLE   $0000,  $0000                   ; 6FE4  SFX data
        DECLE   $0000,  $0000                   ; 6FE6  SFX data
        DECLE   $0000,  $0000                   ; 6FE8  SFX data
        DECLE   $0000,  $0000                   ; 6FEA  SFX data
        DECLE   $0000,  $0000                   ; 6FEC  SFX data
        DECLE   $0000,  $0000                   ; 6FEE  SFX data
        DECLE   $0000,  $0000                   ; 6FF0  SFX data
        DECLE   $0000,  $0000                   ; 6FF2  SFX data
        DECLE   $0000,  $0000                   ; 6FF4  SFX data
        DECLE   $0000,  $0000                   ; 6FF6  SFX data
        DECLE   $0000,  $0000                   ; 6FF8  SFX data
        DECLE   $0000,  $0000                   ; 6FFA  SFX data
        DECLE   $0000,  $0000                   ; 6FFC  SFX data
        DECLE   $0000,  $0000                   ; 6FFE  SFX data
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5044       <entry>
;;  $508F       $5098  
;;  $5097       $5091  
;;  $509E       $50A7  
;;  $50A6       $50A0  
;;  $50F9       $50AF   $50B7  
;;  $5109       <entry> $5E19  
;;  $511B       $511D  
;;  $514F       $5164  
;;  $5172       $5177  
;;  $51AA       $51A7  
;;  $51AC       $51A2  
;;  $51E7       $51B0   $51B9   $51BE   $51C7   $51CB   $51D0  
;;  $51FC       $51EA  
;;  $520D       $520A  
;;  $5215       $5211  
;;  $5234       $522F  
;;  $525E       $524E  
;;  $5274       $5201  
;;  $5286       $529B  
;;  $52AA       $51EC   $525C   $5264   $5272  
;;  $52BB       $52B5   $52E1  
;;  $52CD       $52C1  
;;  $52E0       $52D6  
;;  $5306       $5195   $5248  
;;  $5314       $530B  
;;  $531A       $5312  
;;  $532E       $5328  
;;  $5330       $532C  
;;  $5332       $52F1   $52FA  
;;  $5344       $52E3  
;;  $534E       $53AC  
;;  $5375       $536D  
;;  $537B       $5368  
;;  $538E       $5386  
;;  $5394       $5381  
;;  $539F       $5397  
;;  $53A3       $5373   $5379   $538C   $5392   $539D  
;;  $53A6       $535C   $5360  
;;  $53AE       $534C   $53A4  
;;  $53AF       $52BB  
;;  $53C0       $53B6  
;;  $53C5       $53BE  
;;  $53DF       $52CD   $52D0  
;;  $53F3       $52E6  
;;  $53F6       $53FD   $5406   $543D   $5449   $5452   $545A  
;;  $541E       $5416  
;;  $5422       $541C  
;;  $5439       $5430  
;;  $544B       $5442  
;;  $5454       $5444  
;;  $5457       $542E   $5437  
;;  $545C       $53F8  
;;  $545D       $5340  
;;  $5473       $5486   $54C4  
;;  $5481       $5483  
;;  $5495       $5497  
;;  $54A0       $54B0  
;;  $54BD       $54AB  
;;  $54C6       $5461  
;;  $54CB       $54CD  
;;  $54CF       $5474   $54C2  
;;  $54D2       $5241   $5D63   $5DF0  
;;  $54DD       $54E3  
;;  $54F6       $54F0  
;;  $54FA       $54EA   $54F4  
;;  $5536       $5526   $5530  
;;  $5542       $5555  
;;  $554F       $554B  
;;  $5557       $5539   $553D   $5551  
;;  $5579       $54E0  
;;  $55DF       $52C9   $52DC   $53E4   $53ED  
;;  $55F5       $55ED  
;;  $55F9       $55F3  
;;  $55FD       $55E8  
;;  $560D       $5605  
;;  $5611       $560B  
;;  $5618       $55E4   $55FF  
;;  $561A       $55FB   $5616  
;;  $5628       $562A  
;;  $5632       $5625  
;;  $5636       $5639  
;;  $563F       $5630  
;;  $5643       $5646  
;;  $5651       $5103   $533B   $564D  
;;  $565C       $5338  
;;  $5667       $519B   $566B   $5684  
;;  $58C1       $58BF  
;;  $5B76       $5BD4  
;;  $5B85       $5B90  
;;  $5B97       $5B88   $5B8C  
;;  $5BA6       $5BA6  
;;  $5BC6       $5BC0  
;;  $5BC7       $5BC4  
;;  $5BCF       $5B95  
;;  $5BD3       <entry>
;;  $5BE4       $5BDB  
;;  $5BFC       $5BFC  
;;  $5C04       $5CD5   $5D1E   $5F98  
;;  $5C4B       $5C41  
;;  $5C66       $5C49  
;;  $5C7B       $5C68   $5CBA  
;;  $5C98       $5C92  
;;  $5CB6       $5C80   $5C88  
;;  $5CC9       $5CCB  
;;  $5CDA       $5CD3  
;;  $5CFA       $5CF6  
;;  $5CFF       $5CE1   $5CEA   $5CF4  
;;  $5D18       $5D14  
;;  $5D1E       $5D09  
;;  $5D21       $5D05   $5D0E   $5D1C  
;;  $5D22       $5FF5  
;;  $5D39       $5D3B  
;;  $5D8D       $5D7A  
;;  $5DBA       $5D89  
;;  $5DC3       $5DC9  
;;  $5DDC       $5DD6  
;;  $5DE0       $5DD0   $5DDA  
;;  $5DF3       $5DC6  
;;  $5DF9       $5DFB  
;;  $5E29       $5E24  
;;  $5E38       $5E2D   $5E32  
;;  $5E46       $5E36  
;;  $5E64       $5E1E   $5E3B   $5E40  
;;  $5E65       <entry>
;;  $5E89       $5E7E  
;;  $5E99       $5E70   $5E87   $5E94  
;;  $5EA3       $5E76  
;;  $5EB9       $5EAE  
;;  $5EC5       $5E73   $5EA1   $5EA6   $5EB7   $5EC0  
;;  $5EC6       $5EBC  
;;  $5EC8       $5E90  
;;  $5EE5       $5EE3  
;;  $5F08       $5EFB   $5F00  
;;  $5F16       $5F06  
;;  $5F3A       $5EF6   $5F0B   $5F10  
;;  $5F64       $5F62  
;;  $5F7D       $5F40   $5F48  
;;  $5F9B       $5F96  
;;  $5F9C       $5F4A  
;;  $5FA6       $5ECC  
;;  $5FC4       $5FC7  
;;  $5FEB       $5FE8  
;;  $5FF2       $5FDF  
;;  $5FF8       $5FD4   $5FD8  
;;  $600A       $6003  
;;  $600C       $5FFE   $6008  
;;  $6011       $51D6   $5F51  
;;  $6030       $6026  
;;  $6059       $601C   $602E   $604E   $6054  
;;  $6071       $6069  
;;  $6080       $5FF0   $5FFA   $6077  
;;  $6094       <entry>
;;  $609F       $6098  
;;  $60B4       $60AE  
;;  $60D1       $60C3   $60C9  
;;  $60D7       $60DF  
;;  $60EB       $60DC  
;;  $60F6       $60FE  
;;  $6100       $60FA  
;;  $6112       $610C  
;;  $614E       $614B  
;;  $6154       $609D   $60BB   $60CF   $60E9   $613D  
;;  $6169       $6169  
;;  $6171       $616F  
;;  $617E       $617E  
;;  $61E5       <entry>
;;  $61EA       $620D  
;;  $620C       $61EC   $61FB   $61FF   $6209  
;;  $6210       $5D66   $5F7A   $5FAA  
;; ======================================================================== ;;
