
        ORG     $5000
.HEADER:
        BIDECLE $5B98           ; 5000  Ptr: MOB graphic images
        BIDECLE $503D           ; 5002  Ptr: EXEC timer table
        BIDECLE $505C           ; 5004  Ptr: Start of game
        BIDECLE $5B70           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5051           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $00F0,  $00E0,  $00D0,  $00C0   ; 5014   00F0 00E0 00D0 00C0
        DECLE   $00B0,  $00A0,  $0090,  $0080   ; 5018   00B0 00A0 0090 0080
.TITLE:
        DECLE   $0051                           ; 501C  Cartridge year
        STRING  "ASTROSMASH!"                   ; 501D  Title string
        DECLE   $0000                           ; 5028  

        DECLE   $004A,  $004F,  $0048,  $004E   ; 5029   004A 004F 0048 004E
        DECLE   $0020,  $0050,  $0041,  $0052   ; 502D   0020 0050 0041 0052
        DECLE   $004B,  $0020,  $0053,  $004F   ; 5031   004B 0020 0053 004F
        DECLE   $0048,  $004C,  $0020,  $0031   ; 5035   0048 004C 0020 0031
        DECLE   $0039,  $0038,  $0031,  $0020   ; 5039   0039 0038 0031 0020
.TIMER:
        DECLE   $0045,  $005E,  $0001,  $0000; 503D  Timer dispatch/interval
        DECLE   $00D9,  $005F,  $0001,  $0000; 5041  Timer dispatch/interval
        DECLE   $00B8,  $0051,  $0001,  $0000; 5045  Timer dispatch/interval
        DECLE   $009F,  $0055,  $0006,  $0000; 5049  Timer dispatch/interval
        BIDECLE $0000           ; 504D  End of timer table

        DECLE   $0000,  $0000                   ; 504F   0000 0000
.GRAM_INIT_5051:
        DECLE   $000A           ; 5051  # of GRAM cards to init
        DECLE   $0001,  $0080   ; 5052  #00-01:  CART #00-01 ----
        DECLE   $0201,  $0080   ; 5054  #02-03:  CART #00-01 X---
        DECLE   $0301,  $0080   ; 5056  #04-05:  CART #00-01 XY--
        DECLE   $0005,  $0080   ; 5058  #06-07:  CART #02-03 ----
        DECLE   $000A           ; 505A  #08   :  CART #05    ----
        DECLE   $0008           ; 505B  #09   :  CART #04    ----

.START:
        PSHR    R5                              ; 505C   0275
        MVII    #$0001, R0                      ; 505D   02B8 0001
        MVO     R0,     G_017B                  ; 505F   0240 017B
        MVI     .ISRVEC.0,R0                    ; 5061   0280 0100
        MVO     R0,     G_0162                  ; 5063   0240 0162
        MVI     .ISRVEC.1,R0                    ; 5065   0280 0101
        MVO     R0,     G_0163                  ; 5067   0240 0163
        B       L_50BF                          ; 5069   0200 0054

        MVII    #$0200, R4                      ; 506B   02BC 0200
        MVII    #$00F0, R0                      ; 506D   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 506F   0004 0114 0338

        SDBD                                    ; 5072   0001
        MVII    #$0097, R0                      ; 5073   02B8 0097 0000
        MVO     R0,     G_017F                  ; 5076   0240 017F
        SDBD                                    ; 5078   0001
        MVII    #$0050, R0                      ; 5079   02B8 0050 0000
        MVO     R0,     G_0180                  ; 507C   0240 0180
        MVII    #$017D, R0                      ; 507E   02B8 017D
        MVO     R0,     G_035D                  ; 5080   0240 035D
        MVII    #$0007, R3                      ; 5082   02BB 0007
        MVII    #$022C, R4                      ; 5084   02BC 022C

        JSR     R5,     X_PRINT_R5              ; 5086   0004 0118 007B
        STRING  "Select Game:"                  ; 5089  
        DECLE   $0000                           ; 5095   0000

        PULR    R7                              ; 5096   02B7

        PSHR    R5                              ; 5097   0275
        CMPI    #$000B, R0                      ; 5098   0378 000B
        BNEQ    L_50A0                          ; 509A   020C 0004

        JSR     R5,     L_50BE                  ; 509C   0004 0150 00BE

        PULR    R7                              ; 509F   02B7

L_50A0:
        CMPI    #$0003, R0                      ; 50A0   0378 0003
        BGT     L_50A5                          ; 50A2   020E 0001

        INCR    R0                              ; 50A4   0008
L_50A5:
        ANDI    #$0001, R0                      ; 50A5   03B8 0001
        MVO     R0,     G_015D                  ; 50A7   0240 015D
        MVII    #$0000, R3                      ; 50A9   02BB 0000
        MVII    #$027F, R4                      ; 50AB   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 50AD   0004 0118 007B
        STRING  "Game "                         ; 50B0  
        DECLE   $0000                           ; 50B5   0000

        MVII    #$0011, R0                      ; 50B6   02B8 0011
        ADD     G_015D, R0                      ; 50B8   02C0 015D
        SLL     R0,     2                       ; 50BA   004C
        SLL     R0,     1                       ; 50BB   0048
        MVO@    R0,     R4                      ; 50BC   0260
        PULR    R7                              ; 50BD   02B7

L_50BE:
        PSHR    R5                              ; 50BE   0275
L_50BF:
        MVII    #$0200, R4                      ; 50BF   02BC 0200
        MVII    #$00F0, R0                      ; 50C1   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 50C3   0004 0114 0338

        MVII    #$031D, R4                      ; 50C6   02BC 031D
        MVII    #$0040, R0                      ; 50C8   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 50CA   0004 0114 0338

        MVII    #$031E, R4                      ; 50CD   02BC 031E
        SDBD                                    ; 50CF   0001
        MVII    #$5CF0, R0                      ; 50D0   02B8 00F0 005C
        MVO@    R0,     R4                      ; 50D3   0260
        MVII    #$0053, R0                      ; 50D4   02B8 0053
        SWAP    R0,     1                       ; 50D6   0040
        MVO@    R0,     R4                      ; 50D7   0260
        MVII    #$0056, R0                      ; 50D8   02B8 0056
        SWAP    R0,     1                       ; 50DA   0040
        MVO@    R0,     R4                      ; 50DB   0260
        SDBD                                    ; 50DC   0001
        MVII    #$5D12, R0                      ; 50DD   02B8 0012 005D
        MVO     R0,     G_0326                  ; 50E0   0240 0326
        MVO     R0,     G_032E                  ; 50E2   0240 032E
        MVII    #$000E, R0                      ; 50E4   02B8 000E
        MVO     R0,     G_0115                  ; 50E6   0240 0115
        SDBD                                    ; 50E8   0001
        MVII    #$5049, R1                      ; 50E9   02B9 0049 0050

        JSR     R5,     X_TIMER_STOP            ; 50EC   0004 0118 0038

        CLRR    R0                              ; 50EF   01C0
        MVO     R0,     G_017B                  ; 50F0   0240 017B
        MVII    #$00DC, R0                      ; 50F2   02B8 00DC
        MVO     R0,     G_0161                  ; 50F4   0240 0161
        MVO     R0,     G_0167                  ; 50F6   0240 0167
        CLRR    R0                              ; 50F8   01C0

        JSR     R5,     L_5927                  ; 50F9   0004 0158 0127

        MVI     G_015D, R0                      ; 50FC   0280 015D
        TSTR    R0                              ; 50FE   0080
        BEQ     L_5141                          ; 50FF   0204 0040

        MVO     R0,     G_016A                  ; 5101   0240 016A
        MVII    #$00C8, R0                      ; 5103   02B8 00C8
        MVO     R0,     G_0161                  ; 5105   0240 0161
        MVII    #$0001, R0                      ; 5107   02B8 0001
        MVO     R0,     G_018F                  ; 5109   0240 018F
        SDBD                                    ; 510B   0001
        MVII    #$5D01, R0                      ; 510C   02B8 0001 005D
        MVO     R0,     G_031E                  ; 510F   0240 031E
        MVII    #$0033, R0                      ; 5111   02B8 0033
        SWAP    R0,     1                       ; 5113   0040
        MVO     R0,     G_0320                  ; 5114   0240 0320
        MVII    #$0004, R0                      ; 5116   02B8 0004

        JSR     R5,     L_54BC                  ; 5118   0004 0154 00BC

        SDBD                                    ; 511B   0001
        MVII    #$5D23, R0                      ; 511C   02B8 0023 005D
        MVO     R0,     G_0326                  ; 511F   0240 0326
        MVO     R0,     G_032E                  ; 5121   0240 032E
        MVII    #$00F0, R0                      ; 5123   02B8 00F0
        MVII    #$0001, R1                      ; 5125   02B9 0001
        MVII    #$0004, R2                      ; 5127   02BA 0004
        MVII    #$0200, R4                      ; 5129   02BC 0200

        JSR     R5,     L_5712                  ; 512B   0004 0154 0312

        MVII    #$00EF, R0                      ; 512E   02B8 00EF
        MVO     R0,     G_017F                  ; 5130   0240 017F
        MVII    #$0055, R0                      ; 5132   02B8 0055
        MVO     R0,     G_0180                  ; 5134   0240 0180
        MVII    #$000A, R0                      ; 5136   02B8 000A

        JSR     R5,     L_55EF                  ; 5138   0004 0154 01EF

        SDBD                                    ; 513B   0001
        MVII    #$184F, R0                      ; 513C   02B8 004F 0018
        B       L_518D                          ; 513F   0200 004C

L_5141:
        SDBD                                    ; 5141   0001
        MVII    #$5190, R0                      ; 5142   02B8 0090 0051
        MVO     R0,     G_035D                  ; 5145   0240 035D

        JSR     R5,     L_5DBC                  ; 5147   0004 015C 01BC

        MVII    #$00A0, R0                      ; 514A   02B8 00A0
        MVII    #$0001, R1                      ; 514C   02B9 0001
        MVII    #$0004, R2                      ; 514E   02BA 0004
        MVII    #$0200, R4                      ; 5150   02BC 0200

        JSR     R5,     L_5712                  ; 5152   0004 0154 0312

        SDBD                                    ; 5155   0001
        MVII    #$51A4, R4                      ; 5156   02BC 00A4 0051
        MVII    #$02B4, R5                      ; 5159   02BD 02B4
L_515B:
        MVI@    R4,     R0                      ; 515B   02A0
        SLL     R0,     2                       ; 515C   004C
        SLL     R0,     1                       ; 515D   0048
        XORI    #$0005, R0                      ; 515E   03F8 0005
        MVO@    R0,     R5                      ; 5160   0268
        CMPI    #$02C8, R5                      ; 5161   037D 02C8
        BLT     L_515B                          ; 5163   0225 0009

        SDBD                                    ; 5165   0001
        MVII    #$053D, R0                      ; 5166   02B8 003D 0005
        MVO     R0,     .BTAB.A7                ; 5169   0240 02A7
        MVII    #$02C8, R4                      ; 516B   02BC 02C8
        MVII    #$0014, R0                      ; 516D   02B8 0014
        SDBD                                    ; 516F   0001
        MVII    #$065D, R1                      ; 5170   02B9 005D 0006

        JSR     R5,     X_FILL_MEM              ; 5173   0004 0114 0341

        MVII    #$0058, R0                      ; 5176   02B8 0058
        MVO     R0,     G_0118                  ; 5178   0240 0118
        CLRR    R0                              ; 517A   01C0
        MVO     R0,     G_0119                  ; 517B   0240 0119
        SDBD                                    ; 517D   0001
        MVII    #$503D, R1                      ; 517E   02B9 003D 0050

        JSR     R5,     X_TIMER_STOP            ; 5181   0004 0118 0038

        ADDI    #$0004, R1                      ; 5184   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5186   0004 0118 0038

        SDBD                                    ; 5189   0001
        MVII    #$188F, R0                      ; 518A   02B8 008F 0018
L_518D:
        MVO     R0,     G_031D                  ; 518D   0240 031D
        PULR    R7                              ; 518F   02B7

        SARC    R1,     2                       ; 5190   007D
        RLC     R1,     2                       ; 5191   0055
        ADDR    R5,     R7                      ; 5192   00EF

        RLC     R1,     2                       ; 5193   0055
        MOVR    R6,     R4                      ; 5194   00B4
        RLC     R1,     2                       ; 5195   0055
        MOVR    R6,     R4                      ; 5196   00B4
        RLC     R1,     2                       ; 5197   0055
        MOVR    R6,     R4                      ; 5198   00B4
        RLC     R1,     2                       ; 5199   0055
        MOVR    R7,     R4                      ; 519A   00BC
        RLC     R0,     2                       ; 519B   0054
        ADDR    R5,     R7                      ; 519C   00EF

        RLC     R1,     2                       ; 519D   0055
        RLC     R0,     1                       ; 519E   0050
        RLC     R1,     2                       ; 519F   0055
        ADDR    R5,     R6                      ; 51A0   00EE
        RLC     R0,     2                       ; 51A1   0054
        ADDR    R5,     R6                      ; 51A2   00EE
        RLC     R0,     2                       ; 51A3   0054
        MOVR    R6,     R4                      ; 51A4   00B4
        MOVR    R6,     R5                      ; 51A5   00B5
        MOVR    R5,     R6                      ; 51A6   00AE
        MOVR    R5,     R7                      ; 51A7   00AF

        DECLE   $00B0,  $00B1,  $00B2,  $0000   ; 51A8   00B0 00B1 00B2 0000

        MOVR    R6,     R3                      ; 51AC   00B3
        MOVR    R6,     R1                      ; 51AD   00B1
        MOVR    R6,     R0                      ; 51AE   00B0
        MOVR    R6,     R5                      ; 51AF   00B5
        MOVR    R5,     R6                      ; 51B0   00AE
        MOVR    R5,     R7                      ; 51B1   00AF

        MOVR    R5,     R6                      ; 51B2   00AE
        MOVR    R6,     R0                      ; 51B3   00B0
        MOVR    R6,     R1                      ; 51B4   00B1
        MOVR    R5,     R7                      ; 51B5   00AF

        MOVR    R5,     R6                      ; 51B6   00AE
        MOVR    R5,     R7                      ; 51B7   00AF

L_51B8:
        PSHR    R5                              ; 51B8   0275
        MVI     G_017B, R0                      ; 51B9   0280 017B
        TSTR    R0                              ; 51BB   0080
        BNEQ    L_51CD                          ; 51BC   020C 000F

        JSR     R5,     .EXEC.4F1               ; 51BE   0004 0114 00F1
        JSR     R5,     L_53C6                  ; 51C1   0004 0150 03C6
        JSR     R5,     L_531A                  ; 51C4   0004 0150 031A
        JSR     R5,     L_51CE                  ; 51C7   0004 0150 01CE
        JSR     R5,     L_5DDD                  ; 51CA   0004 015C 01DD

L_51CD:
        PULR    R7                              ; 51CD   02B7

L_51CE:
        PSHR    R5                              ; 51CE   0275
        MVI     G_0175, R0                      ; 51CF   0280 0175
        TSTR    R0                              ; 51D1   0080
        BNEQ    L_52C1                          ; 51D2   020C 00ED

        MVI     G_0167, R1                      ; 51D4   0281 0167
        SDBD                                    ; 51D6   0001
        ADDI    #$5AE7, R1                      ; 51D7   02F9 00E7 005A
        MVI@    R1,     R0                      ; 51DA   0288

        JSR     R5,     X_RAND2                 ; 51DB   0004 0114 029E

        TSTR    R0                              ; 51DE   0080
        BNEQ    L_52C1                          ; 51DF   020C 00E0

        JSR     R5,     L_56DC                  ; 51E1   0004 0154 02DC

        TSTR    R1                              ; 51E4   0089
        BEQ     L_52C1                          ; 51E5   0204 00DA

        MOVR    R1,     R4                      ; 51E7   008C
        CLRR    R3                              ; 51E8   01DB
        SDBD                                    ; 51E9   0001
        MVII    #$5D3B, R1                      ; 51EA   02B9 003B 005D
        MVI     G_015D, R0                      ; 51ED   0280 015D
        TSTR    R0                              ; 51EF   0080
        BNEQ    L_5216                          ; 51F0   020C 0024

        SDBD                                    ; 51F2   0001
        MVII    #$5D34, R1                      ; 51F3   02B9 0034 005D
        MVI     G_0167, R2                      ; 51F6   0282 0167
        SDBD                                    ; 51F8   0001
        ADDI    #$5AFB, R2                      ; 51F9   02FA 00FB 005A
        MVI@    R2,     R0                      ; 51FC   0290

        JSR     R5,     X_RAND2                 ; 51FD   0004 0114 029E

        TSTR    R0                              ; 5200   0080
        BNEQ    L_5216                          ; 5201   020C 0013

        MOVR    R4,     R1                      ; 5203   00A1

        JSR     R5,     .EXEC.766               ; 5204   0004 0114 0366

        INCR    R3                              ; 5207   000B

        JSR     R5,     X_POW2                  ; 5208   0004 0114 0345

        PSHR    R0                              ; 520B   0270
        COMR    R0                              ; 520C   0018
        AND     G_016F, R0                      ; 520D   0380 016F
        XOR@    R6,     R0                      ; 520F   03F0
        MVO     R0,     G_016F                  ; 5210   0240 016F
        SDBD                                    ; 5212   0001
        MVII    #$5D42, R1                      ; 5213   02B9 0042 005D
L_5216:
        INCR    R4                              ; 5216   000C
        MVO@    R1,     R4                      ; 5217   0261
        MVII    #$0088, R0                      ; 5218   02B8 0088

        JSR     R5,     X_RAND2                 ; 521A   0004 0114 029E

        ADDI    #$0010, R0                      ; 521D   02F8 0010
        SWAP    R0,     1                       ; 521F   0040
        MVO@    R0,     R4                      ; 5220   0260
        CLRR    R2                              ; 5221   01D2
        MVO@    R2,     R4                      ; 5222   0262
        MVI     G_0167, R1                      ; 5223   0281 0167
        SDBD                                    ; 5225   0001
        ADDI    #$5AD3, R1                      ; 5226   02F9 00D3 005A
        MVI@    R1,     R0                      ; 5229   0288
        MOVR    R0,     R2                      ; 522A   0082

        JSR     R5,     X_RAND2                 ; 522B   0004 0114 029E

        SLR     R2,     2                       ; 522E   0066
        SLR     R2,     1                       ; 522F   0062
        ADDR    R2,     R0                      ; 5230   00D0
        MVI     G_015D, R2                      ; 5231   0282 015D
        TSTR    R2                              ; 5233   0092
        BNEQ    L_525F                          ; 5234   020C 0029

        TSTR    R3                              ; 5236   009B
        BEQ     L_523A                          ; 5237   0204 0001

        SLR     R0,     1                       ; 5239   0060
