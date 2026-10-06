
        ORG     $5000
.HEADER:
        BIDECLE $563A           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5057           ; 5004  Ptr: Start of game
        BIDECLE $50E9           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $592A           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502C           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $000D,  $0008   ; 500F  Color Stack init (0, 1)
        DECLE   $000D,  $0008   ; 5011  Color Stack init (2, 3)
        DECLE   $000D           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $003B,  $0052,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00B1,  $0050,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0003,  $0053,  $0001,  $0000; 5024  Timer dispatch/interval
        BIDECLE $0000           ; 5028  End of timer table

        DECLE   $0000,  $0000                   ; 502A   0000 0000
.TITLE:
        DECLE   $0052                           ; 502C  Cartridge year
        STRING  "GRID SHOCK"                    ; 502D  Title string
        DECLE   $0000                           ; 5037  

.TITLECODE:
        PSHR    R5                              ; 5038   0275
        MVII    #$0007, R3                      ; 5039   02BB 0007
        MVII    #$023D, R4                      ; 503B   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 503D   0004 0118 007B
        STRING  "MATTEL ELECTRONICS"            ; 5040  
        DECLE   $0000                           ; 5052   0000

        JSR     R5,     L_521B                  ; 5053   0004 0150 021B

        PULR    R7                              ; 5056   02B7

.START:
        PSHR    R5                              ; 5057   0275
        CLRR    R1                              ; 5058   01C9
        MVO     R1,     G_0171                  ; 5059   0241 0171
        MVO     R1,     G_0170                  ; 505B   0241 0170
        MVII    #$001E, R1                      ; 505D   02B9 001E
        MVO     R1,     G_016D                  ; 505F   0241 016D
        MVII    #$000E, R2                      ; 5061   02BA 000E
        MVO     R2,     G_0115                  ; 5063   0242 0115
        CLRR    R0                              ; 5065   01C0
        SDBD                                    ; 5066   0001
        MVII    #$517D, R1                      ; 5067   02B9 007D 0051
        MVII    #$0004, R2                      ; 506A   02BA 0004
        SDBD                                    ; 506C   0001
        MVII    #$0020, R3                      ; 506D   02BB 0020 0000
        SDBD                                    ; 5070   0001
        MVII    #$0029, R4                      ; 5071   02BC 0029 0000

        JSR     R5,     L_51C1                  ; 5074   0004 0150 01C1

        MVII    #$031D, R2                      ; 5077   02BA 031D
        SDBD                                    ; 5079   0001
        MVII    #$5565, R1                      ; 507A   02B9 0065 0055
        MVII    #$0008, R0                      ; 507D   02B8 0008

        JSR     R5,     X_INIT_MOBS             ; 507F   0004 0114 02B4

        MVII    #$0005, R0                      ; 5082   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 5084   0004 0114 02CF

        SDBD                                    ; 5087   0001
        MVII    #$5093, R0                      ; 5088   02B8 0093 0050
        MVO     R0,     G_035D                  ; 508B   0240 035D

        JSR     R5,     L_50A1                  ; 508D   0004 0150 00A1

        MVO     R6,     G_015D                  ; 5090   0246 015D
        PULR    R7                              ; 5092   02B7

        DECLE   $00EE,  $0052,  $0000,  $0000   ; 5093   00EE 0052 0000 0000
        DECLE   $0001,  $005A,  $00E6,  $0052   ; 5097   0001 005A 00E6 0052
        DECLE   $00D9,  $0052,  $005F,  $006F   ; 509B   00D9 0052 005F 006F
        DECLE   $00B5,  $0000                   ; 509F   00B5 0000
L_50A1:
        PSHR    R5                              ; 50A1   0275
        MVII    #$00D1, R0                      ; 50A2   02B8 00D1
        SDBD                                    ; 50A4   0001
        MVII    #$509D, R1                      ; 50A5   02B9 009D 0050
        CLRR    R2                              ; 50A8   01D2

        JSR     R5,     L_51C1                  ; 50A9   0004 0150 01C1

        MVII    #$0001, R2                      ; 50AC   02BA 0001
        MVO     R2,     G_0171                  ; 50AE   0242 0171
        PULR    R7                              ; 50B0   02B7

L_50B1:
        PSHR    R5                              ; 50B1   0275
        MVI     G_0160, R1                      ; 50B2   0281 0160
        TSTR    R1                              ; 50B4   0089
        BEQ     L_50BD                          ; 50B5   0204 0006

        CLRR    R1                              ; 50B7   01C9
        MVO     R1,     G_0160                  ; 50B8   0241 0160

        JSR     R5,     L_50BE                  ; 50BA   0004 0150 00BE

L_50BD:
        PULR    R7                              ; 50BD   02B7

L_50BE:
        PSHR    R5                              ; 50BE   0275
        CLRR    R2                              ; 50BF   01D2
        MVII    #$015D, R4                      ; 50C0   02BC 015D
L_50C2:
        INCR    R2                              ; 50C2   000A
        CMPI    #$0003, R2                      ; 50C3   037A 0003
        BGT     L_50CD                          ; 50C5   020E 0006

        MVI@    R4,     R0                      ; 50C7   02A0
        TSTR    R0                              ; 50C8   0080
        BEQ     L_50D0                          ; 50C9   0204 0005
        B       L_50C2                          ; 50CB   0220 000A

L_50CD:
        MVO     R6,     G_0160                  ; 50CD   0246 0160
        PULR    R7                              ; 50CF   02B7

L_50D0:
        PSHR    R2                              ; 50D0   0272
        DECR    R4                              ; 50D1   0014
        MVO@    R6,     R4                      ; 50D2   0266

        JSR     R5,     L_50A1                  ; 50D3   0004 0150 00A1

        PULR    R2                              ; 50D6   02B2
        SLL     R2,     2                       ; 50D7   004E
        SLL     R2,     1                       ; 50D8   004A
        ADDI    #$031D, R2                      ; 50D9   02FA 031D
        SDBD                                    ; 50DB   0001
        MVII    #$5575, R4                      ; 50DC   02BC 0075 0055
        MOVR    R2,     R5                      ; 50DF   0095
        MVII    #$0008, R1                      ; 50E0   02B9 0008
L_50E2:
        SDBD                                    ; 50E2   0001
        MVI@    R4,     R2                      ; 50E3   02A2
        MVO@    R2,     R5                      ; 50E4   026A
        DECR    R1                              ; 50E5   0011
        BNEQ    L_50E2                          ; 50E6   022C 0005
        PULR    R7                              ; 50E8   02B7

.GFX_LIST_50E9:
        DECLE   $00FF,  $0080,  $0080,  $0080   ; 50E9  CART PIC #00
        DECLE   $0080,  $0080,  $0080,  $0080   ; 50ED  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50F1  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0080   ; 50F5  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50F9  CART PIC #02
        DECLE   $0000,  $0000,  $0003,  $0003   ; 50FD  
        DECLE   $00C0,  $00E0,  $00F0,  $00F8   ; 5101  CART PIC #03
        DECLE   $00FC,  $00FE,  $00FF,  $00FF   ; 5105  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5109  CART PIC #04
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 510D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5111  CART PIC #05
        DECLE   $0001,  $0007,  $001F,  $007F   ; 5115  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5119  CART PIC #06
        DECLE   $00C0,  $00F0,  $00FC,  $00FE   ; 511D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5121  CART PIC #07
        DECLE   $0000,  $0000,  $001F,  $0000   ; 5125  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5129  CART PIC #08
        DECLE   $00F8,  $00C0,  $0000,  $0000   ; 512D  
        DECLE   $00FF,  $00FF,  $00F8,  $0080   ; 5131  CART PIC #09
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5135  
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5139  CART PIC #0A
        DECLE   $0003,  $0003,  $0000,  $0000   ; 513D  
        DECLE   $0005,  $0018,  $0008,  $0018   ; 5141   0005 0018 0008 0018
        DECLE   $0016,  $0008,  $0018,  $0008   ; 5145   0016 0008 0018 0008
        DECLE   $0026,  $0008,  $0028,  $0018   ; 5149   0026 0008 0028 0018
        DECLE   $0030,  $0018,  $0038,  $0018   ; 514D   0030 0018 0038 0018
        DECLE   $0046,  $0008,  $004E,  $0008   ; 5151   0046 0008 004E 0008
        DECLE   $0050,  $0008,  $0058,  $0018   ; 5155   0050 0008 0058 0018
        DECLE   $0060,  $0008,  $0068,  $0018   ; 5159   0060 0008 0068 0018
        DECLE   $0070,  $0018,  $0078,  $0028   ; 515D   0070 0018 0078 0028
        DECLE   $0080,  $0018,  $0088,  $0018   ; 5161   0080 0018 0088 0018
        DECLE   $0090,  $0008,  $0098,  $0018   ; 5165   0090 0008 0098 0018
        DECLE   $00A6,  $0008,  $00AE,  $0008   ; 5169   00A6 0008 00AE 0008
        DECLE   $00B0,  $0018,  $00B8,  $0008   ; 516D   00B0 0018 00B8 0008
        DECLE   $00C0,  $0008,  $0008,  $0008   ; 5171   00C0 0008 0008 0008
        DECLE   $0008,  $0038,  $00C8,  $0018   ; 5175   0008 0038 00C8 0018
        DECLE   $00D0,  $0018,  $00D8,  $0008   ; 5179   00D0 0018 00D8 0008
        DECLE   $0002,  $0055,  $0053,  $0004   ; 517D   0002 0055 0053 0004
        DECLE   $0291,  $0045,  $0002,  $0069   ; 5181   0291 0045 0002 0069
        DECLE   $0059,  $0002,  $0002,  $0071   ; 5185   0059 0002 0002 0071
        DECLE   $0057,  $0053,  $0002,  $0291   ; 5189   0057 0053 0002 0291
        DECLE   $0045,  $0069,  $0067,  $0047   ; 518D   0045 0069 0067 0047
        DECLE   $0002,  $0002,  $0071,  $0043   ; 5191   0002 0002 0071 0043
        DECLE   $0057,  $0002,  $0291,  $0045   ; 5195   0057 0002 0291 0045
        DECLE   $0067,  $0043,  $0047,  $0002   ; 5199   0067 0043 0047 0002
        DECLE   $0002,  $0071,  $0083,  $0002   ; 519D   0002 0071 0083 0002
        DECLE   $0291,  $0045,  $0083,  $0047   ; 51A1   0291 0045 0083 0047
        DECLE   $0002,  $0002,  $0065,  $0061   ; 51A5   0002 0002 0065 0061
        DECLE   $0063,  $0002,  $0289,  $006B   ; 51A9   0063 0002 0289 006B
        DECLE   $0077,  $0079,  $007B,  $0002   ; 51AD   0077 0079 007B 0002
        DECLE   $0004,  $005B,  $006D,  $0303   ; 51B1   0004 005B 006D 0303
        DECLE   $004F,  $004D,  $0004,  $005B   ; 51B5   004F 004D 0004 005B
        DECLE   $006D,  $03C3,  $0043,  $004F   ; 51B9   006D 03C3 0043 004F
        DECLE   $005D,  $02B3,  $02B3,  $0000   ; 51BD   005D 02B3 02B3 0000
L_51C1:
        PSHR    R5                              ; 51C1   0275
        MVII    #$0164, R5                      ; 51C2   02BD 0164
        MVO@    R1,     R5                      ; 51C4   0269
        SWAP    R1,     1                       ; 51C5   0041
        MVO@    R1,     R5                      ; 51C6   0269
        CLRR    R1                              ; 51C7   01C9
        MVII    #$0200, R5                      ; 51C8   02BD 0200
        ADDR    R0,     R5                      ; 51CA   00C5
        TSTR    R2                              ; 51CB   0092
        BEQ     L_51E4                          ; 51CC   0204 0016

        MVO     R2,     G_0163                  ; 51CE   0242 0163
        MVO     R3,     G_0161                  ; 51D0   0243 0161
        MVO     R4,     G_0162                  ; 51D2   0244 0162
        B       L_51E6                          ; 51D4   0200 0010

