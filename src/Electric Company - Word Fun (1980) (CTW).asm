
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $5014           ; 5002  Ptr: EXEC timer table
        BIDECLE $5046           ; 5004  Ptr: Start of game
        BIDECLE $0000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5016           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5018           ; 500A  Ptr: Date/Title
        DECLE   $0082           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

.TIMER:
        BIDECLE $0000           ; 5014  End of timer table

.GRAM_INIT_5016:
        DECLE   $0001           ; 5016  # of GRAM cards to init
        DECLE   $0000           ; 5017  #00   :  CART #00    ----

.TITLE:
        DECLE   $0050                           ; 5018  Cartridge year
        STRING  "WORD FUN"                      ; 5019  Title string
        DECLE   $0000                           ; 5021  

.TITLECODE:
        PSHR    R5                              ; 5022   0275
        MVII    #$0007, R3                      ; 5023   02BB 0007
        MVII    #$02B5, R4                      ; 5025   02BC 02B5

        JSR     R5,     X_PRINT_R5              ; 5027   0004 0118 007B
        STRING  "Copr @ 1980 CTW"               ; 502A  
        DECLE   $0000                           ; 5039   0000

        PULR    R7                              ; 503A   02B7

        DECLE   $0000,  $0000                   ; 503B   0000 0000

        MVI     G_02F1, R0                      ; 503D   0280 02F1
        MVO     R0,     G_0103                  ; 503F   0240 0103
        MVI     G_02F2, R0                      ; 5041   0280 02F2
        MVO     R0,     G_035E                  ; 5043   0240 035E
        PULR    R7                              ; 5045   02B7

.START:
        PSHR    R5                              ; 5046   0275
        SDBD                                    ; 5047   0001
        MVII    #$50AB, R0                      ; 5048   02B8 00AB 0050
        MVO     R0,     G_035D                  ; 504B   0240 035D
        MVII    #$00F0, R0                      ; 504D   02B8 00F0
        MVII    #$0200, R4                      ; 504F   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5051   0004 0114 0338

        MVII    #$0215, R4                      ; 5054   02BC 0215
        MVII    #$0007, R3                      ; 5056   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5058   0004 0118 007B
        STRING  "CHOOSE A GAME:"                ; 505B  
        DECLE   $0000                           ; 5069   0000

        MVII    #$023D, R4                      ; 506A   02BC 023D
        MVII    #$0007, R3                      ; 506C   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 506E   0004 0118 007B
        STRING  "1. CROSSWORDS"                 ; 5071  
        DECLE   $0000                           ; 507E   0000

        MVII    #$0265, R4                      ; 507F   02BC 0265
        MVII    #$0007, R3                      ; 5081   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5083   0004 0118 007B
        STRING  "2. WORD HUNT"                  ; 5086  
        DECLE   $0000                           ; 5092   0000

        MVII    #$028D, R4                      ; 5093   02BC 028D
        MVII    #$0007, R3                      ; 5095   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5097   0004 0118 007B
        STRING  "3. WORD ROCKETS"               ; 509A  
        DECLE   $0000                           ; 50A9   0000

        PULR    R7                              ; 50AA   02B7

        DECLE   $0000,  $0000,  $00B5,  $0050   ; 50AB   0000 0000 00B5 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50AF   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50B3   0000 0000

        PSHR    R5                              ; 50B5   0275
        DECR    R0                              ; 50B6   0010
        BMI     L_50BD                          ; 50B7   020B 0004

        CMPI    #$0002, R0                      ; 50B9   0378 0002
        BLE     L_50C1                          ; 50BB   0206 0004

L_50BD:
        JSR     R5,     X_PLAY_RAZZ2            ; 50BD   0004 011C 02BD

        PULR    R7                              ; 50C0   02B7

L_50C1:
        SLL     R0,     1                       ; 50C1   0048
        MOVR    R0,     R4                      ; 50C2   0084
        SDBD                                    ; 50C3   0001
        ADDI    #$50D9, R4                      ; 50C4   02FC 00D9 0050
        SDBD                                    ; 50C7   0001
        MVI@    R4,     R0                      ; 50C8   02A0
        MVO     R0,     G_02F0                  ; 50C9   0240 02F0
        DIS                                     ; 50CB   0003
        MVII    #$02F3, R6                      ; 50CC   02BE 02F3
        MVI     G_0103, R0                      ; 50CE   0280 0103
        MVO     R0,     G_02F1                  ; 50D0   0240 02F1
        MVI     G_035E, R0                      ; 50D2   0280 035E
        MVO     R0,     G_02F2                  ; 50D4   0240 02F2
        J       .EXEC.041                       ; 50D6   0004 0310 0041

        NEGR    R1                              ; 50D9   0021
        RLC     R1,     1                       ; 50DA   0051
        MOVR    R3,     R6                      ; 50DB   009E
        SLLC    R1,     1                       ; 50DC   0059
        NEGR    R0                              ; 50DD   0020
        RLC     R1,     2                       ; 50DE   0055
L_50DF:
        PSHR    R5                              ; 50DF   0275
        SDBD                                    ; 50E0   0001
        MVII    #$1906, R0                      ; 50E1   02B8 0006 0019
        MVO     R0,     G_035D                  ; 50E4   0240 035D

        JSR     R5,     X_READ_ROM_HDR          ; 50E6   0004 0110 00AB

        EIS                                     ; 50E9   0002
        MOVR    R5,     R1                      ; 50EA   00A9
L_50EB:
        MVI@    R1,     R0                      ; 50EB   0288
        TSTR    R0                              ; 50EC   0080
        BEQ     L_50F6                          ; 50ED   0204 0007

        JSR     R5,     X_TIMER_STOP            ; 50EF   0004 0118 0038

        ADDI    #$0004, R1                      ; 50F2   02F9 0004
        B       L_50EB                          ; 50F4   0220 000A
L_50F6:
        PULR    R7                              ; 50F6   02B7

L_50F7:
        PSHR    R5                              ; 50F7   0275

L_50F8:
        JSR     R5,     X_PLAY_SFX1             ; 50F8   0004 0118 03BB
        DECLE   $03C9                           ; 50FB  SFX data
        DECLE   $0040,  $0080                   ; 50FC  SFX data
        DECLE   $0048,  $0081                   ; 50FE  SFX data
        DECLE   $010C,  $0000                   ; 5100  SFX data
        DECLE   $000B                           ; 5102  SFX data
        DECLE   $03CF                           ; 5103  SFX end


        PULR    R7                              ; 5104   02B7

L_5105:
        MVI@    R5,     R3                      ; 5105   02AB
        MVI@    R5,     R4                      ; 5106   02AC
L_5107:
        MVI@    R5,     R0                      ; 5107   02A8
        MVO@    R0,     R4                      ; 5108   0260
        DECR    R3                              ; 5109   0013
        BNEQ    L_5107                          ; 510A   022C 0004
        MOVR    R5,     R7                      ; 510C   00AF

        DECLE   $00C3,  $0054,  $0021,  $0051   ; 510D   00C3 0054 0021 0051
        DECLE   $0036                           ; 5111   0036

        RLC     R1,     1                       ; 5112   0051
        ADDR    R0,     R3                      ; 5113   00C3
        RLC     R0,     2                       ; 5114   0054
        ADCR    R5                              ; 5115   002D
        RLC     R1,     1                       ; 5116   0051
        RSWD    R3                              ; 5117   003B
        RLC     R0,     1                       ; 5118   0050
        MOVR    R3,     R7                      ; 5119   009F

        DECLE   $0000,  $0001,  $0000,  $0000   ; 511A   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0071   ; 511E   0000 0000 0006 0071
        DECLE   $001A,  $0001,  $0080,  $0036   ; 5122   001A 0001 0080 0036
        DECLE   $0051,  $0001,  $0000,  $0000   ; 5126   0051 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 512A   0000 0000 0000 000C
        DECLE   $0000,  $003F                   ; 512E   0000 003F

        GSWD    R0                              ; 5130   0030
        EIS                                     ; 5131   0002
        MOVR    R4,     R3                      ; 5132   00A3
        AND@    R2,     R0                      ; 5133   0390
        MOVR    R6,     R3                      ; 5134   00B3
        DECR    R0                              ; 5135   0010
        PSHR    R5                              ; 5136   0275
        MVI     G_0174, R1                      ; 5137   0281 0174
        INCR    R1                              ; 5139   0009
        ADDR    R7,     R1                      ; 513A   00F9
        ADD@    R1,     R7                      ; 513B   02CF

        DECLE   $0004                           ; 513C   0004

        SAR     R1,     2                       ; 513D   006D
        MOVR    R0,     R3                      ; 513E   0083
        MOVR    R0,     R3                      ; 513F   0083
        MVII    #$0214, R4                      ; 5140   02BC 0214
        MVII    #$000B, R2                      ; 5142   02BA 000B
L_5144:
        MVII    #$0006, R1                      ; 5144   02B9 0006
        SWAP    R1,     1                       ; 5146   0041
        MVO@    R1,     R4                      ; 5147   0261
        MVO@    R1,     R4                      ; 5148   0261
        MVII    #$0010, R0                      ; 5149   02B8 0010
        SDBD                                    ; 514B   0001
        MVII    #$1800, R1                      ; 514C   02B9 0000 0018

        JSR     R5,     X_FILL_MEM              ; 514F   0004 0114 0341

        MVII    #$0022, R1                      ; 5152   02B9 0022
        SWAP    R1,     1                       ; 5154   0041
        MVO@    R1,     R4                      ; 5155   0261
        MVO@    R1,     R4                      ; 5156   0261
        DECR    R2                              ; 5157   0012
        BNEQ    L_5144                          ; 5158   022C 0015

        MVII    #$0007, R2                      ; 515A   02BA 0007
        MVII    #$0228, R4                      ; 515C   02BC 0228
        SDBD                                    ; 515E   0001
        MVII    #$0E1F, R1                      ; 515F   02B9 001F 000E
        SDBD                                    ; 5162   0001
        MVII    #$2A1F, R3                      ; 5163   02BB 001F 002A
L_5166:
        MVO@    R1,     R4                      ; 5166   0261
        ADDI    #$0012, R4                      ; 5167   02FC 0012
        MVO@    R3,     R4                      ; 5169   0263
        ADDI    #$0008, R1                      ; 516A   02F9 0008
        ADDI    #$0008, R3                      ; 516C   02FB 0008
        DECR    R2                              ; 516E   0012
        BNEQ    L_5166                          ; 516F   022C 000A

        JSR     R5,     L_51D9                  ; 5171   0004 0150 01D9
        JSR     R5,     L_5105                  ; 5174   0004 0150 0105
        DECLE   $0007,  $0170,  $0081,  $0000   ; 5177   0007 0170 0081 0000
        DECLE   $0006,  $0009,  $0001,  $0001   ; 517B   0006 0009 0001 0001

        EIS                                     ; 517F   0002
        SDBD                                    ; 5180   0001
        MVII    #$519F, R0                      ; 5181   02B8 009F 0051
        MVO     R0,     G_035D                  ; 5184   0240 035D
        SDBD                                    ; 5186   0001
        MVII    #$0600, R1                      ; 5187   02B9 0000 0006
        MVII    #$0200, R4                      ; 518A   02BC 0200
        MVII    #$0005, R0                      ; 518C   02B8 0005

        JSR     R5,     X_FILL_MEM              ; 518E   0004 0114 0341

        SDBD                                    ; 5191   0001
        MVII    #$2200, R1                      ; 5192   02B9 0000 0022
        MVII    #$020F, R4                      ; 5195   02BC 020F

        JSR     R5,     X_FILL_MEM              ; 5197   0004 0114 0341
        JSR     R5,     L_5458                  ; 519A   0004 0154 0058

        B       L_51C1                          ; 519D   0200 0022

        RRC     R1,     1                       ; 519F   0071
        RLC     R3,     1                       ; 51A0   0053
        SAR     R1,     1                       ; 51A1   0069
        RLC     R2,     1                       ; 51A2   0052
        SWAP    R2,     1                       ; 51A3   0042
        RLC     R2,     1                       ; 51A4   0052
        SWAP    R2,     1                       ; 51A5   0042
        RLC     R2,     1                       ; 51A6   0052
        SWAP    R2,     1                       ; 51A7   0042
        RLC     R2,     1                       ; 51A8   0052

        JSR     R5,     L_54D3                  ; 51A9   0004 0154 00D3

        MVII    #$0002, R0                      ; 51AC   02B8 0002
        MVO     R0,     G_0174                  ; 51AE   0240 0174
        PULR    R7                              ; 51B0   02B7

L_51B1:
        PSHR    R5                              ; 51B1   0275
        MVI     G_0174, R0                      ; 51B2   0280 0174
        CMPI    #$0002, R0                      ; 51B4   0378 0002
        BNEQ    L_51BB                          ; 51B6   020C 0003

        JSR     R5,     L_54ED                  ; 51B8   0004 0154 00ED

L_51BB:
        MVII    #$0001, R0                      ; 51BB   02B8 0001
        MVO     R0,     G_0174                  ; 51BD   0240 0174
        PULR    R7                              ; 51BF   02B7

L_51C0:
        PSHR    R5                              ; 51C0   0275
L_51C1:
        MVI     G_015D, R0                      ; 51C1   0280 015D
        MVII    #$0003, R1                      ; 51C3   02B9 0003
        SDBD                                    ; 51C5   0001
        MVII    #$0600, R3                      ; 51C6   02BB 0000 0006
        MVII    #$0202, R4                      ; 51C9   02BC 0202

        JSR     R5,     X_PRNUM_LFT             ; 51CB   0004 0118 009E

        MVI     G_015E, R0                      ; 51CE   0280 015E
        SDBD                                    ; 51D0   0001
        MVII    #$2200, R3                      ; 51D1   02BB 0000 0022
        MVII    #$020F, R4                      ; 51D4   02BC 020F
        J       .EXEC.8C6                       ; 51D6   0004 0318 00C6

L_51D9:
        PSHR    R5                              ; 51D9   0275
        MVII    #$0229, R2                      ; 51DA   02BA 0229
        MVII    #$0007, R1                      ; 51DC   02B9 0007

L_51DE:
        JSR     R5,     L_51EC                  ; 51DE   0004 0150 01EC

        ADDI    #$0011, R2                      ; 51E1   02FA 0011

        JSR     R5,     L_51EC                  ; 51E3   0004 0150 01EC

        ADDI    #$0003, R2                      ; 51E6   02FA 0003
        DECR    R1                              ; 51E8   0011
        BNEQ    L_51DE                          ; 51E9   022C 000C
        PULR    R7                              ; 51EB   02B7

L_51EC:
        PSHR    R5                              ; 51EC   0275
        MVI@    R2,     R0                      ; 51ED   0290
        ANDI    #$01F8, R0                      ; 51EE   03B8 01F8
        BNEQ    L_51FB                          ; 51F0   020C 0009

        JSR     R5,     L_51FC                  ; 51F2   0004 0150 01FC

        ADDI    #$0021, R0                      ; 51F5   02F8 0021
        SLL     R0,     2                       ; 51F7   004C
        SLL     R0,     1                       ; 51F8   0048
        XOR@    R2,     R0                      ; 51F9   03D0
        MVO@    R0,     R2                      ; 51FA   0250
L_51FB:
        PULR    R7                              ; 51FB   02B7

L_51FC:
        PSHR    R5                              ; 51FC   0275
        SDBD                                    ; 51FD   0001
        MVII    #$0062, R0                      ; 51FE   02B8 0062 0000

        JSR     R5,     X_RAND2                 ; 5201   0004 0114 029E

        SDBD                                    ; 5204   0001
        MVII    #$53C7, R4                      ; 5205   02BC 00C7 0053
L_5208:
        CMP@    R4,     R0                      ; 5208   0360
        BPL     L_5208                          ; 5209   0223 0002

        SDBD                                    ; 520B   0001
        SUBI    #$53C8, R4                      ; 520C   033C 00C8 0053
        MOVR    R4,     R0                      ; 520F   00A0
        PULR    R7                              ; 5210   02B7

L_5211:
        MVII    #$0229, R1                      ; 5211   02B9 0229
        MVI     G_015F, R3                      ; 5213   0283 015F
        TSTR    R3                              ; 5215   009B
        BEQ     L_521A                          ; 5216   0204 0002

        ADDI    #$0011, R1                      ; 5218   02F9 0011
L_521A:
        DECR    R0                              ; 521A   0010
        BEQ     L_5221                          ; 521B   0204 0004

        ADDI    #$0014, R1                      ; 521D   02F9 0014
        B       L_521A                          ; 521F   0220 0006
L_5221:
        MOVR    R5,     R7                      ; 5221   00AF

L_5222:
        MVI     G_0170, R1                      ; 5222   0281 0170
        PSHR    R1                              ; 5224   0271
        ADDI    #$0200, R1                      ; 5225   02F9 0200
        MVI@    R1,     R0                      ; 5227   0288
        SWAP    R0,     1                       ; 5228   0040
        CMPI    #$0018, R0                      ; 5229   0378 0018
        BEQ     L_5240                          ; 522B   0204 0013

        MVI     G_0160, R1                      ; 522D   0281 0160
        CLRR    R0                              ; 522F   01C0
        DECR    R1                              ; 5230   0011
        BEQ     L_5235                          ; 5231   0204 0002

        MVII    #$000C, R0                      ; 5233   02B8 000C
L_5235:
        MVI     G_015F, R1                      ; 5235   0281 015F

        JSR     R5,     L_5387                  ; 5237   0004 0150 0387

        PULR    R0                              ; 523A   02B0
        CMP     G_0170, R0                      ; 523B   0340 0170
        BNEQ    L_5222                          ; 523D   022C 001C
        PULR    R7                              ; 523F   02B7

L_5240:
        PULR    R0                              ; 5240   02B0
        PULR    R7                              ; 5241   02B7

        PSHR    R5                              ; 5242   0275
        CMP     G_015F, R1                      ; 5243   0341 015F
        BNEQ    L_52A7                          ; 5245   020C 0060

        DECR    R0                              ; 5247   0010
        BNEQ    L_52A7                          ; 5248   020C 005D

        JSR     R5,     L_51B1                  ; 524A   0004 0150 01B1
        JSR     R5,     L_530F                  ; 524D   0004 0150 030F

        MVII    #$0001, R0                      ; 5250   02B8 0001

        JSR     R5,     L_5211                  ; 5252   0004 0150 0211

        MVII    #$0007, R2                      ; 5255   02BA 0007
        MVII    #$0006, R0                      ; 5257   02B8 0006
        MVI     G_015F, R3                      ; 5259   0283 015F
        TSTR    R3                              ; 525B   009B
        BEQ     L_5260                          ; 525C   0204 0002

        MVII    #$0022, R0                      ; 525E   02B8 0022
