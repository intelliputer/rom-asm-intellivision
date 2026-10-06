
        ORG     $5000
.HEADER:
        BIDECLE $61B6           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $503A           ; 5004  Ptr: Start of game
        BIDECLE $5D88           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5D85           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5036           ; 500A  Ptr: Date/Title
        DECLE   $00C2           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0007,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0007,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $006A,  $0068,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $00D0,  $0066,  $0002,  $0000; 5024  Timer dispatch/interval
        DECLE   $002C,  $0069,  $0002,  $0000; 5028  Timer dispatch/interval
        DECLE   $004C,  $0068,  $0003,  $0000; 502C  Timer dispatch/interval
        DECLE   $0071,  $0066,  $0001,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.TITLE:
        DECLE   $0050                           ; 5036  Cartridge year
        STRING  " "                             ; 5037  Title string
        DECLE   $0000                           ; 5038  

.TITLECODE:
        PULR    R7                              ; 5039   02B7

.START:
        PSHR    R5                              ; 503A   0275
        EIS                                     ; 503B   0002

        JSR     R5,     L_5CBD                  ; 503C   0004 015C 00BD
        JSR     R5,     L_697F                  ; 503F   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5042   0240 0020
        SDBD                                    ; 5044   0001
        MVII    #$3810, R4                      ; 5045   02BC 0010 0038
        SDBD                                    ; 5048   0001
        MVII    #$5F08, R2                      ; 5049   02BA 0008 005F
        MVII    #$0028, R0                      ; 504C   02B8 0028

        JSR     R5,     L_6999                  ; 504E   0004 0168 0199

        MVII    #$0005, R3                      ; 5051   02BB 0005
        MVII    #$027A, R4                      ; 5053   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 5055   0004 0118 007B
        STRING  "MOUNTAIN MADNESS"              ; 5058  
        DECLE   $0000                           ; 5068   0000

        MVII    #$0002, R3                      ; 5069   02BB 0002
        MVII    #$028E, R4                      ; 506B   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 506D   0004 0118 007B
        STRING  "Super Pro Skiing"              ; 5070  
        DECLE   $0000                           ; 5080   0000

        MVII    #$0001, R0                      ; 5081   02B8 0001
        MVO     R0,     G_01AC                  ; 5083   0240 01AC
        MVO     R0,     G_01A5                  ; 5085   0240 01A5
        MVII    #$02E1, R4                      ; 5087   02BC 02E1
        SDBD                                    ; 5089   0001
        MVII    #$0813, R2                      ; 508A   02BA 0013 0008
        MVO@    R2,     R4                      ; 508D   0262
        MVII    #$0003, R3                      ; 508E   02BB 0003
        SDBD                                    ; 5090   0001
        MVII    #$07C3, R0                      ; 5091   02B8 00C3 0007
        MVII    #$0004, R1                      ; 5094   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5096   0004 0118 00C5

        MVII    #$0008, R0                      ; 5099   02B8 0008
        ADDI    #$0005, R4                      ; 509B   02FC 0005
        ADDR    R0,     R2                      ; 509D   00C2
        MVO@    R2,     R4                      ; 509E   0262
        ADDR    R0,     R2                      ; 509F   00C2
        MVO@    R2,     R4                      ; 50A0   0262
        ADDR    R0,     R2                      ; 50A1   00C2
        MVO@    R2,     R4                      ; 50A2   0262
        ADDR    R0,     R2                      ; 50A3   00C2
        MVO@    R2,     R4                      ; 50A4   0262
        SDBD                                    ; 50A5   0001
        MVII    #$50D8, R0                      ; 50A6   02B8 00D8 0050
        MVO     R0,     G_035D                  ; 50A9   0240 035D
        MVII    #$0003, R0                      ; 50AB   02B8 0003
        MVO     R0,     G_0103                  ; 50AD   0240 0103
        PULR    R7                              ; 50AF   02B7

        DECLE   $0099,  $0057,  $008E,  $0055   ; 50B0   0099 0057 008E 0055
        DECLE   $008A,  $0055,  $008A,  $0055   ; 50B4   008A 0055 008A 0055
        DECLE   $008A,  $0055,  $0000,  $0010   ; 50B8   008A 0055 0000 0010
        DECLE   $0000,  $0010,  $0000,  $0010   ; 50BC   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $0000           ; 50C0   0000 0010 0000

        DECR    R0                              ; 50C3   0010
        NEGR    R6                              ; 50C4   0026
        SLR     R1,     1                       ; 50C5   0061
        ADDR    R6,     R6                      ; 50C6   00F6
        RLC     R0,     1                       ; 50C7   0050
        ADDR    R4,     R2                      ; 50C8   00E2
        RLC     R0,     1                       ; 50C9   0050
        ADDR    R6,     R3                      ; 50CA   00F3
        RLC     R0,     1                       ; 50CB   0050
        ADDR    R6,     R3                      ; 50CC   00F3
        RLC     R0,     1                       ; 50CD   0050
        ADDR    R0,     R5                      ; 50CE   00C5
        SLLC    R0,     1                       ; 50CF   0058
        TSTR    R4                              ; 50D0   00A4
        RLC     R3,     1                       ; 50D1   0053
        ADDR    R0,     R5                      ; 50D2   00C5
        SLLC    R0,     1                       ; 50D3   0058
        ADDR    R0,     R5                      ; 50D4   00C5
        SLLC    R0,     1                       ; 50D5   0058
        ADDR    R0,     R5                      ; 50D6   00C5
        SLLC    R0,     1                       ; 50D7   0058
        ADCR    R7                              ; 50D8   002F

        RLC     R3,     1                       ; 50D9   0053
L_50DA:
        ADCR    R7                              ; 50DA   002F

        RLC     R3,     1                       ; 50DB   0053
L_50DC:
        ADCR    R7                              ; 50DC   002F

        RLC     R3,     1                       ; 50DD   0053
L_50DE:
        ADCR    R7                              ; 50DE   002F

        RLC     R3,     1                       ; 50DF   0053
L_50E0:
        ADCR    R7                              ; 50E0   002F

        RLC     R3,     1                       ; 50E1   0053
L_50E2:
        TSTR    R0                              ; 50E2   0080
        BPL     L_5122                          ; 50E3   0203 003D

        ADDI    #$0123, R1                      ; 50E5   02F9 0123
        MVI@    R1,     R2                      ; 50E7   028A
        ANDI    #$00E0, R2                      ; 50E8   03BA 00E0
        CMPI    #$00A0, R2                      ; 50EA   037A 00A0
        BNEQ    L_5122                          ; 50EC   020C 0034

        SUBI    #$0002, R1                      ; 50EE   0339 0002
        NEGR    R0                              ; 50F0   0020
        MVO@    R0,     R1                      ; 50F1   0248
        MOVR    R5,     R7                      ; 50F2   00AF

        DECR    R0                              ; 50F3   0010
        BMI     L_5122                          ; 50F4   020B 002C

        MVII    #$0072, R3                      ; 50F6   02BB 0072
        MVII    #$00FB, R2                      ; 50F8   02BA 00FB
        MVI     G_0163, R1                      ; 50FA   0281 0163
        ADD     G_0164, R1                      ; 50FC   02C1 0164
        BNEQ    L_5122                          ; 50FE   020C 0022

        MVO     R1,     G_0331                  ; 5100   0241 0331
        MVO     R2,     G_0164                  ; 5102   0242 0164
        MVI     G_0325, R0                      ; 5104   0280 0325
        MVO     R0,     G_0335                  ; 5106   0240 0335
        SDBD                                    ; 5108   0001
        XORI    #$1000, R0                      ; 5109   03F8 0000 0010
        MVO     R0,     G_0325                  ; 510C   0240 0325
        MVI     G_032D, R0                      ; 510E   0280 032D
        SDBD                                    ; 5110   0001
        ANDI    #$DFFF, R0                      ; 5111   03B8 00FF 00DF
        MVO     R0,     G_032D                  ; 5114   0240 032D
        MVO     R2,     G_0339                  ; 5116   0242 0339
        MVO     R3,     G_033A                  ; 5118   0243 033A
        MVII    #$0003, R1                      ; 511A   02B9 0003
        MVO     R1,     G_0332                  ; 511C   0241 0332
        MVII    #$000A, R0                      ; 511E   02B8 000A
        MVO     R0,     G_0333                  ; 5120   0240 0333
L_5122:
        MOVR    R5,     R7                      ; 5122   00AF

        MVII    #$0004, R0                      ; 5123   02B8 0004
        MVII    #$00FC, R2                      ; 5125   02BA 00FC
        MVO     R0,     G_0331                  ; 5127   0240 0331
        DECR    R0                              ; 5129   0010
        MVO     R2,     G_0339                  ; 512A   0242 0339
        MVO     R0,     G_033A                  ; 512C   0240 033A
        MVO     R0,     G_033B                  ; 512E   0240 033B
        MOVR    R5,     R7                      ; 5130   00AF

        PSHR    R5                              ; 5131   0275
        MVII    #$0001, R0                      ; 5132   02B8 0001
        MVO     R0,     G_032B                  ; 5134   0240 032B
        MVII    #$0327, R4                      ; 5136   02BC 0327
        MVI@    R4,     R1                      ; 5138   02A1
        SWAP    R1,     1                       ; 5139   0041
        ANDI    #$00FF, R1                      ; 513A   03B9 00FF
        CMPI    #$0008, R1                      ; 513C   0379 0008
        BLT     L_5151                          ; 513E   0205 0011

        CMPI    #$009C, R1                      ; 5140   0379 009C
        BGT     L_5151                          ; 5142   020E 000D

L_5144:
        MVI@    R4,     R1                      ; 5144   02A1
        SWAP    R1,     1                       ; 5145   0041
        ANDI    #$00FF, R1                      ; 5146   03B9 00FF
        CMPI    #$0010, R1                      ; 5148   0379 0010
        BLT     L_5157                          ; 514A   0205 000B

        CMPI    #$0060, R1                      ; 514C   0379 0060
        BGE     L_5164                          ; 514E   020D 0014
        PULR    R7                              ; 5150   02B7

L_5151:
        MVI     G_0319, R0                      ; 5151   0280 0319
        MVO     R0,     G_0327                  ; 5153   0240 0327
        B       L_5144                          ; 5155   0220 0012

L_5157:
        MVI     G_031A, R0                      ; 5157   0280 031A
        SDBD                                    ; 5159   0001
        MVII    #$1000, R1                      ; 515A   02B9 0000 0010
        CMPR    R1,     R0                      ; 515D   0148
        BGE     L_5161                          ; 515E   020D 0001

        MOVR    R1,     R0                      ; 5160   0088
L_5161:
        MVO     R0,     G_0328                  ; 5161   0240 0328
L_5163:
        PULR    R7                              ; 5163   02B7

L_5164:
        SDBD                                    ; 5164   0001
        MVII    #$1906, R0                      ; 5165   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5168   0240 035D
        SDBD                                    ; 516A   0001
        MVII    #$5024, R1                      ; 516B   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 516E   0004 0118 0038

        MVII    #$031D, R4                      ; 5171   02BC 031D
        MVII    #$0040, R0                      ; 5173   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5175   0004 0114 0338

        MVII    #$0169, R4                      ; 5178   02BC 0169
        MVII    #$0003, R0                      ; 517A   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; 517C   0004 0114 0338

        MVII    #$001E, R0                      ; 517F   02B8 001E

        JSR     R5,     .EXEC.A62               ; 5181   0004 0118 0262
        JSR     R5,     L_5CBD                  ; 5184   0004 015C 00BD

        MVI     G_0167, R3                      ; 5187   0283 0167
        INCR    R3                              ; 5189   000B
        MVII    #$0257, R4                      ; 518A   02BC 0257

        JSR     R5,     X_PRINT_R5              ; 518C   0004 0118 007B
        STRING  "SKIER #"                       ; 518F  
        DECLE   $0000                           ; 5196   0000

        MVI     G_0167, R0                      ; 5197   0280 0167
        INCR    R0                              ; 5199   0008
        MVII    #$0001, R1                      ; 519A   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 519C   0004 0118 00C5

        MVI     G_015D, R1                      ; 519F   0281 015D
        CMPI    #$0001, R1                      ; 51A1   0379 0001
        BEQ     L_51C7                          ; 51A3   0204 0022

        MVII    #$027A, R4                      ; 51A5   02BC 027A
        MVII    #$0002, R3                      ; 51A7   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 51A9   0004 0118 007B
        STRING  "best so far"                   ; 51AC  
        DECLE   $0000                           ; 51B7   0000

        INCR    R4                              ; 51B8   000C
        MVI     G_0167, R0                      ; 51B9   0280 0167
        SLL     R0,     1                       ; 51BB   0048
        ADDI    #$0186, R0                      ; 51BC   02F8 0186
        MOVR    R0,     R5                      ; 51BE   0085
        SDBD                                    ; 51BF   0001
        MVI@    R5,     R1                      ; 51C0   02A9

        JSR     R5,     L_65A2                  ; 51C1   0004 0164 01A2
        JSR     R5,     L_527D                  ; 51C4   0004 0150 027D

L_51C7:
        MVII    #$0005, R3                      ; 51C7   02BB 0005
        MVII    #$0291, R4                      ; 51C9   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 51CB   0004 0118 007B
        STRING  "run time"                      ; 51CE  
        DECLE   $0000                           ; 51D6   0000

        INCR    R4                              ; 51D7   000C
        MVII    #$015E, R5                      ; 51D8   02BD 015E
        SDBD                                    ; 51DA   0001
        MVI@    R5,     R1                      ; 51DB   02A9
        PSHR    R1                              ; 51DC   0271

        JSR     R5,     L_65A2                  ; 51DD   0004 0164 01A2
        JSR     R5,     L_527D                  ; 51E0   0004 0150 027D

        MVII    #$0005, R3                      ; 51E3   02BB 0005
        MVII    #$02A1, R4                      ; 51E5   02BC 02A1

        JSR     R5,     X_PRINT_R5              ; 51E7   0004 0118 007B
        STRING  "missed gates"                  ; 51EA  
        DECLE   $0000                           ; 51F6   0000

        INCR    R4                              ; 51F7   000C
        MVI     G_01A3, R0                      ; 51F8   0280 01A3
        SUB     G_0161, R0                      ; 51FA   0300 0161
        TSTR    R0                              ; 51FC   0080
        BPL     L_5200                          ; 51FD   0203 0001

        CLRR    R0                              ; 51FF   01C0
L_5200:
        PSHR    R0                              ; 5200   0270
        MVII    #$02AE, R4                      ; 5201   02BC 02AE
        MVII    #$0002, R1                      ; 5203   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5205   0004 0118 00C5

        MVII    #$02B0, R4                      ; 5208   02BC 02B0

        JSR     R5,     X_PRINT_R5              ; 520A   0004 0118 007B
        STRING  "/"                             ; 520D   002F
        DECLE   $0000                           ; 520E   0000

        MVI     G_01A3, R0                      ; 520F   0280 01A3
        MVII    #$0002, R1                      ; 5211   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5213   0004 0118 00C5
        JSR     R5,     L_527D                  ; 5216   0004 0150 027D

        MVII    #$0005, R3                      ; 5219   02BB 0005
        MVII    #$02B5, R4                      ; 521B   02BC 02B5

        JSR     R5,     X_PRINT_R5              ; 521D   0004 0118 007B
        STRING  "penalty time"                  ; 5220  
        DECLE   $0000                           ; 522C   0000

        INCR    R4                              ; 522D   000C
        PULR    R1                              ; 522E   02B1
        MOVR    R1,     R0                      ; 522F   0088
        SLL     R0,     2                       ; 5230   004C
        SLL     R0,     1                       ; 5231   0048
        SLL     R1,     1                       ; 5232   0049
        ADDR    R0,     R1                      ; 5233   00C1
        PSHR    R1                              ; 5234   0271

        JSR     R5,     L_65A2                  ; 5235   0004 0164 01A2
        JSR     R5,     L_527D                  ; 5238   0004 0150 027D

        MVII    #$0002, R3                      ; 523B   02BB 0002
        MVII    #$02DF, R4                      ; 523D   02BC 02DF

        JSR     R5,     X_PRINT_R5              ; 523F   0004 0118 007B
        STRING  "TOTAL TIME"                    ; 5242  
        DECLE   $0000                           ; 524C   0000

        INCR    R4                              ; 524D   000C
        PULR    R1                              ; 524E   02B1
        PULR    R5                              ; 524F   02B5
        ADDR    R5,     R1                      ; 5250   00E9
        MVO     R1,     G_015E                  ; 5251   0241 015E
        SWAP    R1,     1                       ; 5253   0041
        MVO     R1,     G_015F                  ; 5254   0241 015F
        SWAP    R1,     1                       ; 5256   0041
        PSHR    R1                              ; 5257   0271

        JSR     R5,     L_65A2                  ; 5258   0004 0164 01A2
        JSR     R5,     L_527D                  ; 525B   0004 0150 027D

        PULR    R2                              ; 525E   02B2
        MVI     G_0167, R0                      ; 525F   0280 0167
        SLL     R0,     1                       ; 5261   0048
        ADDI    #$0186, R0                      ; 5262   02F8 0186
        MOVR    R0,     R4                      ; 5264   0084
        SDBD                                    ; 5265   0001
        MVI@    R4,     R1                      ; 5266   02A1
        TSTR    R1                              ; 5267   0089
        BEQ     L_526D                          ; 5268   0204 0003

        CMPR    R1,     R2                      ; 526A   014A
        BGE     L_526E                          ; 526B   020D 0001

L_526D:
        MOVR    R2,     R1                      ; 526D   0091
L_526E:
        MOVR    R0,     R4                      ; 526E   0084
        MVO@    R1,     R4                      ; 526F   0261
        SWAP    R1,     1                       ; 5270   0041
        MVO@    R1,     R4                      ; 5271   0261
        MVII    #$0046, R0                      ; 5272   02B8 0046

        JSR     R5,     .EXEC.A62               ; 5274   0004 0118 0262
        JSR     R5,     X_STOP_SFX              ; 5277   0004 011C 02B4
        JSR     R5,     L_5BD1                  ; 527A   0004 0158 03D1

L_527D:
        MVII    #$0014, R2                      ; 527D   02BA 0014
L_527F:
        PSHR    R5                              ; 527F   0275

L_5280:
        JSR     R5,     L_697F                  ; 5280   0004 0168 017F

        MVO     R2,     .STIC.VIDEN             ; 5283   0242 0020
        PSHR    R2                              ; 5285   0272

        JSR     R5,     X_PLAY_NOTE             ; 5286   0004 0118 02BD

        PULR    R2                              ; 5289   02B2
        DECR    R2                              ; 528A   0012
        BPL     L_5280                          ; 528B   0223 000C
        PULR    R7                              ; 528D   02B7

        SETC                                    ; 528E   0007
        INCR    R0                              ; 528F   0008
        INCR    R0                              ; 5290   0008
        INCR    R1                              ; 5291   0009
        INCR    R2                              ; 5292   000A
        INCR    R4                              ; 5293   000C
        INCR    R4                              ; 5294   000C
        INCR    R7                              ; 5295   000F

        INCR    R5                              ; 5296   000D
L_5297:
        INCR    R7                              ; 5297   000F

        INCR    R5                              ; 5298   000D
L_5299:
        INCR    R7                              ; 5299   000F

        INCR    R4                              ; 529A   000C
L_529B:
        INCR    R5                              ; 529B   000D
        INCR    R6                              ; 529C   000E
        INCR    R7                              ; 529D   000F

        DECLE   $0000                           ; 529E   0000
L_529F:
        EIS                                     ; 529F   0002
        DECLE   $0004,  $0005,  $0006,  $000C   ; 52A0   0004 0005 0006 000C
        DECLE   $000E,  $0014,  $0006,  $000C   ; 52A4   000E 0014 0006 000C
        DECLE   $0004,  $0005,  $0005,  $0006   ; 52A8   0004 0005 0005 0006
        DECLE   $001A,  $0001,  $001A,  $0010   ; 52AC   001A 0001 001A 0010
        DECLE   $0001,  $0000,  $000C,  $0005   ; 52B0   0001 0000 000C 0005
        DECLE   $0012,  $0003,  $0012,  $000E   ; 52B4   0012 0003 0012 000E
        DECLE   $0001,  $0006,  $0014,  $000C   ; 52B8   0001 0006 0014 000C
        DECLE   $0004,  $000F,  $0005,  $0004   ; 52BC   0004 000F 0005 0004
        DECLE   $0003,  $0002,  $0001,  $0000   ; 52C0   0003 0002 0001 0000

        INCR    R4                              ; 52C4   000C
        INCR    R7                              ; 52C5   000F

        DECLE   $0001                           ; 52C6   0001
L_52C7:
        DECR    R1                              ; 52C7   0011
        DECLE   $0005,  $000E,  $0002,  $0012   ; 52C8   0005 000E 0002 0012
        DECLE   $000C,  $0005,  $0003,  $0008   ; 52CC   000C 0005 0003 0008
        DECLE   $0001                           ; 52D0   0001

        DECR    R6                              ; 52D1   0016
        INCR    R7                              ; 52D2   000F

        DECR    R1                              ; 52D3   0011
L_52D4:
        INCR    R0                              ; 52D4   0008
        DECLE   $0001                           ; 52D5   0001

        INCR    R7                              ; 52D6   000F

        INCR    R0                              ; 52D7   0008
L_52D8:
        DECR    R6                              ; 52D8   0016
        DECLE   $0008,  $0008,  $0003,  $0008   ; 52D9   0008 0008 0003 0008
        DECLE   $0001                           ; 52DD   0001

        INCR    R2                              ; 52DE   000A
        INCR    R1                              ; 52DF   0009
        COMR    R3                              ; 52E0   001B
L_52E1:
        DECR    R7                              ; 52E1   0017

        INCR    R5                              ; 52E2   000D
        COMR    R0                              ; 52E3   0018
        INCR    R1                              ; 52E4   0009
        INCR    R5                              ; 52E5   000D
L_52E6:
        DECR    R7                              ; 52E6   0017

        DECLE   $001B,  $000A,  $000D,  $0009   ; 52E7   001B 000A 000D 0009
        DECLE   $001B,  $001B,  $0018,  $0005   ; 52EB   001B 001B 0018 0005
        DECLE   $0002,  $0007,  $0010,  $0015   ; 52EF   0002 0007 0010 0015
        DECLE   $000B,  $000C,  $0013,  $0002   ; 52F3   000B 000C 0013 0002
        DECLE   $0015,  $0019,  $0015,  $0013   ; 52F7   0015 0019 0015 0013
        DECLE   $0007,  $000B,  $0005,  $000C   ; 52FB   0007 000B 0005 000C
        DECLE   $000A,  $000B,  $0008,  $0007   ; 52FF   000A 000B 0008 0007
        DECLE   $0009,  $0019,  $000A,  $0010   ; 5303   0009 0019 000A 0010
        DECLE   $0009,  $0005,  $0015,  $0008   ; 5307   0009 0005 0015 0008
        DECLE   $0007,  $000B,  $000A,  $000B   ; 530B   0007 000B 000A 000B
        DECLE   $000B,  $0013,  $0015,  $0009   ; 530F   000B 0013 0015 0009
        DECLE   $0007,  $000A,  $0008,  $0013   ; 5313   0007 000A 0008 0013
        DECLE   $0009,  $0009,  $0008,  $0019   ; 5317   0009 0009 0008 0019
        DECLE   $0018,  $0015,  $0010,  $0054   ; 531B   0018 0015 0010 0054
        DECLE   $0068,  $0065,  $006E,  $0020   ; 531F   0068 0065 006E 0020
        DECLE   $0070,  $0072,  $0065,  $0073   ; 5323   0070 0072 0065 0073
        DECLE   $0073,  $0020,  $0065,  $006E   ; 5327   0073 0020 0065 006E
        DECLE   $0074,  $0065,  $0072,  $0000   ; 532B   0074 0065 0072 0000

        PSHR    R5                              ; 532F   0275
        SDBD                                    ; 5330   0001
        MVII    #$5020, R1                      ; 5331   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 5334   0004 0118 0038

        MVII    #$0001, R0                      ; 5337   02B8 0001
        MVO     R0,     G_01A5                  ; 5339   0240 01A5
        CLRR    R0                              ; 533B   01C0
        MVO     R0,     G_01AC                  ; 533C   0240 01AC
        MVO     R0,     G_01B9                  ; 533E   0240 01B9

        JSR     R5,     L_55E8                  ; 5340   0004 0154 01E8
        JSR     R5,     L_696E                  ; 5343   0004 0168 016E

        MVII    #$0003, R3                      ; 5346   02BB 0003
        MVII    #$0216, R4                      ; 5348   02BC 0216

        JSR     R5,     X_PRINT_R5              ; 534A   0004 0118 007B
        STRING  "Select the number"             ; 534D  
        DECLE   $0000                           ; 535E   0000

        MVII    #$0242, R4                      ; 535F   02BC 0242

        JSR     R5,     X_PRINT_R5              ; 5361   0004 0118 007B
        STRING  "of skiers"                     ; 5364  
        DECLE   $0000                           ; 536D   0000

        MVII    #$02DE, R4                      ; 536E   02BC 02DE
        SDBD                                    ; 5370   0001
        MVII    #$531E, R1                      ; 5371   02B9 001E 0053

        JSR     R5,     X_PRINT_R1              ; 5374   0004 0118 0067

        MVII    #$0005, R3                      ; 5377   02BB 0005
        MVII    #$026C, R4                      ; 5379   02BC 026C

        JSR     R5,     X_PRINT_R5              ; 537B   0004 0118 007B
        STRING  "[1-6]"                         ; 537E  
        DECLE   $0000                           ; 5383   0000

        SDBD                                    ; 5384   0001
        MVII    #$50CE, R0                      ; 5385   02B8 00CE 0050
        MVO     R0,     G_035D                  ; 5388   0240 035D
        CLRR    R0                              ; 538A   01C0
        MVO     R0,     G_0168                  ; 538B   0240 0168
        MVO     R0,     G_0184                  ; 538D   0240 0184
        PULR    R7                              ; 538F   02B7

        DECLE   $0000,  $0168,  $01B9,  $0184   ; 5390   0000 0168 01B9 0184
        DECLE   $01A6,  $01A7,  $01A8,  $01A9   ; 5394   01A6 01A7 01A8 01A9
        DECLE   $01AA,  $01AB,  $0000           ; 5398   01AA 01AB 0000

        CLRC                                    ; 539B   0006
        DIS                                     ; 539C   0003
        NEGR    R2                              ; 539D   0022
        INCR    R7                              ; 539E   000F
        INCR    R7                              ; 539F   000F
L_53A0:
        INCR    R7                              ; 53A0   000F
L_53A1:
        INCR    R7                              ; 53A1   000F
L_53A2:
        INCR    R7                              ; 53A2   000F
L_53A3:
        INCR    R7                              ; 53A3   000F

L_53A4:
        PSHR    R5                              ; 53A4   0275
L_53A5:
        MVI     G_01A5, R2                      ; 53A5   0282 01A5
        TSTR    R2                              ; 53A7   0092
        BEQ     L_5163                          ; 53A8   0224 0246

        MOVR    R2,     R3                      ; 53AA   0093
        SDBD                                    ; 53AB   0001
        ADDI    #$5390, R3                      ; 53AC   02FB 0090 0053
        MOVR    R3,     R4                      ; 53AF   009C
        ADDI    #$000A, R4                      ; 53B0   02FC 000A
        MVI@    R3,     R3                      ; 53B2   029B
        CMPI    #$000A, R0                      ; 53B3   0378 000A
        BEQ     L_53F0                          ; 53B5   0204 0039

        CMPI    #$000B, R0                      ; 53B7   0378 000B
        BEQ     L_53F7                          ; 53B9   0204 003C

        CMPI    #$0002, R2                      ; 53BB   037A 0002
        BEQ     L_53CB                          ; 53BD   0204 000C
        BGT     L_53D5                          ; 53BF   020E 0014

        TSTR    R0                              ; 53C1   0080
        BEQ     L_5163                          ; 53C2   0224 0260

        CMPI    #$0006, R0                      ; 53C4   0378 0006
        BGT     L_5163                          ; 53C6   022E 0264

        MVO@    R0,     R3                      ; 53C8   0258
        B       L_53E2                          ; 53C9   0200 0017

L_53CB:
        TSTR    R0                              ; 53CB   0080
        BEQ     L_5163                          ; 53CC   0224 026A

        CMPI    #$0003, R0                      ; 53CE   0378 0003
        BGT     L_5163                          ; 53D0   022E 026E

        MVO@    R0,     R3                      ; 53D2   0258
        B       L_53E2                          ; 53D3   0200 000D

L_53D5:
        MVI@    R3,     R1                      ; 53D5   0299
        CMPI    #$000A, R1                      ; 53D6   0379 000A
        BGE     L_53DE                          ; 53D8   020D 0004

        SLL     R1,     1                       ; 53DA   0049
        ADDR    R1,     R0                      ; 53DB   00C8
        SLL     R1,     2                       ; 53DC   004D
        ADDR    R1,     R0                      ; 53DD   00C8
L_53DE:
        MVO@    R0,     R3                      ; 53DE   0258
        TSTR    R0                              ; 53DF   0080
        BEQ     L_53F0                          ; 53E0   0204 000E

L_53E2:
        MVII    #$0002, R1                      ; 53E2   02B9 0002
        MVII    #$0006, R3                      ; 53E4   02BB 0006
        MVII    #$02A9, R4                      ; 53E6   02BC 02A9
        J       .EXEC.8C6                       ; 53E8   0004 0318 00C6

L_53EB:
        PSHR    R3                              ; 53EB   0273

        JSR     R5,     L_65F8                  ; 53EC   0004 0164 01F8

        PULR    R3                              ; 53EF   02B3
L_53F0:
        CLRR    R0                              ; 53F0   01C0
        MVO@    R0,     R3                      ; 53F1   0258
        MVO     R0,     .BTAB.A9                ; 53F2   0240 02A9
        MVO     R0,     .BTAB.AA                ; 53F4   0240 02AA
        PULR    R7                              ; 53F6   02B7

L_53F7:
        MVI@    R3,     R0                      ; 53F7   0298
        TSTR    R0                              ; 53F8   0080
        BEQ     L_53EB                          ; 53F9   0224 000F

        CMP@    R4,     R0                      ; 53FB   0360
        BGT     L_53EB                          ; 53FC   022E 0012

        MOVR    R2,     R5                      ; 53FE   0095
        INCR    R5                              ; 53FF   000D
        ADDR    R7,     R5                      ; 5400   00FD
        ADD@    R5,     R7                      ; 5401   02EF

        SAR     R1,     2                       ; 5402   006D
        INCR    R2                              ; 5403   000A
        SAR     R2,     2                       ; 5404   006E
        ADDR    R5,     R5                      ; 5405   00ED
        CMPR    R5,     R6                      ; 5406   016E
        CMPR    R5,     R6                      ; 5407   016E
        CMPR    R5,     R6                      ; 5408   016E
        CMPR    R5,     R6                      ; 5409   016E
        CMPR    R5,     R6                      ; 540A   016E
        CMPR    R5,     R6                      ; 540B   016E
        CLRR    R0                              ; 540C   01C0
        MVO     R0,     G_0167                  ; 540D   0240 0167
        INCR    R0                              ; 540F   0008
        MVO     R0,     G_015D                  ; 5410   0240 015D
        MVII    #$0002, R0                      ; 5412   02B8 0002
        MVO     R0,     G_01A5                  ; 5414   0240 01A5

        JSR     R5,     L_696E                  ; 5416   0004 0168 016E

        MVII    #$0003, R3                      ; 5419   02BB 0003
        MVII    #$0215, R4                      ; 541B   02BC 0215

        JSR     R5,     X_PRINT_R5              ; 541D   0004 0118 007B
        STRING  "Select flag style:"            ; 5420  
        DECLE   $0000                           ; 5432   0000

        MVII    #$02DE, R4                      ; 5433   02BC 02DE
        SDBD                                    ; 5435   0001
        MVII    #$531E, R1                      ; 5436   02B9 001E 0053

        JSR     R5,     X_PRINT_R1              ; 5439   0004 0118 0067

        MVII    #$0005, R3                      ; 543C   02BB 0005
        MVII    #$0240, R4                      ; 543E   02BC 0240

        JSR     R5,     X_PRINT_R5              ; 5440   0004 0118 007B
        STRING  "1: downhill"                   ; 5443  
        DECLE   $0000                           ; 544E   0000

        MVII    #$0254, R4                      ; 544F   02BC 0254

        JSR     R5,     X_PRINT_R5              ; 5451   0004 0118 007B
        STRING  "2: slalom"                     ; 5454  
        DECLE   $0000                           ; 545D   0000

        MVII    #$0268, R4                      ; 545E   02BC 0268

        JSR     R5,     X_PRINT_R5              ; 5460   0004 0118 007B
        STRING  "3: no flags"                   ; 5463  
        DECLE   $0000                           ; 546E   0000

        PULR    R7                              ; 546F   02B7

        DECR    R0                              ; 5470   0010
        MVO@    R0,     R3                      ; 5471   0258
        MVII    #$0003, R0                      ; 5472   02B8 0003
        MVO     R0,     G_01A5                  ; 5474   0240 01A5