L_51D6:
        MVI     G_0162, R2                      ; 51D6   0282 0162
        CMPR    R2,     R1                      ; 51D8   0151
        BLT     L_51E6                          ; 51D9   0205 000B

        MVI     G_0163, R2                      ; 51DB   0282 0163
        DECR    R2                              ; 51DD   0012
        MVO     R2,     G_0163                  ; 51DE   0242 0163
        MVI     G_0161, R1                      ; 51E0   0281 0161
        B       L_51E6                          ; 51E2   0200 0002

L_51E4:
        MVO     R2,     G_0163                  ; 51E4   0242 0163
L_51E6:
        CLRC                                    ; 51E6   0006
        DECLE   $02BC,  $0164,  $0001,  $02A3   ; 51E7   02BC 0164 0001 02A3
        DECLE   $00CB,  $029A,  $0092,  $0204   ; 51EB   00CB 029A 0092 0204
        DECLE   $002A,  $0072,  $0201,  $0006   ; 51EF   002A 0072 0201 0006
        DECLE   $0001,  $02BC,  $0041,  $0051   ; 51F3   0001 02BC 0041 0051
        DECLE   $0200,  $000D,  $004A,  $0094   ; 51F7   0200 000D 004A 0094
        DECLE   $03BC,  $003F,  $0001,  $02FC   ; 51FB   03BC 003F 0001 02FC
        DECLE   $0041,  $0051,  $0066,  $0066   ; 51FF   0041 0051 0066 0066
        DECLE   $0066,  $03BA,  $000F,  $0001   ; 5203   0066 03BA 000F 0001

        MVI@    R4,     R3                      ; 5207   02A3
L_5208:
        MVO@    R3,     R5                      ; 5208   026B
        DECR    R2                              ; 5209   0012
        BNEQ    L_5214                          ; 520A   020C 0008

        INCR    R1                              ; 520C   0009
        MVI     G_0163, R2                      ; 520D   0282 0163
        TSTR    R2                              ; 520F   0092
        BEQ     L_51E6                          ; 5210   0224 002B
        B       L_51D6                          ; 5212   0220 003D

L_5214:
        SDBD                                    ; 5214   0001
        ANDI    #$1FFF, R3                      ; 5215   03BB 00FF 001F
        B       L_5208                          ; 5218   0220 0011
        PULR    R7                              ; 521A   02B7

L_521B:
        PSHR    R5                              ; 521B   0275
        MVII    #$000F, R0                      ; 521C   02B8 000F
        MVO     R0,     G_0117                  ; 521E   0240 0117
        MVII    #$0046, R0                      ; 5220   02B8 0046
        MVO     R0,     G_0118                  ; 5222   0240 0118
        MVII    #$0091, R0                      ; 5224   02B8 0091
        MVO     R0,     G_0116                  ; 5226   0240 0116
        MVII    #$0004, R0                      ; 5228   02B8 0004
        MVO     R0,     G_0119                  ; 522A   0240 0119
        PULR    R7                              ; 522C   02B7

        RLC     R1,     2                       ; 522D   0055
        SLLC    R0,     1                       ; 522E   0058
        SLLC    R3,     1                       ; 522F   005B
        SLLC    R2,     2                       ; 5230   005E
        SLR     R1,     1                       ; 5231   0061
        SLR     R0,     2                       ; 5232   0064
        SLR     R2,     2                       ; 5233   0066
        SLL     R0,     2                       ; 5234   004C
        SLL     R1,     1                       ; 5235   0049
        SWAP    R2,     2                       ; 5236   0046
        SWAP    R3,     1                       ; 5237   0043
        SWAP    R0,     1                       ; 5238   0040
        RSWD    R5                              ; 5239   003D
        RSWD    R2                              ; 523A   003A
L_523B:
        PSHR    R5                              ; 523B   0275
        MVI     G_0341, R0                      ; 523C   0280 0341

        JSR     R5,     X_UNPK_BYTES            ; 523E   0004 0114 0357

        TSTR    R0                              ; 5241   0080
        BEQ     L_5257                          ; 5242   0204 0013

        MOVR    R0,     R1                      ; 5244   0081
        MVI     G_0345, R2                      ; 5245   0282 0345
        MVI     G_033F, R0                      ; 5247   0280 033F
        SWAP    R0,     1                       ; 5249   0040
        ANDI    #$00FF, R0                      ; 524A   03B8 00FF
        CMPI    #$0052, R0                      ; 524C   0378 0052
        BGT     L_5261                          ; 524E   020E 0011
        BLT     L_5276                          ; 5250   0205 0024

        JSR     R5,     L_52BF                  ; 5252   0004 0150 02BF

        B       L_526D                          ; 5255   0200 0016

L_5257:
        MVII    #$0004, R0                      ; 5257   02B8 0004
        CLRR    R1                              ; 5259   01C9

        JSR     R5,     X_PACK_BYTES            ; 525A   0004 0114 034F

        MVO     R0,     G_0341                  ; 525D   0240 0341
        B       L_52B8                          ; 525F   0200 0057

L_5261:
        CMPI    #$0055, R0                      ; 5261   0378 0055
        BGE     L_5286                          ; 5263   020D 0021

        SDBD                                    ; 5265   0001
        MVII    #$FB00, R3                      ; 5266   02BB 0000 00FB
        SDBD                                    ; 5269   0001
        ANDI    #$FDFF, R2                      ; 526A   03BA 00FF 00FD
L_526D:
        CLRR    R0                              ; 526D   01C0
        MVO     R0,     G_034A                  ; 526E   0240 034A
        MVO     R2,     G_0345                  ; 5270   0242 0345
        MVO     R3,     G_0349                  ; 5272   0243 0349
        B       L_52B8                          ; 5274   0200 0042

L_5276:
        CMPI    #$004F, R0                      ; 5276   0378 004F
        BLE     L_5296                          ; 5278   0206 001C

        SDBD                                    ; 527A   0001
        MVII    #$0500, R3                      ; 527B   02BB 0000 0005
        SDBD                                    ; 527E   0001
        ANDI    #$FDFF, R2                      ; 527F   03BA 00FF 00FD
        XORI    #$0200, R2                      ; 5282   03FA 0200
        B       L_526D                          ; 5284   0220 0018

L_5286:
        CLRR    R1                              ; 5286   01C9
        SDBD                                    ; 5287   0001
        MVII    #$522D, R4                      ; 5288   02BC 002D 0052
L_528B:
        INCR    R1                              ; 528B   0009
        CMPI    #$0008, R1                      ; 528C   0379 0008
        BGE     L_52A6                          ; 528E   020D 0016

        CMP@    R4,     R0                      ; 5290   0360
        BGE     L_528B                          ; 5291   022D 0007

        MOVR    R1,     R0                      ; 5293   0088
        B       L_52B6                          ; 5294   0200 0020

L_5296:
        CLRR    R1                              ; 5296   01C9
        SDBD                                    ; 5297   0001
        MVII    #$5234, R4                      ; 5298   02BC 0034 0052
L_529B:
        INCR    R1                              ; 529B   0009
        CMPI    #$0008, R1                      ; 529C   0379 0008
        BGE     L_52B9                          ; 529E   020D 0019

        CMP@    R4,     R0                      ; 52A0   0360
        BLE     L_529B                          ; 52A1   0226 0007

        MOVR    R1,     R0                      ; 52A3   0088
        B       L_52B6                          ; 52A4   0200 0010

L_52A6:
        CMPI    #$006E, R0                      ; 52A6   0378 006E
        BLE     L_52B8                          ; 52A8   0206 000E

        SDBD                                    ; 52AA   0001
        MVII    #$FFFC, R0                      ; 52AB   02B8 00FC 00FF
        CLRR    R1                              ; 52AE   01C9

        JSR     R5,     X_PACK_BYTES            ; 52AF   0004 0114 034F

        MVO     R0,     G_0341                  ; 52B2   0240 0341
        B       L_52B8                          ; 52B4   0200 0002

L_52B6:
        MVO     R0,     G_034A                  ; 52B6   0240 034A
L_52B8:
        PULR    R7                              ; 52B8   02B7

L_52B9:
        CMPI    #$002E, R0                      ; 52B9   0378 002E
        BLE     L_52B8                          ; 52BB   0226 0004
        B       L_5257                          ; 52BD   0220 0067

L_52BF:
        PSHR    R5                              ; 52BF   0275
        SDBD                                    ; 52C0   0001
        ANDI    #$FDFF, R2                      ; 52C1   03BA 00FF 00FD
        TSTR    R1                              ; 52C4   0089
        BPL     L_52C9                          ; 52C5   0203 0002

        XORI    #$0200, R2                      ; 52C7   03FA 0200
L_52C9:
        PULR    R7                              ; 52C9   02B7

        PSHR    R5                              ; 52CA   0275
        SLL     R2,     1                       ; 52CB   004A
        ADDR    R2,     R7                      ; 52CC   00D7
        B       L_52D5                          ; 52CD   0200 0006
        B       L_52D1                          ; 52CF   0200 0000

L_52D1:
        MVII    #$00A7, R0                      ; 52D1   02B8 00A7
        SWAP    R0,     1                       ; 52D3   0040
        INCR    R7                              ; 52D4   000F

L_52D5:
        CLRR    R0                              ; 52D5   01C0
L_52D6:
        MVO     R0,     G_0357                  ; 52D6   0240 0357
        PULR    R7                              ; 52D8   02B7

        PSHR    R5                              ; 52D9   0275
        TSTR    R0                              ; 52DA   0080
        BMI     L_52E2                          ; 52DB   020B 0005

        MVII    #$003F, R0                      ; 52DD   02B8 003F
L_52DF:
        MVO     R0,     G_016D                  ; 52DF   0240 016D
        PULR    R7                              ; 52E1   02B7

L_52E2:
        MVII    #$001E, R0                      ; 52E2   02B8 001E
        B       L_52DF                          ; 52E4   0220 0006

        PSHR    R5                              ; 52E6   0275
        TSTR    R0                              ; 52E7   0080
        BMI     L_52E2                          ; 52E8   022B 0007

        MVII    #$0007, R0                      ; 52EA   02B8 0007
        B       L_52DF                          ; 52EC   0220 000E

        PSHR    R5                              ; 52EE   0275
        TSTR    R0                              ; 52EF   0080
        BMI     L_52FB                          ; 52F0   020B 0009

        MOVR    R0,     R1                      ; 52F2   0081
        MVI     G_016D, R0                      ; 52F3   0280 016D

        JSR     R5,     .EXEC.629               ; 52F5   0004 0114 0229

        MVO     R0,     G_0321                  ; 52F8   0240 0321
        PULR    R7                              ; 52FA   02B7

L_52FB:
        CLRR    R0                              ; 52FB   01C0
        MVO     R0,     G_0321                  ; 52FC   0240 0321
        PULR    R7                              ; 52FE   02B7

        CMPR    R2,     R0                      ; 52FF   0150
        MVO@    R0,     R2                      ; 5300   0250
        ANDR    R7,     R4                      ; 5301   01BC
        MVII    #$0275, R4                      ; 5302   02BC 0275
        MVI     G_0169, R1                      ; 5304   0281 0169
        TSTR    R1                              ; 5306   0089
        BNEQ    L_537D                          ; 5307   020C 0074

        MVI     G_0166, R1                      ; 5309   0281 0166
        TSTR    R1                              ; 530B   0089
        BEQ     L_5311                          ; 530C   0204 0003

L_530E:
        JSR     R5,     L_5360                  ; 530E   0004 0150 0360
L_5311:
        JSR     R5,     L_5316                  ; 5311   0004 0150 0316

        B       L_537D                          ; 5314   0200 0067