L_5260:
        SWAP    R0,     1                       ; 5260   0040
L_5261:
        MVO@    R0,     R1                      ; 5261   0248
        ADDI    #$0014, R1                      ; 5262   02F9 0014
        DECR    R2                              ; 5264   0012
        BNEQ    L_5261                          ; 5265   022C 0005
        B       L_5357                          ; 5267   0200 00EE

        PSHR    R5                              ; 5269   0275
        PSHR    R1                              ; 526A   0271
        PSHR    R0                              ; 526B   0270

        JSR     R5,     L_51B1                  ; 526C   0004 0150 01B1

        PULR    R0                              ; 526F   02B0
        PULR    R2                              ; 5270   02B2
        MVI     G_0175, R1                      ; 5271   0281 0175
        INCR    R1                              ; 5273   0009
        ADDR    R7,     R1                      ; 5274   00F9
        ADD@    R1,     R7                      ; 5275   02CF

        GSWD    R1                              ; 5276   0031

        JSRD    R4,     .EXEC.CBE               ; 5277   0004 001E 00BE

        CMP     G_015F, R2                      ; 527A   0342 015F
        BNEQ    L_52A7                          ; 527C   020C 0029

        CMPI    #$000B, R0                      ; 527E   0378 000B
        BEQ     L_532E                          ; 5280   0204 00AC

        SUBI    #$0007, R0                      ; 5282   0338 0007
        CMPI    #$0001, R0                      ; 5284   0378 0001
        BEQ     L_528C                          ; 5286   0204 0004

        CMPI    #$0002, R0                      ; 5288   0378 0002
        BNEQ    L_52A7                          ; 528A   020C 001B

L_528C:
        MVO     R0,     G_0160                  ; 528C   0240 0160
        MVII    #$0002, R0                      ; 528E   02B8 0002
        MVO     R0,     G_0175                  ; 5290   0240 0175
        B       L_5222                          ; 5292   0220 0071

        CMP     G_015F, R2                      ; 5294   0342 015F
        BNEQ    L_52A7                          ; 5296   020C 000F

        TSTR    R0                              ; 5298   0080
        BEQ     L_52A9                          ; 5299   0204 000E

        CMPI    #$0008, R0                      ; 529B   0378 0008
        BMI     L_52DF                          ; 529D   020B 0040

        CMPI    #$000A, R0                      ; 529F   0378 000A
        BEQ     L_5310                          ; 52A1   0204 006D

        CMPI    #$000B, R0                      ; 52A3   0378 000B
        BEQ     L_531F                          ; 52A5   0204 0078
L_52A7:
        PULR    R7                              ; 52A7   02B7

L_52A8:
        PSHR    R5                              ; 52A8   0275
L_52A9:
        MVII    #$0002, R0                      ; 52A9   02B8 0002
        MVO     R0,     G_0175                  ; 52AB   0240 0175
        MVI     G_0161, R1                      ; 52AD   0281 0161
        MOVR    R1,     R0                      ; 52AF   0088
        DECR    R0                              ; 52B0   0010
        BPL     L_52B4                          ; 52B1   0203 0001
        PULR    R7                              ; 52B3   02B7

L_52B4:
        MVO     R0,     G_0161                  ; 52B4   0240 0161
        SLL     R1,     1                       ; 52B6   0049
        ADDI    #$0160, R1                      ; 52B7   02F9 0160
        MVI@    R1,     R0                      ; 52B9   0288
        PSHR    R0                              ; 52BA   0270
        INCR    R1                              ; 52BB   0009
        MVI@    R1,     R2                      ; 52BC   028A
L_52BD:
        CMP     G_0170, R2                      ; 52BD   0342 0170
        BEQ     L_52D2                          ; 52BF   0204 0011

        PSHR    R2                              ; 52C1   0272
        MVII    #$0004, R0                      ; 52C2   02B8 0004
        MVI     G_0160, R1                      ; 52C4   0281 0160
        CMPI    #$0001, R1                      ; 52C6   0379 0001
        BNEQ    L_52CC                          ; 52C8   020C 0002

        MVII    #$0008, R0                      ; 52CA   02B8 0008

L_52CC:
        JSR     R5,     L_5387                  ; 52CC   0004 0150 0387

        PULR    R2                              ; 52CF   02B2
        B       L_52BD                          ; 52D0   0220 0014

L_52D2:
        PULR    R0                              ; 52D2   02B0

        JSR     R5,     L_5211                  ; 52D3   0004 0150 0211

        ADDI    #$0200, R2                      ; 52D6   02FA 0200
        MVI@    R2,     R0                      ; 52D8   0290
        MVO@    R0,     R1                      ; 52D9   0248
        MVII    #$0018, R0                      ; 52DA   02B8 0018
        SWAP    R0,     1                       ; 52DC   0040
        MVO@    R0,     R2                      ; 52DD   0250
        PULR    R7                              ; 52DE   02B7

L_52DF:
        MVI     G_0170, R1                      ; 52DF   0281 0170
        MVI     G_0161, R2                      ; 52E1   0282 0161
        INCR    R2                              ; 52E3   000A
        CMPI    #$0008, R2                      ; 52E4   037A 0008
        BGE     L_531E                          ; 52E6   020D 0036

        SLL     R2,     1                       ; 52E8   004A
        ADDI    #$0160, R2                      ; 52E9   02FA 0160
        MOVR    R2,     R4                      ; 52EB   0094
        MVO@    R0,     R4                      ; 52EC   0260
        MVO@    R1,     R4                      ; 52ED   0261

        JSR     R5,     L_5211                  ; 52EE   0004 0150 0211

        MVI     G_0170, R2                      ; 52F1   0282 0170
        ADDI    #$0200, R2                      ; 52F3   02FA 0200
        MVI@    R2,     R0                      ; 52F5   0290
        SDBD                                    ; 52F6   0001
        CMPI    #$1800, R0                      ; 52F7   0378 0000 0018
        BNEQ    L_531E                          ; 52FA   020C 0022

        MVI@    R1,     R0                      ; 52FC   0288
        ANDI    #$01F8, R0                      ; 52FD   03B8 01F8
        BEQ     L_531E                          ; 52FF   0204 001D

        MVI@    R1,     R0                      ; 5301   0288
        MVO@    R0,     R2                      ; 5302   0250
        SDBD                                    ; 5303   0001
        ANDI    #$7E07, R0                      ; 5304   03B8 0007 007E
        MVO@    R0,     R1                      ; 5307   0248
        MVI     G_0161, R0                      ; 5308   0280 0161
        INCR    R0                              ; 530A   0008
        MVO     R0,     G_0161                  ; 530B   0240 0161
        B       L_5222                          ; 530D   0220 00EC

L_530F:
        PSHR    R5                              ; 530F   0275
L_5310:
        MVI     G_0161, R0                      ; 5310   0280 0161
        TSTR    R0                              ; 5312   0080
        BEQ     L_531A                          ; 5313   0204 0005

        JSR     R5,     L_52A8                  ; 5315   0004 0150 02A8

        B       L_5310                          ; 5318   0220 0009

L_531A:
        MVII    #$0001, R0                      ; 531A   02B8 0001
        MVO     R0,     G_0175                  ; 531C   0240 0175
L_531E:
        PULR    R7                              ; 531E   02B7

L_531F:
        MVI     G_0161, R0                      ; 531F   0280 0161
        TSTR    R0                              ; 5321   0080
        BEQ     L_532E                          ; 5322   0204 000A

        JSR     R5,     L_54A4                  ; 5324   0004 0154 00A4

        BC      L_532E                          ; 5327   0201 0005

        JSR     R5,     X_PLAY_RAZZ2            ; 5329   0004 011C 02BD

        B       L_5310                          ; 532C   0220 001D

L_532E:
        MVII    #$0003, R0                      ; 532E   02B8 0003
        MVO     R0,     G_0175                  ; 5330   0240 0175
        B       L_5352                          ; 5332   0200 001E

        CMP     G_015F, R2                      ; 5334   0342 015F
        BNEQ    L_5341                          ; 5336   020C 0009

        TSTR    R0                              ; 5338   0080
        BEQ     L_52A9                          ; 5339   0224 0091

        CMPI    #$000A, R0                      ; 533B   0378 000A
        BEQ     L_5310                          ; 533D   0224 002E
        B       L_5352                          ; 533F   0200 0011

L_5341:
        CMPI    #$000B, R0                      ; 5341   0378 000B
        BNEQ    L_5352                          ; 5343   020C 000D

        MVI     G_0161, R0                      ; 5345   0280 0161
        TSTR    R0                              ; 5347   0080
        BEQ     L_5350                          ; 5348   0204 0006

        JSR     R5,     L_53E1                  ; 534A   0004 0150 03E1
        JSR     R5,     L_548E                  ; 534D   0004 0154 008E

L_5350:
        B       L_5357                          ; 5350   0200 0005

L_5352:
        MVII    #$0003, R0                      ; 5352   02B8 0003
        MVO     R0,     G_0174                  ; 5354   0240 0174
        PULR    R7                              ; 5356   02B7

L_5357:
        JSR     R5,     L_51C0                  ; 5357   0004 0150 01C0
        JSR     R5,     L_51D9                  ; 535A   0004 0150 01D9

        CLRR    R0                              ; 535D   01C0
        MVO     R0,     G_0161                  ; 535E   0240 0161
        MVII    #$0001, R0                      ; 5360   02B8 0001
        MVO     R0,     G_0175                  ; 5362   0240 0175
        MVI     G_015F, R0                      ; 5364   0280 015F
        XORI    #$0001, R0                      ; 5366   03F8 0001
        MVO     R0,     G_015F                  ; 5368   0240 015F
        MVI     G_0176, R0                      ; 536A   0280 0176
        INCR    R0                              ; 536C   0008
        MVO     R0,     G_0176                  ; 536D   0240 0176
        B       L_5459                          ; 536F   0200 00E8

        PSHR    R5                              ; 5371   0275
        MVI     G_0175, R5                      ; 5372   0285 0175
        CMPI    #$0001, R5                      ; 5374   037D 0001
        BNEQ    L_53AA                          ; 5376   020C 0032

        CMP     G_015F, R1                      ; 5378   0341 015F
        BNEQ    L_53AA                          ; 537A   020C 002E

        TSTR    R0                              ; 537C   0080
        BMI     L_53AA                          ; 537D   020B 002B

        SLR     R0,     1                       ; 537F   0060
        SLL     R0,     1                       ; 5380   0048
        PSHR    R0                              ; 5381   0270

        JSR     R5,     L_51B1                  ; 5382   0004 0150 01B1

        PULR    R0                              ; 5385   02B0
        INCR    R7                              ; 5386   000F

L_5387:
        PSHR    R5                              ; 5387   0275
L_5388:
        MOVR    R0,     R1                      ; 5388   0081
        SLR     R1,     1                       ; 5389   0061
        ADDR    R0,     R1                      ; 538A   00C1
        MOVR    R1,     R4                      ; 538B   008C
        SDBD                                    ; 538C   0001
        ADDI    #$53AB, R4                      ; 538D   02FC 00AB 0053
        MVI@    R4,     R0                      ; 5390   02A0
        MVI@    R4,     R1                      ; 5391   02A1
        MVI@    R4,     R2                      ; 5392   02A2
        SUBI    #$0015, R0                      ; 5393   0338 0015
        DECR    R1                              ; 5395   0011
        DECR    R2                              ; 5396   0012
        ADD     G_0170, R0                      ; 5397   02C0 0170
        ADD     G_0172, R1                      ; 5399   02C1 0172
        ADD     G_0173, R2                      ; 539B   02C2 0173
        SDBD                                    ; 539D   0001
        MVII    #$53C3, R4                      ; 539E   02BC 00C3 0053

        JSR     R5,     L_54FD                  ; 53A1   0004 0154 00FD

        MVO     R0,     G_0170                  ; 53A4   0240 0170
        MVO     R1,     G_0172                  ; 53A6   0241 0172
        MVO     R2,     G_0173                  ; 53A8   0242 0173
L_53AA:
        PULR    R7                              ; 53AA   02B7

        DECLE   $0016,  $0001,  $0002,  $0002   ; 53AB   0016 0001 0002 0002
        DECLE   $0000,  $0002,  $0001,  $0000   ; 53AF   0000 0002 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 53B3   0001 0000 0000 0000
        DECLE   $0014,  $0001,  $0000,  $0028   ; 53B7   0014 0001 0000 0028
        DECLE   $0002,  $0000,  $0029,  $0002   ; 53BB   0002 0000 0029 0002
        DECLE   $0001,  $002A,  $0002,  $0002   ; 53BF   0001 002A 0002 0002
        DECLE   $0000,  $000C,  $0001,  $0012   ; 53C3   0000 000C 0001 0012
        DECLE   $0009,  $000B,  $000D,  $0011   ; 53C7   0009 000B 000D 0011
        DECLE   $001D,  $001F,  $0022,  $0024   ; 53CB   001D 001F 0022 0024
        DECLE   $002D,  $002E,  $002F,  $0033   ; 53CF   002D 002E 002F 0033
        DECLE   $0035                           ; 53D3   0035

        RSWD    R3                              ; 53D4   003B
        SWAP    R3,     1                       ; 53D5   0043
        SWAP    R1,     2                       ; 53D6   0045
        SWAP    R2,     2                       ; 53D7   0046
        SLL     R0,     2                       ; 53D8   004C
        RLC     R0,     1                       ; 53D9   0050
        RLC     R2,     2                       ; 53DA   0056
        SLLC    R2,     1                       ; 53DB   005A
        SLLC    R0,     2                       ; 53DC   005C
        SLLC    R2,     2                       ; 53DD   005E
        SLLC    R3,     2                       ; 53DE   005F
        SLR     R1,     1                       ; 53DF   0061
        SLR     R2,     1                       ; 53E0   0062
L_53E1:
        PSHR    R5                              ; 53E1   0275
        MVI     G_0161, R0                      ; 53E2   0280 0161
        DECR    R0                              ; 53E4   0010
        BGT     L_53F4                          ; 53E5   020E 000D

        MVI     G_015D, R1                      ; 53E7   0281 015D
        ADD     G_015E, R1                      ; 53E9   02C1 015E
        BNEQ    L_53F4                          ; 53EB   020C 0007

        MVII    #$015D, R1                      ; 53ED   02B9 015D
        ADD     G_015F, R1                      ; 53EF   02C1 015F
        INCR    R0                              ; 53F1   0008
        MVO@    R0,     R1                      ; 53F2   0248
        PULR    R7                              ; 53F3   02B7

L_53F4:
        MVI     G_0163, R2                      ; 53F4   0282 0163
        ADDI    #$0200, R2                      ; 53F6   02FA 0200
        MVI     G_0160, R1                      ; 53F8   0281 0160

        JSR     R5,     L_5414                  ; 53FA   0004 0154 0014

        MVII    #$0163, R4                      ; 53FD   02BC 0163
        MVI     G_0161, R3                      ; 53FF   0283 0161
L_5401:
        MVI@    R4,     R2                      ; 5401   02A2
        MVI     G_0160, R1                      ; 5402   0281 0160
        XORI    #$0003, R1                      ; 5404   03F9 0003
        ADDI    #$0200, R2                      ; 5406   02FA 0200
        PSHR    R4                              ; 5408   0274
        PSHR    R3                              ; 5409   0273

        JSR     R5,     L_5414                  ; 540A   0004 0154 0014

        PULR    R3                              ; 540D   02B3
        PULR    R4                              ; 540E   02B4
        INCR    R4                              ; 540F   000C
        DECR    R3                              ; 5410   0013
        BNEQ    L_5401                          ; 5411   022C 0011
        PULR    R7                              ; 5413   02B7

L_5414:
        PSHR    R5                              ; 5414   0275
        MVII    #$0001, R3                      ; 5415   02BB 0001
        MOVR    R3,     R4                      ; 5417   009C
        DECR    R1                              ; 5418   0011
        BEQ     L_541D                          ; 5419   0204 0002

        MVII    #$0014, R3                      ; 541B   02BB 0014
L_541D:
        PSHR    R2                              ; 541D   0272

        JSR     R5,     L_5431                  ; 541E   0004 0154 0031

        PULR    R2                              ; 5421   02B2
        NEGR    R3                              ; 5422   0023

        JSR     R5,     L_5431                  ; 5423   0004 0154 0031

        CMPI    #$0001, R4                      ; 5426   037C 0001
        BEQ     L_5430                          ; 5428   0204 0006

        MVII    #$015D, R1                      ; 542A   02B9 015D
        ADD     G_015F, R1                      ; 542C   02C1 015F
        ADD@    R1,     R4                      ; 542E   02CC
        MVO@    R4,     R1                      ; 542F   024C
L_5430:
        PULR    R7                              ; 5430   02B7

L_5431:
        PSHR    R5                              ; 5431   0275
L_5432:
        ADDR    R3,     R2                      ; 5432   00DA
        CMPI    #$02F0, R2                      ; 5433   037A 02F0
        BGE     L_5457                          ; 5435   020D 0020

        CMPI    #$0214, R2                      ; 5437   037A 0214
        BLT     L_5457                          ; 5439   0205 001C

        MOVR    R2,     R1                      ; 543B   0091
        PSHR    R2                              ; 543C   0272
        SUBI    #$0200, R1                      ; 543D   0339 0200
        MVII    #$0014, R2                      ; 543F   02BA 0014

        JSR     R5,     X_DIV                   ; 5441   0004 011C 01FB

        PULR    R2                              ; 5444   02B2
        CMPI    #$0002, R1                      ; 5445   0379 0002
        BLT     L_5457                          ; 5447   0205 000E

        CMPI    #$0012, R1                      ; 5449   0379 0012
        BGE     L_5457                          ; 544B   020D 000A

        MVI@    R2,     R0                      ; 544D   0290
        SDBD                                    ; 544E   0001
        ANDI    #$0800, R0                      ; 544F   03B8 0000 0008
        BNEQ    L_5457                          ; 5452   020C 0003

        INCR    R4                              ; 5454   000C
        B       L_5432                          ; 5455   0220 0024
L_5457:
        PULR    R7                              ; 5457   02B7

L_5458:
        PSHR    R5                              ; 5458   0275
L_5459:
        MVII    #$0205, R4                      ; 5459   02BC 0205
        SDBD                                    ; 545B   0001
        MVII    #$2401, R3                      ; 545C   02BB 0001 0024
        MVI     G_0176, R0                      ; 545F   0280 0176
        SLR     R0,     1                       ; 5461   0060
        CMPI    #$0015, R0                      ; 5462   0378 0015
        BEQ     L_547A                          ; 5464   0204 0014

        PSHR    R0                              ; 5466   0270

        JSR     R5,     X_PRINT_R5              ; 5467   0004 0118 007B
        STRING  " MOVE: "                       ; 546A  
        DECLE   $0000                           ; 5471   0000

        PULR    R0                              ; 5472   02B0
        MVII    #$0003, R1                      ; 5473   02B9 0003
        SLL     R3,     1                       ; 5475   004B
        SLR     R3,     1                       ; 5476   0063
        J       .EXEC.89F                       ; 5477   0004 0318 009F