L_5476:
        JSR     R5,     L_696E                  ; 5476   0004 0168 016E

        MVII    #$0003, R3                      ; 5479   02BB 0003
        MVII    #$0217, R4                      ; 547B   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 547D   0004 0118 007B
        STRING  "Select course:"                ; 5480  
        DECLE   $0000                           ; 548E   0000

        MVII    #$02DE, R4                      ; 548F   02BC 02DE
        SDBD                                    ; 5491   0001
        MVII    #$531E, R1                      ; 5492   02B9 001E 0053

        JSR     R5,     X_PRINT_R1              ; 5495   0004 0118 0067

        MVII    #$0005, R3                      ; 5498   02BB 0005
        MVII    #$023E, R4                      ; 549A   02BC 023E

        JSR     R5,     X_PRINT_R5              ; 549C   0004 0118 007B
        STRING  "1-32: course #"                ; 549F  
        DECLE   $0000                           ; 54AD   0000

        MVII    #$0254, R4                      ; 54AE   02BC 0254

        JSR     R5,     X_PRINT_R5              ; 54B0   0004 0118 007B
        STRING  "33: helicopter"                ; 54B3  
        DECLE   $0000                           ; 54C1   0000

        MVII    #$0268, R4                      ; 54C2   02BC 0268

        JSR     R5,     X_PRINT_R5              ; 54C4   0004 0118 007B
        STRING  "34: own design"                ; 54C7  
        DECLE   $0000                           ; 54D5   0000

        MVII    #$027A, R4                      ; 54D6   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 54D8   0004 0118 007B
        STRING  "disk: preview"                 ; 54DB  
        DECLE   $0000                           ; 54E8   0000

        MVI     G_0184, R0                      ; 54E9   0280 0184
        TSTR    R0                              ; 54EB   0080
        BNEQ    L_53E2                          ; 54EC   022C 010B
        PULR    R7                              ; 54EE   02B7

        CLRR    R1                              ; 54EF   01C9
        MVO     R1,     G_01A3                  ; 54F0   0241 01A3
        DECR    R0                              ; 54F2   0010
        MVO@    R0,     R3                      ; 54F3   0258
        CMPI    #$0020, R0                      ; 54F4   0378 0020
        BEQ     L_5591                          ; 54F6   0204 0099
        BGT     L_562A                          ; 54F8   020E 0130

        JSR     R5,     L_55AC                  ; 54FA   0004 0154 01AC

L_54FD:
        CLRR    R0                              ; 54FD   01C0
        MVO     R0,     G_01A6                  ; 54FE   0240 01A6

        JSR     R5,     L_696E                  ; 5500   0004 0168 016E

        MVII    #$0003, R3                      ; 5503   02BB 0003
        MVII    #$0216, R4                      ; 5505   02BC 0216

        JSR     R5,     X_PRINT_R5              ; 5507   0004 0118 007B
        STRING  "Select the slope"              ; 550A  
        DECLE   $0000                           ; 551A   0000

        MVII    #$023F, R4                      ; 551B   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 551D   0004 0118 007B
        STRING  "for this course"               ; 5520  
        DECLE   $0000                           ; 552F   0000

        MVII    #$02DE, R4                      ; 5530   02BC 02DE
        SDBD                                    ; 5532   0001
        MVII    #$531E, R1                      ; 5533   02B9 001E 0053

        JSR     R5,     X_PRINT_R1              ; 5536   0004 0118 0067

        MVII    #$0005, R3                      ; 5539   02BB 0005
        MVII    #$026B, R4                      ; 553B   02BC 026B

        JSR     R5,     X_PRINT_R5              ; 553D   0004 0118 007B
        STRING  "[1-15]"                        ; 5540  
        DECLE   $0000                           ; 5546   0000

        MVII    #$0004, R0                      ; 5547   02B8 0004
        MVO     R0,     G_01A5                  ; 5549   0240 01A5
        MVI     G_0168, R0                      ; 554B   0280 0168
        DECR    R0                              ; 554D   0010
        BEQ     L_5798                          ; 554E   0204 0248

L_5550:
        MVII    #$0006, R3                      ; 5550   02BB 0006
        MVII    #$0243, R4                      ; 5552   02BC 0243

        JSR     R5,     X_PRINT_R5              ; 5554   0004 0118 007B
        STRING  "Player #   "                   ; 5557  
        DECLE   $0000                           ; 5562   0000

        MVI     G_01A5, R0                      ; 5563   0280 01A5
        SUBI    #$0003, R0                      ; 5565   0338 0003
        MVII    #$0002, R1                      ; 5567   02B9 0002
        MVII    #$0006, R3                      ; 5569   02BB 0006
        MVII    #$024B, R4                      ; 556B   02BC 024B
        J       .EXEC.8C6                       ; 556D   0004 0318 00C6

        MOVR    R0,     R1                      ; 5570   0081
        ADDI    #$0003, R1                      ; 5571   02F9 0003
        MVO@    R1,     R3                      ; 5573   0259
        MVI     G_0168, R1                      ; 5574   0281 0168
        ADDI    #$0003, R1                      ; 5576   02F9 0003
        CMPR    R1,     R2                      ; 5578   014A
        BGE     L_5582                          ; 5579   020D 0007

        INCR    R3                              ; 557B   000B
        MVO@    R0,     R3                      ; 557C   0258
        INCR    R2                              ; 557D   000A
        MVO     R2,     G_01A5                  ; 557E   0242 01A5
        B       L_5550                          ; 5580   0220 0031

L_5582:
        CLRR    R0                              ; 5582   01C0
        MVO     R0,     G_01A5                  ; 5583   0240 01A5
        MVII    #$0002, R0                      ; 5585   02B8 0002
        J       L_58E6                          ; 5587   0004 0358 00E6

        TSTR    R0                              ; 558A   0080
        BMI     L_558E                          ; 558B   020B 0001
        MOVR    R5,     R7                      ; 558D   00AF

L_558E:
        PSHR    R5                              ; 558E   0275
        B       L_5582                          ; 558F   0220 000E

L_5591:
        MVII    #$0005, R0                      ; 5591   02B8 0005

        JSR     R5,     X_RAND2                 ; 5593   0004 0114 029E

        ADDI    #$0009, R0                      ; 5596   02F8 0009
        MVO     R0,     G_0192                  ; 5598   0240 0192
        MOVR    R0,     R1                      ; 559A   0081
        MVII    #$0194, R4                      ; 559B   02BC 0194
        ADDR    R4,     R1                      ; 559D   00E1
L_559E:
        MVII    #$001B, R0                      ; 559E   02B8 001B

        JSR     R5,     X_RAND2                 ; 55A0   0004 0114 029E

        MVO@    R0,     R4                      ; 55A3   0260
        CMPR    R1,     R4                      ; 55A4   014C
        BLT     L_559E                          ; 55A5   0225 0008

        JSR     R5,     L_5602                  ; 55A7   0004 0154 0202

        B       L_54FD                          ; 55AA   0220 00AE

L_55AC:
        PSHR    R5                              ; 55AC   0275
        MOVR    R0,     R3                      ; 55AD   0083
        ANDI    #$0001, R3                      ; 55AE   03BB 0001
        SLR     R0,     1                       ; 55B0   0060
        MOVR    R0,     R1                      ; 55B1   0081
        SDBD                                    ; 55B2   0001
        ADDI    #$528E, R1                      ; 55B3   02F9 008E 0052
        MVI@    R1,     R1                      ; 55B6   0289
        MVO     R1,     G_0192                  ; 55B7   0241 0192
        MOVR    R0,     R2                      ; 55B9   0082
        SLL     R2,     2                       ; 55BA   004E
        SLL     R2,     1                       ; 55BB   004A
        SDBD                                    ; 55BC   0001
        ADDI    #$529E, R2                      ; 55BD   02FA 009E 0052
        MOVR    R2,     R5                      ; 55C0   0095
        MVII    #$0194, R4                      ; 55C1   02BC 0194
        CLRR    R1                              ; 55C3   01C9
L_55C4:
        MVI@    R5,     R2                      ; 55C4   02AA
        TSTR    R3                              ; 55C5   009B
        BEQ     L_55D2                          ; 55C6   0204 000A

        CMPI    #$000E, R2                      ; 55C8   037A 000E
        BGE     L_55D0                          ; 55CA   020D 0004

        ADDI    #$000E, R2                      ; 55CC   02FA 000E
        B       L_55D2                          ; 55CE   0200 0002

L_55D0:
        SUBI    #$000E, R2                      ; 55D0   033A 000E
L_55D2:
        MVO@    R2,     R4                      ; 55D2   0262
        INCR    R1                              ; 55D3   0009
        CMPI    #$0008, R1                      ; 55D4   0379 0008
        BNEQ    L_55DE                          ; 55D6   020C 0006

        XORI    #$0001, R3                      ; 55D8   03FB 0001
        SUBI    #$0009, R5                      ; 55DA   033D 0009
        B       L_55E0                          ; 55DC   0200 0002
L_55DE:
        BLT     L_55E0                          ; 55DE   0205 0000

L_55E0:
        CMPI    #$000F, R1                      ; 55E0   0379 000F
        BLT     L_55C4                          ; 55E2   0225 001F

        JSR     R5,     L_5602                  ; 55E4   0004 0154 0202

        PULR    R7                              ; 55E7   02B7

L_55E8:
        MVII    #$0007, R2                      ; 55E8   02BA 0007
        INCR    R7                              ; 55EA   000F

L_55EB:
        CLRR    R2                              ; 55EB   01D2
L_55EC:
        PSHR    R5                              ; 55EC   0275

        JSR     R5,     L_697F                  ; 55ED   0004 0168 017F

        CLRR    R0                              ; 55F0   01C0
        MVO     R0,     G_0106                  ; 55F1   0240 0106
        MVII    #$0028, R5                      ; 55F3   02BD 0028
        MVO@    R0,     R5                      ; 55F5   0268
        MVO@    R2,     R5                      ; 55F6   026A
        MVO@    R0,     R5                      ; 55F7   0268
        MVO@    R2,     R5                      ; 55F8   026A
        MVO@    R0,     R5                      ; 55F9   0268
        MVII    #$0030, R5                      ; 55FA   02BD 0030
        MVO@    R0,     R5                      ; 55FC   0268
        MVO@    R0,     R5                      ; 55FD   0268
        MVO@    R0,     R5                      ; 55FE   0268
        MVO     R0,     .STIC.VIDEN             ; 55FF   0240 0020
        PULR    R7                              ; 5601   02B7

L_5602:
        PSHR    R5                              ; 5602   0275
        CLRR    R0                              ; 5603   01C0
        MVO     R0,     G_01A3                  ; 5604   0240 01A3
        MVI     G_0192, R1                      ; 5606   0281 0192
        MVII    #$0194, R4                      ; 5608   02BC 0194
        ADDR    R4,     R1                      ; 560A   00E1
L_560B:
        MVI@    R4,     R2                      ; 560B   02A2
        MOVR    R2,     R3                      ; 560C   0093
        SUBI    #$000E, R3                      ; 560D   033B 000E
        BMI     L_5612                          ; 560F   020B 0001

        MOVR    R3,     R2                      ; 5611   009A
L_5612:
        SDBD                                    ; 5612   0001
        MVII    #$69E6, R3                      ; 5613   02BB 00E6 0069
        ADDR    R2,     R3                      ; 5616   00D3
        MVI@    R3,     R3                      ; 5617   029B
        ADD     G_01A3, R3                      ; 5618   02C3 01A3
        MVO     R3,     G_01A3                  ; 561A   0243 01A3
        CMPR    R1,     R4                      ; 561C   014C
        BLT     L_560B                          ; 561D   0225 0013
        PULR    R7                              ; 561F   02B7

        DECLE   $00DE,  $0056,  $003C,  $0057   ; 5620   00DE 0056 003C 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5624   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5628   0000 0000
L_562A:
        CLRR    R0                              ; 562A   01C0
        MVO     R0,     G_01AF                  ; 562B   0240 01AF
        MVO     R0,     G_01B0                  ; 562D   0240 01B0
        MVO     R0,     G_01B1                  ; 562F   0240 01B1
        MVI     G_035D, R0                      ; 5631   0280 035D
        SDBD                                    ; 5633   0001
        MVII    #$5620, R0                      ; 5634   02B8 0020 0056
        MVO     R0,     G_035D                  ; 5637   0240 035D

        JSR     R5,     L_5BA4                  ; 5639   0004 0158 03A4

        MVII    #$0006, R3                      ; 563C   02BB 0006
        MVII    #$020A, R4                      ; 563E   02BC 020A
        MVI     G_01B9, R0                      ; 5640   0280 01B9
        TSTR    R0                              ; 5642   0080
        BNEQ    L_5653                          ; 5643   020C 000E

        JSR     R5,     X_PRINT_R5              ; 5645   0004 0118 007B
        STRING  "DOWNHILL"                      ; 5648  
        DECLE   $0000                           ; 5650   0000

        B       L_565E                          ; 5651   0200 000B

L_5653:
        INCR    R4                              ; 5653   000C

        JSR     R5,     X_PRINT_R5              ; 5654   0004 0118 007B
        STRING  "SLALOM"                        ; 5657  
        DECLE   $0000                           ; 565D   0000
L_565E:
        MVII    #$021D, R4                      ; 565E   02BC 021D

        JSR     R5,     X_PRINT_R5              ; 5660   0004 0118 007B
        STRING  "Course Edit"                   ; 5663  
        DECLE   $0000                           ; 566E   0000

        MVII    #$0004, R3                      ; 566F   02BB 0004
        MVII    #$0246, R4                      ; 5671   02BC 0246

        JSR     R5,     X_PRINT_R5              ; 5673   0004 0118 007B
        STRING  "Disk to"                       ; 5676  
        DECLE   $0000                           ; 567D   0000

        MVII    #$025B, R4                      ; 567E   02BC 025B

        JSR     R5,     X_PRINT_R5              ; 5680   0004 0118 007B
        STRING  "view"                          ; 5683   0076 0069 0065 0077
        DECLE   $0000                           ; 5687   0000

        MVII    #$026F, R4                      ; 5688   02BC 026F

        JSR     R5,     X_PRINT_R5              ; 568A   0004 0118 007B
        STRING  "segments"                      ; 568D  
        DECLE   $0000                           ; 5695   0000

        MVII    #$0296, R4                      ; 5696   02BC 0296

        JSR     R5,     X_PRINT_R5              ; 5698   0004 0118 007B
        STRING  "then press"                    ; 569B  
        DECLE   $0000                           ; 56A5   0000

        MVII    #$02AB, R4                      ; 56A6   02BC 02AB

        JSR     R5,     X_PRINT_R5              ; 56A8   0004 0118 007B
        STRING  "enter"                         ; 56AB  
        DECLE   $0000                           ; 56B0   0000

        MVII    #$02D2, R4                      ; 56B1   02BC 02D2

        JSR     R5,     X_PRINT_R5              ; 56B3   0004 0118 007B
        STRING  "press 0"                       ; 56B6  
        DECLE   $0000                           ; 56BD   0000

        MVII    #$02E7, R4                      ; 56BE   02BC 02E7

        JSR     R5,     X_PRINT_R5              ; 56C0   0004 0118 007B
        STRING  "to finish"                     ; 56C3  
        DECLE   $0000                           ; 56CC   0000

        MVII    #$0200, R4                      ; 56CD   02BC 0200
        CLRR    R0                              ; 56CF   01C0
        DECR    R0                              ; 56D0   0010

        JSR     R5,     L_5B0D                  ; 56D1   0004 0158 030D
        JSR     R5,     L_5708                  ; 56D4   0004 0154 0308

        PULR    R7                              ; 56D7   02B7

L_56D8:
        CLRR    R0                              ; 56D8   01C0
        MVO     R0,     G_01B2                  ; 56D9   0240 01B2
        MVO     R0,     G_01B3                  ; 56DB   0240 01B3
        MOVR    R5,     R7                      ; 56DD   00AF

        TSTR    R0                              ; 56DE   0080
        BMI     L_56D8                          ; 56DF   022B 0008

L_56E1:
        PSHR    R5                              ; 56E1   0275
        MVII    #$0001, R0                      ; 56E2   02B8 0001
        MVO     R0,     G_01B2                  ; 56E4   0240 01B2
        MVII    #$000A, R0                      ; 56E6   02B8 000A
        MVO     R0,     G_01B3                  ; 56E8   0240 01B3
        MVO     R1,     G_01B4                  ; 56EA   0241 01B4
        MVI     G_01B1, R0                      ; 56EC   0280 01B1
        MVII    #$011F, R2                      ; 56EE   02BA 011F
        ADDR    R1,     R2                      ; 56F0   00CA
        MVI@    R2,     R2                      ; 56F1   0292
        ANDI    #$000F, R2                      ; 56F2   03BA 000F
        CMPI    #$0008, R2                      ; 56F4   037A 0008
        BLE     L_56FF                          ; 56F6   0206 0007

        DECR    R0                              ; 56F8   0010
        BPL     L_5705                          ; 56F9   0203 000A

        MVII    #$001B, R0                      ; 56FB   02B8 001B
        B       L_5705                          ; 56FD   0200 0006

L_56FF:
        INCR    R0                              ; 56FF   0008
        CMPI    #$001C, R0                      ; 5700   0378 001C
        BLT     L_5705                          ; 5702   0205 0001

        CLRR    R0                              ; 5704   01C0
L_5705:
        MVO     R0,     G_01B1                  ; 5705   0240 01B1
        INCR    R7                              ; 5707   000F

L_5708:
        PSHR    R5                              ; 5708   0275
L_5709:
        MVI     G_01B0, R1                      ; 5709   0281 01B0
        INCR    R1                              ; 570B   0009
        SLL     R1,     1                       ; 570C   0049
        SUB     G_01AF, R1                      ; 570D   0301 01AF
        MVII    #$0014, R0                      ; 570F   02B8 0014

        JSR     R5,     X_MPY                   ; 5711   0004 011C 01DC

        MVI     G_01B1, R0                      ; 5714   0280 01B1
        MOVR    R0,     R1                      ; 5716   0081
        ANDI    #$0080, R1                      ; 5717   03B9 0080
        BEQ     L_571F                          ; 5719   0204 0004

        SDBD                                    ; 571B   0001
        XORI    #$FF00, R0                      ; 571C   03F8 0000 00FF
L_571F:
        PSHR    R0                              ; 571F   0270

        JSR     R5,     L_697F                  ; 5720   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5723   0240 0020
        PULR    R0                              ; 5725   02B0
        PSHR    R0                              ; 5726   0270
        MVII    #$0200, R4                      ; 5727   02BC 0200
        ADDR    R2,     R4                      ; 5729   00D4

        JSR     R5,     L_5B0D                  ; 572A   0004 0158 030D

        PULR    R0                              ; 572D   02B0
        TSTR    R0                              ; 572E   0080
        BMI     L_5798                          ; 572F   020B 0067

        MVII    #$0284, R4                      ; 5731   02BC 0284
        MVII    #$0006, R3                      ; 5733   02BB 0006
        MVII    #$0002, R1                      ; 5735   02B9 0002
        INCR    R0                              ; 5737   0008

        JSR     R5,     X_PRNUM_RGT             ; 5738   0004 0118 00C5

        PULR    R7                              ; 573B   02B7

        PSHR    R5                              ; 573C   0275
        CMPI    #$000B, R0                      ; 573D   0378 000B
        BEQ     L_5768                          ; 573F   0204 0027

        TSTR    R0                              ; 5741   0080
        BNEQ    L_5798                          ; 5742   020C 0054

L_5744:
        MVI     G_01B0, R0                      ; 5744   0280 01B0
        CMPI    #$0003, R0                      ; 5746   0378 0003
        BGE     L_574E                          ; 5748   020D 0004

        JSR     R5,     L_65F8                  ; 574A   0004 0164 01F8

        PULR    R7                              ; 574D   02B7

L_574E:
        MVO     R0,     G_0192                  ; 574E   0240 0192
        CLRR    R0                              ; 5750   01C0
        DECR    R0                              ; 5751   0010
        DECR    R0                              ; 5752   0010
        MVO     R0,     G_01B1                  ; 5753   0240 01B1

        JSR     R5,     L_5708                  ; 5755   0004 0154 0308

        MVII    #$0016, R2                      ; 5758   02BA 0016

        JSR     R5,     L_527F                  ; 575A   0004 0150 027F
        JSR     R5,     L_5602                  ; 575D   0004 0154 0202

        SDBD                                    ; 5760   0001
        MVII    #$50CE, R1                      ; 5761   02B9 00CE 0050
        MVO     R1,     G_035D                  ; 5764   0241 035D
        B       L_54FD                          ; 5766   0220 026A

L_5768:
        MVI     G_01B0, R2                      ; 5768   0282 01B0
        MOVR    R2,     R3                      ; 576A   0093
        ADDI    #$0194, R2                      ; 576B   02FA 0194
        MVI     G_01B1, R1                      ; 576D   0281 01B1
        MVO@    R1,     R2                      ; 576F   0251
        INCR    R3                              ; 5770   000B
        MVO     R3,     G_01B0                  ; 5771   0243 01B0
        CMPI    #$0005, R3                      ; 5773   037B 0005
        BLT     L_578C                          ; 5775   0205 0015

        MVII    #$0009, R0                      ; 5777   02B8 0009

        JSR     R5,     L_5A5C                  ; 5779   0004 0158 025C

        MVII    #$0009, R0                      ; 577C   02B8 0009

        JSR     R5,     L_5A5C                  ; 577E   0004 0158 025C

        MVII    #$000A, R2                      ; 5781   02BA 000A

        JSR     R5,     L_527F                  ; 5783   0004 0150 027F

        MVI     G_01AF, R0                      ; 5786   0280 01AF
        ADDI    #$0002, R0                      ; 5788   02F8 0002
        MVO     R0,     G_01AF                  ; 578A   0240 01AF
L_578C:
        CLRR    R0                              ; 578C   01C0
        MVI     G_01B0, R3                      ; 578D   0283 01B0
        CMPI    #$000F, R3                      ; 578F   037B 000F
        BGE     L_5744                          ; 5791   022D 004E

        MVO     R0,     G_01B1                  ; 5793   0240 01B1

        JSR     R5,     L_5708                  ; 5795   0004 0154 0308

L_5798:
        PULR    R7                              ; 5798   02B7

        PSHR    R5                              ; 5799   0275

        JSR     R5,     L_6126                  ; 579A   0004 0160 0126

        SDBD                                    ; 579D   0001
        MVII    #$50C4, R0                      ; 579E   02B8 00C4 0050
        MVO     R0,     G_035D                  ; 57A1   0240 035D
        SDBD                                    ; 57A3   0001
        MVII    #$5024, R1                      ; 57A4   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; 57A7   0004 0118 0044

        SDBD                                    ; 57AA   0001
        MVII    #$5020, R1                      ; 57AB   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 57AE   0004 0118 0044

        CLRR    R0                              ; 57B1   01C0
        MVO     R0,     G_01A4                  ; 57B2   0240 01A4
        MVII    #$015E, R4                      ; 57B4   02BC 015E
        MVO@    R0,     R4                      ; 57B6   0260
        MVO@    R0,     R4                      ; 57B7   0260
        MVO     R0,     G_0193                  ; 57B8   0240 0193
        MVO     R0,     G_0183                  ; 57BA   0240 0183

        JSR     R5,     L_65BB                  ; 57BC   0004 0164 01BB

        MVI     G_01B9, R5                      ; 57BF   0285 01B9
        CMPI    #$0002, R5                      ; 57C1   037D 0002
        BNEQ    L_57C8                          ; 57C3   020C 0003

        CLRR    R5                              ; 57C5   01ED
        MVO     R5,     G_01A3                  ; 57C6   0245 01A3
L_57C8:
        J       L_660D                          ; 57C8   0004 0364 020D

        DECLE   $00BB,  $0059,  $0048,  $005A   ; 57CB   00BB 0059 0048 005A
        DECLE   $0044,  $005A,  $0044,  $005A   ; 57CF   0044 005A 0044 005A
        DECLE   $0044,  $005A,  $0000,  $0000   ; 57D3   0044 005A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $0055   ; 57DB   0000 0000 00AA 0055
        DECLE   $00AA,  $0055,  $00AA,  $0055   ; 57DF   00AA 0055 00AA 0055
        DECLE   $00AA,  $0055,  $00AA,  $0054   ; 57E3   00AA 0055 00AA 0054
        DECLE   $00A8,  $0050,  $00A0,  $0040   ; 57E7   00A8 0050 00A0 0040
        DECLE   $0080,  $0000,  $00AA,  $0055   ; 57EB   0080 0000 00AA 0055
        DECLE   $002A,  $0015,  $000A,  $0005   ; 57EF   002A 0015 000A 0005
        DECLE   $0002,  $0001,  $0000,  $0001   ; 57F3   0002 0001 0000 0001
        DECLE   $0002,  $0005,  $000A,  $0015   ; 57F7   0002 0005 000A 0015
        DECLE   $002A,  $0055,  $0080,  $0040   ; 57FB   002A 0055 0080 0040
        DECLE   $00A0,  $0050,  $00A8,  $0054   ; 57FF   00A0 0050 00A8 0054
        DECLE   $00AA,  $0055,  $00A0,  $0050   ; 5803   00AA 0055 00A0 0050
        DECLE   $00A0,  $0050,  $00A0,  $0050   ; 5807   00A0 0050 00A0 0050
        DECLE   $00A0,  $0050,  $000A,  $0005   ; 580B   00A0 0050 000A 0005
        DECLE   $000A,  $0005,  $000A,  $0005   ; 580F   000A 0005 000A 0005
        DECLE   $000A,  $0005,  $00AA,  $0054   ; 5813   000A 0005 00AA 0054
        DECLE   $00A8,  $0050,  $00A0,  $0050   ; 5817   00A8 0050 00A0 0050
        DECLE   $00A0,  $0050,  $00AA,  $0055   ; 581B   00A0 0050 00AA 0055
        DECLE   $002A,  $0015,  $000A,  $0005   ; 581F   002A 0015 000A 0005
        DECLE   $000A,  $0005,  $00A0,  $0050   ; 5823   000A 0005 00A0 0050
        DECLE   $00A0,  $0050,  $00A8,  $0054   ; 5827   00A0 0050 00A8 0054
        DECLE   $00AA,  $0055,  $000A,  $0005   ; 582B   00AA 0055 000A 0005
        DECLE   $000A,  $0005,  $000A,  $0015   ; 582F   000A 0005 000A 0015
        DECLE   $002A,  $0055,  $00AA,  $0054   ; 5833   002A 0055 00AA 0054
        DECLE   $00A8,  $0050,  $00A8,  $0054   ; 5837   00A8 0050 00A8 0054
        DECLE   $00AA,  $0055,  $002A,  $0015   ; 583B   00AA 0055 002A 0015
        DECLE   $000A,  $0005,  $000A,  $0015   ; 583F   000A 0005 000A 0015
        DECLE   $002A,  $0055,  $00A0,  $0040   ; 5843   002A 0055 00A0 0040
        DECLE   $0080,  $0000,  $0080,  $0040   ; 5847   0080 0000 0080 0040
        DECLE   $00A0,  $0050,  $000A,  $0005   ; 584B   00A0 0050 000A 0005
        DECLE   $0002,  $0001,  $0000,  $0001   ; 584F   0002 0001 0000 0001
        DECLE   $0002,  $0005,  $0000,  $0000   ; 5853   0002 0005 0000 0000
        DECLE   $0080,  $0040,  $00A0,  $0050   ; 5857   0080 0040 00A0 0050
        DECLE   $00A0,  $0050,  $0000,  $0001   ; 585B   00A0 0050 0000 0001
        DECLE   $0002,  $0005,  $000A,  $0005   ; 585F   0002 0005 000A 0005
        DECLE   $000A,  $0005,  $00A0,  $0050   ; 5863   000A 0005 00A0 0050
        DECLE   $00A8,  $0054,  $00AA,  $0055   ; 5867   00A8 0054 00AA 0055
        DECLE   $00AA,  $0055,  $00A8,  $0050   ; 586B   00AA 0055 00A8 0050
        DECLE   $00A0,  $0040,  $0080,  $0000   ; 586F   00A0 0040 0080 0000
        DECLE   $0000,  $0000,  $00A0,  $0050   ; 5873   0000 0000 00A0 0050
        DECLE   $00A0,  $0050,  $00A0,  $0040   ; 5877   00A0 0050 00A0 0040
        DECLE   $0080,  $0000,  $000A,  $0005   ; 587B   0080 0000 000A 0005
        DECLE   $000A,  $0005,  $0002,  $0001   ; 587F   000A 0005 0002 0001
        DECLE   $0000,  $0000,  $000A,  $0005   ; 5883   0000 0000 000A 0005
        DECLE   $0002,  $0001,  $0000,  $0000   ; 5887   0002 0001 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 588B   0000 0000 0080 0040
        DECLE   $00A0,  $0050,  $00A0,  $0040   ; 588F   00A0 0050 00A0 0040
        DECLE   $0080,  $0000,  $000A,  $0015   ; 5893   0080 0000 000A 0015
        DECLE   $002A,  $0055,  $00AA,  $0055   ; 5897   002A 0055 00AA 0055
        DECLE   $00AA,  $0055,  $0000,  $0001   ; 589B   00AA 0055 0000 0001
        DECLE   $0002,  $0005,  $0002,  $0001   ; 589F   0002 0005 0002 0001
        DECLE   $0000,  $0000,  $00AB,  $0058   ; 58A3   0000 0000 00AB 0058
        DECLE   $00B4,  $0058,  $00BC,  $0058   ; 58A7   00B4 0058 00BC 0058
        DECLE   $0044,  $004F,  $0057,  $004E   ; 58AB   0044 004F 0057 004E
        DECLE   $0048,  $0049,  $004C,  $004C   ; 58AF   0048 0049 004C 004C
        DECLE   $0000,  $0020,  $0053,  $004C   ; 58B3   0000 0020 0053 004C
        DECLE   $0041,  $004C,  $004F,  $004D   ; 58B7   0041 004C 004F 004D
        DECLE   $0000,  $004E,  $004F,  $0020   ; 58BB   0000 004E 004F 0020
        DECLE   $0046,  $004C,  $0041,  $0047   ; 58BF   0046 004C 0041 0047
        DECLE   $0053,  $0000                   ; 58C3   0053 0000

        PSHR    R5                              ; 58C5   0275
        TSTR    R0                              ; 58C6   0080
        BMI     L_58CA                          ; 58C7   020B 0001
L_58C9:
        PULR    R7                              ; 58C9   02B7

L_58CA:
        MVI     G_01A5, R0                      ; 58CA   0280 01A5
        CMPI    #$0003, R0                      ; 58CC   0378 0003
        BNEQ    L_58C9                          ; 58CE   022C 0006

        MVI     G_0184, R1                      ; 58D0   0281 0184
        DECR    R1                              ; 58D2   0011
        BMI     L_58C9                          ; 58D3   022B 000B

        CMPI    #$0020, R1                      ; 58D5   0379 0020
        BGE     L_58C9                          ; 58D7   022D 000F

        MOVR    R1,     R0                      ; 58D9   0088
        PSHR    R1                              ; 58DA   0271

        JSR     R5,     L_55AC                  ; 58DB   0004 0154 01AC

        MVII    #$0001, R0                      ; 58DE   02B8 0001
        MVO     R0,     G_01AE                  ; 58E0   0240 01AE
        PULR    R1                              ; 58E2   02B1
        B       L_58EE                          ; 58E3   0200 0009

        PSHR    R5                              ; 58E5   0275
L_58E6:
        MVO     R0,     G_01AE                  ; 58E6   0240 01AE
        MVI     G_0184, R1                      ; 58E8   0281 0184
        CMPI    #$0022, R1                      ; 58EA   0379 0022
        BGT     L_58C9                          ; 58EC   022E 0024

L_58EE:
        CLRR    R0                              ; 58EE   01C0
        MVO     R0,     G_01AF                  ; 58EF   0240 01AF
        MVO     R0,     G_0325                  ; 58F1   0240 0325
        MVO     R0,     G_032D                  ; 58F3   0240 032D
        MVO     R0,     G_0335                  ; 58F5   0240 0335
        MVI     G_035D, R0                      ; 58F7   0280 035D
        MVO     R0,     G_031C                  ; 58F9   0240 031C
        SDBD                                    ; 58FB   0001
        MVII    #$57CB, R0                      ; 58FC   02B8 00CB 0057
        MVO     R0,     G_035D                  ; 58FF   0240 035D

        JSR     R5,     L_5BA4                  ; 5901   0004 0158 03A4

        MVI     G_0184, R0                      ; 5904   0280 0184
        MVI     G_01A5, R1                      ; 5906   0281 01A5
        TSTR    R1                              ; 5908   0089
        BNEQ    L_590C                          ; 5909   020C 0001

        INCR    R0                              ; 590B   0008
L_590C:
        PSHR    R0                              ; 590C   0270
        MVII    #$021F, R4                      ; 590D   02BC 021F
        MVII    #$0006, R3                      ; 590F   02BB 0006
        MVI     G_01B9, R5                      ; 5911   0285 01B9
        ADDR    R5,     R5                      ; 5913   00ED
        SDBD                                    ; 5914   0001
        ADDI    #$58A5, R5                      ; 5915   02FD 00A5 0058
        SDBD                                    ; 5918   0001
        MVI@    R5,     R1                      ; 5919   02A9

        JSR     R5,     X_PRINT_R1              ; 591A   0004 0118 0067

        PULR    R0                              ; 591D   02B0
        CMPI    #$0021, R0                      ; 591E   0378 0021
        BGE     L_593E                          ; 5920   020D 001C

        PSHR    R0                              ; 5922   0270
        MVII    #$0234, R4                      ; 5923   02BC 0234

        JSR     R5,     X_PRINT_R5              ; 5925   0004 0118 007B
        STRING  "Course"                        ; 5928  
        DECLE   $0000                           ; 592E   0000

        MVII    #$0249, R4                      ; 592F   02BC 0249

        JSR     R5,     X_PRINT_R5              ; 5931   0004 0118 007B
        STRING  "#"                             ; 5934   0023
        DECLE   $0000                           ; 5935   0000

        MVII    #$0002, R1                      ; 5936   02B9 0002
        PULR    R0                              ; 5938   02B0

        JSR     R5,     X_PRNUM_RGT             ; 5939   0004 0118 00C5

        B       L_596C                          ; 593C   0200 002E

L_593E:
        CMPI    #$0022, R0                      ; 593E   0378 0022
        BGE     L_5954                          ; 5940   020D 0012

        MVII    #$0232, R4                      ; 5942   02BC 0232

        JSR     R5,     X_PRINT_R5              ; 5944   0004 0118 007B
        STRING  "Helicopter"                    ; 5947  
        DECLE   $0000                           ; 5951   0000

        B       L_5960                          ; 5952   0200 000C

L_5954:
        MVII    #$0234, R4                      ; 5954   02BC 0234

        JSR     R5,     X_PRINT_R5              ; 5956   0004 0118 007B
        STRING  "Custom"                        ; 5959  
        DECLE   $0000                           ; 595F   0000
L_5960:
        MVII    #$0248, R4                      ; 5960   02BC 0248

        JSR     R5,     X_PRINT_R5              ; 5962   0004 0118 007B
        STRING  "Course"                        ; 5965  
        DECLE   $0000                           ; 596B   0000