L_5316:
        PSHR    R5                              ; 5316   0275
        MVII    #$0001, R1                      ; 5317   02B9 0001
        MVO     R1,     G_016B                  ; 5319   0241 016B
        MVO     R1,     G_016C                  ; 531B   0241 016C
        MVI     G_0168, R1                      ; 531D   0281 0168
        MVI     G_016A, R2                      ; 531F   0282 016A
        XORI    #$0001, R2                      ; 5321   03FA 0001
        ADDR    R2,     R1                      ; 5323   00D1
        CMPI    #$0008, R1                      ; 5324   0379 0008
        BLT     L_5358                          ; 5326   0205 0030

        MVI     G_0167, R3                      ; 5328   0283 0167
        INCR    R3                              ; 532A   000B
        ADDR    R7,     R3                      ; 532B   00FB
        ADD@    R3,     R7                      ; 532C   02DF

        INCR    R0                              ; 532D   0008
        INCR    R4                              ; 532E   000C
        DECR    R2                              ; 532F   0012
        COMR    R0                              ; 5330   0018
        ADCR    R3                              ; 5331   002B
        ADCR    R3                              ; 5332   002B
        ADCR    R2                              ; 5333   002A
        ADCR    R2                              ; 5334   002A
        MVII    #$0002, R0                      ; 5335   02B8 0002
        B       L_533B                          ; 5337   0200 0002

        MVII    #$0003, R0                      ; 5339   02B8 0003
L_533B:
        MVO     R0,     G_0167                  ; 533B   0240 0167
        PULR    R1                              ; 533D   02B1
        PULR    R7                              ; 533E   02B7

        SDBD                                    ; 533F   0001
        MVII    #$4000, R0                      ; 5340   02B8 0000 0040
        B       L_5349                          ; 5343   0200 0004

        SDBD                                    ; 5345   0001
        MVII    #$4800, R0                      ; 5346   02B8 0000 0048
L_5349:
        MVO     R0,     G_0350                  ; 5349   0240 0350
        MVII    #$0001, R0                      ; 534B   02B8 0001
        MVO     R0,     G_0166                  ; 534D   0240 0166
        SDBD                                    ; 534F   0001
        MVII    #$7800, R0                      ; 5350   02B8 0000 0078
        MVO     R0,     G_034F                  ; 5353   0240 034F
        B       L_5358                          ; 5355   0200 0001

        DECR    R1                              ; 5357   0011
L_5358:
        MVO     R1,     G_0168                  ; 5358   0241 0168
        SLL     R1,     1                       ; 535A   0049
        MVO     R1,     G_0169                  ; 535B   0241 0169
        MVO     R2,     G_016A                  ; 535D   0242 016A
        PULR    R7                              ; 535F   02B7

L_5360:
        PSHR    R5                              ; 5360   0275
        CLRR    R0                              ; 5361   01C0
        MVO     R0,     G_0166                  ; 5362   0240 0166
        MVO     R0,     G_016A                  ; 5364   0240 016A
        MVO     R0,     G_0168                  ; 5366   0240 0168
        MVO     R0,     G_0167                  ; 5368   0240 0167
        MVO     R0,     G_0352                  ; 536A   0240 0352
        SDBD                                    ; 536C   0001
        MVII    #$5000, R0                      ; 536D   02B8 0000 0050
        MVO     R0,     G_034F                  ; 5370   0240 034F
        SDBD                                    ; 5372   0001
        MVII    #$2800, R0                      ; 5373   02B8 0000 0028
        MVO     R0,     G_0350                  ; 5376   0240 0350
        PULR    R7                              ; 5378   02B7

        RLC     R2,     1                       ; 5379   0052
        COMR    R2                              ; 537A   001A
        RLC     R2,     1                       ; 537B   0052
        COMR    R4                              ; 537C   001C
L_537D:
        MVI     G_0167, R1                      ; 537D   0281 0167
        INCR    R1                              ; 537F   0009
        ADDR    R7,     R1                      ; 5380   00F9
        ADD@    R1,     R7                      ; 5381   02CF

        INCR    R0                              ; 5382   0008
        NEGR    R6                              ; 5383   0026
        RLC     R3,     1                       ; 5384   0053
        MOVR    R1,     R3                      ; 5385   008B
        MOVR    R5,     R6                      ; 5386   00AE
        ADDR    R0,     R6                      ; 5387   00C6
        ADDR    R4,     R2                      ; 5388   00E2
        ADDR    R7,     R3                      ; 5389   00FB
        SDBD                                    ; 538A   0001
        MVII    #$539C, R4                      ; 538B   02BC 009C 0053

        JSR     R5,     L_5529                  ; 538E   0004 0154 0129

        CLRR    R0                              ; 5391   01C0
        MVO     R0,     G_0352                  ; 5392   0240 0352
        MVI     G_034D, R1                      ; 5394   0281 034D
        SDBD                                    ; 5396   0001
        ANDI    #$F9FF, R1                      ; 5397   03B9 00FF 00F9
        MVO     R1,     G_034D                  ; 539A   0241 034D
        SDBD                                    ; 539C   0001
        MVII    #$52FF, R4                      ; 539D   02BC 00FF 0052
L_53A0:
        CLRR    R0                              ; 53A0   01C0
        MVO     R0,     G_016F                  ; 53A1   0240 016F

        JSR     R5,     L_553F                  ; 53A3   0004 0154 013F

        B       L_555D                          ; 53A6   0200 01B5

        SDBD                                    ; 53A8   0001
        MVII    #$53BE, R4                      ; 53A9   02BC 00BE 0053

        JSR     R5,     L_5535                  ; 53AC   0004 0154 0135

        SDBD                                    ; 53AF   0001
        MVII    #$5379, R4                      ; 53B0   02BC 0079 0053
        SDBD                                    ; 53B3   0001
        MVI@    R4,     R1                      ; 53B4   02A1
        MVO     R1,     G_034D                  ; 53B5   0241 034D
        MVII    #$0005, R1                      ; 53B7   02B9 0005
        MVO     R1,     G_0352                  ; 53B9   0241 0352

        JSR     R5,     L_5499                  ; 53BB   0004 0154 0099

        SDBD                                    ; 53BE   0001
        MVII    #$5300, R4                      ; 53BF   02BC 0000 0053
        MVII    #$0001, R3                      ; 53C2   02BB 0001
        MVO     R3,     G_016F                  ; 53C4   0243 016F

        JSR     R5,     L_553F                  ; 53C6   0004 0154 013F

L_53C9:
        MVI     G_0167, R1                      ; 53C9   0281 0167
        DECR    R1                              ; 53CB   0011
        MVO     R1,     G_0167                  ; 53CC   0241 0167
        MVII    #$0001, R1                      ; 53CE   02B9 0001
        MVO     R1,     G_016B                  ; 53D0   0241 016B
        MVO     R1,     G_016C                  ; 53D2   0241 016C
        PULR    R7                              ; 53D4   02B7

        SDBD                                    ; 53D5   0001
        MVII    #$5407, R4                      ; 53D6   02BC 0007 0054

        JSR     R5,     L_5529                  ; 53D9   0004 0154 0129

        MVII    #$0006, R1                      ; 53DC   02B9 0006
        MVO     R1,     G_0352                  ; 53DE   0241 0352
        MVI     G_034D, R1                      ; 53E0   0281 034D
        SDBD                                    ; 53E2   0001
        ANDI    #$F9FF, R1                      ; 53E3   03B9 00FF 00F9
        MVO     R1,     G_034D                  ; 53E6   0241 034D
        MVI     G_0350, R1                      ; 53E8   0281 0350
        SDBD                                    ; 53EA   0001
        CMPI    #$4000, R1                      ; 53EB   0379 0000 0040
        BNEQ    L_5407                          ; 53EE   020C 0017

        MVII    #$034F, R4                      ; 53F0   02BC 034F

        JSR     R5,     L_5C8F                  ; 53F2   0004 015C 008F
        DECLE   $02A0,  $0001,  $03B8,  $00F8   ; 53F5   02A0 0001 03B8 00F8
        DECLE   $000F,  $0001                   ; 53F9   000F 0001

        CMPI    #$0040, R0                      ; 53FB   0378 0040
        INCR    R0                              ; 53FD   0008
        BEQ     L_5407                          ; 53FE   0204 0007

        MVI     G_0169, R0                      ; 5400   0280 0169
        DECR    R0                              ; 5402   0010
        MVO     R0,     G_0169                  ; 5403   0240 0169
        B       L_540D                          ; 5405   0200 0006

L_5407:
        SDBD                                    ; 5407   0001
        MVII    #$5301, R4                      ; 5408   02BC 0001 0053
        B       L_53A0                          ; 540B   0220 006C

L_540D:
        SDBD                                    ; 540D   0001
        MVII    #$5423, R4                      ; 540E   02BC 0023 0054

        JSR     R5,     L_5535                  ; 5411   0004 0154 0135

        SDBD                                    ; 5414   0001
        MVII    #$537B, R4                      ; 5415   02BC 007B 0053
        SDBD                                    ; 5418   0001
        MVI@    R4,     R1                      ; 5419   02A1
        MVO     R1,     G_034D                  ; 541A   0241 034D
        MVII    #$000B, R1                      ; 541C   02B9 000B
        MVO     R1,     G_0352                  ; 541E   0241 0352

        JSR     R5,     L_550C                  ; 5420   0004 0154 010C

        SDBD                                    ; 5423   0001
        MVII    #$5302, R4                      ; 5424   02BC 0002 0053
L_5427:
        MVII    #$0001, R3                      ; 5427   02BB 0001
        MVO     R3,     G_016F                  ; 5429   0243 016F

        JSR     R5,     L_553F                  ; 542B   0004 0154 013F

        B       L_53C9                          ; 542E   0220 0066

        SDBD                                    ; 5430   0001
        MVII    #$5442, R4                      ; 5431   02BC 0042 0054

        JSR     R5,     L_5529                  ; 5434   0004 0154 0129

        SDBD                                    ; 5437   0001
        MVII    #$5379, R4                      ; 5438   02BC 0079 0053
        SDBD                                    ; 543B   0001
        MVI@    R4,     R1                      ; 543C   02A1
        MVO     R1,     G_034D                  ; 543D   0241 034D
        CLRR    R0                              ; 543F   01C0
        MVO     R0,     G_0352                  ; 5440   0240 0352
        SDBD                                    ; 5442   0001
        MVII    #$52FF, R4                      ; 5443   02BC 00FF 0052
        B       L_53A0                          ; 5446   0220 00A7

        SDBD                                    ; 5448   0001
        MVII    #$545E, R4                      ; 5449   02BC 005E 0054

        JSR     R5,     L_5535                  ; 544C   0004 0154 0135

        MVI     G_034D, R1                      ; 544F   0281 034D
        SDBD                                    ; 5451   0001
        ANDI    #$F9FF, R1                      ; 5452   03B9 00FF 00F9
        MVO     R1,     G_034D                  ; 5455   0241 034D
        MVII    #$0005, R1                      ; 5457   02B9 0005
        MVO     R1,     G_0352                  ; 5459   0241 0352

        JSR     R5,     L_54FC                  ; 545B   0004 0154 00FC

        SDBD                                    ; 545E   0001
        MVII    #$5300, R4                      ; 545F   02BC 0000 0053
        B       L_5427                          ; 5462   0220 003C

        SDBD                                    ; 5464   0001
        MVII    #$5477, R4                      ; 5465   02BC 0077 0054

        JSR     R5,     L_5529                  ; 5468   0004 0154 0129

        SDBD                                    ; 546B   0001
        MVII    #$537B, R4                      ; 546C   02BC 007B 0053
        SDBD                                    ; 546F   0001
        MVI@    R4,     R1                      ; 5470   02A1
        MVO     R1,     G_034D                  ; 5471   0241 034D
        MVII    #$0006, R1                      ; 5473   02B9 0006
        MVO     R1,     G_0352                  ; 5475   0241 0352
        SDBD                                    ; 5477   0001
        MVII    #$5301, R4                      ; 5478   02BC 0001 0053
        B       L_53A0                          ; 547B   0220 00DC

        SDBD                                    ; 547D   0001
        MVII    #$5493, R4                      ; 547E   02BC 0093 0054

        JSR     R5,     L_5535                  ; 5481   0004 0154 0135

        MVI     G_034D, R1                      ; 5484   0281 034D
        SDBD                                    ; 5486   0001
        ANDI    #$F9FF, R1                      ; 5487   03B9 00FF 00F9
        MVO     R1,     G_034D                  ; 548A   0241 034D
        MVII    #$000B, R1                      ; 548C   02B9 000B
        MVO     R1,     G_0352                  ; 548E   0241 0352

        JSR     R5,     L_54EC                  ; 5490   0004 0154 00EC

        SDBD                                    ; 5493   0001
        MVII    #$5302, R4                      ; 5494   02BC 0002 0053
        B       L_5427                          ; 5497   0220 0071