L_547A:
        JSR     R5,     X_PRINT_R5              ; 547A   0004 0118 007B
        STRING  "   GAME   "                    ; 547D  
        DECLE   $0000                           ; 5487   0000

        JSR     R5,     L_50DF                  ; 5488   0004 0150 00DF

        J       L_50F8                          ; 548B   0004 0350 00F8

L_548E:
        MVII    #$0163, R4                      ; 548E   02BC 0163
        MVI     G_0161, R3                      ; 5490   0283 0161
L_5492:
        MVI@    R4,     R1                      ; 5492   02A1
        ADDI    #$0200, R1                      ; 5493   02F9 0200
        MVI@    R1,     R0                      ; 5495   0288
        SDBD                                    ; 5496   0001
        ANDI    #$C9FF, R0                      ; 5497   03B8 00FF 00C9
        SDBD                                    ; 549A   0001
        XORI    #$2400, R0                      ; 549B   03F8 0000 0024
        MVO@    R0,     R1                      ; 549E   0248
        INCR    R4                              ; 549F   000C
        DECR    R3                              ; 54A0   0013
        BNEQ    L_5492                          ; 54A1   022C 0010
        MOVR    R5,     R7                      ; 54A3   00AF

L_54A4:
        PSHR    R5                              ; 54A4   0275
        MVI     G_015D, R0                      ; 54A5   0280 015D
        ADD     G_015F, R0                      ; 54A7   02C0 015F
        BEQ     L_54C1                          ; 54A9   0204 0016

        MVII    #$015D, R1                      ; 54AB   02B9 015D
        ADD     G_015F, R1                      ; 54AD   02C1 015F
        MVI@    R1,     R0                      ; 54AF   0288
        PSHR    R0                              ; 54B0   0270
        CLRR    R0                              ; 54B1   01C0
        MVO@    R0,     R1                      ; 54B2   0248
        PSHR    R1                              ; 54B3   0271

        JSR     R5,     L_53E1                  ; 54B4   0004 0150 03E1

        PULR    R1                              ; 54B7   02B1
        MVI@    R1,     R0                      ; 54B8   0288
        PULR    R2                              ; 54B9   02B2
        MVO@    R2,     R1                      ; 54BA   024A
        CMP     G_0161, R0                      ; 54BB   0340 0161
        BGT     L_54C1                          ; 54BD   020E 0002

        CLRC                                    ; 54BF   0006
        PULR    R7                              ; 54C0   02B7

L_54C1:
        SETC                                    ; 54C1   0007
        PULR    R7                              ; 54C2   02B7

        DECLE   $00FF,  $0080,  $0080,  $0080   ; 54C3   00FF 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 54C7   0080 0080 0080 0080
        DECLE   $0000,  $007E,  $007E,  $007E   ; 54CB   0000 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $0000   ; 54CF   007E 007E 007E 0000
L_54D3:
        PSHR    R5                              ; 54D3   0275
        MVI     G_0170, R1                      ; 54D4   0281 0170
        ADDI    #$0200, R1                      ; 54D6   02F9 0200
        MVI@    R1,     R0                      ; 54D8   0288
        SWAP    R0,     1                       ; 54D9   0040
        ANDI    #$0036, R0                      ; 54DA   03B8 0036
        MVO     R0,     G_0171                  ; 54DC   0240 0171
        MVI@    R1,     R0                      ; 54DE   0288
        SDBD                                    ; 54DF   0001
        ANDI    #$09FF, R0                      ; 54E0   03B8 00FF 0009
        SDBD                                    ; 54E3   0001
        XORI    #$2600, R0                      ; 54E4   03F8 0000 0026
        MVO@    R0,     R1                      ; 54E7   0248
        MVII    #$0002, R0                      ; 54E8   02B8 0002
        MVO     R0,     G_0174                  ; 54EA   0240 0174
        PULR    R7                              ; 54EC   02B7

L_54ED:
        PSHR    R5                              ; 54ED   0275
        MVI     G_0170, R1                      ; 54EE   0281 0170
        ADDI    #$0200, R1                      ; 54F0   02F9 0200
        MVI     G_0171, R0                      ; 54F2   0280 0171
        SWAP    R0,     1                       ; 54F4   0040
        MVI@    R1,     R2                      ; 54F5   028A
        SDBD                                    ; 54F6   0001
        ANDI    #$09FF, R2                      ; 54F7   03BA 00FF 0009
        XORR    R0,     R2                      ; 54FA   01C2
        MVO@    R2,     R1                      ; 54FB   024A
        PULR    R7                              ; 54FC   02B7

L_54FD:
        PSHR    R5                              ; 54FD   0275
        CMP@    R4,     R1                      ; 54FE   0361
        BEQ     L_550A                          ; 54FF   0204 0009

        CMP@    R4,     R1                      ; 5501   0361
        BEQ     L_550A                          ; 5502   0204 0006

        CMP@    R4,     R2                      ; 5504   0362
        BEQ     L_550A                          ; 5505   0204 0003

        CMP@    R4,     R2                      ; 5507   0362
        BNEQ    L_550B                          ; 5508   020C 0001

L_550A:
        PULR    R0                              ; 550A   02B0
L_550B:
        PULR    R7                              ; 550B   02B7

        DECLE   $0008,  $0031,  $00D9,  $0055   ; 550C   0008 0031 00D9 0055
        DECLE   $0027,  $0055,  $0009,  $0056   ; 5510   0027 0055 0009 0056
        DECLE   $0002,  $0056,  $003B,  $0050   ; 5514   0002 0056 003B 0050
        DECLE   $0080,  $0000,  $0000,  $03DF   ; 5518   0080 0000 0000 03DF

        SDBD                                    ; 551C   0001
        XOR@    R3,     R3                      ; 551D   03DB
        EIS                                     ; 551E   0002
        XOR@    R3,     R3                      ; 551F   03DB
        XORR    R7,     R0                      ; 5520   01F8
        XORR    R6,     R0                      ; 5521   01F0
        XORR    R5,     R0                      ; 5522   01E8
        XORR    R4,     R0                      ; 5523   01E0
        XORR    R3,     R0                      ; 5524   01D8
        XORR    R2,     R0                      ; 5525   01D0
        XORR    R1,     R0                      ; 5526   01C8
        PSHR    R5                              ; 5527   0275
        MVII    #$00F0, R0                      ; 5528   02B8 00F0
        MVII    #$0200, R4                      ; 552A   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 552C   0004 0114 0338
        JSR     R5,     L_5688                  ; 552F   0004 0154 0288

        SDBD                                    ; 5532   0001
        MVII    #$2000, R0                      ; 5533   02B8 0000 0020
        MVO     R0,     .BTAB.14                ; 5536   0240 0214
        MVO     R0,     .BTAB.DC                ; 5538   0240 02DC
        SDBD                                    ; 553A   0001
        MVII    #$0817, R0                      ; 553B   02B8 0017 0008
        MVO     R0,     .BTAB.3D                ; 553E   0240 023D
        ADDI    #$0010, R0                      ; 5540   02F8 0010
        MVO     R0,     .BTAB.3E                ; 5542   0240 023E
        MVO     R0,     .BTAB.91                ; 5544   0240 0291
        SUBI    #$0010, R0                      ; 5546   0338 0010
        MVO     R0,     .BTAB.90                ; 5548   0240 0290
        MVO     R0,     .BTAB.46                ; 554A   0240 0246
        ADDI    #$0010, R0                      ; 554C   02F8 0010
        MVO     R0,     .BTAB.47                ; 554E   0240 0247
        MVO     R0,     .BTAB.9D                ; 5550   0240 029D
        SUBI    #$0010, R0                      ; 5552   0338 0010
        MVO     R0,     .BTAB.9C                ; 5554   0240 029C
        MVII    #$02B5, R4                      ; 5556   02BC 02B5

        JSR     R5,     L_569E                  ; 5558   0004 0154 029E

        MVII    #$02BD, R4                      ; 555B   02BC 02BD

        JSR     R5,     L_569E                  ; 555D   0004 0154 029E

        MVII    #$02C5, R4                      ; 5560   02BC 02C5

        JSR     R5,     L_569E                  ; 5562   0004 0154 029E

        SDBD                                    ; 5565   0001
        MVII    #$55EB, R1                      ; 5566   02B9 00EB 0055
        MVII    #$0335, R2                      ; 5569   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 556B   0004 0114 02B2

        MVII    #$0345, R2                      ; 556E   02BA 0345

        JSR     R5,     X_INIT_MOB              ; 5570   0004 0114 02B2

        MVII    #$0088, R0                      ; 5573   02B8 0088
        SWAP    R0,     1                       ; 5575   0040
        MVO     R0,     G_0347                  ; 5576   0240 0347
        SDBD                                    ; 5578   0001
        MVII    #$1082, R0                      ; 5579   02B8 0082 0010
        MVO     R0,     G_0335                  ; 557C   0240 0335
        SDBD                                    ; 557E   0001
        MVII    #$1086, R0                      ; 557F   02B8 0086 0010
        MVO     R0,     G_0345                  ; 5582   0240 0345
        MVII    #$0005, R0                      ; 5584   02B8 0005
        MVO     R0,     G_0166                  ; 5586   0240 0166
        MVII    #$0033, R0                      ; 5588   02B8 0033
        MVO     R0,     G_0165                  ; 558A   0240 0165
        MVII    #$02DE, R1                      ; 558C   02B9 02DE
L_558E:
        SDBD                                    ; 558E   0001
        MVII    #$0617, R0                      ; 558F   02B8 0017 0006
        MVO@    R0,     R1                      ; 5592   0248
        ADDI    #$0002, R1                      ; 5593   02F9 0002
        CMPI    #$02EC, R1                      ; 5595   0379 02EC
        BGT     L_55A0                          ; 5597   020E 0007

        JSR     R5,     L_5654                  ; 5599   0004 0154 0254

        ADDI    #$0002, R1                      ; 559C   02F9 0002
        B       L_558E                          ; 559E   0220 0011

L_55A0:
        SDBD                                    ; 55A0   0001
        MVII    #$56FA, R0                      ; 55A1   02B8 00FA 0056
        MVO     R0,     G_035D                  ; 55A4   0240 035D
        SDBD                                    ; 55A6   0001
        MVII    #$5762, R1                      ; 55A7   02B9 0062 0057
        MVII    #$033D, R2                      ; 55AA   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 55AC   0004 0114 02B2

        MVII    #$034D, R2                      ; 55AF   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 55B1   0004 0114 02B2

        MVII    #$031D, R2                      ; 55B4   02BA 031D

L_55B6:
        JSR     R5,     X_INIT_MOB              ; 55B6   0004 0114 02B2

        ADDI    #$0008, R2                      ; 55B9   02FA 0008
        CMPI    #$032D, R2                      ; 55BB   037A 032D
        BLE     L_55B6                          ; 55BD   0226 0008

        MVII    #$0001, R0                      ; 55BF   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 55C1   0004 0114 02CF

        INCR    R0                              ; 55C4   0008

        JSR     R5,     .EXEC.6CF               ; 55C5   0004 0114 02CF

        MVII    #$0008, R0                      ; 55C8   02B8 0008
        SWAP    R0,     1                       ; 55CA   0040
        MVO     R0,     G_0329                  ; 55CB   0240 0329
        MVO     R0,     G_0331                  ; 55CD   0240 0331
        MVII    #$0080, R0                      ; 55CF   02B8 0080
        MVO     R0,     G_034D                  ; 55D1   0240 034D
        MVO     R0,     G_033D                  ; 55D3   0240 033D

        JSR     R5,     L_57E3                  ; 55D5   0004 0154 03E3

        PULR    R7                              ; 55D8   02B7

        DECLE   $0071,  $001A,  $0001,  $0080   ; 55D9   0071 001A 0001 0080
        DECLE   $0029,  $0056,  $0001,  $0000   ; 55DD   0029 0056 0001 0000
        DECLE   $00B1,  $0056,  $0001,  $0000   ; 55E1   00B1 0056 0001 0000
        DECLE   $006F,  $0056,  $0001,  $0000   ; 55E5   006F 0056 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E9   0000 0000 0000 0000
        DECLE   $00FB,  $0055,  $0000,  $0028   ; 55ED   00FB 0055 0000 0028
        DECLE   $0000,  $0058,  $0000,  $0000   ; 55F1   0000 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 55F9   0000 0000 0300 0000
        DECLE   $0000,  $0000                   ; 55FD   0000 0000

        EIS                                     ; 55FF   0002
        ADDR    R3,     R7                      ; 5600   00DF

        DECLE   $0000,  $0006,  $0001,  $0080   ; 5601   0000 0006 0001 0080
        DECLE   $0005,  $0080,  $0205,  $0080   ; 5605   0005 0080 0205 0080
        DECLE   $0000,  $0081,  $0081,  $00FF   ; 5609   0000 0081 0081 00FF
        DECLE   $0000                           ; 560D   0000

        SWAP    R2,     1                       ; 560E   0042
        ADDR    R4,     R7                      ; 560F   00E7

        DECLE   $0042,  $0000,  $0081,  $0081   ; 5610   0042 0000 0081 0081
        DECLE   $00FF,  $0000,  $00A5,  $0042   ; 5614   00FF 0000 00A5 0042
        DECLE   $00A5,  $0000,  $0009,  $001F   ; 5618   00A5 0000 0009 001F
        DECLE   $007F,  $00FF,  $007F,  $003F   ; 561C   007F 00FF 007F 003F
        DECLE   $0015,  $0005,  $0003,  $0001   ; 5620   0015 0005 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0003   ; 5624   0001 0001 0001 0003
        DECLE   $000F                           ; 5628   000F

        MVII    #$011F, R2                      ; 5629   02BA 011F
        MVII    #$033A, R3                      ; 562B   02BB 033A
L_562D:
        MVI@    R3,     R4                      ; 562D   029C
        SDBD                                    ; 562E   0001
        ANDI    #$FC0F, R4                      ; 562F   03BC 000F 00FC
        CLRR    R1                              ; 5632   01C9
        MVI@    R2,     R0                      ; 5633   0290
        ANDI    #$00C0, R0                      ; 5634   03B8 00C0
        BNEQ    L_5649                          ; 5636   020C 0011

        MVI@    R2,     R0                      ; 5638   0290
        MVII    #$0078, R1                      ; 5639   02B9 0078
        CMPI    #$0004, R0                      ; 563B   0378 0004
        BLT     L_5644                          ; 563D   0205 0005

        CMPI    #$000C, R0                      ; 563F   0378 000C
        BGE     L_5644                          ; 5641   020D 0001

        NEGR    R1                              ; 5643   0021
L_5644:
        ANDI    #$00FF, R1                      ; 5644   03B9 00FF
        SWAP    R1,     1                       ; 5646   0041
        XORI    #$01F0, R4                      ; 5647   03FC 01F0
L_5649:
        MVO@    R4,     R3                      ; 5649   025C
        DECR    R3                              ; 564A   0013
        MVO@    R1,     R3                      ; 564B   0259
        MVII    #$034A, R3                      ; 564C   02BB 034A
        INCR    R2                              ; 564E   000A
        CMPI    #$0120, R2                      ; 564F   037A 0120
        BLE     L_562D                          ; 5651   0226 0025
        MOVR    R5,     R7                      ; 5653   00AF

L_5654:
        PSHR    R5                              ; 5654   0275
        MOVR    R1,     R2                      ; 5655   008A
        SUBI    #$02E0, R2                      ; 5656   033A 02E0
        SLR     R2,     2                       ; 5658   0066
        ADDI    #$015E, R2                      ; 5659   02FA 015E
L_565B:
        MVI     G_0166, R0                      ; 565B   0280 0166

        JSR     R5,     X_RAND2                 ; 565D   0004 0114 029E

        CMP@    R2,     R0                      ; 5660   0350
        BEQ     L_565B                          ; 5661   0224 0007

        MVO@    R0,     R2                      ; 5663   0250
        MOVR    R0,     R2                      ; 5664   0082
        SDBD                                    ; 5665   0001
        ADDI    #$5916, R2                      ; 5666   02FA 0016 0059
        MVI@    R2,     R0                      ; 5669   0290
        SLR     R0,     2                       ; 566A   0064
        ADDI    #$0108, R0                      ; 566B   02F8 0108
        MVO@    R0,     R1                      ; 566D   0248
        PULR    R7                              ; 566E   02B7

        DECLE   $0280,  $0162,  $0080,  $0204   ; 566F   0280 0162 0080 0204
        DECLE   $0013,  $0010,  $0240,  $0162   ; 5673   0013 0010 0240 0162
        DECLE   $0280,  $0200,  $0001           ; 5677   0280 0200 0001

        XORI    #$0000, R0                      ; 567A   03F8 0000
        NEGR    R0                              ; 567C   0020
        MVO     R0,     .BTAB.00                ; 567D   0240 0200
        MVI     .BTAB.13,R0                     ; 567F   0280 0213
        SDBD                                    ; 5681   0001
        XORI    #$2000, R0                      ; 5682   03F8 0000 0020
        MVO     R0,     .BTAB.13                ; 5685   0240 0213
        MOVR    R5,     R7                      ; 5687   00AF

L_5688:
        PSHR    R5                              ; 5688   0275
        MVII    #$0201, R4                      ; 5689   02BC 0201
        MVII    #$0003, R1                      ; 568B   02B9 0003
        MVII    #$0002, R3                      ; 568D   02BB 0002
        MVI     G_0163, R0                      ; 568F   0280 0163

        JSR     R5,     X_PRNUM_RGT             ; 5691   0004 0118 00C5

        MVII    #$0210, R4                      ; 5694   02BC 0210
        MVII    #$0006, R3                      ; 5696   02BB 0006
        MVI     G_0164, R0                      ; 5698   0280 0164

        JSR     R5,     X_PRNUM_LFT             ; 569A   0004 0118 009E

        PULR    R7                              ; 569D   02B7