L_596C:
        MVII    #$0004, R3                      ; 596C   02BB 0004
        MVII    #$02AB, R4                      ; 596E   02BC 02AB

        JSR     R5,     X_PRINT_R5              ; 5970   0004 0118 007B
        STRING  "Hit pad"                       ; 5973  
        DECLE   $0000                           ; 597A   0000

        MVII    #$02C0, R4                      ; 597B   02BC 02C0

        JSR     R5,     X_PRINT_R5              ; 597D   0004 0118 007B
        STRING  "to"                            ; 5980   0074 006F
        DECLE   $0000                           ; 5982   0000

        MVII    #$02D4, R4                      ; 5983   02BC 02D4

        JSR     R5,     X_PRINT_R5              ; 5985   0004 0118 007B
        STRING  "exit"                          ; 5988   0065 0078 0069 0074
        DECLE   $0000                           ; 598C   0000

        MVII    #$0200, R4                      ; 598D   02BC 0200
        CLRR    R0                              ; 598F   01C0
        DECR    R0                              ; 5990   0010

        JSR     R5,     L_5B0D                  ; 5991   0004 0158 030D

        MVII    #$0228, R4                      ; 5994   02BC 0228
        MVI     G_0192, R1                      ; 5996   0281 0192
        MVII    #$0194, R2                      ; 5998   02BA 0194
L_599A:
        PSHR    R4                              ; 599A   0274
        PSHR    R2                              ; 599B   0272
        PSHR    R1                              ; 599C   0271
        MVI@    R2,     R0                      ; 599D   0290

        JSR     R5,     L_5B0D                  ; 599E   0004 0158 030D

        PULR    R1                              ; 59A1   02B1
        PULR    R2                              ; 59A2   02B2
        PULR    R4                              ; 59A3   02B4
        ADDI    #$0028, R4                      ; 59A4   02FC 0028
        CMPI    #$02C8, R4                      ; 59A6   037C 02C8
        BGT     L_58C9                          ; 59A8   022E 00E0

        INCR    R2                              ; 59AA   000A
        DECR    R1                              ; 59AB   0011
        BNEQ    L_599A                          ; 59AC   022C 0013

        CLRR    R0                              ; 59AE   01C0
        DECR    R0                              ; 59AF   0010
        DECR    R0                              ; 59B0   0010

        JSR     R5,     L_5B0D                  ; 59B1   0004 0158 030D

        PULR    R7                              ; 59B4   02B7

L_59B5:
        CLRR    R0                              ; 59B5   01C0
        MVO     R0,     G_01B2                  ; 59B6   0240 01B2
        MVO     R0,     G_01B3                  ; 59B8   0240 01B3
        MOVR    R5,     R7                      ; 59BA   00AF

        TSTR    R0                              ; 59BB   0080
        BMI     L_59B5                          ; 59BC   022B 0008

L_59BE:
        PSHR    R5                              ; 59BE   0275
        MVII    #$0002, R2                      ; 59BF   02BA 0002
        MVO     R2,     G_01B2                  ; 59C1   0242 01B2
        MVII    #$000A, R2                      ; 59C3   02BA 000A
        MVO     R2,     G_01B3                  ; 59C5   0242 01B3
        MVO     R1,     G_01B4                  ; 59C7   0241 01B4
        MVII    #$011F, R2                      ; 59C9   02BA 011F
        ADDR    R1,     R2                      ; 59CB   00CA
        MVI@    R2,     R0                      ; 59CC   0290
        ANDI    #$000F, R0                      ; 59CD   03B8 000F
        CMPI    #$0008, R0                      ; 59CF   0378 0008
        BLE     L_5A15                          ; 59D1   0206 0042

        MVI     G_01AF, R0                      ; 59D3   0280 01AF
        INCR    R0                              ; 59D5   0008
        PSHR    R0                              ; 59D6   0270
        ADDI    #$000C, R0                      ; 59D7   02F8 000C
        SLR     R0,     1                       ; 59D9   0060
        MVI     G_0192, R1                      ; 59DA   0281 0192
        ADDI    #$0002, R1                      ; 59DC   02F9 0002
        CMPR    R1,     R0                      ; 59DE   0148
        PULR    R0                              ; 59DF   02B0
        BGE     L_58C9                          ; 59E0   022D 0118

        MVO     R0,     G_01AF                  ; 59E2   0240 01AF

        JSR     R5,     L_697F                  ; 59E4   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 59E7   0240 0020

        JSR     R5,     L_55EB                  ; 59E9   0004 0154 01EB

        MVII    #$000A, R0                      ; 59EC   02B8 000A

        JSR     R5,     L_5A5C                  ; 59EE   0004 0158 025C
        JSR     R5,     L_55E8                  ; 59F1   0004 0154 01E8

        MVII    #$02C8, R4                      ; 59F4   02BC 02C8
        MVI     G_01AF, R1                      ; 59F6   0281 01AF
        ADDI    #$000A, R1                      ; 59F8   02F9 000A
        MOVR    R1,     R0                      ; 59FA   0088
        ANDI    #$0001, R1                      ; 59FB   03B9 0001
        BEQ     L_5A02                          ; 59FD   0204 0003

        ADDI    #$0014, R4                      ; 59FF   02FC 0014
        INCR    R0                              ; 5A01   0008
L_5A02:
        SLR     R0,     1                       ; 5A02   0060
        MVI     G_0192, R1                      ; 5A03   0281 0192
        CMPR    R1,     R0                      ; 5A05   0148
        BLE     L_5A0D                          ; 5A06   0206 0005

        CLRR    R0                              ; 5A08   01C0
        DECR    R0                              ; 5A09   0010
        DECR    R0                              ; 5A0A   0010
        B       L_5A11                          ; 5A0B   0200 0004

L_5A0D:
        MOVR    R0,     R1                      ; 5A0D   0081
        ADDI    #$0193, R1                      ; 5A0E   02F9 0193
        MVI@    R1,     R0                      ; 5A10   0288

L_5A11:
        JSR     R5,     L_5B0D                  ; 5A11   0004 0158 030D

        PULR    R7                              ; 5A14   02B7

L_5A15:
        MVI     G_01AF, R0                      ; 5A15   0280 01AF
        DECR    R0                              ; 5A17   0010
        BMI     L_58C9                          ; 5A18   022B 0150

        MVO     R0,     G_01AF                  ; 5A1A   0240 01AF

        JSR     R5,     L_697F                  ; 5A1C   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5A1F   0240 0020

        JSR     R5,     L_55EB                  ; 5A21   0004 0154 01EB
        JSR     R5,     L_5A81                  ; 5A24   0004 0158 0281
        JSR     R5,     L_55E8                  ; 5A27   0004 0154 01E8

        MVII    #$0200, R4                      ; 5A2A   02BC 0200
        MVI     G_01AF, R1                      ; 5A2C   0281 01AF
        MOVR    R1,     R0                      ; 5A2E   0088
        ANDI    #$0001, R1                      ; 5A2F   03B9 0001
        BEQ     L_5A35                          ; 5A31   0204 0002

        SUBI    #$0014, R4                      ; 5A33   033C 0014
L_5A35:
        SLR     R0,     1                       ; 5A35   0060
        TSTR    R0                              ; 5A36   0080
        BNEQ    L_5A3C                          ; 5A37   020C 0003

        DECR    R0                              ; 5A39   0010
        B       L_5A40                          ; 5A3A   0200 0004

L_5A3C:
        MOVR    R0,     R1                      ; 5A3C   0081
        ADDI    #$0193, R1                      ; 5A3D   02F9 0193
        MVI@    R1,     R0                      ; 5A3F   0288

L_5A40:
        JSR     R5,     L_5B0D                  ; 5A40   0004 0158 030D

        PULR    R7                              ; 5A43   02B7

        TSTR    R0                              ; 5A44   0080
        BMI     L_5A48                          ; 5A45   020B 0001
        MOVR    R5,     R7                      ; 5A47   00AF

L_5A48:
        PSHR    R5                              ; 5A48   0275
        MVI     G_031C, R0                      ; 5A49   0280 031C
        MVO     R0,     G_035D                  ; 5A4B   0240 035D
        MVI     G_01AE, R0                      ; 5A4D   0280 01AE
        CLRR    R1                              ; 5A4F   01C9
        MVO     R1,     G_01AE                  ; 5A50   0241 01AE
        CMPI    #$0001, R0                      ; 5A52   0378 0001
        BEQ     L_5A59                          ; 5A54   0204 0003
        J       L_5BE3                          ; 5A56   0004 0358 03E3
L_5A59:
        J       L_5476                          ; 5A59   0004 0354 0076

L_5A5C:
        PSHR    R5                              ; 5A5C   0275
        MOVR    R0,     R1                      ; 5A5D   0081
        MVII    #$0214, R4                      ; 5A5E   02BC 0214
        MVII    #$0200, R5                      ; 5A60   02BD 0200
        MVII    #$000B, R2                      ; 5A62   02BA 000B
        B       L_5A6C                          ; 5A64   0200 0006

L_5A66:
        MOVR    R1,     R3                      ; 5A66   008B
        NEGR    R3                              ; 5A67   0023
        ADDI    #$0014, R3                      ; 5A68   02FB 0014
        ADDR    R3,     R4                      ; 5A6A   00DC
        ADDR    R3,     R5                      ; 5A6B   00DD
L_5A6C:
        MOVR    R1,     R3                      ; 5A6C   008B
L_5A6D:
        MVI@    R4,     R0                      ; 5A6D   02A0
        MVO@    R0,     R5                      ; 5A6E   0268
        DECR    R3                              ; 5A6F   0013
        BNEQ    L_5A6D                          ; 5A70   022C 0004

        DECR    R2                              ; 5A72   0012
        BNEQ    L_5A66                          ; 5A73   022C 000E

        MOVR    R1,     R3                      ; 5A75   008B
        NEGR    R3                              ; 5A76   0023
        ADDI    #$0014, R3                      ; 5A77   02FB 0014
        ADDR    R3,     R4                      ; 5A79   00DC
        ADDR    R3,     R5                      ; 5A7A   00DD
        MOVR    R1,     R3                      ; 5A7B   008B
L_5A7C:
        MVO@    R2,     R5                      ; 5A7C   026A
        DECR    R3                              ; 5A7D   0013
        BNEQ    L_5A7C                          ; 5A7E   022C 0003
        PULR    R7                              ; 5A80   02B7

L_5A81:
        PSHR    R5                              ; 5A81   0275
        MVII    #$02C8, R4                      ; 5A82   02BC 02C8
        MVII    #$02DC, R5                      ; 5A84   02BD 02DC
        MVII    #$000B, R2                      ; 5A86   02BA 000B
L_5A88:
        MVII    #$0009, R3                      ; 5A88   02BB 0009
L_5A8A:
        MVI@    R4,     R0                      ; 5A8A   02A0
        MVO@    R0,     R5                      ; 5A8B   0268
        DECR    R3                              ; 5A8C   0013
        BNEQ    L_5A8A                          ; 5A8D   022C 0004

        SUBI    #$001D, R4                      ; 5A8F   033C 001D
        SUBI    #$001D, R5                      ; 5A91   033D 001D
        DECR    R2                              ; 5A93   0012
        BNEQ    L_5A88                          ; 5A94   022C 000D

        MVII    #$0009, R3                      ; 5A96   02BB 0009
L_5A98:
        MVO@    R2,     R5                      ; 5A98   026A
        DECR    R3                              ; 5A99   0013
        BNEQ    L_5A98                          ; 5A9A   022C 0003
        PULR    R7                              ; 5A9C   02B7

        DECLE   $0005,  $0005,  $0010,  $0001   ; 5A9D   0005 0005 0010 0001
        DECLE   $0005,  $0005,  $0005,  $0010   ; 5AA1   0005 0005 0005 0010
        DECLE   $0015,  $0001,  $0001,  $0005   ; 5AA5   0015 0001 0001 0005
        DECLE   $0010,  $0001,  $0005,  $0005   ; 5AA9   0010 0001 0005 0005
        DECLE   $0010,  $0001,  $0005,  $0005   ; 5AAD   0010 0001 0005 0005
        DECLE   $0005,  $0010,  $0015,  $0001   ; 5AB1   0005 0010 0015 0001
        DECLE   $0001,  $0005,  $0010,  $0001   ; 5AB5   0001 0005 0010 0001
        DECLE   $000C,  $0038,  $0137,  $0281   ; 5AB9   000C 0038 0137 0281
        DECLE   $0198,  $0031,  $02CA,  $0181   ; 5ABD   0198 0031 02CA 0181
        DECLE   $0031,  $032E,  $0021,  $01F7   ; 5AC1   0031 032E 0021 01F7
        DECLE   $0082,  $00A1,  $0023,  $032C   ; 5AC5   0082 00A1 0023 032C
        DECLE   $0021,  $01B7,  $0001,  $0027   ; 5AC9   0021 01B7 0001 0027
        DECLE   $00F7,  $0008,  $0149,  $00E0   ; 5ACD   00F7 0008 0149 00E0
        DECLE   $02E1,  $018D,  $0039,  $02E1   ; 5AD1   02E1 018D 0039 02E1
        DECLE   $0024,  $0137,  $0325,  $0021   ; 5AD5   0024 0137 0325 0021
        DECLE   $0077,  $0325,  $0021,  $01F7   ; 5AD9   0077 0325 0021 01F7
        DECLE   $032A,  $0021,  $01B7,  $0088   ; 5ADD   032A 0021 01B7 0088
        DECLE   $00C1,  $0023,  $0012,  $010D   ; 5AE1   00C1 0023 0012 010D
        DECLE   $0039,  $02B2,  $0021,  $01B0   ; 5AE5   0039 02B2 0021 01B0
        DECLE   $02E1,  $010B,  $0039,  $02E1   ; 5AE9   02E1 010B 0039 02E1
        DECLE   $01C9,  $0039,  $00A1,  $0023   ; 5AED   01C9 0039 00A1 0023
        DECLE   $0082,  $0201,  $0198,  $0039   ; 5AF1   0082 0201 0198 0039
        DECLE   $0006,  $00C1,  $0039,  $0008   ; 5AF5   0006 00C1 0039 0008
        DECLE   $00C9,  $0160,  $032C,  $0021   ; 5AF9   00C9 0160 032C 0021
        DECLE   $01B7                           ; 5AFD   01B7

        SUB@    R4,     R5                      ; 5AFE   0325
        SUBR    R0,     R1                      ; 5AFF   0101
        RSWD    R1                              ; 5B00   0039
        ADD@    R4,     R1                      ; 5B01   02E1
        SWAP    R0,     2                       ; 5B02   0044
        RSWD    R1                              ; 5B03   0039
        ADD@    R4,     R1                      ; 5B04   02E1
        XORR    R1,     R3                      ; 5B05   01CB
        RSWD    R1                              ; 5B06   0039
        ADD@    R4,     R1                      ; 5B07   02E1
        ANDR    R1,     R3                      ; 5B08   018B
        RSWD    R1                              ; 5B09   0039
        MOVR    R4,     R1                      ; 5B0A   00A1
        ADCR    R1                              ; 5B0B   0029
        ADDR    R4,     R2                      ; 5B0C   00E2
L_5B0D:
        PSHR    R5                              ; 5B0D   0275
        TSTR    R0                              ; 5B0E   0080
        BMI     L_5B6C                          ; 5B0F   020B 005B

        ADDI    #$0003, R4                      ; 5B11   02FC 0003
        MOVR    R0,     R3                      ; 5B13   0083
        ADDR    R0,     R3                      ; 5B14   00C3
        ADDR    R0,     R3                      ; 5B15   00C3
        SDBD                                    ; 5B16   0001
        ADDI    #$5AB9, R3                      ; 5B17   02FB 00B9 005A
        MOVR    R0,     R2                      ; 5B1A   0082
        SDBD                                    ; 5B1B   0001
        ADDI    #$5A9D, R2                      ; 5B1C   02FA 009D 005A
        MVI@    R2,     R2                      ; 5B1F   0292
        MVO     R2,     G_01BB                  ; 5B20   0242 01BB

        JSR     R5,     L_5B4C                  ; 5B22   0004 0158 034C

        SDBD                                    ; 5B25   0001
        MVII    #$2000, R2                      ; 5B26   02BA 0000 0020
        XORR    R2,     R0                      ; 5B29   01D0
        CMPI    #$0200, R4                      ; 5B2A   037C 0200
        BLT     L_5B30                          ; 5B2C   0205 0002

        MVO@    R0,     R4                      ; 5B2E   0260
        MVO@    R1,     R4                      ; 5B2F   0261

L_5B30:
        JSR     R5,     L_5B4C                  ; 5B30   0004 0158 034C

        CMPI    #$0200, R4                      ; 5B33   037C 0200
        BLT     L_5B3B                          ; 5B35   0205 0004

        MVO@    R0,     R4                      ; 5B37   0260
        MVO@    R2,     R4                      ; 5B38   0262
        B       L_5B3D                          ; 5B39   0200 0002

L_5B3B:
        ADDI    #$0004, R4                      ; 5B3B   02FC 0004
L_5B3D:
        ADDI    #$0010, R4                      ; 5B3D   02FC 0010
        CMPI    #$02F0, R4                      ; 5B3F   037C 02F0
        BGE     L_58C9                          ; 5B41   022D 0279

        XORR    R2,     R1                      ; 5B43   01D1
        MVO@    R1,     R4                      ; 5B44   0261

        JSR     R5,     L_5B4C                  ; 5B45   0004 0158 034C

        MVO@    R0,     R4                      ; 5B48   0260
        MVO@    R1,     R4                      ; 5B49   0261
        MVO@    R2,     R4                      ; 5B4A   0262
        PULR    R7                              ; 5B4B   02B7

L_5B4C:
        PSHR    R5                              ; 5B4C   0275
        MVI@    R3,     R0                      ; 5B4D   0298
        MOVR    R0,     R1                      ; 5B4E   0081
        SLR     R1,     2                       ; 5B4F   0065
        ANDI    #$00F8, R1                      ; 5B50   03B9 00F8
        ANDI    #$001F, R0                      ; 5B52   03B8 001F
        SLL     R0,     2                       ; 5B54   004C
        SLL     R0,     1                       ; 5B55   0048
        INCR    R3                              ; 5B56   000B
        MVI     G_01BB, R5                      ; 5B57   0285 01BB
        PSHR    R5                              ; 5B59   0275
        ANDI    #$0010, R5                      ; 5B5A   03BD 0010
        PULR    R5                              ; 5B5C   02B5
        BEQ     L_5B65                          ; 5B5D   0204 0006

        ANDI    #$0007, R5                      ; 5B5F   03BD 0007
        SDBD                                    ; 5B61   0001
        XORI    #$1000, R5                      ; 5B62   03FD 0000 0010
L_5B65:
        SDBD                                    ; 5B65   0001
        XORI    #$0800, R5                      ; 5B66   03FD 0000 0008
        XORR    R5,     R0                      ; 5B69   01E8
        XORR    R5,     R1                      ; 5B6A   01E9
        PULR    R7                              ; 5B6B   02B7

L_5B6C:
        INCR    R0                              ; 5B6C   0008
        BMI     L_5B88                          ; 5B6D   020B 0019

        CMPI    #$0200, R4                      ; 5B6F   037C 0200
        BLT     L_5B7A                          ; 5B71   0205 0007

        PSHR    R4                              ; 5B73   0274
        MVII    #$0007, R0                      ; 5B74   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 5B76   0004 0114 0338

        PULR    R4                              ; 5B79   02B4
L_5B7A:
        ADDI    #$0016, R4                      ; 5B7A   02FC 0016
        MVII    #$0005, R3                      ; 5B7C   02BB 0005

        JSR     R5,     X_PRINT_R5              ; 5B7E   0004 0118 007B
        STRING  "start"                         ; 5B81  
        DECLE   $0000                           ; 5B86   0000

        PULR    R7                              ; 5B87   02B7

L_5B88:
        PSHR    R4                              ; 5B88   0274
        ADDI    #$0002, R4                      ; 5B89   02FC 0002
        MVII    #$0005, R3                      ; 5B8B   02BB 0005

        JSR     R5,     X_PRINT_R5              ; 5B8D   0004 0118 007B
        STRING  "finish"                        ; 5B90  
        DECLE   $0000                           ; 5B96   0000

        PULR    R4                              ; 5B97   02B4
        ADDI    #$0014, R4                      ; 5B98   02FC 0014
        CMPI    #$02F0, R4                      ; 5B9A   037C 02F0
        BGE     L_58C9                          ; 5B9C   022D 02D4

        MVII    #$0008, R0                      ; 5B9E   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5BA0   0004 0114 0338

        PULR    R7                              ; 5BA3   02B7

L_5BA4:
        PSHR    R5                              ; 5BA4   0275

        JSR     R5,     L_697F                  ; 5BA5   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5BA8   0240 0020
        SDBD                                    ; 5BAA   0001
        MVII    #$3800, R4                      ; 5BAB   02BC 0000 0038
        SDBD                                    ; 5BAE   0001
        MVII    #$57D5, R2                      ; 5BAF   02BA 00D5 0057
        MVII    #$00F0, R0                      ; 5BB2   02B8 00F0

        JSR     R5,     L_6999                  ; 5BB4   0004 0168 0199
        JSR     R5,     L_697F                  ; 5BB7   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5BBA   0240 0020
        SDBD                                    ; 5BBC   0001
        MVII    #$38C0, R4                      ; 5BBD   02BC 00C0 0038
        SDBD                                    ; 5BC0   0001
        MVII    #$5895, R2                      ; 5BC1   02BA 0095 0058
        MVII    #$00C0, R0                      ; 5BC4   02B8 00C0

        JSR     R5,     L_6999                  ; 5BC6   0004 0168 0199
        JSR     R5,     L_55E8                  ; 5BC9   0004 0154 01E8
        JSR     R5,     L_696E                  ; 5BCC   0004 0168 016E

        PULR    R7                              ; 5BCF   02B7

        PSHR    R5                              ; 5BD0   0275
L_5BD1:
        MVI     G_0167, R1                      ; 5BD1   0281 0167
        MVI     G_0168, R2                      ; 5BD3   0282 0168
        INCR    R1                              ; 5BD5   0009
        MVO     R1,     G_0167                  ; 5BD6   0241 0167
        CMPR    R2,     R1                      ; 5BD8   0151
        BLT     L_5BE3                          ; 5BD9   0205 0008

        CLRR    R1                              ; 5BDB   01C9
        MVO     R1,     G_0167                  ; 5BDC   0241 0167
        MVI     G_015D, R0                      ; 5BDE   0280 015D
        INCR    R0                              ; 5BE0   0008
        MVO     R0,     G_015D                  ; 5BE1   0240 015D
L_5BE3:
        MVII    #$0161, R4                      ; 5BE3   02BC 0161
        MVII    #$0005, R0                      ; 5BE5   02B8 0005

        JSR     R5,     X_FILL_ZERO             ; 5BE7   0004 0114 0338

        MVII    #$016E, R4                      ; 5BEA   02BC 016E
        MVII    #$0016, R0                      ; 5BEC   02B8 0016

        JSR     R5,     X_FILL_ZERO             ; 5BEE   0004 0114 0338

        MVII    #$031D, R4                      ; 5BF1   02BC 031D
        MVII    #$0040, R0                      ; 5BF3   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5BF5   0004 0114 0338

        MVII    #$0169, R4                      ; 5BF8   02BC 0169
        MVII    #$0003, R0                      ; 5BFA   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; 5BFC   0004 0114 0338

        CLRR    R0                              ; 5BFF   01C0
        MVO     R0,     G_01C1                  ; 5C00   0240 01C1
        SDBD                                    ; 5C02   0001
        MVII    #$5024, R1                      ; 5C03   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 5C06   0004 0118 0038
        JSR     R5,     L_5CBD                  ; 5C09   0004 015C 00BD

        EIS                                     ; 5C0C   0002
        MVII    #$0265, R4                      ; 5C0D   02BC 0265
        MVI     G_015D, R0                      ; 5C0F   0280 015D
        CMPI    #$0003, R0                      ; 5C11   0378 0003
        BGT     L_5C41                          ; 5C13   020E 002C

        JSR     R5,     L_5C6F                  ; 5C15   0004 015C 006F

        SDBD                                    ; 5C18   0001
        MVII    #$0901, R0                      ; 5C19   02B8 0001 0009
        MVO     R0,     .BTAB.AF                ; 5C1C   0240 02AF
        SDBD                                    ; 5C1E   0001
        MVII    #$08F9, R0                      ; 5C1F   02B8 00F9 0008
        MVO     R0,     .BTAB.AB                ; 5C22   0240 02AB

        JSR     R5,     L_6134                  ; 5C24   0004 0160 0134

        SDBD                                    ; 5C27   0001
        MVII    #$50B0, R0                      ; 5C28   02B8 00B0 0050
        MVO     R0,     G_035D                  ; 5C2B   0240 035D
        MVI     G_0168, R1                      ; 5C2D   0281 0168
        MVII    #$0001, R1                      ; 5C2F   02B9 0001
        MVO     R1,     G_032B                  ; 5C31   0241 032B
        MVI     G_0167, R1                      ; 5C33   0281 0167
        ADD     G_0325, R1                      ; 5C35   02C1 0325
        MVO     R1,     G_0325                  ; 5C37   0241 0325
        MVII    #$01A6, R1                      ; 5C39   02B9 01A6
        ADD     G_0167, R1                      ; 5C3B   02C1 0167
        MVI@    R1,     R1                      ; 5C3D   0289
        MVO     R1,     G_016D                  ; 5C3E   0241 016D
        PULR    R7                              ; 5C40   02B7

L_5C41:
        SDBD                                    ; 5C41   0001
        MVII    #$50BA, R0                      ; 5C42   02B8 00BA 0050
        MVO     R0,     G_035D                  ; 5C45   0240 035D
        MVII    #$0002, R3                      ; 5C47   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 5C49   0004 0118 007B
        STRING  "FINAL"                         ; 5C4C  
        DECLE   $0000                           ; 5C51   0000

        MOVR    R7,     R0                      ; 5C52   00B8
        MVII    #$0186, R5                      ; 5C53   02BD 0186
L_5C55:
        SDBD                                    ; 5C55   0001
        MVI@    R5,     R1                      ; 5C56   02A9
        TSTR    R1                              ; 5C57   0089
        BEQ     L_5C5F                          ; 5C58   0204 0005

        CMPR    R0,     R1                      ; 5C5A   0141
        BC      L_5C5F                          ; 5C5B   0201 0002

        MOVR    R1,     R0                      ; 5C5D   0088
        MOVR    R5,     R3                      ; 5C5E   00AB
L_5C5F:
        CMPI    #$0192, R5                      ; 5C5F   037D 0192
        BNC     L_5C55                          ; 5C61   0229 000D

        SUBR    R5,     R3                      ; 5C63   012B
        SLL     R3,     1                       ; 5C64   004B
        PSHR    R3                              ; 5C65   0273
        SLL     R3,     2                       ; 5C66   004F
        ADD@    R6,     R3                      ; 5C67   02F3
        ADDI    #$02DC, R3                      ; 5C68   02FB 02DC
        MVII    #$0050, R0                      ; 5C6A   02B8 0050
        MVO@    R0,     R3                      ; 5C6C   0258
        B       L_5C9A                          ; 5C6D   0200 002B

L_5C6F:
        PSHR    R5                              ; 5C6F   0275
        MVII    #$0002, R3                      ; 5C70   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 5C72   0004 0118 007B
        STRING  "Heat #"                        ; 5C75  
        DECLE   $0000                           ; 5C7B   0000

        MVI     G_015D, R0                      ; 5C7C   0280 015D
        MVII    #$0001, R1                      ; 5C7E   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5C80   0004 0118 00C5

        MVII    #$0283, R4                      ; 5C83   02BC 0283
        MVI     G_0167, R3                      ; 5C85   0283 0167
        INCR    R3                              ; 5C87   000B
        PSHR    R3                              ; 5C88   0273

        JSR     R5,     X_PRINT_R5              ; 5C89   0004 0118 007B
        STRING  "Skier #"                       ; 5C8C  
        DECLE   $0000                           ; 5C93   0000

        PULR    R0                              ; 5C94   02B0
        MVII    #$0001, R1                      ; 5C95   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5C97   0004 0118 00C5

L_5C9A:
        MVII    #$0279, R4                      ; 5C9A   02BC 0279
        MVII    #$0001, R3                      ; 5C9C   02BB 0001
L_5C9E:
        SDBD                                    ; 5C9E   0001
        MVII    #$06A0, R0                      ; 5C9F   02B8 00A0 0006
        XORR    R3,     R0                      ; 5CA2   01D8
        MVO@    R0,     R4                      ; 5CA3   0260
        ADDI    #$0004, R4                      ; 5CA4   02FC 0004
        MVII    #$0070, R0                      ; 5CA6   02B8 0070
        MVO@    R0,     R4                      ; 5CA8   0260
        SUBI    #$0004, R4                      ; 5CA9   033C 0004
        MOVR    R3,     R2                      ; 5CAB   009A
        SLL     R2,     1                       ; 5CAC   004A
        MVII    #$0184, R5                      ; 5CAD   02BD 0184
        ADDR    R2,     R5                      ; 5CAF   00D5
        SDBD                                    ; 5CB0   0001
        MVI@    R5,     R1                      ; 5CB1   02A9

        JSR     R5,     L_65A2                  ; 5CB2   0004 0164 01A2

        ADDI    #$000E, R4                      ; 5CB5   02FC 000E
        INCR    R3                              ; 5CB7   000B
        CMP     G_0168, R3                      ; 5CB8   0343 0168
        BLE     L_5C9E                          ; 5CBA   0226 001D
        PULR    R7                              ; 5CBC   02B7

L_5CBD:
        PSHR    R5                              ; 5CBD   0275
        EIS                                     ; 5CBE   0002

        JSR     R5,     L_697F                  ; 5CBF   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5CC2   0240 0020
        SDBD                                    ; 5CC4   0001
        MVII    #$3800, R4                      ; 5CC5   02BC 0000 0038
        SDBD                                    ; 5CC8   0001
        MVII    #$5D88, R2                      ; 5CC9   02BA 0088 005D
        MVII    #$00F0, R0                      ; 5CCC   02B8 00F0

        JSR     R5,     L_6999                  ; 5CCE   0004 0168 0199
        JSR     R5,     L_697F                  ; 5CD1   0004 0168 017F

        MVO     R0,     .STIC.VIDEN             ; 5CD4   0240 0020
        SDBD                                    ; 5CD6   0001
        MVII    #$38C0, R4                      ; 5CD7   02BC 00C0 0038
        SDBD                                    ; 5CDA   0001
        MVII    #$5E48, R2                      ; 5CDB   02BA 0048 005E
        MVII    #$00C0, R0                      ; 5CDE   02B8 00C0

        JSR     R5,     L_6999                  ; 5CE0   0004 0168 0199
        JSR     R5,     L_697F                  ; 5CE3   0004 0168 017F

        MVII    #$0007, R1                      ; 5CE6   02B9 0007
        MVII    #$0001, R0                      ; 5CE8   02B8 0001
        MVO     R0,     G_0106                  ; 5CEA   0240 0106
        MVII    #$0028, R5                      ; 5CEC   02BD 0028
        MVO@    R1,     R5                      ; 5CEE   0269
        MVO@    R0,     R5                      ; 5CEF   0268
        MVO@    R1,     R5                      ; 5CF0   0269
        MVO@    R0,     R5                      ; 5CF1   0268
        MVO@    R0,     R5                      ; 5CF2   0268
        CLRR    R1                              ; 5CF3   01C9
        MVO     R1,     .STIC.VDLY              ; 5CF4   0241 0031
        MVO     R1,     .STIC.HDLY              ; 5CF6   0241 0030
        MVII    #$0002, R0                      ; 5CF8   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 5CFA   0240 0032
        MVO     R0,     .STIC.VIDEN             ; 5CFC   0240 0020

        JSR     R5,     L_696E                  ; 5CFE   0004 0168 016E

        MVII    #$003C, R0                      ; 5D01   02B8 003C
        MVII    #$0200, R4                      ; 5D03   02BC 0200
        MVII    #$02F9, R1                      ; 5D05   02B9 02F9

        JSR     R5,     X_FILL_MEM              ; 5D07   0004 0114 0341

        MVII    #$0214, R4                      ; 5D0A   02BC 0214
        SDBD                                    ; 5D0C   0001
        MVII    #$5D49, R5                      ; 5D0D   02BD 0049 005D
        SDBD                                    ; 5D10   0001
        MVII    #$0801, R3                      ; 5D11   02BB 0001 0008
L_5D14:
        MVI@    R5,     R1                      ; 5D14   02A9
        MOVR    R1,     R2                      ; 5D15   008A
        ANDI    #$000F, R1                      ; 5D16   03B9 000F
        CMPI    #$0001, R1                      ; 5D18   0379 0001
        BEQ     L_5D26                          ; 5D1A   0204 000A

        TSTR    R1                              ; 5D1C   0089
        BEQ     L_5D29                          ; 5D1D   0204 000A

        ADDI    #$0020, R1                      ; 5D1F   02F9 0020
        SLL     R1,     2                       ; 5D21   004D
        SLL     R1,     1                       ; 5D22   0049
        XORR    R3,     R1                      ; 5D23   01D9
        B       L_5D2A                          ; 5D24   0200 0004

L_5D26:
        MVII    #$02F9, R1                      ; 5D26   02B9 02F9
        INCR    R7                              ; 5D28   000F

L_5D29:
        CLRR    R1                              ; 5D29   01C9
L_5D2A:
        MVO@    R1,     R4                      ; 5D2A   0261
        SLR     R2,     2                       ; 5D2B   0066
        SLR     R2,     2                       ; 5D2C   0066
        CMPI    #$0001, R2                      ; 5D2D   037A 0001
        BEQ     L_5D3B                          ; 5D2F   0204 000A

        TSTR    R2                              ; 5D31   0092
        BEQ     L_5D3E                          ; 5D32   0204 000A

        ADDI    #$0020, R2                      ; 5D34   02FA 0020
        SLL     R2,     2                       ; 5D36   004E
        SLL     R2,     1                       ; 5D37   004A
        XORR    R3,     R2                      ; 5D38   01DA
        B       L_5D3F                          ; 5D39   0200 0004

L_5D3B:
        MVII    #$02F9, R2                      ; 5D3B   02BA 02F9
        INCR    R7                              ; 5D3D   000F

