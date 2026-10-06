
        ORG     $5000
.HEADER:
        BIDECLE $5DDD           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5039           ; 5004  Ptr: Start of game
        BIDECLE $6115           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5253           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5032           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0003           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0044,  $0053,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0040,  $005B,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $0059,  $0064,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $00F5,  $006E,  $0001,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

.TITLE:
        DECLE   $0052                           ; 5032  Cartridge year
        STRING  "TRON"                          ; 5033  Title string
        DECLE   $0000                           ; 5037  

.TITLECODE:
        PULR    R7                              ; 5038   02B7

.START:
        PSHR    R5                              ; 5039   0275

        JSR     R5,     L_6AAE                  ; 503A   0004 0168 02AE
        JSRD    R5,     L_6DCA                  ; 503D   0004 016E 01CA

        MOVR    R7,     R3                      ; 5040   00BB
        ADDI    #$0032, R3                      ; 5041   02FB 0032

        JSR     R5,     L_6D89                  ; 5043   0004 016C 0189

        MVII    #$0009, R0                      ; 5046   02B8 0009
        MVO     R0,     G_0317                  ; 5048   0240 0317
        MVII    #$00FA, R0                      ; 504A   02B8 00FA
        MVO     R0,     G_0318                  ; 504C   0240 0318
        MVO     R0,     G_035E                  ; 504E   0240 035E
        MVII    #$0003, R0                      ; 5050   02B8 0003
        MVO     R0,     G_0103                  ; 5052   0240 0103
        MVO     R0,     G_016E                  ; 5054   0240 016E
        MVII    #$000E, R0                      ; 5056   02B8 000E
        MVO     R0,     G_0115                  ; 5058   0240 0115
        SLL     R0,     1                       ; 505A   0048
        MVO     R0,     G_0187                  ; 505B   0240 0187
        MVII    #$0080, R0                      ; 505D   02B8 0080
        MVO     R0,     G_012E                  ; 505F   0240 012E

        JSR     R5,     L_50BA                  ; 5061   0004 0150 00BA

        MVII    #$00C8, R0                      ; 5064   02B8 00C8
        MOVR    R7,     R1                      ; 5066   00B9
        ADDI    #$0016, R1                      ; 5067   02F9 0016

        JSR     R5,     .EXEC.A5E               ; 5069   0004 0118 025E

        SDBD                                    ; 506C   0001
        MVII    #$624D, R0                      ; 506D   02B8 004D 0062
        MVO     R0,     G_035D                  ; 5070   0240 035D
        PULR    R7                              ; 5072   02B7

        DECLE   $0006,  $0000,  $0002,  $0000   ; 5073   0006 0000 0002 0000

        SLL     R0,     2                       ; 5077   004C
        ADDR    R3,     R7                      ; 5078   00DF

        DECLE   $0005,  $00D0,  $0000,  $0000   ; 5079   0005 00D0 0000 0000

        MVII    #$005A, R0                      ; 507D   02B8 005A
        MOVR    R7,     R1                      ; 507F   00B9
        ADDI    #$000D, R1                      ; 5080   02F9 000D

        JSR     R5,     .EXEC.A5E               ; 5082   0004 0118 025E
        JSR     R5,     L_527A                  ; 5085   0004 0150 027A

        MVII    #$00D8, R0                      ; 5088   02B8 00D8
        MVO     R0,     G_018F                  ; 508A   0240 018F
        PULR    R7                              ; 508C   02B7

        JSR     R5,     L_50BA                  ; 508D   0004 0150 00BA

        MVII    #$00C8, R0                      ; 5090   02B8 00C8
        MOVR    R7,     R1                      ; 5092   00B9
        ADDI    #$0006, R1                      ; 5093   02F9 0006

        JSR     R5,     .EXEC.A5E               ; 5095   0004 0118 025E

        PULR    R7                              ; 5098   02B7

        MVII    #$008C, R0                      ; 5099   02B8 008C
        SDBD                                    ; 509B   0001
        MVII    #$5061, R1                      ; 509C   02B9 0061 0050

        JSR     R5,     .EXEC.A5E               ; 509F   0004 0118 025E

        MVII    #$0008, R0                      ; 50A2   02B8 0008
        MVO     R0,     G_0104                  ; 50A4   0240 0104

        JSR     R5,     L_5A5E                  ; 50A6   0004 0158 025E

        SDBD                                    ; 50A9   0001
        MVII    #$080A, R0                      ; 50AA   02B8 000A 0008
        MVII    #$02E3, R1                      ; 50AD   02B9 02E3
        MVO@    R0,     R1                      ; 50AF   0248
        ADDI    #$0004, R1                      ; 50B0   02F9 0004
        MVO@    R0,     R1                      ; 50B2   0248
        ADDI    #$0002, R1                      ; 50B3   02F9 0002
        MVO@    R0,     R1                      ; 50B5   0248

        JSR     R5,     L_5B0D                  ; 50B6   0004 0158 030D

        PULR    R7                              ; 50B9   02B7

L_50BA:
        PSHR    R5                              ; 50BA   0275
        MVII    #$0019, R0                      ; 50BB   02B8 0019
        MVO     R0,     G_011E                  ; 50BD   0240 011E
        CLRR    R1                              ; 50BF   01C9
        MVO     R1,     G_0180                  ; 50C0   0241 0180
        MVO     R0,     G_016F                  ; 50C2   0240 016F

        JSR     R5,     L_6858                  ; 50C4   0004 0168 0058
        JSR     R5,     L_6AAE                  ; 50C7   0004 0168 02AE

        MVII    #$0007, R3                      ; 50CA   02BB 0007
        MVII    #$0242, R4                      ; 50CC   02BC 0242

        JSR     R5,     X_PRINT_R5              ; 50CE   0004 0118 007B
        STRING  "presents"                      ; 50D1  
        DECLE   $0000                           ; 50D9   0000

        MVII    #$02CD, R4                      ; 50DA   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 50DC   0004 0118 007B
        STRING  "1982 Mattel"                   ; 50DF  
        DECLE   $0000                           ; 50EA   0000

        MVII    #$02E1, R4                      ; 50EB   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; 50ED   0004 0118 007B
        STRING  "1982 Disney"                   ; 50F0  
        DECLE   $0000                           ; 50FB   0000

        MVII    #$0001, R2                      ; 50FC   02BA 0001
        MVII    #$0215, R4                      ; 50FE   02BC 0215

        JSR     R5,     L_6827                  ; 5100   0004 0168 0027
        DECLE   $004D,  $0041,  $0054,  $0054   ; 5103   004D 0041 0054 0054
        DECLE   $0045,  $004C,  $006F,  $0045   ; 5107   0045 004C 006F 0045
        DECLE   $004C,  $0045,  $0043,  $0054   ; 510B   004C 0045 0043 0054
        DECLE   $0052,  $004F,  $004E,  $0049   ; 510F   0052 004F 004E 0049
        DECLE   $0043,  $0053,  $0000           ; 5113   0043 0053 0000

        MVII    #$0001, R2                      ; 5116   02BA 0001
        MVII    #$0269, R4                      ; 5118   02BC 0269

        JSR     R5,     L_6827                  ; 511A   0004 0168 0027
        DECLE   $003F,  $0051,  $004A,  $005B   ; 511D   003F 0051 004A 005B
        DECLE   $005C,  $005D,  $005E,  $005F   ; 5121   005C 005D 005E 005F
        DECLE   $0060,  $0061,  $0000           ; 5125   0060 0061 0000

        MVII    #$0001, R2                      ; 5128   02BA 0001
        MVII    #$027D, R4                      ; 512A   02BC 027D

        JSR     R5,     L_6827                  ; 512C   0004 0168 0027
        DECLE   $0062,  $0063,  $0064,  $0065   ; 512F   0062 0063 0064 0065
        DECLE   $0066,  $0067,  $0068,  $0069   ; 5133   0066 0067 0068 0069
        DECLE   $006A,  $006B,  $0000           ; 5137   006A 006B 0000

        MVII    #$0001, R2                      ; 513A   02BA 0001
        MVII    #$02A4, R4                      ; 513C   02BC 02A4

        JSR     R5,     L_6827                  ; 513E   0004 0168 0027
        DECLE   $0053,  $004F,  $004C,  $0041   ; 5141   0053 004F 004C 0041
        DECLE   $0052,  $006F,  $0053,  $0041   ; 5145   0052 006F 0053 0041
        DECLE   $0049,  $004C,  $0045,  $0052   ; 5149   0049 004C 0045 0052
        DECLE   $0000                           ; 514D   0000

        SDBD                                    ; 514E   0001
        MVII    #$0887, R0                      ; 514F   02B8 0087 0008
        MVO     R0,     .BTAB.CC                ; 5152   0240 02CC
        MVO     R0,     .BTAB.E0                ; 5154   0240 02E0
        PULR    R7                              ; 5156   02B7

        PSHR    R5                              ; 5157   0275
        MVII    #$0007, R0                      ; 5158   02B8 0007
        MVO     R0,     G_016E                  ; 515A   0240 016E
        MVO     R0,     G_018A                  ; 515C   0240 018A
        MVO     R0,     G_016D                  ; 515E   0240 016D
        CLRR    R0                              ; 5160   01C0
        MVO     R0,     G_0317                  ; 5161   0240 0317
        MVO     R0,     G_0318                  ; 5163   0240 0318
        MVII    #$0032, R0                      ; 5165   02B8 0032
        MVO     R0,     G_018E                  ; 5167   0240 018E

        JSR     R5,     L_5233                  ; 5169   0004 0150 0233

        MVII    #$000C, R0                      ; 516C   02B8 000C
        CLRR    R1                              ; 516E   01C9
        MVII    #$0173, R4                      ; 516F   02BC 0173

        JSR     R5,     X_FILL_MEM              ; 5171   0004 0114 0341

        MVII    #$0173, R4                      ; 5174   02BC 0173
        MVII    #$016E, R5                      ; 5176   02BD 016E
L_5178:
        MVI@    R5,     R0                      ; 5178   02A8
        ADDI    #$0007, R0                      ; 5179   02F8 0007
        MVO@    R0,     R4                      ; 517B   0260
        INCR    R4                              ; 517C   000C
        CMPI    #$0173, R5                      ; 517D   037D 0173
        BNEQ    L_5178                          ; 517F   022C 0008

L_5181:
        MVI     G_01AB, R1                      ; 5181   0281 01AB
        ANDI    #$0040, R1                      ; 5183   03B9 0040
        BNEQ    L_5181                          ; 5185   022C 0005

        JSR     R5,     L_6858                  ; 5187   0004 0168 0058
        JSR     R5,     L_6AAE                  ; 518A   0004 0168 02AE

        MVII    #$0060, R0                      ; 518D   02B8 0060
        MVO     R0,     .PSG0.chn_a_lo          ; 518F   0240 01F0
        MVII    #$000B, R0                      ; 5191   02B8 000B
        MVO     R0,     .PSG0.chn_a_vol         ; 5193   0240 01FB
        MVII    #$0005, R3                      ; 5195   02BB 0005
        CLRR    R2                              ; 5197   01D2
        MVII    #$022A, R4                      ; 5198   02BC 022A

        JSR     R5,     L_6827                  ; 519A   0004 0168 0027
        DECLE   $0054,  $0052,  $0041,  $0043   ; 519D   0054 0052 0041 0043
        DECLE   $004B,  $0000                   ; 51A1   004B 0000

        MVI     G_016E, R0                      ; 51A3   0280 016E

        JSR     R5,     L_6833                  ; 51A5   0004 0168 0033
        DECLE   $0000                           ; 51A8   0000

        CLRR    R2                              ; 51A9   01D2
        MVII    #$0252, R4                      ; 51AA   02BC 0252

        JSR     R5,     L_6827                  ; 51AC   0004 0168 0027
        DECLE   $004C,  $004F,  $0043,  $003A   ; 51AF   004C 004F 0043 003A
        DECLE   $006F,  $006F,  $0053,  $0045   ; 51B3   006F 006F 0053 0045
        DECLE   $0043,  $0054,  $004F,  $0052   ; 51B7   0043 0054 004F 0052
        DECLE   $006F,  $0030,  $0000           ; 51BB   006F 0030 0000

        CLRR    R2                              ; 51BE   01D2
        MVII    #$027A, R4                      ; 51BF   02BC 027A

        JSR     R5,     L_6827                  ; 51C1   0004 0168 0027
        DECLE   $0047,  $004F,  $0041,  $004C   ; 51C4   0047 004F 0041 004C
        DECLE   $003A,  $006F,  $0053,  $0045   ; 51C8   003A 006F 0053 0045
        DECLE   $0043,  $0054,  $004F,  $0052   ; 51CC   0043 0054 004F 0052
        DECLE   $0000                           ; 51D0   0000

        MVI     G_016F, R0                      ; 51D1   0280 016F

        JSR     R5,     L_6833                  ; 51D3   0004 0168 0033
        DECLE   $0000                           ; 51D6   0000

        CLRR    R0                              ; 51D7   01C0
        MVO     R0,     .PSG0.chn_a_lo          ; 51D8   0240 01F0
        MVII    #$02FD, R0                      ; 51DA   02B8 02FD
        MVO     R0,     .BTAB.89                ; 51DC   0240 0289

        JSR     R5,     L_6AB7                  ; 51DE   0004 0168 02B7

        CLRR    R0                              ; 51E1   01C0
        MVO     R0,     .BTAB.89                ; 51E2   0240 0289
        MVO     R0,     G_012E                  ; 51E4   0240 012E
        INCR    R0                              ; 51E6   0008
        MVO     R0,     .PSG0.chn_a_hi          ; 51E7   0240 01F4
        MVII    #$0002, R3                      ; 51E9   02BB 0002
        CLRR    R2                              ; 51EB   01D2
        MVII    #$02A2, R4                      ; 51EC   02BC 02A2

        JSR     R5,     L_6827                  ; 51EE   0004 0168 0027
        DECLE   $0049,  $003C,  $004F,  $006F   ; 51F1   0049 003C 004F 006F
        DECLE   $0042,  $0045,  $0041,  $004D   ; 51F5   0042 0045 0041 004D
        DECLE   $0000                           ; 51F9   0000

        CLRR    R2                              ; 51FA   01D2
        MVII    #$02CA, R4                      ; 51FB   02BC 02CA

        JSR     R5,     L_6827                  ; 51FD   0004 0168 0027
        DECLE   $006F,  $006F,  $0041,  $0043   ; 5200   006F 006F 0041 0043
        DECLE   $0043,  $0045,  $0053,  $0053   ; 5204   0043 0045 0053 0053
        DECLE   $006F,  $0043,  $004F,  $0044   ; 5208   006F 0043 004F 0044
        DECLE   $0045,  $003A,  $006F,  $0000   ; 520C   0045 003A 006F 0000

        MVII    #$0005, R3                      ; 5210   02BB 0005
        MVII    #$02FD, R0                      ; 5212   02B8 02FD
        MVII    #$02D9, R1                      ; 5214   02B9 02D9
        MVO@    R0,     R1                      ; 5216   0248
        MVII    #$0050, R0                      ; 5217   02B8 0050
        SWAP    R0,     1                       ; 5219   0040
L_521A:
        DECR    R0                              ; 521A   0010
        NOP                                     ; 521B   0034
        BNEQ    L_521A                          ; 521C   022C 0003

        MVII    #$0173, R3                      ; 521E   02BB 0173

        JSR     R5,     L_6D89                  ; 5220   0004 016C 0189

        SDBD                                    ; 5223   0001
        MVII    #$1906, R0                      ; 5224   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5227   0240 035D
        MVII    #$003C, R0                      ; 5229   02B8 003C
        SDBD                                    ; 522B   0001
        MVII    #$527B, R1                      ; 522C   02B9 007B 0052

        JSR     R5,     .EXEC.A5E               ; 522F   0004 0118 025E

        PULR    R7                              ; 5232   02B7

L_5233:
        PSHR    R5                              ; 5233   0275
        MVII    #$0006, R0                      ; 5234   02B8 0006

        JSR     R5,     X_RAND2                 ; 5236   0004 0114 029E

        SARC    R0,     1                       ; 5239   0078
        CLRR    R4                              ; 523A   01E4
        ADCR    R4                              ; 523B   002C
        MVO     R4,     G_0180                  ; 523C   0244 0180
        ADDI    #$0003, R0                      ; 523E   02F8 0003
        MVO     R0,     G_016F                  ; 5240   0240 016F
        MVII    #$0170, R4                      ; 5242   02BC 0170
L_5244:
        MVII    #$000A, R0                      ; 5244   02B8 000A

        JSR     R5,     X_RAND2                 ; 5246   0004 0114 029E

        MVO@    R0,     R4                      ; 5249   0260
        CMPI    #$0173, R4                      ; 524A   037C 0173
        BNEQ    L_5244                          ; 524C   022C 0009

        MVII    #$0019, R0                      ; 524E   02B8 0019
        MVO     R0,     G_0187                  ; 5250   0240 0187
        PULR    R7                              ; 5252   02B7

.GRAM_INIT_5253:
        DECLE   $0040           ; 5253  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5254  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5256  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5258  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 525A  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 525C  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 525E  #28-2F:  CART #28-2F ----
        DECLE   $0061,  $0380   ; 5260  #30-37:  CART #30-37 ----
        DECLE   $0071,  $0300   ; 5262  #38-3E:  CART #38-3E ----
        DECLE   $0001,  $0010   ; 5264  #3F-3F:  GROM #00-00 ----

        DECLE   $002B,  $0001                   ; 5266   002B 0001

        AND     .STIC.A.1,R0                    ; 5268   0380 0011
        AND     .STIC.VIDEN,R0                  ; 526A   0380 0020
        SUBR    R2,     R7                      ; 526C   0117

        DECLE   $0100,  $0079,  $0180,  $0279   ; 526D   0100 0079 0180 0279

        ANDR    R0,     R0                      ; 5271   0180
        CMPR    R7,     R1                      ; 5272   0179
        ANDR    R0,     R0                      ; 5273   0180
        CMPI    #$0180, R1                      ; 5274   0379 0180
        COMR    R4                              ; 5276   001C
        RSWD    R2                              ; 5277   003A
        NEGR    R6                              ; 5278   0026
        SWAP    R0,     1                       ; 5279   0040
L_527A:
        PSHR    R5                              ; 527A   0275
        MVI     G_016E, R1                      ; 527B   0281 016E

        JSR     R5,     L_529C                  ; 527D   0004 0150 029C

        CLRR    R0                              ; 5280   01C0
        MVO     R0,     G_0166                  ; 5281   0240 0166
        MVO     R0,     G_01A4                  ; 5283   0240 01A4
        MVII    #$0003, R0                      ; 5285   02B8 0003
        MVO     R0,     G_0167                  ; 5287   0240 0167
        MVO     R0,     G_0163                  ; 5289   0240 0163
        MVII    #$000A, R1                      ; 528B   02B9 000A

        JSR     R5,     L_6786                  ; 528D   0004 0164 0386

        CLRR    R0                              ; 5290   01C0
        MVO     R0,     G_0163                  ; 5291   0240 0163
        MVI     G_015F, R0                      ; 5293   0280 015F
        SDBD                                    ; 5295   0001
        XORI    #$0900, R0                      ; 5296   03F8 0000 0009
        MVO     R0,     .BTAB.82                ; 5299   0240 0282
        PULR    R7                              ; 529B   02B7

L_529C:
        PSHR    R5                              ; 529C   0275
        PSHR    R1                              ; 529D   0271
        SDBD                                    ; 529E   0001
        MVII    #$5D69, R0                      ; 529F   02B8 0069 005D
        MVO     R0,     G_0356                  ; 52A2   0240 0356
        MVII    #$0040, R0                      ; 52A4   02B8 0040
        MVO     R0,     G_0355                  ; 52A6   0240 0355
        MVII    #$03F0, R0                      ; 52A8   02B8 03F0
        MVO     R0,     G_035A                  ; 52AA   0240 035A
        MVII    #$0007, R0                      ; 52AC   02B8 0007

        JSR     R5,     .EXEC.41C               ; 52AE   0004 0114 001C

        PULR    R1                              ; 52B1   02B1
        XORI    #$0008, R1                      ; 52B2   03F9 0008

        JSR     R5,     L_6858                  ; 52B4   0004 0168 0058
        JSR     R5,     L_6AAE                  ; 52B7   0004 0168 02AE

        MVII    #$0200, R4                      ; 52BA   02BC 0200

L_52BC:
        JSR     R5,     L_674F                  ; 52BC   0004 0164 034F

        MVO@    R0,     R4                      ; 52BF   0260
        CMPI    #$02F0, R4                      ; 52C0   037C 02F0
        BNEQ    L_52BC                          ; 52C2   022C 0007

        MVII    #$0002, R0                      ; 52C4   02B8 0002
        MVII    #$031D, R2                      ; 52C6   02BA 031D
        SDBD                                    ; 52C8   0001
        MVII    #$5D82, R1                      ; 52C9   02B9 0082 005D

        JSR     R5,     X_INIT_MOBS             ; 52CC   0004 0114 02B4

        MVII    #$0001, R0                      ; 52CF   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 52D1   0004 0114 02CF

        MVII    #$0010, R0                      ; 52D4   02B8 0010
        SWAP    R0,     1                       ; 52D6   0040
        MVO     R0,     G_0329                  ; 52D7   0240 0329
        MVII    #$0046, R1                      ; 52D9   02B9 0046
        MVI     G_0180, R0                      ; 52DB   0280 0180
        TSTR    R0                              ; 52DD   0080
        BNEQ    L_52F0                          ; 52DE   020C 0010

        SDBD                                    ; 52E0   0001
        MVII    #$3AD1, R0                      ; 52E1   02B8 00D1 003A
        MVO     R0,     G_031D                  ; 52E4   0240 031D
        MVO     R0,     G_0325                  ; 52E6   0240 0325
        MVII    #$0002, R0                      ; 52E8   02B8 0002
        MVO     R0,     G_0322                  ; 52EA   0240 0322
        MVO     R0,     G_032A                  ; 52EC   0240 032A
        MVII    #$0056, R1                      ; 52EE   02B9 0056
L_52F0:
        MVO     R1,     G_015F                  ; 52F0   0241 015F
        SDBD                                    ; 52F2   0001
        XORI    #$0900, R1                      ; 52F3   03F9 0000 0009
        MVII    #$0278, R4                      ; 52F6   02BC 0278
        MVII    #$0014, R0                      ; 52F8   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 52FA   0004 0114 0341

        MVII    #$0078, R0                      ; 52FD   02B8 0078
        MVO     R0,     G_015E                  ; 52FF   0240 015E
        MVO     R0,     G_01A4                  ; 5301   0240 01A4
        MVII    #$0019, R0                      ; 5303   02B8 0019
        MVO     R0,     G_0183                  ; 5305   0240 0183
        CLRR    R3                              ; 5307   01DB
        MVI     G_016E, R1                      ; 5308   0281 016E
        SLR     R1,     1                       ; 530A   0061
L_530B:
        ADDR    R0,     R3                      ; 530B   00C3
        DECR    R1                              ; 530C   0011
        BPL     L_530B                          ; 530D   0223 0003

        MVO     R3,     G_0186                  ; 530F   0243 0186
        MVII    #$004B, R0                      ; 5311   02B8 004B

        JSR     R5,     X_RAND2                 ; 5313   0004 0114 029E

        ADDI    #$001E, R0                      ; 5316   02F8 001E
        MVO     R0,     G_0165                  ; 5318   0240 0165
        MVO     R0,     G_0182                  ; 531A   0240 0182

        JSR     R5,     L_566C                  ; 531C   0004 0154 026C

        MVII    #$0002, R0                      ; 531F   02B8 0002
        SUB     G_0180, R0                      ; 5321   0300 0180
        MVO     R0,     G_015D                  ; 5323   0240 015D
        CLRR    R0                              ; 5325   01C0
        MVO     R0,     G_0181                  ; 5326   0240 0181
        MVO     R0,     G_0128                  ; 5328   0240 0128
        MVO     R0,     G_012C                  ; 532A   0240 012C
        MVI     G_016D, R0                      ; 532C   0280 016D
        TSTR    R0                              ; 532E   0080
        BEQ     L_5339                          ; 532F   0204 0008

        MOVR    R7,     R0                      ; 5331   00B8
        ADDI    #$0008, R0                      ; 5332   02F8 0008
        MVO     R0,     G_035D                  ; 5334   0240 035D

        JSR     R5,     L_6BB5                  ; 5336   0004 0168 03B5

L_5339:
        PULR    R7                              ; 5339   02B7

        MOVR    R4,     R5                      ; 533A   00A5
        RLC     R2,     2                       ; 533B   0056
        SARC    R1,     1                       ; 533C   0079
        RLC     R3,     2                       ; 533D   0057
        MOVR    R7,     R1                      ; 533E   00B9
        SLR     R1,     2                       ; 533F   0065
        MOVR    R4,     R5                      ; 5340   00A5
        SLR     R1,     2                       ; 5341   0065
        MOVR    R4,     R5                      ; 5342   00A5
        SLR     R1,     2                       ; 5343   0065
L_5344:
        PSHR    R5                              ; 5344   0275

        JSR     R5,     L_67FF                  ; 5345   0004 0164 03FF

        MVII    #$0001, R1                      ; 5348   02B9 0001

        JSR     R5,     L_6858                  ; 534A   0004 0168 0058

        MVI     G_012C, R0                      ; 534D   0280 012C
        SWAP    R0,     2                       ; 534F   0044
        BMI     L_544B                          ; 5350   020B 00F9

        MVI     G_035D, R0                      ; 5352   0280 035D
        SDBD                                    ; 5354   0001
        CMPI    #$533A, R0                      ; 5355   0378 003A 0053
        BNEQ    L_53B6                          ; 5358   020C 005C

        MVI     G_0180, R1                      ; 535A   0281 0180
        MVI     G_031F, R0                      ; 535C   0280 031F
        SWAP    R0,     1                       ; 535E   0040
        ANDI    #$00FF, R0                      ; 535F   03B8 00FF
        CMPI    #$000F, R0                      ; 5361   0378 000F
        BGE     L_536A                          ; 5363   020D 0005

        SLR     R1,     1                       ; 5365   0061
        BNEQ    L_536A                          ; 5366   020C 0002

        ADDI    #$0003, R0                      ; 5368   02F8 0003
L_536A:
        CMPI    #$0081, R0                      ; 536A   0378 0081
        BLE     L_5373                          ; 536C   0206 0005

        SLR     R1,     1                       ; 536E   0061
        BNEQ    L_5373                          ; 536F   020C 0002

        SUBI    #$0003, R0                      ; 5371   0338 0003
L_5373:
        SWAP    R0,     1                       ; 5373   0040
        MVO     R0,     G_031F                  ; 5374   0240 031F
        MVI     G_0320, R0                      ; 5376   0280 0320
        SWAP    R0,     1                       ; 5378   0040
        ANDI    #$00FF, R0                      ; 5379   03B8 00FF
        CMPI    #$0014, R0                      ; 537B   0378 0014
        BGE     L_5384                          ; 537D   020D 0005

        SLR     R1,     1                       ; 537F   0061
        BEQ     L_5384                          ; 5380   0204 0002

        ADDI    #$0003, R0                      ; 5382   02F8 0003
L_5384:
        CMPI    #$0046, R0                      ; 5384   0378 0046
        BLE     L_538D                          ; 5386   0206 0005

        SLR     R1,     1                       ; 5388   0061
        BEQ     L_538D                          ; 5389   0204 0002

        SUBI    #$0003, R0                      ; 538B   0338 0003
L_538D:
        SWAP    R0,     1                       ; 538D   0040
        MVO     R0,     G_0320                  ; 538E   0240 0320
        MVI     G_0182, R0                      ; 5390   0280 0182
        TSTR    R0                              ; 5392   0080
        BNEQ    L_5398                          ; 5393   020C 0003

        JSR     R5,     L_55DB                  ; 5395   0004 0154 01DB

L_5398:
        MVI     G_0183, R0                      ; 5398   0280 0183
        CMPI    #$0019, R0                      ; 539A   0378 0019
        BEQ     L_53A6                          ; 539C   0204 0008

        INCR    R0                              ; 539E   0008
        MVO     R0,     G_0183                  ; 539F   0240 0183
        MVI     G_0165, R0                      ; 53A1   0280 0165
        DECR    R0                              ; 53A3   0010
        MVO     R0,     G_0165                  ; 53A4   0240 0165
L_53A6:
        CLRR    R2                              ; 53A6   01D2

        JSR     R5,     L_566C                  ; 53A7   0004 0154 026C

        MVII    #$0022, R0                      ; 53AA   02B8 0022

        JSR     R5,     X_RAND2                 ; 53AC   0004 0114 029E

        TSTR    R0                              ; 53AF   0080
        BNEQ    L_53B6                          ; 53B0   020C 0004

        MVII    #$0001, R0                      ; 53B2   02B8 0001
        MVO     R0,     G_0159                  ; 53B4   0240 0159
L_53B6:
        MVI     G_016E, R0                      ; 53B6   0280 016E
        CMPI    #$0006, R0                      ; 53B8   0378 0006
        BPL     L_5436                          ; 53BA   0203 007A

        INCR    R0                              ; 53BC   0008
        MVII    #$003C, R1                      ; 53BD   02B9 003C

        JSR     R5,     X_MPY                   ; 53BF   0004 011C 01DC

        MOVR    R2,     R0                      ; 53C2   0090

        JSR     R5,     X_RAND2                 ; 53C3   0004 0114 029E

        TSTR    R0                              ; 53C6   0080
        BNEQ    L_5436                          ; 53C7   020C 006D

        MVII    #$0346, R4                      ; 53C9   02BC 0346
        MVI@    R4,     R0                      ; 53CB   02A0
        TSTR    R0                              ; 53CC   0080
        BEQ     L_53D5                          ; 53CD   0204 0006

        ADDI    #$0007, R4                      ; 53CF   02FC 0007
        MVI@    R4,     R0                      ; 53D1   02A0
        TSTR    R0                              ; 53D2   0080
        BNEQ    L_5436                          ; 53D3   020C 0061

L_53D5:
        SDBD                                    ; 53D5   0001
        MVII    #$38C2, R0                      ; 53D6   02B8 00C2 0038
        MOVR    R4,     R1                      ; 53D9   00A1
        SUBI    #$0002, R1                      ; 53DA   0339 0002
        MVO@    R0,     R1                      ; 53DC   0248
        MVII    #$0054, R0                      ; 53DD   02B8 0054
        SWAP    R0,     1                       ; 53DF   0040
        MVO@    R0,     R4                      ; 53E0   0260
        MVII    #$0002, R0                      ; 53E1   02B8 0002

        JSR     R5,     X_RAND2                 ; 53E3   0004 0114 029E

        TSTR    R0                              ; 53E6   0080
        BEQ     L_53EB                          ; 53E7   0204 0002

        MVII    #$0066, R0                      ; 53E9   02B8 0066
L_53EB:
        INCR    R0                              ; 53EB   0008
        SWAP    R0,     1                       ; 53EC   0040
        MVO@    R0,     R4                      ; 53ED   0260
        INCR    R4                              ; 53EE   000C
        MVII    #$0380, R0                      ; 53EF   02B8 0380
        MVO@    R0,     R4                      ; 53F1   0260
        SDBD                                    ; 53F2   0001
        MVII    #$5DC2, R0                      ; 53F3   02B8 00C2 005D
        INCR    R1                              ; 53F6   0009
        MVO@    R0,     R1                      ; 53F7   0248
        MVII    #$0002, R0                      ; 53F8   02B8 0002

        JSR     R5,     X_RAND2                 ; 53FA   0004 0114 029E

        TSTR    R0                              ; 53FD   0080
        BNEQ    L_5406                          ; 53FE   020C 0006

        MVII    #$0006, R0                      ; 5400   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5402   0004 0114 02E6

        XORR    R3,     R6                      ; 5405   01DE
L_5406:
        PSHR    R3                              ; 5406   0273
        MVII    #$0005, R0                      ; 5407   02B8 0005

        JSR     R5,     X_RAND2                 ; 5409   0004 0114 029E

        ADDI    #$0007, R0                      ; 540C   02F8 0007
        ADD     G_015E, R0                      ; 540E   02C0 015E
        MOVR    R0,     R1                      ; 5410   0081

        JSR     R5,     L_6A5A                  ; 5411   0004 0168 025A
        JSR     R5,     X_PACK_BYTES            ; 5414   0004 0114 034F

        MOVR    R0,     R2                      ; 5417   0082
        MVII    #$000A, R3                      ; 5418   02BB 000A
        MVI     G_016E, R1                      ; 541A   0281 016E
        DECR    R1                              ; 541C   0011
        BNEQ    L_5420                          ; 541D   020C 0001

        SLL     R3,     1                       ; 541F   004B
L_5420:
        MVII    #$0345, R1                      ; 5420   02B9 0345

        JSR     R5,     .EXEC.760               ; 5422   0004 0114 0360

        BEQ     L_542A                          ; 5425   0204 0003

        JSR     R5,     .EXEC.9A3               ; 5427   0004 0118 01A3

L_542A:
        MVII    #$034D, R1                      ; 542A   02B9 034D

        JSR     R5,     .EXEC.760               ; 542C   0004 0114 0360

        BEQ     L_5435                          ; 542F   0204 0004

        SLR     R3,     1                       ; 5431   0063

        JSR     R5,     .EXEC.9A3               ; 5432   0004 0118 01A3

L_5435:
        PULR    R3                              ; 5435   02B3
L_5436:
        MVII    #$0345, R4                      ; 5436   02BC 0345
L_5438:
        MOVR    R4,     R1                      ; 5438   00A1

        JSR     R5,     L_6A48                  ; 5439   0004 0168 0248

        SUBR    R2,     R3                      ; 543C   0113
        MOVR    R3,     R2                      ; 543D   009A
        CMP     G_015E, R2                      ; 543E   0342 015E
        BNEQ    L_5445                          ; 5440   020C 0003

        JSR     R5,     L_5566                  ; 5442   0004 0154 0166

L_5445:
        ADDI    #$0008, R4                      ; 5445   02FC 0008
        CMPI    #$0355, R4                      ; 5447   037C 0355
        BNEQ    L_5438                          ; 5449   022C 0012

L_544B:
        MVII    #$0200, R3                      ; 544B   02BB 0200
L_544D:
        MVI@    R3,     R1                      ; 544D   0299
        MVI     G_031D, R0                      ; 544E   0280 031D
        SLLC    R0,     1                       ; 5450   0058
        BC      L_549F                          ; 5451   0201 004C

        SLLC    R1,     2                       ; 5453   005D
        BOV     L_54A5                          ; 5454   0202 004F
        BNC     L_549F                          ; 5456   0209 0047

        MVII    #$033D, R1                      ; 5458   02B9 033D

        JSR     R5,     .EXEC.760               ; 545A   0004 0114 0360

        BNEQ    L_54B1                          ; 545D   020C 0052

        MVO     R0,     G_0342                  ; 545F   0240 0342
        MVII    #$0004, R0                      ; 5461   02B8 0004

        JSR     R5,     X_RAND2                 ; 5463   0004 0114 029E

        TSTR    R0                              ; 5466   0080
        BNEQ    L_54B1                          ; 5467   020C 0048

        MOVR    R3,     R1                      ; 5469   0099
        SUBI    #$0200, R1                      ; 546A   0339 0200
        PSHR    R3                              ; 546C   0273
        MOVR    R1,     R3                      ; 546D   008B

        JSR     R5,     L_6A5A                  ; 546E   0004 0168 025A

        INCR    R0                              ; 5471   0008
        SWAP    R0,     1                       ; 5472   0040
        MVO     R0,     G_033F                  ; 5473   0240 033F
        MOVR    R1,     R2                      ; 5475   008A
        MVII    #$003C, R0                      ; 5476   02B8 003C
        CMP     G_015E, R3                      ; 5478   0343 015E
        BGT     L_5484                          ; 547A   020E 0008

        ADDI    #$0005, R2                      ; 547C   02FA 0005
        SDBD                                    ; 547E   0001
        MVII    #$5C87, R4                      ; 547F   02BC 0087 005C
        B       L_548C                          ; 5482   0200 0008

L_5484:
        MVII    #$00C4, R0                      ; 5484   02B8 00C4
        SUBI    #$0003, R2                      ; 5486   033A 0003
        SDBD                                    ; 5488   0001
        MVII    #$5887, R4                      ; 5489   02BC 0087 0058
L_548C:
        SWAP    R2,     1                       ; 548C   0042
        DECLE   $0242,  $0340,  $0240,  $0341   ; 548D   0242 0340 0240 0341
        DECLE   $0001,  $02B9,  $00B7,  $005D   ; 5491   0001 02B9 00B7 005D
        DECLE   $0241,  $033E,  $0244,  $033D   ; 5495   0241 033E 0244 033D
        DECLE   $0004,  $0168,  $02F5           ; 5499   0004 0168 02F5

        PULR    R3                              ; 549C   02B3
        B       L_54B1                          ; 549D   0200 0012

L_549F:
        INCR    R3                              ; 549F   000B
        CMPI    #$02F0, R3                      ; 54A0   037B 02F0
        BLT     L_544D                          ; 54A2   0225 0056
        PULR    R7                              ; 54A4   02B7

L_54A5:
        MVII    #$0019, R2                      ; 54A5   02BA 0019
        BC      L_54B3                          ; 54A7   0201 000A

        MVI@    R3,     R0                      ; 54A9   0298
        SDBD                                    ; 54AA   0001
        XORI    #$1000, R0                      ; 54AB   03F8 0000 0010
        MVO@    R0,     R3                      ; 54AE   0258
        B       L_549F                          ; 54AF   0220 0011

L_54B1:
        MVII    #$004B, R2                      ; 54B1   02BA 004B
L_54B3:
        MVII    #$0001, R4                      ; 54B3   02BC 0001
        MVII    #$0335, R1                      ; 54B5   02B9 0335

L_54B7:
        JSR     R5,     .EXEC.760               ; 54B7   0004 0114 0360

        BEQ     L_54CD                          ; 54BA   0204 0011

        MVI@    R1,     R0                      ; 54BC   0288
        RRC     R0,     1                       ; 54BD   0070
        BC      L_54CD                          ; 54BE   0201 000D

        PSHR    R2                              ; 54C0   0272
        PSHR    R3                              ; 54C1   0273

        JSR     R5,     L_6A48                  ; 54C2   0004 0168 0248

        MOVR    R3,     R0                      ; 54C5   0098
        ADDI    #$0200, R0                      ; 54C6   02F8 0200
        PULR    R3                              ; 54C8   02B3
        PULR    R2                              ; 54C9   02B2
        SUBR    R3,     R0                      ; 54CA   0118
        BEQ     L_54D4                          ; 54CB   0204 0007

L_54CD:
        MVII    #$032D, R1                      ; 54CD   02B9 032D
        DECR    R4                              ; 54CF   0014
        BEQ     L_54B7                          ; 54D0   0224 001A
        B       L_549F                          ; 54D2   0220 0034

L_54D4:
        MVI     G_0164, R0                      ; 54D4   0280 0164
        SDBD                                    ; 54D6   0001
        XORI    #$0900, R0                      ; 54D7   03F8 0000 0009
        MVO@    R0,     R3                      ; 54DA   0258
        SDBD                                    ; 54DB   0001
        MVII    #$D086, R0                      ; 54DC   02B8 0086 00D0
        MVO@    R0,     R1                      ; 54DF   0248
        INCR    R1                              ; 54E0   0009
        SDBD                                    ; 54E1   0001
        MVII    #$5DD6, R0                      ; 54E2   02B8 00D6 005D
        MVO@    R0,     R1                      ; 54E5   0248
        ADDI    #$0004, R1                      ; 54E6   02F9 0004
        MVII    #$03C0, R0                      ; 54E8   02B8 03C0
        MVO@    R0,     R1                      ; 54EA   0248
        INCR    R1                              ; 54EB   0009
        MVII    #$0005, R0                      ; 54EC   02B8 0005
        MVO@    R0,     R1                      ; 54EE   0248
        MOVR    R2,     R0                      ; 54EF   0090

        JSR     R5,     L_6A6A                  ; 54F0   0004 0168 026A

        PSHR    R3                              ; 54F3   0273

        JSR     R5,     L_6B4A                  ; 54F4   0004 0168 034A

        PULR    R3                              ; 54F7   02B3
        B       L_549F                          ; 54F8   0220 005A

        PSHR    R5                              ; 54FA   0275
        SDBD                                    ; 54FB   0001
        MVII    #$9087, R0                      ; 54FC   02B8 0087 0090
        MVO@    R0,     R1                      ; 54FF   0248
        INCR    R1                              ; 5500   0009
        SDBD                                    ; 5501   0001
        MVII    #$5DD6, R0                      ; 5502   02B8 00D6 005D
        MVO@    R0,     R1                      ; 5505   0248
        MVII    #$03C0, R0                      ; 5506   02B8 03C0
        MVO     R0,     G_0342                  ; 5508   0240 0342
        MVII    #$0005, R0                      ; 550A   02B8 0005
        MVO     R0,     G_0343                  ; 550C   0240 0343
        MVI     G_0183, R0                      ; 550E   0280 0183
        SUBI    #$000A, R0                      ; 5510   0338 000A
        MVO     R0,     G_0183                  ; 5512   0240 0183
        MVII    #$0002, R0                      ; 5514   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5516   0004 0114 02E6

        XORR    R3,     R6                      ; 5519   01DE
        PULR    R7                              ; 551A   02B7

        PSHR    R5                              ; 551B   0275
        MOVR    R1,     R4                      ; 551C   008C
        MVI@    R1,     R0                      ; 551D   0288
        SDBD                                    ; 551E   0001
        CMPI    #$30C2, R0                      ; 551F   0378 00C2 0030
        BEQ     L_5555                          ; 5522   0204 0031

        MOVR    R3,     R0                      ; 5524   0098
        ADDI    #$0002, R1                      ; 5525   02F9 0002
        MVI@    R1,     R2                      ; 5527   028A
        INCR    R1                              ; 5528   0009
        MVI@    R1,     R3                      ; 5529   028B

        JSR     R5,     .EXEC.76C               ; 552A   0004 0114 036C

        MVI@    R1,     R0                      ; 552D   0288
        RRC     R0,     1                       ; 552E   0070
        BC      L_5555                          ; 552F   0201 0024

        PSHR    R4                              ; 5531   0274
        SDBD                                    ; 5532   0001
        MVII    #$F0C2, R0                      ; 5533   02B8 00C2 00F0
        MVO@    R0,     R4                      ; 5536   0260
        SDBD                                    ; 5537   0001
        MVII    #$F0D5, R0                      ; 5538   02B8 00D5 00F0
        MOVR    R1,     R4                      ; 553B   008C
        MVO@    R0,     R4                      ; 553C   0260
        SDBD                                    ; 553D   0001
        MVII    #$5DCF, R0                      ; 553E   02B8 00CF 005D
        MVO@    R0,     R4                      ; 5541   0260
        MVO@    R2,     R4                      ; 5542   0262
        MVO@    R3,     R4                      ; 5543   0263
        INCR    R4                              ; 5544   000C
        MVII    #$03F0, R0                      ; 5545   02B8 03F0
        MVO@    R0,     R4                      ; 5547   0260
        MVII    #$0014, R0                      ; 5548   02B8 0014
        MVO@    R0,     R4                      ; 554A   0260
        PULR    R1                              ; 554B   02B1
        MVO@    R1,     R4                      ; 554C   0261

        JSR     R5,     L_6AD6                  ; 554D   0004 0168 02D6

        MVII    #$007D, R0                      ; 5550   02B8 007D

        JSR     R5,     L_6A6A                  ; 5552   0004 0168 026A

L_5555:
        PULR    R7                              ; 5555   02B7

        PSHR    R5                              ; 5556   0275

        JSR     R5,     L_555E                  ; 5557   0004 0154 015E

        ADDI    #$0002, R1                      ; 555A   02F9 0002
        MVI@    R1,     R1                      ; 555C   0289
        PULR    R5                              ; 555D   02B5
L_555E:
        CLRR    R0                              ; 555E   01C0
        MVO@    R0,     R1                      ; 555F   0248
        INCR    R1                              ; 5560   0009
        MVO@    R0,     R1                      ; 5561   0248
        ADDI    #$0004, R1                      ; 5562   02F9 0004
        MVO@    R0,     R1                      ; 5564   0248
        MOVR    R5,     R7                      ; 5565   00AF

L_5566:
        PSHR    R5                              ; 5566   0275
        MVI     G_031F, R0                      ; 5567   0280 031F
        SWAP    R0,     1                       ; 5569   0040
        MVI     G_0320, R1                      ; 556A   0281 0320
        SWAP    R1,     1                       ; 556C   0041

        JSR     R5,     X_PACK_BYTES            ; 556D   0004 0114 034F

        MOVR    R0,     R2                      ; 5570   0082
        MOVR    R4,     R1                      ; 5571   00A1
        MVI@    R1,     R0                      ; 5572   0288
        SWAP    R0,     1                       ; 5573   0040
        ANDI    #$0008, R0                      ; 5574   03B8 0008
        BEQ     L_5582                          ; 5576   0204 000A

        MVI     G_031E, R3                      ; 5578   0283 031E
        TSTR    R3                              ; 557A   009B
        BEQ     L_5582                          ; 557B   0204 0005

        MVII    #$000F, R3                      ; 557D   02BB 000F

        JSR     R5,     .EXEC.9A3               ; 557F   0004 0118 01A3

L_5582:
        PULR    R7                              ; 5582   02B7

        PSHR    R5                              ; 5583   0275
        MVI     G_012C, R2                      ; 5584   0282 012C
        SWAP    R2,     2                       ; 5586   0046
        BMI     L_55AA                          ; 5587   020B 0021

        SDBD                                    ; 5589   0001
        MVII    #$30C2, R0                      ; 558A   02B8 00C2 0030
        MVO@    R0,     R1                      ; 558D   0248
        ADDI    #$0004, R1                      ; 558E   02F9 0004
        MVI@    R1,     R0                      ; 5590   0288
        CLRR    R2                              ; 5591   01D2
        MVO     R2,     G_011A                  ; 5592   0242 011A
        MVO     R0,     G_0321                  ; 5594   0240 0321
        MVO     R0,     G_0329                  ; 5596   0240 0329
        MVI     G_016D, R0                      ; 5598   0280 016D
        TSTR    R0                              ; 559A   0080
        BEQ     L_55AA                          ; 559B   0204 000D

        SDBD                                    ; 559D   0001
        MVII    #$1906, R0                      ; 559E   02B8 0006 0019
        MVO     R0,     G_035D                  ; 55A1   0240 035D
        MVII    #$0028, R0                      ; 55A3   02B8 0028
        MVO     R0,     G_032B                  ; 55A5   0240 032B

        JSR     R5,     L_6B62                  ; 55A7   0004 0168 0362

L_55AA:
        PULR    R7                              ; 55AA   02B7

        PSHR    R5                              ; 55AB   0275
        MVII    #$0080, R1                      ; 55AC   02B9 0080

        JSR     R5,     L_6858                  ; 55AE   0004 0168 0058

        MVII    #$0008, R0                      ; 55B1   02B8 0008

        JSR     R5,     X_RAND2                 ; 55B3   0004 0114 029E

        MVO     R0,     G_0166                  ; 55B6   0240 0166
        MVII    #$0002, R0                      ; 55B8   02B8 0002

        JSR     R5,     X_RAND2                 ; 55BA   0004 0114 029E

        INCR    R0                              ; 55BD   0008
        ADD     G_016E, R0                      ; 55BE   02C0 016E
        MVO     R0,     G_016E                  ; 55C0   0240 016E
        MOVR    R0,     R1                      ; 55C2   0081
        MVI     G_018E, R0                      ; 55C3   0280 018E
        SUBI    #$0005, R0                      ; 55C5   0338 0005
        TSTR    R0                              ; 55C7   0080
        BNEQ    L_55CD                          ; 55C8   020C 0003
        J       L_5921                          ; 55CA   0004 0358 0121

L_55CD:
        MVO     R0,     G_018E                  ; 55CD   0240 018E

        JSR     R5,     L_5233                  ; 55CF   0004 0150 0233

        XORI    #$0080, R1                      ; 55D2   03F9 0080

        JSR     R5,     L_529C                  ; 55D4   0004 0150 029C
        JSR     R5,     L_6BB5                  ; 55D7   0004 0168 03B5

        PULR    R7                              ; 55DA   02B7

L_55DB:
        PSHR    R5                              ; 55DB   0275
        MVII    #$031D, R1                      ; 55DC   02B9 031D

        JSR     R5,     L_6A48                  ; 55DE   0004 0168 0248

        ADDI    #$0201, R3                      ; 55E1   02FB 0201
        MVI@    R3,     R2                      ; 55E3   029A
        MOVR    R3,     R1                      ; 55E4   0099
        SLLC    R2,     2                       ; 55E5   005E
        BNOV    L_568E                          ; 55E6   020A 00A6

        SLR     R2,     2                       ; 55E8   0066
        MVO     R2,     G_0182                  ; 55E9   0242 0182
        MVO@    R2,     R1                      ; 55EB   024A
        CLRR    R0                              ; 55EC   01C0
        MVO     R0,     G_0192                  ; 55ED   0240 0192
        SUBI    #$0201, R1                      ; 55EF   0339 0201

        JSR     R5,     L_6A5A                  ; 55F1   0004 0168 025A

        MVI     G_0180, R3                      ; 55F4   0283 0180
        SLR     R3,     1                       ; 55F6   0063
        MVI     G_015F, R2                      ; 55F7   0282 015F
        MVII    #$0003, R5                      ; 55F9   02BD 0003
        BNEQ    L_560B                          ; 55FB   020C 000E

        MVI     G_015D, R3                      ; 55FD   0283 015D
        MVI     G_0162, R2                      ; 55FF   0282 0162
        CMPI    #$0050, R2                      ; 5601   037A 0050
        BLT     L_5607                          ; 5603   0205 0002

        XORI    #$0003, R3                      ; 5605   03FB 0003
L_5607:
        TSTR    R3                              ; 5607   009B
        BEQ     L_568E                          ; 5608   0204 0084

        NEGR    R5                              ; 560A   0025
L_560B:
        SUBR    R5,     R1                      ; 560B   0129
        ADDR    R5,     R0                      ; 560C   00E8
        SWAP    R0,     1                       ; 560D   0040
        SWAP    R1,     1                       ; 560E   0041
        MVO     R0,     G_031F                  ; 560F   0240 031F
        MVO     R1,     G_0320                  ; 5611   0241 0320
        ANDI    #$00F8, R2                      ; 5613   03BA 00F8
        SLR     R2,     1                       ; 5615   0062
        SDBD                                    ; 5616   0001
        MVII    #$563C, R4                      ; 5617   02BC 003C 0056
        ADDR    R2,     R4                      ; 561A   00D4
        MVI@    R4,     R0                      ; 561B   02A0
        MVO     R0,     G_0180                  ; 561C   0240 0180
        MVI@    R4,     R0                      ; 561E   02A0
        SWAP    R0,     1                       ; 561F   0040
        XORI    #$00D1, R0                      ; 5620   03F8 00D1
        MVO     R0,     G_031D                  ; 5622   0240 031D
        MVO     R0,     G_0325                  ; 5624   0240 0325
        MVI@    R4,     R0                      ; 5626   02A0
        MVO     R0,     G_0322                  ; 5627   0240 0322
        MVO     R0,     G_032A                  ; 5629   0240 032A
        MVI@    R4,     R0                      ; 562B   02A0
        RRC     R0,     2                       ; 562C   0074
        MVI     G_0181, R1                      ; 562D   0281 0181
        BNC     L_5633                          ; 562F   0209 0002

        XORI    #$00FF, R1                      ; 5631   03F9 00FF
L_5633:
        BOV     L_5636                          ; 5633   0202 0001

        SWAP    R1,     1                       ; 5635   0041
L_5636:
        MVO     R1,     G_018F                  ; 5636   0241 018F
        SWAP    R1,     1                       ; 5638   0041
        MVO     R1,     G_0192                  ; 5639   0241 0192
        SDBD                                    ; 563B   0001
        MVII    #$0005, R0                      ; 563C   02B8 0005 0000

        JSR     R5,     X_SET_BIT               ; 563F   0004 0114 02DB

        XORR    R3,     R6                      ; 5642   01DE
        MVII    #$004B, R0                      ; 5643   02B8 004B

        JSR     R5,     X_RAND2                 ; 5645   0004 0114 029E

        ADDI    #$001E, R0                      ; 5648   02F8 001E
        MVO     R0,     G_0165                  ; 564A   0240 0165
        INCR    R2                              ; 564C   000A
        MVI     G_0187, R0                      ; 564D   0280 0187
        INCR    R0                              ; 564F   0008
        INCR    R0                              ; 5650   0008
        CMPI    #$0069, R0                      ; 5651   0378 0069
        BMI     L_5658                          ; 5653   020B 0003
        J       L_5921                          ; 5655   0004 0358 0121

L_5658:
        MVO     R0,     G_0187                  ; 5658   0240 0187
        B       L_566D                          ; 565A   0200 0011

        DECLE   $0001,  $0038,  $0000,  $0002   ; 565C   0001 0038 0000 0002
        DECLE   $0003,  $0038,  $0001,  $0000   ; 5660   0003 0038 0001 0000
        DECLE   $0000,  $003A,  $0002,  $0003   ; 5664   0000 003A 0002 0003
        DECLE   $0002,  $003C,  $0001,  $0001   ; 5668   0002 003C 0001 0001
L_566C:
        PSHR    R5                              ; 566C   0275
L_566D:
        MVI     G_0165, R0                      ; 566D   0280 0165
        SWAP    R0,     2                       ; 566F   0044
        BPL     L_5675                          ; 5670   0203 0003
        J       L_5921                          ; 5672   0004 0358 0121

L_5675:
        ANDI    #$007F, R0                      ; 5675   03B8 007F
        CLRR    R1                              ; 5677   01C9
        CMPI    #$0014, R0                      ; 5678   0378 0014
        BEQ     L_569B                          ; 567A   0204 001F

        CMPI    #$0032, R0                      ; 567C   0378 0032
        BEQ     L_568F                          ; 567E   0204 000F
        BMI     L_5683                          ; 5680   020B 0001

        INCR    R1                              ; 5682   0009
L_5683:
        CMPI    #$004B, R0                      ; 5683   0378 004B
        BEQ     L_568F                          ; 5685   0204 0008
        BMI     L_568B                          ; 5687   020B 0002

        MVII    #$0002, R1                      ; 5689   02B9 0002
L_568B:
        TSTR    R2                              ; 568B   0092
        BNEQ    L_5692                          ; 568C   020C 0004
L_568E:
        PULR    R7                              ; 568E   02B7

L_568F:
        DECR    R0                              ; 568F   0010
        MVO     R0,     G_0165                  ; 5690   0240 0165
L_5692:
        MVO     R1,     G_01BC                  ; 5692   0241 01BC
        MVII    #$0004, R0                      ; 5694   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5696   0004 0114 02E6

        XORR    R3,     R6                      ; 5699   01DE
        PULR    R7                              ; 569A   02B7

L_569B:
        DECR    R0                              ; 569B   0010
        MVO     R0,     G_0165                  ; 569C   0240 0165
        MVII    #$0005, R0                      ; 569E   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 56A0   0004 0114 02E6

        XORR    R3,     R6                      ; 56A3   01DE
        PULR    R7                              ; 56A4   02B7

        PSHR    R5                              ; 56A5   0275
        MOVR    R0,     R1                      ; 56A6   0081
        BMI     L_56DB                          ; 56A7   020B 0032

        MVII    #$0336, R4                      ; 56A9   02BC 0336
        MVI@    R4,     R0                      ; 56AB   02A0
        TSTR    R0                              ; 56AC   0080
        BEQ     L_56B5                          ; 56AD   0204 0006

        MVII    #$032E, R4                      ; 56AF   02BC 032E
        MVI@    R4,     R0                      ; 56B1   02A0
        TSTR    R0                              ; 56B2   0080
        BNEQ    L_56DB                          ; 56B3   020C 0026

L_56B5:
        MVI     G_031F, R2                      ; 56B5   0282 031F
        MVO@    R2,     R4                      ; 56B7   0262
        MVI     G_0320, R2                      ; 56B8   0282 0320
        MVII    #$03F0, R3                      ; 56BA   02BB 03F0
        ADDR    R3,     R2                      ; 56BC   00DA
        MVO@    R2,     R4                      ; 56BD   0262

        JSR     R5,     .EXEC.628               ; 56BE   0004 0114 0228

        COMR    R6                              ; 56C1   001E
        MVO@    R0,     R4                      ; 56C2   0260
        MVO@    R3,     R4                      ; 56C3   0263
        SUBI    #$0006, R4                      ; 56C4   033C 0006
        SDBD                                    ; 56C6   0001
        MVII    #$1886, R0                      ; 56C7   02B8 0086 0018
        MVO@    R0,     R4                      ; 56CA   0260
        SDBD                                    ; 56CB   0001
        MVII    #$5DB0, R2                      ; 56CC   02BA 00B0 005D
        MVO@    R2,     R4                      ; 56CF   0262
        MVI     G_0183, R0                      ; 56D0   0280 0183
        DECR    R0                              ; 56D2   0010
        MVO     R0,     G_0183                  ; 56D3   0240 0183

        JSR     R5,     L_6B32                  ; 56D5   0004 0168 0332

        CLRR    R2                              ; 56D8   01D2
        B       L_566D                          ; 56D9   0220 006D
L_56DB:
        PULR    R7                              ; 56DB   02B7

        MVII    #$0080, R0                      ; 56DC   02B8 0080
        MVO     R0,     G_012C                  ; 56DE   0240 012C
        MVII    #$031D, R1                      ; 56E0   02B9 031D
L_56E2:
        MVI@    R1,     R0                      ; 56E2   0288
        SLL     R0,     1                       ; 56E3   0048
        SETC                                    ; 56E4   0007
        RRC     R0,     1                       ; 56E5   0070
        MVO@    R0,     R1                      ; 56E6   0248
        ADDI    #$0008, R1                      ; 56E7   02F9 0008
        CMPI    #$0355, R1                      ; 56E9   0379 0355
        BNEQ    L_56E2                          ; 56EB   022C 000A

        JSR     R5,     L_579E                  ; 56ED   0004 0154 039E

        J       L_57D1                          ; 56F0   0004 0354 03D1

L_56F3:
        CLRR    R0                              ; 56F3   01C0
        MVO     R0,     G_012C                  ; 56F4   0240 012C

        JSR     R5,     L_6BB5                  ; 56F6   0004 0168 03B5

        MVII    #$031D, R1                      ; 56F9   02B9 031D
L_56FB:
        MVI@    R1,     R0                      ; 56FB   0288
        SLL     R0,     1                       ; 56FC   0048
        SLR     R0,     1                       ; 56FD   0060
        MVO@    R0,     R1                      ; 56FE   0248
        ADDI    #$0008, R1                      ; 56FF   02F9 0008
        CMPI    #$0355, R1                      ; 5701   0379 0355
        BNEQ    L_56FB                          ; 5703   022C 0009

        JSR     R5,     L_57AE                  ; 5705   0004 0154 03AE

        SDBD                                    ; 5708   0001
        MVII    #$533A, R0                      ; 5709   02B8 003A 0053
        MVO     R0,     G_035D                  ; 570C   0240 035D
        PULR    R7                              ; 570E   02B7

L_570F:
        CMP     G_018A, R0                      ; 570F   0340 018A
        BPL     L_5721                          ; 5711   0203 000E

        MVO     R0,     G_018A                  ; 5713   0240 018A
        MVI     G_018E, R0                      ; 5715   0280 018E
        ADDI    #$0005, R0                      ; 5717   02F8 0005
        MVO     R0,     G_018E                  ; 5719   0240 018E
        SDBD                                    ; 571B   0001
        MVII    #$1388, R0                      ; 571C   02B8 0088 0013
        B       L_5723                          ; 571F   0200 0002

L_5721:
        MVII    #$03E8, R0                      ; 5721   02B8 03E8

L_5723:
        JSR     R5,     L_6A75                  ; 5723   0004 0168 0275

        MVII    #$0206, R4                      ; 5726   02BC 0206

        JSR     R5,     L_6A9A                  ; 5728   0004 0168 029A

        MVI     G_015E, R1                      ; 572B   0281 015E
        ADD     G_0161, R1                      ; 572D   02C1 0161
        PSHR    R1                              ; 572F   0271

        JSR     R5,     L_6A5A                  ; 5730   0004 0168 025A

        SUBI    #$000C, R0                      ; 5733   0338 000C
        SUBI    #$0004, R1                      ; 5735   0339 0004

        JSR     R5,     X_PACK_BYTES            ; 5737   0004 0114 034F

        MOVR    R0,     R2                      ; 573A   0082
        MVII    #$031D, R1                      ; 573B   02B9 031D
        MVII    #$000A, R3                      ; 573D   02BB 000A

        JSR     R5,     .EXEC.9A1               ; 573F   0004 0118 01A1

        PULR    R1                              ; 5742   02B1
        ADDI    #$0200, R1                      ; 5743   02F9 0200
        SDBD                                    ; 5745   0001
        MVII    #$486F, R0                      ; 5746   02B8 006F 0048
        MVO@    R0,     R1                      ; 5749   0248
        MVO     R0,     G_0165                  ; 574A   0240 0165
        MVI     G_031D, R0                      ; 574C   0280 031D
        SLL     R0,     1                       ; 574E   0048
        SLR     R0,     1                       ; 574F   0060
        MVO     R0,     G_031D                  ; 5750   0240 031D

        JSR     R5,     L_6CD3                  ; 5752   0004 016C 00D3

        PULR    R7                              ; 5755   02B7

        PSHR    R5                              ; 5756   0275
        MVII    #$0004, R0                      ; 5757   02B8 0004

        JSR     R5,     X_SET_BIT               ; 5759   0004 0114 02DB

        XORR    R3,     R6                      ; 575C   01DE
        MVI     G_0161, R1                      ; 575D   0281 0161

        JSR     R5,     L_6A5A                  ; 575F   0004 0168 025A

        SUBI    #$000C, R0                      ; 5762   0338 000C

        JSR     R5,     X_PACK_BYTES            ; 5764   0004 0114 034F

        MVII    #$031D, R1                      ; 5767   02B9 031D
        MOVR    R0,     R2                      ; 5769   0082
        MVII    #$000A, R3                      ; 576A   02BB 000A

        JSR     R5,     .EXEC.9A3               ; 576C   0004 0118 01A3

        MVII    #$0073, R0                      ; 576F   02B8 0073
        SDBD                                    ; 5771   0001
        MVII    #$5169, R1                      ; 5772   02B9 0069 0051

        JSR     R5,     .EXEC.A5E               ; 5775   0004 0118 025E

        PULR    R7                              ; 5778   02B7

        PSHR    R5                              ; 5779   0275
        TSTR    R0                              ; 577A   0080
        BEQ     L_57BC                          ; 577B   0204 003F

        SUBI    #$0007, R0                      ; 577D   0338 0007
        BMI     L_57B8                          ; 577F   020B 0037

        MVII    #$0001, R2                      ; 5781   02BA 0001
        SUBI    #$0003, R0                      ; 5783   0338 0003
        BEQ     L_566D                          ; 5785   0224 0119
        BMI     L_57AD                          ; 5787   020B 0024

        JSR     R5,     L_579E                  ; 5789   0004 0154 039E

        MVII    #$0206, R4                      ; 578C   02BC 0206

        JSR     R5,     L_6A9A                  ; 578E   0004 0168 029A

        CLRR    R0                              ; 5791   01C0
L_5792:
        DECR    R0                              ; 5792   0010
        BNEQ    L_5792                          ; 5793   022C 0002

        JSR     R5,     L_5BD0                  ; 5795   0004 0158 03D0

        CLRR    R0                              ; 5798   01C0
L_5799:
        DECR    R0                              ; 5799   0010
        BNEQ    L_5799                          ; 579A   022C 0002
        B       L_57AF                          ; 579C   0200 0011

L_579E:
        PSHR    R5                              ; 579E   0275
        MVII    #$0000, R1                      ; 579F   02B9 0000
        MVII    #$0200, R4                      ; 57A1   02BC 0200
        MVII    #$0014, R0                      ; 57A3   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 57A5   0004 0114 0341

        MVII    #$0004, R1                      ; 57A8   02B9 0004

        JSR     R5,     L_6858                  ; 57AA   0004 0168 0058

L_57AD:
        PULR    R7                              ; 57AD   02B7

L_57AE:
        PSHR    R5                              ; 57AE   0275
L_57AF:
        MVII    #$0005, R1                      ; 57AF   02B9 0005
        MOVR    R1,     R3                      ; 57B1   008B

        JSR     R5,     L_6858                  ; 57B2   0004 0168 0058

        J       L_660F                          ; 57B5   0004 0364 020F

L_57B8:
        CLRR    R0                              ; 57B8   01C0
        MVO     R0,     G_0182                  ; 57B9   0240 0182
        PULR    R7                              ; 57BB   02B7

L_57BC:
        MVI     G_016E, R0                      ; 57BC   0280 016E
        MVO     R0,     G_01B9                  ; 57BE   0240 01B9
        MVI     G_0166, R0                      ; 57C0   0280 0166
        MVO     R0,     G_01BA                  ; 57C2   0240 01BA
        MVII    #$0000, R0                      ; 57C4   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 57C6   0004 0114 02E6

        XORR    R3,     R6                      ; 57C9   01DE
        MVII    #$0001, R0                      ; 57CA   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 57CC   0004 0114 02E6

        XORR    R3,     R6                      ; 57CF   01DE
        PULR    R7                              ; 57D0   02B7

L_57D1:
        MVII    #$02FD, R0                      ; 57D1   02B8 02FD
        MVO     R0,     .BTAB.07                ; 57D3   0240 0207

        JSR     R5,     X_STOP_SFX              ; 57D5   0004 011C 02B4

        MVII    #$0006, R0                      ; 57D8   02B8 0006
        SDBD                                    ; 57DA   0001
        MVII    #$6257, R4                      ; 57DB   02BC 0057 0062
        MVII    #$0173, R1                      ; 57DE   02B9 0173

        JSR     R5,     .EXEC.730               ; 57E0   0004 0114 0330

        MVO     R0,     G_0185                  ; 57E3   0240 0185
        MVO     R0,     G_0146                  ; 57E5   0240 0146
        MVII    #$000B, R0                      ; 57E7   02B8 000B
        MVO     R0,     G_0184                  ; 57E9   0240 0184
        MOVR    R7,     R0                      ; 57EB   00B8
        ADDI    #$0008, R0                      ; 57EC   02F8 0008
        MVO     R0,     G_035D                  ; 57EE   0240 035D

        JSR     R5,     L_6AB7                  ; 57F0   0004 0168 02B7

L_57F3:
        PULR    R7                              ; 57F3   02B7

        DECLE   $0000,  $0000,  $00FE,  $0057   ; 57F4   0000 0000 00FE 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F8   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 57FC   0000 0000

        PSHR    R5                              ; 57FE   0275
        MVI     G_031D, R1                      ; 57FF   0281 031D
        TSTR    R1                              ; 5801   0089
        BPL     L_57F3                          ; 5802   0223 0010

        MVI     G_032B, R1                      ; 5804   0281 032B
        TSTR    R1                              ; 5806   0089
        BNEQ    L_57F3                          ; 5807   022C 0015

        PSHR    R0                              ; 5809   0270
        CLRR    R0                              ; 580A   01C0
        MVO     R0,     .PSG0.chn_a_hi          ; 580B   0240 01F4
        MVII    #$0060, R0                      ; 580D   02B8 0060
        MVO     R0,     .PSG0.chn_a_lo          ; 580F   0240 01F0
        MVII    #$003E, R0                      ; 5811   02B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 5813   0240 01F8
        MVII    #$03E8, R0                      ; 5815   02B8 03E8
L_5817:
        DECR    R0                              ; 5817   0010
        NOP                                     ; 5818   0034
        BNEQ    L_5817                          ; 5819   022C 0003

        MVII    #$003F, R0                      ; 581B   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 581D   0240 01F8
        PULR    R0                              ; 581F   02B0
        MVII    #$016E, R3                      ; 5820   02BB 016E
        ADD     G_0185, R3                      ; 5822   02C3 0185
        MVI     G_0185, R4                      ; 5824   0284 0185
        ADDI    #$0208, R4                      ; 5826   02FC 0208
        CMPI    #$000A, R0                      ; 5828   0378 000A
        BEQ     L_584D                          ; 582A   0204 0021

        CMPI    #$000B, R0                      ; 582C   0378 000B
        BEQ     L_5861                          ; 582E   0204 0031

        CMP@    R3,     R0                      ; 5830   0358
        BNEQ    L_5838                          ; 5831   020C 0005

        MVI     G_0184, R2                      ; 5833   0282 0184
        DECR    R2                              ; 5835   0012
        MVO     R2,     G_0184                  ; 5836   0242 0184
L_5838:
        MVI     G_0185, R3                      ; 5838   0283 0185
        INCR    R3                              ; 583A   000B
        MVO     R3,     G_0185                  ; 583B   0243 0185
        DECR    R4                              ; 583D   0014
        SLL     R0,     2                       ; 583E   004C
        SLL     R0,     1                       ; 583F   0048
        SDBD                                    ; 5840   0001
        XORI    #$0802, R0                      ; 5841   03F8 0002 0008
        MVO@    R0,     R4                      ; 5844   0260
        CMPI    #$0213, R4                      ; 5845   037C 0213
        BEQ     L_5861                          ; 5847   0204 0018

L_5849:
        MVII    #$02FD, R0                      ; 5849   02B8 02FD
        MVO@    R0,     R4                      ; 584B   0260
        PULR    R7                              ; 584C   02B7

L_584D:
        CLRR    R0                              ; 584D   01C0
        MVO     R0,     G_0185                  ; 584E   0240 0185
        MVII    #$000B, R0                      ; 5850   02B8 000B
        MVO     R0,     G_0184                  ; 5852   0240 0184
        MVII    #$0000, R1                      ; 5854   02B9 0000
        MVII    #$0207, R4                      ; 5856   02BC 0207
        MVII    #$000D, R0                      ; 5858   02B8 000D

        JSR     R5,     X_FILL_MEM              ; 585A   0004 0114 0341

        MVII    #$0207, R4                      ; 585D   02BC 0207
        B       L_5849                          ; 585F   0220 0017

L_5861:
        MVI     G_0184, R0                      ; 5861   0280 0184
        TSTR    R0                              ; 5863   0080
        BEQ     L_5872                          ; 5864   0204 000C

        CMPI    #$0006, R0                      ; 5866   0378 0006
        BNEQ    L_587D                          ; 5868   020C 0013

        MVI     G_0185, R0                      ; 586A   0280 0185
        CMPI    #$0005, R0                      ; 586C   0378 0005
        BNEQ    L_587D                          ; 586E   020C 000D
        B       L_5880                          ; 5870   0200 000E

L_5872:
        MVI     G_0185, R0                      ; 5872   0280 0185
        CMPI    #$000B, R0                      ; 5874   0378 000B
        BNEQ    L_587D                          ; 5876   020C 0005

        CLRR    R0                              ; 5878   01C0
        MVO     R0,     G_0185                  ; 5879   0240 0185
        B       L_5880                          ; 587B   0200 0003
L_587D:
        J       L_56F3                          ; 587D   0004 0354 02F3

L_5880:
        MVI     G_016E, R0                      ; 5880   0280 016E
        DECR    R0                              ; 5882   0010
        DECR    R0                              ; 5883   0010
        BNEQ    L_5887                          ; 5884   020C 0001

        INCR    R0                              ; 5886   0008
L_5887:
        MVO     R0,     G_016E                  ; 5887   0240 016E
        BMI     L_588E                          ; 5889   020B 0003
        J       L_570F                          ; 588B   0004 0354 030F

L_588E:
        SDBD                                    ; 588E   0001
        MVII    #$2710, R0                      ; 588F   02B8 0010 0027

        JSR     R5,     L_6A75                  ; 5892   0004 0168 0275

        MVI     G_018E, R0                      ; 5895   0280 018E
        ADDI    #$0005, R0                      ; 5897   02F8 0005
        MVO     R0,     G_018E                  ; 5899   0240 018E
        CLRR    R1                              ; 589B   01C9

        JSR     R5,     L_6858                  ; 589C   0004 0168 0058
        JSR     R5,     L_6AAE                  ; 589F   0004 0168 02AE

        CLRR    R3                              ; 58A2   01DB
        MVO     R3,     .PSG0.chn_a_lo          ; 58A3   0243 01F0
        INCR    R3                              ; 58A5   000B
        MVO     R3,     .PSG0.chn_a_hi          ; 58A6   0243 01F4
        INCR    R3                              ; 58A8   000B
        MVII    #$000B, R0                      ; 58A9   02B8 000B
        MVO     R0,     .PSG0.chn_a_vol         ; 58AB   0240 01FB
        CLRR    R2                              ; 58AD   01D2
        MVII    #$023E, R4                      ; 58AE   02BC 023E

        JSR     R5,     L_6827                  ; 58B0   0004 0168 0027
        DECLE   $0050,  $0052,  $0045,  $0050   ; 58B3   0050 0052 0045 0050
        DECLE   $0041,  $0052,  $0045,  $006F   ; 58B7   0041 0052 0045 006F
        DECLE   $0054,  $004F,  $006F,  $0045   ; 58BB   0054 004F 006F 0045
        DECLE   $004E,  $0054,  $0045,  $0052   ; 58BF   004E 0054 0045 0052
        DECLE   $0000                           ; 58C3   0000

        CLRR    R2                              ; 58C4   01D2
        MVII    #$0266, R4                      ; 58C5   02BC 0266

        JSR     R5,     L_6827                  ; 58C7   0004 0168 0027
        DECLE   $004D,  $0043,  $0050,  $006F   ; 58CA   004D 0043 0050 006F
        DECLE   $0044,  $0041,  $0054,  $0041   ; 58CE   0044 0041 0054 0041
        DECLE   $006F,  $0053,  $0054,  $0052   ; 58D2   006F 0053 0054 0052
        DECLE   $0045,  $0041,  $004D,  $0000   ; 58D6   0045 0041 004D 0000

        MVII    #$02FD, R0                      ; 58DA   02B8 02FD
        MVO     R0,     .BTAB.76                ; 58DC   0240 0276
        MVI     G_0185, R0                      ; 58DE   0280 0185
        TSTR    R0                              ; 58E0   0080
        BNEQ    L_5917                          ; 58E1   020C 0034

        MVII    #$0005, R3                      ; 58E3   02BB 0005
        CLRR    R2                              ; 58E5   01D2
        MVII    #$028E, R4                      ; 58E6   02BC 028E

        JSR     R5,     L_6827                  ; 58E8   0004 0168 0027
        DECLE   $004B,  $0045,  $0049,  $0054   ; 58EB   004B 0045 0049 0054
        DECLE   $0048,  $006F,  $0052,  $004F   ; 58EF   0048 006F 0052 004F
        DECLE   $0042,  $0049,  $004E,  $0053   ; 58F3   0042 0049 004E 0053
        DECLE   $004F,  $004E,  $006F,  $0053   ; 58F7   004F 004E 006F 0053
        DECLE   $0045,  $005A,  $0000           ; 58FB   0045 005A 0000

        CLRR    R2                              ; 58FE   01D2
        MVII    #$02B6, R4                      ; 58FF   02BC 02B6

        JSR     R5,     L_6827                  ; 5901   0004 0168 0027
        DECLE   $0047,  $004F,  $004F,  $0044   ; 5904   0047 004F 004F 0044
        DECLE   $006F,  $004C,  $0055,  $0043   ; 5908   006F 004C 0055 0043
        DECLE   $004B,  $006F,  $0048,  $0041   ; 590C   004B 006F 0048 0041
        DECLE   $0056,  $0045,  $006F,  $0046   ; 5910   0056 0045 006F 0046
        DECLE   $0055,  $004E,  $0000           ; 5914   0055 004E 0000
L_5917:
        SDBD                                    ; 5917   0001
        MVII    #$59CB, R1                      ; 5918   02B9 00CB 0059
        MVII    #$003C, R0                      ; 591B   02B8 003C

        JSR     R5,     .EXEC.A5E               ; 591D   0004 0118 025E

        PULR    R7                              ; 5920   02B7

L_5921:
        MVII    #$0001, R4                      ; 5921   02BC 0001
        INCR    R7                              ; 5923   000F

L_5924:
        CLRR    R4                              ; 5924   01E4
L_5925:
        MVI     G_01AB, R1                      ; 5925   0281 01AB
        ANDI    #$0040, R1                      ; 5927   03B9 0040
        BNEQ    L_5925                          ; 5929   022C 0005

        PSHR    R4                              ; 592B   0274

        JSR     R5,     L_6858                  ; 592C   0004 0168 0058
        JSR     R5,     L_6AAE                  ; 592F   0004 0168 02AE

        MVII    #$0060, R0                      ; 5932   02B8 0060
        MVO     R0,     .PSG0.chn_a_lo          ; 5934   0240 01F0
        MVII    #$000B, R0                      ; 5936   02B8 000B
        MVO     R0,     .PSG0.chn_a_vol         ; 5938   0240 01FB
        CLRR    R2                              ; 593A   01D2
        MVO     R2,     G_016D                  ; 593B   0242 016D
        MVII    #$0005, R3                      ; 593D   02BB 0005
        PULR    R4                              ; 593F   02B4
        PSHR    R4                              ; 5940   0274
        TSTR    R4                              ; 5941   00A4
        BEQ     L_59BD                          ; 5942   0204 0079

        CLRR    R2                              ; 5944   01D2
        MVII    #$023E, R4                      ; 5945   02BC 023E

        JSR     R5,     L_6827                  ; 5947   0004 0168 0027
        DECLE   $004D,  $0043,  $0050,  $0000   ; 594A   004D 0043 0050 0000
L_594E:
        JSR     R5,     L_6827                  ; 594E   0004 0168 0027
        DECLE   $0056,  $0049,  $0043,  $0054   ; 5951   0056 0049 0043 0054
        DECLE   $004F,  $0052,  $0049,  $004F   ; 5955   004F 0052 0049 004F
        DECLE   $0055,  $0053,  $0000           ; 5959   0055 0053 0000

        CLRR    R2                              ; 595C   01D2
        MVII    #$0266, R4                      ; 595D   02BC 0266

        JSR     R5,     L_6827                  ; 595F   0004 0168 0027
        DECLE   $0053,  $0043,  $004F,  $0052   ; 5962   0053 0043 004F 0052
        DECLE   $0045,  $003A,  $0000           ; 5966   0045 003A 0000

        MVII    #$016E, R4                      ; 5969   02BC 016E

        JSR     R5,     L_6A9A                  ; 596B   0004 0168 029A

        MVII    #$026D, R4                      ; 596E   02BC 026D
        MVII    #$016E, R3                      ; 5970   02BB 016E
L_5972:
        MVI@    R3,     R0                      ; 5972   0298

        JSR     R5,     L_6836                  ; 5973   0004 0168 0036
        DECLE   $0000                           ; 5976   0000

        INCR    R3                              ; 5977   000B
        DECR    R4                              ; 5978   0014
        CMPI    #$0176, R3                      ; 5979   037B 0176
        BNEQ    L_5972                          ; 597B   022C 000A

        PULR    R4                              ; 597D   02B4
        TSTR    R4                              ; 597E   00A4
        BEQ     L_5987                          ; 597F   0204 0006

        MVII    #$0007, R0                      ; 5981   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 5983   0004 0114 02E6

        XORR    R3,     R6                      ; 5986   01DE

L_5987:
        JSR     R5,     L_6EF5                  ; 5987   0004 016C 02F5

        MVII    #$0005, R3                      ; 598A   02BB 0005
        CLRR    R2                              ; 598C   01D2
        MVII    #$028E, R4                      ; 598D   02BC 028E

        JSR     R5,     L_6827                  ; 598F   0004 0168 0027
        DECLE   $0045,  $004E,  $0044,  $006F   ; 5992   0045 004E 0044 006F
        DECLE   $004F,  $0046,  $006F,  $004C   ; 5996   004F 0046 006F 004C
        DECLE   $0049,  $004E,  $0045,  $0000   ; 599A   0049 004E 0045 0000

        MVII    #$02FD, R0                      ; 599E   02B8 02FD
        MVO     R0,     .BTAB.9A                ; 59A0   0240 029A
        CLRR    R0                              ; 59A2   01C0
        MVII    #$00FF, R1                      ; 59A3   02B9 00FF
L_59A5:
        MVO     R1,     G_011F                  ; 59A5   0241 011F
        MVO     R1,     G_0120                  ; 59A7   0241 0120
        DECR    R0                              ; 59A9   0010
        BNEQ    L_59A5                          ; 59AA   022C 0006

        SDBD                                    ; 59AC   0001
        MVII    #$624D, R0                      ; 59AD   02B8 004D 0062
        MVO     R0,     G_035D                  ; 59B0   0240 035D
        MVII    #$000C, R0                      ; 59B2   02B8 000C
        SWAP    R0,     1                       ; 59B4   0040
        SDBD                                    ; 59B5   0001
        MVII    #$5050, R1                      ; 59B6   02B9 0050 0050

        JSR     R5,     .EXEC.A5E               ; 59B9   0004 0118 025E

        PULR    R7                              ; 59BC   02B7

L_59BD:
        CLRR    R2                              ; 59BD   01D2
        MVII    #$023E, R4                      ; 59BE   02BC 023E

        JSR     R5,     L_6827                  ; 59C0   0004 0168 0027
        DECLE   $0046,  $004C,  $0059,  $004E   ; 59C3   0046 004C 0059 004E
        DECLE   $004E,  $0000                   ; 59C7   004E 0000

        B       L_594E                          ; 59C9   0220 007C

        MVII    #$0080, R0                      ; 59CB   02B8 0080
        MVO     R0,     G_0128                  ; 59CD   0240 0128
        MVO     R0,     G_012C                  ; 59CF   0240 012C

        JSR     R5,     L_5A5E                  ; 59D1   0004 0158 025E

        MOVR    R7,     R0                      ; 59D4   00B8
        ADDI    #$007F, R0                      ; 59D5   02F8 007F
        MVO     R0,     G_035D                  ; 59D7   0240 035D
        SDBD                                    ; 59D9   0001
        MVII    #$8802, R1                      ; 59DA   02B9 0002 0088
        MVII    #$02E2, R4                      ; 59DD   02BC 02E2
        MVII    #$0008, R0                      ; 59DF   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 59E1   0004 0114 0341
        JSR     R5,     L_6CD3                  ; 59E4   0004 016C 00D3

        MVII    #$008C, R0                      ; 59E7   02B8 008C
        SDBD                                    ; 59E9   0001
        MVII    #$59FE, R1                      ; 59EA   02B9 00FE 0059

        JSR     R5,     .EXEC.A5E               ; 59ED   0004 0118 025E

        PULR    R7                              ; 59F0   02B7

        MVI     G_018E, R3                      ; 59F1   0283 018E
        SUBI    #$000A, R3                      ; 59F3   033B 000A
        MVO     R3,     G_018E                  ; 59F5   0243 018E
        DECR    R3                              ; 59F7   0013
        SWAP    R3,     2                       ; 59F8   0047
        BPL     L_59FE                          ; 59F9   0203 0003
        J       L_5921                          ; 59FB   0004 0358 0121

L_59FE:
        JSR     R5,     L_5B0D                  ; 59FE   0004 0158 030D

        MVII    #$0000, R0                      ; 5A01   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 5A03   0004 0114 02E6
        DECLE   $01DF                           ; 5A06   01DF
L_5A07:
        SDBD                                    ; 5A07   0001
        MVII    #$8802, R1                      ; 5A08   02B9 0002 0088
        MVII    #$02E2, R4                      ; 5A0B   02BC 02E2
        MVII    #$0008, R0                      ; 5A0D   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 5A0F   0004 0114 0341

        CLRR    R3                              ; 5A12   01DB
        MVO     R3,     G_018D                  ; 5A13   0243 018D
        MVII    #$02E2, R1                      ; 5A15   02B9 02E2
L_5A17:
        MVI@    R1,     R2                      ; 5A17   028A
        MVII    #$0002, R0                      ; 5A18   02B8 0002

        JSR     R5,     X_RAND2                 ; 5A1A   0004 0114 029E

        TSTR    R0                              ; 5A1D   0080
        BNEQ    L_5A22                          ; 5A1E   020C 0002

        SLL     R2,     1                       ; 5A20   004A
        SLR     R2,     1                       ; 5A21   0062
L_5A22:
        SLL     R3,     1                       ; 5A22   004B
        XORR    R0,     R3                      ; 5A23   01C3
        MVO@    R2,     R1                      ; 5A24   024A
        INCR    R1                              ; 5A25   0009
        CMPI    #$02EA, R1                      ; 5A26   0379 02EA
        BNEQ    L_5A17                          ; 5A28   022C 0012

        TSTR    R3                              ; 5A2A   009B
        BEQ     L_5A07                          ; 5A2B   0224 0025

        MVO     R3,     G_01BD                  ; 5A2D   0243 01BD
        MVII    #$0001, R0                      ; 5A2F   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 5A31   0004 0114 02E6
        DECLE   $01DF                           ; 5A34   01DF

        MVII    #$018B, R4                      ; 5A35   02BC 018B
        SDBD                                    ; 5A37   0001
        MVI@    R4,     R0                      ; 5A38   02A0
        CMPI    #$0190, R0                      ; 5A39   0378 0190
        BMI     L_5A3F                          ; 5A3B   020B 0002

        SUBI    #$004B, R0                      ; 5A3D   0338 004B
L_5A3F:
        MVI     G_018E, R3                      ; 5A3F   0283 018E
        TSTR    R3                              ; 5A41   009B
        BPL     L_5A46                          ; 5A42   0203 0002

        SUBI    #$0014, R0                      ; 5A44   0338 0014
L_5A46:
        MVO     R0,     G_018B                  ; 5A46   0240 018B
        SWAP    R0,     1                       ; 5A48   0040
        MVO     R0,     G_018C                  ; 5A49   0240 018C
        SWAP    R0,     1                       ; 5A4B   0040
        SDBD                                    ; 5A4C   0001
        MVII    #$5B2E, R1                      ; 5A4D   02B9 002E 005B

        JSR     R5,     .EXEC.A5E               ; 5A50   0004 0118 025E

        PULR    R7                              ; 5A53   02B7

        DECLE   $00F1,  $005B,  $00FF,  $005B   ; 5A54   00F1 005B 00FF 005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A58   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5A5C   0000 0000
L_5A5E:
        PSHR    R5                              ; 5A5E   0275
        CLRR    R0                              ; 5A5F   01C0
        MVO     R0,     G_0180                  ; 5A60   0240 0180
        MVO     R0,     G_0161                  ; 5A62   0240 0161
        MVII    #$0002, R1                      ; 5A64   02B9 0002

        JSR     R5,     L_6858                  ; 5A66   0004 0168 0058

        MVII    #$0001, R0                      ; 5A69   02B8 0001
        MVO     R0,     G_0106                  ; 5A6B   0240 0106
        MVO     R0,     G_0182                  ; 5A6D   0240 0182
        MVO     R0,     G_018D                  ; 5A6F   0240 018D
        MVII    #$0352, R0                      ; 5A71   02B8 0352
        MVO     R0,     G_018B                  ; 5A73   0240 018B
        SWAP    R0,     1                       ; 5A75   0040
        MVO     R0,     G_018C                  ; 5A76   0240 018C

        JSR     R5,     L_6AAE                  ; 5A78   0004 0168 02AE

        SDBD                                    ; 5A7B   0001
        MVII    #$5AF5, R4                      ; 5A7C   02BC 00F5 005A
L_5A7F:
        MVI@    R4,     R1                      ; 5A7F   02A1
        MVI@    R4,     R3                      ; 5A80   02A3
        MVI@    R4,     R2                      ; 5A81   02A2
        MVII    #$0009, R0                      ; 5A82   02B8 0009
        SWAP    R0,     1                       ; 5A84   0040
        XOR@    R4,     R0                      ; 5A85   03E0

        JSR     R5,     L_6A93                  ; 5A86   0004 0168 0293

        SDBD                                    ; 5A89   0001
        CMPI    #$5B0D, R4                      ; 5A8A   037C 000D 005B
        BNEQ    L_5A7F                          ; 5A8D   022C 000F

        MVII    #$0014, R2                      ; 5A8F   02BA 0014
        MVII    #$0203, R4                      ; 5A91   02BC 0203
        SDBD                                    ; 5A93   0001
        MVII    #$095D, R0                      ; 5A94   02B8 005D 0009
        MOVR    R4,     R5                      ; 5A97   00A5
        ADDI    #$00DC, R5                      ; 5A98   02FD 00DC
L_5A9A:
        ADDI    #$0015, R4                      ; 5A9A   02FC 0015
        SUBI    #$0013, R5                      ; 5A9C   033D 0013
        CMPI    #$026C, R4                      ; 5A9E   037C 026C
        BGT     L_5AAB                          ; 5AA0   020E 0009

        MOVR    R4,     R1                      ; 5AA2   00A1
        MOVR    R5,     R3                      ; 5AA3   00AB
        PSHR    R5                              ; 5AA4   0275

        JSR     R5,     L_6A93                  ; 5AA5   0004 0168 0293

        PULR    R5                              ; 5AA8   02B5
        B       L_5A9A                          ; 5AA9   0220 0010

L_5AAB:
        MVII    #$0210, R4                      ; 5AAB   02BC 0210
        SDBD                                    ; 5AAD   0001
        MVII    #$0955, R0                      ; 5AAE   02B8 0055 0009
        MOVR    R4,     R5                      ; 5AB1   00A5
        ADDI    #$00DC, R5                      ; 5AB2   02FD 00DC
L_5AB4:
        ADDI    #$0013, R4                      ; 5AB4   02FC 0013
        SUBI    #$0015, R5                      ; 5AB6   033D 0015
        CMPI    #$026F, R4                      ; 5AB8   037C 026F
        BGT     L_5AC5                          ; 5ABA   020E 0009

        MOVR    R4,     R1                      ; 5ABC   00A1
        MOVR    R5,     R3                      ; 5ABD   00AB
        PSHR    R5                              ; 5ABE   0275

        JSR     R5,     L_6A93                  ; 5ABF   0004 0168 0293

        PULR    R5                              ; 5AC2   02B5
        B       L_5AB4                          ; 5AC3   0220 0010

L_5AC5:
        MVII    #$0003, R1                      ; 5AC5   02B9 0003

        JSR     R5,     L_6858                  ; 5AC7   0004 0168 0058

        MVII    #$03B1, R0                      ; 5ACA   02B8 03B1
        MVO     R0,     .BTAB.05                ; 5ACC   0240 0205
        MVII    #$03B9, R0                      ; 5ACE   02B8 03B9
        MVO     R0,     .BTAB.0E                ; 5AD0   0240 020E
        MVII    #$03A1, R0                      ; 5AD2   02B8 03A1
        MVO     R0,     .BTAB.E1                ; 5AD4   0240 02E1
        MVII    #$03A9, R0                      ; 5AD6   02B8 03A9
        MVO     R0,     .BTAB.EA                ; 5AD8   0240 02EA
        SDBD                                    ; 5ADA   0001
        MVII    #$8802, R1                      ; 5ADB   02B9 0002 0088
        MVII    #$02E2, R4                      ; 5ADE   02BC 02E2
        MVII    #$0008, R0                      ; 5AE0   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 5AE2   0004 0114 0341

        CLRR    R0                              ; 5AE5   01C0
        MVO     R0,     G_012A                  ; 5AE6   0240 012A

        JSR     R5,     L_5B40                  ; 5AE8   0004 0158 0340

        SDBD                                    ; 5AEB   0001
        MVII    #$5D52, R1                      ; 5AEC   02B9 0052 005D
        MVII    #$0355, R2                      ; 5AEF   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 5AF1   0004 0114 02B2

        PULR    R7                              ; 5AF4   02B7

        DECLE   $0201,  $0272,  $0001,  $0045   ; 5AF5   0201 0272 0001 0045
        DECLE   $0204,  $026D,  $0015,  $0065   ; 5AF9   0204 026D 0015 0065
        DECLE   $020F,  $026E,  $0013,  $006D   ; 5AFD   020F 026E 0013 006D
        DECLE   $027D,  $02EE,  $0001           ; 5B01   027D 02EE 0001

        SLL     R1,     2                       ; 5B04   004D
        MVI     .BTAB.E0,R1                     ; 5B05   0281 02E0
        DECR    R3                              ; 5B07   0013
        SARC    R1,     2                       ; 5B08   007D
        MVI     .BTAB.EB,R2                     ; 5B09   0282 02EB
        DECR    R5                              ; 5B0B   0015
        RRC     R1,     2                       ; 5B0C   0075
L_5B0D:
        PSHR    R5                              ; 5B0D   0275
        CLRR    R0                              ; 5B0E   01C0
        MVO     R0,     G_015D                  ; 5B0F   0240 015D
        SDBD                                    ; 5B11   0001
        MVII    #$5D42, R1                      ; 5B12   02B9 0042 005D
        MVII    #$031D, R2                      ; 5B15   02BA 031D

L_5B17:
        JSR     R5,     X_INIT_MOB              ; 5B17   0004 0114 02B2

        ADDI    #$0008, R2                      ; 5B1A   02FA 0008
        CMPI    #$033D, R2                      ; 5B1C   037A 033D
        BNEQ    L_5B17                          ; 5B1E   022C 0008

        SDBD                                    ; 5B20   0001
        MVII    #$5D32, R1                      ; 5B21   02B9 0032 005D

L_5B24:
        JSR     R5,     X_INIT_MOB              ; 5B24   0004 0114 02B2

        ADDI    #$0008, R2                      ; 5B27   02FA 0008
        CMPI    #$0355, R2                      ; 5B29   037A 0355
        BNEQ    L_5B24                          ; 5B2B   022C 0008
        PULR    R7                              ; 5B2D   02B7

        MVII    #$0078, R0                      ; 5B2E   02B8 0078
        MVO     R3,     G_015D                  ; 5B30   0243 015D
        SDBD                                    ; 5B32   0001
        MVII    #$59F1, R1                      ; 5B33   02B9 00F1 0059

        JSR     R5,     .EXEC.A5E               ; 5B36   0004 0118 025E

        MVII    #$0006, R0                      ; 5B39   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5B3B   0004 0114 02E6

        XORR    R3,     R6                      ; 5B3E   01DE
        PULR    R7                              ; 5B3F   02B7

L_5B40:
        PSHR    R5                              ; 5B40   0275
        MVI     G_018E, R0                      ; 5B41   0280 018E
        SWAP    R0,     2                       ; 5B43   0044
        BMI     L_5B50                          ; 5B44   020B 000A

        MVI     G_018D, R0                      ; 5B46   0280 018D
        TSTR    R0                              ; 5B48   0080
        BNEQ    L_5B50                          ; 5B49   020C 0005

        JSR     R5,     L_5BD0                  ; 5B4B   0004 0158 03D0

        B       L_5B55                          ; 5B4E   0200 0005

L_5B50:
        MVII    #$0206, R4                      ; 5B50   02BC 0206

        JSR     R5,     L_6A9A                  ; 5B52   0004 0168 029A

L_5B55:
        MVI     G_0355, R0                      ; 5B55   0280 0355
        TSTR    R0                              ; 5B57   0080
        BMI     L_5B5E                          ; 5B58   020B 0004

        XORI    #$0012, R0                      ; 5B5A   03F8 0012
        MVO     R0,     G_0355                  ; 5B5C   0240 0355
L_5B5E:
        MVII    #$0003, R1                      ; 5B5E   02B9 0003

        JSR     R5,     L_6858                  ; 5B60   0004 0168 0058

        MVII    #$031D, R3                      ; 5B63   02BB 031D
L_5B65:
        MVI@    R3,     R0                      ; 5B65   0298
        PSHR    R3                              ; 5B66   0273
        ANDI    #$0008, R0                      ; 5B67   03B8 0008
        BNEQ    L_5BC9                          ; 5B69   020C 005E

        MOVR    R3,     R2                      ; 5B6B   009A
        ADDI    #$0005, R3                      ; 5B6C   02FB 0005
        MVI@    R3,     R0                      ; 5B6E   0298
        ANDI    #$000F, R0                      ; 5B6F   03B8 000F
        SUBI    #$000E, R0                      ; 5B71   0338 000E
        BNEQ    L_5B89                          ; 5B73   020C 0014

        MVI@    R3,     R0                      ; 5B75   0298
        ANDI    #$03C0, R0                      ; 5B76   03B8 03C0
        SLR     R0,     2                       ; 5B78   0064
        XORI    #$0008, R0                      ; 5B79   03F8 0008
        MVO@    R0,     R3                      ; 5B7B   0258
        MVI@    R2,     R0                      ; 5B7C   0290
        SDBD                                    ; 5B7D   0001
        XORI    #$2088, R0                      ; 5B7E   03F8 0088 0020
        MVO@    R0,     R2                      ; 5B81   0250
        MOVR    R2,     R1                      ; 5B82   0091

        JSR     R5,     .EXEC.766               ; 5B83   0004 0114 0366
        JSR     R5,     .EXEC.41C               ; 5B86   0004 0114 001C

L_5B89:
        PULR    R3                              ; 5B89   02B3
        ADDI    #$0008, R3                      ; 5B8A   02FB 0008
        CMPI    #$0355, R3                      ; 5B8C   037B 0355
        BNEQ    L_5B65                          ; 5B8E   022C 002A

        MVII    #$02E2, R4                      ; 5B90   02BC 02E2
L_5B92:
        MVI@    R4,     R0                      ; 5B92   02A0
        MOVR    R0,     R1                      ; 5B93   0081
        SLR     R0,     2                       ; 5B94   0064
        RRC     R0,     2                       ; 5B95   0074
        TSTR    R1                              ; 5B96   0089
        BLT     L_5BC8                          ; 5B97   0205 002F

        CMPI    #$02EA, R4                      ; 5B99   037C 02EA
        BNEQ    L_5B92                          ; 5B9B   022C 000A

        SDBD                                    ; 5B9D   0001
        MVII    #$1388, R0                      ; 5B9E   02B8 0088 0013

        JSR     R5,     L_6A75                  ; 5BA1   0004 0168 0275

        MVII    #$0038, R0                      ; 5BA4   02B8 0038
        MVII    #$031D, R4                      ; 5BA6   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 5BA8   0004 0114 0338

        MVI     G_0161, R0                      ; 5BAB   0280 0161
        INCR    R0                              ; 5BAD   0008
        MVO     R0,     G_0161                  ; 5BAE   0240 0161
        MVI     G_018E, R0                      ; 5BB0   0280 018E
        ADDI    #$000A, R0                      ; 5BB2   02F8 000A
        CMPI    #$0064, R0                      ; 5BB4   0378 0064
        BMI     L_5BBD                          ; 5BB6   020B 0005

        CLRR    R0                              ; 5BB8   01C0
        MVO     R0,     G_0182                  ; 5BB9   0240 0182
        MVII    #$00FF, R0                      ; 5BBB   02B8 00FF
L_5BBD:
        MVO     R0,     G_018E                  ; 5BBD   0240 018E
        MVII    #$0001, R0                      ; 5BBF   02B8 0001
        SDBD                                    ; 5BC1   0001
        MVII    #$59D9, R1                      ; 5BC2   02B9 00D9 0059

        JSR     R5,     .EXEC.A5E               ; 5BC5   0004 0118 025E

L_5BC8:
        PULR    R7                              ; 5BC8   02B7

L_5BC9:
        ADDI    #$0005, R3                      ; 5BC9   02FB 0005
        MVII    #$000E, R0                      ; 5BCB   02B8 000E
        MVO@    R0,     R3                      ; 5BCD   0258
        B       L_5B89                          ; 5BCE   0220 0046

L_5BD0:
        PSHR    R5                              ; 5BD0   0275
        SDBD                                    ; 5BD1   0001
        MVII    #$092F, R1                      ; 5BD2   02B9 002F 0009
        MVII    #$0206, R4                      ; 5BD5   02BC 0206
L_5BD7:
        MVO@    R1,     R4                      ; 5BD7   0261
        ADDI    #$0008, R1                      ; 5BD8   02F9 0008
        CMPI    #$0209, R4                      ; 5BDA   037C 0209
        BNEQ    L_5BD7                          ; 5BDC   022C 0006

        SDBD                                    ; 5BDE   0001
        MVII    #$0857, R1                      ; 5BDF   02B9 0057 0008
        MVO@    R1,     R4                      ; 5BE2   0261
        CLRR    R1                              ; 5BE3   01C9
        MVO@    R1,     R4                      ; 5BE4   0261
        MVI     G_018E, R0                      ; 5BE5   0280 018E
        MVII    #$0003, R1                      ; 5BE7   02B9 0003
        SDBD                                    ; 5BE9   0001
        MVII    #$0887, R3                      ; 5BEA   02BB 0087 0008

        JSR     R5,     X_PRNUM_ZRO             ; 5BED   0004 0118 00AD

        PULR    R7                              ; 5BF0   02B7

        PSHR    R5                              ; 5BF1   0275
        MOVR    R0,     R1                      ; 5BF2   0081
        BMI     L_5BFB                          ; 5BF3   020B 0006

        MVII    #$001E, R0                      ; 5BF5   02B8 001E

        JSR     R5,     .EXEC.629               ; 5BF7   0004 0114 0229

        INCR    R7                              ; 5BFA   000F

L_5BFB:
        CLRR    R0                              ; 5BFB   01C0
L_5BFC:
        MVO     R0,     G_0359                  ; 5BFC   0240 0359
L_5BFE:
        PULR    R7                              ; 5BFE   02B7

        PSHR    R5                              ; 5BFF   0275
        CMPI    #$0007, R0                      ; 5C00   0378 0007
        BMI     L_5BFE                          ; 5C02   022B 0005

        CMPI    #$000A, R0                      ; 5C04   0378 000A
        BPL     L_5BFE                          ; 5C06   0223 0009

        MVI     G_0106, R0                      ; 5C08   0280 0106
        SUBI    #$0002, R0                      ; 5C0A   0338 0002
        BNEQ    L_5BFE                          ; 5C0C   022C 000F

        MVI     G_0146, R0                      ; 5C0E   0280 0146
        SWAP    R0,     2                       ; 5C10   0044
        BPL     L_5BFE                          ; 5C11   0223 0014

        SDBD                                    ; 5C13   0001
        MVII    #$3A98, R0                      ; 5C14   02B8 0098 003A

        JSR     R5,     L_6A75                  ; 5C17   0004 0168 0275

        MVI     G_0317, R0                      ; 5C1A   0280 0317
        ADDI    #$0002, R0                      ; 5C1C   02F8 0002
        MVO     R0,     G_0317                  ; 5C1E   0240 0317
        J       L_5924                          ; 5C20   0004 0358 0124

        MVII    #$0002, R3                      ; 5C23   02BB 0002
        CLRR    R4                              ; 5C25   01E4
        B       L_5C2C                          ; 5C26   0200 0004

        MVII    #$000A, R3                      ; 5C28   02BB 000A
        MVII    #$0001, R4                      ; 5C2A   02BC 0001
L_5C2C:
        PSHR    R5                              ; 5C2C   0275
        MVI@    R1,     R0                      ; 5C2D   0288
        RRC     R0,     1                       ; 5C2E   0070
        BC      L_5C33                          ; 5C2F   0201 0002

        XORI    #$0004, R3                      ; 5C31   03FB 0004
L_5C33:
        ANDI    #$0004, R0                      ; 5C33   03B8 0004
        BNEQ    L_5C7B                          ; 5C35   020C 0044

        MVO     R3,     G_0180                  ; 5C37   0243 0180
        MVO     R4,     G_0181                  ; 5C39   0244 0181
        ADDI    #$0005, R1                      ; 5C3B   02F9 0005
        MVI@    R1,     R0                      ; 5C3D   0288
        SLR     R0,     2                       ; 5C3E   0064
        RRC     R0,     2                       ; 5C3F   0074
        BNC     L_5C7B                          ; 5C40   0209 0039
        BNOV    L_5C7B                          ; 5C42   020A 0037

        SUBI    #$0003, R1                      ; 5C44   0339 0003
        MVII    #$00AA, R0                      ; 5C46   02B8 00AA
        MVO     R0,     G_018D                  ; 5C48   0240 018D
        SWAP    R0,     1                       ; 5C4A   0040
        MVO@    R0,     R1                      ; 5C4B   0248
        CLRR    R0                              ; 5C4C   01C0
        INCR    R1                              ; 5C4D   0009
        INCR    R1                              ; 5C4E   0009
        MVO@    R0,     R1                      ; 5C4F   0248
        SDBD                                    ; 5C50   0001
        MVII    #$9046, R0                      ; 5C51   02B8 0046 0090
        MVO     R0,     G_0355                  ; 5C54   0240 0355
        SUBI    #$0004, R1                      ; 5C56   0339 0004

        JSR     R5,     L_5CDF                  ; 5C58   0004 015C 00DF
        JSR     R5,     L_6B4A                  ; 5C5B   0004 0168 034A

        MVI     G_0180, R0                      ; 5C5E   0280 0180
        ANDI    #$0004, R0                      ; 5C60   03B8 0004
        BEQ     L_5C6C                          ; 5C62   0204 0008

        MVII    #$0008, R0                      ; 5C64   02B8 0008

        JSR     R5,     X_RAND2                 ; 5C66   0004 0114 029E

        INCR    R0                              ; 5C69   0008
        B       L_5C8B                          ; 5C6A   0200 001F

L_5C6C:
        MOVR    R7,     R0                      ; 5C6C   00B8
        ADDI    #$000F, R0                      ; 5C6D   02F8 000F
        MVO     R0,     G_035D                  ; 5C6F   0240 035D
        MVI     G_0102, R0                      ; 5C71   0280 0102
        CMPI    #$0002, R0                      ; 5C73   0378 0002
        BGT     L_5C7B                          ; 5C75   020E 0004

        MVII    #$0003, R0                      ; 5C77   02B8 0003
        MVO     R0,     G_0102                  ; 5C79   0240 0102
L_5C7B:
        PULR    R7                              ; 5C7B   02B7

        DECLE   $0000,  $0000,  $0086,  $005C   ; 5C7C   0000 0000 0086 005C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C80   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5C84   0000 0000

        PSHR    R5                              ; 5C86   0275
        CMPI    #$0009, R0                      ; 5C87   0378 0009
        BPL     L_5C7B                          ; 5C89   0223 000F

L_5C8B:
        MOVR    R0,     R2                      ; 5C8B   0082
        BEQ     L_5C7B                          ; 5C8C   0224 0012

        ADDI    #$02E1, R2                      ; 5C8E   02FA 02E1
        MVI     G_0180, R3                      ; 5C90   0283 0180
        MVI@    R2,     R0                      ; 5C92   0290
        SDBD                                    ; 5C93   0001
        ANDI    #$FF00, R0                      ; 5C94   03B8 0000 00FF
        XORR    R3,     R0                      ; 5C97   01D8
        MVO@    R0,     R2                      ; 5C98   0250
        CLRR    R3                              ; 5C99   01DB
        SDBD                                    ; 5C9A   0001
        MVII    #$B0C2, R1                      ; 5C9B   02B9 00C2 00B0
        MVI     G_0181, R2                      ; 5C9E   0282 0181
        SARC    R2,     1                       ; 5CA0   007A
        TSTR    R0                              ; 5CA1   0080
        BUSC    L_5CA5                          ; 5CA2   0207 0001

        INCR    R3                              ; 5CA4   000B
L_5CA5:
        MVO     R3,     G_01BB                  ; 5CA5   0243 01BB
        TSTR    R3                              ; 5CA7   009B
        MVII    #$00FA, R0                      ; 5CA8   02B8 00FA
        BEQ     L_5CB3                          ; 5CAA   0204 0007

        JSR     R5,     L_6A75                  ; 5CAC   0004 0168 0275

        SDBD                                    ; 5CAF   0001
        MVII    #$B0D6, R1                      ; 5CB0   02B9 00D6 00B0
L_5CB3:
        MVO     R1,     G_0355                  ; 5CB3   0241 0355
        MVII    #$0003, R0                      ; 5CB5   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 5CB7   0004 0114 02E6

        XORR    R3,     R6                      ; 5CBA   01DE
        SDBD                                    ; 5CBB   0001
        MVII    #$5A54, R0                      ; 5CBC   02B8 0054 005A
        MVO     R0,     G_035D                  ; 5CBF   0240 035D
        MVII    #$0005, R0                      ; 5CC1   02B8 0005
        MVO     R0,     G_035B                  ; 5CC3   0240 035B
        MVII    #$0004, R2                      ; 5CC5   02BA 0004
        NEGR    R2                              ; 5CC7   0022
        B       L_5CD2                          ; 5CC8   0200 0008

        PSHR    R5                              ; 5CCA   0275
        SDBD                                    ; 5CCB   0001
        MVII    #$1847, R0                      ; 5CCC   02B8 0047 0018
        MVO@    R0,     R1                      ; 5CCF   0248
        MVII    #$0004, R2                      ; 5CD0   02BA 0004
L_5CD2:
        MVII    #$0357, R1                      ; 5CD2   02B9 0357
L_5CD4:
        MVI@    R1,     R0                      ; 5CD4   0288
        SWAP    R0,     1                       ; 5CD5   0040
        ADDR    R2,     R0                      ; 5CD6   00D0
        SWAP    R0,     1                       ; 5CD7   0040
        MVO@    R0,     R1                      ; 5CD8   0248
        INCR    R1                              ; 5CD9   0009
        CMPI    #$0359, R1                      ; 5CDA   0379 0359
        BNEQ    L_5CD4                          ; 5CDC   022C 0009
        PULR    R7                              ; 5CDE   02B7

L_5CDF:
        PSHR    R5                              ; 5CDF   0275
        MVI@    R1,     R2                      ; 5CE0   028A
        SDBD                                    ; 5CE1   0001
        ANDI    #$DF76, R2                      ; 5CE2   03BA 0076 00DF
        MVII    #$0003, R0                      ; 5CE5   02B8 0003
        MVI     G_0161, R3                      ; 5CE7   0283 0161
        SLR     R3,     2                       ; 5CE9   0067
        SUBR    R3,     R0                      ; 5CEA   0118
        BPL     L_5CEE                          ; 5CEB   0203 0001

        CLRR    R0                              ; 5CED   01C0
L_5CEE:
        ADDI    #$0002, R0                      ; 5CEE   02F8 0002

        JSR     R5,     X_RAND2                 ; 5CF0   0004 0114 029E

        TSTR    R0                              ; 5CF3   0080
        BEQ     L_5CF8                          ; 5CF4   0204 0002

        XORI    #$0001, R2                      ; 5CF6   03FA 0001
L_5CF8:
        MVO@    R2,     R1                      ; 5CF8   024A
        ADDI    #$0005, R1                      ; 5CF9   02F9 0005
        MOVR    R1,     R3                      ; 5CFB   008B
        DECR    R3                              ; 5CFC   0013
        MVII    #$000C, R0                      ; 5CFD   02B8 000C

        JSR     R5,     X_RAND2                 ; 5CFF   0004 0114 029E

        ADDI    #$0003, R0                      ; 5D02   02F8 0003
        PSHR    R0                              ; 5D04   0270
        SLL     R0,     2                       ; 5D05   004C
        NOP                                     ; 5D06   0034
        SLL     R0,     2                       ; 5D07   004C
        SLL     R0,     2                       ; 5D08   004C
        MVO@    R0,     R1                      ; 5D09   0248
        INCR    R1                              ; 5D0A   0009
        MVII    #$0003, R0                      ; 5D0B   02B8 0003
        MVO@    R0,     R1                      ; 5D0D   0248
        MVII    #$0010, R0                      ; 5D0E   02B8 0010

        JSR     R5,     X_RAND2                 ; 5D10   0004 0114 029E

        MOVR    R0,     R1                      ; 5D13   0081
        PULR    R0                              ; 5D14   02B0

        JSR     R5,     .EXEC.629               ; 5D15   0004 0114 0229

        MVO@    R0,     R3                      ; 5D18   0258
        PULR    R7                              ; 5D19   02B7

        PSHR    R5                              ; 5D1A   0275
        MVI     G_015D, R0                      ; 5D1B   0280 015D
        TSTR    R0                              ; 5D1D   0080
        BEQ     L_5D23                          ; 5D1E   0204 0003

        CLRR    R0                              ; 5D20   01C0
        MVO@    R0,     R1                      ; 5D21   0248
        PULR    R7                              ; 5D22   02B7

L_5D23:
        ADDI    #$0002, R1                      ; 5D23   02F9 0002
        MVII    #$0058, R2                      ; 5D25   02BA 0058
        SWAP    R2,     1                       ; 5D27   0042
        MVO@    R2,     R1                      ; 5D28   024A
        INCR    R1                              ; 5D29   0009
        MVII    #$0038, R0                      ; 5D2A   02B8 0038
        SWAP    R0,     1                       ; 5D2C   0040
        MVO@    R0,     R1                      ; 5D2D   0248

        JSR     R5,     L_6B7E                  ; 5D2E   0004 0168 037E

        PULR    R7                              ; 5D31   02B7

        DECLE   $0047,  $0018,  $0070,  $005D   ; 5D32   0047 0018 0070 005D
        DECLE   $0000,  $0001,  $0000,  $0001   ; 5D36   0000 0001 0000 0001
        DECLE   $03C4,  $03C4,  $0080,  $0001   ; 5D3A   03C4 03C4 0080 0001
        DECLE   $002C,  $0001,  $0032,  $0000   ; 5D3E   002C 0001 0032 0000
        DECLE   $0047,  $0018,  $0079,  $005D   ; 5D42   0047 0018 0079 005D
        DECLE   $0000,  $0001,  $0000,  $0001   ; 5D46   0000 0001 0000 0001
        DECLE   $03C4,  $03C4,  $0080,  $0001   ; 5D4A   03C4 03C4 0080 0001
        DECLE   $002C,  $0001,  $0035,  $0000   ; 5D4E   002C 0001 0035 0000
        DECLE   $0055,  $0018,  $0062,  $005D   ; 5D52   0055 0018 0062 005D
        DECLE   $0000,  $0032,  $0000,  $0032   ; 5D56   0000 0032 0000 0032
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 5D5A   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5E   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $00CA,  $005C   ; 5D62   0300 0000 00CA 005C
        DECLE   $0003,  $0061,  $0000,  $0200   ; 5D66   0003 0061 0000 0200
        DECLE   $0000,  $0000,  $0000           ; 5D6A   0000 0000 0000

        JSRE    R4,     .EXEC.C00               ; 5D6D   0004 001D 0000

        ADD@    R3,     R7                      ; 5D70   02DF

        SLLC    R0,     2                       ; 5D71   005C
        COMR    R2                              ; 5D72   001A
        SLLC    R1,     2                       ; 5D73   005D
        INCR    R7                              ; 5D74   000F

        NEGR    R5                              ; 5D75   0025
L_5D76:
        EIS                                     ; 5D76   0002
        SUB@    R4,     R3                      ; 5D77   0323
        CMPR    R3,     R4                      ; 5D78   015C
        ADD@    R3,     R7                      ; 5D79   02DF

        SLLC    R0,     2                       ; 5D7A   005C
        COMR    R2                              ; 5D7B   001A
        SLLC    R1,     2                       ; 5D7C   005D
        INCR    R7                              ; 5D7D   000F

        SWAP    R3,     1                       ; 5D7E   0043
L_5D7F:
        EIS                                     ; 5D7F   0002
        DECLE   $0328,  $015C,  $00D1,  $0038   ; 5D80   0328 015C 00D1 0038
        DECLE   $00A2,  $005D,  $0000,  $004D   ; 5D84   00A2 005D 0000 004D
        DECLE   $0000,  $0035,  $0000,  $0000   ; 5D88   0000 0035 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00D1,  $0038   ; 5D90   0000 0000 00D1 0038
        DECLE   $00A9,  $005D,  $0000,  $005D   ; 5D94   00A9 005D 0000 005D
        DECLE   $0000,  $0035,  $0008,  $0000   ; 5D98   0000 0035 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA0   0000 0000 0000 0000
        DECLE   $0056,  $0057,  $0003,  $0000   ; 5DA4   0056 0057 0003 0000
        DECLE   $0000,  $0000,  $0000,  $00AB   ; 5DA8   0000 0000 0000 00AB
        DECLE   $0055,  $0003,  $0004,  $0000   ; 5DAC   0055 0003 0004 0000

        MVI@    R5,     R6                      ; 5DB0   02AE
L_5DB1:
        DECR    R7                              ; 5DB1   0017

        DECLE   $0000,  $0000,  $0002,  $000A   ; 5DB2   0000 0000 0002 000A
        DECLE   $0000                           ; 5DB6   0000

        MVI@    R5,     R6                      ; 5DB7   02AE
L_5DB8:
        DECR    R7                              ; 5DB8   0017

        DECLE   $0056,  $0055,  $0001,  $000C   ; 5DB9   0056 0055 0001 000C
        DECLE   $0004,  $00FA,  $0054,  $00FA   ; 5DBD   0004 00FA 0054 00FA
        DECLE   $0154,  $0000,  $0000,  $0000   ; 5DC1   0154 0000 0000 0000
        DECLE   $0000,  $0002,  $000D,  $0006   ; 5DC5   0000 0002 000D 0006
        DECLE   $0083,  $0055,  $021B,  $0055   ; 5DC9   0083 0055 021B 0055
        DECLE   $021B                           ; 5DCD   021B

        CMPR    R2,     R5                      ; 5DCE   0155
        B       L_5DD1                          ; 5DCF   0200 0000

L_5DD1:
        RLC     R2,     2                       ; 5DD1   0056
        RLC     R1,     2                       ; 5DD2   0055

        JSRE    R4,     X_RESET                 ; 5DD3   0004 0011 0000
        DECLE   $0000,  $0000                   ; 5DD6   0000 0000

        SLLC    R2,     2                       ; 5DD8   005E
        RLC     R1,     2                       ; 5DD9   0055

        JSRE    R4,     .EXEC.800               ; 5DDA   0004 0019 0000
        DECLE   $0003,  $0006,  $0005,  $0008   ; 5DDD   0003 0006 0005 0008
        DECLE   $0008,  $0008,  $0004           ; 5DE1   0008 0008 0004

        INCR    R7                              ; 5DE4   000F

        DECLE   $0004                           ; 5DE5   0004
L_5DE6:
        INCR    R0                              ; 5DE6   0008
        DECLE   $0008,  $0008,  $0005,  $0006   ; 5DE7   0008 0008 0005 0006
        DECLE   $0003,  $0000,  $000D,  $0013   ; 5DEB   0003 0000 000D 0013
        DECLE   $0011,  $0021,  $0031,  $0029   ; 5DEF   0011 0021 0031 0029
        DECLE   $0029,  $0004,  $0004,  $0002   ; 5DF3   0029 0004 0004 0002
        DECLE   $0002,  $0001,  $0001,  $0000   ; 5DF7   0002 0001 0001 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 5DFB   0000 0000 0080 0000
        DECLE   $0000,  $0080,  $0040,  $0020   ; 5DFF   0000 0080 0040 0020
        DECLE   $0010,  $0090,  $0010,  $0020   ; 5E03   0010 0090 0010 0020
        DECLE   $0040,  $0080,  $0000,  $0000   ; 5E07   0040 0080 0000 0000
        DECLE   $0080,  $0000,  $0060,  $0090   ; 5E0B   0080 0000 0060 0090
        DECLE   $0010,  $0008,  $0018,  $0028   ; 5E0F   0010 0008 0018 0028
        DECLE   $0028,  $0040,  $0040,  $0080   ; 5E13   0028 0040 0040 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5E17   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0006   ; 5E1B   0000 0000 0003 0006
        DECLE   $0005,  $0008,  $0008,  $0008   ; 5E1F   0005 0008 0008 0008
        DECLE   $0004,  $000F,  $0004,  $0008   ; 5E23   0004 000F 0004 0008
        DECLE   $0008,  $0008,  $0005,  $0006   ; 5E27   0008 0008 0005 0006
        DECLE   $0003,  $0000,  $0000,  $0014   ; 5E2B   0003 0000 0000 0014
        DECLE   $0040,  $001A,  $0058,  $0002   ; 5E2F   0040 001A 0058 0002
        DECLE   $0028,  $0000,  $0000,  $0028   ; 5E33   0028 0000 0000 0028
        DECLE   $0002,  $0058,  $001A,  $0040   ; 5E37   0002 0058 001A 0040
        DECLE   $0014,  $0000,  $0000,  $0000   ; 5E3B   0014 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0028   ; 5E3F   0000 0010 0038 0028
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5E43   0000 0000 0000 0018
        DECLE   $003C,  $0034,  $00FF,  $00FF   ; 5E47   003C 0034 00FF 00FF
        DECLE   $00FF                           ; 5E4B   00FF

        MOVR    R3,     R1                      ; 5E4C   0099
        MOVR    R0,     R1                      ; 5E4D   0081
        MOVR    R0,     R1                      ; 5E4E   0081
        MOVR    R0,     R1                      ; 5E4F   0081
        MOVR    R0,     R1                      ; 5E50   0081
        MOVR    R0,     R1                      ; 5E51   0081
        MOVR    R0,     R1                      ; 5E52   0081
        ADDR    R0,     R3                      ; 5E53   00C3
        ADDR    R4,     R7                      ; 5E54   00E7

        DECLE   $0000,  $0018,  $003C,  $002C   ; 5E55   0000 0018 003C 002C
        DECLE   $00FF,  $00FF,  $00FF           ; 5E59   00FF 00FF 00FF

        MOVR    R3,     R1                      ; 5E5C   0099
        MOVR    R0,     R1                      ; 5E5D   0081
        MOVR    R0,     R1                      ; 5E5E   0081
        MOVR    R0,     R1                      ; 5E5F   0081
        MOVR    R0,     R1                      ; 5E60   0081
        MOVR    R0,     R1                      ; 5E61   0081
        MOVR    R0,     R1                      ; 5E62   0081
        ADDR    R0,     R3                      ; 5E63   00C3
        ADDR    R4,     R7                      ; 5E64   00E7

        DECLE   $0018,  $0024,  $0000,  $0000   ; 5E65   0018 0024 0000 0000
        DECLE   $0000,  $003C,  $00C3,  $0000   ; 5E69   0000 003C 00C3 0000
        DECLE   $0000,  $0000,  $0081,  $0042   ; 5E6D   0000 0000 0081 0042
        DECLE   $0000,  $0000,  $00C3,  $003C   ; 5E71   0000 0000 00C3 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E75   0000 0000 0000 0000
        DECLE   $003C,  $00C3,  $0000,  $0000   ; 5E79   003C 00C3 0000 0000
        DECLE   $0000,  $00C3,  $0000,  $0000   ; 5E7D   0000 00C3 0000 0000
        DECLE   $0000,  $00C3,  $003C,  $0000   ; 5E81   0000 00C3 003C 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; 5E85   0000 0000 0018 0024
        DECLE   $00C3,  $0000,  $0000,  $0000   ; 5E89   00C3 0000 0000 0000
        DECLE   $00DB,  $0000,  $0000,  $0000   ; 5E8D   00DB 0000 0000 0000
        DECLE   $0081,  $0042,  $0000,  $0000   ; 5E91   0081 0042 0000 0000
        DECLE   $0000,  $0018,  $0024,  $0042   ; 5E95   0000 0018 0024 0042
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5E99   0000 0000 0000 00FF
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5E9D   0000 0000 0000 0081
        DECLE   $0042,  $0000,  $0000,  $0000   ; 5EA1   0042 0000 0000 0000
        DECLE   $003C,  $0042,  $0099,  $00A5   ; 5EA5   003C 0042 0099 00A5
        DECLE   $0099,  $0042,  $003C,  $0000   ; 5EA9   0099 0042 003C 0000
        DECLE   $0081,  $003C,  $0042,  $0042   ; 5EAD   0081 003C 0042 0042
        DECLE   $0042,  $003C,  $0081,  $0000   ; 5EB1   0042 003C 0081 0000
        DECLE   $003C,  $0042,  $0081,  $0081   ; 5EB5   003C 0042 0081 0081
        DECLE   $0081,  $0042,  $003C,  $0000   ; 5EB9   0081 0042 003C 0000
        DECLE   $0081,  $0000,  $0000,  $0000   ; 5EBD   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0000   ; 5EC1   0000 0000 0081 0000

        TSTR    R2                              ; 5EC5   0092
        RLC     R0,     2                       ; 5EC6   0054
        RSWD    R0                              ; 5EC7   0038
        ADDR    R5,     R7                      ; 5EC8   00EF

        RSWD    R0                              ; 5EC9   0038
        RLC     R0,     2                       ; 5ECA   0054
        TSTR    R2                              ; 5ECB   0092
        DECR    R0                              ; 5ECC   0010
        DECR    R0                              ; 5ECD   0010
        DECR    R0                              ; 5ECE   0010
        ADDR    R2,     R6                      ; 5ECF   00D6
        ADDR    R5,     R7                      ; 5ED0   00EF

        DECLE   $00D6,  $0010,  $0010,  $0010   ; 5ED1   00D6 0010 0010 0010
        DECLE   $0010,  $00D6,  $0038,  $00FF   ; 5ED5   0010 00D6 0038 00FF
        DECLE   $0038,  $00D6,  $0010,  $0010   ; 5ED9   0038 00D6 0010 0010
        DECLE   $0010,  $00D6,  $0038,  $00FF   ; 5EDD   0010 00D6 0038 00FF

        RSWD    R0                              ; 5EE1   0038
        ADDR    R2,     R6                      ; 5EE2   00D6
        DECR    R0                              ; 5EE3   0010
        DECR    R0                              ; 5EE4   0010
        DECR    R0                              ; 5EE5   0010
        DECR    R0                              ; 5EE6   0010
        ADDR    R2,     R6                      ; 5EE7   00D6
        ADDR    R5,     R7                      ; 5EE8   00EF

        ADDR    R2,     R6                      ; 5EE9   00D6
        DECR    R0                              ; 5EEA   0010
        DECR    R0                              ; 5EEB   0010
        DECR    R0                              ; 5EEC   0010
        TSTR    R2                              ; 5EED   0092
        RLC     R0,     2                       ; 5EEE   0054
        RSWD    R0                              ; 5EEF   0038
        ADDR    R5,     R7                      ; 5EF0   00EF

        DECLE   $0038,  $0054,  $0092,  $0010   ; 5EF1   0038 0054 0092 0010
        DECLE   $0010,  $00D6,  $0038,  $00FF   ; 5EF5   0010 00D6 0038 00FF
        DECLE   $0038,  $00D6,  $0010,  $0010   ; 5EF9   0038 00D6 0010 0010
        DECLE   $0010,  $00D6,  $0038,  $00FF   ; 5EFD   0010 00D6 0038 00FF
        DECLE   $0038,  $00D6,  $0010,  $0010   ; 5F01   0038 00D6 0010 0010
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5F05   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F11   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0000,  $0000   ; 5F15   0080 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F21   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00C0,  $0000   ; 5F25   00C0 00C0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F31   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5F35   00C0 00C0 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F41   0000 0000 0000 0000
        DECLE   $00E0,  $00A0,  $00A0,  $00E0   ; 5F45   00E0 00A0 00A0 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5F49   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F51   0000 0000 0000 0000
        DECLE   $00E0,  $00A0,  $00A0,  $00A0   ; 5F55   00E0 00A0 00A0 00A0
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; 5F59   00E0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F61   0000 0000 0000 0000
        DECLE   $00F0,  $0090,  $0090,  $0090   ; 5F65   00F0 0090 0090 0090
        DECLE   $0090,  $0090,  $00F0,  $00F0   ; 5F69   0090 0090 00F0 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F71   0000 0000 0000 0000
        DECLE   $00F0,  $0090,  $0090,  $0090   ; 5F75   00F0 0090 0090 0090
        DECLE   $0090,  $00F0,  $0090,  $00F0   ; 5F79   0090 00F0 0090 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F81   0000 0000 0000 0000
        DECLE   $00F8,  $0088,  $0088,  $0088   ; 5F85   00F8 0088 0088 0088
        DECLE   $0088,  $0088,  $00A8,  $0088   ; 5F89   0088 0088 00A8 0088
        DECLE   $00F8,  $0000,  $0000,  $0000   ; 5F8D   00F8 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F91   0000 0000 0000 0000
        DECLE   $00F8,  $0088,  $0088,  $0088   ; 5F95   00F8 0088 0088 0088
        DECLE   $0088,  $0088,  $0088,  $00A8   ; 5F99   0088 0088 0088 00A8
        DECLE   $0088,  $00F8,  $0000,  $0000   ; 5F9D   0088 00F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA1   0000 0000 0000 0000
        DECLE   $00F8,  $00F8,  $0088,  $0088   ; 5FA5   00F8 00F8 0088 0088
        DECLE   $0088,  $0088,  $0088,  $00A8   ; 5FA9   0088 0088 0088 00A8
        DECLE   $0088,  $00F8,  $00F8,  $0000   ; 5FAD   0088 00F8 00F8 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB1   0000 0000 0000 0000
        DECLE   $00F8,  $00F8,  $0088,  $0088   ; 5FB5   00F8 00F8 0088 0088
        DECLE   $0088,  $0088,  $0088,  $0088   ; 5FB9   0088 0088 0088 0088
        DECLE   $00A8,  $0088,  $00F8,  $00F8   ; 5FBD   00A8 0088 00F8 00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC1   0000 0000 0000 0000
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 5FC5   00FE 00FE 0082 0082
        DECLE   $0082,  $0082,  $0082,  $0082   ; 5FC9   0082 0082 0082 0082
        DECLE   $0082,  $0092,  $0092,  $0082   ; 5FCD   0082 0092 0092 0082
        DECLE   $00FE,  $00FE,  $0000,  $0000   ; 5FD1   00FE 00FE 0000 0000
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 5FD5   00FE 00FE 0082 0082
        DECLE   $0082,  $0082,  $0082,  $0082   ; 5FD9   0082 0082 0082 0082
        DECLE   $0082,  $0092,  $0092,  $0082   ; 5FDD   0082 0092 0092 0082
        DECLE   $0082,  $00FE,  $00FE,  $0000   ; 5FE1   0082 00FE 00FE 0000
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 5FE5   00FE 00FE 0082 0082
        DECLE   $0082,  $0082,  $0082,  $0082   ; 5FE9   0082 0082 0082 0082
        DECLE   $0082,  $0082,  $0092,  $0092   ; 5FED   0082 0082 0092 0092
        DECLE   $0082,  $0082,  $00FE,  $00FE   ; 5FF1   0082 0082 00FE 00FE
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5FF5   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6001   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0000,  $0000   ; 6005   0080 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6009   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 600D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6011   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $00C0,  $0000   ; 6015   00C0 0040 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6019   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 601D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6021   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $0040,  $00C0   ; 6025   00C0 0040 0040 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6029   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 602D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6031   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $0040,  $00E0   ; 6035   00C0 0040 0040 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 6039   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 603D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6041   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $0040,  $0040   ; 6045   00C0 0040 0040 0040
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; 6049   00E0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 604D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6051   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $0040,  $0040   ; 6055   00C0 0040 0040 0040
        DECLE   $0040,  $00E0,  $00E0,  $0000   ; 6059   0040 00E0 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 605D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6061   0000 0000 0000 0000
        DECLE   $00C0,  $0040,  $0040,  $0040   ; 6065   00C0 0040 0040 0040
        DECLE   $0040,  $0040,  $00F0,  $00F0   ; 6069   0040 0040 00F0 00F0
        DECLE   $00F0,  $0000,  $0000,  $0000   ; 606D   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6071   0000 0000 0000 0000
        DECLE   $00E0,  $0020,  $0020,  $0020   ; 6075   00E0 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $00F8   ; 6079   0020 0020 0020 00F8
        DECLE   $00F8,  $00F8,  $0000,  $0000   ; 607D   00F8 00F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6081   0000 0000 0000 0000
        DECLE   $00E0,  $0020,  $0020,  $0020   ; 6085   00E0 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 6089   0020 0020 0020 0020
        DECLE   $00F8,  $00F8,  $00F8,  $0000   ; 608D   00F8 00F8 00F8 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6091   0000 0000 0000 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; 6095   00E0 00E0 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 6099   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $00F8,  $00F8   ; 609D   0020 0020 00F8 00F8
        DECLE   $00F8,  $0000,  $0000,  $0000   ; 60A1   00F8 0000 0000 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; 60A5   00E0 00E0 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 60A9   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $00FC,  $00FC   ; 60AD   0020 0020 00FC 00FC
        DECLE   $00FC,  $0000,  $0000,  $0000   ; 60B1   00FC 0000 0000 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; 60B5   00E0 00E0 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 60B9   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $00FC   ; 60BD   0020 0020 0020 00FC
        DECLE   $00FC,  $00FC,  $0000,  $0000   ; 60C1   00FC 00FC 0000 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; 60C5   00E0 00E0 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 60C9   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $00FE,  $00FE   ; 60CD   0020 0020 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $0000   ; 60D1   00FE 00FE 00FE 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; 60D5   00E0 00E0 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 60D9   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $00FE   ; 60DD   0020 0020 0020 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 60E1   00FE 00FE 00FE 00FE
        DECLE   $003C,  $0018,  $0066,  $003C   ; 60E5   003C 0018 0066 003C
        DECLE   $00DB,  $0066,  $00BD,  $00A5   ; 60E9   00DB 0066 00BD 00A5
        DECLE   $00A5,  $00BD,  $0066,  $00DB   ; 60ED   00A5 00BD 0066 00DB
        DECLE   $003C,  $0066,  $0018,  $003C   ; 60F1   003C 0066 0018 003C
        DECLE   $0018,  $0024,  $003C,  $005A   ; 60F5   0018 0024 003C 005A
        DECLE   $0066,  $00BD,  $00C3,  $005A   ; 60F9   0066 00BD 00C3 005A
        DECLE   $005A,  $00C3,  $00BD,  $0066   ; 60FD   005A 00C3 00BD 0066
        DECLE   $005A,  $003C,  $0024,  $0018   ; 6101   005A 003C 0024 0018
        DECLE   $0024,  $003C,  $005A,  $0066   ; 6105   0024 003C 005A 0066
        DECLE   $007E,  $0081,  $00BD,  $00BD   ; 6109   007E 0081 00BD 00BD
        DECLE   $00BD,  $00BD,  $0081,  $007E   ; 610D   00BD 00BD 0081 007E
        DECLE   $0066,  $005A,  $003C,  $0024   ; 6111   0066 005A 003C 0024
.GFX_LIST_6115:
        DECLE   $00FE,  $0082,  $0082,  $0082   ; 6115  CART PIC #00
        DECLE   $0082,  $0092,  $0082,  $00FE   ; 6119  
        DECLE   $00E0,  $0020,  $0020,  $0020   ; 611D  CART PIC #01
        DECLE   $0020,  $0020,  $00FE,  $00FE   ; 6121  
        DECLE   $00FE,  $0002,  $0002,  $00FE   ; 6125  CART PIC #02
        DECLE   $0080,  $0080,  $0080,  $00FE   ; 6129  
        DECLE   $00F8,  $0008,  $0008,  $00F8   ; 612D  CART PIC #03
        DECLE   $000E,  $000E,  $000E,  $00FE   ; 6131  
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 6135  CART PIC #04
        DECLE   $00EE,  $00FE,  $000E,  $000E   ; 6139  
        DECLE   $00FE,  $0080,  $0080,  $00FE   ; 613D  CART PIC #05
        DECLE   $0002,  $0002,  $0002,  $00FE   ; 6141  
        DECLE   $00F0,  $0090,  $0080,  $0080   ; 6145  CART PIC #06
        DECLE   $0080,  $00FE,  $0082,  $00FE   ; 6149  
        DECLE   $00FE,  $0082,  $0004,  $0008   ; 614D  CART PIC #07
        DECLE   $0010,  $0010,  $0010,  $0010   ; 6151  
        DECLE   $007C,  $0044,  $0044,  $007C   ; 6155  CART PIC #08
        DECLE   $00C6,  $00C6,  $00C6,  $00FE   ; 6159  
        DECLE   $00FE,  $0082,  $0082,  $00FE   ; 615D  CART PIC #09
        DECLE   $000E,  $000E,  $000E,  $000E   ; 6161  
        DECLE   $0000,  $0000,  $0038,  $0038   ; 6165  CART PIC #0A
        DECLE   $0000,  $0038,  $0038,  $0000   ; 6169  
        DECLE   $0008,  $008A,  $00FE,  $00FE   ; 616D  CART PIC #0B
        DECLE   $00FE,  $00FE,  $008A,  $001C   ; 6171  
        DECLE   $0004,  $0004,  $0008,  $0010   ; 6175  CART PIC #0C
        DECLE   $0020,  $0040,  $0080,  $0080   ; 6179  
        DECLE   $005A,  $00BD,  $007E,  $00FF   ; 617D  CART PIC #0D
        DECLE   $00FF,  $007E,  $00BD,  $005A   ; 6181  
        DECLE   $0010,  $0010,  $0010,  $00FF   ; 6185  CART PIC #0E
        DECLE   $0010,  $0010,  $0010,  $0010   ; 6189  
        DECLE   $007F,  $0060,  $0060,  $0060   ; 618D  CART PIC #0F
        DECLE   $007E,  $0006,  $0006,  $0006   ; 6191  
        DECLE   $00FF,  $0081,  $00BD,  $00A1   ; 6195  CART PIC #10
        DECLE   $00BD,  $0081,  $00FF,  $0000   ; 6199  
        DECLE   $003E,  $0022,  $0022,  $003E   ; 619D  CART PIC #11
        DECLE   $00E2,  $00E2,  $00E2,  $00E2   ; 61A1  
        DECLE   $00FC,  $00E4,  $00E4,  $00FE   ; 61A5  CART PIC #12
        DECLE   $00E2,  $00E2,  $00E2,  $00FE   ; 61A9  
        DECLE   $00FE,  $008E,  $0080,  $0080   ; 61AD  CART PIC #13
        DECLE   $0080,  $0080,  $0082,  $00FE   ; 61B1  
        DECLE   $00FE,  $00E2,  $00E2,  $00E2   ; 61B5  CART PIC #14
        DECLE   $00E2,  $00E2,  $00E2,  $00FE   ; 61B9  
        DECLE   $003E,  $0020,  $0020,  $003E   ; 61BD  CART PIC #15
        DECLE   $00E0,  $00E0,  $00E0,  $00FE   ; 61C1  
        DECLE   $00FE,  $00E0,  $00E0,  $00FE   ; 61C5  CART PIC #16
        DECLE   $0020,  $0020,  $0020,  $0020   ; 61C9  
        DECLE   $00F8,  $0088,  $0080,  $0080   ; 61CD  CART PIC #17
        DECLE   $009E,  $008E,  $008E,  $00FE   ; 61D1  
        DECLE   $0082,  $0082,  $0082,  $00FE   ; 61D5  CART PIC #18
        DECLE   $00E2,  $00E2,  $00E2,  $00E2   ; 61D9  
        DECLE   $007C,  $007C,  $0010,  $0010   ; 61DD  CART PIC #19
        DECLE   $0010,  $0010,  $007C,  $007C   ; 61E1  
        DECLE   $00E7,  $0066,  $0066,  $0066   ; 61E5  CART PIC #1A
        DECLE   $00E7,  $0000,  $0000,  $0000   ; 61E9  
        DECLE   $00E2,  $00E4,  $00E8,  $00FE   ; 61ED  CART PIC #1B
        DECLE   $00E2,  $00E2,  $00E2,  $00E2   ; 61F1  
        DECLE   $0020,  $0020,  $0020,  $0020   ; 61F5  CART PIC #1C
        DECLE   $00E0,  $00E0,  $00E0,  $00FE   ; 61F9  
        DECLE   $00E6,  $00EA,  $00AA,  $00B2   ; 61FD  CART PIC #1D
        DECLE   $0082,  $0082,  $0092,  $0092   ; 6201  
        DECLE   $00C2,  $00A2,  $0092,  $008A   ; 6205  CART PIC #1E
        DECLE   $0086,  $0082,  $0092,  $0092   ; 6209  
        DECLE   $00FE,  $0082,  $0082,  $0082   ; 620D  CART PIC #1F
        DECLE   $0082,  $0082,  $0082,  $00FE   ; 6211  
        DECLE   $00FE,  $0082,  $0082,  $00FE   ; 6215  CART PIC #20
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 6219  
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 621D  CART PIC #21
        DECLE   $0007,  $0006,  $0006,  $0006   ; 6221  
        DECLE   $00F8,  $0088,  $0088,  $00FE   ; 6225  CART PIC #22
        DECLE   $00E2,  $00E2,  $00E2,  $00E2   ; 6229  
        DECLE   $00FE,  $0082,  $0080,  $00FE   ; 622D  CART PIC #23
        DECLE   $0002,  $0002,  $00E2,  $00FE   ; 6231  
        DECLE   $00FE,  $0010,  $0010,  $0010   ; 6235  CART PIC #24
        DECLE   $0038,  $0038,  $0038,  $0038   ; 6239  
        DECLE   $008E,  $008E,  $008E,  $008E   ; 623D  CART PIC #25
        DECLE   $008E,  $008E,  $008E,  $00FE   ; 6241  
        DECLE   $00E2,  $00E2,  $00E2,  $00E2   ; 6245  CART PIC #26
        DECLE   $00E2,  $00E4,  $00E8,  $00F0   ; 6249  
        DECLE   $0057,  $0051,  $0000,  $0000   ; 624D  CART PIC #27
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6251  
        DECLE   $0000,  $0000,  $0009,  $0009   ; 6255  CART PIC #28
        DECLE   $0001,  $0009,  $0005,  $0005   ; 6259  
        DECLE   $0082,  $0082,  $0082,  $00FE   ; 625D  CART PIC #29
        DECLE   $0038,  $0038,  $0038,  $0038   ; 6261  
        DECLE   $00FC,  $0004,  $0008,  $0010   ; 6265  CART PIC #2A
        DECLE   $0020,  $0040,  $008E,  $00FE   ; 6269  
        DECLE   $00FF,  $0001,  $0000,  $0000   ; 626D  CART PIC #2B
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6271  
        DECLE   $0000,  $00C0,  $0070,  $001C   ; 6275  CART PIC #2C
        DECLE   $0086,  $00E3,  $0063,  $007F   ; 6279  
        DECLE   $0003,  $000F,  $001C,  $0038   ; 627D  CART PIC #2D
        DECLE   $0071,  $0063,  $00C6,  $00C4   ; 6281  
        DECLE   $00F8,  $00FE,  $0007,  $0003   ; 6285  CART PIC #2E
        DECLE   $00F1,  $0018,  $000C,  $0004   ; 6289  
        DECLE   $0018,  $001C,  $001E,  $009B   ; 628D  CART PIC #2F
        DECLE   $00D9,  $00D8,  $0078,  $0079   ; 6291  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6295  CART PIC #30
        DECLE   $0080,  $00C0,  $0060,  $00F8   ; 6299  
        DECLE   $007E,  $0066,  $0066,  $0066   ; 629D  CART PIC #31
        DECLE   $0066,  $0066,  $0066,  $0066   ; 62A1  
        DECLE   $0006,  $0006,  $0006,  $0006   ; 62A5  CART PIC #32
        DECLE   $0006,  $0006,  $0007,  $0000   ; 62A9  
        DECLE   $0006,  $0006,  $0006,  $0006   ; 62AD  CART PIC #33
        DECLE   $0006,  $0006,  $00FE,  $0000   ; 62B1  
        DECLE   $003F,  $0031,  $0031,  $0031   ; 62B5  CART PIC #34
        DECLE   $0031,  $0031,  $003F,  $0000   ; 62B9  
        DECLE   $00FF,  $00B0,  $0098,  $008C   ; 62BD  CART PIC #35
        DECLE   $0086,  $0083,  $0081,  $0000   ; 62C1  
        DECLE   $0080,  $00C0,  $0060,  $0030   ; 62C5  CART PIC #36
        DECLE   $0018,  $000C,  $00FE,  $0000   ; 62C9  
        DECLE   $00C6,  $0063,  $0071,  $0038   ; 62CD  CART PIC #37
        DECLE   $001C,  $000F,  $0003,  $0000   ; 62D1  
        DECLE   $000C,  $0018,  $00F1,  $0003   ; 62D5  CART PIC #38
        DECLE   $0007,  $00FE,  $00F8,  $0000   ; 62D9  
        DECLE   $0079,  $00D9,  $00D9,  $0099   ; 62DD  CART PIC #39
        DECLE   $0019,  $0019,  $001F,  $0000   ; 62E1  
        DECLE   $0087,  $0081,  $0080,  $0080   ; 62E5  CART PIC #3A
        DECLE   $0080,  $0080,  $0080,  $0000   ; 62E9  
        DECLE   $00E6,  $0086,  $00C6,  $0066   ; 62ED  CART PIC #3B
        DECLE   $0036,  $001E,  $000E,  $0000   ; 62F1  
        DECLE   $0080,  $0040,  $0000,  $001F   ; 62F5  CART PIC #3C
        DECLE   $0010,  $0017,  $0014,  $0014   ; 62F9  
        DECLE   $0080,  $0000,  $003F,  $0020   ; 62FD  CART PIC #3D
        DECLE   $0020,  $0027,  $0024,  $0024   ; 6301  
        DECLE   $0000,  $007F,  $0040,  $0040   ; 6305  CART PIC #3E
        DECLE   $004F,  $0048,  $004B,  $004A   ; 6309  
        DECLE   $00FF                           ; 630D   00FF

        TSTR    R0                              ; 630E   0080
        MOVR    R4,     R0                      ; 630F   00A0
        TSTR    R0                              ; 6310   0080
        MOVR    R1,     R7                      ; 6311   008F

        DECLE   $0088,  $008B,  $008A,  $0000   ; 6312   0088 008B 008A 0000
        DECLE   $0040,  $0020,  $0010,  $0008   ; 6316   0040 0020 0010 0008
        DECLE   $0000,  $0003,  $0003,  $0000   ; 631A   0000 0003 0003 0000
        DECLE   $0002,  $0004,  $0008,  $0010   ; 631E   0002 0004 0008 0010
        DECLE   $0000,  $00C0,  $00C0,  $0080   ; 6322   0000 00C0 00C0 0080
        DECLE   $0040,  $0020,  $0010,  $0000   ; 6326   0040 0020 0010 0000
        DECLE   $0007,  $0007,  $0006,  $0001   ; 632A   0007 0007 0006 0001
        DECLE   $0002,  $0004,  $0008,  $0000   ; 632E   0002 0004 0008 0000
        DECLE   $00E0,  $00E0,  $0060,  $0080   ; 6332   00E0 00E0 0060 0080
        DECLE   $0040,  $0020,  $0000           ; 6336   0040 0020 0000

        INCR    R7                              ; 6339   000F
        INCR    R7                              ; 633A   000F

L_633B:
        INCR    R4                              ; 633B   000C
L_633C:
        INCR    R5                              ; 633C   000D
        DECLE   $0001,  $0002,  $0004,  $0000   ; 633D   0001 0002 0004 0000
        DECLE   $00F0,  $00F0,  $0030,  $00B0   ; 6341   00F0 00F0 0030 00B0
        DECLE   $0080,  $0040,  $0000,  $001F   ; 6345   0080 0040 0000 001F
        DECLE   $001F,  $0018,  $001A,  $0019   ; 6349   001F 0018 001A 0019
        DECLE   $0001,  $0002,  $0000,  $00F8   ; 634D   0001 0002 0000 00F8
        DECLE   $00F8,  $0018,  $0058,  $0098   ; 6351   00F8 0018 0058 0098
        DECLE   $0080,  $0000,  $003F,  $003F   ; 6355   0080 0000 003F 003F
        DECLE   $0030,  $0034,  $0032,  $0031   ; 6359   0030 0034 0032 0031
        DECLE   $0001,  $0000,  $00FC,  $00FC   ; 635D   0001 0000 00FC 00FC
        DECLE   $000C,  $002C,  $004C,  $008C   ; 6361   000C 002C 004C 008C
        DECLE   $0000,  $007F,  $007F,  $0060   ; 6365   0000 007F 007F 0060
        DECLE   $0068,  $0064,  $0062,  $0061   ; 6369   0068 0064 0062 0061
        DECLE   $0000,  $00FE,  $00FE,  $0006   ; 636D   0000 00FE 00FE 0006
        DECLE   $0016,  $0026,  $0046,  $0086   ; 6371   0016 0026 0046 0086
        DECLE   $00FF,  $00FF,  $00C0,  $00D0   ; 6375   00FF 00FF 00C0 00D0
        DECLE   $00C8,  $00C4,  $00C2,  $00C0   ; 6379   00C8 00C4 00C2 00C0
        DECLE   $00FF,  $00FF,  $0003,  $000B   ; 637D   00FF 00FF 0003 000B
        DECLE   $0013,  $0023,  $0043,  $0003   ; 6381   0013 0023 0043 0003
        DECLE   $00FF,  $0080,  $00A0,  $0090   ; 6385   00FF 0080 00A0 0090
        DECLE   $0088,  $0084,  $0080,  $0081   ; 6389   0088 0084 0080 0081
        DECLE   $00FF,  $0001,  $0005,  $0009   ; 638D   00FF 0001 0005 0009
        DECLE   $0011,  $0021,  $0001,  $0081   ; 6391   0011 0021 0001 0081
        DECLE   $00C3,  $0210                   ; 6395   00C3 0210

        CMP@    R1,     R4                      ; 6397   034C
        ANDR    R4,     R6                      ; 6398   01A6
        MVI@    R4,     R7                      ; 6399   02A7

        ANDR    R6,     R1                      ; 639A   01B1
        ADDR    R0,     R0                      ; 639B   00C0
        ADD@    R2,     R2                      ; 639C   02D2
        SUBR    R3,     R0                      ; 639D   0118
        XORR    R2,     R4                      ; 639E   01D4
        MOVR    R7,     R1                      ; 639F   00B9
        CMPR    R7,     R2                      ; 63A0   017A
        SUB@    R4,     R0                      ; 63A1   0320
        MOVR    R7,     R1                      ; 63A2   00B9
        RLC     R3,     2                       ; 63A3   0057
        ADD@    R4,     R7                      ; 63A4   02E7

        DECLE   $005B,  $039D,  $0146,  $02A3   ; 63A5   005B 039D 0146 02A3
        DECLE   $018B,  $03D1,  $01FE,  $00AA   ; 63A9   018B 03D1 01FE 00AA
        DECLE   $01E7,  $00BF,  $016A,  $0261   ; 63AD   01E7 00BF 016A 0261
        DECLE   $02C4,  $0197,  $02BE,  $03CB   ; 63B1   02C4 0197 02BE 03CB
        DECLE   $0218                           ; 63B5   0218

        XOR@    R3,     R2                      ; 63B6   03DA
        ANDR    R0,     R6                      ; 63B7   0186
        SUBR    R0,     R6                      ; 63B8   0106
        ADDR    R1,     R7                      ; 63B9   00CF

        DECLE   $01DD,  $01F5,  $031A,  $00E6   ; 63BA   01DD 01F5 031A 00E6
        DECLE   $0123,  $018B,  $0346,  $02B3   ; 63BE   0123 018B 0346 02B3
        DECLE   $00A2,  $03E6,  $01E8,  $0162   ; 63C2   00A2 03E6 01E8 0162
        DECLE   $0314,  $027B,  $0179,  $03AF   ; 63C6   0314 027B 0179 03AF

        CMPR    R4,     R4                      ; 63CA   0164
        CMP@    R2,     R1                      ; 63CB   0351
        MVO@    R5,     R2                      ; 63CC   0255
        CMP@    R2,     R5                      ; 63CD   0355
        SUB@    R5,     R2                      ; 63CE   032A
        MOVR    R3,     R4                      ; 63CF   009C
        XORR    R2,     R6                      ; 63D0   01D6
        MVI@    R4,     R2                      ; 63D1   02A2
        AND@    R4,     R4                      ; 63D2   03A4
        SUB@    R3,     R4                      ; 63D3   031C
        SUBR    R5,     R1                      ; 63D4   0129
        ANDR    R3,     R5                      ; 63D5   019D
        ADDR    R1,     R2                      ; 63D6   00CA
        ANDR    R5,     R3                      ; 63D7   01AB
        SUBR    R2,     R1                      ; 63D8   0111
        AND@    R1,     R4                      ; 63D9   038C
        CMP@    R4,     R4                      ; 63DA   0364
        ADDI    #$00CF, R7                      ; 63DB   02FF 00CF

        DECLE   $02DE,  $02D5,  $0084,  $00E9   ; 63DD   02DE 02D5 0084 00E9
        DECLE   $02BF,  $01C7,  $0267,  $038A   ; 63E1   02BF 01C7 0267 038A
        DECLE   $00FA,  $018D,  $0263,  $0291   ; 63E5   00FA 018D 0263 0291
        DECLE   $00C5,  $03A2,  $0227,  $00D1   ; 63E9   00C5 03A2 0227 00D1
        DECLE   $0167,  $01D4,  $02B5,  $038A   ; 63ED   0167 01D4 02B5 038A
        DECLE   $023E                           ; 63F1   023E

        XORR    R3,     R2                      ; 63F2   01DA
        CMPR    R2,     R6                      ; 63F3   0156
        XOR@    R6,     R1                      ; 63F4   03F1
        MOVR    R4,     R7                      ; 63F5   00A7

        DECLE   $02DB,  $0018,  $03A3,  $01AE   ; 63F6   02DB 0018 03A3 01AE
        DECLE   $00D9,  $0183,  $036E,  $02B1   ; 63FA   00D9 0183 036E 02B1
        DECLE   $01B9,  $02BF,  $0346,  $031D   ; 63FE   01B9 02BF 0346 031D
        DECLE   $02B2,  $03FE,  $02D4,  $01D7   ; 6402   02B2 03FE 02D4 01D7
        DECLE   $01FF,  $0374,  $00AD,  $03CA   ; 6406   01FF 0374 00AD 03CA
        DECLE   $023F                           ; 640A   023F

        XORR    R3,     R6                      ; 640B   01DE
        ADDR    R2,     R7                      ; 640C   00D7

        DECLE   $003B,  $0264,  $004A,  $0013   ; 640D   003B 0264 004A 0013
        DECLE   $005A,  $0376,  $03C9,  $004E   ; 6411   005A 0376 03C9 004E
        DECLE   $0335,  $0213,  $03ED,  $012B   ; 6415   0335 0213 03ED 012B
        DECLE   $033A,  $02A6,  $0050,  $0399   ; 6419   033A 02A6 0050 0399
        DECLE   $02EB,  $012E,  $037B,  $019F   ; 641D   02EB 012E 037B 019F
        DECLE   $01A4,  $0331,  $01FE,  $00F2   ; 6421   01A4 0331 01FE 00F2
        DECLE   $0100,  $0119,  $034A,  $0267   ; 6425   0100 0119 034A 0267
        DECLE   $0217,  $013A,  $01AD,  $027B   ; 6429   0217 013A 01AD 027B
        DECLE   $0291,  $00C5,  $03A2,  $017E   ; 642D   0291 00C5 03A2 017E
        DECLE   $0155,  $01FB,  $0374,  $02C3   ; 6431   0155 01FB 0374 02C3
        DECLE   $039A,  $023F                   ; 6435   039A 023F

        ADD@    R3,     R2                      ; 6437   02DA
        SUBR    R2,     R6                      ; 6438   0116
        XOR@    R6,     R3                      ; 6439   03F3
        ADDR    R4,     R7                      ; 643A   00E7

        DECLE   $035B,  $039A,  $016A,  $006B   ; 643B   035B 039A 016A 006B
        DECLE   $037D,  $022C,  $03E2,  $01CF   ; 643F   037D 022C 03E2 01CF
        DECLE   $026E,  $0235                   ; 6443   026E 0235

        XOR@    R2,     R6                      ; 6445   03D6
        SUBR    R2,     R7                      ; 6446   0117

        DECLE   $03F3,  $0347,  $037A,  $01A2   ; 6447   03F3 0347 037A 01A2
        DECLE   $02F6,  $03A8,  $017A,  $0353   ; 644B   02F6 03A8 017A 0353
        DECLE   $005E,  $02F5,  $012E,  $03EE   ; 644F   005E 02F5 012E 03EE
        DECLE   $0293,  $021F,  $0125,  $03FE   ; 6453   0293 021F 0125 03FE
        DECLE   $0070,  $0000                   ; 6457   0070 0000
L_6459:
        PSHR    R5                              ; 6459   0275
        MVII    #$018F, R4                      ; 645A   02BC 018F
        MVII    #$0197, R5                      ; 645C   02BD 0197
L_645E:
        MVI@    R4,     R0                      ; 645E   02A0
        SWAP    R0,     1                       ; 645F   0040
        SAR     R0,     2                       ; 6460   006C
        SAR     R0,     2                       ; 6461   006C
        MOVR    R4,     R3                      ; 6462   00A3
        SDBD                                    ; 6463   0001
        ADD@    R4,     R0                      ; 6464   02E0
        MVO@    R0,     R3                      ; 6465   0258
        SWAP    R0,     1                       ; 6466   0040
        MOVR    R0,     R2                      ; 6467   0082
        INCR    R3                              ; 6468   000B
        SUB@    R3,     R0                      ; 6469   0318
        MOVR    R2,     R1                      ; 646A   0091
        ANDI    #$0007, R1                      ; 646B   03B9 0007
        MVO@    R1,     R3                      ; 646D   0259
        XORR    R1,     R2                      ; 646E   01CA
        MVO@    R2,     R5                      ; 646F   026A
        INCR    R5                              ; 6470   000D
        MVO@    R2,     R5                      ; 6471   026A
        ADDI    #$0003, R5                      ; 6472   02FD 0003
        SUBR    R0,     R2                      ; 6474   0102
        MVO@    R2,     R5                      ; 6475   026A
        INCR    R5                              ; 6476   000D
        MVO@    R2,     R5                      ; 6477   026A
        SUBI    #$0006, R5                      ; 6478   033D 0006
        CMPI    #$019D, R5                      ; 647A   037D 019D
        BNEQ    L_645E                          ; 647C   022C 001F

        MVII    #$0003, R5                      ; 647E   02BD 0003
        MVO     R5,     G_01A3                  ; 6480   0245 01A3
        MVII    #$0100, R5                      ; 6482   02BD 0100
        MVI@    R5,     R0                      ; 6484   02A8
        MVO@    R0,     R4                      ; 6485   0260
        MVI@    R5,     R0                      ; 6486   02A8
        MVO@    R0,     R4                      ; 6487   0260
        MVII    #$009C, R0                      ; 6488   02B8 009C
        MVII    #$0064, R1                      ; 648A   02B9 0064
        MVO     R0,     .ISRVEC.0               ; 648C   0240 0100
        MVO     R1,     .ISRVEC.1               ; 648E   0241 0101
L_6490:
        EIS                                     ; 6490   0002
        MVI     G_01A3, R2                      ; 6491   0282 01A3
        SARC    R2,     2                       ; 6493   007E
        BC      L_6490                          ; 6494   0221 0005
        BNOV    L_649B                          ; 6496   020A 0003

        JSR     R5,     L_6605                  ; 6498   0004 0164 0205

L_649B:
        PULR    R7                              ; 649B   02B7

        PSHR    R5                              ; 649C   0275

        JSR     R5,     L_6560                  ; 649D   0004 0164 0160

        MVI     G_0191, R0                      ; 64A0   0280 0191
        MVO     R0,     .STIC.HDLY              ; 64A2   0240 0030
        MVI     G_0194, R0                      ; 64A4   0280 0194
        MVO     R0,     .STIC.VDLY              ; 64A6   0240 0031

        JSR     R5,     L_64C3                  ; 64A8   0004 0164 00C3

        CLRR    R2                              ; 64AB   01D2
L_64AC:
        SUBI    #$0008, R2                      ; 64AC   033A 0008

        JSR     R5,     L_64CF                  ; 64AE   0004 0164 00CF
        JSR     R5,     L_6502                  ; 64B1   0004 0164 0102

        TSTR    R2                              ; 64B4   0092
        BMI     L_64BB                          ; 64B5   020B 0004

        MVII    #$0002, R0                      ; 64B7   02B8 0002
        B       L_64BB                          ; 64B9   0200 0000

L_64BB:
        SLL     R2,     2                       ; 64BB   004E
        XORR    R0,     R2                      ; 64BC   01C2
        MVO     R2,     G_01A3                  ; 64BD   0242 01A3

        JSR     R5,     X_PLAY_NOTE             ; 64BF   0004 0118 02BD

        PULR    R7                              ; 64C2   02B7

L_64C3:
        PSHR    R5                              ; 64C3   0275
        MVO     R0,     .STIC.VIDEN             ; 64C4   0240 0020
        MVI     G_0195, R0                      ; 64C6   0280 0195
        MVI     G_0196, R1                      ; 64C8   0281 0196
        MVO     R0,     .ISRVEC.0               ; 64CA   0240 0100
        MVO     R1,     .ISRVEC.1               ; 64CC   0241 0101
        PULR    R7                              ; 64CE   02B7

L_64CF:
        PSHR    R5                              ; 64CF   0275
        MVI     G_0197, R0                      ; 64D0   0280 0197
        SWAP    R0,     2                       ; 64D2   0044
        BEQ     L_6501                          ; 64D3   0204 002C
        BPL     L_64EB                          ; 64D5   0203 0014

        MVII    #$0200, R5                      ; 64D7   02BD 0200
        MVII    #$0201, R4                      ; 64D9   02BC 0201
        CLRR    R2                              ; 64DB   01D2
L_64DC:
        MVII    #$0013, R3                      ; 64DC   02BB 0013
L_64DE:
        MVI@    R4,     R0                      ; 64DE   02A0
        MVO@    R0,     R5                      ; 64DF   0268
        DECR    R3                              ; 64E0   0013
        BNEQ    L_64DE                          ; 64E1   022C 0004

        MVO@    R2,     R5                      ; 64E3   026A
        INCR    R4                              ; 64E4   000C
        CMPI    #$02E6, R4                      ; 64E5   037C 02E6
        BLT     L_64DC                          ; 64E7   0225 000C
        B       L_6501                          ; 64E9   0200 0016

L_64EB:
        MVII    #$0212, R5                      ; 64EB   02BD 0212
        MVII    #$0003, R1                      ; 64ED   02B9 0003
        CLRR    R2                              ; 64EF   01D2
L_64F0:
        MVII    #$0013, R3                      ; 64F0   02BB 0013
L_64F2:
        MVI@    R5,     R0                      ; 64F2   02A8
        MVO@    R0,     R5                      ; 64F3   0268
        SUBR    R1,     R5                      ; 64F4   010D
        DECR    R3                              ; 64F5   0013
        BNEQ    L_64F2                          ; 64F6   022C 0005

        INCR    R5                              ; 64F8   000D
        MVO@    R2,     R5                      ; 64F9   026A
        ADDI    #$0025, R5                      ; 64FA   02FD 0025
        CMPI    #$02F0, R5                      ; 64FC   037D 02F0
        BLT     L_64F0                          ; 64FE   0225 000F

        INCR    R2                              ; 6500   000A
L_6501:
        PULR    R7                              ; 6501   02B7

L_6502:
        PSHR    R5                              ; 6502   0275
        MVI     G_019A, R0                      ; 6503   0280 019A
        SWAP    R0,     2                       ; 6505   0044
        BEQ     L_655F                          ; 6506   0204 0057
        BMI     L_6553                          ; 6508   020B 0049

        MVII    #$02DC, R5                      ; 650A   02BD 02DC
        MVII    #$0214, R4                      ; 650C   02BC 0214
        MVII    #$0200, R2                      ; 650E   02BA 0200
        MVII    #$0014, R1                      ; 6510   02B9 0014
        MVII    #$000A, R0                      ; 6512   02B8 000A
L_6514:
        PSHR    R0                              ; 6514   0270
        MVII    #$0004, R3                      ; 6515   02BB 0004
L_6517:
        MVI@    R4,     R0                      ; 6517   02A0
        MVO@    R0,     R5                      ; 6518   0268
        MVI@    R4,     R0                      ; 6519   02A0
        MVO@    R0,     R5                      ; 651A   0268
        MVI@    R4,     R0                      ; 651B   02A0
        MVO@    R0,     R5                      ; 651C   0268
        MVI@    R4,     R0                      ; 651D   02A0
        MVO@    R0,     R5                      ; 651E   0268
        MVI@    R4,     R0                      ; 651F   02A0
        MVO@    R0,     R5                      ; 6520   0268
        DECR    R3                              ; 6521   0013
        BNEQ    L_6517                          ; 6522   022C 000C

        SUBR    R1,     R4                      ; 6524   010C
        SUBR    R1,     R5                      ; 6525   010D
        XORR    R2,     R5                      ; 6526   01D5
        XORR    R5,     R2                      ; 6527   01EA
        XORR    R2,     R5                      ; 6528   01D5
        MVII    #$0004, R3                      ; 6529   02BB 0004
L_652B:
        MVI@    R5,     R0                      ; 652B   02A8
        MVO@    R0,     R4                      ; 652C   0260
        MVI@    R5,     R0                      ; 652D   02A8
        MVO@    R0,     R4                      ; 652E   0260
        MVI@    R5,     R0                      ; 652F   02A8
        MVO@    R0,     R4                      ; 6530   0260
        MVI@    R5,     R0                      ; 6531   02A8
        MVO@    R0,     R4                      ; 6532   0260
        MVI@    R5,     R0                      ; 6533   02A8
        MVO@    R0,     R4                      ; 6534   0260
        DECR    R3                              ; 6535   0013
        BNEQ    L_652B                          ; 6536   022C 000C

        SUBR    R1,     R5                      ; 6538   010D
        PULR    R0                              ; 6539   02B0
        DECR    R0                              ; 653A   0010
        BNEQ    L_6514                          ; 653B   022C 0028

        XORR    R2,     R5                      ; 653D   01D5
        XORR    R5,     R2                      ; 653E   01EA
        XORR    R2,     R5                      ; 653F   01D5
        MVII    #$0004, R3                      ; 6540   02BB 0004
L_6542:
        MVI@    R5,     R0                      ; 6542   02A8
        MVO@    R0,     R4                      ; 6543   0260
        MVI@    R5,     R0                      ; 6544   02A8
        MVO@    R0,     R4                      ; 6545   0260
        MVI@    R5,     R0                      ; 6546   02A8
        MVO@    R0,     R4                      ; 6547   0260
        MVI@    R5,     R0                      ; 6548   02A8
        MVO@    R0,     R4                      ; 6549   0260
        MVI@    R5,     R0                      ; 654A   02A8
        MVO@    R0,     R4                      ; 654B   0260
        DECR    R3                              ; 654C   0013
        BNEQ    L_6542                          ; 654D   022C 000C

        MVII    #$0003, R2                      ; 654F   02BA 0003
        B       L_655F                          ; 6551   0200 000C

L_6553:
        MVII    #$0200, R5                      ; 6553   02BD 0200
        MVII    #$0214, R4                      ; 6555   02BC 0214
L_6557:
        MVI@    R4,     R0                      ; 6557   02A0
        MVO@    R0,     R5                      ; 6558   0268
        CMPI    #$02DC, R5                      ; 6559   037D 02DC
        BNEQ    L_6557                          ; 655B   022C 0005

        MVII    #$0002, R2                      ; 655D   02BA 0002
L_655F:
        PULR    R7                              ; 655F   02B7

L_6560:
        PSHR    R5                              ; 6560   0275
        MVII    #$031D, R2                      ; 6561   02BA 031D
        CLRR    R3                              ; 6563   01DB
L_6564:
        MVII    #$019D, R5                      ; 6564   02BD 019D
        MVI@    R2,     R0                      ; 6566   0290
        SLL     R0,     1                       ; 6567   0048
        BPL     L_656C                          ; 6568   0203 0002

        MVII    #$0197, R5                      ; 656A   02BD 0197
L_656C:
        ADDI    #$0002, R2                      ; 656C   02FA 0002
        MVI@    R3,     R0                      ; 656E   0298
        MOVR    R0,     R1                      ; 656F   0081
        ANDI    #$00FF, R1                      ; 6570   03B9 00FF
        XORR    R1,     R0                      ; 6572   01C8
        ADD@    R5,     R1                      ; 6573   02E9
        ANDI    #$00FF, R1                      ; 6574   03B9 00FF
        XORR    R1,     R0                      ; 6576   01C8
        MVO@    R0,     R3                      ; 6577   0258
        MVI@    R2,     R0                      ; 6578   0290
        SDBD                                    ; 6579   0001
        ADD@    R5,     R0                      ; 657A   02E8
        MVO@    R0,     R2                      ; 657B   0250
        INCR    R2                              ; 657C   000A
        XORI    #$0008, R3                      ; 657D   03FB 0008
        MVI@    R3,     R0                      ; 657F   0298
        MOVR    R0,     R1                      ; 6580   0081
        ANDI    #$007F, R1                      ; 6581   03B9 007F
        XORR    R1,     R0                      ; 6583   01C8
        ADD@    R5,     R1                      ; 6584   02E9
        ANDI    #$007F, R1                      ; 6585   03B9 007F
        XORR    R1,     R0                      ; 6587   01C8
        MVO@    R0,     R3                      ; 6588   0258
        XORI    #$0008, R3                      ; 6589   03FB 0008
        MVI@    R2,     R0                      ; 658B   0290
        SDBD                                    ; 658C   0001
        ADD@    R5,     R0                      ; 658D   02E8
        MVO@    R0,     R2                      ; 658E   0250
        ADDI    #$0005, R2                      ; 658F   02FA 0005
        INCR    R3                              ; 6591   000B
        CMPI    #$0008, R3                      ; 6592   037B 0008
        BNEQ    L_6564                          ; 6594   022C 0031
        PULR    R7                              ; 6596   02B7

L_6597:
        TSTR    R0                              ; 6597   0080
        BMI     L_6604                          ; 6598   020B 006A

        MVI     G_031F, R0                      ; 659A   0280 031F
        SWAP    R0,     1                       ; 659C   0040
        MVI     G_0320, R3                      ; 659D   0283 0320
        SWAP    R3,     1                       ; 659F   0043
        MVI     G_0181, R2                      ; 65A0   0282 0181
        MVI     G_0180, R1                      ; 65A2   0281 0180
        MOVR    R4,     R7                      ; 65A4   00A7

        JSR     R4,     L_6597                  ; 65A5   0004 0064 0197

        TSTR    R2                              ; 65A8   0092
        BEQ     L_6604                          ; 65A9   0204 0059

        SUBI    #$0002, R2                      ; 65AB   033A 0002
        BPL     L_65B0                          ; 65AD   0203 0001

        CLRR    R2                              ; 65AF   01D2
L_65B0:
        MOVR    R2,     R4                      ; 65B0   0094
        NEGR    R2                              ; 65B1   0022
        INCR    R1                              ; 65B2   0009
        ADDR    R7,     R1                      ; 65B3   00F9
        ADD@    R1,     R7                      ; 65B4   02CF

        DECLE   $0015,  $001E,  $002D,  $0036   ; 65B5   0015 001E 002D 0036

        JSR     R4,     L_6597                  ; 65B9   0004 0064 0197

        CMPI    #$0064, R2                      ; 65BC   037A 0064
        BGE     L_6604                          ; 65BE   020D 0044

        INCR    R2                              ; 65C0   000A
        INCR    R2                              ; 65C1   000A
        MOVR    R2,     R4                      ; 65C2   0094
        INCR    R1                              ; 65C3   0009
        ADDR    R7,     R1                      ; 65C4   00F9
        ADD@    R1,     R7                      ; 65C5   02CF

        DECLE   $000D,  $0004                   ; 65C6   000D 0004

        NEGR    R5                              ; 65C8   0025
        COMR    R4                              ; 65C9   001C
        MOVR    R2,     R3                      ; 65CA   0093
        CMPI    #$0018, R0                      ; 65CB   0378 0018
        BLT     L_65FA                          ; 65CD   0205 002B

        SUBI    #$0003, R0                      ; 65CF   0338 0003
        B       L_65DB                          ; 65D1   0200 0008

        MOVR    R2,     R3                      ; 65D3   0093
        NEGR    R2                              ; 65D4   0022
        CMPI    #$0078, R0                      ; 65D5   0378 0078
        BGT     L_65FA                          ; 65D7   020E 0021

        ADDI    #$0003, R0                      ; 65D9   02F8 0003
L_65DB:
        SWAP    R0,     1                       ; 65DB   0040
        MVO     R0,     G_031F                  ; 65DC   0240 031F
L_65DE:
        MVO     R2,     G_018F                  ; 65DE   0242 018F
        B       L_65F8                          ; 65E0   0200 0016

        MOVR    R2,     R0                      ; 65E2   0090
        CMPI    #$001D, R3                      ; 65E3   037B 001D
        BLT     L_6600                          ; 65E5   0205 0019

        SUBI    #$0003, R3                      ; 65E7   033B 0003
        B       L_65F3                          ; 65E9   0200 0008

        MOVR    R2,     R0                      ; 65EB   0090
        NEGR    R2                              ; 65EC   0022
        CMPI    #$003D, R3                      ; 65ED   037B 003D
        BGT     L_6600                          ; 65EF   020E 000F

        ADDI    #$0003, R3                      ; 65F1   02FB 0003
L_65F3:
        SWAP    R3,     1                       ; 65F3   0043
        MVO     R3,     G_0320                  ; 65F4   0243 0320
L_65F6:
        MVO     R2,     G_0192                  ; 65F6   0242 0192
L_65F8:
        MVO     R4,     G_0181                  ; 65F8   0244 0181
L_65FA:
        SUBI    #$0002, R3                      ; 65FA   033B 0002
        BEQ     L_65DE                          ; 65FC   0224 001F
        B       L_6604                          ; 65FE   0200 0004

L_6600:
        SUBI    #$0002, R0                      ; 6600   0338 0002
        BEQ     L_65F6                          ; 6602   0224 000D
L_6604:
        MOVR    R5,     R7                      ; 6604   00AF

L_6605:
        PSHR    R5                              ; 6605   0275
        SLL     R2,     1                       ; 6606   004A
        ADDR    R2,     R7                      ; 6607   00D7
        B       L_66E6                          ; 6608   0200 00DC
        B       L_66AE                          ; 660A   0200 00A2
        B       L_6687                          ; 660C   0200 0079

        CLRR    R3                              ; 660E   01DB
L_660F:
        MVII    #$0200, R4                      ; 660F   02BC 0200

L_6611:
        JSR     R5,     L_674F                  ; 6611   0004 0164 034F

        MVO@    R0,     R4                      ; 6614   0260
        CMPI    #$0214, R4                      ; 6615   037C 0214
        BNEQ    L_6611                          ; 6617   022C 0007

        MVI     G_0161, R1                      ; 6619   0281 0161
        SWAP    R1,     1                       ; 661B   0041
        SWAP    R1,     1                       ; 661C   0041
        BMI     L_6636                          ; 661D   020B 0017

        MVI     G_0162, R0                      ; 661F   0280 0162
        CMPI    #$00FA, R0                      ; 6621   0378 00FA
        BNEQ    L_6629                          ; 6623   020C 0004

        SDBD                                    ; 6625   0001
        XORI    #$0B00, R0                      ; 6626   03F8 0000 000B
L_6629:
        SDBD                                    ; 6629   0001
        XORI    #$0900, R0                      ; 662A   03F8 0000 0009
        ADDI    #$0200, R1                      ; 662D   02F9 0200
        MVO@    R0,     R1                      ; 662F   0248
        MVI     G_015E, R0                      ; 6630   0280 015E
        CMPI    #$00EC, R0                      ; 6632   0378 00EC
        BEQ     L_6644                          ; 6634   0204 000E

L_6636:
        TSTR    R3                              ; 6636   009B
        BNEQ    L_6643                          ; 6637   020C 000A

        ADDI    #$0014, R0                      ; 6639   02F8 0014
        CMPI    #$00F0, R0                      ; 663B   0378 00F0
        BNEQ    L_6641                          ; 663D   020C 0002

        MVII    #$00EC, R0                      ; 663F   02B8 00EC
L_6641:
        MVO     R0,     G_015E                  ; 6641   0240 015E
L_6643:
        PULR    R7                              ; 6643   02B7

L_6644:
        CLRR    R1                              ; 6644   01C9
        MVI     G_015D, R0                      ; 6645   0280 015D
        DECR    R0                              ; 6647   0010
L_6648:
        MVO     R0,     G_015D                  ; 6648   0240 015D
        MOVR    R1,     R3                      ; 664A   008B
        MOVR    R1,     R2                      ; 664B   008A
        ADDI    #$0214, R2                      ; 664C   02FA 0214
        RRC     R0,     1                       ; 664E   0070
        MVII    #$0046, R0                      ; 664F   02B8 0046
        BC      L_6655                          ; 6651   0201 0002

        ADDI    #$0010, R0                      ; 6653   02F8 0010
L_6655:
        MVO     R0,     G_015F                  ; 6655   0240 015F
        SDBD                                    ; 6657   0001
        XORI    #$0900, R0                      ; 6658   03F8 0000 0009
        MVO     R1,     G_015E                  ; 665B   0241 015E
        ADDI    #$0200, R1                      ; 665D   02F9 0200
L_665F:
        MVO@    R0,     R1                      ; 665F   0248
        INCR    R1                              ; 6660   0009
        CMPR    R2,     R1                      ; 6661   0151
        BNEQ    L_665F                          ; 6662   022C 0004

        MVI     G_0161, R1                      ; 6664   0281 0161
        ADDI    #$0200, R1                      ; 6666   02F9 0200
        ADDR    R3,     R1                      ; 6668   00D9
        MVI@    R1,     R0                      ; 6669   0288
        SDBD                                    ; 666A   0001
        ANDI    #$76FF, R0                      ; 666B   03B8 00FF 0076
        CMP     G_015F, R0                      ; 666E   0340 015F
        BNEQ    L_6643                          ; 6670   022C 002E

        SDBD                                    ; 6672   0001
        MVII    #$486F, R0                      ; 6673   02B8 006F 0048
        MVO@    R0,     R1                      ; 6676   0248
        MVI     G_015D, R0                      ; 6677   0280 015D
        DECR    R0                              ; 6679   0010
        BEQ     L_6686                          ; 667A   0204 000A

        DECR    R0                              ; 667C   0010
        BEQ     L_6686                          ; 667D   0204 0007

        MVI     G_0164, R0                      ; 667F   0280 0164
        MVO     R0,     G_0162                  ; 6681   0240 0162
        CLRR    R0                              ; 6683   01C0
        MVO     R0,     G_0182                  ; 6684   0240 0182
L_6686:
        PULR    R7                              ; 6686   02B7

L_6687:
        MVII    #$02DC, R4                      ; 6687   02BC 02DC

L_6689:
        JSR     R5,     L_674F                  ; 6689   0004 0164 034F

        MVO@    R0,     R4                      ; 668C   0260
        CMPI    #$02F0, R4                      ; 668D   037C 02F0
        BNEQ    L_6689                          ; 668F   022C 0007

        MVI     G_0161, R1                      ; 6691   0281 0161
        ADDI    #$02DC, R1                      ; 6693   02F9 02DC
        MVI     G_0162, R0                      ; 6695   0280 0162
        SDBD                                    ; 6697   0001
        XORI    #$0900, R0                      ; 6698   03F8 0000 0009
        MVO@    R0,     R1                      ; 669B   0248
        MVI     G_015E, R0                      ; 669C   0280 015E
        CMPI    #$00EC, R0                      ; 669E   0378 00EC
        BEQ     L_66A7                          ; 66A0   0204 0005

        SUBI    #$0014, R0                      ; 66A2   0338 0014
        MVO     R0,     G_015E                  ; 66A4   0240 015E
        PULR    R7                              ; 66A6   02B7

L_66A7:
        MVII    #$00DC, R1                      ; 66A7   02B9 00DC
        MVI     G_015D, R0                      ; 66A9   0280 015D
        INCR    R0                              ; 66AB   0008
        B       L_6648                          ; 66AC   0220 0065

L_66AE:
        MVII    #$0200, R1                      ; 66AE   02B9 0200

L_66B0:
        JSR     R5,     L_6744                  ; 66B0   0004 0164 0344

        MVO@    R0,     R1                      ; 66B3   0248
        ADDI    #$0014, R1                      ; 66B4   02F9 0014
        CMPI    #$02F0, R1                      ; 66B6   0379 02F0
        BNEQ    L_66B0                          ; 66B8   022C 0009

        MVI     G_015E, R1                      ; 66BA   0281 015E
        ADDI    #$0200, R1                      ; 66BC   02F9 0200
        MVI     G_015F, R0                      ; 66BE   0280 015F
        SDBD                                    ; 66C0   0001
        XORI    #$0900, R0                      ; 66C1   03F8 0000 0009
        MVO@    R0,     R1                      ; 66C4   0248
        MVI     G_0161, R0                      ; 66C5   0280 0161
        SWAP    R0,     1                       ; 66C7   0040
        SWAP    R0,     1                       ; 66C8   0040
        BMI     L_66D5                          ; 66C9   020B 000A

        INCR    R0                              ; 66CB   0008
        CMPI    #$0015, R0                      ; 66CC   0378 0015
        BNEQ    L_66D2                          ; 66CE   020C 0002

        CLRR    R0                              ; 66D0   01C0
        DECR    R0                              ; 66D1   0010
L_66D2:
        MVO     R0,     G_0161                  ; 66D2   0240 0161
        PULR    R7                              ; 66D4   02B7

L_66D5:
        CLRR    R1                              ; 66D5   01C9
        MVI     G_0167, R0                      ; 66D6   0280 0167
        DECR    R0                              ; 66D8   0010
        BEQ     L_66E1                          ; 66D9   0204 0006
        BPL     L_671E                          ; 66DB   0203 0041

        MVII    #$0005, R0                      ; 66DD   02B8 0005
        B       L_671E                          ; 66DF   0200 003D

L_66E1:
        MVI     G_0166, R2                      ; 66E1   0282 0166
        DECR    R2                              ; 66E3   0012
        B       L_6713                          ; 66E4   0200 002D

L_66E6:
        MVII    #$0213, R1                      ; 66E6   02B9 0213

L_66E8:
        JSR     R5,     L_6744                  ; 66E8   0004 0164 0344

        MVO@    R0,     R1                      ; 66EB   0248
        ADDI    #$0014, R1                      ; 66EC   02F9 0014
        CMPI    #$0303, R1                      ; 66EE   0379 0303
        BNEQ    L_66E8                          ; 66F0   022C 0009

        MVI     G_015E, R1                      ; 66F2   0281 015E
        ADDI    #$0213, R1                      ; 66F4   02F9 0213
        MVI     G_015F, R0                      ; 66F6   0280 015F
        SDBD                                    ; 66F8   0001
        XORI    #$0900, R0                      ; 66F9   03F8 0000 0009
        MVO@    R0,     R1                      ; 66FC   0248
        MVI     G_0161, R0                      ; 66FD   0280 0161
        SWAP    R0,     1                       ; 66FF   0040
        SWAP    R0,     1                       ; 6700   0040
        BMI     L_6707                          ; 6701   020B 0004

        DECR    R0                              ; 6703   0010
        MVO     R0,     G_0161                  ; 6704   0240 0161
        PULR    R7                              ; 6706   02B7

L_6707:
        MVII    #$0013, R1                      ; 6707   02B9 0013
        MVI     G_0167, R0                      ; 6709   0280 0167
        INCR    R0                              ; 670B   0008
        CMPI    #$0006, R0                      ; 670C   0378 0006
        BNEQ    L_671E                          ; 670E   020C 000E

        MVI     G_0166, R2                      ; 6710   0282 0166
        INCR    R2                              ; 6712   000A
L_6713:
        ANDI    #$0007, R2                      ; 6713   03BA 0007
        MVO     R2,     G_0166                  ; 6715   0242 0166
        MVO     R2,     G_01BA                  ; 6717   0242 01BA
        MVII    #$0001, R2                      ; 6719   02BA 0001
        MVO     R2,     G_0163                  ; 671B   0242 0163
        CLRR    R0                              ; 671D   01C0
L_671E:
        MVO     R0,     G_0167                  ; 671E   0240 0167
        CMPI    #$0003, R0                      ; 6720   0378 0003
        BNEQ    L_6726                          ; 6722   020C 0002

        MVO     R0,     G_0163                  ; 6724   0240 0163
L_6726:
        PSHR    R1                              ; 6726   0271

        JSR     R5,     L_6786                  ; 6727   0004 0164 0386

        PULR    R3                              ; 672A   02B3
        MVI     G_015E, R1                      ; 672B   0281 015E
        ADDI    #$0200, R1                      ; 672D   02F9 0200
        ADDR    R3,     R1                      ; 672F   00D9
        MVI     G_015F, R0                      ; 6730   0280 015F
        SDBD                                    ; 6732   0001
        XORI    #$0900, R0                      ; 6733   03F8 0000 0009
        MVI     G_0163, R2                      ; 6736   0282 0163
        TSTR    R2                              ; 6738   0092
        BNEQ    L_673F                          ; 6739   020C 0004

        SDBD                                    ; 673B   0001
        MVII    #$486F, R0                      ; 673C   02B8 006F 0048
L_673F:
        MVO@    R0,     R1                      ; 673F   0248
        CLRR    R0                              ; 6740   01C0
        MVO     R0,     G_0163                  ; 6741   0240 0163
        PULR    R7                              ; 6743   02B7

L_6744:
        PSHR    R5                              ; 6744   0275
        MVI     G_0186, R0                      ; 6745   0280 0186

        JSR     R5,     X_RAND2                 ; 6747   0004 0114 029E

        TSTR    R0                              ; 674A   0080
        BEQ     L_6769                          ; 674B   0204 001C
        B       L_6750                          ; 674D   0200 0001

L_674F:
        PSHR    R5                              ; 674F   0275
L_6750:
        MVI     G_0187, R0                      ; 6750   0280 0187
        CMPI    #$0064, R0                      ; 6752   0378 0064
        BPL     L_6775                          ; 6754   0203 001F

        JSR     R5,     X_RAND2                 ; 6756   0004 0114 029E

        TSTR    R0                              ; 6759   0080
        BNEQ    L_6761                          ; 675A   020C 0005

        SDBD                                    ; 675C   0001
        MVII    #$C981, R0                      ; 675D   02B8 0081 00C9
        PULR    R7                              ; 6760   02B7

L_6761:
        DECR    R0                              ; 6761   0010
        BNEQ    L_6775                          ; 6762   020C 0011

        SDBD                                    ; 6764   0001
        MVII    #$C989, R0                      ; 6765   02B8 0089 00C9
        PULR    R7                              ; 6768   02B7

L_6769:
        MVI     G_015E, R0                      ; 6769   0280 015E
        ADDI    #$01FF, R0                      ; 676B   02F8 01FF
        CMPR    R0,     R1                      ; 676D   0141
        BLT     L_677C                          ; 676E   0205 000C

        ADDI    #$0028, R0                      ; 6770   02F8 0028
        CMPR    R0,     R1                      ; 6772   0141
        BGT     L_6781                          ; 6773   020E 000C

L_6775:
        MVI     G_0164, R0                      ; 6775   0280 0164
        SDBD                                    ; 6777   0001
        XORI    #$0900, R0                      ; 6778   03F8 0000 0009
        PULR    R7                              ; 677B   02B7

L_677C:
        SDBD                                    ; 677C   0001
        MVII    #$888A, R0                      ; 677D   02B8 008A 0088
        PULR    R7                              ; 6780   02B7

L_6781:
        SDBD                                    ; 6781   0001
        MVII    #$885A, R0                      ; 6782   02B8 005A 0088
        PULR    R7                              ; 6785   02B7

L_6786:
        PSHR    R5                              ; 6786   0275
        MVO     R1,     G_0161                  ; 6787   0241 0161
        MOVR    R1,     R2                      ; 6789   008A
        ADDI    #$02F0, R2                      ; 678A   02FA 02F0
        MVI     G_0163, R3                      ; 678C   0283 0163
        TSTR    R3                              ; 678E   009B
        BEQ     L_67A0                          ; 678F   0204 000F

        DECR    R3                              ; 6791   0013
        BNEQ    L_67D1                          ; 6792   020C 003D

        MVII    #$0001, R0                      ; 6794   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 6796   0004 0114 02E6

        XORR    R3,     R6                      ; 6799   01DE
        SDBD                                    ; 679A   0001
        MVII    #$0BFA, R0                      ; 679B   02B8 00FA 000B
        B       L_67C2                          ; 679E   0200 0022

L_67A0:
        MVI     G_01A5, R0                      ; 67A0   0280 01A5
        XORI    #$0001, R0                      ; 67A2   03F8 0001
        MVO     R0,     G_01A5                  ; 67A4   0240 01A5
        BEQ     L_67AC                          ; 67A6   0204 0004

        MVII    #$005E, R0                      ; 67A8   02B8 005E
        B       L_67AE                          ; 67AA   0200 0002

L_67AC:
        MVII    #$004E, R0                      ; 67AC   02B8 004E
L_67AE:
        MVI     G_015D, R4                      ; 67AE   0284 015D
        TSTR    R4                              ; 67B0   00A4
        BNEQ    L_67B7                          ; 67B1   020C 0004

        ADD     G_015E, R1                      ; 67B3   02C1 015E
        B       L_67C2                          ; 67B5   0200 000B

L_67B7:
        DECR    R4                              ; 67B7   0014
        BEQ     L_67C2                          ; 67B8   0204 0008

        DECR    R4                              ; 67BA   0014
        BEQ     L_67C2                          ; 67BB   0204 0005

        MVII    #$0214, R2                      ; 67BD   02BA 0214
        ADDR    R1,     R2                      ; 67BF   00CA
        ADD     G_015E, R2                      ; 67C0   02C2 015E
L_67C2:
        MVO     R0,     G_0162                  ; 67C2   0240 0162
        SDBD                                    ; 67C4   0001
        XORI    #$0900, R0                      ; 67C5   03F8 0000 0009
        ADDI    #$0200, R1                      ; 67C8   02F9 0200
L_67CA:
        MVO@    R0,     R1                      ; 67CA   0248
        ADDI    #$0014, R1                      ; 67CB   02F9 0014
        CMPR    R2,     R1                      ; 67CD   0151
        BNEQ    L_67CA                          ; 67CE   022C 0005
        PULR    R7                              ; 67D0   02B7

L_67D1:
        MVII    #$000A, R0                      ; 67D1   02B8 000A
        PSHR    R1                              ; 67D3   0271
        MVI     G_0166, R3                      ; 67D4   0283 0166
        TSTR    R3                              ; 67D6   009B
        BNEQ    L_67E8                          ; 67D7   020C 000F

        MVI     G_01A4, R1                      ; 67D9   0281 01A4
        TSTR    R1                              ; 67DB   0089
        BEQ     L_67E8                          ; 67DC   0204 000A

        CLRR    R1                              ; 67DE   01C9
        MVO     R1,     G_01A4                  ; 67DF   0241 01A4
        SDBD                                    ; 67E1   0001
        MVII    #$516C, R1                      ; 67E2   02B9 006C 0051

        JSR     R5,     .EXEC.A5E               ; 67E5   0004 0118 025E

L_67E8:
        CMP     G_016F, R3                      ; 67E8   0343 016F
        BNEQ    L_67FA                          ; 67EA   020C 000E

        MVI     G_0323, R1                      ; 67EC   0281 0323
        TSTR    R1                              ; 67EE   0089
        BNEQ    L_67FA                          ; 67EF   020C 0009

        SDBD                                    ; 67F1   0001
        MVII    #$56DC, R1                      ; 67F2   02B9 00DC 0056
        MVO     R3,     G_01A4                  ; 67F5   0243 01A4

        JSR     R5,     .EXEC.A5E               ; 67F7   0004 0118 025E

L_67FA:
        MVII    #$004F, R0                      ; 67FA   02B8 004F
        PULR    R1                              ; 67FC   02B1
        B       L_67C2                          ; 67FD   0220 003C

L_67FF:
        PSHR    R5                              ; 67FF   0275
        MVII    #$0315, R1                      ; 6800   02B9 0315
L_6802:
        ADDI    #$0008, R1                      ; 6802   02F9 0008
        CMPI    #$0355, R1                      ; 6804   0379 0355
        BEQ     L_6826                          ; 6806   0204 001E

        JSR     R5,     .EXEC.760               ; 6808   0004 0114 0360

        BEQ     L_6802                          ; 680B   0224 000A

        MVII    #$0054, R2                      ; 680D   02BA 0054
        SWAP    R2,     1                       ; 680F   0042
        ADDI    #$0034, R2                      ; 6810   02FA 0034
        SDBD                                    ; 6812   0001
        MVII    #$5434, R4                      ; 6813   02BC 0034 0054

        JSR     R5,     .EXEC.6F7               ; 6816   0004 0114 02F7

        BC      L_6802                          ; 6819   0221 0018

        CLRR    R0                              ; 681B   01C0
        MVO@    R0,     R1                      ; 681C   0248
        CMPI    #$0325, R1                      ; 681D   0379 0325
        BEQ     L_6802                          ; 681F   0224 001E

        INCR    R1                              ; 6821   0009
        MVO@    R0,     R1                      ; 6822   0248
        DECR    R1                              ; 6823   0011
        B       L_6802                          ; 6824   0220 0023
L_6826:
        PULR    R7                              ; 6826   02B7

L_6827:
        MVI@    R5,     R0                      ; 6827   02A8
        ANDI    #$007F, R0                      ; 6828   03B8 007F
        BNEQ    L_682F                          ; 682A   020C 0003

        CLRR    R0                              ; 682C   01C0
        MVO@    R0,     R4                      ; 682D   0260
        MOVR    R5,     R7                      ; 682E   00AF

L_682F:
        SUBI    #$0020, R0                      ; 682F   0338 0020
        SUBI    #$0010, R0                      ; 6831   0338 0010
L_6833:
        SLL     R0,     2                       ; 6833   004C
        SLL     R0,     1                       ; 6834   0048
        XORR    R3,     R0                      ; 6835   01D8
L_6836:
        SDBD                                    ; 6836   0001
        XORI    #$0800, R0                      ; 6837   03F8 0000 0008
        MVO@    R0,     R4                      ; 683A   0260
        MVII    #$02FD, R1                      ; 683B   02B9 02FD
        MVO@    R1,     R4                      ; 683D   0261
        DECR    R4                              ; 683E   0014
        TSTR    R2                              ; 683F   0092
        BNEQ    L_6827                          ; 6840   022C 001A

        MVII    #$003E, R0                      ; 6842   02B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 6844   0240 01F8
        MVII    #$0006, R0                      ; 6846   02B8 0006
        SWAP    R0,     1                       ; 6848   0040
L_6849:
        DECR    R0                              ; 6849   0010
        BNEQ    L_6849                          ; 684A   022C 0002

        MVII    #$003F, R0                      ; 684C   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 684E   0240 01F8
        MVII    #$000F, R0                      ; 6850   02B8 000F
        SWAP    R0,     1                       ; 6852   0040
L_6853:
        DECR    R0                              ; 6853   0010
        BNEQ    L_6853                          ; 6854   022C 0002
        B       L_6827                          ; 6856   0220 0030

L_6858:
        PSHR    R5                              ; 6858   0275
        CLRR    R0                              ; 6859   01C0
        MVO     R0,     G_016A                  ; 685A   0240 016A
        DIS                                     ; 685C   0003
        MVI     .ISRVEC.0,R0                    ; 685D   0280 0100
        MVO     R0,     G_0168                  ; 685F   0240 0168
        MVI     .ISRVEC.1,R0                    ; 6861   0280 0101
        MVO     R0,     G_0169                  ; 6863   0240 0169
        MVII    #$0074, R0                      ; 6865   02B8 0074
        MVO     R0,     .ISRVEC.0               ; 6867   0240 0100
        MVII    #$0068, R0                      ; 6869   02B8 0068
        MVO     R0,     .ISRVEC.1               ; 686B   0240 0101
L_686D:
        EIS                                     ; 686D   0002
        MVI     G_016A, R0                      ; 686E   0280 016A
        TSTR    R0                              ; 6870   0080
        BEQ     L_686D                          ; 6871   0224 0005
        PULR    R7                              ; 6873   02B7

        PSHR    R5                              ; 6874   0275
        CLRR    R0                              ; 6875   01C0
        SWAP    R1,     2                       ; 6876   0045
        BPL     L_687A                          ; 6877   0203 0001
        INCR    R7                              ; 6879   000F

L_687A:
        INCR    R0                              ; 687A   0008
L_687B:
        MVO     R0,     G_01A6                  ; 687B   0240 01A6
        ANDI    #$000F, R1                      ; 687D   03B9 000F
        MOVR    R1,     R0                      ; 687F   0088
        ANDI    #$0007, R1                      ; 6880   03B9 0007
        CMPR    R0,     R1                      ; 6882   0141
        BNEQ    L_6A07                          ; 6883   020C 0182

        INCR    R1                              ; 6885   0009
        ADDR    R7,     R1                      ; 6886   00F9
        ADD@    R1,     R7                      ; 6887   02CF

        CLRC                                    ; 6888   0006
        RLC     R0,     1                       ; 6889   0050
        MOVR    R3,     R2                      ; 688A   009A
        MOVR    R4,     R7                      ; 688B   00A7

        CMPR    R6,     R3                      ; 688C   0173
        CMPR    R7,     R1                      ; 688D   0179

        JSR     R5,     X_STOP_SFX              ; 688E   0004 011C 02B4

        MVII    #$0080, R1                      ; 6891   02B9 0080
        MVO     R1,     G_0128                  ; 6893   0241 0128
        MVO     R1,     G_012A                  ; 6895   0241 012A
        MVO     R1,     G_012C                  ; 6897   0241 012C
        CLRR    R1                              ; 6899   01C9
        MVO     R1,     G_018F                  ; 689A   0241 018F
        MVO     R1,     G_0192                  ; 689C   0241 0192
        MVO     R1,     G_0191                  ; 689E   0241 0191
        MVO     R1,     G_0194                  ; 68A0   0241 0194
        MVO     R1,     G_01DE                  ; 68A2   0241 01DE
        MVO     R1,     G_01DF                  ; 68A4   0241 01DF
        MVO     R1,     G_0146                  ; 68A6   0241 0146
        MVO     R1,     .STIC.HDLY              ; 68A8   0241 0030
        MVO     R1,     .STIC.VDLY              ; 68AA   0241 0031
        MVO     R1,     G_0102                  ; 68AC   0241 0102
        MVO     R1,     G_0112                  ; 68AE   0241 0112
        MVO     R1,     G_0113                  ; 68B0   0241 0113
        MVII    #$0040, R0                      ; 68B2   02B8 0040
        MVII    #$031D, R4                      ; 68B4   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 68B6   0004 0114 0338

        MVII    #$0018, R0                      ; 68B9   02B8 0018
        CLRR    R4                              ; 68BB   01E4

        JSR     R5,     X_FILL_ZERO             ; 68BC   0004 0114 0338

        MVII    #$0001, R1                      ; 68BF   02B9 0001
        MVO     R1,     G_0148                  ; 68C1   0241 0148
        MVII    #$0003, R0                      ; 68C3   02B8 0003
        MVO     R0,     .STIC.EDGE              ; 68C5   0240 0032
        SDBD                                    ; 68C7   0001
        MVII    #$5253, R5                      ; 68C8   02BD 0053 0052
        CLRR    R0                              ; 68CB   01C0
        MVI     G_016D, R1                      ; 68CC   0281 016D
        TSTR    R1                              ; 68CE   0089
        BNEQ    L_68D2                          ; 68CF   020C 0001

        INCR    R0                              ; 68D1   0008
L_68D2:
        MVO     R0,     .STIC.BORD              ; 68D2   0240 002C
        MVO     R0,     G_0106                  ; 68D4   0240 0106
        B       L_6A14                          ; 68D6   0200 013C

        MVII    #$002E, R5                      ; 68D8   02BD 002E
        ADDR    R7,     R5                      ; 68DA   00FD
        MVI     G_017F, R2                      ; 68DB   0282 017F
        INCR    R2                              ; 68DD   000A
        ANDI    #$0003, R2                      ; 68DE   03BA 0003
        MVO     R2,     G_017F                  ; 68E0   0242 017F
        MVII    #$0001, R3                      ; 68E2   02BB 0001
        SDBD                                    ; 68E4   0001
        MVII    #$3940, R4                      ; 68E5   02BC 0040 0039
L_68E8:
        ADD@    R5,     R2                      ; 68E8   02EA
        ADDR    R7,     R2                      ; 68E9   00FA
        MVI@    R2,     R0                      ; 68EA   0290
        INCR    R2                              ; 68EB   000A
        CLRR    R1                              ; 68EC   01C9
        MVO@    R1,     R4                      ; 68ED   0261
        MVO@    R1,     R4                      ; 68EE   0261
        MVI@    R2,     R1                      ; 68EF   0291
        MVO@    R0,     R4                      ; 68F0   0260
        MVO@    R1,     R4                      ; 68F1   0261
        MVO@    R1,     R4                      ; 68F2   0261
        MVO@    R0,     R4                      ; 68F3   0260
        CLRR    R1                              ; 68F4   01C9
        MVO@    R1,     R4                      ; 68F5   0261
        MVO@    R1,     R4                      ; 68F6   0261
        ADD@    R5,     R2                      ; 68F7   02EA
        MVII    #$0008, R1                      ; 68F8   02B9 0008
L_68FA:
        MVI@    R2,     R0                      ; 68FA   0290
        MVO@    R0,     R4                      ; 68FB   0260
        ADDR    R3,     R2                      ; 68FC   00DA
        DECR    R1                              ; 68FD   0011
        BNEQ    L_68FA                          ; 68FE   022C 0005

        MVI     G_017F, R2                      ; 6900   0282 017F
        NEGR    R3                              ; 6902   0023
        BMI     L_68E8                          ; 6903   022B 001C

        MVO     R0,     .STIC.VIDEN             ; 6905   0240 0020
        B       L_6A1E                          ; 6907   0200 0115

        DECLE   $0023,  $0008,  $0027           ; 6909   0023 0008 0027

        INCR    R4                              ; 690C   000C
        ADDR    R5,     R6                      ; 690D   00EE
        ADDR    R3,     R5                      ; 690E   00DD
        MOVR    R7,     R3                      ; 690F   00BB
        RRC     R3,     2                       ; 6910   0077
        ADDR    R5,     R6                      ; 6911   00EE
        RRC     R3,     2                       ; 6912   0077
        MOVR    R7,     R3                      ; 6913   00BB
        ADDR    R3,     R5                      ; 6914   00DD
        ADDR    R5,     R6                      ; 6915   00EE
        RSWD    R4                              ; 6916   003C
        RSWD    R4                              ; 6917   003C
        NEGR    R4                              ; 6918   0024
        COMR    R0                              ; 6919   0018
        RSWD    R4                              ; 691A   003C
        RSWD    R4                              ; 691B   003C
        NEGR    R4                              ; 691C   0024
        COMR    R0                              ; 691D   0018
        RSWD    R4                              ; 691E   003C
        RSWD    R4                              ; 691F   003C
        NEGR    R4                              ; 6920   0024
        COMR    R0                              ; 6921   0018
        SDBD                                    ; 6922   0001
        MVII    #$5266, R5                      ; 6923   02BD 0066 0052
        MVII    #$0001, R0                      ; 6926   02B8 0001
        MVO     R0,     .STIC.BORD              ; 6928   0240 002C
        MVO     R0,     .STIC.EDGE              ; 692A   0240 0032
        CLRR    R0                              ; 692C   01C0
        B       L_6A14                          ; 692D   0200 00E5

        MVI     G_017F, R3                      ; 692F   0283 017F
        ADDI    #$0008, R3                      ; 6931   02FB 0008
        ANDI    #$0038, R3                      ; 6933   03BB 0038
        MVO     R3,     G_017F                  ; 6935   0243 017F
        SAR     R3,     2                       ; 6937   006F
        SAR     R3,     1                       ; 6938   006B
        SDBD                                    ; 6939   0001
        MVII    #$3940, R4                      ; 693A   02BC 0040 0039
        MVII    #$00A3, R5                      ; 693D   02BD 00A3
        ADDR    R7,     R5                      ; 693F   00FD
        ADDR    R3,     R5                      ; 6940   00DD
        MVII    #$0008, R2                      ; 6941   02BA 0008
        MOVR    R2,     R1                      ; 6943   0091
L_6944:
        MVI@    R5,     R0                      ; 6944   02A8
        MVO@    R0,     R4                      ; 6945   0260
        DECR    R1                              ; 6946   0011
        BNEQ    L_6944                          ; 6947   022C 0004

        MVII    #$009D, R5                      ; 6949   02BD 009D
        ADDR    R7,     R5                      ; 694B   00FD
        SUBR    R3,     R5                      ; 694C   011D
        MOVR    R2,     R1                      ; 694D   0091
L_694E:
        MVI@    R5,     R0                      ; 694E   02A8
        MVO@    R0,     R4                      ; 694F   0260
        DECR    R1                              ; 6950   0011
        BNEQ    L_694E                          ; 6951   022C 0004

        MVII    #$009D, R5                      ; 6953   02BD 009D
        ADDR    R7,     R5                      ; 6955   00FD
        ADDR    R3,     R5                      ; 6956   00DD
        MVI@    R5,     R0                      ; 6957   02A8
        MOVR    R2,     R1                      ; 6958   0091
L_6959:
        MVO@    R0,     R4                      ; 6959   0260
        DECR    R1                              ; 695A   0011
        BNEQ    L_6959                          ; 695B   022C 0003

        MVII    #$0099, R5                      ; 695D   02BD 0099
        ADDR    R7,     R5                      ; 695F   00FD
        SUBR    R3,     R5                      ; 6960   011D
        MVI@    R5,     R0                      ; 6961   02A8
        MOVR    R2,     R1                      ; 6962   0091
L_6963:
        MVO@    R0,     R4                      ; 6963   0260
        DECR    R1                              ; 6964   0011
        BNEQ    L_6963                          ; 6965   022C 0003

        SDBD                                    ; 6967   0001
        MVII    #$6315, R5                      ; 6968   02BD 0015 0063
        SLL     R2,     1                       ; 696B   004A
        MOVR    R2,     R1                      ; 696C   0091
        SLL     R3,     2                       ; 696D   004F
        SLL     R3,     2                       ; 696E   004F
        ADDR    R3,     R5                      ; 696F   00DD
L_6970:
        MVI@    R5,     R0                      ; 6970   02A8
        MVO@    R0,     R4                      ; 6971   0260
        DECR    R1                              ; 6972   0011
        BNEQ    L_6970                          ; 6973   022C 0004

        MOVR    R5,     R1                      ; 6975   00A9
L_6976:
        DECR    R1                              ; 6976   0011
        MVI@    R1,     R0                      ; 6977   0288
        MVO@    R0,     R4                      ; 6978   0260
        DECR    R2                              ; 6979   0012
        BNEQ    L_6976                          ; 697A   022C 0005

        MVI     G_0182, R0                      ; 697C   0280 0182
        TSTR    R0                              ; 697E   0080
        BNEQ    L_6997                          ; 697F   020C 0016

        MVII    #$0002, R0                      ; 6981   02B8 0002
        MVO     R0,     .STIC.BORD              ; 6983   0240 002C
        MVO     R0,     G_0106                  ; 6985   0240 0106
        MVII    #$03B2, R0                      ; 6987   02B8 03B2
        MVO     R0,     .BTAB.05                ; 6989   0240 0205
        MVII    #$03BA, R0                      ; 698B   02B8 03BA
        MVO     R0,     .BTAB.0E                ; 698D   0240 020E
        MVII    #$03A2, R0                      ; 698F   02B8 03A2
        MVO     R0,     .BTAB.E1                ; 6991   0240 02E1
        MVII    #$03AA, R0                      ; 6993   02B8 03AA
        MVO     R0,     .BTAB.EA                ; 6995   0240 02EA
L_6997:
        MVO     R0,     .STIC.VIDEN             ; 6997   0240 0020
        MVI     G_017F, R1                      ; 6999   0281 017F
        SLR     R1,     2                       ; 699B   0065
        SLR     R1,     2                       ; 699C   0065
        INCR    R1                              ; 699D   0009
        ANDI    #$0003, R1                      ; 699E   03B9 0003
        PSHR    R1                              ; 69A0   0271
        MOVR    R1,     R5                      ; 69A1   008D
        SLL     R1,     2                       ; 69A2   004D
        SLL     R1,     1                       ; 69A3   0049
        MOVR    R1,     R4                      ; 69A4   008C
        ANDI    #$0008, R4                      ; 69A5   03BC 0008
        SDBD                                    ; 69A7   0001
        MVII    #$0525, R2                      ; 69A8   02BA 0025 0005
        XORR    R4,     R2                      ; 69AB   01E2
        MOVR    R2,     R0                      ; 69AC   0090
        MOVR    R2,     R1                      ; 69AD   0091
        XORI    #$0008, R2                      ; 69AE   03FA 0008
        MOVR    R2,     R3                      ; 69B0   0093
        ANDI    #$0002, R5                      ; 69B1   03BD 0002
        BNEQ    L_69B9                          ; 69B3   020C 0004

        CLRR    R0                              ; 69B5   01C0
        CLRR    R3                              ; 69B6   01DB
        B       L_69BB                          ; 69B7   0200 0002

L_69B9:
        CLRR    R2                              ; 69B9   01D2
        CLRR    R1                              ; 69BA   01C9
L_69BB:
        MVII    #$0200, R4                      ; 69BB   02BC 0200
L_69BD:
        MVO@    R0,     R4                      ; 69BD   0260
        MVO@    R1,     R4                      ; 69BE   0261
        MVO@    R0,     R4                      ; 69BF   0260
        MVO@    R1,     R4                      ; 69C0   0261
        ADDI    #$000C, R4                      ; 69C1   02FC 000C
        MVO@    R2,     R4                      ; 69C3   0262
        MVO@    R3,     R4                      ; 69C4   0263
        MVO@    R2,     R4                      ; 69C5   0262
        MVO@    R3,     R4                      ; 69C6   0263
        CMPI    #$02F0, R4                      ; 69C7   037C 02F0
        BLT     L_69BD                          ; 69C9   0225 000D

        PULR    R0                              ; 69CB   02B0
        SLL     R0,     1                       ; 69CC   0048
        SLL     R0,     2                       ; 69CD   004C
        SDBD                                    ; 69CE   0001
        ADDI    #$08A5, R0                      ; 69CF   02F8 00A5 0008
        MVII    #$026D, R4                      ; 69D2   02BC 026D
        MVO@    R0,     R4                      ; 69D4   0260
        ADDI    #$0020, R0                      ; 69D5   02F8 0020
        MVO@    R0,     R4                      ; 69D7   0260
        ADDI    #$0012, R4                      ; 69D8   02FC 0012
        ADDI    #$0020, R0                      ; 69DA   02F8 0020
        MVO@    R0,     R4                      ; 69DC   0260
        ADDI    #$0020, R0                      ; 69DD   02F8 0020
        MVO@    R0,     R4                      ; 69DF   0260
        B       L_6A1E                          ; 69E0   0200 003C

        DECLE   $00FF,  $0000,  $0000,  $0000   ; 69E2   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 69E6   0000 0000 0000 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 69EA   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 69EE   0000 0000 0000 00FF

        MOVR    R0,     R1                      ; 69F2   0081
        ADDR    R0,     R0                      ; 69F3   00C0
        SLR     R0,     1                       ; 69F4   0060
        GSWD    R0                              ; 69F5   0030
        COMR    R0                              ; 69F6   0018
        INCR    R4                              ; 69F7   000C
        CLRC                                    ; 69F8   0006
        DIS                                     ; 69F9   0003
        MOVR    R0,     R1                      ; 69FA   0081
        MVII    #$0001, R0                      ; 69FB   02B8 0001
        MVO     R0,     .STIC.EDGE              ; 69FD   0240 0032
        B       L_6A33                          ; 69FF   0200 0032

        MVII    #$0003, R0                      ; 6A01   02B8 0003
        MVO     R0,     .STIC.EDGE              ; 6A03   0240 0032
        B       L_6A33                          ; 6A05   0200 002C

L_6A07:
        MOVR    R7,     R4                      ; 6A07   00BC
        ADDI    #$001B, R4                      ; 6A08   02FC 001B
        SLL     R1,     1                       ; 6A0A   0049
        ADDR    R1,     R4                      ; 6A0B   00CC
        MVI@    R4,     R0                      ; 6A0C   02A0
        MVI@    R4,     R1                      ; 6A0D   02A1
        SDBD                                    ; 6A0E   0001
        MVII    #$5266, R5                      ; 6A0F   02BD 0066 0052
        MVO     R1,     G_0164                  ; 6A12   0241 0164
L_6A14:
        MVO     R0,     .STIC.CS.0              ; 6A14   0240 0028
        MVI     G_01A6, R0                      ; 6A16   0280 01A6
        TSTR    R0                              ; 6A18   0080
        BEQ     L_6A33                          ; 6A19   0204 0018

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6A1B   0004 001E 0335
L_6A1E:
        JSR     R5,     L_6A39                  ; 6A1E   0004 0168 0239

        PULR    R5                              ; 6A21   02B5
        J       X_PLAY_NOTE                     ; 6A22   0004 0318 02BD

        DECLE   $0000,  $0022,  $0004,  $0026   ; 6A25   0000 0022 0004 0026
        DECLE   $0000,  $0025,  $000F,  $0027   ; 6A29   0000 0025 000F 0027
        DECLE   $0000,  $0027,  $0004,  $0025   ; 6A2D   0000 0027 0004 0025
        DECLE   $0000                           ; 6A31   0000

        NEGR    R6                              ; 6A32   0026

L_6A33:
        JSR     R5,     L_6A39                  ; 6A33   0004 0168 0239

        PULR    R5                              ; 6A36   02B5
        SDBD                                    ; 6A37   0001
        MVI@    R4,     R7                      ; 6A38   02A7

L_6A39:
        MVII    #$0001, R3                      ; 6A39   02BB 0001
        MVO     R3,     G_016A                  ; 6A3B   0243 016A
        MVI     G_0168, R0                      ; 6A3D   0280 0168
        MVI     G_0169, R3                      ; 6A3F   0283 0169
        MVO     R0,     .ISRVEC.0               ; 6A41   0240 0100
        MVO     R3,     .ISRVEC.1               ; 6A43   0243 0101
        MVII    #$0168, R4                      ; 6A45   02BC 0168
        MOVR    R5,     R7                      ; 6A47   00AF

L_6A48:
        PSHR    R5                              ; 6A48   0275

        JSR     R5,     .EXEC.777               ; 6A49   0004 0114 0377

        SUBI    #$0005, R2                      ; 6A4C   033A 0005
        SLR     R2,     2                       ; 6A4E   0066
        SLR     R2,     1                       ; 6A4F   0062
        SUBI    #$0005, R3                      ; 6A50   033B 0005
        SLR     R3,     2                       ; 6A52   0067
        SLR     R3,     1                       ; 6A53   0063
        SLL     R3,     2                       ; 6A54   004F
        PSHR    R3                              ; 6A55   0273
        SLL     R3,     2                       ; 6A56   004F
        ADD@    R6,     R3                      ; 6A57   02F3
        ADDR    R2,     R3                      ; 6A58   00D3
        PULR    R7                              ; 6A59   02B7

L_6A5A:
        PSHR    R5                              ; 6A5A   0275
        MVII    #$0014, R2                      ; 6A5B   02BA 0014

        JSR     R5,     X_DIV                   ; 6A5D   0004 011C 01FB

        INCR    R0                              ; 6A60   0008
        SLL     R0,     2                       ; 6A61   004C
        SLL     R0,     1                       ; 6A62   0048
        INCR    R1                              ; 6A63   0009
        SLL     R1,     2                       ; 6A64   004D
        SLL     R1,     1                       ; 6A65   0049
        PSHR    R0                              ; 6A66   0270
        MOVR    R1,     R0                      ; 6A67   0088
        PULR    R1                              ; 6A68   02B1
        PULR    R7                              ; 6A69   02B7

L_6A6A:
        PSHR    R5                              ; 6A6A   0275
        MVII    #$0009, R1                      ; 6A6B   02B9 0009
        SUB     G_016E, R1                      ; 6A6D   0301 016E
        SLR     R1,     1                       ; 6A6F   0061

        JSR     R5,     X_MPY                   ; 6A70   0004 011C 01DC

        MOVR    R2,     R0                      ; 6A73   0090
        INCR    R7                              ; 6A74   000F

L_6A75:
        PSHR    R5                              ; 6A75   0275
L_6A76:
        MVI     G_0106, R1                      ; 6A76   0281 0106
        CMPI    #$0002, R1                      ; 6A78   0379 0002
        BNEQ    L_6A7D                          ; 6A7A   020C 0001

        SLL     R0,     1                       ; 6A7C   0048
L_6A7D:
        ADD     G_0318, R0                      ; 6A7D   02C0 0318
        MVI     G_0317, R1                      ; 6A7F   0281 0317
L_6A81:
        SDBD                                    ; 6A81   0001
        CMPI    #$2710, R0                      ; 6A82   0378 0010 0027
        BMI     L_6A8E                          ; 6A85   020B 0007

        SDBD                                    ; 6A87   0001
        SUBI    #$2710, R0                      ; 6A88   0338 0010 0027
        INCR    R1                              ; 6A8B   0009
        B       L_6A81                          ; 6A8C   0220 000C

L_6A8E:
        MVO     R0,     G_0318                  ; 6A8E   0240 0318
        MVO     R1,     G_0317                  ; 6A90   0241 0317
        PULR    R7                              ; 6A92   02B7

L_6A93:
        ADDR    R2,     R3                      ; 6A93   00D3
L_6A94:
        MVO@    R0,     R1                      ; 6A94   0248
        ADDR    R2,     R1                      ; 6A95   00D1
        CMPR    R3,     R1                      ; 6A96   0159
        BNEQ    L_6A94                          ; 6A97   022C 0004
        MOVR    R5,     R7                      ; 6A99   00AF

L_6A9A:
        PSHR    R5                              ; 6A9A   0275
        MVI     G_0317, R0                      ; 6A9B   0280 0317
        MVII    #$0004, R1                      ; 6A9D   02B9 0004
        SDBD                                    ; 6A9F   0001
        MVII    #$0885, R3                      ; 6AA0   02BB 0085 0008

        JSR     R5,     X_PRNUM_ZRO             ; 6AA3   0004 0118 00AD

        MVI     G_0318, R0                      ; 6AA6   0280 0318
        ADDI    #$0004, R4                      ; 6AA8   02FC 0004

        JSR     R5,     X_PRNUM_ZRO             ; 6AAA   0004 0118 00AD

        PULR    R7                              ; 6AAD   02B7

L_6AAE:
        PSHR    R5                              ; 6AAE   0275
        MVII    #$0200, R4                      ; 6AAF   02BC 0200
        MVII    #$00F0, R0                      ; 6AB1   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 6AB3   0004 0114 0338

        PULR    R7                              ; 6AB6   02B7

L_6AB7:
        PSHR    R5                              ; 6AB7   0275
        MVII    #$000A, R1                      ; 6AB8   02B9 000A
        SWAP    R1,     1                       ; 6ABA   0041
L_6ABB:
        DECR    R1                              ; 6ABB   0011
        MVII    #$0002, R0                      ; 6ABC   02B8 0002
        MVO     R0,     .PSG0.chn_a_hi          ; 6ABE   0240 01F4
        MVII    #$003E, R0                      ; 6AC0   02B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 6AC2   0240 01F8
        MVII    #$000B, R0                      ; 6AC4   02B8 000B
        MVO     R0,     .PSG0.chn_a_vol         ; 6AC6   0240 01FB
        BNEQ    L_6ABB                          ; 6AC8   022C 000E

        MVII    #$003F, R0                      ; 6ACA   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6ACC   0240 01F8
        MVII    #$0036, R0                      ; 6ACE   02B8 0036
        SWAP    R0,     1                       ; 6AD0   0040
L_6AD1:
        DECR    R0                              ; 6AD1   0010
        NOP                                     ; 6AD2   0034
        BNEQ    L_6AD1                          ; 6AD3   022C 0003
        PULR    R7                              ; 6AD5   02B7

L_6AD6:
        PSHR    R5                              ; 6AD6   0275

        JSR     R5,     L_6B23                  ; 6AD7   0004 0168 0323
        JSR     R5,     X_PLAY_SFX1             ; 6ADA   0004 0118 03BB
        DECLE   $0389                           ; 6ADD  SFX data
        DECLE   $0280,  $0200                   ; 6ADE  SFX data
        DECLE   $0062                           ; 6AE0  SFX data
        DECLE   $0258,  $0000                   ; 6AE1  SFX data
        DECLE   $004A                           ; 6AE3  SFX data
        DECLE   $0294,  $0200                   ; 6AE4  SFX data
        DECLE   $0026                           ; 6AE6  SFX data
        DECLE   $016B                           ; 6AE7  SFX data
        DECLE   $03F2                           ; 6AE8  SFX data
        DECLE   $016B                           ; 6AE9  SFX data
        DECLE   $03FA                           ; 6AEA  SFX data
        DECLE   $016B                           ; 6AEB  SFX data
        DECLE   $03F6                           ; 6AEC  SFX data
        DECLE   $016B                           ; 6AED  SFX data
        DECLE   $000E                           ; 6AEE  SFX data
        DECLE   $008F,  $0063                   ; 6AEF  SFX data
        DECLE   $0389                           ; 6AF1  SFX data
        DECLE   $0077,  $0015,  $006B           ; 6AF2  SFX data
        DECLE   $0275                           ; 6AF5  SFX data
        DECLE   $0280,  $016D                   ; 6AF6  SFX data
        DECLE   $0080,  $0204                   ; 6AF8  SFX data
        DECLE   $0036                           ; 6AFA  SFX data
        DECLE   $0004,  $0168                   ; 6AFB  SFX data
        DECLE   $0323,  $0004                   ; 6AFD  SFX data
        DECLE   $0118,  $03BE                   ; 6AFF  SFX data
        DECLE   $0026                           ; 6B01  SFX data
        DECLE   $02C9                           ; 6B02  SFX data
        DECLE   $010D                           ; 6B03  SFX data
        DECLE   $000F,  $0005                   ; 6B04  SFX data
        DECLE   $0380,  $0040                   ; 6B06  SFX data
        DECLE   $0388,  $0028                   ; 6B08  SFX data
        DECLE   $03E2                           ; 6B0A  SFX data
        DECLE   $03FA                           ; 6B0B  SFX data
        DECLE   $0011,  $00A2                   ; 6B0C  SFX data
        DECLE   $0031,  $008C                   ; 6B0E  SFX data
        DECLE   $03AB                           ; 6B10  SFX data
        DECLE   $0389                           ; 6B11  SFX data
        DECLE   $0077,  $0015,  $006B           ; 6B12  SFX data
UC_6B15:
        MVI     G_0106, R5                      ; 6B15  SLIB UCALL target
        TSTR    R5                              ; 6B17   00AD
        BNEQ    L_6B31                          ; 6B18   020C 0017

        MVII    #$0188, R5                      ; 6B1A   02BD 0188
        SDBD                                    ; 6B1C   0001
        MVI@    R5,     R4                      ; 6B1D   02AC
        MVII    #$001E, R0                      ; 6B1E   02B8 001E
        MVO     R0,     G_0146                  ; 6B20   0240 0146
        PULR    R7                              ; 6B22   02B7

L_6B23:
        PSHR    R5                              ; 6B23   0275
        MVI     G_0146, R0                      ; 6B24   0280 0146
        CMPI    #$001E, R0                      ; 6B26   0378 001E
        BNEQ    L_6B31                          ; 6B28   020C 0007

        MVI     G_035F, R0                      ; 6B2A   0280 035F
        MVO     R0,     G_0188                  ; 6B2C   0240 0188
        SWAP    R0,     1                       ; 6B2E   0040
        MVO     R0,     G_0189                  ; 6B2F   0240 0189
L_6B31:
        PULR    R7                              ; 6B31   02B7

L_6B32:
        PSHR    R5                              ; 6B32   0275

        JSR     R5,     L_6B23                  ; 6B33   0004 0168 0323
        JSR     R5,     X_PLAY_SFX2             ; 6B36   0004 0118 03BE
        DECLE   $0028                           ; 6B39  SFX prio

        ADCR    R7                              ; 6B3A   002F

        AND@    R1,     R1                      ; 6B3B   0389
L_6B3C:
        XOR     G_0064, R0                      ; 6B3C   03C0 0064
        XOR@    R1,     R0                      ; 6B3E   03C8
        SAR     R2,     2                       ; 6B3F   006E
        XOR     G_0078, R4                      ; 6B40   03C4 0078
        RLC     R1,     1                       ; 6B42   0051
        RLC     R3,     1                       ; 6B43   0053
        XOR@    R5,     R6                      ; 6B44   03EE
        MOVR    R1,     R7                      ; 6B45   008F

        COMR    R5                              ; 6B46   001D
        RRC     R3,     2                       ; 6B47   0077
        DECR    R5                              ; 6B48   0015
        SAR     R3,     1                       ; 6B49   006B
L_6B4A:
        PSHR    R5                              ; 6B4A   0275

        JSR     R5,     L_6B23                  ; 6B4B   0004 0168 0323
        JSR     R5,     X_PLAY_SFX2             ; 6B4E   0004 0118 03BE
        DECLE   $003C                           ; 6B51  SFX prio
        DECLE   $002F                           ; 6B52   002F

        CMPI    #$0035, R1                      ; 6B53   0379 0035
        SAR     R1,     2                       ; 6B55   006D
        AND     G_012B, R5                      ; 6B56   0385 012B
        ADDR    R5,     R5                      ; 6B58   00ED
        INCR    R7                              ; 6B59   000F

        EIS                                     ; 6B5A   0002
L_6B5B:
        XOR@    R4,     R2                      ; 6B5B   03E2
        AND@    R5,     R3                      ; 6B5C   03AB
        AND@    R1,     R1                      ; 6B5D   0389
        RRC     R3,     2                       ; 6B5E   0077
        DECR    R5                              ; 6B5F   0015
        SAR     R3,     1                       ; 6B60   006B
        ADD@    R1,     R7                      ; 6B61   02CF

L_6B62:
        PSHR    R5                              ; 6B62   0275

        JSR     R5,     X_PLAY_SFX1             ; 6B63   0004 0118 03BB
        DECLE   $002F                           ; 6B66  SFX data
        DECLE   $0389                           ; 6B67  SFX data
        DECLE   $0190,  $01DC                   ; 6B68  SFX data
        DECLE   $0198,  $0308                   ; 6B6A  SFX data
        DECLE   $01A4,  $0034                   ; 6B6C  SFX data
        DECLE   $0051,  $03E3                   ; 6B6E  SFX data
        DECLE   $001E                           ; 6B70  SFX data
        DECLE   $008F,  $003B                   ; 6B71  SFX data
        DECLE   $03B5                           ; 6B73  SFX data
        DECLE   $0001,  $03EB                   ; 6B74  SFX data
        DECLE   $008F,  $0045                   ; 6B76  SFX data
        DECLE   $0001,  $03F3                   ; 6B78  SFX data
        DECLE   $03FE                           ; 6B7A  SFX data
        DECLE   $008F,  $004A                   ; 6B7B  SFX data
        DECLE   $02CF                           ; 6B7D  SFX end

L_6B7E:
        PSHR    R5                              ; 6B7E   0275
        MVI     G_016D, R0                      ; 6B7F   0280 016D
        TSTR    R0                              ; 6B81   0080
        BEQ     L_6B31                          ; 6B82   0224 0052

        JSR     R5,     X_PLAY_SFX2             ; 6B84   0004 0118 03BE
        DECLE   $001C                           ; 6B87  SFX prio

        DECR    R3                              ; 6B88   0013
        CMPR    R0,     R4                      ; 6B89   0144
        SUBR    R5,     R7                      ; 6B8A   012F

        AND@    R1,     R1                      ; 6B8B   0389
        B       L_6EE0                          ; 6B8C   0200 0352

        DECLE   $0008,  $0000,  $0004,  $0000   ; 6B8E   0008 0000 0004 0000

        CLRR    R3                              ; 6B92   01DB
        SDBD                                    ; 6B93   0001
        ADD@    R2,     R4                      ; 6B94   02D4
        SWAP    R2,     1                       ; 6B95   0042
L_6B96:
        DECR    R7                              ; 6B96   0017

        DECLE   $0011,  $01C8,  $03B6,  $0001   ; 6B97   0011 01C8 03B6 0001
        DECLE   $03B0,  $0001,  $02AE,  $002A   ; 6B9B   03B0 0001 02AE 002A
        DECLE   $0057,  $0010,  $01C4,  $03E8   ; 6B9F   0057 0010 01C4 03E8
        DECLE   $0001,  $03FC,  $0001,  $03F6   ; 6BA3   0001 03FC 0001 03F6
        DECLE   $0001,  $039D,  $0012,  $001A   ; 6BA7   0001 039D 0012 001A
        DECLE   $0016,  $006B,  $000E,  $0083   ; 6BAB   0016 006B 000E 0083
        DECLE   $03CC,  $0001,  $03FF,  $008F   ; 6BAF   03CC 0001 03FF 008F
        DECLE   $0027                           ; 6BB3   0027

        ADD@    R1,     R7                      ; 6BB4   02CF

L_6BB5:
        PSHR    R5                              ; 6BB5   0275

        JSR     R5,     X_STOP_SFX              ; 6BB6   0004 011C 02B4

        CLRR    R0                              ; 6BB9   01C0
        MVO     R0,     G_0146                  ; 6BBA   0240 0146

        JSR     R5,     X_PLAY_SFX2             ; 6BBC   0004 0118 03BE
        DECLE   $001E                           ; 6BBF  SFX prio

        ADCR    R7                              ; 6BC0   002F

        SLLC    R1,     2                       ; 6BC1   005D
L_6BC2:
        AND@    R1,     R1                      ; 6BC2   0389
        DECLE   $0035,  $006B,  $001D,  $0000   ; 6BC3   0035 006B 001D 0000
        DECLE   $0000                           ; 6BC7   0000

        ADD@    R1,     R0                      ; 6BC8   02C8
        ADDI    #$0354, R2                      ; 6BC9   02FA 0354
        RRC     R1,     2                       ; 6BCB   0075
        MOVR    R1,     R7                      ; 6BCC   008F

        COMR    R1                              ; 6BCD   0019
        NEGR    R5                              ; 6BCE   0025
        DECR    R5                              ; 6BCF   0015
        SAR     R3,     1                       ; 6BD0   006B
        ADD@    R1,     R0                      ; 6BD1   02C8
        ADDI    #$0354, R2                      ; 6BD2   02FA 0354
        XORR    R6,     R4                      ; 6BD4   01F4
        MOVR    R1,     R7                      ; 6BD5   008F

        DECLE   $0019,  $0035,  $006B,  $0280   ; 6BD6   0019 0035 006B 0280
        DECLE   $012E,  $02C8,  $02FA,  $0354   ; 6BDA   012E 02C8 02FA 0354
        DECLE   $00B9,  $012B,  $0035,  $006B   ; 6BDE   00B9 012B 0035 006B
        DECLE   $0280,  $012E,  $02C8,  $02FA   ; 6BE2   0280 012E 02C8 02FA
        DECLE   $0354,  $00B9,  $012B,  $0035   ; 6BE6   0354 00B9 012B 0035
        DECLE   $006B,  $0000,  $0000,  $0008   ; 6BEA   006B 0000 0000 0008
        DECLE   $0000,  $0004,  $0000,  $02EB   ; 6BEE   0000 0004 0000 02EB
        DECLE   $0035,  $006B,  $0280,  $012E   ; 6BF2   0035 006B 0280 012E
        DECLE   $02C8,  $02FA,  $0354,  $01F4   ; 6BF6   02C8 02FA 0354 01F4
        DECLE   $02EB,  $0035,  $0043,  $0320   ; 6BFA   02EB 0035 0043 0320
        DECLE   $0340,  $012E,  $0008,  $0000   ; 6BFE   0340 012E 0008 0000

        CMP@    R2,     R4                      ; 6C02   0354
        RRC     R1,     2                       ; 6C03   0075
        MOVR    R1,     R7                      ; 6C04   008F

        COMR    R1                              ; 6C05   0019
        DECR    R5                              ; 6C06   0015
        SAR     R3,     1                       ; 6C07   006B
        CMP@    R2,     R4                      ; 6C08   0354
        XORR    R6,     R4                      ; 6C09   01F4
        MOVR    R1,     R7                      ; 6C0A   008F

        DECLE   $0019,  $0035,  $006B,  $0340   ; 6C0B   0019 0035 006B 0340
        DECLE   $00BE,  $0348,  $012E,  $0354   ; 6C0F   00BE 0348 012E 0354
        DECLE   $00B9,  $012B,  $0035,  $006B   ; 6C13   00B9 012B 0035 006B
        DECLE   $0340,  $00BE,  $0348,  $012E   ; 6C17   0340 00BE 0348 012E
        DECLE   $0354,  $00B9,  $012B,  $0015   ; 6C1B   0354 00B9 012B 0015
        DECLE   $006B,  $0004,  $0000,  $012B   ; 6C1F   006B 0004 0000 012B
        DECLE   $0005,  $0025,  $006B,  $0340   ; 6C23   0005 0025 006B 0340
        DECLE   $00BE,  $0348,  $012E,  $012B   ; 6C27   00BE 0348 012E 012B
        DECLE   $0035,  $006B,  $0340,  $00BE   ; 6C2B   0035 006B 0340 00BE
        DECLE   $0348,  $012E,  $0354,  $01F4   ; 6C2F   0348 012E 0354 01F4
        DECLE   $02EB,  $0035                   ; 6C33   02EB 0035

        SAR     R3,     1                       ; 6C35   006B
        CMP     .PSG1.chn_a_lo,R0               ; 6C36   0340 00F0
        CMP@    R1,     R0                      ; 6C38   0348
        SUBR    R5,     R6                      ; 6C39   012E
        CMP@    R2,     R4                      ; 6C3A   0354
        RRC     R1,     2                       ; 6C3B   0075
        MOVR    R1,     R7                      ; 6C3C   008F

        DECLE   $0019,  $0005                   ; 6C3D   0019 0005

        DECR    R5                              ; 6C3F   0015
        SAR     R3,     1                       ; 6C40   006B
        CMP     G_0097, R0                      ; 6C41   0340 0097
        CMP@    R2,     R4                      ; 6C43   0354
        XORR    R6,     R4                      ; 6C44   01F4
        MOVR    R1,     R7                      ; 6C45   008F

        DECLE   $0019,  $0005,  $0015,  $006B   ; 6C46   0019 0005 0015 006B
        DECLE   $0340,  $00BE,  $0354,  $00B9   ; 6C4A   0340 00BE 0354 00B9
        DECLE   $012B,  $0015,  $006B,  $0354   ; 6C4E   012B 0015 006B 0354
        DECLE   $00B9,  $012B,  $0015,  $006B   ; 6C52   00B9 012B 0015 006B
        DECLE   $0004,  $0000,  $02EB,  $0035   ; 6C56   0004 0000 02EB 0035
        DECLE   $006B,  $0340,  $0078,  $0008   ; 6C5A   006B 0340 0078 0008
        DECLE   $0000,  $0354,  $01F4,  $02EB   ; 6C5E   0000 0354 01F4 02EB
        DECLE   $0035,  $006B,  $0340,  $007F   ; 6C62   0035 006B 0340 007F
        DECLE   $0008,  $0000                   ; 6C66   0008 0000

        CMP@    R2,     R4                      ; 6C68   0354
        SUBR    R0,     R1                      ; 6C69   0101
        MOVR    R1,     R7                      ; 6C6A   008F

        DECLE   $0019,  $0005,  $0015,  $006B   ; 6C6B   0019 0005 0015 006B
        DECLE   $0340,  $008F,  $0344,  $0327   ; 6C6F   0340 008F 0344 0327
        DECLE   $02EB,  $0005                   ; 6C73   02EB 0005

        SAR     R3,     1                       ; 6C75   006B
        CMP     G_007F, R0                      ; 6C76   0340 007F
        ADD@    R5,     R3                      ; 6C78   02EB
        NEGR    R5                              ; 6C79   0025
        DECR    R5                              ; 6C7A   0015
        SAR     R3,     1                       ; 6C7B   006B
        CMP@    R1,     R0                      ; 6C7C   0348
        ADDR    R7,     R6                      ; 6C7D   00FE
        CMP@    R2,     R4                      ; 6C7E   0354
        XORR    R6,     R4                      ; 6C7F   01F4
        SUBR    R5,     R3                      ; 6C80   012B
        NEGR    R5                              ; 6C81   0025
        SAR     R3,     1                       ; 6C82   006B
        CMP@    R1,     R0                      ; 6C83   0348
        ADDR    R7,     R6                      ; 6C84   00FE
        ADD@    R5,     R3                      ; 6C85   02EB
        NEGR    R5                              ; 6C86   0025
        SAR     R3,     1                       ; 6C87   006B
        CMP@    R1,     R0                      ; 6C88   0348
        ADDR    R7,     R6                      ; 6C89   00FE
        SUBR    R5,     R3                      ; 6C8A   012B
        NEGR    R5                              ; 6C8B   0025
        DECR    R5                              ; 6C8C   0015
        SAR     R3,     1                       ; 6C8D   006B
        CMP@    R1,     R0                      ; 6C8E   0348
        ADDR    R7,     R6                      ; 6C8F   00FE
        CMP     G_0327, R4                      ; 6C90   0344 0327
        ADD@    R5,     R3                      ; 6C92   02EB
        NEGR    R5                              ; 6C93   0025
        DECR    R5                              ; 6C94   0015
        SAR     R3,     1                       ; 6C95   006B
        CMP@    R1,     R0                      ; 6C96   0348
        CMPR    R0,     R0                      ; 6C97   0140
        CMP@    R2,     R4                      ; 6C98   0354
        SUBR    R0,     R1                      ; 6C99   0101
        MOVR    R1,     R7                      ; 6C9A   008F

        DECLE   $0019,  $0015,  $006B,  $0344   ; 6C9B   0019 0015 006B 0344
        DECLE   $0327,  $02EB,  $0005,  $0025   ; 6C9F   0327 02EB 0005 0025
        DECLE   $006B,  $0300,  $0140,  $0308   ; 6CA3   006B 0300 0140 0308
        DECLE   $0281,  $012B,  $0005,  $0025   ; 6CA7   0281 012B 0005 0025
        DECLE   $006B,  $0300,  $011D,  $0308   ; 6CAB   006B 0300 011D 0308
        DECLE   $023B,  $012B,  $0035           ; 6CAF   023B 012B 0035

        SAR     R3,     1                       ; 6CB2   006B
        SUB     .PSG1.rgt_hand,R0               ; 6CB3   0300 00FE
        SUB@    R1,     R0                      ; 6CB5   0308
        XORR    R7,     R4                      ; 6CB6   01FC
        CMP@    R2,     R4                      ; 6CB7   0354
        XORR    R6,     R4                      ; 6CB8   01F4
        MOVR    R1,     R7                      ; 6CB9   008F

        DECLE   $0019,  $0015,  $006B,  $0344   ; 6CBA   0019 0015 006B 0344
        DECLE   $0327,  $02EB,  $0035           ; 6CBE   0327 02EB 0035

        SAR     R3,     1                       ; 6CC1   006B
        RRC     R3,     2                       ; 6CC2   0077
        ADDR    R0,     R7                      ; 6CC3   00C7

        SAR     R0,     2                       ; 6CC4   006C
        XORI    #$02CF, R1                      ; 6CC5   03F9 02CF
        MVI     G_015A, R0                      ; 6CC7   0280 015A
        DECR    R0                              ; 6CC9   0010
        BEQ     L_6CD2                          ; 6CCA   0204 0006

        SDBD                                    ; 6CCC   0001
        MVII    #$6BC5, R4                      ; 6CCD   02BC 00C5 006B
        MVO     R0,     G_015A                  ; 6CD0   0240 015A
L_6CD2:
        PULR    R7                              ; 6CD2   02B7

L_6CD3:
        PSHR    R5                              ; 6CD3   0275

        JSR     R5,     X_PLAY_SFX1             ; 6CD4   0004 0118 03BB
        DECLE   $002F                           ; 6CD7  SFX data
        DECLE   $0389                           ; 6CD8  SFX data
        DECLE   $0035                           ; 6CD9  SFX data
        DECLE   $006B                           ; 6CDA  SFX data
        DECLE   $0340,  $0153                   ; 6CDB  SFX data
        DECLE   $02C8,  $00AA                   ; 6CDD  SFX data
        DECLE   $0354,  $014D                   ; 6CDF  SFX data
        DECLE   $008F,  $001B                   ; 6CE1  SFX data
        DECLE   $0005                           ; 6CE3  SFX data
        DECLE   $0025                           ; 6CE4  SFX data
        DECLE   $006B                           ; 6CE5  SFX data
        DECLE   $0340,  $00FE                   ; 6CE6  SFX data
        DECLE   $02C8,  $007F                   ; 6CE8  SFX data
        DECLE   $008F,  $0011                   ; 6CEA  SFX data
        DECLE   $0005                           ; 6CEC  SFX data
        DECLE   $0025                           ; 6CED  SFX data
        DECLE   $006B                           ; 6CEE  SFX data
        DECLE   $0340,  $00CA                   ; 6CEF  SFX data
        DECLE   $02C8,  $0065                   ; 6CF1  SFX data
        DECLE   $01EB                           ; 6CF3  SFX data
        DECLE   $0035                           ; 6CF4  SFX data
        DECLE   $006B                           ; 6CF5  SFX data
        DECLE   $0380,  $00B4                   ; 6CF6  SFX data
        DECLE   $0308,  $005A                   ; 6CF8  SFX data
        DECLE   $0354,  $0101                   ; 6CFA  SFX data
        DECLE   $008F,  $001B                   ; 6CFC  SFX data
        DECLE   $0005                           ; 6CFE  SFX data
        DECLE   $0025                           ; 6CFF  SFX data
        DECLE   $006B                           ; 6D00  SFX data
        DECLE   $0340,  $00F0                   ; 6D01  SFX data
        DECLE   $02C8,  $0078                   ; 6D03  SFX data
        DECLE   $008F,  $001B                   ; 6D05  SFX data
        DECLE   $0035                           ; 6D07  SFX data
        DECLE   $006B                           ; 6D08  SFX data
        DECLE   $0340,  $00B4                   ; 6D09  SFX data
        DECLE   $02C8,  $005A                   ; 6D0B  SFX data
        DECLE   $0354,  $00B9                   ; 6D0D  SFX data
        DECLE   $01EB                           ; 6D0F  SFX data
        DECLE   $0005                           ; 6D10  SFX data
        DECLE   $0025                           ; 6D11  SFX data
        DECLE   $006B                           ; 6D12  SFX data
        DECLE   $0340,  $00CA                   ; 6D13  SFX data
        DECLE   $02C8,  $0065                   ; 6D15  SFX data
        DECLE   $01EB                           ; 6D17  SFX data
        DECLE   $0005                           ; 6D18  SFX data
        DECLE   $0025                           ; 6D19  SFX data
        DECLE   $006B                           ; 6D1A  SFX data
        DECLE   $0340,  $00B4                   ; 6D1B  SFX data
        DECLE   $02C8,  $005A                   ; 6D1D  SFX data
        DECLE   $01EB                           ; 6D1F  SFX data
        DECLE   $0005                           ; 6D20  SFX data
        DECLE   $0025                           ; 6D21  SFX data
        DECLE   $006B                           ; 6D22  SFX data
        DECLE   $0340,  $0097                   ; 6D23  SFX data
        DECLE   $02C8,  $004C                   ; 6D25  SFX data
        DECLE   $008F,  $001B                   ; 6D27  SFX data
        DECLE   $0015                           ; 6D29  SFX data
        DECLE   $006B                           ; 6D2A  SFX data
        DECLE   $0354,  $0101                   ; 6D2B  SFX data
        DECLE   $008F,  $0039                   ; 6D2D  SFX data
        DECLE   $0035                           ; 6D2F  SFX data
        DECLE   $006B                           ; 6D30  SFX data
        DECLE   $0340,  $012E                   ; 6D31  SFX data
        DECLE   $02C8,  $0097                   ; 6D33  SFX data
        DECLE   $0354,  $00B9                   ; 6D35  SFX data
        DECLE   $008F,  $001B                   ; 6D37  SFX data
        DECLE   $0005                           ; 6D39  SFX data
        DECLE   $0025                           ; 6D3A  SFX data
        DECLE   $006B                           ; 6D3B  SFX data
        DECLE   $0340,  $00E2                   ; 6D3C  SFX data
        DECLE   $02C8,  $0071                   ; 6D3E  SFX data
        DECLE   $008F,  $0011                   ; 6D40  SFX data
        DECLE   $0005                           ; 6D42  SFX data
        DECLE   $0025                           ; 6D43  SFX data
        DECLE   $006B                           ; 6D44  SFX data
        DECLE   $0340,  $00AA                   ; 6D45  SFX data
        DECLE   $02C8,  $0055                   ; 6D47  SFX data
        DECLE   $01EB                           ; 6D49  SFX data
        DECLE   $0035                           ; 6D4A  SFX data
        DECLE   $006B                           ; 6D4B  SFX data
        DECLE   $0380,  $00A0                   ; 6D4C  SFX data
        DECLE   $0308,  $0050                   ; 6D4E  SFX data
        DECLE   $0354,  $0075                   ; 6D50  SFX data
        DECLE   $008F,  $001B                   ; 6D52  SFX data
        DECLE   $0005                           ; 6D54  SFX data
        DECLE   $0025                           ; 6D55  SFX data
        DECLE   $006B                           ; 6D56  SFX data
        DECLE   $0340,  $00D7                   ; 6D57  SFX data
        DECLE   $02C8,  $006B                   ; 6D59  SFX data
        DECLE   $008F,  $001B                   ; 6D5B  SFX data
        DECLE   $0035                           ; 6D5D  SFX data
        DECLE   $006B                           ; 6D5E  SFX data
        DECLE   $0340,  $00A0                   ; 6D5F  SFX data
        DECLE   $02C8,  $0050                   ; 6D61  SFX data
        DECLE   $0354,  $0035                   ; 6D63  SFX data
        DECLE   $01EB                           ; 6D65  SFX data
        DECLE   $0005                           ; 6D66  SFX data
        DECLE   $0025                           ; 6D67  SFX data
        DECLE   $006B                           ; 6D68  SFX data
        DECLE   $0340,  $00B4                   ; 6D69  SFX data
        DECLE   $02C8,  $005A                   ; 6D6B  SFX data
        DECLE   $01EB                           ; 6D6D  SFX data
        DECLE   $0005                           ; 6D6E  SFX data
        DECLE   $0025                           ; 6D6F  SFX data
        DECLE   $006B                           ; 6D70  SFX data
        DECLE   $0340,  $00A0                   ; 6D71  SFX data
        DECLE   $02C8,  $0050                   ; 6D73  SFX data
        DECLE   $01EB                           ; 6D75  SFX data
        DECLE   $0005                           ; 6D76  SFX data
        DECLE   $0025                           ; 6D77  SFX data
        DECLE   $006B                           ; 6D78  SFX data
        DECLE   $0340,  $0087                   ; 6D79  SFX data
        DECLE   $02C8,  $0043                   ; 6D7B  SFX data
        DECLE   $008F,  $001B                   ; 6D7D  SFX data
        DECLE   $0015                           ; 6D7F  SFX data
        DECLE   $006B                           ; 6D80  SFX data
        DECLE   $0354,  $0075                   ; 6D81  SFX data
        DECLE   $008F,  $0039                   ; 6D83  SFX data
        DECLE   $0035                           ; 6D85  SFX data
        DECLE   $006B                           ; 6D86  SFX data
        DECLE   $03F9                           ; 6D87  SFX data
        DECLE   $02CF                           ; 6D88  SFX end

L_6D89:
        DIS                                     ; 6D89   0003
        PSHR    R5                              ; 6D8A   0275
        PSHR    R0                              ; 6D8B   0270
        PSHR    R1                              ; 6D8C   0271
        MVI     G_01AB, R1                      ; 6D8D   0281 01AB
        PSHR    R2                              ; 6D8F   0272
        PSHR    R3                              ; 6D90   0273
        PSHR    R4                              ; 6D91   0274

        JSR     R5,     L_6EA2                  ; 6D92   0004 016C 02A2

        TSTR    R0                              ; 6D95   0080
        BNEQ    L_6DC2                          ; 6D96   020C 002A

        MOVR    R1,     R2                      ; 6D98   008A
        ANDI    #$0080, R2                      ; 6D99   03BA 0080
        SETC                                    ; 6D9B   0007
        BNEQ    L_6DC3                          ; 6D9C   020C 0025

        MOVR    R1,     R2                      ; 6D9E   008A
        ANDI    #$0003, R2                      ; 6D9F   03BA 0003
        SDBD                                    ; 6DA1   0001
        MVII    #$01B0, R4                      ; 6DA2   02BC 00B0 0001
        ADDR    R2,     R4                      ; 6DA5   00D4
        ADDR    R2,     R4                      ; 6DA6   00D4
        MVO@    R3,     R4                      ; 6DA7   0263
        SWAP    R3,     1                       ; 6DA8   0043
        MVO@    R3,     R4                      ; 6DA9   0263
        INCR    R2                              ; 6DAA   000A
        ANDI    #$0003, R2                      ; 6DAB   03BA 0003
        MOVR    R1,     R0                      ; 6DAD   0088
        ANDI    #$000C, R0                      ; 6DAE   03B8 000C
        SLR     R0,     2                       ; 6DB0   0064
        CMPR    R0,     R2                      ; 6DB1   0142
        BNEQ    L_6DB8                          ; 6DB2   020C 0004

        ANDI    #$007F, R1                      ; 6DB4   03B9 007F
        XORI    #$0080, R1                      ; 6DB6   03F9 0080
L_6DB8:
        ANDI    #$00BC, R1                      ; 6DB8   03B9 00BC
        XORI    #$0040, R1                      ; 6DBA   03F9 0040
        MOVR    R2,     R4                      ; 6DBC   0094
        COMR    R4                              ; 6DBD   001C
        ANDR    R4,     R1                      ; 6DBE   01A1
        XORR    R2,     R1                      ; 6DBF   01D1
        MVO     R1,     G_01AB                  ; 6DC0   0241 01AB
L_6DC2:
        CLRC                                    ; 6DC2   0006
L_6DC3:
        PULR    R4                              ; 6DC3   02B4
        PULR    R3                              ; 6DC4   02B3
        PULR    R2                              ; 6DC5   02B2
        PULR    R1                              ; 6DC6   02B1
        PULR    R0                              ; 6DC7   02B0
        EIS                                     ; 6DC8   0002
        PULR    R7                              ; 6DC9   02B7

L_6DCA:
        PSHR    R5                              ; 6DCA   0275
        DIS                                     ; 6DCB   0003
        MVII    #$01AB, R4                      ; 6DCC   02BC 01AB
        MVII    #$000E, R0                      ; 6DCE   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 6DD0   0004 0114 0338

        MVII    #$0004, R0                      ; 6DD3   02B8 0004
        SWAP    R0,     1                       ; 6DD5   0040
        MVO     R0,     .IV.FIFO                ; 6DD6   0240 0081

        JSR     R5,     L_6EA2                  ; 6DD8   0004 016C 02A2

        TSTR    R0                              ; 6DDB   0080
        BNEQ    L_6DEA                          ; 6DDC   020C 000C

        SDBD                                    ; 6DDE   0001
        MVII    #$00EC, R0                      ; 6DDF   02B8 00EC 0000
        MVO     R0,     .ISRVEC.0               ; 6DE2   0240 0100
        SDBD                                    ; 6DE4   0001
        MVII    #$006D, R0                      ; 6DE5   02B8 006D 0000
        MVO     R0,     .ISRVEC.1               ; 6DE8   0240 0101
L_6DEA:
        EIS                                     ; 6DEA   0002
        PULR    R7                              ; 6DEB   02B7

        DIS                                     ; 6DEC   0003

        JSR     R5,     X_DEF_ISR               ; 6DED   0004 0110 0126

        MVII    #$0041, R1                      ; 6DF0   02B9 0041
L_6DF2:
        MVI     G_01AB, R0                      ; 6DF2   0280 01AB
        MOVR    R0,     R3                      ; 6DF4   0083
        ANDI    #$0040, R0                      ; 6DF5   03B8 0040
        BEQ     L_6E88                          ; 6DF7   0204 008F

        SLR     R3,     1                       ; 6DF9   0063
        ANDI    #$0006, R3                      ; 6DFA   03BB 0006
        MVII    #$01B0, R4                      ; 6DFC   02BC 01B0
        ADDR    R3,     R4                      ; 6DFE   00DC
        MVII    #$01AC, R5                      ; 6DFF   02BD 01AC
        SDBD                                    ; 6E01   0001
        MVI@    R5,     R2                      ; 6E02   02AA
        TSTR    R2                              ; 6E03   0092
        BNEQ    L_6E28                          ; 6E04   020C 0022

        SDBD                                    ; 6E06   0001
        MVI@    R4,     R5                      ; 6E07   02A5
        SDBD                                    ; 6E08   0001
        MVI@    R5,     R0                      ; 6E09   02A8
        SUBI    #$0002, R4                      ; 6E0A   033C 0002
        CMPI    #$0100, R0                      ; 6E0C   0378 0100
        BC      L_6E28                          ; 6E0E   0201 0018

        TSTR    R0                              ; 6E10   0080
        BNEQ    L_6E18                          ; 6E11   020C 0005

        JSR     R5,     L_6E45                  ; 6E13   0004 016C 0245

        B       L_6DF2                          ; 6E16   0220 0025

L_6E18:
        JSR     R5,     L_6E66                  ; 6E18   0004 016C 0266

        BC      L_6E88                          ; 6E1B   0201 006B

        PSHR    R1                              ; 6E1D   0271
        MVII    #$0001, R1                      ; 6E1E   02B9 0001

L_6E20:
        JSR     R5,     L_6EA7                  ; 6E20   0004 016C 02A7

        PULR    R1                              ; 6E23   02B1
        BC      L_6E88                          ; 6E24   0201 0062
        B       L_6DF2                          ; 6E26   0220 0035

L_6E28:
        PSHR    R4                              ; 6E28   0274
        MVII    #$01AC, R4                      ; 6E29   02BC 01AC
        SDBD                                    ; 6E2B   0001
        MVI@    R4,     R2                      ; 6E2C   02A2
        SDBD                                    ; 6E2D   0001
        MVI@    R4,     R5                      ; 6E2E   02A5
        PULR    R4                              ; 6E2F   02B4
L_6E30:
        TSTR    R2                              ; 6E30   0092
        BNEQ    L_6E37                          ; 6E31   020C 0004

        PSHR    R1                              ; 6E33   0271
        CLRR    R1                              ; 6E34   01C9
        B       L_6E20                          ; 6E35   0220 0016

L_6E37:
        MVI     .IV.FIFO,R0                     ; 6E37   0280 0081
        TSTR    R0                              ; 6E39   0080
        BMI     L_6E7F                          ; 6E3A   020B 0043

        DECR    R1                              ; 6E3C   0011
        BEQ     L_6E7F                          ; 6E3D   0204 0040

        MVI@    R5,     R0                      ; 6E3F   02A8
        MVO     R0,     .IV.FIFO                ; 6E40   0240 0081
        DECR    R2                              ; 6E42   0012
        B       L_6E30                          ; 6E43   0220 0014

L_6E45:
        PSHR    R5                              ; 6E45   0275
L_6E46:
        CLRR    R0                              ; 6E46   01C0
        MVO     R0,     G_01AC                  ; 6E47   0240 01AC
        MVO     R0,     G_01AD                  ; 6E49   0240 01AD
        MVI     G_01AB, R0                      ; 6E4B   0280 01AB
        PSHR    R0                              ; 6E4D   0270
        ADDI    #$0004, R0                      ; 6E4E   02F8 0004
        ANDI    #$000C, R0                      ; 6E50   03B8 000C
        PULR    R3                              ; 6E52   02B3
        ANDI    #$0063, R3                      ; 6E53   03BB 0063
        ADDR    R0,     R3                      ; 6E55   00C3
        MVO     R3,     G_01AB                  ; 6E56   0243 01AB
        SLR     R0,     2                       ; 6E58   0064
        ANDI    #$0003, R3                      ; 6E59   03BB 0003
        CMPR    R0,     R3                      ; 6E5B   0143
        BNEQ    L_6EED                          ; 6E5C   020C 008F

        MVI     G_01AB, R0                      ; 6E5E   0280 01AB
        ANDI    #$00AF, R0                      ; 6E60   03B8 00AF
        MVO     R0,     G_01AB                  ; 6E62   0240 01AB
        SETC                                    ; 6E64   0007
        PULR    R7                              ; 6E65   02B7

L_6E66:
        PSHR    R1                              ; 6E66   0271
        MVI     G_01B8, R1                      ; 6E67   0281 01B8
        TSTR    R1                              ; 6E69   0089
        BEQ     L_6E6F                          ; 6E6A   0204 0003

L_6E6C:
        SETC                                    ; 6E6C   0007
        PULR    R1                              ; 6E6D   02B1
        MOVR    R5,     R7                      ; 6E6E   00AF

L_6E6F:
        MVI     .IV.ALD,R1                      ; 6E6F   0281 0080
        TSTR    R1                              ; 6E71   0089
        BPL     L_6E6C                          ; 6E72   0223 0007

        MVO     R0,     .IV.ALD                 ; 6E74   0240 0080
        CLRC                                    ; 6E76   0006
        MVI     G_01AB, R0                      ; 6E77   0280 01AB
        ANDI    #$00EF, R0                      ; 6E79   03B8 00EF
        MVO     R0,     G_01AB                  ; 6E7B   0240 01AB
        PULR    R1                              ; 6E7D   02B1
        MOVR    R5,     R7                      ; 6E7E   00AF

L_6E7F:
        MVII    #$01AC, R4                      ; 6E7F   02BC 01AC
        MVO@    R2,     R4                      ; 6E81   0262
        SWAP    R2,     1                       ; 6E82   0042
        MVO@    R2,     R4                      ; 6E83   0262
        MOVR    R5,     R0                      ; 6E84   00A8
        MVO@    R0,     R4                      ; 6E85   0260
        SWAP    R0,     1                       ; 6E86   0040
        MVO@    R0,     R4                      ; 6E87   0260
L_6E88:
        MVI     .IV.ALD,R0                      ; 6E88   0280 0080
        TSTR    R0                              ; 6E8A   0080
        BPL     L_6E98                          ; 6E8B   0203 000B

        MVI     G_01B8, R3                      ; 6E8D   0283 01B8
        TSTR    R3                              ; 6E8F   009B
        BEQ     L_6E98                          ; 6E90   0204 0006

        CLRR    R0                              ; 6E92   01C0
        MVO     R0,     .IV.ALD                 ; 6E93   0240 0080
        DECR    R3                              ; 6E95   0013
        MVO     R3,     G_01B8                  ; 6E96   0243 01B8
L_6E98:
        PULR    R5                              ; 6E98   02B5
        PULR    R4                              ; 6E99   02B4
        PULR    R3                              ; 6E9A   02B3
        PULR    R2                              ; 6E9B   02B2
        PULR    R1                              ; 6E9C   02B1
        PULR    R0                              ; 6E9D   02B0
        RSWD    R0                              ; 6E9E   0038
        PULR    R0                              ; 6E9F   02B0
        EIS                                     ; 6EA0   0002
        PULR    R7                              ; 6EA1   02B7

L_6EA2:
        MVI     .IV.FIFO,R0                     ; 6EA2   0280 0081
        ANDI    #$0200, R0                      ; 6EA4   03B8 0200
        MOVR    R5,     R7                      ; 6EA6   00AF

L_6EA7:
        PSHR    R5                              ; 6EA7   0275
        SDBD                                    ; 6EA8   0001
        MVI@    R4,     R5                      ; 6EA9   02A5
        SDBD                                    ; 6EAA   0001
        MVI@    R5,     R0                      ; 6EAB   02A8
        SUBI    #$0002, R4                      ; 6EAC   033C 0002
        TSTR    R0                              ; 6EAE   0080
        BEQ     L_6E46                          ; 6EAF   0224 006A

        CMPI    #$0100, R0                      ; 6EB1   0378 0100
        BC      L_6EBF                          ; 6EB3   0201 000A

        PSHR    R0                              ; 6EB5   0270
        CLRR    R0                              ; 6EB6   01C0
        MVO     R0,     G_01AC                  ; 6EB7   0240 01AC
        MVO     R0,     G_01AD                  ; 6EB9   0240 01AD
        PULR    R0                              ; 6EBB   02B0
        TSTR    R1                              ; 6EBC   0089
        BEQ     L_6EED                          ; 6EBD   0204 002E

L_6EBF:
        PSHR    R0                              ; 6EBF   0270
        MOVR    R5,     R0                      ; 6EC0   00A8
        MVO@    R0,     R4                      ; 6EC1   0260
        SWAP    R0,     1                       ; 6EC2   0040
        MVO@    R0,     R4                      ; 6EC3   0260
        SUBI    #$0002, R4                      ; 6EC4   033C 0002
        SUBI    #$0002, R5                      ; 6EC6   033D 0002
        PULR    R0                              ; 6EC8   02B0
        CMPI    #$0100, R0                      ; 6EC9   0378 0100
        BNC     L_6EED                          ; 6ECB   0209 0020

        SDBD                                    ; 6ECD   0001
        MVI@    R5,     R0                      ; 6ECE   02A8
        MOVR    R0,     R5                      ; 6ECF   0085
        MVI@    R5,     R0                      ; 6ED0   02A8
        MVO     R0,     G_01AC                  ; 6ED1   0240 01AC
        SWAP    R0,     1                       ; 6ED3   0040
        MVO     R0,     G_01AD                  ; 6ED4   0240 01AD
        MOVR    R5,     R0                      ; 6ED6   00A8
        MVO     R0,     G_01AE                  ; 6ED7   0240 01AE
        SWAP    R0,     1                       ; 6ED9   0040
        MVO     R0,     G_01AF                  ; 6EDA   0240 01AF
        MVI     G_01AB, R0                      ; 6EDC   0280 01AB
        ANDI    #$0010, R0                      ; 6EDE   03B8 0010
L_6EE0:
        BNEQ    L_6EED                          ; 6EE0   020C 000B

        MVI     G_01B8, R0                      ; 6EE2   0280 01B8
        INCR    R0                              ; 6EE4   0008
        MVO     R0,     G_01B8                  ; 6EE5   0240 01B8
        MVI     G_01AB, R0                      ; 6EE7   0280 01AB
        ADDI    #$0010, R0                      ; 6EE9   02F8 0010
        MVO     R0,     G_01AB                  ; 6EEB   0240 01AB
L_6EED:
        CLRC                                    ; 6EED   0006
        PULR    R7                              ; 6EEE   02B7

        DECLE   $0000,  $0001,  $0003,  $0004   ; 6EEF   0000 0001 0003 0004
        DECLE   $0009,  $03FF                   ; 6EF3   0009 03FF
L_6EF5:
        PSHR    R5                              ; 6EF5   0275
        MVI     G_01AB, R0                      ; 6EF6   0280 01AB
        ANDI    #$0040, R0                      ; 6EF8   03B8 0040
        BNEQ    L_6F88                          ; 6EFA   020C 008C

        MVII    #$01DE, R5                      ; 6EFC   02BD 01DE
        SDBD                                    ; 6EFE   0001
        MVI@    R5,     R1                      ; 6EFF   02A9
        DECR    R0                              ; 6F00   0010
        TSTR    R1                              ; 6F01   0089
        BEQ     L_6F88                          ; 6F02   0204 0084

        PSHR    R1                              ; 6F04   0271
L_6F05:
        INCR    R0                              ; 6F05   0008
        SARC    R1,     1                       ; 6F06   0079
        BNC     L_6F05                          ; 6F07   0229 0003

        MOVR    R0,     R1                      ; 6F09   0081

        JSR     R5,     X_POW2                  ; 6F0A   0004 0114 0345

        COMR    R0                              ; 6F0D   0018
        AND@    R6,     R0                      ; 6F0E   03B0
        MVO     R0,     G_01DE                  ; 6F0F   0240 01DE
        SWAP    R0,     1                       ; 6F11   0040
        MVO     R0,     G_01DF                  ; 6F12   0240 01DF
        SDBD                                    ; 6F14   0001
        MVII    #$6EEF, R4                      ; 6F15   02BC 00EF 006E
        MVII    #$01B9, R5                      ; 6F18   02BD 01B9
L_6F1A:
        MVI@    R4,     R0                      ; 6F1A   02A0
        MVI@    R5,     R2                      ; 6F1B   02AA
        CMPR    R0,     R1                      ; 6F1C   0141
        BEQ     L_6F24                          ; 6F1D   0204 0005

        CMPI    #$03FF, R0                      ; 6F1F   0378 03FF
        BNEQ    L_6F1A                          ; 6F21   022C 0008
        INCR    R7                              ; 6F23   000F

L_6F24:
        PSHR    R2                              ; 6F24   0272
L_6F25:
        SDBD                                    ; 6F25   0001
        MVII    #$6FBA, R4                      ; 6F26   02BC 00BA 006F
        ADDR    R4,     R1                      ; 6F29   00E1
        ADD@    R1,     R4                      ; 6F2A   02CC
        MVI@    R4,     R0                      ; 6F2B   02A0
        MVII    #$01BE, R3                      ; 6F2C   02BB 01BE
L_6F2E:
        MVI@    R4,     R1                      ; 6F2E   02A1
        CMPI    #$03FF, R1                      ; 6F2F   0379 03FF
        BEQ     L_6F74                          ; 6F31   0204 0041

        MVI@    R4,     R0                      ; 6F33   02A0
        MOVR    R0,     R2                      ; 6F34   0082
        INCR    R1                              ; 6F35   0009
        ADDR    R7,     R1                      ; 6F36   00F9
        ADD@    R1,     R7                      ; 6F37   02CF

        DECLE   $001D,  $0021,  $0019,  $0004   ; 6F38   001D 0021 0019 0004

        MVII    #$0008, R0                      ; 6F3C   02B8 0008
        PULR    R2                              ; 6F3E   02B2
        SWAP    R2,     1                       ; 6F3F   0042
L_6F40:
        MVII    #$005A, R4                      ; 6F40   02BC 005A
        SLLC    R2,     1                       ; 6F42   005A
        BNC     L_6F47                          ; 6F43   0209 0002

        MVII    #$0058, R4                      ; 6F45   02BC 0058
L_6F47:
        PSHR    R0                              ; 6F47   0270

        JSR     R5,     L_6F64                  ; 6F48   0004 016C 0364

        PULR    R0                              ; 6F4B   02B0
        DECR    R0                              ; 6F4C   0010
        BNEQ    L_6F40                          ; 6F4D   022C 000E
        B       L_6F74                          ; 6F4F   0200 0023

        MOVR    R4,     R2                      ; 6F51   00A2
        DECR    R4                              ; 6F52   0014
        B       L_6F5C                          ; 6F53   0200 0007

        JSR     R5,     X_RAND2                 ; 6F55   0004 0114 029E

        INCR    R7                              ; 6F58   000F

        PULR    R0                              ; 6F59   02B0
L_6F5A:
        ADDR    R4,     R2                      ; 6F5A   00E2
        ADDR    R0,     R4                      ; 6F5B   00C4

L_6F5C:
        JSR     R5,     L_6F62                  ; 6F5C   0004 016C 0362

        MOVR    R2,     R4                      ; 6F5F   0094
        B       L_6F2E                          ; 6F60   0220 0033

L_6F62:
        MVI@    R4,     R0                      ; 6F62   02A0
        MOVR    R0,     R4                      ; 6F63   0084
L_6F64:
        PSHR    R5                              ; 6F64   0275
        SDBD                                    ; 6F65   0001
        ADDI    #$6F49, R4                      ; 6F66   02FC 0049 006F
        SDBD                                    ; 6F69   0001
        MVI@    R4,     R1                      ; 6F6A   02A1
        DECR    R0                              ; 6F6B   0010
        BMI     L_6F73                          ; 6F6C   020B 0005

        MVO@    R1,     R3                      ; 6F6E   0259
        SWAP    R1,     1                       ; 6F6F   0041
        INCR    R3                              ; 6F70   000B
        MVO@    R1,     R3                      ; 6F71   0259
        INCR    R3                              ; 6F72   000B
L_6F73:
        PULR    R7                              ; 6F73   02B7

L_6F74:
        SDBD                                    ; 6F74   0001
        MVII    #$D005, R0                      ; 6F75   02B8 0005 00D0
        MOVR    R3,     R4                      ; 6F78   009C
        MVO@    R0,     R4                      ; 6F79   0260
        SWAP    R0,     1                       ; 6F7A   0040
        MVO@    R0,     R4                      ; 6F7B   0260
        MVII    #$0002, R0                      ; 6F7C   02B8 0002
        MVO@    R0,     R4                      ; 6F7E   0260
        CLRR    R0                              ; 6F7F   01C0
        MVO@    R0,     R4                      ; 6F80   0260
        MVO@    R0,     R4                      ; 6F81   0260
        MVO@    R0,     R4                      ; 6F82   0260
        MVII    #$01BE, R3                      ; 6F83   02BB 01BE

        JSR     R5,     L_6D89                  ; 6F85   0004 016C 0189

L_6F88:
        PULR    R7                              ; 6F88   02B7

        SLL     R0,     1                       ; 6F89   0048
        ADDR    R3,     R1                      ; 6F8A   00D9
        MOVR    R6,     R2                      ; 6F8B   00B2
        ADDR    R3,     R1                      ; 6F8C   00D9
        SLL     R1,     1                       ; 6F8D   0049
        ADDR    R3,     R2                      ; 6F8E   00DA
        ADDR    R3,     R3                      ; 6F8F   00DB
        ADDR    R3,     R2                      ; 6F90   00DA
        SAR     R0,     2                       ; 6F91   006C
        ADDR    R3,     R3                      ; 6F92   00DB
        ADDR    R2,     R5                      ; 6F93   00D5
        ADDR    R3,     R3                      ; 6F94   00DB
        SLR     R0,     2                       ; 6F95   0064
        ADDR    R3,     R4                      ; 6F96   00DC
        ADDR    R6,     R5                      ; 6F97   00F5
        ADDR    R3,     R4                      ; 6F98   00DC
        SARC    R0,     1                       ; 6F99   0078
        ADDR    R3,     R5                      ; 6F9A   00DD
        ADDR    R1,     R1                      ; 6F9B   00C9
        ADDR    R3,     R5                      ; 6F9C   00DD
        SLL     R1,     2                       ; 6F9D   004D
        ADDR    R3,     R6                      ; 6F9E   00DE
        MOVR    R2,     R5                      ; 6F9F   0095
        SLR     R3,     1                       ; 6FA0   0063
        INCR    R0                              ; 6FA1   0008
        ADDR    R2,     R0                      ; 6FA2   00D0
        SLLC    R1,     2                       ; 6FA3   005D
        ADDR    R2,     R0                      ; 6FA4   00D0
        MOVR    R7,     R1                      ; 6FA5   00B9
        ADDR    R2,     R0                      ; 6FA6   00D0
        COMR    R2                              ; 6FA7   001A
        ADDR    R2,     R1                      ; 6FA8   00D1
        SLR     R2,     2                       ; 6FA9   0066
        ADDR    R2,     R6                      ; 6FAA   00D6
        ADDR    R7,     R3                      ; 6FAB   00FB
        ADDR    R2,     R6                      ; 6FAC   00D6
        SLL     R1,     1                       ; 6FAD   0049
        ADDR    R2,     R7                      ; 6FAE   00D7

        ADDR    R5,     R4                      ; 6FAF   00EC
        ADDR    R2,     R7                      ; 6FB0   00D7

        DECLE   $0076,  $00D8,  $0032,  $00D3   ; 6FB1   0076 00D8 0032 00D3
        DECLE   $00A9,  $00D1,  $00B3,  $00D4   ; 6FB5   00A9 00D1 00B3 00D4
        DECLE   $0000                           ; 6FB9   0000

        INCR    R2                              ; 6FBA   000A
L_6FBB:
        DECR    R7                              ; 6FBB   0017

        DECLE   $0024,  $0027,  $002C,  $0034   ; 6FBC   0024 0027 002C 0034
        DECLE   $0039,  $003E,  $0041,  $0044   ; 6FC0   0039 003E 0041 0044
        DECLE   $03FF,  $0002,  $0040,  $0001   ; 6FC4   03FF 0002 0040 0001
        DECLE   $0008,  $0044,  $0046,  $0048   ; 6FC8   0008 0044 0046 0048
        DECLE   $004A,  $004C,  $004E,  $0050   ; 6FCC   004A 004C 004E 0050
        DECLE   $0052,  $03FF,  $0002,  $0042   ; 6FD0   0052 03FF 0002 0042
        DECLE   $0001,  $0008,  $0044,  $0046   ; 6FD4   0001 0008 0044 0046
        DECLE   $0048,  $004A,  $004C,  $004E   ; 6FD8   0048 004A 004C 004E
        DECLE   $0050,  $0052,  $03FF,  $0002   ; 6FDC   0050 0052 03FF 0002
        DECLE   $0054,  $03FF,  $0001,  $0002   ; 6FE0   0054 03FF 0001 0002
        DECLE   $005E,  $005C,  $03FF,  $0002   ; 6FE4   005E 005C 03FF 0002
        DECLE   $0060,  $0001,  $0003,  $0066   ; 6FE8   0060 0001 0003 0066
        DECLE   $0064,  $0062,  $03FF,  $0002   ; 6FEC   0064 0062 03FF 0002
        DECLE   $0068,  $0002,  $0068,  $03FF   ; 6FF0   0068 0002 0068 03FF
        DECLE   $0000,  $0002,  $006A,  $006C   ; 6FF4   0000 0002 006A 006C
        DECLE   $03FF,  $0002,  $006E,  $03FF   ; 6FF8   03FF 0002 006E 03FF
        DECLE   $0002,  $0056,  $03FF           ; 6FFC   0002 0056 03FF

        DIS                                     ; 6FFF   0003

        ORG     $D000
        DECLE   $0004,  $00D0,  $0014,  $00E1   ; D000   0004 00D0 0014 00E1
        DECLE   $0000,  $0002,  $00F1,  $0000   ; D004   0000 0002 00F1 0000
        DECLE   $0054,  $0210                   ; D008   0054 0210

        CMPR    R1,     R4                      ; D00A   014C
        ANDR    R4,     R4                      ; D00B   01A4
        MVI@    R2,     R7                      ; D00C   0297

        DECLE   $01AB,  $00C0,  $02D2,  $0198   ; D00D   01AB 00C0 02D2 0198
        DECLE   $02E6,  $02D0,  $0202,  $02A4   ; D011   02E6 02D0 0202 02A4
        DECLE   $00AD,  $0036,  $00C8,  $0063   ; D015   00AD 0036 00C8 0063
        DECLE   $0360,  $01A7,  $006A,  $0230   ; D019   0360 01A7 006A 0230
        DECLE   $00B4,  $0046,  $00E5,  $01AF   ; D01D   00B4 0046 00E5 01AF
        DECLE   $0056,  $0088,  $007B,  $0006   ; D021   0056 0088 007B 0006
        DECLE   $0000,  $0100,  $0186,  $02AD   ; D025   0000 0100 0186 02AD
        DECLE   $0357,  $01D6,  $0060,  $0169   ; D029   0357 01D6 0060 0169
        DECLE   $00CC,  $034A,  $0157,  $01BD   ; D02D   00CC 034A 0157 01BD
        DECLE   $02A0,  $036E,  $00E2,  $01C8   ; D031   02A0 036E 00E2 01C8
        DECLE   $0236,  $0235,  $02EE,  $0196   ; D035   0236 0235 02EE 0196
        DECLE   $0073,  $0346,  $027D,  $02B2   ; D039   0073 0346 027D 02B2
        DECLE   $020E,  $02E8,  $0147,  $0375   ; D03D   020E 02E8 0147 0375
        DECLE   $0040,  $03DD,  $02AB,  $00EE   ; D041   0040 03DD 02AB 00EE
        DECLE   $0288,  $0275,  $0335,  $000D   ; D045   0288 0275 0335 000D
        DECLE   $0251,  $027D                   ; D049   0251 027D

        ADD@    R4,     R4                      ; D04B   02E4
        SUBR    R0,     R1                      ; D04C   0101
        ADD@    R5,     R2                      ; D04D   02EA
        MVO@    R4,     R1                      ; D04E   024C
        ADDR    R4,     R4                      ; D04F   00E4
        AND@    R3,     R0                      ; D050   0398
        CMP@    R3,     R4                      ; D051   035C
        MVO@    R1,     R5                      ; D052   0269
        CMPR    R6,     R3                      ; D053   0173
        ANDR    R5,     R2                      ; D054   01AA
        ANDR    R5,     R6                      ; D055   01AE
        MOVR    R5,     R7                      ; D056   00AF

        DECLE   $03D1,  $02E3,  $02E4,  $0041   ; D057   03D1 02E3 02E4 0041
        DECLE   $000E,  $0000                   ; D05B   000E 0000

        SLLC    R3,     1                       ; D05D   005B
        SUBR    R2,     R0                      ; D05E   0110
        XOR@    R1,     R5                      ; D05F   03CD
        ANDR    R0,     R1                      ; D060   0181
        MVI@    R2,     R7                      ; D061   0297

        ANDI    #$00C0, R1                      ; D062   03B9 00C0
        ADD@    R2,     R2                      ; D064   02D2
        ANDR    R3,     R0                      ; D065   0198
        MOVR    R4,     R6                      ; D066   00A6
        ADD@    R5,     R1                      ; D067   02E9
        MVI@    R3,     R1                      ; D068   0299
        CMPR    R1,     R3                      ; D069   014B
        MVI@    R3,     R0                      ; D06A   0298
        MOVR    R0,     R7                      ; D06B   0087

        DECLE   $0172,  $00D2,  $0100,  $0239   ; D06C   0172 00D2 0100 0239

        XOR@    R4,     R2                      ; D070   03E2
        MVO@    R5,     R4                      ; D071   0265
        SUB@    R2,     R7                      ; D072   0317

        DECLE   $00BA,  $01CD,  $0207,  $0291   ; D073   00BA 01CD 0207 0291
        DECLE   $00C5,  $03A2,  $017E,  $024D   ; D077   00C5 03A2 017E 024D
        DECLE   $0183,  $0374,  $02AD,  $03C9   ; D07B   0183 0374 02AD 03C9
        DECLE   $024F,  $01DE,  $00D5,  $03B9   ; D07F   024F 01DE 00D5 03B9
        DECLE   $0347,  $0217,  $03A2,  $03E6   ; D083   0347 0217 03A2 03E6
        DECLE   $0368,  $0156,  $0354,  $009B   ; D087   0368 0156 0354 009B
        DECLE   $0165,  $022B                   ; D08B   0165 022B

        XORR    R4,     R6                      ; D08D   01E6
        MVI@    R1,     R7                      ; D08E   028F

        XOR@    R5,     R5                      ; D08F   03ED
        CMP     G_03CC, R4                      ; D090   0344 03CC
        ADD@    R2,     R1                      ; D092   02D1
        MVI@    R4,     R6                      ; D093   02A6
        MVO@    R2,     R5                      ; D094   026A
        ADDR    R7,     R3                      ; D095   00FB
        CMP@    R5,     R2                      ; D096   036A
        CMPR    R3,     R1                      ; D097   0159
        ADD@    R1,     R5                      ; D098   02CD
        SUBR    R3,     R7                      ; D099   011F
        ADD@    R6,     R7                      ; D09A   02F7

        MVI@    R5,     R2                      ; D09B   02AA
        XORI    #$0373, R1                      ; D09C   03F9 0373
        CMPR    R3,     R6                      ; D09E   015E
        MVI@    R1,     R5                      ; D09F   028D
        XORR    R6,     R5                      ; D0A0   01F5
        CMPR    R2,     R5                      ; D0A1   0155
        XORI    #$02B9, R4                      ; D0A2   03FC 02B9
        ADD     G_0346, R6                      ; D0A4   02C6 0346
        PULR    R3                              ; D0A6   02B3
        AND@    R4,     R2                      ; D0A7   03A2
        XORI    #$01E8, R5                      ; D0A8   03FD 01E8
        CMPR    R3,     R2                      ; D0AA   015A
        ADD@    R6,     R4                      ; D0AB   02F4
        SWAP    R0,     1                       ; D0AC   0040
        ADDI    #$022A, R5                      ; D0AD   02FD 022A
        XOR@    R3,     R6                      ; D0AF   03DE
        ADDR    R1,     R7                      ; D0B0   00CF

        DECLE   $0325,  $01B4,  $0110,  $0004   ; D0B1   0325 01B4 0110 0004
        DECLE   $00BB,  $0264,  $01C3,  $0000   ; D0B5   00BB 0264 01C3 0000
        DECLE   $005F,  $0018,  $0049,  $0000   ; D0B9   005F 0018 0049 0000
        DECLE   $00E7,  $029B,  $0368,  $011E   ; D0BD   00E7 029B 0368 011E
        DECLE   $039A,  $01C3,  $0212,  $028F   ; D0C1   039A 01C3 0212 028F
        DECLE   $0069,  $021F,  $00FF,  $0114   ; D0C5   0069 021F 00FF 0114
        DECLE   $034A,  $03BC,  $008B,  $01E0   ; D0C9   034A 03BC 008B 01E0
        DECLE   $00CC,  $0393,  $0109,  $0301   ; D0CD   00CC 0393 0109 0301
        DECLE   $0336,  $019A,  $013F,  $002A   ; D0D1   0336 019A 013F 002A
        DECLE   $0196,  $02E8,  $0380,  $02DC   ; D0D5   0196 02E8 0380 02DC
        DECLE   $031D,  $0369,  $02EC,  $0308   ; D0D9   031D 0369 02EC 0308
        DECLE   $0101,  $0154,  $001C,  $001F   ; D0DD   0101 0154 001C 001F
        DECLE   $03CF                           ; D0E1   03CF

        CMPR    R1,     R0                      ; D0E2   0148
        ANDR    R3,     R3                      ; D0E3   019B
        SUBR    R0,     R7                      ; D0E4   0107

        DECLE   $0018,  $0296,  $030A,  $003F   ; D0E5   0018 0296 030A 003F
        DECLE   $00D5,  $0295,  $037B,  $02EC   ; D0E9   00D5 0295 037B 02EC
        DECLE   $0147,  $01A0,  $0114,  $0387   ; D0ED   0147 01A0 0114 0387
        DECLE   $01FD,  $02C8,  $0382,  $004B   ; D0F1   01FD 02C8 0382 004B
        DECLE   $0040,  $0004,  $0092,  $03F8   ; D0F5   0040 0004 0092 03F8
        DECLE   $0005,  $019B,  $00FF           ; D0F9   0005 019B 00FF

        XORI    #$0296, R4                      ; D0FC   03FC 0296
        MVO@    R2,     R5                      ; D0FE   026A
        MVI@    R3,     R7                      ; D0FF   029F

        DECLE   $02E4,  $03DB,  $036B,  $01EC   ; D100   02E4 03DB 036B 01EC
        DECLE   $0288,  $0350,  $00EC,  $03EA   ; D104   0288 0350 00EC 03EA
        DECLE   $0099,  $03CF,  $0170,  $0312   ; D108   0099 03CF 0170 0312
        DECLE   $0003,  $01D6,  $0242,  $03EF   ; D10C   0003 01D6 0242 03EF
        DECLE   $031C,  $0224,  $0003,  $0364   ; D110   031C 0224 0003 0364
        DECLE   $0290,  $03DE,  $0229,  $01C3   ; D114   0290 03DE 0229 01C3
        DECLE   $0000,  $0000,  $008E,  $0010   ; D118   0000 0000 008E 0010
        DECLE   $014D,  $00FC,  $0213,  $00CE   ; D11C   014D 00FC 0213 00CE
        DECLE   $01CF                           ; D120   01CF

        ANDI    #$01FF, R1                      ; D121   03B9 01FF
        XORR    R4,     R6                      ; D123   01E6
        RRC     R0,     2                       ; D124   0074
        ANDR    R1,     R2                      ; D125   018A
        ADD     G_005F, R7                      ; D126   02C7 005F

        DECLE   $003D,  $0138,  $0263,  $0233   ; D128   003D 0138 0263 0233

        ADDR    R0,     R5                      ; D12C   00C5
        CMP@    R4,     R4                      ; D12D   0364
        SUB@    R1,     R7                      ; D12E   030F
        ADDR    R1,     R7                      ; D12F   00CF

        MVI@    R2,     R3                      ; D130   0293
        XORR    R3,     R1                      ; D131   01D9
        SUBR    R2,     R7                      ; D132   0117

        DECLE   $0042,  $0059,  $0392,  $0045   ; D133   0042 0059 0392 0045
        DECLE   $015C,  $02C2,  $01FF,  $0012   ; D137   015C 02C2 01FF 0012
        DECLE   $03FD,  $0352,  $02EC,  $0189   ; D13B   03FD 0352 02EC 0189
        DECLE   $03D1,  $0024,  $03AC,  $0129   ; D13F   03D1 0024 03AC 0129
        DECLE   $01B6,  $0276,  $03C4,  $0228   ; D143   01B6 0276 03C4 0228
        DECLE   $0212,  $01CE,  $005B,  $0257   ; D147   0212 01CE 005B 0257
        DECLE   $03F0,  $0120,  $036E,  $0120   ; D14B   03F0 0120 036E 0120
        DECLE   $00D8,  $00BB,  $0262,  $0138   ; D14F   00D8 00BB 0262 0138
        DECLE   $02F9,  $00E5,  $024D,  $012D   ; D153   02F9 00E5 024D 012D
        DECLE   $0300,  $0381,  $00C9,  $006F   ; D157   0300 0381 00C9 006F
        DECLE   $012C,  $0108,  $0070,  $0240   ; D15B   012C 0108 0070 0240
        DECLE   $039F,  $012D,  $0000,  $0090   ; D15F   039F 012D 0000 0090
        DECLE   $0241,  $006F,  $012A,  $0000   ; D163   0241 006F 012A 0000
        DECLE   $03F0,  $0047,  $03E8,  $012D   ; D167   03F0 0047 03E8 012D
        DECLE   $0008,  $0080,  $03C0,  $0007   ; D16B   0008 0080 03C0 0007
        DECLE   $012A,  $0008,  $0010,  $0000   ; D16F   012A 0008 0010 0000

        AND@    R1,     R0                      ; D173   0388
        SUBR    R5,     R3                      ; D174   012B
        COMR    R5                              ; D175   001D
        INCR    R6                              ; D176   000E
        B       L_D4A8                          ; D177   0200 032F

        DECLE   $012B,  $0025,  $0002,  $0240   ; D179   012B 0025 0002 0240
        DECLE   $03E7,  $0269,  $0217,  $0131   ; D17D   03E7 0269 0217 0131
        DECLE   $029E,  $0200,  $00E3           ; D181   029E 0200 00E3

        SUB     G_0394, R4                      ; D184   0304 0394
        INCR    R7                              ; D186   000F

        RSWD    R0                              ; D187   0038
L_D188:
        COMR    R4                              ; D188   001C
        DECLE   $000C,  $0094,  $008C,  $0008   ; D189   000C 0094 008C 0008
        DECLE   $0020,  $03C8,  $0233,  $03B9   ; D18D   0020 03C8 0233 03B9
        DECLE   $009C,  $024F,  $037C,  $0330   ; D191   009C 024F 037C 0330
        DECLE   $035A,  $0399,  $022A,  $003A   ; D195   035A 0399 022A 003A
        DECLE   $00A2,  $039F,  $01F7,  $03A5   ; D199   00A2 039F 01F7 03A5
        DECLE   $03A4,  $01CA,  $017E,  $0031   ; D19D   03A4 01CA 017E 0031
        DECLE   $0310,  $0048,  $0000,  $0084   ; D1A1   0310 0048 0000 0084
        DECLE   $0325,  $03A5,  $01C3,  $0000   ; D1A5   0325 03A5 01C3 0000

        ANDR    R1,     R0                      ; D1A9   0188
L_D1AA:
        SUBR    R3,     R0                      ; D1AA   0118
        DECLE   $03CD,  $0146,  $0004,  $0385   ; D1AB   03CD 0146 0004 0385
        DECLE   $02C3,  $02CC,  $0305,  $034A   ; D1AF   02C3 02CC 0305 034A
        DECLE   $0095,  $0361,  $03CF,  $0307   ; D1B3   0095 0361 03CF 0307
        DECLE   $0201,  $01A7,  $00A1,  $034B   ; D1B7   0201 01A7 00A1 034B
        DECLE   $027F                           ; D1BB   027F

        ADDR    R7,     R0                      ; D1BC   00F8
        SWAP    R2,     1                       ; D1BD   0042
        CMPR    R5,     R7                      ; D1BE   016F
        MOVR    R3,     R7                      ; D1BF   009F

        DECLE   $03A3,  $0207                   ; D1C0   03A3 0207

        SUB     .BTAB.23,R3                     ; D1C2   0303 0223
        ADDR    R1,     R0                      ; D1C4   00C8
        MOVR    R2,     R1                      ; D1C5   0091
        AND@    R4,     R5                      ; D1C6   03A5
        XOR     G_03C0, R3                      ; D1C7   03C3 03C0
        CMPI    #$00E8, R6                      ; D1C9   037E 00E8
        MOVR    R4,     R0                      ; D1CB   00A0
        INCR    R1                              ; D1CC   0009
        CLRR    R0                              ; D1CD   01C0
        SUB     .BTAB.63,R0                     ; D1CE   0300 0263
        XORR    R2,     R0                      ; D1D0   01D0
        ANDR    R3,     R0                      ; D1D1   0198
        XOR@    R6,     R6                      ; D1D2   03F6
        SUB     G_002F, R7                      ; D1D3   0307 002F

        DECLE   $004C,  $01AE,  $0204,  $0150   ; D1D5   004C 01AE 0204 0150
        DECLE   $01BB,  $02CD,  $00FF,  $03FD   ; D1D9   01BB 02CD 00FF 03FD
        DECLE   $0184,  $03D2,  $03BD,  $0307   ; D1DD   0184 03D2 03BD 0307
        DECLE   $01EB,  $019D,  $0376,  $03A7   ; D1E1   01EB 019D 0376 03A7
        DECLE   $0127,  $027A,  $03F0,  $0254   ; D1E5   0127 027A 03F0 0254
        DECLE   $0197,  $01A6,  $0025,  $00D9   ; D1E9   0197 01A6 0025 00D9
        DECLE   $0080,  $0010,  $032E,  $01BA   ; D1ED   0080 0010 032E 01BA
        DECLE   $01CD,  $00EB,  $020B,  $038B   ; D1F1   01CD 00EB 020B 038B
        DECLE   $02B3,  $01AF                   ; D1F5   02B3 01AF

        ADD@    R6,     R4                      ; D1F7   02F4
        MVO@    R5,     R5                      ; D1F8   026D
        ANDR    R4,     R4                      ; D1F9   01A4
        AND@    R5,     R6                      ; D1FA   03AE
        AND@    R5,     R0                      ; D1FB   03A8
        ADDR    R1,     R7                      ; D1FC   00CF

        DECLE   $006A,  $03D9,  $00FB,  $01D0   ; D1FD   006A 03D9 00FB 01D0
        DECLE   $028D,  $01FF,  $01F2,  $0100   ; D201   028D 01FF 01F2 0100
        DECLE   $003A,  $0367,  $0089,  $03EE   ; D205   003A 0367 0089 03EE
        DECLE   $03C4,  $0000,  $0054,  $000A   ; D209   03C4 0000 0054 000A
        DECLE   $00EC,  $02DC,  $03CD,  $0103   ; D20D   00EC 02DC 03CD 0103
        DECLE   $0106,  $0089,  $0223           ; D211   0106 0089 0223

        SUB@    R1,     R7                      ; D214   030F

        CMP@    R5,     R0                      ; D215   0368
        SUB@    R1,     R2                      ; D216   030A
        ANDR    R7,     R5                      ; D217   01BD
        PSHR    R6                              ; D218   0276
        ADDR    R0,     R7                      ; D219   00C7

        ADDR    R4,     R0                      ; D21A   00E0
        RLC     R0,     2                       ; D21B   0054
        ANDR    R4,     R6                      ; D21C   01A6
        ADDR    R7,     R5                      ; D21D   00FD
        SUBR    R3,     R4                      ; D21E   011C
        MVII    #$02CC, R5                      ; D21F   02BD 02CC
        ADDR    R5,     R7                      ; D221   00EF

        DECLE   $00FE,  $0100,  $01E2,  $00FD   ; D222   00FE 0100 01E2 00FD
        DECLE   $039A,  $0229,  $019D,  $016E   ; D226   039A 0229 019D 016E
        DECLE   $03C7                           ; D22A   03C7

        MOVR    R2,     R7                      ; D22B   0097

        MVO@    R6,     R2                      ; D22C   0256
        AND@    R5,     R6                      ; D22D   03AE
        SUBR    R7,     R3                      ; D22E   013B
        SUBR    R7,     R4                      ; D22F   013C
        ANDR    R5,     R4                      ; D230   01AC
        SUB@    R1,     R5                      ; D231   030D
        ADDR    R6,     R2                      ; D232   00F2
L_D233:
        SUBR    R0,     R7                      ; D233   0107

        MVI     G_00B2, R2                      ; D234   0282 00B2
        XOR@    R5,     R5                      ; D236   03ED
        MVI@    R1,     R7                      ; D237   028F

        DECLE   $028D,  $01A4,  $03BE,  $00CB   ; D238   028D 01A4 03BE 00CB
        DECLE   $0000,  $0266,  $01AC,  $00F9   ; D23C   0000 0266 01AC 00F9
        DECLE   $0160,  $01A1,  $013D,  $01E2   ; D240   0160 01A1 013D 01E2
        DECLE   $0000,  $004A,  $03C5,  $0215   ; D244   0000 004A 03C5 0215
        DECLE   $01F9,  $02C6,  $0067,  $01FF   ; D248   01F9 02C6 0067 01FF
        DECLE   $0063,  $0362,  $03D6,  $00FE   ; D24C   0063 0362 03D6 00FE
        DECLE   $0315,  $00CE,  $03BB,  $03E3   ; D250   0315 00CE 03BB 03E3
        DECLE   $0073,  $021A,  $03D3,  $009E   ; D254   0073 021A 03D3 009E
        DECLE   $02BA,  $02D7,  $0366,  $008D   ; D258   02BA 02D7 0366 008D
        DECLE   $0203,  $02C3,  $0169,  $03CE   ; D25C   0203 02C3 0169 03CE
        DECLE   $00C1,  $0355,  $0252,  $03F0   ; D260   00C1 0355 0252 03F0
        DECLE   $0000,  $0010,  $0340,  $028F   ; D264   0000 0010 0340 028F
        DECLE   $024F,  $0210                   ; D268   024F 0210

        SUBR    R4,     R3                      ; D26A   0123
        AND     G_03B0, R0                      ; D26B   0380 03B0
        MVI@    R2,     R0                      ; D26D   0290
        ADDR    R1,     R2                      ; D26E   00CA
        CMPR    R7,     R3                      ; D26F   017B
        SLR     R0,     2                       ; D270   0064
        MOVR    R3,     R0                      ; D271   0098
        RSWD    R6                              ; D272   003E
        ADDR    R0,     R7                      ; D273   00C7

        DECLE   $0101,  $02CE,  $014D,  $0212   ; D274   0101 02CE 014D 0212
        DECLE   $0001                           ; D278   0001

        CLRR    R0                              ; D279   01C0
        B       L_D305                          ; D27A   0200 0089
        SUBR    R0,     R7                      ; D27C   0107

        DECLE   $0352,  $007C,  $0000,  $0000   ; D27D   0352 007C 0000 0000

        B       L_D4EF                          ; D281   0200 026C

        XORR    R4,     R6                      ; D283   01E6
        MVI@    R2,     R7                      ; D284   0297

        DECLE   $0382,  $03A4,  $00E1,  $03EE   ; D285   0382 03A4 00E1 03EE
        DECLE   $0347,  $01C5,  $024E,  $01D0   ; D289   0347 01C5 024E 01D0
        DECLE   $0000,  $00FC,  $0060,  $03B0   ; D28D   0000 00FC 0060 03B0
        DECLE   $00CA,  $00F7                   ; D291   00CA 00F7

        RRC     R0,     2                       ; D293   0074
        MOVR    R7,     R4                      ; D294   00BC
        NEGR    R2                              ; D295   0022
        XORR    R1,     R3                      ; D296   01CB
        SLLC    R1,     2                       ; D297   005D
        MVI@    R4,     R0                      ; D298   02A0
        XORR    R2,     R5                      ; D299   01D5
        CMP@    R4,     R6                      ; D29A   0366
        MVI     G_0082, R7                      ; D29B   0287 0082

        ANDR    R4,     R2                      ; D29D   01A2
        CMPR    R6,     R1                      ; D29E   0171
        XOR@    R6,     R6                      ; D29F   03F6
        CMPR    R0,     R6                      ; D2A0   0146
        MVI@    R4,     R6                      ; D2A1   02A6
        MVO@    R6,     R1                      ; D2A2   024E
        B       L_D2E8                          ; D2A3   0200 0043

        DECLE   $0000,  $03F0,  $0367,  $0250   ; D2A5   0000 03F0 0367 0250
        DECLE   $0210,  $0000,  $007E,  $0230   ; D2A9   0210 0000 007E 0230
        DECLE   $02F4,  $0250,  $0010,  $0120   ; D2AD   02F4 0250 0010 0120
        DECLE   $03FA,  $0030,  $00F4,  $00C8   ; D2B1   03FA 0030 00F4 00C8
        DECLE   $00FB,  $0254,  $0068,  $0221   ; D2B5   00FB 0254 0068 0221
        DECLE   $0002,  $024C,  $00BD,  $01D8   ; D2B9   0002 024C 00BD 01D8
        DECLE   $0366,  $0099,  $0183,  $00A3   ; D2BD   0366 0099 0183 00A3
        DECLE   $0161,  $002E,  $0008,  $02E6   ; D2C1   0161 002E 0008 02E6
        DECLE   $024E,  $01E0,  $0160,  $000A   ; D2C5   024E 01E0 0160 000A
        DECLE   $001F,  $0210                   ; D2C9   001F 0210

        ADDR    R2,     R3                      ; D2CB   00D3
        PULR    R7                              ; D2CC   02B7

        DECLE   $0074,  $0078,  $002B,  $03C3   ; D2CD   0074 0078 002B 03C3
        DECLE   $00DE,  $02BC,  $02D3,  $01A6   ; D2D1   00DE 02BC 02D3 01A6
        DECLE   $028D,  $037F,  $0283,  $0369   ; D2D5   028D 037F 0283 0369
        DECLE   $03F5,  $03C5,  $0176,  $00D2   ; D2D9   03F5 03C5 0176 00D2
        DECLE   $03A6,  $0264,  $00F8,  $0008   ; D2DD   03A6 0264 00F8 0008
        DECLE   $02FB,  $01AC,  $00DB,  $01CB   ; D2E1   02FB 01AC 00DB 01CB
        DECLE   $00C6,  $0095,  $0209           ; D2E5   00C6 0095 0209
L_D2E8:
        XOR     .BTAB.D9,R3                     ; D2E8   03C3 02D9
        DECLE   $01DF,  $026E,  $0146,  $00CE   ; D2EA   01DF 026E 0146 00CE
        DECLE   $01AD,  $00B5,  $00B4,  $0246   ; D2EE   01AD 00B5 00B4 0246
        DECLE   $01F6,  $022C,  $02CD,  $03CA   ; D2F2   01F6 022C 02CD 03CA
        DECLE   $0332,  $00F3,  $0140,  $0203   ; D2F6   0332 00F3 0140 0203
        DECLE   $021C,  $0187,  $02E6,  $00A5   ; D2FA   021C 0187 02E6 00A5
        DECLE   $01FF,  $02E1,  $00F1,  $001F   ; D2FE   01FF 02E1 00F1 001F

        ADDR    R0,     R7                      ; D302   00C7
        SUBR    R4,     R7                      ; D303   0127

        ADDR    R1,     R6                      ; D304   00CE
L_D305:
        CMPI    #$0124, R3                      ; D305   037B 0124
        ADDR    R3,     R4                      ; D307   00DC
        SUB@    R3,     R1                      ; D308   0319
        XORI    #$034C, R2                      ; D309   03FA 034C
        ADD@    R5,     R7                      ; D30B   02EF

        DECLE   $01C8,  $0012,  $0381,  $0287   ; D30C   01C8 0012 0381 0287
        DECLE   $0219,  $038E,  $0183,  $0366   ; D310   0219 038E 0183 0366
        DECLE   $00A5,  $0305,  $0266,  $0349   ; D314   00A5 0305 0266 0349
        DECLE   $0187,  $01BA,  $0186,  $00CE   ; D318   0187 01BA 0186 00CE
        DECLE   $01EF,  $0015,  $00B8,  $0233   ; D31C   01EF 0015 00B8 0233

        ADDI    #$034C, R2                      ; D320   02FA 034C
        ADDR    R3,     R7                      ; D322   00DF

        DECLE   $03CB,  $02E5,  $0200,  $0094   ; D323   03CB 02E5 0200 0094
        DECLE   $0084,  $00C8,  $03E9,  $01C9   ; D327   0084 00C8 03E9 01C9
        DECLE   $0001,  $00E6,  $001D,  $01C9   ; D32B   0001 00E6 001D 01C9
        DECLE   $03DA,  $0070,  $0000           ; D32F   03DA 0070 0000

        ANDR    R0,     R0                      ; D332   0180
        SUB@    R3,     R0                      ; D333   0318
        CMPR    R1,     R4                      ; D334   014C
        SUBR    R7,     R2                      ; D335   013A
        ADDI    #$0107, R5                      ; D336   02FD 0107
        XOR@    R2,     R3                      ; D338   03D3
        ANDI    #$0089, R6                      ; D339   03BE 0089
        SUBR    R5,     R7                      ; D33B   012F

        MOVR    R3,     R4                      ; D33C   009C
        SUB@    R1,     R7                      ; D33D   030F

        DECLE   $0039,  $03E0,  $03FB,  $00D0   ; D33E   0039 03E0 03FB 00D0
        DECLE   $0199,  $034E,  $02C8,  $00F7   ; D342   0199 034E 02C8 00F7

        RLC     R2,     2                       ; D346   0056
        ANDR    R4,     R6                      ; D347   01A6
        ANDR    R0,     R1                      ; D348   0181
        XORR    R3,     R0                      ; D349   01D8
        MVI@    R1,     R4                      ; D34A   028C
        XOR@    R4,     R5                      ; D34B   03E5
        COMR    R2                              ; D34C   001A
        TSTR    R0                              ; D34D   0080
        ADD@    R1,     R0                      ; D34E   02C8
        SUB@    R3,     R7                      ; D34F   031F

        SUBR    R3,     R6                      ; D350   011E
        MVO@    R5,     R4                      ; D351   0265
        ADDR    R4,     R7                      ; D352   00E7

        AND@    R1,     R4                      ; D353   038C
        AND@    R6,     R0                      ; D354   03B0
        XORR    R7,     R6                      ; D355   01FE
        SUBR    R2,     R7                      ; D356   0117

        DECLE   $03A5,  $0023,  $008E,  $00B7   ; D357   03A5 0023 008E 00B7
        DECLE   $0311,  $01BB,  $038D,  $0139   ; D35B   0311 01BB 038D 0139
        DECLE   $02FB,  $0046,  $0381,  $007B   ; D35F   02FB 0046 0381 007B
        DECLE   $0390,  $034B,  $00AC,  $03F3   ; D363   0390 034B 00AC 03F3
        DECLE   $0241,  $0040,  $0320,  $0066   ; D367   0241 0040 0320 0066
        DECLE   $00AE,  $0001                   ; D36B   00AE 0001

        BC      L_D496                          ; D36D   0201 0127

        COMR    R6                              ; D36F   001E
        SUBI    #$01AE, R1                      ; D370   0339 01AE
        ANDI    #$0389, R2                      ; D372   03BA 0389
        SUBR    R4,     R7                      ; D374   0127

        DECLE   $0086,  $019B,  $0198,  $0012   ; D375   0086 019B 0198 0012
        DECLE   $01F0,  $030D,  $013D,  $00F5   ; D379   01F0 030D 013D 00F5
        DECLE   $0105,  $02C3,  $001A,  $008E   ; D37D   0105 02C3 001A 008E
        DECLE   $02EC,  $019C,  $003A,  $02C9   ; D381   02EC 019C 003A 02C9
        DECLE   $00F7,  $0258,  $015F,  $0140   ; D385   00F7 0258 015F 0140
        DECLE   $01E4,  $028B,  $03CC,  $0122   ; D389   01E4 028B 03CC 0122
        DECLE   $03F5,  $0387                   ; D38D   03F5 0387

        CLRR    R2                              ; D38F   01D2
        INCR    R4                              ; D390   000C
        AND     G_036B, R6                      ; D391   0386 036B
        ANDR    R3,     R4                      ; D393   019C
        ADDR    R5,     R4                      ; D394   00EC
        SUBR    R5,     R0                      ; D395   0128
        ADDR    R7,     R0                      ; D396   00F8
        MVO@    R4,     R3                      ; D397   025C
        XOR@    R4,     R5                      ; D398   03E5
        XORR    R3,     R1                      ; D399   01D9
        CLRR    R3                              ; D39A   01DB
        AND@    R1,     R6                      ; D39B   038E
        ADD@    R1,     R4                      ; D39C   02CC
        SUBR    R0,     R7                      ; D39D   0107

        SUBR    R3,     R6                      ; D39E   011E
        MVO@    R3,     R1                      ; D39F   024B
        ADDR    R0,     R1                      ; D3A0   00C1
        SUB@    R5,     R7                      ; D3A1   032F

        DECLE   $0170,  $01AF,  $019C,  $03F6   ; D3A2   0170 01AF 019C 03F6
        DECLE   $02C8,  $00F7,  $004A,  $03CE   ; D3A6   02C8 00F7 004A 03CE
        DECLE   $0202,  $01D8,  $038F,  $02CC   ; D3AA   0202 01D8 038F 02CC
        DECLE   $010B,  $03F7,  $01C5,  $00C2   ; D3AE   010B 03F7 01C5 00C2
        DECLE   $001E,  $030C,  $02CC,  $009C   ; D3B2   001E 030C 02CC 009C
        DECLE   $00A1,  $01C7,  $01FC,  $023E   ; D3B6   00A1 01C7 01FC 023E
        DECLE   $02C7,  $0199,  $00F6,  $02C9   ; D3BA   02C7 0199 00F6 02C9
        DECLE   $0118,  $0242,  $03E6,  $019B   ; D3BE   0118 0242 03E6 019B
        DECLE   $019B,  $0399,  $0324,  $03C8   ; D3C2   019B 0399 0324 03C8
        DECLE   $03A7                           ; D3C6   03A7

        RRC     R2,     2                       ; D3C7   0076
        ADDR    R5,     R1                      ; D3C8   00E9
        SUB@    R6,     R7                      ; D3C9   0337

        CMPR    R1,     R4                      ; D3CA   014C
        CMPR    R2,     R7                      ; D3CB   0157
        BLT     L_D716                          ; D3CC   0205 0348

        ANDR    R2,     R3                      ; D3CE   0193
        ADD@    R5,     R7                      ; D3CF   02EF

        ADDR    R4,     R2                      ; D3D0   00E2
        CMP@    R5,     R5                      ; D3D1   036D
        ANDR    R3,     R4                      ; D3D2   019C
        SLLC    R2,     2                       ; D3D3   005E
        MOVR    R5,     R3                      ; D3D4   00AB
        XORR    R6,     R0                      ; D3D5   01F0
        GSWD    R2                              ; D3D6   0032
        XORR    R6,     R5                      ; D3D7   01F5
L_D3D8:
        DECR    R7                              ; D3D8   0017

        DECLE   $018F,  $039F                   ; D3D9   018F 039F

        XOR@    R1,     R4                      ; D3DB   03CC
        CMPR    R5,     R6                      ; D3DC   016E
        SUBR    R0,     R5                      ; D3DD   0105
        CMPR    R0,     R6                      ; D3DE   0146
        MVI@    R2,     R3                      ; D3DF   0293
        MVI@    R5,     R7                      ; D3E0   02AF

        ADDR    R4,     R0                      ; D3E1   00E0
        XOR@    R5,     R4                      ; D3E2   03EC
        ANDR    R3,     R4                      ; D3E3   019C
        MVO@    R0,     R3                      ; D3E4   0258
        MVI@    R1,     R3                      ; D3E5   028B
        ADCR    R7                              ; D3E6   002F

        SLLC    R0,     2                       ; D3E7   005C
L_D3E8:
        CMPR    R6,     R6                      ; D3E8   0176
        DECLE   $0203,  $0184,  $039F,  $0064   ; D3E9   0203 0184 039F 0064
        DECLE   $0100,  $0000                   ; D3ED   0100 0000

        SWAP    R0,     1                       ; D3EF   0040
        ADDR    R7,     R4                      ; D3F0   00FC
        SUB@    R1,     R7                      ; D3F1   030F

        MVI@    R4,     R4                      ; D3F2   02A4
        B       L_D476                          ; D3F3   0200 0081

        DECLE   $0068,  $0210                   ; D3F5   0068 0210
L_D3F7:
        SUB@    R3,     R6                      ; D3F7   031E
        XORR    R1,     R4                      ; D3F8   01CC
        CMPR    R7,     R2                      ; D3F9   017A
        CLRR    R4                              ; D3FA   01E4
        CMPR    R0,     R1                      ; D3FB   0141
        MOVR    R2,     R3                      ; D3FC   0093
        SAR     R0,     2                       ; D3FD   006C
        AND@    R2,     R0                      ; D3FE   0390
        ANDR    R1,     R0                      ; D3FF   0188
        MOVR    R3,     R5                      ; D400   009D
        MOVR    R3,     R5                      ; D401   009D
        AND     .BTAB.20,R0                     ; D402   0380 0220
        XORI    #$00F7, R6                      ; D404   03FE 00F7
        ANDR    R3,     R0                      ; D406   0198
        ANDR    R7,     R0                      ; D407   01B8
        SUBR    R5,     R4                      ; D408   012C
        ADDR    R3,     R7                      ; D409   00DF

        DECLE   $0254,  $0185,  $017F,  $0108   ; D40A   0254 0185 017F 0108
        DECLE   $03AE,  $03CC,  $0175,  $0005   ; D40E   03AE 03CC 0175 0005
        DECLE   $028D,  $01B2,  $02FD,  $0260   ; D412   028D 01B2 02FD 0260
        DECLE   $03CB,  $019C,  $025E,  $01AB   ; D416   03CB 019C 025E 01AB
        DECLE   $007F,  $025A,  $03A6,  $01BF   ; D41A   007F 025A 03A6 01BF
        DECLE   $0170,  $02A0,  $01CC,  $0183   ; D41E   0170 02A0 01CC 0183
        DECLE   $000A,  $01C7                   ; D422   000A 01C7

        ANDR    R0,     R3                      ; D424   0183
        ADD@    R5,     R7                      ; D425   02EF

        ADD@    R6,     R0                      ; D426   02F0
        SUB@    R5,     R4                      ; D427   032C
        MOVR    R3,     R4                      ; D428   009C
        ADDI    #$014B, R7                      ; D429   02FF 014B

L_D42B:
        SUBR    R7,     R4                      ; D42B   013C
        DECLE   $035E,  $0060,  $019E,  $015A   ; D42C   035E 0060 019E 015A
        DECLE   $000C,  $00F8,  $008C,  $03E4   ; D430   000C 00F8 008C 03E4
        DECLE   $02D6,  $01AB,  $0191,  $0106   ; D434   02D6 01AB 0191 0106
        DECLE   $025F,  $0038,  $0280,  $02C3   ; D438   025F 0038 0280 02C3
        DECLE   $01F7                           ; D43C   01F7

        ADCR    R6                              ; D43D   002E
        MVO@    R0,     R3                      ; D43E   0258
        SUB@    R5,     R1                      ; D43F   0329
        MVI@    R3,     R7                      ; D440   029F

        DECLE   $0060,  $0219,  $0370,  $0263   ; D441   0060 0219 0370 0263
        DECLE   $029B,  $0251,  $0032,  $00C9   ; D445   029B 0251 0032 00C9
        DECLE   $03B9,  $0205,  $034C,  $01AD   ; D449   03B9 0205 034C 01AD
        DECLE   $0240,  $0233,  $0272,  $018C   ; D44D   0240 0233 0272 018C
        DECLE   $00E0,  $0012,  $0180,  $027F   ; D451   00E0 0012 0180 027F

        MVO@    R3,     R5                      ; D455   026B
        SUBI    #$02A7, R1                      ; D456   0339 02A7
        ADDR    R3,     R4                      ; D458   00DC
        XORR    R5,     R0                      ; D459   01E8
        XORR    R7,     R4                      ; D45A   01FC
        SUB     .BTAB.A1,R3                     ; D45B   0303 02A1
        MVO@    R5,     R3                      ; D45D   025D
        GSWD    R2                              ; D45E   0032
        SUBR    R1,     R5                      ; D45F   010D
        AND@    R6,     R1                      ; D460   03B1
        SUB     G_034F, R7                      ; D461   0307 034F

        CMP@    R6,     R3                      ; D463   0373
L_D464:
        DECR    R7                              ; D464   0017
        SUBR    R5,     R7                      ; D465   012F

        MVI@    R2,     R4                      ; D466   0294
        ANDR    R7,     R1                      ; D467   01B9
        BEQ     L_D1AA                          ; D468   0224 02BF

        XORR    R6,     R0                      ; D46A   01F0
        XOR     G_0363, R2                      ; D46B   03C2 0363
        XORR    R1,     R5                      ; D46D   01CD
        MVI@    R2,     R5                      ; D46E   0295
        SUB@    R6,     R2                      ; D46F   0332
        ADCR    R6                              ; D470   002E
        XORI    #$011D, R1                      ; D471   03F9 011D
        MVO@    R5,     R1                      ; D473   024D
        ANDI    #$0007, R0                      ; D474   03B8 0007
L_D476:
        MVI@    R5,     R7                      ; D476   02AF

        DECLE   $02B4,  $01D9,  $0326,  $03BF   ; D477   02B4 01D9 0326 03BF
        DECLE   $01B0,  $03E0,  $015D,  $017E   ; D47B   01B0 03E0 015D 017E
        DECLE   $02A5,  $02FC,  $01CA,  $0001   ; D47F   02A5 02FC 01CA 0001
        DECLE   $00A6,  $001D,  $00F0,  $01DA   ; D483   00A6 001D 00F0 01DA
        DECLE   $027E,  $02C6,  $02BF,  $037F   ; D487   027E 02C6 02BF 037F
        DECLE   $0045,  $0071,  $03F7,  $0282   ; D48B   0045 0071 03F7 0282
        DECLE   $0215,  $00CE,  $0277,  $0016   ; D48F   0215 00CE 0277 0016
        DECLE   $00B8,  $023D                   ; D493   00B8 023D

        ADDR    R7,     R2                      ; D495   00FA
L_D496:
        CMP@    R1,     R4                      ; D496   034C
        DECLE   $00C3,  $01CE,  $01D2,  $0001   ; D497   00C3 01CE 01D2 0001
        DECLE   $0247,  $020B,  $03F9,  $0369   ; D49B   0247 020B 03F9 0369
        DECLE   $02A4,  $0000,  $024C,  $0240   ; D49F   02A4 0000 024C 0240
        DECLE   $011B,  $03EF,  $030A,  $0001   ; D4A3   011B 03EF 030A 0001

        ADDR    R4,     R5                      ; D4A7   00E5
L_D4A8:
        DECR    R3                              ; D4A8   0013
        DECLE   $01B1,  $01EE,  $0315,  $0002   ; D4A9   01B1 01EE 0315 0002
        DECLE   $0146,  $0338,  $0301,  $03B0   ; D4AD   0146 0338 0301 03B0
        DECLE   $00E1,  $0000,  $01B2,  $0018   ; D4B1   00E1 0000 01B2 0018
        DECLE   $01CD,  $010B,  $020B           ; D4B5   01CD 010B 020B

        SUBR    R1,     R1                      ; D4B8   0109
        XORR    R4,     R3                      ; D4B9   01E3
L_D4BA:
        CMP@    R5,     R7                      ; D4BA   036F
        RRC     R0,     1                       ; D4BB   0070
        MOVR    R1,     R4                      ; D4BC   008C
        MOVR    R4,     R5                      ; D4BD   00A5
        CMP@    R5,     R1                      ; D4BE   0369
        INCR    R0                              ; D4BF   0008
        SUB@    R4,     R0                      ; D4C0   0320
        XORR    R4,     R1                      ; D4C1   01E1
        SARC    R0,     1                       ; D4C2   0078
        MOVR    R4,     R7                      ; D4C3   00A7

        DECLE   $03C1,  $0200,  $0000           ; D4C4   03C1 0200 0000

        B       L_D809                          ; D4C7   0200 0340
        MOVR    R3,     R7                      ; D4C9   009F

        DECLE   $00A1,  $027F                   ; D4CA   00A1 027F

        CMP     G_01A1, R4                      ; D4CC   0344 01A1
        ADDR    R5,     R0                      ; D4CE   00E8
        MOVR    R5,     R0                      ; D4CF   00A8
        NEGR    R1                              ; D4D0   0021
        B       L_D8B6                          ; D4D1   0200 03E3

        XORR    R4,     R1                      ; D4D3   01E1
        SUB@    R1,     R0                      ; D4D4   0308
        MOVR    R4,     R7                      ; D4D5   00A7

        SWAP    R1,     1                       ; D4D6   0041
        INCR    R0                              ; D4D7   0008
        SUBR    R5,     R0                      ; D4D8   0128
        B       L_D233                          ; D4D9   0220 02A7

        DECLE   $0098,  $0101,  $0038,  $0300   ; D4DB   0098 0101 0038 0300
        DECLE   $00A1,  $0110,  $0098,  $0061   ; D4DF   00A1 0110 0098 0061
        DECLE   $03C0,  $0003,  $0202,  $02B7   ; D4E3   03C0 0003 0202 02B7
        DECLE   $01A0,  $016E,  $014B,  $0128   ; D4E7   01A0 016E 014B 0128
        DECLE   $0266,  $01F5,  $01DC,  $019F   ; D4EB   0266 01F5 01DC 019F
L_D4EF:
        MOVR    R4,     R2                      ; D4EF   00A2
        XOR@    R4,     R5                      ; D4F0   03E5
        SWAP    R1,     2                       ; D4F1   0045
        TSTR    R0                              ; D4F2   0080
        XOR@    R1,     R1                      ; D4F3   03C9
        ADD@    R6,     R2                      ; D4F4   02F2
        ADDI    #$014C, R1                      ; D4F5   02F9 014C
        CMPR    R6,     R7                      ; D4F7   0177
        SUBR    R2,     R3                      ; D4F8   0113
        TSTR    R1                              ; D4F9   0089
        ADD     G_034F, R2                      ; D4FA   02C2 034F
        XORR    R5,     R2                      ; D4FC   01EA
        ADDR    R1,     R3                      ; D4FD   00CB
        ANDR    R3,     R5                      ; D4FE   019D
        XORR    R3,     R2                      ; D4FF   01DA
        ANDR    R1,     R3                      ; D500   018B
        SUBR    R6,     R0                      ; D501   0130
        MVO@    R4,     R2                      ; D502   0254
        CLRR    R6                              ; D503   01F6
        SUBR    R2,     R7                      ; D504   0117

        DECLE   $014B,  $03A5,  $0264,  $031C   ; D505   014B 03A5 0264 031C
        DECLE   $0001,  $0038,  $03FC,  $0315   ; D509   0001 0038 03FC 0315
        DECLE   $014C,  $0156,  $0203,  $0147   ; D50D   014C 0156 0203 0147
        DECLE   $02C4,  $021F,  $00E8,  $006A   ; D511   02C4 021F 00E8 006A
        DECLE   $019D,  $00BA,  $002A,  $00F0   ; D515   019D 00BA 002A 00F0
        DECLE   $028A,  $03F5,  $00D3,  $0137   ; D519   028A 03F5 00D3 0137
        DECLE   $00A5,  $03CD,  $0139,  $0203   ; D51D   00A5 03CD 0139 0203
        DECLE   $0149,  $0044,  $021F,  $02EA   ; D521   0149 0044 021F 02EA
        DECLE   $00C9,  $00A5,  $03CB,  $01C2   ; D525   00C9 00A5 03CB 01C2
        DECLE   $01F8,  $001E,  $01C0,  $00A1   ; D529   01F8 001E 01C0 00A1
        DECLE   $03B7,  $0042,  $0300,  $0221   ; D52D   03B7 0042 0300 0221
        DECLE   $0227,  $00A7,  $001F,  $01C7   ; D531   0227 00A7 001F 01C7
        DECLE   $0300,  $0041,  $02E0,  $00A0   ; D535   0300 0041 02E0 00A0
        DECLE   $03E1,  $0200,  $0320,  $0023   ; D539   03E1 0200 0320 0023
        DECLE   $0038,  $01A7,  $00BA,  $00E9   ; D53D   0038 01A7 00BA 00E9
        DECLE   $0170,  $0286,  $03A5,  $0301   ; D541   0170 0286 03A5 0301
        DECLE   $0167,  $00A0,  $038D,  $0119   ; D545   0167 00A0 038D 0119
        DECLE   $0206,  $028B,  $0213           ; D549   0206 028B 0213

        ADD@    R1,     R7                      ; D54C   02CF

        SAR     R0,     1                       ; D54D   0068
        INCR    R3                              ; D54E   000B
        ANDR    R5,     R5                      ; D54F   01AD
        ANDR    R5,     R6                      ; D550   01AE
        ADD@    R1,     R1                      ; D551   02C9
        MOVR    R1,     R7                      ; D552   008F

        DECLE   $026C,  $019D,  $0180,  $0198   ; D553   026C 019D 0180 0198
        DECLE   $0294,  $018C,  $0162,  $010B   ; D557   0294 018C 0162 010B
        DECLE   $010B,  $03A3,  $024E,  $01EC   ; D55B   010B 03A3 024E 01EC
        DECLE   $03EB,  $018C,  $025C,  $014B   ; D55F   03EB 018C 025C 014B
        DECLE   $0130,  $027C                   ; D563   0130 027C

        XOR@    R4,     R4                      ; D565   03E4
        SUBR    R3,     R1                      ; D566   0119
        ANDR    R3,     R3                      ; D567   019B
        MOVR    R3,     R7                      ; D568   009F

        XORR    R4,     R5                      ; D569   01E5
        SUBR    R3,     R4                      ; D56A   011C
        MOVR    R1,     R6                      ; D56B   008E
        DECR    R0                              ; D56C   0010
        ADDR    R7,     R4                      ; D56D   00FC
        SUB@    R1,     R0                      ; D56E   0308
        SLR     R0,     2                       ; D56F   0064
        CMPR    R0,     R7                      ; D570   0147
        AND@    R1,     R4                      ; D571   038C
        SLLC    R1,     1                       ; D572   0059
        SUB@    R1,     R4                      ; D573   030C
        SUB     G_014C, R2                      ; D574   0302 014C
L_D576:
        CMPR    R7,     R7                      ; D576   017F
        DECLE   $021E,  $0186,  $01D4,  $023F   ; D577   021E 0186 01D4 023F
        DECLE   $01E6,  $004D,  $00A5,  $039F   ; D57B   01E6 004D 00A5 039F
        DECLE   $0000,  $0004,  $0240,  $03FF   ; D57F   0000 0004 0240 03FF
        DECLE   $0197,  $02CC,  $028D,  $00D8   ; D583   0197 02CC 028D 00D8
        DECLE   $028C,  $01E6,  $0015,  $0167   ; D587   028C 01E6 0015 0167
        DECLE   $03A3,  $034C,  $018D,  $0014   ; D58B   03A3 034C 018D 0014
        DECLE   $024D,  $00B1,  $01DF,  $03E4   ; D58F   024D 00B1 01DF 03E4
        DECLE   $0207,  $019D,  $02BC,  $01AD   ; D593   0207 019D 02BC 01AD
        DECLE   $0168,  $0288,  $01E5,  $0050   ; D597   0168 0288 01E5 0050
        DECLE   $00FF                           ; D59B   00FF

        ANDR    R6,     R0                      ; D59C   01B0
        XOR@    R1,     R4                      ; D59D   03CC
        ANDR    R1,     R5                      ; D59E   018D
        CLRC                                    ; D59F   0006
        SUBR    R1,     R1                      ; D5A0   0109
        XOR     .BTAB.EE,R4                     ; D5A1   03C4 02EE
        SLLC    R2,     2                       ; D5A3   005E
        SAR     R3,     1                       ; D5A4   006B
        ANDR    R3,     R5                      ; D5A5   019D
        ANDI    #$03CB, R6                      ; D5A6   03BE 03CB
        ADDR    R1,     R7                      ; D5A8   00CF

        DECLE   $028A,  $01DE,  $0013,  $0183   ; D5A9   028A 01DE 0013 0183
        DECLE   $00A0,  $014D,  $017E,  $03FF   ; D5AD   00A0 014D 017E 03FF

        SUB@    R1,     R0                      ; D5B1   0308
        MOVR    R6,     R3                      ; D5B2   00B3
        CMP@    R1,     R7                      ; D5B3   034F
        CMPR    R3,     R4                      ; D5B4   015C
        SLL     R3,     1                       ; D5B5   004B
        MOVR    R4,     R5                      ; D5B6   00A5
        SUB@    R4,     R3                      ; D5B7   0323
        MOVR    R0,     R7                      ; D5B8   0087

        SUB@    R5,     R4                      ; D5B9   032C
        SWAP    R1,     2                       ; D5BA   0045
        SUB@    R1,     R0                      ; D5BB   0308
        MOVR    R3,     R7                      ; D5BC   009F

        AND@    R4,     R3                      ; D5BD   03A3
        INCR    R6                              ; D5BE   000E
        SUB@    R3,     R0                      ; D5BF   0318
        XORR    R0,     R2                      ; D5C0   01C2
        B       L_D42B                          ; D5C1   0220 0197

        DECLE   $00E8,  $03AA,  $00D0,  $026A   ; D5C3   00E8 03AA 00D0 026A
        DECLE   $01FE,  $0019,  $0193,  $00A3   ; D5C7   01FE 0019 0193 00A3
        DECLE   $0065,  $0137                   ; D5CB   0065 0137

        AND     .STIC.X.1,R0                    ; D5CD   0380 0001
        SUB@    R1,     R6                      ; D5CF   030E
        COMR    R6                              ; D5D0   001E
        ANDR    R1,     R5                      ; D5D1   018D
        SUBR    R6,     R3                      ; D5D2   0133
        SUB     G_00C9, R7                      ; D5D3   0307 00C9

        DECLE   $01B3,  $001C,  $000C,  $016B   ; D5D5   01B3 001C 000C 016B
        DECLE   $009D,  $0001,  $0000           ; D5D9   009D 0001 0000

        INCR    R0                              ; D5DC   0008
        B       L_D3F7                          ; D5DD   0220 01E7

        DECLE   $00A0,  $007F,  $0007,  $023C   ; D5DF   00A0 007F 0007 023C

        ANDR    R4,     R3                      ; D5E3   01A3
L_D5E4:
        DECR    R7                              ; D5E4   0017

        ANDR    R4,     R0                      ; D5E5   01A0
        XORR    R5,     R2                      ; D5E6   01EA
        ADDR    R1,     R2                      ; D5E7   00CA
        SWAP    R1,     1                       ; D5E8   0041
        SARC    R0,     1                       ; D5E9   0078
        XORR    R7,     R6                      ; D5EA   01FE
        MOVR    R2,     R6                      ; D5EB   0096
        CMPR    R3,     R3                      ; D5EC   015B
        AND@    R5,     R4                      ; D5ED   03AC
        XOR@    R4,     R4                      ; D5EE   03E4
        NEGR    R2                              ; D5EF   0022
        AND     .STIC.Y.0,R0                    ; D5F0   0380 0008
        SUBR    R1,     R2                      ; D5F2   010A
        COMR    R6                              ; D5F3   001E
        ANDR    R1,     R5                      ; D5F4   018D
        CMPR    R4,     R3                      ; D5F5   0163
        SUB@    R1,     R1                      ; D5F6   0309
        CMPR    R1,     R1                      ; D5F7   0149
        XOR     .BTAB.9F,R4                     ; D5F8   03C4 029F
        MVO@    R4,     R4                      ; D5FA   0264
        ANDR    R5,     R2                      ; D5FB   01AA
        MOVR    R4,     R5                      ; D5FC   00A5
        ADDR    R4,     R3                      ; D5FD   00E3
        XORR    R0,     R1                      ; D5FE   01C1
        SUBR    R0,     R4                      ; D5FF   0104
        XOR@    R4,     R0                      ; D600   03E0
        MVO@    R0,     R1                      ; D601   0248
        MOVR    R3,     R7                      ; D602   009F
        ADDR    R3,     R7                      ; D603   00DF
        B       L_D909                          ; D604   0200 0303

        DECLE   $01DF,  $02D9,  $00A0,  $0061   ; D606   01DF 02D9 00A0 0061
        DECLE   $0008,  $0020,  $0040,  $0210   ; D60A   0008 0020 0040 0210
        DECLE   $019F                           ; D60E   019F

        CMP@    R5,     R2                      ; D60F   036A
        MVO@    R5,     R1                      ; D610   024D
        ADDR    R5,     R0                      ; D611   00E8
        MOVR    R1,     R4                      ; D612   008C
        XORR    R5,     R6                      ; D613   01EE
        ANDR    R3,     R1                      ; D614   0199
        CMPR    R5,     R7                      ; D615   016F
        AND@    R5,     R1                      ; D616   03A9
        XOR@    R4,     R4                      ; D617   03E4
        NEGR    R3                              ; D618   0023
        INCR    R6                              ; D619   000E
        SETC                                    ; D61A   0007
        SUB@    R2,     R1                      ; D61B   0311
        ADDR    R5,     R0                      ; D61C   00E8
        MVI@    R4,     R5                      ; D61D   02A5
        SUB     G_038F, R3                      ; D61E   0303 038F
        SETC                                    ; D620   0007
        SUBR    R1,     R7                      ; D621   010F

        DECLE   $02F8,  $030C,  $01FA,  $030D   ; D622   02F8 030C 01FA 030D
        DECLE   $0249,  $01B1,  $033F,  $03EE   ; D626   0249 01B1 033F 03EE
        DECLE   $008B,  $0195,  $014A,  $03CF   ; D62A   008B 0195 014A 03CF

        ADCR    R7                              ; D62E   002F

        MVO@    R4,     R1                      ; D62F   024C
L_D630:
        AND@    R6,     R5                      ; D630   03B5
        DECLE   $0244,  $0148,  $00A5,  $034D   ; D631   0244 0148 00A5 034D
        DECLE   $01DD,  $03FA,  $0109,  $02E4   ; D635   01DD 03FA 0109 02E4
        DECLE   $01FF,  $016E,  $004A,  $00A5   ; D639   01FF 016E 004A 00A5
        DECLE   $03F3,  $01CE,  $01FC,  $0060   ; D63D   03F3 01CE 01FC 0060
        DECLE   $0007,  $0198,  $00AE,  $03CF   ; D641   0007 0198 00AE 03CF
        DECLE   $00F7                           ; D645   00F7

        SARC    R0,     1                       ; D646   0078
        AND@    R4,     R5                      ; D647   03A5
        ADDR    R7,     R6                      ; D648   00FE
        CMPR    R2,     R0                      ; D649   0150
        AND@    R4,     R1                      ; D64A   03A1
        CMPR    R1,     R4                      ; D64B   014C
        XORR    R4,     R1                      ; D64C   01E1
        ADDR    R7,     R6                      ; D64D   00FE
        SUBR    R0,     R7                      ; D64E   0107

        DECLE   $0214,  $026F,  $0268,  $002A   ; D64F   0214 026F 0268 002A
        DECLE   $019D,  $00BE,  $018E,  $0128   ; D653   019D 00BE 018E 0128
        DECLE   $0264,  $03F4,  $0150,  $0147   ; D657   0264 03F4 0150 0147
        DECLE   $02A5,  $01CC,  $01CD,  $00FE   ; D65B   02A5 01CC 01CD 00FE
        DECLE   $0249,  $0381,  $02ED,  $00FF   ; D65F   0249 0381 02ED 00FF
        DECLE   $0363,  $030E,  $0001           ; D663   0363 030E 0001

        MOVR    R2,     R4                      ; D666   0094
        SUB@    R2,     R0                      ; D667   0310
        CMPR    R1,     R4                      ; D668   014C
        ADDR    R0,     R7                      ; D669   00C7

        SUB@    R2,     R6                      ; D66A   0316
        CMPR    R1,     R6                      ; D66B   014E
        SUBR    R3,     R7                      ; D66C   011F

        DECLE   $037F,  $01D8,  $0052,  $0000   ; D66D   037F 01D8 0052 0000

        SLL     R1,     1                       ; D671   0049
        XORR    R4,     R0                      ; D672   01E0
        SUBR    R0,     R6                      ; D673   0106
        MVI@    R2,     R2                      ; D674   0292
        INCR    R7                              ; D675   000F

        CLRR    R0                              ; D676   01C0
L_D677:
        SWAP    R0,     1                       ; D677   0040
        DECLE   $027E,  $0366,  $0263,  $028A   ; D678   027E 0366 0263 028A
        DECLE   $0328,  $0257,  $016F,  $00EC   ; D67C   0328 0257 016F 00EC
        DECLE   $03B3,  $0233                   ; D680   03B3 0233

        CMP     G_0354, R5                      ; D682   0345 0354
        SUB@    R1,     R3                      ; D684   030B
        MVI@    R3,     R7                      ; D685   029F

        DECLE   $0276,  $03D9,  $0299,  $0382   ; D686   0276 03D9 0299 0382
        DECLE   $0391,  $0351,  $0051,  $036B   ; D68A   0391 0351 0051 036B
        DECLE   $02B8,  $034C,  $03C0,  $0004   ; D68E   02B8 034C 03C0 0004
        DECLE   $037B,  $00AE,  $018D,  $036C   ; D692   037B 00AE 018D 036C
        DECLE   $02E5,  $0228                   ; D696   02E5 0228

        XOR@    R4,     R6                      ; D698   03E6
        XOR@    R1,     R5                      ; D699   03CD
        MVI@    R2,     R7                      ; D69A   0297

        DECLE   $024A,  $0275,  $0003,  $0380   ; D69B   024A 0275 0003 0380
        DECLE   $0010,  $024C,  $01B0,  $0007   ; D69F   0010 024C 01B0 0007
        DECLE   $0084,  $00FF,  $0260,  $0200   ; D6A3   0084 00FF 0260 0200
        DECLE   $03E8,  $0003,  $0370,  $024F   ; D6A7   03E8 0003 0370 024F
        DECLE   $021C,  $013F,  $0380,  $0091   ; D6AB   021C 013F 0380 0091
        DECLE   $00CC,  $0076,  $01C3,  $00F4   ; D6AF   00CC 0076 01C3 00F4
        DECLE   $00F7,  $02E6,  $01C7           ; D6B3   00F7 02E6 01C7

        SLR     R1,     2                       ; D6B6   0065
        DECR    R3                              ; D6B7   0013
        SLLC    R2,     1                       ; D6B8   005A
        MVO@    R6,     R4                      ; D6B9   0266
        XORR    R7,     R1                      ; D6BA   01F9
        ADD@    R6,     R7                      ; D6BB   02F7

        DECLE   $0285,  $0034,  $03A7,  $0050   ; D6BC   0285 0034 03A7 0050
        DECLE   $023B,  $02FD,  $0028,  $01E0   ; D6C0   023B 02FD 0028 01E0
        DECLE   $027B                           ; D6C4   027B

        TSTR    R4                              ; D6C5   00A4
L_D6C6:
        BC      L_D723                          ; D6C6   0201 005B

        CMPR    R1,     R7                      ; D6C8   014F
        ADDR    R2,     R0                      ; D6C9   00D0
        RRC     R3,     2                       ; D6CA   0077
        ADD     G_00EC, R3                      ; D6CB   02C3 00EC
        SUBR    R1,     R4                      ; D6CD   010C
        CLRR    R6                              ; D6CE   01F6
        SUBR    R5,     R2                      ; D6CF   012A
        SUBR    R4,     R5                      ; D6D0   0125
        SUB@    R2,     R0                      ; D6D1   0310
        RSWD    R3                              ; D6D2   003B
        ADDI    #$00D8, R6                      ; D6D3   02FE 00D8
        SUBR    R5,     R0                      ; D6D5   0128
        ADD@    R6,     R2                      ; D6D6   02F2
        INCR    R7                              ; D6D7   000F

        TSTR    R2                              ; D6D8   0092
L_D6D9:
        XORR    R3,     R0                      ; D6D9   01D8
        DECLE   $0264,  $01DD,  $00A9,  $007C   ; D6DA   0264 01DD 00A9 007C
        DECLE   $007F,  $03D9,  $003F           ; D6DE   007F 03D9 003F

        MOVR    R2,     R6                      ; D6E1   0096
        INCR    R7                              ; D6E2   000F

        DECLE   $03FF                           ; D6E3   03FF
L_D6E4:
        SUBR    R0,     R7                      ; D6E4   0107

        DECLE   $006C,  $0094,  $0391,  $0231   ; D6E5   006C 0094 0391 0231
        DECLE   $0300,  $03D3,  $0132,  $0369   ; D6E9   0300 03D3 0132 0369
        DECLE   $0034,  $0134,  $023F,  $01EB   ; D6ED   0034 0134 023F 01EB
        DECLE   $001F,  $039A,  $01FA,  $0018   ; D6F1   001F 039A 01FA 0018
        DECLE   $0211                           ; D6F5   0211

        CMPR    R7,     R7                      ; D6F6   017F
        XORR    R6,     R4                      ; D6F7   01F4
        SUBR    R0,     R7                      ; D6F8   0107

        DECLE   $0038,  $0000,  $004D,  $0310   ; D6F9   0038 0000 004D 0310
        DECLE   $0108,  $0000,  $0068,  $0108   ; D6FD   0108 0000 0068 0108
        DECLE   $019F,  $00DA,  $02A8,  $01E8   ; D701   019F 00DA 02A8 01E8
        DECLE   $0202,  $0394,  $0011,  $00CB   ; D705   0202 0394 0011 00CB
        DECLE   $0036                           ; D709   0036

        XORR    R2,     R4                      ; D70A   01D4
        ADDR    R7,     R0                      ; D70B   00F8
        ADDR    R7,     R2                      ; D70C   00FA
        ADDR    R1,     R7                      ; D70D   00CF

        DECLE   $01AD,  $0323,  $03E2,  $0001   ; D70E   01AD 0323 03E2 0001

        INCR    R0                              ; D712   0008
        DECR    R0                              ; D713   0010
        SUBR    R5,     R2                      ; D714   012A
        ADDR    R4,     R0                      ; D715   00E0
L_D716:
        COMR    R6                              ; D716   001E
        DECLE   $038F                           ; D717   038F

        MOVR    R1,     R0                      ; D718   0088
        SUBR    R5,     R2                      ; D719   012A
        XORR    R6,     R0                      ; D71A   01F0
        EIS                                     ; D71B   0002
        MVI     G_00CF, R0                      ; D71C   0280 00CF
        SUBR    R6,     R4                      ; D71E   0134
        XORR    R3,     R0                      ; D71F   01D8
        TSTR    R0                              ; D720   0080
        MVII    #$00E8, R1                      ; D721   02B9 00E8
L_D723:
        MVO@    R6,     R5                      ; D723   026E
        XORR    R3,     R5                      ; D724   01DD
        ADDR    R5,     R1                      ; D725   00E9
        MOVR    R1,     R4                      ; D726   008C
        CMPR    R7,     R1                      ; D727   0179
        CMPR    R5,     R7                      ; D728   016F
        SUB@    R2,     R5                      ; D729   0315
        MOVR    R2,     R7                      ; D72A   0097

        DECLE   $0300,  $0038,  $0205,  $0394   ; D72B   0300 0038 0205 0394
        DECLE   $0091,  $007C,  $03A9,  $0227   ; D72F   0091 007C 03A9 0227
        DECLE   $0388,  $0334,  $02DE,  $0008   ; D733   0388 0334 02DE 0008
        DECLE   $002B,  $02FD,  $01AD,  $0038   ; D737   002B 02FD 01AD 0038
        DECLE   $0199,  $016F,  $0246,  $0110   ; D73B   0199 016F 0246 0110
        DECLE   $0320,  $019E,  $02B1,  $0026   ; D73F   0320 019E 02B1 0026
        DECLE   $023A,  $0100,  $0071,  $01D7   ; D743   023A 0100 0071 01D7
        DECLE   $0038,  $0000,  $00A2,  $0210   ; D747   0038 0000 00A2 0210

        CMP@    R1,     R5                      ; D74B   034D
        ADDR    R3,     R2                      ; D74C   00DA
        SUBR    R0,     R7                      ; D74D   0107

        DECLE   $0051,  $0040,  $022E,  $0256   ; D74E   0051 0040 022E 0256

        MVI@    R4,     R6                      ; D752   02A6
        SAR     R1,     2                       ; D753   006D
L_D754:
        MVI     G_0064, R3                      ; D754   0283 0064
        DECLE   $0247,  $0015,  $0046,  $03B3   ; D756   0247 0015 0046 03B3
        DECLE   $0333,  $0248,  $0051,  $0310   ; D75A   0333 0248 0051 0310
        DECLE   $008B,  $0256,  $03D9,  $0219   ; D75E   008B 0256 03D9 0219
        DECLE   $0181,  $03E9,  $0157,  $03F5   ; D762   0181 03E9 0157 03F5
        DECLE   $0330,  $01EC,  $020C,  $03C0   ; D766   0330 01EC 020C 03C0
        DECLE   $0050,  $000A,  $00AE,  $00AD   ; D76A   0050 000A 00AE 00AD
        DECLE   $0001                           ; D76E   0001

        MVO     R0,     G_0104                  ; D76F   0240 0104
        XORR    R4,     R0                      ; D771   01E0
        ANDR    R5,     R0                      ; D772   01A8
        CMP@    R6,     R6                      ; D773   0376
        MVI@    R4,     R5                      ; D774   02A5
        PSHR    R0                              ; D775   0270
        INCR    R2                              ; D776   000A
        B       L_DA0D                          ; D777   0200 0294

        DECLE   $00D6,  $003B,  $0163,  $0158   ; D779   00D6 003B 0163 0158
        DECLE   $0105,  $0000,  $01A8,  $0267   ; D77D   0105 0000 01A8 0267
        DECLE   $023D,  $00A9,  $029A,  $0080   ; D781   023D 00A9 029A 0080
        DECLE   $03FD,  $02D3,  $0033,  $02DD   ; D785   03FD 02D3 0033 02DD
        DECLE   $0020,  $023B,  $0285,  $00FC   ; D789   0020 023B 0285 00FC
        DECLE   $035A,  $0319,  $01B5,  $001C   ; D78D   035A 0319 01B5 001C
        DECLE   $039A,  $035E,  $00B4,  $031C   ; D791   039A 035E 00B4 031C
        DECLE   $02CC,  $00CB,  $0009,  $0111   ; D795   02CC 00CB 0009 0111
        DECLE   $02C1,  $025F,  $0256,  $0366   ; D799   02C1 025F 0256 0366
        DECLE   $0265,  $020A,  $0128,  $03E0   ; D79D   0265 020A 0128 03E0
        DECLE   $014F,  $01AA,  $0009,  $0041   ; D7A1   014F 01AA 0009 0041
        DECLE   $0309,  $0011,  $007D,  $0009   ; D7A5   0309 0011 007D 0009
        DECLE   $0238,  $011F,  $0302,  $0146   ; D7A9   0238 011F 0302 0146
        DECLE   $03B3,  $0238,  $0106,  $00B4   ; D7AD   03B3 0238 0106 00B4
        DECLE   $002C,  $00C0,  $0234           ; D7B1   002C 00C0 0234

        XOR@    R3,     R1                      ; D7B4   03D9
        MVI@    R3,     R5                      ; D7B5   029D
        SUB@    R4,     R7                      ; D7B6   0327

        DECLE   $0068,  $03D8,  $0179,  $0339   ; D7B7   0068 03D8 0179 0339
        DECLE   $00EC,  $0250,  $03E1,  $0014   ; D7BB   00EC 0250 03E1 0014
        DECLE   $03DB,  $03B3,  $019C,  $02F6   ; D7BF   03DB 03B3 019C 02F6
        DECLE   $02A8,  $0221,  $000A,  $01D6   ; D7C3   02A8 0221 000A 01D6
        DECLE   $0298,  $024E,  $0270,  $031C   ; D7C7   0298 024E 0270 031C
        DECLE   $0071,  $01DD,  $0248,  $0050   ; D7CB   0071 01DD 0248 0050
        DECLE   $0120,  $0380,  $01EF,  $0244   ; D7CF   0120 0380 01EF 0244
        DECLE   $005C,  $03E3,  $038F,  $01CF   ; D7D3   005C 03E3 038F 01CF
        DECLE   $00C8,  $03B5,  $0235,  $0118   ; D7D7   00C8 03B5 0235 0118
        DECLE   $02FD,  $01D2,  $0206,  $0067   ; D7DB   02FD 01D2 0206 0067
        DECLE   $00F6,  $00D3,  $009E,  $0103   ; D7DF   00F6 00D3 009E 0103
        DECLE   $0169,  $02B4,  $0294,  $002A   ; D7E3   0169 02B4 0294 002A
        DECLE   $0207,  $01E3,  $00E8,  $00E1   ; D7E7   0207 01E3 00E8 00E1
        DECLE   $0000,  $0089,  $0010,  $03CD   ; D7EB   0000 0089 0010 03CD
        DECLE   $013D,  $022D,  $0151,  $03C1   ; D7EF   013D 022D 0151 03C1
        DECLE   $02CB,  $0150,  $00F2,  $038B   ; D7F3   02CB 0150 00F2 038B
        DECLE   $01C0,  $0000                   ; D7F7   01C0 0000

        SKIP                                    ; D7F9   0208
        ADDR    R2,     R2                      ; D7FA   00D2
        SARC    R1,     2                       ; D7FB   007D
        SARC    R3,     2                       ; D7FC   007F
        RSWD    R4                              ; D7FD   003C
        B       L_DAE6                          ; D7FE   0200 02E6

        MVO@    R3,     R5                      ; D800   026B
        SUB@    R1,     R4                      ; D801   030C
        MVI@    R4,     R7                      ; D802   02A7

        DECLE   $0170,  $018E,  $00AB,  $0149   ; D803   0170 018E 00AB 0149
        DECLE   $03C7,  $0000                   ; D807   03C7 0000
L_D809:
        DECR    R0                              ; D809   0010
        DECLE   $00C0,  $0009,  $0048,  $00C0   ; D80A   00C0 0009 0048 00C0
        DECLE   $0000                           ; D80E   0000

        MOVR    R0,     R1                      ; D80F   0081
        BNC     L_D851                          ; D810   0209 003F

        SWAP    R0,     1                       ; D812   0040
        SUB@    R3,     R6                      ; D813   031E
        SUBR    R0,     R7                      ; D814   0107

        DECLE   $0109,  $0208,  $00E3,  $000E   ; D815   0109 0208 00E3 000E
        DECLE   $0080,  $0309,  $000F,  $00E0   ; D819   0080 0309 000F 00E0
        DECLE   $0000                           ; D81D   0000

        SUBR    R0,     R0                      ; D81E   0100
        BNC     L_DA60                          ; D81F   0209 023F

        NEGR    R0                              ; D821   0020
        B       L_D8A4                          ; D822   0200 0080
        BNC     L_D826                          ; D824   0209 0000

L_D826:
        NEGR    R0                              ; D826   0020
        DECLE   $0100,  $013C,  $0009,  $0000   ; D827   0100 013C 0009 0000
        DECLE   $0000,  $00F2,  $0080,  $0109   ; D82B   0000 00F2 0080 0109
        DECLE   $0248,  $00C3,  $0102,  $0100   ; D82F   0248 00C3 0102 0100
        DECLE   $01C9,  $0000,  $0020,  $00F0   ; D833   01C9 0000 0020 00F0
        DECLE   $0080,  $0309,  $0000,  $0020   ; D837   0080 0309 0000 0020
        DECLE   $0000,  $00C0,  $01F9,  $0008   ; D83B   0000 00C0 01F9 0008
        DECLE   $0000                           ; D83F   0000

        ADD@    R6,     R0                      ; D840   02F0
        MOVR    R0,     R3                      ; D841   0083
        INCR    R1                              ; D842   0009
L_D843:
        SARC    R1,     1                       ; D843   0079
        COMR    R4                              ; D844   001C
        COMR    R2                              ; D845   001A
        ADDR    R7,     R4                      ; D846   00FC
        BNC     L_D852                          ; D847   0209 0009

        SUB@    R4,     R0                      ; D849   0320
        XORR    R6,     R3                      ; D84A   01F3
        MOVR    R0,     R3                      ; D84B   0083
        MOVR    R3,     R1                      ; D84C   0099
        MVO@    R1,     R1                      ; D84D   0249
        ADDR    R7,     R6                      ; D84E   00FE
        XOR@    R6,     R2                      ; D84F   03F2
        ADDR    R7,     R4                      ; D850   00FC
L_D851:
        CMP@    R5,     R1                      ; D851   0369
L_D852:
        XORR    R6,     R0                      ; D852   01F0
        DECLE   $0005,  $0200,  $00C6,  $01F9   ; D853   0005 0200 00C6 01F9
        DECLE   $03F9,  $0104,  $031C,  $00C3   ; D857   03F9 0104 031C 00C3
        DECLE   $02C3,  $0056,  $0309,  $00E3   ; D85B   02C3 0056 0309 00E3
        DECLE   $03F8,  $02CA,  $0274,  $025C   ; D85F   03F8 02CA 0274 025C
        DECLE   $02E5,  $0062,  $0178,  $0243   ; D863   02E5 0062 0178 0243
        DECLE   $0129,  $02B5,  $00A4,  $001A   ; D867   0129 02B5 00A4 001A
        DECLE   $01B6,  $0035,  $031C,  $0078   ; D86B   01B6 0035 031C 0078
        DECLE   $019D,  $0072,  $0015,  $02FA   ; D86F   019D 0072 0015 02FA
        DECLE   $01A6,  $030D,  $0001,  $00D1   ; D873   01A6 030D 0001 00D1
        DECLE   $0218,  $014C,  $010B,  $010C   ; D877   0218 014C 010B 010C
        DECLE   $0384,  $00D2,  $039F           ; D87B   0384 00D2 039F

        MOVR    R1,     R3                      ; D87E   008B
        INCR    R3                              ; D87F   000B
        MOVR    R4,     R5                      ; D880   00A5
        SUB     .BTAB.BD,R5                     ; D881   0305 02BD
        NEGR    R3                              ; D883   0023
        SWAP    R0,     1                       ; D884   0040
        SLL     R3,     2                       ; D885   004F
        ANDR    R2,     R0                      ; D886   0190
        CLRR    R6                              ; D887   01F6
        MOVR    R0,     R7                      ; D888   0087

        ANDR    R6,     R0                      ; D889   01B0
        RLC     R2,     2                       ; D88A   0056
        XOR@    R3,     R6                      ; D88B   03DE
        MVI     .PSG0.envlp_hi,R6               ; D88C   0286 01F7
        MVI@    R3,     R2                      ; D88E   029A
        ADD@    R1,     R4                      ; D88F   02CC
        MOVR    R4,     R7                      ; D890   00A7
        BEQ     L_DB60                          ; D891   0204 02CD

        AND@    R6,     R2                      ; D893   03B2
        XORR    R1,     R6                      ; D894   01CE
        ADD@    R6,     R0                      ; D895   02F0
        CMP@    R5,     R7                      ; D896   036F
        MOVR    R2,     R4                      ; D897   0094
        SUBR    R4,     R1                      ; D898   0121
        CLRR    R1                              ; D899   01C9
        B       L_D4BA                          ; D89A   0220 03E1
        ADD@    R6,     R7                      ; D89C   02F7

        DECLE   $0098,  $03E1,  $01C0,  $002C   ; D89D   0098 03E1 01C0 002C
        DECLE   $023E,  $03D7                   ; D8A1   023E 03D7

        MOVR    R2,     R0                      ; D8A3   0090
L_D8A4:
        XORI    #$0042, R1                      ; D8A4   03F9 0042
        DECLE   $0120,  $023C,  $02FF,  $00A0   ; D8A6   0120 023C 02FF 00A0
        DECLE   $0329,  $0000                   ; D8AA   0329 0000

        SUBR    R0,     R0                      ; D8AC   0100
        SWAP    R0,     1                       ; D8AD   0040
        ADDR    R6,     R0                      ; D8AE   00F0
        ANDR    R2,     R0                      ; D8AF   0190
        CMP@    R3,     R6                      ; D8B0   035E
        XORR    R0,     R5                      ; D8B1   01C5
        ADDR    R1,     R0                      ; D8B2   00C8
        MOVR    R1,     R2                      ; D8B3   008A
        CLRR    R2                              ; D8B4   01D2
        ANDR    R2,     R4                      ; D8B5   0194
L_D8B6:
        ANDR    R4,     R3                      ; D8B6   01A3
        DECLE   $02A4,  $0308,  $0000           ; D8B7   02A4 0308 0000

        ADCR    R0                              ; D8BA   0028
        CMP@    R6,     R3                      ; D8BB   0373
        MVO@    R7,     R3                      ; D8BC   025F
        ANDR    R5,     R6                      ; D8BD   01AE
        MVI@    R3,     R2                      ; D8BE   029A
        CMPR    R4,     R7                      ; D8BF   0167

        JSRD    R5,     .EXEC.0C6               ; D8C0   0004 0112 00C6
        DECLE   $01BD,  $01D5,  $02D8,  $012A   ; D8C3   01BD 01D5 02D8 012A
        DECLE   $003E,  $0100,  $0049,  $0343   ; D8C7   003E 0100 0049 0343
        DECLE   $0180,  $0134,  $03C2,  $00F5   ; D8CB   0180 0134 03C2 00F5
        DECLE   $0200                           ; D8CF   0200

        CMPR    R0,     R3                      ; D8D0   0143
        ANDR    R5,     R6                      ; D8D1   01AE
        SUB@    R6,     R2                      ; D8D2   0332
        XOR@    R5,     R4                      ; D8D3   03EC
        AND@    R1,     R2                      ; D8D4   038A
        ADD@    R5,     R7                      ; D8D5   02EF

        DECLE   $00F0,  $03C1,  $0137,  $02B6   ; D8D6   00F0 03C1 0137 02B6
        DECLE   $036C,  $0199,  $014F,  $020A   ; D8DA   036C 0199 014F 020A
        DECLE   $0196                           ; D8DE   0196

        XORR    R0,     R6                      ; D8DF   01C6
        ANDI    #$01F7, R1                      ; D8E0   03B9 01F7
        SUBR    R2,     R7                      ; D8E2   0117

        DECLE   $013B,  $00C2,  $0000,  $0200   ; D8E3   013B 00C2 0000 0200
        DECLE   $0043,  $023F,  $0140,  $0002   ; D8E7   0043 023F 0140 0002
        DECLE   $0082,  $0000                   ; D8EB   0082 0000

        SUBI    #$0253, R4                      ; D8ED   033C 0253
        SUBR    R5,     R7                      ; D8EF   012F

        SWAP    R2,     1                       ; D8F0   0042
        SUB@    R1,     R4                      ; D8F1   030C
        BESC    L_DC77                          ; D8F2   020F 0383

        TSTR    R4                              ; D8F4   00A4
        SUB@    R5,     R7                      ; D8F5   032F

        ADD@    R5,     R4                      ; D8F6   02EC
        SUBR    R1,     R3                      ; D8F7   010B
        ADD@    R2,     R0                      ; D8F8   02D0
        MOVR    R1,     R0                      ; D8F9   0088
        SUB@    R3,     R4                      ; D8FA   031C
        B       L_DC9D                          ; D8FB   0200 03A0

        CMP@    R4,     R0                      ; D8FD   0360
        ANDR    R3,     R1                      ; D8FE   0199
        CMPR    R6,     R7                      ; D8FF   0177
        COMR    R0                              ; D900   0018
        SUBR    R3,     R3                      ; D901   011B
        NEGR    R6                              ; D902   0026
        XORR    R4,     R0                      ; D903   01E0
        ADD     G_03DD, R5                      ; D904   02C5 03DD
        SUB@    R5,     R2                      ; D906   032A
        ADD@    R5,     R4                      ; D907   02EC
        SUB@    R1,     R4                      ; D908   030C
L_D909:
        ADD@    R2,     R0                      ; D909   02D0
        DECLE   $0088,  $031C,  $0100,  $0378   ; D90A   0088 031C 0100 0378
        DECLE   $015E,  $004A,  $0008,  $011C   ; D90E   015E 004A 0008 011C
        DECLE   $0012,  $0038,  $006A,  $0199   ; D912   0012 0038 006A 0199
        DECLE   $01D7,  $0212                   ; D916   01D7 0212

        ANDR    R2,     R6                      ; D918   0196
        ADDR    R4,     R7                      ; D919   00E7

        MVI@    R4,     R1                      ; D91A   02A1
        XOR     G_0159, R5                      ; D91B   03C5 0159
        SUBI    #$01EC, R3                      ; D91D   033B 01EC
        SUB@    R1,     R7                      ; D91F   030F

        DECLE   $02D0,  $00F0,  $032C,  $01FF   ; D920   02D0 00F0 032C 01FF
        DECLE   $03A8,  $0162,  $0199,  $020F   ; D924   03A8 0162 0199 020F
        DECLE   $0210,  $021A,  $0308,  $02C0   ; D928   0210 021A 0308 02C0
        DECLE   $03C9,  $011A,  $034B,  $02EC   ; D92C   03C9 011A 034B 02EC
        DECLE   $0350,  $0360,  $0114,  $0000   ; D930   0350 0360 0114 0000

        ANDR    R6,     R2                      ; D934   01B2
        AND@    R1,     R6                      ; D935   038E
        CMP@    R5,     R2                      ; D936   036A
        ANDR    R3,     R2                      ; D937   019A
        MVI@    R5,     R7                      ; D938   02AF

        DECLE   $020C,  $0296,  $0228,  $01BF   ; D939   020C 0296 0228 01BF
        DECLE   $02CD,  $00DA,  $027B,  $0034   ; D93D   02CD 00DA 027B 0034
        DECLE   $0280,  $030C,  $0001,  $0113   ; D941   0280 030C 0001 0113
        DECLE   $033B,  $030F,  $0001,  $0069   ; D945   033B 030F 0001 0069
        DECLE   $001E,  $003F,  $0211,  $0050   ; D949   001E 003F 0211 0050
        DECLE   $02C0,  $0141,  $01D8,  $0313   ; D94D   02C0 0141 01D8 0313
        DECLE   $0002,  $012E,  $0134,  $027F   ; D951   0002 012E 0134 027F
        DECLE   $0054,  $00C0,  $0044,  $01C2   ; D955   0054 00C0 0044 01C2
        DECLE   $00DB,  $0201,  $0360,  $0065   ; D959   00DB 0201 0360 0065
        DECLE   $0252,  $0371,  $027B,  $0167   ; D95D   0252 0371 027B 0167
        DECLE   $00D5,  $001F,  $0133,  $02FB   ; D961   00D5 001F 0133 02FB
        DECLE   $03BC,  $0146,  $0035,  $01FE   ; D965   03BC 0146 0035 01FE
        DECLE   $0362,  $019A,  $0187,  $01F8   ; D969   0362 019A 0187 01F8
        DECLE   $021E,  $003D,  $013E,  $02BD   ; D96D   021E 003D 013E 02BD
        DECLE   $02CD,  $00B7,  $030D,  $030E   ; D971   02CD 00B7 030D 030E
        DECLE   $03DE,  $003B,  $0278,  $0366   ; D975   03DE 003B 0278 0366
        DECLE   $0059,  $0186,  $01A7,  $0197   ; D979   0059 0186 01A7 0197
        DECLE   $018F,  $01F0,  $0009,  $0048   ; D97D   018F 01F0 0009 0048
        DECLE   $01FC,  $01D4,  $0143,  $0309   ; D981   01FC 01D4 0143 0309
        DECLE   $023F,  $003F,  $0000           ; D985   023F 003F 0000

        CLRR    R0                              ; D988   01C0
        CMP@    R6,     R3                      ; D989   0373
        NEGR    R6                              ; D98A   0026
        SUB     G_0343, R3                      ; D98B   0303 0343
        RRC     R3,     1                       ; D98D   0073
        BMI     L_D754                          ; D98E   022B 023B

        SARC    R0,     2                       ; D990   007C
        SUB     .STIC.X.1,R0                    ; D991   0300 0001
        MOVR    R0,     R7                      ; D993   0087

        DECLE   $0280,  $0074,  $0000           ; D994   0280 0074 0000

        RRC     R0,     1                       ; D997   0070
        AND@    R2,     R5                      ; D998   0395
        BC      L_D6C6                          ; D999   0221 02D4
        SUBR    R0,     R7                      ; D99B   0107

        DECLE   $0092,  $0187,  $02BC,  $0331   ; D99C   0092 0187 02BC 0331
        DECLE   $0211                           ; D9A0   0211

        AND     G_03A1, R2                      ; D9A1   0382 03A1
        MVO@    R7,     R5                      ; D9A3   026F
        ADDI    #$011E, R7                      ; D9A4   02FF 011E

        DECLE   $03C4,  $0324,  $0001,  $0150   ; D9A6   03C4 0324 0001 0150
        DECLE   $00A4,  $00BD,  $0019,  $0000   ; D9AA   00A4 00BD 0019 0000
        DECLE   $0208,  $03A3,  $00E1,  $0000   ; D9AE   0208 03A3 00E1 0000
        DECLE   $0096,  $0010,  $010A,  $0000   ; D9B2   0096 0010 010A 0000
        DECLE   $00E6,  $0393,  $01CF,  $0001   ; D9B6   00E6 0393 01CF 0001

        CMPR    R1,     R5                      ; D9BA   014D
        MOVR    R7,     R5                      ; D9BB   00BD
        RSWD    R1                              ; D9BC   0039
        B       L_D9CF                          ; D9BD   0200 0010

        DECLE   $03C3,  $0132,  $02BD,  $0074   ; D9BF   03C3 0132 02BD 0074
        DECLE   $0244,  $013D,  $03FA,  $0342   ; D9C3   0244 013D 03FA 0342
        DECLE   $0349,  $0006,  $0024,  $03F0   ; D9C7   0349 0006 0024 03F0
        DECLE   $0275,  $0049,  $0238,  $001F   ; D9CB   0275 0049 0238 001F
L_D9CF:
        RRC     R0,     1                       ; D9CF   0070
        DECLE   $022A,  $019A,  $015F,  $0228   ; D9D0   022A 019A 015F 0228

        SUB@    R3,     R1                      ; D9D4   0319
        SLLC    R3,     2                       ; D9D5   005F
        CMP@    R3,     R6                      ; D9D6   035E
        MOVR    R6,     R1                      ; D9D7   00B1
        ADD@    R1,     R5                      ; D9D8   02CD
        MOVR    R2,     R7                      ; D9D9   0097

        SUB@    R2,     R4                      ; D9DA   0314
        CMP@    R1,     R4                      ; D9DB   034C
        ADD@    R1,     R7                      ; D9DC   02CF

        DECLE   $004B,  $0276,  $02E6,  $0251   ; D9DD   004B 0276 02E6 0251
        DECLE   $010A,  $0385,  $034F,  $03C5   ; D9E1   010A 0385 034F 03C5
        DECLE   $02BE,  $024F,  $0038,  $0080   ; D9E5   02BE 024F 0038 0080
        DECLE   $03C3,  $01F1,  $017F,  $03E4   ; D9E9   03C3 01F1 017F 03E4
        DECLE   $0000                           ; D9ED   0000
L_D9EE:
        RLC     R0,     2                       ; D9EE   0054
        AND@    R1,     R1                      ; D9EF   0389
        ADDR    R2,     R7                      ; D9F0   00D7

        DECLE   $01B7                           ; D9F1   01B7

        ANDR    R4,     R2                      ; D9F2   01A2
        ADDR    R1,     R4                      ; D9F3   00CC
        SUBR    R0,     R2                      ; D9F4   0102
        ADD@    R6,     R2                      ; D9F5   02F2
        ADDR    R1,     R6                      ; D9F6   00CE
        SUBR    R4,     R7                      ; D9F7   0127
        B       L_DCE0                          ; D9F8   0200 02E6

        DECLE   $03BA,  $00EF,  $0066,  $017B   ; D9FA   03BA 00EF 0066 017B
        DECLE   $03F1,  $027B,  $0272,  $0251   ; D9FE   03F1 027B 0272 0251
        DECLE   $004F,  $0193,  $0068,  $0000   ; DA02   004F 0193 0068 0000
        DECLE   $02E0,  $03B8,  $0095,  $0004   ; DA06   02E0 03B8 0095 0004

        RSWD    R0                              ; DA0A   0038
        ADD     G_03F8, R0                      ; DA0B   02C0 03F8
L_DA0D:
        AND@    R2,     R5                      ; DA0D   0395
        DECLE   $0383,  $0240,  $0000,  $03C8   ; DA0E   0383 0240 0000 03C8
        DECLE   $0195,  $0382,  $01C7,  $023C   ; DA12   0195 0382 01C7 023C
        DECLE   $00F7,  $0193,  $0001,  $0000   ; DA16   00F7 0193 0001 0000
        DECLE   $0104,  $0384,  $0333,  $026B   ; DA1A   0104 0384 0333 026B
        DECLE   $0020,  $034D,  $02FC,  $0378   ; DA1E   0020 034D 02FC 0378
        DECLE   $034A,  $0219                   ; DA22   034A 0219

        SUBR    R6,     R6                      ; DA24   0136
        XOR@    R6,     R4                      ; DA25   03F4
        SUB@    R4,     R6                      ; DA26   0326
        AND@    R3,     R4                      ; DA27   039C
        XOR@    R6,     R4                      ; DA28   03F4
        SETC                                    ; DA29   0007
        MVI@    R4,     R5                      ; DA2A   02A5
        SLLC    R3,     2                       ; DA2B   005F
        TSTR    R0                              ; DA2C   0080
        XOR     .BTAB.0B,R0                     ; DA2D   03C0 020B
        XOR@    R4,     R4                      ; DA2F   03E4
        COMR    R4                              ; DA30   001C
        XORI    #$0078, R6                      ; DA31   03FE 0078
        COMR    R2                              ; DA33   001A
        XORR    R1,     R5                      ; DA34   01CD
        MOVR    R5,     R6                      ; DA35   00AE
        XORR    R7,     R4                      ; DA36   01FC
        ADDR    R2,     R1                      ; DA37   00D1
        ANDR    R7,     R6                      ; DA38   01BE
        XOR@    R1,     R2                      ; DA39   03CA
        ANDR    R1,     R1                      ; DA3A   0189
        ADDR    R4,     R6                      ; DA3B   00E6
        MVO@    R1,     R2                      ; DA3C   0251
        MVI     G_0088, R2                      ; DA3D   0282 0088
        MOVR    R5,     R7                      ; DA3F   00AF

        DECLE   $0396,  $0081,  $00F9,  $0000   ; DA40   0396 0081 00F9 0000
        DECLE   $01FF,  $025C,  $0138,  $021F   ; DA44   01FF 025C 0138 021F

        DIS                                     ; DA48   0003
        MOVR    R2,     R1                      ; DA49   0091
        DECR    R0                              ; DA4A   0010
        ANDR    R1,     R6                      ; DA4B   018E
        ADDR    R1,     R6                      ; DA4C   00CE
        DECR    R3                              ; DA4D   0013
        CMP@    R2,     R1                      ; DA4E   0351
        XOR@    R1,     R6                      ; DA4F   03CE
        CMPI    #$0385, R1                      ; DA50   0379 0385
        ADDR    R0,     R6                      ; DA52   00C6
        MVO@    R3,     R5                      ; DA53   026B
        MVI@    R1,     R1                      ; DA54   0289
        ANDR    R5,     R1                      ; DA55   01A9
        CMP@    R4,     R7                      ; DA56   0367
        XORI    #$01C1, R4                      ; DA57   03FC 01C1
        ADD@    R2,     R3                      ; DA59   02D3
        SUBI    #$0106, R4                      ; DA5A   033C 0106
        MOVR    R2,     R4                      ; DA5C   0094
        ADD@    R4,     R4                      ; DA5D   02E4
        MOVR    R6,     R3                      ; DA5E   00B3
        MVI@    R2,     R4                      ; DA5F   0294
L_DA60:
        CMP@    R5,     R1                      ; DA60   0369
        DECLE   $029A,  $0382,  $03B1,  $007F   ; DA61   029A 0382 03B1 007F
        DECLE   $01F9,  $0321,  $01D8,  $038D   ; DA65   01F9 0321 01D8 038D
        DECLE   $00E1,  $03F9,  $03F2,  $023A   ; DA69   00E1 03F9 03F2 023A
        DECLE   $009C,  $02C3,  $0000,  $0000   ; DA6D   009C 02C3 0000 0000

        SARC    R0,     2                       ; DA71   007C
        MOVR    R3,     R0                      ; DA72   0098
        INCR    R1                              ; DA73   0009
        XOR     G_0323, R0                      ; DA74   03C0 0323
        DIS                                     ; DA76   0003
        MOVR    R5,     R0                      ; DA77   00A8
        XOR@    R4,     R1                      ; DA78   03E1
        CLRC                                    ; DA79   0006
        SUBR    R0,     R0                      ; DA7A   0100
        NEGR    R0                              ; DA7B   0020
        ANDR    R6,     R0                      ; DA7C   01B0
        ADD@    R6,     R6                      ; DA7D   02F6
        MVO@    R4,     R4                      ; DA7E   0264
        XORR    R5,     R0                      ; DA7F   01E8
        DECR    R2                              ; DA80   0012
        XORR    R7,     R5                      ; DA81   01FD
        CMPR    R3,     R5                      ; DA82   015D
        ADDR    R2,     R2                      ; DA83   00D2
        ADDI    #$0112, R3                      ; DA84   02FB 0112
        ADDR    R2,     R0                      ; DA86   00D0
        SUBR    R1,     R4                      ; DA87   010C
        CLRR    R6                              ; DA88   01F6
        SUBR    R1,     R4                      ; DA89   010C
        SUBR    R5,     R1                      ; DA8A   0129
        SUB@    R4,     R0                      ; DA8B   0320
        SARC    R3,     2                       ; DA8C   007F
        RSWD    R1                              ; DA8D   0039
        ADDR    R5,     R7                      ; DA8E   00EF

        DECLE   $026C,  $021D,  $03E9,  $0279   ; DA8F   026C 021D 03E9 0279

        PSHR    R2                              ; DA93   0272
        ADDR    R2,     R3                      ; DA94   00D3
        GSWD    R0                              ; DA95   0030
        SUB@    R6,     R4                      ; DA96   0334
        SUB@    R3,     R6                      ; DA97   031E
        SLR     R0,     2                       ; DA98   0064
        CMPR    R0,     R5                      ; DA99   0145
        ADDI    #$03F5, R7                      ; DA9A   02FF 03F5

        DECLE   $014A,  $029A,  $019E,  $008C   ; DA9C   014A 029A 019E 008C
        DECLE   $0308,  $039E,  $01F9,  $00A5   ; DAA0   0308 039E 01F9 00A5
        DECLE   $03CD,  $00E2,  $0111,  $034F   ; DAA4   03CD 00E2 0111 034F
        DECLE   $00CE,  $02BD,  $0354,  $02A6   ; DAA8   00CE 02BD 0354 02A6
        DECLE   $0275,  $02F6,  $03C7,  $01DE   ; DAAC   0275 02F6 03C7 01DE
        DECLE   $000D,  $0083,  $02F3,  $023C   ; DAB0   000D 0083 02F3 023C

        ADDI    #$01E3, R5                      ; DAB4   02FD 01E3
        AND     G_00C3, R3                      ; DAB6   0383 00C3
        PULR    R6                              ; DAB8   02B6
        AND@    R6,     R1                      ; DAB9   03B1
        MVI@    R3,     R7                      ; DABA   029F

        CMP     .BTAB.E8,R0                     ; DABB   0340 02E8
        ANDR    R3,     R1                      ; DABD   0199
        ADDR    R7,     R5                      ; DABE   00FD
        SUB@    R4,     R1                      ; DABF   0321
        ADD@    R2,     R4                      ; DAC0   02D4
        AND@    R2,     R0                      ; DAC1   0390
        ADD@    R4,     R0                      ; DAC2   02E0
        CMP@    R3,     R0                      ; DAC3   0358
L_DAC4:
        ADD@    R3,     R4                      ; DAC4   02DC
        DECLE   $00FA,  $00A8,  $0021,  $0000   ; DAC5   00FA 00A8 0021 0000
        DECLE   $0000,  $007E,  $0190,  $00DA   ; DAC9   0000 007E 0190 00DA
        DECLE   $02C9,  $0170,  $039C,  $036D   ; DACD   02C9 0170 039C 036D
        DECLE   $03FB,  $00E7,  $0025,  $0155   ; DAD1   03FB 00E7 0025 0155
        DECLE   $00B0,  $00C6,  $03AF,  $007E   ; DAD5   00B0 00C6 03AF 007E
        DECLE   $01C2,  $0000,  $008F,  $0110   ; DAD9   01C2 0000 008F 0110
        DECLE   $010D,  $00D5,  $0222           ; DADD   010D 00D5 0222

        ADDR    R1,     R4                      ; DAE0   00CC
        MVO     R0,     G_037C                  ; DAE1   0240 037C
        ADD@    R1,     R2                      ; DAE3   02CA
        ADD     .BTAB.66,R6                     ; DAE4   02C6 0266
L_DAE6:
        ANDR    R1,     R0                      ; DAE6   0188
        DECLE   $0168,  $0360,  $0084,  $0173   ; DAE7   0168 0360 0084 0173
        DECLE   $01C3,  $0233                   ; DAEB   01C3 0233

        ADD     G_0093, R2                      ; DAED   02C2 0093
        ADDR    R2,     R4                      ; DAEF   00D4
        ADD@    R4,     R3                      ; DAF0   02E3
        ADD@    R2,     R2                      ; DAF1   02D2
        MOVR    R7,     R1                      ; DAF2   00B9
        SUBR    R3,     R1                      ; DAF3   0119
L_DAF4:
        CMP@    R4,     R2                      ; DAF4   0362
        MVO@    R1,     R3                      ; DAF5   0259
        MOVR    R3,     R7                      ; DAF6   009F
        BC      L_DC49                          ; DAF7   0201 0150

        ANDI    #$00F3, R6                      ; DAF9   03BE 00F3
        ANDR    R1,     R6                      ; DAFB   018E
        TSTR    R0                              ; DAFC   0080
        SUB@    R4,     R4                      ; DAFD   0324
        AND@    R2,     R4                      ; DAFE   0394
        CMPR    R1,     R2                      ; DAFF   014A
        ADD     .BTAB.DC,R1                     ; DB00   02C1 02DC
        MVO@    R7,     R3                      ; DB02   025F
        MVI     G_0098, R0                      ; DB03   0280 0098
        ADDR    R1,     R7                      ; DB05   00CF

        INCR    R1                              ; DB06   0009
        B       L_DEEE                          ; DB07   0200 03E5
        MOVR    R1,     R7                      ; DB09   008F

        CMP     G_0047, R3                      ; DB0A   0343 0047
        SUBR    R0,     R0                      ; DB0C   0100
        CMPR    R1,     R1                      ; DB0D   0149
        MOVR    R3,     R7                      ; DB0E   009F

        DECLE   $0045,  $01C7,  $0320,  $0227   ; DB0F   0045 01C7 0320 0227
        DECLE   $009F,  $03ED,  $000F           ; DB13   009F 03ED 000F

        SUBI    #$00A7, R4                      ; DB16   033C 00A7
        MOVR    R4,     R6                      ; DB18   00A6
        SWAP    R1,     1                       ; DB19   0041
        MVO     R1,     .BTAB.38                ; DB1A   0241 0238
        SLLC    R2,     2                       ; DB1C   005E
        MOVR    R2,     R7                      ; DB1D   0097

        DECLE   $0005,  $0000                   ; DB1E   0005 0000

        SUBR    R0,     R4                      ; DB20   0104
        SWAP    R1,     2                       ; DB21   0045
        MOVR    R4,     R0                      ; DB22   00A0
        SWAP    R1,     1                       ; DB23   0041
        ANDR    R0,     R1                      ; DB24   0181
        SUB     G_01A5, R0                      ; DB25   0300 01A5
        ANDR    R3,     R0                      ; DB27   0198
        CMPR    R5,     R6                      ; DB28   016E
        MOVR    R4,     R6                      ; DB29   00A6
        ANDR    R5,     R1                      ; DB2A   01A9
        XORR    R0,     R4                      ; DB2B   01C4
        AND@    R3,     R5                      ; DB2C   039D
        SUBR    R1,     R0                      ; DB2D   0108
L_DB2E:
        ADDR    R2,     R7                      ; DB2E   00D7

        DECLE   $0137                           ; DB2F   0137

        XORR    R0,     R3                      ; DB30   01C3
        ADDR    R6,     R4                      ; DB31   00F4
        XOR@    R3,     R5                      ; DB32   03DD
        ADDR    R0,     R5                      ; DB33   00C5
        SUB@    R4,     R2                      ; DB34   0322
        SUB@    R4,     R7                      ; DB35   0327
        SUBR    R4,     R7                      ; DB36   0127

        DECLE   $0000,  $03C8,  $0320,  $0269   ; DB37   0000 03C8 0320 0269
        DECLE   $0397,  $00F1,  $0266,  $0076   ; DB3B   0397 00F1 0266 0076
        DECLE   $00E1,  $0390,  $0092,  $0008   ; DB3F   00E1 0390 0092 0008
        DECLE   $0090,  $0000,  $0000,  $0233   ; DB43   0090 0000 0000 0233
        DECLE   $0049,  $0055,  $014D,  $02F9   ; DB47   0049 0055 014D 02F9
        DECLE   $0368,  $01FF                   ; DB4B   0368 01FF

        MVI@    R3,     R2                      ; DB4D   029A
        MVO@    R4,     R4                      ; DB4E   0264
        BLE     L_DB2E                          ; DB4F   0226 0022

        SUB@    R4,     R0                      ; DB51   0320
        SUB@    R3,     R4                      ; DB52   031C
        MVI@    R2,     R1                      ; DB53   0291
        AND@    R1,     R5                      ; DB54   038D
        SUBR    R3,     R5                      ; DB55   011D
        INCR    R2                              ; DB56   000A
        SUB@    R1,     R7                      ; DB57   030F

        DECLE   $00EE,  $03E9,  $01FF           ; DB58   00EE 03E9 01FF

        XOR@    R4,     R6                      ; DB5B   03E6
        PULR    R0                              ; DB5C   02B0
        ANDR    R1,     R4                      ; DB5D   018C
        SUB@    R4,     R7                      ; DB5E   0327

        DECLE   $013F                           ; DB5F   013F
L_DB60:
        CMPR    R7,     R7                      ; DB60   017F
        DECLE   $0167,  $01E3,  $026F,  $0306   ; DB61   0167 01E3 026F 0306
        DECLE   $03A3,  $021F,  $00C3,  $0033   ; DB65   03A3 021F 00C3 0033
        DECLE   $0007,  $0000,  $0000           ; DB69   0007 0000 0000

        SAR     R0,     1                       ; DB6C   0068
        SUBR    R3,     R5                      ; DB6D   011D
        RSWD    R6                              ; DB6E   003E
        BC      L_DAF4                          ; DB6F   0221 007C
        B       L_DBFD                          ; DB71   0200 008A

        DECLE   $0001,  $0312,  $0003,  $01B0   ; DB73   0001 0312 0003 01B0
        DECLE   $0338,  $036F,  $001A,  $03DC   ; DB77   0338 036F 001A 03DC
        DECLE   $0104,  $0162,  $0000,  $0119   ; DB7B   0104 0162 0000 0119
        DECLE   $03C7,  $0269,  $019A,  $0069   ; DB7F   03C7 0269 019A 0069
        DECLE   $007A,  $0277,  $00CD,  $004F   ; DB83   007A 0277 00CD 004F
        DECLE   $0292,  $000D,  $0000,  $0020   ; DB87   0292 000D 0000 0020
        DECLE   $0050,  $0094,  $0060,  $0200   ; DB8B   0050 0094 0060 0200
        DECLE   $0003,  $0004,  $0094,  $000F   ; DB8F   0003 0004 0094 000F
        DECLE   $0000,  $0000                   ; DB93   0000 0000

        XORI    #$0394, R0                      ; DB95   03F8 0394
        DIS                                     ; DB97   0003
        B       L_DEBA                          ; DB98   0200 0320

        DECLE   $0037,  $0193,  $0006,  $0208   ; DB9A   0037 0193 0006 0208
        DECLE   $001F,  $0380,  $0095,  $0000   ; DB9E   001F 0380 0095 0000
        DECLE   $0038,  $0300,  $009B,  $0195   ; DBA2   0038 0300 009B 0195
        DECLE   $008B,  $0048,  $003C,  $0030   ; DBA6   008B 0048 003C 0030
        DECLE   $0195,  $0022,  $0240,  $0318   ; DBAA   0195 0022 0240 0318
        DECLE   $0013,  $0391,  $038F,  $0000   ; DBAE   0013 0391 038F 0000
        DECLE   $0000                           ; DBB2   0000

        XOR     G_0393, R0                      ; DBB3   03C0 0393
        XOR@    R6,     R6                      ; DBB5   03F6
L_DBB6:
        RSWD    R0                              ; DBB6   0038
        DECLE   $0000,  $0044,  $0234,  $0377   ; DBB7   0000 0044 0234 0377
        DECLE   $0044,  $0044,  $02C5,  $0230   ; DBBB   0044 0044 02C5 0230
        DECLE   $0323,  $0299,  $022A           ; DBBF   0323 0299 022A

        DECR    R0                              ; DBC2   0010
        BOV     L_D843                          ; DBC3   0222 0381
        ADD@    R2,     R7                      ; DBC5   02D7

        DECLE   $0391,  $01CC,  $012D,  $0319   ; DBC6   0391 01CC 012D 0319
        DECLE   $02CC,  $0180,  $02EC,  $01CE   ; DBCA   02CC 0180 02EC 01CE
        DECLE   $0212,  $0120,  $003F,  $0254   ; DBCE   0212 0120 003F 0254
        DECLE   $00F3,  $001C,  $0000,  $008E   ; DBD2   00F3 001C 0000 008E
        DECLE   $0010,  $0189,  $0000           ; DBD6   0010 0189 0000

        RRC     R0,     2                       ; DBD9   0074
        MVI@    R2,     R6                      ; DBDA   0296
        SUBR    R4,     R7                      ; DBDB   0127

        DECLE   $0028,  $0280,  $01E3,  $00F4   ; DBDC   0028 0280 01E3 00F4
        DECLE   $03C9,  $0000,  $0053,  $009B   ; DBE0   03C9 0000 0053 009B
        DECLE   $01AF                           ; DBE4   01AF

        XORR    R3,     R6                      ; DBE5   01DE
        SUBR    R4,     R5                      ; DBE6   0125
        B       L_D9EE                          ; DBE7   0220 01FA

        ANDR    R6,     R5                      ; DBE9   01B5
        ANDR    R3,     R1                      ; DBEA   0199
        MVO@    R2,     R2                      ; DBEB   0252
        INCR    R7                              ; DBEC   000F

        XOR@    R4,     R5                      ; DBED   03E5
L_DBEE:
        XORR    R6,     R1                      ; DBEE   01F1
        DECLE   $034C,  $0257,  $0209,  $0123   ; DBEF   034C 0257 0209 0123
        DECLE   $038E,  $01FE,  $0250,  $0200   ; DBF3   038E 01FE 0250 0200
        DECLE   $0020,  $0000                   ; DBF7   0020 0000

        ADDR    R4,     R0                      ; DBF9   00E0
        MVO@    R4,     R2                      ; DBFA   0254
        INCR    R7                              ; DBFB   000F

        SUBR    R4,     R0                      ; DBFC   0120
L_DBFD:
        RRC     R0,     2                       ; DBFD   0074
        DECLE   $0360,  $0257,  $03F6,  $0007   ; DBFE   0360 0257 03F6 0007
        DECLE   $0000                           ; DC02   0000

        NEGR    R1                              ; DC03   0021
        ADDR    R2,     R4                      ; DC04   00D4
        PSHR    R4                              ; DC05   0274
        SUBR    R4,     R2                      ; DC06   0122
        CMPR    R3,     R0                      ; DC07   0158
        ADD@    R6,     R5                      ; DC08   02F5
        ADDR    R1,     R7                      ; DC09   00CF
        MOVR    R1,     R7                      ; DC0A   008F

        DECLE   $012B,  $0001,  $03EE,  $0148   ; DC0B   012B 0001 03EE 0148
        DECLE   $008A,  $026A,  $015B,  $0029   ; DC0F   008A 026A 015B 0029
        DECLE   $025A,  $03FA,  $024B,  $002F   ; DC13   025A 03FA 024B 002F
        DECLE   $0095,  $0005,  $00C1,  $0004   ; DC17   0095 0005 00C1 0004
        DECLE   $03C0,  $0095,  $0383,  $03F1   ; DC1B   03C0 0095 0383 03F1
        DECLE   $0304,  $038B,  $0135,  $02DD   ; DC1F   0304 038B 0135 02DD
        DECLE   $0070,  $0145,  $0083,  $037C   ; DC23   0070 0145 0083 037C
        DECLE   $0323,  $03C9,  $0207,  $01FC   ; DC27   0323 03C9 0207 01FC
        DECLE   $03F0,  $0201,  $014A,  $0047   ; DC2B   03F0 0201 014A 0047
        DECLE   $0024,  $0320,  $03FF,  $0049   ; DC2F   0024 0320 03FF 0049
        DECLE   $0208,  $0020,  $0080,  $001E   ; DC33   0208 0020 0080 001E
        DECLE   $00CA,  $0209,  $00DB,  $0000   ; DC37   00CA 0209 00DB 0000
        DECLE   $0000,  $0049,  $0008,  $0048   ; DC3B   0000 0049 0008 0048
        DECLE   $00F0,  $0000,  $02CA,  $01C7   ; DC3F   00F0 0000 02CA 01C7
        DECLE   $0000,  $0310,  $001F           ; DC43   0000 0310 001F

        SLL     R1,     1                       ; DC46   0049
        MVO     R4,     .PSG0.chn_b_vol         ; DC47   0244 01FC
L_DC49:
        EIS                                     ; DC49   0002
        DECLE   $0002,  $021A,  $0244,  $0028   ; DC4A   0002 021A 0244 0028
        DECLE   $011E,  $03E1,  $0011,  $02F4   ; DC4E   011E 03E1 0011 02F4
        DECLE   $03CC,  $0129,  $0223,  $0195   ; DC52   03CC 0129 0223 0195
        DECLE   $0141,  $03AE,  $01C6,  $03B2   ; DC56   0141 03AE 01C6 03B2
        DECLE   $0001,  $03AD,  $003F,  $0100   ; DC5A   0001 03AD 003F 0100
        DECLE   $0064,  $0200                   ; DC5E   0064 0200

        SWAP    R3,     1                       ; DC60   0043
        ADDR    R0,     R7                      ; DC61   00C7

        DECLE   $0387,  $0000,  $0090,  $0310   ; DC62   0387 0000 0090 0310
        DECLE   $010A,  $0000,  $0095,  $0215   ; DC66   010A 0000 0095 0215
        DECLE   $01DF                           ; DC6A   01DF

        SETC                                    ; DC6B   0007
        ANDR    R0,     R0                      ; DC6C   0180
        TSTR    R0                              ; DC6D   0080
        MOVR    R6,     R1                      ; DC6E   00B1
        MVI     G_0310, R0                      ; DC6F   0280 0310
        AND@    R2,     R2                      ; DC71   0392
        NEGR    R2                              ; DC72   0022
        SDBD                                    ; DC73   0001
        MVI@    R3,     R0                      ; DC74   0298
        MVO     R0,     .BTAB.99                ; DC75   0240 0299
L_DC77:
        CMPR    R6,     R1                      ; DC77   0171
        DECLE   $0393,  $00E3,  $0002,  $01BE   ; DC78   0393 00E3 0002 01BE
        DECLE   $034D,  $013A,  $009A,  $000E   ; DC7C   034D 013A 009A 000E
        DECLE   $0040,  $0300,  $0141,  $004A   ; DC80   0040 0300 0141 004A
        DECLE   $038E,  $000F,  $0240,  $0133   ; DC84   038E 000F 0240 0133
        DECLE   $0042,  $028C,  $004F,  $0180   ; DC88   0042 028C 004F 0180
        DECLE   $034D,  $01B0,  $038A,  $03D1   ; DC8C   034D 01B0 038A 03D1
        DECLE   $02DC,  $027E                   ; DC90   02DC 027E

        ANDR    R0,     R0                      ; DC92   0180
        ANDR    R3,     R0                      ; DC93   0198
        SLL     R0,     2                       ; DC94   004C
        XOR     .STIC.X.1,R5                    ; DC95   03C5 0001
        RSWD    R4                              ; DC97   003C
        CMP@    R5,     R7                      ; DC98   036F
        ANDR    R3,     R4                      ; DC99   019C
        ADDR    R2,     R6                      ; DC9A   00D6
        XORR    R4,     R5                      ; DC9B   01E5
        CLRR    R2                              ; DC9C   01D2
L_DC9D:
        ADDR    R7,     R0                      ; DC9D   00F8
        DECLE   $0100,  $01B7,  $00CE,  $026B   ; DC9E   0100 01B7 00CE 026B
        DECLE   $014F,  $00F1,  $027C,  $035B   ; DCA2   014F 00F1 027C 035B
        DECLE   $03CD,  $03FF,  $0393,  $0399   ; DCA6   03CD 03FF 0393 0399
        DECLE   $0000,  $01E0,  $0084,  $0193   ; DCAA   0000 01E0 0084 0193
        DECLE   $001A,  $0000                   ; DCAE   001A 0000

        ADD@    R3,     R4                      ; DCB0   02DC
        XORI    #$0093, R4                      ; DCB1   03FC 0093
        ADDR    R4,     R0                      ; DCB3   00E0
        RSWD    R0                              ; DCB4   0038
        XORR    R4,     R0                      ; DCB5   01E0
        AND     G_0132, R0                      ; DCB6   0380 0132
        CMP@    R3,     R1                      ; DCB8   0359
        SARC    R0,     1                       ; DCB9   0078
        RSWD    R6                              ; DCBA   003E
        AND     G_032B, R0                      ; DCBB   0380 032B
        CMP@    R1,     R2                      ; DCBD   034A
        SUB@    R3,     R1                      ; DCBE   0319
        ANDR    R4,     R3                      ; DCBF   01A3
        RSWD    R2                              ; DCC0   003A
        SUB@    R3,     R7                      ; DCC1   031F

        DECLE   $01B6,  $0014,  $03FC,  $01E4   ; DCC2   01B6 0014 03FC 01E4
        DECLE   $0001,  $0080,  $0078,  $021E   ; DCC6   0001 0080 0078 021E

        ANDR    R1,     R4                      ; DCCA   018C
        ADDR    R7,     R6                      ; DCCB   00FE
        B       L_DE5D                          ; DCCC   0200 018F

        DECLE   $01F1,  $02EB,  $0252,  $00A6   ; DCCE   01F1 02EB 0252 00A6
        DECLE   $0285,  $030A,  $03E7,  $015D   ; DCD2   0285 030A 03E7 015D
        DECLE   $03E5,  $00C0,  $0129,  $03C6   ; DCD6   03E5 00C0 0129 03C6
        DECLE   $0103,  $0202                   ; DCDA   0103 0202

        SUBR    R1,     R0                      ; DCDC   0108
        SLLC    R1,     1                       ; DCDD   0059
        XOR     .PSG0.lft_hand,R1               ; DCDE   03C1 01FF
L_DCE0:
        DECR    R0                              ; DCE0   0010
        DECLE   $00C4,  $03A9,  $03C0,  $0003   ; DCE1   00C4 03A9 03C0 0003
        DECLE   $0000                           ; DCE5   0000

        SUBR    R0,     R0                      ; DCE6   0100
        AND@    R3,     R1                      ; DCE7   0399
        XORR    R7,     R2                      ; DCE8   01FA
        COMR    R4                              ; DCE9   001C
        COMR    R6                              ; DCEA   001E
        SUBR    R0,     R0                      ; DCEB   0100
        MVO     R3,     G_014D                  ; DCEC   0243 014D
        ADDR    R0,     R4                      ; DCEE   00C4
        SUB@    R6,     R3                      ; DCEF   0333
        SUBR    R5,     R3                      ; DCF0   012B
        MOVR    R5,     R7                      ; DCF1   00AF

        DECLE   $0036,  $0007,  $0000,  $0082   ; DCF2   0036 0007 0000 0082
        DECLE   $0210,  $0349,  $0000,  $0096   ; DCF6   0210 0349 0000 0096
        DECLE   $0292,  $01AF,  $000F,  $0386   ; DCFA   0292 01AF 000F 0386
        DECLE   $029E,  $03E1,  $0314,  $00E2   ; DCFE   029E 03E1 0314 00E2
        DECLE   $03C2,  $0295,  $0169,  $012B   ; DD02   03C2 0295 0169 012B
        DECLE   $0042,  $0380,  $0208,  $03C0   ; DD06   0042 0380 0208 03C0
        DECLE   $0141,  $0042,  $0310,  $020F   ; DD0A   0141 0042 0310 020F
        DECLE   $0383,  $0130,  $0042,  $007E   ; DD0E   0383 0130 0042 007E
        DECLE   $0278,  $03C4,  $0141,  $0042   ; DD12   0278 03C4 0141 0042
        DECLE   $0010,  $03C7,  $02C3,  $0131   ; DD16   0010 03C7 02C3 0131
        DECLE   $0082,  $0000,  $03C0,  $03C7   ; DD1A   0082 0000 03C0 03C7
        DECLE   $0140,  $0002,  $0380,  $0000   ; DD1E   0140 0002 0380 0000
        DECLE   $0000,  $0330,  $00DC,  $010C   ; DD22   0000 0330 00DC 010C
        DECLE   $03B1,  $0370,  $0393,  $0027   ; DD26   03B1 0370 0393 0027

        MOVR    R4,     R6                      ; DD2A   00A6
        INCR    R1                              ; DD2B   0009
        SKIP                                    ; DD2C   0208
        SUB@    R4,     R3                      ; DD2D   0323
        XOR     G_01B0, R3                      ; DD2E   03C3 01B0
        MVO@    R6,     R5                      ; DD30   026E
        MVI     G_01D8, R6                      ; DD31   0286 01D8
        XORR    R1,     R2                      ; DD33   01CA
        AND@    R1,     R5                      ; DD34   038D
        BEQ     L_DF92                          ; DD35   0204 025B

        MVO@    R0,     R2                      ; DD37   0250
        SUB@    R3,     R7                      ; DD38   031F
        INCR    R7                              ; DD39   000F

        AND@    R6,     R0                      ; DD3A   03B0
L_DD3B:
        ADDR    R3,     R0                      ; DD3B   00D8
        ADD@    R6,     R7                      ; DD3C   02F7

        CMPR    R2,     R3                      ; DD3D   0153
        ADDR    R1,     R4                      ; DD3E   00CC
        ADD@    R5,     R4                      ; DD3F   02EC
        ADDR    R1,     R2                      ; DD40   00CA
        ADD@    R4,     R3                      ; DD41   02E3
        SUB@    R5,     R1                      ; DD42   0329
        SUB@    R1,     R7                      ; DD43   030F

        DECLE   $03F1,  $0000,  $00E8,  $0328   ; DD44   03F1 0000 00E8 0328
        DECLE   $01E0,  $0110,  $0209,  $00FF   ; DD48   01E0 0110 0209 00FF
        DECLE   $0268,  $03F7,  $00E9,  $0288   ; DD4C   0268 03F7 00E9 0288
        DECLE   $027A,  $03DD,  $0380,  $0293   ; DD50   027A 03DD 0380 0293
        DECLE   $0397,  $000F,  $0224,  $006F   ; DD54   0397 000F 0224 006F
        DECLE   $0195,  $0114,  $0200,  $00C0   ; DD58   0195 0114 0200 00C0
        DECLE   $0044,  $0233,  $0009,  $0055   ; DD5C   0044 0233 0009 0055
        DECLE   $0145,  $027F,  $032C,  $01DF   ; DD60   0145 027F 032C 01DF
        DECLE   $039A,  $02BC,  $002A,  $0223   ; DD64   039A 02BC 002A 0223
        DECLE   $017E,  $0055,  $01F0,  $030C   ; DD68   017E 0055 01F0 030C
        DECLE   $0171,  $0314,  $010C,  $00BE   ; DD6C   0171 0314 010C 00BE
        DECLE   $000A,  $0206                   ; DD70   000A 0206

        SLR     R0,     2                       ; DD72   0064
        B       L_DFA6                          ; DD73   0200 0231

        DECLE   $014D,  $0387,  $0000,  $004F   ; DD75   014D 0387 0000 004F
        DECLE   $0318,  $03CA,  $0000,  $0107   ; DD79   0318 03CA 0000 0107
        DECLE   $028D,  $0170,  $03D4,  $0314   ; DD7D   028D 0170 03D4 0314
        DECLE   $0000,  $0274,  $0032,  $03C2   ; DD81   0000 0274 0032 03C2
        DECLE   $03C0,  $0210,  $0148,  $0001   ; DD85   03C0 0210 0148 0001
        DECLE   $0000,  $0000,  $01A0,  $027E   ; DD89   0000 0000 01A0 027E
        DECLE   $03C4,  $0268,  $03FC,  $01E1   ; DD8D   03C4 0268 03FC 01E1
        DECLE   $019B,  $00CA,  $02BB,  $01D2   ; DD91   019B 00CA 02BB 01D2
        DECLE   $0110,  $02FE,  $01F4,  $012B   ; DD95   0110 02FE 01F4 012B
        DECLE   $02E9,  $01BD,  $0099,  $03C1   ; DD99   02E9 01BD 0099 03C1
        DECLE   $0200,  $0003,  $00C0,  $01B8   ; DD9D   0200 0003 00C0 01B8
        DECLE   $0376,  $0386,  $01D8,  $0000   ; DDA1   0376 0386 01D8 0000
        DECLE   $01FD,  $0296,  $00CA,  $01F7   ; DDA5   01FD 0296 00CA 01F7
        DECLE   $0164,  $00EC,  $0204,  $02EC   ; DDA9   0164 00EC 0204 02EC
        DECLE   $016A,  $0023,  $02FB,  $00E4   ; DDAD   016A 0023 02FB 00E4
        DECLE   $0200,  $0009,  $02D0,  $009B   ; DDB1   0200 0009 02D0 009B
        DECLE   $000F,  $0150,  $0232,  $0074   ; DDB5   000F 0150 0232 0074
        DECLE   $0163,  $0039,  $0380,  $02A0   ; DDB9   0163 0039 0380 02A0
        DECLE   $0051,  $022E,  $027A,  $0032   ; DDBD   0051 022E 027A 0032
        DECLE   $0200,  $014E,  $0106,  $0078   ; DDC1   0200 014E 0106 0078
        DECLE   $00F8,  $001C,  $0000,  $0000   ; DDC5   00F8 001C 0000 0000
        DECLE   $0083,  $0318,  $03CA,  $0000   ; DDC9   0083 0318 03CA 0000
        DECLE   $0107,  $028D,  $0170,  $03D4   ; DDCD   0107 028D 0170 03D4
        DECLE   $0314,  $0000,  $0274,  $0032   ; DDD1   0314 0000 0274 0032
        DECLE   $03C2,  $03C0,  $0210,  $0149   ; DDD5   03C2 03C0 0210 0149
        DECLE   $0000,  $0084,  $018D,  $0137   ; DDD9   0000 0084 018D 0137
        DECLE   $001A,  $00C0,  $0226           ; DDDD   001A 00C0 0226

        ADDR    R5,     R4                      ; DDE0   00EC
        AND@    R1,     R5                      ; DDE1   038D
        MOVR    R4,     R7                      ; DDE2   00A7

        DECLE   $011E,  $0193,  $023F,  $02BE   ; DDE3   011E 0193 023F 02BE
        DECLE   $0254,  $01B2,  $03F1,  $003F   ; DDE7   0254 01B2 03F1 003F
        DECLE   $0200,  $0217,  $0012,  $0071   ; DDEB   0200 0217 0012 0071
        DECLE   $01EE,  $0078,  $0191,  $0012   ; DDEF   01EE 0078 0191 0012
        DECLE   $000F                           ; DDF3   000F

        BNC     L_DDF9                          ; DDF4   0209 0003

        MVI     .STIC.A.2,R1                    ; DDF6   0281 0012
        DECR    R1                              ; DDF8   0011
L_DDF9:
        INCR    R0                              ; DDF9   0008
        DECLE   $0204,  $01FF,  $0366,  $005B   ; DDFA   0204 01FF 0366 005B
        DECLE   $020B                           ; DDFE   020B

        SUB@    R4,     R7                      ; DDFF   0327
        ADDR    R0,     R7                      ; DE00   00C7
        SUBR    R4,     R7                      ; DE01   0127

        DECLE   $00EE,  $03B3,  $012E,  $0145   ; DE02   00EE 03B3 012E 0145
        DECLE   $02B4,  $0193,  $01FF,  $027D   ; DE06   02B4 0193 01FF 027D
        DECLE   $0339,  $021A,  $0082,  $0392   ; DE0A   0339 021A 0082 0392
        DECLE   $028B,  $0005,  $035E,  $01B4   ; DE0E   028B 0005 035E 01B4
        DECLE   $00CD,  $0042,  $03F1,  $03A3   ; DE12   00CD 0042 03F1 03A3
        DECLE   $0098,  $019E,  $025A,  $0086   ; DE16   0098 019E 025A 0086
        DECLE   $0229                           ; DE1A   0229

        XORI    #$03D1, R0                      ; DE1B   03F8 03D1
        ANDR    R0,     R4                      ; DE1D   0184
        ADDR    R1,     R7                      ; DE1E   00CF

        DECLE   $0036,  $0153,  $00F0,  $02F9   ; DE1F   0036 0153 00F0 02F9
        DECLE   $02E6,  $016A,  $0267,  $027D   ; DE23   02E6 016A 0267 027D
        DECLE   $00B1,  $027C,  $00F6,  $01F8   ; DE27   00B1 027C 00F6 01F8
        DECLE   $02C5,  $0334,  $038E,  $0058   ; DE2B   02C5 0334 038E 0058
        DECLE   $023D,  $02FB,  $012D,  $01D8   ; DE2F   023D 02FB 012D 01D8
        DECLE   $024A,  $003D,  $0020,  $00F0   ; DE33   024A 003D 0020 00F0
        DECLE   $0236                           ; DE37   0236

        SUB@    R3,     R1                      ; DE38   0319
        BEQ     L_DE67                          ; DE39   0204 002C
        MVI@    R4,     R7                      ; DE3B   02A7

        DECLE   $035D,  $0274,  $03FF           ; DE3C   035D 0274 03FF

        XOR@    R1,     R4                      ; DE3F   03CC
        SUBR    R3,     R1                      ; DE40   0119
        SUBR    R1,     R3                      ; DE41   010B
        SUB@    R2,     R3                      ; DE42   0313
        ADD@    R1,     R6                      ; DE43   02CE
        ANDI    #$017F, R1                      ; DE44   03B9 017F
        ADD@    R2,     R2                      ; DE46   02D2
        AND     G_003F, R1                      ; DE47   0381 003F
        B       L_DEED                          ; DE49   0200 00A2

        DECLE   $001C,  $0000,  $00FE,  $0318   ; DE4B   001C 0000 00FE 0318
        DECLE   $014C,  $00C2,  $0005,  $0387   ; DE4F   014C 00C2 0005 0387
        DECLE   $0325,  $021E,  $0366,  $028C   ; DE53   0325 021E 0366 028C
        DECLE   $009C,  $02E5,  $03FE,  $0004   ; DE57   009C 02E5 03FE 0004
        DECLE   $00E4,  $00BF                   ; DE5B   00E4 00BF
L_DE5D:
        ANDR    R4,     R2                      ; DE5D   01A2
        MVO@    R2,     R3                      ; DE5E   025A
        ADDR    R0,     R4                      ; DE5F   00C4
        ANDR    R3,     R0                      ; DE60   0198
        MOVR    R5,     R4                      ; DE61   00AC
        XOR@    R3,     R1                      ; DE62   03D9
        ADDR    R2,     R7                      ; DE63   00D7

        ANDR    R7,     R3                      ; DE64   01BB
        MOVR    R2,     R1                      ; DE65   0091
        SUBR    R0,     R4                      ; DE66   0104
L_DE67:
        AND@    R6,     R2                      ; DE67   03B2
        DECLE   $0022,  $0000,  $0000,  $0230   ; DE68   0022 0000 0000 0230
        DECLE   $021B,  $00EF,  $0218,  $0388   ; DE6C   021B 00EF 0218 0388
        DECLE   $012A,  $0200                   ; DE70   012A 0200

        XOR@    R6,     R0                      ; DE72   03F0
        XOR@    R3,     R4                      ; DE73   03DC
        CMPR    R3,     R0                      ; DE74   0158
        ANDR    R4,     R6                      ; DE75   01A6
        DECR    R2                              ; DE76   0012
        BC      L_DE79                          ; DE77   0201 0000

L_DE79:
        ADCR    R5                              ; DE79   002D
        DECLE   $034F,  $03B4,  $0149,  $0231   ; DE7A   034F 03B4 0149 0231

        CMPR    R2,     R4                      ; DE7E   0154
        XORI    #$021B, R3                      ; DE7F   03FB 021B
        SUB@    R2,     R6                      ; DE81   0316
        SUBR    R5,     R4                      ; DE82   012C
        MVI@    R3,     R1                      ; DE83   0299
        CMPR    R3,     R4                      ; DE84   015C
        ADCR    R0                              ; DE85   0028
        ANDR    R2,     R1                      ; DE86   0191
        SUBR    R0,     R7                      ; DE87   0107
        SUBI    #$02D4, R7                      ; DE88   033F 02D4

        ANDR    R3,     R0                      ; DE8A   0198
        XOR@    R5,     R1                      ; DE8B   03E9
        ADDR    R1,     R7                      ; DE8C   00CF

        PSHR    R7                              ; DE8D   0277
        ADDR    R6,     R2                      ; DE8E   00F2
        MOVR    R1,     R0                      ; DE8F   0088
        MVO@    R7,     R2                      ; DE90   0257
L_DE91:
        ADD@    R6,     R3                      ; DE91   02F3
        DECLE   $0324,  $00D5,  $01CB,  $0292   ; DE92   0324 00D5 01CB 0292
        DECLE   $007D,  $0000,  $021C,  $0300   ; DE96   007D 0000 021C 0300
        DECLE   $031A,  $0012,  $00FE,  $03F8   ; DE9A   031A 0012 00FE 03F8
        DECLE   $023C,  $0378,  $011E,  $0212   ; DE9E   023C 0378 011E 0212
        DECLE   $0000,  $003F,  $0018,  $0180   ; DEA2   0000 003F 0018 0180
        DECLE   $018B,  $0332,  $0002,  $0188   ; DEA6   018B 0332 0002 0188
        DECLE   $0203                           ; DEAA   0203

        SUB     G_0151, R6                      ; DEAB   0306 0151
        ANDR    R0,     R6                      ; DEAD   0186
        MVO@    R7,     R2                      ; DEAE   0257
        SUBR    R1,     R2                      ; DEAF   010A
        MVI@    R4,     R4                      ; DEB0   02A4
        MVO@    R2,     R4                      ; DEB1   0262
        ADDR    R4,     R7                      ; DEB2   00E7

        DECLE   $0234,  $00B7                   ; DEB3   0234 00B7

        ADDR    R0,     R6                      ; DEB5   00C6
        MVO@    R5,     R5                      ; DEB6   026D
        CMP@    R2,     R2                      ; DEB7   0352
        RLC     R3,     2                       ; DEB8   0057
        CMP@    R3,     R6                      ; DEB9   035E
L_DEBA:
        XOR@    R2,     R1                      ; DEBA   03D1
        DECLE   $00C0,  $00EC,  $0346,  $0132   ; DEBB   00C0 00EC 0346 0132
        DECLE   $000F                           ; DEBF   000F

        BUSC    L_DF1D                          ; DEC0   0207 005B

        TSTR    R0                              ; DEC2   0080
        ADDR    R7,     R4                      ; DEC3   00FC
        MVI     .BTAB.63,R6                     ; DEC4   0286 0263
        SUBR    R1,     R2                      ; DEC6   010A
        ADD     G_0352, R4                      ; DEC7   02C4 0352
        ADDR    R1,     R7                      ; DEC9   00CF

        DECLE   $00F7,  $0146,  $024E,  $0190   ; DECA   00F7 0146 024E 0190
        DECLE   $0000,  $0010,  $0030,  $03E0   ; DECE   0000 0010 0030 03E0
        DECLE   $00C8,  $03FB,  $0142,  $0090   ; DED2   00C8 03FB 0142 0090
        DECLE   $0156,  $0202,  $0346,  $007F   ; DED6   0156 0202 0346 007F
        DECLE   $01D8,  $0212,  $0072,  $0147   ; DEDA   01D8 0212 0072 0147
        DECLE   $023F,  $038F,  $02AE,  $0366   ; DEDE   023F 038F 02AE 0366
        DECLE   $004D,  $020A,  $02A4,  $0042   ; DEE2   004D 020A 02A4 0042
        DECLE   $0098,  $023B                   ; DEE6   0098 023B

        MVI@    R4,     R4                      ; DEE8   02A4
        MVO@    R2,     R2                      ; DEE9   0252
        AND@    R6,     R0                      ; DEEA   03B0
        NEGR    R0                              ; DEEB   0020
        DECR    R0                              ; DEEC   0010
L_DEED:
        ADDR    R0,     R0                      ; DEED   00C0
L_DEEE:
        ANDR    R4,     R0                      ; DEEE   01A0
        DECLE   $00CB,  $02FB,  $0152,  $0094   ; DEEF   00CB 02FB 0152 0094
        DECLE   $015D,  $00FE,  $02A6,  $0285   ; DEF3   015D 00FE 02A6 0285
        DECLE   $02D7,  $0366,  $023B,  $028A   ; DEF7   02D7 0366 023B 028A
        DECLE   $03C5,  $0052,  $0110,  $00B2   ; DEFB   03C5 0052 0110 00B2
        DECLE   $0324,  $00CE,  $017B,  $00C1   ; DEFF   0324 00CE 017B 00C1
        DECLE   $0090,  $024C,  $01FE,  $0227   ; DF03   0090 024C 01FE 0227
        DECLE   $0061,  $01E2,  $0012,  $0082   ; DF07   0061 01E2 0012 0082
        DECLE   $0047,  $0008,  $037B,  $0203   ; DF0B   0047 0008 037B 0203
        DECLE   $0012,  $0000,  $0001,  $0200   ; DF0F   0012 0000 0001 0200
        DECLE   $0383,  $02DD,  $0367,  $0231   ; DF13   0383 02DD 0367 0231

        MVI     G_0184, R0                      ; DF17   0280 0184
        XOR@    R3,     R2                      ; DF19   03DA
        MOVR    R1,     R7                      ; DF1A   008F

        DECLE   $0036                           ; DF1B   0036

        AND@    R6,     R5                      ; DF1C   03B5
L_DF1D:
        ADDR    R4,     R2                      ; DF1D   00E2
        DECLE   $02BB,  $0131,  $006C,  $034C   ; DF1E   02BB 0131 006C 034C
        DECLE   $01FA,  $02A6,  $00E1,  $0356   ; DF22   01FA 02A6 00E1 0356
        DECLE   $0012,  $0092,  $0207,  $0203   ; DF26   0012 0092 0207 0203
        DECLE   $028F,  $0206                   ; DF2A   028F 0206

        CMP@    R4,     R6                      ; DF2C   0366
        SLL     R3,     1                       ; DF2D   004B
        MVI     G_0183, R5                      ; DF2E   0285 0183
        ADD@    R3,     R2                      ; DF30   02DA
        MOVR    R0,     R7                      ; DF31   0087

        DECLE   $0237,  $03A4,  $00D2,  $0334   ; DF32   0237 03A4 00D2 0334
        DECLE   $0152,  $008C,  $0244,  $03F6   ; DF36   0152 008C 0244 03F6
        DECLE   $0246,  $0271,  $025F,  $005F   ; DF3A   0246 0271 025F 005F
        DECLE   $00A1,  $0280,  $001A,  $0023   ; DF3E   00A1 0280 001A 0023
        DECLE   $0329,  $01F6,  $0162,  $0300   ; DF42   0329 01F6 0162 0300
        DECLE   $002C,  $0066,  $0040,  $00F6   ; DF46   002C 0066 0040 00F6
        DECLE   $001C,  $0000,  $00B3,  $0018   ; DF4A   001C 0000 00B3 0018
        DECLE   $0389,  $0000,  $00C6,  $0023   ; DF4E   0389 0000 00C6 0023
        DECLE   $0150,  $01E0,  $0312,  $0003   ; DF52   0150 01E0 0312 0003
        DECLE   $018C,  $0234                   ; DF56   018C 0234

        ADD@    R4,     R0                      ; DF58   02E0
        XOR     .BTAB.26,R0                     ; DF59   03C0 0226
        SETC                                    ; DF5B   0007
        AND@    R3,     R0                      ; DF5C   0398
        MOVR    R2,     R0                      ; DF5D   0090
        CMPR    R4,     R2                      ; DF5E   0162
        CMP@    R1,     R1                      ; DF5F   0349
        CMPR    R5,     R7                      ; DF60   016F
        SUBR    R0,     R7                      ; DF61   0107

        CMP     G_015F, R2                      ; DF62   0342 015F
        SUBR    R5,     R6                      ; DF64   012E
        COMR    R6                              ; DF65   001E
        ADDR    R0,     R0                      ; DF66   00C0
        ADD     .ISRVEC.0,R7                    ; DF67   02C7 0100

        SUBR    R1,     R3                      ; DF69   010B
        CMP@    R1,     R6                      ; DF6A   034E
        SARC    R0,     2                       ; DF6B   007C
        ADD@    R2,     R7                      ; DF6C   02D7

        DECLE   $0240,  $0174,  $0376,  $00AB   ; DF6D   0240 0174 0376 00AB
        DECLE   $02D6,  $0140,  $0399,  $02AB   ; DF71   02D6 0140 0399 02AB
        DECLE   $0014,  $0112,  $0147,  $01FB   ; DF75   0014 0112 0147 01FB
        DECLE   $00C1,  $0318,  $0329,  $0290   ; DF79   00C1 0318 0329 0290
        DECLE   $0354,  $01CD,  $0068,  $030C   ; DF7D   0354 01CD 0068 030C
        DECLE   $0007,  $0321,  $0136,  $00C9   ; DF81   0007 0321 0136 00C9
        DECLE   $0000,  $01FC,  $0002,  $01FE   ; DF85   0000 01FC 0002 01FE
        DECLE   $005D,  $03C9,  $020A           ; DF89   005D 03C9 020A

        XOR@    R5,     R0                      ; DF8C   03E8
        DECR    R6                              ; DF8D   0016
        XOR@    R2,     R4                      ; DF8E   03D4
        XOR@    R4,     R5                      ; DF8F   03E5
        SUB@    R3,     R1                      ; DF90   0319
        MVI@    R5,     R5                      ; DF91   02AD
L_DF92:
        COMR    R4                              ; DF92   001C
        SUB     G_0187, R4                      ; DF93   0304 0187
        SUBI    #$01C1, R6                      ; DF95   033E 01C1
        COMR    R2                              ; DF97   001A
        SUBI    #$03D0, R2                      ; DF98   033A 03D0
        DECR    R6                              ; DF9A   0016
        CMPR    R6,     R0                      ; DF9B   0170
        ADDR    R2,     R0                      ; DF9C   00D0
        XORI    #$0036, R3                      ; DF9D   03FB 0036
        CMP@    R2,     R6                      ; DF9F   0356
        CMPR    R0,     R6                      ; DFA0   0146
        SUB@    R3,     R1                      ; DFA1   0319
        SUB@    R2,     R5                      ; DFA2   0315
        ADCR    R2                              ; DFA3   002A
        MVI     G_0346, R0                      ; DFA4   0280 0346
L_DFA6:
        ADD@    R3,     R7                      ; DFA6   02DF

        DECLE   $03BD,  $0119,  $033A,  $00B8   ; DFA7   03BD 0119 033A 00B8
        DECLE   $0019,  $0150,  $00F8,  $000B   ; DFAB   0019 0150 00F8 000B
        DECLE   $03B9,  $033D,  $014A,  $0399   ; DFAF   03B9 033D 014A 0399
        DECLE   $036D,  $022C,  $001F,  $0161   ; DFB3   036D 022C 001F 0161
        DECLE   $0320,  $01BD,  $0199,  $032A   ; DFB7   0320 01BD 0199 032A
        DECLE   $02BC,  $019E,  $0160,  $00F8   ; DFBB   02BC 019E 0160 00F8
        DECLE   $02FE,  $0100,  $0320,  $014C   ; DFBF   02FE 0100 0320 014C
        DECLE   $0299,  $001D,  $0013,  $030B   ; DFC3   0299 001D 0013 030B
        DECLE   $0167,  $0360,  $02B9,  $0159   ; DFC7   0167 0360 02B9 0159
        DECLE   $033A,  $029C,  $01A2,  $0160   ; DFCB   033A 029C 01A2 0160
        DECLE   $00D0,  $02FF,  $0180,  $0318   ; DFCF   00D0 02FF 0180 0318
        DECLE   $0350,  $0219,  $00DD,  $000D   ; DFD3   0350 0219 00DD 000D
        DECLE   $020B,  $03C5,  $0017,  $020C   ; DFD7   020B 03C5 0017 020C
        DECLE   $02D7,  $034A,  $0198,  $01AD   ; DFDB   02D7 034A 0198 01AD
        DECLE   $0160,  $008C,  $02FE,  $027F   ; DFDF   0160 008C 02FE 027F
        DECLE   $02F8,  $0156,  $0399,  $02AC   ; DFE3   02F8 0156 0399 02AC
        DECLE   $0209,  $020A                   ; DFE7   0209 020A

        XORR    R0,     R3                      ; DFE9   01C3
        SLLC    R0,     1                       ; DFEA   0058
        COMR    R4                              ; DFEB   001C
        ADD@    R2,     R7                      ; DFEC   02D7

        DECLE   $033A,  $0278,  $01B6,  $0260   ; DFED   033A 0278 01B6 0260
        DECLE   $010C,  $03E4,  $01AD,  $020E   ; DFF1   010C 03E4 01AD 020E
        DECLE   $035C,  $0299,  $03B3,  $0209   ; DFF5   035C 0299 03B3 0209
        DECLE   $0306,  $0124,  $015A,  $0124   ; DFF9   0306 0124 015A 0124
        DECLE   $0310,  $021A                   ; DFFD   0310 021A

        DIS                                     ; DFFF   0003
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5038       <entry>
;;  $5039       <entry>
;;  $50BA       $5061   $508D  
;;  $5178       $517F  
;;  $5181       $5185  
;;  $521A       $521C  
;;  $5233       $5169   $55CF  
;;  $5244       $524C  
;;  $527A       $5085  
;;  $529C       $527D   $55D4  
;;  $52BC       $52C2  
;;  $52F0       $52DE  
;;  $530B       $530D  
;;  $5339       $532F  
;;  $5344       <entry>
;;  $536A       $5363   $5366  
;;  $5373       $536C   $536F  
;;  $5384       $537D   $5380  
;;  $538D       $5386   $5389  
;;  $5398       $5393  
;;  $53A6       $539C  
;;  $53B6       $5358   $53B0  
;;  $53D5       $53CD  
;;  $53EB       $53E7  
;;  $5406       $53FE  
;;  $5420       $541D  
;;  $542A       $5425  
;;  $5435       $542F  
;;  $5436       $53BA   $53C7   $53D3  
;;  $5438       $5449  
;;  $5445       $5440  
;;  $544B       $5350  
;;  $544D       $54A2  
;;  $5484       $547A  
;;  $548C       $5482  
;;  $549F       $5451   $5456   $54AF   $54D2   $54F8  
;;  $54A5       $5454  
;;  $54B1       $545D   $5467   $549D  
;;  $54B3       $54A7  
;;  $54B7       $54D0  
;;  $54CD       $54BA   $54BE  
;;  $54D4       $54CB  
;;  $5555       $5522   $552F  
;;  $555E       $5557  
;;  $5566       $5442  
;;  $5582       $5576   $557B  
;;  $55AA       $5587   $559B  
;;  $55CD       $55C8  
;;  $55DB       $5395  
;;  $5607       $5603  
;;  $560B       $55FB  
;;  $5633       $562F  
;;  $5636       $5633  
;;  $5658       $5653  
;;  $566C       $531C   $53A7  
;;  $566D       $565A   $56D9   $5785  
;;  $5675       $5670  
;;  $5683       $5680  
;;  $568B       $5687  
;;  $568E       $55E6   $5608  
;;  $568F       $567E   $5685  
;;  $5692       $568C  
;;  $569B       $567A  
;;  $56B5       $56AD  
;;  $56DB       $56A7   $56B3  
;;  $56E2       $56EB  
;;  $56F3       $587D  
;;  $56FB       $5703  
;;  $570F       $588B  
;;  $5721       $5711  
;;  $5723       $571F  
;;  $5792       $5793  
;;  $5799       $579A  
;;  $579E       $56ED   $5789  
;;  $57AD       $5787  
;;  $57AE       $5705  
;;  $57AF       $579C  
;;  $57B8       $577F  
;;  $57BC       $577B  
;;  $57D1       $56F0  
;;  $57F3       $5802   $5807  
;;  $5817       $5819  
;;  $5838       $5831  
;;  $5849       $585F  
;;  $584D       $582A  
;;  $5861       $582E   $5847  
;;  $5872       $5864  
;;  $587D       $5868   $586E   $5876  
;;  $5880       $5870   $587B  
;;  $5887       $5884  
;;  $588E       $5889  
;;  $5917       $58E1  
;;  $5921       $55CA   $5655   $5672   $59FB  
;;  $5924       $5C20  
;;  $5925       $5923   $5929  
;;  $594E       $59C9  
;;  $5972       $597B  
;;  $5987       $597F  
;;  $59A5       $59AA  
;;  $59BD       $5942  
;;  $59FE       $59F9  
;;  $5A07       $5A2B  
;;  $5A17       $5A28  
;;  $5A22       $5A1E  
;;  $5A3F       $5A3B  
;;  $5A46       $5A42  
;;  $5A5E       $50A6   $59D1  
;;  $5A7F       $5A8D  
;;  $5A9A       $5AA9  
;;  $5AAB       $5AA0  
;;  $5AB4       $5AC3  
;;  $5AC5       $5ABA  
;;  $5B0D       $50B6   $59FE  
;;  $5B17       $5B1E  
;;  $5B24       $5B2B  
;;  $5B40       <entry> $5AE8  
;;  $5B50       $5B44   $5B49  
;;  $5B55       $5B4E  
;;  $5B5E       $5B58  
;;  $5B65       $5B8E  
;;  $5B89       $5B73   $5BCE  
;;  $5B92       $5B9B  
;;  $5BBD       $5BB6  
;;  $5BC8       $5B97  
;;  $5BC9       $5B69  
;;  $5BD0       $5795   $5B4B  
;;  $5BD7       $5BDC  
;;  $5BFB       $5BF3  
;;  $5BFC       $5BFA  
;;  $5BFE       $5C02   $5C06   $5C0C   $5C11  
;;  $5C2C       $5C26  
;;  $5C33       $5C2F  
;;  $5C6C       $5C62  
;;  $5C7B       $5C35   $5C40   $5C42   $5C75   $5C89   $5C8C  
;;  $5C8B       $5C6A  
;;  $5CA5       $5CA2  
;;  $5CB3       $5CAA  
;;  $5CD2       $5CC8  
;;  $5CD4       $5CDC  
;;  $5CDF       $5C58  
;;  $5CEE       $5CEB  
;;  $5CF8       $5CF4  
;;  $5D23       $5D1E  
;;  $5D76       $5D74  
;;  $5D7F       $5D7D  
;;  $5DB1       $5DB1  
;;  $5DB8       $5DB8  
;;  $5DD1       $5DCF  
;;  $5DE6       $5DE4  
;;  $633B       $6339  
;;  $633C       $633A  
;;  $6459       <entry>
;;  $645E       $647C  
;;  $6490       $6494  
;;  $649B       $6496  
;;  $64AC       $63DB  
;;  $64BB       $64B5   $64B9  
;;  $64C3       $64A8  
;;  $64CF       $64AE  
;;  $64DC       $64E7  
;;  $64DE       $64E1  
;;  $64EB       $64D5  
;;  $64F0       $64FE  
;;  $64F2       $64F6  
;;  $6501       $64D3   $64E9  
;;  $6502       $64B1  
;;  $6514       $653B  
;;  $6517       $6522  
;;  $652B       $6536  
;;  $6542       $654D  
;;  $6553       $6508  
;;  $6557       $655B  
;;  $655F       $6506   $6551  
;;  $6560       $649D  
;;  $6564       $6594  
;;  $656C       $6568  
;;  $6597       $65A5   $65B9  
;;  $65B0       $65AD  
;;  $65DB       $65D1  
;;  $65DE       $65FC  
;;  $65F3       $65E9  
;;  $65F6       $6602  
;;  $65F8       $65E0  
;;  $65FA       $65CD   $65D7  
;;  $6600       $65E5   $65EF  
;;  $6604       $6598   $65A9   $65BE   $65FE  
;;  $6605       $6498  
;;  $660F       $57B5  
;;  $6611       $6617  
;;  $6629       $6623  
;;  $6636       $661D  
;;  $6641       $663D  
;;  $6643       $6637   $6670  
;;  $6644       $6634  
;;  $6648       $66AC  
;;  $6655       $6651  
;;  $665F       $6662  
;;  $6686       $667A   $667D  
;;  $6687       $660C  
;;  $6689       $668F  
;;  $66A7       $66A0  
;;  $66AE       $660A  
;;  $66B0       $66B8  
;;  $66D2       $66CE  
;;  $66D5       $66C9  
;;  $66E1       $66D9  
;;  $66E6       $6608  
;;  $66E8       $66F0  
;;  $6707       $6701  
;;  $6713       $66E4  
;;  $671E       $66DB   $66DF   $670E  
;;  $6726       $6722  
;;  $673F       $6739  
;;  $6744       $66B0   $66E8  
;;  $674F       $52BC   $6611   $6689  
;;  $6750       $674D  
;;  $6761       $675A  
;;  $6769       $674B  
;;  $6775       $6754   $6762  
;;  $677C       $676E  
;;  $6781       $6773  
;;  $6786       $528D   $6727  
;;  $67A0       $678F  
;;  $67AC       $67A6  
;;  $67AE       $67AA  
;;  $67B7       $67B1  
;;  $67C2       $679E   $67B5   $67B8   $67BB   $67FD  
;;  $67CA       $67CE  
;;  $67D1       $6792  
;;  $67E8       $67D7   $67DC  
;;  $67FA       $67EA   $67EF  
;;  $67FF       $5345  
;;  $6802       $680B   $6819   $681F   $6824  
;;  $6826       $6806  
;;  $6827       $5100   $511A   $512C   $513E   $519A   $51AC   $51C1   $51EE  
;;  $6827       $51FD   $58B0   $58C7   $58E8   $5901   $5947   $594E   $595F  
;;  $6827       $598F   $59C0   $6840   $6856  
;;  $682F       $682A  
;;  $6833       $51A5   $51D3  
;;  $6836       $5973  
;;  $6849       $684A  
;;  $6853       $6854  
;;  $6858       $50C4   $5187   $52B4   $534A   $55AE   $57AA   $57B2   $589C  
;;  $6858       $592C   $5A66   $5AC7   $5B60  
;;  $686D       $6871  
;;  $687A       $6877  
;;  $687B       $6879  
;;  $68D2       $68CF  
;;  $68E8       $6903  
;;  $68FA       $68FE  
;;  $6944       $6947  
;;  $694E       $6951  
;;  $6959       $695B  
;;  $6963       $6965  
;;  $6970       $6973  
;;  $6976       $697A  
;;  $6997       $697F  
;;  $69B9       $69B3  
;;  $69BB       $69B7  
;;  $69BD       $69C9  
;;  $6A07       $6883  
;;  $6A14       $68D6   $692D  
;;  $6A1E       $6907   $69E0  
;;  $6A33       $69FF   $6A05   $6A19  
;;  $6A39       $6A1E   $6A33  
;;  $6A48       $5439   $54C2   $55DE  
;;  $6A5A       $5411   $546E   $55F1   $5730   $575F  
;;  $6A6A       $54F0   $5552  
;;  $6A75       $5723   $5892   $5BA1   $5C17   $5CAC  
;;  $6A76       $6A74  
;;  $6A7D       $6A7A  
;;  $6A81       $6A8C  
;;  $6A8E       $6A85  
;;  $6A93       $5A86   $5AA5   $5ABF  
;;  $6A94       $6A97  
;;  $6A9A       $5728   $578E   $596B   $5B52  
;;  $6AAE       $503A   $50C7   $518A   $52B7   $589F   $592F   $5A78  
;;  $6AB7       $51DE   $57F0  
;;  $6ABB       $6AC8  
;;  $6AD1       $6AD3  
;;  $6AD6       $554D  
;;  $6B15       <entry>
;;  $6B23       $6AD7   $6B33   $6B4B  
;;  $6B31       $6B18   $6B28   $6B82  
;;  $6B32       $56D5  
;;  $6B3C       $6B3A  
;;  $6B4A       $54F4   $5C5B  
;;  $6B5B       $6B59  
;;  $6B62       $55A7  
;;  $6B7E       $5D2E  
;;  $6B96       $6B96  
;;  $6BB5       $5336   $55D7   $56F6  
;;  $6BC2       $6BC0  
;;  $6CD2       $6CCA  
;;  $6CD3       $5752   $59E4  
;;  $6D89       $5043   $5220   $6F85  
;;  $6DB8       $6DB2  
;;  $6DC2       $6D96  
;;  $6DC3       $6D9C  
;;  $6DCA       $503D  
;;  $6DEA       $6DDC  
;;  $6DF2       $6E16   $6E26  
;;  $6E18       $6E11  
;;  $6E20       $6E35  
;;  $6E28       $6E04   $6E0E  
;;  $6E30       $6E43  
;;  $6E37       $6E31  
;;  $6E45       $6E13  
;;  $6E46       $6EAF  
;;  $6E66       $6E18  
;;  $6E6C       $6E72  
;;  $6E6F       $6E6A  
;;  $6E7F       $6E3A   $6E3D  
;;  $6E88       $6DF7   $6E1B   $6E24  
;;  $6E98       $6E8B   $6E90  
;;  $6EA2       $6D92   $6DD8  
;;  $6EA7       $6E20  
;;  $6EBF       $6EB3  
;;  $6EE0       $6B8C  
;;  $6EED       $6E5C   $6EBD   $6ECB   $6EE0  
;;  $6EF5       <entry> $5987  
;;  $6F05       $6F07  
;;  $6F1A       $6F21  
;;  $6F24       $6F1D  
;;  $6F25       $6F23  
;;  $6F2E       $6F60  
;;  $6F40       $6F4D  
;;  $6F47       $6F43  
;;  $6F5A       $6F58  
;;  $6F5C       $6F53  
;;  $6F62       $6F5C  
;;  $6F64       $6F48  
;;  $6F73       $6F6C  
;;  $6F74       $6F31   $6F4F  
;;  $6F88       $6EFA   $6F02  
;;  $6FBB       $6FBB  
;;  $D188       $D186  
;;  $D1AA       $D468  
;;  $D233       $D4D9  
;;  $D2E8       $D2A3  
;;  $D305       $D27A  
;;  $D3D8       $D3D8  
;;  $D3E8       $D3E6  
;;  $D3F7       $D5DD  
;;  $D42B       $D5C1  
;;  $D464       $D464  
;;  $D476       $D3F3  
;;  $D496       $D36D  
;;  $D4A8       $D177  
;;  $D4BA       $D89A  
;;  $D4EF       $D281  
;;  $D576       $D429  
;;  $D5E4       $D5E4  
;;  $D630       $D62E  
;;  $D677       $D675  
;;  $D6C6       $D999  
;;  $D6D9       $D6D7  
;;  $D6E4       $D6E2  
;;  $D716       $D3CC  
;;  $D723       $D6C6  
;;  $D754       $D98E  
;;  $D809       $D4C7  
;;  $D826       $D824  
;;  $D843       $DBC3  
;;  $D851       $D810  
;;  $D852       $D847  
;;  $D8A4       $D822  
;;  $D8B6       $D4D1  
;;  $D909       $D604  
;;  $D9CF       $D9BD  
;;  $D9EE       $DBE7  
;;  $DA0D       $D777  
;;  $DA60       $D81F  
;;  $DAC4       $D9A4  
;;  $DAE6       $D7FE  
;;  $DAF4       $DB6F  
;;  $DB2E       $DB4F  
;;  $DB60       $D891  
;;  $DBB6       $DE88  
;;  $DBEE       $DBEC  
;;  $DBFD       $DB71   $DBFB  
;;  $DC49       $DAF7  
;;  $DC77       $D8F2  
;;  $DC9D       $D8FB  
;;  $DCE0       $D9F8  
;;  $DD3B       $DD39  
;;  $DDF9       $DDF4  
;;  $DE5D       $DCCC  
;;  $DE67       $DE39  
;;  $DE79       $DE77  
;;  $DE91       $DA9A  
;;  $DEBA       $DB98  
;;  $DEED       $DE49  
;;  $DEEE       $DB07  
;;  $DF1D       $DEC0  
;;  $DF92       $DD35  
;;  $DFA6       $DD73  
;; ======================================================================== ;;