L_569E:
        SDBD                                    ; 569E   0001
        MVII    #$0815, R0                      ; 569F   02B8 0015 0008
        MVO@    R0,     R4                      ; 56A2   0260
        ADDI    #$0010, R0                      ; 56A3   02F8 0010
        MVO@    R0,     R4                      ; 56A5   0260
        ADDI    #$0012, R4                      ; 56A6   02FC 0012
        SDBD                                    ; 56A8   0001
        MVII    #$081B, R0                      ; 56A9   02B8 001B 0008
        MVO@    R0,     R4                      ; 56AC   0260
        ADDI    #$0010, R0                      ; 56AD   02F8 0010
        MVO@    R0,     R4                      ; 56AF   0260
        MOVR    R5,     R7                      ; 56B0   00AF

        PSHR    R5                              ; 56B1   0275
        MVII    #$0320, R1                      ; 56B2   02B9 0320

        JSR     R5,     L_5DAD                  ; 56B4   0004 015C 01AD
        DECLE   $0000,  $0000                   ; 56B7   0000 0000

        SETC                                    ; 56B9   0007
        BNC     L_56E0                          ; 56BA   0209 0024

        MVI     G_0163, R0                      ; 56BC   0280 0163
        CMPI    #$0032, R0                      ; 56BE   0378 0032
        BEQ     L_56C8                          ; 56C0   0204 0006

        MVI     G_0164, R0                      ; 56C2   0280 0164
        CMPI    #$0032, R0                      ; 56C4   0378 0032
        BNEQ    L_56F7                          ; 56C6   020C 002F

L_56C8:
        JSR     R5,     L_50DF                  ; 56C8   0004 0150 00DF
        JSR     R5,     .EXEC.7B3               ; 56CB   0004 0114 03B3

        MVII    #$0007, R3                      ; 56CE   02BB 0007
        MVII    #$0208, R4                      ; 56D0   02BC 0208

        JSR     R5,     X_PRINT_R5              ; 56D2   0004 0118 007B
        STRING  "GAME"                          ; 56D5   0047 0041 004D 0045
        DECLE   $0000                           ; 56D9   0000

        MVII    #$000A, R0                      ; 56DA   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 56DC   0004 011C 02D5

        PULR    R7                              ; 56DF   02B7

L_56E0:
        DECR    R1                              ; 56E0   0011
        MVI     G_0321, R0                      ; 56E1   0280 0321
        TSTR    R0                              ; 56E3   0080
        BPL     L_56EF                          ; 56E4   0203 0009

        JSR     R5,     L_5DAD                  ; 56E6   0004 015C 01AD
        DECLE   $0000,  $00DC                   ; 56E9   0000 00DC

        ADDR    R6,     R0                      ; 56EB   00F0
        BC      L_56F7                          ; 56EC   0201 0009
L_56EE:
        PULR    R7                              ; 56EE   02B7

L_56EF:
        JSR     R5,     L_5DAD                  ; 56EF   0004 015C 01AD
        DECLE   $0000,  $00A8                   ; 56F2   0000 00A8

        ADDR    R3,     R4                      ; 56F4   00DC
        BNC     L_56EE                          ; 56F5   0229 0008

L_56F7:
        JSR     R5,     L_57E4                  ; 56F7   0004 0154 03E4
        DECLE   $0000,  $0000,  $00EE,  $0058   ; 56FA   0000 0000 00EE 0058
        DECLE   $0004,  $0057,  $0004,  $0057   ; 56FE   0004 0057 0004 0057
        DECLE   $0004                           ; 5702   0004

        RLC     R3,     2                       ; 5703   0057
        PSHR    R5                              ; 5704   0275
        DECR    R0                              ; 5705   0010
        BNEQ    L_5761                          ; 5706   020C 0059

        SLL     R1,     2                       ; 5708   004D
        SLL     R1,     2                       ; 5709   004D
        ADDI    #$0335, R1                      ; 570A   02F9 0335
        MVI@    R1,     R0                      ; 570C   0288
        ANDI    #$0008, R0                      ; 570D   03B8 0008
        BNEQ    L_57C9                          ; 570F   020C 00B8

        ADDI    #$0002, R1                      ; 5711   02F9 0002
        MVI@    R1,     R0                      ; 5713   0288
        SWAP    R0,     1                       ; 5714   0040
        ANDI    #$00FF, R0                      ; 5715   03B8 00FF
        MVII    #$02E0, R2                      ; 5717   02BA 02E0
        MVII    #$001C, R3                      ; 5719   02BB 001C
        MVII    #$0033, R4                      ; 571B   02BC 0033
        MVII    #$015E, R5                      ; 571D   02BD 015E
L_571F:
        CMPR    R3,     R0                      ; 571F   0158
        BLT     L_5761                          ; 5720   0205 003F

        CMPR    R4,     R0                      ; 5722   0160
        BLE     L_5731                          ; 5723   0206 000C

        INCR    R5                              ; 5725   000D
        ADDI    #$0004, R2                      ; 5726   02FA 0004
        ADDI    #$0020, R3                      ; 5728   02FB 0020
        ADDI    #$0020, R4                      ; 572A   02FC 0020
        CMPI    #$02EC, R2                      ; 572C   037A 02EC
        BLE     L_571F                          ; 572E   0226 0010
        PULR    R7                              ; 5730   02B7

L_5731:
        MVI@    R5,     R0                      ; 5731   02A8
        PSHR    R0                              ; 5732   0270
        MVI@    R2,     R3                      ; 5733   0293
        PSHR    R1                              ; 5734   0271
        MOVR    R2,     R1                      ; 5735   0091

        JSR     R5,     L_5654                  ; 5736   0004 0154 0254

        PULR    R1                              ; 5739   02B1
        SUBI    #$0002, R1                      ; 573A   0339 0002
        MVI@    R1,     R0                      ; 573C   0288
        XORI    #$0008, R0                      ; 573D   03F8 0008
        MVO@    R0,     R1                      ; 573F   0248
        ADDI    #$000F, R1                      ; 5740   02F9 000F
        PULR    R0                              ; 5742   02B0
        MVO@    R0,     R1                      ; 5743   0248
        SUBI    #$0006, R1                      ; 5744   0339 0006
        SLR     R3,     2                       ; 5746   0067
        SLR     R3,     1                       ; 5747   0063
        SUBI    #$0021, R3                      ; 5748   033B 0021
        MOVR    R3,     R0                      ; 574A   0098

        JSR     R5,     L_578D                  ; 574B   0004 0154 038D

        SUBI    #$0005, R1                      ; 574E   0339 0005

        JSR     R5,     .EXEC.766               ; 5750   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5753   0004 0114 02CF

        MVI@    R1,     R0                      ; 5756   0288
        SDBD                                    ; 5757   0001
        XORI    #$1800, R0                      ; 5758   03F8 0000 0018
        MVO@    R0,     R1                      ; 575B   0248
        ADDI    #$0004, R1                      ; 575C   02F9 0004
        MVII    #$00FB, R0                      ; 575E   02B8 00FB
        MVO@    R0,     R1                      ; 5760   0248
L_5761:
        PULR    R7                              ; 5761   02B7

        DECLE   $0000,  $0000,  $0072,  $0057   ; 5762   0000 0000 0072 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5766   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 576A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 576E   0000 0000 0000 0000
        DECLE   $00A4,  $0057,  $008C,  $0057   ; 5772   00A4 0057 008C 0057
        DECLE   $0010,  $0000,  $0006,  $0039   ; 5776   0010 0000 0006 0039
        DECLE   $0058,  $0039,  $0158,  $0239   ; 577A   0058 0039 0158 0239
        DECLE   $0058,  $00A4,  $0057,  $008C   ; 577E   0058 00A4 0057 008C
        DECLE   $0057,  $000A,  $0010,  $0006   ; 5782   0057 000A 0010 0006
        DECLE   $0039,  $0058,  $0039,  $0158   ; 5786   0039 0058 0039 0158
        DECLE   $0239                           ; 578A   0239

        SLLC    R0,     1                       ; 578B   0058
        MOVR    R5,     R7                      ; 578C   00AF

L_578D:
        ANDI    #$001F, R0                      ; 578D   03B8 001F
        PSHR    R2                              ; 578F   0272
        SDBD                                    ; 5790   0001
        MVII    #$5772, R2                      ; 5791   02BA 0072 0057
        CMPI    #$0010, R0                      ; 5794   0378 0010
        BLT     L_579E                          ; 5796   0205 0006

        SDBD                                    ; 5798   0001
        MVII    #$577F, R2                      ; 5799   02BA 007F 0057
        SUBI    #$0010, R0                      ; 579C   0338 0010
L_579E:
        MVO@    R2,     R1                      ; 579E   024A
        ADDI    #$0004, R1                      ; 579F   02F9 0004
        MVO@    R0,     R1                      ; 57A1   0248
        PULR    R2                              ; 57A2   02B2
        MOVR    R5,     R7                      ; 57A3   00AF

        PSHR    R5                              ; 57A4   0275
        CMPI    #$0003, R0                      ; 57A5   0378 0003
        BLT     L_57C8                          ; 57A7   0205 001F
        INCR    R7                              ; 57A9   000F

L_57AA:
        PSHR    R5                              ; 57AA   0275
L_57AB:
        MVI     G_02F0, R0                      ; 57AB   0280 02F0
        SDBD                                    ; 57AD   0001
        CMPI    #$5520, R0                      ; 57AE   0378 0020 0055
        BNEQ    L_57C8                          ; 57B1   020C 0015

        MVI@    R1,     R0                      ; 57B3   0288
        SDBD                                    ; 57B4   0001
        ANDI    #$E7F7, R0                      ; 57B5   03B8 00F7 00E7
        MVO@    R0,     R1                      ; 57B8   0248
        ADDI    #$0004, R1                      ; 57B9   02F9 0004
        CLRR    R0                              ; 57BB   01C0
        MVO@    R0,     R1                      ; 57BC   0248
        DECR    R1                              ; 57BD   0011
        MVO@    R0,     R1                      ; 57BE   0248
        DECR    R1                              ; 57BF   0011
        MVO@    R0,     R1                      ; 57C0   0248
        SUBI    #$000A, R1                      ; 57C1   0339 000A
        MVII    #$0008, R0                      ; 57C3   02B8 0008
        COMR    R0                              ; 57C5   0018
        AND@    R1,     R0                      ; 57C6   0388
        MVO@    R0,     R1                      ; 57C7   0248
L_57C8:
        PULR    R7                              ; 57C8   02B7

L_57C9:
        ADDI    #$0008, R1                      ; 57C9   02F9 0008
        MVI@    R1,     R0                      ; 57CB   0288
        ANDI    #$0008, R0                      ; 57CC   03B8 0008
        BNEQ    L_57E2                          ; 57CE   020C 0012

        MVI@    R1,     R0                      ; 57D0   0288
        XORI    #$0008, R0                      ; 57D1   03F8 0008
        MVO@    R0,     R1                      ; 57D3   0248

        JSR     R5,     .EXEC.766               ; 57D4   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 57D7   0004 0114 02D5

        ADDI    #$0004, R1                      ; 57DA   02F9 0004
        MVII    #$009C, R0                      ; 57DC   02B8 009C
        MVO@    R0,     R1                      ; 57DE   0248

        JSR     R5,     L_58E2                  ; 57DF   0004 0158 00E2

L_57E2:
        PULR    R7                              ; 57E2   02B7

L_57E3:
        PSHR    R5                              ; 57E3   0275
L_57E4:
        MVII    #$0003, R0                      ; 57E4   02B8 0003
        MVO     R0,     G_0323                  ; 57E6   0240 0323
        MVI     G_0165, R0                      ; 57E8   0280 0165

        JSR     R5,     X_RAND2                 ; 57EA   0004 0114 029E

        MOVR    R0,     R2                      ; 57ED   0082
        MVO     R0,     G_015D                  ; 57EE   0240 015D
        SDBD                                    ; 57F0   0001
        ADDI    #$5920, R2                      ; 57F1   02FA 0020 0059
        MVI@    R2,     R0                      ; 57F4   0290
        MVII    #$032E, R1                      ; 57F5   02B9 032E

        JSR     R5,     L_578D                  ; 57F7   0004 0154 038D

        MVI@    R2,     R0                      ; 57FA   0290
        SLR     R0,     2                       ; 57FB   0064
        SLR     R0,     2                       ; 57FC   0064
        SLR     R0,     1                       ; 57FD   0060
        MVII    #$031E, R1                      ; 57FE   02B9 031E

        JSR     R5,     L_578D                  ; 5800   0004 0154 038D

        MVII    #$003C, R0                      ; 5803   02B8 003C

        JSR     R5,     X_RAND2                 ; 5805   0004 0114 029E

        ADDI    #$000A, R0                      ; 5808   02F8 000A
        MOVR    R0,     R1                      ; 580A   0081
        MVII    #$0008, R2                      ; 580B   02BA 0008
        MVII    #$0001, R0                      ; 580D   02B8 0001

        JSR     R5,     X_RAND1                 ; 580F   0004 0114 027D

        TSTR    R0                              ; 5812   0080
        BEQ     L_581A                          ; 5813   0204 0005

        NEGR    R1                              ; 5815   0021
        ANDI    #$00FF, R1                      ; 5816   03B9 00FF
        MVII    #$0090, R2                      ; 5818   02BA 0090
L_581A:
        SWAP    R1,     1                       ; 581A   0041
        SWAP    R2,     1                       ; 581B   0042
        SDBD                                    ; 581C   0001
        MVII    #$1880, R0                      ; 581D   02B8 0080 0018
        MVO     R0,     G_031D                  ; 5820   0240 031D
        MVO     R0,     G_032D                  ; 5822   0240 032D
        SDBD                                    ; 5824   0001
        MVII    #$0880, R0                      ; 5825   02B8 0080 0008
        MVO     R0,     G_0325                  ; 5828   0240 0325
        MVII    #$0028, R0                      ; 582A   02B8 0028

        JSR     R5,     X_RAND2                 ; 582C   0004 0114 029E

        ADDI    #$0010, R0                      ; 582F   02F8 0010
        SWAP    R0,     1                       ; 5831   0040
        MVO     R0,     G_0320                  ; 5832   0240 0320
        MVO     R2,     G_031F                  ; 5834   0242 031F
        MVO     R1,     G_0321                  ; 5836   0241 0321
        PULR    R7                              ; 5838   02B7

        PSHR    R5                              ; 5839   0275
        MVI     G_0323, R5                      ; 583A   0285 0323
        TSTR    R5                              ; 583C   00AD
        BNEQ    L_58C8                          ; 583D   020C 0089

        CMPI    #$0003, R0                      ; 583F   0378 0003
        BLT     L_58C8                          ; 5841   0205 0085

        CMPI    #$0003, R3                      ; 5843   037B 0003
        BGE     L_58C8                          ; 5845   020D 0081

        ADDI    #$0007, R1                      ; 5847   02F9 0007
        MVI@    R1,     R2                      ; 5849   028A
        TSTR    R2                              ; 584A   0092
        BMI     L_58C8                          ; 584B   020B 007B

        MOVR    R2,     R0                      ; 584D   0090
        COMR    R0                              ; 584E   0018
        MVO@    R0,     R1                      ; 584F   0248
        MVI     G_015D, R3                      ; 5850   0283 015D
        SDBD                                    ; 5852   0001
        ADDI    #$5955, R3                      ; 5853   02FB 0055 0059
        MVI@    R3,     R0                      ; 5856   0298

        JSR     R5,     L_591C                  ; 5857   0004 0158 011C

        SLL     R0,     1                       ; 585A   0048
L_585B:
        DECR    R2                              ; 585B   0012
        BMI     L_5861                          ; 585C   020B 0003

        SLL     R0,     1                       ; 585E   0048
        B       L_585B                          ; 585F   0220 0005

L_5861:
        TSTR    R0                              ; 5861   0080
        BPL     L_58B3                          ; 5862   0203 004F

        SUBI    #$000F, R1                      ; 5864   0339 000F
        MVI@    R1,     R0                      ; 5866   0288
        ANDI    #$0007, R0                      ; 5867   03B8 0007
        SDBD                                    ; 5869   0001
        XORI    #$1080, R0                      ; 586A   03F8 0080 0010
        MVO     R0,     G_031D                  ; 586D   0240 031D
        MVO     R0,     G_0325                  ; 586F   0240 0325
        MVO     R0,     G_032D                  ; 5871   0240 032D
        ADDI    #$0009, R1                      ; 5873   02F9 0009
        MVI@    R1,     R0                      ; 5875   0288
        MVO     R0,     G_0326                  ; 5876   0240 0326
        ADDI    #$0004, R1                      ; 5878   02F9 0004
        MVI@    R1,     R0                      ; 587A   0288
        MVO     R0,     G_032A                  ; 587B   0240 032A
        SUBI    #$0005, R1                      ; 587D   0339 0005
        PSHR    R1                              ; 587F   0271
        MVII    #$0163, R2                      ; 5880   02BA 0163
        CMPI    #$033D, R1                      ; 5882   0379 033D
        BEQ     L_5887                          ; 5884   0204 0001

        INCR    R2                              ; 5886   000A
L_5887:
        MVI@    R2,     R0                      ; 5887   0290
        INCR    R0                              ; 5888   0008
        MVO@    R0,     R2                      ; 5889   0250

        JSR     R5,     L_5688                  ; 588A   0004 0154 0288

        PULR    R1                              ; 588D   02B1

        JSR     R5,     L_57AA                  ; 588E   0004 0154 03AA

        CLRR    R0                              ; 5891   01C0
        MVO     R0,     G_0321                  ; 5892   0240 0321
        MVII    #$0006, R0                      ; 5894   02B8 0006
        MVO     R0,     G_0162                  ; 5896   0240 0162
        MVII    #$004C, R0                      ; 5898   02B8 004C
        SWAP    R0,     1                       ; 589A   0040
        MVO     R0,     G_031F                  ; 589B   0240 031F
        MVII    #$0018, R0                      ; 589D   02B8 0018
        SWAP    R0,     1                       ; 589F   0040
        MVO     R0,     G_0320                  ; 58A0   0240 0320

        JSR     R5,     L_5EFC                  ; 58A2   0004 015C 02FC

        MVII    #$0001, R0                      ; 58A5   02B8 0001

        JSR     R5,     .EXEC.41C               ; 58A7   0004 0114 001C
        JSR     R5,     .EXEC.A61               ; 58AA   0004 0118 0261

        COMR    R6                              ; 58AD   001E
        MVII    #$009C, R0                      ; 58AE   02B8 009C
        MVO     R0,     G_0321                  ; 58B0   0240 0321
        PULR    R7                              ; 58B2   02B7

L_58B3:
        JSR     R5,     L_58C9                  ; 58B3   0004 0158 00C9

        MVII    #$0007, R0                      ; 58B6   02B8 0007

        JSR     R5,     X_RAND2                 ; 58B8   0004 0114 029E

        ADDI    #$0009, R0                      ; 58BB   02F8 0009
        PSHR    R1                              ; 58BD   0271
        MOVR    R0,     R1                      ; 58BE   0081
        MVII    #$0032, R0                      ; 58BF   02B8 0032

        JSR     R5,     .EXEC.629               ; 58C1   0004 0114 0229

        PULR    R2                              ; 58C4   02B2
        SUBI    #$0003, R2                      ; 58C5   033A 0003
        MVO@    R0,     R2                      ; 58C7   0250