L_5D3E:
        CLRR    R2                              ; 5D3E   01D2
L_5D3F:
        MVO@    R2,     R4                      ; 5D3F   0262
        CMPI    #$0284, R4                      ; 5D40   037C 0284
        BNEQ    L_5D14                          ; 5D42   022C 002F
        PULR    R7                              ; 5D44   02B7

        CLRR    R1                              ; 5D45   01C9
        J       .EXEC.94C                       ; 5D46   0004 0318 014C

        DECR    R1                              ; 5D49   0011
        DECR    R6                              ; 5D4A   0016
        DECR    R1                              ; 5D4B   0011
        DECR    R1                              ; 5D4C   0011
        MOVR    R3,     R0                      ; 5D4D   0098
        MOVR    R4,     R7                      ; 5D4E   00A7

        DECLE   $001B,  $0011,  $0011,  $0011   ; 5D4F   001B 0011 0011 0011
        DECLE   $0074,  $0050,  $0061,  $0098   ; 5D53   0074 0050 0061 0098
        DECLE   $00CD,  $0000,  $00B0,  $0011   ; 5D57   00CD 0000 00B0 0011
        DECLE   $0011,  $0041,  $000C,  $0000   ; 5D5B   0011 0041 000C 0000
        DECLE   $0007,  $00EC,  $000D,  $0000   ; 5D5F   0007 00EC 000D 0000
        DECLE   $0000,  $0057,  $0098,  $0007   ; 5D63   0000 0057 0098 0007
        DECLE   $0000,  $00D0,  $00FC,  $0000   ; 5D67   0000 00D0 00FC 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5D6B   0000 0000 0000 00C0
        DECLE   $00D0,  $0000,  $00C0,  $000F   ; 5D6F   00D0 0000 00C0 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D73   0000 0000 0000 0000
        DECLE   $00FD,  $000F,  $000C,  $0000   ; 5D77   00FD 000F 000C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7B   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0000,  $0000   ; 5D7F   0000 00C0 0000 0000
        DECLE   $0000,  $0000                   ; 5D83   0000 0000
.GRAM_INIT_5D85:
        DECLE   $0001           ; 5D85  # of GRAM cards to init
        DECLE   $0003,  $0070   ; 5D86  #00-00:  GROM #01-01 ----

.GFX_LIST_5D88:
        DECLE   $0008,  $0008,  $000D,  $001D   ; 5D88   0008 0008 000D 001D
        DECLE   $002E,  $001D,  $002D,  $005B   ; 5D8C   002E 001D 002D 005B
        DECLE   $0001,  $0003,  $0004,  $0001   ; 5D90   0001 0003 0004 0001
        DECLE   $0003,  $0004,  $000B,  $0005   ; 5D94   0003 0004 000B 0005
        DECLE   $003F,  $005B,  $0037,  $007E   ; 5D98   003F 005B 0037 007E
        DECLE   $00DD,  $003F,  $0076,  $00DD   ; 5D9C   00DD 003F 0076 00DD
        DECLE   $00F4,  $007A,  $00FC,  $00FE   ; 5DA0   00F4 007A 00FC 00FE
        DECLE   $00FA,  $00FC,  $00F6,  $00BB   ; 5DA4   00FA 00FC 00F6 00BB
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA8   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5DAC   0000 0000

        TSTR    R0                              ; 5DAE   0080
        ADDR    R0,     R0                      ; 5DAF   00C0
        ADCR    R7                              ; 5DB0   002F

        SARC    R3,     2                       ; 5DB1   007F
L_5DB2:
        MOVR    R7,     R3                      ; 5DB2   00BB
        DECLE   $0077,  $005F,  $00B7,  $006F   ; 5DB3   0077 005F 00B7 006F
        DECLE   $008A,  $0000,  $0000,  $0000   ; 5DB7   008A 0000 0000 0000
        DECLE   $0002,  $0002,  $0001,  $0003   ; 5DBB   0002 0002 0001 0003
        DECLE   $0007,  $0003,  $0005,  $000B   ; 5DBF   0007 0003 0005 000B
        DECLE   $001F                           ; 5DC3   001F

        INCR    R6                              ; 5DC4   000E
        DECR    R5                              ; 5DC5   0015
        ADCR    R7                              ; 5DC6   002F

        RRC     R3,     2                       ; 5DC7   0077
L_5DC8:
        ADDR    R0,     R0                      ; 5DC8   00C0
        DECLE   $00C0,  $00E0,  $00E0,  $00F0   ; 5DC9   00C0 00E0 00E0 00F0
        DECLE   $00F8,  $00F4,  $00F8,  $00FC   ; 5DCD   00F8 00F4 00F8 00FC
        DECLE   $00FE,  $00F9,  $00FC,  $00FE   ; 5DD1   00FE 00F9 00FC 00FE
        DECLE   $00FD,  $006E,  $0033,  $0000   ; 5DD5   00FD 006E 0033 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5DD9   0000 0000 0001 0001
        DECLE   $0002,  $0007,  $000D,  $0080   ; 5DDD   0002 0007 000D 0080
        DECLE   $00C0,  $00E0,  $0090,  $0040   ; 5DE1   00C0 00E0 0090 0040
        DECLE   $00A0,  $00C0,  $0020,  $00FC   ; 5DE5   00A0 00C0 0020 00FC
        DECLE   $000F,  $0003,  $0000,  $0030   ; 5DE9   000F 0003 0000 0030
        DECLE   $0040,  $0086,  $0001,  $0000   ; 5DED   0040 0086 0001 0000
        DECLE   $0080,  $00F8,  $00DE,  $007B   ; 5DF1   0080 00F8 00DE 007B
        DECLE   $001C,  $0006,  $0001,  $0000   ; 5DF5   001C 0006 0001 0000
        DECLE   $0000,  $00E0,  $0038,  $00CC   ; 5DF9   0000 00E0 0038 00CC
        DECLE   $0062,  $0011,  $0004,  $0000   ; 5DFD   0062 0011 0004 0000
        DECLE   $0000,  $0000,  $0001,  $0006   ; 5E01   0000 0000 0001 0006
        DECLE   $0008,  $0030,  $0041,  $0000   ; 5E05   0008 0030 0041 0000
        DECLE   $0001,  $00C6,  $0038,  $0000   ; 5E09   0001 00C6 0038 0000
        DECLE   $0000,  $0045,  $0018,  $0000   ; 5E0D   0000 0045 0018 0000
        DECLE   $0007,  $009B,  $0060,  $0000   ; 5E11   0007 009B 0060 0000
        DECLE   $000E,  $0051,  $0080,  $0000   ; 5E15   000E 0051 0080 0000
        DECLE   $0005,  $0010,  $0000,  $0000   ; 5E19   0005 0010 0000 0000
        DECLE   $00A0,  $0004,  $0000,  $0000   ; 5E1D   00A0 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5E25   0000 0000 0000 0080
        DECLE   $0040,  $0000,  $0010,  $0084   ; 5E29   0040 0000 0010 0084
        DECLE   $0062,  $0011,  $0004,  $0001   ; 5E2D   0062 0011 0004 0001
        DECLE   $0002,  $0000                   ; 5E31   0002 0000

        COMR    R0                              ; 5E33   0018
        NEGR    R1                              ; 5E34   0021
        SWAP    R2,     2                       ; 5E35   0046
        MOVR    R3,     R0                      ; 5E36   0098
        NEGR    R0                              ; 5E37   0020
        TSTR    R0                              ; 5E38   0080
        SLR     R0,     1                       ; 5E39   0060
        DECR    R0                              ; 5E3A   0010

        JSRD    R4,     .EXEC.008               ; 5E3B   0004 0012 0008
        DECLE   $0004,  $0001,  $0001,  $0006   ; 5E3E   0004 0001 0001 0006
        DECLE   $0018,  $0040,  $0008,  $0010   ; 5E42   0018 0040 0008 0010
        DECLE   $0020,  $0080,  $0000,  $0006   ; 5E46   0020 0080 0000 0006
        DECLE   $0009,  $0060,  $00B0,  $0000   ; 5E4A   0009 0060 00B0 0000
        DECLE   $0006,  $0011,  $0000,  $0006   ; 5E4E   0006 0011 0000 0006
        DECLE   $0008,  $0060,  $00B0,  $0000   ; 5E52   0008 0060 00B0 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5E56   0000 0000 0000 0040
        DECLE   $0010,  $0000,  $0010,  $0002   ; 5E5A   0010 0000 0010 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E62   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 5E66   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001B   ; 5E6A   0000 0000 0008 001B
        DECLE   $001D,  $0009,  $0000,  $0000   ; 5E6E   001D 0009 0000 0000
        DECLE   $0000,  $0000,  $0010,  $00D8   ; 5E72   0000 0000 0010 00D8
        DECLE   $00B8,  $0090,  $00FF,  $0000   ; 5E76   00B8 0090 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5E7E   0000 0000

        INCR    R7                              ; 5E80   000F
        INCR    R7                              ; 5E81   000F
L_5E82:
        INCR    R7                              ; 5E82   000F

L_5E83:
        INCR    R1                              ; 5E83   0009
L_5E84:
        INCR    R1                              ; 5E84   0009
        INCR    R1                              ; 5E85   0009
        INCR    R1                              ; 5E86   0009
        INCR    R1                              ; 5E87   0009
        ADDR    R6,     R0                      ; 5E88   00F0
        ADDR    R6,     R0                      ; 5E89   00F0
        ADDR    R6,     R0                      ; 5E8A   00F0
        MOVR    R2,     R0                      ; 5E8B   0090
        MOVR    R2,     R0                      ; 5E8C   0090
        MOVR    R2,     R0                      ; 5E8D   0090
        MOVR    R2,     R0                      ; 5E8E   0090
        MOVR    R2,     R0                      ; 5E8F   0090
        NEGR    R0                              ; 5E90   0020
        RRC     R0,     1                       ; 5E91   0070
        ADDR    R7,     R0                      ; 5E92   00F8
        SARC    R0,     1                       ; 5E93   0078
        RRC     R0,     1                       ; 5E94   0070
        RLC     R0,     1                       ; 5E95   0050
        RLC     R0,     2                       ; 5E96   0054
        INCR    R7                              ; 5E97   000F

        DECLE   $001F                           ; 5E98   001F
L_5E99:
        INCR    R6                              ; 5E99   000E
        DECLE   $002E,  $007A,  $00FA,  $0070   ; 5E9A   002E 007A 00FA 0070
        DECLE   $0050,  $0050,  $0000,  $0000   ; 5E9E   0050 0050 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FE   ; 5EA6   0000 0000 00FF 00FE
        DECLE   $00F8,  $00E0,  $00C0,  $0080   ; 5EAA   00F8 00E0 00C0 0080
        DECLE   $0000,  $0000,  $007F,  $003F   ; 5EAE   0000 0000 007F 003F
        DECLE   $001F,  $000F,  $0003,  $0001   ; 5EB2   001F 000F 0003 0001
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5EB6   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00CF   ; 5EBA   00FF 00FF 00FF 00CF
        DECLE   $0093,  $0041,  $003E,  $001C   ; 5EBE   0093 0041 003E 001C
        DECLE   $0008,  $0010,  $0040,  $0080   ; 5EC2   0008 0010 0040 0080
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5EC6   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00F0   ; 5ECA   00FF 00FF 00FC 00F0
        DECLE   $0080,  $0000,  $00F0,  $00C0   ; 5ECE   0080 0000 00F0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5ED2   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $0001   ; 5ED6   0000 0000 0007 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5EDE   0000 0000 00FF 00FF
        DECLE   $007F,  $003F,  $001F,  $001F   ; 5EE2   007F 003F 001F 001F
        DECLE   $0007,  $0001,  $0001,  $0002   ; 5EE6   0007 0001 0001 0002
        DECLE   $0000,  $0004,  $0010,  $0040   ; 5EEA   0000 0004 0010 0040
        DECLE   $0000                           ; 5EEE   0000

        TSTR    R0                              ; 5EEF   0080

        JSR     R4,     X_RESET                 ; 5EF0   0004 0010 0000
        DECLE   $0020,  $0000,  $0080,  $0000   ; 5EF3   0020 0000 0080 0000
        DECLE   $0000,  $0020,  $0008,  $0000   ; 5EF7   0000 0020 0008 0000
        DECLE   $0004,  $0000,  $0001,  $0000   ; 5EFB   0004 0000 0001 0000
        DECLE   $0000,  $0040,  $0012,  $0000   ; 5EFF   0000 0040 0012 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F03   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0042,  $0099   ; 5F07   0000 003C 0042 0099
        DECLE   $00A1,  $00A1,  $0099,  $0042   ; 5F0B   00A1 00A1 0099 0042
        DECLE   $003C,  $0038,  $0038,  $0038   ; 5F0F   003C 0038 0038 0038
        DECLE   $0039,  $0039,  $0039,  $0039   ; 5F13   0039 0039 0039 0039
        DECLE   $0000,  $0000,  $000D,  $00CC   ; 5F17   0000 0000 000D 00CC
        DECLE   $00EC,  $00FC,  $00BC,  $0098   ; 5F1B   00EC 00FC 00BC 0098
        DECLE   $0000,  $00C0,  $00E0,  $00CC   ; 5F1F   0000 00C0 00E0 00CC
        DECLE   $00CC,  $00C6,  $00C6,  $0073   ; 5F23   00CC 00C6 00C6 0073
        DECLE   $0000,  $0020,  $0020,  $0040   ; 5F27   0000 0020 0020 0040
        DECLE   $0040,  $0080,  $0080,  $0000   ; 5F2B   0040 0080 0080 0000
        DECLE   $0000                           ; 5F2F   0000

        MVO     R5,     G_0165                  ; 5F30   0245 0165
        SUBI    #$0008, R1                      ; 5F32   0339 0008
        PSHR    R5                              ; 5F34   0275
L_5F35:
        MVI     G_01AE, R2                      ; 5F35   0282 01AE
        TSTR    R2                              ; 5F37   0092
        BNEQ    L_5FB5                          ; 5F38   020C 007B

        MVI     G_032D, R2                      ; 5F3A   0282 032D
        SDBD                                    ; 5F3C   0001
        MVII    #$FFDF, R0                      ; 5F3D   02B8 00DF 00FF
        MOVR    R1,     R4                      ; 5F40   008C
        MVI@    R1,     R5                      ; 5F41   028D
        ANDR    R0,     R5                      ; 5F42   0185
        MVO@    R5,     R1                      ; 5F43   024D
        ANDR    R0,     R2                      ; 5F44   0182
        MVO     R2,     G_032D                  ; 5F45   0242 032D
        ADDI    #$0002, R4                      ; 5F47   02FC 0002
        MVI@    R4,     R0                      ; 5F49   02A0
        SWAP    R0,     1                       ; 5F4A   0040
        ANDI    #$00FF, R0                      ; 5F4B   03B8 00FF
        MVI@    R4,     R2                      ; 5F4D   02A2
        SWAP    R2,     1                       ; 5F4E   0042
        ANDI    #$00FF, R2                      ; 5F4F   03BA 00FF
        MVII    #$0004, R3                      ; 5F51   02BB 0004
        ADDR    R3,     R2                      ; 5F53   00DA
        CLRR    R4                              ; 5F54   01E4
        ADD     G_0165, R4                      ; 5F55   02C4 0165
        BEQ     L_5F5A                          ; 5F57   0204 0001

        ADDR    R3,     R2                      ; 5F59   00DA
L_5F5A:
        ADDR    R3,     R0                      ; 5F5A   00D8
        SAR     R2,     2                       ; 5F5B   006E
        SAR     R2,     1                       ; 5F5C   006A
        SAR     R0,     2                       ; 5F5D   006C
        SAR     R0,     1                       ; 5F5E   0068
        DECR    R0                              ; 5F5F   0010
        DECR    R2                              ; 5F60   0012
        SLL     R2,     2                       ; 5F61   004E
        PSHR    R2                              ; 5F62   0272
        SLL     R2,     2                       ; 5F63   004E
        ADD@    R6,     R2                      ; 5F64   02F2
        ADDR    R0,     R2                      ; 5F65   00C2
        ADDI    #$0200, R2                      ; 5F66   02FA 0200
        MVI@    R2,     R3                      ; 5F68   0293
        TSTR    R4                              ; 5F69   00A4
        BNEQ    L_6013                          ; 5F6A   020C 00A7

        MOVR    R3,     R0                      ; 5F6C   0098
        BEQ     L_5FB5                          ; 5F6D   0204 0046

        ANDI    #$01F8, R0                      ; 5F6F   03B8 01F8
        CMPI    #$00F8, R0                      ; 5F71   0378 00F8
        BEQ     L_5FB9                          ; 5F73   0204 0044

        CMPI    #$0100, R0                      ; 5F75   0378 0100
        BEQ     L_5FB9                          ; 5F77   0204 0040

        MOVR    R2,     R4                      ; 5F79   0094
        CLRR    R2                              ; 5F7A   01D2
        CMPI    #$00D8, R0                      ; 5F7B   0378 00D8
        BEQ     L_5FC7                          ; 5F7D   0204 0048

        CMPI    #$00E0, R0                      ; 5F7F   0378 00E0
        BEQ     L_5FB5                          ; 5F81   0204 0032

        CMPI    #$00E8, R0                      ; 5F83   0378 00E8
        BEQ     L_5FB5                          ; 5F85   0204 002E

        CMPI    #$00F0, R0                      ; 5F87   0378 00F0
        BEQ     L_5FB6                          ; 5F89   0204 002B

        MOVR    R3,     R0                      ; 5F8B   0098
        SDBD                                    ; 5F8C   0001
        ANDI    #$1007, R0                      ; 5F8D   03B8 0007 0010
        CMPI    #$0005, R0                      ; 5F90   0378 0005
        BEQ     L_5FF6                          ; 5F92   0204 0062

        SDBD                                    ; 5F94   0001
        CMPI    #$1006, R0                      ; 5F95   0378 0006 0010
        BEQ     L_5FF6                          ; 5F98   0204 005C

        MOVR    R3,     R0                      ; 5F9A   0098
        ANDI    #$01F8, R0                      ; 5F9B   03B8 01F8
        MOVR    R3,     R0                      ; 5F9D   0098
        SDBD                                    ; 5F9E   0001
        ANDI    #$1007, R0                      ; 5F9F   03B8 0007 0010
        SDBD                                    ; 5FA2   0001
        CMPI    #$1006, R0                      ; 5FA3   0378 0006 0010
        BEQ     L_5FAC                          ; 5FA6   0204 0004

        SLLC    R3,     2                       ; 5FA8   005F
        SLLC    R3,     2                       ; 5FA9   005F
        BOV     L_5FB5                          ; 5FAA   0202 0009

L_5FAC:
        XORI    #$0020, R5                      ; 5FAC   03FD 0020
        MVO@    R5,     R1                      ; 5FAE   024D
        MVI     G_032D, R0                      ; 5FAF   0280 032D
        XORI    #$0020, R0                      ; 5FB1   03F8 0020
        MVO     R0,     G_032D                  ; 5FB3   0240 032D
L_5FB5:
        PULR    R7                              ; 5FB5   02B7

L_5FB6:
        JSR     R5,     L_6582                  ; 5FB6   0004 0164 0182

L_5FB9:
        SUBI    #$0018, R3                      ; 5FB9   033B 0018
        MVO@    R3,     R2                      ; 5FBB   0253
        MVI     G_0169, R0                      ; 5FBC   0280 0169

        JSR     R5,     X_EXT_SIGN_LO           ; 5FBE   0004 0114 0268

        SAR     R0,     1                       ; 5FC1   0068
        MVO     R0,     G_0169                  ; 5FC2   0240 0169

        JSR     R5,     L_65DE                  ; 5FC4   0004 0164 01DE

L_5FC7:
        SUBI    #$0004, R4                      ; 5FC7   033C 0004
        MVII    #$0004, R1                      ; 5FC9   02B9 0004
L_5FCB:
        MVI@    R4,     R3                      ; 5FCB   02A3
        TSTR    R3                              ; 5FCC   009B
        BMI     L_5FB5                          ; 5FCD   022B 0019
        BEQ     L_5FF0                          ; 5FCF   0204 001F

        PSHR    R3                              ; 5FD1   0273
        SDBD                                    ; 5FD2   0001
        ANDI    #$1007, R3                      ; 5FD3   03BB 0007 0010
        BEQ     L_5FF4                          ; 5FD6   0204 001C

        CMPI    #$0002, R3                      ; 5FD8   037B 0002
        BEQ     L_5FE2                          ; 5FDA   0204 0006

        SDBD                                    ; 5FDC   0001
        CMPI    #$1005, R3                      ; 5FDD   037B 0005 0010
        BNEQ    L_5FEF                          ; 5FE0   020C 000D

L_5FE2:
        PULR    R3                              ; 5FE2   02B3
        SDBD                                    ; 5FE3   0001
        ANDI    #$EFF8, R3                      ; 5FE4   03BB 00F8 00EF
        DECR    R4                              ; 5FE7   0014
        MVO@    R3,     R4                      ; 5FE8   0263
        MVI     G_0161, R0                      ; 5FE9   0280 0161
        INCR    R0                              ; 5FEB   0008
        MVO     R0,     G_0161                  ; 5FEC   0240 0161
        PULR    R7                              ; 5FEE   02B7

L_5FEF:
        PULR    R3                              ; 5FEF   02B3
L_5FF0:
        DECR    R1                              ; 5FF0   0011
        BNEQ    L_5FCB                          ; 5FF1   022C 0027
        PULR    R7                              ; 5FF3   02B7

L_5FF4:
        PULR    R3                              ; 5FF4   02B3
        PULR    R7                              ; 5FF5   02B7

L_5FF6:
        ADDI    #$0014, R4                      ; 5FF6   02FC 0014
        MVI@    R4,     R0                      ; 5FF8   02A0
        SDBD                                    ; 5FF9   0001
        ANDI    #$1007, R0                      ; 5FFA   03B8 0007 0010
        CMPI    #$0005, R0                      ; 5FFD   0378 0005
        BEQ     L_5FAC                          ; 5FFF   0224 0054

        SDBD                                    ; 6001   0001
        CMPI    #$1006, R0                      ; 6002   0378 0006 0010
        BEQ     L_5FAC                          ; 6005   0224 005A

        ADD     G_0163, R2                      ; 6007   02C2 0163
        BNEQ    L_5FB5                          ; 6009   022C 0055

        JSR     R5,     L_65CB                  ; 600B   0004 0164 01CB

        B       L_605B                          ; 600E   0200 004B

L_6010:
        PULR    R3                              ; 6010   02B3
        B       L_5F35                          ; 6011   0220 00DD

L_6013:
        CLRR    R0                              ; 6013   01C0
        MVO     R0,     G_0165                  ; 6014   0240 0165
        SDBD                                    ; 6016   0001
        CMPI    #$1000, R3                      ; 6017   037B 0000 0010
        BGE     L_6026                          ; 601A   020D 000A

        PSHR    R3                              ; 601C   0273
        ANDI    #$0007, R3                      ; 601D   03BB 0007
        CMPI    #$0003, R3                      ; 601F   037B 0003
        PULR    R3                              ; 6021   02B3
        BEQ     L_604E                          ; 6022   0204 002A
        B       L_5F35                          ; 6024   0220 00F0

L_6026:
        PSHR    R3                              ; 6026   0273
        SDBD                                    ; 6027   0001
        ANDI    #$1007, R3                      ; 6028   03BB 0007 0010
        SDBD                                    ; 602B   0001
        CMPI    #$1006, R3                      ; 602C   037B 0006 0010
        PULR    R3                              ; 602F   02B3
        BEQ     L_5F35                          ; 6030   0224 00FC

        PSHR    R3                              ; 6032   0273
        SDBD                                    ; 6033   0001
        ANDI    #$1007, R3                      ; 6034   03BB 0007 0010
        SDBD                                    ; 6037   0001
        CMPI    #$1005, R3                      ; 6038   037B 0005 0010
        PULR    R3                              ; 603B   02B3
        BNEQ    L_604E                          ; 603C   020C 0010

        PSHR    R3                              ; 603E   0273
        ANDI    #$01F8, R3                      ; 603F   03BB 01F8
        CMPI    #$00D8, R3                      ; 6041   037B 00D8
        BGE     L_6010                          ; 6043   022D 0034

        CMPI    #$00A0, R3                      ; 6045   037B 00A0
        BGE     L_60FF                          ; 6047   020D 00B6

        CMPI    #$0090, R3                      ; 6049   037B 0090
        BGE     L_6094                          ; 604B   020D 0047

        PULR    R3                              ; 604D   02B3
L_604E:
        MVI     G_0163, R1                      ; 604E   0281 0163
        ADD     G_0164, R1                      ; 6050   02C1 0164
        BNEQ    L_5FB5                          ; 6052   022C 009E

        JSR     R5,     L_65F8                  ; 6054   0004 0164 01F8

L_6057:
        CLRR    R3                              ; 6057   01DB

L_6058:
        JSR     R5,     L_60A6                  ; 6058   0004 0160 00A6

L_605B:
        MVII    #$0325, R3                      ; 605B   02BB 0325
        SDBD                                    ; 605D   0001
        MVII    #$FEFC, R0                      ; 605E   02B8 00FC 00FE
        MVI     G_0163, R1                      ; 6061   0281 0163
        TSTR    R1                              ; 6063   0089
        BNEQ    L_5FB5                          ; 6064   022C 00B0

        MVO     R1,     G_0333                  ; 6066   0241 0333
        MVO     R0,     G_0163                  ; 6068   0240 0163
        ADD     G_0164, R1                      ; 606A   02C1 0164
        BNEQ    L_6078                          ; 606C   020C 000A

        MVI     G_0325, R1                      ; 606E   0281 0325
        MVO     R1,     G_0335                  ; 6070   0241 0335
        SDBD                                    ; 6072   0001
        XORI    #$1000, R1                      ; 6073   03F9 0000 0010
        MVO     R1,     G_0325                  ; 6076   0241 0325
L_6078:
        MVI     G_032D, R1                      ; 6078   0281 032D
        SDBD                                    ; 607A   0001
        ANDI    #$DFFF, R1                      ; 607B   03B9 00FF 00DF
        MVO     R1,     G_032D                  ; 607E   0241 032D
        MVII    #$0007, R1                      ; 6080   02B9 0007
        MVO     R1,     G_0332                  ; 6082   0241 0332
        MVO     R0,     G_0339                  ; 6084   0240 0339
        MVII    #$0080, R0                      ; 6086   02B8 0080
        MVO     R0,     G_033A                  ; 6088   0240 033A
        SLL     R1,     1                       ; 608A   0049
        MVO     R1,     G_033B                  ; 608B   0241 033B
        SLL     R0,     2                       ; 608D   004C
        SLL     R0,     1                       ; 608E   0048
        ADD     G_0328, R0                      ; 608F   02C0 0328
        MVO     R0,     G_0328                  ; 6091   0240 0328
        PULR    R7                              ; 6093   02B7

L_6094:
        PULR    R3                              ; 6094   02B3
        MVII    #$0003, R1                      ; 6095   02B9 0003
        MVO     R1,     G_01B7                  ; 6097   0241 01B7
        PULR    R7                              ; 6099   02B7

        DECLE   $0070,  $0069,  $002B,  $000E   ; 609A   0070 0069 002B 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 609E   0000 0000 0000 0000
        DECLE   $0000                           ; 60A2   0000

        CLRC                                    ; 60A3   0006
        NEGR    R4                              ; 60A4   0024
        SLR     R2,     1                       ; 60A5   0062
L_60A6:
        PSHR    R5                              ; 60A6   0275
        TSTR    R3                              ; 60A7   009B
        BNEQ    L_60BF                          ; 60A8   020C 0015

        MVI     G_0164, R0                      ; 60AA   0280 0164
        TSTR    R0                              ; 60AC   0080
        BNEQ    L_5FB5                          ; 60AD   022C 00F9

        MVI     G_016C, R0                      ; 60AF   0280 016C
        CMPI    #$000C, R0                      ; 60B1   0378 000C
        BLE     L_60B9                          ; 60B3   0206 0004

        CMPI    #$0024, R0                      ; 60B5   0378 0024
        BLT     L_5FB5                          ; 60B7   0225 0103

L_60B9:
        MVI     G_0169, R0                      ; 60B9   0280 0169
        CMPI    #$0025, R0                      ; 60BB   0378 0025
        BLT     L_5FB5                          ; 60BD   0225 0109

L_60BF:
        MVII    #$0355, R4                      ; 60BF   02BC 0355
        SDBD                                    ; 60C1   0001
        MVII    #$3263, R1                      ; 60C2   02B9 0063 0032
        MVO@    R1,     R4                      ; 60C5   0261
        INCR    R4                              ; 60C6   000C
        MVI     G_0327, R1                      ; 60C7   0281 0327
        SDBD                                    ; 60C9   0001
        SUBI    #$0500, R1                      ; 60CA   0339 0000 0005
        MVI     G_0328, R0                      ; 60CD   0280 0328
        SDBD                                    ; 60CF   0001
        MVII    #$0700, R2                      ; 60D0   02BA 0000 0007
        TSTR    R3                              ; 60D3   009B
        BEQ     L_60F2                          ; 60D4   0204 001C

        MVI     G_016C, R2                      ; 60D6   0282 016C
        SAR     R2,     2                       ; 60D8   006E
        MOVR    R2,     R5                      ; 60D9   0095
        SDBD                                    ; 60DA   0001
        ADDI    #$609A, R2                      ; 60DB   02FA 009A 0060
        MVI@    R2,     R2                      ; 60DE   0292
        MOVR    R2,     R3                      ; 60DF   0093
        ANDI    #$000F, R3                      ; 60E0   03BB 000F
        SLR     R2,     2                       ; 60E2   0066
        SLR     R2,     2                       ; 60E3   0066
        SWAP    R2,     1                       ; 60E4   0042
        SWAP    R3,     1                       ; 60E5   0043
        NEGR    R3                              ; 60E6   0023
        CMPI    #$0009, R5                      ; 60E7   037D 0009
        BLT     L_60F0                          ; 60E9   0205 0005

        NEGR    R3                              ; 60EB   0023
        SDBD                                    ; 60EC   0001
        ADDI    #$0A00, R3                      ; 60ED   02FB 0000 000A
L_60F0:
        NEGR    R2                              ; 60F0   0022
        ADDR    R3,     R1                      ; 60F1   00D9
L_60F2:
        ADDR    R2,     R0                      ; 60F2   00D0
        MVO@    R1,     R4                      ; 60F3   0261
        MVO@    R0,     R4                      ; 60F4   0260
        MVII    #$000F, R0                      ; 60F5   02B8 000F
        TSTR    R3                              ; 60F7   009B
        BEQ     L_60FC                          ; 60F8   0204 0002

        MVII    #$0001, R0                      ; 60FA   02B8 0001
L_60FC:
        MVO     R0,     G_035B                  ; 60FC   0240 035B
        PULR    R7                              ; 60FE   02B7

L_60FF:
        PULR    R3                              ; 60FF   02B3
        MVII    #$0003, R1                      ; 6100   02B9 0003
        MVO     R1,     G_01B8                  ; 6102   0241 01B8
        PULR    R7                              ; 6104   02B7

        MVI     G_0325, R0                      ; 6105   0280 0325
        MVO     R0,     G_0335                  ; 6107   0240 0335
        SDBD                                    ; 6109   0001
        XORI    #$1000, R0                      ; 610A   03F8 0000 0010
        MVO     R0,     G_0325                  ; 610D   0240 0325
        MVI     G_016B, R0                      ; 610F   0280 016B
        CMPI    #$000D, R0                      ; 6111   0378 000D
        BLT     L_611C                          ; 6113   0205 0007

        CMPI    #$0023, R0                      ; 6115   0378 0023
        BGT     L_611C                          ; 6117   020E 0003

        CLRR    R0                              ; 6119   01C0
        MVO     R0,     G_016B                  ; 611A   0240 016B
L_611C:
        ANDI    #$00FE, R0                      ; 611C   03B8 00FE
        MVO     R0,     G_016A                  ; 611E   0240 016A
        CLRR    R0                              ; 6120   01C0
        MVO     R0,     G_0163                  ; 6121   0240 0163
        MVO     R0,     G_0164                  ; 6123   0240 0164
        MOVR    R5,     R7                      ; 6125   00AF

L_6126:
        CLRR    R2                              ; 6126   01D2
        TSTR    R0                              ; 6127   0080
        BMI     L_6131                          ; 6128   020B 0007

        MVII    #$0002, R2                      ; 612A   02BA 0002
        SLR     R0,     2                       ; 612C   0064
        INCR    R0                              ; 612D   0008
        ANDR    R2,     R0                      ; 612E   0190
        SLL     R0,     1                       ; 612F   0048
        SUBR    R0,     R2                      ; 6130   0102
L_6131:
        MVO     R2,     G_0334                  ; 6131   0242 0334
        MOVR    R5,     R7                      ; 6133   00AF