L_5499:
        PSHR    R5                              ; 5499   0275
        SDBD                                    ; 549A   0001
        MVII    #$549A, R1                      ; 549B   02B9 009A 0054
        PSHR    R1                              ; 549E   0271
        MVI     G_034F, R1                      ; 549F   0281 034F
        SWAP    R1,     1                       ; 54A1   0041
        ADDI    #$0008, R1                      ; 54A2   02F9 0008
        SWAP    R1,     1                       ; 54A4   0041
        MVO     R1,     G_034F                  ; 54A5   0241 034F
L_54A7:
        MVII    #$034F, R4                      ; 54A7   02BC 034F

        JSR     R5,     L_5C8F                  ; 54A9   0004 015C 008F
        DECLE   $02A0,  $0001,  $03B8,  $00F8   ; 54AC   02A0 0001 03B8 00F8
        DECLE   $000F,  $0001                   ; 54B0   000F 0001

        CMPI    #$0040, R0                      ; 54B2   0378 0040
        INCR    R0                              ; 54B4   0008
        BEQ     L_54EA                          ; 54B5   0204 0033

        MVI     G_0169, R0                      ; 54B7   0280 0169
        DECR    R0                              ; 54B9   0010
        BEQ     L_54C1                          ; 54BA   0204 0005

        DECR    R0                              ; 54BC   0010
        MVO     R0,     G_0169                  ; 54BD   0240 0169
        PULR    R1                              ; 54BF   02B1
        MOVR    R1,     R7                      ; 54C0   008F

L_54C1:
        MVO     R0,     G_0169                  ; 54C1   0240 0169
        PULR    R1                              ; 54C3   02B1
        PULR    R1                              ; 54C4   02B1
        MVI     G_0167, R1                      ; 54C5   0281 0167
        ADDI    #$0002, R1                      ; 54C7   02F9 0002
        ANDI    #$0007, R1                      ; 54C9   03B9 0007
        MVO     R1,     G_0167                  ; 54CB   0241 0167
        MVI     G_034F, R1                      ; 54CD   0281 034F
        SDBD                                    ; 54CF   0001
        CMPI    #$7800, R1                      ; 54D0   0379 0000 0078
        BNEQ    L_54E0                          ; 54D3   020C 000B

        MVI     G_0350, R1                      ; 54D5   0281 0350
        SDBD                                    ; 54D7   0001
        CMPI    #$0800, R1                      ; 54D8   0379 0000 0008
        BNEQ    L_54E0                          ; 54DB   020C 0003

        JSR     R5,     L_5360                  ; 54DD   0004 0150 0360
L_54E0:
        JSR     R5,     L_5316                  ; 54E0   0004 0150 0316

        MVI     G_0169, R0                      ; 54E3   0280 0169
        DECR    R0                              ; 54E5   0010
        MVO     R0,     G_0169                  ; 54E6   0240 0169
        B       L_537D                          ; 54E8   0220 016C

L_54EA:
        PULR    R1                              ; 54EA   02B1
        PULR    R7                              ; 54EB   02B7

L_54EC:
        PSHR    R5                              ; 54EC   0275
        SDBD                                    ; 54ED   0001
        MVII    #$54ED, R1                      ; 54EE   02B9 00ED 0054
        PSHR    R1                              ; 54F1   0271
        MVI     G_0350, R1                      ; 54F2   0281 0350
        SWAP    R1,     1                       ; 54F4   0041
        ADDI    #$0008, R1                      ; 54F5   02F9 0008
        SWAP    R1,     1                       ; 54F7   0041
        MVO     R1,     G_0350                  ; 54F8   0241 0350
        B       L_54A7                          ; 54FA   0220 0054

L_54FC:
        PSHR    R5                              ; 54FC   0275
        SDBD                                    ; 54FD   0001
        MVII    #$54FD, R1                      ; 54FE   02B9 00FD 0054
        PSHR    R1                              ; 5501   0271
        MVI     G_034F, R1                      ; 5502   0281 034F
        SWAP    R1,     1                       ; 5504   0041
        SUBI    #$0008, R1                      ; 5505   0339 0008
        SWAP    R1,     1                       ; 5507   0041
        MVO     R1,     G_034F                  ; 5508   0241 034F
        B       L_54A7                          ; 550A   0220 0064

L_550C:
        PSHR    R5                              ; 550C   0275
        SDBD                                    ; 550D   0001
        MVII    #$550D, R1                      ; 550E   02B9 000D 0055
        PSHR    R1                              ; 5511   0271
        MVI     G_0350, R1                      ; 5512   0281 0350
        SWAP    R1,     1                       ; 5514   0041
        MVI     G_0166, R0                      ; 5515   0280 0166
        TSTR    R0                              ; 5517   0080
        BEQ     L_551E                          ; 5518   0204 0004

        CMPI    #$0008, R1                      ; 551A   0379 0008
        BEQ     L_5525                          ; 551C   0204 0007

L_551E:
        SUBI    #$0008, R1                      ; 551E   0339 0008
        SWAP    R1,     1                       ; 5520   0041
        MVO     R1,     G_0350                  ; 5521   0241 0350
        B       L_54A7                          ; 5523   0220 007D

L_5525:
        PULR    R1                              ; 5525   02B1
        PULR    R1                              ; 5526   02B1
        B       L_530E                          ; 5527   0220 021A

L_5529:
        PSHR    R5                              ; 5529   0275
        MVI     G_016B, R1                      ; 552A   0281 016B
        TSTR    R1                              ; 552C   0089
        BEQ     L_5533                          ; 552D   0204 0004

        CLRR    R1                              ; 552F   01C9
        MVO     R1,     G_016B                  ; 5530   0241 016B
        PULR    R7                              ; 5532   02B7

L_5533:
        PULR    R1                              ; 5533   02B1
        MOVR    R4,     R7                      ; 5534   00A7

L_5535:
        PSHR    R5                              ; 5535   0275
        MVI     G_016C, R1                      ; 5536   0281 016C
        TSTR    R1                              ; 5538   0089
        BEQ     L_5533                          ; 5539   0224 0007

        CLRR    R1                              ; 553B   01C9
        MVO     R1,     G_016C                  ; 553C   0241 016C
        PULR    R7                              ; 553E   02B7

L_553F:
        PSHR    R5                              ; 553F   0275
        MVI@    R4,     R3                      ; 5540   02A3
        MVII    #$034D, R1                      ; 5541   02B9 034D

        JSR     R5,     L_59A5                  ; 5543   0004 0158 01A5

        MVI     G_0170, R0                      ; 5546   0280 0170
        TSTR    R0                              ; 5548   0080
        BEQ     L_5558                          ; 5549   0204 000D

        CLRR    R0                              ; 554B   01C0
        MVO     R0,     G_0170                  ; 554C   0240 0170
        MVO     R0,     G_016F                  ; 554E   0240 016F
        MVI     G_0169, R0                      ; 5550   0280 0169
        DECR    R0                              ; 5552   0010
        BEQ     L_555A                          ; 5553   0204 0005

        MVO     R0,     G_0169                  ; 5555   0240 0169
        PULR    R7                              ; 5557   02B7

L_5558:
        PULR    R0                              ; 5558   02B0
        PULR    R7                              ; 5559   02B7

L_555A:
        MVO     R0,     G_0169                  ; 555A   0240 0169
        PULR    R1                              ; 555C   02B1
L_555D:
        MVI     G_0167, R1                      ; 555D   0281 0167
        INCR    R1                              ; 555F   0009
        ANDI    #$0007, R1                      ; 5560   03B9 0007
        MVO     R1,     G_0167                  ; 5562   0241 0167
        PULR    R7                              ; 5564   02B7

        DECLE   $00C0,  $0030,  $00E5,  $0055   ; 5565   00C0 0030 00E5 0055
        DECLE   $0000,  $0053,  $0000,  $0019   ; 5569   0000 0053 0000 0019
        DECLE   $0000,  $0000,  $0000,  $0000   ; 556D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5571   0000 0000 0000 0000
        DECLE   $0046,  $0018,  $00EC,  $0055   ; 5575   0046 0018 00EC 0055
        DECLE   $0000,  $0054,  $0000,  $0058   ; 5579   0000 0054 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 557D   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 5581   0001 0000 0001 0000
        DECLE   $0000,  $0000,  $00EC,  $0055   ; 5585   0000 0000 00EC 0055
        DECLE   $0000,  $0054,  $0000,  $0058   ; 5589   0000 0054 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 558D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 5591   0000 0000 0005 0000
        DECLE   $0000,  $0000,  $00EC,  $0055   ; 5595   0000 0000 00EC 0055
        DECLE   $0000,  $0054,  $0000,  $0058   ; 5599   0000 0054 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 559D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 55A1   0000 0000 0005 0000
        DECLE   $00C0,  $0019,  $0008,  $0056   ; 55A5   00C0 0019 0008 0056
        DECLE   $0000,  $0053,  $0000,  $000E   ; 55A9   0000 0053 0000 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B1   0000 0000 0000 0000
        DECLE   $00D0,  $0019,  $000F,  $0056   ; 55B5   00D0 0019 000F 0056
        DECLE   $0000,  $0053,  $0000,  $0014   ; 55B9   0000 0053 0000 0014
        DECLE   $0000,  $03FB,  $0000,  $0000   ; 55BD   0000 03FB 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55C1   0000 0000 0000 0000
        DECLE   $0052,  $0018,  $0001,  $0056   ; 55C5   0052 0018 0001 0056
        DECLE   $0000,  $0050,  $0000,  $0028   ; 55C9   0000 0050 0000 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D1   0000 0000 0000 0000
        DECLE   $0067,  $0030,  $0016,  $0056   ; 55D5   0067 0030 0016 0056
        DECLE   $0000,  $0053,  $0000,  $0028   ; 55D9   0000 0053 0000 0028
        DECLE   $0000,  $0007,  $0000,  $0000   ; 55DD   0000 0007 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E1   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 55E5   0300 0000 0000 0000
        DECLE   $0001,  $0030,  $0000           ; 55E9   0001 0030 0000

        B       L_55EE                          ; 55EC   0200 0000

L_55EE:
        RLC     R2,     1                       ; 55EE   0052
        DECLE   $0059,  $0000,  $0000,  $0000   ; 55EF   0059 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 55F3   0200 0000 0000 0000
        DECLE   $0007,  $000C,  $0000,  $024A   ; 55F7   0007 000C 0000 024A
        DECLE   $005A,  $007D,  $005A,  $0007   ; 55FB   005A 007D 005A 0007
        DECLE   $0018,  $0000,  $0000,  $0000   ; 55FF   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0046   ; 5603   0000 0000 000C 0046
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5607   0000 0300 0000 0000
        DECLE   $0000,  $0001,  $0032,  $0000   ; 560B   0000 0001 0032 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 560F   0300 0000 0000 0000
        DECLE   $0008,  $0034,  $0000,  $02CA   ; 5613   0008 0034 0000 02CA
        DECLE   $0052,  $0000,  $0000,  $0001   ; 5617   0052 0000 0000 0001
        DECLE   $0044,  $0000                   ; 561B   0044 0000

        B       L_561F                          ; 561D   0200 0000

L_561F:
        ADDR    R7,     R5                      ; 561F   00FD
        DECLE   $005A,  $0007,  $0018,  $0004   ; 5620   005A 0007 0018 0004

        XORR    R3,     R4                      ; 5624   01DC
        SLLC    R2,     1                       ; 5625   005A
        XORR    R3,     R4                      ; 5626   01DC
        CMPR    R3,     R2                      ; 5627   015A
        B       L_562A                          ; 5628   0200 0000

L_562A:
        ADDR    R7,     R5                      ; 562A   00FD
        DECLE   $005A,  $0007,  $0018,  $0001   ; 562B   005A 0007 0018 0001

        ADDR    R3,     R4                      ; 562F   00DC
        SLLC    R2,     1                       ; 5630   005A
        B       L_5633                          ; 5631   0200 0000