L_58C8:
        PULR    R7                              ; 58C8   02B7

L_58C9:
        PSHR    R5                              ; 58C9   0275

        JSR     R5,     X_PLAY_SFX1             ; 58CA   0004 0118 03BB
        DECLE   $0389                           ; 58CD  SFX data
        DECLE   $006C,  $0000                   ; 58CE  SFX data
        DECLE   $0050,  $0100                   ; 58D0  SFX data
        DECLE   $0058,  $010C                   ; 58D2  SFX data
        DECLE   $005B                           ; 58D4  SFX data
        DECLE   $0044,  $0100                   ; 58D5  SFX data
        DECLE   $0001,  $03A0                   ; 58D7  SFX data
        DECLE   $0001,  $03B2                   ; 58D9  SFX data
        DECLE   $0001,  $03F1                   ; 58DB  SFX data
        DECLE   $000B                           ; 58DD  SFX data
        DECLE   $02EB                           ; 58DE  SFX data
        DECLE   $0001,  $0003                   ; 58DF  SFX data
        DECLE   $03CF                           ; 58E1  SFX end

L_58E2:
        PSHR    R5                              ; 58E2   0275

        JSR     R5,     X_PLAY_SFX1             ; 58E3   0004 0118 03BB
        DECLE   $0079                           ; 58E6  SFX data
        DECLE   $00CC,  $0000                   ; 58E7  SFX data
        DECLE   $008D                           ; 58E9  SFX data
        DECLE   $0387                           ; 58EA  SFX data
        DECLE   $03B7                           ; 58EB  SFX data
        DECLE   $000B                           ; 58EC  SFX data
        DECLE   $03CF                           ; 58ED  SFX end


        MVII    #$0005, R2                      ; 58EE   02BA 0005
        SDBD                                    ; 58F0   0001
        MVII    #$0033, R3                      ; 58F1   02BB 0033 0000
        CMPI    #$0008, R0                      ; 58F4   0378 0008
        BGE     L_5911                          ; 58F6   020D 0019

        MVII    #$0167, R4                      ; 58F8   02BC 0167
        SDBD                                    ; 58FA   0001
        MVI@    R4,     R1                      ; 58FB   02A1
        SLL     R1,     2                       ; 58FC   004D
        SLL     R1,     2                       ; 58FD   004D
        SLR     R1,     1                       ; 58FE   0061
        XORR    R1,     R0                      ; 58FF   01C8
        SDBD                                    ; 5900   0001
        CMPI    #$4688, R0                      ; 5901   0378 0088 0046
        BNEQ    L_590C                          ; 5904   020C 0006

        MVII    #$0006, R2                      ; 5906   02BA 0006
        SDBD                                    ; 5908   0001
        MVII    #$0035, R3                      ; 5909   02BB 0035 0000
L_590C:
        MVO     R0,     G_0167                  ; 590C   0240 0167
        SWAP    R0,     1                       ; 590E   0040
        MVO     R0,     G_0168                  ; 590F   0240 0168
L_5911:
        MVO     R2,     G_0166                  ; 5911   0242 0166
        MVO     R3,     G_0165                  ; 5913   0243 0165
        MOVR    R5,     R7                      ; 5915   00AF

        DECLE   $0000                           ; 5916   0000

        TSTR    R0                              ; 5917   0080
        SUBR    R0,     R0                      ; 5918   0100
        CLRR    R0                              ; 5919   01C0
        MVI     G_0120, R0                      ; 591A   0280 0120
L_591C:
        SLL     R0,     2                       ; 591C   004C
        SLL     R0,     2                       ; 591D   004C
        SLL     R0,     1                       ; 591E   0048
        MOVR    R5,     R7                      ; 591F   00AF

        DECLE   $0023,  $0026,  $002D,  $0033   ; 5920   0023 0026 002D 0033
        DECLE   $0041,  $004F,  $0053,  $0063   ; 5924   0041 004F 0053 0063
        DECLE   $006C,  $00AD,  $00B3,  $00E6   ; 5928   006C 00AD 00B3 00E6
        DECLE   $00EC,  $00F2,  $00F3,  $0163   ; 592C   00EC 00F2 00F3 0163
        DECLE   $0166,  $0183,  $018D,  $018F   ; 5930   0166 0183 018D 018F
        DECLE   $0193,  $01AF,  $01ED,  $01EF   ; 5934   0193 01AF 01ED 01EF
        DECLE   $01F3,  $006D,  $0133,  $0173   ; 5938   01F3 006D 0133 0173
        DECLE   $01B3,  $01E6,  $0223,  $02D3   ; 593C   01B3 01E6 0223 02D3
        DECLE   $0226,  $022C,  $022D,  $0233   ; 5940   0226 022C 022D 0233
        DECLE   $024F,  $0253,  $0261,  $0266   ; 5944   024F 0253 0261 0266
        DECLE   $026D,  $026F,  $02B3,  $02C6   ; 5948   026D 026F 02B3 02C6
        DECLE   $0021,  $0066,  $00B7           ; 594C   0021 0066 00B7

        ADDR    R1,     R5                      ; 594F   00CD
        ADDR    R5,     R7                      ; 5950   00EF

        DECLE   $0221,  $0032,  $0068,  $014C   ; 5951   0221 0032 0068 014C
        DECLE   $03A4,  $03E5,  $02A3,  $03A4   ; 5955   03A4 03E5 02A3 03A4
        DECLE   $0263,  $0263,  $0263,  $02A3   ; 5959   0263 0263 0263 02A3
        DECLE   $0282,  $03A4,  $0282,  $0263   ; 595D   0282 03A4 0282 0263
        DECLE   $03A4,  $0282,  $02E4,  $0383   ; 5961   03A4 0282 02E4 0383
        DECLE   $0364,  $02E4,  $0302,  $0242   ; 5965   0364 02E4 0302 0242
        DECLE   $0302,  $0282,  $03A4,  $03E5   ; 5969   0302 0282 03A4 03E5
        DECLE   $03E5,  $01E4,  $0163,  $01C3   ; 596D   03E5 01E4 0163 01C3
        DECLE   $01E4,  $01A3,  $01C3,  $0182   ; 5971   01E4 01A3 01C3 0182
        DECLE   $02A3,  $02A3,  $0222,  $0263   ; 5975   02A3 02A3 0222 0263
        DECLE   $02E4,  $03C4,  $0222,  $0263   ; 5979   02E4 03C4 0222 0263
        DECLE   $03E5,  $02C3,  $0302,  $0282   ; 597D   03E5 02C3 0302 0282
        DECLE   $00C2,  $00E3,  $00C2,  $00A2   ; 5981   00C2 00E3 00C2 00A2
        DECLE   $00C2,  $00E3,  $0021,  $0101   ; 5985   00C2 00E3 0021 0101
        DECLE   $0011,  $0008,  $0031,  $00A6   ; 5989   0011 0008 0031 00A6
        DECLE   $0059,  $00CC,  $0059,  $00C6   ; 598D   0059 00CC 0059 00C6
        DECLE   $005A,  $00C0,  $0059,  $003B   ; 5991   005A 00C0 0059 003B
        DECLE   $0050,  $0080,  $0000,  $0000   ; 5995   0050 0080 0000 0000
        DECLE   $0008,  $0003,  $0001,  $0001   ; 5999   0008 0003 0001 0001
        DECLE   $0004,  $01F0,  $01E0,  $01D0   ; 599D   0004 01F0 01E0 01D0
        DECLE   $01C0,  $01B0,  $01A0,  $0190   ; 59A1   01C0 01B0 01A0 0190
        DECLE   $0180,  $0071,  $001A,  $0001   ; 59A5   0180 0071 001A 0001
        DECLE   $0080,  $004E,  $005B,  $0001   ; 59A9   0080 004E 005B 0001
        DECLE   $0000,  $00E4,  $005B,  $0001   ; 59AD   0000 00E4 005B 0001
        DECLE   $0000,  $00F1,  $0014,  $0001   ; 59B1   0000 00F1 0014 0001
        DECLE   $0000,  $0012,  $005F,  $0040   ; 59B5   0000 0012 005F 0040
        DECLE   $0000,  $00BD,  $005D,  $0014   ; 59B9   0000 00BD 005D 0014
        DECLE   $0000,  $0000,  $0000,  $001C   ; 59BD   0000 0000 0000 001C
        DECLE   $0001,  $0380,  $0201,  $0380   ; 59C1   0001 0380 0201 0380
        DECLE   $0011,  $0380,  $0020,  $027F   ; 59C5   0011 0380 0020 027F

        DECR    R0                              ; 59C9   0010
        COMR    R5                              ; 59CA   001D
        ADDR    R2,     R0                      ; 59CB   00D0
L_59CC:
        PSHR    R5                              ; 59CC   0275
        MVII    #$00F0, R0                      ; 59CD   02B8 00F0
        MVII    #$0200, R4                      ; 59CF   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 59D1   0004 0114 0338
        JSR     R5,     L_5105                  ; 59D4   0004 0150 0105
        DECLE   $0008,  $015D,  $000F,  $00B5   ; 59D7   0008 015D 000F 00B5
        DECLE   $00BF,  $0000,  $0000,  $0000   ; 59DB   00BF 0000 0000 0000
        DECLE   $0003,  $0001                   ; 59DF   0003 0001

        SDBD                                    ; 59E1   0001
        MVII    #$5A9A, R1                      ; 59E2   02B9 009A 005A

        JSR     R5,     L_5A78                  ; 59E5   0004 0158 0278
        DECLE   $031D,  $0001,  $0000,  $0325   ; 59E8   031D 0001 0000 0325
        DECLE   $0001,  $0000,  $033D,  $0007   ; 59EC   0001 0000 033D 0007
        DECLE   $0000,  $0345,  $0007,  $0000   ; 59F0   0000 0345 0007 0000

        MVII    #$0001, R0                      ; 59F4   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 59F6   0004 0114 02CF

        MVII    #$0005, R0                      ; 59F9   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 59FB   0004 0114 02CF

        MVII    #$0008, R0                      ; 59FE   02B8 0008
        SWAP    R0,     1                       ; 5A00   0040
        MVO     R0,     G_0329                  ; 5A01   0240 0329
        MVO     R0,     G_0349                  ; 5A03   0240 0349
        MVII    #$0090, R0                      ; 5A05   02B8 0090
        SWAP    R0,     1                       ; 5A07   0040
        MVO     R0,     G_033F                  ; 5A08   0240 033F
        MVII    #$0205, R1                      ; 5A0A   02B9 0205

        JSR     R5,     L_5BB1                  ; 5A0C   0004 0158 03B1

        MVII    #$020E, R1                      ; 5A0F   02B9 020E

        JSR     R5,     L_5BB1                  ; 5A11   0004 0158 03B1

        MVII    #$023E, R1                      ; 5A14   02B9 023E

        JSR     R5,     L_5BB1                  ; 5A16   0004 0158 03B1

        MVII    #$0247, R1                      ; 5A19   02B9 0247

        JSR     R5,     L_5BB1                  ; 5A1B   0004 0158 03B1

        SDBD                                    ; 5A1E   0001
        MVII    #$5AAA, R0                      ; 5A1F   02B8 00AA 005A
        MVO     R0,     G_031E                  ; 5A22   0240 031E
        MVO     R0,     G_033E                  ; 5A24   0240 033E
        SDBD                                    ; 5A26   0001
        ADDI    #$0007, R0                      ; 5A27   02F8 0007 0000
        MVO     R0,     G_0326                  ; 5A2A   0240 0326
        MVO     R0,     G_0346                  ; 5A2C   0240 0346
        SDBD                                    ; 5A2E   0001
        MVII    #$5C37, R0                      ; 5A2F   02B8 0037 005C
        MVO     R0,     G_035D                  ; 5A32   0240 035D
        MVII    #$015E, R2                      ; 5A34   02BA 015E
        MVII    #$0160, R3                      ; 5A36   02BB 0160

        JSR     R5,     L_5D14                  ; 5A38   0004 015C 0114

        INCR    R2                              ; 5A3B   000A
        INCR    R3                              ; 5A3C   000B

        JSR     R5,     L_5D14                  ; 5A3D   0004 015C 0114
        JSR     R5,     L_5C21                  ; 5A40   0004 015C 0021
        JSR     R5,     L_5DBD                  ; 5A43   0004 015C 01BD

        MVII    #$0281, R4                      ; 5A46   02BC 0281
        SDBD                                    ; 5A48   0001
        MVII    #$18D3, R0                      ; 5A49   02B8 00D3 0018
        MVO@    R0,     R4                      ; 5A4C   0260
        ADDI    #$0008, R0                      ; 5A4D   02F8 0008
        MVO@    R0,     R4                      ; 5A4F   0260
        MVI     G_0166, R0                      ; 5A50   0280 0166
        INCR    R0                              ; 5A52   0008
        MVO     R0,     G_0166                  ; 5A53   0240 0166
        MVII    #$0002, R1                      ; 5A55   02B9 0002
        CLRR    R3                              ; 5A57   01DB
        MVII    #$02AC, R4                      ; 5A58   02BC 02AC

        JSR     R5,     X_PRNUM_LFT             ; 5A5A   0004 0118 009E

        MVII    #$02A7, R4                      ; 5A5D   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; 5A5F   0004 0118 007B
        STRING  "TURN:"                         ; 5A62  
        DECLE   $0000                           ; 5A67   0000

        SDBD                                    ; 5A68   0001
        MVII    #$2000, R0                      ; 5A69   02B8 0000 0020
        MVO     R0,     .BTAB.A0                ; 5A6C   0240 02A0
        SDBD                                    ; 5A6E   0001
        MVII    #$5A87, R1                      ; 5A6F   02B9 0087 005A
        MVII    #$0355, R2                      ; 5A72   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 5A74   0004 0114 02B2

        PULR    R7                              ; 5A77   02B7

L_5A78:
        MVII    #$0004, R3                      ; 5A78   02BB 0004
        MOVR    R5,     R4                      ; 5A7A   00AC
L_5A7B:
        MVI@    R4,     R2                      ; 5A7B   02A2

        JSR     R5,     X_INIT_MOB              ; 5A7C   0004 0114 02B2

        MVI@    R2,     R0                      ; 5A7F   0290
        SDBD                                    ; 5A80   0001
        XOR@    R4,     R0                      ; 5A81   03E0
        MVO@    R0,     R2                      ; 5A82   0250
        DECR    R3                              ; 5A83   0013
        BNEQ    L_5A7B                          ; 5A84   022C 000A
        MOVR    R4,     R7                      ; 5A86   00A7

        DECLE   $00A0,  $0011,  $0093,  $005A   ; 5A87   00A0 0011 0093 005A
        DECLE   $0000,  $0058,  $0000,  $0050   ; 5A8B   0000 0058 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A93   0000 0000 0000 0000
        DECLE   $0001,  $009F,  $0000,  $0060   ; 5A97   0001 009F 0000 0060
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5A9B   0010 0000 0000 0000
        DECLE   $0010,  $0000,  $0038,  $0000   ; 5A9F   0010 0000 0038 0000
        DECLE   $0000,  $00F0,  $0003,  $0000   ; 5AA3   0000 00F0 0003 0000
        DECLE   $0000,  $0000,  $0000,  $03DC   ; 5AA7   0000 0000 0000 03DC
        DECLE   $0013,  $0000,  $0000           ; 5AAB   0013 0000 0000

        EIS                                     ; 5AAE   0002
        ADDR    R3,     R7                      ; 5AAF   00DF

        DECLE   $0000,  $03DC,  $0013,  $0000   ; 5AB0   0000 03DC 0013 0000
        DECLE   $0000,  $0002,  $00E3,  $0000   ; 5AB4   0000 0002 00E3 0000
        DECLE   $03DC,  $0013,  $0000,  $0000   ; 5AB8   03DC 0013 0000 0000

        EIS                                     ; 5ABC   0002
        ADDR    R4,     R7                      ; 5ABD   00E7

        DECLE   $0000,  $03DC,  $0013,  $0000   ; 5ABE   0000 03DC 0013 0000
        DECLE   $0000,  $0002,  $00EB,  $0000   ; 5AC2   0000 0002 00EB 0000
        DECLE   $001C,  $001C,  $0034,  $0022   ; 5AC6   001C 001C 0034 0022
        DECLE   $0036,  $001F                   ; 5ACA   0036 001F

        SETC                                    ; 5ACC   0007
        SETC                                    ; 5ACD   0007
        INCR    R7                              ; 5ACE   000F
        INCR    R7                              ; 5ACF   000F

L_5AD0:
        INCR    R4                              ; 5AD0   000C
L_5AD1:
        CLRC                                    ; 5AD1   0006
        DECLE   $0006,  $0002,  $0007,  $0005   ; 5AD2   0006 0002 0007 0005
        DECLE   $001C,  $001C,  $0034,  $0022   ; 5AD6   001C 001C 0034 0022
        DECLE   $0036,  $001F                   ; 5ADA   0036 001F

        SETC                                    ; 5ADC   0007
        SETC                                    ; 5ADD   0007
        INCR    R7                              ; 5ADE   000F
        INCR    R7                              ; 5ADF   000F

L_5AE0:
        COMR    R4                              ; 5AE0   001C
L_5AE1:
        COMR    R4                              ; 5AE1   001C
        DECLE   $0030,  $0020,  $0070,  $0050   ; 5AE2   0030 0020 0070 0050
        DECLE   $0006,  $0009,  $0009,  $0009   ; 5AE6   0006 0009 0009 0009
        DECLE   $000A,  $0008,  $00C8,  $00FC   ; 5AEA   000A 0008 00C8 00FC
        DECLE   $00FE,  $00FE,  $00FE,  $00FC   ; 5AEE   00FE 00FE 00FE 00FC
        DECLE   $0078,  $0018,  $0038,  $0078   ; 5AF2   0078 0018 0038 0078
        DECLE   $0006,  $0009,  $0009,  $0009   ; 5AF6   0006 0009 0009 0009
        DECLE   $000A,  $0008,  $00C8,  $00FC   ; 5AFA   000A 0008 00C8 00FC
        DECLE   $00FE,  $00FE,  $00FE,  $003C   ; 5AFE   00FE 00FE 00FE 003C
        DECLE   $000E,  $0006,  $0002,  $0002   ; 5B02   000E 0006 0002 0002
        DECLE   $0000,  $0000,  $0000           ; 5B06   0000 0000 0000

        DIS                                     ; 5B09   0003
        SETC                                    ; 5B0A   0007
        INCR    R7                              ; 5B0B   000F