L_523A:
        MOVR    R0,     R2                      ; 523A   0082
        MVI     G_0167, R1                      ; 523B   0281 0167
        SLR     R1,     1                       ; 523D   0061
        SDBD                                    ; 523E   0001
        ADDI    #$5B0F, R1                      ; 523F   02F9 000F 005B
        MVI@    R1,     R0                      ; 5242   0288

        JSR     R5,     X_RAND2                 ; 5243   0004 0114 029E

        TSTR    R0                              ; 5246   0080
        BNEQ    L_525C                          ; 5247   020C 0013

        MOVR    R2,     R0                      ; 5249   0090
        SLR     R0,     1                       ; 524A   0060

        JSR     R5,     X_RAND2                 ; 524B   0004 0114 029E

        MOVR    R0,     R1                      ; 524E   0081
        MVII    #$0002, R0                      ; 524F   02B8 0002

        JSR     R5,     X_RAND2                 ; 5251   0004 0114 029E

        TSTR    R0                              ; 5254   0080
        BEQ     L_5258                          ; 5255   0204 0001

        NEGR    R1                              ; 5257   0021
L_5258:
        ANDI    #$00FF, R1                      ; 5258   03B9 00FF
        SWAP    R1,     1                       ; 525A   0041
        XORR    R1,     R2                      ; 525B   01CA
L_525C:
        MVO@    R2,     R4                      ; 525C   0262
        B       L_5265                          ; 525D   0200 0006

L_525F:
        SLR     R0,     1                       ; 525F   0060

        JSR     R5,     L_52D0                  ; 5260   0004 0150 02D0

        CLRR    R3                              ; 5263   01DB
        INCR    R4                              ; 5264   000C
L_5265:
        MVI     G_0164, R0                      ; 5265   0280 0164
        INCR    R0                              ; 5267   0008
        ANDI    #$0003, R0                      ; 5268   03B8 0003
        MVO     R0,     G_0164                  ; 526A   0240 0164
        MVO@    R0,     R4                      ; 526C   0260
        TSTR    R3                              ; 526D   009B
        BEQ     L_5274                          ; 526E   0204 0004

        MVII    #$0200, R0                      ; 5270   02B8 0200
        DECR    R4                              ; 5272   0014
        MVO@    R0,     R4                      ; 5273   0260
L_5274:
        SUBI    #$0006, R4                      ; 5274   033C 0006
        SDBD                                    ; 5276   0001
        MVII    #$7848, R2                      ; 5277   02BA 0048 0078
        MVI     G_015D, R0                      ; 527A   0280 015D
        TSTR    R0                              ; 527C   0080
        BNEQ    L_52A3                          ; 527D   020C 0024

        MVII    #$0001, R0                      ; 527F   02B8 0001

        JSR     R5,     X_RAND1                 ; 5281   0004 0114 027D

        TSTR    R3                              ; 5284   009B
        BNEQ    L_5296                          ; 5285   020C 000F

        TSTR    R0                              ; 5287   0080
        BEQ     L_52A3                          ; 5288   0204 0019

        SDBD                                    ; 528A   0001
        XORI    #$2040, R2                      ; 528B   03FA 0040 0020
        MOVR    R4,     R1                      ; 528E   00A1
        ADDI    #$0005, R1                      ; 528F   02F9 0005
        MVI@    R1,     R0                      ; 5291   0288
        SLL     R0,     1                       ; 5292   0048
        MVO@    R0,     R1                      ; 5293   0248
        B       L_52A3                          ; 5294   0200 000D

L_5296:
        SDBD                                    ; 5296   0001
        MVII    #$588F, R2                      ; 5297   02BA 008F 0058
        TSTR    R0                              ; 529A   0080
        BNEQ    L_52C0                          ; 529B   020C 0023

        SDBD                                    ; 529D   0001
        XORI    #$2180, R2                      ; 529E   03FA 0080 0021
        B       L_52C0                          ; 52A1   0200 001D

L_52A3:
        MVII    #$0002, R0                      ; 52A3   02B8 0002

        JSR     R5,     X_RAND1                 ; 52A5   0004 0114 027D

        SWAP    R0,     1                       ; 52A8   0040
        SLL     R0,     1                       ; 52A9   0048
        XORR    R0,     R2                      ; 52AA   01C2
L_52AB:
        MVI     G_0165, R1                      ; 52AB   0281 0165
        INCR    R1                              ; 52AD   0009
        ANDI    #$0007, R1                      ; 52AE   03B9 0007
        MVO     R1,     G_0165                  ; 52B0   0241 0165
        MOVR    R1,     R0                      ; 52B2   0088

        JSR     R5,     X_POW2                  ; 52B3   0004 0114 0345

        AND     G_0166, R0                      ; 52B6   0380 0166
        BEQ     L_52AB                          ; 52B8   0224 000E

        SDBD                                    ; 52BA   0001
        ADDI    #$52C2, R1                      ; 52BB   02F9 00C2 0052
        MVI@    R1,     R0                      ; 52BE   0288
        XORR    R0,     R2                      ; 52BF   01C2
L_52C0:
        MVO@    R2,     R4                      ; 52C0   0262
L_52C1:
        PULR    R7                              ; 52C1   02B7

        DECLE   $0003,  $0004,  $0005           ; 52C2   0003 0004 0005

        CLRC                                    ; 52C5   0006
        DECR    R2                              ; 52C6   0012
        DECR    R3                              ; 52C7   0013
        DECR    R4                              ; 52C8   0014
        DECR    R5                              ; 52C9   0015
        ADDR    R3,     R5                      ; 52CA   00DD
        ADDR    R3,     R1                      ; 52CB   00D9
        MOVR    R3,     R5                      ; 52CC   009D
        RSWD    R1                              ; 52CD   0039
        ADCR    R6                              ; 52CE   002E
        ADDR    R3,     R5                      ; 52CF   00DD
L_52D0:
        PSHR    R5                              ; 52D0   0275
        PSHR    R0                              ; 52D1   0270
        MVII    #$00A6, R0                      ; 52D2   02B8 00A6

        JSR     R5,     X_RAND2                 ; 52D4   0004 0114 029E

        INCR    R0                              ; 52D7   0008
        MOVR    R0,     R1                      ; 52D8   0081
        MVII    #$0067, R0                      ; 52D9   02B8 0067

        JSR     R5,     X_RAND2                 ; 52DB   0004 0114 029E

        INCR    R0                              ; 52DE   0008
        MOVR    R0,     R2                      ; 52DF   0082
        MVII    #$0002, R0                      ; 52E0   02B8 0002

        JSR     R5,     X_RAND1                 ; 52E2   0004 0114 027D

        SLL     R0,     1                       ; 52E5   0048
        ADDR    R0,     R7                      ; 52E6   00C7
        B       L_52F8                          ; 52E7   0200 000F
        B       L_52F4                          ; 52E9   0200 0009
        B       L_52F1                          ; 52EB   0200 0004

        MVII    #$0068, R2                      ; 52ED   02BA 0068
        B       L_52F9                          ; 52EF   0200 0008

L_52F1:
        CLRR    R2                              ; 52F1   01D2
        B       L_52F9                          ; 52F2   0200 0005

L_52F4:
        MVII    #$00A7, R1                      ; 52F4   02B9 00A7
        B       L_52F9                          ; 52F6   0200 0001

L_52F8:
        CLRR    R1                              ; 52F8   01C9
L_52F9:
        SUBI    #$0002, R4                      ; 52F9   033C 0002
        SWAP    R1,     1                       ; 52FB   0041
        MVO@    R1,     R4                      ; 52FC   0261
        SWAP    R2,     1                       ; 52FD   0042
        MVO@    R2,     R4                      ; 52FE   0262
        PULR    R3                              ; 52FF   02B3
        MVII    #$0028, R0                      ; 5300   02B8 0028

        JSR     R5,     X_RAND2                 ; 5302   0004 0114 029E

        ADDI    #$001F, R0                      ; 5305   02F8 001F
        MOVR    R0,     R1                      ; 5307   0081
        MVII    #$0028, R0                      ; 5308   02B8 0028

        JSR     R5,     X_RAND2                 ; 530A   0004 0114 029E

        ADDI    #$003F, R0                      ; 530D   02F8 003F

        JSR     R5,     X_PACK_BYTES            ; 530F   0004 0114 034F

        MOVR    R0,     R2                      ; 5312   0082
        MOVR    R4,     R1                      ; 5313   00A1
        SUBI    #$0004, R1                      ; 5314   0339 0004

        JSR     R5,     .EXEC.9A3               ; 5316   0004 0118 01A3

        PULR    R7                              ; 5319   02B7

L_531A:
        PSHR    R5                              ; 531A   0275
        MVI     G_015D, R0                      ; 531B   0280 015D
        TSTR    R0                              ; 531D   0080
        BNEQ    L_53C5                          ; 531E   020C 00A5

        MVI     G_017C, R0                      ; 5320   0280 017C
        TSTR    R0                              ; 5322   0080
        BNEQ    L_53C5                          ; 5323   020C 00A0

        MVII    #$0172, R5                      ; 5325   02BD 0172
        SDBD                                    ; 5327   0001
        MVI@    R5,     R0                      ; 5328   02A8
        TSTR    R0                              ; 5329   0080
        BEQ     L_5332                          ; 532A   0204 0006

        DECR    R0                              ; 532C   0010
        MVO     R0,     G_0172                  ; 532D   0240 0172
        SWAP    R0,     1                       ; 532F   0040
        MVO     R0,     G_0173                  ; 5330   0240 0173
L_5332:
        MVI     G_0170, R0                      ; 5332   0280 0170
        TSTR    R0                              ; 5334   0080
        BNEQ    L_5393                          ; 5335   020C 005C

        JSR     R5,     L_56DC                  ; 5337   0004 0154 02DC

        MOVR    R1,     R4                      ; 533A   008C
        BEQ     L_53C5                          ; 533B   0204 0088

        MVII    #$0172, R5                      ; 533D   02BD 0172
        SDBD                                    ; 533F   0001
        MVI@    R5,     R0                      ; 5340   02A8
        TSTR    R0                              ; 5341   0080
        BNEQ    L_53C5                          ; 5342   020C 0081

        MVI     G_034C, R0                      ; 5344   0280 034C
        CMPI    #$0008, R0                      ; 5346   0378 0008
        BGT     L_5358                          ; 5348   020E 000E

        MVI     G_0167, R1                      ; 534A   0281 0167
        SDBD                                    ; 534C   0001
        ADDI    #$5B19, R1                      ; 534D   02F9 0019 005B
        MVI@    R1,     R0                      ; 5350   0288
        SLL     R0,     1                       ; 5351   0048

        JSR     R5,     X_RAND2                 ; 5352   0004 0114 029E

        TSTR    R0                              ; 5355   0080
        BNEQ    L_53C5                          ; 5356   020C 006D

L_5358:
        MVI     G_0167, R1                      ; 5358   0281 0167
        SDBD                                    ; 535A   0001
        ADDI    #$5B2D, R1                      ; 535B   02F9 002D 005B
        MVI@    R1,     R0                      ; 535E   0288
        MVO     R0,     G_0172                  ; 535F   0240 0172
        SWAP    R0,     1                       ; 5361   0040
        MVO     R0,     G_0173                  ; 5362   0240 0173
        CLRR    R0                              ; 5364   01C0
        MVO     R0,     G_0174                  ; 5365   0240 0174
        MOVR    R4,     R1                      ; 5367   00A1

        JSR     R5,     .EXEC.766               ; 5368   0004 0114 0366

        MVO     R0,     G_0170                  ; 536B   0240 0170
        INCR    R4                              ; 536D   000C
        SDBD                                    ; 536E   0001
        MVII    #$5D49, R1                      ; 536F   02B9 0049 005D
        MVO@    R1,     R4                      ; 5372   0261
        MVII    #$0088, R0                      ; 5373   02B8 0088

        JSR     R5,     X_RAND2                 ; 5375   0004 0114 029E

        ADDI    #$0010, R0                      ; 5378   02F8 0010
        SWAP    R0,     1                       ; 537A   0040
        MVO@    R0,     R4                      ; 537B   0260
        CLRR    R1                              ; 537C   01C9
        MVO@    R1,     R4                      ; 537D   0261
        INCR    R4                              ; 537E   000C
        MVII    #$0200, R1                      ; 537F   02B9 0200
        MVO@    R1,     R4                      ; 5381   0261
        SUBI    #$0006, R4                      ; 5382   033C 0006
        SDBD                                    ; 5384   0001
        MVII    #$188F, R1                      ; 5385   02B9 008F 0018
        MVO@    R1,     R4                      ; 5388   0261
        MVI     G_0167, R2                      ; 5389   0282 0167
        SDBD                                    ; 538B   0001
        ADDI    #$5AD3, R2                      ; 538C   02FA 00D3 005A
        MVI@    R2,     R3                      ; 538F   0293
        SLR     R3,     1                       ; 5390   0063
        MVO     R3,     G_0171                  ; 5391   0243 0171
L_5393:
        MVI     G_0174, R0                      ; 5393   0280 0174
        TSTR    R0                              ; 5395   0080
        BEQ     L_539C                          ; 5396   0204 0004

        DECR    R0                              ; 5398   0010
        MVO     R0,     G_0174                  ; 5399   0240 0174
        PULR    R7                              ; 539B   02B7

L_539C:
        MVI     G_0167, R1                      ; 539C   0281 0167
        SLR     R1,     1                       ; 539E   0061
        SDBD                                    ; 539F   0001
        ADDI    #$5B3F, R1                      ; 53A0   02F9 003F 005B
        MVI@    R1,     R0                      ; 53A3   0288
        MVO     R0,     G_0174                  ; 53A4   0240 0174
        MVI     .PSG0.chn_c_vol,R0              ; 53A6   0280 01FD
        ANDI    #$000F, R0                      ; 53A8   03B8 000F
        BEQ     L_53B0                          ; 53AA   0204 0004

        CLRR    R0                              ; 53AC   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 53AD   0240 01FD
        PULR    R7                              ; 53AF   02B7

L_53B0:
        MVII    #$000E, R0                      ; 53B0   02B8 000E
        MVO     R0,     .PSG0.chn_c_vol         ; 53B2   0240 01FD
        MVI     G_031F, R0                      ; 53B4   0280 031F
        SWAP    R0,     1                       ; 53B6   0040
        MVI     G_0320, R1                      ; 53B7   0281 0320
        SWAP    R1,     1                       ; 53B9   0041

        JSR     R5,     X_PACK_BYTES            ; 53BA   0004 0114 034F

        MOVR    R0,     R2                      ; 53BD   0082
        MVI     G_0171, R3                      ; 53BE   0283 0171
        MVI     G_0170, R0                      ; 53C0   0280 0170

        JSR     R5,     .EXEC.9BB               ; 53C2   0004 0118 01BB

L_53C5:
        PULR    R7                              ; 53C5   02B7

L_53C6:
        PSHR    R5                              ; 53C6   0275
        MVI     G_015D, R3                      ; 53C7   0283 015D
        TSTR    R3                              ; 53C9   009B
        BNEQ    L_53D2                          ; 53CA   020C 0006

        MVI     G_032C, R0                      ; 53CC   0280 032C
        CMPI    #$0014, R0                      ; 53CE   0378 0014
        BLT     L_54B0                          ; 53D0   0205 00DE

L_53D2:
        MVI     G_0175, R0                      ; 53D2   0280 0175
        TSTR    R0                              ; 53D4   0080
        BNEQ    L_5442                          ; 53D5   020C 006B

        SDBD                                    ; 53D7   0001
        MVII    #$5B19, R1                      ; 53D8   02B9 0019 005B
        ADD     G_0167, R1                      ; 53DB   02C1 0167
        MVI@    R1,     R0                      ; 53DD   0288
        TSTR    R3                              ; 53DE   009B
        BEQ     L_53E3                          ; 53DF   0204 0002

        SLR     R0,     2                       ; 53E1   0064
        SLR     R0,     1                       ; 53E2   0060

L_53E3:
        JSR     R5,     X_RAND2                 ; 53E3   0004 0114 029E

        TSTR    R0                              ; 53E6   0080
        BNEQ    L_54B0                          ; 53E7   020C 00C7

        JSR     R5,     L_56DC                  ; 53E9   0004 0154 02DC

        TSTR    R1                              ; 53EC   0089
        BEQ     L_54B0                          ; 53ED   0204 00C1

        JSR     R5,     .EXEC.766               ; 53EF   0004 0114 0366

        MVO     R0,     G_0175                  ; 53F2   0240 0175
        INCR    R1                              ; 53F4   0009
        SDBD                                    ; 53F5   0001
        MVII    #$5D6B, R0                      ; 53F6   02B8 006B 005D
        MVO@    R0,     R1                      ; 53F9   0248
        INCR    R1                              ; 53FA   0009
        CLRR    R3                              ; 53FB   01DB
        MVII    #$0001, R0                      ; 53FC   02B8 0001

        JSR     R5,     X_RAND1                 ; 53FE   0004 0114 027D

        TSTR    R0                              ; 5401   0080
        BEQ     L_5407                          ; 5402   0204 0003

        MVII    #$00A7, R3                      ; 5404   02BB 00A7
        SWAP    R3,     1                       ; 5406   0043
L_5407:
        MVO@    R3,     R1                      ; 5407   024B
        INCR    R1                              ; 5408   0009
        MVII    #$001A, R0                      ; 5409   02B8 001A

        JSR     R5,     X_RAND2                 ; 540B   0004 0114 029E

        ADDI    #$000A, R0                      ; 540E   02F8 000A
        SWAP    R0,     1                       ; 5410   0040
        MVO@    R0,     R1                      ; 5411   0248
        INCR    R1                              ; 5412   0009
        SDBD                                    ; 5413   0001
        MVII    #$5ABA, R2                      ; 5414   02BA 00BA 005A
        ADD     G_0167, R2                      ; 5417   02C2 0167
        MVI@    R2,     R0                      ; 5419   0290
        SLR     R0,     2                       ; 541A   0064
        MVO     R0,     G_0177                  ; 541B   0240 0177
        TSTR    R3                              ; 541D   009B
        BEQ     L_5421                          ; 541E   0204 0001

        NEGR    R0                              ; 5420   0020
L_5421:
        ANDI    #$00FF, R0                      ; 5421   03B8 00FF
        SWAP    R0,     1                       ; 5423   0040
        MVO@    R0,     R1                      ; 5424   0248
        MVI     G_015D, R2                      ; 5425   0282 015D
        TSTR    R2                              ; 5427   0092
        BEQ     L_5432                          ; 5428   0204 0008

        MVI     G_0177, R0                      ; 542A   0280 0177
        MOVR    R1,     R4                      ; 542C   008C

        JSR     R5,     L_52D0                  ; 542D   0004 0150 02D0

        ADDI    #$0004, R1                      ; 5430   02F9 0004
L_5432:
        INCR    R1                              ; 5432   0009
        MVII    #$0100, R0                      ; 5433   02B8 0100
        MVO@    R0,     R1                      ; 5435   0248
        SUBI    #$0005, R1                      ; 5436   0339 0005
        SDBD                                    ; 5438   0001
        MVII    #$788F, R0                      ; 5439   02B8 008F 0078
        MVO@    R0,     R1                      ; 543C   0248
        MVII    #$0005, R0                      ; 543D   02B8 0005
        MVO     R0,     G_0176                  ; 543F   0240 0176
        PULR    R7                              ; 5441   02B7