L_5633:
        ADDR    R7,     R5                      ; 5633   00FD
        DECLE   $005A,  $0007,  $0018,  $0002   ; 5634   005A 0007 0018 0002
        DECLE   $0357,  $005B,  $0000,  $0000   ; 5638   0357 005B 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 563C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5640   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5644   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5648   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 564C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5650   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007F,  $0000   ; 5654   0000 0000 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5658   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 565C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5660   0000 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $0000   ; 5664   0000 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5668   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 566C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007F   ; 5670   0000 0000 0000 007F
        DECLE   $007F,  $007F,  $007F,  $0000   ; 5674   007F 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5678   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 567C   0000 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $007F   ; 5680   0000 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $0000   ; 5684   007F 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5688   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007F   ; 568C   0000 0000 0000 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5690   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $0000   ; 5694   007F 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5698   0000 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $007F   ; 569C   0000 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 56A0   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $0000   ; 56A4   007F 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A8   0000 0000 0000 0000
        DECLE   $0000,  $003E,  $003E,  $003E   ; 56AC   0000 003E 003E 003E
        DECLE   $003E,  $003E,  $003E,  $003E   ; 56B0   003E 003E 003E 003E
        DECLE   $003E,  $003E,  $003E,  $0000   ; 56B4   003E 003E 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B8   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $001C,  $001C   ; 56BC   0000 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 56C0   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0000   ; 56C4   001C 001C 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C8   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0008   ; 56CC   0000 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 56D0   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; 56D4   0008 0008 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D8   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $001C,  $001C   ; 56DC   0000 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 56E0   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0000   ; 56E4   001C 001C 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E8   0000 0000 0000 0000
        DECLE   $0000,  $003E,  $003E,  $003E   ; 56EC   0000 003E 003E 003E
        DECLE   $003E,  $003E,  $003E,  $003E   ; 56F0   003E 003E 003E 003E
        DECLE   $003E,  $003E,  $003E,  $0000   ; 56F4   003E 003E 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F8   0000 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $007F   ; 56FC   0000 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5700   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $0000   ; 5704   007F 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5708   0000 0000 0000 0000
        DECLE   $003C,  $007E,  $007E,  $007E   ; 570C   003C 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 5710   007E 007E 007E 007E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 5714   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5718   0000 0000 0000 0038
        DECLE   $007C,  $007C,  $007C,  $007C   ; 571C   007C 007C 007C 007C
        DECLE   $007C,  $007C,  $0038,  $0000   ; 5720   007C 007C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5724   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $00F0   ; 5728   0000 0000 0060 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $0060   ; 572C   00F0 00F0 00F0 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5730   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5734   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $00E0   ; 5738   0000 0000 0040 00E0
        DECLE   $00E0,  $00E0,  $0040,  $0000   ; 573C   00E0 00E0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5740   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5744   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 5748   0000 0000 00C0 00C0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 574C   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5750   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5754   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $00E0   ; 5758   0000 0000 0040 00E0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 575C   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5760   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5764   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5768   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $007E,  $007E   ; 576C   0000 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 5770   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $0000,  $0000   ; 5774   007E 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5778   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003E,  $003E   ; 577C   0000 0000 003E 003E
        DECLE   $003E,  $003E,  $003E,  $003E   ; 5780   003E 003E 003E 003E
        DECLE   $003E,  $003E,  $0000,  $0000   ; 5784   003E 003E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5788   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 578C   0000 0000 0000 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5790   001C 001C 001C 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5794   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5798   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 579C   0000 0000 0000 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 57A0   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 57AC   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 57B0   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FE   ; 57B8   0000 0000 0000 00FE
        DECLE   $0092,  $0092,  $0092,  $00BA   ; 57BC   0092 0092 0092 00BA
        DECLE   $00AA,  $00EE,  $00EE,  $00AA   ; 57C0   00AA 00EE 00EE 00AA
        DECLE   $00BA,  $0092,  $0092,  $0092   ; 57C4   00BA 0092 0092 0092
        DECLE   $00FE,  $0000,  $0018,  $0018   ; 57C8   00FE 0000 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 57CC   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 57D0   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 57D4   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 57D8   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 57EC   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 57F0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 57F4   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 57F8   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0003,  $0003   ; 57FC   0001 0001 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5800   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0001,  $0001   ; 5804   0003 0003 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5808   0001 0000 0000 0001
        DECLE   $0001,  $0003,  $0007,  $0007   ; 580C   0001 0003 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 5810   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0003,  $0001   ; 5814   0007 0007 0003 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5818   0001 0000 0000 0001

        DIS                                     ; 581C   0003
        SETC                                    ; 581D   0007
        INCR    R7                              ; 581E   000F
        INCR    R7                              ; 581F   000F
L_5820:
        INCR    R7                              ; 5820   000F
L_5821:
        INCR    R7                              ; 5821   000F
L_5822:
        INCR    R7                              ; 5822   000F
L_5823:
        INCR    R7                              ; 5823   000F
L_5824:
        INCR    R7                              ; 5824   000F
L_5825:
        INCR    R7                              ; 5825   000F

L_5826:
        SETC                                    ; 5826   0007
L_5827:
        DIS                                     ; 5827   0003
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5828   0001 0000 0000 0001
        DECLE   $0007,  $000F,  $001F,  $001F   ; 582C   0007 000F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 5830   001F 001F 001F 001F
        DECLE   $001F,  $001F,  $000F,  $0007   ; 5834   001F 001F 000F 0007
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5838   0001 0000 0000 0001
        DECLE   $0007,  $001F,  $003F,  $003F   ; 583C   0007 001F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5840   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $001F,  $0007   ; 5844   003F 003F 001F 0007
        DECLE   $0001,  $0000,  $0000,  $0003   ; 5848   0001 0000 0000 0003
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 584C   000F 003F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5850   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003F,  $000F   ; 5854   00FF 00FF 003F 000F
        DECLE   $0003,  $0000,  $001C,  $000C   ; 5858   0003 0000 001C 000C
        DECLE   $001C,  $003C,  $0038,  $007C   ; 585C   001C 003C 0038 007C
        DECLE   $007E,  $007E,  $00FC,  $00FC   ; 5860   007E 007E 00FC 00FC
        DECLE   $00FF,  $007E,  $003E,  $003C   ; 5864   00FF 007E 003E 003C
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5868   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 586C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5870   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5874   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003F,  $007F   ; 5878   00FF 00FF 003F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 587C   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5880   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5884   007F 007F 007F 007F
        DECLE   $007F,  $003F,  $000F,  $003F   ; 5888   007F 003F 000F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 588C   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5890   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5894   003F 003F 003F 003F
        DECLE   $003F,  $000F,  $0003,  $000F   ; 5898   003F 000F 0003 000F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 589C   001F 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 58A0   001F 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 58A4   001F 001F 001F 001F
        DECLE   $000F,  $0003,  $0001,  $0003   ; 58A8   000F 0003 0001 0003
        DECLE   $0007,  $0007,  $0007,  $0007   ; 58AC   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 58B0   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 58B4   0007 0007 0007 0007
        DECLE   $0003,  $0001,  $0001,  $0001   ; 58B8   0003 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 58BC   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 58C0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 58C4   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $00FF,  $00FF   ; 58C8   0001 0001 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58CC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58D0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58D4   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58D8   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58DC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58E0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007E   ; 58E4   00FF 00FF 00FF 007E
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 58E8   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58EC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58F0   00FF 00FF 00FF 00FF
        DECLE   $007E,  $007E,  $0000,  $0000   ; 58F4   007E 007E 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 58F8   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58FC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $007E,  $007E   ; 5900   00FF 00FF 007E 007E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 5904   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5908   0000 0000 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 590C   00FF 007E 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5910   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5914   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5918   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5920   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5924   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5928   0000 0000
.GRAM_INIT_592A:
        DECLE   $001C           ; 592A  # of GRAM cards to init
        DECLE   $0001,  $0010   ; 592B  #00-00:  GROM #00-00 ----
        DECLE   $0081,  $0010   ; 592D  #01-01:  GROM #00-00 --I-
        DECLE   $0001,  $0070   ; 592F  #02-02:  GROM #00-00 ----
        DECLE   $0079,  $0050   ; 5931  #03-03:  GROM #3C-3C ----
        DECLE   $0019,  $0070   ; 5933  #04-04:  GROM #0C-0C ----
        DECLE   $0023,  $0070   ; 5935  #05-05:  GROM #11-11 ----
        DECLE   $005B,  $0030   ; 5937  #06-06:  GROM #6D-6D ----
        DECLE   $0063,  $0030   ; 5939  #07-07:  GROM #71-71 ----
        DECLE   $0001,  $0380   ; 593B  #08-0F:  CART #00-07 ----
        DECLE   $0011,  $0100   ; 593D  #10-12:  CART #08-0A ----
        DECLE   $0217,  $0040   ; 593F  #13-13:  GRAM #0B-0B X---
        DECLE   $0213,  $0040   ; 5941  #14-14:  GRAM #09-09 X---
        DECLE   $0113,  $0040   ; 5943  #15-15:  GRAM #09-09 -Y--
        DECLE   $039B,  $0040   ; 5945  #16-16:  GRAM #0D-0D XYI-
        DECLE   $021F,  $0040   ; 5947  #17-17:  GRAM #0F-0F X---
        DECLE   $0207,  $0040   ; 5949  #18-18:  GRAM #03-03 X---
        DECLE   $0223,  $0040   ; 594B  #19-19:  GRAM #11-11 X---
        DECLE   $0221,  $0040   ; 594D  #1A-1A:  GRAM #10-10 X---
        DECLE   $0225,  $0040   ; 594F  #1B-1B:  GRAM #12-12 X---


        CMPR    R2,     R2                      ; 5951   0152
        PSHR    R5                              ; 5952   0275
        MVI     G_0171, R0                      ; 5953   0280 0171
        INCR    R0                              ; 5955   0008
        CMPI    #$0001, R0                      ; 5956   0378 0001
        BLE     L_599D                          ; 5958   0206 0043

        MVO     R0,     G_0171                  ; 595A   0240 0171
        SDBD                                    ; 595C   0001
        MVII    #$5951, R4                      ; 595D   02BC 0051 0059
        MVI@    R4,     R3                      ; 5960   02A3
        CLRR    R0                              ; 5961   01C0
        MVO     R0,     G_0173                  ; 5962   0240 0173
        MVI     G_0173, R0                      ; 5964   0280 0173
        MVO     R0,     G_016F                  ; 5966   0240 016F
        PSHR    R1                              ; 5968   0271

        JSR     R5,     L_59A5                  ; 5969   0004 0158 01A5

        PULR    R1                              ; 596C   02B1
        MVI     G_0170, R0                      ; 596D   0280 0170
        TSTR    R0                              ; 596F   0080
        BEQ     L_5991                          ; 5970   0204 001F

        CLRR    R0                              ; 5972   01C0
        MVO     R0,     G_0170                  ; 5973   0240 0170
        PSHR    R1                              ; 5975   0271
        INCR    R1                              ; 5976   0009
        SDBD                                    ; 5977   0001
        MVII    #$55F3, R0                      ; 5978   02B8 00F3 0055
        MVO@    R0,     R1                      ; 597B   0248
        ADDI    #$0004, R1                      ; 597C   02F9 0004
        MVII    #$03F0, R0                      ; 597E   02B8 03F0
        MVO@    R0,     R1                      ; 5980   0248
        MVII    #$00D1, R0                      ; 5981   02B8 00D1
        SDBD                                    ; 5983   0001
        MVII    #$59A3, R1                      ; 5984   02B9 00A3 0059
        CLRR    R2                              ; 5987   01D2

        JSR     R5,     L_51C1                  ; 5988   0004 0150 01C1

        PULR    R1                              ; 598B   02B1
        SUBI    #$031D, R1                      ; 598C   0339 031D
        MVO     R1,     G_0172                  ; 598E   0241 0172
        PULR    R7                              ; 5990   02B7

L_5991:
        MVI     G_0171, R2                      ; 5991   0282 0171
        DECR    R2                              ; 5993   0012
        MVO     R2,     G_0171                  ; 5994   0242 0171
        ADDI    #$0007, R1                      ; 5996   02F9 0007
        MVI@    R1,     R3                      ; 5998   028B
        SUBI    #$0001, R1                      ; 5999   0339 0001
        MVO@    R3,     R1                      ; 599B   024B
        PULR    R7                              ; 599C   02B7