L_5B0C:
        DECR    R7                              ; 5B0C   0017

L_5B0D:
        DIS                                     ; 5B0D   0003
        DECLE   $0000                           ; 5B0E   0000

        RSWD    R0                              ; 5B0F   0038
        COMR    R6                              ; 5B10   001E
        ADDR    R1,     R7                      ; 5B11   00CF
        ADDR    R5,     R7                      ; 5B12   00EF
        ADDR    R5,     R7                      ; 5B13   00EF
        ADDR    R5,     R7                      ; 5B14   00EF

        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5B15   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $0060   ; 5B19   0000 0000 0038 0060
        DECLE   $00E0,  $000F,  $007F,  $00FF   ; 5B1D   00E0 000F 007F 00FF
        DECLE   $00F7,  $008F,  $001F,  $003F   ; 5B21   00F7 008F 001F 003F
        DECLE   $003B,  $00C0,  $00E0,  $00F8   ; 5B25   003B 00C0 00E0 00F8
        DECLE   $00FE,  $00D8,  $0000,  $00E0   ; 5B29   00FE 00D8 0000 00E0
        DECLE   $00F0,  $0070,  $0060,  $0040   ; 5B2D   00F0 0070 0060 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B31   0000 0000 0000 0000
        DECLE   $0000,  $00FC,  $0078,  $0078   ; 5B35   0000 00FC 0078 0078
        DECLE   $0078,  $0030,  $0030,  $0030   ; 5B39   0078 0030 0030 0030
        DECLE   $0030,  $00F0,  $0010,  $0008   ; 5B3D   0030 00F0 0010 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B41   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $0038,  $0038   ; 5B45   0000 0038 0038 0038
        DECLE   $0078,  $0000,  $0000,  $0000   ; 5B49   0078 0000 0000 0000
        DECLE   $0000                           ; 5B4D   0000

        PSHR    R5                              ; 5B4E   0275
        MVI     G_0162, R0                      ; 5B4F   0280 0162
        TSTR    R0                              ; 5B51   0080
        BNEQ    L_5B6B                          ; 5B52   020C 0017

        MVII    #$011F, R2                      ; 5B54   02BA 011F
        MVII    #$031E, R3                      ; 5B56   02BB 031E

        JSR     R5,     L_5B6C                  ; 5B58   0004 0158 036C

        INCR    R2                              ; 5B5B   000A
        MVII    #$033E, R3                      ; 5B5C   02BB 033E

        JSR     R5,     L_5B6C                  ; 5B5E   0004 0158 036C

        MVII    #$032E, R1                      ; 5B61   02B9 032E

        JSR     R5,     L_5CFA                  ; 5B63   0004 015C 00FA

        MVII    #$034E, R1                      ; 5B66   02B9 034E

        JSR     R5,     L_5CFA                  ; 5B68   0004 015C 00FA

L_5B6B:
        PULR    R7                              ; 5B6B   02B7

L_5B6C:
        PSHR    R5                              ; 5B6C   0275
        SDBD                                    ; 5B6D   0001
        MVII    #$5AAA, R4                      ; 5B6E   02BC 00AA 005A
        MOVR    R4,     R5                      ; 5B71   00A5
        ADDI    #$0007, R5                      ; 5B72   02FD 0007
        MVI     G_0162, R0                      ; 5B74   0280 0162
        TSTR    R0                              ; 5B76   0080
        BNEQ    L_5B9D                          ; 5B77   020C 0024

        MVI@    R2,     R0                      ; 5B79   0290
        ANDI    #$00C0, R0                      ; 5B7A   03B8 00C0
        BNEQ    L_5B9D                          ; 5B7C   020C 001F

        MVI@    R2,     R1                      ; 5B7E   0291
        CMPI    #$0004, R1                      ; 5B7F   0379 0004
        BLE     L_5B87                          ; 5B81   0206 0004

        CMPI    #$000C, R1                      ; 5B83   0379 000C
        BLE     L_5B8B                          ; 5B85   0206 0004

L_5B87:
        ADDI    #$0015, R4                      ; 5B87   02FC 0015
        ADDI    #$0007, R5                      ; 5B89   02FD 0007
L_5B8B:
        PSHR    R3                              ; 5B8B   0273
        MVII    #$0019, R0                      ; 5B8C   02B8 0019
        PSHR    R5                              ; 5B8E   0275

        JSR     R5,     .EXEC.629               ; 5B8F   0004 0114 0229

        PULR    R5                              ; 5B92   02B5
        ADDI    #$0004, R3                      ; 5B93   02FB 0004
        MVI@    R3,     R1                      ; 5B95   0299
        ANDI    #$000F, R1                      ; 5B96   03B9 000F
        XORI    #$03F0, R1                      ; 5B98   03F9 03F0
        PULR    R3                              ; 5B9A   02B3
        B       L_5BA3                          ; 5B9B   0200 0006

L_5B9D:
        CLRR    R0                              ; 5B9D   01C0
        CLRR    R1                              ; 5B9E   01C9
        ADDI    #$0008, R3                      ; 5B9F   02FB 0008
        B       L_5BA7                          ; 5BA1   0200 0004

L_5BA3:
        MVO@    R4,     R3                      ; 5BA3   025C
        ADDI    #$0008, R3                      ; 5BA4   02FB 0008
        MVO@    R5,     R3                      ; 5BA6   025D
L_5BA7:
        ADDI    #$0004, R3                      ; 5BA7   02FB 0004
        MVO@    R1,     R3                      ; 5BA9   0259
        SUBI    #$0008, R3                      ; 5BAA   033B 0008
        MVO@    R1,     R3                      ; 5BAC   0259
        SUBI    #$0001, R3                      ; 5BAD   033B 0001
        MVO@    R0,     R3                      ; 5BAF   0258
        PULR    R7                              ; 5BB0   02B7

L_5BB1:
        MVII    #$000B, R3                      ; 5BB1   02BB 000B
        PSHR    R5                              ; 5BB3   0275
        SDBD                                    ; 5BB4   0001
        MVII    #$5BCE, R4                      ; 5BB5   02BC 00CE 005B
        SDBD                                    ; 5BB8   0001
        MVII    #$5BC4, R5                      ; 5BB9   02BD 00C4 005B
L_5BBC:
        SDBD                                    ; 5BBC   0001
        MVI@    R4,     R0                      ; 5BBD   02A0
        MVO@    R0,     R1                      ; 5BBE   0248
        ADD@    R5,     R1                      ; 5BBF   02E9
        DECR    R3                              ; 5BC0   0013
        BNEQ    L_5BBC                          ; 5BC1   022C 0006
        PULR    R7                              ; 5BC3   02B7

        DECLE   $0001,  $0001,  $0012,  $0001   ; 5BC4   0001 0001 0012 0001
        DECLE   $0001,  $0012,  $0001,  $0001   ; 5BC8   0001 0012 0001 0001
        DECLE   $0013,  $0014,  $0084,  $0008   ; 5BCC   0013 0014 0084 0008
        DECLE   $008C,  $0008,  $0094,  $0008   ; 5BD0   008C 0008 0094 0008
        DECLE   $009C,  $0008,  $00FC,  $0002   ; 5BD4   009C 0008 00FC 0002
        DECLE   $00A4,  $0008,  $00AC,  $0008   ; 5BD8   00A4 0008 00AC 0008
        DECLE   $00B3,  $0008,  $00BC,  $0008   ; 5BDC   00B3 0008 00BC 0008
        DECLE   $00F3,  $0005                   ; 5BE0   00F3 0005

        ADDR    R0,     R3                      ; 5BE2   00C3
        INCR    R0                              ; 5BE3   0008
        PSHR    R5                              ; 5BE4   0275
        MVI     G_015D, R0                      ; 5BE5   0280 015D
        DECR    R0                              ; 5BE7   0010
        BMI     L_5C20                          ; 5BE8   020B 0036

        MVO     R0,     G_015D                  ; 5BEA   0240 015D
L_5BEC:
        MVII    #$0008, R0                      ; 5BEC   02B8 0008

        JSR     R5,     X_RAND2                 ; 5BEE   0004 0114 029E

        MOVR    R0,     R1                      ; 5BF1   0081
        MVII    #$0009, R0                      ; 5BF2   02B8 0009

        JSR     R5,     X_RAND2                 ; 5BF4   0004 0114 029E

        ADDR    R0,     R0                      ; 5BF7   00C0
        INCR    R0                              ; 5BF8   0008
        MOVR    R1,     R2                      ; 5BF9   008A
        ANDI    #$0001, R2                      ; 5BFA   03BA 0001
        BEQ     L_5BFF                          ; 5BFC   0204 0001

        INCR    R0                              ; 5BFE   0008
L_5BFF:
        SLL     R1,     2                       ; 5BFF   004D
        PSHR    R1                              ; 5C00   0271
        SLL     R1,     2                       ; 5C01   004D
        ADD@    R6,     R1                      ; 5C02   02F1
        ADDR    R0,     R1                      ; 5C03   00C1
        ADDI    #$0200, R1                      ; 5C04   02F9 0200
        MVI@    R1,     R0                      ; 5C06   0288
        SDBD                                    ; 5C07   0001
        ANDI    #$07F8, R0                      ; 5C08   03B8 00F8 0007
        BNEQ    L_5BEC                          ; 5C0B   022C 0020

        JSR     R5,     L_51FC                  ; 5C0D   0004 0150 01FC

        ADDI    #$0021, R0                      ; 5C10   02F8 0021
        SLL     R0,     2                       ; 5C12   004C
        ADDR    R0,     R0                      ; 5C13   00C0
        PSHR    R0                              ; 5C14   0270
L_5C15:
        MVII    #$0003, R0                      ; 5C15   02B8 0003

        JSR     R5,     X_RAND1                 ; 5C17   0004 0114 027D

        CMPI    #$0005, R0                      ; 5C1A   0378 0005
        BEQ     L_5C15                          ; 5C1C   0224 0008

        XOR@    R6,     R0                      ; 5C1E   03F0
        MVO@    R0,     R1                      ; 5C1F   0248
L_5C20:
        PULR    R7                              ; 5C20   02B7

L_5C21:
        PSHR    R5                              ; 5C21   0275
        MVI     G_0167, R0                      ; 5C22   0280 0167
        MVII    #$0001, R3                      ; 5C24   02BB 0001
        MVII    #$0003, R1                      ; 5C26   02B9 0003
        MVII    #$02A1, R4                      ; 5C28   02BC 02A1

        JSR     R5,     X_PRNUM_LFT             ; 5C2A   0004 0118 009E

        MVI     G_0168, R0                      ; 5C2D   0280 0168
        MVII    #$0007, R3                      ; 5C2F   02BB 0007
        MVII    #$02B0, R4                      ; 5C31   02BC 02B0

        JSR     R5,     X_PRNUM_RGT             ; 5C33   0004 0118 00C5

        PULR    R7                              ; 5C36   02B7

        DECLE   $0000,  $0000                   ; 5C37   0000 0000

        RSWD    R0                              ; 5C39   0038
        SLLC    R1,     2                       ; 5C3A   005D
        SWAP    R1,     1                       ; 5C3B   0041
        SLLC    R0,     2                       ; 5C3C   005C
        SWAP    R1,     1                       ; 5C3D   0041
        SLLC    R0,     2                       ; 5C3E   005C
        SWAP    R1,     1                       ; 5C3F   0041
        SLLC    R0,     2                       ; 5C40   005C
        PSHR    R5                              ; 5C41   0275
        MOVR    R1,     R3                      ; 5C42   008B
        SLL     R1,     2                       ; 5C43   004D
        SLL     R1,     2                       ; 5C44   004D
        SLL     R1,     1                       ; 5C45   0049
        ADDI    #$0328, R1                      ; 5C46   02F9 0328
        MVI@    R1,     R2                      ; 5C48   028A
        SWAP    R2,     1                       ; 5C49   0042
        ANDI    #$00FF, R2                      ; 5C4A   03BA 00FF
        SUBI    #$0004, R2                      ; 5C4C   033A 0004
        SLR     R2,     1                       ; 5C4E   0062
        SLR     R2,     2                       ; 5C4F   0066
        SLL     R2,     2                       ; 5C50   004E
        PSHR    R2                              ; 5C51   0272
        SLL     R2,     2                       ; 5C52   004E
        ADD@    R6,     R2                      ; 5C53   02F2
        DECR    R1                              ; 5C54   0011
        MVI@    R1,     R0                      ; 5C55   0288
        SWAP    R0,     1                       ; 5C56   0040
        ANDI    #$00FF, R0                      ; 5C57   03B8 00FF
        SLR     R0,     2                       ; 5C59   0064
        SLR     R0,     1                       ; 5C5A   0060
        DECR    R0                              ; 5C5B   0010
        ADDR    R0,     R2                      ; 5C5C   00C2
        ADDI    #$0006, R1                      ; 5C5D   02F9 0006

        JSR     R5,     .EXEC.760               ; 5C5F   0004 0114 0360

        BNEQ    L_5CA8                          ; 5C62   020C 0044

        CMPI    #$00A0, R2                      ; 5C64   037A 00A0
        BGE     L_5CA7                          ; 5C66   020D 003F

        ADDI    #$0200, R2                      ; 5C68   02FA 0200
        MVI@    R2,     R0                      ; 5C6A   0290
        SLR     R0,     2                       ; 5C6B   0064
        SLR     R0,     1                       ; 5C6C   0060
        ANDI    #$01FF, R0                      ; 5C6D   03B8 01FF
        SUBI    #$0021, R0                      ; 5C6F   0338 0021
        BMI     L_5CA7                          ; 5C71   020B 0034

        CMPI    #$001A, R0                      ; 5C73   0378 001A
        BGE     L_5CA7                          ; 5C75   020D 0030

        PSHR    R0                              ; 5C77   0270
        CLRR    R0                              ; 5C78   01C0
        MVO@    R0,     R2                      ; 5C79   0250
        MVI     G_015D, R0                      ; 5C7A   0280 015D
        INCR    R0                              ; 5C7C   0008
        MVO     R0,     G_015D                  ; 5C7D   0240 015D
        MOVR    R1,     R2                      ; 5C7F   008A
        SDBD                                    ; 5C80   0001
        MVII    #$5762, R1                      ; 5C81   02B9 0062 0057

        JSR     R5,     X_INIT_MOB              ; 5C84   0004 0114 02B2

        SDBD                                    ; 5C87   0001
        MVII    #$10A0, R0                      ; 5C88   02B8 00A0 0010
        MOVR    R2,     R1                      ; 5C8B   0091
        SUBI    #$0008, R2                      ; 5C8C   033A 0008
        MVI@    R2,     R3                      ; 5C8E   0293
        ANDI    #$0007, R3                      ; 5C8F   03BB 0007
        XORR    R3,     R0                      ; 5C91   01D8
        MVO@    R0,     R1                      ; 5C92   0248

        JSR     R5,     .EXEC.766               ; 5C93   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5C96   0004 0114 02CF

        ADDI    #$0007, R1                      ; 5C99   02F9 0007
        PULR    R0                              ; 5C9B   02B0
        MVO@    R0,     R1                      ; 5C9C   0248
        SUBI    #$0006, R1                      ; 5C9D   0339 0006
        PSHR    R1                              ; 5C9F   0271

        JSR     R5,     L_578D                  ; 5CA0   0004 0154 038D

        PULR    R1                              ; 5CA3   02B1

        JSR     R5,     L_5CFA                  ; 5CA4   0004 015C 00FA

L_5CA7:
        PULR    R7                              ; 5CA7   02B7

L_5CA8:
        ADDI    #$0002, R1                      ; 5CA8   02F9 0002
        ADDI    #$015E, R3                      ; 5CAA   02FB 015E
        MVI@    R3,     R0                      ; 5CAC   0298
        CMPI    #$00F0, R0                      ; 5CAD   0378 00F0
        BGE     L_5D89                          ; 5CAF   020D 00D8

        CMPI    #$00B4, R2                      ; 5CB1   037A 00B4
        BLT     L_5D89                          ; 5CB3   0205 00D4

        MVI@    R1,     R0                      ; 5CB5   0288
        CLRR    R2                              ; 5CB6   01D2
        SDBD                                    ; 5CB7   0001
        CMPI    #$5400, R0                      ; 5CB8   0378 0000 0054
        BC      L_5CC3                          ; 5CBB   0201 0006

        CMPI    #$032F, R1                      ; 5CBD   0379 032F
        BEQ     L_5CC8                          ; 5CBF   0204 0007
        B       L_5D89                          ; 5CC1   0200 00C6

L_5CC3:
        CMPI    #$034F, R1                      ; 5CC3   0379 034F
        BNEQ    L_5D89                          ; 5CC5   020C 00C2

        INCR    R2                              ; 5CC7   000A
L_5CC8:
        MOVR    R2,     R3                      ; 5CC8   0093
        ADDI    #$015E, R2                      ; 5CC9   02FA 015E
        ADDI    #$0160, R3                      ; 5CCB   02FB 0160
        PSHR    R2                              ; 5CCD   0272
        MVI@    R2,     R2                      ; 5CCE   0292
        ADD@    R3,     R2                      ; 5CCF   02DA
        ADDI    #$0200, R2                      ; 5CD0   02FA 0200
        ADDI    #$0005, R1                      ; 5CD2   02F9 0005
        MVI@    R1,     R0                      ; 5CD4   0288
        SLL     R0,     2                       ; 5CD5   004C
        SLL     R0,     1                       ; 5CD6   0048
        SUBI    #$0007, R1                      ; 5CD7   0339 0007
        MVI@    R1,     R4                      ; 5CD9   028C
        ANDI    #$0007, R4                      ; 5CDA   03BC 0007
        XORR    R4,     R0                      ; 5CDC   01E0
        ADDI    #$0108, R0                      ; 5CDD   02F8 0108
        MVO@    R0,     R2                      ; 5CDF   0250
        PULR    R2                              ; 5CE0   02B2
        MVI@    R3,     R0                      ; 5CE1   0298
        INCR    R0                              ; 5CE2   0008
        CMPI    #$0008, R0                      ; 5CE3   0378 0008
        BLT     L_5CEC                          ; 5CE5   0205 0005

        MVI@    R2,     R4                      ; 5CE7   0294
        ADDI    #$0014, R4                      ; 5CE8   02FC 0014
        CLRR    R0                              ; 5CEA   01C0
        MVO@    R4,     R2                      ; 5CEB   0254
L_5CEC:
        MVO@    R0,     R3                      ; 5CEC   0258

        JSR     R5,     L_5D14                  ; 5CED   0004 015C 0114
        JSR     R5,     .EXEC.766               ; 5CF0   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 5CF3   0004 0114 02D5
        JSR     R5,     .EXEC.7AE               ; 5CF6   0004 0114 03AE

        PULR    R7                              ; 5CF9   02B7