L_6134:
        PSHR    R5                              ; 6134   0275
        MVII    #$0003, R0                      ; 6135   02B8 0003
        SDBD                                    ; 6137   0001
        MVII    #$615A, R1                      ; 6138   02B9 005A 0061
        MVII    #$0325, R2                      ; 613B   02BA 0325

        JSR     R5,     X_INIT_MOBS             ; 613D   0004 0114 02B4

        SDBD                                    ; 6140   0001
        MVII    #$6188, R1                      ; 6141   02B9 0088 0061
        MVII    #$0355, R2                      ; 6144   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 6146   0004 0114 02B2

        CLRR    R1                              ; 6149   01C9
        MVO     R1,     G_0335                  ; 614A   0241 0335
        MVII    #$000C, R0                      ; 614C   02B8 000C
        MVO     R0,     G_011A                  ; 614E   0240 011A
        MVII    #$002C, R0                      ; 6150   02B8 002C
        MVO     R0,     G_016A                  ; 6152   0240 016A
        PULR    R7                              ; 6154   02B7

        PSHR    R5                              ; 6155   0275
        CLRR    R0                              ; 6156   01C0
        MVO     R0,     G_0355                  ; 6157   0240 0355
        PULR    R7                              ; 6159   02B7

        DECLE   $0041,  $001A,  $0096,  $0061   ; 615A   0041 001A 0096 0061
        DECLE   $0000,  $0070,  $0000,  $0044   ; 615E   0000 0070 0000 0044
        DECLE   $0000,  $0000,  $0002,  $0000   ; 6162   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6166   0000 0000 0000 0000
        DECLE   $0053,  $001A,  $00A6,  $0061   ; 616A   0053 001A 00A6 0061
        DECLE   $0000,  $0000,  $0000,  $0000   ; 616E   0000 0000 0000 0000
        DECLE   $0004,  $0001,  $0004,  $0000   ; 6172   0004 0001 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6176   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $009F,  $0061   ; 617A   0000 0000 009F 0061
        DECLE   $0000,  $0000,  $0000,  $0000   ; 617E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6182   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6186   0000 0000 0000 0000
        DECLE   $00AF,  $0061,  $0000,  $0000   ; 618A   00AF 0061 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 618E   0000 0000 0000 0000
        DECLE   $00E0,  $0001,  $0000,  $0000   ; 6192   00E0 0001 0000 0000
        DECLE   $0000,  $0000,  $0031,  $0051   ; 6196   0000 0000 0031 0051
        DECLE   $000D,  $0018,  $0001,  $0034   ; 619A   000D 0018 0001 0034
        DECLE   $005F,  $0000,  $0000,  $0005   ; 619E   005F 0000 0000 0005

        SLR     R1,     1                       ; 61A2   0061

        JSR     R4,     .EXEC.001               ; 61A3   0004 0010 0001
        DECLE   $0000,  $0000,  $0023,  $0051   ; 61A6   0000 0000 0023 0051
        DECLE   $0008,  $0000,  $0001,  $0030   ; 61AA   0008 0000 0001 0030
        DECLE   $005F,  $0000,  $0000,  $0055   ; 61AE   005F 0000 0000 0055
        DECLE   $0061,  $0002,  $0032,  $0000   ; 61B2   0061 0002 0032 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $0000   ; 61BA   0000 0000 007E 0000
        DECLE   $007E,  $0000,  $0000,  $0000   ; 61BE   007E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61C6   0000 0000 0000 0000
        DECLE   $0020,  $0010,  $0028,  $0014   ; 61CA   0020 0010 0028 0014
        DECLE   $000A,  $0004,  $0002,  $0000   ; 61CE   000A 0004 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 61D6   0000 0000 0000 0060
        DECLE   $0030,  $00D8,  $006C,  $0036   ; 61DA   0030 00D8 006C 0036
        DECLE   $001B,  $000C,  $0006,  $0003   ; 61DE   001B 000C 0006 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0030   ; 61E6   0000 0000 0020 0030
        DECLE   $0050,  $0068,  $002C,  $0016   ; 61EA   0050 0068 002C 0016
        DECLE   $001B,  $000D,  $000C,  $0006   ; 61EE   001B 000D 000C 0006
        DECLE   $0002,  $0000,  $0000,  $0000   ; 61F2   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0028   ; 61F6   0000 0000 0008 0028
        DECLE   $002C,  $0034,  $0014,  $0016   ; 61FA   002C 0034 0014 0016
        DECLE   $001A,  $000A,  $000B,  $000D   ; 61FE   001A 000A 000B 000D
        DECLE   $0005,  $0004,  $0000,  $0000   ; 6202   0005 0004 0000 0000
        DECLE   $0000,  $0008,  $0028,  $0028   ; 6206   0000 0008 0028 0028
        DECLE   $002C,  $0034,  $0014,  $0014   ; 620A   002C 0034 0014 0014
        DECLE   $0016,  $001A,  $000A,  $000A   ; 620E   0016 001A 000A 000A
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6212   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0012,  $0012   ; 6216   0000 0000 0012 0012
        DECLE   $0012,  $0012,  $0012,  $0012   ; 621A   0012 0012 0012 0012
        DECLE   $0012,  $0012,  $0012,  $0012   ; 621E   0012 0012 0012 0012
        DECLE   $0012,  $0000,  $0000,  $0000   ; 6222   0012 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6226   0000 0000 0000 0000
        DECLE   $0068,  $0038,  $0018,  $001C   ; 622A   0068 0038 0018 001C
        DECLE   $0016,  $0033,  $0020,  $0020   ; 622E   0016 0033 0020 0020
        DECLE   $0060,  $0040,  $0040,  $0000   ; 6232   0060 0040 0040 0000
        DECLE   $0000,  $0030,  $0023,  $0036   ; 6236   0000 0030 0023 0036

        SARC    R0,     2                       ; 623A   007C
        SARC    R0,     1                       ; 623B   0078
        SARC    R0,     1                       ; 623C   0078
        ADDR    R7,     R0                      ; 623D   00F8
        ADDR    R3,     R4                      ; 623E   00DC
        ADDR    R3,     R7                      ; 623F   00DF
        MOVR    R3,     R7                      ; 6240   009F

        DECLE   $0085,  $0005,  $000E,  $000A   ; 6241   0085 0005 000E 000A
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6245   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6249   0000 0000 0000

        EIS                                     ; 624C   0002

        JSRE    R4,     L_6C5B                  ; 624D   0004 006D 005B
        DECLE   $0077,  $00FF,  $00FD,  $00DD   ; 6250   0077 00FF 00FD 00DD
        DECLE   $0065,  $002D,  $0000,  $0000   ; 6254   0065 002D 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0010   ; 6258   0000 0000 0018 0010
        DECLE   $003C,  $007E,  $00BB,  $00F8   ; 625C   003C 007E 00BB 00F8
        DECLE   $007C,  $007E,  $003A,  $000E   ; 6260   007C 007E 003A 000E
        DECLE   $0014,  $0034,  $0018,  $0010   ; 6264   0014 0034 0018 0010
        DECLE   $001C,  $003E,  $007B,  $0079   ; 6268   001C 003E 007B 0079
        DECLE   $00FA,  $00E8,  $0068,  $003C   ; 626C   00FA 00E8 0068 003C
        DECLE   $003E,  $0037,  $001B,  $001E   ; 6270   003E 0037 001B 001E
        DECLE   $001C,  $0038,  $0000,  $0000   ; 6274   001C 0038 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0024   ; 6278   0000 0018 0018 0024
        DECLE   $007E,  $00FF,  $00BD,  $00DB   ; 627C   007E 00FF 00BD 00DB
        DECLE   $005A,  $003C,  $003C,  $0024   ; 6280   005A 003C 003C 0024
        DECLE   $0024,  $0024,  $000C,  $000C   ; 6284   0024 0024 000C 000C
        DECLE   $0012,  $003E,  $007F,  $005D   ; 6288   0012 003E 007F 005D
        DECLE   $007F,  $007E,  $003C,  $003C   ; 628C   007F 007E 003C 003C
        DECLE   $0014,  $0014,  $003C,  $0068   ; 6290   0014 0014 003C 0068
        DECLE   $0058,  $0010,  $000C,  $0008   ; 6294   0058 0010 000C 0008
        DECLE   $000C,  $001E,  $003F           ; 6298   000C 001E 003F

        SARC    R1,     2                       ; 629B   007D
        ADDR    R3,     R7                      ; 629C   00DF

        DECLE   $00BE,  $003C,  $003C,  $0034   ; 629D   00BE 003C 003C 0034
        DECLE   $001E,  $000A,  $000A,  $0014   ; 62A1   001E 000A 000A 0014
        DECLE   $0028,  $0006,  $0004,  $0006   ; 62A5   0028 0006 0004 0006
        DECLE   $001F,  $003F,  $007F,  $00DD   ; 62A9   001F 003F 007F 00DD
        DECLE   $00BF,  $003A,  $003C,  $003E   ; 62AD   00BF 003A 003C 003E
        DECLE   $001E,  $000C,  $001C,  $0030   ; 62B1   001E 000C 001C 0030
        DECLE   $0020,  $0000,  $0000,  $000C   ; 62B5   0020 0000 0000 000C
        DECLE   $0008,  $003C,  $007E,  $00FF   ; 62B9   0008 003C 007E 00FF
        DECLE   $00B9,  $00F3,  $007A,  $0078   ; 62BD   00B9 00F3 007A 0078
        DECLE   $003C,  $001C,  $0018,  $0030   ; 62C1   003C 001C 0018 0030
        DECLE   $0020,  $0000,  $0000,  $0000   ; 62C5   0020 0000 0000 0000
        DECLE   $000C,  $0008,  $001C,  $003C   ; 62C9   000C 0008 001C 003C
        DECLE   $007C,  $0076,  $007A,  $007C   ; 62CD   007C 0076 007A 007C
        DECLE   $003C,  $0018,  $0038,  $0060   ; 62D1   003C 0018 0038 0060
        DECLE   $0020,  $0000,  $0000,  $0000   ; 62D5   0020 0000 0000 0000
        DECLE   $0000                           ; 62D9   0000

        CLRC                                    ; 62DA   0006

        JSRD    R4,     .EXEC.C3E               ; 62DB   0004 001E 003E
        DECLE   $007A,  $0072,  $007E,  $007E   ; 62DE   007A 0072 007E 007E
        DECLE   $003E,  $001C,  $0018,  $0030   ; 62E2   003E 001C 0018 0030
        DECLE   $0000,  $0000,  $0000,  $000C   ; 62E6   0000 0000 0000 000C
        DECLE   $0008,  $001C,  $003C,  $003C   ; 62EA   0008 001C 003C 003C
        DECLE   $0036,  $007A,  $007C,  $007E   ; 62EE   0036 007A 007C 007E
        DECLE   $0016,  $003C,  $0028,  $0008   ; 62F2   0016 003C 0028 0008
        DECLE   $0000,  $0000,  $000C,  $0008   ; 62F6   0000 0000 000C 0008
        DECLE   $000C,  $003E,  $007F,  $005D   ; 62FA   000C 003E 007F 005D
        DECLE   $007F,  $003A,  $0038,  $001C   ; 62FE   007F 003A 0038 001C
        DECLE   $0014,  $003C,  $0028,  $0008   ; 6302   0014 003C 0028 0008
        DECLE   $000C,  $0008,  $000C,  $001E   ; 6306   000C 0008 000C 001E
        DECLE   $003F,  $007D,  $00FD,  $00BB   ; 630A   003F 007D 00FD 00BB
        DECLE   $003A,  $003C,  $003C,  $0014   ; 630E   003A 003C 003C 0014
        DECLE   $003C,  $0068,  $0058,  $0010   ; 6312   003C 0068 0058 0010
        DECLE   $000C,  $0008,  $000C,  $001C   ; 6316   000C 0008 000C 001C
        DECLE   $003E,  $007A,  $00FA,  $00BC   ; 631A   003E 007A 00FA 00BC
        DECLE   $003C,  $003C,  $001C,  $0014   ; 631E   003C 003C 001C 0014
        DECLE   $0034,  $002C,  $0028,  $0008   ; 6322   0034 002C 0028 0008
        DECLE   $000C,  $000C,  $001E,  $003E   ; 6326   000C 000C 001E 003E
        DECLE   $007F,  $005D,  $007F,  $007E   ; 632A   007F 005D 007F 007E
        DECLE   $003C,  $003C,  $0014,  $0034   ; 632E   003C 003C 0014 0034
        DECLE   $002C,  $0028,  $0028,  $0008   ; 6332   002C 0028 0028 0008
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6336   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 633A   0018 003C 007E 00FF
        DECLE   $00BD,  $00DB,  $005A,  $003C   ; 633E   00BD 00DB 005A 003C
        DECLE   $003C,  $0024,  $0024,  $0024   ; 6342   003C 0024 0024 0024
        DECLE   $0000,  $0000,  $0010,  $0040   ; 6346   0000 0000 0010 0040
        DECLE   $0002,  $0090,  $0004,  $0040   ; 634A   0002 0090 0004 0040
        DECLE   $0011,  $0080,  $0000,  $0045   ; 634E   0011 0080 0000 0045
        DECLE   $0090,  $0000,  $0020,  $0000   ; 6352   0090 0000 0020 0000
        DECLE   $0049,  $0000,  $0004,  $0020   ; 6356   0049 0000 0004 0020
        DECLE   $0001,  $0090,  $0000,  $0002   ; 635A   0001 0090 0000 0002
        DECLE   $0020,  $0009,  $0000,  $0040   ; 635E   0020 0009 0000 0040
        DECLE   $0000,  $0014,  $0000,  $0020   ; 6362   0000 0014 0000 0020
        DECLE   $0002,  $0003,  $0004,  $0006   ; 6366   0002 0003 0004 0006
        DECLE   $0007,  $0000,  $0009,  $000A   ; 636A   0007 0000 0009 000A
        DECLE   $000C,  $03FF,  $0034,  $0036   ; 636E   000C 03FF 0034 0036
        DECLE   $0036,  $0034,  $001C,  $0020   ; 6372   0036 0034 001C 0020
        DECLE   $0020,  $001C,  $0022,  $0020   ; 6376   0020 001C 0022 0020
        DECLE   $0024,  $001E,  $002E,  $0030   ; 637A   0024 001E 002E 0030
        DECLE   $0030,  $002E,  $0032,  $002E   ; 637E   0030 002E 0032 002E
        DECLE   $0046,  $0048,  $0048,  $0046   ; 6382   0046 0048 0048 0046
        DECLE   $0000                           ; 6386   0000
L_6387:
        PSHR    R5                              ; 6387   0275
        MVII    #$000A, R4                      ; 6388   02BC 000A
L_638A:
        MVII    #$016D, R2                      ; 638A   02BA 016D
        ADDR    R4,     R2                      ; 638C   00E2
        MVI@    R2,     R0                      ; 638D   0290
        CMPI    #$00FF, R0                      ; 638E   0378 00FF
        BNEQ    L_63AE                          ; 6390   020C 001C

        MVI     G_0193, R0                      ; 6392   0280 0193
        INCR    R0                              ; 6394   0008
        MVO     R0,     G_0193                  ; 6395   0240 0193
        MVI     G_0192, R1                      ; 6397   0281 0192
        CMPR    R1,     R0                      ; 6399   0148
        BGE     L_64ED                          ; 639A   020D 0151

        JSR     R5,     L_65BB                  ; 639C   0004 0164 01BB

        CLRR    R0                              ; 639F   01C0
        PSHR    R5                              ; 63A0   0275
        PSHR    R4                              ; 63A1   0274
        MVII    #$016E, R5                      ; 63A2   02BD 016E
        MVII    #$0178, R4                      ; 63A4   02BC 0178
L_63A6:
        MVO@    R0,     R5                      ; 63A6   0268
        MVO@    R0,     R4                      ; 63A7   0260
        CMPI    #$0178, R5                      ; 63A8   037D 0178
        BLT     L_63A6                          ; 63AA   0225 0005

        PULR    R4                              ; 63AC   02B4
        PULR    R5                              ; 63AD   02B5
L_63AE:
        MOVR    R0,     R1                      ; 63AE   0081
        CMPI    #$0020, R1                      ; 63AF   0379 0020
        BLT     L_63BF                          ; 63B1   0205 000C

        SUBI    #$0020, R1                      ; 63B3   0339 0020
        MOVR    R1,     R0                      ; 63B5   0088
        CMPI    #$0020, R1                      ; 63B6   0379 0020
        BLT     L_63BF                          ; 63B8   0205 0005

        MVO@    R1,     R2                      ; 63BA   0251
        CLRR    R1                              ; 63BB   01C9
        PSHR    R0                              ; 63BC   0270
        B       L_63D5                          ; 63BD   0200 0016

L_63BF:
        PSHR    R0                              ; 63BF   0270
        MVI     G_01B9, R0                      ; 63C0   0280 01B9
        CMPI    #$0001, R0                      ; 63C2   0378 0001
        BNEQ    L_63D4                          ; 63C4   020C 000E

        CMPI    #$001A, R1                      ; 63C6   0379 001A
        BEQ     L_63D2                          ; 63C8   0204 0008

        CMPI    #$001B, R1                      ; 63CA   0379 001B
        BNEQ    L_63D4                          ; 63CC   020C 0006

        MVII    #$0024, R1                      ; 63CE   02B9 0024
        B       L_63D4                          ; 63D0   0200 0002

L_63D2:
        MVII    #$0023, R1                      ; 63D2   02B9 0023
L_63D4:
        SLL     R1,     1                       ; 63D4   0049
L_63D5:
        PSHR    R4                              ; 63D5   0274
        MOVR    R4,     R0                      ; 63D6   00A0
        SLL     R0,     1                       ; 63D7   0048
        MOVR    R0,     R4                      ; 63D8   0084
        MVI     G_01BA, R5                      ; 63D9   0285 01BA
        TSTR    R5                              ; 63DB   00AD
        BEQ     L_63E1                          ; 63DC   0204 0003

        SUBI    #$0016, R4                      ; 63DE   033C 0016
        NEGR    R4                              ; 63E0   0024
L_63E1:
        ADDI    #$02DA, R4                      ; 63E1   02FC 02DA
        PSHR    R4                              ; 63E3   0274
        MOVR    R1,     R3                      ; 63E4   008B

        JSR     R5,     L_645E                  ; 63E5   0004 0164 005E

        MVI     G_01B9, R4                      ; 63E8   0284 01B9
        CMPI    #$0002, R4                      ; 63EA   037C 0002
        BNEQ    L_63FB                          ; 63EC   020C 000D

        CMPI    #$0034, R1                      ; 63EE   0379 0034
        BEQ     L_63FA                          ; 63F0   0204 0008

        CMPI    #$0036, R1                      ; 63F2   0379 0036
        BEQ     L_63FA                          ; 63F4   0204 0004

        CMPI    #$0038, R1                      ; 63F6   0379 0038
        BNEQ    L_63FB                          ; 63F8   020C 0001

L_63FA:
        CLRR    R3                              ; 63FA   01DB
L_63FB:
        PULR    R4                              ; 63FB   02B4
        SDBD                                    ; 63FC   0001
        ADDI    #$6AA8, R3                      ; 63FD   02FB 00A8 006A

        JSR     R5,     L_6479                  ; 6400   0004 0164 0079
        JSR     R5,     L_6479                  ; 6403   0004 0164 0079

        PULR    R4                              ; 6406   02B4
        PULR    R0                              ; 6407   02B0
        CMPI    #$001F, R0                      ; 6408   0378 001F
        BGT     L_642F                          ; 640A   020E 0023

        CMPI    #$001A, R0                      ; 640C   0378 001A
        BEQ     L_642A                          ; 640E   0204 001A

        CMPI    #$001B, R0                      ; 6410   0378 001B
        BEQ     L_642A                          ; 6412   0204 0016

        CMPI    #$001C, R0                      ; 6414   0378 001C
        BEQ     L_642A                          ; 6416   0204 0012

        SDBD                                    ; 6418   0001
        MVII    #$6366, R5                      ; 6419   02BD 0066 0063
L_641C:
        MVI@    R5,     R1                      ; 641C   02A9
        CMPR    R1,     R0                      ; 641D   0148
        BEQ     L_642D                          ; 641E   0204 000D

        MVI@    R5,     R1                      ; 6420   02A9
        CMPR    R1,     R0                      ; 6421   0148
        BEQ     L_642D                          ; 6422   0204 0009

        CMPI    #$03FF, R1                      ; 6424   0379 03FF
        BNEQ    L_641C                          ; 6426   022C 000B
        B       L_6433                          ; 6428   0200 0009

L_642A:
        MVII    #$0000, R0                      ; 642A   02B8 0000
        INCR    R7                              ; 642C   000F

L_642D:
        INCR    R0                              ; 642D   0008
L_642E:
        MVO@    R0,     R2                      ; 642E   0250
L_642F:
        DECR    R4                              ; 642F   0014
        BNEQ    L_638A                          ; 6430   022C 00A7
        PULR    R7                              ; 6432   02B7

L_6433:
        MVII    #$0177, R1                      ; 6433   02B9 0177
        ADDR    R4,     R1                      ; 6435   00E1
        MVI@    R1,     R2                      ; 6436   028A
        INCR    R2                              ; 6437   000A
        MVO@    R2,     R1                      ; 6438   024A
        DECR    R2                              ; 6439   0012
        MOVR    R4,     R3                      ; 643A   00A3
        SLL     R3,     1                       ; 643B   004B
        PSHR    R2                              ; 643C   0272
        MVII    #$0194, R2                      ; 643D   02BA 0194
        ADD     G_0193, R2                      ; 643F   02C2 0193
        MVI@    R2,     R2                      ; 6441   0292
        MVI     G_01BA, R5                      ; 6442   0285 01BA
        TSTR    R5                              ; 6444   00AD
        BEQ     L_6449                          ; 6445   0204 0002

        SUBI    #$000E, R2                      ; 6447   033A 000E
L_6449:
        SLL     R2,     1                       ; 6449   004A
        SDBD                                    ; 644A   0001
        MVII    #$69CA, R5                      ; 644B   02BD 00CA 0069
        ADDR    R2,     R5                      ; 644E   00D5
        SDBD                                    ; 644F   0001
        ADD@    R5,     R3                      ; 6450   02EB
        SUBI    #$0002, R3                      ; 6451   033B 0002
        PULR    R2                              ; 6453   02B2
        MOVR    R3,     R5                      ; 6454   009D
        SDBD                                    ; 6455   0001
        ADD@    R5,     R2                      ; 6456   02EA
        MVI@    R2,     R0                      ; 6457   0290
        MVII    #$016D, R1                      ; 6458   02B9 016D
        ADDR    R4,     R1                      ; 645A   00E1
        MVO@    R0,     R1                      ; 645B   0248
        B       L_642F                          ; 645C   0220 002E

L_645E:
        PSHR    R5                              ; 645E   0275
        MVI     G_01BA, R5                      ; 645F   0285 01BA
        TSTR    R5                              ; 6461   00AD
        BEQ     L_6566                          ; 6462   0204 0102

        SDBD                                    ; 6464   0001
        MVII    #$636F, R5                      ; 6465   02BD 006F 0063
L_6468:
        INCR    R5                              ; 6468   000D
        MVI@    R5,     R4                      ; 6469   02AC
        CMPR    R4,     R3                      ; 646A   0163
        BNEQ    L_646F                          ; 646B   020C 0002

        MVI@    R5,     R3                      ; 646D   02AB
        PULR    R7                              ; 646E   02B7

L_646F:
        INCR    R5                              ; 646F   000D
        MVI@    R5,     R4                      ; 6470   02AC
        TSTR    R4                              ; 6471   00A4
        BEQ     L_6566                          ; 6472   0204 00F2

        CMPR    R4,     R3                      ; 6474   0163
        BNEQ    L_6468                          ; 6475   022C 000E

        MVI@    R5,     R3                      ; 6477   02AB
        PULR    R7                              ; 6478   02B7

L_6479:
        PSHR    R5                              ; 6479   0275
        MVI@    R3,     R0                      ; 647A   0298
        INCR    R3                              ; 647B   000B
        TSTR    R0                              ; 647C   0080
        BEQ     L_64C5                          ; 647D   0204 0046

        MOVR    R0,     R5                      ; 647F   0085
        ANDI    #$01F8, R5                      ; 6480   03BD 01F8
        CMPI    #$00F8, R5                      ; 6482   037D 00F8
        BNEQ    L_6492                          ; 6484   020C 000C

        MVI     G_01B5, R5                      ; 6486   0285 01B5
        XORI    #$0001, R5                      ; 6488   03FD 0001
        MVO     R5,     G_01B5                  ; 648A   0245 01B5
        BNEQ    L_64C1                          ; 648C   020C 0033

        XORI    #$0003, R0                      ; 648E   03F8 0003
        B       L_64BD                          ; 6490   0200 002B

L_6492:
        CMPI    #$0100, R5                      ; 6492   037D 0100
        BNEQ    L_64A0                          ; 6494   020C 000A

        MVI     G_01B6, R5                      ; 6496   0285 01B6
        XORI    #$0001, R5                      ; 6498   03FD 0001
        MVO     R5,     G_01B6                  ; 649A   0245 01B6
        BNEQ    L_64C1                          ; 649C   020C 0023

        XORI    #$0003, R0                      ; 649E   03F8 0003
L_64A0:
        MOVR    R0,     R5                      ; 64A0   0085
        ANDI    #$0007, R5                      ; 64A1   03BD 0007
        CMPI    #$0006, R5                      ; 64A3   037D 0006
        BNEQ    L_64AD                          ; 64A5   020C 0006

        SDBD                                    ; 64A7   0001
        XORI    #$1006, R0                      ; 64A8   03F8 0006 0010
        B       L_64C1                          ; 64AB   0200 0014

L_64AD:
        CMPI    #$0004, R5                      ; 64AD   037D 0004
        BNEQ    L_64B9                          ; 64AF   020C 0008

        XORI    #$0004, R0                      ; 64B1   03F8 0004
        SDBD                                    ; 64B3   0001
        XORI    #$1006, R0                      ; 64B4   03F8 0006 0010
        B       L_64C1                          ; 64B7   0200 0008

L_64B9:
        CMPI    #$0001, R5                      ; 64B9   037D 0001
        BNEQ    L_64C1                          ; 64BB   020C 0004

L_64BD:
        SDBD                                    ; 64BD   0001
        XORI    #$1004, R0                      ; 64BE   03F8 0004 0010
L_64C1:
        SDBD                                    ; 64C1   0001
        XORI    #$0800, R0                      ; 64C2   03F8 0000 0008
L_64C5:
        MVO@    R0,     R4                      ; 64C5   0260
        PULR    R7                              ; 64C6   02B7

        DECLE   $0050,  $0065,  $0043,  $0065   ; 64C7   0050 0065 0043 0065
        DECLE   $0037,  $0065,  $0067,  $0065   ; 64CB   0037 0065 0067 0065
        DECLE   $006F,  $0065,  $0001,  $0001   ; 64CF   006F 0065 0001 0001
        DECLE   $0040,  $0000,  $0004,  $0040   ; 64D3   0040 0000 0004 0040
        DECLE   $0040,  $0000,  $0006,  $0042   ; 64D7   0040 0000 0006 0042
        DECLE   $0042,  $0000,  $0008,  $0044   ; 64DB   0042 0000 0008 0044
        DECLE   $0044,  $0000,  $000A,  $0040   ; 64DF   0044 0000 000A 0040
        DECLE   $0040,  $0000,  $0001,  $0042   ; 64E3   0040 0000 0001 0042
        DECLE   $0042,  $0000,  $0001,  $0044   ; 64E7   0042 0000 0001 0044
        DECLE   $0044,  $0000                   ; 64EB   0044 0000
L_64ED:
        MVII    #$0014, R0                      ; 64ED   02B8 0014
        MVII    #$02DC, R4                      ; 64EF   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 64F1   0004 0114 0338

        MVI     G_0182, R4                      ; 64F4   0284 0182
        ADDI    #$0002, R4                      ; 64F6   02FC 0002
        MVO     R4,     G_0182                  ; 64F8   0244 0182
        CMPI    #$000E, R4                      ; 64FA   037C 000E
        BGE     L_652C                          ; 64FC   020D 002E

        PSHR    R4                              ; 64FE   0274
        MOVR    R4,     R2                      ; 64FF   00A2
        ADDR    R2,     R2                      ; 6500   00D2
        SDBD                                    ; 6501   0001
        ADDI    #$64D1, R2                      ; 6502   02FA 00D1 0064
        SDBD                                    ; 6505   0001
        MVII    #$6AA8, R1                      ; 6506   02B9 00A8 006A
        MVI@    R2,     R3                      ; 6509   0293
        ADDR    R1,     R3                      ; 650A   00CB
        MVII    #$02DD, R4                      ; 650B   02BC 02DD

        JSR     R5,     L_6479                  ; 650D   0004 0164 0079
        JSR     R5,     L_6479                  ; 6510   0004 0164 0079

        INCR    R2                              ; 6513   000A
        MVI@    R2,     R3                      ; 6514   0293
        ADDR    R1,     R3                      ; 6515   00CB
        MVII    #$02EC, R4                      ; 6516   02BC 02EC

        JSR     R5,     L_6479                  ; 6518   0004 0164 0079
        JSR     R5,     L_6479                  ; 651B   0004 0164 0079

        INCR    R2                              ; 651E   000A
        MVI@    R2,     R3                      ; 651F   0293
        ADDR    R1,     R3                      ; 6520   00CB

        JSR     R5,     L_6479                  ; 6521   0004 0164 0079
        JSR     R5,     L_6479                  ; 6524   0004 0164 0079

        PULR    R4                              ; 6527   02B4
        CMPI    #$000A, R4                      ; 6528   037C 000A
        BLT     L_6566                          ; 652A   0205 003A

L_652C:
        CMPI    #$0012, R4                      ; 652C   037C 0012
        BGT     L_6566                          ; 652E   020E 0036

        SDBD                                    ; 6530   0001
        ADDI    #$64BD, R4                      ; 6531   02FC 00BD 0064
        SDBD                                    ; 6534   0001
        MVI@    R4,     R0                      ; 6535   02A0
        MOVR    R0,     R7                      ; 6536   0087

        SDBD                                    ; 6537   0001
        MVII    #$08F7, R1                      ; 6538   02B9 00F7 0008
        MVII    #$0014, R0                      ; 653B   02B8 0014
        MVII    #$02DC, R4                      ; 653D   02BC 02DC

        JSR     R5,     X_FILL_MEM              ; 653F   0004 0114 0341

        PULR    R7                              ; 6542   02B7

        SDBD                                    ; 6543   0001
        MVII    #$0901, R0                      ; 6544   02B8 0001 0009
        MVO     R0,     .BTAB.E0                ; 6547   0240 02E0
        SDBD                                    ; 6549   0001
        MVII    #$08F9, R0                      ; 654A   02B8 00F9 0008
        MVO     R0,     .BTAB.E9                ; 654D   0240 02E9
        PULR    R7                              ; 654F   02B7

        SDBD                                    ; 6550   0001
        MVII    #$2000, R0                      ; 6551   02B8 0000 0020
        MVO     R0,     .BTAB.E0                ; 6554   0240 02E0
        MVO     R0,     .BTAB.EA                ; 6556   0240 02EA
        MVII    #$0007, R3                      ; 6558   02BB 0007
        MVII    #$02E2, R4                      ; 655A   02BC 02E2

        JSR     R5,     X_PRINT_R5              ; 655C   0004 0118 007B
        STRING  "FINISH"                        ; 655F  
        DECLE   $0000                           ; 6565   0000
L_6566:
        PULR    R7                              ; 6566   02B7

        MVII    #$0014, R0                      ; 6567   02B8 0014
        MVII    #$02DC, R4                      ; 6569   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 656B   0004 0114 0338

        PULR    R7                              ; 656E   02B7

        CLRR    R0                              ; 656F   01C0
        MVO     R0,     G_01BF                  ; 6570   0240 01BF
        SDBD                                    ; 6572   0001
        MVII    #$5020, R1                      ; 6573   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 6576   0004 0118 0038

        MVII    #$0070, R0                      ; 6579   02B8 0070
        MVO     R0,     .BTAB.D9                ; 657B   0240 02D9
        MVO     R0,     G_0183                  ; 657D   0240 0183
        MVO     R0,     G_0160                  ; 657F   0240 0160
        PULR    R7                              ; 6581   02B7

L_6582:
        MVO     R2,     G_0160                  ; 6582   0242 0160
        MVII    #$0006, R0                      ; 6584   02B8 0006
        MVO     R0,     G_01A4                  ; 6586   0240 01A4

        JSR     R5,     X_PLAY_CHEER1           ; 6588   0004 011C 02D5

        MVII    #$015E, R4                      ; 658B   02BC 015E
        SDBD                                    ; 658D   0001
        MVI@    R4,     R2                      ; 658E   02A2
        MVI@    R1,     R0                      ; 658F   0288
        SDBD                                    ; 6590   0001
        MVII    #$F7FF, R5                      ; 6591   02BD 00FF 00F7
        ANDR    R5,     R0                      ; 6594   01A8
        MVO@    R0,     R1                      ; 6595   0248
        MVI     G_032D, R3                      ; 6596   0283 032D
        ANDR    R5,     R3                      ; 6598   01AB
        MVO     R3,     G_032D                  ; 6599   0243 032D
        ANDI    #$0007, R0                      ; 659B   03B8 0007
        MOVR    R0,     R3                      ; 659D   0083
        MVII    #$02D6, R4                      ; 659E   02BC 02D6
        MOVR    R2,     R1                      ; 65A0   0091
        INCR    R7                              ; 65A1   000F

L_65A2:
        PSHR    R5                              ; 65A2   0275
L_65A3:
        MVII    #$0005, R2                      ; 65A3   02BA 0005

        JSR     R5,     X_DIV                   ; 65A5   0004 011C 01FB

        PSHR    R1                              ; 65A8   0271
        MVII    #$0003, R1                      ; 65A9   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 65AB   0004 0118 00C5

        PULR    R0                              ; 65AE   02B0
        SLL     R0,     1                       ; 65AF   0048
        ADDI    #$0003, R4                      ; 65B0   02FC 0003
        MOVR    R3,     R1                      ; 65B2   0099
        XORI    #$0070, R1                      ; 65B3   03F9 0070
        MVO@    R1,     R4                      ; 65B5   0261
        MVII    #$0001, R1                      ; 65B6   02B9 0001

        JSR     R5,     .EXEC.89F               ; 65B8   0004 0118 009F

L_65BB:
        PSHR    R5                              ; 65BB   0275
        MVI     G_0193, R0                      ; 65BC   0280 0193
        MVII    #$0194, R5                      ; 65BE   02BD 0194
        ADDR    R0,     R5                      ; 65C0   00C5
        MVI@    R5,     R0                      ; 65C1   02A8
        CLRR    R1                              ; 65C2   01C9
        CMPI    #$000E, R0                      ; 65C3   0378 000E
        BLT     L_65C8                          ; 65C5   0205 0001

        INCR    R1                              ; 65C7   0009
L_65C8:
        MVO     R1,     G_01BA                  ; 65C8   0241 01BA
        PULR    R7                              ; 65CA   02B7

L_65CB:
        PSHR    R5                              ; 65CB   0275

        JSR     R5,     X_PLAY_SFX1             ; 65CC   0004 0118 03BB
        DECLE   $0079                           ; 65CF  SFX data
        DECLE   $006C,  $0000                   ; 65D0  SFX data
        DECLE   $020D                           ; 65D2  SFX data
        DECLE   $0035                           ; 65D3  SFX data
        DECLE   $006E                           ; 65D4  SFX data
        DECLE   $01AB                           ; 65D5  SFX data
        DECLE   $03ED                           ; 65D6  SFX data
        DECLE   $03B7                           ; 65D7  SFX data
        DECLE   $000B                           ; 65D8  SFX data
        DECLE   $008F,  $0013                   ; 65D9  SFX data
        DECLE   $00CF                           ; 65DB  SFX end


        B       L_65F9                          ; 65DC   0200 001B