L_599D:
        ADDI    #$0006, R1                      ; 599D   02F9 0006
        MVII    #$0001, R2                      ; 599F   02BA 0001
        MVO@    R2,     R1                      ; 59A1   024A
        PULR    R7                              ; 59A2   02B7

        DECLE   $0103,  $0000                   ; 59A3   0103 0000
L_59A5:
        PSHR    R5                              ; 59A5   0275
        ADDI    #$0005, R1                      ; 59A6   02F9 0005
        MVI@    R1,     R2                      ; 59A8   028A
        ANDI    #$000F, R2                      ; 59A9   03BA 000F
        MVI     G_016F, R4                      ; 59AB   0284 016F
        TSTR    R4                              ; 59AD   00A4
        BNEQ    L_59DA                          ; 59AE   020C 002A

        PSHR    R3                              ; 59B0   0273
        SLR     R3,     2                       ; 59B1   0067
        SLR     R3,     2                       ; 59B2   0067
        ANDI    #$000F, R3                      ; 59B3   03BB 000F
        CMPR    R3,     R2                      ; 59B5   015A
        BLT     L_59D5                          ; 59B6   0205 001D

        PULR    R3                              ; 59B8   02B3
        RRC     R3,     1                       ; 59B9   0073
        BC      L_59BE                          ; 59BA   0201 0002
        B       L_59FC                          ; 59BC   0200 003E

L_59BE:
        SWAP    R3,     1                       ; 59BE   0043
        RRC     R3,     1                       ; 59BF   0073
        BC      L_59D1                          ; 59C0   0201 000F

        SLL     R3,     1                       ; 59C2   004B
        SWAP    R3,     1                       ; 59C3   0043
        ANDI    #$0007, R3                      ; 59C4   03BB 0007
        MVO@    R3,     R1                      ; 59C6   024B
        B       L_59FB                          ; 59C7   0200 0032

L_59C9:
        MVI     G_016F, R4                      ; 59C9   0284 016F
        XORI    #$0001, R4                      ; 59CB   03FC 0001
        MVO     R4,     G_016F                  ; 59CD   0244 016F
        B       L_59FB                          ; 59CF   0200 002A

L_59D1:
        DECR    R2                              ; 59D1   0012
        MVO@    R2,     R1                      ; 59D2   024A
        B       L_59C9                          ; 59D3   0220 000B

L_59D5:
        INCR    R2                              ; 59D5   000A
        MVO@    R2,     R1                      ; 59D6   024A
        PULR    R0                              ; 59D7   02B0
        B       L_59FB                          ; 59D8   0200 0021

L_59DA:
        PSHR    R3                              ; 59DA   0273
        SLR     R3,     1                       ; 59DB   0063
        ANDI    #$0007, R3                      ; 59DC   03BB 0007
        CMPR    R3,     R2                      ; 59DE   015A
        BGT     L_59F8                          ; 59DF   020E 0017

        PULR    R3                              ; 59E1   02B3
        RRC     R3,     1                       ; 59E2   0073
        BC      L_59E7                          ; 59E3   0201 0002
        B       L_59FC                          ; 59E5   0200 0015

L_59E7:
        SLL     R3,     1                       ; 59E7   004B
        SWAP    R3,     1                       ; 59E8   0043
        RRC     R3,     1                       ; 59E9   0073
        BC      L_59F4                          ; 59EA   0201 0008

        SWAP    R3,     1                       ; 59EC   0043
        SLR     R3,     2                       ; 59ED   0067
        SLR     R3,     2                       ; 59EE   0067
        ANDI    #$000F, R3                      ; 59EF   03BB 000F
        MVO@    R3,     R1                      ; 59F1   024B
        B       L_59FB                          ; 59F2   0200 0007

L_59F4:
        INCR    R2                              ; 59F4   000A
        MVO@    R2,     R1                      ; 59F5   024A
        B       L_59C9                          ; 59F6   0220 002E

L_59F8:
        DECR    R2                              ; 59F8   0012
        MVO@    R2,     R1                      ; 59F9   024A
        PULR    R0                              ; 59FA   02B0
L_59FB:
        PULR    R7                              ; 59FB   02B7

L_59FC:
        MVII    #$0001, R2                      ; 59FC   02BA 0001
        MVO     R2,     G_0170                  ; 59FE   0242 0170
        PULR    R7                              ; 5A00   02B7

        PSHR    R5                              ; 5A01   0275

        JSR     R5,     L_5A06                  ; 5A02   0004 0158 0206

        PULR    R7                              ; 5A05   02B7

L_5A06:
        PSHR    R5                              ; 5A06   0275
        MVI     G_0172, R1                      ; 5A07   0281 0172
        TSTR    R1                              ; 5A09   0089
        BEQ     L_5A49                          ; 5A0A   0204 003D

        PSHR    R1                              ; 5A0C   0271
        CLRR    R0                              ; 5A0D   01C0
        MVO     R0,     G_0171                  ; 5A0E   0240 0171
        MVO     R0,     G_0172                  ; 5A10   0240 0172

        JSR     R5,     .EXEC.772               ; 5A12   0004 0114 0372

        ADDI    #$0005, R2                      ; 5A15   02FA 0005
        ADDI    #$0007, R3                      ; 5A17   02FB 0007
        MOVR    R2,     R0                      ; 5A19   0090
        MOVR    R3,     R1                      ; 5A1A   0099

        JSR     R5,     X_PACK_BYTES            ; 5A1B   0004 0114 034F

        MOVR    R0,     R2                      ; 5A1E   0082
        PULR    R1                              ; 5A1F   02B1
        PSHR    R1                              ; 5A20   0271
        SLR     R1,     2                       ; 5A21   0065
        SLR     R1,     1                       ; 5A22   0061
        DECR    R1                              ; 5A23   0011
        MVII    #$015D, R3                      ; 5A24   02BB 015D
        ADDR    R1,     R3                      ; 5A26   00CB
        MVO@    R6,     R3                      ; 5A27   025E
        PULR    R1                              ; 5A28   02B1
        ADDI    #$031D, R1                      ; 5A29   02F9 031D
        CLRR    R0                              ; 5A2B   01C0
        MVO@    R0,     R1                      ; 5A2C   0248
        SDBD                                    ; 5A2D   0001
        MVII    #$55FA, R0                      ; 5A2E   02B8 00FA 0055
        INCR    R1                              ; 5A31   0009
        MVO@    R0,     R1                      ; 5A32   0248
        DECR    R1                              ; 5A33   0011
        SDBD                                    ; 5A34   0001
        MVII    #$1842, R0                      ; 5A35   02B8 0042 0018
        MVO@    R0,     R1                      ; 5A38   0248

        JSR     R5,     L_5A58                  ; 5A39   0004 0158 0258

        MOVR    R0,     R3                      ; 5A3C   0083
        MVII    #$03A0, R0                      ; 5A3D   02B8 03A0
        ADDI    #$0005, R1                      ; 5A3F   02F9 0005
        MVO@    R0,     R1                      ; 5A41   0248
        SUBI    #$0005, R1                      ; 5A42   0339 0005

        JSR     R5,     .EXEC.9A8               ; 5A44   0004 0118 01A8

        MVO     R6,     G_0160                  ; 5A47   0246 0160
L_5A49:
        PULR    R7                              ; 5A49   02B7

L_5A4A:
        PSHR    R5                              ; 5A4A   0275
        CLRR    R0                              ; 5A4B   01C0
        MVO@    R0,     R1                      ; 5A4C   0248
        SUBI    #$031D, R1                      ; 5A4D   0339 031D
        SLR     R1,     2                       ; 5A4F   0065
        SLR     R1,     1                       ; 5A50   0061
        DECR    R1                              ; 5A51   0011
        MVII    #$015D, R2                      ; 5A52   02BA 015D
        ADDR    R1,     R2                      ; 5A54   00CA
        CLRR    R1                              ; 5A55   01C9
        MVO@    R1,     R2                      ; 5A56   0251
        PULR    R7                              ; 5A57   02B7

L_5A58:
        PSHR    R5                              ; 5A58   0275
        PSHR    R1                              ; 5A59   0271
        PSHR    R2                              ; 5A5A   0272
        MOVR    R2,     R0                      ; 5A5B   0090

        JSR     R5,     X_UNPK_BYTES            ; 5A5C   0004 0114 0357

        ANDI    #$00FF, R0                      ; 5A5F   03B8 00FF
        MOVR    R0,     R2                      ; 5A61   0082
        MOVR    R1,     R3                      ; 5A62   008B
        MVII    #$0050, R0                      ; 5A63   02B8 0050
        MVII    #$0058, R1                      ; 5A65   02B9 0058

        JSR     R5,     .EXEC.78C               ; 5A67   0004 0114 038C

        MOVR    R2,     R1                      ; 5A6A   0091

        JSR     R5,     X_SQRT                  ; 5A6B   0004 011C 0223

        MOVR    R2,     R0                      ; 5A6E   0090
        MVII    #$0006, R1                      ; 5A6F   02B9 0006

        JSR     R5,     X_MPY                   ; 5A71   0004 011C 01DC

        MOVR    R2,     R1                      ; 5A74   0091
        MVII    #$000A, R2                      ; 5A75   02BA 000A

        JSR     R5,     X_DIVR                  ; 5A77   0004 011C 01F8

        PULR    R2                              ; 5A7A   02B2
        PULR    R1                              ; 5A7B   02B1
        PULR    R7                              ; 5A7C   02B7

        PSHR    R5                              ; 5A7D   0275
        PSHR    R1                              ; 5A7E   0271
        ADDI    #$0007, R1                      ; 5A7F   02F9 0007
        MVI@    R1,     R0                      ; 5A81   0288
        MVI@    R1,     R2                      ; 5A82   028A
        SUBI    #$0005, R1                      ; 5A83   0339 0005
        SDBD                                    ; 5A85   0001
        ANDI    #$FF00, R0                      ; 5A86   03B8 0000 00FF
        MVO@    R0,     R1                      ; 5A89   0248
        INCR    R1                              ; 5A8A   0009
        SWAP    R2,     1                       ; 5A8B   0042
        SDBD                                    ; 5A8C   0001
        ANDI    #$FF00, R2                      ; 5A8D   03BA 0000 00FF
        MVO@    R2,     R1                      ; 5A90   024A
        PULR    R1                              ; 5A91   02B1
        PSHR    R1                              ; 5A92   0271
        ADDI    #$0005, R1                      ; 5A93   02F9 0005
        MVII    #$0006, R0                      ; 5A95   02B8 0006
        MVO@    R0,     R1                      ; 5A97   0248
        PULR    R4                              ; 5A98   02B4
        PSHR    R4                              ; 5A99   0274
        ADDI    #$0002, R4                      ; 5A9A   02FC 0002
        MVI@    R4,     R2                      ; 5A9C   02A2
        MVI@    R4,     R3                      ; 5A9D   02A3
        SWAP    R2,     1                       ; 5A9E   0042
        SWAP    R3,     1                       ; 5A9F   0043
        PULR    R1                              ; 5AA0   02B1
        ADDI    #$0007, R1                      ; 5AA1   02F9 0007
        CMPI    #$0024, R2                      ; 5AA3   037A 0024
        BLE     L_5ACD                          ; 5AA5   0206 0026

        CMPI    #$0082, R2                      ; 5AA7   037A 0082
        BGE     L_5ACD                          ; 5AA9   020D 0022

        CMPI    #$0010, R3                      ; 5AAB   037B 0010
        BLE     L_5ABB                          ; 5AAD   0206 000C

        CMPI    #$0048, R3                      ; 5AAF   037B 0048
        BGE     L_5ABB                          ; 5AB1   020D 0008

        SDBD                                    ; 5AB3   0001
        MVII    #$561D, R0                      ; 5AB4   02B8 001D 0056
        MVII    #$0004, R2                      ; 5AB7   02BA 0004
        B       L_5AC1                          ; 5AB9   0200 0006