L_5CFA:
        MVI@    R1,     R0                      ; 5CFA   0288
        TSTR    R0                              ; 5CFB   0080
        BEQ     L_5D13                          ; 5CFC   0204 0015

        MOVR    R1,     R2                      ; 5CFE   008A
        SUBI    #$0010, R2                      ; 5CFF   033A 0010
        SDBD                                    ; 5D01   0001
        MVII    #$05FA, R3                      ; 5D02   02BB 00FA 0005
        ADDI    #$0003, R1                      ; 5D05   02F9 0003
        MVI@    R2,     R0                      ; 5D07   0290
        SDBD                                    ; 5D08   0001
        CMPI    #$5AAA, R0                      ; 5D09   0378 00AA 005A
        BEQ     L_5D12                          ; 5D0C   0204 0004

        SDBD                                    ; 5D0E   0001
        MVII    #$F3FA, R3                      ; 5D0F   02BB 00FA 00F3
L_5D12:
        MVO@    R3,     R1                      ; 5D12   024B
L_5D13:
        MOVR    R5,     R7                      ; 5D13   00AF

L_5D14:
        PSHR    R5                              ; 5D14   0275
        MVI@    R2,     R5                      ; 5D15   0295
        CMPI    #$00F0, R5                      ; 5D16   037D 00F0
        BGE     L_5D29                          ; 5D18   020D 000F

        ADD@    R3,     R5                      ; 5D1A   02DD
        ADDI    #$0200, R5                      ; 5D1B   02FD 0200
        MVII    #$0001, R0                      ; 5D1D   02B8 0001
        CMPI    #$015E, R2                      ; 5D1F   037A 015E
        BEQ     L_5D25                          ; 5D21   0204 0002

        MVII    #$0007, R0                      ; 5D23   02B8 0007
L_5D25:
        XORI    #$02F8, R0                      ; 5D25   03F8 02F8
        MVO@    R0,     R5                      ; 5D27   0268
        PULR    R7                              ; 5D28   02B7

L_5D29:
        SUBI    #$015E, R2                      ; 5D29   033A 015E
        XORI    #$0001, R2                      ; 5D2B   03FA 0001
        ADDI    #$015E, R2                      ; 5D2D   02FA 015E
        MVI@    R2,     R0                      ; 5D2F   0290
        CMPI    #$00F0, R0                      ; 5D30   0378 00F0
        BLT     L_5D37                          ; 5D32   0205 0003

        JSR     R5,     L_5DF9                  ; 5D34   0004 015C 01F9

L_5D37:
        PULR    R7                              ; 5D37   02B7

        PSHR    R5                              ; 5D38   0275
        MOVR    R1,     R2                      ; 5D39   008A
        MOVR    R2,     R3                      ; 5D3A   0093
        ADDI    #$015E, R2                      ; 5D3B   02FA 015E
        ADDI    #$0160, R3                      ; 5D3D   02FB 0160
        CMPI    #$000B, R0                      ; 5D3F   0378 000B
        BNEQ    L_5D58                          ; 5D41   020C 0015

        MVI@    R3,     R1                      ; 5D43   0299
        TSTR    R1                              ; 5D44   0089
        BEQ     L_5D57                          ; 5D45   0204 0010

        ADD@    R2,     R1                      ; 5D47   02D1
        ADDI    #$0200, R1                      ; 5D48   02F9 0200
        CLRR    R0                              ; 5D4A   01C0
        MVO@    R0,     R1                      ; 5D4B   0248
        MVO@    R0,     R3                      ; 5D4C   0258
        MVI@    R2,     R0                      ; 5D4D   0290
        ADDI    #$0014, R0                      ; 5D4E   02F8 0014
        MVO@    R0,     R2                      ; 5D50   0250

        JSR     R5,     L_5D14                  ; 5D51   0004 015C 0114
        JSR     R5,     L_5FC0                  ; 5D54   0004 015C 03C0

L_5D57:
        PULR    R7                              ; 5D57   02B7

L_5D58:
        TSTR    R0                              ; 5D58   0080
        BNEQ    L_5D88                          ; 5D59   020C 002D

        MVI@    R2,     R1                      ; 5D5B   0291
        ADD@    R3,     R1                      ; 5D5C   02D9
        ADDI    #$0200, R1                      ; 5D5D   02F9 0200
        CMPI    #$02B5, R1                      ; 5D5F   0379 02B5
        BEQ     L_5D88                          ; 5D61   0204 0025

        CMPI    #$02BF, R1                      ; 5D63   0379 02BF
        BEQ     L_5D88                          ; 5D65   0204 0021

        CMPI    #$02F0, R1                      ; 5D67   0379 02F0
        BGE     L_5D6D                          ; 5D69   020D 0002

        CLRR    R0                              ; 5D6B   01C0
        MVO@    R0,     R1                      ; 5D6C   0248
L_5D6D:
        MVI@    R3,     R0                      ; 5D6D   0298
        TSTR    R0                              ; 5D6E   0080
        BNEQ    L_5D83                          ; 5D6F   020C 0012

        SUBI    #$0014, R1                      ; 5D71   0339 0014
L_5D73:
        MVI@    R1,     R5                      ; 5D73   028D
        TSTR    R5                              ; 5D74   00AD
        BEQ     L_5D7B                          ; 5D75   0204 0004

        INCR    R0                              ; 5D77   0008
        INCR    R1                              ; 5D78   0009
        B       L_5D73                          ; 5D79   0220 0007

L_5D7B:
        MVI@    R2,     R5                      ; 5D7B   0295
        SUBI    #$0014, R5                      ; 5D7C   033D 0014
        MVO@    R5,     R2                      ; 5D7E   0255
        CMPI    #$0008, R0                      ; 5D7F   0378 0008
        BNEQ    L_5D84                          ; 5D81   020C 0001

L_5D83:
        DECR    R0                              ; 5D83   0010
L_5D84:
        MVO@    R0,     R3                      ; 5D84   0258

        JSR     R5,     L_5D14                  ; 5D85   0004 015C 0114

L_5D88:
        PULR    R7                              ; 5D88   02B7

L_5D89:
        SUBI    #$0008, R1                      ; 5D89   0339 0008

        JSR     R5,     L_5DAD                  ; 5D8B   0004 015C 01AD
        DECLE   $0000,  $0050                   ; 5D8E   0000 0050

        SLR     R0,     1                       ; 5D90   0060
        BNC     L_5DAC                          ; 5D91   0209 0019

        INCR    R1                              ; 5D93   0009

        JSR     R5,     L_5DAD                  ; 5D94   0004 015C 01AD
        DECLE   $0004,  $0038                   ; 5D97   0004 0038

        SWAP    R0,     1                       ; 5D99   0040
        BNC     L_5DAC                          ; 5D9A   0209 0010

        ADDI    #$0005, R1                      ; 5D9C   02F9 0005

        JSR     R5,     .EXEC.760               ; 5D9E   0004 0114 0360

        BEQ     L_5DAC                          ; 5DA1   0204 0009

        JSR     R5,     .EXEC.766               ; 5DA3   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 5DA6   0004 0114 02D5
        JSR     R5,     .EXEC.7AE               ; 5DA9   0004 0114 03AE

L_5DAC:
        PULR    R7                              ; 5DAC   02B7

L_5DAD:
        MVI@    R1,     R0                      ; 5DAD   0288
        SWAP    R0,     1                       ; 5DAE   0040
        ANDI    #$00FF, R0                      ; 5DAF   03B8 00FF
        ADD@    R5,     R0                      ; 5DB1   02E8
        CMP@    R5,     R0                      ; 5DB2   0368
        BLT     L_5DBA                          ; 5DB3   0205 0005

        CMP@    R5,     R0                      ; 5DB5   0368
        BGT     L_5DBB                          ; 5DB6   020E 0003

        SETC                                    ; 5DB8   0007
        MOVR    R5,     R7                      ; 5DB9   00AF

L_5DBA:
        INCR    R5                              ; 5DBA   000D
L_5DBB:
        CLRC                                    ; 5DBB   0006
        MOVR    R5,     R7                      ; 5DBC   00AF

L_5DBD:
        PSHR    R5                              ; 5DBD   0275
        MVI     G_0162, R0                      ; 5DBE   0280 0162
        TSTR    R0                              ; 5DC0   0080
        BNEQ    L_5DF8                          ; 5DC1   020C 0035

        MVI     G_0163, R0                      ; 5DC3   0280 0163
        MVI     G_0164, R1                      ; 5DC5   0281 0164
        DECR    R1                              ; 5DC7   0011
        BNEQ    L_5DD6                          ; 5DC8   020C 000C

        TSTR    R0                              ; 5DCA   0080
        BNEQ    L_5DD6                          ; 5DCB   020C 0009

        PSHR    R0                              ; 5DCD   0270
        PSHR    R1                              ; 5DCE   0271

        JSR     R5,     L_5DF9                  ; 5DCF   0004 015C 01F9

        PULR    R0                              ; 5DD2   02B0
        PULR    R1                              ; 5DD3   02B1
        B       L_5DDD                          ; 5DD4   0200 0007
L_5DD6:
        BPL     L_5DDB                          ; 5DD6   0203 0003

        DECR    R0                              ; 5DD8   0010
        MVII    #$003B, R1                      ; 5DD9   02B9 003B
L_5DDB:
        MVO     R0,     G_0163                  ; 5DDB   0240 0163
L_5DDD:
        MVO     R1,     G_0164                  ; 5DDD   0241 0164
        PSHR    R1                              ; 5DDF   0271
        CLRR    R3                              ; 5DE0   01DB
        MVII    #$0001, R1                      ; 5DE1   02B9 0001
        MVII    #$0201, R4                      ; 5DE3   02BC 0201

        JSR     R5,     X_PRNUM_LFT             ; 5DE5   0004 0118 009E

        INCR    R4                              ; 5DE8   000C

        JSR     R5,     X_PRINT_R5              ; 5DE9   0004 0118 007B
        STRING  ":"                             ; 5DEC   003A
        DECLE   $0000                           ; 5DED   0000

        MVII    #$0002, R1                      ; 5DEE   02B9 0002
        CLRR    R3                              ; 5DF0   01DB
        PULR    R0                              ; 5DF1   02B0

        JSR     R5,     X_PRNUM_ZRO             ; 5DF2   0004 0118 00AD
        JSR     R5,     .EXEC.607               ; 5DF5   0004 0114 0207

L_5DF8:
        PULR    R7                              ; 5DF8   02B7

L_5DF9:
        PSHR    R5                              ; 5DF9   0275
        MVII    #$0002, R0                      ; 5DFA   02B8 0002

        JSR     R5,     .EXEC.6D5               ; 5DFC   0004 0114 02D5

        MVII    #$0006, R0                      ; 5DFF   02B8 0006

        JSR     R5,     .EXEC.6D5               ; 5E01   0004 0114 02D5

        CLRR    R0                              ; 5E04   01C0
        MVII    #$031E, R3                      ; 5E05   02BB 031E
L_5E07:
        MVO@    R0,     R3                      ; 5E07   0258
        ADDI    #$0008, R3                      ; 5E08   02FB 0008
        CMPI    #$0356, R3                      ; 5E0A   037B 0356
        BLT     L_5E07                          ; 5E0C   0225 0006

        MVII    #$0001, R0                      ; 5E0E   02B8 0001
        MVO     R0,     G_0162                  ; 5E10   0240 0162
        MVII    #$000A, R0                      ; 5E12   02B8 000A

        JSR     R5,     X_PLAY_RAZZ4            ; 5E14   0004 011C 02C4

        MVII    #$015E, R2                      ; 5E17   02BA 015E
        MVII    #$0160, R3                      ; 5E19   02BB 0160
        MVII    #$0002, R4                      ; 5E1B   02BC 0002
L_5E1D:
        MVI@    R2,     R1                      ; 5E1D   0291
        CMPI    #$00F0, R1                      ; 5E1E   0379 00F0
        BGE     L_5E27                          ; 5E20   020D 0005

        ADD@    R3,     R1                      ; 5E22   02D9
        ADDI    #$0200, R1                      ; 5E23   02F9 0200
        CLRR    R0                              ; 5E25   01C0
        MVO@    R0,     R1                      ; 5E26   0248
L_5E27:
        INCR    R2                              ; 5E27   000A
        INCR    R3                              ; 5E28   000B
        DECR    R4                              ; 5E29   0014
        BNEQ    L_5E1D                          ; 5E2A   022C 000E

        SDBD                                    ; 5E2C   0001
        MVII    #$1906, R0                      ; 5E2D   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5E30   0240 035D

        JSR     R5,     .EXEC.A61               ; 5E32   0004 0118 0261

        ADCR    R0                              ; 5E35   0028
        SDBD                                    ; 5E36   0001
        MVII    #$5E44, R0                      ; 5E37   02B8 0044 005E
        MVO     R0,     G_035D                  ; 5E3A   0240 035D
        MVII    #$00A9, R0                      ; 5E3C   02B8 00A9
        MVO     R0,     G_0165                  ; 5E3E   0240 0165

        JSR     R5,     L_5E91                  ; 5E40   0004 015C 0291

        PULR    R7                              ; 5E43   02B7

        DECLE   $0000,  $0000,  $004E,  $005E   ; 5E44   0000 0000 004E 005E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E48   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5E4C   0000 0000

        PSHR    R5                              ; 5E4E   0275
        MVI     G_0165, R2                      ; 5E4F   0282 0165
        SARC    R2,     1                       ; 5E51   007A
        MOVR    R1,     R3                      ; 5E52   008B
        ADCR    R3                              ; 5E53   002B
        CMPI    #$000A, R0                      ; 5E54   0378 000A
        BEQ     L_5E74                          ; 5E56   0204 001C

        CMPI    #$000B, R0                      ; 5E58   0378 000B
        BNEQ    L_5E73                          ; 5E5A   020C 0017

        DECR    R3                              ; 5E5C   0013
        BEQ     L_5E73                          ; 5E5D   0204 0014

        PSHR    R1                              ; 5E5F   0271

        JSR     R5,     L_5EE4                  ; 5E60   0004 015C 02E4

        PULR    R1                              ; 5E63   02B1
        XORI    #$0001, R1                      ; 5E64   03F9 0001
        ADDI    #$0167, R1                      ; 5E66   02F9 0167
        ADD@    R1,     R4                      ; 5E68   02CC
        MVO@    R4,     R1                      ; 5E69   024C

        JSR     R5,     L_5C21                  ; 5E6A   0004 015C 0021
        JSR     R5,     L_5E89                  ; 5E6D   0004 015C 0289
        JSR     R5,     L_50F7                  ; 5E70   0004 0150 00F7

L_5E73:
        PULR    R7                              ; 5E73   02B7

L_5E74:
        DECR    R3                              ; 5E74   0013
        BNEQ    L_5E88                          ; 5E75   020C 0011

        SLL     R1,     1                       ; 5E77   0049
        DECR    R1                              ; 5E78   0011
        MVI     G_0165, R2                      ; 5E79   0282 0165
        ADDI    #$0200, R2                      ; 5E7B   02FA 0200
        MVII    #$0008, R3                      ; 5E7D   02BB 0008
        CLRR    R0                              ; 5E7F   01C0
L_5E80:
        ADDR    R1,     R2                      ; 5E80   00CA
        MVO@    R0,     R2                      ; 5E81   0250
        DECR    R3                              ; 5E82   0013
        BNEQ    L_5E80                          ; 5E83   022C 0004

        JSR     R5,     L_5E89                  ; 5E85   0004 015C 0289

L_5E88:
        PULR    R7                              ; 5E88   02B7

L_5E89:
        PSHR    R5                              ; 5E89   0275
        MVI     G_0165, R1                      ; 5E8A   0281 0165
        ADDI    #$0200, R1                      ; 5E8C   02F9 0200
        CLRR    R0                              ; 5E8E   01C0
        MVO@    R0,     R1                      ; 5E8F   0248
        INCR    R7                              ; 5E90   000F

L_5E91:
        PSHR    R5                              ; 5E91   0275
L_5E92:
        MVI     G_0165, R1                      ; 5E92   0281 0165
        ADDI    #$0014, R1                      ; 5E94   02F9 0014
        MVII    #$01FA, R0                      ; 5E96   02B8 01FA
        CMPI    #$00FA, R1                      ; 5E98   0379 00FA
        BEQ     L_5EBA                          ; 5E9A   0204 001E

        CMPI    #$00F9, R1                      ; 5E9C   0379 00F9
        BNEQ    L_5EA2                          ; 5E9E   020C 0002

        MVII    #$00BE, R1                      ; 5EA0   02B9 00BE
L_5EA2:
        SARC    R1,     1                       ; 5EA2   0079
        BC      L_5EA9                          ; 5EA3   0201 0004

        SDBD                                    ; 5EA5   0001
        MVII    #$08CA, R0                      ; 5EA6   02B8 00CA 0008
L_5EA9:
        RLC     R1,     1                       ; 5EA9   0051
        MVO     R1,     G_0165                  ; 5EAA   0241 0165
        PSHR    R0                              ; 5EAC   0270

        JSR     R5,     L_5EE4                  ; 5EAD   0004 015C 02E4

        PULR    R0                              ; 5EB0   02B0
        TSTR    R4                              ; 5EB1   00A4
        BEQ     L_5E92                          ; 5EB2   0224 0021

        MVI     G_0165, R1                      ; 5EB4   0281 0165
        ADDI    #$0200, R1                      ; 5EB6   02F9 0200
        MVO@    R0,     R1                      ; 5EB8   0248
        PULR    R7                              ; 5EB9   02B7

L_5EBA:
        MVI     G_0166, R0                      ; 5EBA   0280 0166
        CMPI    #$0005, R0                      ; 5EBC   0378 0005
        BEQ     L_5ECE                          ; 5EBE   0204 000E

        SDBD                                    ; 5EC0   0001
        MVII    #$1906, R0                      ; 5EC1   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5EC4   0240 035D

        JSR     R5,     .EXEC.A61               ; 5EC6   0004 0118 0261

        RSWD    R4                              ; 5EC9   003C

        JSR     R5,     L_59CC                  ; 5ECA   0004 0158 01CC

        PULR    R7                              ; 5ECD   02B7

L_5ECE:
        MVII    #$0006, R3                      ; 5ECE   02BB 0006
        MVII    #$02A7, R4                      ; 5ED0   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; 5ED2   0004 0118 007B
        STRING  " GAME  "                       ; 5ED5  
        DECLE   $0000                           ; 5EDC   0000

        JSR     R5,     L_5FC0                  ; 5EDD   0004 015C 03C0
        JSR     R5,     L_50DF                  ; 5EE0   0004 0150 00DF

        PULR    R7                              ; 5EE3   02B7