L_65DE:
        JSR     R5,     X_PLAY_SFX1             ; 65DE   0004 0118 03BB
        DECLE   $0389                           ; 65E1  SFX data
        DECLE   $006C,  $0000                   ; 65E2  SFX data
        DECLE   $0050,  $0200                   ; 65E4  SFX data
        DECLE   $0058,  $0214                   ; 65E6  SFX data
        DECLE   $005B                           ; 65E8  SFX data
        DECLE   $0044,  $0180                   ; 65E9  SFX data
        DECLE   $0001,  $03A0                   ; 65EB  SFX data
        DECLE   $0001,  $03B2                   ; 65ED  SFX data
        DECLE   $0001,  $03F1                   ; 65EF  SFX data
        DECLE   $000B                           ; 65F1  SFX data
        DECLE   $02EB                           ; 65F2  SFX data
        DECLE   $0001,  $0003                   ; 65F3  SFX data
        DECLE   $01CF                           ; 65F5  SFX end


        B       L_660D                          ; 65F6   0200 0015

L_65F8:
        PSHR    R5                              ; 65F8   0275

L_65F9:
        JSR     R5,     X_PLAY_SFX1             ; 65F9   0004 0118 03BB
        DECLE   $0389                           ; 65FC  SFX data
        DECLE   $03C0,  $01C0                   ; 65FD  SFX data
        DECLE   $03D8,  $0000                   ; 65FF  SFX data
        DECLE   $03D4,  $0200                   ; 6601  SFX data
        DECLE   $03BE                           ; 6603  SFX data
        DECLE   $0001,  $01E3                   ; 6604  SFX data
        DECLE   $03AB                           ; 6606  SFX data
        DECLE   $00CF                           ; 6607  SFX end


        MVI     G_01A5, R5                      ; 6608   0285 01A5
        TSTR    R5                              ; 660A   00AD
        BNEQ    L_6670                          ; 660B   020C 0063

L_660D:
        JSR     R5,     X_PLAY_SFX1             ; 660D   0004 0118 03BB
        DECLE   $0079                           ; 6610  SFX data
        DECLE   $00CD                           ; 6611  SFX data
        DECLE   $01B5                           ; 6612  SFX data
        DECLE   $001D                           ; 6613  SFX data
        DECLE   $0077,  $0019,  $0066           ; 6614  SFX data
        DECLE   $0023,  $03EC                   ; 6617  SFX data
UC_6619:
        MVI     G_0164, R0                      ; 6619  SLIB UCALL target
        TSTR    R0                              ; 661B   0080
        BNEQ    L_6657                          ; 661C   020C 0039

        MVI     G_01B7, R0                      ; 661E   0280 01B7
        TSTR    R0                              ; 6620   0080
        BNEQ    L_6657                          ; 6621   020C 0034

        MVI     G_01B8, R0                      ; 6623   0280 01B8
        TSTR    R0                              ; 6625   0080
        BNEQ    L_664B                          ; 6626   020C 0023

        MVI     G_011F, R2                      ; 6628   0282 011F
        ANDI    #$00C0, R2                      ; 662A   03BA 00C0
        BEQ     L_6634                          ; 662C   0204 0006

        MVI     G_0120, R2                      ; 662E   0282 0120
        ANDI    #$00C0, R2                      ; 6630   03BA 00C0
        BNEQ    L_6638                          ; 6632   020C 0004

L_6634:
        ADD     G_0166, R2                      ; 6634   02C2 0166
        BNEQ    L_664B                          ; 6636   020C 0013

L_6638:
        MVI     G_016A, R1                      ; 6638   0281 016A
        SUB     G_016B, R1                      ; 663A   0301 016B
        BGE     L_663F                          ; 663C   020D 0001

        NEGR    R1                              ; 663E   0021
L_663F:
        CMPI    #$0018, R1                      ; 663F   0379 0018
        BLT     L_6646                          ; 6641   0205 0003

        NEGR    R1                              ; 6643   0021
        ADDI    #$0030, R1                      ; 6644   02F9 0030
L_6646:
        SLL     R1,     2                       ; 6646   004D
        ADDI    #$0040, R1                      ; 6647   02F9 0040
        B       L_6658                          ; 6649   0200 000D

L_664B:
        MVI     G_0156, R1                      ; 664B   0281 0156
        ANDI    #$007F, R1                      ; 664D   03B9 007F
        CMPI    #$0058, R1                      ; 664F   0379 0058
        BGE     L_6658                          ; 6651   020D 0005

        MVII    #$0006, R0                      ; 6653   02B8 0006
        B       L_665A                          ; 6655   0200 0003

L_6657:
        CLRR    R1                              ; 6657   01C9
L_6658:
        MVII    #$0080, R0                      ; 6658   02B8 0080
L_665A:
        MVII    #$0152, R5                      ; 665A   02BD 0152
        MVO@    R0,     R5                      ; 665C   0268
        MVO@    R0,     R5                      ; 665D   0268
        MVO@    R0,     R5                      ; 665E   0268
        INCR    R5                              ; 665F   000D
        CMPI    #$0058, R1                      ; 6660   0379 0058
        BLE     L_6666                          ; 6662   0206 0002

        MVII    #$0058, R1                      ; 6664   02B9 0058
L_6666:
        MVO@    R1,     R5                      ; 6666   0269
        MVO@    R1,     R5                      ; 6667   0269
        MVO@    R1,     R5                      ; 6668   0269
        ANDI    #$0038, R1                      ; 6669   03B9 0038
        SLL     R1,     1                       ; 666B   0049
        ADDI    #$0018, R1                      ; 666C   02F9 0018
        MVO     R1,     G_0155                  ; 666E   0241 0155
L_6670:
        PULR    R7                              ; 6670   02B7

L_6671:
        PSHR    R5                              ; 6671   0275
        MVI     G_01B2, R0                      ; 6672   0280 01B2
        TSTR    R0                              ; 6674   0080
        BEQ     L_6690                          ; 6675   0204 0019

        MVI     G_01B3, R1                      ; 6677   0281 01B3
        DECR    R1                              ; 6679   0011
        MVO     R1,     G_01B3                  ; 667A   0241 01B3
        BNEQ    L_6832                          ; 667C   020C 01B4

        MVII    #$0001, R1                      ; 667E   02B9 0001
        MVO     R1,     G_01B3                  ; 6680   0241 01B3
        MVI     G_01B4, R1                      ; 6682   0281 01B4
        CMPI    #$0001, R0                      ; 6684   0378 0001
        BGT     L_668D                          ; 6686   020E 0005

        JSR     R5,     L_56E1                  ; 6688   0004 0154 02E1

        B       L_6690                          ; 668B   0200 0003

L_668D:
        JSR     R5,     L_59BE                  ; 668D   0004 0158 01BE

L_6690:
        MVI     G_01B8, R0                      ; 6690   0280 01B8
        TSTR    R0                              ; 6692   0080
        BEQ     L_6698                          ; 6693   0204 0003

        DECR    R0                              ; 6695   0010
        MVO     R0,     G_01B8                  ; 6696   0240 01B8
L_6698:
        MVI     G_01B7, R0                      ; 6698   0280 01B7
        TSTR    R0                              ; 669A   0080
        BEQ     L_66AA                          ; 669B   0204 000D

        DECR    R0                              ; 669D   0010
        MVO     R0,     G_01B7                  ; 669E   0240 01B7
        MVII    #$0001, R3                      ; 66A0   02BB 0001
        MVI     G_0164, R0                      ; 66A2   0280 0164
        TSTR    R0                              ; 66A4   0080
        BNEQ    L_66AA                          ; 66A5   020C 0003

        JSR     R5,     L_60A6                  ; 66A7   0004 0160 00A6

L_66AA:
        PULR    R7                              ; 66AA   02B7

        DECLE   $0004,  $0094,  $0094,  $0094   ; 66AB   0004 0094 0094 0094
        DECLE   $0094,  $00E4,  $00C4,  $00B4   ; 66AF   0094 00E4 00C4 00B4
        DECLE   $0004                           ; 66B3   0004

        DIS                                     ; 66B4   0003
        DIS                                     ; 66B5   0003
        DECR    R4                              ; 66B6   0014
        DECR    R4                              ; 66B7   0014
        MOVR    R2,     R4                      ; 66B8   0094
        MOVR    R2,     R4                      ; 66B9   0094
        DECR    R4                              ; 66BA   0014
        DIS                                     ; 66BB   0003
        ADDR    R2,     R4                      ; 66BC   00D4
        ADDR    R0,     R4                      ; 66BD   00C4
        TSTR    R4                              ; 66BE   00A4
        DECR    R4                              ; 66BF   0014
        DECR    R4                              ; 66C0   0014
        DECR    R4                              ; 66C1   0014
        DECR    R4                              ; 66C2   0014
        SLR     R0,     1                       ; 66C3   0060
        RLC     R1,     1                       ; 66C4   0051
        SWAP    R2,     1                       ; 66C5   0042
        GSWD    R3                              ; 66C6   0033
        NEGR    R4                              ; 66C7   0024
        DECR    R5                              ; 66C8   0015
        CLRC                                    ; 66C9   0006
L_66CA:
        DECR    R7                              ; 66CA   0017

        ADCR    R0                              ; 66CB   0028
        RSWD    R1                              ; 66CC   0039
        SLL     R2,     1                       ; 66CD   004A
        SLLC    R3,     1                       ; 66CE   005B
        SAR     R0,     2                       ; 66CF   006C
L_66D0:
        PSHR    R5                              ; 66D0   0275
        MVI     G_01A5, R0                      ; 66D1   0280 01A5
        TSTR    R0                              ; 66D3   0080
        BNEQ    L_6832                          ; 66D4   020C 015C

        MVI     G_0121, R3                      ; 66D6   0283 0121
        DECR    R3                              ; 66D8   0013
        BEQ     L_66DE                          ; 66D9   0204 0003

        MVI     G_0122, R3                      ; 66DB   0283 0122
        DECR    R3                              ; 66DD   0013
L_66DE:
        MVO     R3,     G_0166                  ; 66DE   0243 0166
        MVI     G_016B, R2                      ; 66E0   0282 016B
        PSHR    R2                              ; 66E2   0272
        MVI     G_0169, R0                      ; 66E3   0280 0169

        JSR     R5,     X_EXT_SIGN_LO           ; 66E5   0004 0114 0268

        MOVR    R0,     R1                      ; 66E8   0081
        MVI     G_0334, R0                      ; 66E9   0280 0334
        MVI     G_01B8, R5                      ; 66EB   0285 01B8
        TSTR    R5                              ; 66ED   00AD
        BNEQ    L_66F5                          ; 66EE   020C 0005

        TSTR    R3                              ; 66F0   009B
        BNEQ    L_66F6                          ; 66F1   020C 0003

        SLL     R0,     1                       ; 66F3   0048
        INCR    R7                              ; 66F4   000F

L_66F5:
        CLRR    R0                              ; 66F5   01C0
L_66F6:
        MOVR    R2,     R3                      ; 66F6   0093
        MVI     G_016A, R5                      ; 66F7   0285 016A
        SUBR    R5,     R3                      ; 66F9   012B
        BPL     L_66FD                          ; 66FA   0203 0001

        NEGR    R3                              ; 66FC   0023
L_66FD:
        CMPI    #$0018, R3                      ; 66FD   037B 0018
        BLE     L_6704                          ; 66FF   0206 0003

        SUBI    #$0030, R3                      ; 6701   033B 0030
        NEGR    R3                              ; 6703   0023
L_6704:
        TSTR    R0                              ; 6704   0080
        BEQ     L_6709                          ; 6705   0204 0002

        ADDI    #$0009, R3                      ; 6707   02FB 0009
L_6709:
        ADDR    R5,     R0                      ; 6709   00E8
        BMI     L_6710                          ; 670A   020B 0004

        SUBI    #$0030, R0                      ; 670C   0338 0030
        BGE     L_6712                          ; 670E   020D 0002

L_6710:
        ADDI    #$0030, R0                      ; 6710   02F8 0030
L_6712:
        MVO     R0,     G_016A                  ; 6712   0240 016A
        MVO     R0,     G_016C                  ; 6714   0240 016C
        PULR    R0                              ; 6716   02B0

        JSR     R5,     L_68F3                  ; 6717   0004 0168 00F3

        PSHR    R1                              ; 671A   0271
        MVI     G_016D, R1                      ; 671B   0281 016D

        JSR     R5,     X_MPY                   ; 671D   0004 011C 01DC

        MOVR    R2,     R0                      ; 6720   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 6721   0004 0114 0269

        ADD@    R6,     R0                      ; 6724   02F0
        TSTR    R0                              ; 6725   0080
        BPL     L_672F                          ; 6726   0203 0007

        INCR    R0                              ; 6728   0008
        ADDR    R3,     R0                      ; 6729   00D8
        BMI     L_6734                          ; 672A   020B 0008

        CLRR    R0                              ; 672C   01C0
        B       L_6734                          ; 672D   0200 0005

L_672F:
        DECR    R0                              ; 672F   0010
        SUBR    R3,     R0                      ; 6730   0118
        BPL     L_6734                          ; 6731   0203 0001

        CLRR    R0                              ; 6733   01C0
L_6734:
        MVI     G_0163, R2                      ; 6734   0282 0163
        TSTR    R2                              ; 6736   0092
        BNEQ    L_6756                          ; 6737   020C 001D

        SDBD                                    ; 6739   0001
        CMPI    #$FFEC, R0                      ; 673A   0378 00EC 00FF
        BGE     L_6745                          ; 673D   020D 0006

        JSR     R5,     L_65F8                  ; 673F   0004 0164 01F8

        J       L_6057                          ; 6742   0004 0360 0057

L_6745:
        MVI     G_01B7, R5                      ; 6745   0285 01B7
        TSTR    R5                              ; 6747   00AD
        BEQ     L_6757                          ; 6748   0204 000D

        MOVR    R0,     R5                      ; 674A   0085
        SLR     R0,     2                       ; 674B   0064
        SLR     R0,     1                       ; 674C   0060
        NEGR    R0                              ; 674D   0020
        ADDR    R5,     R0                      ; 674E   00E8
        BMI     L_6753                          ; 674F   020B 0002
        BNEQ    L_6757                          ; 6751   020C 0004

L_6753:
        MVII    #$0002, R0                      ; 6753   02B8 0002
        INCR    R7                              ; 6755   000F

L_6756:
        SAR     R0,     1                       ; 6756   0068
L_6757:
        PSHR    R2                              ; 6757   0272
        MVII    #$0012, R2                      ; 6758   02BA 0012
        SUB     G_016D, R2                      ; 675A   0302 016D
        SLL     R2,     2                       ; 675C   004E
        NEGR    R2                              ; 675D   0022
        ADDI    #$0078, R2                      ; 675E   02FA 0078
        CMPR    R2,     R0                      ; 6760   0150
        BLE     L_6764                          ; 6761   0206 0001

        MOVR    R2,     R0                      ; 6763   0090
L_6764:
        PULR    R2                              ; 6764   02B2
        MVO     R0,     G_0169                  ; 6765   0240 0169
        MVII    #$0331, R3                      ; 6767   02BB 0331
        ADD     G_0164, R2                      ; 6769   02C2 0164
        BNEQ    L_67D5                          ; 676B   020C 0068

        MVI     G_016C, R2                      ; 676D   0282 016C
        SAR     R2,     1                       ; 676F   006A
        SDBD                                    ; 6770   0001
        ADDI    #$66AB, R2                      ; 6771   02FA 00AB 0066
        MVI@    R2,     R0                      ; 6774   0290
        MOVR    R0,     R1                      ; 6775   0081
        ANDI    #$000F, R1                      ; 6776   03B9 000F
        MOVR    R0,     R2                      ; 6778   0082
        SLR     R2,     2                       ; 6779   0066
        SLR     R2,     2                       ; 677A   0066
        ANDI    #$0007, R2                      ; 677B   03BA 0007
        SWAP    R0,     2                       ; 677D   0044
        BPL     L_6781                          ; 677E   0203 0001

        NEGR    R2                              ; 6780   0022
L_6781:
        MOVR    R2,     R0                      ; 6781   0090

        JSR     R5,     X_PACK_BYTES            ; 6782   0004 0114 034F

        MVO@    R0,     R3                      ; 6785   0258
        SUBI    #$0007, R3                      ; 6786   033B 0007
        MVI     G_016C, R2                      ; 6788   0282 016C
        SAR     R2,     1                       ; 678A   006A
        CMPI    #$000C, R2                      ; 678B   037A 000C
        BLE     L_6792                          ; 678D   0206 0003

        NEGR    R2                              ; 678F   0022
        ADDI    #$0018, R2                      ; 6790   02FA 0018
L_6792:
        SDBD                                    ; 6792   0001
        ADDI    #$66C3, R2                      ; 6793   02FA 00C3 0066
        MVI@    R2,     R0                      ; 6796   0290
        MOVR    R0,     R1                      ; 6797   0081
        SLR     R0,     2                       ; 6798   0064
        SLR     R0,     2                       ; 6799   0064
        ANDI    #$000F, R1                      ; 679A   03B9 000F
        MVO@    R1,     R3                      ; 679C   0259
        ADDI    #$0008, R3                      ; 679D   02FB 0008
        MVO@    R0,     R3                      ; 679F   0258
        SUBI    #$000D, R3                      ; 67A0   033B 000D
        MVI@    R3,     R0                      ; 67A2   0298
        ADDI    #$0008, R3                      ; 67A3   02FB 0008
        MVI@    R3,     R1                      ; 67A5   0299
        SDBD                                    ; 67A6   0001
        ANDI    #$FDFF, R0                      ; 67A7   03B8 00FF 00FD
        SDBD                                    ; 67AA   0001
        ANDI    #$DDFF, R1                      ; 67AB   03B9 00FF 00DD
        MVI     G_016C, R2                      ; 67AE   0282 016C
        SAR     R2,     1                       ; 67B0   006A
        CMPI    #$000C, R2                      ; 67B1   037A 000C
        BLE     L_67B9                          ; 67B3   0206 0004

        XORI    #$0200, R0                      ; 67B5   03F8 0200
        XORI    #$0200, R1                      ; 67B7   03F9 0200
L_67B9:
        SUBI    #$0003, R3                      ; 67B9   033B 0003
        MVI@    R3,     R2                      ; 67BB   029A
        CMPI    #$0006, R2                      ; 67BC   037A 0006
        BLE     L_67C2                          ; 67BE   0206 0002

        XORI    #$0200, R1                      ; 67C0   03F9 0200
L_67C2:
        SUBI    #$0005, R3                      ; 67C2   033B 0005
        MVO@    R0,     R3                      ; 67C4   0258
        PSHR    R3                              ; 67C5   0273
        ADDI    #$000D, R3                      ; 67C6   02FB 000D
        MVI@    R3,     R2                      ; 67C8   029A
        PULR    R3                              ; 67C9   02B3
        CMPI    #$0001, R2                      ; 67CA   037A 0001
        BGT     L_67D2                          ; 67CC   020E 0004

        SDBD                                    ; 67CE   0001
        XORI    #$2000, R1                      ; 67CF   03F9 0000 0020
L_67D2:
        ADDI    #$0008, R3                      ; 67D2   02FB 0008
        MVO@    R1,     R3                      ; 67D4   0259
L_67D5:
        MVII    #$0329, R4                      ; 67D5   02BC 0329
        MVI     G_016B, R0                      ; 67D7   0280 016B
        MVI     G_0169, R3                      ; 67D9   0283 0169
        PSHR    R3                              ; 67DB   0273
        PSHR    R0                              ; 67DC   0270

        JSR     R5,     L_68F3                  ; 67DD   0004 0168 00F3

        MOVR    R0,     R1                      ; 67E0   0081
        MOVR    R3,     R0                      ; 67E1   0098

        JSR     R5,     X_EXT_SIGN_LO           ; 67E2   0004 0114 0268
        JSR     R5,     X_MPY                   ; 67E5   0004 011C 01DC

        MOVR    R2,     R0                      ; 67E8   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 67E9   0004 0114 0269

        MOVR    R0,     R3                      ; 67EC   0083
        PULR    R0                              ; 67ED   02B0

        JSR     R5,     L_6902                  ; 67EE   0004 0168 0102

        MOVR    R0,     R1                      ; 67F1   0081
        PULR    R0                              ; 67F2   02B0

        JSR     R5,     X_EXT_SIGN_LO           ; 67F3   0004 0114 0268
        JSR     R5,     X_MPY                   ; 67F6   0004 011C 01DC

        MOVR    R2,     R0                      ; 67F9   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 67FA   0004 0114 0269

        MOVR    R3,     R1                      ; 67FD   0099

        JSR     R5,     X_PACK_BYTES            ; 67FE   0004 0114 034F

        MVO@    R0,     R4                      ; 6801   0260
        MVI     G_0183, R0                      ; 6802   0280 0183
        TSTR    R0                              ; 6804   0080
        BNEQ    L_6831                          ; 6805   020C 002A

        MVI     G_0328, R2                      ; 6807   0282 0328
        MVI     G_0329, R0                      ; 6809   0280 0329

        JSR     R5,     X_EXT_SIGN_LO           ; 680B   0004 0114 0268

        SWAP    R2,     1                       ; 680E   0042
        ANDI    #$00FF, R2                      ; 680F   03BA 00FF
        CMPI    #$001D, R2                      ; 6811   037A 001D
        BGT     L_6819                          ; 6813   020E 0004

        SUBI    #$0008, R0                      ; 6815   0338 0008
        B       L_681F                          ; 6817   0200 0006

L_6819:
        CMPI    #$0027, R2                      ; 6819   037A 0027
        BLT     L_681F                          ; 681B   0205 0002

        ADDI    #$0008, R0                      ; 681D   02F8 0008
L_681F:
        MOVR    R0,     R3                      ; 681F   0083
        BPL     L_6823                          ; 6820   0203 0001

        CLRR    R3                              ; 6822   01DB
L_6823:
        NEGR    R3                              ; 6823   0023
        MVO     R3,     G_01BF                  ; 6824   0243 01BF
        MVI     G_0329, R0                      ; 6826   0280 0329

        JSR     R5,     X_UNPK_BYTES            ; 6828   0004 0114 0357

        ADDR    R3,     R1                      ; 682B   00D9

        JSR     R5,     X_PACK_BYTES            ; 682C   0004 0114 034F

        MVO     R0,     G_0329                  ; 682F   0240 0329
L_6831:
        PULR    R7                              ; 6831   02B7

L_6832:
        MVI     G_01AC, R0                      ; 6832   0280 01AC
        TSTR    R0                              ; 6834   0080
        BEQ     L_6831                          ; 6835   0224 0005

        MVII    #$01A6, R4                      ; 6837   02BC 01A6
        SDBD                                    ; 6839   0001
        MVI@    R4,     R0                      ; 683A   02A0
        INCR    R0                              ; 683B   0008
        SUBI    #$0002, R4                      ; 683C   033C 0002
        SDBD                                    ; 683E   0001
        CMPI    #$044C, R0                      ; 683F   0378 004C 0004
        BLT     L_6848                          ; 6842   0205 0004

        JSR     R5,     L_6E17                  ; 6844   0004 016C 0217

        CLRR    R0                              ; 6847   01C0
L_6848:
        MVO@    R0,     R4                      ; 6848   0260
        SWAP    R0,     1                       ; 6849   0040
        MVO@    R0,     R4                      ; 684A   0260
        PULR    R7                              ; 684B   02B7

L_684C:
        PSHR    R5                              ; 684C   0275
        MVI     G_01A4, R0                      ; 684D   0280 01A4
        TSTR    R0                              ; 684F   0080
        BNEQ    L_6869                          ; 6850   020C 0017

        MVII    #$015E, R4                      ; 6852   02BC 015E
        SDBD                                    ; 6854   0001
        MVI@    R4,     R1                      ; 6855   02A1
        INCR    R1                              ; 6856   0009
        MVO     R1,     G_015E                  ; 6857   0241 015E
        SWAP    R1,     1                       ; 6859   0041
        MVO     R1,     G_015F                  ; 685A   0241 015F
        SWAP    R1,     1                       ; 685C   0041
        MVI     G_0160, R2                      ; 685D   0282 0160
        TSTR    R2                              ; 685F   0092
        BEQ     L_6869                          ; 6860   0204 0007

        MVII    #$0002, R3                      ; 6862   02BB 0002
        MVII    #$02D6, R4                      ; 6864   02BC 02D6

        JSR     R5,     L_65A2                  ; 6866   0004 0164 01A2

L_6869:
        PULR    R7                              ; 6869   02B7

L_686A:
        PSHR    R5                              ; 686A   0275
        MVI     G_01A5, R0                      ; 686B   0280 01A5
        TSTR    R0                              ; 686D   0080
        BNEQ    L_68AB                          ; 686E   020C 003B

        MVI     G_01AE, R0                      ; 6870   0280 01AE
        TSTR    R0                              ; 6872   0080
        BNEQ    L_68AB                          ; 6873   020C 0036

        MVII    #$01BF, R4                      ; 6875   02BC 01BF
        MVI@    R4,     R0                      ; 6877   02A0
        SWAP    R0,     1                       ; 6878   0040
        SAR     R0,     2                       ; 6879   006C
        SAR     R0,     2                       ; 687A   006C
        SAR     R0,     1                       ; 687B   0068
        MOVR    R4,     R3                      ; 687C   00A3
        SDBD                                    ; 687D   0001
        ADD@    R4,     R0                      ; 687E   02E0
        MVO@    R0,     R3                      ; 687F   0258
        SWAP    R0,     1                       ; 6880   0040
        MOVR    R0,     R2                      ; 6881   0082
        INCR    R3                              ; 6882   000B
        SUB@    R3,     R0                      ; 6883   0318
        MOVR    R2,     R1                      ; 6884   0091
        ANDI    #$0007, R1                      ; 6885   03B9 0007
        MVO@    R1,     R3                      ; 6887   0259
        XORR    R1,     R2                      ; 6888   01CA
        MVII    #$01C4, R5                      ; 6889   02BD 01C4
        MVO@    R2,     R5                      ; 688B   026A
        SUBR    R0,     R2                      ; 688C   0102
        INCR    R5                              ; 688D   000D
        MVO@    R2,     R5                      ; 688E   026A
        MVII    #$0003, R3                      ; 688F   02BB 0003
        MVO@    R3,     R5                      ; 6891   026B
        MVII    #$0100, R5                      ; 6892   02BD 0100
        MVI@    R5,     R0                      ; 6894   02A8
        MVO@    R0,     R4                      ; 6895   0260
        MVI@    R5,     R0                      ; 6896   02A8
        MVO@    R0,     R4                      ; 6897   0260
        MVII    #$00AC, R0                      ; 6898   02B8 00AC
        MVII    #$0068, R1                      ; 689A   02B9 0068
        MVO     R0,     .ISRVEC.0               ; 689C   0240 0100
        MVO     R1,     .ISRVEC.1               ; 689E   0241 0101
L_68A0:
        EIS                                     ; 68A0   0002
        MVI     G_01C7, R2                      ; 68A1   0282 01C7
        SARC    R2,     2                       ; 68A3   007E
        BC      L_68A0                          ; 68A4   0221 0005
        BNOV    L_68AB                          ; 68A6   020A 0003

        JSR     R5,     L_6387                  ; 68A8   0004 0160 0387

L_68AB:
        PULR    R7                              ; 68AB   02B7

        PSHR    R5                              ; 68AC   0275
        MVII    #$0320, R2                      ; 68AD   02BA 0320
        MVII    #$0008, R3                      ; 68AF   02BB 0008
L_68B1:
        MVII    #$01C5, R5                      ; 68B1   02BD 01C5
        MVI@    R2,     R0                      ; 68B3   0290
        SDBD                                    ; 68B4   0001
        ADD@    R5,     R0                      ; 68B5   02E8
        MVO@    R0,     R2                      ; 68B6   0250
        MVI@    R3,     R0                      ; 68B7   0298
        MOVR    R0,     R1                      ; 68B8   0081
        ANDI    #$007F, R1                      ; 68B9   03B9 007F
        XORR    R1,     R0                      ; 68BB   01C8
        DECR    R5                              ; 68BC   0015
        ADD@    R5,     R1                      ; 68BD   02E9
        ANDI    #$007F, R1                      ; 68BE   03B9 007F
        XORR    R1,     R0                      ; 68C0   01C8
        MVO@    R0,     R3                      ; 68C1   0258
        ADDI    #$0008, R2                      ; 68C2   02FA 0008
        INCR    R3                              ; 68C4   000B
        CMPI    #$0010, R3                      ; 68C5   037B 0010
        BNEQ    L_68B1                          ; 68C7   022C 0017

        MVI     G_01C1, R0                      ; 68C9   0280 01C1
        MVO     R0,     .STIC.VDLY              ; 68CB   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 68CD   0240 0020
        MVI     G_01C2, R0                      ; 68CF   0280 01C2
        MVI     G_01C3, R1                      ; 68D1   0281 01C3
        MVO     R0,     .ISRVEC.0               ; 68D3   0240 0100
        MVO     R1,     .ISRVEC.1               ; 68D5   0241 0101
        CLRR    R2                              ; 68D7   01D2
        MVI     G_01C4, R0                      ; 68D8   0280 01C4
        TSTR    R0                              ; 68DA   0080
        BEQ     L_68EB                          ; 68DB   0204 000E

        MVII    #$0200, R5                      ; 68DD   02BD 0200
        MVII    #$0214, R4                      ; 68DF   02BC 0214
L_68E1:
        MVI@    R4,     R0                      ; 68E1   02A0
        MVO@    R0,     R5                      ; 68E2   0268
        CMPI    #$02DC, R5                      ; 68E3   037D 02DC
        BNEQ    L_68E1                          ; 68E5   022C 0005

        MVII    #$0002, R2                      ; 68E7   02BA 0002
        MVII    #$0002, R0                      ; 68E9   02B8 0002
L_68EB:
        SLL     R2,     2                       ; 68EB   004E
        XORR    R0,     R2                      ; 68EC   01C2
        MVO     R2,     G_01C7                  ; 68ED   0242 01C7

        JSR     R5,     X_PLAY_NOTE             ; 68EF   0004 0118 02BD

        PULR    R7                              ; 68F2   02B7

L_68F3:
        PSHR    R5                              ; 68F3   0275
        SUBI    #$000C, R0                      ; 68F4   0338 000C
        BMI     L_68FF                          ; 68F6   020B 0007

        CMPI    #$0018, R0                      ; 68F8   0378 0018
        BMI     L_6909                          ; 68FA   020B 000D

        SUBI    #$0018, R0                      ; 68FC   0338 0018
        INCR    R7                              ; 68FE   000F

L_68FF:
        NEGR    R0                              ; 68FF   0020
L_6900:
        B       L_691C                          ; 6900   0200 001A

L_6902:
        PSHR    R5                              ; 6902   0275
        CMPI    #$0018, R0                      ; 6903   0378 0018
        BMI     L_691C                          ; 6905   020B 0015

        SUBI    #$0018, R0                      ; 6907   0338 0018

L_6909:
        JSR     R5,     L_691B                  ; 6909   0004 0168 011B

        NEGR    R0                              ; 690C   0020
        PULR    R7                              ; 690D   02B7

        DECLE   $0000,  $0021,  $0042,  $0062   ; 690E   0000 0021 0042 0062
        DECLE   $0080,  $009C,  $00B5,  $00CB   ; 6912   0080 009C 00B5 00CB
        DECLE   $00DE,  $00ED,  $00F7           ; 6916   00DE 00ED 00F7

        ADDR    R7,     R6                      ; 6919   00FE
        SUBR    R0,     R0                      ; 691A   0100
L_691B:
        PSHR    R5                              ; 691B   0275
L_691C:
        PSHR    R1                              ; 691C   0271
        MOVR    R0,     R1                      ; 691D   0081
        CMPI    #$000C, R1                      ; 691E   0379 000C
        BMI     L_6925                          ; 6920   020B 0003

        SUBI    #$0018, R1                      ; 6922   0339 0018
        NEGR    R1                              ; 6924   0021
L_6925:
        SDBD                                    ; 6925   0001
        ADDI    #$690E, R1                      ; 6926   02F9 000E 0069
        MVI@    R1,     R0                      ; 6929   0288
        PULR    R1                              ; 692A   02B1
        PULR    R7                              ; 692B   02B7

L_692C:
        PSHR    R5                              ; 692C   0275
        MVI     G_0164, R4                      ; 692D   0284 0164
        ADD     G_0163, R4                      ; 692F   02C4 0163
        BNEQ    L_6942                          ; 6931   020C 000F

        MVII    #$016B, R2                      ; 6933   02BA 016B
        MVI     G_0121, R0                      ; 6935   0280 0121
        MVI     G_0122, R5                      ; 6937   0285 0122
        MVI     G_016A, R1                      ; 6939   0281 016A
        DECR    R0                              ; 693B   0010
        BEQ     L_6943                          ; 693C   0204 0005

        DECR    R5                              ; 693E   0015
        BEQ     L_6943                          ; 693F   0204 0002

        MVO@    R1,     R2                      ; 6941   0251
L_6942:
        PULR    R7                              ; 6942   02B7

L_6943:
        DECR    R4                              ; 6943   0014
        MVI@    R2,     R3                      ; 6944   0293
        SUB@    R2,     R1                      ; 6945   0311
        BEQ     L_6942                          ; 6946   0224 0005
        BPL     L_694C                          ; 6948   0203 0002

        NEGR    R1                              ; 694A   0021
        NEGR    R4                              ; 694B   0024
L_694C:
        CMPI    #$0018, R1                      ; 694C   0379 0018
        BLT     L_6951                          ; 694E   0205 0001

        NEGR    R4                              ; 6950   0024
L_6951:
        SUBR    R4,     R3                      ; 6951   0123
        BMI     L_6958                          ; 6952   020B 0004

        SUBI    #$0030, R3                      ; 6954   033B 0030
        BGE     L_695A                          ; 6956   020D 0002

L_6958:
        ADDI    #$0030, R3                      ; 6958   02FB 0030