L_5442:
        MVI     G_017C, R0                      ; 5442   0280 017C
        TSTR    R0                              ; 5444   0080
        BNEQ    L_54B0                          ; 5445   020C 0069

        MVI     G_0175, R0                      ; 5447   0280 0175

        JSR     R5,     .EXEC.76C               ; 5449   0004 0114 036C

        MVI@    R1,     R0                      ; 544C   0288
        ANDI    #$0007, R0                      ; 544D   03B8 0007
        CMPI    #$0002, R0                      ; 544F   0378 0002
        BEQ     L_54B0                          ; 5451   0204 005D

        SDBD                                    ; 5453   0001
        MVII    #$5030, R2                      ; 5454   02BA 0030 0050
        SDBD                                    ; 5457   0001
        MVII    #$4828, R4                      ; 5458   02BC 0028 0048

        JSR     R5,     .EXEC.6F7               ; 545B   0004 0114 02F7

        BNC     L_54B0                          ; 545E   0209 0050

        MOVR    R1,     R3                      ; 5460   008B
        MVI     G_0176, R0                      ; 5461   0280 0176
        TSTR    R0                              ; 5463   0080
        BEQ     L_546A                          ; 5464   0204 0004

        DECR    R0                              ; 5466   0010
        MVO     R0,     G_0176                  ; 5467   0240 0176
        PULR    R7                              ; 5469   02B7

L_546A:
        JSR     R5,     L_56DC                  ; 546A   0004 0154 02DC

        MOVR    R1,     R4                      ; 546D   008C
        BEQ     L_54B0                          ; 546E   0204 0040

        MVII    #$0014, R0                      ; 5470   02B8 0014
        SUB     G_0177, R0                      ; 5472   0300 0177
        MVO     R0,     G_0176                  ; 5474   0240 0176
        INCR    R4                              ; 5476   000C
        SDBD                                    ; 5477   0001
        MVII    #$5D72, R0                      ; 5478   02B8 0072 005D
        MVO@    R0,     R4                      ; 547B   0260
        MOVR    R3,     R1                      ; 547C   0099
        ADDI    #$0002, R1                      ; 547D   02F9 0002
        MVI@    R1,     R0                      ; 547F   0288
        MVO@    R0,     R4                      ; 5480   0260
        INCR    R1                              ; 5481   0009
        MVI@    R1,     R0                      ; 5482   0288
        MVO@    R0,     R4                      ; 5483   0260
        INCR    R4                              ; 5484   000C
        MVII    #$0200, R0                      ; 5485   02B8 0200
        MVO@    R0,     R4                      ; 5487   0260
        MVII    #$0004, R0                      ; 5488   02B8 0004
        MVO@    R0,     R4                      ; 548A   0260
        MVII    #$000F, R0                      ; 548B   02B8 000F
        MVO     R0,     .PSG0.chn_b_vol         ; 548D   0240 01FC
        MVI     G_031F, R0                      ; 548F   0280 031F
        SWAP    R0,     1                       ; 5491   0040
        MVI     G_0320, R1                      ; 5492   0281 0320
        SWAP    R1,     1                       ; 5494   0041

        JSR     R5,     X_PACK_BYTES            ; 5495   0004 0114 034F

        MOVR    R0,     R2                      ; 5498   0082
        MVI     G_0167, R1                      ; 5499   0281 0167
        SLR     R1,     2                       ; 549B   0065
        SDBD                                    ; 549C   0001
        ADDI    #$5ACE, R1                      ; 549D   02F9 00CE 005A
        MVI@    R1,     R3                      ; 54A0   028B
        SLR     R3,     2                       ; 54A1   0067
        SUBI    #$0007, R4                      ; 54A2   033C 0007
        MOVR    R4,     R1                      ; 54A4   00A1

        JSR     R5,     .EXEC.766               ; 54A5   0004 0114 0366
        JSR     R5,     .EXEC.9BB               ; 54A8   0004 0118 01BB

        SDBD                                    ; 54AB   0001
        MVII    #$588F, R0                      ; 54AC   02B8 008F 0058
        MVO@    R0,     R4                      ; 54AF   0260
L_54B0:
        PULR    R7                              ; 54B0   02B7

        MVI     .PSG0.chn_b_vol,R2              ; 54B1   0282 01FC
        ANDI    #$0030, R2                      ; 54B3   03BA 0030
        BNEQ    L_54BB                          ; 54B5   020C 0004

        MVII    #$000C, R2                      ; 54B7   02BA 000C
        MVO     R2,     .PSG0.chn_b_vol         ; 54B9   0242 01FC
L_54BB:
        MOVR    R5,     R7                      ; 54BB   00AF

L_54BC:
        PSHR    R5                              ; 54BC   0275
        TSTR    R0                              ; 54BD   0080
        BMI     L_54DD                          ; 54BE   020B 001D

        MVO     R0,     G_0169                  ; 54C0   0240 0169
        MOVR    R0,     R1                      ; 54C2   0081
        SDBD                                    ; 54C3   0001
        ADDI    #$54DE, R1                      ; 54C4   02F9 00DE 0054
        MVI@    R1,     R0                      ; 54C7   0288
        MOVR    R0,     R2                      ; 54C8   0082
        ANDI    #$000F, R2                      ; 54C9   03BA 000F
        MVO     R2,     G_0322                  ; 54CB   0242 0322
        ANDI    #$0300, R0                      ; 54CD   03B8 0300
        SLL     R0,     1                       ; 54CF   0048
        MVII    #$031D, R1                      ; 54D0   02B9 031D
        MVI@    R1,     R2                      ; 54D2   028A
        SDBD                                    ; 54D3   0001
        ANDI    #$F9FF, R2                      ; 54D4   03BA 00FF 00F9
        XORR    R0,     R2                      ; 54D7   01C2
        MVO@    R2,     R1                      ; 54D8   024A
        CLRR    R0                              ; 54D9   01C0

        JSR     R5,     .EXEC.41C               ; 54DA   0004 0114 001C

L_54DD:
        PULR    R7                              ; 54DD   02B7

        DECLE   $0104,  $0103,  $0102,  $0101   ; 54DE   0104 0103 0102 0101
        DECLE   $0000,  $0001                   ; 54E2   0000 0001

        EIS                                     ; 54E4   0002
        DIS                                     ; 54E5   0003
        BEQ     L_56EB                          ; 54E6   0204 0203
        BOV     L_56EB                          ; 54E8   0202 0201

        SUB     G_0301, R0                      ; 54EA   0300 0301
        SUB     G_0303, R2                      ; 54EC   0302 0303
L_54EE:
        PSHR    R5                              ; 54EE   0275
        CLRR    R2                              ; 54EF   01D2
        MVO     R2,     .PSG0.chn_c_vol         ; 54F0   0242 01FD
        INCR    R0                              ; 54F2   0008
        BEQ     L_5517                          ; 54F3   0204 0022

        MVII    #$000A, R2                      ; 54F5   02BA 000A
        MVO     R2,     .PSG0.chn_c_vol         ; 54F7   0242 01FD
        MVII    #$0015, R2                      ; 54F9   02BA 0015
        MVO     R2,     .PSG0.chan_enable       ; 54FB   0242 01F8
        SDBD                                    ; 54FD   0001
        MVII    #$5ABA, R1                      ; 54FE   02B9 00BA 005A
        ADD     G_0167, R1                      ; 5501   02C1 0167
        MVI@    R1,     R0                      ; 5503   0288

        JSR     R5,     X_CLAMP                 ; 5504   0004 0114 0270
        DECLE   $0000                           ; 5507   0000

        RSWD    R4                              ; 5508   003C
        MVI     G_0169, R1                      ; 5509   0281 0169
        ADDI    #$0008, R1                      ; 550B   02F9 0008
        ANDI    #$000F, R1                      ; 550D   03B9 000F

        JSR     R5,     .EXEC.629               ; 550F   0004 0114 0229

        MVI     G_016A, R2                      ; 5512   0282 016A
        TSTR    R2                              ; 5514   0092
        BEQ     L_5527                          ; 5515   0204 0010

L_5517:
        PSHR    R0                              ; 5517   0270
        MVII    #$0187, R3                      ; 5518   02BB 0187
        MVII    #$016B, R4                      ; 551A   02BC 016B

        JSR     R5,     L_552F                  ; 551C   0004 0154 012F

        PULR    R0                              ; 551F   02B0
        SWAP    R0,     1                       ; 5520   0040
        MVII    #$018A, R3                      ; 5521   02BB 018A

        JSR     R5,     L_552F                  ; 5523   0004 0154 012F

        PULR    R7                              ; 5526   02B7

L_5527:
        JSR     R5,     X_UNPK_BYTES            ; 5527   0004 0114 0357

        MVO     R1,     G_018A                  ; 552A   0241 018A
        MVO     R0,     G_0187                  ; 552C   0240 0187
        PULR    R7                              ; 552E   02B7

L_552F:
        PSHR    R5                              ; 552F   0275
        SDBD                                    ; 5530   0001
        ANDI    #$FF00, R0                      ; 5531   03B8 0000 00FF
        SAR     R0,     2                       ; 5534   006C
        SAR     R0,     2                       ; 5535   006C
        SAR     R0,     2                       ; 5536   006C
        SDBD                                    ; 5537   0001
        ADD@    R4,     R0                      ; 5538   02E0
        MOVR    R0,     R1                      ; 5539   0081
        BPL     L_553D                          ; 553A   0203 0001

        NEGR    R1                              ; 553C   0021
L_553D:
        SDBD                                    ; 553D   0001
        MVII    #$7800, R2                      ; 553E   02BA 0000 0078
        CMPR    R1,     R2                      ; 5541   014A
        BGT     L_5549                          ; 5542   020E 0005

        TSTR    R0                              ; 5544   0080
        BPL     L_5548                          ; 5545   0203 0001

        NEGR    R2                              ; 5547   0022
L_5548:
        MOVR    R2,     R0                      ; 5548   0090
L_5549:
        SUBI    #$0002, R4                      ; 5549   033C 0002
        MVO@    R0,     R4                      ; 554B   0260
        SWAP    R0,     1                       ; 554C   0040
        MVO@    R0,     R4                      ; 554D   0260
        MVO@    R0,     R3                      ; 554E   0258
        PULR    R7                              ; 554F   02B7

L_5550:
        PSHR    R5                              ; 5550   0275
        CMPI    #$0001, R0                      ; 5551   0378 0001
        BNEQ    L_557C                          ; 5553   020C 0027

        JSR     R5,     L_55DE                  ; 5555   0004 0154 01DE

        TSTR    R1                              ; 5558   0089
        BEQ     L_557C                          ; 5559   0204 0021

        MOVR    R1,     R3                      ; 555B   008B
        MOVR    R1,     R4                      ; 555C   008C
        ADDI    #$0002, R4                      ; 555D   02FC 0002
        MVI     G_031F, R0                      ; 555F   0280 031F
        MVO@    R0,     R4                      ; 5561   0260
        MVI     G_0320, R0                      ; 5562   0280 0320
        MVO@    R0,     R4                      ; 5564   0260
        MVI     G_0167, R1                      ; 5565   0281 0167
        SLR     R1,     2                       ; 5567   0065
        SDBD                                    ; 5568   0001
        ADDI    #$5ACE, R1                      ; 5569   02F9 00CE 005A
        MVI@    R1,     R0                      ; 556C   0288
        SLR     R0,     1                       ; 556D   0060
        MVI     G_0169, R1                      ; 556E   0281 0169

        JSR     R5,     .EXEC.629               ; 5570   0004 0114 0229

        MVO@    R0,     R4                      ; 5573   0260
        MVII    #$0200, R0                      ; 5574   02B8 0200
        MVO@    R0,     R4                      ; 5576   0260
        SDBD                                    ; 5577   0001
        MVII    #$188F, R0                      ; 5578   02B8 008F 0018
        MVO@    R0,     R3                      ; 557B   0258
L_557C:
        PULR    R7                              ; 557C   02B7

        PSHR    R5                              ; 557D   0275
        TSTR    R0                              ; 557E   0080
        BMI     L_559B                          ; 557F   020B 001A

        MVI     G_0167, R2                      ; 5581   0282 0167
        SDBD                                    ; 5583   0001
        ADDI    #$5ABA, R2                      ; 5584   02FA 00BA 005A
        MVI@    R2,     R1                      ; 5587   0291
        ADDI    #$000C, R0                      ; 5588   02F8 000C
        ANDI    #$000F, R0                      ; 558A   03B8 000F
        BEQ     L_559B                          ; 558C   0204 000D

        SUBI    #$0008, R0                      ; 558E   0338 0008
        BEQ     L_559B                          ; 5590   0204 0009
        BPL     L_5595                          ; 5592   0203 0001

        NEGR    R1                              ; 5594   0021
L_5595:
        ANDI    #$00FF, R1                      ; 5595   03B9 00FF
        SWAP    R1,     1                       ; 5597   0041
        MVO     R1,     G_0321                  ; 5598   0241 0321
        PULR    R7                              ; 559A   02B7

L_559B:
        CLRR    R0                              ; 559B   01C0
        MVO     R0,     G_0321                  ; 559C   0240 0321
        PULR    R7                              ; 559E   02B7

L_559F:
        PSHR    R5                              ; 559F   0275
        MVI     G_017B, R2                      ; 55A0   0282 017B
        TSTR    R2                              ; 55A2   0092
        BNEQ    L_55B3                          ; 55A3   020C 000E

        MVII    #$0001, R0                      ; 55A5   02B8 0001
        MVI     G_015D, R2                      ; 55A7   0282 015D
        TSTR    R2                              ; 55A9   0092
        BEQ     L_55B0                          ; 55AA   0204 0004

        JSR     R5,     L_5550                  ; 55AC   0004 0154 0150

        PULR    R7                              ; 55AF   02B7

L_55B0:
        JSR     R5,     L_55B4                  ; 55B0   0004 0154 01B4

L_55B3:
        PULR    R7                              ; 55B3   02B7

L_55B4:
        PSHR    R5                              ; 55B4   0275
        CMPI    #$0001, R0                      ; 55B5   0378 0001
        BLT     L_55DD                          ; 55B7   0205 0024

        JSR     R5,     L_55DE                  ; 55B9   0004 0154 01DE

        TSTR    R1                              ; 55BC   0089
        BEQ     L_55DD                          ; 55BD   0204 001E

        MOVR    R1,     R3                      ; 55BF   008B
        MOVR    R1,     R4                      ; 55C0   008C
        ADDI    #$0002, R4                      ; 55C1   02FC 0002
        MVI     G_031F, R2                      ; 55C3   0282 031F
        MVO@    R2,     R4                      ; 55C5   0262
        MVII    #$0056, R2                      ; 55C6   02BA 0056
        SWAP    R2,     1                       ; 55C8   0042
        MVO@    R2,     R4                      ; 55C9   0262
        MVI     G_0167, R1                      ; 55CA   0281 0167
        SLR     R1,     2                       ; 55CC   0065
        MOVR    R1,     R0                      ; 55CD   0088
        SDBD                                    ; 55CE   0001
        ADDI    #$5ACE, R1                      ; 55CF   02F9 00CE 005A
        MVI@    R1,     R2                      ; 55D2   028A
        NEGR    R2                              ; 55D3   0022
        ANDI    #$00FF, R2                      ; 55D4   03BA 00FF
        MVO@    R2,     R4                      ; 55D6   0262
        MVO@    R0,     R4                      ; 55D7   0260
        SDBD                                    ; 55D8   0001
        MVII    #$190F, R2                      ; 55D9   02BA 000F 0019
        MVO@    R2,     R3                      ; 55DC   025A
L_55DD:
        PULR    R7                              ; 55DD   02B7

L_55DE:
        PSHR    R5                              ; 55DE   0275
        MVII    #$0325, R1                      ; 55DF   02B9 0325
        MVI@    R1,     R0                      ; 55E1   0288
        ANDI    #$0008, R0                      ; 55E2   03B8 0008
        BEQ     L_55EE                          ; 55E4   0204 0008

        MVII    #$032D, R1                      ; 55E6   02B9 032D
        MVI@    R1,     R0                      ; 55E8   0288
        ANDI    #$0008, R0                      ; 55E9   03B8 0008
        BEQ     L_55EE                          ; 55EB   0204 0001

        CLRR    R1                              ; 55ED   01C9
L_55EE:
        PULR    R7                              ; 55EE   02B7

L_55EF:
        PSHR    R5                              ; 55EF   0275
        CLRR    R2                              ; 55F0   01D2
        CMPI    #$0001, R0                      ; 55F1   0378 0001
        BNEQ    L_55FF                          ; 55F3   020C 000A

        MVO     R0,     G_015E                  ; 55F5   0240 015E
        SDBD                                    ; 55F7   0001
        MVII    #$5049, R1                      ; 55F8   02B9 0049 0050

        JSR     R5,     X_TIMER_START           ; 55FB   0004 0118 0044

        PULR    R7                              ; 55FE   02B7

L_55FF:
        CMPI    #$0002, R0                      ; 55FF   0378 0002
        BNEQ    L_560D                          ; 5601   020C 000A

        MVO     R2,     G_015E                  ; 5603   0242 015E
        SDBD                                    ; 5605   0001
        MVII    #$5049, R1                      ; 5606   02B9 0049 0050

        JSR     R5,     X_TIMER_STOP            ; 5609   0004 0118 0038

        PULR    R7                              ; 560C   02B7

L_560D:
        CMPI    #$0003, R0                      ; 560D   0378 0003
        BNEQ    L_562E                          ; 560F   020C 001D

        JSR     R5,     L_5DA5                  ; 5611   0004 015C 01A5

        MVII    #$0089, R0                      ; 5614   02B8 0089

        JSR     R5,     X_RAND2                 ; 5616   0004 0114 029E

        ADDI    #$0010, R0                      ; 5619   02F8 0010
        SWAP    R0,     1                       ; 561B   0040
        MVO     R0,     G_031F                  ; 561C   0240 031F
        MVI     G_015D, R0                      ; 561E   0280 015D
        TSTR    R0                              ; 5620   0080
        BEQ     L_5661                          ; 5621   0204 003E

        MVII    #$0049, R0                      ; 5623   02B8 0049

        JSR     R5,     X_RAND2                 ; 5625   0004 0114 029E

        ADDI    #$0010, R0                      ; 5628   02F8 0010
        SWAP    R0,     1                       ; 562A   0040
        MVO     R0,     G_0320                  ; 562B   0240 0320
        PULR    R7                              ; 562D   02B7

L_562E:
        CMPI    #$0004, R0                      ; 562E   0378 0004
        BNEQ    L_5635                          ; 5630   020C 0003

        MVO     R0,     G_016A                  ; 5632   0240 016A
        PULR    R7                              ; 5634   02B7

L_5635:
        CMPI    #$0005, R0                      ; 5635   0378 0005
        BNEQ    L_5642                          ; 5637   020C 0009

        MVO     R2,     G_016A                  ; 5639   0242 016A
        MVII    #$016B, R4                      ; 563B   02BC 016B
        MVO@    R2,     R4                      ; 563D   0262
        MVO@    R2,     R4                      ; 563E   0262
        MVO@    R2,     R4                      ; 563F   0262
        MVO@    R2,     R4                      ; 5640   0262
        PULR    R7                              ; 5641   02B7

