
        ORG     $5000
.HEADER:
        BIDECLE $5FC2           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5047           ; 5004  Ptr: Start of game
        BIDECLE $5898           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $6F08           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5034           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $000F,  $000F   ; 500F  Color Stack init (0, 1)
        DECLE   $000F,  $000F   ; 5011  Color Stack init (2, 3)
        DECLE   $000F           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $007D,  $00D0,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0001,  $0051,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $0091,  $0054,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $004D,  $0054,  $0004,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

        DECLE   $0000,  $0000                   ; 5032   0000 0000
.TITLE:
        DECLE   $0052                           ; 5034  Cartridge year
        STRING  " MAGIC CAROUSEL "              ; 5035  Title string
        DECLE   $0000                           ; 5045  

.TITLECODE:
        PULR    R7                              ; 5046   02B7

.START:
        PSHR    R5                              ; 5047   0275
        MVII    #$0200, R4                      ; 5048   02BC 0200
        MVII    #$00F0, R0                      ; 504A   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 504C   0004 0114 0338

        MVII    #$031D, R4                      ; 504F   02BC 031D
        MVII    #$0040, R0                      ; 5051   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5053   0004 0114 0338

        CLRR    R2                              ; 5056   01D2
        MVO     R2,     .STIC.CS.0              ; 5057   0242 0028
        MVII    #$000F, R2                      ; 5059   02BA 000F
        MVO     R2,     .STIC.BORD              ; 505B   0242 002C
        MVO     R2,     .STIC.MODE              ; 505D   0242 0021
        MVII    #$000F, R0                      ; 505F   02B8 000F
        MVO     R0,     G_0171                  ; 5061   0240 0171

        JSR     R5,     L_51FF                  ; 5063   0004 0150 01FF

        MVII    #$000F, R0                      ; 5066   02B8 000F
        MVO     R0,     G_0171                  ; 5068   0240 0171
        SDBD                                    ; 506A   0001
        MVII    #$2401, R3                      ; 506B   02BB 0001 0024
        MVII    #$0252, R4                      ; 506E   02BC 0252
        SDBD                                    ; 5070   0001
        MVII    #$5035, R1                      ; 5071   02B9 0035 0050

        JSR     R5,     X_PRINT_R1              ; 5074   0004 0118 0067

        SDBD                                    ; 5077   0001
        MVII    #$2B46, R3                      ; 5078   02BB 0046 002B
        MVII    #$02E0, R4                      ; 507B   02BC 02E0
        MVO@    R3,     R4                      ; 507D   0263
        SDBD                                    ; 507E   0001
        MVII    #$2206, R3                      ; 507F   02BB 0006 0022

        JSR     R5,     X_PRINT_R5              ; 5082   0004 0118 007B
        STRING  "1982 MATTEL"                   ; 5085  
        DECLE   $0000,  $0001,  $02B8,  $00F7   ; 5090   0000 0001 02B8 00F7
        DECLE   $0050,  $0240,  $035D,  $0004   ; 5094   0050 0240 035D 0004
        DECLE   $016E,  $019F                   ; 5098   016E 019F

        MVII    #$0000, R0                      ; 509A   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 509C   0004 0114 02E6

        XORR    R3,     R6                      ; 509F   01DE
        MVII    #$0003, R0                      ; 50A0   02B8 0003
        MVO     R0,     G_0103                  ; 50A2   0240 0103
        EIS                                     ; 50A4   0002
        PULR    R7                              ; 50A5   02B7

        PSHR    R5                              ; 50A6   0275
        MVII    #$0252, R5                      ; 50A7   02BD 0252
        SDBD                                    ; 50A9   0001
        MVII    #$2CF2, R3                      ; 50AA   02BB 00F2 002C
L_50AD:
        CMPI    #$0262, R5                      ; 50AD   037D 0262
L_50AF:
        BEQ     L_50BE                          ; 50AF   0204 000D

        MVO@    R3,     R5                      ; 50B1   026B
        ADDI    #$0008, R3                      ; 50B2   02FB 0008
        SDBD                                    ; 50B4   0001
        CMPI    #$2D12, R3                      ; 50B5   037B 0012 002D
        BLT     L_50AD                          ; 50B8   0225 000C

        SUBI    #$0020, R3                      ; 50BA   033B 0020
        B       L_50AD                          ; 50BC   0220 0010

L_50BE:
        MVII    #$02DE, R4                      ; 50BE   02BC 02DE
        MVI@    R4,     R2                      ; 50C0   02A2
        MVII    #$000D, R0                      ; 50C1   02B8 000D
L_50C3:
        MVO@    R2,     R4                      ; 50C3   0262
        DECR    R0                              ; 50C4   0010
        BNEQ    L_50C3                          ; 50C5   022C 0003

        SDBD                                    ; 50C7   0001
        MVII    #$5300, R0                      ; 50C8   02B8 0000 0053
        MVO     R0,     G_035D                  ; 50CB   0240 035D
        MVII    #$0008, R0                      ; 50CD   02B8 0008

        JSR     R5,     X_RAND2                 ; 50CF   0004 0114 029E

        SDBD                                    ; 50D2   0001
        MVII    #$5F9E, R3                      ; 50D3   02BB 009E 005F
        ADDR    R0,     R3                      ; 50D6   00C3
        MVO     R3,     G_0180                  ; 50D7   0243 0180
        SWAP    R3,     1                       ; 50D9   0043
        MVO     R3,     G_0181                  ; 50DA   0243 0181
        MVO     R0,     G_0171                  ; 50DC   0240 0171
        MVO     R0,     G_01AF                  ; 50DE   0240 01AF

        JSR     R5,     X_CLR_BIT               ; 50E0   0004 0114 02E6

        CMPR    R6,     R2                      ; 50E3   0172
        MVII    #$0001, R0                      ; 50E4   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 50E6   0004 0114 02E6

        XORR    R3,     R6                      ; 50E9   01DE
        MVII    #$0002, R0                      ; 50EA   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 50EC   0004 0114 02E6

        XORR    R3,     R6                      ; 50EF   01DE
        MVII    #$0003, R0                      ; 50F0   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 50F2   0004 0114 02E6

        XORR    R3,     R6                      ; 50F5   01DE
        PULR    R7                              ; 50F6   02B7

        MOVR    R4,     R6                      ; 50F7   00A6
        RLC     R0,     1                       ; 50F8   0050
        MOVR    R4,     R6                      ; 50F9   00A6
        RLC     R0,     1                       ; 50FA   0050
        MOVR    R4,     R6                      ; 50FB   00A6
        RLC     R0,     1                       ; 50FC   0050
        MOVR    R4,     R6                      ; 50FD   00A6
        RLC     R0,     1                       ; 50FE   0050
        MOVR    R4,     R6                      ; 50FF   00A6
        RLC     R0,     1                       ; 5100   0050
L_5101:
        PSHR    R5                              ; 5101   0275

        JSR     R5,     L_5112                  ; 5102   0004 0150 0112
        JSR     R5,     .EXEC.4F1               ; 5105   0004 0114 00F1
        JSR     R5,     L_5112                  ; 5108   0004 0150 0112
        JSR     R5,     X_PLAY_NOTE             ; 510B   0004 0118 02BD
        JSR     R5,     L_544D                  ; 510E   0004 0154 004D

        PULR    R7                              ; 5111   02B7

L_5112:
        PSHR    R5                              ; 5112   0275
        SDBD                                    ; 5113   0001
        MVII    #$5125, R3                      ; 5114   02BB 0025 0051

        JSR     R5,     L_51D8                  ; 5117   0004 0150 01D8
        JSR     R5,     X_PLAY_NOTE             ; 511A   0004 0118 02BD

        SDBD                                    ; 511D   0001
        MVII    #$5153, R3                      ; 511E   02BB 0053 0051

        JSR     R5,     L_51D8                  ; 5121   0004 0150 01D8

        PULR    R7                              ; 5124   02B7

        PSHR    R5                              ; 5125   0275
        MVII    #$0004, R2                      ; 5126   02BA 0004
        MVII    #$0040, R3                      ; 5128   02BB 0040
        MVII    #$0020, R0                      ; 512A   02B8 0020
        SDBD                                    ; 512C   0001
        MVII    #$5798, R4                      ; 512D   02BC 0098 0057

        JSR     R5,     L_51C1                  ; 5130   0004 0150 01C1

        MVII    #$0008, R0                      ; 5133   02B8 0008
        MVII    #$0080, R2                      ; 5135   02BA 0080
        SDBD                                    ; 5137   0001
        MVII    #$38D0, R1                      ; 5138   02B9 00D0 0038

        JSR     R5,     L_5172                  ; 513B   0004 0150 0172

        MVII    #$0008, R0                      ; 513E   02B8 0008
        SDBD                                    ; 5140   0001
        MVII    #$38D8, R1                      ; 5141   02B9 00D8 0038

        JSR     R5,     L_517E                  ; 5144   0004 0150 017E
        JSR     R5,     L_54F6                  ; 5147   0004 0154 00F6

        MVI     G_0160, R1                      ; 514A   0281 0160
        TSTR    R1                              ; 514C   0089
        BEQ     L_51A4                          ; 514D   0204 0055

L_514F:
        JSR     R5,     L_51F1                  ; 514F   0004 0150 01F1

        PULR    R7                              ; 5152   02B7

        PSHR    R5                              ; 5153   0275
        MVO     R0,     .STIC.VIDEN             ; 5154   0240 0020
        MVII    #$0008, R4                      ; 5156   02BC 0008
        SDBD                                    ; 5158   0001
        MVII    #$38E0, R1                      ; 5159   02B9 00E0 0038
        SDBD                                    ; 515C   0001
        MVII    #$38E8, R3                      ; 515D   02BB 00E8 0038

        JSR     R5,     L_518D                  ; 5160   0004 0150 018D

        MVII    #$0010, R0                      ; 5163   02B8 0010
        MVII    #$0080, R2                      ; 5165   02BA 0080
        SDBD                                    ; 5167   0001
        MVII    #$38C0, R1                      ; 5168   02B9 00C0 0038

        JSR     R5,     L_5172                  ; 516B   0004 0150 0172
        JSR     R5,     L_51F1                  ; 516E   0004 0150 01F1

        PULR    R7                              ; 5171   02B7

L_5172:
        MVI@    R1,     R3                      ; 5172   028B
        CLRC                                    ; 5173   0006
        RRC     R3,     1                       ; 5174   0073
        BNC     L_5178                          ; 5175   0209 0001

        XORR    R2,     R3                      ; 5177   01D3
L_5178:
        MVO@    R3,     R1                      ; 5178   024B
        INCR    R1                              ; 5179   0009
        DECR    R0                              ; 517A   0010
        BNEQ    L_5172                          ; 517B   022C 000A
        MOVR    R5,     R7                      ; 517D   00AF

L_517E:
        MVI@    R1,     R3                      ; 517E   028B
        CLRC                                    ; 517F   0006
        SWAP    R3,     1                       ; 5180   0043
        RLC     R3,     1                       ; 5181   0053
        BNC     L_5186                          ; 5182   0209 0002

        XORI    #$0100, R3                      ; 5184   03FB 0100
L_5186:
        SWAP    R3,     1                       ; 5186   0043
        MVO@    R3,     R1                      ; 5187   024B
        INCR    R1                              ; 5188   0009
        DECR    R0                              ; 5189   0010
        BNEQ    L_517E                          ; 518A   022C 000D
        MOVR    R5,     R7                      ; 518C   00AF

L_518D:
        CLRR    R0                              ; 518D   01C0
        CLRR    R2                              ; 518E   01D2
        CLRC                                    ; 518F   0006
        MVI@    R1,     R0                      ; 5190   0288
        SWAP    R0,     1                       ; 5191   0040
        MVI@    R3,     R2                      ; 5192   029A
        XORR    R0,     R2                      ; 5193   01C2
        RRC     R2,     1                       ; 5194   0072
        BNC     L_519B                          ; 5195   0209 0004

        SDBD                                    ; 5197   0001
        XORI    #$8000, R2                      ; 5198   03FA 0000 0080
L_519B:
        MVO@    R2,     R3                      ; 519B   025A
        SWAP    R2,     1                       ; 519C   0042
        MVO@    R2,     R1                      ; 519D   024A
        INCR    R1                              ; 519E   0009
        INCR    R3                              ; 519F   000B
        DECR    R4                              ; 51A0   0014
        BNEQ    L_518D                          ; 51A1   022C 0015
        MOVR    R5,     R7                      ; 51A3   00AF

L_51A4:
        MVII    #$0260, R1                      ; 51A4   02B9 0260
        MVII    #$0261, R2                      ; 51A6   02BA 0261

        JSR     R5,     L_65EA                  ; 51A8   0004 0164 01EA

        MVI     G_0162, R3                      ; 51AB   0283 0162
        CMPI    #$000C, R3                      ; 51AD   037B 000C
        BEQ     L_51BB                          ; 51AF   0204 000A

        TSTR    R3                              ; 51B1   009B
        BEQ     L_51B7                          ; 51B2   0204 0003

        DECR    R3                              ; 51B4   0013
        B       L_51BD                          ; 51B5   0200 0006

L_51B7:
        ADDI    #$000F, R3                      ; 51B7   02FB 000F
        B       L_51BD                          ; 51B9   0200 0002

L_51BB:
        SUBI    #$0009, R3                      ; 51BB   033B 0009
L_51BD:
        MVO     R3,     G_0162                  ; 51BD   0243 0162
        B       L_514F                          ; 51BF   0220 0071

L_51C1:
        PSHR    R5                              ; 51C1   0275
        MVI     G_0160, R1                      ; 51C2   0281 0160
        ADDI    #$0008, R1                      ; 51C4   02F9 0008
        CMPR    R3,     R1                      ; 51C6   0159
        BNEQ    L_51CA                          ; 51C7   020C 0001

        CLRR    R1                              ; 51C9   01C9
L_51CA:
        MVO     R1,     G_0160                  ; 51CA   0241 0160
        SLL     R1,     2                       ; 51CC   004D
        ADDR    R1,     R4                      ; 51CD   00CC
        SDBD                                    ; 51CE   0001
        MVII    #$38F0, R1                      ; 51CF   02B9 00F0 0038
        MVO     R0,     .STIC.VIDEN             ; 51D2   0240 0020

        JSR     R5,     .EXEC.730               ; 51D4   0004 0114 0330

        PULR    R7                              ; 51D7   02B7

L_51D8:
        PSHR    R5                              ; 51D8   0275
        CLRR    R0                              ; 51D9   01C0
        MVO     R0,     G_015F                  ; 51DA   0240 015F
        DIS                                     ; 51DC   0003
        MVI     .ISRVEC.0,R0                    ; 51DD   0280 0100
        MVO     R0,     G_015D                  ; 51DF   0240 015D
        MVI     .ISRVEC.1,R0                    ; 51E1   0280 0101
        MVO     R0,     G_015E                  ; 51E3   0240 015E
        MVO     R3,     .ISRVEC.0               ; 51E5   0243 0100
        SWAP    R3,     1                       ; 51E7   0043
        MVO     R3,     .ISRVEC.1               ; 51E8   0243 0101
L_51EA:
        EIS                                     ; 51EA   0002
        MVI     G_015F, R0                      ; 51EB   0280 015F
        TSTR    R0                              ; 51ED   0080
        BEQ     L_51EA                          ; 51EE   0224 0005
        PULR    R7                              ; 51F0   02B7

L_51F1:
        PSHR    R5                              ; 51F1   0275
        MVII    #$0001, R3                      ; 51F2   02BB 0001
        MVO     R3,     G_015F                  ; 51F4   0243 015F
        MVI     G_015D, R0                      ; 51F6   0280 015D
        MVO     R0,     .ISRVEC.0               ; 51F8   0240 0100
        MVI     G_015E, R0                      ; 51FA   0280 015E
        MVO     R0,     .ISRVEC.1               ; 51FC   0240 0101
        PULR    R7                              ; 51FE   02B7

L_51FF:
        PSHR    R5                              ; 51FF   0275
        MVII    #$00A8, R0                      ; 5200   02B8 00A8
        MVO     R0,     G_0116                  ; 5202   0240 0116
        MVII    #$0004, R0                      ; 5204   02B8 0004
        MVO     R0,     G_0117                  ; 5206   0240 0117
        CLRR    R1                              ; 5208   01C9
        MVO     R1,     G_011A                  ; 5209   0241 011A
        MVO     R1,     G_016D                  ; 520B   0241 016D
        MVO     R1,     G_0160                  ; 520D   0241 0160
        MVO     R1,     G_0173                  ; 520F   0241 0173
        MVO     R1,     G_017A                  ; 5211   0241 017A
        MVO     R1,     G_0161                  ; 5213   0241 0161
        MVO     R1,     G_017F                  ; 5215   0241 017F
        MVII    #$000E, R1                      ; 5217   02B9 000E
        MVO     R1,     G_0162                  ; 5219   0241 0162
        MVII    #$0001, R1                      ; 521B   02B9 0001
        MVO     R1,     G_016C                  ; 521D   0241 016C
        SDBD                                    ; 521F   0001
        MVII    #$5300, R0                      ; 5220   02B8 0000 0053
        MVO     R0,     G_035D                  ; 5223   0240 035D
        CLRR    R1                              ; 5225   01C9
        MVO     R1,     G_012A                  ; 5226   0241 012A
        MVO     R1,     G_012C                  ; 5228   0241 012C
        MVO     R1,     G_012E                  ; 522A   0241 012E

        JSR     R5,     L_6AFB                  ; 522C   0004 0168 02FB
        JSR     R5,     L_5112                  ; 522F   0004 0150 0112

        MVII    #$00F0, R0                      ; 5232   02B8 00F0
        MVII    #$0200, R4                      ; 5234   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5236   0004 0114 0338

        SDBD                                    ; 5239   0001
        MVII    #$5700, R4                      ; 523A   02BC 0000 0057
        CLRR    R1                              ; 523D   01C9
        MVO     R1,     G_0174                  ; 523E   0241 0174
        SDBD                                    ; 5240   0001
        MVII    #$5654, R3                      ; 5241   02BB 0054 0056
        MVII    #$00F0, R1                      ; 5244   02B9 00F0
        MVO     R1,     G_0175                  ; 5246   0241 0175
        MVII    #$00FF, R0                      ; 5248   02B8 00FF

        JSR     R5,     L_5419                  ; 524A   0004 0154 0019

        MVII    #$0010, R0                      ; 524D   02B8 0010
        MVII    #$0252, R4                      ; 524F   02BC 0252
        MOVR    R4,     R5                      ; 5251   00A5
L_5252:
        MVI@    R4,     R2                      ; 5252   02A2
        ADDI    #$0020, R2                      ; 5253   02FA 0020
        ANDI    #$01F8, R2                      ; 5255   03BA 01F8
        SDBD                                    ; 5257   0001
        XORI    #$2C02, R2                      ; 5258   03FA 0002 002C
        MVO@    R2,     R5                      ; 525B   026A
        DECR    R0                              ; 525C   0010
        BNEQ    L_5252                          ; 525D   022C 000C

        MVII    #$0282, R1                      ; 525F   02B9 0282
L_5261:
        MVI@    R1,     R2                      ; 5261   028A
        XORI    #$0001, R2                      ; 5262   03FA 0001
        MVO@    R2,     R1                      ; 5264   024A
        ADDI    #$0014, R1                      ; 5265   02F9 0014
        CMPI    #$02E6, R1                      ; 5267   0379 02E6
        BLT     L_5261                          ; 5269   0225 0009

        MVII    #$0008, R0                      ; 526B   02B8 0008
        SDBD                                    ; 526D   0001
        MVII    #$1040, R1                      ; 526E   02B9 0040 0010
        MVII    #$031D, R5                      ; 5271   02BD 031D
        SDBD                                    ; 5273   0001
        MVII    #$5A48, R4                      ; 5274   02BC 0048 005A
L_5277:
        MVO@    R1,     R5                      ; 5277   0269
        SDBD                                    ; 5278   0001
        MVI@    R4,     R3                      ; 5279   02A3
        MVO@    R3,     R5                      ; 527A   026B
        ADDI    #$0006, R5                      ; 527B   02FD 0006
        DECR    R0                              ; 527D   0010
        BNEQ    L_5277                          ; 527E   022C 0008

        MVII    #$0076, R0                      ; 5280   02B8 0076
        MVO     R0,     G_011A                  ; 5282   0240 011A
        MVII    #$0008, R0                      ; 5284   02B8 0008

        JSR     R5,     X_RAND2                 ; 5286   0004 0114 029E

        MOVR    R0,     R1                      ; 5289   0081
        ANDI    #$0001, R1                      ; 528A   03B9 0001
        BNEQ    L_528F                          ; 528C   020C 0001

        INCR    R0                              ; 528E   0008
L_528F:
        MVII    #$031D, R2                      ; 528F   02BA 031D
        MVO     R0,     G_016A                  ; 5291   0240 016A
        MVO     R0,     G_0168                  ; 5293   0240 0168
        CLRR    R0                              ; 5295   01C0

        JSR     R5,     L_5540                  ; 5296   0004 0154 0140

        MVI     G_031F, R1                      ; 5299   0281 031F
        ADDI    #$0100, R1                      ; 529B   02F9 0100
        MVO     R1,     G_031F                  ; 529D   0241 031F
        MVII    #$0008, R0                      ; 529F   02B8 0008

        JSR     R5,     X_RAND2                 ; 52A1   0004 0114 029E

        MOVR    R0,     R1                      ; 52A4   0081
        ANDI    #$0001, R1                      ; 52A5   03B9 0001
        BEQ     L_52AA                          ; 52A7   0204 0001

        DECR    R0                              ; 52A9   0010
L_52AA:
        MVII    #$0335, R2                      ; 52AA   02BA 0335
        MVO     R0,     G_016B                  ; 52AC   0240 016B
        MVO     R0,     G_0169                  ; 52AE   0240 0169
        MVII    #$0001, R0                      ; 52B0   02B8 0001

        JSR     R5,     L_5540                  ; 52B2   0004 0154 0140

        MVII    #$0042, R1                      ; 52B5   02B9 0042
        MVO     R1,     G_0166                  ; 52B7   0241 0166
        MVII    #$0003, R1                      ; 52B9   02B9 0003
        MVII    #$0044, R0                      ; 52BB   02B8 0044
        MVI@    R1,     R3                      ; 52BD   028B
        ADDR    R0,     R3                      ; 52BE   00C3
        MVO@    R3,     R1                      ; 52BF   024B
        MVII    #$003C, R2                      ; 52C0   02BA 003C
        SWAP    R0,     1                       ; 52C2   0040
        SWAP    R2,     1                       ; 52C3   0042
        MVI     G_0337, R3                      ; 52C4   0283 0337
        ADDR    R0,     R3                      ; 52C6   00C3
        MVO     R3,     G_0337                  ; 52C7   0243 0337
        MVO     R2,     G_0338                  ; 52C9   0242 0338
        MVII    #$0002, R1                      ; 52CB   02B9 0002
        MVO     R1,     G_0165                  ; 52CD   0241 0165
        MVO     R1,     G_0167                  ; 52CF   0241 0167
L_52D1:
        MVII    #$0008, R0                      ; 52D1   02B8 0008

        JSR     R5,     X_RAND2                 ; 52D3   0004 0114 029E

        MVI     G_0172, R2                      ; 52D6   0282 0172
        CMPI    #$00FF, R2                      ; 52D8   037A 00FF
        BNEQ    L_52DD                          ; 52DA   020C 0001

        CLRR    R2                              ; 52DC   01D2

L_52DD:
        JSR     R5,     L_5C92                  ; 52DD   0004 015C 0092

        MVO     R2,     G_0172                  ; 52E0   0242 0172
        BNEQ    L_52D1                          ; 52E2   022C 0012

        MVO     R1,     G_0171                  ; 52E4   0241 0171
        MVO     R1,     G_035A                  ; 52E6   0241 035A
        SDBD                                    ; 52E8   0001
        MVII    #$30E0, R2                      ; 52E9   02BA 00E0 0030
        SDBD                                    ; 52EC   0001
        MVII    #$5B2C, R4                      ; 52ED   02BC 002C 005B
        ADDR    R1,     R4                      ; 52F0   00CC
        MVI@    R4,     R3                      ; 52F1   02A3
        XORR    R3,     R2                      ; 52F2   01DA
        MVO     R2,     G_0355                  ; 52F3   0242 0355
        MVII    #$008D, R2                      ; 52F5   02BA 008D
        MVII    #$0045, R1                      ; 52F7   02B9 0045
        SWAP    R2,     1                       ; 52F9   0042
        SWAP    R1,     1                       ; 52FA   0041
        MVO     R2,     G_0357                  ; 52FB   0242 0357
        MVO     R1,     G_0358                  ; 52FD   0241 0358
        PULR    R7                              ; 52FF   02B7

        DECLE   $007A,  $0066,  $0000,  $0000   ; 5300   007A 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5304   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5308   0000 0000
L_530A:
        PSHR    R5                              ; 530A   0275
        MVII    #$00A0, R0                      ; 530B   02B8 00A0
        MVO     R0,     G_0116                  ; 530D   0240 0116
        MVII    #$0008, R0                      ; 530F   02B8 0008
        MVO     R0,     G_0117                  ; 5311   0240 0117
        MVII    #$0200, R4                      ; 5313   02BC 0200
        MVII    #$00F0, R0                      ; 5315   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5317   0004 0114 0338

        CLRR    R1                              ; 531A   01C9
        MVO     R1,     G_0183                  ; 531B   0241 0183
        MVO     R1,     G_0193                  ; 531D   0241 0193
        MVO     R1,     G_0192                  ; 531F   0241 0192
        MVO     R1,     G_0170                  ; 5321   0241 0170
        MVO     R1,     G_0188                  ; 5323   0241 0188
        MVO     R1,     G_0189                  ; 5325   0241 0189
        MVO     R1,     G_018B                  ; 5327   0241 018B
        MVO     R1,     G_018C                  ; 5329   0241 018C
        MVO     R1,     G_018E                  ; 532B   0241 018E
        MVO     R1,     G_018F                  ; 532D   0241 018F
        MVO     R1,     G_0190                  ; 532F   0241 0190
        MVO     R1,     G_0191                  ; 5331   0241 0191
        MVO     R1,     G_019A                  ; 5333   0241 019A
        MVO     R1,     G_011A                  ; 5335   0241 011A
        MVO     R1,     G_0323                  ; 5337   0241 0323
        MVO     R1,     G_0182                  ; 5339   0241 0182
        MVO     R1,     G_0178                  ; 533B   0241 0178
        SDBD                                    ; 533D   0001
        MVII    #$5409, R0                      ; 533E   02B8 0009 0054
        MVO     R0,     G_035D                  ; 5341   0240 035D
        MVII    #$0004, R0                      ; 5343   02B8 0004

        JSR     R5,     X_RAND2                 ; 5345   0004 0114 029E

        MOVR    R0,     R1                      ; 5348   0081
        ANDI    #$0001, R1                      ; 5349   03B9 0001
        BEQ     L_5353                          ; 534B   0204 0006

        CMPI    #$0001, R0                      ; 534D   0378 0001
        BEQ     L_5356                          ; 534F   0204 0005
        B       L_5358                          ; 5351   0200 0005

L_5353:
        SLL     R0,     1                       ; 5353   0048
        B       L_5358                          ; 5354   0200 0002

L_5356:
        MVII    #$0005, R0                      ; 5356   02B8 0005
L_5358:
        SLL     R0,     2                       ; 5358   004C
        SLL     R0,     1                       ; 5359   0048
        SDBD                                    ; 535A   0001
        MVII    #$5690, R4                      ; 535B   02BC 0090 0056
        ADDR    R0,     R4                      ; 535E   00C4
        MVII    #$0006, R0                      ; 535F   02B8 0006
        MVII    #$0004, R2                      ; 5361   02BA 0004
        SDBD                                    ; 5363   0001
        MVII    #$5413, R5                      ; 5364   02BD 0013 0054
        MVII    #$0217, R1                      ; 5367   02B9 0217
L_5369:
        SDBD                                    ; 5369   0001
        MVI@    R4,     R3                      ; 536A   02A3
        MVO@    R3,     R1                      ; 536B   024B
        DECR    R0                              ; 536C   0010
        BEQ     L_537B                          ; 536D   0204 000C

        MVI@    R5,     R3                      ; 536F   02AB
        ADDR    R3,     R1                      ; 5370   00D9
        ADDI    #$0006, R4                      ; 5371   02FC 0006
        SDBD                                    ; 5373   0001
        CMPI    #$56C0, R4                      ; 5374   037C 00C0 0056
        BGE     L_5405                          ; 5377   020D 008C
        B       L_5369                          ; 5379   0220 0011

L_537B:
        DECR    R2                              ; 537B   0012
        BEQ     L_5398                          ; 537C   0204 001A

        CMPI    #$0002, R2                      ; 537E   037A 0002
        BEQ     L_5386                          ; 5380   0204 0004

        SUBI    #$00AB, R1                      ; 5382   0339 00AB
        B       L_5388                          ; 5384   0200 0002

L_5386:
        SUBI    #$0099, R1                      ; 5386   0339 0099
L_5388:
        SDBD                                    ; 5388   0001
        MVII    #$5413, R5                      ; 5389   02BD 0013 0054
        MVII    #$0006, R0                      ; 538C   02B8 0006
        ADDI    #$0008, R4                      ; 538E   02FC 0008
        SDBD                                    ; 5390   0001
        CMPI    #$56C0, R4                      ; 5391   037C 00C0 0056
        BGE     L_5405                          ; 5394   020D 006F
        B       L_5369                          ; 5396   0220 002E

L_5398:
        SDBD                                    ; 5398   0001
        MVII    #$56C0, R4                      ; 5399   02BC 00C0 0056
        MVII    #$02D1, R5                      ; 539C   02BD 02D1
        SDBD                                    ; 539E   0001
        MVI@    R4,     R3                      ; 539F   02A3
        MVO@    R3,     R5                      ; 53A0   026B
        SDBD                                    ; 53A1   0001
        MVI@    R4,     R3                      ; 53A2   02A3
        MVO@    R3,     R5                      ; 53A3   026B
        ADDI    #$0012, R5                      ; 53A4   02FD 0012
        SDBD                                    ; 53A6   0001
        MVI@    R4,     R3                      ; 53A7   02A3
        MVO@    R3,     R5                      ; 53A8   026B
        SDBD                                    ; 53A9   0001
        MVI@    R4,     R3                      ; 53AA   02A3
        MVO@    R3,     R5                      ; 53AB   026B
        MVII    #$0004, R0                      ; 53AC   02B8 0004
        SDBD                                    ; 53AE   0001
        MVII    #$5778, R4                      ; 53AF   02BC 0078 0057
        MVII    #$001A, R1                      ; 53B2   02B9 001A
        MVO     R1,     G_0174                  ; 53B4   0241 0174
        SDBD                                    ; 53B6   0001
        MVII    #$56DE, R3                      ; 53B7   02BB 00DE 0056
        MVII    #$00AE, R1                      ; 53BA   02B9 00AE
        MVO     R1,     G_0175                  ; 53BC   0241 0175

        JSR     R5,     L_5419                  ; 53BE   0004 0154 0019

        MVI     G_0171, R0                      ; 53C1   0280 0171
        ANDI    #$0001, R0                      ; 53C3   03B8 0001
        BEQ     L_53C9                          ; 53C5   0204 0002
        B       L_53DE                          ; 53C7   0200 0015

L_53C9:
        MVII    #$0020, R0                      ; 53C9   02B8 0020
        MVII    #$031D, R1                      ; 53CB   02B9 031D
        MVII    #$0335, R4                      ; 53CD   02BC 0335

        JSR     R5,     .EXEC.730               ; 53CF   0004 0114 0330
        JSR     R5,     L_5BD1                  ; 53D2   0004 0158 03D1

        MVII    #$0355, R4                      ; 53D5   02BC 0355
        MVII    #$0008, R0                      ; 53D7   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 53D9   0004 0114 0338

        B       L_53E5                          ; 53DC   0200 0007

L_53DE:
        MVII    #$0335, R4                      ; 53DE   02BC 0335
        MVII    #$0028, R0                      ; 53E0   02B8 0028

        JSR     R5,     X_FILL_ZERO             ; 53E2   0004 0114 0338

L_53E5:
        MVII    #$000E, R0                      ; 53E5   02B8 000E
        MVO     R0,     G_011A                  ; 53E7   0240 011A
        SDBD                                    ; 53E9   0001
        MVII    #$5D00, R1                      ; 53EA   02B9 0000 005D
        SDBD                                    ; 53ED   0001
        MVII    #$3200, R2                      ; 53EE   02BA 0000 0032
        MVI     G_0171, R0                      ; 53F1   0280 0171
        SUBI    #$0005, R0                      ; 53F3   0338 0005
        BMI     L_53F9                          ; 53F5   020B 0002

        SUBI    #$0200, R2                      ; 53F7   033A 0200
L_53F9:
        MVO     R1,     G_031F                  ; 53F9   0241 031F
        MVO     R2,     G_0320                  ; 53FB   0242 0320
        CLRR    R3                              ; 53FD   01DB

        JSR     R5,     L_6923                  ; 53FE   0004 0168 0123
        JSR     R5,     L_D00C                  ; 5401   0004 01D0 000C

        PULR    R7                              ; 5404   02B7

L_5405:
        SUBI    #$0030, R4                      ; 5405   033C 0030
        B       L_5369                          ; 5407   0220 009F

        DECLE   $00CC,  $0067,  $0034,  $005B   ; 5409   00CC 0067 0034 005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 540D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0042   ; 5411   0000 0000 000C 0042
        DECLE   $0010,  $0042,  $000C,  $0000   ; 5415   0010 0042 000C 0000
L_5419:
        PSHR    R5                              ; 5419   0275
        MVI     G_0174, R5                      ; 541A   0285 0174
        ADDI    #$0200, R5                      ; 541C   02FD 0200
L_541E:
        MVI@    R4,     R2                      ; 541E   02A2
        MOVR    R2,     R1                      ; 541F   0091
        SLR     R2,     2                       ; 5420   0066
        SLR     R2,     2                       ; 5421   0066
        SLR     R2,     1                       ; 5422   0062
        SLL     R2,     1                       ; 5423   004A
        PSHR    R4                              ; 5424   0274
        PSHR    R5                              ; 5425   0275
        ADDR    R3,     R2                      ; 5426   00DA
        ANDI    #$001F, R1                      ; 5427   03B9 001F
        SLL     R1,     1                       ; 5429   0049
        ADDR    R3,     R1                      ; 542A   00D9
        MOVR    R1,     R4                      ; 542B   008C
        MOVR    R2,     R5                      ; 542C   0095
        SDBD                                    ; 542D   0001
        MVI@    R4,     R1                      ; 542E   02A1
        SDBD                                    ; 542F   0001
        MVI@    R5,     R2                      ; 5430   02AA
        PULR    R5                              ; 5431   02B5
        PULR    R4                              ; 5432   02B4
        MVO@    R2,     R5                      ; 5433   026A
        MVO@    R1,     R5                      ; 5434   0269
        DECR    R0                              ; 5435   0010
        BEQ     L_5440                          ; 5436   0204 0008

        MVI     G_0175, R1                      ; 5438   0281 0175
        ADDI    #$0200, R1                      ; 543A   02F9 0200
        CMPR    R1,     R5                      ; 543C   014D
        BLT     L_541E                          ; 543D   0225 0020
L_543F:
        PULR    R7                              ; 543F   02B7

L_5440:
        MVI     G_0175, R1                      ; 5440   0281 0175
        ADDI    #$0200, R1                      ; 5442   02F9 0200
        CMPR    R1,     R5                      ; 5444   014D
        BGE     L_543F                          ; 5445   022D 0007

        MVII    #$0004, R0                      ; 5447   02B8 0004
        ADDI    #$000C, R5                      ; 5449   02FD 000C
        B       L_541E                          ; 544B   0220 002E

L_544D:
        PSHR    R5                              ; 544D   0275
        MVII    #$0200, R4                      ; 544E   02BC 0200
        MVII    #$001E, R0                      ; 5450   02B8 001E

        JSR     R5,     X_RAND2                 ; 5452   0004 0114 029E

        PSHR    R0                              ; 5455   0270
        MVII    #$0002, R1                      ; 5456   02B9 0002
        ADDR    R0,     R4                      ; 5458   00C4
L_5459:
        MOVR    R4,     R3                      ; 5459   00A3
        MVI@    R4,     R2                      ; 545A   02A2
        MOVR    R2,     R0                      ; 545B   0090
        ANDI    #$00A0, R0                      ; 545C   03B8 00A0
        CMPI    #$00A0, R0                      ; 545E   0378 00A0
        BNEQ    L_546D                          ; 5460   020C 000B

        MVII    #$0004, R0                      ; 5462   02B8 0004

        JSR     R5,     X_RAND2                 ; 5464   0004 0114 029E

        SWAP    R0,     1                       ; 5467   0040
        SLL     R0,     1                       ; 5468   0048
        XORR    R0,     R2                      ; 5469   01C2
        SLL     R0,     2                       ; 546A   004C
        SLL     R0,     1                       ; 546B   0048
        XORR    R0,     R2                      ; 546C   01C2
L_546D:
        MVO@    R2,     R3                      ; 546D   025A
        DECR    R1                              ; 546E   0011
        BEQ     L_5477                          ; 546F   0204 0006

        PULR    R0                              ; 5471   02B0
        MVII    #$021E, R4                      ; 5472   02BC 021E
        ADDR    R0,     R4                      ; 5474   00C4
        B       L_5459                          ; 5475   0220 001D

L_5477:
        SDBD                                    ; 5477   0001
        MVII    #$3FDF, R3                      ; 5478   02BB 00DF 003F
        MVII    #$020A, R1                      ; 547B   02B9 020A
        MVI@    R1,     R2                      ; 547D   028A
        ADDI    #$0008, R2                      ; 547E   02FA 0008
        ANDR    R3,     R2                      ; 5480   019A
        MVO@    R2,     R1                      ; 5481   024A
        ADDI    #$0021, R1                      ; 5482   02F9 0021
        MVI@    R1,     R2                      ; 5484   028A
        ADDI    #$0008, R2                      ; 5485   02FA 0008
        ANDR    R3,     R2                      ; 5487   019A
        MVO@    R2,     R1                      ; 5488   024A
        ADDI    #$000E, R1                      ; 5489   02F9 000E
        MVI@    R1,     R2                      ; 548B   028A
        ADDI    #$0008, R2                      ; 548C   02FA 0008
        ANDR    R3,     R2                      ; 548E   019A
        MVO@    R2,     R1                      ; 548F   024A
        PULR    R7                              ; 5490   02B7

L_5491:
        PSHR    R5                              ; 5491   0275
        MVII    #$0003, R0                      ; 5492   02B8 0003
        MVII    #$0003, R1                      ; 5494   02B9 0003
        MVII    #$0320, R2                      ; 5496   02BA 0320
        SDBD                                    ; 5498   0001
        MVII    #$016C, R3                      ; 5499   02BB 006C 0001
L_549C:
        MVI@    R3,     R4                      ; 549C   029C
        TSTR    R4                              ; 549D   00A4
        BEQ     L_54BE                          ; 549E   0204 001E

        MVI@    R2,     R4                      ; 54A0   0294
        SDBD                                    ; 54A1   0001
        ANDI    #$FF00, R4                      ; 54A2   03BC 0000 00FF
        SDBD                                    ; 54A5   0001
        CMPI    #$3C00, R4                      ; 54A6   037C 0000 003C
        BLT     L_54F0                          ; 54A9   0205 0045

L_54AB:
        SUBI    #$0100, R4                      ; 54AB   033C 0100
        MVO@    R4,     R2                      ; 54AD   0254
        ADDI    #$0008, R2                      ; 54AE   02FA 0008
        MVI@    R2,     R4                      ; 54B0   0294
        DECR    R1                              ; 54B1   0011
        BNEQ    L_54AB                          ; 54B2   022C 0008

L_54B4:
        DECR    R0                              ; 54B4   0010
        CMPI    #$0002, R0                      ; 54B5   0378 0002
        BEQ     L_54DC                          ; 54B7   0204 0023

        CMPI    #$0001, R0                      ; 54B9   0378 0001
        BEQ     L_54E6                          ; 54BB   0204 0029
        PULR    R7                              ; 54BD   02B7

L_54BE:
        MVI@    R2,     R4                      ; 54BE   0294
        SDBD                                    ; 54BF   0001
        ANDI    #$FF00, R4                      ; 54C0   03BC 0000 00FF
        SDBD                                    ; 54C3   0001
        CMPI    #$4300, R4                      ; 54C4   037C 0000 0043
        BGT     L_54F0                          ; 54C7   020E 0027

L_54C9:
        ADDI    #$0100, R4                      ; 54C9   02FC 0100
        MVO@    R4,     R2                      ; 54CB   0254
        ADDI    #$0008, R2                      ; 54CC   02FA 0008
        MVI@    R2,     R4                      ; 54CE   0294
        DECR    R1                              ; 54CF   0011
        BNEQ    L_54C9                          ; 54D0   022C 0008

        DECR    R0                              ; 54D2   0010
        CMPI    #$0002, R0                      ; 54D3   0378 0002
        BEQ     L_54DC                          ; 54D5   0204 0005

        CMPI    #$0001, R0                      ; 54D7   0378 0001
        BEQ     L_54E6                          ; 54D9   0204 000B
        PULR    R7                              ; 54DB   02B7

L_54DC:
        MVII    #$0338, R2                      ; 54DC   02BA 0338
        MVII    #$0004, R1                      ; 54DE   02B9 0004
        SDBD                                    ; 54E0   0001
        MVII    #$016D, R3                      ; 54E1   02BB 006D 0001
        B       L_549C                          ; 54E4   0220 0049

L_54E6:
        MVII    #$0358, R2                      ; 54E6   02BA 0358
        MVII    #$0001, R1                      ; 54E8   02B9 0001
        SDBD                                    ; 54EA   0001
        MVII    #$016E, R3                      ; 54EB   02BB 006E 0001
        B       L_549C                          ; 54EE   0220 0053

L_54F0:
        MVI@    R3,     R4                      ; 54F0   029C
        XORI    #$0001, R4                      ; 54F1   03FC 0001
        MVO@    R4,     R3                      ; 54F3   025C
        B       L_54B4                          ; 54F4   0220 0041

L_54F6:
        PSHR    R5                              ; 54F6   0275
        MVI     G_0165, R3                      ; 54F7   0283 0165
        INCR    R3                              ; 54F9   000B
        MVO     R3,     G_0165                  ; 54FA   0243 0165
        MVI     G_0166, R3                      ; 54FC   0283 0166
        INCR    R3                              ; 54FE   000B
        MVO     R3,     G_0166                  ; 54FF   0243 0166
        MVII    #$0006, R1                      ; 5501   02B9 0006
L_5503:
        MVI@    R1,     R5                      ; 5503   028D
        INCR    R5                              ; 5504   000D
        MVO@    R5,     R1                      ; 5505   024D
        DECR    R1                              ; 5506   0011
        BPL     L_5503                          ; 5507   0223 0005

        MVI     .STIC.X.7,R5                    ; 5509   0285 0007
        DECR    R5                              ; 550B   0015
        MVO     R5,     .STIC.X.7               ; 550C   0245 0007
        MVII    #$0007, R0                      ; 550E   02B8 0007
        MVII    #$031F, R2                      ; 5510   02BA 031F
        MVII    #$0100, R5                      ; 5512   02BD 0100
L_5514:
        MVI@    R2,     R3                      ; 5514   0293
        ADDR    R5,     R3                      ; 5515   00EB
        MVO@    R3,     R2                      ; 5516   0253
        ADDI    #$0008, R2                      ; 5517   02FA 0008
        DECR    R0                              ; 5519   0010
        BNEQ    L_5514                          ; 551A   022C 0007

        MVI@    R2,     R3                      ; 551C   0293
        SUBR    R5,     R3                      ; 551D   012B
        MVO@    R3,     R2                      ; 551E   0253
        CLRR    R0                              ; 551F   01C0
        MVII    #$0080, R3                      ; 5520   02BB 0080
        SDBD                                    ; 5522   0001
        MVII    #$0165, R4                      ; 5523   02BC 0065 0001
        MVII    #$031D, R2                      ; 5526   02BA 031D
        CMP@    R4,     R3                      ; 5528   0363
        BEQ     L_553B                          ; 5529   0204 0010

        INCR    R0                              ; 552B   0008
        MVII    #$0335, R2                      ; 552C   02BA 0335
        CMP@    R4,     R3                      ; 552E   0363
        BEQ     L_553B                          ; 552F   0204 000A

L_5531:
        MVI     G_0167, R3                      ; 5531   0283 0167
        INCR    R3                              ; 5533   000B
        MVO     R3,     G_0167                  ; 5534   0243 0167
        CMPI    #$001E, R3                      ; 5536   037B 001E
        BEQ     L_55D5                          ; 5538   0204 009B
        PULR    R7                              ; 553A   02B7

L_553B:
        JSR     R5,     L_5540                  ; 553B   0004 0154 0140

        B       L_5531                          ; 553E   0220 000E

L_5540:
        PSHR    R5                              ; 5540   0275
        SDBD                                    ; 5541   0001
        MVII    #$5A98, R4                      ; 5542   02BC 0098 005A
        SDBD                                    ; 5545   0001
        MVII    #$5A90, R3                      ; 5546   02BB 0090 005A
        CLRR    R1                              ; 5549   01C9
        PSHR    R0                              ; 554A   0270
        TSTR    R0                              ; 554B   0080
        BNEQ    L_5556                          ; 554C   020C 0008

        MVO     R1,     G_0165                  ; 554E   0241 0165
        ADD     G_016A, R3                      ; 5550   02C3 016A
        MVII    #$0003, R0                      ; 5552   02B8 0003
        B       L_555C                          ; 5554   0200 0006

L_5556:
        MVO     R1,     G_0166                  ; 5556   0241 0166
        ADD     G_016B, R3                      ; 5558   02C3 016B
        MVII    #$0004, R0                      ; 555A   02B8 0004
L_555C:
        PSHR    R2                              ; 555C   0272
        ADD@    R3,     R4                      ; 555D   02DC
L_555E:
        SDBD                                    ; 555E   0001
        MVI@    R4,     R3                      ; 555F   02A3
        MVO@    R3,     R2                      ; 5560   0253
        ADDI    #$0004, R2                      ; 5561   02FA 0004
        SDBD                                    ; 5563   0001
        MVI@    R4,     R3                      ; 5564   02A3
        MVO@    R3,     R2                      ; 5565   0253
        INCR    R2                              ; 5566   000A
        MVI@    R4,     R3                      ; 5567   02A3
        MVO@    R3,     R2                      ; 5568   0253
        ADDI    #$0003, R2                      ; 5569   02FA 0003
        DECR    R0                              ; 556B   0010
        BNEQ    L_555E                          ; 556C   022C 000F

        MVII    #$0014, R1                      ; 556E   02B9 0014
        MVII    #$0044, R3                      ; 5570   02BB 0044
        ADD@    R4,     R1                      ; 5572   02E1
        PULR    R4                              ; 5573   02B4
        ADDI    #$0002, R4                      ; 5574   02FC 0002
        PULR    R0                              ; 5576   02B0
        TSTR    R0                              ; 5577   0080
        BNEQ    L_557F                          ; 5578   020C 0005

        CLRR    R2                              ; 557A   01D2
        MVII    #$0003, R0                      ; 557B   02B8 0003
        B       L_5583                          ; 557D   0200 0004

L_557F:
        MVII    #$0003, R2                      ; 557F   02BA 0003
        MVII    #$0004, R0                      ; 5581   02B8 0004
L_5583:
        SWAP    R3,     1                       ; 5583   0043
L_5584:
        MVO@    R1,     R2                      ; 5584   0251
        INCR    R2                              ; 5585   000A
        SWAP    R1,     1                       ; 5586   0041
        MVO@    R1,     R4                      ; 5587   0261
        MVO@    R3,     R4                      ; 5588   0263
        ADDI    #$0006, R4                      ; 5589   02FC 0006
        SWAP    R1,     1                       ; 558B   0041
        DECR    R0                              ; 558C   0010
        BNEQ    L_5584                          ; 558D   022C 000A

        MVI     G_0166, R1                      ; 558F   0281 0166
        TSTR    R1                              ; 5591   0089
        BEQ     L_559C                          ; 5592   0204 0008

        MVI     G_0168, R1                      ; 5594   0281 0168
        MVI     G_016A, R0                      ; 5596   0280 016A
        MVO     R0,     G_0168                  ; 5598   0240 0168
        B       L_55A2                          ; 559A   0200 0006

L_559C:
        MVI     G_0169, R1                      ; 559C   0281 0169
        MVI     G_016B, R0                      ; 559E   0280 016B
        MVO     R0,     G_0169                  ; 55A0   0240 0169
L_55A2:
        MVO     R1,     G_035A                  ; 55A2   0241 035A
        MVI     G_0171, R4                      ; 55A4   0284 0171
        PSHR    R1                              ; 55A6   0271
        CMPR    R1,     R4                      ; 55A7   014C
        BNEQ    L_55B0                          ; 55A8   020C 0006

        MVII    #$0007, R0                      ; 55AA   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 55AC   0004 0114 02E6

        XORR    R3,     R6                      ; 55AF   01DE
L_55B0:
        SDBD                                    ; 55B0   0001
        MVII    #$5B2C, R4                      ; 55B1   02BC 002C 005B
        PULR    R1                              ; 55B4   02B1
        ADDR    R1,     R4                      ; 55B5   00CC
        MVI@    R4,     R3                      ; 55B6   02A3
        MVI     G_0355, R2                      ; 55B7   0282 0355
        SDBD                                    ; 55B9   0001
        ANDI    #$30E0, R2                      ; 55BA   03BA 00E0 0030
        XORR    R3,     R2                      ; 55BD   01DA
        MVO     R2,     G_0355                  ; 55BE   0242 0355
        MVI     G_0357, R1                      ; 55C0   0281 0357
        SWAP    R1,     1                       ; 55C2   0041
        ANDI    #$00FF, R1                      ; 55C3   03B9 00FF
        ADDI    #$0080, R1                      ; 55C5   02F9 0080
        MVO     R1,     .STIC.X.7               ; 55C7   0241 0007
        SWAP    R1,     1                       ; 55C9   0041
        MVO     R1,     G_0357                  ; 55CA   0241 0357
        CLRR    R1                              ; 55CC   01C9
        MVO     R1,     G_0167                  ; 55CD   0241 0167
        MVII    #$0007, R0                      ; 55CF   02B8 0007

        JSR     R5,     .EXEC.41C               ; 55D1   0004 0114 001C

        PULR    R7                              ; 55D4   02B7

L_55D5:
        MVII    #$0008, R0                      ; 55D5   02B8 0008

        JSR     R5,     X_RAND2                 ; 55D7   0004 0114 029E

        MOVR    R0,     R1                      ; 55DA   0081
        MVI     G_0171, R2                      ; 55DB   0282 0171
        MVI     G_0165, R3                      ; 55DD   0283 0165
        CMPI    #$003D, R3                      ; 55DF   037B 003D
        BLT     L_55F0                          ; 55E1   0205 000D

        SDBD                                    ; 55E3   0001
        MVII    #$016A, R5                      ; 55E4   02BD 006A 0001
        MVI     G_0168, R4                      ; 55E7   0284 0168
        ANDI    #$0001, R0                      ; 55E9   03B8 0001
        BNEQ    L_55FB                          ; 55EB   020C 000E

        INCR    R1                              ; 55ED   0009
        B       L_55FB                          ; 55EE   0200 000B

L_55F0:
        SDBD                                    ; 55F0   0001
        MVII    #$016B, R5                      ; 55F1   02BD 006B 0001
        MVI     G_0169, R4                      ; 55F4   0284 0169
        ANDI    #$0001, R0                      ; 55F6   03B8 0001
        BEQ     L_55FB                          ; 55F8   0204 0001

        DECR    R1                              ; 55FA   0011
L_55FB:
        CMPR    R1,     R4                      ; 55FB   014C
        BEQ     L_55D5                          ; 55FC   0224 0028

        MVI     G_0176, R3                      ; 55FE   0283 0176
        TSTR    R3                              ; 5600   009B
        BNEQ    L_560D                          ; 5601   020C 000A

        MVI     G_0177, R3                      ; 5603   0283 0177
        TSTR    R3                              ; 5605   009B
        BNEQ    L_5619                          ; 5606   020C 0011

        CMPR    R4,     R2                      ; 5608   0162
        BEQ     L_5613                          ; 5609   0204 0008
        B       L_5622                          ; 560B   0200 0015

L_560D:
        MOVR    R2,     R1                      ; 560D   0091
        CLRR    R3                              ; 560E   01DB
        MVO     R3,     G_0176                  ; 560F   0243 0176
        B       L_5622                          ; 5611   0200 000F

L_5613:
        MVII    #$0001, R3                      ; 5613   02BB 0001
        MVO     R3,     G_0177                  ; 5615   0243 0177
        B       L_5622                          ; 5617   0200 0009

L_5619:
        MVII    #$0001, R3                      ; 5619   02BB 0001
        MVO     R3,     G_0176                  ; 561B   0243 0176
        CLRR    R3                              ; 561D   01DB
        MVO     R3,     G_0177                  ; 561E   0243 0177
        B       L_5622                          ; 5620   0200 0000

L_5622:
        MVO@    R1,     R5                      ; 5622   0269
        MVO     R1,     G_035A                  ; 5623   0241 035A
        SDBD                                    ; 5625   0001
        MVII    #$5B2C, R4                      ; 5626   02BC 002C 005B
        ADDR    R1,     R4                      ; 5629   00CC
        MVI@    R4,     R3                      ; 562A   02A3
        MVI     G_0355, R2                      ; 562B   0282 0355
        SDBD                                    ; 562D   0001
        ANDI    #$30E0, R2                      ; 562E   03BA 00E0 0030
        XORR    R3,     R2                      ; 5631   01DA
        MVO     R2,     G_0355                  ; 5632   0242 0355
        MVI     G_0357, R1                      ; 5634   0281 0357
        SWAP    R1,     1                       ; 5636   0041
        SUBI    #$0040, R1                      ; 5637   0339 0040
        SWAP    R1,     1                       ; 5639   0041
        MVO     R1,     G_0357                  ; 563A   0241 0357
        MVI     G_017F, R0                      ; 563C   0280 017F
        MVI     G_035A, R1                      ; 563E   0281 035A
        MVI     G_0171, R2                      ; 5640   0282 0171
        CMPI    #$0003, R0                      ; 5642   0378 0003
        BGE     L_5647                          ; 5644   020D 0001
        PULR    R7                              ; 5646   02B7

L_5647:
        CMPR    R1,     R2                      ; 5647   014A
        BNEQ    L_5653                          ; 5648   020C 0009

        MOVR    R2,     R0                      ; 564A   0090
        MVO     R0,     G_01B1                  ; 564B   0240 01B1
        MVII    #$0001, R0                      ; 564D   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 564F   0004 0114 02E6
        DECLE   $01DF                           ; 5652   01DF
L_5653:
        PULR    R7                              ; 5653   02B7

        DECLE   $0006,  $0008,  $000D,  $0008   ; 5654   0006 0008 000D 0008
        DECLE   $0015,  $0008,  $001E,  $0008   ; 5658   0015 0008 001E 0008
        DECLE   $0026,  $0008,  $002E,  $0008   ; 565C   0026 0008 002E 0008
        DECLE   $0036,  $0008,  $003E,  $0008   ; 5660   0036 0008 003E 0008
        DECLE   $0046,  $0008,  $004E,  $0008   ; 5664   0046 0008 004E 0008
        DECLE   $0056,  $0008,  $005E,  $0008   ; 5668   0056 0008 005E 0008
        DECLE   $0066,  $0008,  $006E,  $0008   ; 566C   0066 0008 006E 0008
        DECLE   $0076,  $0008,  $0079,  $0008   ; 5670   0076 0008 0079 0008
        DECLE   $0080,  $003C,  $0088,  $0038   ; 5674   0080 003C 0088 0038
        DECLE   $0090,  $001C,  $00A0,  $003E   ; 5678   0090 001C 00A0 003E
        DECLE   $00A8,  $0038,  $00B0,  $003C   ; 567C   00A8 0038 00B0 003C
        DECLE   $00B8,  $003A,  $00C6,  $002A   ; 5680   00B8 003A 00C6 002A
        DECLE   $00CD,  $000C,  $00D0,  $002E   ; 5684   00CD 000C 00D0 002E
        DECLE   $00DB,  $0008,  $00E2,  $002A   ; 5688   00DB 0008 00E2 002A
        DECLE   $00EA,  $002A,  $0000,  $0000   ; 568C   00EA 002A 0000 0000
        DECLE   $0003,  $001E,  $000B,  $001E   ; 5690   0003 001E 000B 001E
        DECLE   $0013,  $001E,  $001B,  $001E   ; 5694   0013 001E 001B 001E
        DECLE   $0020,  $0038,  $0028,  $005C   ; 5698   0020 0038 0028 005C
        DECLE   $0030,  $0018,  $0038,  $003A   ; 569C   0030 0018 0038 003A
        DECLE   $0047,  $0038,  $004F,  $00B8   ; 56A0   0047 0038 004F 00B8
        DECLE   $0057,  $0038,  $005F,  $0038   ; 56A4   0057 0038 005F 0038
        DECLE   $0060,  $0018,  $0068,  $00D8   ; 56A8   0060 0018 0068 00D8
        DECLE   $0070,  $0018,  $0078,  $0018   ; 56AC   0070 0018 0078 0018
        DECLE   $0080,  $0058,  $0088,  $0018   ; 56B0   0080 0058 0088 0018
        DECLE   $0090,  $0018,  $009A,  $0008   ; 56B4   0090 0018 009A 0008
        DECLE   $00A0,  $005E,  $00A8,  $005E   ; 56B8   00A0 005E 00A8 005E
        DECLE   $00B0,  $001E,  $00B8,  $001E   ; 56BC   00B0 001E 00B8 001E
        DECLE   $00C1,  $0008,  $00C9,  $0008   ; 56C0   00C1 0008 00C9 0008
        DECLE   $00D1,  $0008,  $00D9,  $0008   ; 56C4   00D1 0008 00D9 0008
        DECLE   $00E1,  $0008,  $00E9,  $0008   ; 56C8   00E1 0008 00E9 0008
        DECLE   $00F7,  $003A,  $00FF           ; 56CC   00F7 003A 00FF

        RSWD    R2                              ; 56CF   003A
        SETC                                    ; 56D0   0007
        RSWD    R3                              ; 56D1   003B
        INCR    R7                              ; 56D2   000F

        RSWD    R3                              ; 56D3   003B
L_56D4:
        DECR    R7                              ; 56D4   0017

        DECLE   $0009,  $001F,  $0009,  $0027   ; 56D5   0009 001F 0009 0027

        RSWD    R3                              ; 56D9   003B
        ADCR    R7                              ; 56DA   002F

        RSWD    R3                              ; 56DB   003B
L_56DC:
        GSWD    R0                              ; 56DC   0030
        DECLE   $0019,  $0001,  $0002,  $0000   ; 56DD   0019 0001 0002 0000
        DECLE   $0000                           ; 56E1   0000

        RSWD    R0                              ; 56E2   0038
        ADCR    R3                              ; 56E3   002B
        SWAP    R0,     1                       ; 56E4   0040
        ADCR    R3                              ; 56E5   002B
        SLL     R0,     1                       ; 56E6   0048
        ADCR    R5                              ; 56E7   002D
        RLC     R0,     1                       ; 56E8   0050
        ADCR    R5                              ; 56E9   002D
        SLLC    R0,     1                       ; 56EA   0058
        ADCR    R5                              ; 56EB   002D
        SLR     R0,     1                       ; 56EC   0060
        ADCR    R5                              ; 56ED   002D
        SAR     R2,     1                       ; 56EE   006A
        ADCR    R3                              ; 56EF   002B
        RRC     R0,     1                       ; 56F0   0070
        INCR    R7                              ; 56F1   000F

        SARC    R0,     1                       ; 56F2   0078
L_56F3:
        RSWD    R5                              ; 56F3   003D
        SARC    R0,     1                       ; 56F4   0078
        RSWD    R1                              ; 56F5   0039
        SARC    R0,     1                       ; 56F6   0078
        COMR    R5                              ; 56F7   001D
        RRC     R1,     1                       ; 56F8   0071
        INCR    R7                              ; 56F9   000F

        MOVR    R3,     R2                      ; 56FA   009A
L_56FB:
        ADCR    R2                              ; 56FB   002A
        DECLE   $0000,  $0024,  $0070,  $0019   ; 56FC   0000 0024 0070 0019
        DECLE   $0274,  $0273,  $0275,  $0274   ; 5700   0274 0273 0275 0274
        DECLE   $0260,  $0255,  $02D4,  $02B6   ; 5704   0260 0255 02D4 02B6
        DECLE   $03B4,  $0296,  $0293,  $02B3   ; 5708   03B4 0296 0293 02B3
        DECLE   $027D,  $0276,  $03A0,  $02BD   ; 570C   027D 0276 03A0 02BD
        DECLE   $029D,  $0273,  $03B6,  $027D   ; 5710   029D 0273 03B6 027D

        PSHR    R5                              ; 5714   0275
        DECR    R1                              ; 5715   0011
        PSHR    R3                              ; 5716   0273
        PULR    R6                              ; 5717   02B6
        MVI     G_0053, R1                      ; 5718   0281 0053
        MVI@    R2,     R5                      ; 571A   0295
        AND@    R6,     R5                      ; 571B   03B5
        DECR    R0                              ; 571C   0010
        ANDI    #$03BD, R5                      ; 571D   03BD 03BD
        DIS                                     ; 571F   0003
        MOVR    R0,     R5                      ; 5720   0085
        ADDR    R0,     R7                      ; 5721   00C7
        SUBR    R2,     R7                      ; 5722   0117

        DECLE   $02E9,  $014B,  $018D,  $01D6   ; 5723   02E9 014B 018D 01D6
        DECLE   $03BD,  $03BD,  $033A,  $037C   ; 5727   03BD 03BD 033A 037C
        DECLE   $033A,  $037C,  $033A,  $037C   ; 572B   033A 037C 033A 037C
        DECLE   $033A,  $037C,  $03BD,  $03BD   ; 572F   033A 037C 03BD 03BD
        DECLE   $037C,  $037C,  $037C,  $037C   ; 5733   037C 037C 037C 037C
        DECLE   $037C,  $037C,  $037C,  $037C   ; 5737   037C 037C 037C 037C
        DECLE   $03BD,  $03BD,  $033D,  $03BD   ; 573B   03BD 03BD 033D 03BD
        DECLE   $01EF,  $01EF,  $032F,  $01EF   ; 573F   01EF 01EF 032F 01EF
        DECLE   $03BD,  $03BA,  $03BD,  $03BD   ; 5743   03BD 03BA 03BD 03BD
        DECLE   $033D,  $03BD,  $01EF,  $01EF   ; 5747   033D 03BD 01EF 01EF
        DECLE   $032F,  $01EF,  $03BD,  $03BA   ; 574B   032F 01EF 03BD 03BA
        DECLE   $03BD,  $03BD,  $033D,  $03BD   ; 574F   03BD 03BD 033D 03BD
        DECLE   $01EF,  $01EF,  $032F,  $01EF   ; 5753   01EF 01EF 032F 01EF
        DECLE   $03BD,  $03BA,  $03BD,  $03BD   ; 5757   03BD 03BA 03BD 03BD
        DECLE   $033D,  $03BD,  $01EF,  $01EF   ; 575B   033D 03BD 01EF 01EF
        DECLE   $032F,  $01EF,  $03BD,  $03BA   ; 575F   032F 01EF 03BD 03BA
        DECLE   $03BD,  $03BD,  $033D,  $03BD   ; 5763   03BD 03BD 033D 03BD
        DECLE   $01EF,  $01EF,  $032F,  $01EF   ; 5767   01EF 01EF 032F 01EF

        ANDI    #$03BA, R5                      ; 576B   03BD 03BA
        ANDI    #$03BD, R5                      ; 576D   03BD 03BD
        SUB@    R3,     R0                      ; 576F   0318
        SUB@    R3,     R0                      ; 5770   0318
        SUB@    R3,     R0                      ; 5771   0318
        SUB@    R3,     R0                      ; 5772   0318
        SUB@    R3,     R0                      ; 5773   0318
        SUB@    R3,     R0                      ; 5774   0318
        SUB@    R3,     R0                      ; 5775   0318
        SUB@    R3,     R0                      ; 5776   0318
        ANDI    #$0021, R5                      ; 5777   03BD 0021
        NEGR    R1                              ; 5779   0021
        CMPR    R0,     R1                      ; 577A   0141
        NEGR    R1                              ; 577B   0021
        NEGR    R1                              ; 577C   0021
        NEGR    R2                              ; 577D   0022
        SLR     R1,     1                       ; 577E   0061
        NEGR    R1                              ; 577F   0021
        CMPR    R4,     R4                      ; 5780   0164
        MOVR    R5,     R7                      ; 5781   00AF

        DECLE   $01E7,  $00CC,  $0108,  $0108   ; 5782   01E7 00CC 0108 0108
        DECLE   $0108,  $0108,  $0121,  $0000   ; 5786   0108 0108 0121 0000
        DECLE   $01A0,  $0030,  $0121,  $0000   ; 578A   01A0 0030 0121 0000
        DECLE   $01A0,  $0030,  $0121,  $0000   ; 578E   01A0 0030 0121 0000
        DECLE   $01A0,  $0030,  $01CE,  $01CE   ; 5792   01A0 0030 01CE 01CE
        DECLE   $01CE,  $01CE,  $001C,  $0037   ; 5796   01CE 01CE 001C 0037

        SARC    R1,     2                       ; 579A   007D
        ADDR    R5,     R7                      ; 579B   00EF

        DECLE   $00BF,  $00FF,  $00FF,  $00FE   ; 579C   00BF 00FF 00FF 00FE
        DECLE   $0000,  $0080,  $00F0,  $005E   ; 57A0   0000 0080 00F0 005E
        DECLE   $00F7,  $00FF,  $00FF,  $00FF   ; 57A4   00F7 00FF 00FF 00FF
        DECLE   $0000,  $0001                   ; 57A8   0000 0001

        INCR    R7                              ; 57AA   000F

        SARC    R2,     1                       ; 57AB   007A
L_57AC:
        ADDR    R5,     R7                      ; 57AC   00EF

        DECLE   $00BF,  $00FF,  $00FF,  $0038   ; 57AD   00BF 00FF 00FF 0038
        DECLE   $00EC,  $00BE,  $00F7,  $00FF   ; 57B1   00EC 00BE 00F7 00FF
        DECLE   $00FF,  $00FF,  $007F,  $000E   ; 57B5   00FF 00FF 007F 000E
        DECLE   $001B,  $003E,  $00F7,  $00DF   ; 57B9   001B 003E 00F7 00DF
        DECLE   $00FF,  $00FF,  $00FD,  $0000   ; 57BD   00FF 00FF 00FD 0000

        ADDR    R0,     R0                      ; 57C1   00C0
        ADDR    R7,     R0                      ; 57C2   00F8
        MOVR    R5,     R7                      ; 57C3   00AF

        DECLE   $00FF,  $00FE,  $00FF,  $007F   ; 57C4   00FF 00FE 00FF 007F
        DECLE   $0000,  $0000,  $0007,  $003D   ; 57C8   0000 0000 0007 003D
        DECLE   $00F7,  $00DF,  $00FF,  $00FF   ; 57CC   00F7 00DF 00FF 00FF

        COMR    R4                              ; 57D0   001C
        ADDR    R6,     R6                      ; 57D1   00F6
        ADDR    R3,     R7                      ; 57D2   00DF

        DECLE   $007F,  $00FE,  $00FF,  $00FF   ; 57D3   007F 00FE 00FF 00FF

        MOVR    R5,     R7                      ; 57D7   00AF

        SETC                                    ; 57D8   0007
        INCR    R5                              ; 57D9   000D
        MOVR    R3,     R7                      ; 57DA   009F

        DECLE   $00FB,  $006F,  $00FF,  $00FF   ; 57DB   00FB 006F 00FF 00FF
        DECLE   $00F5,  $0000                   ; 57DF   00F5 0000

        ADDR    R4,     R0                      ; 57E1   00E0
        SARC    R0,     2                       ; 57E2   007C
        ADDR    R3,     R7                      ; 57E3   00DF

        DECLE   $00FD,  $00FF,  $00FF,  $00BF   ; 57E4   00FD 00FF 00FF 00BF
        DECLE   $0000,  $0000,  $0003,  $009E   ; 57E8   0000 0000 0003 009E
        DECLE   $00FB,  $006F,  $00FF,  $00FF   ; 57EC   00FB 006F 00FF 00FF

        INCR    R6                              ; 57F0   000E
        SARC    R3,     2                       ; 57F1   007F
        ADDR    R5,     R7                      ; 57F2   00EF

        DECLE   $00BD,  $00FF,  $00FF,  $00FF   ; 57F3   00BD 00FF 00FF 00FF

        ADDR    R2,     R5                      ; 57F7   00D5
        DIS                                     ; 57F8   0003
        MOVR    R0,     R6                      ; 57F9   0086
        ADDR    R1,     R7                      ; 57FA   00CF

        DECLE   $00FD,  $00B7,  $00FF,  $00FF   ; 57FB   00FD 00B7 00FF 00FF

        MOVR    R6,     R5                      ; 57FF   00B5
L_5800:
        TSTR    R0                              ; 5800   0080
        DECLE   $00F0,  $00BE,  $00FB,  $00FE   ; 5801   00F0 00BE 00FB 00FE
        DECLE   $00FF,  $00FF,  $005F,  $0000   ; 5805   00FF 00FF 005F 0000
        DECLE   $0000,  $0001,  $00CF,  $00FD   ; 5809   0000 0001 00CF 00FD
        DECLE   $00B7,  $00FF,  $00FF,  $0007   ; 580D   00B7 00FF 00FF 0007
        DECLE   $003D,  $00FF,  $005E,  $00FF   ; 5811   003D 00FF 005E 00FF
        DECLE   $00FF,  $00FF                   ; 5815   00FF 00FF

        ADDR    R5,     R2                      ; 5817   00EA
        MOVR    R0,     R1                      ; 5818   0081
        ADDR    R0,     R3                      ; 5819   00C3
        ADDR    R4,     R7                      ; 581A   00E7

        DECLE   $007E,  $00DB,  $00FF,  $00FF   ; 581B   007E 00DB 00FF 00FF
        DECLE   $007E,  $00C0,  $0078,  $00FF   ; 581F   007E 00C0 0078 00FF
        DECLE   $00F5,  $00FF,  $00FF,  $00FF   ; 5823   00F5 00FF 00FF 00FF
        DECLE   $00AF,  $0000,  $0000,  $0000   ; 5827   00AF 0000 0000 0000
        DECLE   $00E7,  $007E,  $00DB,  $00FF   ; 582B   00E7 007E 00DB 00FF
        DECLE   $00FF,  $0003,  $001E,  $00FB   ; 582F   00FF 0003 001E 00FB
        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; 5833   00BF 00FF 00FF 00FF
        DECLE   $00F5,  $00C0,  $0061,  $00F3   ; 5837   00F5 00C0 0061 00F3
        DECLE   $00BF,  $00ED,  $00FF,  $00FF   ; 583B   00BF 00ED 00FF 00FF
        DECLE   $00FF                           ; 583F   00FF

        ADDR    R4,     R0                      ; 5840   00E0
        ADDR    R7,     R4                      ; 5841   00FC
        ADDR    R5,     R7                      ; 5842   00EF

        DECLE   $007A,  $00FF,  $00FF,  $00FF   ; 5843   007A 00FF 00FF 00FF
        DECLE   $00D7,  $0000,  $0000,  $0080   ; 5847   00D7 0000 0000 0080
        DECLE   $00F3,  $00BF,  $00ED,  $00FF   ; 584B   00F3 00BF 00ED 00FF
        DECLE   $00FF,  $0001,  $000F,  $007D   ; 584F   00FF 0001 000F 007D
        DECLE   $00F7,  $007F,  $00FF,  $00FF   ; 5853   00F7 007F 00FF 00FF

        ADDR    R7,     R2                      ; 5857   00FA
        ADDR    R4,     R0                      ; 5858   00E0
        MOVR    R6,     R0                      ; 5859   00B0
        ADDR    R7,     R1                      ; 585A   00F9
        ADDR    R3,     R7                      ; 585B   00DF

        DECLE   $00F6,  $00FF,  $00FF,  $00FF   ; 585C   00F6 00FF 00FF 00FF
        DECLE   $0070,  $00DE,  $00F7,  $00FD   ; 5860   0070 00DE 00F7 00FD
        DECLE   $00FF,  $00FF,  $00FF,  $00FB   ; 5864   00FF 00FF 00FF 00FB
        DECLE   $0000,  $0000                   ; 5868   0000 0000

        ADDR    R0,     R0                      ; 586A   00C0
        SARC    R1,     1                       ; 586B   0079
        ADDR    R3,     R7                      ; 586C   00DF

        DECLE   $00F6,  $00FF,  $00FF,  $0000   ; 586D   00F6 00FF 00FF 0000
        DECLE   $0007,  $003E,  $00EB,  $00FF   ; 5871   0007 003E 00EB 00FF
        DECLE   $00FF,  $00FF                   ; 5875   00FF 00FF

        ADDR    R7,     R5                      ; 5877   00FD
        RRC     R0,     1                       ; 5878   0070
        ADDR    R3,     R0                      ; 5879   00D8
        SARC    R0,     2                       ; 587A   007C
        ADDR    R5,     R7                      ; 587B   00EF

        DECLE   $00FB,  $00FF,  $00FF,  $00FF   ; 587C   00FB 00FF 00FF 00FF
        DECLE   $0038,  $006F,  $00FB,  $00DE   ; 5880   0038 006F 00FB 00DE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5884   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000                   ; 5888   0000 0000

        ADDR    R4,     R0                      ; 588A   00E0
        MOVR    R7,     R4                      ; 588B   00BC
        ADDR    R5,     R7                      ; 588C   00EF

        DECLE   $00FB,  $00FF,  $00FF,  $0000   ; 588D   00FB 00FF 00FF 0000
        DECLE   $0003,  $001F                   ; 5891   0003 001F

        ADDR    R6,     R5                      ; 5893   00F5
        ADDR    R3,     R7                      ; 5894   00DF

        DECLE   $00FF,  $00FF,  $00FF           ; 5895   00FF 00FF 00FF
.GFX_LIST_5898:
        DECLE   $003D,  $0013,  $0003,  $000F   ; 5898  CART PIC #00
        DECLE   $00CF,  $00FF,  $00FF,  $00FF   ; 589C  
        DECLE   $003F,  $001F,  $0017,  $0003   ; 58A0  CART PIC #01
        DECLE   $00C3,  $00ED,  $00FF,  $00FF   ; 58A4  
        DECLE   $003F,  $000F,  $0003,  $0003   ; 58A8  CART PIC #02
        DECLE   $00C3,  $00F3,  $00F7,  $00FF   ; 58AC  
        DECLE   $000F,  $0003,  $0003,  $0030   ; 58B0  CART PIC #03
        DECLE   $00F9,  $00FF,  $00FF,  $00FF   ; 58B4  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58B8  CART PIC #04
        DECLE   $00DF,  $00FF,  $00FF,  $00FF   ; 58BC  
        DECLE   $00FF,  $00EF,  $00FF,  $00FF   ; 58C0  CART PIC #05
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58C4  
        DECLE   $0081,  $00C3,  $00E7,  $00FF   ; 58C8  CART PIC #06
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 58CC  
        DECLE   $00FF,  $00F0,  $00F0,  $00F0   ; 58D0  CART PIC #07
        DECLE   $0000,  $0045,  $0000,  $0000   ; 58D4  
        DECLE   $007F,  $007F,  $007F,  $007F   ; 58D8  CART PIC #08
        DECLE   $007F,  $007F,  $007F,  $007F   ; 58DC  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 58E0  CART PIC #09
        DECLE   $0001,  $0001,  $0001,  $0001   ; 58E4  
        DECLE   $00FB,  $00EE,  $00B8,  $00E0   ; 58E8  CART PIC #0A
        DECLE   $0040,  $00C0,  $0080,  $0080   ; 58EC  
        DECLE   $0000,  $00FF,  $0081,  $00BD   ; 58F0  CART PIC #0B
        DECLE   $00A1,  $00BD,  $0081,  $00FF   ; 58F4  
        DECLE   $0000,  $0070,  $0070,  $0000   ; 58F8   0000 0070 0070 0000
        DECLE   $001F,  $0078,  $0070,  $0063   ; 58FC   001F 0078 0070 0063
        DECLE   $0000,  $00FE,  $00FE,  $0000   ; 5900   0000 00FE 00FE 0000
        DECLE   $00FF,  $0071,  $0031,  $001F   ; 5904   00FF 0071 0031 001F
        DECLE   $00E3,  $00F0,  $00F8,  $00FF   ; 5908   00E3 00F0 00F8 00FF
        DECLE   $0000,  $0000,  $007F,  $0000   ; 590C   0000 0000 007F 0000
        DECLE   $001B,  $0031,  $007B,  $00FF   ; 5910   001B 0031 007B 00FF
        DECLE   $0000,  $0000,  $00FE,  $0000   ; 5914   0000 0000 00FE 0000

        MOVR    R3,     R7                      ; 5918   009F
        INCR    R7                              ; 5919   000F
        INCR    R7                              ; 591A   000F

L_591B:
        MOVR    R2,     R1                      ; 591B   0091
L_591C:
        ADDR    R5,     R0                      ; 591C   00E8
        ADDR    R4,     R0                      ; 591D   00E0
L_591E:
        ADDR    R6,     R1                      ; 591E   00F1
        ADDR    R7,     R3                      ; 591F   00FB
        ADDR    R0,     R7                      ; 5920   00C7

        DECLE   $0083,  $0021,  $0001,  $0001   ; 5921   0083 0021 0001 0001

        MOVR    R0,     R3                      ; 5925   0083
        ADDR    R0,     R7                      ; 5926   00C7
        ADDR    R5,     R7                      ; 5927   00EF

        SETC                                    ; 5928   0007
        ADDR    R3,     R7                      ; 5929   00DF
        ADDR    R3,     R7                      ; 592A   00DF
        ADDR    R3,     R7                      ; 592B   00DF
        MOVR    R1,     R7                      ; 592C   008F
        MOVR    R1,     R7                      ; 592D   008F

        DECLE   $008E,  $0000                   ; 592E   008E 0000

        ADDR    R7,     R1                      ; 5930   00F9
        ADDR    R6,     R0                      ; 5931   00F0
        ADDR    R6,     R0                      ; 5932   00F0
        TSTR    R1                              ; 5933   0089
L_5934:
        DECR    R7                              ; 5934   0017

        SETC                                    ; 5935   0007
        MOVR    R1,     R7                      ; 5936   008F
        ADDR    R3,     R7                      ; 5937   00DF

        DECLE   $00FF,  $0080,  $009C,  $00A2   ; 5938   00FF 0080 009C 00A2
        DECLE   $0088,  $009C,  $0089,  $0083   ; 593C   0088 009C 0089 0083
        DECLE   $0083,  $00B9,  $00AC,  $00B7   ; 5940   0083 00B9 00AC 00B7

        MOVR    R3,     R0                      ; 5944   0098
        MOVR    R1,     R7                      ; 5945   008F

        DECLE   $0080,  $00FF,  $00FF,  $00FF   ; 5946   0080 00FF 00FF 00FF
        DECLE   $004A,  $007F,  $007F,  $007F   ; 594A   004A 007F 007F 007F
        DECLE   $007F,  $00A4,  $00FF,  $00FF   ; 594E   007F 00A4 00FF 00FF

        GSWD    R0                              ; 5952   0030
        ADDR    R7,     R6                      ; 5953   00FE
        ADDR    R7,     R6                      ; 5954   00FE
        ADDR    R7,     R6                      ; 5955   00FE
        ADDR    R7,     R6                      ; 5956   00FE
        MOVR    R3,     R1                      ; 5957   0099
        TSTR    R6                              ; 5958   00B6
        TSTR    R6                              ; 5959   00B6
        TSTR    R6                              ; 595A   00B6
        ADDR    R2,     R6                      ; 595B   00D6
        ADDR    R2,     R6                      ; 595C   00D6
        ADDR    R2,     R6                      ; 595D   00D6
        ADDR    R3,     R7                      ; 595E   00DF

        DECLE   $00C0,  $00DD,  $00DD,  $00DD   ; 595F   00C0 00DD 00DD 00DD
        DECLE   $00DB,  $00DB,  $00DB,  $00FB   ; 5963   00DB 00DB 00DB 00FB
        DECLE   $0003,  $00FF,  $00FF,  $00FF   ; 5967   0003 00FF 00FF 00FF
        DECLE   $00F8,  $00C0,  $0080,  $0007   ; 596B   00F8 00C0 0080 0007
        DECLE   $001F,  $00FC,  $00F8,  $0080   ; 596F   001F 00FC 00F8 0080
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5973   0000 0000 0000 00C0
        DECLE   $00FC,  $001F,  $001F           ; 5977   00FC 001F 001F

        INCR    R7                              ; 597A   000F
        MOVR    R0,     R7                      ; 597B   0087

L_597C:
        ADDR    R0,     R0                      ; 597C   00C0
        DECLE   $00F0,  $00FF,  $00FF,  $0000   ; 597D   00F0 00FF 00FF 0000
        DECLE   $0000,  $003C,  $007E,  $00FF   ; 5981   0000 003C 007E 00FF
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 5985   00FF 007E 003C 0000

        TSTR    R0                              ; 5989   0080
        ADDR    R1,     R7                      ; 598A   00CF
        ADDR    R1,     R7                      ; 598B   00CF
        ADDR    R1,     R7                      ; 598C   00CF

        DECLE   $0080,  $0000,  $007F,  $0000   ; 598D   0080 0000 007F 0000
        DECLE   $0008,  $00C4,  $00C4,  $00C4   ; 5991   0008 00C4 00C4 00C4
        DECLE   $0004,  $0000,  $00E0,  $0000   ; 5995   0004 0000 00E0 0000
        DECLE   $0000,  $0040,  $0040,  $0040   ; 5999   0000 0040 0040 0040
        DECLE   $0040,  $0045,  $007F,  $0000   ; 599D   0040 0045 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A1   0000 0000 0000 0000
        DECLE   $0000,  $0041,  $00F7,  $000F   ; 59A5   0000 0041 00F7 000F
        DECLE   $003F,  $00FF,  $00F8,  $00FF   ; 59A9   003F 00FF 00F8 00FF
        DECLE   $0070,  $0075,  $0070,  $00F0   ; 59AD   0070 0075 0070 00F0
        DECLE   $00FC,  $00FF,  $003F,  $00FF   ; 59B1   00FC 00FF 003F 00FF
        DECLE   $001E,  $005D,  $001E,  $0075   ; 59B5   001E 005D 001E 0075
        DECLE   $0070,  $0075,  $0070,  $007F   ; 59B9   0070 0075 0070 007F
        DECLE   $003F,  $001F,  $0018,  $005D   ; 59BD   003F 001F 0018 005D
        DECLE   $001E,  $005D,  $001E,  $00FD   ; 59C1   001E 005D 001E 00FD
        DECLE   $00FA,  $00F4,  $0030,  $0000   ; 59C5   00FA 00F4 0030 0000
        DECLE   $0000,  $0000,  $0008,  $003F   ; 59C9   0000 0000 0008 003F
        DECLE   $0070,  $0075,  $0070,  $0010   ; 59CD   0070 0075 0070 0010
        DECLE   $0028,  $0004,  $0022,  $00F9   ; 59D1   0028 0004 0022 00F9
        DECLE   $001E,  $005D,  $001E,  $00FF   ; 59D5   001E 005D 001E 00FF
        DECLE   $00FF,  $00C0,  $00C0,  $00C0   ; 59D9   00FF 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 59DD   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00FF,  $00FF   ; 59E1   00C0 00C0 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 59E5   00FF 00FF 00FF 0000
        DECLE   $0003,  $0004                   ; 59E9   0003 0004

        INCR    R3                              ; 59EB   000B
        INCR    R5                              ; 59EC   000D
        INCR    R7                              ; 59ED   000F

        INCR    R4                              ; 59EE   000C
L_59EF:
        INCR    R3                              ; 59EF   000B
        DECLE   $0000,  $0080,  $0040,  $00A0   ; 59F0   0000 0080 0040 00A0
        DECLE   $0050,  $00D0,  $0050,  $00A0   ; 59F4   0050 00D0 0050 00A0
        DECLE   $000C,  $0007,  $000B,  $0007   ; 59F8   000C 0007 000B 0007
        DECLE   $0003,  $0007,  $0003,  $0007   ; 59FC   0003 0007 0003 0007
        DECLE   $0040,  $00C0,  $0080,  $00C0   ; 5A00   0040 00C0 0080 00C0
        DECLE   $0080,  $00C0,  $0080,  $00C0   ; 5A04   0080 00C0 0080 00C0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5A08   00FF 00FF 00FF 00FF

        MOVR    R1,     R7                      ; 5A0C   008F
        MOVR    R1,     R7                      ; 5A0D   008F

        DECLE   $008E,  $0000,  $00FF,  $00FF   ; 5A0E   008E 0000 00FF 00FF
        DECLE   $00FE,  $00FC,  $00F8,  $00F0   ; 5A12   00FE 00FC 00F8 00F0
        DECLE   $00E0,  $00C0,  $007F,  $007F   ; 5A16   00E0 00C0 007F 007F
        DECLE   $007F,  $003F,  $001F           ; 5A1A   007F 003F 001F

        INCR    R7                              ; 5A1D   000F

        SETC                                    ; 5A1E   0007
L_5A1F:
        DIS                                     ; 5A1F   0003
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5A20   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FC,  $00E0,  $0000   ; 5A24   00FF 00FC 00E0 0000
        DECLE   $00FF,  $00FC,  $00F0,  $00C0   ; 5A28   00FF 00FC 00F0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2C   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5A30   00FF 00FF 00FF 00FF
        DECLE   $007E,  $003C,  $0018,  $0000   ; 5A34   007E 003C 0018 0000

        ADDR    R3,     R7                      ; 5A38   00DF
        ADDR    R3,     R7                      ; 5A39   00DF
        ADDR    R3,     R7                      ; 5A3A   00DF
        ADDR    R3,     R7                      ; 5A3B   00DF
        ADDR    R3,     R7                      ; 5A3C   00DF
        ADDR    R3,     R7                      ; 5A3D   00DF
        ADDR    R3,     R7                      ; 5A3E   00DF
        ADDR    R3,     R7                      ; 5A3F   00DF

        DECLE   $001F                           ; 5A40   001F

        INCR    R7                              ; 5A41   000F

        SLL     R3,     2                       ; 5A42   004F
L_5A43:
        RRC     R3,     2                       ; 5A43   0077
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5A44   007F 007F 007F 007F
        DECLE   $0058,  $005A,  $005F,  $005A   ; 5A48   0058 005A 005F 005A
        DECLE   $0066,  $005A,  $006D,  $005A   ; 5A4C   0066 005A 006D 005A
        DECLE   $0074,  $005A,  $007B,  $005A   ; 5A50   0074 005A 007B 005A
        DECLE   $0082,  $005A,  $0089,  $005A   ; 5A54   0082 005A 0089 005A
        DECLE   $0300,  $0000,  $0008,  $0069   ; 5A58   0300 0000 0008 0069
        DECLE   $0004,  $0000,  $0000,  $03DC   ; 5A5C   0004 0000 0000 03DC
        DECLE   $0013,  $0000,  $0000,  $0004   ; 5A60   0013 0000 0000 0004
        DECLE   $0008,  $0000,  $03DC,  $0013   ; 5A64   0008 0000 03DC 0013
        DECLE   $0000,  $0000,  $0004,  $0010   ; 5A68   0000 0000 0004 0010
        DECLE   $0000,  $03DC,  $0013,  $0000   ; 5A6C   0000 03DC 0013 0000
        DECLE   $0000,  $0004,  $0018,  $0000   ; 5A70   0000 0004 0018 0000
        DECLE   $02DC,  $0013,  $0000,  $0000   ; 5A74   02DC 0013 0000 0000
        DECLE   $0004,  $0020,  $0000,  $02DC   ; 5A78   0004 0020 0000 02DC
        DECLE   $0013,  $0000,  $0000,  $0004   ; 5A7C   0013 0000 0000 0004
        DECLE   $0028,  $0000,  $02DC,  $0013   ; 5A80   0028 0000 02DC 0013
        DECLE   $0000,  $0000,  $0004,  $0030   ; 5A84   0000 0000 0004 0030
        DECLE   $0000,  $0200,  $0000,  $0000   ; 5A88   0000 0200 0000 0000
        DECLE   $0000,  $0008,  $0038,  $0000   ; 5A8C   0000 0008 0038 0000
        DECLE   $0000,  $0015,  $0025,  $003A   ; 5A90   0000 0015 0025 003A
        DECLE   $004A,  $005F,  $006F,  $0084   ; 5A94   004A 005F 006F 0084
        DECLE   $0047,  $0010,  $0000,  $0000   ; 5A98   0047 0010 0000 0000
        DECLE   $0000,  $0047,  $0010,  $0001   ; 5A9C   0000 0047 0010 0001
        DECLE   $00F8,  $0000,  $00C7,  $0030   ; 5AA0   00F8 0000 00C7 0030
        DECLE   $0003,  $0003,  $0000,  $00C7   ; 5AA4   0003 0003 0000 00C7
        DECLE   $0030,  $0000,  $00F0,  $0000   ; 5AA8   0030 0000 00F0 0000
        DECLE   $0007,  $0047,  $0010,  $0000   ; 5AAC   0007 0047 0010 0000
        DECLE   $0000,  $0000,  $00C7,  $0030   ; 5AB0   0000 0000 00C7 0030
        DECLE   $0005,  $00F9,  $0000,  $00C7   ; 5AB4   0005 00F9 0000 00C7
        DECLE   $0030,  $0000,  $00F0,  $0000   ; 5AB8   0030 0000 00F0 0000
        DECLE   $0008,  $0043,  $0010,  $0000   ; 5ABC   0008 0043 0010 0000
        DECLE   $0000,  $0001,  $00C3,  $0030   ; 5AC0   0000 0001 00C3 0030
        DECLE   $0003,  $0000,  $0001,  $00C3   ; 5AC4   0003 0000 0001 00C3
        DECLE   $0030,  $0000,  $00F0,  $0001   ; 5AC8   0030 0000 00F0 0001
        DECLE   $0043,  $0010,  $0008,  $00FC   ; 5ACC   0043 0010 0008 00FC
        DECLE   $0001,  $0005,  $00D2,  $0010   ; 5AD0   0001 0005 00D2 0010
        DECLE   $0000,  $0000,  $0003,  $0052   ; 5AD4   0000 0000 0003 0052
        DECLE   $0010,  $000D,  $00FE,  $0003   ; 5AD8   0010 000D 00FE 0003
        DECLE   $00D2,  $0030,  $00F8,  $00F3   ; 5ADC   00D2 0030 00F8 00F3
        DECLE   $0003,  $0003,  $0052,  $0010   ; 5AE0   0003 0003 0052 0010
        DECLE   $0000,  $0000,  $0002,  $00D2   ; 5AE4   0000 0000 0002 00D2
        DECLE   $0010,  $0001,  $00F8,  $0002   ; 5AE8   0010 0001 00F8 0002
        DECLE   $00D2,  $0010,  $0000,  $00F8   ; 5AEC   00D2 0010 0000 00F8
        DECLE   $0002,  $00D2,  $0010,  $0000   ; 5AF0   0002 00D2 0010 0000
        DECLE   $00F8,  $0002,  $000C,  $0053   ; 5AF4   00F8 0002 000C 0053
        DECLE   $0010,  $0000,  $0000,  $0002   ; 5AF8   0010 0000 0000 0002
        DECLE   $0053,  $0030,  $0008,  $00F7   ; 5AFC   0053 0030 0008 00F7
        DECLE   $0002,  $0053,  $0010,  $0008   ; 5B00   0002 0053 0010 0008
        DECLE   $0003,  $0002,  $0006,  $0052   ; 5B04   0003 0002 0006 0052
        DECLE   $0010,  $0000,  $0000,  $0003   ; 5B08   0010 0000 0000 0003
        DECLE   $0052,  $0030,  $0005,  $00F1   ; 5B0C   0052 0030 0005 00F1
        DECLE   $0003,  $00D2,  $0010,  $0007   ; 5B10   0003 00D2 0010 0007
        DECLE   $00FD,  $0003,  $00D2,  $0010   ; 5B14   00FD 0003 00D2 0010
        DECLE   $0000                           ; 5B18   0000

        ADDR    R7,     R0                      ; 5B19   00F8
        DIS                                     ; 5B1A   0003
        INCR    R7                              ; 5B1B   000F

        SWAP    R3,     1                       ; 5B1C   0043
L_5B1D:
        DECR    R0                              ; 5B1D   0010
        DECLE   $0000,  $0000,  $0001,  $00C3   ; 5B1E   0000 0000 0001 00C3
        DECLE   $0030,  $0003,  $00F2,  $0001   ; 5B22   0030 0003 00F2 0001
        DECLE   $00C3,  $0010,  $0004,  $0004   ; 5B26   00C3 0010 0004 0004
        DECLE   $0001                           ; 5B2A   0001

        INCR    R1                              ; 5B2B   0009
        SETC                                    ; 5B2C   0007
        SETC                                    ; 5B2D   0007
        DIS                                     ; 5B2E   0003
        DECR    R2                              ; 5B2F   0012
        DECR    R2                              ; 5B30   0012
        DECR    R3                              ; 5B31   0013
        DECR    R2                              ; 5B32   0012
        DIS                                     ; 5B33   0003
        PSHR    R5                              ; 5B34   0275
        MOVR    R0,     R1                      ; 5B35   0081
        MVI     G_0184, R3                      ; 5B36   0283 0184
        TSTR    R3                              ; 5B38   009B
        BNEQ    L_5B4E                          ; 5B39   020C 0013

        CMP     G_016F, R0                      ; 5B3B   0340 016F
        BNEQ    L_5B4F                          ; 5B3D   020C 0010

        INCR    R1                              ; 5B3F   0009
        ADDR    R7,     R1                      ; 5B40   00F9
        ADD@    R1,     R7                      ; 5B41   02CF

        GSWD    R2                              ; 5B42   0032
        SWAP    R2,     1                       ; 5B43   0042
        COMR    R0                              ; 5B44   0018
        SARC    R3,     1                       ; 5B45   007B
        SAR     R2,     2                       ; 5B46   006E
        NEGR    R5                              ; 5B47   0025
        SLLC    R0,     1                       ; 5B48   0058
        INCR    R4                              ; 5B49   000C
        INCR    R4                              ; 5B4A   000C
        INCR    R4                              ; 5B4B   000C
        INCR    R4                              ; 5B4C   000C
        INCR    R4                              ; 5B4D   000C
L_5B4E:
        PULR    R7                              ; 5B4E   02B7

L_5B4F:
        MVI     G_016F, R3                      ; 5B4F   0283 016F
        MVO     R3,     G_01B3                  ; 5B51   0243 01B3
        MVII    #$0007, R0                      ; 5B53   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 5B55   0004 0114 02E6
        DECLE   $01DF                           ; 5B58   01DF

        PULR    R7                              ; 5B59   02B7

        JSR     R5,     L_5C02                  ; 5B5A   0004 015C 0002

        TSTR    R0                              ; 5B5D   0080
        BEQ     L_5B66                          ; 5B5E   0204 0006

        MVII    #$0004, R3                      ; 5B60   02BB 0004
        MVO     R3,     G_0343                  ; 5B62   0243 0343
        MVO     R3,     G_0184                  ; 5B64   0243 0184
L_5B66:
        PULR    R7                              ; 5B66   02B7

        JSR     R5,     L_5C02                  ; 5B67   0004 015C 0002

        TSTR    R0                              ; 5B6A   0080
        BEQ     L_5B73                          ; 5B6B   0204 0006

        MVII    #$0008, R3                      ; 5B6D   02BB 0008
        MVO     R3,     G_0343                  ; 5B6F   0243 0343
        MVO     R3,     G_0184                  ; 5B71   0243 0184
L_5B73:
        PULR    R7                              ; 5B73   02B7

        JSR     R5,     L_5C02                  ; 5B74   0004 015C 0002

        TSTR    R0                              ; 5B77   0080
        BEQ     L_5B83                          ; 5B78   0204 0009

        JSR     R5,     X_STOP_SFX              ; 5B7A   0004 011C 02B4

        MVII    #$0004, R3                      ; 5B7D   02BB 0004
        MVO     R3,     G_0343                  ; 5B7F   0243 0343
        MVO     R3,     G_0184                  ; 5B81   0243 0184
L_5B83:
        PULR    R7                              ; 5B83   02B7

        JSR     R5,     L_5C02                  ; 5B84   0004 015C 0002

        TSTR    R0                              ; 5B87   0080
        BEQ     L_5B99                          ; 5B88   0204 000F

        MVII    #$0001, R3                      ; 5B8A   02BB 0001
        MVO     R3,     G_0343                  ; 5B8C   0243 0343
        MVO     R3,     G_0184                  ; 5B8E   0243 0184
        MVI     G_031D, R3                      ; 5B90   0283 031D
        ANDI    #$025F, R3                      ; 5B92   03BB 025F
        MVO     R3,     G_0355                  ; 5B94   0243 0355

        JSR     R5,     L_D049                  ; 5B96   0004 01D0 0049

L_5B99:
        PULR    R7                              ; 5B99   02B7

        JSR     R5,     L_5C02                  ; 5B9A   0004 015C 0002
        DECLE   $0080,  $0204,  $000F,  $02BB   ; 5B9D   0080 0204 000F 02BB
        DECLE   $0183,  $0243,  $0343,  $0243   ; 5BA1   0183 0243 0343 0243
        DECLE   $0184,  $02BB,  $01F0,  $0243   ; 5BA5   0184 02BB 01F0 0243
        DECLE   $0342,  $0243,  $034A,  $0004   ; 5BA9   0342 0243 034A 0004

        XORR    R5,     R0                      ; 5BAD   01E8
        MVO     R4,     .BTAB.B7                ; 5BAE   0244 02B7

        JSR     R5,     L_5C02                  ; 5BB0   0004 015C 0002

        TSTR    R0                              ; 5BB3   0080
        BEQ     L_5BBC                          ; 5BB4   0204 0006

        MVII    #$0008, R3                      ; 5BB6   02BB 0008
        MVO     R3,     G_034B                  ; 5BB8   0243 034B
        MVO     R3,     G_0184                  ; 5BBA   0243 0184
L_5BBC:
        PULR    R7                              ; 5BBC   02B7

        JSR     R5,     L_5C02                  ; 5BBD   0004 015C 0002
        DECLE   $0080,  $0204,  $000D,  $02BB   ; 5BC0   0080 0204 000D 02BB
        DECLE   $0096,  $0243,  $0353,  $0243   ; 5BC4   0096 0243 0353 0243
        DECLE   $0184,  $02BB,  $01F0,  $0243   ; 5BC8   0184 02BB 01F0 0243
        DECLE   $0352,  $0004,  $016C,  $0176   ; 5BCC   0352 0004 016C 0176

        PULR    R7                              ; 5BD0   02B7

L_5BD1:
        PSHR    R5                              ; 5BD1   0275
        CLRR    R0                              ; 5BD2   01C0
        MVO     R0,     G_0184                  ; 5BD3   0240 0184
        SDBD                                    ; 5BD5   0001
        MVII    #$5BE2, R3                      ; 5BD6   02BB 00E2 005B

        JSR     R5,     L_51D8                  ; 5BD9   0004 0150 01D8

        CLRR    R0                              ; 5BDC   01C0
        MVO     R0,     G_0184                  ; 5BDD   0240 0184
        MVO     R0,     G_019A                  ; 5BDF   0240 019A
        PULR    R7                              ; 5BE1   02B7

        PSHR    R5                              ; 5BE2   0275
        MVII    #$0018, R0                      ; 5BE3   02B8 0018
        MVO     R0,     .STIC.VIDEN             ; 5BE5   0240 0020
        MVII    #$033D, R4                      ; 5BE7   02BC 033D

        JSR     R5,     X_FILL_ZERO             ; 5BE9   0004 0114 0338

        CLRR    R1                              ; 5BEC   01C9
        MVII    #$0004, R4                      ; 5BED   02BC 0004
        MVII    #$0003, R0                      ; 5BEF   02B8 0003
L_5BF1:
        MVO@    R1,     R4                      ; 5BF1   0261
        DECR    R0                              ; 5BF2   0010
        BNEQ    L_5BF1                          ; 5BF3   022C 0003

        MVII    #$0030, R0                      ; 5BF5   02B8 0030
        SDBD                                    ; 5BF7   0001
        MVII    #$3990, R4                      ; 5BF8   02BC 0090 0039

        JSR     R5,     X_FILL_ZERO             ; 5BFB   0004 0114 0338
        JSR     R5,     L_51F1                  ; 5BFE   0004 0150 01F1

        PULR    R7                              ; 5C01   02B7

L_5C02:
        PSHR    R5                              ; 5C02   0275
        MVI     G_0185, R1                      ; 5C03   0281 0185
        MVII    #$0014, R2                      ; 5C05   02BA 0014

        JSR     R5,     X_DIV                   ; 5C07   0004 011C 01FB

        INCR    R0                              ; 5C0A   0008
        SLL     R0,     2                       ; 5C0B   004C
        SLL     R0,     1                       ; 5C0C   0048
        INCR    R1                              ; 5C0D   0009
        SLL     R1,     2                       ; 5C0E   004D
        SLL     R1,     1                       ; 5C0F   0049
        PSHR    R0                              ; 5C10   0270
        MOVR    R1,     R0                      ; 5C11   0088
        PULR    R1                              ; 5C12   02B1
        MVI     G_031F, R2                      ; 5C13   0282 031F
        MVI     G_0320, R3                      ; 5C15   0283 0320
        SWAP    R2,     1                       ; 5C17   0042
        SWAP    R3,     1                       ; 5C18   0043
        ANDI    #$00FF, R2                      ; 5C19   03BA 00FF
        ANDI    #$00FF, R3                      ; 5C1B   03BB 00FF
        SUBR    R2,     R0                      ; 5C1D   0110
        BPL     L_5C21                          ; 5C1E   0203 0001

        NEGR    R0                              ; 5C20   0020
L_5C21:
        CMPI    #$0016, R0                      ; 5C21   0378 0016
        BLT     L_5C27                          ; 5C23   0205 0002
        B       L_5C2F                          ; 5C25   0200 0008

L_5C27:
        SUBR    R3,     R1                      ; 5C27   0119
        BPL     L_5C2B                          ; 5C28   0203 0001

        NEGR    R1                              ; 5C2A   0021
L_5C2B:
        CMPI    #$0016, R1                      ; 5C2B   0379 0016
        BLT     L_5C3B                          ; 5C2D   0205 000C

L_5C2F:
        MVI     G_016F, R1                      ; 5C2F   0281 016F
        MVO     R1,     G_01B2                  ; 5C31   0241 01B2
        MVII    #$0006, R0                      ; 5C33   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5C35   0004 0114 02E6
        DECLE   $01DF                           ; 5C38   01DF

        CLRR    R0                              ; 5C39   01C0
        PULR    R7                              ; 5C3A   02B7

L_5C3B:
        MVII    #$0001, R0                      ; 5C3B   02B8 0001
        PULR    R7                              ; 5C3D   02B7

        PSHR    R5                              ; 5C3E   0275
        MVII    #$0342, R1                      ; 5C3F   02B9 0342
        MVI@    R1,     R3                      ; 5C41   028B
        MVI     G_0186, R2                      ; 5C42   0282 0186
        TSTR    R2                              ; 5C44   0092
        BNEQ    L_5CDD                          ; 5C45   020C 0096

        INCR    R3                              ; 5C47   000B
        CMPI    #$0007, R3                      ; 5C48   037B 0007
        BLE     L_5C8C                          ; 5C4A   0206 0040

        MVII    #$0001, R0                      ; 5C4C   02B8 0001
        MVO     R0,     G_0186                  ; 5C4E   0240 0186
        MVII    #$003C, R4                      ; 5C50   02BC 003C
        MVO     R4,     G_0343                  ; 5C52   0244 0343
        MVII    #$0004, R0                      ; 5C54   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5C56   0004 0114 02E6
        DECLE   $01DF                           ; 5C59   01DF

        MVI     G_0183, R1                      ; 5C5A   0281 0183
        INCR    R1                              ; 5C5C   0009
        CMPI    #$0004, R1                      ; 5C5D   0379 0004
        BEQ     L_5CD2                          ; 5C5F   0204 0071

        MVO     R1,     G_0183                  ; 5C61   0241 0183
        MVII    #$0000, R0                      ; 5C63   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 5C65   0004 0114 02E6

        XORR    R4,     R0                      ; 5C68   01E0
L_5C69:
        MVII    #$0006, R0                      ; 5C69   02B8 0006

        JSR     R5,     X_RAND2                 ; 5C6B   0004 0114 029E

        MVI     G_0182, R2                      ; 5C6E   0282 0182

        JSR     R5,     L_5C92                  ; 5C70   0004 015C 0092

        MVO     R2,     G_0182                  ; 5C73   0242 0182
        BNEQ    L_5C69                          ; 5C75   022C 000D

        INCR    R1                              ; 5C77   0009
        MVO     R1,     G_016F                  ; 5C78   0241 016F
        MVII    #$0008, R0                      ; 5C7A   02B8 0008

        JSR     R5,     X_RAND2                 ; 5C7C   0004 0114 029E

        ADDI    #$0002, R0                      ; 5C7F   02F8 0002
        INCR    R1                              ; 5C81   0009
        ADDR    R7,     R1                      ; 5C82   00F9
        ADD@    R1,     R7                      ; 5C83   02CF

        SETC                                    ; 5C84   0007
        COMR    R5                              ; 5C85   001D
        NEGR    R4                              ; 5C86   0024
        GSWD    R1                              ; 5C87   0031
        RSWD    R6                              ; 5C88   003E
        SWAP    R1,     2                       ; 5C89   0045
        GSWD    R1                              ; 5C8A   0031
        PULR    R7                              ; 5C8B   02B7

L_5C8C:
        MVO@    R3,     R1                      ; 5C8C   024B
        MVII    #$0004, R3                      ; 5C8D   02BB 0004
        MVO     R3,     G_0343                  ; 5C8F   0243 0343
        PULR    R7                              ; 5C91   02B7

L_5C92:
        PSHR    R5                              ; 5C92   0275
        MOVR    R0,     R1                      ; 5C93   0081

        JSR     R5,     X_POW2                  ; 5C94   0004 0114 0345

        PSHR    R2                              ; 5C97   0272
        ANDR    R0,     R2                      ; 5C98   0182
        BEQ     L_5C9D                          ; 5C99   0204 0002

        PULR    R2                              ; 5C9B   02B2
        PULR    R7                              ; 5C9C   02B7

L_5C9D:
        PULR    R2                              ; 5C9D   02B2
        XORR    R0,     R2                      ; 5C9E   01C2
        CLRR    R0                              ; 5C9F   01C0
        PULR    R7                              ; 5CA0   02B7

        MVII    #$0001, R0                      ; 5CA1   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 5CA3   0004 0114 02E6

        XORR    R4,     R0                      ; 5CA6   01E0
        PULR    R7                              ; 5CA7   02B7

        MVO     R0,     G_019B                  ; 5CA8   0240 019B
        MVII    #$0005, R0                      ; 5CAA   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 5CAC   0004 0114 02E6

        XORR    R4,     R0                      ; 5CAF   01E0
        MVI     G_019B, R0                      ; 5CB0   0280 019B
        MVO     R0,     G_019C                  ; 5CB2   0240 019C
        PULR    R7                              ; 5CB4   02B7

        MVI     G_016F, R1                      ; 5CB5   0281 016F
        ANDI    #$0001, R1                      ; 5CB7   03B9 0001
        MVO     R1,     G_01B4                  ; 5CB9   0241 01B4
        MVII    #$0003, R0                      ; 5CBB   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 5CBD   0004 0114 02E6

        XORR    R4,     R0                      ; 5CC0   01E0
        PULR    R7                              ; 5CC1   02B7

        MVII    #$0002, R0                      ; 5CC2   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5CC4   0004 0114 02E6

        XORR    R4,     R0                      ; 5CC7   01E0
        PULR    R7                              ; 5CC8   02B7

        MVO     R0,     G_019B                  ; 5CC9   0240 019B
        MVII    #$0004, R0                      ; 5CCB   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5CCD   0004 0114 02E6

        XORR    R4,     R0                      ; 5CD0   01E0
        PULR    R7                              ; 5CD1   02B7

L_5CD2:
        MVII    #$0002, R0                      ; 5CD2   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5CD4   0004 0114 02E6

        XORR    R4,     R1                      ; 5CD7   01E1
        MVII    #$0001, R0                      ; 5CD8   02B8 0001
        MVO     R0,     G_0178                  ; 5CDA   0240 0178
        PULR    R7                              ; 5CDC   02B7

L_5CDD:
        DECR    R3                              ; 5CDD   0013
        BMI     L_5CE6                          ; 5CDE   020B 0006

        MVO@    R3,     R1                      ; 5CE0   024B
        MVII    #$0002, R3                      ; 5CE1   02BB 0002
        MVO     R3,     G_0343                  ; 5CE3   0243 0343
        PULR    R7                              ; 5CE5   02B7

L_5CE6:
        MVII    #$02D1, R5                      ; 5CE6   02BD 02D1
        SDBD                                    ; 5CE8   0001
        MVII    #$56C0, R4                      ; 5CE9   02BC 00C0 0056
        SDBD                                    ; 5CEC   0001
        MVI@    R4,     R3                      ; 5CED   02A3
        MVO@    R3,     R5                      ; 5CEE   026B
        SDBD                                    ; 5CEF   0001
        MVI@    R4,     R3                      ; 5CF0   02A3
        MVO@    R3,     R5                      ; 5CF1   026B
        CLRR    R3                              ; 5CF2   01DB
        MVO     R3,     G_0186                  ; 5CF3   0243 0186
        MVO     R3,     G_033E                  ; 5CF5   0243 033E

        JSR     R5,     L_5BD1                  ; 5CF7   0004 0158 03D1

        MVI     G_0178, R1                      ; 5CFA   0281 0178
        TSTR    R1                              ; 5CFC   0089
        BNEQ    L_5D03                          ; 5CFD   020C 0004

        JSR     R5,     L_68A2                  ; 5CFF   0004 0168 00A2

        PULR    R7                              ; 5D02   02B7

L_5D03:
        JSR     R5,     X_PLAY_CHEER1           ; 5D03   0004 011C 02D5
        JSR     R5,     L_679E                  ; 5D06   0004 0164 039E

        J       L_6856                          ; 5D09   0004 0368 0056

        PSHR    R5                              ; 5D0C   0275
        MVI     G_0188, R3                      ; 5D0D   0283 0188
        TSTR    R3                              ; 5D0F   009B
        BEQ     L_5D29                          ; 5D10   0204 0017

        MVI     G_0342, R1                      ; 5D12   0281 0342
        CMPI    #$0001, R1                      ; 5D14   0379 0001
        BEQ     L_5D1E                          ; 5D16   0204 0006

        CMPI    #$0003, R3                      ; 5D18   037B 0003
        BEQ     L_5D3B                          ; 5D1A   0204 001F

        INCR    R1                              ; 5D1C   0009
        INCR    R7                              ; 5D1D   000F

L_5D1E:
        DECR    R1                              ; 5D1E   0011
L_5D1F:
        MVO     R1,     G_0342                  ; 5D1F   0241 0342
        INCR    R3                              ; 5D21   000B
        MVO     R3,     G_0188                  ; 5D22   0243 0188
        MVII    #$0002, R1                      ; 5D24   02B9 0002
        MVO     R1,     G_0343                  ; 5D26   0241 0343
        PULR    R7                              ; 5D28   02B7

L_5D29:
        INCR    R3                              ; 5D29   000B
        MVO     R3,     G_0188                  ; 5D2A   0243 0188
        MVI     G_033D, R1                      ; 5D2C   0281 033D
        SDBD                                    ; 5D2E   0001
        ANDI    #$FFC0, R1                      ; 5D2F   03B9 00C0 00FF
        XORI    #$0007, R1                      ; 5D32   03F9 0007
        MVO     R1,     G_033D                  ; 5D34   0241 033D
        MVII    #$0001, R1                      ; 5D36   02B9 0001
        MVO     R1,     G_0343                  ; 5D38   0241 0343
        PULR    R7                              ; 5D3A   02B7

L_5D3B:
        MVI     G_033D, R1                      ; 5D3B   0281 033D
        XORI    #$0017, R1                      ; 5D3D   03F9 0017
        MVO     R1,     G_033D                  ; 5D3F   0241 033D
        MVII    #$0019, R1                      ; 5D41   02B9 0019
        MVO     R1,     G_034B                  ; 5D43   0241 034B
        PULR    R7                              ; 5D45   02B7

        PSHR    R5                              ; 5D46   0275
        MVI     G_0189, R0                      ; 5D47   0280 0189
        TSTR    R0                              ; 5D49   0080
        BNEQ    L_5D59                          ; 5D4A   020C 000D

        MVII    #$0010, R3                      ; 5D4C   02BB 0010
        SWAP    R3,     1                       ; 5D4E   0043
        MVI     G_0345, R1                      ; 5D4F   0281 0345
        XORR    R3,     R1                      ; 5D51   01D9
        MVO     R1,     G_0345                  ; 5D52   0241 0345
        MVI     G_034D, R1                      ; 5D54   0281 034D
        XORR    R3,     R1                      ; 5D56   01D9
        MVO     R1,     G_034D                  ; 5D57   0241 034D
L_5D59:
        MVII    #$0008, R1                      ; 5D59   02B9 0008
        MVO     R1,     G_0189                  ; 5D5B   0241 0189
        MVO     R1,     G_034B                  ; 5D5D   0241 034B
        TSTR    R0                              ; 5D5F   0080
        BEQ     L_5D6D                          ; 5D60   0204 000B

        MVI     G_034A, R1                      ; 5D62   0281 034A
        INCR    R1                              ; 5D64   0009
        CMPI    #$0004, R1                      ; 5D65   0379 0004
        BEQ     L_5D6E                          ; 5D67   0204 0005

        MVO     R1,     G_034A                  ; 5D69   0241 034A
        MVO     R1,     G_0352                  ; 5D6B   0241 0352
L_5D6D:
        PULR    R7                              ; 5D6D   02B7

L_5D6E:
        SDBD                                    ; 5D6E   0001
        MVII    #$56CC, R4                      ; 5D6F   02BC 00CC 0056
        MVI     G_018A, R2                      ; 5D72   0282 018A
        ADDI    #$0200, R2                      ; 5D74   02FA 0200
        ADDI    #$0028, R2                      ; 5D76   02FA 0028
        MOVR    R2,     R5                      ; 5D78   0095
        SDBD                                    ; 5D79   0001
        MVI@    R4,     R3                      ; 5D7A   02A3
        MVO@    R3,     R5                      ; 5D7B   026B
        SDBD                                    ; 5D7C   0001
        MVI@    R4,     R3                      ; 5D7D   02A3
        MVO@    R3,     R5                      ; 5D7E   026B
        ADDI    #$0012, R5                      ; 5D7F   02FD 0012
        SDBD                                    ; 5D81   0001
        MVI@    R4,     R3                      ; 5D82   02A3
        MVO@    R3,     R5                      ; 5D83   026B
        SDBD                                    ; 5D84   0001
        MVI@    R4,     R3                      ; 5D85   02A3
        MVO@    R3,     R5                      ; 5D86   026B
        SDBD                                    ; 5D87   0001
        MVII    #$6A21, R1                      ; 5D88   02B9 0021 006A
        CLRR    R0                              ; 5D8B   01C0
        MVO     R0,     G_0346                  ; 5D8C   0240 0346
        MVO     R0,     G_0352                  ; 5D8E   0240 0352
        MVO     R1,     G_034E                  ; 5D90   0241 034E
        MVII    #$0008, R1                      ; 5D92   02B9 0008
        MVO     R1,     G_0353                  ; 5D94   0241 0353
        MVI     G_0355, R1                      ; 5D96   0281 0355
        SDBD                                    ; 5D98   0001
        XORI    #$1000, R1                      ; 5D99   03F9 0000 0010
        MVO     R1,     G_0355                  ; 5D9C   0241 0355
        PULR    R7                              ; 5D9E   02B7

        PSHR    R5                              ; 5D9F   0275
        MVI     G_0352, R1                      ; 5DA0   0281 0352
        INCR    R1                              ; 5DA2   0009
        CMPI    #$0006, R1                      ; 5DA3   0379 0006
        BEQ     L_5DAE                          ; 5DA5   0204 0007

        MVO     R1,     G_0352                  ; 5DA7   0241 0352
        MVII    #$0008, R1                      ; 5DA9   02B9 0008
        MVO     R1,     G_0353                  ; 5DAB   0241 0353
        PULR    R7                              ; 5DAD   02B7

L_5DAE:
        CLRR    R1                              ; 5DAE   01C9
        MVO     R1,     G_034E                  ; 5DAF   0241 034E

        JSR     R5,     L_5BD1                  ; 5DB1   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5DB4   0004 01D0 000C

        CLRR    R3                              ; 5DB7   01DB

        JSR     R5,     L_6923                  ; 5DB8   0004 0168 0123

        PULR    R7                              ; 5DBB   02B7

        PSHR    R5                              ; 5DBC   0275
        CLRR    R3                              ; 5DBD   01DB
        MVO     R3,     G_0342                  ; 5DBE   0243 0342
        MVO     R3,     G_034A                  ; 5DC0   0243 034A

        JSR     R5,     L_5BD1                  ; 5DC2   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5DC5   0004 01D0 000C

        CLRR    R3                              ; 5DC8   01DB

        JSR     R5,     L_6923                  ; 5DC9   0004 0168 0123

        PULR    R7                              ; 5DCC   02B7

        PSHR    R5                              ; 5DCD   0275
        MVI     G_018F, R1                      ; 5DCE   0281 018F
        TSTR    R1                              ; 5DD0   0089
        BNEQ    L_5E11                          ; 5DD1   020C 003E

        SDBD                                    ; 5DD3   0001
        MVII    #$1000, R3                      ; 5DD4   02BB 0000 0010
        MVI     G_034A, R2                      ; 5DD7   0282 034A
        INCR    R2                              ; 5DD9   000A
        CMPI    #$0003, R2                      ; 5DDA   037A 0003
        BEQ     L_5DFB                          ; 5DDC   0204 001D

        CMPI    #$0004, R2                      ; 5DDE   037A 0004
        BEQ     L_5DEF                          ; 5DE0   0204 000D

        CMPI    #$0005, R2                      ; 5DE2   037A 0005
        BEQ     L_5E03                          ; 5DE4   0204 001D

L_5DE6:
        MVO     R2,     G_0342                  ; 5DE6   0242 0342
        MVO     R2,     G_034A                  ; 5DE8   0242 034A
        MVII    #$0008, R2                      ; 5DEA   02BA 0008
        MVO     R2,     G_034B                  ; 5DEC   0242 034B
        PULR    R7                              ; 5DEE   02B7

L_5DEF:
        MVO     R2,     G_034A                  ; 5DEF   0242 034A
        MVI     G_033D, R2                      ; 5DF1   0282 033D
        XORR    R3,     R2                      ; 5DF3   01DA
        MVO     R2,     G_033D                  ; 5DF4   0242 033D
        MVII    #$0008, R3                      ; 5DF6   02BB 0008
        MVO     R3,     G_034B                  ; 5DF8   0243 034B
        PULR    R7                              ; 5DFA   02B7

L_5DFB:
        MVII    #$0007, R0                      ; 5DFB   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 5DFD   0004 0114 02E6

        XORR    R4,     R0                      ; 5E00   01E0
        B       L_5DE6                          ; 5E01   0220 001C

L_5E03:
        MVI     G_0345, R2                      ; 5E03   0282 0345
        XORR    R3,     R2                      ; 5E05   01DA
        MVO     R2,     G_0345                  ; 5E06   0242 0345
        MVII    #$0001, R2                      ; 5E08   02BA 0001
        MVO     R2,     G_018F                  ; 5E0A   0242 018F
        MVII    #$0019, R3                      ; 5E0C   02BB 0019
        MVO     R3,     G_034B                  ; 5E0E   0243 034B
        PULR    R7                              ; 5E10   02B7

L_5E11:
        JSR     R5,     L_5BD1                  ; 5E11   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5E14   0004 01D0 000C

        CLRR    R3                              ; 5E17   01DB

        JSR     R5,     L_6923                  ; 5E18   0004 0168 0123

        PULR    R7                              ; 5E1B   02B7

        PSHR    R5                              ; 5E1C   0275
        CLRR    R3                              ; 5E1D   01DB
        MVO     R3,     G_0352                  ; 5E1E   0243 0352
        SDBD                                    ; 5E20   0001
        MVII    #$1000, R3                      ; 5E21   02BB 0000 0010
        MVI     G_0345, R2                      ; 5E24   0282 0345
        XORR    R3,     R2                      ; 5E26   01DA
        MVO     R2,     G_0345                  ; 5E27   0242 0345
        MVII    #$0001, R3                      ; 5E29   02BB 0001
        MVO     R3,     G_0343                  ; 5E2B   0243 0343
        MVII    #$0000, R0                      ; 5E2D   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 5E2F   0004 0114 02E6

        XORR    R4,     R1                      ; 5E32   01E1
        PULR    R7                              ; 5E33   02B7

        DECLE   $0275,  $0283,  $018D,  $009B   ; 5E34   0275 0283 018D 009B
        DECLE   $0204,  $0045,  $0283,  $018B   ; 5E38   0204 0045 0283 018B
        DECLE   $009B,  $0204,  $002B           ; 5E3C   009B 0204 002B

        MVI     G_018C, R3                      ; 5E3F   0283 018C
        CMPI    #$0014, R3                      ; 5E41   037B 0014
        BEQ     L_5E86                          ; 5E43   0204 0041

        INCR    R3                              ; 5E45   000B
        MVO     R3,     G_018C                  ; 5E46   0243 018C
        MVI     G_0342, R1                      ; 5E48   0281 0342
        MVI     G_018E, R2                      ; 5E4A   0282 018E
        TSTR    R2                              ; 5E4C   0092
        BNEQ    L_5E63                          ; 5E4D   020C 0014

        INCR    R1                              ; 5E4F   0009
        CMPI    #$0003, R1                      ; 5E50   0379 0003
        BEQ     L_5E58                          ; 5E52   0204 0004
        B       L_5E5A                          ; 5E54   0200 0004

L_5E56:
        CLRR    R2                              ; 5E56   01D2
        DECLE   $000F                           ; 5E57   000F
L_5E58:
        MVII    #$0001, R2                      ; 5E58   02BA 0001
L_5E5A:
        MVO     R2,     G_018E                  ; 5E5A   0242 018E
        MVO     R1,     G_0342                  ; 5E5C   0241 0342
        MVII    #$0003, R3                      ; 5E5E   02BB 0003
        MVO     R3,     G_0343                  ; 5E60   0243 0343
        PULR    R7                              ; 5E62   02B7

L_5E63:
        DECR    R1                              ; 5E63   0011
        CMPI    #$0001, R1                      ; 5E64   0379 0001
        BEQ     L_5E56                          ; 5E66   0224 0011
        B       L_5E5A                          ; 5E68   0220 000F

        DECLE   $0001                           ; 5E6A   0001

        MVII    #$0000, R3                      ; 5E6B   02BB 0000
        DECR    R0                              ; 5E6D   0010
        MVI     G_033D, R2                      ; 5E6E   0282 033D
        XORR    R3,     R2                      ; 5E70   01DA
        MVO     R2,     G_033D                  ; 5E71   0242 033D
        MVI     G_034A, R3                      ; 5E73   0283 034A
        INCR    R3                              ; 5E75   000B
        MVO     R3,     G_034A                  ; 5E76   0243 034A
        MVII    #$0002, R3                      ; 5E78   02BB 0002
        MVO     R3,     G_0343                  ; 5E7A   0243 0343
        MVO     R3,     G_018B                  ; 5E7C   0243 018B
        PULR    R7                              ; 5E7E   02B7

        MVII    #$0002, R3                      ; 5E7F   02BB 0002
        MVO     R3,     G_0343                  ; 5E81   0243 0343
        MVO     R3,     G_018D                  ; 5E83   0243 018D
        PULR    R7                              ; 5E85   02B7

L_5E86:
        MVII    #$0002, R3                      ; 5E86   02BB 0002
        MVO     R3,     G_0342                  ; 5E88   0243 0342
        SDBD                                    ; 5E8A   0001
        MVII    #$56D4, R4                      ; 5E8B   02BC 00D4 0056
        MVI     G_018A, R5                      ; 5E8E   0285 018A
        ADDI    #$01D8, R5                      ; 5E90   02FD 01D8
        SDBD                                    ; 5E92   0001
        MVI@    R4,     R3                      ; 5E93   02A3
        MVO@    R3,     R5                      ; 5E94   026B
        SDBD                                    ; 5E95   0001
        MVI@    R4,     R3                      ; 5E96   02A3
        MVO@    R3,     R5                      ; 5E97   026B
        ADDI    #$0012, R5                      ; 5E98   02FD 0012
        SDBD                                    ; 5E9A   0001
        MVI@    R4,     R3                      ; 5E9B   02A3
        MVO@    R3,     R5                      ; 5E9C   026B
        SDBD                                    ; 5E9D   0001
        MVI@    R4,     R3                      ; 5E9E   02A3
        MVO@    R3,     R5                      ; 5E9F   026B

        JSR     R5,     L_5BD1                  ; 5EA0   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5EA3   0004 01D0 000C

        CLRR    R3                              ; 5EA6   01DB

        JSR     R5,     L_6923                  ; 5EA7   0004 0168 0123

        PULR    R7                              ; 5EAA   02B7

        PSHR    R5                              ; 5EAB   0275
        MVI     G_0342, R2                      ; 5EAC   0282 0342
        MVI     G_0190, R1                      ; 5EAE   0281 0190
        TSTR    R1                              ; 5EB0   0089
        BEQ     L_5EB8                          ; 5EB1   0204 0005

        DECR    R2                              ; 5EB3   0012
        BMI     L_5ED5                          ; 5EB4   020B 001F
        B       L_5ECE                          ; 5EB6   0200 0016

L_5EB8:
        INCR    R2                              ; 5EB8   000A
        CMPI    #$0004, R2                      ; 5EB9   037A 0004
        BEQ     L_5EBF                          ; 5EBB   0204 0002
        B       L_5ECE                          ; 5EBD   0200 000F

L_5EBF:
        MVII    #$0002, R3                      ; 5EBF   02BB 0002
        MVO     R3,     G_0343                  ; 5EC1   0243 0343
        XORI    #$0001, R1                      ; 5EC3   03F9 0001
        MVO     R1,     G_0190                  ; 5EC5   0241 0190
        MVII    #$0001, R0                      ; 5EC7   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 5EC9   0004 0114 02E6

        XORR    R4,     R1                      ; 5ECC   01E1
        PULR    R7                              ; 5ECD   02B7

L_5ECE:
        MVO     R2,     G_0342                  ; 5ECE   0242 0342
        MVII    #$0002, R3                      ; 5ED0   02BB 0002
        MVO     R3,     G_0343                  ; 5ED2   0243 0343
        PULR    R7                              ; 5ED4   02B7

L_5ED5:
        MVI     G_0191, R3                      ; 5ED5   0283 0191
        INCR    R3                              ; 5ED7   000B
        CMP     G_019B, R3                      ; 5ED8   0343 019B
        BGE     L_5EE4                          ; 5EDA   020D 0008

        MVO     R3,     G_0191                  ; 5EDC   0243 0191
        CLRR    R1                              ; 5EDE   01C9
        MVO     R1,     G_0184                  ; 5EDF   0241 0184
        MVO     R1,     G_0190                  ; 5EE1   0241 0190
        PULR    R7                              ; 5EE3   02B7

L_5EE4:
        SDBD                                    ; 5EE4   0001
        MVII    #$089A, R2                      ; 5EE5   02BA 009A 0008
        MVI     G_018A, R1                      ; 5EE8   0281 018A
        ADDI    #$0200, R1                      ; 5EEA   02F9 0200
        MVO@    R2,     R1                      ; 5EEC   024A

        JSR     R5,     L_5BD1                  ; 5EED   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5EF0   0004 01D0 000C

        CLRR    R3                              ; 5EF3   01DB

        JSR     R5,     L_6923                  ; 5EF4   0004 0168 0123

        PULR    R7                              ; 5EF7   02B7

        PSHR    R5                              ; 5EF8   0275
        MVI     G_0342, R3                      ; 5EF9   0283 0342
        INCR    R3                              ; 5EFB   000B
        CMPI    #$0003, R3                      ; 5EFC   037B 0003
        BEQ     L_5F0B                          ; 5EFE   0204 000B

        CMPI    #$0004, R3                      ; 5F00   037B 0004
        BEQ     L_5F12                          ; 5F02   0204 000E

L_5F04:
        MVO     R3,     G_0342                  ; 5F04   0243 0342
        MVII    #$0003, R3                      ; 5F06   02BB 0003
        MVO     R3,     G_0343                  ; 5F08   0243 0343
        PULR    R7                              ; 5F0A   02B7

L_5F0B:
        PSHR    R3                              ; 5F0B   0273

        JSR     R5,     L_D000                  ; 5F0C   0004 01D0 0000

        PULR    R3                              ; 5F0F   02B3
        B       L_5F04                          ; 5F10   0220 000D

L_5F12:
        CLRR    R3                              ; 5F12   01DB
        MVO     R3,     G_0342                  ; 5F13   0243 0342
        MVI     G_034A, R3                      ; 5F15   0283 034A
        INCR    R3                              ; 5F17   000B
        CMPI    #$0004, R3                      ; 5F18   037B 0004
        BEQ     L_5F22                          ; 5F1A   0204 0006

        MVO     R3,     G_034A                  ; 5F1C   0243 034A
        CLRR    R3                              ; 5F1E   01DB
        MVO     R3,     G_0184                  ; 5F1F   0243 0184
        PULR    R7                              ; 5F21   02B7

L_5F22:
        SDBD                                    ; 5F22   0001
        MVII    #$5000, R2                      ; 5F23   02BA 0000 0050
        MVII    #$000F, R3                      ; 5F26   02BB 000F
        MVO     R3,     G_0184                  ; 5F28   0243 0184
        MVII    #$0345, R1                      ; 5F2A   02B9 0345

        JSR     R5,     .EXEC.9A1               ; 5F2C   0004 0118 01A1
        JSR     R5,     L_D03A                  ; 5F2F   0004 01D0 003A

        MVI     G_0192, R3                      ; 5F32   0283 0192
        INCR    R3                              ; 5F34   000B
        MVO     R3,     G_019B                  ; 5F35   0243 019B
        CMP     G_019C, R3                      ; 5F37   0343 019C
        BGE     L_5F44                          ; 5F39   020D 0009

        MVO     R3,     G_0192                  ; 5F3B   0243 0192
        MVII    #$0006, R0                      ; 5F3D   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5F3F   0004 0114 02E6

        XORR    R4,     R0                      ; 5F42   01E0
        PULR    R7                              ; 5F43   02B7

L_5F44:
        MVII    #$0001, R1                      ; 5F44   02B9 0001
        MVO     R1,     G_0193                  ; 5F46   0241 0193
        MVII    #$0006, R0                      ; 5F48   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5F4A   0004 0114 02E6

        XORR    R4,     R0                      ; 5F4D   01E0
        PULR    R7                              ; 5F4E   02B7

        PSHR    R5                              ; 5F4F   0275
        MVI     G_0193, R1                      ; 5F50   0281 0193
        TSTR    R1                              ; 5F52   0089
        BNEQ    L_5F8A                          ; 5F53   020C 0035

        JSR     R5,     X_STOP_SFX              ; 5F55   0004 011C 02B4

        CLRR    R3                              ; 5F58   01DB
        MVO     R3,     G_0184                  ; 5F59   0243 0184
        MVO     R3,     G_034A                  ; 5F5B   0243 034A
        MVO     R3,     G_0349                  ; 5F5D   0243 0349
        SDBD                                    ; 5F5F   0001
        MVII    #$0180, R4                      ; 5F60   02BC 0080 0001
        SDBD                                    ; 5F63   0001
        MVI@    R4,     R5                      ; 5F64   02A5
        MVI@    R5,     R2                      ; 5F65   02AA
        TSTR    R2                              ; 5F66   0092
        BNEQ    L_5F6E                          ; 5F67   020C 0005

        SDBD                                    ; 5F69   0001
        MVII    #$5F9E, R5                      ; 5F6A   02BD 009E 005F
        MVI@    R5,     R2                      ; 5F6D   02AA
L_5F6E:
        MVI     G_0345, R3                      ; 5F6E   0283 0345
        SDBD                                    ; 5F70   0001
        ANDI    #$FFE0, R3                      ; 5F71   03BB 00E0 00FF
        XORR    R2,     R3                      ; 5F74   01D3
        MVO     R3,     G_0345                  ; 5F75   0243 0345
        MOVR    R5,     R3                      ; 5F77   00AB
        MVO     R3,     G_0180                  ; 5F78   0243 0180
        SWAP    R3,     1                       ; 5F7A   0043
        MVO     R3,     G_0181                  ; 5F7B   0243 0181
        SDBD                                    ; 5F7D   0001
        MVII    #$0194, R4                      ; 5F7E   02BC 0094 0001
        SDBD                                    ; 5F81   0001
        MVI@    R4,     R0                      ; 5F82   02A0
        SDBD                                    ; 5F83   0001
        MVI@    R4,     R1                      ; 5F84   02A1
        MVO     R0,     G_0347                  ; 5F85   0240 0347
        MVO     R1,     G_0348                  ; 5F87   0241 0348
        PULR    R7                              ; 5F89   02B7

L_5F8A:
        SDBD                                    ; 5F8A   0001
        MVII    #$1830, R3                      ; 5F8B   02BB 0030 0018
        MVI     G_018A, R2                      ; 5F8E   0282 018A
        ADDI    #$0200, R2                      ; 5F90   02FA 0200
        MVO@    R3,     R2                      ; 5F92   0253

        JSR     R5,     L_5BD1                  ; 5F93   0004 0158 03D1
        JSR     R5,     L_D00C                  ; 5F96   0004 01D0 000C

        CLRR    R3                              ; 5F99   01DB

        JSR     R5,     L_6923                  ; 5F9A   0004 0168 0123

        PULR    R7                              ; 5F9D   02B7

        CLRC                                    ; 5F9E   0006
        DECR    R6                              ; 5F9F   0016
        EIS                                     ; 5FA0   0002
        DECR    R5                              ; 5FA1   0015
        DECR    R4                              ; 5FA2   0014
L_5FA3:
        DECR    R7                              ; 5FA3   0017

        DECLE   $0005,  $0012,  $0000,  $0030   ; 5FA4   0005 0012 0000 0030
        DECLE   $0019,  $0380,  $0028,  $0211   ; 5FA8   0019 0380 0028 0211
        DECLE   $0040,  $002A,  $0215,  $0040   ; 5FAC   0040 002A 0215 0040
        DECLE   $002D,  $0380,  $003D,  $0380   ; 5FB0   002D 0380 003D 0380
        DECLE   $004D,  $0100,  $023D,  $0040   ; 5FB4   004D 0100 023D 0040
        DECLE   $0052,  $0241,  $0040,  $0055   ; 5FB8   0052 0241 0040 0055
        DECLE   $0380,  $0064,  $0253,  $00C0   ; 5FBC   0380 0064 0253 00C0
        DECLE   $0067,  $0100,  $003C,  $003E   ; 5FC0   0067 0100 003C 003E
        DECLE   $007A,  $007F,  $007F,  $00F9   ; 5FC4   007A 007F 007F 00F9
        DECLE   $00F0,  $00F0,  $00F0,  $0078   ; 5FC8   00F0 00F0 00F0 0078
        DECLE   $0078,  $0078,  $003C,  $001C   ; 5FCC   0078 0078 003C 001C
        DECLE   $001E,  $001E,  $0020,  $0020   ; 5FD0   001E 001E 0020 0020
        DECLE   $0078,  $0078,  $0076,  $003F   ; 5FD4   0078 0078 0076 003F
        DECLE   $003F,  $001E,  $0018,  $0018   ; 5FD8   003F 001E 0018 0018
        DECLE   $0038,  $0038,  $0070,  $0070   ; 5FDC   0038 0038 0070 0070
        DECLE   $00E0,  $00E0,  $0010,  $0050   ; 5FE0   00E0 00E0 0010 0050
        DECLE   $0078,  $0014,  $001E,  $001F   ; 5FE4   0078 0014 001E 001F
        DECLE   $001F,  $0018,  $0018,  $0018   ; 5FE8   001F 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5FEC   0018 0018 0018 0018
        DECLE   $0018,  $0038,  $0018,  $0010   ; 5FF0   0018 0038 0018 0010
        DECLE   $003C,  $003F,  $001C,  $001C   ; 5FF4   003C 003F 001C 001C
        DECLE   $003C,  $007C,  $00FC,  $00FC   ; 5FF8   003C 007C 00FC 00FC
        DECLE   $00FC,  $00FE,  $00FF,  $00FB   ; 5FFC   00FC 00FE 00FF 00FB
        DECLE   $00FB,  $00FA,  $0000,  $0080   ; 6000   00FB 00FA 0000 0080
        DECLE   $00C0,  $00E6,  $00F6,  $00FE   ; 6004   00C0 00E6 00F6 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 6008   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FC,  $00FC   ; 600C   00FE 00FE 00FC 00FC
        DECLE   $00F8,  $0000,  $0018,  $0018   ; 6010   00F8 0000 0018 0018
        DECLE   $003C,  $007E,  $007F,  $00FF   ; 6014   003C 007E 007F 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $0080   ; 6018   00FF 00FF 00FE 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 601C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0046,  $0046   ; 6020   0000 0000 0046 0046
        DECLE   $007E,  $0056,  $0056,  $007E   ; 6024   007E 0056 0056 007E
        DECLE   $006E,  $006E,  $007E,  $007E   ; 6028   006E 006E 007E 007E
        DECLE   $007E,  $0044,  $0044,  $0044   ; 602C   007E 0044 0044 0044
        DECLE   $0044,  $0044,  $007E,  $007E   ; 6030   0044 0044 007E 007E
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 6034   00FE 00FE 00FE 00FE
        DECLE   $007D,  $007D,  $00BB,  $00BA   ; 6038   007D 007D 00BB 00BA
        DECLE   $00B6,  $00B4,  $0060,  $006E   ; 603C   00B6 00B4 0060 006E
        DECLE   $00FF,  $00FF,  $000F,  $00FF   ; 6040   00FF 00FF 000F 00FF
        DECLE   $007F,  $007F,  $003F,  $001F   ; 6044   007F 007F 003F 001F

        INCR    R7                              ; 6048   000F

        SETC                                    ; 6049   0007
L_604A:
        DIS                                     ; 604A   0003
        DECLE   $0003,  $0027,  $003F,  $003F   ; 604B   0003 0027 003F 003F
        DECLE   $001F,  $000F,  $0000,  $00FF   ; 604F   001F 000F 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6053   00FF 00FF 00FF 00FF
        DECLE   $00F7                           ; 6057   00F7

        ADDR    R0,     R6                      ; 6058   00C6
        ADDR    R0,     R6                      ; 6059   00C6
        ADDR    R0,     R6                      ; 605A   00C6
        MOVR    R0,     R4                      ; 605B   0084
        MOVR    R0,     R4                      ; 605C   0084
        MOVR    R0,     R4                      ; 605D   0084
        MOVR    R0,     R4                      ; 605E   0084
        MOVR    R0,     R4                      ; 605F   0084
        ADDR    R0,     R6                      ; 6060   00C6
        ADDR    R4,     R7                      ; 6061   00E7

        ADDR    R0,     R1                      ; 6062   00C1
        ADDR    R0,     R1                      ; 6063   00C1
        ADDR    R0,     R1                      ; 6064   00C1
        ADDR    R4,     R1                      ; 6065   00E1
        ADDR    R4,     R3                      ; 6066   00E3
        MOVR    R4,     R3                      ; 6067   00A3
        MOVR    R4,     R3                      ; 6068   00A3
        MOVR    R4,     R3                      ; 6069   00A3
        MOVR    R4,     R7                      ; 606A   00A7
        MOVR    R4,     R7                      ; 606B   00A7

        DECLE   $00A5,  $00A5,  $00A5,  $00A5   ; 606C   00A5 00A5 00A5 00A5
        DECLE   $00A5,  $00A5,  $0000,  $0060   ; 6070   00A5 00A5 0000 0060
        DECLE   $0030,  $0010,  $0010,  $0010   ; 6074   0030 0010 0010 0010
        DECLE   $0011,  $001B,  $001E,  $000E   ; 6078   0011 001B 001E 000E
        DECLE   $000E,  $0006,  $0002,  $0002   ; 607C   000E 0006 0002 0002
        DECLE   $0000,  $0000,  $0001,  $0002   ; 6080   0000 0000 0001 0002
        DECLE   $0004,  $0048,  $00D0,  $0060   ; 6084   0004 0048 00D0 0060
        DECLE   $00F8,  $00EE,  $00FE,  $00FE   ; 6088   00F8 00EE 00FE 00FE
        DECLE   $00F8,  $00E0,  $00E0,  $00E0   ; 608C   00F8 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $0008,  $0034   ; 6090   00E0 00E0 0008 0034
        DECLE   $0078,  $00F8,  $00FC,  $00FB   ; 6094   0078 00F8 00FC 00FB
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; 6098   00FF 00FF 00FE 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 609C   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FE,  $00C0,  $00C0   ; 60A0   00FE 00FE 00C0 00C0
        DECLE   $00E0,  $0078,  $00E4,  $002E   ; 60A4   00E0 0078 00E4 002E
        DECLE   $007D,  $00BF,  $0098,  $0058   ; 60A8   007D 00BF 0098 0058
        DECLE   $00FE,  $0066,  $00C0,  $0080   ; 60AC   00FE 0066 00C0 0080
        DECLE   $0000,  $0000,  $0000,  $0002   ; 60B0   0000 0000 0000 0002
        DECLE   $00E4,  $00F4,  $007C,  $001E   ; 60B4   00E4 00F4 007C 001E
        DECLE   $0036,  $003F,  $003F,  $0073   ; 60B8   0036 003F 003F 0073
        DECLE   $00F0,  $00E0,  $00E0,  $00C0   ; 60BC   00F0 00E0 00E0 00C0
        DECLE   $0080,  $0000,  $0000,  $0005   ; 60C0   0080 0000 0000 0005
        DECLE   $0002,  $0007,  $0009,  $001F   ; 60C4   0002 0007 0009 001F

        NEGR    R1                              ; 60C8   0021
        INCR    R7                              ; 60C9   000F

        RSWD    R6                              ; 60CA   003E
L_60CB:
        ADDR    R5,     R6                      ; 60CB   00EE
        DECLE   $003E,  $0074,  $00DC,  $000C   ; 60CC   003E 0074 00DC 000C
        DECLE   $0038,  $0010,  $0080,  $00E0   ; 60D0   0038 0010 0080 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 60D4   00E0 00E0 00E0 00E0
        DECLE   $00F0,  $00F8,  $00F8,  $00C8   ; 60D8   00F0 00F8 00F8 00C8
        DECLE   $0098,  $0098,  $0080,  $0080   ; 60DC   0098 0098 0080 0080
        DECLE   $00C0,  $00C0,  $0001,  $0037   ; 60E0   00C0 00C0 0001 0037
        DECLE   $005B,  $00D6,  $0094,  $00AB   ; 60E4   005B 00D6 0094 00AB
        DECLE   $004B,  $00F6,  $0042,  $007C   ; 60E8   004B 00F6 0042 007C
        DECLE   $0008,  $0078,  $0000,  $003C   ; 60EC   0008 0078 0000 003C
        DECLE   $0000,  $001F,  $0001,  $0003   ; 60F0   0000 001F 0001 0003
        DECLE   $0003,  $0007,  $000E,  $000E   ; 60F4   0003 0007 000E 000E
        DECLE   $001E,  $001C,  $0034,  $002C   ; 60F8   001E 001C 0034 002C
        DECLE   $0078,  $0058,  $00F0,  $00F0   ; 60FC   0078 0058 00F0 00F0
        DECLE   $0020,  $00E0,  $003C,  $0070   ; 6100   0020 00E0 003C 0070
        DECLE   $0070,  $00F0,  $00F0,  $00F8   ; 6104   0070 00F0 00F0 00F8
        DECLE   $00FC,  $00F6,  $00E2,  $0072   ; 6108   00FC 00F6 00E2 0072
        DECLE   $0034,  $0010,  $0030,  $0020   ; 610C   0034 0010 0030 0020
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6110   0000 0000 0001 0001
        DECLE   $0003,  $0003,  $0007,  $003F   ; 6114   0003 0003 0007 003F
        DECLE   $007F,  $00FF,  $003F,  $003F   ; 6118   007F 00FF 003F 003F
        DECLE   $0039,  $0039,  $0018,  $002C   ; 611C   0039 0039 0018 002C
        DECLE   $0036,  $0036,  $0000,  $0000   ; 6120   0036 0036 0000 0000
        DECLE   $00B1,  $006E,  $0049,  $00B2   ; 6124   00B1 006E 0049 00B2
        DECLE   $00CA,  $006C,  $001F,  $00CB   ; 6128   00CA 006C 001F 00CB
        DECLE   $0080,  $0080,  $0000,  $00C0   ; 612C   0080 0080 0000 00C0
        DECLE   $0000,  $00F0,  $006D,  $00BB   ; 6130   0000 00F0 006D 00BB
        DECLE   $0057,  $00FB,  $00DE,  $00ED   ; 6134   0057 00FB 00DE 00ED
        DECLE   $00DB,  $009B,  $0089,  $0009   ; 6138   00DB 009B 0089 0009
        DECLE   $0009,  $0009,  $0009,  $0009   ; 613C   0009 0009 0009 0009
        DECLE   $0009,  $0009,  $0000,  $0000   ; 6140   0009 0009 0000 0000
        DECLE   $0000                           ; 6144   0000

        SWAP    R0,     1                       ; 6145   0040
        ADDR    R4,     R1                      ; 6146   00E1
        MOVR    R5,     R7                      ; 6147   00AF

        DECLE   $00FF,  $00FF,  $007F,  $005E   ; 6148   00FF 00FF 007F 005E
        DECLE   $009E,  $003C,  $0034,  $0016   ; 614C   009E 003C 0034 0016
        DECLE   $001B,  $0009,  $001F,  $001F   ; 6150   001B 0009 001F 001F
        DECLE   $0033,  $0033,  $0067,  $0047   ; 6154   0033 0033 0067 0047
        DECLE   $004F,  $004F,  $004F,  $004F   ; 6158   004F 004F 004F 004F
        DECLE   $0063,  $0073,  $0078,  $0078   ; 615C   0063 0073 0078 0078
        DECLE   $0030,  $0018,  $0000,  $0000   ; 6160   0030 0018 0000 0000
        DECLE   $000E,  $0037,  $00D6,  $003A   ; 6164   000E 0037 00D6 003A
        DECLE   $00D4,  $0027                   ; 6168   00D4 0027

        ADDR    R5,     R4                      ; 616A   00EC
L_616B:
        DECR    R7                              ; 616B   0017

        DECLE   $0030,  $0007,  $0030,  $0003   ; 616C   0030 0007 0030 0003
        DECLE   $0030,  $00C1,  $0043,  $009D   ; 6170   0030 00C1 0043 009D
        DECLE   $00BF                           ; 6174   00BF

        SARC    R3,     1                       ; 6175   007B
        ADDR    R2,     R7                      ; 6176   00D7

        DECLE   $007E,  $003B,  $001D,  $001D   ; 6177   007E 003B 001D 001D
        DECLE   $003B,  $0033,  $0062,  $0042   ; 617B   003B 0033 0062 0042
        DECLE   $0042,  $0042,  $0042,  $0080   ; 617F   0042 0042 0042 0080
        DECLE   $0040,  $00E0,  $00E0,  $0060   ; 6183   0040 00E0 00E0 0060
        DECLE   $0070,  $0070,  $00FA,  $00FF   ; 6187   0070 0070 00FA 00FF
        DECLE   $00BF                           ; 618B   00BF

        ADDR    R3,     R5                      ; 618C   00DD
        MOVR    R1,     R5                      ; 618D   008D
        MOVR    R3,     R5                      ; 618E   009D
        NOP                                     ; 618F   0034
        NEGR    R4                              ; 6190   0024
        ADCR    R0                              ; 6191   0028
        SWAP    R0,     1                       ; 6192   0040
        ADDR    R4,     R0                      ; 6193   00E0
        ADDR    R4,     R0                      ; 6194   00E0
        MOVR    R4,     R0                      ; 6195   00A0
        NEGR    R0                              ; 6196   0020
        SLR     R0,     1                       ; 6197   0060
        ADDR    R1,     R6                      ; 6198   00CE
        MOVR    R3,     R7                      ; 6199   009F

        DECLE   $00BE,  $00FC,  $00FC,  $00F8   ; 619A   00BE 00FC 00FC 00F8
        DECLE   $00FD,  $00FF,  $007F,  $003E   ; 619E   00FD 00FF 007F 003E
        DECLE   $0070,  $00F0,  $00F8,  $00F8   ; 61A2   0070 00F0 00F8 00F8
        DECLE   $0078,  $007E,  $007F,  $00FF   ; 61A6   0078 007E 007F 00FF
        DECLE   $00FF,  $00BF,  $00AD,  $002D   ; 61AA   00FF 00BF 00AD 002D
        DECLE   $0029,  $002B,  $0028,  $0078   ; 61AE   0029 002B 0028 0078
        DECLE   $0010,  $0060,  $0060,  $0020   ; 61B2   0010 0060 0060 0020
        DECLE   $0030,  $0033,  $0032,  $003A   ; 61B6   0030 0033 0032 003A
        DECLE   $007A,  $007A,  $007E,  $007E   ; 61BA   007A 007A 007E 007E
        DECLE   $003C,  $0038,  $0018,  $0038   ; 61BE   003C 0038 0018 0038
        DECLE   $0000,  $0000,  $0020,  $0060   ; 61C2   0000 0000 0020 0060
        DECLE   $00F0,  $00D0,  $006E,  $0095   ; 61C6   00F0 00D0 006E 0095
        DECLE   $002B,  $0036,  $001D,  $0036   ; 61CA   002B 0036 001D 0036
        DECLE   $0001,  $0036,  $0001,  $006D   ; 61CE   0001 0036 0001 006D
        DECLE   $0010,  $0060,  $0060,  $0020   ; 61D2   0010 0060 0060 0020
        DECLE   $0020,  $0021,  $003E,  $003E   ; 61D6   0020 0021 003E 003E
        DECLE   $003E,  $003C,  $0024,  $0024   ; 61DA   003E 003C 0024 0024
        DECLE   $0024,  $0024,  $0024,  $0024   ; 61DE   0024 0024 0024 0024
        DECLE   $0020,  $00F0,  $0060,  $0020   ; 61E2   0020 00F0 0060 0020
        DECLE   $0030,  $0038,  $001C,  $001E   ; 61E6   0030 0038 001C 001E
        DECLE   $000E,  $000E,  $000A,  $000A   ; 61EA   000E 000E 000A 000A
        DECLE   $000A,  $000A,  $000A,  $000A   ; 61EE   000A 000A 000A 000A
        DECLE   $0040,  $00C0,  $00CC,  $005E   ; 61F2   0040 00C0 00CC 005E
        DECLE   $007E,  $007F,  $007F,  $003F   ; 61F6   007E 007F 007F 003F
        DECLE   $001E,  $0012,  $0012,  $0012   ; 61FA   001E 0012 0012 0012
        DECLE   $0012,  $0012,  $0012,  $0036   ; 61FE   0012 0012 0012 0036
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6202   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6206   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 620A   0000 0000 0000 003C
        DECLE   $007E,  $00FF                   ; 620E   007E 00FF

        ADDR    R0,     R7                      ; 6210   00C7
        ADDR    R0,     R7                      ; 6211   00C7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6212   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6216   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $00FF   ; 621A   0000 003C 007E 00FF
        DECLE   $00C3,  $00C3,  $0000,  $0000   ; 621E   00C3 00C3 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6222   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6226   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $007E,  $0066   ; 622A   0018 003C 007E 0066
        DECLE   $0066,  $0000,  $0000,  $0000   ; 622E   0066 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6232   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6236   0000 0000 0000 0000
        DECLE   $0038,  $0038,  $007C,  $006C   ; 623A   0038 0038 007C 006C
        DECLE   $006C,  $0000,  $0000,  $0000   ; 623E   006C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6242   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6246   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $0038,  $0038   ; 624A   0010 0010 0038 0038
        DECLE   $0038,  $0004,  $0000,  $0000   ; 624E   0038 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6252   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 6256   0000 0000 0010 0038
        DECLE   $0038,  $0038,  $0038,  $0028   ; 625A   0038 0038 0038 0028
        DECLE   $0038,  $0004,  $0000,  $0000   ; 625E   0038 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 6262   0000 0000 0000 0010
        DECLE   $0038,  $0028,  $0038,  $0010   ; 6266   0038 0028 0038 0010
        DECLE   $0010,  $0038,  $0028,  $0038   ; 626A   0010 0038 0028 0038
        DECLE   $0010,  $0008,  $0000,  $0000   ; 626E   0010 0008 0000 0000
        DECLE   $0010,  $0038,  $0028,  $0028   ; 6272   0010 0038 0028 0028
        DECLE   $0038,  $0010,  $0010,  $0010   ; 6276   0038 0010 0010 0010
        DECLE   $0038,  $0028,  $0028,  $0038   ; 627A   0038 0028 0028 0038
        DECLE   $0010,  $0008,  $0000,  $0000   ; 627E   0010 0008 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6282   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6286   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 628A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 628E   0000 0000 0000 0000
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 6292   0081 0081 0081 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6296   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 629A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 629E   0000 0000 0000 0000
        DECLE   $0081,  $0081,  $0081,  $0081   ; 62A2   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 62A6   0081 0081 0081 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62AA   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62AE   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $0081,  $0081   ; 62B2   00FF 00FF 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 62B6   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 62BA   0081 0081 0081 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62BE   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62CE   0000 0000 0000 0000
        DECLE   $007E,  $007E,  $007E,  $0000   ; 62D2   007E 007E 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DE   0000 0000 0000 0000
        DECLE   $007E,  $007E,  $007E,  $007E   ; 62E2   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $0000   ; 62E6   007E 007E 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 62F2   0000 0000 007E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 62F6   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $0000   ; 62FA   007E 007E 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 6302   0000 0000 007E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 6306   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $0000   ; 630A   007E 007E 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 630E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $003C   ; 6312   0000 0000 007E 003C
        DECLE   $006E,  $007E,  $007E,  $003C   ; 6316   006E 007E 007E 003C
        DECLE   $007E,  $007E,  $005E,  $0000   ; 631A   007E 007E 005E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 631E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $005E,  $003C   ; 6322   0000 0000 005E 003C
        DECLE   $006E,  $007A,  $005E,  $0034   ; 6326   006E 007A 005E 0034
        DECLE   $007E,  $003E,  $005C,  $0000   ; 632A   007E 003E 005C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 632E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0052,  $0038   ; 6332   0000 0000 0052 0038
        DECLE   $006E,  $004A,  $005C,  $0034   ; 6336   006E 004A 005C 0034
        DECLE   $002E,  $003A,  $0054,  $0000   ; 633A   002E 003A 0054 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 633E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0050,  $002A   ; 6342   0000 0000 0050 002A
        DECLE   $0064,  $000A,  $0054,  $0034   ; 6346   0064 000A 0054 0034
        DECLE   $000A,  $002A,  $0054,  $0000   ; 634A   000A 002A 0054 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 634E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0050,  $0022   ; 6352   0000 0000 0050 0022
        DECLE   $0000,  $000A,  $0040,  $0024   ; 6356   0000 000A 0040 0024
        DECLE   $000A,  $0020,  $0004,  $0000   ; 635A   000A 0020 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 635E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6362   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6366   0000 0000 0000 003C
        DECLE   $003C,  $0000,  $0000,  $0000   ; 636A   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636E   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6372   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6376   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 637A   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 637E   00FF 00FF 00FF 00FF
        DECLE   $0008,  $0002,  $0015,  $0008   ; 6382   0008 0002 0015 0008
        DECLE   $0002,  $0015,  $0000,  $0000   ; 6386   0002 0015 0000 0000
        DECLE   $0000,  $0000,  $0088,  $0000   ; 638A   0000 0000 0088 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 638E   0000 0000 0000 0000
        DECLE   $0002,  $0015,  $0008,  $0002   ; 6392   0002 0015 0008 0002
        DECLE   $0015,  $0008,  $0000,  $0000   ; 6396   0015 0008 0000 0000
        DECLE   $0000,  $0000,  $0022,  $0000   ; 639A   0000 0000 0022 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 639E   0000 0000 0000 0000
        DECLE   $0015,  $0008,  $0002,  $0015   ; 63A2   0015 0008 0002 0015
        DECLE   $0008,  $0002,  $0000,  $0000   ; 63A6   0008 0002 0000 0000
        DECLE   $0000,  $0000,  $008A,  $0000   ; 63AA   0000 0000 008A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 63B2   0000 0000 0080 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; 63B6   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $00A0,  $0000   ; 63BA   0000 0000 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63BE   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; 63C2   0000 0080 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; 63C6   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 63CA   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63CE   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0080   ; 63D2   0080 0000 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; 63DA   0000 0000 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63DE   0000 0000 0000 0000
        DECLE   $0070,  $0070,  $0070,  $0000   ; 63E2   0070 0070 0070 0000
        DECLE   $0000,  $00F8,  $0000,  $0000   ; 63E6   0000 00F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63EA   0000 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $007F   ; 63EE   0000 007F 007F 007F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 63F2   003F 003F 003F 003F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 63F6   001F 001F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63FE   0000 0000 0000 0000
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6402   003F 003F 003F 003F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 6406   001F 001F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 640A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 640E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003F   ; 6412   0000 0000 0000 003F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 6416   001F 001F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6422   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001F,  $001F   ; 6426   0000 0000 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642A   0000 0000 0000 0000
        DECLE   $0000,  $00FE,  $00FE,  $00FE   ; 642E   0000 00FE 00FE 00FE
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 6432   00FC 00FC 00FC 00FC
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 6436   00F8 00F8 00F8 00F8
        DECLE   $0000,  $0008,  $0010,  $0020   ; 643A   0000 0008 0010 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 643E   0020 0020 0020 0020
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 6442   00FC 00FC 00FC 00FC
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 6446   00F8 00F8 00F8 00F8
        DECLE   $0000,  $000B,  $0010,  $0020   ; 644A   0000 000B 0010 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 644E   0020 0020 0020 0020
        DECLE   $0000,  $0020,  $0020,  $00FC   ; 6452   0000 0020 0020 00FC
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 6456   00F8 00F8 00F8 00F8
        DECLE   $0000,  $000E,  $0010,  $0020   ; 645A   0000 000E 0010 0020
        DECLE   $0000,  $0020,  $0000,  $0020   ; 645E   0000 0020 0000 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 6462   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $00F8,  $00F8   ; 6466   0020 0020 00F8 00F8
        DECLE   $0000,  $000B,  $0010,  $0020   ; 646A   0000 000B 0010 0020
        DECLE   $0000,  $0000,  $0020,  $0020   ; 646E   0000 0000 0020 0020
        DECLE   $0020,  $0000,  $0020,  $0020   ; 6472   0020 0000 0020 0020
        DECLE   $0020,  $0020,  $0000,  $0000   ; 6476   0020 0020 0000 0000

        INCR    R7                              ; 647A   000F

        DECR    R0                              ; 647B   0010
L_647C:
        NEGR    R0                              ; 647C   0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 647D   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 6481   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0000   ; 6485   0020 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6489   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 648D   0000 0000 0000 0000
        DECLE   $0000,  $0078,  $00C4,  $00BA   ; 6491   0000 0078 00C4 00BA
        DECLE   $00D5,  $00FD,  $00C5,  $00BA   ; 6495   00D5 00FD 00C5 00BA
        DECLE   $00C4,  $0000,  $0000,  $003C   ; 6499   00C4 0000 0000 003C
        DECLE   $0046,  $00BB,  $00D5,  $00FD   ; 649D   0046 00BB 00D5 00FD
        DECLE   $00C5,  $00BB,  $0045,  $00FA   ; 64A1   00C5 00BB 0045 00FA
        DECLE   $0071,  $00F8,  $00F0,  $0078   ; 64A5   0071 00F8 00F0 0078
        DECLE   $003C,  $0000,  $0038,  $0044   ; 64A9   003C 0000 0038 0044
        DECLE   $00BA,  $00D5,  $00FD,  $00C5   ; 64AD   00BA 00D5 00FD 00C5
        DECLE   $00BA,  $00C4,  $007C,  $0038   ; 64B1   00BA 00C4 007C 0038
        DECLE   $007C,  $0038,  $007C,  $0038   ; 64B5   007C 0038 007C 0038
        DECLE   $007C,  $0000,  $0000           ; 64B9   007C 0000 0000

        SARC    R0,     1                       ; 64BC   0078
        ADDR    R0,     R4                      ; 64BD   00C4
        MOVR    R7,     R2                      ; 64BE   00BA
        ADDR    R2,     R5                      ; 64BF   00D5
        ADDR    R7,     R5                      ; 64C0   00FD
        ADDR    R0,     R5                      ; 64C1   00C5
        MOVR    R7,     R2                      ; 64C2   00BA
        ADDR    R0,     R6                      ; 64C3   00C6
        RSWD    R6                              ; 64C4   003E
        SLLC    R0,     2                       ; 64C5   005C
        MOVR    R7,     R6                      ; 64C6   00BE
        INCR    R7                              ; 64C7   000F

        DECLE   $001F                           ; 64C8   001F
L_64C9:
        RSWD    R6                              ; 64C9   003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 64D6   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64DE   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 64E2   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 64E6   00FF 00FF 00FF 00FF
        DECLE   $0060,  $0060,  $0040,  $0040   ; 64EA   0060 0060 0040 0040
        DECLE   $0040,  $0040,  $00C0,  $00C0   ; 64EE   0040 0040 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64FA   0000 0000 0000 0000
        DECLE   $0060,  $0040,  $00C0,  $00C0   ; 64FE   0060 0040 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6502   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6506   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 650A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 650E   0000 0000 00C0 00C0
        DECLE   $0040,  $0060,  $0000,  $0000   ; 6512   0040 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6516   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 651A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 651E   0000 0000 00C0 00C0
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6522   0040 0040 0040 0040
        DECLE   $0060,  $0060,  $0000,  $0000   ; 6526   0060 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 652A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 652E   0000 0000 00C0 00C0
        DECLE   $0040,  $0040,  $0060,  $0060   ; 6532   0040 0040 0060 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6536   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 653A   0000 0000 0000 0060
        DECLE   $0060,  $0040,  $00C0,  $00C0   ; 653E   0060 0040 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6542   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6546   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 654A   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $007E,  $007E   ; 654E   003C 003C 007E 007E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6552   00FF 00FF 00FF 00FF
        DECLE   $007E,  $007E,  $003C,  $003C   ; 6556   007E 007E 003C 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 655A   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; 655E   0018 003C 007E 007E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6562   00FF 00FF 00FF 00FF
        DECLE   $007E,  $007E,  $003C,  $0018   ; 6566   007E 007E 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 656A   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $007E   ; 656E   0000 0018 003C 007E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6572   00FF 00FF 00FF 00FF
        DECLE   $007E,  $003C,  $0018,  $0000   ; 6576   007E 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 657A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 657E   0000 0000 0018 003C
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 6582   00FE 00FE 00FE 00FE
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6586   003C 0018 0000 0000
        DECLE   $00F8,  $0020,  $0020,  $0020   ; 658A   00F8 0020 0020 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 658E   0000 0000 0000 0000
        DECLE   $0000,  $00F8,  $0020,  $0020   ; 6592   0000 00F8 0020 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6596   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F8,  $0020   ; 659A   0000 0000 00F8 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 659E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 65A2   0000 0000 0000 00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 65AE   0000 0000 0000 0008
        DECLE   $001C,  $001C,  $001C,  $0008   ; 65B2   001C 001C 001C 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 65B6   0008 0008 0008 0008
        DECLE   $0000,  $0000,  $0008,  $001C   ; 65BA   0000 0000 0008 001C
        DECLE   $001C,  $002E,  $003E,  $003E   ; 65BE   001C 002E 003E 003E
        DECLE   $003E,  $003E,  $001C,  $001C   ; 65C2   003E 003E 001C 001C
        DECLE   $0008,  $0008,  $0008,  $0008   ; 65C6   0008 0008 0008 0008
        DECLE   $0000                           ; 65CA   0000

        INCR    R0                              ; 65CB   0008
        COMR    R4                              ; 65CC   001C
        COMR    R4                              ; 65CD   001C
        ADCR    R6                              ; 65CE   002E
        ADCR    R6                              ; 65CF   002E
        RSWD    R6                              ; 65D0   003E
        RSWD    R6                              ; 65D1   003E
        RSWD    R6                              ; 65D2   003E
        RSWD    R6                              ; 65D3   003E
        RSWD    R6                              ; 65D4   003E
        COMR    R4                              ; 65D5   001C
        COMR    R4                              ; 65D6   001C
        INCR    R0                              ; 65D7   0008
        INCR    R0                              ; 65D8   0008
        INCR    R0                              ; 65D9   0008
        COMR    R4                              ; 65DA   001C
        COMR    R4                              ; 65DB   001C
        RSWD    R6                              ; 65DC   003E
        RSWD    R6                              ; 65DD   003E
        SAR     R3,     2                       ; 65DE   006F
        SAR     R3,     2                       ; 65DF   006F
        SARC    R3,     2                       ; 65E0   007F
        SARC    R3,     2                       ; 65E1   007F
        SARC    R3,     2                       ; 65E2   007F
        SARC    R3,     2                       ; 65E3   007F
        RSWD    R6                              ; 65E4   003E
        RSWD    R6                              ; 65E5   003E
        COMR    R4                              ; 65E6   001C
        COMR    R4                              ; 65E7   001C
        INCR    R0                              ; 65E8   0008
        INCR    R0                              ; 65E9   0008
L_65EA:
        PSHR    R5                              ; 65EA   0275
        DECLE   $02B8,  $000F,  $0001           ; 65EB   02B8 000F 0001

        MVII    #$0063, R4                      ; 65EE   02BC 0063
        SDBD                                    ; 65F0   0001
        MVI@    R2,     R3                      ; 65F1   0293
        MVO@    R3,     R4                      ; 65F2   0263
        SWAP    R3,     1                       ; 65F3   0043
        MVO@    R3,     R4                      ; 65F4   0263
L_65F5:
        MVI@    R1,     R3                      ; 65F5   028B
        MVO@    R3,     R2                      ; 65F6   0253
        DECR    R1                              ; 65F7   0011
        DECR    R2                              ; 65F8   0012
        DECR    R0                              ; 65F9   0010
        BNEQ    L_65F5                          ; 65FA   022C 0006

        SDBD                                    ; 65FC   0001
        MVII    #$0163, R4                      ; 65FD   02BC 0063 0001
        SDBD                                    ; 6600   0001
        MVI@    R4,     R3                      ; 6601   02A3
        MVO@    R3,     R2                      ; 6602   0253
        MVII    #$0005, R5                      ; 6603   02BD 0005
        MVII    #$0288, R1                      ; 6605   02B9 0288
        MVII    #$0289, R2                      ; 6607   02BA 0289
L_6609:
        MVII    #$000F, R0                      ; 6609   02B8 000F
        PSHR    R2                              ; 660B   0272
        PSHR    R2                              ; 660C   0272
        SUBI    #$0008, R2                      ; 660D   033A 0008
        SDBD                                    ; 660F   0001
        MVII    #$0163, R4                      ; 6610   02BC 0063 0001
        MVI@    R2,     R3                      ; 6613   0293
        MVO@    R3,     R4                      ; 6614   0263
        SWAP    R3,     1                       ; 6615   0043
        MVO@    R3,     R4                      ; 6616   0263
        PULR    R2                              ; 6617   02B2
        CLRR    R3                              ; 6618   01DB
        SUBI    #$000F, R2                      ; 6619   033A 000F
        MVI     G_0162, R4                      ; 661B   0284 0162
        CMPI    #$000F, R4                      ; 661D   037C 000F
        BEQ     L_6629                          ; 661F   0204 0008

        CMPI    #$0003, R4                      ; 6621   037C 0003
        BEQ     L_662C                          ; 6623   0204 0007

        ADDI    #$0001, R4                      ; 6625   02FC 0001
        ADDR    R4,     R2                      ; 6627   00E2
        MVO@    R3,     R2                      ; 6628   0253
L_6629:
        MVO@    R3,     R2                      ; 6629   0253
        B       L_662F                          ; 662A   0200 0003

L_662C:
        ADDI    #$000C, R2                      ; 662C   02FA 000C
        MVO@    R3,     R2                      ; 662E   0253
L_662F:
        PULR    R2                              ; 662F   02B2
L_6630:
        MVI@    R1,     R3                      ; 6630   028B
        MVO@    R3,     R2                      ; 6631   0253
        DECR    R2                              ; 6632   0012
        DECR    R1                              ; 6633   0011
        DECR    R0                              ; 6634   0010
        BNEQ    L_6630                          ; 6635   022C 0006

        SDBD                                    ; 6637   0001
        MVII    #$0163, R4                      ; 6638   02BC 0063 0001
        SDBD                                    ; 663B   0001
        MVI@    R4,     R3                      ; 663C   02A3
        SDBD                                    ; 663D   0001
        CMPI    #$1000, R3                      ; 663E   037B 0000 0010
        BLT     L_6646                          ; 6641   0205 0003

        XORI    #$0001, R3                      ; 6643   03FB 0001
        INCR    R7                              ; 6645   000F

L_6646:
        CLRR    R3                              ; 6646   01DB
L_6647:
        MVO@    R3,     R2                      ; 6647   0253
        ADDI    #$0005, R1                      ; 6648   02F9 0005
        MVI@    R1,     R3                      ; 664A   028B
        SDBD                                    ; 664B   0001
        CMPI    #$1000, R3                      ; 664C   037B 0000 0010
        BLT     L_6655                          ; 664F   0205 0004

        XORI    #$0001, R3                      ; 6651   03FB 0001
        B       L_6659                          ; 6653   0200 0004

L_6655:
        SDBD                                    ; 6655   0001
        XORI    #$0879, R3                      ; 6656   03FB 0079 0008
L_6659:
        MVO@    R3,     R1                      ; 6659   024B
        ADDI    #$0008, R1                      ; 665A   02F9 0008
        MVI@    R1,     R3                      ; 665C   028B
        SDBD                                    ; 665D   0001
        CMPI    #$1000, R3                      ; 665E   037B 0000 0010
        BLT     L_6668                          ; 6661   0205 0005

        SDBD                                    ; 6663   0001
        ANDI    #$3FFE, R3                      ; 6664   03BB 00FE 003F
        INCR    R7                              ; 6667   000F

L_6668:
        CLRR    R3                              ; 6668   01DB
L_6669:
        MVO@    R3,     R1                      ; 6669   024B
        MVI     G_0162, R4                      ; 666A   0284 0162
        ADDR    R4,     R2                      ; 666C   00E2
        SDBD                                    ; 666D   0001
        MVII    #$08DB, R3                      ; 666E   02BB 00DB 0008
        MVO@    R3,     R2                      ; 6671   0253
        ADDI    #$0016, R1                      ; 6672   02F9 0016
        MOVR    R1,     R2                      ; 6674   008A
        INCR    R2                              ; 6675   000A
        DECR    R5                              ; 6676   0015
        BNEQ    L_6609                          ; 6677   022C 006F
        PULR    R7                              ; 6679   02B7

        PSHR    R5                              ; 667A   0275
        TSTR    R0                              ; 667B   0080
        BMI     L_66F0                          ; 667C   020B 0072

        MVI     G_0323, R3                      ; 667E   0283 0323
        TSTR    R3                              ; 6680   009B
        BNEQ    L_66F0                          ; 6681   020C 006D

        MVI     G_0357, R3                      ; 6683   0283 0357
        SDBD                                    ; 6685   0001
        CMPI    #$8C00, R3                      ; 6686   037B 0000 008C
        BC      L_66F0                          ; 6689   0201 0065

        SDBD                                    ; 668B   0001
        CMPI    #$0E00, R3                      ; 668C   037B 0000 000E
        BNC     L_66F0                          ; 668F   0209 005F

L_6691:
        MVI     G_0161, R2                      ; 6691   0282 0161
        TSTR    R2                              ; 6693   0092
        BEQ     L_66B4                          ; 6694   0204 001E

        CLRR    R2                              ; 6696   01D2
        MVO     R2,     G_012A                  ; 6697   0242 012A
        MVO     R2,     G_012C                  ; 6699   0242 012C
        MVI     G_0324, R3                      ; 669B   0283 0324
        MVO     R3,     G_0159                  ; 669D   0243 0159
        SWAP    R3,     1                       ; 669F   0043
        MVO     R3,     G_015A                  ; 66A0   0243 015A
        MVI     G_032C, R3                      ; 66A2   0283 032C
        MVO     R3,     G_015B                  ; 66A4   0243 015B
        SWAP    R3,     1                       ; 66A6   0043
        MVO     R3,     G_015C                  ; 66A7   0243 015C
        SDBD                                    ; 66A9   0001
        MVII    #$017B, R4                      ; 66AA   02BC 007B 0001
        SDBD                                    ; 66AD   0001
        MVI@    R4,     R3                      ; 66AE   02A3
        MVO     R3,     G_035F                  ; 66AF   0243 035F
        MVO     R2,     G_0161                  ; 66B1   0242 0161
        PULR    R7                              ; 66B3   02B7

L_66B4:
        MVII    #$0001, R2                      ; 66B4   02BA 0001
        MVII    #$0080, R1                      ; 66B6   02B9 0080
        MVO     R1,     G_012A                  ; 66B8   0241 012A
        MVO     R1,     G_012C                  ; 66BA   0241 012C
        MVI     G_035F, R3                      ; 66BC   0283 035F
        MVO     R3,     G_017B                  ; 66BE   0243 017B
        SWAP    R3,     1                       ; 66C0   0043
        MVO     R3,     G_017C                  ; 66C1   0243 017C
        MVII    #$0159, R4                      ; 66C3   02BC 0159
        SDBD                                    ; 66C5   0001
        MVI@    R4,     R3                      ; 66C6   02A3
        MVO     R3,     G_0324                  ; 66C7   0243 0324
        SDBD                                    ; 66C9   0001
        MVI@    R4,     R3                      ; 66CA   02A3
        MVO     R3,     G_032C                  ; 66CB   0243 032C

        JSR     R5,     L_6D6D                  ; 66CD   0004 016C 016D

        MVII    #$003E, R0                      ; 66D0   02B8 003E
        MVO     R0,     G_0323                  ; 66D2   0240 0323
        MVI     G_035E, R4                      ; 66D4   0284 035E
        MVI     G_0171, R0                      ; 66D6   0280 0171
        MVI     G_0168, R1                      ; 66D8   0281 0168
        MVI     G_0169, R3                      ; 66DA   0283 0169
        CMPR    R0,     R3                      ; 66DC   0143
        BEQ     L_674C                          ; 66DD   0204 006D

        CMPR    R0,     R1                      ; 66DF   0141
        BEQ     L_674C                          ; 66E0   0204 006A

        MVI     G_035A, R1                      ; 66E2   0281 035A
        CMPR    R0,     R1                      ; 66E4   0141
        BEQ     L_673D                          ; 66E5   0204 0056

        CLRR    R3                              ; 66E7   01DB
L_66E8:
        MVO     R2,     G_0161                  ; 66E8   0242 0161
        INCR    R3                              ; 66EA   000B
        ADDR    R7,     R3                      ; 66EB   00FB
        ADD@    R3,     R7                      ; 66EC   02DF

        DECLE   $0004                           ; 66ED   0004

        NEGR    R5                              ; 66EE   0025
        SWAP    R2,     1                       ; 66EF   0042
L_66F0:
        PULR    R7                              ; 66F0   02B7

        MVI     G_0171, R3                      ; 66F1   0283 0171
        MVI     G_017F, R1                      ; 66F3   0281 017F
        INCR    R1                              ; 66F5   0009
        MVO     R1,     G_017F                  ; 66F6   0241 017F
        MVII    #$0003, R2                      ; 66F8   02BA 0003

        JSR     R5,     X_DIV                   ; 66FA   0004 011C 01FB

        TSTR    R1                              ; 66FD   0089
        BEQ     L_6709                          ; 66FE   0204 0009

        MVO     R3,     G_01B0                  ; 6700   0243 01B0
        MVII    #$0000, R0                      ; 6702   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 6704   0004 0114 02E6
        DECLE   $01DF                           ; 6707   01DF

        PULR    R7                              ; 6708   02B7

L_6709:
        MVO     R3,     G_01AF                  ; 6709   0243 01AF
        MVII    #$0003, R0                      ; 670B   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 670D   0004 0114 02E6

        XORR    R3,     R6                      ; 6710   01DE
        PULR    R7                              ; 6711   02B7

        MOVR    R4,     R1                      ; 6712   00A1
        RRC     R1,     1                       ; 6713   0071
        BC      L_6721                          ; 6714   0201 000B

L_6716:
        MVII    #$0005, R0                      ; 6716   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 6718   0004 0114 02E6

        XORR    R3,     R6                      ; 671B   01DE
        ANDI    #$0003, R1                      ; 671C   03B9 0003
        BEQ     L_6736                          ; 671E   0204 0016
        PULR    R7                              ; 6720   02B7

L_6721:
        CLRR    R0                              ; 6721   01C0
        MVO     R0,     G_01B5                  ; 6722   0240 01B5
        MVII    #$0004, R0                      ; 6724   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 6726   0004 0114 02E6

        XORR    R3,     R6                      ; 6729   01DE
        ANDI    #$0003, R1                      ; 672A   03B9 0003
        BEQ     L_6736                          ; 672C   0204 0008
        PULR    R7                              ; 672E   02B7

        MVII    #$0006, R0                      ; 672F   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 6731   0004 0114 02E6

        XORR    R3,     R6                      ; 6734   01DE
        PULR    R7                              ; 6735   02B7

L_6736:
        MVII    #$0002, R0                      ; 6736   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 6738   0004 0114 02E6
        DECLE   $01DF                           ; 673B   01DF

        PULR    R7                              ; 673C   02B7

L_673D:
        MVO     R2,     G_0161                  ; 673D   0242 0161
        MOVR    R4,     R1                      ; 673F   00A1
        MVI     G_0357, R2                      ; 6740   0282 0357
        SDBD                                    ; 6742   0001
        CMPI    #$5000, R2                      ; 6743   037A 0000 0050
        BNC     L_6716                          ; 6746   0229 0031

        MVI     G_035A, R3                      ; 6748   0283 035A
        B       L_6709                          ; 674A   0220 0042

L_674C:
        ANDI    #$0001, R0                      ; 674C   03B8 0001
        BEQ     L_6754                          ; 674E   0204 0004

        MVI     G_031F, R3                      ; 6750   0283 031F
        B       L_6756                          ; 6752   0200 0002

L_6754:
        MVI     G_0337, R3                      ; 6754   0283 0337
L_6756:
        SDBD                                    ; 6756   0001
        CMPI    #$4800, R3                      ; 6757   037B 0000 0048
        BC      L_6760                          ; 675A   0201 0004

        MVII    #$0001, R3                      ; 675C   02BB 0001
        B       L_66E8                          ; 675E   0220 0077

L_6760:
        SDBD                                    ; 6760   0001
        CMPI    #$7000, R3                      ; 6761   037B 0000 0070
        BNC     L_676A                          ; 6764   0209 0004

        MVII    #$0002, R3                      ; 6766   02BB 0002
        B       L_66E8                          ; 6768   0220 0081

L_676A:
        CLRR    R0                              ; 676A   01C0
        MVO     R0,     G_0323                  ; 676B   0240 0323
        MVII    #$0080, R0                      ; 676D   02B8 0080
        MVO     R0,     G_012A                  ; 676F   0240 012A
        MVO     R0,     G_012C                  ; 6771   0240 012C
        MVO     R0,     G_012E                  ; 6773   0240 012E

        JSR     R5,     .EXEC.A61               ; 6775   0004 0118 0261

        DIS                                     ; 6778   0003
        MVI     G_035E, R3                      ; 6779   0283 035E
        ANDI    #$0001, R3                      ; 677B   03BB 0001
        BEQ     L_678B                          ; 677D   0204 000C

        MVII    #$0001, R0                      ; 677F   02B8 0001
        MVO     R0,     G_01B5                  ; 6781   0240 01B5
        MVII    #$0004, R0                      ; 6783   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 6785   0004 0114 02E6

        XORR    R3,     R6                      ; 6788   01DE
        B       L_6791                          ; 6789   0200 0006

L_678B:
        MVII    #$0005, R0                      ; 678B   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 678D   0004 0114 02E6
        DECLE   $01DF                           ; 6790   01DF
L_6791:
        JSR     R5,     L_D07D                  ; 6791   0004 01D0 007D

        MVII    #$0008, R0                      ; 6794   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; 6796   0004 011C 02D5
        JSR     R5,     L_679E                  ; 6799   0004 0164 039E

        B       L_684F                          ; 679C   0200 00B1

L_679E:
        PSHR    R5                              ; 679E   0275
        MVII    #$0048, R2                      ; 679F   02BA 0048
L_67A1:
        SDBD                                    ; 67A1   0001
        MVII    #$0FFF, R3                      ; 67A2   02BB 00FF 000F
L_67A5:
        DECR    R3                              ; 67A5   0013
        BNEQ    L_67A5                          ; 67A6   022C 0002

        SDBD                                    ; 67A8   0001
        MVII    #$67B3, R3                      ; 67A9   02BB 00B3 0067

        JSR     R5,     L_51D8                  ; 67AC   0004 0150 01D8

        DECR    R2                              ; 67AF   0012
        BNEQ    L_67A1                          ; 67B0   022C 0010
        PULR    R7                              ; 67B2   02B7

        PSHR    R5                              ; 67B3   0275
        MVII    #$002C, R1                      ; 67B4   02B9 002C
        MVI@    R1,     R4                      ; 67B6   028C
        DECR    R4                              ; 67B7   0014
        CMPI    #$0008, R4                      ; 67B8   037C 0008
        BNEQ    L_67BE                          ; 67BA   020C 0002

        SUBI    #$0002, R4                      ; 67BC   033C 0002
L_67BE:
        TSTR    R4                              ; 67BE   00A4
        BNEQ    L_67C3                          ; 67BF   020C 0002

        MVII    #$000F, R4                      ; 67C1   02BC 000F
L_67C3:
        MVO@    R4,     R1                      ; 67C3   024C
        MVO     R4,     G_0106                  ; 67C4   0244 0106
        MVO     R4,     .STIC.VIDEN             ; 67C6   0244 0020

        JSR     R5,     L_51F1                  ; 67C8   0004 0150 01F1

        PULR    R7                              ; 67CB   02B7

        PSHR    R5                              ; 67CC   0275
        TSTR    R0                              ; 67CD   0080
        BMI     L_67F4                          ; 67CE   020B 0024

        MOVR    R0,     R1                      ; 67D0   0081
        MVII    #$0014, R0                      ; 67D1   02B8 0014

        JSR     R5,     .EXEC.629               ; 67D3   0004 0114 0229

        MVO     R0,     G_0321                  ; 67D6   0240 0321
        TSTR    R0                              ; 67D8   0080
        BPL     L_67DF                          ; 67D9   0203 0004

        MVII    #$0001, R0                      ; 67DB   02B8 0001
        B       L_67E0                          ; 67DD   0200 0001

L_67DF:
        CLRR    R0                              ; 67DF   01C0
L_67E0:
        MVI     G_0170, R3                      ; 67E0   0283 0170
        TSTR    R3                              ; 67E2   009B
        BEQ     L_67ED                          ; 67E3   0204 0008

        CMPR    R3,     R0                      ; 67E5   0158
        BEQ     L_67F3                          ; 67E6   0204 000B

        JSR     R5,     L_67F8                  ; 67E8   0004 0164 03F8

        B       L_67F3                          ; 67EB   0200 0006

L_67ED:
        CMPR    R3,     R0                      ; 67ED   0158
        BEQ     L_67F3                          ; 67EE   0204 0003

        JSR     R5,     L_67F8                  ; 67F0   0004 0164 03F8

L_67F3:
        PULR    R7                              ; 67F3   02B7

L_67F4:
        CLRR    R0                              ; 67F4   01C0
        MVO     R0,     G_0321                  ; 67F5   0240 0321
        PULR    R7                              ; 67F7   02B7

L_67F8:
        PSHR    R5                              ; 67F8   0275
        MVII    #$031F, R1                      ; 67F9   02B9 031F
        MVI@    R1,     R2                      ; 67FB   028A
        TSTR    R0                              ; 67FC   0080
        BNEQ    L_6805                          ; 67FD   020C 0006

        SDBD                                    ; 67FF   0001
        ADDI    #$1000, R2                      ; 6800   02FA 0000 0010
        B       L_6809                          ; 6803   0200 0004

L_6805:
        SDBD                                    ; 6805   0001
        SUBI    #$1000, R2                      ; 6806   033A 0000 0010
L_6809:
        MVO@    R2,     R1                      ; 6809   024A
        MVII    #$031D, R1                      ; 680A   02B9 031D
        MVII    #$0003, R0                      ; 680C   02B8 0003
        MVI@    R1,     R4                      ; 680E   028C
        MVII    #$0200, R2                      ; 680F   02BA 0200
        XORR    R2,     R4                      ; 6811   01D4
        MVO@    R4,     R1                      ; 6812   024C
        XORI    #$0001, R3                      ; 6813   03FB 0001
        MVO     R3,     G_0170                  ; 6815   0243 0170
        ADDI    #$0008, R1                      ; 6817   02F9 0008
L_6819:
        MVI@    R1,     R4                      ; 6819   028C
        XORR    R2,     R4                      ; 681A   01D4
        MVO@    R4,     R1                      ; 681B   024C
        ADDI    #$0004, R1                      ; 681C   02F9 0004
        MVI@    R1,     R3                      ; 681E   028B
        MOVR    R3,     R4                      ; 681F   009C
        ANDI    #$00FF, R4                      ; 6820   03BC 00FF
        SDBD                                    ; 6822   0001
        ANDI    #$FF00, R3                      ; 6823   03BB 0000 00FF
        NEGR    R3                              ; 6826   0023
        XORR    R4,     R3                      ; 6827   01E3
        MVO@    R3,     R1                      ; 6828   024B
        ADDI    #$0004, R1                      ; 6829   02F9 0004
        DECR    R0                              ; 682B   0010
        BNEQ    L_6819                          ; 682C   022C 0014

        MVII    #$0329, R2                      ; 682E   02BA 0329
        SDBD                                    ; 6830   0001
        MVII    #$690B, R4                      ; 6831   02BC 000B 0069
        MVI     G_0171, R1                      ; 6834   0281 0171
        SLL     R1,     1                       ; 6836   0049
        ADD     G_0171, R1                      ; 6837   02C1 0171
        ADDR    R1,     R4                      ; 6839   00CC
        MVII    #$0003, R0                      ; 683A   02B8 0003
L_683C:
        MVI@    R4,     R3                      ; 683C   02A3
        MVI@    R2,     R1                      ; 683D   0291
        CLRC                                    ; 683E   0006
        RRC     R3,     1                       ; 683F   0073
        BNC     L_6845                          ; 6840   0209 0003

        SWAP    R3,     1                       ; 6842   0043
        NEGR    R3                              ; 6843   0023
        INCR    R7                              ; 6844   000F

L_6845:
        SWAP    R3,     1                       ; 6845   0043
L_6846:
        ADDR    R3,     R1                      ; 6846   00D9
        MVO@    R1,     R2                      ; 6847   0251
        ADDI    #$0008, R2                      ; 6848   02FA 0008
        DECR    R0                              ; 684A   0010
        BNEQ    L_683C                          ; 684B   022C 0010
        PULR    R7                              ; 684D   02B7

        PSHR    R5                              ; 684E   0275
L_684F:
        MVII    #$0001, R2                      ; 684F   02BA 0001
        MVO     R2,     G_017E                  ; 6851   0242 017E
        B       L_6859                          ; 6853   0200 0004

        PSHR    R5                              ; 6855   0275
L_6856:
        CLRR    R2                              ; 6856   01D2
        MVO     R2,     G_017E                  ; 6857   0242 017E
L_6859:
        SDBD                                    ; 6859   0001
        MVII    #$6883, R3                      ; 685A   02BB 0083 0068

        JSR     R5,     L_51D8                  ; 685D   0004 0150 01D8

        MVI     G_017E, R3                      ; 6860   0283 017E
        TSTR    R3                              ; 6862   009B
        BEQ     L_6869                          ; 6863   0204 0004

        JSR     R5,     L_530A                  ; 6865   0004 0150 030A

        PULR    R7                              ; 6868   02B7

L_6869:
        JSR     R5,     L_51FF                  ; 6869   0004 0150 01FF

        MVII    #$0001, R0                      ; 686C   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 686E   0004 0114 02E6

        XORR    R3,     R6                      ; 6871   01DE
        MVII    #$0002, R0                      ; 6872   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 6874   0004 0114 02E6

        XORR    R3,     R6                      ; 6877   01DE
        MVI     G_0171, R0                      ; 6878   0280 0171
        MVO     R0,     G_01AF                  ; 687A   0240 01AF
        MVII    #$0003, R0                      ; 687C   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 687E   0004 0114 02E6

        XORR    R3,     R6                      ; 6881   01DE
        PULR    R7                              ; 6882   02B7

        PSHR    R5                              ; 6883   0275
        MVI     G_017E, R2                      ; 6884   0282 017E
        TSTR    R2                              ; 6886   0092
        BEQ     L_688F                          ; 6887   0204 0006

        SDBD                                    ; 6889   0001
        MVII    #$5FA7, R5                      ; 688A   02BD 00A7 005F
        B       L_6895                          ; 688D   0200 0006

L_688F:
        SDBD                                    ; 688F   0001
        MVII    #$6F08, R5                      ; 6890   02BD 0008 006F
        B       L_6895                          ; 6893   0200 0000

L_6895:
        JSRD    R4,     X_NEW_GRAM_INIT         ; 6895   0004 001E 0335

        MVII    #$000F, R0                      ; 6898   02B8 000F
        MVO     R0,     G_0106                  ; 689A   0240 0106
        MVO     R0,     .STIC.BORD              ; 689C   0240 002C

        JSR     R5,     L_51F1                  ; 689E   0004 0150 01F1

        PULR    R7                              ; 68A1   02B7

L_68A2:
        PSHR    R5                              ; 68A2   0275
        MVII    #$0217, R4                      ; 68A3   02BC 0217
        SDBD                                    ; 68A5   0001
        MVII    #$5413, R5                      ; 68A6   02BD 0013 0054
        CLRR    R3                              ; 68A9   01DB
        MVI     G_016F, R0                      ; 68AA   0280 016F
        DECR    R0                              ; 68AC   0010
        CLRC                                    ; 68AD   0006
L_68AE:
        MVI@    R4,     R1                      ; 68AE   02A1
        MOVR    R1,     R2                      ; 68AF   008A
        RLC     R2,     1                       ; 68B0   0052
        BC      L_68C6                          ; 68B1   0201 0013

        MVI@    R4,     R2                      ; 68B3   02A2
        DECR    R4                              ; 68B4   0014
        SDBD                                    ; 68B5   0001
        ANDI    #$C000, R1                      ; 68B6   03B9 0000 00C0
        SDBD                                    ; 68B9   0001
        ANDI    #$C000, R2                      ; 68BA   03BA 0000 00C0
        SLR     R2,     2                       ; 68BD   0066
        XORR    R2,     R1                      ; 68BE   01D1
        SWAP    R1,     1                       ; 68BF   0041
        SLL     R1,     2                       ; 68C0   004D
        SLL     R1,     2                       ; 68C1   004D
        SWAP    R1,     1                       ; 68C2   0041
        CMPR    R0,     R1                      ; 68C3   0141
        BEQ     L_68D6                          ; 68C4   0204 0010

L_68C6:
        MVI@    R5,     R2                      ; 68C6   02AA
        TSTR    R2                              ; 68C7   0092
        BEQ     L_68CE                          ; 68C8   0204 0004

        DECR    R4                              ; 68CA   0014
        ADDR    R2,     R4                      ; 68CB   00D4
        B       L_68AE                          ; 68CC   0220 001F

L_68CE:
        SDBD                                    ; 68CE   0001
        MVII    #$5413, R5                      ; 68CF   02BD 0013 0054
        MVII    #$0217, R4                      ; 68D2   02BC 0217
        B       L_68AE                          ; 68D4   0220 0027

L_68D6:
        DECR    R4                              ; 68D6   0014
        MOVR    R4,     R1                      ; 68D7   00A1
        MVI@    R1,     R2                      ; 68D8   028A
        SDBD                                    ; 68D9   0001
        XORI    #$8000, R2                      ; 68DA   03FA 0000 0080
        MVO@    R2,     R1                      ; 68DD   024A
        SUBI    #$0200, R1                      ; 68DE   0339 0200
        PSHR    R0                              ; 68E0   0270
        PSHR    R5                              ; 68E1   0275
        PULR    R5                              ; 68E2   02B5
        MVII    #$0014, R2                      ; 68E3   02BA 0014

        JSR     R5,     X_DIV                   ; 68E5   0004 011C 01FB

        INCR    R0                              ; 68E8   0008
        SLL     R0,     2                       ; 68E9   004C
        SLL     R0,     1                       ; 68EA   0048
        INCR    R1                              ; 68EB   0009
        SLL     R1,     2                       ; 68EC   004D
        SLL     R1,     1                       ; 68ED   0049
        PSHR    R0                              ; 68EE   0270
        MOVR    R1,     R0                      ; 68EF   0088
        PULR    R1                              ; 68F0   02B1
        SWAP    R0,     1                       ; 68F1   0040
        SWAP    R1,     1                       ; 68F2   0041
        PULR    R2                              ; 68F3   02B2
        MOVR    R2,     R3                      ; 68F4   0093
        INCR    R3                              ; 68F5   000B
        MVO     R3,     G_016F                  ; 68F6   0243 016F
        MOVR    R4,     R2                      ; 68F8   00A2

        JSR     R5,     L_6923                  ; 68F9   0004 0168 0123

        MVI     G_016F, R0                      ; 68FC   0280 016F
        MVII    #$0001, R1                      ; 68FE   02B9 0001
        MVII    #$0007, R3                      ; 6900   02BB 0007
        MVII    #$0200, R4                      ; 6902   02BC 0200

        JSR     R5,     X_PRNUM_RGT             ; 6904   0004 0118 00C5

        PULR    R7                              ; 6907   02B7

        PSHR    R5                              ; 6908   0275
        B       L_6691                          ; 6909   0220 0279

        DECLE   $0000,  $0011,  $0000,  $0011   ; 690B   0000 0011 0000 0011
        DECLE   $0000,  $0000,  $0011,  $0000   ; 690F   0000 0000 0011 0000
        DECLE   $0010,  $0000,  $0011,  $0000   ; 6913   0010 0000 0011 0000
        DECLE   $0000,  $0000,  $0000,  $0011   ; 6917   0000 0000 0000 0011
        DECLE   $0010,  $0000,  $0011,  $0010   ; 691B   0010 0000 0011 0010
        DECLE   $0000,  $0011,  $0010,  $0000   ; 691F   0000 0011 0010 0000
L_6923:
        PSHR    R5                              ; 6923   0275
        INCR    R3                              ; 6924   000B
        ADDR    R7,     R3                      ; 6925   00FB
        ADD@    R3,     R7                      ; 6926   02DF

        DECLE   $0008,  $0037                   ; 6927   0008 0037

        MOVR    R7,     R4                      ; 6929   00BC
        MOVR    R2,     R5                      ; 692A   0095
        SLLC    R3,     2                       ; 692B   005F
        MOVR    R4,     R7                      ; 692C   00A7

        RLC     R1,     1                       ; 692D   0051
        PULR    R7                              ; 692E   02B7

        MVII    #$0050, R0                      ; 692F   02B8 0050
        MVII    #$004D, R1                      ; 6931   02B9 004D
        SWAP    R0,     1                       ; 6933   0040
        SWAP    R1,     1                       ; 6934   0041
        MVO     R0,     G_033F                  ; 6935   0240 033F
        MVO     R1,     G_0340                  ; 6937   0241 0340
        SDBD                                    ; 6939   0001
        MVII    #$30C1, R3                      ; 693A   02BB 00C1 0030
        MVO     R3,     G_033D                  ; 693D   0243 033D
        SDBD                                    ; 693F   0001
        MVII    #$6A05, R3                      ; 6940   02BB 0005 006A
        MVO     R3,     G_033E                  ; 6943   0243 033E
        MVII    #$02D1, R4                      ; 6945   02BC 02D1
        SDBD                                    ; 6947   0001
        MVII    #$56C8, R5                      ; 6948   02BD 00C8 0056
        SDBD                                    ; 694B   0001
        MVI@    R5,     R3                      ; 694C   02AB
        MVO@    R3,     R4                      ; 694D   0263
        SDBD                                    ; 694E   0001
        MVI@    R5,     R3                      ; 694F   02AB
        MVO@    R3,     R4                      ; 6950   0263
        MVII    #$00E6, R0                      ; 6951   02B8 00E6
        MVO     R0,     G_0185                  ; 6953   0240 0185
        CLRR    R0                              ; 6955   01C0
        MVO     R0,     G_016F                  ; 6956   0240 016F
        MVII    #$0004, R0                      ; 6958   02B8 0004

        JSR     R5,     .EXEC.41C               ; 695A   0004 0114 001C

        PULR    R7                              ; 695D   02B7

        MVI     G_0322, R3                      ; 695E   0283 0322
        MVO     R3,     G_035A                  ; 6960   0243 035A
        SUBI    #$0200, R2                      ; 6962   033A 0200
        MVO     R2,     G_018A                  ; 6964   0242 018A
        ADDI    #$0015, R2                      ; 6966   02FA 0015
        MVO     R2,     G_0185                  ; 6968   0242 0185
        SDBD                                    ; 696A   0001
        MVII    #$6A9B, R4                      ; 696B   02BC 009B 006A
        MVII    #$0004, R2                      ; 696E   02BA 0004

        JSR     R5,     L_6A7C                  ; 6970   0004 0168 027C

        MVI     G_031E, R3                      ; 6973   0283 031E
        MVO     R3,     G_0356                  ; 6975   0243 0356
        PULR    R7                              ; 6977   02B7

        SUBI    #$01EB, R2                      ; 6978   033A 01EB
        MVO     R2,     G_0185                  ; 697A   0242 0185
        SDBD                                    ; 697C   0001
        MVII    #$6AB3, R4                      ; 697D   02BC 00B3 006A
        MVII    #$0003, R2                      ; 6980   02BA 0003

        JSR     R5,     L_6A7C                  ; 6982   0004 0168 027C

        PULR    R7                              ; 6985   02B7

        SUBI    #$01EB, R2                      ; 6986   033A 01EB
        MVO     R2,     G_0185                  ; 6988   0242 0185
        SDBD                                    ; 698A   0001
        MVII    #$6AC5, R4                      ; 698B   02BC 00C5 006A
        MVII    #$0003, R2                      ; 698E   02BA 0003

        JSR     R5,     L_6A7C                  ; 6990   0004 0168 027C

        SDBD                                    ; 6993   0001
        CMPI    #$5000, R0                      ; 6994   0378 0000 0050
        BC      L_699A                          ; 6997   0201 0001
        PULR    R7                              ; 6999   02B7

L_699A:
        MVII    #$0200, R3                      ; 699A   02BB 0200
        MVII    #$033D, R1                      ; 699C   02B9 033D
        MVII    #$0003, R0                      ; 699E   02B8 0003
L_69A0:
        MVI@    R1,     R2                      ; 69A0   028A
        XORR    R3,     R2                      ; 69A1   01DA
        MVO@    R2,     R1                      ; 69A2   024A
        ADDI    #$0008, R1                      ; 69A3   02F9 0008
        DECR    R0                              ; 69A5   0010
        BNEQ    L_69A0                          ; 69A6   022C 0007

        MVI     G_033F, R1                      ; 69A8   0281 033F
        SDBD                                    ; 69AA   0001
        MVII    #$0800, R3                      ; 69AB   02BB 0000 0008
        ADDR    R3,     R1                      ; 69AE   00D9
        MVO     R1,     G_033F                  ; 69AF   0241 033F
        MVI     G_0347, R1                      ; 69B1   0281 0347
        SUBR    R3,     R1                      ; 69B3   0119
        MVO     R1,     G_0347                  ; 69B4   0241 0347
        MVI     G_034F, R1                      ; 69B6   0281 034F
        SUBR    R3,     R1                      ; 69B8   0119
        MVO     R1,     G_034F                  ; 69B9   0241 034F
        PULR    R7                              ; 69BB   02B7

        SUBI    #$0200, R2                      ; 69BC   033A 0200
        MVO     R2,     G_018A                  ; 69BE   0242 018A
        ADDI    #$0015, R2                      ; 69C0   02FA 0015
        MVO     R2,     G_0185                  ; 69C2   0242 0185
        SDBD                                    ; 69C4   0001
        MVII    #$6AD7, R4                      ; 69C5   02BC 00D7 006A
        MVII    #$0003, R2                      ; 69C8   02BA 0003

        JSR     R5,     L_6A7C                  ; 69CA   0004 0168 027C

        PULR    R7                              ; 69CD   02B7

        ADDI    #$0015, R2                      ; 69CE   02FA 0015
        CLRR    R3                              ; 69D0   01DB
        MVO@    R3,     R2                      ; 69D1   0253
        SUBI    #$0200, R2                      ; 69D2   033A 0200
        MVO     R2,     G_018A                  ; 69D4   0242 018A
        MVO     R2,     G_0185                  ; 69D6   0242 0185
        SDBD                                    ; 69D8   0001
        MVII    #$6AE9, R4                      ; 69D9   02BC 00E9 006A
        MVII    #$0001, R2                      ; 69DC   02BA 0001

        JSR     R5,     L_6A7C                  ; 69DE   0004 0168 027C

        PULR    R7                              ; 69E1   02B7
        PULR    R7                              ; 69E2   02B7

        DECLE   $02FA,  $0014,  $0001           ; 69E3   02FA 0014 0001

        MVII    #$0030, R3                      ; 69E6   02BB 0030
        COMR    R1                              ; 69E8   0019
        MVO@    R3,     R2                      ; 69E9   0253
        SUBI    #$0200, R2                      ; 69EA   033A 0200
        MVO     R2,     G_018A                  ; 69EC   0242 018A
        INCR    R2                              ; 69EE   000A
        MVO     R2,     G_0185                  ; 69EF   0242 0185
        SDBD                                    ; 69F1   0001
        MVII    #$6AEF, R4                      ; 69F2   02BC 00EF 006A
        MVII    #$0002, R2                      ; 69F5   02BA 0002

        JSR     R5,     L_6A7C                  ; 69F7   0004 0168 027C

        MVO     R0,     G_0194                  ; 69FA   0240 0194
        SWAP    R0,     1                       ; 69FC   0040
        MVO     R0,     G_0195                  ; 69FD   0240 0195
        MVO     R1,     G_0196                  ; 69FF   0241 0196
        SWAP    R1,     1                       ; 6A01   0041
        MVO     R1,     G_0197                  ; 6A02   0241 0197
        PULR    R7                              ; 6A04   02B7
        B       L_6A07                          ; 6A05   0200 0000

L_6A07:
        RSWD    R6                              ; 6A07   003E
        DECLE   $005C,  $0008,  $0048,  $0000   ; 6A08   005C 0008 0048 0000

        B       L_6A0E                          ; 6A0C   0200 0000

L_6A0E:
        INCR    R4                              ; 6A0E   000C
        DECLE   $005D,  $0002,  $0074,  $0000   ; 6A0F   005D 0002 0074 0000

        B       L_6A15                          ; 6A13   0200 0000

L_6A15:
        SWAP    R2,     2                       ; 6A15   0046
        SLLC    R1,     2                       ; 6A16   005D

        JSR     R4,     L_5800                  ; 6A17   0004 0058 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 6A1A   0200 0000 0000 0000
        DECLE   $0003,  $0060,  $0000           ; 6A1E   0003 0060 0000

        B       L_6A23                          ; 6A21   0200 0000
L_6A23:
        MOVR    R3,     R7                      ; 6A23   009F

        DECLE   $005D,  $0006,  $0068,  $0000   ; 6A24   005D 0006 0068 0000

        B       L_6A2A                          ; 6A28   0200 0000

L_6A2A:
        MOVR    R7,     R4                      ; 6A2A   00BC
        DECLE   $005D,  $0003,  $0078,  $0000   ; 6A2B   005D 0003 0078 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 6A2F   0200 0000 0000 0000
        DECLE   $0003,  $007E,  $0000,  $0200   ; 6A33   0003 007E 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6A37   0000 0000 0000 0001
        DECLE   $0084,  $0000,  $0200,  $0000   ; 6A3B   0084 0000 0200 0000
        DECLE   $0000,  $0000,  $0004,  $0085   ; 6A3F   0000 0000 0004 0085
        DECLE   $0000                           ; 6A43   0000

        B       L_6A46                          ; 6A44   0200 0000

L_6A46:
        ADDR    R1,     R5                      ; 6A46   00CD
        DECLE   $005D,  $0005,  $008D,  $0000   ; 6A47   005D 0005 008D 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 6A4B   0200 0000 0000 0000
        DECLE   $0001,  $0097,  $0000           ; 6A4F   0001 0097 0000

        B       L_6A54                          ; 6A52   0200 0000

L_6A54:
        NOP                                     ; 6A54   0034
        DECLE   $005E,  $0004,  $0099,  $0000   ; 6A55   005E 0004 0099 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 6A59   0200 0000 0000 0000
        DECLE   $0002,  $00A1,  $0000           ; 6A5D   0002 00A1 0000

        B       L_6A62                          ; 6A60   0200 0000

L_6A62:
        COMR    R4                              ; 6A62   001C
        DECLE   $005E,  $0006,  $00A5,  $0000   ; 6A63   005E 0006 00A5 0000

        B       L_6A69                          ; 6A67   0200 0000

L_6A69:
        MOVR    R5,     R3                      ; 6A69   00AB
        DECLE   $005E,  $0004,  $00B1,  $0000   ; 6A6A   005E 0004 00B1 0000

        B       L_6A70                          ; 6A6E   0200 0000

L_6A70:
        ADDR    R7,     R0                      ; 6A70   00F8
        DECLE   $005E,  $0004,  $00B9,  $0000   ; 6A71   005E 0004 00B9 0000

        B       L_6A77                          ; 6A75   0200 0000

L_6A77:
        SLL     R3,     2                       ; 6A77   004F
        DECLE   $005F,  $0004,  $00BD,  $0000   ; 6A78   005F 0004 00BD 0000
L_6A7C:
        PSHR    R5                              ; 6A7C   0275
        MVII    #$033D, R5                      ; 6A7D   02BD 033D
L_6A7F:
        SDBD                                    ; 6A7F   0001
        MVI@    R4,     R3                      ; 6A80   02A3
        MVO@    R3,     R5                      ; 6A81   026B
        SDBD                                    ; 6A82   0001
        MVI@    R4,     R3                      ; 6A83   02A3
        MVO@    R3,     R5                      ; 6A84   026B
        MVI@    R4,     R3                      ; 6A85   02A3
        RRC     R3,     1                       ; 6A86   0073
        SWAP    R3,     1                       ; 6A87   0043
        BNC     L_6A8B                          ; 6A88   0209 0001

        NEGR    R3                              ; 6A8A   0023
L_6A8B:
        ADDR    R3,     R0                      ; 6A8B   00D8
        MVO@    R0,     R5                      ; 6A8C   0268
        MVI@    R4,     R3                      ; 6A8D   02A3
        RRC     R3,     1                       ; 6A8E   0073
        SWAP    R3,     1                       ; 6A8F   0043
        BNC     L_6A93                          ; 6A90   0209 0001

        NEGR    R3                              ; 6A92   0023
L_6A93:
        ADDR    R3,     R1                      ; 6A93   00D9
        MVO@    R1,     R5                      ; 6A94   0269
        ADDI    #$0004, R5                      ; 6A95   02FD 0004
        DECR    R2                              ; 6A97   0012
        BNEQ    L_6A7F                          ; 6A98   022C 001A
        PULR    R7                              ; 6A9A   02B7

        ADDR    R2,     R0                      ; 6A9B   00D0
        GSWD    R0                              ; 6A9C   0030
        INCR    R4                              ; 6A9D   000C
        SAR     R2,     1                       ; 6A9E   006A
        INCR    R0                              ; 6A9F   0008
        INCR    R5                              ; 6AA0   000D
        ADDR    R0,     R7                      ; 6AA1   00C7

        DECLE   $0020,  $0013,  $006A,  $0009   ; 6AA2   0020 0013 006A 0009
        DECLE   $002C,  $00D1,  $0020,  $001A   ; 6AA6   002C 00D1 0020 001A
        DECLE   $006A,  $0000,  $0000,  $0000   ; 6AAA   006A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6AAE   0000 0000 0000 0008
        DECLE   $0006,  $0040,  $0010,  $0028   ; 6AB2   0006 0040 0010 0028
        DECLE   $006A,  $0002,  $0004           ; 6AB6   006A 0002 0004

        SWAP    R0,     1                       ; 6AB9   0040
        DECR    R0                              ; 6ABA   0010
        ADCR    R7                              ; 6ABB   002F

        SAR     R2,     1                       ; 6ABC   006A
L_6ABD:
        DECR    R0                              ; 6ABD   0010
        DECLE   $0000,  $0087,  $0030,  $0036   ; 6ABE   0000 0087 0030 0036

        SAR     R2,     1                       ; 6AC2   006A
        INCR    R7                              ; 6AC3   000F

        DECLE   $0000                           ; 6AC4   0000
L_6AC5:
        ADDR    R0,     R7                      ; 6AC5   00C7

        DECLE   $0010,  $003D,  $006A,  $0000   ; 6AC6   0010 003D 006A 0000

        DIS                                     ; 6ACA   0003
        ADDR    R0,     R7                      ; 6ACB   00C7

        DECLE   $0010,  $0044,  $006A,  $0010   ; 6ACC   0010 0044 006A 0010
        DECLE   $0000,  $00C2,  $0010,  $004B   ; 6AD0   0000 00C2 0010 004B
        DECLE   $006A,  $0000                   ; 6AD4   006A 0000

        EIS                                     ; 6AD6   0002
        ADDR    R0,     R7                      ; 6AD7   00C7

        DECLE   $0000,  $0052,  $006A,  $0008   ; 6AD8   0000 0052 006A 0008
        DECLE   $0021,  $00D5,  $0020,  $0059   ; 6ADC   0021 00D5 0020 0059
        DECLE   $006A,  $0009,  $0000,  $0047   ; 6AE0   006A 0009 0000 0047
        DECLE   $0010,  $0060,  $006A,  $0020   ; 6AE4   0010 0060 006A 0020
        DECLE   $0028,  $0042,  $0010,  $0067   ; 6AE8   0028 0042 0010 0067
        DECLE   $006A,  $0010,  $0010,  $0090   ; 6AEC   006A 0010 0010 0090
        DECLE   $0010,  $006E,  $006A,  $0000   ; 6AF0   0010 006E 006A 0000
        DECLE   $0010,  $0041,  $0010,  $0075   ; 6AF4   0010 0041 0010 0075
        DECLE   $006A,  $0006,  $0005           ; 6AF8   006A 0006 0005
L_6AFB:
        PSHR    R5                              ; 6AFB   0275

        JSR     R5,     X_PLAY_SFX1             ; 6AFC   0004 0118 03BB
        DECLE   $0389                           ; 6AFF  SFX data
        DECLE   $011D                           ; 6B00  SFX data
        DECLE   $007D                           ; 6B01  SFX data
        DECLE   $0035                           ; 6B02  SFX data
        DECLE   $006B                           ; 6B03  SFX data
        DECLE   $011D                           ; 6B04  SFX data
        DECLE   $007D                           ; 6B05  SFX data
        DECLE   $0280,  $0087                   ; 6B06  SFX data
        DECLE   $0288,  $00D7                   ; 6B08  SFX data
        DECLE   $02D4,  $019E                   ; 6B0A  SFX data
        DECLE   $03EB                           ; 6B0C  SFX data
        DECLE   $0015                           ; 6B0D  SFX data
        DECLE   $006B                           ; 6B0E  SFX data
        DECLE   $0284,  $012E                   ; 6B0F  SFX data
        DECLE   $01AB                           ; 6B11  SFX data
        DECLE   $0005                           ; 6B12  SFX data
        DECLE   $0025                           ; 6B13  SFX data
        DECLE   $006B                           ; 6B14  SFX data
        DECLE   $0285                           ; 6B15  SFX data
        DECLE   $0288,  $00F0                   ; 6B16  SFX data
        DECLE   $01AB                           ; 6B18  SFX data
        DECLE   $0015                           ; 6B19  SFX data
        DECLE   $006B                           ; 6B1A  SFX data
        DECLE   $02D4,  $00B9                   ; 6B1B  SFX data
        DECLE   $01AB                           ; 6B1D  SFX data
        DECLE   $0005                           ; 6B1E  SFX data
        DECLE   $0025                           ; 6B1F  SFX data
        DECLE   $006B                           ; 6B20  SFX data
        DECLE   $0280,  $00B4                   ; 6B21  SFX data
        DECLE   $0288,  $00D7                   ; 6B23  SFX data
        DECLE   $01AB                           ; 6B25  SFX data
        DECLE   $0035                           ; 6B26  SFX data
        DECLE   $006B                           ; 6B27  SFX data
        DECLE   $0288,  $00F0                   ; 6B28  SFX data
        DECLE   $0284,  $012E                   ; 6B2A  SFX data
        DECLE   $03EB                           ; 6B2C  SFX data
        DECLE   $0035                           ; 6B2D  SFX data
        DECLE   $006B                           ; 6B2E  SFX data
        DECLE   $0280,  $0087                   ; 6B2F  SFX data
        DECLE   $0288,  $00D7                   ; 6B31  SFX data
        DECLE   $02D4,  $0101                   ; 6B33  SFX data
        DECLE   $03EB                           ; 6B35  SFX data
        DECLE   $0015                           ; 6B36  SFX data
        DECLE   $006B                           ; 6B37  SFX data
        DECLE   $0284,  $012E                   ; 6B38  SFX data
        DECLE   $01AB                           ; 6B3A  SFX data
        DECLE   $0005                           ; 6B3B  SFX data
        DECLE   $0025                           ; 6B3C  SFX data
        DECLE   $006B                           ; 6B3D  SFX data
        DECLE   $0285                           ; 6B3E  SFX data
        DECLE   $0288,  $00F0                   ; 6B3F  SFX data
        DECLE   $01AB                           ; 6B41  SFX data
        DECLE   $0015                           ; 6B42  SFX data
        DECLE   $006B                           ; 6B43  SFX data
        DECLE   $02D4,  $019E                   ; 6B44  SFX data
        DECLE   $01AB                           ; 6B46  SFX data
        DECLE   $0005                           ; 6B47  SFX data
        DECLE   $0025                           ; 6B48  SFX data
        DECLE   $006B                           ; 6B49  SFX data
        DECLE   $0280,  $00B4                   ; 6B4A  SFX data
        DECLE   $0288,  $00D7                   ; 6B4C  SFX data
        DECLE   $01AB                           ; 6B4E  SFX data
        DECLE   $0035                           ; 6B4F  SFX data
        DECLE   $006B                           ; 6B50  SFX data
        DECLE   $0288,  $00F0                   ; 6B51  SFX data
        DECLE   $02D4,  $02AE                   ; 6B53  SFX data
        DECLE   $01AB                           ; 6B55  SFX data
        DECLE   $0025                           ; 6B56  SFX data
        DECLE   $006B                           ; 6B57  SFX data
        DECLE   $0285                           ; 6B58  SFX data
        DECLE   $0288,  $00D7                   ; 6B59  SFX data
        DECLE   $01AB                           ; 6B5B  SFX data
        DECLE   $0035                           ; 6B5C  SFX data
        DECLE   $006B                           ; 6B5D  SFX data
        DECLE   $0280,  $010D                   ; 6B5E  SFX data
        DECLE   $0288,  $0327                   ; 6B60  SFX data
        DECLE   $02D4,  $024E                   ; 6B62  SFX data
        DECLE   $01AB                           ; 6B64  SFX data
        DECLE   $0005                           ; 6B65  SFX data
        DECLE   $006B                           ; 6B66  SFX data
        DECLE   $0280,  $00CA                   ; 6B67  SFX data
        DECLE   $01AB                           ; 6B69  SFX data
        DECLE   $0035                           ; 6B6A  SFX data
        DECLE   $006B                           ; 6B6B  SFX data
        DECLE   $0280,  $00F0                   ; 6B6C  SFX data
        DECLE   $0288,  $0140                   ; 6B6E  SFX data
        DECLE   $0284,  $021B                   ; 6B70  SFX data
        DECLE   $01AB                           ; 6B72  SFX data
        DECLE   $0005                           ; 6B73  SFX data
        DECLE   $006B                           ; 6B74  SFX data
        DECLE   $0280,  $00CA                   ; 6B75  SFX data
        DECLE   $01AB                           ; 6B77  SFX data
        DECLE   $0035                           ; 6B78  SFX data
        DECLE   $006B                           ; 6B79  SFX data
        DECLE   $0280,  $00A0                   ; 6B7A  SFX data
        DECLE   $0288,  $021B                   ; 6B7C  SFX data
        DECLE   $02D4,  $0035                   ; 6B7E  SFX data
        DECLE   $01AB                           ; 6B80  SFX data
        DECLE   $0005                           ; 6B81  SFX data
        DECLE   $006B                           ; 6B82  SFX data
        DECLE   $0280,  $010D                   ; 6B83  SFX data
        DECLE   $01AB                           ; 6B85  SFX data
        DECLE   $0035                           ; 6B86  SFX data
        DECLE   $006B                           ; 6B87  SFX data
        DECLE   $0280,  $00CA                   ; 6B88  SFX data
        DECLE   $0288,  $0140                   ; 6B8A  SFX data
        DECLE   $0284,  $021B                   ; 6B8C  SFX data
        DECLE   $01AB                           ; 6B8E  SFX data
        DECLE   $0005                           ; 6B8F  SFX data
        DECLE   $006B                           ; 6B90  SFX data
        DECLE   $0280,  $00A0                   ; 6B91  SFX data
        DECLE   $01AB                           ; 6B93  SFX data
        DECLE   $0035                           ; 6B94  SFX data
        DECLE   $006B                           ; 6B95  SFX data
        DECLE   $0280,  $00F0                   ; 6B96  SFX data
        DECLE   $0288,  $0281                   ; 6B98  SFX data
        DECLE   $02D4,  $0101                   ; 6B9A  SFX data
        DECLE   $01AB                           ; 6B9C  SFX data
        DECLE   $0005                           ; 6B9D  SFX data
        DECLE   $006B                           ; 6B9E  SFX data
        DECLE   $0280,  $00CA                   ; 6B9F  SFX data
        DECLE   $01AB                           ; 6BA1  SFX data
        DECLE   $0035                           ; 6BA2  SFX data
        DECLE   $006B                           ; 6BA3  SFX data
        DECLE   $0280,  $00A0                   ; 6BA4  SFX data
        DECLE   $0288,  $0140                   ; 6BA6  SFX data
        DECLE   $0284,  $021B                   ; 6BA8  SFX data
        DECLE   $01AB                           ; 6BAA  SFX data
        DECLE   $0005                           ; 6BAB  SFX data
        DECLE   $006B                           ; 6BAC  SFX data
        DECLE   $0280,  $010D                   ; 6BAD  SFX data
        DECLE   $01AB                           ; 6BAF  SFX data
        DECLE   $0025                           ; 6BB0  SFX data
        DECLE   $0015                           ; 6BB1  SFX data
        DECLE   $006B                           ; 6BB2  SFX data
        DECLE   $0288,  $0327                   ; 6BB3  SFX data
        DECLE   $02D4,  $024E                   ; 6BB5  SFX data
        DECLE   $01AB                           ; 6BB7  SFX data
        DECLE   $0005                           ; 6BB8  SFX data
        DECLE   $006B                           ; 6BB9  SFX data
        DECLE   $0280,  $00A0                   ; 6BBA  SFX data
        DECLE   $01AB                           ; 6BBC  SFX data
        DECLE   $0035                           ; 6BBD  SFX data
        DECLE   $0043,  $0008                   ; 6BBE  SFX data
        DECLE   $0003,  $005F                   ; 6BC0  SFX data
        DECLE   $0280,  $00F0                   ; 6BC2  SFX data
        DECLE   $0288,  $02FA                   ; 6BC4  SFX data
        DECLE   $02D4,  $01F4                   ; 6BC6  SFX data
        DECLE   $01AB                           ; 6BC8  SFX data
        DECLE   $0005                           ; 6BC9  SFX data
        DECLE   $006B                           ; 6BCA  SFX data
        DECLE   $0280,  $00A0                   ; 6BCB  SFX data
        DECLE   $01AB                           ; 6BCD  SFX data
        DECLE   $0035                           ; 6BCE  SFX data
        DECLE   $0043,  $0003                   ; 6BCF  SFX data
        DECLE   $0077,  $00D4,  $006B           ; 6BD1  SFX data
UC_6BD4:
        SDBD                                    ; 6BD4  SLIB UCALL target
        MVII    #$6B06, R4                      ; 6BD5   02BC 0006 006B
        PULR    R7                              ; 6BD8   02B7

        DECLE   $0280,  $00FE,  $0288,  $0357   ; 6BD9   0280 00FE 0288 0357
        DECLE   $02D4,  $02AE,  $01AB,  $0005   ; 6BDD   02D4 02AE 01AB 0005
        DECLE   $006B,  $0280,  $00A0,  $01AB   ; 6BE1   006B 0280 00A0 01AB
        DECLE   $0035,  $006B,  $0280,  $0078   ; 6BE5   0035 006B 0280 0078
        DECLE   $0288,  $00BE,  $02D4,  $0380   ; 6BE9   0288 00BE 02D4 0380
        DECLE   $03EB,  $0015,  $006B,  $0284   ; 6BED   03EB 0015 006B 0284
        DECLE   $010D,  $01AB,  $0005           ; 6BF1   010D 01AB 0005

        NEGR    R5                              ; 6BF4   0025
        SAR     R3,     1                       ; 6BF5   006B
        MVI     .BTAB.88,R5                     ; 6BF6   0285 0288
        ADDR    R2,     R7                      ; 6BF8   00D7

        DECLE   $01AB,  $0015,  $006B,  $02D4   ; 6BF9   01AB 0015 006B 02D4
        DECLE   $01F4,  $01AB,  $0005,  $0025   ; 6BFD   01F4 01AB 0005 0025
        DECLE   $006B,  $0280,  $00A0,  $0288   ; 6C01   006B 0280 00A0 0288
        DECLE   $00BE,  $01AB,  $0035           ; 6C05   00BE 01AB 0035

        SAR     R3,     1                       ; 6C08   006B
        MVI@    R1,     R0                      ; 6C09   0288
        ADDR    R2,     R7                      ; 6C0A   00D7

        DECLE   $0284,  $010D,  $03EB,  $0035   ; 6C0B   0284 010D 03EB 0035
        DECLE   $006B,  $0280,  $0078,  $0288   ; 6C0F   006B 0280 0078 0288
        DECLE   $00BE,  $02D4,  $0101,  $03EB   ; 6C13   00BE 02D4 0101 03EB
        DECLE   $0015,  $006B,  $0284,  $010D   ; 6C17   0015 006B 0284 010D
        DECLE   $01AB,  $0005                   ; 6C1B   01AB 0005

        NEGR    R5                              ; 6C1D   0025
        SAR     R3,     1                       ; 6C1E   006B
        MVI     .BTAB.88,R5                     ; 6C1F   0285 0288
        ADDR    R2,     R7                      ; 6C21   00D7

        DECLE   $01AB,  $0015,  $006B,  $02C4   ; 6C22   01AB 0015 006B 02C4
        DECLE   $03C0,  $01AB,  $0005,  $0025   ; 6C26   03C0 01AB 0005 0025
        DECLE   $006B,  $0280,  $00A0,  $0288   ; 6C2A   006B 0280 00A0 0288
        DECLE   $00BE,  $01AB,  $0035           ; 6C2E   00BE 01AB 0035

        SAR     R3,     1                       ; 6C31   006B
        MVI@    R1,     R0                      ; 6C32   0288
        ADDR    R2,     R7                      ; 6C33   00D7

        DECLE   $0284,  $010D,  $01AB,  $0025   ; 6C34   0284 010D 01AB 0025
        DECLE   $006B,  $0285,  $0288,  $00BE   ; 6C38   006B 0285 0288 00BE
        DECLE   $01AB,  $0035                   ; 6C3C   01AB 0035

        SAR     R3,     1                       ; 6C3E   006B
        MVI@    R1,     R0                      ; 6C3F   0288
        ADD@    R1,     R7                      ; 6C40   02CF

        DECLE   $02D4,  $019E,  $01AB,  $0005   ; 6C41   02D4 019E 01AB 0005
        DECLE   $006B,  $0280,  $00B4,  $01AB   ; 6C45   006B 0280 00B4 01AB
        DECLE   $0035,  $006B,  $0280,  $0078   ; 6C49   0035 006B 0280 0078
        DECLE   $0288,  $012E,  $0284,  $01E0   ; 6C4D   0288 012E 0284 01E0
        DECLE   $01AB,  $0005,  $006B,  $0280   ; 6C51   01AB 0005 006B 0280
        DECLE   $00B4,  $01AB,  $0035,  $006B   ; 6C55   00B4 01AB 0035 006B
        DECLE   $0280,  $0097,  $0288,  $025D   ; 6C59   0280 0097 0288 025D
        DECLE   $02D4,  $00B9,  $01AB,  $0005   ; 6C5D   02D4 00B9 01AB 0005
        DECLE   $006B,  $0280,  $006B,  $01AB   ; 6C61   006B 0280 006B 01AB
        DECLE   $0025,  $0015,  $006B,  $0288   ; 6C65   0025 0015 006B 0288
        DECLE   $012E,  $0284,  $01E0,  $01AB   ; 6C69   012E 0284 01E0 01AB
        DECLE   $0005,  $006B,  $0280,  $00B4   ; 6C6D   0005 006B 0280 00B4
        DECLE   $01AB,  $0035                   ; 6C71   01AB 0035

        SAR     R3,     1                       ; 6C73   006B
        MVI     G_0078, R0                      ; 6C74   0280 0078
        MVI@    R1,     R0                      ; 6C76   0288
        ADD@    R1,     R7                      ; 6C77   02CF

        DECLE   $02D4,  $019E,  $01AB,  $0005   ; 6C78   02D4 019E 01AB 0005
        DECLE   $006B,  $0280,  $00B4,  $01AB   ; 6C7C   006B 0280 00B4 01AB
        DECLE   $0035,  $006B,  $0280,  $0097   ; 6C80   0035 006B 0280 0097
        DECLE   $0288,  $012E,  $0284,  $01E0   ; 6C84   0288 012E 0284 01E0
        DECLE   $01AB,  $0005,  $006B,  $0280   ; 6C88   01AB 0005 006B 0280
        DECLE   $006B,  $01AB,  $0025,  $0015   ; 6C8C   006B 01AB 0025 0015
        DECLE   $006B,  $0288,  $025D,  $02D4   ; 6C90   006B 0288 025D 02D4
        DECLE   $00B9,  $01AB,  $0005,  $006B   ; 6C94   00B9 01AB 0005 006B
        DECLE   $0280,  $00B4,  $01AB,  $0035   ; 6C98   0280 00B4 01AB 0035
        DECLE   $006B,  $0280,  $0078,  $0288   ; 6C9C   006B 0280 0078 0288
        DECLE   $012E,  $0284,  $01E0,  $03EB   ; 6CA0   012E 0284 01E0 03EB
        DECLE   $0035,  $006B,  $0280,  $0065   ; 6CA4   0035 006B 0280 0065
        DECLE   $0288,  $00AA,  $02C4,  $023B   ; 6CA8   0288 00AA 02C4 023B
        DECLE   $01AB,  $0015,  $006B,  $02C4   ; 6CAC   01AB 0015 006B 02C4
        DECLE   $01E0,  $01AB,  $0005,  $0025   ; 6CB0   01E0 01AB 0005 0025
        DECLE   $006B,  $0285,  $02A5,  $01AB   ; 6CB4   006B 0285 02A5 01AB
        DECLE   $0015,  $006B,  $02C4,  $0194   ; 6CB8   0015 006B 02C4 0194
        DECLE   $01AB,  $0035,  $006B,  $0280   ; 6CBC   01AB 0035 006B 0280
        DECLE   $006B,  $02A5,  $02C4,  $0153   ; 6CC0   006B 02A5 02C4 0153
        DECLE   $01AB,  $0015,  $006B,  $02C4   ; 6CC4   01AB 0015 006B 02C4
        DECLE   $0194,  $01AB,  $0035,  $006B   ; 6CC8   0194 01AB 0035 006B
        DECLE   $0280,  $0078,  $02A5,  $02C4   ; 6CCC   0280 0078 02A5 02C4
        DECLE   $01E0,  $01AB,  $0015,  $006B   ; 6CD0   01E0 01AB 0015 006B
        DECLE   $02C4,  $023B,  $01AB,  $0035   ; 6CD4   02C4 023B 01AB 0035
        DECLE   $006B,  $0280,  $00A0,  $0288   ; 6CD8   006B 0280 00A0 0288
        DECLE   $021B,  $02D4,  $0035,  $01AB   ; 6CDC   021B 02D4 0035 01AB
        DECLE   $0005,  $006B,  $0280,  $00CA   ; 6CE0   0005 006B 0280 00CA
        DECLE   $01AB,  $0035,  $006B,  $0280   ; 6CE4   01AB 0035 006B 0280
        DECLE   $00B4,  $0288,  $0140,  $0284   ; 6CE8   00B4 0288 0140 0284
        DECLE   $021B,  $01AB,  $0005,  $006B   ; 6CEC   021B 01AB 0005 006B
        DECLE   $0280,  $0097,  $01AB,  $0025   ; 6CF0   0280 0097 01AB 0025
        DECLE   $0015,  $006B,  $02C4,  $03C0   ; 6CF4   0015 006B 02C4 03C0
        DECLE   $01AB,  $0005,  $006B,  $0288   ; 6CF8   01AB 0005 006B 0288
        DECLE   $00F0,  $01AB,  $0035,  $006B   ; 6CFC   00F0 01AB 0035 006B
        DECLE   $0280,  $00A0,  $0288,  $017D   ; 6D00   0280 00A0 0288 017D
        DECLE   $0284,  $021B,  $03EB,  $0035   ; 6D04   0284 021B 03EB 0035
        DECLE   $006B,  $0285,  $0288,  $0194   ; 6D08   006B 0285 0288 0194
        DECLE   $0284,  $02CF,  $01AB,  $0005   ; 6D0C   0284 02CF 01AB 0005
        DECLE   $006B,  $0280,  $00CA,  $01AB   ; 6D10   006B 0280 00CA 01AB
        DECLE   $0035,  $006B,  $0280,  $00B4   ; 6D14   0035 006B 0280 00B4
        DECLE   $02A5,  $0295,  $01AB,  $0005   ; 6D18   02A5 0295 01AB 0005
        DECLE   $006B,  $0280,  $00A0,  $01AB   ; 6D1C   006B 0280 00A0 01AB
        DECLE   $0025,  $0015,  $006B,  $0288   ; 6D20   0025 0015 006B 0288
        DECLE   $01AC,  $0284,  $021B,  $01AB   ; 6D24   01AC 0284 021B 01AB
        DECLE   $0005,  $006B,  $0280,  $00D7   ; 6D28   0005 006B 0280 00D7
        DECLE   $01AB,  $0035,  $006B,  $0280   ; 6D2C   01AB 0035 006B 0280
        DECLE   $00B4,  $02A5,  $0295,  $01AB   ; 6D30   00B4 02A5 0295 01AB
        DECLE   $0005,  $006B,  $0280,  $00CA   ; 6D34   0005 006B 0280 00CA
        DECLE   $01AB,  $0025,  $0015,  $006B   ; 6D38   01AB 0025 0015 006B
        DECLE   $0288,  $0194,  $0284,  $0327   ; 6D3C   0288 0194 0284 0327
        DECLE   $01AB,  $0005,  $006B,  $0285   ; 6D40   01AB 0005 006B 0285
        DECLE   $01AB,  $0035,  $006B,  $0280   ; 6D44   01AB 0035 006B 0280
        DECLE   $00A0,  $0288,  $021B,  $02D4   ; 6D48   00A0 0288 021B 02D4
        DECLE   $0035,  $01AB,  $0005,  $006B   ; 6D4C   0035 01AB 0005 006B
        DECLE   $0280,  $0087,  $01AB,  $0035   ; 6D50   0280 0087 01AB 0035

        SAR     R3,     1                       ; 6D54   006B
        MVI     G_0065, R0                      ; 6D55   0280 0065
        MVI@    R1,     R0                      ; 6D57   0288
        SUB@    R4,     R7                      ; 6D58   0327

        DECLE   $02D4,  $024E,  $03EB,  $0035   ; 6D59   02D4 024E 03EB 0035
        DECLE   $006B,  $0288,  $021B,  $02D4   ; 6D5D   006B 0288 021B 02D4
        DECLE   $0035,  $03EB,  $0035           ; 6D61   0035 03EB 0035

        RRC     R3,     2                       ; 6D64   0077
        SLR     R3,     2                       ; 6D65   0067
        SAR     R1,     2                       ; 6D66   006D
        SDBD                                    ; 6D67   0001
        MVII    #$6B00, R4                      ; 6D68   02BC 0000 006B
        PULR    R7                              ; 6D6B   02B7

        DECLE   $01CF                           ; 6D6C   01CF
L_6D6D:
        PSHR    R5                              ; 6D6D   0275

        JSR     R5,     X_PLAY_SFX1             ; 6D6E   0004 0118 03BB
        DECLE   $0389                           ; 6D71  SFX data
        DECLE   $005D                           ; 6D72  SFX data
        DECLE   $0035                           ; 6D73  SFX data
        DECLE   $03E3,  $03FA                   ; 6D74  SFX data
        DECLE   $0275                           ; 6D76  SFX data
        DECLE   $0004,  $0118                   ; 6D77  SFX data
        DECLE   $0395                           ; 6D79  SFX data
        DECLE   $013A                           ; 6D7A  SFX data
        DECLE   $018D                           ; 6D7B  SFX data
        DECLE   $018A                           ; 6D7C  SFX data
        DECLE   $01AD                           ; 6D7D  SFX data
        DECLE   $01AA                           ; 6D7E  SFX data
        DECLE   $01CA                           ; 6D7F  SFX data
        DECLE   $01FA                           ; 6D80  SFX data
        DECLE   $01CA                           ; 6D81  SFX data
        DECLE   $018D                           ; 6D82  SFX data
        DECLE   $013A                           ; 6D83  SFX data
        DECLE   $018D                           ; 6D84  SFX data
        DECLE   $018A                           ; 6D85  SFX data
        DECLE   $01AD                           ; 6D86  SFX data
        DECLE   $01AA                           ; 6D87  SFX data
        DECLE   $03F4,  $01C8                   ; 6D88  SFX data
        DECLE   $018D                           ; 6D8A  SFX data
        DECLE   $013A                           ; 6D8B  SFX data
        DECLE   $018D                           ; 6D8C  SFX data
        DECLE   $018A                           ; 6D8D  SFX data
        DECLE   $01AD                           ; 6D8E  SFX data
        DECLE   $01AA                           ; 6D8F  SFX data
        DECLE   $01CA                           ; 6D90  SFX data
        DECLE   $01FA                           ; 6D91  SFX data
        DECLE   $01CA                           ; 6D92  SFX data
        DECLE   $03F4,  $0188                   ; 6D93  SFX data
        DECLE   $03F4,  $0218                   ; 6D95  SFX data
        DECLE   $01AD                           ; 6D97  SFX data
        DECLE   $01DA                           ; 6D98  SFX data
        DECLE   $03F4,  $01C8                   ; 6D99  SFX data
        DECLE   $03F4,  $018E                   ; 6D9B  SFX data
        DECLE   $0000,  $02B7                   ; 6D9D  SFX data
        DECLE   $0275                           ; 6D9F  SFX data
        DECLE   $0003,  $02BC                   ; 6DA0  SFX data
        DECLE   $01A1,  $02B8                   ; 6DA2  SFX data
        DECLE   $000E                           ; 6DA4  SFX data
        DECLE   $0004,  $0114                   ; 6DA5  SFX data
        DECLE   $0338,  $02B8                   ; 6DA7  SFX data
        DECLE   $0004,  $0040                   ; 6DA9  SFX data
        DECLE   $0240,  $0081                   ; 6DAB  SFX data
        DECLE   $0004,  $016C                   ; 6DAD  SFX data
        DECLE   $0277,  $0080,  $020C           ; 6DAF  SFX data
        DECLE   $000C,  $0001                   ; 6DB2  SFX data
        DECLE   $02B8,  $00C1                   ; 6DB4  SFX data
        DECLE   $0000,  $0240                   ; 6DB6  SFX data
        DECLE   $0100,  $0001                   ; 6DB8  SFX data
        DECLE   $02B8,  $006D                   ; 6DBA  SFX data
        DECLE   $0000,  $0240                   ; 6DBC  SFX data
        DECLE   $0101,  $0002                   ; 6DBE  SFX data
        DECLE   $02B7                           ; 6DC0  SFX data
        DECLE   $0003,  $0004                   ; 6DC1  SFX data
        DECLE   $0110,  $0126                   ; 6DC3  SFX data
        DECLE   $02B9                           ; 6DC5  SFX data
        DECLE   $0041,  $0280                   ; 6DC6  SFX data
        DECLE   $01A1,  $0083                   ; 6DC8  SFX data
        DECLE   $03B8,  $0040                   ; 6DCA  SFX data
        DECLE   $0204,  $008F                   ; 6DCC  SFX data
        DECLE   $0063,  $03BB                   ; 6DCE  SFX data
        DECLE   $0006                           ; 6DD0  SFX data
        DECLE   $02BC,  $01A6                   ; 6DD1  SFX data
        DECLE   $00DC,  $02BD                   ; 6DD3  SFX data
        DECLE   $01A2                           ; 6DD5  SFX data
        DECLE   $0001,  $02AA                   ; 6DD6  SFX data
        DECLE   $0092                           ; 6DD8  SFX data
        DECLE   $020C,  $0022                   ; 6DD9  SFX data
        DECLE   $0001,  $02A5                   ; 6DDB  SFX data
        DECLE   $0001,  $02A8                   ; 6DDD  SFX data
        DECLE   $033C,  $0002                   ; 6DDF  SFX data
        DECLE   $0378,  $0100                   ; 6DE1  SFX data
        DECLE   $0201,  $0018                   ; 6DE3  SFX data
        DECLE   $0080,  $020C                   ; 6DE5  SFX data
        DECLE   $0005                           ; 6DE7  SFX data
        DECLE   $0004,  $016C                   ; 6DE8  SFX data
        DECLE   $021A                           ; 6DEA  SFX data
        DECLE   $0220,  $0025                   ; 6DEB  SFX data
        DECLE   $0004,  $016C                   ; 6DED  SFX data
        DECLE   $023B                           ; 6DEF  SFX data
        DECLE   $0201,  $006B                   ; 6DF0  SFX data
        DECLE   $0271,  $02B9                   ; 6DF2  SFX data
        DECLE   $0001,  $0004                   ; 6DF4  SFX data
        DECLE   $016C,  $027C                   ; 6DF6  SFX data
        DECLE   $02B1,  $0201                   ; 6DF8  SFX data
        DECLE   $0062                           ; 6DFA  SFX data
        DECLE   $0220,  $0035                   ; 6DFB  SFX data
        DECLE   $0274,  $02BC                   ; 6DFD  SFX data
        DECLE   $01A2                           ; 6DFF  SFX data
        DECLE   $0001,  $02A2                   ; 6E00  SFX data
        DECLE   $0001,  $02A5                   ; 6E02  SFX data
        DECLE   $02B4,  $0092                   ; 6E04  SFX data
        DECLE   $020C,  $0004                   ; 6E06  SFX data
        DECLE   $0271,  $01C9                   ; 6E08  SFX data
        DECLE   $0220,  $0016                   ; 6E0A  SFX data
        DECLE   $0280,  $0081                   ; 6E0C  SFX data
        DECLE   $0080,  $020B                   ; 6E0E  SFX data
        DECLE   $0043,  $0011                   ; 6E10  SFX data
        DECLE   $0204,  $0040                   ; 6E12  SFX data
        DECLE   $02A8,  $0240                   ; 6E14  SFX data
        DECLE   $0081,  $0012                   ; 6E16  SFX data
        DECLE   $0220,  $0014                   ; 6E18  SFX data
        DECLE   $0275                           ; 6E1A  SFX data
        DECLE   $01C0,  $0240                   ; 6E1B  SFX data
        DECLE   $01A2                           ; 6E1D  SFX data
        DECLE   $0240,  $01A3                   ; 6E1E  SFX data
        DECLE   $0280,  $01A1                   ; 6E20  SFX data
        DECLE   $0270,  $02F8                   ; 6E22  SFX data
        DECLE   $0004,  $03B8                   ; 6E24  SFX data
        DECLE   $000C,  $02B3                   ; 6E26  SFX data
        DECLE   $03BB                           ; 6E28  SFX data
        DECLE   $0063,  $00C3                   ; 6E29  SFX data
        DECLE   $0243,  $01A1                   ; 6E2B  SFX data
        DECLE   $0064,  $03BB                   ; 6E2D  SFX data
        DECLE   $0003,  $0143                   ; 6E2F  SFX data
        DECLE   $020C,  $008F                   ; 6E31  SFX data
        DECLE   $0280,  $01A1                   ; 6E33  SFX data
        DECLE   $03B8,  $00AF                   ; 6E35  SFX data
        DECLE   $0240,  $01A1                   ; 6E37  SFX data
        DECLE   $0007                           ; 6E39  SFX data
        DECLE   $02B7                           ; 6E3A  SFX data
        DECLE   $0271,  $0281                   ; 6E3B  SFX data
        DECLE   $01AE                           ; 6E3D  SFX data
        DECLE   $0089                           ; 6E3E  SFX data
        DECLE   $0204,  $0003                   ; 6E3F  SFX data
        DECLE   $0007                           ; 6E41  SFX data
        DECLE   $02B1,  $00AF                   ; 6E42  SFX data
        DECLE   $0281,  $0080                   ; 6E44  SFX data
        DECLE   $0089                           ; 6E46  SFX data
        DECLE   $0223,  $0007                   ; 6E47  SFX data
        DECLE   $0240,  $0080                   ; 6E49  SFX data
        DECLE   $0006                           ; 6E4B  SFX data
        DECLE   $0280,  $01A1                   ; 6E4C  SFX data
        DECLE   $03B8,  $00EF                   ; 6E4E  SFX data
        DECLE   $0240,  $01A1                   ; 6E50  SFX data
        DECLE   $02B1,  $00AF                   ; 6E52  SFX data
        DECLE   $02BC,  $01A2                   ; 6E54  SFX data
        DECLE   $0262                           ; 6E56  SFX data
        DECLE   $0042                           ; 6E57  SFX data
        DECLE   $0262                           ; 6E58  SFX data
        DECLE   $00A8,  $0260                   ; 6E59  SFX data
        DECLE   $0040,  $0260                   ; 6E5B  SFX data
        DECLE   $0280,  $0080                   ; 6E5D  SFX data
        DECLE   $0080,  $0203                   ; 6E5F  SFX data
        DECLE   $000B                           ; 6E61  SFX data
        DECLE   $0283,  $01AE                   ; 6E62  SFX data
        DECLE   $009B                           ; 6E64  SFX data
        DECLE   $0204,  $0006                   ; 6E65  SFX data
        DECLE   $01C0,  $0240                   ; 6E67  SFX data
        DECLE   $0080,  $0013                   ; 6E69  SFX data
        DECLE   $0243,  $01AE                   ; 6E6B  SFX data
        DECLE   $02B5                           ; 6E6D  SFX data
        DECLE   $02B4,  $02B3                   ; 6E6E  SFX data
        DECLE   $02B2                           ; 6E70  SFX data
        DECLE   $02B1,  $02B0                   ; 6E71  SFX data
        DECLE   $0038,  $02B0                   ; 6E73  SFX data
        DECLE   $0002                           ; 6E75  SFX data
        DECLE   $02B7                           ; 6E76  SFX data
        DECLE   $0280,  $0081                   ; 6E77  SFX data
        DECLE   $03B8,  $0200                   ; 6E79  SFX data
        DECLE   $00AF                           ; 6E7B  Unknown
        DECLE   $0275                           ; 6E7C  SFX data
        DECLE   $0001,  $02A5                   ; 6E7D  SFX data
        DECLE   $0001,  $02A8                   ; 6E7F  SFX data
        DECLE   $033C,  $0002                   ; 6E81  SFX data
        DECLE   $0080,  $0224                   ; 6E83  SFX data
        DECLE   $006A                           ; 6E85  SFX data
        DECLE   $0378,  $0100                   ; 6E86  SFX data
        DECLE   $0201,  $000A                   ; 6E88  SFX data
        DECLE   $0270,  $01C0                   ; 6E8A  SFX data
        DECLE   $0240,  $01A2                   ; 6E8C  SFX data
        DECLE   $0240,  $01A3                   ; 6E8E  SFX data
        DECLE   $02B0,  $0089                   ; 6E90  SFX data
        DECLE   $0204,  $002E                   ; 6E92  SFX data
        DECLE   $0270,  $00A8                   ; 6E94  SFX data
        DECLE   $0260,  $0040                   ; 6E96  SFX data
        DECLE   $0260,  $033C                   ; 6E98  SFX data
        DECLE   $0002                           ; 6E9A  SFX data
        DECLE   $033D                           ; 6E9B  SFX data
        DECLE   $0002                           ; 6E9C  SFX data
        DECLE   $02B0,  $0378                   ; 6E9D  SFX data
        DECLE   $0100,  $0209                   ; 6E9F  SFX data
        DECLE   $0020,  $0001                   ; 6EA1  SFX data
        DECLE   $02A8,  $0085                   ; 6EA3  SFX data
        DECLE   $02A8,  $0240                   ; 6EA5  SFX data
        DECLE   $01A2                           ; 6EA7  SFX data
        DECLE   $0040,  $0240                   ; 6EA8  SFX data
        DECLE   $01A3,  $00A8                   ; 6EAA  SFX data
        DECLE   $0240,  $01A4                   ; 6EAC  SFX data
        DECLE   $0040,  $0240                   ; 6EAE  SFX data
        DECLE   $01A5                           ; 6EB0  SFX data
        DECLE   $0280,  $01A1                   ; 6EB1  SFX data
        DECLE   $03B8,  $0010                   ; 6EB3  SFX data
        DECLE   $020C,  $000B                   ; 6EB5  SFX data
        DECLE   $0280,  $01AE                   ; 6EB7  SFX data
        DECLE   $0008,  $0240                   ; 6EB9  SFX data
        DECLE   $01AE                           ; 6EBB  SFX data
        DECLE   $0280,  $01A1                   ; 6EBC  SFX data
        DECLE   $02F8,  $0010                   ; 6EBE  SFX data
        DECLE   $0240,  $01A1                   ; 6EC0  SFX data
        DECLE   $0006                           ; 6EC2  SFX data
        DECLE   $02B7                           ; 6EC3  SFX data
        DECLE   $0002                           ; 6EC4  SFX data
        DECLE   $00F1,  $0000                   ; 6EC5  SFX data
        DECLE   $0003,  $0275                   ; 6EC7  SFX data
        DECLE   $0270,  $0271                   ; 6EC9  SFX data
        DECLE   $0281,  $01A1                   ; 6ECB  SFX data
        DECLE   $0272                           ; 6ECD  SFX data
        DECLE   $0273,  $0274                   ; 6ECE  SFX data
        DECLE   $0004,  $016C                   ; 6ED0  SFX data
        DECLE   $0277,  $0080,  $020C           ; 6ED2  SFX data
        DECLE   $002A                           ; 6ED5  SFX data
        DECLE   $008A                           ; 6ED6  SFX data
        DECLE   $03BA                           ; 6ED7  SFX data
        DECLE   $0080,  $0007                   ; 6ED8  SFX data
        DECLE   $020C,  $0025                   ; 6EDA  SFX data
        DECLE   $008A                           ; 6EDC  SFX data
        DECLE   $03BA                           ; 6EDD  SFX data
        DECLE   $0003,  $0001                   ; 6EDE  SFX data
        DECLE   $02BC,  $00A6                   ; 6EE0  SFX data
        DECLE   $0001,  $00D4                   ; 6EE2  SFX data
        DECLE   $00D4,  $0263                   ; 6EE4  SFX data
        DECLE   $0043,  $0263                   ; 6EE6  SFX data
        DECLE   $000A                           ; 6EE8  SFX data
        DECLE   $03BA                           ; 6EE9  SFX data
        DECLE   $0003,  $0088                   ; 6EEA  SFX data
        DECLE   $03B8,  $000C                   ; 6EEC  SFX data
        DECLE   $0064,  $0142                   ; 6EEE  SFX data
        DECLE   $020C,  $0004                   ; 6EF0  SFX data
        DECLE   $03B9                           ; 6EF2  SFX data
        DECLE   $007F                           ; 6EF3  Unknown
        DECLE   $03F9                           ; 6EF4  SFX data
        DECLE   $0080,  $03B9                   ; 6EF5  SFX data
        DECLE   $00BC,  $03F9                   ; 6EF7  SFX data
        DECLE   $0040,  $0094                   ; 6EF9  SFX data
        DECLE   $001C,  $01A1                   ; 6EFB  SFX data
        DECLE   $01D1,  $0241                   ; 6EFD  SFX data
        DECLE   $01A1,  $0006                   ; 6EFF  SFX data
        DECLE   $02B4,  $02B3                   ; 6F01  SFX data
        DECLE   $02B2                           ; 6F03  SFX data
        DECLE   $02B1,  $02B0                   ; 6F04  SFX data
        DECLE   $0002                           ; 6F06  SFX data
        DECLE   $02B7                           ; 6F07  SFX data
.GRAM_INIT_6F08:
        DECLE   $0029           ; 6F08  SFX data
        DECLE   $0003,  $0070   ; 6F09  SFX data
        DECLE   $0069           ; 6F0B  SFX data
        DECLE   $0030,  $006B                   ; 6F0C  SFX data
        DECLE   $0030,  $001F                   ; 6F0E  SFX data
        DECLE   $0070,  $0017                   ; 6F10  SFX data
        DECLE   $0070,  $002D                   ; 6F12  SFX data
        DECLE   $0050,  $0023                   ; 6F14  SFX data
        DECLE   $0070,  $0031                   ; 6F16  SFX data
        DECLE   $0050,  $0051                   ; 6F18  SFX data
        DECLE   $0030,  $0053                   ; 6F1A  SFX data
        DECLE   $0030,  $0033                   ; 6F1C  SFX data
        DECLE   $0050,  $000D                   ; 6F1E  SFX data
        DECLE   $0040,  $002F                   ; 6F20  SFX data
        DECLE   $0050,  $0009                   ; 6F22  SFX data
        DECLE   $0040,  $0361                   ; 6F24  SFX data
        DECLE   $0183,  $003F                   ; 6F26  SFX data
        DECLE   $0030,  $0001                   ; 6F28  SFX data
        DECLE   $0280,  $012B                   ; 6F2A  SFX data
        DECLE   $0040,  $0129                   ; 6F2C  SFX data
        DECLE   $0040,  $000D                   ; 6F2E  SFX data
        DECLE   $0200,  $0239                   ; 6F30  SFX data
        DECLE   $0040,  $0001                   ; 6F32  SFX data
        DECLE   $0390,  $0011                   ; 6F34  SFX data
        DECLE   $0090,  $0016                   ; 6F36  SFX data
        DECLE   $0000,  $0000                   ; 6F38  SFX data
        DECLE   $0000,  $0000                   ; 6F3A  SFX data
        DECLE   $0000,  $0000                   ; 6F3C  SFX data
        DECLE   $0000,  $0000                   ; 6F3E  SFX data
        DECLE   $0000,  $0000                   ; 6F40  SFX data
        DECLE   $0000,  $0000                   ; 6F42  SFX data
        DECLE   $0000,  $0000                   ; 6F44  SFX data
        DECLE   $0000,  $0000                   ; 6F46  SFX data
        DECLE   $0000,  $0000                   ; 6F48  SFX data
        DECLE   $0000,  $0000                   ; 6F4A  SFX data
        DECLE   $0000,  $0000                   ; 6F4C  SFX data
        DECLE   $0000,  $0000                   ; 6F4E  SFX data
        DECLE   $0000,  $0000                   ; 6F50  SFX data
        DECLE   $0000,  $0000                   ; 6F52  SFX data
        DECLE   $0000,  $0000                   ; 6F54  SFX data
        DECLE   $0000,  $0000                   ; 6F56  SFX data
        DECLE   $0000,  $0000                   ; 6F58  SFX data
        DECLE   $0000,  $0000                   ; 6F5A  SFX data
        DECLE   $0000,  $0000                   ; 6F5C  SFX data
        DECLE   $0000,  $0000                   ; 6F5E  SFX data
        DECLE   $0000,  $0000                   ; 6F60  SFX data
        DECLE   $0000,  $0000                   ; 6F62  SFX data
        DECLE   $0000,  $0000                   ; 6F64  SFX data
        DECLE   $0000,  $0000                   ; 6F66  SFX data
        DECLE   $0000,  $0000                   ; 6F68  SFX data
        DECLE   $0000,  $0000                   ; 6F6A  SFX data
        DECLE   $0000,  $0000                   ; 6F6C  SFX data
        DECLE   $0000,  $0000                   ; 6F6E  SFX data
        DECLE   $0000,  $0000                   ; 6F70  SFX data
        DECLE   $0000,  $0000                   ; 6F72  SFX data
        DECLE   $0000,  $0000                   ; 6F74  SFX data
        DECLE   $0000,  $0000                   ; 6F76  SFX data
        DECLE   $0000,  $0000                   ; 6F78  SFX data
        DECLE   $0000,  $0000                   ; 6F7A  SFX data
        DECLE   $0000,  $0000                   ; 6F7C  SFX data
        DECLE   $0000,  $0000                   ; 6F7E  SFX data
        DECLE   $0000,  $0000                   ; 6F80  SFX data
        DECLE   $0000,  $0000                   ; 6F82  SFX data
        DECLE   $0000,  $0000                   ; 6F84  SFX data
        DECLE   $0000,  $0000                   ; 6F86  SFX data
        DECLE   $0000,  $0000                   ; 6F88  SFX data
        DECLE   $0000,  $0000                   ; 6F8A  SFX data
        DECLE   $0000,  $0000                   ; 6F8C  SFX data
        DECLE   $0000,  $0000                   ; 6F8E  SFX data
        DECLE   $0000,  $0000                   ; 6F90  SFX data
        DECLE   $0000,  $0000                   ; 6F92  SFX data
        DECLE   $0000,  $0000                   ; 6F94  SFX data
        DECLE   $0000,  $0000                   ; 6F96  SFX data
        DECLE   $0000,  $0000                   ; 6F98  SFX data
        DECLE   $0000,  $0000                   ; 6F9A  SFX data
        DECLE   $0000,  $0000                   ; 6F9C  SFX data
        DECLE   $0000,  $0000                   ; 6F9E  SFX data
        DECLE   $0000,  $0000                   ; 6FA0  SFX data
        DECLE   $0000,  $0000                   ; 6FA2  SFX data
        DECLE   $0000,  $0000                   ; 6FA4  SFX data
        DECLE   $0000,  $0000                   ; 6FA6  SFX data
        DECLE   $0000,  $0000                   ; 6FA8  SFX data
        DECLE   $0000,  $0000                   ; 6FAA  SFX data
        DECLE   $0000,  $0000                   ; 6FAC  SFX data
        DECLE   $0000,  $0000                   ; 6FAE  SFX data
        DECLE   $0000,  $0000                   ; 6FB0  SFX data
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

        ORG     $D000
L_D000:
        PSHR    R5                              ; D000   0275

        JSR     R5,     X_PLAY_SFX1             ; D001   0004 0118 03BB
        DECLE   $0379                           ; D004  SFX data
        DECLE   $002D                           ; D005  SFX data
        DECLE   $00B7                           ; D006  SFX data
        DECLE   $000C,  $0258                   ; D007  SFX data
        DECLE   $034B                           ; D009  SFX data
        DECLE   $022B                           ; D00A  SFX data
        DECLE   $02CF                           ; D00B  SFX end

L_D00C:
        PSHR    R5                              ; D00C   0275

        JSR     R5,     X_PLAY_SFX1             ; D00D   0004 0118 03BB
        DECLE   $0389                           ; D010  SFX data
        DECLE   $004F,  $000C                   ; D011  SFX data
        DECLE   $0077,  $0025,  $00D0           ; D013  SFX data
        DECLE   $02C0,  $0064                   ; D016  SFX data
        DECLE   $02C8,  $0063                   ; D018  SFX data
        DECLE   $02C4,  $006F                   ; D01A  SFX data
        DECLE   $006B                           ; D01C  SFX data
        DECLE   $0275                           ; D01D  SFX data
        DECLE   $0043,  $03D8                   ; D01E  SFX data
        DECLE   $0035                           ; D020  SFX data
        DECLE   $008F,  $0077                   ; D021  SFX data
        DECLE   $0003,  $03B0                   ; D023  SFX data
UC_D025:
        MVI     G_019A, R1                      ; D025  SLIB UCALL target
        INCR    R1                              ; D027   0009
        MVO     R1,     G_019A                  ; D028   0241 019A
        MVII    #$0004, R2                      ; D02A   02BA 0004

        JSR     R5,     X_DIV                   ; D02C   0004 011C 01FB

        TSTR    R1                              ; D02F   0089
        BEQ     L_D033                          ; D030   0204 0001
        PULR    R7                              ; D032   02B7

L_D033:
        MVII    #$0003, R0                      ; D033   02B8 0003

        JSR     R5,     X_CLR_BIT               ; D035   0004 0114 02E6
        DECLE   $01DF                           ; D038   01DF

        PULR    R7                              ; D039   02B7

L_D03A:
        PSHR    R5                              ; D03A   0275

        JSR     R5,     X_PLAY_SFX1             ; D03B   0004 0118 03BB
        DECLE   $03E9                           ; D03E  SFX data
        DECLE   $0300,  $01F4                   ; D03F  SFX data
        DECLE   $01DB                           ; D041  SFX data
        DECLE   $0001,  $03FC                   ; D042  SFX data
        DECLE   $008F,  $0031                   ; D044  SFX data
        DECLE   $008F,  $03FE                   ; D046  SFX data
        DECLE   $02CF                           ; D048  SFX end

L_D049:
        PSHR    R5                              ; D049   0275

        JSR     R5,     X_PLAY_SFX1             ; D04A   0004 0118 03BB
        DECLE   $012F                           ; D04D  SFX data
        DECLE   $0189                           ; D04E  SFX data
        DECLE   $0344,  $0032                   ; D04F  SFX data
        DECLE   $0081,  $03D1                   ; D051  SFX data
        DECLE   $001C,  $01DC                   ; D053  SFX data
        DECLE   $00AD                           ; D055  SFX data
        DECLE   $0337                           ; D056  SFX data
        DECLE   $008F,  $0027                   ; D057  SFX data
        DECLE   $0300,  $006E                   ; D059  SFX data
        DECLE   $0308,  $0061                   ; D05B  SFX data
        DECLE   $0304,  $0051                   ; D05D  SFX data
        DECLE   $0051,  $03FC                   ; D05F  SFX data
        DECLE   $0141,  $03FE                   ; D061  SFX data
        DECLE   $0141,  $0005                   ; D063  SFX data
        DECLE   $008F,  $0031                   ; D065  SFX data
        DECLE   $002F                           ; D067  SFX data
        DECLE   $02CF                           ; D068  SFX end

L_D069:
        PSHR    R0                              ; D069   0270
        MVI     G_019B, R0                      ; D06A   0280 019B
        ADDI    #$0007, R0                      ; D06C   02F8 0007
        MVO@    R0,     R3                      ; D06E   0258
        INCR    R3                              ; D06F   000B
        CLRR    R0                              ; D070   01C0
        MVO@    R0,     R3                      ; D071   0258
        INCR    R3                              ; D072   000B
        PULR    R0                              ; D073   02B0
        MOVR    R5,     R7                      ; D074   00AF

        DECLE   $0003,  $0008,  $0009,  $000E   ; D075   0003 0008 0009 000E
        DECLE   $000F,  $0013,  $0004,  $03FF   ; D079   000F 0013 0004 03FF
L_D07D:
        PSHR    R5                              ; D07D   0275
        MVI     G_01A1, R0                      ; D07E   0280 01A1
        MOVR    R0,     R1                      ; D080   0081
        ANDI    #$0003, R1                      ; D081   03B9 0003
        SLR     R0,     2                       ; D083   0064
        XORR    R1,     R0                      ; D084   01C8
        BNEQ    L_D129                          ; D085   020C 00A2

        MVII    #$01DE, R4                      ; D087   02BC 01DE
        SDBD                                    ; D089   0001
        MVI@    R4,     R1                      ; D08A   02A1
        DECR    R0                              ; D08B   0010
        TSTR    R1                              ; D08C   0089
        BNEQ    L_D096                          ; D08D   020C 0007

        SDBD                                    ; D08F   0001
        MVI@    R4,     R1                      ; D090   02A1
        MVII    #$000F, R0                      ; D091   02B8 000F
        TSTR    R1                              ; D093   0089
        BEQ     L_D129                          ; D094   0204 0093

L_D096:
        PSHR    R1                              ; D096   0271
L_D097:
        INCR    R0                              ; D097   0008
        SARC    R1,     1                       ; D098   0079
        BNC     L_D097                          ; D099   0229 0003

        MOVR    R0,     R1                      ; D09B   0081
        ANDI    #$000F, R0                      ; D09C   03B8 000F

        JSR     R5,     X_POW2                  ; D09E   0004 0114 0345

        COMR    R0                              ; D0A1   0018
        AND@    R6,     R0                      ; D0A2   03B0
        SUBI    #$0002, R4                      ; D0A3   033C 0002
        MVO@    R0,     R4                      ; D0A5   0260
        SWAP    R0,     1                       ; D0A6   0040
        MVO@    R0,     R4                      ; D0A7   0260
        SDBD                                    ; D0A8   0001
        MVII    #$D075, R4                      ; D0A9   02BC 0075 00D0
        MVII    #$01AF, R5                      ; D0AC   02BD 01AF
L_D0AE:
        MVI@    R4,     R0                      ; D0AE   02A0
        MVI@    R5,     R2                      ; D0AF   02AA
        CMPR    R0,     R1                      ; D0B0   0141
        BEQ     L_D0B8                          ; D0B1   0204 0005

        CMPI    #$03FF, R0                      ; D0B3   0378 03FF
        BNEQ    L_D0AE                          ; D0B5   022C 0008
        INCR    R7                              ; D0B7   000F

L_D0B8:
        PSHR    R2                              ; D0B8   0272
L_D0B9:
        SDBD                                    ; D0B9   0001
        MVII    #$D1A9, R4                      ; D0BA   02BC 00A9 00D1
        ADDR    R4,     R1                      ; D0BD   00E1
        ADD@    R1,     R4                      ; D0BE   02CC
        MVI@    R4,     R0                      ; D0BF   02A0
        CMPI    #$03FF, R0                      ; D0C0   0378 03FF
        BEQ     L_D0CB                          ; D0C2   0204 0007

        JSR     R5,     X_RAND2                 ; D0C4   0004 0114 029E

        MOVR    R0,     R1                      ; D0C7   0081
        ADDR    R4,     R1                      ; D0C8   00E1
        MOVR    R1,     R4                      ; D0C9   008C
        ADD@    R1,     R4                      ; D0CA   02CC
L_D0CB:
        MVII    #$01B6, R3                      ; D0CB   02BB 01B6
L_D0CD:
        MVI@    R4,     R1                      ; D0CD   02A1
        CMPI    #$03FF, R1                      ; D0CE   0379 03FF
        BEQ     L_D115                          ; D0D0   0204 0043

        MVI@    R4,     R0                      ; D0D2   02A0
        MOVR    R0,     R2                      ; D0D3   0082
        INCR    R1                              ; D0D4   0009
        ADDR    R7,     R1                      ; D0D5   00F9
        ADD@    R1,     R7                      ; D0D6   02CF

        INCR    R0                              ; D0D7   0008
        INCR    R4                              ; D0D8   000C

        JSR     R4,     .EXEC.8A2               ; D0D9   0004 0018 00A2

        DECR    R4                              ; D0DC   0014
        B       L_D0E6                          ; D0DD   0200 0007

        JSR     R5,     X_RAND2                 ; D0DF   0004 0114 029E

        INCR    R7                              ; D0E2   000F

        PULR    R0                              ; D0E3   02B0
L_D0E4:
        ADDR    R4,     R2                      ; D0E4   00E2
        ADDR    R0,     R4                      ; D0E5   00C4

L_D0E6:
        JSR     R5,     L_D100                  ; D0E6   0004 01D0 0100

        TSTR    R0                              ; D0E9   0080
        BEQ     L_D0F6                          ; D0EA   0204 000A

L_D0EC:
        MOVR    R2,     R4                      ; D0EC   0094
        B       L_D0CD                          ; D0ED   0220 0021

        JSR     R5,     L_D069                  ; D0EF   0004 01D0 0069

        DECR    R4                              ; D0F2   0014
        B       L_D0CD                          ; D0F3   0220 0027

L_D0F5:
        INCR    R4                              ; D0F5   000C
L_D0F6:
        PSHR    R4                              ; D0F6   0274

        JSR     R5,     L_D100                  ; D0F7   0004 01D0 0100

        PULR    R4                              ; D0FA   02B4
        INCR    R0                              ; D0FB   0008
        BEQ     L_D0EC                          ; D0FC   0224 0011
        B       L_D0F5                          ; D0FE   0220 000A

L_D100:
        MVI@    R4,     R0                      ; D100   02A0
        MOVR    R0,     R4                      ; D101   0084
        PSHR    R5                              ; D102   0275
        SDBD                                    ; D103   0001
        ADDI    #$D0EA, R4                      ; D104   02FC 00EA 00D0
        SDBD                                    ; D107   0001
        MVI@    R4,     R1                      ; D108   02A1
        DECR    R0                              ; D109   0010
        BMI     L_D114                          ; D10A   020B 0008

        MOVR    R1,     R0                      ; D10C   0088
        BEQ     L_D114                          ; D10D   0204 0005

        MVO@    R1,     R3                      ; D10F   0259
        SWAP    R1,     1                       ; D110   0041
        INCR    R3                              ; D111   000B
        MVO@    R1,     R3                      ; D112   0259
        INCR    R3                              ; D113   000B
L_D114:
        PULR    R7                              ; D114   02B7

L_D115:
        SDBD                                    ; D115   0001
        DECLE   $02B8,  $00C4,  $006E,  $009C   ; D116   02B8 00C4 006E 009C
        DECLE   $0260,  $0040,  $0260,  $02B8   ; D11A   0260 0040 0260 02B8
        DECLE   $0002,  $0260,  $01C0,  $0260   ; D11E   0002 0260 01C0 0260
        DECLE   $0260,  $0260,  $02BB,  $01B6   ; D122   0260 0260 02BB 01B6
        DECLE   $0004,  $016C,  $02C7           ; D126   0004 016C 02C7
L_D129:
        PULR    R7                              ; D129   02B7

        SLLC    R3,     2                       ; D12A   005F
        ADDR    R3,     R0                      ; D12B   00D8
        MOVR    R7,     R0                      ; D12C   00B8
        ADDR    R2,     R7                      ; D12D   00D7

        MOVR    R1,     R4                      ; D12E   008C
        ADDR    R3,     R5                      ; D12F   00DD
        MOVR    R7,     R1                      ; D130   00B9
        ADDR    R3,     R7                      ; D131   00DF

        COMR    R5                              ; D132   001D
        ADDR    R4,     R0                      ; D133   00E0
        ADDR    R2,     R3                      ; D134   00D3
        ADDR    R4,     R1                      ; D135   00E1
        RRC     R2,     2                       ; D136   0076
        ADDR    R4,     R1                      ; D137   00E1
        ADDR    R7,     R1                      ; D138   00F9
        ADDR    R4,     R0                      ; D139   00E0
        INCR    R5                              ; D13A   000D
        ADDR    R4,     R5                      ; D13B   00E5
        MOVR    R2,     R4                      ; D13C   0094
        ADDR    R4,     R0                      ; D13D   00E0
        RRC     R0,     1                       ; D13E   0070
        ADDR    R3,     R2                      ; D13F   00DA
        ADDR    R3,     R4                      ; D140   00DC
        ADDR    R3,     R2                      ; D141   00DA
        SWAP    R2,     2                       ; D142   0046
        ADDR    R3,     R1                      ; D143   00D9
        ADDR    R6,     R0                      ; D144   00F0
        ADDR    R3,     R1                      ; D145   00D9
        COMR    R0                              ; D146   0018
        ADDR    R3,     R3                      ; D147   00DB
        NEGR    R4                              ; D148   0024
        ADDR    R3,     R4                      ; D149   00DC
        SLL     R0,     1                       ; D14A   0048
        ADDR    R3,     R3                      ; D14B   00DB
        MOVR    R0,     R4                      ; D14C   0084
        ADDR    R5,     R1                      ; D14D   00E9
        ADDR    R2,     R6                      ; D14E   00D6
        ADDR    R5,     R1                      ; D14F   00E9
        ADDR    R3,     R1                      ; D150   00D9
        ADDR    R3,     R3                      ; D151   00DB
        MOVR    R7,     R6                      ; D152   00BE
        ADDR    R3,     R4                      ; D153   00DC
        DECR    R2                              ; D154   0012
        ADDR    R3,     R5                      ; D155   00DD
        ADDR    R5,     R0                      ; D156   00E8
        ADDR    R4,     R3                      ; D157   00E3
        RLC     R2,     1                       ; D158   0052
        ADDR    R4,     R6                      ; D159   00E6
        MOVR    R5,     R3                      ; D15A   00AB
        ADDR    R2,     R4                      ; D15B   00D4
        DECR    R4                              ; D15C   0014
        ADDR    R5,     R1                      ; D15D   00E9
        MOVR    R7,     R6                      ; D15E   00BE
        ADDR    R3,     R6                      ; D15F   00DE
        ADDR    R6,     R2                      ; D160   00F2
        ADDR    R2,     R3                      ; D161   00D3
        INCR    R1                              ; D162   0009
        ADDR    R5,     R2                      ; D163   00EA
        SWAP    R1,     1                       ; D164   0041
        ADDR    R2,     R5                      ; D165   00D5
        ADDR    R7,     R2                      ; D166   00FA
        ADDR    R2,     R4                      ; D167   00D4
        INCR    R7                              ; D168   000F

        ADDR    R2,     R6                      ; D169   00D6
L_D16A:
        ADDR    R1,     R0                      ; D16A   00C8
        ADDR    R2,     R6                      ; D16B   00D6
        NEGR    R4                              ; D16C   0024
        ADDR    R2,     R7                      ; D16D   00D7

        MOVR    R3,     R0                      ; D16E   0098
        ADDR    R3,     R1                      ; D16F   00D9
        SLR     R2,     1                       ; D170   0062
        ADDR    R4,     R6                      ; D171   00E6
        ADDR    R5,     R3                      ; D172   00EB
        ADDR    R4,     R6                      ; D173   00E6
        MOVR    R6,     R0                      ; D174   00B0
        ADDR    R4,     R7                      ; D175   00E7

        INCR    R3                              ; D176   000B
        ADDR    R5,     R0                      ; D177   00E8
        ADDR    R4,     R4                      ; D178   00E4
        ADDR    R5,     R0                      ; D179   00E8
        ADDR    R2,     R1                      ; D17A   00D1
        ADDR    R3,     R0                      ; D17B   00D8
        SAR     R0,     1                       ; D17C   0068
        ADDR    R3,     R1                      ; D17D   00D9
        MOVR    R1,     R7                      ; D17E   008F

        ADDR    R3,     R3                      ; D17F   00DB
        ADCR    R3                              ; D180   002B
        ADDR    R4,     R2                      ; D181   00E2
        SARC    R3,     1                       ; D182   007B
        ADDR    R4,     R2                      ; D183   00E2
        ADDR    R0,     R7                      ; D184   00C7

        ADDR    R4,     R2                      ; D185   00E2
        COMR    R1                              ; D186   0019
        ADDR    R4,     R6                      ; D187   00E6
        ADDR    R1,     R7                      ; D188   00CF

        ADDR    R4,     R4                      ; D189   00E4
        RSWD    R1                              ; D18A   0039
        ADDR    R4,     R3                      ; D18B   00E3
        MOVR    R0,     R7                      ; D18C   0087

        ADDR    R4,     R3                      ; D18D   00E3
        MOVR    R0,     R2                      ; D18E   0082
        ADDR    R3,     R4                      ; D18F   00DC
        RRC     R2,     1                       ; D190   0072
        ADDR    R2,     R7                      ; D191   00D7

        DECLE   $0051,  $00E4,  $00B0,  $00D2   ; D192   0051 00E4 00B0 00D2
        DECLE   $0007,  $00D3,  $004E,  $00D3   ; D196   0007 00D3 004E 00D3
        DECLE   $0022,  $00D4,  $00C4,  $006E   ; D19A   0022 00D4 00C4 006E
        DECLE   $0058,  $00DE,  $0001,  $0000   ; D19E   0058 00DE 0001 0000
        DECLE   $0002,  $0000,  $0003,  $0000   ; D1A2   0002 0000 0003 0000
        DECLE   $0006,  $0000,  $0000,  $001B   ; D1A6   0006 0000 0000 001B
        DECLE   $0022,  $002B,  $002E,  $0040   ; D1AA   0022 002B 002E 0040
        DECLE   $0047,  $004E,  $0051,  $005A   ; D1AE   0047 004E 0051 005A
        DECLE   $006B,  $007C,  $007F,  $0086   ; D1B2   006B 007C 007F 0086
        DECLE   $0089,  $008E,  $00A2,  $00B8   ; D1B6   0089 008E 00A2 00B8
        DECLE   $00C3,  $00CA,  $00D1,  $00DA   ; D1BA   00C3 00CA 00D1 00DA
        DECLE   $00E6,  $00EE,  $00F2,  $00F7   ; D1BE   00E6 00EE 00F2 00F7
        DECLE   $00FA,  $00FD,  $03FF,  $0002   ; D1C2   00FA 00FD 03FF 0002
        DECLE   $00BC,  $0002,  $00B8,  $0002   ; D1C6   00BC 0002 00B8 0002
        DECLE   $0094,  $03FF,  $0002,  $0040   ; D1CA   0094 03FF 0002 0040
        DECLE   $0002,  $0040,  $0000,  $0002   ; D1CE   0002 0040 0000 0002
        DECLE   $0000,  $0040,  $03FF,  $0002   ; D1D2   0000 0040 03FF 0002
        DECLE   $0042,  $03FF,  $0000,  $0003   ; D1D6   0042 03FF 0000 0003
        DECLE   $0054,  $005A,  $005C,  $0002   ; D1DA   0054 005A 005C 0002
        DECLE   $0058,  $0001,  $0008,  $0044   ; D1DE   0058 0001 0008 0044
        DECLE   $0046,  $0048,  $0050,  $0052   ; D1E2   0046 0048 0050 0052
        DECLE   $004C,  $004E,  $004A,  $03FF   ; D1E6   004C 004E 004A 03FF
        DECLE   $0002,  $0068,  $0001,  $0002   ; D1EA   0002 0068 0001 0002
        DECLE   $006A,  $006C,  $03FF,  $0002   ; D1EE   006A 006C 03FF 0002
        DECLE   $006E,  $0002,  $0070,  $0002   ; D1F2   006E 0002 0070 0002
        DECLE   $0072,  $03FF,  $0002,  $0074   ; D1F6   0072 03FF 0002 0074
        DECLE   $03FF,  $0002,  $0066,  $0002   ; D1FA   03FF 0002 0066 0002
        DECLE   $0076,  $0002,  $0064,  $0002   ; D1FE   0076 0002 0064 0002
        DECLE   $0078,  $03FF,  $0002,  $0066   ; D202   0078 03FF 0002 0066
        DECLE   $0002,  $0056,  $0002,  $0058   ; D206   0002 0056 0002 0058
        DECLE   $0001,  $0008,  $0044,  $0046   ; D20A   0001 0008 0044 0046
        DECLE   $0048,  $0050,  $0052,  $004C   ; D20E   0048 0050 0052 004C
        DECLE   $004E,  $004A,  $03FF,  $0002   ; D212   004E 004A 03FF 0002
        DECLE   $0062,  $0002,  $0064,  $0002   ; D216   0062 0002 0064 0002
        DECLE   $0058,  $0001,  $0008,  $0044   ; D21A   0058 0001 0008 0044
        DECLE   $0046,  $0048,  $0050,  $0052   ; D21E   0046 0048 0050 0052
        DECLE   $004C,  $004E,  $004A,  $03FF   ; D222   004C 004E 004A 03FF
        DECLE   $0002,  $007A,  $03FF,  $0002   ; D226   0002 007A 03FF 0002
        DECLE   $007C,  $0002,  $0058,  $0002   ; D22A   007C 0002 0058 0002
        DECLE   $00A2,  $03FF,  $0002,  $007E   ; D22E   00A2 03FF 0002 007E
        DECLE   $03FF,  $0000,  $0002,  $0080   ; D232   03FF 0000 0002 0080
        DECLE   $0082,  $03FF,  $0000,  $0002   ; D236   0082 03FF 0000 0002
        DECLE   $0000,  $005C,  $0002,  $005E   ; D23A   0000 005C 0002 005E
        DECLE   $0002,  $0060,  $0002,  $0058   ; D23E   0002 0060 0002 0058
        DECLE   $0001,  $0007,  $00A2,  $00A6   ; D242   0001 0007 00A2 00A6
        DECLE   $00B0,  $00A8,  $009E,  $0098   ; D246   00B0 00A8 009E 0098
        DECLE   $00A0,  $03FF,  $0000,  $0002   ; D24A   00A0 03FF 0000 0002
        DECLE   $0000,  $00B4,  $0002,  $00B2   ; D24E   0000 00B4 0002 00B2
        DECLE   $0002,  $00BA,  $0002,  $00A4   ; D252   0002 00BA 0002 00A4
        DECLE   $0002,  $0058,  $0001,  $0007   ; D256   0002 0058 0001 0007
        DECLE   $00A2,  $00A6,  $00B0,  $00A8   ; D25A   00A2 00A6 00B0 00A8
        DECLE   $009E,  $0098,  $00A0,  $03FF   ; D25E   009E 0098 00A0 03FF
        DECLE   $0000,  $0003,  $0084,  $0000   ; D262   0000 0003 0084 0000
        DECLE   $0000,  $0000,  $0003,  $0092   ; D266   0000 0000 0003 0092
        DECLE   $0000,  $0000,  $03FF,  $0002   ; D26A   0000 0000 03FF 0002
        DECLE   $00AA,  $0002,  $006E,  $0002   ; D26E   00AA 0002 006E 0002
        DECLE   $009C,  $03FF,  $0002,  $009A   ; D272   009C 03FF 0002 009A
        DECLE   $0002,  $0058,  $0002,  $009E   ; D276   0002 0058 0002 009E
        DECLE   $03FF,  $0002,  $0090,  $0002   ; D27A   03FF 0002 0090 0002
        DECLE   $0058,  $0001,  $0002,  $00A0   ; D27E   0058 0001 0002 00A0
        DECLE   $00A8,  $03FF,  $0002,  $0096   ; D282   00A8 03FF 0002 0096
        DECLE   $0002,  $0058,  $0002,  $0098   ; D286   0002 0058 0002 0098
        DECLE   $0002,  $00B2,  $0003,  $0002   ; D28A   0002 00B2 0003 0002
        DECLE   $00AC,  $03FF,  $0002,  $00AE   ; D28E   00AC 03FF 0002 00AE
        DECLE   $0002,  $00B2,  $0003,  $0002   ; D292   0002 00B2 0003 0002
        DECLE   $00B0,  $03FF,  $0002,  $00B6   ; D296   00B0 03FF 0002 00B6
        DECLE   $0003,  $03FF,  $0002,  $0088   ; D29A   0003 03FF 0002 0088
        DECLE   $0002,  $0088,  $03FF,  $0002   ; D29E   0002 0088 03FF 0002
        DECLE   $0086,  $03FF,  $0002,  $008E   ; D2A2   0086 03FF 0002 008E
        DECLE   $03FF,  $0002,  $0078,  $0002   ; D2A6   03FF 0002 0078 0002
        DECLE   $0060,  $0002,  $0058,  $0002   ; D2AA   0060 0002 0058 0002
        DECLE   $0094,  $03FF,  $0056,  $0110   ; D2AE   0094 03FF 0056 0110
        DECLE   $0188,  $0000,  $0000,  $0000   ; D2B2   0188 0000 0000 0000
        DECLE   $0110,  $001A,  $00E0,  $01A7   ; D2B6   0110 001A 00E0 01A7
        DECLE   $0300,  $0348,  $0000           ; D2BA   0300 0348 0000

        ADDR    R5,     R2                      ; D2BD   00EA
        MVI@    R2,     R7                      ; D2BE   0297
        SUBR    R2,     R7                      ; D2BF   0117

        DECLE   $000C,  $0260,  $0303,  $03F0   ; D2C0   000C 0260 0303 03F0
        DECLE   $016C,  $00E0,  $03CF,  $0135   ; D2C4   016C 00E0 03CF 0135
        DECLE   $03FF,  $00AC,  $0021,  $0303   ; D2C8   03FF 00AC 0021 0303
        DECLE   $037A,  $0162,  $03CA,  $03B7   ; D2CC   037A 0162 03CA 03B7
        DECLE   $014A,  $000E,  $01E6,  $031B   ; D2D0   014A 000E 01E6 031B
        DECLE   $019E,  $0212,  $021E,  $0160   ; D2D4   019E 0212 021E 0160
        DECLE   $035D,  $01A5,  $0165,  $0104   ; D2D8   035D 01A5 0165 0104
        DECLE   $00FE,  $0048,  $010B,  $02CD   ; D2DC   00FE 0048 010B 02CD
        DECLE   $0123,  $0123,  $0351,  $03C0   ; D2E0   0123 0123 0351 03C0
        DECLE   $034E,  $0352,  $0366,  $02B9   ; D2E4   034E 0352 0366 02B9
        DECLE   $0312,  $01A9,  $0260,  $01A7   ; D2E8   0312 01A9 0260 01A7

        CMPR    R5,     R0                      ; D2EC   0168
        ADD@    R2,     R3                      ; D2ED   02D3
        MVO@    R6,     R5                      ; D2EE   026E
        CMP     G_00B3, R4                      ; D2EF   0344 00B3
        CMP@    R4,     R0                      ; D2F1   0360
        ADDR    R4,     R7                      ; D2F2   00E7

        DECLE   $0273,  $00BC,  $014E,  $0392   ; D2F3   0273 00BC 014E 0392
        DECLE   $020B,  $0221,  $0390,  $0045   ; D2F7   020B 0221 0390 0045
        DECLE   $0007,  $03A0,  $0170,  $00FC   ; D2FB   0007 03A0 0170 00FC
        DECLE   $023F,  $0014,  $0140,  $0009   ; D2FF   023F 0014 0140 0009
        DECLE   $03E2,  $00FB,  $001C,  $0000   ; D303   03E2 00FB 001C 0000
        DECLE   $0046,  $00FF                   ; D307   0046 00FF

        CMPR    R0,     R4                      ; D309   0144
        ADDR    R0,     R2                      ; D30A   00C2
        SUBR    R0,     R0                      ; D30B   0100
L_D30C:
        ADCR    R6                              ; D30C   002E
        DECLE   $0364,  $004B,  $0006,  $0038   ; D30D   0364 004B 0006 0038
        DECLE   $0129,  $00F7,  $0353,  $0138   ; D311   0129 00F7 0353 0138
        DECLE   $00C1,  $0162,  $0067,  $03FF   ; D315   00C1 0162 0067 03FF

        MVI@    R4,     R2                      ; D319   02A2
        ANDR    R6,     R4                      ; D31A   01B4
        B       L_D30C                          ; D31B   0220 0010

        DECLE   $0007,  $0282,  $0254,  $0000   ; D31D   0007 0282 0254 0000

        AND     G_0179, R2                      ; D321   0382 0179
        MVI@    R4,     R0                      ; D323   02A0
        AND@    R5,     R1                      ; D324   03A9
        MVI@    R4,     R7                      ; D325   02A7

        DECLE   $01C1,  $0279,  $0213           ; D326   01C1 0279 0213

        SUB     G_0331, R5                      ; D329   0305 0331
        XORR    R2,     R4                      ; D32B   01D4
        CMP@    R3,     R0                      ; D32C   0358
        MVO@    R0,     R2                      ; D32D   0250
        CMP@    R3,     R4                      ; D32E   035C
        SUB@    R3,     R0                      ; D32F   0318
        ADDI    #$0190, R3                      ; D330   02FB 0190
        XOR@    R5,     R2                      ; D332   03EA
        ANDR    R5,     R5                      ; D333   01AD
        SUBR    R4,     R0                      ; D334   0120
        ANDR    R5,     R4                      ; D335   01AC
        AND     G_01C1, R4                      ; D336   0384 01C1
        ADDR    R1,     R0                      ; D338   00C8
        SUB@    R5,     R7                      ; D339   032F

        DECLE   $01B7,  $010C,  $0304,  $00D6   ; D33A   01B7 010C 0304 00D6
        DECLE   $0209,  $0267,  $0216,  $00E4   ; D33E   0209 0267 0216 00E4
        DECLE   $0298,  $0082,  $026F,  $02F4   ; D342   0298 0082 026F 02F4
        DECLE   $0111,  $03BE,  $0032,  $0100   ; D346   0111 03BE 0032 0100
        DECLE   $0136,  $00A9,  $01C2,  $0000   ; D34A   0136 00A9 01C2 0000
        DECLE   $00A3,  $011D,  $023C,  $0221   ; D34E   00A3 011D 023C 0221
        DECLE   $0034,  $0300,  $0045,  $0209   ; D352   0034 0300 0045 0209
        DECLE   $022D,  $02B5,  $00E1,  $0124   ; D356   022D 02B5 00E1 0124
        DECLE   $02C1,  $0168,  $01BA,  $01FB   ; D35A   02C1 0168 01BA 01FB
        DECLE   $0251,  $0275,  $0034,  $0389   ; D35E   0251 0275 0034 0389
        DECLE   $005C,  $0014,  $02CD,  $036F   ; D362   005C 0014 02CD 036F
        DECLE   $03F7                           ; D366   03F7

        ADCR    R2                              ; D367   002A
        MVI@    R2,     R5                      ; D368   0295
        CMP@    R5,     R1                      ; D369   0369
        AND@    R3,     R6                      ; D36A   039E
        ADDR    R0,     R2                      ; D36B   00C2
        ANDR    R2,     R1                      ; D36C   0191
        AND     G_0073, R6                      ; D36D   0386 0073
        XORR    R3,     R4                      ; D36F   01DC
        MVI@    R3,     R1                      ; D370   0299
        SUB@    R6,     R4                      ; D371   0334
        XOR@    R1,     R3                      ; D372   03CB
        SLLC    R0,     1                       ; D373   0058
        SUBR    R4,     R6                      ; D374   0126
        AND@    R1,     R5                      ; D375   038D
        ANDR    R6,     R2                      ; D376   01B2
        CMPR    R2,     R3                      ; D377   0153
        SUBR    R0,     R4                      ; D378   0104
        MVI@    R3,     R5                      ; D379   029D
        CMP@    R6,     R1                      ; D37A   0371
        MVI@    R3,     R7                      ; D37B   029F

        DECLE   $0361,  $01A8,  $023E,  $0005   ; D37C   0361 01A8 023E 0005
        DECLE   $033F,  $02A1,  $0334,  $000B   ; D380   033F 02A1 0334 000B
        DECLE   $0029,  $0116,  $030B,  $01F1   ; D384   0029 0116 030B 01F1
        DECLE   $021F                           ; D388   021F

        SUBR    R7,     R0                      ; D389   0138
        MVI@    R2,     R5                      ; D38A   0295
        CMP@    R6,     R1                      ; D38B   0371
L_D38C:
        MOVR    R4,     R5                      ; D38C   00A5
        DECLE   $02C0,  $0170,  $021E,  $0201   ; D38D   02C0 0170 021E 0201
        DECLE   $0331,  $02A1,  $0034,  $011B   ; D391   0331 02A1 0034 011B
        DECLE   $0039,  $0111,  $03C9,  $036F   ; D395   0039 0111 03C9 036F
        DECLE   $0227,  $023B,  $0294,  $0129   ; D399   0227 023B 0294 0129
        DECLE   $032A,  $0381,  $00C8,  $01DE   ; D39D   032A 0381 00C8 01DE
        DECLE   $03F1,  $0270,  $0295,  $0134   ; D3A1   03F1 0270 0295 0134
        DECLE   $0207,  $003D,  $0325,  $0010   ; D3A5   0207 003D 0325 0010
        DECLE   $017E,  $016B,  $0039,  $0294   ; D3A9   017E 016B 0039 0294
        DECLE   $0129,  $03AE,  $00C1,  $00C9   ; D3AD   0129 03AE 00C1 00C9
        DECLE   $01BE,  $0103,  $02F1,  $028D   ; D3B1   01BE 0103 02F1 028D
        DECLE   $0034,  $002B,  $0039,  $0226   ; D3B5   0034 002B 0039 0226
        DECLE   $0088                           ; D3B9   0088

        MVII    #$0383, R4                      ; D3BA   02BC 0383
        MOVR    R7,     R0                      ; D3BC   00B8
        MVI@    R2,     R5                      ; D3BD   0295
        AND@    R5,     R1                      ; D3BE   03A9
        SUB@    R3,     R3                      ; D3BF   031B
        ADDR    R0,     R1                      ; D3C0   00C1
        CMPR    R4,     R1                      ; D3C1   0161
        XOR     G_0179, R4                      ; D3C2   03C4 0179
        CMP@    R1,     R4                      ; D3C4   034C
        MVII    #$0134, R1                      ; D3C5   02B9 0134
        SUB@    R1,     R5                      ; D3C7   030D
        RSWD    R0                              ; D3C8   0038
        SUB@    R4,     R5                      ; D3C9   0325
        CMP@    R1,     R2                      ; D3CA   034A
        XORR    R6,     R3                      ; D3CB   01F3
        CMP@    R5,     R3                      ; D3CC   036B
        MVI     .BTAB.9D,R3                     ; D3CD   0283 029D
        ANDR    R6,     R1                      ; D3CF   01B1
L_D3D0:
        SUB@    R2,     R7                      ; D3D0   0317

        DECLE   $00A1,  $01E9,  $029A,  $020D   ; D3D1   00A1 01E9 029A 020D
        DECLE   $030E,  $02D9,  $0094,  $007C   ; D3D5   030E 02D9 0094 007C
        DECLE   $0000,  $0000                   ; D3D9   0000 0000

        XOR@    R3,     R0                      ; D3DB   03D8
        RRC     R2,     2                       ; D3DC   0076
        SUB@    R6,     R4                      ; D3DD   0334
        ADD@    R5,     R5                      ; D3DE   02ED
        RSWD    R0                              ; D3DF   0038
        ADCR    R5                              ; D3E0   002D
        ADDR    R1,     R7                      ; D3E1   00CF

        DECLE   $017A,  $03A3,  $0332,  $0296   ; D3E2   017A 03A3 0332 0296
        DECLE   $0379,  $0398,  $01C0,  $0151   ; D3E6   0379 0398 01C0 0151
        DECLE   $027A                           ; D3EA   027A

        SUB@    R1,     R3                      ; D3EB   030B
        BGT     L_D6B7                          ; D3EC   020E 02C9

        COMR    R1                              ; D3EE   0019
        XORI    #$021F, R6                      ; D3EF   03FE 021F
        DIS                                     ; D3F1   0003
        ADCR    R7                              ; D3F2   002F

        SUBR    R2,     R0                      ; D3F3   0110
L_D3F4:
        AND@    R1,     R0                      ; D3F4   0388
        DECLE   $0000                           ; D3F5   0000

        RLC     R0,     2                       ; D3F6   0054
        SUBR    R2,     R0                      ; D3F7   0110
        SUBR    R3,     R7                      ; D3F8   011F

        DECLE   $001E,  $02E0,  $01E6,  $02F0   ; D3F9   001E 02E0 01E6 02F0
        DECLE   $01AC,  $01E0,  $0043,  $0137   ; D3FD   01AC 01E0 0043 0137
        DECLE   $039D,  $008C,  $012A,  $0301   ; D401   039D 008C 012A 0301
        DECLE   $0378,  $014A,  $00CB,  $0241   ; D405   0378 014A 00CB 0241
        DECLE   $016C,  $0252,  $0019,  $031A   ; D409   016C 0252 0019 031A
        DECLE   $01F6,  $0044,  $021F           ; D40D   01F6 0044 021F

        ADD@    R4,     R1                      ; D410   02E1
        SLLC    R3,     1                       ; D411   005B
        MVI@    R5,     R5                      ; D412   02AD
        ADD@    R1,     R5                      ; D413   02CD
        ADDR    R3,     R7                      ; D414   00DF

        DECLE   $021A,  $0353,  $00C0,  $034E   ; D415   021A 0353 00C0 034E
        DECLE   $02D2,  $0352,  $000E,  $0240   ; D419   02D2 0352 000E 0240
        DECLE   $001F,  $03F7,  $003E,  $0007   ; D41D   001F 03F7 003E 0007
        DECLE   $0000,  $0088,  $00FF           ; D421   0000 0088 00FF

        XORR    R0,     R4                      ; D424   01C4
        CMP     .STIC.HDLY,R3                   ; D425   0343 0030
        ADD@    R1,     R1                      ; D427   02C9
        ADDR    R4,     R2                      ; D428   00E2
        SARC    R0,     1                       ; D429   0078
        ADDR    R1,     R7                      ; D42A   00CF

        DECLE   $0275,  $038C,  $0227,  $00FD   ; D42B   0275 038C 0227 00FD
        DECLE   $0286,  $0283,  $037C,  $03D7   ; D42F   0286 0283 037C 03D7
        DECLE   $0074,  $0080,  $027E,  $0371   ; D433   0074 0080 027E 0371
        DECLE   $0095,  $0282,  $00B1,  $0238   ; D437   0095 0282 00B1 0238
        DECLE   $0175,  $034A,  $02B4,  $018A   ; D43B   0175 034A 02B4 018A
        DECLE   $03D1,  $0000,  $0329,  $01AC   ; D43F   03D1 0000 0329 01AC
        DECLE   $01AD,  $01CC,  $0105,  $01F0   ; D443   01AD 01CC 0105 01F0
        DECLE   $002E,  $0386,  $0218,  $00D6   ; D447   002E 0386 0218 00D6
        DECLE   $00AE,  $00A3,  $0114,  $030D   ; D44B   00AE 00A3 0114 030D
        DECLE   $02C3,  $012B,  $026B,  $0197   ; D44F   02C3 012B 026B 0197
        DECLE   $0049,  $0268,  $030A,  $0365   ; D453   0049 0268 030A 0365
        DECLE   $0296,  $0334,  $02EB,  $00B0   ; D457   0296 0334 02EB 00B0
        DECLE   $0210,  $0345,  $0032,  $0353   ; D45B   0210 0345 0032 0353
        DECLE   $004A,  $0214,  $036F,  $038F   ; D45F   004A 0214 036F 038F
        DECLE   $03CF,  $034A,  $0083,  $01E0   ; D463   03CF 034A 0083 01E0
        DECLE   $0380,  $0201,  $0149,  $038B   ; D467   0380 0201 0149 038B
        DECLE   $034F,  $0071,  $0016,  $031A   ; D46B   034F 0071 0016 031A
        DECLE   $0244,  $003A,  $019B,  $0340   ; D46F   0244 003A 019B 0340
        DECLE   $02F7,  $01C0,  $0065,  $0109   ; D473   02F7 01C0 0065 0109
        DECLE   $0000                           ; D477   0000

        XOR@    R1,     R1                      ; D478   03C9
        SUBR    R7,     R1                      ; D479   0139
        CMPR    R1,     R5                      ; D47A   014D
        ANDR    R3,     R2                      ; D47B   019A
        SUBR    R4,     R5                      ; D47C   0125
        ADD@    R1,     R5                      ; D47D   02CD
        PULR    R0                              ; D47E   02B0
        ADDR    R7,     R3                      ; D47F   00FB
        XORR    R5,     R0                      ; D480   01E8
        ADD@    R4,     R6                      ; D481   02E6
        SUB@    R1,     R0                      ; D482   0308
        SUBR    R1,     R4                      ; D483   010C
        ANDR    R4,     R6                      ; D484   01A6
        SLLC    R0,     1                       ; D485   0058
        SUBR    R3,     R6                      ; D486   011E
        ADDR    R5,     R4                      ; D487   00EC
        CMPR    R2,     R3                      ; D488   0153
        ANDR    R0,     R4                      ; D489   0184
        CMPR    R0,     R1                      ; D48A   0141
        ADDR    R4,     R3                      ; D48B   00E3
        SUB@    R4,     R7                      ; D48C   0327

        XORR    R7,     R6                      ; D48D   01FE
        ADD     .STIC.MODE,R3                   ; D48E   02C3 0021
        XORR    R1,     R4                      ; D490   01CC
        MVO     R5,     .STIC.VDLY              ; D491   0245 0031
        PULR    R2                              ; D493   02B2
        SUB@    R5,     R7                      ; D494   032F

        CMP@    R3,     R3                      ; D495   035B
        MOVR    R0,     R7                      ; D496   0087

        DECLE   $0002,  $0080,  $0054,  $038A   ; D497   0002 0080 0054 038A
        DECLE   $0036,  $00B0,  $0224,  $0291   ; D49B   0036 00B0 0224 0291
        DECLE   $0000,  $01EE,  $021E,  $0371   ; D49F   0000 01EE 021E 0371
        DECLE   $003E,  $03F2,  $00FC,  $000B   ; D4A3   003E 03F2 00FC 000B
        DECLE   $0010,  $010C,  $0038,  $0000   ; D4A7   0010 010C 0038 0000
        DECLE   $004E,  $0110,  $034D,  $0149   ; D4AB   004E 0110 034D 0149
        DECLE   $0219,  $01CF                   ; D4AF   0219 01CF

        ADDR    R2,     R1                      ; D4B1   00D1
        ADD@    R3,     R4                      ; D4B2   02DC
        MVO@    R6,     R1                      ; D4B3   024E
        GSWD    R2                              ; D4B4   0032
        INCR    R6                              ; D4B5   000E
        CMP     G_0038, R0                      ; D4B6   0340 0038
        SUBR    R1,     R7                      ; D4B8   010F

        DECLE   $0366,  $0079,  $0312,  $01A7   ; D4B9   0366 0079 0312 01A7
        DECLE   $02E8,  $01A6,  $0169,  $00B9   ; D4BD   02E8 01A6 0169 00B9
        DECLE   $003F,  $001B,  $001E,  $017D   ; D4C1   003F 001B 001E 017D
        DECLE   $0319,  $016D,  $0005,  $0120   ; D4C5   0319 016D 0005 0120
        DECLE   $0140,  $02C3,  $0231,  $0343   ; D4C9   0140 02C3 0231 0343
        DECLE   $01E2,  $0233                   ; D4CD   01E2 0233

        XORR    R7,     R6                      ; D4CF   01FE
        MVI     G_0169, R0                      ; D4D0   0280 0169
        MOVR    R2,     R6                      ; D4D2   0096
        MOVR    R4,     R2                      ; D4D3   00A2
        RRC     R2,     1                       ; D4D4   0072
        SUB@    R5,     R4                      ; D4D5   032C
        CMPR    R2,     R7                      ; D4D6   0157
        CMPR    R1,     R2                      ; D4D7   014A
        ADDR    R0,     R2                      ; D4D8   00C2
        SUBR    R0,     R2                      ; D4D9   0102
        XOR@    R6,     R0                      ; D4DA   03F0
        SUBR    R5,     R1                      ; D4DB   0129
        CMPR    R1,     R7                      ; D4DC   014F
        XOR     G_030F, R2                      ; D4DD   03C2 030F
        SLL     R3,     2                       ; D4DF   004F
        AND@    R6,     R5                      ; D4E0   03B5
        ANDR    R2,     R1                      ; D4E1   0191
        SARC    R2,     2                       ; D4E2   007E
        CMPR    R7,     R6                      ; D4E3   017E
        MOVR    R0,     R1                      ; D4E4   0081
        XORR    R7,     R5                      ; D4E5   01FD
        CMPR    R5,     R7                      ; D4E6   016F
        ADCR    R2                              ; D4E7   002A
        AND     .BTAB.47,R0                     ; D4E8   0380 0247
        SUBI    #$0160, R7                      ; D4EA   033F 0160

        DECLE   $0042,  $0000                   ; D4EC   0042 0000

        CLRR    R0                              ; D4EE   01C0
        ADD     G_0331, R7                      ; D4EF   02C7 0331

        ANDR    R2,     R4                      ; D4F1   0194
        SUB@    R1,     R4                      ; D4F2   030C
        RLC     R1,     1                       ; D4F3   0051
        NEGR    R1                              ; D4F4   0021
        SUB@    R2,     R7                      ; D4F5   0317

        DECLE   $01A5,  $039D,  $01C3,  $0000   ; D4F6   01A5 039D 01C3 0000
        DECLE   $0046,  $0310,  $02CC,  $01BF   ; D4FA   0046 0310 02CC 01BF
        DECLE   $021D                           ; D4FE   021D

        CMPR    R1,     R7                      ; D4FF   014F
        CLRR    R0                              ; D500   01C0
        ADD@    R5,     R6                      ; D501   02EE
        ADD@    R3,     R0                      ; D502   02D8
        CMP@    R4,     R6                      ; D503   0366
        MVI@    R2,     R7                      ; D504   0297

        MVI@    R1,     R5                      ; D505   028D
        MOVR    R4,     R7                      ; D506   00A7

        DECLE   $00E0,  $0197,  $016B,  $0109   ; D507   00E0 0197 016B 0109
        DECLE   $01FD,  $0000,  $0202,  $0147   ; D50B   01FD 0000 0202 0147
        DECLE   $0109,  $0046,  $0004,  $01FE   ; D50F   0109 0046 0004 01FE
        DECLE   $0143,  $0373,  $0033,  $024B   ; D513   0143 0373 0033 024B
        DECLE   $00C1,  $0224                   ; D517   00C1 0224

        PULR    R3                              ; D519   02B3
        PULR    R5                              ; D51A   02B5
        ADDR    R7,     R1                      ; D51B   00F9
        SUBR    R3,     R2                      ; D51C   011A
        CMP@    R4,     R3                      ; D51D   0363
L_D51E:
        XOR@    R3,     R1                      ; D51E   03D9
        ADD@    R2,     R3                      ; D51F   02D3
        CMP@    R5,     R3                      ; D520   036B
        CMPI    #$00A7, R1                      ; D521   0379 00A7
        INCR    R7                              ; D523   000F

        ANDR    R0,     R0                      ; D524   0180
L_D525:
        ADDR    R4,     R4                      ; D525   00E4
        ADDI    #$0286, R6                      ; D526   02FE 0286
        SLR     R3,     1                       ; D528   0063
        ANDR    R1,     R6                      ; D529   018E
        MOVR    R4,     R7                      ; D52A   00A7

        DECLE   $03E0,  $019E,  $0168,  $0309   ; D52B   03E0 019E 0168 0309
        DECLE   $024F,  $03E9,  $0301,  $01BC   ; D52F   024F 03E9 0301 01BC
        DECLE   $0329,  $007E,  $0120,  $0000   ; D533   0329 007E 0120 0000
        DECLE   $0100,  $02D3,  $0034,  $02CD   ; D537   0100 02D3 0034 02CD
        DECLE   $0063,  $01AC,  $00C3,  $0034   ; D53B   0063 01AC 00C3 0034
        DECLE   $0007,  $0000,  $00CC,  $0111   ; D53F   0007 0000 00CC 0111
        DECLE   $01C8,  $0000,  $00C9,  $0281   ; D543   01C8 0000 00C9 0281
        DECLE   $0088,  $03E2,  $0111,  $0000   ; D547   0088 03E2 0111 0000

        SUBR    R5,     R2                      ; D54B   012A
        NEGR    R6                              ; D54C   0026
        MVO@    R7,     R1                      ; D54D   024F
        ADDR    R2,     R0                      ; D54E   00D0
L_D54F:
        DECR    R7                              ; D54F   0017

        DECLE   $0000                           ; D550   0000

        B       L_D7EC                          ; D551   0200 0299

        ADDI    #$024A, R6                      ; D553   02FE 024A
        SUB@    R1,     R4                      ; D555   030C
        ANDR    R4,     R0                      ; D556   01A0
        ADD@    R3,     R2                      ; D557   02DA
        AND@    R6,     R5                      ; D558   03B5
        ADD@    R1,     R5                      ; D559   02CD
        SUBR    R3,     R3                      ; D55A   011B
        BLE     L_D3D0                          ; D55B   0226 018C

        ADDR    R0,     R0                      ; D55D   00C0
        SUB@    R1,     R5                      ; D55E   030D
        MVO@    R4,     R3                      ; D55F   025C
        CMP@    R4,     R6                      ; D560   0366
        RRC     R1,     2                       ; D561   0075
        SUB     .BTAB.E5,R3                     ; D562   0303 02E5
        XOR@    R4,     R6                      ; D564   03E6
        RRC     R1,     2                       ; D565   0075
        XORR    R1,     R4                      ; D566   01CC
        AND@    R6,     R3                      ; D567   03B3
        BGE     L_D51E                          ; D568   022D 004B

        SLR     R2,     1                       ; D56A   0062
        SUBR    R6,     R4                      ; D56B   0134
        ADD     .BTAB.B7,R3                     ; D56C   02C3 02B7
        SUB     .PSG0.lft_hand,R4               ; D56E   0304 01FF
        EIS                                     ; D570   0002
        MOVR    R1,     R6                      ; D571   008E
        CMP@    R3,     R2                      ; D572   035A
        SUBR    R1,     R7                      ; D573   010F

        DECLE   $0006,  $0280,  $01C1,  $01DC   ; D574   0006 0280 01C1 01DC
        DECLE   $038D,  $00AE,  $0225,  $01CA   ; D578   038D 00AE 0225 01CA
        DECLE   $02E0,  $02FD,  $02D2,  $00F2   ; D57C   02E0 02FD 02D2 00F2
        DECLE   $03DF,  $0192,  $0278           ; D580   03DF 0192 0278

        INCR    R7                              ; D583   000F

        XORR    R6,     R3                      ; D584   01F3
L_D585:
        MOVR    R3,     R7                      ; D585   009F

        DECLE   $003F,  $021C                   ; D586   003F 021C

        SUBR    R0,     R6                      ; D588   0106
        MVII    #$0339, R6                      ; D589   02BE 0339
        ANDR    R2,     R0                      ; D58B   0190
        ADDR    R0,     R2                      ; D58C   00C2
        SARC    R2,     1                       ; D58D   007A
        SUB@    R3,     R2                      ; D58E   031A
        CMP@    R5,     R5                      ; D58F   036D
        CMP@    R5,     R1                      ; D590   0369
        ADD@    R3,     R0                      ; D591   02D8
        SLL     R1,     1                       ; D592   0049
        XOR@    R2,     R1                      ; D593   03D1
        RSWD    R0                              ; D594   0038
        AND@    R3,     R5                      ; D595   039D
        MOVR    R5,     R7                      ; D596   00AF

        DECLE   $00B5,  $0003,  $0008,  $0300   ; D597   00B5 0003 0008 0300
        DECLE   $0201,  $00C0,  $03FF,  $0278   ; D59B   0201 00C0 03FF 0278
        DECLE   $0100,  $03BE,  $01C0,  $024A   ; D59F   0100 03BE 01C0 024A
        DECLE   $01A4,  $0230,  $03C8,  $034D   ; D5A3   01A4 0230 03C8 034D
        DECLE   $0100,  $024C,  $0270,  $0100   ; D5A7   0100 024C 0270 0100
        DECLE   $0072,  $0000                   ; D5AB   0072 0000

        XOR@    R1,     R4                      ; D5AD   03CC
        SUB@    R6,     R6                      ; D5AE   0336
        MVO@    R6,     R1                      ; D5AF   024E
        SAR     R0,     1                       ; D5B0   0068
        CMP     .BTAB.82,R6                     ; D5B1   0346 0282
        ADD@    R6,     R7                      ; D5B3   02F7

        DECLE   $016A,  $004B,  $0002,  $01FC   ; D5B4   016A 004B 0002 01FC
        DECLE   $0320,  $001F                   ; D5B8   0320 001F

        AND@    R3,     R2                      ; D5BA   039A
        ANDR    R0,     R4                      ; D5BB   0184
        SWAP    R2,     2                       ; D5BC   0046
        ANDR    R3,     R2                      ; D5BD   019A
        SUB@    R3,     R7                      ; D5BE   031F

        SLLC    R2,     1                       ; D5BF   005A
        AND@    R6,     R1                      ; D5C0   03B1
        SUBR    R1,     R4                      ; D5C1   010C
        MOVR    R5,     R6                      ; D5C2   00AE
        SUBR    R3,     R3                      ; D5C3   011B
        ADD@    R1,     R7                      ; D5C4   02CF

        DECLE   $03DF,  $02AC,  $03D2,  $0086   ; D5C5   03DF 02AC 03D2 0086
        DECLE   $004F,  $0312,  $03A8,  $01F7   ; D5C9   004F 0312 03A8 01F7
        DECLE   $019E,  $0167,  $02D3,  $0227   ; D5CD   019E 0167 02D3 0227
        DECLE   $0106,  $0053,  $013C,  $00B3   ; D5D1   0106 0053 013C 00B3
        DECLE   $02F5,  $03D9,  $0094,  $02C1   ; D5D5   02F5 03D9 0094 02C1
        DECLE   $0069,  $0336,  $0171,  $015A   ; D5D9   0069 0336 0171 015A
        DECLE   $0082,  $0082,  $0201,  $0080   ; D5DD   0082 0082 0201 0080
        DECLE   $0370,  $02EC,  $028B,  $03E0   ; D5E1   0370 02EC 028B 03E0
        DECLE   $0014,  $038A,  $0130,  $01A5   ; D5E5   0014 038A 0130 01A5
        DECLE   $015C,  $0126,  $01A8,  $020E   ; D5E9   015C 0126 01A8 020E
        DECLE   $01B6,  $0258,  $03D6,  $0336   ; D5ED   01B6 0258 03D6 0336
        DECLE   $00BE,  $00B1,  $023D,  $0303   ; D5F1   00BE 00B1 023D 0303
        DECLE   $03B3,  $0352,  $031B,  $02EE   ; D5F5   03B3 0352 031B 02EE
        DECLE   $006E,  $039E,  $0181,  $0078   ; D5F9   006E 039E 0181 0078
        DECLE   $02B5,  $034D,  $01C6,  $003E   ; D5FD   02B5 034D 01C6 003E
        DECLE   $03D1,  $03B0,  $023B,  $02DA   ; D601   03D1 03B0 023B 02DA
        DECLE   $03E6,  $0102,  $029B,  $01E8   ; D605   03E6 0102 029B 01E8
        DECLE   $02F0,  $0125,  $006C,  $000E   ; D609   02F0 0125 006C 000E
        DECLE   $0000,  $0065,  $00B8,  $00F7   ; D60D   0000 0065 00B8 00F7
        DECLE   $0146,  $0032,  $0300,  $0128   ; D611   0146 0032 0300 0128
        DECLE   $03E7                           ; D615   03E7

        MVO@    R1,     R5                      ; D616   0269
        CMPR    R4,     R3                      ; D617   0163
        XORR    R0,     R6                      ; D618   01C6
        SUBR    R1,     R3                      ; D619   010B
        BUSC    L_D6BF                          ; D61A   0207 00A3

        ADD@    R5,     R2                      ; D61C   02EA
        XOR@    R6,     R6                      ; D61D   03F6
        ADD     .BTAB.A6,R0                     ; D61E   02C0 02A6
        ADDR    R1,     R6                      ; D620   00CE
        SUB@    R5,     R7                      ; D621   032F

        DECLE   $0126,  $0094,  $033D,  $020E   ; D622   0126 0094 033D 020E
        DECLE   $022A,  $02D9,  $00D1,  $01A6   ; D626   022A 02D9 00D1 01A6
        DECLE   $00BF                           ; D62A   00BF

        SUB@    R1,     R1                      ; D62B   0309
        XOR     .BTAB.61,R4                     ; D62C   03C4 0261
        ANDR    R7,     R0                      ; D62E   01B8
        SUBR    R5,     R6                      ; D62F   012E
        PSHR    R5                              ; D630   0275
        ADDR    R2,     R2                      ; D631   00D2
        SUBR    R5,     R5                      ; D632   012D
        MVO@    R5,     R2                      ; D633   0255
        SWAP    R0,     2                       ; D634   0044
        SUB@    R6,     R4                      ; D635   0334
        SUBR    R2,     R2                      ; D636   0112
        XORR    R1,     R5                      ; D637   01CD
        MOVR    R6,     R1                      ; D638   00B1
        CLRR    R2                              ; D639   01D2
        ADD     .BTAB.7F,R6                     ; D63A   02C6 027F
        MVI@    R1,     R2                      ; D63C   028A
        XORR    R4,     R3                      ; D63D   01E3
        MOVR    R1,     R2                      ; D63E   008A
        XORR    R2,     R0                      ; D63F   01D0
        SUB@    R5,     R7                      ; D640   032F

        DECLE   $0266,  $00CA,  $022E,  $00E3   ; D641   0266 00CA 022E 00E3
        DECLE   $0094,  $0046,  $02F4,  $020C   ; D645   0094 0046 02F4 020C
        DECLE   $02F1,  $01D2,  $02F2,  $0081   ; D649   02F1 01D2 02F2 0081
        DECLE   $0241,  $01E8,  $00FF           ; D64D   0241 01E8 00FF

        ANDR    R2,     R6                      ; D650   0196
        ADD     G_0061, R6                      ; D651   02C6 0061
        SUB@    R1,     R3                      ; D653   030B
        XORR    R0,     R4                      ; D654   01C4
        XOR@    R6,     R2                      ; D655   03F2
        XOR@    R5,     R5                      ; D656   03ED
        ADDI    #$0276, R7                      ; D657   02FF 0276

        DECLE   $024A,  $03B9,  $0003,  $0002   ; D659   024A 03B9 0003 0002
        DECLE   $003F,  $0318,  $024F,  $0230   ; D65D   003F 0318 024F 0230
        DECLE   $00FF,  $008E,  $01FF,  $01D0   ; D661   00FF 008E 01FF 01D0
        DECLE   $0244,  $019F,  $0021,  $0010   ; D665   0244 019F 0021 0010
        DECLE   $02E1,  $01E7,  $0250,  $03E0   ; D669   02E1 01E7 0250 03E0
        DECLE   $0000,  $0380,  $0221,  $007B   ; D66D   0000 0380 0221 007B
        DECLE   $0248,  $001E,  $0020,  $0070   ; D671   0248 001E 0020 0070
        DECLE   $0300,  $0307,  $025F,  $0010   ; D675   0300 0307 025F 0010
        DECLE   $00C4,  $0380,  $004F,  $0380   ; D679   00C4 0380 004F 0380
        DECLE   $0257,  $0031,  $0000           ; D67D   0257 0031 0000

        ADDR    R7,     R6                      ; D680   00FE
        ADD@    R5,     R7                      ; D681   02EF

        MVI@    R1,     R0                      ; D682   0288
        ADDR    R2,     R7                      ; D683   00D7

        DECLE   $03A7                           ; D684   03A7

        CMPR    R6,     R2                      ; D685   0172
        MOVR    R2,     R4                      ; D686   0094
        SUBR    R7,     R4                      ; D687   013C
        XORI    #$016E, R0                      ; D688   03F8 016E
        ADD     G_0151, R3                      ; D68A   02C3 0151
        DECR    R2                              ; D68C   0012
        RRC     R0,     1                       ; D68D   0070
        B       L_D893                          ; D68E   0200 0203

        DECLE   $0207,  $0307,  $03F2,  $0390   ; D690   0207 0307 03F2 0390
        DECLE   $0202,  $025C,  $0381,  $026C   ; D694   0202 025C 0381 026C
        DECLE   $00A6,  $0263,  $0387,  $0264   ; D698   00A6 0263 0387 0264
        DECLE   $0179,  $03FD,  $0102,  $01E6   ; D69C   0179 03FD 0102 01E6
        DECLE   $0256,  $01FA,  $0000           ; D6A0   0256 01FA 0000

        AND@    R2,     R2                      ; D6A3   0392
        DECR    R1                              ; D6A4   0011
        SUBR    R5,     R0                      ; D6A5   0128
        ADDR    R2,     R3                      ; D6A6   00D3
        XOR@    R3,     R4                      ; D6A7   03DC
        ADDR    R6,     R2                      ; D6A8   00F2
        MOVR    R3,     R4                      ; D6A9   009C
        GSWD    R3                              ; D6AA   0033
        SUB     G_016D, R0                      ; D6AB   0300 016D
        ADD@    R5,     R5                      ; D6AD   02ED
        CMP@    R1,     R1                      ; D6AE   0349
        ADD@    R4,     R6                      ; D6AF   02E6
        SLLC    R0,     2                       ; D6B0   005C
        SUB     G_0364, R7                      ; D6B1   0307 0364

        DECLE   $01E1,  $0005                   ; D6B3   01E1 0005

        CMPR    R0,     R0                      ; D6B5   0140
        CMPR    R0,     R7                      ; D6B6   0147
L_D6B7:
        ADDR    R2,     R6                      ; D6B7   00D6
        DECLE   $02CE,  $0092,  $0034,  $0244   ; D6B8   02CE 0092 0034 0244
        DECLE   $03A7,  $00BF                   ; D6BC   03A7 00BF

        ADDR    R3,     R2                      ; D6BE   00DA
L_D6BF:
        CMP@    R1,     R5                      ; D6BF   034D
        DECLE   $02D2,  $039F,  $020F,  $0023   ; D6C0   02D2 039F 020F 0023
        DECLE   $0108,  $008B,  $001C,  $0000   ; D6C4   0108 008B 001C 0000
        DECLE   $005B,  $0110,  $0388,  $0000   ; D6C8   005B 0110 0388 0000
        DECLE   $035B,  $0303,  $0110,  $0006   ; D6CC   035B 0303 0110 0006
        DECLE   $0100,  $00BA,  $021C           ; D6D0   0100 00BA 021C

        CMP@    R1,     R5                      ; D6D3   034D
        SUBR    R1,     R2                      ; D6D4   010A
        SUB@    R4,     R5                      ; D6D5   0325
        ANDR    R1,     R6                      ; D6D6   018E
        ADDR    R2,     R0                      ; D6D7   00D0
        ADD@    R3,     R5                      ; D6D8   02DD
        MVO@    R2,     R2                      ; D6D9   0252
        MVI     G_0065, R6                      ; D6DA   0286 0065
        MVI     G_01E5, R7                      ; D6DC   0287 01E5

        DECLE   $00E6,  $0035,  $01C7           ; D6DE   00E6 0035 01C7

        ADD@    R6,     R3                      ; D6E1   02F3
        SUB@    R5,     R3                      ; D6E2   032B
        SUBR    R0,     R6                      ; D6E3   0106
        ADDR    R2,     R4                      ; D6E4   00D4
        MOVR    R5,     R4                      ; D6E5   00AC
        ADD@    R5,     R7                      ; D6E6   02EF

        DECLE   $0294,  $0179,  $0093,  $0262   ; D6E7   0294 0179 0093 0262
        DECLE   $0069,  $0258,  $0363,  $018A   ; D6EB   0069 0258 0363 018A
        DECLE   $0042,  $0000,  $0000,  $0180   ; D6EF   0042 0000 0000 0180
        DECLE   $014F,  $0056,  $0000,  $0001   ; D6F3   014F 0056 0000 0001
        DECLE   $0144,  $037F,  $03D8,  $034A   ; D6F7   0144 037F 03D8 034A
        DECLE   $0340,  $0338,  $029E,  $0304   ; D6FB   0340 0338 029E 0304
        DECLE   $01B0,  $016E,  $01A6,  $0151   ; D6FF   01B0 016E 01A6 0151
        DECLE   $001C,  $01A6,  $029E,  $025E   ; D703   001C 01A6 029E 025E
        DECLE   $0274,  $0123,  $0000           ; D707   0274 0123 0000

        MOVR    R4,     R0                      ; D70A   00A0
        ADDR    R2,     R4                      ; D70B   00D4
        PSHR    R6                              ; D70C   0276
        ADDR    R4,     R4                      ; D70D   00E4
        MOVR    R6,     R4                      ; D70E   00B4
        ADD@    R3,     R7                      ; D70F   02DF

        DECLE   $00AB,  $0060,  $026C,  $0277   ; D710   00AB 0060 026C 0277
        DECLE   $0042,  $0058,  $0207,  $03ED   ; D714   0042 0058 0207 03ED
        DECLE   $02B6,  $0236,  $031D,  $0091   ; D718   02B6 0236 031D 0091
        DECLE   $0245,  $0303,  $01B9,  $0353   ; D71C   0245 0303 01B9 0353
        DECLE   $0188,  $02FE,  $030F,  $0001   ; D720   0188 02FE 030F 0001
        DECLE   $004D,  $0110,  $00C8,  $0000   ; D724   004D 0110 00C8 0000
        DECLE   $0000,  $0000,  $0108,  $000C   ; D728   0000 0000 0108 000C
        DECLE   $0260,  $02E4,  $01C9,  $032C   ; D72C   0260 02E4 01C9 032C
        DECLE   $0300,  $03BF,  $02F1,  $0048   ; D730   0300 03BF 02F1 0048
        DECLE   $0000,  $0337,  $01FB,  $01A0   ; D734   0000 0337 01FB 01A0
        DECLE   $001C,  $00CB,  $0235,  $03ED   ; D738   001C 00CB 0235 03ED
        DECLE   $0065,  $0000,  $028C,  $01A5   ; D73C   0065 0000 028C 01A5
        DECLE   $0153,  $03DD,  $0251,  $0176   ; D740   0153 03DD 0251 0176
        DECLE   $02EC,  $013D,  $035A,  $0224   ; D744   02EC 013D 035A 0224
        DECLE   $02E5,  $039F,  $005E,  $0265   ; D748   02E5 039F 005E 0265
        DECLE   $0373,  $0213                   ; D74C   0373 0213

        MVI@    R2,     R4                      ; D74E   0294
        MVO@    R5,     R1                      ; D74F   024D
        XOR@    R3,     R2                      ; D750   03DA
        MVO@    R7,     R1                      ; D751   024F
        XOR@    R3,     R2                      ; D752   03DA
        CMPR    R1,     R1                      ; D753   0149
        RSWD    R3                              ; D754   003B
        ADDR    R5,     R0                      ; D755   00E8
        ADDR    R7,     R3                      ; D756   00FB
        SUBR    R5,     R1                      ; D757   0129
        CMPR    R5,     R5                      ; D758   016D
        MVI@    R4,     R5                      ; D759   02A5
        COMR    R6                              ; D75A   001E
        CMPR    R6,     R4                      ; D75B   0174
L_D75C:
        ADD@    R1,     R5                      ; D75C   02CD
        XORR    R2,     R0                      ; D75D   01D0
        RRC     R0,     2                       ; D75E   0074
        CMP     G_01BD, R3                      ; D75F   0343 01BD
        ADDR    R1,     R7                      ; D761   00CF

        DECLE   $02DA,  $0048,  $00F5,  $0118   ; D762   02DA 0048 00F5 0118
        DECLE   $01D9,  $028B,  $001F,  $0111   ; D766   01D9 028B 001F 0111
        DECLE   $01BC,  $0032,  $0000,  $0205   ; D76A   01BC 0032 0000 0205
        DECLE   $009F,  $03FE,  $0070,  $0000   ; D76E   009F 03FE 0070 0000
        DECLE   $0045,  $00F4,  $003F,  $0291   ; D772   0045 00F4 003F 0291
        DECLE   $0004,  $0200,  $0240,  $03C8   ; D776   0004 0200 0240 03C8
        DECLE   $029A,  $01CD,  $0006,  $0289   ; D77A   029A 01CD 0006 0289
        DECLE   $023D,  $021E,  $01B1,  $0065   ; D77E   023D 021E 01B1 0065
        DECLE   $0000,  $0012,  $0000,  $001F   ; D782   0000 0012 0000 001F
        DECLE   $034D,  $00F6,  $00FC,  $0305   ; D786   034D 00F6 00FC 0305
        DECLE   $00AE,  $03EC,  $0279           ; D78A   00AE 03EC 0279

        ANDR    R4,     R6                      ; D78D   01A6
        MVI     .BTAB.00,R1                     ; D78E   0281 0200
        MVI     G_0057, R2                      ; D790   0282 0057
        SUBR    R5,     R7                      ; D792   012F

        CMPR    R5,     R6                      ; D793   016E
        XORR    R6,     R3                      ; D794   01F3
        CMP@    R1,     R5                      ; D795   034D
        ADDI    #$0150, R2                      ; D796   02FA 0150
L_D798:
        SUB@    R5,     R3                      ; D798   032B
        DECLE   $0212                           ; D799   0212

        MVI     .BTAB.B9,R3                     ; D79A   0283 02B9
        SUBR    R5,     R7                      ; D79C   012F

        CMP     G_0369, R2                      ; D79D   0342 0369
        MVO@    R3,     R2                      ; D79F   0253
        SUB@    R6,     R7                      ; D7A0   0337

        DECLE   $034B,  $003C,  $005F,  $02A1   ; D7A1   034B 003C 005F 02A1
        DECLE   $0370,  $02FA,  $02F1,  $01A7   ; D7A5   0370 02FA 02F1 01A7
        DECLE   $0038,  $00B0,  $015F,  $03A8   ; D7A9   0038 00B0 015F 03A8
        DECLE   $0174,  $01C1,  $00CC,  $0355   ; D7AD   0174 01C1 00CC 0355
        DECLE   $03C7,  $00AF,  $01CE,  $02B3   ; D7B1   03C7 00AF 01CE 02B3
        DECLE   $00C0,  $01C2,  $0000,  $00A6   ; D7B5   00C0 01C2 0000 00A6
        DECLE   $0310,  $0109,  $0000,  $00E9   ; D7B9   0310 0109 0000 00E9
        DECLE   $0212,  $03B8,  $0047,  $0007   ; D7BD   0212 03B8 0047 0007
        DECLE   $0320,  $0038,  $013B,  $0353   ; D7C1   0320 0038 013B 0353
        DECLE   $0132,  $0189,  $0064,  $022C   ; D7C5   0132 0189 0064 022C
        DECLE   $02FB,  $0294,  $0334,  $03FB   ; D7C9   02FB 0294 0334 03FB
        DECLE   $0001,  $0379,  $0283,  $0384   ; D7CD   0001 0379 0283 0384
        DECLE   $001F,  $007E,  $01F8,  $0283   ; D7D1   001F 007E 01F8 0283
        DECLE   $0384,  $001F,  $000E,  $0387   ; D7D5   0384 001F 000E 0387

        MVI@    R4,     R1                      ; D7D9   02A1
        AND@    R5,     R1                      ; D7DA   03A9
        MVI@    R2,     R7                      ; D7DB   0297

        DECLE   $0025,  $0029,  $02D4,  $0363   ; D7DC   0025 0029 02D4 0363
        DECLE   $011A,  $03D4,  $03F2,  $038C   ; D7E0   011A 03D4 03F2 038C
        DECLE   $0165,  $0113,  $0111,  $02AE   ; D7E4   0165 0113 0111 02AE
        DECLE   $023C                           ; D7E8   023C

        XORR    R3,     R2                      ; D7E9   01DA
        ANDR    R4,     R6                      ; D7EA   01A6
        MOVR    R2,     R5                      ; D7EB   0095
L_D7EC:
        ANDR    R1,     R2                      ; D7EC   018A
        DECLE   $0285,  $01D7,  $016E,  $00EC   ; D7ED   0285 01D7 016E 00EC
        DECLE   $0009,  $0235,  $011C,  $02F6   ; D7F1   0009 0235 011C 02F6
        DECLE   $00C1,  $0353,  $0238           ; D7F5   00C1 0353 0238

        XORR    R0,     R4                      ; D7F8   01C4
        RLC     R3,     1                       ; D7F9   0053
        MOVR    R7,     R4                      ; D7FA   00BC
        ADD@    R1,     R3                      ; D7FB   02CB
        PULR    R6                              ; D7FC   02B6
        SUBR    R0,     R4                      ; D7FD   0104
        SUB@    R4,     R3                      ; D7FE   0323
        AND     .STIC.Y.6,R1                    ; D7FF   0381 000E
        MVO@    R0,     R4                      ; D801   0260
        SUB@    R6,     R4                      ; D802   0334
        DIS                                     ; D803   0003
L_D804:
        ADDR    R6,     R0                      ; D804   00F0
L_D805:
        DECR    R7                              ; D805   0017

        DECLE   $02A0,  $0004,  $0000,  $0012   ; D806   02A0 0004 0000 0012
        DECLE   $0008,  $0260,  $03D9,  $0118   ; D80A   0008 0260 03D9 0118
        DECLE   $03C3,  $0029,  $035C,  $017B   ; D80E   03C3 0029 035C 017B
        DECLE   $013A,  $0002,  $0000,  $0000   ; D812   013A 0002 0000 0000

        XOR     G_0120, R0                      ; D816   03C0 0120
        XOR@    R5,     R2                      ; D818   03EA
        SARC    R3,     2                       ; D819   007F
        B       L_DBDF                          ; D81A   0200 03C3

        DECLE   $0140,  $002A,  $0070,  $0000   ; D81C   0140 002A 0070 0000
        DECLE   $02BF,  $0231,  $0018,  $03C0   ; D820   02BF 0231 0018 03C0
        DECLE   $02C0,  $01F7,  $021A,  $017E   ; D824   02C0 01F7 021A 017E
        DECLE   $0014,  $0296,  $0180,  $03DC   ; D828   0014 0296 0180 03DC
        DECLE   $00A5,  $02CD,  $00C3,  $0009   ; D82C   00A5 02CD 00C3 0009
        DECLE   $014B,  $03B0,  $032D,  $0258   ; D830   014B 03B0 032D 0258
        DECLE   $0212,  $008F,  $0049,  $03E0   ; D834   0212 008F 0049 03E0
        DECLE   $0209,  $0212,  $0091,  $0000   ; D838   0209 0212 0091 0000
        DECLE   $03E8,  $0279,  $0012,  $0001   ; D83C   03E8 0279 0012 0001
        DECLE   $0001,  $01E0,  $0207,  $0012   ; D840   0001 01E0 0207 0012
        DECLE   $0085,  $0007,  $023C           ; D844   0085 0007 023C

        B       L_DB0F                          ; D847   0200 02C6
        MVI@    R5,     R7                      ; D849   02AF

        ANDR    R2,     R6                      ; D84A   0196
        ADDR    R4,     R6                      ; D84B   00E6
        MVO@    R0,     R3                      ; D84C   0258
        XORR    R0,     R6                      ; D84D   01C6
        XORR    R5,     R3                      ; D84E   01EB
        SUB@    R5,     R7                      ; D84F   032F

        DECLE   $0063,  $0223,  $0000,  $0254   ; D850   0063 0223 0000 0254
        DECLE   $0044,  $0300,  $028A,  $0047   ; D854   0044 0300 028A 0047
        DECLE   $0001                           ; D858   0001

        MOVR    R3,     R0                      ; D859   0098
        SAR     R1,     1                       ; D85A   0069
        RSWD    R6                              ; D85B   003E
        MOVR    R0,     R7                      ; D85C   0087

        DECLE   $0387,  $0000,  $0071,  $00FA   ; D85D   0387 0000 0071 00FA
        DECLE   $00C4,  $0032,  $0000,  $0205   ; D861   00C4 0032 0000 0205
        DECLE   $0267,  $006B,  $02FE,  $0171   ; D865   0267 006B 02FE 0171
        DECLE   $0078,  $01FE,  $01E9,  $02E5   ; D869   0078 01FE 01E9 02E5
        DECLE   $0094,  $0064,  $0208,  $035C   ; D86D   0094 0064 0208 035C
        DECLE   $039B,  $0394,  $00F2,  $0369   ; D871   039B 0394 00F2 0369
        DECLE   $02A3,  $03D4,  $0394,  $007B   ; D875   02A3 03D4 0394 007B
        DECLE   $0000,  $0140,  $0010,  $0334   ; D879   0000 0140 0010 0334
        DECLE   $02BB,  $0088,  $0036,  $037B   ; D87D   02BB 0088 0036 037B
        DECLE   $0275,  $015B,  $031A,  $015D   ; D881   0275 015B 031A 015D
        DECLE   $026E,  $028C,  $03BD,  $033A   ; D885   026E 028C 03BD 033A
        DECLE   $00A9,  $0025,  $0003,  $0090   ; D889   00A9 0025 0003 0090
        DECLE   $0070,  $000E,  $03E5,  $00E2   ; D88D   0070 000E 03E5 00E2
        DECLE   $0000                           ; D891   0000

        XOR@    R1,     R0                      ; D892   03C8
L_D893:
        INCR    R3                              ; D893   000B
        DECLE   $0025,  $0001,  $0000,  $0038   ; D894   0025 0001 0000 0038
        DECLE   $001C,  $03E5,  $0003,  $00A4   ; D898   001C 03E5 0003 00A4
        DECLE   $03FF,  $0019,  $018D,  $00E2   ; D89C   03FF 0019 018D 00E2
        DECLE   $032D,  $014C,  $03BE,  $016C   ; D8A0   032D 014C 03BE 016C
        DECLE   $0262,  $00C6,  $0279,  $0216   ; D8A4   0262 00C6 0279 0216
        DECLE   $00A7,  $015F,  $0076,  $0134   ; D8A8   00A7 015F 0076 0134
        DECLE   $0219,  $0201,  $0104,  $031E   ; D8AC   0219 0201 0104 031E
        DECLE   $0135,  $02E3,  $0346,  $0189   ; D8B0   0135 02E3 0346 0189
        DECLE   $02F4,  $01AF,  $029F,  $0295   ; D8B4   02F4 01AF 029F 0295
        DECLE   $02B4,  $0018,  $00D0,  $02A6   ; D8B8   02B4 0018 00D0 02A6
        DECLE   $0281,  $01A9,  $02A9,  $00E4   ; D8BC   0281 01A9 02A9 00E4
        DECLE   $0022,  $035C,  $0347,  $014A   ; D8C0   0022 035C 0347 014A
        DECLE   $02AA,  $0000                   ; D8C4   02AA 0000

        MVO     R0,     G_0187                  ; D8C6   0240 0187
        CMP@    R1,     R6                      ; D8C8   034E
        ANDR    R6,     R4                      ; D8C9   01B4
        CMPR    R3,     R3                      ; D8CA   015B
        RRC     R2,     1                       ; D8CB   0072
        GSWD    R1                              ; D8CC   0031
        XOR@    R1,     R5                      ; D8CD   03CD
        AND@    R6,     R0                      ; D8CE   03B0
L_D8CF:
        SUB@    R1,     R4                      ; D8CF   030C
        DECLE   $0001,  $0074,  $0110,  $01C8   ; D8D0   0001 0074 0110 01C8
        DECLE   $0000,  $0027,  $027C,  $01B7   ; D8D4   0000 0027 027C 01B7
        DECLE   $0001,  $0099,  $0084,  $0079   ; D8D8   0001 0099 0084 0079
        DECLE   $0000,  $038F,  $03EF,  $0135   ; D8DC   0000 038F 03EF 0135
        DECLE   $00A9,  $00F5,  $0221,  $0245   ; D8E0   00A9 00F5 0221 0245

        ADCR    R7                              ; D8E4   002F

        CMPR    R6,     R2                      ; D8E5   0172
L_D8E6:
        AND@    R3,     R2                      ; D8E6   039A
        DECLE   $01CB,  $022C,  $0323,  $03B7   ; D8E7   01CB 022C 0323 03B7
        DECLE   $0014,  $0210,  $018D,  $00DB   ; D8EB   0014 0210 018D 00DB
        DECLE   $0311,  $018F,  $02C1,  $036C   ; D8EF   0311 018F 02C1 036C
        DECLE   $01D6,  $01E6,  $006B,  $030B   ; D8F3   01D6 01E6 006B 030B
        DECLE   $01C7,  $0276,  $0005,  $0180   ; D8F7   01C7 0276 0005 0180
        DECLE   $03B3,  $0033,  $0382,  $00D3   ; D8FB   03B3 0033 0382 00D3
        DECLE   $01B0,  $00D3,  $0236,  $0004   ; D8FF   01B0 00D3 0236 0004
        DECLE   $0348,  $0071,  $03AF,  $027A   ; D903   0348 0071 03AF 027A
        DECLE   $0004,  $0000,  $0070,  $0380   ; D907   0004 0000 0070 0380
        DECLE   $0221,  $0084,  $0024,  $0000   ; D90B   0221 0084 0024 0000
        DECLE   $0388,  $0281,  $0284,  $00E3   ; D90F   0388 0281 0284 00E3
        DECLE   $0380,  $0287,  $0281,  $0204   ; D913   0380 0287 0281 0204
        DECLE   $0000,  $0000                   ; D917   0000 0000

        MVI@    R1,     R0                      ; D919   0288
        MVI@    R4,     R1                      ; D91A   02A1
L_D91B:
        MOVR    R0,     R4                      ; D91B   0084
        DECLE   $0024,  $0012,  $0380,  $02BF   ; D91C   0024 0012 0380 02BF
        DECLE   $0084,  $0000,  $0070,  $0389   ; D920   0084 0000 0070 0389
        DECLE   $0281,  $00E4,  $0124,  $0092   ; D924   0281 00E4 0124 0092
        DECLE   $0281,  $02BC,  $017C,  $0300   ; D928   0281 02BC 017C 0300
        DECLE   $000F,  $0180,  $029E,  $02FC   ; D92C   000F 0180 029E 02FC
        DECLE   $0003,  $0000,  $0389,  $02A1   ; D930   0003 0000 0389 02A1
        DECLE   $027C                           ; D934   027C

        SETC                                    ; D935   0007
        EIS                                     ; D936   0002
        SUB     .BTAB.A3,R7                     ; D937   0307 02A3

        DECLE   $01D4,  $001D,  $000E,  $0082   ; D939   01D4 001D 000E 0082
        DECLE   $027E,  $0131,  $019E,  $01A1   ; D93D   027E 0131 019E 01A1
        DECLE   $03E9,  $00DB,  $0309,  $0211   ; D941   03E9 00DB 0309 0211

        DIS                                     ; D945   0003
        NEGR    R1                              ; D946   0021
        SUB@    R2,     R0                      ; D947   0310
        AND@    R1,     R4                      ; D948   038C
        CMPR    R1,     R1                      ; D949   0149
        MVI@    R4,     R6                      ; D94A   02A6
        AND@    R6,     R5                      ; D94B   03B5
        CLRR    R0                              ; D94C   01C0
        EIS                                     ; D94D   0002
        B       L_DB24                          ; D94E   0200 01D4

        DECLE   $029B,  $03AA,  $0230           ; D950   029B 03AA 0230

        ANDI    #$0190, R2                      ; D953   03BA 0190
        RRC     R3,     1                       ; D955   0073
        CMP@    R1,     R0                      ; D956   0348
        XORI    #$02B1, R2                      ; D957   03FA 02B1
        SUB@    R1,     R6                      ; D959   030E
        SUBR    R5,     R0                      ; D95A   0128
        ADDR    R5,     R7                      ; D95B   00EF

        DECLE   $0356,  $0280,  $016B,  $011D   ; D95C   0356 0280 016B 011D
        DECLE   $00AE,  $0275,  $0352,  $01C2   ; D960   00AE 0275 0352 01C2
        DECLE   $026E,  $0041,  $000E,  $0000   ; D964   026E 0041 000E 0000
        DECLE   $002F,  $0210,  $038D,  $0171   ; D968   002F 0210 038D 0171
        DECLE   $022C                           ; D96C   022C

        SUBR    R1,     R2                      ; D96D   010A
        RRC     R1,     1                       ; D96E   0071
        XORR    R7,     R4                      ; D96F   01FC
        XORR    R3,     R4                      ; D970   01DC
        XORR    R4,     R6                      ; D971   01E6
        MOVR    R1,     R7                      ; D972   008F

        DECLE   $0212                           ; D973   0212

        XORR    R0,     R6                      ; D974   01C6
        ADDR    R3,     R0                      ; D975   00D8
        SUBR    R5,     R6                      ; D976   012E
        CMPR    R5,     R5                      ; D977   016D
        AND@    R6,     R3                      ; D978   03B3
        CMP@    R2,     R4                      ; D979   0354
        ANDR    R1,     R0                      ; D97A   0188
        ADDR    R6,     R3                      ; D97B   00F3
        CMPR    R6,     R0                      ; D97C   0170
        ADD@    R4,     R3                      ; D97D   02E3
        MVI@    R2,     R5                      ; D97E   0295
        ANDR    R0,     R4                      ; D97F   0184
        ADDR    R4,     R0                      ; D980   00E0
        SAR     R2,     2                       ; D981   006E
        SUBR    R3,     R7                      ; D982   011F

        MVI@    R4,     R0                      ; D983   02A0
        BEQ     L_DA85                          ; D984   0204 00FF

        DECR    R0                              ; D986   0010
        INCR    R1                              ; D987   0009
        MVI@    R4,     R0                      ; D988   02A0
        XOR@    R3,     R1                      ; D989   03D9
        SUBR    R4,     R0                      ; D98A   0120
        MVI@    R4,     R3                      ; D98B   02A3
        ADCR    R1                              ; D98C   0029
        SUBI    #$0179, R2                      ; D98D   033A 0179
        XOR@    R3,     R2                      ; D98F   03DA
        SWAP    R3,     2                       ; D990   0047
        SUB@    R4,     R3                      ; D991   0323
        SDBD                                    ; D992   0001
        SUB@    R4,     R4                      ; D993   0324
        BEQ     L_DBF8                          ; D994   0204 0262
        SUB@    R1,     R7                      ; D996   030F

        DECLE   $0001,  $0057,  $0110,  $03CD   ; D997   0001 0057 0110 03CD
        DECLE   $013D,  $0310,  $0151,  $03A0   ; D99B   013D 0310 0151 03A0
        DECLE   $028D,  $0254,  $0284,  $008D   ; D99F   028D 0254 0284 008D
        DECLE   $0000,  $0000                   ; D9A3   0000 0000

        ADDR    R2,     R0                      ; D9A5   00D0
        ADD@    R6,     R7                      ; D9A6   02F7

        DECLE   $00C3,  $00D4,  $0301,  $02E2   ; D9A7   00C3 00D4 0301 02E2
        DECLE   $0208,  $0129,  $01FA,  $0020   ; D9AB   0208 0129 01FA 0020
        DECLE   $01C0,  $00E8,  $0128,  $0010   ; D9AF   01C0 00E8 0128 0010
        DECLE   $0000,  $0280,  $002F,  $0128   ; D9B3   0000 0280 002F 0128
        DECLE   $0328,  $0381,  $0180,  $0380   ; D9B7   0328 0381 0180 0380
        DECLE   $0129,  $0045,  $0070,  $0247   ; D9BB   0129 0045 0070 0247
        DECLE   $039F,  $0069,  $033B,  $008A   ; D9BF   039F 0069 033B 008A
        DECLE   $025C,  $0182,  $006B,  $0305   ; D9C3   025C 0182 006B 0305
        DECLE   $0234,  $025D,  $0099,  $011A   ; D9C7   0234 025D 0099 011A
        DECLE   $02C1,  $02F4,  $017A,  $021A   ; D9CB   02C1 02F4 017A 021A
        DECLE   $0366,  $024C,  $0291,  $0340   ; D9CF   0366 024C 0291 0340
        DECLE   $0279,  $00B5,  $02E5,  $0020   ; D9D3   0279 00B5 02E5 0020
        DECLE   $008E,  $0381,  $00F1,  $038D   ; D9D7   008E 0381 00F1 038D
        DECLE   $019A,  $0226,  $0188,  $01C1   ; D9DB   019A 0226 0188 01C1
        DECLE   $01BB,  $0262,  $0332,  $03FC   ; D9DF   01BB 0262 0332 03FC
        DECLE   $01D2,  $01C0,  $0206,  $03C6   ; D9E3   01D2 01C0 0206 03C6
        DECLE   $00A4,  $028B,  $02C4,  $003D   ; D9E7   00A4 028B 02C4 003D
        DECLE   $0036,  $0049,  $0371,  $0387   ; D9EB   0036 0049 0371 0387
        DECLE   $0000,  $007F,  $0218,  $0089   ; D9EF   0000 007F 0218 0089
        DECLE   $0000,  $0074,  $0008,  $01A0   ; D9F3   0000 0074 0008 01A0
        DECLE   $03BA,  $0391,  $0000,  $01B2   ; D9F7   03BA 0391 0000 01B2
        DECLE   $023C                           ; D9FB   023C

        XOR@    R6,     R0                      ; D9FC   03F0
        CMP@    R5,     R4                      ; D9FD   036C
        AND@    R6,     R3                      ; D9FE   03B3
        SUB     G_03CF, R1                      ; D9FF   0301 03CF
        CMPR    R2,     R7                      ; DA01   0157
        MOVR    R2,     R0                      ; DA02   0090
        DECR    R5                              ; DA03   0015
        RRC     R0,     1                       ; DA04   0070
        SUBR    R4,     R3                      ; DA05   0123
        MOVR    R0,     R4                      ; DA06   0084
        SETC                                    ; DA07   0007
        MOVR    R0,     R7                      ; DA08   0087

        DECLE   $0068,  $019A,  $017B,  $0044   ; DA09   0068 019A 017B 0044
        DECLE   $0187,  $0161,  $02E5,  $0035   ; DA0D   0187 0161 02E5 0035

        SUBR    R1,     R5                      ; DA11   010D
        MOVR    R7,     R1                      ; DA12   00B9
        DECR    R1                              ; DA13   0011
        MVI     G_00B2, R3                      ; DA14   0283 00B2
        AND     G_0319, R2                      ; DA16   0382 0319
        BGT     L_DC2C                          ; DA18   020E 0212
        MVI@    R2,     R7                      ; DA1A   0297

        DECLE   $01A2,  $0059,  $01C1,  $0025   ; DA1B   01A2 0059 01C1 0025
        DECLE   $00F8,  $0000,  $0000,  $00F0   ; DA1F   00F8 0000 0000 00F0
        DECLE   $01CD,  $00DB,  $0309,  $034D   ; DA23   01CD 00DB 0309 034D
        DECLE   $03D0,  $02AC,  $025A,  $0212   ; DA27   03D0 02AC 025A 0212
        DECLE   $008E,  $01C0,  $0238,  $0200   ; DA2B   008E 01C0 0238 0200
        DECLE   $01F2,  $03B0,  $0348,  $0023   ; DA2F   01F2 03B0 0348 0023
        DECLE   $020F,  $02E6,  $0267,  $0384   ; DA33   020F 02E6 0267 0384
        DECLE   $01A7,  $0360,  $015E,  $01ED   ; DA37   01A7 0360 015E 01ED
        DECLE   $0009,  $0000,  $0000,  $0320   ; DA3B   0009 0000 0000 0320
        DECLE   $013C,  $0373,  $0034,  $0385   ; DA3F   013C 0373 0034 0385
        DECLE   $0093,  $02A4,  $02BF           ; DA43   0093 02A4 02BF

        MVI@    R2,     R5                      ; DA46   0295
        ADDR    R5,     R4                      ; DA47   00EC
        ADDR    R6,     R4                      ; DA48   00F4
        MOVR    R6,     R2                      ; DA49   00B2
        MOVR    R2,     R7                      ; DA4A   0097

        MVI@    R3,     R2                      ; DA4B   029A
        MOVR    R0,     R4                      ; DA4C   0084
        SUB@    R4,     R0                      ; DA4D   0320
        DECR    R1                              ; DA4E   0011
        CMPI    #$029E, R2                      ; DA4F   037A 029E
        SUBR    R5,     R1                      ; DA51   0129
        MVI@    R2,     R7                      ; DA52   0297

        ADD     G_0322, R1                      ; DA53   02C1 0322
        MOVR    R7,     R5                      ; DA55   00BD
        ADD@    R6,     R7                      ; DA56   02F7

        DECLE   $0150,  $022A,  $0002,  $0207   ; DA57   0150 022A 0002 0207
        DECLE   $013C,  $0340,  $0074,  $038E   ; DA5B   013C 0340 0074 038E
        DECLE   $0040,  $0391,  $024F,  $0177   ; DA5F   0040 0391 024F 0177
        DECLE   $00A0,  $0021,  $0007,  $033C   ; DA63   00A0 0021 0007 033C
        DECLE   $0083,  $0397,  $0045,  $0000   ; DA67   0083 0397 0045 0000
        DECLE   $0398,  $0140,  $00E9,  $021F   ; DA6B   0398 0140 00E9 021F

        DIS                                     ; DA6F   0003
        SAR     R3,     1                       ; DA70   006B
        SUB@    R2,     R0                      ; DA71   0310
        CMPR    R1,     R4                      ; DA72   014C
        CMPR    R3,     R3                      ; DA73   015B
        SUBR    R3,     R6                      ; DA74   011E
        ANDR    R1,     R5                      ; DA75   018D
        AND@    R4,     R0                      ; DA76   03A0
        ADDI    #$0352, R4                      ; DA77   02FC 0352
        XORR    R0,     R6                      ; DA79   01C6
        SAR     R1,     2                       ; DA7A   006D
        SUBR    R2,     R2                      ; DA7B   0112
        ANDR    R0,     R4                      ; DA7C   0184
        XOR@    R6,     R0                      ; DA7D   03F0
        XORR    R0,     R5                      ; DA7E   01C5
        ANDR    R5,     R1                      ; DA7F   01A9
        ADD@    R4,     R3                      ; DA80   02E3
        SUBR    R6,     R3                      ; DA81   0133
        MVI@    R1,     R1                      ; DA82   0289
        ADDR    R2,     R2                      ; DA83   00D2
        MOVR    R3,     R4                      ; DA84   009C
L_DA85:
        ADDR    R3,     R3                      ; DA85   00DB
        DECLE   $0315,  $0171,  $021A,  $0263   ; DA86   0315 0171 021A 0263
        DECLE   $0061,  $0216,  $016B,  $015A   ; DA8A   0061 0216 016B 015A
        DECLE   $0026,  $0312,  $004D,  $02BC   ; DA8E   0026 0312 004D 02BC
        DECLE   $0371,  $0094,  $038E,  $02D0   ; DA92   0371 0094 038E 02D0
        DECLE   $02F4,  $02AA,  $0303,  $01A8   ; DA96   02F4 02AA 0303 01A8
        DECLE   $014C,  $0186,  $0111,  $021A   ; DA9A   014C 0186 0111 021A
        DECLE   $016E,  $0256,  $03CE,  $0218   ; DA9E   016E 0256 03CE 0218
        DECLE   $00C9,  $0000,  $0065,  $0080   ; DAA2   00C9 0000 0065 0080
        DECLE   $01A0,  $01D4,  $0112,  $0000   ; DAA6   01A0 01D4 0112 0000

        CMPR    R1,     R4                      ; DAAA   014C
        B       L_D75C                          ; DAAB   0220 0350

        DECLE   $0344,  $0324,  $0000,  $0210   ; DAAD   0344 0324 0000 0210
        DECLE   $0260,  $01C0,  $0232,  $026D   ; DAB1   0260 01C0 0232 026D
        DECLE   $03F2,  $0039,  $023C           ; DAB5   03F2 0039 023C

        SUB@    R3,     R2                      ; DAB8   031A
        XOR@    R3,     R1                      ; DAB9   03D9
        SLL     R3,     2                       ; DABA   004F
        CMP@    R5,     R0                      ; DABB   0368
        SUBR    R4,     R7                      ; DABC   0127

        PSHR    R3                              ; DABD   0273
        CMPR    R0,     R1                      ; DABE   0141
        CMPR    R0,     R7                      ; DABF   0147
        SUBR    R0,     R3                      ; DAC0   0103
        AND@    R6,     R0                      ; DAC1   03B0
        ADD@    R4,     R3                      ; DAC2   02E3
        SUBR    R2,     R6                      ; DAC3   0116
        SUBR    R1,     R3                      ; DAC4   010B
        SAR     R1,     1                       ; DAC5   0069
L_DAC6:
        DECR    R7                              ; DAC6   0017

        DECLE   $03B2,  $023B,  $039A,  $01DF   ; DAC7   03B2 023B 039A 01DF
        DECLE   $0050,  $026A,  $0168,  $0179   ; DACB   0050 026A 0168 0179
        DECLE   $0000,  $0120,  $0320,  $00C3   ; DACF   0000 0120 0320 00C3
        DECLE   $0100,  $0019,  $0281,  $0000   ; DAD3   0100 0019 0281 0000
        DECLE   $024A,  $0137,  $0078,  $000E   ; DAD7   024A 0137 0078 000E
        DECLE   $0000,  $003B,  $0218,  $00C9   ; DADB   0000 003B 0218 00C9
        DECLE   $0000,  $0065,  $0080,  $01A0   ; DADF   0000 0065 0080 01A0
        DECLE   $01D4,  $0112,  $0000           ; DAE3   01D4 0112 0000

        CMPR    R1,     R4                      ; DAE6   014C
        B       L_D798                          ; DAE7   0220 0350

        DECLE   $0344,  $0324,  $0000,  $0210   ; DAE9   0344 0324 0000 0210
        DECLE   $0260,  $01C0,  $0232,  $026D   ; DAED   0260 01C0 0232 026D
        DECLE   $03F2,  $0039,  $023C           ; DAF1   03F2 0039 023C

        SUB@    R3,     R2                      ; DAF4   031A
        XOR@    R3,     R1                      ; DAF5   03D9
        SLL     R3,     2                       ; DAF6   004F
        CMP@    R5,     R0                      ; DAF7   0368
        SUBR    R4,     R7                      ; DAF8   0127

        PSHR    R3                              ; DAF9   0273
        CMPR    R0,     R1                      ; DAFA   0141
        CMPR    R0,     R7                      ; DAFB   0147
        SUBR    R0,     R3                      ; DAFC   0103
        AND@    R6,     R0                      ; DAFD   03B0
        ADD@    R4,     R3                      ; DAFE   02E3
        SUBR    R2,     R6                      ; DAFF   0116
        SUBR    R1,     R3                      ; DB00   010B
        SAR     R1,     1                       ; DB01   0069
L_DB02:
        DECR    R7                              ; DB02   0017

        DECLE   $03B2,  $023B,  $039A,  $01DF   ; DB03   03B2 023B 039A 01DF
        DECLE   $0050,  $026A,  $0168,  $0179   ; DB07   0050 026A 0168 0179
        DECLE   $0000                           ; DB0B   0000

        SUBR    R4,     R0                      ; DB0C   0120
        SUB@    R4,     R0                      ; DB0D   0320
        ADDR    R0,     R3                      ; DB0E   00C3
L_DB0F:
        SUBR    R0,     R0                      ; DB0F   0100
        DECLE   $0019,  $0281,  $0000,  $024A   ; DB10   0019 0281 0000 024A
        DECLE   $0137,  $0078,  $000E,  $0000   ; DB14   0137 0078 000E 0000

        ADCR    R7                              ; DB18   002F

        ADDR    R6,     R5                      ; DB19   00F5
L_DB1A:
        ADDR    R0,     R4                      ; DB1A   00C4
        DECLE   $00D2,  $0000,  $0219,  $03C4   ; DB1B   00D2 0000 0219 03C4
        DECLE   $0269,  $001E,  $00EB,  $027C   ; DB1F   0269 001E 00EB 027C

        ANDR    R0,     R2                      ; DB23   0182
L_DB24:
        ADDI    #$0286, R1                      ; DB24   02F9 0286
        DECLE   $0334,  $00CE,  $006D,  $0033   ; DB26   0334 00CE 006D 0033
        DECLE   $0301,  $01BA,  $014B,  $004A   ; DB2A   0301 01BA 014B 004A
        DECLE   $01A6,  $0007,  $0072,  $0022   ; DB2E   01A6 0007 0072 0022
        DECLE   $004A,  $022E,  $0020,  $0380   ; DB32   004A 022E 0020 0380
        DECLE   $0239,  $029A,  $019E,  $0218   ; DB36   0239 029A 019E 0218

        MVI@    R3,     R1                      ; DB3A   0299
        AND@    R3,     R4                      ; DB3B   039C
        XOR@    R6,     R5                      ; DB3C   03F5
        SUBR    R1,     R3                      ; DB3D   010B
        XOR@    R1,     R5                      ; DB3E   03CD
        ADDR    R0,     R6                      ; DB3F   00C6
        INCR    R0                              ; DB40   0008
        AND@    R2,     R1                      ; DB41   0391
        ADDR    R0,     R0                      ; DB42   00C0
        SUBI    #$0154, R6                      ; DB43   033E 0154
        MVO@    R2,     R4                      ; DB45   0262
        SUB@    R1,     R7                      ; DB46   030F

        DECLE   $0001,  $0046,  $0018,  $0189   ; DB47   0001 0046 0018 0189
        DECLE   $0000,  $00A6,  $001F,  $0130   ; DB4B   0000 00A6 001F 0130
        DECLE   $01BE,  $0213,  $0000,  $010A   ; DB4F   01BE 0213 0000 010A
        DECLE   $0122,  $0390,  $0378,  $0235   ; DB53   0122 0390 0378 0235
        DECLE   $008B,  $0059,  $0211           ; DB57   008B 0059 0211

        SUB@    R1,     R3                      ; DB5A   030B
        SARC    R0,     2                       ; DB5B   007C
        ANDR    R3,     R3                      ; DB5C   019B
        NOP                                     ; DB5D   0034
        SUB@    R2,     R4                      ; DB5E   0314
        CMPR    R4,     R1                      ; DB5F   0161
        SUB@    R3,     R1                      ; DB60   0319
        MVI@    R3,     R7                      ; DB61   029F

        DECLE   $0120,  $023A,  $02FB,  $02F0   ; DB62   0120 023A 02FB 02F0
        DECLE   $027D,  $0293,  $007A,  $0238   ; DB66   027D 0293 007A 0238
        DECLE   $03E4,  $0007,  $03DC,  $0094   ; DB6A   03E4 0007 03DC 0094
        DECLE   $03F8,  $0008,  $0360,  $003F   ; DB6E   03F8 0008 0360 003F
        DECLE   $03E3,  $0233,  $02D9,  $004C   ; DB72   03E3 0233 02D9 004C
        DECLE   $0008,  $0209,  $023F           ; DB76   0008 0209 023F

        AND     G_0138, R3                      ; DB79   0383 0138
        MVI@    R2,     R3                      ; DB7B   0293
        SUBR    R5,     R1                      ; DB7C   0129
        MVI@    R2,     R7                      ; DB7D   0297

        DECLE   $0060,  $01A9,  $0000,  $025C   ; DB7E   0060 01A9 0000 025C
        DECLE   $023B,  $0279                   ; DB82   023B 0279

        SUBR    R6,     R3                      ; DB84   0133
        SUB@    R3,     R1                      ; DB85   0319
        COMR    R0                              ; DB86   0018
        NEGR    R5                              ; DB87   0025
        ADD@    R1,     R7                      ; DB88   02CF

        GSWD    R0                              ; DB89   0030
        XOR@    R5,     R0                      ; DB8A   03E8
        ADCR    R7                              ; DB8B   002F

        NOP                                     ; DB8C   0034
L_DB8D:
        SETC                                    ; DB8D   0007
        DECLE   $0000,  $0049,  $00F4,  $0044   ; DB8E   0000 0049 00F4 0044
        DECLE   $01C2,  $0000,  $011D,  $03A9   ; DB92   01C2 0000 011D 03A9
        DECLE   $0249,  $0001,  $0110,  $03F0   ; DB96   0249 0001 0110 03F0
        DECLE   $013E,  $0363,  $033E,  $03A9   ; DB9A   013E 0363 033E 03A9
        DECLE   $03EE,  $01EF                   ; DB9E   03EE 01EF

        MOVR    R5,     R0                      ; DBA0   00A8
        SUBR    R1,     R2                      ; DBA1   010A
        AND@    R6,     R5                      ; DBA2   03B5
        MVI@    R3,     R7                      ; DBA3   029F

        DECLE   $0372,  $029B,  $0376,  $0353   ; DBA4   0372 029B 0376 0353
        DECLE   $01ED,  $02AA,  $03AE,  $01EE   ; DBA8   01ED 02AA 03AE 01EE
        DECLE   $015D,  $00F7,  $03A4,  $03FD   ; DBAC   015D 00F7 03A4 03FD
        DECLE   $01D4,  $017B,  $02F4,  $0085   ; DBB0   01D4 017B 02F4 0085
        DECLE   $03CA,  $023F,  $02D2,  $0111   ; DBB4   03CA 023F 02D2 0111
        DECLE   $0037,  $024A,  $000A,  $0240   ; DBB8   0037 024A 000A 0240
        DECLE   $03C9,  $0102,  $00F2,  $0100   ; DBBC   03C9 0102 00F2 0100
        DECLE   $033A,  $0082,  $0168,  $0300   ; DBC0   033A 0082 0168 0300
        DECLE   $0085,  $01A8,  $01EC,  $00EB   ; DBC4   0085 01A8 01EC 00EB
        DECLE   $02F5,  $020D,  $003D,  $0115   ; DBC8   02F5 020D 003D 0115
        DECLE   $0295,  $0237,  $0356,  $01FD   ; DBCC   0295 0237 0356 01FD
        DECLE   $0352,  $0075,  $026D,  $00FF   ; DBD0   0352 0075 026D 00FF
        DECLE   $024A,  $01A4,  $03C5,  $030F   ; DBD4   024A 01A4 03C5 030F
        DECLE   $0001                           ; DBD8   0001

        SLL     R2,     1                       ; DBD9   004A
        SUB@    R3,     R0                      ; DBDA   0318
        XORR    R1,     R4                      ; DBDB   01CC
        ANDR    R3,     R5                      ; DBDC   019D
        SUB@    R2,     R3                      ; DBDD   0313
        SLL     R2,     1                       ; DBDE   004A
L_DBDF:
        ANDR    R4,     R2                      ; DBDF   01A2
        DECLE   $02E0,  $02D6,  $028D,  $019C   ; DBE0   02E0 02D6 028D 019C
        DECLE   $01CA,  $00CA,  $00A8,  $027A   ; DBE4   01CA 00CA 00A8 027A
        DECLE   $035E,  $0100,  $0194,  $019D   ; DBE8   035E 0100 0194 019D
        DECLE   $03CC,  $011E,  $0106,  $0305   ; DBEC   03CC 011E 0106 0305
        DECLE   $03F3,  $03DB,  $0387,  $002C   ; DBF0   03F3 03DB 0387 002C
        DECLE   $01B5,  $006C,  $03E7           ; DBF4   01B5 006C 03E7

        MOVR    R3,     R7                      ; DBF7   009F

L_DBF8:
        MVO@    R0,     R5                      ; DBF8   0268
        DECLE   $01F1,  $0158,  $017B,  $01A5   ; DBF9   01F1 0158 017B 01A5
        DECLE   $02CC,  $00B7,  $03FE,  $0346   ; DBFD   02CC 00B7 03FE 0346
        DECLE   $02B3,  $006E,  $03FA,  $000D   ; DC01   02B3 006E 03FA 000D
        DECLE   $00AD,  $0399,  $0046,  $0100   ; DC05   00AD 0399 0046 0100
        DECLE   $0245,  $03C7,  $0197           ; DC09   0245 03C7 0197

        CMPR    R6,     R6                      ; DC0C   0176
        ANDR    R0,     R6                      ; DC0D   0186
        SUBR    R4,     R0                      ; DC0E   0120
        MOVR    R1,     R4                      ; DC0F   008C
        XOR@    R5,     R6                      ; DC10   03EE
        MVI     G_01EF, R7                      ; DC11   0287 01EF

        MVI@    R2,     R1                      ; DC13   0291
        SUB@    R4,     R5                      ; DC14   0325
        XORR    R7,     R4                      ; DC15   01FC
        MVI@    R4,     R2                      ; DC16   02A2
        MOVR    R0,     R7                      ; DC17   0087
        SUBR    R3,     R7                      ; DC18   011F

        SUBR    R2,     R6                      ; DC19   0116
        ADDR    R0,     R6                      ; DC1A   00C6
        MVI@    R5,     R7                      ; DC1B   02AF

        DECLE   $003C,  $0240,  $01CF,  $0210   ; DC1C   003C 0240 01CF 0210
        DECLE   $0011,  $023D,  $030F,  $0001   ; DC20   0011 023D 030F 0001
        DECLE   $005D,  $0210,  $0088,  $0000   ; DC24   005D 0210 0088 0000

        SLLC    R0,     1                       ; DC28   0058
        SUBR    R5,     R7                      ; DC29   012F

        SUBR    R4,     R6                      ; DC2A   0126
        EIS                                     ; DC2B   0002
L_DC2C:
        ADD@    R4,     R0                      ; DC2C   02E0
        DECLE   $03C2,  $00D8,  $01FE,  $0243   ; DC2D   03C2 00D8 01FE 0243
        DECLE   $024A,  $01AB,  $006B,  $0330   ; DC31   024A 01AB 006B 0330
        DECLE   $00B4,  $00CB,  $03BD,  $029B   ; DC35   00B4 00CB 03BD 029B
        DECLE   $00E2,  $01D4,  $03B7,  $0362   ; DC39   00E2 01D4 03B7 0362
        DECLE   $01B8,  $02CA,  $03B1,  $0024   ; DC3D   01B8 02CA 03B1 0024
        DECLE   $030C,  $01AA,  $01B5,  $014A   ; DC41   030C 01AA 01B5 014A
        DECLE   $0385,  $0220,  $01F0,  $038F   ; DC45   0385 0220 01F0 038F
        DECLE   $0219,  $00D6,  $01F5,  $0262   ; DC49   0219 00D6 01F5 0262
        DECLE   $033A,  $000E,  $0133,  $02CB   ; DC4D   033A 000E 0133 02CB
        DECLE   $0348,  $02D6,  $0399,  $000E   ; DC51   0348 02D6 0399 000E
        DECLE   $0149,  $0001                   ; DC55   0149 0001

        MOVR    R7,     R3                      ; DC57   00BB
        RRC     R2,     2                       ; DC58   0076
        SUBR    R7,     R0                      ; DC59   0138
        COMR    R4                              ; DC5A   001C
        ADD     G_00E4, R0                      ; DC5B   02C0 00E4
        DECR    R4                              ; DC5D   0014
        CMPR    R5,     R5                      ; DC5E   016D
        MVO@    R0,     R4                      ; DC5F   0260
        SUB@    R2,     R0                      ; DC60   0310
        SUBR    R6,     R6                      ; DC61   0136
        AND@    R1,     R5                      ; DC62   038D
        MVI@    R3,     R0                      ; DC63   0298
        ADD@    R3,     R6                      ; DC64   02DE
        SUBI    #$034C, R7                      ; DC65   033F 034C

        DECLE   $02B2,  $03B8,  $01BE,  $014E   ; DC67   02B2 03B8 01BE 014E
        DECLE   $033B,  $03A1,  $01F6,  $0129   ; DC6B   033B 03A1 01F6 0129
        DECLE   $00F7,  $0355,  $00BD,  $033D   ; DC6F   00F7 0355 00BD 033D
        DECLE   $0221,  $026A,  $01CF,  $01EC   ; DC73   0221 026A 01CF 01EC
        DECLE   $0364,  $039D,  $0155,  $0267   ; DC77   0364 039D 0155 0267
        DECLE   $0364,  $03A9,  $01D1,  $0354   ; DC7B   0364 03A9 01D1 0354
        DECLE   $02FB,  $030F,  $0001,  $003B   ; DC7F   02FB 030F 0001 003B
        DECLE   $0210,  $0049,  $0000           ; DC83   0210 0049 0000

        RLC     R1,     1                       ; DC86   0051
        MVI@    R4,     R1                      ; DC87   02A1
        ANDR    R3,     R6                      ; DC88   019E
        COMR    R0                              ; DC89   0018
        ADD     .BTAB.35,R7                     ; DC8A   02C7 0235

        DECLE   $01AD,  $0066,  $0000           ; DC8C   01AD 0066 0000

        ADDR    R1,     R0                      ; DC8F   00C8
        CMP@    R4,     R6                      ; DC90   0366
        CMPR    R6,     R3                      ; DC91   0173
        ADDR    R3,     R3                      ; DC92   00DB
        XORR    R3,     R2                      ; DC93   01DA
        MVII    #$0100, R6                      ; DC94   02BE 0100
        MVO@    R6,     R4                      ; DC96   0266
        MVI@    R1,     R7                      ; DC97   028F

        DECLE   $0171,  $019D,  $026F,  $0019   ; DC98   0171 019D 026F 0019
        DECLE   $0000,  $03A3,  $0309,  $0154   ; DC9C   0000 03A3 0309 0154
        DECLE   $01F3,  $01F4,  $025B,  $03BA   ; DCA0   01F3 01F4 025B 03BA
        DECLE   $024E,  $02D6,  $018B,  $03B7   ; DCA4   024E 02D6 018B 03B7
        DECLE   $0147,  $021A,  $00B1,  $01F7   ; DCA8   0147 021A 00B1 01F7

        SUBR    R5,     R1                      ; DCAC   0129
        ADDR    R1,     R7                      ; DCAD   00CF

        DECLE   $0396,  $027F,  $017A,  $01CB   ; DCAE   0396 027F 017A 01CB
        DECLE   $0230,  $029E,  $01CF,  $0039   ; DCB2   0230 029E 01CF 0039
        DECLE   $0222,  $0391,  $0000,  $0192   ; DCB6   0222 0391 0000 0192
        DECLE   $0102,  $0331,  $0387,  $0000   ; DCBA   0102 0331 0387 0000
        DECLE   $0053,  $0010,  $030D,  $0119   ; DCBE   0053 0010 030D 0119
        DECLE   $02B6,  $01AF,  $02C1,  $0002   ; DCC2   02B6 01AF 02C1 0002
        DECLE   $0200,  $03D4,  $027A           ; DCC6   0200 03D4 027A

        CMPR    R7,     R2                      ; DCC9   017A
        MVO@    R1,     R2                      ; DCCA   0251
        PSHR    R6                              ; DCCB   0276
        ANDR    R1,     R5                      ; DCCC   018D
        MOVR    R5,     R7                      ; DCCD   00AF

        ADDR    R5,     R0                      ; DCCE   00E8
        MVO@    R7,     R1                      ; DCCF   024F
        AND@    R4,     R1                      ; DCD0   03A1
        RSWD    R4                              ; DCD1   003C
        MOVR    R0,     R6                      ; DCD2   0086
        ADDR    R7,     R5                      ; DCD3   00FD
        SUB@    R2,     R7                      ; DCD4   0317

        XORR    R3,     R6                      ; DCD5   01DE
        MVI@    R2,     R0                      ; DCD6   0290
        SUB@    R3,     R7                      ; DCD7   031F

        DECLE   $0162,  $002C,  $03BA,  $015B   ; DCD8   0162 002C 03BA 015B
        DECLE   $02E4,  $014F,  $02A1,  $0348   ; DCDC   02E4 014F 02A1 0348
        DECLE   $01E2,  $00D0,  $0266,  $0112   ; DCE0   01E2 00D0 0266 0112
        DECLE   $00F8,  $021C                   ; DCE4   00F8 021C

        XOR     G_018B, R2                      ; DCE6   03C2 018B
        MVO@    R3,     R5                      ; DCE8   026B
        SUBR    R1,     R7                      ; DCE9   010F

        DECLE   $0171,  $018D,  $020F,  $0015   ; DCEA   0171 018D 020F 0015
        DECLE   $0000                           ; DCEE   0000

        RRC     R0,     2                       ; DCEF   0074
        MVI@    R1,     R1                      ; DCF0   0289
        CMPR    R2,     R0                      ; DCF1   0150
        CMPR    R3,     R5                      ; DCF2   015D
        ADDR    R5,     R7                      ; DCF3   00EF

        ADDR    R4,     R6                      ; DCF4   00E6
        SUBR    R5,     R7                      ; DCF5   012F

        DECLE   $03A1,  $00BC,  $0285,  $0361   ; DCF6   03A1 00BC 0285 0361
        DECLE   $0094,  $03C3,  $00E1,  $0216   ; DCFA   0094 03C3 00E1 0216
        DECLE   $025D,  $013A,  $022E,  $0080   ; DCFE   025D 013A 022E 0080
        DECLE   $0208,  $0003,  $0350,  $025C   ; DD02   0208 0003 0350 025C
        DECLE   $0189,  $03EA,  $007A,  $00AC   ; DD06   0189 03EA 007A 00AC
        DECLE   $0000,  $0118,  $031D,  $0286   ; DD0A   0000 0118 031D 0286
        DECLE   $0076,  $01F3,  $0038,  $0000   ; DD0E   0076 01F3 0038 0000
        DECLE   $0079,  $0118,  $01CD,  $0149   ; DD12   0079 0118 01CD 0149
        DECLE   $0024,  $0344,  $0073,  $02C0   ; DD16   0024 0344 0073 02C0
        DECLE   $02E0,  $032B,  $01A4,  $013A   ; DD1A   02E0 032B 01A4 013A
        DECLE   $008C,  $0128,  $0276,  $018C   ; DD1E   008C 0128 0276 018C
        DECLE   $0080,  $0134,  $03A5,  $01CC   ; DD22   0080 0134 03A5 01CC
        DECLE   $016E,  $020D,  $0109,  $02D2   ; DD26   016E 020D 0109 02D2
        DECLE   $03AB,  $0083,  $01AA,  $019D   ; DD2A   03AB 0083 01AA 019D
        DECLE   $03DA,  $0369,  $0138,  $0010   ; DD2E   03DA 0369 0138 0010
        DECLE   $020D,  $03DB,  $017A,  $00AC   ; DD32   020D 03DB 017A 00AC
        DECLE   $01CD,  $0116,  $0305,  $0089   ; DD36   01CD 0116 0305 0089
        DECLE   $0212,  $032F,  $025E,  $016C   ; DD3A   0212 032F 025E 016C
        DECLE   $01A5,  $004A,  $00A8,  $0138   ; DD3E   01A5 004A 00A8 0138
        DECLE   $0224,  $017F,  $003F,  $01C0   ; DD42   0224 017F 003F 01C0
        DECLE   $01A7,  $018D,  $0102,  $0205   ; DD46   01A7 018D 0102 0205
        DECLE   $01C4,  $03E2,  $03BB,  $0287   ; DD4A   01C4 03E2 03BB 0287
        DECLE   $00AE,  $01A5,  $014E,  $00C8   ; DD4E   00AE 01A5 014E 00C8
        DECLE   $0130,  $0036,  $0177,  $00BF   ; DD52   0130 0036 0177 00BF
        DECLE   $01CC,  $00A4,  $0025,  $0004   ; DD56   01CC 00A4 0025 0004
        DECLE   $0080,  $0001,  $00F1,  $0007   ; DD5A   0080 0001 00F1 0007
        DECLE   $0165,  $0009,  $0070,  $0000   ; DD5E   0165 0009 0070 0000
        DECLE   $034E,  $00FF,  $01CD,  $018A   ; DD62   034E 00FF 01CD 018A
        DECLE   $0206,  $0107                   ; DD66   0206 0107

        ADD@    R2,     R2                      ; DD68   02D2
        ADCR    R3                              ; DD69   002B
        INCR    R2                              ; DD6A   000A
        INCR    R6                              ; DD6B   000E
        ANDR    R4,     R5                      ; DD6C   01A5
        RSWD    R6                              ; DD6D   003E
        ADDR    R5,     R7                      ; DD6E   00EF

        DECLE   $00E8,  $0034,  $016F,  $01C2   ; DD6F   00E8 0034 016F 01C2
        DECLE   $01B0,  $039F,  $034C,  $01C9   ; DD73   01B0 039F 034C 01C9
        DECLE   $021C                           ; DD77   021C

        MVI@    R1,     R0                      ; DD78   0288
        SLR     R2,     1                       ; DD79   0062
        CMP     G_005A, R0                      ; DD7A   0340 005A
        INCR    R4                              ; DD7C   000C
        MOVR    R1,     R5                      ; DD7D   008D
        MVO     R2,     .STIC.X.6               ; DD7E   0242 0006
        MVO@    R0,     R1                      ; DD80   0248
        INCR    R1                              ; DD81   0009
        MVI     G_018F, R5                      ; DD82   0285 018F
        MOVR    R3,     R0                      ; DD84   0098
        SDBD                                    ; DD85   0001
        MVI@    R4,     R0                      ; DD86   02A0
        SLR     R2,     1                       ; DD87   0062
        XORR    R7,     R6                      ; DD88   01FE
        SLR     R0,     2                       ; DD89   0064
        SUB@    R1,     R7                      ; DD8A   030F

        DECLE   $0001,  $00CB,  $00F1,  $00C4   ; DD8B   0001 00CB 00F1 00C4
        DECLE   $01E3,  $017B,  $0389,  $01F3   ; DD8F   01E3 017B 0389 01F3
        DECLE   $0334,  $00F3,  $0251,  $0169   ; DD93   0334 00F3 0251 0169
        DECLE   $022A,  $02C3,  $00A9,  $0398   ; DD97   022A 02C3 00A9 0398
        DECLE   $006F,  $0349,  $01D4,  $0312   ; DD9B   006F 0349 01D4 0312
        DECLE   $03E1,  $002C,  $03CE,  $02B6   ; DD9F   03E1 002C 03CE 02B6
        DECLE   $019C,  $0058,  $0347,  $01A8   ; DDA3   019C 0058 0347 01A8
        DECLE   $03F8,  $01BC,  $015C,  $0246   ; DDA7   03F8 01BC 015C 0246
        DECLE   $01E1,  $033C,  $0083,  $010E   ; DDAB   01E1 033C 0083 010E
        DECLE   $00CC,  $00AC,  $02D3,  $0064   ; DDAF   00CC 00AC 02D3 0064
        DECLE   $0105,  $00CB,  $00ED,  $0325   ; DDB3   0105 00CB 00ED 0325
        DECLE   $03F0,  $0001                   ; DDB7   03F0 0001

        MVO     R7,     G_0157                  ; DDB9   0247 0157
        SUBR    R4,     R2                      ; DDBB   0122
        CLRR    R5                              ; DDBC   01ED
        SUBR    R5,     R3                      ; DDBD   012B
        CMP@    R1,     R0                      ; DDBE   0348
        AND@    R4,     R0                      ; DDBF   03A0
        SUB@    R4,     R7                      ; DDC0   0327

        DIS                                     ; DDC1   0003
        TSTR    R0                              ; DDC2   0080
        SLL     R0,     1                       ; DDC3   0048
        ADDR    R4,     R0                      ; DDC4   00E0
        SUB@    R4,     R2                      ; DDC5   0322
        SUBR    R0,     R0                      ; DDC6   0100
        MOVR    R1,     R6                      ; DDC7   008E
        SARC    R1,     1                       ; DDC8   0079
L_DDC9:
        ADDR    R4,     R0                      ; DDC9   00E0
        DECLE   $0264,  $019A,  $0069,  $0078   ; DDCA   0264 019A 0069 0078
        DECLE   $0181,  $0067,  $02E4,  $0292   ; DDCE   0181 0067 02E4 0292
        DECLE   $000E,  $0298,  $02F8,  $0394   ; DDD2   000E 0298 02F8 0394
        DECLE   $0291,  $007F,  $0000,  $0123   ; DDD6   0291 007F 0000 0123
        DECLE   $00A4,  $0334,  $02F9,  $0034   ; DDDA   00A4 0334 02F9 0034
        DECLE   $0147,  $033E,  $03B6,  $014A   ; DDDE   0147 033E 03B6 014A
        DECLE   $03CA,  $006E,  $0100,  $0020   ; DDE2   03CA 006E 0100 0020
        DECLE   $0200,  $031A,  $018E,  $0024   ; DDE6   0200 031A 018E 0024
        DECLE   $019F,  $0160,  $01FC,  $01AD   ; DDEA   019F 0160 01FC 01AD
        DECLE   $0025,  $0165,  $0092,  $003F   ; DDEE   0025 0165 0092 003F

        ADDR    R7,     R2                      ; DDF2   00FA
        MOVR    R7,     R6                      ; DDF3   00BE
        SLR     R2,     1                       ; DDF4   0062
        SUBR    R0,     R0                      ; DDF5   0100
        SUBR    R4,     R5                      ; DDF6   0125
        MVO@    R4,     R5                      ; DDF7   026C
        CMPR    R4,     R5                      ; DDF8   0165
        SUB     G_0368, R7                      ; DDF9   0307 0368

        DECLE   $01AF                           ; DDFB   01AF

        CMPR    R1,     R2                      ; DDFC   014A
        AND@    R1,     R0                      ; DDFD   0388
        SUBR    R4,     R7                      ; DDFE   0127

        DECLE   $018E,  $035D,  $0180,  $00D0   ; DDFF   018E 035D 0180 00D0
        DECLE   $00B4,  $01D4,  $00D0,  $03FD   ; DE03   00B4 01D4 00D0 03FD
        DECLE   $01BE,  $0226,  $026B,  $0053   ; DE07   01BE 0226 026B 0053
        DECLE   $00E2,  $0054,  $0201,  $005B   ; DE0B   00E2 0054 0201 005B
        DECLE   $0313,  $0335,  $0049,  $0051   ; DE0F   0313 0335 0049 0051
        DECLE   $0023,  $0302,  $036C,  $03B0   ; DE13   0023 0302 036C 03B0
        DECLE   $034A,  $024A,  $011C,  $008E   ; DE17   034A 024A 011C 008E
        DECLE   $03E4,  $0149,  $004A,  $0100   ; DE1B   03E4 0149 004A 0100
        DECLE   $009E,  $0072,  $0219,  $028E   ; DE1F   009E 0072 0219 028E
        DECLE   $024C,  $0195,  $039F,  $0217   ; DE23   024C 0195 039F 0217
        DECLE   $01D4,  $02A4,  $0005,  $00EC   ; DE27   01D4 02A4 0005 00EC
        DECLE   $000F                           ; DE2B   000F

        BNOV    L_DDC9                          ; DE2C   022A 0064

        CLRC                                    ; DE2E   0006
        NEGR    R4                              ; DE2F   0024
        SARC    R0,     1                       ; DE30   0078
        ADD@    R2,     R7                      ; DE31   02D7

        NEGR    R4                              ; DE32   0024
        SETC                                    ; DE33   0007
        DECR    R0                              ; DE34   0010
        SWAP    R3,     2                       ; DE35   0047
        ADD@    R6,     R1                      ; DE36   02F1
        ANDR    R4,     R4                      ; DE37   01A4
        SUBR    R4,     R7                      ; DE38   0127

        DECLE   $0090,  $0078,  $021E           ; DE39   0090 0078 021E

        MVI@    R4,     R4                      ; DE3C   02A4
        SUB@    R1,     R2                      ; DE3D   030A
        AND     .PSG1.chn_a_lo,R1               ; DE3E   0381 00F0
        SUB@    R1,     R7                      ; DE40   030F

        DECLE   $034C,  $0206,  $031C,  $010E   ; DE41   034C 0206 031C 010E
        DECLE   $033E,  $010E,  $00E8,  $01A6   ; DE45   033E 010E 00E8 01A6
        DECLE   $0119,  $0187,  $00A6,  $03BF   ; DE49   0119 0187 00A6 03BF
        DECLE   $001D,  $0146,  $0173,  $01A1   ; DE4D   001D 0146 0173 01A1
        DECLE   $0101,  $0233,  $022F,  $0226   ; DE51   0101 0233 022F 0226
        DECLE   $0024,  $0007,  $0000           ; DE55   0024 0007 0000

        SLR     R1,     2                       ; DE58   0065
        SUB@    R2,     R0                      ; DE59   0310
        SUB@    R1,     R4                      ; DE5A   030C
        ANDR    R2,     R6                      ; DE5B   0196
        SUB@    R2,     R3                      ; DE5C   0313
        ADDR    R2,     R1                      ; DE5D   00D1
        XOR     .BTAB.2D,R0                     ; DE5E   03C0 022D
        XORR    R3,     R0                      ; DE60   01D8
        CMP@    R4,     R6                      ; DE61   0366
        PULR    R7                              ; DE62   02B7

        DECLE   $0112,  $01A5,  $02F0,  $013E   ; DE63   0112 01A5 02F0 013E
        DECLE   $00AE,  $03B3,  $0150,  $0146   ; DE67   00AE 03B3 0150 0146
        DECLE   $00D2,  $012C,  $0083,  $02B8   ; DE6B   00D2 012C 0083 02B8
        DECLE   $01D9,  $01A0,  $0064,  $0029   ; DE6F   01D9 01A0 0064 0029
        DECLE   $0278,  $0045,  $014C,  $0142   ; DE73   0278 0045 014C 0142
        DECLE   $01ED,  $0202                   ; DE77   01ED 0202

        SWAP    R3,     2                       ; DE79   0047
        CMP     G_03EC, R1                      ; DE7A   0341 03EC
        CMP@    R1,     R3                      ; DE7C   034B
        XOR@    R2,     R0                      ; DE7D   03D0
        JE      L_591E                          ; DE7E   0004 0359 011E

        DECLE   $00A6,  $03B3,  $0000,  $00C0   ; DE81   00A6 03B3 0000 00C0
        DECLE   $02E2,  $008E,  $03E8,  $0110   ; DE85   02E2 008E 03E8 0110
        DECLE   $0000,  $0328,  $03EF,  $0320   ; DE89   0000 0328 03EF 0320
        DECLE   $00DB,  $03ED,  $0067,  $00F4   ; DE8D   00DB 03ED 0067 00F4
        DECLE   $01E6,  $01A7,  $00E1,  $0268   ; DE91   01E6 01A7 00E1 0268
        DECLE   $0176,  $00DC,  $0256,  $0101   ; DE95   0176 00DC 0256 0101
        DECLE   $0073,  $02D6,  $0135,  $024D   ; DE99   0073 02D6 0135 024D
        DECLE   $0065,  $002A,  $0343,  $02B9   ; DE9D   0065 002A 0343 02B9
        DECLE   $016B,  $039A,  $0286,  $0044   ; DEA1   016B 039A 0286 0044
        DECLE   $0215,  $0120,  $021C,  $01B9   ; DEA5   0215 0120 021C 01B9
        DECLE   $01CD,  $00E3,  $0012,  $010B   ; DEA9   01CD 00E3 0012 010B
        DECLE   $00A0,  $02FE,  $025A,  $0186   ; DEAD   00A0 02FE 025A 0186
        DECLE   $005B,  $0205                   ; DEB1   005B 0205

        ANDR    R1,     R0                      ; DEB3   0188
        ADD@    R3,     R7                      ; DEB4   02DF

        DECLE   $03F5,  $027F,  $025F,  $0008   ; DEB5   03F5 027F 025F 0008
        DECLE   $0100,  $034A,  $03C8,  $0070   ; DEB9   0100 034A 03C8 0070
        DECLE   $0000,  $00FA,  $0018,  $0189   ; DEBD   0000 00FA 0018 0189
        DECLE   $0000,  $00A6,  $001F,  $0130   ; DEC1   0000 00A6 001F 0130
        DECLE   $01BE,  $0213,  $0000,  $010A   ; DEC5   01BE 0213 0000 010A
        DECLE   $0122,  $0390,  $0378,  $0336   ; DEC9   0122 0390 0378 0336
        DECLE   $002B,  $0059,  $0211           ; DECD   002B 0059 0211

        SUB@    R1,     R3                      ; DED0   030B
        SARC    R0,     2                       ; DED1   007C
        ANDR    R3,     R3                      ; DED2   019B
        NOP                                     ; DED3   0034
        ADD@    R6,     R4                      ; DED4   02F4
        SUBR    R7,     R1                      ; DED5   0139
        SUB@    R3,     R1                      ; DED6   0319
        MVI@    R3,     R7                      ; DED7   029F

        DECLE   $0120,  $023A,  $02FB,  $02F0   ; DED8   0120 023A 02FB 02F0
        DECLE   $027D,  $0395,  $0067,  $0200   ; DEDC   027D 0395 0067 0200
        DECLE   $0244,  $0003,  $03DB,  $0093   ; DEE0   0244 0003 03DB 0093
        DECLE   $0300,  $0000,  $0000,  $0004   ; DEE4   0300 0000 0000 0004
        DECLE   $03C4,  $0334,  $02B9,  $004C   ; DEE8   03C4 0334 02B9 004C
        DECLE   $0023,  $0202,  $013F,  $0183   ; DEEC   0023 0202 013F 0183
        DECLE   $01B8,  $0293,  $0131,  $0315   ; DEF0   01B8 0293 0131 0315
        DECLE   $0380,  $0158,  $03A2,  $005D   ; DEF4   0380 0158 03A2 005D
        DECLE   $02EC,  $0271,  $0396,  $007F   ; DEF8   02EC 0271 0396 007F
        DECLE   $0040,  $02FB,  $0004,  $03E1   ; DEFC   0040 02FB 0004 03E1
        DECLE   $0135,  $0289,  $0000,  $0125   ; DF00   0135 0289 0000 0125
        DECLE   $0346,  $0040,  $017B,  $00B9   ; DF04   0346 0040 017B 00B9
        DECLE   $0313,  $0331,  $0294,  $0240   ; DF08   0313 0331 0294 0240
        DECLE   $0168,  $01DC,  $0301,  $0360   ; DF0C   0168 01DC 0301 0360
        DECLE   $0259,  $0235,  $02A9,  $0020   ; DF10   0259 0235 02A9 0020
        DECLE   $001A,  $0289,  $0181,  $0373   ; DF14   001A 0289 0181 0373
        DECLE   $033A,  $02B2,  $0331,  $0295   ; DF18   033A 02B2 0331 0295
        DECLE   $0060,  $01A9,  $0000,  $025C   ; DF1C   0060 01A9 0000 025C
        DECLE   $023B,  $0279                   ; DF20   023B 0279

        SUBR    R6,     R2                      ; DF22   0132
        ADD@    R3,     R1                      ; DF23   02D9
        COMR    R0                              ; DF24   0018
        NEGR    R5                              ; DF25   0025
        ADD@    R1,     R7                      ; DF26   02CF

        DECLE   $0030,  $03E8,  $002F,  $02F4   ; DF27   0030 03E8 002F 02F4
        DECLE   $0137,  $0004,  $0280,  $0103   ; DF2B   0137 0004 0280 0103
        DECLE   $0000,  $034D,  $023D,  $001C   ; DF2F   0000 034D 023D 001C
        DECLE   $0240,  $038D,  $0211,  $019F   ; DF33   0240 038D 0211 019F
        DECLE   $027B                           ; DF37   027B

        RSWD    R5                              ; DF38   003D
        XORR    R7,     R0                      ; DF39   01F8
        ADDI    #$020A, R6                      ; DF3A   02FE 020A
        MVI@    R4,     R4                      ; DF3C   02A4
        B       L_DFA2                          ; DF3D   0200 0063

        DECLE   $0089,  $00E4,  $01E0,  $030D   ; DF3F   0089 00E4 01E0 030D
        DECLE   $01B2,  $0000,  $00C5,  $00C3   ; DF43   01B2 0000 00C5 00C3
        DECLE   $0340,  $0060,  $01CD,  $019D   ; DF47   0340 0060 01CD 019D
        DECLE   $025C,  $00CB,  $00D0,  $0032   ; DF4B   025C 00CB 00D0 0032
        DECLE   $0187,  $0140,  $01B0,  $01AD   ; DF4F   0187 0140 01B0 01AD
        DECLE   $03CD,  $014E,  $0306,  $0106   ; DF53   03CD 014E 0306 0106
        DECLE   $00D4,  $03EC,  $0001           ; DF57   00D4 03EC 0001

        XORR    R1,     R5                      ; DF5A   01CD
        ANDR    R3,     R5                      ; DF5B   019D
        XOR@    R5,     R0                      ; DF5C   03E8
        ADDR    R1,     R1                      ; DF5D   00C9
        ADDR    R5,     R0                      ; DF5E   00E8
        MVI@    R1,     R0                      ; DF5F   0288
        XORR    R7,     R0                      ; DF60   01F8
        COMR    R3                              ; DF61   001B
        ANDR    R1,     R3                      ; DF62   018B
        MOVR    R5,     R7                      ; DF63   00AF

        DECLE   $0065,  $011E,  $0392,  $007F   ; DF64   0065 011E 0392 007F
        DECLE   $0200,  $01FF,  $0065,  $001C   ; DF68   0200 01FF 0065 001C
        DECLE   $0080,  $03D1,  $0009,  $01E3   ; DF6C   0080 03D1 0009 01E3
        DECLE   $014D,  $012B,  $0206,  $0349   ; DF70   014D 012B 0206 0349
        DECLE   $00D4,  $000C,  $00FE,  $018D   ; DF74   00D4 000C 00FE 018D
        DECLE   $019D,  $0268,  $00C9,  $0130   ; DF78   019D 0268 00C9 0130
        DECLE   $00AA,  $03F0,  $001C,  $0193   ; DF7C   00AA 03F0 001C 0193
        DECLE   $00AD,  $010D,  $013F,  $03FF   ; DF80   00AD 010D 013F 03FF
        DECLE   $0189,  $01C5,  $03FC,  $01FD   ; DF84   0189 01C5 03FC 01FD
        DECLE   $01ED,  $01A5,  $00EC,  $000A   ; DF88   01ED 01A5 00EC 000A
        DECLE   $0138,  $0288,  $03EE,  $005B   ; DF8C   0138 0288 03EE 005B
        DECLE   $01AB,  $01AE,  $03A5,  $0004   ; DF90   01AB 01AE 03A5 0004

        SARC    R2,     2                       ; DF94   007E
        XORI    #$020E, R0                      ; DF95   03F8 020E
        DECR    R5                              ; DF97   0015
        CMP@    R1,     R5                      ; DF98   034D
        CMPR    R6,     R2                      ; DF99   0172
        XORR    R5,     R6                      ; DF9A   01EE
        CMPR    R0,     R7                      ; DF9B   0147
        SUB     G_030F, R5                      ; DF9C   0305 030F
        CMP@    R4,     R4                      ; DF9E   0364
        MVO@    R3,     R1                      ; DF9F   024B
        ANDR    R5,     R5                      ; DFA0   01AD
        XORR    R1,     R6                      ; DFA1   01CE
L_DFA2:
        XORR    R1,     R4                      ; DFA2   01CC
        ADDR    R4,     R7                      ; DFA3   00E7

        DECLE   $0098,  $0196,  $03FF,  $0197   ; DFA4   0098 0196 03FF 0197
        DECLE   $01AE,  $0365,  $000B,  $0100   ; DFA8   01AE 0365 000B 0100
        DECLE   $0040,  $03D3,  $02D9,  $030D   ; DFAC   0040 03D3 02D9 030D
        DECLE   $01F6,  $03EE,  $0306,  $00C3   ; DFB0   01F6 03EE 0306 00C3
        DECLE   $039D,  $0009,  $01CC,  $030D   ; DFB4   039D 0009 01CC 030D
        DECLE   $0001,  $0063,  $0311,  $01C8   ; DFB8   0001 0063 0311 01C8
        DECLE   $0000,  $00C9,  $0281,  $03B0   ; DFBC   0000 00C9 0281 03B0
        DECLE   $0269,  $00CE,  $00EA,  $0254   ; DFC0   0269 00CE 00EA 0254
        DECLE   $0380,  $01E2,  $02A5,  $0234   ; DFC4   0380 01E2 02A5 0234
        DECLE   $03DB,  $0094,  $0322,  $0282   ; DFC8   03DB 0094 0322 0282
        DECLE   $03B0,  $035A,  $021A,  $01CE   ; DFCC   03B0 035A 021A 01CE
        DECLE   $0022,  $0217,  $0381,  $01D8   ; DFD0   0022 0217 0381 01D8
        DECLE   $03B5,  $02E4,  $03FF,  $0083   ; DFD4   03B5 02E4 03FF 0083
        DECLE   $0010,  $000D,  $038D,  $00E6   ; DFD8   0010 000D 038D 00E6
        DECLE   $0315,  $000B,  $01D0,  $024C   ; DFDC   0315 000B 01D0 024C
        DECLE   $025E,  $01C6,  $0279,  $038A   ; DFE0   025E 01C6 0279 038A
        DECLE   $0005,  $0160,  $0166,  $012D   ; DFE4   0005 0160 0166 012D
        DECLE   $01F9,  $0001,  $0000,  $02F4   ; DFE8   01F9 0001 0000 02F4
        DECLE   $013C,  $0319,  $0039,  $0100   ; DFEC   013C 0319 0039 0100
        DECLE   $0200                           ; DFF0   0200

        SUBR    R1,     R2                      ; DFF1   010A
        CMP@    R2,     R3                      ; DFF2   0353
        CMPR    R2,     R3                      ; DFF3   0153
        XOR     G_00C2, R4                      ; DFF4   03C4 00C2
        MOVR    R6,     R4                      ; DFF6   00B4
        MOVR    R3,     R7                      ; DFF7   009F
        MVI@    R2,     R7                      ; DFF8   0297

        AND@    R5,     R1                      ; DFF9   03A9
        SUBR    R6,     R2                      ; DFFA   0132
        XORR    R4,     R3                      ; DFFB   01E3
        SLR     R1,     1                       ; DFFC   0061
        MVO@    R2,     R3                      ; DFFD   025A
        MVO@    R7,     R1                      ; DFFE   024F
        CMP@    R1,     R3                      ; DFFF   034B

        ORG     $F000
        XOR@    R2,     R0                      ; F000   03D0
        SLLC    R1,     2                       ; F001   005D
        ADD@    R6,     R1                      ; F002   02F1
        GSWD    R0                              ; F003   0030
        SUBI    #$009F, R2                      ; F004   033A 009F
        ANDR    R4,     R6                      ; F006   01A6
        CMPR    R3,     R4                      ; F007   015C
        MVI@    R2,     R2                      ; F008   0292
        SUBR    R2,     R1                      ; F009   0111
        COMR    R2                              ; F00A   001A
        AND@    R5,     R6                      ; F00B   03AE
        CMP@    R2,     R1                      ; F00C   0351
        ADDR    R1,     R6                      ; F00D   00CE
        ADDR    R2,     R7                      ; F00E   00D7

        DECLE   $03DB,  $0084,  $030D,  $02D6   ; F00F   03DB 0084 030D 02D6
        DECLE   $00EB,  $0067,  $01CB,  $0115   ; F013   00EB 0067 01CB 0115
        DECLE   $0078,  $0082,  $026D,  $02A4   ; F017   0078 0082 026D 02A4
        DECLE   $00E1,  $0000,  $0076,  $00F4   ; F01B   00E1 0000 0076 00F4
        DECLE   $0104,  $0153,  $016F,  $02C9   ; F01F   0104 0153 016F 02C9
        DECLE   $0153,  $03E8,  $02A6,  $0274   ; F023   0153 03E8 02A6 0274
        DECLE   $00F9,  $02B3,  $0366,  $00B1   ; F027   00F9 02B3 0366 00B1
        DECLE   $01FA,  $0157,  $034A,  $0378   ; F02B   01FA 0157 034A 0378
        DECLE   $00D9,  $03F2,  $0034,  $02FA   ; F02F   00D9 03F2 0034 02FA
        DECLE   $0221,  $01AD,  $02E8,  $0089   ; F033   0221 01AD 02E8 0089
        DECLE   $01A9,  $021A,  $0387,  $02D9   ; F037   01A9 021A 0387 02D9
        DECLE   $00D6,  $016F,  $0143,  $00DC   ; F03B   00D6 016F 0143 00DC
        DECLE   $020A,  $02CB,  $01AB,  $012B   ; F03F   020A 02CB 01AB 012B
        DECLE   $0313,  $0001,  $01C1,  $0148   ; F043   0313 0001 01C1 0148
        DECLE   $012A,  $03E1,  $0001,  $0209   ; F047   012A 03E1 0001 0209
        DECLE   $0070                           ; F04B   0070

        SUB@    R5,     R0                      ; F04C   0328
L_F04D:
        DECR    R7                              ; F04D   0017

        DECLE   $0000,  $003F,  $0028,  $012A   ; F04E   0000 003F 0028 012A
        DECLE   $03F0,  $00FF,  $0181,  $0312   ; F052   03F0 00FF 0181 0312
        DECLE   $012B,  $0120,  $0004,  $03FE   ; F056   012B 0120 0004 03FE
        DECLE   $0320,  $026D,  $0336,  $0051   ; F05A   0320 026D 0336 0051
        DECLE   $026A,  $0281,  $03F4,  $0286   ; F05E   026A 0281 03F4 0286
        DECLE   $0035,  $00AD,  $0025,  $032D   ; F062   0035 00AD 0025 032D
        DECLE   $0202,  $02FC,  $033B,  $021A   ; F066   0202 02FC 033B 021A
        DECLE   $0276,  $0238                   ; F06A   0276 0238

        MVI@    R2,     R6                      ; F06C   0296
        ANDR    R0,     R0                      ; F06D   0180
        CMP@    R3,     R5                      ; F06E   035D
        ANDR    R4,     R1                      ; F06F   01A1
        ANDR    R1,     R5                      ; F070   018D
        CMPR    R7,     R7                      ; F071   017F
        SUBR    R4,     R5                      ; F072   0125
        CMPR    R1,     R5                      ; F073   014D
        MOVR    R6,     R0                      ; F074   00B0
        SUBI    #$02D2, R6                      ; F075   033E 02D2
        XORR    R0,     R6                      ; F077   01C6
        ADDR    R4,     R7                      ; F078   00E7
        BGT     L_F201                          ; F079   020E 0186

        XOR@    R2,     R0                      ; F07B   03D0
        ANDR    R0,     R6                      ; F07C   0186
        MOVR    R5,     R1                      ; F07D   00A9
        CMPR    R6,     R3                      ; F07E   0173
        AND     G_00C4, R4                      ; F07F   0384 00C4
        RLC     R3,     1                       ; F081   0053
        ANDR    R4,     R4                      ; F082   01A4
        MOVR    R1,     R7                      ; F083   008F

        DECLE   $0295,  $02E9,  $01CD,  $0383   ; F084   0295 02E9 01CD 0383
        DECLE   $0021,  $02B6,  $0345,  $033A   ; F088   0021 02B6 0345 033A
        DECLE   $0054,  $032D,  $0031,  $0011   ; F08C   0054 032D 0031 0011
        DECLE   $033B,  $01A1,  $030D,  $0001   ; F090   033B 01A1 030D 0001

        SLR     R0,     2                       ; F094   0064
        ADDI    #$003F, R0                      ; F095   02F8 003F
        MVI     .STIC.HDLY,R1                   ; F097   0281 0030
        MVO     R0,     G_014D                  ; F099   0240 014D
        XOR@    R3,     R1                      ; F09B   03D9
        ADDI    #$02A6, R1                      ; F09C   02F9 02A6
        MVI     G_010D, R7                      ; F09E   0287 010D

        DECLE   $03C5,  $016F,  $017E,  $012E   ; F0A0   03C5 016F 017E 012E
        DECLE   $0109,  $0236,  $00E1,  $0100   ; F0A4   0109 0236 00E1 0100
        DECLE   $0140,  $0329,  $03C6,  $0100   ; F0A8   0140 0329 03C6 0100
        DECLE   $0120,  $0183,  $0373,  $022E   ; F0AC   0120 0183 0373 022E

        AND     G_03C2, R6                      ; F0B0   0386 03C2
        ANDR    R6,     R3                      ; F0B2   01B3
        ADD@    R3,     R7                      ; F0B3   02DF

        PULR    R6                              ; F0B4   02B6
        ADDI    #$0004, R4                      ; F0B5   02FC 0004
        SLR     R2,     1                       ; F0B7   0062
        MVI@    R2,     R7                      ; F0B8   0297

        DECLE   $02BD,  $012C,  $0303,  $0093   ; F0B9   02BD 012C 0303 0093
        DECLE   $0397,  $029C,  $01B1,  $021A   ; F0BD   0397 029C 01B1 021A
        DECLE   $03A4,  $03E9,  $036D,  $006B   ; F0C1   03A4 03E9 036D 006B
        DECLE   $034A,  $01B8,  $034C,  $0332   ; F0C5   034A 01B8 034C 0332
        DECLE   $03F4,  $03B8,  $0334,  $03BC   ; F0C9   03F4 03B8 0334 03BC
        DECLE   $006D,  $00D6,  $00DA,  $0058   ; F0CD   006D 00D6 00DA 0058
        DECLE   $00FB,  $036F,  $0276,  $0035   ; F0D1   00FB 036F 0276 0035
        DECLE   $00DD,  $0091,  $012B,  $023B   ; F0D5   00DD 0091 012B 023B
        DECLE   $0077,  $036A,  $039A,  $02C5   ; F0D9   0077 036A 039A 02C5
        DECLE   $005A,  $0211,  $015D,  $017B   ; F0DD   005A 0211 015D 017B
        DECLE   $01A9,  $034D,  $01A6,  $022F   ; F0E1   01A9 034D 01A6 022F
        DECLE   $010A,  $038E,  $02BD,  $02D4   ; F0E5   010A 038E 02BD 02D4
        DECLE   $0186,  $02E9,  $009B,  $0163   ; F0E9   0186 02E9 009B 0163
        DECLE   $035F,  $00FE,  $016E,  $0253   ; F0ED   035F 00FE 016E 0253
        DECLE   $018F,  $03FE,  $01D2,  $03DF   ; F0F1   018F 03FE 01D2 03DF
        DECLE   $000A,  $0023,  $0007,  $0000   ; F0F5   000A 0023 0007 0000
        DECLE   $007C,  $00FF                   ; F0F9   007C 00FF

        RSWD    R6                              ; F0FB   003E
        MVO@    R1,     R2                      ; F0FC   0251
        RSWD    R0                              ; F0FD   0038
        B       L_F3C4                          ; F0FE   0200 02C4

        DECLE   $000F,  $021A,  $0216,  $0026   ; F100   000F 021A 0216 0026
        DECLE   $0216                           ; F104   0216

        AND     G_015C, R0                      ; F105   0380 015C
        ANDR    R4,     R5                      ; F107   01A5
        AND@    R1,     R5                      ; F108   038D
        SUBR    R0,     R2                      ; F109   0102
        SUB@    R1,     R2                      ; F10A   030A
        MVI@    R1,     R4                      ; F10B   028C
        AND@    R1,     R6                      ; F10C   038E
        MVI@    R3,     R5                      ; F10D   029D
        ADD@    R3,     R0                      ; F10E   02D8
        ADDR    R0,     R6                      ; F10F   00C6
        MVI     G_0105, R1                      ; F110   0281 0105
        SUBR    R4,     R5                      ; F112   0125
        MVO@    R7,     R3                      ; F113   025F
        SUBR    R4,     R6                      ; F114   0126
        CMPR    R5,     R5                      ; F115   016D
        XORR    R4,     R3                      ; F116   01E3
        SUBR    R7,     R6                      ; F117   013E
        PSHR    R7                              ; F118   0277
        CMPR    R0,     R1                      ; F119   0141
        SUB@    R4,     R7                      ; F11A   0327

        DECR    R2                              ; F11B   0012
        MVI@    R4,     R3                      ; F11C   02A3
        CMPR    R5,     R1                      ; F11D   0169
        MVI@    R3,     R7                      ; F11E   029F

        DECLE   $027D                           ; F11F   027D

        PULR    R0                              ; F120   02B0
        CMPR    R7,     R1                      ; F121   0179
        SUB     G_0361, R7                      ; F122   0307 0361

        DECLE   $02D0,  $004F,  $0241,  $03F4   ; F124   02D0 004F 0241 03F4
        DECLE   $035C,  $0239                   ; F128   035C 0239

        ANDR    R4,     R5                      ; F12A   01A5
        CMP@    R5,     R4                      ; F12B   036C
        MOVR    R4,     R7                      ; F12C   00A7

        DECLE   $01B8,  $0002,  $01AE,  $0398   ; F12D   01B8 0002 01AE 0398
        DECLE   $0256,  $01F1,  $00E0,  $03F0   ; F131   0256 01F1 00E0 03F0
        DECLE   $0102,  $0258,  $001E,  $0000   ; F135   0102 0258 001E 0000
        DECLE   $010E,  $01E0,  $0254,  $0031   ; F139   010E 01E0 0254 0031
        DECLE   $0000                           ; F13D   0000

        SUB@    R2,     R0                      ; F13E   0310
        XOR@    R4,     R0                      ; F13F   03E0
        ADDR    R2,     R7                      ; F140   00D7

        SUBR    R6,     R5                      ; F141   0135

        JSR     R4,     L_D804                  ; F142   0004 00D8 0004

        ADDR    R3,     R7                      ; F145   00DF

        DECLE   $01EC,  $032B,  $0150,  $0082   ; F146   01EC 032B 0150 0082
        DECLE   $01C0,  $0008,  $032A,  $013A   ; F14A   01C0 0008 032A 013A
        DECLE   $0072,  $0000,  $0078,  $012A   ; F14E   0072 0000 0078 012A
        DECLE   $0058,  $0002,  $0000           ; F152   0058 0002 0000

        AND@    R2,     R0                      ; F155   0390
        SLR     R3,     2                       ; F156   0067
        SUB@    R6,     R7                      ; F157   0337

        CMPR    R6,     R3                      ; F158   0173
        MVO     R2,     .BTAB.02                ; F159   0242 0202
        CMP@    R5,     R3                      ; F15B   036B
        ADD     .BTAB.18,R7                     ; F15C   02C7 0218

        DECLE   $0049,  $0000,  $0074,  $0008   ; F15E   0049 0000 0074 0008
        DECLE   $01A0,  $03BA,  $0191,  $0000   ; F162   01A0 03BA 0191 0000
        DECLE   $01B2,  $023C                   ; F166   01B2 023C

        XOR@    R6,     R0                      ; F168   03F0
        CMP@    R5,     R4                      ; F169   036C
        PULR    R3                              ; F16A   02B3
        SUB     G_03CF, R0                      ; F16B   0300 03CF
        CMPR    R2,     R7                      ; F16D   0157
        MOVR    R2,     R0                      ; F16E   0090
        INCR    R5                              ; F16F   000D
        RRC     R0,     1                       ; F170   0070
        SUBR    R4,     R3                      ; F171   0123
        MOVR    R0,     R4                      ; F172   0084
        SETC                                    ; F173   0007
        SUB@    R1,     R7                      ; F174   030F

        DECLE   $0001,  $005C,  $00F8,  $003E   ; F175   0001 005C 00F8 003E
        DECLE   $0231,  $0054,  $0140,  $00C5   ; F179   0231 0054 0140 00C5
        DECLE   $01E0,  $021A,  $01D6,  $0234   ; F17D   01E0 021A 01D6 0234

        MVI@    R2,     R7                      ; F181   0297

        XOR     .BTAB.5D,R1                     ; F182   03C1 025D
        MVI@    R3,     R1                      ; F184   0299
        SLR     R1,     2                       ; F185   0065
        ADD@    R4,     R0                      ; F186   02E0
        INCR    R7                              ; F187   000F

        RRC     R0,     1                       ; F188   0070
L_F189:
        SUBR    R5,     R5                      ; F189   012D
        DECLE   $03A5,  $0120,  $038E,  $0047   ; F18A   03A5 0120 038E 0047
        DECLE   $02E4,  $0025,  $03FF,  $0003   ; F18E   02E4 0025 03FF 0003
        DECLE   $0000,  $012B,  $010D,  $00F3   ; F192   0000 012B 010D 00F3
        DECLE   $011D,  $034B,  $03BF,  $034E   ; F196   011D 034B 03BF 034E
        DECLE   $034C,  $0052,  $0081,  $0008   ; F19A   034C 0052 0081 0008
        DECLE   $0004,  $0289,  $01F2,  $0001   ; F19E   0004 0289 01F2 0001
        DECLE   $0200,  $01E7,  $0301,  $01E6   ; F1A2   0200 01E7 0301 01E6
        DECLE   $0089,  $028E,  $02A5,  $005F   ; F1A6   0089 028E 02A5 005F
        DECLE   $016F,  $0169,  $0069,  $0092   ; F1AA   016F 0169 0069 0092
        DECLE   $0303,  $03FF,  $0180,  $02E3   ; F1AE   0303 03FF 0180 02E3
        DECLE   $0354,  $028B,  $0262,  $01E7   ; F1B2   0354 028B 0262 01E7

        SARC    R3,     2                       ; F1B6   007F
        PULR    R7                              ; F1B7   02B7

        DECLE   $0369,  $03AE,  $0145,  $0321   ; F1B8   0369 03AE 0145 0321
        DECLE   $0313,  $0351,  $016A,  $026A   ; F1BC   0313 0351 016A 026A
        DECLE   $0080,  $0208,  $0282,  $0351   ; F1C0   0080 0208 0282 0351
        DECLE   $007C,  $03A0,  $02A2,  $03A8   ; F1C4   007C 03A0 02A2 03A8
        DECLE   $036A,  $02A0,  $01A5,  $023E   ; F1C8   036A 02A0 01A5 023E
        DECLE   $01AF,  $0199,  $01BC,  $01D9   ; F1CC   01AF 0199 01BC 01D9
        DECLE   $03CF                           ; F1D0   03CF

        AND     .STIC.X.0,R6                    ; F1D1   0386 0000
        RLC     R3,     2                       ; F1D3   0057
        ADDR    R7,     R0                      ; F1D4   00F8
        MOVR    R0,     R4                      ; F1D5   0084
        RLC     R2,     1                       ; F1D6   0052
        SUBR    R0,     R0                      ; F1D7   0100
        ADDR    R7,     R5                      ; F1D8   00FD
L_F1D9:
        XOR     .BTAB.4D,R0                     ; F1D9   03C0 024D
        DECLE   $0002,  $0288,  $00A8,  $0180   ; F1DB   0002 0288 00A8 0180
        DECLE   $03D3,  $003F,  $00C1,  $02D2   ; F1DF   03D3 003F 00C1 02D2
        DECLE   $005F,  $0203,  $02C2           ; F1E3   005F 0203 02C2

        SARC    R0,     2                       ; F1E6   007C
        SUB     G_0382, R3                      ; F1E7   0303 0382
        ADDR    R5,     R2                      ; F1E9   00EA
        ADD@    R3,     R6                      ; F1EA   02DE
        AND@    R5,     R1                      ; F1EB   03A9
        MVI@    R3,     R2                      ; F1EC   029A
        XORR    R0,     R1                      ; F1ED   01C1
        XOR     G_02FB, R1                      ; F1EE   03C1 02FB
        MVO@    R3,     R2                      ; F1F0   0253
        CMP@    R5,     R3                      ; F1F1   036B
        XOR@    R3,     R0                      ; F1F2   03D8
        MVO@    R5,     R1                      ; F1F3   024D
        ADD@    R6,     R0                      ; F1F4   02F0
        GSWD    R0                              ; F1F5   0030
        SUBI    #$02AA, R5                      ; F1F6   033D 02AA
        ANDR    R4,     R5                      ; F1F8   01A5
        CMPR    R3,     R6                      ; F1F9   015E
        ADDR    R0,     R7                      ; F1FA   00C7

        TSTR    R1                              ; F1FB   0089
        DECR    R6                              ; F1FC   0016
        ANDR    R2,     R5                      ; F1FD   0195
        SUB@    R2,     R4                      ; F1FE   0314
        ADDR    R4,     R6                      ; F1FF   00E6
        SAR     R3,     2                       ; F200   006F
L_F201:
        MVO@    R4,     R2                      ; F201   0254
        DECLE   $00CC,  $030B,  $03CD,  $01E6   ; F202   00CC 030B 03CD 01E6
        DECLE   $026D,  $027A,  $0172,  $0258   ; F206   026D 027A 0172 0258
        DECLE   $0189,  $01DF,  $02E4,  $0034   ; F20A   0189 01DF 02E4 0034
        DECLE   $019D,  $0089,  $002F,  $02C5   ; F20E   019D 0089 002F 02C5
        DECLE   $036E,  $0181,  $029B,  $031D   ; F212   036E 0181 029B 031D
        DECLE   $025C,  $0211,  $0182,  $0376   ; F216   025C 0211 0182 0376
        DECLE   $02C0,  $030C,  $01D6,  $0236   ; F21A   02C0 030C 01D6 0236
        DECLE   $018A,  $03C1,  $016A,  $02E4   ; F21E   018A 03C1 016A 02E4
        DECLE   $00C6,  $0121,  $019B,  $02C6   ; F222   00C6 0121 019B 02C6
        DECLE   $02E0,  $013D,  $006C,  $000E   ; F226   02E0 013D 006C 000E
        DECLE   $0000,  $004F,  $0110,  $0049   ; F22A   0000 004F 0110 0049
        DECLE   $0000                           ; F22E   0000

        MOVR    R1,     R4                      ; F22F   008C
        AND@    R5,     R0                      ; F230   03A8
        ANDR    R4,     R5                      ; F231   01A5
        XORR    R1,     R0                      ; F232   01C8
        XORR    R1,     R0                      ; F233   01C8
        SUBR    R3,     R0                      ; F234   0118
        AND@    R5,     R0                      ; F235   03A8
        CMP@    R6,     R5                      ; F236   0375
        ANDR    R7,     R6                      ; F237   01BE
        ADDR    R2,     R4                      ; F238   00D4
        XORR    R6,     R5                      ; F239   01F5
L_F23A:
        CMPR    R2,     R4                      ; F23A   0154
        DECLE   $0098,  $01CD,  $02BB,  $00A0   ; F23B   0098 01CD 02BB 00A0
        DECLE   $0328,  $03E8,  $00E1,  $03C1   ; F23F   0328 03E8 00E1 03C1
        DECLE   $03F7,  $006B,  $0336,  $00A9   ; F243   03F7 006B 0336 00A9
        DECLE   $0046,  $0263,  $02DD,  $004F   ; F247   0046 0263 02DD 004F
        DECLE   $0295,  $00F4,  $0008,  $01A0   ; F24B   0295 00F4 0008 01A0
        DECLE   $000C,  $0235,  $0359,  $0070   ; F24F   000C 0235 0359 0070
        DECLE   $0045,  $033E,  $0331,  $015A   ; F253   0045 033E 0331 015A
        DECLE   $039B,  $01C2,  $0006,  $028D   ; F257   039B 01C2 0006 028D
        DECLE   $03BA,  $0014,  $0118,  $023E   ; F25B   03BA 0014 0118 023E
        DECLE   $0211                           ; F25F   0211

        GSWD    R0                              ; F260   0030
        ANDR    R0,     R0                      ; F261   0180
        ADDR    R1,     R7                      ; F262   00CF

        XORI    #$0398, R3                      ; F263   03FB 0398
        SLLC    R0,     2                       ; F265   005C
        DECR    R1                              ; F266   0011
        MVI     .STIC.A.6,R0                    ; F267   0280 0016
        XOR@    R6,     R5                      ; F269   03F5
        SUB@    R4,     R1                      ; F26A   0321
        SUBR    R6,     R6                      ; F26B   0136
        SWAP    R2,     1                       ; F26C   0042
        SUBR    R0,     R0                      ; F26D   0100
        ADCR    R5                              ; F26E   002D
        INCR    R0                              ; F26F   0008
        BGT     L_F468                          ; F270   020E 01F6

        SLR     R0,     2                       ; F272   0064
        B       L_F2D8                          ; F273   0200 0063

        DECLE   $0015,  $005C,  $01DE,  $007D   ; F275   0015 005C 01DE 007D
        DECLE   $000E,  $0000                   ; F279   000E 0000

        SLL     R3,     1                       ; F27B   004B
        ADDR    R6,     R4                      ; F27C   00F4
        CMPR    R0,     R4                      ; F27D   0144
        MVO     R3,     .BTAB.49                ; F27E   0243 0249
        XORR    R0,     R3                      ; F280   01C3
        CMP@    R4,     R2                      ; F281   0362
        SUBR    R2,     R2                      ; F282   0112
        ADCR    R3                              ; F283   002B
        MVO@    R5,     R4                      ; F284   0265
        ANDR    R5,     R1                      ; F285   01A9
        SUB@    R4,     R1                      ; F286   0321
        ADDR    R4,     R2                      ; F287   00E2
        MVO@    R1,     R4                      ; F288   0261
        CMPR    R7,     R3                      ; F289   017B
        SUB     G_0341, R7                      ; F28A   0307 0341

        DECLE   $01BC,  $018F                   ; F28C   01BC 018F

        ANDR    R2,     R2                      ; F28E   0192
        RLC     R0,     2                       ; F28F   0054
        SUB@    R2,     R7                      ; F290   0317

        ANDR    R6,     R6                      ; F291   01B6
        ANDR    R6,     R5                      ; F292   01B5
        XOR@    R3,     R0                      ; F293   03D8
        MVI@    R4,     R7                      ; F294   02A7

        SUBR    R6,     R0                      ; F295   0130
        ANDR    R2,     R6                      ; F296   0196
        CMPR    R2,     R7                      ; F297   0157
        ANDR    R0,     R2                      ; F298   0182
        MVO@    R4,     R1                      ; F299   024C
        MVI     .PSG1.lft_hand,R3               ; F29A   0283 00FF
        AND@    R2,     R0                      ; F29C   0390
        SUBR    R0,     R1                      ; F29D   0101
        MVO@    R0,     R2                      ; F29E   0250
        ADDR    R6,     R0                      ; F29F   00F0
        RSWD    R0                              ; F2A0   0038
        AND     G_03F2, R0                      ; F2A1   0380 03F2
        ADDR    R1,     R3                      ; F2A3   00CB
        MVO@    R5,     R5                      ; F2A4   026D
        CMP@    R2,     R5                      ; F2A5   0355
        MOVR    R7,     R3                      ; F2A6   00BB
        MVII    #$02C9, R6                      ; F2A7   02BE 02C9
        ADDR    R4,     R1                      ; F2A9   00E1
        MVO@    R6,     R4                      ; F2AA   0266
        MOVR    R1,     R7                      ; F2AB   008F

        CMP@    R6,     R3                      ; F2AC   0373
        MVO@    R5,     R5                      ; F2AD   026D
        XORR    R4,     R3                      ; F2AE   01E3
        ADDR    R3,     R3                      ; F2AF   00DB
        RLC     R0,     1                       ; F2B0   0050
        SUB@    R6,     R3                      ; F2B1   0333
        ADD     G_03C9, R7                      ; F2B2   02C7 03C9

        DECLE   $0235,  $02F3,  $012D,  $0238   ; F2B4   0235 02F3 012D 0238

        XOR@    R1,     R1                      ; F2B8   03C9
        SLLC    R3,     2                       ; F2B9   005F
        ADD@    R4,     R3                      ; F2BA   02E3
        AND     G_006D, R5                      ; F2BB   0385 006D
        AND@    R3,     R2                      ; F2BD   039A
        SLLC    R3,     1                       ; F2BE   005B
        BPL     L_F5D3                          ; F2BF   0203 0312

        CMP@    R3,     R4                      ; F2C1   035C
        AND@    R6,     R6                      ; F2C2   03B6
        SUB@    R2,     R7                      ; F2C3   0317

        DECLE   $007F,  $000E,  $0000,  $0071   ; F2C4   007F 000E 0000 0071
        DECLE   $0110,  $0348,  $0000,  $0000   ; F2C8   0110 0348 0000 0000
        DECLE   $0000                           ; F2CC   0000

        SUBR    R3,     R0                      ; F2CD   0118
        COMR    R4                              ; F2CE   001C
        MVI@    R4,     R0                      ; F2CF   02A0
        AND@    R4,     R3                      ; F2D0   03A3
        XORR    R5,     R4                      ; F2D1   01EC
        CMPR    R5,     R5                      ; F2D2   016D
        B       L_F35D                          ; F2D3   0200 0088

        SUB@    R6,     R3                      ; F2D5   0333
        CMPI    #$0070, R1                      ; F2D6   0379 0070
L_F2D8:
        RSWD    R3                              ; F2D8   003B
        DECLE   $02BD,  $00B5,  $0362,  $0299   ; F2D9   02BD 00B5 0362 0299
        DECLE   $019C,  $0034,  $02A2,  $017D   ; F2DD   019C 0034 02A2 017D
        DECLE   $019A,  $02A5,  $01CC,  $00DE   ; F2E1   019A 02A5 01CC 00DE
        DECLE   $010B,  $0151,  $03AE,  $024C   ; F2E5   010B 0151 03AE 024C
        DECLE   $0158,  $02D2,  $000C,  $0047   ; F2E9   0158 02D2 000C 0047
        DECLE   $0000,  $010F,  $03F2,  $038C   ; F2ED   0000 010F 03F2 038C
        DECLE   $0078,  $0204,  $0179,  $0212   ; F2F1   0078 0204 0179 0212
        DECLE   $0085,  $01F6,  $0228           ; F2F5   0085 01F6 0228

        CMPR    R6,     R3                      ; F2F8   0173
        MVI     G_0055, R6                      ; F2F9   0286 0055
        SUBR    R0,     R6                      ; F2FB   0106
        XORR    R0,     R5                      ; F2FC   01C5
        ADD@    R4,     R7                      ; F2FD   02E7

        DECLE   $013E,  $00AD,  $02E3,  $0132   ; F2FE   013E 00AD 02E3 0132
        DECLE   $0045,  $02E2,  $01B3,  $00C3   ; F302   0045 02E2 01B3 00C3
        DECLE   $0275,  $0371,  $021A           ; F306   0275 0371 021A

        SWAP    R2,     1                       ; F309   0042
        CMP@    R6,     R1                      ; F30A   0371
        ADD@    R6,     R5                      ; F30B   02F5
        CMPR    R6,     R1                      ; F30C   0171
        SUBI    #$03D8, R2                      ; F30D   033A 03D8
        ADD@    R1,     R6                      ; F30F   02CE
        CMP     G_03D0, R0                      ; F310   0340 03D0
        AND@    R5,     R1                      ; F312   03A9
        MOVR    R6,     R5                      ; F313   00B5
        MOVR    R2,     R5                      ; F314   0095
        CMPR    R0,     R1                      ; F315   0141
        MOVR    R0,     R7                      ; F316   0087

        DECLE   $023D,  $0020,  $01A0,  $0276   ; F317   023D 0020 01A0 0276
        DECLE   $0089,  $0231                   ; F31B   0089 0231

        INCR    R4                              ; F31D   000C
        XORR    R3,     R6                      ; F31E   01DE
        MVI@    R2,     R7                      ; F31F   0297

        DECLE   $024A,  $006C,  $0004           ; F320   024A 006C 0004

        MVI@    R1,     R6                      ; F323   028E
        XOR@    R6,     R1                      ; F324   03F1
        ADDR    R2,     R7                      ; F325   00D7

        DECLE   $001E,  $0065,  $0174,  $01E1   ; F326   001E 0065 0174 01E1
        DECLE   $03B2,  $005F,  $01F0,  $0311   ; F32A   03B2 005F 01F0 0311
        DECLE   $0001,  $0086,  $024A,  $025E   ; F32E   0001 0086 024A 025E
        DECLE   $0014,  $0080,  $0246,  $03D1   ; F332   0014 0080 0246 03D1
        DECLE   $00F9,  $001C,  $0000,  $004D   ; F336   00F9 001C 0000 004D
        DECLE   $02F4,  $023F,  $0221,  $0030   ; F33A   02F4 023F 0221 0030
        DECLE   $0100,  $0086,  $000A,  $0292   ; F33E   0100 0086 000A 0292
        DECLE   $021B                           ; F342   021B

        ANDR    R6,     R0                      ; F343   01B0
        ADDR    R3,     R0                      ; F344   00D8
        CMPR    R0,     R7                      ; F345   0147
        SUBR    R3,     R0                      ; F346   0118
        INCR    R2                              ; F347   000A
        CMPR    R0,     R6                      ; F348   0146
        MVI     G_00DB, R1                      ; F349   0281 00DB
        CMP@    R6,     R4                      ; F34B   0374
        XORR    R2,     R3                      ; F34C   01D3
        ADDR    R2,     R4                      ; F34D   00D4
        SUBR    R0,     R6                      ; F34E   0106
        ADD@    R6,     R0                      ; F34F   02F0
        MOVR    R1,     R6                      ; F350   008E
        SUB@    R6,     R1                      ; F351   0331
        ANDI    #$000D, R3                      ; F352   03BB 000D
        RRC     R3,     2                       ; F354   0077
        ADD@    R2,     R7                      ; F355   02D7

        MVO@    R4,     R5                      ; F356   026C
        XOR@    R3,     R5                      ; F357   03DD
        SAR     R1,     1                       ; F358   0069
        SLLC    R2,     1                       ; F359   005A
        CMPR    R6,     R7                      ; F35A   0177
        PSHR    R2                              ; F35B   0272
        ADD@    R2,     R5                      ; F35C   02D5
L_F35D:
        MOVR    R2,     R6                      ; F35D   0096
        DECLE   $0394,  $03F8,  $0103,  $003C   ; F35E   0394 03F8 0103 003C
        DECLE   $0336,  $013B,  $0029,  $0124   ; F362   0336 013B 0029 0124
        DECLE   $00B9,  $033A,  $0162,  $021A   ; F366   00B9 033A 0162 021A
        DECLE   $02F4,  $0206,  $029D,  $037B   ; F36A   02F4 0206 029D 037B
        DECLE   $0394,  $01FF,  $03CD,  $0186   ; F36E   0394 01FF 03CD 0186
        DECLE   $0114,  $0346,  $00BD,  $03EB   ; F372   0114 0346 00BD 03EB
        DECLE   $0209,  $00E6,  $00D5,  $0109   ; F376   0209 00E6 00D5 0109
        DECLE   $0186,  $00E8,  $017E,  $016A   ; F37A   0186 00E8 017E 016A
        DECLE   $01E3,  $0063,  $02C1,  $03E2   ; F37E   01E3 0063 02C1 03E2
        DECLE   $032A,  $0022,  $0024,  $0007   ; F382   032A 0022 0024 0007
        DECLE   $0000,  $0060,  $0218,  $0089   ; F386   0000 0060 0218 0089
        DECLE   $0000,  $0074,  $0008,  $01A0   ; F38A   0000 0074 0008 01A0
        DECLE   $03BA,  $0391,  $0000,  $01B2   ; F38E   03BA 0391 0000 01B2
        DECLE   $023C                           ; F392   023C

        XOR@    R6,     R0                      ; F393   03F0
        CMP@    R5,     R4                      ; F394   036C
        AND@    R6,     R3                      ; F395   03B3
        SUB     G_03CF, R1                      ; F396   0301 03CF
        CMPR    R2,     R7                      ; F398   0157
        MOVR    R2,     R0                      ; F399   0090
        DECR    R5                              ; F39A   0015
        RRC     R0,     1                       ; F39B   0070
        SUBR    R4,     R3                      ; F39C   0123
        MOVR    R0,     R4                      ; F39D   0084
        SETC                                    ; F39E   0007
        MOVR    R0,     R7                      ; F39F   0087

        DECLE   $006A,  $0177,  $017A,  $0044   ; F3A0   006A 0177 017A 0044
        DECLE   $0187,  $035F,  $02E4,  $0195   ; F3A4   0187 035F 02E4 0195
        DECLE   $004E,  $01BF,  $0340,  $038F   ; F3A8   004E 01BF 0340 038F
        DECLE   $0336,  $0399,  $0024,  $0126   ; F3AC   0336 0399 0024 0126
        DECLE   $0205,  $03B0,  $0362,  $021A   ; F3B0   0205 03B0 0362 021A
        DECLE   $01BD,  $0048,  $0208,  $0383   ; F3B4   01BD 0048 0208 0383
        DECLE   $0376,  $02C0,  $02E5,  $0002   ; F3B8   0376 02C0 02E5 0002
        DECLE   $0092,  $003F                   ; F3BC   0092 003F

        ADD@    R6,     R5                      ; F3BE   02F5
        SUB@    R1,     R5                      ; F3BF   030D
        ADDR    R7,     R2                      ; F3C0   00FA
        BEQ     L_F23A                          ; F3C1   0224 0188

        AND@    R6,     R1                      ; F3C3   03B1
L_F3C4:
        SUBR    R7,     R2                      ; F3C4   013A
        DECLE   $0364,  $0186,  $0085,  $0112   ; F3C5   0364 0186 0085 0112
        DECLE   $02E5,  $02D0,  $00F5,  $01AF   ; F3C9   02E5 02D0 00F5 01AF
        DECLE   $0263,  $024E,  $02C6,  $0173   ; F3CD   0263 024E 02C6 0173
        DECLE   $02EC,  $0242,  $02F9,  $0329   ; F3D1   02EC 0242 02F9 0329
        DECLE   $02AE,  $02A1,  $0009,  $0174   ; F3D5   02AE 02A1 0009 0174
        DECLE   $03FF,  $014E,  $02A6,  $0382   ; F3D9   03FF 014E 02A6 0382
        DECLE   $01CF,  $0014,  $036E,  $0254   ; F3DD   01CF 0014 036E 0254
        DECLE   $02A0,  $00F1,  $0035,  $035A   ; F3E1   02A0 00F1 0035 035A
        DECLE   $002B,  $030D,  $0001           ; F3E5   002B 030D 0001

        SAR     R0,     1                       ; F3E8   0068
        SUB@    R2,     R0                      ; F3E9   0310
        CMPR    R1,     R4                      ; F3EA   014C
        ANDR    R2,     R5                      ; F3EB   0195
        SUBR    R5,     R3                      ; F3EC   012B
        ADDR    R0,     R6                      ; F3ED   00C6
        SARC    R2,     2                       ; F3EE   007E
        SUBR    R7,     R5                      ; F3EF   013D
        CMPR    R4,     R4                      ; F3F0   0164
        ADDR    R0,     R6                      ; F3F1   00C6
        MOVR    R4,     R3                      ; F3F2   00A3
        ADD@    R6,     R7                      ; F3F3   02F7

        DECLE   $02C4,  $01DE,  $0035           ; F3F4   02C4 01DE 0035

        MOVR    R1,     R0                      ; F3F7   0088
        ADD@    R4,     R3                      ; F3F8   02E3
        CMPR    R0,     R2                      ; F3F9   0142
        ADDI    #$0172, R7                      ; F3FA   02FF 0172
        ADD@    R6,     R7                      ; F3FC   02F7

        DECLE   $021A,  $0263,  $01B9,  $029B   ; F3FD   021A 0263 01B9 029B
        DECLE   $0264,  $0021,  $027C,  $016D   ; F401   0264 0021 027C 016D
        DECLE   $014B,  $0252,  $0013,  $0009   ; F405   014B 0252 0013 0009
        DECLE   $0247,  $0342,  $02EC,  $034A   ; F409   0247 0342 02EC 034A
        DECLE   $03C2,  $0014,  $035B,  $03B8   ; F40D   03C2 0014 035B 03B8
        DECLE   $00AD,  $03E1,  $0188,  $0007   ; F411   00AD 03E1 0188 0007
        DECLE   $017E,  $00A8,  $0001,  $027F   ; F415   017E 00A8 0001 027F
        DECLE   $001C,  $0064,  $00B0,  $0041   ; F419   001C 0064 00B0 0041
        DECLE   $0209,  $0103,  $0120,  $00A8   ; F41D   0209 0103 0120 00A8
        DECLE   $00C1,  $00F5,  $0001,  $0020   ; F421   00C1 00F5 0001 0020
        DECLE   $01A8,  $02F6,  $03C6,  $00C9   ; F425   01A8 02F6 03C6 00C9
        DECLE   $000A,  $01BE,  $03D7           ; F429   000A 01BE 03D7

        ADDR    R2,     R6                      ; F42C   00D6
        ADD@    R6,     R6                      ; F42D   02F6
        ANDR    R4,     R3                      ; F42E   01A3
        ADDR    R7,     R0                      ; F42F   00F8
        ADDR    R7,     R5                      ; F430   00FD
        ADD@    R4,     R3                      ; F431   02E3
        ANDR    R5,     R6                      ; F432   01AE
        SUB@    R5,     R3                      ; F433   032B
        GSWD    R0                              ; F434   0030
        RRC     R2,     1                       ; F435   0072
        CLRR    R0                              ; F436   01C0
L_F437:
        XOR@    R5,     R0                      ; F437   03E8
        DECLE   $012B,  $0242,  $0060,  $0048   ; F438   012B 0242 0060 0048
        DECLE   $0319,  $012B,  $0166,  $0000   ; F43C   0319 012B 0166 0000
        DECLE   $03C0,  $0380,  $026D,  $013A   ; F440   03C0 0380 026D 013A
        DECLE   $0123,  $008C,  $0106,  $027B   ; F444   0123 008C 0106 027B
        DECLE   $0286,  $0311,  $01BF,  $0052   ; F448   0286 0311 01BF 0052
        DECLE   $0000,  $0142,  $0364,  $01C3   ; F44C   0000 0142 0364 01C3
        DECLE   $0000,  $007D,  $00F4,  $0104   ; F450   0000 007D 00F4 0104
        DECLE   $0143,  $0039,  $0285,  $02C2   ; F454   0143 0039 0285 02C2
        DECLE   $0363,  $01C6,  $027F,  $0137   ; F458   0363 01C6 027F 0137

        COMR    R0                              ; F45C   0018
        MVI     G_03E3, R0                      ; F45D   0280 03E3
        INCR    R4                              ; F45F   000C
        CMPR    R1,     R5                      ; F460   014D
        ADDR    R1,     R7                      ; F461   00CF

        DECLE   $031C,  $0110,  $02A0,  $039E   ; F462   031C 0110 02A0 039E
        DECLE   $024E,  $0232                   ; F466   024E 0232
L_F468:
        INCR    R6                              ; F468   000E
        DECLE   $0037,  $0004,  $021F,  $02C6   ; F469   0037 0004 021F 02C6
        DECLE   $0261,  $0182,  $00A3,  $036F   ; F46D   0261 0182 00A3 036F
        DECLE   $0005,  $0105,  $03B3,  $0130   ; F471   0005 0105 03B3 0130
        DECLE   $0302,  $0052,  $022C,  $02C3   ; F475   0302 0052 022C 02C3
        DECLE   $0297,  $0084,  $0000,  $0000   ; F479   0297 0084 0000 0000
        DECLE   $020F,  $0283,  $0204,  $001C   ; F47D   020F 0283 0204 001C
        DECLE   $0000                           ; F481   0000

        SUB     .BTAB.81,R0                     ; F482   0300 0281
        XORR    R3,     R1                      ; F484   01D9
        SUBR    R3,     R7                      ; F485   011F

        SWAP    R1,     2                       ; F486   0045
        ADCR    R1                              ; F487   0029
        CMP@    R3,     R0                      ; F488   0358
        CMP@    R1,     R5                      ; F489   034D
        AND@    R1,     R3                      ; F48A   038B
        CMP     .STIC.A.0,R3                    ; F48B   0343 0010
        ADDR    R6,     R1                      ; F48D   00F1
        ANDR    R0,     R4                      ; F48E   0184
        XORR    R2,     R3                      ; F48F   01D3
        CMPR    R1,     R1                      ; F490   0149
        MOVR    R0,     R3                      ; F491   0083
        MVO@    R3,     R4                      ; F492   0263
        BMI     L_F758                          ; F493   020B 02C3

        PULR    R4                              ; F495   02B4
        MVI@    R5,     R1                      ; F496   02A9
        BGT     L_F437                          ; F497   022E 0061

        ADD@    R4,     R2                      ; F499   02E2
        AND     G_0059, R3                      ; F49A   0383 0059
        CMP@    R3,     R2                      ; F49C   035A
        CMPR    R7,     R0                      ; F49D   0178
        SUB@    R2,     R7                      ; F49E   0317

        DECLE   $0331,  $037C,  $029C,  $02FC   ; F49F   0331 037C 029C 02FC
        DECLE   $009F,  $01FD,  $0270,  $01DE   ; F4A3   009F 01FD 0270 01DE
        DECLE   $03BE,  $03BB,  $0245,  $0000   ; F4A7   03BE 03BB 0245 0000
        DECLE   $00C0,  $03B6,  $013F,  $01E3   ; F4AB   00C0 03B6 013F 01E3
        DECLE   $0080,  $00C3,  $0072,  $02BB   ; F4AF   0080 00C3 0072 02BB
        DECLE   $01EE,  $0262,  $0331,  $0247   ; F4B3   01EE 0262 0331 0247
        DECLE   $0144,  $0021,  $0258,  $0065   ; F4B7   0144 0021 0258 0065
        DECLE   $035B,  $037C,  $011F,  $0220   ; F4BB   035B 037C 011F 0220
        DECLE   $0358,  $02EC,  $0304,  $03D8   ; F4BF   0358 02EC 0304 03D8
        DECLE   $0247,  $0000,  $0340,  $03D6   ; F4C3   0247 0000 0340 03D6
        DECLE   $0040,  $0231,  $001C,  $0240   ; F4C7   0040 0231 001C 0240
        DECLE   $004C,  $0228,  $0070,  $0000   ; F4CB   004C 0228 0070 0000

        RSWD    R5                              ; F4CF   003D
        ADDR    R6,     R4                      ; F4D0   00F4
        CMPR    R0,     R4                      ; F4D1   0144
        CMPR    R0,     R3                      ; F4D2   0143
        SUBI    #$02FC, R7                      ; F4D3   033F 02FC

        DECLE   $00E2,  $0177,  $03FE,  $02A3   ; F4D5   00E2 0177 03FE 02A3
        DECLE   $0394,  $0306,  $0001,  $0000   ; F4D9   0394 0306 0001 0000

        MVII    #$0331, R4                      ; F4DD   02BC 0331
        MVI@    R3,     R1                      ; F4DF   0299
        CMP@    R3,     R7                      ; F4E0   035F
        ADD@    R6,     R0                      ; F4E1   02F0
        SUBR    R7,     R1                      ; F4E2   0139
        SUBR    R0,     R1                      ; F4E3   0101
        CMP@    R3,     R7                      ; F4E4   035F
        ANDR    R7,     R0                      ; F4E5   01B8
        SUBR    R1,     R4                      ; F4E6   010C
        MVO     R0,     G_0394                  ; F4E7   0240 0394
        MVI@    R5,     R4                      ; F4E9   02AC
        B       L_F69B                          ; F4EA   0200 01AF

        CMPR    R3,     R2                      ; F4EC   015A
        ADDR    R0,     R6                      ; F4ED   00C6
        SUBR    R4,     R0                      ; F4EE   0120
        ANDR    R7,     R4                      ; F4EF   01BC
        XOR@    R4,     R0                      ; F4F0   03E0
        MVI@    R3,     R1                      ; F4F1   0299
        ADDR    R2,     R6                      ; F4F2   00D6
        ADD@    R5,     R5                      ; F4F3   02ED
        ADDR    R2,     R3                      ; F4F4   00D3
        MOVR    R6,     R4                      ; F4F5   00B4
        XORR    R1,     R6                      ; F4F6   01CE
        MOVR    R5,     R7                      ; F4F7   00AF

        DECLE   $03C0,  $026B,  $01F6,  $0062   ; F4F8   03C0 026B 01F6 0062
        DECLE   $0248,  $02E3,  $02D5,  $002F   ; F4FC   0248 02E3 02D5 002F
        DECLE   $0035,  $0059,  $0036,  $0223   ; F500   0035 0059 0036 0223
        DECLE   $032F,  $016A,  $0240,  $0208   ; F504   032F 016A 0240 0208
        DECLE   $021E,  $0086,  $0000,  $00E1   ; F508   021E 0086 0000 00E1
        DECLE   $0000,  $010B,  $00F8,  $0086   ; F50C   0000 010B 00F8 0086
        DECLE   $0062,  $0000,  $0232,  $03E8   ; F510   0062 0000 0232 03E8
        DECLE   $0251,  $01E9,  $029E,  $0379   ; F514   0251 01E9 029E 0379
        DECLE   $02A4,  $0080,  $0229,  $0356   ; F518   02A4 0080 0229 0356
        DECLE   $0025,  $007D,  $02ED,  $0332   ; F51C   0025 007D 02ED 0332
        DECLE   $000E,  $0011,  $0024,  $0251   ; F520   000E 0011 0024 0251
        DECLE   $02FA,  $01D8,  $01AD,  $02B6   ; F524   02FA 01D8 01AD 02B6
        DECLE   $03D9,  $021E,  $0080,  $01E1   ; F528   03D9 021E 0080 01E1
        DECLE   $0356,  $0303,  $00CE,  $02F1   ; F52C   0356 0303 00CE 02F1
        DECLE   $0333,  $038D,  $0014,  $0125   ; F530   0333 038D 0014 0125
        DECLE   $024F,  $027A                   ; F534   024F 027A

        XORR    R1,     R0                      ; F536   01C8
        SUBR    R4,     R4                      ; F537   0124
        ADD@    R2,     R7                      ; F538   02D7

        DECLE   $03B1,  $029B,  $00A0,  $01F1   ; F539   03B1 029B 00A0 01F1
        DECLE   $0376,  $0323,  $011D,  $02BD   ; F53D   0376 0323 011D 02BD
        DECLE   $0294,  $0003,  $0000,  $02C0   ; F541   0294 0003 0000 02C0
        DECLE   $0034,  $039F,  $0332,  $0319   ; F545   0034 039F 0332 0319
        DECLE   $0018,  $0035,  $018F           ; F549   0018 0035 018F

        CMPI    #$0391, R6                      ; F54C   037E 0391
        ADCR    R6                              ; F54E   002E
        PSHR    R4                              ; F54F   0274
        SUB@    R4,     R1                      ; F550   0321
        SUB@    R3,     R7                      ; F551   031F

        DECLE   $0320,  $01E8,  $0388,  $012B   ; F552   0320 01E8 0388 012B
        DECLE   $023D,  $0271,  $0395,  $0066   ; F556   023D 0271 0395 0066
        DECLE   $0008,  $00C4,  $00B0,  $0387   ; F55A   0008 00C4 00B0 0387

        SUB@    R6,     R2                      ; F55E   0332
        AND@    R2,     R5                      ; F55F   0395
        XORI    #$0001, R0                      ; F560   03F8 0001
        CMPR    R1,     R7                      ; F562   014F
        SUB@    R6,     R6                      ; F563   0336
        INCR    R7                              ; F564   000F

        DECLE   $03AF                           ; F565   03AF
L_F566:
        MVO@    R3,     R2                      ; F566   0253
        MOVR    R0,     R7                      ; F567   0087

        DECLE   $0242,  $000A,  $0000,  $0000   ; F568   0242 000A 0000 0000

        B       L_F89F                          ; F56C   0200 0331

L_F56E:
        MOVR    R7,     R4                      ; F56E   00BC
        ANDR    R1,     R6                      ; F56F   018E
        ADDI    #$0118, R7                      ; F570   02FF 0118

        DECLE   $03C3,  $03AB,  $0316,  $0340   ; F572   03C3 03AB 0316 0340
        DECLE   $02C9,  $003C,  $00FC,  $007E   ; F576   02C9 003C 00FC 007E
        DECLE   $03E8,  $003F,  $0219,  $01B6   ; F57A   03E8 003F 0219 01B6
        DECLE   $03F2,  $0392,  $03A8,  $02BD   ; F57E   03F2 0392 03A8 02BD
        DECLE   $03CD,  $0158,  $033A,  $00B8   ; F582   03CD 0158 033A 00B8
        DECLE   $038E,  $024E,  $00F8,  $03D1   ; F586   038E 024E 00F8 03D1
        DECLE   $01B3,  $0306,  $034E,  $0219   ; F58A   01B3 0306 034E 0219
        DECLE   $01BD,  $03DE,  $038E,  $03C7   ; F58E   01BD 03DE 038E 03C7
        DECLE   $0018,  $03F8,  $0157,  $012A   ; F592   0018 03F8 0157 012A
        DECLE   $03A6,  $0371,  $0038,  $0003   ; F596   03A6 0371 0038 0003
        DECLE   $01C0,  $0330,  $0278,  $024D   ; F59A   01C0 0330 0278 024D
        DECLE   $0350,  $0020,  $038E,  $0032   ; F59E   0350 0020 038E 0032
        DECLE   $02FE,  $0140,  $031A,  $01B3   ; F5A2   02FE 0140 031A 01B3
        DECLE   $0036                           ; F5A6   0036

        ANDR    R0,     R4                      ; F5A7   0184
        ANDR    R0,     R6                      ; F5A8   0186
        CMP@    R3,     R4                      ; F5A9   035C
        ANDI    #$025A, R5                      ; F5AA   03BD 025A
        SUBI    #$0378, R1                      ; F5AC   0339 0378
        ANDR    R1,     R4                      ; F5AE   018C
        MOVR    R7,     R6                      ; F5AF   00BE
        ADDR    R6,     R0                      ; F5B0   00F0
        ADDI    #$0200, R7                      ; F5B1   02FF 0200

        DECLE   $0378,  $0330,  $031A,  $018C   ; F5B3   0378 0330 031A 018C
        DECLE   $0008,  $0027,  $0382,  $039C   ; F5B7   0008 0027 0382 039C
        DECLE   $01C1,  $02DB,  $0349,  $03B4   ; F5BB   01C1 02DB 0349 03B4
        DECLE   $02CB,  $0090,  $0118,  $03BC   ; F5BF   02CB 0090 0118 03BC
        DECLE   $003B,  $0336,  $0342,  $0319   ; F5C3   003B 0336 0342 0319
        DECLE   $0185,  $03FE,  $030E,  $01E8   ; F5C7   0185 03FE 030E 01E8
        DECLE   $0018,  $02FC,  $0059,  $017A   ; F5CB   0018 02FC 0059 017A
        DECLE   $0102,  $000E,  $01B1,  $0000   ; F5CF   0102 000E 01B1 0000
L_F5D3:
        MVO@    R0,     R2                      ; F5D3   0250
        DECLE   $014E,  $033A,  $0393,  $03F8   ; F5D4   014E 033A 0393 03F8
        DECLE   $0003,  $0210,  $034F,  $0298   ; F5D8   0003 0210 034F 0298
        DECLE   $014C,  $01C0,  $00FC,  $030E   ; F5DC   014C 01C0 00FC 030E
        DECLE   $0380,  $03A7,  $012C,  $029A   ; F5E0   0380 03A7 012C 029A
        DECLE   $019C,  $000C,  $038E,  $0207   ; F5E4   019C 000C 038E 0207
        DECLE   $02BF,  $03BD,  $00DD,  $0149   ; F5E8   02BF 03BD 00DD 0149
        DECLE   $00BE,  $0082,  $0001,  $0340   ; F5EC   00BE 0082 0001 0340
        DECLE   $03DF,  $0340,  $017C,  $018E   ; F5F0   03DF 0340 017C 018E
        DECLE   $0250,  $011C,  $02DE,  $007E   ; F5F4   0250 011C 02DE 007E
        DECLE   $0390,  $0126,  $02CA,  $0214   ; F5F8   0390 0126 02CA 0214
        DECLE   $0000,  $0310,  $0063,  $0059   ; F5FC   0000 0310 0063 0059
        DECLE   $0399,  $024B,  $024A,  $0023   ; F600   0399 024B 024A 0023
        DECLE   $03A2,  $02C0,  $02AD,  $01D9   ; F604   03A2 02C0 02AD 01D9
        DECLE   $0359,  $0078,  $0396,  $0240   ; F608   0359 0078 0396 0240
        DECLE   $011C,  $02AE,  $0201,  $0340   ; F60C   011C 02AE 0201 0340
        DECLE   $012C,  $034B,  $001F,  $0004   ; F610   012C 034B 001F 0004
        DECLE   $00E0,  $003E,  $03E1,  $0070   ; F614   00E0 003E 03E1 0070
        DECLE   $0000,  $0038,  $00FE,  $0084   ; F618   0000 0038 00FE 0084
        DECLE   $00C2,  $0000                   ; F61C   00C2 0000

        CLRC                                    ; F61E   0006
        AND     .BTAB.6B,R1                     ; F61F   0381 026B
        CMPR    R7,     R6                      ; F621   017E
        SAR     R1,     1                       ; F622   0069
        MVO@    R4,     R5                      ; F623   026C
        CLRR    R6                              ; F624   01F6
        ADD@    R2,     R7                      ; F625   02D7
        ADCR    R7                              ; F626   002F

        SUB@    R6,     R5                      ; F627   0335
L_F628:
        ADD@    R1,     R6                      ; F628   02CE
        DECLE   $00D0,  $0122,  $02C1,  $033B   ; F629   00D0 0122 02C1 033B
        DECLE   $015A,  $004B,  $03C8,  $0067   ; F62D   015A 004B 03C8 0067
        DECLE   $0070,  $01E0,  $02FC,  $02E4   ; F631   0070 01E0 02FC 02E4
        DECLE   $0000,  $001C,  $0298,  $03E3   ; F635   0000 001C 0298 03E3
        DECLE   $0123,  $0001,  $0218           ; F639   0123 0001 0218

        PSHR    R0                              ; F63C   0270
        CMPR    R7,     R7                      ; F63D   017F
        MOVR    R7,     R1                      ; F63E   00B9
        B       L_F751                          ; F63F   0200 0110

        DECLE   $0013,  $0335,  $0319,  $0099   ; F641   0013 0335 0319 0099
        DECLE   $0132,  $02BB,  $00B8,  $0343   ; F645   0132 02BB 00B8 0343
        DECLE   $0319,  $0104,  $0267,  $010C   ; F649   0319 0104 0267 010C
        DECLE   $019F,  $023B,  $01A5,  $0038   ; F64D   019F 023B 01A5 0038
        DECLE   $0000                           ; F651   0000

        INCR    R7                              ; F652   000F

        SUB@    R2,     R0                      ; F653   0310
L_F654:
        XORR    R1,     R4                      ; F654   01CC
        SUBR    R6,     R3                      ; F655   0133
        ADCR    R5                              ; F656   002D
        AND@    R1,     R5                      ; F657   038D
        ADDR    R2,     R0                      ; F658   00D0
        CMPI    #$03D6, R5                      ; F659   037D 03D6
        TSTR    R2                              ; F65B   0092
        SARC    R1,     2                       ; F65C   007D
        B       L_F8BE                          ; F65D   0200 025F

        DECLE   $0081,  $001C,  $0000,  $0088   ; F65F   0081 001C 0000 0088
        DECLE   $0110,  $030E,  $014E,  $02B6   ; F663   0110 030E 014E 02B6
        DECLE   $03B1,  $00B0,  $0002,  $0380   ; F667   03B1 00B0 0002 0380
        DECLE   $00F4,  $02A5,  $018A,  $0370   ; F66B   00F4 02A5 018A 0370
        DECLE   $019D,  $0114,  $02E5,  $0336   ; F66F   019D 0114 02E5 0336
        DECLE   $00C0,  $013D,  $02A8,  $03E6   ; F673   00C0 013D 02A8 03E6
        DECLE   $02A3,  $03E5,  $0354,  $01EC   ; F677   02A3 03E5 0354 01EC
        DECLE   $0353,  $0274,  $02E8,  $017F   ; F67B   0353 0274 02E8 017F
        DECLE   $02FA,  $0050,  $03E5,  $03AF   ; F67F   02FA 0050 03E5 03AF

        ADDR    R3,     R6                      ; F683   00DE
        ADD@    R5,     R2                      ; F684   02EA
        SUBR    R5,     R2                      ; F685   012A
        AND@    R5,     R2                      ; F686   03AA
        MVI@    R1,     R6                      ; F687   028E
        AND@    R3,     R2                      ; F688   039A
        SUBR    R2,     R3                      ; F689   0113
L_F68A:
        AND@    R6,     R5                      ; F68A   03B5
        DECLE   $02B1,  $02B6,  $0059,  $03A8   ; F68B   02B1 02B6 0059 03A8
        DECLE   $00E9,  $0155,  $027B,  $01A7   ; F68F   00E9 0155 027B 01A7

        MVI@    R3,     R7                      ; F693   029F

        MOVR    R2,     R1                      ; F694   0091
        MVO     R2,     G_0167                  ; F695   0242 0167
        MOVR    R7,     R6                      ; F697   00BE
        PSHR    R2                              ; F698   0272
        XORR    R2,     R3                      ; F699   01D3
        MVO@    R7,     R1                      ; F69A   024F
L_F69B:
        ANDR    R5,     R1                      ; F69B   01A9
        DECLE   $02ED,  $022F,  $0000,  $0320   ; F69C   02ED 022F 0000 0320
        DECLE   $0331,  $0027,  $0041,  $0391   ; F6A0   0331 0027 0041 0391
        DECLE   $0275,  $0027,  $037D,  $0170   ; F6A4   0275 0027 037D 0170
        DECLE   $0393,  $00EA,  $03BB,  $008B   ; F6A8   0393 00EA 03BB 008B
        DECLE   $0000                           ; F6AC   0000

        XOR@    R1,     R0                      ; F6AD   03C8
        AND@    R5,     R4                      ; F6AE   03AC
        ADDR    R1,     R1                      ; F6AF   00C9
        TSTR    R5                              ; F6B0   00AD
        MVI@    R5,     R0                      ; F6B1   02A8
        MVO@    R6,     R4                      ; F6B2   0266
        XORR    R6,     R3                      ; F6B3   01F3
        ADDR    R1,     R7                      ; F6B4   00CF

        AND@    R2,     R5                      ; F6B5   0395
        CMPR    R3,     R4                      ; F6B6   015C
L_F6B7:
        MOVR    R2,     R3                      ; F6B7   0093
        DECLE   $03B1,  $03C4,  $033B,  $01A9   ; F6B8   03B1 03C4 033B 01A9
        DECLE   $01A5,  $03AE,  $00C9,  $02B5   ; F6BC   01A5 03AE 00C9 02B5
        DECLE   $020D,  $0045,  $0000           ; F6C0   020D 0045 0000

        ADDR    R2,     R4                      ; F6C3   00D4
        ADDR    R2,     R7                      ; F6C4   00D7

        DECLE   $0135,  $00C8,  $03F8,  $01D2   ; F6C5   0135 00C8 03F8 01D2
        DECLE   $012C,  $0073,  $016E,  $0172   ; F6C9   012C 0073 016E 0172
        DECLE   $019D,  $018B,  $0011,  $0000   ; F6CD   019D 018B 0011 0000

        ANDR    R5,     R0                      ; F6D1   01A8
        ADDR    R4,     R5                      ; F6D2   00E5
        ADDR    R2,     R1                      ; F6D3   00D1
        SUBR    R0,     R7                      ; F6D4   0107
        ADD     .BTAB.9E,R7                     ; F6D5   02C7 029E

        DECLE   $0185,  $0046,  $0257,  $03FD   ; F6D7   0185 0046 0257 03FD
        DECLE   $023E,  $0153,  $0252,  $00C2   ; F6DB   023E 0153 0252 00C2
        DECLE   $0233                           ; F6DF   0233

        PULR    R3                              ; F6E0   02B3
        XORR    R3,     R2                      ; F6E1   01DA
        ADD@    R4,     R0                      ; F6E2   02E0
        MOVR    R5,     R1                      ; F6E3   00A9
        ANDR    R5,     R0                      ; F6E4   01A8
        SLR     R2,     1                       ; F6E5   0062
        CMP@    R3,     R2                      ; F6E6   035A
        CMPR    R2,     R7                      ; F6E7   0157
        SUB     .BTAB.1E,R1                     ; F6E8   0301 021E
        DIS                                     ; F6EA   0003
        ADDR    R0,     R4                      ; F6EB   00C4
L_F6EC:
        SUB@    R3,     R0                      ; F6EC   0318
        DECLE   $0348,  $0001,  $00C9,  $039C   ; F6ED   0348 0001 00C9 039C
        DECLE   $038F,  $0368,  $0391,  $0003   ; F6F1   038F 0368 0391 0003
        DECLE   $016C,  $0340,  $01DF,  $02F5   ; F6F5   016C 0340 01DF 02F5
        DECLE   $0122,  $0009,  $02DC,  $0070   ; F6F9   0122 0009 02DC 0070
        DECLE   $0000,  $0222,  $0167,  $0203   ; F6FD   0000 0222 0167 0203
        DECLE   $01E6,  $0390,  $0112,  $004C   ; F701   01E6 0390 0112 004C
        DECLE   $00C0,  $0305,  $0100,  $0014   ; F705   00C0 0305 0100 0014
        DECLE   $022C,  $0098,  $0200,  $014C   ; F709   022C 0098 0200 014C

        BOV     L_F8C6                          ; F70D   0202 01B7

        RLC     R2,     2                       ; F70F   0056
        ADDR    R6,     R1                      ; F710   00F1
        AND     G_0110, R0                      ; F711   0380 0110
        JE      L_50AF                          ; F713   0004 0351 00AF

        DECLE   $0262,  $0000                   ; F716   0262 0000

        SUBR    R4,     R6                      ; F718   0126
        XOR@    R5,     R1                      ; F719   03E9
        MOVR    R7,     R1                      ; F71A   00B9
        CMPR    R3,     R5                      ; F71B   015D
        XOR     .BTAB.00,R4                     ; F71C   03C4 0200
        SLL     R0,     2                       ; F71E   004C
        XOR@    R1,     R3                      ; F71F   03CB
        SUBR    R0,     R3                      ; F720   0103
        ADD     G_0108, R6                      ; F721   02C6 0108
        EIS                                     ; F723   0002
        MOVR    R0,     R3                      ; F724   0083
        SUBR    R4,     R7                      ; F725   0127

        DECLE   $0378,  $036E,  $0290,  $0002   ; F726   0378 036E 0290 0002
        DECLE   $0190,  $034C,  $0180,  $02D5   ; F72A   0190 034C 0180 02D5
        DECLE   $0023,  $000B,  $02E0,  $027C   ; F72E   0023 000B 02E0 027C
        DECLE   $001F                           ; F732   001F

        CLRR    R3                              ; F733   01DB
        MVO     R5,     .STIC.A.3               ; F734   0245 0013
        CMPR    R0,     R0                      ; F736   0140
        SUBR    R1,     R1                      ; F737   0109
        CMPR    R0,     R0                      ; F738   0140
        SUB@    R4,     R7                      ; F739   0327

        MOVR    R1,     R6                      ; F73A   008E
        NEGR    R6                              ; F73B   0026
        CMPR    R6,     R0                      ; F73C   0170
        XORR    R6,     R2                      ; F73D   01F2
        MVI     G_0068, R4                      ; F73E   0284 0068
        SUBR    R5,     R6                      ; F740   012E
        COMR    R6                              ; F741   001E
        ADD@    R4,     R0                      ; F742   02E0
        AND@    R4,     R4                      ; F743   03A4
        XORI    #$0312, R4                      ; F744   03FC 0312
        BMI     L_F6B7                          ; F746   022B 0090

        CLRR    R0                              ; F748   01C0
        ANDR    R1,     R3                      ; F749   018B
        XORR    R7,     R1                      ; F74A   01F9
        NEGR    R6                              ; F74B   0026
        SLLC    R0,     1                       ; F74C   0058
        CMPR    R5,     R1                      ; F74D   0169
        AND     G_0116, R0                      ; F74E   0380 0116
        DECR    R2                              ; F750   0012
L_F751:
        CMPR    R1,     R1                      ; F751   0149
        DECLE   $00B0,  $02E2,  $0200,  $011D   ; F752   00B0 02E2 0200 011D

        SWAP    R2,     2                       ; F756   0046
        ADD@    R2,     R6                      ; F757   02D6
L_F758:
        XORR    R3,     R1                      ; F758   01D9
        DECLE   $00C4,  $0001                   ; F759   00C4 0001

        SAR     R0,     2                       ; F75B   006C
        INCR    R7                              ; F75C   000F

        CMPR    R5,     R4                      ; F75D   016C
L_F75E:
        MVII    #$0308, R1                      ; F75E   02B9 0308
        DECLE   $0001,  $005C,  $02FF,  $0268   ; F760   0001 005C 02FF 0268
        DECLE   $0382,  $0211,  $0004           ; F764   0382 0211 0004

        SUBR    R5,     R4                      ; F767   012C
        SUBI    #$00FF, R2                      ; F768   033A 00FF
        ADDI    #$0022, R5                      ; F76A   02FD 0022
        INCR    R3                              ; F76C   000B
        CMP@    R4,     R0                      ; F76D   0360
        SARC    R0,     2                       ; F76E   007C
        XOR@    R4,     R1                      ; F76F   03E1
        XORR    R3,     R2                      ; F770   01DA
        MVO     R7,     .STIC.A.3               ; F771   0247 0013
        SUBR    R6,     R0                      ; F773   0130
        SUBR    R2,     R1                      ; F774   0111
        ANDR    R0,     R2                      ; F775   0182
        SUB@    R4,     R7                      ; F776   0327

        MOVR    R1,     R2                      ; F777   008A
        NEGR    R5                              ; F778   0025
        MVO@    R0,     R4                      ; F779   0260
        CMPR    R0,     R1                      ; F77A   0141
        ANDR    R0,     R6                      ; F77B   0186
        ADDR    R5,     R0                      ; F77C   00E8
        SUBR    R2,     R6                      ; F77D   0116
        RSWD    R4                              ; F77E   003C
        SUBR    R4,     R0                      ; F77F   0120
        CMPR    R4,     R4                      ; F780   0164
        ADDR    R7,     R5                      ; F781   00FD
        AND@    R2,     R5                      ; F782   0395
        BMI     L_F6EC                          ; F783   022B 0098

        TSTR    R0                              ; F785   0080
        SUB@    R1,     R0                      ; F786   0308
        INCR    R1                              ; F787   0009
        SUB@    R5,     R2                      ; F788   032A
        RRC     R3,     2                       ; F789   0077
        SUBR    R5,     R1                      ; F78A   0129
        ANDR    R0,     R0                      ; F78B   0180
        SUBR    R1,     R2                      ; F78C   010A
        SWAP    R3,     1                       ; F78D   0043
        SAR     R3,     2                       ; F78E   006F
        TSTR    R5                              ; F78F   00AD
        CMPR    R2,     R2                      ; F790   0152
        SUB     .BTAB.10,R0                     ; F791   0300 0210
        SWAP    R2,     2                       ; F793   0046
        MOVR    R3,     R0                      ; F794   0098
        XORR    R3,     R5                      ; F795   01DD
        XOR@    R4,     R4                      ; F796   03E4
        B       L_F9E3                          ; F797   0200 024A

        DECLE   $000A,  $0104,  $03C1,  $0308   ; F799   000A 0104 03C1 0308
        DECLE   $0001,  $0097,  $0326,  $03E7   ; F79D   0001 0097 0326 03E7

        CMPR    R3,     R4                      ; F7A1   015C
        SUB@    R2,     R2                      ; F7A2   0312
        DIS                                     ; F7A3   0003
        ADDR    R1,     R4                      ; F7A4   00CC
        RSWD    R0                              ; F7A5   0038
        MOVR    R4,     R0                      ; F7A6   00A0
        SUB@    R1,     R1                      ; F7A7   0309
L_F7A8:
        BPL     L_F7A8                          ; F7A8   0223 0001

        DECLE   $00E4,  $03DC,  $0321,  $016B   ; F7AA   00E4 03DC 0321 016B
        DECLE   $01C3,  $0000,  $005A,  $0218   ; F7AE   01C3 0000 005A 0218

        CMP@    R1,     R4                      ; F7B2   034C
L_F7B3:
        ADDR    R4,     R3                      ; F7B3   00E3
        SUB@    R3,     R4                      ; F7B4   031C
        ADD@    R1,     R6                      ; F7B5   02CE
        RRC     R3,     1                       ; F7B6   0073
        PULR    R0                              ; F7B7   02B0
        ADD@    R6,     R0                      ; F7B8   02F0
        ANDR    R1,     R5                      ; F7B9   018D
        SUBR    R3,     R6                      ; F7BA   011E
        ADCR    R4                              ; F7BB   002C
        ADD     G_0306, R0                      ; F7BC   02C0 0306
        SUBR    R2,     R0                      ; F7BE   0110
        SLL     R3,     2                       ; F7BF   004F
        SUB@    R5,     R6                      ; F7C0   032E
        ADD@    R3,     R4                      ; F7C1   02DC
        SUB@    R2,     R0                      ; F7C2   0310
        PULR    R1                              ; F7C3   02B1
        CMPR    R2,     R4                      ; F7C4   0154
        XOR@    R5,     R0                      ; F7C5   03E8
        MOVR    R0,     R4                      ; F7C6   0084
        ADD@    R1,     R7                      ; F7C7   02CF

        DECLE   $03A2,  $0396,  $0001,  $01AC   ; F7C8   03A2 0396 0001 01AC
        DECLE   $023A,  $02D0,  $0388,  $0032   ; F7CC   023A 02D0 0388 0032
        DECLE   $004F,  $0091,  $0119,  $0253   ; F7D0   004F 0091 0119 0253
        DECLE   $003E,  $03C2,  $0322,  $0197   ; F7D4   003E 03C2 0322 0197
        DECLE   $00A9,  $0380,  $0098,  $0022   ; F7D8   00A9 0380 0098 0022
        DECLE   $0026,  $00B8,  $0363,  $003D   ; F7DC   0026 00B8 0363 003D
        DECLE   $0343,  $00D2,  $0355,  $027F   ; F7E0   0343 00D2 0355 027F
        DECLE   $039B,  $013A,  $0047,  $000A   ; F7E4   039B 013A 0047 000A
        DECLE   $0318,  $0088,  $03C0,  $01A1   ; F7E8   0318 0088 03C0 01A1
        DECLE   $00CB,  $03F7,  $0133,  $00AC   ; F7EC   00CB 03F7 0133 00AC
        DECLE   $034D,  $03FE,  $028D,  $022B   ; F7F0   034D 03FE 028D 022B
        DECLE   $026F,  $01C5,  $0200,  $0273   ; F7F4   026F 01C5 0200 0273

        SLL     R3,     2                       ; F7F8   004F
        MOVR    R1,     R0                      ; F7F9   0088
        ADD@    R3,     R4                      ; F7FA   02DC
        CMP@    R1,     R4                      ; F7FB   034C
        SUBR    R2,     R7                      ; F7FC   0117

        DECLE   $031C,  $030C,  $03B4,  $024F   ; F7FD   031C 030C 03B4 024F
        DECLE   $036C,  $0125,  $010E,  $002C   ; F801   036C 0125 010E 002C
        DECLE   $0300,  $0068,  $0209,  $01D3   ; F805   0300 0068 0209 01D3
        DECLE   $021D,  $0003,  $00D8,  $0210   ; F809   021D 0003 00D8 0210
        DECLE   $01C8,  $0000                   ; F80D   01C8 0000

        DECR    R4                              ; F80F   0014
        SUBR    R0,     R0                      ; F810   0100
        ANDR    R2,     R0                      ; F811   0190
L_F812:
        DECR    R7                              ; F812   0017

        TSTR    R0                              ; F813   0080
        SWAP    R3,     1                       ; F814   0043
        GSWD    R1                              ; F815   0031
        ANDR    R0,     R0                      ; F816   0180
        DECR    R0                              ; F817   0010
        XOR@    R6,     R1                      ; F818   03F1
        SUBR    R4,     R2                      ; F819   0122
        DIS                                     ; F81A   0003
        MVO@    R0,     R2                      ; F81B   0250
        SLL     R0,     1                       ; F81C   0048
        SLLC    R3,     2                       ; F81D   005F
        SLR     R1,     1                       ; F81E   0061
        B       L_F933                          ; F81F   0200 0112

        DECLE   $03D1,  $0322,  $0003,  $02DC   ; F821   03D1 0322 0003 02DC
        DECLE   $0058,  $025F,  $0005,  $03D4   ; F825   0058 025F 0005 03D4
        DECLE   $0171,  $02A4,  $0000,  $0242   ; F829   0171 02A4 0000 0242
        DECLE   $0385,  $02CB,  $0202,  $007B   ; F82D   0385 02CB 0202 007B
        DECLE   $0323,  $003A,  $0034,  $00B1   ; F831   0323 003A 0034 00B1
        DECLE   $0152,  $0000,  $01F9,  $00C0   ; F835   0152 0000 01F9 00C0
        DECLE   $0244,  $000A,  $0390,  $0078   ; F839   0244 000A 0390 0078
        DECLE   $00BB,  $001B,  $00D0,  $021E   ; F83D   00BB 001B 00D0 021E
        DECLE   $0388,  $0000,  $0083,  $0211   ; F841   0388 0000 0083 0211
        DECLE   $0197,  $0001                   ; F845   0197 0001

        MVI     G_0043, R0                      ; F847   0280 0043
        MOVR    R5,     R1                      ; F849   00A9
L_F84A:
        MVI     .STIC.A.4,R0                    ; F84A   0280 0014
        DECLE   $03C3,  $0022,  $0005,  $0210   ; F84C   03C3 0022 0005 0210
        DECLE   $003C,  $025F,  $0005,  $0200   ; F850   003C 025F 0005 0200
        DECLE   $0103,  $01F6,  $0000,  $01E0   ; F854   0103 01F6 0000 01E0
        DECLE   $0059,  $0200,  $03B9,  $0165   ; F858   0059 0200 03B9 0165
        DECLE   $0100,  $03C0,  $0197,  $0001   ; F85C   0100 03C0 0197 0001
        DECLE   $0370,  $005F,  $00A1,  $0080   ; F860   0370 005F 00A1 0080
        DECLE   $039B,  $03C2,  $00B2,  $0380   ; F864   039B 03C2 00B2 0380
        DECLE   $003F,  $02C8,  $000A,  $03B3   ; F868   003F 02C8 000A 03B3
        DECLE   $0320,  $001A,  $0120,  $0080   ; F86C   0320 001A 0120 0080
        DECLE   $00FB,  $03B0,  $0201,  $006C   ; F870   00FB 03B0 0201 006C
        DECLE   $00E0,  $00AC,  $03B2,  $0182   ; F874   00E0 00AC 03B2 0182
        DECLE   $0142,  $02CB,  $0000,  $037F   ; F878   0142 02CB 0000 037F
        DECLE   $0321,  $0002,  $0104,  $00BF   ; F87C   0321 0002 0104 00BF
        DECLE   $00F2,  $0100,  $0010,  $03E3   ; F880   00F2 0100 0010 03E3
        DECLE   $0245,  $000A,  $0128,  $0081   ; F884   0245 000A 0128 0081
        DECLE   $00BC,  $000B,  $0010,  $02F3   ; F888   00BC 000B 0010 02F3
        DECLE   $002C,  $03C0,  $0013,  $0022   ; F88C   002C 03C0 0013 0022
        DECLE   $0003,  $02DC,  $024C,  $005D   ; F890   0003 02DC 024C 005D
        DECLE   $0079,  $0100,  $010C,  $03F2   ; F894   0079 0100 010C 03F2
        DECLE   $0022,  $0005                   ; F898   0022 0005

        MVI@    R3,     R0                      ; F89A   0298
        SLR     R0,     1                       ; F89B   0060
        MVO@    R6,     R3                      ; F89C   025E
        COMR    R5                              ; F89D   001D
        NEGR    R4                              ; F89E   0024
L_F89F:
        SUBR    R1,     R1                      ; F89F   0109
        DECLE   $01D6,  $0380,  $01DF,  $0059   ; F8A0   01D6 0380 01DF 0059
        DECLE   $0180,  $0167,  $0164,  $0200   ; F8A4   0180 0167 0164 0200
        DECLE   $02E8,  $0196,  $0001,  $0209   ; F8A8   02E8 0196 0001 0209
        DECLE   $0245,  $005D,  $03F8,  $0105   ; F8AC   0245 005D 03F8 0105
        DECLE   $00D6,  $0370,  $0029,  $0059   ; F8B0   00D6 0370 0029 0059
        DECLE   $02C0,  $0380,  $0165,  $0100   ; F8B4   02C0 0380 0165 0100
        DECLE   $035B,  $0190,  $0001           ; F8B8   035B 0190 0001

        MOVR    R0,     R6                      ; F8BB   0086
        SWAP    R3,     1                       ; F8BC   0043
        MOVR    R5,     R1                      ; F8BD   00A9
L_F8BE:
        SUB     G_0116, R0                      ; F8BE   0300 0116
        DECLE   $03D2,  $00B2,  $0080,  $00BE   ; F8C0   03D2 00B2 0080 00BE
        DECLE   $02C8,  $0000                   ; F8C4   02C8 0000
L_F8C6:
        SUBR    R0,     R3                      ; F8C6   0103
        SUB@    R4,     R0                      ; F8C7   0320
        CLRC                                    ; F8C8   0006
        B       L_F84A                          ; F8C9   0220 0080

        ADDR    R7,     R3                      ; F8CB   00FB
        RSWD    R0                              ; F8CC   0038
        ADD@    R6,     R7                      ; F8CD   02F7

        DECLE   $0308,  $0001,  $00A4,  $0292   ; F8CE   0308 0001 00A4 0292
        DECLE   $0197,  $0013,  $03DE,  $0047   ; F8D2   0197 0013 03DE 0047
        DECLE   $00A9,  $0000,  $021B,  $03C2   ; F8D6   00A9 0000 021B 03C2
        DECLE   $0022,  $0007,  $0290,  $025C   ; F8DA   0022 0007 0290 025C
        DECLE   $025D,  $000D,  $0244,  $009C   ; F8DE   025D 000D 0244 009C
        DECLE   $001C,  $0000                   ; F8E2   001C 0000

        ADCR    R7                              ; F8E4   002F

        SUB@    R2,     R0                      ; F8E5   0310
L_F8E6:
        CMP@    R1,     R5                      ; F8E6   034D
        DECLE   $006F,  $011C,  $004F,  $02C0   ; F8E7   006F 011C 004F 02C0
        DECLE   $03EF,  $03E2,  $03F2,  $0090   ; F8EB   03EF 03E2 03F2 0090
        DECLE   $0040,  $0000,  $0380,  $0012   ; F8EF   0040 0000 0380 0012
        DECLE   $0010,  $03C7,  $0004,  $0280   ; F8F3   0010 03C7 0004 0280
        DECLE   $0366,  $0239,  $0213,  $03E9   ; F8F7   0366 0239 0213 03E9
        DECLE   $0397,  $01F7                   ; F8FB   0397 01F7

        XORR    R6,     R1                      ; F8FD   01F1
        SUBR    R1,     R1                      ; F8FE   0109
        B       L_F905                          ; F8FF   0200 0004

        DECLE   $00F2,  $0140,  $03B3,  $021D   ; F901   00F2 0140 03B3 021D
L_F905:
        SUBR    R1,     R1                      ; F905   0109
        DECLE   $0024,  $03B8,  $02FB,  $02F8   ; F906   0024 03B8 02FB 02F8
        DECLE   $01DB,  $038E,  $0012,  $0070   ; F90A   01DB 038E 0012 0070
        DECLE   $007A,  $0014,  $0380,  $003F   ; F90E   007A 0014 0380 003F
        DECLE   $0007,  $0000                   ; F912   0007 0000

        SAR     R3,     2                       ; F914   006F
        ADDR    R7,     R0                      ; F915   00F8
        XORR    R0,     R4                      ; F916   01C4
        MVO     R3,     .STIC.BORD              ; F917   0243 002C
        ANDR    R1,     R1                      ; F919   0189
        AND@    R4,     R4                      ; F91A   03A4
        NEGR    R3                              ; F91B   0023
        MVO@    R3,     R5                      ; F91C   026B
        SUB@    R2,     R7                      ; F91D   0317

        DECLE   $0331,  $0199,  $01C3,  $03CA   ; F91E   0331 0199 01C3 03CA
        DECLE   $0211,  $031F,  $016C,  $0342   ; F922   0211 031F 016C 0342
        DECLE   $0003,  $01CF,  $003D,  $0140   ; F926   0003 01CF 003D 0140
        DECLE   $03DA,  $0005                   ; F92A   03DA 0005

        MVO     R0,     G_00B8                  ; F92C   0240 00B8
        CMP@    R2,     R0                      ; F92E   0350
        MOVR    R3,     R4                      ; F92F   009C
        ADD@    R1,     R3                      ; F930   02CB
        MOVR    R0,     R2                      ; F931   0082
        SLLC    R0,     1                       ; F932   0058
L_F933:
        SUB@    R1,     R0                      ; F933   0308
        DECLE   $01AF,  $01C5,  $02DE,  $03C4   ; F934   01AF 01C5 02DE 03C4
        DECLE   $0158,  $0012,  $018C,  $029C   ; F938   0158 0012 018C 029C
        DECLE   $00E2,  $02ED,  $0162,  $008C   ; F93C   00E2 02ED 0162 008C
        DECLE   $01C4,  $00AB,  $00A0,  $012C   ; F940   01C4 00AB 00A0 012C
        DECLE   $00F0,  $0000,  $03C0,  $0008   ; F944   00F0 0000 03C0 0008
        DECLE   $0332,  $021C,  $03A1,  $0039   ; F948   0332 021C 03A1 0039
        DECLE   $0000                           ; F94C   0000

        SUB@    R5,     R2                      ; F94D   032A
        SUBR    R1,     R0                      ; F94E   0108
        TSTR    R0                              ; F94F   0080
        B       L_F959                          ; F950   0200 0007

        DECLE   $026C,  $01F6,  $0129,  $0232   ; F952   026C 01F6 0129 0232

        BLE     L_F9B3                          ; F956   0206 005B

        MVI@    R4,     R6                      ; F958   02A6
L_F959:
        ANDR    R2,     R5                      ; F959   0195
        DECLE   $0000,  $0000,  $0004,  $003C   ; F95A   0000 0000 0004 003C
        DECLE   $0195,  $031C,  $0250,  $005F   ; F95E   0195 031C 0250 005F
        DECLE   $00E4,  $0394,  $0115,  $0038   ; F962   00E4 0394 0115 0038
        DECLE   $03BC,  $039C,  $0194,  $0010   ; F966   03BC 039C 0194 0010
        DECLE   $0200,  $01FC,  $007C,  $0335   ; F96A   0200 01FC 007C 0335
        DECLE   $014E,  $00B9,  $002C,  $02FB   ; F96E   014E 00B9 002C 02FB
        DECLE   $02F3,  $036A,  $029A,  $033E   ; F972   02F3 036A 029A 033E
        DECLE   $0246,  $029B,  $009B,  $005C   ; F976   0246 029B 009B 005C
        DECLE   $00C1,  $038D,  $0232,  $0236   ; F97A   00C1 038D 0232 0236
        DECLE   $028A,  $02BE,  $02CD,  $00DA   ; F97E   028A 02BE 02CD 00DA
        DECLE   $001C,  $0000,  $0051,  $0110   ; F982   001C 0000 0051 0110
        DECLE   $00C9,  $0000,  $0018,  $03FF   ; F986   00C9 0000 0018 03FF
        DECLE   $01A7,  $001F,  $0202,  $027D   ; F98A   01A7 001F 0202 027D
        DECLE   $0169,  $02AB,  $02C3,  $0061   ; F98E   0169 02AB 02C3 0061
        DECLE   $0398,  $0075,  $0329,  $00D8   ; F992   0398 0075 0329 00D8
        DECLE   $0353,  $03E1,  $0010,  $03CD   ; F996   0353 03E1 0010 03CD
        DECLE   $02B8,  $009C,  $02A3,  $0000   ; F99A   02B8 009C 02A3 0000
        DECLE   $021C,  $0161,  $00A1,  $03A1   ; F99E   021C 0161 00A1 03A1
        DECLE   $0001,  $00E4,  $005C,  $0098   ; F9A2   0001 00E4 005C 0098
        DECLE   $03DD,  $03CE,  $02E3,  $0201   ; F9A6   03DD 03CE 02E3 0201
        DECLE   $00A0,  $0055,  $0206,  $0107   ; F9AA   00A0 0055 0206 0107
        DECLE   $02FE,  $019F,  $035A,  $01C7   ; F9AE   02FE 019F 035A 01C7

        SUBR    R1,     R1                      ; F9B2   0109
L_F9B3:
        XORR    R5,     R0                      ; F9B3   01E8
        DECLE   $01D5,  $019F,  $00D2,  $03EF   ; F9B4   01D5 019F 00D2 03EF
        DECLE   $02E3,  $0088,  $03EE,  $01E5   ; F9B8   02E3 0088 03EE 01E5
        DECLE   $010D,  $0267,  $0013,  $0172   ; F9BC   010D 0267 0013 0172
        DECLE   $0232,  $00F2,  $03F1,  $0295   ; F9C0   0232 00F2 03F1 0295
        DECLE   $0294,  $0005,  $0040,  $0367   ; F9C4   0294 0005 0040 0367
        DECLE   $007B,  $0293,  $007E,  $0201   ; F9C8   007B 0293 007E 0201
        DECLE   $01FD                           ; F9CC   01FD

        NOP                                     ; F9CD   0034
        ANDR    R2,     R4                      ; F9CE   0194
L_F9CF:
        DECR    R7                              ; F9CF   0017

        DECLE   $02C8,  $0027,  $0390,  $01F3   ; F9D0   02C8 0027 0390 01F3
        DECLE   $0038,  $0000,  $0032,  $0110   ; F9D4   0038 0000 0032 0110
        DECLE   $0188,  $0001,  $03B7           ; F9D8   0188 0001 03B7

        XORR    R7,     R5                      ; F9DB   01FD
        SUBR    R3,     R0                      ; F9DC   0118
        COMR    R2                              ; F9DD   001A
        MVO@    R0,     R4                      ; F9DE   0260
        XORI    #$0313, R6                      ; F9DF   03FE 0313
        CMP@    R1,     R5                      ; F9E1   034D
        ADDR    R3,     R3                      ; F9E2   00DB
L_F9E3:
        SUBR    R4,     R4                      ; F9E3   0124
        DECLE   $0348,  $03DF                   ; F9E4   0348 03DF

        ADD@    R1,     R5                      ; F9E6   02CD
        CMP@    R2,     R6                      ; F9E7   0356
        XOR@    R6,     R2                      ; F9E8   03F2
        RRC     R0,     1                       ; F9E9   0070
        XOR@    R2,     R1                      ; F9EA   03D1
        AND@    R6,     R4                      ; F9EB   03B4
        SUB@    R1,     R1                      ; F9EC   0309
        ADDR    R4,     R6                      ; F9ED   00E6
        PSHR    R3                              ; F9EE   0273
        ANDR    R1,     R5                      ; F9EF   018D
        NEGR    R6                              ; F9F0   0026
        MVO@    R0,     R2                      ; F9F1   0250
        CMPR    R4,     R6                      ; F9F2   0166
        ANDR    R5,     R1                      ; F9F3   01A9
        ADD@    R2,     R3                      ; F9F4   02D3
        SUBI    #$02C8, R4                      ; F9F5   033C 02C8
        ADDR    R2,     R3                      ; F9F7   00D3
        CMPR    R5,     R0                      ; F9F8   0168
        MVI@    R4,     R7                      ; F9F9   02A7

        DECLE   $0274,  $00F1,  $0224,  $0243   ; F9FA   0274 00F1 0224 0243
        DECLE   $0061,  $032C,  $0055,  $025A   ; F9FE   0061 032C 0055 025A
        DECLE   $005C,  $02C0,  $0107,  $020F   ; FA02   005C 02C0 0107 020F
        DECLE   $00F9,  $001C,  $0000,  $003A   ; FA06   00F9 001C 0000 003A
        DECLE   $00F4,  $0044,  $0052,  $0300   ; FA0A   00F4 0044 0052 0300
        DECLE   $02F8,  $039F,  $026D,  $023E   ; FA0E   02F8 039F 026D 023E
        DECLE   $0121,  $0086,  $027F,  $02ED   ; FA12   0121 0086 027F 02ED
        DECLE   $02A6,  $0335,  $033E,  $00D0   ; FA16   02A6 0335 033E 00D0
        DECLE   $0119,  $02C1,  $01F7,  $0363   ; FA1A   0119 02C1 01F7 0363
        DECLE   $019A,  $01A7,  $0044,  $021E   ; FA1E   019A 01A7 0044 021E
        DECLE   $039F,  $02FB,  $01B5,  $02CD   ; FA22   039F 02FB 01B5 02CD
        DECLE   $00D3,  $031A,  $010E,  $00C0   ; FA26   00D3 031A 010E 00C0
        DECLE   $02FE,  $02DC,  $0212,  $0071   ; FA2A   02FE 02DC 0212 0071
        DECLE   $0000,  $021C                   ; FA2E   0000 021C

        MVI     .STIC.A.2,R0                    ; FA30   0280 0012
        DECR    R3                              ; FA32   0013
        SWAP    R1,     1                       ; FA33   0041
        XOR@    R4,     R4                      ; FA34   03E4
        MVI@    R1,     R7                      ; FA35   028F

        DECLE   $0012,  $0015,  $0208,  $003F   ; FA36   0012 0015 0208 003F
        DECLE   $0080,  $0282,  $0117,  $000A   ; FA3A   0080 0282 0117 000A
        DECLE   $0240,  $00A2,  $01F1,  $007D   ; FA3E   0240 00A2 01F1 007D
        DECLE   $000E,  $0000                   ; FA42   000E 0000

        PSHR    R5                              ; FA44   0275

        JSR     R5,     X_PLAY_SFX1             ; FA45   0004 0118 03BB
        DECLE   $011D                           ; FA48  SFX data
        DECLE   $017D                           ; FA49  SFX data
        DECLE   $0389                           ; FA4A  SFX data
        DECLE   $0035                           ; FA4B  SFX data
        DECLE   $006B                           ; FA4C  SFX data
        DECLE   $0000,  $0000                   ; FA4D  SFX data
        DECLE   $0308,  $02CF                   ; FA4F  SFX data
        DECLE   $0314,  $019E                   ; FA51  SFX data
        DECLE   $03EB                           ; FA53  SFX data
        DECLE   $0035                           ; FA54  SFX data
        DECLE   $006B                           ; FA55  SFX data
        DECLE   $0308,  $021B                   ; FA56  SFX data
        DECLE   $0314,  $0035                   ; FA58  SFX data
        DECLE   $01AB                           ; FA5A  SFX data
        DECLE   $0005                           ; FA5B  SFX data
        DECLE   $006B                           ; FA5C  SFX data
        DECLE   $0300,  $010D                   ; FA5D  SFX data
        DECLE   $01AB                           ; FA5F  SFX data
        DECLE   $0035                           ; FA60  SFX data
        DECLE   $006B                           ; FA61  SFX data
        DECLE   $0300,  $00B4                   ; FA62  SFX data
        DECLE   $0308,  $01AC                   ; FA64  SFX data
        DECLE   $0304,  $02CF                   ; FA66  SFX data
        DECLE   $01AB                           ; FA68  SFX data
        DECLE   $0005                           ; FA69  SFX data
        DECLE   $006B                           ; FA6A  SFX data
        DECLE   $0300,  $010D                   ; FA6B  SFX data
        DECLE   $01AB                           ; FA6D  SFX data
        DECLE   $0035                           ; FA6E  SFX data
        DECLE   $006B                           ; FA6F  SFX data
        DECLE   $0300,  $00D7                   ; FA70  SFX data
        DECLE   $0325                           ; FA72  SFX data
        DECLE   $0315                           ; FA73  SFX data
        DECLE   $01AB                           ; FA74  SFX data
        DECLE   $0005                           ; FA75  SFX data
        DECLE   $006B                           ; FA76  SFX data
        DECLE   $0300,  $00B4                   ; FA77  SFX data
        DECLE   $01AB                           ; FA79  SFX data
        DECLE   $0025                           ; FA7A  SFX data
        DECLE   $0015                           ; FA7B  SFX data
        DECLE   $006B                           ; FA7C  SFX data
        DECLE   $0308,  $01FC                   ; FA7D  SFX data
        DECLE   $0304,  $03F9                   ; FA7F  SFX data
        DECLE   $01AB                           ; FA81  SFX data
        DECLE   $0005                           ; FA82  SFX data
        DECLE   $006B                           ; FA83  SFX data
        DECLE   $0300,  $011D                   ; FA84  SFX data
        DECLE   $01AB                           ; FA86  SFX data
        DECLE   $0035                           ; FA87  SFX data
        DECLE   $006B                           ; FA88  SFX data
        DECLE   $0300,  $00B4                   ; FA89  SFX data
        DECLE   $0308,  $01E0                   ; FA8B  SFX data
        DECLE   $0304,  $03C0                   ; FA8D  SFX data
        DECLE   $01AB                           ; FA8F  SFX data
        DECLE   $0005                           ; FA90  SFX data
        DECLE   $006B                           ; FA91  SFX data
        DECLE   $0300,  $011D                   ; FA92  SFX data
        DECLE   $01AB                           ; FA94  SFX data
        DECLE   $0035                           ; FA95  SFX data
        DECLE   $006B                           ; FA96  SFX data
        DECLE   $0300,  $00F0                   ; FA97  SFX data
        DECLE   $0308,  $0194                   ; FA99  SFX data
        DECLE   $0304,  $02CF                   ; FA9B  SFX data
        DECLE   $01AB                           ; FA9D  SFX data
        DECLE   $0005                           ; FA9E  SFX data
        DECLE   $006B                           ; FA9F  SFX data
        DECLE   $0300,  $00B4                   ; FAA0  SFX data
        DECLE   $01AB                           ; FAA2  SFX data
        DECLE   $0025                           ; FAA3  SFX data
        DECLE   $0015                           ; FAA4  SFX data
        DECLE   $006B                           ; FAA5  SFX data
        DECLE   $0325                           ; FAA6  SFX data
        DECLE   $0315                           ; FAA7  SFX data
        DECLE   $03EB                           ; FAA8  SFX data
        DECLE   $0025                           ; FAA9  SFX data
        DECLE   $0015                           ; FAAA  SFX data
        DECLE   $0043,  $0280                   ; FAAB  SFX data
        DECLE   $0000,  $0000                   ; FAAD  SFX data
        DECLE   $0308,  $02CF                   ; FAAF  SFX data
        DECLE   $0314,  $019E                   ; FAB1  SFX data
        DECLE   $01AB                           ; FAB3  SFX data
        DECLE   $0005                           ; FAB4  SFX data
        DECLE   $006B                           ; FAB5  SFX data
        DECLE   $0300,  $00B4                   ; FAB6  SFX data
        DECLE   $01AB                           ; FAB8  SFX data
        DECLE   $0035                           ; FAB9  SFX data
        DECLE   $006B                           ; FABA  SFX data
        DECLE   $0308,  $02A7                   ; FABB  SFX data
        DECLE   $0314,  $014D                   ; FABD  SFX data
        DECLE   $022B                           ; FABF  SFX data
        DECLE   $0300,  $010D                   ; FAC0  SFX data
        DECLE   $01AB                           ; FAC2  SFX data
        DECLE   $0005                           ; FAC3  SFX data
        DECLE   $006B                           ; FAC4  SFX data
        DECLE   $0300,  $00E2                   ; FAC5  SFX data
        DECLE   $01AB                           ; FAC7  SFX data
        DECLE   $0005                           ; FAC8  SFX data
        DECLE   $006B                           ; FAC9  SFX data
        DECLE   $0300,  $00AA                   ; FACA  SFX data
        DECLE   $01AB                           ; FACC  SFX data
        DECLE   $0035                           ; FACD  SFX data
        DECLE   $006B                           ; FACE  SFX data
        DECLE   $0308,  $02CF                   ; FACF  SFX data
        DECLE   $0314,  $019E                   ; FAD1  SFX data
        DECLE   $022B                           ; FAD3  SFX data
        DECLE   $0300,  $00B4                   ; FAD4  SFX data
        DECLE   $01AB                           ; FAD6  SFX data
        DECLE   $0035                           ; FAD7  SFX data
        DECLE   $0043,  $034F                   ; FAD8  SFX data
        DECLE   $008F,  $0011                   ; FADA  SFX data
        DECLE   $0368,  $006B                   ; FADC  SFX data
        DECLE   $022B                           ; FADE  SFX data
        DECLE   $0310,  $0035                   ; FADF  SFX data
        DECLE   $01AB                           ; FAE1  SFX data
        DECLE   $0005                           ; FAE2  SFX data
        DECLE   $0025                           ; FAE3  SFX data
        DECLE   $006B                           ; FAE4  SFX data
        DECLE   $0300,  $038A                   ; FAE5  SFX data
        DECLE   $01AB                           ; FAE7  SFX data
        DECLE   $0005                           ; FAE8  SFX data
        DECLE   $006B                           ; FAE9  SFX data
        DECLE   $0300,  $021B                   ; FAEA  SFX data
        DECLE   $022B                           ; FAEC  SFX data
        DECLE   $0000,  $0000                   ; FAED  SFX data
        DECLE   $0318,  $0035                   ; FAEF  SFX data
        DECLE   $022B                           ; FAF1  SFX data
        DECLE   $0300,  $021B                   ; FAF2  SFX data
        DECLE   $01AB                           ; FAF4  SFX data
        DECLE   $0005                           ; FAF5  SFX data
        DECLE   $0025                           ; FAF6  SFX data
        DECLE   $006B                           ; FAF7  SFX data
        DECLE   $0300,  $01C5                   ; FAF8  SFX data
        DECLE   $01AB                           ; FAFA  SFX data
        DECLE   $0005                           ; FAFB  SFX data
        DECLE   $006B                           ; FAFC  SFX data
        DECLE   $0300,  $010D                   ; FAFD  SFX data
        DECLE   $01AB                           ; FAFF  SFX data
        DECLE   $0005                           ; FB00  SFX data
        DECLE   $006B                           ; FB01  SFX data
        DECLE   $0308,  $021B                   ; FB02  SFX data
        DECLE   $022B                           ; FB04  SFX data
        DECLE   $0305                           ; FB05  SFX data
        DECLE   $01AB                           ; FB06  SFX data
        DECLE   $0005                           ; FB07  SFX data
        DECLE   $0025                           ; FB08  SFX data
        DECLE   $006B                           ; FB09  SFX data
        DECLE   $0300,  $00E2                   ; FB0A  SFX data
        DECLE   $01AB                           ; FB0C  SFX data
        DECLE   $0005                           ; FB0D  SFX data
        DECLE   $006B                           ; FB0E  SFX data
        DECLE   $0300,  $0087                   ; FB0F  SFX data
        DECLE   $01AB                           ; FB11  SFX data
        DECLE   $0005                           ; FB12  SFX data
        DECLE   $006B                           ; FB13  SFX data
        DECLE   $0308,  $010D                   ; FB14  SFX data
        DECLE   $022B                           ; FB16  SFX data
        DECLE   $0300,  $0087                   ; FB17  SFX data
        DECLE   $01AB                           ; FB19  SFX data
        DECLE   $0005                           ; FB1A  SFX data
        DECLE   $0025                           ; FB1B  SFX data
        DECLE   $006B                           ; FB1C  SFX data
        DECLE   $0300,  $0071                   ; FB1D  SFX data
        DECLE   $01AB                           ; FB1F  SFX data
        DECLE   $0005                           ; FB20  SFX data
        DECLE   $006B                           ; FB21  SFX data
        DECLE   $0300,  $0043                   ; FB22  SFX data
        DECLE   $01AB                           ; FB24  SFX data
        DECLE   $0035                           ; FB25  SFX data
        DECLE   $006B                           ; FB26  SFX data
        DECLE   $0300,  $0043                   ; FB27  SFX data
        DECLE   $0308,  $00E2                   ; FB29  SFX data
        DECLE   $0304,  $017D                   ; FB2B  SFX data
        DECLE   $03EB                           ; FB2D  SFX data
        DECLE   $0035                           ; FB2E  SFX data
        DECLE   $006B                           ; FB2F  SFX data
        DECLE   $0335                           ; FB30  SFX data
        DECLE   $03EB                           ; FB31  SFX data
        DECLE   $0035                           ; FB32  SFX data
        DECLE   $006B                           ; FB33  SFX data
        DECLE   $0335                           ; FB34  SFX data
        DECLE   $03EB                           ; FB35  SFX data
        DECLE   $0035                           ; FB36  SFX data
        DECLE   $006B                           ; FB37  SFX data
        DECLE   $0335                           ; FB38  SFX data
        DECLE   $01AB                           ; FB39  SFX data
        DECLE   $0005                           ; FB3A  SFX data
        DECLE   $006B                           ; FB3B  SFX data
        DECLE   $0305                           ; FB3C  SFX data
        DECLE   $01AB                           ; FB3D  SFX data
        DECLE   $0025                           ; FB3E  SFX data
        DECLE   $0015                           ; FB3F  SFX data
        DECLE   $006B                           ; FB40  SFX data
        DECLE   $0308,  $00D7                   ; FB41  SFX data
        DECLE   $0304,  $0168                   ; FB43  SFX data
        DECLE   $01AB                           ; FB45  SFX data
        DECLE   $0005                           ; FB46  SFX data
        DECLE   $006B                           ; FB47  SFX data
        DECLE   $0300,  $005A                   ; FB48  SFX data
        DECLE   $01AB                           ; FB4A  SFX data
        DECLE   $0035                           ; FB4B  SFX data
        DECLE   $006B                           ; FB4C  SFX data
        DECLE   $0300,  $0050                   ; FB4D  SFX data
        DECLE   $0325                           ; FB4F  SFX data
        DECLE   $0315                           ; FB50  SFX data
        DECLE   $01AB                           ; FB51  SFX data
        DECLE   $0005                           ; FB52  SFX data
        DECLE   $006B                           ; FB53  SFX data
        DECLE   $0300,  $006B                   ; FB54  SFX data
        DECLE   $01AB                           ; FB56  SFX data
        DECLE   $0035                           ; FB57  SFX data
        DECLE   $006B                           ; FB58  SFX data
        DECLE   $0300,  $005A                   ; FB59  SFX data
        DECLE   $0325                           ; FB5B  SFX data
        DECLE   $0315                           ; FB5C  SFX data
        DECLE   $01AB                           ; FB5D  SFX data
        DECLE   $0005                           ; FB5E  SFX data
        DECLE   $006B                           ; FB5F  SFX data
        DECLE   $0300,  $0050                   ; FB60  SFX data
        DECLE   $01AB                           ; FB62  SFX data
        DECLE   $0025                           ; FB63  SFX data
        DECLE   $0015                           ; FB64  SFX data
        DECLE   $006B                           ; FB65  SFX data
        DECLE   $0325                           ; FB66  SFX data
        DECLE   $0315                           ; FB67  SFX data
        DECLE   $01AB                           ; FB68  SFX data
        DECLE   $0005                           ; FB69  SFX data
        DECLE   $006B                           ; FB6A  SFX data
        DECLE   $0300,  $0087                   ; FB6B  SFX data
        DECLE   $01AB                           ; FB6D  SFX data
        DECLE   $0025                           ; FB6E  SFX data
        DECLE   $0015                           ; FB6F  SFX data
        DECLE   $006B                           ; FB70  SFX data
        DECLE   $0308,  $00E2                   ; FB71  SFX data
        DECLE   $0304,  $0153                   ; FB73  SFX data
        DECLE   $01AB                           ; FB75  SFX data
        DECLE   $0005                           ; FB76  SFX data
        DECLE   $006B                           ; FB77  SFX data
        DECLE   $0300,  $0078                   ; FB78  SFX data
        DECLE   $01AB                           ; FB7A  SFX data
        DECLE   $0035                           ; FB7B  SFX data
        DECLE   $006B                           ; FB7C  SFX data
        DECLE   $0300,  $0071                   ; FB7D  SFX data
        DECLE   $0325                           ; FB7F  SFX data
        DECLE   $0315                           ; FB80  SFX data
        DECLE   $01AB                           ; FB81  SFX data
        DECLE   $0005                           ; FB82  SFX data
        DECLE   $006B                           ; FB83  SFX data
        DECLE   $0300,  $0087                   ; FB84  SFX data
        DECLE   $01AB                           ; FB86  SFX data
        DECLE   $0035                           ; FB87  SFX data
        DECLE   $006B                           ; FB88  SFX data
        DECLE   $0300,  $0078                   ; FB89  SFX data
        DECLE   $0308,  $00D7                   ; FB8B  SFX data
        DECLE   $0304,  $0168                   ; FB8D  SFX data
        DECLE   $01AB                           ; FB8F  SFX data
        DECLE   $0005                           ; FB90  SFX data
        DECLE   $006B                           ; FB91  SFX data
        DECLE   $0300,  $006B                   ; FB92  SFX data
        DECLE   $01AB                           ; FB94  SFX data
        DECLE   $0025                           ; FB95  SFX data
        DECLE   $0015                           ; FB96  SFX data
        DECLE   $006B                           ; FB97  SFX data
        DECLE   $0325                           ; FB98  SFX data
        DECLE   $0315                           ; FB99  SFX data
        DECLE   $01AB                           ; FB9A  SFX data
        DECLE   $0005                           ; FB9B  SFX data
        DECLE   $006B                           ; FB9C  SFX data
        DECLE   $0300,  $0087                   ; FB9D  SFX data
        DECLE   $01AB                           ; FB9F  SFX data
        DECLE   $0035                           ; FBA0  SFX data
        DECLE   $006B                           ; FBA1  SFX data
        DECLE   $0300,  $006B                   ; FBA2  SFX data
        DECLE   $0325                           ; FBA4  SFX data
        DECLE   $0315                           ; FBA5  SFX data
        DECLE   $01AB                           ; FBA6  SFX data
        DECLE   $0005                           ; FBA7  SFX data
        DECLE   $006B                           ; FBA8  SFX data
        DECLE   $0300,  $0087                   ; FBA9  SFX data
        DECLE   $01AB                           ; FBAB  SFX data
        DECLE   $0035                           ; FBAC  SFX data
        DECLE   $006B                           ; FBAD  SFX data
        DECLE   $0300,  $0078                   ; FBAE  SFX data
        DECLE   $0308,  $00CA                   ; FBB0  SFX data
        DECLE   $0315                           ; FBB2  SFX data
        DECLE   $03EB                           ; FBB3  SFX data
        DECLE   $0035                           ; FBB4  SFX data
        DECLE   $006B                           ; FBB5  SFX data
        DECLE   $0300,  $0087                   ; FBB6  SFX data
        DECLE   $0308,  $00D7                   ; FBB8  SFX data
        DECLE   $0304,  $010D                   ; FBBA  SFX data
        DECLE   $03EB                           ; FBBC  SFX data
        DECLE   $0035                           ; FBBD  SFX data
        DECLE   $02AB                           ; FBBE  SFX data
        DECLE   $0300,  $0087                   ; FBBF  SFX data
        DECLE   $022B                           ; FBC1  SFX data
        DECLE   $0308,  $01C5                   ; FBC2  SFX data
        DECLE   $0304,  $02FA                   ; FBC4  SFX data
        DECLE   $03EB                           ; FBC6  SFX data
        DECLE   $0035                           ; FBC7  SFX data
        DECLE   $006B                           ; FBC8  SFX data
        DECLE   $0335                           ; FBC9  SFX data
        DECLE   $03EB                           ; FBCA  SFX data
        DECLE   $0035                           ; FBCB  SFX data
        DECLE   $006B                           ; FBCC  SFX data
        DECLE   $0335                           ; FBCD  SFX data
        DECLE   $03EB                           ; FBCE  SFX data
        DECLE   $0035                           ; FBCF  SFX data
        DECLE   $006B                           ; FBD0  SFX data
        DECLE   $0335                           ; FBD1  SFX data
        DECLE   $01AB                           ; FBD2  SFX data
        DECLE   $0005                           ; FBD3  SFX data
        DECLE   $006B                           ; FBD4  SFX data
        DECLE   $0305                           ; FBD5  SFX data
        DECLE   $01AB                           ; FBD6  SFX data
        DECLE   $0025                           ; FBD7  SFX data
        DECLE   $0015                           ; FBD8  SFX data
        DECLE   $006B                           ; FBD9  SFX data
        DECLE   $0308,  $01AC                   ; FBDA  SFX data
        DECLE   $0304,  $02CF                   ; FBDC  SFX data
        DECLE   $01AB                           ; FBDE  SFX data
        DECLE   $0005                           ; FBDF  SFX data
        DECLE   $006B                           ; FBE0  SFX data
        DECLE   $0300,  $00B4                   ; FBE1  SFX data
        DECLE   $01AB                           ; FBE3  SFX data
        DECLE   $0035                           ; FBE4  SFX data
        DECLE   $006B                           ; FBE5  SFX data
        DECLE   $0300,  $00A0                   ; FBE6  SFX data
        DECLE   $0325                           ; FBE8  SFX data
        DECLE   $0315                           ; FBE9  SFX data
        DECLE   $01AB                           ; FBEA  SFX data
        DECLE   $0005                           ; FBEB  SFX data
        DECLE   $006B                           ; FBEC  SFX data
        DECLE   $0300,  $00D7                   ; FBED  SFX data
        DECLE   $01AB                           ; FBEF  SFX data
        DECLE   $0035                           ; FBF0  SFX data
        DECLE   $006B                           ; FBF1  SFX data
        DECLE   $0300,  $00B4                   ; FBF2  SFX data
        DECLE   $0325                           ; FBF4  SFX data
        DECLE   $0315                           ; FBF5  SFX data
        DECLE   $01AB                           ; FBF6  SFX data
        DECLE   $0005                           ; FBF7  SFX data
        DECLE   $006B                           ; FBF8  SFX data
        DECLE   $0300,  $00A0                   ; FBF9  SFX data
        DECLE   $01AB                           ; FBFB  SFX data
        DECLE   $0025                           ; FBFC  SFX data
        DECLE   $0015                           ; FBFD  SFX data
        DECLE   $006B                           ; FBFE  SFX data
        DECLE   $0325                           ; FBFF  SFX data
        DECLE   $0315                           ; FC00  SFX data
        DECLE   $01AB                           ; FC01  SFX data
        DECLE   $0005                           ; FC02  SFX data
        DECLE   $006B                           ; FC03  SFX data
        DECLE   $0300,  $010D                   ; FC04  SFX data
        DECLE   $01AB                           ; FC06  SFX data
        DECLE   $0025                           ; FC07  SFX data
        DECLE   $0015                           ; FC08  SFX data
        DECLE   $006B                           ; FC09  SFX data
        DECLE   $0308,  $01C5                   ; FC0A  SFX data
        DECLE   $0304,  $02A7                   ; FC0C  SFX data
        DECLE   $01AB                           ; FC0E  SFX data
        DECLE   $0005                           ; FC0F  SFX data
        DECLE   $006B                           ; FC10  SFX data
        DECLE   $0300,  $00F0                   ; FC11  SFX data
        DECLE   $01AB                           ; FC13  SFX data
        DECLE   $0035                           ; FC14  SFX data
        DECLE   $006B                           ; FC15  SFX data
        DECLE   $0300,  $00E2                   ; FC16  SFX data
        DECLE   $0325                           ; FC18  SFX data
        DECLE   $0315                           ; FC19  SFX data
        DECLE   $01AB                           ; FC1A  SFX data
        DECLE   $0005                           ; FC1B  SFX data
        DECLE   $006B                           ; FC1C  SFX data
        DECLE   $0300,  $010D                   ; FC1D  SFX data
        DECLE   $01AB                           ; FC1F  SFX data
        DECLE   $0035                           ; FC20  SFX data
        DECLE   $006B                           ; FC21  SFX data
        DECLE   $0300,  $00F0                   ; FC22  SFX data
        DECLE   $0308,  $01AC                   ; FC24  SFX data
        DECLE   $0304,  $02CF                   ; FC26  SFX data
        DECLE   $01AB                           ; FC28  SFX data
        DECLE   $0005                           ; FC29  SFX data
        DECLE   $006B                           ; FC2A  SFX data
        DECLE   $0300,  $00D7                   ; FC2B  SFX data
        DECLE   $01AB                           ; FC2D  SFX data
        DECLE   $0025                           ; FC2E  SFX data
        DECLE   $0015                           ; FC2F  SFX data
        DECLE   $006B                           ; FC30  SFX data
        DECLE   $0325                           ; FC31  SFX data
        DECLE   $0315                           ; FC32  SFX data
        DECLE   $01AB                           ; FC33  SFX data
        DECLE   $0005                           ; FC34  SFX data
        DECLE   $006B                           ; FC35  SFX data
        DECLE   $0300,  $010D                   ; FC36  SFX data
        DECLE   $01AB                           ; FC38  SFX data
        DECLE   $0035                           ; FC39  SFX data
        DECLE   $006B                           ; FC3A  SFX data
        DECLE   $0300,  $00D7                   ; FC3B  SFX data
        DECLE   $0308,  $01AC                   ; FC3D  SFX data
        DECLE   $0304,  $02CF                   ; FC3F  SFX data
        DECLE   $01AB                           ; FC41  SFX data
        DECLE   $0005                           ; FC42  SFX data
        DECLE   $006B                           ; FC43  SFX data
        DECLE   $0300,  $010D                   ; FC44  SFX data
        DECLE   $01AB                           ; FC46  SFX data
        DECLE   $0035                           ; FC47  SFX data
        DECLE   $006B                           ; FC48  SFX data
        DECLE   $0300,  $00F0                   ; FC49  SFX data
        DECLE   $0308,  $0194                   ; FC4B  SFX data
        DECLE   $0304,  $02CF                   ; FC4D  SFX data
        DECLE   $03EB                           ; FC4F  SFX data
        DECLE   $0035                           ; FC50  SFX data
        DECLE   $006B                           ; FC51  SFX data
        DECLE   $0300,  $010D                   ; FC52  SFX data
        DECLE   $0308,  $01AC                   ; FC54  SFX data
        DECLE   $0304,  $021B                   ; FC56  SFX data
        DECLE   $03EB                           ; FC58  SFX data
        DECLE   $0035                           ; FC59  SFX data
        DECLE   $006B                           ; FC5A  SFX data
        DECLE   $03F9                           ; FC5B  SFX data
        DECLE   $02CF                           ; FC5C  SFX end

        DECLE   $0000,  $0000,  $0000,  $0000   ; FC5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF2D   0000 0000 0000 0000
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
;;  $5046       <entry>
;;  $5047       <entry>
;;  $50AD       $50B8   $50BC  
;;  $50AF       $F713  
;;  $50BE       $50AF  
;;  $50C3       $50C5  
;;  $5101       <entry>
;;  $5112       $5102   $5108   $522F  
;;  $514F       $51BF  
;;  $5172       $513B   $516B   $517B  
;;  $5178       $5175  
;;  $517E       $5144   $518A  
;;  $5186       $5182  
;;  $518D       $5160   $51A1  
;;  $519B       $5195  
;;  $51A4       $514D  
;;  $51B7       $51B2  
;;  $51BB       $51AF  
;;  $51BD       $51B5   $51B9  
;;  $51C1       $5130  
;;  $51CA       $51C7  
;;  $51D8       $5117   $5121   $5BD9   $67AC   $685D  
;;  $51EA       $51EE  
;;  $51F1       $514F   $516E   $5BFE   $67C8   $689E  
;;  $51FF       $5063   $6869  
;;  $5252       $525D  
;;  $5261       $5269  
;;  $5277       $527E  
;;  $528F       $528C  
;;  $52AA       $52A7  
;;  $52D1       $52E2  
;;  $52DD       $52DA  
;;  $530A       $6865  
;;  $5353       $534B  
;;  $5356       $534F  
;;  $5358       $5351   $5354  
;;  $5369       $5379   $5396   $5407  
;;  $537B       $536D  
;;  $5386       $5380  
;;  $5388       $5384  
;;  $5398       $537C  
;;  $53C9       $53C5  
;;  $53DE       $53C7  
;;  $53E5       $53DC  
;;  $53F9       $53F5  
;;  $5405       $5377   $5394  
;;  $5419       $524A   $53BE  
;;  $541E       $543D   $544B  
;;  $543F       $5445  
;;  $5440       $5436  
;;  $544D       <entry> $510E  
;;  $5459       $5475  
;;  $546D       $5460  
;;  $5477       $546F  
;;  $5491       <entry>
;;  $549C       $54E4   $54EE  
;;  $54AB       $54B2  
;;  $54B4       $54F4  
;;  $54BE       $549E  
;;  $54C9       $54D0  
;;  $54DC       $54B7   $54D5  
;;  $54E6       $54BB   $54D9  
;;  $54F0       $54A9   $54C7  
;;  $54F6       $5147  
;;  $5503       $5507  
;;  $5514       $551A  
;;  $5531       $553E  
;;  $553B       $5529   $552F  
;;  $5540       $5296   $52B2   $553B  
;;  $5556       $554C  
;;  $555C       $5554  
;;  $555E       $556C  
;;  $557F       $5578  
;;  $5583       $557D  
;;  $5584       $558D  
;;  $559C       $5592  
;;  $55A2       $559A  
;;  $55B0       $55A8  
;;  $55D5       $5538   $55FC  
;;  $55F0       $55E1  
;;  $55FB       $55EB   $55EE   $55F8  
;;  $560D       $5601  
;;  $5613       $5609  
;;  $5619       $5606  
;;  $5622       $560B   $5611   $5617   $5620  
;;  $5647       $5644  
;;  $5653       $5648  
;;  $56D4       $56D2   $56D4  
;;  $56DC       $56DA  
;;  $56F3       $56F1  
;;  $56FB       $56F9  
;;  $57AC       $57AA  
;;  $5800       $6A17  
;;  $591B       $5919  
;;  $591C       $591A  
;;  $591E       $DE7E  
;;  $5934       $5934  
;;  $597C       $597A  
;;  $59EF       $59ED  
;;  $5A1F       $5A1D  
;;  $5A43       $5A41  
;;  $5B1D       $5B1B  
;;  $5B4E       $5B39  
;;  $5B4F       $5B3D  
;;  $5B66       $5B5E  
;;  $5B73       $5B6B  
;;  $5B83       $5B78  
;;  $5B99       $5B88  
;;  $5BBC       $5BB4  
;;  $5BD1       $53D2   $5CF7   $5DB1   $5DC2   $5E11   $5EA0   $5EED   $5F93  
;;  $5BF1       $5BF3  
;;  $5C02       $5B5A   $5B67   $5B74   $5B84   $5B9A   $5BB0   $5BBD  
;;  $5C21       $5C1E  
;;  $5C27       $5C23  
;;  $5C2B       $5C28  
;;  $5C2F       $5C25  
;;  $5C3B       $5C2D  
;;  $5C69       $5C75  
;;  $5C8C       $5C4A  
;;  $5C92       $52DD   $5C70  
;;  $5C9D       $5C99  
;;  $5CD2       $5C5F  
;;  $5CDD       $5C45  
;;  $5CE6       $5CDE  
;;  $5D03       $5CFD  
;;  $5D1E       $5D16  
;;  $5D1F       $5D1D  
;;  $5D29       $5D10  
;;  $5D3B       $5D1A  
;;  $5D59       $5D4A  
;;  $5D6D       $5D60  
;;  $5D6E       $5D67  
;;  $5DAE       $5DA5  
;;  $5DE6       $5E01  
;;  $5DEF       $5DE0  
;;  $5DFB       $5DDC  
;;  $5E03       $5DE4  
;;  $5E11       $5DD1  
;;  $5E56       $5E66  
;;  $5E58       $5E52  
;;  $5E5A       $5E54   $5E68  
;;  $5E63       $5E4D  
;;  $5E86       $5E43  
;;  $5EB8       $5EB1  
;;  $5EBF       $5EBB  
;;  $5ECE       $5EB6   $5EBD  
;;  $5ED5       $5EB4  
;;  $5EE4       $5EDA  
;;  $5F04       $5F10  
;;  $5F0B       $5EFE  
;;  $5F12       $5F02  
;;  $5F22       $5F1A  
;;  $5F44       $5F39  
;;  $5F6E       $5F67  
;;  $5F8A       $5F53  
;;  $5FA3       $5FA3  
;;  $604A       $6048  
;;  $60CB       $60C9  
;;  $616B       $616B  
;;  $647C       $647A  
;;  $64C9       $64C7  
;;  $65EA       $51A8  
;;  $65F5       $65FA  
;;  $6609       $6677  
;;  $6629       $661F  
;;  $662C       $6623  
;;  $662F       $662A  
;;  $6630       $6635  
;;  $6646       $6641  
;;  $6647       $6645  
;;  $6655       $664F  
;;  $6659       $6653  
;;  $6668       $6661  
;;  $6669       $6667  
;;  $6691       $6909  
;;  $66B4       $6694  
;;  $66E8       $675E   $6768  
;;  $66F0       $667C   $6681   $6689   $668F  
;;  $6709       $66FE   $674A  
;;  $6716       $6746  
;;  $6721       $6714  
;;  $6736       $671E   $672C  
;;  $673D       $66E5  
;;  $674C       $66DD   $66E0  
;;  $6754       $674E  
;;  $6756       $6752  
;;  $6760       $675A  
;;  $676A       $6764  
;;  $678B       $677D  
;;  $6791       $6789  
;;  $679E       $5D06   $6799  
;;  $67A1       $67B0  
;;  $67A5       $67A6  
;;  $67BE       $67BA  
;;  $67C3       $67BF  
;;  $67DF       $67D9  
;;  $67E0       $67DD  
;;  $67ED       $67E3  
;;  $67F3       $67E6   $67EB   $67EE  
;;  $67F4       $67CE  
;;  $67F8       $67E8   $67F0  
;;  $6805       $67FD  
;;  $6809       $6803  
;;  $6819       $682C  
;;  $683C       $684B  
;;  $6845       $6840  
;;  $6846       $6844  
;;  $684F       $679C  
;;  $6856       $5D09  
;;  $6859       $6853  
;;  $6869       $6863  
;;  $688F       $6887  
;;  $6895       $688D   $6893  
;;  $68A2       $5CFF  
;;  $68AE       $68CC   $68D4  
;;  $68C6       $68B1  
;;  $68CE       $68C8  
;;  $68D6       $68C4  
;;  $6923       $53FE   $5DB8   $5DC9   $5E18   $5EA7   $5EF4   $5F9A   $68F9  
;;  $699A       $6997  
;;  $69A0       $69A6  
;;  $6A07       $6A05  
;;  $6A0E       $6A0C  
;;  $6A15       $6A13  
;;  $6A23       $6A21  
;;  $6A2A       $6A28  
;;  $6A46       $6A44  
;;  $6A54       $6A52  
;;  $6A62       $6A60  
;;  $6A69       $6A67  
;;  $6A70       $6A6E  
;;  $6A77       $6A75  
;;  $6A7C       $6970   $6982   $6990   $69CA   $69DE   $69F7  
;;  $6A7F       $6A98  
;;  $6A8B       $6A88  
;;  $6A93       $6A90  
;;  $6ABD       $6ABB  
;;  $6AC5       $6AC3  
;;  $6AFB       $522C  
;;  $6BD4       <entry>
;;  $6D6D       $66CD  
;;  $D000       $5F0C  
;;  $D00C       $5401   $5DB4   $5DC5   $5E14   $5EA3   $5EF0   $5F96  
;;  $D025       <entry>
;;  $D033       $D030  
;;  $D03A       $5F2F  
;;  $D049       $5B96  
;;  $D069       $D0EF  
;;  $D07D       <entry> $6791  
;;  $D096       $D08D  
;;  $D097       $D099  
;;  $D0AE       $D0B5  
;;  $D0B8       $D0B1  
;;  $D0B9       $D0B7  
;;  $D0CB       $D0C2  
;;  $D0CD       $D0ED   $D0F3  
;;  $D0E4       $D0E2  
;;  $D0E6       $D0DD  
;;  $D0EC       $D0FC  
;;  $D0F5       $D0FE  
;;  $D0F6       $D0EA  
;;  $D100       $D0E6   $D0F7  
;;  $D114       $D10A   $D10D  
;;  $D115       $D0D0  
;;  $D129       $D085   $D094  
;;  $D16A       $D168  
;;  $D30C       $D31B  
;;  $D38C       $D4EA  
;;  $D3D0       $D55B  
;;  $D3F4       $D3F2  
;;  $D51E       $D568  
;;  $D525       $D523  
;;  $D54F       $D54F  
;;  $D585       $D583  
;;  $D6B7       $D3EC  
;;  $D6BF       $D61A  
;;  $D75C       $DAAB  
;;  $D798       $DAE7  
;;  $D7EC       $D551  
;;  $D804       $F142  
;;  $D805       $D805  
;;  $D893       $D68E  
;;  $D8CF       $D657  
;;  $D8E6       $D8E4  
;;  $D91B       $DC65  
;;  $DA85       $D984  
;;  $DAC6       $DAC6  
;;  $DB02       $DB02  
;;  $DB0F       $D847  
;;  $DB1A       $DB18  
;;  $DB24       $D94E  
;;  $DB8D       $DB8B  
;;  $DBDF       $D81A  
;;  $DBF8       $D994  
;;  $DC2C       $DA18  
;;  $DDC9       $DE2C  
;;  $DFA2       $DF3D  
;;  $F04D       $F04D  
;;  $F189       $F187  
;;  $F1D9       $F4D3  
;;  $F201       $F079  
;;  $F23A       $F3C1  
;;  $F2D8       $F273  
;;  $F35D       $F2D3  
;;  $F3C4       $F0FE  
;;  $F437       $F497  
;;  $F468       $F270  
;;  $F566       $F564  
;;  $F56E       $F3FA  
;;  $F5D3       $F2BF  
;;  $F628       $F626  
;;  $F654       $F652  
;;  $F68A       $F570  
;;  $F69B       $F4EA  
;;  $F6B7       $F746  
;;  $F6EC       $F783  
;;  $F751       $F63F  
;;  $F758       $F493  
;;  $F75E       $F75C  
;;  $F7A8       $F7A8  
;;  $F7B3       $F5B1  
;;  $F812       $F812  
;;  $F84A       $F8C9  
;;  $F89F       $F56C  
;;  $F8BE       $F65D  
;;  $F8C6       $F70D  
;;  $F8E6       $F8E4  
;;  $F905       $F8FF  
;;  $F933       $F81F  
;;  $F959       $F950  
;;  $F9B3       $F956  
;;  $F9CF       $F9CF  
;;  $F9E3       $F797  
;; ======================================================================== ;;