L_5ABB:
        SDBD                                    ; 5ABB   0001
        MVII    #$5631, R0                      ; 5ABC   02B8 0031 0056
        MVII    #$0001, R2                      ; 5ABF   02BA 0001
L_5AC1:
        SUBI    #$0007, R1                      ; 5AC1   0339 0007
        MVI@    R1,     R3                      ; 5AC3   028B
        SDBD                                    ; 5AC4   0001
        XORI    #$8000, R3                      ; 5AC5   03FB 0000 0080
        MVO@    R3,     R1                      ; 5AC8   024B
        ADDI    #$0007, R1                      ; 5AC9   02F9 0007
        B       L_5AD3                          ; 5ACB   0200 0006

L_5ACD:
        SDBD                                    ; 5ACD   0001
        MVII    #$5628, R0                      ; 5ACE   02B8 0028 0056
        MVII    #$0004, R2                      ; 5AD1   02BA 0004
L_5AD3:
        MVO@    R2,     R1                      ; 5AD3   024A
        DECR    R1                              ; 5AD4   0011
        MVII    #$0001, R2                      ; 5AD5   02BA 0001
        MVO@    R2,     R1                      ; 5AD7   024A
        SUBI    #$0005, R1                      ; 5AD8   0339 0005
        MVO@    R0,     R1                      ; 5ADA   0248
        PULR    R7                              ; 5ADB   02B7

        PSHR    R5                              ; 5ADC   0275
        MVI@    R1,     R0                      ; 5ADD   0288
        SDBD                                    ; 5ADE   0001
        ANDI    #$7FFF, R0                      ; 5ADF   03B8 00FF 007F
        SDBD                                    ; 5AE2   0001
        ANDI    #$F7FF, R0                      ; 5AE3   03B8 00FF 00F7
        MVO@    R0,     R1                      ; 5AE6   0248
        ADDI    #$0004, R1                      ; 5AE7   02F9 0004
        MVI@    R1,     R0                      ; 5AE9   0288
        PSHR    R1                              ; 5AEA   0271

        JSR     R5,     X_UNPK_BYTES            ; 5AEB   0004 0114 0357

        NEGR    R0                              ; 5AEE   0020

        JSR     R5,     X_PACK_BYTES            ; 5AEF   0004 0114 034F

        PULR    R1                              ; 5AF2   02B1
        MVO@    R0,     R1                      ; 5AF3   0248
        ADDI    #$0003, R1                      ; 5AF4   02F9 0003
        MVI@    R1,     R2                      ; 5AF6   028A
        DECR    R2                              ; 5AF7   0012
        MVO@    R2,     R1                      ; 5AF8   024A

        JSR     R5,     L_5BC1                  ; 5AF9   0004 0158 03C1

        PULR    R7                              ; 5AFC   02B7

        PSHR    R5                              ; 5AFD   0275
        ADDI    #$0007, R1                      ; 5AFE   02F9 0007
        MVI@    R1,     R2                      ; 5B00   028A
        INCR    R2                              ; 5B01   000A
        ADDR    R7,     R2                      ; 5B02   00FA
        ADD@    R2,     R7                      ; 5B03   02D7

        DECLE   $003B,  $0032,  $0005,  $002A   ; 5B04   003B 0032 0005 002A
        DECLE   $000F                           ; 5B08   000F

        SUBI    #$0007, R1                      ; 5B09   0339 0007
        MVI@    R1,     R2                      ; 5B0B   028A
        SDBD                                    ; 5B0C   0001
        XORI    #$0800, R2                      ; 5B0D   03FA 0000 0008
        MVO@    R2,     R1                      ; 5B10   024A
        ADDI    #$0007, R1                      ; 5B11   02F9 0007
        MVII    #$0001, R2                      ; 5B13   02BA 0001
        MVO@    R2,     R1                      ; 5B15   024A
        DECR    R1                              ; 5B16   0011
        MVO@    R2,     R1                      ; 5B17   024A
        SUBI    #$0005, R1                      ; 5B18   0339 0005
        SDBD                                    ; 5B1A   0001
        MVII    #$5631, R2                      ; 5B1B   02BA 0031 0056
        MVO@    R2,     R1                      ; 5B1E   024A
        DECR    R1                              ; 5B1F   0011
        MVI@    R1,     R0                      ; 5B20   0288
        SDBD                                    ; 5B21   0001
        ANDI    #$8000, R0                      ; 5B22   03B8 0000 0080
        BNEQ    L_5B2D                          ; 5B25   020C 0006

        MVI@    R1,     R0                      ; 5B27   0288
        SDBD                                    ; 5B28   0001
        XORI    #$8000, R0                      ; 5B29   03F8 0000 0080
        MVO@    R0,     R1                      ; 5B2C   0248
L_5B2D:
        PULR    R7                              ; 5B2D   02B7

        MVII    #$0002, R2                      ; 5B2E   02BA 0002
        MVO@    R2,     R1                      ; 5B30   024A
        DECR    R1                              ; 5B31   0011
        MVII    #$0002, R2                      ; 5B32   02BA 0002
        MVO@    R2,     R1                      ; 5B34   024A
        PULR    R7                              ; 5B35   02B7

        SUBI    #$0007, R1                      ; 5B36   0339 0007

        JSR     R5,     L_5BDB                  ; 5B38   0004 0158 03DB
L_5B3B:
        JSR     R5,     L_5A4A                  ; 5B3B   0004 0158 024A

        PULR    R7                              ; 5B3E   02B7

        CLRR    R2                              ; 5B3F   01D2
        MVO     R2,     G_0352                  ; 5B40   0242 0352
        SDBD                                    ; 5B42   0001
        MVII    #$5000, R0                      ; 5B43   02B8 0000 0050
        SDBD                                    ; 5B46   0001
        MVII    #$2800, R3                      ; 5B47   02BB 0000 0028
        MVO     R0,     G_034F                  ; 5B4A   0240 034F
        MVO     R3,     G_0350                  ; 5B4C   0243 0350
        MVO     R2,     G_0169                  ; 5B4E   0242 0169
        INCR    R2                              ; 5B50   000A
        MVO     R2,     G_0166                  ; 5B51   0242 0166
        SUBI    #$0007, R1                      ; 5B53   0339 0007
        B       L_5B3B                          ; 5B55   0220 001B

        PSHR    R5                              ; 5B57   0275
        PSHR    R1                              ; 5B58   0271
        MVII    #$034F, R4                      ; 5B59   02BC 034F

        JSR     R5,     L_5C8F                  ; 5B5B   0004 015C 008F

        PSHR    R4                              ; 5B5E   0274

        JSR     R5,     L_5C35                  ; 5B5F   0004 015C 0035

        PULR    R4                              ; 5B62   02B4
        MVO@    R0,     R4                      ; 5B63   0260
        PULR    R1                              ; 5B64   02B1
        ADDI    #$0007, R1                      ; 5B65   02F9 0007
        CLRR    R2                              ; 5B67   01D2
        MVO@    R2,     R1                      ; 5B68   024A

        JSR     R5,     L_5B6D                  ; 5B69   0004 0158 036D

        PULR    R7                              ; 5B6C   02B7

L_5B6D:
        PSHR    R5                              ; 5B6D   0275

        JSR     R5,     X_PLAY_SFX2             ; 5B6E   0004 0118 03BE
        DECLE   $0028                           ; 5B71  SFX prio
        DECLE   $002F                           ; 5B72  SFX data
        DECLE   $039D                           ; 5B73  SFX data
        DECLE   $014F,  $000E                   ; 5B74  SFX data
        DECLE   $0389                           ; 5B76  SFX data
        DECLE   $0340,  $002D                   ; 5B77  SFX data
        DECLE   $0348,  $0069                   ; 5B79  SFX data
        DECLE   $0344,  $00AD                   ; 5B7B  SFX data
        DECLE   $0021,  $002B                   ; 5B7D  SFX data
        DECLE   $0077,  $0085,  $005B           ; 5B7F  SFX data
        DECLE   $0123,  $03CC                   ; 5B82  SFX data
        DECLE   $02CF                           ; 5B84  SFX end

UC_5B85:
        MVI     G_015A, R1                      ; 5B85  SLIB UCALL target
        MVII    #$01FB, R5                      ; 5B87   02BD 01FB
        DECR    R1                              ; 5B89   0011
        MVO     R1,     G_015A                  ; 5B8A   0241 015A
        MVO@    R1,     R5                      ; 5B8C   0269
        MVO@    R1,     R5                      ; 5B8D   0269
        MVO@    R1,     R5                      ; 5B8E   0269
        PULR    R7                              ; 5B8F   02B7

        PSHR    R5                              ; 5B90   0275

        JSR     R5,     X_PLAY_SFX2             ; 5B91   0004 0118 03BE
        DECLE   $0014                           ; 5B94  SFX prio

        ADCR    R7                              ; 5B95   002F

        XOR@    R1,     R1                      ; 5B96   03C9
L_5B97:
        SWAP    R0,     1                       ; 5B97   0040
        DECLE   $001E,  $0048,  $002A,  $00FC   ; 5B98   001E 0048 002A 00FC
        DECLE   $03FF,  $000B,  $016B,  $0040   ; 5B9C   03FF 000B 016B 0040
        DECLE   $00C8,  $0048,  $00E1,  $0001   ; 5BA0   00C8 0048 00E1 0001
        DECLE   $03EF                           ; 5BA4   03EF

        MOVR    R1,     R7                      ; 5BA5   008F

        DECLE   $001D,  $03CF                   ; 5BA6   001D 03CF

        PULR    R7                              ; 5BA8   02B7

        PSHR    R5                              ; 5BA9   0275

        JSR     R5,     X_PLAY_SFX2             ; 5BAA   0004 0118 03BE
        DECLE   $0014                           ; 5BAD  SFX prio

        ADCR    R7                              ; 5BAE   002F

        XOR@    R1,     R1                      ; 5BAF   03C9
L_5BB0:
        SWAP    R0,     1                       ; 5BB0   0040
        DECLE   $004B,  $0048,  $006E,  $007C   ; 5BB1   004B 0048 006E 007C
        DECLE   $03FF,  $000B,  $016B,  $0040   ; 5BB5   03FF 000B 016B 0040
        DECLE   $00C8,  $0048,  $00CA,  $0001   ; 5BB9   00C8 0048 00CA 0001
L_5BBD:
        DECR    R7                              ; 5BBD   0017

        DECLE   $012B,  $03CF                   ; 5BBE   012B 03CF

        PULR    R7                              ; 5BC0   02B7

L_5BC1:
        PSHR    R5                              ; 5BC1   0275

        JSR     R5,     X_PLAY_SFX2             ; 5BC2   0004 0118 03BE
        DECLE   $0014                           ; 5BC5  SFX prio

        ADCR    R7                              ; 5BC6   002F

        XOR@    R1,     R1                      ; 5BC7   03C9
L_5BC8:
        SWAP    R0,     1                       ; 5BC8   0040
        DECLE   $007B,  $0048,  $007C,  $015B   ; 5BC9   007B 0048 007C 015B
        DECLE   $007C,  $03FF,  $000B,  $016B   ; 5BCD   007C 03FF 000B 016B
        DECLE   $0040,  $014C,  $0048,  $014C   ; 5BD1   0040 014C 0048 014C
        DECLE   $039B,  $0001,  $0067,  $00EB   ; 5BD5   039B 0001 0067 00EB
        DECLE   $03CF                           ; 5BD9   03CF

        PULR    R7                              ; 5BDA   02B7

L_5BDB:
        PSHR    R5                              ; 5BDB   0275

        JSR     R5,     L_5C06                  ; 5BDC   0004 015C 0006

        MOVR    R1,     R4                      ; 5BDF   008C
        ADDI    #$0002, R4                      ; 5BE0   02FC 0002
        PSHR    R1                              ; 5BE2   0271

        JSR     R5,     L_5C8F                  ; 5BE3   0004 015C 008F

        PULR    R1                              ; 5BE6   02B1
        MVI@    R4,     R0                      ; 5BE7   02A0
        SDBD                                    ; 5BE8   0001
        CMPI    #$0846, R0                      ; 5BE9   0378 0046 0008
        BEQ     L_5BFF                          ; 5BEC   0204 0011

        CLRR    R3                              ; 5BEE   01DB
        RSWD    R3                              ; 5BEF   003B
        SLLC    R0,     2                       ; 5BF0   005C
        BOV     L_5BF9                          ; 5BF1   0202 0006

        GSWD    R3                              ; 5BF3   0033
        XORI    #$0020, R3                      ; 5BF4   03FB 0020
        RSWD    R3                              ; 5BF6   003B
        B       L_5BFC                          ; 5BF7   0200 0003