L_5642:
        CMPI    #$000A, R0                      ; 5642   0378 000A
        BNEQ    L_5661                          ; 5644   020C 001B

        MVI     G_015D, R0                      ; 5646   0280 015D
        TSTR    R0                              ; 5648   0080
        BEQ     L_5661                          ; 5649   0204 0016

        MVO     R0,     G_017B                  ; 564B   0240 017B

        JSR     R5,     L_56EE                  ; 564D   0004 0154 02EE

        MVII    #$017D, R1                      ; 5650   02B9 017D
        MVO     R1,     G_035D                  ; 5652   0241 035D
        MVII    #$01FB, R4                      ; 5654   02BC 01FB
        MVO@    R2,     R4                      ; 5656   0262
        MVO@    R2,     R4                      ; 5657   0262
        MVO@    R2,     R4                      ; 5658   0262
        MVII    #$0014, R1                      ; 5659   02B9 0014
        MVO     R1,     G_0323                  ; 565B   0241 0323
        CLRR    R0                              ; 565D   01C0

        JSR     R5,     L_5927                  ; 565E   0004 0158 0127

L_5661:
        PULR    R7                              ; 5661   02B7

L_5662:
        PSHR    R5                              ; 5662   0275
        PSHR    R1                              ; 5663   0271
        PSHR    R3                              ; 5664   0273
        MOVR    R0,     R3                      ; 5665   0083

        JSR     R5,     .EXEC.76C               ; 5666   0004 0114 036C

        MVI@    R1,     R0                      ; 5669   0288
        ANDI    #$0008, R0                      ; 566A   03B8 0008
        MVI@    R1,     R0                      ; 566C   0288
        BEQ     L_5692                          ; 566D   0204 0023

        SDBD                                    ; 566F   0001
        ANDI    #$E7F7, R0                      ; 5670   03B8 00F7 00E7
        MVO@    R0,     R1                      ; 5673   0248
        MOVR    R3,     R0                      ; 5674   0098
        XOR     G_0170, R0                      ; 5675   03C0 0170
        BNEQ    L_567D                          ; 5677   020C 0004

        MVO     R0,     G_0170                  ; 5679   0240 0170
        MVO     R0,     .PSG0.chn_c_vol         ; 567B   0240 01FD
L_567D:
        MOVR    R3,     R0                      ; 567D   0098
        XOR     G_0175, R0                      ; 567E   03C0 0175
        BNEQ    L_5684                          ; 5680   020C 0002

        MVO     R0,     G_0175                  ; 5682   0240 0175
L_5684:
        MOVR    R3,     R0                      ; 5684   0098

        JSR     R5,     X_POW2                  ; 5685   0004 0114 0345

        COMR    R0                              ; 5688   0018
        AND     G_016F, R0                      ; 5689   0380 016F
        MVO     R0,     G_016F                  ; 568B   0240 016F
        MVI@    R1,     R0                      ; 568D   0288
        ADDI    #$0005, R1                      ; 568E   02F9 0005
        CLRR    R3                              ; 5690   01DB
        MVO@    R3,     R1                      ; 5691   024B
L_5692:
        PULR    R3                              ; 5692   02B3
        PULR    R1                              ; 5693   02B1
        PULR    R7                              ; 5694   02B7

L_5695:
        PSHR    R5                              ; 5695   0275
        MVI     G_015D, R2                      ; 5696   0282 015D
        TSTR    R2                              ; 5698   0092
        BNEQ    L_56BC                          ; 5699   020C 0021

        MVI@    R1,     R2                      ; 569B   028A

        JSR     R5,     L_5662                  ; 569C   0004 0154 0262

        INCR    R1                              ; 569F   0009
        MVI@    R1,     R0                      ; 56A0   0288
        SDBD                                    ; 56A1   0001
        CMPI    #$5D42, R0                      ; 56A2   0378 0042 005D
        BNEQ    L_56AB                          ; 56A5   020C 0004

        JSR     R5,     L_584B                  ; 56A7   0004 0158 004B

        PULR    R7                              ; 56AA   02B7

L_56AB:
        SDBD                                    ; 56AB   0001
        CMPI    #$5D34, R0                      ; 56AC   0378 0034 005D
        BNEQ    L_56BC                          ; 56AF   020C 000B

        MVII    #$0005, R0                      ; 56B1   02B8 0005
        ANDI    #$0040, R2                      ; 56B3   03BA 0040
        BNEQ    L_56B8                          ; 56B5   020C 0001

        SLL     R0,     1                       ; 56B7   0048
L_56B8:
        NEGR    R0                              ; 56B8   0020

        JSR     R5,     L_5927                  ; 56B9   0004 0158 0127

L_56BC:
        PULR    R7                              ; 56BC   02B7

        PSHR    R5                              ; 56BD   0275
        MVI@    R1,     R3                      ; 56BE   028B
        ANDI    #$0008, R3                      ; 56BF   03BB 0008
        BEQ     L_56CE                          ; 56C1   0204 000B

        CMPI    #$0002, R2                      ; 56C3   037A 0002
        BNEQ    L_56CB                          ; 56C5   020C 0004

        JSR     R5,     L_5695                  ; 56C7   0004 0154 0295

        PULR    R7                              ; 56CA   02B7

L_56CB:
        JSR     R5,     L_5662                  ; 56CB   0004 0154 0262

L_56CE:
        PULR    R7                              ; 56CE   02B7

L_56CF:
        PSHR    R5                              ; 56CF   0275
        PSHR    R1                              ; 56D0   0271
        MVII    #$0007, R1                      ; 56D1   02B9 0007
L_56D3:
        MOVR    R1,     R0                      ; 56D3   0088

        JSR     R5,     L_5662                  ; 56D4   0004 0154 0262

        DECR    R1                              ; 56D7   0011
        BPL     L_56D3                          ; 56D8   0223 0006

        PULR    R1                              ; 56DA   02B1
        PULR    R7                              ; 56DB   02B7

L_56DC:
        PSHR    R5                              ; 56DC   0275
        PSHR    R0                              ; 56DD   0270
        MVII    #$0335, R1                      ; 56DE   02B9 0335
L_56E0:
        MVI@    R1,     R0                      ; 56E0   0288
        ANDI    #$0008, R0                      ; 56E1   03B8 0008
        BEQ     L_56EC                          ; 56E3   0204 0007

        ADDI    #$0008, R1                      ; 56E5   02F9 0008
        CMPI    #$0355, R1                      ; 56E7   0379 0355
        BLE     L_56E0                          ; 56E9   0226 000A

L_56EB:
        CLRR    R1                              ; 56EB   01C9
L_56EC:
        PULR    R0                              ; 56EC   02B0
        PULR    R7                              ; 56ED   02B7

L_56EE:
        PSHR    R5                              ; 56EE   0275
        PSHR    R2                              ; 56EF   0272
        CLRR    R2                              ; 56F0   01D2
        MVO     R2,     G_0187                  ; 56F1   0242 0187
        MVO     R2,     G_018A                  ; 56F3   0242 018A
        INCR    R2                              ; 56F5   000A
        B       L_56FB                          ; 56F6   0200 0003

L_56F8:
        PSHR    R5                              ; 56F8   0275
        PSHR    R2                              ; 56F9   0272
        CLRR    R2                              ; 56FA   01D2
L_56FB:
        PSHR    R1                              ; 56FB   0271
        PSHR    R0                              ; 56FC   0270
        MVII    #$031D, R1                      ; 56FD   02B9 031D
L_56FF:
        MVI@    R1,     R0                      ; 56FF   0288
        SLL     R0,     1                       ; 5700   0048
        SETC                                    ; 5701   0007
        TSTR    R2                              ; 5702   0092
        BNEQ    L_5706                          ; 5703   020C 0001

        CLRC                                    ; 5705   0006
L_5706:
        RRC     R0,     1                       ; 5706   0070
        MVO@    R0,     R1                      ; 5707   0248
        ADDI    #$0008, R1                      ; 5708   02F9 0008
        CMPI    #$0355, R1                      ; 570A   0379 0355
        BLE     L_56FF                          ; 570C   0226 000E

        PULR    R0                              ; 570E   02B0
        PULR    R1                              ; 570F   02B1
        PULR    R2                              ; 5710   02B2
        PULR    R7                              ; 5711   02B7

L_5712:
        PSHR    R5                              ; 5712   0275
        MOVR    R4,     R3                      ; 5713   00A3
        PSHR    R2                              ; 5714   0272
        PSHR    R1                              ; 5715   0271

        JSR     R5,     X_MPY                   ; 5716   0004 011C 01DC

        ADDR    R2,     R3                      ; 5719   00D3
        PULR    R2                              ; 571A   02B2
        DECR    R2                              ; 571B   0012
        PULR    R1                              ; 571C   02B1
L_571D:
        MOVR    R1,     R0                      ; 571D   0088

        JSR     R5,     X_RAND2                 ; 571E   0004 0114 029E

        TSTR    R0                              ; 5721   0080
        BEQ     L_5727                          ; 5722   0204 0003

        CLRR    R0                              ; 5724   01C0
        B       L_5732                          ; 5725   0200 000B

L_5727:
        MVII    #$0003, R0                      ; 5727   02B8 0003

        JSR     R5,     X_RAND1                 ; 5729   0004 0114 027D

        XORI    #$0100, R0                      ; 572C   03F8 0100
        SLL     R0,     2                       ; 572E   004C
        SLL     R0,     1                       ; 572F   0048
        XORI    #$0007, R0                      ; 5730   03F8 0007
L_5732:
        MVO@    R0,     R4                      ; 5732   0260
        ADDR    R2,     R4                      ; 5733   00D4
        CMPR    R3,     R4                      ; 5734   015C
        BLT     L_571D                          ; 5735   0225 0019
        PULR    R7                              ; 5737   02B7

L_5738:
        PSHR    R5                              ; 5738   0275
        SDBD                                    ; 5739   0001
        MVII    #$5751, R3                      ; 573A   02BB 0051 0057
        MOVR    R3,     R1                      ; 573D   0099
        ADDR    R2,     R1                      ; 573E   00D1
        MVI@    R1,     R4                      ; 573F   028C
        ADDI    #$0200, R4                      ; 5740   02FC 0200
        ADDI    #$0004, R3                      ; 5742   02FB 0004
        MOVR    R3,     R1                      ; 5744   0099
        ADDR    R2,     R1                      ; 5745   00D1
        MVI@    R1,     R0                      ; 5746   0288
        ADDI    #$0004, R3                      ; 5747   02FB 0004
        ADDR    R2,     R3                      ; 5749   00D3
        MVI@    R3,     R1                      ; 574A   0299
        MVII    #$0004, R2                      ; 574B   02BA 0004

        JSR     R5,     L_5712                  ; 574D   0004 0154 0312

        PULR    R7                              ; 5750   02B7

        DECLE   $0013,  $0000,  $00DC,  $0000   ; 5751   0013 0000 00DC 0000
        DECLE   $000C,  $000C,  $0014,  $0014   ; 5755   000C 000C 0014 0014
        DECLE   $0014,  $0014,  $0001,  $0001   ; 5759   0014 0014 0001 0001

        PSHR    R5                              ; 575D   0275
        MVI     G_017B, R1                      ; 575E   0281 017B
        TSTR    R1                              ; 5760   0089
        BNEQ    L_5802                          ; 5761   020C 009F

        MOVR    R0,     R4                      ; 5763   0084
        MOVR    R3,     R0                      ; 5764   0098

        JSR     R5,     .EXEC.76C               ; 5765   0004 0114 036C

        MOVR    R1,     R3                      ; 5768   008B
        INCR    R1                              ; 5769   0009
        MVI@    R1,     R2                      ; 576A   028A
        SDBD                                    ; 576B   0001
        CMPI    #$5D5A, R2                      ; 576C   037A 005A 005D
        BEQ     L_5802                          ; 576F   0204 0091

        MOVR    R4,     R0                      ; 5771   00A0
        CMPI    #$0002, R0                      ; 5772   0378 0002
        BPL     L_5779                          ; 5774   0203 0003

        JSR     R5,     L_5662                  ; 5776   0004 0154 0262

L_5779:
        MOVR    R2,     R4                      ; 5779   0094
        MVI@    R3,     R2                      ; 577A   029A
        MVII    #$000A, R0                      ; 577B   02B8 000A
        SDBD                                    ; 577D   0001
        ANDI    #$2000, R2                      ; 577E   03BA 0000 0020
        BNEQ    L_5784                          ; 5781   020C 0001

        SLL     R0,     1                       ; 5783   0048
L_5784:
        SDBD                                    ; 5784   0001
        CMPI    #$5D34, R4                      ; 5785   037C 0034 005D
        BEQ     L_57A7                          ; 5788   0204 001D

        SDBD                                    ; 578A   0001
        CMPI    #$5D3B, R4                      ; 578B   037C 003B 005D
        BEQ     L_57A7                          ; 578E   0204 0017

        SLL     R0,     2                       ; 5790   004C
        SDBD                                    ; 5791   0001
        CMPI    #$5D42, R4                      ; 5792   037C 0042 005D
        BEQ     L_57A7                          ; 5795   0204 0010

        MVII    #$0032, R0                      ; 5797   02B8 0032
        SDBD                                    ; 5799   0001
        CMPI    #$5D49, R4                      ; 579A   037C 0049 005D
        BEQ     L_57A7                          ; 579D   0204 0008

        SLL     R0,     1                       ; 579F   0048
        SDBD                                    ; 57A0   0001
        CMPI    #$5D6B, R4                      ; 57A1   037C 006B 005D
        BEQ     L_57A7                          ; 57A4   0204 0001

        CLRR    R0                              ; 57A6   01C0

L_57A7:
        JSR     R5,     L_5927                  ; 57A7   0004 0158 0127

        SDBD                                    ; 57AA   0001
        CMPI    #$5D34, R4                      ; 57AB   037C 0034 005D
        BEQ     L_57B8                          ; 57AE   0204 0008

        SDBD                                    ; 57B0   0001
        CMPI    #$5D3B, R4                      ; 57B1   037C 003B 005D
        BEQ     L_57B8                          ; 57B4   0204 0002
        B       L_57FE                          ; 57B6   0200 0046

L_57B8:
        MVI@    R3,     R0                      ; 57B8   0298
        ANDI    #$0040, R0                      ; 57B9   03B8 0040
        BEQ     L_57FE                          ; 57BB   0204 0041

        JSR     R5,     L_56DC                  ; 57BD   0004 0154 02DC

        TSTR    R1                              ; 57C0   0089
        BEQ     L_57FE                          ; 57C1   0204 003B

        JSR     R5,     L_5D83                  ; 57C3   0004 015C 0183

        MOVR    R3,     R4                      ; 57C6   009C
        MVI@    R3,     R0                      ; 57C7   0298
        SDBD                                    ; 57C8   0001
        XORI    #$2440, R0                      ; 57C9   03F8 0040 0024
        MVO@    R0,     R3                      ; 57CC   0258
        ADDI    #$0004, R3                      ; 57CD   02FB 0004
        MVI@    R3,     R0                      ; 57CF   0298

        JSR     R5,     X_UNPK_BYTES            ; 57D0   0004 0114 0357

        MOVR    R0,     R2                      ; 57D3   0082
        SUBR    R1,     R2                      ; 57D4   010A
        ADDR    R0,     R1                      ; 57D5   00C1
        MOVR    R2,     R0                      ; 57D6   0090
        MVI     G_015D, R2                      ; 57D7   0282 015D
        TSTR    R2                              ; 57D9   0092
        BEQ     L_57DE                          ; 57DA   0204 0002

        SLL     R0,     1                       ; 57DC   0048
        SLL     R1,     1                       ; 57DD   0049

L_57DE:
        JSR     R5,     X_PACK_BYTES            ; 57DE   0004 0114 034F

        MVO@    R0,     R3                      ; 57E1   0258
        INCR    R3                              ; 57E2   000B
        MVI@    R3,     R0                      ; 57E3   0298
        SLL     R0,     1                       ; 57E4   0048
        MVO@    R0,     R3                      ; 57E5   0258

        JSR     R5,     L_56DC                  ; 57E6   0004 0154 02DC

        MVII    #$0007, R0                      ; 57E9   02B8 0007

        JSR     R5,     .EXEC.730               ; 57EB   0004 0114 0330

        MOVR    R5,     R3                      ; 57EE   00AB
        SUBI    #$0003, R3                      ; 57EF   033B 0003
        MVI@    R3,     R0                      ; 57F1   0298
        SWAP    R0,     1                       ; 57F2   0040
        XORI    #$00FF, R0                      ; 57F3   03F8 00FF
        INCR    R0                              ; 57F5   0008
        MVO@    R0,     R3                      ; 57F6   0258
        SUBI    #$0004, R3                      ; 57F7   033B 0004
        MVI@    R3,     R0                      ; 57F9   0298
        XORI    #$0200, R0                      ; 57FA   03F8 0200
        MVO@    R0,     R3                      ; 57FC   0258
        PULR    R7                              ; 57FD   02B7

L_57FE:
        MOVR    R3,     R1                      ; 57FE   0099

        JSR     R5,     L_5822                  ; 57FF   0004 0158 0022

L_5802:
        PULR    R7                              ; 5802   02B7

L_5803:
        PSHR    R5                              ; 5803   0275
        MVI     G_017B, R2                      ; 5804   0282 017B
        TSTR    R2                              ; 5806   0092
        BNEQ    L_581C                          ; 5807   020C 0013

        JSR     R5,     L_5822                  ; 5809   0004 0158 0022

        MOVR    R3,     R0                      ; 580C   0098

        JSR     R5,     .EXEC.76C               ; 580D   0004 0114 036C

        INCR    R1                              ; 5810   0009
        MVI@    R1,     R2                      ; 5811   028A
        SDBD                                    ; 5812   0001
        CMPI    #$5D5A, R2                      ; 5813   037A 005A 005D
        BEQ     L_581C                          ; 5816   0204 0004

        DECR    R1                              ; 5818   0011

        JSR     R5,     L_5822                  ; 5819   0004 0158 0022

L_581C:
        PULR    R7                              ; 581C   02B7

        CMP     G_0175, R3                      ; 581D   0343 0175
        BNEQ    L_5803                          ; 581F   022C 001D
        MOVR    R5,     R7                      ; 5821   00AF

L_5822:
        PSHR    R5                              ; 5822   0275
        PSHR    R0                              ; 5823   0270

        JSR     R5,     L_5D83                  ; 5824   0004 015C 0183
        JSR     R5,     .EXEC.766               ; 5827   0004 0114 0366

        XOR     G_0170, R0                      ; 582A   03C0 0170
        BNEQ    L_5832                          ; 582C   020C 0004

        MVO     R0,     G_0170                  ; 582E   0240 0170
        MVO     R0,     .PSG0.chn_c_vol         ; 5830   0240 01FD
