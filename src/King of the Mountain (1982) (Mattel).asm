
        ORG     $5000
.HEADER:
        BIDECLE $6231           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5064           ; 5004  Ptr: Start of game
        BIDECLE $6989           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $503A           ; 5008  Ptr: GRAM init sequence
        BIDECLE $504E           ; 500A  Ptr: Date/Title
        DECLE   $0001           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0006           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $00A0,  $00D5,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $0098,  $0052,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0036,  $0053,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $005B,  $0053,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $00DD,  $0053,  $0001,  $0000; 502C  Timer dispatch/interval
        DECLE   $0049,  $0057,  $0001,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5036   0000 0000 0000 0000
.GRAM_INIT_503A:
        DECLE   $002D           ; 503A  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 503B  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 503D  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 503F  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5041  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 5043  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0200   ; 5045  #28-2C:  CART #28-2C ----

        DECLE   $002D,  $0061,  $0380,  $0071   ; 5047   002D 0061 0380 0071
        DECLE   $0380,  $0001,  $03A0           ; 504B   0380 0001 03A0
.TITLE:
        DECLE   $0052                           ; 504E  Cartridge year
        STRING  "KING OF THE MOUNTAIN"          ; 504F  Title string
        DECLE   $0000                           ; 5063  

.START:
        PSHR    R5                              ; 5064   0275
        CLRR    R0                              ; 5065   01C0
        MVO     R0,     G_0317                  ; 5066   0240 0317
        MVO     R0,     G_0318                  ; 5068   0240 0318
        MVI     G_0103, R0                      ; 506A   0280 0103
        CMPI    #$0003, R0                      ; 506C   0378 0003
        BGT     L_5078                          ; 506E   020E 0008

        MVII    #$0001, R0                      ; 5070   02B8 0001
        MVII    #$000A, R1                      ; 5072   02B9 000A
        MVO     R1,     G_019D                  ; 5074   0241 019D
        B       L_5079                          ; 5076   0200 0001

L_5078:
        CLRR    R0                              ; 5078   01C0
L_5079:
        MVO     R0,     G_019E                  ; 5079   0240 019E

        JSR     R5,     L_507F                  ; 507B   0004 0150 007F

        PULR    R7                              ; 507E   02B7

L_507F:
        PSHR    R5                              ; 507F   0275
        CLRR    R0                              ; 5080   01C0
        MVO     R0,     G_0316                  ; 5081   0240 0316
        MVO     R0,     G_0315                  ; 5083   0240 0315
        MVII    #$031D, R4                      ; 5085   02BC 031D
        MVII    #$0040, R0                      ; 5087   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5089   0004 0114 0338

        SDBD                                    ; 508C   0001
        MVII    #$502C, R1                      ; 508D   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 5090   0004 0118 0038

        SDBD                                    ; 5093   0001
        MVII    #$5030, R1                      ; 5094   02B9 0030 0050

        JSR     R5,     X_TIMER_STOP            ; 5097   0004 0118 0038

        MVI     G_019D, R4                      ; 509A   0284 019D
        SDBD                                    ; 509C   0001
        ADDI    #$51CA, R4                      ; 509D   02FC 00CA 0051
        SDBD                                    ; 50A0   0001
        MVI@    R4,     R0                      ; 50A1   02A0
        MVO     R0,     G_035C                  ; 50A2   0240 035C
        MVII    #$000A, R0                      ; 50A4   02B8 000A
        MVO     R0,     G_017E                  ; 50A6   0240 017E
        MVII    #$0006, R0                      ; 50A8   02B8 0006
        MVO     R0,     G_017D                  ; 50AA   0240 017D
        MVII    #$003B, R0                      ; 50AC   02B8 003B
        MVO     R0,     G_017A                  ; 50AE   0240 017A
        MVII    #$00A8, R0                      ; 50B0   02B8 00A8
        MVO     R0,     G_0160                  ; 50B2   0240 0160
        CLRR    R0                              ; 50B4   01C0
        MVO     R0,     G_01B9                  ; 50B5   0240 01B9
        MVO     R0,     G_01BC                  ; 50B7   0240 01BC
        INCR    R0                              ; 50B9   0008
        MVO     R0,     G_018F                  ; 50BA   0240 018F
        MVO     R0,     G_015E                  ; 50BC   0240 015E
        MVO     R0,     G_0161                  ; 50BE   0240 0161
        MVO     R0,     G_0172                  ; 50C0   0240 0172
        MVO     R0,     G_0192                  ; 50C2   0240 0192
        INCR    R0                              ; 50C4   0008
        MVO     R0,     G_01A7                  ; 50C5   0240 01A7
        MVO     R0,     G_0175                  ; 50C7   0240 0175
        INCR    R0                              ; 50C9   0008
        MVO     R0,     G_0103                  ; 50CA   0240 0103
        MVO     R0,     G_01A8                  ; 50CC   0240 01A8
        MVII    #$01AC, R4                      ; 50CE   02BC 01AC
L_50D0:
        MVII    #$000B, R0                      ; 50D0   02B8 000B

        JSR     R5,     X_RAND2                 ; 50D2   0004 0114 029E

        MVO@    R0,     R4                      ; 50D5   0260
        CMPI    #$01B1, R4                      ; 50D6   037C 01B1
        BLE     L_50D0                          ; 50D8   0226 0009

        MVII    #$0200, R4                      ; 50DA   02BC 0200
        MVII    #$00F0, R0                      ; 50DC   02B8 00F0
        SDBD                                    ; 50DE   0001
        MVII    #$2CCE, R1                      ; 50DF   02B9 00CE 002C

        JSR     R5,     X_FILL_MEM              ; 50E2   0004 0114 0341

        SDBD                                    ; 50E5   0001
        MVII    #$2400, R3                      ; 50E6   02BB 0000 0024
        MVII    #$022D, R4                      ; 50E9   02BC 022D

        JSR     R5,     X_PRINT_R5              ; 50EB   0004 0118 007B
        STRING  "MOUNTAIN"                      ; 50EE  
        DECLE   $0000                           ; 50F6   0000

        MVI     G_019D, R0                      ; 50F7   0280 019D
        SLR     R0,     1                       ; 50F9   0060
        INCR    R0                              ; 50FA   0008
        MVII    #$0001, R1                      ; 50FB   02B9 0001
        INCR    R4                              ; 50FD   000C

        JSR     R5,     X_PRNUM_RGT             ; 50FE   0004 0118 00C5

        SDBD                                    ; 5101   0001
        MVII    #$51E8, R4                      ; 5102   02BC 00E8 0051
        ADD     G_019D, R4                      ; 5105   02C4 019D
        SDBD                                    ; 5107   0001
        MVI@    R4,     R1                      ; 5108   02A1
        SDBD                                    ; 5109   0001
        MVI@    R4,     R0                      ; 510A   02A0
        SUBR    R1,     R0                      ; 510B   0108
        DECR    R0                              ; 510C   0010
        SARC    R0,     1                       ; 510D   0078
        BNC     L_5115                          ; 510E   0209 0005

        CMPI    #$0004, R0                      ; 5110   0378 0004
        BGE     L_5115                          ; 5112   020D 0001

        INCR    R0                              ; 5114   0008
L_5115:
        MVII    #$0282, R4                      ; 5115   02BC 0282
        SUBR    R0,     R4                      ; 5117   0104
        SDBD                                    ; 5118   0001
        MVII    #$2400, R3                      ; 5119   02BB 0000 0024

        JSR     R5,     X_PRINT_R1              ; 511C   0004 0118 0067

        SDBD                                    ; 511F   0001
        MVII    #$51DE, R0                      ; 5120   02B8 00DE 0051
        MVO     R0,     G_035D                  ; 5123   0240 035D
        PULR    R7                              ; 5125   02B7

        PSHR    R5                              ; 5126   0275
        DIS                                     ; 5127   0003
        SDBD                                    ; 5128   0001
        MVII    #$D8E3, R0                      ; 5129   02B8 00E3 00D8
        MVO     R0,     .ISRVEC.0               ; 512C   0240 0100
        SWAP    R0,     1                       ; 512E   0040
        MVO     R0,     .ISRVEC.1               ; 512F   0240 0101
        EIS                                     ; 5131   0002
        MVII    #$0007, R0                      ; 5132   02B8 0007
        MVO     R0,     G_01A3                  ; 5134   0240 01A3

        JSR     R5,     L_DAE7                  ; 5136   0004 01D8 02E7

        PULR    R7                              ; 5139   02B7

L_513A:
        PSHR    R5                              ; 513A   0275
        MVII    #$0200, R3                      ; 513B   02BB 0200
        SDBD                                    ; 513D   0001
        MVII    #$D4B0, R4                      ; 513E   02BC 00B0 00D4
L_5141:
        MVI@    R4,     R0                      ; 5141   02A0
        SLL     R0,     1                       ; 5142   0048
        MOVR    R0,     R5                      ; 5143   0085
        SDBD                                    ; 5144   0001
        ADDI    #$6D2D, R5                      ; 5145   02FD 002D 006D
        SDBD                                    ; 5148   0001
        MVI@    R5,     R2                      ; 5149   02AA
        MVO@    R2,     R3                      ; 514A   025A
        INCR    R3                              ; 514B   000B
        CMPI    #$02F0, R3                      ; 514C   037B 02F0
        BLT     L_5141                          ; 514E   0225 000E

        JSR     R5,     L_516D                  ; 5150   0004 0150 016D

        SDBD                                    ; 5153   0001
        MVII    #$614D, R1                      ; 5154   02B9 004D 0061

        JSR     R5,     L_51BD                  ; 5157   0004 0150 01BD

        SDBD                                    ; 515A   0001
        MVII    #$4800, R0                      ; 515B   02B8 0000 0048

        JSR     R5,     L_51A5                  ; 515E   0004 0150 01A5

        SDBD                                    ; 5161   0001
        MVII    #$4600, R1                      ; 5162   02B9 0000 0046

        JSR     R5,     L_51AD                  ; 5165   0004 0150 01AD

        MVII    #$0001, R0                      ; 5168   02B8 0001
        MVO     R0,     G_016B                  ; 516A   0240 016B
        PULR    R7                              ; 516C   02B7

L_516D:
        PSHR    R5                              ; 516D   0275
        MVII    #$031D, R4                      ; 516E   02BC 031D
        SDBD                                    ; 5170   0001
        MVII    #$1840, R0                      ; 5171   02B8 0040 0018
        MVO@    R0,     R4                      ; 5174   0260
        ADDI    #$0006, R4                      ; 5175   02FC 0006

        JSR     R5,     L_5196                  ; 5177   0004 0150 0196

        MVO@    R2,     R4                      ; 517A   0262
        SDBD                                    ; 517B   0001
        MVII    #$1852, R0                      ; 517C   02B8 0052 0018
        MVO@    R0,     R4                      ; 517F   0260
        ADDI    #$0006, R4                      ; 5180   02FC 0006
        MVII    #$00C8, R0                      ; 5182   02B8 00C8
        MVO@    R0,     R4                      ; 5184   0260
        SDBD                                    ; 5185   0001
        MVII    #$1842, R0                      ; 5186   02B8 0042 0018
        MVO@    R0,     R4                      ; 5189   0260
        ADDI    #$0006, R4                      ; 518A   02FC 0006
        MVII    #$0064, R0                      ; 518C   02B8 0064
        MVO@    R0,     R4                      ; 518E   0260

        JSR     R5,     L_60EC                  ; 518F   0004 0160 00EC
        JSR     R5,     L_575F                  ; 5192   0004 0154 035F

        PULR    R7                              ; 5195   02B7

L_5196:
        PSHR    R5                              ; 5196   0275
        MVI     G_019D, R2                      ; 5197   0282 019D
        SLR     R2,     1                       ; 5199   0062
        MVII    #$0009, R0                      ; 519A   02B8 0009
        SUBR    R2,     R0                      ; 519C   0110
        MVII    #$0032, R1                      ; 519D   02B9 0032

        JSR     R5,     X_MPY                   ; 519F   0004 011C 01DC

        ADDI    #$012C, R2                      ; 51A2   02FA 012C
        PULR    R7                              ; 51A4   02B7

L_51A5:
        PSHR    R5                              ; 51A5   0275
        MVO     R0,     G_031F                  ; 51A6   0240 031F
        MVO     R0,     G_0327                  ; 51A8   0240 0327
        MVO     R0,     G_032F                  ; 51AA   0240 032F
        PULR    R7                              ; 51AC   02B7

L_51AD:
        PSHR    R5                              ; 51AD   0275
        MVO     R1,     G_0320                  ; 51AE   0241 0320
        MVO     R1,     G_0328                  ; 51B0   0241 0328
        MVO     R1,     G_0330                  ; 51B2   0241 0330
        PULR    R7                              ; 51B4   02B7

L_51B5:
        PSHR    R5                              ; 51B5   0275
        MVO     R2,     G_0322                  ; 51B6   0242 0322
        MVO     R2,     G_032A                  ; 51B8   0242 032A
        MVO     R2,     G_0332                  ; 51BA   0242 0332
        PULR    R7                              ; 51BC   02B7

L_51BD:
        PSHR    R5                              ; 51BD   0275
        MVII    #$031E, R2                      ; 51BE   02BA 031E
L_51C0:
        MVO@    R1,     R2                      ; 51C0   0251
        ADDI    #$0007, R1                      ; 51C1   02F9 0007
        ADDI    #$0008, R2                      ; 51C3   02FA 0008
        CMPI    #$032E, R2                      ; 51C5   037A 032E
        BLE     L_51C0                          ; 51C7   0226 0008
        PULR    R7                              ; 51C9   02B7

        DECLE   $002C,  $0001,  $0036,  $0001   ; 51CA   002C 0001 0036 0001
        DECLE   $0040,  $0001,  $004A,  $0001   ; 51CE   0040 0001 004A 0001
        DECLE   $005E,  $0001,  $0072,  $0001   ; 51D2   005E 0001 0072 0001
        DECLE   $0086,  $0001,  $00A9,  $0001   ; 51D6   0086 0001 00A9 0001
        DECLE   $00C2,  $0001,  $0052,  $0003   ; 51DA   00C2 0001 0052 0003
        DECLE   $0026,  $0051,  $0000,  $0000   ; 51DE   0026 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 51E6   0000 0000

        ADDR    R7,     R6                      ; 51E8   00FE
        RLC     R1,     1                       ; 51E9   0051
        INCR    R7                              ; 51EA   000F

        RLC     R2,     1                       ; 51EB   0052
L_51EC:
        NEGR    R1                              ; 51EC   0021
        RLC     R2,     1                       ; 51ED   0052
        GSWD    R1                              ; 51EE   0031
        RLC     R2,     1                       ; 51EF   0052
        RSWD    R4                              ; 51F0   003C
        RLC     R2,     1                       ; 51F1   0052
        SWAP    R3,     2                       ; 51F2   0047
        RLC     R2,     1                       ; 51F3   0052
        RLC     R3,     2                       ; 51F4   0057
        RLC     R2,     1                       ; 51F5   0052
        SAR     R0,     1                       ; 51F6   0068
        RLC     R2,     1                       ; 51F7   0052
        RRC     R1,     2                       ; 51F8   0075
        RLC     R2,     1                       ; 51F9   0052
        MOVR    R1,     R0                      ; 51FA   0088
        RLC     R2,     1                       ; 51FB   0052
        MOVR    R2,     R7                      ; 51FC   0097

        DECLE   $0052,  $0042,  $0045,  $0047   ; 51FD   0052 0042 0045 0047
        DECLE   $0049,  $004E,  $004E,  $0045   ; 5201   0049 004E 004E 0045
        DECLE   $0052,  $0027,  $0053,  $0020   ; 5205   0052 0027 0053 0020
        DECLE   $0042,  $004C,  $0055,  $0046   ; 5209   0042 004C 0055 0046
        DECLE   $0046,  $0000,  $0046,  $004C   ; 520D   0046 0000 0046 004C
        DECLE   $0041,  $0054,  $0020,  $0046   ; 5211   0041 0054 0020 0046
        DECLE   $004F,  $004F,  $0054,  $0045   ; 5215   004F 004F 0054 0045
        DECLE   $0044,  $0020,  $0046,  $004C   ; 5219   0044 0020 0046 004C
        DECLE   $0041,  $0054,  $0053,  $0000   ; 521D   0041 0054 0053 0000
        DECLE   $0048,  $0049,  $004C,  $004C   ; 5221   0048 0049 004C 004C
        DECLE   $0059,  $0020,  $0048,  $0049   ; 5225   0059 0020 0048 0049
        DECLE   $0047,  $0048,  $004C,  $0041   ; 5229   0047 0048 004C 0041
        DECLE   $004E,  $0044,  $0053,  $0000   ; 522D   004E 0044 0053 0000
        DECLE   $0054,  $0049,  $004E,  $0059   ; 5231   0054 0049 004E 0059
        DECLE   $0020,  $0054,  $004F,  $0057   ; 5235   0020 0054 004F 0057
        DECLE   $0045,  $0052,  $0000,  $0041   ; 5239   0045 0052 0000 0041
        DECLE   $004E,  $0059,  $0020,  $0049   ; 523D   004E 0059 0020 0049
        DECLE   $0044,  $0045,  $0041,  $0053   ; 5241   0044 0045 0041 0053
        DECLE   $003F,  $0000,  $0054,  $0052   ; 5245   003F 0000 0054 0052
        DECLE   $0045,  $004D,  $0042,  $004C   ; 5249   0045 004D 0042 004C
        DECLE   $0049,  $004E,  $0047,  $0020   ; 524D   0049 004E 0047 0020
        DECLE   $0054,  $004F,  $0057,  $0045   ; 5251   0054 004F 0057 0045
        DECLE   $0052,  $0000,  $0050,  $0052   ; 5255   0052 0000 0050 0052
        DECLE   $0045,  $0043,  $0049,  $0050   ; 5259   0045 0043 0049 0050
        DECLE   $0049,  $0054,  $004F,  $0055   ; 525D   0049 0054 004F 0055
        DECLE   $0053,  $0020,  $0050,  $0045   ; 5261   0053 0020 0050 0045
        DECLE   $0041,  $004B,  $0000,  $0053   ; 5265   0041 004B 0000 0053
        DECLE   $0041,  $004E,  $0049,  $0054   ; 5269   0041 004E 0049 0054
        DECLE   $0059,  $0027,  $0053,  $0020   ; 526D   0059 0027 0053 0020
        DECLE   $0045,  $004E,  $0044,  $0000   ; 5271   0045 004E 0044 0000
        DECLE   $0044,  $0045,  $0041,  $0044   ; 5275   0044 0045 0041 0044
        DECLE   $004D,  $0041,  $004E,  $0027   ; 5279   004D 0041 004E 0027
        DECLE   $0053,  $0020,  $004D,  $004F   ; 527D   0053 0020 004D 004F
        DECLE   $0055,  $004E,  $0054,  $0041   ; 5281   0055 004E 0054 0041
        DECLE   $0049,  $004E,  $0000,  $0053   ; 5285   0049 004E 0000 0053
        DECLE   $0055,  $0049,  $0043,  $0049   ; 5289   0055 0049 0043 0049
        DECLE   $0044,  $0045,  $0020,  $0053   ; 528D   0044 0045 0020 0053
        DECLE   $0055,  $004D,  $004D,  $0049   ; 5291   0055 004D 004D 0049
        DECLE   $0054,  $0000,  $0000           ; 5295   0054 0000 0000
L_5298:
        PSHR    R5                              ; 5298   0275
        MVI     G_0169, R0                      ; 5299   0280 0169
        CMPI    #$0032, R0                      ; 529B   0378 0032
        BEQ     L_52A5                          ; 529D   0204 0006

        TSTR    R0                              ; 529F   0080
        BEQ     L_52BD                          ; 52A0   0204 001B

        DECR    R0                              ; 52A2   0010
        MVO     R0,     G_0169                  ; 52A3   0240 0169
L_52A5:
        MVI     G_0191, R1                      ; 52A5   0281 0191
        CMPI    #$0001, R1                      ; 52A7   0379 0001
        BLT     L_52BD                          ; 52A9   0205 0012
        BEQ     L_52B6                          ; 52AB   0204 0009

        JSR     R5,     L_DAE7                  ; 52AD   0004 01D8 02E7

        CLRR    R0                              ; 52B0   01C0
        MVO     R0,     G_0191                  ; 52B1   0240 0191
        EIS                                     ; 52B3   0002
        B       L_52BD                          ; 52B4   0200 0007

L_52B6:
        JSR     R5,     L_DCBC                  ; 52B6   0004 01DC 00BC

        CLRR    R0                              ; 52B9   01C0
        MVO     R0,     G_0191                  ; 52BA   0240 0191
        EIS                                     ; 52BC   0002
L_52BD:
        MVI     .PSG0.rgt_hand,R0               ; 52BD   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 52BF   0380 01FF
        PSHR    R0                              ; 52C1   0270
        CMPI    #$00FF, R0                      ; 52C2   0378 00FF
        BEQ     L_5306                          ; 52C4   0204 0040

        SWAP    R0,     1                       ; 52C6   0040
        ANDI    #$000E, R0                      ; 52C7   03B8 000E
        CMPI    #$000E, R0                      ; 52C9   0378 000E
        BEQ     L_52EC                          ; 52CB   0204 001F

        CMPI    #$0100, R0                      ; 52CD   0378 0100
        BEQ     L_52E3                          ; 52CF   0204 0012

        SDBD                                    ; 52D1   0001
        CMPI    #$1000, R0                      ; 52D2   0378 0000 0010
        BEQ     L_52DF                          ; 52D5   0204 0008

        CMPI    #$0010, R0                      ; 52D7   0378 0010
        BNEQ    L_5306                          ; 52D9   020C 002B

        MVII    #$0008, R4                      ; 52DB   02BC 0008
        B       L_52E5                          ; 52DD   0200 0006

L_52DF:
        MVII    #$0006, R4                      ; 52DF   02BC 0006
        B       L_52E5                          ; 52E1   0200 0002

L_52E3:
        MVII    #$0004, R4                      ; 52E3   02BC 0004
L_52E5:
        ADDI    #$035D, R4                      ; 52E5   02FC 035D
        SDBD                                    ; 52E7   0001
        MVI@    R4,     R2                      ; 52E8   02A2
        MVI     .BTAB.EC,R5                     ; 52E9   0285 02EC
        MOVR    R2,     R7                      ; 52EB   0097

L_52EC:
        PULR    R1                              ; 52EC   02B1
        ANDI    #$001F, R1                      ; 52ED   03B9 001F
        CLRR    R0                              ; 52EF   01C0
        SDBD                                    ; 52F0   0001
        MVII    #$5326, R3                      ; 52F1   02BB 0026 0053
L_52F4:
        ADDR    R0,     R3                      ; 52F4   00C3
        MVI@    R3,     R2                      ; 52F5   029A
        CMPR    R2,     R1                      ; 52F6   0151
        BEQ     L_5300                          ; 52F7   0204 0007

        INCR    R0                              ; 52F9   0008
        CMPI    #$000F, R0                      ; 52FA   0378 000F
        BLE     L_52F4                          ; 52FC   0226 0009
        B       L_5307                          ; 52FE   0200 0007

L_5300:
        MVI     G_035D, R4                      ; 5300   0284 035D
        SDBD                                    ; 5302   0001
        MVI@    R4,     R3                      ; 5303   02A3
        INCR    R3                              ; 5304   000B
        MOVR    R3,     R7                      ; 5305   009F

L_5306:
        PULR    R4                              ; 5306   02B4
L_5307:
        MVI     G_035D, R4                      ; 5307   0284 035D
        SDBD                                    ; 5309   0001
        MVI@    R4,     R3                      ; 530A   02A3
        TSTR    R3                              ; 530B   009B
        BEQ     L_5325                          ; 530C   0204 0017

        INCR    R3                              ; 530E   000B
        CLRR    R1                              ; 530F   01C9
        MVI     G_011F, R0                      ; 5310   0280 011F
        MOVR    R0,     R2                      ; 5312   0082
        ANDI    #$003F, R0                      ; 5313   03B8 003F
        ANDI    #$00C0, R2                      ; 5315   03BA 00C0
        BNEQ    L_531A                          ; 5317   020C 0001
        MOVR    R3,     R7                      ; 5319   009F

L_531A:
        INCR    R1                              ; 531A   0009
        MVI     G_0120, R0                      ; 531B   0280 0120
        MOVR    R0,     R2                      ; 531D   0082
        ANDI    #$003F, R0                      ; 531E   03B8 003F
        ANDI    #$00C0, R2                      ; 5320   03BA 00C0
        BNEQ    L_5325                          ; 5322   020C 0001
        MOVR    R3,     R7                      ; 5324   009F
L_5325:
        PULR    R7                              ; 5325   02B7

        COMR    R5                              ; 5326   001D
        COMR    R1                              ; 5327   0019
        INCR    R1                              ; 5328   0009
        INCR    R3                              ; 5329   000B
        COMR    R3                              ; 532A   001B
        DECR    R3                              ; 532B   0013
        DIS                                     ; 532C   0003
        SETC                                    ; 532D   0007
L_532E:
        DECR    R7                              ; 532E   0017

        DECR    R6                              ; 532F   0016
        CLRC                                    ; 5330   0006
        INCR    R6                              ; 5331   000E
        COMR    R6                              ; 5332   001E
        COMR    R4                              ; 5333   001C
        INCR    R4                              ; 5334   000C
        INCR    R5                              ; 5335   000D
L_5336:
        PSHR    R5                              ; 5336   0275
        MVI     G_018C, R0                      ; 5337   0280 018C
        TSTR    R0                              ; 5339   0080
        BNEQ    L_5341                          ; 533A   020C 0005

        MVI     G_0338, R0                      ; 533C   0280 0338
        TSTR    R0                              ; 533E   0080
        BMI     L_5349                          ; 533F   020B 0008

L_5341:
        MVI     G_0338, R0                      ; 5341   0280 0338
        SDBD                                    ; 5343   0001
        CMPI    #$7000, R0                      ; 5344   0378 0000 0070
        BLT     L_535A                          ; 5347   0205 0011

L_5349:
        CLRR    R0                              ; 5349   01C0
        MVO     R0,     G_016A                  ; 534A   0240 016A
        MVO     R0,     G_0335                  ; 534C   0240 0335
        MVO     R0,     G_0185                  ; 534E   0240 0185
        INCR    R0                              ; 5350   0008
        MVO     R0,     G_0184                  ; 5351   0240 0184
        SDBD                                    ; 5353   0001
        MVII    #$5024, R1                      ; 5354   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 5357   0004 0118 0038

L_535A:
        PULR    R7                              ; 535A   02B7

L_535B:
        PSHR    R5                              ; 535B   0275
        MVI     G_0182, R0                      ; 535C   0280 0182
        TSTR    R0                              ; 535E   0080
        BEQ     L_5370                          ; 535F   0204 000F

        MVI     G_018E, R0                      ; 5361   0280 018E
        TSTR    R0                              ; 5363   0080
        BNEQ    L_5370                          ; 5364   020C 000A

        MVI     G_033A, R2                      ; 5366   0282 033A
        INCR    R2                              ; 5368   000A
        ANDI    #$0007, R2                      ; 5369   03BA 0007
        MVO     R2,     G_033A                  ; 536B   0242 033A

        JSR     R5,     L_51B5                  ; 536D   0004 0150 01B5

L_5370:
        MVI     G_0163, R0                      ; 5370   0280 0163
        CMPI    #$00A8, R0                      ; 5372   0378 00A8
        BNEQ    L_537D                          ; 5374   020C 0007

        MVI     G_0165, R0                      ; 5376   0280 0165
        TSTR    R0                              ; 5378   0080
        BNEQ    L_53DC                          ; 5379   020C 0061
        B       L_53B6                          ; 537B   0200 0039

L_537D:
        MVI     G_0193, R0                      ; 537D   0280 0193
        TSTR    R0                              ; 537F   0080
        BEQ     L_53DC                          ; 5380   0204 005A

        CLRR    R0                              ; 5382   01C0
        MVO     R0,     G_0335                  ; 5383   0240 0335
        MVO     R0,     G_016A                  ; 5385   0240 016A
        MVO     R0,     G_0193                  ; 5387   0240 0193
        INCR    R0                              ; 5389   0008
        MVO     R0,     G_0184                  ; 538A   0240 0184
        MVI     G_0182, R1                      ; 538C   0281 0182
        TSTR    R1                              ; 538E   0089
        BEQ     L_53D5                          ; 538F   0204 0044

        MVO     R0,     G_018F                  ; 5391   0240 018F
        SDBD                                    ; 5393   0001
        MVII    #$61A1, R1                      ; 5394   02B9 00A1 0061

        JSR     R5,     L_51BD                  ; 5397   0004 0150 01BD

        CLRR    R2                              ; 539A   01D2
        MVO     R2,     G_0182                  ; 539B   0242 0182
        MVII    #$0003, R2                      ; 539D   02BA 0003

        JSR     R5,     L_51B5                  ; 539F   0004 0150 01B5

        SDBD                                    ; 53A2   0001
        MVII    #$3F00, R1                      ; 53A3   02B9 0000 003F

        JSR     R5,     L_51AD                  ; 53A6   0004 0150 01AD

        MVI     G_018E, R0                      ; 53A9   0280 018E
        TSTR    R0                              ; 53AB   0080
        BNEQ    L_53BE                          ; 53AC   020C 0010

        SDBD                                    ; 53AE   0001
        MVII    #$6FB6, R0                      ; 53AF   02B8 00B6 006F
        MVO     R0,     G_035D                  ; 53B2   0240 035D
        B       L_53BE                          ; 53B4   0200 0008

L_53B6:
        INCR    R0                              ; 53B6   0008
        MVO     R0,     G_0185                  ; 53B7   0240 0185
        MVI     G_0182, R0                      ; 53B9   0280 0182
        TSTR    R0                              ; 53BB   0080
        BEQ     L_53D5                          ; 53BC   0204 0017

L_53BE:
        MVI     G_0163, R0                      ; 53BE   0280 0163
        MVO     R0,     G_0160                  ; 53C0   0240 0160
        MVI     G_0165, R2                      ; 53C2   0282 0165
        MVO     R2,     G_0162                  ; 53C4   0242 0162
        MVI     G_0164, R2                      ; 53C6   0282 0164
        MVO     R2,     G_0161                  ; 53C8   0242 0161

        JSR     R5,     L_5CEA                  ; 53CA   0004 015C 00EA

        MVI     G_031D, R0                      ; 53CD   0280 031D
        SDBD                                    ; 53CF   0001
        XORI    #$0800, R0                      ; 53D0   03F8 0000 0008
        MVO     R0,     G_031D                  ; 53D3   0240 031D
L_53D5:
        SDBD                                    ; 53D5   0001
        MVII    #$5028, R1                      ; 53D6   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 53D9   0004 0118 0038

L_53DC:
        PULR    R7                              ; 53DC   02B7

L_53DD:
        PSHR    R5                              ; 53DD   0275
        MVI     G_018E, R0                      ; 53DE   0280 018E
        TSTR    R0                              ; 53E0   0080
        BEQ     L_53E8                          ; 53E1   0204 0005

        JSR     R5,     L_DA4F                  ; 53E3   0004 01D8 024F

        B       L_53FA                          ; 53E6   0200 0012

L_53E8:
        JSR     R5,     L_53FB                  ; 53E8   0004 0150 03FB
        JSR     R5,     L_5410                  ; 53EB   0004 0154 0010
        JSR     R5,     L_54A8                  ; 53EE   0004 0154 00A8
        JSR     R5,     L_550A                  ; 53F1   0004 0154 010A
        JSR     R5,     L_5680                  ; 53F4   0004 0154 0280
        JSR     R5,     L_5712                  ; 53F7   0004 0154 0312

L_53FA:
        PULR    R7                              ; 53FA   02B7

L_53FB:
        PSHR    R5                              ; 53FB   0275
        MVI     G_01A9, R0                      ; 53FC   0280 01A9
        SLR     R0,     2                       ; 53FE   0064
        ADD     G_01AB, R0                      ; 53FF   02C0 01AB
        MVO     R0,     G_01A6                  ; 5401   0240 01A6
        CMPI    #$0028, R0                      ; 5403   0378 0028
        BGT     L_540B                          ; 5405   020E 0004

        MVII    #$0002, R1                      ; 5407   02B9 0002
        B       L_540D                          ; 5409   0200 0002

L_540B:
        MVII    #$0003, R1                      ; 540B   02B9 0003
L_540D:
        MVO     R1,     G_01A7                  ; 540D   0241 01A7
        PULR    R7                              ; 540F   02B7

L_5410:
        PSHR    R5                              ; 5410   0275
        MVI     G_0187, R0                      ; 5411   0280 0187
        TSTR    R0                              ; 5413   0080
        BEQ     L_542A                          ; 5414   0204 0014

        JSR     R5,     L_5903                  ; 5416   0004 0158 0103

        TSTR    R3                              ; 5419   009B
        BNEQ    L_542A                          ; 541A   020C 000E

        MVO     R0,     G_0187                  ; 541C   0240 0187
        MVII    #$000B, R0                      ; 541E   02B8 000B

        JSR     R5,     X_RAND2                 ; 5420   0004 0114 029E

        CMP     G_01A1, R0                      ; 5423   0340 01A1
        BGE     L_542A                          ; 5425   020D 0003

        JSR     R5,     L_542B                  ; 5427   0004 0154 002B

L_542A:
        PULR    R7                              ; 542A   02B7

L_542B:
        PSHR    R5                              ; 542B   0275
        SDBD                                    ; 542C   0001
        MVII    #$1000, R2                      ; 542D   02BA 0000 0010
        MVO     R2,     G_0350                  ; 5430   0242 0350
        SDBD                                    ; 5432   0001
        MVII    #$3000, R2                      ; 5433   02BA 0000 0030
        MVO     R2,     G_0358                  ; 5436   0242 0358
        SDBD                                    ; 5438   0001
        MVII    #$6213, R0                      ; 5439   02B8 0013 0062
        MVO     R0,     G_034E                  ; 543C   0240 034E
        MVO     R0,     G_0356                  ; 543E   0240 0356
        SDBD                                    ; 5440   0001
        MVII    #$1151, R0                      ; 5441   02B8 0051 0011
        MVO     R0,     G_034D                  ; 5444   0240 034D
        MVO     R0,     G_0355                  ; 5446   0240 0355
        MVII    #$0006, R0                      ; 5448   02B8 0006

        JSR     R5,     .EXEC.41C               ; 544A   0004 0114 001C

        MVII    #$0007, R0                      ; 544D   02B8 0007

        JSR     R5,     .EXEC.41C               ; 544F   0004 0114 001C

        MVII    #$0007, R0                      ; 5452   02B8 0007
        MVO     R0,     G_019F                  ; 5454   0240 019F
        MVI     G_01B6, R0                      ; 5456   0280 01B6
        TSTR    R0                              ; 5458   0080
        BNEQ    L_545E                          ; 5459   020C 0003

        JSR     R5,     L_545F                  ; 545B   0004 0154 005F

L_545E:
        PULR    R7                              ; 545E   02B7

L_545F:
        PSHR    R5                              ; 545F   0275
        CLRR    R3                              ; 5460   01DB
L_5461:
        NOP                                     ; 5461   0034
        NOP                                     ; 5462   0034
        NOP                                     ; 5463   0034
        NOP                                     ; 5464   0034
        MVII    #$01B2, R2                      ; 5465   02BA 01B2
        ADDR    R3,     R2                      ; 5467   00DA
        MVI@    R2,     R0                      ; 5468   0290
        SUB     G_01A1, R0                      ; 5469   0300 01A1
        BMI     L_5485                          ; 546B   020B 0018

        MVO@    R0,     R2                      ; 546D   0250
        NOP                                     ; 546E   0034
        NOP                                     ; 546F   0034
        SDBD                                    ; 5470   0001
        MVII    #$5952, R2                      ; 5471   02BA 0052 0059
        ADDR    R3,     R2                      ; 5474   00DA
        MVI@    R2,     R0                      ; 5475   0290
        MVI     G_01A1, R1                      ; 5476   0281 01A1

        JSR     R5,     X_MPY                   ; 5478   0004 011C 01DC

        NOP                                     ; 547B   0034
        NOP                                     ; 547C   0034
        NOP                                     ; 547D   0034
        MVI     G_01A9, R0                      ; 547E   0280 01A9
        SUBR    R2,     R0                      ; 5480   0110
        MVO     R0,     G_01A9                  ; 5481   0240 01A9
        B       L_5496                          ; 5483   0200 0011

L_5485:
        MVI@    R2,     R1                      ; 5485   0291
        CLRR    R0                              ; 5486   01C0
        MVO@    R0,     R2                      ; 5487   0250
        SDBD                                    ; 5488   0001
        MVII    #$5952, R2                      ; 5489   02BA 0052 0059
        ADDR    R3,     R2                      ; 548C   00DA
        MVI@    R2,     R0                      ; 548D   0290

        JSR     R5,     X_MPY                   ; 548E   0004 011C 01DC

        MVI     G_01A9, R0                      ; 5491   0280 01A9
        SUBR    R2,     R0                      ; 5493   0110
        MVO     R0,     G_01A9                  ; 5494   0240 01A9
L_5496:
        NOP                                     ; 5496   0034
        NOP                                     ; 5497   0034
        NOP                                     ; 5498   0034
        INCR    R3                              ; 5499   000B
        CMPI    #$0002, R3                      ; 549A   037B 0002
        BLT     L_5461                          ; 549C   0225 003C

        NOP                                     ; 549E   0034
        NOP                                     ; 549F   0034
        NOP                                     ; 54A0   0034
        NOP                                     ; 54A1   0034
        INCR    R3                              ; 54A2   000B
        CMPI    #$0003, R3                      ; 54A3   037B 0003
        BEQ     L_5461                          ; 54A5   0224 0045
        PULR    R7                              ; 54A7   02B7

L_54A8:
        PSHR    R5                              ; 54A8   0275
        MVI     G_016B, R0                      ; 54A9   0280 016B
        TSTR    R0                              ; 54AB   0080
        BEQ     L_54BA                          ; 54AC   0204 000C

        CMPI    #$0005, R0                      ; 54AE   0378 0005
        BEQ     L_54B7                          ; 54B0   0204 0005

        INCR    R0                              ; 54B2   0008
        MVO     R0,     G_016B                  ; 54B3   0240 016B
        B       L_54BA                          ; 54B5   0200 0003

L_54B7:
        CLRR    R0                              ; 54B7   01C0
        MVO     R0,     G_016B                  ; 54B8   0240 016B
L_54BA:
        MVI     G_0183, R0                      ; 54BA   0280 0183
        TSTR    R0                              ; 54BC   0080
        BEQ     L_54DA                          ; 54BD   0204 001B

        MVI     G_0177, R0                      ; 54BF   0280 0177
        INCR    R0                              ; 54C1   0008
        MVO     R0,     G_0177                  ; 54C2   0240 0177
        CMPI    #$0004, R0                      ; 54C4   0378 0004
        BLT     L_54DA                          ; 54C6   0205 0012

        CLRR    R0                              ; 54C8   01C0
        MVO     R0,     G_0177                  ; 54C9   0240 0177
        MVI     G_0322, R2                      ; 54CB   0282 0322
        INCR    R2                              ; 54CD   000A
        CMPI    #$0004, R2                      ; 54CE   037A 0004
        BEQ     L_54D7                          ; 54D0   0204 0005

        JSR     R5,     L_51B5                  ; 54D2   0004 0150 01B5

        B       L_54DA                          ; 54D5   0200 0003

L_54D7:
        CLRR    R0                              ; 54D7   01C0
        MVO     R0,     G_0183                  ; 54D8   0240 0183
L_54DA:
        MVI     G_016F, R0                      ; 54DA   0280 016F
        TSTR    R0                              ; 54DC   0080
        BEQ     L_54E7                          ; 54DD   0204 0008

        INCR    R0                              ; 54DF   0008
        CMPI    #$0014, R0                      ; 54E0   0378 0014
        BNEQ    L_54E5                          ; 54E2   020C 0001

        CLRR    R0                              ; 54E4   01C0
L_54E5:
        MVO     R0,     G_016F                  ; 54E5   0240 016F
L_54E7:
        MVI     G_0170, R0                      ; 54E7   0280 0170
        TSTR    R0                              ; 54E9   0080
        BEQ     L_54F4                          ; 54EA   0204 0008

        INCR    R0                              ; 54EC   0008
        CMPI    #$0014, R0                      ; 54ED   0378 0014
        BNEQ    L_54F2                          ; 54EF   020C 0001

        CLRR    R0                              ; 54F1   01C0
L_54F2:
        MVO     R0,     G_0170                  ; 54F2   0240 0170
L_54F4:
        MVI     G_0171, R0                      ; 54F4   0280 0171
        TSTR    R0                              ; 54F6   0080
        BEQ     L_5509                          ; 54F7   0204 0010

        INCR    R0                              ; 54F9   0008
        CMPI    #$000A, R0                      ; 54FA   0378 000A
        BNEQ    L_5507                          ; 54FC   020C 0009

        MVI     G_0335, R0                      ; 54FE   0280 0335
        SDBD                                    ; 5500   0001
        XORI    #$0800, R0                      ; 5501   03F8 0000 0008
        MVO     R0,     G_0335                  ; 5504   0240 0335
        CLRR    R0                              ; 5506   01C0
L_5507:
        MVO     R0,     G_0171                  ; 5507   0240 0171
L_5509:
        PULR    R7                              ; 5509   02B7

L_550A:
        PSHR    R5                              ; 550A   0275
        MVI     G_015F, R0                      ; 550B   0280 015F
        CMPI    #$0004, R0                      ; 550D   0378 0004
        BNEQ    L_55CC                          ; 550F   020C 00BB

        MVI     G_015D, R0                      ; 5511   0280 015D
        TSTR    R0                              ; 5513   0080
        BNEQ    L_55CC                          ; 5514   020C 00B6

        SDBD                                    ; 5516   0001
        MVII    #$6108, R1                      ; 5517   02B9 0008 0061
        MVII    #$0335, R2                      ; 551A   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 551C   0004 0114 02B2

        ADDI    #$0008, R2                      ; 551F   02FA 0008

        JSR     R5,     X_INIT_MOB              ; 5521   0004 0114 02B2

        MVI@    R2,     R0                      ; 5524   0290
        XORI    #$0200, R0                      ; 5525   03F8 0200
        MVO@    R0,     R2                      ; 5527   0250
        MVII    #$00F9, R0                      ; 5528   02B8 00F9
        SWAP    R0,     1                       ; 552A   0040
        MVO     R0,     G_033F                  ; 552B   0240 033F
        MVO     R2,     G_018F                  ; 552D   0242 018F
        MVII    #$0345, R2                      ; 552F   02BA 0345
        SDBD                                    ; 5531   0001
        MVII    #$6118, R1                      ; 5532   02B9 0018 0061

        JSR     R5,     X_INIT_MOB              ; 5535   0004 0114 02B2
        JSR     R5,     L_55CD                  ; 5538   0004 0154 01CD

        MVI     G_0318, R0                      ; 553B   0280 0318
        MVI     G_0317, R1                      ; 553D   0281 0317
        MVII    #$025C, R4                      ; 553F   02BC 025C
        MVII    #$0206, R3                      ; 5541   02BB 0206

        JSR     R5,     L_563E                  ; 5543   0004 0154 023E

        MVI     G_0316, R0                      ; 5546   0280 0316
        MVI     G_0315, R1                      ; 5548   0281 0315
        MVII    #$0234, R4                      ; 554A   02BC 0234
        MVII    #$0206, R3                      ; 554C   02BB 0206

        JSR     R5,     L_563E                  ; 554E   0004 0154 023E

        MVI     G_019D, R0                      ; 5551   0280 019D
        SLR     R0,     1                       ; 5553   0060
        INCR    R0                              ; 5554   0008
        MVII    #$0002, R1                      ; 5555   02B9 0002
        MVII    #$0206, R3                      ; 5557   02BB 0206
        MVII    #$0233, R4                      ; 5559   02BC 0233

        JSR     R5,     X_PRNUM_RGT             ; 555B   0004 0118 00C5

        MVII    #$0206, R3                      ; 555E   02BB 0206
        MVII    #$022B, R4                      ; 5560   02BC 022B
        MVI     G_019D, R0                      ; 5562   0280 019D
        CMPI    #$0010, R0                      ; 5564   0378 0010
        BLE     L_5569                          ; 5566   0206 0001

        DECR    R4                              ; 5568   0014

L_5569:
        JSR     R5,     X_PRINT_R5              ; 5569   0004 0118 007B
        STRING  "MOUNTAIN"                      ; 556C  
        DECLE   $0000                           ; 5574   0000

        MVII    #$0256, R4                      ; 5575   02BC 0256
        MVI     G_0317, R0                      ; 5577   0280 0317
        CMPI    #$0009, R0                      ; 5579   0378 0009
        BGT     L_5581                          ; 557B   020E 0004

        ADDI    #$0003, R4                      ; 557D   02FC 0003
        B       L_558E                          ; 557F   0200 000D

L_5581:
        CMPI    #$0063, R0                      ; 5581   0378 0063
        BGT     L_5589                          ; 5583   020E 0004

        ADDI    #$0002, R4                      ; 5585   02FC 0002
        B       L_558E                          ; 5587   0200 0005

L_5589:
        CMPI    #$03E7, R0                      ; 5589   0378 03E7
        BGT     L_558E                          ; 558B   020E 0001

        INCR    R4                              ; 558D   000C
L_558E:
        MVII    #$0206, R3                      ; 558E   02BB 0206

        JSR     R5,     X_PRINT_R5              ; 5590   0004 0118 007B
        STRING  "TOTAL"                         ; 5593  
        DECLE   $0000                           ; 5598   0000

        MVI     G_017C, R0                      ; 5599   0280 017C
        MVII    #$02C2, R4                      ; 559B   02BC 02C2
        MVII    #$0002, R1                      ; 559D   02B9 0002
        MVII    #$0206, R3                      ; 559F   02BB 0206

        JSR     R5,     X_PRNUM_RGT             ; 55A1   0004 0118 00C5

        SDBD                                    ; 55A4   0001
        MVI@    R4,     R0                      ; 55A5   02A0
        MVII    #$02D2, R0                      ; 55A6   02B8 02D2
        MVO@    R0,     R4                      ; 55A8   0260
        MVI     G_017B, R0                      ; 55A9   0280 017B

        JSR     R5,     X_PRNUM_ZRO             ; 55AB   0004 0118 00AD

        MVI     G_031D, R0                      ; 55AE   0280 031D
        SDBD                                    ; 55B0   0001
        ANDI    #$F7FF, R0                      ; 55B1   03B8 00FF 00F7
        MVO     R0,     G_031D                  ; 55B4   0240 031D
        CLRR    R2                              ; 55B6   01D2

        JSR     R5,     L_51B5                  ; 55B7   0004 0150 01B5

        MVO     R2,     G_019F                  ; 55BA   0242 019F
        INCR    R2                              ; 55BC   000A
        MVO     R2,     G_0353                  ; 55BD   0242 0353
        SDBD                                    ; 55BF   0001
        MVII    #$6FC0, R0                      ; 55C0   02B8 00C0 006F
        MVO     R0,     G_035D                  ; 55C3   0240 035D
        SDBD                                    ; 55C5   0001
        MVII    #$502C, R1                      ; 55C6   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 55C9   0004 0118 0038

L_55CC:
        PULR    R7                              ; 55CC   02B7

L_55CD:
        PSHR    R5                              ; 55CD   0275
        MVI     G_019D, R0                      ; 55CE   0280 019D
        SLR     R0,     1                       ; 55D0   0060
        INCR    R0                              ; 55D1   0008
        MVII    #$03E8, R1                      ; 55D2   02B9 03E8

        JSR     R5,     X_MPY                   ; 55D4   0004 011C 01DC
        JSR     R5,     L_5610                  ; 55D7   0004 0154 0210

        MVII    #$003C, R0                      ; 55DA   02B8 003C
        SDBD                                    ; 55DC   0001
        MVII    #$DE86, R4                      ; 55DD   02BC 0086 00DE
        ADD     G_019D, R4                      ; 55E0   02C4 019D
        MVI@    R4,     R1                      ; 55E2   02A1
        MVI@    R4,     R3                      ; 55E3   02A3
        SUB     G_017B, R3                      ; 55E4   0303 017B
        BPL     L_55EA                          ; 55E6   0203 0002

        ADDR    R0,     R3                      ; 55E8   00C3
        DECR    R1                              ; 55E9   0011
L_55EA:
        SUB     G_017C, R1                      ; 55EA   0301 017C
        BMI     L_55FB                          ; 55EC   020B 000D

        JSR     R5,     X_MPY                   ; 55EE   0004 011C 01DC

        ADDR    R3,     R2                      ; 55F1   00DA
        MOVR    R2,     R1                      ; 55F2   0091
        MVII    #$0064, R0                      ; 55F3   02B8 0064

        JSR     R5,     X_MPY                   ; 55F5   0004 011C 01DC
        JSR     R5,     L_5610                  ; 55F8   0004 0154 0210

L_55FB:
        MVI     G_035C, R0                      ; 55FB   0280 035C
        MVII    #$000A, R1                      ; 55FD   02B9 000A

        JSR     R5,     X_MPY                   ; 55FF   0004 011C 01DC
        JSR     R5,     L_5610                  ; 5602   0004 0154 0210

        MVI     G_01B8, R0                      ; 5605   0280 01B8
        MVII    #$0028, R1                      ; 5607   02B9 0028

        JSR     R5,     X_MPY                   ; 5609   0004 011C 01DC
        JSR     R5,     L_5610                  ; 560C   0004 0154 0210

        PULR    R7                              ; 560F   02B7

L_5610:
        PSHR    R5                              ; 5610   0275
        MOVR    R2,     R4                      ; 5611   0094
        MVI     G_0317, R3                      ; 5612   0283 0317
        MVI     G_0318, R1                      ; 5614   0281 0318
        ADDR    R2,     R1                      ; 5616   00D1
        MVII    #$03E8, R2                      ; 5617   02BA 03E8

        JSR     R5,     X_DIV                   ; 5619   0004 011C 01FB

        MVO     R1,     G_0318                  ; 561C   0241 0318
        ADDR    R0,     R3                      ; 561E   00C3
        MVO     R3,     G_0317                  ; 561F   0243 0317
        MVI     G_0315, R3                      ; 5621   0283 0315
        MVI     G_0316, R1                      ; 5623   0281 0316
        ADDR    R4,     R1                      ; 5625   00E1
        MVII    #$03E8, R2                      ; 5626   02BA 03E8

        JSR     R5,     X_DIV                   ; 5628   0004 011C 01FB

        MVO     R1,     G_0316                  ; 562B   0241 0316
        ADDR    R0,     R3                      ; 562D   00C3
        MVO     R3,     G_0315                  ; 562E   0243 0315
        PULR    R7                              ; 5630   02B7

L_5631:
        PSHR    R5                              ; 5631   0275
        MVII    #$03E8, R2                      ; 5632   02BA 03E8

        JSR     R5,     X_DIV                   ; 5634   0004 011C 01FB

        MOVR    R1,     R2                      ; 5637   008A
        MOVR    R0,     R1                      ; 5638   0081
        MOVR    R2,     R0                      ; 5639   0090

        JSR     R5,     L_563E                  ; 563A   0004 0154 023E

        PULR    R7                              ; 563D   02B7

L_563E:
        PSHR    R5                              ; 563E   0275
        TSTR    R1                              ; 563F   0089
        BEQ     L_5651                          ; 5640   0204 000F

        PSHR    R0                              ; 5642   0270
        MOVR    R1,     R0                      ; 5643   0088
        MVII    #$0004, R1                      ; 5644   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5646   0004 0118 00C5

        PULR    R0                              ; 5649   02B0
        DECR    R1                              ; 564A   0011
        ADDI    #$0004, R4                      ; 564B   02FC 0004

        JSR     R5,     X_PRNUM_ZRO             ; 564D   0004 0118 00AD

        PULR    R7                              ; 5650   02B7

L_5651:
        PSHR    R0                              ; 5651   0270
        MVII    #$0004, R0                      ; 5652   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5654   0004 0114 0338

        PULR    R0                              ; 5657   02B0
        MVII    #$0003, R1                      ; 5658   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 565A   0004 0118 00C5

        PULR    R7                              ; 565D   02B7

L_565E:
        PSHR    R5                              ; 565E   0275
        MVI     G_019E, R2                      ; 565F   0282 019E
        MVI     G_019D, R3                      ; 5661   0283 019D
        MVII    #$015D, R4                      ; 5663   02BC 015D
        MVII    #$0092, R0                      ; 5665   02B8 0092

        JSR     R5,     X_FILL_ZERO             ; 5667   0004 0114 0338

        ADDI    #$0002, R3                      ; 566A   02FB 0002
        CMPI    #$0012, R3                      ; 566C   037B 0012
        BGT     L_5679                          ; 566E   020E 0009

        MVO     R3,     G_019D                  ; 5670   0243 019D
        MVO     R2,     G_019E                  ; 5672   0242 019E

        JSR     R5,     L_507F                  ; 5674   0004 0150 007F

        B       L_565E                          ; 5677   0220 001A

L_5679:
        SDBD                                    ; 5679   0001
        MVII    #$6FCA, R0                      ; 567A   02B8 00CA 006F
        MVO     R0,     G_035D                  ; 567D   0240 035D
        PULR    R7                              ; 567F   02B7

L_5680:
        PSHR    R5                              ; 5680   0275
        MVI     G_015F, R0                      ; 5681   0280 015F
        CMPI    #$0005, R0                      ; 5683   0378 0005
        BEQ     L_56A7                          ; 5685   0204 0020

        MVI     G_0186, R0                      ; 5687   0280 0186
        TSTR    R0                              ; 5689   0080
        BEQ     L_56A7                          ; 568A   0204 001B

        MVI     G_015F, R0                      ; 568C   0280 015F
        CMPI    #$0004, R0                      ; 568E   0378 0004
        BNEQ    L_5698                          ; 5690   020C 0006

        MVI     G_015D, R0                      ; 5692   0280 015D
        CMPI    #$00C8, R0                      ; 5694   0378 00C8
        BLE     L_56A7                          ; 5696   0206 000F

L_5698:
        JSR     R5,     L_5903                  ; 5698   0004 0158 0103

        TSTR    R3                              ; 569B   009B
        BNEQ    L_56A7                          ; 569C   020C 0009

        MVI     G_019F, R0                      ; 569E   0280 019F
        CMPI    #$0007, R0                      ; 56A0   0378 0007
        BEQ     L_56A7                          ; 56A2   0204 0003

        JSR     R5,     L_56A8                  ; 56A4   0004 0154 02A8

L_56A7:
        PULR    R7                              ; 56A7   02B7

L_56A8:
        PSHR    R5                              ; 56A8   0275
        MVII    #$0008, R0                      ; 56A9   02B8 0008

        JSR     R5,     X_RAND2                 ; 56AB   0004 0114 029E

        MVO     R0,     G_01BB                  ; 56AE   0240 01BB
        MVI     G_0179, R0                      ; 56B0   0280 0179
        DECR    R0                              ; 56B2   0010
        MVO     R0,     G_0179                  ; 56B3   0240 0179
        BNEQ    L_53FA                          ; 56B5   022C 02BC

        MVO     R0,     G_01BA                  ; 56B7   0240 01BA
        MVO     R0,     G_0186                  ; 56B9   0240 0186
        MVII    #$0008, R0                      ; 56BB   02B8 0008

        JSR     R5,     X_RAND2                 ; 56BD   0004 0114 029E

        CMPI    #$0001, R0                      ; 56C0   0378 0001
        BLT     L_53FA                          ; 56C2   0225 02C9
        BGT     L_56C7                          ; 56C4   020E 0001

        INCR    R0                              ; 56C6   0008
L_56C7:
        CMPI    #$0004, R0                      ; 56C7   0378 0004
        BGT     L_56CD                          ; 56C9   020E 0002

        ADDI    #$0003, R0                      ; 56CB   02F8 0003
L_56CD:
        MOVR    R0,     R3                      ; 56CD   0083
L_56CE:
        MOVR    R3,     R0                      ; 56CE   0098

        JSR     R5,     .EXEC.76C               ; 56CF   0004 0114 036C

        MOVR    R1,     R4                      ; 56D2   008C
        SDBD                                    ; 56D3   0001
        MVII    #$5850, R0                      ; 56D4   02B8 0050 0058
        MVO@    R0,     R4                      ; 56D7   0260
        SDBD                                    ; 56D8   0001
        MVII    #$61FC, R0                      ; 56D9   02B8 00FC 0061
        MVO@    R0,     R4                      ; 56DC   0260
        MVII    #$000C, R0                      ; 56DD   02B8 000C

        JSR     R5,     X_RAND2                 ; 56DF   0004 0114 029E

        MVII    #$0008, R1                      ; 56E2   02B9 0008

        JSR     R5,     X_MPY                   ; 56E4   0004 011C 01DC

        ADDI    #$0020, R2                      ; 56E7   02FA 0020
        SWAP    R2,     1                       ; 56E9   0042
        MVO@    R2,     R4                      ; 56EA   0262
        CMPI    #$0006, R3                      ; 56EB   037B 0006
        BLT     L_56FD                          ; 56ED   0205 000E
        BGT     L_56F7                          ; 56EF   020E 0006

        SDBD                                    ; 56F1   0001
        MVII    #$0400, R0                      ; 56F2   02B8 0000 0004
        B       L_56FE                          ; 56F5   0200 0007

L_56F7:
        SDBD                                    ; 56F7   0001
        MVII    #$0800, R0                      ; 56F8   02B8 0000 0008
        B       L_56FE                          ; 56FB   0200 0001

L_56FD:
        CLRR    R0                              ; 56FD   01C0
L_56FE:
        MVO@    R0,     R4                      ; 56FE   0260

        JSR     R5,     L_5FB5                  ; 56FF   0004 015C 03B5

        CLRR    R0                              ; 5702   01C0
        MVO@    R0,     R4                      ; 5703   0260

        JSR     R5,     L_5FD1                  ; 5704   0004 015C 03D1

        INCR    R3                              ; 5707   000B
        CMPI    #$0008, R3                      ; 5708   037B 0008
        BLT     L_56CE                          ; 570A   0225 003D
        B       L_5711                          ; 570C   0200 0003

        JSR     R5,     L_D734                  ; 570E   0004 01D4 0334

L_5711:
        PULR    R7                              ; 5711   02B7

L_5712:
        PSHR    R5                              ; 5712   0275
        MVI     G_0335, R0                      ; 5713   0280 0335
        TSTR    R0                              ; 5715   0080
        BNEQ    L_5737                          ; 5716   020C 001F

        MVI     G_0188, R0                      ; 5718   0280 0188
        TSTR    R0                              ; 571A   0080
        BEQ     L_5728                          ; 571B   0204 000B

        JSR     R5,     L_D734                  ; 571D   0004 01D4 0334
        JSR     R5,     L_5196                  ; 5720   0004 0150 0196

        MVO     R2,     G_0324                  ; 5723   0242 0324
        CLRR    R0                              ; 5725   01C0
        MVO     R0,     G_0188                  ; 5726   0240 0188
L_5728:
        MVI     G_0189, R0                      ; 5728   0280 0189
        TSTR    R0                              ; 572A   0080
        BEQ     L_5737                          ; 572B   0204 000A

        JSR     R5,     L_D744                  ; 572D   0004 01D4 0344

        MVII    #$00C8, R2                      ; 5730   02BA 00C8
        MVO     R2,     G_032C                  ; 5732   0242 032C
        CLRR    R0                              ; 5734   01C0
        MVO     R0,     G_0189                  ; 5735   0240 0189

L_5737:
        JSR     R5,     L_5903                  ; 5737   0004 0158 0103

        TSTR    R3                              ; 573A   009B
        BNEQ    L_5748                          ; 573B   020C 000B

        MVI     G_018A, R0                      ; 573D   0280 018A
        TSTR    R0                              ; 573F   0080
        BEQ     L_5748                          ; 5740   0204 0006

        JSR     R5,     L_D886                  ; 5742   0004 01D8 0086

        CLRR    R0                              ; 5745   01C0
        MVO     R0,     G_018A                  ; 5746   0240 018A
L_5748:
        PULR    R7                              ; 5748   02B7

L_5749:
        PSHR    R5                              ; 5749   0275

        JSR     R5,     L_575F                  ; 574A   0004 0154 035F
        JSR     R5,     L_57C4                  ; 574D   0004 0154 03C4

        MVI     G_018E, R0                      ; 5750   0280 018E
        TSTR    R0                              ; 5752   0080
        BNEQ    L_575E                          ; 5753   020C 0009

        JSR     R5,     L_5899                  ; 5755   0004 0158 0099
        JSR     R5,     L_591A                  ; 5758   0004 0158 011A
        JSR     R5,     L_593F                  ; 575B   0004 0158 013F

L_575E:
        PULR    R7                              ; 575E   02B7

L_575F:
        PSHR    R5                              ; 575F   0275
        CLRR    R2                              ; 5760   01D2
        MVO     R2,     G_0194                  ; 5761   0242 0194
        MVO     R2,     G_0195                  ; 5763   0242 0195
        MVO     R2,     G_0196                  ; 5765   0242 0196
        INCR    R2                              ; 5767   000A
        MVI     G_01B3, R0                      ; 5768   0280 01B3
        CMPI    #$0005, R0                      ; 576A   0378 0005
        BGT     L_577A                          ; 576C   020E 000C

        MVO     R2,     G_0196                  ; 576E   0242 0196
        CMPI    #$0002, R0                      ; 5770   0378 0002
        BGT     L_577A                          ; 5772   020E 0006
        BEQ     L_5778                          ; 5774   0204 0002

        MVO     R2,     G_0194                  ; 5776   0242 0194
L_5778:
        MVO     R2,     G_0195                  ; 5778   0242 0195
L_577A:
        MVI     G_01B4, R0                      ; 577A   0280 01B4
        CMPI    #$0005, R0                      ; 577C   0378 0005
        BGT     L_578C                          ; 577E   020E 000C

        MVO     R2,     G_0196                  ; 5780   0242 0196
        CMPI    #$0002, R0                      ; 5782   0378 0002
        BGT     L_578C                          ; 5784   020E 0006
        BEQ     L_578A                          ; 5786   0204 0002

        MVO     R2,     G_0194                  ; 5788   0242 0194
L_578A:
        MVO     R2,     G_0195                  ; 578A   0242 0195
L_578C:
        MVI     G_01B2, R0                      ; 578C   0280 01B2
        CMPI    #$0005, R0                      ; 578E   0378 0005
        BGT     L_579E                          ; 5790   020E 000C

        MVO     R2,     G_0196                  ; 5792   0242 0196
        CMPI    #$0002, R0                      ; 5794   0378 0002
        BGT     L_579E                          ; 5796   020E 0006
        BEQ     L_579C                          ; 5798   0204 0002

        MVO     R2,     G_0194                  ; 579A   0242 0194
L_579C:
        MVO     R2,     G_0195                  ; 579C   0242 0195
L_579E:
        MVI     G_032D, R1                      ; 579E   0281 032D
        SDBD                                    ; 57A0   0001
        ANDI    #$FFE8, R1                      ; 57A1   03B9 00E8 00FF
        MVI     G_0194, R0                      ; 57A4   0280 0194
        TSTR    R0                              ; 57A6   0080
        BEQ     L_57AD                          ; 57A7   0204 0004

        XORI    #$0006, R1                      ; 57A9   03F9 0006
        B       L_57C1                          ; 57AB   0200 0014

L_57AD:
        MVI     G_0195, R0                      ; 57AD   0280 0195
        TSTR    R0                              ; 57AF   0080
        BEQ     L_57B6                          ; 57B0   0204 0004

        XORI    #$0001, R1                      ; 57B2   03F9 0001
        B       L_57C1                          ; 57B4   0200 000B

L_57B6:
        MVI     G_0196, R0                      ; 57B6   0280 0196
        TSTR    R0                              ; 57B8   0080
        BEQ     L_57BF                          ; 57B9   0204 0004

        XORI    #$0015, R1                      ; 57BB   03F9 0015
        B       L_57C1                          ; 57BD   0200 0002

L_57BF:
        XORI    #$0002, R1                      ; 57BF   03F9 0002
L_57C1:
        MVO     R1,     G_032D                  ; 57C1   0241 032D
        PULR    R7                              ; 57C3   02B7

L_57C4:
        PSHR    R5                              ; 57C4   0275
        MVII    #$0003, R2                      ; 57C5   02BA 0003
L_57C7:
        INCR    R2                              ; 57C7   000A
        MOVR    R2,     R0                      ; 57C8   0090

        JSR     R5,     .EXEC.76C               ; 57C9   0004 0114 036C

        MOVR    R1,     R4                      ; 57CC   008C
        INCR    R4                              ; 57CD   000C
        MVI@    R4,     R0                      ; 57CE   02A0
        MVI@    R4,     R3                      ; 57CF   02A3
        SWAP    R3,     1                       ; 57D0   0043
        ANDI    #$00FF, R3                      ; 57D1   03BB 00FF
        CMPI    #$0008, R3                      ; 57D3   037B 0008
        BGT     L_5803                          ; 57D5   020E 002C

        SDBD                                    ; 57D7   0001
        CMPI    #$61FC, R0                      ; 57D8   0378 00FC 0061
        BEQ     L_57F6                          ; 57DB   0204 0019

        SDBD                                    ; 57DD   0001
        CMPI    #$61EC, R0                      ; 57DE   0378 00EC 0061
        BEQ     L_57EE                          ; 57E1   0204 000B

        SDBD                                    ; 57E3   0001
        CMPI    #$6228, R0                      ; 57E4   0378 0028 0062
        BNEQ    L_5894                          ; 57E7   020C 00AB

        MVII    #$0014, R0                      ; 57E9   02B8 0014
        CLRR    R1                              ; 57EB   01C9
        B       L_57FA                          ; 57EC   0200 000C

L_57EE:
        MOVR    R1,     R4                      ; 57EE   008C
        MVII    #$0007, R0                      ; 57EF   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 57F1   0004 0114 0338

        B       L_5894                          ; 57F4   0200 009E

L_57F6:
        MVII    #$0028, R0                      ; 57F6   02B8 0028
        MVII    #$000D, R1                      ; 57F8   02B9 000D

L_57FA:
        JSR     R5,     .EXEC.629               ; 57FA   0004 0114 0229

        INCR    R4                              ; 57FD   000C
        MVO@    R0,     R4                      ; 57FE   0260
        SUBI    #$0002, R4                      ; 57FF   033C 0002
        B       L_583F                          ; 5801   0200 003C

L_5803:
        CMPI    #$00A0, R3                      ; 5803   037B 00A0
        BLT     L_583F                          ; 5805   0205 0038

        SDBD                                    ; 5807   0001
        CMPI    #$61FC, R0                      ; 5808   0378 00FC 0061
        BEQ     L_5834                          ; 580B   0204 0027

        SDBD                                    ; 580D   0001
        CMPI    #$61EC, R0                      ; 580E   0378 00EC 0061
        BEQ     L_582C                          ; 5811   0204 0019

        SDBD                                    ; 5813   0001
        CMPI    #$6228, R0                      ; 5814   0378 0028 0062
        BNEQ    L_5894                          ; 5817   020C 007B

        MVI     G_019C, R0                      ; 5819   0280 019C
        TSTR    R0                              ; 581B   0080
        BEQ     L_5826                          ; 581C   0204 0008

        MOVR    R1,     R4                      ; 581E   008C
        MVII    #$0007, R0                      ; 581F   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 5821   0004 0114 0338

        B       L_5894                          ; 5824   0200 006E

L_5826:
        MVII    #$0014, R0                      ; 5826   02B8 0014
        MVII    #$0008, R1                      ; 5828   02B9 0008
        B       L_5838                          ; 582A   0200 000C

L_582C:
        MOVR    R1,     R4                      ; 582C   008C
        MVII    #$0007, R0                      ; 582D   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 582F   0004 0114 0338

        B       L_5894                          ; 5832   0200 0060

L_5834:
        MVII    #$0028, R0                      ; 5834   02B8 0028
        MVII    #$000B, R1                      ; 5836   02B9 000B

L_5838:
        JSR     R5,     .EXEC.629               ; 5838   0004 0114 0229

        INCR    R4                              ; 583B   000C
        MVO@    R0,     R4                      ; 583C   0260
        SUBI    #$0002, R4                      ; 583D   033C 0002
L_583F:
        MVI@    R4,     R3                      ; 583F   02A3
        SUBI    #$0003, R4                      ; 5840   033C 0003
        MVI@    R4,     R0                      ; 5842   02A0
        SDBD                                    ; 5843   0001
        CMPI    #$6228, R0                      ; 5844   0378 0028 0062
        BEQ     L_585B                          ; 5847   0204 0012

        TSTR    R3                              ; 5849   009B
        BMI     L_5853                          ; 584A   020B 0007

        SWAP    R3,     1                       ; 584C   0043
        ANDI    #$00FF, R3                      ; 584D   03BB 00FF
        CMPI    #$0068, R3                      ; 584F   037B 0068
        BLT     L_5894                          ; 5851   0205 0041

L_5853:
        MOVR    R1,     R4                      ; 5853   008C
        MVII    #$0007, R0                      ; 5854   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 5856   0004 0114 0338

        B       L_5894                          ; 5859   0200 0039

L_585B:
        SWAP    R3,     1                       ; 585B   0043
        ANDI    #$00FF, R3                      ; 585C   03BB 00FF
        CMPI    #$0010, R3                      ; 585E   037B 0010
        BLT     L_5879                          ; 5860   0205 0017

        CMPI    #$0068, R3                      ; 5862   037B 0068
        BLT     L_5894                          ; 5864   0205 002E

        MVI     G_019C, R0                      ; 5866   0280 019C
        TSTR    R0                              ; 5868   0080
        BEQ     L_5873                          ; 5869   0204 0008

        MOVR    R1,     R4                      ; 586B   008C
        MVII    #$0007, R0                      ; 586C   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 586E   0004 0114 0338

        B       L_5894                          ; 5871   0200 0021

L_5873:
        MVII    #$0064, R3                      ; 5873   02BB 0064
        MVII    #$0004, R1                      ; 5875   02B9 0004
        B       L_588A                          ; 5877   0200 0011

L_5879:
        MVI     G_019C, R0                      ; 5879   0280 019C
        TSTR    R0                              ; 587B   0080
        BEQ     L_5886                          ; 587C   0204 0008

        MOVR    R1,     R4                      ; 587E   008C
        MVII    #$0007, R0                      ; 587F   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 5881   0004 0114 0338

        B       L_5894                          ; 5884   0200 000E

L_5886:
        MVII    #$0014, R3                      ; 5886   02BB 0014
        MVII    #$000C, R1                      ; 5888   02B9 000C
L_588A:
        MVII    #$000A, R0                      ; 588A   02B8 000A

        JSR     R5,     .EXEC.629               ; 588C   0004 0114 0229

        MVO     R0,     G_0351                  ; 588F   0240 0351
        SWAP    R3,     1                       ; 5891   0043
        MVO     R3,     G_0350                  ; 5892   0243 0350
L_5894:
        CMPI    #$0007, R2                      ; 5894   037A 0007
        BLT     L_57C7                          ; 5896   0225 00D0
        PULR    R7                              ; 5898   02B7

L_5899:
        PSHR    R5                              ; 5899   0275
        MVI     G_016A, R0                      ; 589A   0280 016A
        TSTR    R0                              ; 589C   0080
        BNEQ    L_58C3                          ; 589D   020C 0024

        MVI     G_0324, R0                      ; 589F   0280 0324
        MOVR    R0,     R1                      ; 58A1   0081

        JSR     R5,     X_RAND2                 ; 58A2   0004 0114 029E

        TSTR    R0                              ; 58A5   0080
        BEQ     L_58AD                          ; 58A6   0204 0005

        DECR    R1                              ; 58A8   0011
        MVO     R1,     G_0324                  ; 58A9   0241 0324
        B       L_58B1                          ; 58AB   0200 0004

L_58AD:
        MVII    #$0001, R0                      ; 58AD   02B8 0001
        MVO     R0,     G_0188                  ; 58AF   0240 0188
L_58B1:
        MVI     G_032C, R0                      ; 58B1   0280 032C
        MOVR    R0,     R1                      ; 58B3   0081

        JSR     R5,     X_RAND2                 ; 58B4   0004 0114 029E

        TSTR    R0                              ; 58B7   0080
        BEQ     L_58BF                          ; 58B8   0204 0005

        DECR    R1                              ; 58BA   0011
        MVO     R1,     G_032C                  ; 58BB   0241 032C
        B       L_58C3                          ; 58BD   0200 0004

L_58BF:
        MVII    #$0001, R0                      ; 58BF   02B8 0001
        MVO     R0,     G_0189                  ; 58C1   0240 0189

L_58C3:
        JSR     R5,     L_5903                  ; 58C3   0004 0158 0103

        TSTR    R3                              ; 58C6   009B
        BNEQ    L_58E9                          ; 58C7   020C 0020

        MVI     G_0334, R0                      ; 58C9   0280 0334
        MOVR    R0,     R1                      ; 58CB   0081

        JSR     R5,     X_RAND2                 ; 58CC   0004 0114 029E

        TSTR    R0                              ; 58CF   0080
        BEQ     L_58D7                          ; 58D0   0204 0005

        DECR    R1                              ; 58D2   0011
        MVO     R1,     G_0334                  ; 58D3   0241 0334
        B       L_58E9                          ; 58D5   0200 0012

L_58D7:
        MVII    #$0064, R0                      ; 58D7   02B8 0064
        MVO     R0,     G_0334                  ; 58D9   0240 0334
        SDBD                                    ; 58DB   0001
        MVII    #$61FC, R0                      ; 58DC   02B8 00FC 0061
        MVO     R0,     G_034E                  ; 58DF   0240 034E
        MVII    #$0001, R0                      ; 58E1   02B8 0001
        MVO     R0,     G_0186                  ; 58E3   0240 0186
        MVII    #$000A, R0                      ; 58E5   02B8 000A
        MVO     R0,     G_0179                  ; 58E7   0240 0179
L_58E9:
        MVI     G_018B, R0                      ; 58E9   0280 018B
        TSTR    R0                              ; 58EB   0080
        BNEQ    L_5902                          ; 58EC   020C 0014

        MVI     G_0354, R0                      ; 58EE   0280 0354
        MOVR    R0,     R1                      ; 58F0   0081

        JSR     R5,     X_RAND2                 ; 58F1   0004 0114 029E

        TSTR    R0                              ; 58F4   0080
        BEQ     L_58FC                          ; 58F5   0204 0005

        DECR    R1                              ; 58F7   0011
        MVO     R1,     G_0354                  ; 58F8   0241 0354
        B       L_5902                          ; 58FA   0200 0006

L_58FC:
        MVII    #$0001, R0                      ; 58FC   02B8 0001
        MVO     R0,     G_018A                  ; 58FE   0240 018A
        MVO     R0,     G_018B                  ; 5900   0240 018B
L_5902:
        PULR    R7                              ; 5902   02B7

L_5903:
        PSHR    R5                              ; 5903   0275
        CLRR    R3                              ; 5904   01DB
        MVII    #$0004, R2                      ; 5905   02BA 0004
L_5907:
        INCR    R2                              ; 5907   000A
        MOVR    R2,     R0                      ; 5908   0090

        JSR     R5,     .EXEC.76C               ; 5909   0004 0114 036C

        INCR    R1                              ; 590C   0009
        MVI@    R1,     R0                      ; 590D   0288
        TSTR    R0                              ; 590E   0080
        BNEQ    L_5917                          ; 590F   020C 0006

        CMPI    #$0007, R2                      ; 5911   037A 0007
        BLT     L_5907                          ; 5913   0225 000D
        B       L_5919                          ; 5915   0200 0002

L_5917:
        MVII    #$0001, R3                      ; 5917   02BB 0001
L_5919:
        PULR    R7                              ; 5919   02B7

L_591A:
        PSHR    R5                              ; 591A   0275
        MVI     G_018C, R0                      ; 591B   0280 018C
        TSTR    R0                              ; 591D   0080
        BNEQ    L_593E                          ; 591E   020C 001E

        MVII    #$0336, R1                      ; 5920   02B9 0336
L_5922:
        ADDI    #$0008, R1                      ; 5922   02F9 0008
        CMPI    #$0346, R1                      ; 5924   0379 0346
        BGT     L_593E                          ; 5926   020E 0016

        MVI@    R1,     R0                      ; 5928   0288
        SDBD                                    ; 5929   0001
        CMPI    #$61EC, R0                      ; 592A   0378 00EC 0061
        BNEQ    L_5922                          ; 592D   022C 000C

        DECR    R1                              ; 592F   0011
        MVII    #$0003, R3                      ; 5930   02BB 0003
        SDBD                                    ; 5932   0001
        MVII    #$0404, R4                      ; 5933   02BC 0004 0004

        JSR     R5,     .EXEC.70F               ; 5936   0004 0114 030F

        BNC     L_5922                          ; 5939   0229 0018

        JSR     R5,     L_5CB9                  ; 593B   0004 015C 00B9

L_593E:
        PULR    R7                              ; 593E   02B7

L_593F:
        PSHR    R5                              ; 593F   0275
        MVI     G_019B, R0                      ; 5940   0280 019B
        TSTR    R0                              ; 5942   0080
        BEQ     L_5951                          ; 5943   0204 000C

        MVI     G_0181, R0                      ; 5945   0280 0181
        DECR    R0                              ; 5947   0010
        BNEQ    L_594F                          ; 5948   020C 0005

        JSR     R5,     L_D8AF                  ; 594A   0004 01D8 00AF

        MVII    #$0032, R0                      ; 594D   02B8 0032
L_594F:
        MVO     R0,     G_0181                  ; 594F   0240 0181
L_5951:
        PULR    R7                              ; 5951   02B7

        DECLE   $0002,  $0001,  $0001,  $0001   ; 5952   0002 0001 0001 0001

        INCR    R2                              ; 5956   000A
        INCR    R0                              ; 5957   0008
        EIS                                     ; 5958   0002
        PSHR    R5                              ; 5959   0275
        MVI     G_0183, R1                      ; 595A   0281 0183
        TSTR    R1                              ; 595C   0089
        BNEQ    L_598C                          ; 595D   020C 002D

        TSTR    R0                              ; 595F   0080
        BMI     L_598C                          ; 5960   020B 002A

        CMPI    #$0002, R0                      ; 5962   0378 0002
        BLT     L_597A                          ; 5964   0205 0014
        BEQ     L_598C                          ; 5966   0204 0024

        CMPI    #$0006, R0                      ; 5968   0378 0006
        BLT     L_5984                          ; 596A   0205 0018
        BEQ     L_598C                          ; 596C   0204 001E

        CMPI    #$000A, R0                      ; 596E   0378 000A
        BLT     L_597F                          ; 5970   0205 000D
        BEQ     L_598C                          ; 5972   0204 0018

        CMPI    #$000E, R0                      ; 5974   0378 000E
        BLT     L_5989                          ; 5976   0205 0011
        BEQ     L_598C                          ; 5978   0204 0012

L_597A:
        JSR     R5,     L_598D                  ; 597A   0004 0158 018D

        B       L_598C                          ; 597D   0200 000D

L_597F:
        JSR     R5,     L_59BF                  ; 597F   0004 0158 01BF

        B       L_598C                          ; 5982   0200 0008

L_5984:
        JSR     R5,     L_59F2                  ; 5984   0004 0158 01F2

        B       L_598C                          ; 5987   0200 0003

L_5989:
        JSR     R5,     L_5A6D                  ; 5989   0004 0158 026D

L_598C:
        PULR    R7                              ; 598C   02B7

L_598D:
        PSHR    R5                              ; 598D   0275
        CLRR    R3                              ; 598E   01DB
        MVO     R3,     G_0175                  ; 598F   0243 0175
        MVI     G_018F, R2                      ; 5991   0282 018F
        TSTR    R2                              ; 5993   0092
        BEQ     L_59BE                          ; 5994   0204 0028

        JSR     R5,     L_5AC6                  ; 5996   0004 0158 02C6

        SDBD                                    ; 5999   0001
        MVII    #$6162, R1                      ; 599A   02B9 0062 0061

        JSR     R5,     L_51BD                  ; 599D   0004 0150 01BD

        MVI     G_0162, R3                      ; 59A0   0283 0162

        JSR     R5,     L_6D17                  ; 59A2   0004 016C 0117

        MOVR    R0,     R2                      ; 59A5   0082
        ADD     G_0160, R2                      ; 59A6   02C2 0160
        INCR    R2                              ; 59A8   000A
        MVI@    R2,     R1                      ; 59A9   0291
        CMPI    #$003A, R1                      ; 59AA   0379 003A
        BGT     L_59B2                          ; 59AC   020E 0004

        CMPI    #$0008, R1                      ; 59AE   0379 0008
        BGT     L_59BE                          ; 59B0   020E 000C

L_59B2:
        MVI     G_0160, R0                      ; 59B2   0280 0160
        INCR    R0                              ; 59B4   0008
        MVO     R0,     G_0160                  ; 59B5   0240 0160

        JSR     R5,     L_5ADB                  ; 59B7   0004 0158 02DB

        MVII    #$0001, R0                      ; 59BA   02B8 0001
        MVO     R0,     G_0323                  ; 59BC   0240 0323
L_59BE:
        PULR    R7                              ; 59BE   02B7

L_59BF:
        PSHR    R5                              ; 59BF   0275
        MVII    #$0001, R3                      ; 59C0   02BB 0001
        MVO     R3,     G_0175                  ; 59C2   0243 0175
        MVI     G_018F, R2                      ; 59C4   0282 018F
        TSTR    R2                              ; 59C6   0092
        BEQ     L_59F1                          ; 59C7   0204 0028

        JSR     R5,     L_5AC6                  ; 59C9   0004 0158 02C6

        SDBD                                    ; 59CC   0001
        MVII    #$6162, R1                      ; 59CD   02B9 0062 0061

        JSR     R5,     L_51BD                  ; 59D0   0004 0150 01BD

        MVI     G_0162, R3                      ; 59D3   0283 0162

        JSR     R5,     L_6D17                  ; 59D5   0004 016C 0117

        MOVR    R0,     R2                      ; 59D8   0082
        ADD     G_0160, R2                      ; 59D9   02C2 0160
        DECR    R2                              ; 59DB   0012
        MVI@    R2,     R1                      ; 59DC   0291
        CMPI    #$003A, R1                      ; 59DD   0379 003A
        BGT     L_59E5                          ; 59DF   020E 0004

        CMPI    #$0008, R1                      ; 59E1   0379 0008
        BGT     L_59F1                          ; 59E3   020E 000C

L_59E5:
        MVI     G_0160, R0                      ; 59E5   0280 0160
        DECR    R0                              ; 59E7   0010
        MVO     R0,     G_0160                  ; 59E8   0240 0160

        JSR     R5,     L_5ADB                  ; 59EA   0004 0158 02DB

        MVII    #$0001, R0                      ; 59ED   02B8 0001
        MVO     R0,     G_032B                  ; 59EF   0240 032B
L_59F1:
        PULR    R7                              ; 59F1   02B7

L_59F2:
        PSHR    R5                              ; 59F2   0275
        MVII    #$0002, R0                      ; 59F3   02B8 0002
        MVO     R0,     G_0175                  ; 59F5   0240 0175
        MVI     G_018F, R3                      ; 59F7   0283 018F
        TSTR    R3                              ; 59F9   009B
        BEQ     L_5A6C                          ; 59FA   0204 0070

        SDBD                                    ; 59FC   0001
        MVII    #$614D, R1                      ; 59FD   02B9 004D 0061

        JSR     R5,     L_51BD                  ; 5A00   0004 0150 01BD
        JSR     R5,     L_5AEF                  ; 5A03   0004 0158 02EF

        MVI     G_0160, R2                      ; 5A06   0282 0160
        CMPI    #$0008, R2                      ; 5A08   037A 0008
        BGT     L_5A3B                          ; 5A0A   020E 002F

        MVI     G_0161, R1                      ; 5A0C   0281 0161
        INCR    R1                              ; 5A0E   0009
        MVO     R1,     G_0161                  ; 5A0F   0241 0161

        JSR     R5,     L_5AFA                  ; 5A11   0004 0158 02FA

        CMPI    #$0001, R0                      ; 5A14   0378 0001
        BNEQ    L_5A1D                          ; 5A16   020C 0005

        MVI     G_01A0, R0                      ; 5A18   0280 01A0
        INCR    R0                              ; 5A1A   0008
        MVO     R0,     G_01A0                  ; 5A1B   0240 01A0
L_5A1D:
        MVII    #$00E4, R0                      ; 5A1D   02B8 00E4
        MVO     R0,     G_0160                  ; 5A1F   0240 0160
        MVI     G_0197, R0                      ; 5A21   0280 0197
        TSTR    R0                              ; 5A23   0080
        BEQ     L_5A55                          ; 5A24   0204 002F

        MVI     G_01A2, R0                      ; 5A26   0280 01A2
        MOVR    R0,     R2                      ; 5A28   0082

        JSR     R5,     X_RAND2                 ; 5A29   0004 0114 029E

        TSTR    R0                              ; 5A2C   0080
        BNEQ    L_5A36                          ; 5A2D   020C 0007

        MVO     R0,     G_0197                  ; 5A2F   0240 0197
        INCR    R0                              ; 5A31   0008
        MVO     R0,     G_0187                  ; 5A32   0240 0187
        B       L_5A55                          ; 5A34   0200 001F

L_5A36:
        DECR    R2                              ; 5A36   0012
        MVO     R2,     G_01A2                  ; 5A37   0242 01A2
        B       L_5A55                          ; 5A39   0200 001A

L_5A3B:
        MVI     G_0162, R3                      ; 5A3B   0283 0162

        JSR     R5,     L_6D17                  ; 5A3D   0004 016C 0117

        MOVR    R0,     R3                      ; 5A40   0083
        SUBI    #$0014, R2                      ; 5A41   033A 0014
        ADDR    R2,     R3                      ; 5A43   00D3
        MVI@    R3,     R1                      ; 5A44   0299
        CMPI    #$0011, R1                      ; 5A45   0379 0011
        BNEQ    L_5A4F                          ; 5A47   020C 0006

        MVO     R1,     G_0190                  ; 5A49   0241 0190
        MVO     R2,     G_0160                  ; 5A4B   0242 0160
        B       L_5A55                          ; 5A4D   0200 0006

L_5A4F:
        JSR     R5,     L_5B09                  ; 5A4F   0004 0158 0309

        TSTR    R3                              ; 5A52   009B
        BNEQ    L_5A6C                          ; 5A53   020C 0017

L_5A55:
        MVII    #$0041, R0                      ; 5A55   02B8 0041
        SUB     G_01A6, R0                      ; 5A57   0300 01A6
        CMPI    #$000A, R0                      ; 5A59   0378 000A
        BGT     L_5A5F                          ; 5A5B   020E 0002

        MVII    #$000A, R0                      ; 5A5D   02B8 000A
L_5A5F:
        MVO     R0,     G_01BC                  ; 5A5F   0240 01BC
        MVI     G_031F, R0                      ; 5A61   0280 031F
        MVO     R0,     G_032F                  ; 5A63   0240 032F
        MVI     G_0320, R0                      ; 5A65   0280 0320
        MVO     R0,     G_0328                  ; 5A67   0240 0328

        JSR     R5,     L_5ADB                  ; 5A69   0004 0158 02DB

L_5A6C:
        PULR    R7                              ; 5A6C   02B7

L_5A6D:
        PSHR    R5                              ; 5A6D   0275
        MVII    #$0003, R0                      ; 5A6E   02B8 0003
        MVO     R0,     G_0175                  ; 5A70   0240 0175
        MVI     G_018F, R3                      ; 5A72   0283 018F
        TSTR    R3                              ; 5A74   009B
        BEQ     L_5AC5                          ; 5A75   0204 004E

        SDBD                                    ; 5A77   0001
        MVII    #$6138, R1                      ; 5A78   02B9 0038 0061

        JSR     R5,     L_51BD                  ; 5A7B   0004 0150 01BD
        JSR     R5,     L_5AEF                  ; 5A7E   0004 0158 02EF

        MVI     G_0160, R2                      ; 5A81   0282 0160
        CMPI    #$00E4, R2                      ; 5A83   037A 00E4
        BLT     L_5AA0                          ; 5A85   0205 0019

        MVI     G_0162, R0                      ; 5A87   0280 0162
        CMPI    #$0001, R0                      ; 5A89   0378 0001
        BNEQ    L_5A92                          ; 5A8B   020C 0005

        MVI     G_01A0, R0                      ; 5A8D   0280 01A0
        DECR    R0                              ; 5A8F   0010
        MVO     R0,     G_01A0                  ; 5A90   0240 01A0
L_5A92:
        MVI     G_0161, R1                      ; 5A92   0281 0161
        DECR    R1                              ; 5A94   0011
        MVO     R1,     G_0161                  ; 5A95   0241 0161

        JSR     R5,     L_5AFA                  ; 5A97   0004 0158 02FA

        MVII    #$0008, R0                      ; 5A9A   02B8 0008
        MVO     R0,     G_0160                  ; 5A9C   0240 0160
        B       L_5AB0                          ; 5A9E   0200 0010

L_5AA0:
        MVI     G_0162, R3                      ; 5AA0   0283 0162

        JSR     R5,     L_6D17                  ; 5AA2   0004 016C 0117

        MOVR    R0,     R3                      ; 5AA5   0083
        ADDI    #$0014, R2                      ; 5AA6   02FA 0014
        ADDR    R2,     R3                      ; 5AA8   00D3
        MVI@    R3,     R1                      ; 5AA9   0299

        JSR     R5,     L_5B09                  ; 5AAA   0004 0158 0309

        TSTR    R3                              ; 5AAD   009B
        BNEQ    L_5AC5                          ; 5AAE   020C 0015

L_5AB0:
        SDBD                                    ; 5AB0   0001
        MVII    #$FFBA, R0                      ; 5AB1   02B8 00BA 00FF
        ADD     G_01A6, R0                      ; 5AB4   02C0 01A6
        SDBD                                    ; 5AB6   0001
        CMPI    #$FFF6, R0                      ; 5AB7   0378 00F6 00FF
        BLT     L_5AC0                          ; 5ABA   0205 0004

        SDBD                                    ; 5ABC   0001
        MVII    #$FFF6, R0                      ; 5ABD   02B8 00F6 00FF
L_5AC0:
        MVO     R0,     G_01BC                  ; 5AC0   0240 01BC

        JSR     R5,     L_5ADB                  ; 5AC2   0004 0158 02DB

L_5AC5:
        PULR    R7                              ; 5AC5   02B7

L_5AC6:
        PSHR    R5                              ; 5AC6   0275
        MVII    #$031D, R2                      ; 5AC7   02BA 031D
L_5AC9:
        MVI@    R2,     R0                      ; 5AC9   0290
        SDBD                                    ; 5ACA   0001
        ANDI    #$FDFF, R0                      ; 5ACB   03B8 00FF 00FD
        TSTR    R3                              ; 5ACE   009B
        BEQ     L_5AD3                          ; 5ACF   0204 0002

        XORI    #$0200, R0                      ; 5AD1   03F8 0200
L_5AD3:
        MVO@    R0,     R2                      ; 5AD3   0250
        ADDI    #$0008, R2                      ; 5AD4   02FA 0008
        CMPI    #$032D, R2                      ; 5AD6   037A 032D
        BLE     L_5AC9                          ; 5AD8   0226 0010
        PULR    R7                              ; 5ADA   02B7

L_5ADB:
        PSHR    R5                              ; 5ADB   0275
        MVI     G_018D, R0                      ; 5ADC   0280 018D
        TSTR    R0                              ; 5ADE   0080
        BEQ     L_5AE4                          ; 5ADF   0204 0003

        CLRR    R2                              ; 5AE1   01D2
        B       L_5AE8                          ; 5AE2   0200 0004

L_5AE4:
        MVI     G_0322, R2                      ; 5AE4   0282 0322
        XORI    #$0380, R2                      ; 5AE6   03FA 0380

L_5AE8:
        JSR     R5,     L_51B5                  ; 5AE8   0004 0150 01B5

        CLRR    R0                              ; 5AEB   01C0
        MVO     R0,     G_018F                  ; 5AEC   0240 018F
        PULR    R7                              ; 5AEE   02B7

L_5AEF:
        PSHR    R5                              ; 5AEF   0275
        MVI     G_0322, R2                      ; 5AF0   0282 0322
        SDBD                                    ; 5AF2   0001
        ANDI    #$FFF1, R2                      ; 5AF3   03BA 00F1 00FF

        JSR     R5,     L_51B5                  ; 5AF6   0004 0150 01B5

        PULR    R7                              ; 5AF9   02B7

L_5AFA:
        PSHR    R5                              ; 5AFA   0275
        SDBD                                    ; 5AFB   0001
        MVII    #$6DA7, R4                      ; 5AFC   02BC 00A7 006D
        ADD     G_019D, R4                      ; 5AFF   02C4 019D
        SDBD                                    ; 5B01   0001
        MVI@    R4,     R3                      ; 5B02   02A3
        ADD     G_0161, R3                      ; 5B03   02C3 0161
        MVI@    R3,     R0                      ; 5B05   0298
        MVO     R0,     G_0162                  ; 5B06   0240 0162
        PULR    R7                              ; 5B08   02B7

L_5B09:
        PSHR    R5                              ; 5B09   0275
        CLRR    R3                              ; 5B0A   01DB
        CMPI    #$003B, R1                      ; 5B0B   0379 003B
        BLT     L_5B1E                          ; 5B0D   0205 000F

        MVI     G_01B7, R0                      ; 5B0F   0280 01B7
        TSTR    R0                              ; 5B11   0080
        BEQ     L_5B22                          ; 5B12   0204 000E

        MVI     G_018D, R0                      ; 5B14   0280 018D
        TSTR    R0                              ; 5B16   0080
        BNEQ    L_5B2D                          ; 5B17   020C 0014

        JSR     R5,     L_5B30                  ; 5B19   0004 0158 0330

        B       L_5B2D                          ; 5B1C   0200 000F

L_5B1E:
        CMPI    #$0008, R1                      ; 5B1E   0379 0008
        BLE     L_5B25                          ; 5B20   0206 0003

L_5B22:
        INCR    R3                              ; 5B22   000B
        B       L_5B2F                          ; 5B23   0200 000A

L_5B25:
        MVI     G_018D, R0                      ; 5B25   0280 018D
        TSTR    R0                              ; 5B27   0080
        BEQ     L_5B2D                          ; 5B28   0204 0003

        JSR     R5,     L_5B67                  ; 5B2A   0004 0158 0367

L_5B2D:
        MVO     R2,     G_0160                  ; 5B2D   0242 0160
L_5B2F:
        PULR    R7                              ; 5B2F   02B7

L_5B30:
        PSHR    R5                              ; 5B30   0275
        MVII    #$033D, R4                      ; 5B31   02BC 033D
        MVI     G_0175, R0                      ; 5B33   0280 0175
        CMPI    #$0002, R0                      ; 5B35   0378 0002
        BNEQ    L_5B3F                          ; 5B37   020C 0006

        MVII    #$0002, R0                      ; 5B39   02B8 0002
        MVO     R0,     G_018D                  ; 5B3B   0240 018D
        B       L_5B46                          ; 5B3D   0200 0007

L_5B3F:
        JSR     R5,     L_5B47                  ; 5B3F   0004 0158 0347

        MVII    #$0001, R0                      ; 5B42   02B8 0001
        MVO     R0,     G_018D                  ; 5B44   0240 018D
L_5B46:
        PULR    R7                              ; 5B46   02B7

L_5B47:
        PSHR    R5                              ; 5B47   0275
        MVII    #$033D, R4                      ; 5B48   02BC 033D
        SDBD                                    ; 5B4A   0001
        MVII    #$3046, R0                      ; 5B4B   02B8 0046 0030
        MVO@    R0,     R4                      ; 5B4E   0260
        SDBD                                    ; 5B4F   0001
        MVII    #$620C, R0                      ; 5B50   02B8 000C 0062
        MVO@    R0,     R4                      ; 5B53   0260
        MVI     G_031F, R0                      ; 5B54   0280 031F
        SDBD                                    ; 5B56   0001
        SUBI    #$0400, R0                      ; 5B57   0338 0000 0004
        MVO@    R0,     R4                      ; 5B5A   0260
        MVI     G_0320, R0                      ; 5B5B   0280 0320
        ADDI    #$0300, R0                      ; 5B5D   02F8 0300
        MVO@    R0,     R4                      ; 5B5F   0260
        CLRR    R1                              ; 5B60   01C9
        MVO@    R1,     R4                      ; 5B61   0261
        MVII    #$02F0, R0                      ; 5B62   02B8 02F0
        MVO@    R0,     R4                      ; 5B64   0260
        MVO@    R1,     R4                      ; 5B65   0261
        PULR    R7                              ; 5B66   02B7

L_5B67:
        PSHR    R5                              ; 5B67   0275
        MVII    #$0008, R0                      ; 5B68   02B8 0008
        MVII    #$033D, R4                      ; 5B6A   02BC 033D

        JSR     R5,     X_FILL_ZERO             ; 5B6C   0004 0114 0338

        CLRR    R0                              ; 5B6F   01C0
        MVO     R0,     G_018D                  ; 5B70   0240 018D
        PULR    R7                              ; 5B72   02B7

        PSHR    R5                              ; 5B73   0275
        MVI     G_0182, R0                      ; 5B74   0280 0182
        TSTR    R0                              ; 5B76   0080
        BNEQ    L_5C46                          ; 5B77   020C 00CD

        MVI     G_0162, R0                      ; 5B79   0280 0162
        TSTR    R0                              ; 5B7B   0080
        BNEQ    L_5BA7                          ; 5B7C   020C 0029

        MVI     G_0160, R0                      ; 5B7E   0280 0160
        CMPI    #$00A8, R0                      ; 5B80   0378 00A8
        BNEQ    L_5BA7                          ; 5B82   020C 0023

        MVI     G_0335, R0                      ; 5B84   0280 0335
        SDBD                                    ; 5B86   0001
        ANDI    #$F7FF, R0                      ; 5B87   03B8 00FF 00F7
        MVO     R0,     G_0335                  ; 5B8A   0240 0335
        MVI     G_033A, R0                      ; 5B8C   0280 033A
        ANDI    #$000F, R0                      ; 5B8E   03B8 000F
        MVO     R0,     G_033A                  ; 5B90   0240 033A
        MVII    #$0003, R2                      ; 5B92   02BA 0003

        JSR     R5,     L_51B5                  ; 5B94   0004 0150 01B5

        SDBD                                    ; 5B97   0001
        MVII    #$61A1, R1                      ; 5B98   02B9 00A1 0061

        JSR     R5,     L_51BD                  ; 5B9B   0004 0150 01BD

        MVII    #$0001, R0                      ; 5B9E   02B8 0001
        MVO     R0,     G_0185                  ; 5BA0   0240 0185

        JSR     R5,     L_5CEA                  ; 5BA2   0004 015C 00EA

        B       L_5C46                          ; 5BA5   0200 009F

L_5BA7:
        CLRR    R2                              ; 5BA7   01D2
        MVO     R2,     G_033B                  ; 5BA8   0242 033B
        MVI     G_019D, R1                      ; 5BAA   0281 019D
        SLL     R1,     1                       ; 5BAC   0049
        ADDI    #$000A, R1                      ; 5BAD   02F9 000A
        MVO     R1,     G_0178                  ; 5BAF   0241 0178
        MVO     R2,     G_0183                  ; 5BB1   0242 0183
        MVO     R2,     G_033A                  ; 5BB3   0242 033A

        JSR     R5,     L_51B5                  ; 5BB5   0004 0150 01B5

        INCR    R2                              ; 5BB8   000A
        MVO     R2,     G_0182                  ; 5BB9   0242 0182
        NOP                                     ; 5BBB   0034
        SDBD                                    ; 5BBC   0001
        MVII    #$6177, R1                      ; 5BBD   02B9 0077 0061

        JSR     R5,     L_51BD                  ; 5BC0   0004 0150 01BD

        NOP                                     ; 5BC3   0034
        MVI     G_0160, R0                      ; 5BC4   0280 0160
        MVO     R0,     G_0163                  ; 5BC6   0240 0163
        MVI     G_0162, R0                      ; 5BC8   0280 0162
        MVO     R0,     G_0165                  ; 5BCA   0240 0165
        MVI     G_0161, R0                      ; 5BCC   0280 0161
        MVO     R0,     G_0164                  ; 5BCE   0240 0164
        SDBD                                    ; 5BD0   0001
        MVII    #$1906, R0                      ; 5BD1   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5BD4   0240 035D
        MVI     G_0320, R0                      ; 5BD6   0280 0320
        MVO     R0,     G_0338                  ; 5BD8   0240 0338
        MVI     G_031F, R0                      ; 5BDA   0280 031F
        MVO     R0,     G_0337                  ; 5BDC   0240 0337
        MVI     G_0335, R0                      ; 5BDE   0280 0335
        SDBD                                    ; 5BE0   0001
        ANDI    #$B7FF, R0                      ; 5BE1   03B8 00FF 00B7
        MVO     R0,     G_0335                  ; 5BE4   0240 0335
        MVI     G_031D, R0                      ; 5BE6   0280 031D
        SDBD                                    ; 5BE8   0001
        ANDI    #$F7FF, R0                      ; 5BE9   03B8 00FF 00F7
        MVO     R0,     G_031D                  ; 5BEC   0240 031D
        MVI     G_01BC, R0                      ; 5BEE   0280 01BC
        TSTR    R0                              ; 5BF0   0080
        BEQ     L_5C03                          ; 5BF1   0204 0010

        ANDI    #$0080, R0                      ; 5BF3   03B8 0080
        BNEQ    L_5BFB                          ; 5BF5   020C 0004

        MVII    #$0041, R0                      ; 5BF7   02B8 0041
        B       L_5BFF                          ; 5BF9   0200 0004

L_5BFB:
        SDBD                                    ; 5BFB   0001
        MVII    #$FFBF, R0                      ; 5BFC   02B8 00BF 00FF
L_5BFF:
        MVO     R0,     G_01BC                  ; 5BFF   0240 01BC
        B       L_5C46                          ; 5C01   0200 0043

L_5C03:
        MVI     G_0323, R0                      ; 5C03   0280 0323
        TSTR    R0                              ; 5C05   0080
        BEQ     L_5C23                          ; 5C06   0204 001B

        MVI     G_031F, R0                      ; 5C08   0280 031F
        SDBD                                    ; 5C0A   0001
        ANDI    #$0700, R0                      ; 5C0B   03B8 0000 0007
        BEQ     L_5C1B                          ; 5C0E   0204 000B

        MVI     G_031F, R0                      ; 5C10   0280 031F
        SDBD                                    ; 5C12   0001
        SUBI    #$0400, R0                      ; 5C13   0338 0000 0004
        MVO     R0,     G_0337                  ; 5C16   0240 0337

        JSR     R5,     L_51A5                  ; 5C18   0004 0150 01A5

L_5C1B:
        MVI     G_0163, R0                      ; 5C1B   0280 0163
        DECR    R0                              ; 5C1D   0010
        MVO     R0,     G_0163                  ; 5C1E   0240 0163
        CLRR    R0                              ; 5C20   01C0
        MVO     R0,     G_0323                  ; 5C21   0240 0323
L_5C23:
        MVI     G_032B, R0                      ; 5C23   0280 032B
        TSTR    R0                              ; 5C25   0080
        BEQ     L_5C43                          ; 5C26   0204 001B

        MVI     G_031F, R0                      ; 5C28   0280 031F
        SDBD                                    ; 5C2A   0001
        ANDI    #$0700, R0                      ; 5C2B   03B8 0000 0007
        BEQ     L_5C3B                          ; 5C2E   0204 000B

        MVI     G_031F, R0                      ; 5C30   0280 031F
        SDBD                                    ; 5C32   0001
        ADDI    #$0400, R0                      ; 5C33   02F8 0000 0004
        MVO     R0,     G_0337                  ; 5C36   0240 0337

        JSR     R5,     L_51A5                  ; 5C38   0004 0150 01A5

L_5C3B:
        MVI     G_0163, R0                      ; 5C3B   0280 0163
        INCR    R0                              ; 5C3D   0008
        MVO     R0,     G_0163                  ; 5C3E   0240 0163
        CLRR    R0                              ; 5C40   01C0
        MVO     R0,     G_032B                  ; 5C41   0240 032B

L_5C43:
        JSR     R5,     L_5E8A                  ; 5C43   0004 015C 028A

L_5C46:
        PULR    R7                              ; 5C46   02B7

L_5C47:
        PSHR    R5                              ; 5C47   0275
        MVII    #$0001, R0                      ; 5C48   02B8 0001
        MVO     R0,     G_0183                  ; 5C4A   0240 0183
        MVI@    R1,     R0                      ; 5C4C   0288
        SDBD                                    ; 5C4D   0001
        ANDI    #$F7FF, R0                      ; 5C4E   03B8 00FF 00F7
        MVO@    R0,     R1                      ; 5C51   0248
        SDBD                                    ; 5C52   0001
        MVII    #$61A1, R1                      ; 5C53   02B9 00A1 0061

        JSR     R5,     L_51BD                  ; 5C56   0004 0150 01BD

        CLRR    R2                              ; 5C59   01D2

        JSR     R5,     L_51B5                  ; 5C5A   0004 0150 01B5
        JSR     R5,     L_5CEA                  ; 5C5D   0004 015C 00EA

        MVI     G_01BC, R0                      ; 5C60   0280 01BC
        TSTR    R0                              ; 5C62   0080
        BEQ     L_5C73                          ; 5C63   0204 000E

        ANDI    #$0080, R0                      ; 5C65   03B8 0080
        BNEQ    L_5C6D                          ; 5C67   020C 0004

        MVII    #$0028, R0                      ; 5C69   02B8 0028
        B       L_5C71                          ; 5C6B   0200 0004

L_5C6D:
        SDBD                                    ; 5C6D   0001
        MVII    #$FFD8, R0                      ; 5C6E   02B8 00D8 00FF
L_5C71:
        MVO     R0,     G_01BC                  ; 5C71   0240 01BC
L_5C73:
        PULR    R7                              ; 5C73   02B7

        PSHR    R5                              ; 5C74   0275
        MVI     G_016F, R0                      ; 5C75   0280 016F
        TSTR    R0                              ; 5C77   0080
        BNEQ    L_5CA3                          ; 5C78   020C 0029

        MVI     G_016C, R0                      ; 5C7A   0280 016C
        TSTR    R0                              ; 5C7C   0080
        BNEQ    L_5CA3                          ; 5C7D   020C 0024

        INCR    R0                              ; 5C7F   0008
        MVO     R0,     G_016F                  ; 5C80   0240 016F
        MVO     R0,     G_016C                  ; 5C82   0240 016C

        JSR     R5,     L_5C47                  ; 5C84   0004 015C 0047

        MVI     G_0335, R0                      ; 5C87   0280 0335
        SDBD                                    ; 5C89   0001
        XORI    #$0800, R0                      ; 5C8A   03F8 0000 0008
        MVO     R0,     G_0335                  ; 5C8D   0240 0335
        MVI     G_01A9, R1                      ; 5C8F   0281 01A9
        MVI     G_01B3, R0                      ; 5C91   0280 01B3
        CMPI    #$0005, R0                      ; 5C93   0378 0005
        BGE     L_5C9B                          ; 5C95   020D 0004

        SUBR    R0,     R1                      ; 5C97   0101
        CLRR    R0                              ; 5C98   01C0
        B       L_5C9F                          ; 5C99   0200 0004

L_5C9B:
        SUBI    #$0005, R0                      ; 5C9B   0338 0005
        SUBI    #$0005, R1                      ; 5C9D   0339 0005
L_5C9F:
        MVO     R0,     G_01B3                  ; 5C9F   0240 01B3
        MVO     R1,     G_01A9                  ; 5CA1   0241 01A9
L_5CA3:
        PULR    R7                              ; 5CA3   02B7

        PSHR    R5                              ; 5CA4   0275
        MVI     G_0170, R0                      ; 5CA5   0280 0170
        TSTR    R0                              ; 5CA7   0080
        BNEQ    L_5CB8                          ; 5CA8   020C 000E

        INCR    R0                              ; 5CAA   0008
        MVO     R0,     G_0170                  ; 5CAB   0240 0170

        JSR     R5,     L_5C47                  ; 5CAD   0004 015C 0047

        MVI     G_034D, R0                      ; 5CB0   0280 034D
        SDBD                                    ; 5CB2   0001
        XORI    #$0800, R0                      ; 5CB3   03F8 0000 0008
        MVO     R0,     G_034D                  ; 5CB6   0240 034D
L_5CB8:
        PULR    R7                              ; 5CB8   02B7

L_5CB9:
        PSHR    R5                              ; 5CB9   0275
        MVI     G_018C, R0                      ; 5CBA   0280 018C
        TSTR    R0                              ; 5CBC   0080
        BNEQ    L_5CE9                          ; 5CBD   020C 002A

        MVI     G_016C, R0                      ; 5CBF   0280 016C
        TSTR    R0                              ; 5CC1   0080
        BNEQ    L_5CE9                          ; 5CC2   020C 0025

        INCR    R0                              ; 5CC4   0008
        MVO     R0,     G_016C                  ; 5CC5   0240 016C
        MOVR    R1,     R4                      ; 5CC7   008C
        MVII    #$0008, R0                      ; 5CC8   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5CCA   0004 0114 0338

        MVI     G_0335, R0                      ; 5CCD   0280 0335
        SDBD                                    ; 5CCF   0001
        ANDI    #$F7FF, R0                      ; 5CD0   03B8 00FF 00F7
        SDBD                                    ; 5CD3   0001
        XORI    #$0800, R0                      ; 5CD4   03F8 0000 0008
        MVO     R0,     G_0335                  ; 5CD7   0240 0335
        SDBD                                    ; 5CD9   0001
        MVII    #$61E3, R0                      ; 5CDA   02B8 00E3 0061
        MVO     R0,     G_0336                  ; 5CDD   0240 0336
        CLRR    R0                              ; 5CDF   01C0
        MVO     R0,     G_033A                  ; 5CE0   0240 033A
        MVO     R0,     G_033B                  ; 5CE2   0240 033B
        MVII    #$0003, R0                      ; 5CE4   02B8 0003

        JSR     R5,     .EXEC.41C               ; 5CE6   0004 0114 001C

L_5CE9:
        PULR    R7                              ; 5CE9   02B7

L_5CEA:
        PSHR    R5                              ; 5CEA   0275
        MVI     G_01AB, R0                      ; 5CEB   0280 01AB
        INCR    R0                              ; 5CED   0008
        MVO     R0,     G_01AB                  ; 5CEE   0240 01AB
        PULR    R7                              ; 5CF0   02B7

        PSHR    R5                              ; 5CF1   0275
        MVI     G_01B8, R0                      ; 5CF2   0280 01B8
        INCR    R0                              ; 5CF4   0008
        MVO     R0,     G_01B8                  ; 5CF5   0240 01B8
        MVI     G_01B3, R0                      ; 5CF7   0280 01B3
        ADDI    #$0005, R0                      ; 5CF9   02F8 0005
        MVO     R0,     G_01B3                  ; 5CFB   0240 01B3
        MVI     G_01A9, R0                      ; 5CFD   0280 01A9
        ADDI    #$0007, R0                      ; 5CFF   02F8 0007
        MVO     R0,     G_01A9                  ; 5D01   0240 01A9
        MVII    #$0335, R4                      ; 5D03   02BC 0335
        MVII    #$0008, R0                      ; 5D05   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5D07   0004 0114 0338

        MVII    #$00C8, R0                      ; 5D0A   02B8 00C8
        MVO     R0,     G_032C                  ; 5D0C   0240 032C
        CLRR    R0                              ; 5D0E   01C0
        MVO     R0,     G_016A                  ; 5D0F   0240 016A
        SDBD                                    ; 5D11   0001
        MVII    #$5024, R1                      ; 5D12   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 5D15   0004 0118 0038

        PULR    R7                              ; 5D18   02B7

        PSHR    R5                              ; 5D19   0275
        MVI     G_031F, R0                      ; 5D1A   0280 031F
        SDBD                                    ; 5D1C   0001
        ADDI    #$0400, R0                      ; 5D1D   02F8 0000 0004

        JSR     R5,     L_51A5                  ; 5D20   0004 0150 01A5
        JSR     R5,     L_5D53                  ; 5D23   0004 015C 0153

        SDBD                                    ; 5D26   0001
        ANDI    #$0700, R0                      ; 5D27   03B8 0000 0007
        BEQ     L_5D32                          ; 5D2A   0204 0006

        MVI     G_01A7, R0                      ; 5D2C   0280 01A7
        MVO     R0,     G_0323                  ; 5D2E   0240 0323
        B       L_5D35                          ; 5D30   0200 0003

L_5D32:
        JSR     R5,     L_5D61                  ; 5D32   0004 015C 0161

L_5D35:
        PULR    R7                              ; 5D35   02B7

        PSHR    R5                              ; 5D36   0275
        MVI     G_031F, R0                      ; 5D37   0280 031F
        SDBD                                    ; 5D39   0001
        SUBI    #$0400, R0                      ; 5D3A   0338 0000 0004

        JSR     R5,     L_51A5                  ; 5D3D   0004 0150 01A5
        JSR     R5,     L_5D53                  ; 5D40   0004 015C 0153

        SDBD                                    ; 5D43   0001
        ANDI    #$0700, R0                      ; 5D44   03B8 0000 0007
        BEQ     L_5D4F                          ; 5D47   0204 0006

        MVI     G_01A7, R0                      ; 5D49   0280 01A7
        MVO     R0,     G_032B                  ; 5D4B   0240 032B
        B       L_5D52                          ; 5D4D   0200 0003

L_5D4F:
        JSR     R5,     L_5D61                  ; 5D4F   0004 015C 0161

L_5D52:
        PULR    R7                              ; 5D52   02B7

L_5D53:
        PSHR    R5                              ; 5D53   0275
        MVI     G_018D, R1                      ; 5D54   0281 018D
        TSTR    R1                              ; 5D56   0089
        BEQ     L_5D60                          ; 5D57   0204 0007

        MOVR    R0,     R1                      ; 5D59   0081
        SDBD                                    ; 5D5A   0001
        SUBI    #$0400, R1                      ; 5D5B   0339 0000 0004
        MVO     R1,     G_033F                  ; 5D5E   0241 033F
L_5D60:
        PULR    R7                              ; 5D60   02B7

L_5D61:
        PSHR    R5                              ; 5D61   0275
        SDBD                                    ; 5D62   0001
        MVII    #$5020, R1                      ; 5D63   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 5D66   0004 0118 0044

        MVI     G_0322, R2                      ; 5D69   0282 0322
        SDBD                                    ; 5D6B   0001
        ANDI    #$FC0F, R2                      ; 5D6C   03BA 000F 00FC

        JSR     R5,     L_51B5                  ; 5D6F   0004 0150 01B5

        MVII    #$0001, R0                      ; 5D72   02B8 0001
        MVO     R0,     G_018F                  ; 5D74   0240 018F
        PULR    R7                              ; 5D76   02B7

        PSHR    R5                              ; 5D77   0275
        MVI     G_0173, R4                      ; 5D78   0284 0173
        CMPI    #$0002, R4                      ; 5D7A   037C 0002
        BEQ     L_5DCF                          ; 5D7C   0204 0051

        SDBD                                    ; 5D7E   0001
        MVII    #$618C, R1                      ; 5D7F   02B9 008C 0061

        JSR     R5,     L_51BD                  ; 5D82   0004 0150 01BD

        NOP                                     ; 5D85   0034
        SDBD                                    ; 5D86   0001
        MVII    #$61BF, R0                      ; 5D87   02B8 00BF 0061
        MVO     R0,     G_0336                  ; 5D8A   0240 0336
        MVI     G_0335, R5                      ; 5D8C   0285 0335
        SDBD                                    ; 5D8E   0001
        ANDI    #$FDFF, R5                      ; 5D8F   03BD 00FF 00FD
        MVI     G_031D, R1                      ; 5D92   0281 031D
        SDBD                                    ; 5D94   0001
        ANDI    #$FDFF, R1                      ; 5D95   03B9 00FF 00FD
        NOP                                     ; 5D98   0034
        MVI     G_0325, R2                      ; 5D99   0282 0325
        SDBD                                    ; 5D9B   0001
        ANDI    #$FDFF, R2                      ; 5D9C   03BA 00FF 00FD
        MVI     G_032D, R3                      ; 5D9F   0283 032D
        SDBD                                    ; 5DA1   0001
        ANDI    #$FDFF, R3                      ; 5DA2   03BB 00FF 00FD
        MVI     G_0337, R0                      ; 5DA5   0280 0337
        NOP                                     ; 5DA7   0034
        CMPI    #$0001, R4                      ; 5DA8   037C 0001
        BEQ     L_5DB2                          ; 5DAA   0204 0006

        SDBD                                    ; 5DAC   0001
        ADDI    #$0400, R0                      ; 5DAD   02F8 0000 0004
        B       L_5DBF                          ; 5DB0   0200 000D

L_5DB2:
        XORI    #$0200, R5                      ; 5DB2   03FD 0200
        XORI    #$0200, R1                      ; 5DB4   03F9 0200
        XORI    #$0200, R2                      ; 5DB6   03FA 0200
        XORI    #$0200, R3                      ; 5DB8   03FB 0200
        NOP                                     ; 5DBA   0034
        SDBD                                    ; 5DBB   0001
        SUBI    #$0400, R0                      ; 5DBC   0338 0000 0004
L_5DBF:
        MVO     R5,     G_0335                  ; 5DBF   0245 0335
        MVO     R1,     G_031D                  ; 5DC1   0241 031D
        MVO     R2,     G_0325                  ; 5DC3   0242 0325
        MVO     R3,     G_032D                  ; 5DC5   0243 032D
        NOP                                     ; 5DC7   0034
        MVO     R0,     G_0337                  ; 5DC8   0240 0337

        JSR     R5,     L_51A5                  ; 5DCA   0004 0150 01A5

        B       L_5DE6                          ; 5DCD   0200 0017

L_5DCF:
        SDBD                                    ; 5DCF   0001
        MVII    #$61B6, R0                      ; 5DD0   02B8 00B6 0061
        MVO     R0,     G_0336                  ; 5DD3   0240 0336
        NOP                                     ; 5DD5   0034
        SDBD                                    ; 5DD6   0001
        MVII    #$6177, R1                      ; 5DD7   02B9 0077 0061

        JSR     R5,     L_51BD                  ; 5DDA   0004 0150 01BD

        NOP                                     ; 5DDD   0034
        SDBD                                    ; 5DDE   0001
        MVII    #$FFBA, R0                      ; 5DDF   02B8 00BA 00FF
        MVO     R0,     G_01BC                  ; 5DE2   0240 01BC
        B       L_5DF6                          ; 5DE4   0200 0010

L_5DE6:
        SDBD                                    ; 5DE6   0001
        ANDI    #$0700, R0                      ; 5DE7   03B8 0000 0007
        BEQ     L_5DF3                          ; 5DEA   0204 0007

        NOP                                     ; 5DEC   0034
        MVII    #$0001, R0                      ; 5DED   02B8 0001
        MVO     R0,     G_0333                  ; 5DEF   0240 0333
        B       L_5DF6                          ; 5DF1   0200 0003

L_5DF3:
        JSR     R5,     L_5E8A                  ; 5DF3   0004 015C 028A

L_5DF6:
        PULR    R7                              ; 5DF6   02B7

        PSHR    R5                              ; 5DF7   0275
        MVI     G_0184, R0                      ; 5DF8   0280 0184
        TSTR    R0                              ; 5DFA   0080
        BNEQ    L_5E89                          ; 5DFB   020C 008C

        MVI     G_0335, R0                      ; 5DFD   0280 0335
        SDBD                                    ; 5DFF   0001
        ANDI    #$FBFF, R0                      ; 5E00   03B8 00FF 00FB
        MVI     G_0173, R4                      ; 5E03   0284 0173
        CMPI    #$0002, R4                      ; 5E05   037C 0002
        BGE     L_5E32                          ; 5E07   020D 0029

        SDBD                                    ; 5E09   0001
        ANDI    #$FDFF, R0                      ; 5E0A   03B8 00FF 00FD
        MVI     G_0337, R1                      ; 5E0D   0281 0337
        MVI     G_018C, R2                      ; 5E0F   0282 018C
        TSTR    R2                              ; 5E11   0092
        BEQ     L_5E1A                          ; 5E12   0204 0006

        SDBD                                    ; 5E14   0001
        MVII    #$61BF, R3                      ; 5E15   02BB 00BF 0061
        B       L_5E1E                          ; 5E18   0200 0004

L_5E1A:
        SDBD                                    ; 5E1A   0001
        MVII    #$61DA, R3                      ; 5E1B   02BB 00DA 0061
L_5E1E:
        CMPI    #$0001, R4                      ; 5E1E   037C 0001
        BEQ     L_5E28                          ; 5E20   0204 0006

        SDBD                                    ; 5E22   0001
        ADDI    #$0400, R1                      ; 5E23   02F9 0000 0004
        B       L_5E2E                          ; 5E26   0200 0006

L_5E28:
        XORI    #$0200, R0                      ; 5E28   03F8 0200
        SDBD                                    ; 5E2A   0001
        SUBI    #$0400, R1                      ; 5E2B   0339 0000 0004
L_5E2E:
        MVO     R1,     G_0337                  ; 5E2E   0241 0337
        B       L_5E5F                          ; 5E30   0200 002D

L_5E32:
        CMPI    #$0002, R4                      ; 5E32   037C 0002
        BGT     L_5E4F                          ; 5E34   020E 0019

        MVI     G_0338, R1                      ; 5E36   0281 0338
        SDBD                                    ; 5E38   0001
        ADDI    #$0400, R1                      ; 5E39   02F9 0000 0004
        MVO     R1,     G_0338                  ; 5E3C   0241 0338
        MVI     G_018C, R2                      ; 5E3E   0282 018C
        TSTR    R2                              ; 5E40   0092
        BEQ     L_5E49                          ; 5E41   0204 0006

        SDBD                                    ; 5E43   0001
        MVII    #$61B6, R3                      ; 5E44   02BB 00B6 0061
        B       L_5E5F                          ; 5E47   0200 0016

L_5E49:
        SDBD                                    ; 5E49   0001
        MVII    #$61C8, R3                      ; 5E4A   02BB 00C8 0061
        B       L_5E5F                          ; 5E4D   0200 0010

L_5E4F:
        MVI     G_0338, R1                      ; 5E4F   0281 0338
        SDBD                                    ; 5E51   0001
        SUBI    #$0400, R1                      ; 5E52   0339 0000 0004
        MVO     R1,     G_0338                  ; 5E55   0241 0338
        SDBD                                    ; 5E57   0001
        MVII    #$61D1, R3                      ; 5E58   02BB 00D1 0061
        SDBD                                    ; 5E5B   0001
        XORI    #$0400, R0                      ; 5E5C   03F8 0000 0004
L_5E5F:
        MVO     R3,     G_0336                  ; 5E5F   0243 0336
        MVO     R0,     G_0335                  ; 5E61   0240 0335
        SDBD                                    ; 5E63   0001
        ANDI    #$0700, R1                      ; 5E64   03B9 0000 0007
        BEQ     L_5E6F                          ; 5E67   0204 0006

        MVII    #$0002, R0                      ; 5E69   02B8 0002
        MVO     R0,     G_033B                  ; 5E6B   0240 033B
        B       L_5E89                          ; 5E6D   0200 001A

L_5E6F:
        MVI     G_0185, R0                      ; 5E6F   0280 0185
        TSTR    R0                              ; 5E71   0080
        BEQ     L_5E7C                          ; 5E72   0204 0008

        MVI     G_033A, R0                      ; 5E74   0280 033A
        ANDI    #$000F, R0                      ; 5E76   03B8 000F
        MVO     R0,     G_033A                  ; 5E78   0240 033A
        B       L_5E89                          ; 5E7A   0200 000D

L_5E7C:
        MVI     G_019A, R0                      ; 5E7C   0280 019A
        TSTR    R0                              ; 5E7E   0080
        BEQ     L_5E86                          ; 5E7F   0204 0005

        JSR     R5,     L_5FEA                  ; 5E81   0004 015C 03EA

        B       L_5E89                          ; 5E84   0200 0003

L_5E86:
        JSR     R5,     L_5E8A                  ; 5E86   0004 015C 028A

L_5E89:
        PULR    R7                              ; 5E89   02B7

L_5E8A:
        PSHR    R5                              ; 5E8A   0275
        MVI     G_018E, R0                      ; 5E8B   0280 018E
        TSTR    R0                              ; 5E8D   0080
        BNEQ    L_5F93                          ; 5E8E   020C 0103

        MVI     G_0165, R0                      ; 5E90   0280 0165
        TSTR    R0                              ; 5E92   0080
        BNEQ    L_5E9B                          ; 5E93   020C 0006

        MVI     G_0163, R0                      ; 5E95   0280 0163
        CMPI    #$00A8, R0                      ; 5E97   0378 00A8
        BGE     L_5F93                          ; 5E99   020D 00F8

L_5E9B:
        CMPI    #$0005, R0                      ; 5E9B   0378 0005
        BNEQ    L_5EB8                          ; 5E9D   020C 0019

        MVI     G_0163, R2                      ; 5E9F   0282 0163
        CMPI    #$0064, R2                      ; 5EA1   037A 0064
        BNEQ    L_5EAE                          ; 5EA3   020C 0009

        DECR    R2                              ; 5EA5   0012
        MVII    #$0001, R1                      ; 5EA6   02B9 0001
        MVO     R1,     G_0173                  ; 5EA8   0241 0173
        MVO     R1,     G_0174                  ; 5EAA   0241 0174
        B       L_5F83                          ; 5EAC   0200 00D5

L_5EAE:
        CMPI    #$0063, R2                      ; 5EAE   037A 0063
        BNEQ    L_5EB8                          ; 5EB0   020C 0006

        MVII    #$0001, R2                      ; 5EB2   02BA 0001
        MVO     R2,     G_0193                  ; 5EB4   0242 0193
        B       L_5F93                          ; 5EB6   0200 00DB

L_5EB8:
        MVI     G_0182, R0                      ; 5EB8   0280 0182
        TSTR    R0                              ; 5EBA   0080
        BEQ     L_5F17                          ; 5EBB   0204 005A

        MVI     G_0178, R0                      ; 5EBD   0280 0178
        DECR    R0                              ; 5EBF   0010
        BEQ     L_5EC6                          ; 5EC0   0204 0004

        MVO     R0,     G_0178                  ; 5EC2   0240 0178
        B       L_5F17                          ; 5EC4   0200 0051

L_5EC6:
        CLRR    R2                              ; 5EC6   01D2
        MVO     R2,     G_0182                  ; 5EC7   0242 0182
        INCR    R2                              ; 5EC9   000A
        MVO     R2,     G_018F                  ; 5ECA   0242 018F
        MVO     R2,     G_0171                  ; 5ECC   0242 0171
        ADDI    #$0002, R2                      ; 5ECE   02FA 0002

        JSR     R5,     L_51B5                  ; 5ED0   0004 0150 01B5

        MVII    #$0240, R0                      ; 5ED3   02B8 0240
        MVO     R0,     G_033A                  ; 5ED5   0240 033A
        SDBD                                    ; 5ED7   0001
        MVII    #$61A1, R1                      ; 5ED8   02B9 00A1 0061

        JSR     R5,     L_51BD                  ; 5EDB   0004 0150 01BD

        NOP                                     ; 5EDE   0034
        MVI     G_031D, R0                      ; 5EDF   0280 031D
        SDBD                                    ; 5EE1   0001
        XORI    #$0800, R0                      ; 5EE2   03F8 0000 0008
        MVO     R0,     G_031D                  ; 5EE5   0240 031D
        MVI     G_0335, R0                      ; 5EE7   0280 0335
        SDBD                                    ; 5EE9   0001
        XORI    #$4000, R0                      ; 5EEA   03F8 0000 0040
        MVO     R0,     G_0335                  ; 5EED   0240 0335
        SDBD                                    ; 5EEF   0001
        MVII    #$3F00, R1                      ; 5EF0   02B9 0000 003F

        JSR     R5,     L_51AD                  ; 5EF3   0004 0150 01AD

        SDBD                                    ; 5EF6   0001
        MVII    #$4000, R0                      ; 5EF7   02B8 0000 0040
        MVO     R0,     G_0338                  ; 5EFA   0240 0338
        MVI     G_0163, R0                      ; 5EFC   0280 0163
        MVO     R0,     G_0160                  ; 5EFE   0240 0160
        MVI     G_0165, R0                      ; 5F00   0280 0165
        MVO     R0,     G_0162                  ; 5F02   0240 0162
        MVI     G_0164, R0                      ; 5F04   0280 0164
        MVO     R0,     G_0161                  ; 5F06   0240 0161
        NOP                                     ; 5F08   0034
        MVI     G_018E, R0                      ; 5F09   0280 018E
        TSTR    R0                              ; 5F0B   0080
        BNEQ    L_5F17                          ; 5F0C   020C 0009

        SDBD                                    ; 5F0E   0001
        MVII    #$6FB6, R0                      ; 5F0F   02B8 00B6 006F
        MVO     R0,     G_035D                  ; 5F12   0240 035D

        JSR     R5,     L_5CEA                  ; 5F14   0004 015C 00EA

L_5F17:
        MVI     G_0163, R2                      ; 5F17   0282 0163
        CMPI    #$00E4, R2                      ; 5F19   037A 00E4
        BLT     L_5F46                          ; 5F1B   0205 0029

        MVI     G_0182, R0                      ; 5F1D   0280 0182
        TSTR    R0                              ; 5F1F   0080
        BEQ     L_5F2D                          ; 5F20   0204 000B

        MVI     G_0165, R0                      ; 5F22   0280 0165
        CMPI    #$0001, R0                      ; 5F24   0378 0001
        BNEQ    L_5F2D                          ; 5F26   020C 0005

        MVI     G_01A0, R0                      ; 5F28   0280 01A0
        DECR    R0                              ; 5F2A   0010
        MVO     R0,     G_01A0                  ; 5F2B   0240 01A0
L_5F2D:
        MVI     G_0164, R1                      ; 5F2D   0281 0164
        DECR    R1                              ; 5F2F   0011
        MVO     R1,     G_0164                  ; 5F30   0241 0164
        SDBD                                    ; 5F32   0001
        MVII    #$6DA7, R5                      ; 5F33   02BD 00A7 006D
        ADD     G_019D, R5                      ; 5F36   02C5 019D
        SDBD                                    ; 5F38   0001
        MVI@    R5,     R3                      ; 5F39   02AB
        NOP                                     ; 5F3A   0034
        ADD     G_0164, R3                      ; 5F3B   02C3 0164
        MVI@    R3,     R4                      ; 5F3D   029C
        MVO     R4,     G_0165                  ; 5F3E   0244 0165
        MVII    #$0008, R2                      ; 5F40   02BA 0008
        MVO     R2,     G_0163                  ; 5F42   0242 0163
        B       L_5F55                          ; 5F44   0200 000F

L_5F46:
        MVI     G_0165, R3                      ; 5F46   0283 0165

        JSR     R5,     L_6D17                  ; 5F48   0004 016C 0117

        NOP                                     ; 5F4B   0034
        MOVR    R0,     R3                      ; 5F4C   0083
        ADDI    #$0014, R2                      ; 5F4D   02FA 0014
        ADDR    R2,     R3                      ; 5F4F   00D3
        MVI@    R3,     R1                      ; 5F50   0299
        CMPI    #$0008, R1                      ; 5F51   0379 0008
        BGT     L_5F5B                          ; 5F53   020E 0006

L_5F55:
        MVII    #$0002, R0                      ; 5F55   02B8 0002
        MVO     R0,     G_0173                  ; 5F57   0240 0173
        B       L_5F83                          ; 5F59   0200 0028

L_5F5B:
        MVI     G_0174, R4                      ; 5F5B   0284 0174
        TSTR    R4                              ; 5F5D   00A4
        BEQ     L_5F73                          ; 5F5E   0204 0013

L_5F60:
        MOVR    R0,     R3                      ; 5F60   0083
        MVI     G_0163, R2                      ; 5F61   0282 0163
        DECR    R2                              ; 5F63   0012
        ADDR    R2,     R3                      ; 5F64   00D3
        MVI@    R3,     R1                      ; 5F65   0299
        CMPI    #$0008, R1                      ; 5F66   0379 0008
        BGT     L_5F73                          ; 5F68   020E 0009

        NOP                                     ; 5F6A   0034
        MVII    #$0001, R1                      ; 5F6B   02B9 0001
        MVO     R1,     G_0173                  ; 5F6D   0241 0173
        MVO     R1,     G_0174                  ; 5F6F   0241 0174
        B       L_5F83                          ; 5F71   0200 0010

L_5F73:
        MOVR    R0,     R3                      ; 5F73   0083
        MVI     G_0163, R2                      ; 5F74   0282 0163
        INCR    R2                              ; 5F76   000A
        ADDR    R2,     R3                      ; 5F77   00D3
        MVI@    R3,     R1                      ; 5F78   0299
        CMPI    #$0008, R1                      ; 5F79   0379 0008
        BGT     L_5F60                          ; 5F7B   022E 001C

        NOP                                     ; 5F7D   0034
        CLRR    R1                              ; 5F7E   01C9
        MVO     R1,     G_0174                  ; 5F7F   0241 0174
        MVO     R1,     G_0173                  ; 5F81   0241 0173
L_5F83:
        MVO     R2,     G_0163                  ; 5F83   0242 0163
        MVI     G_0182, R0                      ; 5F85   0280 0182
        TSTR    R0                              ; 5F87   0080
        BEQ     L_5F90                          ; 5F88   0204 0006

        MVII    #$0001, R0                      ; 5F8A   02B8 0001
        MVO     R0,     G_0333                  ; 5F8C   0240 0333
        B       L_5F93                          ; 5F8E   0200 0003

L_5F90:
        INCR    R0                              ; 5F90   0008
        MVO     R0,     G_033B                  ; 5F91   0240 033B
L_5F93:
        PULR    R7                              ; 5F93   02B7

        PSHR    R5                              ; 5F94   0275
        CLRR    R0                              ; 5F95   01C0
        MVO@    R0,     R1                      ; 5F96   0248
        PULR    R7                              ; 5F97   02B7

        PSHR    R5                              ; 5F98   0275
        CLRR    R0                              ; 5F99   01C0
        MVO     R0,     G_0339                  ; 5F9A   0240 0339
        MVO     R0,     G_0341                  ; 5F9C   0240 0341
        PULR    R7                              ; 5F9E   02B7

        PSHR    R5                              ; 5F9F   0275
        MOVR    R1,     R4                      ; 5FA0   008C
        SDBD                                    ; 5FA1   0001
        MVI@    R4,     R0                      ; 5FA2   02A0
        MVI@    R4,     R0                      ; 5FA3   02A0
        SUBI    #$0300, R0                      ; 5FA4   0338 0300
        DECR    R4                              ; 5FA6   0014
        MVO@    R0,     R4                      ; 5FA7   0260
        MVI@    R4,     R0                      ; 5FA8   02A0
        SUBI    #$0300, R0                      ; 5FA9   0338 0300
        DECR    R4                              ; 5FAB   0014
        MVO@    R0,     R4                      ; 5FAC   0260

        JSR     R5,     L_5FB5                  ; 5FAD   0004 015C 03B5

        INCR    R4                              ; 5FB0   000C

        JSR     R5,     L_5FD1                  ; 5FB1   0004 015C 03D1

        PULR    R7                              ; 5FB4   02B7

L_5FB5:
        PSHR    R5                              ; 5FB5   0275
        MVII    #$0003, R0                      ; 5FB6   02B8 0003

        JSR     R5,     X_RAND2                 ; 5FB8   0004 0114 029E

        ADDI    #$000B, R0                      ; 5FBB   02F8 000B
        PSHR    R0                              ; 5FBD   0270
        MVII    #$0004, R0                      ; 5FBE   02B8 0004

        JSR     R5,     X_RAND2                 ; 5FC0   0004 0114 029E

        MVII    #$0005, R1                      ; 5FC3   02B9 0005

        JSR     R5,     X_MPY                   ; 5FC5   0004 011C 01DC

        ADDI    #$0028, R2                      ; 5FC8   02FA 0028
        MOVR    R2,     R0                      ; 5FCA   0090
        PULR    R1                              ; 5FCB   02B1

        JSR     R5,     .EXEC.629               ; 5FCC   0004 0114 0229

        MVO@    R0,     R4                      ; 5FCF   0260
        PULR    R7                              ; 5FD0   02B7

L_5FD1:
        PSHR    R5                              ; 5FD1   0275
        MVII    #$0004, R0                      ; 5FD2   02B8 0004

        JSR     R5,     X_RAND2                 ; 5FD4   0004 0114 029E

        ADDI    #$0003, R0                      ; 5FD7   02F8 0003
        SLL     R0,     1                       ; 5FD9   0048
        MVO@    R0,     R4                      ; 5FDA   0260
        PULR    R7                              ; 5FDB   02B7

        PSHR    R5                              ; 5FDC   0275
        MVI     G_016D, R0                      ; 5FDD   0280 016D
        CLRR    R0                              ; 5FDF   01C0
        MVO     R0,     G_016D                  ; 5FE0   0240 016D
        PULR    R7                              ; 5FE2   02B7

        PSHR    R5                              ; 5FE3   0275
        MVI     G_016E, R0                      ; 5FE4   0280 016E
        CLRR    R0                              ; 5FE6   01C0
        MVO     R0,     G_016E                  ; 5FE7   0240 016E
        PULR    R7                              ; 5FE9   02B7

L_5FEA:
        PSHR    R5                              ; 5FEA   0275
        CLRR    R0                              ; 5FEB   01C0
        MVO     R0,     G_0198                  ; 5FEC   0240 0198
        MVO     R0,     G_0199                  ; 5FEE   0240 0199
        MVI     G_0165, R3                      ; 5FF0   0283 0165

        JSR     R5,     L_6D17                  ; 5FF2   0004 016C 0117

        MVO     R0,     G_0344                  ; 5FF5   0240 0344
        MVI     G_0174, R0                      ; 5FF7   0280 0174
        CMPI    #$0002, R0                      ; 5FF9   0378 0002
        BLT     L_6048                          ; 5FFB   0205 004B

L_5FFD:
        MVI     G_0198, R0                      ; 5FFD   0280 0198
        TSTR    R0                              ; 5FFF   0080
        BEQ     L_6009                          ; 6000   0204 0007

        MVI     G_0174, R0                      ; 6002   0280 0174
        TSTR    R0                              ; 6004   0080
        BEQ     L_602C                          ; 6005   0204 0025
        B       L_6011                          ; 6007   0200 0008

L_6009:
        MVII    #$0002, R0                      ; 6009   02B8 0002

        JSR     R5,     X_RAND2                 ; 600B   0004 0114 029E

        TSTR    R0                              ; 600E   0080
        BEQ     L_602C                          ; 600F   0204 001B

L_6011:
        MVI     G_0344, R3                      ; 6011   0283 0344
        MVI     G_0163, R2                      ; 6013   0282 0163
        DECR    R2                              ; 6015   0012
        ADDR    R2,     R3                      ; 6016   00D3
        MVI@    R3,     R1                      ; 6017   0299
        CMPI    #$0008, R1                      ; 6018   0379 0008
        BGT     L_6024                          ; 601A   020E 0008

        MVII    #$0001, R0                      ; 601C   02B8 0001
        MVO     R0,     G_0173                  ; 601E   0240 0173
        MVO     R0,     G_0174                  ; 6020   0240 0174
        B       L_60D1                          ; 6022   0200 00AD

L_6024:
        MVI     G_0199, R0                      ; 6024   0280 0199
        TSTR    R0                              ; 6026   0080
        BNEQ    L_6048                          ; 6027   020C 001F

        INCR    R0                              ; 6029   0008
        MVO     R0,     G_0199                  ; 602A   0240 0199
L_602C:
        MVI     G_0344, R3                      ; 602C   0283 0344
        MVI     G_0163, R2                      ; 602E   0282 0163
        INCR    R2                              ; 6030   000A
        ADDR    R2,     R3                      ; 6031   00D3
        MVI@    R3,     R1                      ; 6032   0299
        CMPI    #$0008, R1                      ; 6033   0379 0008
        BGT     L_603E                          ; 6035   020E 0007

        CLRR    R0                              ; 6037   01C0
        MVO     R0,     G_0174                  ; 6038   0240 0174
        MVO     R0,     G_0173                  ; 603A   0240 0173
        B       L_60D1                          ; 603C   0200 0093

L_603E:
        MVI     G_0199, R0                      ; 603E   0280 0199
        TSTR    R0                              ; 6040   0080
        BNEQ    L_6048                          ; 6041   020C 0005

        INCR    R0                              ; 6043   0008
        MVO     R0,     G_0199                  ; 6044   0240 0199
        B       L_6011                          ; 6046   0220 0036

L_6048:
        MVI     G_0199, R0                      ; 6048   0280 0199
        TSTR    R0                              ; 604A   0080
        BEQ     L_6055                          ; 604B   0204 0008

        MVI     G_0174, R0                      ; 604D   0280 0174
        CMPI    #$0002, R0                      ; 604F   0378 0002
        BGT     L_6096                          ; 6051   020E 0043
        B       L_605D                          ; 6053   0200 0008

L_6055:
        MVII    #$0002, R0                      ; 6055   02B8 0002

        JSR     R5,     X_RAND2                 ; 6057   0004 0114 029E

        TSTR    R0                              ; 605A   0080
        BEQ     L_6096                          ; 605B   0204 0039

L_605D:
        MVI     G_0163, R2                      ; 605D   0282 0163
        CMPI    #$00E4, R2                      ; 605F   037A 00E4
        BLT     L_607C                          ; 6061   0205 0019

        MVI     G_0164, R1                      ; 6063   0281 0164
        DECR    R1                              ; 6065   0011
        MVO     R1,     G_0164                  ; 6066   0241 0164
        SDBD                                    ; 6068   0001
        MVII    #$6DA7, R5                      ; 6069   02BD 00A7 006D
        ADD     G_019D, R5                      ; 606C   02C5 019D
        SDBD                                    ; 606E   0001
        MVI@    R5,     R3                      ; 606F   02AB
        NOP                                     ; 6070   0034
        ADD     G_0164, R3                      ; 6071   02C3 0164
        MVI@    R3,     R4                      ; 6073   029C
        MVO     R4,     G_0165                  ; 6074   0244 0165
        MVII    #$0008, R2                      ; 6076   02BA 0008
        MVO     R2,     G_0163                  ; 6078   0242 0163
        B       L_6086                          ; 607A   0200 000A

L_607C:
        MVI     G_0344, R3                      ; 607C   0283 0344
        ADDI    #$0014, R2                      ; 607E   02FA 0014
        ADDR    R2,     R3                      ; 6080   00D3
        MVI@    R3,     R1                      ; 6081   0299
        CMPI    #$0008, R1                      ; 6082   0379 0008
        BGT     L_608E                          ; 6084   020E 0008

L_6086:
        MVII    #$0002, R0                      ; 6086   02B8 0002
        MVO     R0,     G_0174                  ; 6088   0240 0174
        MVO     R0,     G_0173                  ; 608A   0240 0173
        B       L_60D1                          ; 608C   0200 0043

L_608E:
        MVI     G_0198, R0                      ; 608E   0280 0198
        TSTR    R0                              ; 6090   0080
        BNEQ    L_5FFD                          ; 6091   022C 0095

        INCR    R0                              ; 6093   0008
        MVO     R0,     G_0198                  ; 6094   0240 0198
L_6096:
        MVI     G_0163, R2                      ; 6096   0282 0163
        CMPI    #$0008, R2                      ; 6098   037A 0008
        BGT     L_60B5                          ; 609A   020E 0019

        MVI     G_0164, R1                      ; 609C   0281 0164
        INCR    R1                              ; 609E   0009
        MVO     R1,     G_0164                  ; 609F   0241 0164
        SDBD                                    ; 60A1   0001
        MVII    #$6DA7, R5                      ; 60A2   02BD 00A7 006D
        ADD     G_019D, R5                      ; 60A5   02C5 019D
        SDBD                                    ; 60A7   0001
        MVI@    R5,     R3                      ; 60A8   02AB
        NOP                                     ; 60A9   0034
        ADD     G_0164, R3                      ; 60AA   02C3 0164
        MVI@    R3,     R4                      ; 60AC   029C
        MVO     R4,     G_0165                  ; 60AD   0244 0165
        MVII    #$00E4, R2                      ; 60AF   02BA 00E4
        MVO     R2,     G_0163                  ; 60B1   0242 0163
        B       L_60BF                          ; 60B3   0200 000A

L_60B5:
        MVI     G_0344, R3                      ; 60B5   0283 0344
        SUBI    #$0014, R2                      ; 60B7   033A 0014
        ADDR    R2,     R3                      ; 60B9   00D3
        MVI@    R3,     R1                      ; 60BA   0299
        CMPI    #$0008, R1                      ; 60BB   0379 0008
        BGT     L_60C7                          ; 60BD   020E 0008

L_60BF:
        MVII    #$0003, R0                      ; 60BF   02B8 0003
        MVO     R0,     G_0174                  ; 60C1   0240 0174
        MVO     R0,     G_0173                  ; 60C3   0240 0173
        B       L_60D1                          ; 60C5   0200 000A

L_60C7:
        MVI     G_0198, R0                      ; 60C7   0280 0198
        TSTR    R0                              ; 60C9   0080
        BNEQ    L_5FFD                          ; 60CA   022C 00CE

        INCR    R0                              ; 60CC   0008
        MVO     R0,     G_0198                  ; 60CD   0240 0198
        B       L_605D                          ; 60CF   0220 0073

L_60D1:
        MVO     R2,     G_0163                  ; 60D1   0242 0163
        MVII    #$0001, R0                      ; 60D3   02B8 0001
        MVO     R0,     G_033B                  ; 60D5   0240 033B
        PULR    R7                              ; 60D7   02B7

        PSHR    R5                              ; 60D8   0275
        CLRR    R1                              ; 60D9   01C9
        MVO     R1,     G_019B                  ; 60DA   0241 019B
        INCR    R1                              ; 60DC   0009
        MVO     R1,     G_019C                  ; 60DD   0241 019C
        MVII    #$0001, R1                      ; 60DF   02B9 0001
        MVII    #$0014, R0                      ; 60E1   02B8 0014

        JSR     R5,     .EXEC.629               ; 60E3   0004 0114 0229

        MVO     R0,     G_0351                  ; 60E6   0240 0351

        JSR     R5,     L_60EC                  ; 60E8   0004 0160 00EC

        PULR    R7                              ; 60EB   02B7

L_60EC:
        PSHR    R5                              ; 60EC   0275
        MVI     G_019D, R0                      ; 60ED   0280 019D
        SLR     R0,     1                       ; 60EF   0060
        CMPI    #$0007, R0                      ; 60F0   0378 0007
        BLT     L_6103                          ; 60F2   0205 000F

        MVII    #$0009, R1                      ; 60F4   02B9 0009
        SUBR    R0,     R1                      ; 60F6   0101
        MVII    #$0064, R0                      ; 60F7   02B8 0064

        JSR     R5,     X_MPY                   ; 60F9   0004 011C 01DC

        ADDI    #$0320, R2                      ; 60FC   02FA 0320
        MVO     R2,     G_0354                  ; 60FE   0242 0354
        CLRR    R0                              ; 6100   01C0
        B       L_6105                          ; 6101   0200 0002

L_6103:
        MVII    #$0001, R0                      ; 6103   02B8 0001
L_6105:
        MVO     R0,     G_018B                  ; 6105   0240 018B
        PULR    R7                              ; 6107   02B7

        DECLE   $009A,  $0010,  $00F5,  $0061   ; 6108   009A 0010 00F5 0061
        DECLE   $0000,  $0000,  $0000,  $0030   ; 610C   0000 0000 0000 0030
        DECLE   $0000,  $0010,  $0000,  $0003   ; 6110   0000 0010 0000 0003
        DECLE   $001E,  $0000,  $0000,  $0000   ; 6114   001E 0000 0000 0000
        DECLE   $0042,  $0010,  $0005,  $0062   ; 6118   0042 0010 0005 0062
        DECLE   $0000,  $0050,  $0000,  $0044   ; 611C   0000 0050 0000 0044
        DECLE   $0000,  $0000,  $00F0,  $0002   ; 6120   0000 0000 00F0 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6124   0000 0000 0000 0000
        DECLE   $0086,  $0058,  $0028,  $0062   ; 6128   0086 0058 0028 0062
        DECLE   $0000,  $0000,  $0000,  $0060   ; 612C   0000 0000 0000 0060
        DECLE   $00D0,  $0000,  $00F0,  $0002   ; 6130   00D0 0000 00F0 0002
        DECLE   $00A0,  $0000,  $0000,  $0000   ; 6134   00A0 0000 0000 0000
        DECLE   $0300,  $0000,  $0019,  $005D   ; 6138   0300 0000 0019 005D
        DECLE   $0002,  $0002,  $0000,  $0300   ; 613C   0002 0002 0000 0300
        DECLE   $0000,  $0036,  $005D,  $0002   ; 6140   0000 0036 005D 0002
        DECLE   $0006,  $0000,  $0300,  $0000   ; 6144   0006 0000 0300 0000
        DECLE   $0077,  $005D,  $0002,  $000A   ; 6148   0077 005D 0002 000A
        DECLE   $0000,  $0300,  $0000,  $0019   ; 614C   0000 0300 0000 0019
        DECLE   $005D,  $0002,  $000E,  $0000   ; 6150   005D 0002 000E 0000
        DECLE   $0300,  $0000,  $0036,  $005D   ; 6154   0300 0000 0036 005D
        DECLE   $0002,  $0012,  $0000,  $0300   ; 6158   0002 0012 0000 0300
        DECLE   $0000,  $0077,  $005D,  $0002   ; 615C   0000 0077 005D 0002
        DECLE   $0016,  $0000                   ; 6160   0016 0000

        SUB     .STIC.X.0,R0                    ; 6162   0300 0000
        COMR    R1                              ; 6164   0019
        SLLC    R1,     2                       ; 6165   005D

        JSRD    R4,     .EXEC.800               ; 6166   0004 001A 0000
        DECLE   $0300,  $0000,  $0036,  $005D   ; 6169   0300 0000 0036 005D
        DECLE   $0004,  $0022,  $0000,  $0300   ; 616D   0004 0022 0000 0300
        DECLE   $0000,  $0077,  $005D,  $0004   ; 6171   0000 0077 005D 0004
        DECLE   $002A,  $0000,  $0300,  $0000   ; 6175   002A 0000 0300 0000
        DECLE   $0019,  $005D,  $0008,  $0058   ; 6179   0019 005D 0008 0058
        DECLE   $0000,  $0300,  $0000,  $0036   ; 617D   0000 0300 0000 0036
        DECLE   $005D,  $0008,  $0068,  $0000   ; 6181   005D 0008 0068 0000
        DECLE   $0300,  $0000,  $0077,  $005D   ; 6185   0300 0000 0077 005D
        DECLE   $0008,  $0078,  $0000,  $0300   ; 6189   0008 0078 0000 0300
        DECLE   $0000,  $0019,  $005D,  $0008   ; 618D   0000 0019 005D 0008
        DECLE   $0088,  $0000,  $0300,  $0000   ; 6191   0088 0000 0300 0000
        DECLE   $0036,  $005D,  $0008,  $00A8   ; 6195   0036 005D 0008 00A8
        DECLE   $0000,  $0300,  $0000,  $0077   ; 6199   0000 0300 0000 0077
        DECLE   $005D,  $0008,  $0098,  $0000   ; 619D   005D 0008 0098 0000
        DECLE   $0300,  $0000,  $0019,  $005D   ; 61A1   0300 0000 0019 005D
        DECLE   $0004,  $0032,  $0000,  $0300   ; 61A5   0004 0032 0000 0300
        DECLE   $0000,  $0036,  $005D,  $0004   ; 61A9   0000 0036 005D 0004
        DECLE   $003A,  $0000,  $0300,  $0000   ; 61AD   003A 0000 0300 0000
        DECLE   $0077,  $005D,  $0004,  $0042   ; 61B1   0077 005D 0004 0042
        DECLE   $0000,  $0100,  $0000,  $00F7   ; 61B5   0000 0100 0000 00F7
        DECLE   $005D,  $0008,  $00C8,  $0002   ; 61B9   005D 0008 00C8 0002
        DECLE   $0073,  $015B,  $0100,  $0000   ; 61BD   0073 015B 0100 0000
        DECLE   $00F7,  $005D,  $0008,  $00B8   ; 61C1   00F7 005D 0008 00B8
        DECLE   $0002,  $0073,  $015B,  $0300   ; 61C5   0002 0073 015B 0300
        DECLE   $0000,  $00F7,  $005D,  $0002   ; 61C9   0000 00F7 005D 0002
        DECLE   $004E,  $0002,  $0074,  $005C   ; 61CD   004E 0002 0074 005C
        DECLE   $0300,  $0000,  $00F7,  $005D   ; 61D1   0300 0000 00F7 005D
        DECLE   $0002,  $004E,  $0002,  $0074   ; 61D5   0002 004E 0002 0074
        DECLE   $005C,  $0300,  $0000,  $00F7   ; 61D9   005C 0300 0000 00F7
        DECLE   $005D,  $0002,  $004A,  $0002   ; 61DD   005D 0002 004A 0002
        DECLE   $0074,  $005C,  $0300,  $0000   ; 61E1   0074 005C 0300 0000
        DECLE   $00F7,  $005D,  $0001,  $0052   ; 61E5   00F7 005D 0001 0052
        DECLE   $0002,  $00F1,  $005C,  $0100   ; 61E9   0002 00F1 005C 0100
        DECLE   $0000,  $0094,  $005F,  $0001   ; 61ED   0000 0094 005F 0001
        DECLE   $0054,  $0002,  $02B9,  $015C   ; 61F1   0054 0002 02B9 015C
        DECLE   $0300,  $0000,  $0098,  $005F   ; 61F5   0300 0000 0098 005F
        DECLE   $0003,  $0055,  $0000,  $0100   ; 61F9   0003 0055 0000 0100
        DECLE   $0000                           ; 61FD   0000

        MOVR    R3,     R7                      ; 61FE   009F

        DECLE   $005F,  $0001,  $00C8,  $0002   ; 61FF   005F 0001 00C8 0002
        DECLE   $0047,  $005C,  $0300,  $0000   ; 6203   0047 005C 0300 0000
        DECLE   $0000,  $0000,  $0004,  $00D8   ; 6207   0000 0000 0004 00D8
        DECLE   $0000,  $0300,  $0000,  $0000   ; 620B   0000 0300 0000 0000
        DECLE   $0000,  $0004,  $00E0,  $0000   ; 620F   0000 0004 00E0 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6213   0300 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0300   ; 6217   0001 0000 0000 0300
        DECLE   $0000,  $00DC,  $005F,  $0000   ; 621B   0000 00DC 005F 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 621F   0000 0000 0300 0000
        DECLE   $00E3,  $005F,  $0000,  $0000   ; 6223   00E3 005F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00D8   ; 6227   0000 0000 0000 00D8
        DECLE   $0060,  $0003,  $00E8,  $0002   ; 622B   0060 0003 00E8 0002
        DECLE   $00A4,  $005C,  $0002,  $0000   ; 622F   00A4 005C 0002 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6233   0020 0000 0000 0000
        DECLE   $0080,  $0004,  $0000,  $0000   ; 6237   0080 0004 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0008   ; 623B   0001 0000 0000 0008
        DECLE   $0040,  $0002,  $0000,  $0008   ; 623F   0040 0002 0000 0008
        DECLE   $001C,  $0000,  $003E,  $0014   ; 6243   001C 0000 003E 0014
        DECLE   $0000,  $0000,  $0014,  $0014   ; 6247   0000 0000 0014 0014
        DECLE   $0034,  $003C,  $0004,  $0020   ; 624B   0034 003C 0004 0020
        DECLE   $0044,  $0006,  $0008,  $001C   ; 624F   0044 0006 0008 001C
        DECLE   $0000,  $003E,  $0028,  $0000   ; 6253   0000 003E 0028 0000
        DECLE   $0000,  $0028,  $0028,  $0028   ; 6257   0000 0028 0028 0028
        DECLE   $003C,  $003C,  $0020,  $0004   ; 625B   003C 003C 0020 0004
        DECLE   $0022,  $0060,  $0000,  $0000   ; 625F   0022 0060 0000 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 6263   0000 0000 003C 003C
        DECLE   $003C,  $0018,  $0000,  $0040   ; 6267   003C 0018 0000 0040
        DECLE   $0002,  $0002,  $0020,  $0004   ; 626B   0002 0002 0020 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 626F   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $003C,  $003C   ; 6273   0000 003C 003C 003C
        DECLE   $0018,  $0000,  $0000,  $0002   ; 6277   0018 0000 0000 0002
        DECLE   $0040,  $0040,  $0004,  $0020   ; 627B   0040 0040 0004 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 627F   0000 0000 0000 0000
        DECLE   $001C,  $001C,  $001C,  $0000   ; 6283   001C 001C 001C 0000
        DECLE   $0000,  $0000,  $007E,  $003E   ; 6287   0000 0000 007E 003E
        DECLE   $003C,  $003C,  $0000,  $0000   ; 628B   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 628F   0000 0000 0000 001C
        DECLE   $001C,  $001C,  $0000,  $0000   ; 6293   001C 001C 0000 0000
        DECLE   $0000,  $007E,  $007E,  $007C   ; 6297   0000 007E 007E 007C
        DECLE   $003C,  $0000,  $0000,  $0000   ; 629B   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 629F   0000 0000 0000 0008
        DECLE   $001C,  $0000,  $003E,  $001C   ; 62A3   001C 0000 003E 001C
        DECLE   $001C,  $0022,  $0014,  $0008   ; 62A7   001C 0022 0014 0008
        DECLE   $0014,  $003C,  $0004,  $0020   ; 62AB   0014 003C 0004 0020
        DECLE   $0044,  $0006,  $0008,  $001C   ; 62AF   0044 0006 0008 001C
        DECLE   $0000,  $003E,  $001C,  $001C   ; 62B3   0000 003E 001C 001C
        DECLE   $0022,  $0014,  $0008,  $0014   ; 62B7   0022 0014 0008 0014
        DECLE   $003C,  $003C,  $0020,  $0004   ; 62BB   003C 003C 0020 0004
        DECLE   $0022,  $0060,  $0000,  $0000   ; 62BF   0022 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 62C7   0000 0000 0000 0040
        DECLE   $0002,  $0002,  $0020,  $0004   ; 62CB   0002 0002 0020 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $001C   ; 62D3   0000 0000 001C 001C
        DECLE   $0000,  $0000,  $0002,  $0040   ; 62D7   0000 0000 0002 0040
        DECLE   $0040,  $0000,  $0004,  $0020   ; 62DB   0040 0000 0004 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DF   0000 0000 0000 0000
        DECLE   $001C,  $001C,  $001C,  $0000   ; 62E3   001C 001C 001C 0000
        DECLE   $003C,  $007E,  $007E,  $003E   ; 62E7   003C 007E 007E 003E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 62EB   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 62EF   0000 0000 0000 001C
        DECLE   $001C,  $001C,  $0000,  $003C   ; 62F3   001C 001C 0000 003C
        DECLE   $003E,  $007E,  $007C,  $003C   ; 62F7   003E 007E 007C 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 62FF   0000 0000 0018 003C
        DECLE   $0000,  $007E,  $0034,  $0020   ; 6303   0000 007E 0034 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6307   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $0034,  $0020   ; 630B   003C 003C 0034 0020
        DECLE   $0044,  $0066,  $0000,  $0018   ; 630F   0044 0066 0000 0018
        DECLE   $003C,  $0000,  $007E,  $0034   ; 6313   003C 0000 007E 0034
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6317   0020 0000 0000 0000
        DECLE   $0000,  $013C,  $003C,  $0064   ; 631B   0000 013C 003C 0064
        DECLE   $0048,  $000C,  $0018,  $003C   ; 631F   0048 000C 0018 003C
        DECLE   $0000,  $007E,  $0034,  $0020   ; 6323   0000 007E 0034 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6327   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $001C,  $0028   ; 632B   003C 003C 001C 0028
        DECLE   $0030,  $0018,  $0018,  $003C   ; 632F   0030 0018 0018 003C
        DECLE   $0000,  $007E,  $0034,  $0020   ; 6333   0000 007E 0034 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6337   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $002C,  $0000   ; 633B   0000 0038 002C 0000
        DECLE   $0026,  $0030,  $0000,  $0000   ; 633F   0026 0030 0000 0000
        DECLE   $0000,  $0000,  $0038,  $003C   ; 6343   0000 0000 0038 003C
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6347   0038 0000 0000 0000
        DECLE   $0030,  $0000,  $0000,  $0004   ; 634B   0030 0000 0000 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 634F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6353   0000 0000 0000 0038
        DECLE   $003C,  $0038,  $0000,  $0040   ; 6357   003C 0038 0000 0040
        DECLE   $0062,  $0000,  $0000,  $0040   ; 635B   0062 0000 0000 0040
        DECLE   $0008,  $0000,  $0000,  $0000   ; 635F   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $003C   ; 6363   0000 0000 0038 003C
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6367   0038 0000 0000 0000
        DECLE   $0018,  $0000,  $0004,  $0000   ; 636B   0018 0000 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $003C   ; 6373   0000 0000 0038 003C
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6377   0038 0000 0000 0000
        DECLE   $000C,  $0000,  $0000,  $0024   ; 637B   000C 0000 0000 0024
        DECLE   $0000,  $0000,  $0000,  $003C   ; 637F   0000 0000 0000 003C
        DECLE   $003C,  $003C,  $0000,  $0000   ; 6383   003C 003C 0000 0000
        DECLE   $0000,  $0078,  $007C,  $007C   ; 6387   0000 0078 007C 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 638B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 638F   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $003C,  $0000   ; 6393   003C 003C 003C 0000
        DECLE   $0000,  $0000,  $0078,  $0078   ; 6397   0000 0000 0078 0078
        DECLE   $007C,  $0000,  $0000,  $0000   ; 639B   007C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 639F   0000 0000 0000 003C
        DECLE   $003C,  $003C,  $0000,  $0000   ; 63A3   003C 003C 0000 0000
        DECLE   $0000,  $0078,  $007C,  $007C   ; 63A7   0000 0078 007C 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 63AF   0000 0000 0000 003C
        DECLE   $003C,  $003C,  $0000,  $0000   ; 63B3   003C 003C 0000 0000
        DECLE   $0000,  $0078,  $0078,  $0078   ; 63B7   0000 0078 0078 0078
        DECLE   $0030,  $0000,  $0000,  $0000   ; 63BB   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 63BF   0000 0000 0008 001C
        DECLE   $0000,  $003E,  $0014,  $0000   ; 63C3   0000 003E 0014 0000
        DECLE   $0020,  $0024,  $0024,  $0024   ; 63C7   0020 0024 0024 0024
        DECLE   $003C,  $003C,  $0024,  $0000   ; 63CB   003C 003C 0024 0000
        DECLE   $0006,  $0060,  $0000,  $0038   ; 63CF   0006 0060 0000 0038
        DECLE   $0000,  $007C,  $0028,  $0000   ; 63D3   0000 007C 0028 0000
        DECLE   $0024,  $0024,  $0024,  $003C   ; 63D7   0024 0024 0024 003C
        DECLE   $003C,  $003C,  $00A5,  $00C3   ; 63DB   003C 003C 00A5 00C3
        DECLE   $0042,  $0000,  $0000,  $0000   ; 63DF   0042 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $0000   ; 63E3   0000 0000 003C 0000
        DECLE   $0000,  $0024,  $0024,  $003C   ; 63E7   0000 0024 0024 003C
        DECLE   $003C,  $00BD,  $00DB,  $0042   ; 63EB   003C 00BD 00DB 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63F7   0000 0000 0000 0000
        DECLE   $0024,  $0018,  $00BC,  $00BD   ; 63FB   0024 0018 00BC 00BD
        DECLE   $00DB,  $0042,  $0000,  $0000   ; 63FF   00DB 0042 0000 0000
        DECLE   $0000,  $0000,  $0038,  $0038   ; 6403   0000 0000 0038 0038
        DECLE   $0038,  $0000,  $0000,  $0082   ; 6407   0038 0000 0000 0082
        DECLE   $0082,  $0000,  $0000,  $0024   ; 640B   0082 0000 0000 0024
        DECLE   $0024,  $0000,  $0000,  $0000   ; 640F   0024 0000 0000 0000
        DECLE   $0000,  $0038,  $0038,  $0038   ; 6413   0000 0038 0038 0038
        DECLE   $0080,  $0081,  $0001,  $0000   ; 6417   0080 0081 0001 0000
        DECLE   $0000,  $0000,  $0044,  $0000   ; 641B   0000 0000 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $0038   ; 6423   0000 0000 0038 0038
        DECLE   $0038,  $0038,  $0000,  $00C3   ; 6427   0038 0038 0000 00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6433   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6437   0000 0000 0000 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 643B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 643F   0000 0000 0000 001C
        DECLE   $001C,  $0000,  $0000,  $0000   ; 6443   001C 0000 0000 0000
        DECLE   $0000,  $003C,  $005A,  $001A   ; 6447   0000 003C 005A 001A
        DECLE   $0018,  $0000,  $0000,  $0000   ; 644B   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 644F   0000 0000 0000 0038
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6453   0038 0000 0000 0000
        DECLE   $003E,  $001C,  $001C,  $001C   ; 6457   003E 001C 001C 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 645B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 645F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6463   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $003C,  $003C   ; 6467   0000 003C 003C 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6473   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6477   0000 0000 0000 0000
        DECLE   $003E,  $0022,  $0000,  $0000   ; 647B   003E 0022 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0075   ; 647F   0000 0000 0000 0075
        DECLE   $00FE,  $00FA,  $00FF,  $00FF   ; 6483   00FE 00FA 00FF 00FF
        DECLE   $00FF,  $00FC,  $007C,  $0058   ; 6487   00FF 00FC 007C 0058
        DECLE   $0070,  $0028,  $0000,  $0000   ; 648B   0070 0028 0000 0000
        DECLE   $0000,  $0000,  $000A,  $007E   ; 648F   0000 0000 000A 007E
        DECLE   $00FA,  $00FF                   ; 6493   00FA 00FF

        ADDR    R7,     R4                      ; 6495   00FC
        ADDR    R7,     R6                      ; 6496   00FE
        SAR     R0,     2                       ; 6497   006C
        ADDR    R7,     R4                      ; 6498   00FC
        ADDR    R1,     R6                      ; 6499   00CE
        MOVR    R0,     R7                      ; 649A   0087

        DECLE   $0005,  $0000,  $0000,  $0000   ; 649B   0005 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 649F   0000 0000 0000 0010
        DECLE   $003C,  $007E,  $007E,  $007E   ; 64A3   003C 007E 007E 007E
        DECLE   $007E,  $0066,  $003C,  $005A   ; 64A7   007E 0066 003C 005A
        DECLE   $003C,  $002C,  $005A,  $0042   ; 64AB   003C 002C 005A 0042
        DECLE   $0040,  $0042,  $0000,  $0000   ; 64AF   0040 0042 0000 0000
        DECLE   $003C,  $007E,  $007E,  $007E   ; 64B3   003C 007E 007E 007E
        DECLE   $0026,  $00BD,  $005A,  $007E   ; 64B7   0026 00BD 005A 007E
        DECLE   $003C,  $00EC,  $005A,  $0000   ; 64BB   003C 00EC 005A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64BF   0000 0000 0000 0000
        DECLE   $0000                           ; 64C3   0000

        RSWD    R6                              ; 64C4   003E
        RRC     R2,     2                       ; 64C5   0076
        ADDR    R5,     R1                      ; 64C6   00E9
        ADDR    R5,     R7                      ; 64C7   00EF

        DECLE   $00FF,  $00F5,  $00FF,  $00FF   ; 64C8   00FF 00F5 00FF 00FF
        DECLE   $00F6,  $006C,  $0000,  $0000   ; 64CC   00F6 006C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 64D4   0000 0000 0018 0018
        DECLE   $0018,  $00F3,  $00F0,  $00E6   ; 64D8   0018 00F3 00F0 00E6
        DECLE   $00C0,  $0008,  $0000,  $0020   ; 64DC   00C0 0008 0000 0020
        DECLE   $0000,  $00F6,  $00F0,  $00EC   ; 64E0   0000 00F6 00F0 00EC
        DECLE   $00C0,  $0008,  $0044,  $0000   ; 64E4   00C0 0008 0044 0000
        DECLE   $0000,  $00F5,  $00F0,  $00E5   ; 64E8   0000 00F5 00F0 00E5
        DECLE   $00C0,  $0000,  $0044,  $0020   ; 64EC   00C0 0000 0044 0020
        DECLE   $0000,  $007C,  $0028,  $0000   ; 64F0   0000 007C 0028 0000
        DECLE   $0010,  $0024,  $0024,  $0024   ; 64F4   0010 0024 0024 0024
        DECLE   $003C,  $003C,  $0024,  $0000   ; 64F8   003C 003C 0024 0000
        DECLE   $0024,  $0000,  $0000,  $0000   ; 64FC   0024 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 6500   0000 0000 0010 0038
        DECLE   $0000,  $007C,  $0028,  $0028   ; 6504   0000 007C 0028 0028
        DECLE   $0000,  $0010,  $0010,  $0004   ; 6508   0000 0010 0010 0004
        DECLE   $0024,  $003C,  $0000,  $0000   ; 650C   0024 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6510   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 6514   0000 0000 0000 0010
        DECLE   $0038,  $0000,  $007C,  $0028   ; 6518   0038 0000 007C 0028
        DECLE   $0000,  $0010,  $0000,  $0024   ; 651C   0000 0010 0000 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6520   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6524   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6528   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $0000,  $0000   ; 652C   0018 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6530   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6534   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6538   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 653C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0066   ; 6540   0000 0000 0000 0066
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6544   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6548   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 654C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 6550   0000 0000 0000 0024
        DECLE   $0000,  $0024,  $0066,  $0000   ; 6554   0000 0024 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6558   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 655C   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0024,  $0024   ; 6560   0000 0024 0024 0024
        DECLE   $003C,  $003C,  $0024,  $0000   ; 6564   003C 003C 0024 0000
        DECLE   $0024,  $0066,  $0000,  $0000   ; 6568   0024 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 656C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6570   0000 0000 0000 003C
        DECLE   $003C,  $00BD,  $00BD,  $0000   ; 6574   003C 00BD 00BD 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6578   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 657C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6580   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6584   0000 0000 0000 003C
        DECLE   $00BC,  $00BD,  $0030,  $003C   ; 6588   00BC 00BD 0030 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 658C   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6590   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6594   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6598   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $003D,  $0081   ; 659C   003C 003C 003D 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D0   0000 0000 0000 0000
        DECLE   $0004,  $0024,  $0000,  $0000   ; 65D4   0004 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E4   0000 0000 0000 0000
        DECLE   $0024,  $0024,  $0000,  $0000   ; 65E8   0024 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007F,  $007F   ; 65F4   0000 0000 007F 007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6600   0000 0000 0000 0000
        DECLE   $001E,  $0000,  $0000,  $0000   ; 6604   001E 0000 0000 0000
        DECLE   $0000,  $0000,  $0041,  $0075   ; 6608   0000 0000 0041 0075
        DECLE   $001E,  $0000,  $0000,  $0000   ; 660C   001E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6610   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6614   0000 0000 0000 0000
        DECLE   $0000,  $0034,  $0000,  $0000   ; 6618   0000 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 661C   0000 0000 0000 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6620   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6624   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6628   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6630   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6634   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6638   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6640   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6644   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6648   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 664C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6650   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6654   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6658   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665C   0000 0000 0000 0000
        DECLE   $0000,  $003E,  $003E,  $003E   ; 6660   0000 003E 003E 003E
        DECLE   $003E,  $0000,  $0000,  $0000   ; 6664   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6668   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 666C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0068,  $0044   ; 6670   0000 0000 0068 0044
        DECLE   $0004,  $0000,  $0000,  $0001   ; 6674   0004 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6678   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0008   ; 6680   0000 0000 0010 0008
        DECLE   $0004,  $0000,  $0000,  $0002   ; 6684   0004 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6688   0000 0000 0000 0000
        DECLE   $0024,  $0030,  $0000,  $0000   ; 668C   0024 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6690   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6694   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C3,  $0081   ; 6698   0000 0000 00C3 0081
        DECLE   $0000,  $0000,  $0040,  $0040   ; 669C   0000 0000 0040 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A0   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0040   ; 66A4   0000 0040 0040 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A8   0000 0000 0000 0000
        DECLE   $00C0,  $00C2,  $0002,  $0004   ; 66AC   00C0 00C2 0002 0004
        DECLE   $0000,  $0010,  $0018,  $0010   ; 66B0   0000 0010 0018 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B4   0000 0000 0000 0000
        DECLE   $00C0,  $0080,  $0080,  $0080   ; 66B8   00C0 0080 0080 0080
        DECLE   $0080,  $0080,  $0050,  $0030   ; 66BC   0080 0080 0050 0030
        DECLE   $0000,  $0008,  $0008,  $0080   ; 66C0   0000 0008 0008 0080
        DECLE   $00C0,  $00C0,  $0000,  $0080   ; 66C4   00C0 00C0 0000 0080
        DECLE   $0080,  $0080,  $0000,  $0080   ; 66C8   0080 0080 0000 0080
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 66CC   00C0 0000 0000 0000
        DECLE   $0000,  $0020,  $0060,  $0000   ; 66D0   0000 0020 0060 0000
        DECLE   $0005,  $0000,  $0083,  $0080   ; 66D4   0005 0000 0083 0080
        DECLE   $0041,  $0000,  $0000,  $0000   ; 66D8   0041 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0020   ; 66E0   0000 0000 0010 0020
        DECLE   $0040,  $0000,  $0000,  $0001   ; 66E4   0040 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 66F4   0000 0000 0000 0002
        DECLE   $0006,  $0004,  $0001,  $0001   ; 66F8   0006 0004 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 66FC   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6700   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6704   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6708   0000 0000 0000 0000
        DECLE   $0002,  $0003,  $0001,  $001E   ; 670C   0002 0003 0001 001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6710   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6714   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6718   0000 0000 0000 0000
        DECLE   $0048,  $0058,  $0048,  $0048   ; 671C   0048 0058 0048 0048
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6720   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 6724   0000 0000 0000 0040
        DECLE   $0040,  $0040,  $0050,  $0018   ; 6728   0040 0040 0050 0018
        DECLE   $0020,  $0000,  $0000,  $0000   ; 672C   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6730   0000 0000 0000 0018
        DECLE   $0030,  $0020,  $0040,  $0050   ; 6734   0030 0020 0040 0050
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6738   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6740   0000 0000 0000 001C
        DECLE   $0002,  $0000,  $001C,  $0008   ; 6744   0002 0000 001C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6748   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 674C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6750   0000 0000 0000 001C
        DECLE   $0018,  $0009,  $0001,  $0001   ; 6754   0018 0009 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6758   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 6760   0000 0000 0000 0006
        DECLE   $0004,  $0006,  $0004,  $0001   ; 6764   0004 0006 0004 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 6768   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0002   ; 6770   0000 0000 0004 0002
        DECLE   $0002,  $0001,  $0000,  $0000   ; 6774   0002 0001 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0002   ; 6778   0000 0001 0001 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 677C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6780   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6784   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000,  $006C   ; 6788   0002 0000 0000 006C
        DECLE   $0020,  $0000,  $0000,  $0000   ; 678C   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6790   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6794   0000 0000 0000 0080
        DECLE   $0080,  $00C0,  $0000,  $0000   ; 6798   0080 00C0 0000 0000
        DECLE   $0000,  $0020,  $0070,  $0000   ; 679C   0000 0020 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A0   0000 0000 0000 0000
        DECLE   $0060,  $0000,  $0000,  $0080   ; 67A4   0060 0000 0000 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 67A8   0080 0080 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 67AC   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0040   ; 67B0   0000 0000 0018 0040
        DECLE   $00C0,  $00C0,  $0080,  $0000   ; 67B4   00C0 00C0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BC   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0020,  $00E2   ; 67C0   0000 0024 0020 00E2
        DECLE   $0002,  $0000,  $0000,  $0000   ; 67C4   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CC   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $000C,  $0004   ; 67D0   0000 000C 000C 0004
        DECLE   $0000,  $0000,  $0001,  $0001   ; 67D4   0000 0000 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 67D8   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DC   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0002,  $0002   ; 67E0   0000 0006 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0001   ; 67E4   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 67E8   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EC   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $007C,  $00FC   ; 67F0   0000 0038 007C 00FC
        DECLE   $00EE,  $00FE,  $00FF,  $00FF   ; 67F4   00EE 00FE 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FE,  $007E   ; 67F8   00FF 00FE 00FE 007E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 67FC   003C 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $007C   ; 6800   0000 0018 003C 007C
        DECLE   $00FE,  $00FA,  $00FE,  $00FF   ; 6804   00FE 00FA 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007E   ; 6808   00FF 00FF 00FF 007E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 680C   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6810   0000 0000 0000 0000
        DECLE   $001C,  $003E,  $003E,  $007F   ; 6814   001C 003E 003E 007F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6818   007F 00FF 00FF 00FF
        DECLE   $00FD,  $00FF,  $0077,  $007A   ; 681C   00FD 00FF 0077 007A
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6820   0030 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $007E   ; 6824   0000 003C 007E 007E
        DECLE   $00FE,  $00FF,  $00FF,  $007F   ; 6828   00FE 00FF 00FF 007F
        DECLE   $00FF                           ; 682C   00FF

        SLLC    R3,     2                       ; 682D   005F
        MOVR    R5,     R7                      ; 682E   00AF

        DECLE   $004E,  $0004,  $0000,  $0000   ; 682F   004E 0004 0000 0000
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 6833   003C 007E 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6837   00FF 00FF 00FF 00FF
        DECLE   $00BF,  $00FF,  $00FE,  $007E   ; 683B   00BF 00FF 00FE 007E
        DECLE   $0038,  $0000,  $0000,  $001C   ; 683F   0038 0000 0000 001C
        DECLE   $003E,  $007E,  $00FF,  $00FF   ; 6843   003E 007E 00FF 00FF
        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; 6847   00BF 00FF 00FF 00FF
        DECLE   $00FE,  $00FC,  $0038,  $0000   ; 684B   00FE 00FC 0038 0000
        DECLE   $0000,  $0000,  $000C,  $003E   ; 684F   0000 0000 000C 003E
        DECLE   $007F,  $007F,  $005F,  $00FF   ; 6853   007F 007F 005F 00FF
        DECLE   $00FF,  $00FE,  $00FE,  $00FE   ; 6857   00FF 00FE 00FE 00FE
        DECLE   $00FE,  $007C,  $0070,  $0000   ; 685B   00FE 007C 0070 0000
        DECLE   $0000,  $0000,  $003C,  $006E   ; 685F   0000 0000 003C 006E
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 6863   007E 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6867   00FF 00FF 00FF 007F
        DECLE   $007E,  $0038,  $0000,  $0000   ; 686B   007E 0038 0000 0000
        DECLE   $0000,  $0000,  $0038,  $007C   ; 686F   0000 0000 0038 007C
        DECLE   $00FC,  $00FE,  $00FE,  $00FF   ; 6873   00FC 00FE 00FE 00FF
        DECLE   $00BF,  $007F,  $00FE,  $00E6   ; 6877   00BF 007F 00FE 00E6
        DECLE   $006A,  $003C,  $0000,  $0000   ; 687B   006A 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 687F   0000 0000 0000 003C
        DECLE   $007E,  $00FE,  $00FF,  $00FF   ; 6883   007E 00FE 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6887   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $003F,  $007E,  $001C   ; 688B   00FF 003F 007E 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 688F   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $003E,  $003E   ; 6893   0000 001C 003E 003E
        DECLE   $007D,  $007F,  $00FF,  $00FF   ; 6897   007D 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 689B   00FF 00FF 00FF 007F
        DECLE   $004A,  $0020,  $0000,  $0000   ; 689F   004A 0020 0000 0000
        DECLE   $0000,  $0000,  $003C,  $007E   ; 68A3   0000 0000 003C 007E
        DECLE   $007E,  $00FE,  $00FF,  $00FF   ; 68A7   007E 00FE 00FF 00FF
        DECLE   $00FF                           ; 68AB   00FF

        ADDR    R7,     R5                      ; 68AC   00FD
        ADDR    R3,     R7                      ; 68AD   00DF

        DECLE   $00AB,  $0046,  $0020,  $0000   ; 68AE   00AB 0046 0020 0000
        DECLE   $0000,  $003C,  $007E,  $00FF   ; 68B2   0000 003C 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; 68B6   00FF 00FF 00FF 00FE
        DECLE   $00BF,  $00FF,  $007F,  $00FD   ; 68BA   00BF 00FF 007F 00FD
        DECLE   $007E,  $0038,  $0000,  $0000   ; 68BE   007E 0038 0000 0000
        DECLE   $001C,  $003E,  $007E,  $00FF   ; 68C2   001C 003E 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 68C6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FC,  $0038   ; 68CA   00FF 00FE 00FC 0038
        DECLE   $0000,  $0000,  $0000,  $000C   ; 68CE   0000 0000 0000 000C
        DECLE   $0036,  $006B,  $007F,  $007F   ; 68D2   0036 006B 007F 007F
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; 68D6   00FF 00FF 00FE 00FE
        DECLE   $00FE,  $00FE,  $007C,  $0070   ; 68DA   00FE 00FE 007C 0070
        DECLE   $0000,  $0000,  $0000,  $003C   ; 68DE   0000 0000 0000 003C
        DECLE   $007E,  $003E,  $00F7           ; 68E2   007E 003E 00F7

        ADDR    R7,     R3                      ; 68E5   00FB
        ADDR    R4,     R7                      ; 68E6   00E7

        DECLE   $00DB,  $00FF,  $00FF,  $007F   ; 68E7   00DB 00FF 00FF 007F
        DECLE   $007E,  $0038,  $0000,  $0000   ; 68EB   007E 0038 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00C6   ; 68EF   0000 0000 0080 00C6
        DECLE   $00FE,  $00FF,  $00FF,  $00FE   ; 68F3   00FE 00FF 00FF 00FE
        DECLE   $00FE,  $00F8,  $00C0,  $0080   ; 68F7   00FE 00F8 00C0 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 68FB   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $00F0   ; 68FF   0080 0080 0080 00F0
        DECLE   $00FC,  $00FC,  $00FE,  $00FE   ; 6903   00FC 00FC 00FE 00FE
        DECLE   $00F8,  $00F8,  $00B0,  $0080   ; 6907   00F8 00F8 00B0 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 690B   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $00F9   ; 690F   0080 0080 0080 00F9
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; 6913   00FF 00FF 00FE 00FE
        DECLE   $00FE,  $00FC,  $0098,  $0080   ; 6917   00FE 00FC 0098 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 691B   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $009C   ; 691F   0080 0080 0080 009C
        DECLE   $00FC,  $00FF,  $00FE,  $00FE   ; 6923   00FC 00FF 00FE 00FE
        DECLE   $00FE,  $00F6,  $0086,  $0080   ; 6927   00FE 00F6 0086 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 692B   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0000,  $0000   ; 692F   0080 0080 0000 0000
        DECLE   $0000,  $00FF,  $0081,  $00FF   ; 6933   0000 00FF 0081 00FF
        DECLE   $00FF,  $0081,  $00FF,  $00FF   ; 6937   00FF 0081 00FF 00FF
        DECLE   $0081,  $00FF,  $00FF,  $0059   ; 693B   0081 00FF 00FF 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693F   0000 0000 0000 0000
        DECLE   $007E,  $0081,  $00FF,  $00FF   ; 6943   007E 0081 00FF 00FF
        DECLE   $0081,  $00FF,  $00FF,  $0081   ; 6947   0081 00FF 00FF 0081
        DECLE   $00FF,  $00FF,  $00BA,  $0000   ; 694B   00FF 00FF 00BA 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694F   0000 0000 0000 0000
        DECLE   $00FF,  $0081,  $00FF,  $00FF   ; 6953   00FF 0081 00FF 00FF
        DECLE   $0081,  $00FF,  $00FF,  $0081   ; 6957   0081 00FF 00FF 0081
        DECLE   $00FF,  $007F,  $00AD,  $0000   ; 695B   00FF 007F 00AD 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695F   0000 0000 0000 0000
        DECLE   $00FF,  $0081,  $00FF,  $00FF   ; 6963   00FF 0081 00FF 00FF
        DECLE   $0081,  $00FF,  $00FF,  $0081   ; 6967   0081 00FF 00FF 0081
        DECLE   $00FF,  $00FE,  $00A9,  $0000   ; 696B   00FF 00FE 00A9 0000
        DECLE   $0000,  $0000,  $0048,  $0014   ; 696F   0000 0000 0048 0014
        DECLE   $0040,  $00A8,  $0012,  $0048   ; 6973   0040 00A8 0012 0048
        DECLE   $0002,  $0010,  $0028,  $0000   ; 6977   0002 0010 0028 0000

        RLC     R0,     2                       ; 697B   0054
        MOVR    R1,     R0                      ; 697C   0088
        NEGR    R2                              ; 697D   0022
        INCR    R0                              ; 697E   0008
        SWAP    R1,     1                       ; 697F   0041
        INCR    R0                              ; 6980   0008

        JSR     R4,     .EXEC.045               ; 6981   0004 0010 0045
        DECLE   $0028,  $0004,  $0050,  $0028   ; 6984   0028 0004 0050 0028
        DECLE   $0005                           ; 6988   0005
.GFX_LIST_6989:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6989  CART PIC #00
        DECLE   $0080,  $0080,  $00C0,  $00E4   ; 698D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6991  CART PIC #01
        DECLE   $0001,  $0001,  $0003,  $0097   ; 6995  
        DECLE   $0000,  $0000,  $0000,  $001F   ; 6999  CART PIC #02
        DECLE   $003F,  $007F,  $007F,  $00FF   ; 699D  
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 69A1  CART PIC #03
        DECLE   $00FC,  $00FE,  $00FE,  $00FF   ; 69A5  
        DECLE   $00FF,  $00FF,  $007F,  $0000   ; 69A9  CART PIC #04
        DECLE   $0000,  $0000,  $0000,  $0048   ; 69AD  
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 69B1  CART PIC #05
        DECLE   $0000,  $0000,  $0000,  $0042   ; 69B5  
        DECLE   $00FF,  $00FF,  $00FE,  $0000   ; 69B9  CART PIC #06
        DECLE   $0000,  $0000,  $0000,  $0048   ; 69BD  
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 69C1  CART PIC #07
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C5  
        DECLE   $00CB,  $00E5,  $0021,  $000C   ; 69C9  CART PIC #08
        DECLE   $0093,  $004D,  $00C2,  $00ED   ; 69CD  
        DECLE   $0058,  $0020,  $0002,  $000D   ; 69D1  CART PIC #09
        DECLE   $005F,  $002D,  $00A9,  $0000   ; 69D5  
        DECLE   $00FF,  $00FF,  $00FF,  $00FD   ; 69D9  CART PIC #0A
        DECLE   $0072,  $000A,  $00A9,  $0037   ; 69DD  
        DECLE   $00FF,  $00F9,  $00FB,  $00E7   ; 69E1  CART PIC #0B
        DECLE   $00FF,  $00FF,  $00CF,  $00BF   ; 69E5  
        DECLE   $0000,  $0000,  $0000,  $0018   ; 69E9  CART PIC #0C
        DECLE   $0000,  $0003,  $0080,  $0000   ; 69ED  
        DECLE   $00E0,  $00FE,  $00FF,  $00FF   ; 69F1  CART PIC #0D
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 69F5  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9  CART PIC #0E
        DECLE   $0000,  $0007,  $001F,  $00FF   ; 69FD  
        DECLE   $0001,  $0007,  $003F,  $003F   ; 6A01  CART PIC #0F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A05  
        DECLE   $0000,  $0000,  $0003,  $0007   ; 6A09  CART PIC #10
        DECLE   $001F,  $001F,  $007F,  $00FF   ; 6A0D  
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; 6A11  CART PIC #11
        DECLE   $00F0,  $00FC,  $00FE,  $00FF   ; 6A15  
        DECLE   $0007,  $005F,  $00FF,  $00BB   ; 6A19  CART PIC #12
        DECLE   $00EC,  $00FF,  $00FE,  $00FC   ; 6A1D  
        DECLE   $0000,  $0000,  $0000,  $0087   ; 6A21  CART PIC #13
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A25  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A29  CART PIC #14
        DECLE   $00FF,  $00C3,  $00DB,  $00C3   ; 6A2D  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A31  CART PIC #15
        DECLE   $00FF,  $0080,  $0000,  $0000   ; 6A35  
        DECLE   $0080,  $0080,  $00EF,  $00EF   ; 6A39  CART PIC #16
        DECLE   $0000,  $0004,  $0000,  $0000   ; 6A3D  
        DECLE   $0000,  $0000,  $00E0,  $0050   ; 6A41  CART PIC #17
        DECLE   $00AD,  $00E0,  $0016,  $0000   ; 6A45  
        DECLE   $00FF,  $00FF,  $003F,  $00C3   ; 6A49  CART PIC #18
        DECLE   $0000,  $0067,  $007F,  $001B   ; 6A4D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A51  CART PIC #19
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A55  
        DECLE   $007E,  $00FF,  $00FF,  $0081   ; 6A59  CART PIC #1A
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6A5D  
        DECLE   $0040,  $00A5,  $00FE,  $00FF   ; 6A61  CART PIC #1B
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A65  
        DECLE   $0000,  $0000,  $0001,  $0003   ; 6A69  CART PIC #1C
        DECLE   $0003,  $000B,  $002F,  $007F   ; 6A6D  
        DECLE   $00FE,  $00FD,  $00FE,  $00FA   ; 6A71  CART PIC #1D
        DECLE   $00EC,  $00B0,  $0080,  $0000   ; 6A75  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A79  CART PIC #1E
        DECLE   $00FF,  $00DD,  $006A,  $00A8   ; 6A7D  
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; 6A81  CART PIC #1F
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; 6A85  
        DECLE   $0000,  $007C,  $0044,  $007C   ; 6A89  CART PIC #20
        DECLE   $0044,  $007C,  $0000,  $0000   ; 6A8D  
        DECLE   $007C,  $007C,  $007C,  $007C   ; 6A91  CART PIC #21
        DECLE   $007C,  $007C,  $007C,  $007C   ; 6A95  
        DECLE   $00FF,  $00BD,  $00C3,  $0081   ; 6A99  CART PIC #22
        DECLE   $00A5,  $00C3,  $00E7,  $00FF   ; 6A9D  
        DECLE   $00FF,  $00FF,  $0055,  $0055   ; 6AA1  CART PIC #23
        DECLE   $00FF,  $0055,  $0055,  $00FF   ; 6AA5  
        DECLE   $0000,  $0012,  $0029,  $0049   ; 6AA9  CART PIC #24
        DECLE   $0051,  $0092,  $00CC,  $0000   ; 6AAD  
        DECLE   $00FF,  $00E7,  $00C3,  $0081   ; 6AB1  CART PIC #25
        DECLE   $0081,  $0081,  $00C3,  $00FF   ; 6AB5  
        DECLE   $00FF,  $00F7,  $00EF,  $0093   ; 6AB9  CART PIC #26
        DECLE   $0001,  $0001,  $0083,  $00FF   ; 6ABD  
        DECLE   $00F7,  $00EF,  $00AD,  $00D7   ; 6AC1  CART PIC #27
        DECLE   $0043,  $0081,  $00CB,  $00FF   ; 6AC5  
        DECLE   $00FF,  $00E7,  $00DB,  $00BD   ; 6AC9  CART PIC #28
        DECLE   $0042,  $005A,  $0000,  $00FF   ; 6ACD  
        DECLE   $0001,  $0014,  $0055,  $0055   ; 6AD1  CART PIC #29
        DECLE   $0024,  $0004,  $0020,  $0004   ; 6AD5  
        DECLE   $0020,  $000A,  $0080,  $0000   ; 6AD9  CART PIC #2A
        DECLE   $00A2,  $000A,  $0008,  $000A   ; 6ADD  
        DECLE   $00FF,  $00C0,  $00C0,  $0081   ; 6AE1  CART PIC #2B
        DECLE   $0081,  $0003,  $0003,  $00FF   ; 6AE5  
        DECLE   $0020,  $0000,  $0000,  $0080   ; 6AE9  CART PIC #2C
        DECLE   $0000,  $0004,  $0000,  $0000   ; 6AED  
        DECLE   $0004,  $0000,  $0000,  $0020   ; 6AF1   0004 0000 0000 0020
        DECLE   $0000,  $0001,  $0000,  $0000   ; 6AF5   0000 0001 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0008   ; 6AF9   0001 0000 0000 0008
        DECLE   $0000,  $0040,  $0000,  $0000   ; 6AFD   0000 0040 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0002   ; 6B01   0080 0000 0000 0002
        DECLE   $0000,  $0010,  $0000,  $0000   ; 6B05   0000 0010 0000 0000
        DECLE   $0004,  $0007,  $0001,  $0001   ; 6B09   0004 0007 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6B0D   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B15   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $001F           ; 6B19   0001 0001 001F

        DECR    R1                              ; 6B1C   0011
        DECR    R0                              ; 6B1D   0010
        DECR    R0                              ; 6B1E   0010
L_6B1F:
        DECR    R7                              ; 6B1F   0017

        DECLE   $001C,  $0000,  $0000,  $0000   ; 6B20   001C 0000 0000 0000
        DECLE   $00E0,  $0020,  $0020,  $00E0   ; 6B24   00E0 0020 0020 00E0
        DECLE   $0000,  $0010,  $0010,  $001F   ; 6B28   0000 0010 0010 001F
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6B2C   0000 0000 0001 0001
        DECLE   $0001,  $0000,  $000E,  $00CE   ; 6B30   0001 0000 000E 00CE
        DECLE   $0048,  $0048,  $00F8,  $0000   ; 6B34   0048 0048 00F8 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 6B38   0000 0001 0001 0001
        DECLE   $0001,  $0000,  $0003,  $0002   ; 6B3C   0001 0000 0003 0002
        DECLE   $001E,  $0000,  $00F0,  $0010   ; 6B40   001E 0000 00F0 0010
        DECLE   $00D0,  $0070,  $00C0,  $0000   ; 6B44   00D0 0070 00C0 0000
        DECLE   $0000                           ; 6B48   0000

        NEGR    R0                              ; 6B49   0020
        ADCR    R7                              ; 6B4A   002F

        ADCR    R0                              ; 6B4B   0028
L_6B4C:
        ADCR    R0                              ; 6B4C   0028
        DECLE   $0038,  $000F,  $0001,  $0001   ; 6B4D   0038 000F 0001 0001
        DECLE   $00F0,  $0080,  $0000,  $0000   ; 6B51   00F0 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B55   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $001F,  $0010   ; 6B59   0001 0001 001F 0010
        DECLE   $0010,  $0010,  $0030,  $0020   ; 6B5D   0010 0010 0030 0020
        DECLE   $0000,  $0000,  $00C0,  $007C   ; 6B61   0000 0000 00C0 007C
        DECLE   $0004,  $0004,  $0004,  $001C   ; 6B65   0004 0004 0004 001C
        DECLE   $0020,  $0020,  $0020,  $0020   ; 6B69   0020 0020 0020 0020
        DECLE   $0038,  $000F,  $0001,  $0001   ; 6B6D   0038 000F 0001 0001
        DECLE   $0070,  $001C,  $0004,  $0004   ; 6B71   0070 001C 0004 0004
        DECLE   $007C,  $0040,  $00C0,  $0000   ; 6B75   007C 0040 00C0 0000
        DECLE   $0001,  $0001,  $0007,  $0004   ; 6B79   0001 0001 0007 0004
        DECLE   $003C,  $0020,  $0020,  $0020   ; 6B7D   003C 0020 0020 0020
        DECLE   $0000,  $0000,  $00C0,  $0040   ; 6B81   0000 0000 00C0 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6B85   0040 0040 0040 0040
        DECLE   $00FF,  $00FF,  $00FD,  $00F9   ; 6B89   00FF 00FF 00FD 00F9
        DECLE   $00F1,  $00C1,  $0001,  $0001   ; 6B8D   00F1 00C1 0001 0001
        DECLE   $00FF,  $00FF,  $007F,  $001F   ; 6B91   00FF 00FF 007F 001F
        DECLE   $000F,  $0007,  $0001,  $0000   ; 6B95   000F 0007 0001 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B99   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B9D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BA1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BA5   00FF 00FF 00FF 00FF
        DECLE   $000E,  $00FE,  $00F8,  $0000   ; 6BA9   000E 00FE 00F8 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 6BAD   0000 0001 0001 0001
        DECLE   $0040,  $0040,  $0070,  $0010   ; 6BB1   0040 0040 0070 0010
        DECLE   $0010,  $00F0,  $0000,  $0000   ; 6BB5   0010 00F0 0000 0000
        DECLE   $0001                           ; 6BB9   0001

        INCR    R7                              ; 6BBA   000F

        INCR    R0                              ; 6BBB   0008
L_6BBC:
        INCR    R0                              ; 6BBC   0008
        DECLE   $000E,  $0002,  $0003,  $0007   ; 6BBD   000E 0002 0003 0007
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6BC1   0000 0000 0000 0001
        DECLE   $0003,  $001F                   ; 6BC5   0003 001F

        ADDR    R7,     R6                      ; 6BC7   00FE
        ADDR    R4,     R0                      ; 6BC8   00E0
L_6BC9:
        PSHR    R5                              ; 6BC9   0275
        CMPI    #$0003, R2                      ; 6BCA   037A 0003
        BNEQ    L_6C6A                          ; 6BCC   020C 009C

        MVI     G_0172, R0                      ; 6BCE   0280 0172
        TSTR    R0                              ; 6BD0   0080
        BNEQ    L_6BEA                          ; 6BD1   020C 0017

        CMP     G_015D, R0                      ; 6BD3   0340 015D
        BLT     L_6C12                          ; 6BD5   0205 003B

        MVII    #$00F0, R0                      ; 6BD7   02B8 00F0
        MVO     R0,     G_015D                  ; 6BD9   0240 015D
        MVI     G_015F, R0                      ; 6BDB   0280 015F
        MVO     R0,     G_0166                  ; 6BDD   0240 0166
        MVI     G_0167, R0                      ; 6BDF   0280 0167
        MVO     R0,     G_015F                  ; 6BE1   0240 015F
        MVI     G_015E, R0                      ; 6BE3   0280 015E
        INCR    R0                              ; 6BE5   0008
        MVO     R0,     G_015E                  ; 6BE6   0240 015E
        B       L_6C12                          ; 6BE8   0200 0028

L_6BEA:
        MVI     G_018D, R0                      ; 6BEA   0280 018D
        CMPI    #$0001, R0                      ; 6BEC   0378 0001
        BLE     L_6BF7                          ; 6BEE   0206 0007

        JSR     R5,     L_5B47                  ; 6BF0   0004 0158 0347

        MVII    #$0001, R0                      ; 6BF3   02B8 0001
        MVO     R0,     G_018D                  ; 6BF5   0240 018D
L_6BF7:
        CLRR    R0                              ; 6BF7   01C0
        CMP     G_015D, R0                      ; 6BF8   0340 015D
        BLT     L_6C12                          ; 6BFA   0205 0016

        MVII    #$00F0, R0                      ; 6BFC   02B8 00F0
        MVO     R0,     G_015D                  ; 6BFE   0240 015D
        MVI     G_0166, R0                      ; 6C00   0280 0166
        MVO     R0,     G_0168                  ; 6C02   0240 0168
        MVI     G_015F, R0                      ; 6C04   0280 015F
        MVO     R0,     G_0166                  ; 6C06   0240 0166
        MVI     G_015E, R0                      ; 6C08   0280 015E
        INCR    R0                              ; 6C0A   0008
        MVO     R0,     G_015E                  ; 6C0B   0240 015E

        JSR     R5,     L_6D21                  ; 6C0D   0004 016C 0121

        MVO     R3,     G_015F                  ; 6C10   0243 015F
L_6C12:
        NOP                                     ; 6C12   0034
        MVI     G_015D, R1                      ; 6C13   0281 015D
        SUBI    #$0014, R1                      ; 6C15   0339 0014
        MVO     R1,     G_015D                  ; 6C17   0241 015D
        MVI     G_015F, R3                      ; 6C19   0283 015F

        JSR     R5,     L_6D17                  ; 6C1B   0004 016C 0117

        MVI     G_015D, R1                      ; 6C1E   0281 015D
        ADDR    R0,     R1                      ; 6C20   00C1
        MVII    #$0200, R5                      ; 6C21   02BD 0200
L_6C23:
        MVI@    R1,     R2                      ; 6C23   028A
        SLL     R2,     1                       ; 6C24   004A
        SDBD                                    ; 6C25   0001
        ADDI    #$6D2D, R2                      ; 6C26   02FA 002D 006D
        MOVR    R2,     R4                      ; 6C29   0094
        SDBD                                    ; 6C2A   0001
        MVI@    R4,     R2                      ; 6C2B   02A2
        MVO@    R2,     R5                      ; 6C2C   026A
        NOP                                     ; 6C2D   0034
        INCR    R1                              ; 6C2E   0009
        CMPI    #$0214, R5                      ; 6C2F   037D 0214
        BLT     L_6C23                          ; 6C31   0225 000F

        MVI     G_0172, R0                      ; 6C33   0280 0172
        TSTR    R0                              ; 6C35   0080
        BNEQ    L_6C3D                          ; 6C36   020C 0005

        INCR    R0                              ; 6C38   0008
        MVO     R0,     G_0172                  ; 6C39   0240 0172
        B       L_6D16                          ; 6C3B   0200 00D9

L_6C3D:
        CLRR    R0                              ; 6C3D   01C0
        MVO     R0,     G_01BC                  ; 6C3E   0240 01BC
        MVI     G_0182, R0                      ; 6C40   0280 0182
        TSTR    R0                              ; 6C42   0080
        BEQ     L_6C4A                          ; 6C43   0204 0005

        JSR     R5,     L_5E8A                  ; 6C45   0004 015C 028A

        B       L_6D16                          ; 6C48   0200 00CC

L_6C4A:
        MVI     G_0322, R2                      ; 6C4A   0282 0322
        SDBD                                    ; 6C4C   0001
        ANDI    #$FC0F, R2                      ; 6C4D   03BA 000F 00FC

        JSR     R5,     L_51B5                  ; 6C50   0004 0150 01B5

        MVI     G_0190, R0                      ; 6C53   0280 0190
        TSTR    R0                              ; 6C55   0080
        BEQ     L_6C64                          ; 6C56   0204 000C

        MVII    #$0007, R0                      ; 6C58   02B8 0007
        MVO     R0,     G_01A3                  ; 6C5A   0240 01A3

        JSR     R5,     L_DAE7                  ; 6C5C   0004 01D8 02E7

        CLRR    R0                              ; 6C5F   01C0
        MVO     R0,     G_0190                  ; 6C60   0240 0190
        B       L_6D16                          ; 6C62   0200 00B2

L_6C64:
        MVII    #$0001, R0                      ; 6C64   02B8 0001
        MVO     R0,     G_018F                  ; 6C66   0240 018F
        B       L_6D16                          ; 6C68   0200 00AC

L_6C6A:
        MVI     G_0172, R0                      ; 6C6A   0280 0172
        TSTR    R0                              ; 6C6C   0080
        BNEQ    L_6C97                          ; 6C6D   020C 0028

        MVI     G_018D, R0                      ; 6C6F   0280 018D
        TSTR    R0                              ; 6C71   0080
        BEQ     L_6C7A                          ; 6C72   0204 0006

        SDBD                                    ; 6C74   0001
        MVII    #$3046, R0                      ; 6C75   02B8 0046 0030
        MVO     R0,     G_033D                  ; 6C78   0240 033D
L_6C7A:
        MVI     G_015D, R0                      ; 6C7A   0280 015D
        CMPI    #$00F0, R0                      ; 6C7C   0378 00F0
        BLT     L_6C97                          ; 6C7E   0205 0017

        CLRR    R0                              ; 6C80   01C0
        MVO     R0,     G_015D                  ; 6C81   0240 015D
        MVI     G_015F, R0                      ; 6C83   0280 015F
        MVO     R0,     G_0167                  ; 6C85   0240 0167
        MVI     G_0166, R0                      ; 6C87   0280 0166
        MVO     R0,     G_015F                  ; 6C89   0240 015F
        MVI     G_015E, R0                      ; 6C8B   0280 015E
        DECR    R0                              ; 6C8D   0010
        MVO     R0,     G_015E                  ; 6C8E   0240 015E
        DECR    R0                              ; 6C90   0010
        NOP                                     ; 6C91   0034

        JSR     R5,     L_6D21                  ; 6C92   0004 016C 0121

        MVO     R3,     G_0166                  ; 6C95   0243 0166
L_6C97:
        MVI     G_0166, R3                      ; 6C97   0283 0166

        JSR     R5,     L_6D17                  ; 6C99   0004 016C 0117

        MVII    #$02DC, R5                      ; 6C9C   02BD 02DC
        MVI     G_015D, R1                      ; 6C9E   0281 015D
        ADDR    R0,     R1                      ; 6CA0   00C1
L_6CA1:
        MVI@    R1,     R2                      ; 6CA1   028A
        SLL     R2,     1                       ; 6CA2   004A
        SDBD                                    ; 6CA3   0001
        ADDI    #$6D2D, R2                      ; 6CA4   02FA 002D 006D
        MOVR    R2,     R4                      ; 6CA7   0094
        SDBD                                    ; 6CA8   0001
        MVI@    R4,     R2                      ; 6CA9   02A2
        MVO@    R2,     R5                      ; 6CAA   026A
        NOP                                     ; 6CAB   0034
        INCR    R1                              ; 6CAC   0009
        CMPI    #$02F0, R5                      ; 6CAD   037D 02F0
        BLT     L_6CA1                          ; 6CAF   0225 000F

        MVI     G_015D, R0                      ; 6CB1   0280 015D
        ADDI    #$0014, R0                      ; 6CB3   02F8 0014
        MVO     R0,     G_015D                  ; 6CB5   0240 015D
        MVI     G_0172, R0                      ; 6CB7   0280 0172
        TSTR    R0                              ; 6CB9   0080
        BEQ     L_6CC1                          ; 6CBA   0204 0005

        CLRR    R0                              ; 6CBC   01C0
        MVO     R0,     G_0172                  ; 6CBD   0240 0172
        B       L_6D16                          ; 6CBF   0200 0055

L_6CC1:
        CLRR    R0                              ; 6CC1   01C0
        MVO     R0,     G_01BC                  ; 6CC2   0240 01BC
        MVI     G_0185, R1                      ; 6CC4   0281 0185
        TSTR    R1                              ; 6CC6   0089
        BEQ     L_6CFF                          ; 6CC7   0204 0036

        CLRR    R1                              ; 6CC9   01C9
        MVO     R1,     G_0185                  ; 6CCA   0241 0185
        MVI     G_033A, R0                      ; 6CCC   0280 033A
        ANDI    #$000F, R0                      ; 6CCE   03B8 000F
        MVO     R0,     G_033A                  ; 6CD0   0240 033A
        MVI     G_0182, R0                      ; 6CD2   0280 0182
        TSTR    R0                              ; 6CD4   0080
        BEQ     L_6CF1                          ; 6CD5   0204 001A

        MVO     R1,     G_0182                  ; 6CD7   0241 0182
        MVII    #$0003, R2                      ; 6CD9   02BA 0003

        JSR     R5,     L_51B5                  ; 6CDB   0004 0150 01B5

        SDBD                                    ; 6CDE   0001
        MVII    #$61A1, R1                      ; 6CDF   02B9 00A1 0061

        JSR     R5,     L_51BD                  ; 6CE2   0004 0150 01BD

        MVI     G_018E, R0                      ; 6CE5   0280 018E
        TSTR    R0                              ; 6CE7   0080
        BNEQ    L_6CF1                          ; 6CE8   020C 0007

        SDBD                                    ; 6CEA   0001
        MVII    #$6FB6, R0                      ; 6CEB   02B8 00B6 006F
        MVO     R0,     G_035D                  ; 6CEE   0240 035D
        NOP                                     ; 6CF0   0034
L_6CF1:
        MVI     G_0335, R0                      ; 6CF1   0280 0335
        SDBD                                    ; 6CF3   0001
        ANDI    #$BFFF, R0                      ; 6CF4   03B8 00FF 00BF
        SDBD                                    ; 6CF7   0001
        XORI    #$4000, R0                      ; 6CF8   03F8 0000 0040
        MVO     R0,     G_0335                  ; 6CFB   0240 0335
        B       L_6D09                          ; 6CFD   0200 000A

L_6CFF:
        MVI     G_0182, R0                      ; 6CFF   0280 0182
        TSTR    R0                              ; 6D01   0080
        BEQ     L_6D09                          ; 6D02   0204 0005

        JSR     R5,     L_5E8A                  ; 6D04   0004 015C 028A

        B       L_6D16                          ; 6D07   0200 000D

L_6D09:
        MVI     G_0322, R2                      ; 6D09   0282 0322
        SDBD                                    ; 6D0B   0001
        ANDI    #$FC0F, R2                      ; 6D0C   03BA 000F 00FC

        JSR     R5,     L_51B5                  ; 6D0F   0004 0150 01B5

        MVII    #$0001, R0                      ; 6D12   02B8 0001
        MVO     R0,     G_018F                  ; 6D14   0240 018F
L_6D16:
        PULR    R7                              ; 6D16   02B7

L_6D17:
        PSHR    R5                              ; 6D17   0275
        SLL     R3,     1                       ; 6D18   004B
        SDBD                                    ; 6D19   0001
        ADDI    #$6EA9, R3                      ; 6D1A   02FB 00A9 006E
        MOVR    R3,     R4                      ; 6D1D   009C
        SDBD                                    ; 6D1E   0001
        MVI@    R4,     R0                      ; 6D1F   02A0
        PULR    R7                              ; 6D20   02B7

L_6D21:
        PSHR    R5                              ; 6D21   0275
        SDBD                                    ; 6D22   0001
        MVII    #$6DA7, R5                      ; 6D23   02BD 00A7 006D
        ADD     G_019D, R5                      ; 6D26   02C5 019D
        SDBD                                    ; 6D28   0001
        MVI@    R5,     R2                      ; 6D29   02AA
        ADDR    R0,     R2                      ; 6D2A   00C2
        MVI@    R2,     R3                      ; 6D2B   0293
        PULR    R7                              ; 6D2C   02B7

        DECLE   $0005,  $000E,  $000D,  $000E   ; 6D2D   0005 000E 000D 000E
        DECLE   $0013,  $002A,  $001B,  $002A   ; 6D31   0013 002A 001B 002A
        DECLE   $0025,  $000E,  $002D,  $000E   ; 6D35   0025 000E 002D 000E
        DECLE   $00C8,  $000E,  $003F,  $000E   ; 6D39   00C8 000E 003F 000E
        DECLE   $0035,  $000E,  $0045,  $0028   ; 6D3D   0035 000E 0045 0028
        DECLE   $004D,  $0028,  $0094,  $002A   ; 6D41   004D 0028 0094 002A
        DECLE   $00BD,  $0028,  $00FB,  $001E   ; 6D45   00BD 0028 00FB 001E
        DECLE   $004C,  $002A,  $0054,  $002A   ; 6D49   004C 002A 0054 002A
        DECLE   $004D,  $000E,  $0008,  $001F   ; 6D4D   004D 000E 0008 001F

        SWAP    R3,     1                       ; 6D51   0043
        RSWD    R4                              ; 6D52   003C
        SWAP    R0,     2                       ; 6D53   0044
        RSWD    R4                              ; 6D54   003C
        SWAP    R1,     2                       ; 6D55   0045
        RSWD    R4                              ; 6D56   003C
        SLL     R0,     2                       ; 6D57   004C
        RSWD    R4                              ; 6D58   003C
        SLL     R1,     2                       ; 6D59   004D
        RSWD    R4                              ; 6D5A   003C
        MOVR    R3,     R7                      ; 6D5B   009F

        DECLE   $0018,  $003D,  $002A,  $0055   ; 6D5C   0018 003D 002A 0055
        DECLE   $001E,  $005D,  $001E,  $0045   ; 6D60   001E 005D 001E 0045
        DECLE   $001A,  $0064,  $001A,  $00BD   ; 6D64   001A 0064 001A 00BD
        DECLE   $001A,  $00C5,  $001A,  $00AC   ; 6D68   001A 00C5 001A 00AC
        DECLE   $002C,  $00B7,  $002C,  $00A6   ; 6D6C   002C 00B7 002C 00A6
        DECLE   $0008,  $0000,  $001F,  $003F   ; 6D70   0008 0000 001F 003F

        INCR    R2                              ; 6D74   000A
        RLC     R3,     2                       ; 6D75   0057
        INCR    R2                              ; 6D76   000A
        MOVR    R2,     R7                      ; 6D77   0097

        DECLE   $000A,  $00BF,  $000A,  $00C8   ; 6D78   000A 00BF 000A 00C8
        DECLE   $000A,  $00ED,  $001A,  $0041   ; 6D7C   000A 00ED 001A 0041
        DECLE   $002E,  $0051,  $002E,  $00B9   ; 6D80   002E 0051 002E 00B9
        DECLE   $002E,  $006C,  $002E,  $0074   ; 6D84   002E 006C 002E 0074
        DECLE   $002E,  $0084,  $002E,  $008C   ; 6D88   002E 0084 002E 008C
        DECLE   $002E,  $006C,  $000A,  $00E5   ; 6D8C   002E 006C 000A 00E5
        DECLE   $001A,  $0074,  $000A,  $007C   ; 6D90   001A 0074 000A 007C
        DECLE   $000A,  $008C,  $000A,  $0084   ; 6D94   000A 008C 000A 0084
        DECLE   $000A,  $0066,  $002A,  $0067   ; 6D98   000A 0066 002A 0067
        DECLE   $002A,  $0063,  $002A,  $00DD   ; 6D9C   002A 0063 002A 00DD
        DECLE   $001A,  $00F5,  $0028,  $0063   ; 6DA0   001A 00F5 0028 0063
        DECLE   $001B,  $0065,  $001B,  $00BB   ; 6DA4   001B 0065 001B 00BB
        DECLE   $006D,  $00C6,  $006D,  $00D3   ; 6DA8   006D 00C6 006D 00D3
        DECLE   $006D,  $00E4,  $006D,  $00F8   ; 6DAC   006D 00E4 006D 00F8
        DECLE   $006D,  $0010,  $006E,  $002B   ; 6DB0   006D 0010 006E 002B
        DECLE   $006E,  $0047,  $006E,  $0065   ; 6DB4   006E 0047 006E 0065
        DECLE   $006E,  $0085,  $006E,  $0004   ; 6DB8   006E 0085 006E 0004
        DECLE   $0000,  $0002,  $0003,  $0001   ; 6DBC   0000 0002 0003 0001
        DECLE   $0005,  $0002,  $0001,  $0003   ; 6DC0   0005 0002 0001 0003
        DECLE   $0002,  $0004,  $0004,  $0000   ; 6DC4   0002 0004 0004 0000
        DECLE   $0003,  $0005,  $0001,  $0005   ; 6DC8   0003 0005 0001 0005
        DECLE   $0003,  $0001,  $0002,  $0003   ; 6DCC   0003 0001 0002 0003
        DECLE   $0001,  $0002,  $0004,  $0004   ; 6DD0   0001 0002 0004 0004
        DECLE   $0000,  $0002,  $0003,  $0002   ; 6DD4   0000 0002 0003 0002
        DECLE   $0001,  $0002,  $0005,  $0002   ; 6DD8   0001 0002 0005 0002
        DECLE   $0001,  $0003,  $0002,  $0003   ; 6DDC   0001 0003 0002 0003
        DECLE   $0001,  $0002,  $0003,  $0004   ; 6DE0   0001 0002 0003 0004
        DECLE   $0004,  $0000,  $0003,  $0002   ; 6DE4   0004 0000 0003 0002
        DECLE   $0005,  $0001,  $0003,  $0002   ; 6DE8   0005 0001 0003 0002
        DECLE   $0005,  $0002,  $0001,  $0002   ; 6DEC   0005 0002 0001 0002
        DECLE   $0002,  $0003,  $0002,  $0001   ; 6DF0   0002 0003 0002 0001
        DECLE   $0002,  $0003,  $0003,  $0004   ; 6DF4   0002 0003 0003 0004
        DECLE   $0004,  $0000,  $0003,  $0002   ; 6DF8   0004 0000 0003 0002
        DECLE   $0003,  $0001,  $0005,  $0002   ; 6DFC   0003 0001 0005 0002
        DECLE   $0003,  $0002,  $0001,  $0003   ; 6E00   0003 0002 0001 0003
        DECLE   $0005,  $0002,  $0003,  $0001   ; 6E04   0005 0002 0003 0001
        DECLE   $0003,  $0002,  $0003,  $0002   ; 6E08   0003 0002 0003 0002
        DECLE   $0001,  $0003,  $0002,  $0004   ; 6E0C   0001 0003 0002 0004
        DECLE   $0004,  $0000,  $0002,  $0003   ; 6E10   0004 0000 0002 0003
        DECLE   $0003,  $0002,  $0001,  $0005   ; 6E14   0003 0002 0001 0005
        DECLE   $0003,  $0002,  $0003,  $0001   ; 6E18   0003 0002 0003 0001
        DECLE   $0002,  $0003,  $0003,  $0002   ; 6E1C   0002 0003 0003 0002
        DECLE   $0001,  $0002,  $0005,  $0002   ; 6E20   0001 0002 0005 0002
        DECLE   $0003,  $0001,  $0003,  $0002   ; 6E24   0003 0001 0003 0002
        DECLE   $0003,  $0002,  $0004,  $0004   ; 6E28   0003 0002 0004 0004
        DECLE   $0000,  $0002,  $0003,  $0002   ; 6E2C   0000 0002 0003 0002
        DECLE   $0005,  $0001,  $0003,  $0003   ; 6E30   0005 0001 0003 0003
        DECLE   $0002,  $0002,  $0003,  $0001   ; 6E34   0002 0002 0003 0001
        DECLE   $0002,  $0005,  $0002,  $0003   ; 6E38   0002 0005 0002 0003
        DECLE   $0001,  $0002,  $0003,  $0002   ; 6E3C   0001 0002 0003 0002
        DECLE   $0003,  $0002,  $0001,  $0002   ; 6E40   0003 0002 0001 0002
        DECLE   $0003,  $0005,  $0004,  $0004   ; 6E44   0003 0005 0004 0004
        DECLE   $0000,  $0002,  $0003,  $0002   ; 6E48   0000 0002 0003 0002
        DECLE   $0005,  $0003,  $0001,  $0002   ; 6E4C   0005 0003 0001 0002
        DECLE   $0003,  $0002,  $0003,  $0001   ; 6E50   0003 0002 0003 0001
        DECLE   $0002,  $0003,  $0003,  $0002   ; 6E54   0002 0003 0003 0002
        DECLE   $0003,  $0001,  $0005,  $0003   ; 6E58   0003 0001 0005 0003
        DECLE   $0002,  $0002,  $0001,  $0002   ; 6E5C   0002 0002 0001 0002
        DECLE   $0003,  $0003,  $0002,  $0005   ; 6E60   0003 0003 0002 0005
        DECLE   $0004,  $0004,  $0000,  $0002   ; 6E64   0004 0004 0000 0002
        DECLE   $0003,  $0003,  $0005,  $0002   ; 6E68   0003 0003 0005 0002
        DECLE   $0001,  $0005,  $0002,  $0003   ; 6E6C   0001 0005 0002 0003
        DECLE   $0002,  $0002,  $0001,  $0003   ; 6E70   0002 0002 0001 0003
        DECLE   $0002,  $0002,  $0003,  $0002   ; 6E74   0002 0002 0003 0002
        DECLE   $0001,  $0002,  $0003,  $0003   ; 6E78   0001 0002 0003 0003
        DECLE   $0002,  $0003,  $0001,  $0002   ; 6E7C   0002 0003 0001 0002
        DECLE   $0003,  $0005,  $0003,  $0002   ; 6E80   0003 0005 0003 0002
        DECLE   $0004,  $0004,  $0000,  $0003   ; 6E84   0004 0004 0000 0003
        DECLE   $0002,  $0002,  $0003,  $0005   ; 6E88   0002 0002 0003 0005
        DECLE   $0001,  $0002,  $0003,  $0002   ; 6E8C   0001 0002 0003 0002
        DECLE   $0002,  $0001,  $0005,  $0002   ; 6E90   0002 0001 0005 0002
        DECLE   $0003,  $0003,  $0002,  $0001   ; 6E94   0003 0003 0002 0001
        DECLE   $0002,  $0003,  $0003,  $0002   ; 6E98   0002 0003 0003 0002
        DECLE   $0003,  $0001,  $0003,  $0002   ; 6E9C   0003 0001 0003 0002
        DECLE   $0002,  $0005,  $0003,  $0001   ; 6EA0   0002 0005 0003 0001
        DECLE   $0002,  $0003,  $0005,  $0002   ; 6EA4   0002 0003 0005 0002
        DECLE   $0004,  $00B0,  $00D4,  $00F0   ; 6EA8   0004 00B0 00D4 00F0
        DECLE   $00D0,  $00E0,  $00D1,  $00D0   ; 6EAC   00D0 00E0 00D1 00D0
        DECLE   $00D2,  $0000,  $00D0,  $00C0   ; 6EB0   00D2 0000 00D0 00C0
        DECLE   $00D3,  $0000,  $0068,  $0000   ; 6EB4   00D3 0000 0068 0000
        DECLE   $0098,  $0098,  $0000,  $0068   ; 6EB8   0098 0098 0000 0068
        DECLE   $0000,  $00D7,  $0077,  $00DB   ; 6EBC   0000 00D7 0077 00DB
        DECLE   $00BB,  $007B,  $00DD,  $00BD   ; 6EC0   00BB 007B 00DD 00BD
        DECLE   $007D,  $00DE,  $00BE,  $007E   ; 6EC4   007D 00DE 00BE 007E
        DECLE   $00B7,  $00DD,  $006E,  $00EA   ; 6EC8   00B7 00DD 006E 00EA
        DECLE   $006E,  $00F4,  $006E,  $00FE   ; 6ECC   006E 00F4 006E 00FE
        DECLE   $006E,  $000A,  $006F,  $0015   ; 6ED0   006E 000A 006F 0015
        DECLE   $006F,  $0020,  $006F,  $002A   ; 6ED4   006F 0020 006F 002A
        DECLE   $006F,  $0036,  $006F,  $0042   ; 6ED8   006F 0036 006F 0042
        DECLE   $006F,  $0030,  $0020,  $0020   ; 6EDC   006F 0030 0020 0020
        DECLE   $0046,  $004F,  $004F,  $0054   ; 6EE0   0046 004F 004F 0054
        DECLE   $0048,  $0049,  $004C,  $004C   ; 6EE4   0048 0049 004C 004C
        DECLE   $0053,  $0000,  $0031,  $0020   ; 6EE8   0053 0000 0031 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6EEC   0020 004D 0054 0020
        DECLE   $004F,  $004E,  $0045,  $0000   ; 6EF0   004F 004E 0045 0000
        DECLE   $0032,  $0020,  $0020,  $004D   ; 6EF4   0032 0020 0020 004D
        DECLE   $0054,  $0020,  $0054,  $0057   ; 6EF8   0054 0020 0054 0057
        DECLE   $004F,  $0000,  $0033,  $0020   ; 6EFC   004F 0000 0033 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6F00   0020 004D 0054 0020
        DECLE   $0054,  $0048,  $0052,  $0045   ; 6F04   0054 0048 0052 0045
        DECLE   $0045,  $0000,  $0034,  $0020   ; 6F08   0045 0000 0034 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6F0C   0020 004D 0054 0020
        DECLE   $0046,  $004F,  $0055,  $0052   ; 6F10   0046 004F 0055 0052
        DECLE   $0000,  $0035,  $0020,  $0020   ; 6F14   0000 0035 0020 0020
        DECLE   $004D,  $0054,  $0020,  $0046   ; 6F18   004D 0054 0020 0046
        DECLE   $0049,  $0056,  $0045,  $0000   ; 6F1C   0049 0056 0045 0000
        DECLE   $0036,  $0020,  $0020,  $004D   ; 6F20   0036 0020 0020 004D
        DECLE   $0054,  $0020,  $0053,  $0049   ; 6F24   0054 0020 0053 0049
        DECLE   $0058,  $0000,  $0037,  $0020   ; 6F28   0058 0000 0037 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6F2C   0020 004D 0054 0020
        DECLE   $0053,  $0045,  $0056,  $0045   ; 6F30   0053 0045 0056 0045
        DECLE   $004E,  $0000,  $0038,  $0020   ; 6F34   004E 0000 0038 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6F38   0020 004D 0054 0020
        DECLE   $0045,  $0049,  $0047,  $0048   ; 6F3C   0045 0049 0047 0048
        DECLE   $0054,  $0000,  $0039,  $0020   ; 6F40   0054 0000 0039 0020
        DECLE   $0020,  $004D,  $0054,  $0020   ; 6F44   0020 004D 0054 0020
        DECLE   $004E,  $0049,  $004E,  $0045   ; 6F48   004E 0049 004E 0045
        DECLE   $0000,  $0004,  $0005,  $0006   ; 6F4C   0000 0004 0005 0006
        DECLE   $0008,  $0008,  $0009,  $0003   ; 6F50   0008 0008 0009 0003
        DECLE   $0005,  $0005,  $0006,  $0006   ; 6F54   0005 0005 0006 0006
        DECLE   $0007,  $0002,  $0003,  $0004   ; 6F58   0007 0002 0003 0004
        DECLE   $0005,  $0005,  $0006,  $0001   ; 6F5C   0005 0005 0006 0001
        DECLE   $0001,  $0002,  $0002,  $0003   ; 6F60   0001 0002 0002 0003
        DECLE   $0003,  $001E,  $0020,  $0023   ; 6F64   0003 001E 0020 0023
        DECLE   $0024,  $0027                   ; 6F68   0024 0027

        ADCR    R1                              ; 6F6A   0029
        DECR    R4                              ; 6F6B   0014
        DECR    R6                              ; 6F6C   0016
L_6F6D:
        DECR    R7                              ; 6F6D   0017

        DECLE   $0019,  $001B,  $001E,  $0004   ; 6F6E   0019 001B 001E 0004
        DECLE   $0004,  $0003,  $0003,  $0003   ; 6F72   0004 0003 0003 0003
        DECLE   $0002,  $0003,  $0003,  $0003   ; 6F76   0002 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0002   ; 6F7A   0003 0003 0003 0002
        DECLE   $0002,  $0002,  $0001,  $0001   ; 6F7E   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6F82   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $001E   ; 6F86   0001 0001 0001 001E
        DECLE   $001C,  $0019,  $0019,  $0018   ; 6F8A   001C 0019 0019 0018
        DECLE   $0018,  $0014,  $0013,  $0013   ; 6F8E   0018 0014 0013 0013
        DECLE   $0012,  $0010,  $0010,  $0004   ; 6F92   0012 0010 0010 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; 6F96   0004 0004 0004 0004
        DECLE   $0004,  $0001,  $0001,  $0002   ; 6F9A   0004 0001 0001 0002
        DECLE   $0001                           ; 6F9E   0001

        INCR    R2                              ; 6F9F   000A
        INCR    R0                              ; 6FA0   0008
        EIS                                     ; 6FA1   0002
        ADDR    R4,     R6                      ; 6FA2   00E6
        ADDR    R3,     R6                      ; 6FA3   00DE
        MOVR    R3,     R2                      ; 6FA4   009A
        ADDR    R3,     R6                      ; 6FA5   00DE
        SLR     R1,     1                       ; 6FA6   0061
        ADDR    R3,     R7                      ; 6FA7   00DF

        DECLE   $003B,  $00DB,  $003B,  $00DB   ; 6FA8   003B 00DB 003B 00DB
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAC   0000 0000 0000 0000

        ADDR    R6,     R6                      ; 6FB0   00F6
        ADDR    R3,     R7                      ; 6FB1   00DF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB2   0000 0000 0000 0000
        DECLE   $0059,  $0059,  $0000,  $0000   ; 6FB6   0059 0059 0000 0000
        DECLE   $002C,  $00D8,  $002C,  $00D8   ; 6FBA   002C 00D8 002C 00D8
        DECLE   $002C,  $00D8,  $0000,  $0000   ; 6FBE   002C 00D8 0000 0000
        DECLE   $0000,  $0000,  $005E,  $0056   ; 6FC2   0000 0000 005E 0056
        DECLE   $005E,  $0056,  $005E,  $0056   ; 6FC6   005E 0056 005E 0056
        DECLE   $0000,  $0000,  $0000           ; 6FCA   0000 0000 0000

        DECR    R0                              ; 6FCD   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
        DECLE   $0027,  $0027,  $0027,  $0027   ; D000   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D004   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D008   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D00C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D010   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D014   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D018   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D01C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D020   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D024   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D028   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D02C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D030   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D034   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D038   0027 0027 0027 0027
        DECLE   $0025,  $0025,  $0029,  $0026   ; D03C   0025 0025 0029 0026
        DECLE   $0027,  $0027,  $0027,  $0027   ; D040   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D044   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D048   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D04C   0027 0027 0027 0027
        DECLE   $0025,  $0025,  $0029,  $0029   ; D050   0025 0025 0029 0029
        DECLE   $0029,  $0026,  $0027,  $0027   ; D054   0029 0026 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D058   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D05C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $002A,  $002A   ; D060   0027 0027 002A 002A
        DECLE   $0027,  $0027,  $0027,  $0027   ; D064   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D068   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D06C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D070   0027 0027 0027 0027
        DECLE   $002A,  $0029,  $0029,  $0029   ; D074   002A 0029 0029 0029
        DECLE   $0027,  $0027,  $0027,  $0027   ; D078   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D07C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D080   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D084   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D088   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D08C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $002A   ; D090   0027 0027 0027 002A
        DECLE   $0025,  $0025,  $0029,  $0026   ; D094   0025 0025 0029 0026
        DECLE   $0027,  $0027,  $0027,  $0027   ; D098   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D09C   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D0A0   0027 0027 0027 0027

        ADCR    R2                              ; D0A4   002A
        ADCR    R2                              ; D0A5   002A
        NEGR    R5                              ; D0A6   0025
        ADCR    R6                              ; D0A7   002E
        SETC                                    ; D0A8   0007
        ADCR    R7                              ; D0A9   002F

        NEGR    R5                              ; D0AA   0025
L_D0AB:
        ADCR    R1                              ; D0AB   0029
        DECLE   $0026,  $0027,  $0027,  $0027   ; D0AC   0026 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D0B0   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027           ; D0B4   0027 0027 0027

        ADCR    R2                              ; D0B7   002A
        ADCR    R1                              ; D0B8   0029
        ADCR    R6                              ; D0B9   002E
        INCR    R7                              ; D0BA   000F
        INCR    R7                              ; D0BB   000F

L_D0BC:
        CLRC                                    ; D0BC   0006
L_D0BD:
        INCR    R7                              ; D0BD   000F

        ADCR    R4                              ; D0BE   002C
L_D0BF:
        ADCR    R7                              ; D0BF   002F

        NEGR    R5                              ; D0C0   0025
L_D0C1:
        NEGR    R6                              ; D0C1   0026
        DECLE   $0027,  $0027,  $0027,  $0027   ; D0C2   0027 0027 0027 0027
        DECLE   $0027,  $0027,  $0027,  $0027   ; D0C6   0027 0027 0027 0027

        GSWD    R2                              ; D0CA   0032
        GSWD    R3                              ; D0CB   0033
        INCR    R3                              ; D0CC   000B
        INCR    R7                              ; D0CD   000F
        INCR    R7                              ; D0CE   000F

L_D0CF:
        INCR    R4                              ; D0CF   000C
L_D0D0:
        CLRC                                    ; D0D0   0006
        INCR    R7                              ; D0D1   000F

        INCR    R4                              ; D0D2   000C
L_D0D3:
        INCR    R7                              ; D0D3   000F
        INCR    R7                              ; D0D4   000F

L_D0D5:
        GSWD    R0                              ; D0D5   0030
L_D0D6:
        NOP                                     ; D0D6   0034
        DECLE   $0027,  $0027,  $0027,  $0027   ; D0D7   0027 0027 0027 0027
        DECLE   $0027                           ; D0DB   0027

        GSWD    R3                              ; D0DC   0033
        INCR    R7                              ; D0DD   000F

        INCR    R6                              ; D0DE   000E
L_D0DF:
        INCR    R6                              ; D0DF   000E
        INCR    R3                              ; D0E0   000B
        INCR    R7                              ; D0E1   000F

        INCR    R1                              ; D0E2   0009
L_D0E3:
        INCR    R7                              ; D0E3   000F

        CLRC                                    ; D0E4   0006
L_D0E5:
        INCR    R7                              ; D0E5   000F

        INCR    R1                              ; D0E6   0009
L_D0E7:
        COMR    R0                              ; D0E7   0018
        INCR    R6                              ; D0E8   000E
        INCR    R7                              ; D0E9   000F

        INCR    R3                              ; D0EA   000B
L_D0EB:
        INCR    R4                              ; D0EB   000C
        DECLE   $0030,  $0034,  $0027,  $0027   ; D0EC   0030 0034 0027 0027
        DECLE   $0014,  $0009,  $0038,  $0018   ; D0F0   0014 0009 0038 0018
        DECLE   $0038,  $0018,  $0018,  $0018   ; D0F4   0038 0018 0018 0018
        DECLE   $0006,  $0009,  $000E,  $0018   ; D0F8   0006 0009 000E 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D0FC   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D100   0018 0018 0018 0018
        DECLE   $0014,  $0014,  $0014,  $0009   ; D104   0014 0014 0014 0009
        DECLE   $0018,  $0018,  $0018,  $0018   ; D108   0018 0018 0018 0018
        DECLE   $0006,  $0004,  $0005,  $0005   ; D10C   0006 0004 0005 0005
        DECLE   $0003,  $0018,  $0018,  $0018   ; D110   0003 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D114   0018 0018 0018 0018
        DECLE   $0009,  $0013,  $0013,  $000B   ; D118   0009 0013 0013 000B
        DECLE   $0009,  $0018,  $0018,  $0018   ; D11C   0009 0018 0018 0018
        DECLE   $0006,  $0014,  $0014,  $0014   ; D120   0006 0014 0014 0014
        DECLE   $0006,  $0018,  $0018,  $0009   ; D124   0006 0018 0018 0009
        DECLE   $000E,  $0018,  $0018,  $0018   ; D128   000E 0018 0018 0018
        DECLE   $0013,  $0013,  $000C,  $0009   ; D12C   0013 0013 000C 0009
        DECLE   $0009,  $0018,  $0018,  $0018   ; D130   0009 0018 0018 0018
        DECLE   $0000,  $0004,  $0003,  $0014   ; D134   0000 0004 0003 0014
        DECLE   $0006,  $0018,  $0018,  $000E   ; D138   0006 0018 0018 000E
        DECLE   $001A,  $0018,  $0018,  $0009   ; D13C   001A 0018 0018 0009
        DECLE   $000B,  $0013,  $0009,  $0018   ; D140   000B 0013 0009 0018
        DECLE   $0018,  $0018,  $0009,  $0009   ; D144   0018 0018 0009 0009
        DECLE   $0018,  $0018,  $0006,  $0004   ; D148   0018 0018 0006 0004
        DECLE   $0001,  $0018,  $0018,  $0019   ; D14C   0001 0018 0018 0019
        DECLE   $0018,  $0018,  $000E,  $0009   ; D150   0018 0018 000E 0009
        DECLE   $0009,  $0009,  $0018,  $0018   ; D154   0009 0009 0018 0018
        DECLE   $0018,  $000E,  $0009,  $0002   ; D158   0018 000E 0009 0002
        DECLE   $0005,  $0008,  $0001,  $0018   ; D15C   0005 0008 0001 0018
        DECLE   $001A,  $0018,  $0018,  $0018   ; D160   001A 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D164   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0014   ; D168   0018 0018 0018 0014
        DECLE   $0014,  $0002,  $0008,  $0001   ; D16C   0014 0002 0008 0001
        DECLE   $0014,  $0014,  $0019,  $0019   ; D170   0014 0014 0019 0019
        DECLE   $0018,  $0018,  $0018,  $0018   ; D174   0018 0018 0018 0018
        DECLE   $0038,  $0018,  $0018,  $0018   ; D178   0038 0018 0018 0018
        DECLE   $0018,  $0018,  $0037,  $0019   ; D17C   0018 0018 0037 0019
        DECLE   $0018,  $0006,  $0018,  $0018   ; D180   0018 0006 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D184   0018 0018 0018 0018
        DECLE   $000D,  $000D,  $0018,  $0018   ; D188   000D 000D 0018 0018
        DECLE   $0019,  $0019,  $0018,  $0018   ; D18C   0019 0019 0018 0018
        DECLE   $0009,  $0037,  $001A,  $0018   ; D190   0009 0037 001A 0018
        DECLE   $000E,  $0000,  $0004,  $0005   ; D194   000E 0000 0004 0005
        DECLE   $0005,  $0005,  $0003,  $0018   ; D198   0005 0005 0003 0018
        DECLE   $0022,  $0011,  $0009,  $0018   ; D19C   0022 0011 0009 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D1A0   0018 0018 0018 0018
        DECLE   $0018,  $0019,  $0018,  $0038   ; D1A4   0018 0019 0018 0038
        DECLE   $0009,  $0009,  $000E,  $0009   ; D1A8   0009 0009 000E 0009
        DECLE   $0018,  $0018,  $0006,  $0018   ; D1AC   0018 0018 0006 0018
        DECLE   $0018,  $0006,  $0009,  $000E   ; D1B0   0018 0006 0009 000E
        DECLE   $0009,  $0018,  $0018,  $000E   ; D1B4   0009 0018 0018 000E
        DECLE   $0018,  $0009,  $0009,  $0018   ; D1B8   0018 0009 0009 0018
        DECLE   $000B,  $0009,  $0018,  $001A   ; D1BC   000B 0009 0018 001A
        DECLE   $0002,  $0008,  $0006,  $0004   ; D1C0   0002 0008 0006 0004
        DECLE   $0008,  $0001,  $000B,  $0009   ; D1C4   0008 0001 000B 0009
        DECLE   $0018,  $0018,  $0009,  $0009   ; D1C8   0018 0018 0009 0009
        DECLE   $0018,  $0018,  $0009,  $000E   ; D1CC   0018 0018 0009 000E
        DECLE   $0009,  $0019,  $0019,  $0018   ; D1D0   0009 0019 0019 0018
        DECLE   $0006,  $0018,  $0018,  $0018   ; D1D4   0006 0018 0018 0018
        DECLE   $000E,  $0009,  $0009,  $0018   ; D1D8   000E 0009 0009 0018
        DECLE   $000E,  $0009,  $000E,  $0018   ; D1DC   000E 0009 000E 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D1E0   0018 0018 0018 0018
        DECLE   $0014,  $0018,  $0038,  $0018   ; D1E4   0014 0018 0038 0018
        DECLE   $0006,  $0018,  $0018,  $0018   ; D1E8   0006 0018 0018 0018
        DECLE   $0018,  $001A,  $000E,  $0009   ; D1EC   0018 001A 000E 0009
        DECLE   $0009,  $0009,  $0018,  $000E   ; D1F0   0009 0009 0018 000E
        DECLE   $0018,  $0018,  $0018,  $0018   ; D1F4   0018 0018 0018 0018
        DECLE   $0002,  $0005,  $0005,  $0008   ; D1F8   0002 0005 0005 0008
        DECLE   $0006,  $0004,  $0003,  $0019   ; D1FC   0006 0004 0003 0019
        DECLE   $0019,  $0014,  $0014,  $000E   ; D200   0019 0014 0014 000E
        DECLE   $0009,  $0018,  $0018,  $0018   ; D204   0009 0018 0018 0018
        DECLE   $0018,  $0009,  $000E,  $0009   ; D208   0018 0009 000E 0009
        DECLE   $0006,  $0014,  $0014,  $0018   ; D20C   0006 0014 0014 0018
        DECLE   $000E,  $0009,  $0000,  $0004   ; D210   000E 0009 0000 0004
        DECLE   $0005,  $0005,  $0003,  $0014   ; D214   0005 0005 0003 0014
        DECLE   $0009,  $0009,  $0018,  $0018   ; D218   0009 0009 0018 0018
        DECLE   $0009,  $000B,  $0009,  $0009   ; D21C   0009 000B 0009 0009
        DECLE   $0006,  $0018,  $0018,  $0018   ; D220   0006 0018 0018 0018
        DECLE   $0018,  $000E,  $000B,  $0009   ; D224   0018 000E 000B 0009
        DECLE   $0018,  $0009,  $0006,  $0018   ; D228   0018 0009 0006 0018
        DECLE   $0014,  $0014,  $0018,  $0018   ; D22C   0014 0014 0018 0018
        DECLE   $000E,  $0009,  $0018,  $0002   ; D230   000E 0009 0018 0002
        DECLE   $0001,  $000E,  $0009,  $0018   ; D234   0001 000E 0009 0018
        DECLE   $0036,  $0018,  $0009,  $0018   ; D238   0036 0018 0009 0018
        DECLE   $0002,  $0008,  $0001,  $0018   ; D23C   0002 0008 0001 0018
        DECLE   $0018,  $0014,  $0009,  $0018   ; D240   0018 0014 0009 0018
        DECLE   $0009,  $0018,  $0018,  $0006   ; D244   0009 0018 0018 0006
        DECLE   $0009,  $0018,  $0018,  $0018   ; D248   0009 0018 0018 0018
        DECLE   $0018,  $0002,  $0005,  $0008   ; D24C   0018 0002 0005 0008
        DECLE   $0001,  $0037,  $0037,  $0019   ; D250   0001 0037 0037 0019
        DECLE   $0019,  $0019,  $0018,  $0018   ; D254   0019 0019 0018 0018
        DECLE   $0018,  $0018,  $0036,  $0006   ; D258   0018 0018 0036 0006
        DECLE   $0036,  $0002,  $0005,  $0005   ; D25C   0036 0002 0005 0005
        DECLE   $0008,  $0001,  $0018,  $0018   ; D260   0008 0001 0018 0018
        DECLE   $0037,  $0018,  $001A,  $001B   ; D264   0037 0018 001A 001B
        DECLE   $001D,  $001B,  $001E,  $0018   ; D268   001D 001B 001E 0018
        DECLE   $0009,  $000E,  $0009,  $0006   ; D26C   0009 000E 0009 0006
        DECLE   $0018,  $0006,  $0018,  $0018   ; D270   0018 0006 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D274   0018 0018 0018 0018
        DECLE   $0018,  $0036,  $0018,  $0037   ; D278   0018 0036 0018 0037
        DECLE   $0036,  $0018,  $0036,  $0018   ; D27C   0036 0018 0036 0018
        DECLE   $0018,  $0009,  $000B,  $0000   ; D280   0018 0009 000B 0000
        DECLE   $0008,  $0006,  $0018,  $0037   ; D284   0008 0006 0018 0037
        DECLE   $0018,  $0018,  $0018,  $0018   ; D288   0018 0018 0018 0018
        DECLE   $0009,  $0009,  $0018,  $0018   ; D28C   0009 0009 0018 0018
        DECLE   $0037,  $000E,  $0009,  $0009   ; D290   0037 000E 0009 0009
        DECLE   $0018,  $0036,  $0009,  $0009   ; D294   0018 0036 0009 0009
        DECLE   $000E,  $0000,  $0004,  $0005   ; D298   000E 0000 0004 0005
        DECLE   $0003,  $0037,  $0037,  $000E   ; D29C   0003 0037 0037 000E
        DECLE   $0009,  $0036,  $000E,  $0009   ; D2A0   0009 0036 000E 0009
        DECLE   $0036,  $0018,  $0018,  $0018   ; D2A4   0036 0018 0018 0018
        DECLE   $0019,  $0019,  $0019,  $0019   ; D2A8   0019 0019 0019 0019
        DECLE   $0037,  $0018,  $0037,  $0037   ; D2AC   0037 0018 0037 0037
        DECLE   $0006,  $0018,  $0018,  $0009   ; D2B0   0006 0018 0018 0009
        DECLE   $0009,  $0036,  $0037,  $0018   ; D2B4   0009 0036 0037 0018
        DECLE   $0018,  $0018,  $0036,  $0036   ; D2B8   0018 0018 0036 0036
        DECLE   $001D,  $001D,  $001B,  $001B   ; D2BC   001D 001D 001B 001B
        DECLE   $001E,  $0036,  $0037,  $0018   ; D2C0   001E 0036 0037 0018
        DECLE   $0006,  $0018,  $0018,  $0018   ; D2C4   0006 0018 0018 0018
        DECLE   $0036,  $0018,  $0018,  $0018   ; D2C8   0036 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D2CC   0018 0018 0018 0018
        DECLE   $0009,  $0018,  $0018,  $0018   ; D2D0   0009 0018 0018 0018
        DECLE   $0018,  $001A,  $0018,  $0018   ; D2D4   0018 001A 0018 0018
        DECLE   $0006,  $000E,  $0009,  $0018   ; D2D8   0006 000E 0009 0018
        DECLE   $0018,  $0018,  $0018,  $0014   ; D2DC   0018 0018 0018 0014
        DECLE   $0009,  $000E,  $0018,  $0018   ; D2E0   0009 000E 0018 0018
        DECLE   $0009,  $0009,  $0018,  $0019   ; D2E4   0009 0009 0018 0019
        DECLE   $0019,  $0018,  $0002,  $0008   ; D2E8   0019 0018 0002 0008
        DECLE   $0006,  $0004                   ; D2EC   0006 0004

        DIS                                     ; D2EE   0003
        COMR    R0                              ; D2EF   0018
        COMR    R0                              ; D2F0   0018
        COMR    R0                              ; D2F1   0018
        DECR    R4                              ; D2F2   0014
        DECR    R4                              ; D2F3   0014
        INCR    R1                              ; D2F4   0009
        INCR    R1                              ; D2F5   0009
        COMR    R0                              ; D2F6   0018
        COMR    R0                              ; D2F7   0018
        INCR    R1                              ; D2F8   0009
        INCR    R3                              ; D2F9   000B
        INCR    R1                              ; D2FA   0009
        INCR    R1                              ; D2FB   0009
        COMR    R0                              ; D2FC   0018
        COMR    R0                              ; D2FD   0018
        CLRC                                    ; D2FE   0006
        COMR    R0                              ; D2FF   0018
        COMR    R0                              ; D300   0018
        COMR    R0                              ; D301   0018
        CLRC                                    ; D302   0006
        DECR    R4                              ; D303   0014
        COMR    R0                              ; D304   0018
        INCR    R1                              ; D305   0009
        INCR    R1                              ; D306   0009
        INCR    R1                              ; D307   0009
        INCR    R1                              ; D308   0009
        COMR    R0                              ; D309   0018
        COMR    R0                              ; D30A   0018
        COMR    R0                              ; D30B   0018
        INCR    R1                              ; D30C   0009
        INCR    R7                              ; D30D   000F

        INCR    R1                              ; D30E   0009
L_D30F:
        EIS                                     ; D30F   0002
        DECLE   $0005,  $0008,  $0001,  $0018   ; D310   0005 0008 0001 0018
        DECLE   $0018,  $0018,  $0006,  $0018   ; D314   0018 0018 0006 0018
        DECLE   $0018,  $0009,  $0009,  $0019   ; D318   0018 0009 0009 0019
        DECLE   $0019,  $0018,  $0037,  $0037   ; D31C   0019 0018 0037 0037

        INCR    R7                              ; D320   000F

        INCR    R1                              ; D321   0009
L_D322:
        INCR    R6                              ; D322   000E
        DECLE   $0006,  $0018,  $0018,  $0018   ; D323   0006 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0006   ; D327   0018 0018 0018 0006
        DECLE   $0018,  $0036,  $0036,  $001A   ; D32B   0018 0036 0036 001A
        DECLE   $0018,  $0036,  $0018,  $0018   ; D32F   0018 0036 0018 0018
        DECLE   $0018,  $000E,  $0009,  $0014   ; D333   0018 000E 0009 0014
        DECLE   $0006,  $0018,  $0018,  $0018   ; D337   0006 0018 0018 0018
        DECLE   $0018,  $001A,  $0018,  $0000   ; D33B   0018 001A 0018 0000
        DECLE   $0004,  $0005,  $0003,  $0018   ; D33F   0004 0005 0003 0018
        DECLE   $0018,  $0018,  $0018,  $0019   ; D343   0018 0018 0018 0019
        DECLE   $0019,  $0014,  $0014,  $0018   ; D347   0019 0014 0014 0018
        DECLE   $0006,  $0018,  $0019,  $0019   ; D34B   0006 0018 0019 0019
        DECLE   $0019,  $0014,  $0014,  $0018   ; D34F   0019 0014 0014 0018
        DECLE   $0018,  $0018,  $0000,  $0004   ; D353   0018 0018 0000 0004
        DECLE   $0003,  $0018,  $0018,  $0018   ; D357   0003 0018 0018 0018
        DECLE   $0018,  $0037,  $0018,  $0018   ; D35B   0018 0037 0018 0018
        DECLE   $0006,  $0036,  $0018,  $0014   ; D35F   0006 0036 0018 0014
        DECLE   $0014,  $0014,  $0018,  $0018   ; D363   0014 0014 0018 0018
        DECLE   $0038,  $0018,  $0018,  $0018   ; D367   0038 0018 0018 0018
        DECLE   $0006,  $0018,  $0018,  $0018   ; D36B   0006 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $000E   ; D36F   0018 0018 0018 000E
        DECLE   $0000,  $0004,  $0003,  $0014   ; D373   0000 0004 0003 0014
        DECLE   $0018,  $0018,  $0018,  $0002   ; D377   0018 0018 0018 0002
        DECLE   $0005,  $0005,  $0005,  $0008   ; D37B   0005 0005 0005 0008
        DECLE   $0001,  $0009,  $0018,  $0018   ; D37F   0001 0009 0018 0018
        DECLE   $0036,  $0018,  $0009,  $0038   ; D383   0036 0018 0009 0038
        DECLE   $0038,  $0018,  $0000,  $0004   ; D387   0038 0018 0000 0004
        DECLE   $0005,  $0003,  $0018,  $0006   ; D38B   0005 0003 0018 0006
        DECLE   $0018,  $0018,  $0018,  $000E   ; D38F   0018 0018 0018 000E
        DECLE   $0009,  $000E,  $0018,  $0018   ; D393   0009 000E 0018 0018
        DECLE   $0018,  $0009,  $0014,  $0014   ; D397   0018 0009 0014 0014
        DECLE   $0018,  $0018,  $0018,  $0018   ; D39B   0018 0018 0018 0018
        DECLE   $0018,  $0006,  $0008,  $0001   ; D39F   0018 0006 0008 0001
        DECLE   $0018,  $0014,  $0014,  $000E   ; D3A3   0018 0014 0014 000E
        DECLE   $0009,  $0018,  $0018,  $0038   ; D3A7   0009 0018 0018 0038
        DECLE   $0038,  $0009,  $0009,  $0009   ; D3AB   0038 0009 0009 0009
        DECLE   $0018,  $0009,  $0014,  $0018   ; D3AF   0018 0009 0014 0018
        DECLE   $0018,  $0006,  $0014,  $0018   ; D3B3   0018 0006 0014 0018
        DECLE   $0018,  $0009,  $0009,  $0018   ; D3B7   0018 0009 0009 0018
        DECLE   $0018,  $0038,  $0018,  $0018   ; D3BB   0018 0038 0018 0018
        DECLE   $0018,  $0018,  $0009,  $0018   ; D3BF   0018 0018 0009 0018
        DECLE   $0018,  $0018,  $0018,  $0038   ; D3C3   0018 0018 0018 0038
        DECLE   $0018,  $0006,  $0009,  $0009   ; D3C7   0018 0006 0009 0009
        DECLE   $0018,  $0018,  $0018,  $0018   ; D3CB   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0009   ; D3CF   0018 0018 0018 0009
        DECLE   $0009,  $0009,  $0009,  $0009   ; D3D3   0009 0009 0009 0009
        DECLE   $0018,  $0018,  $0002,  $0005   ; D3D7   0018 0018 0002 0005
        DECLE   $0008,  $0001,  $0018,  $0009   ; D3DB   0008 0001 0018 0009
        DECLE   $0036,  $0036,  $0018,  $0018   ; D3DF   0036 0036 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0009   ; D3E3   0018 0018 0018 0009
        DECLE   $0036,  $000E,  $0018,  $0018   ; D3E7   0036 000E 0018 0018
        DECLE   $001A,  $0018,  $0006,  $0018   ; D3EB   001A 0018 0006 0018
        DECLE   $0018,  $0018,  $0009,  $0037   ; D3EF   0018 0018 0009 0037
        DECLE   $0018,  $0018,  $0018,  $0018   ; D3F3   0018 0018 0018 0018
        DECLE   $001A,  $000E,  $0009,  $0009   ; D3F7   001A 000E 0009 0009
        DECLE   $003A,  $0018,  $0019,  $0019   ; D3FB   003A 0018 0019 0019
        DECLE   $0018,  $0018,  $0006,  $0004   ; D3FF   0018 0018 0006 0004
        DECLE   $0003,  $0018,  $0038,  $0018   ; D403   0003 0018 0038 0018
        DECLE   $0036,  $0019,  $0019,  $0019   ; D407   0036 0019 0019 0019
        DECLE   $003A,  $003A,  $0028,  $003B   ; D40B   003A 003A 0028 003B
        DECLE   $003B,  $001A,  $0009,  $0018   ; D40F   003B 001A 0009 0018
        DECLE   $0002,  $0008,  $0001,  $0014   ; D413   0002 0008 0001 0014
        DECLE   $0006,  $003A,  $003A,  $003A   ; D417   0006 003A 003A 003A
        DECLE   $0028,  $003B,  $003C,  $003B   ; D41B   0028 003B 003C 003B
        DECLE   $003C,  $003C,  $003B,  $003B   ; D41F   003C 003C 003B 003B
        DECLE   $003C,  $0005,  $0005,  $0008   ; D423   003C 0005 0005 0008
        DECLE   $0001,  $0014,  $0014,  $0028   ; D427   0001 0014 0014 0028
        DECLE   $003B,  $003B,  $003C,  $003B   ; D42B   003B 003B 003C 003B
        DECLE   $003B,  $003B,  $003B,  $003C   ; D42F   003B 003B 003B 003C
        DECLE   $003B,  $003C,  $0031,  $0039   ; D433   003B 003C 0031 0039
        DECLE   $0039,  $0009,  $0009,  $003A   ; D437   0039 0009 0009 003A
        DECLE   $003A,  $003A,  $0028,  $003B   ; D43B   003A 003A 0028 003B
        DECLE   $003C,  $003C,  $003B,  $003B   ; D43F   003C 003C 003B 003B
        DECLE   $0031,  $0039,  $0039,  $0039   ; D443   0031 0039 0039 0039
        DECLE   $0039,  $0039,  $0018,  $0036   ; D447   0039 0039 0018 0036
        DECLE   $000E,  $003B,  $003B,  $003C   ; D44B   000E 003B 003B 003C
        DECLE   $003B,  $003C,  $003C,  $003B   ; D44F   003B 003C 003C 003B
        DECLE   $0031,  $0039,  $0039,  $0006   ; D453   0031 0039 0039 0006
        DECLE   $0018,  $0038,  $0038,  $0018   ; D457   0018 0038 0038 0018
        DECLE   $0018,  $0018,  $0018,  $0036   ; D45B   0018 0018 0018 0036
        DECLE   $0014,  $003C,  $003B,  $003B   ; D45F   0014 003C 003B 003B
        DECLE   $003C,  $003B,  $003C,  $0031   ; D463   003C 003B 003C 0031
        DECLE   $0018,  $0018,  $0018,  $0000   ; D467   0018 0018 0018 0000
        DECLE   $0004,  $0003,  $0018,  $0018   ; D46B   0004 0003 0018 0018
        DECLE   $0014,  $0018,  $0014,  $0014   ; D46F   0014 0018 0014 0014
        DECLE   $0018,  $0039,  $0039,  $0039   ; D473   0018 0039 0039 0039
        DECLE   $0039,  $0039,  $0039,  $0018   ; D477   0039 0039 0039 0018
        DECLE   $0036,  $0018,  $0037,  $0037   ; D47B   0036 0018 0037 0037
        DECLE   $0036,  $0006,  $0018,  $0018   ; D47F   0036 0006 0018 0018
        DECLE   $0018,  $0014,  $0014,  $0018   ; D483   0018 0014 0014 0018
        DECLE   $0018,  $000E,  $0009,  $0018   ; D487   0018 000E 0009 0018
        DECLE   $0018,  $0018,  $0018,  $0037   ; D48B   0018 0018 0018 0037
        DECLE   $0037,  $0002,  $0005,  $0005   ; D48F   0037 0002 0005 0005
        DECLE   $0008,  $0001,  $0018,  $0018   ; D493   0008 0001 0018 0018
        DECLE   $0018,  $0018,  $0019,  $0019   ; D497   0018 0018 0019 0019
        DECLE   $0018,  $000A,  $0009,  $0009   ; D49B   0018 000A 0009 0009
        DECLE   $0009,  $0018,  $0018,  $0018   ; D49F   0009 0018 0018 0018
        DECLE   $0018,  $0006,  $0018,  $0018   ; D4A3   0018 0006 0018 0018
        DECLE   $0018,  $0018,  $0018,  $000E   ; D4A7   0018 0018 0018 000E
        DECLE   $0009,  $0009,  $0037,  $0018   ; D4AB   0009 0009 0037 0018
        DECLE   $0018,  $0018,  $0018,  $000E   ; D4AF   0018 0018 0018 000E
        DECLE   $0009,  $0018,  $0018,  $0014   ; D4B3   0009 0018 0018 0014
        DECLE   $0014,  $0006,  $0018,  $0018   ; D4B7   0014 0006 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0014   ; D4BB   0018 0018 0018 0014
        DECLE   $0014,  $0018,  $0018,  $0018   ; D4BF   0014 0018 0018 0018
        DECLE   $0018,  $000E,  $0009,  $0018   ; D4C3   0018 000E 0009 0018
        DECLE   $0018,  $0002,  $0005,  $0005   ; D4C7   0018 0002 0005 0005
        DECLE   $0008,  $0006,  $0009,  $0018   ; D4CB   0008 0006 0009 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D4CF   0018 0018 0018 0018
        DECLE   $0018,  $0014,  $0018,  $0018   ; D4D3   0018 0014 0018 0018
        DECLE   $0018,  $0009,  $0018,  $0014   ; D4D7   0018 0009 0018 0014
        DECLE   $0014,  $0006,  $0009,  $0018   ; D4DB   0014 0006 0009 0018
        DECLE   $0018,  $0000,  $0004,  $0005   ; D4DF   0018 0000 0004 0005

        DIS                                     ; D4E3   0003
        COMR    R0                              ; D4E4   0018
        COMR    R0                              ; D4E5   0018
        DECR    R4                              ; D4E6   0014
        DECR    R4                              ; D4E7   0014
        DECR    R4                              ; D4E8   0014
        COMR    R0                              ; D4E9   0018
        DECR    R4                              ; D4EA   0014
        INCR    R6                              ; D4EB   000E
        INCR    R7                              ; D4EC   000F

        INCR    R1                              ; D4ED   0009
L_D4EE:
        INCR    R6                              ; D4EE   000E
        DECLE   $0014,  $0006,  $0018,  $0018   ; D4EF   0014 0006 0018 0018
        DECLE   $0018,  $0018,  $0009,  $0009   ; D4F3   0018 0018 0009 0009
        DECLE   $0006,  $0014,  $0014,  $000E   ; D4F7   0006 0014 0014 000E
        DECLE   $0009,  $0014,  $0014,  $000E   ; D4FB   0009 0014 0014 000E
        DECLE   $0009,  $000A,  $0009,  $000B   ; D4FF   0009 000A 0009 000B
        DECLE   $0009,  $0006,  $0018,  $0002   ; D503   0009 0006 0018 0002
        DECLE   $0005,  $0005,  $0005,  $0008   ; D507   0005 0005 0005 0008
        DECLE   $0001                           ; D50B   0001

        COMR    R0                              ; D50C   0018
        DECR    R4                              ; D50D   0014
        INCR    R1                              ; D50E   0009
        DECR    R3                              ; D50F   0013
        INCR    R1                              ; D510   0009
        INCR    R6                              ; D511   000E
        INCR    R3                              ; D512   000B
        INCR    R3                              ; D513   000B
        INCR    R7                              ; D514   000F

        INCR    R3                              ; D515   000B
L_D516:
        INCR    R4                              ; D516   000C
        DECLE   $0009,  $0000,  $0004           ; D517   0009 0000 0004

        CLRC                                    ; D51A   0006
        COMR    R0                              ; D51B   0018
        COMR    R0                              ; D51C   0018
        COMR    R0                              ; D51D   0018
        COMR    R0                              ; D51E   0018
        INCR    R1                              ; D51F   0009
        INCR    R1                              ; D520   0009
        INCR    R6                              ; D521   000E
        DECR    R3                              ; D522   0013
        DECR    R5                              ; D523   0015
        DECR    R3                              ; D524   0013
        DECR    R3                              ; D525   0013
        INCR    R3                              ; D526   000B
        INCR    R7                              ; D527   000F

        INCR    R1                              ; D528   0009
L_D529:
        DECR    R3                              ; D529   0013
        DECLE   $0013,  $000B,  $000B,  $0009   ; D52A   0013 000B 000B 0009
        DECLE   $0000,  $0004,  $0003,  $0018   ; D52E   0000 0004 0003 0018
        DECLE   $0009,  $000B,  $0009,  $0013   ; D532   0009 000B 0009 0013
        DECLE   $0015,  $0013,  $000A,  $0013   ; D536   0015 0013 000A 0013
        DECLE   $0013,  $0013,  $000B,  $0013   ; D53A   0013 0013 000B 0013
        DECLE   $0013,  $0013,  $0013,  $0013   ; D53E   0013 0013 0013 0013
        DECLE   $0009,  $0009,  $0006,  $0009   ; D542   0009 0009 0006 0009
        DECLE   $000B,  $000C,  $0013,  $0013   ; D546   000B 000C 0013 0013
        DECLE   $0013,  $0009,  $000A,  $000B   ; D54A   0013 0009 000A 000B
        DECLE   $0013,  $000C,  $000E,  $0009   ; D54E   0013 000C 000E 0009
        DECLE   $000B,  $0013,  $0015,  $0013   ; D552   000B 0013 0015 0013
        DECLE   $0013,  $0009,  $0006,  $0009   ; D556   0013 0009 0006 0009
        DECLE   $0009,  $000A,  $001F           ; D55A   0009 000A 001F

        INCR    R2                              ; D55D   000A
        INCR    R1                              ; D55E   0009
        INCR    R1                              ; D55F   0009
        INCR    R2                              ; D560   000A
        INCR    R2                              ; D561   000A
        INCR    R1                              ; D562   0009
        INCR    R1                              ; D563   0009
        DECR    R0                              ; D564   0010
        DECR    R2                              ; D565   0012
        DECR    R0                              ; D566   0010
        DECR    R0                              ; D567   0010
        DECR    R2                              ; D568   0012
        DECR    R0                              ; D569   0010
        DECR    R0                              ; D56A   0010
        DECR    R2                              ; D56B   0012
        DECR    R2                              ; D56C   0012
        DECR    R0                              ; D56D   0010
        DECR    R0                              ; D56E   0010
        NEGR    R1                              ; D56F   0021
        NEGR    R0                              ; D570   0020
        NEGR    R1                              ; D571   0021
        DECR    R2                              ; D572   0012
        DECR    R2                              ; D573   0012
        DECR    R0                              ; D574   0010
        DECR    R2                              ; D575   0012
        DECR    R2                              ; D576   0012
        DECR    R0                              ; D577   0010
L_D578:
        DECR    R7                              ; D578   0017
L_D579:
        DECR    R7                              ; D579   0017
L_D57A:
        DECR    R7                              ; D57A   0017
L_D57B:
        DECR    R7                              ; D57B   0017
L_D57C:
        DECR    R7                              ; D57C   0017
L_D57D:
        DECR    R7                              ; D57D   0017
L_D57E:
        DECR    R7                              ; D57E   0017
L_D57F:
        DECR    R7                              ; D57F   0017
L_D580:
        DECR    R7                              ; D580   0017
L_D581:
        DECR    R7                              ; D581   0017
L_D582:
        DECR    R7                              ; D582   0017
L_D583:
        DECR    R7                              ; D583   0017
L_D584:
        DECR    R7                              ; D584   0017
L_D585:
        DECR    R7                              ; D585   0017
L_D586:
        DECR    R7                              ; D586   0017
L_D587:
        DECR    R7                              ; D587   0017
L_D588:
        DECR    R7                              ; D588   0017
L_D589:
        DECR    R7                              ; D589   0017
L_D58A:
        DECR    R7                              ; D58A   0017
L_D58B:
        DECR    R7                              ; D58B   0017

        DECR    R2                              ; D58C   0012
        DECR    R0                              ; D58D   0010
        DECR    R2                              ; D58E   0012
        DECR    R2                              ; D58F   0012
        DECR    R2                              ; D590   0012
        DECR    R0                              ; D591   0010
        DECR    R2                              ; D592   0012
        DECR    R2                              ; D593   0012
        DECR    R0                              ; D594   0010
        DECR    R2                              ; D595   0012
        DECR    R0                              ; D596   0010
        DECR    R2                              ; D597   0012
        DECR    R0                              ; D598   0010
        DECR    R0                              ; D599   0010
        DECR    R2                              ; D59A   0012
        DECR    R0                              ; D59B   0010
        DECR    R2                              ; D59C   0012
        DECR    R2                              ; D59D   0012
        DECR    R0                              ; D59E   0010
        DECR    R0                              ; D59F   0010
L_D5A0:
        PSHR    R5                              ; D5A0   0275
        MVII    #$01B9, R4                      ; D5A1   02BC 01B9
        MVII    #$01C2, R5                      ; D5A3   02BD 01C2
L_D5A5:
        MVI@    R4,     R0                      ; D5A5   02A0
        SWAP    R0,     1                       ; D5A6   0040
        SAR     R0,     2                       ; D5A7   006C
        SAR     R0,     2                       ; D5A8   006C
        MVI     G_01C1, R3                      ; D5A9   0283 01C1
        TSTR    R3                              ; D5AB   009B
        BNEQ    L_D5AF                          ; D5AC   020C 0001

        SAR     R0,     1                       ; D5AE   0068
L_D5AF:
        MOVR    R4,     R3                      ; D5AF   00A3
        SDBD                                    ; D5B0   0001
        ADD@    R4,     R0                      ; D5B1   02E0
        MVO@    R0,     R3                      ; D5B2   0258
        SWAP    R0,     1                       ; D5B3   0040
        MOVR    R0,     R2                      ; D5B4   0082
        INCR    R3                              ; D5B5   000B
        SUB@    R3,     R0                      ; D5B6   0318
        MOVR    R2,     R1                      ; D5B7   0091
        ANDI    #$0007, R1                      ; D5B8   03B9 0007
        MVO@    R1,     R3                      ; D5BA   0259
        XORR    R1,     R2                      ; D5BB   01CA
        MVO@    R2,     R5                      ; D5BC   026A
        INCR    R5                              ; D5BD   000D
        MVO@    R2,     R5                      ; D5BE   026A
        ADDI    #$0003, R5                      ; D5BF   02FD 0003
        SUBR    R0,     R2                      ; D5C1   0102
        MVO@    R2,     R5                      ; D5C2   026A
        INCR    R5                              ; D5C3   000D
        MVO@    R2,     R5                      ; D5C4   026A
        SUBI    #$0006, R5                      ; D5C5   033D 0006
        CMPI    #$01C8, R5                      ; D5C7   037D 01C8
        BNEQ    L_D5A5                          ; D5C9   022C 0025

        MVII    #$0003, R5                      ; D5CB   02BD 0003
        MVO     R5,     G_01CE                  ; D5CD   0245 01CE
        MVII    #$0100, R5                      ; D5CF   02BD 0100
        MVI@    R5,     R0                      ; D5D1   02A8
        MVO@    R0,     R4                      ; D5D2   0260
        MVI@    R5,     R0                      ; D5D3   02A8
        MVO@    R0,     R4                      ; D5D4   0260
        MVII    #$00FC, R0                      ; D5D5   02B8 00FC
        MVII    #$00D5, R1                      ; D5D7   02B9 00D5
        MVO     R0,     .ISRVEC.0               ; D5D9   0240 0100
        MVO     R1,     .ISRVEC.1               ; D5DB   0241 0101
L_D5DD:
        EIS                                     ; D5DD   0002
        MVI     G_01CE, R2                      ; D5DE   0282 01CE
        SARC    R2,     2                       ; D5E0   007E
        BNC     L_D5F6                          ; D5E1   0209 0013
        BOV     L_D5DD                          ; D5E3   0222 0007

        JSR     R5,     L_6BC9                  ; D5E5   0004 0168 03C9

        MVII    #$0003, R2                      ; D5E8   02BA 0003
        MVO     R2,     G_01CE                  ; D5EA   0242 01CE
        MVII    #$0030, R0                      ; D5EC   02B8 0030
        MVII    #$00D6, R1                      ; D5EE   02B9 00D6
        MVO     R0,     .ISRVEC.0               ; D5F0   0240 0100
        MVO     R1,     .ISRVEC.1               ; D5F2   0241 0101
        B       L_D5DD                          ; D5F4   0220 0018
L_D5F6:
        BNOV    L_D5FB                          ; D5F6   020A 0003

        JSR     R5,     L_6BC9                  ; D5F8   0004 0168 03C9

L_D5FB:
        PULR    R7                              ; D5FB   02B7

        PSHR    R5                              ; D5FC   0275
        MVI     G_01C2, R4                      ; D5FD   0284 01C2
        TSTR    R4                              ; D5FF   00A4
        BEQ     L_D607                          ; D600   0204 0005

        MVI     G_01C5, R4                      ; D602   0284 01C5
        TSTR    R4                              ; D604   00A4
        BNEQ    L_D625                          ; D605   020C 001E

L_D607:
        JSR     R5,     L_D6F3                  ; D607   0004 01D4 02F3

        MVI     G_01BB, R0                      ; D60A   0280 01BB
        MVO     R0,     .STIC.HDLY              ; D60C   0240 0030
        MVI     G_01BE, R0                      ; D60E   0280 01BE
        MVO     R0,     .STIC.VDLY              ; D610   0240 0031

        JSR     R5,     L_D656                  ; D612   0004 01D4 0256

        CLRR    R2                              ; D615   01D2
        SUBI    #$0008, R2                      ; D616   033A 0008

        JSR     R5,     L_D662                  ; D618   0004 01D4 0262
        JSR     R5,     L_D695                  ; D61B   0004 01D4 0295

        TSTR    R2                              ; D61E   0092
        BMI     L_D63A                          ; D61F   020B 0019

        MVII    #$0002, R0                      ; D621   02B8 0002
        B       L_D63A                          ; D623   0200 0015

L_D625:
        NEGR    R4                              ; D625   0024

        JSR     R5,     L_D642                  ; D626   0004 01D4 0242
        JSR     R5,     L_D662                  ; D629   0004 01D4 0262

        MVII    #$0001, R0                      ; D62C   02B8 0001
        B       L_D63A                          ; D62E   0200 000A

        PSHR    R5                              ; D630   0275
        MOVR    R6,     R4                      ; D631   00B4

        JSR     R5,     L_D642                  ; D632   0004 01D4 0242
        JSR     R5,     L_D695                  ; D635   0004 01D4 0295

        MVII    #$0002, R0                      ; D638   02B8 0002
L_D63A:
        SLL     R2,     2                       ; D63A   004E
        XORR    R0,     R2                      ; D63B   01C2
        MVO     R2,     G_01CE                  ; D63C   0242 01CE

        JSR     R5,     X_PLAY_NOTE             ; D63E   0004 0118 02BD

        PULR    R7                              ; D641   02B7

L_D642:
        PSHR    R5                              ; D642   0275
        PSHR    R4                              ; D643   0274

        JSR     R5,     L_D6F3                  ; D644   0004 01D4 02F3

        PULR    R4                              ; D647   02B4
        TSTR    R4                              ; D648   00A4
        BGT     L_D64F                          ; D649   020E 0004

        MVI     G_01BB, R0                      ; D64B   0280 01BB
        MVO     R0,     .STIC.HDLY              ; D64D   0240 0030
L_D64F:
        BMI     L_D655                          ; D64F   020B 0004

        MVI     G_01BE, R0                      ; D651   0280 01BE
        MVO     R0,     .STIC.VDLY              ; D653   0240 0031
L_D655:
        INCR    R7                              ; D655   000F

L_D656:
        PSHR    R5                              ; D656   0275
L_D657:
        MVO     R0,     .STIC.VIDEN             ; D657   0240 0020
        MVI     G_01BF, R0                      ; D659   0280 01BF
        MVI     G_01C0, R1                      ; D65B   0281 01C0
        MVO     R0,     .ISRVEC.0               ; D65D   0240 0100
        MVO     R1,     .ISRVEC.1               ; D65F   0241 0101
        PULR    R7                              ; D661   02B7

L_D662:
        PSHR    R5                              ; D662   0275
        MVI     G_01C2, R0                      ; D663   0280 01C2
        SWAP    R0,     2                       ; D665   0044
        BEQ     L_D694                          ; D666   0204 002C
        BPL     L_D67E                          ; D668   0203 0014

        MVII    #$0200, R5                      ; D66A   02BD 0200
        MVII    #$0201, R4                      ; D66C   02BC 0201
        CLRR    R2                              ; D66E   01D2
L_D66F:
        MVII    #$0013, R3                      ; D66F   02BB 0013
L_D671:
        MVI@    R4,     R0                      ; D671   02A0
        MVO@    R0,     R5                      ; D672   0268
        DECR    R3                              ; D673   0013
        BNEQ    L_D671                          ; D674   022C 0004

        MVO@    R2,     R5                      ; D676   026A
        INCR    R4                              ; D677   000C
        CMPI    #$02E6, R4                      ; D678   037C 02E6
        BLT     L_D66F                          ; D67A   0225 000C
        B       L_D694                          ; D67C   0200 0016

L_D67E:
        MVII    #$0212, R5                      ; D67E   02BD 0212
        MVII    #$0003, R1                      ; D680   02B9 0003
        CLRR    R2                              ; D682   01D2
L_D683:
        MVII    #$0013, R3                      ; D683   02BB 0013
L_D685:
        MVI@    R5,     R0                      ; D685   02A8
        MVO@    R0,     R5                      ; D686   0268
        SUBR    R1,     R5                      ; D687   010D
        DECR    R3                              ; D688   0013
        BNEQ    L_D685                          ; D689   022C 0005

        INCR    R5                              ; D68B   000D
        MVO@    R2,     R5                      ; D68C   026A
        ADDI    #$0025, R5                      ; D68D   02FD 0025
        CMPI    #$02F0, R5                      ; D68F   037D 02F0
        BLT     L_D683                          ; D691   0225 000F

        INCR    R2                              ; D693   000A
L_D694:
        PULR    R7                              ; D694   02B7

L_D695:
        PSHR    R5                              ; D695   0275
        MVI     G_01C5, R0                      ; D696   0280 01C5
        SWAP    R0,     2                       ; D698   0044
        BEQ     L_D6F2                          ; D699   0204 0057
        BMI     L_D6E6                          ; D69B   020B 0049

        MVII    #$02DC, R5                      ; D69D   02BD 02DC
        MVII    #$0214, R4                      ; D69F   02BC 0214
        MVII    #$0200, R2                      ; D6A1   02BA 0200
        MVII    #$0014, R1                      ; D6A3   02B9 0014
        MVII    #$000A, R0                      ; D6A5   02B8 000A
L_D6A7:
        PSHR    R0                              ; D6A7   0270
        MVII    #$0004, R3                      ; D6A8   02BB 0004
L_D6AA:
        MVI@    R4,     R0                      ; D6AA   02A0
        MVO@    R0,     R5                      ; D6AB   0268
        MVI@    R4,     R0                      ; D6AC   02A0
        MVO@    R0,     R5                      ; D6AD   0268
        MVI@    R4,     R0                      ; D6AE   02A0
        MVO@    R0,     R5                      ; D6AF   0268
        MVI@    R4,     R0                      ; D6B0   02A0
        MVO@    R0,     R5                      ; D6B1   0268
        MVI@    R4,     R0                      ; D6B2   02A0
        MVO@    R0,     R5                      ; D6B3   0268
        DECR    R3                              ; D6B4   0013
        BNEQ    L_D6AA                          ; D6B5   022C 000C

        SUBR    R1,     R4                      ; D6B7   010C
        SUBR    R1,     R5                      ; D6B8   010D
        XORR    R2,     R5                      ; D6B9   01D5
        XORR    R5,     R2                      ; D6BA   01EA
        XORR    R2,     R5                      ; D6BB   01D5
        MVII    #$0004, R3                      ; D6BC   02BB 0004
L_D6BE:
        MVI@    R5,     R0                      ; D6BE   02A8
        MVO@    R0,     R4                      ; D6BF   0260
        MVI@    R5,     R0                      ; D6C0   02A8
        MVO@    R0,     R4                      ; D6C1   0260
        MVI@    R5,     R0                      ; D6C2   02A8
        MVO@    R0,     R4                      ; D6C3   0260
        MVI@    R5,     R0                      ; D6C4   02A8
        MVO@    R0,     R4                      ; D6C5   0260
        MVI@    R5,     R0                      ; D6C6   02A8
        MVO@    R0,     R4                      ; D6C7   0260
        DECR    R3                              ; D6C8   0013
        BNEQ    L_D6BE                          ; D6C9   022C 000C

        SUBR    R1,     R5                      ; D6CB   010D
        PULR    R0                              ; D6CC   02B0
        DECR    R0                              ; D6CD   0010
        BNEQ    L_D6A7                          ; D6CE   022C 0028

        XORR    R2,     R5                      ; D6D0   01D5
        XORR    R5,     R2                      ; D6D1   01EA
        XORR    R2,     R5                      ; D6D2   01D5
        MVII    #$0004, R3                      ; D6D3   02BB 0004
L_D6D5:
        MVI@    R5,     R0                      ; D6D5   02A8
        MVO@    R0,     R4                      ; D6D6   0260
        MVI@    R5,     R0                      ; D6D7   02A8
        MVO@    R0,     R4                      ; D6D8   0260
        MVI@    R5,     R0                      ; D6D9   02A8
        MVO@    R0,     R4                      ; D6DA   0260
        MVI@    R5,     R0                      ; D6DB   02A8
        MVO@    R0,     R4                      ; D6DC   0260
        MVI@    R5,     R0                      ; D6DD   02A8
        MVO@    R0,     R4                      ; D6DE   0260
        DECR    R3                              ; D6DF   0013
        BNEQ    L_D6D5                          ; D6E0   022C 000C

        MVII    #$0003, R2                      ; D6E2   02BA 0003
        B       L_D6F2                          ; D6E4   0200 000C

L_D6E6:
        MVII    #$0200, R5                      ; D6E6   02BD 0200
        MVII    #$0214, R4                      ; D6E8   02BC 0214
L_D6EA:
        MVI@    R4,     R0                      ; D6EA   02A0
        MVO@    R0,     R5                      ; D6EB   0268
        CMPI    #$02DC, R5                      ; D6EC   037D 02DC
        BNEQ    L_D6EA                          ; D6EE   022C 0005

        MVII    #$0002, R2                      ; D6F0   02BA 0002
L_D6F2:
        PULR    R7                              ; D6F2   02B7

L_D6F3:
        PSHR    R5                              ; D6F3   0275
        MVII    #$031D, R2                      ; D6F4   02BA 031D
        CLRR    R3                              ; D6F6   01DB
L_D6F7:
        MVII    #$01C8, R5                      ; D6F7   02BD 01C8
        MVI@    R2,     R0                      ; D6F9   0290
        SLL     R0,     1                       ; D6FA   0048
        BPL     L_D6FF                          ; D6FB   0203 0002

        MVII    #$01C2, R5                      ; D6FD   02BD 01C2
L_D6FF:
        ADDI    #$0002, R2                      ; D6FF   02FA 0002
        TSTR    R4                              ; D701   00A4
        BLE     L_D708                          ; D702   0206 0004

        ADDI    #$0003, R5                      ; D704   02FD 0003
        B       L_D716                          ; D706   0200 000E

L_D708:
        MVI@    R3,     R0                      ; D708   0298
        MOVR    R0,     R1                      ; D709   0081
        ANDI    #$00FF, R1                      ; D70A   03B9 00FF
        XORR    R1,     R0                      ; D70C   01C8
        ADD@    R5,     R1                      ; D70D   02E9
        ANDI    #$00FF, R1                      ; D70E   03B9 00FF
        XORR    R1,     R0                      ; D710   01C8
        MVO@    R0,     R3                      ; D711   0258
        MVI@    R2,     R0                      ; D712   0290
        SDBD                                    ; D713   0001
        ADD@    R5,     R0                      ; D714   02E8
        MVO@    R0,     R2                      ; D715   0250
L_D716:
        INCR    R2                              ; D716   000A
        TSTR    R4                              ; D717   00A4
        BMI     L_D72C                          ; D718   020B 0012

        XORI    #$0008, R3                      ; D71A   03FB 0008
        MVI@    R3,     R0                      ; D71C   0298
        MOVR    R0,     R1                      ; D71D   0081
        ANDI    #$007F, R1                      ; D71E   03B9 007F
        XORR    R1,     R0                      ; D720   01C8
        ADD@    R5,     R1                      ; D721   02E9
        ANDI    #$007F, R1                      ; D722   03B9 007F
        XORR    R1,     R0                      ; D724   01C8
        MVO@    R0,     R3                      ; D725   0258
        XORI    #$0008, R3                      ; D726   03FB 0008
        MVI@    R2,     R0                      ; D728   0290
        SDBD                                    ; D729   0001
        ADD@    R5,     R0                      ; D72A   02E8
        MVO@    R0,     R2                      ; D72B   0250
L_D72C:
        ADDI    #$0005, R2                      ; D72C   02FA 0005
        INCR    R3                              ; D72E   000B
        CMPI    #$0008, R3                      ; D72F   037B 0008
        BNEQ    L_D6F7                          ; D731   022C 003B
        PULR    R7                              ; D733   02B7

L_D734:
        PSHR    R5                              ; D734   0275
        MVI     G_016A, R0                      ; D735   0280 016A
        TSTR    R0                              ; D737   0080
        BNEQ    L_D743                          ; D738   020C 0009

        CLRR    R0                              ; D73A   01C0
        MVO     R0,     G_019A                  ; D73B   0240 019A
        INCR    R0                              ; D73D   0008
        MVO     R0,     G_018C                  ; D73E   0240 018C

        JSR     R5,     L_D770                  ; D740   0004 01D4 0370

L_D743:
        PULR    R7                              ; D743   02B7

L_D744:
        PSHR    R5                              ; D744   0275
        MVI     G_016A, R0                      ; D745   0280 016A
        TSTR    R0                              ; D747   0080
        BNEQ    L_D753                          ; D748   020C 0009

        CLRR    R0                              ; D74A   01C0
        MVO     R0,     G_018C                  ; D74B   0240 018C

        JSR     R5,     L_D754                  ; D74D   0004 01D4 0354
        JSR     R5,     L_D770                  ; D750   0004 01D4 0370

L_D753:
        PULR    R7                              ; D753   02B7

L_D754:
        PSHR    R5                              ; D754   0275
        MVII    #$000A, R0                      ; D755   02B8 000A

        JSR     R5,     X_RAND2                 ; D757   0004 0114 029E

        MVI     G_019D, R2                      ; D75A   0282 019D
        SLR     R2,     1                       ; D75C   0062
        CMPI    #$0004, R2                      ; D75D   037A 0004
        BLT     L_D76C                          ; D75F   0205 000B

        SUBI    #$0002, R2                      ; D761   033A 0002
        CMPR    R2,     R0                      ; D763   0150
        BGE     L_D76C                          ; D764   020D 0006

        MVII    #$0001, R0                      ; D766   02B8 0001
        MVO     R0,     G_019A                  ; D768   0240 019A
        B       L_D76F                          ; D76A   0200 0003

L_D76C:
        CLRR    R0                              ; D76C   01C0
        MVO     R0,     G_019A                  ; D76D   0240 019A
L_D76F:
        PULR    R7                              ; D76F   02B7

L_D770:
        PSHR    R5                              ; D770   0275
        MVI     G_015F, R0                      ; D771   0280 015F
        CMPI    #$0004, R0                      ; D773   0378 0004
        BNEQ    L_D77F                          ; D775   020C 0008

        MVI     G_015D, R0                      ; D777   0280 015D
        CMPI    #$00B4, R0                      ; D779   0378 00B4
        BGE     L_D77F                          ; D77B   020D 0002
        B       L_D7FF                          ; D77D   0200 0080

L_D77F:
        MVI     G_015F, R0                      ; D77F   0280 015F
        CMPI    #$0005, R0                      ; D781   0378 0005
        BEQ     L_D7FF                          ; D783   0204 007A

        MVI     G_015D, R2                      ; D785   0282 015D
        CMPI    #$00F0, R2                      ; D787   037A 00F0
        BLT     L_D7A1                          ; D789   0205 0016

        MVI     G_015E, R0                      ; D78B   0280 015E
        DECR    R0                              ; D78D   0010
        MVO     R0,     G_0164                  ; D78E   0240 0164
        SDBD                                    ; D790   0001
        MVII    #$6DA7, R4                      ; D791   02BC 00A7 006D
        ADD     G_019D, R4                      ; D794   02C4 019D
        SDBD                                    ; D796   0001
        MVI@    R4,     R3                      ; D797   02A3
        ADDR    R0,     R3                      ; D798   00C3
        MVI@    R3,     R4                      ; D799   029C
        MVO     R4,     G_0165                  ; D79A   0244 0165
        MOVR    R4,     R3                      ; D79C   00A3
        MVII    #$0002, R2                      ; D79D   02BA 0002
        B       L_D7AB                          ; D79F   0200 000A

L_D7A1:
        ADDI    #$0002, R2                      ; D7A1   02FA 0002
        MVI     G_015E, R0                      ; D7A3   0280 015E
        MVO     R0,     G_0164                  ; D7A5   0240 0164
        MVI     G_015F, R3                      ; D7A7   0283 015F
        MVO     R3,     G_0165                  ; D7A9   0243 0165
L_D7AB:
        SDBD                                    ; D7AB   0001
        MVII    #$1800, R1                      ; D7AC   02B9 0000 0018

        JSR     R5,     L_6D17                  ; D7AF   0004 016C 0117

        ADDR    R2,     R0                      ; D7B2   00D0
        MOVR    R0,     R4                      ; D7B3   0084
L_D7B4:
        MVI@    R4,     R0                      ; D7B4   02A0
        CMPI    #$0001, R0                      ; D7B5   0378 0001
        BLE     L_D7C4                          ; D7B7   0206 000B

        CMPI    #$0006, R0                      ; D7B9   0378 0006
        BEQ     L_D7C4                          ; D7BB   0204 0007

        SDBD                                    ; D7BD   0001
        ADDI    #$0800, R1                      ; D7BE   02F9 0000 0008
        INCR    R2                              ; D7C1   000A
        B       L_D7B4                          ; D7C2   0220 000F

L_D7C4:
        MVO     R2,     G_0163                  ; D7C4   0242 0163
        MVO     R1,     G_0337                  ; D7C6   0241 0337
        MVII    #$0335, R4                      ; D7C8   02BC 0335
        MVI     G_018C, R0                      ; D7CA   0280 018C
        TSTR    R0                              ; D7CC   0080
        BEQ     L_D7D4                          ; D7CD   0204 0005

        JSR     R5,     L_D800                  ; D7CF   0004 01D8 0000

        B       L_D7D7                          ; D7D2   0200 0003

L_D7D4:
        JSR     R5,     L_D816                  ; D7D4   0004 01D8 0016

L_D7D7:
        CLRR    R0                              ; D7D7   01C0
        MVO     R0,     G_0184                  ; D7D8   0240 0184
        MVO     R0,     G_0185                  ; D7DA   0240 0185
        MVO     R0,     G_016C                  ; D7DC   0240 016C
        INCR    R0                              ; D7DE   0008
        MVO     R0,     G_016A                  ; D7DF   0240 016A
        INCR    R0                              ; D7E1   0008
        MVO     R0,     G_0174                  ; D7E2   0240 0174
        SDBD                                    ; D7E4   0001
        MVII    #$5024, R1                      ; D7E5   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; D7E8   0004 0118 0044

        SDBD                                    ; D7EB   0001
        MVII    #$5028, R1                      ; D7EC   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; D7EF   0004 0118 0044

        MVI     G_019A, R0                      ; D7F2   0280 019A
        TSTR    R0                              ; D7F4   0080
        BEQ     L_D7FC                          ; D7F5   0204 0005

        JSR     R5,     L_5FEA                  ; D7F7   0004 015C 03EA

        B       L_D7FF                          ; D7FA   0200 0003

L_D7FC:
        JSR     R5,     L_5E8A                  ; D7FC   0004 015C 028A

L_D7FF:
        PULR    R7                              ; D7FF   02B7

L_D800:
        PSHR    R5                              ; D800   0275
        SDBD                                    ; D801   0001
        MVII    #$5853, R0                      ; D802   02B8 0053 0058
        MVO@    R0,     R4                      ; D805   0260
        SDBD                                    ; D806   0001
        MVII    #$61B6, R0                      ; D807   02B8 00B6 0061
        MVO@    R0,     R4                      ; D80A   0260
        INCR    R4                              ; D80B   000C
        SDBD                                    ; D80C   0001
        MVII    #$0800, R0                      ; D80D   02B8 0000 0008
        MVO@    R0,     R4                      ; D810   0260
        INCR    R4                              ; D811   000C
        MVII    #$0240, R0                      ; D812   02B8 0240
        MVO@    R0,     R4                      ; D814   0260
        PULR    R7                              ; D815   02B7

L_D816:
        PSHR    R5                              ; D816   0275
        SDBD                                    ; D817   0001
        MVII    #$5840, R0                      ; D818   02B8 0040 0058
        MVO@    R0,     R4                      ; D81B   0260
        SDBD                                    ; D81C   0001
        MVII    #$61C8, R0                      ; D81D   02B8 00C8 0061
        MVO@    R0,     R4                      ; D820   0260
        INCR    R4                              ; D821   000C
        SDBD                                    ; D822   0001
        MVII    #$0800, R0                      ; D823   02B8 0000 0008
        MVO@    R0,     R4                      ; D826   0260
        INCR    R4                              ; D827   000C
        MVII    #$0200, R0                      ; D828   02B8 0200
        MVO@    R0,     R4                      ; D82A   0260
        PULR    R7                              ; D82B   02B7

        PSHR    R5                              ; D82C   0275
        MVI     G_01B5, R1                      ; D82D   0281 01B5
        TSTR    R1                              ; D82F   0089
        BEQ     L_D885                          ; D830   0204 0053

        MVI     G_0183, R0                      ; D832   0280 0183
        TSTR    R0                              ; D834   0080
        BNEQ    L_D885                          ; D835   020C 004E

        MVI     G_031E, R0                      ; D837   0280 031E
        SDBD                                    ; D839   0001
        CMPI    #$61A1, R0                      ; D83A   0378 00A1 0061
        BEQ     L_D885                          ; D83D   0204 0046

        MVI     G_016B, R0                      ; D83F   0280 016B
        TSTR    R0                              ; D841   0080
        BNEQ    L_D885                          ; D842   020C 0041

        INCR    R0                              ; D844   0008
        MVO     R0,     G_016B                  ; D845   0240 016B
        DECR    R1                              ; D847   0011
        MVO     R1,     G_01B5                  ; D848   0241 01B5
        MVI     G_01A9, R1                      ; D84A   0281 01A9
        DECR    R1                              ; D84C   0011
        MVO     R1,     G_01A9                  ; D84D   0241 01A9
        MVII    #$0003, R0                      ; D84F   02B8 0003
        INCR    R0                              ; D851   0008
        CMPI    #$0005, R0                      ; D852   0378 0005
        BGT     L_D885                          ; D854   020E 002F

        JSR     R5,     .EXEC.76C               ; D856   0004 0114 036C
        DECLE   $008C,  $028B,  $0001,  $03BB   ; D859   008C 028B 0001 03BB
        DECLE   $0000,  $0010,  $022C,  $000F   ; D85D   0000 0010 022C 000F
        DECLE   $0001                           ; D861   0001

        MVII    #$0000, R3                      ; D862   02BB 0000
        SLLC    R0,     1                       ; D864   0058
        MVO@    R3,     R4                      ; D865   0263
        SDBD                                    ; D866   0001
        MVII    #$61EC, R1                      ; D867   02B9 00EC 0061
        MVO@    R1,     R4                      ; D86A   0261
        MVI     G_031F, R1                      ; D86B   0281 031F
        MVO@    R1,     R4                      ; D86D   0261
        MVI     G_0320, R1                      ; D86E   0281 0320
        ADDI    #$0200, R1                      ; D870   02F9 0200
        MVO@    R1,     R4                      ; D872   0261
        MVI     G_0175, R3                      ; D873   0283 0175
        SLL     R3,     1                       ; D875   004B
        MOVR    R3,     R5                      ; D876   009D
        SDBD                                    ; D877   0001
        ADDI    #$6EB5, R5                      ; D878   02FD 00B5 006E
        SDBD                                    ; D87B   0001
        MVI@    R5,     R1                      ; D87C   02A9
        MVO@    R1,     R4                      ; D87D   0261
        INCR    R4                              ; D87E   000C
        MVII    #$0014, R1                      ; D87F   02B9 0014
        MVO@    R1,     R4                      ; D881   0261

        JSR     R5,     .EXEC.41C               ; D882   0004 0114 001C

L_D885:
        PULR    R7                              ; D885   02B7

L_D886:
        PSHR    R5                              ; D886   0275
        SDBD                                    ; D887   0001
        MVII    #$6128, R1                      ; D888   02B9 0028 0061
        MVII    #$034D, R2                      ; D88B   02BA 034D

        JSR     R5,     X_INIT_MOB              ; D88D   0004 0114 02B2

        MVII    #$000C, R0                      ; D890   02B8 000C

        JSR     R5,     X_RAND2                 ; D892   0004 0114 029E

        MVII    #$0008, R1                      ; D895   02B9 0008

        JSR     R5,     X_MPY                   ; D897   0004 011C 01DC

        ADDI    #$0010, R2                      ; D89A   02FA 0010
        SWAP    R2,     1                       ; D89C   0042
        MVO     R2,     G_034F                  ; D89D   0242 034F
        MVII    #$0006, R0                      ; D89F   02B8 0006

        JSR     R5,     .EXEC.41C               ; D8A1   0004 0114 001C

        CLRR    R0                              ; D8A4   01C0
        MVO     R0,     G_019C                  ; D8A5   0240 019C
        INCR    R0                              ; D8A7   0008
        MVO     R0,     G_019B                  ; D8A8   0240 019B
        MVII    #$000A, R0                      ; D8AA   02B8 000A
        MVO     R0,     G_0181                  ; D8AC   0240 0181
        PULR    R7                              ; D8AE   02B7

L_D8AF:
        PSHR    R5                              ; D8AF   0275
        MVI     G_0350, R0                      ; D8B0   0280 0350
        SWAP    R0,     1                       ; D8B2   0040
        ANDI    #$00FF, R0                      ; D8B3   03B8 00FF
        CMPI    #$0068, R0                      ; D8B5   0378 0068
        BGT     L_D8D5                          ; D8B7   020E 001C

        MVI     G_034F, R0                      ; D8B9   0280 034F
        SWAP    R0,     1                       ; D8BB   0040
        ANDI    #$00FF, R0                      ; D8BC   03B8 00FF
        CMPI    #$00AA, R0                      ; D8BE   0378 00AA
        BGT     L_D8D5                          ; D8C0   020E 0013

        MVI     G_031F, R0                      ; D8C2   0280 031F
        SWAP    R0,     1                       ; D8C4   0040
        MVI     G_0320, R1                      ; D8C5   0281 0320
        SWAP    R1,     1                       ; D8C7   0041

        JSR     R5,     X_PACK_BYTES            ; D8C8   0004 0114 034F

        MOVR    R0,     R2                      ; D8CB   0082
        MVII    #$0014, R3                      ; D8CC   02BB 0014
        MVII    #$0006, R0                      ; D8CE   02B8 0006

        JSR     R5,     .EXEC.9BB               ; D8D0   0004 0118 01BB

        B       L_D8E2                          ; D8D3   0200 000D

L_D8D5:
        CLRR    R0                              ; D8D5   01C0
        MVO     R0,     G_019B                  ; D8D6   0240 019B
        MVII    #$0007, R0                      ; D8D8   02B8 0007
        MVII    #$034D, R4                      ; D8DA   02BC 034D

        JSR     R5,     X_FILL_ZERO             ; D8DC   0004 0114 0338
        JSR     R5,     L_60EC                  ; D8DF   0004 0160 00EC

L_D8E2:
        PULR    R7                              ; D8E2   02B7

        PSHR    R5                              ; D8E3   0275
        MVI     G_019F, R1                      ; D8E4   0281 019F
        INCR    R1                              ; D8E6   0009
        ADDR    R7,     R1                      ; D8E7   00F9
        ADD@    R1,     R7                      ; D8E8   02CF

        DECLE   $0008,  $000D,  $0018,  $001F   ; D8E9   0008 000D 0018 001F

        ADCR    R2                              ; D8ED   002A
        SWAP    R0,     2                       ; D8EE   0044
        SLLC    R3,     2                       ; D8EF   005F
        SAR     R2,     1                       ; D8F0   006A

        JSR     R5,     X_DEF_ISR               ; D8F1   0004 0110 0126

        B       L_D95C                          ; D8F4   0200 0066

        JSR     R5,     L_D988                  ; D8F6   0004 01D8 0188
        JSR     R5,     X_DEF_ISR               ; D8F9   0004 0110 0126

        CLRR    R0                              ; D8FC   01C0
        MVO     R0,     G_019F                  ; D8FD   0240 019F
        B       L_D95C                          ; D8FF   0200 005B

        JSR     R5,     L_D992                  ; D901   0004 01D8 0192

        MVII    #$0003, R0                      ; D904   02B8 0003
        MVO     R0,     G_019F                  ; D906   0240 019F

        JSR     R5,     L_D99E                  ; D908   0004 01D8 019E
        JSR     R5,     X_DEF_ISR               ; D90B   0004 0110 0126
        JSR     R5,     L_D95D                  ; D90E   0004 01D8 015D

        B       L_D95C                          ; D911   0200 0049

        SDBD                                    ; D913   0001
        MVII    #$5047, R5                      ; D914   02BD 0047 0050

        JSRD    R4,     X_NEW_GRAM_INIT         ; D917   0004 001E 0335

        MVII    #$00F0, R0                      ; D91A   02B8 00F0
        SDBD                                    ; D91C   0001
        MVII    #$2C96, R1                      ; D91D   02B9 0096 002C
        MVII    #$0200, R4                      ; D920   02BC 0200

        JSR     R5,     X_FILL_MEM              ; D922   0004 0114 0341

        CLRR    R0                              ; D925   01C0
        MVO     R0,     G_019F                  ; D926   0240 019F
        INCR    R0                              ; D928   0008
        MVO     R0,     G_0191                  ; D929   0240 0191
        B       L_D95C                          ; D92B   0200 002F

        DECLE   $0001                           ; D92D   0001

        MVII    #$003A, R5                      ; D92E   02BD 003A
        RLC     R0,     1                       ; D930   0050

        JSRD    R4,     X_NEW_GRAM_INIT         ; D931   0004 001E 0335

        MVII    #$00F0, R0                      ; D934   02B8 00F0
        SDBD                                    ; D936   0001
        MVII    #$2CCE, R1                      ; D937   02B9 00CE 002C
        MVII    #$0200, R4                      ; D93A   02BC 0200

        JSR     R5,     X_FILL_MEM              ; D93C   0004 0114 0341

        CLRR    R0                              ; D93F   01C0
        MVO     R0,     G_019F                  ; D940   0240 019F
        MVII    #$0002, R0                      ; D942   02B8 0002
        MVO     R0,     G_0191                  ; D944   0240 0191
        B       L_D95C                          ; D946   0200 0014

        JSR     R5,     L_D992                  ; D948   0004 01D8 0192
        JSR     R5,     X_DEF_ISR               ; D94B   0004 0110 0126

        CLRR    R0                              ; D94E   01C0
        MVO     R0,     G_019F                  ; D94F   0240 019F
        B       L_D95C                          ; D951   0200 0009

        JSR     R5,     L_DE0B                  ; D953   0004 01DC 020B
        JSR     R5,     L_D99E                  ; D956   0004 01D8 019E
        JSR     R5,     X_DEF_ISR               ; D959   0004 0110 0126

L_D95C:
        PULR    R7                              ; D95C   02B7

L_D95D:
        PSHR    R5                              ; D95D   0275
        MVI     G_0102, R0                      ; D95E   0280 0102
        ANDI    #$0080, R0                      ; D960   03B8 0080
        CMPI    #$0080, R0                      ; D962   0378 0080
        BEQ     L_D987                          ; D964   0204 0021

        MVI     G_017A, R0                      ; D966   0280 017A
        DECR    R0                              ; D968   0010
        MVO     R0,     G_017A                  ; D969   0240 017A
        BPL     L_D987                          ; D96B   0203 001A

        MVII    #$003B, R0                      ; D96D   02B8 003B
        MVO     R0,     G_017A                  ; D96F   0240 017A

        JSR     R5,     L_D9C8                  ; D971   0004 01D8 01C8

        MVI     G_017B, R0                      ; D974   0280 017B
        INCR    R0                              ; D976   0008
        CMPI    #$003C, R0                      ; D977   0378 003C
        BEQ     L_D97F                          ; D979   0204 0004

        MVO     R0,     G_017B                  ; D97B   0240 017B
        B       L_D987                          ; D97D   0200 0008

L_D97F:
        CLRR    R0                              ; D97F   01C0
        MVO     R0,     G_017B                  ; D980   0240 017B
        MVI     G_017C, R0                      ; D982   0280 017C
        INCR    R0                              ; D984   0008
        MVO     R0,     G_017C                  ; D985   0240 017C
L_D987:
        PULR    R7                              ; D987   02B7

L_D988:
        PSHR    R5                              ; D988   0275
        MVI     .STIC.EDGE,R0                   ; D989   0280 0032
        SDBD                                    ; D98B   0001
        ANDI    #$FFFC, R0                      ; D98C   03B8 00FC 00FF
        MVO     R0,     .STIC.EDGE              ; D98F   0240 0032
        PULR    R7                              ; D991   02B7

L_D992:
        PSHR    R5                              ; D992   0275
        MVI     .STIC.EDGE,R0                   ; D993   0280 0032
        SDBD                                    ; D995   0001
        ANDI    #$FFFC, R0                      ; D996   03B8 00FC 00FF
        XORI    #$0003, R0                      ; D999   03F8 0003
        MVO     R0,     .STIC.EDGE              ; D99B   0240 0032
        PULR    R7                              ; D99D   02B7

L_D99E:
        PSHR    R5                              ; D99E   0275
        MVI     G_017E, R0                      ; D99F   0280 017E
        DECR    R0                              ; D9A1   0010
        BEQ     L_D9A8                          ; D9A2   0204 0004

        MVO     R0,     G_017E                  ; D9A4   0240 017E
        B       L_D9C7                          ; D9A6   0200 001F

L_D9A8:
        MVII    #$0005, R0                      ; D9A8   02B8 0005
        MVO     R0,     G_017E                  ; D9AA   0240 017E
        MVI     G_01A8, R1                      ; D9AC   0281 01A8
        DECR    R1                              ; D9AE   0011
        BPL     L_D9B3                          ; D9AF   0203 0002

        MVII    #$0003, R1                      ; D9B1   02B9 0003
L_D9B3:
        MVO     R1,     G_01A8                  ; D9B3   0241 01A8
        SLL     R1,     2                       ; D9B5   004D
        SLL     R1,     1                       ; D9B6   0049
        SDBD                                    ; D9B7   0001
        ADDI    #$6AE9, R1                      ; D9B8   02F9 00E9 006A
        MOVR    R1,     R4                      ; D9BB   008C
        MVII    #$0008, R0                      ; D9BC   02B8 0008
        SDBD                                    ; D9BE   0001
        MVII    #$3960, R5                      ; D9BF   02BD 0060 0039
L_D9C2:
        MVI@    R4,     R1                      ; D9C2   02A1
        MVO@    R1,     R5                      ; D9C3   0269
        DECR    R0                              ; D9C4   0010
        BNEQ    L_D9C2                          ; D9C5   022C 0004
L_D9C7:
        PULR    R7                              ; D9C7   02B7

L_D9C8:
        PSHR    R5                              ; D9C8   0275
        MVI     G_0182, R0                      ; D9C9   0280 0182
        TSTR    R0                              ; D9CB   0080
        BNEQ    L_DA1E                          ; D9CC   020C 0050

        MVI     G_017D, R0                      ; D9CE   0280 017D
        DECR    R0                              ; D9D0   0010
        MVO     R0,     G_017D                  ; D9D1   0240 017D
        BNEQ    L_DA1E                          ; D9D3   020C 0049

        MVII    #$0006, R0                      ; D9D5   02B8 0006
        MVO     R0,     G_017D                  ; D9D7   0240 017D
        MVI     G_01A9, R2                      ; D9D9   0282 01A9
        SUBI    #$0004, R2                      ; D9DB   033A 0004
        MVO     R2,     G_01A9                  ; D9DD   0242 01A9
        MVI     G_01AA, R0                      ; D9DF   0280 01AA
        INCR    R0                              ; D9E1   0008
        MVO     R0,     G_01AA                  ; D9E2   0240 01AA
        MVI     G_01B3, R0                      ; D9E4   0280 01B3
        DECR    R0                              ; D9E6   0010
        BEQ     L_DA01                          ; D9E7   0204 0018
        BMI     L_DA01                          ; D9E9   020B 0016

        MVO     R0,     G_01B3                  ; D9EB   0240 01B3
        MVI     G_01B4, R0                      ; D9ED   0280 01B4
        DECR    R0                              ; D9EF   0010
        BEQ     L_DA0A                          ; D9F0   0204 0018
        BMI     L_DA0A                          ; D9F2   020B 0016

        MVO     R0,     G_01B4                  ; D9F4   0240 01B4
        MVI     G_01B2, R0                      ; D9F6   0280 01B2
        DECR    R0                              ; D9F8   0010
        BEQ     L_DA13                          ; D9F9   0204 0018
        BMI     L_DA13                          ; D9FB   020B 0016

        MVO     R0,     G_01B2                  ; D9FD   0240 01B2
        B       L_DA1E                          ; D9FF   0200 001D

L_DA01:
        SDBD                                    ; DA01   0001
        MVII    #$DA1F, R1                      ; DA02   02B9 001F 00DA

        JSR     R5,     L_DA44                  ; DA05   0004 01D8 0244

        B       L_DA1A                          ; DA08   0200 0010

L_DA0A:
        SDBD                                    ; DA0A   0001
        MVII    #$DA2B, R1                      ; DA0B   02B9 002B 00DA

        JSR     R5,     L_DA44                  ; DA0E   0004 01D8 0244

        B       L_DA1A                          ; DA11   0200 0007

L_DA13:
        SDBD                                    ; DA13   0001
        MVII    #$DA38, R1                      ; DA14   02B9 0038 00DA

        JSR     R5,     L_DA44                  ; DA17   0004 01D8 0244

L_DA1A:
        MVII    #$0001, R0                      ; DA1A   02B8 0001
        MVO     R0,     G_018E                  ; DA1C   0240 018E
L_DA1E:
        PULR    R7                              ; DA1E   02B7

        DECLE   $004F,  $0055,  $0054,  $0020   ; DA1F   004F 0055 0054 0020
        DECLE   $004F,  $0046,  $0020,  $0046   ; DA23   004F 0046 0020 0046
        DECLE   $004F,  $004F,  $0044,  $0000   ; DA27   004F 004F 0044 0000
        DECLE   $004F,  $0055,  $0054,  $0020   ; DA2B   004F 0055 0054 0020
        DECLE   $004F,  $0046,  $0020,  $0057   ; DA2F   004F 0046 0020 0057
        DECLE   $0041,  $0054,  $0045,  $0052   ; DA33   0041 0054 0045 0052
        DECLE   $0000,  $004F,  $0055,  $0054   ; DA37   0000 004F 0055 0054
        DECLE   $0020,  $004F,  $0046,  $0020   ; DA3B   0020 004F 0046 0020
        DECLE   $0046,  $0049,  $0052,  $0045   ; DA3F   0046 0049 0052 0045
        DECLE   $0000                           ; DA43   0000
L_DA44:
        PSHR    R5                              ; DA44   0275
        SDBD                                    ; DA45   0001
        MVII    #$2206, R3                      ; DA46   02BB 0006 0022
        MVII    #$02A4, R4                      ; DA49   02BC 02A4

        JSR     R5,     X_PRINT_R1              ; DA4B   0004 0118 0067

        PULR    R7                              ; DA4E   02B7

L_DA4F:
        PSHR    R5                              ; DA4F   0275
        SDBD                                    ; DA50   0001
        MVII    #$6FCA, R0                      ; DA51   02B8 00CA 006F
        MVO     R0,     G_035D                  ; DA54   0240 035D
        SDBD                                    ; DA56   0001
        MVII    #$2206, R3                      ; DA57   02BB 0006 0022
        MVII    #$0291, R4                      ; DA5A   02BC 0291

        JSR     R5,     X_PRINT_R5              ; DA5C   0004 0118 007B
        STRING  "GAME OVER"                     ; DA5F  
        DECLE   $0000                           ; DA68   0000

        JSR     R5,     L_DABF                  ; DA69   0004 01D8 02BF

        SDBD                                    ; DA6C   0001
        MVII    #$2206, R3                      ; DA6D   02BB 0006 0022
        MVII    #$02D1, R4                      ; DA70   02BC 02D1
        MVI     G_0317, R1                      ; DA72   0281 0317
        TSTR    R1                              ; DA74   0089
        BNEQ    L_DA82                          ; DA75   020C 000B

        MVI     G_0318, R0                      ; DA77   0280 0318
        MVII    #$0003, R1                      ; DA79   02B9 0003
        ADDI    #$0002, R4                      ; DA7B   02FC 0002

        JSR     R5,     X_PRNUM_RGT             ; DA7D   0004 0118 00C5

        B       L_DA8C                          ; DA80   0200 000A

L_DA82:
        CMPI    #$0063, R1                      ; DA82   0379 0063
        BGT     L_DA87                          ; DA84   020E 0001

        DECR    R4                              ; DA86   0014
L_DA87:
        MVI     G_0318, R0                      ; DA87   0280 0318

        JSR     R5,     L_563E                  ; DA89   0004 0154 023E

L_DA8C:
        SDBD                                    ; DA8C   0001
        MVII    #$2206, R3                      ; DA8D   02BB 0006 0022
        MVII    #$02CB, R4                      ; DA90   02BC 02CB
        MVI     G_0317, R0                      ; DA92   0280 0317
        TSTR    R0                              ; DA94   0080
        BNEQ    L_DA98                          ; DA95   020C 0001

        INCR    R4                              ; DA97   000C
L_DA98:
        CMPI    #$0063, R0                      ; DA98   0378 0063
        BGT     L_DA9D                          ; DA9A   020E 0001

        INCR    R4                              ; DA9C   000C

L_DA9D:
        JSR     R5,     X_PRINT_R5              ; DA9D   0004 0118 007B
        STRING  "TOTAL"                         ; DAA0  
        DECLE   $0000                           ; DAA5   0000

        CLRR    R0                              ; DAA6   01C0
        MVO     R0,     G_019F                  ; DAA7   0240 019F
        MVO     R0,     G_019B                  ; DAA9   0240 019B
        MVII    #$0321, R4                      ; DAAB   02BC 0321
        CLRR    R0                              ; DAAD   01C0
L_DAAE:
        MVO@    R0,     R4                      ; DAAE   0260
        MVO@    R0,     R4                      ; DAAF   0260
        MVO@    R0,     R4                      ; DAB0   0260
        ADDI    #$0005, R4                      ; DAB1   02FC 0005
        CMPI    #$035B, R4                      ; DAB3   037C 035B
        BLT     L_DAAE                          ; DAB5   0225 0008

        SDBD                                    ; DAB7   0001
        MVII    #$502C, R1                      ; DAB8   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; DABB   0004 0118 0038

        PULR    R7                              ; DABE   02B7

L_DABF:
        PSHR    R5                              ; DABF   0275
        MVI     G_019D, R0                      ; DAC0   0280 019D
        SLR     R0,     1                       ; DAC2   0060
        INCR    R0                              ; DAC3   0008
        MVI     G_0161, R1                      ; DAC4   0281 0161

        JSR     R5,     X_MPY                   ; DAC6   0004 011C 01DC

        MOVR    R2,     R1                      ; DAC9   0091
        MVII    #$000A, R0                      ; DACA   02B8 000A

        JSR     R5,     X_MPY                   ; DACC   0004 011C 01DC

        MOVR    R2,     R1                      ; DACF   0091
        SDBD                                    ; DAD0   0001
        MVII    #$6DA7, R4                      ; DAD1   02BC 00A7 006D
        ADD     G_019D, R4                      ; DAD4   02C4 019D
        SDBD                                    ; DAD6   0001
        MVI@    R4,     R0                      ; DAD7   02A0
        SDBD                                    ; DAD8   0001
        MVI@    R4,     R2                      ; DAD9   02A2
        SUBR    R0,     R2                      ; DADA   0102

        JSR     R5,     X_DIV                   ; DADB   0004 011C 01FB

        MVII    #$0064, R1                      ; DADE   02B9 0064

        JSR     R5,     X_MPY                   ; DAE0   0004 011C 01DC
        JSR     R5,     L_5610                  ; DAE3   0004 0154 0210

        PULR    R7                              ; DAE6   02B7

L_DAE7:
        PSHR    R5                              ; DAE7   0275
        MVII    #$0002, R0                      ; DAE8   02B8 0002
        MVO     R0,     G_0169                  ; DAEA   0240 0169
        MVII    #$031D, R4                      ; DAEC   02BC 031D
        MVII    #$003F, R0                      ; DAEE   02B8 003F

        JSR     R5,     X_FILL_ZERO             ; DAF0   0004 0114 0338

        SDBD                                    ; DAF3   0001
        MVII    #$621A, R0                      ; DAF4   02B8 001A 0062
        MVO     R0,     G_031E                  ; DAF7   0240 031E
        SDBD                                    ; DAF9   0001
        MVII    #$6221, R0                      ; DAFA   02B8 0021 0062
        MVO     R0,     G_0326                  ; DAFD   0240 0326
        MVII    #$00F0, R0                      ; DAFF   02B8 00F0
        SDBD                                    ; DB01   0001
        MVII    #$2CCE, R1                      ; DB02   02B9 00CE 002C
        MVII    #$0200, R4                      ; DB05   02BC 0200

        JSR     R5,     X_FILL_MEM              ; DB07   0004 0114 0341

        CLRR    R0                              ; DB0A   01C0
        MVO     R0,     G_01BD                  ; DB0B   0240 01BD
        MVO     R0,     G_01BA                  ; DB0D   0240 01BA
        INCR    R0                              ; DB0F   0008
        MVO     R0,     G_019F                  ; DB10   0240 019F

        JSR     R5,     L_DBDF                  ; DB12   0004 01D8 03DF
        JSR     R5,     L_DF15                  ; DB15   0004 01DC 0315

        SDBD                                    ; DB18   0001
        MVII    #$6FA2, R0                      ; DB19   02B8 00A2 006F
        MVO     R0,     G_035D                  ; DB1C   0240 035D
        SDBD                                    ; DB1E   0001
        MVII    #$5024, R1                      ; DB1F   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; DB22   0004 0118 0038

        SDBD                                    ; DB25   0001
        MVII    #$5028, R1                      ; DB26   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; DB29   0004 0118 0038

        SDBD                                    ; DB2C   0001
        MVII    #$502C, R1                      ; DB2D   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; DB30   0004 0118 0038

        SDBD                                    ; DB33   0001
        MVII    #$5030, R1                      ; DB34   02B9 0030 0050

        JSR     R5,     X_TIMER_STOP            ; DB37   0004 0118 0038

        PULR    R7                              ; DB3A   02B7

        PSHR    R5                              ; DB3B   0275
        MVI     G_0192, R0                      ; DB3C   0280 0192
        TSTR    R0                              ; DB3E   0080
        BEQ     L_DB49                          ; DB3F   0204 0008

        JSR     R5,     L_513A                  ; DB41   0004 0150 013A

        CLRR    R0                              ; DB44   01C0
        MVO     R0,     G_0192                  ; DB45   0240 0192
        B       L_DB4F                          ; DB47   0200 0006

L_DB49:
        JSR     R5,     L_DB78                  ; DB49   0004 01D8 0378

        CLRR    R0                              ; DB4C   01C0
        MVO     R0,     G_019B                  ; DB4D   0240 019B

L_DB4F:
        JSR     R5,     L_60EC                  ; DB4F   0004 0160 00EC
        JSR     R5,     L_DBBC                  ; DB52   0004 01D8 03BC

        MVII    #$01AC, R1                      ; DB55   02B9 01AC
        ADD     G_01A0, R1                      ; DB57   02C1 01A0
        MVI@    R1,     R0                      ; DB59   0288
        MVO     R0,     G_01A1                  ; DB5A   0240 01A1
        MVII    #$0002, R0                      ; DB5C   02B8 0002
        MVO     R0,     G_019F                  ; DB5E   0240 019F
        INCR    R0                              ; DB60   0008
        MVO     R0,     G_0175                  ; DB61   0240 0175
        SDBD                                    ; DB63   0001
        MVII    #$502C, R1                      ; DB64   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; DB67   0004 0118 0044

        SDBD                                    ; DB6A   0001
        MVII    #$5030, R1                      ; DB6B   02B9 0030 0050

        JSR     R5,     X_TIMER_START           ; DB6E   0004 0118 0044

        SDBD                                    ; DB71   0001
        MVII    #$6FB6, R0                      ; DB72   02B8 00B6 006F
        MVO     R0,     G_035D                  ; DB75   0240 035D
        PULR    R7                              ; DB77   02B7

L_DB78:
        PSHR    R5                              ; DB78   0275
        MVII    #$0200, R3                      ; DB79   02BB 0200
        SDBD                                    ; DB7B   0001
        MVII    #$D0F0, R4                      ; DB7C   02BC 00F0 00D0
L_DB7F:
        MVI@    R4,     R0                      ; DB7F   02A0
        SLL     R0,     1                       ; DB80   0048
        MOVR    R0,     R5                      ; DB81   0085
        SDBD                                    ; DB82   0001
        ADDI    #$6D2D, R5                      ; DB83   02FD 002D 006D
        SDBD                                    ; DB86   0001
        MVI@    R5,     R2                      ; DB87   02AA
        MVO@    R2,     R3                      ; DB88   025A
        INCR    R3                              ; DB89   000B
        CMPI    #$02F0, R3                      ; DB8A   037B 02F0
        BLT     L_DB7F                          ; DB8C   0225 000E

        CLRR    R0                              ; DB8E   01C0
        MVO     R0,     G_0323                  ; DB8F   0240 0323
        MVO     R0,     G_032B                  ; DB91   0240 032B
        MVO     R0,     G_016E                  ; DB93   0240 016E

        JSR     R5,     L_516D                  ; DB95   0004 0150 016D

        SDBD                                    ; DB98   0001
        MVII    #$6138, R1                      ; DB99   02B9 0038 0061

        JSR     R5,     L_51BD                  ; DB9C   0004 0150 01BD

        SDBD                                    ; DB9F   0001
        MVII    #$7000, R0                      ; DBA0   02B8 0000 0070

        JSR     R5,     L_51A5                  ; DBA3   0004 0150 01A5

        SDBD                                    ; DBA6   0001
        MVII    #$4400, R1                      ; DBA7   02B9 0000 0044

        JSR     R5,     L_51AD                  ; DBAA   0004 0150 01AD

        CLRR    R0                              ; DBAD   01C0
        MVO     R0,     G_0190                  ; DBAE   0240 0190
        MVO     R0,     G_0183                  ; DBB0   0240 0183
        MVO     R0,     G_016A                  ; DBB2   0240 016A
        MVO     R0,     G_0184                  ; DBB4   0240 0184
        INCR    R0                              ; DBB6   0008
        MVO     R0,     G_018F                  ; DBB7   0240 018F
        MVO     R0,     G_016B                  ; DBB9   0240 016B
        PULR    R7                              ; DBBB   02B7

L_DBBC:
        PSHR    R5                              ; DBBC   0275
        SDBD                                    ; DBBD   0001
        MVII    #$6DA7, R4                      ; DBBE   02BC 00A7 006D
        ADD     G_019D, R4                      ; DBC1   02C4 019D
        SDBD                                    ; DBC3   0001
        MVI@    R4,     R2                      ; DBC4   02A2
        ADD     G_015E, R2                      ; DBC5   02C2 015E
        INCR    R2                              ; DBC7   000A
        MOVR    R2,     R4                      ; DBC8   0094
        CLRR    R3                              ; DBC9   01DB
L_DBCA:
        MVI@    R4,     R0                      ; DBCA   02A0
        CMPI    #$0002, R0                      ; DBCB   0378 0002
        BEQ     L_DBD6                          ; DBCD   0204 0007

        CMPI    #$0004, R0                      ; DBCF   0378 0004
        BEQ     L_DBD6                          ; DBD1   0204 0003

        INCR    R3                              ; DBD3   000B
        B       L_DBCA                          ; DBD4   0220 000B

L_DBD6:
        MVO     R3,     G_01A2                  ; DBD6   0243 01A2
        CLRR    R0                              ; DBD8   01C0
        MVO     R0,     G_0187                  ; DBD9   0240 0187
        INCR    R0                              ; DBDB   0008
        MVO     R0,     G_0197                  ; DBDC   0240 0197
        PULR    R7                              ; DBDE   02B7

L_DBDF:
        PSHR    R5                              ; DBDF   0275
        CLRR    R0                              ; DBE0   01C0
        MVO     R0,     G_01A5                  ; DBE1   0240 01A5
        MVII    #$0217, R4                      ; DBE3   02BC 0217
        SDBD                                    ; DBE5   0001
        MVII    #$2402, R3                      ; DBE6   02BB 0002 0024

        JSR     R5,     X_PRINT_R5              ; DBE9   0004 0118 007B
        STRING  "BUY"                           ; DBEC   0042 0055 0059
        DECLE   $0000                           ; DBEF   0000

        MVII    #$021B, R4                      ; DBF0   02BC 021B
        SDBD                                    ; DBF2   0001
        MVII    #$2400, R3                      ; DBF3   02BB 0000 0024

        JSR     R5,     X_PRINT_R5              ; DBF6   0004 0118 007B
        STRING  "SELL LBS SUP"                  ; DBF9  
        DECLE   $0000                           ; DC05   0000

        MVII    #$02DD, R4                      ; DC06   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; DC08   0004 0118 007B
        STRING  "$"                             ; DC0B   0024
        DECLE   $0000                           ; DC0C   0000

        MVII    #$02E5, R4                      ; DC0D   02BC 02E5

        JSR     R5,     X_PRINT_R5              ; DC0F   0004 0118 007B
        STRING  "LBS"                           ; DC12   004C 0042 0053
        DECLE   $0000                           ; DC15   0000

        MVII    #$02EB, R4                      ; DC16   02BC 02EB

        JSR     R5,     X_PRINT_R5              ; DC18   0004 0118 007B
        STRING  "INJ"                           ; DC1B   0049 004E 004A
        DECLE   $0000                           ; DC1E   0000

        MVII    #$023D, R3                      ; DC1F   02BB 023D
        SDBD                                    ; DC21   0001
        MVII    #$DC32, R4                      ; DC22   02BC 0032 00DC
L_DC25:
        SDBD                                    ; DC25   0001
        MVI@    R4,     R0                      ; DC26   02A0
        MVO@    R0,     R3                      ; DC27   0258
        ADDI    #$0014, R3                      ; DC28   02FB 0014
        CMPI    #$02B5, R3                      ; DC2A   037B 02B5
        BLE     L_DC25                          ; DC2C   0226 0008

        JSR     R5,     L_DC40                  ; DC2E   0004 01DC 0040

        PULR    R7                              ; DC31   02B7

        DECLE   $003E,  $001D,  $0036,  $000D   ; DC32   003E 001D 0036 000D
        DECLE   $002E,  $0019,  $001E,  $0019   ; DC36   002E 0019 001E 0019
        DECLE   $0046,  $0029,  $005E,  $001D   ; DC3A   0046 0029 005E 001D
        DECLE   $0016,  $001F                   ; DC3E   0016 001F
L_DC40:
        PSHR    R5                              ; DC40   0275
        SDBD                                    ; DC41   0001
        MVII    #$2400, R3                      ; DC42   02BB 0000 0024
        MVII    #$023F, R4                      ; DC45   02BC 023F
        CLRR    R0                              ; DC47   01C0
L_DC48:
        PSHR    R0                              ; DC48   0270
        MVII    #$0006, R1                      ; DC49   02B9 0006

        JSR     R5,     X_MPY                   ; DC4B   0004 011C 01DC

        SDBD                                    ; DC4E   0001
        ADDI    #$6F4D, R2                      ; DC4F   02FA 004D 006F
        ADD     G_01A0, R2                      ; DC52   02C2 01A0

        JSR     R5,     L_DCAD                  ; DC54   0004 01DC 00AD

        PULR    R0                              ; DC57   02B0
        INCR    R0                              ; DC58   0008
        CMPI    #$0006, R0                      ; DC59   0378 0006
        BLT     L_DC48                          ; DC5B   0225 0014

        MVII    #$0243, R4                      ; DC5D   02BC 0243
        CLRR    R0                              ; DC5F   01C0
L_DC60:
        PSHR    R0                              ; DC60   0270
        MVII    #$0006, R1                      ; DC61   02B9 0006

        JSR     R5,     X_MPY                   ; DC63   0004 011C 01DC

        SDBD                                    ; DC66   0001
        ADDI    #$6F71, R2                      ; DC67   02FA 0071 006F
        ADD     G_01A0, R2                      ; DC6A   02C2 01A0

        JSR     R5,     L_DCAD                  ; DC6C   0004 01DC 00AD

        PULR    R0                              ; DC6F   02B0
        INCR    R0                              ; DC70   0008
        CMPI    #$0007, R0                      ; DC71   0378 0007
        BLT     L_DC60                          ; DC73   0225 0014

        MVII    #$0247, R4                      ; DC75   02BC 0247
        SDBD                                    ; DC77   0001
        MVII    #$6F9B, R2                      ; DC78   02BA 009B 006F

L_DC7B:
        JSR     R5,     L_DCAD                  ; DC7B   0004 01DC 00AD

        CMPI    #$02D3, R4                      ; DC7E   037C 02D3
        BLT     L_DC7B                          ; DC80   0225 0006

        MVII    #$024B, R4                      ; DC82   02BC 024B
        MVII    #$01B2, R2                      ; DC84   02BA 01B2

L_DC86:
        JSR     R5,     L_DCAD                  ; DC86   0004 01DC 00AD

        CMPI    #$02D7, R4                      ; DC89   037C 02D7
        BLT     L_DC86                          ; DC8B   0225 0006

        MVI     G_035C, R0                      ; DC8D   0280 035C
        MVII    #$0003, R1                      ; DC8F   02B9 0003
        SDBD                                    ; DC91   0001
        MVII    #$2400, R3                      ; DC92   02BB 0000 0024
        MVII    #$02DE, R4                      ; DC95   02BC 02DE

        JSR     R5,     X_PRNUM_RGT             ; DC97   0004 0118 00C5

        MVI     G_01A9, R0                      ; DC9A   0280 01A9
        MVII    #$0003, R1                      ; DC9C   02B9 0003
        MVII    #$02E2, R4                      ; DC9E   02BC 02E2

        JSR     R5,     X_PRNUM_RGT             ; DCA0   0004 0118 00C5

        MVI     G_01AB, R0                      ; DCA3   0280 01AB
        MVII    #$0002, R1                      ; DCA5   02B9 0002
        MVII    #$02E9, R4                      ; DCA7   02BC 02E9

        JSR     R5,     X_PRNUM_RGT             ; DCA9   0004 0118 00C5

        PULR    R7                              ; DCAC   02B7

L_DCAD:
        PSHR    R5                              ; DCAD   0275
        MVI@    R2,     R0                      ; DCAE   0290
        MVII    #$0003, R1                      ; DCAF   02B9 0003
        SDBD                                    ; DCB1   0001
        MVII    #$2400, R3                      ; DCB2   02BB 0000 0024

        JSR     R5,     X_PRNUM_RGT             ; DCB5   0004 0118 00C5

        INCR    R2                              ; DCB8   000A
        ADDI    #$0014, R4                      ; DCB9   02FC 0014
        PULR    R7                              ; DCBB   02B7

L_DCBC:
        PSHR    R5                              ; DCBC   0275
        MVII    #$0002, R0                      ; DCBD   02B8 0002
        MVO     R0,     G_0169                  ; DCBF   0240 0169
        MVII    #$00F0, R0                      ; DCC1   02B8 00F0
        SDBD                                    ; DCC3   0001
        MVII    #$2CCE, R1                      ; DCC4   02B9 00CE 002C
        MVII    #$0200, R4                      ; DCC7   02BC 0200

        JSR     R5,     X_FILL_MEM              ; DCC9   0004 0114 0341

        MVII    #$02DD, R3                      ; DCCC   02BB 02DD
        SDBD                                    ; DCCE   0001
        MVII    #$6DA7, R4                      ; DCCF   02BC 00A7 006D
        ADD     G_019D, R4                      ; DCD2   02C4 019D
        SDBD                                    ; DCD4   0001
        MVI@    R4,     R2                      ; DCD5   02A2
        ADD     G_015E, R2                      ; DCD6   02C2 015E
        INCR    R2                              ; DCD8   000A
        MOVR    R2,     R4                      ; DCD9   0094
        PSHR    R4                              ; DCDA   0274
        MVII    #$0006, R0                      ; DCDB   02B8 0006
L_DCDD:
        PSHR    R0                              ; DCDD   0270
        MVI@    R4,     R0                      ; DCDE   02A0
        MVII    #$0004, R1                      ; DCDF   02B9 0004

        JSR     R5,     X_MPY                   ; DCE1   0004 011C 01DC

        SLL     R2,     2                       ; DCE4   004E
        SLL     R2,     1                       ; DCE5   004A
        SDBD                                    ; DCE6   0001
        XORI    #$2A07, R2                      ; DCE7   03FA 0007 002A
        MVO@    R2,     R3                      ; DCEA   025A
        INCR    R3                              ; DCEB   000B
        ADDI    #$0008, R2                      ; DCEC   02FA 0008
        MVO@    R2,     R3                      ; DCEE   025A
        SUBI    #$0015, R3                      ; DCEF   033B 0015
        ADDI    #$0008, R2                      ; DCF1   02FA 0008
        MVO@    R2,     R3                      ; DCF3   025A
        INCR    R3                              ; DCF4   000B
        ADDI    #$0008, R2                      ; DCF5   02FA 0008
        MVO@    R2,     R3                      ; DCF7   025A
        SUBI    #$0015, R3                      ; DCF8   033B 0015
        PULR    R0                              ; DCFA   02B0
        DECR    R0                              ; DCFB   0010
        BEQ     L_DD04                          ; DCFC   0204 0006

        DECR    R4                              ; DCFE   0014
        MVI@    R4,     R2                      ; DCFF   02A2
        CMPI    #$0004, R2                      ; DD00   037A 0004
        BNEQ    L_DCDD                          ; DD02   022C 0026

L_DD04:
        PULR    R2                              ; DD04   02B2
        CLRR    R1                              ; DD05   01C9
L_DD06:
        INCR    R1                              ; DD06   0009
        MVI@    R2,     R0                      ; DD07   0290
        INCR    R2                              ; DD08   000A
        CMPI    #$0004, R0                      ; DD09   0378 0004
        BEQ     L_DD0F                          ; DD0B   0204 0002
        B       L_DD06                          ; DD0D   0220 0008

L_DD0F:
        MVII    #$0190, R0                      ; DD0F   02B8 0190

        JSR     R5,     X_MPY                   ; DD11   0004 011C 01DC

        MOVR    R2,     R1                      ; DD14   0091
        SDBD                                    ; DD15   0001
        MVII    #$2400, R3                      ; DD16   02BB 0000 0024
        MVII    #$0207, R4                      ; DD19   02BC 0207
        CMPI    #$03E8, R1                      ; DD1B   0379 03E8
        BLT     L_DD24                          ; DD1D   0205 0005

        JSR     R5,     L_5631                  ; DD1F   0004 0154 0231

        B       L_DD2C                          ; DD22   0200 0008

L_DD24:
        MVII    #$020B, R4                      ; DD24   02BC 020B
        MOVR    R1,     R0                      ; DD26   0088
        MVII    #$0003, R1                      ; DD27   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; DD29   0004 0118 00C5

L_DD2C:
        SDBD                                    ; DD2C   0001
        MVII    #$2400, R3                      ; DD2D   02BB 0000 0024
        MVII    #$0218, R4                      ; DD30   02BC 0218

        JSR     R5,     X_PRINT_R5              ; DD32   0004 0118 007B
        STRING  "FEET TO THE TOP"               ; DD35  
        DECLE   $0000                           ; DD44   0000

        MVII    #$022D, R4                      ; DD45   02BC 022D

        JSR     R5,     X_PRINT_R5              ; DD47   0004 0118 007B
        STRING  "OF MOUNTAIN"                   ; DD4A  
        DECLE   $0280,  $019D                   ; DD55   0280 019D
        STRING  "`"                             ; DD57   0060
        DECLE   $0008,  $02BC,  $0239,  $0001   ; DD58   0008 02BC 0239 0001
        DECLE   $02BB,  $0000                   ; DD5C   02BB 0000

        NEGR    R4                              ; DD5E   0024
        MVII    #$0002, R1                      ; DD5F   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; DD61   0004 0118 00C5
        JSR     R5,     L_DD6B                  ; DD64   0004 01DC 016B
        JSR     R5,     L_DDD4                  ; DD67   0004 01DC 01D4

        PULR    R7                              ; DD6A   02B7

L_DD6B:
        PSHR    R5                              ; DD6B   0275
        SDBD                                    ; DD6C   0001
        MVII    #$2400, R3                      ; DD6D   02BB 0000 0024
        MVII    #$0268, R4                      ; DD70   02BC 0268

        JSR     R5,     X_PRINT_R5              ; DD72   0004 0118 007B
        STRING  "TARGET   ACTUAL"               ; DD75  
        DECLE   $0000                           ; DD84   0000

        SDBD                                    ; DD85   0001
        MVII    #$2400, R3                      ; DD86   02BB 0000 0024
        MVII    #$027D, R4                      ; DD89   02BC 027D

        JSR     R5,     X_PRINT_R5              ; DD8B   0004 0118 007B
        STRING  "TIME     TIME"                 ; DD8E  
        DECLE   $0000                           ; DD9B   0000

        MVI     G_019D, R2                      ; DD9C   0282 019D
        SDBD                                    ; DD9E   0001
        ADDI    #$DE86, R2                      ; DD9F   02FA 0086 00DE
        MVI@    R2,     R0                      ; DDA2   0290
        MVII    #$0291, R4                      ; DDA3   02BC 0291
        MVII    #$0001, R1                      ; DDA5   02B9 0001
        SDBD                                    ; DDA7   0001
        MVII    #$2400, R3                      ; DDA8   02BB 0000 0024

        JSR     R5,     X_PRNUM_RGT             ; DDAB   0004 0118 00C5

        INCR    R4                              ; DDAE   000C
        SDBD                                    ; DDAF   0001
        MVII    #$24D0, R0                      ; DDB0   02B8 00D0 0024
        MVO@    R0,     R4                      ; DDB3   0260
        INCR    R2                              ; DDB4   000A
        MVI@    R2,     R0                      ; DDB5   0290
        INCR    R1                              ; DDB6   0009

        JSR     R5,     X_PRNUM_ZRO             ; DDB7   0004 0118 00AD

        MVI     G_017C, R0                      ; DDBA   0280 017C
        MVII    #$0299, R4                      ; DDBC   02BC 0299
        MVII    #$0002, R1                      ; DDBE   02B9 0002
        SDBD                                    ; DDC0   0001
        MVII    #$2400, R3                      ; DDC1   02BB 0000 0024

        JSR     R5,     X_PRNUM_RGT             ; DDC4   0004 0118 00C5

        SDBD                                    ; DDC7   0001
        MVI@    R4,     R0                      ; DDC8   02A0
        SDBD                                    ; DDC9   0001
        MVII    #$24D0, R0                      ; DDCA   02B8 00D0 0024
        MVO@    R0,     R4                      ; DDCD   0260
        MVI     G_017B, R0                      ; DDCE   0280 017B

        JSR     R5,     X_PRNUM_ZRO             ; DDD0   0004 0118 00AD

        PULR    R7                              ; DDD3   02B7

L_DDD4:
        PSHR    R5                              ; DDD4   0275
        SDBD                                    ; DDD5   0001
        MVII    #$2400, R3                      ; DDD6   02BB 0000 0024
        MVII    #$02CD, R4                      ; DDD9   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; DDDB   0004 0118 007B
        STRING  "RAIN FORECAST"                 ; DDDE  
        DECLE   $0000                           ; DDEB   0000

        MVII    #$01AC, R1                      ; DDEC   02B9 01AC
        ADD     G_01A0, R1                      ; DDEE   02C1 01A0
        MVI@    R1,     R0                      ; DDF0   0288
        MVO     R0,     G_01A1                  ; DDF1   0240 01A1
        MVII    #$000A, R1                      ; DDF3   02B9 000A

        JSR     R5,     X_MPY                   ; DDF5   0004 011C 01DC

        MOVR    R2,     R0                      ; DDF8   0090
        MVII    #$0003, R1                      ; DDF9   02B9 0003
        SDBD                                    ; DDFB   0001
        MVII    #$2400, R3                      ; DDFC   02BB 0000 0024
        MVII    #$02E6, R4                      ; DDFF   02BC 02E6

        JSR     R5,     X_PRNUM_RGT             ; DE01   0004 0118 00C5

        SDBD                                    ; DE04   0001
        MVII    #$2428, R0                      ; DE05   02B8 0028 0024
        MVO     R0,     .BTAB.E9                ; DE08   0240 02E9
        PULR    R7                              ; DE0A   02B7

L_DE0B:
        PSHR    R5                              ; DE0B   0275
        MVI     G_01CF, R0                      ; DE0C   0280 01CF
        INCR    R0                              ; DE0E   0008
        MVO     R0,     G_01CF                  ; DE0F   0240 01CF
        CMPI    #$0003, R0                      ; DE11   0378 0003
        BNEQ    L_DE71                          ; DE13   020C 005C

        CLRR    R0                              ; DE15   01C0
        MVO     R0,     G_01CF                  ; DE16   0240 01CF
        MVI     G_0180, R1                      ; DE18   0281 0180
        INCR    R1                              ; DE1A   0009
        CMPI    #$000A, R1                      ; DE1B   0379 000A
        BLE     L_DE20                          ; DE1D   0206 0001

        CLRR    R1                              ; DE1F   01C9
L_DE20:
        MVO     R1,     G_0180                  ; DE20   0241 0180
        SDBD                                    ; DE22   0001
        ADDI    #$DE72, R1                      ; DE23   02F9 0072 00DE
        MVI@    R1,     R0                      ; DE26   0288
        SWAP    R0,     1                       ; DE27   0040
        MVO     R0,     G_034F                  ; DE28   0240 034F
        MVI     G_0180, R1                      ; DE2A   0281 0180
        SDBD                                    ; DE2C   0001
        ADDI    #$DE7C, R1                      ; DE2D   02F9 007C 00DE
        MVI@    R1,     R0                      ; DE30   0288
        SWAP    R0,     1                       ; DE31   0040
        MVO     R0,     G_0357                  ; DE32   0240 0357
        MVI     G_0350, R0                      ; DE34   0280 0350
        SDBD                                    ; DE36   0001
        ADDI    #$2000, R0                      ; DE37   02F8 0000 0020
        SDBD                                    ; DE3A   0001
        CMPI    #$5000, R0                      ; DE3B   0378 0000 0050
        BLE     L_DE44                          ; DE3E   0206 0004

        SDBD                                    ; DE40   0001
        MVII    #$1000, R0                      ; DE41   02B8 0000 0010
L_DE44:
        MVO     R0,     G_0350                  ; DE44   0240 0350
        MVI     G_0358, R0                      ; DE46   0280 0358
        SDBD                                    ; DE48   0001
        ADDI    #$2000, R0                      ; DE49   02F8 0000 0020
        SDBD                                    ; DE4C   0001
        CMPI    #$5000, R0                      ; DE4D   0378 0000 0050
        BLE     L_DE56                          ; DE50   0206 0004

        SDBD                                    ; DE52   0001
        MVII    #$1000, R0                      ; DE53   02B8 0000 0010
L_DE56:
        MVO     R0,     G_0358                  ; DE56   0240 0358
        MVI     G_017F, R0                      ; DE58   0280 017F
        INCR    R0                              ; DE5A   0008
        MVO     R0,     G_017F                  ; DE5B   0240 017F
        CMPI    #$0078, R0                      ; DE5D   0378 0078
        BLT     L_DE71                          ; DE5F   0205 0010

        CLRR    R0                              ; DE61   01C0
        MVO     R0,     G_017F                  ; DE62   0240 017F
        MVO     R0,     G_0180                  ; DE64   0240 0180
        MVII    #$034D, R4                      ; DE66   02BC 034D
        MVII    #$000F, R0                      ; DE68   02B8 000F

        JSR     R5,     X_FILL_ZERO             ; DE6A   0004 0114 0338

        MVII    #$0003, R0                      ; DE6D   02B8 0003
        MVO     R0,     G_019F                  ; DE6F   0240 019F
L_DE71:
        PULR    R7                              ; DE71   02B7

        DECLE   $0008,  $0020,  $0040,  $0010   ; DE72   0008 0020 0040 0010
        DECLE   $0048,  $0028,  $0018,  $0050   ; DE76   0048 0028 0018 0050
        DECLE   $0030,  $0038,  $0060,  $00A0   ; DE7A   0030 0038 0060 00A0
        DECLE   $0080,  $0070,  $0088,  $0090   ; DE7E   0080 0070 0088 0090
        DECLE   $0068,  $0078,  $00A8,  $0098   ; DE82   0068 0078 00A8 0098
        DECLE   $0001,  $0000,  $0001,  $000F   ; DE86   0001 0000 0001 000F
        DECLE   $0001                           ; DE8A   0001

        ADCR    R5                              ; DE8B   002D
        EIS                                     ; DE8C   0002
        INCR    R7                              ; DE8D   000F

        EIS                                     ; DE8E   0002
L_DE8F:
        COMR    R6                              ; DE8F   001E
        DECLE   $0002,  $002D,  $0003,  $0000   ; DE90   0002 002D 0003 0000

        DIS                                     ; DE94   0003
        INCR    R7                              ; DE95   000F

        DIS                                     ; DE96   0003
L_DE97:
        COMR    R6                              ; DE97   001E
        DECLE   $0004                           ; DE98   0004

        ADCR    R5                              ; DE99   002D
        PSHR    R5                              ; DE9A   0275
        CMPI    #$000A, R0                      ; DE9B   0378 000A
        BEQ     L_DEA8                          ; DE9D   0204 0009
        BGT     L_DEC6                          ; DE9F   020E 0025

        MVO     R0,     G_01A4                  ; DEA1   0240 01A4

        JSR     R5,     L_DF76                  ; DEA3   0004 01DC 0376

        B       L_DEE5                          ; DEA6   0200 003D

L_DEA8:
        MVII    #$0217, R4                      ; DEA8   02BC 0217
        SDBD                                    ; DEAA   0001
        MVII    #$2402, R3                      ; DEAB   02BB 0002 0024

        JSR     R5,     X_PRINT_R5              ; DEAE   0004 0118 007B
        STRING  "BUY"                           ; DEB1   0042 0055 0059
        DECLE   $0000                           ; DEB4   0000

        MVII    #$021B, R4                      ; DEB5   02BC 021B
        SDBD                                    ; DEB7   0001
        MVII    #$2400, R3                      ; DEB8   02BB 0000 0024

        JSR     R5,     X_PRINT_R5              ; DEBB   0004 0118 007B
        STRING  "SELL"                          ; DEBE   0053 0045 004C 004C
        DECLE   $0000                           ; DEC2   0000

        CLRR    R0                              ; DEC3   01C0
        B       L_DEE3                          ; DEC4   0200 001D

L_DEC6:
        MVII    #$021B, R4                      ; DEC6   02BC 021B
        SDBD                                    ; DEC8   0001
        MVII    #$2402, R3                      ; DEC9   02BB 0002 0024

        JSR     R5,     X_PRINT_R5              ; DECC   0004 0118 007B
        STRING  "SELL"                          ; DECF   0053 0045 004C 004C
        DECLE   $0000                           ; DED3   0000

        MVII    #$0217, R4                      ; DED4   02BC 0217
        SDBD                                    ; DED6   0001
        MVII    #$2400, R3                      ; DED7   02BB 0000 0024

        JSR     R5,     X_PRINT_R5              ; DEDA   0004 0118 007B
        STRING  "BUY"                           ; DEDD   0042 0055 0059
        DECLE   $0000                           ; DEE0   0000

        MVII    #$0001, R0                      ; DEE1   02B8 0001
L_DEE3:
        MVO     R0,     G_01A5                  ; DEE3   0240 01A5
L_DEE5:
        PULR    R7                              ; DEE5   02B7

        PSHR    R5                              ; DEE6   0275
        CMPI    #$0001, R0                      ; DEE7   0378 0001
        BLT     L_DEF9                          ; DEE9   0205 000E

        CMPI    #$0008, R0                      ; DEEB   0378 0008
        BLT     L_DEF6                          ; DEED   0205 0007
        BEQ     L_DEF9                          ; DEEF   0204 0008

        JSR     R5,     L_DF15                  ; DEF1   0004 01DC 0315

        B       L_DEF9                          ; DEF4   0200 0003

L_DEF6:
        JSR     R5,     L_DEFA                  ; DEF6   0004 01DC 02FA

L_DEF9:
        PULR    R7                              ; DEF9   02B7

L_DEFA:
        PSHR    R5                              ; DEFA   0275
        MVI     G_016D, R0                      ; DEFB   0280 016D
        TSTR    R0                              ; DEFD   0080
        BNEQ    L_DF14                          ; DEFE   020C 0014

        INCR    R0                              ; DF00   0008
        MVO     R0,     G_016D                  ; DF01   0240 016D
        MVII    #$0003, R0                      ; DF03   02B8 0003
        MVO     R0,     G_0323                  ; DF05   0240 0323

        JSR     R5,     L_DF31                  ; DF07   0004 01DC 0331

        MVI     G_01A3, R1                      ; DF0A   0281 01A3
        DECR    R1                              ; DF0C   0011
        BPL     L_DF11                          ; DF0D   0203 0002

        MVII    #$0006, R1                      ; DF0F   02B9 0006

L_DF11:
        JSR     R5,     L_DF49                  ; DF11   0004 01DC 0349

L_DF14:
        PULR    R7                              ; DF14   02B7

L_DF15:
        PSHR    R5                              ; DF15   0275
        MVI     G_016E, R0                      ; DF16   0280 016E
        TSTR    R0                              ; DF18   0080
        BNEQ    L_DF30                          ; DF19   020C 0015

        INCR    R0                              ; DF1B   0008
        MVO     R0,     G_016E                  ; DF1C   0240 016E
        MVII    #$0003, R0                      ; DF1E   02B8 0003
        MVO     R0,     G_032B                  ; DF20   0240 032B

        JSR     R5,     L_DF31                  ; DF22   0004 01DC 0331

        MVI     G_01A3, R1                      ; DF25   0281 01A3
        INCR    R1                              ; DF27   0009
        CMPI    #$0007, R1                      ; DF28   0379 0007
        BLT     L_DF2D                          ; DF2A   0205 0001

        CLRR    R1                              ; DF2C   01C9

L_DF2D:
        JSR     R5,     L_DF49                  ; DF2D   0004 01DC 0349

L_DF30:
        PULR    R7                              ; DF30   02B7

L_DF31:
        PSHR    R5                              ; DF31   0275
        SDBD                                    ; DF32   0001
        MVII    #$2CCE, R0                      ; DF33   02B8 00CE 002C
        MVII    #$023C, R3                      ; DF36   02BB 023C
L_DF38:
        MVO@    R0,     R3                      ; DF38   0258
        ADDI    #$0014, R3                      ; DF39   02FB 0014
        CMPI    #$02B4, R3                      ; DF3B   037B 02B4
        BLE     L_DF38                          ; DF3D   0226 0006

        MVII    #$024E, R3                      ; DF3F   02BB 024E
L_DF41:
        MVO@    R0,     R3                      ; DF41   0258
        ADDI    #$0014, R3                      ; DF42   02FB 0014
        CMPI    #$02C6, R3                      ; DF44   037B 02C6
        BLE     L_DF41                          ; DF46   0226 0006
        PULR    R7                              ; DF48   02B7

L_DF49:
        PSHR    R5                              ; DF49   0275
        MVO     R1,     G_01A3                  ; DF4A   0241 01A3
        MVII    #$0014, R0                      ; DF4C   02B8 0014

        JSR     R5,     X_MPY                   ; DF4E   0004 011C 01DC

        MOVR    R2,     R3                      ; DF51   0093
        ADDI    #$023C, R2                      ; DF52   02FA 023C
        SDBD                                    ; DF54   0001
        MVII    #$24F7, R0                      ; DF55   02B8 00F7 0024
        MVO@    R0,     R2                      ; DF58   0250
        ADDI    #$024E, R3                      ; DF59   02FB 024E
        SDBD                                    ; DF5B   0001
        MVII    #$24E7, R0                      ; DF5C   02B8 00E7 0024
        MVO@    R0,     R3                      ; DF5F   0258
        PULR    R7                              ; DF60   02B7

        PSHR    R5                              ; DF61   0275
        MVI     G_0169, R0                      ; DF62   0280 0169
        TSTR    R0                              ; DF64   0080
        BNEQ    L_DF75                          ; DF65   020C 000E

        MVII    #$0032, R0                      ; DF67   02B8 0032
        MVO     R0,     G_0169                  ; DF69   0240 0169
        MVII    #$0004, R0                      ; DF6B   02B8 0004
        MVO     R0,     G_019F                  ; DF6D   0240 019F
        SDBD                                    ; DF6F   0001
        MVII    #$6FAC, R0                      ; DF70   02B8 00AC 006F
        MVO     R0,     G_035D                  ; DF73   0240 035D
L_DF75:
        PULR    R7                              ; DF75   02B7

L_DF76:
        PSHR    R5                              ; DF76   0275
        MVI     G_01A5, R0                      ; DF77   0280 01A5
        TSTR    R0                              ; DF79   0080
        BEQ     L_DFB2                          ; DF7A   0204 0036

        MVII    #$01B2, R2                      ; DF7C   02BA 01B2
        ADD     G_01A3, R2                      ; DF7E   02C2 01A3
        MVI@    R2,     R0                      ; DF80   0290
        SUB     G_01A4, R0                      ; DF81   0300 01A4
        TSTR    R0                              ; DF83   0080
        BMI     L_DFEF                          ; DF84   020B 0069

        MVO@    R0,     R2                      ; DF86   0250
        MVI     G_01A3, R0                      ; DF87   0280 01A3
        MVII    #$0006, R1                      ; DF89   02B9 0006

        JSR     R5,     X_MPY                   ; DF8B   0004 011C 01DC

        SDBD                                    ; DF8E   0001
        ADDI    #$6F71, R2                      ; DF8F   02FA 0071 006F
        ADD     G_01A0, R2                      ; DF92   02C2 01A0
        MVI@    R2,     R0                      ; DF94   0290
        MVI     G_01A4, R1                      ; DF95   0281 01A4

        JSR     R5,     X_MPY                   ; DF97   0004 011C 01DC

        MVI     G_035C, R3                      ; DF9A   0283 035C
        ADDR    R2,     R3                      ; DF9C   00D3
        MVO     R3,     G_035C                  ; DF9D   0243 035C
        SDBD                                    ; DF9F   0001
        MVII    #$6F9B, R2                      ; DFA0   02BA 009B 006F
        ADD     G_01A3, R2                      ; DFA3   02C2 01A3
        MVI@    R2,     R0                      ; DFA5   0290
        MVI     G_01A4, R1                      ; DFA6   0281 01A4

        JSR     R5,     X_MPY                   ; DFA8   0004 011C 01DC

        MVI     G_01A9, R3                      ; DFAB   0283 01A9
        SUBR    R2,     R3                      ; DFAD   0113
        MVO     R3,     G_01A9                  ; DFAE   0243 01A9
        B       L_DFF2                          ; DFB0   0200 0040

L_DFB2:
        MVI     G_01A3, R1                      ; DFB2   0281 01A3
        CMPI    #$0006, R1                      ; DFB4   0379 0006
        BEQ     L_DFF5                          ; DFB6   0204 003D

        MVI     G_01A3, R0                      ; DFB8   0280 01A3
        MVII    #$0006, R1                      ; DFBA   02B9 0006

        JSR     R5,     X_MPY                   ; DFBC   0004 011C 01DC

        SDBD                                    ; DFBF   0001
        ADDI    #$6F4D, R2                      ; DFC0   02FA 004D 006F
        ADD     G_01A0, R2                      ; DFC3   02C2 01A0
        MVI@    R2,     R0                      ; DFC5   0290
        MVI     G_01A4, R1                      ; DFC6   0281 01A4

        JSR     R5,     X_MPY                   ; DFC8   0004 011C 01DC

        MVI     G_035C, R3                      ; DFCB   0283 035C
        SUBR    R2,     R3                      ; DFCD   0113
        TSTR    R3                              ; DFCE   009B
        BMI     L_DFEE                          ; DFCF   020B 001D

        MVO     R3,     G_035C                  ; DFD1   0243 035C
        MVII    #$01B2, R2                      ; DFD3   02BA 01B2
        ADD     G_01A3, R2                      ; DFD5   02C2 01A3
        MVI@    R2,     R0                      ; DFD7   0290
        ADD     G_01A4, R0                      ; DFD8   02C0 01A4
        MVO@    R0,     R2                      ; DFDA   0250
        SDBD                                    ; DFDB   0001
        MVII    #$6F9B, R2                      ; DFDC   02BA 009B 006F
        ADD     G_01A3, R2                      ; DFDF   02C2 01A3
        MVI@    R2,     R0                      ; DFE1   0290
        MVI     G_01A4, R1                      ; DFE2   0281 01A4

        JSR     R5,     X_MPY                   ; DFE4   0004 011C 01DC

        MVI     G_01A9, R3                      ; DFE7   0283 01A9
        ADDR    R2,     R3                      ; DFE9   00D3
        MVO     R3,     G_01A9                  ; DFEA   0243 01A9
        B       L_DFF2                          ; DFEC   0200 0004

L_DFEE:
        NOP                                     ; DFEE   0034
L_DFEF:
        NOP                                     ; DFEF   0034
        B       L_DFF5                          ; DFF0   0200 0003

L_DFF2:
        JSR     R5,     L_DC40                  ; DFF2   0004 01DC 0040

L_DFF5:
        PULR    R7                              ; DFF5   02B7

        PSHR    R5                              ; DFF6   0275
        MVI     G_0169, R0                      ; DFF7   0280 0169
        TSTR    R0                              ; DFF9   0080
        BNEQ    L_DF75                          ; DFFA   022C 0086

        MVII    #$0032, R0                      ; DFFC   02B8 0032
        MVO     R0,     G_0169                  ; DFFE   0240 0169

        ORG     $F000
        MVI     G_01A3, R0                      ; F000   0280 01A3
        DECR    R0                              ; F002   0010
        MVO     R0,     G_01A3                  ; F003   0240 01A3
        MVII    #$0005, R0                      ; F005   02B8 0005
        MVO     R0,     G_019F                  ; F007   0240 019F
        PULR    R7                              ; F009   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; F00A   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0101,  $0000   ; F00E   0000 0080 0101 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F012   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F016   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F01A   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0101,  $0080   ; F01E   0000 0080 0101 0080
        DECLE   $0300,  $0000,  $0000,  $0000   ; F022   0300 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F026   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; F02A   0000 0000 0080 0040
        DECLE   $0000,  $0080,  $0111,  $0000   ; F02E   0000 0080 0111 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; F032   0000 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F036   0000 0000 0000 0000
        DECLE   $0100,  $0000,  $0000,  $0004   ; F03A   0100 0000 0000 0004
        DECLE   $0000,  $0080,  $0101,  $0000   ; F03E   0000 0080 0101 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; F042   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F046   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0100,  $0000   ; F04A   0000 0000 0100 0000
        DECLE   $0000,  $0080,  $0100,  $0000   ; F04E   0000 0080 0100 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F052   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; F056   0000 0000 0000 0001
        DECLE   $0080,  $0002,  $0000,  $0000   ; F05A   0080 0002 0000 0000
        DECLE   $0000,  $0080,  $0101,  $0000   ; F05E   0000 0080 0101 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; F062   0020 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; F066   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F06A   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0201,  $0000   ; F06E   0000 0080 0201 0000
        DECLE   $0000,  $0010,  $0104,  $0000   ; F072   0000 0010 0104 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F076   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0100,  $0000   ; F07A   0001 0000 0100 0000
        DECLE   $0000,  $0080,  $0101,  $0000   ; F07E   0000 0080 0101 0000
        DECLE   $0240,  $0000,  $0000,  $0000   ; F082   0240 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F086   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0001   ; F08A   0000 0040 0000 0001
        DECLE   $0000,  $0081,  $0101,  $0000   ; F08E   0000 0081 0101 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F092   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0220,  $0000   ; F096   0000 0000 0220 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; F09A   0000 0002 0000 0000
        DECLE   $0000,  $0008,  $0101,  $0000   ; F09E   0000 0008 0101 0000
        DECLE   $0000,  $0004,  $0000,  $0000   ; F0A2   0000 0004 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; F0A6   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0101,  $0020   ; F0AA   0000 0000 0101 0020
        DECLE   $0024,  $0088,  $0101,  $0000   ; F0AE   0024 0088 0101 0000
        DECLE   $0000,  $0000,  $0082,  $0000   ; F0B2   0000 0000 0082 0000
        DECLE   $0000,  $0100,  $0100,  $0000   ; F0B6   0000 0100 0100 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0BA   0000 0000 0000 0000
        DECLE   $0020,  $0080,  $0101,  $0000   ; F0BE   0020 0080 0101 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; F0C2   0040 0000 0000 0000
        DECLE   $0208,  $0000,  $0000,  $0000   ; F0C6   0208 0000 0000 0000
        DECLE   $0008,  $0000,  $0004,  $0000   ; F0CA   0008 0000 0004 0000
        DECLE   $0000,  $0080,  $0110,  $0000   ; F0CE   0000 0080 0110 0000
        DECLE   $0001,  $0000,  $0020,  $0000   ; F0D2   0001 0000 0020 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; F0D6   0100 0000 0000 0000
        DECLE   $0000,  $0021,  $0000,  $0000   ; F0DA   0000 0021 0000 0000
        DECLE   $0080,  $0080,  $0101,  $0008   ; F0DE   0080 0080 0101 0008
        DECLE   $0000,  $0000,  $0000,  $0001   ; F0E2   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E6   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; F0EA   0000 0080 0000 0000
        DECLE   $0080,  $0080,  $0101,  $0008   ; F0EE   0080 0080 0101 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0F2   0000 0000 0000 0000

        B       L_F0F8                          ; F0F6   0200 0000

L_F0F8:
        NEGR    R0                              ; F0F8   0020
        DECLE   $0001,  $0000,  $0000,  $0000   ; F0F9   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F0FD   0000 0000 0080 0101
        DECLE   $0040,  $0010,  $0000,  $0000   ; F101   0040 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; F105   0000 0000 0000 0100
        DECLE   $0000,  $0002,  $0000,  $0000   ; F109   0000 0002 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0001   ; F10D   0000 0000 0080 0001
        DECLE   $0008,  $0000,  $0000,  $0000   ; F111   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F115   0000 0000 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F119   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F11D   0000 0000 0080 0101
        DECLE   $0000,  $0000,  $0000,  $0000   ; F121   0000 0000 0000 0000
        DECLE   $0090,  $0000,  $0000,  $0000   ; F125   0090 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F129   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F12D   0000 0000 0080 0101
        DECLE   $0100,  $0200,  $0000,  $0000   ; F131   0100 0200 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0100   ; F135   0000 0000 0001 0100
        DECLE   $0010,  $0100,  $0000,  $0100   ; F139   0010 0100 0000 0100
        DECLE   $0000,  $0000,  $0080,  $0101   ; F13D   0000 0000 0080 0101
        DECLE   $0000,  $0008,  $0000,  $0000   ; F141   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F145   0000 0000 0000 0000
        DECLE   $0000                           ; F149   0000

        BC      L_F14C                          ; F14A   0201 0000

L_F14C:
        INCR    R0                              ; F14C   0008
        DECLE   $0000,  $0200,  $02A0,  $0101   ; F14D   0000 0200 02A0 0101
        DECLE   $0000,  $0000,  $0010,  $0020   ; F151   0000 0000 0010 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F155   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; F159   0080 0000 0000 0000

        DECR    R0                              ; F15D   0010
        B       L_F1E0                          ; F15E   0200 0080

        DECLE   $0100,  $0000,  $0200,  $0000   ; F160   0100 0000 0200 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F164   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F168   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0080   ; F16C   0001 0000 0000 0080
        DECLE   $0101,  $0000,  $0200,  $0040   ; F170   0101 0000 0200 0040
        DECLE   $0008,  $0000,  $0000,  $0000   ; F174   0008 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $0000   ; F178   0000 0001 0002 0000
        DECLE   $0000,  $0020,  $0010,  $0080   ; F17C   0000 0020 0010 0080
        DECLE   $0301,  $0080,  $0000,  $0000   ; F180   0301 0080 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0000   ; F184   0000 0004 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; F188   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F18C   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0040   ; F190   0101 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; F194   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; F198   0000 0000 0000 0100
        DECLE   $0000,  $0000,  $0080,  $0090   ; F19C   0000 0000 0080 0090
        DECLE   $0101,  $0000,  $0000,  $0000   ; F1A0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1A4   0000 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; F1A8   0200 0000 0000 0000
        DECLE   $0004,  $0000,  $0000,  $0080   ; F1AC   0004 0000 0000 0080
        DECLE   $0101,  $0000,  $0022,  $0000   ; F1B0   0101 0000 0022 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B8   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0082   ; F1BC   0000 0004 0000 0082
        DECLE   $0101,  $0020,  $0000,  $0000   ; F1C0   0101 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1C4   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0204,  $0000   ; F1C8   0000 0042 0204 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F1CC   0000 0000 0000 0080
        DECLE   $0101,  $0001,  $0000,  $0010   ; F1D0   0101 0001 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1D4   0000 0000 0000 0000
        DECLE   $0280,  $0000,  $0200,  $0000   ; F1D8   0280 0000 0200 0000
        DECLE   $0000,  $0000,  $0000           ; F1DC   0000 0000 0000

        TSTR    R0                              ; F1DF   0080
L_F1E0:
        SUBR    R0,     R1                      ; F1E0   0101
        DECLE   $0000,  $0020,  $0000,  $0000   ; F1E1   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; F1E5   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F1ED   0000 0000 0080 0101
        DECLE   $0000,  $0100,  $0000,  $0000   ; F1F1   0000 0100 0000 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; F1F5   0100 0000 0000 0000
        DECLE   $0240,  $0000,  $0004,  $0000   ; F1F9   0240 0000 0004 0000
        DECLE   $0040,  $0000,  $0000,  $0101   ; F1FD   0040 0000 0000 0101
        DECLE   $0000,  $0000,  $0000,  $0080   ; F201   0000 0000 0000 0080
        DECLE   $0000,  $0008,  $0000,  $0000   ; F205   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F209   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0080,  $0109   ; F20D   0002 0000 0080 0109
        DECLE   $0000,  $0000,  $0000,  $0000   ; F211   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F215   0000 0000 0000 0000
        DECLE   $0001,  $0200,  $0000,  $0000   ; F219   0001 0200 0000 0000
        DECLE   $0200,  $0020,  $0080,  $0101   ; F21D   0200 0020 0080 0101
        DECLE   $0000,  $0100,  $0000,  $0000   ; F221   0000 0100 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0200   ; F225   0000 0001 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0010   ; F229   0000 0000 0000 0010
        DECLE   $0000,  $0200,  $0080,  $0101   ; F22D   0000 0200 0080 0101
        DECLE   $0008,  $0228,  $0000,  $0000   ; F231   0008 0228 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0000   ; F235   0000 0000 000C 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; F239   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F23D   0000 0000 0080 0101
        DECLE   $0000,  $0000,  $0000,  $0000   ; F241   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0100   ; F245   0080 0000 0000 0100
        DECLE   $0000,  $0000,  $0008,  $0000   ; F249   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F24D   0000 0000 0080 0101
        DECLE   $0000,  $0002,  $0000,  $0000   ; F251   0000 0002 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0100   ; F255   0000 0000 0002 0100
        DECLE   $0080,  $0000,  $0000,  $0000   ; F259   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0121   ; F25D   0000 0000 0080 0121
        DECLE   $0000,  $0000,  $0000,  $0100   ; F261   0000 0000 0000 0100
        DECLE   $0000,  $0001,  $0000,  $0000   ; F265   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F269   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0101   ; F26D   0000 0000 0080 0101
        DECLE   $0000,  $0000,  $0000,  $0002   ; F271   0000 0000 0000 0002
        DECLE   $0010,  $0004,  $0000,  $0000   ; F275   0010 0004 0000 0000
        DECLE   $0000                           ; F279   0000

        DECR    R0                              ; F27A   0010
        B       L_F27D                          ; F27B   0200 0000

L_F27D:
        INCR    R0                              ; F27D   0008
        DECLE   $0000,  $0000,  $0101,  $0000   ; F27E   0000 0000 0101 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F282   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0100,  $0000   ; F286   0000 0008 0100 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F28A   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0101,  $0000   ; F28E   0000 0080 0101 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; F292   0100 0000 0000 0000
        DECLE   $0000,  $0000                   ; F296   0000 0000

        B       L_F29A                          ; F298   0200 0000

L_F29A:
        SWAP    R0,     1                       ; F29A   0040
        DECLE   $0000,  $0000,  $0000,  $0100   ; F29B   0000 0000 0000 0100
        DECLE   $0080,  $0101,  $0000,  $0000   ; F29F   0080 0101 0000 0000
        DECLE   $0020,  $0008,  $0000,  $0000   ; F2A3   0020 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2AB   0000 0000 0000 0000
        DECLE   $0080,  $0111,  $0000,  $0000   ; F2AF   0080 0111 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0080   ; F2B3   0080 0000 0000 0080
        DECLE   $0001,  $0100,  $0008,  $0000   ; F2B7   0001 0100 0008 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; F2BB   0040 0000 0000 0000
        DECLE   $00C0,  $0101,  $0000,  $0000   ; F2BF   00C0 0101 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; F2C3   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2CB   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F2CF   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2DB   0000 0000 0000 0000
        DECLE   $0088,  $0101,  $0020,  $0000   ; F2DF   0088 0101 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2E3   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0040,  $0000   ; F2E7   0006 0000 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; F2EB   0000 0000 0000 0001
        DECLE   $0080,  $0101,  $0000,  $0004   ; F2EF   0080 0101 0000 0004
        DECLE   $0010,  $0000,  $0000,  $0020   ; F2F3   0010 0000 0000 0020
        DECLE   $0000,  $0140,  $0000,  $0000   ; F2F7   0000 0140 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; F2FB   0000 0008 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0200   ; F2FF   0080 0101 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0000   ; F303   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0200   ; F307   0000 0000 0000 0200
        DECLE   $0000,  $0000,  $0010,  $0000   ; F30B   0000 0000 0010 0000
        DECLE   $0080,  $0101,  $0000,  $0001   ; F30F   0080 0101 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F313   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F317   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F31B   0000 0000 0000 0000
        DECLE   $0080,  $0100,  $0001,  $0010   ; F31F   0080 0100 0001 0010
        DECLE   $0000,  $0040,  $0000,  $0000   ; F323   0000 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; F327   0000 0000 0000 0040
        DECLE   $0000,  $0100,  $0000,  $0010   ; F32B   0000 0100 0000 0010
        DECLE   $0080,  $0101,  $0100,  $0000   ; F32F   0080 0101 0100 0000
        DECLE   $0004,  $0001,  $0000,  $0000   ; F333   0004 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F337   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; F33B   0000 0000 0000 0100
        DECLE   $0080,  $0100,  $0020,  $0200   ; F33F   0080 0100 0020 0200
        DECLE   $0000,  $0000,  $0000,  $0011   ; F343   0000 0000 0000 0011
        DECLE   $0000,  $0010,  $0000,  $0000   ; F347   0000 0010 0000 0000
        DECLE   $0000,  $0300,  $0000,  $0000   ; F34B   0000 0300 0000 0000
        DECLE   $0000,  $0101,  $0000,  $0000   ; F34F   0000 0101 0000 0000
        DECLE   $0000,  $0210,  $0000,  $0000   ; F353   0000 0210 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; F357   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F35B   0000 0000 0000 0000
        DECLE   $0080,  $0001,  $0001,  $0000   ; F35F   0080 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F363   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; F367   0000 0000 0000 0004
        DECLE   $0000,  $0080,  $0000,  $0000   ; F36B   0000 0080 0000 0000
        DECLE   $0088,  $0101,  $0000,  $0000   ; F36F   0088 0101 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; F373   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F377   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F37B   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F37F   0080 0101 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; F383   0000 0080 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; F387   0008 0000 0000 0000
        DECLE   $0010,  $0000,  $0008,  $0000   ; F38B   0010 0000 0008 0000
        DECLE   $0080,  $0101,  $0000,  $0100   ; F38F   0080 0101 0000 0100
        DECLE   $0000,  $0040,  $0000,  $0004   ; F393   0000 0040 0000 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; F397   0000 0000 0000 0000
        DECLE   $0000,  $0100,  $0000,  $0040   ; F39B   0000 0100 0000 0040
        DECLE   $0080,  $0101,  $0020,  $0000   ; F39F   0080 0101 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; F3A7   0000 0000 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0000   ; F3AB   0000 0002 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F3AF   0080 0101 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0040   ; F3B3   0080 0000 0000 0040
        DECLE   $0000,  $0100,  $0000,  $0008   ; F3B7   0000 0100 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3BB   0000 0000 0000 0000
        DECLE   $0080,  $0100,  $0001,  $0000   ; F3BF   0080 0100 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3CB   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F3CF   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; F3D3   0000 0000 0000 0010
        DECLE   $0000,  $0010,  $0004,  $0000   ; F3D7   0000 0010 0004 0000
        DECLE   $0301,  $0000,  $0000,  $0000   ; F3DB   0301 0000 0000 0000
        DECLE   $0088,  $0101,  $0000,  $0300   ; F3DF   0088 0101 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; F3EB   0000 0000 0000 0100
        DECLE   $0000,  $0101,  $0040,  $0000   ; F3EF   0000 0101 0040 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; F3F3   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3FB   0000 0000 0000 0000
        DECLE   $00C0,  $0103,  $0002,  $0000   ; F3FF   00C0 0103 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F403   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0008,  $0000   ; F407   0020 0000 0008 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; F40B   0080 0000 0000 0000
        DECLE   $0080,  $0101,  $0002,  $0000   ; F40F   0080 0101 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; F413   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; F417   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; F41B   0001 0000 0000 0000
        DECLE   $0000,  $0101,  $0000,  $0000   ; F41F   0000 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F423   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; F427   0080 0000 0000 0000
        DECLE   $0001,  $0080,  $0000,  $0000   ; F42B   0001 0080 0000 0000
        DECLE   $0080,  $0115,  $0008,  $0200   ; F42F   0080 0115 0008 0200
        DECLE   $0000,  $0000,  $0000,  $0000   ; F433   0000 0000 0000 0000
        DECLE   $0040,  $0000,  $0000,  $0200   ; F437   0040 0000 0000 0200
        DECLE   $0010,  $0000,  $0040,  $0004   ; F43B   0010 0000 0040 0004
        DECLE   $0001,  $0111,  $0000,  $0000   ; F43F   0001 0111 0000 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; F443   0000 0200 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F447   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; F44B   0000 0000 0000 0002
        DECLE   $0080,  $0101,  $0000,  $0000   ; F44F   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F453   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F457   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; F45B   0000 0000 0000 0004
        DECLE   $0080,  $0101,  $0000,  $0000   ; F45F   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F463   0000 0000 0000 0080
        DECLE   $0000,  $0040,  $0000,  $0000   ; F467   0000 0040 0000 0000
        DECLE   $0000,  $0080,  $0020,  $0000   ; F46B   0000 0080 0020 0000
        DECLE   $00A0,  $0101,  $0000,  $0000   ; F46F   00A0 0101 0000 0000
        DECLE   $0000,  $0004,  $0004,  $0000   ; F473   0000 0004 0004 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; F477   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0200   ; F47B   0000 0000 0080 0200
        DECLE   $0080,  $0100,  $0000,  $0000   ; F47F   0080 0100 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F483   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; F487   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; F48B   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F48F   0080 0101 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; F493   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; F497   0000 0000 0000 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F49B   0000 0000 0000 0000
        DECLE   $0008,  $0101,  $0000,  $0000   ; F49F   0008 0101 0000 0000
        DECLE   $0000,  $0088,  $0010,  $0000   ; F4A3   0000 0088 0010 0000
        DECLE   $0060,  $0000,  $0008,  $0020   ; F4A7   0060 0000 0008 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4AB   0000 0000 0000 0000
        DECLE   $0080,  $0111,  $0000,  $0100   ; F4AF   0080 0111 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0012   ; F4B7   0000 0000 0000 0012
        DECLE   $0040,  $0200,  $0000,  $0000   ; F4BB   0040 0200 0000 0000
        DECLE   $0084,  $0101,  $0000,  $0020   ; F4BF   0084 0101 0000 0020
        DECLE   $0000,  $0000,  $0000,  $0040   ; F4C3   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4C7   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; F4CB   0000 0001 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F4CF   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0200   ; F4D7   0000 0000 0002 0200
        DECLE   $0000,  $0200,  $0000,  $0000   ; F4DB   0000 0200 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0002   ; F4DF   0080 0101 0000 0002
        DECLE   $0000,  $0000,  $0008,  $0000   ; F4E3   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4E7   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; F4EB   0020 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F4EF   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; F4F3   0000 0000 0080 0000
        DECLE   $0040,  $0000,  $0000,  $0002   ; F4F7   0040 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4FB   0000 0000 0000 0000
        DECLE   $0080,  $0001,  $0000,  $0000   ; F4FF   0080 0001 0000 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; F503   0000 0200 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; F507   0000 0080 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; F50B   0000 0001 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F50F   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0000   ; F513   0000 0000 0004 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; F517   0000 0000 0008 0000
        DECLE   $0010,  $0000,  $0020,  $0000   ; F51B   0010 0000 0020 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F51F   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F523   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0002,  $0000   ; F527   0000 0080 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F52B   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0100   ; F52F   0080 0101 0000 0100
        DECLE   $0002,  $0000,  $0000,  $0000   ; F533   0002 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0000   ; F537   0000 0040 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; F53B   0020 0000 0000 0000
        DECLE   $0080,  $0105,  $0000,  $0080   ; F53F   0080 0105 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0020   ; F543   0000 0000 0000 0020
        DECLE   $0004,  $0000,  $0000,  $0000   ; F547   0004 0000 0000 0000
        DECLE   $0000,  $0024,  $0000,  $0041   ; F54B   0000 0024 0000 0041
        DECLE   $0080,  $0101,  $0000,  $0000   ; F54F   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F553   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0080,  $0000   ; F557   0020 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; F55B   0000 0000 0000 0040
        DECLE   $0080,  $0101,  $0000,  $0000   ; F55F   0080 0101 0000 0000
        DECLE   $0000,  $0200,  $0010,  $0000   ; F563   0000 0200 0010 0000
        DECLE   $0000,  $0000,  $0004,  $0000   ; F567   0000 0000 0004 0000
        DECLE   $0000,  $0100,  $0000,  $0000   ; F56B   0000 0100 0000 0000
        DECLE   $0080,  $0100,  $0040,  $0000   ; F56F   0080 0100 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F573   0000 0000 0000 0000
        DECLE   $0009,  $0000,  $0000,  $0000   ; F577   0009 0000 0000 0000
        DECLE   $0012,  $0040,  $0000,  $0000   ; F57B   0012 0040 0000 0000
        DECLE   $0080,  $0101,  $0010,  $0000   ; F57F   0080 0101 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F583   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; F587   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; F58B   0000 0000 0000 0010
        DECLE   $0080,  $0111,  $0000,  $0000   ; F58F   0080 0111 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F593   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F597   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F59B   0000 0000 0000 0000
        DECLE   $0280,  $0301,  $0004,  $0000   ; F59F   0280 0301 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5AB   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0004,  $0100   ; F5AF   0080 0101 0004 0100
        DECLE   $0008,  $0000,  $0000,  $0000   ; F5B3   0008 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0000   ; F5B7   0000 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5BB   0000 0000 0000 0000
        DECLE   $0084,  $0100,  $0000,  $0000   ; F5BF   0084 0100 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5C3   0000 0000 0000 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; F5C7   0000 0200 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5CB   0000 0000 0000 0000
        DECLE   $0080,  $0101,  $0000,  $0000   ; F5CF   0080 0101 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; F5D7   0000 0000 0010 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; F5DB   0000 0002 0000 0000
        DECLE   $0088,  $0100,  $0000,  $0000   ; F5DF   0088 0100 0000 0000
        DECLE   $0001,  $0000,  $0008,  $0000   ; F5E3   0001 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F5E7   0000 0000 0000 0080
        DECLE   $0008,  $0220,  $0000,  $0000   ; F5EB   0008 0220 0000 0000
        DECLE   $0080,  $0101,  $0004,  $0000   ; F5EF   0080 0101 0004 0000
        DECLE   $0080,  $0280,  $0000,  $0000   ; F5F3   0080 0280 0000 0000
        DECLE   $0000,  $0108,  $0000,  $0002   ; F5F7   0000 0108 0000 0002
        DECLE   $0000,  $0140,  $0000,  $0040   ; F5FB   0000 0140 0000 0040
        DECLE   $0084,  $0100,  $0000,  $0200   ; F5FF   0084 0100 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0000   ; F603   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F607   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0002   ; F60B   0008 0000 0000 0002
        DECLE   $0008,  $0101,  $0000,  $0008   ; F60F   0008 0101 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; F613   0000 0000 0000 0000
        DECLE   $0180,  $0002,  $0008,  $0000   ; F617   0180 0002 0008 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; F61B   0100 0000 0000 0000
        DECLE   $0080,  $0101,  $0020,  $0000   ; F61F   0080 0101 0020 0000
        DECLE   $0000,  $0010,  $0000,  $0000   ; F623   0000 0010 0000 0000
        DECLE   $0000,  $0000                   ; F627   0000 0000

        DECR    R0                              ; F629   0010
        EIS                                     ; F62A   0002
        EIS                                     ; F62B   0002
        TSTR    R0                              ; F62C   0080

        JSR     R4,     .EXEC.080               ; F62D   0004 0010 0080
        DECLE   $0101,  $0000,  $0000,  $0100   ; F630   0101 0000 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0000   ; F634   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0008   ; F638   0000 0008 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0080   ; F63C   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0008,  $0000   ; F640   0101 0000 0008 0000
        DECLE   $0000,  $0000,  $0200,  $0000   ; F644   0000 0000 0200 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F648   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0080   ; F64C   0000 0040 0000 0080
        DECLE   $0101,  $0040,  $0000,  $0000   ; F650   0101 0040 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; F654   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F658   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F65C   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; F660   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F664   0000 0000 0000 0000
        DECLE   $0100,  $0000,  $0000,  $0010   ; F668   0100 0000 0000 0010
        DECLE   $0004,  $0000,  $0000,  $0080   ; F66C   0004 0000 0000 0080
        DECLE   $0181,  $0004,  $0000,  $0000   ; F670   0181 0004 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0004   ; F674   0000 0008 0000 0004
        DECLE   $0040,  $0000,  $0000,  $0000   ; F678   0040 0000 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0088   ; F67C   0000 0004 0000 0088
        DECLE   $0181,  $0000,  $0000,  $0020   ; F680   0181 0000 0000 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F684   0000 0000 0000 0000
        DECLE   $0010,  $0200,  $0020,  $0000   ; F688   0010 0200 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F68C   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; F690   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; F694   0000 0000 0000 0020
        DECLE   $0000,  $0000,  $0000,  $0040   ; F698   0000 0000 0000 0040
        DECLE   $0010,  $0000,  $0000,  $0080   ; F69C   0010 0000 0000 0080
        DECLE   $0103,  $0000,  $0000,  $0080   ; F6A0   0103 0000 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; F6A8   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F6AC   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; F6B0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; F6B4   0000 0000 0000 0100
        DECLE   $0110,  $0020,  $0000,  $0001   ; F6B8   0110 0020 0000 0001
        DECLE   $0100,  $0000,  $0000,  $0080   ; F6BC   0100 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; F6C0   0101 0000 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0020   ; F6C4   0000 0004 0000 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6C8   0000 0000 0000 0000
        DECLE   $0004,  $0020,  $0008,  $0080   ; F6CC   0004 0020 0008 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; F6D0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; F6D4   0000 0000 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F6DC   0000 0000 0000 0080
        DECLE   $0101,  $0020,  $0040,  $0020   ; F6E0   0101 0020 0040 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0080   ; F6EC   0000 0000 0010 0080
        DECLE   $0101,  $0000,  $0100,  $0008   ; F6F0   0101 0000 0100 0008
        DECLE   $0000,  $0020,  $0000,  $0080   ; F6F4   0000 0020 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6F8   0000 0000 0000 0000
        DECLE   $0004,  $0000,  $0000,  $0080   ; F6FC   0004 0000 0000 0080
        DECLE   $0002,  $0280,  $0102,  $0080   ; F700   0002 0280 0102 0080
        DECLE   $022C,  $0005,  $0001,  $02BD   ; F704   022C 0005 0001 02BD
        DECLE   $00F9,  $00ED,  $02BA,  $0002   ; F708   00F9 00ED 02BA 0002
        DECLE   $02BB,  $00F1,  $026B,  $026A   ; F70C   02BB 00F1 026B 026A
        DECLE   $02BA,  $0010,  $02BB,  $008F   ; F710   02BA 0010 02BB 008F
        DECLE   $026B,  $026A,  $02FD,  $0008   ; F714   026B 026A 02FD 0008
        DECLE   $02B8,  $0004,  $02B9,  $0010   ; F718   02B8 0004 02B9 0010
        DECLE   $0268,  $0269,  $0010,  $022C   ; F71C   0268 0269 0010 022C
        DECLE   $0004,  $01C0,  $0001,  $02BB   ; F720   0004 01C0 0001 02BB
        DECLE   $0015,  $00EE,  $0258,  $02B8   ; F724   0015 00EE 0258 02B8
        DECLE   $000F,  $0001,  $02BB,  $0011   ; F728   000F 0001 02BB 0011
        DECLE   $00EE,  $0258,  $0004,  $01EC   ; F72C   00EE 0258 0004 01EC
        DECLE   $0161,  $0001,  $02B8,  $00E4   ; F730   0161 0001 02B8 00E4
        DECLE   $00E8,  $0240,  $035D,  $01C0   ; F734   00E8 0240 035D 01C0
        DECLE   $0240,  $0123,  $0240,  $0124   ; F738   0240 0123 0240 0124
        DECLE   $02B8,  $0001,  $0001,  $02BB   ; F73C   02B8 0001 0001 02BB
        DECLE   $0028,  $00EE,  $0258,  $0004   ; F740   0028 00EE 0258 0004
        DECLE   $01EC,  $0196,  $02BE,  $02F1   ; F744   01EC 0196 02BE 02F1
        DECLE   $0004,  $01EC,  $0161,  $0004   ; F748   0004 01EC 0161 0004
        DECLE   $01E4,  $0375,  $0004,  $01EC   ; F74C   01E4 0375 0004 01EC
        DECLE   $0161,  $0001,  $02BB,  $0015   ; F750   0161 0001 02BB 0015
        DECLE   $00EE,  $0298,  $0080,  $0204   ; F754   00EE 0298 0080 0204
        DECLE   $000E,  $0001,  $02BA,  $0067   ; F758   000E 0001 02BA 0067
        DECLE   $00E7,  $0001,  $02BD,  $0043   ; F75C   00E7 0001 02BD 0043
        DECLE   $00EF,  $026A,  $0042,  $026A   ; F760   00EF 026A 0042 026A
        DECLE   $0004                           ; F764   0004

        XOR@    R5,     R0                      ; F765   03E8
        SUBR    R2,     R6                      ; F766   0116
        MVII    #$0003, R0                      ; F767   02B8 0003
        SWAP    R0,     1                       ; F769   0040
L_F76A:
        DECR    R0                              ; F76A   0010
        BNEQ    L_F76A                          ; F76B   022C 0002

        SDBD                                    ; F76D   0001
        MVII    #$E746, R5                      ; F76E   02BD 0046 00E7
        PSHR    R5                              ; F771   0275
        J       .EXEC.523                       ; F772   0004 0314 0123

        SDBD                                    ; F775   0001
        MVII    #$EE28, R4                      ; F776   02BC 0028 00EE
        MVI@    R4,     R0                      ; F779   02A0
        TSTR    R0                              ; F77A   0080
        BEQ     L_F95B                          ; F77B   0204 01DE

        PSHR    R5                              ; F77D   0275
        MVII    #$001A, R0                      ; F77E   02B8 001A
        SDBD                                    ; F780   0001
        MVII    #$E8B0, R5                      ; F781   02BD 00B0 00E8
        SDBD                                    ; F784   0001
        MVII    #$E8CA, R4                      ; F785   02BC 00CA 00E8
L_F788:
        MVI@    R5,     R1                      ; F788   02A9
        MVI@    R4,     R3                      ; F789   02A3
        MVO@    R1,     R3                      ; F78A   0259
        DECR    R0                              ; F78B   0010
        BNEQ    L_F788                          ; F78C   022C 0005

        MVII    #$0012, R1                      ; F78E   02B9 0012
        SDBD                                    ; F790   0001
        MVII    #$E818, R5                      ; F791   02BD 0018 00E8
        CLRR    R0                              ; F794   01C0
L_F795:
        MVI@    R5,     R2                      ; F795   02AA
        MVO@    R0,     R2                      ; F796   0250
        DECR    R1                              ; F797   0011
        BNEQ    L_F795                          ; F798   022C 0004

        SDBD                                    ; F79A   0001
        MVII    #$ECDF, R5                      ; F79B   02BD 00DF 00EC
L_F79E:
        MVI@    R5,     R4                      ; F79E   02AC
        CMPI    #$00FF, R4                      ; F79F   037C 00FF
        BEQ     L_F817                          ; F7A1   0204 0074

        SDBD                                    ; F7A3   0001
        ADDI    #$EDED, R4                      ; F7A4   02FC 00ED 00ED
        SDBD                                    ; F7A7   0001
        MVI@    R4,     R1                      ; F7A8   02A1
        MVI@    R5,     R2                      ; F7A9   02AA
        PSHR    R2                              ; F7AA   0272
        MVI@    R5,     R3                      ; F7AB   02AB
        TSTR    R3                              ; F7AC   009B
        BEQ     L_F7D3                          ; F7AD   0204 0024

        CMPI    #$02F1, R1                      ; F7AF   0379 02F1
        BNC     L_F7BE                          ; F7B1   0209 000B

        CMPI    #$0311, R1                      ; F7B3   0379 0311
        BC      L_F7BE                          ; F7B5   0201 0007

        ADDR    R1,     R1                      ; F7B7   00C9
        SDBD                                    ; F7B8   0001
        ADDI    #$E90F, R1                      ; F7B9   02F9 000F 00E9
        B       L_F7CB                          ; F7BC   0200 000D

L_F7BE:
        CMPI    #$0214, R1                      ; F7BE   0379 0214
        BNC     L_F7D2                          ; F7C0   0209 0010

        CMPI    #$0278, R1                      ; F7C2   0379 0278
        BC      L_F7D2                          ; F7C4   0201 000C

        ADDR    R1,     R1                      ; F7C6   00C9
        SDBD                                    ; F7C7   0001
        ADDI    #$EA01, R1                      ; F7C8   02F9 0001 00EA
L_F7CB:
        PSHR    R5                              ; F7CB   0275
        MOVR    R1,     R5                      ; F7CC   008D
        SDBD                                    ; F7CD   0001
        MVI@    R5,     R1                      ; F7CE   02A9
        PULR    R5                              ; F7CF   02B5
        B       L_F7D3                          ; F7D0   0200 0001

L_F7D2:
        MVI@    R1,     R1                      ; F7D2   0289
L_F7D3:
        MVI@    R5,     R3                      ; F7D3   02AB
        MVI@    R5,     R4                      ; F7D4   02AC
        SDBD                                    ; F7D5   0001
        MVII    #$EE11, R2                      ; F7D6   02BA 0011 00EE
        MVI@    R2,     R2                      ; F7D9   0292
        CMPI    #$000C, R2                      ; F7DA   037A 000C
        BNC     L_F7E2                          ; F7DC   0209 0004

        CMPI    #$0010, R2                      ; F7DE   037A 0010
        BNC     L_F7EB                          ; F7E0   0209 0009

L_F7E2:
        CLRR    R0                              ; F7E2   01C0
        MVO     R0,     .BTAB.5F                ; F7E3   0240 025F
        MVO     R0,     .BTAB.60                ; F7E5   0240 0260
        MVO     R0,     .BTAB.61                ; F7E7   0240 0261
        MVO     R0,     .BTAB.62                ; F7E9   0240 0262
L_F7EB:
        INCR    R2                              ; F7EB   000A
        PSHR    R2                              ; F7EC   0272
        SLL     R2,     2                       ; F7ED   004E
        ADD@    R6,     R2                      ; F7EE   02F2
        SDBD                                    ; F7EF   0001
        ADDI    #$ECDF, R2                      ; F7F0   02FA 00DF 00EC
        CMPR    R2,     R5                      ; F7F3   0155
        BNEQ    L_F7F8                          ; F7F4   020C 0002

        MVII    #$0006, R3                      ; F7F6   02BB 0006
L_F7F8:
        PULR    R2                              ; F7F8   02B2
        DECLE   $0275,  $037A,  $0003,  $0204   ; F7F9   0275 037A 0003 0204
        DECLE   $0008,  $0092,  $0204,  $0009   ; F7FD   0008 0092 0204 0009
        DECLE   $0004                           ; F801   0004

        XORR    R5,     R0                      ; F802   01E8
        DECR    R0                              ; F803   0010
        B       L_F80D                          ; F804   0200 0007

        DECLE   $037B,  $0006,  $020C,  $0003   ; F806   037B 0006 020C 0003
        DECLE   $0004                           ; F80A   0004

        XORR    R5,     R0                      ; F80B   01E8
        ADCR    R2                              ; F80C   002A
L_F80D:
        PULR    R5                              ; F80D   02B5
        B       L_F79E                          ; F80E   0220 0071

        DECLE   $0275,  $0088,  $03B8,  $0001   ; F810   0275 0088 03B8 0001
        DECLE   $0004                           ; F814   0004

        XORR    R5,     R0                      ; F815   01E8
        SLL     R2,     1                       ; F816   004A
L_F817:
        PULR    R7                              ; F817   02B7

        DECLE   $0264,  $0277,  $021B,  $022F   ; F818   0264 0277 021B 022F
        DECLE   $0243,  $0257,  $0214,  $0228   ; F81C   0243 0257 0214 0228
        DECLE   $023C,  $0250,  $0222,  $0236   ; F820   023C 0250 0222 0236
        DECLE   $024A,  $025E,  $0227,  $023B   ; F824   024A 025E 0227 023B
        DECLE   $024F,  $0263,  $0275,  $0088   ; F828   024F 0263 0275 0088
        DECLE   $0040,  $0064,  $0064,  $03B8   ; F82C   0040 0064 0064 03B8
        DECLE   $000F,  $0004                   ; F830   000F 0004

        XORR    R5,     R0                      ; F832   01E8
L_F833:
        SLL     R2,     1                       ; F833   004A
        DECLE   $0088,  $0040,  $03B8,  $000F   ; F834   0088 0040 03B8 000F
        DECLE   $0004,  $01E8,  $004A,  $0088   ; F838   0004 01E8 004A 0088
        DECLE   $0064,  $0064,  $03B8,  $000F   ; F83C   0064 0064 03B8 000F
        DECLE   $0004,  $01E8,  $004A,  $0088   ; F840   0004 01E8 004A 0088
        DECLE   $03B8,  $000F,  $0004           ; F844   03B8 000F 0004

        XORR    R5,     R0                      ; F847   01E8
        SLL     R2,     1                       ; F848   004A
        PULR    R7                              ; F849   02B7

        PSHR    R5                              ; F84A   0275
        CMPI    #$000A, R0                      ; F84B   0378 000A
        BC      L_F853                          ; F84D   0201 0004

        ADDI    #$0010, R0                      ; F84F   02F8 0010
        B       L_F855                          ; F851   0200 0002

L_F853:
        ADDI    #$0017, R0                      ; F853   02F8 0017
L_F855:
        SLL     R0,     2                       ; F855   004C
        SLL     R0,     1                       ; F856   0048
        XORR    R3,     R0                      ; F857   01D8
        MVO@    R0,     R4                      ; F858   0260
        PULR    R7                              ; F859   02B7

        DECLE   $0274,  $0270,  $0030,  $0270   ; F85A   0274 0270 0030 0270
        DECLE   $000D,  $0001,  $02BC,  $00FB   ; F85E   000D 0001 02BC 00FB
        DECLE   $00ED,  $00A8,  $0338,  $0005   ; F862   00ED 00A8 0338 0005
        DECLE   $0260,  $0040,  $0260,  $0001   ; F866   0260 0040 0260 0001
        DECLE   $02BC,  $0043,  $00EF,  $0001   ; F86A   02BC 0043 00EF 0001
        DECLE   $02B8,  $0046,  $00E7,  $0260   ; F86E   02B8 0046 00E7 0260
        DECLE   $0040,  $0260,  $0001,  $02BC   ; F872   0040 0260 0001 02BC
        DECLE   $0014,  $00EE,  $01C0,  $0260   ; F876   0014 00EE 01C0 0260
        DECLE   $02B0,  $0038,  $02B0,  $02B4   ; F87A   02B0 0038 02B0 02B4
        DECLE   $02B5,  $0004,  $03E8,  $02A4   ; F87E   02B5 0004 03E8 02A4
        DECLE   $0275,  $0270,  $0030,  $0270   ; F882   0275 0270 0030 0270
        DECLE   $0273,  $0001,  $02BB,  $0027   ; F886   0273 0001 02BB 0027
        DECLE   $00EE,  $0298,  $0080,  $020C   ; F88A   00EE 0298 0080 020C
        DECLE   $0015,  $0280,  $01FF,  $0378   ; F88E   0015 0280 01FF 0378
        DECLE   $003F,  $020C,  $000F,  $0001   ; F892   003F 020C 000F 0001
        DECLE   $02BB,  $0011,  $00EE,  $02B8   ; F896   02BB 0011 00EE 02B8
        DECLE   $0010,  $0258,  $02B3,  $02B0   ; F89A   0010 0258 02B3 02B0
        DECLE   $0038,  $02B0,  $02B5,  $0004   ; F89E   0038 02B0 02B5 0004

        XOR@    R5,     R0                      ; F8A2   03E8
        SLLC    R2,     1                       ; F8A3   005A
        PULR    R3                              ; F8A4   02B3
        PULR    R0                              ; F8A5   02B0
        RSWD    R0                              ; F8A6   0038
        PULR    R0                              ; F8A7   02B0
        PULR    R7                              ; F8A8   02B7

        DECLE   $0275,  $0270,  $0030,  $0270   ; F8A9   0275 0270 0030 0270
        DECLE   $0273,  $0220,  $001A           ; F8AD   0273 0220 001A

        SAR     R2,     2                       ; F8B0   006E
        SAR     R2,     2                       ; F8B1   006E
        SAR     R2,     2                       ; F8B2   006E
        SAR     R2,     2                       ; F8B3   006E
        SAR     R2,     2                       ; F8B4   006E
        SAR     R2,     2                       ; F8B5   006E
        SAR     R2,     2                       ; F8B6   006E
        SAR     R2,     2                       ; F8B7   006E
        SAR     R2,     2                       ; F8B8   006E
        SAR     R2,     2                       ; F8B9   006E
        MOVR    R0,     R7                      ; F8BA   0087
        MOVR    R1,     R7                      ; F8BB   008F
        MOVR    R2,     R7                      ; F8BC   0097
        MOVR    R3,     R7                      ; F8BD   009F
        MOVR    R4,     R7                      ; F8BE   00A7
        MOVR    R5,     R7                      ; F8BF   00AF

        DECLE   $00B7,  $00BF,  $019F,  $01D7   ; F8C0   00B7 00BF 019F 01D7
        DECLE   $01B7,  $011F,  $0112,  $0192   ; F8C4   01B7 011F 0112 0192
        DECLE   $015A,  $019A,  $0216,  $022A   ; F8C8   015A 019A 0216 022A
        DECLE   $023E,  $0252,  $021D,  $0231   ; F8CC   023E 0252 021D 0231
        DECLE   $0245,  $0259,  $0269,  $0272   ; F8D0   0245 0259 0269 0272
        DECLE   $0215,  $0229,  $023D,  $0251   ; F8D4   0215 0229 023D 0251
        DECLE   $021C,  $0230,  $0244,  $0258   ; F8D8   021C 0230 0244 0258
        DECLE   $0223,  $0224,  $0225,  $0226   ; F8DC   0223 0224 0225 0226
        DECLE   $024B,  $024C,  $024D,  $024E   ; F8E0   024B 024C 024D 024E
        DECLE   $0004                           ; F8E4   0004

        ADDR    R5,     R1                      ; F8E5   00E9
        SWAP    R1,     2                       ; F8E6   0045
        ADDR    R5,     R3                      ; F8E7   00EB
        ADDR    R5,     R6                      ; F8E8   00EE
        ADDR    R5,     R0                      ; F8E9   00E8
        ADDR    R0,     R7                      ; F8EA   00C7

        DECLE   $00EC,  $00A0,  $00EC,  $0378   ; F8EB   00EC 00A0 00EC 0378
        DECLE   $0001,  $020C,  $0069,  $0379   ; F8EF   0001 020C 0069 0379
        DECLE   $0001,  $020C,  $0065,  $0001   ; F8F3   0001 020C 0065 0001
        DECLE   $02BC,  $0043,  $00EF,  $0001   ; F8F7   02BC 0043 00EF 0001
        DECLE   $02BA,  $0046,  $00E7,  $0262   ; F8FB   02BA 0046 00E7 0262
        DECLE   $0042,  $0262,  $0004,  $03E8   ; F8FF   0042 0262 0004 03E8
        DECLE   $0116,  $0275,  $0001,  $02BD   ; F903   0116 0275 0001 02BD
        DECLE   $0028,  $00EE,  $0080,  $020B   ; F907   0028 00EE 0080 020B
        DECLE   $0006,  $01C0,  $0268,  $0004   ; F90B   0006 01C0 0268 0004

        XORR    R5,     R4                      ; F90F   01EC
        ANDR    R0,     R0                      ; F910   0180
        PULR    R7                              ; F911   02B7

        MVII    #$0001, R0                      ; F912   02B8 0001
        MVO@    R0,     R5                      ; F914   0268
        PULR    R7                              ; F915   02B7

        DECLE   $0001,  $02BB,  $0027,  $00EE   ; F916   0001 02BB 0027 00EE
        DECLE   $0258,  $0004,  $01EC,  $0161   ; F91A   0258 0004 01EC 0161
        DECLE   $0001,  $02BD,  $0014,  $00EE   ; F91E   0001 02BD 0014 00EE
        DECLE   $01C0,  $0268,  $0001,  $02BC   ; F922   01C0 0268 0001 02BC
        DECLE   $0020,  $00EE,  $0001,  $02BD   ; F926   0020 00EE 0001 02BD
        DECLE   $00FB,  $00ED,  $0001,  $02AB   ; F92A   00FB 00ED 0001 02AB
        DECLE   $029A,  $037A,  $0004,  $020C   ; F92E   029A 037A 0004 020C
        DECLE   $0029,  $000B,  $0299,  $000B   ; F932   0029 000B 0299 000B
        DECLE   $0298,  $000B,  $0065,  $004D   ; F936   0298 000B 0065 004D
        DECLE   $0041,  $008C,  $03BC,  $0003   ; F93A   0041 008C 03BC 0003
        DECLE   $01E1,  $01C1,  $00E4,  $0001   ; F93E   01E1 01C1 00E4 0001
        DECLE   $02FC,  $00F5,  $00ED,  $0263   ; F942   02FC 00F5 00ED 0263
        DECLE   $0043,  $0263,  $0001,  $02BC   ; F946   0043 0263 0001 02BC
        DECLE   $00FB,  $00ED,  $0261,  $0041   ; F94A   00FB 00ED 0261 0041
        DECLE   $0261,  $0004                   ; F94E   0261 0004

        CLRR    R4                              ; F950   01E4
        CMPI    #$0004, R5                      ; F951   037D 0004
        XORR    R5,     R4                      ; F953   01EC
        CMPR    R4,     R1                      ; F954   0161
        SDBD                                    ; F955   0001
        MVII    #$EF43, R5                      ; F956   02BD 0043 00EF
        SDBD                                    ; F959   0001
        MVI@    R5,     R7                      ; F95A   02AF
L_F95B:
        MOVR    R5,     R7                      ; F95B   00AF

        DECLE   $0091,  $03B9,  $03C0,  $0379   ; F95C   0091 03B9 03C0 0379
        DECLE   $0200,  $020C,  $0047,  $0093   ; F960   0200 020C 0047 0093
        DECLE   $03BB,  $0020,  $01DA,  $0262   ; F964   03BB 0020 01DA 0262
        DECLE   $0001,  $02BD,  $00A5,  $00E9   ; F968   0001 02BD 00A5 00E9
        DECLE   $02B8,  $0005,  $02A9,  $0261   ; F96C   02B8 0005 02A9 0261
        DECLE   $0010,  $022C,  $0004,  $01C0   ; F970   0010 022C 0004 01C0
        DECLE   $02BA,  $0004,  $0001,  $02BD   ; F974   02BA 0004 0001 02BD
        DECLE   $00FD,  $00ED,  $0001,  $02A9   ; F978   00FD 00ED 0001 02A9
        DECLE   $03B9,  $0001,  $01C8,  $0048   ; F97C   03B9 0001 01C8 0048
        DECLE   $0012,  $022C,  $0008,  $004C   ; F980   0012 022C 0008 004C
        DECLE   $0048,  $0038,  $02B8,  $0000   ; F984   0048 0038 02B8 0000
        DECLE   $0004                           ; F988   0004

        XOR@    R5,     R4                      ; F989   03EC
L_F98A:
        B       L_F98A                          ; F98A   0220 0001

        MVII    #$00FB, R5                      ; F98C   02BD 00FB
        ADDR    R5,     R5                      ; F98E   00ED
        SDBD                                    ; F98F   0001
        MVI@    R5,     R1                      ; F990   02A9
        ADDI    #$0002, R1                      ; F991   02F9 0002
        SUBI    #$0002, R5                      ; F993   033D 0002
        TSTR    R0                              ; F995   0080
        BNEQ    L_F9A0                          ; F996   020C 0008

        DECR    R1                              ; F998   0011
        MVI@    R1,     R4                      ; F999   028C
        INCR    R1                              ; F99A   0009
        TSTR    R3                              ; F99B   009B
        BEQ     L_F99F                          ; F99C   0204 0001

        COMR    R4                              ; F99E   001C
L_F99F:
        ADDR    R4,     R1                      ; F99F   00E1
L_F9A0:
        MVO@    R1,     R5                      ; F9A0   0269
        DECLE   $0041,  $0269,  $0220,  $0055   ; F9A1   0041 0269 0220 0055
        DECLE   $0001,  $0008,  $0004           ; F9A5   0001 0008 0004

        XOR@    R5,     R0                      ; F9A8   03E8
        ANDR    R1,     R3                      ; F9A9   018B
        INCR    R3                              ; F9AA   000B
        DECR    R5                              ; F9AB   0015
        DECR    R5                              ; F9AC   0015
        MVII    #$0034, R0                      ; F9AD   02B8 0034
        MVO@    R0,     R4                      ; F9AF   0260
        CMPI    #$0001, R2                      ; F9B0   037A 0001
        BNEQ    L_F9B9                          ; F9B2   020C 0005

        DECR    R4                              ; F9B4   0014
        MVO@    R2,     R4                      ; F9B5   0262
        MVI@    R3,     R2                      ; F9B6   029A
        INCR    R3                              ; F9B7   000B
        CLRR    R0                              ; F9B8   01C0
L_F9B9:
        MVO@    R2,     R4                      ; F9B9   0262
        MOVR    R2,     R1                      ; F9BA   0091
        ANDI    #$0238, R1                      ; F9BB   03B9 0238
        CMPI    #$0200, R1                      ; F9BD   0379 0200
        BEQ     L_F9C5                          ; F9BF   0204 0004

        CMPI    #$0238, R1                      ; F9C1   0379 0238
        BNEQ    L_F9CE                          ; F9C3   020C 0009

L_F9C5:
        MVI@    R3,     R2                      ; F9C5   029A
        MVO@    R2,     R4                      ; F9C6   0262
        INCR    R3                              ; F9C7   000B
        TSTR    R0                              ; F9C8   0080
        BNEQ    L_F9CE                          ; F9C9   020C 0003

        MVI@    R3,     R2                      ; F9CB   029A
        MVO@    R2,     R4                      ; F9CC   0262
        INCR    R3                              ; F9CD   000B
L_F9CE:
        MVO@    R3,     R5                      ; F9CE   026B
        DECLE   $0043,  $026B,  $02B8,  $0003   ; F9CF   0043 026B 02B8 0003
        DECLE   $0001,  $02BD,  $0044,  $00ED   ; F9D3   0001 02BD 0044 00ED
        DECLE   $02A9,  $0261,  $0010,  $022C   ; F9D7   02A9 0261 0010 022C
        DECLE   $0004,  $0001,  $02BD,  $0021   ; F9DB   0004 0001 02BD 0021
        DECLE   $00EE,  $02A8,  $0378,  $0007   ; F9DF   00EE 02A8 0378 0007
        DECLE   $0204,  $007D,  $0081,  $03B8   ; F9E3   0204 007D 0081 03B8
        DECLE   $03C0,  $0378,  $0040,  $0204   ; F9E7   03C0 0378 0040 0204
        DECLE   $0076,  $0088,  $03B8,  $03F8   ; F9EB   0076 0088 03B8 03F8
        DECLE   $0378,  $0038,  $0204,  $006F   ; F9EF   0378 0038 0204 006F
        DECLE   $0088,  $03B8,  $003F,  $0378   ; F9F3   0088 03B8 003F 0378
        DECLE   $002F,  $0204,  $0056,  $0088   ; F9F7   002F 0204 0056 0088
        DECLE   $03B8,  $0007,  $0378,  $0007   ; F9FB   03B8 0007 0378 0007
        DECLE   $0204,  $003B,  $0088,  $03B8   ; F9FF   0204 003B 0088 03B8
        DECLE   $0200,  $020C,  $005C,  $0088   ; FA03   0200 020C 005C 0088
        DECLE   $03B8,  $003F,  $0378,  $003D   ; FA07   03B8 003F 0378 003D
        DECLE   $0204,  $001B,  $0088,  $03B8   ; FA0B   0204 001B 0088 03B8
        DECLE   $0038,  $0378,  $0038,  $020C   ; FA0F   0038 0378 0038 020C
        DECLE   $004E,  $02BB,  $0005,  $0001   ; FA13   004E 02BB 0005 0001
        DECLE   $02BC,  $00F7,  $00ED,  $0004   ; FA17   02BC 00F7 00ED 0004

        XORR    R5,     R4                      ; FA1B   01EC
        CMPR    R0,     R7                      ; FA1C   0147
        SDBD                                    ; FA1D   0001
        MVII    #$EE21, R5                      ; FA1E   02BD 0021 00EE
        MVI@    R5,     R0                      ; FA21   02A8
        XORI    #$0010, R0                      ; FA22   03F8 0010
        DECR    R5                              ; FA24   0015
        MVO@    R0,     R5                      ; FA25   0268
        B       L_FA62                          ; FA26   0200 003A

        DECLE   $02BB,  $0004,  $0001,  $02BC   ; FA28   02BB 0004 0001 02BC
        DECLE   $00F5,  $00ED,  $0004           ; FA2C   00F5 00ED 0004

        XORR    R5,     R4                      ; FA2F   01EC
        CMPR    R0,     R7                      ; FA30   0147
        SDBD                                    ; FA31   0001
        MVII    #$EE21, R5                      ; FA32   02BD 0021 00EE
        MVI@    R5,     R0                      ; FA35   02A8
        XORI    #$0018, R0                      ; FA36   03F8 0018
        DECR    R5                              ; FA38   0015
        MVO@    R0,     R5                      ; FA39   0268
        B       L_FA62                          ; FA3A   0200 0026

        DECLE   $02BB,  $0005,  $0001,  $02BC   ; FA3C   02BB 0005 0001 02BC
        DECLE   $00F7,  $00ED,  $0004           ; FA40   00F7 00ED 0004

        XORR    R5,     R4                      ; FA43   01EC
        CMPR    R0,     R7                      ; FA44   0147
        SDBD                                    ; FA45   0001
        MVII    #$EE21, R5                      ; FA46   02BD 0021 00EE
        MVI@    R5,     R0                      ; FA49   02A8
        XORI    #$0002, R0                      ; FA4A   03F8 0002
        DECR    R5                              ; FA4C   0015
        MVO@    R0,     R5                      ; FA4D   0268
        B       L_FA62                          ; FA4E   0200 0012

        DECLE   $02BB,  $0004,  $0001,  $02BC   ; FA50   02BB 0004 0001 02BC
        DECLE   $00F5,  $00ED,  $0004           ; FA54   00F5 00ED 0004

        XORR    R5,     R4                      ; FA57   01EC
        CMPR    R0,     R7                      ; FA58   0147
        SDBD                                    ; FA59   0001
        MVII    #$EE21, R5                      ; FA5A   02BD 0021 00EE
        MVI@    R5,     R0                      ; FA5D   02A8
        XORI    #$0003, R0                      ; FA5E   03F8 0003
        DECR    R5                              ; FA60   0015
        MVO@    R0,     R5                      ; FA61   0268
L_FA62:
        SDBD                                    ; FA62   0001
        DECLE   $02BD,  $0012,  $00EE,  $00B0   ; FA63   02BD 0012 00EE 00B0
        DECLE   $0268,  $0040,  $0268,  $01C0   ; FA67   0268 0040 0268 01C0
        DECLE   $02BB,  $0004,  $0001,  $02BD   ; FA6B   02BB 0004 0001 02BD
        DECLE   $00FD,  $00ED,  $0001,  $02A9   ; FA6F   00FD 00ED 0001 02A9
        DECLE   $03B9,  $0001,  $01C8,  $0048   ; FA73   03B9 0001 01C8 0048
        DECLE   $0013,  $022C,  $0008,  $004C   ; FA77   0013 022C 0008 004C
        DECLE   $0048,  $0001,  $02BD,  $00EF   ; FA7B   0048 0001 02BD 00EF
        DECLE   $00ED,  $0001,  $02A9,  $0001   ; FA7F   00ED 0001 02A9 0001
        DECLE   $02AA,  $0001,  $02AB,  $0001   ; FA83   02AA 0001 02AB 0001
        DECLE   $02AC,  $000D,  $000D,  $0001   ; FA87   02AC 000D 000D 0001
        DECLE   $02AE,  $0004,  $01EC,  $0180   ; FA8B   02AE 0004 01EC 0180
        DECLE   $0004,  $01E8,  $0321,  $0274   ; FA8F   0004 01E8 0321 0274
        DECLE   $0001,  $02BC,  $00F7,  $00ED   ; FA93   0001 02BC 00F7 00ED
        DECLE   $0001,  $02A5,  $0038,  $0001   ; FA97   0001 02A5 0038 0001
        DECLE   $02BC,  $00ED,  $00ED,  $0001   ; FA9B   02BC 00ED 00ED 0001
        DECLE   $02A0,  $02B4,  $0004           ; FA9F   02A0 02B4 0004

        XOR@    R5,     R4                      ; FAA2   03EC
        B       L_F833                          ; FAA3   0220 0271

        DECLE   $0270,  $0034,  $0274,  $0001   ; FAA5   0270 0034 0274 0001
        DECLE   $02BC,  $0003,  $00EE,  $0030   ; FAA9   02BC 0003 00EE 0030
        DECLE   $0064,  $0064,  $02B9,  $0004   ; FAAD   0064 0064 02B9 0004
        DECLE   $0260,  $033C,  $0003,  $0060   ; FAB1   0260 033C 0003 0060
        DECLE   $0011,  $022C,  $0006,  $0001   ; FAB5   0011 022C 0006 0001
        DECLE   $02BC,  $00F7,  $00ED,  $00A8   ; FAB9   02BC 00F7 00ED 00A8
        DECLE   $0260,  $0040,  $0260,  $02B4   ; FABD   0260 0040 0260 02B4
        DECLE   $0001,  $02BD,  $00F9,  $00ED   ; FAC1   0001 02BD 00F9 00ED
        DECLE   $00B0,  $0010,  $0010,  $0268   ; FAC5   00B0 0010 0010 0268
        DECLE   $0040,  $0268,  $02B0,  $02B1   ; FAC9   0040 0268 02B0 02B1
        DECLE   $0004,  $01E8,  $0321,  $0004   ; FACD   0004 01E8 0321 0004
        DECLE   $01EC,  $0196,  $02BE,  $02F1   ; FAD1   01EC 0196 02BE 02F1
        DECLE   $0001,  $02BD,  $00ED,  $00ED   ; FAD5   0001 02BD 00ED 00ED
        DECLE   $0268,  $0040,  $0268,  $0269   ; FAD9   0268 0040 0268 0269
        DECLE   $0034,  $0041,  $0269,  $026A   ; FADD   0034 0041 0269 026A
        DECLE   $0034,  $0042,  $026A,  $026B   ; FAE1   0034 0042 026A 026B
        DECLE   $0043,  $026B,  $00A0,  $0268   ; FAE5   0043 026B 00A0 0268
        DECLE   $0034,  $0040,  $0268,  $0001   ; FAE9   0034 0040 0268 0001
        DECLE   $02BB,  $0059,  $00EF,  $0298   ; FAED   02BB 0059 00EF 0298
        DECLE   $01C9,  $0259,  $0080,  $0204   ; FAF1   01C9 0259 0080 0204
        DECLE   $0003,  $0004,  $01EC,  $01D4   ; FAF5   0003 0004 01EC 01D4
        DECLE   $0280,  $0102,  $0080,  $022C   ; FAF9   0280 0102 0080 022C
        DECLE   $0004,  $0001,  $02BD,  $0014   ; FAFD   0004 0001 02BD 0014
        DECLE   $00EE,  $02A8,  $0378,  $0004   ; FB01   00EE 02A8 0378 0004
        DECLE   $020C,  $000B,  $0001,  $02BC   ; FB05   020C 000B 0001 02BC
        DECLE   $00F5,  $00ED,  $02BB,  $0004   ; FB09   00F5 00ED 02BB 0004
        DECLE   $0004,  $01EC,  $0147,  $0220   ; FB0D   0004 01EC 0147 0220
        DECLE   $01C2,  $0378,  $0005,  $022C   ; FB11   01C2 0378 0005 022C
        DECLE   $01C6,  $0001,  $02BC,  $00F7   ; FB15   01C6 0001 02BC 00F7
        DECLE   $00ED,  $02BB,  $0005,  $0004   ; FB19   00ED 02BB 0005 0004
        DECLE   $01EC,  $0147,  $0220,  $01D1   ; FB1D   01EC 0147 0220 01D1

        CMPI    #$02F1, R6                      ; FB21   037E 02F1
        BEQ     L_F95B                          ; FB23   0224 01C9

        PSHR    R5                              ; FB25   0275
        PSHR    R0                              ; FB26   0270
        PSHR    R4                              ; FB27   0274
        PSHR    R1                              ; FB28   0271
        PSHR    R3                              ; FB29   0273
        SDBD                                    ; FB2A   0001
        MVII    #$EEF1, R4                      ; FB2B   02BC 00F1 00EE
        MVII    #$02F1, R5                      ; FB2E   02BD 02F1
        MOVR    R6,     R0                      ; FB30   00B0
        SUBI    #$02F6, R0                      ; FB31   0338 02F6
L_FB33:
        SDBD                                    ; FB33   0001
        MVI@    R4,     R1                      ; FB34   02A1
        MVI@    R5,     R3                      ; FB35   02AB
        DECR    R5                              ; FB36   0015
        DECR    R4                              ; FB37   0014
        DECR    R4                              ; FB38   0014
        MVO@    R1,     R5                      ; FB39   0269
        MVO@    R3,     R4                      ; FB3A   0263
        SWAP    R3,     1                       ; FB3B   0043
        MVO@    R3,     R4                      ; FB3C   0263
        DECR    R0                              ; FB3D   0010
        BNEQ    L_FB33                          ; FB3E   022C 000C

        PULR    R3                              ; FB40   02B3
        PULR    R1                              ; FB41   02B1
        PULR    R4                              ; FB42   02B4
        PULR    R0                              ; FB43   02B0
        PULR    R7                              ; FB44   02B7

        DECLE   $00AA,  $0001,  $02BD,  $0043   ; FB45   00AA 0001 02BD 0043
        DECLE   $00EF,  $026A,  $0042,  $026A   ; FB49   00EF 026A 0042 026A
        DECLE   $004D,  $0271,  $0049,  $02F1   ; FB4D   004D 0271 0049 02F1
        DECLE   $00C8,  $0004                   ; FB51   00C8 0004

        XORR    R5,     R4                      ; FB53   01EC
        CMPR    R4,     R1                      ; FB54   0161
        CMPI    #$0016, R0                      ; FB55   0378 0016
        BNEQ    L_FB8A                          ; FB57   020C 0031
        B       L_FB75                          ; FB59   0200 001A

        SDBD                                    ; FB5B   0001
        MVII    #$EE05, R5                      ; FB5C   02BD 0005 00EE
        MVII    #$0004, R0                      ; FB5F   02B8 0004
        SDBD                                    ; FB61   0001
        MVII    #$EDFB, R4                      ; FB62   02BC 00FB 00ED
        SDBD                                    ; FB65   0001
        MVI@    R4,     R1                      ; FB66   02A1
L_FB67:
        SDBD                                    ; FB67   0001
        DECLE   $02AA,  $010A,  $0022,  $0012   ; FB68   02AA 010A 0022 0012
        DECLE   $037A,  $0004,  $0209,  $0005   ; FB6C   037A 0004 0209 0005
        DECLE   $0010,  $0204,  $0010           ; FB70   0010 0204 0010

        B       L_FB67                          ; FB73   0220 000D

L_FB75:
        SDBD                                    ; FB75   0001
        DECLE   $02BB,  $005B,  $00EB,  $0001   ; FB76   02BB 005B 00EB 0001
        DECLE   $02BD,  $0043,  $00EF,  $026B   ; FB7A   02BD 0043 00EF 026B
        DECLE   $0043,  $026B,  $0004,  $03E8   ; FB7E   0043 026B 0004 03E8
        DECLE   $0116,  $0004                   ; FB82   0116 0004

        XORR    R5,     R4                      ; FB84   01EC
        ANDR    R5,     R5                      ; FB85   01AD
        MVII    #$0001, R1                      ; FB86   02B9 0001
        B       L_FBE0                          ; FB88   0200 0056

L_FB8A:
        CMPI    #$0017, R0                      ; FB8A   0378 0017
        DECLE   $020C,  $0009,  $02B8,  $0001   ; FB8C   020C 0009 02B8 0001
        DECLE   $0001,  $02BB,  $0015,  $00EE   ; FB90   0001 02BB 0015 00EE
        DECLE   $0258,  $0220,  $0247,  $0001   ; FB94   0258 0220 0247 0001
        DECLE   $02BB,  $0015,  $00EE,  $0299   ; FB98   02BB 0015 00EE 0299
        DECLE   $0089,  $022C,  $024F,  $0378   ; FB9C   0089 022C 024F 0378
        DECLE   $0015,  $020C,  $0009,  $0004   ; FBA0   0015 020C 0009 0004
        DECLE   $01EC,  $006B,  $0008,  $0004   ; FBA4   01EC 006B 0008 0004
        DECLE   $01EC,  $0037,  $0220,  $025C   ; FBA8   01EC 0037 0220 025C
        DECLE   $0378,  $0014,  $020C,  $0006   ; FBAC   0378 0014 020C 0006
        DECLE   $01C0,  $0004,  $01EC,  $0037   ; FBB0   01C0 0004 01EC 0037
        DECLE   $0220,  $0266,  $0378,  $0013   ; FBB4   0220 0266 0378 0013
        DECLE   $020C,  $0009,  $0004,  $01EC   ; FBB8   020C 0009 0004 01EC
        DECLE   $006B,  $0010,  $0004,  $01EC   ; FBBC   006B 0010 0004 01EC
        DECLE   $0037,  $0220,  $0273,  $0378   ; FBC0   0037 0220 0273 0378
        DECLE   $000A,  $0224,  $0277,  $0378   ; FBC4   000A 0224 0277 0378
        DECLE   $000B,  $0224,  $027B           ; FBC8   000B 0224 027B

        CLRR    R1                              ; FBCB   01C9
        CMPI    #$000C, R0                      ; FBCC   0378 000C
        BEQ     L_FBE0                          ; FBCE   0204 0010
        BNC     L_FBD4                          ; FBD0   0209 0002

        SUBI    #$0003, R0                      ; FBD2   0338 0003
L_FBD4:
        PSHR    R0                              ; FBD4   0270
        DECLE   $0004,  $01EC,  $006B,  $004C   ; FBD5   0004 01EC 006B 004C
        DECLE   $004C,  $03F0,  $0004,  $01EC   ; FBD9   004C 03F0 0004 01EC
        DECLE   $0037,  $0220,  $0290           ; FBDD   0037 0220 0290
L_FBE0:
        CLRR    R0                              ; FBE0   01C0
        DECLE   $0001,  $02BB,  $0059,  $00EF   ; FBE1   0001 02BB 0059 00EF
        DECLE   $0259,  $0001,  $02BB,  $0027   ; FBE5   0259 0001 02BB 0027
        DECLE   $00EE,  $0258,  $02B8,  $0080   ; FBE9   00EE 0258 02B8 0080
        DECLE   $0040,  $0010,  $022C,  $0002   ; FBED   0040 0010 022C 0002
        DECLE   $0001,  $02B8,  $0046,  $00E7   ; FBF1   0001 02B8 0046 00E7
        DECLE   $0001,  $02BD,  $0043,  $00EF   ; FBF5   0001 02BD 0043 00EF
        DECLE   $0268,  $0040,  $0268,  $0001   ; FBF9   0268 0040 0268 0001
        DECLE   $02BC,  $0020,  $00EE,  $02B8   ; FBFD   02BC 0020 00EE 02B8
        DECLE   $0004,  $0260,  $0001,  $02BD   ; FC01   0004 0260 0001 02BD
        DECLE   $00FB,  $00ED,  $0001,  $02A9   ; FC05   00FB 00ED 0001 02A9
        DECLE   $008A,  $0042,  $03BA,  $00FC   ; FC09   008A 0042 03BA 00FC
        DECLE   $03FA,  $0300,  $0262,  $0261   ; FC0D   03FA 0300 0262 0261
        DECLE   $0004                           ; FC11   0004

        XOR@    R5,     R0                      ; FC12   03E8
        MVO@    R2,     R4                      ; FC13   0262
        PSHR    R5                              ; FC14   0275
        CLRR    R2                              ; FC15   01D2
        SDBD                                    ; FC16   0001
        MVII    #$EE11, R4                      ; FC17   02BC 0011 00EE
        MVI@    R4,     R4                      ; FC1A   02A4
        CMPI    #$0013, R4                      ; FC1B   037C 0013
        BNEQ    L_FC24                          ; FC1D   020C 0005

        INCR    R2                              ; FC1F   000A
        DECR    R4                              ; FC20   0014
        DECR    R4                              ; FC21   0014
        B       L_FC31                          ; FC22   0200 000D

L_FC24:
        CMPI    #$0012, R4                      ; FC24   037C 0012
        BNEQ    L_FC2B                          ; FC26   020C 0003

        DECR    R4                              ; FC28   0014
        B       L_FC31                          ; FC29   0200 0006

L_FC2B:
        CMPI    #$0011, R4                      ; FC2B   037C 0011
        BNEQ    L_FC31                          ; FC2D   020C 0002

        INCR    R2                              ; FC2F   000A
        DECR    R4                              ; FC30   0014
L_FC31:
        ADDR    R4,     R4                      ; FC31   00E4
        SDBD                                    ; FC32   0001
        ADDI    #$EDED, R4                      ; FC33   02FC 00ED 00ED
        PULR    R7                              ; FC36   02B7

        DECLE   $0275,  $0004                   ; FC37   0275 0004

        XORR    R5,     R4                      ; FC39   01EC
        DECR    R4                              ; FC3A   0014
        TSTR    R2                              ; FC3B   0092
        BEQ     L_FC61                          ; FC3C   0204 0023

        SDBD                                    ; FC3E   0001
        MVI@    R4,     R1                      ; FC3F   02A1
        CMPI    #$02F1, R1                      ; FC40   0379 02F1
        BNC     L_FC4F                          ; FC42   0209 000B

        CMPI    #$0311, R1                      ; FC44   0379 0311
        BC      L_FC4F                          ; FC46   0201 0007

        ADDR    R1,     R1                      ; FC48   00C9
        SDBD                                    ; FC49   0001
        ADDI    #$E90F, R1                      ; FC4A   02F9 000F 00E9
        B       L_FC5C                          ; FC4D   0200 000D

L_FC4F:
        CMPI    #$0214, R1                      ; FC4F   0379 0214
        BNC     L_FC5F                          ; FC51   0209 000C

        CMPI    #$0278, R1                      ; FC53   0379 0278
        BC      L_FC5F                          ; FC55   0201 0008

        ADDR    R1,     R1                      ; FC57   00C9
        SDBD                                    ; FC58   0001
        ADDI    #$EA01, R1                      ; FC59   02F9 0001 00EA
L_FC5C:
        MVO@    R0,     R1                      ; FC5C   0248
        INCR    R1                              ; FC5D   0009
        SWAP    R0,     1                       ; FC5E   0040
L_FC5F:
        MVO@    R0,     R1                      ; FC5F   0248
        PULR    R7                              ; FC60   02B7

L_FC61:
        MOVR    R0,     R1                      ; FC61   0081
        MOVR    R0,     R2                      ; FC62   0082
        SWAP    R2,     1                       ; FC63   0042
        ANDI    #$00FF, R1                      ; FC64   03B9 00FF
        ANDI    #$00FF, R2                      ; FC66   03BA 00FF
        MVO@    R1,     R4                      ; FC68   0261
        MVO@    R2,     R4                      ; FC69   0262
        PULR    R7                              ; FC6A   02B7

        DECLE   $0275,  $0004                   ; FC6B   0275 0004

        XORR    R5,     R4                      ; FC6D   01EC
        DECR    R4                              ; FC6E   0014
        TSTR    R2                              ; FC6F   0092
        BEQ     L_FC9D                          ; FC70   0204 002B

        SDBD                                    ; FC72   0001
        MVI@    R4,     R1                      ; FC73   02A1
        CMPI    #$02F1, R1                      ; FC74   0379 02F1
        BNC     L_FC83                          ; FC76   0209 000B

        CMPI    #$0311, R1                      ; FC78   0379 0311
        BC      L_FC83                          ; FC7A   0201 0007

        ADDR    R1,     R1                      ; FC7C   00C9
        SDBD                                    ; FC7D   0001
        ADDI    #$E90F, R1                      ; FC7E   02F9 000F 00E9
        B       L_FC90                          ; FC81   0200 000D

L_FC83:
        CMPI    #$0214, R1                      ; FC83   0379 0214
        BNC     L_FC9B                          ; FC85   0209 0014

        CMPI    #$0278, R1                      ; FC87   0379 0278
        BC      L_FC9B                          ; FC89   0201 0010

        ADDR    R1,     R1                      ; FC8B   00C9
        SDBD                                    ; FC8C   0001
        ADDI    #$EA01, R1                      ; FC8D   02F9 0001 00EA
L_FC90:
        MVI@    R1,     R0                      ; FC90   0288
        INCR    R1                              ; FC91   0009
        ANDI    #$00FF, R0                      ; FC92   03B8 00FF
        SWAP    R0,     1                       ; FC94   0040
        MVI@    R1,     R3                      ; FC95   028B
        ANDI    #$00FF, R3                      ; FC96   03BB 00FF
        XORR    R3,     R0                      ; FC98   01D8
        SWAP    R0,     1                       ; FC99   0040
        PULR    R7                              ; FC9A   02B7

L_FC9B:
        MVI@    R1,     R0                      ; FC9B   0288
        PULR    R7                              ; FC9C   02B7

L_FC9D:
        SDBD                                    ; FC9D   0001
        MVI@    R4,     R0                      ; FC9E   02A0
        PULR    R7                              ; FC9F   02B7

        DECLE   $0275,  $0378,  $0001,  $020C   ; FCA0   0275 0378 0001 020C
        DECLE   $0021,  $0379,  $0001,  $0204   ; FCA4   0021 0379 0001 0204
        DECLE   $0008                           ; FCA8   0008

        SDBD                                    ; FCA9   0001
        MVII    #$EE15, R3                      ; FCAA   02BB 0015 00EE
        CLRR    R0                              ; FCAD   01C0
        MVO@    R0,     R3                      ; FCAE   0258
        B       L_FCC6                          ; FCAF   0200 0015

        DECLE   $0004                           ; FCB1   0004

        XORR    R5,     R4                      ; FCB2   01EC
        CMPR    R4,     R1                      ; FCB3   0161
        SDBD                                    ; FCB4   0001
        MVII    #$EE11, R3                      ; FCB5   02BB 0011 00EE
        MVI@    R3,     R0                      ; FCB8   0298
        INCR    R0                              ; FCB9   0008
        CMPI    #$0014, R0                      ; FCBA   0378 0014
        BNEQ    L_FCBF                          ; FCBC   020C 0001

        CLRR    R0                              ; FCBE   01C0
L_FCBF:
        MVO@    R0,     R3                      ; FCBF   0258
        DECLE   $0004                           ; FCC0   0004

        CLRR    R4                              ; FCC1   01E4
        CMPI    #$0004, R5                      ; FCC2   037D 0004
        XORR    R5,     R4                      ; FCC4   01EC
        CMPR    R4,     R1                      ; FCC5   0161
L_FCC6:
        PULR    R7                              ; FCC6   02B7

        PSHR    R5                              ; FCC7   0275
        CMPI    #$0001, R0                      ; FCC8   0378 0001
        BNEQ    L_FCC6                          ; FCCA   022C 0005

        CMPI    #$0001, R1                      ; FCCC   0379 0001
        BNEQ    L_FCC6                          ; FCCE   022C 0009

        SDBD                                    ; FCD0   0001
        MVII    #$EE11, R3                      ; FCD1   02BB 0011 00EE
        MVI@    R3,     R0                      ; FCD4   0298
        DECR    R0                              ; FCD5   0010
        BPL     L_FCDA                          ; FCD6   0203 0002

        MVII    #$0013, R0                      ; FCD8   02B8 0013
L_FCDA:
        MVO@    R0,     R3                      ; FCDA   0258
        DECLE   $0004,  $01E4,  $037D,  $02B7   ; FCDB   0004 01E4 037D 02B7
        DECLE   $0000,  $0000,  $0000,  $0007   ; FCDF   0000 0000 0000 0007
        DECLE   $0217,  $0002,  $0000,  $0000   ; FCE3   0217 0002 0000 0000
        DECLE   $0007,  $022B,  $0004,  $0000   ; FCE7   0007 022B 0004 0000
        DECLE   $0000,  $0007,  $023F,  $0006   ; FCEB   0000 0007 023F 0006
        DECLE   $0000,  $0000,  $0007,  $0253   ; FCEF   0000 0000 0007 0253
        DECLE   $0008,  $0000,  $0000,  $0007   ; FCF3   0008 0000 0000 0007
        DECLE   $021E,  $000A,  $0000,  $0000   ; FCF7   021E 000A 0000 0000
        DECLE   $0007,  $0232,  $000C,  $0000   ; FCFB   0007 0232 000C 0000
        DECLE   $0000,  $0007,  $0246,  $000E   ; FCFF   0000 0007 0246 000E
        DECLE   $0000,  $0000,  $0007,  $025A   ; FD03   0000 0000 0007 025A
        DECLE   $0010,  $0001,  $0000,  $0007   ; FD07   0010 0001 0000 0007
        DECLE   $0237,  $0012,  $0001,  $0000   ; FD0B   0237 0012 0001 0000
        DECLE   $0007,  $0238,  $0014,  $0001   ; FD0F   0007 0238 0014 0001
        DECLE   $0000,  $0007,  $0239,  $0016   ; FD13   0000 0007 0239 0016
        DECLE   $0001,  $0000,  $0007,  $023A   ; FD17   0001 0000 0007 023A
        DECLE   $0018,  $0003,  $0000,  $0002   ; FD1B   0018 0003 0000 0002
        DECLE   $025F,  $001A,  $0003,  $0000   ; FD1F   025F 001A 0003 0000
        DECLE   $0002,  $025F,  $001C,  $0003   ; FD23   0002 025F 001C 0003
        DECLE   $0000,  $0002,  $025F,  $001E   ; FD27   0000 0002 025F 001E
        DECLE   $0003,  $0000,  $0002,  $025F   ; FD2B   0003 0000 0002 025F
        DECLE   $0020,  $0000,  $0000,  $0002   ; FD2F   0020 0000 0000 0002
        DECLE   $0265,  $0020,  $0000,  $0001   ; FD33   0265 0020 0000 0001
        DECLE   $0002,  $026A,  $0022,  $0000   ; FD37   0002 026A 0022 0000
        DECLE   $0000,  $0001,  $026E,  $0022   ; FD3B   0000 0001 026E 0022
        DECLE   $0000,  $0001,  $0001,  $0273   ; FD3F   0000 0001 0001 0273
        DECLE   $00FF,  $0004                   ; FD43   00FF 0004

        XOR@    R5,     R0                      ; FD45   03E8
        MVI@    R4,     R4                      ; FD46   02A4
        PSHR    R5                              ; FD47   0275
        SDBD                                    ; FD48   0001
        MVII    #$EE14, R5                      ; FD49   02BD 0014 00EE
        MVO@    R3,     R5                      ; FD4C   026B
        SDBD                                    ; FD4D   0001
        MVII    #$EDFB, R5                      ; FD4E   02BD 00FB 00ED
        SDBD                                    ; FD51   0001
        MVI@    R5,     R3                      ; FD52   02AB
        SDBD                                    ; FD53   0001
        MVI@    R4,     R0                      ; FD54   02A0
        DECR    R5                              ; FD55   0015
        DECR    R5                              ; FD56   0015
        DECR    R4                              ; FD57   0014
        DECR    R4                              ; FD58   0014
        MVO@    R0,     R5                      ; FD59   0268
        SWAP    R0,     1                       ; FD5A   0040
        MVO@    R0,     R5                      ; FD5B   0268
        NOP                                     ; FD5C   0034
        MVO@    R3,     R4                      ; FD5D   0263
        SWAP    R3,     1                       ; FD5E   0043
        MVO@    R3,     R4                      ; FD5F   0263
        PULR    R7                              ; FD60   02B7

        PSHR    R5                              ; FD61   0275
        SDBD                                    ; FD62   0001
        MVII    #$EE16, R5                      ; FD63   02BD 0016 00EE
        MVII    #$035D, R4                      ; FD66   02BC 035D
        MVI@    R4,     R1                      ; FD68   02A1
        SDBD                                    ; FD69   0001
        MVI@    R5,     R2                      ; FD6A   02AA
        DECR    R4                              ; FD6B   0014
        DECR    R5                              ; FD6C   0015
        DECR    R5                              ; FD6D   0015
        MVO@    R2,     R4                      ; FD6E   0262
        MVO@    R1,     R5                      ; FD6F   0269
        SWAP    R1,     1                       ; FD70   0041
        MVO@    R1,     R5                      ; FD71   0269
        MVII    #$011F, R4                      ; FD72   02BC 011F
        MVII    #$0006, R3                      ; FD74   02BB 0006
L_FD76:
        MVI@    R5,     R2                      ; FD76   02AA
        MVI@    R4,     R1                      ; FD77   02A1
        DECR    R5                              ; FD78   0015
        DECR    R4                              ; FD79   0014
        MVO@    R1,     R5                      ; FD7A   0269
        MVO@    R2,     R4                      ; FD7B   0262
        DECR    R3                              ; FD7C   0013
        BNEQ    L_FD76                          ; FD7D   022C 0008
        PULR    R7                              ; FD7F   02B7

        PSHR    R5                              ; FD80   0275
        PSHR    R0                              ; FD81   0270
        PSHR    R1                              ; FD82   0271
        PSHR    R4                              ; FD83   0274
        MVII    #$0064, R0                      ; FD84   02B8 0064
        MVII    #$0214, R4                      ; FD86   02BC 0214
        SDBD                                    ; FD88   0001
        MVII    #$EE29, R5                      ; FD89   02BD 0029 00EE
L_FD8C:
        SDBD                                    ; FD8C   0001
        MVI@    R5,     R1                      ; FD8D   02A9
        MVO@    R1,     R4                      ; FD8E   0261
        DECR    R0                              ; FD8F   0010
        BNEQ    L_FD8C                          ; FD90   022C 0005

        PULR    R4                              ; FD92   02B4
        PULR    R1                              ; FD93   02B1
        PULR    R0                              ; FD94   02B0
        PULR    R7                              ; FD95   02B7

        PSHR    R5                              ; FD96   0275
        PSHR    R0                              ; FD97   0270
        PSHR    R1                              ; FD98   0271
        PSHR    R4                              ; FD99   0274
        MVII    #$0064, R0                      ; FD9A   02B8 0064
        MVII    #$0214, R4                      ; FD9C   02BC 0214
        SDBD                                    ; FD9E   0001
        MVII    #$EE29, R5                      ; FD9F   02BD 0029 00EE
L_FDA2:
        MVI@    R4,     R1                      ; FDA2   02A1
        MVO@    R1,     R5                      ; FDA3   0269
        SWAP    R1,     1                       ; FDA4   0041
        MVO@    R1,     R5                      ; FDA5   0269
        DECR    R0                              ; FDA6   0010
        BNEQ    L_FDA2                          ; FDA7   022C 0006

        PULR    R4                              ; FDA9   02B4
        PULR    R1                              ; FDAA   02B1
        PULR    R0                              ; FDAB   02B0
        PULR    R7                              ; FDAC   02B7

        PSHR    R5                              ; FDAD   0275
        MVII    #$0004, R0                      ; FDAE   02B8 0004
        SDBD                                    ; FDB0   0001
        MVII    #$EF45, R5                      ; FDB1   02BD 0045 00EF
        SDBD                                    ; FDB4   0001
        MVII    #$EE05, R4                      ; FDB5   02BC 0005 00EE
L_FDB8:
        SDBD                                    ; FDB8   0001
        MVI@    R4,     R3                      ; FDB9   02A3
        PSHR    R0                              ; FDBA   0270
        MVII    #$0005, R0                      ; FDBB   02B8 0005
        SDBD                                    ; FDBD   0001
        MVII    #$EDCF, R2                      ; FDBE   02BA 00CF 00ED
L_FDC1:
        MVI@    R3,     R1                      ; FDC1   0299
        MVO@    R1,     R5                      ; FDC2   0269
        MVI@    R2,     R1                      ; FDC3   0291
        INCR    R2                              ; FDC4   000A
        MVO@    R1,     R3                      ; FDC5   0259
        INCR    R3                              ; FDC6   000B
        DECR    R0                              ; FDC7   0010
        BNEQ    L_FDC1                          ; FDC8   022C 0008

        PULR    R0                              ; FDCA   02B0
        DECR    R0                              ; FDCB   0010
        BNEQ    L_FDB8                          ; FDCC   022C 0015
        PULR    R7                              ; FDCE   02B7

        DECLE   $0275,  $0004                   ; FDCF   0275 0004

        XORR    R5,     R0                      ; FDD1   01E8
        MOVR    R5,     R1                      ; FDD2   00A9
        PULR    R5                              ; FDD3   02B5
        PSHR    R5                              ; FDD4   0275
        MVII    #$0004, R0                      ; FDD5   02B8 0004
        SDBD                                    ; FDD7   0001
        MVII    #$EF45, R5                      ; FDD8   02BD 0045 00EF
        SDBD                                    ; FDDB   0001
        MVII    #$EE05, R4                      ; FDDC   02BC 0005 00EE
L_FDDF:
        SDBD                                    ; FDDF   0001
        MVI@    R4,     R3                      ; FDE0   02A3
        MVII    #$0005, R2                      ; FDE1   02BA 0005
L_FDE3:
        MVI@    R5,     R1                      ; FDE3   02A9
        MVO@    R1,     R3                      ; FDE4   0259
        INCR    R3                              ; FDE5   000B
        DECR    R2                              ; FDE6   0012
        BNEQ    L_FDE3                          ; FDE7   022C 0005

        DECR    R0                              ; FDE9   0010
        BNEQ    L_FDDF                          ; FDEA   022C 000C
        PULR    R7                              ; FDEC   02B7

        DECLE   $0000,  $0100,  $0080,  $0100   ; FDED   0000 0100 0080 0100
        DECLE   $0000,  $0000,  $0080,  $0001   ; FDF1   0000 0000 0080 0001
        DECLE   $0000,  $0004,  $0000,  $0000   ; FDF5   0000 0004 0000 0000
        DECLE   $0000                           ; FDF9   0000

        B       L_FDFC                          ; FDFA   0200 0000

L_FDFC:
        SUB     .STIC.X.0,R4                    ; FDFC   0304 0000
        DECLE   $0021,  $0000,  $0110,  $0000   ; FDFE   0021 0000 0110 0000
        DECLE   $0008,  $0000,  $0000,  $0100   ; FE02   0008 0000 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0048,  $0001   ; FE0A   0000 0000 0048 0001
        DECLE   $0000,  $0080,  $0301,  $0000   ; FE0E   0000 0080 0301 0000
        DECLE   $0100,  $0000,  $0000,  $0002   ; FE12   0100 0000 0000 0002
        DECLE   $0010,  $0000,  $0000,  $0000   ; FE16   0010 0000 0000 0000
        DECLE   $0010,  $0100,  $0000,  $0100   ; FE1A   0010 0100 0000 0100
        DECLE   $0000,  $0080,  $0011,  $0080   ; FE1E   0000 0080 0011 0080
        DECLE   $0000,  $0000,  $0080,  $0000   ; FE22   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE2A   0000 0000 0000 0000
        DECLE   $0010,  $0100,  $0101,  $0000   ; FE2E   0010 0100 0101 0000
        DECLE   $0090,  $0000,  $0080,  $0001   ; FE32   0090 0000 0080 0001
        DECLE   $0020,  $0000,  $0000,  $0000   ; FE36   0020 0000 0000 0000
        DECLE   $0004,  $0000,  $0004,  $0000   ; FE3A   0004 0000 0004 0000
        DECLE   $0000,  $0180,  $0100,  $0000   ; FE3E   0000 0180 0100 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; FE46   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; FE4A   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0101,  $0000   ; FE4E   0000 0000 0101 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE52   0000 0000 0000 0000
        DECLE   $0090,  $0000,  $0000,  $0000   ; FE56   0090 0000 0000 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; FE5A   0000 0200 0000 0000
        DECLE   $0200,  $0000,  $0001,  $0000   ; FE5E   0200 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE62   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; FE66   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FE6A   0000 0000 0000

        B       L_FE6F                          ; FE6D   0200 0000

L_FE6F:
        MOVR    R0,     R1                      ; FE6F   0081
        DECLE   $0111,  $0100,  $0000,  $0102   ; FE70   0111 0100 0000 0102
        DECLE   $0000,  $0040,  $0020,  $0000   ; FE74   0000 0040 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0080   ; FE7C   0000 0000 0040 0080
        DECLE   $0101,  $0001,  $0081,  $0100   ; FE80   0101 0001 0081 0100
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE88   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; FE8C   0010 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; FE90   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; FE94   0000 0000 0020 0000
        DECLE   $0010,  $0000,  $0002,  $0000   ; FE98   0010 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE9C   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; FEA0   0001 0000 0001 0000
        DECLE   $0001,  $0000,  $0003,  $0000   ; FEA4   0001 0000 0003 0000
        DECLE   $0080,  $0300,  $0040,  $0220   ; FEA8   0080 0300 0040 0220
        DECLE   $0000,  $0000,  $0000,  $0080   ; FEAC   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; FEB0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB4   0000 0000 0000 0000
        DECLE   $0005,  $0000,  $0000,  $0000   ; FEB8   0005 0000 0000 0000
        DECLE   $0040,  $0100,  $0000,  $0080   ; FEBC   0040 0100 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0200   ; FEC0   0101 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; FEC4   0000 0000 0000 0001
        DECLE   $0000,  $0002,  $0080,  $0000   ; FEC8   0000 0002 0080 0000
        DECLE   $0120,  $0000,  $0000,  $0080   ; FECC   0120 0000 0000 0080
        DECLE   $0121,  $0000,  $0000,  $0000   ; FED0   0121 0000 0000 0000
        DECLE   $0106,  $0000,  $0000,  $0000   ; FED4   0106 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0002   ; FED8   0000 0000 0008 0002
        DECLE   $0000,  $0000,  $0020,  $0080   ; FEDC   0000 0000 0020 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; FEE0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; FEE4   0000 0000 0000 0020
        DECLE   $0100,  $0200,  $0002,  $0000   ; FEE8   0100 0200 0002 0000
        DECLE   $0000,  $0000,  $0010,  $0188   ; FEEC   0000 0000 0010 0188
        DECLE   $0100,  $0000,  $0200,  $0000   ; FEF0   0100 0000 0200 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; FEF8   0000 0000 0008 0000
        DECLE   $0004,  $0000,  $0100,  $0000   ; FEFC   0004 0000 0100 0000
        DECLE   $0101,  $0000,  $0000,  $0000   ; FF00   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF04   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0080,  $0000   ; FF08   0010 0000 0080 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; FF0C   0000 0000 0008 0000
        DECLE   $0101,  $0000,  $0000,  $0000   ; FF10   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; FF18   0000 0000 0010 0000
        DECLE   $0010,  $0000,  $0000,  $0180   ; FF1C   0010 0000 0000 0180
        DECLE   $0101,  $0000,  $0010,  $0000   ; FF20   0101 0000 0010 0000
        DECLE   $0000,  $0000,  $0004,  $0100   ; FF24   0000 0000 0004 0100
        DECLE   $0000,  $0100,  $0002,  $0000   ; FF28   0000 0100 0002 0000
        DECLE   $0004,  $0000,  $0000,  $0080   ; FF2C   0004 0000 0000 0080
        DECLE   $0111,  $0000,  $0000,  $0000   ; FF30   0111 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0083,  $0080   ; FF3C   0000 0000 0083 0080
        DECLE   $0001,  $0000,  $0008,  $0000   ; FF40   0001 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF44   0000 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; FF48   0200 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4C   0000 0000 0000 0000
        DECLE   $0103,  $0000,  $000A,  $0004   ; FF50   0103 0000 000A 0004
        DECLE   $0001,  $0000,  $0000,  $0000   ; FF54   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; FF5C   0000 0000 0000 0080
        DECLE   $0001,  $0000,  $0000,  $0000   ; FF60   0001 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; FF64   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; FF6C   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; FF70   0101 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; FF74   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; FF78   0000 0000 0040 0000
        DECLE   $0000,  $0000,  $0020,  $0080   ; FF7C   0000 0000 0020 0080
        DECLE   $0000,  $0020,  $0100,  $0000   ; FF80   0000 0020 0100 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF84   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0002,  $0000   ; FF88   0002 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; FF8C   0000 0000 0000 0080
        DECLE   $0101,  $0010,  $0200,  $0000   ; FF90   0101 0010 0200 0000
        DECLE   $0000,  $0000,  $0208,  $0000   ; FF94   0000 0000 0208 0000
        DECLE   $0000,  $0200,  $0200,  $0000   ; FF98   0000 0200 0200 0000
        DECLE   $0004,  $0000,  $0004,  $0080   ; FF9C   0004 0000 0004 0080
        DECLE   $0101,  $0000,  $0001,  $00C0   ; FFA0   0101 0000 0001 00C0
        DECLE   $0008,  $0000,  $0008,  $0000   ; FFA4   0008 0000 0008 0000
        DECLE   $0000,  $0000,  $0020,  $0200   ; FFA8   0000 0000 0020 0200
        DECLE   $0000,  $0000,  $0000,  $0080   ; FFAC   0000 0000 0000 0080
        DECLE   $0101,  $0000,  $0000,  $0000   ; FFB0   0101 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0001   ; FFB4   0000 0000 0004 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB8   0000 0000 0000 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; FFBC   0000 0200 0000 0000
        DECLE   $0101,  $0000,  $0000,  $0200   ; FFC0   0101 0000 0000 0200
        DECLE   $0000,  $0000,  $0020,  $0000   ; FFC4   0000 0000 0020 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; FFC8   0000 0000 0080 0000
        DECLE   $0210,  $0000,  $0000,  $0080   ; FFCC   0210 0000 0000 0080
        DECLE   $0111,  $0000,  $0000,  $0000   ; FFD0   0111 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; FFD4   0000 0000 0000 0001
        DECLE   $0100,  $0100,  $0000,  $0200   ; FFD8   0100 0100 0000 0200
        DECLE   $0100,  $0000,  $0100,  $0080   ; FFDC   0100 0000 0100 0080
        DECLE   $0311,  $0000,  $0000,  $0000   ; FFE0   0311 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE4   0000 0000 0000 0000
        DECLE   $0110,  $0100,  $0000,  $0000   ; FFE8   0110 0100 0000 0000
        DECLE   $0000,  $0000                   ; FFEC   0000 0000

        B       L_FFF0                          ; FFEE   0200 0000

L_FFF0:
        SUBR    R0,     R1                      ; FFF0   0101
        DECLE   $0000,  $0001,  $0000,  $0000   ; FFF1   0000 0001 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; FFF5   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FFF9   0000 0000 0000

        TSTR    R0                              ; FFFC   0080
        SUBR    R0,     R0                      ; FFFD   0100
        SUBR    R4,     R0                      ; FFFE   0120
        ANDR    R0,     R0                      ; FFFF   0180
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5064       <entry>
;;  $5078       $506E  
;;  $5079       $5076  
;;  $507F       $507B   $5674  
;;  $50D0       $50D8  
;;  $5115       $510E   $5112  
;;  $513A       $DB41  
;;  $5141       $514E  
;;  $516D       $5150   $DB95  
;;  $5196       $5177   $5720  
;;  $51A5       $515E   $5C18   $5C38   $5D20   $5D3D   $5DCA   $DBA3  
;;  $51AD       $5165   $53A6   $5EF3   $DBAA  
;;  $51B5       $536D   $539F   $54D2   $55B7   $5AE8   $5AF6   $5B94   $5BB5  
;;  $51B5       $5C5A   $5D6F   $5ED0   $6C50   $6CDB   $6D0F  
;;  $51BD       $5157   $5397   $599D   $59D0   $5A00   $5A7B   $5B9B   $5BC0  
;;  $51BD       $5C56   $5D82   $5DDA   $5EDB   $6CE2   $DB9C  
;;  $51C0       $51C7  
;;  $51EC       $51EA  
;;  $5298       <entry>
;;  $52A5       $529D  
;;  $52B6       $52AB  
;;  $52BD       $52A0   $52A9   $52B4  
;;  $52DF       $52D5  
;;  $52E3       $52CF  
;;  $52E5       $52DD   $52E1  
;;  $52EC       $52CB  
;;  $52F4       $52FC  
;;  $5300       $52F7  
;;  $5306       $52C4   $52D9  
;;  $5307       $52FE  
;;  $531A       $5317  
;;  $5325       $530C   $5322  
;;  $532E       $532E  
;;  $5336       <entry>
;;  $5341       $533A  
;;  $5349       $533F  
;;  $535A       $5347  
;;  $535B       <entry>
;;  $5370       $535F   $5364  
;;  $537D       $5374  
;;  $53B6       $537B  
;;  $53BE       $53AC   $53B4  
;;  $53D5       $538F   $53BC  
;;  $53DC       $5379   $5380  
;;  $53DD       <entry>
;;  $53E8       $53E1  
;;  $53FA       $53E6   $56B5   $56C2  
;;  $53FB       $53E8  
;;  $540B       $5405  
;;  $540D       $5409  
;;  $5410       $53EB  
;;  $542A       $5414   $541A   $5425  
;;  $542B       $5427  
;;  $545E       $5459  
;;  $545F       $545B  
;;  $5461       $549C   $54A5  
;;  $5485       $546B  
;;  $5496       $5483  
;;  $54A8       $53EE  
;;  $54B7       $54B0  
;;  $54BA       $54AC   $54B5  
;;  $54D7       $54D0  
;;  $54DA       $54BD   $54C6   $54D5  
;;  $54E5       $54E2  
;;  $54E7       $54DD  
;;  $54F2       $54EF  
;;  $54F4       $54EA  
;;  $5507       $54FC  
;;  $5509       $54F7  
;;  $550A       $53F1  
;;  $5569       $5566  
;;  $5581       $557B  
;;  $5589       $5583  
;;  $558E       $557F   $5587   $558B  
;;  $55CC       $550F   $5514  
;;  $55CD       $5538  
;;  $55EA       $55E6  
;;  $55FB       $55EC  
;;  $5610       $55D7   $55F8   $5602   $560C   $DAE3  
;;  $5631       $DD1F  
;;  $563E       $5543   $554E   $563A   $DA89  
;;  $5651       $5640  
;;  $565E       $5677  
;;  $5679       $566E  
;;  $5680       $53F4  
;;  $5698       $5690  
;;  $56A7       $5685   $568A   $5696   $569C   $56A2  
;;  $56A8       $56A4  
;;  $56C7       $56C4  
;;  $56CD       $56C9  
;;  $56CE       $570A  
;;  $56F7       $56EF  
;;  $56FD       $56ED  
;;  $56FE       $56F5   $56FB  
;;  $5711       $570C  
;;  $5712       $53F7  
;;  $5728       $571B  
;;  $5737       $5716   $572B  
;;  $5748       $573B   $5740  
;;  $5749       <entry>
;;  $575E       $5753  
;;  $575F       $5192   $574A  
;;  $5778       $5774  
;;  $577A       $576C   $5772  
;;  $578A       $5786  
;;  $578C       $577E   $5784  
;;  $579C       $5798  
;;  $579E       $5790   $5796  
;;  $57AD       $57A7  
;;  $57B6       $57B0  
;;  $57BF       $57B9  
;;  $57C1       $57AB   $57B4   $57BD  
;;  $57C4       $574D  
;;  $57C7       $5896  
;;  $57EE       $57E1  
;;  $57F6       $57DB  
;;  $57FA       $57EC  
;;  $5803       $57D5  
;;  $5826       $581C  
;;  $582C       $5811  
;;  $5834       $580B  
;;  $5838       $582A  
;;  $583F       $5801   $5805  
;;  $5853       $584A  
;;  $585B       $5847  
;;  $5873       $5869  
;;  $5879       $5860  
;;  $5886       $587C  
;;  $588A       $5877  
;;  $5894       $57E7   $57F4   $5817   $5824   $5832   $5851   $5859   $5864  
;;  $5894       $5871   $5884  
;;  $5899       $5755  
;;  $58AD       $58A6  
;;  $58B1       $58AB  
;;  $58BF       $58B8  
;;  $58C3       $589D   $58BD  
;;  $58D7       $58D0  
;;  $58E9       $58C7   $58D5  
;;  $58FC       $58F5  
;;  $5902       $58EC   $58FA  
;;  $5903       $5416   $5698   $5737   $58C3  
;;  $5907       $5913  
;;  $5917       $590F  
;;  $5919       $5915  
;;  $591A       $5758  
;;  $5922       $592D   $5939  
;;  $593E       $591E   $5926  
;;  $593F       $575B  
;;  $594F       $5948  
;;  $5951       $5943  
;;  $597A       $5964  
;;  $597F       $5970  
;;  $5984       $596A  
;;  $5989       $5976  
;;  $598C       $595D   $5960   $5966   $596C   $5972   $5978   $597D   $5982  
;;  $598C       $5987  
;;  $598D       $597A  
;;  $59B2       $59AC  
;;  $59BE       $5994   $59B0  
;;  $59BF       $597F  
;;  $59E5       $59DF  
;;  $59F1       $59C7   $59E3  
;;  $59F2       $5984  
;;  $5A1D       $5A16  
;;  $5A36       $5A2D  
;;  $5A3B       $5A0A  
;;  $5A4F       $5A47  
;;  $5A55       $5A24   $5A34   $5A39   $5A4D  
;;  $5A5F       $5A5B  
;;  $5A6C       $59FA   $5A53  
;;  $5A6D       $5989  
;;  $5A92       $5A8B  
;;  $5AA0       $5A85  
;;  $5AB0       $5A9E  
;;  $5AC0       $5ABA  
;;  $5AC5       $5A75   $5AAE  
;;  $5AC6       $5996   $59C9  
;;  $5AC9       $5AD8  
;;  $5AD3       $5ACF  
;;  $5ADB       $59B7   $59EA   $5A69   $5AC2  
;;  $5AE4       $5ADF  
;;  $5AE8       $5AE2  
;;  $5AEF       $5A03   $5A7E  
;;  $5AFA       $5A11   $5A97  
;;  $5B09       $5A4F   $5AAA  
;;  $5B1E       $5B0D  
;;  $5B22       $5B12  
;;  $5B25       $5B20  
;;  $5B2D       $5B17   $5B1C   $5B28  
;;  $5B2F       $5B23  
;;  $5B30       $5B19  
;;  $5B3F       $5B37  
;;  $5B46       $5B3D  
;;  $5B47       $5B3F   $6BF0  
;;  $5B67       $5B2A  
;;  $5BA7       $5B7C   $5B82  
;;  $5BFB       $5BF5  
;;  $5BFF       $5BF9  
;;  $5C03       $5BF1  
;;  $5C1B       $5C0E  
;;  $5C23       $5C06  
;;  $5C3B       $5C2E  
;;  $5C43       $5C26  
;;  $5C46       $5B77   $5BA5   $5C01  
;;  $5C47       $5C84   $5CAD  
;;  $5C6D       $5C67  
;;  $5C71       $5C6B  
;;  $5C73       $5C63  
;;  $5C9B       $5C95  
;;  $5C9F       $5C99  
;;  $5CA3       $5C78   $5C7D  
;;  $5CB8       $5CA8  
;;  $5CB9       $593B  
;;  $5CE9       $5CBD   $5CC2  
;;  $5CEA       $53CA   $5BA2   $5C5D   $5F14  
;;  $5D32       $5D2A  
;;  $5D35       $5D30  
;;  $5D4F       $5D47  
;;  $5D52       $5D4D  
;;  $5D53       $5D23   $5D40  
;;  $5D60       $5D57  
;;  $5D61       $5D32   $5D4F  
;;  $5DB2       $5DAA  
;;  $5DBF       $5DB0  
;;  $5DCF       $5D7C  
;;  $5DE6       $5DCD  
;;  $5DF3       $5DEA  
;;  $5DF6       $5DE4   $5DF1  
;;  $5E1A       $5E12  
;;  $5E1E       $5E18  
;;  $5E28       $5E20  
;;  $5E2E       $5E26  
;;  $5E32       $5E07  
;;  $5E49       $5E41  
;;  $5E4F       $5E34  
;;  $5E5F       $5E30   $5E47   $5E4D  
;;  $5E6F       $5E67  
;;  $5E7C       $5E72  
;;  $5E86       $5E7F  
;;  $5E89       $5DFB   $5E6D   $5E7A   $5E84  
;;  $5E8A       $5C43   $5DF3   $5E86   $6C45   $6D04   $D7FC  
;;  $5E9B       $5E93  
;;  $5EAE       $5EA3  
;;  $5EB8       $5E9D   $5EB0  
;;  $5EC6       $5EC0  
;;  $5F17       $5EBB   $5EC4   $5F0C  
;;  $5F2D       $5F20   $5F26  
;;  $5F46       $5F1B  
;;  $5F55       $5F44  
;;  $5F5B       $5F53  
;;  $5F60       $5F7B  
;;  $5F73       $5F5E   $5F68  
;;  $5F83       $5EAC   $5F59   $5F71  
;;  $5F90       $5F88  
;;  $5F93       $5E8E   $5E99   $5EB6   $5F8E  
;;  $5FB5       $56FF   $5FAD  
;;  $5FD1       $5704   $5FB1  
;;  $5FEA       $5E81   $D7F7  
;;  $5FFD       $6091   $60CA  
;;  $6009       $6000  
;;  $6011       $6007   $6046  
;;  $6024       $601A  
;;  $602C       $6005   $600F  
;;  $603E       $6035  
;;  $6048       $5FFB   $6027   $6041  
;;  $6055       $604B  
;;  $605D       $6053   $60CF  
;;  $607C       $6061  
;;  $6086       $607A  
;;  $608E       $6084  
;;  $6096       $6051   $605B  
;;  $60B5       $609A  
;;  $60BF       $60B3  
;;  $60C7       $60BD  
;;  $60D1       $6022   $603C   $608C   $60C5  
;;  $60EC       $518F   $60E8   $D8DF   $DB4F  
;;  $6103       $60F2  
;;  $6105       $6101  
;;  $6B1F       $6B1F  
;;  $6B4C       $6B4A  
;;  $6BBC       $6BBA  
;;  $6BC9       $D5E5   $D5F8  
;;  $6BEA       $6BD1  
;;  $6BF7       $6BEE  
;;  $6C12       $6BD5   $6BE8   $6BFA  
;;  $6C23       $6C31  
;;  $6C3D       $6C36  
;;  $6C4A       $6C43  
;;  $6C64       $6C56  
;;  $6C6A       $6BCC  
;;  $6C7A       $6C72  
;;  $6C97       $6C6D   $6C7E  
;;  $6CA1       $6CAF  
;;  $6CC1       $6CBA  
;;  $6CF1       $6CD5   $6CE8  
;;  $6CFF       $6CC7  
;;  $6D09       $6CFD   $6D02  
;;  $6D16       $6C3B   $6C48   $6C62   $6C68   $6CBF   $6D07  
;;  $6D17       $59A2   $59D5   $5A3D   $5AA2   $5F48   $5FF2   $6C1B   $6C99  
;;  $6D17       $D7AF  
;;  $6D21       $6C0D   $6C92  
;;  $6F6D       $6F6D  
;;  $D0AB       $D0A9  
;;  $D0BC       $D0BA  
;;  $D0BD       $D0BB  
;;  $D0BF       $D0BD  
;;  $D0C1       $D0BF  
;;  $D0CF       $D0CD  
;;  $D0D0       $D0CE  
;;  $D0D3       $D0D1  
;;  $D0D5       $D0D3  
;;  $D0D6       $D0D4  
;;  $D0DF       $D0DD  
;;  $D0E3       $D0E1  
;;  $D0E5       $D0E3  
;;  $D0E7       $D0E5  
;;  $D0EB       $D0E9  
;;  $D30F       $D30D  
;;  $D322       $D320  
;;  $D4EE       $D4EC  
;;  $D516       $D514  
;;  $D529       $D527  
;;  $D578       $D578  
;;  $D579       $D579  
;;  $D57A       $D57A  
;;  $D57B       $D57B  
;;  $D57C       $D57C  
;;  $D57D       $D57D  
;;  $D57E       $D57E  
;;  $D57F       $D57F  
;;  $D580       $D580  
;;  $D581       $D581  
;;  $D582       $D582  
;;  $D583       $D583  
;;  $D584       $D584  
;;  $D585       $D585  
;;  $D586       $D586  
;;  $D587       $D587  
;;  $D588       $D588  
;;  $D589       $D589  
;;  $D58A       $D58A  
;;  $D58B       $D58B  
;;  $D5A0       <entry>
;;  $D5A5       $D5C9  
;;  $D5AF       $D5AC  
;;  $D5DD       $D5E3   $D5F4  
;;  $D5F6       $D5E1  
;;  $D5FB       $D5F6  
;;  $D607       $D600  
;;  $D625       $D605  
;;  $D63A       $D61F   $D623   $D62E  
;;  $D642       $D626   $D632  
;;  $D64F       $D649  
;;  $D655       $D64F  
;;  $D656       $D612  
;;  $D657       $D655  
;;  $D662       $D618   $D629  
;;  $D66F       $D67A  
;;  $D671       $D674  
;;  $D67E       $D668  
;;  $D683       $D691  
;;  $D685       $D689  
;;  $D694       $D666   $D67C  
;;  $D695       $D61B   $D635  
;;  $D6A7       $D6CE  
;;  $D6AA       $D6B5  
;;  $D6BE       $D6C9  
;;  $D6D5       $D6E0  
;;  $D6E6       $D69B  
;;  $D6EA       $D6EE  
;;  $D6F2       $D699   $D6E4  
;;  $D6F3       $D607   $D644  
;;  $D6F7       $D731  
;;  $D6FF       $D6FB  
;;  $D708       $D702  
;;  $D716       $D706  
;;  $D72C       $D718  
;;  $D734       $570E   $571D  
;;  $D743       $D738  
;;  $D744       $572D  
;;  $D753       $D748  
;;  $D754       $D74D  
;;  $D76C       $D75F   $D764  
;;  $D76F       $D76A  
;;  $D770       $D740   $D750  
;;  $D77F       $D775   $D77B  
;;  $D7A1       $D789  
;;  $D7AB       $D79F  
;;  $D7B4       $D7C2  
;;  $D7C4       $D7B7   $D7BB  
;;  $D7D4       $D7CD  
;;  $D7D7       $D7D2  
;;  $D7FC       $D7F5  
;;  $D7FF       $D77D   $D783   $D7FA  
;;  $D800       $D7CF  
;;  $D816       $D7D4  
;;  $D885       $D830   $D835   $D83D   $D842   $D854  
;;  $D886       $5742  
;;  $D8AF       $594A  
;;  $D8D5       $D8B7   $D8C0  
;;  $D8E2       $D8D3  
;;  $D95C       $D8F4   $D8FF   $D911   $D92B   $D946   $D951  
;;  $D95D       $D90E  
;;  $D97F       $D979  
;;  $D987       $D964   $D96B   $D97D  
;;  $D988       $D8F6  
;;  $D992       $D901   $D948  
;;  $D99E       $D908   $D956  
;;  $D9A8       $D9A2  
;;  $D9B3       $D9AF  
;;  $D9C2       $D9C5  
;;  $D9C7       $D9A6  
;;  $D9C8       $D971  
;;  $DA01       $D9E7   $D9E9  
;;  $DA0A       $D9F0   $D9F2  
;;  $DA13       $D9F9   $D9FB  
;;  $DA1A       $DA08   $DA11  
;;  $DA1E       $D9CC   $D9D3   $D9FF  
;;  $DA44       $DA05   $DA0E   $DA17  
;;  $DA4F       $53E3  
;;  $DA82       $DA75  
;;  $DA87       $DA84  
;;  $DA8C       $DA80  
;;  $DA98       $DA95  
;;  $DA9D       $DA9A  
;;  $DAAE       $DAB5  
;;  $DABF       $DA69  
;;  $DAE7       $5136   $52AD   $6C5C  
;;  $DB49       $DB3F  
;;  $DB4F       $DB47  
;;  $DB78       $DB49  
;;  $DB7F       $DB8C  
;;  $DBBC       $DB52  
;;  $DBCA       $DBD4  
;;  $DBD6       $DBCD   $DBD1  
;;  $DBDF       $DB12  
;;  $DC25       $DC2C  
;;  $DC40       $DC2E   $DFF2  
;;  $DC48       $DC5B  
;;  $DC60       $DC73  
;;  $DC7B       $DC80  
;;  $DC86       $DC8B  
;;  $DCAD       $DC54   $DC6C   $DC7B   $DC86  
;;  $DCBC       $52B6  
;;  $DCDD       $DD02  
;;  $DD04       $DCFC  
;;  $DD06       $DD0D  
;;  $DD0F       $DD0B  
;;  $DD24       $DD1D  
;;  $DD2C       $DD22  
;;  $DD6B       $DD64  
;;  $DDD4       $DD67  
;;  $DE0B       $D953  
;;  $DE20       $DE1D  
;;  $DE44       $DE3E  
;;  $DE56       $DE50  
;;  $DE71       $DE13   $DE5F  
;;  $DE8F       $DE8D  
;;  $DE97       $DE95  
;;  $DEA8       $DE9D  
;;  $DEC6       $DE9F  
;;  $DEE3       $DEC4  
;;  $DEE5       $DEA6  
;;  $DEF6       $DEED  
;;  $DEF9       $DEE9   $DEEF   $DEF4  
;;  $DEFA       $DEF6  
;;  $DF11       $DF0D  
;;  $DF14       $DEFE  
;;  $DF15       $DB15   $DEF1  
;;  $DF2D       $DF2A  
;;  $DF30       $DF19  
;;  $DF31       $DF07   $DF22  
;;  $DF38       $DF3D  
;;  $DF41       $DF46  
;;  $DF49       $DF11   $DF2D  
;;  $DF75       $DF65   $DFFA  
;;  $DF76       $DEA3  
;;  $DFB2       $DF7A  
;;  $DFEE       $DFCF  
;;  $DFEF       $DF84  
;;  $DFF2       $DFB0   $DFEC  
;;  $DFF5       $DFB6   $DFF0  
;;  $F0F8       $F0F6  
;;  $F14C       $F14A  
;;  $F1E0       $F15E  
;;  $F27D       $F27B  
;;  $F29A       $F298  
;;  $F76A       $F76B  
;;  $F788       $F78C  
;;  $F795       $F798  
;;  $F79E       $F80E  
;;  $F7BE       $F7B1   $F7B5  
;;  $F7CB       $F7BC  
;;  $F7D2       $F7C0   $F7C4  
;;  $F7D3       $F7AD   $F7D0  
;;  $F7E2       $F7DC  
;;  $F7EB       $F7E0  
;;  $F7F8       $F7F4  
;;  $F80D       $F804  
;;  $F817       $F7A1  
;;  $F833       $FAA3  
;;  $F853       $F84D  
;;  $F855       $F851  
;;  $F95B       $F77B   $FB23  
;;  $F98A       $F98A  
;;  $F99F       $F99C  
;;  $F9A0       $F996  
;;  $F9B9       $F9B2  
;;  $F9C5       $F9BF  
;;  $F9CE       $F9C3   $F9C9  
;;  $FA62       $FA26   $FA3A   $FA4E  
;;  $FB33       $FB3E  
;;  $FB67       $FB73  
;;  $FB75       $FB59  
;;  $FB8A       $FB57  
;;  $FBD4       $FBD0  
;;  $FBE0       $FB88   $FBCE  
;;  $FC24       $FC1D  
;;  $FC2B       $FC26  
;;  $FC31       $FC22   $FC29   $FC2D  
;;  $FC4F       $FC42   $FC46  
;;  $FC5C       $FC4D  
;;  $FC5F       $FC51   $FC55  
;;  $FC61       $FC3C  
;;  $FC83       $FC76   $FC7A  
;;  $FC90       $FC81  
;;  $FC9B       $FC85   $FC89  
;;  $FC9D       $FC70  
;;  $FCBF       $FCBC  
;;  $FCC6       $FCAF   $FCCA   $FCCE  
;;  $FCDA       $FCD6  
;;  $FD76       $FD7D  
;;  $FD8C       $FD90  
;;  $FDA2       $FDA7  
;;  $FDB8       $FDCC  
;;  $FDC1       $FDC8  
;;  $FDDF       $FDEA  
;;  $FDE3       $FDE7  
;;  $FDFC       $FDFA  
;;  $FE6F       $FE6D  
;;  $FFF0       $FFEE  
;; ======================================================================== ;;