L_695A:
        MVO@    R3,     R2                      ; 695A   0253
        MVI     G_016D, R4                      ; 695B   0284 016D
        SUB     G_0169, R4                      ; 695D   0304 0169
        SUBI    #$001F, R1                      ; 695F   0339 001F
        ANDR    R1,     R4                      ; 6961   018C
        ADDI    #$000E, R1                      ; 6962   02F9 000E
        NEGR    R1                              ; 6964   0021
        ANDR    R1,     R4                      ; 6965   018C
        BPL     L_6942                          ; 6966   0223 0025

        JSR     R5,     L_65F8                  ; 6968   0004 0164 01F8
        JSR     R5,     L_6058                  ; 696B   0004 0160 0058

L_696E:
        PSHR    R5                              ; 696E   0275
        MVII    #$00F0, R0                      ; 696F   02B8 00F0
        MVII    #$0200, R4                      ; 6971   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 6973   0004 0114 0338

        PULR    R7                              ; 6976   02B7

        SUBI    #$0008, R6                      ; 6977   033E 0008
        MVO     R1,     .ISRVEC.0               ; 6979   0241 0100
        MVO     R2,     .ISRVEC.1               ; 697B   0242 0101
        PULR    R2                              ; 697D   02B2
        PULR    R7                              ; 697E   02B7

L_697F:
        PSHR    R5                              ; 697F   0275
        PSHR    R2                              ; 6980   0272
        MVI     .ISRVEC.0,R1                    ; 6981   0281 0100
        MVI     .ISRVEC.1,R2                    ; 6983   0282 0101
        SDBD                                    ; 6985   0001
        MVII    #$6977, R0                      ; 6986   02B8 0077 0069
        MVO     R0,     .ISRVEC.0               ; 6989   0240 0100
        SWAP    R0,     1                       ; 698B   0040
        MVO     R0,     .ISRVEC.1               ; 698C   0240 0101
L_698E:
        DECR    R7                              ; 698E   0017

L_698F:
        MVI@    R5,     R0                      ; 698F   02A8
        MVI@    R5,     R1                      ; 6990   02A9
        MVO     R0,     .ISRVEC.0               ; 6991   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6993   0241 0101
        MOVR    R5,     R7                      ; 6995   00AF

        SDBD                                    ; 6996   0001
        MVI@    R5,     R2                      ; 6997   02AA
        MVI@    R5,     R4                      ; 6998   02AC
L_6999:
        PSHR    R5                              ; 6999   0275
        MOVR    R2,     R5                      ; 699A   0095
        MOVR    R0,     R2                      ; 699B   0082
        ANDI    #$000F, R2                      ; 699C   03BA 000F
        SLL     R2,     1                       ; 699E   004A
        SLR     R0,     2                       ; 699F   0064
        SLR     R0,     2                       ; 69A0   0064
        SUBI    #$0022, R2                      ; 69A1   033A 0022
        SUBR    R2,     R7                      ; 69A3   0117

        PSHR    R5                              ; 69A4   0275
        MOVR    R2,     R5                      ; 69A5   0095
L_69A6:
        MVI@    R5,     R1                      ; 69A6   02A9
        MVO@    R1,     R4                      ; 69A7   0261
        MVI@    R5,     R1                      ; 69A8   02A9
        MVO@    R1,     R4                      ; 69A9   0261
        MVI@    R5,     R1                      ; 69AA   02A9
        MVO@    R1,     R4                      ; 69AB   0261
        MVI@    R5,     R1                      ; 69AC   02A9
        MVO@    R1,     R4                      ; 69AD   0261
        MVI@    R5,     R1                      ; 69AE   02A9
        MVO@    R1,     R4                      ; 69AF   0261
        MVI@    R5,     R1                      ; 69B0   02A9
        MVO@    R1,     R4                      ; 69B1   0261
        MVI@    R5,     R1                      ; 69B2   02A9
        MVO@    R1,     R4                      ; 69B3   0261
        MVI@    R5,     R1                      ; 69B4   02A9
        MVO@    R1,     R4                      ; 69B5   0261
        MVI@    R5,     R1                      ; 69B6   02A9
        MVO@    R1,     R4                      ; 69B7   0261
        MVI@    R5,     R1                      ; 69B8   02A9
        MVO@    R1,     R4                      ; 69B9   0261
        MVI@    R5,     R1                      ; 69BA   02A9
        MVO@    R1,     R4                      ; 69BB   0261
        MVI@    R5,     R1                      ; 69BC   02A9
        MVO@    R1,     R4                      ; 69BD   0261
        MVI@    R5,     R1                      ; 69BE   02A9
        MVO@    R1,     R4                      ; 69BF   0261
        MVI@    R5,     R1                      ; 69C0   02A9
        MVO@    R1,     R4                      ; 69C1   0261
        MVI@    R5,     R1                      ; 69C2   02A9
        MVO@    R1,     R4                      ; 69C3   0261
        MVI@    R5,     R1                      ; 69C4   02A9
        MVO@    R1,     R4                      ; 69C5   0261
        DECR    R0                              ; 69C6   0010
        BPL     L_69A6                          ; 69C7   0223 0022
        PULR    R7                              ; 69C9   02B7

        DECLE   $00F4,  $0069,  $0008,  $006A   ; 69CA   00F4 0069 0008 006A
        DECLE   $001C,  $006A,  $0030,  $006A   ; 69CE   001C 006A 0030 006A
        DECLE   $0044,  $006A,  $0058,  $006A   ; 69D2   0044 006A 0058 006A
        DECLE   $006C,  $006A,  $0080,  $006C   ; 69D6   006C 006A 0080 006C
        DECLE   $0094,  $006C,  $00A8,  $006C   ; 69DA   0094 006C 00A8 006C
        DECLE   $00BC,  $006C,  $00D0,  $006C   ; 69DE   00BC 006C 00D0 006C
        DECLE   $0080,  $006A,  $0094,  $006A   ; 69E2   0080 006A 0094 006A
        DECLE   $0003,  $0002,  $0003,  $0003   ; 69E6   0003 0002 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 69EA   0003 0003 0003 0003
        DECLE   $0004,  $0003,  $0003,  $0003   ; 69EE   0004 0003 0003 0003
        DECLE   $0003,  $0003,  $0059,  $006C   ; 69F2   0003 0003 0059 006C
        DECLE   $005C,  $006C,  $0061,  $006C   ; 69F6   005C 006C 0061 006C
        DECLE   $0065,  $006C,  $0068,  $006C   ; 69FA   0065 006C 0068 006C
        DECLE   $006D,  $006C,  $0070,  $006C   ; 69FE   006D 006C 0070 006C
        DECLE   $0074,  $006C,  $0078,  $006C   ; 6A02   0074 006C 0078 006C
        DECLE   $007B,  $006C,  $002A,  $006C   ; 6A06   007B 006C 002A 006C
        DECLE   $002E,  $006C,  $0031,  $006C   ; 6A0A   002E 006C 0031 006C
        DECLE   $0037,  $006C,  $003E,  $006C   ; 6A0E   0037 006C 003E 006C
        DECLE   $0043,  $006C,  $0048,  $006C   ; 6A12   0043 006C 0048 006C
        DECLE   $004D,  $006C,  $0051,  $006C   ; 6A16   004D 006C 0051 006C
        DECLE   $0054,  $006C,  $00F9,  $006B   ; 6A1A   0054 006C 00F9 006B
        DECLE   $00FD,  $006B,  $0001           ; 6A1E   00FD 006B 0001

        SAR     R0,     2                       ; 6A21   006C
        CLRC                                    ; 6A22   0006
        SAR     R0,     2                       ; 6A23   006C
        INCR    R4                              ; 6A24   000C
        SAR     R0,     2                       ; 6A25   006C
        DECR    R2                              ; 6A26   0012
        SAR     R0,     2                       ; 6A27   006C
L_6A28:
        DECR    R7                              ; 6A28   0017

        SAR     R0,     2                       ; 6A29   006C
        COMR    R5                              ; 6A2A   001D
        SAR     R0,     2                       ; 6A2B   006C
        NEGR    R2                              ; 6A2C   0022
        SAR     R0,     2                       ; 6A2D   006C
        NEGR    R6                              ; 6A2E   0026
        SAR     R0,     2                       ; 6A2F   006C
        ADDR    R0,     R2                      ; 6A30   00C2
        SAR     R3,     1                       ; 6A31   006B
        ADDR    R0,     R7                      ; 6A32   00C7

        SAR     R3,     1                       ; 6A33   006B
        ADDR    R1,     R4                      ; 6A34   00CC
        SAR     R3,     1                       ; 6A35   006B
        ADDR    R2,     R1                      ; 6A36   00D1
        SAR     R3,     1                       ; 6A37   006B
        ADDR    R2,     R6                      ; 6A38   00D6
        SAR     R3,     1                       ; 6A39   006B
        ADDR    R3,     R3                      ; 6A3A   00DB
        SAR     R3,     1                       ; 6A3B   006B
        ADDR    R4,     R0                      ; 6A3C   00E0
        SAR     R3,     1                       ; 6A3D   006B
        ADDR    R4,     R7                      ; 6A3E   00E7

        SAR     R3,     1                       ; 6A3F   006B
        ADDR    R5,     R5                      ; 6A40   00ED
        SAR     R3,     1                       ; 6A41   006B
        ADDR    R6,     R4                      ; 6A42   00F4
        SAR     R3,     1                       ; 6A43   006B
        SARC    R0,     2                       ; 6A44   007C
        SAR     R3,     1                       ; 6A45   006B
        SARC    R3,     2                       ; 6A46   007F
        SAR     R3,     1                       ; 6A47   006B
        MOVR    R0,     R3                      ; 6A48   0083
        SAR     R3,     1                       ; 6A49   006B
        MOVR    R0,     R6                      ; 6A4A   0086
        SAR     R3,     1                       ; 6A4B   006B
        TSTR    R1                              ; 6A4C   0089
        SAR     R3,     1                       ; 6A4D   006B
        MOVR    R1,     R4                      ; 6A4E   008C
        SAR     R3,     1                       ; 6A4F   006B
        MOVR    R1,     R7                      ; 6A50   008F

        DECLE   $006B,  $0093,  $006B,  $0096   ; 6A51   006B 0093 006B 0096
        DECLE   $006B,  $0099,  $006B,  $003D   ; 6A55   006B 0099 006B 003D
        DECLE   $006B,  $0041,  $006B,  $0047   ; 6A59   006B 0041 006B 0047
        DECLE   $006B,  $0051,  $006B,  $005B   ; 6A5D   006B 0051 006B 005B
        DECLE   $006B,  $0061,  $006B,  $0064   ; 6A61   006B 0061 006B 0064
        DECLE   $006B,  $006A,  $006B,  $0072   ; 6A65   006B 006A 006B 0072
        DECLE   $006B,  $0077,  $006B,  $00F2   ; 6A69   006B 0077 006B 00F2
        DECLE   $006A,  $00F4,  $006A,  $00F7   ; 6A6D   006A 00F4 006A 00F7
        DECLE   $006A,  $00F9,  $006A,  $00FC   ; 6A71   006A 00F9 006A 00FC
        DECLE   $006A,  $00FF                   ; 6A75   006A 00FF

        SAR     R2,     1                       ; 6A77   006A
        DIS                                     ; 6A78   0003
        SAR     R3,     1                       ; 6A79   006B
        CLRC                                    ; 6A7A   0006
        SAR     R3,     1                       ; 6A7B   006B
        INCR    R1                              ; 6A7C   0009
        SAR     R3,     1                       ; 6A7D   006B
        INCR    R3                              ; 6A7E   000B
        SAR     R3,     1                       ; 6A7F   006B
        MOVR    R3,     R5                      ; 6A80   009D
        SAR     R3,     1                       ; 6A81   006B
        MOVR    R4,     R0                      ; 6A82   00A0
        SAR     R3,     1                       ; 6A83   006B
        TSTR    R4                              ; 6A84   00A4
        SAR     R3,     1                       ; 6A85   006B
        MOVR    R4,     R7                      ; 6A86   00A7

        SAR     R3,     1                       ; 6A87   006B
        MOVR    R5,     R3                      ; 6A88   00AB
        SAR     R3,     1                       ; 6A89   006B
        MOVR    R5,     R7                      ; 6A8A   00AF

        DECLE   $006B,  $00B3,  $006B,  $00B7   ; 6A8B   006B 00B3 006B 00B7
        DECLE   $006B,  $00BA,  $006B,  $00BE   ; 6A8F   006B 00BA 006B 00BE
        DECLE   $006B,  $000E,  $006B,  $0012   ; 6A93   006B 000E 006B 0012
        DECLE   $006B,  $0016,  $006B,  $001B   ; 6A97   006B 0016 006B 001B
        DECLE   $006B,  $0021,  $006B,  $0027   ; 6A9B   006B 0021 006B 0027
        DECLE   $006B,  $002D,  $006B,  $0031   ; 6A9F   006B 002D 006B 0031
        DECLE   $006B,  $0035,  $006B,  $0038   ; 6AA3   006B 0035 006B 0038
        DECLE   $006B,  $0000,  $0000,  $0000   ; 6AA7   006B 0000 0000 0000
        DECLE   $0000,  $0034,  $0024,  $003C   ; 6AAB   0000 0034 0024 003C
        DECLE   $0044,  $0014,  $001C,  $002C   ; 6AAF   0044 0014 001C 002C
        DECLE   $004C,  $0035,  $0025,  $003D   ; 6AB3   004C 0035 0025 003D
        DECLE   $005D,  $002D,  $001D,  $0055   ; 6AB7   005D 002D 001D 0055
        DECLE   $0045,  $0015,  $001D,  $002D   ; 6ABB   0045 0015 001D 002D
        DECLE   $004D,  $0004,  $0044,  $0014   ; 6ABF   004D 0004 0044 0014
        DECLE   $004C,  $007E,  $0086,  $0086   ; 6AC3   004C 007E 0086 0086
        DECLE   $0066,  $006E,  $0076,  $007E   ; 6AC7   0066 006E 0076 007E
        DECLE   $008E,  $006E,  $008E,  $0091   ; 6ACB   008E 006E 008E 0091
        DECLE   $0091,  $0000,  $0091,  $0091   ; 6ACF   0091 0000 0091 0091
        DECLE   $0000,  $0000                   ; 6AD3   0000 0000

        ADDR    R0,     R3                      ; 6AD5   00C3
        MOVR    R6,     R1                      ; 6AD6   00B1
        MOVR    R4,     R1                      ; 6AD7   00A1
        MOVR    R7,     R1                      ; 6AD8   00B9
        MOVR    R5,     R1                      ; 6AD9   00A9
        MOVR    R5,     R1                      ; 6ADA   00A9
        MOVR    R5,     R1                      ; 6ADB   00A9
        ADDR    R7,     R2                      ; 6ADC   00FA
        ADDR    R3,     R7                      ; 6ADD   00DF
        ADDR    R3,     R7                      ; 6ADE   00DF

        SUBR    R0,     R2                      ; 6ADF   0102
        ADDR    R3,     R7                      ; 6AE0   00DF
        ADDR    R3,     R7                      ; 6AE1   00DF

        DECLE   $00CB,  $00C3,  $00CB,  $00D3   ; 6AE2   00CB 00C3 00CB 00D3
        DECLE   $0000,  $0000,  $0000,  $010B   ; 6AE6   0000 0000 0000 010B
        DECLE   $010B,  $0113,  $0113,  $0000   ; 6AEA   010B 0113 0113 0000
        DECLE   $0000,  $00FA,  $0102,  $0000   ; 6AEE   0000 00FA 0102 0000
        DECLE   $00E2,  $00A1,  $0066,  $00E1   ; 6AF2   00E2 00A1 0066 00E1
        DECLE   $0061,  $00C2,  $00C1,  $00E1   ; 6AF6   0061 00C2 00C1 00E1
        DECLE   $00A6,  $0021,  $009A,  $007A   ; 6AFA   00A6 0021 009A 007A
        DECLE   $0081,  $009C,  $007C,  $0026   ; 6AFE   0081 009C 007C 0026
        DECLE   $0021,  $009B,  $007B,  $005A   ; 6B02   0021 009B 007B 005A
        DECLE   $0042,  $00A1,  $007C,  $00E1   ; 6B06   0042 00A1 007C 00E1
        DECLE   $00DB,  $00E0,  $00E1,  $00FF   ; 6B0A   00DB 00E0 00E1 00FF
        DECLE   $00C1,  $00A6,  $0042,  $0021   ; 6B0E   00C1 00A6 0042 0021
        DECLE   $0089,  $00BA,  $0037,  $007A   ; 6B12   0089 00BA 0037 007A
        DECLE   $00E0,  $007C,  $0037,  $0037   ; 6B16   00E0 007C 0037 0037
        DECLE   $005C,  $00B9,  $0038,  $005A   ; 6B1A   005C 00B9 0038 005A
        DECLE   $003B,  $0057,  $005B,  $0099   ; 6B1E   003B 0057 005B 0099
        DECLE   $0038,  $0039,  $005C,  $00E0   ; 6B22   0038 0039 005C 00E0
        DECLE   $0021,  $0098,  $0039,  $0038   ; 6B26   0021 0098 0039 0038
        DECLE   $005B,  $0049,  $00A1,  $0098   ; 6B2A   005B 0049 00A1 0098
        DECLE   $0029,  $00C6,  $0081,  $00E1   ; 6B2E   0029 00C6 0081 00E1
        DECLE   $0042,  $0089,  $0021,  $0022   ; 6B32   0042 0089 0021 0022
        DECLE   $00E1,  $00E0,  $00C1,  $0062   ; 6B36   00E1 00E0 00C1 0062
        DECLE   $0061,  $0081,  $00FF,  $0026   ; 6B3A   0061 0081 00FF 0026
        DECLE   $00C2,  $00CC,  $0021,  $005D   ; 6B3E   00C2 00CC 0021 005D
        DECLE   $0036,  $002C,  $0069,  $00AC   ; 6B42   0036 002C 0069 00AC
        DECLE   $0081,  $007E,  $003D,  $0036   ; 6B46   0081 007E 003D 0036
        DECLE   $002C,  $005D,  $005D,  $00BD   ; 6B4A   002C 005D 005D 00BD
        DECLE   $0036,  $002C,  $0081,  $009D   ; 6B4E   0036 002C 0081 009D
        DECLE   $005E,  $0036,  $003D,  $005A   ; 6B52   005E 0036 003D 005A
        DECLE   $003D,  $0036,  $006C,  $005E   ; 6B56   003D 0036 006C 005E
        DECLE   $005E,  $007A,  $00BC,  $005D   ; 6B5A   005E 007A 00BC 005D
        DECLE   $0036,  $003E,  $005A,  $007C   ; 6B5E   0036 003E 005A 007C
        DECLE   $00BB,  $00DC,  $007B,  $0036   ; 6B62   00BB 00DC 007B 0036
        DECLE   $0036,  $003E,  $0096,  $00DB   ; 6B66   0036 003E 0096 00DB
        DECLE   $0069,  $003E,  $0076,  $005E   ; 6B6A   0069 003E 0076 005E
        DECLE   $00D6,  $0036,  $003E,  $0036   ; 6B6E   00D6 0036 003E 0036
        DECLE   $00A2,  $008C,  $0049,  $003E   ; 6B72   00A2 008C 0049 003E
        DECLE   $007E,  $0046,  $00A2,  $0062   ; 6B76   007E 0046 00A2 0062
        DECLE   $0041,  $00FF,  $0082,  $00E2   ; 6B7A   0041 00FF 0082 00E2
        DECLE   $0061,  $0082,  $00BA,  $0022   ; 6B7E   0061 0082 00BA 0022
        DECLE   $0041,  $0042,  $00FC,  $00C1   ; 6B82   0041 0042 00FC 00C1
        DECLE   $00BA,  $00BB,  $009A,  $00BC   ; 6B86   00BA 00BB 009A 00BC
        DECLE   $00E1,  $009C,  $00BB,  $00C6   ; 6B8A   00E1 009C 00BB 00C6
        DECLE   $007B,  $00E1,  $0042,  $0086   ; 6B8E   007B 00E1 0042 0086
        DECLE   $0041,  $0082,  $00E1,  $00C1   ; 6B92   0041 0082 00E1 00C1
        DECLE   $0022,  $00E2,  $00C1,  $0062   ; 6B96   0022 00E2 00C1 0062
        DECLE   $00E1,  $00E1,  $00FF,  $00A2   ; 6B9A   00E1 00E1 00FF 00A2
        DECLE   $00E1,  $0022,  $0029,  $0082   ; 6B9E   00E1 0022 0029 0082
        DECLE   $00E1,  $0061,  $009A,  $0062   ; 6BA2   00E1 0061 009A 0062
        DECLE   $00E1,  $009C,  $0051,  $0066   ; 6BA6   00E1 009C 0051 0066
        DECLE   $0062,  $009B,  $004F,  $00A9   ; 6BAA   0062 009B 004F 00A9
        DECLE   $0081,  $0069,  $0072,  $0082   ; 6BAE   0081 0069 0072 0082
        DECLE   $005A,  $0062,  $0050,  $007A   ; 6BB2   005A 0062 0050 007A
        DECLE   $009C,  $0082,  $009C,  $009B   ; 6BB6   009C 0082 009C 009B
        DECLE   $00C6,  $007B,  $0042,  $0021   ; 6BBA   00C6 007B 0042 0021
        DECLE   $00E1,  $0042,  $00E1,  $00FF   ; 6BBE   00E1 0042 00E1 00FF
        DECLE   $00A1,  $00E1,  $0022,  $0066   ; 6BC2   00A1 00E1 0022 0066
        DECLE   $0042,  $00A6,  $007A,  $0046   ; 6BC6   0042 00A6 007A 0046
        DECLE   $00E1,  $0061,  $00A1,  $00BC   ; 6BCA   00E1 0061 00A1 00BC
        DECLE   $00A9,  $0062,  $0021,  $00C1   ; 6BCE   00A9 0062 0021 00C1
        DECLE   $009B,  $0042,  $0062,  $0061   ; 6BD2   009B 0042 0062 0061
        DECLE   $009A,  $00E1,  $00E1,  $0066   ; 6BD6   009A 00E1 00E1 0066
        DECLE   $0021,  $009C,  $0066,  $00E1   ; 6BDA   0021 009C 0066 00E1
        DECLE   $0066,  $0041,  $009B,  $0022   ; 6BDE   0066 0041 009B 0022
        DECLE   $00FA,  $0053,  $0033,  $0053   ; 6BE2   00FA 0053 0033 0053
        DECLE   $0041,  $00E2,  $00FC,  $0053   ; 6BE6   0041 00E2 00FC 0053
        DECLE   $0033,  $0054,  $0041,  $0086   ; 6BEA   0033 0054 0041 0086
        DECLE   $00E1,  $009B,  $0054,  $0033   ; 6BEE   00E1 009B 0054 0033
        DECLE   $0054,  $0041,  $00E2,  $00E1   ; 6BF2   0054 0041 00E2 00E1
        DECLE   $0082,  $0041,  $00FF           ; 6BF6   0082 0041 00FF

        SLR     R2,     2                       ; 6BF9   0066
        ADDR    R4,     R1                      ; 6BFA   00E1
        SWAP    R2,     1                       ; 6BFB   0042
        TSTR    R1                              ; 6BFC   0089
        SWAP    R1,     1                       ; 6BFD   0041
        ADDR    R4,     R6                      ; 6BFE   00E6
        ADDR    R4,     R1                      ; 6BFF   00E1
        SWAP    R2,     1                       ; 6C00   0042
        SWAP    R1,     1                       ; 6C01   0041
        MOVR    R3,     R2                      ; 6C02   009A
        SWAP    R2,     1                       ; 6C03   0042
        ADDR    R4,     R1                      ; 6C04   00E1
        SLR     R1,     1                       ; 6C05   0061
        SWAP    R1,     1                       ; 6C06   0041
        MOVR    R3,     R4                      ; 6C07   009C
        ADCR    R6                              ; 6C08   002E
        ADDR    R4,     R1                      ; 6C09   00E1
        SLR     R2,     2                       ; 6C0A   0066
        SWAP    R1,     1                       ; 6C0B   0041
        SLR     R1,     1                       ; 6C0C   0061
        SARC    R3,     1                       ; 6C0D   007B
        ADCR    R7                              ; 6C0E   002F

        SARC    R2,     1                       ; 6C0F   007A
L_6C10:
        RLC     R1,     1                       ; 6C10   0051
        DECLE   $0062,  $0086,  $0070,  $007C   ; 6C11   0062 0086 0070 007C
        DECLE   $004F,  $00E1,  $0042,  $0081   ; 6C15   004F 00E1 0042 0081
        DECLE   $007B,  $0052,  $009A,  $0021   ; 6C19   007B 0052 009A 0021
        DECLE   $00A1,  $0022,  $00F0,  $009C   ; 6C1D   00A1 0022 00F0 009C
        DECLE   $0021,  $00E1,  $00C9,  $00BB   ; 6C21   0021 00E1 00C9 00BB
        DECLE   $0021,  $00E1,  $00E2,  $00C1   ; 6C25   0021 00E1 00E2 00C1
        DECLE   $00FF,  $0066,  $00E1,  $0062   ; 6C29   00FF 0066 00E1 0062
        DECLE   $0041,  $00E1,  $00FA,  $0081   ; 6C2D   0041 00E1 00FA 0081
        DECLE   $00C1,  $0046,  $009C,  $0034   ; 6C31   00C1 0046 009C 0034
        DECLE   $0033,  $0041,  $0042,  $0081   ; 6C35   0033 0041 0042 0081
        DECLE   $004E,  $007B,  $0034,  $0033   ; 6C39   004E 007B 0034 0033
        DECLE   $0053,  $00FA,  $004F,  $00D4   ; 6C3D   0053 00FA 004F 00D4
        DECLE   $0033,  $0053,  $0041,  $00BC   ; 6C41   0033 0053 0041 00BC
        DECLE   $0050,  $00A6,  $0053,  $0041   ; 6C45   0050 00A6 0053 0041
        DECLE   $00BB,  $00E1,  $0026,  $0021   ; 6C49   00BB 00E1 0026 0021
        DECLE   $0041,  $00A2,  $00A2,  $0061   ; 6C4D   0041 00A2 00A2 0061
        DECLE   $00A2,  $00E1,  $00A1,  $0042   ; 6C51   00A2 00E1 00A1 0042
        DECLE   $00E1,  $0089,  $0041,  $00FF   ; 6C55   00E1 0089 0041 00FF

        ADDR    R4,     R6                      ; 6C59   00E6
        ADDR    R4,     R1                      ; 6C5A   00E1
L_6C5B:
        ADDR    R4,     R1                      ; 6C5B   00E1
        DECLE   $0042,  $005A,  $0042,  $00E1   ; 6C5C   0042 005A 0042 00E1
        DECLE   $0081,  $00FC,  $00E1,  $0066   ; 6C60   0081 00FC 00E1 0066
        DECLE   $0041,  $00FB,  $00DA,  $00C1   ; 6C64   0041 00FB 00DA 00C1
        DECLE   $00E1,  $00E1,  $003C,  $0066   ; 6C68   00E1 00E1 003C 0066
        DECLE   $0021,  $00C2,  $00DB,  $00C1   ; 6C6C   0021 00C2 00DB 00C1
        DECLE   $00E1,  $0089,  $0081,  $009A   ; 6C70   00E1 0089 0081 009A
        DECLE   $0042,  $00C1,  $00E1,  $007C   ; 6C74   0042 00C1 00E1 007C
        DECLE   $00E1,  $00E1,  $00FB,  $00E1   ; 6C78   00E1 00E1 00FB 00E1
        DECLE   $00E1,  $0082,  $0041,  $00FF   ; 6C7C   00E1 0082 0041 00FF

        ADDR    R4,     R4                      ; 6C80   00E4
        SAR     R0,     2                       ; 6C81   006C
        ADDR    R5,     R1                      ; 6C82   00E9
        SAR     R0,     2                       ; 6C83   006C
        ADDR    R5,     R7                      ; 6C84   00EF

        SAR     R0,     2                       ; 6C85   006C
        ADDR    R6,     R6                      ; 6C86   00F6
        SAR     R0,     2                       ; 6C87   006C
        ADDR    R7,     R5                      ; 6C88   00FD
        SAR     R0,     2                       ; 6C89   006C
        SETC                                    ; 6C8A   0007
        SAR     R1,     2                       ; 6C8B   006D
        DECR    R0                              ; 6C8C   0010
        SAR     R1,     2                       ; 6C8D   006D
        COMR    R1                              ; 6C8E   0019
        SAR     R1,     2                       ; 6C8F   006D
        NEGR    R3                              ; 6C90   0023
        SAR     R1,     2                       ; 6C91   006D
        ADCR    R3                              ; 6C92   002B
        SAR     R1,     2                       ; 6C93   006D
        GSWD    R2                              ; 6C94   0032
        SAR     R1,     2                       ; 6C95   006D
        RSWD    R1                              ; 6C96   0039
        SAR     R1,     2                       ; 6C97   006D
        SWAP    R1,     1                       ; 6C98   0041
        SAR     R1,     2                       ; 6C99   006D
        SLL     R3,     1                       ; 6C9A   004B
        SAR     R1,     2                       ; 6C9B   006D
        RLC     R1,     2                       ; 6C9C   0055
        SAR     R1,     2                       ; 6C9D   006D
        SLLC    R2,     2                       ; 6C9E   005E
        SAR     R1,     2                       ; 6C9F   006D
        SLR     R2,     2                       ; 6CA0   0066
        SAR     R1,     2                       ; 6CA1   006D
        SAR     R3,     2                       ; 6CA2   006F
        SAR     R1,     2                       ; 6CA3   006D
        SARC    R0,     1                       ; 6CA4   0078
        SAR     R1,     2                       ; 6CA5   006D
        MOVR    R0,     R1                      ; 6CA6   0081
        SAR     R1,     2                       ; 6CA7   006D
        MOVR    R1,     R0                      ; 6CA8   0088
        SAR     R1,     2                       ; 6CA9   006D
        MOVR    R1,     R3                      ; 6CAA   008B
        SAR     R1,     2                       ; 6CAB   006D
        MOVR    R1,     R6                      ; 6CAC   008E
        SAR     R1,     2                       ; 6CAD   006D
        MOVR    R2,     R4                      ; 6CAE   0094
        SAR     R1,     2                       ; 6CAF   006D
        MOVR    R2,     R7                      ; 6CB0   0097

        SAR     R1,     2                       ; 6CB1   006D
        MOVR    R3,     R2                      ; 6CB2   009A
        SAR     R1,     2                       ; 6CB3   006D
        MOVR    R4,     R0                      ; 6CB4   00A0
        SAR     R1,     2                       ; 6CB5   006D
        MOVR    R5,     R0                      ; 6CB6   00A8
        SAR     R1,     2                       ; 6CB7   006D
        MOVR    R5,     R6                      ; 6CB8   00AE
        SAR     R1,     2                       ; 6CB9   006D
        MOVR    R6,     R1                      ; 6CBA   00B1
        SAR     R1,     2                       ; 6CBB   006D
        MOVR    R6,     R5                      ; 6CBC   00B5
        SAR     R1,     2                       ; 6CBD   006D
        MOVR    R7,     R0                      ; 6CBE   00B8
        SAR     R1,     2                       ; 6CBF   006D
        MOVR    R7,     R4                      ; 6CC0   00BC
        SAR     R1,     2                       ; 6CC1   006D
        ADDR    R0,     R1                      ; 6CC2   00C1
        SAR     R1,     2                       ; 6CC3   006D
        ADDR    R1,     R0                      ; 6CC4   00C8
        SAR     R1,     2                       ; 6CC5   006D
        ADDR    R1,     R7                      ; 6CC6   00CF

        DECLE   $006D,  $00D5,  $006D,  $00DA   ; 6CC7   006D 00D5 006D 00DA
        DECLE   $006D,  $00DE,  $006D,  $00E2   ; 6CCB   006D 00DE 006D 00E2
        DECLE   $006D,  $00E6,  $006D,  $00E9   ; 6CCF   006D 00E6 006D 00E9
        DECLE   $006D,  $00ED,  $006D,  $00F2   ; 6CD3   006D 00ED 006D 00F2
        DECLE   $006D,  $00F9,  $006D,  $0000   ; 6CD7   006D 00F9 006D 0000

        SAR     R2,     2                       ; 6CDB   006E
        CLRC                                    ; 6CDC   0006
        SAR     R2,     2                       ; 6CDD   006E
        INCR    R3                              ; 6CDE   000B
        SAR     R2,     2                       ; 6CDF   006E
        INCR    R7                              ; 6CE0   000F

        SAR     R2,     2                       ; 6CE1   006E