L_5832:
        SDBD                                    ; 5832   0001
        MVII    #$588A, R0                      ; 5833   02B8 008A 0058
        MVO@    R0,     R1                      ; 5836   0248
        INCR    R1                              ; 5837   0009
        SDBD                                    ; 5838   0001
        MVII    #$5D5A, R0                      ; 5839   02B8 005A 005D
        MVO@    R0,     R1                      ; 583C   0248
        ADDI    #$0003, R1                      ; 583D   02F9 0003
        CLRR    R0                              ; 583F   01C0
        MVO@    R0,     R1                      ; 5840   0248
        INCR    R1                              ; 5841   0009
        MVII    #$03F5, R0                      ; 5842   02B8 03F5
        MVO@    R0,     R1                      ; 5844   0248
        INCR    R1                              ; 5845   0009
        MVII    #$0009, R0                      ; 5846   02B8 0009
        MVO@    R0,     R1                      ; 5848   0248
        PULR    R0                              ; 5849   02B0
        PULR    R7                              ; 584A   02B7

L_584B:
        PSHR    R5                              ; 584B   0275
        MVI     G_017B, R0                      ; 584C   0280 017B
        XOR     G_017C, R0                      ; 584E   03C0 017C
        BNEQ    L_58B4                          ; 5850   020C 0062

        MVII    #$016B, R4                      ; 5852   02BC 016B
        MVO@    R0,     R4                      ; 5854   0260
        MVO@    R0,     R4                      ; 5855   0260
        MVO@    R0,     R4                      ; 5856   0260
        MVO@    R0,     R4                      ; 5857   0260
        INCR    R0                              ; 5858   0008
        MVO     R0,     G_017B                  ; 5859   0240 017B

        JSR     R5,     L_56EE                  ; 585B   0004 0154 02EE
        JSR     R5,     L_56CF                  ; 585E   0004 0154 02CF

        MVII    #$0003, R3                      ; 5861   02BB 0003
        MVII    #$0335, R4                      ; 5863   02BC 0335
L_5865:
        SDBD                                    ; 5865   0001
        MVII    #$100F, R0                      ; 5866   02B8 000F 0010
        MVO@    R0,     R4                      ; 5869   0260
        SDBD                                    ; 586A   0001
        MVII    #$5D3B, R0                      ; 586B   02B8 003B 005D
        MVO@    R0,     R4                      ; 586E   0260
        MVI     G_031F, R0                      ; 586F   0280 031F
        MVO@    R0,     R4                      ; 5871   0260
        MVI     G_0320, R0                      ; 5872   0280 0320
        MVO@    R0,     R4                      ; 5874   0260
        MOVR    R3,     R1                      ; 5875   0099
        SUBI    #$0003, R1                      ; 5876   0339 0003
        SLL     R1,     1                       ; 5878   0049
        MVI     G_015D, R0                      ; 5879   0280 015D
        TSTR    R0                              ; 587B   0080
        BEQ     L_5884                          ; 587C   0204 0006

        MVII    #$0004, R0                      ; 587E   02B8 0004

        JSR     R5,     X_RAND1                 ; 5880   0004 0114 027D

        MOVR    R0,     R1                      ; 5883   0081

L_5884:
        JSR     R5,     .EXEC.628               ; 5884   0004 0114 0228

        CLRC                                    ; 5887   0006
        MVO@    R0,     R4                      ; 5888   0260
        INCR    R3                              ; 5889   000B
        ADDI    #$0003, R4                      ; 588A   02FC 0003
        CMPI    #$0008, R3                      ; 588C   037B 0008
        BLT     L_5865                          ; 588E   0225 002A

        MVII    #$0028, R0                      ; 5890   02B8 0028
        SUB     G_0167, R0                      ; 5892   0300 0167
        MVO     R0,     G_0323                  ; 5894   0240 0323

        JSR     R5,     L_5D94                  ; 5896   0004 015C 0194

        SDBD                                    ; 5899   0001
        MVII    #$1906, R0                      ; 589A   02B8 0006 0019
        MVO     R0,     G_035D                  ; 589D   0240 035D
        MVI     G_015D, R0                      ; 589F   0280 015D
        TSTR    R0                              ; 58A1   0080
        BEQ     L_58A7                          ; 58A2   0204 0003

        CLRR    R0                              ; 58A4   01C0
        B       L_58AA                          ; 58A5   0200 0003

L_58A7:
        MVII    #$0064, R0                      ; 58A7   02B8 0064
        NEGR    R0                              ; 58A9   0020

L_58AA:
        JSR     R5,     L_5927                  ; 58AA   0004 0158 0127

        MVII    #$0002, R0                      ; 58AD   02B8 0002
        MVO     R0,     G_015F                  ; 58AF   0240 015F

        JSR     R5,     L_5A8D                  ; 58B1   0004 0158 028D

L_58B4:
        PULR    R7                              ; 58B4   02B7

L_58B5:
        PSHR    R5                              ; 58B5   0275

        JSR     R5,     L_56CF                  ; 58B6   0004 0154 02CF

        CLRR    R0                              ; 58B9   01C0
        MVO     R0,     G_017B                  ; 58BA   0240 017B

        JSR     R5,     L_56F8                  ; 58BC   0004 0154 02F8
        JSR     R5,     L_5DBC                  ; 58BF   0004 015C 01BC

        MVI     G_0344, R0                      ; 58C2   0280 0344
        INCR    R0                              ; 58C4   0008
        MVO     R0,     G_0344                  ; 58C5   0240 0344
        CLRR    R0                              ; 58C7   01C0

        JSR     R5,     L_5927                  ; 58C8   0004 0158 0127

        MVI     G_034C, R0                      ; 58CB   0280 034C
        TSTR    R0                              ; 58CD   0080
        BNEQ    L_58D4                          ; 58CE   020C 0004

        JSR     R5,     L_5A26                  ; 58D0   0004 0158 0226

        PULR    R7                              ; 58D3   02B7

L_58D4:
        MOVR    R1,     R4                      ; 58D4   008C
        MVI@    R1,     R0                      ; 58D5   0288
        SDBD                                    ; 58D6   0001
        XORI    #$1808, R0                      ; 58D7   03F8 0008 0018
        MVO@    R0,     R4                      ; 58DA   0260
        INCR    R4                              ; 58DB   000C
        MVII    #$0053, R0                      ; 58DC   02B8 0053
        SWAP    R0,     1                       ; 58DE   0040
        MVO@    R0,     R4                      ; 58DF   0260
        INCR    R4                              ; 58E0   000C
        CLRR    R0                              ; 58E1   01C0
        MVO@    R0,     R4                      ; 58E2   0260

        JSR     R5,     L_5A72                  ; 58E3   0004 0158 0272

        SDBD                                    ; 58E6   0001
        MVII    #$5190, R0                      ; 58E7   02B8 0090 0051
        MVO     R0,     G_035D                  ; 58EA   0240 035D
        PULR    R7                              ; 58EC   02B7

        PSHR    R5                              ; 58ED   0275

        JSR     R5,     L_5DBC                  ; 58EE   0004 015C 01BC

        PSHR    R1                              ; 58F1   0271
        MVII    #$0014, R0                      ; 58F2   02B8 0014
        MVII    #$0001, R1                      ; 58F4   02B9 0001
        MVII    #$0004, R2                      ; 58F6   02BA 0004
        MVII    #$02C8, R4                      ; 58F8   02BC 02C8

        JSR     R5,     L_5712                  ; 58FA   0004 0154 0312

        PULR    R1                              ; 58FD   02B1
        MVI     G_015F, R0                      ; 58FE   0280 015F
        CMPI    #$0002, R0                      ; 5900   0378 0002
        BNEQ    L_5916                          ; 5902   020C 0012

        JSR     R5,     L_58B5                  ; 5904   0004 0158 00B5

        MVI     G_017C, R0                      ; 5907   0280 017C
        TSTR    R0                              ; 5909   0080
        BNEQ    L_5926                          ; 590A   020C 001A

        MVII    #$0033, R0                      ; 590C   02B8 0033
        SWAP    R0,     1                       ; 590E   0040
        MVO     R0,     G_0320                  ; 590F   0240 0320
        MVII    #$0004, R0                      ; 5911   02B8 0004

        JSR     R5,     L_54BC                  ; 5913   0004 0154 00BC

L_5916:
        CLRR    R0                              ; 5916   01C0
        MVO     R0,     G_017B                  ; 5917   0240 017B

        JSR     R5,     L_56F8                  ; 5919   0004 0154 02F8

        DECR    R0                              ; 591C   0010

        JSR     R5,     L_54EE                  ; 591D   0004 0154 00EE

        SDBD                                    ; 5920   0001
        MVII    #$519A, R2                      ; 5921   02BA 009A 0051
        MVO     R2,     G_035D                  ; 5924   0242 035D
L_5926:
        PULR    R7                              ; 5926   02B7

L_5927:
        PSHR    R5                              ; 5927   0275

        JSR     R5,     .EXEC.7C1               ; 5928   0004 0114 03C1

        MOVR    R0,     R2                      ; 592B   0082
        MVI     G_017C, R0                      ; 592C   0280 017C
        TSTR    R0                              ; 592E   0080
        BNEQ    L_59FA                          ; 592F   020C 00C9

        MVI     G_0168, R1                      ; 5931   0281 0168
        MOVR    R2,     R0                      ; 5933   0090

        JSR     R5,     X_MPY                   ; 5934   0004 011C 01DC

        MVI     G_0324, R0                      ; 5937   0280 0324
        ADDR    R2,     R0                      ; 5939   00D0
        MVI     G_032C, R1                      ; 593A   0281 032C
L_593C:
        TSTR    R0                              ; 593C   0080
        BPL     L_5947                          ; 593D   0203 0008

        TSTR    R1                              ; 593F   0089
        BEQ     L_5950                          ; 5940   0204 000E

        ADDI    #$03E8, R0                      ; 5942   02F8 03E8
        DECR    R1                              ; 5944   0011
        B       L_593C                          ; 5945   0220 000A

L_5947:
        CMPI    #$03E8, R0                      ; 5947   0378 03E8
        BLT     L_5950                          ; 5949   0205 0005

        SUBI    #$03E8, R0                      ; 594B   0338 03E8
        INCR    R1                              ; 594D   0009
        B       L_593C                          ; 594E   0220 0013

L_5950:
        MVO     R0,     G_0324                  ; 5950   0240 0324
        MVO     R1,     G_032C                  ; 5952   0241 032C
        MVI     G_017B, R2                      ; 5954   0282 017B
        XORI    #$0001, R2                      ; 5956   03FA 0001
        AND     G_015D, R2                      ; 5958   0382 015D
        TSTR    R2                              ; 595A   0092
        BNEQ    L_5966                          ; 595B   020C 0009

        MVII    #$0007, R3                      ; 595D   02BB 0007
        MVI     G_0161, R4                      ; 595F   0284 0161
        ADDI    #$0202, R4                      ; 5961   02FC 0202

        JSR     R5,     L_59FB                  ; 5963   0004 0158 01FB

L_5966:
        MVI     G_033C, R1                      ; 5966   0281 033C
        MVI     G_032C, R0                      ; 5968   0280 032C
        CMPR    R0,     R1                      ; 596A   0141
        BEQ     L_5977                          ; 596B   0204 000A
        BGT     L_5980                          ; 596D   020E 0011

        MVO     R0,     G_033C                  ; 596F   0240 033C
        MVI     G_0324, R0                      ; 5971   0280 0324
        MVO     R0,     G_0334                  ; 5973   0240 0334
        B       L_5980                          ; 5975   0200 0009

L_5977:
        MVI     G_0334, R1                      ; 5977   0281 0334
        MVI     G_0324, R0                      ; 5979   0280 0324
        CMPR    R0,     R1                      ; 597B   0141
        BGE     L_5980                          ; 597C   020D 0002

        MVO     R0,     G_0334                  ; 597E   0240 0334
L_5980:
        SDBD                                    ; 5980   0001
        MVII    #$5B49, R4                      ; 5981   02BC 0049 005B
        CLRR    R0                              ; 5984   01C0
L_5985:
        MVI@    R4,     R1                      ; 5985   02A1
        CMP     G_032C, R1                      ; 5986   0341 032C
        BGT     L_598F                          ; 5988   020E 0005

        INCR    R0                              ; 598A   0008
        CMPI    #$0013, R0                      ; 598B   0378 0013
        BNEQ    L_5985                          ; 598D   022C 0009

L_598F:
        SDBD                                    ; 598F   0001
        MVII    #$5B5C, R3                      ; 5990   02BB 005C 005B
        ADDR    R0,     R3                      ; 5993   00C3
        MVI@    R3,     R3                      ; 5994   029B
        MVO     R3,     G_0168                  ; 5995   0243 0168
        SDBD                                    ; 5997   0001
        ADDI    #$52C9, R3                      ; 5998   02FB 00C9 0052
        MVI@    R3,     R3                      ; 599B   029B
        MVO     R3,     G_0166                  ; 599C   0243 0166
        MVI     G_0167, R1                      ; 599E   0281 0167
        MVO     R0,     G_0167                  ; 59A0   0240 0167
        CMPR    R1,     R0                      ; 59A2   0148
        BEQ     L_59AE                          ; 59A3   0204 0009

        MVI     G_015F, R1                      ; 59A5   0281 015F
        CMPI    #$0002, R1                      ; 59A7   0379 0002
        BEQ     L_59AE                          ; 59A9   0204 0003

        JSR     R5,     L_5A72                  ; 59AB   0004 0158 0272

L_59AE:
        TSTR    R2                              ; 59AE   0092
        BNEQ    L_59C1                          ; 59AF   020C 0010

        MVI     G_0168, R0                      ; 59B1   0280 0168
        ADDI    #$0010, R0                      ; 59B3   02F8 0010
        SLL     R0,     2                       ; 59B5   004C
        SLL     R0,     1                       ; 59B6   0048
        XORI    #$0007, R0                      ; 59B7   03F8 0007
        MVI     G_0161, R4                      ; 59B9   0284 0161
        ADDI    #$0211, R4                      ; 59BB   02FC 0211
        MVO@    R0,     R4                      ; 59BD   0260
        MVII    #$02C7, R0                      ; 59BE   02B8 02C7
        MVO@    R0,     R4                      ; 59C0   0260
L_59C1:
        MVI     G_033C, R0                      ; 59C1   0280 033C
        ADDI    #$0005, R0                      ; 59C3   02F8 0005
        SUB     G_0344, R0                      ; 59C5   0300 0344
        MVO     R0,     G_034C                  ; 59C7   0240 034C
        MOVR    R0,     R1                      ; 59C9   0081
        TSTR    R2                              ; 59CA   0092
        BNEQ    L_59FA                          ; 59CB   020C 002D

        MVII    #$0008, R0                      ; 59CD   02B8 0008
        MVI     G_0161, R4                      ; 59CF   0284 0161
        ADDI    #$0209, R4                      ; 59D1   02FC 0209

        JSR     R5,     X_FILL_ZERO             ; 59D3   0004 0114 0338

        SUBI    #$0001, R1                      ; 59D6   0339 0001
        BLE     L_59FA                          ; 59D8   0206 0020

        MOVR    R1,     R0                      ; 59DA   0088
        MVII    #$0008, R1                      ; 59DB   02B9 0008
        ADD     G_015D, R1                      ; 59DD   02C1 015D
        SLL     R1,     2                       ; 59DF   004D
        SLL     R1,     1                       ; 59E0   0049
        SDBD                                    ; 59E1   0001
        XORI    #$0805, R1                      ; 59E2   03F9 0005 0008
        MVI     G_0161, R4                      ; 59E5   0284 0161
        ADDI    #$020A, R4                      ; 59E7   02FC 020A
        CMPI    #$0007, R0                      ; 59E9   0378 0007
        BGT     L_59F2                          ; 59EB   020E 0005

        JSR     R5,     X_FILL_MEM              ; 59ED   0004 0114 0341

        B       L_59FA                          ; 59F0   0200 0008

L_59F2:
        MVO@    R1,     R4                      ; 59F2   0261
        MVII    #$0004, R1                      ; 59F3   02B9 0004
        MVII    #$0005, R3                      ; 59F5   02BB 0005

        JSR     R5,     X_PRNUM_LFT             ; 59F7   0004 0118 009E

L_59FA:
        PULR    R7                              ; 59FA   02B7

L_59FB:
        PSHR    R5                              ; 59FB   0275
        TSTR    R1                              ; 59FC   0089
        BEQ     L_5A0E                          ; 59FD   0204 000F

        PSHR    R0                              ; 59FF   0270
        MOVR    R1,     R0                      ; 5A00   0088
        MVII    #$0004, R1                      ; 5A01   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5A03   0004 0118 00C5

        PULR    R0                              ; 5A06   02B0
        DECR    R1                              ; 5A07   0011
        ADDI    #$0004, R4                      ; 5A08   02FC 0004

        JSR     R5,     X_PRNUM_ZRO             ; 5A0A   0004 0118 00AD

        PULR    R7                              ; 5A0D   02B7

L_5A0E:
        PSHR    R0                              ; 5A0E   0270
        MVII    #$0004, R0                      ; 5A0F   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5A11   0004 0114 0338

        PULR    R0                              ; 5A14   02B0
        TSTR    R0                              ; 5A15   0080
        BMI     L_5A1E                          ; 5A16   020B 0006

        MVII    #$0003, R1                      ; 5A18   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 5A1A   0004 0118 00C5

        PULR    R7                              ; 5A1D   02B7

L_5A1E:
        MVII    #$0005, R1                      ; 5A1E   02B9 0005
        SUBI    #$0002, R4                      ; 5A20   033C 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A22   0004 0118 00C5

        PULR    R7                              ; 5A25   02B7

L_5A26:
        PSHR    R5                              ; 5A26   0275
        MVI     G_017C, R0                      ; 5A27   0280 017C
        TSTR    R0                              ; 5A29   0080
        BNEQ    L_5A71                          ; 5A2A   020C 0045

        MVO     R0,     G_017B                  ; 5A2C   0240 017B

        JSR     R5,     L_56CF                  ; 5A2E   0004 0154 02CF

        SDBD                                    ; 5A31   0001
        MVII    #$5049, R1                      ; 5A32   02B9 0049 0050

        JSR     R5,     X_TIMER_STOP            ; 5A35   0004 0118 0038

        MVII    #$01F0, R4                      ; 5A38   02BC 01F0
        MVII    #$000E, R0                      ; 5A3A   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5A3C   0004 0114 0338

        MVII    #$0007, R3                      ; 5A3F   02BB 0007
        MVII    #$0252, R4                      ; 5A41   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 5A43   0004 0118 007B
        STRING  "Game Over"                     ; 5A46  
        DECLE   $0000                           ; 5A4F   0000

        MVII    #$027A, R4                      ; 5A50   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 5A52   0004 0118 007B
        STRING  "Peak Score"                    ; 5A55  
        DECLE   $0000                           ; 5A5F   0000

        MVI     G_0334, R0                      ; 5A60   0280 0334
        MVI     G_033C, R1                      ; 5A62   0281 033C

        JSR     R5,     L_59FB                  ; 5A64   0004 0158 01FB

        SDBD                                    ; 5A67   0001
        MVII    #$1906, R0                      ; 5A68   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5A6B   0240 035D
        MVII    #$0001, R0                      ; 5A6D   02B8 0001
        MVO     R0,     G_017C                  ; 5A6F   0240 017C