L_5EE4:
        CLRR    R4                              ; 5EE4   01E4
        MVI     G_0165, R1                      ; 5EE5   0281 0165
        MVII    #$0001, R2                      ; 5EE7   02BA 0001
        MVII    #$0008, R3                      ; 5EE9   02BB 0008
        MOVR    R1,     R0                      ; 5EEB   0088
        SARC    R0,     1                       ; 5EEC   0078
        BNC     L_5EF0                          ; 5EED   0209 0001

        NEGR    R2                              ; 5EEF   0022
L_5EF0:
        ADDI    #$0200, R1                      ; 5EF0   02F9 0200
L_5EF2:
        ADDR    R2,     R1                      ; 5EF2   00D1
        MVI@    R1,     R0                      ; 5EF3   0288
        TSTR    R0                              ; 5EF4   0080
        BEQ     L_5EF8                          ; 5EF5   0204 0001

        INCR    R4                              ; 5EF7   000C
L_5EF8:
        DECR    R3                              ; 5EF8   0013
        BNEQ    L_5EF2                          ; 5EF9   022C 0008
        MOVR    R5,     R7                      ; 5EFB   00AF

L_5EFC:
        PSHR    R5                              ; 5EFC   0275

        JSR     R5,     X_PLAY_SFX2             ; 5EFD   0004 0118 03BE
        DECLE   $0082                           ; 5F00  SFX prio
        DECLE   $0389                           ; 5F01  SFX data
        DECLE   $0054,  $0000                   ; 5F02  SFX data
        DECLE   $03DB                           ; 5F04  SFX data
        DECLE   $03DB                           ; 5F05  SFX data
        DECLE   $0040,  $0080                   ; 5F06  SFX data
        DECLE   $0048,  $0080                   ; 5F08  SFX data
        DECLE   $021B                           ; 5F0A  SFX data
        DECLE   $021B                           ; 5F0B  SFX data
        DECLE   $010C,  $0000                   ; 5F0C  SFX data
        DECLE   $000B                           ; 5F0E  SFX data
        DECLE   $008F,  $003B                   ; 5F0F  SFX data
        DECLE   $03CF                           ; 5F11  SFX end


        PSHR    R5                              ; 5F12   0275
        MVII    #$0007, R0                      ; 5F13   02B8 0007

        JSR     R5,     X_RAND2                 ; 5F15   0004 0114 029E

        CMPI    #$0003, R0                      ; 5F18   0378 0003
        BGT     L_5FBF                          ; 5F1A   020E 00A3

        SDBD                                    ; 5F1C   0001
        MVII    #$5F22, R1                      ; 5F1D   02B9 0022 005F
        ADDR    R0,     R1                      ; 5F20   00C1
        ADD@    R1,     R7                      ; 5F21   02CF

        DECLE   $0004                           ; 5F22   0004

        ADCR    R1                              ; 5F23   0029
        RLC     R0,     2                       ; 5F24   0054
        RRC     R0,     2                       ; 5F25   0074

        JSR     R5,     X_PLAY_SFX1             ; 5F26   0004 0118 03BB
        DECLE   $0389                           ; 5F29  SFX data
        DECLE   $0200,  $0048                   ; 5F2A  SFX data
        DECLE   $0208,  $0049                   ; 5F2C  SFX data
        DECLE   $0184,  $0020                   ; 5F2E  SFX data
        DECLE   $019B                           ; 5F30  SFX data
        DECLE   $0001,  $000C                   ; 5F31  SFX data
        DECLE   $0001,  $000E                   ; 5F33  SFX data
        DECLE   $0001,  $0009                   ; 5F35  SFX data
        DECLE   $005E                           ; 5F37  SFX data
        DECLE   $00EB                           ; 5F38  SFX data
        DECLE   $0001,  $03F0                   ; 5F39  SFX data
        DECLE   $0001,  $03F2                   ; 5F3B  SFX data
        DECLE   $0001,  $03F9                   ; 5F3D  SFX data
        DECLE   $01EB                           ; 5F3F  SFX data
        DECLE   $0001,  $0008                   ; 5F40  SFX data
        DECLE   $0001,  $000A                   ; 5F42  SFX data
        DECLE   $0001,  $0009                   ; 5F44  SFX data
        DECLE   $03BB                           ; 5F46  SFX data
        DECLE   $03AE                           ; 5F47  SFX data
        DECLE   $036B                           ; 5F48  SFX data
        DECLE   $03F9                           ; 5F49  SFX data
        DECLE   $02CF                           ; 5F4A  SFX end


        JSR     R5,     X_PLAY_SFX1             ; 5F4B   0004 0118 03BB
        DECLE   $02C0,  $0050                   ; 5F4E  SFX data
        DECLE   $01DB                           ; 5F50  SFX data
        DECLE   $0001,  $03F8                   ; 5F51  SFX data
        DECLE   $0042                           ; 5F53  SFX data
        DECLE   $03E9                           ; 5F54  SFX data
        DECLE   $002B                           ; 5F55  SFX data
        DECLE   $02C8,  $0050                   ; 5F56  SFX data
        DECLE   $01DB                           ; 5F58  SFX data
        DECLE   $0001,  $03FA                   ; 5F59  SFX data
        DECLE   $004A                           ; 5F5B  SFX data
        DECLE   $03C9                           ; 5F5C  SFX data
        DECLE   $002B                           ; 5F5D  SFX data
        DECLE   $02C4,  $0050                   ; 5F5E  SFX data
        DECLE   $01DB                           ; 5F60  SFX data
        DECLE   $0001,  $03F9                   ; 5F61  SFX data
        DECLE   $0046                           ; 5F63  SFX data
        DECLE   $0389                           ; 5F64  SFX data
        DECLE   $002B                           ; 5F65  SFX data
        DECLE   $012B                           ; 5F66  SFX data
        DECLE   $0001,  $0008                   ; 5F67  SFX data
        DECLE   $03C2                           ; 5F69  SFX data
        DECLE   $002B                           ; 5F6A  SFX data
        DECLE   $0001,  $000A                   ; 5F6B  SFX data
        DECLE   $03CA                           ; 5F6D  SFX data
        DECLE   $002B                           ; 5F6E  SFX data
        DECLE   $0001,  $0009                   ; 5F6F  SFX data
        DECLE   $03C6                           ; 5F71  SFX data
        DECLE   $002B                           ; 5F72  SFX data
        DECLE   $03EB                           ; 5F73  SFX data
        DECLE   $03F9                           ; 5F74  SFX data
        DECLE   $02CF                           ; 5F75  SFX end


        JSR     R5,     X_PLAY_SFX1             ; 5F76   0004 0118 03BB
        DECLE   $0389                           ; 5F79  SFX data
        DECLE   $03C0,  $0048                   ; 5F7A  SFX data
        DECLE   $03C8,  $004A                   ; 5F7C  SFX data
        DECLE   $0344,  $0028                   ; 5F7E  SFX data
        DECLE   $01DB                           ; 5F80  SFX data
        DECLE   $004F,  $000A                   ; 5F81  SFX data
        DECLE   $0001,  $03F0                   ; 5F83  SFX data
        DECLE   $0001,  $03F2                   ; 5F85  SFX data
        DECLE   $0001,  $03F9                   ; 5F87  SFX data
        DECLE   $002B                           ; 5F89  SFX data
        DECLE   $0001,  $0008                   ; 5F8A  SFX data
        DECLE   $0001,  $000A                   ; 5F8C  SFX data
        DECLE   $0001,  $0005                   ; 5F8E  SFX data
        DECLE   $0023,  $03C4                   ; 5F90  SFX data
        DECLE   $030E                           ; 5F92  SFX data
        DECLE   $00AB                           ; 5F93  SFX data
        DECLE   $03F9                           ; 5F94  SFX data
        DECLE   $02CF                           ; 5F95  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 5F96   0004 0118 03BE
        DECLE   $0001                           ; 5F99  SFX prio
        DECLE   $0240,  $02C0                   ; 5F9A  SFX data
        DECLE   $0248,  $02F0                   ; 5F9C  SFX data
        DECLE   $0244,  $0320                   ; 5F9E  SFX data
        DECLE   $025B                           ; 5FA0  SFX data
        DECLE   $0001,  $03D3                   ; 5FA1  SFX data
        DECLE   $004E                           ; 5FA3  SFX data
        DECLE   $031D                           ; 5FA4  SFX data
        DECLE   $0077,  $00BA,  $005F           ; 5FA5  SFX data
        DECLE   $002B                           ; 5FA8  SFX data
        DECLE   $0309                           ; 5FA9  SFX data
        DECLE   $0023,  $03E4                   ; 5FAA  SFX data
        DECLE   $03FE                           ; 5FAC  SFX data
        DECLE   $0001,  $0043                   ; 5FAD  SFX data
        DECLE   $017B                           ; 5FAF  SFX data
        DECLE   $004F,  $0020                   ; 5FB0  SFX data
        DECLE   $0077,  $00BA,  $005F           ; 5FB2  SFX data
        DECLE   $002B                           ; 5FB5  SFX data
        DECLE   $0309                           ; 5FB6  SFX data
        DECLE   $0023,  $03E4                   ; 5FB7  SFX data
        DECLE   $02CF                           ; 5FB9  SFX end

UC_5FBA:
        MVII    #$003F, R0                      ; 5FBA  SLIB UCALL target
        ADDI    #$0008, R3                      ; 5FBC   02FB 0008
        MVO@    R0,     R3                      ; 5FBE   0258
L_5FBF:
        PULR    R7                              ; 5FBF   02B7

L_5FC0:
        PSHR    R5                              ; 5FC0   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FC1   0004 0118 03BE
        DECLE   $00FF                           ; 5FC4  SFX prio
        DECLE   $0077,  $00E3,  $005F,  $0189   ; 5FC5   0077 00E3 005F 0189
        DECLE   $004D,  $002C,  $0000           ; 5FC9   004D 002C 0000

        ANDR    R3,     R5                      ; 5FCC   019D
        RLC     R0,     1                       ; 5FCD   0050
        MVI@    R4,     R4                      ; 5FCE   02A4
        SWAP    R0,     2                       ; 5FCF   0044
        XOR@    R1,     R0                      ; 5FD0   03C8
        SLL     R0,     1                       ; 5FD1   0048
        XOR@    R2,     R0                      ; 5FD2   03D0
        INCR    R3                              ; 5FD3   000B
        ADDR    R5,     R3                      ; 5FD4   00EB
        RLC     R0,     1                       ; 5FD5   0050
        ADDR    R0,     R0                      ; 5FD6   00C0
        RLC     R0,     2                       ; 5FD7   0054
        ADDR    R1,     R0                      ; 5FD8   00C8
        SLLC    R0,     1                       ; 5FD9   0058
        ADDR    R2,     R0                      ; 5FDA   00D0
        INCR    R3                              ; 5FDB   000B
        SAR     R3,     1                       ; 5FDC   006B
        INCR    R3                              ; 5FDD   000B
        SWAP    R3,     1                       ; 5FDE   0043
        AND@    R6,     R4                      ; 5FDF   03B4
        XORI    #$002F, R1                      ; 5FE0   03F9 002F
        ADD@    R1,     R7                      ; 5FE2   02CF

        MVII    #$0005, R0                      ; 5FE3   02B8 0005
        MVO     R0,     G_0147                  ; 5FE5   0240 0147
        PULR    R7                              ; 5FE7   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5022       <entry>
;;  $5046       <entry>
;;  $50BD       $50B7  
;;  $50C1       $50BB  
;;  $50DF       $5488   $56C8   $5EE0  
;;  $50EB       $50F4  
;;  $50F6       $50ED  
;;  $50F7       $5E70  
;;  $50F8       $548B  
;;  $5105       $5174   $59D4  
;;  $5107       $510A  
;;  $5144       $5158  
;;  $5166       $516F  
;;  $51B1       $524A   $526C   $5382  
;;  $51BB       $51B6  
;;  $51C0       $5357  
;;  $51C1       $519D  
;;  $51D9       $5171   $535A  
;;  $51DE       $51E9  
;;  $51EC       $51DE   $51E3  
;;  $51FB       $51F0  
;;  $51FC       $51F2   $5C0D  
;;  $5208       $5209  
;;  $5211       $5252   $52D3   $52EE  
;;  $521A       $5216   $521F  
;;  $5221       $521B  
;;  $5222       $523D   $5292   $530D  
;;  $5235       $5231  
;;  $5240       $522B  
;;  $5260       $525C  
;;  $5261       $5265  
;;  $528C       $5286  
;;  $52A7       $5245   $5248   $527C   $528A   $5296  
;;  $52A8       $5315  
;;  $52A9       $5299   $5339  
;;  $52B4       $52B1  
;;  $52BD       $52D0  
;;  $52CC       $52C8  
;;  $52D2       $52BF  
;;  $52DF       $529D  
;;  $530F       $524D  
;;  $5310       $52A1   $5318   $532C   $533D  
;;  $531A       $5313  
;;  $531E       $52E6   $52FA   $52FF  
;;  $531F       $52A5  
;;  $532E       $5280   $5322   $5327  
;;  $5341       $5336  
;;  $5350       $5348  
;;  $5352       $5332   $533F   $5343  
;;  $5357       $5267   $5350  
;;  $5387       $5237   $52CC  
;;  $5388       $5386  
;;  $53AA       $5376   $537A   $537D  
;;  $53E1       $534A   $54B4  
;;  $53F4       $53E5   $53EB  
;;  $5401       $5411  
;;  $5414       $53FA   $540A  
;;  $541D       $5419  
;;  $5430       $5428  
;;  $5431       $541E   $5423  
;;  $5432       $5455  
;;  $5457       $5435   $5439   $5447   $544B   $5452  
;;  $5458       $519A  
;;  $5459       $536F  
;;  $547A       $5464  
;;  $548E       $534D  
;;  $5492       $54A1  
;;  $54A4       $5324  
;;  $54C1       $54A9   $54BD  
;;  $54D3       $51A9  
;;  $54ED       $51B8  
;;  $54FD       $53A1  
;;  $550A       $54FF   $5502   $5505  
;;  $550B       $5508  
;;  $558E       $559E  
;;  $55A0       $5597  
;;  $55B6       $55BD  
;;  $562D       $5651  
;;  $5644       $563D   $5641  
;;  $5649       $5636  
;;  $5654       $5599   $5736  
;;  $565B       $5661  
;;  $5688       $552F   $588A  
;;  $569E       $5558   $555D   $5562  
;;  $56C8       $56C0  
;;  $56E0       $56BA  
;;  $56EE       $56F5  
;;  $56EF       $56E4  
;;  $56F7       $56C6   $56EC  
;;  $571F       $572E  
;;  $5731       $5723  
;;  $5761       $5706   $5720  
;;  $578D       $574B   $57F7   $5800   $5CA0  
;;  $579E       $5796  
;;  $57AA       $588E  
;;  $57AB       $57A9  
;;  $57C8       $57A7   $57B1  
;;  $57C9       $570F  
;;  $57E2       $57CE  
;;  $57E3       $55D5  
;;  $57E4       $56F7  
;;  $581A       $5813  
;;  $585B       $585F  
;;  $5861       $585C  
;;  $5887       $5884  
;;  $58B3       $5862  
;;  $58C8       $583D   $5841   $5845   $584B  
;;  $58C9       $58B3  
;;  $58E2       $57DF  
;;  $590C       $5904  
;;  $5911       $58F6  
;;  $591C       $5857  
;;  $59CC       $5ECA  
;;  $5A78       $59E5  
;;  $5A7B       $5A84  
;;  $5AD0       $5ACE  
;;  $5AD1       $5ACF  
;;  $5AE0       $5ADE  
;;  $5AE1       $5ADF  
;;  $5B0C       $5B0C  
;;  $5B0D       $5B0B  
;;  $5B6B       $5B52  
;;  $5B6C       $5B58   $5B5E  
;;  $5B87       $5B81  
;;  $5B8B       $5B85  
;;  $5B9D       $5B77   $5B7C  
;;  $5BA3       $5B9B  
;;  $5BA7       $5BA1  
;;  $5BB1       $5A0C   $5A11   $5A16   $5A1B  
;;  $5BBC       $5BC1  
;;  $5BEC       $5C0B  
;;  $5BFF       $5BFC  
;;  $5C15       $5C1C  
;;  $5C20       $5BE8  
;;  $5C21       $5A40   $5E6A  
;;  $5CA7       $5C66   $5C71   $5C75  
;;  $5CA8       $5C62  
;;  $5CC3       $5CBB  
;;  $5CC8       $5CBF  
;;  $5CEC       $5CE5  
;;  $5CFA       $5B63   $5B68   $5CA4  
;;  $5D12       $5D0C  
;;  $5D13       $5CFC  
;;  $5D14       $5A38   $5A3D   $5CED   $5D51   $5D85  
;;  $5D25       $5D21  
;;  $5D29       $5D18  
;;  $5D37       $5D32  
;;  $5D57       $5D45  
;;  $5D58       $5D41  
;;  $5D6D       $5D69  
;;  $5D73       $5D79  
;;  $5D7B       $5D75  
;;  $5D83       $5D6F  
;;  $5D84       $5D81  
;;  $5D88       $5D59   $5D61   $5D65  
;;  $5D89       $5CAF   $5CB3   $5CC1   $5CC5  
;;  $5DAC       $5D91   $5D9A   $5DA1  
;;  $5DAD       $56B4   $56E6   $56EF   $5D8B   $5D94  
;;  $5DBA       $5DB3  
;;  $5DBB       $5DB6  
;;  $5DBD       $5A43  
;;  $5DD6       $5DC8   $5DCB  
;;  $5DDB       $5DD6  
;;  $5DDD       $5DD4  
;;  $5DF8       $5DC1  
;;  $5DF9       $5D34   $5DCF  
;;  $5E07       $5E0C  
;;  $5E1D       $5E2A  
;;  $5E27       $5E20  
;;  $5E73       $5E5A   $5E5D  
;;  $5E74       $5E56  
;;  $5E80       $5E83  
;;  $5E88       $5E75  
;;  $5E89       $5E6D   $5E85  
;;  $5E91       $5E40  
;;  $5E92       $5E90   $5EB2  
;;  $5EA2       $5E9E  
;;  $5EA9       $5EA3  
;;  $5EBA       $5E9A  
;;  $5ECE       $5EBE  
;;  $5EE4       $5E60   $5EAD  
;;  $5EF0       $5EED  
;;  $5EF2       $5EF9  
;;  $5EF8       $5EF5  
;;  $5EFC       $58A2  
;;  $5FBA       <entry>
;;  $5FBF       $5F1A  
;;  $5FC0       $5D54   $5EDD  
;; ======================================================================== ;;