L_5BF9:
        BC      L_5C00                          ; 5BF9   0201 0005

        SETC                                    ; 5BFB   0007
L_5BFC:
        RRC     R0,     2                       ; 5BFC   0074
L_5BFD:
        DECR    R4                              ; 5BFD   0014
        MVO@    R0,     R4                      ; 5BFE   0260
L_5BFF:
        PULR    R7                              ; 5BFF   02B7

L_5C00:
        SDBD                                    ; 5C00   0001
        MVII    #$0846, R0                      ; 5C01   02B8 0046 0008
        B       L_5BFD                          ; 5C04   0220 0008

L_5C06:
        PSHR    R5                              ; 5C06   0275
        MOVR    R1,     R4                      ; 5C07   008C
        ADDI    #$0002, R4                      ; 5C08   02FC 0002
        MVI@    R4,     R2                      ; 5C0A   02A2
        MVI@    R4,     R3                      ; 5C0B   02A3
        SDBD                                    ; 5C0C   0001
        CMPI    #$0800, R3                      ; 5C0D   037B 0000 0008
        BLT     L_5C25                          ; 5C10   0205 0013

        SDBD                                    ; 5C12   0001
        CMPI    #$4600, R3                      ; 5C13   037B 0000 0046
        BGT     L_5C25                          ; 5C16   020E 000D

        SDBD                                    ; 5C18   0001
        CMPI    #$3000, R2                      ; 5C19   037A 0000 0030
        BLT     L_5C25                          ; 5C1C   0205 0007

        SDBD                                    ; 5C1E   0001
        CMPI    #$7900, R2                      ; 5C1F   037A 0000 0079
        BGT     L_5C25                          ; 5C22   020E 0001
        PULR    R7                              ; 5C24   02B7

L_5C25:
        PULR    R0                              ; 5C25   02B0
        PULR    R7                              ; 5C26   02B7

        DECLE   $000E,  $0008,  $0009,  $0008   ; 5C27   000E 0008 0009 0008
        DECLE   $000E,  $0008,  $0009,  $0008   ; 5C2B   000E 0008 0009 0008
        DECLE   $000A,  $0008,  $0005           ; 5C2F   000A 0008 0005

        COMR    R0                              ; 5C32   0018
        INCR    R5                              ; 5C33   000D
        INCR    R0                              ; 5C34   0008
L_5C35:
        PSHR    R5                              ; 5C35   0275

        JSR     R5,     L_5C5D                  ; 5C36   0004 015C 005D

        SDBD                                    ; 5C39   0001
        MVII    #$5C27, R5                      ; 5C3A   02BD 0027 005C
        SLL     R0,     1                       ; 5C3D   0048
        ADDR    R0,     R5                      ; 5C3E   00C5
        SDBD                                    ; 5C3F   0001
        MVI@    R5,     R0                      ; 5C40   02A8
        PULR    R7                              ; 5C41   02B7

        DECLE   $0000,  $0000,  $0000,  $0040   ; 5C42   0000 0000 0000 0040
        DECLE   $0049,  $0049,  $0001,  $0091   ; 5C46   0049 0049 0001 0091
        DECLE   $0092,  $000A,  $0088,  $00DB   ; 5C4A   0092 000A 0088 00DB
        DECLE   $0053,  $0040,  $011A,  $009C   ; 5C4E   0053 0040 011A 009C
        DECLE   $0001,  $00D1,  $00DB,  $000A   ; 5C52   0001 00D1 00DB 000A
        DECLE   $0088,  $0092,  $0052,  $0040   ; 5C56   0088 0092 0052 0040
        DECLE   $0049,  $0049,  $0001           ; 5C5A   0049 0049 0001
L_5C5D:
        PSHR    R5                              ; 5C5D   0275
        CLRR    R0                              ; 5C5E   01C0
        SUBI    #$0205, R4                      ; 5C5F   033C 0205
L_5C61:
        BMI     L_5C8D                          ; 5C61   020B 002A

        CMPI    #$0009, R4                      ; 5C63   037C 0009
        BLE     L_5C70                          ; 5C65   0206 0009

        INCR    R0                              ; 5C67   0008
        CMPI    #$0007, R0                      ; 5C68   0378 0007
        BGT     L_5C8D                          ; 5C6A   020E 0021

        SUBI    #$0014, R4                      ; 5C6C   033C 0014
        B       L_5C61                          ; 5C6E   0220 000E

L_5C70:
        MVII    #$000A, R1                      ; 5C70   02B9 000A

        JSR     R5,     X_MPY                   ; 5C72   0004 011C 01DC

        ADDR    R4,     R2                      ; 5C75   00E2
        MOVR    R2,     R1                      ; 5C76   0091
        MVII    #$0003, R2                      ; 5C77   02BA 0003

        JSR     R5,     X_DIV                   ; 5C79   0004 011C 01FB

        SDBD                                    ; 5C7C   0001
        MVII    #$5C42, R4                      ; 5C7D   02BC 0042 005C
        ADDR    R0,     R4                      ; 5C80   00C4
        MVI@    R4,     R0                      ; 5C81   02A0
L_5C82:
        TSTR    R1                              ; 5C82   0089
        BNEQ    L_5C88                          ; 5C83   020C 0003

        ANDI    #$0007, R0                      ; 5C85   03B8 0007
        PULR    R7                              ; 5C87   02B7

L_5C88:
        SLR     R0,     2                       ; 5C88   0064
        SLR     R0,     1                       ; 5C89   0060
        DECR    R1                              ; 5C8A   0011
        B       L_5C82                          ; 5C8B   0220 000A

L_5C8D:
        PULR    R0                              ; 5C8D   02B0
        PULR    R7                              ; 5C8E   02B7

L_5C8F:
        PSHR    R5                              ; 5C8F   0275
        MVI@    R4,     R2                      ; 5C90   02A2
        MVI@    R4,     R0                      ; 5C91   02A0
        SWAP    R2,     1                       ; 5C92   0042
        SWAP    R0,     1                       ; 5C93   0040
        ANDI    #$00FF, R2                      ; 5C94   03BA 00FF
        ANDI    #$00FF, R0                      ; 5C96   03B8 00FF
        SUBI    #$0008, R2                      ; 5C98   033A 0008
        SUBI    #$0008, R0                      ; 5C9A   0338 0008
        SLR     R2,     2                       ; 5C9C   0066
        SLR     R2,     1                       ; 5C9D   0062
        SLR     R0,     2                       ; 5C9E   0064
        SLR     R0,     1                       ; 5C9F   0060
        MOVR    R2,     R4                      ; 5CA0   0094
        MVII    #$0014, R1                      ; 5CA1   02B9 0014

        JSR     R5,     X_MPY                   ; 5CA3   0004 011C 01DC

        ADDR    R4,     R2                      ; 5CA6   00E2
        MVII    #$0200, R4                      ; 5CA7   02BC 0200
        ADDR    R2,     R4                      ; 5CA9   00D4
        PULR    R7                              ; 5CAA   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5038       <entry>
;;  $5057       <entry>
;;  $50A1       $508D   $50D3  
;;  $50B1       <entry>
;;  $50BD       $50B5  
;;  $50BE       $50BA  
;;  $50C2       $50CB  
;;  $50CD       $50C5  
;;  $50D0       $50C9  
;;  $50E2       $50E6  
;;  $51C1       $5074   $50A9   $5988  
;;  $51D6       $5212  
;;  $51E4       $51CC  
;;  $51E6       $51D4   $51D9   $51E2   $5210  
;;  $5208       $5218  
;;  $5214       $520A  
;;  $521B       $5053  
;;  $523B       <entry>
;;  $5257       $5242   $52BD  
;;  $5261       $524E  
;;  $526D       $5255   $5284  
;;  $5276       $5250  
;;  $5286       $5263  
;;  $528B       $5291  
;;  $5296       $5278  
;;  $529B       $52A1  
;;  $52A6       $528E  
;;  $52B6       $5294   $52A4  
;;  $52B8       $525F   $5274   $52A8   $52B4   $52BB  
;;  $52B9       $529E  
;;  $52BF       $5252  
;;  $52C9       $52C5  
;;  $52D1       $52CF  
;;  $52D5       $52CD  
;;  $52D6       $52D4  
;;  $52DF       $52E4   $52EC  
;;  $52E2       $52DB   $52E8  
;;  $52FB       $52F0  
;;  $5303       <entry>
;;  $530E       $5527  
;;  $5311       $530C  
;;  $5316       $5311   $54E0  
;;  $533B       $5337  
;;  $5349       $5343  
;;  $5358       $5326   $5355  
;;  $5360       $530E   $54DD  
;;  $537D       $5307   $5314   $54E8  
;;  $53A0       $540B   $5446   $547B  
;;  $53C9       $542E  
;;  $5407       $53EE   $53FE  
;;  $540D       $5405  
;;  $5427       $5462   $5497  
;;  $5499       $53BB  
;;  $54A7       $54FA   $550A   $5523  
;;  $54C1       $54BA  
;;  $54E0       $54D3   $54DB  
;;  $54EA       $54B5  
;;  $54EC       $5490  
;;  $54FC       $545B  
;;  $550C       $5420  
;;  $551E       $5518  
;;  $5525       $551C  
;;  $5529       $538E   $53D9   $5434   $5468  
;;  $5533       $552D   $5539  
;;  $5535       $53AC   $5411   $544C   $5481  
;;  $553F       $53A3   $53C6   $542B  
;;  $5558       $5549  
;;  $555A       $5553  
;;  $555D       $53A6  
;;  $55EE       $55EC  
;;  $561F       $561D  
;;  $562A       $5628  
;;  $5633       $5631  
;;  $5820       $581E  
;;  $5821       $581F  
;;  $5822       $5820  
;;  $5823       $5821  
;;  $5824       $5822  
;;  $5825       $5823  
;;  $5826       $5824  
;;  $5827       $5825  
;;  $5991       $5970  
;;  $599D       $5958  
;;  $59A5       $5543   $5969  
;;  $59BE       $59BA  
;;  $59C9       $59D3   $59F6  
;;  $59D1       $59C0  
;;  $59D5       $59B6  
;;  $59DA       $59AE  
;;  $59E7       $59E3  
;;  $59F4       $59EA  
;;  $59F8       $59DF  
;;  $59FB       $59C7   $59CF   $59D8   $59F2  
;;  $59FC       $59BC   $59E5  
;;  $5A06       $5A02  
;;  $5A49       $5A0A  
;;  $5A4A       $5B3B  
;;  $5A58       $5A39  
;;  $5ABB       $5AAD   $5AB1  
;;  $5AC1       $5AB9  
;;  $5ACD       $5AA5   $5AA9  
;;  $5AD3       $5ACB  
;;  $5B2D       $5B25  
;;  $5B3B       $5B55  
;;  $5B6D       $5B69  
;;  $5B85       <entry>
;;  $5B97       $5B95  
;;  $5BB0       $5BAE  
;;  $5BBD       $5BBD  
;;  $5BC1       $5AF9  
;;  $5BC8       $5BC6  
;;  $5BDB       $5B38  
;;  $5BF9       $5BF1  
;;  $5BFC       $5BF7  
;;  $5BFD       $5C04  
;;  $5BFF       $5BEC  
;;  $5C00       $5BF9  
;;  $5C06       $5BDC  
;;  $5C25       $5C10   $5C16   $5C1C   $5C22  
;;  $5C35       $5B5F  
;;  $5C5D       $5C36  
;;  $5C61       $5C6E  
;;  $5C70       $5C65  
;;  $5C82       $5C8B  
;;  $5C88       $5C83  
;;  $5C8D       $5C61   $5C6A  
;;  $5C8F       $53F2   $54A9   $5B5B   $5BE3  
;; ======================================================================== ;;