L_5A71:
        PULR    R7                              ; 5A71   02B7

L_5A72:
        PSHR    R5                              ; 5A72   0275
        MVI     G_0168, R1                      ; 5A73   0281 0168
        MVI     G_015D, R0                      ; 5A75   0280 015D
        TSTR    R0                              ; 5A77   0080
        BEQ     L_5A7C                          ; 5A78   0204 0002

        MVII    #$0006, R1                      ; 5A7A   02B9 0006
L_5A7C:
        SDBD                                    ; 5A7C   0001
        ADDI    #$5A86, R1                      ; 5A7D   02F9 0086 005A
        MVI@    R1,     R0                      ; 5A80   0288
        MVO     R0,     G_015F                  ; 5A81   0240 015F

        JSR     R5,     L_5A8D                  ; 5A83   0004 0158 028D

        PULR    R7                              ; 5A86   02B7

        DECLE   $0000,  $0001                   ; 5A87   0000 0001

        INCR    R7                              ; 5A89   000F

        INCR    R1                              ; 5A8A   0009
L_5A8B:
        INCR    R0                              ; 5A8B   0008
        DECLE   $0000                           ; 5A8C   0000
L_5A8D:
        PSHR    R5                              ; 5A8D   0275
        MVO     R0,     G_0160                  ; 5A8E   0240 0160
        DIS                                     ; 5A90   0003
        SDBD                                    ; 5A91   0001
        MVII    #$009F, R0                      ; 5A92   02B8 009F 0000
        MVO     R0,     .ISRVEC.0               ; 5A95   0240 0100
        SDBD                                    ; 5A97   0001
        MVII    #$005A, R0                      ; 5A98   02B8 005A 0000
        MVO     R0,     .ISRVEC.1               ; 5A9B   0240 0101
        EIS                                     ; 5A9D   0002
        PULR    R7                              ; 5A9E   02B7

        MVI     G_0160, R0                      ; 5A9F   0280 0160
        MVO     R0,     .STIC.CS.0              ; 5AA1   0240 0028
        MVO     R0,     .STIC.BORD              ; 5AA3   0240 002C
        MVO     R0,     G_0106                  ; 5AA5   0240 0106
        MVI     G_015D, R0                      ; 5AA7   0280 015D
        SLL     R0,     1                       ; 5AA9   0048
        ADD     G_015D, R0                      ; 5AAA   02C0 015D
        MVO     R0,     .STIC.EDGE              ; 5AAC   0240 0032
        MVI     G_0162, R0                      ; 5AAE   0280 0162
        MVO     R0,     .ISRVEC.0               ; 5AB0   0240 0100
        MVI     G_0163, R0                      ; 5AB2   0280 0163
        MVO     R0,     .ISRVEC.1               ; 5AB4   0240 0101
        MVII    #$0162, R4                      ; 5AB6   02BC 0162
        SDBD                                    ; 5AB8   0001
        MVI@    R4,     R7                      ; 5AB9   02A7

        DECLE   $001E,  $0020,  $0022,  $0024   ; 5ABA   001E 0020 0022 0024
        DECLE   $0026,  $0028,  $002A,  $002C   ; 5ABE   0026 0028 002A 002C
        DECLE   $002E,  $0030,  $0032,  $0034   ; 5AC2   002E 0030 0032 0034
        DECLE   $0036,  $0038,  $003A,  $003C   ; 5AC6   0036 0038 003A 003C
        DECLE   $003E,  $0040,  $0042,  $0044   ; 5ACA   003E 0040 0042 0044
        DECLE   $0040,  $0050,  $0060,  $0070   ; 5ACE   0040 0050 0060 0070
        DECLE   $007F,  $0010,  $0012,  $0014   ; 5AD2   007F 0010 0012 0014
        DECLE   $0016,  $0018,  $001B,  $001E   ; 5AD6   0016 0018 001B 001E
        DECLE   $0021,  $0024,  $0026,  $0028   ; 5ADA   0021 0024 0026 0028
        DECLE   $002A,  $002C,  $002E,  $0030   ; 5ADE   002A 002C 002E 0030
        DECLE   $0032,  $0034,  $0036           ; 5AE2   0032 0034 0036

        RSWD    R0                              ; 5AE5   0038
        RSWD    R2                              ; 5AE6   003A
        DECR    R4                              ; 5AE7   0014
        INCR    R7                              ; 5AE8   000F

        INCR    R4                              ; 5AE9   000C
L_5AEA:
        INCR    R2                              ; 5AEA   000A
        DECLE   $000A,  $0008,  $0008,  $0007   ; 5AEB   000A 0008 0008 0007
        DECLE   $0007,  $0006,  $0006,  $0005   ; 5AEF   0007 0006 0006 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5AF3   0005 0005 0005 0005
        DECLE   $0004,  $0003,  $0002,  $0001   ; 5AF7   0004 0003 0002 0001
        DECLE   $001E,  $001B,  $0019,  $0016   ; 5AFB   001E 001B 0019 0016
        DECLE   $0014,  $0014,  $0012,  $0010   ; 5AFF   0014 0014 0012 0010
        DECLE   $000E,  $000C,  $000A,  $0008   ; 5B03   000E 000C 000A 0008
        DECLE   $0007,  $0006,  $0005,  $0004   ; 5B07   0007 0006 0005 0004
        DECLE   $0003,  $0002,  $0002,  $0002   ; 5B0B   0003 0002 0002 0002
        DECLE   $0006,  $0005,  $0004,  $0003   ; 5B0F   0006 0005 0004 0003
        DECLE   $0002,  $0001,  $0001,  $0001   ; 5B13   0002 0001 0001 0001
        DECLE   $0001,  $0001,  $03E8,  $0320   ; 5B17   0001 0001 03E8 0320
        DECLE   $02BC,  $0258,  $0258,  $01F4   ; 5B1B   02BC 0258 0258 01F4
        DECLE   $01F4,  $0190,  $0190,  $012C   ; 5B1F   01F4 0190 0190 012C
        DECLE   $012C,  $00FA,  $00C8,  $0096   ; 5B23   012C 00FA 00C8 0096
        DECLE   $0064,  $0050,  $0028,  $0014   ; 5B27   0064 0050 0028 0014
        DECLE   $0010,  $0008,  $0320,  $0320   ; 5B2B   0010 0008 0320 0320
        DECLE   $0320,  $0320,  $0320,  $0258   ; 5B2F   0320 0320 0320 0258
        DECLE   $0258,  $01F4,  $01F4,  $0190   ; 5B33   0258 01F4 01F4 0190
        DECLE   $0190,  $012C,  $00F0,  $00A0   ; 5B37   0190 012C 00F0 00A0
        DECLE   $0078,  $0064,  $0050,  $0028   ; 5B3B   0078 0064 0050 0028
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5B3F   0005 0005 0005 0005
        DECLE   $0005,  $0004,  $0003,  $0002   ; 5B43   0005 0004 0003 0002
        DECLE   $0001,  $0001,  $0001,  $0002   ; 5B47   0001 0001 0001 0002
        DECLE   $0005                           ; 5B4B   0005

        SETC                                    ; 5B4C   0007
        INCR    R2                              ; 5B4D   000A
        INCR    R4                              ; 5B4E   000C
        INCR    R7                              ; 5B4F   000F

        DECR    R4                              ; 5B50   0014
L_5B51:
        COMR    R6                              ; 5B51   001E
        DECLE   $0028,  $0032,  $004B,  $0064   ; 5B52   0028 0032 004B 0064
        DECLE   $0096,  $00C8,  $012C,  $01F4   ; 5B56   0096 00C8 012C 01F4
        DECLE   $02EE,  $03E8,  $0001,  $0002   ; 5B5A   02EE 03E8 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0003   ; 5B5E   0002 0003 0003 0003
        DECLE   $0003,  $0003,  $0004,  $0004   ; 5B62   0003 0003 0004 0004
        DECLE   $0004,  $0005,  $0005,  $0006   ; 5B66   0004 0005 0005 0006
        DECLE   $0006,  $0006,  $0006,  $0006   ; 5B6A   0006 0006 0006 0006
        DECLE   $0006,  $0006                   ; 5B6E   0006 0006
.GFX_LIST_5B70:
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5B70  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B74  
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5B78  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B7C  
        DECLE   $0000,  $0002,  $0000,  $0000   ; 5B80  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5B84  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B88  CART PIC #03
        DECLE   $0000,  $0006,  $0000,  $0000   ; 5B8C  
        DECLE   $0010,  $0010,  $0010,  $0038   ; 5B90  CART PIC #04
        DECLE   $007C,  $00EE,  $00FE,  $0044   ; 5B94  
        DECLE   $0010,  $0054,  $0038,  $006C   ; 5B98  CART PIC #05
        DECLE   $0038,  $007C,  $00FE,  $00AA   ; 5B9C  
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BA0   0018 0018 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA4   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BA8   0018 0018 0018 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5BAC   0018 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BB0   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5BB4   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BB8   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 5BBC   0018 0018 0018 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BC0   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BC4   0018 0018 0018 0018
        DECLE   $004C,  $007C,  $0076,  $00AE   ; 5BC8   004C 007C 0076 00AE
        DECLE   $00FC,  $007F,  $005A,  $0030   ; 5BCC   00FC 007F 005A 0030
        DECLE   $0076,  $00FF                   ; 5BD0   0076 00FF

        SARC    R2,     1                       ; 5BD2   007A
        ADCR    R7                              ; 5BD3   002F
        INCR    R7                              ; 5BD4   000F

L_5BD5:
        RSWD    R4                              ; 5BD5   003C
L_5BD6:
        SARC    R2,     2                       ; 5BD6   007E
        DECLE   $002C,  $0068,  $00FC,  $007C   ; 5BD7   002C 0068 00FC 007C
        DECLE   $003E,  $007A,  $00DE,  $00FC   ; 5BDB   003E 007A 00DE 00FC
        DECLE   $0038,  $007C,  $007E,  $007E   ; 5BDF   0038 007C 007E 007E
        DECLE   $0037,  $003F                   ; 5BE3   0037 003F

        ADDR    R7,     R2                      ; 5BE5   00FA
        ADDR    R5,     R7                      ; 5BE6   00EF

        SLR     R2,     2                       ; 5BE7   0066
        NEGR    R0                              ; 5BE8   0020
        SARC    R0,     1                       ; 5BE9   0078
        ADDR    R5,     R4                      ; 5BEA   00EC
        ADDR    R7,     R6                      ; 5BEB   00FE
        SARC    R0,     1                       ; 5BEC   0078
        SLLC    R3,     2                       ; 5BED   005F
        ADCR    R7                              ; 5BEE   002F

        RSWD    R2                              ; 5BEF   003A
L_5BF0:
        SARC    R0,     2                       ; 5BF0   007C
        DECLE   $007F,  $00FD,  $00DA,  $006E   ; 5BF1   007F 00FD 00DA 006E
        DECLE   $007E,  $003A,  $0010,  $000C   ; 5BF5   007E 003A 0010 000C
        DECLE   $003C,  $007E,  $0076,  $007F   ; 5BF9   003C 007E 0076 007F
        DECLE   $00FF,  $00FA,  $003C,  $007C   ; 5BFD   00FF 00FA 003C 007C
        DECLE   $007E,  $006F,  $00FF,  $00FE   ; 5C01   007E 006F 00FF 00FE
        DECLE   $007E,  $006C,  $0020,  $0018   ; 5C05   007E 006C 0020 0018
        DECLE   $0018,  $003C,  $0024,  $0024   ; 5C09   0018 003C 0024 0024
        DECLE   $003C,  $0018,  $0018,  $0000   ; 5C0D   003C 0018 0018 0000
        DECLE   $0006,  $001E,  $0024,  $0024   ; 5C11   0006 001E 0024 0024
        DECLE   $0078,  $0060,  $0000,  $0000   ; 5C15   0078 0060 0000 0000
        DECLE   $0000                           ; 5C19   0000

        RSWD    R4                              ; 5C1A   003C
        ADDR    R4,     R7                      ; 5C1B   00E7
        ADDR    R4,     R7                      ; 5C1C   00E7

        DECLE   $003C,  $0000,  $0000,  $0000   ; 5C1D   003C 0000 0000 0000
        DECLE   $0060,  $0078,  $0024,  $0024   ; 5C21   0060 0078 0024 0024
        DECLE   $001E,  $0006,  $0000,  $0000   ; 5C25   001E 0006 0000 0000
        DECLE   $0000,  $0024,  $0018,  $0018   ; 5C29   0000 0024 0018 0018
        DECLE   $0024,  $0000,  $0000,  $0000   ; 5C2D   0024 0000 0000 0000
        DECLE   $0042,  $003C,  $0024,  $0024   ; 5C31   0042 003C 0024 0024
        DECLE   $003C,  $0042,  $0000,  $0000   ; 5C35   003C 0042 0000 0000
        DECLE   $003C,  $0066,  $005A,  $005A   ; 5C39   003C 0066 005A 005A
        DECLE   $0066,  $003C,  $0000,  $003C   ; 5C3D   0066 003C 0000 003C
        DECLE   $0000,  $0099,  $00A5,  $00A5   ; 5C41   0000 0099 00A5 00A5
        DECLE   $0099,  $0000,  $003C,  $0042   ; 5C45   0099 0000 003C 0042
        DECLE   $0099,  $0024,  $0042,  $0042   ; 5C49   0099 0024 0042 0042
        DECLE   $0024,  $0099,  $0042,  $0099   ; 5C4D   0024 0099 0042 0099
        DECLE   $0042,  $0000,  $0081,  $0081   ; 5C51   0042 0000 0081 0081
        DECLE   $0000,  $0042,  $0099,  $0000   ; 5C55   0000 0042 0099 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5C59   0000 0000 0010 0010
        DECLE   $007C,  $0010,  $0010,  $0000   ; 5C5D   007C 0010 0010 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5C61   0000 0000 0010 0038
        DECLE   $007C,  $0038,  $0010,  $0000   ; 5C65   007C 0038 0010 0000
        DECLE   $0000,  $0000,  $0038,  $007C   ; 5C69   0000 0000 0038 007C
        DECLE   $007C,  $007C,  $0038,  $0000   ; 5C6D   007C 007C 0038 0000
        DECLE   $0000,  $0000                   ; 5C71   0000 0000

        DECR    R0                              ; 5C73   0010
        RSWD    R0                              ; 5C74   0038
        SARC    R0,     2                       ; 5C75   007C
        RSWD    R0                              ; 5C76   0038
        DECR    R0                              ; 5C77   0010
        DECR    R0                              ; 5C78   0010
        DECR    R0                              ; 5C79   0010
        DECR    R0                              ; 5C7A   0010
        DECR    R0                              ; 5C7B   0010
        DECR    R0                              ; 5C7C   0010
        DECR    R0                              ; 5C7D   0010
        DECR    R0                              ; 5C7E   0010
        RSWD    R0                              ; 5C7F   0038
        RSWD    R0                              ; 5C80   0038
        SARC    R0,     2                       ; 5C81   007C
        SAR     R0,     2                       ; 5C82   006C
        ADDR    R5,     R6                      ; 5C83   00EE
        ADDR    R7,     R6                      ; 5C84   00FE
        ADDR    R7,     R6                      ; 5C85   00FE
        SWAP    R0,     2                       ; 5C86   0044
        SWAP    R0,     2                       ; 5C87   0044
        TSTR    R0                              ; 5C88   0080
        TSTR    R0                              ; 5C89   0080
        SWAP    R0,     1                       ; 5C8A   0040
        SWAP    R0,     1                       ; 5C8B   0040
        SWAP    R0,     1                       ; 5C8C   0040
        NEGR    R0                              ; 5C8D   0020
        RRC     R0,     1                       ; 5C8E   0070
        RRC     R0,     1                       ; 5C8F   0070
        RSWD    R4                              ; 5C90   003C
        SAR     R0,     2                       ; 5C91   006C
        SAR     R2,     2                       ; 5C92   006E
        SARC    R2,     2                       ; 5C93   007E
        SARC    R0,     1                       ; 5C94   0078
        NEGR    R0                              ; 5C95   0020
        NEGR    R0                              ; 5C96   0020
        NEGR    R0                              ; 5C97   0020
        TSTR    R0                              ; 5C98   0080
        TSTR    R0                              ; 5C99   0080
        SWAP    R0,     1                       ; 5C9A   0040
        SWAP    R0,     1                       ; 5C9B   0040
        GSWD    R0                              ; 5C9C   0030
        GSWD    R0                              ; 5C9D   0030
        RSWD    R6                              ; 5C9E   003E
        RSWD    R6                              ; 5C9F   003E
L_5CA0:
        DECR    R7                              ; 5CA0   0017
L_5CA1:
        DECR    R7                              ; 5CA1   0017

        DECLE   $001C,  $001C,  $0018,  $0018   ; 5CA2   001C 001C 0018 0018
        DECLE   $0008,  $0008,  $0000,  $0000   ; 5CA6   0008 0008 0000 0000
        DECLE   $0080,  $00C0,  $006C,  $007F   ; 5CAA   0080 00C0 006C 007F
        DECLE   $003F,  $0016,  $0016,  $001C   ; 5CAE   003F 0016 0016 001C
        DECLE   $001C,  $001C,  $0008,  $0008   ; 5CB2   001C 001C 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5CB6   0008 0000 0000 0000
        DECLE   $0000                           ; 5CBA   0000

        EIS                                     ; 5CBB   0002
        SETC                                    ; 5CBC   0007
        INCR    R7                              ; 5CBD   000F

        COMR    R6                              ; 5CBE   001E
L_5CBF:
        ADDR    R7,     R2                      ; 5CBF   00FA
        ADDR    R7,     R2                      ; 5CC0   00FA
        COMR    R6                              ; 5CC1   001E
        INCR    R7                              ; 5CC2   000F

        SETC                                    ; 5CC3   0007