L_6CE2:
        DECR    R3                              ; 6CE2   0013
        SAR     R2,     2                       ; 6CE3   006E
        MOVR    R0,     R6                      ; 6CE4   0086
        ADDR    R0,     R2                      ; 6CE5   00C2
        SLR     R2,     1                       ; 6CE6   0062
        SLR     R2,     1                       ; 6CE7   0062
        MOVR    R1,     R4                      ; 6CE8   008C
        SWAP    R2,     1                       ; 6CE9   0042
        SLR     R2,     2                       ; 6CEA   0066
        ADDR    R0,     R2                      ; 6CEB   00C2
        TSTR    R1                              ; 6CEC   0089
        SLR     R2,     2                       ; 6CED   0066
        SWAP    R1,     1                       ; 6CEE   0041
        MOVR    R0,     R2                      ; 6CEF   0082
        MOVR    R6,     R1                      ; 6CF0   00B1
        SAR     R0,     2                       ; 6CF1   006C
        RRC     R0,     1                       ; 6CF2   0070
        RRC     R2,     1                       ; 6CF3   0072
        SLR     R2,     2                       ; 6CF4   0066
        MOVR    R4,     R1                      ; 6CF5   00A1
        TSTR    R1                              ; 6CF6   0089
        RLC     R1,     1                       ; 6CF7   0051
        MOVR    R1,     R7                      ; 6CF8   008F

        MOVR    R6,     R1                      ; 6CF9   00B1
        MOVR    R5,     R7                      ; 6CFA   00AF

        ADDR    R2,     R1                      ; 6CFB   00D1
        SWAP    R2,     1                       ; 6CFC   0042
        MOVR    R5,     R6                      ; 6CFD   00AE
        RRC     R0,     1                       ; 6CFE   0070
        TSTR    R2                              ; 6CFF   0092
        SLL     R2,     2                       ; 6D00   004E
        RLC     R1,     1                       ; 6D01   0051
        SLLC    R2,     1                       ; 6D02   005A
        GSWD    R2                              ; 6D03   0032
        MOVR    R1,     R6                      ; 6D04   008E
        RLC     R2,     1                       ; 6D05   0052
        MOVR    R4,     R1                      ; 6D06   00A1
        MOVR    R5,     R7                      ; 6D07   00AF

        MOVR    R2,     R0                      ; 6D08   0090
        RLC     R0,     1                       ; 6D09   0050
        SAR     R3,     2                       ; 6D0A   006F
        MOVR    R3,     R4                      ; 6D0B   009C
        GSWD    R0                              ; 6D0C   0030
        MOVR    R1,     R7                      ; 6D0D   008F

        MOVR    R7,     R2                      ; 6D0E   00BA
        NEGR    R1                              ; 6D0F   0021
        MOVR    R6,     R0                      ; 6D10   00B0
        SLL     R2,     2                       ; 6D11   004E
        SARC    R2,     1                       ; 6D12   007A
        RLC     R0,     1                       ; 6D13   0050
        TSTR    R3                              ; 6D14   009B
        MOVR    R6,     R0                      ; 6D15   00B0
        SLL     R2,     2                       ; 6D16   004E
        SARC    R0,     2                       ; 6D17   007C
        NEGR    R1                              ; 6D18   0021
        SWAP    R2,     1                       ; 6D19   0042
        SLL     R3,     2                       ; 6D1A   004F
        SARC    R0,     2                       ; 6D1B   007C
        ADCR    R6                              ; 6D1C   002E
        SAR     R3,     2                       ; 6D1D   006F
        RRC     R0,     1                       ; 6D1E   0070
        MOVR    R2,     R0                      ; 6D1F   0090
        MOVR    R1,     R7                      ; 6D20   008F

        SARC    R3,     1                       ; 6D21   007B
        NEGR    R1                              ; 6D22   0021
        ADDR    R0,     R1                      ; 6D23   00C1
        TSTR    R3                              ; 6D24   009B
        ADCR    R7                              ; 6D25   002F

        SWAP    R2,     1                       ; 6D26   0042
L_6D27:
        RLC     R2,     1                       ; 6D27   0052
        DECLE   $006F,  $0062,  $0061,  $00AC   ; 6D28   006F 0062 0061 00AC
        DECLE   $0070,  $00E6,  $0070,  $00E1   ; 6D2C   0070 00E6 0070 00E1
        DECLE   $0046,  $00FF,  $0082,  $0089   ; 6D30   0046 00FF 0082 0089
        DECLE   $00D4,  $0034,  $0054,  $004C   ; 6D34   00D4 0034 0054 004C
        DECLE   $0021,  $0026,  $00CC,  $00DA   ; 6D38   0021 0026 00CC 00DA
        DECLE   $0035,  $0033,  $0053,  $0033   ; 6D3C   0035 0033 0053 0033
        DECLE   $003A,  $0042,  $0086,  $0054   ; 6D40   003A 0042 0086 0054
        DECLE   $0033,  $005C,  $0033,  $0033   ; 6D44   0033 005C 0033 0033
        DECLE   $0054,  $0033,  $003C,  $002C   ; 6D48   0054 0033 003C 002C
        DECLE   $00AC,  $00B3,  $0033,  $005B   ; 6D4C   00AC 00B3 0033 005B
        DECLE   $0033,  $0035,  $0053,  $0035   ; 6D50   0033 0035 0053 0035
        DECLE   $003B,  $0062,  $0046,  $003A   ; 6D54   003B 0062 0046 003A
        DECLE   $0033,  $0033,  $002C,  $0046   ; 6D58   0033 0033 002C 0046
        DECLE   $004C,  $0041,  $00D4,  $0034   ; 6D5C   004C 0041 00D4 0034
        DECLE   $0054,  $0033,  $003C,  $0082   ; 6D60   0054 0033 003C 0082
        DECLE   $008C,  $0021,  $007A,  $0035   ; 6D64   008C 0021 007A 0035
        DECLE   $0033,  $0053,  $0035,  $003B   ; 6D68   0033 0053 0035 003B
        DECLE   $0046,  $00AC,  $0061,  $007C   ; 6D6C   0046 00AC 0061 007C
        DECLE   $0033,  $0033,  $0053,  $0033   ; 6D70   0033 0033 0053 0033
        DECLE   $0061,  $0066,  $0086,  $0041   ; 6D74   0061 0066 0086 0041
        DECLE   $007B,  $0033,  $0035,  $0055   ; 6D78   007B 0033 0035 0055
        DECLE   $0033,  $0061,  $002C,  $00CC   ; 6D7C   0033 0061 002C 00CC
        DECLE   $0081,  $002C,  $0082,  $006C   ; 6D80   0081 002C 0082 006C
        DECLE   $0082,  $0066,  $0021,  $00FF   ; 6D84   0082 0066 0021 00FF
        DECLE   $0089,  $00E0,  $00A1,  $00E9   ; 6D88   0089 00E0 00A1 00E9
        DECLE   $0081,  $00A1,  $0026,  $006C   ; 6D8C   0081 00A1 0026 006C
        DECLE   $00A0,  $0026,  $0041,  $00A0   ; 6D90   00A0 0026 0041 00A0
        DECLE   $00E0,  $00A1,  $0080,  $008C   ; 6D94   00E0 00A1 0080 008C
        DECLE   $00DA,  $008C,  $00E1,  $0039   ; 6D98   00DA 008C 00E1 0039
        DECLE   $0039,  $005C,  $0037,  $0081   ; 6D9C   0039 005C 0037 0081
        DECLE   $007A,  $0058,  $0038,  $0038   ; 6DA0   007A 0058 0038 0038
        DECLE   $005B,  $0037,  $0037,  $003A   ; 6DA4   005B 0037 0037 003A
        DECLE   $007C,  $0059,  $0039,  $00A1   ; 6DA8   007C 0059 0039 00A1
        DECLE   $0057,  $003C,  $007B,  $00A2   ; 6DAC   0057 003C 007B 00A2
        DECLE   $007B,  $0062,  $00E1,  $00A1   ; 6DB0   007B 0062 00E1 00A1
        DECLE   $00FF,  $0062,  $00E9,  $0080   ; 6DB4   00FF 0062 00E9 0080
        DECLE   $007A,  $00A2,  $00AC,  $0021   ; 6DB8   007A 00A2 00AC 0021
        DECLE   $007C,  $0057,  $0037,  $00C2   ; 6DBC   007C 0057 0037 00C2
        DECLE   $0061,  $007B,  $0057,  $0037   ; 6DC0   0061 007B 0057 0037
        DECLE   $0037,  $005A,  $00AC,  $0021   ; 6DC4   0037 005A 00AC 0021
        DECLE   $00E1,  $0037,  $0037,  $005C   ; 6DC8   00E1 0037 0037 005C
        DECLE   $0037,  $0037,  $00A1,  $008C   ; 6DCC   0037 0037 00A1 008C
        DECLE   $00DB,  $0037,  $0037,  $0037   ; 6DD0   00DB 0037 0037 0037
        DECLE   $005A,  $00E0,  $00E1,  $0037   ; 6DD4   005A 00E0 00E1 0037
        DECLE   $0037,  $003C,  $0026,  $006C   ; 6DD8   0037 003C 0026 006C
        DECLE   $00E0,  $007B,  $002C,  $0086   ; 6DDC   00E0 007B 002C 0086
        DECLE   $00E9,  $0061,  $0089,  $00E2   ; 6DE0   00E9 0061 0089 00E2
        DECLE   $0060,  $00FF,  $0062,  $00E9   ; 6DE4   0060 00FF 0062 00E9
        DECLE   $0080,  $007A,  $00A2,  $00AC   ; 6DE8   0080 007A 00A2 00AC
        DECLE   $0021,  $007C,  $0056,  $003D   ; 6DEC   0021 007C 0056 003D
        DECLE   $00C2,  $0061,  $007B,  $005D   ; 6DF0   00C2 0061 007B 005D
        DECLE   $003E,  $003D,  $005A,  $00AC   ; 6DF4   003E 003D 005A 00AC
        DECLE   $0021,  $00E1,  $0036,  $003D   ; 6DF8   0021 00E1 0036 003D
        DECLE   $005C,  $003E,  $0036,  $00A1   ; 6DFC   005C 003E 0036 00A1
        DECLE   $008C,  $00DB,  $0036,  $003D   ; 6E00   008C 00DB 0036 003D
        DECLE   $003D,  $005A,  $00E0,  $00E1   ; 6E04   003D 005A 00E0 00E1
        DECLE   $003E,  $003D,  $003C,  $0026   ; 6E08   003E 003D 003C 0026
        DECLE   $006C,  $00E0,  $007B,  $002C   ; 6E0C   006C 00E0 007B 002C
        DECLE   $0086,  $00E9,  $0061,  $0089   ; 6E10   0086 00E9 0061 0089
        DECLE   $00E2,  $0060,  $00FF           ; 6E14   00E2 0060 00FF
L_6E17:
        PSHR    R5                              ; 6E17   0275
        SDBD                                    ; 6E18   0001
        MVII    #$6EB8, R0                      ; 6E19   02B8 00B8 006E
        MVO     R0,     G_031B                  ; 6E1C   0240 031B
        CLRR    R0                              ; 6E1E   01C0
        MVO     R0,     G_0168                  ; 6E1F   0240 0168
        MVO     R0,     G_015D                  ; 6E21   0240 015D

        JSR     R5,     L_697F                  ; 6E23   0004 0168 017F

        MVII    #$0028, R0                      ; 6E26   02B8 0028
        CLRR    R4                              ; 6E28   01E4

        JSR     R5,     X_FILL_ZERO             ; 6E29   0004 0114 0338

        MVII    #$00F0, R0                      ; 6E2C   02B8 00F0
        MVII    #$0200, R4                      ; 6E2E   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 6E30   0004 0114 0338

        EIS                                     ; 6E33   0002

        JSR     R5,     L_697F                  ; 6E34   0004 0168 017F

        MVII    #$0000, R1                      ; 6E37   02B9 0000
        MVII    #$0028, R5                      ; 6E39   02BD 0028
        MVO@    R1,     R5                      ; 6E3B   0269
        MVO@    R1,     R5                      ; 6E3C   0269
        MVO@    R1,     R5                      ; 6E3D   0269
        MVO@    R1,     R5                      ; 6E3E   0269
        MVO@    R1,     R5                      ; 6E3F   0269
        MVO     R1,     .STIC.VDLY              ; 6E40   0241 0031
        MVO     R1,     .STIC.HDLY              ; 6E42   0241 0030
        MVI     .STIC.MODE,R0                   ; 6E44   0280 0021
        MVO     R0,     .STIC.VIDEN             ; 6E46   0240 0020

        JSR     R5,     L_698F                  ; 6E48   0004 0168 018F
        DECLE   $0070,  $006E                   ; 6E4B   0070 006E

        EIS                                     ; 6E4D   0002
        CLRR    R0                              ; 6E4E   01C0
        MVO     R0,     G_016D                  ; 6E4F   0240 016D
L_6E51:
        MVI     G_016D, R0                      ; 6E51   0280 016D
        TSTR    R0                              ; 6E53   0080
        BEQ     L_6E51                          ; 6E54   0224 0004

        CMPI    #$0002, R0                      ; 6E56   0378 0002
        BEQ     L_6E6D                          ; 6E58   0204 0013

        CLRR    R0                              ; 6E5A   01C0
        MVO     R0,     G_016D                  ; 6E5B   0240 016D
L_6E5D:
        MVI     .PSG0.rgt_hand,R0               ; 6E5D   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6E5F   0380 01FF
        CMPI    #$00FF, R0                      ; 6E61   0378 00FF
        BEQ     L_6E5D                          ; 6E63   0224 0007

L_6E65:
        MVI     .PSG0.rgt_hand,R0               ; 6E65   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6E67   0380 01FF
        CMPI    #$00FF, R0                      ; 6E69   0378 00FF
        BNEQ    L_6E65                          ; 6E6B   022C 0007
L_6E6D:
        J       X_RESET                         ; 6E6D   0004 0310 0000

        PSHR    R5                              ; 6E70   0275
        MVII    #$0002, R0                      ; 6E71   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 6E73   0240 0032
        MVO     R0,     .STIC.VIDEN             ; 6E75   0240 0020
        MVI     G_0168, R0                      ; 6E77   0280 0168
        DECR    R0                              ; 6E79   0010
        MVO     R0,     G_0168                  ; 6E7A   0240 0168
        BPL     L_6EB3                          ; 6E7C   0203 0035

        MVII    #$0001, R0                      ; 6E7E   02B8 0001
        MVO     R0,     G_0168                  ; 6E80   0240 0168
        MVI     G_015D, R0                      ; 6E82   0280 015D
        DECR    R0                              ; 6E84   0010
        MVO     R0,     G_015D                  ; 6E85   0240 015D
        MVO     R0,     .STIC.VDLY              ; 6E87   0240 0031
        BPL     L_6EB3                          ; 6E89   0203 0028

        MVII    #$0007, R0                      ; 6E8B   02B8 0007
        MVO     R0,     G_015D                  ; 6E8D   0240 015D
        MVII    #$0014, R0                      ; 6E8F   02B8 0014

        JSR     R5,     L_5A5C                  ; 6E91   0004 0158 025C

        MVI     G_031B, R5                      ; 6E94   0285 031B
        MVI@    R5,     R4                      ; 6E96   02AC
        CMPI    #$0001, R4                      ; 6E97   037C 0001
        BLT     L_6EB1                          ; 6E99   0205 0016
        BEQ     L_6EAE                          ; 6E9B   0204 0011

        MOVR    R4,     R0                      ; 6E9D   00A0
        CMPI    #$0002, R0                      ; 6E9E   0378 0002
        BEQ     L_6E6D                          ; 6EA0   0224 0034

        MVI@    R5,     R3                      ; 6EA2   02AB
L_6EA3:
        MVI@    R5,     R0                      ; 6EA3   02A8
        SUBI    #$0020, R0                      ; 6EA4   0338 0020
        BMI     L_6EB1                          ; 6EA6   020B 0009

        SLL     R0,     2                       ; 6EA8   004C
        SLL     R0,     1                       ; 6EA9   0048
        XORR    R3,     R0                      ; 6EAA   01D8
        MVO@    R0,     R4                      ; 6EAB   0260
        B       L_6EA3                          ; 6EAC   0220 000A

L_6EAE:
        SDBD                                    ; 6EAE   0001
        MVI@    R5,     R0                      ; 6EAF   02A8
        MOVR    R0,     R5                      ; 6EB0   0085
L_6EB1:
        MVO     R5,     G_031B                  ; 6EB1   0245 031B
L_6EB3:
        MVII    #$0001, R0                      ; 6EB3   02B8 0001
        MVO     R0,     G_016D                  ; 6EB5   0240 016D
        PULR    R7                              ; 6EB7   02B7

        DECLE   $0000,  $02E4,  $0003,  $0123   ; 6EB8   0000 02E4 0003 0123
        DECLE   $0124,  $0125,  $0126,  $0000   ; 6EBC   0124 0125 0126 0000
        DECLE   $02DE,  $0007,  $004D,  $004F   ; 6EC0   02DE 0007 004D 004F
        DECLE   $0055,  $004E,  $0054,  $0041   ; 6EC4   0055 004E 0054 0041
        DECLE   $0049,  $004E,  $0020,  $004D   ; 6EC8   0049 004E 0020 004D
        DECLE   $0041,  $0044,  $004E,  $0045   ; 6ECC   0041 0044 004E 0045
        DECLE   $0053,  $0053,  $0000,  $02DE   ; 6ED0   0053 0053 0000 02DE
        DECLE   $0006,  $0053,  $0075,  $0070   ; 6ED4   0006 0053 0075 0070
        DECLE   $0065,  $0072,  $0020,  $0050   ; 6ED8   0065 0072 0020 0050
        DECLE   $0072,  $006F,  $0020,  $0053   ; 6EDC   0072 006F 0020 0053
        DECLE   $006B,  $0069,  $0069,  $006E   ; 6EE0   006B 0069 0069 006E
        DECLE   $0067,  $0000,  $0000,  $0000   ; 6EE4   0067 0000 0000 0000
        DECLE   $02DD,  $0003,  $0048,  $006F   ; 6EE8   02DD 0003 0048 006F
        DECLE   $0074,  $0064,  $006F,  $0067   ; 6EEC   0074 0064 006F 0067
        DECLE   $0067,  $0065,  $0072,  $002C   ; 6EF0   0067 0065 0072 002C
        DECLE   $0000,  $02DF,  $0003,  $0044   ; 6EF4   0000 02DF 0003 0044
        DECLE   $0065,  $0073,  $0069,  $0067   ; 6EF8   0065 0073 0069 0067
        DECLE   $006E,  $0065,  $0072,  $002C   ; 6EFC   006E 0065 0072 002C
        DECLE   $0000,  $02DF,  $0003,  $0050   ; 6F00   0000 02DF 0003 0050
        DECLE   $0072,  $006F,  $0067,  $0072   ; 6F04   0072 006F 0067 0072
        DECLE   $0061,  $006D,  $006D,  $0065   ; 6F08   0061 006D 006D 0065
        DECLE   $0072,  $003A,  $0000,  $0000   ; 6F0C   0072 003A 0000 0000
        DECLE   $02E1,  $0006,  $0052,  $0061   ; 6F10   02E1 0006 0052 0061
        DECLE   $0079,  $0020,  $004B,  $0061   ; 6F14   0079 0020 004B 0061
        DECLE   $0065,  $0073,  $0074,  $006E   ; 6F18   0065 0073 0074 006E
        DECLE   $0065,  $0072,  $0000,  $0000   ; 6F1C   0065 0072 0000 0000
        DECLE   $0000,  $02DD,  $0003,  $0053   ; 6F20   0000 02DD 0003 0053
        DECLE   $006B,  $0069,  $0020,  $0050   ; 6F24   006B 0069 0020 0050
        DECLE   $0061,  $0074,  $0072,  $006F   ; 6F28   0061 0074 0072 006F
        DECLE   $006C,  $002C,  $0000,  $02DF   ; 6F2C   006C 002C 0000 02DF
        DECLE   $0003,  $0047,  $0072,  $0061   ; 6F30   0003 0047 0072 0061
        DECLE   $0070,  $0068,  $0069,  $0063   ; 6F34   0070 0068 0069 0063
        DECLE   $0020,  $0041,  $0072,  $0074   ; 6F38   0020 0041 0072 0074
        DECLE   $0069,  $0073,  $0074,  $003A   ; 6F3C   0069 0073 0074 003A
        DECLE   $0000,  $0000,  $02E1,  $0006   ; 6F40   0000 0000 02E1 0006
        DECLE   $0043,  $006F,  $006E,  $006E   ; 6F44   0043 006F 006E 006E
        DECLE   $0069,  $0065,  $0020,  $0047   ; 6F48   0069 0065 0020 0047
        DECLE   $006F,  $006C,  $0064,  $006D   ; 6F4C   006F 006C 0064 006D
        DECLE   $0061,  $006E,  $0000,  $0000   ; 6F50   0061 006E 0000 0000
        DECLE   $0000,  $02DD,  $0003,  $0053   ; 6F54   0000 02DD 0003 0053
        DECLE   $006C,  $006F,  $0070,  $0065   ; 6F58   006C 006F 0070 0065
        DECLE   $0020,  $0053,  $006C,  $0075   ; 6F5C   0020 0053 006C 0075
        DECLE   $0067,  $002C,  $0000,  $02DF   ; 6F60   0067 002C 0000 02DF
        DECLE   $0003,  $0050,  $0072,  $006F   ; 6F64   0003 0050 0072 006F
        DECLE   $0064,  $0075,  $0063,  $0065   ; 6F68   0064 0075 0063 0065
        DECLE   $0072,  $003A,  $0000,  $0000   ; 6F6C   0072 003A 0000 0000
        DECLE   $02E1,  $0006,  $0044,  $0061   ; 6F70   02E1 0006 0044 0061
        DECLE   $0076,  $0065,  $0020,  $0057   ; 6F74   0076 0065 0020 0057
        DECLE   $0061,  $0072,  $0068,  $006F   ; 6F78   0061 0072 0068 006F
        DECLE   $006C,  $0000,  $0000,  $0000   ; 6F7C   006C 0000 0000 0000
        DECLE   $0000,  $0000,  $02DE,  $0007   ; 6F80   0000 0000 02DE 0007
        DECLE   $004D,  $004F,  $0055,  $004E   ; 6F84   004D 004F 0055 004E
        DECLE   $0054,  $0041,  $0049,  $004E   ; 6F88   0054 0041 0049 004E
        DECLE   $0020,  $004D,  $0041,  $0044   ; 6F8C   0020 004D 0041 0044
        DECLE   $004E,  $0045,  $0053,  $0053   ; 6F90   004E 0045 0053 0053
        DECLE   $0000,  $02DE,  $0006,  $0053   ; 6F94   0000 02DE 0006 0053
        DECLE   $0075,  $0070,  $0065,  $0072   ; 6F98   0075 0070 0065 0072
        DECLE   $0020,  $0050,  $0072,  $006F   ; 6F9C   0020 0050 0072 006F
        DECLE   $0020,  $0053,  $006B,  $0069   ; 6FA0   0020 0053 006B 0069
        DECLE   $0069,  $006E,  $0067,  $0000   ; 6FA4   0069 006E 0067 0000
        DECLE   $02DE,  $0005,  $0043,  $006F   ; 6FA8   02DE 0005 0043 006F
        DECLE   $0070,  $0079,  $0072,  $0069   ; 6FAC   0070 0079 0072 0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; 6FB0   0067 0068 0074 0020
        DECLE   $0122,  $0020,  $0031,  $0039   ; 6FB4   0122 0020 0031 0039
        DECLE   $0038,  $0037,  $0020,  $0000   ; 6FB8   0038 0037 0020 0000
        DECLE   $02E1,  $0005,  $0123,  $0124   ; 6FBC   02E1 0005 0123 0124
        DECLE   $0125,  $0126,  $0020,  $0043   ; 6FC0   0125 0126 0020 0043
        DECLE   $006F,  $0072,  $0070,  $002E   ; 6FC4   006F 0072 0070 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD0   0000 0000 0000 0000
        DECLE   $0000                           ; 6FD4   0000

        EIS                                     ; 6FD5   0002
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
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5039       <entry>
;;  $503A       <entry>
;;  $50DA       $50D8  
;;  $50DC       $50DA  
;;  $50DE       $50DC  
;;  $50E0       $50DE  
;;  $50E2       $50E0  
;;  $5122       $50E3   $50EC   $50F4   $50FE  
;;  $5144       $5155  
;;  $5151       $513E   $5142  
;;  $5157       $514A  
;;  $5161       $515E  
;;  $5163       $53A8   $53C2   $53C6   $53CC   $53D0  
;;  $5164       $514E  
;;  $51C7       $51A3  
;;  $5200       $51FD  
;;  $526D       $5268  
;;  $526E       $526B  
;;  $527D       $51C4   $51E0   $5216   $5238   $525B  
;;  $527F       $575A   $5783  
;;  $5280       $528B  
;;  $5297       $5295  
;;  $5299       $5297  
;;  $529B       $5299  
;;  $529F       $529D  
;;  $52C7       $52C5  
;;  $52D4       $52D2  
;;  $52D8       $52D6  
;;  $52E1       $52E1  
;;  $52E6       $52E6  
;;  $53A0       $539E  
;;  $53A1       $539F  
;;  $53A2       $53A0  
;;  $53A3       $53A1  
;;  $53A4       $53A2  
;;  $53A5       $53A3  
;;  $53CB       $53BD  
;;  $53D5       $53BF  
;;  $53DE       $53D8  
;;  $53E2       $53C9   $53D3   $54EC  
;;  $53EB       $53F9   $53FC  
;;  $53F0       $53B5   $53E0  
;;  $53F7       $53B9  
;;  $5476       $5A59  
;;  $54FD       $55AA   $5766  
;;  $5550       $5580  
;;  $5582       $5579   $558F  
;;  $558E       $558B  
;;  $5591       $54F6  
;;  $559E       $55A5  
;;  $55AC       $54FA   $58DB  
;;  $55C4       $55E2  
;;  $55D0       $55CA  
;;  $55D2       $55C6   $55CE  
;;  $55DE       $55D6  
;;  $55E0       $55DC   $55DE  
;;  $55E8       $5340   $59F1   $5A27   $5BC9  
;;  $55EB       $59E9   $5A21  
;;  $55EC       $55EA  
;;  $5602       $55A7   $55E4   $575D  
;;  $560B       $561D  
;;  $5612       $560F  
;;  $562A       $54F8  
;;  $5653       $5643  
;;  $565E       $5651  
;;  $56D8       $56DF  
;;  $56E1       $6688  
;;  $56FF       $56F6  
;;  $5705       $56F9   $56FD   $5702  
;;  $5708       $56D4   $5755   $5795  
;;  $5709       $5707  
;;  $571F       $5719  
;;  $5744       $5791  
;;  $574E       $5748  
;;  $5768       $573F  
;;  $578C       $5775  
;;  $5798       $554E   $572F   $5742  
;;  $57C8       $57C3  
;;  $58C9       $58CE   $58D3   $58D7   $58EC   $59A8   $59E0   $5A18   $5B41  
;;  $58C9       $5B9C  
;;  $58CA       $58C7  
;;  $58E6       $5587  
;;  $58EE       $58E3  
;;  $590C       $5909  
;;  $593E       $5920  
;;  $5954       $5940  
;;  $5960       $5952  
;;  $596C       $593C  
;;  $599A       $59AC  
;;  $59B5       $59BC  
;;  $59BE       $668D  
;;  $5A02       $59FD  
;;  $5A0D       $5A06  
;;  $5A11       $5A0B  
;;  $5A15       $59D1  
;;  $5A35       $5A31  
;;  $5A3C       $5A37  
;;  $5A40       $5A3A  
;;  $5A48       $5A45  
;;  $5A59       $5A54  
;;  $5A5C       $5779   $577E   $59EE   $6E91  
;;  $5A66       $5A73  
;;  $5A6C       $5A64  
;;  $5A6D       $5A70  
;;  $5A7C       $5A7E  
;;  $5A81       $5A24  
;;  $5A88       $5A94  
;;  $5A8A       $5A8D  
;;  $5A98       $5A9A  
;;  $5B0D       $56D1   $572A   $5991   $599E   $59B1   $5A11   $5A40  
;;  $5B30       $5B2C  
;;  $5B3B       $5B35  
;;  $5B3D       $5B39  
;;  $5B4C       $5B22   $5B30   $5B45  
;;  $5B65       $5B5D  
;;  $5B6C       $5B0F  
;;  $5B7A       $5B71  
;;  $5B88       $5B6D  
;;  $5BA4       $5639   $5901  
;;  $5BD1       $527A  
;;  $5BE3       $5A56   $5BD9  
;;  $5C41       $5C13  
;;  $5C55       $5C61  
;;  $5C5F       $5C58   $5C5B  
;;  $5C6F       $5C15  
;;  $5C9A       $5C6D  
;;  $5C9E       $5CBA  
;;  $5CBD       $503C   $5184   $5C09  
;;  $5D14       $5D42  
;;  $5D26       $5D1A  
;;  $5D29       $5D1D  
;;  $5D2A       $5D24   $5D28  
;;  $5D3B       $5D2F  
;;  $5D3E       $5D32  
;;  $5D3F       $5D39   $5D3D  
;;  $5DB2       $5DB0  
;;  $5DC8       $5DC6  
;;  $5E82       $5E80  
;;  $5E83       $5E81  
;;  $5E84       $5E82  
;;  $5E99       $5E97  
;;  $5F35       $6011   $6024   $6030  
;;  $5F5A       $5F57  
;;  $5FAC       $5FA6   $5FFF   $6005  
;;  $5FB5       $5F38   $5F6D   $5F81   $5F85   $5FAA   $5FCD   $6009   $6052  
;;  $5FB5       $6064   $60AD   $60B7   $60BD  
;;  $5FB6       $5F89  
;;  $5FB9       $5F73   $5F77  
;;  $5FC7       $5F7D  
;;  $5FCB       $5FF1  
;;  $5FE2       $5FDA  
;;  $5FEF       $5FE0  
;;  $5FF0       $5FCF  
;;  $5FF4       $5FD6  
;;  $5FF6       $5F92   $5F98  
;;  $6010       $6043  
;;  $6013       $5F6A  
;;  $6026       $601A  
;;  $604E       $6022   $603C  
;;  $6057       $6742  
;;  $6058       $696B  
;;  $605B       $600E  
;;  $6078       $606C  
;;  $6094       $604B  
;;  $60A6       $6058   $66A7  
;;  $60B9       $60B3  
;;  $60BF       $60A8  
;;  $60F0       $60E9  
;;  $60F2       $60D4  
;;  $60FC       $60F8  
;;  $60FF       $6047  
;;  $611C       $6113   $6117  
;;  $6126       $579A  
;;  $6131       $6128  
;;  $6134       $5C24  
;;  $6387       $68A8  
;;  $638A       $6430  
;;  $63A6       $63AA  
;;  $63AE       $6390  
;;  $63BF       $63B1   $63B8  
;;  $63D2       $63C8  
;;  $63D4       $63C4   $63CC   $63D0  
;;  $63D5       $63BD  
;;  $63E1       $63DC  
;;  $63FA       $63F0   $63F4  
;;  $63FB       $63EC   $63F8  
;;  $641C       $6426  
;;  $642A       $640E   $6412   $6416  
;;  $642D       $641E   $6422  
;;  $642E       $642C  
;;  $642F       $640A   $645C  
;;  $6433       $6428  
;;  $6449       $6445  
;;  $645E       $63E5  
;;  $6468       $6475  
;;  $646F       $646B  
;;  $6479       $6400   $6403   $650D   $6510   $6518   $651B   $6521   $6524  
;;  $6492       $6484  
;;  $64A0       $6494  
;;  $64AD       $64A5  
;;  $64B9       $64AF  
;;  $64BD       $6490  
;;  $64C1       $648C   $649C   $64AB   $64B7   $64BB  
;;  $64C5       $647D  
;;  $64ED       $639A  
;;  $652C       $64FC  
;;  $6566       $6462   $6472   $652A   $652E  
;;  $6582       $5FB6  
;;  $65A2       $51C1   $51DD   $5235   $5258   $5CB2   $6866  
;;  $65A3       $65A1  
;;  $65BB       $57BC   $639C  
;;  $65C8       $65C5  
;;  $65CB       $600B  
;;  $65DE       $5FC4  
;;  $65F8       $53EC   $574A   $6054   $673F   $6968  
;;  $65F9       $65DC  
;;  $660D       $57C8   $65F6  
;;  $6619       <entry>
;;  $6634       $662C  
;;  $6638       $6632  
;;  $663F       $663C  
;;  $6646       $6641  
;;  $664B       $6626   $6636  
;;  $6657       $661C   $6621  
;;  $6658       $6649   $6651  
;;  $665A       $6655  
;;  $6666       $6662  
;;  $6670       $660B  
;;  $6671       <entry>
;;  $668D       $6686  
;;  $6690       $6675   $668B  
;;  $6698       $6693  
;;  $66AA       $669B   $66A5  
;;  $66CA       $66CA  
;;  $66D0       <entry>
;;  $66DE       $66D9  
;;  $66F5       $66EE  
;;  $66F6       $66F1   $66F4  
;;  $66FD       $66FA  
;;  $6704       $66FF  
;;  $6709       $6705  
;;  $6710       $670A  
;;  $6712       $670E  
;;  $672F       $6726  
;;  $6734       $672A   $672D   $6731  
;;  $6745       $673D  
;;  $6753       $674F  
;;  $6756       $6737  
;;  $6757       $6748   $6751   $6755  
;;  $6764       $6761  
;;  $6781       $677E  
;;  $6792       $678D  
;;  $67B9       $67B3  
;;  $67C2       $67BE  
;;  $67D2       $67CC  
;;  $67D5       $676B  
;;  $6819       $6813  
;;  $681F       $6817   $681B  
;;  $6823       $6820  
;;  $6831       $6805   $6835  
;;  $6832       $667C   $66D4  
;;  $6848       $6842  
;;  $684C       <entry>
;;  $6869       $6850   $6860  
;;  $686A       <entry>
;;  $68A0       $68A4  
;;  $68AB       $686E   $6873   $68A6  
;;  $68B1       $68C7  
;;  $68E1       $68E5  
;;  $68EB       $68DB  
;;  $68F3       $6717   $67DD  
;;  $68FF       $68F6  
;;  $6900       $68FE  
;;  $6902       $67EE  
;;  $6909       $68FA  
;;  $691B       $6909  
;;  $691C       $6900   $6905  
;;  $6925       $6920  
;;  $692C       <entry>
;;  $6942       $6931   $6946   $6966  
;;  $6943       $693C   $693F  
;;  $694C       $6948  
;;  $6951       $694E  
;;  $6958       $6952  
;;  $695A       $6956  
;;  $696E       $5343   $5416   $5476   $5500   $5BCC   $5CFE  
;;  $697F       $503F   $5280   $55ED   $5720   $59E4   $5A1C   $5BA5   $5BB7  
;;  $697F       $5CBF   $5CD1   $5CE3   $6E23   $6E34  
;;  $698E       $698E  
;;  $698F       $6E48  
;;  $6999       $504E   $5BB4   $5BC6   $5CCE   $5CE0  
;;  $69A6       $69C7  
;;  $6A28       $6A28  
;;  $6C10       $6C0E  
;;  $6C5B       $624D  
;;  $6CE2       $6CE0  
;;  $6D27       $6D25  
;;  $6E17       $6844  
;;  $6E51       $6E54  
;;  $6E5D       $6E63  
;;  $6E65       $6E6B  
;;  $6E6D       $6E58   $6EA0  
;;  $6EA3       $6EAC  
;;  $6EAE       $6E9B  
;;  $6EB1       $6E99   $6EA6  
;;  $6EB3       $6E7C   $6E89  
;; ======================================================================== ;;