L_5CC4:
        EIS                                     ; 5CC4   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC5   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $003C   ; 5CC9   0000 0018 003C 003C
        DECLE   $0018,  $0000,  $0000,  $003C   ; 5CCD   0018 0000 0000 003C
        DECLE   $007E,  $00FF,  $00D5,  $00FF   ; 5CD1   007E 00FF 00D5 00FF
        DECLE   $003C,  $0000,  $0000,  $0018   ; 5CD5   003C 0000 0000 0018
        DECLE   $005A,  $00FF,  $00AB,  $007E   ; 5CD9   005A 00FF 00AB 007E
        DECLE   $0099,  $0000,  $0000,  $0099   ; 5CDD   0099 0000 0000 0099
        DECLE   $005A,  $00FF,  $00AB,  $007E   ; 5CE1   005A 00FF 00AB 007E
        DECLE   $005A,  $0000,  $0000,  $0000   ; 5CE5   005A 0000 0000 0000
        DECLE   $0000,  $0054,  $002A,  $0054   ; 5CE9   0000 0054 002A 0054
        DECLE   $002A,  $0000,  $0000,  $0300   ; 5CED   002A 0000 0000 0300
        DECLE   $0000,  $00B5,  $0058,  $0001   ; 5CF1   0000 00B5 0058 0001
        DECLE   $0000,  $000A,  $024B,  $0158   ; 5CF5   0000 000A 024B 0158
        DECLE   $014B,  $0058,  $014B,  $0158   ; 5CF9   014B 0058 014B 0158
        DECLE   $034B,  $0058,  $034B,  $0158   ; 5CFD   034B 0058 034B 0158
        DECLE   $0300,  $0000,  $00ED,  $0058   ; 5D01   0300 0000 00ED 0058
        DECLE   $0005,  $001C,  $000A,  $024B   ; 5D05   0005 001C 000A 024B
        DECLE   $0158,  $014B,  $0058,  $014B   ; 5D09   0158 014B 0058 014B
        DECLE   $0158,  $034B,  $0058,  $034B   ; 5D0D   0158 034B 0058 034B
        DECLE   $0158,  $0262,  $0056,  $0000   ; 5D11   0158 0262 0056 0000
        DECLE   $0000,  $0005,  $0001,  $000A   ; 5D15   0000 0005 0001 000A
        DECLE   $025D,  $0157,  $015D,  $0057   ; 5D19   025D 0157 015D 0057
        DECLE   $015D,  $0157,  $035D,  $0057   ; 5D1D   015D 0157 035D 0057
        DECLE   $035D,  $0157,  $0262,  $0056   ; 5D21   035D 0157 0262 0056
        DECLE   $0000,  $0000,  $0001,  $0026   ; 5D25   0000 0000 0001 0026
        DECLE   $000A,  $025D,  $0157,  $015D   ; 5D29   000A 025D 0157 015D
        DECLE   $0057,  $015D,  $0157,  $035D   ; 5D2D   0057 015D 0157 035D
        DECLE   $0057,  $035D,  $0157,  $03BD   ; 5D31   0057 035D 0157 03BD
        DECLE   $0056,  $0000,  $0000,  $0008   ; 5D35   0056 0000 0000 0008
        DECLE   $0006,  $0000,  $0262,  $0056   ; 5D39   0006 0000 0262 0056
        DECLE   $0000,  $0000,  $0008,  $0006   ; 5D3D   0000 0000 0008 0006
        DECLE   $0000,  $03BD,  $0056,  $0000   ; 5D41   0000 03BD 0056 0000
        DECLE   $0000,  $0004,  $000E,  $0000   ; 5D45   0000 0004 000E 0000
        DECLE   $0362,  $0056,  $0000,  $0000   ; 5D49   0362 0056 0000 0000
        DECLE   $0004,  $0018,  $000A,  $0203   ; 5D4D   0004 0018 000A 0203
        DECLE   $0158,  $0103,  $0058,  $0103   ; 5D51   0158 0103 0058 0103
        DECLE   $0158,  $0303,  $0058,  $0303   ; 5D55   0158 0303 0058 0303
        DECLE   $0158,  $0100,  $0000,  $0062   ; 5D59   0158 0100 0000 0062
        DECLE   $0056,  $0006,  $0012,  $000A   ; 5D5D   0056 0006 0012 000A
        DECLE   $025D,  $0157,  $015D,  $0057   ; 5D61   025D 0157 015D 0057
        DECLE   $015D,  $0157,  $035D,  $0057   ; 5D65   015D 0157 035D 0057
        DECLE   $035D,  $0157,  $0262,  $0056   ; 5D69   035D 0157 0262 0056
        DECLE   $0000,  $0000,  $0003,  $0027   ; 5D6D   0000 0000 0003 0027
        DECLE   $0000,  $0362,  $0056,  $00B1   ; 5D71   0000 0362 0056 00B1
        DECLE   $0054,  $0001,  $002A,  $000A   ; 5D75   0054 0001 002A 000A
        DECLE   $021D                           ; 5D79   021D

        CMPR    R3,     R0                      ; 5D7A   0158
        SUBR    R3,     R5                      ; 5D7B   011D
        SLLC    R0,     1                       ; 5D7C   0058
        SUBR    R3,     R5                      ; 5D7D   011D
        CMPR    R3,     R0                      ; 5D7E   0158
        SUB@    R3,     R5                      ; 5D7F   031D
        SLLC    R0,     1                       ; 5D80   0058
        SUB@    R3,     R5                      ; 5D81   031D
        CMPR    R3,     R0                      ; 5D82   0158
L_5D83:
        PSHR    R5                              ; 5D83   0275

        JSR     R5,     .EXEC.7C1               ; 5D84   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX1             ; 5D87   0004 0118 03BB
        DECLE   $0319                           ; 5D8A  SFX data
        DECLE   $003C,  $03A0                   ; 5D8B  SFX data
        DECLE   $00B7                           ; 5D8D  SFX data
        DECLE   $03ED                           ; 5D8E  SFX data
        DECLE   $000B                           ; 5D8F  SFX data
        DECLE   $008F,  $0021                   ; 5D90  SFX data
        DECLE   $002D                           ; 5D92  SFX data
        DECLE   $03CF                           ; 5D93  SFX end

L_5D94:
        PSHR    R5                              ; 5D94   0275

        JSR     R5,     .EXEC.7C1               ; 5D95   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 5D98   0004 0118 03BE
        DECLE   $00A0                           ; 5D9B  SFX prio
        DECLE   $03ED                           ; 5D9C  SFX data
        DECLE   $000F,  $03F4                   ; 5D9D  SFX data
        DECLE   $0079                           ; 5D9F  SFX data
        DECLE   $010C,  $0000                   ; 5DA0  SFX data
        DECLE   $03B7                           ; 5DA2  SFX data
        DECLE   $000B                           ; 5DA3  SFX data
        DECLE   $03CF                           ; 5DA4  SFX end

L_5DA5:
        PSHR    R5                              ; 5DA5   0275

        JSR     R5,     .EXEC.7C1               ; 5DA6   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 5DA9   0004 0118 03BE
        DECLE   $0090                           ; 5DAC  SFX prio
        DECLE   $03C0,  $0025                   ; 5DAD  SFX data
        DECLE   $03C8,  $0028                   ; 5DAF  SFX data
        DECLE   $03C4,  $002B                   ; 5DB1  SFX data
        DECLE   $0001,  $0007                   ; 5DB3  SFX data
        DECLE   $03DE                           ; 5DB5  SFX data
        DECLE   $0389                           ; 5DB6  SFX data
        DECLE   $008F,  $0017                   ; 5DB7  SFX data
        DECLE   $01CF                           ; 5DB9  SFX end


        B       L_5DC0                          ; 5DBA   0200 0004

L_5DBC:
        PSHR    R5                              ; 5DBC   0275

        JSR     R5,     .EXEC.7C1               ; 5DBD   0004 0114 03C1

L_5DC0:
        CLRR    R0                              ; 5DC0   01C0
        MVO     R0,     G_0149                  ; 5DC1   0240 0149
        MVO     R0,     G_0145                  ; 5DC3   0240 0145
        MVII    #$000E, R0                      ; 5DC5   02B8 000E
        MVII    #$01F0, R4                      ; 5DC7   02BC 01F0

        JSR     R5,     X_FILL_ZERO             ; 5DC9   0004 0114 0338

        MVII    #$0020, R0                      ; 5DCC   02B8 0020
        MVO     R0,     .PSG0.chn_c_lo          ; 5DCE   0240 01F2
        MVII    #$0031, R0                      ; 5DD0   02B8 0031
        MVO     R0,     .PSG0.chan_enable       ; 5DD2   0240 01F8
        MVII    #$0001, R0                      ; 5DD4   02B8 0001
        MVO     R0,     .PSG0.noise             ; 5DD6   0240 01F9
        MVII    #$0030, R0                      ; 5DD8   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 5DDA   0240 01FB
        PULR    R7                              ; 5DDC   02B7

L_5DDD:
        PSHR    R5                              ; 5DDD   0275
        MVI     G_017B, R0                      ; 5DDE   0280 017B
        XOR     G_017C, R0                      ; 5DE0   03C0 017C
        BNEQ    L_5E44                          ; 5DE2   020C 0060

        MVI     .PSG0.noise,R0                  ; 5DE4   0280 01F9
        ANDI    #$001F, R0                      ; 5DE6   03B8 001F
        CMPI    #$0001, R0                      ; 5DE8   0378 0001
        BNEQ    L_5E02                          ; 5DEA   020C 0016

        MVI     .PSG0.envelope,R0               ; 5DEC   0280 01FA
        ANDI    #$000F, R0                      ; 5DEE   03B8 000F
        CMPI    #$0008, R0                      ; 5DF0   0378 0008
        BEQ     L_5E02                          ; 5DF2   0204 000E

        MVII    #$0080, R0                      ; 5DF4   02B8 0080
        MVO     R0,     .PSG0.envlp_lo          ; 5DF6   0240 01F3
        MVII    #$0015, R0                      ; 5DF8   02B8 0015
        SUB     G_0167, R0                      ; 5DFA   0300 0167
        MVO     R0,     .PSG0.envlp_hi          ; 5DFC   0240 01F7
        MVII    #$0008, R0                      ; 5DFE   02B8 0008
        MVO     R0,     .PSG0.envelope          ; 5E00   0240 01FA
L_5E02:
        MVI     G_0175, R0                      ; 5E02   0280 0175
        TSTR    R0                              ; 5E04   0080
        BEQ     L_5E15                          ; 5E05   0204 000E

        MVI     .PSG0.chn_b_vol,R0              ; 5E07   0280 01FC
        ANDI    #$003F, R0                      ; 5E09   03B8 003F
        CMPI    #$000F, R0                      ; 5E0B   0378 000F
        BEQ     L_5E44                          ; 5E0D   0204 0035

        MVII    #$005D, R0                      ; 5E0F   02B8 005D
        MVII    #$000A, R4                      ; 5E11   02BC 000A
        B       L_5E3D                          ; 5E13   0200 0028

L_5E15:
        MVI     G_016F, R2                      ; 5E15   0282 016F
        TSTR    R2                              ; 5E17   0092
        BNEQ    L_5E1E                          ; 5E18   020C 0004

        MVO     R2,     .PSG0.chn_b_vol         ; 5E1A   0242 01FC
        B       L_5E44                          ; 5E1C   0200 0026

L_5E1E:
        CLRR    R3                              ; 5E1E   01DB
        MVII    #$0009, R4                      ; 5E1F   02BC 0009
        MVII    #$0001, R0                      ; 5E21   02B8 0001
        NEGR    R0                              ; 5E23   0020
L_5E24:
        INCR    R0                              ; 5E24   0008
        SARC    R2,     1                       ; 5E25   007A
        BNC     L_5E33                          ; 5E26   0209 000B

        INCR    R4                              ; 5E28   000C

        JSR     R5,     .EXEC.76C               ; 5E29   0004 0114 036C

        ADDI    #$0003, R1                      ; 5E2C   02F9 0003
        MVI@    R1,     R1                      ; 5E2E   0289
        CMPR    R1,     R3                      ; 5E2F   014B
        BPL     L_5E24                          ; 5E30   0223 000D

        MOVR    R1,     R3                      ; 5E32   008B
L_5E33:
        TSTR    R2                              ; 5E33   0092
        BNEQ    L_5E24                          ; 5E34   022C 0011

        MOVR    R3,     R0                      ; 5E36   0098
        SWAP    R0,     1                       ; 5E37   0040
        ANDI    #$00FF, R0                      ; 5E38   03B8 00FF
        SLL     R0,     1                       ; 5E3A   0048
        ADDI    #$0064, R0                      ; 5E3B   02F8 0064
L_5E3D:
        MVO     R0,     .PSG0.chn_b_lo          ; 5E3D   0240 01F1
        SWAP    R0,     1                       ; 5E3F   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 5E40   0240 01F5
        MVO     R4,     .PSG0.chn_b_vol         ; 5E42   0244 01FC
L_5E44:
        PULR    R7                              ; 5E44   02B7

L_5E45:
        PSHR    R5                              ; 5E45   0275
        MVII    #$0187, R4                      ; 5E46   02BC 0187
        MVII    #$0190, R5                      ; 5E48   02BD 0190
L_5E4A:
        MVI@    R4,     R0                      ; 5E4A   02A0
        SWAP    R0,     1                       ; 5E4B   0040
        SAR     R0,     2                       ; 5E4C   006C
        SAR     R0,     2                       ; 5E4D   006C
        MVI     G_018F, R3                      ; 5E4E   0283 018F
        TSTR    R3                              ; 5E50   009B
        BNEQ    L_5E54                          ; 5E51   020C 0001

        SAR     R0,     1                       ; 5E53   0068
L_5E54:
        MOVR    R4,     R3                      ; 5E54   00A3
        SDBD                                    ; 5E55   0001
        ADD@    R4,     R0                      ; 5E56   02E0
        MVO@    R0,     R3                      ; 5E57   0258
        SWAP    R0,     1                       ; 5E58   0040
        MOVR    R0,     R2                      ; 5E59   0082
        INCR    R3                              ; 5E5A   000B
        SUB@    R3,     R0                      ; 5E5B   0318
        MOVR    R2,     R1                      ; 5E5C   0091
        ANDI    #$0007, R1                      ; 5E5D   03B9 0007
        MVO@    R1,     R3                      ; 5E5F   0259
        XORR    R1,     R2                      ; 5E60   01CA
        MVO@    R2,     R5                      ; 5E61   026A
        INCR    R5                              ; 5E62   000D
        MVO@    R2,     R5                      ; 5E63   026A
        ADDI    #$0003, R5                      ; 5E64   02FD 0003
        SUBR    R0,     R2                      ; 5E66   0102
        MVO@    R2,     R5                      ; 5E67   026A
        INCR    R5                              ; 5E68   000D
        MVO@    R2,     R5                      ; 5E69   026A
        SUBI    #$0006, R5                      ; 5E6A   033D 0006
        CMPI    #$0196, R5                      ; 5E6C   037D 0196
        BNEQ    L_5E4A                          ; 5E6E   022C 0025

        MVII    #$0003, R5                      ; 5E70   02BD 0003
        MVO     R5,     G_019C                  ; 5E72   0245 019C
        MVII    #$0100, R5                      ; 5E74   02BD 0100
        MVI@    R5,     R0                      ; 5E76   02A8
        MVO@    R0,     R4                      ; 5E77   0260
        MVI@    R5,     R0                      ; 5E78   02A8
        MVO@    R0,     R4                      ; 5E79   0260
        MVII    #$00A1, R0                      ; 5E7A   02B8 00A1
        MVII    #$005E, R1                      ; 5E7C   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5E7E   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E80   0241 0101
L_5E82:
        EIS                                     ; 5E82   0002
        MVI     G_019C, R2                      ; 5E83   0282 019C
        SARC    R2,     2                       ; 5E85   007E
        BNC     L_5E9B                          ; 5E86   0209 0013
        BOV     L_5E82                          ; 5E88   0222 0007

        JSR     R5,     L_5738                  ; 5E8A   0004 0154 0338

        MVII    #$0003, R2                      ; 5E8D   02BA 0003
        MVO     R2,     G_019C                  ; 5E8F   0242 019C
        MVII    #$00D5, R0                      ; 5E91   02B8 00D5
        MVII    #$005E, R1                      ; 5E93   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5E95   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E97   0241 0101
        B       L_5E82                          ; 5E99   0220 0018
L_5E9B:
        BNOV    L_5EA0                          ; 5E9B   020A 0003

        JSR     R5,     L_5738                  ; 5E9D   0004 0154 0338

L_5EA0:
        PULR    R7                              ; 5EA0   02B7

        PSHR    R5                              ; 5EA1   0275
        MVI     G_0190, R4                      ; 5EA2   0284 0190
        TSTR    R4                              ; 5EA4   00A4
        BEQ     L_5EAC                          ; 5EA5   0204 0005

        MVI     G_0193, R4                      ; 5EA7   0284 0193
        TSTR    R4                              ; 5EA9   00A4
        BNEQ    L_5ECA                          ; 5EAA   020C 001E

L_5EAC:
        JSR     R5,     L_5F98                  ; 5EAC   0004 015C 0398

        MVI     G_0189, R0                      ; 5EAF   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5EB1   0240 0030
        MVI     G_018C, R0                      ; 5EB3   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EB5   0240 0031

        JSR     R5,     L_5EFB                  ; 5EB7   0004 015C 02FB

        CLRR    R2                              ; 5EBA   01D2
        SUBI    #$0008, R2                      ; 5EBB   033A 0008

        JSR     R5,     L_5F07                  ; 5EBD   0004 015C 0307
        JSR     R5,     L_5F3A                  ; 5EC0   0004 015C 033A

        TSTR    R2                              ; 5EC3   0092
        BMI     L_5EDF                          ; 5EC4   020B 0019

        MVII    #$0002, R0                      ; 5EC6   02B8 0002
        B       L_5EDF                          ; 5EC8   0200 0015

L_5ECA:
        NEGR    R4                              ; 5ECA   0024

        JSR     R5,     L_5EE7                  ; 5ECB   0004 015C 02E7
        JSR     R5,     L_5F07                  ; 5ECE   0004 015C 0307

        MVII    #$0001, R0                      ; 5ED1   02B8 0001
        B       L_5EDF                          ; 5ED3   0200 000A

        PSHR    R5                              ; 5ED5   0275
        MOVR    R6,     R4                      ; 5ED6   00B4

        JSR     R5,     L_5EE7                  ; 5ED7   0004 015C 02E7
        JSR     R5,     L_5F3A                  ; 5EDA   0004 015C 033A

        MVII    #$0002, R0                      ; 5EDD   02B8 0002
L_5EDF:
        SLL     R2,     2                       ; 5EDF   004E
        XORR    R0,     R2                      ; 5EE0   01C2
        MVO     R2,     G_019C                  ; 5EE1   0242 019C

        JSR     R5,     X_PLAY_NOTE             ; 5EE3   0004 0118 02BD

        PULR    R7                              ; 5EE6   02B7

L_5EE7:
        PSHR    R5                              ; 5EE7   0275
        PSHR    R4                              ; 5EE8   0274

        JSR     R5,     L_5F98                  ; 5EE9   0004 015C 0398

        PULR    R4                              ; 5EEC   02B4
        TSTR    R4                              ; 5EED   00A4
        BGT     L_5EF4                          ; 5EEE   020E 0004

        MVI     G_0189, R0                      ; 5EF0   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5EF2   0240 0030
L_5EF4:
        BMI     L_5EFA                          ; 5EF4   020B 0004

        MVI     G_018C, R0                      ; 5EF6   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EF8   0240 0031
L_5EFA:
        INCR    R7                              ; 5EFA   000F

L_5EFB:
        PSHR    R5                              ; 5EFB   0275
L_5EFC:
        MVO     R0,     .STIC.VIDEN             ; 5EFC   0240 0020
        MVI     G_018D, R0                      ; 5EFE   0280 018D
        MVI     G_018E, R1                      ; 5F00   0281 018E
        MVO     R0,     .ISRVEC.0               ; 5F02   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F04   0241 0101
        PULR    R7                              ; 5F06   02B7

L_5F07:
        PSHR    R5                              ; 5F07   0275
        MVI     G_0190, R0                      ; 5F08   0280 0190
        SWAP    R0,     2                       ; 5F0A   0044
        BEQ     L_5F39                          ; 5F0B   0204 002C
        BPL     L_5F23                          ; 5F0D   0203 0014

        MVII    #$0200, R5                      ; 5F0F   02BD 0200
        MVII    #$0201, R4                      ; 5F11   02BC 0201
        CLRR    R2                              ; 5F13   01D2
L_5F14:
        MVII    #$0013, R3                      ; 5F14   02BB 0013
L_5F16:
        MVI@    R4,     R0                      ; 5F16   02A0
        MVO@    R0,     R5                      ; 5F17   0268
        DECR    R3                              ; 5F18   0013
        BNEQ    L_5F16                          ; 5F19   022C 0004

        MVO@    R2,     R5                      ; 5F1B   026A
        INCR    R4                              ; 5F1C   000C
        CMPI    #$02E6, R4                      ; 5F1D   037C 02E6
        BLT     L_5F14                          ; 5F1F   0225 000C
        B       L_5F39                          ; 5F21   0200 0016

L_5F23:
        MVII    #$0212, R5                      ; 5F23   02BD 0212
        MVII    #$0003, R1                      ; 5F25   02B9 0003
        CLRR    R2                              ; 5F27   01D2
L_5F28:
        MVII    #$0013, R3                      ; 5F28   02BB 0013
L_5F2A:
        MVI@    R5,     R0                      ; 5F2A   02A8
        MVO@    R0,     R5                      ; 5F2B   0268
        SUBR    R1,     R5                      ; 5F2C   010D
        DECR    R3                              ; 5F2D   0013
        BNEQ    L_5F2A                          ; 5F2E   022C 0005

        INCR    R5                              ; 5F30   000D
        MVO@    R2,     R5                      ; 5F31   026A
        ADDI    #$0025, R5                      ; 5F32   02FD 0025
        CMPI    #$02F0, R5                      ; 5F34   037D 02F0
        BLT     L_5F28                          ; 5F36   0225 000F

        INCR    R2                              ; 5F38   000A
L_5F39:
        PULR    R7                              ; 5F39   02B7

L_5F3A:
        PSHR    R5                              ; 5F3A   0275
        MVI     G_0193, R0                      ; 5F3B   0280 0193
        SWAP    R0,     2                       ; 5F3D   0044
        BEQ     L_5F97                          ; 5F3E   0204 0057
        BMI     L_5F8B                          ; 5F40   020B 0049

        MVII    #$02DC, R5                      ; 5F42   02BD 02DC
        MVII    #$0214, R4                      ; 5F44   02BC 0214
        MVII    #$0200, R2                      ; 5F46   02BA 0200
        MVII    #$0014, R1                      ; 5F48   02B9 0014
        MVII    #$000A, R0                      ; 5F4A   02B8 000A
L_5F4C:
        PSHR    R0                              ; 5F4C   0270
        MVII    #$0004, R3                      ; 5F4D   02BB 0004
L_5F4F:
        MVI@    R4,     R0                      ; 5F4F   02A0
        MVO@    R0,     R5                      ; 5F50   0268
        MVI@    R4,     R0                      ; 5F51   02A0
        MVO@    R0,     R5                      ; 5F52   0268
        MVI@    R4,     R0                      ; 5F53   02A0
        MVO@    R0,     R5                      ; 5F54   0268
        MVI@    R4,     R0                      ; 5F55   02A0
        MVO@    R0,     R5                      ; 5F56   0268
        MVI@    R4,     R0                      ; 5F57   02A0
        MVO@    R0,     R5                      ; 5F58   0268
        DECR    R3                              ; 5F59   0013
        BNEQ    L_5F4F                          ; 5F5A   022C 000C

        SUBR    R1,     R4                      ; 5F5C   010C
        SUBR    R1,     R5                      ; 5F5D   010D
        XORR    R2,     R5                      ; 5F5E   01D5
        XORR    R5,     R2                      ; 5F5F   01EA
        XORR    R2,     R5                      ; 5F60   01D5
        MVII    #$0004, R3                      ; 5F61   02BB 0004
L_5F63:
        MVI@    R5,     R0                      ; 5F63   02A8
        MVO@    R0,     R4                      ; 5F64   0260
        MVI@    R5,     R0                      ; 5F65   02A8
        MVO@    R0,     R4                      ; 5F66   0260
        MVI@    R5,     R0                      ; 5F67   02A8
        MVO@    R0,     R4                      ; 5F68   0260
        MVI@    R5,     R0                      ; 5F69   02A8
        MVO@    R0,     R4                      ; 5F6A   0260
        MVI@    R5,     R0                      ; 5F6B   02A8
        MVO@    R0,     R4                      ; 5F6C   0260
        DECR    R3                              ; 5F6D   0013
        BNEQ    L_5F63                          ; 5F6E   022C 000C

        SUBR    R1,     R5                      ; 5F70   010D
        PULR    R0                              ; 5F71   02B0
        DECR    R0                              ; 5F72   0010
        BNEQ    L_5F4C                          ; 5F73   022C 0028

        XORR    R2,     R5                      ; 5F75   01D5
        XORR    R5,     R2                      ; 5F76   01EA
        XORR    R2,     R5                      ; 5F77   01D5
        MVII    #$0004, R3                      ; 5F78   02BB 0004
L_5F7A:
        MVI@    R5,     R0                      ; 5F7A   02A8
        MVO@    R0,     R4                      ; 5F7B   0260
        MVI@    R5,     R0                      ; 5F7C   02A8
        MVO@    R0,     R4                      ; 5F7D   0260
        MVI@    R5,     R0                      ; 5F7E   02A8
        MVO@    R0,     R4                      ; 5F7F   0260
        MVI@    R5,     R0                      ; 5F80   02A8
        MVO@    R0,     R4                      ; 5F81   0260
        MVI@    R5,     R0                      ; 5F82   02A8
        MVO@    R0,     R4                      ; 5F83   0260
        DECR    R3                              ; 5F84   0013
        BNEQ    L_5F7A                          ; 5F85   022C 000C

        MVII    #$0003, R2                      ; 5F87   02BA 0003
        B       L_5F97                          ; 5F89   0200 000C

L_5F8B:
        MVII    #$0200, R5                      ; 5F8B   02BD 0200
        MVII    #$0214, R4                      ; 5F8D   02BC 0214
L_5F8F:
        MVI@    R4,     R0                      ; 5F8F   02A0
        MVO@    R0,     R5                      ; 5F90   0268
        CMPI    #$02DC, R5                      ; 5F91   037D 02DC
        BNEQ    L_5F8F                          ; 5F93   022C 0005

        MVII    #$0002, R2                      ; 5F95   02BA 0002
L_5F97:
        PULR    R7                              ; 5F97   02B7

L_5F98:
        PSHR    R5                              ; 5F98   0275
        MVII    #$031D, R2                      ; 5F99   02BA 031D
        CLRR    R3                              ; 5F9B   01DB
L_5F9C:
        MVII    #$0196, R5                      ; 5F9C   02BD 0196
        MVI@    R2,     R0                      ; 5F9E   0290
        ADDI    #$0002, R2                      ; 5F9F   02FA 0002
        SLL     R0,     1                       ; 5FA1   0048
        BPL     L_5FA6                          ; 5FA2   0203 0002

        MVII    #$0190, R5                      ; 5FA4   02BD 0190
L_5FA6:
        TSTR    R4                              ; 5FA6   00A4
        BLE     L_5FAD                          ; 5FA7   0206 0004

        ADDI    #$0003, R5                      ; 5FA9   02FD 0003
        B       L_5FBB                          ; 5FAB   0200 000E

L_5FAD:
        MVI@    R3,     R0                      ; 5FAD   0298
        MOVR    R0,     R1                      ; 5FAE   0081
        ANDI    #$00FF, R1                      ; 5FAF   03B9 00FF
        XORR    R1,     R0                      ; 5FB1   01C8
        ADD@    R5,     R1                      ; 5FB2   02E9
        ANDI    #$00FF, R1                      ; 5FB3   03B9 00FF
        XORR    R1,     R0                      ; 5FB5   01C8
        MVO@    R0,     R3                      ; 5FB6   0258
        MVI@    R2,     R0                      ; 5FB7   0290
        SDBD                                    ; 5FB8   0001
        ADD@    R5,     R0                      ; 5FB9   02E8
        MVO@    R0,     R2                      ; 5FBA   0250
L_5FBB:
        INCR    R2                              ; 5FBB   000A
        TSTR    R4                              ; 5FBC   00A4
        BMI     L_5FD1                          ; 5FBD   020B 0012

        XORI    #$0008, R3                      ; 5FBF   03FB 0008
        MVI@    R3,     R0                      ; 5FC1   0298
        MOVR    R0,     R1                      ; 5FC2   0081
        ANDI    #$007F, R1                      ; 5FC3   03B9 007F
        XORR    R1,     R0                      ; 5FC5   01C8
        ADD@    R5,     R1                      ; 5FC6   02E9
        ANDI    #$007F, R1                      ; 5FC7   03B9 007F
        XORR    R1,     R0                      ; 5FC9   01C8
        MVO@    R0,     R3                      ; 5FCA   0258
        XORI    #$0008, R3                      ; 5FCB   03FB 0008
        MVI@    R2,     R0                      ; 5FCD   0290
        SDBD                                    ; 5FCE   0001
        ADD@    R5,     R0                      ; 5FCF   02E8
        MVO@    R0,     R2                      ; 5FD0   0250
L_5FD1:
        ADDI    #$0005, R2                      ; 5FD1   02FA 0005
        INCR    R3                              ; 5FD3   000B
        CMPI    #$0008, R3                      ; 5FD4   037B 0008
        BNEQ    L_5F9C                          ; 5FD6   022C 003B
        PULR    R7                              ; 5FD8   02B7

L_5FD9:
        PSHR    R5                              ; 5FD9   0275

        JSR     R5,     .EXEC.7C1               ; 5FDA   0004 0114 03C1

        MVII    #$0315, R1                      ; 5FDD   02B9 0315
L_5FDF:
        ADDI    #$0008, R1                      ; 5FDF   02F9 0008
        CMPI    #$035D, R1                      ; 5FE1   0379 035D
        BGE     L_5FFF                          ; 5FE3   020D 001A

        MVII    #$0054, R2                      ; 5FE5   02BA 0054
        SUB     G_0189, R2                      ; 5FE7   0302 0189
        SWAP    R2,     1                       ; 5FE9   0042
        ADDI    #$0034, R2                      ; 5FEA   02FA 0034
        SUB     G_018C, R2                      ; 5FEC   0302 018C
        SDBD                                    ; 5FEE   0001
        MVII    #$5434, R4                      ; 5FEF   02BC 0034 0054

        JSR     R5,     .EXEC.6F7               ; 5FF2   0004 0114 02F7

        BC      L_5FDF                          ; 5FF5   0221 0017

        JSR     R5,     .EXEC.766               ; 5FF7   0004 0114 0366
        JSR     R5,     L_5662                  ; 5FFA   0004 0154 0262

        B       L_5FDF                          ; 5FFD   0220 001F
L_5FFF:
        PULR    R7                              ; 5FFF   02B7

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $505C       <entry>
;;  $50A0       $509A  
;;  $50A5       $50A2  
;;  $50BE       $509C  
;;  $50BF       $5069  
;;  $5141       $50FF  
;;  $515B       $5163  
;;  $518D       $513F  
;;  $51B8       <entry>
;;  $51CD       $51BC  
;;  $51CE       $51C7  
;;  $5216       $51F0   $5201  
;;  $523A       $5237  
;;  $5258       $5255  
;;  $525C       $5247  
;;  $525F       $5234  
;;  $5265       $525D  
;;  $5274       $526E  
;;  $5296       $5285  
;;  $52A3       $527D   $5288   $5294  
;;  $52AB       $52B8  
;;  $52C0       $529B   $52A1  
;;  $52C1       $51D2   $51DF   $51E5  
;;  $52D0       $5260   $542D  
;;  $52F1       $52EB  
;;  $52F4       $52E9  
;;  $52F8       $52E7  
;;  $52F9       $52EF   $52F2   $52F6  
;;  $531A       $51C4  
;;  $5332       $532A  
;;  $5358       $5348  
;;  $5393       $5335  
;;  $539C       $5396  
;;  $53B0       $53AA  
;;  $53C5       $531E   $5323   $533B   $5342   $5356  
;;  $53C6       $51C1  
;;  $53D2       $53CA  
;;  $53E3       $53DF  
;;  $5407       $5402  
;;  $5421       $541E  
;;  $5432       $5428  
;;  $5442       $53D5  
;;  $546A       $5464  
;;  $54B0       $53D0   $53E7   $53ED   $5445   $5451   $545E   $546E  
;;  $54BB       $54B5  
;;  $54BC       $5118   $5913  
;;  $54DD       $54BE  
;;  $54EE       $591D  
;;  $5517       $54F3  
;;  $5527       $5515  
;;  $552F       $551C   $5523  
;;  $553D       $553A  
;;  $5548       $5545  
;;  $5549       $5542  
;;  $5550       $55AC  
;;  $557C       $5553   $5559  
;;  $5595       $5592  
;;  $559B       $557F   $558C   $5590  
;;  $559F       <entry>
;;  $55B0       $55AA  
;;  $55B3       $55A3  
;;  $55B4       $55B0  
;;  $55DD       $55B7   $55BD  
;;  $55DE       $5555   $55B9  
;;  $55EE       $55E4   $55EB  
;;  $55EF       $5138  
;;  $55FF       $55F3  
;;  $560D       $5601  
;;  $562E       $560F  
;;  $5635       $5630  
;;  $5642       $5637  
;;  $5661       $5621   $5644   $5649  
;;  $5662       $569C   $56CB   $56D4   $5776   $5FFA  
;;  $567D       $5677  
;;  $5684       $5680  
;;  $5692       $566D  
;;  $5695       $56C7  
;;  $56AB       $56A5  
;;  $56B8       $56B5  
;;  $56BC       $5699   $56AF  
;;  $56CB       $56C5  
;;  $56CE       $56C1  
;;  $56CF       $585E   $58B6   $5A2E  
;;  $56D3       $56D8  
;;  $56DC       $51E1   $5337   $53E9   $546A   $57BD   $57E6  
;;  $56E0       $56E9  
;;  $56EB       $54E6   $54E8  
;;  $56EC       $56E3  
;;  $56EE       $564D   $585B  
;;  $56F8       $58BC   $5919  
;;  $56FB       $56F6  
;;  $56FF       $570C  
;;  $5706       $5703  
;;  $5712       $512B   $5152   $574D   $58FA  
;;  $571D       $5735  
;;  $5727       $5722  
;;  $5732       $5725  
;;  $5738       $5E8A   $5E9D  
;;  $5779       $5774  
;;  $5784       $5781  
;;  $57A7       $5788   $578E   $5795   $579D   $57A4  
;;  $57B8       $57AE   $57B4  
;;  $57DE       $57DA  
;;  $57FE       $57B6   $57BB   $57C1  
;;  $5802       $5761   $576F  
;;  $5803       $581F  
;;  $581C       $5807   $5816  
;;  $5822       $57FF   $5809   $5819  
;;  $5832       $582C  
;;  $584B       $56A7  
;;  $5865       $588E  
;;  $5884       $587C  
;;  $58A7       $58A2  
;;  $58AA       $58A5  
;;  $58B4       $5850  
;;  $58B5       $5904  
;;  $58D4       $58CE  
;;  $5916       $5902  
;;  $5926       $590A  
;;  $5927       $50F9   $565E   $56B9   $57A7   $58AA   $58C8  
;;  $593C       $5945   $594E  
;;  $5947       $593D  
;;  $5950       $5940   $5949  
;;  $5966       $595B  
;;  $5977       $596B  
;;  $5980       $596D   $5975   $597C  
;;  $5985       $598D  
;;  $598F       $5988  
;;  $59AE       $59A3   $59A9  
;;  $59C1       $59AF  
;;  $59F2       $59EB  
;;  $59FA       $592F   $59CB   $59D8   $59F0  
;;  $59FB       $5963   $5A64  
;;  $5A0E       $59FD  
;;  $5A1E       $5A16  
;;  $5A26       $58D0  
;;  $5A71       $5A2A  
;;  $5A72       $58E3   $59AB  
;;  $5A7C       $5A78  
;;  $5A8B       $5A89  
;;  $5A8D       $58B1   $5A83  
;;  $5AEA       $5AE8  
;;  $5B51       $5B4F  
;;  $5BD5       $5BD3  
;;  $5BD6       $5BD4  
;;  $5BF0       $5BEE  
;;  $5CA0       $5CA0  
;;  $5CA1       $5CA1  
;;  $5CBF       $5CBD  
;;  $5CC4       $5CC2  
;;  $5D83       $57C3   $5824  
;;  $5D94       $5896  
;;  $5DA5       $5611  
;;  $5DBC       $5147   $58BF   $58EE  
;;  $5DC0       $5DBA  
;;  $5DDD       $51CA  
;;  $5E02       $5DEA   $5DF2  
;;  $5E15       $5E05  
;;  $5E1E       $5E18  
;;  $5E24       $5E30   $5E34  
;;  $5E33       $5E26  
;;  $5E3D       $5E13  
;;  $5E44       $5DE2   $5E0D   $5E1C  
;;  $5E45       <entry>
;;  $5E4A       $5E6E  
;;  $5E54       $5E51  
;;  $5E82       $5E88   $5E99  
;;  $5E9B       $5E86  
;;  $5EA0       $5E9B  
;;  $5EAC       $5EA5  
;;  $5ECA       $5EAA  
;;  $5EDF       $5EC4   $5EC8   $5ED3  
;;  $5EE7       $5ECB   $5ED7  
;;  $5EF4       $5EEE  
;;  $5EFA       $5EF4  
;;  $5EFB       $5EB7  
;;  $5EFC       $5EFA  
;;  $5F07       $5EBD   $5ECE  
;;  $5F14       $5F1F  
;;  $5F16       $5F19  
;;  $5F23       $5F0D  
;;  $5F28       $5F36  
;;  $5F2A       $5F2E  
;;  $5F39       $5F0B   $5F21  
;;  $5F3A       $5EC0   $5EDA  
;;  $5F4C       $5F73  
;;  $5F4F       $5F5A  
;;  $5F63       $5F6E  
;;  $5F7A       $5F85  
;;  $5F8B       $5F40  
;;  $5F8F       $5F93  
;;  $5F97       $5F3E   $5F89  
;;  $5F98       $5EAC   $5EE9  
;;  $5F9C       $5FD6  
;;  $5FA6       $5FA2  
;;  $5FAD       $5FA7  
;;  $5FBB       $5FAB  
;;  $5FD1       $5FBD  
;;  $5FD9       <entry>
;;  $5FDF       $5FF5   $5FFD  
;;  $5FFF       $5FE3  
;; ======================================================================== ;;
